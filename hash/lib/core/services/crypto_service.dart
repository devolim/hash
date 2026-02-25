import 'dart:convert';
import 'dart:typed_data';
import 'package:hash/core/utils/bip39_helper.dart';
import 'package:cryptography/cryptography.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart' as signal;

/// Cryptography service for secure PIN hashing and recovery phrase validation
class CryptoService {
  // Singleton instance
  static final CryptoService _instance = CryptoService._internal();
  factory CryptoService() => _instance;
  CryptoService._internal();

  // Argon2id for PIN hashing (memory-hard, GPU-resistant)
  // Legacy params — used ONLY to verify existing hashes (duress PIN)
  final _argon2idLegacy = Argon2id(
    parallelism: 4,
    memory: 65536, // 64 MB
    iterations: 3,
    hashLength: 32,
  );

  // New lighter params — used for all new hashing & key derivation
  final _argon2id = Argon2id(
    parallelism: 4,
    memory: 32768, // 32 MB
    iterations: 2,
    hashLength: 32,
  );

  /// Hash PIN with Argon2id (memory-hard, GPU-resistant)
  /// Returns base64 encoded hash with embedded salt
  Future<String> hashPinSecure(String pin) async {
    // Generate random salt
    final salt = SecretKeyData.random(length: 16).bytes;

    // Hash with Argon2id
    final hash = await _argon2id.deriveKey(
      secretKey: SecretKey(utf8.encode(pin)),
      nonce: salt,
    );

    final hashBytes = await hash.extractBytes();

    // Format: salt (16 bytes) + hash (32 bytes) = 48 bytes total
    final combined = Uint8List(48);
    combined.setRange(0, 16, salt);
    combined.setRange(16, 48, hashBytes);

    return base64Encode(combined);
  }

  /// Verify PIN against Argon2id hash
  /// Tries legacy params first (for existing hashes), then new params
  Future<bool> verifyPinSecure(String pin, String storedHash) async {
    try {
      final combined = base64Decode(storedHash);
      if (combined.length != 48) return false;

      final salt = combined.sublist(0, 16);
      final expectedHash = combined.sublist(16, 48);

      // Try legacy params first (existing hashes)
      final legacyHash = await _argon2idLegacy.deriveKey(
        secretKey: SecretKey(utf8.encode(pin)),
        nonce: salt,
      );
      if (_constantTimeEquals(expectedHash, await legacyHash.extractBytes())) {
        return true;
      }

      // Try new params (for hashes created after migration)
      final newHash = await _argon2id.deriveKey(
        secretKey: SecretKey(utf8.encode(pin)),
        nonce: salt,
      );
      return _constantTimeEquals(expectedHash, await newHash.extractBytes());
    } catch (e) {
      return false;
    }
  }

  /// Generate a random recovery phrase (24 words BIP39)
  String generateRecoveryPhrase() {
    return Bip39Helper.generateMnemonic(strength: 256); // 256 bits = 24 words
  }

  /// Validate a recovery phrase (BIP39 format)
  bool validateRecoveryPhrase(String phrase) {
    return Bip39Helper.validateMnemonic(phrase.toLowerCase().trim());
  }

  /// Create a verification hash of the recovery phrase (for local verification)
  /// This is a fast hash just for checking if the phrase is correct on same device
  String createVerificationHash(String phrase) {
    // Normalize the phrase
    final normalized = phrase.toLowerCase().trim();
    // Add a pepper for extra security
    final peppered = 'hash_verify_$normalized';
    final bytes = utf8.encode(peppered);
    final digest = crypto.sha256.convert(bytes);
    return digest.toString();
  }

