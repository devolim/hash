import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/pin_security_service.dart';
import '../../../core/services/recovery_security_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import '../../providers/call_providers.dart';
import '../../widgets/common/hash_text_field.dart';
import '../../../domain/models/call_state.dart';

class PinEntryScreen extends ConsumerStatefulWidget {
  final bool skipBiometric;

  const PinEntryScreen({super.key, this.skipBiometric = false});

  @override
  ConsumerState<PinEntryScreen> createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends ConsumerState<PinEntryScreen>
    with TickerProviderStateMixin {
  bool _isLoading = false;
  String? _error;

  // Rate limiting state
  PinSecurityStatus? _securityStatus;
  RecoveryStatus? _recoveryStatus;
  Timer? _countdownTimer;
  int _remainingSeconds = 0;
  bool _isRateLimited = false;
  bool _isInRecoveryDelay = false;
  bool _isAccountLocked = false;

  // Animated text
  final List<String> _statements = [
    'Vos messages sont protégés.',
    'Chiffrement de bout en bout.',
    'Aucune trace. Aucun compromis.',
    'Votre vie privée est un droit.',
  ];

  int _currentStatementIndex = 0;
  String _displayedText = '';
  bool _isTyping = true;
  bool _showCursor = true;
  Timer? _typingTimer;
  Timer? _pauseTimer;
  Timer? _cursorTimer;

  late AnimationController _glowController;
  late AnimationController _gridController;

  @override
  void initState() {
    super.initState();
    _checkPendingCleanup();
    _checkPendingCall();
    _checkAccountLocked();
    _checkSecurityStatus();
    _checkRecoveryStatus();
    if (!widget.skipBiometric) {
      _attemptBiometricUnlock();
    }

    // Glow animation for logo
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Grid animation
    _gridController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    // Cursor blinking
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (mounted) {
        setState(() => _showCursor = !_showCursor);
      }
    });

