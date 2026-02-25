import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

import '../../domain/models/call_state.dart';
import '../../domain/models/contact.dart';
import 'edge_function_service.dart';
import 'sealed_sender_service.dart';
import 'secure_storage_service.dart';

/// Signal d'appel reçu
class CallSignal {
  final String id;
  final String type; // offer, answer, ice, hangup, decline, busy
  final String encryptedPayload;
  final DateTime createdAt;
  final DateTime expiresAt;

  CallSignal({
    required this.id,
    required this.type,
    required this.encryptedPayload,
    required this.createdAt,
    required this.expiresAt,
  });

  factory CallSignal.fromJson(Map<String, dynamic> json) {
    return CallSignal(
      id: json['id'] as String,
      type: json['encrypted_signal_type'] as String? ?? 'opaque',
      encryptedPayload: json['encrypted_signal'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
    );
  }
}

/// Payload d'un signal déchiffré
class CallSignalPayload {
  final String type; // offer, answer, ice, hangup, decline, busy
  final String? sdp; // Pour offer/answer
  final Map<String, dynamic>? iceCandidate; // Pour ice
  final String? callId;
  final String? senderId;
  final String? senderHashId;
  final CallType? callType;

  CallSignalPayload({
    required this.type,
    this.sdp,
    this.iceCandidate,
    this.callId,
    this.senderId,
    this.senderHashId,
    this.callType,
  });

  factory CallSignalPayload.fromJson(Map<String, dynamic> json) {
    return CallSignalPayload(
      type: json['type'] as String,
      sdp: json['sdp'] as String?,
      iceCandidate: json['ice_candidate'] as Map<String, dynamic>?,
      callId: json['call_id'] as String?,
      senderId: json['sender_id'] as String?,
      senderHashId: json['sender_hash_id'] as String?,
      callType: json['call_type'] == 'video' ? CallType.video : CallType.audio,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      if (sdp != null) 'sdp': sdp,
      if (iceCandidate != null) 'ice_candidate': iceCandidate,
      if (callId != null) 'call_id': callId,
      if (senderId != null) 'sender_id': senderId,
      if (senderHashId != null) 'sender_hash_id': senderHashId,
      if (callType != null)
        'call_type': callType == CallType.video ? 'video' : 'audio',
    };
  }
}

/// Service pour la signalisation des appels (SDP/ICE)
class CallSignalingService {
  final EdgeFunctionService _edgeFunctions;
  final SealedSenderService _sealedSender;
  final SecureStorageService _secureStorage;

  // TURN/STUN server cache with dynamic TTL
  Map<String, dynamic>? _cachedCallToken;
  DateTime? _callTokenCacheTime;
  Duration _callTokenCacheTTL = const Duration(minutes: 5); // Default, overridden by server

  CallSignalingService(
    this._edgeFunctions, {
    SealedSenderService? sealedSender,
    SecureStorageService? secureStorage,
  })  : _sealedSender = sealedSender ?? SealedSenderService(),
        _secureStorage = secureStorage ?? SecureStorageService();

  final _callStateChangeController = StreamController<CallSignalPayload>.broadcast();

  Stream<CallSignalPayload> get callStateChanges => _callStateChangeController.stream;

  /// Démarrer un appel
  /// Retourne le call_id et le fcm_token du destinataire
  Future<Map<String, dynamic>> startCall({
    required String calleeId,
    required CallType callType,
  }) async {
    debugPrint('[CallSignaling] Starting call to $calleeId (${callType.name})');

    final response = await _edgeFunctions.startCall(
      calleeId: calleeId,
      callType: callType == CallType.video ? 'video' : 'audio',
    );

    return {
      'call_id': response['call_id'],
      'callee_fcm_token': response['callee_fcm_token'],
    };
  }

