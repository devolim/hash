// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallMessageAdapter extends TypeAdapter<CallMessage> {
  @override
  final typeId = 10;

  @override
  CallMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CallMessage(
      id: fields[0] as String,
      contactId: fields[1] as String,
      isOutgoing: fields[2] as bool,
      callTypeString: fields[3] as String,
      endReasonString: fields[4] as String,
      durationSeconds: (fields[5] as num?)?.toInt(),
      timestamp: fields[6] as DateTime,
      expiresAt: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CallMessage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.contactId)
      ..writeByte(2)
      ..write(obj.isOutgoing)
      ..writeByte(3)
      ..write(obj.callTypeString)
      ..writeByte(4)
      ..write(obj.endReasonString)
      ..writeByte(5)
      ..write(obj.durationSeconds)
      ..writeByte(6)
      ..write(obj.timestamp)
      ..writeByte(7)
      ..write(obj.expiresAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CallMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
