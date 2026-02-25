import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/models/message.dart';
import '../../data/repositories/message_repository.dart';
import 'edge_function_service.dart';
import 'media_storage_service.dart';

/// Priorité de téléchargement
enum DownloadPriority {
  normal, // P1 : messages normaux (FIFO)
  recent, // P2 : messages récents (<1h)
  viewOnce, // P3 : messages vue unique (urgents)
}

/// Item dans la file de téléchargement
class _DownloadQueueItem {
  final Message message;
  final DownloadPriority priority;
  int retryCount = 0;
  DateTime? nextRetryAt;

  _DownloadQueueItem({
    required this.message,
    required this.priority,
  });
}

/// Service de file d'attente de téléchargement média
/// Télécharge séquentiellement les médias reçus avec retry et gestion connectivité
class MediaDownloadQueueService {
  final MediaStorageService _mediaStorage;
  final MessageRepository _messageRepository;

  final List<_DownloadQueueItem> _queue = [];
  bool _isProcessing = false;
  bool _isPaused = false;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  Timer? _retryTimer;

  static const int _maxRetries = 3;
  static const List<Duration> _retryDelays = [
    Duration.zero,
    Duration(seconds: 5),
    Duration(seconds: 15),
  ];

  MediaDownloadQueueService({
    required MediaStorageService mediaStorage,
    required MessageRepository messageRepository,
  })  : _mediaStorage = mediaStorage,
        _messageRepository = messageRepository {
    _setupConnectivityListener();
  }

  bool get isProcessing => _isProcessing;

  /// Ajoute un message à la file de téléchargement
  Future<void> enqueueDownload(Message message) async {
    // Ne pas ajouter si déjà dans la file
    if (_queue.any((item) => item.message.id == message.id)) {
      return;
    }

    // Ne pas ajouter si déjà téléchargé
    if (message.mediaDownloadStatus == 2) return;

    // Déterminer la priorité
    final priority = _determinePriority(message);

    _queue.add(_DownloadQueueItem(
      message: message,
      priority: priority,
    ));

    // Trier la file par priorité
    _sortQueue();

    debugPrint('[DownloadQueue] Enqueued ${message.id} (priority: ${priority.name}, queue size: ${_queue.length})');

    // Lancer le traitement si pas déjà en cours
    if (!_isProcessing && !_isPaused) {
      _processQueue();
    }
  }

  /// Relance les téléchargements échoués
  Future<void> retryFailed() async {
    // Pas besoin de scanner Hive, les items failed restent dans la file
    for (final item in _queue) {
      if (item.retryCount >= _maxRetries) {
        item.retryCount = 0;
        item.nextRetryAt = null;
      }
    }
    if (!_isProcessing && !_isPaused) {
      _processQueue();
    }
  }

  /// Met en pause le traitement
  void pause() {
    _isPaused = true;
    _retryTimer?.cancel();
    debugPrint('[DownloadQueue] Paused');
  }

  /// Reprend le traitement et traite les messages en attente existants
  void resume() {
    if (!_isPaused && _isProcessing) return;
    _isPaused = false;
    debugPrint('[DownloadQueue] Resumed');
    if (!_isProcessing) {
      _processQueue();
    }
  }

  /// Libère les ressources
  void dispose() {
    _connectivitySub?.cancel();
    _retryTimer?.cancel();
  }

  // ============ PRIVÉ ============

  DownloadPriority _determinePriority(Message message) {
    if (message.isViewOnce) return DownloadPriority.viewOnce;

    final age = DateTime.now().difference(message.timestamp);
    if (age.inMinutes < 60) return DownloadPriority.recent;

    return DownloadPriority.normal;
  }

  void _sortQueue() {
    _queue.sort((a, b) {
      // Priorité décroissante (viewOnce > recent > normal)
      final priorityCompare = b.priority.index.compareTo(a.priority.index);
      if (priorityCompare != 0) return priorityCompare;
      // FIFO pour même priorité
      return a.message.timestamp.compareTo(b.message.timestamp);
    });
  }

  void _setupConnectivityListener() {
    _connectivitySub = Connectivity().onConnectivityChanged.listen((results) {
      final hasConnection = results.any((r) => r != ConnectivityResult.none);
      if (hasConnection && _isPaused) {
        debugPrint('[DownloadQueue] Connection restored, resuming');
        resume();
      } else if (!hasConnection && !_isPaused) {
        debugPrint('[DownloadQueue] Connection lost, pausing');
        _isPaused = true;
      }
    });
  }

