// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final typeId = 1;

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      odid: fields[0] as String,
      hashId: fields[1] as String,
      displayName: fields[2] as String,
      avatarPath: fields[3] as String?,
      notes: fields[4] as String?,
      addedAt: fields[5] as DateTime,
      lastMessageAt: fields[6] as DateTime?,
      lastMessagePreview: fields[7] as String?,
      unreadCount: fields[8] == null ? 0 : (fields[8] as num).toInt(),
      notificationsEnabled: fields[9] == null ? true : fields[9] as bool,
      callNotificationsEnabled: fields[10] == null ? true : fields[10] as bool,
      identityPublicKey: fields[11] as String?,
      sessionData: fields[12] as String?,
      mailboxToken: fields[13] as String?,
      relayToken: fields[14] as String?,
      verificationToken: fields[15] as String?,
      sealedSenderPublicKey: fields[16] as String?,
      mutedUntil: fields[17] as DateTime?,
      notificationSound: fields[18] as String?,
      chatBubbleColor: (fields[19] as num?)?.toInt(),
      chatBubbleGradient: fields[24] as String?,
      chatBackgroundColor: (fields[20] as num?)?.toInt(),
      chatBackgroundGradient: fields[21] as String?,
      chatBackgroundImagePath: fields[22] as String?,
      ephemeralDuration: (fields[23] as num?)?.toInt(),
      sendReadReceipts: fields[25] as bool?,
      sendToken: fields[26] as String?,
      isPinned: fields[27] == null ? false : fields[27] as bool,
      isHidden: fields[28] == null ? false : fields[28] as bool,
      isBlocked: fields[29] == null ? false : fields[29] as bool,
      lastSessionResetAt: fields[30] as DateTime?,
      ephemeralVersion: fields[31] == null ? 0 : (fields[31] as num).toInt(),
      sendCounter: fields[32] == null ? 0 : (fields[32] as num).toInt(),
      lastReceivedCounter: fields[33] == null ? 0 : (fields[33] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(34)
      ..writeByte(0)
      ..write(obj.odid)
      ..writeByte(1)
      ..write(obj.hashId)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.avatarPath)
      ..writeByte(4)
      ..write(obj.notes)
      ..writeByte(5)
      ..write(obj.addedAt)
      ..writeByte(6)
      ..write(obj.lastMessageAt)
      ..writeByte(7)
      ..write(obj.lastMessagePreview)
      ..writeByte(8)
      ..write(obj.unreadCount)
      ..writeByte(9)
      ..write(obj.notificationsEnabled)
      ..writeByte(10)
      ..write(obj.callNotificationsEnabled)
      ..writeByte(11)
      ..write(obj.identityPublicKey)
      ..writeByte(12)
      ..write(obj.sessionData)
      ..writeByte(13)
      ..write(obj.mailboxToken)
      ..writeByte(14)
      ..write(obj.relayToken)
      ..writeByte(15)
      ..write(obj.verificationToken)
      ..writeByte(16)
      ..write(obj.sealedSenderPublicKey)
      ..writeByte(17)
      ..write(obj.mutedUntil)
      ..writeByte(18)
      ..write(obj.notificationSound)
      ..writeByte(19)
      ..write(obj.chatBubbleColor)
      ..writeByte(20)
      ..write(obj.chatBackgroundColor)
      ..writeByte(21)
      ..write(obj.chatBackgroundGradient)
      ..writeByte(22)
      ..write(obj.chatBackgroundImagePath)
      ..writeByte(23)
      ..write(obj.ephemeralDuration)
      ..writeByte(24)
      ..write(obj.chatBubbleGradient)
      ..writeByte(25)
      ..write(obj.sendReadReceipts)
      ..writeByte(26)
      ..write(obj.sendToken)
      ..writeByte(27)
      ..write(obj.isPinned)
      ..writeByte(28)
      ..write(obj.isHidden)
      ..writeByte(29)
      ..write(obj.isBlocked)
      ..writeByte(30)
      ..write(obj.lastSessionResetAt)
      ..writeByte(31)
      ..write(obj.ephemeralVersion)
      ..writeByte(32)
      ..write(obj.sendCounter)
      ..writeByte(33)
      ..write(obj.lastReceivedCounter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
