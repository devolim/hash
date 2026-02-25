import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import 'device_data_screen.dart';
import 'server_data_screen.dart';

class DataOverviewScreen extends StatelessWidget {
  const DataOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textPrimary =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textSecondary =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final textTertiary =
        isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.deviceDataTitle,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16,
          MediaQuery.of(context).padding.top + kToolbarHeight + 20,
          16,
          32,
        ),
        children: [
          // Introduction
          _buildIntroCard(isDark, textPrimary, textSecondary)
              .animate()
              .fadeIn(),

          const SizedBox(height: 24),

          // Card 1 — Sur votre appareil
          _DataLocationCard(
            icon: Icons.smartphone_rounded,
            iconColor: AppColors.accentPrimary,
            title: l10n.deviceData,
            subtitle: l10n.dataLocalSubtitle,
            badge: l10n.dataLocalBadge,
            badgeColor: AppColors.accentPrimary,
            bodyText: l10n.dataLocalBody,
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => const DeviceDataScreen()),
            ),
            isDark: isDark,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
            textTertiary: textTertiary,
          ).animate().fadeIn(delay: 60.ms),

          const SizedBox(height: 16),

          // Card 2 — Sur le serveur
          _DataLocationCard(
            icon: Icons.cloud_outlined,
            iconColor: AppColors.info,
            title: l10n.serverData,
            subtitle: l10n.dataServerSubtitle,
            badge: l10n.dataServerBadge,
            badgeColor: AppColors.info,
            bodyText: l10n.dataServerBody,
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => const ServerDataScreen()),
            ),
            isDark: isDark,
            textPrimary: textPrimary,
            textSecondary: textSecondary,
            textTertiary: textTertiary,
          ).animate().fadeIn(delay: 120.ms),
        ],
      ),
    );
  }

  Widget _buildIntroCard(
    bool isDark,
    Color textPrimary,
    Color textSecondary,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.accentPrimary.withValues(alpha: 0.08),
            AppColors.accentPrimary.withValues(alpha: 0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accentPrimary.withValues(alpha: 0.15),
          width: 0.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.accentPrimary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.info_outline_rounded,
              color: AppColors.accentPrimary,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Vos données sont réparties entre votre téléphone et nos serveurs. Ici, vous pouvez voir exactement ce qui est stocké où.',
              style: AppTypography.bodySmall(color: textSecondary)
                  .copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _DataLocationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String badge;
  final Color badgeColor;
  final String bodyText;
  final VoidCallback onTap;
  final bool isDark;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  const _DataLocationCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.badgeColor,
    required this.bodyText,
    required this.onTap,
    required this.isDark,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashColor: iconColor.withValues(alpha: 0.06),
        highlightColor: iconColor.withValues(alpha: 0.03),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.07)
                  : Colors.black.withValues(alpha: 0.05),
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.5)
                    : Colors.black.withValues(alpha: 0.04),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Icône
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(icon, color: iconColor, size: 26),
                  ),
                  const SizedBox(width: 14),
                  // Titre + badge
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTypography.bodyLarge(color: textPrimary)
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: AppTypography.bodySmall(color: textSecondary),
                        ),
                      ],
                    ),
                  ),
                  // Chevron
                  Icon(
                    Icons.chevron_right_rounded,
                    color: textTertiary,
                    size: 22,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Badge sécurité
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: badgeColor.withValues(alpha: 0.20),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  badge,
                  style: AppTypography.labelSmall(color: badgeColor)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 10),

              // Description courte
              Text(
                bodyText,
                style: AppTypography.bodySmall(color: textTertiary)
                    .copyWith(height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
