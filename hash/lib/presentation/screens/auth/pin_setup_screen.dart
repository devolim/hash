import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/router/app_router.dart';
import '../../../core/services/crypto_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import '../../widgets/common/hash_button.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../widgets/common/hash_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/legal_urls.dart';

enum PinSetupStep {
  createPin,
  confirmPin,
  explainVash,
  createVashPin,
  confirmVashPin,
  showRecoveryPhrase,
  consentAndCreate,
}

class PinSetupScreen extends ConsumerStatefulWidget {
  const PinSetupScreen({super.key});

  @override
  ConsumerState<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends ConsumerState<PinSetupScreen> {
  PinSetupStep _currentStep = PinSetupStep.createPin;
  String _mainPin = '';
  String _confirmMainPin = '';
  String _vashPin = '';
  String _confirmVashPin = '';
  String _recoveryPhrase = '';
  bool _isLoading = false;
  String? _error;
  bool _showVashIcon = true;
  Timer? _vashIconTimer;

  // Consent & ephemeral state
  bool _ageConfirmed = false;
  bool _termsAccepted = false;
  int _selectedDuration = 60; // 1 minute default
  bool _sendReadReceipts = true;

  final CryptoService _cryptoService = CryptoService();

  bool _isWeakPin(String pin) {
    // Tous les chiffres identiques (000000, 111111, etc.)
    if (pin.split('').toSet().length == 1) return true;
    // Séquences croissantes/décroissantes
    const sequences = [
      '012345', '123456', '234567', '345678', '456789',
      '567890', '678901', '789012', '890123', '901234',
      '543210', '654321', '765432', '876543', '987654',
      '098765', '109876', '210987', '321098', '432109',
    ];
    if (sequences.contains(pin)) return true;
    // Motifs répétitifs (121212, 123123, etc.)
    if (pin.length == 6) {
      final half = pin.substring(0, 3);
      if (half + half == pin) return true;
      final pair = pin.substring(0, 2);
      if (pair + pair + pair == pin) return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    // Generate recovery phrase upfront using CryptoService
    _recoveryPhrase = _cryptoService.generateRecoveryPhrase();

    // Alternate VASH icon every 3 seconds
    _vashIconTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (mounted) {
        setState(() => _showVashIcon = !_showVashIcon);
      }
    });
  }

  @override
  void dispose() {
    _vashIconTimer?.cancel();
    super.dispose();
  }

  void _onPinEntered(String pin) {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _error = null);

