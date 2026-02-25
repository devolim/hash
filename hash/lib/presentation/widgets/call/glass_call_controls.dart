import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/glass_theme.dart';

/// Barre de contrôles d'appel avec glassmorphism
/// Layout symétrique : [Micro] | [FIN] | [Caméra]
/// Icônes uniquement, pas de labels. Barre compacte.
class GlassCallControls extends StatelessWidget {
  final bool isMicMuted;
  final bool isCameraOff;
  final bool isCameraEnabled;
  final bool isConnected;
  final VoidCallback onToggleMic;
  final VoidCallback? onToggleCamera;
  final VoidCallback onHangUp;

  const GlassCallControls({
    super.key,
    required this.isMicMuted,
    required this.isCameraOff,
    required this.isCameraEnabled,
    this.isConnected = true,
    required this.onToggleMic,
    this.onToggleCamera,
    required this.onHangUp,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: GlassTheme.blurHeavy, sigmaY: GlassTheme.blurHeavy),
        child: Container(
          decoration: BoxDecoration(
            color: GlassTheme.backgroundStrong(isDark),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border(
              top: BorderSide(
                color: isDark
                    ? AppColors.glassBorderDark
                    : AppColors.glassBorderLight,
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // === Micro (uniquement quand connecté) ===
                  Expanded(
                    child: Center(
                      child: isConnected
                          ? _ControlIcon(
                              icon: isMicMuted
                                  ? Icons.mic_off_rounded
                                  : Icons.mic_rounded,
                              isActive: !isMicMuted,
                              isDark: isDark,
                              onTap: onToggleMic,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),

                  // === Fin ===
                  _HangUpButton(onTap: onHangUp),

                  // === Caméra (uniquement quand connecté) ===
                  Expanded(
                    child: Center(
                      child: isConnected
                          ? _ControlIcon(
                              icon: isCameraOff
                                  ? Icons.videocam_off_rounded
                                  : Icons.videocam_rounded,
                              isActive: !isCameraOff,
                              isDisabled: !isCameraEnabled,
                              isDark: isDark,
                              onTap: isCameraEnabled ? onToggleCamera : null,
                            )
                          : const SizedBox.shrink(),
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
}

/// Icône de contrôle — pas de label, pas de cercle
class _ControlIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final bool isDisabled;
  final bool isDark;
  final VoidCallback? onTap;

  const _ControlIcon({
    required this.icon,
    required this.isActive,
    this.isDisabled = false,
    required this.isDark,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveOpacity = isDisabled ? 0.3 : 1.0;
    final iconColor = isActive
        ? (isDark ? AppColors.accentPrimary : Colors.white)
        : isDark
            ? Colors.white.withValues(alpha: 0.55)
            : Colors.black.withValues(alpha: 0.45);

    return Opacity(
      opacity: effectiveOpacity,
      child: GestureDetector(
        onTap: isDisabled ? null : () {
          HapticFeedback.lightImpact();
          onTap?.call();
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: iconColor,
            size: 32,
          ),
        ),
      ),
    );
  }
}

/// Bouton raccrocher — cercle rouge
class _HangUpButton extends StatelessWidget {
  final VoidCallback onTap;

  const _HangUpButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.error,
          boxShadow: [
            BoxShadow(
              color: AppColors.error.withValues(alpha: 0.35),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(
          Icons.call_end_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
