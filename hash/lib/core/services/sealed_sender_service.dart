import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart' as signal;

/// Service for Sealed Sender cryptography.
///
/// Implements the Zero-Knowledge architecture where:
/// - The server never knows who is communicating with whom
/// - Messages use sealed sender (sender identity encrypted for recipient only)
/// - Mailbox tokens are derived and anonymous
/// - Contact verification uses shared secret derivation
class SealedSenderService {
  // Singleton instance
  static final SealedSenderService _instance = SealedSenderService._internal();
  factory SealedSenderService() => _instance;
  SealedSenderService._internal();

  // Decryption failure counter per sender identity key (for auto session reset)
  final Map<String, int> _decryptionFailures = {};
  static const int _maxDecryptionFailures = 3;

  /// Check if a session reset is needed for a given sender.
  /// Returns true if the failure count has reached the threshold.
  bool shouldResetSession(String senderIdentityKey) {
    return (_decryptionFailures[senderIdentityKey] ?? 0) >= _maxDecryptionFailures;
  }

  /// Record a decryption failure for a sender.
  /// Returns true if the threshold is now reached (session reset needed).
  bool recordDecryptionFailure(String senderIdentityKey) {
    _decryptionFailures[senderIdentityKey] =
        (_decryptionFailures[senderIdentityKey] ?? 0) + 1;
    final count = _decryptionFailures[senderIdentityKey]!;
    debugPrint('[SealedSender] Decryption failure #$count for ${senderIdentityKey.substring(0, 20)}...');
    return count >= _maxDecryptionFailures;
  }

  /// Clear the failure counter for a sender (after successful decryption or reset).
  void clearDecryptionFailures(String senderIdentityKey) {
    _decryptionFailures.remove(senderIdentityKey);
  }

  // X25519 for key exchange (sealed sender)
  final _x25519 = X25519();

  // XEdDSA signing via libsignal Curve25519 (replaces Ed25519)

  // AES-GCM for symmetric encryption
  final _aesGcm = AesGcm.with256bits();

  // HKDF for key derivation
  final _hkdf = Hkdf(
    hmac: Hmac.sha256(),
    outputLength: 32,
  );

  /// Generate a new sealed sender key pair (X25519).
  /// Used for receiving sealed messages.
  Future<SealedSenderKeyPair> generateSealedSenderKeyPair() async {
    final keyPair = await _x25519.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();
    final privateKeyData = await keyPair.extractPrivateKeyBytes();

    return SealedSenderKeyPair(
      publicKey: base64Encode(publicKey.bytes),
      privateKey: base64Encode(privateKeyData),
    );
  }

  /// Derive anonymous mailbox token from identity key.
  ///
  /// mailbox_token = HKDF(identity_private_key, "mailbox_v1", rotation_counter)
  ///
  /// The token has no visible correlation to the user identity.
  Future<String> deriveMailboxToken({
    required String identityPrivateKey,
    required int rotationCounter,
  }) async {
    final secretKey = SecretKey(base64Decode(identityPrivateKey));

    final derivedKey = await _hkdf.deriveKey(
      secretKey: secretKey,
      info: utf8.encode('mailbox_v1_$rotationCounter'),
      nonce: utf8.encode('hash_mailbox_salt'),
    );

    final bytes = await derivedKey.extractBytes();
    return _bytesToHex(Uint8List.fromList(bytes));
  }

  /// Derive notification relay token from identity key.
  ///
  /// Different from mailbox token to prevent correlation.
  Future<String> deriveRelayToken({
    required String identityPrivateKey,
    required int rotationCounter,
  }) async {
    final secretKey = SecretKey(base64Decode(identityPrivateKey));

    final derivedKey = await _hkdf.deriveKey(
      secretKey: secretKey,
      info: utf8.encode('relay_v1_$rotationCounter'),
      nonce: utf8.encode('hash_relay_salt'),
    );

    final bytes = await derivedKey.extractBytes();
    return _bytesToHex(Uint8List.fromList(bytes));
  }

