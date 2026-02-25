import 'package:hive_ce/hive.dart';

part 'contact.g.dart';

const _sentinel = Object();

@HiveType(typeId: 1)
class Contact extends HiveObject {
  @HiveField(0)
  final String odid; // Other user's ID in Supabase

  @HiveField(1)
  final String hashId; // Other user's Hash ID (000-000-XXX)

  @HiveField(2)
  String displayName; // Locally stored name

  @HiveField(3)
  String? avatarPath; // Local path to avatar image

  @HiveField(4)
  String? notes; // Personal notes about contact

  @HiveField(5)
  final DateTime addedAt;

  @HiveField(6)
  DateTime? lastMessageAt;

  @HiveField(7)
  String? lastMessagePreview; // "New message" or similar (no content)

  @HiveField(8)
  int unreadCount;

  @HiveField(9)
  bool notificationsEnabled;

  @HiveField(10)
  bool callNotificationsEnabled;

  // Signal Protocol keys (stored locally)
  @HiveField(11)
  String? identityPublicKey;

  @HiveField(12)
  String? sessionData; // Serialized session for Signal Protocol

  // Zero-Knowledge Architecture fields
  @HiveField(13)
  String? mailboxToken; // Contact's anonymous mailbox token

  @HiveField(14)
  String? relayToken; // Contact's notification relay token

  @HiveField(15)
  String? verificationToken; // HKDF(DH_shared_secret, "contact_verification")

  @HiveField(16)
  String? sealedSenderPublicKey; // Contact's public key for sealed sender

  // Chat customization
  @HiveField(17)
  DateTime? mutedUntil; // Null = not muted, future date = muted until then

  @HiveField(18)
  String? notificationSound; // Custom notification sound path

  @HiveField(19)
  int? chatBubbleColor; // Custom bubble color (as int)

  @HiveField(24)
  String? chatBubbleGradient; // Gradient as "color1,color2" string

  @HiveField(20)
  int? chatBackgroundColor; // Custom background color (as int)

  @HiveField(21)
  String? chatBackgroundGradient; // Gradient as JSON string

  @HiveField(22)
  String? chatBackgroundImagePath; // Local path to background image

  @HiveField(23)
  int? ephemeralDuration; // Ephemeral duration override in seconds (null = use global preference, min = 60, >0 = specific)

  @HiveField(25)
  bool? sendReadReceipts; // null = follow global setting, true/false = override

  @HiveField(26)
  String? sendToken; // Token this contact gave us to send messages to their mailbox

  @HiveField(27, defaultValue: false)
  bool isPinned;

  @HiveField(28, defaultValue: false)
  bool isHidden;

  @HiveField(29, defaultValue: false)
  bool isBlocked;

  @HiveField(30)
  DateTime? lastSessionResetAt;

  @HiveField(31, defaultValue: 0)
  int ephemeralVersion;

  // Anti-replay counters (local only, inside encrypted envelope)
  @HiveField(32, defaultValue: 0)
  int sendCounter; // Incremented each time we send a message to this contact

  @HiveField(33, defaultValue: 0)
  int lastReceivedCounter; // Last counter received from this contact

  Contact({
    required this.odid,
    required this.hashId,
    required this.displayName,
    this.avatarPath,
    this.notes,
    required this.addedAt,
    this.lastMessageAt,
    this.lastMessagePreview,
    this.unreadCount = 0,
    this.notificationsEnabled = true,
    this.callNotificationsEnabled = true,
    this.identityPublicKey,
    this.sessionData,
    this.mailboxToken,
    this.relayToken,
    this.verificationToken,
    this.sealedSenderPublicKey,
    this.mutedUntil,
    this.notificationSound,
    this.chatBubbleColor,
    this.chatBubbleGradient,
    this.chatBackgroundColor,
    this.chatBackgroundGradient,
    this.chatBackgroundImagePath,
    this.ephemeralDuration,
    this.sendReadReceipts,
    this.sendToken,
    this.isPinned = false,
    this.isHidden = false,
    this.isBlocked = false,
    this.lastSessionResetAt,
    this.ephemeralVersion = 0,
    this.sendCounter = 0,
    this.lastReceivedCounter = 0,
  });

