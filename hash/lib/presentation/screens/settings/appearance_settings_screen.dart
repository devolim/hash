import 'dart:ui';
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

class AppearanceSettingsScreen extends ConsumerWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(appSettingsProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        title: Text(l10n.appearance, style: AppTypography.headlineSmall(
          color: GlassTheme.glassTextColor(isDark),
        )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + kToolbarHeight + 16, 16, 16),
        children: [
          // Theme selection
          Text(
            l10n.theme,
            style: AppTypography.labelMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 12),

          // Auto option
          _ThemeCard(
            title: l10n.themeAuto,
            subtitle: l10n.themeAutoSubtitle,
            icon: Icons.brightness_auto,
            isSelected: settings.themeMode == ThemeMode.system,
            isDarkMode: isDark,
            previewColors: const [AppColors.darkBackground, AppColors.lightBackground],
            isAutoMode: true,
            onTap: () =>
                ref.read(appSettingsProvider.notifier).setThemeMode(ThemeMode.system),
          ).animate().fadeIn(),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _ThemeCard(
                  title: l10n.themeDark,
                  icon: Icons.dark_mode,
                  isSelected: settings.themeMode == ThemeMode.dark,
                  isDarkMode: isDark,
                  previewColors: const [AppColors.darkBackground, AppColors.darkSurface],
                  onTap: () =>
                      ref.read(appSettingsProvider.notifier).setThemeMode(ThemeMode.dark),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ThemeCard(
                  title: l10n.themeLight,
                  icon: Icons.light_mode,
                  isSelected: settings.themeMode == ThemeMode.light,
                  isDarkMode: isDark,
                  previewColors: const [AppColors.lightBackground, AppColors.lightSurface],
                  onTap: () =>
                      ref.read(appSettingsProvider.notifier).setThemeMode(ThemeMode.light),
                ),
              ),
            ],
          ).animate().fadeIn(delay: 50.ms),

          const SizedBox(height: 32),

          // Info
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
                    l10n.themeRecommendation,
                    style: AppTypography.bodySmall(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms),
        ],
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final bool isSelected;
  final bool isDarkMode;
  final List<Color> previewColors;
  final VoidCallback onTap;
  final bool isAutoMode;

  const _ThemeCard({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.isDarkMode,
    required this.previewColors,
    required this.onTap,
    this.isAutoMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;

    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.accentPrimary
                : (isDarkMode
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04)),
            width: isSelected ? 2 : 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black.withValues(alpha: 0.5)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Preview
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDarkMode
                      ? Colors.white.withValues(alpha: 0.06)
                      : Colors.black.withValues(alpha: 0.06),
                  width: 0.5,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: isAutoMode
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: const Color(0xFF0A0A0A),
                            child: Center(
                              child: Icon(
                                Icons.dark_mode,
                                size: 24,
                                color: AppColors.textPrimaryDark,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: AppColors.lightBackground,
                            child: Center(
                              child: Icon(
                                Icons.light_mode,
                                size: 24,
                                color: AppColors.textPrimaryLight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: previewColors,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          icon,
                          size: 32,
                          color: previewColors[0] == AppColors.darkBackground
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
            ),

            const SizedBox(height: 12),

            // Title and subtitle
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppTypography.labelLarge(
                        color: isSelected ? AppColors.accentPrimary : textColor,
                      ),
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.accentPrimary,
                        size: 18,
                      ),
                    ],
                  ],
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: AppTypography.bodySmall(
                      color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

