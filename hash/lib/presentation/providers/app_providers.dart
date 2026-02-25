import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/crypto_service.dart';
import '../../core/services/destruction_service.dart';
import '../../core/services/edge_function_service.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/services/pin_security_service.dart';
import '../../core/services/recovery_security_service.dart';
import '../../core/services/secure_storage_service.dart';
import '../../core/services/secure_time_service.dart';
import '../../core/services/transfer_service.dart';
import '../../core/services/proximity_verification_service.dart';
import '../../core/services/sealed_sender_service.dart';
import '../../core/services/anonymous_mailbox_service.dart';
import '../../core/services/media_encryption_service.dart';
import '../../core/services/media_storage_service.dart';
import '../../core/services/media_download_queue_service.dart';
import '../../core/services/message_send_queue_service.dart';
import '../../core/services/receipt_queue_service.dart';
import '../../core/services/notification_preferences_sync.dart';
import '../../core/services/shake_lock_service.dart';
import '../../core/services/remote_config_service.dart';
import '../../core/services/expiration_service.dart';
import '../../core/services/signal_protocol_service.dart';
import '../../core/services/app_icon_service.dart';
import '../../core/services/ui_sound_service.dart';
import '../../data/repositories/message_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/models/contact.dart';
import '../../domain/models/note.dart';
import '../../domain/models/user.dart' as app;

// ============ CORE SERVICES ============

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});

final localStorageProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    secureStorage: ref.read(secureStorageProvider),
    localStorage: ref.read(localStorageProvider),
  );
});

final cryptoServiceProvider = Provider<CryptoService>((ref) {
  return CryptoService();
});

final destructionServiceProvider = Provider<DestructionService>((ref) {
  return DestructionService(
    secureStorage: ref.read(secureStorageProvider),
    localStorage: ref.read(localStorageProvider),
    supabaseClient: ref.read(supabaseClientProvider),
  );
});

final edgeFunctionServiceProvider = Provider<EdgeFunctionService>((ref) {
  return EdgeFunctionService(ref.read(supabaseClientProvider));
});

final secureTimeServiceProvider = Provider<SecureTimeService>((ref) {
  return SecureTimeService(
    secureStorage: ref.read(secureStorageProvider),
  );
});

final pinSecurityServiceProvider = Provider<PinSecurityService>((ref) {
  return PinSecurityService(
    secureStorage: ref.read(secureStorageProvider),
    localStorage: ref.read(localStorageProvider),
    edgeFunctions: ref.read(edgeFunctionServiceProvider),
    secureTime: ref.read(secureTimeServiceProvider),
  );
});

final recoverySecurityServiceProvider = Provider<RecoverySecurityService>((ref) {
  return RecoverySecurityService(
    secureStorage: ref.read(secureStorageProvider),
    localStorage: ref.read(localStorageProvider),
    edgeFunctions: ref.read(edgeFunctionServiceProvider),
    secureTime: ref.read(secureTimeServiceProvider),
  );
});

final transferServiceProvider = Provider<TransferService>((ref) {
  return TransferService(
    secureStorage: ref.read(secureStorageProvider),
    localStorage: ref.read(localStorageProvider),
    edgeFunctions: ref.read(edgeFunctionServiceProvider),
  );
});

final proximityVerificationServiceProvider = Provider<ProximityVerificationService>((ref) {
  return ProximityVerificationService();
});

final sealedSenderServiceProvider = Provider<SealedSenderService>((ref) {
  return SealedSenderService();
});

final anonymousMailboxServiceProvider = Provider<AnonymousMailboxService>((ref) {
  return AnonymousMailboxService(
    edgeFunctions: ref.read(edgeFunctionServiceProvider),
    sealedSender: ref.read(sealedSenderServiceProvider),
    secureStorage: ref.read(secureStorageProvider),
    supabaseClient: ref.read(supabaseClientProvider),
  );
});

final mediaEncryptionServiceProvider = Provider<MediaEncryptionService>((ref) {
  return MediaEncryptionService();
});

final mediaStorageServiceProvider = Provider<MediaStorageService>((ref) {
  return MediaStorageService(
    edgeFunctions: ref.read(edgeFunctionServiceProvider),
    mediaEncryption: ref.read(mediaEncryptionServiceProvider),
  );
});

