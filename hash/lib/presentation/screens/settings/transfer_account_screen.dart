import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/transfer_service.dart';
import '../../../core/services/proximity_verification_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../providers/app_providers.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../widgets/common/hash_text_field.dart';

/// Écran de transfert de compte (ANCIEN appareil)
///
/// Étapes:
/// 1. Afficher Hash ID + code temporaire
/// 2. Entrer PIN actuel
/// 3. Afficher QR code + code de transfert
/// 4. Vérification proximité
/// 5. Confirmer le transfert
class TransferAccountScreen extends ConsumerStatefulWidget {
  const TransferAccountScreen({super.key});

  @override
  ConsumerState<TransferAccountScreen> createState() => _TransferAccountScreenState();
}

class _TransferAccountScreenState extends ConsumerState<TransferAccountScreen> {
  // Services
  late TransferService _transferService;
  late ProximityVerificationService _proximityService;

  // État
  int _step = 0;
  bool _isLoading = false;
  String? _error;

  // Données
  TransferInitData? _initData;
  TransferCodeData? _codeData;
  String? _newDeviceInfo;

  // Timers
  Timer? _expiryTimer;
  int _remainingSeconds = 300;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  void _initializeServices() {
    final secureStorage = ref.read(secureStorageProvider);
    final localStorage = ref.read(localStorageProvider);
    final edgeFunctions = ref.read(edgeFunctionServiceProvider);

    _transferService = TransferService(
      secureStorage: secureStorage,
      localStorage: localStorage,
      edgeFunctions: edgeFunctions,
    );

    _proximityService = ProximityVerificationService();
    _proximityService.onProximityVerified = _onProximityVerified;
    _proximityService.onError = (error) {
      setState(() => _error = error);
    };

    _initializeTransfer();
  }

  Future<void> _initializeTransfer() async {
    setState(() => _isLoading = true);

    try {
      _initData = await _transferService.initializeTransfer();
      _startExpiryTimer(_initData!.remainingSeconds);
      setState(() {
        _isLoading = false;
        _step = 0;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _startExpiryTimer(int seconds) {
    _remainingSeconds = seconds;
    _expiryTimer?.cancel();
    _expiryTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;
        if (_remainingSeconds <= 0) {
          timer.cancel();
          _onExpired();
        }
      });
    });
  }

