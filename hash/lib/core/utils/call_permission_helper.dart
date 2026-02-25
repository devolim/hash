import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/glass_theme.dart';

class PermissionHelper {
  PermissionHelper._();

  /// Check + request a single permission.
  /// Uses .status first (reliable), then .request() only if needed.
  static Future<bool> _ensurePermission(Permission permission) async {
    var status = await permission.status;
    if (status.isGranted) return true;

    status = await permission.request();
    return status.isGranted;
  }

  /// Request microphone permission for audio calls.
  static Future<bool> requestAudioCallPermissions(BuildContext context) async {
    final granted = await _ensurePermission(Permission.microphone);
    if (granted) return true;
    if (!context.mounted) return false;
    final l10n = AppLocalizations.of(context)!;
    final status = await Permission.microphone.status;
    await _showDeniedDialog(
      context,
      title: l10n.microphonePermissionRequired,
      explanation: l10n.microphonePermissionExplanation,
      isPermanentlyDenied: status.isPermanentlyDenied,
    );
    return false;
  }

  /// Request microphone + camera permissions for video calls.
  static Future<bool> requestVideoCallPermissions(BuildContext context) async {
    final micGranted = await _ensurePermission(Permission.microphone);
    if (!micGranted) {
      if (!context.mounted) return false;
      final l10n = AppLocalizations.of(context)!;
      final status = await Permission.microphone.status;
      await _showDeniedDialog(
        context,
        title: l10n.microphonePermissionRequired,
        explanation: l10n.microphonePermissionExplanation,
        isPermanentlyDenied: status.isPermanentlyDenied,
      );
      return false;
    }
    final camGranted = await _ensurePermission(Permission.camera);
    if (!camGranted) {
      if (!context.mounted) return false;
      final l10n = AppLocalizations.of(context)!;
      final status = await Permission.camera.status;
      await _showDeniedDialog(
        context,
        title: l10n.cameraPermissionRequired,
        explanation: l10n.cameraPermissionExplanation,
        isPermanentlyDenied: status.isPermanentlyDenied,
      );
      return false;
    }
    return true;
  }

  /// Request camera permission only (e.g. toggling camera during audio call).
  static Future<bool> requestCamera(BuildContext context) async {
    final granted = await _ensurePermission(Permission.camera);
    if (granted) return true;
    if (!context.mounted) return false;
    final l10n = AppLocalizations.of(context)!;
    final status = await Permission.camera.status;
    await _showDeniedDialog(
      context,
      title: l10n.cameraPermissionRequired,
      explanation: l10n.cameraPermissionExplanation,
      isPermanentlyDenied: status.isPermanentlyDenied,
    );
    return false;
  }

  /// Request camera permission for photo/video capture.
  static Future<bool> requestCameraCapture(BuildContext context) async {
    final granted = await _ensurePermission(Permission.camera);
    if (granted) return true;
    if (!context.mounted) return false;
    final l10n = AppLocalizations.of(context)!;
    final status = await Permission.camera.status;
    await _showDeniedDialog(
      context,
      title: l10n.cameraPermissionRequired,
      explanation: l10n.cameraPermissionCaptureExplanation,
      isPermanentlyDenied: status.isPermanentlyDenied,
    );
    return false;
  }

  /// Request microphone permission for voice recording.
  static Future<bool> requestMicrophoneRecord(BuildContext context) async {
    final granted = await _ensurePermission(Permission.microphone);
    if (granted) return true;
    if (!context.mounted) return false;
    final l10n = AppLocalizations.of(context)!;
    final status = await Permission.microphone.status;
    await _showDeniedDialog(
      context,
      title: l10n.microphonePermissionRequired,
      explanation: l10n.microphonePermissionRecordExplanation,
      isPermanentlyDenied: status.isPermanentlyDenied,
    );
    return false;
  }

  /// Request location permission.
  static Future<bool> requestLocation(BuildContext context) async {
    final granted = await _ensurePermission(Permission.location);
    if (granted) return true;
    if (!context.mounted) return false;
    final l10n = AppLocalizations.of(context)!;
    final status = await Permission.location.status;
    await _showDeniedDialog(
      context,
      title: l10n.locationPermissionRequired,
      explanation: l10n.locationPermissionExplanation,
      isPermanentlyDenied: status.isPermanentlyDenied,
    );
    return false;
  }

  /// Show a generic permission denied dialog.
  static Future<void> showPermissionDeniedDialog(
    BuildContext context, {
    required String title,
    required String explanation,
    required bool isPermanentlyDenied,
  }) async {
    await _showDeniedDialog(
      context,
      title: title,
      explanation: explanation,
      isPermanentlyDenied: isPermanentlyDenied,
    );
  }

  static Future<void> _showDeniedDialog(
    BuildContext context, {
    required String title,
    required String explanation,
    required bool isPermanentlyDenied,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showDialog(
      context: context,
      builder: (ctx) => GlassTheme.wrapAlertDialog(
        ctx,
        AlertDialog(
          title: Text(
            title,
            style: AppTypography.headlineSmall(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
          ),
          content: Text(
            explanation,
            style: AppTypography.bodyMedium(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
          actions: [
            if (isPermanentlyDenied)
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  openAppSettings();
                },
                child: Text(
                  l10n.openSettings,
                  style: const TextStyle(color: AppColors.accentPrimary),
                ),
              )
            else
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(
                  'OK',
                  style: const TextStyle(color: AppColors.accentPrimary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Keep backward compatibility alias
typedef CallPermissionHelper = PermissionHelper;
