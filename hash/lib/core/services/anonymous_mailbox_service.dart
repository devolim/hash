import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'edge_function_service.dart';
import 'local_storage_service.dart';
import 'sealed_sender_service.dart';
import 'secure_storage_service.dart';

/// Decode PostgreSQL bytea hex format to string.
/// Handles both `\x`-prefixed hex (PostgREST) and raw hex (Realtime/pgoutput).
/// Recursively decodes in case of double-hex encoding (bytea columns via Realtime
/// can produce hex(hex(value)) when Supabase JS encodes the string for bytea
/// storage and Realtime hex-encodes it again on output).
String _decodePostgresBytea(String input) {
  String hexString;

  if (input.startsWith(r'\x')) {
    // Standard PostgreSQL hex format with \x prefix
    hexString = input.substring(2);
  } else if (input.length % 2 == 0 &&
      input.length > 8 &&
      RegExp(r'^[0-9a-fA-F]+$').hasMatch(input)) {
    // Raw hex without \x prefix (Supabase Realtime via pgoutput)
    hexString = input;
  } else {
    return input; // Not hex format, return as-is
  }

  final bytes = <int>[];
  for (var i = 0; i < hexString.length; i += 2) {
    if (i + 2 <= hexString.length) {
      bytes.add(int.parse(hexString.substring(i, i + 2), radix: 16));
    }
  }
  final decoded = utf8.decode(bytes);

  // Recursively decode if result is still hex (double-encoding from bytea columns).
  // Safe because base64 strings contain non-hex chars (G-Z, g-z beyond f) so
  // recursion stops naturally.
  return _decodePostgresBytea(decoded);
}

/// Decode signal type which may be base64-encoded or plain text.
/// CallSignalingService sends plain "offer", AnonymousMailboxService sends base64("offer")
String _decodeSignalType(String signalType) {
  // First, handle PostgreSQL bytea format
  final decoded = _decodePostgresBytea(signalType);

  // Check if it looks like base64 (common signal types base64 encoded)
  // "offer" -> "b2ZmZXI=", "answer" -> "YW5zd2Vy", etc.
  const plainTypes = ['offer', 'answer', 'ice', 'hangup', 'decline', 'busy'];
  if (plainTypes.contains(decoded)) {
    return decoded;
  }

  // Try to decode as base64
  try {
    final decodedBytes = base64Decode(decoded);
    final decodedStr = utf8.decode(decodedBytes);
    if (plainTypes.contains(decodedStr)) {
      return decodedStr;
    }
  } catch (_) {
    // Not valid base64, return as-is
  }

  return decoded;
}

/// Service for managing anonymous mailboxes and sealed sender messaging.
///
/// This service handles:
/// - Mailbox registration
/// - Sending sealed messages (anonymous)
/// - Realtime message reception via Supabase Realtime (WebSocket)
/// - Notification relay management
/// - Call signaling
class AnonymousMailboxService {
  final EdgeFunctionService _edgeFunctions;
  final SealedSenderService _sealedSender;
  final SecureStorageService _secureStorage;
  final SupabaseClient _supabaseClient;
  LocalStorageService? localStorage;

  // Realtime channel (WebSocket push)
  RealtimeChannel? _realtimeChannel;

  // Deduplication sets (Realtime can fire duplicates on reconnect)
  final Set<String> _processedMessageIds = {};
  final Set<String> _processedSignalIds = {};

  // Callbacks
  // Returns the list of message IDs that were successfully saved locally.
  // Server deletion only happens for IDs in this list.
  Future<List<String>> Function(List<ReceivedSealedMessage>)? onMessagesReceived;
  Function(List<ReceivedCallSignal>)? onCallSignalsReceived;
  Function(bool)? onConnectionStatusChanged;

  // Connection state
  bool _isConnected = false;
  bool get isConnected => _isConnected;
  int _reconnectAttempts = 0;
  Timer? _reconnectTimer;

  // Health monitoring
  DateTime? _lastActivityAt;
  Timer? _healthCheckTimer;
  static const Duration _healthCheckInterval = Duration(seconds: 45);
  static const Duration _inactivityThreshold = Duration(seconds: 90);
  // Délai avant d'afficher la bannière : évite de flasher pour une brève
  // interruption WebSocket (reprise d'app, coupure réseau momentanée).
  Timer? _showBannerTimer;
  // Compteur de génération : incrémenté à chaque stopRealtime() pour invalider
  // les callbacks d'un ancien canal (Supabase peut les déclencher après unsubscribe).
  int _subGen = 0;

  // Cache
  String? _currentMailboxToken;
  String? _currentRelayToken;

