import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'edge_function_service.dart';
import 'livekit_service.dart';
import 'sealed_sender_service.dart';
import 'secure_storage_service.dart';

/// Service de connexion audio anticipée pour les appels entrants.
///
/// Quand l'utilisateur décroche un appel via CallKit (app en arrière-plan),
/// ce service connecte LiveKit (audio seulement) dès main(), AVANT le PIN,
/// en utilisant SharedPreferences + Keychain (pas de Hive).
///
/// Si l'early connect échoue, le flux normal prend le relais (aucune régression).
class EarlyCallConnectService {
  EarlyCallConnectService._();

  /// Whether early connect succeeded and LiveKit is connected.
  static bool _isActive = false;
  static bool get isActive => _isActive;

  /// Whether the answer signal was already sent during early connect.
  static bool _answerSent = false;
  static bool get answerSent => _answerSent;

  /// The call_id from FCM payload.
  static String? _callId;
  static String? get callId => _callId;

  /// Attempt early audio connect before PIN screen.
  ///
  /// Returns true if LiveKit is now connected (audio only).
  /// Returns false immediately if no pending accepted call.
  /// Never throws — failures are logged and the normal flow takes over.
  static Future<bool> attemptEarlyConnect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();

      // Only proceed if user accepted via CallKit
      final accepted = prefs.getBool('pending_call_accepted') ?? false;
      if (!accepted) return false;

      debugPrint('[EarlyConnect] Pending accepted call detected — attempting early connect');

      // Read call metadata from SharedPreferences (set by FCM handler)
      _callId = prefs.getString('pending_call_id');
      final callerHashId = prefs.getString('pending_call_caller_hash_id');
      final callTypeStr = prefs.getString('pending_call_type') ?? 'audio';

      if (_callId == null || callerHashId == null || callerHashId.isEmpty) {
        debugPrint('[EarlyConnect] Missing call metadata (callId: $_callId, caller: $callerHashId)');
        return false;
      }

      // Read contact call data cache
      final cacheJson = prefs.getString('contact_call_cache');
      if (cacheJson == null) {
        debugPrint('[EarlyConnect] No contact call cache');
        return false;
      }

      final cache = jsonDecode(cacheJson) as Map<String, dynamic>;
      final contactData = cache[callerHashId] as Map<String, dynamic>?;
      if (contactData == null) {
        debugPrint('[EarlyConnect] Caller $callerHashId not in call cache');
        return false;
      }

      final odid = contactData['odid'] as String?;
      final identityPublicKey = contactData['identityPublicKey'] as String?;
      final mailboxToken = contactData['mailboxToken'] as String?;
      final sendToken = contactData['sendToken'] as String?;
      final sealedSenderPublicKey = contactData['sealedSenderPublicKey'] as String?;

      if (odid == null || identityPublicKey == null) {
        debugPrint('[EarlyConnect] Missing contact crypto data');
        return false;
      }

      // Read identity private key from Keychain (no Hive/PIN needed)
      final secureStorage = SecureStorageService();
      final identityPrivateKey = await secureStorage.getIdentityPrivateKey();
      final identityPublicKeyLocal = await secureStorage.getIdentityPublicKey();

      if (identityPrivateKey == null || identityPublicKeyLocal == null) {
        debugPrint('[EarlyConnect] Missing local identity keys');
        return false;
      }

      // Get LiveKit token via Edge Function (Supabase already initialized)
      final edgeFunctions = EdgeFunctionService(Supabase.instance.client);

      final tokenResult = await edgeFunctions.call('call-token', body: {
        'callee_id': odid,
        'call_type': callTypeStr,
      });

      final token = tokenResult['token'] as String;
      final roomId = tokenResult['room_id'] as String;

      // Derive E2EE key
      final sealedSender = SealedSenderService();
      final e2eeKey = await sealedSender.deriveCallE2EEKey(
        myIdentityPrivateKey: identityPrivateKey,
        theirIdentityPublicKey: identityPublicKey,
        callId: _callId!,
      );

      // Connect LiveKit — audio only, no camera
      final livekitService = LiveKitService();
      await livekitService.connect(
        token: token,
        roomName: roomId,
        isVideoCall: false,
        micEnabled: true,
        cameraEnabled: false,
        e2eeSharedKey: e2eeKey,
      ).timeout(const Duration(seconds: 15));

      debugPrint('[EarlyConnect] LiveKit connected (audio only)');

      // Send answer signal via anonymous Edge Function
      if (mailboxToken != null && sealedSenderPublicKey != null) {
        try {
          final answerPayload = jsonEncode({
            'type': 'answer',
            'call_id': _callId,
          });

          final encryptedSignal = await sealedSender.createSealedEnvelope(
            senderIdentityPublicKey: identityPublicKeyLocal,
            senderSigningPrivateKey: identityPrivateKey,
            recipientSealedSenderPublicKey: sealedSenderPublicKey,
            messageContent: Uint8List.fromList(utf8.encode(answerPayload)),
          );

          await edgeFunctions.callAnonymous('send-call-signal', body: {
            'recipient_mailbox_token': mailboxToken,
            'encrypted_signal': encryptedSignal,
            if (sendToken != null) 'send_token': sendToken,
          });

          _answerSent = true;
          debugPrint('[EarlyConnect] Answer signal sent');
        } catch (e) {
          debugPrint('[EarlyConnect] Failed to send answer (will retry in normal flow): $e');
        }
      }

      _isActive = true;
      debugPrint('[EarlyConnect] Early connect successful — audio is live');
      return true;
    } catch (e) {
      debugPrint('[EarlyConnect] Early connect failed (normal flow will handle): $e');
      _isActive = false;
      _answerSent = false;
      _callId = null;
      return false;
    }
  }

  /// Reset early connect state (called after call ends or normal flow takes over).
  static void reset() {
    _isActive = false;
    _answerSent = false;
    _callId = null;
    debugPrint('[EarlyConnect] Reset');
  }
}
