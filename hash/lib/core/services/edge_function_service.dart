import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../config/supabase_config.dart';
import '../network/pinned_http_client.dart';

/// Exception pour les erreurs Edge Function
class EdgeFunctionException implements Exception {
  final String message;
  final int statusCode;
  final String? errorCode;

  EdgeFunctionException(this.message, this.statusCode, {this.errorCode});

  @override
  String toString() => 'EdgeFunctionException: $message (status: $statusCode, code: $errorCode)';

  /// Vérifie si l'erreur est due à un transfert de compte
  bool get isSessionTransferred =>
      statusCode == 401 &&
      (message.contains('transfert') ||
          message.contains('transfer') ||
          message == 'SESSION_INVALIDATED');
}

/// Exception spécifique pour une session invalidée suite à un transfert
class SessionTransferredException implements Exception {
  final String message;

  SessionTransferredException([this.message = 'Compte transféré vers un autre appareil']);

  @override
  String toString() => message;
}

/// Service pour appeler les Edge Functions sécurisées
class EdgeFunctionService {
  final SupabaseClient _client;
  final http.Client _httpClient;

  EdgeFunctionService(this._client)
      : _httpClient = PinnedHttpClient().client;

  /// Headers communs pour les appels Edge Function
  Map<String, String> _getHeaders() {
    final session = _client.auth.currentSession;
    return {
      'Content-Type': 'application/json',
      'apikey': SupabaseConfig.anonKey,
      if (session != null) 'Authorization': 'Bearer ${session.accessToken}',
    };
  }

  /// URL de base pour les Edge Functions
  String get _baseUrl => '${SupabaseConfig.url}/functions/v1';

  /// Appeler une Edge Function avec authentification
  Future<Map<String, dynamic>> call(
    String functionName, {
    Map<String, dynamic>? body,
  }) async {
    final session = _client.auth.currentSession;
    if (kDebugMode) {
      // ignore: avoid_print
      print('=== EdgeFunction call: $functionName ===');
      // ignore: avoid_print
      print('Session exists: ${session != null}');
      // ignore: avoid_print
      print('User ID: ${session?.user.id}');
    }

    final response = await _httpClient.post(
      Uri.parse('$_baseUrl/$functionName'),
      headers: _getHeaders(),
      body: body != null ? jsonEncode(body) : null,
    ).timeout(
      const Duration(seconds: 30),
      onTimeout: () => throw TimeoutException('Edge Function timeout after 30s'),
    );

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode >= 400) {
      final errorMessage = data['error'] as String? ?? 'Erreur inconnue';
      final errorCode = data['error_code'] as String?;

      // Détecter les erreurs de session invalidée suite à un transfert
      if (response.statusCode == 401 && _isTransferError(errorMessage)) {
        throw SessionTransferredException(errorMessage);
      }

      throw EdgeFunctionException(errorMessage, response.statusCode, errorCode: errorCode);
    }