  AnonymousMailboxService({
    required EdgeFunctionService edgeFunctions,
    required SealedSenderService sealedSender,
    required SecureStorageService secureStorage,
    required SupabaseClient supabaseClient,
  })  : _edgeFunctions = edgeFunctions,
        _sealedSender = sealedSender,
        _secureStorage = secureStorage,
        _supabaseClient = supabaseClient;

  /// Initialize mailbox for the current user.
  ///
  /// Creates or updates the anonymous mailbox registration.
  Future<bool> initializeMailbox() async {
    try {
      debugPrint('[AnonymousMailbox] Starting mailbox initialization...');

      // Get identity key from secure storage
      final identityPrivateKey = await _secureStorage.read('identity_private_key');
      if (identityPrivateKey == null) {
        debugPrint('[AnonymousMailbox] ERROR: No identity_private_key found in secure storage');
        return false;
      }
      if (kDebugMode) {
        debugPrint('[AnonymousMailbox] Found identity key: ${identityPrivateKey.substring(0, 10)}...');
      }

      // Derive mailbox token (rotation counter always 0 - rotation disabled)
      _currentMailboxToken = await _sealedSender.deriveMailboxToken(
        identityPrivateKey: identityPrivateKey,
        rotationCounter: 0,
      );
      debugPrint('[AnonymousMailbox] Derived mailbox token: ${_currentMailboxToken?.substring(0, 16)}...');

      // Check if we already have a sealed sender key pair
      String? existingPrivateKey = await _secureStorage.read('sealed_sender_private_key');
      String? existingPublicKey = await _secureStorage.read('sealed_sender_public_key');

      SealedSenderKeyPair sealedKeyPair;
      if (existingPrivateKey != null && existingPublicKey != null) {
        // Reuse existing key pair
        debugPrint('[AnonymousMailbox] Reusing existing sealed sender key pair');
        sealedKeyPair = SealedSenderKeyPair(
          publicKey: existingPublicKey,
          privateKey: existingPrivateKey,
        );
      } else {
        // Generate new sealed sender key pair
        sealedKeyPair = await _sealedSender.generateSealedSenderKeyPair();
        debugPrint('[AnonymousMailbox] Generated new sealed sender key pair');

        // Save sealed sender keys locally
        await _secureStorage.write('sealed_sender_private_key', sealedKeyPair.privateKey);
        await _secureStorage.write('sealed_sender_public_key', sealedKeyPair.publicKey);
      }

      // Derive relay token for push notifications (rotation counter always 0)
      _currentRelayToken = await _sealedSender.deriveRelayToken(
        identityPrivateKey: identityPrivateKey,
        rotationCounter: 0,
      );
      debugPrint('[AnonymousMailbox] Derived relay token: ${_currentRelayToken?.substring(0, 16)}...');

      // Register mailbox with server (include relay_token for contact exchange)
      debugPrint('[AnonymousMailbox] Calling register-mailbox...');
      final response = await _edgeFunctions.call('register-mailbox', body: {
        'mailbox_token': _currentMailboxToken,
        'sealed_sender_public_key': sealedKeyPair.publicKey,
        'rotation_counter': 0,
        'relay_token': _currentRelayToken, // For contacts to send push notifications
      });
      debugPrint('[AnonymousMailbox] register-mailbox response: $response');

      if (response['success'] == true) {
        debugPrint('[AnonymousMailbox] Mailbox initialized successfully: ${_currentMailboxToken?.substring(0, 8)}...');
        return true;
      }

      debugPrint('[AnonymousMailbox] Mailbox initialization failed: ${response['error']}');
      return false;
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error initializing mailbox: $e');
      return false;
    }
  }

  /// Initialize notification relay for push notifications.
  ///
  /// ZERO-KNOWLEDGE: The server does NOT know who owns this relay.
  /// - No user_id stored on server
  /// - Anonymous registration (no auth required)
  /// - relay_token derived from private key (only owner can compute it)
  ///
  /// If DB is compromised, attacker sees:
  ///   relay_token ABC → fcm_token XYZ
  /// But CANNOT link relay_token to any user identity.
  Future<bool> initializeNotificationRelay({
    required String pushToken,
    required String platform,
  }) async {
    try {
      final identityPrivateKey = await _secureStorage.read('identity_private_key');
      if (identityPrivateKey == null) return false;

      // Derive relay token (rotation counter always 0 - rotation disabled)
      _currentRelayToken = await _sealedSender.deriveRelayToken(
        identityPrivateKey: identityPrivateKey,
        rotationCounter: 0,
      );

      debugPrint('[AnonymousMailbox] Relay token derived: ${_currentRelayToken?.substring(0, 16)}...');

      // Register relay ANONYMOUSLY (no auth, no user_id on server)
      final response = await _edgeFunctions.callAnonymous('register-notification-relay', body: {
        'relay_token': _currentRelayToken,
        'fcm_token': pushToken,
        'platform': platform,
      });

      if (response['success'] == true) {
        debugPrint('[AnonymousMailbox] Notification relay initialized (anonymous/zero-knowledge)');
        return true;
      }

      debugPrint('[AnonymousMailbox] Failed to initialize relay: ${response['error']}');
      return false;
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error initializing notification relay: $e');
      return false;
    }
  }