final shakeLockServiceProvider = Provider<ShakeLockService>((ref) {
  return ShakeLockService();
});

final remoteConfigServiceProvider = Provider<RemoteConfigService>((ref) {
  return RemoteConfigService(ref.read(supabaseClientProvider));
});

final mediaDownloadQueueServiceProvider = Provider<MediaDownloadQueueService>((ref) {
  return MediaDownloadQueueService(
    mediaStorage: ref.read(mediaStorageServiceProvider),
    messageRepository: ref.read(messageRepositoryProvider),
  );
});

final messageSendQueueServiceProvider = Provider<MessageSendQueueService>((ref) {
  return MessageSendQueueService(
    mailboxService: ref.read(anonymousMailboxServiceProvider),
    mediaStorage: ref.read(mediaStorageServiceProvider),
    messageRepository: ref.read(messageRepositoryProvider),
    localStorage: ref.read(localStorageProvider),
    signalService: ref.read(signalProtocolServiceProvider),
  );
});

final receiptQueueServiceProvider = Provider<ReceiptQueueService>((ref) {
  return ReceiptQueueService(
    mailboxService: ref.read(anonymousMailboxServiceProvider),
    localStorage: ref.read(localStorageProvider),
  );
});

final expirationServiceProvider = Provider<ExpirationService>((ref) {
  return ExpirationService(ref.read(localStorageProvider));
});

final signalProtocolServiceProvider = Provider<SignalProtocolService>((ref) {
  return SignalProtocolService(
    secureStorage: ref.read(secureStorageProvider),
  );
});

final uiSoundServiceProvider = Provider<UiSoundService>((ref) {
  return UiSoundService();
});

// ============ REPOSITORIES ============

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(
    client: ref.read(supabaseClientProvider),
    secureStorage: ref.read(secureStorageProvider),
  );
});

final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  return MessageRepository(
    client: ref.read(supabaseClientProvider),
    localStorage: ref.read(localStorageProvider),
  );
});

// ============ APP STATE ============

/// Current user state
final currentUserProvider = StateNotifierProvider<CurrentUserNotifier, app.User?>((ref) {
  return CurrentUserNotifier(ref.read(userRepositoryProvider));
});

class CurrentUserNotifier extends StateNotifier<app.User?> {
  final UserRepository _repository;

  CurrentUserNotifier(this._repository) : super(null) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    state = await _repository.getSavedUser();
  }

  Future<void> setUser(app.User user) async {
    state = user;
  }

  Future<void> logout() async {
    state = null;
  }

  /// Clear user (alias for logout, used when deleting account)
  void clearUser() {
    state = null;
  }
}

/// App settings state
final appSettingsProvider = StateNotifierProvider<AppSettingsNotifier, AppSettings>((ref) {
  return AppSettingsNotifier(ref.read(localStorageProvider));
});

class AppSettingsNotifier extends StateNotifier<AppSettings> {
  final LocalStorageService _storage;

  AppSettingsNotifier(this._storage) : super(AppSettings()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    // Don't load settings if Hive cipher is not set yet (PIN not entered)
    if (!_storage.hasCipher) return;
    state = await _storage.getSettings();

    // Sync notification preferences to native storage (iOS) at startup
    await NotificationPreferencesSync.syncPreferences(
      contentLevel: state.notificationContentLevel,
      customTitle: state.customNotificationTitle,
      customBody: state.customNotificationBody,
      notificationSound: state.notificationSound,
      messageNotificationsEnabled: state.messageNotificationsEnabled,
      callNotificationsEnabled: state.callNotificationsEnabled,
    );

    // Sync notification settings to SharedPreferences (for background handler)
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notification_sound', state.notificationSound);
    await prefs.setBool('message_notifications_enabled', state.messageNotificationsEnabled);
    await prefs.setBool('call_notifications_enabled', state.callNotificationsEnabled);
    await prefs.setBool('show_calls_in_recents', state.showCallsInRecents);
  }

  /// Reload settings from storage (call after cipher is set, e.g. after PIN entry)
  Future<void> reloadSettings() => _loadSettings();