  Future<void> _processQueue() async {
    if (_isProcessing || _isPaused) return;
    _isProcessing = true;

    debugPrint('[DownloadQueue] Processing queue (${_queue.length} items)');

    while (_queue.isNotEmpty && !_isPaused) {
      // Trouver le prochain item prêt (pas en attente de retry)
      final now = DateTime.now();
      final readyIndex = _queue.indexWhere(
        (item) => item.nextRetryAt == null || item.nextRetryAt!.isBefore(now),
      );

      if (readyIndex == -1) {
        // Tous les items sont en attente de retry, programmer un timer
        final nextRetry = _queue
            .where((item) => item.nextRetryAt != null)
            .reduce((a, b) => a.nextRetryAt!.isBefore(b.nextRetryAt!) ? a : b);
        final delay = nextRetry.nextRetryAt!.difference(now);
        debugPrint('[DownloadQueue] All items waiting for retry, next in ${delay.inSeconds}s');
        _retryTimer?.cancel();
        _retryTimer = Timer(delay.isNegative ? Duration.zero : delay, () {
          if (!_isPaused) _processQueue();
        });
        break;
      }

      final item = _queue[readyIndex];
      await _downloadItem(item);
    }

    _isProcessing = false;
    debugPrint('[DownloadQueue] Queue processing complete');
  }

  Future<void> _downloadItem(_DownloadQueueItem item) async {
    final message = item.message;
    debugPrint('[DownloadQueue] Downloading ${message.id} (attempt ${item.retryCount + 1}/$_maxRetries)');

    // Vérifier connectivité
    final connectivityResults = await Connectivity().checkConnectivity();
    if (!connectivityResults.any((r) => r != ConnectivityResult.none)) {
      debugPrint('[DownloadQueue] No connection, pausing');
      _isPaused = true;
      return;
    }

    // Marquer en cours de téléchargement
    final downloadingMsg = message.copyWith(mediaDownloadStatus: 1);
    await _messageRepository.saveMessageLocally(downloadingMsg);

    try {
      if (message.mediaFileId == null ||
          message.mediaEncKey == null ||
          message.mediaEncIv == null) {
        debugPrint('[DownloadQueue] Missing media info for ${message.id}');
        _queue.remove(item);
        return;
      }

      final fileName = message.mediaName ?? '${message.mediaFileId}.dat';
      final localPath = await _mediaStorage.downloadMedia(
        fileId: message.mediaFileId!,
        keyBase64: message.mediaEncKey!,
        ivBase64: message.mediaEncIv!,
        fileName: fileName,
      );

      if (localPath != null) {
        // Succès : mettre à jour le message, nettoyer les clés
        final doneMsg = message.copyWith(
          mediaUrl: localPath,
          mediaDownloadStatus: 2,
          mediaEncKey: null,
          mediaEncIv: null,
        );
        await _messageRepository.saveMessageLocally(doneMsg);
        _queue.remove(item);
        debugPrint('[DownloadQueue] Download success: ${message.id}');
      } else {
        throw Exception('Download returned null');
      }
    } catch (e) {
      debugPrint('[DownloadQueue] Download error for ${message.id}: $e');

      final isExpired = (e is EdgeFunctionException && e.errorCode == 'MEDIA_EXPIRED') ||
          e.toString().contains('expired') || e.toString().contains('404');

      if (isExpired) {
        // Média expiré, ne pas réessayer
        final expiredMsg = message.copyWith(mediaDownloadStatus: 4);
        await _messageRepository.saveMessageLocally(expiredMsg);
        _queue.remove(item);
        debugPrint('[DownloadQueue] Media expired: ${message.id}');
        return;
      }

      item.retryCount++;

      if (item.retryCount >= _maxRetries) {
        // Max retries atteint, marquer comme échoué
        final failedMsg = message.copyWith(mediaDownloadStatus: 3);
        await _messageRepository.saveMessageLocally(failedMsg);
        _queue.remove(item);
        debugPrint('[DownloadQueue] Max retries reached for ${message.id}, marked as failed');
      } else {
        // Programmer le retry avec backoff
        final delay = _retryDelays[item.retryCount];
        item.nextRetryAt = DateTime.now().add(delay);
        // Remettre le status en pending pendant l'attente
        final pendingMsg = message.copyWith(mediaDownloadStatus: 0);
        await _messageRepository.saveMessageLocally(pendingMsg);
        debugPrint('[DownloadQueue] Retry ${item.retryCount}/$_maxRetries in ${delay.inSeconds}s for ${message.id}');
      }
    }
  }
}
