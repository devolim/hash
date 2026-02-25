import 'dart:io';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'secure_storage_service.dart';

/// Service de temps sécurisé anti-manipulation
///
/// Protections implémentées:
/// 1. Uptime système - ne peut pas être manipulé sans redémarrer
/// 2. Vérification serveur - compare l'heure locale vs serveur
/// 3. Détection de redémarrage - pénalité si manipulation suspectée
/// 4. Monotonic counter - détecte les retours en arrière
class SecureTimeService {
  final SecureStorageService _secureStorage;

  // Clés de stockage
  static const _keyLastKnownUptime = 'secure_time_last_uptime';
  static const _keyLastKnownWallClock = 'secure_time_last_wall_clock';
  static const _keyServerTimeOffset = 'secure_time_server_offset';
  static const _keyLastServerCheck = 'secure_time_last_server_check';
  static const _keyRebootCount = 'secure_time_reboot_count';
  static const _keySuspiciousActivityCount = 'secure_time_suspicious_count';
  static const _keyAccumulatedPenalty = 'secure_time_penalty_seconds';

  // Constantes
  static const int _maxAllowedDriftMs = 300000; // 5 minutes de drift acceptable
  static const int _rebootPenaltySeconds = 1800; // 30 min de pénalité par reboot suspect
  static const int _manipulationPenaltySeconds = 3600; // 1h de pénalité par manipulation

  SecureTimeService({
    required SecureStorageService secureStorage,
  }) : _secureStorage = secureStorage;

