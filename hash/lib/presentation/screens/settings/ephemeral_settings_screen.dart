import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';

/// Page de configuration de la durée par défaut des messages éphémères.
class EphemeralSettingsScreen extends ConsumerStatefulWidget {
  const EphemeralSettingsScreen({super.key});

  static String getDurationLabel(int durationSeconds) {
    if (durationSeconds == 60) return '1 minute';
    if (durationSeconds == 5 * 60) return '5 minutes';
    if (durationSeconds == 15 * 60) return '15 minutes';
    if (durationSeconds == 30 * 60) return '30 minutes';
    if (durationSeconds == 60 * 60) return '1 heure';
    if (durationSeconds == 3 * 60 * 60) return '3 heures';
    if (durationSeconds == 6 * 60 * 60) return '6 heures';
    if (durationSeconds == 12 * 60 * 60) return '12 heures';
    if (durationSeconds == 24 * 60 * 60) return '24 heures';
    if (durationSeconds == 3 * 24 * 60 * 60) return '3 jours';
    if (durationSeconds < 60) return '$durationSeconds secondes';
    if (durationSeconds < 3600) return '${durationSeconds ~/ 60} minutes';
    return '${durationSeconds ~/ 3600} heures';
  }

  @override
  ConsumerState<EphemeralSettingsScreen> createState() => _EphemeralSettingsScreenState();
}

class _EphemeralSettingsScreenState extends ConsumerState<EphemeralSettingsScreen> {
  late int _selectedDuration;

  @override
  void initState() {
    super.initState();
    _selectedDuration = ref.read(appSettingsProvider).defaultEphemeralDuration;
  }

  void _selectDuration(int seconds) {
    if (seconds == _selectedDuration) return;
    HapticFeedback.selectionClick();
    setState(() {
      _selectedDuration = seconds;
    });
    _saveDuration(seconds);
  }

  void _saveDuration(int seconds) {
    final newSettings = ref.read(appSettingsProvider).copyWith(
      defaultEphemeralDuration: seconds,
    );
    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
    _applyGlobalEphemeralDuration(seconds);
  }

  /// Met à jour l'expiration des messages existants pour tous les contacts utilisant le réglage global
  Future<void> _applyGlobalEphemeralDuration(int newDuration) async {
    final contacts = ref.read(contactsProvider);
    final messageRepo = ref.read(messageRepositoryProvider);
    final now = DateTime.now();

    for (final contact in contacts) {
      if (contact.ephemeralDuration != null) continue;

      final messages = await messageRepo.getMessagesForContact(contact.odid);
      for (final message in messages) {
        if (message.expiresAt == null && message.ephemeralRemainingSeconds == null) continue;

        if (newDuration == 0) {
          await messageRepo.deleteMessageLocally(message.id);
        } else {
          if (message.ephemeralRemainingSeconds != null) {
            message.ephemeralRemainingSeconds = newDuration;
          } else if (message.expiresAt != null) {
            message.expiresAt = now.add(Duration(seconds: newDuration));
          }
          await messageRepo.saveMessageLocally(message);
        }
      }
    }

    ref.read(expirationServiceProvider).reschedule();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        title: Text(
          l10n.ephemeralMessages,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16,
          MediaQuery.of(context).padding.top + kToolbarHeight + 16,
          16,
          32,
        ),
        children: [
          // Explication
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.5)
                      : Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.accentPrimary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.info_outline,
                        color: AppColors.accentPrimary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Comment ça fonctionne',
                        style: AppTypography.labelLarge(
                          color: AppColors.accentPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _InfoPoint(
                  color: AppColors.success,
                  text: 'Les messages sont toujours supprimés du serveur dès réception',
                  isDark: isDark,
                ),
                const SizedBox(height: 10),
                _InfoPoint(
                  color: AppColors.accentPrimary,
                  text: 'Messages, photos et fichiers sont stockés uniquement sur votre appareil',
                  isDark: isDark,
                ),
                const SizedBox(height: 10),
                _InfoPoint(
                  color: AppColors.accentPrimary,
                  text: 'Le compte à rebours démarre quand vous quittez le chat',
                  isDark: isDark,
                ),
                const SizedBox(height: 10),
                _InfoPoint(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  text: 'Si vous revenez, le timer se met en pause',
                  isDark: isDark,
                ),
              ],
            ),
          ).animate().fadeIn(),

          const SizedBox(height: 24),

          // Liste des durées
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.5)
                      : Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                for (int i = 0; i < durations.length; i++) ...[
                  _DurationTile(
                    seconds: durations[i].$1,
                    label: durations[i].$2,
                    description: durations[i].$3,
                    isSelected: _selectedDuration == durations[i].$1,
                    isDark: isDark,
                    onTap: () => _selectDuration(durations[i].$1),
                  ),
                  if (i < durations.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 66),
                      child: Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.08),
                      ),
                    ),
                ],
              ],
            ),
          ).animate().fadeIn(delay: 50.ms),

          const SizedBox(height: 16),

          // Note sur le réglage par contact
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Vous pouvez aussi définir une durée différente pour chaque contact depuis les détails de la conversation.',
              style: AppTypography.bodySmall(
                color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoPoint extends StatelessWidget {
  final Color color;
  final String text;
  final bool isDark;

  const _InfoPoint({
    required this.color,
    required this.text,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodySmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
        ),
      ],
    );
  }
}

class _DurationTile extends StatelessWidget {
  final int seconds;
  final String label;
  final String description;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _DurationTile({
    required this.seconds,
    required this.label,
    required this.description,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.accentPrimary.withValues(alpha: 0.08),
        highlightColor: AppColors.accentPrimary.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.accentPrimary.withValues(alpha: 0.15)
                      : (isDark ? AppColors.darkBorder : AppColors.lightBorder)
                          .withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.timer_outlined,
                    size: 20,
                    color: isSelected
                        ? AppColors.accentPrimary
                        : (isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppTypography.bodyMedium(
                        color: isSelected
                            ? AppColors.accentPrimary
                            : (isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight),
                      ).copyWith(
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                    Text(
                      description,
                      style: AppTypography.bodySmall(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.accentPrimary,
                  size: 22,
                )
              else
                Icon(
                  Icons.circle_outlined,
                  size: 22,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.15)
                      : Colors.black.withValues(alpha: 0.15),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
