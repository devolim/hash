import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/router/app_router.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

import '../../../core/theme/app_colors.dart';
import '../../../core/services/livekit_service.dart';
import '../../../domain/models/call_state.dart';
import '../../../domain/models/contact.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/call_providers.dart';
import '../common/avatar.dart';

/// Floating call widget shown when a call is active and the user navigated
/// away from the call screen.
///
/// Always uses the same rounded rectangle format:
/// - Remote camera ON: shows remote video feed
/// - Remote camera OFF: shows contact avatar
/// - Long press: mini glass controls overlay (mute, hang up, return)
class FloatingCallWidget extends ConsumerStatefulWidget {
  const FloatingCallWidget({super.key});

  @override
  ConsumerState<FloatingCallWidget> createState() => _FloatingCallWidgetState();
}

class _FloatingCallWidgetState extends ConsumerState<FloatingCallWidget>
    with SingleTickerProviderStateMixin {
  // Always the same dimensions regardless of video/audio
  static const double _width = 120.0;
  static const double _height = 170.0;
  static const double _margin = 12.0;
  // Extra offset above keyboard for input bar
  static const double _inputBarHeight = 80.0;

  Offset _position = Offset.zero;
  bool _initialized = false;

  late AnimationController _snapController;
  Animation<Offset>? _snapAnimation;

  // Mini controls overlay
  OverlayEntry? _miniControlsOverlay;

  @override
  void initState() {
    super.initState();
    _snapController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _snapController.addListener(() {
      if (_snapAnimation != null) {
        setState(() {
          _position = _snapAnimation!.value;
        });
      }
    });
  }

  @override
  void dispose() {
    _removeMiniControls();
    _snapController.dispose();
    super.dispose();
  }

  /// Initialize position to bottom-right corner
  void _initPosition(Size screenSize, double keyboardHeight) {
    if (_initialized) return;
    _initialized = true;
    _position = Offset(
      screenSize.width - _width - _margin,
      screenSize.height - _height - _margin - 100 - keyboardHeight,
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _removeMiniControls();
    setState(() {
      _position = Offset(
        _position.dx + details.delta.dx,
        _position.dy + details.delta.dy,
      );
    });
  }

  void _onPanEnd(DragEndDetails details, Size screenSize, double keyboardHeight) {
    _snapToEdge(screenSize, keyboardHeight);
  }

  void _snapToEdge(Size screenSize, double keyboardHeight) {
    final centerX = _position.dx + _width / 2;
    final centerY = _position.dy + _height / 2;

    final targetX = centerX < screenSize.width / 2
        ? _margin
        : screenSize.width - _width - _margin;

    final safeTop = MediaQuery.of(context).padding.top + _margin;
    final safeBottom = screenSize.height - _height - _margin - keyboardHeight;

    final targetY = centerY < screenSize.height / 2
        ? safeTop
        : safeBottom;

    final target = Offset(
      targetX.clamp(_margin, screenSize.width - _width - _margin),
      targetY.clamp(safeTop, safeBottom),
    );

    _snapAnimation = Tween<Offset>(
      begin: _position,
      end: target,
    ).animate(CurvedAnimation(
      parent: _snapController,
      curve: Curves.easeOutCubic,
    ));

    _snapController.forward(from: 0);
  }

  // ============ MINI CONTROLS ============

  void _showMiniControls() {
    _removeMiniControls();

    final overlay = Overlay.of(context);
    final callState = ref.read(callStateProvider);
    final l10n = AppLocalizations.of(context)!;

    _miniControlsOverlay = OverlayEntry(
      builder: (context) => _MiniControlsOverlay(
        position: _position,
        isMicMuted: callState.isMicMuted,
        l10n: l10n,
        onToggleMic: () {
          ref.read(callStateProvider.notifier).toggleMicrophone();
          _removeMiniControls();
        },
        onHangUp: () {
          ref.read(callStateProvider.notifier).hangUp();
          _removeMiniControls();
        },
        onReturn: () {
          _removeMiniControls();
          FocusManager.instance.primaryFocus?.unfocus();
          final cs = ref.read(callStateProvider);
          ref.read(routerProvider).pushNamed('call', pathParameters: {
            'contactId': cs.remoteContact?.odid ?? '',
          }, extra: cs.callType);
        },
        onDismiss: _removeMiniControls,
      ),
    );

    overlay.insert(_miniControlsOverlay!);
  }

  void _removeMiniControls() {
    _miniControlsOverlay?.remove();
    _miniControlsOverlay = null;
  }

  @override
  Widget build(BuildContext context) {
    final callState = ref.watch(callStateProvider);
    final isOnCallScreen = ref.watch(isOnActiveCallScreenProvider);

    if (isOnCallScreen) return const SizedBox.shrink();

    final livekitService = ref.watch(livekitServiceProvider);
    final contact = callState.remoteContact;
    final screenSize = MediaQuery.of(context).size;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    _initPosition(screenSize, keyboardHeight);

    // Clamp position to stay visible — account for keyboard + input bar
    final extraOffset = keyboardHeight > 0 ? _inputBarHeight : 0.0;
    final maxY = screenSize.height - _height - keyboardHeight - extraOffset;
    final clampedX = _position.dx.clamp(0.0, screenSize.width - _width);
    final clampedY = _position.dy.clamp(0.0, maxY > 0 ? maxY : 0.0);

    return Positioned(
      left: clampedX,
      top: clampedY,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanUpdate: _onPanUpdate,
        onPanEnd: (details) => _onPanEnd(details, screenSize, keyboardHeight),
        onTap: () {
          HapticFeedback.lightImpact();
          FocusManager.instance.primaryFocus?.unfocus();
          final cs = ref.read(callStateProvider);
          ref.read(routerProvider).pushNamed('call', pathParameters: {
            'contactId': cs.remoteContact?.odid ?? '',
          }, extra: cs.callType);
        },
        onLongPress: () {
          HapticFeedback.mediumImpact();
          _showMiniControls();
        },
        child: _buildFloatingCard(livekitService, contact, callState),
      ),
    );
  }

  /// Single unified card — video feed or avatar, same shape always
  Widget _buildFloatingCard(
    LiveKitService livekitService,
    Contact? contact,
    CallState callState,
  ) {
    final hasRemoteVideo = !callState.isRemoteCameraOff && !callState.isRemoteInBackground;
    final remoteTrack = hasRemoteVideo ? livekitService.getRemoteVideoTrack() : null;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final contactName = contact?.displayName ?? 'Contact';

    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        borderRadius: BorderRadius.circular(16),
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
        children: [
          // Content: video or avatar
          if (hasRemoteVideo && remoteTrack != null)
            SizedBox.expand(
              child: IgnorePointer(
                child: lk.VideoTrackRenderer(
                  remoteTrack,
                  fit: lk.VideoViewFit.cover,
                ),
              ),
            )
          else
            SizedBox.expand(
              child: Container(
                color: isDark
                    ? AppColors.darkSurface
                    : AppColors.lightSurface,
                child: Center(
                  child: callState.isRemoteInBackground
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            Opacity(
                              opacity: 0.5,
                              child: Avatar(
                                name: contactName,
                                imagePath: contact?.avatarPath,
                                size: 64,
                              ),
                            ),
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
                        )
                      : Avatar(
                          name: contactName,
                          imagePath: contact?.avatarPath,
                          size: 64,
                        ),
                ),
              ),
            ),

        ],
      ),
    );
  }

}

