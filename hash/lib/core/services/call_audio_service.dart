import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vibration/vibration.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

/// Service pour gérer l'audio des appels (sonneries, sons, vibrations)
class CallAudioService {
  static final CallAudioService _instance = CallAudioService._internal();
  factory CallAudioService() => _instance;
  CallAudioService._internal();

  bool _isRinging = false;
  bool _isDialing = false;
  Timer? _vibrationTimer;
  AudioPlayer? _dialingPlayer;
  AudioPlayer? _ringtonePlayer;
  String? _dialingTonePath;

  static const _audioChannel = MethodChannel('com.hash.app/audio');

  /// La sonnerie est-elle en cours ?
  bool get isRinging => _isRinging;

  /// La tonalité d'appel est-elle en cours ?
  bool get isDialing => _isDialing;

  /// Jouer la sonnerie (appel entrant)
  /// [playAudio] : si true, joue la sonnerie custom en foreground via just_audio.
  /// En arrière-plan, CallKit gère la sonnerie native — on ne joue pas de son ici.
  Future<void> startRingtone({bool vibrate = true, bool playAudio = false}) async {
    if (_isRinging) return;
    _isRinging = true;

    debugPrint('[CallAudioService] Starting ringtone (playAudio: $playAudio)');

    // Garder l'écran allumé
    await WakelockPlus.enable();

    // Démarrer la vibration en pattern
    if (vibrate) {
      _startVibrationPattern();
    }

    // Jouer la sonnerie custom en foreground
    // Utilise la catégorie ambient (iOS) pour respecter le switch silencieux,
    // et le stream NOTIFICATION_RINGTONE (Android) pour suivre le volume de sonnerie.
    // Même comportement que WhatsApp/Signal : pas de son en mode silencieux,
    // volume contrôlé par le réglage sonnerie (pas le volume média).
    if (playAudio) {
      try {
        final oldPlayer = _ringtonePlayer;
        _ringtonePlayer = null;
        if (oldPlayer != null) {
          try {
            await oldPlayer.stop();
            await oldPlayer.dispose();
          } catch (_) {}
        }

        // Configurer la session audio pour la sonnerie
        try {
          final session = await AudioSession.instance;
          await session.configure(AudioSessionConfiguration(
            // iOS: ambient respecte le switch silencieux (muet = pas de son)
            avAudioSessionCategory: AVAudioSessionCategory.ambient,
            avAudioSessionMode: AVAudioSessionMode.defaultMode,
            // Android: USAGE_NOTIFICATION_RINGTONE utilise le volume de sonnerie
            // (pas le volume média), et est silencieux en mode Ne pas déranger
            androidAudioAttributes: const AndroidAudioAttributes(
              contentType: AndroidAudioContentType.sonification,
              usage: AndroidAudioUsage.notificationRingtone,
            ),
            androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
          ));
        } catch (e) {
          debugPrint('[CallAudioService] Failed to configure ringtone session: $e');
        }

        final player = AudioPlayer();
        _ringtonePlayer = player;

        final extension = Platform.isIOS ? 'caf' : 'm4a';
        await player.setAudioSource(
          AudioSource.asset('assets/sounds/ui/ringstone.$extension'),
        );
        await player.setLoopMode(LoopMode.all);
        await player.setVolume(1.0);
        player.play();
        debugPrint('[CallAudioService] Ringtone playing');
      } catch (e) {
        debugPrint('[CallAudioService] Failed to play ringtone: $e');
      }
    }
  }

  /// Arrêter la sonnerie
  Future<void> stopRingtone() async {
    if (!_isRinging) return;
    _isRinging = false;

    debugPrint('[CallAudioService] Stopping ringtone');

    // Arrêter le player de sonnerie
    final player = _ringtonePlayer;
    _ringtonePlayer = null;
    if (player != null) {
      try {
        await player.stop();
        await player.dispose();
      } catch (e) {
        debugPrint('[CallAudioService] Error stopping ringtone player: $e');
      }
    }

    // Arrêter la vibration
    _stopVibration();

    // Désactiver le wakelock (sera réactivé si l'appel est accepté)
    await WakelockPlus.disable();
  }

