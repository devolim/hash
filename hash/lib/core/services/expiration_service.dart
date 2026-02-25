import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../domain/models/message.dart';
import '../../domain/models/call_message.dart';
import 'local_storage_service.dart';
import '../utils/media_utils.dart';

/// Service that manages automatic deletion of expired messages.
///
/// Maintains a timer pointing to the next message expiration.
/// When a message expires, it deletes the message (and media file),
/// then reschedules for the next expiration.
class ExpirationService {
  final LocalStorageService _localStorage;

  Timer? _expirationTimer;
  bool _isInitialized = false;

  ExpirationService(this._localStorage);

  bool get isInitialized => _isInitialized;

  /// Initialize the service: scan all messages and schedule the next expiration.
  Future<void> init() async {
    if (_isInitialized) return;
    _isInitialized = true;
    await reschedule();
    debugPrint('[ExpirationService] Initialized');
  }

  /// Reschedule the expiration timer.
  /// Called when a new message is received/read or after an expiration fires.
  Future<void> reschedule() async {
    _expirationTimer?.cancel();

    final now = DateTime.now();
    DateTime? nextExpiration;

    // Scan all messages for the nearest expiresAt
    try {
      final allMessages = await _localStorage.getAllMessages();
      for (final message in allMessages) {
        // Convert paused ephemeral timers to active expiresAt
        if (message.expiresAt == null && message.ephemeralRemainingSeconds != null) {
          message.expiresAt = now.add(Duration(seconds: message.ephemeralRemainingSeconds!));
          message.ephemeralRemainingSeconds = null;
          await _localStorage.saveMessage(message);
          debugPrint('[ExpirationService] Resumed paused timer for ${message.id}: ${message.expiresAt}');
        }

        final expiresAt = message.expiresAt ?? message.maxExpiresAt;
        if (expiresAt != null && expiresAt.isAfter(now)) {
          if (nextExpiration == null || expiresAt.isBefore(nextExpiration)) {
            nextExpiration = expiresAt;
          }
        } else if (expiresAt != null && expiresAt.isBefore(now)) {
          // Already expired — delete immediately
          await _deleteMessage(message);
        }
      }

      // Also check call messages
      final allCallMessages = await _localStorage.getAllCallMessages();
      for (final callMsg in allCallMessages) {
        if (callMsg.expiresAt != null && callMsg.expiresAt!.isAfter(now)) {
          if (nextExpiration == null || callMsg.expiresAt!.isBefore(nextExpiration)) {
            nextExpiration = callMsg.expiresAt!;
          }
        } else if (callMsg.expiresAt != null && callMsg.expiresAt!.isBefore(now)) {
          await _deleteCallMessage(callMsg);
        }
      }
    } catch (e) {
      debugPrint('[ExpirationService] Error scanning messages: $e');
    }

    if (nextExpiration != null) {
      final delay = nextExpiration.difference(now);
      final safeDelay = delay.isNegative ? Duration.zero : delay;
      _expirationTimer = Timer(safeDelay, _onExpirationFired);
      debugPrint('[ExpirationService] Next expiration in ${safeDelay.inSeconds}s');
    } else {
      debugPrint('[ExpirationService] No pending expirations');
    }
  }

  void _onExpirationFired() async {
    debugPrint('[ExpirationService] Expiration timer fired');
    await reschedule(); // Will delete expired and reschedule next
  }

  Future<void> _deleteMessage(Message message) async {
    try {
      // Delete local media file if exists (resolve path for iOS UUID changes)
      if (message.mediaUrl != null && message.mediaUrl!.isNotEmpty) {
        final resolvedPath = MediaUtils.resolvePath(message.mediaUrl) ?? message.mediaUrl!;
        final file = File(resolvedPath);
        if (await file.exists()) {
          await file.delete();
          debugPrint('[ExpirationService] Deleted media file: $resolvedPath');
        }
      }

      // Delete message from Hive
      await _localStorage.deleteMessage(message.id);
      debugPrint('[ExpirationService] Deleted expired message: ${message.id}');
    } catch (e) {
      debugPrint('[ExpirationService] Error deleting message ${message.id}: $e');
    }
  }

  Future<void> _deleteCallMessage(CallMessage callMsg) async {
    try {
      await _localStorage.deleteCallMessage(callMsg.id);
      debugPrint('[ExpirationService] Deleted expired call message: ${callMsg.id}');
    } catch (e) {
      debugPrint('[ExpirationService] Error deleting call message ${callMsg.id}: $e');
    }
  }

  void dispose() {
    _expirationTimer?.cancel();
    _isInitialized = false;
  }
}
