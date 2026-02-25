import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';

enum HashSnackBarType { success, error, info }

void showHashSnackBar(
  BuildContext context, {
  required String message,
  HashSnackBarType type = HashSnackBarType.info,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();

  final isDark = Theme.of(context).brightness == Brightness.dark;

  IconData icon;
  Color iconColor;

  switch (type) {
    case HashSnackBarType.success:
      icon = Icons.check_circle;
      iconColor = AppColors.success;
      break;
    case HashSnackBarType.error:
      icon = Icons.warning_amber_rounded;
      iconColor = AppColors.error;
      break;
    case HashSnackBarType.info:
      icon = Icons.info_outline;
      iconColor = GlassTheme.glassIconColor(isDark);
      break;
  }

  final snackDuration = duration ??
      (type == HashSnackBarType.error
          ? const Duration(seconds: 3)
          : const Duration(seconds: 2));

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: EdgeInsets.zero,
      duration: snackDuration,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: GlassTheme.blurMax, sigmaY: GlassTheme.blurMax),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: GlassTheme.backgroundStrong(isDark),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: GlassTheme.border(isDark),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: AppTypography.bodyMedium(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
