import 'dart:ui';

/// Generates language-aware URLs for legal pages on hash.devolim.fr.
///
/// French is served at the root, other languages in subdirectories.
class LegalUrls {
  static const _baseUrl = String.fromEnvironment('WEBSITE_URL', defaultValue: 'https://hash.devolim.fr');
  static const _supportedLocales = {'ar', 'de', 'en', 'es', 'it', 'ja', 'ko', 'pt', 'ru', 'tr', 'zh'};

  static String _langPath(Locale locale) {
    final code = locale.languageCode;
    // French is served at the root
    if (code == 'fr') return '';
    // Supported languages have their own subdirectory
    if (_supportedLocales.contains(code)) return '/$code';
    // Fallback to English for unsupported locales
    return '/en';
  }

  static String privacyPolicy(Locale locale) =>
      '$_baseUrl${_langPath(locale)}/privacy.html';

  static String termsOfService(Locale locale) =>
      '$_baseUrl${_langPath(locale)}/terms.html';

  static String deleteAccount(Locale locale) =>
      '$_baseUrl${_langPath(locale)}/delete-account.html';
}
