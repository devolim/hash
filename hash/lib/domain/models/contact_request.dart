/// Model for contact requests (pending, accepted, rejected)
class ContactRequest {
  final String id;
  final String requesterHashId;
  final String? recipientHashId;
  final String status; // pending, accepted, rejected, cancelled, expired
  final DateTime createdAt;
  final DateTime expiresAt;
  final DateTime? respondedAt;

  // Encrypted message from requester (base64 encoded)
  final String? encryptedMessage;

  // Crypto keys (for creating local contact after accept)
  final String? identityPublicKey;
  final String? signedPrekeyPublic;
  final String? signedPrekeySignature;
  final int? signedPrekeyId;
  final int? prekeyId;
  final String? prekeyPublic;

  // User ID of the other party
  final String? userId;

  // Zero-Knowledge tokens (for sealed sender messaging)
  final String? mailboxToken;
  final String? relayToken;
  final String? sealedSenderPublicKey;

  // Send token (authorization to send messages to this contact's mailbox)
  final String? sendToken;

  ContactRequest({
    required this.id,
    required this.requesterHashId,
    this.recipientHashId,
    required this.status,
    required this.createdAt,
    required this.expiresAt,
    this.respondedAt,
    this.encryptedMessage,
    this.identityPublicKey,
    this.signedPrekeyPublic,
    this.signedPrekeySignature,
    this.signedPrekeyId,
    this.prekeyId,
    this.prekeyPublic,
    this.userId,
    this.mailboxToken,
    this.relayToken,
    this.sealedSenderPublicKey,
    this.sendToken,
  });

  /// Create from JSON (for pending requests - recipient POV)
  factory ContactRequest.fromPendingJson(Map<String, dynamic> json) {
    return ContactRequest(
      id: json['id'] as String,
      requesterHashId: json['requester_hash_id'] as String,
      status: 'pending',
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
      encryptedMessage: json['encrypted_message'] as String?,
    );
  }

  /// Create from JSON (for accepted requests - requester POV, with acceptor keys)
  factory ContactRequest.fromAcceptedJson(Map<String, dynamic> json) {
    final acceptor = json['acceptor'] as Map<String, dynamic>?;
    return ContactRequest(
      id: json['id'] as String,
      requesterHashId: '',
      recipientHashId: json['recipient_hash_id'] as String,
      status: 'accepted',
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      respondedAt: json['responded_at'] != null
          ? DateTime.parse(json['responded_at'] as String)
          : null,
      userId: acceptor?['user_id'] as String?,
      identityPublicKey: acceptor?['identity_public_key'] as String?,
      signedPrekeyPublic: acceptor?['signed_prekey_public'] as String?,
      signedPrekeySignature: acceptor?['signed_prekey_signature'] as String?,
      signedPrekeyId: acceptor?['signed_prekey_id'] as int?,
      prekeyId: acceptor?['prekey_id'] as int?,
      prekeyPublic: acceptor?['prekey_public'] as String?,
      // Zero-Knowledge tokens
      mailboxToken: acceptor?['mailbox_token'] as String?,
      relayToken: acceptor?['relay_token'] as String?,
      sealedSenderPublicKey: acceptor?['sealed_sender_public_key'] as String?,
      // Send token for the requester to send to the acceptor's mailbox
      sendToken: json['send_token_for_requester'] as String?,
    );
  }

  /// Create from accept response (for recipient, with requester keys)
  factory ContactRequest.fromAcceptResponse(Map<String, dynamic> json) {
    final requester = json['requester'] as Map<String, dynamic>;
    return ContactRequest(
      id: '',
      requesterHashId: requester['hash_id'] as String,
      status: 'accepted',
      createdAt: DateTime.now(),
      expiresAt: DateTime.now(),
      userId: requester['user_id'] as String?,
      identityPublicKey: requester['identity_public_key'] as String?,
      signedPrekeyPublic: requester['signed_prekey_public'] as String?,
      signedPrekeySignature: requester['signed_prekey_signature'] as String?,
      signedPrekeyId: requester['signed_prekey_id'] as int?,
      prekeyId: requester['prekey_id'] as int?,
      prekeyPublic: requester['prekey_public'] as String?,
      // Zero-Knowledge tokens
      mailboxToken: requester['mailbox_token'] as String?,
      relayToken: requester['relay_token'] as String?,
      sealedSenderPublicKey: requester['sealed_sender_public_key'] as String?,
      // Send token for the acceptor to send to the requester's mailbox
      sendToken: json['send_token_for_acceptor'] as String?,
    );
  }

  /// Get hash ID for display (the other party's hash ID)
  String get displayHashId => recipientHashId ?? requesterHashId;

  /// Check if the request is still valid (not expired)
  bool get isValid => DateTime.now().isBefore(expiresAt);

  /// Get time remaining before expiration
  Duration get timeRemaining => expiresAt.difference(DateTime.now());

  @override
  String toString() => 'ContactRequest(id: $id, status: $status, requester: $requesterHashId)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactRequest && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
