import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

/// Service to sync notification preferences to native UserDefaults (iOS)
/// This allows the Notification Service Extension to read preferences
class NotificationPreferencesSync {
  static const _channel = MethodChannel('com.hash.app/notification_preferences');

  /// Sync notification preferences to native storage (iOS UserDefaults with App Groups)
  static Future<void> syncPreferences({
    required String contentLevel,
    required String customTitle,
    required String customBody,
    String notificationSound = 'shadow',
    bool messageNotificationsEnabled = true,
    bool callNotificationsEnabled = true,
  }) async {
    // Only needed on iOS for the Notification Service Extension
    if (!Platform.isIOS) return;

    try {
      await _channel.invokeMethod('syncNotificationPreferences', {
        'contentLevel': contentLevel,
        'customTitle': customTitle,
        'customBody': customBody,
        'notificationSound': notificationSound,
        'messageNotificationsEnabled': messageNotificationsEnabled,
        'callNotificationsEnabled': callNotificationsEnabled,
      });
      debugPrint('[NotificationPreferencesSync] Synced to UserDefaults: level=$contentLevel, sound=$notificationSound, msgNotif=$messageNotificationsEnabled, callNotif=$callNotificationsEnabled');
    } catch (e) {
      debugPrint('[NotificationPreferencesSync] Error syncing: $e');
    }
  }

  /// Sync per-contact notification settings to native storage (iOS UserDefaults).
  /// [contactSettings] maps hashId to notification preferences per contact.
  /// Sent as a JSON string to avoid NSNull issues in UserDefaults.
  static Future<void> syncContactNotificationSettings(
      Map<String, Map<String, dynamic>> contactSettings) async {
    if (!Platform.isIOS) return;

    try {
      // Encode as JSON string to avoid NSNull crash in UserDefaults
      final jsonString = const JsonEncoder().convert(contactSettings);
      await _channel.invokeMethod('syncContactNotificationSettings', {
        'contactSettingsJson': jsonString,
      });
      debugPrint('[NotificationPreferencesSync] Contact notification settings synced (${contactSettings.length} contacts)');
    } catch (e) {
      debugPrint('[NotificationPreferencesSync] Error syncing contact settings: $e');
    }
  }
}