  /// Send a sealed message to a contact.
  ///
  /// The server will not know who sent this message.
  Future<SendResult> sendSealedMessage({
    required String recipientMailboxToken,
    required Uint8List messageContent,
    required String recipientSealedPublicKey,
    String? recipientRelayToken,
    String? sendToken,
    String? contentHint,
  }) async {
    try {
      // Get sender keys (identity key is Ed25519, used for signing)
      final senderIdentityPublicKey = await _secureStorage.read('identity_public_key');
      final senderIdentityPrivateKey = await _secureStorage.read('identity_private_key');

      if (senderIdentityPublicKey == null || senderIdentityPrivateKey == null) {
        return SendResult(success: false, error: 'Clés expéditeur manquantes');
      }

      // Create sealed envelope
      final sealedEnvelope = await _sealedSender.createSealedEnvelope(
        senderIdentityPublicKey: senderIdentityPublicKey,
        senderSigningPrivateKey: senderIdentityPrivateKey,
        recipientSealedSenderPublicKey: recipientSealedPublicKey,
        messageContent: messageContent,
      );

      // Send via Edge Function (no auth required for sealed sender)
      final body = <String, dynamic>{
        'recipient_mailbox_token': recipientMailboxToken,
        'sealed_envelope': sealedEnvelope,
        'notification_relay_token': recipientRelayToken,
        if (contentHint != null) 'content_hint': contentHint,
      };
      if (sendToken != null) {
        body['send_token'] = sendToken;
      }
      final response = await _edgeFunctions.callAnonymous('send-sealed-message', body: body);

      if (response['success'] == true) {
        return SendResult(
          success: true,
          messageId: response['message_id'] as String?,
          timestamp: response['timestamp'] as String?,
        );
      }

      return SendResult(success: false, error: response['error'] as String?);
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error sending message: $e');
      return SendResult(success: false, error: e.toString());
    }
  }

  /// Revoke a message from the server before it is delivered.
  ///
  /// Uses authenticated call since we need to prove ownership via send_token.
  Future<RevokeResult> revokeMessage({
    required String messageId,
    String? mediaFileId,
    required String recipientMailboxToken,
    required String sendToken,
  }) async {
    try {
      final response = await _edgeFunctions.call('revoke-message', body: {
        'message_id': messageId,
        'recipient_mailbox_token': recipientMailboxToken,
        'send_token': sendToken,
        if (mediaFileId != null) 'media_file_id': mediaFileId,
      });

      return RevokeResult(
        success: response['success'] == true,
        messageRevoked: response['message_revoked'] == true,
        mediaRevoked: response['media_revoked'] == true,
      );
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error revoking message: $e');
      return RevokeResult(
        success: false,
        messageRevoked: false,
        mediaRevoked: false,
        error: e.toString(),
      );
    }
  }

  /// Send a call signal (anonymous).
  /// [notify] controls whether server sends a push notification (opaque flag).
  Future<bool> sendCallSignal({
    required String recipientMailboxToken,
    required String signalType, // offer, answer, ice, hangup
    required Uint8List signalData,
    required String recipientSealedPublicKey,
    String? recipientRelayToken,
    String? sendToken,
    bool notify = false,
  }) async {
    try {
      final senderIdentityPublicKey = await _secureStorage.read('identity_public_key');
      final senderIdentityPrivateKey = await _secureStorage.read('identity_private_key');

      if (senderIdentityPublicKey == null || senderIdentityPrivateKey == null) {
        return false;
      }

      // Create sealed signal (includes caller identity)
      final signalContent = {
        'type': signalType,
        'data': base64Encode(signalData),
      };

      final sealedSignal = await _sealedSender.createSealedEnvelope(
        senderIdentityPublicKey: senderIdentityPublicKey,
        senderSigningPrivateKey: senderIdentityPrivateKey,
        recipientSealedSenderPublicKey: recipientSealedPublicKey,
        messageContent: Uint8List.fromList(utf8.encode(jsonEncode(signalContent))),
      );

      final signalBody = <String, dynamic>{
        'recipient_mailbox_token': recipientMailboxToken,
        'encrypted_signal': sealedSignal,
        'notify': notify,
        if (recipientRelayToken != null)
          'notification_relay_token': recipientRelayToken,
      };
      if (sendToken != null) {
        signalBody['send_token'] = sendToken;
      }
      final response = await _edgeFunctions.callAnonymous('send-call-signal', body: signalBody);

      return response['success'] == true;
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error sending call signal: $e');
      return false;
    }
  }