  Future<void> updateSettings(AppSettings settings) async {
    // Set state FIRST to prevent race conditions where concurrent readers
    // would get stale values during the async save operation
    state = settings;
    await _storage.saveSettings(settings);

    // Sync notification preferences to native storage (iOS)
    // This allows the Notification Service Extension to read them
    await NotificationPreferencesSync.syncPreferences(
      contentLevel: settings.notificationContentLevel,
      customTitle: settings.customNotificationTitle,
      customBody: settings.customNotificationBody,
      notificationSound: settings.notificationSound,
      messageNotificationsEnabled: settings.messageNotificationsEnabled,
      callNotificationsEnabled: settings.callNotificationsEnabled,
    );

    // Sync notification settings to SharedPreferences (for background handler)
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notification_sound', settings.notificationSound);
    await prefs.setBool('message_notifications_enabled', settings.messageNotificationsEnabled);
    await prefs.setBool('call_notifications_enabled', settings.callNotificationsEnabled);
    await prefs.setBool('show_calls_in_recents', settings.showCallsInRecents);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final newSettings = state.copyWith(themeMode: mode);
    await updateSettings(newSettings);
  }

  Future<void> setLocale(String locale) async {
    final newSettings = state.copyWith(locale: locale);
    await updateSettings(newSettings);
  }

  Future<void> setAppIcon(String iconId) async {
    await AppIconService.setAppIcon(iconId);
    final newSettings = state.copyWith(appIcon: iconId);
    await updateSettings(newSettings);
  }

  Future<void> toggleMessageNotifications() async {
    final newSettings = state.copyWith(
      messageNotificationsEnabled: !state.messageNotificationsEnabled,
    );
    await updateSettings(newSettings);
  }

  Future<void> toggleCallNotifications() async {
    final newSettings = state.copyWith(
      callNotificationsEnabled: !state.callNotificationsEnabled,
    );
    await updateSettings(newSettings);
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    final newSettings = state.copyWith(biometricEnabled: enabled);
    await updateSettings(newSettings);
  }

  Future<void> setAutoLockMinutes(int minutes) async {
    final newSettings = state.copyWith(autoLockMinutes: minutes);
    await updateSettings(newSettings);
  }

  /// Enregistre une connexion et nettoie les entrées de plus de 24h
  Future<void> recordLogin() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final cutoff = now - const Duration(hours: 24).inMilliseconds;

    // Filtrer les anciennes entrées et ajouter la nouvelle
    final updatedTimestamps = [
      ...state.loginTimestamps.where((ts) => ts > cutoff),
      now,
    ];

    final newSettings = state.copyWith(loginTimestamps: updatedTimestamps);
    await _storage.saveSettings(newSettings);
    state = newSettings;
  }
}

/// Notes state
final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  return NotesNotifier(ref.read(localStorageProvider));
});

class NotesNotifier extends StateNotifier<List<Note>> {
  final LocalStorageService _storage;

  NotesNotifier(this._storage) : super([]) {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await _storage.getAllNotes();
    notes.sort((a, b) {
      if (a.isPinned != b.isPinned) return a.isPinned ? -1 : 1;
      return b.updatedAt.compareTo(a.updatedAt);
    });
    state = notes;
  }

  Future<void> addNote(Note note) async {
    // Limite de 100 notes
    if (state.length >= 100) {
      throw Exception('Limite de 100 notes atteinte');
    }
    await _storage.saveNote(note);
    await _loadNotes();
  }

  Future<void> updateNote(Note note) async {
    note.updatedAt = DateTime.now();
    await _storage.saveNote(note);
    await _loadNotes();
  }

  Future<void> deleteNote(String id) async {
    await _storage.deleteNote(id);
    await _loadNotes();
  }

  Future<void> togglePin(String id) async {
    final note = await _storage.getNote(id);
    if (note != null) {
      note.isPinned = !note.isPinned;
      note.updatedAt = DateTime.now();
      await _storage.saveNote(note);
      await _loadNotes();
    }
  }

  void refresh() => _loadNotes();

  void clear() {
    state = [];
  }
}

/// Theme mode derived from settings
final themeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(appSettingsProvider).themeMode;
});

/// Contacts list
final contactsProvider = StateNotifierProvider<ContactsNotifier, List<Contact>>((ref) {
  return ContactsNotifier(ref.read(localStorageProvider));
});

class ContactsNotifier extends StateNotifier<List<Contact>> {
  final LocalStorageService _storage;
  bool _isLoading = false;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  ContactsNotifier(this._storage) : super([]) {
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    try {
      state = await _storage.getAllContacts();
    } catch (e) {
      debugPrint('[ContactsNotifier] _loadContacts failed: $e');
    }
    _isLoaded = true;
  }

