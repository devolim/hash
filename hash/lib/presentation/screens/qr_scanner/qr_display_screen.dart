import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import '../../providers/temporary_code_provider.dart';
import '../../widgets/common/hash_button.dart';

class QrDisplayScreen extends ConsumerStatefulWidget {
  const QrDisplayScreen({super.key});

  @override
  ConsumerState<QrDisplayScreen> createState() => _QrDisplayScreenState();
}

class _QrDisplayScreenState extends ConsumerState<QrDisplayScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(temporaryCodeNotifierProvider.notifier).generate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = ref.watch(currentUserProvider);
    final codeState = ref.watch(temporaryCodeNotifierProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final surfaceColor = isDark ? Colors.black : Colors.white;
    final borderColor = isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04);
    final surfaceVariant = isDark ? Colors.black : Colors.white;
    final primaryText = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryText = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: GlassTheme.glassIconColor(isDark)),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.myQrCode, style: AppTypography.headlineSmall(color: GlassTheme.glassTextColor(isDark))),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // QR Code card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: borderColor, width: 0.5),
                ),
                child: Column(
                  children: [
                    // QR Code
                    if (user != null && codeState.code != null && !codeState.isExpired)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: QrImageView(
                          data: 'hash://${user.hashId}/${codeState.code}',
                          version: QrVersions.auto,
                          size: 200,
                          backgroundColor: Colors.white,
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: AppColors.darkBackground,
                          ),
                          dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: AppColors.darkBackground,
                          ),
                        ),
                      ).animate().fadeIn().scale()
                    else if (codeState.isLoading)
                      Container(
                        width: 232,
                        height: 232,
                        decoration: BoxDecoration(
                          color: surfaceVariant,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
                          ),
                        ),
                      )
                    else
                      // Expired or error: blurred QR placeholder with refresh overlay
                      GestureDetector(
                        onTap: () => ref.read(temporaryCodeNotifierProvider.notifier).forceRefresh(),
                        child: Container(
                          width: 232,
                          height: 232,
                          decoration: BoxDecoration(
                            color: surfaceVariant,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Blurred QR placeholder
                                ImageFiltered(
                                  imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                  child: Opacity(
                                    opacity: 0.3,
                                    child: Icon(
                                      Icons.qr_code_2,
                                      size: 160,
                                      color: secondaryText,
                                    ),
                                  ),
                                ),
                                // Refresh overlay
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: AppColors.accentPrimary.withValues(alpha: 0.15),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.refresh,
                                        size: 32,
                                        color: AppColors.accentPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      l10n.generateNewCodeButton,
                                      style: AppTypography.labelMedium(
                                        color: AppColors.accentPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 24),

                    // Hash ID
                    Text(
                      user?.hashId ?? '---',
                      style: AppTypography.hashId(),
                    ),

                    const SizedBox(height: 16),

                    // Temporary code
                    if (codeState.code != null && !codeState.isExpired) ...[
                      Text(
                        l10n.temporaryCode,
                        style: AppTypography.labelMedium(color: secondaryText),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        codeState.code!,
                        style: AppTypography.code(color: primaryText),
                      ),
                    ] else if (codeState.isExpired) ...[
                      Text(
                        l10n.codeExpired,
                        style: AppTypography.bodyMedium(color: secondaryText),
                      ),
                    ],

                    const SizedBox(height: 16),

                    // Expiration timer
                    if (codeState.code != null && !codeState.isExpired)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: codeState.remainingSeconds < 60
                              ? AppColors.error.withValues(alpha: 0.1)
                              : AppColors.accentPrimary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 16,
                              color: codeState.remainingSeconds < 60
                                  ? AppColors.error
                                  : AppColors.accentPrimary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              codeState.formattedTime,
                              style: AppTypography.labelMedium(
                                color: codeState.remainingSeconds < 60
                                    ? AppColors.error
                                    : AppColors.accentPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Refresh button
              HashButton(
                text: l10n.generateNewCodeButton,
                icon: Icons.refresh,
                onPressed: () =>
                    ref.read(temporaryCodeNotifierProvider.notifier).forceRefresh(),
                isLoading: codeState.isLoading,
                isOutlined: true,
                width: double.infinity,
              ),

              const SizedBox(height: 12),

              // Add contact button
              HashButton(
                text: l10n.addContact,
                icon: Icons.person_add_outlined,
                onPressed: () => context.push(AppRoutes.addContact),
                width: double.infinity,
              ),

              const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