  /// Send a typing indicator to a contact via call signal infrastructure.
  /// Uses 'typing' signal type through send-call-signal.
  Future<void> sendTypingIndicator({
    required String recipientMailboxToken,
    required String recipientSealedPublicKey,
    String? sendToken,
  }) async {
    await sendCallSignal(
      recipientMailboxToken: recipientMailboxToken,
      signalType: 'typing',
      signalData: Uint8List.fromList(utf8.encode('typing')),
      recipientSealedPublicKey: recipientSealedPublicKey,
      sendToken: sendToken,
    );
  }

  /// Register a contact's verification token.
  Future<bool> registerContactToken({
    required String theirIdentityPublicKey,
    required String theirMailboxToken,
    String? theirRelayToken,
  }) async {
    try {
      final myIdentityPrivateKey = await _secureStorage.read('identity_private_key');
      if (myIdentityPrivateKey == null) return false;

      // Derive verification token from shared secret
      final verificationToken = await _sealedSender.deriveVerificationToken(
        myIdentityPrivateKey: myIdentityPrivateKey,
        theirIdentityPublicKey: theirIdentityPublicKey,
      );

      final response = await _edgeFunctions.call('register-contact-token', body: {
        'verification_token': verificationToken,
        'contact_mailbox_token': theirMailboxToken,
        'contact_relay_token': theirRelayToken,
      });

      return response['success'] == true;
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error registering contact token: $e');
      return false;
    }
  }

  // ============ REALTIME ============

