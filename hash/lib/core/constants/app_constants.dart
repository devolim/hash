/// Application-wide constants
class AppConstants {
  AppConstants._();

  // ============ APP INFO ============
  static const String appName = 'Hash';
  static const String appTagline = 'La messagerie vraiment confidentielle.';

  // ============ TIMING ============
  static const Duration temporaryCodeValidity = Duration(minutes: 5);
  static const Duration messageExpiration = Duration(hours: 24);
  static const Duration splashDuration = Duration(milliseconds: 2000);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);

  // ============ SECURITY ============
  static const int pinLength = 6;
  static const int temporaryCodeLength = 6;
  static const int minPrekeysCount = 20;
  static const int maxPrekeysCount = 100;

  // ============ MEDIA LIMITS ============
  static const int maxFileSizeMB = 500;
  static const int maxVoiceMessageMinutes = 10;
  static const int maxFileSizeBytes = maxFileSizeMB * 1024 * 1024;

  // Limites par type pour l'upload chiffré
  static const int maxImageSizeBytes = 10 * 1024 * 1024;      // 10 Mo
  static const int maxVideoSizeBytes = 100 * 1024 * 1024;     // 100 Mo
  static const int maxVoiceSizeBytes = 5 * 1024 * 1024;       // 5 Mo
  static const int maxDocumentSizeBytes = 25 * 1024 * 1024;   // 25 Mo
  static const int maxMediaSizeBytes = 100 * 1024 * 1024;     // 100 Mo (plafond)
  static const int userMediaQuotaBytes = 200 * 1024 * 1024;   // 200 Mo en transit
  static const int globalMediaQuotaBytes = 20 * 1024 * 1024 * 1024; // 20 Go

  // ============ UI ============
  static const double borderRadius = 14.0;
  static const double borderRadiusLarge = 20.0;
  static const double borderRadiusSmall = 8.0;
  static const double cardElevation = 0.0;
  static const double iconSize = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeSmall = 18.0;

  // ============ PADDINGS ============
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  // ============ HASH ID FORMAT ============
  static const String hashIdPattern = r'^\d{3}-\d{3}-[A-Z]{3}$';
  static const String excludedDigits = '01';
  static const String excludedLetters = 'OIL';

  // ============ STORAGE KEYS ============
  static const String storageKeyUser = 'user_data';
  static const String storageKeyContacts = 'contacts';
  static const String storageKeyMessages = 'messages';
  static const String storageKeySettings = 'settings';
  static const String storageKeyIdentityKeys = 'identity_keys';
  static const String storageKeyPrekeys = 'prekeys';
  static const String storageKeyPinHash = 'pin_hash';
  static const String storageKeyBiometricEnabled = 'biometric_enabled';
  static const String storageKeyDuressPin = 'duress_pin';
  static const String storageKeyThemeMode = 'theme_mode';
  static const String storageKeyLocale = 'locale';
}
