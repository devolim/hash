import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/services/transfer_service.dart';
import '../../../core/services/proximity_verification_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import '../../widgets/common/hash_text_field.dart';

/// Écran de récupération de compte (NOUVEAU appareil)
///
/// Étapes:
/// 1. Entrer Hash ID + code temporaire
/// 2. Scanner QR ou entrer code de transfert
/// 3. Vérification proximité
/// 4. Attendre confirmation de l'ancien appareil
/// 5. Créer nouveau PIN
class RecoverAccountScreen extends ConsumerStatefulWidget {
  const RecoverAccountScreen({super.key});

  @override
  ConsumerState<RecoverAccountScreen> createState() => _RecoverAccountScreenState();
}

class _RecoverAccountScreenState extends ConsumerState<RecoverAccountScreen> {
  // Services
  late TransferService _transferService;
  late ProximityVerificationService _proximityService;

  // État
  int _step = 0;
  bool _isLoading = false;
  String? _error;
  bool _showManualCodeInput = false;

  // Controllers
  final _hashIdController = TextEditingController();
  final _tempCodeController = TextEditingController();
  final _transferCodeController = TextEditingController();

  // Données
  String? _hashId;
  String? _proximityCode;
  TransferPackage? _receivedPackage;
  Timer? _confirmationPollTimer;
  bool _waitingForConfirmation = false;

