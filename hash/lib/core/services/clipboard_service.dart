import 'dart:async';
import 'package:flutter/services.dart';

/// Service for clipboard operations with automatic expiry.
/// Clears the clipboard after a configurable duration (default 90s)
/// for security, similar to Signal's implementation.
class ClipboardService {
  static final ClipboardService _instance = ClipboardService._internal();
  factory ClipboardService() => _instance;
  ClipboardService._internal();

  Timer? _expiryTimer;

  static const _defaultExpiry = Duration(seconds: 90);

  /// Copy text to clipboard with automatic expiry.
  /// After [expiry] duration, the clipboard is cleared.
  /// A new copy cancels the previous expiry timer.
  Future<void> copyWithAutoExpiry(
    String text, {
    Duration expiry = _defaultExpiry,
  }) async {
    // Cancel any previous expiry timer
    _expiryTimer?.cancel();

    await Clipboard.setData(ClipboardData(text: text));

    // Schedule clipboard clear
    _expiryTimer = Timer(expiry, () {
      Clipboard.setData(const ClipboardData(text: ''));
    });
  }

  /// Cancel any pending clipboard expiry timer.
  void cancelExpiry() {
    _expiryTimer?.cancel();
    _expiryTimer = null;
  }
}
