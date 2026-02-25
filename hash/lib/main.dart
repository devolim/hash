import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/generated/app_localizations.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'config/supabase_config.dart';
import 'core/router/app_router.dart';
import 'core/services/secure_storage_service.dart';
import 'core/services/edge_function_service.dart';
import 'core/theme/app_theme.dart';
import 'core/services/early_call_connect_service.dart';
import 'core/services/notification_service.dart';
import 'core/services/privacy_screen_service.dart';
import 'core/utils/avatar_utils.dart';
import 'core/utils/media_utils.dart';
import 'domain/models/app_settings.dart';
import 'domain/models/contact.dart';
import 'domain/models/message.dart';
import 'domain/models/call_message.dart';
import 'domain/models/call_settings.dart';
import 'domain/models/note.dart';
import 'domain/models/queued_message.dart';
import 'domain/models/queued_receipt.dart';
import 'presentation/providers/app_providers.dart';
import 'presentation/providers/call_providers.dart';
import 'presentation/screens/call/incoming_call_overlay.dart';
import 'presentation/widgets/call/floating_call_widget.dart';
import 'presentation/widgets/common/incoming_request_banner.dart';
import 'presentation/widgets/common/shake_lock_wrapper.dart';
import 'core/services/call_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  // Reset stale flags from previous session (hot restart, force kill, crash).
  // - app_is_active: must be false so FCM handler shows CallKit correctly
  // - pending_call_declined/accepted: action flags set by CallKit callbacks
  //   AFTER main() runs, so clearing them only removes stale leftovers
  // - pending_call_kit_id: set by FCM handler BEFORE main() — do NOT clear
  final prefs = await SharedPreferences.getInstance();

  // Reinstall detection (iOS only): SharedPreferences (sandbox) is deleted on
  // uninstall, but iOS Keychain persists. If the flag is missing AND prefs is
  // completely empty (no keys from previous runs), it's a genuine reinstall.
  // If prefs has other keys (e.g. app_is_active), it's just the first run
  // after a code update — not a reinstall.
  // On Android, EncryptedSharedPreferences is also in the sandbox, so there's
  // never an orphan scenario — this check is harmless but won't trigger.
  final hasLaunchedBefore = prefs.getBool('has_launched') ?? false;
  bool isReinstall = false;
  if (!hasLaunchedBefore) {
    final existingKeys = prefs.getKeys()..remove('has_launched');
    final isFreshSandbox = existingKeys.isEmpty;

    if (isFreshSandbox) {
      final secureStorage = SecureStorageService();
      final orphanedUserId = await secureStorage.getUserId();
      if (orphanedUserId != null) {
        isReinstall = true;
      }
    }
    await prefs.setBool('has_launched', true);
  }

  await prefs.setBool('app_is_active', false);
  await prefs.remove('pending_call_declined');
  await prefs.remove('pending_call_accepted');
  await prefs.remove('pending_call_id');

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: false,
    ),
  );

  // Edge-to-edge: hide Android navigation bar, keep status bar
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ContactAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(MessageTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(MessageStatusAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(MessageAdapter());
  }
  if (!Hive.isAdapterRegistered(5)) {
    Hive.registerAdapter(AppSettingsAdapter());
  }
  if (!Hive.isAdapterRegistered(6)) {
    Hive.registerAdapter(ThemeModeAdapter());
  }
  if (!Hive.isAdapterRegistered(10)) {
    Hive.registerAdapter(CallMessageAdapter());
  }
  if (!Hive.isAdapterRegistered(11)) {
    Hive.registerAdapter(CallSettingsAdapter());
  }
  if (!Hive.isAdapterRegistered(7)) {
    Hive.registerAdapter(NoteTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(8)) {
    Hive.registerAdapter(ChecklistItemAdapter());
  }
  if (!Hive.isAdapterRegistered(9)) {
    Hive.registerAdapter(NoteAdapter());
  }
  if (!Hive.isAdapterRegistered(12)) {
    Hive.registerAdapter(QueuedMessageAdapter());
  }
  if (!Hive.isAdapterRegistered(13)) {
    Hive.registerAdapter(QueuedReceiptAdapter());
  }

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize Supabase
  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
  );

  // Reinstall cleanup: best-effort delete-account before clearing Keychain
  if (isReinstall) {
    final secureStorage = SecureStorageService();
    final refreshToken = await secureStorage.getRefreshToken();
    if (refreshToken != null) {
      try {
        await Supabase.instance.client.auth.setSession(refreshToken);
        final edgeFunctions = EdgeFunctionService(Supabase.instance.client);
        await edgeFunctions.deleteAccount();
        debugPrint('[REINSTALL] delete-account succeeded');
      } catch (e) {
        debugPrint('[REINSTALL] Best-effort delete-account failed: $e');
      }
      try {
        await Supabase.instance.client.auth.signOut();
      } catch (e) {
        debugPrint('[main] Sign out during reinstall cleanup failed: $e');
      }
    }
    await secureStorage.deleteAll();
    debugPrint('[REINSTALL] Orphaned Keychain data cleared');
  }

  // Keep refresh token in Keychain so reinstall cleanup can use it
  Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    if (data.event == AuthChangeEvent.signedIn ||
        data.event == AuthChangeEvent.tokenRefreshed) {
      final token = data.session?.refreshToken;
      if (token != null) {
        SecureStorageService().saveRefreshToken(token);
      }
    }
  });

  // Attempt early audio connect for incoming calls accepted via CallKit.
  // Must run AFTER Firebase + Supabase init, BEFORE Hive/PIN.
  // Non-blocking: returns false immediately if no pending accepted call.
  try {
    await EarlyCallConnectService.attemptEarlyConnect();
  } catch (e) {
    debugPrint('[main] Early call connect failed: $e');
  }

  // Initialize avatar and media path resolution (must be before any UI)
  await AvatarUtils.init();
  await MediaUtils.init();

  // Initialize Notification Service
  await NotificationService().initialize();

  // Initialize Call Service
  await CallService().initialize();

  // Debug: check session state after init
  if (kDebugMode) {
    final session = Supabase.instance.client.auth.currentSession;
    // ignore: avoid_print
    print('');
    // ignore: avoid_print
    print('╔════════════════════════════════════════╗');
    // ignore: avoid_print
    print('║       SUPABASE SESSION STATUS          ║');
    // ignore: avoid_print
    print('╠════════════════════════════════════════╣');
    // ignore: avoid_print
    print('║ Session exists: ${session != null}');
    // ignore: avoid_print
    print('║ User ID: ${session?.user.id ?? "NULL"}');
    // ignore: avoid_print
    print('╚════════════════════════════════════════╝');
    // ignore: avoid_print
    print('');
  }

  runApp(
    const ProviderScope(
      child: HashApp(),
    ),
  );
}

