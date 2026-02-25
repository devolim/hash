import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/message.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Bottom sheet for message actions (copy, delete, info, save)
class MessageActionsSheet extends StatelessWidget {
  final Message message;
  final VoidCallback? onCopy;
  final VoidCallback onDelete;
  final VoidCallback onInfo;
  final VoidCallback? onSave;
  final VoidCallback? onOpen;
  final VoidCallback? onRetry;
  final VoidCallback? onSelect;

  const MessageActionsSheet({
    super.key,
    required this.message,
    this.onCopy,
    required this.onDelete,
    required this.onInfo,
    this.onSave,
    this.onOpen,
    this.onRetry,
    this.onSelect,
  });

  static Future<void> show({
    required BuildContext context,
    required Message message,
    VoidCallback? onCopy,
    required VoidCallback onDelete,
    required VoidCallback onInfo,
    VoidCallback? onSave,
    VoidCallback? onOpen,
    VoidCallback? onRetry,
    VoidCallback? onSelect,
  }) {
    // Haptic feedback
    HapticFeedback.mediumImpact();

    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => MessageActionsSheet(
        message: message,
        onCopy: onCopy,
        onDelete: onDelete,
        onInfo: onInfo,
        onSave: onSave,
        onOpen: onOpen,
        onRetry: onRetry,
        onSelect: onSelect,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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

            // Copier (uniquement pour texte)
            if (onCopy != null)
              _ActionTile(
                icon: Icons.copy_outlined,
                label: l10n.copy,
                onTap: () {
                  Navigator.pop(context);
                  onCopy!();
                },
              ),

            // Enregistrer (uniquement pour images/vidéos normales)
            if (onSave != null)
              _ActionTile(
                icon: Icons.download_outlined,
                label: 'Enregistrer',
                onTap: () {
                  Navigator.pop(context);
                  onSave!();
                },
              ),

            // Ouvrir (pour les fichiers)
            if (onOpen != null)
              _ActionTile(
                icon: Icons.open_in_new_outlined,
                label: 'Ouvrir',
                onTap: () {
                  Navigator.pop(context);
                  onOpen!();
                },
              ),

            // Infos
            _ActionTile(
              icon: Icons.info_outline,
              label: l10n.messageInfo,
              onTap: () {
                Navigator.pop(context);
                onInfo();
              },
            ),

            // Renvoyer (uniquement pour messages échoués)
            if (onRetry != null)
              _ActionTile(
                icon: Icons.refresh_outlined,
                label: 'Renvoyer',
                color: AppColors.accentPrimary,
                onTap: () {
                  Navigator.pop(context);
                  onRetry!();
                },
              ),

            // Sélectionner
            if (onSelect != null)
              _ActionTile(
                icon: Icons.check_circle_outline,
                label: 'Sélectionner',
                onTap: () {
                  Navigator.pop(context);
                  onSelect!();
                },
              ),

            // Supprimer
            _ActionTile(
              icon: Icons.delete_outline,
              label: l10n.delete,
              color: AppColors.error,
              onTap: () {
                Navigator.pop(context);
                onDelete();
              },
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