  /// Start listening for messages and call signals via Supabase Realtime.
  /// Zero polling: only WebSocket push + one-time fetch at startup/reconnect.
  void startRealtime() {
    stopRealtime(); // incrémente _subGen, invalide les callbacks de l'ancien canal

    if (_currentMailboxToken == null) {
      debugPrint('[AnonymousMailbox] Cannot start Realtime: no mailbox token');
      return;
    }

    final token = _currentMailboxToken!;
    // Capturer la génération courante : les callbacks qui arrivent après un
    // stopRealtime() ultérieur seront ignorés car _subGen aura changé.
    final capturedGen = _subGen;

    debugPrint('[AnonymousMailbox] Starting Realtime for mailbox: ${token.substring(0, 16)}...');

    _realtimeChannel = _supabaseClient.channel('mailbox_${token.substring(0, 8)}');

    _realtimeChannel!
      .onPostgresChanges(
        event: PostgresChangeEvent.insert,
        schema: 'public',
        table: 'sealed_messages',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'recipient_mailbox_token',
          value: token,
        ),
        callback: (payload) {
          debugPrint('[AnonymousMailbox] Realtime: new sealed_message INSERT');
          _handleRealtimeMessage(payload.newRecord);
        },
      )
      .onPostgresChanges(
        event: PostgresChangeEvent.insert,
        schema: 'public',
        table: 'call_signals',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'recipient_mailbox_token',
          value: token,
        ),
        callback: (payload) {
          debugPrint('[AnonymousMailbox] Realtime: new call_signal INSERT');
          _handleRealtimeCallSignal(payload.newRecord);
        },
      )
      .subscribe((status, [error]) {
        // Ignorer les callbacks d'un canal qui a été remplacé par stopRealtime()
        if (capturedGen != _subGen) {
          debugPrint('[AnonymousMailbox] Realtime: stale callback ignored (gen $capturedGen != $_subGen)');
          return;
        }
        debugPrint('[AnonymousMailbox] Realtime subscription status: $status');
        if (status == RealtimeSubscribeStatus.subscribed) {
          _isConnected = true;
          _reconnectAttempts = 0;
          _reconnectTimer?.cancel();
          // Annuler le timer de bannière si on reconnecte avant qu'il n'expire
          _showBannerTimer?.cancel();
          _showBannerTimer = null;
          _lastActivityAt = DateTime.now();
          _startHealthCheck();
          onConnectionStatusChanged?.call(true);
          // One-time catch-up fetch for messages that arrived while offline
          _initialFetchMessages();
          _initialFetchCallSignals();
        }
        if (status == RealtimeSubscribeStatus.channelError ||
            status == RealtimeSubscribeStatus.timedOut) {
          _isConnected = false;
          if (error != null) {
            debugPrint('[AnonymousMailbox] Realtime error: $error');
          }
          // Délai de 5s avant d'afficher la bannière : les coupures brèves
          // (reprise d'app, handover réseau) se rétablissent sans la montrer.
          _showBannerTimer ??= Timer(const Duration(seconds: 5), () {
            _showBannerTimer = null;
            onConnectionStatusChanged?.call(false);
          });
          _scheduleReconnect();
        }
      });

    debugPrint('[AnonymousMailbox] Realtime started');
  }

  /// Handle a single message from Realtime INSERT event.
  Future<void> _handleRealtimeMessage(Map<String, dynamic> record) async {
    _lastActivityAt = DateTime.now();
    try {
      final messageId = record['id'] as String?;
      if (messageId == null) return;

      // Deduplication (in-memory + persistent Hive check)
      if (_processedMessageIds.contains(messageId)) {
        debugPrint('[AnonymousMailbox] Realtime: duplicate message $messageId, skipping');
        return;
      }
      // Check if already saved in Hive (survives app restart)
      if (localStorage != null) {
        final existing = await localStorage!.getMessage(messageId);
        if (existing != null) {
          debugPrint('[AnonymousMailbox] Realtime: message $messageId already in Hive, deleting from server');
          _processedMessageIds.add(messageId);
          // Clean up server copy since we already have it locally
          try {
            await _supabaseClient
                .from('sealed_messages')
                .delete()
                .eq('id', messageId);
          } catch (e) {
            debugPrint('[AnonymousMailbox] Realtime: failed to delete already-saved message $messageId: $e');
          }
          return;
        }
      }
      _processedMessageIds.add(messageId);
      if (_processedMessageIds.length > 1000) {
        // Remove oldest half instead of clearing everything — preserves recent dedup state
        final toRemove = _processedMessageIds.take(500).toList();
        _processedMessageIds.removeAll(toRemove);
      }

      final envelope = record['sealed_envelope'] as String?;
      if (envelope == null) {
        _processedMessageIds.remove(messageId);
        debugPrint('[AnonymousMailbox] Realtime message $messageId has no sealed_envelope');
        return;
      }

      final sealedPrivateKey = await _secureStorage.read('sealed_sender_private_key');
      if (sealedPrivateKey == null) {
        _processedMessageIds.remove(messageId);
        return;
      }

      final opened = await _sealedSender.openSealedEnvelope(
        sealedEnvelope: envelope,
        recipientSealedSenderPrivateKey: sealedPrivateKey,
      );

      if (opened != null) {
        final msg = ReceivedSealedMessage(
          messageId: messageId,
          senderIdentityKey: opened.senderIdentityKey,
          content: opened.messageContent,
          timestamp: opened.timestamp,
          serverTimestamp: DateTime.tryParse(record['created_at'] as String? ?? '') ?? DateTime.now(),
        );

        debugPrint('[AnonymousMailbox] Realtime: decrypted message from ${opened.senderIdentityKey.substring(0, 20)}...');

        // CRITICAL: Await the callback to confirm local save BEFORE deleting from server.
        // Only delete messages that were successfully saved locally.
        if (onMessagesReceived == null) {
          // No callback registered (HomeScreen disposed) — keep on server for next session
          _processedMessageIds.remove(messageId);
          debugPrint('[AnonymousMailbox] Realtime: no callback registered, keeping message $messageId on server');
          return;
        }
        final savedIds = await onMessagesReceived!.call([msg]);
        if (savedIds.contains(messageId)) {
          try {
            await _supabaseClient
                .from('sealed_messages')
                .delete()
                .eq('id', messageId);
          } catch (e) {
            debugPrint('[AnonymousMailbox] Realtime: failed to delete message $messageId: $e');
          }
        } else {
          // Remove from dedup set so it can be re-fetched on next reconnect
          _processedMessageIds.remove(messageId);
          debugPrint('[AnonymousMailbox] Realtime: message $messageId NOT confirmed saved locally, keeping on server for re-fetch');
        }
      } else {
        // Remove from dedup set so it can be retried on next reconnect
        _processedMessageIds.remove(messageId);
        debugPrint('[AnonymousMailbox] Realtime: failed to open envelope for $messageId, keeping on server for retry');
      }
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error handling Realtime message: $e');
    }
  }

  /// Handle a single call signal from Realtime INSERT event.
  Future<void> _handleRealtimeCallSignal(Map<String, dynamic> record) async {
    _lastActivityAt = DateTime.now();
    try {
      final signalId = record['id'] as String?;
      if (signalId == null) return;

      // Deduplication
      if (_processedSignalIds.contains(signalId)) {
        debugPrint('[AnonymousMailbox] Realtime: duplicate signal $signalId, skipping');
        return;
      }
      _processedSignalIds.add(signalId);
      if (_processedSignalIds.length > 1000) {
        final toRemove = _processedSignalIds.take(500).toList();
        _processedSignalIds.removeAll(toRemove);
      }

      final rawEncryptedSignal = record['encrypted_signal'] as String?;
      final rawSignalType = record['encrypted_signal_type'] as String?;
      if (rawEncryptedSignal == null) return;

      final encryptedSignal = _decodePostgresBytea(rawEncryptedSignal);
      debugPrint('[AnonymousMailbox] Realtime signal raw encrypted_signal (first 80): ${rawEncryptedSignal.substring(0, rawEncryptedSignal.length.clamp(0, 80))}');

      // Decrypt the sealed sender envelope (production path)
      Map<String, dynamic>? signalContent;
      Uint8List signalData;

      final sealedPrivateKey = await _secureStorage.read('sealed_sender_private_key');
      if (sealedPrivateKey != null) {
        final opened = await _sealedSender.openSealedEnvelope(
          sealedEnvelope: encryptedSignal,
          recipientSealedSenderPrivateKey: sealedPrivateKey,
        );
        if (opened != null) {
          final json = utf8.decode(opened.messageContent);
          signalContent = jsonDecode(json) as Map<String, dynamic>;
          signalData = opened.messageContent;
        } else {
          signalData = Uint8List(0);
        }
      } else {
        signalData = Uint8List(0);
      }

      // Fallback: plain base64 (backwards compat / testing without sealed sender)
      if (signalContent == null) {
        final decodedBytes = base64Decode(encryptedSignal);
        final signalJson = utf8.decode(decodedBytes);
        signalContent = jsonDecode(signalJson) as Map<String, dynamic>;
        signalData = decodedBytes;
      }

      final senderHashId = signalContent['sender_hash_id'] as String? ?? '';

      // Extract signal type: prefer from encrypted payload (opaque signaling),
      // fall back to encrypted_signal_type column for backwards compat
      String signalType;
      final payloadType = signalContent['type'] as String?;
      if (payloadType != null && payloadType.isNotEmpty) {
        signalType = payloadType;
      } else if (rawSignalType != null && rawSignalType != 'opaque') {
        signalType = _decodeSignalType(rawSignalType);
      } else {
        signalType = 'unknown';
      }

      final signal = ReceivedCallSignal(
        signalId: signalId,
        callerIdentityKey: senderHashId,
        signalType: signalType,
        signalData: signalData,
        timestamp: DateTime.tryParse(record['created_at'] as String? ?? '') ?? DateTime.now(),
      );

      debugPrint('[AnonymousMailbox] Realtime: decoded call signal type=$signalType, sender=$senderHashId');
      onCallSignalsReceived?.call([signal]);

      // Delete the signal from server (zero trace)
      try {
        await _supabaseClient
            .from('call_signals')
            .delete()
            .eq('id', signalId);
      } catch (e) {
        debugPrint('[AnonymousMailbox] Realtime: failed to delete signal $signalId: $e');
      }
    } catch (e, stackTrace) {
      debugPrint('[AnonymousMailbox] Error handling Realtime call signal: $e');
      debugPrint('[AnonymousMailbox] Stack: $stackTrace');
    }
  }

  /// One-time fetch of messages accumulated while offline.
  /// Uses PostgREST (RLS via SECURITY DEFINER function).
  Future<void> _initialFetchMessages() async {
    try {
      final token = _currentMailboxToken;
      if (token == null) return;

      final sealedPrivateKey = await _secureStorage.read('sealed_sender_private_key');
      if (sealedPrivateKey == null) return;

      final rows = await _supabaseClient
          .from('sealed_messages')
          .select('id, sealed_envelope, created_at')
          .eq('recipient_mailbox_token', token)
          .eq('is_delivered', false)
          .order('created_at', ascending: true);

      debugPrint('[AnonymousMailbox] Initial fetch: ${rows.length} pending messages');
      _lastActivityAt = DateTime.now();

      final messages = <ReceivedSealedMessage>[];

      for (final row in rows) {
        final messageId = row['id'] as String;

        if (_processedMessageIds.contains(messageId)) continue;
        _processedMessageIds.add(messageId);

        final envelope = row['sealed_envelope'] as String?;
        if (envelope == null) {
          _processedMessageIds.remove(messageId);
          continue;
        }

        final opened = await _sealedSender.openSealedEnvelope(
          sealedEnvelope: envelope,
          recipientSealedSenderPrivateKey: sealedPrivateKey,
        );

        if (opened != null) {
          messages.add(ReceivedSealedMessage(
            messageId: messageId,
            senderIdentityKey: opened.senderIdentityKey,
            content: opened.messageContent,
            timestamp: opened.timestamp,
            serverTimestamp: DateTime.tryParse(row['created_at'] as String? ?? '') ?? DateTime.now(),
          ));
        } else {
          // Remove from dedup set so it can be retried on next reconnect
          _processedMessageIds.remove(messageId);
          debugPrint('[AnonymousMailbox] Initial fetch: failed to open envelope for $messageId, keeping on server');
        }
      }

      if (messages.isNotEmpty) {
        debugPrint('[AnonymousMailbox] Initial fetch: delivering ${messages.length} decrypted messages');

        // If no callback registered (HomeScreen disposed), keep all messages on server
        if (onMessagesReceived == null) {
          debugPrint('[AnonymousMailbox] Initial fetch: no callback registered, keeping ${messages.length} messages on server');
          for (final msg in messages) {
            _processedMessageIds.remove(msg.messageId);
          }
          return;
        }

        // CRITICAL: Await the callback to confirm local save BEFORE deleting from server.
        final savedIds = await onMessagesReceived!.call(messages);

        // Only delete messages that were successfully saved locally
        for (final id in savedIds) {
          try {
            await _supabaseClient
                .from('sealed_messages')
                .delete()
                .eq('id', id);
          } catch (e) {
            debugPrint('[AnonymousMailbox] Failed to delete message $id: $e');
          }
        }

        // Remove unsaved message IDs from dedup set so they can be re-fetched on next reconnect
        for (final msg in messages) {
          if (!savedIds.contains(msg.messageId)) {
            _processedMessageIds.remove(msg.messageId);
          }
        }

        final keptCount = messages.length - savedIds.length;
        if (keptCount > 0) {
          debugPrint('[AnonymousMailbox] Initial fetch: $keptCount messages kept on server (not confirmed saved)');
        }
      }
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error in initial fetch messages: $e');
    }
  }

  /// One-time fetch of call signals accumulated while offline.
  Future<void> _initialFetchCallSignals() async {
    try {
      final token = _currentMailboxToken;
      if (token == null) return;

      final rows = await _supabaseClient
          .from('call_signals')
          .select('id, encrypted_signal, encrypted_signal_type, created_at')
          .eq('recipient_mailbox_token', token)
          .eq('is_consumed', false)
          .order('created_at', ascending: true);

      debugPrint('[AnonymousMailbox] Initial fetch: ${rows.length} pending call signals');

      final sealedPrivateKey = await _secureStorage.read('sealed_sender_private_key');
      final signals = <ReceivedCallSignal>[];
      final idsToDelete = <String>[];

      for (final row in rows) {
        final signalId = row['id'] as String;

        if (_processedSignalIds.contains(signalId)) continue;
        _processedSignalIds.add(signalId);

        final rawEncryptedSignal = row['encrypted_signal'] as String?;
        final rawSignalType = row['encrypted_signal_type'] as String?;
        if (rawEncryptedSignal == null) continue;

        try {
          final encryptedSignal = _decodePostgresBytea(rawEncryptedSignal);

          // Decrypt the sealed sender envelope (production path)
          Map<String, dynamic>? signalContent;
          Uint8List signalData;

          if (sealedPrivateKey != null) {
            final opened = await _sealedSender.openSealedEnvelope(
              sealedEnvelope: encryptedSignal,
              recipientSealedSenderPrivateKey: sealedPrivateKey,
            );
            if (opened != null) {
              final json = utf8.decode(opened.messageContent);
              signalContent = jsonDecode(json) as Map<String, dynamic>;
              signalData = opened.messageContent;
            } else {
              signalData = Uint8List(0);
            }
          } else {
            signalData = Uint8List(0);
          }

          // Fallback: plain base64 (backwards compat / testing without sealed sender)
          if (signalContent == null) {
            final decodedBytes = base64Decode(encryptedSignal);
            final signalJson = utf8.decode(decodedBytes);
            signalContent = jsonDecode(signalJson) as Map<String, dynamic>;
            signalData = decodedBytes;
          }

          final senderHashId = signalContent['sender_hash_id'] as String? ?? '';

          // Extract signal type from payload (opaque signaling) or column (backwards compat)
          String signalType;
          final payloadType = signalContent['type'] as String?;
          if (payloadType != null && payloadType.isNotEmpty) {
            signalType = payloadType;
          } else if (rawSignalType != null && rawSignalType != 'opaque') {
            signalType = _decodeSignalType(rawSignalType);
          } else {
            signalType = 'unknown';
          }

          signals.add(ReceivedCallSignal(
            signalId: signalId,
            callerIdentityKey: senderHashId,
            signalType: signalType,
            signalData: signalData,
            timestamp: DateTime.tryParse(row['created_at'] as String? ?? '') ?? DateTime.now(),
          ));
        } catch (e) {
          debugPrint('[AnonymousMailbox] Error decoding signal $signalId: $e');
        }

        idsToDelete.add(signalId);
      }

      if (signals.isNotEmpty) {
        debugPrint('[AnonymousMailbox] Initial fetch: delivering ${signals.length} call signals');
        onCallSignalsReceived?.call(signals);
      }

      for (final id in idsToDelete) {
        try {
          await _supabaseClient
              .from('call_signals')
              .delete()
              .eq('id', id);
        } catch (e) {
          debugPrint('[AnonymousMailbox] Failed to delete signal $id: $e');
        }
      }
    } catch (e) {
      debugPrint('[AnonymousMailbox] Error in initial fetch call signals: $e');
    }
  }

  void _startHealthCheck() {
    _healthCheckTimer?.cancel();
    _healthCheckTimer = Timer.periodic(_healthCheckInterval, (_) async {
      if (!_isConnected || _lastActivityAt == null) return;

      final inactivity = DateTime.now().difference(_lastActivityAt!);
      if (inactivity <= _inactivityThreshold) return;

      debugPrint('[AnonymousMailbox] Health check: ${inactivity.inSeconds}s inactivity, probing...');
      try {
        await _supabaseClient
            .from('sealed_messages')
            .select('id')
            .limit(0)
            .timeout(const Duration(seconds: 10));
        // Connection is alive
        _lastActivityAt = DateTime.now();
        debugPrint('[AnonymousMailbox] Health check: connection alive');
      } catch (e) {
        debugPrint('[AnonymousMailbox] Health check: probe failed ($e), reconnecting');
        stopRealtime();
        startRealtime();
      }
    });
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    const delays = [5, 10, 20, 30]; // secondes
    final seconds = delays[_reconnectAttempts.clamp(0, delays.length - 1)];
    _reconnectAttempts = (_reconnectAttempts + 1).clamp(0, delays.length);
    debugPrint('[AnonymousMailbox] Reconnect scheduled in ${seconds}s (attempt $_reconnectAttempts)');
    _reconnectTimer = Timer(Duration(seconds: seconds), () async {
      // Si le token n'est pas encore dérivé (init HTTP avait échoué), relancer l'init d'abord
      if (_currentMailboxToken == null) {
        final success = await initializeMailbox();
        if (!success) {
          _scheduleReconnect();
          return;
        }
      }
      startRealtime();
    });
  }

  /// Notifie un échec de connexion (init HTTP 502, etc.) et planifie une reconnexion.
  /// À appeler depuis HomeScreen quand initializeMailbox() retourne false.
  void notifyConnectionFailed() {
    _isConnected = false;
    onConnectionStatusChanged?.call(false);
    _scheduleReconnect();
  }

  /// Stop Realtime subscription.
  void stopRealtime() {
    _subGen++; // Invalide tous les callbacks en attente de l'ancien canal
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _showBannerTimer?.cancel();
    _showBannerTimer = null;
    _healthCheckTimer?.cancel();
    _healthCheckTimer = null;
    _reconnectAttempts = 0;
    _isConnected = false;
    if (_realtimeChannel != null) {
      _realtimeChannel!.unsubscribe();
      _realtimeChannel = null;
      debugPrint('[AnonymousMailbox] Realtime stopped');
    }
  }

  /// Reconnect: re-fetch pending messages/signals after app resumes.
  Future<void> reconnect() async {
    debugPrint('[AnonymousMailbox] Reconnecting: fetching missed messages/signals');
    await Future.wait([
      _initialFetchMessages(),
      _initialFetchCallSignals(),
    ]);
  }

  /// Get current mailbox token.
  String? get currentMailboxToken => _currentMailboxToken;

  /// Get current relay token.
  String? get currentRelayToken => _currentRelayToken;

  void dispose() {
    stopRealtime();
  }
}

