import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import '../../providers/contact_request_providers.dart';
import '../../providers/temporary_code_provider.dart';
import '../../widgets/common/hash_button.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../widgets/common/hash_text_field.dart';

class AddContactScreen extends ConsumerStatefulWidget {
  const AddContactScreen({super.key});

  @override
  ConsumerState<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends ConsumerState<AddContactScreen>
    with WidgetsBindingObserver {
  final _hashIdController = TextEditingController();

  // Single controller for the temporary code (hidden TextField approach)
  final _codeController = TextEditingController();
  final _codeFocusNode = FocusNode();

  bool _isSendingRequest = false;
  String? _error;
  bool _requestSent = false; // Show success message after sending request

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _codeFocusNode.addListener(() {
      if (mounted) setState(() {});
    });
    // Start listening for contact requests
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(temporaryCodeNotifierProvider.notifier).generate();
      ref.read(contactRequestsProvider.notifier).startListening();
      // Ensure mailbox is initialized before sending/accepting requests
      _ensureMailboxInitialized();
    });
  }

  /// Ensure mailbox is initialized so tokens are available for contact requests
  Future<void> _ensureMailboxInitialized() async {
    final mailboxService = ref.read(anonymousMailboxServiceProvider);
    if (mailboxService.currentMailboxToken == null) {
      debugPrint('[AddContact] Initializing mailbox before contact operations...');
      final success = await mailboxService.initializeMailbox();
      if (!success) {
        debugPrint('[AddContact] WARNING: Mailbox initialization failed');
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Regénérer si le code est expiré au retour de l'arrière-plan
      ref.read(temporaryCodeNotifierProvider.notifier).generate();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _hashIdController.dispose();
    _codeController.dispose();
    _codeFocusNode.dispose();
    super.dispose();
  }

  /// Get the complete temporary code
  String get _temporaryCode => _codeController.text;

  void _copyToClipboard(String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    showHashSnackBar(context, message: message, type: HashSnackBarType.success, duration: const Duration(seconds: 1));
  }

  // ============ Search & Add Contact ============

  /// Validate code and navigate to SendRequestScreen
  Future<void> _validateAndNavigate() async {
    final l10n = AppLocalizations.of(context)!;
    final hashId = _hashIdController.text.trim().toUpperCase();
    final temporaryCode = _temporaryCode;

    if (hashId.isEmpty || temporaryCode.isEmpty) {
      setState(() => _error = l10n.fillAllFields);
      return;
    }

    // Validate Hash ID format
    final hashIdRegex = RegExp(r'^\d{3}-\d{3}-[A-Z]{3}$');
    if (!hashIdRegex.hasMatch(hashId)) {
      setState(() => _error = l10n.invalidHashIdFormat);
      return;
    }

    // Check if user is trying to add themselves
    final user = ref.read(currentUserProvider);
    if (user != null && hashId == user.hashId.toUpperCase()) {
      setState(() => _error = l10n.cannotAddYourself);
      return;
    }

    setState(() {
      _isSendingRequest = true;
      _error = null;
    });

    try {
      // First validate the code and get recipient's public key
      final userRepo = ref.read(userRepositoryProvider);
      final response = await userRepo.validateContactCode(
        targetHashId: hashId,
        temporaryCode: temporaryCode,
      );

      debugPrint('[AddContact] validate response: $response');

      if (!mounted) return;

      // Extract the recipient's public keys and exchange token
      final recipient = response['recipient'] as Map<String, dynamic>?;
      final publicKey = recipient?['identity_public_key'] as String?;
      final sealedSenderPublicKey = recipient?['sealed_sender_public_key'] as String?;
      final exchangeToken = response['exchange_token'] as String?;

      debugPrint('[AddContact] publicKey: $publicKey, sealedSenderPublicKey: ${sealedSenderPublicKey != null ? "present" : "null"}, exchangeToken: $exchangeToken');

      if (publicKey == null || exchangeToken == null) {
        throw Exception('No public key or exchange token received');
      }

      setState(() => _isSendingRequest = false);

      // Navigate to SendRequestScreen where user can enter name, photo, notes, message
      // The exchange_token has a 15 min TTL (vs 5 min for the temporary code)
      context.push(
        AppRoutes.sendRequest,
        extra: {
          'hashId': hashId,
          'exchangeToken': exchangeToken,
          'recipientPublicKey': publicKey,
          'recipientSealedSenderPublicKey': sealedSenderPublicKey,
        },
      );
    } catch (e) {
      debugPrint('[AddContact] ERROR: $e');
      String errorMessage = l10n.error;
      final errorString = e.toString().toLowerCase();
      if (errorString.contains('non trouvé') || errorString.contains('not found')) {
        errorMessage = l10n.userNotFound;
      } else if (errorString.contains('rate') || errorString.contains('trop')) {
        errorMessage = l10n.tooManyAttempts;
      } else if (errorString.contains('déjà en attente') || errorString.contains('already pending')) {
        errorMessage = l10n.requestAlreadyPending;
      } else if (errorString.contains('déjà envoyé') || errorString.contains('already sent')) {
        errorMessage = l10n.requestAlreadySentByOther;
      } else if (errorString.contains('invalide') || errorString.contains('invalid') || errorString.contains('expiré') || errorString.contains('expired')) {
        errorMessage = l10n.invalidOrExpiredCode;
      }

      setState(() {
        _error = errorMessage;
        _isSendingRequest = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // If request was sent, show success message
    if (_requestSent) {
      return _buildRequestSentStep(l10n, isDark);
    }

    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        title: Text(l10n.addContactTitle, style: AppTypography.headlineSmall(color: GlassTheme.glassTextColor(isDark))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: GlassTheme.glassIconColor(isDark)),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + kToolbarHeight + 16, 16, 16),
        child: Column(
          children: [
            // ============ SCANNER SECTION ============
            _buildScannerSection(l10n, isDark)
                .animate()
                .fadeIn()
                .slideY(begin: 0.1, end: 0),

            const SizedBox(height: 16),

            // ============ MY PROFILE SECTION ============
            _buildMyProfileSection(l10n, isDark)
                .animate()
                .fadeIn(delay: 200.ms)
                .slideY(begin: 0.1, end: 0),

            const SizedBox(height: 16),

            // ============ ADD BY HASH ID SECTION (sends request) ============
            _buildAddByHashIdSection(l10n, isDark)
                .animate()
                .fadeIn(delay: 300.ms)
                .slideY(begin: 0.1, end: 0),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildMyProfileSection(AppLocalizations l10n, bool isDark) {
    final user = ref.watch(currentUserProvider);
    final codeState = ref.watch(temporaryCodeNotifierProvider);
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final secondaryColor =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: AppColors.accentPrimary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.myProfile,
                      style: AppTypography.bodyLarge(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      l10n.myProfileSubtitle,
                      style: AppTypography.bodySmall(color: secondaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Hash ID row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hash ID',
                      style: AppTypography.labelMedium(color: secondaryColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user?.hashId ?? '---',
                      style: AppTypography.hashId(),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: user?.hashId != null
                    ? () => _copyToClipboard(user!.hashId, l10n.copiedToClipboard)
                    : null,
                icon: const Icon(Icons.copy, size: 20),
                color: AppColors.accentPrimary,
                tooltip: l10n.copyHashId,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Temporary code row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.temporaryCode,
                      style: AppTypography.labelMedium(color: secondaryColor),
                    ),
                    const SizedBox(height: 4),
                    if (codeState.isLoading)
                      const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.accentPrimary),
                        ),
                      )
                    else if (codeState.code != null && !codeState.isExpired)
                      Text(
                        codeState.code!,
                        style: AppTypography.code(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      )
                    else
                      Text(
                        l10n.codeExpired,
                        style: AppTypography.bodySmall(color: secondaryColor),
                      ),
                  ],
                ),
              ),
              if (codeState.code != null && !codeState.isExpired)
                IconButton(
                  onPressed: () =>
                      _copyToClipboard(codeState.code!, l10n.copiedToClipboard),
                  icon: const Icon(Icons.copy, size: 20),
                  color: AppColors.accentPrimary,
                  tooltip: l10n.copyCode,
                ),
            ],
          ),

          // Timer and actions
          const SizedBox(height: 12),

          Row(
            children: [
              // Timer badge
              if (codeState.code != null && !codeState.isExpired)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: codeState.remainingSeconds < 60
                        ? AppColors.error.withValues(alpha: 0.1)
                        : AppColors.accentPrimary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 14,
                        color: codeState.remainingSeconds < 60
                            ? AppColors.error
                            : AppColors.accentPrimary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        codeState.formattedTime,
                        style: AppTypography.labelSmall(
                          color: codeState.remainingSeconds < 60
                              ? AppColors.error
                              : AppColors.accentPrimary,
                        ),
                      ),
                    ],
                  ),
                ),

              const Spacer(),

              // Refresh button
              TextButton.icon(
                onPressed: codeState.isLoading
                    ? null
                    : () => ref.read(temporaryCodeNotifierProvider.notifier).forceRefresh(),
                icon: const Icon(Icons.refresh, size: 18),
                label: Text(l10n.generateNewCodeButton),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.accentPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Show QR button
          SizedBox(
            width: double.infinity,
            child: HashButton(
              text: l10n.showMyQrCode,
              icon: Icons.qr_code,
              isOutlined: true,
              onPressed: () => context.push(AppRoutes.qrDisplay),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerSection(AppLocalizations l10n, bool isDark) {
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final secondaryColor =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.push(AppRoutes.qrScanner),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04), width: 0.5),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.qr_code_scanner,
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
                      l10n.scanQrCode,
                      style: AppTypography.bodyLarge(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      l10n.scanQrCodeSubtitle,
                      style: AppTypography.bodySmall(color: secondaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: AppColors.accentPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequestSentStep(AppLocalizations l10n, bool isDark) {
    final theme = Theme.of(context);
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        title: Text(l10n.addContactTitle, style: AppTypography.headlineSmall(color: GlassTheme.glassTextColor(isDark))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: GlassTheme.glassIconColor(isDark)),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.success.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.send_outlined,
                size: 48,
                color: AppColors.success,
              ),
            ).animate().fadeIn().scale(),

            const SizedBox(height: 24),

            Text(
              l10n.requestSent,
              style: AppTypography.headlineSmall(color: primaryColor),
            ).animate().fadeIn(delay: 100.ms),

            const SizedBox(height: 12),

            Text(
              l10n.requestSentSubtitle,
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms),

            const SizedBox(height: 32),

            HashButton(
              text: l10n.ok,
              onPressed: () => context.pop(),
              width: double.infinity,
            ).animate().fadeIn(delay: 300.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildAddByHashIdSection(AppLocalizations l10n, bool isDark) {
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.person_search_outlined,
                  color: AppColors.accentPrimary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.addByHashId,
                      style: AppTypography.bodyLarge(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      l10n.addByHashIdSubtitle,
                      style: AppTypography.bodySmall(color: secondaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Hash ID field
          Text(
            l10n.contactHashIdLabel,
            style: AppTypography.labelMedium(color: secondaryColor),
          ),
          const SizedBox(height: 8),
          HashIdField(
            controller: _hashIdController,
            onComplete: () => _codeFocusNode.requestFocus(),
          ),

          const SizedBox(height: 16),

          // Temporary code field - single hidden TextField + visual digit boxes
          Text(
            l10n.temporaryCode,
            style: AppTypography.labelMedium(color: secondaryColor),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _codeFocusNode.requestFocus(),
            child: Stack(
              children: [
                // Hidden TextField that captures all input
                Opacity(
                  opacity: 0,
                  child: SizedBox(
                    height: 1,
                    child: TextField(
                      controller: _codeController,
                      focusNode: _codeFocusNode,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      autofocus: false,
                      enableInteractiveSelection: false,
                      showCursor: false,
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      onChanged: (value) {
                        setState(() {});
                        if (_error != null) {
                          setState(() => _error = null);
                        }
                        if (value.length == 6) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                  ),
                ),
                // Visual digit boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    final code = _codeController.text;
                    final hasDigit = index < code.length;
                    final isActive = _codeFocusNode.hasFocus && index == code.length;
                    return Container(
                      width: 48,
                      height: 56,
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isActive
                              ? AppColors.accentPrimary
                              : hasDigit
                                  ? AppColors.accentPrimary.withValues(alpha: 0.5)
                                  : borderColor,
                          width: isActive ? 2 : 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: hasDigit
                          ? Text(
                              code[index],
                              style: AppTypography.headlineSmall(
                                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                              ),
                            )
                          : isActive
                              ? Container(
                                  width: 2,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: AppColors.accentPrimary,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                )
                              : null,
                    );
                  }),
                ),
              ],
            ),
          ),

          // Error message
          if (_error != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: AppColors.error, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _error!,
                      style: AppTypography.bodyMedium(color: AppColors.error),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn().shake(),
          ],

          const SizedBox(height: 20),

          // Send request button
          SizedBox(
            width: double.infinity,
            child: HashButton(
              text: l10n.sendRequest,
              icon: Icons.person_add,
              isOutlined: true,
              onPressed: _validateAndNavigate,
              isLoading: _isSendingRequest,
            ),
          ),
        ],
      ),
    );
  }
}