  /// Obtenir un token LiveKit pour rejoindre un appel.
  /// Uses a 5-minute cache to avoid redundant server calls.
  Future<Map<String, dynamic>> getCallToken({
    required String calleeId,
    required CallType callType,
  }) async {
    // Check cache
    if (_cachedCallToken != null &&
        _callTokenCacheTime != null &&
        DateTime.now().difference(_callTokenCacheTime!) < _callTokenCacheTTL) {
      debugPrint('[CallSignaling] Using cached call token');
      return _cachedCallToken!;
    }

    debugPrint('[CallSignaling] Getting call token for $calleeId');

    final response = await _edgeFunctions.call('call-token', body: {
      'callee_id': calleeId,
      'call_type': callType == CallType.video ? 'video' : 'audio',
    });

    // Parse dynamic TTL from server response (fallback to 5min)
    final serverTtl = response['token_ttl_seconds'] as int?;
    if (serverTtl != null && serverTtl > 0) {
      _callTokenCacheTTL = Duration(seconds: serverTtl);
      debugPrint('[CallSignaling] Using server TTL: ${serverTtl}s');
    }

    final result = {
      'token': response['token'],
      'room_id': response['room_id'],
      'livekit_url': response['livekit_url'],
      'max_duration_seconds': response['max_duration_seconds'],
      'e2ee_enabled': response['e2ee_enabled'],
    };

    _cachedCallToken = result;
    _callTokenCacheTime = DateTime.now();

    return result;
  }

  /// Invalidate call token cache (e.g. on ICE failure)
  void invalidateCallTokenCache() {
    _cachedCallToken = null;
    _callTokenCacheTime = null;
    debugPrint('[CallSignaling] Call token cache invalidated');
  }

  /// Envoyer un signal d'appel (anonymous - sealed sender)
  /// [notify] controls whether server sends a push notification (opaque flag).
  Future<void> sendSignal({
    required String recipientMailboxToken,
    required String encryptedSignal,
    bool notify = false,
    String? sendToken,
    String? notificationRelayToken,
    String? callType,
    String? callerHashId,
    String? callId,
  }) async {
    debugPrint('[CallSignaling] Sending signal (notify: $notify)');

    await _edgeFunctions.callAnonymous('send-call-signal', body: {
      'recipient_mailbox_token': recipientMailboxToken,
      'encrypted_signal': encryptedSignal,
      'notify': notify,
      if (sendToken != null)
        'send_token': sendToken,
      if (notificationRelayToken != null)
        'notification_relay_token': notificationRelayToken,
      if (callType != null)
        'call_type': callType,
      if (callerHashId != null)
        'caller_hash_id': callerHashId,
      if (callId != null)
        'call_id': callId,
    });
  }

  /// Chiffrer un payload de signal avec sealed sender
  Future<String> _encryptSignalPayload(
    CallSignalPayload payload,
    Contact contact,
  ) async {
    final senderIdentityPublicKey = await _secureStorage.read('identity_public_key');
    final senderIdentityPrivateKey = await _secureStorage.read('identity_private_key');

    if (senderIdentityPublicKey != null &&
        senderIdentityPrivateKey != null &&
        contact.sealedSenderPublicKey != null) {
      // Chiffrer avec sealed sender (le serveur ne peut pas lire le contenu)
      return await _sealedSender.createSealedEnvelope(
        senderIdentityPublicKey: senderIdentityPublicKey,
        senderSigningPrivateKey: senderIdentityPrivateKey,
        recipientSealedSenderPublicKey: contact.sealedSenderPublicKey!,
        messageContent: Uint8List.fromList(utf8.encode(jsonEncode(payload.toJson()))),
      );
    }

    // Fallback: base64 simple (ne devrait pas arriver en production)
    return base64Encode(utf8.encode(jsonEncode(payload.toJson())));
  }

  /// Envoyer un signal "offer" (appel sortant)
  Future<void> sendOffer({
    required Contact contact,
    required String callId,
    required CallType callType,
    required String senderId,
    required String senderHashId,
    String? sdp,
  }) async {
    final payload = CallSignalPayload(
      type: 'offer',
      sdp: sdp,
      callId: callId,
      senderId: senderId,
      senderHashId: senderHashId,
      callType: callType,
    );

    final encryptedSignal = await _encryptSignalPayload(payload, contact);

    await sendSignal(
      recipientMailboxToken: contact.mailboxToken!,
      encryptedSignal: encryptedSignal,
      notify: true, // Only offers trigger push notifications
      sendToken: contact.sendToken,
      notificationRelayToken: contact.relayToken,
      callType: callType == CallType.video ? 'video' : 'audio',
      callerHashId: senderHashId,
      callId: callId,
    );
  }

  /// Envoyer un signal "answer" (accepter l'appel)
  Future<void> sendAnswer({
    required Contact contact,
    required String callId,
    String? sdp,
  }) async {
    final payload = CallSignalPayload(
      type: 'answer',
      sdp: sdp,
      callId: callId,
    );

    final encryptedSignal = await _encryptSignalPayload(payload, contact);

    await sendSignal(
      recipientMailboxToken: contact.mailboxToken!,
      encryptedSignal: encryptedSignal,
      sendToken: contact.sendToken,
    );
  }

