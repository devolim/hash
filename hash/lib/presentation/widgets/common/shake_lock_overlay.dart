import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Overlay qui s'affiche brièvement quand une secousse est détectée
/// avant de verrouiller l'application
class ShakeLockOverlay extends StatelessWidget {
  const ShakeLockOverlay({super.key});

  /// Affiche l'overlay pendant 150ms puis exécute le callback
  static Future<void> show(
    OverlayState overlayState, {
    required VoidCallback onComplete,
  }) async {
    final overlay = OverlayEntry(
      builder: (context) => const ShakeLockOverlay(),
    );

    overlayState.insert(overlay);

    // Attendre 150ms puis retirer l'overlay et verrouiller
    await Future.delayed(const Duration(milliseconds: 150));
    overlay.remove();
    onComplete();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Material(
      color: Colors.black.withValues(alpha: 0.9),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lock_rounded,
              size: 64,
              color: AppColors.accentPrimary,
            )
                .animate()
                .scale(
                  duration: 150.ms,
                  curve: Curves.easeOut,
                  begin: const Offset(0.5, 0.5),
                  end: const Offset(1.0, 1.0),
                )
                .fadeIn(duration: 100.ms),
            const SizedBox(height: 16),
            Text(
              l10n.locking,
              style: AppTypography.bodyLarge(
                color: Colors.white,
              ).copyWith(fontWeight: FontWeight.w600),
            )
                .animate()
                .fadeIn(
                  duration: 100.ms,
                  delay: 50.ms,
                ),
          ],
        ),
      ),
    );
  }
}