/// Result of sending a sealed message
class SendResult {
  final bool success;
  final String? messageId;
  final String? timestamp;
  final String? error;

  SendResult({
    required this.success,
    this.messageId,
    this.timestamp,
    this.error,
  });
}

/// Result of revoking a message from the server
class RevokeResult {
  final bool success;
  final bool messageRevoked;
  final bool mediaRevoked;
  final String? error;

  RevokeResult({
    required this.success,
    required this.messageRevoked,
    required this.mediaRevoked,
    this.error,
  });
}

/// Received sealed message (after decryption)
class ReceivedSealedMessage {
  final String messageId;
  final String senderIdentityKey;
  final Uint8List content;
  final DateTime timestamp;
  final DateTime serverTimestamp;
  int retryCount;

  ReceivedSealedMessage({
    required this.messageId,
    required this.senderIdentityKey,
    required this.content,
    required this.timestamp,
    required this.serverTimestamp,
    this.retryCount = 0,
  });
}

/// Received call signal (after decryption)
class ReceivedCallSignal {
  final String signalId;
  final String callerIdentityKey;
  final String signalType;
  final Uint8List signalData;
  final DateTime timestamp;

  ReceivedCallSignal({
    required this.signalId,
    required this.callerIdentityKey,
    required this.signalType,
    required this.signalData,
    required this.timestamp,
  });
}
