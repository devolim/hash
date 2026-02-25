// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  final typeId = 5;

  @override
  AppSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettings(
      themeMode: fields[0] == null ? ThemeMode.dark : fields[0] as ThemeMode,
      locale: fields[1] == null ? 'auto' : fields[1] as String,
      messageNotificationsEnabled: fields[2] == null ? true : fields[2] as bool,
      callNotificationsEnabled: fields[3] == null ? true : fields[3] as bool,
      biometricEnabled: fields[4] == null ? false : fields[4] as bool,
      autoLockMinutes: fields[5] == null ? 1 : (fields[5] as num).toInt(),
      screenshotProtectionEnabled: fields[6] == null ? true : fields[6] as bool,
      vibrationEnabled: fields[7] == null ? true : fields[7] as bool,
      showCallsInRecents: fields[8] == null ? false : fields[8] as bool,
      notificationContentLevel: fields[9] == null
          ? 'discrete'
          : fields[9] as String,
      customNotificationTitle: fields[10] == null ? '' : fields[10] as String,
      customNotificationBody: fields[11] == null ? '' : fields[11] as String,
      sendReadReceipts: fields[12] == null ? true : fields[12] as bool,
      loginTimestamps: fields[13] == null
          ? []
          : (fields[13] as List?)?.cast<int>(),
      notesRequireBiometric: fields[14] == null ? false : fields[14] as bool,
      deleteContactsOnDuress: fields[15] == null ? false : fields[15] as bool,
      deleteMessagesOnDuress: fields[16] == null ? true : fields[16] as bool,
      deleteNotesOnDuress: fields[17] == null ? true : fields[17] as bool,
      hideMessagePreviews: fields[18] == null ? false : fields[18] as bool,
      defaultEphemeralDuration: fields[19] == null
          ? 60
          : (fields[19] as num).toInt(),
      shakeLockEnabled: fields[20] == null ? false : fields[20] as bool,
      shakeLockSensitivity: fields[21] == null
          ? 2
          : (fields[21] as num).toInt(),
      destructionOnMaxAttempts: fields[22] == null ? true : fields[22] as bool,
      notificationSound: fields[23] == null ? 'shadow' : fields[23] as String,
      sendSoundEnabled: fields[24] == null ? true : fields[24] as bool,
      receiveSoundEnabled: fields[25] == null ? true : fields[25] as bool,
      appIcon: fields[26] == null ? 'default' : fields[26] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.themeMode)
      ..writeByte(1)
      ..write(obj.locale)
      ..writeByte(2)
      ..write(obj.messageNotificationsEnabled)
      ..writeByte(3)
      ..write(obj.callNotificationsEnabled)
      ..writeByte(4)
      ..write(obj.biometricEnabled)
      ..writeByte(5)
      ..write(obj.autoLockMinutes)
      ..writeByte(6)
      ..write(obj.screenshotProtectionEnabled)
      ..writeByte(7)
      ..write(obj.vibrationEnabled)
      ..writeByte(8)
      ..write(obj.showCallsInRecents)
      ..writeByte(9)
      ..write(obj.notificationContentLevel)
      ..writeByte(10)
      ..write(obj.customNotificationTitle)
      ..writeByte(11)
      ..write(obj.customNotificationBody)
      ..writeByte(12)
      ..write(obj.sendReadReceipts)
      ..writeByte(13)
      ..write(obj.loginTimestamps)
      ..writeByte(14)
      ..write(obj.notesRequireBiometric)
      ..writeByte(15)
      ..write(obj.deleteContactsOnDuress)
      ..writeByte(16)
      ..write(obj.deleteMessagesOnDuress)
      ..writeByte(17)
      ..write(obj.deleteNotesOnDuress)
      ..writeByte(18)
      ..write(obj.hideMessagePreviews)
      ..writeByte(19)
      ..write(obj.defaultEphemeralDuration)
      ..writeByte(20)
      ..write(obj.shakeLockEnabled)
      ..writeByte(21)
      ..write(obj.shakeLockSensitivity)
      ..writeByte(22)
      ..write(obj.destructionOnMaxAttempts)
      ..writeByte(23)
      ..write(obj.notificationSound)
      ..writeByte(24)
      ..write(obj.sendSoundEnabled)
      ..writeByte(25)
      ..write(obj.receiveSoundEnabled)
      ..writeByte(26)
      ..write(obj.appIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
