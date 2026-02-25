import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/services/remote_config_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Écran bloquant : mise à jour requise
class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.system_update_outlined,
                  color: AppColors.accentPrimary,
                  size: 48,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                l10n.forceUpdateTitle,
                style: AppTypography.headlineMedium(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.forceUpdateMessage,
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _openStore,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentPrimary,
                    foregroundColor: AppColors.darkBackground,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(l10n.updateButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _openStore() {
    final uri = Platform.isIOS
        ? Uri.parse('https://apps.apple.com/app/hash-messenger/id0000000000')
        : Uri.parse('https://play.google.com/store/apps/details?id=com.devolim.hash');
    launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

/// Écran bloquant : maintenance en cours
class MaintenanceBlockScreen extends StatelessWidget {
  final AppMaintenance maintenance;

  const MaintenanceBlockScreen({super.key, required this.maintenance});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.construction_outlined,
                  color: AppColors.accentPrimary,
                  size: 48,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                l10n.maintenanceInProgress,
                style: AppTypography.headlineMedium(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                maintenance.message,
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.black.withValues(alpha: 0.03),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  l10n.tryAgainLater,
                  style: AppTypography.bodySmall(
                    color: isDark
                        ? AppColors.textTertiaryDark
                        : AppColors.textTertiaryLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Dialogue : alerte personnalisée
Future<void> showAlertDialog(
  BuildContext context, {
  required AppAlert alert,
  required VoidCallback onDismiss,
}) async {
  final l10n = AppLocalizations.of(context)!;
  final isDark = Theme.of(context).brightness == Brightness.dark;

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => GlassTheme.glassDialog(
      context: context,
      title: Text(
        l10n.information,
        style: AppTypography.headlineSmall(
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
      ),
      content: Text(
        alert.message,
        style: AppTypography.bodyMedium(
          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        ),
      ),
      actions: [
        if (alert.actionUrl != null && alert.actionLabel != null)
          TextButton(
            onPressed: () {
              launchUrl(
                Uri.parse(alert.actionUrl!),
                mode: LaunchMode.externalApplication,
              );
            },
            child: Text(
              alert.actionLabel!,
              style: AppTypography.bodyMedium(color: AppColors.accentPrimary)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onDismiss();
          },
          child: Text(
            l10n.close,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ),
      ],
    ),
  );
}

/// Dialogue : noter l'application avec étoiles interactives
Future<void> showRatingDialog(BuildContext context, {required VoidCallback onDismiss}) async {
  await showDialog(
    context: context,
    builder: (context) => _RatingDialog(onDismiss: onDismiss),
  );
}

class _RatingDialog extends StatefulWidget {
  final VoidCallback onDismiss;

  const _RatingDialog({required this.onDismiss});

  @override
  State<_RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<_RatingDialog> {
  int _hoveredStar = 0;
  int _selectedStar = 0;

  List<String> _labels(AppLocalizations l10n) => [
    '',
    l10n.ratingTerrible,
    l10n.ratingBad,
    l10n.ratingOk,
    l10n.ratingGood,
    l10n.ratingExcellent,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassTheme.glassDialog(
      context: context,
      title: Text(
        l10n.doYouLikeHash,
        style: AppTypography.headlineSmall(
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.yourFeedbackHelps,
            style: AppTypography.bodySmall(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              final isActive = starIndex <= (_hoveredStar > 0 ? _hoveredStar : _selectedStar);
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedStar = starIndex);
                  // Petit délai pour voir la sélection avant d'agir
                  Future.delayed(const Duration(milliseconds: 300), () {
                    if (!mounted) return;
                    Navigator.pop(context);
                    widget.onDismiss();
                    if (starIndex >= 4) {
                      // 4-5 étoiles → ouvrir le store
                      _openStore();
                    }
                    // 1-3 étoiles → on ferme simplement, on ne force pas le store
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: AnimatedScale(
                    scale: isActive ? 1.15 : 1.0,
                    duration: const Duration(milliseconds: 150),
                    child: Icon(
                      isActive ? Icons.star_rounded : Icons.star_outline_rounded,
                      color: isActive
                          ? AppColors.accentPrimary
                          : (isDark
                              ? Colors.white.withValues(alpha: 0.2)
                              : Colors.black.withValues(alpha: 0.15)),
                      size: 40,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              _selectedStar > 0 ? _labels(l10n)[_selectedStar] : ' ',
              key: ValueKey(_selectedStar),
              style: AppTypography.bodyMedium(
                color: AppColors.accentPrimary,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            widget.onDismiss();
          },
          child: Text(
            l10n.later,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ),
      ],
    );
  }
}

/// Dialogue : faire un don
Future<void> showDonationDialog(BuildContext context, {required VoidCallback onDismiss}) async {
  final l10n = AppLocalizations.of(context)!;
  final isDark = Theme.of(context).brightness == Brightness.dark;

  await showDialog(
    context: context,
    builder: (context) => GlassTheme.glassDialog(
      context: context,
      title: Row(
        children: [
          const Icon(Icons.favorite_outline, color: AppColors.accentPrimary, size: 24),
          const SizedBox(width: 10),
          Text(
            l10n.supportHash,
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
        ],
      ),
      content: Text(
        l10n.donationMessage,
        style: AppTypography.bodyMedium(
          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onDismiss();
          },
          child: Text(
            l10n.later,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onDismiss();
            launchUrl(
              Uri.parse(const String.fromEnvironment('DONATE_URL')),
              mode: LaunchMode.externalApplication,
            );
          },
          child: Text(
            l10n.donate,
            style: AppTypography.bodyMedium(color: AppColors.accentPrimary)
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

void _openStore() {
  final uri = Platform.isIOS
      ? Uri.parse('https://apps.apple.com/app/hash-messenger/id0000000000')
      : Uri.parse('https://play.google.com/store/apps/details?id=com.devolim.hash');
  launchUrl(uri, mode: LaunchMode.externalApplication);
}
