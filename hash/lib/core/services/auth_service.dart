import 'dart:convert';

import 'secure_storage_service.dart';
import 'local_storage_service.dart';
import 'crypto_service.dart';
import 'destruction_service.dart';
import 'pin_security_service.dart';
import 'recovery_security_service.dart';

/// Authentication service for PIN authentication
class AuthService {
  final SecureStorageService _secureStorage;
  final LocalStorageService _localStorage;
  final CryptoService _crypto = CryptoService();
  DestructionService? _destructionService;
  PinSecurityService? _pinSecurity;
  RecoverySecurityService? _recoverySecurity;

  /// Master key kept in memory for the duration of the session
  /// (allows enabling biometric without re-entering PIN)
  String? _sessionMasterKeyBase64;

  AuthService({
    required SecureStorageService secureStorage,
    required LocalStorageService localStorage,
  })  : _secureStorage = secureStorage,
        _localStorage = localStorage;

  /// Set the destruction service (called after initialization)
  void setDestructionService(DestructionService service) {
    _destructionService = service;
  }

  /// Set the PIN security service (called after initialization)
  void setPinSecurityService(PinSecurityService service) {
    _pinSecurity = service;
  }

  /// Set the recovery security service (called after initialization)
  void setRecoverySecurityService(RecoverySecurityService service) {
    _recoverySecurity = service;
  }

  /// Set up PIN and initialize Hive encryption
  Future<void> setupPin(String pin) async {
    await _secureStorage.savePin(pin);

    // Generate master key and encrypt it with PIN-derived key
    final masterKey = _crypto.generateMasterKey();
    final salt = _crypto.generateSalt();
    final pinKey = await _crypto.deriveKeyFromPin(pin, salt);
    final encryptedMasterKey = await _crypto.encryptMasterKey(masterKey, pinKey);

    await _secureStorage.saveEncryptedMasterKey(
      encryptedMasterKey,
      base64Encode(salt),
    );

    // Set cipher on LocalStorageService
    _localStorage.setCipher(masterKey);
  }

  /// Verify PIN with rate limiting
  /// Retourne un AuthPinResult pour distinguer:
  /// - success: PIN correct
  /// - failed: PIN incorrect
  /// - ghostMode: code de destruction entré, mode fantôme activé
  /// - rateLimited: trop de tentatives, délai requis
  /// - destroyed: destruction déclenchée après 10 tentatives
  Future<AuthPinResult> verifyPin(String pin, {bool destructionOnMaxAttempts = true}) async {
    // Try to unlock Hive directly (fastest path for correct PIN)
    final unlocked = await _unlockHiveWithPin(pin);

    if (unlocked) {
      if (_pinSecurity != null) {
        await _pinSecurity!.recordSuccessfulAttempt();
      }
      return AuthPinResult.success;
    }

    // Unlock failed — check if it's the duress PIN (only if configured)
    if (await _secureStorage.hasDuressPin()) {
      if (await _secureStorage.verifyDuressPin(pin)) {
        if (_destructionService != null) {
          await _destructionService!.activateGhostMode();
        }
        if (_pinSecurity != null) {
          await _pinSecurity!.recordSuccessfulAttempt();
        }
        return AuthPinResult.ghostMode;
      }
    }

    // PIN incorrect - enregistrer l'échec et vérifier le rate limiting
    if (_pinSecurity != null) {
      final status = await _pinSecurity!.recordFailedAttempt(
        destructionOnMaxAttempts: destructionOnMaxAttempts,
      );

      if (status.destructionTriggered) {
        return AuthPinResult.destroyed;
      }
      if (status.accountLocked) {
        return AuthPinResult.locked;
      }
    }

    return AuthPinResult.failed;
  }

  /// Vérification locale du PIN sans enregistrer d'échec ni de rate limiting.
  /// Utilisé pour les vérifications internes (réglages, etc.)
  Future<bool> verifyPinOnly(String pin) async {
    return await _unlockHiveWithPin(pin);
  }