/// Mini controls overlay shown on long press
class _MiniControlsOverlay extends StatelessWidget {
  final Offset position;
  final bool isMicMuted;
  final AppLocalizations l10n;
  final VoidCallback onToggleMic;
  final VoidCallback onHangUp;
  final VoidCallback onReturn;
  final VoidCallback onDismiss;

  const _MiniControlsOverlay({
    required this.position,
    required this.isMicMuted,
    required this.l10n,
    required this.onToggleMic,
    required this.onHangUp,
    required this.onReturn,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Position the controls above/below the floating widget
    final showAbove = position.dy > screenSize.height / 2;
    final controlsY = showAbove ? position.dy - 60 : position.dy + _FloatingCallWidgetState._height + 10;
    final controlsX = (position.dx - 40).clamp(8.0, screenSize.width - 180.0);

    return Stack(
      children: [
        // Barrier to dismiss
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onDismiss,
            child: const SizedBox.expand(),
          ),
        ),
        // Controls row
        Positioned(
          left: controlsX,
          top: controlsY,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Toggle mic
                    _MiniControlButton(
                      icon: isMicMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
                      color: isMicMuted ? AppColors.error : Colors.white,
                      tooltip: isMicMuted ? l10n.callMiniControlsUnmute : l10n.callMiniControlsMute,
                      onTap: onToggleMic,
                    ),
                    const SizedBox(width: 4),
                    // Hang up
                    _MiniControlButton(
                      icon: Icons.call_end_rounded,
                      color: AppColors.error,
                      tooltip: l10n.callMiniControlsHangUp,
                      onTap: onHangUp,
                    ),
                    const SizedBox(width: 4),
                    // Return to call
                    _MiniControlButton(
                      icon: Icons.open_in_full_rounded,
                      color: Colors.white,
                      tooltip: l10n.callMiniControlsReturn,
                      onTap: onReturn,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MiniControlButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onTap;

  const _MiniControlButton({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color == AppColors.error
                ? AppColors.error.withValues(alpha: 0.3)
                : Colors.white.withValues(alpha: 0.1),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
      ),
    );
  }
}
