// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallSettingsAdapter extends TypeAdapter<CallSettings> {
  @override
  final typeId = 11;

  @override
  CallSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CallSettings(
      defaultMicEnabled: fields[0] == null ? true : fields[0] as bool,
      defaultCameraEnabled: fields[1] == null ? true : fields[1] as bool,
      defaultSpeakerEnabled: fields[2] == null ? false : fields[2] as bool,
      ringDurationSeconds: fields[3] == null ? 30 : (fields[3] as num).toInt(),
      vibrationEnabled: fields[4] == null ? true : fields[4] as bool,
      proximitySensorEnabled: fields[5] == null ? true : fields[5] as bool,
      noiseSuppressionEnabled: fields[6] == null ? true : fields[6] as bool,
      echoCancellationEnabled: fields[7] == null ? true : fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CallSettings obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.defaultMicEnabled)
      ..writeByte(1)
      ..write(obj.defaultCameraEnabled)
      ..writeByte(2)
      ..write(obj.defaultSpeakerEnabled)
      ..writeByte(3)
      ..write(obj.ringDurationSeconds)
      ..writeByte(4)
      ..write(obj.vibrationEnabled)
      ..writeByte(5)
      ..write(obj.proximitySensorEnabled)
      ..writeByte(6)
      ..write(obj.noiseSuppressionEnabled)
      ..writeByte(7)
      ..write(obj.echoCancellationEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CallSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
