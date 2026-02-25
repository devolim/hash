import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';

import 'secure_storage_service.dart';
import 'signal_protocol_store.dart';

/// Encrypted message result from Double Ratchet.
class DoubleRatchetResult {
  /// CiphertextMessage.whisperType (2) or CiphertextMessage.prekeyType (3)
  final int type;
  final Uint8List ciphertext;

  DoubleRatchetResult({required this.type, required this.ciphertext});
}

/// Service encapsulating libsignal_protocol_dart for Double Ratchet E2E encryption.
///
/// Sits between the plaintext payload and the Sealed Sender outer layer:
///   Plaintext → Double Ratchet (this) → Sealed Sender → Server
class SignalProtocolService {
  final SecureStorageService _secureStorage;

  HiveSessionStore? _sessionStore;
  HivePreKeyStore? _preKeyStore;
  HiveSignedPreKeyStore? _signedPreKeyStore;
  HiveIdentityKeyStore? _identityKeyStore;

  bool _initialized = false;

  /// Decryption failure counter per contact (for auto session reset).
  final Map<String, int> _decryptionFailures = {};
  static const int _maxDecryptionFailures = 3;

  SignalProtocolService({required SecureStorageService secureStorage})
      : _secureStorage = secureStorage;

  bool get isInitialized => _initialized;

  /// Initialize the stores. Must be called after PIN unlock (cipher available).
  Future<void> initialize(HiveAesCipher? cipher) async {
    if (_initialized) return;

    // Load our identity key pair from SecureStorage
    final identityPrivateB64 = await _secureStorage.getIdentityPrivateKey();
    final registrationId = await _secureStorage.getRegistrationId();

    if (identityPrivateB64 == null || registrationId == null) {
      debugPrint('[SignalProtocol] No identity key or registration ID found, skipping init');
      return;
    }

    // Reconstruct the IdentityKeyPair from the stored private key
    final identityKeyPair = generateIdentityKeyPairFromPrivate(
      base64Decode(identityPrivateB64),
    );

    _sessionStore = HiveSessionStore(cipher);
    _preKeyStore = HivePreKeyStore(cipher);
    _signedPreKeyStore = HiveSignedPreKeyStore(cipher);
    _identityKeyStore = HiveIdentityKeyStore(
      cipher,
      identityKeyPair: identityKeyPair,
      localRegistrationId: registrationId,
    );

    _initialized = true;
    debugPrint('[SignalProtocol] Initialized with registrationId=$registrationId');
  }

  /// Build a session from a PreKeyBundle received during contact exchange.
  Future<void> initializeSessionFromBundle(
    String contactId,
    PreKeyBundle bundle,
  ) async {
    _assertInitialized();

    final address = SignalProtocolAddress(contactId, 1);
    final sessionBuilder = SessionBuilder(
      _sessionStore!,
      _preKeyStore!,
      _signedPreKeyStore!,
      _identityKeyStore!,
      address,
    );

    await sessionBuilder.processPreKeyBundle(bundle);
    debugPrint('[SignalProtocol] Session initialized for $contactId');
  }

  /// Check if we have an active session with a contact.
  Future<bool> hasSession(String contactId) async {
    _assertInitialized();
    final address = SignalProtocolAddress(contactId, 1);
    return await _sessionStore!.containsSession(address);
  }

  /// Encrypt a plaintext message using the Double Ratchet.
  Future<DoubleRatchetResult> encryptMessage(
    String contactId,
    Uint8List plaintext,
  ) async {
    _assertInitialized();

    final address = SignalProtocolAddress(contactId, 1);
    final cipher = SessionCipher(
      _sessionStore!,
      _preKeyStore!,
      _signedPreKeyStore!,
      _identityKeyStore!,
      address,
    );

    final ciphertextMessage = await cipher.encrypt(plaintext);

    return DoubleRatchetResult(
      type: ciphertextMessage.getType(),
      ciphertext: ciphertextMessage.serialize(),
    );
  }

  /// Decrypt a message received from a contact.
  Future<Uint8List> decryptMessage(
    String contactId,
    int type,
    Uint8List ciphertext,
  ) async {
    _assertInitialized();

    final address = SignalProtocolAddress(contactId, 1);
    final cipher = SessionCipher(
      _sessionStore!,
      _preKeyStore!,
      _signedPreKeyStore!,
      _identityKeyStore!,
      address,
    );

    try {
      Uint8List plaintext;
      if (type == CiphertextMessage.prekeyType) {
        plaintext = await cipher
            .decrypt(PreKeySignalMessage(ciphertext));
      } else {
        plaintext = await cipher
            .decryptFromSignal(SignalMessage.fromSerialized(ciphertext));
      }

      // Clear failure counter on success
      _decryptionFailures.remove(contactId);
      return plaintext;
    } catch (e) {
      _recordDecryptionFailure(contactId);
      rethrow;
    }
  }

