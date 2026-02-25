import 'dart:convert';
import 'dart:io';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/router/app_router.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';
import '../../widgets/common/hash_button.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../widgets/common/hash_text_field.dart';

/// Screen for sending a contact request
class SendRequestScreen extends ConsumerStatefulWidget {
  final String hashId;
  final String exchangeToken;
  final String recipientPublicKey;
  final String? recipientSealedSenderPublicKey;

  const SendRequestScreen({
    super.key,
    required this.hashId,
    required this.exchangeToken,
    required this.recipientPublicKey,
    this.recipientSealedSenderPublicKey,
  });

  @override
  ConsumerState<SendRequestScreen> createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends ConsumerState<SendRequestScreen> {
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _messageController = TextEditingController();
  Uint8List? _selectedPhoto;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null || !mounted) return;

    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Crop image (same as contact_detail_screen)
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

    final bytes = await File(croppedFile.path).readAsBytes();
    setState(() {
      _selectedPhoto = bytes;
    });
  }

  void _removePhoto() {
    setState(() {
      _selectedPhoto = null;
    });
  }

  /// Encrypt message using hybrid encryption (X25519 ECDH + AES-GCM)
  /// Format: base64(ephemeralPublicKey[32] + nonce[12] + ciphertext + mac[16])
  Future<String?> _encryptMessage(String message) async {
    if (message.isEmpty) return null;

    final recipientSealedKey = widget.recipientSealedSenderPublicKey;
    if (recipientSealedKey == null || recipientSealedKey.isEmpty) {
      // Fallback: base64 only if recipient has no sealed sender key
      debugPrint('[SendRequest] No sealed_sender_public_key — using base64 fallback');
      return base64Encode(utf8.encode(message));
    }

    // 1. Generate ephemeral X25519 key pair
    final x25519 = X25519();
    final ephemeralKeyPair = await x25519.newKeyPair();
    final ephemeralPublicKey = await ephemeralKeyPair.extractPublicKey();
    final ephemeralPublicKeyBytes = Uint8List.fromList(ephemeralPublicKey.bytes);

    // 2. ECDH: shared secret from ephemeral private + recipient public
    final recipientPublicKeyBytes = base64Decode(recipientSealedKey);
    final recipientKey = SimplePublicKey(recipientPublicKeyBytes, type: KeyPairType.x25519);
    final sharedSecret = await x25519.sharedSecretKey(
      keyPair: ephemeralKeyPair,
      remotePublicKey: recipientKey,
    );

    // 3. HKDF to derive AES-256 key
    final hkdf = Hkdf(hmac: Hmac.sha256(), outputLength: 32);
    final aesKey = await hkdf.deriveKey(
      secretKey: sharedSecret,
      info: utf8.encode('hash_contact_request_v1'),
      nonce: utf8.encode('hash_cr_salt'),
    );

    // 4. AES-GCM encrypt
    final aesGcm = AesGcm.with256bits();
    final nonce = aesGcm.newNonce();
    final encrypted = await aesGcm.encrypt(
      utf8.encode(message),
      secretKey: aesKey,
      nonce: nonce,
    );

    // 5. Pack: ephemeralPublicKey(32) + nonce(12) + ciphertext + mac(16)
    final combined = Uint8List(
      ephemeralPublicKeyBytes.length + nonce.length + encrypted.cipherText.length + encrypted.mac.bytes.length,
    );
    var offset = 0;
    combined.setRange(offset, offset + ephemeralPublicKeyBytes.length, ephemeralPublicKeyBytes);
    offset += ephemeralPublicKeyBytes.length;
    combined.setRange(offset, offset + nonce.length, nonce);
    offset += nonce.length;
    combined.setRange(offset, offset + encrypted.cipherText.length, encrypted.cipherText);
    offset += encrypted.cipherText.length;
    combined.setRange(offset, offset + encrypted.mac.bytes.length, encrypted.mac.bytes);

    return base64Encode(combined);
  }

  Future<void> _sendRequest() async {
    setState(() => _isLoading = true);

    try {
      final userRepo = ref.read(userRepositoryProvider);
      final localStorage = ref.read(localStorageProvider);

      // Encrypt message if provided (X25519 ECDH + AES-GCM)
      String? encryptedMessage;
      final message = _messageController.text.trim();
      if (message.isNotEmpty) {
        encryptedMessage = await _encryptMessage(message);
      }

      // Send the contact request using the exchange token (15 min TTL)
      await userRepo.sendContactRequest(
        targetHashId: widget.hashId,
        exchangeToken: widget.exchangeToken,
        encryptedMessage: encryptedMessage,
      );

      // Save pending contact metadata locally (name, photo, notes)
      final name = _nameController.text.trim();
      final notes = _notesController.text.trim();
      if (name.isNotEmpty || notes.isNotEmpty || _selectedPhoto != null) {
        await localStorage.savePendingContactMetadata(
          PendingContactMetadata(
            hashId: widget.hashId,
            name: name.isEmpty ? null : name,
            notes: notes.isEmpty ? null : notes,
            photoBytes: _selectedPhoto,
          ),
        );
      }

      if (!mounted) return;

      // Show success and navigate back
      showHashSnackBar(context, message: AppLocalizations.of(context)!.requestSent, type: HashSnackBarType.success);

      context.go(AppRoutes.home);
    } catch (e) {
      setState(() => _isLoading = false);

      if (!mounted) return;

      String errorMessage = AppLocalizations.of(context)!.error;
      final errorString = e.toString().toLowerCase();
      if (errorString.contains('déjà en attente') || errorString.contains('already pending')) {
        errorMessage = AppLocalizations.of(context)!.requestAlreadyPending;
      } else if (errorString.contains('déjà envoyé') || errorString.contains('already sent')) {
        errorMessage = AppLocalizations.of(context)!.theyAlreadySentYouRequest;
      } else if (errorString.contains('jeton') || errorString.contains('exchange') || errorString.contains('expiré')) {
        // Exchange token expired — redirect back to add contact screen
        showHashSnackBar(context, message: AppLocalizations.of(context)!.invalidOrExpiredCode, type: HashSnackBarType.error);
        context.pop();
        return;
      }

      showHashSnackBar(context, message: errorMessage, type: HashSnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: GlassTheme.glassIconColor(isDark),
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.sendRequest,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, MediaQuery.of(context).padding.top + kToolbarHeight + 24, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Recipient Hash ID
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.accentPrimary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_outline,
                    color: AppColors.accentPrimary,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.hashId,
                    style: AppTypography.hashId(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Photo picker
            GestureDetector(
              onTap: _selectedPhoto == null ? _pickPhoto : null,
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark
                          ? Colors.black
                          : Colors.white,
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.04),
                        width: 0.5,
                      ),
                      image: _selectedPhoto != null
                          ? DecorationImage(
                              image: MemoryImage(_selectedPhoto!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _selectedPhoto == null
                        ? Icon(
                            Icons.add_a_photo_outlined,
                            size: 32,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          )
                        : null,
                  ),
                  if (_selectedPhoto != null)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: _removePhoto,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.error,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Text(
              l10n.photoOptional,
              style: AppTypography.bodySmall(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),

            const SizedBox(height: 24),

            // Local data section header
            Row(
              children: [
                Icon(
                  Icons.phone_android,
                  size: 16,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.storedLocally,
                  style: AppTypography.bodySmall(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Name field
            HashTextField(
              controller: _nameController,
              hintText: l10n.contactNameOptional,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: false,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
            ),

            const SizedBox(height: 16),

            // Notes field
            HashTextField(
              controller: _notesController,
              hintText: l10n.notesOptional,
              maxLines: 2,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: false,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2000),
              ],
            ),

            const SizedBox(height: 24),

            // Divider with label for encrypted message
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lock_outline,
                        size: 14,
                        color: AppColors.accentPrimary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        l10n.encryptedMessageLabel,
                        style: AppTypography.bodySmall(
                          color: AppColors.accentPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Message field (will be encrypted)
            HashTextField(
              controller: _messageController,
              hintText: l10n.identityMessageHint,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                LengthLimitingTextInputFormatter(500),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              l10n.messageWillBeSentEncrypted,
              style: AppTypography.bodySmall(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Send button
            SizedBox(
              width: double.infinity,
              child: HashButton(
                text: l10n.sendRequestButton,
                onPressed: _isLoading ? null : _sendRequest,
                isLoading: _isLoading,
              ),
            ),

            const SizedBox(height: 16),

            // Info text
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accentPrimary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.accentPrimary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.requestExpiresIn24h,
                      style: AppTypography.bodySmall(
                        color: AppColors.accentPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