  /// Constant-time comparison to prevent timing attacks
  bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    int result = 0;
    for (int i = 0; i < a.length; i++) {
      result |= a[i] ^ b[i];
    }
    return result == 0;
  }

  /// Generate a secure random code (digits only or alphanumeric)
  String generateSecureCode(int length, {bool alphanumeric = false}) {
    final random = SecretKeyData.random(length: length);
    final bytes = random.bytes;

    if (alphanumeric) {
      // Use alphanumeric characters (uppercase, no confusing chars like 0/O, 1/I/L)
      const chars = 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';
      return List.generate(length, (i) => chars[bytes[i] % chars.length]).join();
    } else {
      // Digits only
      return List.generate(length, (i) => (bytes[i] % 10).toString()).join();
    }
  }

  /// Generate emoji code for proximity verification
  String generateEmojiCode(int length) {
    // Use easily distinguishable emojis
    const emojis = [
      '🔵', '🔴', '🟢', '🟡', '🟣', '🟠',
      '⭐', '🌙', '☀️', '❤️', '💎', '🔔',
      '🎈', '🎁', '🌸', '🍎', '🌊', '🔥',
    ];
    final random = SecretKeyData.random(length: length);
    final bytes = random.bytes;
    return List.generate(length, (i) => emojis[bytes[i] % emojis.length]).join(' ');
  }

  /// Encrypt data for transfer using a shared secret
  Future<String> encryptForTransfer(String data, String secret) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = await _deriveKeyFromSecret(secret);
    final nonce = algorithm.newNonce();

    final encrypted = await algorithm.encrypt(
      utf8.encode(data),
      secretKey: secretKey,
      nonce: nonce,
    );

    // Combine nonce + ciphertext + mac
    final combined = Uint8List(nonce.length + encrypted.cipherText.length + encrypted.mac.bytes.length);
    combined.setRange(0, nonce.length, nonce);
    combined.setRange(nonce.length, nonce.length + encrypted.cipherText.length, encrypted.cipherText);
    combined.setRange(nonce.length + encrypted.cipherText.length, combined.length, encrypted.mac.bytes);

    return base64Encode(combined);
  }

  /// Decrypt data received from transfer
  Future<String?> decryptFromTransfer(String encryptedData, String secret) async {
    try {
      final algorithm = AesGcm.with256bits();
      final secretKey = await _deriveKeyFromSecret(secret);
      final combined = base64Decode(encryptedData);

      // AES-GCM nonce is 12 bytes, MAC is 16 bytes
      const nonceLength = 12;
      const macLength = 16;

      if (combined.length < nonceLength + macLength) return null;

      final nonce = combined.sublist(0, nonceLength);
      final cipherText = combined.sublist(nonceLength, combined.length - macLength);
      final mac = Mac(combined.sublist(combined.length - macLength));

      final decrypted = await algorithm.decrypt(
        SecretBox(cipherText, nonce: nonce, mac: mac),
        secretKey: secretKey,
      );

      return utf8.decode(decrypted);
    } catch (e) {
      return null;
    }
  }

  /// Derive a key from a shared secret (transfer code)
  Future<SecretKey> _deriveKeyFromSecret(String secret) async {
    final hkdf = Hkdf(
      hmac: Hmac.sha256(),
      outputLength: 32,
    );
    return await hkdf.deriveKey(
      secretKey: SecretKey(utf8.encode(secret)),
      info: utf8.encode('hash_transfer_v1'),
      nonce: utf8.encode('hash_salt_transfer'),
    );
  }

  /// Generate a signature for device binding (XEdDSA via libsignal Curve25519)
  String signData(String data, String privateKey) {
    final keyBytes = base64Decode(privateKey);
    if (keyBytes.length < 32) {
      throw ArgumentError('Private key must be at least 32 bytes, got ${keyBytes.length}');
    }
    final signingKey = signal.Curve.decodePrivatePoint(
      Uint8List.fromList(keyBytes.sublist(0, 32)),
    );
    final signatureBytes = signal.Curve.calculateSignature(
      signingKey,
      Uint8List.fromList(utf8.encode(data)),
    );
    return base64Encode(signatureBytes);
  }

  /// Verify a signature (XEdDSA via libsignal Curve25519)
  bool verifySignature(String data, String signature, String publicKey) {
    try {
      final pubKey = signal.Curve.decodePoint(
        Uint8List.fromList([0x05, ...base64Decode(publicKey)]),
        0,
      );
      return signal.Curve.verifySignature(
        pubKey,
        Uint8List.fromList(utf8.encode(data)),
        base64Decode(signature),
      );
    } catch (e) {
      return false;
    }
  }

  // ============================================================
  // HIVE ENCRYPTION (Master Key + PIN derivation)
  // ============================================================

  /// Generate a random 32-byte master key for Hive encryption
  List<int> generateMasterKey() {
    return SecretKeyData.random(length: 32).bytes;
  }

  /// Derive a 32-byte key from PIN using Argon2id (new params)
  Future<List<int>> deriveKeyFromPin(String pin, List<int> salt) async {
    final derived = await _argon2id.deriveKey(
      secretKey: SecretKey(utf8.encode(pin)),
      nonce: salt,
    );
    return await derived.extractBytes();
  }

  /// Derive a 32-byte key from PIN using legacy Argon2id params
  Future<List<int>> deriveKeyFromPinLegacy(String pin, List<int> salt) async {
    final derived = await _argon2idLegacy.deriveKey(
      secretKey: SecretKey(utf8.encode(pin)),
      nonce: salt,
    );
    return await derived.extractBytes();
  }

  /// Encrypt the master key with a PIN-derived key using AES-GCM
  /// Returns base64-encoded: nonce (12) + ciphertext + mac (16)
  Future<String> encryptMasterKey(List<int> masterKey, List<int> pinKey) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = SecretKey(pinKey);
    final nonce = algorithm.newNonce();

    final encrypted = await algorithm.encrypt(
      masterKey,
      secretKey: secretKey,
      nonce: nonce,
    );

    final combined = Uint8List(
      nonce.length + encrypted.cipherText.length + encrypted.mac.bytes.length,
    );
    combined.setRange(0, nonce.length, nonce);
    combined.setRange(
      nonce.length,
      nonce.length + encrypted.cipherText.length,
      encrypted.cipherText,
    );
    combined.setRange(
      nonce.length + encrypted.cipherText.length,
      combined.length,
      encrypted.mac.bytes,
    );

    return base64Encode(combined);
  }

  /// Decrypt the master key with a PIN-derived key
  /// Returns null if decryption fails (wrong PIN)
  Future<List<int>?> decryptMasterKey(
    String encryptedMasterKey,
    List<int> pinKey,
  ) async {
    try {
      final algorithm = AesGcm.with256bits();
      final secretKey = SecretKey(pinKey);
      final combined = base64Decode(encryptedMasterKey);

      const nonceLength = 12;
      const macLength = 16;

      if (combined.length < nonceLength + macLength) return null;

      final nonce = combined.sublist(0, nonceLength);
      final cipherText =
          combined.sublist(nonceLength, combined.length - macLength);
      final mac = Mac(combined.sublist(combined.length - macLength));

      final decrypted = await algorithm.decrypt(
        SecretBox(cipherText, nonce: nonce, mac: mac),
        secretKey: secretKey,
      );

      return decrypted;
    } catch (e) {
      return null;
    }
  }

  /// Generate a random 16-byte salt for PIN derivation
  List<int> generateSalt() {
    return SecretKeyData.random(length: 16).bytes;
  }

  // ============================================================
  // SIGNAL PROTOCOL KEY GENERATION (using libsignal Curve25519)
  // ============================================================

  /// Generate Curve25519 identity key pair using libsignal.
  /// Returns: { publicKey: base64 (raw 32 bytes), privateKey: base64 (raw 32 bytes) }
  Map<String, String> generateIdentityKeyPairSignal() {
    final keyPair = signal.generateIdentityKeyPair();
    return {
      'publicKey': base64Encode(keyPair.getPublicKey().publicKey.serialize().sublist(1)),
      'privateKey': base64Encode(keyPair.getPrivateKey().serialize()),
    };
  }

  /// Generate a signed prekey using libsignal (Curve25519 + XEdDSA signature).
  Map<String, dynamic> generateSignedPrekeySignal(
    signal.IdentityKeyPair identityKeyPair,
    int keyId,
  ) {
    final record = signal.generateSignedPreKey(identityKeyPair, keyId);
    return {
      'publicKey': base64Encode(record.getKeyPair().publicKey.serialize().sublist(1)),
      'privateKey': base64Encode(record.getKeyPair().privateKey.serialize()),
      'signature': base64Encode(record.signature),
      'keyId': record.id,
      'record': record,
    };
  }

  /// Generate one-time prekeys using libsignal.
  List<Map<String, dynamic>> generatePrekeysSignal(int startId, int count) {
    final records = signal.generatePreKeys(startId, count);
    return records.map((record) => {
      'publicKey': base64Encode(record.getKeyPair().publicKey.serialize().sublist(1)),
      'privateKey': base64Encode(record.getKeyPair().privateKey.serialize()),
      'keyId': record.id,
      'record': record,
    }).toList();
  }

  /// Generate all Signal Protocol keys for registration using libsignal.
  /// Keys are Curve25519 (compatible with Double Ratchet).
  SignalKeyBundle generateRegistrationKeys() {
    // 1. Generate identity key pair (Curve25519)
    final identityKeyPair = signal.generateIdentityKeyPair();
    final identityPublicKey = base64Encode(
      identityKeyPair.getPublicKey().publicKey.serialize().sublist(1),
    );
    final identityPrivateKey = base64Encode(
      identityKeyPair.getPrivateKey().serialize(),
    );

    // 2. Generate registration ID
    final registrationId = signal.generateRegistrationId(false);

    // 3. Generate signed prekey (Curve25519 + XEdDSA)
    final signedPrekey = signal.generateSignedPreKey(identityKeyPair, 1);
    final signedPrekeyPublic = base64Encode(
      signedPrekey.getKeyPair().publicKey.serialize().sublist(1),
    );
    final signedPrekeyPrivate = base64Encode(
      signedPrekey.getKeyPair().privateKey.serialize(),
    );

    // 4. Generate one-time prekeys (Curve25519)
    final preKeyRecords = signal.generatePreKeys(1, 20);
    final prekeys = preKeyRecords.map((record) => <String, dynamic>{
      'publicKey': base64Encode(record.getKeyPair().publicKey.serialize().sublist(1)),
      'privateKey': base64Encode(record.getKeyPair().privateKey.serialize()),
      'keyId': record.id,
    }).toList();

    return SignalKeyBundle(
      identityPublicKey: identityPublicKey,
      identityPrivateKey: identityPrivateKey,
      registrationId: registrationId,
      signedPrekeyPublic: signedPrekeyPublic,
      signedPrekeyPrivate: signedPrekeyPrivate,
      signedPrekeySignature: base64Encode(signedPrekey.signature),
      signedPrekeyId: signedPrekey.id,
      prekeys: prekeys,
      preKeyRecords: preKeyRecords,
      signedPreKeyRecord: signedPrekey,
    );
  }
}

/// Bundle of all Signal Protocol keys for registration
class SignalKeyBundle {
  final String identityPublicKey;
  final String identityPrivateKey;
  final int registrationId;
  final String signedPrekeyPublic;
  final String signedPrekeyPrivate;
  final String signedPrekeySignature;
  final int signedPrekeyId;
  final List<Map<String, dynamic>> prekeys;

  /// libsignal records for local store initialization
  final List<signal.PreKeyRecord> preKeyRecords;
  final signal.SignedPreKeyRecord signedPreKeyRecord;

  SignalKeyBundle({
    required this.identityPublicKey,
    required this.identityPrivateKey,
    required this.registrationId,
    required this.signedPrekeyPublic,
    required this.signedPrekeyPrivate,
    required this.signedPrekeySignature,
    required this.signedPrekeyId,
    required this.prekeys,
    required this.preKeyRecords,
    required this.signedPreKeyRecord,
  });

  /// Get prekeys formatted for server upload (public keys only)
  List<Map<String, dynamic>> get prekeysForServer {
    return prekeys.map((pk) => {
      'prekey_id': pk['keyId'],
      'public_key': pk['publicKey'],
    }).toList();
  }
}