    // Start typing animation
    _startTypingAnimation();
  }

  /// Vérifier si un appel a été accepté depuis CallKit (bypass PIN).
  /// Gère aussi la race condition où CallKit fire après le check initial
  /// en écoutant les changements d'état de l'appel.
  Future<void> _checkPendingCall() async {
    try {
      // Vérifier si un appel est déjà actif (app revenue au premier plan)
      final callState = ref.read(callStateProvider);
      if (callState.isActive || callState.status == CallStatus.connecting) {
        _activateBypass();
        return;
      }

      // IMPORTANT: ne PAS appeler prefs.reload() ici !
      // onCallAccepted met pending_call_accepted=true en mémoire via setBool.
      // reload() lirait depuis le disque où le write async n'est peut-être pas
      // terminé, écrasant la valeur en mémoire → bypass raté.
      final prefs = await SharedPreferences.getInstance();
      final pendingAccepted = prefs.getBool('pending_call_accepted') ?? false;

      if (pendingAccepted) {
        _activateBypass();
        return;
      }

      // Aussi vérifier pending_call_kit_id : si un CallKit existe,
      // l'utilisateur a peut-être accepté mais l'event n'a pas encore fire
      final hasPendingCallKit = prefs.getString('pending_call_kit_id') != null;
      final hasPendingCallerData = prefs.getString('pending_call_caller_hash_id') != null;

      if (hasPendingCallKit || hasPendingCallerData) {
        // Un CallKit est actif — écouter les changements pour réagir
        // quand pending_call_accepted sera set par onCallAccepted
        _watchForPendingCallAccept();
      }
    } catch (e) {
      debugPrint('[PinEntry] Error checking pending call: $e');
    }
  }

  bool _bypassActivated = false;

  /// Active le bypass et navigue vers Home (une seule fois)
  void _activateBypass() {
    if (!mounted || _bypassActivated) return;
    _bypassActivated = true;
    _pendingCallCheckTimer?.cancel();
    ref.read(callBypassProvider.notifier).state = true;
    context.go(AppRoutes.home);
  }

  Timer? _pendingCallCheckTimer;

  /// Vérifie périodiquement si pending_call_accepted a été set
  /// (race condition : CallKit peut fire après notre check initial)
  void _watchForPendingCallAccept() {
    _pendingCallCheckTimer?.cancel();
    int checks = 0;
    _pendingCallCheckTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      checks++;
      if (!mounted || checks > 20) {
        // Arrêter après 10 secondes
        timer.cancel();
        return;
      }

      // Vérifier si l'appel est devenu actif
      final callState = ref.read(callStateProvider);
      if (callState.isActive || callState.status == CallStatus.connecting ||
          callState.status == CallStatus.ringing) {
        timer.cancel();
        _activateBypass();
        return;
      }

      // Vérifier le flag SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.reload();
        final accepted = prefs.getBool('pending_call_accepted') ?? false;
        if (accepted && mounted) {
          timer.cancel();
          _activateBypass();
        }
      } catch (_) {}
    });
  }

  /// Vérifier si le compte est verrouillé
  Future<void> _checkAccountLocked() async {
    final authService = ref.read(authServiceProvider);
    final isLocked = await authService.isAccountLocked();
    if (isLocked && mounted) {
      setState(() => _isAccountLocked = true);
    }
  }

  /// Vérifier le statut de sécurité du PIN
  Future<void> _checkSecurityStatus() async {
    final authService = ref.read(authServiceProvider);
    authService.setPinSecurityService(ref.read(pinSecurityServiceProvider));
    authService.setRecoverySecurityService(ref.read(recoverySecurityServiceProvider));

    final status = await authService.checkPinSecurityStatus();
    if (status != null && mounted) {
      setState(() {
        _securityStatus = status;
        if (!status.canAttempt && status.remainingSeconds > 0) {
          _isRateLimited = true;
          _remainingSeconds = status.remainingSeconds;
          _startCountdown();
        }
      });
    }
  }

  /// Vérifier le statut de récupération
  Future<void> _checkRecoveryStatus() async {
    final authService = ref.read(authServiceProvider);
    authService.setRecoverySecurityService(ref.read(recoverySecurityServiceProvider));

    final status = await authService.checkRecoveryStatus();
    if (status != null && status.isInRecovery && mounted) {
      setState(() {
        _recoveryStatus = status;
        if (!status.canSetNewPin && status.remainingSeconds > 0) {
          _isInRecoveryDelay = true;
          _remainingSeconds = status.remainingSeconds;
          _startCountdown();
        } else if (status.canSetNewPin) {
          // Peut créer un nouveau PIN - rediriger vers PIN setup
          _goToNewPinSetup();
        }
      });
    }
  }

  /// Rediriger vers la création d'un nouveau PIN
  void _goToNewPinSetup() async {
    final authService = ref.read(authServiceProvider);
    await authService.completeRecovery();
    if (mounted) {
      context.go(AppRoutes.pinSetup);
    }
  }

  /// Démarrer le compte à rebours
  void _startCountdown() {
    // Capture which mode we're in BEFORE the countdown clears it
    final wasRecoveryDelay = _isInRecoveryDelay;

    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          if (_remainingSeconds > 0) {
            _remainingSeconds--;
          } else {
            _countdownTimer?.cancel();
            _isRateLimited = false;
            _isInRecoveryDelay = false;
            // Vérifier à nouveau le statut
            if (wasRecoveryDelay) {
              _checkRecoveryStatus();
            } else {
              _checkSecurityStatus();
            }
          }
        });
      }
    });
  }

  /// Vérifier et exécuter la suppression serveur en attente
  Future<void> _checkPendingCleanup() async {
    final destructionService = ref.read(destructionServiceProvider);
    await destructionService.checkAndExecutePendingCleanup();

    // Vérifier aussi la suppression de messages en attente
    final recoverySecurity = ref.read(recoverySecurityServiceProvider);
    await recoverySecurity.checkAndExecutePendingDeletion();

    // Charger l'état du mode fantôme
    final isGhost = await destructionService.isGhostMode();
    if (isGhost) {
      ref.read(isGhostModeProvider.notifier).state = true;
    }
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _pauseTimer?.cancel();
    _cursorTimer?.cancel();
    _countdownTimer?.cancel();
    _pendingCallCheckTimer?.cancel();
    _glowController.dispose();
    _gridController.dispose();
    super.dispose();
  }

  void _startTypingAnimation() {
    _displayedText = '';
    _isTyping = true;
    int charIndex = 0;
    final currentStatement = _statements[_currentStatementIndex];

    _typingTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (charIndex < currentStatement.length) {
        setState(() {
          _displayedText = currentStatement.substring(0, charIndex + 1);
        });
        charIndex++;
      } else {
        timer.cancel();
        _isTyping = false;

        // Pause before next statement
        _pauseTimer = Timer(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              _currentStatementIndex =
                  (_currentStatementIndex + 1) % _statements.length;
            });
            _startTypingAnimation();
          }
        });
      }
    });
  }

  /// Tenter le déverrouillage biométrique automatiquement
  Future<void> _attemptBiometricUnlock() async {
    try {
      final authService = ref.read(authServiceProvider);
      final secureStorage = ref.read(secureStorageProvider);

      // Vérifier si la biométrie est activée (stocké dans SecureStorage, accessible avant Hive)
      final biometricEnabled = await secureStorage.isBiometricEnabled();
      if (!biometricEnabled || !mounted) return;

      // Vérifier si le compte est verrouillé ou rate-limited
      if (_isAccountLocked || _isRateLimited || _isInRecoveryDelay) return;

      final localAuth = LocalAuthentication();
      final canCheck = await localAuth.canCheckBiometrics;
      final isSupported = await localAuth.isDeviceSupported();
      if (!canCheck || !isSupported || !mounted) return;

      final didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Déverrouillez Hash',
      );

      if (!didAuthenticate || !mounted) return;

      // Déverrouiller Hive avec la clé biométrique
      final success = await authService.unlockHiveWithBiometric();
      if (success && mounted) {
        // Remettre le compteur de tentatives PIN à zéro
        final pinSecurity = ref.read(pinSecurityServiceProvider);
        await pinSecurity.recordSuccessfulAttempt();
        _onAuthenticationSuccess();
      }
    } catch (e) {
      debugPrint('[PinEntry] Biometric unlock failed: $e');
      // Fallback silencieux vers la saisie du PIN
    }
  }

  Future<void> _onPinEntered(String pin) async {
    if (_isRateLimited || _isInRecoveryDelay) {
      setState(() {
        _error = 'Veuillez attendre la fin du délai';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    final authService = ref.read(authServiceProvider);

    // Connecter les services de sécurité
    authService.setDestructionService(ref.read(destructionServiceProvider));
    authService.setPinSecurityService(ref.read(pinSecurityServiceProvider));
    authService.setRecoverySecurityService(ref.read(recoverySecurityServiceProvider));

    final settings = ref.read(appSettingsProvider);

    final result = await authService.verifyPin(
      pin,
      destructionOnMaxAttempts: settings.destructionOnMaxAttempts,
    );

    switch (result) {
      case AuthPinResult.success:
        _onAuthenticationSuccess();
        break;

      case AuthPinResult.ghostMode:
        // Mode fantôme activé - se comporter normalement mais vide
        ref.read(isGhostModeProvider.notifier).state = true;
        _onAuthenticationSuccess();
        break;

      case AuthPinResult.destroyed:
        // Destruction totale - rediriger vers un écran vide ou onboarding
        ref.read(isGhostModeProvider.notifier).state = true;
        setState(() {
          _isLoading = false;
          _error = 'Mode Vash activé.';
        });
        // Attendre un peu puis rediriger
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _onAuthenticationSuccess();
          }
        });
        break;

      case AuthPinResult.failed:
        // Récupérer le nouveau statut
        final status = await authService.checkPinSecurityStatus();
        setState(() {
          _isLoading = false;
          _securityStatus = status;

          if (status != null) {
            if (!status.canAttempt && status.remainingSeconds > 0) {
              _isRateLimited = true;
              _remainingSeconds = status.remainingSeconds;
              _error = 'Trop de tentatives. ${status.statusMessage}';
              _startCountdown();
            } else if (status.shouldOfferRecovery) {
              _error = 'PIN incorrect. ${status.statusMessage}';
            } else {
              _error = 'PIN incorrect. ${status.statusMessage}';
            }
          } else {
            _error = 'PIN incorrect';
          }
        });
        break;

      case AuthPinResult.locked:
        setState(() {
          _isLoading = false;
          _isAccountLocked = true;
        });
        break;

      case AuthPinResult.rateLimited:
        await _checkSecurityStatus();
        setState(() {
          _isLoading = false;
          _error = 'Trop de tentatives. Veuillez patienter.';
        });
        break;
    }
  }

  Future<void> _onAuthenticationSuccess() async {
    // Cancel pending call check timer to avoid it firing after auth
    _pendingCallCheckTimer?.cancel();
    _pendingCallCheckTimer = null;

    // Clear bypass if it was active (user entered PIN manually)
    if (ref.read(callBypassProvider)) {
      ref.read(callBypassProvider.notifier).state = false;
    }

    // Navigate immediately, reload settings in background
    ref.read(isAppLockedProvider.notifier).state = false;

    if (!mounted) return;
    context.go(AppRoutes.home);

    // Fire-and-forget: reload settings THEN record login (order matters to avoid race condition)
    ref.read(appSettingsProvider.notifier).reloadSettings().then((_) {
      ref.read(appSettingsProvider.notifier).recordLogin();
    });
  }

  void _showRecoveryDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _RecoveryPhraseDialog(
        onRecoveryInitiated: () {
          Navigator.of(context).pop();
          // Rafraîchir le statut de récupération
          _checkRecoveryStatus();
        },
      ),
    );
  }

  String _formatCountdown(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;

    if (hours > 0) {
      return '${hours}h ${minutes.toString().padLeft(2, '0')}m ${secs.toString().padLeft(2, '0')}s';
    } else if (minutes > 0) {
      return '${minutes}m ${secs.toString().padLeft(2, '0')}s';
    } else {
      return '${secs}s';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final callState = ref.watch(callStateProvider);
    final isBypass = ref.watch(callBypassProvider);
    final hasActiveCall = callState.isActive || callState.status == CallStatus.connecting;

    // Affichage spécial si le compte est verrouillé
    if (_isAccountLocked) {
      return _buildAccountLockedScreen(isDark);
    }

    // Affichage spécial si en délai de récupération
    if (_isInRecoveryDelay) {
      return _buildRecoveryDelayScreen(isDark);
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Animated background grid
          Positioned.fill(
            child: RepaintBoundary(
              child: AnimatedBuilder(
                animation: _gridController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _GridPainter(
                      progress: _gridController.value,
                      color: AppColors.accentPrimary.withValues(alpha: 0.03),
                    ),
                  );
                },
              ),
            ),
          ),

          // Floating particles
          Positioned.fill(
            child: RepaintBoundary(
              child: _FloatingParticles(
                color: AppColors.accentPrimary.withValues(alpha: 0.1),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Spacer(),

                  // Logo with glow
                  AnimatedBuilder(
                    animation: _glowController,
                    builder: (context, child) {
                      final glowIntensity = 0.2 + (_glowController.value * 0.3);
                      return Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accentPrimary
                                  .withValues(alpha: glowIntensity),
                              blurRadius: 25 + (_glowController.value * 10),
                              spreadRadius: 2 + (_glowController.value * 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/icons/hash_icons.png',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ).animate().fadeIn().scale(),

                  const SizedBox(height: 24),

                  // Logo text
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      isDark ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'assets/images/hash_logo_text_white.png',
                      height: 36,
                      fit: BoxFit.contain,
                    ),
                  ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 24),

                  // Animated text
                  SizedBox(
                    height: 60,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '> ',
                            style: AppTypography.bodyLarge().copyWith(
                              color: AppColors.accentPrimary,
                              fontFamily: 'monospace',
                            ),
                          ),
                          TextSpan(
                            text: _displayedText,
                            style: AppTypography.bodyLarge(
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                          if (_isTyping && _showCursor)
                            TextSpan(
                              text: '|',
                              style: AppTypography.bodyLarge(
                                color: AppColors.accentPrimary,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(delay: 200.ms),

                  // Statement indicators
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_statements.length, (index) {
                        final isActive = index == _currentStatementIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: isActive ? 16 : 6,
                          height: 3,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.accentPrimary
                                : (isDark
                                    ? AppColors.textTertiaryDark
                                    : AppColors.textTertiaryLight),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Rate limiting message
                  if (_isRateLimited) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.error.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.timer,
                            color: AppColors.error,
                            size: 32,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Accès bloqué',
                            style: AppTypography.labelLarge(
                              color: AppColors.error,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatCountdown(_remainingSeconds),
                            style: AppTypography.headlineMedium(
                              color: AppColors.error,
                            ),
                          ),
                          if (_securityStatus?.shouldOfferRecovery ?? false) ...[
                            const SizedBox(height: 12),
                            Text(
                              'Tentative ${_securityStatus!.attemptCount} sur ${_securityStatus!.maxAttempts}',
                              style: AppTypography.bodySmall(
                                color: AppColors.error.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ).animate().fadeIn().shake(),
                    const SizedBox(height: 24),
                  ],

                  if (_error != null && !_isRateLimited) ...[
                    Text(
                      _error!,
                      style: AppTypography.bodyMedium(color: AppColors.error),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn().shake(),
                    const SizedBox(height: 24),
                  ],

                  // PIN input
                  if (!_isLoading && !_isRateLimited)
                    HashPinField(
                      key: ValueKey('pin_${_securityStatus?.attemptCount ?? 0}'),
                      onCompleted: _onPinEntered,
                      autofocus: true,
                    ),

                  if (_isLoading)
                    const CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
                    ),

                  const Spacer(),

                  // Recovery option (shown after 3 failed attempts)
                  if ((_securityStatus?.shouldOfferRecovery ?? false) ||
                      _isRateLimited) ...[
                    GestureDetector(
                      onTap: _showRecoveryDialog,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          color: AppColors.warning.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.warning.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.key,
                              color: AppColors.warning,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Utiliser la phrase de récupération',
                              style: AppTypography.bodyMedium(
                                color: AppColors.warning,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate().fadeIn(),
                    const SizedBox(height: 24),
                  ] else ...[
                    // Forgot PIN link (only if not yet at 3 attempts)
                    GestureDetector(
                      onTap: _showRecoveryDialog,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          'PIN oublié ? Utiliser la phrase de récupération',
                          style: AppTypography.bodySmall(
                            color: AppColors.accentPrimary.withValues(alpha: 0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Bandeau "Revenir à l'appel" quand un appel est actif en mode bypass
          if (isBypass && hasActiveCall)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Naviguer directement vers l'écran d'appel
                  ref.read(callNavigationProvider.notifier).state = 'call';
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 8,
                    bottom: 12,
                    left: 16,
                    right: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone_in_talk, color: Colors.white, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        'Appel en cours — toucher pour revenir',
                        style: AppTypography.labelMedium(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Supprimer le compte depuis l'écran de verrouillage
  Future<void> _deleteAccountFromLock() async {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => GlassTheme.glassAlertDialog(
        context: context,
        icon: const Icon(Icons.warning_amber, color: AppColors.error, size: 28),
        title: 'Supprimer le compte',
        content: Text(
          'Cette action est irréversible. Toutes vos données seront définitivement supprimées.',
          style: AppTypography.bodyMedium(
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Annuler',
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: Text(
              'Supprimer',
              style: AppTypography.bodyMedium(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final authService = ref.read(authServiceProvider);
    await authService.clearAccountLocked();
    await authService.clearAllLocalData();

    if (mounted) {
      context.go(AppRoutes.onboarding);
    }
  }

  /// Écran de verrouillage du compte (après 10 tentatives, mode non-destructif)
  Widget _buildAccountLockedScreen(bool isDark) {
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.error.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.lock_outline,
                  size: 48,
                  color: AppColors.error,
                ),
              ).animate().fadeIn().scale(),

              const SizedBox(height: 32),

              Text(
                'Compte verrouillé',
                style: AppTypography.headlineMedium(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 100.ms),

              const SizedBox(height: 16),

              Text(
                'Trop de tentatives de PIN échouées. Votre compte a été verrouillé pour votre sécurité.',
                style: AppTypography.bodyMedium(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 200.ms),

              const SizedBox(height: 48),

              // Bouton phrase de récupération
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _showRecoveryDialog,
                  icon: const Icon(Icons.key, size: 20),
                  label: const Text('Phrase de récupération'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentPrimary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: 300.ms),

              const SizedBox(height: 16),

              // Bouton supprimer le compte
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _deleteAccountFromLock,
                  icon: const Icon(Icons.delete_forever, size: 20),
                  label: const Text('Supprimer mon compte'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: BorderSide(color: AppColors.error.withValues(alpha: 0.5)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: 400.ms),
            ],
          ),
        ),
      ),
    );
  }

  /// Écran spécial pendant le délai de récupération (1h)
  Widget _buildRecoveryDelayScreen(bool isDark) {
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.hourglass_top,
                  size: 48,
                  color: AppColors.warning,
                ),
              ).animate(onPlay: (c) => c.repeat(reverse: true))
                  .rotate(duration: 2.seconds, begin: 0, end: 0.5),

              const SizedBox(height: 32),

              Text(
                'Délai de sécurité',
                style: AppTypography.headlineMedium(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Text(
                'Pour votre sécurité, un délai d\'attente est requis avant de pouvoir créer un nouveau PIN.',
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      _formatCountdown(_remainingSeconds),
                      style: AppTypography.headlineLarge(
                        color: AppColors.warning,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Temps restant',
                      style: AppTypography.bodySmall(
                        color: AppColors.textTertiaryDark,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.success.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.success,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Vos messages ont été supprimés pour votre protection.',
                        style: AppTypography.bodySmall(
                          color: AppColors.success,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Vous pouvez fermer l\'application et revenir plus tard.',
                style: AppTypography.bodySmall(
                  color: AppColors.textTertiaryDark,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Recovery phrase dialog with security warnings
class _RecoveryPhraseDialog extends ConsumerStatefulWidget {
  final VoidCallback onRecoveryInitiated;

  const _RecoveryPhraseDialog({required this.onRecoveryInitiated});

  @override
  ConsumerState<_RecoveryPhraseDialog> createState() =>
      _RecoveryPhraseDialogState();
}

class _RecoveryPhraseDialogState extends ConsumerState<_RecoveryPhraseDialog> {
  final _controller = TextEditingController();
  bool _isLoading = false;
  String? _error;
  bool _showWarning = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _verifyPhrase() async {
    final phrase = _controller.text.trim().toLowerCase();
    if (phrase.isEmpty) {
      setState(() => _error = 'Veuillez entrer votre phrase de récupération');
      return;
    }

    // Vérifier que c'est bien 24 mots
    final words = phrase.split(RegExp(r'\s+'));
    if (words.length != 24) {
      setState(() => _error = 'La phrase doit contenir exactement 24 mots');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    final authService = ref.read(authServiceProvider);
    authService.setRecoverySecurityService(ref.read(recoverySecurityServiceProvider));

    final isValid = await authService.verifyRecoveryPhrase(phrase);

    if (isValid) {
      // Phrase correcte - SUPPRIMER IMMÉDIATEMENT les messages
      final result = await authService.initiateRecovery();

      if (result != null && result.success) {
        widget.onRecoveryInitiated();
      } else {
        setState(() {
          _isLoading = false;
          _error = 'Erreur lors de l\'initialisation de la récupération';
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _error = 'Phrase de récupération incorrecte';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (_showWarning) {
      return GlassTheme.glassAlertDialog(
        context: context,
        icon: const Icon(Icons.warning_amber, color: AppColors.warning, size: 28),
        title: 'Attention',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'La récupération du compte va :',
              style: AppTypography.bodyMedium(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 16),
            _buildWarningItem(
              Icons.delete_forever,
              'Supprimer TOUS vos messages',
              AppColors.error,
              isDark,
            ),
            const SizedBox(height: 8),
            _buildWarningItem(
              Icons.timer,
              'Imposer un délai de 1 heure',
              AppColors.warning,
              isDark,
            ),
            const SizedBox(height: 8),
            _buildWarningItem(
              Icons.people_outline,
              'Conserver vos contacts',
              AppColors.success,
              isDark,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.error.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                'Cette action est irréversible. Vos messages seront définitivement perdus.',
                style: AppTypography.bodySmall(
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Annuler',
              style: AppTypography.bodyMedium(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => setState(() => _showWarning = false),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.warning,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Je comprends',
              style: AppTypography.bodyMedium(color: Colors.white),
            ),
          ),
        ],
      );
    }

    return GlassTheme.wrapAlertDialog(context, AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      title: Text(
        'Récupération du compte',
        style: AppTypography.headlineSmall(
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entrez les 24 mots de votre phrase de récupération, séparés par des espaces.',
            style: AppTypography.bodyMedium(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            maxLines: 4,
            enableSuggestions: false,
            autocorrect: false,
            style: AppTypography.bodyMedium(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
            decoration: InputDecoration(
              hintText: 'word1 word2 word3 ...',
              hintStyle: AppTypography.bodyMedium(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
              filled: true,
              fillColor: isDark
                  ? AppColors.darkBackground
                  : AppColors.lightBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: AppColors.accentPrimary, width: 2),
              ),
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(
              _error!,
              style: AppTypography.bodySmall(color: AppColors.error),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Annuler',
            style: AppTypography.bodyMedium(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          )
        else
          ElevatedButton(
            onPressed: _verifyPhrase,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Récupérer',
              style: AppTypography.bodyMedium(color: Colors.white),
            ),
          ),
      ],
    ));
  }

  Widget _buildWarningItem(
    IconData icon,
    String text,
    Color color,
    bool isDark,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodyMedium(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ),
      ],
    );
  }
}

// Animated grid painter
class _GridPainter extends CustomPainter {
  final double progress;
  final Color color;

  _GridPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const spacing = 40.0;
    final offset = (progress * spacing) % spacing;

    // Horizontal lines
    for (double y = -spacing + offset; y < size.height + spacing; y += spacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Vertical lines
    for (double x = -spacing + offset; x < size.width + spacing; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

// Floating particles widget
class _FloatingParticles extends StatefulWidget {
  final Color color;

  const _FloatingParticles({required this.color});

  @override
  State<_FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<_FloatingParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Particle> _particles;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _particles = List.generate(15, (_) => _Particle(_random));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
            color: widget.color,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Particle {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double opacity;

  _Particle(Random random)
      : x = random.nextDouble(),
        y = random.nextDouble(),
        size = 2 + random.nextDouble() * 3,
        speed = 0.2 + random.nextDouble() * 0.4,
        opacity = 0.3 + random.nextDouble() * 0.5;
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;
  final Color color;

  _ParticlePainter({
    required this.particles,
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final y = ((particle.y + progress * particle.speed) % 1.0) * size.height;
      final x = particle.x * size.width;

      final paint = Paint()
        ..color = color.withValues(alpha: particle.opacity * color.a)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
