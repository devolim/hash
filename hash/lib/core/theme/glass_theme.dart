import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hash/l10n/generated/app_localizations.dart';
import 'package:hash/core/theme/app_colors.dart';
import 'package:hash/core/theme/app_typography.dart';

/// Centralise tous les paramètres de glassmorphism de l'application.
/// Modifier ces valeurs change l'effet glass sur toute l'app.
/// 
/// # Utilisation des dialogues GlassTheme
/// 
/// ## 1. Remplacement simple (recommandé pour la migration progressive)
/// Utilisez les méthodes wrap* pour convertir les dialogues existants :
/// 
/// Ancien code:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => AlertDialog(
///     backgroundColor: Colors.transparent,
///     title: Text('Titre'),
///     content: Text('Contenu'),
///   ),
/// );
/// ```
/// 
/// Nouveau code:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => GlassTheme.wrapAlertDialog(
///     context,
///     AlertDialog(
///       backgroundColor: Colors.transparent,
///       title: Text('Titre'),
///       content: Text('Contenu'),
///     ),
///   ),
/// );
/// ```
/// 
/// ## 2. Utilisation des méthodes complètes (pour les nouveaux dialogues)
/// 
/// Dialogue simple:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => GlassTheme.glassAlertDialog(
///     context: context,
///     title: 'Titre',
///     content: 'Contenu du dialogue',
///     actions: [
///       TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
///     ],
///   ),
/// );
/// ```
/// 
/// Dialogue de confirmation:
/// ```dart
/// final confirmed = await GlassTheme.glassConfirmationDialog(
///   context: context,
///   title: 'Confirmer',
///   content: 'Êtes-vous sûr de vouloir continuer ?',
///   confirmText: 'Oui',
///   cancelText: 'Annuler',
/// );
/// ```
/// 
/// ## 3. Différenciation thème clair/sombre
/// Toutes les méthodes GlassTheme gèrent automatiquement la différenciation 
/// entre les thèmes clair et sombre en utilisant le contexte.
/// 
/// ## 4. Personnalisation avancée
/// Pour les dialogues complexes, utilisez glassDialog :
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => GlassTheme.glassDialog(
///     context: context,
///     title: 'Titre personnalisé',
///     content: Column(
///       children: [
///         Text('Contenu personnalisé'),
///         TextField(decoration: InputDecoration(labelText: 'Entrée')),
///       ],
///     ),
///     actions: [
///       TextButton(onPressed: () => Navigator.pop(context), child: Text('Annuler')),
///       ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Valider')),
///     ],
///   ),
/// );
/// ```
class GlassTheme {
  GlassTheme._();

  // ===== BLUR SIGMA =====
  static const double blurLight = 10.0;
  static const double blurMedium = 15.0;
  static const double blurHeavy = 20.0;
  static const double blurMax = 25.0;

  // ===== FOND GLASS - DARK =====
  static const Color backgroundDark = Color(0x66000000);
  static const Color backgroundDarkStrong = Color(0x80000000);
  static const Color backgroundDarkOverlay = Color(0xD9000000);

  // ===== FOND GLASS - LIGHT =====
  static const Color backgroundLight = Color(0x8CFFFFFF);
  static const Color backgroundLightStrong = Color(0x99FFFFFF);
  static const Color backgroundLightOverlay = Color(0xD9FFFFFF);

  // ===== BORDURES =====
  static const Color borderDark = Color(0x14FFFFFF);
  static const Color borderLight = Color(0x0F000000);

  // ===== OMBRES =====
  static const Color shadow = Color(0x26000000);

  // ===== HANDLE (menu drag) =====
  static const Color handleDark = Color(0x33FFFFFF);
  static const Color handleLight = Color(0x26000000);

  // ===== COULEURS CONTENU SUR GLASS =====
  // En thème clair, le glass est blanc translucide → icônes sombres, texte noir
  // En thème sombre, le glass est noir translucide → icônes orange, texte clair

  /// Icônes sur fond glass (orange en dark, sombre en light pour contraste)
  static Color glassIconColor(bool isDark) =>
      isDark ? AppColors.accentPrimary : AppColors.textPrimaryLight;

  /// Texte principal sur fond glass (clair en dark, noir en light)
  static Color glassTextColor(bool isDark) =>
      isDark ? AppColors.textPrimaryDark : Colors.black;

  /// Texte secondaire/description sur fond glass
  static Color glassSecondaryColor(bool isDark) =>
      isDark ? AppColors.textSecondaryDark : const Color(0xFF3A3A3A);

  // ===== HELPERS =====
  static Color background(bool isDark) =>
      isDark ? backgroundDark : backgroundLight;
  static Color backgroundStrong(bool isDark) =>
      isDark ? backgroundDarkStrong : backgroundLightStrong;
  static Color backgroundOverlay(bool isDark) =>
      isDark ? backgroundDarkOverlay : backgroundLightOverlay;
  static Color border(bool isDark) => isDark ? borderDark : borderLight;
  static Color handle(bool isDark) => isDark ? handleDark : handleLight;

  /// FlexibleSpace glass pour les AppBars.
  static Widget appBarFlexibleSpace(bool isDark) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurMedium, sigmaY: blurMedium),
        child: Container(
          decoration: BoxDecoration(
            color: background(isDark),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  /// Décore un bottom sheet avec l'effet glass.
  static Widget bottomSheetWrapper({required bool isDark, required Widget child}) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurMedium, sigmaY: blurMedium),
        child: Container(
          decoration: BoxDecoration(
            color: background(isDark),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: child,
        ),
      ),
    );
  }

  /// Décore un dialogue avec l'effet glass.
  /// Applique le style directement sur l'AlertDialog au lieu de wrapper
  /// pour éviter que le Dialog interne ne s'étende en plein écran.
  static Widget dialogWrapper({required bool isDark, required Widget child}) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurMedium, sigmaY: blurMedium),
      child: Theme(
        data: ThemeData(
          dialogBackgroundColor: isDark ? const Color(0xE6111111) : const Color(0xF2F5F5F5),
          dialogTheme: DialogThemeData(
            backgroundColor: isDark ? const Color(0xE6111111) : const Color(0xF2F5F5F5),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: border(isDark)),
            ),
          ),
        ),
        child: child,
      ),
    );
  }

  /// Crée un AlertDialog avec l'effet glass.
  /// [title] et [content] acceptent String ou Widget.
  static Widget glassAlertDialog({
    required BuildContext context,
    Object? title,
    Object? content,
    List<Widget>? actions,
    Widget? icon,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    final titleWidget = title is Widget
        ? title
        : title is String
            ? Text(title, style: theme.textTheme.titleLarge)
            : null;
    final contentWidget = content is Widget
        ? content
        : content is String
            ? Text(content, style: theme.textTheme.bodyMedium)
            : null;

    return dialogWrapper(
      isDark: isDark,
      child: AlertDialog(
        elevation: 0,
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        title: titleWidget,
        content: contentWidget,
        actions: actions,
        icon: icon,
      ),
    );
  }

  /// Crée un SimpleDialog avec l'effet glass.
  static Widget glassSimpleDialog({
    required BuildContext context,
    String? title,
    List<Widget>? children,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return dialogWrapper(
      isDark: isDark,
      child: SimpleDialog(
        elevation: 0,
        title: title != null ? Text(title, style: theme.textTheme.titleLarge) : null,
        children: children,
      ),
    );
  }

  /// Helper pour convertir un AlertDialog existant en version glass.
  /// Utilisation: remplacez AlertDialog(...) par GlassTheme.wrapAlertDialog(context, AlertDialog(...))
  static Widget wrapAlertDialog(BuildContext context, Widget dialog) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return dialogWrapper(
      isDark: isDark,
      child: dialog,
    );
  }

  /// Helper pour convertir un SimpleDialog existant en version glass.
  /// Utilisation: remplacez SimpleDialog(...) par GlassTheme.wrapSimpleDialog(context, SimpleDialog(...))
  static Widget wrapSimpleDialog(BuildContext context, Widget dialog) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return dialogWrapper(
      isDark: isDark,
      child: dialog,
    );
  }

  /// Crée un dialogue GlassTheme personnalisé avec un titre, contenu et actions.
  /// Idéal pour remplacer les AlertDialog complexes.
  static Widget glassDialog({
    required BuildContext context,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    Widget? icon,
    bool scrollable = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return dialogWrapper(
      isDark: isDark,
      child: AlertDialog(
        elevation: 0,
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        title: title,
        content: content,
        actions: actions,
        icon: icon,
        scrollable: scrollable,
      ),
    );
  }

  /// Crée un dialogue de confirmation GlassTheme avec boutons Oui/Non.
  static Future<bool> glassConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText = 'Oui',
    String cancelText = 'Non',
  }) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return await showDialog<bool>(
      context: context,
      builder: (context) => glassDialog(
        context: context,
        title: Text(title, style: Theme.of(context).textTheme.titleLarge),
        content: Text(content, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight
        )),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(confirmText),
          ),
        ],
      ),
    ) ?? false;
  }
}