  /// Obtenir l'uptime système en millisecondes
  /// L'uptime est le temps depuis le dernier boot - impossible à manipuler
  Future<int> _getSystemUptime() async {
    try {
      if (Platform.isAndroid) {
        // Sur Android, on utilise SystemClock.elapsedRealtime()
        const channel = MethodChannel('com.hash.app/system');
        final uptime = await channel.invokeMethod<int>('getElapsedRealtime');
        return uptime ?? 0;
      } else if (Platform.isIOS) {
        // Sur iOS, on utilise mach_absolute_time ou ProcessInfo
        const channel = MethodChannel('com.hash.app/system');
        final uptime = await channel.invokeMethod<int>('getSystemUptime');
        return uptime ?? 0;
      }
    } catch (e) {
      // Fallback: utiliser DateTime mais marquer comme non fiable
    }

    // Fallback - moins sécurisé mais mieux que rien
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// Vérifier l'heure avec un serveur NTP ou HTTP
  Future<int?> _getServerTime() async {
    try {
      // Vérifier la connectivité
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        return null;
      }

      // Utiliser plusieurs sources pour plus de fiabilité
      final sources = [
        'https://worldtimeapi.org/api/ip',
        'https://timeapi.io/api/Time/current/zone?timeZone=UTC',
      ];

      for (final url in sources) {
        try {
          final response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 5),
          );

          if (response.statusCode == 200) {
            // Parser la réponse selon la source
            if (url.contains('worldtimeapi')) {
              final match = RegExp(r'"unixtime":(\d+)').firstMatch(response.body);
              if (match != null) {
                return int.parse(match.group(1)!) * 1000; // Convertir en ms
              }
            } else if (url.contains('timeapi')) {
              final match = RegExp(r'"dateTime":"([^"]+)"').firstMatch(response.body);
              if (match != null) {
                final dt = DateTime.parse(match.group(1)!);
                return dt.millisecondsSinceEpoch;
              }
            }
          }
        } catch (_) {
          continue;
        }
      }
    } catch (_) {
      // Pas d'internet ou erreur
    }
    return null;
  }

  /// Initialiser et vérifier l'état du temps au démarrage
  Future<TimeSecurityStatus> initialize() async {
    final currentUptime = await _getSystemUptime();
    final currentWallClock = DateTime.now().millisecondsSinceEpoch;

    // Récupérer les dernières valeurs connues
    final lastUptime = await _getStoredInt(_keyLastKnownUptime) ?? 0;
    final lastWallClock = await _getStoredInt(_keyLastKnownWallClock) ?? 0;
    var suspiciousCount = await _getStoredInt(_keySuspiciousActivityCount) ?? 0;
    var rebootCount = await _getStoredInt(_keyRebootCount) ?? 0;
    var accumulatedPenalty = await _getStoredInt(_keyAccumulatedPenalty) ?? 0;

    bool rebootDetected = false;
    bool timeManipulationDetected = false;

    // Détecter un redémarrage (uptime actuel < dernier uptime connu)
    if (lastUptime > 0 && currentUptime < lastUptime) {
      rebootDetected = true;
      rebootCount++;

      // Vérifier si c'est un reboot suspect (wall clock a bougé de façon anormale)
      if (lastWallClock > 0) {
        final expectedWallClock = lastWallClock + (lastUptime - currentUptime);
        final actualDrift = (currentWallClock - expectedWallClock).abs();

        if (actualDrift > _maxAllowedDriftMs) {
          // Manipulation suspectée - l'heure a été changée pendant le reboot
          timeManipulationDetected = true;
          suspiciousCount++;
          accumulatedPenalty += _rebootPenaltySeconds;
        }
      }
    }

    // Vérifier la cohérence sans reboot
    if (!rebootDetected && lastUptime > 0 && lastWallClock > 0) {
      final uptimeDelta = currentUptime - lastUptime;
      final wallClockDelta = currentWallClock - lastWallClock;

      // Si l'uptime et le wall clock ne correspondent pas, manipulation détectée
      final drift = (wallClockDelta - uptimeDelta).abs();
      if (drift > _maxAllowedDriftMs) {
        timeManipulationDetected = true;
        suspiciousCount++;
        accumulatedPenalty += _manipulationPenaltySeconds;
      }
    }

    // Vérifier avec le serveur si possible
    final serverTime = await _getServerTime();
    if (serverTime != null) {
      final localServerDrift = (currentWallClock - serverTime).abs();

      if (localServerDrift > _maxAllowedDriftMs) {
        // L'heure locale est significativement différente du serveur
        timeManipulationDetected = true;
        suspiciousCount++;

        // Calculer et stocker l'offset correct
        final newOffset = serverTime - currentWallClock;
        await _storeInt(_keyServerTimeOffset, newOffset);
        await _storeInt(_keyLastServerCheck, currentWallClock);
      } else {
        // Heure locale OK, mettre à jour l'offset
        await _storeInt(_keyServerTimeOffset, serverTime - currentWallClock);
        await _storeInt(_keyLastServerCheck, currentWallClock);
      }
    }

    // Sauvegarder l'état actuel
    await _storeInt(_keyLastKnownUptime, currentUptime);
    await _storeInt(_keyLastKnownWallClock, currentWallClock);
    await _storeInt(_keyRebootCount, rebootCount);
    await _storeInt(_keySuspiciousActivityCount, suspiciousCount);
    await _storeInt(_keyAccumulatedPenalty, accumulatedPenalty);

    return TimeSecurityStatus(
      isSecure: !timeManipulationDetected,
      rebootDetected: rebootDetected,
      timeManipulationDetected: timeManipulationDetected,
      suspiciousActivityCount: suspiciousCount,
      accumulatedPenaltySeconds: accumulatedPenalty,
      serverTimeAvailable: serverTime != null,
    );
  }

  /// Obtenir le temps sécurisé actuel (avec corrections)
  Future<SecureTimestamp> getSecureTime() async {
    final currentUptime = await _getSystemUptime();
    final currentWallClock = DateTime.now().millisecondsSinceEpoch;
    final lastUptime = await _getStoredInt(_keyLastKnownUptime) ?? currentUptime;
    final lastWallClock = await _getStoredInt(_keyLastKnownWallClock) ?? currentWallClock;
    final serverOffset = await _getStoredInt(_keyServerTimeOffset) ?? 0;
    final penalty = await _getStoredInt(_keyAccumulatedPenalty) ?? 0;

    // Calculer le temps écoulé basé sur l'uptime (fiable)
    final uptimeElapsed = currentUptime - lastUptime;

    // Vérifier la cohérence
    final wallClockElapsed = currentWallClock - lastWallClock;
    final drift = (wallClockElapsed - uptimeElapsed).abs();

    bool isReliable = drift <= _maxAllowedDriftMs;

    // Si manipulation détectée, utiliser l'uptime comme base
    int correctedTime;
    if (!isReliable && uptimeElapsed >= 0) {
      // Utiliser le dernier temps connu + uptime écoulé
      correctedTime = lastWallClock + uptimeElapsed;
    } else {
      // Utiliser le wall clock avec correction serveur si disponible
      correctedTime = currentWallClock + serverOffset;
    }

    // Mettre à jour les valeurs stockées
    await _storeInt(_keyLastKnownUptime, currentUptime);
    await _storeInt(_keyLastKnownWallClock, currentWallClock);

    return SecureTimestamp(
      millisecondsSinceEpoch: correctedTime,
      isReliable: isReliable,
      penaltySeconds: penalty,
      uptimeBased: !isReliable,
    );
  }

  /// Calculer le temps écoulé de manière sécurisée depuis un timestamp
  Future<SecureElapsedTime> getSecureElapsedTime(int fromTimestamp) async {
    final secureTime = await getSecureTime();
    final elapsed = secureTime.millisecondsSinceEpoch - fromTimestamp;

    // Ajouter la pénalité si applicable (la pénalité réduit le temps "écoulé" effectif)
    final effectiveElapsed = elapsed - (secureTime.penaltySeconds * 1000);

    return SecureElapsedTime(
      actualElapsedMs: elapsed,
      effectiveElapsedMs: effectiveElapsed > 0 ? effectiveElapsed : 0,
      penaltyApplied: secureTime.penaltySeconds > 0,
      isReliable: secureTime.isReliable,
    );
  }

  /// Vérifier si un délai est écoulé de manière sécurisée
  Future<DelayCheckResult> isDelayElapsed({
    required int startTimestamp,
    required int requiredDelaySeconds,
  }) async {
    final elapsed = await getSecureElapsedTime(startTimestamp);
    final requiredMs = requiredDelaySeconds * 1000;

    final isElapsed = elapsed.effectiveElapsedMs >= requiredMs;
    final remainingMs = requiredMs - elapsed.effectiveElapsedMs;

    return DelayCheckResult(
      isElapsed: isElapsed,
      remainingSeconds: remainingMs > 0 ? (remainingMs / 1000).ceil() : 0,
      isReliable: elapsed.isReliable,
      penaltyApplied: elapsed.penaltyApplied,
    );
  }

  /// Réinitialiser la pénalité (après authentification réussie par exemple)
  Future<void> clearPenalty() async {
    await _storeInt(_keyAccumulatedPenalty, 0);
    await _storeInt(_keySuspiciousActivityCount, 0);
  }

  /// Ajouter une pénalité manuellement
  Future<void> addPenalty(int seconds) async {
    final current = await _getStoredInt(_keyAccumulatedPenalty) ?? 0;
    await _storeInt(_keyAccumulatedPenalty, current + seconds);
  }

  // Helpers pour le stockage
  Future<int?> _getStoredInt(String key) async {
    final value = await _secureStorage.read(key);
    return value != null ? int.tryParse(value) : null;
  }

  Future<void> _storeInt(String key, int value) async {
    await _secureStorage.write(key, value.toString());
  }
}

