// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QueuedMessageAdapter extends TypeAdapter<QueuedMessage> {
  @override
  final typeId = 12;

  @override
  QueuedMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QueuedMessage(
      messageId: fields[0] as String,
      contactId: fields[1] as String,
      filePath: fields[2] as String?,
      mimeType: fields[3] as String?,
      retryCount: fields[4] == null ? 0 : (fields[4] as num).toInt(),
      createdAt: fields[5] as DateTime,
      nextRetryAt: fields[6] as DateTime?,
      priority: fields[7] == null ? 0 : (fields[7] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, QueuedMessage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.messageId)
      ..writeByte(1)
      ..write(obj.contactId)
      ..writeByte(2)
      ..write(obj.filePath)
      ..writeByte(3)
      ..write(obj.mimeType)
      ..writeByte(4)
      ..write(obj.retryCount)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.nextRetryAt)
      ..writeByte(7)
      ..write(obj.priority);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueuedMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
