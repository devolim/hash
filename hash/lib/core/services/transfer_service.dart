import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'secure_storage_service.dart';
import 'local_storage_service.dart';
import 'crypto_service.dart';
import 'edge_function_service.dart';
import '../../domain/models/contact.dart';
import '../../domain/models/note.dart';
import '../../domain/models/app_settings.dart';

/// Service de transfert de compte entre appareils
///
/// Flux:
/// 1. ANCIEN: Affiche Hash ID + code temporaire
/// 2. NOUVEAU: Entre Hash ID + code temporaire
/// 3. ANCIEN: Entre PIN → Génère QR/code de transfert
/// 4. NOUVEAU: Scanne QR ou entre code
/// 5. Vérification proximité (Bluetooth + Audio + Manuel)
/// 6. ANCIEN: Confirme le transfert (tap physique)
/// 7. Transfert des données chiffrées
/// 8. ANCIEN: Session invalidée, données supprimées
/// 9. NOUVEAU: Configure nouveau PIN
class TransferService {
  final SecureStorageService _secureStorage;
  final LocalStorageService _localStorage;
  final CryptoService _crypto;
  final EdgeFunctionService? _edgeFunctions;

  // Callbacks pour les événements
  void Function(TransferState)? onStateChanged;
  void Function(String)? onError;

  // État actuel
  TransferState _state = TransferState.idle;
  TransferState get state => _state;

  // Données de transfert
  String? _transferCode;
  String? _proximityCode;
  String? pendingNewDeviceInfo;

  TransferService({
    required SecureStorageService secureStorage,
    required LocalStorageService localStorage,
    CryptoService? crypto,
    EdgeFunctionService? edgeFunctions,
  })  : _secureStorage = secureStorage,
        _localStorage = localStorage,
        _crypto = crypto ?? CryptoService(),
        _edgeFunctions = edgeFunctions;

  // ============ ANCIEN APPAREIL - Initier le transfert ============

  /// Étape 1: Générer le code temporaire (avant PIN)
  /// Utilise le code en cache si valide (> 1 minute restante), sinon génère un nouveau
  Future<TransferInitData> initializeTransfer() async {
    final hashId = await _secureStorage.getUserHashId();
    if (hashId == null) {
      throw TransferException('Hash ID non trouvé');
    }

    // Vérifier si un code existe et calculer le temps restant
    final existingCode = await _secureStorage.getTransferTempCode();
    final existingExpiry = await _secureStorage.getTransferTempCodeExpiry();

    String tempCode;
    int expiry;

    if (existingCode != null && existingExpiry != null) {
      final remainingMs = existingExpiry - DateTime.now().millisecondsSinceEpoch;
      final remainingSeconds = remainingMs ~/ 1000;

      // Si le code a plus de 60 secondes restantes, on le réutilise
      if (remainingSeconds > 60) {
        tempCode = existingCode;
        expiry = existingExpiry;
      } else {
        // Sinon, générer un nouveau code
        tempCode = await _secureStorage.generateTransferTempCode();
        expiry = await _secureStorage.getTransferTempCodeExpiry() ?? 0;
      }
    } else {
      // Pas de code existant, en générer un nouveau
      tempCode = await _secureStorage.generateTransferTempCode();
      expiry = await _secureStorage.getTransferTempCodeExpiry() ?? 0;
    }

    _updateState(TransferState.waitingForTempCodeEntry);

    return TransferInitData(
      hashId: hashId,
      tempCode: tempCode,
      expiresAt: DateTime.fromMillisecondsSinceEpoch(expiry),
    );
  }

