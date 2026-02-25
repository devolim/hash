import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/models/contact.dart';
import 'secure_storage_service.dart';
import 'local_storage_service.dart';
import 'edge_function_service.dart';
import 'secure_time_service.dart';

/// Service de récupération sécurisée par phrase
///
/// Quand la phrase de récupération est entrée correctement:
/// 1. SUPPRESSION IMMÉDIATE de tous les messages et historique d'appels (local)
/// 2. Suppression serveur mise en file d'attente (si hors ligne)
/// 3. Délai de sécurité obligatoire de 1 heure (anti-manipulation du temps)
/// 4. Contacts préservés
/// 5. Après 1h: création d'un nouveau PIN
class RecoverySecurityService {
  final SecureStorageService _secureStorage;
  final LocalStorageService _localStorage;
  final EdgeFunctionService? _edgeFunctions;
  final SecureTimeService _secureTime;

  static const int securityDelaySeconds = 60 * 60; // 1 heure

  RecoverySecurityService({
    required SecureStorageService secureStorage,
    required LocalStorageService localStorage,
    EdgeFunctionService? edgeFunctions,
    SecureTimeService? secureTime,
  })  : _secureStorage = secureStorage,
        _localStorage = localStorage,
        _edgeFunctions = edgeFunctions,
        _secureTime = secureTime ?? SecureTimeService(secureStorage: secureStorage);

  /// Vérifier si on est en période de récupération
  /// Utilise le temps sécurisé pour empêcher la manipulation
  Future<RecoveryStatus> checkRecoveryStatus() async {
    final pendingUntil = await _secureStorage.getRecoveryPendingUntil();

    if (pendingUntil == null) {
      return RecoveryStatus(
        isInRecovery: false,
        canSetNewPin: false,
      );
    }

    final startedAt = await _secureStorage.getRecoveryStartedAt();
    if (startedAt == null) {
      return RecoveryStatus(
        isInRecovery: false,
        canSetNewPin: false,
      );
    }

    // Utiliser le service de temps sécurisé pour vérifier le délai
    final delayCheck = await _secureTime.isDelayElapsed(
      startTimestamp: startedAt,
      requiredDelaySeconds: securityDelaySeconds,
    );

    if (delayCheck.isElapsed) {
      return RecoveryStatus(
        isInRecovery: true,
        canSetNewPin: true,
        remainingSeconds: 0,
      );
    }

    return RecoveryStatus(
      isInRecovery: true,
      canSetNewPin: false,
      remainingSeconds: delayCheck.remainingSeconds,
      timeManipulationDetected: !delayCheck.isReliable,
      penaltyApplied: delayCheck.penaltyApplied,
    );
  }

  /// Initier la récupération après vérification de la phrase
  /// Cette méthode est appelée IMMÉDIATEMENT après vérification de la phrase
  /// AVANT même de commencer le délai d'attente
  Future<RecoveryInitResult> initiateRecovery() async {
    // 1. SUPPRESSION IMMÉDIATE des messages et historique d'appels (local)
    // C'est la première chose à faire - AVANT de set le délai
    // Cela protège contre les attaques offline
    await _deleteLocalMessagesAndCalls();

    // 2. Marquer la suppression serveur comme en attente
    await _secureStorage.setPendingMessageDeletion(true);

    // 3. Essayer de supprimer côté serveur si on a internet
    bool serverDeletionSuccess = false;
    if (await _hasInternet()) {
      serverDeletionSuccess = await _deleteServerMessages();
    }

    // 4. Obtenir le temps sécurisé actuel pour le délai
    final secureTime = await _secureTime.getSecureTime();
    final startTimestamp = secureTime.millisecondsSinceEpoch;
    final pendingUntil = startTimestamp + (securityDelaySeconds * 1000);

    await _secureStorage.setRecoveryPendingUntil(pendingUntil);

    // 5. Déverrouiller le compte si verrouillé
    await _secureStorage.setAccountLocked(false);

    // 6. Réinitialiser le compteur de tentatives PIN
    await _secureStorage.resetPinAttemptCount();

    // 7. Nettoyer les pénalités de temps (nouveau départ après récupération)
    await _secureTime.clearPenalty();

    return RecoveryInitResult(
      success: true,
      messagesDeletedLocally: true,
      messagesDeletedServer: serverDeletionSuccess,
      securityDelaySeconds: securityDelaySeconds,
    );
  }

  /// Supprimer les messages et l'historique d'appels localement
  Future<void> _deleteLocalMessagesAndCalls() async {
    // Note: LocalStorageService ne stocke pas l'historique d'appels séparément
    // Les messages incluent potentiellement les enregistrements d'appels
    // On supprime tous les messages mais on garde les contacts

    // Cette opération doit être atomique et rapide
    // On ne veut pas qu'un attaquant puisse interrompre le processus
    try {
      // Supprimer tous les messages de tous les contacts
      await _clearAllMessages();
    } catch (e) {
      // En cas d'erreur, on réessaie de manière plus agressive
      await _forceClearMessages();
    }
  }

