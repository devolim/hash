import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../widgets/common/hash_text_field.dart';

class EntryPinSettingsScreen extends ConsumerStatefulWidget {
  const EntryPinSettingsScreen({super.key});

  @override
  ConsumerState<EntryPinSettingsScreen> createState() => _EntryPinSettingsScreenState();
}

class _EntryPinSettingsScreenState extends ConsumerState<EntryPinSettingsScreen> {
  void _showChangePinDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: const _ChangePinSheet(),
      ),
    );
  }

  Future<void> _handleBiometricToggle(bool value) async {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.read(appSettingsProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (value) {
      // First, check if biometric is available
      final localAuth = LocalAuthentication();

      try {
        final canCheckBiometrics = await localAuth.canCheckBiometrics;
        final isDeviceSupported = await localAuth.isDeviceSupported();

        if (!canCheckBiometrics || !isDeviceSupported) {
          if (!mounted) return;
          showHashSnackBar(context, message: 'La biométrie n\'est pas disponible sur cet appareil', type: HashSnackBarType.error);
          return;
        }
      } catch (e) {
        if (!mounted) return;
        showHashSnackBar(context, message: 'Erreur lors de l\'authentification biométrique', type: HashSnackBarType.error);
        return;
      }

      if (!mounted) return;

      // Show warning dialog FIRST
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => GlassTheme.wrapAlertDialog(
          context,
          AlertDialog(
            contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            title: Row(
              children: [
                Icon(Icons.warning_amber, color: AppColors.error),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.enableBiometric,
                    style: AppTypography.headlineSmall(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              ],
            ),
            content: Text(
              l10n.biometricWarningMessage,
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  l10n.cancel,
                  style: AppTypography.bodyMedium(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                ),
                child: Text(
                  l10n.understood,
                  style: AppTypography.bodyMedium(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );

      if (confirmed != true) return;
      if (!mounted) return;

      // Then authenticate with biometrics
      try {
        final didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Veuillez vous authentifier pour activer la biométrie',
        );

        if (!didAuthenticate) {
          if (!mounted) return;
          showHashSnackBar(context, message: 'Authentification biométrique échouée', type: HashSnackBarType.error);
          return;
        }
      } catch (e) {
        if (!mounted) return;
        showHashSnackBar(context, message: 'Erreur lors de l\'authentification biométrique', type: HashSnackBarType.error);
        return;
      }

      if (!mounted) return;

      // Sauvegarder la master key en clair dans SecureStorage pour le déverrouillage biométrique
      final authService = ref.read(authServiceProvider);
      final success = await authService.enableBiometricFromSession();
      if (!success) {
        if (mounted) {
          showHashSnackBar(context, message: 'Erreur lors de l\'activation de la biométrie', type: HashSnackBarType.error);
        }
        return;
      }

      if (!mounted) return;
      final newSettings = settings.copyWith(biometricEnabled: true);
      ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
    } else {
      // Disable biometric
      final authService = ref.read(authServiceProvider);
      await authService.disableBiometricUnlock();

      final newSettings = settings.copyWith(biometricEnabled: false);
      ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
    }
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
        title: Text(l10n.pinCode, style: AppTypography.headlineSmall(
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
          _SettingsSection(
            title: l10n.pinCode,
            children: [
              _SettingsTile(
                icon: Icons.pin_outlined,
                title: l10n.changePin,
                onTap: _showChangePinDialog,
              ),
            ],
          ).animate().fadeIn(),

          const SizedBox(height: 16),

          _SettingsSection(
            title: l10n.autoLock,
            children: [
              _SettingsTile(
                icon: Icons.timer_outlined,
                title: l10n.autoLockDelay,
                subtitle: _getAutoLockText(context, settings.autoLockMinutes),
                onTap: () => _showAutoLockPicker(settings.autoLockMinutes),
              ),
            ],
          ).animate().fadeIn(delay: 100.ms),

          const SizedBox(height: 16),

          _SettingsSection(
            title: l10n.biometric,
            children: [
              _SettingsTile(
                icon: Icons.fingerprint,
                title: l10n.biometric,
                subtitle: l10n.biometricUnlock,
                trailing: Switch(
                  value: settings.biometricEnabled,
                  onChanged: (value) => _handleBiometricToggle(value),
                ),
              ),
            ],
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }

  String _getAutoLockText(BuildContext context, int minutes) {
    final l10n = AppLocalizations.of(context)!;
    if (minutes == 0) return l10n.autoLockImmediate;
    if (minutes == 1) return l10n.autoLockMinute;
    return l10n.autoLockMinutes(minutes);
  }

  void _showAutoLockPicker(int currentValue) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text(l10n.autoLockDelay, style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            )),
            const SizedBox(height: 16),
            for (final minutes in [0, 1, 5])
              ListTile(
                title: Text(
                  _getAutoLockText(context, minutes),
                  style: AppTypography.bodyMedium(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                trailing: currentValue == minutes
                    ? Icon(Icons.check, color: GlassTheme.glassIconColor(isDark))
                    : null,
                onTap: () {
                  ref.read(appSettingsProvider.notifier).setAutoLockMinutes(minutes);
                  Navigator.pop(context);
                },
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: AppTypography.labelSmall(
              color: secondaryColor,
            ).copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
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
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
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
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final tertiaryColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: AppColors.accentPrimary.withValues(alpha: 0.08),
        highlightColor: AppColors.accentPrimary.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.accentPrimary,
                size: 24,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyMedium(
                        color: primaryColor,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          subtitle!,
                          style: AppTypography.bodySmall(color: tertiaryColor),
                        ),
                      ),
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else if (onTap != null)
                Icon(
                  Icons.chevron_right_rounded,
                  color: tertiaryColor,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangePinSheet extends ConsumerStatefulWidget {
  const _ChangePinSheet();

  @override
  ConsumerState<_ChangePinSheet> createState() => _ChangePinSheetState();
}

class _ChangePinSheetState extends ConsumerState<_ChangePinSheet> {
  int _step = 0; // 0: current, 1: new, 2: confirm
  String _newPin = '';
  String? _error;
  int _failedAttempts = 0;
  int _pinResetKey = 0;
  bool _isLoading = false;
  static const int _maxSettingsAttempts = 3;

  void _onPinEntered(String pin) async {
    final l10n = AppLocalizations.of(context)!;
    switch (_step) {
      case 0:
        setState(() => _isLoading = true);

        final authService = ref.read(authServiceProvider);
        // Vérification locale uniquement — pas de rate limiting global
        final success = await authService.verifyPinOnly(pin);

        if (!mounted) return;

        if (success) {
          setState(() {
            _step = 1;
            _error = null;
            _isLoading = false;
            _failedAttempts = 0;
          });
        } else {
          _failedAttempts++;
          if (_failedAttempts >= _maxSettingsAttempts) {
            Navigator.pop(context);
            showHashSnackBar(context, message: l10n.tooManyAttempts, type: HashSnackBarType.error);
            return;
          }
          setState(() {
            _isLoading = false;
            _pinResetKey++;
            _error = l10n.incorrectPin;
          });
        }
        break;

      case 1:
        setState(() {
          _newPin = pin;
          _step = 2;
          _error = null;
        });
        break;

      case 2:
        if (pin == _newPin) {
          setState(() => _isLoading = true);
          final authService = ref.read(authServiceProvider);
          await authService.setupPin(pin);
          if (!mounted) return;
          Navigator.pop(context);
          showHashSnackBar(context, message: l10n.pinChanged, type: HashSnackBarType.success);
        } else {
          setState(() {
            _error = l10n.pinsDoNotMatch;
            _step = 1;
            _pinResetKey++;
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _step == 0
                ? l10n.currentPin
                : _step == 1
                    ? l10n.newPin
                    : l10n.confirmPin,
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 24),
          if (!_isLoading)
            HashPinField(
              key: ValueKey('pin_step_${_step}_$_pinResetKey'),
              onCompleted: _onPinEntered,
              autofocus: true,
            ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
              ),
            ),
          if (_error != null) ...[
            const SizedBox(height: 16),
            Text(
              _error!,
              style: AppTypography.bodyMedium(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
