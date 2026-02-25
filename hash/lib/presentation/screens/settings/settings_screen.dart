import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/legal_urls.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/router/app_router.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/notification_preferences_sync.dart';
import '../../../core/services/privacy_screen_service.dart';
import '../../../core/services/ui_sound_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import '../../providers/contact_request_providers.dart';
import '../home/home_screen.dart' show showAccountNotFoundDialog;
import '../../widgets/common/hash_text_field.dart';
import '../../widgets/common/animated_appbar_title.dart';
import '../../widgets/common/hash_snack_bar.dart';
import 'ephemeral_settings_screen.dart';
import 'security_explanation_screen.dart';
import 'maintenance_screen.dart';
import 'language_picker_screen.dart';

class SettingsScreen extends ConsumerWidget {
  final bool isTab;

  const SettingsScreen({super.key, this.isTab = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(appSettingsProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    String getThemeSubtitle() {
      switch (settings.themeMode) {
        case ThemeMode.dark:
          return l10n.themeDark;
        case ThemeMode.light:
          return l10n.themeLight;
        case ThemeMode.system:
          return l10n.themeAuto;
      }
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        automaticallyImplyLeading: !isTab,
        centerTitle: true,
        leading: isTab
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
                onPressed: () => context.pop(),
              ),
        title: isTab
            ? AnimatedHashAppBarTitle(
                title: l10n.settings,
                tabIndex: 3,
                isOnGlass: true,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/icons/hash_icons.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    l10n.settings,
                    style: AppTypography.headlineSmall(color: GlassTheme.glassTextColor(isDark)),
                  ),
                ],
              ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + kToolbarHeight + 16, 16, isTab ? 100 : 16),
        children: [
          // Account not found alert banner
          if (ref.watch(accountNotFoundProvider))
            _AccountNotFoundBanner(
              onCreateAccount: () async {
                final edgeFunctions = ref.read(edgeFunctionServiceProvider);
                final result = await showAccountNotFoundDialog(
                  context,
                  onRetry: () async {
                    try {
                      // Double-check avec deux endpoints indépendants
                      await edgeFunctions.call('get-pending-requests');
                      await edgeFunctions.call('get-sent-requests');
                      return true;
                    } catch (_) {
                      return false;
                    }
                  },
                );
                if (result == 'create' && context.mounted) {
                  final secureStorage = ref.read(secureStorageProvider);
                  final localStorage = ref.read(localStorageProvider);
                  try {
                    await Supabase.instance.client.auth.signOut();
                  } catch (e) {
                    debugPrint('[SettingsScreen] Sign out during account reset failed: $e');
                  }
                  await localStorage.deleteAllData();
                  await secureStorage.deleteAll();
                  clearAllProviderState(ref);
                  if (context.mounted) {
                    context.go(AppRoutes.onboarding);
                  }
                } else if (result == 'retry') {
                  ref.read(accountNotFoundProvider.notifier).state = false;
                }
              },
            ),

          // Donation section
          _DonationCard(
            onTap: () => _openDonationPage(),
          ),

          const SizedBox(height: 16),

          // Share app section
          _ShareAppCard(
            onTap: () => _shareApp(context),
          ),

          const SizedBox(height: 8),

          // Rate app button
          _RateAppCard(
            onTap: () => _openStorePage(),
          ),

          const SizedBox(height: 8),

          Builder(
            builder: (context) {
              final isDark = Theme.of(context).brightness == Brightness.dark;
              return Container(
                clipBehavior: Clip.antiAlias,
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
                child: _SettingsTile(
                  icon: Icons.shield_outlined,
                  title: l10n.howHashProtectsYou,
                  subtitle: l10n.howHashProtectsYouSubtitle,
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SecurityExplanationScreen(),
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          // Settings sections
          _SettingsSection(
            title: l10n.appearance,
            children: [
              _SettingsTile(
                icon: Icons.palette_outlined,
                title: l10n.theme,
                subtitle: getThemeSubtitle(),
                onTap: () => context.push(AppRoutes.appearanceSettings),
              ),
              _SettingsTile(
                icon: Icons.language_outlined,
                title: l10n.language,
                subtitle: _getLanguageName(context, settings.locale),
                onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => LanguagePickerScreen(
                    currentLocale: settings.locale,
                  ),
                ),
              ),
              ),
              _SettingsTile(
                icon: Icons.app_shortcut_outlined,
                title: l10n.appIcon,
                subtitle: l10n.appIconSubtitle,
                onTap: () => context.push(AppRoutes.appIconSettings),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _SettingsSection(
            title: l10n.notifications,
            children: [
              _SettingsTile(
                icon: Icons.chat_bubble_outline,
                title: l10n.messages,
                trailing: Switch(
                  value: settings.messageNotificationsEnabled,
                  onChanged: (_) =>
                      ref.read(appSettingsProvider.notifier).toggleMessageNotifications(),
                ),
              ),
              _SettingsTile(
                icon: Icons.phone_outlined,
                title: l10n.calls,
                trailing: Switch(
                  value: settings.callNotificationsEnabled,
                  onChanged: (_) =>
                      ref.read(appSettingsProvider.notifier).toggleCallNotifications(),
                ),
              ),
              _SettingsTile(
                icon: Icons.visibility_outlined,
                title: l10n.notificationContent,
                subtitle: _getNotificationContentLabel(context, settings.notificationContentLevel),
                onTap: () => _showNotificationContentPicker(context, ref, settings.notificationContentLevel),
              ),
              _SettingsTile(
                icon: Icons.music_note_outlined,
                title: 'Son de notification',
                subtitle: UiSoundService.notificationSounds[settings.notificationSound] ?? 'Bell',
                onTap: () => context.push(AppRoutes.notificationSound),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Feedback section (vibration)
          _SettingsSection(
            title: 'Préférences',
            children: [
              _SettingsTile(
                icon: Icons.volume_up_outlined,
                title: 'Sons de messages',
                subtitle: 'Jouer un son à l\'envoi et à la réception des messages',
                trailing: Switch(
                  value: settings.sendSoundEnabled && settings.receiveSoundEnabled,
                  onChanged: (value) {
                    final newSettings = settings.copyWith(
                      sendSoundEnabled: value,
                      receiveSoundEnabled: value,
                    );
                    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                  },
                ),
              ),
              _SettingsTile(
                icon: Icons.done_all,
                title: 'Confirmations de lecture',
                subtitle: 'Indiquer quand vous avez lu un message',
                trailing: Switch(
                  value: settings.sendReadReceipts,
                  onChanged: (value) {
                    final newSettings = settings.copyWith(sendReadReceipts: value);
                    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                  },
                ),
              ),
              _SettingsTile(
                icon: Icons.history,
                title: 'Appels récents',
                subtitle: 'Afficher les appels Hash dans l\'historique du téléphone',
                trailing: Switch(
                  value: settings.showCallsInRecents,
                  onChanged: (value) {
                    final newSettings = settings.copyWith(showCallsInRecents: value);
                    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                  },
                ),
              ),
              _SettingsTile(
                icon: Icons.visibility_off_outlined,
                title: 'Masquer les aperçus',
                subtitle: 'Cache le contenu des messages dans la liste des conversations',
                trailing: Switch(
                  value: settings.hideMessagePreviews,
                  onChanged: (value) {
                    final newSettings = settings.copyWith(hideMessagePreviews: value);
                    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                  },
                ),
              ),
              _SettingsTile(
                icon: Icons.shield_outlined,
                title: 'Écran de confidentialité',
                subtitle: 'Masque le contenu dans le multitâche',
                trailing: Switch(
                  value: settings.screenshotProtectionEnabled,
                  onChanged: (value) {
                    final newSettings = settings.copyWith(screenshotProtectionEnabled: value);
                    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                    PrivacyScreenService.setEnabled(value);
                  },
                ),
              ),
              _SettingsTile(
                icon: Icons.timer_outlined,
                title: l10n.ephemeralMessages,
                subtitle: EphemeralSettingsScreen.getDurationLabel(settings.defaultEphemeralDuration),
                onTap: () => context.push(AppRoutes.ephemeralSettings),
              ),
              _SettingsTile(
                icon: Icons.vibration,
                title: 'Verrouillage par secousse',
                subtitle: 'Secouer le téléphone pour verrouiller',
                trailing: Switch(
                  value: settings.shakeLockEnabled,
                  onChanged: (value) {
                    final newSettings = settings.copyWith(shakeLockEnabled: value);
                    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _SettingsSection(
            title: l10n.security,
            children: [
              _SettingsTile(
                leadingWidget: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'assets/icons/hash_icons.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                title: l10n.pinCode,
                subtitle: l10n.pinCodeForEntry,
                textColor: AppColors.accentPrimary,
                onTap: () => _verifyPinAndNavigate(context, ref, AppRoutes.entryPinSettings),
              ),
              _SettingsTile(
                leadingWidget: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'assets/images/mode_vash.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                title: l10n.vashCodeSection,
                subtitle: 'Code Vash et options',
                textColor: AppColors.error,
                onTap: () => _verifyPinAndNavigate(context, ref, AppRoutes.destructionPinSettings),
              ),
              _SettingsTile(
                icon: Icons.phone_android_outlined,
                title: l10n.transferDevice,
                subtitle: l10n.transferDeviceSubtitle,
                onTap: () => context.push(AppRoutes.transferAccount),
              ),
              _SettingsTile(
                icon: Icons.history_outlined,
                title: 'Connexions récentes',
                subtitle: '${_getRecentLoginCount(settings.loginTimestamps)} connexion(s) en 24h',
                onTap: () => context.push(AppRoutes.loginLogs),
              ),
              _SettingsTile(
                icon: Icons.storage_outlined,
                title: l10n.deviceData,
                subtitle: l10n.deviceDataSubtitle,
                onTap: () => _verifyPinAndNavigate(context, ref, AppRoutes.dataOverview),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Support section
          _SettingsSection(
            title: l10n.support,
            children: [
              _SettingsTile(
                icon: Icons.construction_outlined,
                title: 'Maintenance',
                subtitle: 'Voir les maintenances prévues',
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MaintenanceScreen(),
                  ),
                ),
              ),
              _SettingsTile(
                icon: Icons.mail_outline,
                title: l10n.contactSupport,
                subtitle: l10n.contactSupportSubtitle,
                onTap: () => _launchEmail('hash-support@devolim.fr'),
              ),
              _SettingsTile(
                icon: Icons.report_outlined,
                title: l10n.reportAbuse,
                subtitle: l10n.reportAbuseSubtitle,
                onTap: () => _launchEmail('hash-abuse@devolim.fr'),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Legal section
          _SettingsSection(
            title: l10n.legal,
            children: [
              _SettingsTile(
                icon: Icons.privacy_tip_outlined,
                title: l10n.privacyPolicy,
                onTap: () => _launchUrl(LegalUrls.privacyPolicy(Localizations.localeOf(context))),
              ),
              _SettingsTile(
                icon: Icons.description_outlined,
                title: l10n.termsOfService,
                onTap: () => _launchUrl(LegalUrls.termsOfService(Localizations.localeOf(context))),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Delete account
          _SettingsTile(
            icon: Icons.delete_forever_outlined,
            title: l10n.deleteAccount,
            subtitle: l10n.deleteAccountSubtitle,
            textColor: AppColors.error,
            onTap: () => _showDeleteAccountConfirmation(context, ref),
          ),

          const SizedBox(height: 32),

          // Version info
          Center(
            child: Column(
              children: [
                Text(
                  l10n.version('1.0.0'),
                  style: AppTypography.labelMedium(color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _shareApp(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final box = context.findRenderObject() as RenderBox?;
    final sharePosition = box != null
        ? box.localToGlobal(Offset.zero) & box.size
        : Rect.fromCenter(
            center: const Offset(200, 400), width: 100, height: 100);

    Share.share(
      l10n.shareMessage,
      sharePositionOrigin: sharePosition,
    );
  }

  static Future<void> _openStorePage() async {
    final uri = Platform.isIOS
        ? Uri.parse('https://apps.apple.com/app/hash-messenger/id0000000000')
        : Uri.parse('https://play.google.com/store/apps/details?id=com.devolim.hash');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openDonationPage() async {
    final uri = Uri.parse(const String.fromEnvironment('DONATE_URL'));
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    }
  }

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    }
  }

  static Future<void> _launchEmail(String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _verifyPinAndNavigate(BuildContext context, WidgetRef ref, String route) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: _PinVerificationSheet(
          onVerified: () {
            Navigator.pop(context);
            context.push(route);
          },
        ),
      ),
    );
  }

  static const _languageNames = <String, String>{
    'af': 'Afrikaans',
    'ar': 'العربية',
    'az': 'Azərbaycanca',
    'bg': 'Български',
    'bn': 'বাংলা',
    'bs': 'Bosanski',
    'ca': 'Català',
    'cs': 'Česky',
    'da': 'Dansk',
    'de': 'Deutsch',
    'el': 'Ελληνικά',
    'en': 'English',
    'es': 'Español',
    'et': 'Eesti',
    'eu': 'Euskera',
    'fa': 'فارسی',
    'fi': 'Suomi',
    'fil': 'Filipino',
    'fr': 'Français',
    'ga': 'Gaeilge',
    'gl': 'Galego',
    'gu': 'ગુજરાતી',
    'he': 'עִבְרִית',
    'hi': 'हिन्दी',
    'hr': 'Hrvatski',
    'hu': 'Magyar',
    'id': 'Bahasa Indonesia',
    'it': 'Italiano',
    'ja': '日本語',
    'ka': 'ქართული',
    'kk': 'Қазақша',
    'km': 'ខ្មែរ',
    'kn': 'ಕನ್ನಡ',
    'ko': '한국어',
    'ky': 'Кыргызча',
    'lt': 'Lietuviškai',
    'lv': 'Latviešu',
    'mk': 'Македонски',
    'ml': 'മലയാളം',
    'mr': 'मराठी',
    'ms': 'Bahasa Melayu',
    'my': 'မြန်မာ',
    'nb': 'Norsk',
    'nl': 'Nederlands',
    'pa': 'ਪੰਜਾਬੀ',
    'pl': 'Polski',
    'pt': 'Português',
    'pt_BR': 'Português (Brasil)',
    'pt_PT': 'Português (Portugal)',
    'ro': 'Română',
    'ru': 'Русский',
    'sk': 'Slovenčina',
    'sl': 'Slovenščina',
    'sq': 'Shqip',
    'sr': 'Српски',
    'sv': 'Svenska',
    'sw': 'Kiswahili',
    'ta': 'தமிழ்',
    'te': 'తెలుగు',
    'th': 'ภาษาไทย',
    'tr': 'Türkçe',
    'ug': 'ئۇيغۇرچە',
    'uk': 'Українська',
    'ur': 'اردو',
    'vi': 'Tiếng Việt',
    'zh': '简体中文',
    'zh_Hant': '繁體中文',
    'zh_Hant_HK': '廣東話',
  };

  String _getLanguageName(BuildContext context, String locale) {
    if (locale == 'auto') return AppLocalizations.of(context)!.languageAuto;
    return _languageNames[locale] ?? locale;
  }


  String _getNotificationContentLabel(BuildContext context, String level) {
    final l10n = AppLocalizations.of(context)!;
    switch (level) {
      case 'custom':
        return 'Personnalisé';
      case 'discrete':
      default:
        return l10n.notificationContentDiscrete;
    }
  }

  void _showNotificationContentPicker(BuildContext context, WidgetRef ref, String currentLevel) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final options = <Map<String, dynamic>>[
      {
        'code': 'discrete',
        'name': l10n.notificationContentDiscrete,
        'description': 'Affiche "Hash - Nouveau message"',
        'icon': Icons.visibility_off,
      },
      {
        'code': 'custom',
        'name': 'Personnalisé',
        'description': 'Votre texte personnalisé',
        'icon': Icons.edit,
      },
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      l10n.notificationContent,
                      style: AppTypography.headlineSmall(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                final code = option['code'] as String;
                final name = option['name'] as String;
                final description = option['description'] as String;
                final icon = option['icon'] as IconData;
                final isSelected = code == currentLevel;

                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? GlassTheme.glassIconColor(isDark).withValues(alpha: 0.15)
                          : (isDark ? AppColors.darkBorder : AppColors.lightBorder)
                              .withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        size: 20,
                        color: isSelected
                            ? GlassTheme.glassIconColor(isDark)
                            : (isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight),
                      ),
                    ),
                  ),
                  title: Text(
                    name,
                    style: AppTypography.bodyLarge(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ).copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    description,
                    style: AppTypography.bodySmall(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check_circle, color: GlassTheme.glassIconColor(isDark))
                      : null,
                  onTap: () async {
                    if (code == 'custom') {
                      Navigator.pop(context);
                      _showCustomNotificationDialog(context, ref);
                    } else {
                      final newSettings = ref.read(appSettingsProvider).copyWith(
                        notificationContentLevel: code,
                      );
                      ref.read(appSettingsProvider.notifier).updateSettings(newSettings);

                      // Save to SharedPreferences for background handler (Android)
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('notification_content_level', code);

                      // Sync to iOS Notification Service Extension
                      if (Platform.isIOS) {
                        await NotificationPreferencesSync.syncPreferences(
                          contentLevel: code,
                          customTitle: newSettings.customNotificationTitle,
                          customBody: newSettings.customNotificationBody,
                        );
                      }

                      Navigator.pop(context);
                    }
                  },
                );
              },
            ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      ),
    );
  }

  void _showCustomNotificationDialog(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final settings = ref.read(appSettingsProvider);

    // Limites de caractères pour assurer la lisibilité sur tous les appareils
    const int maxTitleLength = 30;
    const int maxBodyLength = 100;

    final titleController = TextEditingController(
      text: settings.customNotificationTitle.isEmpty ? 'Hash' : settings.customNotificationTitle,
    );
    final bodyController = TextEditingController(
      text: settings.customNotificationBody.isEmpty ? 'Nouveau message' : settings.customNotificationBody,
    );

    showDialog(
      context: context,
      builder: (context) => GlassTheme.glassDialog(
        context: context,
        title: Text(
          'Notification personnalisée',
          style: AppTypography.headlineSmall(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ce texte s\'affichera toujours, même si Hash est fermée.',
              style: AppTypography.bodySmall(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              maxLength: maxTitleLength,
              decoration: InputDecoration(
                labelText: 'Titre',
                hintText: 'Ex: Rappel, Alerte...',
                helperText: 'Visible en gras sur la notification',
                labelStyle: AppTypography.bodySmall(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
                helperStyle: AppTypography.labelSmall(
                  color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.accentPrimary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bodyController,
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
              maxLength: maxBodyLength,
              decoration: InputDecoration(
                labelText: 'Message',
                hintText: 'Ex: Vous avez une notification',
                helperText: 'Texte sous le titre',
                labelStyle: AppTypography.bodySmall(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
                helperStyle: AppTypography.labelSmall(
                  color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.accentPrimary, width: 2),
                ),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Annuler',
              style: AppTypography.bodyMedium(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              final customTitle = titleController.text.trim();
              final customBody = bodyController.text.trim();

              final newSettings = settings.copyWith(
                notificationContentLevel: 'custom',
                customNotificationTitle: customTitle,
                customNotificationBody: customBody,
              );
              ref.read(appSettingsProvider.notifier).updateSettings(newSettings);

              // Save to SharedPreferences for background handler (Android)
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('notification_content_level', 'custom');
              await prefs.setString('notification_custom_title', customTitle);
              await prefs.setString('notification_custom_body', customBody);

              // Sync to iOS Notification Service Extension
              if (Platform.isIOS) {
                await NotificationPreferencesSync.syncPreferences(
                  contentLevel: 'custom',
                  customTitle: customTitle,
                  customBody: customBody,
                );
              }

              Navigator.pop(context);
            },
            child: Text(
              'Enregistrer',
              style: AppTypography.bodyMedium(
                color: AppColors.accentPrimary,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  int _getRecentLoginCount(List<int> timestamps) {
    final cutoff = DateTime.now().millisecondsSinceEpoch -
        const Duration(hours: 24).inMilliseconds;
    return timestamps.where((ts) => ts > cutoff).length;
  }

  Future<void> _showDeleteAccountConfirmation(
      BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Step 1: PIN verification via bottom sheet
    final pinCompleter = Completer<bool>();
    if (!context.mounted) return;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: _PinVerificationSheet(
          onVerified: () {
            Navigator.pop(context);
            pinCompleter.complete(true);
          },
        ),
      ),
    );

    if (!pinCompleter.isCompleted) pinCompleter.complete(false);
    final pinVerified = await pinCompleter.future;

    if (!pinVerified || !context.mounted) return;

    // Step 2: Show beautiful confirmation dialog
    final user = ref.read(currentUserProvider);
    final userHashId = user?.hashId ?? '';

    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        var idMatches = false;
        return StatefulBuilder(
          builder: (context, setState) => GlassTheme.glassAlertDialog(
            context: context,
            icon: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete_forever_rounded,
                color: AppColors.error,
                size: 28,
              ),
            ),
            title: l10n.deleteAccountConfirmTitle,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.deleteAccountConfirmMessage,
                  style: AppTypography.bodyMedium(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.typeWordToConfirm,
                  style: AppTypography.bodyMedium(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.black.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.08)
                          : Colors.black.withValues(alpha: 0.08),
                    ),
                  ),
                  child: SelectableText(
                    userHashId,
                    style: AppTypography.headlineSmall(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ).copyWith(letterSpacing: 1.2),
                  ),
                ),
                const SizedBox(height: 16),
                HashTextField(
                  hintText: userHashId,
                  onChanged: (value) {
                    final matches = value.trim().toUpperCase() ==
                        userHashId.toUpperCase();
                    if (matches != idMatches) {
                      setState(() => idMatches = matches);
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: Text(l10n.cancel),
              ),
              ElevatedButton(
                onPressed: idMatches
                    ? () => Navigator.pop(dialogContext, true)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  disabledBackgroundColor:
                      AppColors.error.withValues(alpha: 0.3),
                ),
                child: Text(l10n.deleteForever),
              ),
            ],
          ),
        );
      },
    );

    if (confirmed != true || !context.mounted) return;

    // Step 3: Proceed with deletion — notify contacts then delete
    final statusNotifier = ValueNotifier<String>(l10n.notifyingContacts);
    final progressNotifier = ValueNotifier<double?>(0);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GlassTheme.wrapAlertDialog(
        context,
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder<double?>(
                valueListenable: progressNotifier,
                builder: (context, progress, _) => progress != null
                    ? LinearProgressIndicator(
                        value: progress,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.accentPrimary),
                        backgroundColor:
                            AppColors.accentPrimary.withValues(alpha: 0.2),
                      )
                    : const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.accentPrimary),
                      ),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<String>(
                valueListenable: statusNotifier,
                builder: (context, status, _) => Text(
                  status,
                  style: AppTypography.bodyMedium(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    try {
      // 1. Notify contacts (best effort, 10s timeout)
      await _notifyContactsBeforeDeletion(ref, progressNotifier);

      // 2. Switch to indeterminate progress for server deletion
      if (context.mounted) {
        statusNotifier.value = l10n.deletingAccount;
        progressNotifier.value = null;
      }

      // 3. Delete account from server
      final userRepo = ref.read(userRepositoryProvider);
      await userRepo.deleteAccount();

      // 4. Sign out from Supabase
      await userRepo.signOut();

      // 5. Clear all local data
      final authService = ref.read(authServiceProvider);
      await authService.clearAllLocalData();

      // 6. Reset providers
      ref.read(currentUserProvider.notifier).clearUser();
      ref.read(contactsProvider.notifier).clear();
      ref.read(contactRequestsProvider.notifier).stopListening();

      if (!context.mounted) return;

      // Close loading dialog
      Navigator.pop(context);

      // Navigate to onboarding
      context.go(AppRoutes.onboarding);
    } catch (e) {
      if (!context.mounted) return;

      // Close loading dialog
      Navigator.pop(context);

      showHashSnackBar(context,
          message: l10n.deletionError(e.toString()),
          type: HashSnackBarType.error);
    }
  }

  /// Notify all contacts that this account is being deleted.
  /// Best effort — failures are silently ignored. 10s global timeout.
  Future<void> _notifyContactsBeforeDeletion(
    WidgetRef ref,
    ValueNotifier<double?> progressNotifier,
  ) async {
    final contacts = ref.read(contactsProvider);
    final mailboxService = ref.read(anonymousMailboxServiceProvider);

    // Filter contacts that can receive sealed messages
    final notifiableContacts = contacts.where((c) =>
        c.mailboxToken != null &&
        c.sealedSenderPublicKey != null &&
        c.sendToken != null).toList();

    if (notifiableContacts.isEmpty) return;

    final payload = jsonEncode({
      'type': 'account_deleted',
      'timestamp': DateTime.now().toUtc().toIso8601String(),
    });
    final messageBytes = Uint8List.fromList(utf8.encode(payload));

    var completed = 0;
    final total = notifiableContacts.length;

    Future<void> notifyContact(contact) async {
      try {
        await mailboxService.sendSealedMessage(
          recipientMailboxToken: contact.mailboxToken!,
          messageContent: messageBytes,
          recipientSealedPublicKey: contact.sealedSenderPublicKey!,
          sendToken: contact.sendToken,
        );
      } catch (_) {
        // Best effort — ignore individual failures
      } finally {
        completed++;
        progressNotifier.value = completed / total;
      }
    }

    try {
      await Future.wait(
        notifiableContacts.map(notifyContact),
      ).timeout(const Duration(seconds: 10));
    } catch (_) {
      // Timeout or other error — continue with deletion
    }
  }
}

class _AccountNotFoundBanner extends StatelessWidget {
  final VoidCallback onCreateAccount;

  const _AccountNotFoundBanner({required this.onCreateAccount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
              onPressed: onCreateAccount,
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
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool isDanger;

  const _SettingsSection({
    required this.title,
    required this.children,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: AppTypography.labelSmall(
              color: isDanger ? AppColors.error : secondaryColor,
            ).copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: isDanger
                ? Border.all(color: AppColors.error.withValues(alpha: 0.25))
                : Border.all(
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
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
                  Padding(
                    padding: const EdgeInsets.only(left: 66),
                    child: Divider(
                      height: 0.5,
                      thickness: 0.5,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.08),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData? icon;
  final Widget? leadingWidget;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? textColor;

  const _SettingsTile({
    this.icon,
    this.leadingWidget,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.textColor,
  }) : assert(icon != null || leadingWidget != null);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final tertiaryColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
    final iconTint = textColor ?? AppColors.accentPrimary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: iconTint.withValues(alpha: 0.08),
        highlightColor: iconTint.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              if (leadingWidget != null)
                leadingWidget!
              else
                Icon(
                  icon,
                  color: iconTint,
                  size: 24,
                ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyMedium(
                        color: textColor ?? primaryColor,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          subtitle!,
                          style: AppTypography.bodySmall(
                            color: textColor?.withValues(alpha: 0.7) ??
                                tertiaryColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else if (onTap != null)
                Icon(
                  Icons.chevron_right_rounded,
                  color: tertiaryColor,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DonationCard extends StatelessWidget {
  final VoidCallback onTap;

  const _DonationCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.accentPrimary.withValues(alpha: 0.15),
            AppColors.accentPrimary.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accentPrimary.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.favorite_outline,
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
                      l10n.supportHash,
                      style: AppTypography.bodyLarge(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.supportHashSubtitle,
                      style: AppTypography.bodySmall(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.open_in_new, size: 18),
              label: Text(l10n.donate),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPrimary,
                foregroundColor: AppColors.darkBackground,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareAppCard extends StatelessWidget {
  final VoidCallback onTap;

  const _ShareAppCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tertiaryColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: AppColors.accentPrimary.withValues(alpha: 0.08),
        highlightColor: AppColors.accentPrimary.withValues(alpha: 0.04),
        child: Container(
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
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.35)
                      : AppColors.accentPrimary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.share_outlined,
                    color: AppColors.accentPrimary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.shareApp,
                      style: AppTypography.bodyMedium(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        l10n.shareAppSubtitle,
                        style: AppTypography.bodySmall(
                          color: tertiaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: tertiaryColor,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RateAppCard extends StatelessWidget {
  final VoidCallback onTap;

  const _RateAppCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tertiaryColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: AppColors.accentPrimary.withValues(alpha: 0.08),
        highlightColor: AppColors.accentPrimary.withValues(alpha: 0.04),
        child: Container(
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
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.35)
                      : AppColors.accentPrimary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.star_outline,
                    color: AppColors.accentPrimary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Noter l\'application',
                      style: AppTypography.bodyMedium(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        'Votre avis compte pour nous',
                        style: AppTypography.bodySmall(
                          color: tertiaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: tertiaryColor,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PinVerificationSheet extends ConsumerStatefulWidget {
  final VoidCallback onVerified;

  const _PinVerificationSheet({required this.onVerified});

  @override
  ConsumerState<_PinVerificationSheet> createState() => _PinVerificationSheetState();
}

class _PinVerificationSheetState extends ConsumerState<_PinVerificationSheet> {
  String? _error;
  int _failedAttempts = 0;
  static const int _maxAttempts = 3;

  void _onPinEntered(String pin) async {
    final l10n = AppLocalizations.of(context)!;
    final authService = ref.read(authServiceProvider);

    // Vérification locale uniquement — pas de recordFailedAttempt global
    final result = await authService.verifyPinOnly(pin);

    if (!mounted) return;

    if (result) {
      widget.onVerified();
    } else {
      _failedAttempts++;
      if (_failedAttempts >= _maxAttempts) {
        Navigator.pop(context);
        showHashSnackBar(context, message: l10n.tooManyAttempts, type: HashSnackBarType.error);
        return;
      }
      setState(() => _error = l10n.incorrectPin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),

          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.accentPrimary.withValues(alpha: 0.1)
                  : const Color(0x0A000000),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lock_outline,
              color: isDark ? AppColors.accentPrimary : const Color(0xFF666666),
              size: 36,
            ),
          ),
          const SizedBox(height: 24),

          Text(
            l10n.confirmWithPin,
            style: AppTypography.headlineSmall(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.enterPinToConfirm,
            style: AppTypography.bodyMedium(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          HashPinField(
            key: ValueKey('verify_pin_$_failedAttempts'),
            onCompleted: _onPinEntered,
            autofocus: true,
          ),

          if (_error != null) ...[
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
                  const Icon(Icons.error_outline, color: AppColors.error, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    _error!,
                    style: AppTypography.bodyMedium(color: AppColors.error),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 32),
        ],
        ),
      ),
    );
  }
}
