import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../providers/app_providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.darkBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // Wait for splash animation
    await Future.delayed(AppConstants.splashDuration);

    if (!mounted) return;

    // Check if user is registered
    final userRepo = ref.read(userRepositoryProvider);
    final isRegistered = await userRepo.isRegistered();

    if (!mounted) return;

    if (!isRegistered) {
      // New user - go to onboarding
      context.go(AppRoutes.onboarding);
    } else {
      // Existing user - check if PIN is set
      final authService = ref.read(authServiceProvider);
      final hasPin = await authService.hasPinSetup();

      if (!mounted) return;

      if (!hasPin) {
        // No PIN set - go to PIN setup
        context.go(AppRoutes.pinSetup);
      } else {
        // Has PIN - go to PIN entry
        context.go(AppRoutes.pinEntry);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.3),
                    blurRadius: 40,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  'assets/icons/hash_icons.png',
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms)
                .scale(
                  begin: const Offset(0.5, 0.5),
                  end: const Offset(1, 1),
                  duration: 600.ms,
                  curve: Curves.elasticOut,
                ),

            const SizedBox(height: 24),

            // Logo text
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                isDark ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/hash_logo_text_white.png',
                height: 32,
                fit: BoxFit.contain,
              ),
            )
                .animate(delay: 300.ms)
                .fadeIn(duration: 500.ms),

            const SizedBox(height: 24),

            // Tagline
            Text(
              AppConstants.appTagline,
              style: AppTypography.headlineSmall(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            )
                .animate(delay: 400.ms)
                .fadeIn(duration: 500.ms),

            const SizedBox(height: 64),

            // Loading indicator
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.accentPrimary.withValues(alpha: 0.5),
                ),
              ),
            )
                .animate(delay: 700.ms)
                .fadeIn(duration: 300.ms),
          ],
        ),
      ),
    );
  }
}