  Contact copyWith({
    String? odid,
    String? hashId,
    String? displayName,
    String? avatarPath,
    String? notes,
    DateTime? addedAt,
    DateTime? lastMessageAt,
    String? lastMessagePreview,
    int? unreadCount,
    bool? notificationsEnabled,
    bool? callNotificationsEnabled,
    String? identityPublicKey,
    String? sessionData,
    String? mailboxToken,
    String? relayToken,
    String? verificationToken,
    String? sealedSenderPublicKey,
    DateTime? mutedUntil,
    String? notificationSound,
    int? chatBubbleColor,
    String? chatBubbleGradient,
    int? chatBackgroundColor,
    String? chatBackgroundGradient,
    String? chatBackgroundImagePath,
    int? ephemeralDuration,
    Object? sendReadReceipts = _sentinel,
    String? sendToken,
    bool? isPinned,
    bool? isHidden,
    bool? isBlocked,
    DateTime? lastSessionResetAt,
    int? ephemeralVersion,
    int? sendCounter,
    int? lastReceivedCounter,
  }) =>
      Contact(
        odid: odid ?? this.odid,
        hashId: hashId ?? this.hashId,
        displayName: displayName ?? this.displayName,
        avatarPath: avatarPath ?? this.avatarPath,
        notes: notes ?? this.notes,
        addedAt: addedAt ?? this.addedAt,
        lastMessageAt: lastMessageAt ?? this.lastMessageAt,
        lastMessagePreview: lastMessagePreview ?? this.lastMessagePreview,
        unreadCount: unreadCount ?? this.unreadCount,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        callNotificationsEnabled:
            callNotificationsEnabled ?? this.callNotificationsEnabled,
        identityPublicKey: identityPublicKey ?? this.identityPublicKey,
        sessionData: sessionData ?? this.sessionData,
        mailboxToken: mailboxToken ?? this.mailboxToken,
        relayToken: relayToken ?? this.relayToken,
        verificationToken: verificationToken ?? this.verificationToken,
        sealedSenderPublicKey: sealedSenderPublicKey ?? this.sealedSenderPublicKey,
        mutedUntil: mutedUntil ?? this.mutedUntil,
        notificationSound: notificationSound ?? this.notificationSound,
        chatBubbleColor: chatBubbleColor ?? this.chatBubbleColor,
        chatBubbleGradient: chatBubbleGradient ?? this.chatBubbleGradient,
        chatBackgroundColor: chatBackgroundColor ?? this.chatBackgroundColor,
        chatBackgroundGradient: chatBackgroundGradient ?? this.chatBackgroundGradient,
        chatBackgroundImagePath: chatBackgroundImagePath ?? this.chatBackgroundImagePath,
        ephemeralDuration: ephemeralDuration ?? this.ephemeralDuration,
        sendReadReceipts: sendReadReceipts == _sentinel ? this.sendReadReceipts : sendReadReceipts as bool?,
        sendToken: sendToken ?? this.sendToken,
        isPinned: isPinned ?? this.isPinned,
        isHidden: isHidden ?? this.isHidden,
        isBlocked: isBlocked ?? this.isBlocked,
        lastSessionResetAt: lastSessionResetAt ?? this.lastSessionResetAt,
        ephemeralVersion: ephemeralVersion ?? this.ephemeralVersion,
        sendCounter: sendCounter ?? this.sendCounter,
        lastReceivedCounter: lastReceivedCounter ?? this.lastReceivedCounter,
      );

  /// Check if contact is currently muted
  bool get isMuted => mutedUntil != null && mutedUntil!.isAfter(DateTime.now());

  /// Get remaining mute duration
  Duration? get remainingMuteDuration {
    if (!isMuted) return null;
    return mutedUntil!.difference(DateTime.now());
  }

  /// Get initial (single letter) for avatar placeholder
  String get initials {
    final name = displayName.trim();
    if (name.isEmpty) return '?';
    return name[0].toUpperCase();
  }

  @override
  String toString() => 'Contact(hashId: $hashId, name: $displayName)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact && runtimeType == other.runtimeType && odid == other.odid;

