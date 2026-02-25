import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'crypto_service.dart';

/// Secure storage service for sensitive data (keys, PIN, etc.)
class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  final CryptoService _crypto = CryptoService();

  // ============ IDENTITY KEYS ============
  static const _keyIdentityPrivate = 'identity_private_key';
  static const _keyIdentityPublic = 'identity_public_key';
  static const _keySignedPrekey = 'signed_prekey';
  static const _keySignedPrekeyPrivate = 'signed_prekey_private';
  static const _keyRegistrationId = 'registration_id';

  // ============ SECURITY ============
  static const _keyPinHash = 'pin_hash_v2'; // v2 for Argon2id
  static const _keyDuressPinHash = 'duress_pin_hash_v2';
  static const _keyBiometricEnabled = 'biometric_enabled';
  static const _keyRecoveryPhraseHash = 'recovery_phrase_hash';

  // ============ GHOST MODE ============
  static const _keyGhostMode = 'ghost_mode';
  static const _keyPendingServerCleanup = 'pending_server_cleanup';

  // ============ ACCOUNT LOCKED ============
  static const _keyAccountLocked = 'account_locked';

  // ============ PIN SECURITY (Rate Limiting) ============
  static const _keyPinAttemptCount = 'pin_attempt_count';
  static const _keyPinLastAttemptTime = 'pin_last_attempt_time';
  static const _keyPinMonotonicCounter = 'pin_monotonic_counter';
  static const _keyRecoveryPendingUntil = 'recovery_pending_until';
  static const _keyRecoveryStartedAt = 'recovery_started_at';
  static const _keyPendingMessageDeletion = 'pending_message_deletion';

  // ============ USER DATA ============
  static const _keyUserId = 'user_id';
  static const _keyUserHashId = 'user_hash_id';
  static const _keyDeviceId = 'device_id';

  // ============ AUTH TOKENS ============
  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  // ============ DEVICE TRANSFER ============
  static const _keyTransferTempCode = 'transfer_temp_code';
  static const _keyTransferTempCodeExpiry = 'transfer_temp_code_expiry';
  static const _keyTransferCode = 'transfer_code';
  static const _keyTransferCodeExpiry = 'transfer_code_expiry';
  static const _keyTransferProximityCode = 'transfer_proximity_code';
  static const _keyTransferInProgress = 'transfer_in_progress';
  static const _keyDeviceBindingKey = 'device_binding_key';

  // ============ CONTACT ADD ============
  static const _keyContactAddCode = 'contact_add_code';
  static const _keyContactAddCodeExpiry = 'contact_add_code_expiry';

  // ============ HIVE ENCRYPTION (Master Key) ============
  static const _keyEncryptedMasterKey = 'encrypted_master_key';
  static const _keyMasterKeySalt = 'master_key_salt';
  static const _keyMasterKeyPlain = 'master_key_plain'; // For biometric unlock

  /// Save encrypted master key and salt
  Future<void> saveEncryptedMasterKey(String encryptedKey, String salt) async {
    await _storage.write(key: _keyEncryptedMasterKey, value: encryptedKey);
    await _storage.write(key: _keyMasterKeySalt, value: salt);
  }

  /// Get encrypted master key
  Future<String?> getEncryptedMasterKey() =>
      _storage.read(key: _keyEncryptedMasterKey);

  /// Get master key salt
  Future<String?> getMasterKeySalt() =>
      _storage.read(key: _keyMasterKeySalt);

  /// Save plain master key for biometric unlock (protected by Secure Enclave/TEE)
  Future<void> savePlainMasterKey(String masterKeyBase64) async {
    await _storage.write(key: _keyMasterKeyPlain, value: masterKeyBase64);
  }

  /// Get plain master key (biometric unlock)
  Future<String?> getPlainMasterKey() =>
      _storage.read(key: _keyMasterKeyPlain);

  /// Remove plain master key (when biometric is disabled)
  Future<void> deletePlainMasterKey() async {
    await _storage.delete(key: _keyMasterKeyPlain);
  }

  /// Check if encrypted master key exists (Hive encryption is set up)
  Future<bool> hasEncryptedMasterKey() async {
    return await _storage.read(key: _keyEncryptedMasterKey) != null;
  }

  // ============ PIN MANAGEMENT (Argon2id) ============

  /// Save PIN with Argon2id hash (memory-hard, GPU-resistant)
  Future<void> savePin(String pin) async {
    final hash = await _crypto.hashPinSecure(pin);
    await _storage.write(key: _keyPinHash, value: hash);
  }

  /// Verify PIN against Argon2id hash
  Future<bool> verifyPin(String pin) async {
    final stored = await _storage.read(key: _keyPinHash);
    if (stored == null) return false;
    return await _crypto.verifyPinSecure(pin, stored);
  }

  Future<bool> hasPin() async {
    return await _storage.read(key: _keyPinHash) != null;
  }

  Future<void> deletePin() async {
    await _storage.delete(key: _keyPinHash);
  }

  // ============ DURESS PIN (Panic Code) ============

  /// Save duress PIN with Argon2id hash
  Future<void> saveDuressPin(String pin) async {
    final hash = await _crypto.hashPinSecure(pin);
    await _storage.write(key: _keyDuressPinHash, value: hash);
  }

  /// Verify duress PIN
  Future<bool> verifyDuressPin(String pin) async {
    final stored = await _storage.read(key: _keyDuressPinHash);
    if (stored == null) return false;
    return await _crypto.verifyPinSecure(pin, stored);
  }

  Future<bool> hasDuressPin() async {
    return await _storage.read(key: _keyDuressPinHash) != null;
  }

  // ============ RECOVERY PHRASE (Local only) ============

  /// Save recovery phrase verification hash (for PIN reset on same device)
  Future<void> saveRecoveryPhrase(String phrase) async {
    final verificationHash = _crypto.createVerificationHash(phrase);
    await _storage.write(key: _keyRecoveryPhraseHash, value: verificationHash);
  }

  /// Verify recovery phrase locally
  Future<bool> verifyRecoveryPhrase(String phrase) async {
    final stored = await _storage.read(key: _keyRecoveryPhraseHash);
    if (stored == null) return false;

    final computedHash = _crypto.createVerificationHash(phrase);
    return stored == computedHash;
  }

  Future<bool> hasRecoveryPhrase() async {
    return await _storage.read(key: _keyRecoveryPhraseHash) != null;
  }

  // ============ BIOMETRIC ============
  Future<void> setBiometricEnabled(bool enabled) async {
    await _storage.write(key: _keyBiometricEnabled, value: enabled.toString());
  }

  Future<bool> isBiometricEnabled() async {
    final value = await _storage.read(key: _keyBiometricEnabled);
    return value == 'true';
  }

  // ============ PIN SECURITY (Rate Limiting) ============

  /// Get current PIN attempt count
  Future<int> getPinAttemptCount() async {
    final value = await _storage.read(key: _keyPinAttemptCount);
    return value != null ? int.tryParse(value) ?? 0 : 0;
  }

  /// Increment PIN attempt count
  Future<void> incrementPinAttemptCount() async {
    final current = await getPinAttemptCount();
    await _storage.write(key: _keyPinAttemptCount, value: (current + 1).toString());
    // Also update last attempt time with monotonic counter for anti-cheat
    await _updateLastAttemptTime();
  }

  /// Reset PIN attempt count (after successful auth)
  Future<void> resetPinAttemptCount() async {
    await _storage.write(key: _keyPinAttemptCount, value: '0');
    await _storage.delete(key: _keyPinLastAttemptTime);
  }

  /// Get last attempt timestamp with monotonic counter
  Future<Map<String, int>> getLastAttemptInfo() async {
    final timeStr = await _storage.read(key: _keyPinLastAttemptTime);
    final counterStr = await _storage.read(key: _keyPinMonotonicCounter);

    return {
      'timestamp': timeStr != null ? int.tryParse(timeStr) ?? 0 : 0,
      'counter': counterStr != null ? int.tryParse(counterStr) ?? 0 : 0,
    };
  }

  /// Update last attempt time with anti-cheat protection
  Future<void> _updateLastAttemptTime() async {
    final now = DateTime.now().millisecondsSinceEpoch;

    // Get previous counter and increment
    final counterStr = await _storage.read(key: _keyPinMonotonicCounter);
    final counter = (counterStr != null ? int.tryParse(counterStr) ?? 0 : 0) + 1;

    await _storage.write(key: _keyPinLastAttemptTime, value: now.toString());
    await _storage.write(key: _keyPinMonotonicCounter, value: counter.toString());
  }

  /// Set recovery pending until timestamp (1h from now)
  Future<void> setRecoveryPendingUntil(int timestamp) async {
    await _storage.write(key: _keyRecoveryPendingUntil, value: timestamp.toString());
    await _storage.write(
      key: _keyRecoveryStartedAt,
      value: DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }

  /// Get recovery pending until timestamp
  Future<int?> getRecoveryPendingUntil() async {
    final value = await _storage.read(key: _keyRecoveryPendingUntil);
    return value != null ? int.tryParse(value) : null;
  }

  /// Get recovery started timestamp
  Future<int?> getRecoveryStartedAt() async {
    final value = await _storage.read(key: _keyRecoveryStartedAt);
    return value != null ? int.tryParse(value) : null;
  }

  /// Clear recovery pending
  Future<void> clearRecoveryPending() async {
    await _storage.delete(key: _keyRecoveryPendingUntil);
    await _storage.delete(key: _keyRecoveryStartedAt);
  }

  /// Set pending message deletion flag
  Future<void> setPendingMessageDeletion(bool pending) async {
    await _storage.write(key: _keyPendingMessageDeletion, value: pending.toString());
  }

  /// Check if message deletion is pending (for server sync)
  Future<bool> hasPendingMessageDeletion() async {
    final value = await _storage.read(key: _keyPendingMessageDeletion);
    return value == 'true';
  }

  // ============ GHOST MODE ============

  /// Activer le mode fantôme (après code de destruction)
  Future<void> setGhostMode(bool enabled) async {
    await _storage.write(key: _keyGhostMode, value: enabled.toString());
  }

  /// Vérifier si l'app est en mode fantôme
  Future<bool> isGhostMode() async {
    final value = await _storage.read(key: _keyGhostMode);
    return value == 'true';
  }

  /// Marquer qu'une suppression serveur est en attente
  Future<void> setPendingServerCleanup(bool pending) async {
    await _storage.write(key: _keyPendingServerCleanup, value: pending.toString());
  }

  /// Vérifier si une suppression serveur est en attente
  Future<bool> hasPendingServerCleanup() async {
    final value = await _storage.read(key: _keyPendingServerCleanup);
    return value == 'true';
  }

  // ============ ACCOUNT LOCKED ============

  /// Verrouiller/déverrouiller le compte (après 10 tentatives PIN échouées, mode non-destructif)
  Future<void> setAccountLocked(bool locked) async {
    await _storage.write(key: _keyAccountLocked, value: locked.toString());
  }

  /// Vérifier si le compte est verrouillé
  Future<bool> isAccountLocked() async {
    final value = await _storage.read(key: _keyAccountLocked);
    return value == 'true';
  }

  // ============ USER DATA ============
  Future<void> saveUserData({
    required String userId,
    required String hashId,
    required String deviceId,
  }) async {
    await _storage.write(key: _keyUserId, value: userId);
    await _storage.write(key: _keyUserHashId, value: hashId);
    await _storage.write(key: _keyDeviceId, value: deviceId);
  }

  Future<String?> getUserId() => _storage.read(key: _keyUserId);
  Future<String?> getUserHashId() => _storage.read(key: _keyUserHashId);
  Future<String?> getDeviceId() => _storage.read(key: _keyDeviceId);

  // ============ AUTH TOKENS ============
  Future<void> saveAccessToken(String token) =>
      _storage.write(key: _keyAccessToken, value: token);
  Future<void> saveRefreshToken(String token) =>
      _storage.write(key: _keyRefreshToken, value: token);
  Future<String?> getAccessToken() => _storage.read(key: _keyAccessToken);
  Future<String?> getRefreshToken() => _storage.read(key: _keyRefreshToken);

  // ============ IDENTITY KEYS (Signal Protocol) ============
  Future<void> saveIdentityKeys({
    required String privateKey,
    required String publicKey,
    required int registrationId,
  }) async {
    await _storage.write(key: _keyIdentityPrivate, value: privateKey);
    await _storage.write(key: _keyIdentityPublic, value: publicKey);
    await _storage.write(key: _keyRegistrationId, value: registrationId.toString());
  }

  Future<String?> getIdentityPrivateKey() =>
      _storage.read(key: _keyIdentityPrivate);
  Future<String?> getIdentityPublicKey() =>
      _storage.read(key: _keyIdentityPublic);
  Future<int?> getRegistrationId() async {
    final value = await _storage.read(key: _keyRegistrationId);
    return value != null ? int.tryParse(value) : null;
  }

  Future<void> saveSignedPrekey({
    required String publicKey,
    required String privateKey,
  }) async {
    await _storage.write(key: _keySignedPrekey, value: publicKey);
    await _storage.write(key: _keySignedPrekeyPrivate, value: privateKey);
  }

  Future<String?> getSignedPrekeyPublic() =>
      _storage.read(key: _keySignedPrekey);
  Future<String?> getSignedPrekeyPrivate() =>
      _storage.read(key: _keySignedPrekeyPrivate);

  // ============ DEVICE TRANSFER ============

  /// Generate and save temporary code for transfer initiation (6 digits)
  Future<String> generateTransferTempCode() async {
    final code = _crypto.generateSecureCode(6);
    final expiry = DateTime.now().add(const Duration(minutes: 5)).millisecondsSinceEpoch;
    await _storage.write(key: _keyTransferTempCode, value: code);
    await _storage.write(key: _keyTransferTempCodeExpiry, value: expiry.toString());
    return code;
  }

  /// Verify temporary transfer code
  Future<bool> verifyTransferTempCode(String code) async {
    final stored = await _storage.read(key: _keyTransferTempCode);
    final expiryStr = await _storage.read(key: _keyTransferTempCodeExpiry);
    if (stored == null || expiryStr == null) return false;

    final expiry = int.tryParse(expiryStr) ?? 0;
    if (DateTime.now().millisecondsSinceEpoch > expiry) {
      await clearTransferTempCode();
      return false;
    }
    return stored == code;
  }

  /// Get current temp code (for display)
  Future<String?> getTransferTempCode() async {
    final expiryStr = await _storage.read(key: _keyTransferTempCodeExpiry);
    if (expiryStr != null) {
      final expiry = int.tryParse(expiryStr) ?? 0;
      if (DateTime.now().millisecondsSinceEpoch > expiry) {
        await clearTransferTempCode();
        return null;
      }
    }
    return _storage.read(key: _keyTransferTempCode);
  }

  /// Get temp code expiry timestamp
  Future<int?> getTransferTempCodeExpiry() async {
    final value = await _storage.read(key: _keyTransferTempCodeExpiry);
    return value != null ? int.tryParse(value) : null;
  }

  /// Clear temporary transfer code
  Future<void> clearTransferTempCode() async {
    await _storage.delete(key: _keyTransferTempCode);
    await _storage.delete(key: _keyTransferTempCodeExpiry);
  }

  /// Save contact add code (from server) with expiry
  Future<void> saveContactAddCode(String code, {int expiryMinutes = 5}) async {
    final expiry = DateTime.now().add(Duration(minutes: expiryMinutes)).millisecondsSinceEpoch;
    await _storage.write(key: _keyContactAddCode, value: code);
    await _storage.write(key: _keyContactAddCodeExpiry, value: expiry.toString());
  }

  /// Get current contact add code (for display)
  Future<String?> getContactAddCode() async {
    final expiryStr = await _storage.read(key: _keyContactAddCodeExpiry);
    if (expiryStr != null) {
      final expiry = int.tryParse(expiryStr) ?? 0;
      if (DateTime.now().millisecondsSinceEpoch > expiry) {
        await clearContactAddCode();
        return null;
      }
    }
    return _storage.read(key: _keyContactAddCode);
  }

  /// Get contact add code expiry timestamp
  Future<int?> getContactAddCodeExpiry() async {
    final value = await _storage.read(key: _keyContactAddCodeExpiry);
    return value != null ? int.tryParse(value) : null;
  }

  /// Clear contact add code
  Future<void> clearContactAddCode() async {
    await _storage.delete(key: _keyContactAddCode);
    await _storage.delete(key: _keyContactAddCodeExpiry);
  }

  /// Generate and save transfer code (generated after PIN verification)
  Future<String> generateTransferCode() async {
    // Format: TRF-XXXX-XXXX-XXXX (alphanumeric, easy to type)
    final part1 = _crypto.generateSecureCode(4, alphanumeric: true);
    final part2 = _crypto.generateSecureCode(4, alphanumeric: true);
    final part3 = _crypto.generateSecureCode(4, alphanumeric: true);
    final code = 'TRF-$part1-$part2-$part3';
    final expiry = DateTime.now().add(const Duration(minutes: 5)).millisecondsSinceEpoch;
    await _storage.write(key: _keyTransferCode, value: code);
    await _storage.write(key: _keyTransferCodeExpiry, value: expiry.toString());
    return code;
  }

  /// Get current transfer code
  Future<String?> getTransferCode() async {
    final expiryStr = await _storage.read(key: _keyTransferCodeExpiry);
    if (expiryStr != null) {
      final expiry = int.tryParse(expiryStr) ?? 0;
      if (DateTime.now().millisecondsSinceEpoch > expiry) {
        await clearTransferCode();
        return null;
      }
    }
    return _storage.read(key: _keyTransferCode);
  }

  /// Get transfer code expiry
  Future<int?> getTransferCodeExpiry() async {
    final value = await _storage.read(key: _keyTransferCodeExpiry);
    return value != null ? int.tryParse(value) : null;
  }

  /// Verify transfer code
  Future<bool> verifyTransferCode(String code) async {
    final stored = await _storage.read(key: _keyTransferCode);
    final expiryStr = await _storage.read(key: _keyTransferCodeExpiry);
    if (stored == null || expiryStr == null) return false;

    final expiry = int.tryParse(expiryStr) ?? 0;
    if (DateTime.now().millisecondsSinceEpoch > expiry) {
      await clearTransferCode();
      return false;
    }
    return stored.toUpperCase() == code.toUpperCase();
  }

  /// Clear transfer code
  Future<void> clearTransferCode() async {
    await _storage.delete(key: _keyTransferCode);
    await _storage.delete(key: _keyTransferCodeExpiry);
  }

  /// Generate proximity verification code (emojis)
  Future<String> generateProximityCode() async {
    final code = _crypto.generateEmojiCode(4);
    await _storage.write(key: _keyTransferProximityCode, value: code);
    return code;
  }

  /// Get proximity code
  Future<String?> getProximityCode() => _storage.read(key: _keyTransferProximityCode);

  /// Clear proximity code
  Future<void> clearProximityCode() async {
    await _storage.delete(key: _keyTransferProximityCode);
  }

  /// Set transfer in progress flag
  Future<void> setTransferInProgress(bool inProgress) async {
    await _storage.write(key: _keyTransferInProgress, value: inProgress.toString());
  }

  /// Check if transfer is in progress
  Future<bool> isTransferInProgress() async {
    final value = await _storage.read(key: _keyTransferInProgress);
    return value == 'true';
  }

  /// Clear all transfer-related data
  Future<void> clearAllTransferData() async {
    await clearTransferTempCode();
    await clearTransferCode();
    await clearProximityCode();
    await clearContactAddCode();
    await setTransferInProgress(false);
  }

  /// Get device binding key (for device attestation)
  Future<String?> getDeviceBindingKey() => _storage.read(key: _keyDeviceBindingKey);

  /// Save device binding key
  Future<void> saveDeviceBindingKey(String key) =>
      _storage.write(key: _keyDeviceBindingKey, value: key);

  /// Get all identity data for transfer (encrypted export)
  Future<Map<String, String?>> getTransferableData() async {
    return {
      'identityPrivateKey': await getIdentityPrivateKey(),
      'identityPublicKey': await getIdentityPublicKey(),
      'registrationId': (await getRegistrationId())?.toString(),
      'signedPrekeyPublic': await getSignedPrekeyPublic(),
      'signedPrekeyPrivate': await getSignedPrekeyPrivate(),
      'userId': await getUserId(),
      'hashId': await getUserHashId(),
      'recoveryPhraseHash': await _storage.read(key: _keyRecoveryPhraseHash),
    };
  }

  /// Import transferred data
  Future<void> importTransferredData(Map<String, String?> data) async {
    if (data['identityPrivateKey'] != null && data['identityPublicKey'] != null) {
      await saveIdentityKeys(
        privateKey: data['identityPrivateKey']!,
        publicKey: data['identityPublicKey']!,
        registrationId: int.tryParse(data['registrationId'] ?? '') ?? 0,
      );
    }
    if (data['signedPrekeyPublic'] != null && data['signedPrekeyPrivate'] != null) {
      await saveSignedPrekey(
        publicKey: data['signedPrekeyPublic']!,
        privateKey: data['signedPrekeyPrivate']!,
      );
    }
    if (data['userId'] != null && data['hashId'] != null) {
      await _storage.write(key: _keyUserId, value: data['userId']!);
      await _storage.write(key: _keyUserHashId, value: data['hashId']!);
    }
    if (data['recoveryPhraseHash'] != null) {
      await _storage.write(key: _keyRecoveryPhraseHash, value: data['recoveryPhraseHash']!);
    }
  }

  // ============ GENERIC OPERATIONS ============
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  Future<String?> read(String key) => _storage.read(key: key);

  Future<void> delete(String key) => _storage.delete(key: key);

  /// Delete ALL secure data (full panic)
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Suppression pour mode fantôme - garde l'identité
  /// Supprime uniquement les sessions, mais garde:
  /// - hash_id, user_id, device_id
  /// - PIN, duress PIN, recovery phrase
  /// - identity keys (pour garder la même identité)
  /// - ghost_mode et pending_server_cleanup flags
  Future<void> deleteForGhostMode() async {
    // On ne supprime rien ici car on garde tout sauf les données locales
    // (contacts, messages, sessions) qui sont dans LocalStorageService
    // Cette méthode existe pour la clarté du code
  }
}