  /// Delete the session with a contact (after repeated failures or session reset).
  Future<void> resetSession(String contactId) async {
    _assertInitialized();
    final address = SignalProtocolAddress(contactId, 1);
    await _sessionStore!.deleteSession(address);
    _decryptionFailures.remove(contactId);
    debugPrint('[SignalProtocol] Session reset for $contactId');
  }

  /// Store a batch of pre-generated prekeys into the local store.
  /// Called during registration after key generation.
  Future<void> storePreKeys(List<PreKeyRecord> preKeys) async {
    _assertInitialized();
    for (final pk in preKeys) {
      await _preKeyStore!.storePreKey(pk.id, pk);
    }
    debugPrint('[SignalProtocol] Stored ${preKeys.length} prekeys');
  }

  /// Store a signed prekey into the local store.
  Future<void> storeSignedPreKey(SignedPreKeyRecord signedPreKey) async {
    _assertInitialized();
    await _signedPreKeyStore!.storeSignedPreKey(signedPreKey.id, signedPreKey);
    debugPrint('[SignalProtocol] Stored signed prekey ${signedPreKey.id}');
  }

  /// Check if the signed prekey with the given ID exists in the local store.
  Future<bool> hasSignedPreKey(int signedPreKeyId) async {
    if (!_initialized || _signedPreKeyStore == null) return false;
    return await _signedPreKeyStore!.containsSignedPreKey(signedPreKeyId);
  }

  /// Check if auto session reset is needed for a contact.
  bool shouldAutoResetSession(String contactId) {
    return (_decryptionFailures[contactId] ?? 0) >= _maxDecryptionFailures;
  }

  /// Close all stores.
  Future<void> close() async {
    await _sessionStore?.close();
    await _preKeyStore?.close();
    await _signedPreKeyStore?.close();
    await _identityKeyStore?.close();
    _initialized = false;
  }

  /// Delete all store data from disk (account deletion).
  Future<void> deleteAllData() async {
    try { await _sessionStore?.deleteFromDisk(); } catch (_) {}
    try { await _preKeyStore?.deleteFromDisk(); } catch (_) {}
    try { await _signedPreKeyStore?.deleteFromDisk(); } catch (_) {}
    try { await _identityKeyStore?.deleteFromDisk(); } catch (_) {}
    _sessionStore = null;
    _preKeyStore = null;
    _signedPreKeyStore = null;
    _identityKeyStore = null;
    _initialized = false;
  }

  // ============ HELPERS ============

  void _assertInitialized() {
    if (!_initialized) {
      throw StateError(
        'SignalProtocolService not initialized. Call initialize() after PIN unlock.',
      );
    }
  }

  void _recordDecryptionFailure(String contactId) {
    _decryptionFailures[contactId] =
        (_decryptionFailures[contactId] ?? 0) + 1;
    debugPrint(
      '[SignalProtocol] Decryption failure #${_decryptionFailures[contactId]} for $contactId',
    );
  }

  /// Build a PreKeyBundle from contact exchange data (server response).
  static PreKeyBundle buildPreKeyBundle({
    required int registrationId,
    required String identityPublicKeyB64,
    required int signedPreKeyId,
    required String signedPreKeyPublicB64,
    required String signedPreKeySignatureB64,
    int? preKeyId,
    String? preKeyPublicB64,
  }) {
    final identityKey = IdentityKey.fromBytes(
      Uint8List.fromList([0x05, ...base64Decode(identityPublicKeyB64)]),
      0,
    );

    final signedPreKeyPublic = Curve.decodePoint(
      Uint8List.fromList([0x05, ...base64Decode(signedPreKeyPublicB64)]),
      0,
    );

    ECPublicKey? preKeyPublic;
    if (preKeyPublicB64 != null) {
      preKeyPublic = Curve.decodePoint(
        Uint8List.fromList([0x05, ...base64Decode(preKeyPublicB64)]),
        0,
      );
    }

    return PreKeyBundle(
      registrationId,
      1, // deviceId
      preKeyId,
      preKeyPublic,
      signedPreKeyId,
      signedPreKeyPublic,
      base64Decode(signedPreKeySignatureB64),
      identityKey,
    );
  }
}
