import 'dart:math';
import 'package:hive_ce/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 7)
enum NoteType {
  @HiveField(0)
  text,
  @HiveField(1)
  checklist,
}

@HiveType(typeId: 8)
class ChecklistItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String text;

  @HiveField(2)
  bool isChecked;

  @HiveField(3)
  int position;

  ChecklistItem({
    required this.id,
    required this.text,
    this.isChecked = false,
    this.position = 0,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'isChecked': isChecked,
    'position': position,
  };

  factory ChecklistItem.fromJson(Map<String, dynamic> json) => ChecklistItem(
    id: json['id'] as String,
    text: json['text'] as String,
    isChecked: json['isChecked'] as bool? ?? false,
    position: json['position'] as int? ?? 0,
  );
}

@HiveType(typeId: 9)
class Note extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  NoteType type;

  @HiveField(4)
  List<ChecklistItem> items;

  @HiveField(5)
  DateTime createdAt;

  @HiveField(6)
  DateTime updatedAt;

  @HiveField(7, defaultValue: false)
  bool isPinned;

  @HiveField(8, defaultValue: 0)
  int colorIndex;

  @HiveField(9)
  String? passwordHash;

  @HiveField(10, defaultValue: true)
  bool isPasswordPin;

  @HiveField(11)
  String? editorContent; // JSON du document Quill Delta

  @HiveField(12, defaultValue: false)
  bool useBiometric; // Utiliser la biométrie pour cette note

  Note({
    required this.id,
    this.title = '',
    this.content = '',
    this.type = NoteType.text,
    List<ChecklistItem>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.isPinned = false,
    this.colorIndex = 0,
    this.passwordHash,
    this.isPasswordPin = true,
    this.editorContent,
    this.useBiometric = false,
  })  : items = items ?? [],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  bool get isLocked => passwordHash != null;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'type': type.index,
    'items': items.map((i) => i.toJson()).toList(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'isPinned': isPinned,
    'colorIndex': colorIndex,
    'passwordHash': passwordHash,
    'isPasswordPin': isPasswordPin,
    'editorContent': editorContent,
    'useBiometric': useBiometric,
  };

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json['id'] as String,
    title: json['title'] as String? ?? '',
    content: json['content'] as String? ?? '',
    type: NoteType.values[json['type'] as int? ?? 0],
    items: (json['items'] as List<dynamic>?)
        ?.map((i) => ChecklistItem.fromJson(i as Map<String, dynamic>))
        .toList(),
    createdAt: json['createdAt'] != null
        ? DateTime.parse(json['createdAt'] as String)
        : null,
    updatedAt: json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'] as String)
        : null,
    isPinned: json['isPinned'] as bool? ?? false,
    colorIndex: json['colorIndex'] as int? ?? 0,
    passwordHash: json['passwordHash'] as String?,
    isPasswordPin: json['isPasswordPin'] as bool? ?? true,
    editorContent: json['editorContent'] as String?,
    useBiometric: json['useBiometric'] as bool? ?? false,
  );

  String get preview {
    if (type == NoteType.text) {
      return content.substring(0, min(100, content.length));
    }
    final checked = items.where((i) => i.isChecked).length;
    return '$checked/${items.length}';
  }
}
