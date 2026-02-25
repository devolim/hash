import 'package:flutter/foundation.dart';

/// Contrôleur de lecture vocale partagé entre les bulles d'un chat.
///
/// Gère :
/// 1. Exclusion mutuelle (un seul vocal joue à la fois)
/// 2. Vitesse partagée par groupe de vocaux consécutifs
/// 3. Lecture auto enchaînée au sein d'un groupe
class VoicePlaybackController extends ChangeNotifier {
  // --- Feature 1 : exclusion mutuelle ---
  String? _activeMessageId;
  VoidCallback? _stopCurrentCallback;

  String? get activeMessageId => _activeMessageId;

  /// Enregistre un vocal comme actif. Stoppe le précédent s'il existe.
  void registerPlaying(String messageId, VoidCallback stopCallback) {
    if (_activeMessageId != null && _activeMessageId != messageId) {
      _stopCurrentCallback?.call();
    }
    _activeMessageId = messageId;
    _stopCurrentCallback = stopCallback;
  }

  /// Désenregistre un vocal (quand il s'arrête ou se met en pause).
  void unregisterPlaying(String messageId) {
    if (_activeMessageId == messageId) {
      _activeMessageId = null;
      _stopCurrentCallback = null;
    }
  }

  /// Stoppe tout vocal en cours (appelé quand l'enregistrement démarre).
  void stopAllPlayback() {
    _stopCurrentCallback?.call();
    _activeMessageId = null;
    _stopCurrentCallback = null;
  }

  // --- Feature 2 : vitesse partagée par groupe ---
  final Map<int, double> _groupSpeeds = {};

  double getGroupSpeed(int groupIndex) {
    return _groupSpeeds[groupIndex] ?? 1.0;
  }

  void setGroupSpeed(int groupIndex, double speed) {
    _groupSpeeds[groupIndex] = speed;
    notifyListeners();
  }

  // --- Feature 3 : auto-play enchaîné ---
  final Map<String, VoidCallback> _playCallbacks = {};
  Map<int, List<String>> _groupMessageOrder = {};

  void setGroupMessageOrder(Map<int, List<String>> order) {
    _groupMessageOrder = order;
  }

  void registerPlayerCallback(String messageId, VoidCallback play) {
    _playCallbacks[messageId] = play;
  }

  void unregisterPlayerCallback(String messageId) {
    _playCallbacks.remove(messageId);
  }

  /// Appelé quand un vocal finit de jouer. Lance le suivant dans le groupe.
  void onMessageCompleted(String messageId, int groupIndex) {
    unregisterPlaying(messageId);

    final order = _groupMessageOrder[groupIndex];
    if (order == null) return;

    final currentIndex = order.indexOf(messageId);
    if (currentIndex == -1 || currentIndex >= order.length - 1) return;

    final nextMessageId = order[currentIndex + 1];
    final playNext = _playCallbacks[nextMessageId];
    playNext?.call();
  }
}
