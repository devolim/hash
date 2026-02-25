import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../domain/models/contact.dart';
import 'anonymous_mailbox_service.dart';

/// Service for sending and receiving typing indicators.
///
/// Uses the existing call signaling infrastructure (send-call-signal)
/// with signalType 'typing' for real-time typing notifications.
///
/// Debouncing: max 1 signal per 3 seconds.
/// Timeout: 5 seconds of inactivity → stop.
/// Auto-stop: when a message is sent.
class TypingIndicatorService {
  final AnonymousMailboxService _mailboxService;

  Timer? _debounceTimer;
  Timer? _timeoutTimer;
  DateTime? _lastSentAt;
  String? _currentContactId;

  static const _debounceInterval = Duration(seconds: 3);
  static const _timeout = Duration(seconds: 5);

  // Stream for incoming typing events
  final _typingController = StreamController<TypingEvent>.broadcast();
  Stream<TypingEvent> get typingEvents => _typingController.stream;

  // Track active typing contacts with their timeout timers
  final Map<String, Timer> _activeTypers = {};

  TypingIndicatorService(this._mailboxService);

  /// Notify that the user is typing to a contact.
  /// Debounced: won't send more than once per 3 seconds.
  Future<void> onTyping(Contact contact) async {
    _currentContactId = contact.odid;

    // Reset inactivity timer
    _timeoutTimer?.cancel();
    _timeoutTimer = Timer(_timeout, () => onStopTyping(contact));

    // Debounce: check if we recently sent
    final now = DateTime.now();
    if (_lastSentAt != null && now.difference(_lastSentAt!) < _debounceInterval) {
      return;
    }

    _lastSentAt = now;

    try {
      if (contact.mailboxToken == null || contact.sealedSenderPublicKey == null) {
        return;
      }

      await _mailboxService.sendTypingIndicator(
        recipientMailboxToken: contact.mailboxToken!,
        recipientSealedPublicKey: contact.sealedSenderPublicKey!,
        sendToken: contact.sendToken,
      );
    } catch (e) {
      debugPrint('[TypingIndicator] Error sending typing indicator: $e');
    }
  }

  /// Stop typing indicator (called on message send or inactivity).
  void onStopTyping(Contact contact) {
    _timeoutTimer?.cancel();
    _debounceTimer?.cancel();
    _lastSentAt = null;
    _currentContactId = null;
  }

  /// Handle an incoming typing event from a contact.
  void handleIncomingTyping(String contactId) {
    // Cancel existing timeout for this contact
    _activeTypers[contactId]?.cancel();

    // Emit typing event
    _typingController.add(TypingEvent(contactId: contactId, isTyping: true));

    // Set timeout to clear typing status
    _activeTypers[contactId] = Timer(_timeout, () {
      _typingController.add(TypingEvent(contactId: contactId, isTyping: false));
      _activeTypers.remove(contactId);
    });
  }

  /// Check if a contact is currently typing
  bool isTyping(String contactId) => _activeTypers.containsKey(contactId);

  void dispose() {
    _debounceTimer?.cancel();
    _timeoutTimer?.cancel();
    for (final timer in _activeTypers.values) {
      timer.cancel();
    }
    _activeTypers.clear();
    _typingController.close();
  }
}

class TypingEvent {
  final String contactId;
  final bool isTyping;

  TypingEvent({required this.contactId, required this.isTyping});
}
