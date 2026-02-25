import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Service de vérification de proximité pour le transfert de compte
///
/// Utilise 3 méthodes en parallèle:
/// 1. Bluetooth LE - détecte les appareils à ~10m
/// 2. Audio Ultrason - détecte les appareils à ~3m
/// 3. Manuel - l'utilisateur confirme que les codes correspondent
///
/// La première méthode qui réussit valide la proximité.
class ProximityVerificationService {
  static const _channel = MethodChannel('com.hash.app/proximity');

  // Callbacks
  void Function(ProximityMethod)? onProximityVerified;
  void Function(ProximityStatus)? onStatusChanged;
  void Function(String)? onError;

  // État
  bool _isVerifying = false;
  bool _bluetoothAvailable = false;
  bool _audioAvailable = false;
  String? _challenge;
  String? _proximityCode;

  // Timers
  Timer? _timeoutTimer;
  Timer? _bluetoothTimer;
  Timer? _audioTimer;

  // Résultats
  bool _bluetoothVerified = false;
  bool _audioVerified = false;
  bool _manualVerified = false;

  ProximityVerificationService();

  /// Démarrer la vérification de proximité (ANCIEN appareil)
  /// Génère un challenge et broadcast via Bluetooth + Audio
  Future<ProximityChallenge> startAsSource({
    required String proximityCode,
    Duration timeout = const Duration(minutes: 2),
  }) async {
    if (_isVerifying) {
      throw ProximityException('Vérification déjà en cours');
    }

    _isVerifying = true;
    _proximityCode = proximityCode;
    _challenge = _generateChallenge();
    _resetResults();

    // Vérifier les capacités
    await _checkCapabilities();

    // Démarrer le timeout
    _timeoutTimer = Timer(timeout, _onTimeout);

    // Démarrer Bluetooth broadcast si disponible
    if (_bluetoothAvailable) {
      _startBluetoothBroadcast();
    }

    // Démarrer Audio broadcast si disponible
    if (_audioAvailable) {
      _startAudioBroadcast();
    }

    _notifyStatus();

    return ProximityChallenge(
      challenge: _challenge!,
      proximityCode: proximityCode,
      bluetoothAvailable: _bluetoothAvailable,
      audioAvailable: _audioAvailable,
    );
  }

  /// Démarrer la vérification de proximité (NOUVEAU appareil)
  /// Écoute les broadcasts Bluetooth + Audio
  Future<void> startAsReceiver({
    required String expectedChallenge,
    Duration timeout = const Duration(minutes: 2),
  }) async {
    if (_isVerifying) {
      throw ProximityException('Vérification déjà en cours');
    }

    _isVerifying = true;
    _challenge = expectedChallenge;
    _resetResults();

    await _checkCapabilities();

    _timeoutTimer = Timer(timeout, _onTimeout);

    // Écouter Bluetooth si disponible
    if (_bluetoothAvailable) {
      _startBluetoothListen();
    }

    // Écouter Audio si disponible
    if (_audioAvailable) {
      _startAudioListen();
    }

    _notifyStatus();
  }

  /// Vérification manuelle - l'utilisateur confirme que les codes correspondent
  void confirmManualVerification() {
    if (!_isVerifying) return;

    _manualVerified = true;
    _onProximitySuccess(ProximityMethod.manual);
  }

  /// Rejeter la vérification manuelle
  void rejectManualVerification() {
    if (!_isVerifying) return;

    onError?.call('Les codes ne correspondent pas');
    stop();
  }

  /// Arrêter la vérification
  void stop() {
    _isVerifying = false;
    _timeoutTimer?.cancel();
    _bluetoothTimer?.cancel();
    _audioTimer?.cancel();
    _stopBluetoothBroadcast();
    _stopAudioBroadcast();
    _resetResults();
  }

  // ============ Bluetooth LE ============

