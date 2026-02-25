import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';

/// Bottom sheet de confirmation de suppression (pour moi / pour tous)
class DeleteConfirmationSheet extends StatelessWidget {
  final int messageCount;
  final bool canDeleteForBoth;
  final VoidCallback onDeleteForMe;
  final VoidCallback? onDeleteForBoth;

  const DeleteConfirmationSheet({
    super.key,
    required this.messageCount,
    required this.canDeleteForBoth,
    required this.onDeleteForMe,
    this.onDeleteForBoth,
  });

  static Future<void> show({
    required BuildContext context,
    required int messageCount,
    required bool canDeleteForBoth,
    required VoidCallback onDeleteForMe,
    VoidCallback? onDeleteForBoth,
  }) {
    HapticFeedback.mediumImpact();

    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => DeleteConfirmationSheet(
        messageCount: messageCount,
        canDeleteForBoth: canDeleteForBoth,
        onDeleteForMe: onDeleteForMe,
        onDeleteForBoth: onDeleteForBoth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final title = messageCount == 1
        ? 'Supprimer ce message ?'
        : 'Supprimer $messageCount messages ?';

    return GlassTheme.bottomSheetWrapper(
      isDark: isDark,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),

            // Titre
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: AppTypography.bodyLarge(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ).copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),

            // Supprimer pour moi
            _ActionTile(
              icon: Icons.delete_outline,
              label: 'Supprimer pour moi',
              color: AppColors.error,
              onTap: () {
                Navigator.pop(context);
                onDeleteForMe();
              },
            ),

            // Supprimer pour tous
            if (canDeleteForBoth && onDeleteForBoth != null)
              _ActionTile(
                icon: Icons.delete_sweep,
                label: 'Supprimer pour tous',
                color: AppColors.error,
                onTap: () {
                  Navigator.pop(context);
                  onDeleteForBoth!();
                },
              ),

            // Annuler
            _ActionTile(
              icon: Icons.close,
              label: 'Annuler',
              onTap: () => Navigator.pop(context),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.label,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = color ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: textColor, size: 24),
              const SizedBox(width: 16),
              Text(
                label,
                style: AppTypography.bodyLarge(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