  /// Vérifier le statut de sécurité du PIN (rate limiting)
  Future<PinSecurityStatus?> checkPinSecurityStatus() async {
    if (_pinSecurity == null) return null;
    return await _pinSecurity!.checkCanAttempt();
  }

  /// Vérifier le statut de récupération
  Future<RecoveryStatus?> checkRecoveryStatus() async {
    if (_recoverySecurity == null) return null;
    return await _recoverySecurity!.checkRecoveryStatus();
  }

  /// Initier la récupération par phrase (après vérification de la phrase)
  Future<RecoveryInitResult?> initiateRecovery() async {
    if (_recoverySecurity == null) return null;
    return await _recoverySecurity!.initiateRecovery();
  }

  /// Finaliser la récupération (après le délai de 1h)
  Future<void> completeRecovery() async {
    if (_recoverySecurity != null) {
      await _recoverySecurity!.completeRecovery();
    }
  }

  /// Vérifier si le compte est verrouillé
  Future<bool> isAccountLocked() async {
    return await _secureStorage.isAccountLocked();
  }

  /// Déverrouiller le compte
  Future<void> clearAccountLocked() async {
    await _secureStorage.setAccountLocked(false);
  }

  /// Vérifier si on est en mode fantôme
  Future<bool> isGhostMode() async {
    return await _secureStorage.isGhostMode();
  }

  /// Check if PIN is set up
  Future<bool> hasPinSetup() async {
    return await _secureStorage.hasPin();
  }

  /// Set up duress PIN (panic code)
  Future<void> setupDuressPin(String pin) async {
    await _secureStorage.saveDuressPin(pin);
  }

  /// Check if duress PIN is set up
  Future<bool> hasDuressPin() async {
    return await _secureStorage.hasDuressPin();
  }

  /// Verify duress PIN (for modification flow - does NOT trigger destruction)
  Future<bool> verifyDuressPin(String pin) async {
    return await _secureStorage.verifyDuressPin(pin);
  }

  /// Save recovery phrase (for PIN reset)
  Future<void> saveRecoveryPhrase(String phrase) async {
    await _secureStorage.saveRecoveryPhrase(phrase);
  }

  /// Verify recovery phrase (for PIN reset)
  Future<bool> verifyRecoveryPhrase(String phrase) async {
    return await _secureStorage.verifyRecoveryPhrase(phrase);
  }

  /// Check if recovery phrase is set up
  Future<bool> hasRecoveryPhrase() async {
    return await _secureStorage.hasRecoveryPhrase();
  }

  /// Clear all local data (local storage + secure storage)
  Future<void> clearAllLocalData() async {
    // Delete all local data (may fail if Hive is corrupted)
    try {
      await _localStorage.deleteAllData();
    } catch (_) {
      // If Hive crashes, still continue to delete secure storage
    }

    // Delete all secure storage (MUST always run)
    await _secureStorage.deleteAll();
  }

  /// Unlock Hive boxes using PIN-derived key
  Future<bool> _unlockHiveWithPin(String pin) async {
    final encryptedMasterKey = await _secureStorage.getEncryptedMasterKey();
    final saltBase64 = await _secureStorage.getMasterKeySalt();

    if (encryptedMasterKey == null || saltBase64 == null) {
      return false;
    }

    final salt = base64Decode(saltBase64);

    // Try new (lighter) params first
    var pinKey = await _crypto.deriveKeyFromPin(pin, salt);
    var masterKey = await _crypto.decryptMasterKey(encryptedMasterKey, pinKey);

    if (masterKey == null) {
      // Fallback to legacy params (master key encrypted with old Argon2id config)
      pinKey = await _crypto.deriveKeyFromPinLegacy(pin, salt);
      masterKey = await _crypto.decryptMasterKey(encryptedMasterKey, pinKey);

      if (masterKey == null) return false;

      // Migrate: re-encrypt master key with new params
      final newPinKey = await _crypto.deriveKeyFromPin(pin, salt);
      final newEncrypted = await _crypto.encryptMasterKey(masterKey, newPinKey);
      await _secureStorage.saveEncryptedMasterKey(newEncrypted, saltBase64);
    }

    _sessionMasterKeyBase64 = base64Encode(masterKey);
    await _localStorage.closeAllBoxes();
    _localStorage.setCipher(masterKey);
    return true;
  }

