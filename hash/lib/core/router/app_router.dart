import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/auth/pin_setup_screen.dart';
import '../../presentation/screens/auth/pin_entry_screen.dart';
import '../../presentation/screens/auth/recovery_screen.dart';
import '../../presentation/screens/auth/account_transferred_screen.dart';
import '../../presentation/screens/main_shell.dart';
import '../../presentation/screens/chat/chat_screen.dart';
import '../../presentation/screens/contacts/add_contact_screen.dart';
import '../../presentation/screens/contacts/contact_detail_screen.dart';
import '../../presentation/screens/contacts/send_request_screen.dart';
import '../../presentation/screens/contacts/contact_requests_screen.dart';
import '../../presentation/screens/qr_scanner/qr_scanner_screen.dart';
import '../../presentation/screens/qr_scanner/qr_display_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/settings/security_settings_screen.dart';
import '../../presentation/screens/settings/entry_pin_settings_screen.dart';
import '../../presentation/screens/settings/destruction_pin_settings_screen.dart'; // VashPinSettingsScreen
import '../../presentation/screens/settings/appearance_settings_screen.dart';
import '../../presentation/screens/settings/transfer_account_screen.dart';
import '../../presentation/screens/settings/login_logs_screen.dart';
import '../../presentation/screens/onboarding/recover_account_screen.dart';
import '../../presentation/screens/contacts/contacts_directory_screen.dart';
import '../../presentation/screens/call/unified_call_screen.dart';
import '../../presentation/screens/notes/note_editor_screen.dart';
import '../../presentation/screens/settings/device_data_screen.dart';
import '../../presentation/screens/settings/data_overview_screen.dart';
import '../../presentation/screens/settings/notification_sound_screen.dart';
import '../../presentation/screens/settings/ephemeral_settings_screen.dart';
import '../../presentation/screens/settings/app_icon_settings_screen.dart';
import '../../domain/models/call_state.dart';

/// App routes
class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const pinSetup = '/pin-setup';
  static const pinEntry = '/pin-entry';
  static const recovery = '/recovery';
  static const home = '/home';
  static const chat = '/chat/:contactId';
  static const addContact = '/add-contact';
  static const contactDetail = '/contact/:contactId';
  static const sendRequest = '/send-request';
  static const contactRequests = '/contact-requests';
  static const qrScanner = '/qr-scanner';
  static const qrDisplay = '/qr-display';
  static const settings = '/settings';
  static const securitySettings = '/settings/security';
  static const entryPinSettings = '/settings/security/entry-pin';
  static const destructionPinSettings = '/settings/security/destruction-pin';
  static const appearanceSettings = '/settings/appearance';
  static const transferAccount = '/settings/transfer';
  static const loginLogs = '/settings/login-logs';
  static const recoverAccount = '/recover-account';
  static const contacts = '/contacts';
  static const accountTransferred = '/account-transferred';
  static const call = '/call/:contactId';
  static const noteEditor = '/note-editor';
  static const dataOverview = '/settings/data';
  static const deviceData = '/settings/device-data';
  static const notificationSound = '/settings/notification-sound';
  static const ephemeralSettings = '/settings/ephemeral';
  static const appIconSettings = '/settings/app-icon';
}

