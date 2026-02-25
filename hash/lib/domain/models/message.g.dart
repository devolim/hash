// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final typeId = 4;

  @override
  Message read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Message(
      id: fields[0] as String,
      contactId: fields[1] as String,
      isOutgoing: fields[2] as bool,
      type: fields[3] as MessageType,
      content: fields[4] as String,
      timestamp: fields[5] as DateTime,
      status: fields[6] == null
          ? MessageStatus.sending
          : fields[6] as MessageStatus,
      mediaUrl: fields[7] as String?,
      mediaName: fields[8] as String?,
      mediaSizeBytes: (fields[9] as num?)?.toInt(),
      mediaDurationSeconds: (fields[10] as num?)?.toInt(),
      mediaDownloadable: fields[11] == null ? false : fields[11] as bool,
      isRead: fields[12] == null ? false : fields[12] as bool,
      readAt: fields[13] as DateTime?,
      expiresAt: fields[14] as DateTime?,
      isViewOnce: fields[15] == null ? false : fields[15] as bool,
      viewOnceDuration: (fields[16] as num?)?.toInt(),
      viewOnceOpened: fields[17] == null ? false : fields[17] as bool,
      ephemeralRemainingSeconds: (fields[18] as num?)?.toInt(),
      mediaFileId: fields[19] as String?,
      mediaEncKey: fields[20] as String?,
      mediaEncIv: fields[21] as String?,
      mediaThumbnail: fields[22] as String?,
      mediaMimeType: fields[23] as String?,
      mediaDownloadStatus: (fields[24] as num?)?.toInt(),
      mediaWidth: (fields[25] as num?)?.toInt(),
      mediaHeight: (fields[26] as num?)?.toInt(),
      maxExpiresAt: fields[27] as DateTime?,
      ephemeralDurationSeconds: (fields[28] as num?)?.toInt(),
      reactionTargetId: fields[29] as String?,
      reactions: fields[30] as String?,
      replyToId: fields[31] as String?,
      replyToPreview: fields[32] as String?,
      editedMessageId: fields[33] as String?,
      isEdited: fields[34] == null ? false : fields[34] as bool,
      editedAt: fields[35] as DateTime?,
      isDeletedForEveryone: fields[36] == null ? false : fields[36] as bool,
      deletedByName: fields[37] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(38)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.contactId)
      ..writeByte(2)
      ..write(obj.isOutgoing)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.timestamp)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.mediaUrl)
      ..writeByte(8)
      ..write(obj.mediaName)
      ..writeByte(9)
      ..write(obj.mediaSizeBytes)
      ..writeByte(10)
      ..write(obj.mediaDurationSeconds)
      ..writeByte(11)
      ..write(obj.mediaDownloadable)
      ..writeByte(12)
      ..write(obj.isRead)
      ..writeByte(13)
      ..write(obj.readAt)
      ..writeByte(14)
      ..write(obj.expiresAt)
      ..writeByte(15)
      ..write(obj.isViewOnce)
      ..writeByte(16)
      ..write(obj.viewOnceDuration)
      ..writeByte(17)
      ..write(obj.viewOnceOpened)
      ..writeByte(18)
      ..write(obj.ephemeralRemainingSeconds)
      ..writeByte(19)
      ..write(obj.mediaFileId)
      ..writeByte(20)
      ..write(obj.mediaEncKey)
      ..writeByte(21)
      ..write(obj.mediaEncIv)
      ..writeByte(22)
      ..write(obj.mediaThumbnail)
      ..writeByte(23)
      ..write(obj.mediaMimeType)
      ..writeByte(24)
      ..write(obj.mediaDownloadStatus)
      ..writeByte(25)
      ..write(obj.mediaWidth)
      ..writeByte(26)
      ..write(obj.mediaHeight)
      ..writeByte(27)
      ..write(obj.maxExpiresAt)
      ..writeByte(28)
      ..write(obj.ephemeralDurationSeconds)
      ..writeByte(29)
      ..write(obj.reactionTargetId)
      ..writeByte(30)
      ..write(obj.reactions)
      ..writeByte(31)
      ..write(obj.replyToId)
      ..writeByte(32)
      ..write(obj.replyToPreview)
      ..writeByte(33)
      ..write(obj.editedMessageId)
      ..writeByte(34)
      ..write(obj.isEdited)
      ..writeByte(35)
      ..write(obj.editedAt)
      ..writeByte(36)
      ..write(obj.isDeletedForEveryone)
      ..writeByte(37)
      ..write(obj.deletedByName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessageTypeAdapter extends TypeAdapter<MessageType> {
  @override
  final typeId = 2;

  @override
  MessageType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MessageType.text;
      case 1:
        return MessageType.image;
      case 2:
        return MessageType.video;
      case 3:
        return MessageType.voice;
      case 4:
        return MessageType.file;
      case 5:
        return MessageType.contact;
      case 6:
        return MessageType.location;
      case 7:
        return MessageType.note;
      case 8:
        return MessageType.reaction;
      case 9:
        return MessageType.edit;
      case 10:
        return MessageType.delete;
      default:
        return MessageType.text;
    }
  }

  @override
  void write(BinaryWriter writer, MessageType obj) {
    switch (obj) {
      case MessageType.text:
        writer.writeByte(0);
      case MessageType.image:
        writer.writeByte(1);
      case MessageType.video:
        writer.writeByte(2);
      case MessageType.voice:
        writer.writeByte(3);
      case MessageType.file:
        writer.writeByte(4);
      case MessageType.contact:
        writer.writeByte(5);
      case MessageType.location:
        writer.writeByte(6);
      case MessageType.note:
        writer.writeByte(7);
      case MessageType.reaction:
        writer.writeByte(8);
      case MessageType.edit:
        writer.writeByte(9);
      case MessageType.delete:
        writer.writeByte(10);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessageStatusAdapter extends TypeAdapter<MessageStatus> {
  @override
  final typeId = 3;

  @override
  MessageStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MessageStatus.sending;
      case 1:
        return MessageStatus.sent;
      case 2:
        return MessageStatus.delivered;
      case 3:
        return MessageStatus.read;
      case 4:
        return MessageStatus.failed;
      case 5:
        return MessageStatus.queued;
      default:
        return MessageStatus.sending;
    }
  }

  @override
  void write(BinaryWriter writer, MessageStatus obj) {
    switch (obj) {
      case MessageStatus.sending:
        writer.writeByte(0);
      case MessageStatus.sent:
        writer.writeByte(1);
      case MessageStatus.delivered:
        writer.writeByte(2);
      case MessageStatus.read:
        writer.writeByte(3);
      case MessageStatus.failed:
        writer.writeByte(4);
      case MessageStatus.queued:
        writer.writeByte(5);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
