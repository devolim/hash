import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/app_icon_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';

class AppIconSettingsScreen extends ConsumerWidget {
  const AppIconSettingsScreen({super.key});

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
        title: Text(l10n.appIcon, style: AppTypography.headlineSmall(
          color: GlassTheme.glassTextColor(isDark),
        )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.fromLTRB(
          16,
          MediaQuery.of(context).padding.top + kToolbarHeight + 16,
          16,
          16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: AppIconService.availableIcons.length,
        itemBuilder: (context, index) {
          final iconId = AppIconService.availableIcons[index];
          final isSelected = settings.appIcon == iconId;

          return _IconCard(
            iconId: iconId,
            label: _getIconLabel(l10n, iconId),
            isSelected: isSelected,
            isDark: isDark,
            onTap: () {
              HapticFeedback.mediumImpact();
              ref.read(appSettingsProvider.notifier).setAppIcon(iconId);
            },
          ).animate().fadeIn(delay: (index * 30).ms);
        },
      ),
    );
  }

  String _getIconLabel(AppLocalizations l10n, String iconId) {
    switch (iconId) {
      case 'default':
        return l10n.iconDefault;
      case 'hbal':
        return l10n.iconBal;
      case 'hbell':
        return l10n.iconBell;
      case 'cloud':
        return l10n.iconCloud;
      case 'fog':
        return l10n.iconFog;
      case 'ghost':
        return l10n.iconGhost;
      case 'glass':
        return l10n.iconGlass;
      case 'key':
        return l10n.iconKey;
      case 'lock':
        return l10n.iconLock;
      case 'hmsg':
        return l10n.iconMsg;
      case 'vash':
        return l10n.iconRed;
      case 'pyramid':
        return l10n.iconPyramid;
      case 'at':
        return l10n.iconAt;
      case 'rocket':
        return l10n.iconRocket;
      case 'sun':
        return l10n.iconSun;
      default:
        return iconId;
    }
  }
}

class _IconCard extends StatelessWidget {
  final String iconId;
  final String label;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _IconCard({
    required this.iconId,
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final assetPath = iconId == 'default'
        ? 'assets/icons/hash_icons.png'
        : 'assets/icons/alt/$iconId.png';

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.accentPrimary
                : (isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04)),
            width: isSelected ? 2 : 0.5,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                assetPath,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    label,
                    style: AppTypography.labelSmall(
                      color: isSelected
                          ? AppColors.accentPrimary
                          : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isSelected) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.accentPrimary,
                    size: 14,
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
