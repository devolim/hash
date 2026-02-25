import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// Utility for avatar file management.
///
/// Solves the iOS sandbox UUID change issue: on iOS, the app's container
/// directory path can change between launches (e.g., after Xcode rebuild,
/// app update, or device restore). Absolute paths stored in Hive become
/// stale. By storing only filenames and resolving at runtime, avatars
/// survive container path changes.
class AvatarUtils {
  static String? _avatarsDir;

  /// Initialize the avatars directory path. Must be called once at startup.
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _avatarsDir = '${dir.path}/avatars';
  }

  /// Current avatars directory (absolute path).
  static String get avatarsDir {
    assert(_avatarsDir != null, 'AvatarUtils.init() must be called first');
    return _avatarsDir!;
  }

  /// Resolve a stored avatar path to a valid absolute path.
  ///
  /// Handles three cases:
  /// 1. Null path → returns null
  /// 2. Filename only (e.g. "contact_xxx.jpg") → prepends current avatars dir
  /// 3. Stale absolute path (e.g. old iOS container UUID) → extracts filename,
  ///    resolves in current avatars dir
  static String? resolvePath(String? storedPath) {
    if (storedPath == null || _avatarsDir == null) return null;

    // Case: just a filename (no path separator)
    if (!storedPath.contains('/')) {
      final resolved = '$_avatarsDir/$storedPath';
      if (File(resolved).existsSync()) return resolved;
      return null;
    }

    // Case: absolute path that still works
    if (File(storedPath).existsSync()) return storedPath;

    // Case: stale absolute path — extract filename, try current dir
    final fileName = storedPath.split('/').last;
    final resolved = '$_avatarsDir/$fileName';
    if (File(resolved).existsSync()) return resolved;

    return null;
  }

  /// Convert an absolute path to just the filename for storage.
  static String toRelative(String absolutePath) {
    return absolutePath.split('/').last;
  }
}
