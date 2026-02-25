import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/models/contact.dart';
import '../../domain/models/queued_receipt.dart';
import 'anonymous_mailbox_service.dart';
import 'local_storage_service.dart';

/// Item dans la file d'attente de receipts (en mémoire)
class _ReceiptQueueItem {
  final String id;
  final String contactId;
  final String receiptType;
  final List<String> messageIds;
  final Contact contact;
  final DateTime createdAt;
  int retryCount;
  DateTime? nextRetryAt;

  _ReceiptQueueItem({
    required this.id,
    required this.contactId,
    required this.receiptType,
    required this.messageIds,
    required this.contact,
    required this.createdAt,
    this.retryCount = 0,
    this.nextRetryAt,
  });
}

/// Service de file d'attente persistante pour les accusés de réception.
/// Calqué sur MessageSendQueueService : retry exponentiel, persistance Hive,
/// reprise sur connectivité réseau.
class ReceiptQueueService {
  final AnonymousMailboxService _mailboxService;
  final LocalStorageService _localStorage;

  final Map<String, List<_ReceiptQueueItem>> _queues = {};
  bool _isProcessing = false;
  bool _isPaused = false;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  Timer? _retryTimer;
  final Random _random = Random();

  static const int _maxRetries = 30;
  static const Duration _maxBackoff = Duration(minutes: 5);
  static const Duration _lifespan = Duration(hours: 24);
  static const int _batchLimit = 200;

  ReceiptQueueService({
    required AnonymousMailboxService mailboxService,
    required LocalStorageService localStorage,
  })  : _mailboxService = mailboxService,
        _localStorage = localStorage {
    _setupConnectivityListener();
  }

  /// Calculate exponential backoff with jitter.
  /// Formula: min(2^attempt * 1000ms, 5min) * random(0.75, 1.25)
  Duration _calculateBackoff(int attempt) {
    final baseMs = min(
      (1 << attempt) * 1000,
      _maxBackoff.inMilliseconds,
    );
    final jitter = 0.75 + _random.nextDouble() * 0.5;
    return Duration(milliseconds: (baseMs * jitter).round());
  }

  /// Enqueue a receipt for sending. Deduplicates by contactId + receiptType + messageIds.
  Future<void> enqueueReceipt({
    required String contactId,
    required String receiptType,
    required List<String> messageIds,
    required Contact contact,
  }) async {
    if (messageIds.isEmpty) return;

    // Limiter la taille du batch
    final ids = messageIds.length > _batchLimit
        ? messageIds.sublist(0, _batchLimit)
        : messageIds;

    // Déduplique : même contactId + même type + mêmes messageIds
    final contactQueue = _queues[contactId];
    final isDuplicate = contactQueue?.any((item) =>
        item.receiptType == receiptType &&
        _listEquals(item.messageIds, ids)) ?? false;

    if (isDuplicate) {
      debugPrint('[ReceiptQueue] Duplicate receipt skipped ($receiptType for $contactId)');
      return;
    }

    final id = '${contactId}_${receiptType}_${DateTime.now().millisecondsSinceEpoch}';
    final now = DateTime.now();

    _queues.putIfAbsent(contactId, () => []).add(_ReceiptQueueItem(
      id: id,
      contactId: contactId,
      receiptType: receiptType,
      messageIds: ids,
      contact: contact,
      createdAt: now,
    ));

    // Persist to Hive
    await _localStorage.addToReceiptQueue(QueuedReceipt(
      id: id,
      contactId: contactId,
      receiptType: receiptType,
      messageIds: ids,
      createdAt: now,
    ));

    debugPrint('[ReceiptQueue] Enqueued $receiptType for ${ids.length} messages to $contactId (queue: ${_queues.values.fold(0, (int sum, List<_ReceiptQueueItem> q) => sum + q.length)})');

    if (!_isProcessing && !_isPaused) {
      _processQueue();
    }
  }

  int get queueLength => _queues.values.fold(0, (sum, q) => sum + q.length);

