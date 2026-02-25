import 'package:hive_ce/hive.dart';

part 'queued_message.g.dart';

/// Persistent send queue item stored in Hive.
/// Survives app crashes and restarts.
@HiveType(typeId: 12)
class QueuedMessage extends HiveObject {
  @HiveField(0)
  final String messageId;

  @HiveField(1)
  final String contactId;

  @HiveField(2)
  final String? filePath;

  @HiveField(3)
  final String? mimeType;

  @HiveField(4)
  int retryCount;

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  DateTime? nextRetryAt;

  @HiveField(7)
  final int priority; // 0 = normal, 1 = high

  QueuedMessage({
    required this.messageId,
    required this.contactId,
    this.filePath,
    this.mimeType,
    this.retryCount = 0,
    required this.createdAt,
    this.nextRetryAt,
    this.priority = 0,
  });

  @override
  String toString() => 'QueuedMessage(id: $messageId, retry: $retryCount)';
}
