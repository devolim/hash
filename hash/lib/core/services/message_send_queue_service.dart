import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/models/message.dart';
import '../../domain/models/contact.dart';
import '../../domain/models/queued_message.dart';
import '../../data/repositories/message_repository.dart';
import 'anonymous_mailbox_service.dart';
import 'edge_function_service.dart';
import 'local_storage_service.dart';
import 'media_storage_service.dart';
import 'signal_protocol_service.dart';
import '../utils/media_utils.dart';

/// Priorité d'envoi
enum SendPriority {
  normal, // Messages normaux (FIFO)
  high, // Retry manuel demandé par l'utilisateur
}

/// Item dans la file d'envoi
class _SendQueueItem {
  final Message message;
  final Contact contact;
  final String? filePath;
  final String? mimeType;
  final SendPriority priority;
  final DateTime createdAt;
  int retryCount;
  DateTime? nextRetryAt;

  _SendQueueItem({
    required this.message,
    required this.contact,
    this.filePath,
    this.mimeType,
    this.priority = SendPriority.normal,
    this.retryCount = 0,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}

/// Callback pour notifier les changements de status d'un message
typedef SendStatusCallback = void Function(
  String messageId,
  MessageStatus newStatus, {
  String? newServerId,
  Message? updatedMessage,
});

/// Service de file d'attente d'envoi de messages
/// Envoie séquentiellement les messages avec retry et gestion connectivité.
/// La queue est persistée dans Hive pour survivre aux crashes/redémarrages.
class MessageSendQueueService {
  final AnonymousMailboxService _mailboxService;
  final MediaStorageService _mediaStorage;
  final MessageRepository _messageRepository;
  final LocalStorageService _localStorage;
  final SignalProtocolService? _signalService;

  final Map<String, List<_SendQueueItem>> _queues = {};
  bool _isProcessing = false;
  bool _isPaused = false;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  Timer? _retryTimer;
  final Random _random = Random();

  static const int _maxRetries = 30;
  static const Duration _maxBackoff = Duration(minutes: 5);
  static const Duration _lifespan = Duration(hours: 24);

  /// Callback pour notifier ChatScreen des changements de status
  SendStatusCallback? onStatusChanged;

  MessageSendQueueService({
    required AnonymousMailboxService mailboxService,
    required MediaStorageService mediaStorage,
    required MessageRepository messageRepository,
    required LocalStorageService localStorage,
    SignalProtocolService? signalService,
  })  : _mailboxService = mailboxService,
        _mediaStorage = mediaStorage,
        _messageRepository = messageRepository,
        _localStorage = localStorage,
        _signalService = signalService {
    _setupConnectivityListener();
  }

  /// Calculate exponential backoff with jitter.
  /// Formula: min(2^attempt * 1000ms, 5min) * random(0.75, 1.25)
  Duration _calculateBackoff(int attempt) {
    final baseMs = min(
      (1 << attempt) * 1000, // 2^attempt * 1000ms
      _maxBackoff.inMilliseconds,
    );
    final jitter = 0.75 + _random.nextDouble() * 0.5; // 0.75 to 1.25
    return Duration(milliseconds: (baseMs * jitter).round());
  }

  /// Restore persisted queue items on app startup.
  Future<void> restoreQueue(List<Contact> contacts) async {
    final queuedItems = await _localStorage.getSendQueue();
    if (queuedItems.isEmpty) return;

    debugPrint('[SendQueue] Restoring ${queuedItems.length} queued messages from disk');

    final now = DateTime.now();
    for (final item in queuedItems) {
      // Filter expired items (>24h)
      if (now.difference(item.createdAt) > _lifespan) {
        debugPrint('[SendQueue] Message ${item.messageId} expired (>24h), removing');
        await _localStorage.removeFromSendQueue(item.messageId);
        continue;
      }

      // Find the matching contact
      final contact = contacts.where((c) => c.odid == item.contactId).firstOrNull;
      if (contact == null) {
        debugPrint('[SendQueue] Contact ${item.contactId} not found, removing queued item');
        await _localStorage.removeFromSendQueue(item.messageId);
        continue;
      }

      // Find the message in local storage
      final message = await _messageRepository.getMessageById(item.messageId);
      if (message == null) {
        debugPrint('[SendQueue] Message ${item.messageId} not found, removing queued item');
        await _localStorage.removeFromSendQueue(item.messageId);
        continue;
      }

      final queueItem = _SendQueueItem(
        message: message,
        contact: contact,
        filePath: item.filePath,
        mimeType: item.mimeType,
        priority: item.priority == 1 ? SendPriority.high : SendPriority.normal,
        retryCount: item.retryCount,
        createdAt: item.createdAt,
      );
      _queues.putIfAbsent(contact.odid, () => []).add(queueItem);
    }

    if (_queues.values.any((q) => q.isNotEmpty) && !_isPaused) {
      _processQueue();
    }
  }

  bool get isProcessing => _isProcessing;
  int get queueLength => _queues.values.fold(0, (sum, q) => sum + q.length);

  /// Ajoute un message à la file d'envoi
  Future<void> enqueueMessage(
    Message message, {
    required Contact contact,
    String? filePath,
    String? mimeType,
    SendPriority priority = SendPriority.normal,
  }) async {
    // Ne pas ajouter si déjà dans la file
    if (_queues[contact.odid]?.any((item) => item.message.id == message.id) ?? false) {
      debugPrint('[SendQueue] Message ${message.id} already in queue, skipping');
      return;
    }

    // Mettre le status à queued
    final queuedMsg = message.copyWith(status: MessageStatus.queued);
    await _messageRepository.saveMessageLocally(queuedMsg);
    onStatusChanged?.call(message.id, MessageStatus.queued, updatedMessage: queuedMsg);

    final item = _SendQueueItem(
      message: queuedMsg,
      contact: contact,
      filePath: filePath,
      mimeType: mimeType,
      priority: priority,
    );

    final contactQueue = _queues.putIfAbsent(contact.odid, () => []);
    // Insérer les high priority en tête
    if (priority == SendPriority.high) {
      contactQueue.insert(0, item);
    } else {
      contactQueue.add(item);
    }

    // Persist to Hive for crash recovery
    await _localStorage.addToSendQueue(QueuedMessage(
      messageId: message.id,
      contactId: contact.odid,
      filePath: filePath,
      mimeType: mimeType,
      createdAt: DateTime.now(),
      priority: priority == SendPriority.high ? 1 : 0,
    ));

    debugPrint('[SendQueue] Enqueued ${message.id} (priority: ${priority.name}, queue size: $queueLength)');

    // Lancer le traitement si pas déjà en cours
    if (!_isProcessing && !_isPaused) {
      _processQueue();
    }
  }

  /// Annule l'envoi d'un message en le retirant de la queue
  Future<bool> cancelMessage(String messageId) async {
    for (final queue in _queues.values) {
      final index = queue.indexWhere((item) => item.message.id == messageId);
      if (index != -1) {
        queue.removeAt(index);
        await _localStorage.removeFromSendQueue(messageId);
        debugPrint('[SendQueue] Cancelled message $messageId (queue size: $queueLength)');
        return true;
      }
    }
    return false;
  }

  /// Met en pause le traitement
  void pause() {
    _isPaused = true;
    _retryTimer?.cancel();
    debugPrint('[SendQueue] Paused');
  }

  /// Reprend le traitement
  void resume() {
    if (!_isPaused && _isProcessing) return;
    _isPaused = false;
    // Réinitialiser les backoff pour retenter immédiatement
    for (final queue in _queues.values) {
      for (final item in queue) {
        item.nextRetryAt = null;
      }
    }
    _retryTimer?.cancel();
    debugPrint('[SendQueue] Resumed');
    if (!_isProcessing && _queues.values.any((q) => q.isNotEmpty)) {
      _processQueue();
    }
  }

  /// Libère les ressources
  void dispose() {
    _connectivitySub?.cancel();
    _retryTimer?.cancel();
  }

  // ============ PRIVÉ ============

  void _setupConnectivityListener() {
    _connectivitySub = Connectivity().onConnectivityChanged.listen((results) {
      final hasConnection = results.any((r) => r != ConnectivityResult.none);
      if (hasConnection && _isPaused) {
        debugPrint('[SendQueue] Connection restored, resuming');
        resume();
      } else if (!hasConnection && !_isPaused) {
        debugPrint('[SendQueue] Connection lost, pausing');
        _isPaused = true;
      }
    });
  }

  Future<void> _processQueue() async {
    if (_isProcessing || _isPaused) return;
    _isProcessing = true;

    debugPrint('[SendQueue] Processing queue ($queueLength items across ${_queues.length} contacts)');

    while (_queues.values.any((q) => q.isNotEmpty) && !_isPaused) {
      bool anyProcessed = false;
      final contactIds = _queues.keys.toList(); // snapshot

      for (final contactId in contactIds) {
        final queue = _queues[contactId];
        if (queue == null || queue.isEmpty) continue;

        final now = DateTime.now();
        final readyIndex = queue.indexWhere(
          (item) => item.nextRetryAt == null || item.nextRetryAt!.isBefore(now),
        );
        if (readyIndex == -1) continue;

        await _sendItem(queue[readyIndex]);
        anyProcessed = true;
        break; // Un envoi par tour, puis re-boucle round-robin
      }

      if (!anyProcessed) {
        // Tous les items sont en attente de retry, programmer un timer
        _scheduleNextRetryTimer();
        break;
      }

      // Nettoyer les queues vides
      _queues.removeWhere((_, q) => q.isEmpty);
    }

    _isProcessing = false;
    debugPrint('[SendQueue] Queue processing complete');
  }

  void _scheduleNextRetryTimer() {
    DateTime? earliest;
    for (final queue in _queues.values) {
      for (final item in queue) {
        if (item.nextRetryAt != null) {
          if (earliest == null || item.nextRetryAt!.isBefore(earliest)) {
            earliest = item.nextRetryAt;
          }
        }
      }
    }
    if (earliest != null) {
      final delay = earliest.difference(DateTime.now());
      debugPrint('[SendQueue] All items waiting for retry, next in ${delay.inSeconds}s');
      _retryTimer?.cancel();
      _retryTimer = Timer(delay.isNegative ? Duration.zero : delay, () {
        if (!_isPaused) {
          _isProcessing = false;
          _processQueue();
        }
      });
    }
  }

  Future<void> _sendItem(_SendQueueItem item) async {
    final message = item.message;
    final contact = item.contact;
    debugPrint('[SendQueue] Sending ${message.id} (attempt ${item.retryCount + 1}/$_maxRetries)');

    // Vérifier connectivité
    final connectivityResults = await Connectivity().checkConnectivity();
    if (!connectivityResults.any((r) => r != ConnectivityResult.none)) {
      debugPrint('[SendQueue] No connection, pausing');
      _isPaused = true;
      return;
    }

    // Mettre le status à sending
    final sendingMsg = message.copyWith(status: MessageStatus.sending);
    await _messageRepository.saveMessageLocally(sendingMsg);
    onStatusChanged?.call(message.id, MessageStatus.sending, updatedMessage: sendingMsg);

    try {
      // Vérifier que le contact a les tokens nécessaires
      if (contact.mailboxToken == null ||
          contact.mailboxToken!.isEmpty ||
          contact.sealedSenderPublicKey == null ||
          contact.sealedSenderPublicKey!.isEmpty) {
        throw Exception('Contact non compatible. Supprimez et ré-ajoutez ce contact.');
      }

      if (contact.sendToken == null) {
        throw Exception('send_token_missing');
      }

      // Handle media upload if needed
      final isMediaMessage = item.filePath != null &&
          item.filePath!.isNotEmpty &&
          item.mimeType != null;

      MediaUploadResult? mediaUpload;
      String? stableMediaFileName;
      int? stableMediaFileSize;

      if (isMediaMessage) {
        // Copy file to media dir so it survives iOS UUID changes, then upload
        stableMediaFileName = await MediaUtils.copyToMediaDir(item.filePath!);
        final stableFilePath = '${MediaUtils.mediaDir}/$stableMediaFileName';

        mediaUpload = await _mediaStorage.uploadMedia(
          filePath: stableFilePath,
          mimeType: item.mimeType!,
        );

        // Update local message with media metadata — store filename only (not absolute path)
        stableMediaFileSize = File(stableFilePath).lengthSync();
        final updatedMessage = message.copyWith(
          mediaFileId: mediaUpload.fileId,
          mediaEncKey: mediaUpload.keyBase64,
          mediaEncIv: mediaUpload.ivBase64,
          mediaThumbnail: mediaUpload.thumbnail,
          mediaMimeType: item.mimeType,
          mediaDownloadStatus: 2,
          mediaWidth: mediaUpload.width,
          mediaHeight: mediaUpload.height,
          mediaName: stableMediaFileName,
          mediaSizeBytes: stableMediaFileSize,
          mediaUrl: stableMediaFileName,
          status: MessageStatus.sending,
        );
        await _messageRepository.saveMessageLocally(updatedMessage);
        onStatusChanged?.call(message.id, MessageStatus.sending, updatedMessage: updatedMessage);
      }

      // Increment anti-replay counter for this contact
      contact.sendCounter++;
      await contact.save();

      // Build message payload
      final payloadMap = <String, dynamic>{
        'type': message.type.name,
        'content': message.content,
        'timestamp': DateTime.now().toIso8601String(),
        'counter': contact.sendCounter,
      };

      // Add media metadata if present
      if (mediaUpload != null) {
        payloadMap['media'] = {
          'fileId': mediaUpload.fileId,
          'key': mediaUpload.keyBase64,
          'iv': mediaUpload.ivBase64,
          'fileName': stableMediaFileName,
          'fileSize': stableMediaFileSize,
          'mimeType': item.mimeType,
          'duration': message.mediaDurationSeconds,
          'thumbnail': mediaUpload.thumbnail,
          'width': mediaUpload.width,
          'height': mediaUpload.height,
          'isViewOnce': message.isViewOnce,
          'viewOnceDuration': message.viewOnceDuration,
          'downloadable': message.mediaDownloadable,
        };
      }

      // Encrypt with Double Ratchet (inner E2E layer) if available
      Uint8List messageBytes;
      if (_signalService != null && _signalService.isInitialized) {
        final innerBytes = Uint8List.fromList(utf8.encode(jsonEncode(payloadMap)));

        // Ensure we have a session with this contact
        if (!await _signalService.hasSession(contact.odid)) {
          debugPrint('[SendQueue] No DR session for ${contact.odid}, sending without DR');
          // No session yet — send plaintext (will be wrapped by sealed sender)
          messageBytes = innerBytes;
        } else {
          final encrypted = await _signalService.encryptMessage(contact.odid, innerBytes);
          final drEnvelope = {
            'dr_type': encrypted.type,
            'dr_ciphertext': base64Encode(encrypted.ciphertext),
          };
          messageBytes = Uint8List.fromList(utf8.encode(jsonEncode(drEnvelope)));
        }
      } else {
        messageBytes = Uint8List.fromList(utf8.encode(jsonEncode(payloadMap)));
      }

      // Validate message size (server limit: 100KB for sealed_envelope)
      if (messageBytes.length > 100000) {
        throw Exception('Message trop volumineux (${messageBytes.length} bytes, max 100000)');
      }

      // Send sealed message
      final result = await _mailboxService.sendSealedMessage(
        recipientMailboxToken: contact.mailboxToken!,
        messageContent: messageBytes,
        recipientSealedPublicKey: contact.sealedSenderPublicKey!,
        recipientRelayToken: contact.relayToken,
        sendToken: contact.sendToken,
      );

      if (result.success) {
        // Replace local ID with server ID
        Message sentMessage;
        if (result.messageId != null) {
          final replaced = await _messageRepository.replaceMessageId(message.id, result.messageId!);
          sentMessage = replaced?.copyWith(status: MessageStatus.sent) ?? message.copyWith(status: MessageStatus.sent);
          await _messageRepository.saveMessageLocally(sentMessage);
        } else {
          sentMessage = message.copyWith(status: MessageStatus.sent);
          await _messageRepository.updateMessageStatus(message.id, MessageStatus.sent);
        }

        _queues[item.contact.odid]?.remove(item);
        await _localStorage.removeFromSendQueue(message.id);
        onStatusChanged?.call(
          message.id,
          MessageStatus.sent,
          newServerId: result.messageId,
          updatedMessage: sentMessage,
        );
        debugPrint('[SendQueue] Send success: ${message.id}');
      } else {
        throw Exception(result.error ?? 'Erreur d\'envoi');
      }
    } catch (e) {
      debugPrint('[SendQueue] Send error for ${message.id}: $e');
      await _handleSendError(item, e);
    }
  }

  Future<void> _handleSendError(_SendQueueItem item, Object error) async {
    final message = item.message;

    // Erreurs permanentes : failed immédiatement
    if (_isPermanentError(error)) {
      debugPrint('[SendQueue] Permanent error for ${message.id}, marking as failed');
      final failedMsg = message.copyWith(status: MessageStatus.failed);
      await _messageRepository.saveMessageLocally(failedMsg);
      _queues[item.contact.odid]?.remove(item);
      await _localStorage.removeFromSendQueue(message.id);
      onStatusChanged?.call(message.id, MessageStatus.failed, updatedMessage: failedMsg);
      return;
    }

    // Vérifier le lifespan 24h
    if (DateTime.now().difference(item.createdAt) > _lifespan) {
      debugPrint('[SendQueue] Message ${message.id} expired (>24h), marking as failed');
      final failedMsg = message.copyWith(status: MessageStatus.failed);
      await _messageRepository.saveMessageLocally(failedMsg);
      _queues[item.contact.odid]?.remove(item);
      await _localStorage.removeFromSendQueue(message.id);
      onStatusChanged?.call(message.id, MessageStatus.failed, updatedMessage: failedMsg);
      return;
    }

    // Rate limit 429 : attendre 60s, ne compte pas dans les retries
    if (error is EdgeFunctionException && error.statusCode == 429) {
      debugPrint('[SendQueue] Rate limited for ${message.id}, waiting 60s');
      item.nextRetryAt = DateTime.now().add(const Duration(seconds: 60));
      // Ne pas incrémenter retryCount
      return;
    }

    // Erreur temporaire : retry avec backoff exponentiel + jitter
    item.retryCount++;

    if (item.retryCount >= _maxRetries) {
      debugPrint('[SendQueue] Max retries reached for ${message.id}, marking as failed');
      final failedMsg = message.copyWith(status: MessageStatus.failed);
      await _messageRepository.saveMessageLocally(failedMsg);
      _queues[item.contact.odid]?.remove(item);
      await _localStorage.removeFromSendQueue(message.id);
      onStatusChanged?.call(message.id, MessageStatus.failed, updatedMessage: failedMsg);
    } else {
      final delay = _calculateBackoff(item.retryCount);
      item.nextRetryAt = DateTime.now().add(delay);
      // Update retry count in persistent queue
      await _localStorage.updateSendQueueRetry(message.id, item.retryCount, item.nextRetryAt!);
      debugPrint('[SendQueue] Retry ${item.retryCount}/$_maxRetries in ${delay.inSeconds}s for ${message.id}');
    }
  }

  /// Détermine si une erreur est permanente (pas de retry)
  bool _isPermanentError(Object error) {
    if (error is EdgeFunctionException) {
      // Codes structurés (prioritaires, fiables)
      final code = error.errorCode;
      if (code != null) {
        return const {
          'INVALID_SEND_TOKEN', 'INVALID_MAILBOX_TOKEN',
          'MISSING_ENVELOPE', 'INVALID_ENVELOPE',
          'RECIPIENT_NOT_FOUND', 'MESSAGE_TOO_LARGE',
        }.contains(code);
      }
      // Fallback status code (rétrocompatibilité)
      if (error.statusCode >= 400 && error.statusCode < 500 && error.statusCode != 429) {
        return true;
      }
    }

    // Session transférée : pas de retry
    if (error is SessionTransferredException) return true;

    // Erreurs métier locales : pas de retry
    final errorStr = error.toString();
    if (errorStr.contains('send_token_missing')) return true;
    if (errorStr.contains('Contact non compatible')) return true;

    return false;
  }
}
