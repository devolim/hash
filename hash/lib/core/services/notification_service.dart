import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Direct MethodChannel to inject includesCallsInRecents (not exposed by IOSParams)
const _callKitChannel = MethodChannel('flutter_callkit_incoming');

/// Resolve caller name from local SharedPreferences cache.
/// Contact names are synced by [NotificationService.syncContactNamesToSharedPrefs].
/// Returns 'Hash' if no match found (zero-knowledge: server never sends caller identity).
Future<String> _resolveCallerName(String? callerHashId) async {
  if (callerHashId == null || callerHashId.isEmpty) return 'Hash';
  try {
    final prefs = await SharedPreferences.getInstance();
    final namesJson = prefs.getString('contact_names_cache');
    if (namesJson != null) {
      final names = jsonDecode(namesJson) as Map<String, dynamic>;
      final name = names[callerHashId] as String?;
      if (name != null && name.isNotEmpty) return name;
    }
  } catch (e) {
    debugPrint('[FCM] Error resolving caller name: $e');
  }
  return 'Hash';
}

/// Show native incoming call screen in background using CallKit
@pragma('vm:entry-point')
Future<void> _showIncomingCallNotification(Map<String, dynamic> data) async {
  try {
    // Prevent duplicate CallKit: if a pending notification already exists,
    // don't create another one (e.g. caller retried while app is starting)
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      final existingCallKit = prefs.getString('pending_call_kit_id');
      if (existingCallKit != null) {
        debugPrint('[FCM] CallKit already pending ($existingCallKit) — skipping duplicate');
        return;
      }
    } catch (_) {}

    final callId = const Uuid().v4();
    final callType = data['call_type'] as String? ?? 'audio';
    final isVideo = callType == 'video';
    final callerHashId = data['caller_hash_id'] as String?;
    final signalId = data['signal_id'] as String?;
    final remoteCallId = data['call_id'] as String?;

    // Resolve caller name from local cache (zero-knowledge: never from server)
    final callerName = await _resolveCallerName(callerHashId);

    final params = CallKitParams(
      id: callId,
      nameCaller: callerName,
      appName: 'Hash',
      handle: callerHashId ?? '',
      type: isVideo ? 1 : 0,
      duration: 30000,
      textAccept: 'Accepter',
      textDecline: 'Refuser',
      extra: <String, dynamic>{
        'signal_id': data['signal_id'],
        'call_type': callType,
      },
      android: const AndroidParams(
        isCustomNotification: false,
        isShowLogo: false,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#0A0A0A',
        actionColor: '#FFAB00',
        incomingCallNotificationChannelName: 'Appels Hash',
      ),
      ios: const IOSParams(
        iconName: 'CallKitLogo',
        handleType: 'generic',
        supportsVideo: true,
        maximumCallGroups: 1,
        maximumCallsPerCallGroup: 1,
      ),
    );

    // Read showCallsInRecents setting and inject into native params
    bool showInRecents = false;
    try {
      final recentsPrefs = await SharedPreferences.getInstance();
      showInRecents = recentsPrefs.getBool('show_calls_in_recents') ?? false;
    } catch (_) {}

    if (Platform.isIOS) {
      final json = params.toJson();
      final ios = (json['ios'] as Map<String, dynamic>?) ?? <String, dynamic>{};
      ios['includesCallsInRecents'] = showInRecents;
      json['ios'] = ios;
      await _callKitChannel.invokeMethod('showCallkitIncoming', json);
    } else {
      await FlutterCallkitIncoming.showCallkitIncoming(params);
    }

    // Persist the CallKit ID and call metadata so the main app can reuse
    // the ID to UPDATE the notification with the real contact name, and
    // use the metadata for PIN-bypass call connection.
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('pending_call_kit_id', callId);
      await prefs.setString('pending_call_caller_hash_id', callerHashId ?? '');
      await prefs.setString('pending_call_type', callType);
      if (signalId != null) {
        await prefs.setString('pending_signal_id', signalId);
      }
      if (remoteCallId != null) {
        await prefs.setString('pending_call_id', remoteCallId);
      }
    } catch (e2) {
      debugPrint('[FCM] Error saving CallKit ID to SharedPrefs: $e2');
    }

    debugPrint('[FCM] Incoming call screen displayed via CallKit (caller: $callerName, type: $callType, id: $callId)');
  } catch (e) {
    debugPrint('[FCM] Error showing incoming call screen: $e');
  }
}

