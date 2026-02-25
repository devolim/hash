import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

part 'app_settings.g.dart';

@HiveType(typeId: 5)
class AppSettings extends HiveObject {
  @HiveField(0, defaultValue: ThemeMode.dark)
  ThemeMode themeMode;

  @HiveField(1, defaultValue: 'auto')
  String locale;

  @HiveField(2, defaultValue: true)
  bool messageNotificationsEnabled;

  @HiveField(3, defaultValue: true)
  bool callNotificationsEnabled;

  @HiveField(4, defaultValue: false)
  bool biometricEnabled;

  @HiveField(5, defaultValue: 1)
  int autoLockMinutes; // 0 = immediate, 1, 5, 15, 30

  @HiveField(6, defaultValue: true)
  bool screenshotProtectionEnabled;

  @HiveField(7, defaultValue: true)
  bool vibrationEnabled;

  @HiveField(8, defaultValue: false)
  bool showCallsInRecents;

  /// Niveau de contenu des notifications
  /// 'discrete' = "Hash - Nouveau message" sans détail
  /// 'custom' = titre et corps personnalisés
  @HiveField(9, defaultValue: 'discrete')
  String notificationContentLevel;

  /// Titre personnalisé pour les notifications (utilisé si notificationContentLevel == 'custom')
  @HiveField(10, defaultValue: '')
  String customNotificationTitle;

  /// Corps personnalisé pour les notifications (utilisé si notificationContentLevel == 'custom')
  @HiveField(11, defaultValue: '')
  String customNotificationBody;

  @HiveField(12, defaultValue: true)
  bool sendReadReceipts;

  /// Timestamps des connexions récentes (millisecondes depuis epoch)
  /// Conserve uniquement les 24 dernières heures
  @HiveField(13, defaultValue: [])
  List<int> loginTimestamps;

  @HiveField(14, defaultValue: false)
  bool notesRequireBiometric;

  /// Suppression des contacts lors de l'utilisation du code de destruction
  @HiveField(15, defaultValue: false)
  bool deleteContactsOnDuress;

  /// Suppression des messages lors de l'utilisation du code de destruction
  @HiveField(16, defaultValue: true)
  bool deleteMessagesOnDuress;

  /// Suppression des notes lors de l'utilisation du code de destruction
  @HiveField(17, defaultValue: true)
  bool deleteNotesOnDuress;

  /// Masquer le contenu des messages dans la liste des conversations
  @HiveField(18, defaultValue: false)
  bool hideMessagePreviews;

  /// Durée par défaut des messages éphémères en secondes (minimum 60)
  @HiveField(19, defaultValue: 60)
  int defaultEphemeralDuration;

  /// Verrouillage par secousse activé
  @HiveField(20, defaultValue: false)
  bool shakeLockEnabled;

  /// Sensibilité du shake lock (1 = faible, 2 = moyenne, 3 = forte)
  @HiveField(21, defaultValue: 2)
  int shakeLockSensitivity;

  /// Destruction totale après 10 tentatives PIN échouées (true = destruction + ghost mode, false = verrouillage)
  @HiveField(22, defaultValue: true)
  bool destructionOnMaxAttempts;

  /// Son de notification global (nom du fichier sans extension)
  @HiveField(23, defaultValue: 'shadow')
  String notificationSound;

  /// Son pop à l'envoi de message activé
  @HiveField(24, defaultValue: true)
  bool sendSoundEnabled;

  /// Son de réception in-app activé
  @HiveField(25, defaultValue: true)
  bool receiveSoundEnabled;

  /// Icône alternative de l'app (id ou 'default')
  @HiveField(26, defaultValue: 'default')
  String appIcon;

  static const List<int> validAutoLockValues = [0, 1, 5, 15, 30];

