import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart' as signal;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/router/app_router.dart';
import 'package:uuid/uuid.dart';
import '../../../core/services/anonymous_mailbox_service.dart';
import '../../../core/services/edge_function_service.dart';
import '../../../core/services/sealed_sender_service.dart';
import '../../../core/services/secure_storage_service.dart';
import '../../../core/services/signal_protocol_service.dart';
import '../../../core/services/media_download_queue_service.dart';
import '../../../core/services/message_send_queue_service.dart';
import '../../../core/services/receipt_queue_service.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/notification_preferences_sync.dart';
import '../../../core/services/ui_sound_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact.dart';
import '../../../domain/models/message.dart';
import '../../../domain/models/call_message.dart';
import '../../../domain/models/call_state.dart';
import '../../providers/app_providers.dart';
import '../../providers/call_providers.dart';
import '../../providers/contact_request_providers.dart';
import '../../../domain/models/contact_request.dart';
import '../../providers/contact_sync_provider.dart';
import '../../providers/temporary_code_provider.dart';
import '../../widgets/common/avatar.dart';
import '../../widgets/common/hash_button.dart';
import '../../widgets/common/session_guard.dart';
import '../../widgets/common/animated_appbar_title.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../widgets/common/hash_text_field.dart';
import '../../widgets/common/startup_dialogs.dart';
import '../../../core/services/remote_config_service.dart';
import '../../../core/network/pinned_http_client.dart';