    return data;
  }

  /// Appeler une Edge Function SANS authentification (pour sealed sender)
  ///
  /// Utilisé pour les envois anonymes où le serveur ne doit pas
  /// connaître l'identité de l'expéditeur.
  Future<Map<String, dynamic>> callAnonymous(
    String functionName, {
    Map<String, dynamic>? body,
  }) async {
    if (kDebugMode) {
      // ignore: avoid_print
      print('=== EdgeFunction callAnonymous: $functionName ===');
    }

    // Headers sans token d'authentification
    final headers = {
      'Content-Type': 'application/json',
      'apikey': SupabaseConfig.anonKey,
    };

    final response = await _httpClient.post(
      Uri.parse('$_baseUrl/$functionName'),
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    ).timeout(
      const Duration(seconds: 30),
      onTimeout: () => throw TimeoutException('Edge Function timeout after 30s'),
    );

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode >= 400) {
      final errorMessage = data['error'] as String? ?? 'Erreur inconnue';
      final errorCode = data['error_code'] as String?;
      throw EdgeFunctionException(errorMessage, response.statusCode, errorCode: errorCode);
    }

    return data;
  }

  /// Vérifie si le message d'erreur indique un transfert de compte
  bool _isTransferError(String message) {
    final lowerMessage = message.toLowerCase();
    return lowerMessage.contains('transfert') ||
        lowerMessage.contains('transfer') ||
        message == 'SESSION_INVALIDATED' ||
        lowerMessage.contains('session invalidée');
  }

  // ============================================================
  // FONCTIONS SPÉCIFIQUES
  // ============================================================

  /// Inscription d'un nouvel utilisateur
  Future<Map<String, dynamic>> registerUser({
    required String deviceId,
    required String identityPublicKey,
    required String signedPrekeyPublic,
    required String signedPrekeySignature,
    required int signedPrekeyId,
    required List<Map<String, dynamic>> prekeys,
  }) async {
    return call('register-user', body: {
      'device_id': deviceId,
      'identity_public_key': identityPublicKey,
      'signed_prekey_public': signedPrekeyPublic,
      'signed_prekey_signature': signedPrekeySignature,
      'signed_prekey_id': signedPrekeyId,
      'prekeys': prekeys,
    });
  }

  /// Récupérer le nombre de prekeys restantes
  Future<int> getPrekeyCount() async {
    final data = await call('get-prekey-count');
    return data['count'] as int;
  }

  /// Réapprovisionner les prekeys
  Future<int> replenishPrekeys(List<Map<String, dynamic>> prekeys) async {
    final data = await call('replenish-prekeys', body: {
      'prekeys': prekeys,
    });
    return data['count'] as int;
  }

  /// Supprimer le compte
  Future<Map<String, dynamic>> deleteAccount() async {
    return call('delete-account');
  }

  /// Envoyer un message
  Future<Map<String, dynamic>> sendMessage({
    required String recipientId,
    required String encryptedContent,
    String? encryptedMediaUrl,
    bool mediaDownloadable = false,
  }) async {
    return call('send-message', body: {
      'recipient_id': recipientId,
      'encrypted_content': encryptedContent,
      'encrypted_media_url': encryptedMediaUrl,
      'media_downloadable': mediaDownloadable,
    });
  }

  /// Ajouter un contact
  Future<Map<String, dynamic>> addContact({
    required String targetHashId,
    required String temporaryCode,
  }) async {
    return call('add-contact', body: {
      'target_hash_id': targetHashId,
      'temporary_code': temporaryCode,
    });
  }

  /// Générer un code temporaire pour l'échange de contacts
  Future<Map<String, dynamic>> generateCode() async {
    return call('generate-code');
  }

  /// Démarrer un appel
  Future<Map<String, dynamic>> startCall({
    required String calleeId,
    required String callType,
  }) async {
    return call('start-call', body: {
      'callee_id': calleeId,
      'call_type': callType,
    });
  }

  /// Nettoyer les données utilisateur (mode fantôme)
  Future<Map<String, dynamic>> cleanupUserData() async {
    return call('cleanup-user-data');
  }

  /// Résumé des données stockées côté serveur pour l'utilisateur
  Future<Map<String, dynamic>> getServerSummary() async {
    return call('get-server-summary');
  }

  // ============================================================
  // TRANSFERT DE COMPTE
  // ============================================================

  /// Valider le code temporaire de transfert
  Future<Map<String, dynamic>> validateTransferTempCode({
    required String hashId,
    required String tempCode,
  }) async {
    return call('validate-transfer-temp-code', body: {
      'hash_id': hashId,
      'temp_code': tempCode,
    });
  }

  /// Initier le transfert de device (ancien appareil)
  Future<Map<String, dynamic>> initiateDeviceTransfer({
    required String transferCode,
    required String proximityCode,
    required String encryptedPackage,
  }) async {
    return call('initiate-device-transfer', body: {
      'transfer_code': transferCode,
      'proximity_code': proximityCode,
      'encrypted_package': encryptedPackage,
    });
  }

  /// Récupérer le package de transfert (nouveau appareil)
  Future<Map<String, dynamic>> getTransferPackage({
    required String hashId,
    required String transferCode,
  }) async {
    return call('get-transfer-package', body: {
      'hash_id': hashId,
      'transfer_code': transferCode,
    });
  }

  /// Confirmer la fin du transfert (nouveau appareil)
  Future<Map<String, dynamic>> confirmTransferComplete({
    required String transferId,
    required String hashId,
    required String newDeviceId,
    required String identityPublicKey,
    required String signedPrekeyPublic,
    required String signedPrekeySignature,
    required int signedPrekeyId,
    required List<Map<String, dynamic>> prekeys,
  }) async {
    return callAnonymous('confirm-transfer-complete', body: {
      'transfer_id': transferId,
      'hash_id': hashId,
      'new_device_id': newDeviceId,
      'identity_public_key': identityPublicKey,
      'signed_prekey_public': signedPrekeyPublic,
      'signed_prekey_signature': signedPrekeySignature,
      'signed_prekey_id': signedPrekeyId,
      'prekeys': prekeys,
    });
  }

  /// Invalider l'appareil actuel (après transfert)
  Future<Map<String, dynamic>> invalidateDevice() async {
    return call('invalidate-device');
  }

  /// Enregistrer le code temporaire de transfert côté serveur
  Future<Map<String, dynamic>> registerTransferTempCode({
    required String tempCode,
  }) async {
    return call('register-transfer-temp-code', body: {
      'temp_code': tempCode,
    });
  }

  /// Enregistrer le code de transfert côté serveur
  Future<Map<String, dynamic>> registerTransferCode({
    required String transferCode,
  }) async {
    return call('register-transfer-code', body: {
      'transfer_code': transferCode,
    });
  }

  /// Notifier la connexion d'un nouveau device pour transfert
  Future<Map<String, dynamic>> notifyNewDeviceConnected({
    required String hashId,
    required String deviceInfo,
  }) async {
    return call('notify-new-device-connected', body: {
      'hash_id': hashId,
      'device_info': deviceInfo,
    });
  }

  // ============================================================
  // DEMANDES DE CONTACT
  // ============================================================

  /// Valider le code temporaire et récupérer la clé publique du destinataire
  /// (sans consommer le code)
  Future<Map<String, dynamic>> validateContactCode({
    required String targetHashId,
    required String temporaryCode,
  }) async {
    return call('validate-contact-code', body: {
      'target_hash_id': targetHashId,
      'temporary_code': temporaryCode,
    });
  }

  /// Envoyer une demande de contact par Hash ID
  Future<Map<String, dynamic>> sendContactRequest({
    required String targetHashId,
    required String exchangeToken,
    String? encryptedMessage,
  }) async {
    return call('send-contact-request', body: {
      'target_hash_id': targetHashId,
      'exchange_token': exchangeToken,
      if (encryptedMessage != null) 'encrypted_message': encryptedMessage,
    });
  }

  /// Récupérer les demandes en attente (où l'utilisateur est destinataire)
  Future<Map<String, dynamic>> getPendingRequests() async {
    return call('get-pending-requests');
  }

  /// Récupérer les demandes envoyées (où l'utilisateur est demandeur)
  Future<Map<String, dynamic>> getSentRequests() async {
    return call('get-sent-requests');
  }

  /// Annuler une demande envoyée
  Future<Map<String, dynamic>> cancelContactRequest({
    required String requestId,
  }) async {
    return call('cancel-contact-request', body: {
      'request_id': requestId,
    });
  }

  /// Accepter une demande de contact
  Future<Map<String, dynamic>> acceptContactRequest({
    required String requestId,
  }) async {
    return call('accept-contact-request', body: {
      'request_id': requestId,
    });
  }

  /// Rejeter une demande de contact
  Future<Map<String, dynamic>> rejectContactRequest({
    required String requestId,
  }) async {
    return call('reject-contact-request', body: {
      'request_id': requestId,
    });
  }

  /// Récupérer les demandes acceptées (où l'utilisateur est demandeur)
  Future<Map<String, dynamic>> getAcceptedRequests({
    String? lastChecked,
  }) async {
    final queryParams = lastChecked != null ? '?last_checked=$lastChecked' : '';
    return call('get-accepted-requests$queryParams');
  }

  // ============================================================
  // MÉDIA CHIFFRÉ
  // ============================================================

  /// Upload un fichier binaire brut vers une Edge Function
  /// Utilisé pour envoyer des médias chiffrés (application/octet-stream)
  Future<Map<String, dynamic>> uploadBinary(
    String functionName, {
    required Uint8List body,
    Map<String, String>? extraHeaders,
  }) async {
    final session = _client.auth.currentSession;
    // ignore: avoid_print
    print('=== EdgeFunction uploadBinary: $functionName ===');

    final headers = {
      'apikey': SupabaseConfig.anonKey,
      if (session != null) 'Authorization': 'Bearer ${session.accessToken}',
      ...?extraHeaders,
    };

    final response = await _httpClient.post(
      Uri.parse('$_baseUrl/$functionName'),
      headers: headers,
      body: body,
    ).timeout(
      const Duration(seconds: 90),
      onTimeout: () => throw TimeoutException('Upload timeout after 90s'),
    );

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode >= 400) {
      final errorMessage = data['error'] as String? ?? 'Erreur inconnue';
      final errorCode = data['error_code'] as String?;

      if (response.statusCode == 401 && _isTransferError(errorMessage)) {
        throw SessionTransferredException(errorMessage);
      }

      throw EdgeFunctionException(errorMessage, response.statusCode, errorCode: errorCode);
    }

    return data;
  }

  /// Télécharge des bytes bruts depuis une URL (signed URL)
  Future<Uint8List> downloadBytes(String url) async {
    // ignore: avoid_print
    print('=== EdgeFunction downloadBytes ===');

    final response = await _httpClient.get(Uri.parse(url));

    if (response.statusCode >= 400) {
      throw EdgeFunctionException(
        'Erreur téléchargement: ${response.statusCode}',
        response.statusCode,
      );
    }

    return response.bodyBytes;
  }
}