/// Handler pour les messages en arrière-plan (doit être une fonction top-level)
/// Affiche CallKit pour les appels et une notification pour les messages.
/// Il attend quelques secondes pour laisser l'app (si elle est en background) traiter le message.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('[FCM] Background message: ${message.messageId}');
  debugPrint('[FCM] Background data: ${message.data}');

  final messageType = message.data['type'];

  // Handle incoming call notifications (Android + iOS)
  // Shows CallKit native call screen. When the app is active (foreground),
  // the mailbox polling handles calls with the real contact name — skip here
  // to avoid a duplicate CallKit notification.
  if (messageType == 'incoming_call') {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      final appIsActive = prefs.getBool('app_is_active') ?? false;
      if (appIsActive) {
        debugPrint('[FCM] App is active, skipping background CallKit (mailbox polling handles it)');
        return;
      }

      // Check if call notifications are globally enabled
      final callNotifEnabled = prefs.getBool('call_notifications_enabled') ?? true;
      if (!callNotifEnabled) {
        debugPrint('[FCM] Call notifications disabled globally — skipping CallKit');
        return;
      }

      // Check per-contact call notification settings
      final callerHashId = message.data['caller_hash_id'] as String?;
      if (callerHashId != null) {
        final contactSettingsJson = prefs.getString('contact_notif_settings');
        if (contactSettingsJson != null) {
          try {
            final allSettings = jsonDecode(contactSettingsJson) as Map<String, dynamic>;
            final contactSettings = allSettings[callerHashId] as Map<String, dynamic>?;
            if (contactSettings != null) {
              final callNotifContactEnabled = contactSettings['callNotificationsEnabled'] as bool? ?? true;
              if (!callNotifContactEnabled) {
                debugPrint('[FCM] Call notifications disabled for contact $callerHashId — skipping');
                return;
              }
              final mutedUntilStr = contactSettings['mutedUntil'] as String?;
              if (mutedUntilStr != null) {
                final mutedUntil = DateTime.tryParse(mutedUntilStr);
                if (mutedUntil != null && mutedUntil.isAfter(DateTime.now())) {
                  debugPrint('[FCM] Contact $callerHashId is muted — skipping call');
                  return;
                }
              }
            }
          } catch (e) {
            debugPrint('[FCM] Error parsing contact call settings: $e');
          }
        }
      }
    } catch (e) {
      debugPrint('[FCM] Error checking app active state: $e');
    }
    debugPrint('[FCM] Incoming call notification received in background');
    await _showIncomingCallNotification(message.data);
    return;
  }

  // Messages are only handled on Android (iOS uses Notification Service Extension)
  if (!Platform.isAndroid) return;

  if (messageType != 'new_message') return;

  if (messageType != 'new_message') return;

  // Get the message info from the payload for stable notification ID
  final messageTimestamp = message.data['timestamp'] as String?;
  final messageId = message.data['message_id'] as String?;
  debugPrint('[FCM] Message timestamp: $messageTimestamp, id: $messageId');

  // Wait a few seconds to give the app time to process the message
  // If the app is in background (not killed), it will poll and show the real notification
  debugPrint('[FCM] Waiting 3 seconds for app to process...');
  await Future.delayed(const Duration(seconds: 3));

  // Check if the app is currently active (foreground or background but not killed)
  // If active, skip - the app will handle the notification
  try {
    final prefs = await SharedPreferences.getInstance();
    // Force reload to get fresh data
    await prefs.reload();

    // Check if app is active
    final appIsActive = prefs.getBool('app_is_active') ?? false;
    if (appIsActive) {
      debugPrint('[FCM] App is active, skipping background notification');
      return;
    }

    final lastProcessedTimestamp = prefs.getString('last_processed_message_timestamp');
    debugPrint('[FCM] Last processed timestamp: $lastProcessedTimestamp');

    if (lastProcessedTimestamp != null && messageTimestamp != null) {
      // Compare timestamps (with some tolerance for timing differences)
      final msgTime = DateTime.tryParse(messageTimestamp);
      final processedTime = DateTime.tryParse(lastProcessedTimestamp);

      if (msgTime != null && processedTime != null) {
        final diff = processedTime.difference(msgTime).inSeconds.abs();
        debugPrint('[FCM] Timestamp difference: $diff seconds');

        // If message was processed within last 10 seconds, skip notification
        if (diff < 10) {
          debugPrint('[FCM] Message already processed by app, skipping background notification');
          return;
        }
      }
    }
  } catch (e) {
    debugPrint('[FCM] Error checking processed timestamp: $e');
    // Continue to show notification
  }

  // Check if message notifications are globally enabled
  try {
    final notifPrefs = await SharedPreferences.getInstance();
    await notifPrefs.reload();
    final msgNotifEnabled = notifPrefs.getBool('message_notifications_enabled') ?? true;
    if (!msgNotifEnabled) {
      debugPrint('[FCM] Message notifications disabled globally — skipping');
      return;
    }

    // Check per-contact notification settings
    final senderHashId = message.data['sender_hash_id'] as String?;
    if (senderHashId != null) {
      final contactSettingsJson = notifPrefs.getString('contact_notif_settings');
      if (contactSettingsJson != null) {
        final allSettings = jsonDecode(contactSettingsJson) as Map<String, dynamic>;
        final contactSettings = allSettings[senderHashId] as Map<String, dynamic>?;
        if (contactSettings != null) {
          final contactNotifEnabled = contactSettings['notificationsEnabled'] as bool? ?? true;
          if (!contactNotifEnabled) {
            debugPrint('[FCM] Notifications disabled for contact $senderHashId — skipping');
            return;
          }
          final mutedUntilStr = contactSettings['mutedUntil'] as String?;
          if (mutedUntilStr != null) {
            final mutedUntil = DateTime.tryParse(mutedUntilStr);
            if (mutedUntil != null && mutedUntil.isAfter(DateTime.now())) {
              debugPrint('[FCM] Contact $senderHashId is muted until $mutedUntilStr — skipping');
              return;
            }
          }
        }
      }
    }
  } catch (e) {
    debugPrint('[FCM] Error checking notification settings: $e');
  }

  debugPrint('[FCM] App did not process message, showing background notification');

  String title = 'Hash';
  String body = 'Nouveau message';
  String? senderName;

  try {
    // Try to get sender address from payload
    final senderAddress = message.data['senderAddress'] as String?;
    debugPrint('[FCM] Sender address from payload: $senderAddress');
    
    // Try to find the contact in local database
    if (senderAddress != null && senderAddress.isNotEmpty) {
      try {
        // In a real implementation, we would access Hive here
        // For now, we'll just use the address as a placeholder
        // senderName = await _getContactNameFromDatabase(senderAddress);
        debugPrint('[FCM] Would look up contact name for address: $senderAddress');
      } catch (e) {
        debugPrint('[FCM] Could not access local database: $e');
      }
    }

    final prefs = await SharedPreferences.getInstance();

    final contentLevel = prefs.getString('notification_content_level') ?? 'discrete';
    final customTitle = prefs.getString('notification_custom_title') ?? '';
    final customBody = prefs.getString('notification_custom_body') ?? '';

    debugPrint('[FCM] SharedPrefs - contentLevel: $contentLevel');

    // Determine notification content based on user preferences
    switch (contentLevel) {
      case 'custom':
        title = customTitle.isNotEmpty ? customTitle : 'Hash';
        body = customBody.isNotEmpty ? customBody : 'Nouveau message';
        break;
      case 'discrete':
      default:
        title = 'Hash';
        body = 'Nouveau message';
        break;
    }
  } catch (e, stack) {
    debugPrint('[FCM] Error reading SharedPrefs: $e');
    debugPrint('[FCM] Stack: $stack');
  }

  // Show the notification
  try {
    final localNotifications = FlutterLocalNotificationsPlugin();
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);
    await localNotifications.initialize(settings: initSettings);

    // Read notification sound from SharedPreferences
    String? bgSoundName;
    try {
      final soundPrefs = await SharedPreferences.getInstance();
      bgSoundName = soundPrefs.getString('notification_sound');
    } catch (_) {}

    final bgChannelId = bgSoundName != null ? 'hash_messages_$bgSoundName' : 'hash_messages';
    final bgChannelName = bgSoundName != null
        ? 'Messages - ${bgSoundName[0].toUpperCase()}${bgSoundName.substring(1)}'
        : 'Messages';

    final androidDetails = AndroidNotificationDetails(
      bgChannelId,
      bgChannelName,
      channelDescription: 'Notifications pour les nouveaux messages',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      icon: '@mipmap/ic_launcher',
      sound: bgSoundName != null ? RawResourceAndroidNotificationSound(bgSoundName) : null,
    );

    final details = NotificationDetails(android: androidDetails);

    // Use stable notification ID based on message timestamp
    // This ensures the same message always gets the same ID
    // If foreground shows the same notification, it will replace this one instead of creating a duplicate
    // Priority: message_id > timestamp > current time
    int notificationId;
    if (messageId != null && messageId.isNotEmpty) {
      notificationId = messageId.hashCode.abs() % 2147483647;
    } else if (messageTimestamp != null) {
      notificationId = messageTimestamp.hashCode.abs() % 2147483647;
    } else {
      notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    }

    await localNotifications.show(
      id: notificationId,
      title: title,
      body: body,
      notificationDetails: details,
      payload: jsonEncode({'type': 'new_message', 'timestamp': messageTimestamp, 'message_id': messageId}),
    );

    debugPrint('[FCM] Background notification displayed with ID $notificationId: $title / $body');
  } catch (e2) {
    debugPrint('[FCM] Error showing notification: $e2');
  }
}