  /// Jouer la tonalité d'appel sortant (bip... bip... classique)
  /// [isVideoCall] : si true, route vers le haut-parleur ; sinon vers l'écouteur.
  Future<void> startDialingTone({bool isVideoCall = false}) async {
    if (_isDialing) return;
    _isDialing = true;

    debugPrint('[CallAudioService] Starting dialing tone (video=$isVideoCall)');

    // Garder l'écran allumé
    await WakelockPlus.enable();

    try {
      // Nettoyer tout player résiduel avant d'en créer un nouveau
      final oldPlayer = _dialingPlayer;
      _dialingPlayer = null;
      if (oldPlayer != null) {
        try {
          await oldPlayer.stop();
          await oldPlayer.dispose();
        } catch (e) {
          debugPrint('[CallAudioService] Disposing old player failed: $e');
        }
      }

      // Configurer la session audio AVANT de jouer :
      // - Appel audio → écouteur (playAndRecord sans defaultToSpeaker)
      // - Appel vidéo → haut-parleur (playAndRecord + defaultToSpeaker)
      try {
        final session = await AudioSession.instance;
        final bluetoothOptions =
            AVAudioSessionCategoryOptions.allowBluetooth |
            AVAudioSessionCategoryOptions.allowBluetoothA2dp;
        await session.configure(AudioSessionConfiguration(
          avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
          avAudioSessionCategoryOptions: isVideoCall
              ? bluetoothOptions | AVAudioSessionCategoryOptions.defaultToSpeaker
              : bluetoothOptions,
          avAudioSessionMode: isVideoCall
              ? AVAudioSessionMode.videoChat
              : AVAudioSessionMode.voiceChat,
          androidAudioAttributes: const AndroidAudioAttributes(
            contentType: AndroidAudioContentType.speech,
            usage: AndroidAudioUsage.voiceCommunication,
          ),
          androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
        ));
        debugPrint('[CallAudioService] Audio session configured for ${isVideoCall ? "video" : "audio"} call');
      } catch (e) {
        debugPrint('[CallAudioService] Failed to configure audio session: $e');
      }

      // Générer le fichier WAV de tonalité si pas encore fait
      await _ensureDialingToneFile();

      if (_dialingTonePath != null) {
        final player = AudioPlayer();
        _dialingPlayer = player;
        await player.setAudioSource(
          AudioSource.file(_dialingTonePath!),
        );
        await player.setLoopMode(LoopMode.all);
        await player.setVolume(0.6);
        player.play(); // Don't await - play() completes when playback ends, but we loop forever
      }
    } catch (e) {
      debugPrint('[CallAudioService] Failed to play dialing tone: $e');
      // Fallback: simple click
      await SystemSound.play(SystemSoundType.click);
    }
  }

  /// Changer le routage audio (écouteur ↔ haut-parleur) pendant la tonalité
  Future<void> setSpeakerDuringDialing(bool speakerOn) async {
    if (!_isDialing) return;
    debugPrint('[CallAudioService] setSpeakerDuringDialing: $speakerOn');

    if (Platform.isIOS) {
      // iOS : reconfigurer AVAudioSession (globale, affecte just_audio immédiatement)
      try {
        final session = await AudioSession.instance;
        final bluetoothOptions =
            AVAudioSessionCategoryOptions.allowBluetooth |
            AVAudioSessionCategoryOptions.allowBluetoothA2dp;
        await session.configure(AudioSessionConfiguration(
          avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
          avAudioSessionCategoryOptions: speakerOn
              ? bluetoothOptions | AVAudioSessionCategoryOptions.defaultToSpeaker
              : bluetoothOptions,
          avAudioSessionMode: speakerOn
              ? AVAudioSessionMode.videoChat
              : AVAudioSessionMode.voiceChat,
          androidAudioAttributes: const AndroidAudioAttributes(
            contentType: AndroidAudioContentType.speech,
            usage: AndroidAudioUsage.voiceCommunication,
          ),
          androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
        ));
      } catch (e) {
        debugPrint('[CallAudioService] iOS audio session error: $e');
      }
    } else if (Platform.isAndroid) {
      // Android : AudioManager.setSpeakerphoneOn via method channel
      // (audio_session ne change pas le routage d'un player déjà actif)
      try {
        await _audioChannel.invokeMethod('setSpeakerphoneOn', {'enabled': speakerOn});
      } catch (e) {
        debugPrint('[CallAudioService] Android speakerphone error: $e');
      }
    }
  }