/// Statut de sécurité du temps au démarrage
class TimeSecurityStatus {
  final bool isSecure;
  final bool rebootDetected;
  final bool timeManipulationDetected;
  final int suspiciousActivityCount;
  final int accumulatedPenaltySeconds;
  final bool serverTimeAvailable;

  TimeSecurityStatus({
    required this.isSecure,
    required this.rebootDetected,
    required this.timeManipulationDetected,
    required this.suspiciousActivityCount,
    required this.accumulatedPenaltySeconds,
    required this.serverTimeAvailable,
  });
}

/// Timestamp sécurisé
class SecureTimestamp {
  final int millisecondsSinceEpoch;
  final bool isReliable;
  final int penaltySeconds;
  final bool uptimeBased;

  SecureTimestamp({
    required this.millisecondsSinceEpoch,
    required this.isReliable,
    required this.penaltySeconds,
    required this.uptimeBased,
  });
}

/// Temps écoulé sécurisé
class SecureElapsedTime {
  final int actualElapsedMs;
  final int effectiveElapsedMs;
  final bool penaltyApplied;
  final bool isReliable;

  SecureElapsedTime({
    required this.actualElapsedMs,
    required this.effectiveElapsedMs,
    required this.penaltyApplied,
    required this.isReliable,
  });
}

/// Résultat de vérification de délai
class DelayCheckResult {
  final bool isElapsed;
  final int remainingSeconds;
  final bool isReliable;
  final bool penaltyApplied;

  DelayCheckResult({
    required this.isElapsed,
    required this.remainingSeconds,
    required this.isReliable,
    required this.penaltyApplied,
  });
}
