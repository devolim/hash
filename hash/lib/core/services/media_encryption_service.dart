import 'dart:convert';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import 'package:image/image.dart' as img;

/// Résultat du chiffrement d'un fichier média
class MediaEncryptionResult {
  final Uint8List encryptedData;
  final String keyBase64;
  final String ivBase64;

  MediaEncryptionResult({
    required this.encryptedData,
    required this.keyBase64,
    required this.ivBase64,
  });
}

/// Service de chiffrement AES-256-GCM pour les médias
class MediaEncryptionService {
  final _aesGcm = AesGcm.with256bits();

  /// Chiffre un fichier avec une clé AES-256 aléatoire
  /// Format de sortie : nonce(12) + ciphertext + mac(16)
  Future<MediaEncryptionResult> encryptFile(Uint8List plaintext) async {
    final secretKey = await _aesGcm.newSecretKey();
    final nonce = _aesGcm.newNonce();
    final encrypted = await _aesGcm.encrypt(
      plaintext,
      secretKey: secretKey,
      nonce: nonce,
    );

    // Format: nonce(12) + ciphertext + mac(16)
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

    return MediaEncryptionResult(
      encryptedData: combined,
      keyBase64: base64Encode(await secretKey.extractBytes()),
      ivBase64: base64Encode(nonce),
    );
  }

  /// Déchiffre un fichier avec la clé et l'IV du payload message
  Future<Uint8List?> decryptFile(
    Uint8List encrypted,
    String keyBase64,
    String ivBase64,
  ) async {
    try {
      const nonceLength = 12;
      const macLength = 16;

      if (encrypted.length < nonceLength + macLength + 1) return null;

      final nonce = encrypted.sublist(0, nonceLength);
      final cipherText = encrypted.sublist(nonceLength, encrypted.length - macLength);
      final mac = Mac(encrypted.sublist(encrypted.length - macLength));

      final keyBytes = base64Decode(keyBase64);
      final secretKey = SecretKey(keyBytes);

      final decrypted = await _aesGcm.decrypt(
        SecretBox(cipherText, nonce: nonce, mac: mac),
        secretKey: secretKey,
      );

      return Uint8List.fromList(decrypted);
    } catch (e) {
      return null;
    }
  }

  /// Retourne les dimensions [width, height] d'une image
  Future<List<int>?> getImageDimensions(Uint8List imageBytes) async {
    try {
      final image = img.decodeImage(imageBytes);
      if (image == null) return null;
      return [image.width, image.height];
    } catch (e) {
      return null;
    }
  }

  /// Génère un thumbnail flou en base64 (~3-5 Ko)
  /// Utilisé pour l'aperçu avant téléchargement
  Future<String?> generateThumbnail(
    Uint8List imageBytes, {
    int maxDim = 32,
  }) async {
    try {
      final image = img.decodeImage(imageBytes);
      if (image == null) return null;

      // Redimensionner à maxDim x maxDim max
      final thumbnail = img.copyResize(
        image,
        width: image.width > image.height ? maxDim : null,
        height: image.height >= image.width ? maxDim : null,
        interpolation: img.Interpolation.average,
      );

      // Appliquer un flou gaussien
      final blurred = img.gaussianBlur(thumbnail, radius: 2);

      // Encoder en JPEG basse qualité
      final jpegBytes = img.encodeJpg(blurred, quality: 30);

      return base64Encode(jpegBytes);
    } catch (e) {
      return null;
    }
  }
}