  AppSettings({
    this.themeMode = ThemeMode.dark,
    this.locale = 'auto',
    this.messageNotificationsEnabled = true,
    this.callNotificationsEnabled = true,
    this.biometricEnabled = false,
    int autoLockMinutes = 1,
    this.screenshotProtectionEnabled = true,
    this.vibrationEnabled = true,
    this.showCallsInRecents = false,
    this.notificationContentLevel = 'discrete',
    this.customNotificationTitle = '',
    this.customNotificationBody = '',
    this.sendReadReceipts = true,
    List<int>? loginTimestamps,
    this.notesRequireBiometric = false,
    this.deleteContactsOnDuress = false,
    this.deleteMessagesOnDuress = true,
    this.deleteNotesOnDuress = true,
    this.hideMessagePreviews = false,
    this.defaultEphemeralDuration = 60,
    this.shakeLockEnabled = false,
    this.shakeLockSensitivity = 2,
    this.destructionOnMaxAttempts = true,
    this.notificationSound = 'shadow',
    this.sendSoundEnabled = true,
    this.receiveSoundEnabled = true,
    this.appIcon = 'default',
  })  : autoLockMinutes = validAutoLockValues.contains(autoLockMinutes) ? autoLockMinutes : 1,
        loginTimestamps = loginTimestamps ?? [];

  AppSettings copyWith({
    ThemeMode? themeMode,
    String? locale,
    bool? messageNotificationsEnabled,
    bool? callNotificationsEnabled,
    bool? biometricEnabled,
    int? autoLockMinutes,
    bool? screenshotProtectionEnabled,
    bool? vibrationEnabled,
    bool? showCallsInRecents,
    String? notificationContentLevel,
    String? customNotificationTitle,
    String? customNotificationBody,
    bool? sendReadReceipts,
    List<int>? loginTimestamps,
    bool? notesRequireBiometric,
    bool? deleteContactsOnDuress,
    bool? deleteMessagesOnDuress,
    bool? deleteNotesOnDuress,
    bool? hideMessagePreviews,
    int? defaultEphemeralDuration,
    bool? shakeLockEnabled,
    int? shakeLockSensitivity,
    bool? destructionOnMaxAttempts,
    String? notificationSound,
    bool? sendSoundEnabled,
    bool? receiveSoundEnabled,
    String? appIcon,
  }) =>
      AppSettings(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
        messageNotificationsEnabled:
            messageNotificationsEnabled ?? this.messageNotificationsEnabled,
        callNotificationsEnabled:
            callNotificationsEnabled ?? this.callNotificationsEnabled,
        biometricEnabled: biometricEnabled ?? this.biometricEnabled,
        autoLockMinutes: autoLockMinutes ?? this.autoLockMinutes,
        screenshotProtectionEnabled:
            screenshotProtectionEnabled ?? this.screenshotProtectionEnabled,
        vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
        showCallsInRecents: showCallsInRecents ?? this.showCallsInRecents,
        notificationContentLevel:
            notificationContentLevel ?? this.notificationContentLevel,
        customNotificationTitle:
            customNotificationTitle ?? this.customNotificationTitle,
        customNotificationBody:
            customNotificationBody ?? this.customNotificationBody,
        sendReadReceipts: sendReadReceipts ?? this.sendReadReceipts,
        loginTimestamps: loginTimestamps ?? this.loginTimestamps,
        notesRequireBiometric: notesRequireBiometric ?? this.notesRequireBiometric,
        deleteContactsOnDuress: deleteContactsOnDuress ?? this.deleteContactsOnDuress,
        deleteMessagesOnDuress: deleteMessagesOnDuress ?? this.deleteMessagesOnDuress,
        deleteNotesOnDuress: deleteNotesOnDuress ?? this.deleteNotesOnDuress,
        hideMessagePreviews: hideMessagePreviews ?? this.hideMessagePreviews,
        defaultEphemeralDuration: defaultEphemeralDuration ?? this.defaultEphemeralDuration,
        shakeLockEnabled: shakeLockEnabled ?? this.shakeLockEnabled,
        shakeLockSensitivity: shakeLockSensitivity ?? this.shakeLockSensitivity,
        destructionOnMaxAttempts: destructionOnMaxAttempts ?? this.destructionOnMaxAttempts,
        notificationSound: notificationSound ?? this.notificationSound,
        sendSoundEnabled: sendSoundEnabled ?? this.sendSoundEnabled,
        receiveSoundEnabled: receiveSoundEnabled ?? this.receiveSoundEnabled,
        appIcon: appIcon ?? this.appIcon,
      );

