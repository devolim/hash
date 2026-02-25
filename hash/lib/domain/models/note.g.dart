// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChecklistItemAdapter extends TypeAdapter<ChecklistItem> {
  @override
  final typeId = 8;

  @override
  ChecklistItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChecklistItem(
      id: fields[0] as String,
      text: fields[1] as String,
      isChecked: fields[2] == null ? false : fields[2] as bool,
      position: fields[3] == null ? 0 : (fields[3] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ChecklistItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isChecked)
      ..writeByte(3)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChecklistItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final typeId = 9;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      id: fields[0] as String,
      title: fields[1] == null ? '' : fields[1] as String,
      content: fields[2] == null ? '' : fields[2] as String,
      type: fields[3] == null ? NoteType.text : fields[3] as NoteType,
      items: (fields[4] as List?)?.cast<ChecklistItem>(),
      createdAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
      isPinned: fields[7] == null ? false : fields[7] as bool,
      colorIndex: fields[8] == null ? 0 : (fields[8] as num).toInt(),
      passwordHash: fields[9] as String?,
      isPasswordPin: fields[10] == null ? true : fields[10] as bool,
      editorContent: fields[11] as String?,
      useBiometric: fields[12] == null ? false : fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.items)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.isPinned)
      ..writeByte(8)
      ..write(obj.colorIndex)
      ..writeByte(9)
      ..write(obj.passwordHash)
      ..writeByte(10)
      ..write(obj.isPasswordPin)
      ..writeByte(11)
      ..write(obj.editorContent)
      ..writeByte(12)
      ..write(obj.useBiometric);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoteTypeAdapter extends TypeAdapter<NoteType> {
  @override
  final typeId = 7;

  @override
  NoteType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NoteType.text;
      case 1:
        return NoteType.checklist;
      default:
        return NoteType.text;
    }
  }

  @override
  void write(BinaryWriter writer, NoteType obj) {
    switch (obj) {
      case NoteType.text:
        writer.writeByte(0);
      case NoteType.checklist:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
