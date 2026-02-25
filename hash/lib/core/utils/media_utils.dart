import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// Utility for media file management.
///
/// Solves the iOS sandbox UUID change issue: on iOS, the app's container
/// directory path can change between launches (e.g., after Xcode rebuild,
/// app update, or device restore). Absolute paths stored in Hive become
/// stale. By storing only filenames and resolving at runtime, media files
/// survive container path changes.
class MediaUtils {
  static String? _mediaDir;

  /// Initialize the media directory path. Must be called once at startup.
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _mediaDir = '${dir.path}/media';
    // Ensure the directory exists
    final mediaDirectory = Directory(_mediaDir!);
    if (!await mediaDirectory.exists()) {
      await mediaDirectory.create(recursive: true);
    }
  }

  /// Current media directory (absolute path).
  static String get mediaDir {
    assert(_mediaDir != null, 'MediaUtils.init() must be called first');
    return _mediaDir!;
  }

  /// Resolve a stored media path to a valid absolute path.
  ///
  /// Handles three cases:
  /// 1. Null path → returns null
  /// 2. Filename only (e.g. "media_abc.jpg") → prepends current media dir
  /// 3. Stale absolute path (old iOS container UUID) → extracts filename,
  ///    resolves in current media dir
  static String? resolvePath(String? storedPath) {
    if (storedPath == null || storedPath.isEmpty || _mediaDir == null) {
      return null;
    }

    // Case: just a filename (no path separator)
    if (!storedPath.contains('/')) {
      final resolved = '$_mediaDir/$storedPath';
      if (File(resolved).existsSync()) return resolved;
      return null;
    }

    // Case: absolute path that still works
    if (File(storedPath).existsSync()) return storedPath;

    // Case: stale absolute path — extract filename, try current media dir
    final fileName = storedPath.split('/').last;
    final resolved = '$_mediaDir/$fileName';
    if (File(resolved).existsSync()) return resolved;

    return null;
  }

  /// Convert an absolute path to just the filename for storage.
  static String toRelative(String absolutePath) {
    return absolutePath.split('/').last;
  }

  /// Copy a file to the media directory if not already there.
  /// Returns the filename (not full path).
  static Future<String> copyToMediaDir(String filePath) async {
    assert(_mediaDir != null, 'MediaUtils.init() must be called first');
    final fileName = filePath.split('/').last;
    final destPath = '$_mediaDir/$fileName';
    if (filePath != destPath && !File(destPath).existsSync()) {
      await File(filePath).copy(destPath);
    }
    return fileName;
  }
}