/// Navigator key exposé pour que des widgets hors du Navigator (ex. ShakeLockWrapper
/// dans le builder de MaterialApp) puissent accéder à l'Overlay du navigator.
final rootNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouter provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.pinSetup,
        builder: (context, state) => const PinSetupScreen(),
      ),
      GoRoute(
        path: AppRoutes.pinEntry,
        builder: (context, state) {
          final skipBiometric = state.extra as bool? ?? false;
          return PinEntryScreen(skipBiometric: skipBiometric);
        },
      ),
      GoRoute(
        path: AppRoutes.recovery,
        builder: (context, state) => const RecoveryScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const MainShell(),
      ),
      GoRoute(
        path: AppRoutes.chat,
        pageBuilder: (context, state) {
          final contactId = state.pathParameters['contactId'] ?? '';
          if (contactId.isEmpty) {
            return const CupertinoPage(child: MainShell());
          }
          final isFromCall = state.extra == 'fromCall';
          final child = ChatScreen(contactId: contactId, fromCall: isFromCall);
          if (isFromCall) {
            return CustomTransitionPage(
              child: child,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          }
          return CupertinoPage(child: child);
        },
      ),
      GoRoute(
        path: AppRoutes.contacts,
        pageBuilder: (context, state) => const CupertinoPage(
          child: ContactsDirectoryScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.addContact,
        pageBuilder: (context, state) => const CupertinoPage(
          child: AddContactScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.contactDetail,
        pageBuilder: (context, state) {
          final contactId = state.pathParameters['contactId'] ?? '';
          if (contactId.isEmpty) {
            return const CupertinoPage(child: MainShell());
          }
          return CupertinoPage(child: ContactDetailScreen(contactId: contactId));
        },
      ),
      GoRoute(
        path: AppRoutes.sendRequest,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return CupertinoPage(
            child: SendRequestScreen(
              hashId: extra['hashId'] as String,
              exchangeToken: extra['exchangeToken'] as String,
              recipientPublicKey: extra['recipientPublicKey'] as String,
              recipientSealedSenderPublicKey: extra['recipientSealedSenderPublicKey'] as String?,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.contactRequests,
        pageBuilder: (context, state) => const CupertinoPage(
          child: ContactRequestsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.qrScanner,
        pageBuilder: (context, state) => const CupertinoPage(
          child: QrScannerScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.qrDisplay,
        pageBuilder: (context, state) => const CupertinoPage(
          child: QrDisplayScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.settings,
        pageBuilder: (context, state) => const CupertinoPage(
          child: SettingsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.securitySettings,
        pageBuilder: (context, state) => const CupertinoPage(
          child: SecuritySettingsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.entryPinSettings,
        pageBuilder: (context, state) => const CupertinoPage(
          child: EntryPinSettingsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.destructionPinSettings,
        pageBuilder: (context, state) => const CupertinoPage(
          child: VashPinSettingsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.appearanceSettings,
        pageBuilder: (context, state) => const CupertinoPage(
          child: AppearanceSettingsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.notificationSound,
        pageBuilder: (context, state) => const CupertinoPage(
          child: NotificationSoundScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.ephemeralSettings,
        pageBuilder: (context, state) => const CupertinoPage(
          child: EphemeralSettingsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.appIconSettings,
        pageBuilder: (context, state) => const CupertinoPage(
          child: AppIconSettingsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.transferAccount,
        pageBuilder: (context, state) => const CupertinoPage(
          child: TransferAccountScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.loginLogs,
        pageBuilder: (context, state) => const CupertinoPage(
          child: LoginLogsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.recoverAccount,
        pageBuilder: (context, state) => const CupertinoPage(
          child: RecoverAccountScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.accountTransferred,
        pageBuilder: (context, state) => const CupertinoPage(
          child: AccountTransferredScreen(),
        ),
      ),
      // Data overview (hub) route
      GoRoute(
        path: AppRoutes.dataOverview,
        pageBuilder: (context, state) => const CupertinoPage(
          child: DataOverviewScreen(),
        ),
      ),
      // Device data (local) route
      GoRoute(
        path: AppRoutes.deviceData,
        pageBuilder: (context, state) => const CupertinoPage(
          child: DeviceDataScreen(),
        ),
      ),
      // Note editor route
      GoRoute(
        path: AppRoutes.noteEditor,
        pageBuilder: (context, state) {
          final noteId = state.uri.queryParameters['id'];
          return CupertinoPage(child: NoteEditorScreen(noteId: noteId));
        },
      ),
      // Call route (unified)
      GoRoute(
        path: AppRoutes.call,
        name: 'call',
        pageBuilder: (context, state) {
          final contactId = state.pathParameters['contactId'] ?? '';
          if (contactId.isEmpty) {
            return const CupertinoPage(child: MainShell());
          }
          final callType = state.extra as CallType? ?? CallType.audio;
          return CustomTransitionPage(
            child: UnifiedCallScreen(
              contactId: contactId,
              callType: callType,
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page non trouvée: ${state.uri}'),
      ),
    ),
  );
});
