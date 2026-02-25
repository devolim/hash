import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/services/clipboard_service.dart';
import 'package:intl/intl.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:open_filex/open_filex.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact.dart';
import '../../../domain/models/message.dart';
import '../../../data/repositories/message_repository.dart';
import '../../providers/app_providers.dart';
import '../../widgets/common/avatar.dart';
import '../../widgets/chat/message_bubble.dart';
import '../../widgets/chat/message_input.dart';
import '../../widgets/chat/message_actions_sheet.dart';
import '../../widgets/chat/delete_confirmation_sheet.dart';
import '../../widgets/chat/message_info_sheet.dart';
import '../../widgets/chat/media_viewer_screen.dart';
import '../../widgets/chat/view_once_viewer_screen.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../providers/call_providers.dart';
import '../../../domain/models/call_state.dart';
import '../../../domain/models/call_message.dart';
import '../../../core/services/media_storage_service.dart';
import '../../../core/services/edge_function_service.dart';
import '../../../core/services/message_send_queue_service.dart';
import '../../../core/services/receipt_queue_service.dart';
import '../../../core/utils/media_utils.dart';
import '../../widgets/call/call_message_bubble.dart';
import '../../widgets/chat/voice_playback_controller.dart';
import '../../../domain/models/note.dart';
import 'package:uuid/uuid.dart';
import '../../../core/services/ui_sound_service.dart';

/// Élément unifié du timeline (message ou appel)
class ChatItem {
  final Message? message;
  final CallMessage? callMessage;

  ChatItem.fromMessage(Message m) : message = m, callMessage = null;
  ChatItem.fromCall(CallMessage c) : callMessage = c, message = null;

  bool get isCallMessage => callMessage != null;
  DateTime get timestamp => message?.timestamp ?? callMessage!.timestamp;
}

class ChatScreen extends ConsumerStatefulWidget {
  final String contactId;
  final bool fromCall;

  const ChatScreen({super.key, required this.contactId, this.fromCall = false});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<MessageInputState> _messageInputKey = GlobalKey<MessageInputState>();
  List<ChatItem> _items = [];
  Timer? _refreshTimer;
  bool _initialScrollDone = false;
  double _previousKeyboardHeight = 0;
  bool _showScrollToBottom = false;
  bool _isDisposed = false;
  bool _isSendingMedia = false; // Guard contre double envoi média
  bool _isOpeningExternalFile = false; // Guard pour ne pas supprimer les messages éphémères lors d'ouverture de fichier

  // Mode sélection multiple
  bool _isSelectionMode = false;
  final Set<String> _selectedMessageIds = {};

  late final VoicePlaybackController _voicePlaybackController;
  Map<String, int> _voiceGroups = {};

  @override
  void initState() {
    super.initState();
    _voicePlaybackController = VoicePlaybackController();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_onScroll);

