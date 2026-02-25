import 'dart:async';
import 'secure_storage_service.dart';
import 'local_storage_service.dart';
import 'edge_function_service.dart';
import 'secure_time_service.dart';

/// Service de sécurité pour le rate limiting du PIN
///
/// Délais progressifs après échecs:
/// - Tentatives 1-3: Aucun délai (gratuites)
/// - Tentative 4: 5 minutes
/// - Tentative 5: 15 minutes
/// - Tentative 6: 30 minutes
/// - Tentative 7: 1 heure
/// - Tentative 8: 3 heures
/// - Tentative 9: 6 heures
/// - Tentative 10: 12 heures puis DESTRUCTION TOTALE
///
/// Protection anti-manipulation du temps:
/// - Utilise l'uptime système (impossible à manipuler)
/// - Vérification serveur quand internet disponible
/// - Pénalité au redémarrage si manipulation détectée
class PinSecurityService {
  final SecureStorageService _secureStorage;
  final LocalStorageService _localStorage;
  final EdgeFunctionService? _edgeFunctions;
  final SecureTimeService _secureTime;

  static const int maxAttempts = 10;
  static const int freeAttempts = 3;

  // Délais en secondes pour chaque tentative après les gratuites
  // Index 0 = tentative 4, Index 1 = tentative 5, etc.
  static const List<int> delaySeconds = [
    5 * 60,      // Tentative 4: 5 minutes
    15 * 60,     // Tentative 5: 15 minutes
    30 * 60,     // Tentative 6: 30 minutes
    60 * 60,     // Tentative 7: 1 heure
    3 * 60 * 60, // Tentative 8: 3 heures
    6 * 60 * 60, // Tentative 9: 6 heures
    12 * 60 * 60, // Tentative 10: 12 heures
  ];

  PinSecurityService({
    required SecureStorageService secureStorage,
    required LocalStorageService localStorage,
    EdgeFunctionService? edgeFunctions,
    SecureTimeService? secureTime,
  })  : _secureStorage = secureStorage,
        _localStorage = localStorage,
        _edgeFunctions = edgeFunctions,
        _secureTime = secureTime ?? SecureTimeService(secureStorage: secureStorage);

  /// Initialiser le service et vérifier l'état du temps
  /// À appeler au démarrage de l'app
  Future<TimeSecurityStatus> initialize() async {
    return await _secureTime.initialize();
  }

  /// Vérifier si l'utilisateur peut tenter un PIN
  /// Utilise le temps sécurisé pour empêcher la manipulation
  Future<PinSecurityStatus> checkCanAttempt() async {
    // Vérifier d'abord si le compte est verrouillé (mode non-destructif)
    final accountLocked = await _secureStorage.isAccountLocked();
    if (accountLocked) {
      return PinSecurityStatus(
        canAttempt: false,
        attemptCount: maxAttempts,
        maxAttempts: maxAttempts,
        accountLocked: true,
        remainingSeconds: 0,
      );
    }

    final attemptCount = await _secureStorage.getPinAttemptCount();

    // Si on a atteint le max, destruction imminente
    if (attemptCount >= maxAttempts) {
      return PinSecurityStatus(
        canAttempt: false,
        attemptCount: attemptCount,
        maxAttempts: maxAttempts,
        isDestruction: true,
        remainingSeconds: 0,
      );
    }

    // Tentatives gratuites
    if (attemptCount < freeAttempts) {
      return PinSecurityStatus(
        canAttempt: true,
        attemptCount: attemptCount,
        maxAttempts: maxAttempts,
        remainingFreeAttempts: freeAttempts - attemptCount,
      );
    }

    // Calculer le délai requis
    final delayIndex = attemptCount - freeAttempts;
    if (delayIndex >= delaySeconds.length) {
      return PinSecurityStatus(
        canAttempt: false,
        attemptCount: attemptCount,
        maxAttempts: maxAttempts,
        isDestruction: true,
        remainingSeconds: 0,
      );
    }

    final requiredDelay = delaySeconds[delayIndex];
    final lastAttemptInfo = await _secureStorage.getLastAttemptInfo();
    final lastAttemptTime = lastAttemptInfo['timestamp'] ?? 0;

    if (lastAttemptTime == 0) {
      return PinSecurityStatus(
        canAttempt: true,
        attemptCount: attemptCount,
        maxAttempts: maxAttempts,
      );
    }

    // Utiliser le service de temps sécurisé pour vérifier le délai
    final delayCheck = await _secureTime.isDelayElapsed(
      startTimestamp: lastAttemptTime,
      requiredDelaySeconds: requiredDelay,
    );

    if (!delayCheck.isElapsed) {
      return PinSecurityStatus(
        canAttempt: false,
        attemptCount: attemptCount,
        maxAttempts: maxAttempts,
        remainingSeconds: delayCheck.remainingSeconds,
        timeManipulationDetected: !delayCheck.isReliable,
        penaltyApplied: delayCheck.penaltyApplied,
      );
    }

    return PinSecurityStatus(
      canAttempt: true,
      attemptCount: attemptCount,
      maxAttempts: maxAttempts,
    );
  }

