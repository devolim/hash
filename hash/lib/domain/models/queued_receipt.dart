import 'package:hive_ce/hive.dart';

part 'queued_receipt.g.dart';

/// Persistent receipt queue item stored in Hive.
/// Survives app crashes and restarts.
@HiveType(typeId: 13)
class QueuedReceipt extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String contactId;

  @HiveField(2)
  final String receiptType; // 'delivery_receipt' | 'read_receipt' | 'silent_read'

  @HiveField(3)
  final List<String> messageIds;

  @HiveField(4)
  int retryCount;

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  DateTime? nextRetryAt;

  QueuedReceipt({
    required this.id,
    required this.contactId,
    required this.receiptType,
    required this.messageIds,
    this.retryCount = 0,
    required this.createdAt,
    this.nextRetryAt,
  });

  @override
  String toString() => 'QueuedReceipt(id: $id, type: $receiptType, retry: $retryCount)';
}