  @override
  int get hashCode => odid.hashCode;

  /// Convert to JSON for backup
  Map<String, dynamic> toJson() => {
        'odid': odid,
        'hashId': hashId,
        'displayName': displayName,
        'avatarPath': avatarPath,
        'notes': notes,
        'addedAt': addedAt.toIso8601String(),
        'lastMessageAt': lastMessageAt?.toIso8601String(),
        'lastMessagePreview': lastMessagePreview,
        'unreadCount': unreadCount,
        'notificationsEnabled': notificationsEnabled,
        'callNotificationsEnabled': callNotificationsEnabled,
        'identityPublicKey': identityPublicKey,
        'sessionData': sessionData,
        'mailboxToken': mailboxToken,
        'relayToken': relayToken,
        'verificationToken': verificationToken,
        'sealedSenderPublicKey': sealedSenderPublicKey,
        'mutedUntil': mutedUntil?.toIso8601String(),
        'notificationSound': notificationSound,
        'chatBubbleColor': chatBubbleColor,
        'chatBubbleGradient': chatBubbleGradient,
        'chatBackgroundColor': chatBackgroundColor,
        'chatBackgroundGradient': chatBackgroundGradient,
        'chatBackgroundImagePath': chatBackgroundImagePath,
        'ephemeralDuration': ephemeralDuration,
        'sendReadReceipts': sendReadReceipts,
        'sendToken': sendToken,
        'isPinned': isPinned,
        'isHidden': isHidden,
        'isBlocked': isBlocked,
        'lastSessionResetAt': lastSessionResetAt?.toIso8601String(),
        'ephemeralVersion': ephemeralVersion,
        'sendCounter': sendCounter,
        'lastReceivedCounter': lastReceivedCounter,
      };

  /// Create from JSON
  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        odid: json['odid'] as String,
        hashId: json['hashId'] as String,
        displayName: json['displayName'] as String,
        avatarPath: json['avatarPath'] as String?,
        notes: json['notes'] as String?,
        addedAt: DateTime.parse(json['addedAt'] as String),
        lastMessageAt: json['lastMessageAt'] != null
            ? DateTime.parse(json['lastMessageAt'] as String)
            : null,
        lastMessagePreview: json['lastMessagePreview'] as String?,
        unreadCount: json['unreadCount'] as int? ?? 0,
        notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
        callNotificationsEnabled:
            json['callNotificationsEnabled'] as bool? ?? true,
        identityPublicKey: json['identityPublicKey'] as String?,
        sessionData: json['sessionData'] as String?,
        mailboxToken: json['mailboxToken'] as String?,
        relayToken: json['relayToken'] as String?,
        verificationToken: json['verificationToken'] as String?,
        sealedSenderPublicKey: json['sealedSenderPublicKey'] as String?,
        mutedUntil: json['mutedUntil'] != null
            ? DateTime.parse(json['mutedUntil'] as String)
            : null,
        notificationSound: json['notificationSound'] as String?,
        chatBubbleColor: json['chatBubbleColor'] as int?,
        chatBubbleGradient: json['chatBubbleGradient'] as String?,
        chatBackgroundColor: json['chatBackgroundColor'] as int?,
        chatBackgroundGradient: json['chatBackgroundGradient'] as String?,
        chatBackgroundImagePath: json['chatBackgroundImagePath'] as String?,
        ephemeralDuration: json['ephemeralDuration'] as int?,
        sendReadReceipts: json['sendReadReceipts'] as bool?,
        sendToken: json['sendToken'] as String?,
        isPinned: json['isPinned'] as bool? ?? false,
        isHidden: json['isHidden'] as bool? ?? false,
        isBlocked: json['isBlocked'] as bool? ?? false,
        lastSessionResetAt: json['lastSessionResetAt'] != null
            ? DateTime.parse(json['lastSessionResetAt'] as String)
            : null,
        ephemeralVersion: json['ephemeralVersion'] as int? ?? 0,
        sendCounter: json['sendCounter'] as int? ?? 0,
        lastReceivedCounter: json['lastReceivedCounter'] as int? ?? 0,
      );
}