  /// Restore persisted queue items on app startup.
  Future<void> restoreQueue(List<Contact> contacts) async {
    final queuedItems = await _localStorage.getReceiptQueue();
    if (queuedItems.isEmpty) return;

    final now = DateTime.now();
    int restored = 0;
    int expired = 0;

    for (final item in queuedItems) {
      // Filter expired receipts (>24h)
      if (now.difference(item.createdAt) > _lifespan) {
        await _localStorage.removeFromReceiptQueue(item.id);
        expired++;
        continue;
      }

      final contact = contacts.where((c) => c.odid == item.contactId).firstOrNull;
      if (contact == null) {
        await _localStorage.removeFromReceiptQueue(item.id);
        continue;
      }

      _queues.putIfAbsent(item.contactId, () => []).add(_ReceiptQueueItem(
        id: item.id,
        contactId: item.contactId,
        receiptType: item.receiptType,
        messageIds: item.messageIds,
        contact: contact,
        createdAt: item.createdAt,
        retryCount: item.retryCount,
        nextRetryAt: item.nextRetryAt,
      ));
      restored++;
    }

    if (restored > 0 || expired > 0) {
      debugPrint('[ReceiptQueue] Restored $restored, expired $expired from disk');
    }

    if (_queues.values.any((q) => q.isNotEmpty) && !_isPaused) {
      _processQueue();
    }
  }

  void dispose() {
    _connectivitySub?.cancel();
    _retryTimer?.cancel();
  }

  // ============ PRIVÉ ============

  void _setupConnectivityListener() {
    _connectivitySub = Connectivity().onConnectivityChanged.listen((results) {
      final hasConnection = results.any((r) => r != ConnectivityResult.none);
      if (hasConnection && _isPaused) {
        debugPrint('[ReceiptQueue] Connection restored, resuming');
        _isPaused = false;
        if (!_isProcessing && _queues.values.any((q) => q.isNotEmpty)) {
          _processQueue();
        }
      } else if (!hasConnection && !_isPaused) {
        debugPrint('[ReceiptQueue] Connection lost, pausing');
        _isPaused = true;
      }
    });
  }

  Future<void> _processQueue() async {
    if (_isProcessing || _isPaused) return;
    _isProcessing = true;

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

        await _sendReceipt(queue[readyIndex]);
        anyProcessed = true;
        break; // Un envoi par tour, puis re-boucle round-robin
      }

      if (!anyProcessed) {
        // Tous les items attendent un retry, programmer un timer
        _scheduleNextRetryTimer();
        break;
      }

      // Nettoyer les queues vides
      _queues.removeWhere((_, q) => q.isEmpty);
    }

    _isProcessing = false;
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
      _retryTimer?.cancel();
      _retryTimer = Timer(delay.isNegative ? Duration.zero : delay, () {
        if (!_isPaused) {
          _isProcessing = false;
          _processQueue();
        }
      });
    }
  }

  Future<void> _sendReceipt(_ReceiptQueueItem item) async {
    debugPrint('[ReceiptQueue] Sending ${item.receiptType} (attempt ${item.retryCount + 1}/$_maxRetries)');

    try {
      if (item.contact.mailboxToken == null || item.contact.sealedSenderPublicKey == null) {
        // Permanent: contact missing keys
        _removeItem(item);
        return;
      }

      final payload = jsonEncode({
        'type': item.receiptType,
        'messageIds': item.messageIds,
        'timestamp': DateTime.now().toIso8601String(),
      });

      final messageBytes = Uint8List.fromList(utf8.encode(payload));
      await _mailboxService.sendSealedMessage(
        recipientMailboxToken: item.contact.mailboxToken!,
        messageContent: messageBytes,
        recipientSealedPublicKey: item.contact.sealedSenderPublicKey!,
        recipientRelayToken: item.contact.relayToken,
        sendToken: item.contact.sendToken,
        contentHint: 'receipt',
      );

      debugPrint('[ReceiptQueue] ${item.receiptType} sent for ${item.messageIds.length} messages');
      _removeItem(item);
    } catch (e) {
      debugPrint('[ReceiptQueue] Error sending ${item.receiptType}: $e');
      _handleError(item, e);
    }
  }

  void _handleError(_ReceiptQueueItem item, Object error) {
    // Check lifespan
    if (DateTime.now().difference(item.createdAt) > _lifespan) {
      debugPrint('[ReceiptQueue] Receipt ${item.id} expired (>24h), abandoning');
      _removeItem(item);
      return;
    }

    item.retryCount++;

    if (item.retryCount >= _maxRetries) {
      debugPrint('[ReceiptQueue] Max retries reached for ${item.id}, abandoning');
      _removeItem(item);
    } else {
      final delay = _calculateBackoff(item.retryCount);
      item.nextRetryAt = DateTime.now().add(delay);
      _localStorage.updateReceiptQueueRetry(item.id, item.retryCount, item.nextRetryAt!);
      debugPrint('[ReceiptQueue] Retry ${item.retryCount}/$_maxRetries in ${delay.inSeconds}s');
    }
  }

  void _removeItem(_ReceiptQueueItem item) {
    _queues[item.contactId]?.remove(item);
    _localStorage.removeFromReceiptQueue(item.id);
  }

  bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