  /// Unlock Hive boxes using biometric (master key stored in Secure Enclave)
  Future<bool> unlockHiveWithBiometric() async {
    final masterKeyBase64 = await _secureStorage.getPlainMasterKey();
    if (masterKeyBase64 == null) return false;

    _sessionMasterKeyBase64 = masterKeyBase64;
    final masterKey = base64Decode(masterKeyBase64);
    await _localStorage.closeAllBoxes();
    _localStorage.setCipher(masterKey);
    return true;
  }

  /// Enable biometric unlock (stores master key in Secure Enclave)
  Future<void> enableBiometricUnlock(String pin) async {
    final encryptedMasterKey = await _secureStorage.getEncryptedMasterKey();
    final saltBase64 = await _secureStorage.getMasterKeySalt();

    if (encryptedMasterKey == null || saltBase64 == null) return;

    final salt = base64Decode(saltBase64);
    final pinKey = await _crypto.deriveKeyFromPin(pin, salt);
    final masterKey = await _crypto.decryptMasterKey(encryptedMasterKey, pinKey);

    if (masterKey != null) {
      await _secureStorage.savePlainMasterKey(base64Encode(masterKey));
      await _secureStorage.setBiometricEnabled(true);
    }
  }

  /// Disable biometric unlock
  Future<void> disableBiometricUnlock() async {
    await _secureStorage.deletePlainMasterKey();
    await _secureStorage.setBiometricEnabled(false);
  }

  /// Enable biometric from current session (no PIN needed — master key in memory)
  Future<bool> enableBiometricFromSession() async {
    if (_sessionMasterKeyBase64 == null) return false;
    await _secureStorage.savePlainMasterKey(_sessionMasterKeyBase64!);
    await _secureStorage.setBiometricEnabled(true);
    return true;
  }

  /// Change PIN — re-encrypt master key with new PIN-derived key
  Future<bool> changePin(String oldPin, String newPin) async {
    final encryptedMasterKey = await _secureStorage.getEncryptedMasterKey();
    final saltBase64 = await _secureStorage.getMasterKeySalt();

    if (encryptedMasterKey == null || saltBase64 == null) {
      // No encryption set up — just update PIN hash
      await _secureStorage.savePin(newPin);
      return true;
    }

    // Decrypt with old PIN
    final oldSalt = base64Decode(saltBase64);
    final oldPinKey = await _crypto.deriveKeyFromPin(oldPin, oldSalt);
    final masterKey =
        await _crypto.decryptMasterKey(encryptedMasterKey, oldPinKey);

    if (masterKey == null) return false;

    // Re-encrypt with new PIN
    final newSalt = _crypto.generateSalt();
    final newPinKey = await _crypto.deriveKeyFromPin(newPin, newSalt);
    final newEncryptedMasterKey =
        await _crypto.encryptMasterKey(masterKey, newPinKey);

    await _secureStorage.saveEncryptedMasterKey(
      newEncryptedMasterKey,
      base64Encode(newSalt),
    );
    await _secureStorage.savePin(newPin);

    // Update biometric key if enabled
    if (await _secureStorage.isBiometricEnabled()) {
      await _secureStorage.savePlainMasterKey(base64Encode(masterKey));
    }

    return true;
  }

  /// Full authentication flow
  Future<AuthResult> authenticate() async {
    // Check if user has PIN set up
    if (!await hasPinSetup()) {
      return AuthResult.noPinSetup;
    }

    // Require PIN
    return AuthResult.requirePin;
  }
}

enum AuthResult {
  success,
  requirePin,
  noPinSetup,
  failed,
}

/// Résultat de la vérification du PIN
enum AuthPinResult {
  success,    // PIN correct
  failed,     // PIN incorrect
  ghostMode,  // Code de destruction entré, mode fantôme activé
  rateLimited, // Trop de tentatives, délai requis
  destroyed,  // Destruction déclenchée après 10 tentatives
  locked,     // Compte verrouillé après 10 tentatives (mode non-destructif)
}