  /// Arrêter la tonalité d'appel sortant
  Future<void> stopDialingTone() async {
    if (!_isDialing) return;
    _isDialing = false;

    debugPrint('[CallAudioService] Stopping dialing tone');

    final player = _dialingPlayer;
    _dialingPlayer = null;

    if (player != null) {
      try {
        await player.stop();
        await player.dispose();
      } catch (e) {
        debugPrint('[CallAudioService] Error stopping dialing tone: $e');
      }
    }

    // Réinitialiser le mode audio Android (MODE_NORMAL)
    if (Platform.isAndroid) {
      try {
        await _audioChannel.invokeMethod('resetAudioMode');
      } catch (e) {
        debugPrint('[CallAudioService] Reset audio mode failed: $e');
      }
    }
  }

  /// Jouer le son de connexion réussie
  Future<void> playConnectSound() async {
    debugPrint('[CallAudioService] Playing connect sound');
    await HapticFeedback.mediumImpact();
  }

  /// Jouer le son de fin d'appel
  Future<void> playEndCallSound() async {
    debugPrint('[CallAudioService] Playing end call sound');
    await HapticFeedback.heavyImpact();
  }

  /// Jouer le son occupé
  Future<void> playBusySound() async {
    debugPrint('[CallAudioService] Playing busy sound');
    // 3 bips rapides
    for (int i = 0; i < 3; i++) {
      await HapticFeedback.lightImpact();
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  /// Jouer le son d'échec
  Future<void> playFailedSound() async {
    debugPrint('[CallAudioService] Playing failed sound');
    await HapticFeedback.heavyImpact();
  }

  /// Activer le wakelock pour l'appel actif
  Future<void> enableCallWakelock() async {
    await WakelockPlus.enable();
    debugPrint('[CallAudioService] Wakelock enabled');
  }

  /// Désactiver le wakelock
  Future<void> disableCallWakelock() async {
    await WakelockPlus.disable();
    debugPrint('[CallAudioService] Wakelock disabled');
  }

  /// Vibration courte
  Future<void> vibrate() async {
    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(duration: 100);
    }
  }

  /// Démarrer le pattern de vibration pour sonnerie
  void _startVibrationPattern() async {
    _vibrationTimer?.cancel();

    // Pattern: vibrer 1s, pause 1s
    _vibrationTimer = Timer.periodic(
      const Duration(milliseconds: 2000),
      (_) async {
        if (_isRinging && await Vibration.hasVibrator()) {
          // Vibration avec pattern: [wait, vibrate, wait, vibrate, ...]
          await Vibration.vibrate(
            pattern: [0, 500, 200, 500],
            intensities: [0, 255, 0, 255],
          );
        }
      },
    );

    // Première vibration immédiate
    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(
        pattern: [0, 500, 200, 500],
        intensities: [0, 255, 0, 255],
      );
    }
  }

  /// Arrêter la vibration
  void _stopVibration() {
    _vibrationTimer?.cancel();
    _vibrationTimer = null;
    Vibration.cancel();
  }

  /// Configurer l'audio pour un appel
  Future<void> configureAudioForCall({
    bool speakerEnabled = false,
  }) async {
    debugPrint('[CallAudioService] Configuring audio for call');

    // Sur iOS, CallKit gère la configuration audio
    // Sur Android, on configure via les canaux audio
    if (Platform.isAndroid) {
      // Configuration audio Android gérée par LiveKit
    }
  }

  /// Réinitialiser la configuration audio après un appel
  Future<void> resetAudioConfiguration() async {
    debugPrint('[CallAudioService] Resetting audio configuration');
    await disableCallWakelock();
    _stopVibration();
  }

  /// Libérer les ressources
  void dispose() {
    stopRingtone();
    stopDialingTone();
    _stopVibration();
    _dialingPlayer?.dispose();
    _ringtonePlayer?.dispose();
    WakelockPlus.disable();
  }

  // ============ TONE GENERATION ============

