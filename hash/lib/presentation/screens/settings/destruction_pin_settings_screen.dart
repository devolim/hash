import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import 'security_settings_screen.dart';

class VashPinSettingsScreen extends ConsumerStatefulWidget {
  const VashPinSettingsScreen({super.key});

  @override
  ConsumerState<VashPinSettingsScreen> createState() => _VashPinSettingsScreenState();
}

class _VashPinSettingsScreenState extends ConsumerState<VashPinSettingsScreen> {
  bool _hasDuressPin = false;

  @override
  void initState() {
    super.initState();
    _loadSecuritySettings();
  }

  Future<void> _loadSecuritySettings() async {
    final authService = ref.read(authServiceProvider);
    final hasDuress = await authService.hasDuressPin();

    setState(() {
      _hasDuressPin = hasDuress;
    });
  }

  void _showSetupDuressPinDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: DuressPinSheet(
          hasDuressPin: _hasDuressPin,
          onComplete: () {
            setState(() => _hasDuressPin = true);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(l10n.vashModeTitle, style: AppTypography.headlineSmall(
          color: AppColors.error,
        ).copyWith(fontWeight: FontWeight.w700)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + kToolbarHeight + 16, 16, 16),
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04),
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
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo Vash
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/mode_vash.png',
                          width: 64,
                          height: 64,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Accroche
                      Text(
                        l10n.vashModeExplanation,
                        style: AppTypography.bodyLarge(
                          color: AppColors.error,
                        ).copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.vashModeDescription2,
                        style: AppTypography.bodySmall(
                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      // Explication
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          l10n.vashCodeInfoDetail,
                          style: AppTypography.bodyMedium(
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          l10n.vashWhatToDelete,
                          style: AppTypography.bodySmall(
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ).copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      VashCheckItem(
                        icon: Icons.people_outline,
                        text: l10n.vashDeleteContactsOption,
                        subtitle: l10n.vashDeleteContactsWarning,
                        value: settings.deleteContactsOnDuress,
                        onChanged: (value) {
                          if (value) {
                            // Confirmation avant d'activer la suppression des contacts
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor: isDark ? AppColors.darkSurface : Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                title: Row(
                                  children: [
                                    const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 24),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        l10n.vashDeleteContactsOption,
                                        style: AppTypography.headlineSmall(
                                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                content: Text(
                                  l10n.vashDeleteContactsConfirm,
                                  style: AppTypography.bodyMedium(
                                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: Text(l10n.cancel, style: TextStyle(
                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                    )),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                      final newSettings = settings.copyWith(deleteContactsOnDuress: true);
                                      ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                                    },
                                    child: Text(l10n.confirm, style: const TextStyle(color: AppColors.error)),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            final newSettings = settings.copyWith(deleteContactsOnDuress: false);
                            ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                          }
                        },
                        isDark: isDark,
                      ),
                      const SizedBox(height: 8),
                      VashCheckItem(
                        icon: Icons.chat_bubble_outline,
                        text: l10n.vashDeleteMessagesOption,
                        subtitle: l10n.vashDeleteMessagesWarning,
                        value: settings.deleteMessagesOnDuress,
                        onChanged: (value) {
                          final newSettings = settings.copyWith(deleteMessagesOnDuress: value);
                          ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                        },
                        isDark: isDark,
                      ),
                      const SizedBox(height: 8),
                      VashCheckItem(
                        icon: Icons.note_outlined,
                        text: l10n.vashDeleteNotesOption,
                        subtitle: l10n.vashDeleteNotesWarning,
                        value: settings.deleteNotesOnDuress,
                        onChanged: (value) {
                          final newSettings = settings.copyWith(deleteNotesOnDuress: value);
                          ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                        },
                        isDark: isDark,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: (isDark ? AppColors.accentPrimary : const Color(0xFF3A3A3A)).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: (isDark ? AppColors.accentPrimary : const Color(0xFF3A3A3A)).withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.badge_outlined,
                              color: isDark ? AppColors.accentPrimary : const Color(0xFF3A3A3A),
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                l10n.vashKeepId,
                                style: AppTypography.bodySmall(
                                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          l10n.vashAppearNormal,
                          style: AppTypography.bodySmall(
                            color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _showSetupDuressPinDialog,
                    borderRadius: BorderRadius.circular(16),
                    splashColor: AppColors.accentPrimary.withValues(alpha: 0.08),
                    highlightColor: AppColors.accentPrimary.withValues(alpha: 0.04),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shield_outlined,
                            color: isDark ? AppColors.accentPrimary : const Color(0xFF3A3A3A),
                            size: 24,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              _hasDuressPin ? l10n.modifyVashCode : l10n.setupVashCode,
                              style: AppTypography.bodyMedium(color: isDark ? AppColors.accentPrimary : const Color(0xFF3A3A3A))
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(),
        ],
      ),
    );
  }
}