  /// Derive contact verification token from shared DH secret.
  ///
  /// verification_token = HKDF(DH(my_private, their_public), "contact_verification")
  ///
  /// Both parties compute the same token, proving the relationship
  /// without revealing identities.
  Future<String> deriveVerificationToken({
    required String myIdentityPrivateKey,
    required String theirIdentityPublicKey,
  }) async {
    // Perform X25519 key exchange
    final myKeyPair = await _x25519.newKeyPairFromSeed(
      base64Decode(myIdentityPrivateKey).sublist(0, 32),
    );
    final theirPublicKey = SimplePublicKey(
      base64Decode(theirIdentityPublicKey),
      type: KeyPairType.x25519,
    );

    final sharedSecret = await _x25519.sharedSecretKey(
      keyPair: myKeyPair,
      remotePublicKey: theirPublicKey,
    );

    // Derive verification token from shared secret
    final derivedKey = await _hkdf.deriveKey(
      secretKey: sharedSecret,
      info: utf8.encode('contact_verification'),
      nonce: utf8.encode('hash_contact_salt'),
    );

    final bytes = await derivedKey.extractBytes();
    return _bytesToHex(Uint8List.fromList(bytes));
  }

  /// Create a sealed sender envelope.
  ///
  /// The envelope contains:
  /// 1. Sender's certificate (identity proof)
  /// 2. Encrypted message content
  /// 3. Ephemeral key for forward secrecy
  ///
  /// Only the recipient can decrypt and learn who sent the message.
  Future<String> createSealedEnvelope({
    required String senderIdentityPublicKey,
    required String senderSigningPrivateKey,
    required String recipientSealedSenderPublicKey,
    required Uint8List messageContent,
  }) async {
    // 1. Generate ephemeral key pair for this message
    final ephemeralKeyPair = await _x25519.newKeyPair();
    final ephemeralPublicKey = await ephemeralKeyPair.extractPublicKey();

    // 2. Create sender certificate
    final timestamp = DateTime.now().toUtc().millisecondsSinceEpoch;
    final certificate = SenderCertificate(
      senderIdentityKey: senderIdentityPublicKey,
      timestamp: timestamp,
    );

    // 3. Sign the certificate with XEdDSA (Curve25519 signing)
    final certificateJson = jsonEncode(certificate.toJson());
    final signingPrivateKey = signal.Curve.decodePrivatePoint(
      Uint8List.fromList(base64Decode(senderSigningPrivateKey).sublist(0, 32)),
    );
    final signatureBytes = signal.Curve.calculateSignature(
      signingPrivateKey,
      Uint8List.fromList(utf8.encode(certificateJson)),
    );
    final signedCertificate = SignedSenderCertificate(
      certificate: certificate,
      signature: base64Encode(signatureBytes),
    );

    // 4. Derive shared secret with recipient
    final recipientKey = SimplePublicKey(
      base64Decode(recipientSealedSenderPublicKey),
      type: KeyPairType.x25519,
    );
    final sharedSecret = await _x25519.sharedSecretKey(
      keyPair: ephemeralKeyPair,
      remotePublicKey: recipientKey,
    );

    // 5. Derive encryption key from shared secret
    final encryptionKey = await _hkdf.deriveKey(
      secretKey: sharedSecret,
      info: utf8.encode('sealed_sender_v1'),
      nonce: utf8.encode('hash_sealed_salt'),
    );

    // 6. Pad message content to prevent envelope size analysis
    final paddedContent = padMessage(messageContent);

    // 7. Create plaintext: certificate + padded message
    final plaintext = SealedEnvelopePlaintext(
      signedCertificate: signedCertificate,
      messageContent: base64Encode(paddedContent),
    );
    final plaintextBytes = utf8.encode(jsonEncode(plaintext.toJson()));

    // 8. Encrypt with AES-GCM
    final secretBox = await _aesGcm.encrypt(
      plaintextBytes,
      secretKey: encryptionKey,
    );

    // 9. Assemble sealed envelope
    final envelope = SealedEnvelope(
      ephemeralPublicKey: base64Encode(ephemeralPublicKey.bytes),
      encryptedContent: base64Encode(secretBox.concatenation()),
    );

    return base64Encode(utf8.encode(jsonEncode(envelope.toJson())));
  }