  // Scanner
  MobileScannerController? _scannerController;

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
  }

  @override
  void dispose() {
    _hashIdController.dispose();
    _tempCodeController.dispose();
    _transferCodeController.dispose();
    _scannerController?.dispose();
    _proximityService.stop();
    _confirmationPollTimer?.cancel();
    super.dispose();
  }

  /// Étape 1: Valider Hash ID + code temporaire
  Future<void> _validateTempCode() async {
    final hashId = _hashIdController.text.trim().toUpperCase();
    final tempCode = _tempCodeController.text.trim();

    if (hashId.isEmpty || tempCode.isEmpty) {
      setState(() => _error = 'Veuillez remplir tous les champs');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final isValid = await _transferService.validateTempCode(
        hashId: hashId,
        tempCode: tempCode,
      );

      if (isValid) {
        _hashId = hashId;
        _scannerController = MobileScannerController();
        setState(() {
          _isLoading = false;
          _step = 1;
        });
      } else {
        setState(() {
          _isLoading = false;
          _error = 'Code invalide ou expiré';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  /// Traiter le QR code scanné
  void _onQrScanned(String qrData) async {
    final parsed = TransferService.parseQrData(qrData);
    if (parsed == null) {
      setState(() => _error = 'QR code invalide');
      return;
    }

    if (parsed.hashId != _hashId) {
      setState(() => _error = 'Ce QR code ne correspond pas au compte');
      return;
    }

    await _processTransferCode(parsed.transferCode);
  }

  /// Traiter le code de transfert manuel
  Future<void> _validateManualCode() async {
    final code = _transferCodeController.text.trim().toUpperCase();
    if (code.isEmpty) {
      setState(() => _error = 'Veuillez entrer le code de transfert');
      return;
    }
    await _processTransferCode(code);
  }

  /// Recevoir les données de transfert
  Future<void> _processTransferCode(String transferCode) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      _receivedPackage = await _transferService.receiveTransfer(
        hashId: _hashId!,
        transferCode: transferCode,
      );

      if (_receivedPackage == null) {
        setState(() {
          _isLoading = false;
          _error = 'Code invalide ou expiré';
        });
        return;
      }

      // Démarrer la vérification de proximité
      // Le proximity code est généré par l'ancien appareil et inclus dans le package
      _proximityCode = _receivedPackage?.proximityCode ?? '—';

      setState(() {
        _isLoading = false;
        _step = 2;
      });

      // Écouter les signaux de proximité
      await _proximityService.startAsReceiver(
        expectedChallenge: transferCode.substring(4, 12), // Utiliser une partie du code comme challenge
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _onProximityVerified(ProximityMethod method) {
    setState(() {
      _step = 3;
      _waitingForConfirmation = true;
    });
    _startConfirmationPolling();
  }

  void _startConfirmationPolling() {
    _confirmationPollTimer?.cancel();
    _confirmationPollTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      if (!_waitingForConfirmation || !mounted) {
        _confirmationPollTimer?.cancel();
        return;
      }

      try {
        final edgeFunctions = ref.read(edgeFunctionServiceProvider);
        final response = await edgeFunctions.call('get-transfer-status', body: {
          'transfer_id': _receivedPackage?.transferId,
        });

        final status = response['status'] as String?;
        if (status == 'confirmed' || status == 'completed') {
          _confirmationPollTimer?.cancel();
          _waitingForConfirmation = false;
          _finalizeTransfer();
        }
      } catch (e) {
        debugPrint('[RecoverAccount] Polling error: $e');
      }
    });
  }

  void _onManualProximityConfirmed() {
    _proximityService.confirmManualVerification();
  }

  void _onManualProximityRejected() {
    _proximityService.rejectManualVerification();
    setState(() {
      _error = 'Les codes ne correspondent pas. Transfert annulé.';
      _step = 1;
    });
  }

  /// Importer les données et passer à la création du PIN
  Future<void> _finalizeTransfer() async {
    if (_receivedPackage == null) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await _transferService.importTransferredData(_receivedPackage!);

      setState(() {
        _isLoading = false;
        _step = 4;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  /// Obtenir l'identifiant unique de l'appareil
  Future<String> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      return '${info.id}-${info.fingerprint}';
    } else if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      return info.identifierForVendor ?? 'unknown-ios';
    }
    return 'unknown-device';
  }

  /// Créer le nouveau PIN puis compléter le transfert côté serveur
  Future<void> _onNewPinEntered(String pin) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // 1. Setup PIN
      final authService = ref.read(authServiceProvider);
      await authService.setupPin(pin);

      // 2. Générer nouvelles clés Signal pour le nouveau device (libsignal Curve25519)
      final cryptoService = ref.read(cryptoServiceProvider);
      final keyBundle = cryptoService.generateRegistrationKeys();

      // 3. Obtenir le device ID
      final newDeviceId = await _getDeviceId();

      // 4. Récupérer le hash_id depuis les données importées
      final secureStorage = ref.read(secureStorageProvider);
      final hashId = await secureStorage.getUserHashId();

      if (hashId == null || _receivedPackage?.transferId == null) {
        throw Exception('Données de transfert manquantes');
      }

      // 5. Préparer les prekeys pour le serveur
      final serverPrekeys = keyBundle.prekeys.map((pk) => {
        'prekey_id': pk['keyId'] as int,
        'public_key': pk['publicKey'] as String,
      }).toList();

      // 6. Compléter le transfert côté serveur
      final response = await _transferService.completeTransferOnServer(
        transferId: _receivedPackage!.transferId!,
        hashId: hashId,
        newDeviceId: newDeviceId,
        identityPublicKey: keyBundle.identityPublicKey,
        signedPrekeyPublic: keyBundle.signedPrekeyPublic,
        signedPrekeySignature: keyBundle.signedPrekeySignature,
        signedPrekeyId: keyBundle.signedPrekeyId,
        prekeys: serverPrekeys,
      );

      // 7. Stocker les nouvelles clés localement
      await secureStorage.saveIdentityKeys(
        privateKey: keyBundle.identityPrivateKey,
        publicKey: keyBundle.identityPublicKey,
        registrationId: keyBundle.registrationId,
      );
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

      // 8. Stocker le nouveau token de session
      final accessToken = response['access_token'] as String?;
      final refreshToken = response['refresh_token'] as String?;
      if (accessToken != null && refreshToken != null) {
        await Supabase.instance.client.auth.setSession(refreshToken);
      }

      setState(() {
        _isLoading = false;
        _step = 5;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
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
        title: Text('Récupérer mon compte', style: AppTypography.headlineSmall(
          color: GlassTheme.glassTextColor(isDark),
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: GlassTheme.glassIconColor(isDark)),
          onPressed: () => context.pop(),
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
        return _buildStep0EnterHashId(isDark);
      case 1:
        return _buildStep1ScanOrEnterCode(isDark);
      case 2:
        return _buildStep2ProximityVerification(isDark);
      case 3:
        return _buildStep3WaitingConfirmation(isDark);
      case 4:
        return _buildStep4CreatePin(isDark);
      case 5:
        return _buildStep5Success(isDark);
      default:
        return const SizedBox();
    }
  }

  /// Étape 0: Entrer Hash ID + code temporaire
  Widget _buildStep0EnterHashId(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.accentPrimary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.restore,
                size: 40,
                color: AppColors.accentPrimary,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Center(
            child: Text(
              'Récupérer votre compte',
              style: AppTypography.headlineSmall(),
            ),
          ),

          const SizedBox(height: 8),

          Center(
            child: Text(
              'Entrez les informations affichées sur votre ancien appareil',
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 32),

          // Hash ID
          Text('Hash ID', style: AppTypography.labelMedium()),
          const SizedBox(height: 8),
          HashIdField(
            controller: _hashIdController,
          ),

          const SizedBox(height: 24),

          // Code temporaire
          Text('Code temporaire', style: AppTypography.labelMedium()),
          const SizedBox(height: 8),
          TextField(
            controller: _tempCodeController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: AppTypography.headlineMedium(),
            maxLength: 6,
            decoration: InputDecoration(
              hintText: '000 000',
              counterText: '',
              filled: true,
              fillColor: isDark ? Colors.black : Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                  width: 0.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.accentPrimary, width: 2),
              ),
            ),
          ),

          if (_error != null) ...[
            const SizedBox(height: 16),
            Text(
              _error!,
              style: AppTypography.bodyMedium(color: AppColors.error),
            ),
          ],

          const SizedBox(height: 32),

          // Bouton continuer
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _validateTempCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Continuer',
                style: AppTypography.labelLarge(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Étape 1: Scanner QR ou entrer code
  Widget _buildStep1ScanOrEnterCode(bool isDark) {
    return Column(
      children: [
        if (!_showManualCodeInput) ...[
          // Scanner QR
          Expanded(
            child: Stack(
              children: [
                MobileScanner(
                  controller: _scannerController,
                  onDetect: (capture) {
                    final barcode = capture.barcodes.firstOrNull;
                    if (barcode?.rawValue != null) {
                      _scannerController?.stop();
                      _onQrScanned(barcode!.rawValue!);
                    }
                  },
                ),
                // Overlay
                Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.accentPrimary, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                // Instructions en haut
                Positioned(
                  top: 24,
                  left: 24,
                  right: 24,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Scannez le QR code affiché sur votre ancien appareil',
                      style: AppTypography.bodyMedium(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bouton pour saisie manuelle
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextButton(
              onPressed: () {
                _scannerController?.stop();
                setState(() => _showManualCodeInput = true);
              },
              child: Text(
                'Entrer le code manuellement',
                style: AppTypography.bodyMedium(color: AppColors.accentPrimary),
              ),
            ),
          ),
        ] else ...[
          // Saisie manuelle
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  Text(
                    'Code de transfert',
                    style: AppTypography.headlineSmall(),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Entrez le code affiché sur votre ancien appareil',
                    style: AppTypography.bodyMedium(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  TextField(
                    controller: _transferCodeController,
                    textCapitalization: TextCapitalization.characters,
                    textAlign: TextAlign.center,
                    style: AppTypography.headlineSmall(),
                    decoration: InputDecoration(
                      hintText: 'TRF-XXXX-XXXX-XXXX',
                      filled: true,
                      fillColor: isDark ? Colors.black : Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                          width: 0.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.accentPrimary, width: 2),
                      ),
                    ),
                  ),

                  if (_error != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      _error!,
                      style: AppTypography.bodyMedium(color: AppColors.error),
                    ),
                  ],

                  const Spacer(),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _scannerController?.start();
                            setState(() => _showManualCodeInput = false);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('Scanner', style: AppTypography.labelLarge()),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateManualCode,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Valider',
                            style: AppTypography.labelLarge(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  /// Étape 2: Vérification proximité
  Widget _buildStep2ProximityVerification(bool isDark) {
    final status = _proximityService.status;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),

          const Icon(
            Icons.wifi_tethering,
            size: 64,
            color: AppColors.accentPrimary,
          ),

          const SizedBox(height: 24),

          Text(
            'Vérification de proximité',
            style: AppTypography.headlineSmall(),
          ),

          const SizedBox(height: 8),

          Text(
            'Rapprochez les deux appareils',
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),

          const SizedBox(height: 32),

          // Statuts
          Container(
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
                _ProximityMethodRow(
                  icon: Icons.bluetooth,
                  label: 'Bluetooth',
                  isAvailable: status.bluetoothAvailable,
                  isVerified: status.bluetoothVerified,
                  isDark: isDark,
                ),
                const SizedBox(height: 8),
                _ProximityMethodRow(
                  icon: Icons.volume_up,
                  label: 'Audio',
                  isAvailable: status.audioAvailable,
                  isVerified: status.audioVerified,
                  isDark: isDark,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Vérification manuelle
          Container(
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
                  'Vérification manuelle',
                  style: AppTypography.labelMedium(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _proximityCode ?? '🔵 🌟 🔴 🌙',
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 12),
                Text(
                  'Ce code correspond-il à celui de l\'ancien appareil ?',
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
                      onPressed: _onManualProximityRejected,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error,
                      ),
                      child: const Text('Non'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _onManualProximityConfirmed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                      ),
                      child: const Text('Oui', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }

  /// Étape 3: Attente confirmation
  Widget _buildStep3WaitingConfirmation(bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(
              color: AppColors.accentPrimary,
              strokeWidth: 3,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'En attente de confirmation',
            style: AppTypography.headlineSmall(),
          ),

          const SizedBox(height: 8),

          Text(
            'Confirmez le transfert sur votre ancien appareil',
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.accentPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'En attente de confirmation...',
            style: AppTypography.bodySmall(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }

  /// Étape 4: Créer nouveau PIN
  Widget _buildStep4CreatePin(bool isDark) {
    return _CreatePinFlow(
      onPinCreated: _onNewPinEntered,
      error: _error,
    );
  }

  /// Étape 5: Succès
  Widget _buildStep5Success(bool isDark) {
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
            'Compte récupéré !',
            style: AppTypography.headlineSmall(),
          ),

          const SizedBox(height: 8),

          Text(
            'Votre compte a été transféré avec succès.\nVos contacts ont été restaurés.',
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
                context.go('/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Commencer',
                style: AppTypography.labelLarge(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget pour le flow de création de PIN
class _CreatePinFlow extends StatefulWidget {
  final void Function(String) onPinCreated;
  final String? error;

  const _CreatePinFlow({
    required this.onPinCreated,
    this.error,
  });

  @override
  State<_CreatePinFlow> createState() => _CreatePinFlowState();
}

class _CreatePinFlowState extends State<_CreatePinFlow> {
  int _step = 0;
  String _firstPin = '';
  String? _localError;

  void _onPinEntered(String pin) {
    if (_step == 0) {
      setState(() {
        _firstPin = pin;
        _step = 1;
        _localError = null;
      });
    } else {
      if (pin == _firstPin) {
        widget.onPinCreated(pin);
      } else {
        setState(() {
          _localError = 'Les codes ne correspondent pas';
          _step = 0;
          _firstPin = '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
            _step == 0 ? 'Créez votre code PIN' : 'Confirmez votre code PIN',
            style: AppTypography.headlineSmall(),
          ),

          const SizedBox(height: 8),

          Text(
            _step == 0
                ? 'Ce code protégera l\'accès à votre compte'
                : 'Entrez à nouveau votre code PIN',
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          if (_localError != null || widget.error != null) ...[
            Text(
              _localError ?? widget.error!,
              style: AppTypography.bodyMedium(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],

          HashPinField(
            key: ValueKey('create_pin_step_$_step'),
            onCompleted: _onPinEntered,
          ),

          const Spacer(),
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
    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (isVerified) {
      statusColor = AppColors.success;
      statusText = 'Vérifié';
      statusIcon = Icons.check_circle;
    } else if (isAvailable) {
      statusColor = AppColors.warning;
      statusText = 'En cours...';
      statusIcon = Icons.hourglass_empty;
    } else {
      statusColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
      statusText = 'Non disponible';
      statusIcon = Icons.cancel_outlined;
    }

    return Row(
      children: [
        Icon(icon, size: 20, color: statusColor),
        const SizedBox(width: 8),
        Text(label, style: AppTypography.bodyMedium()),
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