/// Service de gestion des notifications push
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  String? _fcmToken;
  String? get fcmToken => _fcmToken;

  /// Callback quand une notification est tapée
  Function(Map<String, dynamic> data)? onNotificationTapped;

  /// Callback quand un message est reçu en foreground
  Function(RemoteMessage message)? onMessageReceived;

  /// Initialise le service de notifications (sans demander la permission)
  Future<void> initialize() async {
    // Configurer le handler pour les messages en arrière-plan
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Configurer les notifications locales
    await _setupLocalNotifications();

    // Récupérer le token FCM
    await _getToken();

    // Écouter les changements de token
    _messaging.onTokenRefresh.listen((token) {
      _fcmToken = token;
      debugPrint('[FCM] Token refreshed: $token');
      _onTokenRefresh(token);
    });

    // Suppress iOS foreground push notifications — the app handles
    // everything in-app (banners for messages, overlay for calls)
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: false,
      badge: false,
      sound: false,
    );

    // Écouter les messages en foreground
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Écouter quand l'app est ouverte via une notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Vérifier si l'app a été lancée via une notification
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }
  }

  /// Demande les permissions de notification (appelé contextuellement depuis le HomeScreen)
  Future<void> requestPermissions() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    debugPrint('[FCM] Permission status: ${settings.authorizationStatus}');
  }

  /// Configure les notifications locales
  Future<void> _setupLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onNotificationResponse,
    );

    // Créer les canaux de notification Android
    // Canal par défaut (son système)
    const defaultChannel = AndroidNotificationChannel(
      'hash_messages',
      'Messages',
      description: 'Notifications pour les nouveaux messages',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    const callsChannel = AndroidNotificationChannel(
      'hash_calls',
      'Appels',
      description: 'Notifications pour les appels entrants',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
    );

    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      await androidPlugin.createNotificationChannel(defaultChannel);
      await androidPlugin.createNotificationChannel(callsChannel);

      // Créer un canal par son custom
      const soundNames = ['bolt', 'breach', 'cipher', 'crypt', 'onyx', 'phantom', 'sentinel', 'shadow', 'sheld', 'signal', 'stealth', 'vault', 'vynk', 'whisp'];
      for (final sound in soundNames) {
        final channel = AndroidNotificationChannel(
          'hash_messages_$sound',
          'Messages - ${sound[0].toUpperCase()}${sound.substring(1)}',
          description: 'Notifications avec le son ${sound[0].toUpperCase()}${sound.substring(1)}',
          importance: Importance.high,
          playSound: true,
          enableVibration: true,
          sound: RawResourceAndroidNotificationSound(sound),
        );
        await androidPlugin.createNotificationChannel(channel);
      }

      // Request notification permission for Android 13+ (API 33)
      final granted = await androidPlugin.requestNotificationsPermission();
      debugPrint('[Notification] Android notification permission granted: $granted');
    }

    debugPrint('[Notification] Local notifications setup completed');
  }

  /// Récupère le token FCM
  Future<void> _getToken() async {
    try {
      _fcmToken = await _messaging.getToken();
      debugPrint('[FCM] Token: $_fcmToken');
    } catch (e) {
      debugPrint('[FCM] Error getting token: $e');
    }
  }

  /// Appelé quand le token est rafraîchi
  void _onTokenRefresh(String token) {
    // Notify listeners that token changed - they should re-register
    debugPrint('[FCM] Token refreshed, listeners should re-register');
    _onTokenRefreshCallback?.call(token);
  }

  /// Callback pour notifier quand le token change
  Function(String token)? _onTokenRefreshCallback;

  /// Set callback for token refresh (used by AnonymousMailboxService)
  void setOnTokenRefreshCallback(Function(String token)? callback) {
    _onTokenRefreshCallback = callback;
  }

  /// Get current platform
  String get platform => Platform.isIOS ? 'ios' : 'android';

  /// Callback quand un appel entrant est reçu
  Function(Map<String, dynamic> data)? onIncomingCallReceived;

  /// Gère les messages reçus en foreground
  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    debugPrint('[FCM] Foreground message: ${message.messageId}');
    debugPrint('[FCM] Data: ${message.data}');

    // Notify listeners about incoming message
    onMessageReceived?.call(message);

    // Check if this is an incoming call notification
    if (message.data['type'] == 'incoming_call') {
      debugPrint('[FCM] Incoming call notification received in foreground');

      // Check if call notifications are enabled
      try {
        final callPrefs = await SharedPreferences.getInstance();
        await callPrefs.reload();
        final callNotifEnabled = callPrefs.getBool('call_notifications_enabled') ?? true;
        if (!callNotifEnabled) {
          debugPrint('[FCM] Call notifications disabled globally — ignoring foreground call');
          return;
        }

        // Check per-contact call notification settings
        final callerHashId = message.data['caller_hash_id'] as String?;
        if (callerHashId != null) {
          final contactSettingsJson = callPrefs.getString('contact_notif_settings');
          if (contactSettingsJson != null) {
            final allSettings = jsonDecode(contactSettingsJson) as Map<String, dynamic>;
            final contactSettings = allSettings[callerHashId] as Map<String, dynamic>?;
            if (contactSettings != null) {
              final callNotifContactEnabled = contactSettings['callNotificationsEnabled'] as bool? ?? true;
              if (!callNotifContactEnabled) {
                debugPrint('[FCM] Call notifications disabled for contact $callerHashId — ignoring');
                return;
              }
              final mutedUntilStr = contactSettings['mutedUntil'] as String?;
              if (mutedUntilStr != null) {
                final mutedUntil = DateTime.tryParse(mutedUntilStr);
                if (mutedUntil != null && mutedUntil.isAfter(DateTime.now())) {
                  debugPrint('[FCM] Contact $callerHashId is muted — ignoring call');
                  return;
                }
              }
            }
          }
        }
      } catch (e) {
        debugPrint('[FCM] Error checking call notification settings: $e');
      }

      // Notify listeners about incoming call - the app will handle showing the call UI
      onIncomingCallReceived?.call(message.data);
      return;
    }

    // Check if this is a data-only notification (from our server)
    if (message.data['type'] == 'new_message') {
      // Check if app is unlocked (HomeScreen active)
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      final appIsActive = prefs.getBool('app_is_active') ?? false;

      if (!appIsActive) {
        // Check if message notifications are globally enabled
        final msgNotifEnabled = prefs.getBool('message_notifications_enabled') ?? true;
        if (!msgNotifEnabled) {
          debugPrint('[FCM] App on lock screen but message notifications disabled — skipping');
          return;
        }

        // Check per-contact notification settings
        final senderHashId = message.data['sender_hash_id'] as String?;
        if (senderHashId != null) {
          final contactSettingsJson = prefs.getString('contact_notif_settings');
          if (contactSettingsJson != null) {
            try {
              final allSettings = jsonDecode(contactSettingsJson) as Map<String, dynamic>;
              final contactSettings = allSettings[senderHashId] as Map<String, dynamic>?;
              if (contactSettings != null) {
                final contactNotifEnabled = contactSettings['notificationsEnabled'] as bool? ?? true;
                if (!contactNotifEnabled) {
                  debugPrint('[FCM] Notifications disabled for contact $senderHashId — skipping');
                  return;
                }
                final mutedUntilStr = contactSettings['mutedUntil'] as String?;
                if (mutedUntilStr != null) {
                  final mutedUntil = DateTime.tryParse(mutedUntilStr);
                  if (mutedUntil != null && mutedUntil.isAfter(DateTime.now())) {
                    debugPrint('[FCM] Contact $senderHashId is muted — skipping');
                    return;
                  }
                }
              }
            } catch (e) {
              debugPrint('[FCM] Error parsing contact notification settings: $e');
            }
          }
        }

        // On lock screen — show notification like background handler would
        debugPrint('[FCM] App on lock screen, showing notification');
        final notifSound = prefs.getString('notification_sound') ?? 'bell';
        await showMessageNotification(
          messageId: message.data['message_id'],
          messageTimestamp: message.data['timestamp'],
          soundName: notifSound,
        );
        return;
      }

      // App is unlocked — message listener handles display
      debugPrint('[FCM] Data-only new_message notification received');
      return;
    }

    // Legacy: handle notifications with notification payload
    final notification = message.notification;
    if (notification != null) {
      // Check if message notifications are enabled before showing legacy notification
      final legacyPrefs = await SharedPreferences.getInstance();
      final msgNotifEnabled = legacyPrefs.getBool('message_notifications_enabled') ?? true;
      if (!msgNotifEnabled) {
        debugPrint('[FCM] Legacy notification suppressed — message notifications disabled');
        return;
      }
      _showLocalNotification(
        title: notification.title ?? 'Nouveau message',
        body: notification.body ?? '',
        payload: jsonEncode(message.data),
      );
    }
  }

  /// Gère quand l'app est ouverte via une notification
  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('[FCM] App opened from notification: ${message.messageId}');
    onNotificationTapped?.call(message.data);
  }

  /// Gère le tap sur une notification locale
  void _onNotificationResponse(NotificationResponse response) {
    if (response.payload != null) {
      try {
        final data = jsonDecode(response.payload!) as Map<String, dynamic>;
        onNotificationTapped?.call(data);
      } catch (e) {
        debugPrint('[FCM] Error parsing notification payload: $e');
      }
    }
  }

  /// Affiche une notification locale
  /// [notificationId] - ID stable pour éviter les doublons (si null, génère un ID basé sur le timestamp)
  /// [soundName] - Nom du son de notification (sans extension). Si null, utilise le son système par défaut.
  Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
    int? notificationId,
    String? soundName,
  }) async {
    debugPrint('[Notification] _showLocalNotification: title="$title", body="$body", sound="$soundName"');

    // Android : utiliser le canal dédié au son (le son est fixé par canal)
    final channelId = soundName != null ? 'hash_messages_$soundName' : 'hash_messages';
    final channelName = soundName != null
        ? 'Messages - ${soundName[0].toUpperCase()}${soundName.substring(1)}'
        : 'Messages';

    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: 'Notifications pour les nouveaux messages',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      icon: '@mipmap/ic_launcher',
      sound: soundName != null ? RawResourceAndroidNotificationSound(soundName) : null,
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: soundName != null ? '$soundName.caf' : null,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    try {
      // Use provided ID or generate one
      // Using a stable ID ensures the same notification replaces itself instead of creating duplicates
      final id = notificationId ?? DateTime.now().millisecondsSinceEpoch ~/ 1000;
      debugPrint('[Notification] Calling show() with id=$id');

      await _localNotifications.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: details,
        payload: payload,
      );

      debugPrint('[Notification] show() completed successfully');
    } catch (e, stack) {
      debugPrint('[Notification] ERROR showing notification: $e');
      debugPrint('[Notification] Stack: $stack');
    }
  }

  /// Affiche une notification pour un nouveau message
  /// [contentLevel] peut être:
  /// - 'discrete': affiche seulement "Hash - Nouveau message"
  /// - 'custom': utilise customTitle et customBody
  /// [messageId] - ID unique du message pour générer un ID stable (évite les doublons)
  /// [messageTimestamp] - Timestamp du message (fallback si messageId non disponible)
  Future<void> showMessageNotification({
    String? senderName,
    String? messagePreview,
    String? contactId,
    String contentLevel = 'discrete',
    String? customTitle,
    String? customBody,
    String? messageId,
    String? messageTimestamp,
    String? soundName,
  }) async {
    debugPrint('[Notification] showMessageNotification called: contentLevel=$contentLevel, messageId=$messageId');

    String title;
    String body;

    switch (contentLevel) {
      case 'custom':
        title = customTitle?.isNotEmpty == true ? customTitle! : 'Hash';
        body = customBody?.isNotEmpty == true ? customBody! : 'Nouveau message';
        break;
      case 'discrete':
      default:
        title = 'Hash';
        body = 'Nouveau message';
        break;
    }

    debugPrint('[Notification] Displaying: title="$title", body="$body"');

    // Generate stable notification ID from message ID or timestamp
    // This ensures if background handler already showed a notification for this message,
    // showing it again will REPLACE instead of creating a duplicate
    // Priority: messageId > messageTimestamp > null (will use current time)
    int? notificationId;
    if (messageId != null && messageId.isNotEmpty) {
      notificationId = messageId.hashCode.abs() % 2147483647;
    } else if (messageTimestamp != null) {
      notificationId = messageTimestamp.hashCode.abs() % 2147483647;
    }

    await _showLocalNotification(
      title: title,
      body: body,
      payload: jsonEncode({'type': 'message'}),
      notificationId: notificationId,
      soundName: soundName,
    );

    debugPrint('[Notification] _showLocalNotification completed with ID: $notificationId');
  }

  /// Marque l'app comme active (foreground ou background visible)
  /// Cela empêche le background handler d'afficher des notifications en double
  Future<void> setAppActive(bool isActive) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('app_is_active', isActive);
    debugPrint('[Notification] App active state set to: $isActive');
  }

  /// S'abonner à un topic
  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
    debugPrint('[FCM] Subscribed to topic: $topic');
  }

  /// Se désabonner d'un topic
  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
    debugPrint('[FCM] Unsubscribed from topic: $topic');
  }

  /// Efface le badge de l'app (iOS)
  Future<void> clearBadge() async {
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(badge: true);
  }

  /// Affiche une notification locale pour un appel manqué
  Future<void> showMissedCallNotification({
    required String callerName,
    required String callType,
    required DateTime timestamp,
    String? contactId,
  }) async {
    final callLabel = callType == 'video' ? 'vidéo' : 'audio';
    final title = 'Appel manqué';
    final body = 'Appel $callLabel de $callerName';

    // Stable notification ID based on timestamp to avoid duplicates
    final notificationId = timestamp.millisecondsSinceEpoch.abs() % 2147483647;

    const androidDetails = AndroidNotificationDetails(
      'hash_calls',
      'Appels',
      channelDescription: 'Notifications pour les appels entrants',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      icon: '@mipmap/ic_launcher',
      color: Color(0xFFFF4757),
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    final payload = contactId != null
        ? jsonEncode({'type': 'missed_call', 'contact_id': contactId})
        : jsonEncode({'type': 'missed_call'});

    await _localNotifications.show(
      id: notificationId,
      title: title,
      body: body,
      notificationDetails: details,
      payload: payload,
    );

    debugPrint('[Notification] Missed call notification displayed: $callerName ($callType)');
  }

  /// Annule toutes les notifications en attente (locales)
  Future<void> cancelAllNotifications() async {
    await _localNotifications.cancelAll();
    debugPrint('[Notification] All local notifications cancelled');
  }

  /// Supprime toutes les notifications délivrées (iOS uniquement)
  /// Inclut les notifications push du NSE
  Future<void> removeAllDeliveredNotifications() async {
    if (Platform.isIOS) {
      const channel = MethodChannel('com.hash.app/notification_preferences');
      try {
        await channel.invokeMethod('removeAllDeliveredNotifications');
        debugPrint('[Notification] All delivered notifications removed (iOS)');
      } catch (e) {
        debugPrint('[Notification] Error removing delivered notifications: $e');
      }
    } else {
      // On Android, just cancel all
      await _localNotifications.cancelAll();
      debugPrint('[Notification] All notifications cancelled (Android)');
    }
  }

  /// Synchronise les noms des contacts avec le NSE (iOS uniquement)
  /// Permet au NSE d'afficher les noms des contacts sans compromettre la confidentialité
  Future<void> syncContactNames(Map<String, String> contactNames) async {
    if (Platform.isIOS) {
      const channel = MethodChannel('com.hash.app/notification_preferences');
      try {
        await channel.invokeMethod('syncContactNames', {
          'contactNames': contactNames,
        });
        debugPrint('[Notification] Contact names synced to NSE (iOS)');
      } catch (e) {
        debugPrint('[Notification] Error syncing contact names: $e');
      }
    }
  }

  /// Synchronise les noms des contacts dans SharedPreferences.
  /// Accessible depuis le background isolate pour résoudre le nom de l'appelant
  /// sans jamais transiter l'identité par le serveur (zero-knowledge).
  /// [contactNames] est un Map<hashId, displayName>.
  Future<void> syncContactNamesToSharedPrefs(Map<String, String> contactNames) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('contact_names_cache', jsonEncode(contactNames));
      debugPrint('[Notification] Contact names synced to SharedPrefs (${contactNames.length} contacts)');
    } catch (e) {
      debugPrint('[Notification] Error syncing contact names to SharedPrefs: $e');
    }
  }

  /// Synchronise les données d'appel des contacts dans SharedPreferences.
  /// Utilisé par EarlyCallConnectService pour connecter LiveKit avant le PIN.
  /// [contactCallData] est un Map<hashId, {odid, identityPublicKey, mailboxToken, sendToken, sealedSenderPublicKey}>.
  Future<void> syncContactCallDataToSharedPrefs(Map<String, Map<String, String>> contactCallData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('contact_call_cache', jsonEncode(contactCallData));
      debugPrint('[Notification] Contact call data synced to SharedPrefs (${contactCallData.length} contacts)');
    } catch (e) {
      debugPrint('[Notification] Error syncing contact call data to SharedPrefs: $e');
    }
  }

  /// Simule une notification FCM avec l'adresse du contact (pour testing)
  /// Dans une implémentation réelle, le serveur enverrait senderAddress au lieu de senderName
  Future<void> simulateFCMNotificationWithSenderAddress({
    required String senderAddress,
    required String contactId,
    String contentLevel = 'discrete',
    String? customTitle,
    String? customBody,
  }) async {
    debugPrint('[Notification] Simulating FCM notification with sender address: $senderAddress');
    
    // In a real scenario, this would come from FCM payload
    // For testing, we'll use the address to look up the contact name
    String senderName = senderAddress; // Default to address
    
    // Try to get the actual contact name
    try {
      // In a real implementation, we would access the contacts database here
      // For now, we'll just use a placeholder
      // final contacts = await _getContactsFromDatabase();
      // final contact = contacts.firstWhere(
      //   (c) => c.hashId == senderAddress,
      //   orElse: () => null,
      // );
      // if (contact != null) {
      //   senderName = contact.displayName;
      // }
      debugPrint('[Notification] Would look up contact name for address: $senderAddress');
    } catch (e) {
      debugPrint('[Notification] Error looking up contact: $e');
    }
    
    // Show the notification with the resolved name
    await showMessageNotification(
      senderName: senderName,
      messagePreview: 'Test message',
      contactId: contactId,
      contentLevel: contentLevel,
      customTitle: customTitle,
      customBody: customBody,
    );
  }
}