  /// Open a sealed sender envelope.
  ///
  /// Decrypts the envelope and reveals the sender identity.
  Future<OpenedSealedEnvelope?> openSealedEnvelope({
    required String sealedEnvelope,
    required String recipientSealedSenderPrivateKey,
  }) async {
    try {
      // 1. Parse envelope
      final envelopeJson = jsonDecode(utf8.decode(base64Decode(sealedEnvelope)));
      final envelope = SealedEnvelope.fromJson(envelopeJson);

      // 2. Reconstruct recipient key pair
      final recipientKeyPair = await _x25519.newKeyPairFromSeed(
        base64Decode(recipientSealedSenderPrivateKey).sublist(0, 32),
      );

      // 3. Recover shared secret
      final ephemeralPublicKey = SimplePublicKey(
        base64Decode(envelope.ephemeralPublicKey),
        type: KeyPairType.x25519,
      );
      final sharedSecret = await _x25519.sharedSecretKey(
        keyPair: recipientKeyPair,
        remotePublicKey: ephemeralPublicKey,
      );

      // 4. Derive decryption key
      final decryptionKey = await _hkdf.deriveKey(
        secretKey: sharedSecret,
        info: utf8.encode('sealed_sender_v1'),
        nonce: utf8.encode('hash_sealed_salt'),
      );

      // 5. Decrypt content
      final encryptedBytes = base64Decode(envelope.encryptedContent);
      // AES-GCM: nonce (12) + ciphertext + mac (16)
      const nonceLength = 12;
      const macLength = 16;
      if (encryptedBytes.length < nonceLength + macLength + 1) {
        debugPrint('[SealedSender] openSealedEnvelope: Encrypted data too short');
        return null;
      }
      final nonce = encryptedBytes.sublist(0, nonceLength);
      final cipherText = encryptedBytes.sublist(nonceLength, encryptedBytes.length - macLength);
      final mac = Mac(encryptedBytes.sublist(encryptedBytes.length - macLength));

      final secretBox = SecretBox(cipherText, nonce: nonce, mac: mac);
      final decrypted = await _aesGcm.decrypt(secretBox, secretKey: decryptionKey);

      // 6. Parse plaintext
      final plaintextJson = jsonDecode(utf8.decode(decrypted));
      final plaintext = SealedEnvelopePlaintext.fromJson(plaintextJson);

      // 7. Verify certificate signature with XEdDSA (Curve25519 verification)
      final certificate = plaintext.signedCertificate;
      final certificateJson = jsonEncode(certificate.certificate.toJson());
      final senderCurvePublicKey = signal.Curve.decodePoint(
        Uint8List.fromList([0x05, ...base64Decode(certificate.certificate.senderIdentityKey)]),
        0,
      );
      final isValid = signal.Curve.verifySignature(
        senderCurvePublicKey,
        Uint8List.fromList(utf8.encode(certificateJson)),
        base64Decode(certificate.signature),
      );

      if (!isValid) {
        debugPrint('[SealedSender] openSealedEnvelope: Invalid signature');
        return null; // Invalid signature
      }

      // 8. Check certificate freshness (max 15 minutes)
      final now = DateTime.now().toUtc().millisecondsSinceEpoch;
      final certAge = now - certificate.certificate.timestamp;
      if (certAge > 900000) { // 15 minutes
        debugPrint('[SealedSender] openSealedEnvelope: Certificate too old');
        return null; // Certificate too old
      }

      if (kDebugMode) {
        debugPrint('[SealedSender] openSealedEnvelope: Success!');
      }

      // Strip padding from message content
      final paddedContent = base64Decode(plaintext.messageContent);
      final unpaddedContent = stripPadding(Uint8List.fromList(paddedContent));

      return OpenedSealedEnvelope(
        senderIdentityKey: certificate.certificate.senderIdentityKey,
        messageContent: unpaddedContent,
        timestamp: DateTime.fromMillisecondsSinceEpoch(
          certificate.certificate.timestamp,
          isUtc: true,
        ),
      );
    } catch (e) {
      debugPrint('[SealedSender] openSealedEnvelope: Error: $e');
      return null;
    }
  }

  /// Encrypt push notification token for anonymous relay.
  Future<String> encryptPushToken({
    required String pushToken,
    required String identityPrivateKey,
  }) async {
    // Derive encryption key from identity key
    final secretKey = SecretKey(base64Decode(identityPrivateKey));
    final encryptionKey = await _hkdf.deriveKey(
      secretKey: secretKey,
      info: utf8.encode('push_token_encryption'),
      nonce: utf8.encode('hash_push_salt'),
    );

    // Encrypt with AES-GCM
    final secretBox = await _aesGcm.encrypt(
      utf8.encode(pushToken),
      secretKey: encryptionKey,
    );

    return base64Encode(secretBox.concatenation());
  }