  Map<String, dynamic> toJson() => {
        'theme_mode': themeMode.index,
        'locale': locale,
        'message_notifications_enabled': messageNotificationsEnabled,
        'call_notifications_enabled': callNotificationsEnabled,
        'biometric_enabled': biometricEnabled,
        'auto_lock_minutes': autoLockMinutes,
        'screenshot_protection_enabled': screenshotProtectionEnabled,
        'vibration_enabled': vibrationEnabled,
        'show_calls_in_recents': showCallsInRecents,
        'notification_content_level': notificationContentLevel,
        'custom_notification_title': customNotificationTitle,
        'custom_notification_body': customNotificationBody,
        'send_read_receipts': sendReadReceipts,
        'login_timestamps': loginTimestamps,
        'notes_require_biometric': notesRequireBiometric,
        'delete_contacts_on_duress': deleteContactsOnDuress,
        'delete_messages_on_duress': deleteMessagesOnDuress,
        'delete_notes_on_duress': deleteNotesOnDuress,
        'hide_message_previews': hideMessagePreviews,
        'default_ephemeral_duration': defaultEphemeralDuration,
        'shake_lock_enabled': shakeLockEnabled,
        'shake_lock_sensitivity': shakeLockSensitivity,
        'destruction_on_max_attempts': destructionOnMaxAttempts,
        'notification_sound': notificationSound,
        'send_sound_enabled': sendSoundEnabled,
        'receive_sound_enabled': receiveSoundEnabled,
        'app_icon': appIcon,
      };

  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
        themeMode: ThemeMode.values[json['theme_mode'] as int? ?? 2],
        locale: json['locale'] as String? ?? 'auto',
        messageNotificationsEnabled:
            json['message_notifications_enabled'] as bool? ?? true,
        callNotificationsEnabled:
            json['call_notifications_enabled'] as bool? ?? true,
        biometricEnabled: json['biometric_enabled'] as bool? ?? false,
        autoLockMinutes: json['auto_lock_minutes'] as int? ?? 1,
        screenshotProtectionEnabled:
            json['screenshot_protection_enabled'] as bool? ?? true,
        vibrationEnabled: json['vibration_enabled'] as bool? ?? true,
        showCallsInRecents: json['show_calls_in_recents'] as bool? ?? false,
        notificationContentLevel:
            json['notification_content_level'] as String? ?? 'discrete',
        customNotificationTitle:
            json['custom_notification_title'] as String? ?? '',
        customNotificationBody:
            json['custom_notification_body'] as String? ?? '',
        sendReadReceipts: json['send_read_receipts'] as bool? ?? true,
        loginTimestamps: (json['login_timestamps'] as List<dynamic>?)
                ?.map((e) => e as int)
                .toList() ??
            [],
        notesRequireBiometric: json['notes_require_biometric'] as bool? ?? false,
        deleteContactsOnDuress: json['delete_contacts_on_duress'] as bool? ?? false,
        deleteMessagesOnDuress: json['delete_messages_on_duress'] as bool? ?? true,
        deleteNotesOnDuress: json['delete_notes_on_duress'] as bool? ?? true,
        hideMessagePreviews: json['hide_message_previews'] as bool? ?? false,
        defaultEphemeralDuration: json['default_ephemeral_duration'] as int? ?? 60,
        shakeLockEnabled: json['shake_lock_enabled'] as bool? ?? false,
        shakeLockSensitivity: json['shake_lock_sensitivity'] as int? ?? 2,
        destructionOnMaxAttempts: json['destruction_on_max_attempts'] as bool? ?? true,
        notificationSound: json['notification_sound'] as String? ?? 'shadow',
        sendSoundEnabled: json['send_sound_enabled'] as bool? ?? true,
        receiveSoundEnabled: json['receive_sound_enabled'] as bool? ?? true,
        appIcon: json['app_icon'] as String? ?? 'default',
      );
}

class ThemeModeAdapter extends TypeAdapter<ThemeMode> {
  @override
  final int typeId = 6;

  @override
  ThemeMode read(BinaryReader reader) {
    return ThemeMode.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, ThemeMode obj) {
    writer.writeInt(obj.index);
  }
}
