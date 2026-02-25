import 'package:flutter/material.dart';

/// Hash App Color Palette - Ultra Dark Theme
class AppColors {
  AppColors._();

  // ============ DARK THEME ============
  static const Color darkBackground = Color(0xFF0A0A0A);
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color darkSurfaceVariant = Color(0xFF252525);
  static const Color darkBorder = Color(0xFF2A2A2A);

  // ============ LIGHT THEME ============
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color lightSurfaceVariant = Color(0xFFEEEEEE);
  static const Color lightBorder = Color(0xFFE0E0E0);

  // ============ ACCENT COLORS ============
  static const Color accentPrimary = Color(0xFFFFAB00);
  static const Color accentHover = Color(0xFFFF8C00);
  static const Color accentLight = Color(0xFFFF9500);

  // ============ TEXT COLORS ============
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFF8A8A8A);
  static const Color textTertiaryDark = Color(0xFF5A5A5A);

  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF6B6B6B);
  static const Color textTertiaryLight = Color(0xFF9A9A9A);

  // ============ SEMANTIC COLORS ============
  static const Color success = Color(0xFF00D26A);
  static const Color error = Color(0xFFFF4757);
  static const Color warning = Color(0xFFFFAB00);
  static const Color info = Color(0xFF3B82F6);

  // ============ MESSAGE BUBBLES ============
  static const Color sentMessageBubble = Color(0xFFFFAB00);
  static const Color receivedMessageBubble = Color(0xFF1A1A1A);
  static const Color sentMessageText = Color(0xFF0A0A0A);
  static const Color receivedMessageText = Color(0xFFFFFFFF);

  // ============ GRADIENTS ============
  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentPrimary, accentHover],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [Color(0xFF1A1A1A), Color(0xFF0A0A0A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ============ GLASSMORPHISM / LIQUID GLASS ============
  // Dark theme glass
  static const Color glassBackgroundDark = Color(0x1AFFFFFF);
  static const Color glassBorderDark = Color(0x33FFFFFF);
  static const Color glassHighlightDark = Color(0x0DFFFFFF);
  static const Color glassShadowDark = Color(0x40000000);

  // Light theme glass
  static const Color glassBackgroundLight = Color(0x80FFFFFF);
  static const Color glassBorderLight = Color(0x4DFFFFFF);
  static const Color glassHighlightLight = Color(0x1AFFFFFF);
  static const Color glassShadowLight = Color(0x1A000000);

  // Glass accent tints
  static const Color glassAccentTint = Color(0x1AFFAB00);
  static const Color glassAccentBorder = Color(0x33FFAB00);

  // Frosted overlay
  static const Color frostedOverlayDark = Color(0x0AFFFFFF);
  static const Color frostedOverlayLight = Color(0x66FFFFFF);
}
