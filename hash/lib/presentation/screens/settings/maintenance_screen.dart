import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/services/remote_config_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';

class MaintenanceScreen extends ConsumerWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final remoteConfig = ref.read(remoteConfigServiceProvider);
    final maintenances = remoteConfig.upcomingMaintenances;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          l10n.maintenanceTitle,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16,
          MediaQuery.of(context).padding.top + kToolbarHeight + 16,
          16,
          16,
        ),
        children: [
          if (maintenances.isEmpty)
            _EmptyState(isDark: isDark)
          else
            ...maintenances.map((m) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _MaintenanceCard(maintenance: m, isDark: isDark),
                )),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final bool isDark;

  const _EmptyState({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: AppColors.success.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noMaintenancePlanned,
              style: AppTypography.bodyLarge(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.everythingWorkingNormally,
              style: AppTypography.bodyMedium(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MaintenanceCard extends StatelessWidget {
  final AppMaintenance maintenance;
  final bool isDark;

  const _MaintenanceCard({
    required this.maintenance,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isActive = maintenance.isActive;
    final locale = Localizations.localeOf(context).languageCode;
    final dateFormat = DateFormat('dd/MM/yyyy', locale);
    final timeFormat = DateFormat('HH:mm', locale);
    final startLocal = maintenance.startAt.toLocal();
    final endLocal = maintenance.endAt.toLocal();

    final sameDay = startLocal.day == endLocal.day &&
        startLocal.month == endLocal.month &&
        startLocal.year == endLocal.year;

    final dateStr = sameDay
        ? '${dateFormat.format(startLocal)} de ${timeFormat.format(startLocal)} à ${timeFormat.format(endLocal)}'
        : 'Du ${dateFormat.format(startLocal)} ${timeFormat.format(startLocal)} au ${dateFormat.format(endLocal)} ${timeFormat.format(endLocal)}';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.accentPrimary.withValues(alpha: 0.1)
            : (isDark ? Colors.black : Colors.white),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive
              ? AppColors.accentPrimary.withValues(alpha: 0.3)
              : (isDark
                  ? Colors.white.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.04)),
          width: isActive ? 1 : 0.5,
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.accentPrimary.withValues(alpha: 0.2)
                      : (isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.04)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isActive ? l10n.maintenanceActiveLabel : l10n.maintenancePlannedLabel,
                  style: AppTypography.labelSmall(
                    color: isActive
                        ? AppColors.accentPrimary
                        : (isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight),
                  ).copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            maintenance.message,
            style: AppTypography.bodyLarge(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ).copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.schedule,
                size: 16,
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  dateStr,
                  style: AppTypography.bodySmall(
                    color: isDark
                        ? AppColors.textTertiaryDark
                        : AppColors.textTertiaryLight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