    // Set current chat contact ID for notification handling (no push notif when in chat)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(currentChatContactIdProvider.notifier).state = widget.contactId;
      }
    });

    _handleEnterConversation().then((_) {
      if (!_isDisposed && mounted) _loadMessages();
    });

    // Setup callback pour les changements de status de la queue d'envoi
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final sendQueue = ref.read(messageSendQueueServiceProvider);
      sendQueue.onStatusChanged = (messageId, newStatus, {String? newServerId, Message? updatedMessage}) {
        if (!mounted || _isDisposed) return;
        setState(() {
          final index = _items.indexWhere((i) => !i.isCallMessage && i.message!.id == messageId);
          if (index != -1) {
            final currentMsg = _items[index].message!;
            final updated = updatedMessage ?? currentMsg.copyWith(status: newStatus);
            // Si le serveur a renvoyé un nouvel ID, mettre à jour
            final finalMsg = newServerId != null
                ? updated.copyWith(id: newServerId, status: newStatus)
                : updated.copyWith(status: newStatus);
            _items[index] = ChatItem.fromMessage(finalMsg);
          }
        });
      };
    });
    // Refresh messages every 2 seconds while chat is open
    _refreshTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (!_isDisposed && mounted) _refreshMessages();
    });
  }

  /// Gère l'entrée dans la conversation : supprime les messages expirés et met les timers en pause
  Future<void> _handleEnterConversation() async {
    final messageRepo = ref.read(messageRepositoryProvider);
    final localStorage = ref.read(localStorageProvider);
    final contacts = ref.read(contactsProvider);
    final messages = await messageRepo.getMessagesForContact(widget.contactId);
    final now = DateTime.now();

    // Récupérer la configuration du contact
    Contact? contact;
    for (final c in contacts) {
      if (c.odid == widget.contactId) {
        contact = c;
        break;
      }
    }

    final settings = ref.read(appSettingsProvider);
    final ephemeralDuration = contact?.ephemeralDuration ?? settings.defaultEphemeralDuration;

    // Mode "Immédiatement" : ne supprimer que les messages dont le fallback 24h est dépassé
    if (ephemeralDuration == 0) {
      for (final message in messages) {
        if (message.maxExpiresAt != null && message.maxExpiresAt!.isBefore(now)) {
          await messageRepo.deleteMessageLocally(message.id);
        }
      }
      await localStorage.cleanupExpiredCallMessages();
    } else {
      for (final message in messages) {
        // Fallback 24h : supprimer si maxExpiresAt dépassé
        if (message.maxExpiresAt != null && message.maxExpiresAt!.isBefore(now)) {
          await messageRepo.deleteMessageLocally(message.id);
          continue;
        }

        // Si le message a une date d'expiration définie
        // Pause les timers de tous les messages (entrants + sortants) à l'ouverture du chat
        if (message.expiresAt != null) {
          if (message.expiresAt!.isBefore(now)) {
            // Le message a expiré → le supprimer
            await messageRepo.deleteMessageLocally(message.id);
          } else {
            // Le message n'a pas encore expiré → calculer le temps restant et mettre en pause
            final remainingSeconds = message.expiresAt!.difference(now).inSeconds;
            message.ephemeralRemainingSeconds = remainingSeconds;
            message.expiresAt = null; // Timer en pause
            await messageRepo.saveMessageLocally(message);
          }
        }
      }

      // Cleanup des call messages expirés
      await localStorage.cleanupExpiredCallMessages();
    }

    // Après nettoyage : si la conversation est vide, effacer le preview du contact
    // (sans toucher à lastMessageAt pour que le contact reste visible dans la liste)
    if (contact != null) {
      final remaining = await messageRepo.getMessagesForContact(widget.contactId);
      if (remaining.isEmpty) {
        final freshContact = await localStorage.getContact(widget.contactId);
        if (freshContact != null) {
          freshContact.lastMessagePreview = null;
          freshContact.unreadCount = 0;
          await localStorage.saveContact(freshContact);
          ref.read(contactsProvider.notifier).refresh();
        }
      }
    }
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    // Calculer si on est proche du bas (avec une marge de 150px)
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final isNearBottom = (maxScroll - currentScroll) < 150;

    if (_showScrollToBottom == isNearBottom) {
      setState(() => _showScrollToBottom = !isNearBottom);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (!mounted) return;

    // Quand l'app passe en arrière-plan ou est inactive → gérer les messages éphémères
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      // Ne pas supprimer les messages éphémères si on ouvre un fichier externe
      if (!_isOpeningExternalFile) {
        // Clear current chat contact so notifications work in background
        ref.read(currentChatContactIdProvider.notifier).state = null;
        _handleEphemeralMessagesOnPause();
      }
    }

    // Quand l'app revient au premier plan → rafraîchir les messages sans scroller
    if (state == AppLifecycleState.resumed) {
      _isOpeningExternalFile = false;
      // Re-set current chat contact
      ref.read(currentChatContactIdProvider.notifier).state = widget.contactId;
      _refreshMessages();
    }
  }

  /// Gère les messages éphémères quand l'app passe en arrière-plan
  Future<void> _handleEphemeralMessagesOnPause() async {
    if (!mounted) return;

    try {
      final contacts = ref.read(contactsProvider);
      final messageRepo = ref.read(messageRepositoryProvider);
      final localStorage = ref.read(localStorageProvider);

      Contact? contact;
      for (final c in contacts) {
        if (c.odid == widget.contactId) {
          contact = c;
          break;
        }
      }

      if (contact == null) return;

      final settings = ref.read(appSettingsProvider);
      final ephemeralDuration = contact.ephemeralDuration ?? settings.defaultEphemeralDuration;
      final messages = await messageRepo.getMessagesForContact(widget.contactId);
      final now = DateTime.now();

      for (final message in messages) {
        // Fallback 24h : supprimer si maxExpiresAt dépassé
        if (message.maxExpiresAt != null && message.maxExpiresAt!.isBefore(now)) {
          await messageRepo.deleteMessageLocally(message.id);
          continue;
        }

        // Messages sortants : relancer le timer s'il est pausé
        if (message.isOutgoing) {
          if (message.ephemeralRemainingSeconds != null) {
            message.expiresAt = now.add(Duration(seconds: message.ephemeralRemainingSeconds!));
            message.ephemeralRemainingSeconds = null;
            await messageRepo.saveMessageLocally(message);
          }
          // Si expiresAt est déjà défini (par le receipt), on ne touche pas
          continue;
        }

        // Messages entrants : relancer le timer s'il est pausé, ou démarrer si nouveau
        if (message.ephemeralRemainingSeconds != null) {
          // Timer était en pause → reprendre
          message.expiresAt = now.add(Duration(seconds: message.ephemeralRemainingSeconds!));
          message.ephemeralRemainingSeconds = null;
          await messageRepo.saveMessageLocally(message);
        } else if (message.expiresAt == null) {
          // Pas de timer encore → démarrer (sauf mode "Immédiatement")
          if (ephemeralDuration == 0) {
            await messageRepo.deleteMessageLocally(message.id);
          } else {
            message.expiresAt = now.add(Duration(seconds: ephemeralDuration));
            await messageRepo.saveMessageLocally(message);
          }
        }
        // Si expiresAt est déjà défini → ne pas toucher (ExpirationService gère)
      }

      // Mode "Immédiatement" : supprimer les call messages
      if (ephemeralDuration == 0) {
        await localStorage.deleteAllCallMessagesForContact(widget.contactId);

        // Mettre à jour le preview du contact si tous les messages ont été supprimés
        final remaining = await messageRepo.getMessagesForContact(widget.contactId);
        if (remaining.isEmpty) {
          final freshContact = await localStorage.getContact(widget.contactId);
          if (freshContact != null) {
            freshContact.lastMessagePreview = null;
            freshContact.unreadCount = 0;
            await localStorage.saveContact(freshContact);
            ref.read(contactsProvider.notifier).refresh();
          }
        }
      }
    } catch (e) {
      debugPrint('[ChatScreen] Error in _handleEphemeralMessagesOnPause: $e');
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    // Détecter si le clavier s'ouvre (et non se ferme)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final currentKeyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      final keyboardOpened = currentKeyboardHeight > _previousKeyboardHeight && currentKeyboardHeight > 0;
      _previousKeyboardHeight = currentKeyboardHeight;

      // Ne scroller vers le bas que si le clavier S'OUVRE
      if (_initialScrollDone && keyboardOpened) {
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  Future<void> _loadMessages() async {
    final messageRepo = ref.read(messageRepositoryProvider);
    final localStorage = ref.read(localStorageProvider);
    final messages = await messageRepo.getMessagesForContact(widget.contactId);
    final callMessages = await localStorage.getCallMessagesForContact(widget.contactId);

    // Check if widget is still mounted before updating state
    if (!mounted) return;

    // Fusionner les deux listes dans un timeline unifié
    final items = <ChatItem>[
      ...messages.map(ChatItem.fromMessage),
      ...callMessages.map(ChatItem.fromCall),
    ]..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    setState(() {
      _items = items;
    });
    _computeVoiceGroups();

    // Auto-télécharger les messages audio en attente
    _autoDownloadAudioMessages();

    // Collecter les IDs non lus AVANT markAsRead (Hive mute les mêmes objets en mémoire)
    final unreadIds = _items
        .where((i) => !i.isCallMessage && !i.message!.isOutgoing && !i.message!.isRead)
        .map((i) => i.message!.id)
        .toList();

    // Mark as read
    await messageRepo.markAsRead(widget.contactId);

    // Envoyer les confirmations de lecture (Sealed Sender)
    if (unreadIds.isNotEmpty) _sendReadReceipts(unreadIds);

    // Check mounted again before refreshing contacts
    if (!mounted) return;
    await ref.read(contactsProvider.notifier).refresh();

    // Scroll to bottom puis ouvrir le clavier
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _scrollToBottom();
      _initialScrollDone = true;

      // Ouvrir le clavier après un court délai (sauf retour d'appel)
      if (!widget.fromCall) {
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            _messageInputKey.currentState?.requestFocus();
          }
        });
      }
    });
  }

  /// Refresh messages without scrolling (for periodic updates)
  Future<void> _refreshMessages() async {
    // Guard against disposed state - check flag first
    if (_isDisposed) return;
    if (!mounted) return;

    try {
      final messageRepo = ref.read(messageRepositoryProvider);
      final localStorage = ref.read(localStorageProvider);
      final messages = await messageRepo.getMessagesForContact(widget.contactId);
      final callMessages = await localStorage.getCallMessagesForContact(widget.contactId);

      if (_isDisposed || !mounted) return;

      // Build new unified timeline.
      // Use copyWith() to detach from Hive references: _items may hold direct
      // Hive object refs, so comparing oldMessages[i] vs newMessages[i] would
      // compare the same in-memory object to itself after an external status
      // update (e.g. a read receipt processed by HomeScreen), causing status
      // changes to go undetected.
      final newItems = <ChatItem>[
        ...messages.map((m) => ChatItem.fromMessage(m.copyWith())),
        ...callMessages.map(ChatItem.fromCall),
      ]..sort((a, b) => a.timestamp.compareTo(b.timestamp));

      // Detect changes - compare message counts separately from call messages
      // because a call message can expire while a new message arrives,
      // keeping the total count the same
      final newMsgCount = newItems.where((i) => !i.isCallMessage).length;
      final oldMsgCount = _items.where((i) => !i.isCallMessage).length;
      final hasNewMessages = newMsgCount > oldMsgCount;
      final hasItemCountChange = newItems.length != _items.length;
      final hasNewItems = hasNewMessages || hasItemCountChange;
      bool hasStatusChanges = false;
      if (!hasNewItems) {
        // Check only message status changes (call messages don't have status)
        final oldMessages = _items.where((i) => !i.isCallMessage).toList();
        final newMessages = newItems.where((i) => !i.isCallMessage).toList();
        if (oldMessages.length == newMessages.length) {
          for (int i = 0; i < newMessages.length; i++) {
            if (newMessages[i].message!.status != oldMessages[i].message!.status ||
                newMessages[i].message!.mediaDownloadStatus != oldMessages[i].message!.mediaDownloadStatus ||
                newMessages[i].message!.mediaUrl != oldMessages[i].message!.mediaUrl) {
              hasStatusChanges = true;
              break;
            }
          }
        }
      }

      if (hasNewItems || hasStatusChanges) {
        if (hasNewMessages) {
          // Vibrate only for genuinely new messages
          final settings = ref.read(appSettingsProvider);
          if (settings.vibrationEnabled) {
            HapticFeedback.mediumImpact();
          }
        }

        setState(() {
          _items = newItems;
        });
        _computeVoiceGroups();

        // Auto-télécharger les nouveaux messages audio
        if (hasNewMessages) {
          _autoDownloadAudioMessages();
        }

        if (hasNewMessages) {
          // Collecter les IDs non lus AVANT markAsRead (Hive mute les mêmes objets en mémoire)
          final unreadIds = _items
              .where((i) => !i.isCallMessage && !i.message!.isOutgoing && !i.message!.isRead)
              .map((i) => i.message!.id)
              .toList();

          // Mark as read
          await messageRepo.markAsRead(widget.contactId);
          // Envoyer les confirmations de lecture pour les nouveaux messages
          if (unreadIds.isNotEmpty) _sendReadReceipts(unreadIds);
          if (_isDisposed || !mounted) return;
          await ref.read(contactsProvider.notifier).refresh();

          // Scroll to bottom for new messages
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && _scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });
        }
      }
    } catch (e) {
      // Widget disposed during refresh - ignore
      if (e.toString().contains('disposed') || e.toString().contains('deactivated')) {
        return;
      }
      debugPrint('[ChatScreen] Error refreshing messages: $e');
    }
  }

  @override
  void dispose() {
    // Set flag FIRST to prevent any more ref usage
    _isDisposed = true;

    // Cancel timer
    _refreshTimer?.cancel();
    _refreshTimer = null;

    // Détacher le callback de la queue d'envoi
    // (le service survit au widget, on ne veut pas de callback sur un widget disposé)
    try {
      ref.read(messageSendQueueServiceProvider).onStatusChanged = null;
    } catch (e) {
      debugPrint('[ChatScreen] Detaching send queue callback failed: $e');
    }

    WidgetsBinding.instance.removeObserver(this);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _voicePlaybackController.dispose();

    super.dispose();
  }

  /// Calcule les groupes de vocaux consécutifs pour la vitesse partagée et l'auto-play.
  void _computeVoiceGroups() {
    final voiceGroups = <String, int>{};
    final groupOrder = <int, List<String>>{};
    int currentGroup = -1;
    bool inGroup = false;

    for (final item in _items) {
      if (!item.isCallMessage && item.message!.type == MessageType.voice) {
        if (!inGroup) {
          currentGroup++;
          inGroup = true;
          groupOrder[currentGroup] = [];
        }
        voiceGroups[item.message!.id] = currentGroup;
        groupOrder[currentGroup]!.add(item.message!.id);
      } else {
        inGroup = false;
      }
    }

    _voiceGroups = voiceGroups;
    _voicePlaybackController.setGroupMessageOrder(groupOrder);
  }

  /// Gère la navigation retour - supprime les messages éphémères AVANT de quitter
  Future<void> _reportSpam(Contact contact) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => GlassTheme.wrapAlertDialog(context, AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        title: Text(l10n.reportSpam, style: AppTypography.headlineSmall(
          color: theme.colorScheme.onSurface,
        )),
        content: Text(
          l10n.reportSpamDescription,
          style: AppTypography.bodyMedium(
            color: theme.brightness == Brightness.dark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: Text(l10n.report),
          ),
        ],
      )),
    );

    if (confirmed == true && mounted) {
      try {
        final edgeFunctionService = ref.read(edgeFunctionServiceProvider);
        await edgeFunctionService.call('report-spam', body: {
          'reported_hash_id': contact.hashId,
        });
        if (mounted) {
          showHashSnackBar(context, message: l10n.spamReported, type: HashSnackBarType.success);
        }
      } on EdgeFunctionException catch (e) {
        if (mounted) {
          if (e.statusCode == 429) {
            showHashSnackBar(context, message: l10n.reportRateLimited, type: HashSnackBarType.error);
          } else {
            showHashSnackBar(context, message: l10n.reportError, type: HashSnackBarType.error);
          }
        }
      } catch (_) {
        if (mounted) {
          showHashSnackBar(context, message: l10n.reportError, type: HashSnackBarType.error);
        }
      }
    }
  }

  Future<void> _handleBackNavigation() async {
    if (!mounted) return;

    // Cancel timer to prevent any more ref usage
    _refreshTimer?.cancel();
    _refreshTimer = null;

    // Clear current chat contact (enables notifications again)
    ref.read(currentChatContactIdProvider.notifier).state = null;

    // Handle ephemeral messages
    await _handleEphemeralMessagesOnPause();
  }

  // Convert MessageContentType to MessageType
  MessageType _convertContentType(MessageContentType type) {
    switch (type) {
      case MessageContentType.text:
        return MessageType.text;
      case MessageContentType.image:
        return MessageType.image;
      case MessageContentType.video:
        return MessageType.video;
      case MessageContentType.audio:
        return MessageType.voice;
      case MessageContentType.file:
        return MessageType.file;
      case MessageContentType.contact:
        return MessageType.contact;
      case MessageContentType.location:
        return MessageType.location;
    }
  }

  Future<void> _sendMessage(String content, {MessageContentType type = MessageContentType.text, String? filePath, bool isViewOnce = false, int? viewOnceDuration}) async {
    final messageType = _convertContentType(type);

    final messageRepo = ref.read(messageRepositoryProvider);
    final mailboxService = ref.read(anonymousMailboxServiceProvider);
    final contacts = ref.read(contactsProvider);

    // Get the contact to find their mailbox token
    final contact = contacts.where((c) => c.odid == widget.contactId).firstOrNull;

    if (contact == null) {
      debugPrint('[Chat] Cannot send message: contact not found');
      return;
    }

    // Determine if this is a media message
    final isMediaMessage = messageType != MessageType.text &&
        messageType != MessageType.contact &&
        messageType != MessageType.location &&
        filePath != null &&
        filePath.isNotEmpty;

    // Guard contre double envoi média (upload peut être long)
    if (isMediaMessage && _isSendingMedia) {
      debugPrint('[Chat] Media send already in progress, ignoring');
      return;
    }
    if (isMediaMessage) _isSendingMedia = true;

    // Determine MIME type for media
    String? mimeType;
    if (isMediaMessage) {
      switch (messageType) {
        case MessageType.image:
          mimeType = 'image/jpeg';
          break;
        case MessageType.video:
          mimeType = 'video/mp4';
          break;
        case MessageType.voice:
          mimeType = 'audio/aac';
          break;
        case MessageType.file:
          mimeType = 'application/octet-stream';
          break;
        default:
          break;
      }
    }

    // Pre-read image dimensions for immediate correct display
    int? preWidth;
    int? preHeight;
    if (isMediaMessage && messageType == MessageType.image && filePath != null) {
      try {
        final mediaEncryption = ref.read(mediaEncryptionServiceProvider);
        final bytes = await File(filePath).readAsBytes();
        final dims = await mediaEncryption.getImageDimensions(bytes);
        if (dims != null) {
          preWidth = dims[0];
          preHeight = dims[1];
        }
      } catch (e) {
        debugPrint('[ChatScreen] Getting image dimensions failed: $e');
      }
    }

    // Create local message (with local file path for immediate display)
    var message = messageRepo.createLocalMessage(
      contactId: widget.contactId,
      type: messageType,
      content: content,
      isViewOnce: isViewOnce,
      viewOnceDuration: viewOnceDuration,
    );

    // Add pre-read dimensions to avoid resize flash
    if (preWidth != null && preHeight != null) {
      message = message.copyWith(mediaWidth: preWidth, mediaHeight: preHeight);
    }

    // Save locally
    await messageRepo.saveMessageLocally(message);

    // Update UI
    setState(() {
      _items.add(ChatItem.fromMessage(message));
    });

    // Scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    // Enqueue dans le service de file d'attente
    final sendQueue = ref.read(messageSendQueueServiceProvider);
    await sendQueue.enqueueMessage(
      message,
      contact: contact,
      filePath: isMediaMessage ? filePath : null,
      mimeType: isMediaMessage ? mimeType : null,
    );

    // Play send sound (pop)
    final settings = ref.read(appSettingsProvider);
    if (settings.sendSoundEnabled) {
      ref.read(uiSoundServiceProvider).playSendSound();
    }

    // Update contact's last message info so conversation appears in list
    _updateContactLastMessage(contact, messageType, content);

    // Libérer le guard média
    if (isMediaMessage) _isSendingMedia = false;

    // Refresh contacts list
    ref.read(contactsProvider.notifier).refresh();
  }

  /// Affiche un message d'erreur lisible à l'utilisateur
  void _showErrorSnackBar(String errorMessage) {
    if (!mounted) return;

    // Traduire les erreurs serveur en messages lisibles
    String userMessage;
    if (errorMessage.contains('Quota utilisateur')) {
      userMessage = 'Espace de stockage temporaire plein. Attendez que vos médias soient téléchargés.';
    } else if (errorMessage.contains('Stockage serveur saturé')) {
      userMessage = 'Serveur saturé, réessayez plus tard.';
    } else if (errorMessage.contains('trop volumineux')) {
      userMessage = errorMessage; // Déjà lisible
    } else if (errorMessage.contains('SocketException') || errorMessage.contains('Connection')) {
      userMessage = 'Erreur de connexion. Vérifiez votre réseau.';
    } else if (errorMessage.contains('Contact non compatible')) {
      userMessage = 'Contact non compatible. Supprimez et ré-ajoutez ce contact.';
    } else if (errorMessage.contains('expired')) {
      userMessage = 'Média expiré (24h dépassées).';
    } else if (errorMessage.contains('invalid_send_token')) {
      userMessage = 'Message non délivré. Ce contact ne peut plus recevoir vos messages.';
    } else if (errorMessage.contains('send_token_missing')) {
      userMessage = 'Erreur de synchronisation. Supprimez et ré-ajoutez ce contact.';
    } else {
      userMessage = 'Erreur d\'envoi. Réessayez.';
    }

    showHashSnackBar(context, message: userMessage, type: HashSnackBarType.error, duration: const Duration(seconds: 4));
  }

  /// Met à jour les infos du dernier message sur le contact
  Future<void> _updateContactLastMessage(Contact contact, MessageType messageType, String content) async {
    final localStorage = ref.read(localStorageProvider);
    final updatedContact = await localStorage.getContact(widget.contactId);
    if (updatedContact != null) {
      updatedContact.lastMessageAt = DateTime.now();
      if (messageType == MessageType.text) {
        updatedContact.lastMessagePreview = content.length > 50
            ? '${content.substring(0, 50)}...'
            : content;
      } else {
        switch (messageType) {
          case MessageType.image:
            updatedContact.lastMessagePreview = '\u{1F4F7} Photo';
            break;
          case MessageType.video:
            updatedContact.lastMessagePreview = '\u{1F3AC} Vidéo';
            break;
          case MessageType.voice:
            updatedContact.lastMessagePreview = '\u{1F3A4} Message vocal';
            break;
          case MessageType.file:
            updatedContact.lastMessagePreview = '\u{1F4CE} Fichier';
            break;
          case MessageType.contact:
            updatedContact.lastMessagePreview = '\u{1F464} Contact';
            break;
        case MessageType.location:
            updatedContact.lastMessagePreview = '\u{1F4CD} Position';
            break;
        case MessageType.note:
            try {
              final data = jsonDecode(content) as Map<String, dynamic>;
              final title = data['title'] as String? ?? 'Note';
              updatedContact.lastMessagePreview = '\u{1F4DD} $title';
            } catch (_) {
              updatedContact.lastMessagePreview = '\u{1F4DD} Note';
            }
            break;
        default:
            updatedContact.lastMessagePreview = content.length > 50
                ? '${content.substring(0, 50)}...'
                : content;
        }
      }
      await localStorage.saveContact(updatedContact);
    }
  }

  /// Renvoie un message échoué en le remettant dans la file d'attente
  Future<void> _retryFailedMessage(Message message) async {
    final sendQueue = ref.read(messageSendQueueServiceProvider);
    final messageRepo = ref.read(messageRepositoryProvider);
    final contacts = ref.read(contactsProvider);
    final contact = contacts.where((c) => c.odid == widget.contactId).firstOrNull;
    if (contact == null) return;

    // Reset status
    final resetMsg = message.copyWith(status: MessageStatus.sending);
    await messageRepo.saveMessageLocally(resetMsg);

    setState(() {
      final index = _items.indexWhere((i) => !i.isCallMessage && i.message!.id == message.id);
      if (index != -1) _items[index] = ChatItem.fromMessage(resetMsg);
    });

    // Re-enqueue avec priorité haute
    await sendQueue.enqueueMessage(
      resetMsg,
      contact: contact,
      priority: SendPriority.high,
    );
  }

  /// Envoie les confirmations de lecture pour les messages non lus dans cette conversation
  /// Si les accusés de lecture sont activés → type 'read_receipt' (visible)
  /// Si désactivés → type 'silent_read' (invisible, déclenche le timer éphémère côté expéditeur)
  Future<void> _sendReadReceipts(List<String> unreadIds) async {
    try {
      final settings = ref.read(appSettingsProvider);
      final contacts = ref.read(contactsProvider);
      final contact = contacts.where((c) => c.odid == widget.contactId).firstOrNull;
      if (contact == null) return;
      if (contact.mailboxToken == null || contact.sealedSenderPublicKey == null) return;

      // Déterminer le type de signal selon les préférences
      final contactSetting = contact.sendReadReceipts;
      final shouldSendVisible = contactSetting ?? settings.sendReadReceipts;
      final signalType = shouldSendVisible ? 'read_receipt' : 'silent_read';

      final receiptQueue = ref.read(receiptQueueServiceProvider);
      await receiptQueue.enqueueReceipt(
        contactId: widget.contactId,
        receiptType: signalType,
        messageIds: unreadIds,
        contact: contact,
      );

      debugPrint('[Chat] $signalType enqueued for ${unreadIds.length} messages');
    } catch (e) {
      debugPrint('[Chat] Error enqueuing read receipts: $e');
    }
  }

  /// Télécharge un média distant et met à jour le message
  Future<void> _downloadMedia(Message message) async {
    if (message.mediaFileId == null ||
        message.mediaEncKey == null ||
        message.mediaEncIv == null) {
      return;
    }

    final messageRepo = ref.read(messageRepositoryProvider);
    final mediaStorage = ref.read(mediaStorageServiceProvider);

    // Marquer comme en cours de téléchargement
    final downloadingMsg = message.copyWith(mediaDownloadStatus: 1);
    await messageRepo.saveMessageLocally(downloadingMsg);
    setState(() {
      final index = _items.indexWhere((i) => !i.isCallMessage && i.message!.id == message.id);
      if (index != -1) _items[index] = ChatItem.fromMessage(downloadingMsg);
    });

    try {
      final fileName = message.mediaName ?? '${message.mediaFileId}.dat';
      final localPath = await mediaStorage.downloadMedia(
        fileId: message.mediaFileId!,
        keyBase64: message.mediaEncKey!,
        ivBase64: message.mediaEncIv!,
        fileName: fileName,
      );

      if (localPath != null) {
        // Succès : stocker uniquement le filename (résistant aux changements UUID iOS)
        final doneMsg = message.copyWith(
          mediaUrl: localPath, // downloadMedia() returns filename already
          mediaDownloadStatus: 2,
          mediaEncKey: null,
          mediaEncIv: null,
        );
        await messageRepo.saveMessageLocally(doneMsg);
        setState(() {
          final index = _items.indexWhere((i) => !i.isCallMessage && i.message!.id == message.id);
          if (index != -1) _items[index] = ChatItem.fromMessage(doneMsg);
        });
      } else {
        throw Exception('Download returned null');
      }
    } catch (e) {
      debugPrint('[Chat] Download media error: $e');
      // Vérifier si expiré
      final isExpired = e.toString().contains('expired');
      final failedMsg = message.copyWith(
        mediaDownloadStatus: isExpired ? 4 : 3,
      );
      await messageRepo.saveMessageLocally(failedMsg);
      setState(() {
        final index = _items.indexWhere((i) => !i.isCallMessage && i.message!.id == message.id);
        if (index != -1) _items[index] = ChatItem.fromMessage(failedMsg);
      });
    }
  }

  /// Retry un téléchargement échoué via le service de file
  Future<void> _retryDownload(Message message) async {
    final messageRepo = ref.read(messageRepositoryProvider);
    final downloadQueue = ref.read(mediaDownloadQueueServiceProvider);

    // Reset status à pending
    final resetMsg = message.copyWith(mediaDownloadStatus: 0);
    await messageRepo.saveMessageLocally(resetMsg);
    setState(() {
      final index = _items.indexWhere((i) => !i.isCallMessage && i.message!.id == message.id);
      if (index != -1) _items[index] = ChatItem.fromMessage(resetMsg);
    });

    // Re-queue avec le service
    await downloadQueue.enqueueDownload(resetMsg);
  }

  /// Auto-télécharge les messages audio/vocaux en attente de téléchargement
  void _autoDownloadAudioMessages() {
    final downloadQueue = ref.read(mediaDownloadQueueServiceProvider);
    for (final item in _items) {
      if (item.isCallMessage) continue;
      final msg = item.message!;
      if (msg.type == MessageType.voice &&
          msg.mediaDownloadStatus == 0 &&
          msg.mediaFileId != null) {
        downloadQueue.enqueueDownload(msg);
      }
    }
  }

  /// Parse bubble gradient string into list of colors
  List<Color>? _parseBubbleGradient(String? gradientString) {
    if (gradientString == null) return null;
    final parts = gradientString.split(',');
    if (parts.length != 2) return null;
    try {
      return [
        Color(int.parse(parts[0])),
        Color(int.parse(parts[1])),
      ];
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final contacts = ref.watch(contactsProvider);
    final contact = contacts.where((c) => c.odid == widget.contactId).firstOrNull;

    // If contact not found, go back gracefully
    if (contact == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && context.canPop()) {
          context.pop();
        }
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isConnected = ref.watch(realtimeConnectedProvider);

    // Get custom background
    final hasBackgroundImage = contact.chatBackgroundImagePath != null;
    final hasBackgroundColor = contact.chatBackgroundColor != null;
    final hasBackgroundGradient = contact.chatBackgroundGradient != null;

    // Parse gradient if present
    List<Color>? backgroundGradient;
    if (hasBackgroundGradient) {
      final parts = contact.chatBackgroundGradient!.split(',');
      if (parts.length == 2) {
        backgroundGradient = [
          Color(int.parse(parts[0])),
          Color(int.parse(parts[1])),
        ];
      }
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (_isSelectionMode) {
          _exitSelectionMode();
          return;
        }
        await _handleBackNavigation();
        if (mounted) {
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: hasBackgroundGradient
            ? null
            : (hasBackgroundColor ? Color(contact.chatBackgroundColor!) : theme.scaffoldBackgroundColor),
        extendBodyBehindAppBar: true,
        appBar: _isSelectionMode
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              foregroundColor: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
              leading: IconButton(
                icon: const Icon(Icons.close, color: AppColors.accentPrimary),
                onPressed: _exitSelectionMode,
              ),
              title: Text(
                '${_selectedMessageIds.length} sélectionné${_selectedMessageIds.length > 1 ? 's' : ''}',
                style: AppTypography.bodyLarge(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: AppColors.error),
                  onPressed: _selectedMessageIds.isNotEmpty ? _deleteSelectedMessages : null,
                ),
                const SizedBox(width: 8),
              ],
            )
          : AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.accentPrimary,
          ),
          onPressed: () async {
            await _handleBackNavigation();
            if (mounted) {
              context.pop();
            }
          },
        ),
        title: GestureDetector(
          onTap: () => context.push('/contact/${widget.contactId}'),
          child: Row(
            children: [
              HashAvatar(
                imagePath: contact.avatarPath,
                initials: contact.initials,
                size: 40,
                colorSeed: contact.displayName,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  contact.displayName,
                  style: AppTypography.bodyLarge(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ).copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.phone_outlined,
              color: AppColors.accentPrimary,
            ),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              ref.read(callStateProvider.notifier).initiateCall(
                    contact: contact,
                    callType: CallType.audio,
                  );
              context.pushNamed('call', pathParameters: {'contactId': contact.odid}, extra: CallType.audio);
            },
            tooltip: 'Appel vocal',
          ),
          const SizedBox(width: 4),
          IconButton(
            icon: Icon(
              Icons.videocam_outlined,
              color: AppColors.accentPrimary,
            ),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              ref.read(callStateProvider.notifier).initiateCall(
                    contact: contact,
                    callType: CallType.video,
                  );
              context.pushNamed('call', pathParameters: {'contactId': contact.odid}, extra: CallType.video);
            },
            tooltip: 'Appel vidéo',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          // D'abord fermer le menu dépliant s'il est ouvert
          final inputState = _messageInputKey.currentState;
          if (inputState != null && inputState.isAttachmentPickerOpen) {
            inputState.closeAttachmentPicker();
            return;
          }
          // Sinon fermer le clavier
          FocusScope.of(context).unfocus();
        },
        // Détection du swipe horizontal pour revenir en arrière
        onHorizontalDragEnd: (details) {
          // Si le swipe est vers la droite (velocity positive) et suffisamment rapide
          if (details.primaryVelocity != null && details.primaryVelocity! > 500) {
            _handleBackNavigation().then((_) {
              if (mounted) {
                context.pop();
              }
            });
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: hasBackgroundImage
              ? BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(contact.chatBackgroundImagePath!)),
                    fit: BoxFit.cover,
                  ),
                )
              : (backgroundGradient != null
                  ? BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: backgroundGradient,
                      ),
                    )
                  : null),
          child: Stack(
          children: [
            // Messages list - remplit tout l'espace
            Positioned.fill(
              child: _items.isEmpty
                  ? _buildEmptyChat()
                  : ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: MediaQuery.of(context).padding.top + kToolbarHeight + 8,
                        // Padding bottom pour l'input bar + safe area
                        bottom: 70 + MediaQuery.of(context).padding.bottom,
                      ),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        final showDate = index == 0 ||
                            !_isSameDay(
                              _items[index - 1].timestamp,
                              item.timestamp,
                            );

                        return Column(
                          children: [
                            if (showDate)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: (isDark ? Colors.black : Colors.white)
                                        .withValues(alpha: 0.9),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    _formatDate(item.timestamp),
                                    style: AppTypography.labelSmall(
                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                    ),
                                  ),
                                ),
                              ),
                            if (item.isCallMessage)
                              CallMessageBubble(
                                callMessage: item.callMessage!,
                              )
                            else
                              _isSelectionMode
                                ? GestureDetector(
                                    onTap: () => _toggleSelection(item.message!.id),
                                    behavior: HitTestBehavior.opaque,
                                    child: Row(
                                      children: [
                                        // Checkbox à gauche pour les messages reçus
                                        if (!item.message!.isOutgoing)
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8, right: 4),
                                            child: Icon(
                                              _selectedMessageIds.contains(item.message!.id)
                                                  ? Icons.check_circle
                                                  : Icons.radio_button_unchecked,
                                              color: _selectedMessageIds.contains(item.message!.id)
                                                  ? AppColors.accentPrimary
                                                  : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
                                              size: 22,
                                            ),
                                          ),
                                        Expanded(
                                          child: AbsorbPointer(
                                            child: MessageBubble(
                                              message: item.message!,
                                              customBubbleColor: contact.chatBubbleColor != null
                                                  ? Color(contact.chatBubbleColor!)
                                                  : null,
                                              customBubbleGradient: _parseBubbleGradient(contact.chatBubbleGradient),
                                              voicePlaybackController: _voicePlaybackController,
                                              voiceGroupIndex: _voiceGroups[item.message!.id],
                                            ),
                                          ),
                                        ),
                                        // Checkbox à droite pour les messages envoyés
                                        if (item.message!.isOutgoing)
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4, right: 8),
                                            child: Icon(
                                              _selectedMessageIds.contains(item.message!.id)
                                                  ? Icons.check_circle
                                                  : Icons.radio_button_unchecked,
                                              color: _selectedMessageIds.contains(item.message!.id)
                                                  ? AppColors.accentPrimary
                                                  : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
                                              size: 22,
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                : MessageBubble(
                                message: item.message!,
                                onTap: () => _onMessageTap(item.message!),
                                onLongPress: () => _onMessageLongPress(item.message!),
                                customBubbleColor: contact.chatBubbleColor != null
                                    ? Color(contact.chatBubbleColor!)
                                    : null,
                                customBubbleGradient: _parseBubbleGradient(contact.chatBubbleGradient),
                                voicePlaybackController: _voicePlaybackController,
                                voiceGroupIndex: _voiceGroups[item.message!.id],
                                onAddToNotes: (item.message!.type == MessageType.note && !item.message!.isOutgoing)
                                    ? (title, editorContent) => _addNoteFromMessage(title, editorContent)
                                    : null,
                                onRetry: item.message!.isOutgoing && item.message!.status == MessageStatus.failed
                                    ? () => _retryFailedMessage(item.message!)
                                    : null,
                              ),
                          ],
                        );
                      },
                    ),
            ),

            // Bannière de connexion perdue
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: MediaQuery.of(context).padding.top + kToolbarHeight + (isConnected ? -36 : 0),
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Container(
                  height: 32,
                  color: (isDark ? const Color(0xFF1A1A1A) : const Color(0xFFE8E8E8))
                      .withValues(alpha: 0.95),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: AppColors.accentPrimary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Reconnexion en cours...',
                        style: AppTypography.labelSmall(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Scroll to bottom button
            if (_showScrollToBottom)
              Positioned(
                left: 0,
                right: 0,
                bottom: 70 + MediaQuery.of(context).padding.bottom + 8,
                child: Center(
                  child: GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    // Forcer le scroll tout en bas avec plusieurs tentatives
                    void scrollToEnd() {
                      if (_scrollController.hasClients) {
                        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                      }
                    }
                    scrollToEnd();
                    // Re-vérifier après plusieurs frames pour être sûr
                    Future.delayed(const Duration(milliseconds: 50), scrollToEnd);
                    Future.delayed(const Duration(milliseconds: 150), scrollToEnd);
                  },
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: GlassTheme.blurLight, sigmaY: GlassTheme.blurLight),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: GlassTheme.background(isDark),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: GlassTheme.border(isDark),
                            width: 0.5,
                          ),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.accentPrimary,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                ),
              ),

            // Input area - positionné en bas
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: contact.isBlocked
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.1),
                        border: Border(
                          top: BorderSide(color: AppColors.error.withValues(alpha: 0.3)),
                        ),
                      ),
                      child: SafeArea(
                        top: false,
                        child: Row(
                          children: [
                            Icon(Icons.block, color: AppColors.error, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                l10n.contactIsBlocked,
                                style: AppTypography.bodySmall(color: AppColors.error),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                final updatedContact = contact.copyWith(isBlocked: false);
                                await ref.read(contactsProvider.notifier).updateContact(updatedContact);
                                try {
                                  final edgeFunctionService = ref.read(edgeFunctionServiceProvider);
                                  await edgeFunctionService.call('register-send-token');
                                } catch (e) {
                                  debugPrint('[ChatScreen] Register send token after unblock failed: $e');
                                }
                              },
                              child: Text(l10n.unblock, style: TextStyle(color: AppColors.accentPrimary)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : MessageInput(
                      key: _messageInputKey,
                      onSend: _sendMessage,
                      contactId: widget.contactId,
                      onRecordingStarted: _voicePlaybackController.stopAllPlayback,
                    ),
            ),
          ],
        ),
        ),
      ),
      ),
    );
  }

  Widget _buildEmptyChat() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          left: 32,
          right: 32,
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 32,
          bottom: 70 + MediaQuery.of(context).padding.bottom + 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_outline,
              size: 40,
              color: AppColors.accentPrimary,
            ).animate().fadeIn(),

            const SizedBox(height: 24),

            Text(
              'Chat sécurisé',
              style: AppTypography.headlineSmall(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 100.ms),

            const SizedBox(height: 12),

            Text(
              'Les messages sont chiffrés de bout en bout et supprimés après lecture',
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms),
          ],
        ),
      ),
    );
  }

  /// Ajoute une note reçue dans les notes de l'utilisateur
  Future<void> _addNoteFromMessage(String title, String editorContent) async {
    final note = Note(
      id: const Uuid().v4(),
      title: title,
      editorContent: editorContent,
      content: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await ref.read(notesProvider.notifier).addNote(note);
    if (mounted) {
      showHashSnackBar(context, message: 'Note ajoutée', type: HashSnackBarType.success);
    }
  }

  void _onMessageTap(Message message) {
    // Message supprimé pour tous : rien au tap
    if (message.isDeletedForEveryone) return;

    final dlStatus = message.mediaDownloadStatus;

    // Pending/downloading : téléchargement auto en cours, ignorer le tap
    if (dlStatus != null && (dlStatus == 0 || dlStatus == 1)) {
      return;
    }

    // Failed : retry via le service de file
    if (dlStatus == 3) {
      _retryDownload(message);
      return;
    }

    switch (message.type) {
      case MessageType.text:
        // Texte: rien au tap
        break;

      case MessageType.image:
        if (message.isViewOnce) {
          // Vue unique: seul le destinataire peut ouvrir, et une seule fois
          if (!message.isOutgoing && !message.viewOnceOpened) {
            _openViewOnceMedia(message);
          }
        } else {
          // Image normale: ouvrir en plein écran
          _openMediaFullscreen(message);
        }
        break;

      case MessageType.video:
        if (message.isViewOnce) {
          // Vue unique: seul le destinataire peut ouvrir, et une seule fois
          if (!message.isOutgoing && !message.viewOnceOpened) {
            _openViewOnceMedia(message);
          }
        } else {
          // Vidéo normale: lire
          _openMediaFullscreen(message);
        }
        break;

      case MessageType.voice:
        // Audio: lecture/pause (géré dans le widget)
        break;

      case MessageType.file:
        // Fichier: ouvrir
        _openFile(message);
        break;

      case MessageType.contact:
        // Contact: déjà géré dans _ContactBubbleContent
        break;

      case MessageType.location:
        // Location: géré dans _buildLocationMessage (ouvre Maps)
        break;

      case MessageType.note:
        // Note: rien au tap (le bouton "Ajouter" est dans la bulle)
        break;

      case MessageType.reaction:
      case MessageType.edit:
      case MessageType.delete:
        // Réaction/modification/suppression: rien au tap
        break;
    }
  }

  void _onMessageLongPress(Message message) {
    final l10n = AppLocalizations.of(context)!;

    // Message supprimé pour tous : seule option = supprimer pour moi
    if (message.isDeletedForEveryone) {
      DeleteConfirmationSheet.show(
        context: context,
        messageCount: 1,
        canDeleteForBoth: false,
        onDeleteForMe: () => _deleteMessage(message),
      );
      return;
    }

    // Déterminer les actions disponibles selon le type
    VoidCallback? onCopy;
    VoidCallback? onSave;

    switch (message.type) {
      case MessageType.text:
        // Texte: copier disponible
        onCopy = () {
          ClipboardService().copyWithAutoExpiry(message.content);
          showHashSnackBar(context, message: l10n.copiedToClipboard, type: HashSnackBarType.success);
        };
        break;

      case MessageType.image:
      case MessageType.video:
        // Médias normaux: enregistrer disponible (pas pour vue unique)
        if (!message.isViewOnce) {
          onSave = () => _saveMediaToGallery(message);
        }
        break;

      case MessageType.contact:
        // Contact: copier le numéro
        final parts = message.content.split('\n');
        if (parts.length > 1 && parts[1].isNotEmpty) {
          onCopy = () {
            ClipboardService().copyWithAutoExpiry(parts[1]);
            showHashSnackBar(context, message: 'Numéro copié', type: HashSnackBarType.success);
          };
        }
        break;

      case MessageType.file:
        // Fichier: pas de copier ni enregistrer
        break;

      case MessageType.voice:
        // Audio: pas de copier ni enregistrer
        break;

      case MessageType.location:
        // Location: copier les coordonnées
        final lines = message.content.split('\n');
        final coords = lines.first;
        onCopy = () {
          ClipboardService().copyWithAutoExpiry(coords);
          showHashSnackBar(context, message: 'Coordonnées copiées', type: HashSnackBarType.success);
        };
        break;

      case MessageType.note:
        // Note: pas d'action copier/enregistrer
        break;

      case MessageType.reaction:
      case MessageType.edit:
      case MessageType.delete:
        // Réaction/modification/suppression: pas d'action copier/enregistrer
        break;
    }

    // Ouvrir (uniquement pour fichiers téléchargés)
    VoidCallback? onOpen;
    if (message.type == MessageType.file &&
        (message.mediaDownloadStatus == null || message.mediaDownloadStatus == 2)) {
      onOpen = () => _openFile(message);
    }

    // Renvoyer (uniquement pour messages sortants échoués)
    VoidCallback? onRetry;
    if (message.isOutgoing && message.status == MessageStatus.failed) {
      onRetry = () => _retryFailedMessage(message);
    }

    MessageActionsSheet.show(
      context: context,
      message: message,
      onCopy: onCopy,
      onSave: onSave,
      onOpen: onOpen,
      onRetry: onRetry,
      onSelect: () => _enterSelectionMode(message.id),
      onDelete: () {
        DeleteConfirmationSheet.show(
          context: context,
          messageCount: 1,
          canDeleteForBoth: true,
          onDeleteForMe: () => _deleteMessage(message),
          onDeleteForBoth: () => _deleteMessageForBoth(message),
        );
      },
      onInfo: () => MessageInfoSheet.show(context: context, message: message),
    );
  }

  void _openMediaFullscreen(Message message) {
    final contact = ref.read(contactsProvider).firstWhere(
      (c) => c.odid == widget.contactId,
    );

    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        opaque: true,
        barrierColor: Colors.black,
        pageBuilder: (context, animation, secondaryAnimation) => MediaViewerScreen(
          message: message,
          contact: contact,
          onSave: () => _saveMediaToGallery(message),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  void _openViewOnceMedia(Message message) async {
    final messageRepo = ref.read(messageRepositoryProvider);

    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ViewOnceViewerScreen(
          message: message,
          onViewed: () async {
            // Marquer comme ouvert
            message.viewOnceOpened = true;
            await messageRepo.saveMessageLocally(message);

            if (mounted) {
              setState(() {
                final index = _items.indexWhere((i) => !i.isCallMessage && i.message!.id == message.id);
                if (index != -1) {
                  _items[index] = ChatItem.fromMessage(message);
                }
              });
            }
          },
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
        opaque: false,
      ),
    );
  }

  void _openFile(Message message) async {
    final rawPath = message.mediaUrl ?? message.content;
    final filePath = MediaUtils.resolvePath(rawPath) ??
        (File(rawPath).existsSync() ? rawPath : null);

    if (filePath == null || !File(filePath).existsSync()) {
      showHashSnackBar(context, message: 'Fichier introuvable', type: HashSnackBarType.error);
      return;
    }

    try {
      _isOpeningExternalFile = true;
      final result = await OpenFilex.open(filePath);
      if (result.type != ResultType.done) {
        _isOpeningExternalFile = false;
        throw Exception(result.message);
      }
    } catch (e) {
      _isOpeningExternalFile = false;
      if (mounted) {
        showHashSnackBar(context, message: 'Erreur lors de l\'ouverture: $e', type: HashSnackBarType.error);
      }
    }
  }

  void _saveMediaToGallery(Message message) async {
    // Unfocus to prevent keyboard from appearing when snackbar triggers rebuild
    FocusManager.instance.primaryFocus?.unfocus();

    final rawPath = message.mediaUrl ?? message.content;
    final mediaPath = MediaUtils.resolvePath(rawPath) ??
        (File(rawPath).existsSync() ? rawPath : null);

    if (mediaPath == null || !File(mediaPath).existsSync()) {
      showHashSnackBar(context, message: 'Fichier introuvable', type: HashSnackBarType.error);
      return;
    }

    try {
      final result = await ImageGallerySaverPlus.saveFile(mediaPath);

      if (result['isSuccess'] == true && mounted) {
        HapticFeedback.mediumImpact();
        showHashSnackBar(context, message: message.type == MessageType.video ? 'Vidéo enregistrée' : 'Image enregistrée', type: HashSnackBarType.success);
      } else {
        throw Exception('Échec de l\'enregistrement');
      }
    } catch (e) {
      if (mounted) {
        showHashSnackBar(context, message: 'Erreur: $e', type: HashSnackBarType.error);
      }
    }
  }

  Future<void> _deleteMessage(Message message) async {
    final l10n = AppLocalizations.of(context)!;
    final messageRepo = ref.read(messageRepositoryProvider);

    // Cancel from send queue if still pending/sending/failed
    if (message.isOutgoing &&
        (message.status == MessageStatus.queued ||
         message.status == MessageStatus.sending ||
         message.status == MessageStatus.failed)) {
      final sendQueue = ref.read(messageSendQueueServiceProvider);
      await sendQueue.cancelMessage(message.id);
    }

    // Delete locally
    await messageRepo.deleteMessageLocally(message.id);

    setState(() {
      _items.removeWhere((i) => !i.isCallMessage && i.message!.id == message.id);
    });

    showHashSnackBar(context, message: l10n.delete, type: HashSnackBarType.success);
  }

  Future<void> _deleteMessageForBoth(Message message) async {
    final l10n = AppLocalizations.of(context)!;
    final messageRepo = ref.read(messageRepositoryProvider);

    // Cancel from send queue if still pending/sending/failed
    if (message.isOutgoing &&
        (message.status == MessageStatus.queued ||
         message.status == MessageStatus.sending ||
         message.status == MessageStatus.failed)) {
      final sendQueue = ref.read(messageSendQueueServiceProvider);
      await sendQueue.cancelMessage(message.id);
    }

    // Marquer comme supprimé pour tous (placeholder) au lieu de supprimer physiquement
    final updated = await messageRepo.markAsDeletedForEveryone(message.id, name: null);

    if (updated != null) {
      setState(() {
        final idx = _items.indexWhere((i) => !i.isCallMessage && i.message!.id == message.id);
        if (idx != -1) {
          _items[idx] = ChatItem.fromMessage(updated);
        }
      });
    }

    showHashSnackBar(context, message: l10n.delete, type: HashSnackBarType.success);

    try {
      final contact = ref.read(contactsProvider).firstWhere(
        (c) => c.odid == widget.contactId,
      );

      // Si le message est envoyé mais pas encore délivré, tenter la révocation serveur
      if (message.isOutgoing &&
          message.status == MessageStatus.sent &&
          contact.sendToken != null &&
          contact.mailboxToken != null) {
        final mailboxService = ref.read(anonymousMailboxServiceProvider);
        final result = await mailboxService.revokeMessage(
          messageId: message.id,
          mediaFileId: message.mediaFileId,
          recipientMailboxToken: contact.mailboxToken!,
          sendToken: contact.sendToken!,
        );

        if (result.success) {
          debugPrint('[ChatScreen] Message revoked from server (media: ${result.mediaRevoked})');
          return; // Pas besoin d'envoyer le receipt delete
        }

        debugPrint('[ChatScreen] Server revocation failed (${result.error}), falling back to receipt');
      }

      // Fallback : envoyer un receipt delete au destinataire
      final receiptQueue = ref.read(receiptQueueServiceProvider);
      await receiptQueue.enqueueReceipt(
        contactId: contact.odid,
        receiptType: 'delete_message',
        messageIds: [message.id],
        contact: contact,
      );
    } catch (e) {
      debugPrint('[ChatScreen] Error sending delete_message: $e');
    }
  }

  void _enterSelectionMode(String initialMessageId) {
    setState(() {
      _isSelectionMode = true;
      _selectedMessageIds.clear();
      _selectedMessageIds.add(initialMessageId);
    });
  }

  void _toggleSelection(String messageId) {
    setState(() {
      if (_selectedMessageIds.contains(messageId)) {
        _selectedMessageIds.remove(messageId);
        if (_selectedMessageIds.isEmpty) {
          _isSelectionMode = false;
        }
      } else {
        _selectedMessageIds.add(messageId);
      }
    });
  }

  void _exitSelectionMode() {
    setState(() {
      _isSelectionMode = false;
      _selectedMessageIds.clear();
    });
  }

  void _deleteSelectedMessages() {
    DeleteConfirmationSheet.show(
      context: context,
      messageCount: _selectedMessageIds.length,
      canDeleteForBoth: false,
      onDeleteForMe: () async {
        final messageRepo = ref.read(messageRepositoryProvider);
        final sendQueue = ref.read(messageSendQueueServiceProvider);

        for (final msgId in _selectedMessageIds.toList()) {
          // Chercher le message dans les items
          final item = _items.where((i) => !i.isCallMessage && i.message!.id == msgId).firstOrNull;
          if (item != null) {
            final message = item.message!;
            // Cancel from send queue if still pending/sending/failed
            if (message.isOutgoing &&
                (message.status == MessageStatus.queued ||
                 message.status == MessageStatus.sending ||
                 message.status == MessageStatus.failed)) {
              await sendQueue.cancelMessage(message.id);
            }
          }
          await messageRepo.deleteMessageLocally(msgId);
        }

        setState(() {
          _items.removeWhere((i) => !i.isCallMessage && _selectedMessageIds.contains(i.message!.id));
          _isSelectionMode = false;
          _selectedMessageIds.clear();
        });

        if (mounted) {
          final l10n = AppLocalizations.of(context)!;
          showHashSnackBar(context, message: l10n.delete, type: HashSnackBarType.success);
        }
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    final localA = a.toLocal();
    final localB = b.toLocal();
    return localA.year == localB.year && localA.month == localB.month && localA.day == localB.day;
  }

  String _formatDate(DateTime date) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final localDate = date.toLocal();
    final now = DateTime.now();
    if (_isSameDay(localDate, now)) {
      return l10n.today;
    } else if (_isSameDay(localDate, now.subtract(const Duration(days: 1)))) {
      return l10n.yesterday;
    } else {
      return DateFormat.yMd(locale).format(localDate);
    }
  }

  String _formatDateTime(DateTime date) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final localDate = date.toLocal();
    final dateStr = DateFormat.Md(locale).format(localDate);
    final timeStr = DateFormat.Hm(locale).format(localDate);
    return l10n.dateAtTime(dateStr, timeStr);
  }
}

class _MessageStatusRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MessageStatusRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: secondaryColor, size: 20),
          const SizedBox(width: 12),
          Text(label, style: AppTypography.bodyMedium(color: secondaryColor)),
          const Spacer(),
          Text(value, style: AppTypography.bodyMedium()),
        ],
      ),
    );
  }
}