  /// Effacer tous les messages de manière sûre
  Future<void> _clearAllMessages() async {
    // Récupérer tous les contacts pour effacer leurs messages
    final contacts = await _localStorage.getAllContacts();
    for (final contact in contacts) {
      await _localStorage.deleteAllMessagesForContact(contact.odid);
      // Réinitialiser les métadonnées du contact
      contact.lastMessageAt = null;
      contact.lastMessagePreview = null;
      contact.unreadCount = 0;
      await _localStorage.saveContact(contact);
    }
  }

  /// Forcer la suppression des messages en cas d'échec
  Future<void> _forceClearMessages() async {
    // Méthode de secours: supprimer toutes les données puis restaurer les contacts
    final contacts = await _localStorage.getAllContacts();
    final contactsBackup = contacts.map((c) => _cloneContact(c)).toList();

    // Supprimer tout
    await _localStorage.deleteAllData();

    // Restaurer uniquement les contacts (sans les messages)
    for (final contact in contactsBackup) {
      await _localStorage.saveContact(contact);
    }
  }

  /// Clone un contact sans les données de message
  Contact _cloneContact(Contact original) {
    return Contact(
      odid: original.odid,
      hashId: original.hashId,
      displayName: original.displayName,
      avatarPath: original.avatarPath,
      notes: original.notes,
      addedAt: original.addedAt,
      identityPublicKey: original.identityPublicKey,
      sessionData: original.sessionData,
      mailboxToken: original.mailboxToken,
      relayToken: original.relayToken,
      verificationToken: original.verificationToken,
      sealedSenderPublicKey: original.sealedSenderPublicKey,
      notificationsEnabled: original.notificationsEnabled,
      callNotificationsEnabled: original.callNotificationsEnabled,
      mutedUntil: original.mutedUntil,
      notificationSound: original.notificationSound,
      chatBubbleColor: original.chatBubbleColor,
      chatBubbleGradient: original.chatBubbleGradient,
      chatBackgroundColor: original.chatBackgroundColor,
      chatBackgroundGradient: original.chatBackgroundGradient,
      chatBackgroundImagePath: original.chatBackgroundImagePath,
      ephemeralDuration: original.ephemeralDuration,
      sendReadReceipts: original.sendReadReceipts,
      sendToken: original.sendToken,
      isPinned: original.isPinned,
      isHidden: original.isHidden,
      lastMessageAt: null,
      lastMessagePreview: null,
      unreadCount: 0,
    );
  }

  /// Supprimer les messages côté serveur
  Future<bool> _deleteServerMessages() async {
    try {
      if (_edgeFunctions == null) return false;

      // Appeler l'edge function pour supprimer les messages serveur
      final response = await _edgeFunctions.cleanupUserData();

      if (response['success'] == true) {
        await _secureStorage.setPendingMessageDeletion(false);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  /// Vérifier la connectivité internet
  Future<bool> _hasInternet() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      }
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Vérifier et exécuter la suppression serveur en attente
  /// À appeler au démarrage de l'app
  Future<void> checkAndExecutePendingDeletion() async {
    final hasPending = await _secureStorage.hasPendingMessageDeletion();

    if (hasPending && await _hasInternet()) {
      await _deleteServerMessages();
    }
  }

  /// Finaliser la récupération (après le délai de 1h)
  Future<void> completeRecovery() async {
    await _secureStorage.clearRecoveryPending();
    await _secureStorage.resetPinAttemptCount();
  }

  /// Annuler la récupération (si l'utilisateur ferme l'app sans terminer)
  /// Note: Les messages sont DÉJÀ supprimés, on ne peut pas les récupérer
  /// Cette méthode ne fait que nettoyer l'état de récupération
  Future<void> cancelRecovery() async {
    // Ne PAS appeler cette méthode - la récupération ne peut pas être annulée
    // Les messages sont déjà supprimés de manière irréversible
    // Cette méthode existe seulement pour des cas exceptionnels d'admin
  }
}

/// Statut de récupération
class RecoveryStatus {
  final bool isInRecovery;
  final bool canSetNewPin;
  final int remainingSeconds;
  final bool timeManipulationDetected;
  final bool penaltyApplied;

  RecoveryStatus({
    required this.isInRecovery,
    required this.canSetNewPin,
    this.remainingSeconds = 0,
    this.timeManipulationDetected = false,
    this.penaltyApplied = false,
  });

  String get statusMessage {
    if (timeManipulationDetected) {
      return 'Manipulation du temps détectée. Veuillez patienter.';
    }
    if (penaltyApplied) {
      return 'Pénalité appliquée. Délai de sécurité: ${_formatTime(remainingSeconds)}';
    }
    if (canSetNewPin) {
      return 'Vous pouvez maintenant créer un nouveau PIN.';
    }
    if (remainingSeconds > 0) {
      return 'Délai de sécurité: ${_formatTime(remainingSeconds)}';
    }
    return '';
  }

  String _formatTime(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m ${secs}s';
    } else if (minutes > 0) {
      return '${minutes}m ${secs}s';
    } else {
      return '${secs}s';
    }
  }
}

/// Résultat de l'initialisation de la récupération
class RecoveryInitResult {
  final bool success;
  final bool messagesDeletedLocally;
  final bool messagesDeletedServer;
  final int securityDelaySeconds;

  RecoveryInitResult({
    required this.success,
    required this.messagesDeletedLocally,
    required this.messagesDeletedServer,
    required this.securityDelaySeconds,
  });
}
