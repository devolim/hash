import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Hash App Typography - Modern & Clean
class AppTypography {
  AppTypography._();

  static String get _fontFamily => 'SpaceGrotesk';

  // ============ HEADINGS ============
  static TextStyle displayLarge({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: -1.5,
        height: 1.1,
      );

  static TextStyle displayMedium({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: -1.0,
        height: 1.2,
      );

  static TextStyle displaySmall({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: -0.5,
        height: 1.2,
      );

  static TextStyle headlineLarge({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: -0.3,
        height: 1.3,
      );

  static TextStyle headlineMedium({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: -0.2,
        height: 1.3,
      );

  static TextStyle headlineSmall({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: 0,
        height: 1.4,
      );

  // ============ BODY TEXT ============
  static TextStyle bodyLarge({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: 0.1,
        height: 1.5,
      );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: 0.15,
        height: 1.5,
      );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.textSecondaryDark,
        letterSpacing: 0.2,
        height: 1.5,
      );

  // ============ LABELS ============
  static TextStyle labelLarge({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: 0.5,
        height: 1.4,
      );

  static TextStyle labelMedium({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textSecondaryDark,
        letterSpacing: 0.5,
        height: 1.4,
      );

  static TextStyle labelSmall({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textSecondaryDark,
        letterSpacing: 0.5,
        height: 1.4,
      );

  // ============ SPECIAL STYLES ============
  static TextStyle hashId({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.accentPrimary,
        letterSpacing: 3.0,
        height: 1.2,
      );

  static TextStyle code({Color? color}) => GoogleFonts.firaCode(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.textPrimaryDark,
        letterSpacing: 8.0,
        height: 1.2,
      );

  static TextStyle timestamp({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.textTertiaryDark,
        letterSpacing: 0.3,
        height: 1.4,
      );

  static TextStyle buttonText({Color? color}) => GoogleFonts.spaceGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.darkBackground,
        letterSpacing: 0.5,
        height: 1.2,
      );
}