  /// Decrypt push notification token.
  Future<String?> decryptPushToken({
    required String encryptedPushToken,
    required String identityPrivateKey,
  }) async {
    try {
      // Derive decryption key
      final secretKey = SecretKey(base64Decode(identityPrivateKey));
      final decryptionKey = await _hkdf.deriveKey(
        secretKey: secretKey,
        info: utf8.encode('push_token_encryption'),
        nonce: utf8.encode('hash_push_salt'),
      );

      // Decrypt
      final encryptedBytes = base64Decode(encryptedPushToken);
      const nonceLength = 12;
      const macLength = 16;
      final nonce = encryptedBytes.sublist(0, nonceLength);
      final cipherText = encryptedBytes.sublist(nonceLength, encryptedBytes.length - macLength);
      final mac = Mac(encryptedBytes.sublist(encryptedBytes.length - macLength));

      final secretBox = SecretBox(cipherText, nonce: nonce, mac: mac);
      final decrypted = await _aesGcm.decrypt(secretBox, secretKey: decryptionKey);

      return utf8.decode(decrypted);
    } catch (e) {
      return null;
    }
  }

  /// Encrypt platform identifier (ios/android) for relay.
  Future<String> encryptPlatform({
    required String platform,
    required String identityPrivateKey,
  }) async {
    final secretKey = SecretKey(base64Decode(identityPrivateKey));
    final encryptionKey = await _hkdf.deriveKey(
      secretKey: secretKey,
      info: utf8.encode('platform_encryption'),
      nonce: utf8.encode('hash_platform_salt'),
    );

    final secretBox = await _aesGcm.encrypt(
      utf8.encode(platform),
      secretKey: encryptionKey,
    );

    return base64Encode(secretBox.concatenation());
  }

  // ============ MESSAGE PADDING ============

  /// Block size for message padding (prevents envelope size analysis).
  static const int _paddingBlockSize = 160;

  /// Pad message content to a multiple of [_paddingBlockSize] bytes
  /// with random extra padding to prevent exact length deduction.
  ///
  /// Format: message || 0x80 || 0x00...0x00 || random_extra
  /// The 0x80 byte marks the end of the actual message content.
  Uint8List padMessage(Uint8List message) {
    // Calculate base padded length: next multiple of block size
    final basePaddedLength = ((message.length + 1 + _paddingBlockSize - 1) ~/ _paddingBlockSize) * _paddingBlockSize;
    // Add random extra padding (0-32 bytes) to blur exact size modulo block
    final random = Random.secure();
    final extraBlocks = random.nextInt(3); // 0, 1, or 2 extra blocks
    final paddedLength = basePaddedLength + (extraBlocks * _paddingBlockSize);
    final padded = Uint8List(paddedLength);
    padded.setRange(0, message.length, message);
    padded[message.length] = 0x80; // Padding marker
    // Fill remaining with random bytes (instead of zeros) for extra obfuscation
    for (int i = message.length + 1; i < paddedLength; i++) {
      padded[i] = random.nextInt(128); // 0x00-0x7F (never 0x80 to avoid marker confusion)
    }
    return padded;
  }

  /// Strip padding from a padded message.
  ///
  /// Scans backward from the end to find the 0x80 marker.
  Uint8List stripPadding(Uint8List padded) {
    // Scan backward for the 0x80 padding marker.
    // Padding bytes can be anything in 0x00-0x7F (never 0x80), so the
    // rightmost 0x80 byte is always the padding marker regardless of the
    // other byte values in the padding region.
    for (int i = padded.length - 1; i >= 0; i--) {
      if (padded[i] == 0x80) {
        return Uint8List.sublistView(padded, 0, i);
      }
    }
    // No 0x80 marker found — message was not padded (legacy or unpadded path)
    debugPrint('[SealedSender] Warning: no padding marker found');
    return padded;
  }

  // ============ CALL E2EE KEY DERIVATION ============

