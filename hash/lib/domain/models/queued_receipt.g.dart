// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_receipt.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QueuedReceiptAdapter extends TypeAdapter<QueuedReceipt> {
  @override
  final typeId = 13;

  @override
  QueuedReceipt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QueuedReceipt(
      id: fields[0] as String,
      contactId: fields[1] as String,
      receiptType: fields[2] as String,
      messageIds: (fields[3] as List).cast<String>(),
      retryCount: fields[4] == null ? 0 : (fields[4] as num).toInt(),
      createdAt: fields[5] as DateTime,
      nextRetryAt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, QueuedReceipt obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.contactId)
      ..writeByte(2)
      ..write(obj.receiptType)
      ..writeByte(3)
      ..write(obj.messageIds)
      ..writeByte(4)
      ..write(obj.retryCount)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.nextRetryAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueuedReceiptAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
