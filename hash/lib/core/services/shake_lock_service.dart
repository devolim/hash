import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

/// Service pour détecter les secousses du téléphone et verrouiller l'app
class ShakeLockService {
  ShakeDetector? _detector;
  VoidCallback? _onShakeDetected;
  bool _isEnabled = false;
  bool _isPaused = false;

  void start({required VoidCallback onShakeDetected}) {
    stop(); // Clean up any existing detector

    _onShakeDetected = onShakeDetected;
    _isEnabled = true;

    _detector = ShakeDetector.autoStart(
      shakeThresholdGravity: 3.5,
      minimumShakeCount: 2,
      shakeSlopTimeMS: 500,
      onPhoneShake: (event) {
        if (!_isPaused && _isEnabled) {
          debugPrint('[ShakeLock] Shake detected!');
          _onShakeDetected?.call();
        }
      },
    );
    debugPrint('[ShakeLock] Started listening');
  }

  void stop() {
    _detector?.stopListening();
    _detector = null;
    _isEnabled = false;
    _onShakeDetected = null;
    debugPrint('[ShakeLock] Stopped');
  }

  void pause() => _isPaused = true;
  void resume() => _isPaused = false;

  bool get isEnabled => _isEnabled;
  bool get isPaused => _isPaused;
}