  /// Derive a shared E2EE key for calls from identity keys.
  ///
  /// DH(my_identity_private, their_identity_public) → HKDF with call-specific info.
  /// This replaces the insecure room-name-based key derivation.
  Future<String> deriveCallE2EEKey({
    required String myIdentityPrivateKey,
    required String theirIdentityPublicKey,
    required String callId,
  }) async {
    // Perform X25519 key exchange using identity keys
    final myKeyPair = await _x25519.newKeyPairFromSeed(
      base64Decode(myIdentityPrivateKey).sublist(0, 32),
    );
    final theirPublicKey = SimplePublicKey(
      base64Decode(theirIdentityPublicKey),
      type: KeyPairType.x25519,
    );

    final sharedSecret = await _x25519.sharedSecretKey(
      keyPair: myKeyPair,
      remotePublicKey: theirPublicKey,
    );

    // Derive call-specific key using HKDF
    final derivedKey = await _hkdf.deriveKey(
      secretKey: sharedSecret,
      info: utf8.encode('call_e2ee_v1_$callId'),
      nonce: utf8.encode('hash_call_salt'),
    );

    final bytes = await derivedKey.extractBytes();
    return base64Encode(bytes);
  }

  /// Convert bytes to hex string
  String _bytesToHex(Uint8List bytes) {
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }
}

/// Sealed sender key pair
class SealedSenderKeyPair {
  final String publicKey;
  final String privateKey;

  SealedSenderKeyPair({
    required this.publicKey,
    required this.privateKey,
  });
}

/// Sender certificate (proves sender identity)
class SenderCertificate {
  final String senderIdentityKey;
  final int timestamp;

  SenderCertificate({
    required this.senderIdentityKey,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'sender_identity_key': senderIdentityKey,
        'timestamp': timestamp,
      };

  factory SenderCertificate.fromJson(Map<String, dynamic> json) {
    return SenderCertificate(
      senderIdentityKey: json['sender_identity_key'] as String,
      timestamp: json['timestamp'] as int,
    );
  }
}

/// Signed sender certificate
class SignedSenderCertificate {
  final SenderCertificate certificate;
  final String signature;

  SignedSenderCertificate({
    required this.certificate,
    required this.signature,
  });

  Map<String, dynamic> toJson() => {
        'certificate': certificate.toJson(),
        'signature': signature,
      };

  factory SignedSenderCertificate.fromJson(Map<String, dynamic> json) {
    return SignedSenderCertificate(
      certificate: SenderCertificate.fromJson(json['certificate'] as Map<String, dynamic>),
      signature: json['signature'] as String,
    );
  }
}

/// Plaintext content inside sealed envelope
class SealedEnvelopePlaintext {
  final SignedSenderCertificate signedCertificate;
  final String messageContent; // base64 encoded

  SealedEnvelopePlaintext({
    required this.signedCertificate,
    required this.messageContent,
  });

  Map<String, dynamic> toJson() => {
        'signed_certificate': signedCertificate.toJson(),
        'message_content': messageContent,
      };

  factory SealedEnvelopePlaintext.fromJson(Map<String, dynamic> json) {
    return SealedEnvelopePlaintext(
      signedCertificate: SignedSenderCertificate.fromJson(json['signed_certificate'] as Map<String, dynamic>),
      messageContent: json['message_content'] as String,
    );
  }
}

/// Sealed envelope (encrypted, can be stored on server)
class SealedEnvelope {
  final String ephemeralPublicKey;
  final String encryptedContent;

  SealedEnvelope({
    required this.ephemeralPublicKey,
    required this.encryptedContent,
  });

  Map<String, dynamic> toJson() => {
        'ephemeral_public_key': ephemeralPublicKey,
        'encrypted_content': encryptedContent,
      };

  factory SealedEnvelope.fromJson(Map<String, dynamic> json) {
    return SealedEnvelope(
      ephemeralPublicKey: json['ephemeral_public_key'] as String,
      encryptedContent: json['encrypted_content'] as String,
    );
  }
}

/// Opened sealed envelope (after decryption)
class OpenedSealedEnvelope {
  final String senderIdentityKey;
  final Uint8List messageContent;
  final DateTime timestamp;

  OpenedSealedEnvelope({
    required this.senderIdentityKey,
    required this.messageContent,
    required this.timestamp,
  });
}
