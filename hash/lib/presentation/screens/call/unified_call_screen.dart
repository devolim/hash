import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/services/livekit_service.dart';
import '../../../domain/models/call_state.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';
import '../../providers/call_providers.dart';
import '../../widgets/common/avatar.dart';
import '../../widgets/call/glass_call_controls.dart';
import '../../widgets/call/glass_call_status_bar.dart';
import '../../widgets/call/speaking_ring_indicator.dart';

/// 4 états possibles du layout vidéo
enum _VideoLayoutState {
  bothOn,      // Remote plein écran, local PiP vidéo (déplaçable)
  localOnly,   // Local plein écran, remote avatar PiP (déplaçable)
  remoteOnly,  // Remote plein écran, petit avatar local (statique, coin)
  bothOff,     // Avatar remote centré, pas de PiP
}

class UnifiedCallScreen extends ConsumerStatefulWidget {
  final String contactId;
  final CallType callType;

  const UnifiedCallScreen({
    super.key,
    required this.contactId,
    required this.callType,
  });

  @override
  ConsumerState<UnifiedCallScreen> createState() => _UnifiedCallScreenState();
}

class _UnifiedCallScreenState extends ConsumerState<UnifiedCallScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  // Animation controllers
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late AnimationController _controlsFadeController;
  late Animation<Offset> _topBarSlideAnimation;
  late Animation<Offset> _bottomBarSlideAnimation;

  // Camera flip animation
  late AnimationController _cameraFlipController;

  // PiP spring snap controllers
  late AnimationController _pipSnapXController;
  late AnimationController _pipSnapYController;

  // UI state
  bool _showControls = true;
  Timer? _controlsHideTimer;

  // PiP state
  static const double _pipWidth = 100.0;
  static const double _pipHeight = 140.0;
  static const double _pipAvatarSize = 80.0;
  static const double _pipMargin = 12.0;
  Offset? _pipOffset;
  bool _isPipDragging = false;

  // Video swap: false = remote fullscreen, true = local fullscreen
  bool _isLocalFullscreen = false;

  // Track previous status for ended detection
  CallStatus? _previousStatus;

  // Estimated bar heights for PiP constraints
  static const double _topBarHeight = 100.0;
  static const double _bottomBarHeight = 130.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Dismiss any keyboard that might be open from the chat screen below
    FocusManager.instance.primaryFocus?.unfocus();

    // Pulse animation for avatar during ringing
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Controls fade + slide for auto-hide in video connected
    _controlsFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      value: 1.0,
    );

    // Top bar slides up when hiding
    _topBarSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controlsFadeController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));

    // Bottom bar slides down when hiding
    _bottomBarSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controlsFadeController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));

    // Camera flip
    _cameraFlipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // PiP spring snap (will be driven by SpringSimulation)
    _pipSnapXController = AnimationController(vsync: this);
    _pipSnapYController = AnimationController(vsync: this);

    _pipSnapXController.addListener(_onPipSnapUpdate);
    _pipSnapYController.addListener(_onPipSnapUpdate);

    // Mark that we're on the call screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(isOnActiveCallScreenProvider.notifier).state = true;

        // Guard: if idle, pop immediately
        final callState = ref.read(callStateProvider);
        if (callState.status == CallStatus.idle) {
          if (context.mounted) context.pop();
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Notifier le distant de notre état background/foreground
    ref.read(callStateProvider.notifier).notifyAppLifecycleState(state);
    // When returning from background, dismiss any keyboard that the chat
    // screen below might have restored focus on.  The OS may restore focus
    // on the previous TextField after our first unfocus, so we fire multiple
    // dismissals: immediately, after the next frame, and after a short delay.
    if (state == AppLifecycleState.resumed) {
      FocusManager.instance.primaryFocus?.unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Capture notifier ref before any cleanup — more reliable
    StateController<bool>? callScreenNotifier;
    try {
      callScreenNotifier = ref.read(isOnActiveCallScreenProvider.notifier);
    } catch (e) {
      debugPrint('[UnifiedCallScreen] Reading call screen notifier failed: $e');
    }

    _pulseController.dispose();
    _controlsFadeController.dispose();
    _cameraFlipController.dispose();
    _pipSnapXController.removeListener(_onPipSnapUpdate);
    _pipSnapYController.removeListener(_onPipSnapUpdate);
    _pipSnapXController.dispose();
    _pipSnapYController.dispose();
    _controlsHideTimer?.cancel();

    // Set immediately if possible
    try {
      callScreenNotifier?.state = false;
    } catch (_) {
      // Fallback: schedule for next frame
      if (callScreenNotifier != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          try {
            callScreenNotifier!.state = false;
          } catch (e) {
            debugPrint('[UnifiedCallScreen] Deferred call screen state reset failed: $e');
          }
        });
      }
    }
    super.dispose();
  }

  // ============ PiP spring snap ============

  double _pipSnapTargetX = 0;
  double _pipSnapTargetY = 0;
  double _pipSnapStartX = 0;
  double _pipSnapStartY = 0;

  void _onPipSnapUpdate() {
    if (!mounted) return;
    setState(() {
      _pipOffset = Offset(
        lerpDouble(_pipSnapStartX, _pipSnapTargetX, _pipSnapXController.value)!,
        lerpDouble(_pipSnapStartY, _pipSnapTargetY, _pipSnapYController.value)!,
      );
    });
  }

  void _springSnapPip() {
    final screenSize = MediaQuery.of(context).size;
    final safeTop = MediaQuery.of(context).padding.top + _topBarHeight + _pipMargin;
    final safeBottom = screenSize.height - _bottomBarHeight - _pipHeight - _pipMargin;
    final offset = _pipOffset ?? _getDefaultPipOffset();

    // Snap to nearest horizontal edge
    final double targetX;
    if (offset.dx + _pipWidth / 2 < screenSize.width / 2) {
      targetX = _pipMargin;
    } else {
      targetX = screenSize.width - _pipWidth - _pipMargin;
    }
    final targetY = offset.dy.clamp(safeTop, safeBottom);

    _pipSnapStartX = offset.dx;
    _pipSnapStartY = offset.dy;
    _pipSnapTargetX = targetX;
    _pipSnapTargetY = targetY;

    const spring = SpringDescription(mass: 1.0, stiffness: 300.0, damping: 25.0);

    _pipSnapXController.animateWith(
      SpringSimulation(spring, 0.0, 1.0, 0.0),
    );
    _pipSnapYController.animateWith(
      SpringSimulation(spring, 0.0, 1.0, 0.0),
    );
  }

  // ============ Controls ============

  void _startControlsHideTimer() {
    _controlsHideTimer?.cancel();
    _controlsHideTimer = Timer(const Duration(seconds: 5), () {
      if (mounted && !_isPipDragging) {
        _controlsFadeController.reverse();
        setState(() => _showControls = false);
      }
    });
  }

  void _toggleControls() {
    setState(() => _showControls = !_showControls);
    if (_showControls) {
      _controlsFadeController.forward();
      _startControlsHideTimer();
    } else {
      _controlsFadeController.reverse();
    }
  }

  void _navigateToChat() {
    if (!mounted || !context.mounted) return;
    final contactId = widget.contactId;
    context.go('/home');
    context.push('/chat/$contactId', extra: 'fromCall');
  }

  void _showP2PFailedDialog() {
    if (!mounted || !context.mounted) return;
    final isFr = Localizations.localeOf(context).languageCode == 'fr';
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.wifi_off_rounded, color: Color(0xFFFFAB00), size: 22),
            const SizedBox(width: 10),
            Text(
              isFr ? 'Connexion impossible' : 'Connection failed',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        content: Text(
          isFr
              ? 'Ton réseau bloque les connexions directes (P2P).\n\nEssaie de :\n• Passer en 4G / données mobiles\n• Te connecter à un autre WiFi\n• Désactiver ton VPN'
              : 'Your network is blocking direct (P2P) connections.\n\nTry:\n• Switching to 4G / mobile data\n• Connecting to a different WiFi\n• Disabling your VPN',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.75),
            fontSize: 14,
            height: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _navigateToChat();
            },
            child: Text(
              isFr ? 'Compris' : 'Got it',
              style: const TextStyle(
                color: Color(0xFFFFAB00),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Offset _getDefaultPipOffset() {
    final size = MediaQuery.of(context).size;
    final safeTop = MediaQuery.of(context).padding.top + _topBarHeight + _pipMargin;
    return Offset(size.width - _pipWidth - _pipMargin, safeTop);
  }

  void _onPipDoubleTap() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isLocalFullscreen = !_isLocalFullscreen;
    });
  }

  /// Camera flip animation
  Future<void> _flipCamera() async {
    ref.read(callStateProvider.notifier).switchCamera();
    await _cameraFlipController.forward(from: 0);
    _cameraFlipController.reset();
  }

  // ============ Layout state ============

  _VideoLayoutState _getCurrentLayout(CallState callState) {
    final isConnected = callState.status == CallStatus.connected ||
        callState.status == CallStatus.reconnecting;
    if (!isConnected) return _VideoLayoutState.bothOff;

    final localOn = !callState.isCameraOff;
    // Treat remote video as off immediately when they go to background,
    // even if the WebRTC track hasn't been muted yet (takes a few seconds)
    final remoteOn = !callState.isRemoteCameraOff && !callState.isRemoteInBackground;

    if (localOn && remoteOn) return _VideoLayoutState.bothOn;
    if (localOn && !remoteOn) return _VideoLayoutState.localOnly;
    if (!localOn && remoteOn) return _VideoLayoutState.remoteOnly;
    return _VideoLayoutState.bothOff;
  }

  @override
  Widget build(BuildContext context) {
    final callState = ref.watch(callStateProvider);
    final livekitService = ref.watch(livekitServiceProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final contact = callState.remoteContact;
    final status = callState.status;
    final isVideoCall = callState.callType == CallType.video;
    final isConnected =
        status == CallStatus.connected || status == CallStatus.reconnecting;
    final isVideoConnected = isConnected && isVideoCall;
    final layout = _getCurrentLayout(callState);

    // Detect transition to ended → navigate to chat (or PIN in bypass mode)
    if (status == CallStatus.ended && _previousStatus != CallStatus.ended) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // SECURITY: Check isAppLockedProvider, NOT callBypassProvider.
        // During bypass, PIN is never entered so isAppLocked stays true.
        // callBypassProvider gets cleared in _endCall() before this callback
        // runs, which would cause a navigation to chat without PIN.
        final isLocked = ref.read(isAppLockedProvider);
        if (isLocked) {
          // App is locked — _endCall() already set callEndedDuringBypassProvider,
          // HashApp listener will navigate to PIN screen
          return;
        }
        if (callState.endReason == CallEndReason.p2pFailed) {
          _showP2PFailedDialog();
        } else {
          _navigateToChat();
        }
      });
    }

    _previousStatus = status;

    // Auto-hide controls only in video connected
    if (isVideoConnected && _showControls && _controlsHideTimer == null) {
      _startControlsHideTimer();
    }

    // Stop pulse when connected
    if (isConnected && _pulseController.isAnimating) {
      _pulseController.stop();
      _pulseController.reset();
    } else if (!isConnected &&
        status != CallStatus.ended &&
        status != CallStatus.idle &&
        !_pulseController.isAnimating) {
      _pulseController.repeat(reverse: true);
    }

    final cameraEnabled = isConnected;
    final barsVisible = isVideoConnected ? _showControls : true;

    // Whether the background has video (need scrims)
    final hasVideoBackground = layout == _VideoLayoutState.bothOn ||
        layout == _VideoLayoutState.localOnly ||
        layout == _VideoLayoutState.remoteOnly ||
        (isVideoCall && !isConnected);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: Stack(
        children: [
          // Layer 0: Background with crossfade
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            // Deduplicate children when rapid layout changes cause the
            // outgoing and incoming widgets to share the same key.
            layoutBuilder: (currentChild, previousChildren) {
              final filtered = previousChildren
                  .where((c) => c.key != currentChild?.key)
                  .toList();
              return Stack(
                alignment: Alignment.center,
                children: [
                  ...filtered,
                  if (currentChild != null) currentChild,
                ],
              );
            },
            child: _buildBackground(
              key: ValueKey('bg_${layout.name}_$_isLocalFullscreen'),
              callState: callState,
              livekitService: livekitService,
              layout: layout,
              isVideoCall: isVideoCall,
              isConnected: isConnected,
              isDark: isDark,
              contact: contact,
            ),
          ),

          // Tap to toggle bars
          if (isVideoConnected)
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _toggleControls,
              ),
            ),

          // Layer 1: Gradient scrim
          if (hasVideoBackground)
            Positioned.fill(
              child: IgnorePointer(
                child: FadeTransition(
                  opacity: _controlsFadeController,
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Layer 2: Top bar glass
          if (status != CallStatus.ended && status != CallStatus.idle)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SlideTransition(
                position: _topBarSlideAnimation,
                child: FadeTransition(
                  opacity: _controlsFadeController,
                  child: IgnorePointer(
                    ignoring: !barsVisible,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: isVideoConnected ? _startControlsHideTimer : null,
                      child: GlassCallStatusBar(
                        status: status,
                        contactName: contact?.displayName ?? 'Contact',
                        isCameraOff: callState.isCameraOff,
                        isRemoteCameraOff: callState.isRemoteCameraOff,
                        isSpeakerOn: callState.isSpeakerOn,
                        connectionQuality: callState.connectionQuality,
                        onMinimize: () {
                          _startControlsHideTimer();
                          ref.read(isOnActiveCallScreenProvider.notifier).state = false;
                          final isBypass = ref.read(callBypassProvider);
                          if (isBypass) {
                            // En mode bypass, retourner au PIN au lieu du HomeScreen
                            context.go(AppRoutes.pinEntry);
                          } else if (context.canPop()) {
                            context.pop();
                          }
                        },
                        onFlipCamera: isVideoConnected && !callState.isCameraOff
                            ? () {
                                _startControlsHideTimer();
                                _flipCamera();
                              }
                            : null,
                        onToggleSpeaker: () {
                          _startControlsHideTimer();
                          ref.read(callStateProvider.notifier).toggleSpeaker();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Layer 3: Reconnection overlay (blur)
          if (status == CallStatus.reconnecting)
            _buildReconnectionOverlay(l10n),

          // Layer 4: PiP
          _buildPipLayer(callState, livekitService, layout, isVideoConnected),

          // Layer 5: Bottom controls glass
          if (status != CallStatus.ended && status != CallStatus.idle)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SlideTransition(
                position: _bottomBarSlideAnimation,
                child: FadeTransition(
                  opacity: _controlsFadeController,
                  child: IgnorePointer(
                    ignoring: !barsVisible,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: isVideoConnected ? _startControlsHideTimer : null,
                      child: GlassCallControls(
                        isMicMuted: callState.isMicMuted,
                        isCameraOff: callState.isCameraOff,
                        isCameraEnabled: cameraEnabled,
                        isConnected: isConnected,
                        onToggleMic: () {
                          _startControlsHideTimer();
                          ref
                              .read(callStateProvider.notifier)
                              .toggleMicrophone();
                        },
                        onToggleCamera: cameraEnabled
                            ? () {
                                _startControlsHideTimer();
                                ref
                                    .read(callStateProvider.notifier)
                                    .toggleCamera();
                              }
                            : null,
                        onHangUp: () {
                          _startControlsHideTimer();
                          ref.read(callStateProvider.notifier).hangUp();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
    );
  }

  // ============ RECONNECTION OVERLAY ============

  Widget _buildReconnectionOverlay(AppLocalizations l10n) {
    final callState = ref.watch(callStateProvider);
    final remaining = callState.reconnectSecondsRemaining;

    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 250),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            color: Colors.black.withValues(alpha: 0.4),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor:
                          AlwaysStoppedAnimation(AppColors.accentPrimary),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    remaining != null && remaining > 0
                        ? '${l10n.callReconnecting} ${remaining}s'
                        : l10n.callReconnecting,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============ BACKGROUND ============

  Widget _buildBackground({
    Key? key,
    required CallState callState,
    required LiveKitService livekitService,
    required _VideoLayoutState layout,
    required bool isVideoCall,
    required bool isConnected,
    required bool isDark,
    required dynamic contact,
  }) {
    final isFrontCamera = callState.cameraPosition == CameraPosition.front;

    switch (layout) {
      case _VideoLayoutState.bothOn:
        // Remote plein écran (ou local si swapped)
        if (_isLocalFullscreen) {
          return _buildVideoTrackWithFlip(
            key: key,
            track: livekitService.getLocalVideoTrack(),
            mirror: isFrontCamera,
          );
        }
        return _buildVideoTrack(key: key, track: livekitService.getRemoteVideoTrack());

      case _VideoLayoutState.localOnly:
        // Local plein écran (miroir uniquement en caméra frontale)
        return _buildVideoTrackWithFlip(
          key: key,
          track: livekitService.getLocalVideoTrack(),
          mirror: isFrontCamera,
        );

      case _VideoLayoutState.remoteOnly:
        // Remote plein écran
        return _buildVideoTrack(key: key, track: livekitService.getRemoteVideoTrack());

      case _VideoLayoutState.bothOff:
        if (isVideoCall && !isConnected) {
          // Preview caméra locale avant connexion
          return _buildLocalCameraPreview(key: key, livekitService: livekitService, isDark: isDark);
        }
        // Avatar centré avec SpeakingRingIndicator
        return _buildAudioBackground(key: key, callState: callState, isDark: isDark, contact: contact);
    }
  }

  Widget _buildVideoTrack({Key? key, lk.VideoTrack? track, bool mirror = false}) {
    if (track == null) {
      return Container(
        key: key,
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.accentPrimary,
          ),
        ),
      );
    }

    return SizedBox.expand(
      key: key,
      child: IgnorePointer(
        child: lk.VideoTrackRenderer(
          track,
          fit: lk.VideoViewFit.cover,
          mirrorMode: mirror
              ? lk.VideoViewMirrorMode.mirror
              : lk.VideoViewMirrorMode.off,
        ),
      ),
    );
  }

  Widget _buildVideoTrackWithFlip({Key? key, lk.VideoTrack? track, bool mirror = false}) {
    if (track == null) {
      return Container(
        key: key,
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.accentPrimary,
          ),
        ),
      );
    }

    return AnimatedBuilder(
      key: key,
      animation: _cameraFlipController,
      builder: (context, child) {
        final angle = _cameraFlipController.value * pi;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          child: child,
        );
      },
      child: SizedBox.expand(
        child: IgnorePointer(
          child: lk.VideoTrackRenderer(
            track,
            fit: lk.VideoViewFit.cover,
            mirrorMode: mirror
                ? lk.VideoViewMirrorMode.mirror
                : lk.VideoViewMirrorMode.off,
          ),
        ),
      ),
    );
  }

  Widget _buildLocalCameraPreview({Key? key, required LiveKitService livekitService, required bool isDark}) {
    final localTrack = livekitService.getLocalVideoTrack();

    if (localTrack == null) {
      return Container(
        key: key,
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.accentPrimary,
          ),
        ),
      );
    }

    final callState = ref.read(callStateProvider);
    final isFrontCamera = callState.cameraPosition == CameraPosition.front;

    return SizedBox.expand(
      key: key,
      child: IgnorePointer(
        child: lk.VideoTrackRenderer(
          localTrack,
          fit: lk.VideoViewFit.cover,
          mirrorMode: isFrontCamera
              ? lk.VideoViewMirrorMode.mirror
              : lk.VideoViewMirrorMode.off,
        ),
      ),
    );
  }

  Widget _buildAudioBackground({Key? key, required CallState callState, required bool isDark, required dynamic contact}) {
    final isRinging = callState.status == CallStatus.ringing ||
        callState.status == CallStatus.initiating ||
        callState.status == CallStatus.connecting;
    final isConnected = callState.status == CallStatus.connected ||
        callState.status == CallStatus.reconnecting;
    final isPaused = isConnected && callState.isRemoteInBackground;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      key: key,
      width: double.infinity,
      height: double.infinity,
      color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      child: Center(
        child: isRinging
            ? AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _pulseAnimation.value,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentPrimary
                                .withValues(alpha: 0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(
                          color: AppColors.accentPrimary
                              .withValues(alpha: 0.5),
                          width: 3,
                        ),
                      ),
                      child: Avatar(
                        name: contact?.displayName ?? 'Contact',
                        imagePath: contact?.avatarPath,
                        size: 160,
                      ),
                    ),
                  );
                },
              )
            : isPaused
                ? _buildPausedBackground(contact: contact, l10n: l10n)
                : isConnected
                    ? SpeakingRingIndicator(
                        isSpeaking: callState.isRemoteSpeaking,
                        size: 160,
                        child: Avatar(
                          name: contact?.displayName ?? 'Contact',
                          imagePath: contact?.avatarPath,
                          size: 160,
                        ),
                      )
                    : Avatar(
                        name: contact?.displayName ?? 'Contact',
                        imagePath: contact?.avatarPath,
                        size: 160,
                      ),
      ),
    );
  }

  Widget _buildPausedBackground({required dynamic contact, required AppLocalizations l10n}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar avec overlay pause
        Stack(
          alignment: Alignment.center,
          children: [
            // Avatar dimmed
            Opacity(
              opacity: 0.5,
              child: Avatar(
                name: contact?.displayName ?? 'Contact',
                imagePath: contact?.avatarPath,
                size: 160,
              ),
            ),
            // Icône pause
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.pause_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Texte "En pause"
        Text(
          l10n.callPaused,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        // Sous-texte
        Text(
          l10n.callPausedSubtitle,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // ============ PIP LAYER ============

  Widget _buildPipLayer(
    CallState callState,
    LiveKitService livekitService,
    _VideoLayoutState layout,
    bool isVideoConnected,
  ) {
    // bothOn → video PiP with local camera (draggable)
    // localOnly → avatar remote PiP (draggable) with speaking + mic badge
    // remoteOnly → local avatar PiP in same rectangle (draggable)
    // bothOff → no PiP
    final showPip = layout == _VideoLayoutState.bothOn ||
        layout == _VideoLayoutState.localOnly ||
        layout == _VideoLayoutState.remoteOnly;

    if (!showPip) {
      return const SizedBox.shrink();
    }

    final offset = _pipOffset ?? _getDefaultPipOffset();
    const hitPad = 16.0;

    return Positioned(
      left: offset.dx - hitPad,
      top: offset.dy - hitPad,
      child: AnimatedScale(
        scale: showPip ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        child: AnimatedOpacity(
          opacity: showPip ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 250),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: (_) {
              _isPipDragging = true;
              _pipSnapXController.stop();
              _pipSnapYController.stop();
            },
            onPanUpdate: (details) {
              final size = MediaQuery.of(context).size;
              final cur = _pipOffset ?? _getDefaultPipOffset();
              setState(() {
                _pipOffset = Offset(
                  (cur.dx + details.delta.dx)
                      .clamp(0, size.width - _pipWidth),
                  (cur.dy + details.delta.dy)
                      .clamp(0, size.height - _pipHeight),
                );
              });
            },
            onPanEnd: (_) {
              _isPipDragging = false;
              _springSnapPip();
            },
            onDoubleTap: _onPipDoubleTap,
            child: Padding(
              padding: const EdgeInsets.all(hitPad),
              child: layout == _VideoLayoutState.bothOn
                  ? _buildVideoPip(livekitService)
                  : layout == _VideoLayoutState.remoteOnly
                      ? _buildLocalAvatarPip(callState)
                      : _buildAvatarPip(callState),
            ),
          ),
        ),
      ),
    );
  }

  // Video PiP (bothOn state)
  Widget _buildVideoPip(LiveKitService livekitService) {
    final callState = ref.read(callStateProvider);
    final isFrontCamera = callState.cameraPosition == CameraPosition.front;
    final lk.VideoTrack? pipTrack;
    final bool mirror;
    if (_isLocalFullscreen) {
      pipTrack = livekitService.getRemoteVideoTrack();
      mirror = false;
    } else {
      pipTrack = livekitService.getLocalVideoTrack();
      mirror = isFrontCamera;
    }

    return Container(
      width: _pipWidth,
      height: _pipHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: pipTrack != null
          ? IgnorePointer(
              child: lk.VideoTrackRenderer(
                pipTrack,
                fit: lk.VideoViewFit.cover,
                mirrorMode: mirror
                    ? lk.VideoViewMirrorMode.mirror
                    : lk.VideoViewMirrorMode.off,
              ),
            )
          : const Center(
              child: Icon(
                Icons.videocam_off_rounded,
                color: AppColors.textSecondaryDark,
                size: 28,
              ),
            ),
    );
  }

  // Avatar PiP (localOnly state — remote partner has camera off)
  // Rectangle format matching video PiP dimensions
  Widget _buildAvatarPip(CallState callState) {
    final contact = callState.remoteContact;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPaused = callState.isRemoteInBackground;

    return Container(
      width: _pipWidth,
      height: _pipHeight,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Avatar centré (dimmed si en pause)
          Opacity(
            opacity: isPaused ? 0.5 : 1.0,
            child: isPaused
                ? ClipOval(
                    child: Avatar(
                      name: contact?.displayName ?? 'Contact',
                      imagePath: contact?.avatarPath,
                      size: _pipAvatarSize - 4,
                    ),
                  )
                : SpeakingRingIndicator(
                    isSpeaking: callState.isRemoteSpeaking,
                    size: _pipAvatarSize,
                    child: ClipOval(
                      child: Avatar(
                        name: contact?.displayName ?? 'Contact',
                        imagePath: contact?.avatarPath,
                        size: _pipAvatarSize - 4,
                      ),
                    ),
                  ),
          ),
          // Icône pause overlay
          if (isPaused)
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.pause_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }

  // Local avatar PiP (remoteOnly state — user turned off their camera)
  // Shows videocam_off icon since Hash is anonymous (no user profile)
  Widget _buildLocalAvatarPip(CallState callState) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: _pipWidth,
      height: _pipHeight,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: const Center(
        child: Icon(
          Icons.videocam_off_rounded,
          color: AppColors.textSecondaryDark,
          size: 32,
        ),
      ),
    );
  }
}
