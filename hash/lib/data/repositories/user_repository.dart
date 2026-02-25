import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/services/edge_function_service.dart';
import '../../core/services/secure_storage_service.dart';
import '../../core/services/sealed_sender_service.dart';
import '../../domain/models/user.dart' as app;

/// Repository for user-related operations with Supabase
class UserRepository {
  final SupabaseClient _client;
  final SecureStorageService _secureStorage;
  final EdgeFunctionService _edgeFunctions;
  final SealedSenderService _sealedSender = SealedSenderService();

  UserRepository({
    required SupabaseClient client,
    required SecureStorageService secureStorage,
  })  : _client = client,
        _secureStorage = secureStorage,
        _edgeFunctions = EdgeFunctionService(client);

  /// Get unique device identifier
  Future<String> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      return '${info.id}-${info.fingerprint}';
    } else if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      return info.identifierForVendor ?? 'unknown-ios';
    }

    return 'unknown-device';
  }

  /// Register a new user via Edge Function (sécurisé avec rate limiting)
  Future<app.User> registerUser({
    required String identityPublicKey,
    required String identityPrivateKey, // Needed for mailbox token derivation
    required int registrationId,
    required String signedPrekeyPublic,
    required String signedPrekeySignature,
    required int signedPrekeyId,
    required List<Map<String, dynamic>> prekeys,
  }) async {
    final deviceId = await _getDeviceId();

    // Clear any stale session first (e.g. after account deletion)
    // This stops the SDK's auto-refresh timer and prevents race conditions
    try {
      await _client.auth.signOut();
    } catch (e) {
      debugPrint('[UserRepository] Clearing stale session failed: $e');
    }

    // Sign in anonymously to get auth context
    final authResponse = await _client.auth.signInAnonymously();
    if (authResponse.user == null) {
      throw Exception('Failed to create anonymous session');
    }

    // Save refresh token to Keychain for reinstall cleanup
    if (authResponse.session?.refreshToken != null) {
      await _secureStorage.saveRefreshToken(authResponse.session!.refreshToken!);
    }

    try {
      // === Generate Zero-Knowledge tokens for sealed sender ===

      // Derive mailbox token from identity key
      final mailboxToken = await _sealedSender.deriveMailboxToken(
        identityPrivateKey: identityPrivateKey,
        rotationCounter: 0,
      );

      // Derive relay token from identity key
      final relayToken = await _sealedSender.deriveRelayToken(
        identityPrivateKey: identityPrivateKey,
        rotationCounter: 0,
      );

      // Generate sealed sender key pair
      final sealedKeyPair = await _sealedSender.generateSealedSenderKeyPair();

      // Store sealed sender private key locally (never sent to server)
      await _secureStorage.write('sealed_sender_private_key', sealedKeyPair.privateKey);
      await _secureStorage.saveIdentityKeys(
        privateKey: identityPrivateKey,
        publicKey: identityPublicKey,
        registrationId: registrationId,
      );
      await _secureStorage.write('mailbox_rotation_counter', '0');

      // Call the Edge Function with Zero-Knowledge tokens
      final response = await _edgeFunctions.call('register-user', body: {
        'device_id': deviceId,
        'identity_public_key': identityPublicKey,
        'signed_prekey_public': signedPrekeyPublic,
        'signed_prekey_signature': signedPrekeySignature,
        'signed_prekey_id': signedPrekeyId,
        'prekeys': prekeys,
        // Zero-Knowledge tokens
        'mailbox_token': mailboxToken,
        'relay_token': relayToken,
        'sealed_sender_public_key': sealedKeyPair.publicKey,
      });

      final user = app.User(
        id: response['user_id'] as String,
        hashId: response['hash_id'] as String,
        deviceId: deviceId,
        createdAt: DateTime.now(),
      );

      // Save user data securely
      await _secureStorage.saveUserData(
        userId: user.id,
        hashId: user.hashId,
        deviceId: deviceId,
      );

      return user;
    } catch (e) {
      // If registration fails, sign out the anonymous user
      await _client.auth.signOut();
      rethrow;
    }
  }

  /// Generate temporary code for contact exchange
  /// Utilise le code en cache si valide (> 1 minute restante), sinon génère un nouveau
  Future<String> generateTemporaryCode() async {
    // Vérifier si un code existe et calculer le temps restant
    final existingCode = await _secureStorage.getContactAddCode();
    final existingExpiry = await _secureStorage.getContactAddCodeExpiry();

    if (existingCode != null && existingExpiry != null) {
      final remainingMs = existingExpiry - DateTime.now().millisecondsSinceEpoch;
      final remainingSeconds = remainingMs ~/ 1000;

      // Si le code a plus de 60 secondes restantes, on le réutilise
      if (remainingSeconds > 60) {
        return existingCode;
      }
    }

    // Sinon, générer un nouveau code via le serveur
    final response = await _edgeFunctions.generateCode();
    final code = response['code'] as String;

    // Stocker le nouveau code avec son expiration (5 minutes)
    await _secureStorage.saveContactAddCode(code, expiryMinutes: 5);

    return code;
  }

  /// Add contact by Hash ID and temporary code via Edge Function (ajout direct)
  Future<Map<String, dynamic>> addContact({
    required String targetHashId,
    required String temporaryCode,
  }) async {
    final response = await _edgeFunctions.addContact(
      targetHashId: targetHashId,
      temporaryCode: temporaryCode,
    );

    if (response['contact'] == null) {
      throw Exception('Failed to add contact');
    }

    return response['contact'] as Map<String, dynamic>;
  }

  /// Valider le code temporaire et récupérer la clé publique du destinataire
  Future<Map<String, dynamic>> validateContactCode({
    required String targetHashId,
    required String temporaryCode,
  }) async {
    final response = await _edgeFunctions.validateContactCode(
      targetHashId: targetHashId,
      temporaryCode: temporaryCode,
    );
    return response;
  }

  /// Envoyer une demande de contact (avec message chiffré optionnel)
  Future<Map<String, dynamic>> sendContactRequest({
    required String targetHashId,
    required String exchangeToken,
    String? encryptedMessage,
  }) async {
    final response = await _edgeFunctions.sendContactRequest(
      targetHashId: targetHashId,
      exchangeToken: exchangeToken,
      encryptedMessage: encryptedMessage,
    );
    return response;
  }

  /// Récupérer les demandes envoyées
  Future<List<Map<String, dynamic>>> getSentRequests() async {
    final response = await _edgeFunctions.getSentRequests();
    final requests = response['requests'] as List<dynamic>?;
    return requests?.map((e) => e as Map<String, dynamic>).toList() ?? [];
  }

  /// Annuler une demande envoyée
  Future<void> cancelContactRequest(String requestId) async {
    await _edgeFunctions.cancelContactRequest(requestId: requestId);
  }

  /// Récupérer les demandes reçues
  Future<List<Map<String, dynamic>>> getPendingRequests() async {
    final response = await _edgeFunctions.getPendingRequests();
    final requests = response['requests'] as List<dynamic>?;
    return requests?.map((e) => e as Map<String, dynamic>).toList() ?? [];
  }

  /// Accepter une demande de contact
  Future<Map<String, dynamic>> acceptContactRequest(String requestId) async {
    final response = await _edgeFunctions.acceptContactRequest(
      requestId: requestId,
    );
    return response;
  }

  /// Rejeter une demande de contact
  Future<void> rejectContactRequest(String requestId) async {
    await _edgeFunctions.rejectContactRequest(requestId: requestId);
  }

  /// Replenish prekeys when running low
  Future<int> replenishPrekeys(List<Map<String, dynamic>> prekeys) async {
    return await _edgeFunctions.replenishPrekeys(prekeys);
  }

  /// Get current prekey count
  Future<int> getPrekeyCount() async {
    return await _edgeFunctions.getPrekeyCount();
  }

  /// Delete account via Edge Function (sécurisé avec rate limiting)
  Future<void> deleteAccount() async {
    await _edgeFunctions.deleteAccount();
  }

  /// Sign out from Supabase
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Get saved user data
  Future<app.User?> getSavedUser() async {
    final userId = await _secureStorage.getUserId();
    final hashId = await _secureStorage.getUserHashId();
    final deviceId = await _secureStorage.getDeviceId();

    if (userId == null || hashId == null || deviceId == null) {
      return null;
    }

    return app.User(
      id: userId,
      hashId: hashId,
      deviceId: deviceId,
      createdAt: DateTime.now(), // We don't store creation date locally
    );
  }

  /// Check if user is registered
  Future<bool> isRegistered() async {
    final userId = await _secureStorage.getUserId();
    return userId != null;
  }
}