  /// Étape 2: Après vérification PIN, générer le code de transfert
  Future<TransferCodeData> generateTransferCode() async {
    final hashId = await _secureStorage.getUserHashId();
    if (hashId == null) {
      throw TransferException('Hash ID non trouvé');
    }

    // Générer le code de transfert (TRF-XXXX-XXXX-XXXX)
    _transferCode = await _secureStorage.generateTransferCode();
    final expiry = await _secureStorage.getTransferCodeExpiry();

    // Générer le code de proximité (emojis)
    _proximityCode = await _secureStorage.generateProximityCode();

    // Marquer le transfert en cours
    await _secureStorage.setTransferInProgress(true);

    _updateState(TransferState.waitingForNewDevice);

    // Créer les données pour le QR code
    final qrData = _createQrData(hashId, _transferCode!);

    return TransferCodeData(
      transferCode: _transferCode!,
      qrData: qrData,
      proximityCode: _proximityCode!,
      expiresAt: DateTime.fromMillisecondsSinceEpoch(expiry ?? 0),
    );
  }

  /// Créer les données du QR code (JSON encodé)
  String _createQrData(String hashId, String transferCode) {
    final data = {
      'type': 'hash_transfer',
      'version': 1,
      'hashId': hashId,
      'code': transferCode,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    return base64Encode(utf8.encode(jsonEncode(data)));
  }

  /// Parser les données du QR code
  static TransferQrData? parseQrData(String qrData) {
    try {
      final decoded = utf8.decode(base64Decode(qrData));
      final json = jsonDecode(decoded) as Map<String, dynamic>;

      if (json['type'] != 'hash_transfer') return null;

      final hashId = json['hashId'] as String?;
      final code = json['code'] as String?;
      final timestamp = json['timestamp'] as int?;

      // Validate required fields
      if (hashId == null || hashId.isEmpty) return null;
      if (code == null || code.isEmpty) return null;
      if (timestamp == null) return null;

      // Validate Hash ID format (XXX-XXX-XXX)
      final hashIdRegex = RegExp(r'^[A-Z0-9]{3}-[A-Z0-9]{3}-[A-Z0-9]{3}$');
      if (!hashIdRegex.hasMatch(hashId)) return null;

      // Validate timestamp freshness (max 5 minutes)
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;
      if (age > 5 * 60 * 1000 || age < -60000) return null; // 5min max, 1min clock skew

      return TransferQrData(
        hashId: hashId,
        transferCode: code,
        timestamp: timestamp,
      );
    } catch (e) {
      return null;
    }
  }

  /// Étape 3: Nouveau device connecté, attente confirmation
  Future<void> onNewDeviceConnected(String deviceInfo) async {
    pendingNewDeviceInfo = deviceInfo;
    _updateState(TransferState.waitingForConfirmation);
  }

  /// Étape 4: Confirmer le transfert (tap physique sur ancien)
  Future<TransferResult> confirmTransfer() async {
    if (_state != TransferState.waitingForConfirmation) {
      throw TransferException('État invalide pour confirmation');
    }

    _updateState(TransferState.transferring);

    try {
      // Récupérer toutes les données à transférer
      final transferableData = await _secureStorage.getTransferableData();
      final contacts = await _localStorage.getAllContacts();
      final notes = await _localStorage.getAllNotes();
      final settings = await _localStorage.getSettings();

      // Préparer le package de transfert
      final transferPackage = TransferPackage(
        identityData: transferableData,
        contacts: contacts.map((c) => c.toJson()).toList(),
        notes: notes.map((n) => n.toJson()).toList(),
        settings: settings.toJson(),
      );

      // Chiffrer le package avec le code de transfert comme clé
      final encryptedPackage = await _crypto.encryptForTransfer(
        jsonEncode(transferPackage.toJson()),
        _transferCode!,
      );

      // Notifier le serveur du transfert
      if (_edgeFunctions != null) {
        await _edgeFunctions.initiateDeviceTransfer(
          transferCode: _transferCode!,
          proximityCode: _proximityCode!,
          encryptedPackage: encryptedPackage,
        );
      }

      _updateState(TransferState.completed);

      return TransferResult(
        success: true,
        encryptedPackage: encryptedPackage,
      );
    } catch (e) {
      _updateState(TransferState.failed);
      throw TransferException('Erreur lors du transfert: $e');
    }
  }

  /// Finaliser côté ancien appareil (après transfert réussi)
  Future<void> finalizeOldDevice() async {
    // Invalider la session côté serveur
    if (_edgeFunctions != null) {
      try {
        await _edgeFunctions.invalidateDevice();
      } catch (e) {
        debugPrint('Erreur invalidation serveur: $e');
      }
    }

    // Supprimer toutes les données locales
    await _localStorage.deleteAllData();
    await _secureStorage.clearAllTransferData();

    // Ne pas supprimer les tokens - ils seront invalides côté serveur
    // L'app redirigera vers l'écran d'inscription
  }

  // ============ NOUVEAU APPAREIL - Recevoir le transfert ============

  /// Valider le Hash ID et code temporaire (côté serveur)
  Future<bool> validateTempCode({
    required String hashId,
    required String tempCode,
  }) async {
    if (_edgeFunctions == null) {
      throw TransferException('Service non disponible');
    }

    try {
      final result = await _edgeFunctions.validateTransferTempCode(
        hashId: hashId,
        tempCode: tempCode,
      );
      return result['valid'] == true;
    } catch (e) {
      return false;
    }
  }

  /// Valider le code de transfert et recevoir les données
  Future<TransferPackage?> receiveTransfer({
    required String hashId,
    required String transferCode,
  }) async {
    if (_edgeFunctions == null) {
      throw TransferException('Service non disponible');
    }

    try {
      // Récupérer le package chiffré depuis le serveur
      final response = await _edgeFunctions.getTransferPackage(
        hashId: hashId,
        transferCode: transferCode,
      );

      if (response['encrypted_package'] == null) {
        return null;
      }

      // Capture transfer_id and proximity_code from server response
      final transferId = response['transfer_id'] as String?;
      final proximityCode = response['proximity_code'] as String?;

      // Déchiffrer le package
      final decrypted = await _crypto.decryptFromTransfer(
        response['encrypted_package'] as String,
        transferCode,
      );

      if (decrypted == null) {
        throw TransferException('Impossible de déchiffrer les données');
      }

      final json = jsonDecode(decrypted) as Map<String, dynamic>;
      final package = TransferPackage.fromJson(json);
      package.proximityCode = proximityCode;
      package.transferId = transferId;
      return package;
    } catch (e) {
      throw TransferException('Erreur réception: $e');
    }
  }

  /// Importer les données transférées sur le nouveau device
  Future<void> importTransferredData(TransferPackage package) async {
    // Importer les données d'identité
    final identityData = package.identityData.map(
      (key, value) => MapEntry(key, value as String?),
    );
    await _secureStorage.importTransferredData(identityData);

    // Importer les contacts (garder tous les champs, reset seulement les métadonnées de message)
    for (final contactJson in package.contacts) {
      final contact = Contact.fromJson(contactJson as Map<String, dynamic>);
      // Reset seulement les métadonnées de message (pas de messages transférés)
      // Garder : mailboxToken, relayToken, verificationToken, sealedSenderPublicKey,
      //          sessionData, sendToken, identityPublicKey, etc.
      final cleanContact = contact.copyWith(
        lastMessageAt: null,
        lastMessagePreview: null,
        unreadCount: 0,
      );
      await _localStorage.saveContact(cleanContact);
    }

    // Importer les notes
    for (final noteJson in package.notes) {
      final note = Note.fromJson(noteJson as Map<String, dynamic>);
      await _localStorage.saveNote(note);
    }

    // Importer les settings
    if (package.settings != null) {
      final settings = AppSettings.fromJson(package.settings!);
      await _localStorage.saveSettings(settings);
    }
  }

  /// Compléter le transfert côté serveur (appelé après la création du PIN)
  Future<Map<String, dynamic>> completeTransferOnServer({
    required String transferId,
    required String hashId,
    required String newDeviceId,
    required String identityPublicKey,
    required String signedPrekeyPublic,
    required String signedPrekeySignature,
    required int signedPrekeyId,
    required List<Map<String, dynamic>> prekeys,
  }) async {
    if (_edgeFunctions == null) {
      throw TransferException('Service non disponible');
    }

    return _edgeFunctions.confirmTransferComplete(
      transferId: transferId,
      hashId: hashId,
      newDeviceId: newDeviceId,
      identityPublicKey: identityPublicKey,
      signedPrekeyPublic: signedPrekeyPublic,
      signedPrekeySignature: signedPrekeySignature,
      signedPrekeyId: signedPrekeyId,
      prekeys: prekeys,
    );
  }

  // ============ État et nettoyage ============

  void _updateState(TransferState newState) {
    _state = newState;
    onStateChanged?.call(newState);
  }

  /// Annuler le transfert en cours
  Future<void> cancelTransfer() async {
    await _secureStorage.clearAllTransferData();
    _transferCode = null;
    _proximityCode = null;
    pendingNewDeviceInfo = null;
    _updateState(TransferState.idle);
  }

  /// Vérifier si un transfert est en cours
  Future<bool> hasActiveTransfer() async {
    return await _secureStorage.isTransferInProgress();
  }

  /// Obtenir le code de proximité actuel
  String? get proximityCode => _proximityCode;
}

// ============ États du transfert ============

enum TransferState {
  idle,
  waitingForTempCodeEntry,
  waitingForNewDevice,
  proximityVerification,
  waitingForConfirmation,
  transferring,
  completed,
  failed,
}

// ============ Modèles de données ============

class TransferInitData {
  final String hashId;
  final String tempCode;
  final DateTime expiresAt;

