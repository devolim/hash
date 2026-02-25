import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';

class LoginLogsScreen extends ConsumerWidget {
  const LoginLogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(appSettingsProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final now = DateTime.now();
    final cutoff =
        now.millisecondsSinceEpoch - const Duration(hours: 24).inMilliseconds;
    final recentLogins = settings.loginTimestamps
        .where((ts) => ts > cutoff)
        .toList()
      ..sort((a, b) => b.compareTo(a));

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        title: Text(
          l10n.recentConnections,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.accentPrimary,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + kToolbarHeight + 16, 16, 16),
        children: [
          // Info card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.info.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: AppColors.info,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.loginInfoText,
                    style: AppTypography.bodySmall(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(),

          const SizedBox(height: 24),

          // Stats summary
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.lock_open,
                  value: '${recentLogins.length}',
                  label: l10n.connectionCount,
                  color: AppColors.accentPrimary,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Icons.schedule,
                  value: '24h',
                  label: l10n.periodLabel,
                  color: AppColors.info,
                  isDark: isDark,
                ),
              ),
            ],
          ).animate().fadeIn(delay: 50.ms),

          const SizedBox(height: 24),

          // Section title
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              l10n.historyLabel,
              style: AppTypography.labelMedium(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ),

          // Login entries
          if (recentLogins.isEmpty)
            _EmptyState(isDark: isDark).animate().fadeIn(delay: 100.ms)
          else
            Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  for (int i = 0; i < recentLogins.length; i++) ...[
                    _LoginEntry(
                      timestamp: DateTime.fromMillisecondsSinceEpoch(
                          recentLogins[i]),
                      now: now,
                      isFirst: i == 0,
                      isDark: isDark,
                    ),
                    if (i < recentLogins.length - 1)
                      Divider(
                        height: 1,
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                  ],
                ],
              ),
            ).animate().fadeIn(delay: 100.ms),

          const SizedBox(height: 24),

          // Security note
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.success.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.shield_outlined,
                  color: AppColors.success,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.dataLocalOnly,
                    style: AppTypography.bodySmall(
                      color: AppColors.success,
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final bool isDark;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTypography.headlineSmall(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTypography.labelSmall(
              color: isDark
                  ? AppColors.textTertiaryDark
                  : AppColors.textTertiaryLight,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginEntry extends StatelessWidget {
  final DateTime timestamp;
  final DateTime now;
  final bool isFirst;
  final bool isDark;

  const _LoginEntry({
    required this.timestamp,
    required this.now,
    required this.isFirst,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final diff = now.difference(timestamp);
    final timeStr = DateFormat('HH:mm:ss').format(timestamp);
    final dateStr = _formatLoginDate(timestamp, now, l10n);
    final agoStr = _formatTimeAgo(diff, l10n);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isFirst
                  ? AppColors.success.withValues(alpha: 0.15)
                  : (isDark ? AppColors.darkBorder : AppColors.lightBorder)
                      .withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                isFirst ? Icons.lock_open : Icons.login,
                size: 20,
                color: isFirst
                    ? AppColors.success
                    : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$dateStr  $timeStr',
                  style: AppTypography.bodyMedium(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ).copyWith(
                    fontWeight: isFirst ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  agoStr,
                  style: AppTypography.bodySmall(
                    color: isDark
                        ? AppColors.textTertiaryDark
                        : AppColors.textTertiaryLight,
                  ),
                ),
              ],
            ),
          ),
          if (isFirst)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                l10n.currentSession,
                style: AppTypography.labelSmall(
                  color: AppColors.success,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatLoginDate(DateTime timestamp, DateTime now, AppLocalizations l10n) {
    if (timestamp.year == now.year &&
        timestamp.month == now.month &&
        timestamp.day == now.day) {
      return l10n.todayLabel;
    }
    final yesterday = now.subtract(const Duration(days: 1));
    if (timestamp.year == yesterday.year &&
        timestamp.month == yesterday.month &&
        timestamp.day == yesterday.day) {
      return l10n.yesterdayLabel;
    }
    return DateFormat('dd/MM').format(timestamp);
  }

  String _formatTimeAgo(Duration diff, AppLocalizations l10n) {
    if (diff.inMinutes < 1) {
      return l10n.justNowLabel;
    } else if (diff.inMinutes < 60) {
      return l10n.minutesAgoLabel(diff.inMinutes);
    } else {
      final hours = diff.inHours;
      final minutes = diff.inMinutes % 60;
      if (minutes == 0) {
        return l10n.hoursAgoLabel(hours);
      }
      return l10n.hoursMinutesAgoLabel(hours, minutes);
    }
  }
}

class _EmptyState extends StatelessWidget {
  final bool isDark;

  const _EmptyState({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: (isDark ? AppColors.darkBorder : AppColors.lightBorder)
                  .withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lock_clock,
              size: 40,
              color: isDark
                  ? AppColors.textTertiaryDark
                  : AppColors.textTertiaryLight,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noLoginRecorded,
            style: AppTypography.bodyLarge(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.nextUnlocksAppearHere,
            style: AppTypography.bodySmall(
              color: isDark
                  ? AppColors.textTertiaryDark
                  : AppColors.textTertiaryLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
