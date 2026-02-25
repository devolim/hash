import 'package:hive_ce/hive.dart';

part 'message.g.dart';

@HiveType(typeId: 2)
enum MessageType {
  @HiveField(0)
  text,
  @HiveField(1)
  image,
  @HiveField(2)
  video,
  @HiveField(3)
  voice,
  @HiveField(4)
  file,
  @HiveField(5)
  contact,
  @HiveField(6)
  location,
  @HiveField(7)
  note,
  @HiveField(8)
  reaction,
  @HiveField(9)
  edit,
  @HiveField(10)
  delete,
}

@HiveType(typeId: 3)
enum MessageStatus {
  @HiveField(0)
  sending,
  @HiveField(1)
  sent,
  @HiveField(2)
  delivered,
  @HiveField(3)
  read,
  @HiveField(4)
  failed,
  @HiveField(5)
  queued,
}

@HiveType(typeId: 4)
class Message extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String contactId; // The other party's user ID

  @HiveField(2)
  final bool isOutgoing; // true = sent by me, false = received

  @HiveField(3)
  final MessageType type;

  @HiveField(4)
  final String content; // Decrypted content (text or file path)

  @HiveField(5)
  final DateTime timestamp;

  @HiveField(6)
  MessageStatus status;

  @HiveField(7)
  final String? mediaUrl; // Local path for media

  @HiveField(8)
  final String? mediaName; // Original filename

  @HiveField(9)
  final int? mediaSizeBytes;

  @HiveField(10)
  final int? mediaDurationSeconds; // For voice/video

  @HiveField(11)
  final bool mediaDownloadable; // Can recipient save to gallery?

  @HiveField(12)
  bool isRead; // Has the message been viewed?

  @HiveField(13)
  DateTime? readAt; // When was it read?

  @HiveField(14)
  DateTime? expiresAt; // For auto-delete timer display

  @HiveField(15)
  final bool isViewOnce; // Vue unique - disparaît après visualisation

  @HiveField(16)
  final int? viewOnceDuration; // Durée de visibilité en secondes

  @HiveField(17)
  bool viewOnceOpened; // A été ouvert (pour vue unique)

  @HiveField(18)
  int? ephemeralRemainingSeconds; // Temps restant avant suppression (en pause quand dans la conversation)

  @HiveField(19)
  String? mediaFileId; // UUID serveur (fichier dans Supabase Storage)

  @HiveField(20)
  String? mediaEncKey; // Clé AES-256 base64 (nettoyée après download)

  @HiveField(21)
  String? mediaEncIv; // IV AES base64

  @HiveField(22)
  String? mediaThumbnail; // Preview flou base64

  @HiveField(23)
  String? mediaMimeType; // Type MIME original

  @HiveField(24)
  int? mediaDownloadStatus; // 0=pending 1=downloading 2=done 3=failed 4=expired

  @HiveField(25)
  final int? mediaWidth; // Largeur originale du média (pour ratio thumbnail)

  @HiveField(26)
  final int? mediaHeight; // Hauteur originale du média (pour ratio thumbnail)

  @HiveField(27)
  DateTime? maxExpiresAt; // Fallback 24h : suppression garantie

  @HiveField(28)
  int? ephemeralDurationSeconds; // Duration in seconds (timer starts on read)

  @HiveField(29)
  String? reactionTargetId; // ID of message this reaction targets

  @HiveField(30)
  String? reactions; // JSON: {"emoji": count, ...} or list of reactions

  @HiveField(31)
  String? replyToId; // ID of message being replied to

  @HiveField(32)
  String? replyToPreview; // First 100 chars of replied message

  @HiveField(33)
  String? editedMessageId; // ID of message being edited

  @HiveField(34, defaultValue: false)
  bool isEdited; // Whether this message has been edited

  @HiveField(35)
  DateTime? editedAt; // When the message was last edited

  @HiveField(36, defaultValue: false)
  bool isDeletedForEveryone; // Message supprimé pour tous (placeholder visible)

  @HiveField(37)
  String? deletedByName; // Nom de celui qui a supprimé (null = moi)

  Message({
    required this.id,
    required this.contactId,
    required this.isOutgoing,
    required this.type,
    required this.content,
    required this.timestamp,
    this.status = MessageStatus.sending,
    this.mediaUrl,
    this.mediaName,
    this.mediaSizeBytes,
    this.mediaDurationSeconds,
    this.mediaDownloadable = false,
    this.isRead = false,
    this.readAt,
    this.expiresAt,
    this.isViewOnce = false,
    this.viewOnceDuration,
    this.viewOnceOpened = false,
    this.ephemeralRemainingSeconds,
    this.mediaFileId,
    this.mediaEncKey,
    this.mediaEncIv,
    this.mediaThumbnail,
    this.mediaMimeType,
    this.mediaDownloadStatus,
    this.mediaWidth,
    this.mediaHeight,
    this.maxExpiresAt,
    this.ephemeralDurationSeconds,
    this.reactionTargetId,
    this.reactions,
    this.replyToId,
    this.replyToPreview,
    this.editedMessageId,
    this.isEdited = false,
    this.editedAt,
    this.isDeletedForEveryone = false,
    this.deletedByName,
  });

  Message copyWith({
    String? id,
    String? contactId,
    bool? isOutgoing,
    MessageType? type,
    String? content,
    DateTime? timestamp,
    MessageStatus? status,
    String? mediaUrl,
    String? mediaName,
    int? mediaSizeBytes,
    int? mediaDurationSeconds,
    bool? mediaDownloadable,
    bool? isRead,
    DateTime? readAt,
    DateTime? expiresAt,
    bool? isViewOnce,
    int? viewOnceDuration,
    bool? viewOnceOpened,
    int? ephemeralRemainingSeconds,
    String? mediaFileId,
    String? mediaEncKey,
    String? mediaEncIv,
    String? mediaThumbnail,
    String? mediaMimeType,
    int? mediaDownloadStatus,
    int? mediaWidth,
    int? mediaHeight,
    DateTime? maxExpiresAt,
    int? ephemeralDurationSeconds,
    String? reactionTargetId,
    String? reactions,
    String? replyToId,
    String? replyToPreview,
    String? editedMessageId,
    bool? isEdited,
    DateTime? editedAt,
    bool? isDeletedForEveryone,
    String? deletedByName,
  }) =>
      Message(
        id: id ?? this.id,
        contactId: contactId ?? this.contactId,
        isOutgoing: isOutgoing ?? this.isOutgoing,
        type: type ?? this.type,
        content: content ?? this.content,
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        mediaUrl: mediaUrl ?? this.mediaUrl,
        mediaName: mediaName ?? this.mediaName,
        mediaSizeBytes: mediaSizeBytes ?? this.mediaSizeBytes,
        mediaDurationSeconds: mediaDurationSeconds ?? this.mediaDurationSeconds,
        mediaDownloadable: mediaDownloadable ?? this.mediaDownloadable,
        isRead: isRead ?? this.isRead,
        readAt: readAt ?? this.readAt,
        expiresAt: expiresAt ?? this.expiresAt,
        isViewOnce: isViewOnce ?? this.isViewOnce,
        viewOnceDuration: viewOnceDuration ?? this.viewOnceDuration,
        viewOnceOpened: viewOnceOpened ?? this.viewOnceOpened,
        ephemeralRemainingSeconds: ephemeralRemainingSeconds ?? this.ephemeralRemainingSeconds,
        mediaFileId: mediaFileId ?? this.mediaFileId,
        mediaEncKey: mediaEncKey ?? this.mediaEncKey,
        mediaEncIv: mediaEncIv ?? this.mediaEncIv,
        mediaThumbnail: mediaThumbnail ?? this.mediaThumbnail,
        mediaMimeType: mediaMimeType ?? this.mediaMimeType,
        mediaDownloadStatus: mediaDownloadStatus ?? this.mediaDownloadStatus,
        mediaWidth: mediaWidth ?? this.mediaWidth,
        mediaHeight: mediaHeight ?? this.mediaHeight,
        maxExpiresAt: maxExpiresAt ?? this.maxExpiresAt,
        ephemeralDurationSeconds: ephemeralDurationSeconds ?? this.ephemeralDurationSeconds,
        reactionTargetId: reactionTargetId ?? this.reactionTargetId,
        reactions: reactions ?? this.reactions,
        replyToId: replyToId ?? this.replyToId,
        replyToPreview: replyToPreview ?? this.replyToPreview,
        editedMessageId: editedMessageId ?? this.editedMessageId,
        isEdited: isEdited ?? this.isEdited,
        editedAt: editedAt ?? this.editedAt,
        isDeletedForEveryone: isDeletedForEveryone ?? this.isDeletedForEveryone,
        deletedByName: deletedByName ?? this.deletedByName,
      );

  /// Calculate reading time based on content length (for text messages)
  Duration get readingTime {
    if (type != MessageType.text) {
      return Duration(seconds: mediaDurationSeconds ?? 5);
    }
    // Average reading speed: 200 words per minute
    // Minimum 3 seconds, maximum 30 seconds
    final wordCount = content.split(' ').length;
    final seconds = (wordCount / 200 * 60).clamp(3, 30).round();
    return Duration(seconds: seconds);
  }

  /// Formatted file size
  String get formattedSize {
    if (mediaSizeBytes == null) return '';
    if (mediaSizeBytes! < 1024) return '$mediaSizeBytes B';
    if (mediaSizeBytes! < 1024 * 1024) {
      return '${(mediaSizeBytes! / 1024).toStringAsFixed(1)} KB';
    }
    return '${(mediaSizeBytes! / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  /// Formatted duration for voice/video
  String get formattedDuration {
    if (mediaDurationSeconds == null) return '';
    final minutes = mediaDurationSeconds! ~/ 60;
    final seconds = mediaDurationSeconds! % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  String toString() => 'Message(id: $id, type: $type, isOutgoing: $isOutgoing)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
