import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../core/services/edge_function_service.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/services/notification_service.dart';
import '../../domain/models/message.dart';

/// Repository for message operations
class MessageRepository {
  final SupabaseClient _client;
  final LocalStorageService _localStorage;
  final EdgeFunctionService _edgeFunctions;
  final _uuid = const Uuid();

  StreamSubscription? _messageSubscription;
  final _messageController = StreamController<Message>.broadcast();

  MessageRepository({
    required SupabaseClient client,
    required LocalStorageService localStorage,
  })  : _client = client,
        _localStorage = localStorage,
        _edgeFunctions = EdgeFunctionService(client);

  /// Stream of incoming messages
  Stream<Message> get incomingMessages => _messageController.stream;

  /// Start listening for new messages
  void startListening(String userId) {
    _messageSubscription?.cancel();

    _messageSubscription = _client
        .from('pending_messages')
        .stream(primaryKey: ['id'])
        .eq('recipient_id', userId)
        .listen((data) {
          for (final row in data) {
            _handleIncomingMessage(row);
          }
        });
  }

  /// Stop listening for messages
  void stopListening() {
    _messageSubscription?.cancel();
    _messageSubscription = null;
  }

  /// Handle incoming message from realtime
  Future<void> _handleIncomingMessage(Map<String, dynamic> data) async {
    final message = Message(
      id: data['id'] as String,
      contactId: data['sender_id'] as String,
      isOutgoing: false,
      type: MessageType.text, // Will be determined after decryption
      content: data['encrypted_content'] as String, // Still encrypted
      timestamp: DateTime.parse(data['created_at'] as String),
      status: MessageStatus.delivered,
      mediaUrl: data['encrypted_media_url'] as String?,
      mediaDownloadable: data['media_downloadable'] as bool? ?? false,
    );

    // Notify listeners (they will decrypt the message)
    _messageController.add(message);
  }

  /// Send a message via Edge Function (sécurisé avec rate limiting)
  Future<String> sendMessage({
    required String recipientId,
    required String encryptedContent,
    String? encryptedMediaUrl,
    bool mediaDownloadable = false,
  }) async {
    final response = await _edgeFunctions.sendMessage(
      recipientId: recipientId,
      encryptedContent: encryptedContent,
      encryptedMediaUrl: encryptedMediaUrl,
      mediaDownloadable: mediaDownloadable,
    );

    return response['message_id'] as String;
  }

  /// Save message locally
  Future<void> saveMessageLocally(Message message, {bool updateContactPreview = true}) async {
    await _localStorage.saveMessage(message, updateContactPreview: updateContactPreview);
  }

  /// Get messages for a contact (from local storage)
  Future<List<Message>> getMessagesForContact(String contactId) async {
    return await _localStorage.getMessagesForContact(contactId);
  }

  /// Get a single message by ID
  Future<Message?> getMessageById(String messageId) async {
    return await _localStorage.getMessage(messageId);
  }

  /// Delete message locally
  Future<void> deleteMessageLocally(String messageId) async {
    await _localStorage.deleteMessage(messageId);
  }

  /// Mark message as deleted for everyone (placeholder)
  Future<Message?> markAsDeletedForEveryone(String messageId, {String? name}) async {
    return await _localStorage.markAsDeletedForEveryone(messageId, name: name);
  }

  /// Mark messages as read and clear notifications if no unread left
  Future<void> markAsRead(String contactId) async {
    await _localStorage.markMessagesAsRead(contactId);

    // Check if there are any remaining unread messages across all contacts
    final contacts = await _localStorage.getAllContacts();
    final totalUnread = contacts.fold<int>(0, (sum, c) => sum + c.unreadCount);
    if (totalUnread == 0) {
      await NotificationService().removeAllDeliveredNotifications();
    }
  }

  /// Create a local message (for outgoing messages before sending)
  Message createLocalMessage({
    required String contactId,
    required MessageType type,
    required String content,
    String? mediaUrl,
    String? mediaName,
    int? mediaSizeBytes,
    int? mediaDurationSeconds,
    bool mediaDownloadable = false,
    bool isViewOnce = false,
    int? viewOnceDuration,
  }) {
    return Message(
      id: _uuid.v4(),
      contactId: contactId,
      isOutgoing: true,
      type: type,
      content: content,
      timestamp: DateTime.now(),
      status: MessageStatus.sending,
      mediaUrl: mediaUrl,
      mediaName: mediaName,
      mediaSizeBytes: mediaSizeBytes,
      mediaDurationSeconds: mediaDurationSeconds,
      mediaDownloadable: mediaDownloadable,
      isViewOnce: isViewOnce,
      viewOnceDuration: viewOnceDuration,
      maxExpiresAt: DateTime.now().add(const Duration(hours: 24)),
    );
  }

  /// Replace local message ID with server message ID (for receipt matching)
  Future<Message?> replaceMessageId(String oldId, String newId) async {
    final message = await _localStorage.getMessage(oldId);
    if (message == null) return null;
    // Delete old Hive entry only (keep media files on disk)
    await _localStorage.deleteMessageEntry(oldId);
    // Create new message with server ID
    final updated = message.copyWith(id: newId);
    await _localStorage.saveMessage(updated);
    return updated;
  }

  /// Update message status
  Future<void> updateMessageStatus(String messageId, MessageStatus status) async {
    final message = await _localStorage.getMessage(messageId);
    if (message != null) {
      message.status = status;
      await _localStorage.saveMessage(message);
    }
  }

  /// Delete all messages for a contact
  Future<void> deleteAllMessagesForContact(String contactId) async {
    await _localStorage.deleteAllMessagesForContact(contactId);
  }

  /// Dispose resources
  void dispose() {
    stopListening();
    _messageController.close();
  }
}
