import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../config/supabase_config.dart';
import 'edge_function_service.dart';
import 'media_encryption_service.dart';

/// Résultat d'un upload média
class MediaUploadResult {
  final String fileId;
  final String keyBase64;
  final String ivBase64;
  final String? thumbnail;
  final int? width;
  final int? height;

  MediaUploadResult({
    required this.fileId,
    required this.keyBase64,
    required this.ivBase64,
    this.thumbnail,
    this.width,
    this.height,
  });
}

/// Service de stockage média chiffré
/// Orchestre le chiffrement, l'upload, le download et l'acknowledge
class MediaStorageService {
  final EdgeFunctionService _edgeFunctions;
  final MediaEncryptionService _mediaEncryption;

  MediaStorageService({
    required EdgeFunctionService edgeFunctions,
    required MediaEncryptionService mediaEncryption,
  })  : _edgeFunctions = edgeFunctions,
        _mediaEncryption = mediaEncryption;

  /// Chiffre et upload un fichier média
  /// Retourne le fileId serveur + clé + IV pour le payload message
  Future<MediaUploadResult> uploadMedia({
    required String filePath,
    required String mimeType,
  }) async {
    // 1. Lire le fichier
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    final fileSize = bytes.length;

    // 2. Générer un thumbnail et lire les dimensions pour les images
    String? thumbnail;
    int? width;
    int? height;
    final mimeCategory = mimeType.split('/').first;
    if (mimeCategory == 'image') {
      thumbnail = await _mediaEncryption.generateThumbnail(bytes);
      final dims = await _mediaEncryption.getImageDimensions(bytes);
      if (dims != null) {
        width = dims[0];
        height = dims[1];
      }
    } else if (mimeCategory == 'video') {
      final frameBytes = await VideoThumbnail.thumbnailData(
        video: filePath,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 320,
        quality: 50,
      );
      if (frameBytes != null) {
        thumbnail = await _mediaEncryption.generateThumbnail(frameBytes);
        final dims = await _mediaEncryption.getImageDimensions(frameBytes);
        if (dims != null) {
          width = dims[0];
          height = dims[1];
        }
      }
    }

    // 3. Chiffrer le fichier
    final encResult = await _mediaEncryption.encryptFile(bytes);

    // 4. Upload vers le serveur via Edge Function
    // X-File-Size = taille des données chiffrées (pas du fichier original)
    final response = await _edgeFunctions.uploadBinary(
      'upload-media',
      body: encResult.encryptedData,
      extraHeaders: {
        'X-File-Size': encResult.encryptedData.length.toString(),
        'X-Content-Type': mimeType,
      },
    );

    final fileId = response['file_id'] as String;

    debugPrint('[MediaStorage] Upload success: fileId=$fileId, size=$fileSize, dims=${width}x${height}, thumbnail=${thumbnail != null ? '${thumbnail.length} chars' : 'null'}');

    return MediaUploadResult(
      fileId: fileId,
      keyBase64: encResult.keyBase64,
      ivBase64: encResult.ivBase64,
      thumbnail: thumbnail,
      width: width,
      height: height,
    );
  }

  /// Télécharge, déchiffre et sauvegarde un fichier média localement
  /// Puis acknowledge pour suppression côté serveur
  Future<String?> downloadMedia({
    required String fileId,
    required String keyBase64,
    required String ivBase64,
    required String fileName,
  }) async {
    try {
      // 1. Obtenir l'URL signée
      final downloadResponse = await _edgeFunctions.call(
        'download-media',
        body: {'file_id': fileId},
      );

      var signedUrl = downloadResponse['download_url'] as String?;
      if (signedUrl == null) {
        debugPrint('[MediaStorage] No signed URL received');
        return null;
      }

      // Transformer l'URL interne Supabase (kong:8000) en URL publique
      signedUrl = _fixInternalUrl(signedUrl);
      debugPrint('[MediaStorage] Download URL: $signedUrl');

      // 2. Télécharger les bytes chiffrés
      final encryptedBytes = await _edgeFunctions.downloadBytes(signedUrl);

      // 3. Déchiffrer
      final decryptedBytes = await _mediaEncryption.decryptFile(
        encryptedBytes,
        keyBase64,
        ivBase64,
      );

      if (decryptedBytes == null) {
        debugPrint('[MediaStorage] Decryption failed');
        return null;
      }

      // 4. Sauvegarder localement
      final appDir = await getApplicationDocumentsDirectory();
      final mediaDir = Directory(path.join(appDir.path, 'media'));
      if (!await mediaDir.exists()) {
        await mediaDir.create(recursive: true);
      }

      final localPath = path.join(mediaDir.path, fileName);
      final localFile = File(localPath);
      await localFile.writeAsBytes(decryptedBytes);

      debugPrint('[MediaStorage] Downloaded and saved: $localPath');

      // 5. Acknowledge pour suppression côté serveur
      await acknowledgeMedia(fileId);

      // Return only the filename so callers store a relative path.
      // This survives iOS container UUID changes between app launches.
      return fileName;
    } catch (e) {
      debugPrint('[MediaStorage] Download error: $e');
      return null;
    }
  }

  /// Transforme une URL interne Supabase (http://kong:8000/...) en URL publique
  String _fixInternalUrl(String url) {
    final uri = Uri.parse(url);
    // Détecter les URLs internes Docker (kong, localhost, etc.)
    if (uri.host == 'kong' || uri.host == 'localhost' || uri.host == '127.0.0.1') {
      final publicBase = SupabaseConfig.url;
      // Remplacer le scheme://host:port par l'URL publique
      final internalPrefix = '${uri.scheme}://${uri.host}${uri.hasPort ? ':${uri.port}' : ''}';
      return url.replaceFirst(internalPrefix, publicBase);
    }
    return url;
  }

  /// Confirme la réception d'un média (déclenche la suppression serveur)
  Future<bool> acknowledgeMedia(String fileId) async {
    try {
      await _edgeFunctions.call(
        'acknowledge-media',
        body: {'file_id': fileId},
      );
      debugPrint('[MediaStorage] Acknowledged: $fileId');
      return true;
    } catch (e) {
      debugPrint('[MediaStorage] Acknowledge error: $e');
      return false;
    }
  }
}