  Future<void> addContact(Contact contact) async {
    await _storage.saveContact(contact);
    await _loadContacts();
  }

  Future<void> updateContact(Contact contact) async {
    await _storage.saveContact(contact);
    await _loadContacts();
  }

  Future<void> deleteContact(String odid) async {
    await _storage.deleteContact(odid);
    await _loadContacts();
  }

  Future<void> refresh() async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      await _loadContacts();
    } finally {
      _isLoading = false;
    }
  }

  /// Clear all contacts from state (used during panic/logout)
  void clear() {
    state = [];
  }
}

/// Number of contacts with unread messages (for nav bar badge)
final unreadConversationsCountProvider = Provider<int>((ref) {
  final contacts = ref.watch(contactsProvider);
  return contacts.where((c) => c.unreadCount > 0).length;
});

/// Selected contact for chat
final selectedContactProvider = StateProvider<Contact?>((ref) => null);

/// Current chat contact ID (for notification handling - null = not in chat)
final currentChatContactIdProvider = StateProvider<String?>((ref) => null);

/// App initialization state
final appInitializedProvider = StateProvider<bool>((ref) => false);

/// Authentication state
final isAuthenticatedProvider = StateProvider<bool>((ref) => false);

/// Is app locked state
final isAppLockedProvider = StateProvider<bool>((ref) => true);

/// Loading states
final isLoadingProvider = StateProvider<bool>((ref) => false);

/// Ghost mode state (mode fantôme après code de destruction)
/// En mode fantôme: aucune donnée n'est chargée, aucune notification reçue
final isGhostModeProvider = StateProvider<bool>((ref) => false);

/// Index de l'onglet actif dans MainShell (0=Chats, 1=Appels, 2=Contacts, 3=Notes)
final currentTabIndexProvider = StateProvider<int>((ref) => 0);

/// Mode bypass PIN pour les appels acceptés depuis l'écran de verrouillage.
/// Quand true : l'écran d'appel est accessible sans PIN, le reste de l'app est verrouillé.
final callBypassProvider = StateProvider<bool>((ref) => false);

/// Signale que l'appel s'est terminé pendant le mode bypass.
/// Quand true : HashApp navigue vers PinEntryScreen.
final callEndedDuringBypassProvider = StateProvider<bool>((ref) => false);

/// Account not found on server (Utilisateur non trouvé — 401).
/// When true, a warning badge appears on the settings tab and an alert banner
/// is shown at the top of the settings screen.
final accountNotFoundProvider = StateProvider<bool>((ref) => false);

/// État de la connexion Realtime (true = connecté, false = déconnecté/reconnexion)
/// Commence à true pour ne pas afficher la bannière au lancement
final realtimeConnectedProvider = StateProvider<bool>((ref) => true);

/// Session transferred state (compte transféré vers un autre appareil)
/// Quand true, l'utilisateur doit être redirigé vers AccountTransferredScreen
final sessionTransferredProvider = StateProvider<bool>((ref) => false);

/// Marque la session comme transférée et invalide
void markSessionAsTransferred(WidgetRef ref) {
  ref.read(sessionTransferredProvider.notifier).state = true;
  ref.read(isAuthenticatedProvider.notifier).state = false;
  ref.read(currentUserProvider.notifier).clearUser();
}

/// Purge tout l'état en mémoire des providers après un nettoyage complet.
/// À appeler après deleteAllData() + secureStorage.deleteAll() pour que
/// les anciennes données ne restent pas en RAM.
void clearAllProviderState(WidgetRef ref) {
  ref.read(contactsProvider.notifier).clear();
  ref.read(notesProvider.notifier).clear();
  ref.read(currentUserProvider.notifier).clearUser();
  ref.read(selectedContactProvider.notifier).state = null;
  ref.read(currentChatContactIdProvider.notifier).state = null;
  ref.read(isAuthenticatedProvider.notifier).state = false;
  ref.read(isGhostModeProvider.notifier).state = false;
  ref.read(accountNotFoundProvider.notifier).state = false;
  ref.read(sessionTransferredProvider.notifier).state = false;
  ref.read(currentTabIndexProvider.notifier).state = 0;
}