  Future<void> _startBluetoothBroadcast() async {
    try {
      await _channel.invokeMethod('startBluetoothBroadcast', {
        'challenge': _challenge,
        'serviceUuid': 'hash-transfer-${_challenge!.substring(0, 8)}',
      });

      // Polling pour vérifier si un appareil a répondu
      _bluetoothTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
        final result = await _checkBluetoothResponse();
        if (result) {
          _bluetoothVerified = true;
          _onProximitySuccess(ProximityMethod.bluetooth);
        }
      });
    } catch (e) {
      debugPrint('Bluetooth broadcast error: $e');
      _bluetoothAvailable = false;
      _notifyStatus();
    }
  }

  Future<void> _startBluetoothListen() async {
    try {
      await _channel.invokeMethod('startBluetoothScan', {
        'serviceUuidPrefix': 'hash-transfer-',
      });

      _bluetoothTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
        final result = await _checkBluetoothDiscovery();
        if (result != null && result == _challenge) {
          _bluetoothVerified = true;
          // Répondre au broadcast
          await _respondToBluetooth();
          _onProximitySuccess(ProximityMethod.bluetooth);
        }
      });
    } catch (e) {
      debugPrint('Bluetooth scan error: $e');
      _bluetoothAvailable = false;
      _notifyStatus();
    }
  }

  Future<bool> _checkBluetoothResponse() async {
    try {
      final result = await _channel.invokeMethod<bool>('checkBluetoothResponse');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<String?> _checkBluetoothDiscovery() async {
    try {
      return await _channel.invokeMethod<String>('getDiscoveredChallenge');
    } catch (e) {
      return null;
    }
  }

  Future<void> _respondToBluetooth() async {
    try {
      await _channel.invokeMethod('respondToBluetooth', {
        'challenge': _challenge,
      });
    } catch (e) {
      debugPrint('Bluetooth response error: $e');
    }
  }

  void _stopBluetoothBroadcast() {
    try {
      _channel.invokeMethod('stopBluetooth');
    } catch (e) {
      debugPrint('Stop Bluetooth error: $e');
    }
  }

  // ============ Audio Ultrason ============

  Future<void> _startAudioBroadcast() async {
    try {
      // Encoder le challenge en fréquences ultrasoniques (18-20kHz)
      await _channel.invokeMethod('startAudioBroadcast', {
        'challenge': _challenge,
        'frequency': 19000, // 19kHz - inaudible pour la plupart des gens
      });

      _audioTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
        final result = await _checkAudioResponse();
        if (result) {
          _audioVerified = true;
          _onProximitySuccess(ProximityMethod.audio);
        }
      });
    } catch (e) {
      debugPrint('Audio broadcast error: $e');
      _audioAvailable = false;
      _notifyStatus();
    }
  }

  Future<void> _startAudioListen() async {
    try {
      await _channel.invokeMethod('startAudioListen', {
        'frequency': 19000,
      });

      _audioTimer = Timer.periodic(const Duration(milliseconds: 500), (_) async {
        final result = await _checkAudioDiscovery();
        if (result != null && result == _challenge) {
          _audioVerified = true;
          // Répondre avec un signal audio
          await _respondToAudio();
          _onProximitySuccess(ProximityMethod.audio);
        }
      });
    } catch (e) {
      debugPrint('Audio listen error: $e');
      _audioAvailable = false;
      _notifyStatus();
    }
  }

  Future<bool> _checkAudioResponse() async {
    try {
      final result = await _channel.invokeMethod<bool>('checkAudioResponse');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<String?> _checkAudioDiscovery() async {
    try {
      return await _channel.invokeMethod<String>('getAudioChallenge');
    } catch (e) {
      return null;
    }
  }

  Future<void> _respondToAudio() async {
    try {
      await _channel.invokeMethod('respondToAudio', {
        'challenge': _challenge,
      });
    } catch (e) {
      debugPrint('Audio response error: $e');
    }
  }

  void _stopAudioBroadcast() {
    try {
      _channel.invokeMethod('stopAudio');
    } catch (e) {
      debugPrint('Stop Audio error: $e');
    }
  }

  // ============ Helpers ============

  Future<void> _checkCapabilities() async {
    try {
      final capabilities = await _channel.invokeMethod<Map>('checkCapabilities');
      _bluetoothAvailable = capabilities?['bluetooth'] == true;
      _audioAvailable = capabilities?['audio'] == true;
    } catch (e) {
      // Platform channel non disponible - mode dégradé
      _bluetoothAvailable = false;
      _audioAvailable = false;
    }
  }

  String _generateChallenge() {
    final random = Random.secure();
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    return List.generate(16, (_) => chars[random.nextInt(chars.length)]).join();
  }

  void _resetResults() {
    _bluetoothVerified = false;
    _audioVerified = false;
    _manualVerified = false;
  }

  void _onProximitySuccess(ProximityMethod method) {
    if (!_isVerifying) return;

    stop();
    onProximityVerified?.call(method);
  }

  void _onTimeout() {
    if (!_isVerifying) return;

    // Si aucune méthode automatique n'a réussi, on reste sur le manuel
    _notifyStatus();
    onError?.call('Timeout - utilisez la vérification manuelle');
  }

  void _notifyStatus() {
    onStatusChanged?.call(ProximityStatus(
      isVerifying: _isVerifying,
      bluetoothAvailable: _bluetoothAvailable,
      audioAvailable: _audioAvailable,
      bluetoothVerified: _bluetoothVerified,
      audioVerified: _audioVerified,
      manualVerified: _manualVerified,
      proximityCode: _proximityCode,
    ));
  }

  /// Obtenir le statut actuel
  ProximityStatus get status => ProximityStatus(
    isVerifying: _isVerifying,
    bluetoothAvailable: _bluetoothAvailable,
    audioAvailable: _audioAvailable,
    bluetoothVerified: _bluetoothVerified,
    audioVerified: _audioVerified,
    manualVerified: _manualVerified,
    proximityCode: _proximityCode,
  );
}

// ============ Modèles ============

enum ProximityMethod {
  bluetooth,
  audio,
  manual,
}

class ProximityChallenge {
  final String challenge;
  final String proximityCode;
  final bool bluetoothAvailable;
  final bool audioAvailable;

  ProximityChallenge({
    required this.challenge,
    required this.proximityCode,
    required this.bluetoothAvailable,
    required this.audioAvailable,
  });
}

class ProximityStatus {
  final bool isVerifying;
  final bool bluetoothAvailable;
  final bool audioAvailable;
  final bool bluetoothVerified;
  final bool audioVerified;
  final bool manualVerified;
  final String? proximityCode;

  ProximityStatus({
    required this.isVerifying,
    required this.bluetoothAvailable,
    required this.audioAvailable,
    required this.bluetoothVerified,
    required this.audioVerified,
    required this.manualVerified,
    this.proximityCode,
  });

  bool get anyVerified => bluetoothVerified || audioVerified || manualVerified;

  String get statusText {
    if (anyVerified) return 'Proximité vérifiée';
    if (!isVerifying) return 'En attente';

    final methods = <String>[];
    if (bluetoothAvailable) methods.add('Bluetooth');
    if (audioAvailable) methods.add('Audio');
    methods.add('Manuel');

    return 'Vérification: ${methods.join(', ')}';
  }
}

class ProximityException implements Exception {
  final String message;
  ProximityException(this.message);

  @override
  String toString() => message;
}