  void _onExpired() {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _error = l10n.codeExpiredRestart;
    });
    _transferService.cancelTransfer();
  }

  @override
  void dispose() {
    _expiryTimer?.cancel();
    _proximityService.stop();
    super.dispose();
  }

  Future<void> _onPinEntered(String pin) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final authService = ref.read(authServiceProvider);
      authService.setPinSecurityService(ref.read(pinSecurityServiceProvider));

      final result = await authService.verifyPin(pin);

      if (result == AuthPinResult.success) {
        // Générer le code de transfert
        _codeData = await _transferService.generateTransferCode();
        _startExpiryTimer(_codeData!.remainingSeconds);

        setState(() {
          _isLoading = false;
          _step = 2;
        });

        // Démarrer la vérification de proximité
        await _proximityService.startAsSource(
          proximityCode: _codeData!.proximityCode,
        );
      } else {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          _isLoading = false;
          _error = l10n.incorrectPin;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _onProximityVerified(ProximityMethod method) {
    setState(() {
      _step = 4; // Passer à la confirmation
    });
  }

  void _onManualProximityConfirmed() {
    _proximityService.confirmManualVerification();
  }

  void _onManualProximityRejected() {
    final l10n = AppLocalizations.of(context)!;
    _proximityService.rejectManualVerification();
    setState(() {
      _error = l10n.codesDoNotMatchCancelled;
    });
  }

  Future<void> _onConfirmTransfer() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await _transferService.confirmTransfer();
      await _transferService.finalizeOldDevice();

      if (!mounted) return;

      // Afficher succès et rediriger
      setState(() {
        _step = 5; // Écran de succès
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _onCancel() {
    _transferService.cancelTransfer();
    _proximityService.stop();
    context.pop();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
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
        title: Text(AppLocalizations.of(context)!.transferMyAccountTitle, style: AppTypography.headlineSmall(
          color: GlassTheme.glassTextColor(isDark),
        )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
          onPressed: _onCancel,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _buildStep(isDark),
      ),
    );
  }

  Widget _buildStep(bool isDark) {
    switch (_step) {
      case 0:
        return _buildStep0ShowInfo(isDark);
      case 1:
        return _buildStep1EnterPin(isDark);
      case 2:
        return _buildStep2ShowTransferCode(isDark);
      case 3:
        return _buildStep3ProximityVerification(isDark);
      case 4:
        return _buildStep4Confirmation(isDark);
      case 5:
        return _buildStep5Success(isDark);
      default:
        return const SizedBox();
    }
  }

  /// Étape 0: Afficher Hash ID + code temporaire
  Widget _buildStep0ShowInfo(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    if (_initData == null) {
      return Center(
        child: Text(_error ?? l10n.loadingError, style: AppTypography.bodyMedium(color: AppColors.error)),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Icône
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.accentPrimary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.phone_android,
              size: 40,
              color: AppColors.accentPrimary,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            l10n.transferToNewDevice,
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          Text(
            l10n.transferInstructions,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          // Hash ID
          _InfoCard(
            label: l10n.yourHashIdLabel,
            value: _initData!.hashId,
            isDark: isDark,
            canCopy: true,
          ),

          const SizedBox(height: 16),

          // Code temporaire
          _InfoCard(
            label: l10n.temporaryCode,
            value: _formatTempCode(_initData!.tempCode),
            isDark: isDark,
            isLarge: true,
            canCopy: true,
          ),

          const SizedBox(height: 16),

          // Timer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _remainingSeconds < 60
                  ? AppColors.error.withValues(alpha: 0.1)
                  : (isDark ? Colors.black : Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: 20,
                  color: _remainingSeconds < 60 ? AppColors.error : AppColors.accentPrimary,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      l10n.expiresInTime(_formatTime(_remainingSeconds)),
                      style: AppTypography.bodyMedium(
                        color: _remainingSeconds < 60 ? AppColors.error : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Bouton continuer
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => setState(() => _step = 1),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                l10n.continueButton,
                style: AppTypography.labelLarge(color: Colors.white),
              ),
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
        ],
      ),
    );
  }

  String _formatTempCode(String code) {
    if (code.length == 6) {
      return '${code.substring(0, 3)} ${code.substring(3)}';
    }
    return code;
  }

  /// Étape 1: Entrer le PIN
  Widget _buildStep1EnterPin(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          const Icon(
            Icons.lock_outline,
            size: 64,
            color: AppColors.accentPrimary,
          ),

          const SizedBox(height: 24),

          Text(
            l10n.enterYourPinCode,
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            l10n.pinOwnerConfirmation,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          HashPinField(
            onCompleted: _onPinEntered,
          ),

          if (_error != null) ...[
            const SizedBox(height: 16),
            Text(
              _error!,
              style: AppTypography.bodyMedium(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
          ],

          const Spacer(),
        ],
      ),
    );
  }

  /// Étape 2: Afficher QR code + code de transfert
  Widget _buildStep2ShowTransferCode(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    if (_codeData == null) return const SizedBox();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            l10n.scanThisQrCode,
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            l10n.withYourNewDevice,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),

          const SizedBox(height: 24),

          // QR Code
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: QrImageView(
              data: _codeData!.qrData,
              version: QrVersions.auto,
              size: 200,
              backgroundColor: Colors.white,
            ),
          ),

          const SizedBox(height: 24),

          // Séparateur
          Row(
            children: [
              Expanded(child: Divider(color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  l10n.orEnterTheCode,
                  style: AppTypography.bodySmall(
                    color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                  ),
                ),
              ),
              Expanded(child: Divider(color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08))),
            ],
          ),

          const SizedBox(height: 24),

          // Code manuel
          _InfoCard(
            label: l10n.transferCodeLabel,
            value: _codeData!.transferCode,
            isDark: isDark,
            isLarge: true,
            canCopy: true,
          ),

          const SizedBox(height: 16),

          // Timer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _remainingSeconds < 60
                  ? AppColors.error.withValues(alpha: 0.1)
                  : (isDark ? Colors.black : Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: 20,
                  color: _remainingSeconds < 60 ? AppColors.error : AppColors.accentPrimary,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      l10n.expiresInTime(_formatTime(_remainingSeconds)),
                      style: AppTypography.bodyMedium(
                        color: _remainingSeconds < 60 ? AppColors.error : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Vérification proximité
          _ProximityStatusCard(
            status: _proximityService.status,
            proximityCode: _codeData!.proximityCode,
            isDark: isDark,
            onManualConfirm: _onManualProximityConfirmed,
            onManualReject: _onManualProximityRejected,
          ),

          if (_error != null) ...[
            const SizedBox(height: 16),
            Text(
              _error!,
              style: AppTypography.bodyMedium(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  /// Étape 3: Vérification proximité (si nécessaire)
  Widget _buildStep3ProximityVerification(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_tethering,
            size: 64,
            color: AppColors.accentPrimary,
          ),

          const SizedBox(height: 24),

          Text(
            l10n.proximityVerification,
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            l10n.bringDevicesCloser,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),

          const SizedBox(height: 32),

          if (_codeData != null)
            _ProximityStatusCard(
              status: _proximityService.status,
              proximityCode: _codeData!.proximityCode,
              isDark: isDark,
              onManualConfirm: _onManualProximityConfirmed,
              onManualReject: _onManualProximityRejected,
            ),
        ],
      ),
    );
  }

  /// Étape 4: Confirmation finale
  Widget _buildStep4Confirmation(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 64,
                  color: AppColors.warning,
                ),

                const SizedBox(height: 16),

                Text(
                  l10n.confirmTransferQuestion,
                  style: AppTypography.headlineSmall(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),

                const SizedBox(height: 8),

                if (_newDeviceInfo != null) ...[
                  Text(
                    'Vers : $_newDeviceInfo',
                    style: AppTypography.bodyMedium(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                Text(
                  l10n.accountWillBeTransferred,
                  style: AppTypography.bodyMedium(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const Spacer(),

          // Boutons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _onCancel,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(l10n.cancel, style: AppTypography.labelLarge(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  )),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _onConfirmTransfer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.warning,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    l10n.confirm,
                    style: AppTypography.labelLarge(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// Étape 5: Succès
  Widget _buildStep5Success(bool isDark) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              size: 48,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            l10n.transferComplete,
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            l10n.transferSuccessMessage,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Rediriger vers l'écran d'inscription
                context.go('/onboarding');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'OK',
                style: AppTypography.labelLarge(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Carte d'information avec copie
class _InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;
  final bool isLarge;
  final bool canCopy;

  const _InfoCard({
    required this.label,
    required this.value,
    required this.isDark,
    this.isLarge = false,
    this.canCopy = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: AppTypography.labelMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: isLarge
                    ? AppTypography.headlineMedium(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      )
                    : AppTypography.bodyLarge(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
              ),
              if (canCopy) ...[
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    final l10n = AppLocalizations.of(context)!;
                    Clipboard.setData(ClipboardData(text: value.replaceAll(' ', '')));
                    showHashSnackBar(context, message: l10n.copiedExclamation, type: HashSnackBarType.success, duration: const Duration(seconds: 1));
                  },
                  icon: Icon(
                    Icons.copy,
                    size: 20,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Carte de statut de proximité
class _ProximityStatusCard extends StatelessWidget {
  final ProximityStatus status;
  final String proximityCode;
  final bool isDark;
  final VoidCallback onManualConfirm;
  final VoidCallback onManualReject;

  const _ProximityStatusCard({
    required this.status,
    required this.proximityCode,
    required this.isDark,
    required this.onManualConfirm,
    required this.onManualReject,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          // Statut Bluetooth
          _ProximityMethodRow(
            icon: Icons.bluetooth,
            label: 'Bluetooth',
            isAvailable: status.bluetoothAvailable,
            isVerified: status.bluetoothVerified,
            isDark: isDark,
          ),

          const SizedBox(height: 8),

          // Statut Audio
          _ProximityMethodRow(
            icon: Icons.volume_up,
            label: 'Audio',
            isAvailable: status.audioAvailable,
            isVerified: status.audioVerified,
            isDark: isDark,
          ),

          const Divider(height: 24),

          // Vérification manuelle
          Text(
            l10n.manualVerification,
            style: AppTypography.labelMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            l10n.codeDisplayedOnBothDevices,
            style: AppTypography.bodySmall(
              color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
            ),
          ),

          const SizedBox(height: 12),

          // Emojis
          Text(
            proximityCode,
            style: const TextStyle(fontSize: 32),
          ),

          const SizedBox(height: 16),

          Text(
            l10n.doesCodeMatchNewDevice,
            style: AppTypography.bodySmall(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: onManualReject,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                ),
                child: Text(l10n.no),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: onManualConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                ),
                child: Text(l10n.yes, style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProximityMethodRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isAvailable;
  final bool isVerified;
  final bool isDark;

  const _ProximityMethodRow({
    required this.icon,
    required this.label,
    required this.isAvailable,
    required this.isVerified,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (isVerified) {
      statusColor = AppColors.success;
      statusText = l10n.verifiedStatus;
      statusIcon = Icons.check_circle;
    } else if (isAvailable) {
      statusColor = AppColors.warning;
      statusText = l10n.inProgressStatus;
      statusIcon = Icons.hourglass_empty;
    } else {
      statusColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
      statusText = l10n.notAvailableStatus;
      statusIcon = Icons.cancel_outlined;
    }

    return Row(
      children: [
        Icon(icon, size: 20, color: statusColor),
        const SizedBox(width: 8),
        Text(label, style: AppTypography.bodyMedium(
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        )),
        const Spacer(),
        Icon(statusIcon, size: 16, color: statusColor),
        const SizedBox(width: 4),
        Text(
          statusText,
          style: AppTypography.bodySmall(color: statusColor),
        ),
      ],
    );
  }
}