/// Shared bottom sheet for starting a new message (used by HomeScreen and MainShell)
void showNewMessageSheet(BuildContext parentContext, WidgetRef ref) {
  final l10n = AppLocalizations.of(parentContext)!;
  final contacts = ref.read(contactsProvider);
  final theme = Theme.of(parentContext);
  final isDark = theme.brightness == Brightness.dark;
  final searchController = TextEditingController();

  showModalBottomSheet(
    context: parentContext,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (ctx) {
      return GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(parentContext).size.height * 0.7,
          ),
          child: StatefulBuilder(
            builder: (context, setSheetState) {
              final query = searchController.text.toLowerCase();
              final filtered = query.isEmpty
                  ? contacts
                  : contacts
                      .where((c) =>
                          c.displayName.toLowerCase().contains(query))
                      .toList();

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          l10n.newMessage,
                          style: AppTypography.headlineSmall(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: HashTextField(
                      controller: searchController,
                      hintText: l10n.searchContact,
                      prefixIcon: Icons.search,
                      onChanged: (_) => setSheetState(() {}),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filtered.length,
                      itemBuilder: (_, index) {
                        final contact = filtered[index];
                        return ListTile(
                          leading: HashAvatar(
                            imagePath: contact.avatarPath,
                            initials: contact.initials,
                            size: 48,
                            colorSeed: contact.displayName,
                          ),
                          title: Text(
                            contact.displayName,
                            style: AppTypography.bodyLarge(
                              color: isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(ctx);
                            ref.read(selectedContactProvider.notifier).state =
                                contact;
                            parentContext.push('/chat/${contact.odid}');
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

/// Shared dialog for the "account not found" error.
/// [onRetry] checks if the account exists — returns true if found, false if still missing.
/// Dialog result: 'close', 'retry' (account recovered), or 'create'.
Future<String> showAccountNotFoundDialog(
  BuildContext context, {
  required Future<bool> Function() onRetry,
}) async {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  final result = await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      var isRetrying = false;

      return StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Compte introuvable',
                  style: AppTypography.headlineSmall(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
              ),
              if (!isRetrying)
                GestureDetector(
                  onTap: () => Navigator.pop(ctx, 'close'),
                  child: Icon(
                    Icons.close,
                    size: 22,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
            ],
          ),
          content: Text(
            'Votre compte n\'a pas été trouvé sur le serveur. '
            'Il a peut-être été supprimé.\n\n'
            'Vous pouvez réessayer ou créer un nouveau compte.',
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          actions: [
            if (isRetrying)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
                  ),
                ),
              )
            else ...[
              TextButton(
                onPressed: () async {
                  setDialogState(() => isRetrying = true);
                  final found = await onRetry();
                  if (!ctx.mounted) return;
                  if (found) {
                    Navigator.pop(ctx, 'retry');
                  } else {
                    setDialogState(() => isRetrying = false);
                  }
                },
                child: Text(
                  'Réessayer',
                  style: TextStyle(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, 'create'),
                child: const Text(
                  'Créer un nouveau compte',
                  style: TextStyle(color: AppColors.accentPrimary),
                ),
              ),
            ],
          ],
        ),
      );
    },
  );

  return result ?? 'close';
}

/// Receipt arrivé avant son message (early receipt)
class _PendingReceipt {
  final String type;
  final String contactId;
  final DateTime timestamp;
  final DateTime cachedAt;

  _PendingReceipt({
    required this.type,
    required this.contactId,
    required this.timestamp,
    DateTime? cachedAt,
  }) : cachedAt = cachedAt ?? DateTime.now();
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SessionGuardMixin, WidgetsBindingObserver {
  // Cache provider references for use in dispose() — ref.read() is not safe
  // after the widget is disposed (throws "Cannot use ref after disposed").
  ContactRequestsNotifier? _contactRequestsNotifier;
  AnonymousMailboxService? _mailboxService;
  final List<ReceivedSealedMessage> _pendingSealedMessages = [];

  /// Counter for "Utilisateur non trouvé" errors across different Edge Function calls.
  /// When >= 2, we show a confirmation dialog to the user.
  int _userNotFoundCount = 0;
  bool _userNotFoundDialogShown = false;

  /// Timestamp when app went to background (for auto-lock)
  DateTime? _backgroundTimestamp;

  /// Search in conversations
  String _searchQuery = '';
  final _searchController = TextEditingController();

  /// Whether the donation tile has been dismissed
  bool _donationDismissed = false;

  /// Cache pour les receipts arrivant avant leur message (early receipts).
  /// Key = messageId, Value = {type, timestamp, contactId}
  /// TTL: 1h (nettoyé à chaque insertion)
  final Map<String, _PendingReceipt> _earlyReceiptCache = {};

  /// Guard against double-tap navigation to chat
  bool _isNavigating = false;

  void _navigateToChat(BuildContext ctx, String contactId) {
    if (_isNavigating) return;
    _isNavigating = true;
    ctx.push('/chat/$contactId');
    Future.delayed(const Duration(milliseconds: 500), () {
      _isNavigating = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // Register lifecycle observer to track app state
    WidgetsBinding.instance.addObserver(this);

    // Defer provider operations to after widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      // Cache references for dispose()
      _contactRequestsNotifier = ref.read(contactRequestsProvider.notifier);
      _mailboxService = ref.read(anonymousMailboxServiceProvider);
      // Mark app as active to prevent background handler from showing duplicates
      NotificationService().setAppActive(true);
      // Sync contact names to SharedPrefs for background call notifications
      _syncContactNamesForCallKit();
      // Sync per-contact notification settings for background handlers
      _syncContactNotificationSettings();
      // Sync contact call data for early audio connect (before PIN)
      _syncContactCallDataForEarlyConnect();
      // Retry pending messages when contacts finish loading
      ref.listenManual(contactsProvider, (previous, next) {
        if (_pendingSealedMessages.isNotEmpty && next.isNotEmpty) {
          _retryPendingMessages();
        }
      });
      // Verify certificate SPKI pin (MITM detection)
      _verifyCertificatePin();
      // Initialize Double Ratchet (Signal Protocol) service, then start listening
      _initializeSignalProtocol().then((_) {
        if (!mounted) return;
        // Start listening for messages (sauf en mode fantôme)
        _setupMessageListener();
      });
      // Vérifier si la session est encore valide
      _checkSessionValidity();
      // Start contact request polling for realtime updates
      _setupContactRequestSync();
      // Nettoyage des messages dont le fallback 24h est dépassé
      _cleanupExpiredMaxMessages();
      // Initialiser le service d'expiration des messages éphémères
      ref.read(expirationServiceProvider).init();
      // Auto-nettoyage des conversations inactives depuis 7 jours
      _cleanupStaleConversations();
      // Reprendre les téléchargements média en attente
      _resumePendingMediaDownloads();
      // Reprendre les envois de messages en attente
      _resumePendingSendMessages();
      // Reprendre les accusés de réception en attente
      _resumePendingReceipts();
      // Generate temporary code only if no contacts (empty state)
      // Use listener to wait for contacts to be loaded from Hive
      ref.listenManual(contactsProvider, (previous, next) {
        if (ref.read(contactsProvider.notifier).isLoaded && next.isEmpty) {
          ref.read(temporaryCodeNotifierProvider.notifier).generate();
        }
      }, fireImmediately: true);
      // Request notification permissions contextually (after account creation)
      NotificationService().requestPermissions();
      // Fetch remote config and show startup check
      _fetchRemoteConfigAndCheck();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    // Unregister lifecycle observer
    WidgetsBinding.instance.removeObserver(this);
    // Mark app as inactive
    NotificationService().setAppActive(false);
    // Stop Realtime — use cached references (ref.read() is unsafe in dispose)
    _contactRequestsNotifier?.stopListening();
    _mailboxService?.stopRealtime();
    _mailboxService?.onMessagesReceived = null;
    _mailboxService?.onCallSignalsReceived = null;
    _pendingSealedMessages.clear();
    super.dispose();
  }

  Future<void> _fetchRemoteConfigAndCheck() async {
    final remoteConfig = ref.read(remoteConfigServiceProvider);
    await remoteConfig.fetch();

    if (!mounted) return;

    final contacts = ref.read(contactsProvider);
    final hasContacts = contacts.isNotEmpty;
    final check = await remoteConfig.getStartupCheck(hasContacts: hasContacts);

    if (!mounted) return;

    switch (check.type) {
      case StartupCheckType.forceUpdate:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const ForceUpdateScreen()),
          (_) => false,
        );
        break;
      case StartupCheckType.maintenance:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => MaintenanceBlockScreen(maintenance: check.maintenance!),
          ),
          (_) => false,
        );
        break;
      case StartupCheckType.alert:
        showAlertDialog(
          context,
          alert: check.alert!,
          onDismiss: () => remoteConfig.markAlertSeen(check.alert!.id),
        );
        break;
      case StartupCheckType.promptRating:
        showRatingDialog(
          context,
          onDismiss: () => remoteConfig.recordPromptShown(StartupCheckType.promptRating),
        );
        break;
      case StartupCheckType.promptDonation:
        showDonationDialog(
          context,
          onDismiss: () => remoteConfig.recordPromptShown(StartupCheckType.promptDonation),
        );
        break;
      case StartupCheckType.none:
        break;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Notify remote participant of our background/foreground state during calls
    ref.read(callStateProvider.notifier).notifyAppLifecycleState(state);
    // Update app active state based on lifecycle
    // This prevents the background handler from showing duplicate notifications
    switch (state) {
      case AppLifecycleState.resumed:
        // App is in foreground
        NotificationService().setAppActive(true);
        // Dismiss any keyboard that iOS may restore when resuming
        FocusManager.instance.primaryFocus?.unfocus();
        // Catch up on messages/signals missed while in background
        _mailboxService?.reconnect();
        debugPrint('[HomeScreen] App resumed - set active, reconnecting');
        // Check auto-lock timeout
        _checkAutoLock();
        break;
      case AppLifecycleState.paused:
        // Record background timestamp for auto-lock
        _backgroundTimestamp = DateTime.now();
        // App is going to background
        NotificationService().setAppActive(false);
        debugPrint('[HomeScreen] App paused - set inactive, recorded background timestamp');
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        // App is going to background or being killed
        NotificationService().setAppActive(false);
        debugPrint('[HomeScreen] App inactive/detached/hidden - set inactive');
        break;
    }
  }

  /// Check if auto-lock timeout has expired and redirect to PIN entry
  void _checkAutoLock() {
    if (_backgroundTimestamp == null) return;

    final settings = ref.read(appSettingsProvider);
    final autoLockMinutes = settings.autoLockMinutes;
    final elapsed = DateTime.now().difference(_backgroundTimestamp!);

    _backgroundTimestamp = null;

    bool shouldLock;
    if (autoLockMinutes == 0) {
      // Immediate: lock after 5s grace period (avoids false triggers from
      // screenshots, Control Center swipes, or brief phone calls)
      shouldLock = elapsed.inSeconds >= 5;
    } else {
      shouldLock = elapsed.inMinutes >= autoLockMinutes;
    }

    if (shouldLock && mounted) {
      // Don't auto-lock during call bypass (accepted from lock screen)
      if (ref.read(callBypassProvider)) {
        debugPrint('[HomeScreen] Auto-lock skipped (call bypass active)');
        return;
      }
      // Don't auto-lock during an active call
      final callState = ref.read(callStateProvider);
      if (callState.isActive || callState.status == CallStatus.connecting ||
          callState.status == CallStatus.ringing) {
        debugPrint('[HomeScreen] Auto-lock skipped (call in progress: ${callState.status})');
        return;
      }
      debugPrint('[HomeScreen] Auto-lock triggered (elapsed: ${elapsed.inSeconds}s, setting: ${autoLockMinutes}min)');
      ref.read(isAppLockedProvider.notifier).state = true;
      context.go(AppRoutes.pinEntry);
    }
  }

  /// Sync contact names to SharedPreferences so the background FCM handler
  /// can resolve caller names for CallKit without accessing Hive.
  void _syncContactNamesForCallKit() {
    final contacts = ref.read(contactsProvider);
    if (contacts.isEmpty) return;

    final nameMap = <String, String>{};
    for (final contact in contacts) {
      nameMap[contact.hashId] = contact.displayName;
    }
    NotificationService().syncContactNamesToSharedPrefs(nameMap);
  }

  /// Sync per-contact notification settings to SharedPreferences + iOS UserDefaults.
  /// This allows background handlers and iOS NSE to respect per-contact mute/disable.
  void _syncContactNotificationSettings() {
    final contacts = ref.read(contactsProvider);
    if (contacts.isEmpty) return;

    final settingsMap = <String, Map<String, dynamic>>{};
    for (final contact in contacts) {
      settingsMap[contact.hashId] = {
        'notificationsEnabled': contact.notificationsEnabled,
        'callNotificationsEnabled': contact.callNotificationsEnabled,
        'mutedUntil': contact.mutedUntil?.toIso8601String(),
      };
    }

    // Sync to SharedPreferences (for Android background handler)
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('contact_notif_settings', jsonEncode(settingsMap));
    });

    // Sync to iOS UserDefaults (for NSE)
    NotificationPreferencesSync.syncContactNotificationSettings(settingsMap);
  }

  /// Sync contact call data to SharedPreferences for early audio connect.
  /// Saves crypto/mailbox data needed by EarlyCallConnectService to connect
  /// LiveKit before the PIN screen (audio only, no Hive access).
  void _syncContactCallDataForEarlyConnect() {
    final contacts = ref.read(contactsProvider);
    if (contacts.isEmpty) return;

    final callDataMap = <String, Map<String, String>>{};
    for (final contact in contacts) {
      if (contact.mailboxToken == null || contact.mailboxToken!.isEmpty) continue;
      if (contact.identityPublicKey == null || contact.identityPublicKey!.isEmpty) continue;
      callDataMap[contact.hashId] = {
        'odid': contact.odid,
        if (contact.identityPublicKey != null)
          'identityPublicKey': contact.identityPublicKey!,
        if (contact.mailboxToken != null)
          'mailboxToken': contact.mailboxToken!,
        if (contact.sendToken != null)
          'sendToken': contact.sendToken!,
        if (contact.sealedSenderPublicKey != null)
          'sealedSenderPublicKey': contact.sealedSenderPublicKey!,
      };
    }
    NotificationService().syncContactCallDataToSharedPrefs(callDataMap);
  }

  /// Setup realtime contact request syncing
  void _setupContactRequestSync() {
    final isGhostMode = ref.read(isGhostModeProvider);
    if (isGhostMode) return;

    // Defer to avoid modifying provider state during widget tree building
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      // Wire up the global banner callback before starting to listen
      ref.read(contactRequestsProvider.notifier).setOnNewRequest((request) {
        if (mounted) {
          ref.read(latestIncomingRequestProvider.notifier).state = request;
        }
      });
      // Start listening for contact requests (Realtime)
      ref.read(contactRequestsProvider.notifier).startListening();
    });
  }

  /// Vérifie le SPKI certificate pin au startup (détection MITM).
  Future<void> _verifyCertificatePin() async {
    final pinOk = await PinnedHttpClient.verifyCertificatePin();
    if (!pinOk) {
      debugPrint('[HomeScreen] Certificate pin verification FAILED — possible MITM');
    }
  }

  /// Vérifie que la session n'a pas été invalidée par un transfert ou
  /// que le compte existe toujours côté serveur.
  Future<void> _checkSessionValidity() async {
    // Vérification du transfert de session via guardedCall
    await guardedCall(() async {
      // Appel léger pour vérifier la session
      final edgeFunctions = ref.read(edgeFunctionServiceProvider);

      // Premier appel : si succès, la session est valide → on sort
      try {
        await edgeFunctions.call('get-pending-requests');
        return;
      } catch (e) {
        if (e is EdgeFunctionException && e.isSessionTransferred) {
          rethrow; // Laisser guardedCall gérer le transfert
        }
        if (_isUserNotFoundError(e)) {
          _onUserNotFoundError();
        } else {
          return; // Erreur réseau ou autre, on ignore
        }
      }

      // Premier appel a échoué avec "user not found".
      // Confirmation avec un deuxième appel indépendant.
      try {
        await edgeFunctions.call('get-sent-requests');
        return; // Succès → fausse alerte
      } catch (e) {
        if (e is EdgeFunctionException && e.isSessionTransferred) {
          rethrow;
        }
        if (_isUserNotFoundError(e)) {
          _onUserNotFoundError(); // Count atteint ≥2 → affiche le dialogue
        }
      }
    });
  }

  /// Called when an EdgeFunctionException with "Utilisateur non trouvé" is caught.
  /// After 2+ such errors from different calls, sets the global alert and shows a dialog.
  void _onUserNotFoundError() {
    _userNotFoundCount++;
    if (_userNotFoundCount >= 2 && !_userNotFoundDialogShown && mounted) {
      _userNotFoundDialogShown = true;
      ref.read(accountNotFoundProvider.notifier).state = true;
      _showAccountNotFoundDialog();
    }
  }

  /// Check if an error is a "user not found" 401 from the server.
  bool _isUserNotFoundError(Object error) {
    return error is EdgeFunctionException &&
        error.statusCode == 401 &&
        error.message.contains('non trouvé');
  }

  /// Shows the account-not-found dialog.
  /// Can also be called from settings alert banner via a public static helper.
  Future<void> _showAccountNotFoundDialog() async {
    final result = await showAccountNotFoundDialog(
      context,
      onRetry: () async {
        try {
          // Double-check avec deux endpoints indépendants
          final edgeFunctions = ref.read(edgeFunctionServiceProvider);
          await edgeFunctions.call('get-pending-requests');
          await edgeFunctions.call('get-sent-requests');
          return true; // Compte retrouvé
        } catch (_) {
          return false; // Toujours introuvable
        }
      },
    );
    if (!mounted) return;

    switch (result) {
      case 'create':
        // Full cleanup: secure storage + local data + provider state
        final secureStorage = ref.read(secureStorageProvider);
        final localStorage = ref.read(localStorageProvider);
        try {
          await Supabase.instance.client.auth.signOut();
        } catch (e) {
          debugPrint('[HomeScreen] Sign out during account reset failed: $e');
        }
        await localStorage.deleteAllData();
        await secureStorage.deleteAll();
        clearAllProviderState(ref);
        if (mounted) {
          context.go(AppRoutes.onboarding);
        }
        break;
      case 'retry':
        // Reset counter + alert, re-check session
        _userNotFoundCount = 0;
        _userNotFoundDialogShown = false;
        ref.read(accountNotFoundProvider.notifier).state = false;
        _checkSessionValidity();
        break;
      default:
        // 'close' or dismissed — keep the alert badge active
        break;
    }
  }

  void _copyToClipboard(String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    showHashSnackBar(context, message: message, type: HashSnackBarType.success, duration: const Duration(seconds: 1));
  }

  void _shareInviteLink() {
    final l10n = AppLocalizations.of(context)!;
    final box = context.findRenderObject() as RenderBox?;
    final sharePosition = box != null
        ? box.localToGlobal(Offset.zero) & box.size
        : Rect.fromCenter(center: const Offset(200, 400), width: 100, height: 100);

    Share.share(
      l10n.shareMessage,
      sharePositionOrigin: sharePosition,
    );
  }

  void _setupMessageListener() {
    // En mode fantôme, ne pas écouter les messages du serveur
    final isGhostMode = ref.read(isGhostModeProvider);
    if (isGhostMode) {
      debugPrint('[HomeScreen] Ghost mode - skipping message listener');
      return;
    }

    final user = ref.read(currentUserProvider);
    debugPrint('[HomeScreen] _setupMessageListener: user=${user?.id}');

    // Legacy listener supprimé : le système sealed mailbox gère tous les messages

    // === Sealed Sender Mailbox Realtime ===
    // Don't depend on currentUserProvider - use Supabase session directly
    _setupSealedMailboxRealtime();
  }

  /// Initialize the Signal Protocol (Double Ratchet) service.
  /// Uses the same Hive cipher as LocalStorageService for encrypted stores.
  Future<void> _initializeSignalProtocol() async {
    try {
      final localStorage = ref.read(localStorageProvider);
      final signalService = ref.read(signalProtocolServiceProvider);
      await signalService.initialize(localStorage.cipher);
      debugPrint('[HomeScreen] SignalProtocol initialized: ${signalService.isInitialized}');

      if (!signalService.isInitialized) return;

      // Check if signed prekey is actually present in the store (not just a flag).
      // This handles: first launch, corrupted stores, or previous failed import.
      final hasKey = await signalService.hasSignedPreKey(1);
      if (!hasKey) {
        debugPrint('[HomeScreen] Signed prekey missing from store — importing');
        final secureStorage = ref.read(secureStorageProvider);
        await _importPrekeysToSignalStore(signalService, secureStorage);
      } else {
        debugPrint('[HomeScreen] Signed prekey already in store');
      }

      // Initialize DR sessions for existing contacts that don't have one yet.
      // This handles contacts added before the DR code was deployed.
      await _initializeSessionsForExistingContacts(signalService);
    } catch (e) {
      debugPrint('[HomeScreen] Failed to initialize SignalProtocol: $e');
    }
  }

  /// Create DR sessions for contacts that were added before DR was deployed.
  Future<void> _initializeSessionsForExistingContacts(
    SignalProtocolService signalService,
  ) async {
    final contacts = ref.read(contactsProvider);
    int created = 0;
    for (final contact in contacts) {
      if (contact.identityPublicKey == null ||
          contact.identityPublicKey!.isEmpty) continue;

      final hasSession = await signalService.hasSession(contact.odid);
      if (hasSession) continue;

      // Try to build a session from the contact's stored prekey data
      // We need: identityPublicKey + signedPrekeyPublic + signedPrekeySignature + signedPrekeyId
      // These are stored on the Contact model if they were exchanged
      // For older contacts, we may only have identityPublicKey — skip those
      // The session will be created when we receive a PreKeySignalMessage from them
      debugPrint('[HomeScreen] No DR session for ${contact.hashId} — will be created on first message');
      created++;
    }
    if (created > 0) {
      debugPrint('[HomeScreen] $created contacts without DR sessions (will init on message exchange)');
    }
  }

  /// Import prekeys from SecureStorage into the Signal Protocol stores.
  /// This is needed on first launch because the cipher isn't available during registration.
  Future<void> _importPrekeysToSignalStore(
    SignalProtocolService signalService,
    SecureStorageService secureStorage,
  ) async {
    try {
      final identityPrivateB64 = await secureStorage.getIdentityPrivateKey();
      if (identityPrivateB64 == null) {
        debugPrint('[HomeScreen] No identity private key in SecureStorage — cannot import prekeys');
        return;
      }
      debugPrint('[HomeScreen] Identity private key found (${base64Decode(identityPrivateB64).length} bytes)');

      final identityKeyPair = signal.generateIdentityKeyPairFromPrivate(
        base64Decode(identityPrivateB64),
      );
      debugPrint('[HomeScreen] Identity key pair reconstructed');

      // Import signed prekey
      final signedPrekeyPrivateB64 = await secureStorage.getSignedPrekeyPrivate();
      final signedPrekeyPublicB64 = await secureStorage.getSignedPrekeyPublic();
      debugPrint('[HomeScreen] Signed prekey private: ${signedPrekeyPrivateB64 != null ? "found" : "MISSING"}, public: ${signedPrekeyPublicB64 != null ? "found" : "MISSING"}');
      if (signedPrekeyPrivateB64 != null && signedPrekeyPublicB64 != null) {
        final privateKey = signal.Curve.decodePrivatePoint(
          Uint8List.fromList(base64Decode(signedPrekeyPrivateB64)),
        );
        final publicKey = signal.Curve.decodePoint(
          Uint8List.fromList([0x05, ...base64Decode(signedPrekeyPublicB64)]),
          0,
        );
        final signature = signal.Curve.calculateSignature(
          identityKeyPair.getPrivateKey(),
          publicKey.serialize(),
        );
        final signedPreKeyRecord = signal.SignedPreKeyRecord(
          1,
          Int64(DateTime.now().millisecondsSinceEpoch),
          signal.ECKeyPair(publicKey, privateKey),
          signature,
        );
        await signalService.storeSignedPreKey(signedPreKeyRecord);
        debugPrint('[HomeScreen] Signed prekey imported successfully (id=1)');
      } else {
        debugPrint('[HomeScreen] WARNING: Cannot import signed prekey — keys missing from SecureStorage');
      }

      // Import one-time prekeys
      for (int i = 1; i <= 20; i++) {
        final prekeyPrivateB64 = await secureStorage.read('prekey_private_$i');
        if (prekeyPrivateB64 != null) {
          final privateKey = signal.Curve.decodePrivatePoint(
            Uint8List.fromList(base64Decode(prekeyPrivateB64)),
          );
          final keyPair = signal.Curve.generateKeyPairFromPrivate(
            privateKey.serialize().toList(),
          );
          final preKeyRecord = signal.PreKeyRecord(i, keyPair);
          await signalService.storePreKeys([preKeyRecord]);
        }
      }

      debugPrint('[HomeScreen] Prekeys imported to Signal Protocol stores');
    } catch (e) {
      debugPrint('[HomeScreen] Failed to import prekeys: $e');
    }
  }

  /// Setup Realtime for sealed sender messages (Zero-Knowledge mode)
  void _setupSealedMailboxRealtime() {
    debugPrint('[HomeScreen] _setupSealedMailboxRealtime: Starting...');
    final mailboxService = ref.read(anonymousMailboxServiceProvider);

    // Brancher tous les callbacks AVANT l'appel async pour qu'ils soient
    // disponibles même si initializeMailbox() échoue (502) et que
    // notifyConnectionFailed() → onConnectionStatusChanged soit appelé.
    mailboxService.onConnectionStatusChanged = (isConnected) {
      if (!mounted) return;
      ref.read(realtimeConnectedProvider.notifier).state = isConnected;
      final sendQueue = ref.read(messageSendQueueServiceProvider);
      if (isConnected) {
        sendQueue.resume();
      } else {
        sendQueue.pause();
      }
    };

    mailboxService.onMessagesReceived = (messages) async {
      debugPrint('[HomeScreen] onMessagesReceived callback triggered with ${messages.length} messages');
      return await _processReceivedSealedMessages(messages);
    };

    mailboxService.onCallSignalsReceived = (signals) {
      debugPrint('[HomeScreen] onCallSignalsReceived callback triggered with ${signals.length} signals');
      _processReceivedCallSignals(signals);
    };

    // Initialize mailbox (HTTP) puis démarrer le WebSocket
    mailboxService.initializeMailbox().then((success) async {
      debugPrint('[HomeScreen] initializeMailbox completed: success=$success');
      if (!success) {
        debugPrint('[HomeScreen] Failed to initialize mailbox - scheduling reconnect...');
        // Affiche la bannière + lance la boucle de reconnexion avec backoff
        mailboxService.notifyConnectionFailed();
        return;
      }

      // Initialize notification relay for push notifications (Zero-Knowledge)
      final fcmToken = NotificationService().fcmToken;
      if (fcmToken != null) {
        final relaySuccess = await mailboxService.initializeNotificationRelay(
          pushToken: fcmToken,
          platform: NotificationService().platform,
        );
        debugPrint('[HomeScreen] initializeNotificationRelay: $relaySuccess');
      } else {
        debugPrint('[HomeScreen] No FCM token available, skipping relay registration');
      }

      // Start Realtime (WebSocket push instead of polling)
      mailboxService.startRealtime();

      debugPrint('[HomeScreen] Sealed mailbox Realtime started successfully');
    }).catchError((e) {
      debugPrint('[HomeScreen] Error initializing mailbox: $e');
      mailboxService.notifyConnectionFailed();
    });
  }

  /// Process received sealed messages and update UI.
  /// Returns the list of message IDs that were successfully saved locally.
  Future<List<String>> _processReceivedSealedMessages(List<ReceivedSealedMessage> messages) async {
    final savedIds = <String>[];
    if (!mounted) return savedIds;

    debugPrint('[HomeScreen] Processing ${messages.length} sealed messages');

    final contacts = ref.read(contactsProvider);
    final messageRepo = ref.read(messageRepositoryProvider);
    final localStorage = ref.read(localStorageProvider);

    for (final sealedMsg in messages) {
      try {
        debugPrint('[HomeScreen] Message from senderIdentityKey: ${sealedMsg.senderIdentityKey.substring(0, 20)}...');
        debugPrint('[HomeScreen] Looking in ${contacts.length} contacts');

        // Pre-check: is this a "contact_accepted" system signal?
        // Must be checked BEFORE contact matching because the sender isn't a contact yet.
        try {
          final preCheckJson = jsonDecode(utf8.decode(sealedMsg.content));
          final preCheckType = preCheckJson['type'] as String?;
          if (preCheckType == 'contact_accepted') {
            final acceptorData = preCheckJson['acceptor'] as Map<String, dynamic>?;
            final sendTokenForRequester = preCheckJson['send_token_for_requester'] as String?;
            final requestId = preCheckJson['request_id'] as String?;

            if (acceptorData != null && sendTokenForRequester != null && requestId != null) {
              // Enriched payload: create contact directly from sealed message data
              debugPrint('[HomeScreen] Received enriched contact_accepted signal — processing locally');
              ref.read(contactSyncProvider).processAcceptedFromSealedMessage(
                acceptorData: acceptorData,
                sendTokenForRequester: sendTokenForRequester,
                requestId: requestId,
              );
            } else {
              // Fallback for old clients without enriched payload
              debugPrint('[HomeScreen] Received legacy contact_accepted signal — fetching from server');
              ref.read(contactRequestsProvider.notifier).fetchAcceptedRequests();
            }
            savedIds.add(sealedMsg.messageId);
            continue;
          }
        } catch (_) {
          // Not a system signal, continue with normal message processing
        }

        // Debug: print all contact identity keys
        for (final c in contacts) {
          debugPrint('[HomeScreen] Contact ${c.hashId}: identityKey=${c.identityPublicKey?.substring(0, 20) ?? "NULL"}...');
        }

        // Find the contact by their identity public key
        Contact? matchedContact;
        for (final c in contacts) {
          if (c.identityPublicKey == sealedMsg.senderIdentityKey) {
            matchedContact = c;
            break;
          }
        }

        if (matchedContact == null) {
          sealedMsg.retryCount++;
          if (sealedMsg.retryCount <= 3) {
            debugPrint('[HomeScreen] Contact not found for sender ${sealedMsg.senderIdentityKey.substring(0, 20)}..., queuing for retry (${sealedMsg.retryCount}/3)');
            _pendingSealedMessages.add(sealedMsg);
          } else {
            debugPrint('[HomeScreen] Dropping message from unknown sender ${sealedMsg.senderIdentityKey.substring(0, 20)}... after 3 retries');
          }
          continue;
        }

        // Re-read contact fresh from Hive to avoid stale/detached HiveObject references
        // when processing multiple messages in a batch (previous iteration may have saved a new copy)
        final contact = await localStorage.getContact(matchedContact.odid) ?? matchedContact;

        // Decode the message content — unwrap Double Ratchet if present
        Map<String, dynamic> contentJson;
        bool drDecryptionFailed = false;
        final outerJson = jsonDecode(utf8.decode(sealedMsg.content));
        if (outerJson.containsKey('dr_type') && outerJson.containsKey('dr_ciphertext')) {
          // Double Ratchet envelope — decrypt inner layer
          final signalService = ref.read(signalProtocolServiceProvider);
          if (signalService.isInitialized) {
            try {
              final drType = outerJson['dr_type'] as int;
              final drCiphertext = base64Decode(outerJson['dr_ciphertext'] as String);
              final plaintext = await signalService.decryptMessage(
                contact.odid, drType, drCiphertext,
              );
              contentJson = jsonDecode(utf8.decode(plaintext)) as Map<String, dynamic>;
            } catch (e) {
              debugPrint('[HomeScreen] DR decryption failed for ${contact.hashId}: $e');
              // Duplicate messages (old counter) should be silently dropped
              if (e.toString().contains('DuplicateMessage') || e.toString().contains('old counter')) {
                debugPrint('[HomeScreen] Dropping duplicate message for ${contact.hashId}');
                savedIds.add(sealedMsg.messageId); // Safe to delete from server
                continue;
              }
              if (signalService.shouldAutoResetSession(contact.odid)) {
                debugPrint('[HomeScreen] Auto-resetting DR session for ${contact.odid}');
                await signalService.resetSession(contact.odid);
              }
              // Don't drop the message — show it as undecryptable
              drDecryptionFailed = true;
              contentJson = {'type': 'text', 'content': '', 'timestamp': DateTime.now().toIso8601String()};
            }
          } else {
            debugPrint('[HomeScreen] DR envelope received but SignalProtocol not initialized');
            drDecryptionFailed = true;
            contentJson = {'type': 'text', 'content': '', 'timestamp': DateTime.now().toIso8601String()};
          }
        } else {
          // Plain message (no DR) — backward-compatible
          contentJson = outerJson as Map<String, dynamic>;
        }
        final typeStr = contentJson['type'] as String;

        // Anti-replay: verify message counter (window-based like Signal)
        final messageCounter = contentJson['counter'] as int?;
        if (messageCounter != null) {
          final replayCheck = await _checkAntiReplay(contact, messageCounter);
          if (!replayCheck) {
            debugPrint('[HomeScreen] Anti-replay: rejecting message with counter $messageCounter');
            savedIds.add(sealedMsg.messageId); // Replay — safe to delete from server
            continue;
          }
        }

        // Traiter les accusés de réception/lecture (messages invisibles)
        if (typeStr == 'delivery_receipt' || typeStr == 'read_receipt' || typeStr == 'silent_read') {
          await _processReceipt(contact, typeStr, contentJson);
          savedIds.add(sealedMsg.messageId);
          continue;
        }

        // Traiter les événements d'appel
        if (typeStr == 'call_event') {
          await _processCallEvent(contact, contentJson);
          savedIds.add(sealedMsg.messageId);
          continue;
        }

        // Traiter les session resets (clés Signal corrompues/désynchronisées)
        if (typeStr == 'session_reset') {
          await _processSessionReset(contact, contentJson);
          savedIds.add(sealedMsg.messageId);
          continue;
        }

        // Traiter les demandes de suppression à distance
        if (typeStr == 'delete_message') {
          await _processRemoteDelete(contact, contentJson);
          savedIds.add(sealedMsg.messageId);
          continue;
        }

        // Traiter la notification de suppression de compte
        if (typeStr == 'account_deleted') {
          await _processAccountDeleted(contact);
          savedIds.add(sealedMsg.messageId);
          continue;
        }

        final messageType = MessageType.values.firstWhere(
          (t) => t.name == typeStr,
          orElse: () => MessageType.text,
        );
        final messageContent = contentJson['content'] as String;

        // Parse media metadata if present
        final mediaData = contentJson['media'] as Map<String, dynamic>?;
        String? mediaFileId;
        String? mediaEncKey;
        String? mediaEncIv;
        String? mediaThumbnail;
        String? mediaMimeType;
        String? mediaName;
        int? mediaSizeBytes;
        int? mediaDurationSeconds;
        bool isViewOnce = false;
        int? viewOnceDuration;
        bool mediaDownloadable = false;
        int? mediaDownloadStatus;

        int? mediaWidth;
        int? mediaHeight;

        if (mediaData != null) {
          mediaFileId = mediaData['fileId'] as String?;
          mediaEncKey = mediaData['key'] as String?;
          mediaEncIv = mediaData['iv'] as String?;
          mediaThumbnail = mediaData['thumbnail'] as String?;
          mediaMimeType = mediaData['mimeType'] as String?;
          mediaName = mediaData['fileName'] as String?;
          mediaSizeBytes = mediaData['fileSize'] as int?;
          mediaDurationSeconds = mediaData['duration'] as int?;
          mediaWidth = mediaData['width'] as int?;
          mediaHeight = mediaData['height'] as int?;
          isViewOnce = mediaData['isViewOnce'] as bool? ?? false;
          viewOnceDuration = mediaData['viewOnceDuration'] as int?;
          mediaDownloadable = mediaData['downloadable'] as bool? ?? false;
          mediaDownloadStatus = 0; // pending download
          debugPrint('[HomeScreen] Media received: width=$mediaWidth, height=$mediaHeight, thumbnail=${mediaThumbnail != null ? '${mediaThumbnail.length} chars' : 'null'}, mime=$mediaMimeType');
        }

        // Create local message
        final message = Message(
          id: sealedMsg.messageId,
          contactId: contact.odid,
          isOutgoing: false,
          type: messageType,
          content: messageContent,
          timestamp: sealedMsg.timestamp,
          status: MessageStatus.delivered,
          mediaFileId: mediaFileId,
          mediaEncKey: mediaEncKey,
          mediaEncIv: mediaEncIv,
          mediaThumbnail: mediaThumbnail,
          mediaMimeType: mediaMimeType,
          mediaName: mediaName,
          mediaSizeBytes: mediaSizeBytes,
          mediaDurationSeconds: mediaDurationSeconds,
          isViewOnce: isViewOnce,
          viewOnceDuration: viewOnceDuration,
          mediaDownloadable: mediaDownloadable,
          mediaDownloadStatus: mediaDownloadStatus,
          mediaWidth: mediaWidth,
          mediaHeight: mediaHeight,
          maxExpiresAt: DateTime.now().add(const Duration(hours: 24)),
        );

        // Save to local storage (skip contact preview update — done manually below)
        await messageRepo.saveMessageLocally(message, updateContactPreview: false);

        // CRITICAL: Mark as successfully saved — server deletion is now safe
        savedIds.add(sealedMsg.messageId);

        // Auto-download média si présent
        if (mediaFileId != null && mediaEncKey != null && mediaEncIv != null) {
          final downloadQueue = ref.read(mediaDownloadQueueServiceProvider);
          downloadQueue.enqueueDownload(message);
        }

        // Envoyer l'accusé de réception (toujours, non configurable)
        _sendDeliveryReceipt(contact, [sealedMsg.messageId]);

        // Appliquer un early receipt si ce message avait un receipt en cache
        await _applyEarlyReceipt(sealedMsg.messageId, contact);

        // Déclencheur implicite : un message reçu = tous les messages envoyés sont considérés lus
        await _triggerImplicitReadForSentMessages(contact);

        // Generate last message preview based on type
        String lastMessagePreview;
        if (messageType == MessageType.text) {
          lastMessagePreview = messageContent.length > 50
              ? '${messageContent.substring(0, 50)}...'
              : messageContent;
        } else if (mediaData != null) {
          switch (messageType) {
            case MessageType.image:
              lastMessagePreview = '\u{1F4F7} Photo';
              break;
            case MessageType.video:
              lastMessagePreview = '\u{1F3AC} Vidéo';
              break;
            case MessageType.voice:
              lastMessagePreview = '\u{1F3A4} Message vocal';
              break;
            case MessageType.file:
              lastMessagePreview = '\u{1F4CE} Fichier';
              break;
            default:
              lastMessagePreview = '[${messageType.name}]';
          }
        } else {
          lastMessagePreview = '[${messageType.name}]';
        }

        // Update contact's last message
        final updatedContact = contact.copyWith(
          lastMessageAt: sealedMsg.timestamp,
          lastMessagePreview: lastMessagePreview,
          unreadCount: contact.unreadCount + 1,
        );
        await localStorage.saveContact(updatedContact);

        // Mark this message as processed (for background handler coordination)
        // This prevents the background handler from showing a duplicate notification
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('last_processed_message_timestamp', sealedMsg.timestamp.toIso8601String());
        debugPrint('[HomeScreen] Marked message as processed: ${sealedMsg.timestamp.toIso8601String()}');

        // Handle in-app notification based on context
        final settings = ref.read(appSettingsProvider);
        final currentChatContactId = ref.read(currentChatContactIdProvider);
        final isViewingThisChat = currentChatContactId == contact.odid;

        debugPrint('[HomeScreen] Notification check: enabled=${settings.messageNotificationsEnabled}, contactEnabled=${contact.notificationsEnabled}, muted=${contact.isMuted}, isViewingChat=$isViewingThisChat');

        if (settings.messageNotificationsEnabled && contact.notificationsEnabled && !contact.isMuted) {
          if (isViewingThisChat) {
            // User is in the chat with this contact → vibration + sound
            debugPrint('[HomeScreen] User in chat - vibrating');
            if (settings.vibrationEnabled) {
              HapticFeedback.heavyImpact();
            }
          } else {
            // User is elsewhere in the app → play receive sound + show in-app banner
            if (settings.receiveSoundEnabled) {
              ref.read(uiSoundServiceProvider).playReceiveSound();
            }

            // Don't show banner when user is on the Chat tab (they already see conversations)
            final currentTab = ref.read(currentTabIndexProvider);
            if (currentTab != 0) {
              debugPrint('[HomeScreen] User elsewhere in app - showing banner');
              final preview = settings.hideMessagePreviews
                  ? 'Message'
                  : (messageType == MessageType.text ? messageContent : 'Nouveau message');
              _showInAppNotification(
                contact: contact,
                messagePreview: preview,
              );
            } else {
              debugPrint('[HomeScreen] User on Chat tab - skipping banner');
            }
          }
        } else {
          debugPrint('[HomeScreen] Notification skipped due to settings');
        }

        debugPrint('[HomeScreen] Received sealed message from ${contact.hashId}');
      } catch (e) {
        debugPrint('[HomeScreen] Error processing sealed message: $e');
      }
    }

    // Refresh contacts to update UI (also triggers retry of pending messages via listener)
    if (mounted) {
      ref.read(contactsProvider.notifier).refresh();
      // Re-sync contact names for background CallKit notifications
      _syncContactNamesForCallKit();
      // Re-sync per-contact notification settings for background handlers
      _syncContactNotificationSettings();
      // Re-sync contact call data for early audio connect
      _syncContactCallDataForEarlyConnect();
    }

    return savedIds;
  }

  /// Retry pending messages that were received before contacts were loaded
  void _retryPendingMessages() async {
    if (_pendingSealedMessages.isEmpty) return;
    debugPrint('[HomeScreen] Retrying ${_pendingSealedMessages.length} pending messages');
    final toRetry = List<ReceivedSealedMessage>.from(_pendingSealedMessages);
    _pendingSealedMessages.clear();
    final savedIds = await _processReceivedSealedMessages(toRetry);

    // Delete successfully processed messages from server
    if (savedIds.isNotEmpty) {
      for (final id in savedIds) {
        try {
          await Supabase.instance.client
              .from('sealed_messages')
              .delete()
              .eq('id', id);
        } catch (e) {
          debugPrint('[HomeScreen] Retry: failed to delete message $id from server: $e');
        }
      }
    }
  }

  /// Envoie un accusé de réception (delivery receipt) via la queue persistante
  Future<void> _sendDeliveryReceipt(Contact contact, List<String> messageIds) async {
    if (contact.mailboxToken == null || contact.sealedSenderPublicKey == null) return;

    try {
      final receiptQueue = ref.read(receiptQueueServiceProvider);
      await receiptQueue.enqueueReceipt(
        contactId: contact.odid,
        receiptType: 'delivery_receipt',
        messageIds: messageIds,
        contact: contact,
      );
    } catch (e) {
      debugPrint('[HomeScreen] Error enqueuing delivery receipt: $e');
    }
  }

  // Anti-replay: sliding window check (inspired by Signal Protocol)
  // - Accepts out-of-order messages within window
  // - Rejects duplicates and messages too far ahead
  static const int _maxForwardJump = 25000;
  static const int _replayWindowSize = 2000;
  // Per-contact sets of received counters within the window (in-memory, backed by Hive lastReceivedCounter)
  final Map<String, Set<int>> _receivedCounters = {};

  Future<bool> _checkAntiReplay(Contact contact, int counter) async {
    final highWaterMark = contact.lastReceivedCounter;

    // Reject if counter is too far ahead (likely corrupted or attack)
    if (counter > highWaterMark + _maxForwardJump) {
      debugPrint('[AntiReplay] Counter $counter too far ahead of $highWaterMark (max jump $_maxForwardJump)');
      return false;
    }

    // Get or create the received set for this contact
    final key = contact.odid;
    _receivedCounters[key] ??= {};
    final received = _receivedCounters[key]!;

    // If counter is within the window below high water mark, check for duplicate
    if (counter <= highWaterMark) {
      if (received.contains(counter)) {
        debugPrint('[AntiReplay] Duplicate counter $counter for ${contact.hashId}');
        return false; // Already received this counter = replay
      }
      // Out-of-order but not duplicate: accept it
      received.add(counter);
      debugPrint('[AntiReplay] Out-of-order counter $counter accepted (high=$highWaterMark)');
      return true;
    }

    // Counter is ahead: advance high water mark and accept
    // Mark all counters between old high and new as "skipped" (except the current one)
    received.add(counter);
    contact.lastReceivedCounter = counter;
    final localStorage = ref.read(localStorageProvider);
    await localStorage.saveContact(contact);

    // Prune old counters outside the window to prevent unbounded growth
    if (received.length > _replayWindowSize) {
      final cutoff = counter - _replayWindowSize;
      received.removeWhere((c) => c < cutoff);
    }

    return true;
  }

  /// Traite un accusé de réception ou confirmation de lecture
  /// - read_receipt : met à jour le statut visible + démarre le timer éphémère
  /// - silent_read : NE MET PAS à jour le statut visible, MAIS démarre le timer éphémère
  /// - delivery_receipt : met à jour le statut + démarre le timer éphémère (déclencheur implicite)
  Future<void> _processReceipt(Contact contact, String type, Map<String, dynamic> data) async {
    final messageRepo = ref.read(messageRepositoryProvider);
    final settings = ref.read(appSettingsProvider);
    final messageIds = (data['messageIds'] as List?)?.cast<String>() ?? [];

    // Déterminer le nouveau statut visible
    MessageStatus? newStatus;
    if (type == 'read_receipt') {
      newStatus = MessageStatus.read;
    } else if (type == 'delivery_receipt') {
      newStatus = MessageStatus.delivered;
    }
    // silent_read → pas de changement de statut visible

    final ephemeralDuration = contact.ephemeralDuration ?? settings.defaultEphemeralDuration;
    final now = DateTime.now();

    for (final msgId in messageIds) {
      try {
        final message = await messageRepo.getMessageById(msgId);
        if (message == null) {
          // Early receipt: message pas encore arrivé, cacher pour plus tard
          _cacheEarlyReceipt(msgId, type, contact.odid);
          continue;
        }

        // Mettre à jour le statut si applicable (jamais régresser)
        if (newStatus != null && _isStatusProgression(message.status, newStatus)) {
          await messageRepo.updateMessageStatus(msgId, newStatus);
        }

        // Démarrer le timer éphémère pour les messages envoyés
        if (message.isOutgoing && message.expiresAt == null) {
          if (ephemeralDuration == 0) {
            final currentChatContactId = ref.read(currentChatContactIdProvider);
            if (currentChatContactId != contact.odid) {
              await messageRepo.deleteMessageLocally(msgId);
            }
            // Sinon : _handleEphemeralMessagesOnPause() s'en charge à la sortie du chat
          } else {
            message.expiresAt = now.add(Duration(seconds: ephemeralDuration));
            await messageRepo.saveMessageLocally(message);
          }
        }
      } catch (e) {
        debugPrint('[HomeScreen] Error updating receipt for $msgId: $e');
      }
    }

    // Mettre à jour le preview si des messages ont été supprimés en mode 0
    if (ephemeralDuration == 0) {
      final currentChatContactId = ref.read(currentChatContactIdProvider);
      if (currentChatContactId != contact.odid) {
        final remaining = await messageRepo.getMessagesForContact(contact.odid);
        if (remaining.isEmpty) {
          final localStorage = ref.read(localStorageProvider);
          contact.lastMessagePreview = null;
          contact.unreadCount = 0;
          await localStorage.saveContact(contact);
          ref.read(contactsProvider.notifier).refresh();
        }
      }
    }

    debugPrint('[HomeScreen] Processed $type for ${messageIds.length} messages from ${contact.hashId}');
  }

  /// Vérifie que le nouveau statut est une progression (pas une régression)
  bool _isStatusProgression(MessageStatus current, MessageStatus next) {
    const progression = [
      MessageStatus.queued,
      MessageStatus.sending,
      MessageStatus.sent,
      MessageStatus.delivered,
      MessageStatus.read,
    ];
    final currentIndex = progression.indexOf(current);
    final nextIndex = progression.indexOf(next);
    // Si le statut n'est pas dans la progression (ex: failed), on autorise
    if (currentIndex == -1 || nextIndex == -1) return true;
    return nextIndex > currentIndex;
  }

  /// Cache un early receipt (receipt arrivé avant son message)
  void _cacheEarlyReceipt(String messageId, String type, String contactId) {
    // Nettoyer les entrées expirées (>1h)
    final cutoff = DateTime.now().subtract(const Duration(hours: 1));
    _earlyReceiptCache.removeWhere((_, v) => v.cachedAt.isBefore(cutoff));

    _earlyReceiptCache[messageId] = _PendingReceipt(
      type: type,
      contactId: contactId,
      timestamp: DateTime.now(),
    );
    debugPrint('[HomeScreen] Cached early receipt ($type) for message $messageId');
  }

  /// Applique les early receipts pour un message nouvellement reçu
  Future<void> _applyEarlyReceipt(String messageId, Contact contact) async {
    final pending = _earlyReceiptCache.remove(messageId);
    if (pending == null) return;

    debugPrint('[HomeScreen] Applying early receipt (${pending.type}) for message $messageId');
    await _processReceipt(contact, pending.type, {
      'messageIds': [messageId],
    });
  }

  /// Déclencheur implicite : quand on reçoit un message d'un contact,
  /// tous les messages envoyés non-expirés de cette conversation sont considérés lus
  Future<void> _triggerImplicitReadForSentMessages(Contact contact) async {
    try {
      final messageRepo = ref.read(messageRepositoryProvider);
      final settings = ref.read(appSettingsProvider);
      final ephemeralDuration = contact.ephemeralDuration ?? settings.defaultEphemeralDuration;
      final now = DateTime.now();

      final messages = await messageRepo.getMessagesForContact(contact.odid);
      for (final message in messages) {
        if (message.isOutgoing && message.expiresAt == null && message.ephemeralRemainingSeconds == null) {
          if (ephemeralDuration == 0) {
            final currentChatContactId = ref.read(currentChatContactIdProvider);
            if (currentChatContactId != contact.odid) {
              await messageRepo.deleteMessageLocally(message.id);
            }
            // Sinon : _handleEphemeralMessagesOnPause() s'en charge à la sortie du chat
          } else {
            message.expiresAt = now.add(Duration(seconds: ephemeralDuration));
            await messageRepo.saveMessageLocally(message);
          }
        }
      }

      // Mettre à jour le preview si des messages ont été supprimés en mode 0
      if (ephemeralDuration == 0) {
        final currentChatContactId = ref.read(currentChatContactIdProvider);
        if (currentChatContactId != contact.odid) {
          final remaining = await messageRepo.getMessagesForContact(contact.odid);
          if (remaining.isEmpty) {
            final localStorage = ref.read(localStorageProvider);
            contact.lastMessagePreview = null;
            contact.lastMessageAt = null;
            contact.unreadCount = 0;
            await localStorage.saveContact(contact);
            ref.read(contactsProvider.notifier).refresh();
          }
        }
      }
    } catch (e) {
      debugPrint('[HomeScreen] Error in implicit read trigger: $e');
    }
  }

  /// Nettoyage des messages dont le fallback 24h (maxExpiresAt) est dépassé
  Future<void> _cleanupExpiredMaxMessages() async {
    try {
      final messageRepo = ref.read(messageRepositoryProvider);
      final localStorage = ref.read(localStorageProvider);
      final contacts = ref.read(contactsProvider);
      final now = DateTime.now();

      for (final contact in contacts) {
        final messages = await messageRepo.getMessagesForContact(contact.odid);
        for (final message in messages) {
          if (message.maxExpiresAt != null && message.maxExpiresAt!.isBefore(now)) {
            await messageRepo.deleteMessageLocally(message.id);
          }
        }
      }

      // Nettoyer aussi les call messages expirés
      await localStorage.cleanupExpiredCallMessages();

      debugPrint('[HomeScreen] Cleanup of expired messages done');
    } catch (e) {
      debugPrint('[HomeScreen] Error cleaning up expired messages: $e');
    }
  }

  /// Auto-nettoyage des conversations inactives depuis 7 jours (sauf épinglées)
  Future<void> _cleanupStaleConversations() async {
    try {
      final contacts = ref.read(contactsProvider);
      final localStorage = ref.read(localStorageProvider);
      final now = DateTime.now();
      bool needsRefresh = false;

      for (final contact in contacts) {
        if (contact.lastMessageAt != null &&
            !contact.isPinned &&
            now.difference(contact.lastMessageAt!).inDays >= 7) {
          contact.lastMessageAt = null;
          contact.lastMessagePreview = null;
          contact.unreadCount = 0;
          await localStorage.saveContact(contact);
          needsRefresh = true;
        }
      }

      if (needsRefresh) {
        ref.read(contactsProvider.notifier).refresh();
      }
    } catch (e) {
      debugPrint('[HomeScreen] Error cleaning stale conversations: $e');
    }
  }

  /// Reprend les téléchargements média en attente au démarrage
  Future<void> _resumePendingMediaDownloads() async {
    try {
      final downloadQueue = ref.read(mediaDownloadQueueServiceProvider);
      final contacts = ref.read(contactsProvider);
      final localStorage = ref.read(localStorageProvider);

      for (final contact in contacts) {
        final messages = await localStorage.getMessagesForContact(contact.odid);
        for (final msg in messages) {
          final dlStatus = msg.mediaDownloadStatus;
          if (dlStatus != null &&
              (dlStatus == 0 || dlStatus == 1 || dlStatus == 3) &&
              msg.mediaFileId != null &&
              msg.mediaEncKey != null &&
              msg.mediaEncIv != null) {
            downloadQueue.enqueueDownload(msg);
          }
        }
      }
    } catch (e) {
      debugPrint('[HomeScreen] Error resuming pending media downloads: $e');
    }
  }

  /// Reprend les envois de messages en attente au démarrage
  Future<void> _resumePendingSendMessages() async {
    try {
      final sendQueue = ref.read(messageSendQueueServiceProvider);
      final contacts = ref.read(contactsProvider);
      final localStorage = ref.read(localStorageProvider);

      int totalOutgoing = 0;
      int totalResumed = 0;
      for (final contact in contacts) {
        final messages = await localStorage.getMessagesForContact(contact.odid);
        for (final msg in messages) {
          if (msg.isOutgoing) {
            totalOutgoing++;
            if (msg.status == MessageStatus.sending || msg.status == MessageStatus.queued) {
              debugPrint('[SendQueue-Debug] Resuming ${msg.id} status=${msg.status} contact=${contact.odid}');
              totalResumed++;
              sendQueue.enqueueMessage(msg, contact: contact);
            } else if (msg.status == MessageStatus.failed) {
              debugPrint('[SendQueue-Debug] SKIPPED failed msg ${msg.id} contact=${contact.odid}');
            }
          }
        }
      }
      debugPrint('[SendQueue-Debug] Total outgoing=$totalOutgoing, resumed=$totalResumed');
    } catch (e) {
      debugPrint('[HomeScreen] Error resuming pending sends: $e');
    }
  }

  /// Reprend les accusés de réception en attente depuis Hive
  Future<void> _resumePendingReceipts() async {
    try {
      final receiptQueue = ref.read(receiptQueueServiceProvider);
      final contacts = ref.read(contactsProvider);
      await receiptQueue.restoreQueue(contacts);
    } catch (e) {
      debugPrint('[HomeScreen] Error resuming pending receipts: $e');
    }
  }

  /// Traite un événement d'appel reçu via sealed sender
  Future<void> _processCallEvent(Contact contact, Map<String, dynamic> data) async {
    final localStorage = ref.read(localStorageProvider);

    final callId = data['callId'] as String?;
    if (callId == null) return;

    // Déduplication : vérifier par callId exact OU par proximité temporelle
    // (les deux côtés utilisent state.callId, donc callId devrait matcher)
    final existingMessages = await localStorage.getCallMessagesForContact(contact.odid);
    final existing = existingMessages.where((m) => m.id == callId).firstOrNull;
    if (existing != null) {
      final newDuration = data['duration'] as int?;
      if (newDuration != null && newDuration > 0 && (existing.durationSeconds == null || existing.durationSeconds == 0)) {
        debugPrint('[HomeScreen] call_event $callId exists but updating with duration');
        // Update with duration info — fall through to save
      } else {
        debugPrint('[HomeScreen] call_event $callId already exists, skipping');
        return;
      }
    }

    // Fallback : déduplication par proximité temporelle (< 30s) pour le même contact
    // Couvre le cas où les callId ne matchent pas (ancienne version, etc.)
    final timestampStr = data['timestamp'] as String?;
    final timestamp = timestampStr != null ? DateTime.parse(timestampStr) : DateTime.now();
    if (existing == null) {
      final recentDuplicate = existingMessages.where((m) {
        final diff = m.timestamp.difference(timestamp).abs();
        return diff.inSeconds < 30;
      }).firstOrNull;
      if (recentDuplicate != null) {
        debugPrint('[HomeScreen] call_event $callId skipped: recent call message exists (${recentDuplicate.id})');
        return;
      }
    }

    final callTypeStr = data['callType'] as String? ?? 'audio';
    final endReasonStr = data['endReason'] as String? ?? 'missed';
    final durationSeconds = data['duration'] as int?;

    // Calculer l'expiration éphémère (contact → global)
    // Les messages d'appel sont toujours sauvegardés (même en mode éphémère 0)
    // car ce sont des métadonnées essentielles (appel manqué, durée, etc.).
    // Le nettoyage se fait à l'ouverture du chat (chat_screen).
    final settings = ref.read(appSettingsProvider);
    final ephemeralDuration = contact.ephemeralDuration ?? settings.defaultEphemeralDuration;

    DateTime? expiresAt;
    if (ephemeralDuration > 0) {
      expiresAt = DateTime.now().add(Duration(seconds: ephemeralDuration));
    }

    // Inverser la perspective : si l'expéditeur l'a marqué outgoing, c'est entrant pour nous et vice-versa
    final senderIsOutgoing = data['isOutgoing'] as bool? ?? true;
    final callMessage = CallMessage(
      id: callId,
      contactId: contact.odid,
      isOutgoing: !senderIsOutgoing,
      callTypeString: callTypeStr,
      endReasonString: endReasonStr,
      durationSeconds: durationSeconds,
      timestamp: timestamp,
      expiresAt: expiresAt,
    );

    await localStorage.saveCallMessage(callMessage);

    // Mettre à jour le contact (lastMessagePreview + unreadCount pour les manqués)
    final isMissed = endReasonStr == 'missed' || endReasonStr == 'timeout';
    final callLabel = callTypeStr == 'video' ? 'vidéo' : 'audio';
    final preview = isMissed
        ? '\u{260E} Appel $callLabel manqué'
        : '\u{260E} Appel $callLabel';

    final updatedContact = contact.copyWith(
      lastMessageAt: timestamp,
      lastMessagePreview: preview,
      unreadCount: isMissed ? contact.unreadCount + 1 : contact.unreadCount,
    );

    await localStorage.saveContact(updatedContact);

    if (mounted) {
      await ref.read(contactsProvider.notifier).refresh();
    }

    debugPrint('[HomeScreen] Processed call_event from ${contact.hashId}: $endReasonStr');
  }

  /// Process a session_reset message: the remote peer has regenerated their prekeys
  /// because decryption was failing. Update their keys locally and show a system message.
  Future<void> _processSessionReset(Contact contact, Map<String, dynamic> data) async {
    final localStorage = ref.read(localStorageProvider);

    final newIdentityKey = data['identityPublicKey'] as String?;
    final newSealedPublicKey = data['sealedSenderPublicKey'] as String?;

    if (newIdentityKey != null && newSealedPublicKey != null) {
      // Update contact's keys
      final updatedContact = contact.copyWith(
        identityPublicKey: newIdentityKey,
        sealedSenderPublicKey: newSealedPublicKey,
        lastSessionResetAt: DateTime.now(),
      );
      await localStorage.saveContact(updatedContact);

      // Clear decryption failure counter
      final sealedSender = SealedSenderService();
      sealedSender.clearDecryptionFailures(contact.identityPublicKey ?? '');

      if (mounted) {
        await ref.read(contactsProvider.notifier).refresh();
      }

      debugPrint('[HomeScreen] Session reset processed for ${contact.hashId}');
    }

    // Save a system message in the chat
    final systemMessage = Message(
      id: const Uuid().v4(),
      contactId: contact.odid,
      content: 'Session de chiffrement actualisée',
      type: MessageType.text,
      status: MessageStatus.delivered,
      isOutgoing: false,
      timestamp: DateTime.now(),
    );
    await localStorage.saveMessage(systemMessage);
  }

  /// Process a remote delete request: remove messages locally
  Future<void> _processRemoteDelete(Contact contact, Map<String, dynamic> data) async {
    final messageIds = (data['messageIds'] as List<dynamic>?)?.cast<String>();
    if (messageIds == null || messageIds.isEmpty) return;

    final messageRepo = ref.read(messageRepositoryProvider);
    final localStorage = ref.read(localStorageProvider);

    for (final msgId in messageIds) {
      // Vérifier que le message existe et appartient bien à ce contact
      final message = await localStorage.getMessage(msgId);
      if (message == null) continue;
      if (message.contactId != contact.odid) {
        debugPrint('[HomeScreen] Remote delete rejected: cross-contact mismatch for $msgId');
        continue;
      }

      await messageRepo.markAsDeletedForEveryone(msgId, name: contact.displayName);
    }

    debugPrint('[HomeScreen] Remote delete processed: ${messageIds.length} message(s) from ${contact.hashId}');
  }

  /// Process account_deleted notification — silently remove the contact.
  Future<void> _processAccountDeleted(Contact contact) async {
    debugPrint('[HomeScreen] Account deleted notification from ${contact.hashId}');
    await ref.read(contactsProvider.notifier).deleteContact(contact.odid);
  }

  /// Process received call signals and trigger incoming call UI.
  ///
  /// When the mailbox returns multiple offers (e.g. caller retried), we must
  /// select the RIGHT one — the one matching the FCM push that the user saw.
  /// Processing a stale offer from a previous attempt causes the callee to
  /// connect to the wrong LiveKit room and sends "busy" for the real call.
  Future<void> _processReceivedCallSignals(List<ReceivedCallSignal> signals) async {
    if (!mounted) return;

    debugPrint('[HomeScreen] Processing ${signals.length} call signals');

    final contacts = ref.read(contactsProvider);

    // ── Step 1: Separate offers from other signal types ──
    final offers = <ReceivedCallSignal>[];
    final others = <ReceivedCallSignal>[];
    for (final signal in signals) {
      if (signal.signalType == 'offer') {
        offers.add(signal);
      } else {
        others.add(signal);
      }
    }

    // ── Step 2: Forward non-offer signals for ALREADY ACTIVE calls ──
    // Only forward signals that match the current call (state.callId != null).
    // Signals for a not-yet-processed offer are deferred to Step 5.
    final deferredSignals = <ReceivedCallSignal>[];
    final currentCallId = ref.read(callStateProvider).callId;
    for (final signal in others) {
      try {
        final signalDataJson = utf8.decode(signal.signalData);
        final signalData = jsonDecode(signalDataJson) as Map<String, dynamic>;
        final signalCallId = signalData['call_id'] as String?;

        // If there's an active call and this signal matches it, forward now
        if (currentCallId != null && signalCallId == currentCallId) {
          debugPrint('[HomeScreen] Forwarding ${signal.signalType} signal to active call');
          ref.read(callStateProvider.notifier).handleCallSignalFromMailbox(
            signalType: signal.signalType,
            callId: signalCallId,
          );
        } else {
          // Defer: this signal likely belongs to an incoming offer not yet processed
          deferredSignals.add(signal);
        }
      } catch (e) {
        debugPrint('[HomeScreen] Error forwarding ${signal.signalType} signal: $e');
      }
    }

    if (offers.isEmpty) {
      // No offers — forward any remaining deferred signals (best effort)
      for (final signal in deferredSignals) {
        try {
          final signalDataJson = utf8.decode(signal.signalData);
          final signalData = jsonDecode(signalDataJson) as Map<String, dynamic>;
          ref.read(callStateProvider.notifier).handleCallSignalFromMailbox(
            signalType: signal.signalType,
            callId: signalData['call_id'] as String?,
          );
        } catch (e) {
          debugPrint('[HomeScreen] Error forwarding deferred ${signal.signalType} signal: $e');
        }
      }
      return;
    }

    // ── Step 3: Select the correct offer when multiple exist ──
    ReceivedCallSignal selectedOffer;

    if (offers.length == 1) {
      selectedOffer = offers.first;
    } else {
      debugPrint('[HomeScreen] Multiple offers (${offers.length}) — selecting the correct one');

      // Try to match using pending_signal_id saved by the FCM handler.
      // This is the mailbox message ID of the offer that triggered the
      // CallKit notification the user actually saw and accepted.
      ReceivedCallSignal? matched;
      try {
        final prefs = await SharedPreferences.getInstance();
        final pendingSignalId = prefs.getString('pending_signal_id');
        if (pendingSignalId != null) {
          matched = offers.where((o) => o.signalId == pendingSignalId).firstOrNull;
          if (matched != null) {
            debugPrint('[HomeScreen] Matched offer to pending_signal_id: $pendingSignalId');
          } else {
            debugPrint('[HomeScreen] pending_signal_id $pendingSignalId not found in offers');
          }
        }
      } catch (_) {}

      // Fallback: use the newest offer (most likely the caller's latest attempt)
      selectedOffer = matched ?? offers.reduce((a, b) =>
        a.timestamp.isAfter(b.timestamp) ? a : b);

      // Log skipped offers
      for (final o in offers) {
        if (o != selectedOffer) {
          final age = DateTime.now().difference(o.timestamp).inSeconds;
          debugPrint('[HomeScreen] Skipping stale/duplicate offer (signalId: ${o.signalId}, age: ${age}s)');
        }
      }
    }

    // ── Step 4: Process the selected offer ──
    try {
      final staleAge = DateTime.now().difference(selectedOffer.timestamp).inSeconds;

      // Skip stale offers (>25s) UNLESS user already interacted with CallKit
      if (staleAge > 25) {
        // IMPORTANT: do NOT call prefs.reload() here — the in-memory cache
        // already has values from onCallAccepted's setBool call. reload()
        // reads from disk where the async write may not be finished yet.
        final prefs = await SharedPreferences.getInstance();
        final hasPendingAccept = prefs.getBool('pending_call_accepted') ?? false;
        final hasPendingDecline = prefs.getBool('pending_call_declined') ?? false;
        final hasPendingCallKit = prefs.getString('pending_call_kit_id') != null;

        if (!hasPendingAccept && !hasPendingDecline && !hasPendingCallKit) {
          debugPrint('[HomeScreen] Stale offer signal (${staleAge}s old) — skipping');
          return;
        }
        debugPrint('[HomeScreen] Stale offer (${staleAge}s) but pending CallKit action — processing anyway');
      }

      final signalDataJson = utf8.decode(selectedOffer.signalData);
      final signalData = jsonDecode(signalDataJson) as Map<String, dynamic>;

      final callId = signalData['call_id'] as String?;
      final callTypeStr = signalData['call_type'] as String? ?? 'audio';
      final callType = callTypeStr == 'video' ? CallType.video : CallType.audio;
      final senderHashId = signalData['sender_hash_id'] as String?;

      debugPrint('[HomeScreen] Incoming call from hash_id: $senderHashId');

      // Find the contact by their hash_id
      Contact? contact;
      for (final c in contacts) {
        if (c.hashId == senderHashId) {
          contact = c;
          break;
        }
      }

      if (contact == null) {
        debugPrint('[HomeScreen] Unknown caller (no contact with hash_id: $senderHashId)');
        return;
      }

      debugPrint('[HomeScreen] Incoming ${callType.name} call from ${contact.displayName} (callId: $callId)');

      // Check if call notifications are enabled (global + per-contact)
      final callSettings = ref.read(appSettingsProvider);
      if (!callSettings.callNotificationsEnabled) {
        debugPrint('[HomeScreen] Call notifications disabled globally — ignoring incoming call');
        return;
      }
      if (!contact.callNotificationsEnabled) {
        debugPrint('[HomeScreen] Call notifications disabled for ${contact.displayName} — ignoring');
        return;
      }
      if (contact.isMuted) {
        debugPrint('[HomeScreen] Contact ${contact.displayName} is muted — ignoring call');
        return;
      }

      // Trigger incoming call
      if (callId != null && mounted) {
        FocusManager.instance.primaryFocus?.unfocus();

        await ref.read(callStateProvider.notifier).receiveIncomingCall(
          contact: contact,
          callId: callId,
          callType: callType,
        );
      }
    } catch (e) {
      debugPrint('[HomeScreen] Error processing offer signal: $e');
    }

    // ── Step 5: Forward deferred non-offer signals AFTER the offer is processed ──
    // Now that the call state has the correct callId, hangup/decline signals
    // will be properly matched and handled (e.g., caller hung up before we answered).
    for (final signal in deferredSignals) {
      try {
        debugPrint('[HomeScreen] Forwarding deferred ${signal.signalType} signal');
        final signalDataJson = utf8.decode(signal.signalData);
        final signalData = jsonDecode(signalDataJson) as Map<String, dynamic>;
        ref.read(callStateProvider.notifier).handleCallSignalFromMailbox(
          signalType: signal.signalType,
          callId: signalData['call_id'] as String?,
        );
      } catch (e) {
        debugPrint('[HomeScreen] Error forwarding deferred ${signal.signalType} signal: $e');
      }
    }
  }

  /// Show in-app notification banner when user is in the app but not in this chat
  void _showInAppNotification({
    required Contact contact,
    required String messagePreview,
  }) {
    if (!mounted) return;

    // Vibrate
    final settings = ref.read(appSettingsProvider);
    if (settings.vibrationEnabled) {
      HapticFeedback.mediumImpact();
    }

    // Show banner using overlay
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => _InAppNotificationBanner(
        contact: contact,
        messagePreview: messagePreview,
        onTap: () {
          overlayEntry.remove();
          ref.read(selectedContactProvider.notifier).state = contact;
          _navigateToChat(context, contact.odid);
        },
        onDismiss: () {
          overlayEntry.remove();
        },
      ),
    );

    overlay.insert(overlayEntry);

    // Auto-dismiss after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final contacts = ref.watch(contactsProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Initialize contact sync service (will auto-process accepted requests)
    ref.watch(contactSyncInitProvider);

    // Filter: only show conversations with messages, exclude hidden
    final filteredContacts = contacts
        .where((c) => c.lastMessageAt != null && !c.isHidden)
        .toList()
      ..sort((a, b) {
        // Pinned first, then by lastMessageAt desc
        if (a.isPinned != b.isPinned) return a.isPinned ? -1 : 1;
        return b.lastMessageAt!.compareTo(a.lastMessageAt!);
      });

    final hasConversations = filteredContacts.isNotEmpty;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        title: AnimatedHashAppBarTitle(
          title: l10n.conversations,
          tabIndex: 0,
          isOnGlass: true,
        ),
        actions: [
          if (hasConversations)
            IconButton(
              icon: const Icon(Icons.chat_outlined, size: 22),
              color: AppColors.accentPrimary,
              onPressed: () => showNewMessageSheet(context, ref),
            ),
        ],
      ),
      body: !ref.read(contactsProvider.notifier).isLoaded
          ? const SizedBox.shrink()
          : contacts.isEmpty
              ? _buildNoContactsState()
              : hasConversations
                  ? _buildConversationList(filteredContacts)
                  : _buildNoConversationsState(),
    );
  }

  /// Empty state when user has NO contacts at all — show QR card
  Widget _buildNoContactsState() {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final user = ref.watch(currentUserProvider);
    final codeState = ref.watch(temporaryCodeNotifierProvider);
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    // QR data: hashId + temporaryCode
    final qrData = user != null && codeState.code != null
        ? 'hash://${user.hashId}/${codeState.code}'
        : '';

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(24, MediaQuery.of(context).padding.top + kToolbarHeight + 16, 24, 160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (ref.watch(accountNotFoundProvider)) ...[
            _buildAccountNotFoundBanner(),
            const SizedBox(height: 8),
          ],

          const SizedBox(height: 16),

          // Pending contact requests card
          ..._buildPendingRequestCards(l10n, isDark),

          // QR Code Card (title + subtitle inside)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.accentPrimary.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              children: [
                // Title + subtitle
                Text(
                  l10n.addFirstContact,
                  style: AppTypography.headlineSmall(color: primaryColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.addFirstContactSubtitle,
                  style: AppTypography.bodyMedium(color: secondaryColor),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // QR Code
                if (qrData.isNotEmpty && !codeState.isExpired)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: QrImageView(
                      data: qrData,
                      version: QrVersions.auto,
                      size: 180,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Colors.black,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Colors.black,
                      ),
                    ),
                  ).animate().fadeIn(delay: 200.ms).scale(
                    begin: const Offset(0.9, 0.9),
                    end: const Offset(1, 1),
                  )
                else if (codeState.isLoading)
                  Container(
                    width: 204,
                    height: 204,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.accentPrimary),
                      ),
                    ),
                  )
                else
                  // Expired or no code: blurred QR with refresh overlay
                  GestureDetector(
                    onTap: () => ref.read(temporaryCodeNotifierProvider.notifier).forceRefresh(),
                    child: Container(
                      width: 204,
                      height: 204,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ImageFiltered(
                              imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Opacity(
                                opacity: 0.3,
                                child: Icon(
                                  Icons.qr_code_2,
                                  size: 140,
                                  color: secondaryColor,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.accentPrimary.withValues(alpha: 0.15),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.refresh,
                                    size: 28,
                                    color: AppColors.accentPrimary,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  l10n.generateNewCodeButton,
                                  style: AppTypography.labelSmall(
                                    color: AppColors.accentPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                // Hash ID
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user?.hashId ?? '---',
                      style: AppTypography.hashId(),
                    ),
                    const SizedBox(width: 8),
                    if (user?.hashId != null)
                      GestureDetector(
                        onTap: () => _copyToClipboard(
                            user!.hashId, l10n.copiedToClipboard),
                        child: const Icon(
                          Icons.copy,
                          size: 18,
                          color: AppColors.accentPrimary,
                        ),
                      ),
                  ],
                ).animate().fadeIn(delay: 300.ms),

                const SizedBox(height: 16),

                // Temporary code
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
                    style: AppTypography.code(color: primaryColor),
                  ).animate().fadeIn(delay: 350.ms)
                else
                  Text(
                    l10n.codeExpired,
                    style: AppTypography.bodyMedium(color: secondaryColor),
                  ),

                const SizedBox(height: 12),

                // Timer badge + Refresh button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (codeState.code != null && !codeState.isExpired)
                      Flexible(
                        child: Container(
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
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    codeState.formattedTime,
                                    style: AppTypography.labelSmall(
                                      color: codeState.remainingSeconds < 60
                                          ? AppColors.error
                                          : AppColors.accentPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
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

                // Scan QR + Add manually (side by side, no icons to fit)
                Row(
                  children: [
                    Expanded(
                      child: HashButton(
                        text: l10n.scanShort,
                        icon: Icons.qr_code_scanner,
                        isOutlined: true,
                        onPressed: () => context.push(AppRoutes.qrScanner),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: HashButton(
                        text: l10n.addShort,
                        icon: Icons.person_add_outlined,
                        isOutlined: true,
                        onPressed: () => context.push(AppRoutes.addContact),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Share app button
                SizedBox(
                  width: double.infinity,
                  child: HashButton(
                    text: l10n.shareApp,
                    icon: Icons.share_outlined,
                    isOutlined: true,
                    onPressed: _shareInviteLink,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.1, end: 0),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// Build pending request cards for the empty state
  List<Widget> _buildPendingRequestCards(AppLocalizations l10n, bool isDark) {
    final pendingRequests = ref.watch(contactRequestsProvider).pendingRequests;
    if (pendingRequests.isEmpty) return [];

    return [
      ...pendingRequests.map((request) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: _PendingRequestCard(
          request: request,
          isDark: isDark,
          onAccept: () => _navigateToContactRequests(),
          onReject: () => _rejectPendingRequest(request, l10n),
        ),
      )),
    ];
  }

  void _navigateToContactRequests() {
    context.push(AppRoutes.contactRequests);
  }

  Future<void> _rejectPendingRequest(ContactRequest request, AppLocalizations l10n) async {
    try {
      await ref.read(contactRequestsProvider.notifier).rejectRequest(request.id);
      if (!mounted) return;
      showHashSnackBar(context, message: l10n.requestRejected, type: HashSnackBarType.success);
    } catch (e) {
      if (!mounted) return;
      showHashSnackBar(context, message: l10n.error, type: HashSnackBarType.error);
    }
  }

  /// Empty state when contacts exist but no conversations yet
  /// Shows newly accepted contacts as conversation cards
  Widget _buildNoConversationsState() {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    // Show contacts that have no messages yet (newly accepted)
    final contactsWithoutMessages = ref.watch(contactsProvider)
        .where((c) => c.lastMessageAt == null && !c.isHidden)
        .toList();

    if (contactsWithoutMessages.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (ref.watch(accountNotFoundProvider)) ...[
                _buildAccountNotFoundBanner(),
                const SizedBox(height: 24),
              ],
              Icon(
                Icons.chat_bubble_outline,
                size: 64,
                color: AppColors.accentPrimary,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.noConversations,
                style: AppTypography.bodyLarge(
                  color: AppColors.accentPrimary,
                ).copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              HashButton(
                text: l10n.startConversation,
                icon: Icons.send_rounded,
                onPressed: () => showNewMessageSheet(context, ref),
              ),
            ],
          ),
        ),
      );
    }

    final accountNotFound = ref.watch(accountNotFoundProvider);
    final bannerOffset = accountNotFound ? 1 : 0;

    return ListView.builder(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight + 16, bottom: 8),
      itemCount: contactsWithoutMessages.length + bannerOffset,
      itemBuilder: (context, index) {
        if (accountNotFound && index == 0) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: _buildAccountNotFoundBanner(),
          );
        }
        final contactIndex = index - bannerOffset;
        final contact = contactsWithoutMessages[contactIndex];
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              ref.read(selectedContactProvider.notifier).state = contact;
              _navigateToChat(context, contact.odid);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  HashAvatar(
                    imagePath: contact.avatarPath,
                    initials: contact.initials,
                    size: 48,
                    colorSeed: contact.displayName,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact.displayName,
                          style: AppTypography.bodyLarge(
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          ).copyWith(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.sendMessageAction,
                          style: AppTypography.bodyMedium(
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: secondaryColor,
                  ),
                ],
              ),
            ),
          ),
        ).animate(delay: Duration(milliseconds: 50 * contactIndex)).fadeIn().slideX(begin: 0.1, end: 0);
      },
    );
  }

  Widget _buildAccountNotFoundBanner() {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Compte introuvable',
                  style: AppTypography.bodyLarge(
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Votre compte n\'a pas été trouvé sur le serveur. '
            'Les fonctionnalités en ligne sont indisponibles.',
            style: AppTypography.bodySmall(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: _showAccountNotFoundDialog,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.error.withValues(alpha: 0.15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: Text(
                'Résoudre le problème',
                style: AppTypography.bodyMedium(color: AppColors.error)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConversationList(List<Contact> contacts) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final settings = ref.watch(appSettingsProvider);
    final accountNotFound = ref.watch(accountNotFoundProvider);
    final bannerOffset = accountNotFound ? 1 : 0;
    // Search bar offset
    const searchOffset = 1;

    // Contacts without messages (newly added) — shown at top
    final newContacts = _searchQuery.isEmpty
        ? ref.watch(contactsProvider)
            .where((c) => c.lastMessageAt == null && !c.isHidden)
            .toList()
        : ref.watch(contactsProvider)
            .where((c) =>
                c.lastMessageAt == null &&
                !c.isHidden &&
                c.displayName.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
    final newContactsCount = newContacts.length;

    // Filter contacts by search query
    final displayContacts = _searchQuery.isEmpty
        ? contacts
        : contacts
            .where((c) => c.displayName.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();

    final showDonation = !_donationDismissed && _searchQuery.isEmpty;
    final donationOffset = showDonation ? 1 : 0;

    return ListView.builder(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight + 4, bottom: 8),
      itemCount: displayContacts.length + newContactsCount + bannerOffset + searchOffset + donationOffset,
      itemBuilder: (context, index) {
        if (accountNotFound && index == 0) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: _buildAccountNotFoundBanner(),
          );
        }
        // Search bar
        if (index == bannerOffset) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _searchController,
              onChanged: (v) => setState(() => _searchQuery = v),
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              decoration: InputDecoration(
                hintText: l10n.searchContact,
                hintStyle: AppTypography.bodyMedium(color: secondaryColor),
                prefixIcon: Icon(Icons.search, color: secondaryColor),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.close, color: secondaryColor),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: isDark ? Colors.black : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          );
        }

        // Donation tile right after search bar (top of conversations)
        if (showDonation && index == bannerOffset + searchOffset) {
          return _DonationTile(
            onDismiss: () => setState(() => _donationDismissed = true),
          );
        }

        // New contacts (without messages) section — after donation tile
        final newContactStartIndex = bannerOffset + searchOffset + donationOffset;
        if (index >= newContactStartIndex && index < newContactStartIndex + newContactsCount) {
          final newContactIndex = index - newContactStartIndex;
          final contact = newContacts[newContactIndex];
          return _NewContactTile(
            contact: contact,
            onTap: () {
              ref.read(selectedContactProvider.notifier).state = contact;
              _navigateToChat(context, contact.odid);
            },
          ).animate(delay: Duration(milliseconds: 50 * newContactIndex)).fadeIn().slideX(begin: 0.1, end: 0);
        }

        final contactIndex = index - bannerOffset - searchOffset - donationOffset - newContactsCount;
        final contact = displayContacts[contactIndex];
        return _ConversationTile(
          contact: contact,
          hideMessagePreview: settings.hideMessagePreviews,
          onTap: () {
            ref.read(selectedContactProvider.notifier).state = contact;
            _navigateToChat(context, contact.odid);
          },
          onLongPress: () => _showConversationActions(contact),
        ).animate(delay: Duration(milliseconds: 50 * contactIndex)).fadeIn().slideX(begin: 0.1, end: 0);
      },
    );
  }

  void _showConversationActions(Contact contact) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final dividerColor = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.black.withValues(alpha: 0.06);

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.3),
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
          child: child,
        );
      },
      pageBuilder: (ctx, animation, secondaryAnimation) => Stack(
        children: [
          // Dismiss zone
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.pop(ctx),
              behavior: HitTestBehavior.translucent,
            ),
          ),
          // Menu
          Positioned(
            left: 12,
            right: 12,
            bottom: MediaQuery.of(ctx).padding.bottom + 12,
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: GlassTheme.blurMax, sigmaY: GlassTheme.blurMax),
                  child: Container(
                    decoration: BoxDecoration(
                      color: GlassTheme.backgroundStrong(isDark),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: dividerColor),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Handle
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 4),
                          child: Container(
                            width: 36,
                            height: 4,
                            decoration: BoxDecoration(
                              color: GlassTheme.handle(isDark),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),

                        // Pin/Unpin
                        _buildActionItem(
                          icon: contact.isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                          label: contact.isPinned ? l10n.unpinConversation : l10n.pinConversation,
                          iconColor: contact.isPinned ? AppColors.accentPrimary : secondaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            Navigator.pop(ctx);
                            _togglePinConversation(contact);
                          },
                        ),
                        Divider(height: 1, color: dividerColor, indent: 16, endIndent: 16),

                        // Hide
                        _buildActionItem(
                          icon: Icons.visibility_off_outlined,
                          label: l10n.hideConversation,
                          iconColor: secondaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            Navigator.pop(ctx);
                            _hideConversation(contact);
                          },
                        ),
                        Divider(height: 1, color: dividerColor, indent: 16, endIndent: 16),

                        // Delete
                        _buildActionItem(
                          icon: Icons.delete_outline,
                          label: l10n.deleteConversation,
                          iconColor: AppColors.error,
                          textColor: AppColors.error,
                          onTap: () {
                            Navigator.pop(ctx);
                            _confirmDeleteConversation(contact);
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required Color iconColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 22),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: AppTypography.bodyMedium(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _togglePinConversation(Contact contact) async {
    final localStorage = ref.read(localStorageProvider);
    contact.isPinned = !contact.isPinned;
    await localStorage.saveContact(contact);
    ref.read(contactsProvider.notifier).refresh();
  }

  Future<void> _hideConversation(Contact contact) async {
    final localStorage = ref.read(localStorageProvider);
    contact.isHidden = true;
    contact.lastMessagePreview = null;
    contact.lastMessageAt = null;
    await localStorage.saveContact(contact);
    ref.read(contactsProvider.notifier).refresh();
  }

  void _confirmDeleteConversation(Contact contact) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final l10n = AppLocalizations.of(context)!;

    String? pinError;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => GlassTheme.glassAlertDialog(
          context: ctx,
          title: l10n.deleteConversation,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(ctx),
              icon: Icon(Icons.close, color: secondaryColor),
              splashRadius: 20,
            ),
          ],
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.deleteConversationConfirm,
                  style: AppTypography.bodyMedium(color: secondaryColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                HashPinField(
                  length: 6,
                  onCompleted: (pin) async {
                    final secureStorage = ref.read(secureStorageProvider);
                    final isValid = await secureStorage.verifyPin(pin);
                    if (!ctx.mounted) return;
                    if (isValid) {
                      Navigator.pop(ctx);
                      _deleteConversation(contact);
                    } else {
                      setDialogState(() => pinError = l10n.incorrectPin);
                    }
                  },
                ),
                if (pinError != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: AppColors.error, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            pinError!,
                            style: AppTypography.bodySmall(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _deleteConversation(Contact contact) async {
    final messageRepo = ref.read(messageRepositoryProvider);
    final localStorage = ref.read(localStorageProvider);

    await messageRepo.deleteAllMessagesForContact(contact.odid);

    contact.lastMessagePreview = null;
    contact.lastMessageAt = null;
    contact.unreadCount = 0;
    await localStorage.saveContact(contact);

    ref.read(contactsProvider.notifier).refresh();
  }
}

class _ConversationTile extends StatelessWidget {
  final Contact contact;
  final bool hideMessagePreview;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const _ConversationTile({
    required this.contact,
    required this.hideMessagePreview,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final tertiaryColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Avatar
              HashAvatar(
                imagePath: contact.avatarPath,
                initials: contact.initials,
                size: 48,
                colorSeed: contact.displayName,
              ),

              const SizedBox(width: 16),

              // Content
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name + preview
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (contact.isPinned)
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Icon(
                                    Icons.push_pin,
                                    size: 14,
                                    color: AppColors.accentPrimary.withValues(alpha: 0.7),
                                  ),
                                ),
                              Expanded(
                                child: Text(
                                  contact.displayName,
                                  style: AppTypography.bodyLarge(
                                    color: primaryColor,
                                  ).copyWith(
                                    fontWeight: contact.unreadCount > 0
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            hideMessagePreview
                              ? 'Message'
                              : (contact.lastMessagePreview ?? l10n.newConversation),
                            style: AppTypography.bodyMedium(
                              color: secondaryColor,
                            ).copyWith(fontSize: 15.5),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Time + unread badge (centered vertically)
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (contact.lastMessageAt != null)
                          Text(
                            _formatTime(context, contact.lastMessageAt!),
                            style: AppTypography.labelSmall(
                              color: contact.unreadCount > 0
                                  ? AppColors.accentPrimary
                                  : tertiaryColor,
                            ).copyWith(fontSize: 12),
                          ),
                        if (contact.unreadCount > 0) ...[
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accentPrimary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              contact.unreadCount.toString(),
                              style: AppTypography.labelSmall(
                                color: theme.scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ],
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

  String _formatTime(BuildContext context, DateTime time) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final localTime = time.toLocal();
    final now = DateTime.now();
    final diff = now.difference(localTime);

    if (diff.inMinutes < 1) {
      return l10n.now;
    } else if (diff.inHours < 1) {
      return l10n.minutesAgo(diff.inMinutes);
    } else if (diff.inDays < 1) {
      return l10n.hoursAgo(diff.inHours);
    } else if (diff.inDays < 7) {
      return l10n.daysAgo(diff.inDays);
    } else {
      return DateFormat.Md(locale).format(localTime);
    }
  }
}

class _DonationTile extends StatelessWidget {
  final VoidCallback onDismiss;

  const _DonationTile({required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(const String.fromEnvironment('DONATE_URL'));
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Donation icon filling the circle
              ClipOval(
                child: Image.asset(
                  'assets/images/donate.png',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.supportHash,
                      style: AppTypography.bodyLarge(
                        color: AppColors.accentPrimary,
                      ).copyWith(fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.supportHashSubtitle,
                      style: AppTypography.bodyMedium(
                        color: secondaryColor,
                      ).copyWith(fontSize: 15.5),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Dismiss button — centered vertically against both lines
              GestureDetector(
                onTap: onDismiss,
                child: Icon(
                  Icons.close,
                  size: 14,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// In-app notification banner widget
class _InAppNotificationBanner extends StatefulWidget {
  final Contact contact;
  final String messagePreview;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const _InAppNotificationBanner({
    required this.contact,
    required this.messagePreview,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  State<_InAppNotificationBanner> createState() => _InAppNotificationBannerState();
}

class _InAppNotificationBannerState extends State<_InAppNotificationBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() {
    _controller.reverse().then((_) {
      widget.onDismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);

    return Positioned(
      top: mediaQuery.padding.top + 8,
      left: 12,
      right: 12,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: GestureDetector(
            onTap: widget.onTap,
            onVerticalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy < -100) {
                _dismiss();
              }
            },
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.95)
                      : Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(16),
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
                child: Row(
                  children: [
                    // Avatar
                    HashAvatar(
                      imagePath: widget.contact.avatarPath,
                      initials: widget.contact.initials,
                      size: 44,
                      colorSeed: widget.contact.displayName,
                    ),
                    const SizedBox(width: 12),
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.contact.displayName,
                            style: AppTypography.bodyLarge(
                              color: isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                            ).copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.messagePreview,
                            style: AppTypography.bodyMedium(
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Close button
                    GestureDetector(
                      onTap: _dismiss,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: isDark
                              ? AppColors.textTertiaryDark
                              : AppColors.textTertiaryLight,
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
  }
}

/// Tile displayed for newly added contacts that have no messages yet.
/// Shows the contact name with a "Start a conversation" subtitle.
class _NewContactTile extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const _NewContactTile({
    required this.contact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              HashAvatar(
                imagePath: contact.avatarPath,
                initials: contact.initials,
                size: 48,
                colorSeed: contact.displayName,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.displayName,
                      style: AppTypography.bodyLarge(
                        color: primaryColor,
                      ).copyWith(fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.sendMessageAction,
                      style: AppTypography.bodyMedium(
                        color: AppColors.accentPrimary.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chat_bubble_outline,
                size: 18,
                color: AppColors.accentPrimary.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Card displayed in empty state when a pending contact request exists
class _PendingRequestCard extends StatelessWidget {
  final ContactRequest request;
  final bool isDark;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const _PendingRequestCard({
    required this.request,
    required this.isDark,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.accentPrimary.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentPrimary.withValues(alpha: 0.15),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon + Title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.person_add_alt_1,
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
                      l10n.pendingRequests,
                      style: AppTypography.bodyLarge(color: primaryColor)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.pendingRequestsSubtitle,
                      style: AppTypography.bodySmall(color: secondaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Hash ID of requester
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.accentPrimary.withValues(alpha: 0.08)
                  : AppColors.accentPrimary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accentPrimary.withValues(alpha: 0.15),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: AppColors.accentPrimary,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    request.requesterHashId,
                    style: AppTypography.hashId(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Accept + Reject buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onReject,
                  icon: const Icon(Icons.close, size: 18),
                  label: Text(l10n.rejectRequest),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error, width: 1.5),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onAccept,
                  icon: const Icon(Icons.check, size: 18),
                  label: Text(l10n.acceptRequest),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: -0.1, end: 0);
  }
}
