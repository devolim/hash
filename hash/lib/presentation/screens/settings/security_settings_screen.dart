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

class SecuritySettingsScreen extends ConsumerStatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  ConsumerState<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends ConsumerState<SecuritySettingsScreen> {
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
          showHashSnackBar(context, message: l10n.biometricNotAvailable, type: HashSnackBarType.error);
          return;
        }
      } catch (e) {
        if (!mounted) return;
        showHashSnackBar(context, message: l10n.biometricAuthError, type: HashSnackBarType.error);
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
          localizedReason: l10n.authenticateForBiometric,
        );

        if (!didAuthenticate) {
          if (!mounted) return;
          showHashSnackBar(context, message: l10n.biometricAuthFailed, type: HashSnackBarType.error);
          return;
        }
      } catch (e) {
        if (!mounted) return;
        showHashSnackBar(context, message: l10n.biometricAuthError, type: HashSnackBarType.error);
        return;
      }

      if (!mounted) return;

      // Sauvegarder la master key en clair dans SecureStorage pour le déverrouillage biométrique
      final authService = ref.read(authServiceProvider);
      final success = await authService.enableBiometricFromSession();
      if (!success) {
        if (mounted) {
          showHashSnackBar(context, message: l10n.biometricAuthError, type: HashSnackBarType.error);
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
        title: Text(l10n.security, style: AppTypography.headlineSmall(
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
          // Code PIN pour rentrer dans l'application
          _SettingsSection(
            title: l10n.pinCodeForEntry,
            children: [
              _SettingsTile(
                icon: Icons.pin_outlined,
                title: l10n.changePin,
                onTap: _showChangePinDialog,
              ),
              Divider(height: 1, color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
              _SettingsTile(
                icon: Icons.timer_outlined,
                title: l10n.autoLockDelay,
                subtitle: _getAutoLockText(context, settings.autoLockMinutes),
                onTap: () => _showAutoLockPicker(settings.autoLockMinutes),
              ),
              Divider(height: 1, color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
              _SettingsTile(
                icon: Icons.fingerprint,
                title: l10n.biometric,
                subtitle: l10n.biometricUnlock,
                trailing: Switch(
                  value: settings.biometricEnabled,
                  onChanged: (value) => _handleBiometricToggle(value),
                ),
              ),
              Divider(height: 1, color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
              _SettingsTile(
                icon: Icons.dangerous_outlined,
                title: 'Destruction totale (10 tentatives)',
                subtitle: settings.destructionOnMaxAttempts
                    ? 'Activé : destruction des données + mode Vash'
                    : 'Désactivé : verrouillage du compte',
                trailing: Switch(
                  value: settings.destructionOnMaxAttempts,
                  onChanged: (value) {
                    final newSettings = settings.copyWith(destructionOnMaxAttempts: value);
                    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                  },
                ),
              ),
            ],
          ).animate().fadeIn(),

          const SizedBox(height: 16),

          // Mode Vash
          _SettingsSection(
            title: l10n.vashCodeSection,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description
                    Text(
                      l10n.vashCodeInfo,
                      style: AppTypography.bodyMedium(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.vashCodeInfoDetail,
                      style: AppTypography.bodySmall(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    _VashInfoItem(
                      icon: Icons.chat_bubble_outline,
                      text: l10n.vashDeleteMessages,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 8),
                    _VashInfoItem(
                      icon: Icons.people_outline,
                      text: l10n.vashDeleteContacts,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 8),
                    _VashInfoItem(
                      icon: Icons.note_outlined,
                      text: l10n.vashDeleteHistory,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.accentPrimary.withValues(alpha: 0.1)
                            : const Color(0x0A000000),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark
                              ? AppColors.accentPrimary.withValues(alpha: 0.3)
                              : const Color(0x14000000),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.badge_outlined,
                            color: isDark ? AppColors.accentPrimary : const Color(0xFF666666),
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
                    Text(
                      l10n.vashAppearNormal,
                      style: AppTypography.bodySmall(
                        color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
              _SettingsTile(
                icon: Icons.shield_outlined,
                title: _hasDuressPin ? l10n.modifyVashCode : l10n.setupVashCode,
                onTap: _showSetupDuressPinDialog,
              ),
            ],
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 32),

          // Security info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.shield_outlined,
                      color: AppColors.success,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      l10n.yourSecurity,
                      style: AppTypography.labelLarge(color: AppColors.success),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.securityInfo,
                  style: AppTypography.bodySmall(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms),
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
            for (final minutes in [0, 1, 5, 15, 30])
              ListTile(
                title: Text(
                  _getAutoLockText(context, minutes),
                  style: AppTypography.bodyMedium(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                trailing: currentValue == minutes
                    ? const Icon(Icons.check, color: AppColors.accentPrimary)
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
  final bool isDanger;

  const _SettingsSection({
    required this.title,
    required this.children,
    this.isDanger = false,
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
              color: isDanger ? AppColors.error : secondaryColor,
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
            border: isDanger
                ? Border.all(color: AppColors.error.withValues(alpha: 0.25))
                : Border.all(
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
          child: Column(children: children),
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
  final Color? textColor;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final tertiaryColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
    final iconTint = textColor ?? AppColors.accentPrimary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: iconTint.withValues(alpha: 0.08),
        highlightColor: iconTint.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconTint,
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
                        color: textColor ?? primaryColor,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          subtitle!,
                          style: AppTypography.bodySmall(
                            color: textColor?.withValues(alpha: 0.7) ??
                                tertiaryColor,
                          ),
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

  void _onPinEntered(String pin) async {
    final l10n = AppLocalizations.of(context)!;
    switch (_step) {
      case 0:
        final authService = ref.read(authServiceProvider);
        // Connecter les services de sécurité
        authService.setPinSecurityService(ref.read(pinSecurityServiceProvider));
        authService.setRecoverySecurityService(ref.read(recoverySecurityServiceProvider));

        final result = await authService.verifyPin(pin);
        if (result == AuthPinResult.success) {
          setState(() {
            _step = 1;
            _error = null;
          });
        } else {
          setState(() => _error = l10n.incorrectPin);
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
          final authService = ref.read(authServiceProvider);
          await authService.setupPin(pin);
          if (!mounted) return;
          Navigator.pop(context);
          showHashSnackBar(context, message: l10n.pinChanged, type: HashSnackBarType.success);
        } else {
          setState(() {
            _error = l10n.pinsDoNotMatch;
            _step = 1;
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
          HashPinField(
            key: ValueKey('pin_step_$_step'),
            onCompleted: _onPinEntered,
          ),
          if (_error != null) ...[
            const SizedBox(height: 16),
            Text(
              _error!,
              style: AppTypography.bodyMedium(color: AppColors.error),
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class DuressPinSheet extends ConsumerStatefulWidget {
  final VoidCallback onComplete;
  final bool hasDuressPin;

  const DuressPinSheet({
    super.key,
    required this.onComplete,
    required this.hasDuressPin,
  });

  @override
  ConsumerState<DuressPinSheet> createState() => _DuressPinSheetState();
}

class _DuressPinSheetState extends ConsumerState<DuressPinSheet> {
  // Flow (same for creation and modification):
  // 0: verify regular PIN, 1: new duress PIN, 2: confirm
  int _step = 0;
  String _newPin = '';
  String? _error;
  bool _isLoading = false;
  bool _isRateLimited = false;
  int _remainingSeconds = 0;
  int _attemptCount = 0;
  int _maxAttempts = 10;

  @override
  void initState() {
    super.initState();
    _checkRateLimit();
  }

  Future<void> _checkRateLimit() async {
    final pinSecurity = ref.read(pinSecurityServiceProvider);
    final status = await pinSecurity.checkCanAttempt();

    if (!mounted) return;
    setState(() {
      _isRateLimited = !status.canAttempt;
      _remainingSeconds = status.remainingSeconds;
      _attemptCount = status.attemptCount;
      _maxAttempts = status.maxAttempts;
    });

    if (_isRateLimited && _remainingSeconds > 0) {
      _startCountdown();
    }
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
        _startCountdown();
      } else {
        _checkRateLimit();
      }
    });
  }

  int get _totalSteps => 3;

  int get _newPinStep => 1;
  int get _confirmStep => 2;

  String _getStepTitle(AppLocalizations l10n) {
    if (_step == 0) return l10n.currentPin;
    if (_step == _newPinStep) return l10n.newVashCode;
    return l10n.confirmVashCode;
  }

  String _getStepSubtitle(AppLocalizations l10n) {
    if (_step == 0) return l10n.currentPin;
    if (_step == _newPinStep) return l10n.vashCreateSubtitle;
    return l10n.vashConfirmSubtitle;
  }

  void _onPinEntered(String pin) async {
    if (_isLoading || _isRateLimited) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      if (_step == 0) {
        // Verify current regular PIN
        await _verifyRegularPin(pin);
      } else if (_step == _newPinStep) {
        // Enter new duress PIN
        await _setNewPin(pin);
      } else if (_step == _confirmStep) {
        // Confirm new duress PIN
        await _confirmNewPin(pin);
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _verifyRegularPin(String pin) async {
    final l10n = AppLocalizations.of(context)!;
    final authService = ref.read(authServiceProvider);
    final pinSecurity = ref.read(pinSecurityServiceProvider);

    // Connect security services
    authService.setDestructionService(ref.read(destructionServiceProvider));
    authService.setPinSecurityService(pinSecurity);
    authService.setRecoverySecurityService(ref.read(recoverySecurityServiceProvider));

    final result = await authService.verifyPin(pin);

    if (result == AuthPinResult.success) {
      // Reset attempt count on success
      await pinSecurity.recordSuccessfulAttempt();
      setState(() {
        _step = 1;
        _error = null;
      });
    } else if (result == AuthPinResult.rateLimited) {
      await _checkRateLimit();
    } else {
      // Record failed attempt
      final status = await pinSecurity.recordFailedAttempt();
      setState(() {
        _error = l10n.incorrectPin;
        _attemptCount = status.attemptCount;
        if (!status.canAttempt) {
          _isRateLimited = true;
          _remainingSeconds = status.remainingSeconds;
          _startCountdown();
        }
      });
    }
  }

  Future<void> _setNewPin(String pin) async {
    final l10n = AppLocalizations.of(context)!;
    final authService = ref.read(authServiceProvider);

    // Check that new duress PIN is different from regular PIN
    final isSameAsRegular = await authService.verifyPin(pin) == AuthPinResult.success;
    if (isSameAsRegular) {
      setState(() {
        _error = l10n.vashCodeMustDiffer;
      });
      return;
    }

    setState(() {
      _newPin = pin;
      _step = _confirmStep;
      _error = null;
    });
  }

  Future<void> _confirmNewPin(String pin) async {
    final l10n = AppLocalizations.of(context)!;
    if (pin == _newPin) {
      final authService = ref.read(authServiceProvider);
      await authService.setupDuressPin(pin);
      widget.onComplete();
      if (!mounted) return;
      Navigator.pop(context);
      showHashSnackBar(context, message: widget.hasDuressPin ? l10n.vashCodeModified : l10n.vashCodeConfigured, type: HashSnackBarType.success);
    } else {
      setState(() {
        _error = l10n.pinsDoNotMatch;
        _step = _newPinStep;
        _newPin = '';
      });
    }
  }

  String _formatTime(int seconds) {
    if (seconds < 60) {
      return '$seconds sec';
    } else if (seconds < 3600) {
      final minutes = seconds ~/ 60;
      final secs = seconds % 60;
      if (secs > 0) {
        return '${minutes}m ${secs}s';
      }
      return '$minutes min';
    } else {
      final hours = seconds ~/ 3600;
      final minutes = (seconds % 3600) ~/ 60;
      if (minutes > 0) {
        return '${hours}h ${minutes}m';
      }
      return '${hours}h';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

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

          // Step indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_totalSteps, (index) {
              final isActive = index == _step;
              final isCompleted = index < _step;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive
                    ? AppColors.accentPrimary
                    : isCompleted
                      ? AppColors.accentPrimary.withValues(alpha: 0.5)
                      : secondaryColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),

          const SizedBox(height: 24),
          const Icon(Icons.shield_outlined, color: AppColors.accentPrimary, size: 48),
          const SizedBox(height: 16),
          Text(
            _getStepTitle(l10n),
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _getStepSubtitle(l10n),
            style: AppTypography.bodySmall(color: secondaryColor),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          if (_isRateLimited) ...[
            // Rate limited state
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  const Icon(Icons.timer_outlined, color: AppColors.error, size: 32),
                  const SizedBox(height: 12),
                  Text(
                    l10n.tooManyAttempts,
                    style: AppTypography.labelLarge(color: AppColors.error),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.retryIn(_formatTime(_remainingSeconds)),
                    style: AppTypography.bodyMedium(color: secondaryColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.attemptCount(_attemptCount, _maxAttempts),
                    style: AppTypography.bodySmall(color: secondaryColor),
                  ),
                ],
              ),
            ),
          ] else ...[
            // PIN entry field
            HashPinField(
              key: ValueKey('duress_step_${_step}_$_attemptCount'),
              onCompleted: _onPinEntered,
              enabled: !_isLoading,
            ),

            if (_isLoading) ...[
              const SizedBox(height: 16),
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ],

            // Attempt counter for verification steps
            if (_step < _newPinStep && _attemptCount > 0) ...[
              const SizedBox(height: 12),
              Text(
                l10n.attemptCount(_attemptCount + 1, _maxAttempts),
                style: AppTypography.bodySmall(color: secondaryColor),
              ),
            ],
          ],

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

class _VashInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isDark;

  const _VashInfoItem({
    required this.icon,
    required this.text,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.accentPrimary.withValues(alpha: 0.8),
          size: 18,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodySmall(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ),
      ],
    );
  }
}

class VashCheckItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isDark;

  const VashCheckItem({
    super.key,
    required this.icon,
    required this.text,
    this.subtitle,
    required this.value,
    required this.onChanged,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                icon,
                color: value
                    ? (isDark ? AppColors.accentPrimary.withValues(alpha: 0.8) : const Color(0xFF3A3A3A))
                    : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: AppTypography.bodyMedium(
                      color: value
                          ? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight)
                          : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: AppTypography.bodySmall(
                        color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Checkbox(
              value: value,
              onChanged: (newValue) => onChanged(newValue ?? false),
              activeColor: isDark ? AppColors.accentPrimary : const Color(0xFF3A3A3A),
            ),
          ],
        ),
      ),
    );
  }
}