  /// Enregistrer un échec de PIN
  /// Si [destructionOnMaxAttempts] est true (défaut), déclenche la destruction totale + ghost mode.
  /// Si false, verrouille le compte avec options de récupération.
  Future<PinSecurityStatus> recordFailedAttempt({
    bool destructionOnMaxAttempts = true,
  }) async {
    await _secureStorage.incrementPinAttemptCount();
    final newCount = await _secureStorage.getPinAttemptCount();

    // Vérifier si on a atteint le maximum de tentatives
    if (newCount >= maxAttempts) {
      if (destructionOnMaxAttempts) {
        await _triggerTotalDestruction();
        return PinSecurityStatus(
          canAttempt: false,
          attemptCount: newCount,
          maxAttempts: maxAttempts,
          isDestruction: true,
          destructionTriggered: true,
        );
      } else {
        await _lockAccount();
        return PinSecurityStatus(
          canAttempt: false,
          attemptCount: newCount,
          maxAttempts: maxAttempts,
          accountLocked: true,
        );
      }
    }

    return await checkCanAttempt();
  }

  /// Enregistrer un succès de PIN
  Future<void> recordSuccessfulAttempt() async {
    await _secureStorage.resetPinAttemptCount();
    // Nettoyer les pénalités de temps après une auth réussie
    await _secureTime.clearPenalty();
  }

  /// Obtenir le délai formaté pour l'affichage
  String formatDelay(int seconds) {
    if (seconds < 60) {
      return '$seconds secondes';
    } else if (seconds < 3600) {
      final minutes = seconds ~/ 60;
      return '$minutes minute${minutes > 1 ? 's' : ''}';
    } else {
      final hours = seconds ~/ 3600;
      final minutes = (seconds % 3600) ~/ 60;
      if (minutes > 0) {
        return '${hours}h ${minutes}min';
      }
      return '$hours heure${hours > 1 ? 's' : ''}';
    }
  }

  /// Obtenir le délai pour la prochaine tentative échouée
  int? getNextAttemptDelay(int currentAttemptCount) {
    if (currentAttemptCount < freeAttempts - 1) {
      return null; // Encore des tentatives gratuites
    }
    final delayIndex = currentAttemptCount - freeAttempts + 1;
    if (delayIndex >= 0 && delayIndex < delaySeconds.length) {
      return delaySeconds[delayIndex];
    }
    return null;
  }

  /// Verrouiller le compte (mode non-destructif après 10 tentatives)
  Future<void> _lockAccount() async {
    await _secureStorage.setAccountLocked(true);
    await _secureStorage.resetPinAttemptCount();
  }

  /// Déclencher la destruction totale après 10 tentatives
  Future<void> _triggerTotalDestruction() async {
    // 1. Supprimer TOUTES les données locales (messages, contacts, sessions)
    await _localStorage.deleteAllData();

    // 2. Marquer la suppression serveur comme en attente
    await _secureStorage.setPendingServerCleanup(true);
    await _secureStorage.setPendingMessageDeletion(true);

    // 3. Activer le mode fantôme
    await _secureStorage.setGhostMode(true);

    // 4. Essayer la suppression serveur si possible
    try {
      if (_edgeFunctions != null) {
        await _edgeFunctions.cleanupUserData();
        await _secureStorage.setPendingServerCleanup(false);
        await _secureStorage.setPendingMessageDeletion(false);
      }
    } catch (_) {
      // Échec - sera retenté plus tard
    }

    // 5. Réinitialiser le compteur de tentatives
    await _secureStorage.resetPinAttemptCount();
  }

  /// Vérifier si la récupération par phrase est possible
  /// (proposée après 3 échecs)
  bool canOfferRecovery(int attemptCount) {
    return attemptCount >= freeAttempts && attemptCount < maxAttempts;
  }
}

/// Statut de sécurité du PIN
class PinSecurityStatus {
  final bool canAttempt;
  final int attemptCount;
  final int maxAttempts;
  final int remainingSeconds;
  final int remainingFreeAttempts;
  final bool isDestruction;
  final bool destructionTriggered;
  final bool timeManipulationDetected;
  final bool penaltyApplied;
  final bool accountLocked;

  PinSecurityStatus({
    required this.canAttempt,
    required this.attemptCount,
    required this.maxAttempts,
    this.remainingSeconds = 0,
    this.remainingFreeAttempts = 0,
    this.isDestruction = false,
    this.destructionTriggered = false,
    this.timeManipulationDetected = false,
    this.penaltyApplied = false,
    this.accountLocked = false,
  });

  bool get shouldOfferRecovery =>
      attemptCount >= PinSecurityService.freeAttempts &&
      attemptCount < maxAttempts;

  String get statusMessage {
    if (accountLocked) {
      return 'Compte verrouillé. Trop de tentatives échouées.';
    }
    if (isDestruction) {
      return 'Trop de tentatives. Données supprimées.';
    }
    if (timeManipulationDetected) {
      return 'Manipulation du temps détectée. Accès bloqué.';
    }
    if (penaltyApplied) {
      return 'Pénalité appliquée. Réessayez dans ${_formatTime(remainingSeconds)}';
    }
    if (!canAttempt && remainingSeconds > 0) {
      return 'Réessayez dans ${_formatTime(remainingSeconds)}';
    }
    if (remainingFreeAttempts > 0) {
      return '$remainingFreeAttempts tentative${remainingFreeAttempts > 1 ? 's' : ''} restante${remainingFreeAttempts > 1 ? 's' : ''}';
    }
    return 'Tentative ${attemptCount + 1} sur $maxAttempts';
  }

  String _formatTime(int seconds) {
    if (seconds < 60) {
      return '$seconds sec';
    } else if (seconds < 3600) {
      final minutes = seconds ~/ 60;
      final secs = seconds % 60;
      if (secs > 0) {
        return '${minutes}m ${secs}s';
      }
      return '$minutes min';
    } else {
      final hours = seconds ~/ 3600;
      final minutes = (seconds % 3600) ~/ 60;
      if (minutes > 0) {
        return '${hours}h ${minutes}m';
      }
      return '${hours}h';
    }
  }
}
