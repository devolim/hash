import 'dart:io';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

/// Service léger pour jouer les sons UI (notification, envoi pop).
/// Réutilise un seul AudioPlayer.
///
/// iOS utilise `.caf`, Android utilise `.m4a` (AAC).
///
/// Les sons UI (pop/recep) utilisent la catégorie `ambient` sur iOS,
/// ce qui respecte le switch silencieux. Sur Android, le volume du
/// stream MUSIC est à 0 quand le téléphone est en mode silencieux,
/// ce qui produit le même effet.
class UiSoundService {
  AudioPlayer? _player;

  static const Map<String, String> notificationSounds = {
    'shadow': 'Shadow',
    'bolt': 'Bolt',
    'breach': 'Breach',
    'cipher': 'Cipher',
    'crypt': 'Crypt',
    'onyx': 'Onyx',
    'phantom': 'Phantom',
    'sentinel': 'Sentinel',
    'sheld': 'Sheld',
    'signal': 'Signal',
    'stealth': 'Stealth',
    'vault': 'Vault',
    'vynk': 'Vynk',
    'whisp': 'Whisp',
  };

  /// Extension selon la plateforme : `.caf` sur iOS, `.m4a` sur Android.
  static String get _ext => Platform.isIOS ? 'caf' : 'm4a';

  AudioPlayer get _audioPlayer {
    _player ??= AudioPlayer();
    return _player!;
  }

  /// Configure la session audio en mode ambient (respecte le mode silencieux).
  /// Appelé avant chaque son car d'autres composants (VoicePlayer, appels)
  /// peuvent reconfigurer la session globale entre-temps.
  Future<void> _ensureAmbientSession() async {
    if (!Platform.isIOS) return;
    try {
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.ambient,
        avAudioSessionMode: AVAudioSessionMode.defaultMode,
      ));
    } catch (e) {
      debugPrint('[UiSoundService] Error configuring audio session: $e');
    }
  }

  /// Configure la session audio en mode playback (ignore le mode silencieux).
  /// Utilisé pour la prévisualisation des sons dans les réglages.
  Future<void> _ensurePlaybackSession() async {
    if (!Platform.isIOS) return;
    try {
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.playback,
        avAudioSessionMode: AVAudioSessionMode.defaultMode,
      ));
    } catch (e) {
      debugPrint('[UiSoundService] Error configuring playback session: $e');
    }
  }

  /// Joue un son de notification par nom (ex: 'bell', 'chime').
  Future<void> playNotificationSound(String soundName) async {
    try {
      await _ensureAmbientSession();
      await _audioPlayer.setAsset('assets/sounds/notification/$soundName.$_ext');
      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('[UiSoundService] Error playing notification sound: $e');
    }
  }

  /// Joue le son de réception (recep) quand on reçoit un message in-app.
  Future<void> playReceiveSound() async {
    try {
      await _ensureAmbientSession();
      await _audioPlayer.setAsset('assets/sounds/ui/recep.$_ext');
      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('[UiSoundService] Error playing receive sound: $e');
    }
  }

  /// Joue le son pop à l'envoi de message.
  Future<void> playSendSound() async {
    try {
      await _ensureAmbientSession();
      await _audioPlayer.setAsset('assets/sounds/ui/pop.$_ext');
      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('[UiSoundService] Error playing send sound: $e');
    }
  }

  /// Prévisualise un son de notification dans les réglages.
  /// Utilise le canal playback (media) pour être audible même en mode silencieux.
  /// Le mode ambient est restauré automatiquement par les autres méthodes
  /// (playNotificationSound, playSendSound, etc.) avant leur propre lecture.
  Future<void> previewSound(String soundName) async {
    try {
      await _ensurePlaybackSession();
      await _audioPlayer.setAsset('assets/sounds/notification/$soundName.$_ext');
      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('[UiSoundService] Error previewing sound: $e');
    }
  }

  void dispose() {
    _player?.dispose();
    _player = null;
  }
}