class HashApp extends ConsumerStatefulWidget {
  const HashApp({super.key});

  @override
  ConsumerState<HashApp> createState() => _HashAppState();
}

class _HashAppState extends ConsumerState<HashApp> {
  @override
  void initState() {
    super.initState();
    // Force-read callStateProvider so CallKit callbacks are wired early
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(callStateProvider);

      // Apply privacy screen setting on startup
      final settings = ref.read(appSettingsProvider);
      PrivacyScreenService.setEnabled(settings.screenshotProtectionEnabled);
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final settings = ref.watch(appSettingsProvider);
    final showCallOverlay = ref.watch(showCallOverlayProvider);
    final isCallActive = ref.watch(callStateProvider.select((s) => s.isActive));
    final isBypass = ref.watch(callBypassProvider);

    // Listen for call navigation triggers
    ref.listen<String?>(callNavigationProvider, (previous, next) {
      if (next == null) return;
      FocusManager.instance.primaryFocus?.unfocus();
      debugPrint('[HashApp] Call navigation: $next');
      if (next == 'call') {
        final cs = ref.read(callStateProvider);
        router.pushNamed('call', pathParameters: {
          'contactId': cs.remoteContact?.odid ?? '',
        }, extra: cs.callType);
      }
      // Reset after navigation
      ref.read(callNavigationProvider.notifier).state = null;
    });

    // Listen for call ended during bypass → navigate to PIN screen
    ref.listen<bool>(callEndedDuringBypassProvider, (previous, next) {
      if (next) {
        ref.read(callEndedDuringBypassProvider.notifier).state = false;
        router.go(AppRoutes.pinEntry);
      }
    });

    // Si 'auto', on laisse Flutter utiliser la langue du système
    // Sinon on utilise la langue choisie manuellement
    final Locale? locale;
    if (settings.locale == 'auto') {
      locale = null;
    } else if (settings.locale == 'zh_Hant') {
      locale = const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
    } else if (settings.locale == 'zh_Hant_HK') {
      locale = const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK');
    } else if (settings.locale == 'pt_BR') {
      locale = const Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR');
    } else if (settings.locale == 'pt_PT') {
      locale = const Locale.fromSubtags(languageCode: 'pt', countryCode: 'PT');
    } else {
      locale = Locale(settings.locale);
    }

    return MaterialApp.router(
      title: 'Hash',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
        Locale('af'),
        Locale('ar'),
        Locale('az'),
        Locale('bg'),
        Locale('bn'),
        Locale('bs'),
        Locale('ca'),
        Locale('cs'),
        Locale('da'),
        Locale('de'),
        Locale('el'),
        Locale('es'),
        Locale('et'),
        Locale('eu'),
        Locale('fa'),
        Locale.fromSubtags(languageCode: 'fil'),
        Locale('fi'),
        Locale('ga'),
        Locale('gl'),
        Locale('gu'),
        Locale('he'),
        Locale('hi'),
        Locale('hr'),
        Locale('hu'),
        Locale('id'),
        Locale('it'),
        Locale('ja'),
        Locale('ka'),
        Locale('kk'),
        Locale('km'),
        Locale('kn'),
        Locale('ko'),
        Locale('ky'),
        Locale('lt'),
        Locale('lv'),
        Locale('mk'),
        Locale('ml'),
        Locale('mr'),
        Locale('ms'),
        Locale('my'),
        Locale('nb'),
        Locale('nl'),
        Locale('pa'),
        Locale('pl'),
        Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
        Locale.fromSubtags(languageCode: 'pt', countryCode: 'PT'),
        Locale('pt'),
        Locale('ro'),
        Locale('ru'),
        Locale('sk'),
        Locale('sl'),
        Locale('sq'),
        Locale('sr'),
        Locale('sv'),
        Locale('sw'),
        Locale('ta'),
        Locale('te'),
        Locale('th'),
        Locale('tr'),
        Locale('ug'),
        Locale('uk'),
        Locale('ur'),
        Locale('vi'),
        Locale.fromSubtags(languageCode: 'zh'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'),
      ],
      builder: (context, child) {
        return ShakeLockWrapper(
          child: Stack(
            children: [
              child ?? const SizedBox.shrink(),
              const IncomingRequestBanner(),
              if (showCallOverlay) const IncomingCallOverlay(),
              // Floating call widget handles its own visibility via
              // isOnActiveCallScreenProvider — always in the tree when
              // a call is active so it can react to provider changes
              // Hide during bypass to avoid leaking caller info without PIN
              if (isCallActive && !isBypass) const FloatingCallWidget(),
            ],
          ),
        );
      },
    );
  }
}
