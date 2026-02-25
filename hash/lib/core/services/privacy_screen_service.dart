import 'package:flutter/services.dart';

/// Service pour masquer le contenu de l'app dans le multitâche
/// et empêcher les captures d'écran.
///
/// Android : FLAG_SECURE (bloque captures + masque dans récents)
/// iOS : Vue de masquage avec blur quand l'app passe en arrière-plan
class PrivacyScreenService {
  static const _channel = MethodChannel('com.hash.app/privacy_screen');

  /// Active ou désactive la protection d'écran
  static Future<void> setEnabled(bool enabled) async {
    try {
      await _channel.invokeMethod('setPrivacyScreen', {'enabled': enabled});
    } on PlatformException catch (_) {
      // Silently fail on platforms that don't support this
    }
  }
}