  /// Génère le fichier WAV de tonalité d'appel s'il n'existe pas encore.
  /// Pattern standard : bip 1s à 440Hz, silence 3s, en boucle.
  Future<void> _ensureDialingToneFile() async {
    if (_dialingTonePath != null && File(_dialingTonePath!).existsSync()) {
      return;
    }

    try {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/dialing_tone.wav');

      if (!file.existsSync()) {
        final wavData = _generateDialingToneWav();
        await file.writeAsBytes(wavData);
        debugPrint('[CallAudioService] Generated dialing tone WAV (${wavData.length} bytes)');
      }

      _dialingTonePath = file.path;
    } catch (e) {
      debugPrint('[CallAudioService] Failed to generate dialing tone: $e');
    }
  }

  /// Génère un fichier WAV contenant le pattern de tonalité d'appel.
  /// Bip de 1s à 440Hz + 3s de silence = 4s par cycle.
  Uint8List _generateDialingToneWav() {
    const sampleRate = 22050;
    const bitsPerSample = 16;
    const channels = 1;
    const toneDuration = 1.0; // secondes de bip
    const silenceDuration = 3.0; // secondes de silence
    const frequency = 440.0; // Hz (La4)
    const amplitude = 0.3; // Volume modéré

    final totalDuration = toneDuration + silenceDuration;
    final totalSamples = (sampleRate * totalDuration).toInt();
    final toneSamples = (sampleRate * toneDuration).toInt();

    // Données PCM 16 bits
    final pcmData = Int16List(totalSamples);
    final maxVal = 32767.0 * amplitude;

    for (int i = 0; i < toneSamples; i++) {
      final t = i / sampleRate;
      // Sine wave avec fade in/out pour éviter les clics
      double envelope = 1.0;
      const fadeMs = 0.02; // 20ms fade
      if (t < fadeMs) {
        envelope = t / fadeMs;
      } else if (t > toneDuration - fadeMs) {
        envelope = (toneDuration - t) / fadeMs;
      }
      pcmData[i] = (sin(2 * pi * frequency * t) * maxVal * envelope).toInt();
    }
    // Les samples restants sont déjà à 0 (silence)

    // Construire le fichier WAV
    final dataSize = totalSamples * (bitsPerSample ~/ 8) * channels;
    final fileSize = 36 + dataSize;

    final buffer = ByteData(44 + dataSize);
    int offset = 0;

    // RIFF header
    buffer.setUint8(offset++, 0x52); // R
    buffer.setUint8(offset++, 0x49); // I
    buffer.setUint8(offset++, 0x46); // F
    buffer.setUint8(offset++, 0x46); // F
    buffer.setUint32(offset, fileSize, Endian.little);
    offset += 4;
    buffer.setUint8(offset++, 0x57); // W
    buffer.setUint8(offset++, 0x41); // A
    buffer.setUint8(offset++, 0x56); // V
    buffer.setUint8(offset++, 0x45); // E

    // fmt chunk
    buffer.setUint8(offset++, 0x66); // f
    buffer.setUint8(offset++, 0x6D); // m
    buffer.setUint8(offset++, 0x74); // t
    buffer.setUint8(offset++, 0x20); // (space)
    buffer.setUint32(offset, 16, Endian.little); // chunk size
    offset += 4;
    buffer.setUint16(offset, 1, Endian.little); // PCM format
    offset += 2;
    buffer.setUint16(offset, channels, Endian.little);
    offset += 2;
    buffer.setUint32(offset, sampleRate, Endian.little);
    offset += 4;
    buffer.setUint32(offset, sampleRate * channels * (bitsPerSample ~/ 8), Endian.little);
    offset += 4;
    buffer.setUint16(offset, channels * (bitsPerSample ~/ 8), Endian.little);
    offset += 2;
    buffer.setUint16(offset, bitsPerSample, Endian.little);
    offset += 2;

    // data chunk
    buffer.setUint8(offset++, 0x64); // d
    buffer.setUint8(offset++, 0x61); // a
    buffer.setUint8(offset++, 0x74); // t
    buffer.setUint8(offset++, 0x61); // a
    buffer.setUint32(offset, dataSize, Endian.little);
    offset += 4;

    // PCM samples
    for (int i = 0; i < totalSamples; i++) {
      buffer.setInt16(offset, pcmData[i], Endian.little);
      offset += 2;
    }

    return buffer.buffer.asUint8List();
  }
}
