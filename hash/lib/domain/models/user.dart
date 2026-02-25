import 'package:hive_ce/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String hashId;

  @HiveField(2)
  final String deviceId;

  @HiveField(4)
  final DateTime createdAt;

  User({
    required this.id,
    required this.hashId,
    required this.deviceId,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['user_id'] as String,
        hashId: json['hash_id'] as String,
        deviceId: json['device_id'] as String? ?? '',
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'hash_id': hashId,
        'device_id': deviceId,
        'created_at': createdAt.toIso8601String(),
      };

  User copyWith({
    String? id,
    String? hashId,
    String? deviceId,
    DateTime? createdAt,
  }) =>
      User(
        id: id ?? this.id,
        hashId: hashId ?? this.hashId,
        deviceId: deviceId ?? this.deviceId,
        createdAt: createdAt ?? this.createdAt,
      );

  /// Formatted Hash ID for display (e.g., 123-456-ABC)
  String get formattedHashId => hashId;

  @override
  String toString() => 'User(hashId: $hashId)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
