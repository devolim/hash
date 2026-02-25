import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/call_state.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/call_providers.dart';
import 'call_quality_indicator.dart';

/// Barre de statut top avec glassmorphism pour l'écran d'appel unifié
/// Layout: [Minimize] | Centre: Nom + Timer/Status | [FlipCam OU HP]
/// - Caméra ON → icône flip caméra
/// - Caméra OFF → icône haut-parleur toggle
class GlassCallStatusBar extends ConsumerWidget {
  final CallStatus status;
  final String contactName;
  final bool isCameraOff;
  final bool isRemoteCameraOff;
  final bool isSpeakerOn;
  final ConnectionQuality connectionQuality;
  final VoidCallback onMinimize;
  final VoidCallback? onFlipCamera;
  final VoidCallback onToggleSpeaker;

  const GlassCallStatusBar({
    super.key,
    required this.status,
    required this.contactName,
    required this.isCameraOff,
    required this.isRemoteCameraOff,
    required this.isSpeakerOn,
    required this.connectionQuality,
    required this.onMinimize,
    this.onFlipCamera,
    required this.onToggleSpeaker,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;

    return ClipRRect(
      borderRadius:
          const BorderRadius.vertical(bottom: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: GlassTheme.blurMedium, sigmaY: GlassTheme.blurMedium),
        child: Container(
          decoration: BoxDecoration(
            color: GlassTheme.background(isDark),
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? AppColors.glassBorderDark
                    : AppColors.glassBorderLight,
              ),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  // Bouton minimiser
                  IconButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      onMinimize();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: iconColor,
                    ),
                  ),

                  // Centre: Nom (haut) + Timer/Status (bas)
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Cadenas vert + Nom du contact
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.lock_rounded,
                              size: 14,
                              color: AppColors.success,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                contactName,
                                style: TextStyle(
                                  color: iconColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 2),

                        // Timer / Status + Quality indicator
                        if (status == CallStatus.connected ||
                            status == CallStatus.reconnecting)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildTimer(ref, isDark),
                              if (connectionQuality == ConnectionQuality.poor ||
                                  connectionQuality == ConnectionQuality.lost) ...[
                                const SizedBox(width: 6),
                                CallQualityIndicator(quality: connectionQuality),
                              ],
                            ],
                          )
                        else
                          Text(
                            _getStatusText(context, status),
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

                  // Droite: flip caméra OU haut-parleur (animé)
                  // - Caméra locale ON → flip caméra
                  // - Aucune vidéo (les 2 caméras OFF) → toggle HP
                  // - Vidéo distante seulement → rien (HP forcé)
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                    child: (!isCameraOff && onFlipCamera != null)
                        ? IconButton(
                            key: const ValueKey('flip'),
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              onFlipCamera!();
                            },
                            icon: Icon(
                              Icons.cameraswitch_rounded,
                              color: iconColor,
                            ),
                          )
                        : (isCameraOff && isRemoteCameraOff)
                            ? IconButton(
                                key: const ValueKey('speaker'),
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                  onToggleSpeaker();
                                },
                                icon: Icon(
                                  isSpeakerOn
                                      ? Icons.volume_up_rounded
                                      : Icons.volume_off_rounded,
                                  color: isSpeakerOn
                                      ? AppColors.accentPrimary
                                      : iconColor,
                                ),
                              )
                            : const SizedBox(
                                key: ValueKey('empty'),
                                width: 48,
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

  Widget _buildTimer(WidgetRef ref, bool isDark) {
    final durationAsync = ref.watch(callDurationProvider);
    // Toujours afficher le timer — utiliser la dernière valeur connue
    final duration = durationAsync.valueOrNull ?? Duration.zero;

    return Text(
      _formatDuration(duration),
      style: TextStyle(
        color: isDark
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
    );
  }

  String _getStatusText(BuildContext context, CallStatus status) {
    final l10n = AppLocalizations.of(context)!;
    switch (status) {
      case CallStatus.initiating:
        return l10n.callConnecting;
      case CallStatus.ringing:
        return l10n.callRinging;
      case CallStatus.connecting:
        return l10n.callConnecting;
      default:
        return '';
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
