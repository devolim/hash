import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/router/app_router.dart';
import '../../../core/utils/avatar_utils.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact.dart';
import '../../providers/app_providers.dart';
import '../../providers/call_providers.dart';
import '../../../domain/models/call_state.dart';
import '../../widgets/common/avatar.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../../core/services/edge_function_service.dart';
import '../../widgets/common/hash_text_field.dart';
import '../../widgets/common/duration_picker.dart';
import '../../../core/services/notification_preferences_sync.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'security_number_screen.dart';

class ContactDetailScreen extends ConsumerStatefulWidget {
  final String contactId;

  const ContactDetailScreen({super.key, required this.contactId});

  @override
  ConsumerState<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends ConsumerState<ContactDetailScreen> {
  late TextEditingController _nameController;
  late TextEditingController _notesController;
  bool _isEditing = false;
  bool _notesHasChanges = false;
  String _originalNotes = '';
  final FocusNode _notesFocusNode = FocusNode();

  static const int _maxNotesLength = 2000;

  @override
  void initState() {
    super.initState();
    final contact = ref.read(contactsProvider).firstWhere((c) => c.odid == widget.contactId);
    _nameController = TextEditingController(text: contact.displayName);
    _notesController = TextEditingController(text: contact.notes ?? '');
    _originalNotes = contact.notes ?? '';

    _notesController.addListener(_onNotesChanged);
  }

  void _onNotesChanged() {
    final hasChanges = _notesController.text != _originalNotes;
    if (hasChanges != _notesHasChanges) {
      setState(() => _notesHasChanges = hasChanges);
    }
  }

  @override
  void dispose() {
    _notesController.removeListener(_onNotesChanged);
    _nameController.dispose();
    _notesController.dispose();
    _notesFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    final contacts = ref.read(contactsProvider);
    final contact = contacts.firstWhere((c) => c.odid == widget.contactId);

    final updatedContact = contact.copyWith(
      displayName: _nameController.text.trim(),
      notes: _notesController.text.trim(),
    );

    await ref.read(contactsProvider.notifier).updateContact(updatedContact);
    _originalNotes = _notesController.text.trim();
    setState(() {
      _isEditing = false;
      _notesHasChanges = false;
    });
  }

  Future<void> _saveNotes() async {
    final contacts = ref.read(contactsProvider);
    final contact = contacts.firstWhere((c) => c.odid == widget.contactId);

    final updatedContact = contact.copyWith(
      notes: _notesController.text.trim(),
    );

    await ref.read(contactsProvider.notifier).updateContact(updatedContact);
    _originalNotes = _notesController.text.trim();
    _notesFocusNode.unfocus();
    setState(() => _notesHasChanges = false);

    if (mounted) {
      showHashSnackBar(context, message: 'Note enregistrée', type: HashSnackBarType.success);
    }
  }

  Future<bool> _handleBackPress() async {
    // Si pas de changements, on peut quitter directement
    if (!_notesHasChanges) {
      return true;
    }

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Afficher le dialogue de confirmation
    final result = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => GlassTheme.wrapAlertDialog(context, AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        title: Text(
          'Modifications non enregistrées',
          style: AppTypography.headlineSmall(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Voulez-vous enregistrer vos modifications ?',
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, 'discard'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Abandonner',
                      style: AppTypography.labelLarge(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, 'save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Enregistrer',
                      style: AppTypography.labelLarge(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actionsPadding: EdgeInsets.zero,
        actions: const [],
      )),
    );

    if (result == 'save') {
      await _saveNotes();
      return true;
    } else if (result == 'discard') {
      return true;
    }
    // null (tap outside) - rester sur la page
    return false;
  }

  Future<void> _updateContact(Contact contact) async {
    await ref.read(contactsProvider.notifier).updateContact(contact);
    // Re-sync per-contact notification settings to SharedPreferences + iOS UserDefaults
    _syncContactNotificationSettings();
  }

  /// Sync per-contact notification settings after any contact update
  void _syncContactNotificationSettings() {
    final contacts = ref.read(contactsProvider);
    if (contacts.isEmpty) return;

    final settingsMap = <String, Map<String, dynamic>>{};
    for (final c in contacts) {
      settingsMap[c.hashId] = {
        'notificationsEnabled': c.notificationsEnabled,
        'callNotificationsEnabled': c.callNotificationsEnabled,
        'mutedUntil': c.mutedUntil?.toIso8601String(),
      };
    }

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('contact_notif_settings', jsonEncode(settingsMap));
    });
    NotificationPreferencesSync.syncContactNotificationSettings(settingsMap);
  }

  // ============ AVATAR PHOTO ============
  Future<void> _showAvatarOptions(Contact contact) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hasPhoto = AvatarUtils.resolvePath(contact.avatarPath) != null;

    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                Text(
                  l10n.profilePhoto,
                  style: AppTypography.headlineSmall(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 24),

                // Options
                _PhotoOption(
                  icon: Icons.camera_alt_outlined,
                  label: l10n.takePhoto,
                  color: GlassTheme.glassIconColor(isDark),
                  isDark: isDark,
                  onTap: () => Navigator.pop(context, 'camera'),
                ),
                const SizedBox(height: 12),
                _PhotoOption(
                  icon: Icons.photo_library_outlined,
                  label: l10n.chooseFromGallery,
                  color: GlassTheme.glassIconColor(isDark),
                  isDark: isDark,
                  onTap: () => Navigator.pop(context, 'gallery'),
                ),
                if (hasPhoto) ...[
                  const SizedBox(height: 12),
                  _PhotoOption(
                    icon: Icons.delete_outline,
                    label: l10n.removePhoto,
                    color: AppColors.error,
                    isDark: isDark,
                    onTap: () => Navigator.pop(context, 'remove'),
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );

    if (result == null || !mounted) return;

    if (result == 'remove') {
      // Delete the old file if exists
      final oldResolved = AvatarUtils.resolvePath(contact.avatarPath);
      if (oldResolved != null) {
        final oldFile = File(oldResolved);
        if (await oldFile.exists()) {
          await oldFile.delete();
        }
      }
      // Update contact with null avatar
      await _updateContact(Contact(
        odid: contact.odid,
        hashId: contact.hashId,
        displayName: contact.displayName,
        avatarPath: null,
        notes: contact.notes,
        addedAt: contact.addedAt,
        lastMessageAt: contact.lastMessageAt,
        lastMessagePreview: contact.lastMessagePreview,
        unreadCount: contact.unreadCount,
        notificationsEnabled: contact.notificationsEnabled,
        callNotificationsEnabled: contact.callNotificationsEnabled,
        identityPublicKey: contact.identityPublicKey,
        sessionData: contact.sessionData,
        mailboxToken: contact.mailboxToken,
        relayToken: contact.relayToken,
        verificationToken: contact.verificationToken,
        sealedSenderPublicKey: contact.sealedSenderPublicKey,
        mutedUntil: contact.mutedUntil,
        notificationSound: contact.notificationSound,
        chatBubbleColor: contact.chatBubbleColor,
        chatBubbleGradient: contact.chatBubbleGradient,
        chatBackgroundColor: contact.chatBackgroundColor,
        chatBackgroundGradient: contact.chatBackgroundGradient,
        chatBackgroundImagePath: contact.chatBackgroundImagePath,
        ephemeralDuration: contact.ephemeralDuration,
        sendReadReceipts: contact.sendReadReceipts,
        sendToken: contact.sendToken,
        isPinned: contact.isPinned,
        isHidden: contact.isHidden,
      ));
      return;
    }

    // Pick image from camera or gallery
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: result == 'camera' ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 90,
    );

    if (image == null || !mounted) return;

    // Crop image
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 85,
      maxWidth: 512,
      maxHeight: 512,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: l10n.profilePhoto,
          toolbarColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
          toolbarWidgetColor: AppColors.accentPrimary,
          statusBarLight: isDark,
          backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
          activeControlsWidgetColor: AppColors.accentPrimary,
          cropFrameColor: AppColors.accentPrimary,
          cropGridColor: AppColors.accentPrimary.withValues(alpha: 0.3),
          dimmedLayerColor: Colors.black.withValues(alpha: 0.8),
          lockAspectRatio: true,
          hideBottomControls: true,
          showCropGrid: true,
        ),
        IOSUiSettings(
          title: l10n.profilePhoto,
          cancelButtonTitle: l10n.cancel,
          doneButtonTitle: l10n.confirm,
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
          aspectRatioPickerButtonHidden: true,
          rotateButtonsHidden: true,
          resetButtonHidden: true,
        ),
      ],
    );

    if (croppedFile == null || !mounted) return;

    // Save to local directory
    final directory = await getApplicationDocumentsDirectory();
    final avatarDir = Directory('${directory.path}/avatars');
    if (!await avatarDir.exists()) {
      await avatarDir.create(recursive: true);
    }

    // Delete old avatar if exists
    final oldResolved = AvatarUtils.resolvePath(contact.avatarPath);
    if (oldResolved != null) {
      final oldFile = File(oldResolved);
      if (await oldFile.exists()) {
        await oldFile.delete();
      }
    }

    // Save new avatar
    final fileName = 'contact_${contact.odid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final newPath = '${avatarDir.path}/$fileName';
    await File(croppedFile.path).copy(newPath);

    // Update contact (store only filename for path stability across iOS container changes)
    await _updateContact(Contact(
      odid: contact.odid,
      hashId: contact.hashId,
      displayName: contact.displayName,
      avatarPath: AvatarUtils.toRelative(newPath),
      notes: contact.notes,
      addedAt: contact.addedAt,
      lastMessageAt: contact.lastMessageAt,
      lastMessagePreview: contact.lastMessagePreview,
      unreadCount: contact.unreadCount,
      notificationsEnabled: contact.notificationsEnabled,
      callNotificationsEnabled: contact.callNotificationsEnabled,
      identityPublicKey: contact.identityPublicKey,
      sessionData: contact.sessionData,
      mailboxToken: contact.mailboxToken,
      relayToken: contact.relayToken,
      verificationToken: contact.verificationToken,
      sealedSenderPublicKey: contact.sealedSenderPublicKey,
      mutedUntil: contact.mutedUntil,
      notificationSound: contact.notificationSound,
      chatBubbleColor: contact.chatBubbleColor,
      chatBubbleGradient: contact.chatBubbleGradient,
      chatBackgroundColor: contact.chatBackgroundColor,
      chatBackgroundGradient: contact.chatBackgroundGradient,
      chatBackgroundImagePath: contact.chatBackgroundImagePath,
      ephemeralDuration: contact.ephemeralDuration,
      sendReadReceipts: contact.sendReadReceipts,
      sendToken: contact.sendToken,
      isPinned: contact.isPinned,
      isHidden: contact.isHidden,
    ));
  }

  // ============ MUTE ============
  Future<void> _showMuteOptions(Contact contact) async {
    final duration = await MuteDurationPicker.show(
      context: context,
      currentMuteDuration: contact.remainingMuteDuration,
    );

    if (duration == null) {
      // Indefinite mute (null = toujours)
      await _updateContact(contact.copyWith(
        mutedUntil: DateTime.now().add(const Duration(days: 36500)),
      ));
    } else if (duration.inSeconds > 0) {
      await _updateContact(contact.copyWith(
        mutedUntil: DateTime.now().add(duration),
      ));
    }
  }

  Future<void> _unmute(Contact contact) async {
    final updated = Contact(
      odid: contact.odid,
      hashId: contact.hashId,
      displayName: contact.displayName,
      avatarPath: contact.avatarPath,
      notes: contact.notes,
      addedAt: contact.addedAt,
      lastMessageAt: contact.lastMessageAt,
      lastMessagePreview: contact.lastMessagePreview,
      unreadCount: contact.unreadCount,
      notificationsEnabled: contact.notificationsEnabled,
      callNotificationsEnabled: contact.callNotificationsEnabled,
      identityPublicKey: contact.identityPublicKey,
      sessionData: contact.sessionData,
      mailboxToken: contact.mailboxToken,
      relayToken: contact.relayToken,
      verificationToken: contact.verificationToken,
      sealedSenderPublicKey: contact.sealedSenderPublicKey,
      mutedUntil: null,
      notificationSound: contact.notificationSound,
      chatBubbleColor: contact.chatBubbleColor,
      chatBubbleGradient: contact.chatBubbleGradient,
      chatBackgroundColor: contact.chatBackgroundColor,
      chatBackgroundGradient: contact.chatBackgroundGradient,
      chatBackgroundImagePath: contact.chatBackgroundImagePath,
      ephemeralDuration: contact.ephemeralDuration,
      sendReadReceipts: contact.sendReadReceipts,
      sendToken: contact.sendToken,
      isPinned: contact.isPinned,
      isHidden: contact.isHidden,
    );
    await ref.read(contactsProvider.notifier).updateContact(updated);
  }

  // ============ EPHEMERAL ============
  Future<void> _showEphemeralOptions(Contact contact) async {
    final settings = ref.read(appSettingsProvider);
    final globalLabel = _getEphemeralDurationLabel(settings.defaultEphemeralDuration, AppLocalizations.of(context)!);

    final duration = await EphemeralDurationPicker.show(
      context: context,
      currentDurationSeconds: contact.ephemeralDuration,
      showGlobalOption: true,
      globalDurationLabel: globalLabel,
    );

    if (duration != contact.ephemeralDuration) {
      await _updateContact(contact.copyWith(ephemeralDuration: duration));
      if (!mounted) return;
      await _applyNewEphemeralDuration(contact.odid, duration);
    }
  }

  /// Met à jour l'expiration de tous les messages existants quand la durée éphémère change
  Future<void> _applyNewEphemeralDuration(String contactId, int? newContactDuration) async {
    final settings = ref.read(appSettingsProvider);
    final effectiveDuration = newContactDuration ?? settings.defaultEphemeralDuration;
    final messageRepo = ref.read(messageRepositoryProvider);
    final messages = await messageRepo.getMessagesForContact(contactId);
    final now = DateTime.now();

    for (final message in messages) {
      // Ne pas toucher aux messages sans timer démarré (sending sans receipt, etc.)
      if (message.expiresAt == null && message.ephemeralRemainingSeconds == null) continue;

      if (effectiveDuration == 0) {
        await messageRepo.deleteMessageLocally(message.id);
      } else {
        if (message.ephemeralRemainingSeconds != null) {
          message.ephemeralRemainingSeconds = effectiveDuration;
        } else if (message.expiresAt != null) {
          message.expiresAt = now.add(Duration(seconds: effectiveDuration));
        }
        await messageRepo.saveMessageLocally(message);
      }
    }

    ref.read(expirationServiceProvider).reschedule();
  }

  // ============ DELETE ALL MESSAGES ============
  Future<void> _showDeleteAllMessagesDialog(Contact contact) async {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => GlassTheme.wrapAlertDialog(context, AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        title: Text(
          'Supprimer tous les messages',
          style: AppTypography.headlineSmall(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Êtes-vous sûr de vouloir supprimer tous les messages de ce chat ?',
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.accentPrimary.withValues(alpha: 0.1)
                    : AppColors.textSecondaryLight.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark
                      ? AppColors.accentPrimary.withValues(alpha: 0.3)
                      : AppColors.textSecondaryLight.withValues(alpha: 0.15),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: isDark ? AppColors.accentPrimary : AppColors.textSecondaryLight,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Cette action supprime uniquement les messages stockés sur cet appareil.',
                      style: AppTypography.bodySmall(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Annuler',
              style: AppTypography.labelLarge(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Supprimer',
              style: AppTypography.labelLarge(color: AppColors.error),
            ),
          ),
        ],
      )),
    );

    if (confirmed == true && mounted) {
      // Demander le code PIN
      final pinVerified = await _showPinConfirmation();

      if (pinVerified && mounted) {
        HapticFeedback.mediumImpact();

        // Supprimer tous les messages et médias
        final messageRepo = ref.read(messageRepositoryProvider);
        await messageRepo.deleteAllMessagesForContact(contact.odid);

        // Mettre à jour le contact (garder lastMessageAt pour que la conversation reste visible)
        final localStorage = ref.read(localStorageProvider);
        final updatedContact = await localStorage.getContact(contact.odid);
        if (updatedContact != null) {
          updatedContact.lastMessagePreview = null;
          updatedContact.unreadCount = 0;
          await localStorage.saveContact(updatedContact);
        }

        // Rafraîchir la liste des contacts
        await ref.read(contactsProvider.notifier).refresh();

        if (mounted) {
          // Retourner à l'accueil puis ouvrir la conversation (qui sera vide)
          context.go(AppRoutes.home);
          // Petit délai pour laisser la navigation se faire
          Future.delayed(const Duration(milliseconds: 100), () {
            if (mounted) {
              context.push('/chat/${contact.odid}');
            }
          });
        }
      }
    }
  }

  // ============ BUBBLE COLOR PREVIEW ============
  Future<void> _showBubbleColorPreview(Contact contact) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Track selection by index: -1 = default, 0-N = solid colors, N+ = gradients
    int selectedIndex = -1;
    if (contact.chatBubbleColor != null) {
      final colorValue = contact.chatBubbleColor!;
      // Find matching solid color
      for (int i = 0; i < _bubbleSolidColors.length; i++) {
        if (_bubbleSolidColors[i].value == colorValue) {
          selectedIndex = i;
          break;
        }
      }
      // If not found in solids, check gradients
      if (selectedIndex == -1) {
        for (int i = 0; i < _bubbleGradients.length; i++) {
          if (_bubbleGradients[i][0].value == colorValue) {
            selectedIndex = _bubbleSolidColors.length + i;
            break;
          }
        }
      }
    }

    final result = await showModalBottomSheet<Map<String, dynamic>?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: StatefulBuilder(
          builder: (context, setModalState) {
            // Get current color/gradient for preview
            Color bubbleColor;
            List<Color>? bubbleGradient;
            if (selectedIndex == -1) {
              bubbleColor = AppColors.accentPrimary;
            } else if (selectedIndex < _bubbleSolidColors.length) {
              bubbleColor = _bubbleSolidColors[selectedIndex];
            } else {
              bubbleGradient = _bubbleGradients[selectedIndex - _bubbleSolidColors.length];
              bubbleColor = bubbleGradient[0];
            }
            final textColor = _getContrastingTextColor(bubbleColor);

            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.bubbleColor,
                  style: AppTypography.headlineSmall(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 20),

                // Preview
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.04),
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.black.withValues(alpha: 0.5)
                            : Colors.black.withValues(alpha: 0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Received message
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(l10n.previewMessageReceived,
                            style: AppTypography.bodyMedium(
                              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Sent message with selected color/gradient
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: bubbleGradient == null ? bubbleColor : null,
                            gradient: bubbleGradient != null
                                ? LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: bubbleGradient,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(l10n.previewMessageSent,
                            style: AppTypography.bodyMedium(color: textColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Color grid - solid colors + gradients
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1,
                      ),
                      itemCount: 1 + _bubbleSolidColors.length + _bubbleGradients.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // Default color option
                          return _ColorTile(
                            isSelected: selectedIndex == -1,
                            label: l10n.defaultColor,
                            onTap: () => setModalState(() => selectedIndex = -1),
                            isDark: isDark,
                          );
                        }
                        // Solid colors (index 1 to _bubbleSolidColors.length)
                        if (index <= _bubbleSolidColors.length) {
                          final colorIdx = index - 1;
                          final color = _bubbleSolidColors[colorIdx];
                          return _ColorTile(
                            color: color,
                            isSelected: selectedIndex == colorIdx,
                            onTap: () => setModalState(() => selectedIndex = colorIdx),
                            isDark: isDark,
                          );
                        }
                        // Gradients
                        final gradientIdx = index - 1 - _bubbleSolidColors.length;
                        final gradient = _bubbleGradients[gradientIdx];
                        return _ColorTile(
                          gradient: gradient,
                          isSelected: selectedIndex == _bubbleSolidColors.length + gradientIdx,
                          onTap: () => setModalState(() => selectedIndex = _bubbleSolidColors.length + gradientIdx),
                          isDark: isDark,
                        );
                      },
                    ),
                  ),
                ),

                // Buttons
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(
                              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                            ),
                          ),
                          child: Text(l10n.cancel),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectedIndex == -1) {
                              Navigator.pop(context, {'color': null, 'gradient': null});
                            } else if (selectedIndex < _bubbleSolidColors.length) {
                              Navigator.pop(context, {
                                'color': _bubbleSolidColors[selectedIndex].value,
                                'gradient': null,
                              });
                            } else {
                              final grad = _bubbleGradients[selectedIndex - _bubbleSolidColors.length];
                              Navigator.pop(context, {
                                'color': grad[0].value,
                                'gradient': '${grad[0].value},${grad[1].value}',
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(l10n.confirm, style: const TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        ),
      ),
    );

    if (result != null) {
      await _updateContact(contact.copyWith(
        chatBubbleColor: result['color'] as int?,
        chatBubbleGradient: result['gradient'] as String?,
      ));
    }
  }

  // ============ BACKGROUND PREVIEW ============
  Future<void> _showBackgroundOptions(Contact contact) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Track selection by index: -1 = default, 0-N = solid colors, N+ = gradients
    int selectedIndex = -1;
    if (contact.chatBackgroundColor != null) {
      final colorValue = contact.chatBackgroundColor!;
      // Find matching solid color
      for (int i = 0; i < _backgroundSolidColors.length; i++) {
        if (_backgroundSolidColors[i].value == colorValue) {
          selectedIndex = i;
          break;
        }
      }
      // If not found in solids, check gradients
      if (selectedIndex == -1) {
        for (int i = 0; i < _backgroundGradients.length; i++) {
          if (_backgroundGradients[i][0].value == colorValue) {
            selectedIndex = _backgroundSolidColors.length + i;
            break;
          }
        }
      }
    }

    String? selectedImagePath = contact.chatBackgroundImagePath;
    bool useImage = selectedImagePath != null;

    final bubbleColor = contact.chatBubbleColor != null
        ? Color(contact.chatBubbleColor!)
        : AppColors.accentPrimary;
    final bubbleTextColor = _getContrastingTextColor(bubbleColor);

    final result = await showModalBottomSheet<Map<String, dynamic>?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: StatefulBuilder(
          builder: (context, setModalState) {
            // Get current color/gradient for preview
            Color? bgColor;
            List<Color>? bgGradient;
            if (!useImage) {
              if (selectedIndex == -1) {
                bgColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
              } else if (selectedIndex < _backgroundSolidColors.length) {
                bgColor = _backgroundSolidColors[selectedIndex];
              } else {
                bgGradient = _backgroundGradients[selectedIndex - _backgroundSolidColors.length];
              }
            }

            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.chatBackground,
                  style: AppTypography.headlineSmall(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 20),

                // Preview
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 180,
                  decoration: BoxDecoration(
                    color: useImage ? null : (bgGradient == null ? bgColor : null),
                    gradient: !useImage && bgGradient != null
                        ? LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: bgGradient,
                          )
                        : null,
                    image: useImage && selectedImagePath != null
                        ? DecorationImage(
                            image: FileImage(File(selectedImagePath!)),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.04),
                      width: 0.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: isDark ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(l10n.previewMessageReceived,
                              style: AppTypography.bodyMedium(
                                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: bubbleColor,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(l10n.previewMessageSent,
                              style: AppTypography.bodyMedium(color: bubbleTextColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Toggle: Color or Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: _ToggleButton(
                          label: l10n.color,
                          isSelected: !useImage,
                          onTap: () => setModalState(() {
                            useImage = false;
                            selectedImagePath = null;
                          }),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ToggleButton(
                          label: l10n.image,
                          isSelected: useImage,
                          onTap: () async {
                            final picker = ImagePicker();
                            final image = await picker.pickImage(
                              source: ImageSource.gallery,
                              maxWidth: 1920,
                              maxHeight: 1920,
                              imageQuality: 80,
                            );
                            if (image != null) {
                              setModalState(() {
                                useImage = true;
                                selectedImagePath = image.path;
                                selectedIndex = -1;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Color grid or image selection
                if (!useImage)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                        itemCount: 1 + _backgroundSolidColors.length + _backgroundGradients.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return _ColorTile(
                              isSelected: selectedIndex == -1,
                              label: l10n.defaultColor,
                              onTap: () => setModalState(() => selectedIndex = -1),
                              isDark: isDark,
                            );
                          }
                          // Solid colors
                          if (index <= _backgroundSolidColors.length) {
                            final colorIdx = index - 1;
                            final color = _backgroundSolidColors[colorIdx];
                            return _ColorTile(
                              color: color,
                              isSelected: selectedIndex == colorIdx,
                              onTap: () => setModalState(() => selectedIndex = colorIdx),
                              isDark: isDark,
                            );
                          }
                          // Gradients
                          final gradientIdx = index - 1 - _backgroundSolidColors.length;
                          final gradient = _backgroundGradients[gradientIdx];
                          return _ColorTile(
                            gradient: gradient,
                            isSelected: selectedIndex == _backgroundSolidColors.length + gradientIdx,
                            onTap: () => setModalState(() => selectedIndex = _backgroundSolidColors.length + gradientIdx),
                            isDark: isDark,
                          );
                        },
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Center(
                      child: selectedImagePath != null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Thumbnail preview
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: AppColors.success,
                                      width: 3,
                                    ),
                                    image: DecorationImage(
                                      image: FileImage(File(selectedImagePath!)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: AppColors.success,
                                        child: Icon(Icons.check, color: Colors.white, size: 18),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  l10n.imageSelected,
                                  style: AppTypography.bodyMedium(
                                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextButton.icon(
                                  onPressed: () async {
                                    final picker = ImagePicker();
                                    final image = await picker.pickImage(
                                      source: ImageSource.gallery,
                                      maxWidth: 1920,
                                      maxHeight: 1920,
                                      imageQuality: 80,
                                    );
                                    if (image != null) {
                                      setModalState(() => selectedImagePath = image.path);
                                    }
                                  },
                                  icon: const Icon(Icons.refresh),
                                  label: Text(l10n.changeImage),
                                ),
                              ],
                            )
                          : GestureDetector(
                              onTap: () async {
                                final picker = ImagePicker();
                                final image = await picker.pickImage(
                                  source: ImageSource.gallery,
                                  maxWidth: 1920,
                                  maxHeight: 1920,
                                  imageQuality: 80,
                                );
                                if (image != null) {
                                  setModalState(() {
                                    selectedImagePath = image.path;
                                  });
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? AppColors.accentPrimary.withValues(alpha: 0.1)
                                          : const Color(0x0A000000),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isDark
                                            ? AppColors.accentPrimary.withValues(alpha: 0.3)
                                            : const Color(0x26000000),
                                        width: 2,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 40,
                                      color: isDark ? AppColors.accentPrimary : AppColors.textSecondaryLight,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    l10n.tapToSelectImage,
                                    style: AppTypography.bodyMedium(
                                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),

                // Buttons
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(
                              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                            ),
                          ),
                          child: Text(l10n.cancel),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (useImage) {
                              Navigator.pop(context, {
                                'color': null,
                                'gradient': null,
                                'imagePath': selectedImagePath,
                              });
                            } else if (selectedIndex == -1) {
                              Navigator.pop(context, {
                                'color': null,
                                'gradient': null,
                                'imagePath': null,
                              });
                            } else if (selectedIndex < _backgroundSolidColors.length) {
                              Navigator.pop(context, {
                                'color': _backgroundSolidColors[selectedIndex].value,
                                'gradient': null,
                                'imagePath': null,
                              });
                            } else {
                              final grad = _backgroundGradients[selectedIndex - _backgroundSolidColors.length];
                              Navigator.pop(context, {
                                'color': grad[0].value,
                                'gradient': '${grad[0].value},${grad[1].value}',
                                'imagePath': null,
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(l10n.confirm, style: const TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        ),
      ),
    );

    if (result != null) {
      final updated = Contact(
        odid: contact.odid,
        hashId: contact.hashId,
        displayName: contact.displayName,
        avatarPath: contact.avatarPath,
        notes: contact.notes,
        addedAt: contact.addedAt,
        lastMessageAt: contact.lastMessageAt,
        lastMessagePreview: contact.lastMessagePreview,
        unreadCount: contact.unreadCount,
        notificationsEnabled: contact.notificationsEnabled,
        callNotificationsEnabled: contact.callNotificationsEnabled,
        identityPublicKey: contact.identityPublicKey,
        sessionData: contact.sessionData,
        mailboxToken: contact.mailboxToken,
        relayToken: contact.relayToken,
        verificationToken: contact.verificationToken,
        sealedSenderPublicKey: contact.sealedSenderPublicKey,
        mutedUntil: contact.mutedUntil,
        notificationSound: contact.notificationSound,
        chatBubbleColor: contact.chatBubbleColor,
        chatBubbleGradient: contact.chatBubbleGradient,
        chatBackgroundColor: result['color'] as int?,
        chatBackgroundGradient: result['gradient'] as String?,
        chatBackgroundImagePath: result['imagePath'] as String?,
        ephemeralDuration: contact.ephemeralDuration,
        sendReadReceipts: contact.sendReadReceipts,
        sendToken: contact.sendToken,
        isPinned: contact.isPinned,
        isHidden: contact.isHidden,
      );
      await ref.read(contactsProvider.notifier).updateContact(updated);
    }
  }

  // ============ SECURITY NUMBER ============
  Future<void> _showSecurityNumber(Contact contact) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final secureStorage = ref.read(secureStorageProvider);
    final myIdentityPublicKey = await secureStorage.getIdentityPublicKey();
    if (myIdentityPublicKey == null) return;

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecurityNumberScreen(
          contact: contact,
          myIdentityPublicKey: myIdentityPublicKey,
        ),
      ),
    );
  }

  // ============ HASH ID ============
  Future<void> _showHashId(Contact contact) async {
    // First, verify PIN
    final pinConfirmed = await _showPinConfirmation();
    if (!pinConfirmed || !mounted) return;

    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Mask the middle part of the Hash ID (format: XXX-XXX-XXX)
    final hashId = contact.hashId;
    final parts = hashId.split('-');
    final maskedHashId = parts.length == 3
        ? '${parts[0]}-•••-${parts[2]}'
        : hashId;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Logo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/icons/hash_icons.png',
                      width: 64,
                      height: 64,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  Text(
                    'Hash ID',
                    style: AppTypography.headlineSmall(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Contact name
                  Text(
                    contact.displayName,
                    style: AppTypography.bodyMedium(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Masked Hash ID
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.04),
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? Colors.black.withValues(alpha: 0.5)
                              : Colors.black.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      maskedHashId,
                      style: AppTypography.headlineMedium(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ).copyWith(
                        fontFamily: 'monospace',
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Security notice
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.accentPrimary.withValues(alpha: 0.1)
                          : const Color(0x0A000000),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shield_outlined,
                          color: isDark ? AppColors.accentPrimary : AppColors.textSecondaryLight,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l10n.hashIdPartiallyMasked,
                            style: AppTypography.bodySmall(
                              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Close button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        l10n.close,
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============ REPORT SPAM ============
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
            child: Text(l10n.cancel, style: AppTypography.labelLarge(
              color: theme.brightness == Brightness.dark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            )),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error, foregroundColor: Colors.white),
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

  // ============ BLOCK CONTACT ============
  Future<void> _blockContact(Contact contact) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => GlassTheme.wrapAlertDialog(context, AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        title: Text(l10n.blockContact, style: AppTypography.headlineSmall(
          color: theme.colorScheme.onSurface,
        )),
        content: Text(
          l10n.blockContactDescription,
          style: AppTypography.bodyMedium(
            color: theme.brightness == Brightness.dark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel, style: AppTypography.labelLarge(
              color: theme.brightness == Brightness.dark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            )),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error, foregroundColor: Colors.white),
            child: Text(l10n.blockContact),
          ),
        ],
      )),
    );

    if (confirmed == true && mounted) {
      // 1. Set isBlocked locally
      final updatedContact = contact.copyWith(isBlocked: true);
      await ref.read(contactsProvider.notifier).updateContact(updatedContact);

      // 2. Revoke send token so blocked contact can't send messages
      if (contact.sendToken != null) {
        try {
          final edgeFunctionService = ref.read(edgeFunctionServiceProvider);
          await edgeFunctionService.call('revoke-send-token', body: {
            'send_token': contact.sendToken,
          });
        } catch (_) {
          // Token revocation is best-effort
        }
      }

      if (mounted) {
        setState(() {});
        showHashSnackBar(context, message: l10n.contactBlocked, type: HashSnackBarType.success);
      }
    }
  }

  Future<void> _unblockContact(Contact contact) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => GlassTheme.wrapAlertDialog(context, AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        title: Text(l10n.unblockContact, style: AppTypography.headlineSmall(
          color: theme.colorScheme.onSurface,
        )),
        content: Text(
          l10n.unblockContactDescription,
          style: AppTypography.bodyMedium(
            color: theme.brightness == Brightness.dark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel, style: AppTypography.labelLarge(
              color: theme.brightness == Brightness.dark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            )),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accentPrimary, foregroundColor: Colors.black),
            child: Text(l10n.unblockContact),
          ),
        ],
      )),
    );

    if (confirmed == true && mounted) {
      // 1. Set isBlocked to false locally
      final updatedContact = contact.copyWith(isBlocked: false);
      await ref.read(contactsProvider.notifier).updateContact(updatedContact);

      // 2. Register a new send token
      try {
        final edgeFunctionService = ref.read(edgeFunctionServiceProvider);
        await edgeFunctionService.call('register-send-token');
      } catch (_) {
        // Token registration is best-effort
      }

      if (mounted) {
        setState(() {});
        showHashSnackBar(context, message: l10n.contactUnblocked, type: HashSnackBarType.success);
      }
    }
  }

  // ============ DELETE CONTACT ============
  Future<void> _deleteContact(Contact contact) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => GlassTheme.wrapAlertDialog(context, AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        title: Text(l10n.deleteContact, style: AppTypography.headlineSmall(
          color: theme.colorScheme.onSurface,
        )),
        content: Text(
          l10n.deleteContactMessage,
          style: AppTypography.bodyMedium(
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel, style: AppTypography.labelLarge(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            )),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error, foregroundColor: Colors.white),
            child: Text(l10n.delete),
          ),
        ],
      )),
    );

    if (confirmed != true) return;

    // PIN confirmation
    final pinConfirmed = await _showPinConfirmation();
    if (!pinConfirmed) return;

    await ref.read(contactsProvider.notifier).deleteContact(contact.odid);

    if (!mounted) return;
    context.go(AppRoutes.home);
  }

  Future<bool> _showPinConfirmation() async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    bool confirmed = false;
    String? error;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: StatefulBuilder(
          builder: (context, setModalState) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Lock icon
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: GlassTheme.glassIconColor(isDark).withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.lock_outline,
                        color: GlassTheme.glassIconColor(isDark),
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      l10n.confirmWithPin,
                      style: AppTypography.headlineSmall(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      l10n.enterPinToConfirm,
                      style: AppTypography.bodyMedium(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // PIN Field
                    HashPinField(
                      onCompleted: (pin) async {
                        final secureStorage = ref.read(secureStorageProvider);
                        final isValid = await secureStorage.verifyPin(pin);

                        if (isValid) {
                          confirmed = true;
                          Navigator.pop(context);
                        } else {
                          setModalState(() {
                            error = l10n.incorrectPin;
                          });
                        }
                      },
                      autofocus: true,
                    ),

                    // Error message
                    if (error != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: AppColors.error,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              error!,
                              style: AppTypography.bodyMedium(color: AppColors.error),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Cancel button
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          l10n.cancel,
                          style: AppTypography.bodyLarge(
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return confirmed;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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

    return PopScope(
      canPop: !_notesHasChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _handleBackPress();
        if (shouldPop && mounted) {
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            onPressed: () async {
              final shouldPop = await _handleBackPress();
              if (shouldPop && mounted) {
                context.pop();
              }
            },
          ),
        actions: [
          // Show save button when editing name OR when notes have changes
          if (_isEditing)
            TextButton(
              onPressed: _saveChanges,
              child: Text(
                l10n.save,
                style: AppTypography.labelLarge(color: AppColors.accentPrimary),
              ),
            )
          else if (_notesHasChanges)
            IconButton(
              onPressed: _saveNotes,
              icon: const Icon(Icons.check_rounded),
              color: AppColors.accentPrimary,
              tooltip: 'Enregistrer la note',
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, MediaQuery.of(context).padding.top + kToolbarHeight + 24, 24, 24),
        child: Column(
          children: [
            // Avatar
            EditableAvatar(
              imagePath: contact.avatarPath,
              initials: contact.initials,
              size: 120,
              colorSeed: contact.displayName,
              onEdit: () => _showAvatarOptions(contact),
            ).animate().fadeIn().scale(),

            const SizedBox(height: 24),

            // Name with edit pencil
            if (_isEditing)
              HashTextField(
                controller: _nameController,
                hintText: l10n.contactName,
                textCapitalization: TextCapitalization.words,
              )
            else
              GestureDetector(
                onTap: () => setState(() => _isEditing = true),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        contact.displayName,
                        style: AppTypography.headlineLarge(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.edit_outlined,
                      size: 20,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 40),

            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ActionButton(
                  icon: Icons.chat_bubble_outline,
                  label: l10n.messageAction,
                  onTap: () => context.push('/chat/${contact.odid}'),
                  isDark: isDark,
                ),
                _ActionButton(
                  icon: Icons.phone_outlined,
                  label: l10n.callAction,
                  onTap: () {
                    ref.read(callStateProvider.notifier).initiateCall(
                          contact: contact,
                          callType: CallType.audio,
                        );
                    context.pushNamed('call', pathParameters: {'contactId': contact.odid}, extra: CallType.audio);
                  },
                  isDark: isDark,
                ),
                _ActionButton(
                  icon: Icons.videocam_outlined,
                  label: l10n.videoAction,
                  onTap: () {
                    ref.read(callStateProvider.notifier).initiateCall(
                          contact: contact,
                          callType: CallType.video,
                        );
                    context.pushNamed('call', pathParameters: {'contactId': contact.odid}, extra: CallType.video);
                  },
                  isDark: isDark,
                ),
              ],
            )).animate().fadeIn(delay: 200.ms),

            const SizedBox(height: 40),

            // ============ NOTIFICATIONS SECTION ============
            _SectionContainer(
              isDark: isDark,
              children: [
                _SettingsTile(
                  icon: contact.isMuted ? Icons.notifications_off : Icons.notifications_outlined,
                  title: l10n.muteNotifications,
                  subtitle: contact.isMuted
                      ? l10n.mutedUntil(_formatMuteTime(contact.mutedUntil!))
                      : l10n.notMuted,
                  isDark: isDark,
                  trailing: contact.isMuted
                      ? TextButton(
                          onPressed: () => _unmute(contact),
                          child: Text(l10n.unmute),
                        )
                      : const Icon(Icons.chevron_right),
                  onTap: () => _showMuteOptions(contact),
                ),
                _Divider(isDark: isDark),
                Opacity(
                  opacity: contact.isMuted ? 0.5 : 1.0,
                  child: _SettingsTile(
                    icon: Icons.chat_bubble_outline,
                    title: l10n.messageNotifications,
                    isDark: isDark,
                    trailing: Switch(
                      value: contact.notificationsEnabled,
                      onChanged: contact.isMuted
                          ? null
                          : (value) async {
                              await _updateContact(contact.copyWith(notificationsEnabled: value));
                            },
                      activeColor: AppColors.accentPrimary,
                    ),
                  ),
                ),
                _Divider(isDark: isDark),
                Opacity(
                  opacity: contact.isMuted ? 0.5 : 1.0,
                  child: _SettingsTile(
                    icon: Icons.phone_outlined,
                    title: l10n.callNotifications,
                    isDark: isDark,
                    trailing: Switch(
                      value: contact.callNotificationsEnabled,
                      onChanged: contact.isMuted
                          ? null
                          : (value) async {
                              await _updateContact(contact.copyWith(callNotificationsEnabled: value));
                            },
                      activeColor: AppColors.accentPrimary,
                    ),
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 300.ms),

            const SizedBox(height: 16),

            // ============ MESSAGES SECTION ============
            _SectionContainer(
              isDark: isDark,
              children: [
                _SettingsTile(
                  icon: Icons.done_all,
                  title: 'Confirmations de lecture',
                  subtitle: contact.sendReadReceipts == null
                      ? 'Paramètre global'
                      : (contact.sendReadReceipts! ? 'Activé' : 'Désactivé'),
                  isDark: isDark,
                  trailing: Switch(
                    value: contact.sendReadReceipts ?? ref.read(appSettingsProvider).sendReadReceipts,
                    onChanged: (value) async {
                      // Si la valeur est la même que le global, remettre à null (suivre le global)
                      final globalValue = ref.read(appSettingsProvider).sendReadReceipts;
                      final newValue = value == globalValue ? null : value;
                      await _updateContact(contact.copyWith(sendReadReceipts: newValue));
                    },
                    activeColor: AppColors.accentPrimary,
                  ),
                ),
                _Divider(isDark: isDark),
                _SettingsTile(
                  icon: Icons.timer_outlined,
                  title: l10n.ephemeralMessages,
                  subtitle: _getEphemeralText(contact.ephemeralDuration, l10n),
                  isDark: isDark,
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showEphemeralOptions(contact),
                ),
                _Divider(isDark: isDark),
                _SettingsTile(
                  icon: Icons.delete_outline,
                  title: 'Supprimer tous les messages',
                  subtitle: 'Supprime uniquement les messages locaux',
                  isDark: isDark,
                  titleColor: AppColors.error,
                  onTap: () => _showDeleteAllMessagesDialog(contact),
                ),
              ],
            ).animate().fadeIn(delay: 350.ms),

            const SizedBox(height: 16),

            // ============ APPEARANCE SECTION ============
            _SectionContainer(
              isDark: isDark,
              children: [
                _SettingsTile(
                  icon: Icons.palette_outlined,
                  title: l10n.bubbleColor,
                  subtitle: contact.chatBubbleColor != null ? l10n.customColor : l10n.defaultColor,
                  isDark: isDark,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (contact.chatBubbleColor != null)
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(contact.chatBubbleColor!),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                            ),
                          ),
                        ),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () => _showBubbleColorPreview(contact),
                ),
                _Divider(isDark: isDark),
                _SettingsTile(
                  icon: Icons.wallpaper_outlined,
                  title: l10n.chatBackground,
                  subtitle: contact.chatBackgroundImagePath != null
                      ? l10n.imageSelected
                      : (contact.chatBackgroundColor != null ? l10n.customColor : l10n.defaultColor),
                  isDark: isDark,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (contact.chatBackgroundColor != null)
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(contact.chatBackgroundColor!),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                            ),
                          ),
                        )
                      else if (contact.chatBackgroundImagePath != null)
                        const Icon(Icons.image, size: 24),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () => _showBackgroundOptions(contact),
                ),
              ],
            ).animate().fadeIn(delay: 400.ms),

            const SizedBox(height: 16),

            // ============ SECURITY SECTION ============
            _SectionContainer(
              isDark: isDark,
              children: [
                _SettingsTile(
                  icon: Icons.verified_user_outlined,
                  title: l10n.securityNumber,
                  subtitle: l10n.verifyEncryption,
                  isDark: isDark,
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showSecurityNumber(contact),
                ),
                _Divider(isDark: isDark),
                _SettingsTile(
                  icon: Icons.tag,
                  title: 'Hash ID',
                  subtitle: l10n.viewContactHashId,
                  isDark: isDark,
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showHashId(contact),
                ),
              ],
            ).animate().fadeIn(delay: 450.ms),

            const SizedBox(height: 16),

            // ============ NOTES SECTION ============
            _SectionContainer(
              isDark: isDark,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.note_outlined,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                          const SizedBox(width: 12),
                          Text(l10n.personalNotes, style: AppTypography.labelLarge(
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          )),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Édition directe des notes - toujours modifiable
                      TextField(
                        controller: _notesController,
                        focusNode: _notesFocusNode,
                        maxLines: null,
                        minLines: 2,
                        maxLength: _maxNotesLength,
                        style: AppTypography.bodyMedium(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                        decoration: InputDecoration(
                          hintText: l10n.addNotes,
                          hintStyle: AppTypography.bodyMedium(
                            color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.accentPrimary,
                              width: 1.5,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                          counterStyle: AppTypography.labelSmall(
                            color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 500.ms),

            const SizedBox(height: 24),

            // ============ DANGER SECTION ============
            _SectionContainer(
              isDark: isDark,
              borderColor: AppColors.error.withValues(alpha: 0.3),
              children: [
                _SettingsTile(
                  icon: contact.isBlocked ? Icons.lock_open_outlined : Icons.block,
                  title: contact.isBlocked ? l10n.unblockContact : l10n.blockContact,
                  subtitle: contact.isBlocked ? l10n.unblockContactDescription : l10n.blockContactDescription,
                  isDark: isDark,
                  iconColor: contact.isBlocked ? AppColors.accentPrimary : AppColors.error,
                  onTap: () => contact.isBlocked ? _unblockContact(contact) : _blockContact(contact),
                ),
                _Divider(isDark: isDark),
                _SettingsTile(
                  icon: Icons.flag_outlined,
                  title: l10n.reportSpam,
                  subtitle: l10n.reportSpamSubtitle,
                  isDark: isDark,
                  iconColor: AppColors.error,
                  onTap: () => _reportSpam(contact),
                ),
                _Divider(isDark: isDark),
                _SettingsTile(
                  icon: Icons.delete_outline,
                  title: l10n.deleteContact,
                  subtitle: l10n.deleteContactSubtitle,
                  isDark: isDark,
                  iconColor: AppColors.error,
                  onTap: () => _deleteContact(contact),
                ),
              ],
            ).animate().fadeIn(delay: 550.ms),

            const SizedBox(height: 24),

            Text(
              _formatAddedDate(context, contact.addedAt),
              style: AppTypography.labelSmall(
                color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
      ),
    );
  }

  String _formatMuteTime(DateTime muteUntil) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final diff = muteUntil.difference(now);

    if (diff.inDays > 365) {
      return l10n.indefinitely;
    } else if (diff.inDays > 0) {
      return '${diff.inDays}d';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h';
    } else {
      return '${diff.inMinutes}min';
    }
  }

  String _getEphemeralText(int? durationSeconds, AppLocalizations l10n) {
    if (durationSeconds == null) {
      // Utiliser la préférence globale
      final settings = ref.read(appSettingsProvider);
      final globalLabel = _getEphemeralDurationLabel(settings.defaultEphemeralDuration, l10n);
      return '${l10n.ephemeralMyPreference} ($globalLabel)';
    }
    return _getEphemeralDurationLabel(durationSeconds, l10n);
  }

  static String _getEphemeralDurationLabel(int durationSeconds, AppLocalizations l10n) {
    if (durationSeconds == 0) {
      return l10n.ephemeralImmediate;
    } else if (durationSeconds == 60) {
      return '1 minute';
    } else if (durationSeconds == 5 * 60) {
      return '5 minutes';
    } else if (durationSeconds == 15 * 60) {
      return '15 minutes';
    } else if (durationSeconds == 30 * 60) {
      return '30 minutes';
    } else if (durationSeconds == 60 * 60) {
      return '1 heure';
    } else if (durationSeconds == 3 * 60 * 60) {
      return '3 heures';
    } else if (durationSeconds == 6 * 60 * 60) {
      return '6 heures';
    } else if (durationSeconds == 12 * 60 * 60) {
      return '12 heures';
    } else if (durationSeconds == 24 * 60 * 60) {
      return '24 heures';
    } else if (durationSeconds == 3 * 24 * 60 * 60) {
      return '3 jours';
    } else if (durationSeconds < 60) {
      return '$durationSeconds secondes';
    } else if (durationSeconds < 3600) {
      return '${durationSeconds ~/ 60} minutes';
    } else {
      return '${durationSeconds ~/ 3600} heures';
    }
  }

  String _formatAddedDate(BuildContext context, DateTime date) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final localDate = date.toLocal();
    final formattedDate = DateFormat.yMd(locale).format(localDate);
    return l10n.addedOn(formattedDate);
  }

  // Bubble colors - solid colors
  static const List<Color> _bubbleSolidColors = [
    AppColors.accentPrimary, // Amber (default)
    Color(0xFF607D8B), // Blue Grey
    Color(0xFFFF6B6B), // Coral Red
    Color(0xFFFF8E53), // Orange
    Color(0xFFFECA57), // Yellow
    Color(0xFF5CD85C), // Green
    Color(0xFF48DBFB), // Cyan
    Color(0xFF54A0FF), // Blue
    Color(0xFF5F27CD), // Purple
    Color(0xFFF368E0), // Pink
    Color(0xFFEE5A5A), // Red
    Color(0xFF10AC84), // Teal
  ];

  // Bubble gradients
  static const List<List<Color>> _bubbleGradients = [
    [Color(0xFFFF6B6B), Color(0xFFFF8E53)], // Coral to Orange
    [Color(0xFFFF8E53), Color(0xFFFECA57)], // Orange to Yellow
    [Color(0xFF48DBFB), Color(0xFF54A0FF)], // Cyan to Blue
    [Color(0xFF54A0FF), Color(0xFF5F27CD)], // Blue to Purple
    [Color(0xFF5F27CD), Color(0xFFF368E0)], // Purple to Pink
    [Color(0xFFF368E0), Color(0xFFFF6B6B)], // Pink to Red
    [Color(0xFF5CD85C), Color(0xFF10AC84)], // Green to Teal
    [Color(0xFF10AC84), Color(0xFF48DBFB)], // Teal to Cyan
  ];

  // Background solid colors - 10 beautiful colors
  static const List<Color> _backgroundSolidColors = [
    Color(0xFF0D0D0D), // Noir profond
    Color(0xFF1A1A2E), // Bleu nuit
    Color(0xFF2D3436), // Gris charbon
    Color(0xFF4A0E0E), // Bordeaux sombre
    Color(0xFF0C3547), // Bleu pétrole
    Color(0xFF1E3A29), // Vert forêt
    Color(0xFFF5F5F5), // Blanc cassé
    Color(0xFFE8E4E1), // Beige doux
    Color(0xFFDFE6ED), // Bleu glacier
    Color(0xFFF0E6EF), // Rose poudré
  ];

  // Background gradients - 9 beautiful gradients (2 colors each)
  static const List<List<Color>> _backgroundGradients = [
    // Sombres
    [Color(0xFF0F2027), Color(0xFF2C5364)], // Océan profond
    [Color(0xFF141E30), Color(0xFF243B55)], // Nuit étoilée
    [Color(0xFF1F1C2C), Color(0xFF928DAB)], // Violet mystique
    [Color(0xFF232526), Color(0xFF414345)], // Acier brossé
    // Colorés
    [Color(0xFF4568DC), Color(0xFFB06AB3)], // Violet électrique
    [Color(0xFF11998E), Color(0xFF38EF7D)], // Émeraude
    [Color(0xFFFF6B6B), Color(0xFFFECEA8)], // Coucher de soleil
    // Clairs
    [Color(0xFFE0EAFC), Color(0xFFCFDEF3)], // Ciel d'hiver
    [Color(0xFFFCE4EC), Color(0xFFF3E5F5)], // Rose lavande
  ];

  /// Helper to get contrasting text color for a bubble
  static Color _getContrastingTextColor(Color backgroundColor) {
    // Calculate luminance
    final luminance = backgroundColor.computeLuminance();
    // Return black for light colors, white for dark colors
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDark;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.accentPrimary, size: 38),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white.withValues(alpha: 0.7) : Colors.black.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  final List<Widget> children;
  final bool isDark;
  final Color? borderColor;

  const _SectionContainer({
    required this.children,
    required this.isDark,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor ?? (isDark
              ? Colors.white.withValues(alpha: 0.06)
              : Colors.black.withValues(alpha: 0.04)),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.5)
                : Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final bool isDark;
  final Color? iconColor;
  final Color? titleColor;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.isDark,
    this.iconColor,
    this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final tertiaryColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
    final iconTint = iconColor ?? titleColor ?? AppColors.accentPrimary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: iconTint.withValues(alpha: 0.08),
      highlightColor: iconTint.withValues(alpha: 0.04),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: iconTint, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyMedium(
                      color: titleColor ?? primaryColor,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        subtitle!,
                        style: AppTypography.bodySmall(color: tertiaryColor),
                      ),
                    ),
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  final bool isDark;

  const _Divider({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 66),
      child: Divider(
        height: 0.5,
        thickness: 0.5,
        color: isDark
            ? Colors.white.withValues(alpha: 0.06)
            : Colors.black.withValues(alpha: 0.08),
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accentPrimary
              : (isDark ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.accentPrimary
                : (isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04)),
            width: isSelected ? 1 : 0.5,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.labelLarge(
              color: isSelected ? Colors.black : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
            ),
          ),
        ),
      ),
    );
  }
}

/// Beautiful color tile for color grids (supports solid colors and gradients)
class _ColorTile extends StatelessWidget {
  final Color? color;
  final List<Color>? gradient;
  final bool isSelected;
  final String? label;
  final VoidCallback onTap;
  final bool isDark;

  const _ColorTile({
    this.color,
    this.gradient,
    required this.isSelected,
    this.label,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final isDefault = color == null && gradient == null;
    final hasGradient = gradient != null && gradient!.length >= 2;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: hasGradient ? null : (color ?? (isDark ? Colors.black : Colors.white)),
          gradient: hasGradient
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradient!,
                )
              : null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.accentPrimary
                : (isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04)),
            width: isSelected ? 3 : 0.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            // Default label
            if (isDefault)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      size: 20,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      label ?? '',
                      style: AppTypography.labelSmall(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            // Selection indicator
            if (isSelected)
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.accentPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, size: 14, color: Colors.black),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Option tile for photo picker bottom sheet
class _PhotoOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isDark;
  final VoidCallback onTap;

  const _PhotoOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: AppTypography.bodyLarge(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
            ),
          ],
        ),
      ),
    );
  }
}