    switch (_currentStep) {
      case PinSetupStep.createPin:
        if (_isWeakPin(pin)) {
          setState(() => _error = l10n.pinTooSimple);
          return;
        }
        _mainPin = pin;
        setState(() => _currentStep = PinSetupStep.confirmPin);
        break;

      case PinSetupStep.confirmPin:
        _confirmMainPin = pin;
        if (_mainPin != _confirmMainPin) {
          setState(() {
            _error = l10n.pinsDoNotMatch;
            _currentStep = PinSetupStep.createPin;
            _mainPin = '';
            _confirmMainPin = '';
          });
        } else {
          setState(() => _currentStep = PinSetupStep.explainVash);
        }
        break;

      case PinSetupStep.explainVash:
        // Not used - handled by button
        break;

      case PinSetupStep.createVashPin:
        if (pin == _mainPin) {
          setState(() {
            _error = l10n.vashCodeMustDiffer;
          });
        } else if (_isWeakPin(pin)) {
          setState(() => _error = l10n.pinTooSimple);
        } else {
          _vashPin = pin;
          setState(() => _currentStep = PinSetupStep.confirmVashPin);
        }
        break;

      case PinSetupStep.confirmVashPin:
        _confirmVashPin = pin;
        if (_vashPin != _confirmVashPin) {
          setState(() {
            _error = l10n.pinsDoNotMatch;
            _currentStep = PinSetupStep.createVashPin;
            _vashPin = '';
            _confirmVashPin = '';
          });
        } else {
          setState(() => _currentStep = PinSetupStep.showRecoveryPhrase);
        }
        break;

      case PinSetupStep.showRecoveryPhrase:
        // Not used in this step
        break;

      case PinSetupStep.consentAndCreate:
        // Not used - handled by button
        break;
    }
  }

  Future<void> _completeSetup() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final authService = ref.read(authServiceProvider);

      // Save main PIN (also initializes Hive cipher)
      await authService.setupPin(_mainPin);

      // Save Vash PIN
      await authService.setupDuressPin(_vashPin);

      // Save recovery phrase
      await authService.saveRecoveryPhrase(_recoveryPhrase);

      // Check if user is already registered AND has a valid Supabase session
      final userRepo = ref.read(userRepositoryProvider);
      final isRegistered = await userRepo.isRegistered();
      final hasSession = Supabase.instance.client.auth.currentSession != null;

      if (!mounted) return;

      if (isRegistered && hasSession) {
        // Save ephemeral duration preference (must be after setupPin which sets the Hive cipher)
        final newSettings = ref.read(appSettingsProvider).copyWith(
          defaultEphemeralDuration: _selectedDuration,
          sendReadReceipts: _sendReadReceipts,
        );
        await ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
        context.go(AppRoutes.home);
      } else {
        // No registration or stale session (e.g. after account deletion)
        // Clear any leftover secure storage before re-registering
        if (isRegistered && !hasSession) {
          final secureStorage = ref.read(secureStorageProvider);
          await secureStorage.deleteAll();
          // Re-save PIN and recovery phrase since we just deleted them
          await authService.setupPin(_mainPin);
          await authService.setupDuressPin(_vashPin);
          await authService.saveRecoveryPhrase(_recoveryPhrase);
        }
        await _createAccount().timeout(
          const Duration(seconds: 30),
          onTimeout: () {
            throw TimeoutException('Account creation timed out');
          },
        );
        // Save ephemeral duration preference AFTER _createAccount
        // (_createAccount calls deleteAllData which resets settings to defaults)
        final newSettings = ref.read(appSettingsProvider).copyWith(
          defaultEphemeralDuration: _selectedDuration,
          sendReadReceipts: _sendReadReceipts,
        );
        await ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
      }
    } catch (e, stack) {
      debugPrint('[PinSetup] Error in _completeSetup: $e');
      debugPrint('[PinSetup] Stack: $stack');
      if (!mounted) return;
      setState(() {
        _error = _formatError(e);
        _isLoading = false;
      });
    }
  }

  String _formatError(Object e) {
    final errorStr = e.toString();
    if (errorStr.contains('SocketException') ||
        errorStr.contains('Failed host lookup') ||
        errorStr.contains('ClientException') ||
        errorStr.contains('NetworkException')) {
      final l10n = AppLocalizations.of(context)!;
      return l10n.noInternetError;
    }
    if (e is TimeoutException) {
      final l10n = AppLocalizations.of(context)!;
      return l10n.timeoutError;
    }
    // Show the actual error for debugging
    final cleaned = errorStr.replaceFirst('Exception: ', '').replaceFirst('Error: ', '');
    return cleaned;
  }

  Future<void> _createAccount() async {
    try {
      // Clear any stale local data (contacts, messages, sessions) from a
      // previous account so the new account starts clean.
      await ref.read(localStorageProvider).deleteAllData();
      clearAllProviderState(ref);

      final userRepo = ref.read(userRepositoryProvider);

      // Generate real Signal Protocol keys (libsignal Curve25519)
      debugPrint('[PinSetup] Generating Signal Protocol keys...');
      final keyBundle = _cryptoService.generateRegistrationKeys();
      debugPrint('[PinSetup] Keys generated successfully');

      // Register user with real cryptographic keys
      debugPrint('[PinSetup] Registering user...');
      final user = await userRepo.registerUser(
        identityPublicKey: keyBundle.identityPublicKey,
        identityPrivateKey: keyBundle.identityPrivateKey,
        registrationId: keyBundle.registrationId,
        signedPrekeyPublic: keyBundle.signedPrekeyPublic,
        signedPrekeySignature: keyBundle.signedPrekeySignature,
        signedPrekeyId: keyBundle.signedPrekeyId,
        prekeys: keyBundle.prekeysForServer,
      );
      debugPrint('[PinSetup] User registered: ${user.hashId}');

      // Store signed prekey (public + private) locally for later use
      final secureStorage = ref.read(secureStorageProvider);
      await secureStorage.saveSignedPrekey(
        publicKey: keyBundle.signedPrekeyPublic,
        privateKey: keyBundle.signedPrekeyPrivate,
      );

      // Store prekey private keys (needed for decryption)
      for (final prekey in keyBundle.prekeys) {
        await secureStorage.write(
          'prekey_private_${prekey['keyId']}',
          prekey['privateKey'] as String,
        );
      }

      // Store libsignal prekey records in SignalProtocolService
      // (will be initialized after PIN unlock in HomeScreen)
      final signalService = ref.read(signalProtocolServiceProvider);
      if (signalService.isInitialized) {
        await signalService.storePreKeys(keyBundle.preKeyRecords);
        await signalService.storeSignedPreKey(keyBundle.signedPreKeyRecord);
      }

      debugPrint('[PinSetup] Account created: ${user.hashId}');

      ref.read(currentUserProvider.notifier).setUser(user);

      if (!mounted) return;
      context.go(AppRoutes.home);
    } catch (e, stack) {
      debugPrint('[PinSetup] Error creating account: $e');
      debugPrint('[PinSetup] Stack: $stack');
      if (!mounted) return;
      setState(() {
        _error = _formatError(e);
        _isLoading = false;
      });
    }
  }

  void _goBack() {
    setState(() => _error = null);

    switch (_currentStep) {
      case PinSetupStep.createPin:
        context.go(AppRoutes.onboarding);
        break;
      case PinSetupStep.confirmPin:
        setState(() {
          _currentStep = PinSetupStep.createPin;
          _mainPin = '';
        });
        break;
      case PinSetupStep.explainVash:
        setState(() {
          _currentStep = PinSetupStep.confirmPin;
          _confirmMainPin = '';
        });
        break;
      case PinSetupStep.createVashPin:
        setState(() {
          _currentStep = PinSetupStep.explainVash;
        });
        break;
      case PinSetupStep.confirmVashPin:
        setState(() {
          _currentStep = PinSetupStep.createVashPin;
          _vashPin = '';
        });
        break;
      case PinSetupStep.showRecoveryPhrase:
        setState(() {
          _currentStep = PinSetupStep.confirmVashPin;
          _confirmVashPin = '';
        });
        break;
      case PinSetupStep.consentAndCreate:
        setState(() {
          _currentStep = PinSetupStep.showRecoveryPhrase;
        });
        break;
    }
  }

  void _copyRecoveryPhrase() {
    final l10n = AppLocalizations.of(context)!;
    Clipboard.setData(ClipboardData(text: _recoveryPhrase));
    showHashSnackBar(context, message: l10n.phraseCopiedToClipboard, type: HashSnackBarType.success);
  }

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: GlassTheme.glassIconColor(isDark)),
          onPressed: _goBack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
        child: _currentStep == PinSetupStep.consentAndCreate
            ? _buildConsentAndCreateScreen(isDark)
            : _currentStep == PinSetupStep.showRecoveryPhrase
                ? _buildRecoveryPhraseScreen(isDark)
                : _currentStep == PinSetupStep.explainVash
                    ? _buildVashExplanationScreen(isDark)
                    : _buildPinScreen(isDark),
      ),
    );
  }

  Widget _buildPinScreen(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    final isVashStep = _currentStep == PinSetupStep.createVashPin ||
        _currentStep == PinSetupStep.confirmVashPin;

    final title = switch (_currentStep) {
      PinSetupStep.createPin => l10n.createPin,
      PinSetupStep.confirmPin => l10n.confirmPin,
      PinSetupStep.explainVash => '',
      PinSetupStep.createVashPin => l10n.vashCode,
      PinSetupStep.confirmVashPin => l10n.confirmVashCode,
      PinSetupStep.showRecoveryPhrase => '',
      PinSetupStep.consentAndCreate => '',
    };

    final subtitle = switch (_currentStep) {
      PinSetupStep.createPin => l10n.createPinSubtitle,
      PinSetupStep.confirmPin => l10n.confirmPinSubtitle,
      PinSetupStep.explainVash => '',
      PinSetupStep.createVashPin =>
        l10n.vashCreateSubtitle,
      PinSetupStep.confirmVashPin => l10n.vashConfirmSubtitle,
      PinSetupStep.showRecoveryPhrase => '',
      PinSetupStep.consentAndCreate => '',
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),

                // Icon
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    isVashStep
                        ? 'assets/images/mode_vash.png'
                        : 'assets/icons/hash_icons.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ).animate(key: ValueKey(_currentStep)).fadeIn().scale(),

                const SizedBox(height: 32),

                // Title
                Text(
                  title,
                  style: AppTypography.headlineLarge(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                  textAlign: TextAlign.center,
                ).animate(key: ValueKey('title_$_currentStep')).fadeIn().slideY(begin: 0.2, end: 0),

                const SizedBox(height: 12),

                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    subtitle,
                    style: AppTypography.bodyMedium(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ).animate(key: ValueKey('sub_$_currentStep')).fadeIn(delay: 100.ms),

                const SizedBox(height: 48),

                if (_error != null) ...[
                  Text(
                    _error!,
                    style: AppTypography.bodyMedium(color: AppColors.error),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn().shake(),
                  const SizedBox(height: 24),
                ],

                // PIN input
                HashPinField(
                  key: ValueKey('pin_$_currentStep'),
                  onCompleted: _onPinEntered,
                  autofocus: true,
                ),

                const SizedBox(height: 48),

                // Step indicator
                _buildStepIndicator(),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepIndicator() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final steps = [
      PinSetupStep.createPin,
      PinSetupStep.confirmPin,
      PinSetupStep.explainVash,
      PinSetupStep.createVashPin,
      PinSetupStep.confirmVashPin,
      PinSetupStep.showRecoveryPhrase,
      PinSetupStep.consentAndCreate,
    ];
    final currentIndex = steps.indexOf(_currentStep);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(steps.length, (index) {
        final isActive = index <= currentIndex;

        return Container(
          width: index == currentIndex ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.accentPrimary
                : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildVashExplanationScreen(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),

                // VASH icon with crossfade animation
                AnimatedCrossFade(
                  firstChild: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/mode_vash.png',
                      fit: BoxFit.contain,
                      width: 90,
                      height: 90,
                    ),
                  ),
                  secondChild: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/icons/hash_icons.png',
                      fit: BoxFit.contain,
                      width: 90,
                      height: 90,
                    ),
                  ),
                  crossFadeState: _showVashIcon
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 1500),
                  firstCurve: Curves.easeInOut,
                  secondCurve: Curves.easeInOut,
                ).animate().fadeIn().scale(),

                const SizedBox(height: 28),

                // Title
                Text(
                  l10n.vashModeTitle,
                  style: AppTypography.headlineLarge(
                    color: AppColors.error,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn().slideY(begin: 0.2, end: 0),

                const SizedBox(height: 8),

                // Tagline
                Text(
                  l10n.vashModeExplanation,
                  style: AppTypography.bodyLarge(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 100.ms),

                const SizedBox(height: 28),

                // Explanation
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.04),
                    ),
                  ),
                  child: Text(
                    l10n.vashModeDescription,
                    style: AppTypography.bodyMedium(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ).animate().fadeIn(delay: 200.ms),

                const SizedBox(height: 16),

                // Irreversible warning
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          l10n.vashModeIrreversible,
                          style: AppTypography.bodySmall(color: AppColors.error),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 300.ms),

                const SizedBox(height: 32),

                // CTA button
                HashButton(
                  text: l10n.chooseVashCode,
                  variant: HashButtonVariant.danger,
                  onPressed: () {
                    setState(() => _currentStep = PinSetupStep.createVashPin);
                  },
                  width: double.infinity,
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 16),

                // Step indicator
                _buildStepIndicator(),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecoveryPhraseScreen(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    final words = _recoveryPhrase.split(' ');

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 16),

          // Icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.key,
              size: 40,
              color: AppColors.warning,
            ),
          ).animate().fadeIn().scale(),

          const SizedBox(height: 24),

          // Title
          Text(
            l10n.saveRecoveryPhrase,
            style: AppTypography.headlineLarge(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),

          const SizedBox(height: 16),

          // Warning
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning_amber, color: AppColors.error),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.recoveryPhraseSecurityWarning,
                    style: AppTypography.bodySmall(color: AppColors.error),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms),

          const SizedBox(height: 24),

          // Recovery phrase grid
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
              ),
            ),
            child: Column(
              children: [
                for (int row = 0; row < 8; row++)
                  Padding(
                    padding: EdgeInsets.only(bottom: row < 7 ? 10 : 0),
                    child: Row(
                      children: [
                        for (int col = 0; col < 3; col++)
                          Expanded(
                            child: _buildWordChip(
                              row * 3 + col + 1,
                              words[row * 3 + col],
                              isDark,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 16),

          // Copy button
          TextButton.icon(
            onPressed: _copyRecoveryPhrase,
            icon: const Icon(Icons.copy, size: 18),
            label: Text(l10n.copyPhrase),
          ).animate().fadeIn(delay: 300.ms),

          const SizedBox(height: 32),

          // Confirm button
          HashButton(
            text: l10n.phraseWritten,
            onPressed: () {
              setState(() => _currentStep = PinSetupStep.consentAndCreate);
            },
            width: double.infinity,
          ).animate().fadeIn(delay: 400.ms),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    }
  }

  Widget _buildConsentAndCreateScreen(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    final canCreate = _ageConfirmed && _termsAccepted;

    final durations = <(int, String, bool)>[
      (60, '1 minute', true),
      (5 * 60, '5 minutes', false),
      (15 * 60, '15 minutes', false),
      (30 * 60, '30 minutes', false),
      (60 * 60, '1 heure', false),
      (3 * 60 * 60, '3 heures', false),
      (6 * 60 * 60, '6 heures', false),
      (12 * 60 * 60, '12 heures', false),
      (24 * 60 * 60, '24 heures', false),
      (3 * 24 * 60 * 60, '3 jours', false),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                const SizedBox(height: 16),

                // App icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/icons/hash_icons.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ).animate().fadeIn().scale(),

                const SizedBox(height: 24),

                // Title
                Text(
                  l10n.lastStepTitle,
                  style: AppTypography.headlineLarge(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn().slideY(begin: 0.2, end: 0),

                const SizedBox(height: 24),

                // Ephemeral duration subtitle
                Text(
                  l10n.ephemeralDeviceDuration,
                  style: AppTypography.bodyLarge(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 100.ms),

                const SizedBox(height: 16),

                // Duration floating menu
                GestureDetector(
                  onTap: () async {
                    final selected = await showDialog<int>(
                      context: context,
                      builder: (ctx) => GlassTheme.dialogWrapper(
                        isDark: isDark,
                        child: SimpleDialog(
                          elevation: 0,
                          titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                          contentPadding: const EdgeInsets.only(bottom: 8),
                          title: Text(
                            l10n.ephemeralDeviceDuration,
                            style: AppTypography.bodyLarge(
                              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                            ),
                          ),
                          children: durations.map((d) {
                            final isSelected = _selectedDuration == d.$1;
                            return SimpleDialogOption(
                              onPressed: () => Navigator.pop(ctx, d.$1),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Row(
                                children: [
                                  Icon(
                                    isSelected ? Icons.check_circle : Icons.circle_outlined,
                                    size: 20,
                                    color: isSelected
                                        ? AppColors.accentPrimary
                                        : (isDark ? Colors.white24 : Colors.black26),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      d.$2,
                                      style: AppTypography.bodyLarge(
                                        color: isSelected
                                            ? AppColors.accentPrimary
                                            : (isDark
                                                ? AppColors.textPrimaryDark
                                                : AppColors.textPrimaryLight),
                                      ),
                                    ),
                                  ),
                                  if (d.$3)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: AppColors.accentPrimary.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        l10n.ephemeralChooseDefault,
                                        style: AppTypography.labelSmall(color: AppColors.accentPrimary),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                    if (selected != null) {
                      setState(() => _selectedDuration = selected);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.04),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.timer_outlined, size: 20, color: AppColors.accentPrimary),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            durations.firstWhere((d) => d.$1 == _selectedDuration).$2,
                            style: AppTypography.bodyLarge(color: AppColors.accentPrimary),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(delay: 200.ms),

                const SizedBox(height: 20),

                // Server / Device info box
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.04),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Server info
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.05),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.delete_outline,
                                color: AppColors.error, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.serverLabel,
                                    style: AppTypography.labelLarge(
                                        color: AppColors.error),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    l10n.serverDeletionInfo,
                                    style: AppTypography.bodySmall(
                                      color: isDark
                                          ? AppColors.textSecondaryDark
                                          : AppColors.textSecondaryLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider
                      Divider(
                        height: 1,
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.04),
                      ),
                      // Device info
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.accentPrimary.withValues(alpha: 0.05),
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(16)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.phone_android,
                                color: AppColors.accentPrimary, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.yourDeviceLabel,
                                    style: AppTypography.labelLarge(
                                        color: AppColors.accentPrimary),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    l10n.deviceRetentionInfo,
                                    style: AppTypography.bodySmall(
                                      color: isDark
                                          ? AppColors.textSecondaryDark
                                          : AppColors.textSecondaryLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 300.ms),

                const SizedBox(height: 20),

                // Read receipts toggle
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.04),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.visibility_outlined, size: 20, color: AppColors.accentPrimary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Confirmations de lecture',
                              style: AppTypography.bodyLarge(
                                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Indiquer quand vous avez lu un message',
                              style: AppTypography.bodySmall(
                                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Switch(
                        value: _sendReadReceipts,
                        onChanged: (v) => setState(() => _sendReadReceipts = v),
                        activeColor: AppColors.accentPrimary,
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 350.ms),

                const SizedBox(height: 24),

                // Separator
                Divider(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.06),
                ),

                const SizedBox(height: 20),

                // Age checkbox
                GestureDetector(
                  onTap: () => setState(() => _ageConfirmed = !_ageConfirmed),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _ageConfirmed,
                          onChanged: (v) =>
                              setState(() => _ageConfirmed = v ?? false),
                          activeColor: AppColors.accentPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          l10n.confirmAge13,
                          style: AppTypography.bodyMedium(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 16),

                // Terms checkbox
                GestureDetector(
                  onTap: () =>
                      setState(() => _termsAccepted = !_termsAccepted),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _termsAccepted,
                          onChanged: (v) =>
                              setState(() => _termsAccepted = v ?? false),
                          activeColor: AppColors.accentPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: l10n.acceptLegalStart,
                                style: AppTypography.bodyMedium(
                                  color: isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight,
                                ),
                              ),
                              TextSpan(
                                text: l10n.privacyPolicy,
                                style: AppTypography.bodyMedium(
                                  color: AppColors.accentPrimary,
                                ).copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.accentPrimary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _openUrl(
                                      LegalUrls.privacyPolicy(
                                          Localizations.localeOf(context))),
                              ),
                              TextSpan(
                                text: l10n.andThe,
                                style: AppTypography.bodyMedium(
                                  color: isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight,
                                ),
                              ),
                              TextSpan(
                                text: l10n.termsOfService,
                                style: AppTypography.bodyMedium(
                                  color: AppColors.accentPrimary,
                                ).copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.accentPrimary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _openUrl(
                                      LegalUrls.termsOfService(
                                          Localizations.localeOf(context))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 500.ms),

                const SizedBox(height: 32),

                // Error message
                if (_error != null) ...[
                  Text(
                    _error!,
                    style: AppTypography.bodyMedium(color: AppColors.error),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn().shake(),
                  const SizedBox(height: 16),
                ],

                // Create account button
                if (_isLoading)
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.accentPrimary),
                  )
                else
                  HashButton(
                    text: l10n.createMyAccount,
                    onPressed: canCreate ? _completeSetup : null,
                    width: double.infinity,
                  ).animate().fadeIn(delay: 600.ms),

                const SizedBox(height: 16),

                // Step indicator
                _buildStepIndicator(),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWordChip(int index, String word, bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkBackground.withValues(alpha: 0.5)
            : AppColors.lightBackground.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$index.',
            style: AppTypography.labelSmall(
              color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
            ),
          ),
          const SizedBox(width: 4),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                word,
                style: AppTypography.labelMedium(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
