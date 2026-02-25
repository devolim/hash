import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/avatar_utils.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact.dart';
import '../../../domain/models/contact_request.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/services/local_storage_service.dart';
import '../../providers/app_providers.dart';
import '../../providers/contact_request_providers.dart';
import '../../widgets/common/hash_button.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../widgets/common/hash_text_field.dart';

/// Screen showing contact requests with tabs for received and sent
class ContactRequestsScreen extends ConsumerStatefulWidget {
  const ContactRequestsScreen({super.key});

  @override
  ConsumerState<ContactRequestsScreen> createState() =>
      _ContactRequestsScreenState();
}

class _ContactRequestsScreenState extends ConsumerState<ContactRequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(contactRequestsProvider.notifier).startListening();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadRequests() async {
    if (!mounted) return;
    await ref.read(contactRequestsProvider.notifier).fetchAllRequests();
  }

  String _formatTimeRemaining(String expiresAt) {
    final expires = DateTime.parse(expiresAt);
    final now = DateTime.now();
    final diff = expires.difference(now);

    if (diff.isNegative) {
      return AppLocalizations.of(context)!.codeExpired;
    }

    if (diff.inHours > 0) {
      return '${diff.inHours}h';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}min';
    } else {
      return '<1min';
    }
  }

  /// Decrypt message: supports hybrid encryption (X25519 + AES-GCM) and legacy base64
  Future<String?> _decryptMessage(String? encryptedMessage) async {
    if (encryptedMessage == null || encryptedMessage.isEmpty) return null;
    try {
      final data = base64Decode(encryptedMessage);

      // Hybrid encrypted format: ephemeralPublicKey(32) + nonce(12) + ciphertext + mac(16)
      // Minimum size: 32 + 12 + 1 + 16 = 61 bytes
      if (data.length >= 61) {
        // Try hybrid decryption first
        try {
          final secureStorage = ref.read(secureStorageProvider);
          final privateKeyBase64 = await secureStorage.read('sealed_sender_private_key');
          if (privateKeyBase64 != null) {
            return await _decryptHybrid(data, privateKeyBase64);
          }
        } catch (e) {
          debugPrint('[ContactRequests] Hybrid decryption failed, trying base64 fallback: $e');
        }
      }

      // Fallback: legacy base64 encoding
      return utf8.decode(data);
    } catch (e) {
      return null;
    }
  }

  /// Decrypt hybrid encrypted data (X25519 ECDH + AES-GCM)
  Future<String> _decryptHybrid(Uint8List data, String privateKeyBase64) async {
    const ephemeralKeyLength = 32;
    const nonceLength = 12;
    const macLength = 16;

    // Extract components
    final ephemeralPublicKeyBytes = data.sublist(0, ephemeralKeyLength);
    final nonce = data.sublist(ephemeralKeyLength, ephemeralKeyLength + nonceLength);
    final cipherText = data.sublist(ephemeralKeyLength + nonceLength, data.length - macLength);
    final macBytes = data.sublist(data.length - macLength);

    // 1. Reconstruct recipient's private key
    final privateKeyBytes = base64Decode(privateKeyBase64);
    final x25519 = X25519();
    final recipientKeyPair = await x25519.newKeyPairFromSeed(privateKeyBytes);

    // 2. ECDH: shared secret from recipient private + ephemeral public
    final ephemeralPublicKey = SimplePublicKey(ephemeralPublicKeyBytes, type: KeyPairType.x25519);
    final sharedSecret = await x25519.sharedSecretKey(
      keyPair: recipientKeyPair,
      remotePublicKey: ephemeralPublicKey,
    );

    // 3. HKDF to derive AES-256 key (same params as sender)
    final hkdf = Hkdf(hmac: Hmac.sha256(), outputLength: 32);
    final aesKey = await hkdf.deriveKey(
      secretKey: sharedSecret,
      info: utf8.encode('hash_contact_request_v1'),
      nonce: utf8.encode('hash_cr_salt'),
    );

    // 4. AES-GCM decrypt
    final aesGcm = AesGcm.with256bits();
    final secretBox = SecretBox(
      cipherText,
      nonce: nonce,
      mac: Mac(macBytes),
    );
    final decrypted = await aesGcm.decrypt(secretBox, secretKey: aesKey);

    return utf8.decode(decrypted);
  }

  Future<void> _acceptRequestFromModel(ContactRequest request) async {
    final l10n = AppLocalizations.of(context)!;

    final result = await _showAcceptSheet(request);
    if (result == null || !mounted) return;

    try {
      // Use the provider to get full raw response (includes acceptor keys for sealed message)
      final rawResponse = await ref
          .read(contactRequestsProvider.notifier)
          .acceptRequestRaw(request.id);

      final acceptedRequest = ContactRequest.fromAcceptResponse(rawResponse);

      String? avatarPath;
      final photoBytes = result['photoBytes'] as Uint8List?;
      if (photoBytes != null) {
        final directory = await getApplicationDocumentsDirectory();
        final avatarDir = Directory('${directory.path}/avatars');
        if (!await avatarDir.exists()) {
          await avatarDir.create(recursive: true);
        }
        final fileName = 'contact_${request.requesterHashId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final file = File('${avatarDir.path}/$fileName');
        await file.writeAsBytes(photoBytes);
        avatarPath = AvatarUtils.toRelative(file.path);
      }

      // Create contact with Zero-Knowledge tokens and send token
      final contact = Contact(
        odid: acceptedRequest.userId!,
        hashId: acceptedRequest.requesterHashId,
        displayName: result['name'] as String? ?? request.requesterHashId,
        addedAt: DateTime.now(),
        notes: result['notes'] as String?,
        avatarPath: avatarPath,
        identityPublicKey: acceptedRequest.identityPublicKey,
        // Zero-Knowledge tokens for sealed sender messaging
        mailboxToken: acceptedRequest.mailboxToken,
        relayToken: acceptedRequest.relayToken,
        sealedSenderPublicKey: acceptedRequest.sealedSenderPublicKey,
        // Send token (authorization to send messages to this contact's mailbox)
        sendToken: acceptedRequest.sendToken,
      );

      await ref.read(contactsProvider.notifier).addContact(contact);

      // Send "contact_accepted" signal with enriched payload (acceptor keys + send token)
      // so the requester can create the contact locally without a server round-trip
      _sendContactAcceptedSignal(contact, rawResponse);

      if (!mounted) return;

      showHashSnackBar(context, message: l10n.requestAccepted, type: HashSnackBarType.success);

      context.go(AppRoutes.home);
    } catch (e) {
      debugPrint('[ContactRequests] Error accepting request: $e');
      if (!mounted) return;
      showHashSnackBar(context, message: l10n.error, type: HashSnackBarType.error);
    }
  }

  /// Send a "contact_accepted" signal to the requester's mailbox
  /// with enriched payload (acceptor keys + send token) so they can
  /// create the contact locally without a server round-trip.
  void _sendContactAcceptedSignal(Contact contact, Map<String, dynamic> rawResponse) {
    if (contact.mailboxToken == null || contact.sealedSenderPublicKey == null) {
      debugPrint('[ContactRequests] Cannot send contact_accepted signal: missing mailbox/sealed key');
      return;
    }

    final mailboxService = ref.read(anonymousMailboxServiceProvider);
    final payload = jsonEncode({
      'type': 'contact_accepted',
      'timestamp': DateTime.now().toIso8601String(),
      'request_id': rawResponse['request_id'],
      'acceptor': rawResponse['acceptor'],
      'send_token_for_requester': rawResponse['send_token_for_requester'],
    });

    final messageBytes = Uint8List.fromList(utf8.encode(payload));
    mailboxService.sendSealedMessage(
      recipientMailboxToken: contact.mailboxToken!,
      messageContent: messageBytes,
      recipientSealedPublicKey: contact.sealedSenderPublicKey!,
      recipientRelayToken: contact.relayToken,
      sendToken: contact.sendToken,
    ).then((_) {
      debugPrint('[ContactRequests] contact_accepted signal sent to ${contact.hashId}');
    }).catchError((e) {
      debugPrint('[ContactRequests] Error sending contact_accepted signal: $e');
    });
  }

  Future<void> _rejectRequestFromModel(ContactRequest request) async {
    final l10n = AppLocalizations.of(context)!;

    try {
      await ref.read(contactRequestsProvider.notifier).rejectRequest(request.id);

      if (!mounted) return;

      showHashSnackBar(context, message: l10n.requestRejected, type: HashSnackBarType.success);
    } catch (e) {
      if (!mounted) return;
      showHashSnackBar(context, message: l10n.error, type: HashSnackBarType.error);
    }
  }

  Future<Map<String, dynamic>?> _showAcceptSheet(ContactRequest request) async {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final nameController = TextEditingController();
    final notesController = TextEditingController();
    Uint8List? selectedPhoto;

    final decryptedMessage = await _decryptMessage(request.encryptedMessage);

    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: StatefulBuilder(
          builder: (context, setSheetState) => GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
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

                    // Avatar placeholder with photo picker
                    GestureDetector(
                      onTap: () async {
                        final picker = ImagePicker();
                        final image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image == null) return;

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
                        if (croppedFile == null) return;

                        final bytes = await File(croppedFile.path).readAsBytes();
                        setSheetState(() => selectedPhoto = bytes);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentPrimary.withValues(alpha: 0.1),
                              border: Border.all(
                                color: AppColors.accentPrimary.withValues(alpha: 0.3),
                                width: 3,
                              ),
                              image: selectedPhoto != null
                                  ? DecorationImage(
                                      image: MemoryImage(selectedPhoto!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: selectedPhoto == null
                                ? const Icon(
                                    Icons.person,
                                    size: 48,
                                    color: AppColors.accentPrimary,
                                  )
                                : null,
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.accentPrimary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.colorScheme.surface,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                selectedPhoto == null ? Icons.add : Icons.edit,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          if (selectedPhoto != null)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () => setSheetState(() => selectedPhoto = null),
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: AppColors.error,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.close, size: 14, color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Hash ID
                    Text(
                      request.requesterHashId,
                      style: AppTypography.headlineSmall(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      l10n.acceptContactSubtitle,
                      style: AppTypography.bodySmall(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // Message if present
                    if (decryptedMessage != null) ...[
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.accentPrimary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.accentPrimary.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.lock_outline,
                                  color: AppColors.accentPrimary,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Message',
                                  style: AppTypography.labelMedium(
                                    color: AppColors.accentPrimary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              decryptedMessage,
                              style: AppTypography.bodyMedium(
                                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Name field
                    HashTextField(
                      controller: nameController,
                      hintText: l10n.contactNameOptional,
                      prefixIcon: Icons.person_outline,
                      textCapitalization: TextCapitalization.words,
                      autocorrect: false,
                    ),

                    const SizedBox(height: 12),

                    // Notes field
                    HashTextField(
                      controller: notesController,
                      hintText: l10n.notesOptional,
                      prefixIcon: Icons.note_outlined,
                      maxLines: 2,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: false,
                    ),

                    const SizedBox(height: 24),

                    // Accept button
                    SizedBox(
                      width: double.infinity,
                      child: HashButton(
                        text: l10n.acceptRequest,
                        icon: Icons.check,
                        onPressed: () {
                          Navigator.pop(context, {
                            'name': nameController.text.trim().isEmpty
                                ? null
                                : nameController.text.trim(),
                            'notes': notesController.text.trim().isEmpty
                                ? null
                                : notesController.text.trim(),
                            'photoBytes': selectedPhoto,
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }

  Future<void> _cancelRequest(Map<String, dynamic> request) async {
    final l10n = AppLocalizations.of(context)!;

    try {
      await ref.read(contactRequestsProvider.notifier).cancelSentRequest(request['id'] as String);

      if (!mounted) return;

      showHashSnackBar(context, message: l10n.requestCancelled, type: HashSnackBarType.success);
    } catch (e) {
      if (!mounted) return;
      showHashSnackBar(context, message: l10n.error, type: HashSnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final requestsState = ref.watch(contactRequestsProvider);

    return Scaffold(
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
            color: GlassTheme.glassIconColor(isDark),
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.requests,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),
          // Custom tab bar
          Container(
            margin: const EdgeInsets.fromLTRB(24, 16, 24, 8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.accentPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              labelStyle: AppTypography.labelLarge(),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.inbox_outlined, size: 18),
                      const SizedBox(width: 8),
                      Text(l10n.receivedRequests),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.outbox_outlined, size: 18),
                      const SizedBox(width: 8),
                      Text(l10n.sentRequests),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn().slideY(begin: -0.1),

          // Content
          Expanded(
            child: requestsState.isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Chargement...',
                          style: AppTypography.bodyMedium(
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  )
                : TabBarView(
                    controller: _tabController,
                    children: [
                      _buildReceivedTab(l10n, isDark, requestsState.pendingRequests),
                      _buildSentTab(l10n, isDark, requestsState.sentRequests),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedTab(AppLocalizations l10n, bool isDark, List<ContactRequest> pendingRequests) {
    if (pendingRequests.isEmpty) {
      return _buildEmptyState(
        icon: Icons.inbox_outlined,
        title: l10n.noPendingRequests,
        subtitle: 'Les demandes reçues apparaîtront ici',
        isDark: isDark,
      );
    }

    return RefreshIndicator(
      onRefresh: _loadRequests,
      color: AppColors.accentPrimary,
      child: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: pendingRequests.length,
        itemBuilder: (context, index) {
          final request = pendingRequests[index];

          return FutureBuilder<String?>(
            future: _decryptMessage(request.encryptedMessage),
            builder: (context, snapshot) {
              return _ReceivedRequestCard(
                hashId: request.requesterHashId,
                expiresAt: request.expiresAt.toIso8601String(),
                message: snapshot.data,
                isDark: isDark,
                timeRemaining: _formatTimeRemaining(request.expiresAt.toIso8601String()),
                onAccept: () => _acceptRequestFromModel(request),
                onReject: () => _rejectRequestFromModel(request),
              ).animate(delay: (index * 50).ms).fadeIn().slideX(begin: -0.1);
            },
          );
        },
      ),
    );
  }

  Widget _buildSentTab(AppLocalizations l10n, bool isDark, List<Map<String, dynamic>> sentRequests) {
    if (sentRequests.isEmpty) {
      return _buildEmptyState(
        icon: Icons.outbox_outlined,
        title: l10n.noSentRequests,
        subtitle: 'Les demandes envoyées apparaîtront ici',
        isDark: isDark,
      );
    }

    final localStorage = ref.read(localStorageProvider);

    return RefreshIndicator(
      onRefresh: _loadRequests,
      color: AppColors.accentPrimary,
      child: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: sentRequests.length,
        itemBuilder: (context, index) {
          final request = sentRequests[index];
          final hashId = request['recipient_hash_id'] as String;

          return FutureBuilder<List<dynamic>>(
            future: Future.wait([
              localStorage.getPendingContactMetadata(hashId),
              _decryptMessage(request['encrypted_message'] as String?),
            ]),
            builder: (context, snapshot) {
              final metadata = snapshot.data?[0] as PendingContactMetadata?;
              final decryptedMessage = snapshot.data?[1] as String?;

              return _SentRequestCard(
                hashId: hashId,
                expiresAt: request['expires_at'] as String,
                isDark: isDark,
                timeRemaining: _formatTimeRemaining(request['expires_at'] as String),
                onCancel: () => _cancelRequest(request),
                name: metadata?.name,
                notes: metadata?.notes,
                photoBytes: metadata?.photoBytes,
                message: decryptedMessage,
              ).animate(delay: (index * 50).ms).fadeIn().slideX(begin: 0.1);
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isDark,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: isDark ? Colors.black : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 48,
                color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: AppTypography.headlineSmall(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ).animate().fadeIn(delay: 200.ms).scale(begin: const Offset(0.9, 0.9)),
    );
  }
}

/// Card for received contact requests
class _ReceivedRequestCard extends StatelessWidget {
  final String hashId;
  final String expiresAt;
  final String? message;
  final bool isDark;
  final String timeRemaining;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const _ReceivedRequestCard({
    required this.hashId,
    required this.expiresAt,
    required this.message,
    required this.isDark,
    required this.timeRemaining,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Avatar placeholder
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.accentPrimary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.accentPrimary.withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_add_outlined,
                    color: AppColors.accentPrimary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hashId,
                        style: AppTypography.bodyLarge(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ).copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 14,
                            color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            l10n.expiresIn(timeRemaining),
                            style: AppTypography.labelSmall(
                              color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // New badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Nouveau',
                    style: AppTypography.labelSmall(color: AppColors.success),
                  ),
                ),
              ],
            ),
          ),

          // Message if present
          if (message != null) ...[
            Divider(
              height: 1,
              color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 20,
                    color: AppColors.accentPrimary.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      message!,
                      style: AppTypography.bodyMedium(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Actions
          Divider(
            height: 1,
            color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: onReject,
                    icon: const Icon(Icons.close, size: 18),
                    label: Text(l10n.rejectRequest),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.error,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onAccept,
                    icon: const Icon(Icons.check, size: 18),
                    label: Text(l10n.acceptRequest),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Card for sent contact requests
class _SentRequestCard extends StatelessWidget {
  final String hashId;
  final String expiresAt;
  final bool isDark;
  final String timeRemaining;
  final VoidCallback onCancel;
  final String? name;
  final String? notes;
  final Uint8List? photoBytes;
  final String? message;

  const _SentRequestCard({
    required this.hashId,
    required this.expiresAt,
    required this.isDark,
    required this.timeRemaining,
    required this.onCancel,
    this.name,
    this.notes,
    this.photoBytes,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with avatar, name, hash ID, status
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.accentPrimary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.accentPrimary.withValues(alpha: 0.3),
                      width: 2,
                    ),
                    image: photoBytes != null
                        ? DecorationImage(
                            image: MemoryImage(photoBytes!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: photoBytes == null
                      ? const Icon(
                          Icons.person,
                          color: AppColors.accentPrimary,
                          size: 28,
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display name if available
                      if (name != null && name!.isNotEmpty) ...[
                        Text(
                          name!,
                          style: AppTypography.bodyLarge(
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          ).copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                      ],
                      // Hash ID
                      Text(
                        hashId,
                        style: (name != null && name!.isNotEmpty)
                            ? AppTypography.labelSmall(
                                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                              )
                            : AppTypography.bodyLarge(
                                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                              ).copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      // Status
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accentPrimary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              'En attente \u2022 ${l10n.expiresIn(timeRemaining)}',
                              style: AppTypography.labelSmall(
                                color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Notes if present
          if (notes != null && notes!.isNotEmpty) ...[
            Divider(
              height: 1,
              color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notes :',
                    style: AppTypography.labelSmall(
                      color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      notes!,
                      style: AppTypography.bodySmall(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Encrypted message if present
          if (message != null) ...[
            Divider(
              height: 1,
              color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Message :',
                    style: AppTypography.labelSmall(
                      color: AppColors.accentPrimary.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      message!,
                      style: AppTypography.bodySmall(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Delete button
          Divider(
            height: 1,
            color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: onCancel,
                icon: const Icon(Icons.delete_outline, size: 18),
                label: Text(l10n.deleteRequest),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.error,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
