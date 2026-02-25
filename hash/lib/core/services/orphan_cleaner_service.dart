import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'local_storage_service.dart';

/// Service that cleans up orphaned media files.
///
/// Scans the local media directory and removes files that are
/// not referenced by any message or pending send queue item in Hive.
/// Runs 30 seconds after app startup to avoid impacting launch.
///
/// Compares by filename only (not absolute path) to survive iOS
/// container UUID changes between app launches.
class OrphanCleanerService {
  final LocalStorageService _localStorage;

  OrphanCleanerService(this._localStorage);

  /// Run the orphan cleanup.
  /// Should be called 30s after app startup.
  Future<void> cleanup() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final mediaDir = Directory('${appDir.path}/media');

      if (!await mediaDir.exists()) {
        debugPrint('[OrphanCleaner] No media directory found');
        return;
      }

      // Collect all referenced filenames from messages
      final allMessages = await _localStorage.getAllMessages();
      final referencedNames = <String>{};

      for (final msg in allMessages) {
        if (msg.mediaUrl != null && msg.mediaUrl!.isNotEmpty) {
          // Store only the filename to be UUID-agnostic
          referencedNames.add(msg.mediaUrl!.split('/').last);
        }
      }

      // Also include filenames from the pending send queue
      // (files waiting to be uploaded must not be deleted)
      final queuedMessages = await _localStorage.getSendQueue();
      for (final queued in queuedMessages) {
        if (queued.filePath != null && queued.filePath!.isNotEmpty) {
          referencedNames.add(queued.filePath!.split('/').last);
        }
      }

      // Scan media directory and delete unreferenced files
      int deletedCount = 0;
      int deletedBytes = 0;

      await for (final entity in mediaDir.list(recursive: true)) {
        if (entity is File) {
          final fileName = entity.path.split('/').last;
          if (!referencedNames.contains(fileName)) {
            final size = await entity.length();
            await entity.delete();
            deletedCount++;
            deletedBytes += size;
          }
        }
      }

      if (deletedCount > 0) {
        final mb = (deletedBytes / (1024 * 1024)).toStringAsFixed(1);
        debugPrint('[OrphanCleaner] Deleted $deletedCount orphaned files ($mb MB)');
      } else {
        debugPrint('[OrphanCleaner] No orphaned files found');
      }
    } catch (e) {
      debugPrint('[OrphanCleaner] Error during cleanup: $e');
    }
  }
}
