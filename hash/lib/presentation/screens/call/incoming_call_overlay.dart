import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/call_state.dart';
import '../../providers/call_providers.dart';
import '../../widgets/common/avatar.dart';

/// Overlay plein écran pour les appels entrants avec glassmorphism
class IncomingCallOverlay extends ConsumerStatefulWidget {
  const IncomingCallOverlay({super.key});

  @override
  ConsumerState<IncomingCallOverlay> createState() =>
      _IncomingCallOverlayState();
}

class _IncomingCallOverlayState extends ConsumerState<IncomingCallOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  bool _cameraPreviewStarted = false;
  CallState? _lastCallState;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Démarrer la preview caméra si appel vidéo entrant
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startCameraPreviewIfNeeded();
    });
  }

  Future<void> _startCameraPreviewIfNeeded() async {
    final callState = ref.read(callStateProvider);
    if (callState.callType == CallType.video && !_cameraPreviewStarted) {
      _cameraPreviewStarted = true;
      final livekitService = ref.read(livekitServiceProvider);
      await livekitService.startLocalCameraPreview();
      if (mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    if (_cameraPreviewStarted) {
      // Ne pas arrêter la preview si l'appel est accepté (elle sera réutilisée)
      // Utiliser _lastCallState car ref n'est plus utilisable dans dispose()
      final status = _lastCallState?.status;
      if (status != CallStatus.connecting && status != CallStatus.connected) {
        // Accéder au service via le container Riverpod directement
        try {
          ref.read(livekitServiceProvider).stopLocalCameraPreview();
        } catch (_) {
          // Widget already disposed, ignore
        }
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final callState = ref.watch(callStateProvider);
    final contact = callState.remoteContact;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Ne pas afficher si pas en train de sonner ou si appel sortant
    if (callState.status != CallStatus.ringing ||
        callState.direction != CallDirection.incoming) {
      return const SizedBox.shrink();
    }

    // Sauvegarder le dernier état pour l'utiliser dans dispose()
    _lastCallState = callState;

    // Écouter les changements d'état pour masquer l'overlay
    // Note: la navigation vers l'écran d'appel est gérée par
    // callNavigationProvider dans call_providers.dart:acceptCall()
    ref.listen<CallState>(callStateProvider, (previous, next) {
      if (!mounted) return;
      _lastCallState = next;
      if (next.status == CallStatus.connected ||
          next.status == CallStatus.connecting ||
          next.status == CallStatus.ended ||
          next.status == CallStatus.idle) {
        try {
          ref.read(showCallOverlayProvider.notifier).state = false;
        } catch (_) {
          // Widget disposed between mounted check and ref.read
        }
      }
    });

    final isVideoCall = callState.callType == CallType.video;
    final livekitService = ref.watch(livekitServiceProvider);
    final localVideoTrack = isVideoCall ? livekitService.getLocalVideoTrack() : null;

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Arrière-plan: caméra pour vidéo, blur pour audio
          if (isVideoCall && localVideoTrack != null)
            lk.VideoTrackRenderer(
              localVideoTrack,
              fit: lk.VideoViewFit.cover,
              mirrorMode: lk.VideoViewMirrorMode.mirror,
            )
          else
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: GlassTheme.blurHeavy, sigmaY: GlassTheme.blurHeavy),
              child: SizedBox.expand(),
            ),
          // Scrim sombre par-dessus la caméra
          Container(
            color: isVideoCall && localVideoTrack != null
                ? Colors.black.withValues(alpha: 0.4)
                : GlassTheme.backgroundOverlay(isDark),
          ),
          SafeArea(
            child: Column(
              children: [
                // Badge E2EE
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.04),
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.lock,
                          size: 14,
                          color: AppColors.success,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Appel chiffré E2E',
                          style: TextStyle(
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                // Avatar avec animation pulse et glow orange
                AnimatedBuilder(
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
                                  .withValues(alpha: 0.4),
                              blurRadius: 24,
                              spreadRadius: 8,
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.accentPrimary
                                .withValues(alpha: 0.6),
                            width: 3,
                          ),
                        ),
                        child: Avatar(
                          name: contact?.displayName ?? 'Contact',
                          imagePath: contact?.avatarPath,
                          size: 120,
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Nom du contact
                Text(
                  contact?.displayName ?? 'Contact',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                // Type d'appel
                Text(
                  'Appel ${callState.callType == CallType.video ? "vidéo" : "audio"} entrant...',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    fontSize: 16,
                  ),
                ),

                const Spacer(),

                // Boutons d'action: Refuser, Ignorer, Répondre
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Refuser
                      Transform.translate(
                        offset: const Offset(0, -12),
                        child: _buildActionButton(
                          icon: Icons.call_end,
                          color: AppColors.error,
                          size: 72,
                          onTap: () {
                            ref.read(callStateProvider.notifier).declineCall();
                          },
                        ),
                      ),

                      // Ignorer (croix blanche sur cercle gris)
                      Transform.translate(
                        offset: const Offset(0, 8),
                        child: GestureDetector(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          ref.read(callStateProvider.notifier).ignoreCall();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.15),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      ),

                      // Répondre
                      Transform.translate(
                        offset: const Offset(0, -12),
                        child: _buildActionButton(
                          icon: callState.callType == CallType.video
                              ? Icons.videocam
                              : Icons.call,
                          color: AppColors.success,
                          size: 72,
                          onTap: () {
                            ref.read(callStateProvider.notifier).acceptCall();
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required double size,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
