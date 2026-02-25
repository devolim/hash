import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../providers/app_providers.dart';
import '../../widgets/common/hash_button.dart';
import '../../widgets/common/hash_snack_bar.dart';

/// Écran affiché sur l'ancien appareil après un transfert de compte
/// L'utilisateur doit se déconnecter et supprimer les données locales
class AccountTransferredScreen extends ConsumerStatefulWidget {
  const AccountTransferredScreen({super.key});

  @override
  ConsumerState<AccountTransferredScreen> createState() =>
      _AccountTransferredScreenState();
}

class _AccountTransferredScreenState
    extends ConsumerState<AccountTransferredScreen> {
  bool _isLoading = false;

  Future<void> _logout() async {
    setState(() => _isLoading = true);

    try {
      // Supprimer les données locales
      final authService = ref.read(authServiceProvider);
      await authService.clearAllLocalData();

      // Réinitialiser les providers
      ref.read(currentUserProvider.notifier).clearUser();

      if (!mounted) return;

      // Rediriger vers l'onboarding
      context.go(AppRoutes.onboarding);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);

      showHashSnackBar(context, message: 'Erreur: $e', type: HashSnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.phone_android_outlined,
                  size: 50,
                  color: AppColors.warning,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .scale(begin: const Offset(0.8, 0.8)),

              const SizedBox(height: 32),

              // Title
              Text(
                'Compte transféré',
                style: AppTypography.headlineMedium().copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

              const SizedBox(height: 16),

              // Description
              Text(
                'Votre compte a été transféré vers un autre appareil.\n\n'
                'Cet appareil n\'est plus autorisé à accéder à votre compte Hash.',
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

              const SizedBox(height: 32),

              // Info box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.06)
                        : Colors.black.withValues(alpha: 0.04),
                    width: 0.5,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Si vous n\'avez pas effectué ce transfert, votre compte pourrait être compromis.',
                        style: AppTypography.bodySmall(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 600.ms, duration: 600.ms),

              const Spacer(),

              // Logout button
              HashButton(
                text: _isLoading ? 'Déconnexion...' : 'Se déconnecter',
                onPressed: _isLoading ? null : _logout,
                width: double.infinity,
                variant: HashButtonVariant.danger,
              ).animate().fadeIn(delay: 800.ms, duration: 600.ms),

              const SizedBox(height: 16),

              // Optional: Create new account
              TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        _logout();
                      },
                child: Text(
                  'Créer un nouveau compte',
                  style: AppTypography.bodySmall(
                    color: AppColors.accentPrimary,
                  ),
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 600.ms),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