  /// Envoyer un signal "decline" (refuser l'appel)
  Future<void> sendDecline({
    required Contact contact,
    required String callId,
  }) async {
    final payload = CallSignalPayload(
      type: 'decline',
      callId: callId,
    );

    final encryptedSignal = await _encryptSignalPayload(payload, contact);

    await sendSignal(
      recipientMailboxToken: contact.mailboxToken!,
      encryptedSignal: encryptedSignal,
      sendToken: contact.sendToken,
    );
  }

  /// Envoyer un signal "hangup" (raccrocher)
  Future<void> sendHangup({
    required Contact contact,
    required String callId,
  }) async {
    final payload = CallSignalPayload(
      type: 'hangup',
      callId: callId,
    );

    final encryptedSignal = await _encryptSignalPayload(payload, contact);

    await sendSignal(
      recipientMailboxToken: contact.mailboxToken!,
      encryptedSignal: encryptedSignal,
      sendToken: contact.sendToken,
    );
  }

  /// Envoyer un signal "busy" (occupé)
  Future<void> sendBusy({
    required Contact contact,
    required String callId,
  }) async {
    final payload = CallSignalPayload(
      type: 'busy',
      callId: callId,
    );

    final encryptedSignal = await _encryptSignalPayload(payload, contact);

    await sendSignal(
      recipientMailboxToken: contact.mailboxToken!,
      encryptedSignal: encryptedSignal,
      sendToken: contact.sendToken,
    );
  }

  /// Envoyer un candidat ICE
  Future<void> sendIceCandidate({
    required Contact contact,
    required String callId,
    required Map<String, dynamic> candidate,
  }) async {
    final payload = CallSignalPayload(
      type: 'ice',
      iceCandidate: candidate,
      callId: callId,
    );

    final encryptedSignal = await _encryptSignalPayload(payload, contact);

    await sendSignal(
      recipientMailboxToken: contact.mailboxToken!,
      encryptedSignal: encryptedSignal,
      sendToken: contact.sendToken,
    );
  }

  /// Récupérer les signaux d'appel en attente
  Future<List<CallSignal>> fetchSignals({
    required String mailboxToken,
    DateTime? since,
    int limit = 50,
  }) async {
    debugPrint('[CallSignaling] Fetching signals');

    final response = await _edgeFunctions.call('fetch-call-signals', body: {
      'mailbox_token': mailboxToken,
      if (since != null) 'since': since.toIso8601String(),
      'limit': limit,
    });

    final signals = (response['signals'] as List<dynamic>?)
            ?.map((s) => CallSignal.fromJson(s as Map<String, dynamic>))
            .toList() ??
        [];

    debugPrint('[CallSignaling] Fetched ${signals.length} signals');
    return signals;
  }

  /// Terminer un appel
  Future<void> endCall({
    required String roomId,
    required CallEndReason status,
    int? qualityScore,
  }) async {
    debugPrint('[CallSignaling] Ending call: $roomId (${status.name})');

    String statusString;
    switch (status) {
      case CallEndReason.completed:
        statusString = 'completed';
        break;
      case CallEndReason.missed:
        statusString = 'missed';
        break;
      case CallEndReason.declined:
        statusString = 'declined';
        break;
      default:
        statusString = 'failed';
    }

    await _edgeFunctions.call('call-end', body: {
      'room_id': roomId,
      'status': statusString,
      if (qualityScore != null) 'quality_score': qualityScore,
    });
  }

  /// Envoyer un heartbeat (keep-alive)
  Future<Map<String, dynamic>> sendHeartbeat({
    required String roomId,
  }) async {
    final response = await _edgeFunctions.call('call-heartbeat', body: {
      'room_id': roomId,
    });

    return {
      'continue': response['continue'] ?? true,
      'duration_seconds': response['duration_seconds'],
      'remaining_seconds': response['remaining_seconds'],
    };
  }

  /// Signaler un échec P2P
  Future<void> reportP2PFailed({
    required String roomId,
  }) async {
    await _edgeFunctions.call('call-p2p-failed', body: {
      'room_id': roomId,
      'language': 'fr',
    });
  }

  /// Libérer les ressources
  void dispose() {
    _callStateChangeController.close();
  }
}
