import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/contact.dart';
import '../../domain/models/message.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/models/call_message.dart';
import '../../domain/models/call_settings.dart';
import '../../domain/models/note.dart';
import '../../domain/models/queued_message.dart';
import '../../domain/models/queued_receipt.dart';
import '../utils/media_utils.dart';

/// Pending contact metadata (stored until request is accepted)
class PendingContactMetadata {
  final String hashId;
  final String? name;
  final String? notes;
  final Uint8List? photoBytes;
  final DateTime createdAt;

  PendingContactMetadata({
    required this.hashId,
    this.name,
    this.notes,
    this.photoBytes,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'hashId': hashId,
    'name': name,
    'notes': notes,
    'photoBytes': photoBytes != null ? base64Encode(photoBytes!) : null,
    'createdAt': createdAt.toIso8601String(),
  };

  factory PendingContactMetadata.fromJson(Map<String, dynamic> json) {
    return PendingContactMetadata(
      hashId: json['hashId'] as String,
      name: json['name'] as String?,
      notes: json['notes'] as String?,
      photoBytes: json['photoBytes'] != null
          ? base64Decode(json['photoBytes'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}

/// Local storage service using Hive for contacts, messages, and settings
class LocalStorageService {
  static const String _contactsBox = 'contacts';
  static const String _messagesBox = 'messages';
  static const String _settingsBox = 'settings';
  static const String _sessionsBox = 'sessions';
  static const String _pendingContactsBox = 'pending_contacts';
  static const String _mediaPrefsBox = 'media_prefs';
  static const String _callMessagesBox = 'call_messages';
  static const String _callSettingsBox = 'call_settings';
  static const String _notesBox = 'notes';
  static const String _sendQueueBox = 'send_queue';
  static const String _receiptQueueBox = 'receipt_queue';

  Box<Contact>? _contacts;
  Box<Message>? _messages;
  Box<AppSettings>? _settings;
  Box<String>? _sessions;
  Box<String>? _pendingContacts;
  Box<String>? _mediaPrefs;
  Box<CallMessage>? _callMessages;
  Box<CallSettings>? _callSettings;
  Box<Note>? _notes;
  Box<QueuedMessage>? _sendQueue;
  Box<QueuedReceipt>? _receiptQueue;

  HiveAesCipher? _cipher;

  /// Set the encryption cipher for all Hive boxes
  void setCipher(List<int> masterKey) {
    _cipher = HiveAesCipher(Uint8List.fromList(masterKey));
  }

  /// Check if cipher is set
  bool get hasCipher => _cipher != null;

  /// Get the current cipher (for Signal Protocol stores that share the same encryption)
  HiveAesCipher? get cipher => _cipher;

  /// Close all boxes (for re-opening with new cipher after PIN entry)
  Future<void> closeAllBoxes() async {
    await _contacts?.close();
    await _messages?.close();
    await _settings?.close();
    await _sessions?.close();
    await _pendingContacts?.close();
    await _mediaPrefs?.close();
    await _callMessages?.close();
    await _callSettings?.close();
    await _notes?.close();
    await _sendQueue?.close();
    _contacts = null;
    _messages = null;
    _settings = null;
    _sessions = null;
    _pendingContacts = null;
    _mediaPrefs = null;
    _callMessages = null;
    _callSettings = null;
    _notes = null;
    _sendQueue = null;
  }

  /// Validate that cipher is set before opening encrypted boxes
  void _assertCipherSet() {
    assert(_cipher != null, 'Hive cipher must be set before opening boxes. Call setCipher() first.');
    if (_cipher == null) {
      throw StateError('Hive cipher not set. Call setCipher() before accessing data.');
    }
  }

  /// Open a Hive box with corruption recovery.
  /// If the box file is corrupted, delete and recreate it empty.
  Future<Box<T>> _openBoxSafe<T>(String boxName) async {
    try {
      return await Hive.openBox<T>(boxName, encryptionCipher: _cipher);
    } catch (e) {
      debugPrint('[LocalStorageService] Box "$boxName" corrupted, recreating: $e');
      await Hive.deleteBoxFromDisk(boxName);
      return await Hive.openBox<T>(boxName, encryptionCipher: _cipher);
    }
  }

  /// Get contacts box (opens if needed)
  Future<Box<Contact>> get _contactsBoxAsync async {
    _assertCipherSet();
    _contacts ??= await _openBoxSafe<Contact>(_contactsBox);
    return _contacts!;
  }

  /// Get messages box (opens if needed)
  Future<Box<Message>> get _messagesBoxAsync async {
    _assertCipherSet();
    _messages ??= await _openBoxSafe<Message>(_messagesBox);
    return _messages!;
  }

  /// Get settings box (opens if needed)
  Future<Box<AppSettings>> get _settingsBoxAsync async {
    _assertCipherSet();
    _settings ??= await _openBoxSafe<AppSettings>(_settingsBox);
    return _settings!;
  }

  /// Get sessions box (opens if needed)
  Future<Box<String>> get _sessionsBoxAsync async {
    _assertCipherSet();
    _sessions ??= await _openBoxSafe<String>(_sessionsBox);
    return _sessions!;
  }

  /// Get pending contacts box (opens if needed)
  Future<Box<String>> get _pendingContactsBoxAsync async {
    _assertCipherSet();
    _pendingContacts ??= await _openBoxSafe<String>(_pendingContactsBox);
    return _pendingContacts!;
  }

  /// Get media prefs box (opens if needed)
  Future<Box<String>> get _mediaPrefsBoxAsync async {
    _assertCipherSet();
    _mediaPrefs ??= await _openBoxSafe<String>(_mediaPrefsBox);
    return _mediaPrefs!;
  }

  /// Get call messages box (opens if needed)
  Future<Box<CallMessage>> get _callMessagesBoxAsync async {
    _assertCipherSet();
    _callMessages ??= await _openBoxSafe<CallMessage>(_callMessagesBox);
    return _callMessages!;
  }

  /// Get call settings box (opens if needed)
  Future<Box<CallSettings>> get _callSettingsBoxAsync async {
    _assertCipherSet();
    _callSettings ??= await _openBoxSafe<CallSettings>(_callSettingsBox);
    return _callSettings!;
  }

  /// Get notes box (opens if needed)
  Future<Box<Note>> get _notesBoxAsync async {
    _assertCipherSet();
    _notes ??= await _openBoxSafe<Note>(_notesBox);
    return _notes!;
  }

  // ============ CONTACTS ============
  Future<List<Contact>> getAllContacts() async {
    final box = await _contactsBoxAsync;
    return box.values.toList()
      ..sort((a, b) {
        // Sort by last message time, then by name
        if (a.lastMessageAt != null && b.lastMessageAt != null) {
          return b.lastMessageAt!.compareTo(a.lastMessageAt!);
        }
        if (a.lastMessageAt != null) return -1;
        if (b.lastMessageAt != null) return 1;
        return a.displayName.compareTo(b.displayName);
      });
  }

  Future<Contact?> getContact(String odid) async {
    final box = await _contactsBoxAsync;
    try {
      return box.values.firstWhere((c) => c.odid == odid);
    } catch (_) {
      return null;
    }
  }

  Future<Contact?> getContactByHashId(String hashId) async {
    final box = await _contactsBoxAsync;
    try {
      return box.values.firstWhere((c) => c.hashId == hashId);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveContact(Contact contact) async {
    final box = await _contactsBoxAsync;
    await box.put(contact.odid, contact);
  }

  Future<void> deleteContact(String odid) async {
    final contactsBox = await _contactsBoxAsync;
    final messagesBox = await _messagesBoxAsync;
    await contactsBox.delete(odid);
    // Also delete all messages and media files with this contact
    final messagesToDelete = messagesBox.values
        .where((m) => m.contactId == odid)
        .toList();

    // Supprimer les fichiers médias
    for (final message in messagesToDelete) {
      await _deleteMediaFile(message.mediaUrl);
    }

    // Supprimer les entrées des messages
    for (final message in messagesToDelete) {
      await messagesBox.delete(message.id);
    }
  }

  Future<Stream<BoxEvent>> watchContacts() async {
    final box = await _contactsBoxAsync;
    return box.watch();
  }

  // ============ MESSAGES ============
  Future<List<Message>> getMessagesForContact(String contactId) async {
    final box = await _messagesBoxAsync;
    return box.values
        .where((m) => m.contactId == contactId)
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }

  Future<Message?> getMessage(String id) async {
    final box = await _messagesBoxAsync;
    try {
      return box.values.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveMessage(Message message, {bool updateContactPreview = true}) async {
    final box = await _messagesBoxAsync;
    final isNew = !box.containsKey(message.id);
    await box.put(message.id, message);

    // Update contact's last message info only for new messages
    if (isNew && updateContactPreview) {
      final contact = await getContact(message.contactId);
      if (contact != null) {
        contact.lastMessageAt = message.timestamp;
        contact.lastMessagePreview = _generateMessagePreview(message);
        if (!message.isOutgoing && !message.isRead) {
          contact.unreadCount++;
        }
        await saveContact(contact);
      }
    }
  }

  String _generateMessagePreview(Message message) {
    switch (message.type) {
      case MessageType.text:
        final content = message.content;
        return content.length > 50 ? '${content.substring(0, 50)}...' : content;
      case MessageType.image:
        return '\u{1F4F7} Photo';
      case MessageType.video:
        return '\u{1F3AC} Vidéo';
      case MessageType.voice:
        return '\u{1F3A4} Message vocal';
      case MessageType.file:
        return '\u{1F4CE} Fichier';
      case MessageType.contact:
        return '\u{1F464} Contact';
      case MessageType.location:
        return '\u{1F4CD} Position';
      case MessageType.note:
        try {
          final data = jsonDecode(message.content) as Map<String, dynamic>;
          final title = data['title'] as String? ?? 'Note';
          return '\u{1F4DD} $title';
        } catch (_) {
          return '\u{1F4DD} Note';
        }
      case MessageType.reaction:
        return 'Réaction';
      case MessageType.edit:
        return 'Modification';
      case MessageType.delete:
        return '';
    }
  }

  /// Get all messages across all contacts
  Future<List<Message>> getAllMessages() async {
    final box = await _messagesBoxAsync;
    return box.values.toList();
  }

  Future<void> deleteMessage(String id) async {
    final box = await _messagesBoxAsync;
    final message = box.get(id);
    if (message != null) {
      await _deleteMediaFile(message.mediaUrl);
      // Supprimer la thumbnail si c'est un chemin local
      if (message.mediaThumbnail != null &&
          !message.mediaThumbnail!.startsWith('http') &&
          message.mediaThumbnail!.contains('/')) {
        await _deleteMediaFile(message.mediaThumbnail);
      }
    }
    await box.delete(id);
  }

  /// Delete only the Hive entry without deleting associated media files.
  /// Used by replaceMessageId to swap IDs without losing the media on disk.
  Future<void> deleteMessageEntry(String id) async {
    final box = await _messagesBoxAsync;
    await box.delete(id);
  }

  Future<void> deleteAllMessagesForContact(String contactId) async {
    final box = await _messagesBoxAsync;
    final messagesToDelete = box.values
        .where((m) => m.contactId == contactId)
        .toList();

    // Supprimer les fichiers médias associés aux messages
    for (final message in messagesToDelete) {
      await _deleteMediaFile(message.mediaUrl);
    }

    // Supprimer les entrées des messages de Hive
    for (final message in messagesToDelete) {
      await box.delete(message.id);
    }
  }

  /// Supprime un fichier média s'il existe localement
  Future<void> _deleteMediaFile(String? mediaUrl) async {
    if (mediaUrl == null || mediaUrl.isEmpty) return;

    // Vérifier si c'est un chemin de fichier local (pas une URL distante)
    if (mediaUrl.startsWith('http://') || mediaUrl.startsWith('https://')) {
      return;
    }

    try {
      // Résoudre le chemin pour gérer les changements d'UUID iOS
      final resolvedPath = MediaUtils.resolvePath(mediaUrl) ?? mediaUrl;
      final file = File(resolvedPath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Ignorer les erreurs de suppression (fichier déjà supprimé, etc.)
    }
  }

  Future<void> markMessagesAsRead(String contactId) async {
    final box = await _messagesBoxAsync;
    final messages = box.values
        .where((m) => m.contactId == contactId && !m.isOutgoing && !m.isRead);

    for (final message in messages) {
      message.isRead = true;
      message.readAt = DateTime.now();
      await box.put(message.id, message);
    }

    // Reset unread count for contact
    final contact = await getContact(contactId);
    if (contact != null) {
      contact.unreadCount = 0;
      await saveContact(contact);
    }
  }

  /// Mark a message as deleted for everyone (placeholder instead of physical delete)
  Future<Message?> markAsDeletedForEveryone(String messageId, {String? name}) async {
    final box = await _messagesBoxAsync;
    final message = box.get(messageId);
    if (message == null) return null;

    // Supprimer les fichiers médias associés
    await _deleteMediaFile(message.mediaUrl);
    if (message.mediaThumbnail != null &&
        !message.mediaThumbnail!.startsWith('http') &&
        message.mediaThumbnail!.contains('/')) {
      await _deleteMediaFile(message.mediaThumbnail);
    }

    // Mettre à jour le message en place
    message.isDeletedForEveryone = true;
    message.deletedByName = name;
    // Vider tout le contenu sensible
    final updated = message.copyWith(
      content: '',
      mediaUrl: null,
      mediaName: null,
      mediaFileId: null,
      mediaEncKey: null,
      mediaEncIv: null,
      mediaThumbnail: null,
      reactions: null,
      replyToPreview: null,
      isDeletedForEveryone: true,
      deletedByName: name,
    );

    await box.put(messageId, updated);

    // Mettre à jour l'aperçu du contact
    final contact = await getContact(updated.contactId);
    if (contact != null) {
      // Vérifier si c'était le dernier message
      final messages = box.values
          .where((m) => m.contactId == updated.contactId)
          .toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
      if (messages.isNotEmpty && messages.last.id == messageId) {
        contact.lastMessagePreview = 'Message supprimé';
        await saveContact(contact);
      }
    }

    return updated;
  }

  Future<Stream<BoxEvent>> watchMessages() async {
    final box = await _messagesBoxAsync;
    return box.watch();
  }

  // ============ SETTINGS ============
  Future<AppSettings> getSettings() async {
    final box = await _settingsBoxAsync;
    return box.get('settings') ?? AppSettings();
  }

  Future<void> saveSettings(AppSettings settings) async {
    final box = await _settingsBoxAsync;
    await box.put('settings', settings);
  }

  Future<Stream<BoxEvent>> watchSettings() async {
    final box = await _settingsBoxAsync;
    return box.watch();
  }

  // ============ SIGNAL PROTOCOL SESSIONS ============
  Future<void> saveSession(String contactId, String sessionData) async {
    final box = await _sessionsBoxAsync;
    await box.put(contactId, sessionData);
  }

  Future<String?> getSession(String contactId) async {
    final box = await _sessionsBoxAsync;
    return box.get(contactId);
  }

  Future<void> deleteSession(String contactId) async {
    final box = await _sessionsBoxAsync;
    await box.delete(contactId);
  }

  // ============ PENDING CONTACT METADATA ============
  /// Save pending contact metadata (when sending a contact request)
  Future<void> savePendingContactMetadata(PendingContactMetadata metadata) async {
    final box = await _pendingContactsBoxAsync;
    await box.put(metadata.hashId.toUpperCase(), jsonEncode(metadata.toJson()));
  }

  /// Get pending contact metadata by hash ID
  Future<PendingContactMetadata?> getPendingContactMetadata(String hashId) async {
    final box = await _pendingContactsBoxAsync;
    final json = box.get(hashId.toUpperCase());
    if (json == null) return null;
    try {
      return PendingContactMetadata.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  /// Delete pending contact metadata
  Future<void> deletePendingContactMetadata(String hashId) async {
    final box = await _pendingContactsBoxAsync;
    await box.delete(hashId.toUpperCase());
  }

  /// Get all pending contact metadata
  Future<List<PendingContactMetadata>> getAllPendingContactMetadata() async {
    final box = await _pendingContactsBoxAsync;
    final result = <PendingContactMetadata>[];
    for (final json in box.values) {
      try {
        result.add(PendingContactMetadata.fromJson(jsonDecode(json) as Map<String, dynamic>));
      } catch (_) {
        // Skip invalid entries
      }
    }
    return result;
  }

  // ============ MEDIA PREFERENCES PER CONTACT ============
  /// Get media preferences for a contact
  Future<Map<String, dynamic>?> getMediaPrefs(String contactId) async {
    final box = await _mediaPrefsBoxAsync;
    final json = box.get(contactId);
    if (json == null) return null;
    try {
      return jsonDecode(json) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  /// Save media preferences for a contact
  Future<void> saveMediaPrefs(String contactId, {required bool isViewOnce, required int viewOnceDuration}) async {
    final box = await _mediaPrefsBoxAsync;
    final prefs = {
      'isViewOnce': isViewOnce,
      'viewOnceDuration': viewOnceDuration,
    };
    await box.put(contactId, jsonEncode(prefs));
  }

  /// Delete media preferences for a contact
  Future<void> deleteMediaPrefs(String contactId) async {
    final box = await _mediaPrefsBoxAsync;
    await box.delete(contactId);
  }

  // ============ CALL MESSAGES ============
  /// Save a call message
  Future<void> saveCallMessage(CallMessage message) async {
    final box = await _callMessagesBoxAsync;
    await box.put(message.id, message);

    // Update contact's last message info
    final contact = await getContact(message.contactId);
    if (contact != null) {
      contact.lastMessageAt = message.timestamp;
      contact.lastMessagePreview = message.displayText;
      await saveContact(contact);
    }
  }

  /// Get all call messages for a contact
  Future<List<CallMessage>> getCallMessagesForContact(String contactId) async {
    final box = await _callMessagesBoxAsync;
    final messages = box.values
        .where((m) => m.contactId == contactId && !m.isExpired)
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return messages;
  }

  /// Get a specific call message
  Future<CallMessage?> getCallMessage(String id) async {
    final box = await _callMessagesBoxAsync;
    return box.get(id);
  }

  /// Delete a call message
  Future<void> deleteCallMessage(String id) async {
    final box = await _callMessagesBoxAsync;
    await box.delete(id);
  }

  /// Delete all call messages for a contact
  Future<void> deleteAllCallMessagesForContact(String contactId) async {
    final box = await _callMessagesBoxAsync;
    final toDelete = box.values.where((m) => m.contactId == contactId).toList();
    for (final message in toDelete) {
      await box.delete(message.id);
    }
  }

  /// Clean up expired call messages
  Future<void> cleanupExpiredCallMessages() async {
    final box = await _callMessagesBoxAsync;
    final expired = box.values.where((m) => m.isExpired).toList();
    for (final message in expired) {
      await box.delete(message.id);
    }
  }

  // ============ CALL SETTINGS ============
  /// Get call settings
  Future<CallSettings?> getCallSettings() async {
    final box = await _callSettingsBoxAsync;
    return box.get('call_settings');
  }

  /// Save call settings
  Future<void> saveCallSettings(CallSettings settings) async {
    final box = await _callSettingsBoxAsync;
    await box.put('call_settings', settings);
  }

  // ============ NOTES ============
  Future<List<Note>> getAllNotes() async {
    final box = await _notesBoxAsync;
    return box.values.toList();
  }

  Future<Note?> getNote(String id) async {
    final box = await _notesBoxAsync;
    return box.get(id);
  }

  Future<void> saveNote(Note note) async {
    final box = await _notesBoxAsync;
    await box.put(note.id, note);
  }

  Future<void> deleteNote(String id) async {
    final box = await _notesBoxAsync;
    await box.delete(id);
  }

  Stream<BoxEvent> watchNotes() {
    if (_notes != null) return _notes!.watch();
    throw StateError('Notes box not opened yet');
  }

  // ============ DATA COUNTS ============
  Future<int> getContactCount() async {
    final box = await _contactsBoxAsync;
    return box.length;
  }

  Future<int> getMessageCount() async {
    final box = await _messagesBoxAsync;
    return box.length;
  }

  Future<int> getSessionCount() async {
    final box = await _sessionsBoxAsync;
    return box.length;
  }

  Future<int> getPendingContactCount() async {
    final box = await _pendingContactsBoxAsync;
    return box.length;
  }

  Future<int> getMediaPrefsCount() async {
    final box = await _mediaPrefsBoxAsync;
    return box.length;
  }

  Future<int> getCallMessageCount() async {
    final box = await _callMessagesBoxAsync;
    return box.length;
  }

  Future<int> getNoteCount() async {
    final box = await _notesBoxAsync;
    return box.length;
  }

  // ============ DATA ACCESS FOR DETAIL SCREENS ============
  Future<List<String>> getSessionContactIds() async {
    final box = await _sessionsBoxAsync;
    return box.keys.cast<String>().toList();
  }

  Future<List<CallMessage>> getAllCallMessages() async {
    final box = await _callMessagesBoxAsync;
    return box.values.where((m) => !m.isExpired).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  Future<Map<String, Map<String, dynamic>>> getAllMediaPrefsEntries() async {
    final box = await _mediaPrefsBoxAsync;
    final result = <String, Map<String, dynamic>>{};
    for (final key in box.keys) {
      final json = box.get(key as String);
      if (json != null) {
        try {
          result[key] = jsonDecode(json) as Map<String, dynamic>;
        } catch (_) {}
      }
    }
    return result;
  }

  Future<int> getMessageCountForContact(String contactId) async {
    final box = await _messagesBoxAsync;
    return box.values.where((m) => m.contactId == contactId).length;
  }

  Future<void> deleteAllCallMessages() async {
    final box = await _callMessagesBoxAsync;
    await box.clear();
  }

  Future<void> deleteAllMediaPrefs() async {
    final box = await _mediaPrefsBoxAsync;
    await box.clear();
  }

  // ============ DELETE ALL DATA ============
  Future<void> deleteAllData() async {
    // Get all boxes
    final contactsBox = await _contactsBoxAsync;
    final messagesBox = await _messagesBoxAsync;
    final sessionsBox = await _sessionsBoxAsync;
    final settingsBox = await _settingsBoxAsync;
    final pendingContactsBox = await _pendingContactsBoxAsync;
    final mediaPrefsBox = await _mediaPrefsBoxAsync;
    final callMessagesBox = await _callMessagesBoxAsync;
    final callSettingsBox = await _callSettingsBoxAsync;
    final notesBox = await _notesBoxAsync;

    // Supprimer tous les fichiers médias avant de vider les boxes
    for (final message in messagesBox.values) {
      await _deleteMediaFile(message.mediaUrl);
    }

    // Supprimer les fichiers du filesystem (avatars, fonds de chat, médias)
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final avatarsDir = Directory('${appDir.path}/avatars');
      if (await avatarsDir.exists()) {
        await avatarsDir.delete(recursive: true);
      }
      final mediaDir = Directory('${appDir.path}/media');
      if (await mediaDir.exists()) {
        await mediaDir.delete(recursive: true);
      }
    } catch (e) {
      debugPrint('[LocalStorageService] Deleting media/avatar directories failed: $e');
    }

    // Supprimer les fonds de chat référencés par les contacts
    for (final contact in contactsBox.values) {
      if (contact.chatBackgroundImagePath != null) {
        await _deleteMediaFile(contact.chatBackgroundImagePath);
      }
    }

    // Nettoyer le cache SharedPreferences des noms de contacts
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('contact_names_cache');
    } catch (e) {
      debugPrint('[LocalStorageService] Clearing contact names cache failed: $e');
    }

    // Clear all data from boxes
    await contactsBox.clear();
    await messagesBox.clear();
    await sessionsBox.clear();
    await pendingContactsBox.clear();
    await mediaPrefsBox.clear();
    await callMessagesBox.clear();
    await callSettingsBox.clear();
    await notesBox.clear();

    // Reset settings to defaults
    await settingsBox.clear();
    await settingsBox.put('settings', AppSettings());

    // Delete and recreate boxes to ensure complete data removal
    await contactsBox.deleteFromDisk();
    await messagesBox.deleteFromDisk();
    await sessionsBox.deleteFromDisk();
    await pendingContactsBox.deleteFromDisk();
    await mediaPrefsBox.deleteFromDisk();
    await callMessagesBox.deleteFromDisk();
    await callSettingsBox.deleteFromDisk();
    await notesBox.deleteFromDisk();

    // Delete send queue
    try {
      final sendQueueBox = await _sendQueueBoxAsync;
      await sendQueueBox.deleteFromDisk();
    } catch (_) {}

    // Delete receipt queue
    try {
      final receiptQueueBox = await _receiptQueueBoxAsync;
      await receiptQueueBox.deleteFromDisk();
    } catch (_) {}

    // Delete Signal Protocol Double Ratchet stores
    for (final boxName in ['signal_sessions', 'signal_prekeys', 'signal_signed_prekeys', 'signal_identities']) {
      try {
        await Hive.deleteBoxFromDisk(boxName);
      } catch (_) {}
    }

    // Reset cached references so boxes are re-opened fresh
    _contacts = null;
    _messages = null;
    _sessions = null;
    _pendingContacts = null;
    _mediaPrefs = null;
    _callMessages = null;
    _callSettings = null;
    _notes = null;
    _sendQueue = null;
    _receiptQueue = null;
    // Keep _settings reference as we just reset it
  }

  // ============ SEND QUEUE (Persistent) ============

  /// Get send queue box (opens if needed)
  Future<Box<QueuedMessage>> get _sendQueueBoxAsync async {
    _assertCipherSet();
    _sendQueue ??= await _openBoxSafe<QueuedMessage>(_sendQueueBox);
    return _sendQueue!;
  }

  /// Add a message to the persistent send queue
  Future<void> addToSendQueue(QueuedMessage item) async {
    final box = await _sendQueueBoxAsync;
    await box.put(item.messageId, item);
  }

  /// Remove a message from the persistent send queue
  Future<void> removeFromSendQueue(String messageId) async {
    final box = await _sendQueueBoxAsync;
    await box.delete(messageId);
  }

  /// Update retry info in persistent queue
  Future<void> updateSendQueueRetry(String messageId, int retryCount, DateTime nextRetryAt) async {
    final box = await _sendQueueBoxAsync;
    final item = box.get(messageId);
    if (item != null) {
      item.retryCount = retryCount;
      item.nextRetryAt = nextRetryAt;
      await item.save();
    }
  }

  /// Get all queued messages for restoration
  Future<List<QueuedMessage>> getSendQueue() async {
    final box = await _sendQueueBoxAsync;
    return box.values.toList();
  }

  // ============ RECEIPT QUEUE (Persistent) ============

  /// Get receipt queue box (opens if needed)
  Future<Box<QueuedReceipt>> get _receiptQueueBoxAsync async {
    _assertCipherSet();
    _receiptQueue ??= await _openBoxSafe<QueuedReceipt>(_receiptQueueBox);
    return _receiptQueue!;
  }

  /// Add a receipt to the persistent receipt queue
  Future<void> addToReceiptQueue(QueuedReceipt item) async {
    final box = await _receiptQueueBoxAsync;
    await box.put(item.id, item);
  }

  /// Remove a receipt from the persistent receipt queue
  Future<void> removeFromReceiptQueue(String receiptId) async {
    final box = await _receiptQueueBoxAsync;
    await box.delete(receiptId);
  }

  /// Update retry info in persistent receipt queue
  Future<void> updateReceiptQueueRetry(String receiptId, int retryCount, DateTime nextRetryAt) async {
    final box = await _receiptQueueBoxAsync;
    final item = box.get(receiptId);
    if (item != null) {
      item.retryCount = retryCount;
      item.nextRetryAt = nextRetryAt;
      await item.save();
    }
  }

  /// Get all queued receipts for restoration
  Future<List<QueuedReceipt>> getReceiptQueue() async {
    final box = await _receiptQueueBoxAsync;
    return box.values.toList();
  }

  /// Close all boxes
  Future<void> close() async {
    await Hive.close();
  }
}