  TransferInitData({
    required this.hashId,
    required this.tempCode,
    required this.expiresAt,
  });

  int get remainingSeconds {
    final diff = expiresAt.difference(DateTime.now()).inSeconds;
    return diff > 0 ? diff : 0;
  }
}

class TransferCodeData {
  final String transferCode;
  final String qrData;
  final String proximityCode;
  final DateTime expiresAt;

  TransferCodeData({
    required this.transferCode,
    required this.qrData,
    required this.proximityCode,
    required this.expiresAt,
  });

  int get remainingSeconds {
    final diff = expiresAt.difference(DateTime.now()).inSeconds;
    return diff > 0 ? diff : 0;
  }
}

class TransferQrData {
  final String hashId;
  final String transferCode;
  final int timestamp;

  TransferQrData({
    required this.hashId,
    required this.transferCode,
    required this.timestamp,
  });
}

class TransferPackage {
  final Map<String, dynamic> identityData;
  final List<dynamic> contacts;
  final List<dynamic> notes;
  final Map<String, dynamic>? settings;
  String? proximityCode;
  String? transferId;

  TransferPackage({
    required this.identityData,
    required this.contacts,
    this.notes = const [],
    this.settings,
    this.proximityCode,
    this.transferId,
  });

  Map<String, dynamic> toJson() => {
    'identityData': identityData,
    'contacts': contacts,
    'notes': notes,
    if (settings != null) 'settings': settings,
  };

  factory TransferPackage.fromJson(Map<String, dynamic> json) {
    return TransferPackage(
      identityData: json['identityData'] as Map<String, dynamic>,
      contacts: json['contacts'] as List<dynamic>,
      notes: json['notes'] as List<dynamic>? ?? [],
      settings: json['settings'] as Map<String, dynamic>?,
    );
  }
}

class TransferResult {
  final bool success;
  final String? encryptedPackage;
  final String? error;

  TransferResult({
    required this.success,
    this.encryptedPackage,
    this.error,
  });
}

class TransferException implements Exception {
  final String message;
  TransferException(this.message);

  @override
  String toString() => message;
}
