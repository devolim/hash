import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Mute duration picker with clear predefined options
class MuteDurationPicker extends StatelessWidget {
  final Duration? currentMuteDuration;
  final Function(Duration?) onDurationSelected;

  const MuteDurationPicker({
    super.key,
    this.currentMuteDuration,
    required this.onDurationSelected,
  });

  static Future<Duration?> show({
    required BuildContext context,
    Duration? currentMuteDuration,
  }) async {
    Duration? selectedDuration;
    bool wasSelected = false;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: MuteDurationPicker(
          currentMuteDuration: currentMuteDuration,
          onDurationSelected: (d) {
            selectedDuration = d;
            wasSelected = true;
          },
        ),
      ),
    );

    return wasSelected ? selectedDuration : currentMuteDuration;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Mute options: 1h, 8h, 1 day, 1 week, Always
    final options = [
      (const Duration(hours: 1), l10n.mute1Hour, Icons.schedule),
      (const Duration(hours: 8), l10n.mute8Hours, Icons.nightlight_outlined),
      (const Duration(days: 1), l10n.mute1Day, Icons.today),
      (const Duration(days: 7), l10n.mute1Week, Icons.date_range),
      (null, l10n.muteAlways, Icons.notifications_off),
    ];

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Title with icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.muteNotifications,
                    style: AppTypography.headlineSmall(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  l10n.muteExplanation,
                  style: AppTypography.bodySmall(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24),

              // Options
              ...options.map((option) {
                final duration = option.$1;
                final label = option.$2;
                final icon = option.$3;

                return _MuteOption(
                  icon: icon,
                  label: label,
                  onTap: () {
                    onDurationSelected(duration);
                    Navigator.pop(context);
                  },
                  isDark: isDark,
                );
              }),

              const SizedBox(height: 16),

              // Cancel button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    l10n.cancel,
                    style: AppTypography.labelLarge(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _MuteOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDark;

  const _MuteOption({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: GlassTheme.glassIconColor(isDark).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: GlassTheme.glassIconColor(isDark), size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: AppTypography.bodyLarge(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Quick duration options for ephemeral messages with clear explanation
class EphemeralDurationPicker extends StatelessWidget {
  final int? currentDurationSeconds;
  final Function(int?) onDurationSelected;
  /// Si true, affiche "Ma préférence" comme première option (pour les détails conversation)
  final bool showGlobalOption;
  /// Libellé de la durée globale actuelle (ex: "Immédiat", "5 minutes")
  final String? globalDurationLabel;

  const EphemeralDurationPicker({
    super.key,
    this.currentDurationSeconds,
    required this.onDurationSelected,
    this.showGlobalOption = false,
    this.globalDurationLabel,
  });

  static Future<int?> show({
    required BuildContext context,
    int? currentDurationSeconds,
    bool showGlobalOption = false,
    String? globalDurationLabel,
  }) async {
    int? selectedDuration = currentDurationSeconds;
    bool wasSelected = false;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: EphemeralDurationPicker(
          currentDurationSeconds: currentDurationSeconds,
          showGlobalOption: showGlobalOption,
          globalDurationLabel: globalDurationLabel,
          onDurationSelected: (d) {
            selectedDuration = d;
            wasSelected = true;
          },
        ),
      ),
    );

    return wasSelected ? selectedDuration : currentDurationSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Predefined durations (minimum: 1 minute)
    final durations = <(int, String, String)>[
      (60, '1 minute', 'Supprimé 1 min après avoir quitté'),
      (5 * 60, '5 minutes', 'Supprimé 5 min après avoir quitté'),
      (15 * 60, '15 minutes', 'Supprimé 15 min après avoir quitté'),
      (30 * 60, '30 minutes', 'Supprimé 30 min après avoir quitté'),
      (60 * 60, '1 heure', 'Supprimé 1h après avoir quitté'),
      (3 * 60 * 60, '3 heures', 'Supprimé 3h après avoir quitté'),
      (6 * 60 * 60, '6 heures', 'Supprimé 6h après avoir quitté'),
      (12 * 60 * 60, '12 heures', 'Supprimé 12h après avoir quitté'),
      (24 * 60 * 60, '24 heures', 'Supprimé 24h après avoir quitté'),
      (3 * 24 * 60 * 60, '3 jours', 'Supprimé 3 jours après avoir quitté'),
    ];

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer_outlined, color: GlassTheme.glassIconColor(isDark)),
                  const SizedBox(width: 8),
                  Text(
                    l10n.ephemeralMessages,
                    style: AppTypography.headlineSmall(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Explanation box - Simple and clear
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: GlassTheme.glassIconColor(isDark).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: GlassTheme.glassIconColor(isDark).withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: GlassTheme.glassIconColor(isDark), size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Comment ça fonctionne',
                          style: AppTypography.labelLarge(color: GlassTheme.glassIconColor(isDark)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Point 1: Server deletes immediately
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.success,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Les messages sont toujours supprimés du serveur dès réception',
                            style: AppTypography.bodySmall(
                              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Point 2: Stored locally
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: GlassTheme.glassIconColor(isDark),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Messages, photos et fichiers sont stockés uniquement sur votre appareil',
                            style: AppTypography.bodySmall(
                              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Point 3: Timer starts when leaving
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: GlassTheme.glassIconColor(isDark),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Le compte à rebours démarre quand vous quittez le chat',
                            style: AppTypography.bodySmall(
                              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Point 4: Pauses when you come back
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Si vous revenez, le timer se met en pause',
                            style: AppTypography.bodySmall(
                              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Option "Ma préférence" si activée
              if (showGlobalOption) ...[
                _EphemeralOption(
                  seconds: null,
                  label: l10n.ephemeralMyPreference,
                  description: '${l10n.ephemeralMyPreferenceDesc} (${globalDurationLabel ?? l10n.ephemeralImmediate})',
                  isSelected: currentDurationSeconds == null,
                  onTap: () {
                    onDurationSelected(null);
                    Navigator.pop(context);
                  },
                  isDark: isDark,
                ),
              ],

              // Duration options
              ...durations.map((d) => _EphemeralOption(
                seconds: d.$1,
                label: d.$2,
                description: d.$3,
                isSelected: currentDurationSeconds == d.$1,
                onTap: () {
                  onDurationSelected(d.$1);
                  Navigator.pop(context);
                },
                isDark: isDark,
              )),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _EphemeralOption extends StatelessWidget {
  final int? seconds;
  final String label;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  const _EphemeralOption({
    required this.seconds,
    required this.label,
    required this.description,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          color: isSelected ? GlassTheme.glassIconColor(isDark).withValues(alpha: 0.1) : null,
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? GlassTheme.glassIconColor(isDark) : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
                    width: 2,
                  ),
                  color: isSelected ? GlassTheme.glassIconColor(isDark) : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.black, size: 16)
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppTypography.bodyLarge(
                        color: isSelected
                            ? GlassTheme.glassIconColor(isDark)
                            : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                      ),
                    ),
                    Text(
                      description,
                      style: AppTypography.bodySmall(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
