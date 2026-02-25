import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_az.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bs.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_km.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_my.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
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
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
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
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
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
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    Locale.fromSubtags(
      languageCode: 'zh',
      countryCode: 'HK',
      scriptCode: 'Hant',
    ),
  ];

  /// No description provided for @appName.
  ///
  /// In fr, this message translates to:
  /// **'Hash'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In fr, this message translates to:
  /// **'Zero Trace. Zero Compromise.'**
  String get appTagline;

  /// No description provided for @onboardingStatement1.
  ///
  /// In fr, this message translates to:
  /// **'La messagerie qui ne sait rien de vous.'**
  String get onboardingStatement1;

  /// No description provided for @onboardingStatement2.
  ///
  /// In fr, this message translates to:
  /// **'Chiffrement de bout en bout. Toujours.'**
  String get onboardingStatement2;

  /// No description provided for @onboardingStatement3.
  ///
  /// In fr, this message translates to:
  /// **'Code VASH : Tout s\'efface. Sans laisser de trace.'**
  String get onboardingStatement3;

  /// No description provided for @onboardingStatement4.
  ///
  /// In fr, this message translates to:
  /// **'Aucune publicité. Aucune revente de données.'**
  String get onboardingStatement4;

  /// No description provided for @onboardingStatement5.
  ///
  /// In fr, this message translates to:
  /// **'Conçu pour vous protéger. Pas pour vous monétiser.'**
  String get onboardingStatement5;

  /// No description provided for @onboardingStatement6.
  ///
  /// In fr, this message translates to:
  /// **'Un appareil. Un compte. Aucun cloud.'**
  String get onboardingStatement6;

  /// No description provided for @conversations.
  ///
  /// In fr, this message translates to:
  /// **'Chats'**
  String get conversations;

  /// No description provided for @contacts.
  ///
  /// In fr, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @noConversation.
  ///
  /// In fr, this message translates to:
  /// **'Aucun chat'**
  String get noConversation;

  /// No description provided for @noConversationSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez un contact pour commencer à discuter en toute sécurité'**
  String get noConversationSubtitle;

  /// No description provided for @pendingRequestsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 demande reçue} other{{count} demandes reçues}}'**
  String pendingRequestsCount(int count);

  /// No description provided for @sentRequestsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 demande envoyée en attente} other{{count} demandes envoyées en attente}}'**
  String sentRequestsCount(int count);

  /// No description provided for @addContact.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un contact'**
  String get addContact;

  /// No description provided for @shareApp.
  ///
  /// In fr, this message translates to:
  /// **'Partager l\'application'**
  String get shareApp;

  /// No description provided for @newMessage.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau message'**
  String get newMessage;

  /// No description provided for @newConversation.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer un message'**
  String get newConversation;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Réglages'**
  String get settings;

  /// No description provided for @myHashId.
  ///
  /// In fr, this message translates to:
  /// **'Mon ID Hash'**
  String get myHashId;

  /// No description provided for @supportHash.
  ///
  /// In fr, this message translates to:
  /// **'Soutenir Hash'**
  String get supportHash;

  /// No description provided for @supportHashSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Aidez-nous à protéger votre vie privée'**
  String get supportHashSubtitle;

  /// No description provided for @donate.
  ///
  /// In fr, this message translates to:
  /// **'Faire un don'**
  String get donate;

  /// No description provided for @appearance.
  ///
  /// In fr, this message translates to:
  /// **'Apparence'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In fr, this message translates to:
  /// **'Thème'**
  String get theme;

  /// No description provided for @themeAuto.
  ///
  /// In fr, this message translates to:
  /// **'Automatique'**
  String get themeAuto;

  /// No description provided for @themeAutoSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Suit les paramètres du système'**
  String get themeAutoSubtitle;

  /// No description provided for @themeDark.
  ///
  /// In fr, this message translates to:
  /// **'Sombre'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In fr, this message translates to:
  /// **'Clair'**
  String get themeLight;

  /// No description provided for @themeRecommendation.
  ///
  /// In fr, this message translates to:
  /// **'Le thème sombre est recommandé pour une meilleure discrétion'**
  String get themeRecommendation;

  /// No description provided for @language.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get language;

  /// No description provided for @languageAuto.
  ///
  /// In fr, this message translates to:
  /// **'Automatique (système)'**
  String get languageAuto;

  /// No description provided for @notifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @messages.
  ///
  /// In fr, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @calls.
  ///
  /// In fr, this message translates to:
  /// **'Appels'**
  String get calls;

  /// No description provided for @vibration.
  ///
  /// In fr, this message translates to:
  /// **'Vibration'**
  String get vibration;

  /// No description provided for @notificationContent.
  ///
  /// In fr, this message translates to:
  /// **'Contenu des notifications'**
  String get notificationContent;

  /// No description provided for @notificationContentFull.
  ///
  /// In fr, this message translates to:
  /// **'Afficher tout'**
  String get notificationContentFull;

  /// No description provided for @notificationContentFullDesc.
  ///
  /// In fr, this message translates to:
  /// **'Nom du contact et aperçu du message'**
  String get notificationContentFullDesc;

  /// No description provided for @notificationContentName.
  ///
  /// In fr, this message translates to:
  /// **'Nom uniquement'**
  String get notificationContentName;

  /// No description provided for @notificationContentNameDesc.
  ///
  /// In fr, this message translates to:
  /// **'Affiche seulement le nom du contact'**
  String get notificationContentNameDesc;

  /// No description provided for @notificationContentDiscrete.
  ///
  /// In fr, this message translates to:
  /// **'Discret'**
  String get notificationContentDiscrete;

  /// No description provided for @notificationContentDiscreteDesc.
  ///
  /// In fr, this message translates to:
  /// **'Affiche seulement \"Nouveau message\"'**
  String get notificationContentDiscreteDesc;

  /// No description provided for @security.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get security;

  /// No description provided for @howHashProtectsYou.
  ///
  /// In fr, this message translates to:
  /// **'Comment Hash te protège'**
  String get howHashProtectsYou;

  /// No description provided for @howHashProtectsYouSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comprendre ta sécurité'**
  String get howHashProtectsYouSubtitle;

  /// No description provided for @accountSecurity.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité du compte'**
  String get accountSecurity;

  /// No description provided for @accountSecuritySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'PIN, biométrie, Mode Vash'**
  String get accountSecuritySubtitle;

  /// No description provided for @blockScreenshots.
  ///
  /// In fr, this message translates to:
  /// **'Bloquer les captures d\'écran'**
  String get blockScreenshots;

  /// No description provided for @transferDevice.
  ///
  /// In fr, this message translates to:
  /// **'Transférer vers un autre appareil'**
  String get transferDevice;

  /// No description provided for @transferDeviceSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Migrer votre compte'**
  String get transferDeviceSubtitle;

  /// No description provided for @pinCode.
  ///
  /// In fr, this message translates to:
  /// **'Code PIN'**
  String get pinCode;

  /// No description provided for @changePin.
  ///
  /// In fr, this message translates to:
  /// **'Changer le code PIN'**
  String get changePin;

  /// No description provided for @currentPin.
  ///
  /// In fr, this message translates to:
  /// **'Code PIN actuel'**
  String get currentPin;

  /// No description provided for @newPin.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau code PIN'**
  String get newPin;

  /// No description provided for @confirmPin.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le code PIN'**
  String get confirmPin;

  /// No description provided for @pinChanged.
  ///
  /// In fr, this message translates to:
  /// **'Code PIN modifié'**
  String get pinChanged;

  /// No description provided for @incorrectPin.
  ///
  /// In fr, this message translates to:
  /// **'PIN incorrect'**
  String get incorrectPin;

  /// No description provided for @pinsDoNotMatch.
  ///
  /// In fr, this message translates to:
  /// **'Les codes ne correspondent pas'**
  String get pinsDoNotMatch;

  /// No description provided for @autoLock.
  ///
  /// In fr, this message translates to:
  /// **'Verrouillage automatique'**
  String get autoLock;

  /// No description provided for @autoLockDelay.
  ///
  /// In fr, this message translates to:
  /// **'Délai de verrouillage'**
  String get autoLockDelay;

  /// No description provided for @autoLockImmediate.
  ///
  /// In fr, this message translates to:
  /// **'Immédiat'**
  String get autoLockImmediate;

  /// No description provided for @autoLockMinute.
  ///
  /// In fr, this message translates to:
  /// **'1 minute'**
  String get autoLockMinute;

  /// No description provided for @autoLockMinutes.
  ///
  /// In fr, this message translates to:
  /// **'{count} minutes'**
  String autoLockMinutes(int count);

  /// No description provided for @vashCode.
  ///
  /// In fr, this message translates to:
  /// **'Code Vash'**
  String get vashCode;

  /// No description provided for @vashModeTitle.
  ///
  /// In fr, this message translates to:
  /// **'MODE VASH'**
  String get vashModeTitle;

  /// No description provided for @vashModeExplanation.
  ///
  /// In fr, this message translates to:
  /// **'Le code qui efface tout. Définitivement. En silence.'**
  String get vashModeExplanation;

  /// No description provided for @vashModeDescription.
  ///
  /// In fr, this message translates to:
  /// **'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.\n\nEn cas de contrainte, entrez votre code VASH au lieu de votre PIN. L\'app s\'ouvre normalement, mais en arrière-plan, tout est définitivement effacé.\n\nPour quiconque regarde votre écran, Hash apparaît simplement vide, comme si vous ne l\'aviez jamais utilisée.'**
  String get vashModeDescription;

  /// No description provided for @vashModeIrreversible.
  ///
  /// In fr, this message translates to:
  /// **'Silencieux et irréversible.'**
  String get vashModeIrreversible;

  /// No description provided for @chooseVashCode.
  ///
  /// In fr, this message translates to:
  /// **'Choisir mon code VASH'**
  String get chooseVashCode;

  /// No description provided for @vashCodeInfo.
  ///
  /// In fr, this message translates to:
  /// **'Un second code PIN qui ouvre l\'application normalement, mais vide.'**
  String get vashCodeInfo;

  /// No description provided for @vashModeDescription2.
  ///
  /// In fr, this message translates to:
  /// **'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.'**
  String get vashModeDescription2;

  /// No description provided for @vashCodeInfoDetail.
  ///
  /// In fr, this message translates to:
  /// **'Entrez ce code à la place de votre PIN : l\'app s\'ouvre normalement, mais les données cochées ci-dessous sont supprimées en silence. Irréversible.'**
  String get vashCodeInfoDetail;

  /// No description provided for @vashDeleteContacts.
  ///
  /// In fr, this message translates to:
  /// **'Vos contacts disparaissent'**
  String get vashDeleteContacts;

  /// No description provided for @vashDeleteMessages.
  ///
  /// In fr, this message translates to:
  /// **'Vos conversations disparaissent'**
  String get vashDeleteMessages;

  /// No description provided for @vashDeleteHistory.
  ///
  /// In fr, this message translates to:
  /// **'Vos notes disparaissent'**
  String get vashDeleteHistory;

  /// No description provided for @vashKeepId.
  ///
  /// In fr, this message translates to:
  /// **'Votre identité Hash (#XXX-XXX-XXX) reste la même'**
  String get vashKeepId;

  /// No description provided for @vashAppearNormal.
  ///
  /// In fr, this message translates to:
  /// **'L\'application apparaît normale mais vide, comme neuve. Cette action est irréversible.'**
  String get vashAppearNormal;

  /// No description provided for @setupVashCode.
  ///
  /// In fr, this message translates to:
  /// **'Configurer le code Vash'**
  String get setupVashCode;

  /// No description provided for @modifyVashCode.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le code Vash'**
  String get modifyVashCode;

  /// No description provided for @currentVashCode.
  ///
  /// In fr, this message translates to:
  /// **'Code Vash actuel'**
  String get currentVashCode;

  /// No description provided for @newVashCode.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau code Vash'**
  String get newVashCode;

  /// No description provided for @confirmVashCode.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le code Vash'**
  String get confirmVashCode;

  /// No description provided for @vashCodeConfigured.
  ///
  /// In fr, this message translates to:
  /// **'Code Vash configuré'**
  String get vashCodeConfigured;

  /// No description provided for @vashCodeModified.
  ///
  /// In fr, this message translates to:
  /// **'Code Vash modifié'**
  String get vashCodeModified;

  /// No description provided for @vashCodeMustDiffer.
  ///
  /// In fr, this message translates to:
  /// **'Le code Vash doit être différent du code PIN'**
  String get vashCodeMustDiffer;

  /// No description provided for @incorrectVashCode.
  ///
  /// In fr, this message translates to:
  /// **'Code Vash incorrect'**
  String get incorrectVashCode;

  /// No description provided for @vashWhatToDelete.
  ///
  /// In fr, this message translates to:
  /// **'DONNÉES SUPPRIMÉES AVEC LE CODE VASH'**
  String get vashWhatToDelete;

  /// No description provided for @vashDeleteContactsOption.
  ///
  /// In fr, this message translates to:
  /// **'Contacts'**
  String get vashDeleteContactsOption;

  /// No description provided for @vashDeleteContactsWarning.
  ///
  /// In fr, this message translates to:
  /// **'Vous devrez rajouter chaque contact manuellement'**
  String get vashDeleteContactsWarning;

  /// No description provided for @vashDeleteContactsConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.'**
  String get vashDeleteContactsConfirm;

  /// No description provided for @vashDeleteMessagesOption.
  ///
  /// In fr, this message translates to:
  /// **'Messages'**
  String get vashDeleteMessagesOption;

  /// No description provided for @vashDeleteMessagesWarning.
  ///
  /// In fr, this message translates to:
  /// **'Toutes vos conversations seront effacées'**
  String get vashDeleteMessagesWarning;

  /// No description provided for @vashDeleteNotesOption.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get vashDeleteNotesOption;

  /// No description provided for @vashDeleteNotesWarning.
  ///
  /// In fr, this message translates to:
  /// **'Toutes vos notes seront supprimées'**
  String get vashDeleteNotesWarning;

  /// No description provided for @vashActivated.
  ///
  /// In fr, this message translates to:
  /// **'Mode Vash activé'**
  String get vashActivated;

  /// No description provided for @vashCreateSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez un code différent de votre PIN principal'**
  String get vashCreateSubtitle;

  /// No description provided for @vashConfirmSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Confirmez votre code Vash'**
  String get vashConfirmSubtitle;

  /// No description provided for @pinCodeForEntry.
  ///
  /// In fr, this message translates to:
  /// **'Code PIN pour rentrer dans l\'application'**
  String get pinCodeForEntry;

  /// No description provided for @vashCodeSection.
  ///
  /// In fr, this message translates to:
  /// **'Mode Vash'**
  String get vashCodeSection;

  /// No description provided for @biometric.
  ///
  /// In fr, this message translates to:
  /// **'Biométrie'**
  String get biometric;

  /// No description provided for @biometricUnlock.
  ///
  /// In fr, this message translates to:
  /// **'Déverrouiller avec empreinte ou Face ID'**
  String get biometricUnlock;

  /// No description provided for @enableBiometric.
  ///
  /// In fr, this message translates to:
  /// **'Activer la biométrie'**
  String get enableBiometric;

  /// No description provided for @biometricWarningMessage.
  ///
  /// In fr, this message translates to:
  /// **'En activant la biométrie, vous ne pourrez pas utiliser votre code Vash pour entrer dans l\'application.\n\nVous pourrez uniquement utiliser le code Vash si la biométrie échoue (après plusieurs tentatives infructueuses).\n\nÊtes-vous sûr de vouloir continuer ?'**
  String get biometricWarningMessage;

  /// No description provided for @understood.
  ///
  /// In fr, this message translates to:
  /// **'J\'ai compris'**
  String get understood;

  /// No description provided for @shareAppSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Partagez Hash avec vos proches'**
  String get shareAppSubtitle;

  /// No description provided for @share.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get share;

  /// No description provided for @danger.
  ///
  /// In fr, this message translates to:
  /// **'Danger'**
  String get danger;

  /// No description provided for @deleteAccount.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer mon compte'**
  String get deleteAccount;

  /// No description provided for @deleteAccountSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Action irréversible'**
  String get deleteAccountSubtitle;

  /// No description provided for @deleteAccountConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer mon compte'**
  String get deleteAccountConfirmTitle;

  /// No description provided for @deleteAccountConfirmMessage.
  ///
  /// In fr, this message translates to:
  /// **'Votre compte sera définitivement supprimé ainsi que l\'ensemble de vos données. Cette action est irréversible, vous devrez créer un nouveau compte.'**
  String get deleteAccountConfirmMessage;

  /// No description provided for @deleteForever.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer définitivement'**
  String get deleteForever;

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @confirmationWord.
  ///
  /// In fr, this message translates to:
  /// **'SUPPRIMER'**
  String get confirmationWord;

  /// No description provided for @typeWordToConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Tapez votre Hash ID pour confirmer'**
  String get typeWordToConfirm;

  /// No description provided for @dataDeletedForSecurity.
  ///
  /// In fr, this message translates to:
  /// **'Mode Vash activé.'**
  String get dataDeletedForSecurity;

  /// No description provided for @deletionError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur lors de la suppression: {error}'**
  String deletionError(String error);

  /// No description provided for @yourSecurity.
  ///
  /// In fr, this message translates to:
  /// **'Votre sécurité'**
  String get yourSecurity;

  /// No description provided for @securityInfo.
  ///
  /// In fr, this message translates to:
  /// **'• Chiffrement de bout en bout (Signal Protocol)\n• Aucune donnée sur nos serveurs après livraison\n• Clés stockées uniquement sur votre appareil\n• Code PIN jamais envoyé au serveur'**
  String get securityInfo;

  /// No description provided for @version.
  ///
  /// In fr, this message translates to:
  /// **'Hash v{version}'**
  String version(String version);

  /// No description provided for @welcome.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue'**
  String get welcome;

  /// No description provided for @securityStatement1.
  ///
  /// In fr, this message translates to:
  /// **'Vos messages sont protégés.'**
  String get securityStatement1;

  /// No description provided for @securityStatement2.
  ///
  /// In fr, this message translates to:
  /// **'Chiffrement de bout en bout.'**
  String get securityStatement2;

  /// No description provided for @securityStatement3.
  ///
  /// In fr, this message translates to:
  /// **'Aucune trace. Aucun compromis.'**
  String get securityStatement3;

  /// No description provided for @securityStatement4.
  ///
  /// In fr, this message translates to:
  /// **'Votre vie privée est un droit.'**
  String get securityStatement4;

  /// No description provided for @accessBlocked.
  ///
  /// In fr, this message translates to:
  /// **'Accès bloqué'**
  String get accessBlocked;

  /// No description provided for @tooManyAttempts.
  ///
  /// In fr, this message translates to:
  /// **'Trop de tentatives. Réessayez plus tard.'**
  String get tooManyAttempts;

  /// No description provided for @pleaseWait.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez patienter'**
  String get pleaseWait;

  /// No description provided for @waitDelay.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez attendre la fin du délai'**
  String get waitDelay;

  /// No description provided for @attemptCount.
  ///
  /// In fr, this message translates to:
  /// **'Tentative {current} sur {max}'**
  String attemptCount(int current, int max);

  /// No description provided for @retryIn.
  ///
  /// In fr, this message translates to:
  /// **'Réessayez dans {time}'**
  String retryIn(String time);

  /// No description provided for @forgotPin.
  ///
  /// In fr, this message translates to:
  /// **'PIN oublié ? Utiliser la phrase de récupération'**
  String get forgotPin;

  /// No description provided for @useRecoveryPhrase.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser la phrase de récupération'**
  String get useRecoveryPhrase;

  /// No description provided for @recoveryWarningTitle.
  ///
  /// In fr, this message translates to:
  /// **'Attention'**
  String get recoveryWarningTitle;

  /// No description provided for @recoveryWarningMessage.
  ///
  /// In fr, this message translates to:
  /// **'La récupération du compte va :'**
  String get recoveryWarningMessage;

  /// No description provided for @recoveryDeleteAllMessages.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer TOUS vos messages'**
  String get recoveryDeleteAllMessages;

  /// No description provided for @recoveryWaitDelay.
  ///
  /// In fr, this message translates to:
  /// **'Imposer un délai de 1 heure'**
  String get recoveryWaitDelay;

  /// No description provided for @recoveryKeepContacts.
  ///
  /// In fr, this message translates to:
  /// **'Conserver vos contacts'**
  String get recoveryKeepContacts;

  /// No description provided for @recoveryIrreversible.
  ///
  /// In fr, this message translates to:
  /// **'Cette action est irréversible. Vos messages seront définitivement perdus.'**
  String get recoveryIrreversible;

  /// No description provided for @iUnderstand.
  ///
  /// In fr, this message translates to:
  /// **'Je comprends'**
  String get iUnderstand;

  /// No description provided for @accountRecovery.
  ///
  /// In fr, this message translates to:
  /// **'Récupération du compte'**
  String get accountRecovery;

  /// No description provided for @enterRecoveryPhrase.
  ///
  /// In fr, this message translates to:
  /// **'Entrez les 24 mots de votre phrase de récupération, séparés par des espaces.'**
  String get enterRecoveryPhrase;

  /// No description provided for @recoveryPhraseHint.
  ///
  /// In fr, this message translates to:
  /// **'word1 word2 word3 ...'**
  String get recoveryPhraseHint;

  /// No description provided for @recover.
  ///
  /// In fr, this message translates to:
  /// **'Récupérer'**
  String get recover;

  /// No description provided for @recoveryPhraseRequired.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer votre phrase de récupération'**
  String get recoveryPhraseRequired;

  /// No description provided for @recoveryPhrase24Words.
  ///
  /// In fr, this message translates to:
  /// **'La phrase doit contenir exactement 24 mots'**
  String get recoveryPhrase24Words;

  /// No description provided for @incorrectRecoveryPhrase.
  ///
  /// In fr, this message translates to:
  /// **'Phrase de récupération incorrecte'**
  String get incorrectRecoveryPhrase;

  /// No description provided for @recoveryInitError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur lors de l\'initialisation de la récupération'**
  String get recoveryInitError;

  /// No description provided for @securityDelay.
  ///
  /// In fr, this message translates to:
  /// **'Délai de sécurité'**
  String get securityDelay;

  /// No description provided for @securityDelayMessage.
  ///
  /// In fr, this message translates to:
  /// **'Pour votre sécurité, un délai d\'attente est requis avant de pouvoir créer un nouveau PIN.'**
  String get securityDelayMessage;

  /// No description provided for @timeRemaining.
  ///
  /// In fr, this message translates to:
  /// **'Temps restant'**
  String get timeRemaining;

  /// No description provided for @messagesDeletedForProtection.
  ///
  /// In fr, this message translates to:
  /// **'Vos messages ont été supprimés pour votre protection.'**
  String get messagesDeletedForProtection;

  /// No description provided for @canCloseApp.
  ///
  /// In fr, this message translates to:
  /// **'Vous pouvez fermer l\'application et revenir plus tard.'**
  String get canCloseApp;

  /// No description provided for @onboardingTitle1.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue sur Hash'**
  String get onboardingTitle1;

  /// No description provided for @onboardingSubtitle1.
  ///
  /// In fr, this message translates to:
  /// **'La messagerie qui ne laisse aucune trace'**
  String get onboardingSubtitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In fr, this message translates to:
  /// **'Chiffrement total'**
  String get onboardingTitle2;

  /// No description provided for @onboardingSubtitle2.
  ///
  /// In fr, this message translates to:
  /// **'Vos messages sont chiffrés de bout en bout avec le protocole Signal'**
  String get onboardingSubtitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In fr, this message translates to:
  /// **'Aucune trace'**
  String get onboardingTitle3;

  /// No description provided for @onboardingSubtitle3.
  ///
  /// In fr, this message translates to:
  /// **'Les messages sont supprimés des serveurs dès leur livraison'**
  String get onboardingSubtitle3;

  /// No description provided for @onboardingTitle4.
  ///
  /// In fr, this message translates to:
  /// **'Votre sécurité'**
  String get onboardingTitle4;

  /// No description provided for @onboardingSubtitle4.
  ///
  /// In fr, this message translates to:
  /// **'Code PIN, Mode Vash et phrase de récupération'**
  String get onboardingSubtitle4;

  /// No description provided for @getStarted.
  ///
  /// In fr, this message translates to:
  /// **'Commencer'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In fr, this message translates to:
  /// **'Passer'**
  String get skip;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In fr, this message translates to:
  /// **'J\'ai déjà un compte'**
  String get alreadyHaveAccount;

  /// No description provided for @transferMyAccount.
  ///
  /// In fr, this message translates to:
  /// **'Transférer mon compte'**
  String get transferMyAccount;

  /// No description provided for @createPin.
  ///
  /// In fr, this message translates to:
  /// **'Créer un code PIN'**
  String get createPin;

  /// No description provided for @createPinSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ce code protégera l\'accès à votre application'**
  String get createPinSubtitle;

  /// No description provided for @confirmYourPin.
  ///
  /// In fr, this message translates to:
  /// **'Confirmez votre code PIN'**
  String get confirmYourPin;

  /// No description provided for @confirmPinSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrez à nouveau votre code PIN'**
  String get confirmPinSubtitle;

  /// No description provided for @saveRecoveryPhrase.
  ///
  /// In fr, this message translates to:
  /// **'Phrase de récupération'**
  String get saveRecoveryPhrase;

  /// No description provided for @saveRecoveryPhraseSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Notez ces 24 mots dans l\'ordre. Ils vous permettront de récupérer votre compte si vous oubliez votre PIN.'**
  String get saveRecoveryPhraseSubtitle;

  /// No description provided for @phraseWritten.
  ///
  /// In fr, this message translates to:
  /// **'J\'ai noté ma phrase'**
  String get phraseWritten;

  /// No description provided for @warningRecoveryPhrase.
  ///
  /// In fr, this message translates to:
  /// **'Si vous perdez cette phrase et oubliez votre PIN, vous perdrez l\'accès à votre compte.'**
  String get warningRecoveryPhrase;

  /// No description provided for @accountTransferred.
  ///
  /// In fr, this message translates to:
  /// **'Compte transféré'**
  String get accountTransferred;

  /// No description provided for @accountTransferredMessage.
  ///
  /// In fr, this message translates to:
  /// **'Votre compte a été transféré vers un autre appareil. Cette session n\'est plus valide.'**
  String get accountTransferredMessage;

  /// No description provided for @accountTransferredInfo.
  ///
  /// In fr, this message translates to:
  /// **'Si vous n\'êtes pas à l\'origine de ce transfert, votre compte a peut-être été compromis.'**
  String get accountTransferredInfo;

  /// No description provided for @logout.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get logout;

  /// No description provided for @transferAccount.
  ///
  /// In fr, this message translates to:
  /// **'Transférer le compte'**
  String get transferAccount;

  /// No description provided for @transferAccountInfo.
  ///
  /// In fr, this message translates to:
  /// **'Transférez votre compte Hash vers un nouvel appareil. Votre session actuelle sera invalidée.'**
  String get transferAccountInfo;

  /// No description provided for @generateTransferCode.
  ///
  /// In fr, this message translates to:
  /// **'Générer un code de transfert'**
  String get generateTransferCode;

  /// No description provided for @transferCode.
  ///
  /// In fr, this message translates to:
  /// **'Code de transfert'**
  String get transferCode;

  /// No description provided for @transferCodeExpires.
  ///
  /// In fr, this message translates to:
  /// **'Ce code expire dans {minutes} minutes'**
  String transferCodeExpires(int minutes);

  /// No description provided for @enterCodeOnNewDevice.
  ///
  /// In fr, this message translates to:
  /// **'Entrez ce code sur votre nouvel appareil pour transférer votre compte.'**
  String get enterCodeOnNewDevice;

  /// No description provided for @generateNewCode.
  ///
  /// In fr, this message translates to:
  /// **'Générer un nouveau code'**
  String get generateNewCode;

  /// No description provided for @scanQrCode.
  ///
  /// In fr, this message translates to:
  /// **'Scanner un QR code'**
  String get scanQrCode;

  /// No description provided for @scanQrCodeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Scannez le QR code d\'un contact pour l\'ajouter'**
  String get scanQrCodeSubtitle;

  /// No description provided for @qrCodeDetected.
  ///
  /// In fr, this message translates to:
  /// **'QR code détecté'**
  String get qrCodeDetected;

  /// No description provided for @invalidQrCode.
  ///
  /// In fr, this message translates to:
  /// **'QR code invalide'**
  String get invalidQrCode;

  /// No description provided for @cameraPermissionRequired.
  ///
  /// In fr, this message translates to:
  /// **'Permission caméra requise'**
  String get cameraPermissionRequired;

  /// No description provided for @myQrCode.
  ///
  /// In fr, this message translates to:
  /// **'Mon QR code'**
  String get myQrCode;

  /// No description provided for @myQrCodeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Partagez ce QR code pour que vos contacts puissent vous ajouter'**
  String get myQrCodeSubtitle;

  /// No description provided for @shareQrCode.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get shareQrCode;

  /// No description provided for @addContactTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un contact'**
  String get addContactTitle;

  /// No description provided for @addContactByHashId.
  ///
  /// In fr, this message translates to:
  /// **'Entrez le Hash ID de votre contact'**
  String get addContactByHashId;

  /// No description provided for @hashIdHint.
  ///
  /// In fr, this message translates to:
  /// **'000-000-XXX'**
  String get hashIdHint;

  /// No description provided for @searchContact.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher'**
  String get searchContact;

  /// No description provided for @contactNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Contact non trouvé'**
  String get contactNotFound;

  /// No description provided for @contactAlreadyAdded.
  ///
  /// In fr, this message translates to:
  /// **'Ce contact est déjà dans votre liste'**
  String get contactAlreadyAdded;

  /// No description provided for @contactAdded.
  ///
  /// In fr, this message translates to:
  /// **'Contact ajouté'**
  String get contactAdded;

  /// No description provided for @myProfile.
  ///
  /// In fr, this message translates to:
  /// **'Mon profil'**
  String get myProfile;

  /// No description provided for @myProfileSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Partagez ces informations pour qu\'on puisse vous ajouter'**
  String get myProfileSubtitle;

  /// No description provided for @temporaryCode.
  ///
  /// In fr, this message translates to:
  /// **'Code temporaire'**
  String get temporaryCode;

  /// No description provided for @temporaryCodeExpires.
  ///
  /// In fr, this message translates to:
  /// **'Expire dans {time}'**
  String temporaryCodeExpires(String time);

  /// No description provided for @codeExpired.
  ///
  /// In fr, this message translates to:
  /// **'Code expiré'**
  String get codeExpired;

  /// No description provided for @generateNewCodeButton.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau code'**
  String get generateNewCodeButton;

  /// No description provided for @copyHashId.
  ///
  /// In fr, this message translates to:
  /// **'Copier l\'ID'**
  String get copyHashId;

  /// No description provided for @copyCode.
  ///
  /// In fr, this message translates to:
  /// **'Copier le code'**
  String get copyCode;

  /// No description provided for @copiedToClipboard.
  ///
  /// In fr, this message translates to:
  /// **'Copié'**
  String get copiedToClipboard;

  /// No description provided for @showMyQrCode.
  ///
  /// In fr, this message translates to:
  /// **'Afficher mon QR code'**
  String get showMyQrCode;

  /// No description provided for @orDivider.
  ///
  /// In fr, this message translates to:
  /// **'ou'**
  String get orDivider;

  /// No description provided for @openScanner.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir le scanner'**
  String get openScanner;

  /// No description provided for @addManually.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter manuellement'**
  String get addManually;

  /// No description provided for @contactHashIdLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hash ID du contact'**
  String get contactHashIdLabel;

  /// No description provided for @temporaryCodeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Code temporaire'**
  String get temporaryCodeLabel;

  /// No description provided for @temporaryCodeHint.
  ///
  /// In fr, this message translates to:
  /// **'000000'**
  String get temporaryCodeHint;

  /// No description provided for @askContactForCode.
  ///
  /// In fr, this message translates to:
  /// **'Demandez à votre contact de générer un code depuis son profil'**
  String get askContactForCode;

  /// No description provided for @verifyAndAdd.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier et ajouter'**
  String get verifyAndAdd;

  /// No description provided for @fillAllFields.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez remplir tous les champs'**
  String get fillAllFields;

  /// No description provided for @invalidHashIdFormat.
  ///
  /// In fr, this message translates to:
  /// **'Format d\'ID invalide (ex: 123-456-ABC)'**
  String get invalidHashIdFormat;

  /// No description provided for @userNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Utilisateur introuvable'**
  String get userNotFound;

  /// No description provided for @cannotAddYourself.
  ///
  /// In fr, this message translates to:
  /// **'Vous ne pouvez pas vous ajouter vous-même'**
  String get cannotAddYourself;

  /// No description provided for @invalidOrExpiredCode.
  ///
  /// In fr, this message translates to:
  /// **'Code temporaire invalide ou expiré'**
  String get invalidOrExpiredCode;

  /// No description provided for @contactFound.
  ///
  /// In fr, this message translates to:
  /// **'Contact trouvé !'**
  String get contactFound;

  /// No description provided for @howToCallContact.
  ///
  /// In fr, this message translates to:
  /// **'Comment voulez-vous l\'appeler ?'**
  String get howToCallContact;

  /// No description provided for @contactNameHint.
  ///
  /// In fr, this message translates to:
  /// **'Nom du contact'**
  String get contactNameHint;

  /// No description provided for @addContactButton.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get addContactButton;

  /// No description provided for @contactDetails.
  ///
  /// In fr, this message translates to:
  /// **'Détails du contact'**
  String get contactDetails;

  /// No description provided for @contactName.
  ///
  /// In fr, this message translates to:
  /// **'Nom du contact'**
  String get contactName;

  /// No description provided for @contactHashId.
  ///
  /// In fr, this message translates to:
  /// **'Hash ID'**
  String get contactHashId;

  /// No description provided for @addedOn.
  ///
  /// In fr, this message translates to:
  /// **'Ajouté le {date}'**
  String addedOn(String date);

  /// No description provided for @deleteContact.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer le contact'**
  String get deleteContact;

  /// No description provided for @deleteContactConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce contact ?'**
  String deleteContactConfirm(Object name);

  /// No description provided for @deleteContactMessage.
  ///
  /// In fr, this message translates to:
  /// **'Cette action supprimera également tout le chat.'**
  String get deleteContactMessage;

  /// No description provided for @delete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get delete;

  /// No description provided for @typeMessage.
  ///
  /// In fr, this message translates to:
  /// **'Écrire un message...'**
  String get typeMessage;

  /// No description provided for @messageSent.
  ///
  /// In fr, this message translates to:
  /// **'Envoyé'**
  String get messageSent;

  /// No description provided for @messageDelivered.
  ///
  /// In fr, this message translates to:
  /// **'Délivré'**
  String get messageDelivered;

  /// No description provided for @messageRead.
  ///
  /// In fr, this message translates to:
  /// **'Lu'**
  String get messageRead;

  /// No description provided for @messageFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec de l\'envoi'**
  String get messageFailed;

  /// No description provided for @now.
  ///
  /// In fr, this message translates to:
  /// **'Maintenant'**
  String get now;

  /// No description provided for @minutesAgo.
  ///
  /// In fr, this message translates to:
  /// **'{count}min'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In fr, this message translates to:
  /// **'{count}h'**
  String hoursAgo(int count);

  /// No description provided for @daysAgo.
  ///
  /// In fr, this message translates to:
  /// **'{count}j'**
  String daysAgo(int count);

  /// No description provided for @today.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In fr, this message translates to:
  /// **'Hier'**
  String get yesterday;

  /// No description provided for @dateAtTime.
  ///
  /// In fr, this message translates to:
  /// **'{date} à {time}'**
  String dateAtTime(String date, String time);

  /// No description provided for @shareMessage.
  ///
  /// In fr, this message translates to:
  /// **'Rejoins-moi sur Hash ! 🔒\n\nC\'est une messagerie vraiment privée : chiffrement total, aucune trace sur les serveurs, et un mode panique si besoin.\n\nTélécharge l\'app ici 👇\nhttps://hash.devolim.fr/share/index.html'**
  String get shareMessage;

  /// No description provided for @error.
  ///
  /// In fr, this message translates to:
  /// **'Erreur'**
  String get error;

  /// No description provided for @ok.
  ///
  /// In fr, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @view.
  ///
  /// In fr, this message translates to:
  /// **'Voir'**
  String get view;

  /// No description provided for @yes.
  ///
  /// In fr, this message translates to:
  /// **'Oui'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In fr, this message translates to:
  /// **'Non'**
  String get no;

  /// No description provided for @save.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get edit;

  /// No description provided for @close.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get close;

  /// No description provided for @confirm.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer'**
  String get confirm;

  /// No description provided for @loading.
  ///
  /// In fr, this message translates to:
  /// **'Chargement...'**
  String get loading;

  /// No description provided for @retry.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get retry;

  /// No description provided for @newContactRequest.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle demande de contact'**
  String get newContactRequest;

  /// No description provided for @pendingRequests.
  ///
  /// In fr, this message translates to:
  /// **'Demandes reçues'**
  String get pendingRequests;

  /// No description provided for @noPendingRequests.
  ///
  /// In fr, this message translates to:
  /// **'Aucune demande en attente'**
  String get noPendingRequests;

  /// No description provided for @pendingRequestsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ces personnes souhaitent vous ajouter'**
  String get pendingRequestsSubtitle;

  /// No description provided for @requestFromUser.
  ///
  /// In fr, this message translates to:
  /// **'Demande de {hashId}'**
  String requestFromUser(String hashId);

  /// No description provided for @requestExpiresIn.
  ///
  /// In fr, this message translates to:
  /// **'Expire dans {days} jours'**
  String requestExpiresIn(int days);

  /// No description provided for @acceptRequest.
  ///
  /// In fr, this message translates to:
  /// **'Accepter'**
  String get acceptRequest;

  /// No description provided for @rejectRequest.
  ///
  /// In fr, this message translates to:
  /// **'Refuser'**
  String get rejectRequest;

  /// No description provided for @requestAccepted.
  ///
  /// In fr, this message translates to:
  /// **'Demande acceptée'**
  String get requestAccepted;

  /// No description provided for @requestRejected.
  ///
  /// In fr, this message translates to:
  /// **'Demande refusée'**
  String get requestRejected;

  /// No description provided for @requestSent.
  ///
  /// In fr, this message translates to:
  /// **'Demande envoyée !'**
  String get requestSent;

  /// No description provided for @requestSentSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre demande a été envoyée. L\'utilisateur doit l\'accepter pour que vous puissiez discuter.'**
  String get requestSentSubtitle;

  /// No description provided for @requestAlreadyPending.
  ///
  /// In fr, this message translates to:
  /// **'Une demande est déjà en attente'**
  String get requestAlreadyPending;

  /// No description provided for @requestAlreadySentByOther.
  ///
  /// In fr, this message translates to:
  /// **'Cette personne vous a déjà envoyé une demande'**
  String get requestAlreadySentByOther;

  /// No description provided for @addByHashId.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter par Hash ID'**
  String get addByHashId;

  /// No description provided for @addByHashIdSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Entrez le Hash ID et le code temporaire du contact'**
  String get addByHashIdSubtitle;

  /// No description provided for @enterTemporaryCode.
  ///
  /// In fr, this message translates to:
  /// **'Entrez le code à 6 chiffres'**
  String get enterTemporaryCode;

  /// No description provided for @sendRequest.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer la demande'**
  String get sendRequest;

  /// No description provided for @acceptContactTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accepter le contact'**
  String get acceptContactTitle;

  /// No description provided for @acceptContactSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Vous pouvez lui donner un nom personnalisé'**
  String get acceptContactSubtitle;

  /// No description provided for @leaveEmptyForHashId.
  ///
  /// In fr, this message translates to:
  /// **'Laisser vide pour utiliser le Hash ID'**
  String get leaveEmptyForHashId;

  /// No description provided for @firstName.
  ///
  /// In fr, this message translates to:
  /// **'Prénom'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In fr, this message translates to:
  /// **'Nom'**
  String get lastName;

  /// No description provided for @notes.
  ///
  /// In fr, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @notesHint.
  ///
  /// In fr, this message translates to:
  /// **'Notes personnelles sur ce contact'**
  String get notesHint;

  /// No description provided for @photoOptional.
  ///
  /// In fr, this message translates to:
  /// **'Photo (optionnel)'**
  String get photoOptional;

  /// No description provided for @contactNameOptional.
  ///
  /// In fr, this message translates to:
  /// **'Nom (optionnel)'**
  String get contactNameOptional;

  /// No description provided for @notesOptional.
  ///
  /// In fr, this message translates to:
  /// **'Notes (optionnel)'**
  String get notesOptional;

  /// No description provided for @storedLocally.
  ///
  /// In fr, this message translates to:
  /// **'Stocké sur votre appareil uniquement'**
  String get storedLocally;

  /// No description provided for @encryptedMessageLabel.
  ///
  /// In fr, this message translates to:
  /// **'Message chiffré'**
  String get encryptedMessageLabel;

  /// No description provided for @identityMessageHint.
  ///
  /// In fr, this message translates to:
  /// **'Qui êtes-vous ? Comment vous connaissez-vous ?'**
  String get identityMessageHint;

  /// No description provided for @messageWillBeSentEncrypted.
  ///
  /// In fr, this message translates to:
  /// **'Ce message sera chiffré et envoyé au destinataire'**
  String get messageWillBeSentEncrypted;

  /// No description provided for @sendRequestButton.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer la demande'**
  String get sendRequestButton;

  /// No description provided for @requestExpiresIn24h.
  ///
  /// In fr, this message translates to:
  /// **'La demande expire dans 24h si elle n\'est pas acceptée'**
  String get requestExpiresIn24h;

  /// No description provided for @theyAlreadySentYouRequest.
  ///
  /// In fr, this message translates to:
  /// **'Cette personne vous a déjà envoyé une demande'**
  String get theyAlreadySentYouRequest;

  /// No description provided for @requests.
  ///
  /// In fr, this message translates to:
  /// **'Demandes'**
  String get requests;

  /// No description provided for @receivedRequests.
  ///
  /// In fr, this message translates to:
  /// **'Reçues'**
  String get receivedRequests;

  /// No description provided for @sentRequests.
  ///
  /// In fr, this message translates to:
  /// **'Envoyées'**
  String get sentRequests;

  /// No description provided for @noSentRequests.
  ///
  /// In fr, this message translates to:
  /// **'Aucune demande envoyée'**
  String get noSentRequests;

  /// No description provided for @cancelRequest.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancelRequest;

  /// No description provided for @deleteRequest.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer la demande'**
  String get deleteRequest;

  /// No description provided for @requestCancelled.
  ///
  /// In fr, this message translates to:
  /// **'Demande annulée'**
  String get requestCancelled;

  /// No description provided for @sentTo.
  ///
  /// In fr, this message translates to:
  /// **'Envoyée à {hashId}'**
  String sentTo(String hashId);

  /// No description provided for @expiresIn.
  ///
  /// In fr, this message translates to:
  /// **'Expire dans {time}'**
  String expiresIn(String time);

  /// No description provided for @receivedAgo.
  ///
  /// In fr, this message translates to:
  /// **'Reçue il y a {time}'**
  String receivedAgo(String time);

  /// No description provided for @messageFromRequester.
  ///
  /// In fr, this message translates to:
  /// **'Message du demandeur'**
  String get messageFromRequester;

  /// No description provided for @copy.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get copy;

  /// No description provided for @messageInfo.
  ///
  /// In fr, this message translates to:
  /// **'Informations du message'**
  String get messageInfo;

  /// No description provided for @messageDirection.
  ///
  /// In fr, this message translates to:
  /// **'Direction'**
  String get messageDirection;

  /// No description provided for @messageSentByYou.
  ///
  /// In fr, this message translates to:
  /// **'Envoyé par vous'**
  String get messageSentByYou;

  /// No description provided for @messageReceived.
  ///
  /// In fr, this message translates to:
  /// **'Reçu'**
  String get messageReceived;

  /// No description provided for @messageSentAt.
  ///
  /// In fr, this message translates to:
  /// **'Envoyé le'**
  String get messageSentAt;

  /// No description provided for @messageReceivedAt.
  ///
  /// In fr, this message translates to:
  /// **'Reçu le'**
  String get messageReceivedAt;

  /// No description provided for @messageDisappearsIn.
  ///
  /// In fr, this message translates to:
  /// **'Disparaît dans'**
  String get messageDisappearsIn;

  /// No description provided for @messageStatus.
  ///
  /// In fr, this message translates to:
  /// **'Statut'**
  String get messageStatus;

  /// No description provided for @messageReadAt.
  ///
  /// In fr, this message translates to:
  /// **'Lu le'**
  String get messageReadAt;

  /// No description provided for @messageType.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get messageType;

  /// No description provided for @messageSize.
  ///
  /// In fr, this message translates to:
  /// **'Taille'**
  String get messageSize;

  /// No description provided for @messageExpiresAt.
  ///
  /// In fr, this message translates to:
  /// **'Expire le'**
  String get messageExpiresAt;

  /// No description provided for @messageEncrypted.
  ///
  /// In fr, this message translates to:
  /// **'Chiffré de bout en bout'**
  String get messageEncrypted;

  /// No description provided for @messageStatusSending.
  ///
  /// In fr, this message translates to:
  /// **'Envoi...'**
  String get messageStatusSending;

  /// No description provided for @messageStatusSent.
  ///
  /// In fr, this message translates to:
  /// **'Envoyé'**
  String get messageStatusSent;

  /// No description provided for @messageStatusDelivered.
  ///
  /// In fr, this message translates to:
  /// **'Délivré'**
  String get messageStatusDelivered;

  /// No description provided for @messageStatusRead.
  ///
  /// In fr, this message translates to:
  /// **'Lu'**
  String get messageStatusRead;

  /// No description provided for @messageStatusFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec'**
  String get messageStatusFailed;

  /// No description provided for @serverStatus.
  ///
  /// In fr, this message translates to:
  /// **'Serveur'**
  String get serverStatus;

  /// No description provided for @onServer.
  ///
  /// In fr, this message translates to:
  /// **'En attente de livraison'**
  String get onServer;

  /// No description provided for @deletedFromServer.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé'**
  String get deletedFromServer;

  /// No description provided for @messageTypeText.
  ///
  /// In fr, this message translates to:
  /// **'Texte'**
  String get messageTypeText;

  /// No description provided for @messageTypeImage.
  ///
  /// In fr, this message translates to:
  /// **'Image'**
  String get messageTypeImage;

  /// No description provided for @messageTypeVideo.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo'**
  String get messageTypeVideo;

  /// No description provided for @messageTypeVoice.
  ///
  /// In fr, this message translates to:
  /// **'Audio'**
  String get messageTypeVoice;

  /// No description provided for @messageTypeFile.
  ///
  /// In fr, this message translates to:
  /// **'Fichier'**
  String get messageTypeFile;

  /// No description provided for @indefinitely.
  ///
  /// In fr, this message translates to:
  /// **'Indéfiniment'**
  String get indefinitely;

  /// No description provided for @hoursShort.
  ///
  /// In fr, this message translates to:
  /// **'h'**
  String get hoursShort;

  /// No description provided for @minutesShort.
  ///
  /// In fr, this message translates to:
  /// **'min'**
  String get minutesShort;

  /// No description provided for @hours.
  ///
  /// In fr, this message translates to:
  /// **'heures'**
  String get hours;

  /// No description provided for @minutes.
  ///
  /// In fr, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @seconds.
  ///
  /// In fr, this message translates to:
  /// **'secondes'**
  String get seconds;

  /// No description provided for @ephemeralMessages.
  ///
  /// In fr, this message translates to:
  /// **'Messages éphémères'**
  String get ephemeralMessages;

  /// No description provided for @ephemeralMessagesDescription.
  ///
  /// In fr, this message translates to:
  /// **'Les messages sont automatiquement supprimés après ce délai'**
  String get ephemeralMessagesDescription;

  /// No description provided for @ephemeralImmediate.
  ///
  /// In fr, this message translates to:
  /// **'Immédiat'**
  String get ephemeralImmediate;

  /// No description provided for @ephemeralImmediateDesc.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé dès que lu'**
  String get ephemeralImmediateDesc;

  /// No description provided for @ephemeralMyPreference.
  ///
  /// In fr, this message translates to:
  /// **'Ma préférence'**
  String get ephemeralMyPreference;

  /// No description provided for @ephemeralMyPreferenceDesc.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser le réglage global'**
  String get ephemeralMyPreferenceDesc;

  /// No description provided for @ephemeralDefaultSetting.
  ///
  /// In fr, this message translates to:
  /// **'Durée des messages'**
  String get ephemeralDefaultSetting;

  /// No description provided for @ephemeralChooseDefault.
  ///
  /// In fr, this message translates to:
  /// **'Recommandé'**
  String get ephemeralChooseDefault;

  /// No description provided for @ephemeral30Seconds.
  ///
  /// In fr, this message translates to:
  /// **'30 secondes'**
  String get ephemeral30Seconds;

  /// No description provided for @ephemeral30SecondsDesc.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé 30s après lecture'**
  String get ephemeral30SecondsDesc;

  /// No description provided for @ephemeral5Minutes.
  ///
  /// In fr, this message translates to:
  /// **'5 minutes'**
  String get ephemeral5Minutes;

  /// No description provided for @ephemeral5MinutesDesc.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé 5min après lecture'**
  String get ephemeral5MinutesDesc;

  /// No description provided for @ephemeral1Hour.
  ///
  /// In fr, this message translates to:
  /// **'1 heure'**
  String get ephemeral1Hour;

  /// No description provided for @ephemeral1HourDesc.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé 1h après lecture'**
  String get ephemeral1HourDesc;

  /// No description provided for @ephemeral3Hours.
  ///
  /// In fr, this message translates to:
  /// **'3 heures'**
  String get ephemeral3Hours;

  /// No description provided for @ephemeral6Hours.
  ///
  /// In fr, this message translates to:
  /// **'6 heures'**
  String get ephemeral6Hours;

  /// No description provided for @ephemeral6HoursDesc.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé 6h après lecture'**
  String get ephemeral6HoursDesc;

  /// No description provided for @ephemeral12Hours.
  ///
  /// In fr, this message translates to:
  /// **'12 heures'**
  String get ephemeral12Hours;

  /// No description provided for @ephemeral24Hours.
  ///
  /// In fr, this message translates to:
  /// **'24 heures'**
  String get ephemeral24Hours;

  /// No description provided for @ephemeral24HoursDesc.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé 24h après lecture'**
  String get ephemeral24HoursDesc;

  /// No description provided for @ephemeral3Days.
  ///
  /// In fr, this message translates to:
  /// **'3 jours'**
  String get ephemeral3Days;

  /// No description provided for @ephemeral3DaysDesc.
  ///
  /// In fr, this message translates to:
  /// **'Supprimé 3 jours après lecture'**
  String get ephemeral3DaysDesc;

  /// No description provided for @customDuration.
  ///
  /// In fr, this message translates to:
  /// **'Durée personnalisée'**
  String get customDuration;

  /// No description provided for @howItWorks.
  ///
  /// In fr, this message translates to:
  /// **'Comment ça marche ?'**
  String get howItWorks;

  /// No description provided for @ephemeralExplanation1.
  ///
  /// In fr, this message translates to:
  /// **'Les messages sont déjà supprimés du serveur dès leur réception.'**
  String get ephemeralExplanation1;

  /// No description provided for @ephemeralExplanation2.
  ///
  /// In fr, this message translates to:
  /// **'Ce réglage définit quand les messages disparaissent de VOTRE téléphone après les avoir lus.'**
  String get ephemeralExplanation2;

  /// No description provided for @ephemeralExplanation3.
  ///
  /// In fr, this message translates to:
  /// **'Votre contact a son propre réglage pour son téléphone.'**
  String get ephemeralExplanation3;

  /// No description provided for @mute1Hour.
  ///
  /// In fr, this message translates to:
  /// **'1 heure'**
  String get mute1Hour;

  /// No description provided for @mute8Hours.
  ///
  /// In fr, this message translates to:
  /// **'8 heures'**
  String get mute8Hours;

  /// No description provided for @mute1Day.
  ///
  /// In fr, this message translates to:
  /// **'1 jour'**
  String get mute1Day;

  /// No description provided for @mute1Week.
  ///
  /// In fr, this message translates to:
  /// **'1 semaine'**
  String get mute1Week;

  /// No description provided for @muteAlways.
  ///
  /// In fr, this message translates to:
  /// **'Toujours'**
  String get muteAlways;

  /// No description provided for @muteExplanation.
  ///
  /// In fr, this message translates to:
  /// **'Vous ne recevrez plus de notifications pour ce contact'**
  String get muteExplanation;

  /// No description provided for @showCallsInRecents.
  ///
  /// In fr, this message translates to:
  /// **'Afficher dans les appels récents'**
  String get showCallsInRecents;

  /// No description provided for @showCallsInRecentsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Les appels Hash apparaissent dans l\'historique du téléphone'**
  String get showCallsInRecentsSubtitle;

  /// No description provided for @feedback.
  ///
  /// In fr, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @muteNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Couper les notifications'**
  String get muteNotifications;

  /// No description provided for @muteDescription.
  ///
  /// In fr, this message translates to:
  /// **'Vous ne recevrez pas de notifications pour ce contact'**
  String get muteDescription;

  /// No description provided for @mutedUntil.
  ///
  /// In fr, this message translates to:
  /// **'Muet jusqu\'à {time}'**
  String mutedUntil(String time);

  /// No description provided for @notMuted.
  ///
  /// In fr, this message translates to:
  /// **'Notifications activées'**
  String get notMuted;

  /// No description provided for @unmute.
  ///
  /// In fr, this message translates to:
  /// **'Réactiver'**
  String get unmute;

  /// No description provided for @notificationSound.
  ///
  /// In fr, this message translates to:
  /// **'Son de notification'**
  String get notificationSound;

  /// No description provided for @defaultSound.
  ///
  /// In fr, this message translates to:
  /// **'Par défaut'**
  String get defaultSound;

  /// No description provided for @chatSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres du chat'**
  String get chatSettings;

  /// No description provided for @bubbleColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur des bulles'**
  String get bubbleColor;

  /// No description provided for @backgroundColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de fond'**
  String get backgroundColor;

  /// No description provided for @backgroundImage.
  ///
  /// In fr, this message translates to:
  /// **'Image de fond'**
  String get backgroundImage;

  /// No description provided for @chatBackground.
  ///
  /// In fr, this message translates to:
  /// **'Fond du chat'**
  String get chatBackground;

  /// No description provided for @customColor.
  ///
  /// In fr, this message translates to:
  /// **'Personnalisée'**
  String get customColor;

  /// No description provided for @defaultColor.
  ///
  /// In fr, this message translates to:
  /// **'Par défaut'**
  String get defaultColor;

  /// No description provided for @imageSelected.
  ///
  /// In fr, this message translates to:
  /// **'Image sélectionnée'**
  String get imageSelected;

  /// No description provided for @noImage.
  ///
  /// In fr, this message translates to:
  /// **'Aucune image'**
  String get noImage;

  /// No description provided for @color.
  ///
  /// In fr, this message translates to:
  /// **'Couleur'**
  String get color;

  /// No description provided for @image.
  ///
  /// In fr, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @tapToSelectImage.
  ///
  /// In fr, this message translates to:
  /// **'Appuyez pour sélectionner une image'**
  String get tapToSelectImage;

  /// No description provided for @changeImage.
  ///
  /// In fr, this message translates to:
  /// **'Changer d\'image'**
  String get changeImage;

  /// No description provided for @previewMessageReceived.
  ///
  /// In fr, this message translates to:
  /// **'Salut !'**
  String get previewMessageReceived;

  /// No description provided for @previewMessageSent.
  ///
  /// In fr, this message translates to:
  /// **'Coucou !'**
  String get previewMessageSent;

  /// No description provided for @messageAction.
  ///
  /// In fr, this message translates to:
  /// **'Message'**
  String get messageAction;

  /// No description provided for @callAction.
  ///
  /// In fr, this message translates to:
  /// **'Appel'**
  String get callAction;

  /// No description provided for @videoAction.
  ///
  /// In fr, this message translates to:
  /// **'Vidéo'**
  String get videoAction;

  /// No description provided for @personalNotes.
  ///
  /// In fr, this message translates to:
  /// **'Notes personnelles'**
  String get personalNotes;

  /// No description provided for @addNotes.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter des notes...'**
  String get addNotes;

  /// No description provided for @noNotes.
  ///
  /// In fr, this message translates to:
  /// **'Aucune note'**
  String get noNotes;

  /// No description provided for @messageNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications des messages'**
  String get messageNotifications;

  /// No description provided for @callNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications des appels'**
  String get callNotifications;

  /// No description provided for @useGradient.
  ///
  /// In fr, this message translates to:
  /// **'Utiliser un dégradé'**
  String get useGradient;

  /// No description provided for @gradientStart.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de début'**
  String get gradientStart;

  /// No description provided for @gradientEnd.
  ///
  /// In fr, this message translates to:
  /// **'Couleur de fin'**
  String get gradientEnd;

  /// No description provided for @preview.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu'**
  String get preview;

  /// No description provided for @reset.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get reset;

  /// No description provided for @securityNumber.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de sécurité'**
  String get securityNumber;

  /// No description provided for @securityNumberDescription.
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez que le numéro de sécurité correspond à l\'appareil de {name}'**
  String securityNumberDescription(String name);

  /// No description provided for @verifyEncryption.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier le chiffrement de bout en bout'**
  String get verifyEncryption;

  /// No description provided for @tapToCopy.
  ///
  /// In fr, this message translates to:
  /// **'Appuyez pour copier'**
  String get tapToCopy;

  /// No description provided for @howToVerify.
  ///
  /// In fr, this message translates to:
  /// **'Comment vérifier'**
  String get howToVerify;

  /// No description provided for @verifyStep1.
  ///
  /// In fr, this message translates to:
  /// **'Rencontrez votre contact en personne ou appelez-le'**
  String get verifyStep1;

  /// No description provided for @verifyStep2.
  ///
  /// In fr, this message translates to:
  /// **'Comparez les numéros de sécurité ou scannez les QR codes'**
  String get verifyStep2;

  /// No description provided for @verifyStep3.
  ///
  /// In fr, this message translates to:
  /// **'S\'ils correspondent, votre chat est sécurisé'**
  String get verifyStep3;

  /// No description provided for @scanToVerify.
  ///
  /// In fr, this message translates to:
  /// **'Scanner pour vérifier'**
  String get scanToVerify;

  /// No description provided for @reportSpam.
  ///
  /// In fr, this message translates to:
  /// **'Signaler comme spam'**
  String get reportSpam;

  /// No description provided for @reportSpamSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Signaler ce contact comme spam'**
  String get reportSpamSubtitle;

  /// No description provided for @reportSpamDescription.
  ///
  /// In fr, this message translates to:
  /// **'Ce contact sera signalé de manière anonyme. Votre identité ne sera pas partagée. Êtes-vous sûr ?'**
  String get reportSpamDescription;

  /// No description provided for @report.
  ///
  /// In fr, this message translates to:
  /// **'Signaler'**
  String get report;

  /// No description provided for @spamReported.
  ///
  /// In fr, this message translates to:
  /// **'Spam signalé'**
  String get spamReported;

  /// No description provided for @reportError.
  ///
  /// In fr, this message translates to:
  /// **'Échec de l\'envoi du signalement. Veuillez réessayer.'**
  String get reportError;

  /// No description provided for @reportRateLimited.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez atteint le nombre maximum de signalements pour aujourd\'hui.'**
  String get reportRateLimited;

  /// No description provided for @blockContact.
  ///
  /// In fr, this message translates to:
  /// **'Bloquer le contact'**
  String get blockContact;

  /// No description provided for @blockContactDescription.
  ///
  /// In fr, this message translates to:
  /// **'Ce contact ne pourra plus vous envoyer de messages ni vous appeler. Il ne sera pas notifié.'**
  String get blockContactDescription;

  /// No description provided for @unblockContact.
  ///
  /// In fr, this message translates to:
  /// **'Débloquer le contact'**
  String get unblockContact;

  /// No description provided for @unblockContactDescription.
  ///
  /// In fr, this message translates to:
  /// **'Ce contact pourra à nouveau vous envoyer des messages et vous appeler.'**
  String get unblockContactDescription;

  /// No description provided for @contactBlocked.
  ///
  /// In fr, this message translates to:
  /// **'Contact bloqué'**
  String get contactBlocked;

  /// No description provided for @contactUnblocked.
  ///
  /// In fr, this message translates to:
  /// **'Contact débloqué'**
  String get contactUnblocked;

  /// No description provided for @contactIsBlocked.
  ///
  /// In fr, this message translates to:
  /// **'Ce contact est bloqué'**
  String get contactIsBlocked;

  /// No description provided for @unblock.
  ///
  /// In fr, this message translates to:
  /// **'Débloquer'**
  String get unblock;

  /// No description provided for @deleteContactSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce contact et le chat'**
  String get deleteContactSubtitle;

  /// No description provided for @confirmWithPin.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer avec le PIN'**
  String get confirmWithPin;

  /// No description provided for @enterPinToConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre PIN pour confirmer cette action'**
  String get enterPinToConfirm;

  /// No description provided for @profilePhoto.
  ///
  /// In fr, this message translates to:
  /// **'Photo de profil'**
  String get profilePhoto;

  /// No description provided for @takePhoto.
  ///
  /// In fr, this message translates to:
  /// **'Prendre une photo'**
  String get takePhoto;

  /// No description provided for @chooseFromGallery.
  ///
  /// In fr, this message translates to:
  /// **'Choisir dans la galerie'**
  String get chooseFromGallery;

  /// No description provided for @removePhoto.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer la photo'**
  String get removePhoto;

  /// No description provided for @viewContactHashId.
  ///
  /// In fr, this message translates to:
  /// **'Voir l\'identifiant du contact'**
  String get viewContactHashId;

  /// No description provided for @hashIdPartiallyMasked.
  ///
  /// In fr, this message translates to:
  /// **'Partiellement masqué pour votre sécurité et celle de votre interlocuteur'**
  String get hashIdPartiallyMasked;

  /// No description provided for @addFirstContact.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez votre premier contact'**
  String get addFirstContact;

  /// No description provided for @addFirstContactSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Partagez votre QR code ou scannez celui d\'un ami'**
  String get addFirstContactSubtitle;

  /// No description provided for @directory.
  ///
  /// In fr, this message translates to:
  /// **'Répertoire'**
  String get directory;

  /// No description provided for @noContacts.
  ///
  /// In fr, this message translates to:
  /// **'Aucun contact'**
  String get noContacts;

  /// No description provided for @noContactsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez un contact pour commencer'**
  String get noContactsSubtitle;

  /// No description provided for @sendMessageAction.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer un message'**
  String get sendMessageAction;

  /// No description provided for @audioCall.
  ///
  /// In fr, this message translates to:
  /// **'Appel audio'**
  String get audioCall;

  /// No description provided for @videoCall.
  ///
  /// In fr, this message translates to:
  /// **'Appel vidéo'**
  String get videoCall;

  /// No description provided for @viewProfile.
  ///
  /// In fr, this message translates to:
  /// **'Voir le profil'**
  String get viewProfile;

  /// No description provided for @deleteContactDirectory.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer le contact'**
  String get deleteContactDirectory;

  /// No description provided for @scanShort.
  ///
  /// In fr, this message translates to:
  /// **'Scanner'**
  String get scanShort;

  /// No description provided for @addShort.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get addShort;

  /// No description provided for @deleteContactConfirmName.
  ///
  /// In fr, this message translates to:
  /// **'Voulez-vous vraiment supprimer {name} ?'**
  String deleteContactConfirmName(String name);

  /// No description provided for @noNotesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucune note'**
  String get noNotesTitle;

  /// No description provided for @noNotesSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Créez votre première note'**
  String get noNotesSubtitle;

  /// No description provided for @newNote.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle note'**
  String get newNote;

  /// No description provided for @editNote.
  ///
  /// In fr, this message translates to:
  /// **'Modifier la note'**
  String get editNote;

  /// No description provided for @deleteNote.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer la note'**
  String get deleteNote;

  /// No description provided for @deleteNoteConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Voulez-vous vraiment supprimer cette note ?'**
  String get deleteNoteConfirm;

  /// No description provided for @noteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Titre'**
  String get noteTitle;

  /// No description provided for @noteContent.
  ///
  /// In fr, this message translates to:
  /// **'Contenu'**
  String get noteContent;

  /// No description provided for @addItem.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un élément'**
  String get addItem;

  /// No description provided for @pinNote.
  ///
  /// In fr, this message translates to:
  /// **'Épingler'**
  String get pinNote;

  /// No description provided for @unpinNote.
  ///
  /// In fr, this message translates to:
  /// **'Désépingler'**
  String get unpinNote;

  /// No description provided for @noteColor.
  ///
  /// In fr, this message translates to:
  /// **'Couleur'**
  String get noteColor;

  /// No description provided for @notePassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get notePassword;

  /// No description provided for @setPassword.
  ///
  /// In fr, this message translates to:
  /// **'Définir un mot de passe'**
  String get setPassword;

  /// No description provided for @changePassword.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le mot de passe'**
  String get changePassword;

  /// No description provided for @removePassword.
  ///
  /// In fr, this message translates to:
  /// **'Retirer le mot de passe'**
  String get removePassword;

  /// No description provided for @enterPassword.
  ///
  /// In fr, this message translates to:
  /// **'Entrez le mot de passe'**
  String get enterPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In fr, this message translates to:
  /// **'Confirmez le mot de passe'**
  String get confirmPassword;

  /// No description provided for @passwordPin.
  ///
  /// In fr, this message translates to:
  /// **'Code PIN'**
  String get passwordPin;

  /// No description provided for @passwordText.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe texte'**
  String get passwordText;

  /// No description provided for @protectedNote.
  ///
  /// In fr, this message translates to:
  /// **'Note protégée'**
  String get protectedNote;

  /// No description provided for @incorrectPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe incorrect'**
  String get incorrectPassword;

  /// No description provided for @passwordSet.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe défini'**
  String get passwordSet;

  /// No description provided for @passwordRemoved.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe retiré'**
  String get passwordRemoved;

  /// No description provided for @notesBiometric.
  ///
  /// In fr, this message translates to:
  /// **'Face ID pour les notes'**
  String get notesBiometric;

  /// No description provided for @notesBiometricSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Exiger l\'authentification biométrique pour ouvrir les notes protégées'**
  String get notesBiometricSubtitle;

  /// No description provided for @textNote.
  ///
  /// In fr, this message translates to:
  /// **'Note texte'**
  String get textNote;

  /// No description provided for @checklistNote.
  ///
  /// In fr, this message translates to:
  /// **'Liste de tâches'**
  String get checklistNote;

  /// No description provided for @tasksProgress.
  ///
  /// In fr, this message translates to:
  /// **'{checked}/{total} tâches'**
  String tasksProgress(int checked, int total);

  /// No description provided for @autoSaved.
  ///
  /// In fr, this message translates to:
  /// **'Sauvegardé'**
  String get autoSaved;

  /// No description provided for @searchNotes.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une note'**
  String get searchNotes;

  /// No description provided for @legalConsent.
  ///
  /// In fr, this message translates to:
  /// **'Consentement légal'**
  String get legalConsent;

  /// No description provided for @confirmAge13.
  ///
  /// In fr, this message translates to:
  /// **'Je confirme avoir au moins 13 ans'**
  String get confirmAge13;

  /// No description provided for @acceptLegalStart.
  ///
  /// In fr, this message translates to:
  /// **'J\'accepte la '**
  String get acceptLegalStart;

  /// No description provided for @privacyPolicy.
  ///
  /// In fr, this message translates to:
  /// **'Politique de confidentialité'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In fr, this message translates to:
  /// **'Conditions d\'utilisation'**
  String get termsOfService;

  /// No description provided for @andThe.
  ///
  /// In fr, this message translates to:
  /// **' et les '**
  String get andThe;

  /// No description provided for @continueButton.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get continueButton;

  /// No description provided for @mustAcceptTerms.
  ///
  /// In fr, this message translates to:
  /// **'Vous devez accepter les deux conditions pour continuer'**
  String get mustAcceptTerms;

  /// No description provided for @lastStepTitle.
  ///
  /// In fr, this message translates to:
  /// **'Dernière étape avant de créer votre compte'**
  String get lastStepTitle;

  /// No description provided for @ephemeralDeviceDuration.
  ///
  /// In fr, this message translates to:
  /// **'Durée de conservation des messages sur votre appareil :'**
  String get ephemeralDeviceDuration;

  /// No description provided for @serverDeletionInfo.
  ///
  /// In fr, this message translates to:
  /// **'Les messages sont supprimés instantanément du serveur dès réception.'**
  String get serverDeletionInfo;

  /// No description provided for @deviceRetentionInfo.
  ///
  /// In fr, this message translates to:
  /// **'Les messages restent sur votre téléphone pendant la durée choisie, puis sont automatiquement effacés.'**
  String get deviceRetentionInfo;

  /// No description provided for @serverLabel.
  ///
  /// In fr, this message translates to:
  /// **'Serveur'**
  String get serverLabel;

  /// No description provided for @yourDeviceLabel.
  ///
  /// In fr, this message translates to:
  /// **'Votre appareil'**
  String get yourDeviceLabel;

  /// No description provided for @createMyAccount.
  ///
  /// In fr, this message translates to:
  /// **'Créer mon compte'**
  String get createMyAccount;

  /// No description provided for @timeoutError.
  ///
  /// In fr, this message translates to:
  /// **'Le serveur ne répond pas. Vérifiez votre connexion internet et réessayez.'**
  String get timeoutError;

  /// No description provided for @support.
  ///
  /// In fr, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @contactSupport.
  ///
  /// In fr, this message translates to:
  /// **'Contacter le support'**
  String get contactSupport;

  /// No description provided for @contactSupportSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'hash-support@devolim.fr'**
  String get contactSupportSubtitle;

  /// No description provided for @reportAbuse.
  ///
  /// In fr, this message translates to:
  /// **'Signaler un abus'**
  String get reportAbuse;

  /// No description provided for @reportAbuseSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'hash-abuse@devolim.fr'**
  String get reportAbuseSubtitle;

  /// No description provided for @legal.
  ///
  /// In fr, this message translates to:
  /// **'Légal'**
  String get legal;

  /// No description provided for @legalEntity.
  ///
  /// In fr, this message translates to:
  /// **'Entité légale'**
  String get legalEntity;

  /// No description provided for @legalEntityValue.
  ///
  /// In fr, this message translates to:
  /// **'DEVOLIM — SIREN 948 000 757'**
  String get legalEntityValue;

  /// No description provided for @pinConversation.
  ///
  /// In fr, this message translates to:
  /// **'Épingler'**
  String get pinConversation;

  /// No description provided for @unpinConversation.
  ///
  /// In fr, this message translates to:
  /// **'Désépingler'**
  String get unpinConversation;

  /// No description provided for @hideConversation.
  ///
  /// In fr, this message translates to:
  /// **'Retirer du fil'**
  String get hideConversation;

  /// No description provided for @deleteConversation.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer la conversation'**
  String get deleteConversation;

  /// No description provided for @deleteConversationConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre code PIN pour confirmer la suppression de tous les messages'**
  String get deleteConversationConfirm;

  /// No description provided for @noConversations.
  ///
  /// In fr, this message translates to:
  /// **'Aucune conversation'**
  String get noConversations;

  /// No description provided for @startConversation.
  ///
  /// In fr, this message translates to:
  /// **'Démarrer'**
  String get startConversation;

  /// No description provided for @microphonePermissionRequired.
  ///
  /// In fr, this message translates to:
  /// **'Accès au microphone requis'**
  String get microphonePermissionRequired;

  /// No description provided for @microphonePermissionExplanation.
  ///
  /// In fr, this message translates to:
  /// **'Hash a besoin du microphone pour passer des appels.'**
  String get microphonePermissionExplanation;

  /// No description provided for @cameraPermissionExplanation.
  ///
  /// In fr, this message translates to:
  /// **'Hash a besoin de la caméra pour les appels vidéo.'**
  String get cameraPermissionExplanation;

  /// No description provided for @microphonePermissionRecordExplanation.
  ///
  /// In fr, this message translates to:
  /// **'Hash a besoin du microphone pour enregistrer des messages vocaux.'**
  String get microphonePermissionRecordExplanation;

  /// No description provided for @cameraPermissionCaptureExplanation.
  ///
  /// In fr, this message translates to:
  /// **'Hash a besoin de la caméra pour prendre des photos et vidéos.'**
  String get cameraPermissionCaptureExplanation;

  /// No description provided for @locationPermissionRequired.
  ///
  /// In fr, this message translates to:
  /// **'Accès à la localisation requis'**
  String get locationPermissionRequired;

  /// No description provided for @locationPermissionExplanation.
  ///
  /// In fr, this message translates to:
  /// **'Hash a besoin de votre position pour la partager.'**
  String get locationPermissionExplanation;

  /// No description provided for @locationServiceDisabled.
  ///
  /// In fr, this message translates to:
  /// **'La localisation est désactivée. Veuillez activer le GPS.'**
  String get locationServiceDisabled;

  /// No description provided for @openSettings.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir les réglages'**
  String get openSettings;

  /// No description provided for @callConnecting.
  ///
  /// In fr, this message translates to:
  /// **'Connexion...'**
  String get callConnecting;

  /// No description provided for @callRinging.
  ///
  /// In fr, this message translates to:
  /// **'Appel en cours...'**
  String get callRinging;

  /// No description provided for @callReconnecting.
  ///
  /// In fr, this message translates to:
  /// **'Reconnexion...'**
  String get callReconnecting;

  /// No description provided for @callReconnectingTimer.
  ///
  /// In fr, this message translates to:
  /// **'Reconnexion ({seconds}s)'**
  String callReconnectingTimer(int seconds);

  /// No description provided for @callPaused.
  ///
  /// In fr, this message translates to:
  /// **'En pause'**
  String get callPaused;

  /// No description provided for @callPausedSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'L\'appel est toujours en cours'**
  String get callPausedSubtitle;

  /// No description provided for @callRemoteMicMuted.
  ///
  /// In fr, this message translates to:
  /// **'Micro de l\'interlocuteur coupé'**
  String get callRemoteMicMuted;

  /// No description provided for @callMiniControlsMute.
  ///
  /// In fr, this message translates to:
  /// **'Couper le micro'**
  String get callMiniControlsMute;

  /// No description provided for @callMiniControlsUnmute.
  ///
  /// In fr, this message translates to:
  /// **'Activer le micro'**
  String get callMiniControlsUnmute;

  /// No description provided for @callMiniControlsHangUp.
  ///
  /// In fr, this message translates to:
  /// **'Raccrocher'**
  String get callMiniControlsHangUp;

  /// No description provided for @callMiniControlsReturn.
  ///
  /// In fr, this message translates to:
  /// **'Revenir à l\'appel'**
  String get callMiniControlsReturn;

  /// No description provided for @callNetworkPoor.
  ///
  /// In fr, this message translates to:
  /// **'Connexion instable'**
  String get callNetworkPoor;

  /// No description provided for @callNetworkLost.
  ///
  /// In fr, this message translates to:
  /// **'Connexion perdue'**
  String get callNetworkLost;

  /// No description provided for @callEndedTitle.
  ///
  /// In fr, this message translates to:
  /// **'Appel terminé'**
  String get callEndedTitle;

  /// No description provided for @deviceDataTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mes données'**
  String get deviceDataTitle;

  /// No description provided for @deviceData.
  ///
  /// In fr, this message translates to:
  /// **'Sur votre appareil'**
  String get deviceData;

  /// No description provided for @deviceDataSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Voir qui possède vos données'**
  String get deviceDataSubtitle;

  /// No description provided for @dataLocalSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Contacts, messages, fichiers, clés'**
  String get dataLocalSubtitle;

  /// No description provided for @dataLocalBadge.
  ///
  /// In fr, this message translates to:
  /// **'Chiffré · Accessible qu\'ici'**
  String get dataLocalBadge;

  /// No description provided for @dataLocalBody.
  ///
  /// In fr, this message translates to:
  /// **'Ces données ne quittent jamais votre téléphone. Elles sont chiffrées et protégées par votre code PIN.'**
  String get dataLocalBody;

  /// No description provided for @dataServerSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Clés Signal, messages en transit'**
  String get dataServerSubtitle;

  /// No description provided for @dataServerBadge.
  ///
  /// In fr, this message translates to:
  /// **'Minimum requis · Sans identité'**
  String get dataServerBadge;

  /// No description provided for @dataServerBody.
  ///
  /// In fr, this message translates to:
  /// **'Hash ne stocke que le strict nécessaire : vos clés publiques de chiffrement et vos messages avant livraison. Aucune donnée personnelle.'**
  String get dataServerBody;

  /// No description provided for @localStorage.
  ///
  /// In fr, this message translates to:
  /// **'Stockage local'**
  String get localStorage;

  /// No description provided for @onThisDevice.
  ///
  /// In fr, this message translates to:
  /// **'sur cet appareil'**
  String get onThisDevice;

  /// No description provided for @encryptedDatabases.
  ///
  /// In fr, this message translates to:
  /// **'Bases de données chiffrées'**
  String get encryptedDatabases;

  /// No description provided for @files.
  ///
  /// In fr, this message translates to:
  /// **'Fichiers'**
  String get files;

  /// No description provided for @secureKeychain.
  ///
  /// In fr, this message translates to:
  /// **'Trousseau sécurisé'**
  String get secureKeychain;

  /// No description provided for @cache.
  ///
  /// In fr, this message translates to:
  /// **'Cache'**
  String get cache;

  /// No description provided for @contactsDetail.
  ///
  /// In fr, this message translates to:
  /// **'Noms, avatars, clés Signal'**
  String get contactsDetail;

  /// No description provided for @messagesDetail.
  ///
  /// In fr, this message translates to:
  /// **'Conversations chiffrées'**
  String get messagesDetail;

  /// No description provided for @notesDetail.
  ///
  /// In fr, this message translates to:
  /// **'Notes personnelles'**
  String get notesDetail;

  /// No description provided for @signalSessions.
  ///
  /// In fr, this message translates to:
  /// **'Sessions Signal'**
  String get signalSessions;

  /// No description provided for @signalSessionsDetail.
  ///
  /// In fr, this message translates to:
  /// **'Sessions de chiffrement'**
  String get signalSessionsDetail;

  /// No description provided for @pendingContacts.
  ///
  /// In fr, this message translates to:
  /// **'Contacts en attente'**
  String get pendingContacts;

  /// No description provided for @pendingContactsDetail.
  ///
  /// In fr, this message translates to:
  /// **'Demandes en cours'**
  String get pendingContactsDetail;

  /// No description provided for @callHistory.
  ///
  /// In fr, this message translates to:
  /// **'Appels'**
  String get callHistory;

  /// No description provided for @callHistoryDetail.
  ///
  /// In fr, this message translates to:
  /// **'Historique des appels'**
  String get callHistoryDetail;

  /// No description provided for @preferences.
  ///
  /// In fr, this message translates to:
  /// **'Préférences'**
  String get preferences;

  /// No description provided for @preferencesDetail.
  ///
  /// In fr, this message translates to:
  /// **'Préférences médias et appels'**
  String get preferencesDetail;

  /// No description provided for @avatars.
  ///
  /// In fr, this message translates to:
  /// **'Avatars'**
  String get avatars;

  /// No description provided for @media.
  ///
  /// In fr, this message translates to:
  /// **'Médias'**
  String get media;

  /// No description provided for @fileCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =0{aucun fichier} =1{1 fichier} other{{count} fichiers}}'**
  String fileCount(int count);

  /// No description provided for @active.
  ///
  /// In fr, this message translates to:
  /// **'Actif'**
  String get active;

  /// No description provided for @notDefined.
  ///
  /// In fr, this message translates to:
  /// **'Non défini'**
  String get notDefined;

  /// No description provided for @biometrics.
  ///
  /// In fr, this message translates to:
  /// **'Biométrie'**
  String get biometrics;

  /// No description provided for @recoveryPhrase.
  ///
  /// In fr, this message translates to:
  /// **'Phrase de récupération'**
  String get recoveryPhrase;

  /// No description provided for @identity.
  ///
  /// In fr, this message translates to:
  /// **'Identité (Hash ID)'**
  String get identity;

  /// No description provided for @signalKeys.
  ///
  /// In fr, this message translates to:
  /// **'Clés Signal Protocol'**
  String get signalKeys;

  /// No description provided for @authTokens.
  ///
  /// In fr, this message translates to:
  /// **'Jetons d\'authentification'**
  String get authTokens;

  /// No description provided for @contactNamesCache.
  ///
  /// In fr, this message translates to:
  /// **'Cache noms contacts'**
  String get contactNamesCache;

  /// No description provided for @remoteConfig.
  ///
  /// In fr, this message translates to:
  /// **'Config distante'**
  String get remoteConfig;

  /// No description provided for @notificationPrefs.
  ///
  /// In fr, this message translates to:
  /// **'Préférences notifications'**
  String get notificationPrefs;

  /// No description provided for @serverData.
  ///
  /// In fr, this message translates to:
  /// **'Données sur le serveur'**
  String get serverData;

  /// No description provided for @serverDataInfo.
  ///
  /// In fr, this message translates to:
  /// **'Hash conserve un minimum de données sur le serveur, toutes chiffrées ou temporaires.'**
  String get serverDataInfo;

  /// No description provided for @serverProfile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get serverProfile;

  /// No description provided for @serverProfileDetail.
  ///
  /// In fr, this message translates to:
  /// **'Hash ID, clés publiques, jeton de boîte'**
  String get serverProfileDetail;

  /// No description provided for @serverPrekeys.
  ///
  /// In fr, this message translates to:
  /// **'Pré-clés'**
  String get serverPrekeys;

  /// No description provided for @serverPrekeysDetail.
  ///
  /// In fr, this message translates to:
  /// **'Clés Signal à usage unique (consommées)'**
  String get serverPrekeysDetail;

  /// No description provided for @serverMessages.
  ///
  /// In fr, this message translates to:
  /// **'Messages en transit'**
  String get serverMessages;

  /// No description provided for @serverMessagesDetail.
  ///
  /// In fr, this message translates to:
  /// **'Supprimés après réception (24h max)'**
  String get serverMessagesDetail;

  /// No description provided for @serverMedia.
  ///
  /// In fr, this message translates to:
  /// **'Médias en transit'**
  String get serverMedia;

  /// No description provided for @serverMediaDetail.
  ///
  /// In fr, this message translates to:
  /// **'Supprimés après téléchargement'**
  String get serverMediaDetail;

  /// No description provided for @serverContactRequests.
  ///
  /// In fr, this message translates to:
  /// **'Demandes de contact'**
  String get serverContactRequests;

  /// No description provided for @serverContactRequestsDetail.
  ///
  /// In fr, this message translates to:
  /// **'Expirent après 24h'**
  String get serverContactRequestsDetail;

  /// No description provided for @serverRateLimits.
  ///
  /// In fr, this message translates to:
  /// **'Limites de débit'**
  String get serverRateLimits;

  /// No description provided for @serverRateLimitsDetail.
  ///
  /// In fr, this message translates to:
  /// **'Données temporaires anti-abus'**
  String get serverRateLimitsDetail;

  /// No description provided for @privacyReassurance.
  ///
  /// In fr, this message translates to:
  /// **'Hash ne peut pas lire vos messages. Toutes les données sont chiffrées de bout en bout. Les données serveur sont supprimées automatiquement.'**
  String get privacyReassurance;

  /// No description provided for @pinTooSimple.
  ///
  /// In fr, this message translates to:
  /// **'Ce code PIN est trop simple. Choisissez un code plus sécurisé.'**
  String get pinTooSimple;

  /// No description provided for @genericError.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue. Veuillez réessayer.'**
  String get genericError;

  /// No description provided for @noInternetError.
  ///
  /// In fr, this message translates to:
  /// **'Pas de connexion internet. Vérifiez votre réseau et réessayez.'**
  String get noInternetError;

  /// No description provided for @accountCreationError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de créer le compte : {error}'**
  String accountCreationError(String error);

  /// No description provided for @phraseCopiedToClipboard.
  ///
  /// In fr, this message translates to:
  /// **'Phrase copiée dans le presse-papiers'**
  String get phraseCopiedToClipboard;

  /// No description provided for @copyPhrase.
  ///
  /// In fr, this message translates to:
  /// **'Copier la phrase'**
  String get copyPhrase;

  /// No description provided for @recoveryPhraseSecurityWarning.
  ///
  /// In fr, this message translates to:
  /// **'Notez cette phrase dans un endroit sûr. Si vous perdez votre code PIN sans cette phrase, vous perdrez définitivement l\'accès à vos données.'**
  String get recoveryPhraseSecurityWarning;

  /// No description provided for @noMessages.
  ///
  /// In fr, this message translates to:
  /// **'Aucun message'**
  String get noMessages;

  /// No description provided for @deleteAllMessagesWithContact.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer tous les messages avec {name} ?'**
  String deleteAllMessagesWithContact(String name);

  /// No description provided for @confirmation.
  ///
  /// In fr, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// No description provided for @untitled.
  ///
  /// In fr, this message translates to:
  /// **'Sans titre'**
  String get untitled;

  /// No description provided for @noSessions.
  ///
  /// In fr, this message translates to:
  /// **'Aucune session'**
  String get noSessions;

  /// No description provided for @unknownContact.
  ///
  /// In fr, this message translates to:
  /// **'Contact inconnu'**
  String get unknownContact;

  /// No description provided for @unnamed.
  ///
  /// In fr, this message translates to:
  /// **'Sans nom'**
  String get unnamed;

  /// No description provided for @noPendingRequestsAlt.
  ///
  /// In fr, this message translates to:
  /// **'Aucune demande en attente'**
  String get noPendingRequestsAlt;

  /// No description provided for @deleteAllCallHistory.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer tout l\'historique des appels ?'**
  String get deleteAllCallHistory;

  /// No description provided for @noCalls.
  ///
  /// In fr, this message translates to:
  /// **'Aucun appel'**
  String get noCalls;

  /// No description provided for @noPreferences.
  ///
  /// In fr, this message translates to:
  /// **'Aucune préférence'**
  String get noPreferences;

  /// No description provided for @resetAllMediaPrefs.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser toutes les préférences médias ?'**
  String get resetAllMediaPrefs;

  /// No description provided for @deleteThisAvatar.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cet avatar ?'**
  String get deleteThisAvatar;

  /// No description provided for @deleteAllAvatars.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer tous les avatars ?'**
  String get deleteAllAvatars;

  /// No description provided for @noAvatars.
  ///
  /// In fr, this message translates to:
  /// **'Aucun avatar'**
  String get noAvatars;

  /// No description provided for @deleteThisFile.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce fichier ?'**
  String get deleteThisFile;

  /// No description provided for @deleteAllMediaFiles.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer tous les médias ?'**
  String get deleteAllMediaFiles;

  /// No description provided for @noMediaFiles.
  ///
  /// In fr, this message translates to:
  /// **'Aucun média'**
  String get noMediaFiles;

  /// No description provided for @outgoing.
  ///
  /// In fr, this message translates to:
  /// **'Sortant'**
  String get outgoing;

  /// No description provided for @incoming.
  ///
  /// In fr, this message translates to:
  /// **'Entrant'**
  String get incoming;

  /// No description provided for @ephemeralViewDuration.
  ///
  /// In fr, this message translates to:
  /// **'Vue éphémère : {seconds}s'**
  String ephemeralViewDuration(int seconds);

  /// No description provided for @normalView.
  ///
  /// In fr, this message translates to:
  /// **'Vue normale'**
  String get normalView;

  /// No description provided for @callReasonCompleted.
  ///
  /// In fr, this message translates to:
  /// **'Terminé'**
  String get callReasonCompleted;

  /// No description provided for @callReasonMissed.
  ///
  /// In fr, this message translates to:
  /// **'Manqué'**
  String get callReasonMissed;

  /// No description provided for @callReasonDeclined.
  ///
  /// In fr, this message translates to:
  /// **'Refusé'**
  String get callReasonDeclined;

  /// No description provided for @callReasonFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échoué'**
  String get callReasonFailed;

  /// No description provided for @justNow.
  ///
  /// In fr, this message translates to:
  /// **'À l\'instant'**
  String get justNow;

  /// No description provided for @timeAgoMinutes.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {count} min'**
  String timeAgoMinutes(int count);

  /// No description provided for @timeAgoHours.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {count}h'**
  String timeAgoHours(int count);

  /// No description provided for @timeAgoDays.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {count}j'**
  String timeAgoDays(int count);

  /// No description provided for @messageTypeContact.
  ///
  /// In fr, this message translates to:
  /// **'Contact'**
  String get messageTypeContact;

  /// No description provided for @messageTypeLocation.
  ///
  /// In fr, this message translates to:
  /// **'Position'**
  String get messageTypeLocation;

  /// No description provided for @statusQueued.
  ///
  /// In fr, this message translates to:
  /// **'En file'**
  String get statusQueued;

  /// No description provided for @blockedBadge.
  ///
  /// In fr, this message translates to:
  /// **'Bloqué'**
  String get blockedBadge;

  /// No description provided for @protectedBadge.
  ///
  /// In fr, this message translates to:
  /// **'Protégée'**
  String get protectedBadge;

  /// No description provided for @messageCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} message(s)'**
  String messageCount(int count);

  /// No description provided for @deleteQuestion.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ?'**
  String get deleteQuestion;

  /// No description provided for @transferMyAccountTitle.
  ///
  /// In fr, this message translates to:
  /// **'Transférer mon compte'**
  String get transferMyAccountTitle;

  /// No description provided for @loadingError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur de chargement'**
  String get loadingError;

  /// No description provided for @transferToNewDevice.
  ///
  /// In fr, this message translates to:
  /// **'Transférer vers un nouvel appareil'**
  String get transferToNewDevice;

  /// No description provided for @transferInstructions.
  ///
  /// In fr, this message translates to:
  /// **'Sur votre nouvel appareil, choisissez \"Récupérer mon compte\" et entrez ces informations :'**
  String get transferInstructions;

  /// No description provided for @yourHashIdLabel.
  ///
  /// In fr, this message translates to:
  /// **'Votre Hash ID'**
  String get yourHashIdLabel;

  /// No description provided for @enterYourPinCode.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre code PIN'**
  String get enterYourPinCode;

  /// No description provided for @pinOwnerConfirmation.
  ///
  /// In fr, this message translates to:
  /// **'Pour confirmer que vous êtes le propriétaire de ce compte'**
  String get pinOwnerConfirmation;

  /// No description provided for @scanThisQrCode.
  ///
  /// In fr, this message translates to:
  /// **'Scannez ce QR code'**
  String get scanThisQrCode;

  /// No description provided for @withYourNewDevice.
  ///
  /// In fr, this message translates to:
  /// **'Avec votre nouvel appareil'**
  String get withYourNewDevice;

  /// No description provided for @orEnterTheCode.
  ///
  /// In fr, this message translates to:
  /// **'ou entrez le code'**
  String get orEnterTheCode;

  /// No description provided for @transferCodeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Code de transfert'**
  String get transferCodeLabel;

  /// No description provided for @proximityVerification.
  ///
  /// In fr, this message translates to:
  /// **'Vérification de proximité'**
  String get proximityVerification;

  /// No description provided for @bringDevicesCloser.
  ///
  /// In fr, this message translates to:
  /// **'Rapprochez les deux appareils'**
  String get bringDevicesCloser;

  /// No description provided for @confirmTransferQuestion.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le transfert ?'**
  String get confirmTransferQuestion;

  /// No description provided for @accountWillBeTransferred.
  ///
  /// In fr, this message translates to:
  /// **'Votre compte sera transféré vers le nouvel appareil.\n\nCet appareil sera définitivement déconnecté.'**
  String get accountWillBeTransferred;

  /// No description provided for @transferComplete.
  ///
  /// In fr, this message translates to:
  /// **'Transfert terminé'**
  String get transferComplete;

  /// No description provided for @transferSuccessMessage.
  ///
  /// In fr, this message translates to:
  /// **'Votre compte a été transféré avec succès.\n\nCette application va maintenant se fermer.'**
  String get transferSuccessMessage;

  /// No description provided for @manualVerification.
  ///
  /// In fr, this message translates to:
  /// **'Vérification manuelle'**
  String get manualVerification;

  /// No description provided for @codeDisplayedOnBothDevices.
  ///
  /// In fr, this message translates to:
  /// **'Code affiché sur les deux appareils :'**
  String get codeDisplayedOnBothDevices;

  /// No description provided for @doesCodeMatchNewDevice.
  ///
  /// In fr, this message translates to:
  /// **'Ce code correspond-il à celui du nouvel appareil ?'**
  String get doesCodeMatchNewDevice;

  /// No description provided for @verifiedStatus.
  ///
  /// In fr, this message translates to:
  /// **'Vérifié'**
  String get verifiedStatus;

  /// No description provided for @inProgressStatus.
  ///
  /// In fr, this message translates to:
  /// **'En cours...'**
  String get inProgressStatus;

  /// No description provided for @notAvailableStatus.
  ///
  /// In fr, this message translates to:
  /// **'Non disponible'**
  String get notAvailableStatus;

  /// No description provided for @codeExpiredRestart.
  ///
  /// In fr, this message translates to:
  /// **'Le code a expiré. Veuillez recommencer.'**
  String get codeExpiredRestart;

  /// No description provided for @codesDoNotMatchCancelled.
  ///
  /// In fr, this message translates to:
  /// **'Les codes ne correspondent pas. Transfert annulé.'**
  String get codesDoNotMatchCancelled;

  /// No description provided for @transferToDevice.
  ///
  /// In fr, this message translates to:
  /// **'Vers : {device}'**
  String transferToDevice(String device);

  /// No description provided for @copiedExclamation.
  ///
  /// In fr, this message translates to:
  /// **'Copié !'**
  String get copiedExclamation;

  /// No description provided for @expiresInTime.
  ///
  /// In fr, this message translates to:
  /// **'Expire dans {time}'**
  String expiresInTime(String time);

  /// No description provided for @biometricNotAvailable.
  ///
  /// In fr, this message translates to:
  /// **'La biométrie n\'est pas disponible sur cet appareil'**
  String get biometricNotAvailable;

  /// No description provided for @biometricAuthError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur lors de l\'authentification biométrique'**
  String get biometricAuthError;

  /// No description provided for @authenticateForBiometric.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez vous authentifier pour activer la biométrie'**
  String get authenticateForBiometric;

  /// No description provided for @biometricAuthFailed.
  ///
  /// In fr, this message translates to:
  /// **'Authentification biométrique échouée'**
  String get biometricAuthFailed;

  /// No description provided for @forceUpdateTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mise à jour requise'**
  String get forceUpdateTitle;

  /// No description provided for @forceUpdateMessage.
  ///
  /// In fr, this message translates to:
  /// **'Une nouvelle version de Hash est disponible. Veuillez mettre à jour pour continuer.'**
  String get forceUpdateMessage;

  /// No description provided for @updateButton.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour'**
  String get updateButton;

  /// No description provided for @maintenanceInProgress.
  ///
  /// In fr, this message translates to:
  /// **'Maintenance en cours'**
  String get maintenanceInProgress;

  /// No description provided for @tryAgainLater.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez réessayer plus tard'**
  String get tryAgainLater;

  /// No description provided for @information.
  ///
  /// In fr, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @later.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard'**
  String get later;

  /// No description provided for @doYouLikeHash.
  ///
  /// In fr, this message translates to:
  /// **'Aimez-vous Hash ?'**
  String get doYouLikeHash;

  /// No description provided for @yourFeedbackHelps.
  ///
  /// In fr, this message translates to:
  /// **'Votre avis nous aide à améliorer l\'application'**
  String get yourFeedbackHelps;

  /// No description provided for @ratingTerrible.
  ///
  /// In fr, this message translates to:
  /// **'Terrible'**
  String get ratingTerrible;

  /// No description provided for @ratingBad.
  ///
  /// In fr, this message translates to:
  /// **'Mauvais'**
  String get ratingBad;

  /// No description provided for @ratingOk.
  ///
  /// In fr, this message translates to:
  /// **'Correct'**
  String get ratingOk;

  /// No description provided for @ratingGood.
  ///
  /// In fr, this message translates to:
  /// **'Bien'**
  String get ratingGood;

  /// No description provided for @ratingExcellent.
  ///
  /// In fr, this message translates to:
  /// **'Excellent !'**
  String get ratingExcellent;

  /// No description provided for @donationMessage.
  ///
  /// In fr, this message translates to:
  /// **'Hash est un projet à but non lucratif. Votre soutien nous permet de continuer à développer une messagerie vraiment privée.'**
  String get donationMessage;

  /// No description provided for @recentConnections.
  ///
  /// In fr, this message translates to:
  /// **'Connexions récentes'**
  String get recentConnections;

  /// No description provided for @loginInfoText.
  ///
  /// In fr, this message translates to:
  /// **'Chaque déverrouillage par PIN est enregistré localement. Seules les 24 dernières heures sont conservées.'**
  String get loginInfoText;

  /// No description provided for @connectionCount.
  ///
  /// In fr, this message translates to:
  /// **'Connexion(s)'**
  String get connectionCount;

  /// No description provided for @periodLabel.
  ///
  /// In fr, this message translates to:
  /// **'Période'**
  String get periodLabel;

  /// No description provided for @historyLabel.
  ///
  /// In fr, this message translates to:
  /// **'Historique'**
  String get historyLabel;

  /// No description provided for @noLoginRecorded.
  ///
  /// In fr, this message translates to:
  /// **'Aucune connexion enregistrée'**
  String get noLoginRecorded;

  /// No description provided for @nextUnlocksAppearHere.
  ///
  /// In fr, this message translates to:
  /// **'Les prochains déverrouillages apparaîtront ici.'**
  String get nextUnlocksAppearHere;

  /// No description provided for @dataLocalOnly.
  ///
  /// In fr, this message translates to:
  /// **'Ces données sont stockées uniquement sur votre appareil et ne sont jamais transmises.'**
  String get dataLocalOnly;

  /// No description provided for @currentSession.
  ///
  /// In fr, this message translates to:
  /// **'Actuelle'**
  String get currentSession;

  /// No description provided for @todayLabel.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui'**
  String get todayLabel;

  /// No description provided for @yesterdayLabel.
  ///
  /// In fr, this message translates to:
  /// **'Hier'**
  String get yesterdayLabel;

  /// No description provided for @justNowLabel.
  ///
  /// In fr, this message translates to:
  /// **'À l\'instant'**
  String get justNowLabel;

  /// No description provided for @minutesAgoLabel.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {count} min'**
  String minutesAgoLabel(int count);

  /// No description provided for @hoursAgoLabel.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {hours}h'**
  String hoursAgoLabel(int hours);

  /// No description provided for @hoursMinutesAgoLabel.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {hours}h {minutes}min'**
  String hoursMinutesAgoLabel(int hours, int minutes);

  /// No description provided for @noMaintenancePlanned.
  ///
  /// In fr, this message translates to:
  /// **'Aucune maintenance prévue'**
  String get noMaintenancePlanned;

  /// No description provided for @everythingWorkingNormally.
  ///
  /// In fr, this message translates to:
  /// **'Tout fonctionne normalement'**
  String get everythingWorkingNormally;

  /// No description provided for @maintenanceTitle.
  ///
  /// In fr, this message translates to:
  /// **'Maintenance'**
  String get maintenanceTitle;

  /// No description provided for @maintenanceActiveLabel.
  ///
  /// In fr, this message translates to:
  /// **'EN COURS'**
  String get maintenanceActiveLabel;

  /// No description provided for @maintenancePlannedLabel.
  ///
  /// In fr, this message translates to:
  /// **'PRÉVUE'**
  String get maintenancePlannedLabel;

  /// No description provided for @locking.
  ///
  /// In fr, this message translates to:
  /// **'Verrouillage...'**
  String get locking;

  /// No description provided for @newMessageNotification.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau message'**
  String get newMessageNotification;

  /// No description provided for @secExplainTitle.
  ///
  /// In fr, this message translates to:
  /// **'Comment Hash te protège'**
  String get secExplainTitle;

  /// No description provided for @secExplainIntro.
  ///
  /// In fr, this message translates to:
  /// **'Hash est conçu pour que personne ne puisse lire tes messages.'**
  String get secExplainIntro;

  /// No description provided for @secExplainIntroSub.
  ///
  /// In fr, this message translates to:
  /// **'Pas même nous.\nVoici comment ça fonctionne, expliqué simplement.'**
  String get secExplainIntroSub;

  /// No description provided for @secJourneyLabel.
  ///
  /// In fr, this message translates to:
  /// **'LE PARCOURS'**
  String get secJourneyLabel;

  /// No description provided for @secJourneyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Le voyage de ton message'**
  String get secJourneyTitle;

  /// No description provided for @secJourneySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'De ton doigt jusqu\'à l\'écran de ton contact, chaque étape est protégée. Suis le chemin.'**
  String get secJourneySubtitle;

  /// No description provided for @secStep1Title.
  ///
  /// In fr, this message translates to:
  /// **'Tu écris ton message'**
  String get secStep1Title;

  /// No description provided for @secStep1Desc.
  ///
  /// In fr, this message translates to:
  /// **'Tu tapes \"Salut !\" dans l\'application. À ce moment, le message existe uniquement dans la mémoire de ton téléphone. Rien n\'a été envoyé.'**
  String get secStep1Desc;

  /// No description provided for @secStep2Title.
  ///
  /// In fr, this message translates to:
  /// **'Chiffrement avec le protocole Signal'**
  String get secStep2Title;

  /// No description provided for @secStep2Desc.
  ///
  /// In fr, this message translates to:
  /// **'Dès que tu appuies sur \"Envoyer\", ton message est transformé en une suite de caractères incompréhensibles. C\'est comme si ton message était enfermé dans un coffre-fort dont seul ton contact possède la clé.'**
  String get secStep2Desc;

  /// No description provided for @secStep3Title.
  ///
  /// In fr, this message translates to:
  /// **'Sealed Sender : l\'enveloppe invisible'**
  String get secStep3Title;

  /// No description provided for @secStep3Desc.
  ///
  /// In fr, this message translates to:
  /// **'Imagine que tu envoies une lettre par la poste, mais sans adresse d\'expéditeur sur l\'enveloppe. C\'est exactement ce que fait Hash. Le message est déposé dans une boîte aux lettres anonyme. Le serveur ne sait pas qui l\'a envoyé.'**
  String get secStep3Desc;

  /// No description provided for @secStep4Title.
  ///
  /// In fr, this message translates to:
  /// **'Le serveur ne voit rien'**
  String get secStep4Title;

  /// No description provided for @secStep4Desc.
  ///
  /// In fr, this message translates to:
  /// **'Le serveur joue le rôle d\'un facteur aveugle. Il sait juste \"quelqu\'un a déposé quelque chose dans la boîte #A7X9\". Il ne sait pas qui l\'a envoyé, ce que c\'est, ni à qui c\'est destiné.'**
  String get secStep4Desc;

  /// No description provided for @secStep4Highlight.
  ///
  /// In fr, this message translates to:
  /// **'Aucune métadonnée stockée : pas d\'adresse IP, pas d\'horodatage, pas de lien entre expéditeur et destinataire.'**
  String get secStep4Highlight;

  /// No description provided for @secStep5Title.
  ///
  /// In fr, this message translates to:
  /// **'Ton contact reçoit le message'**
  String get secStep5Title;

  /// No description provided for @secStep5Desc.
  ///
  /// In fr, this message translates to:
  /// **'Le téléphone de ton contact récupère le contenu de sa boîte aux lettres anonyme et déchiffre le message avec sa clé privée, qui n\'a jamais quitté son appareil. \"Salut !\" apparaît sur son écran.'**
  String get secStep5Desc;

  /// No description provided for @secStep6Title.
  ///
  /// In fr, this message translates to:
  /// **'Le message disparaît du serveur'**
  String get secStep6Title;

  /// No description provided for @secStep6Desc.
  ///
  /// In fr, this message translates to:
  /// **'Dès que ton contact confirme la réception, le serveur supprime définitivement le message. Pas de corbeille, pas d\'archive, pas de sauvegarde. Même les messages non lus sont automatiquement détruits après 24 heures.'**
  String get secStep6Desc;

  /// No description provided for @secStep7Title.
  ///
  /// In fr, this message translates to:
  /// **'Expiration locale'**
  String get secStep7Title;

  /// No description provided for @secStep7Desc.
  ///
  /// In fr, this message translates to:
  /// **'Sur le téléphone de ton contact, le message s\'auto-détruit selon la durée que tu as choisie : immédiatement après lecture, 5 minutes, 1 heure... tu décides.'**
  String get secStep7Desc;

  /// No description provided for @secJourneyConclusion.
  ///
  /// In fr, this message translates to:
  /// **'Résultat : zéro trace sur le serveur, zéro trace sur les appareils. Le message a existé le temps d\'être lu, puis il a disparu.'**
  String get secJourneyConclusion;

  /// No description provided for @secArchLabel.
  ///
  /// In fr, this message translates to:
  /// **'ARCHITECTURE'**
  String get secArchLabel;

  /// No description provided for @secArchTitle.
  ///
  /// In fr, this message translates to:
  /// **'5 couches de protection'**
  String get secArchTitle;

  /// No description provided for @secArchSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Hash ne repose pas sur une seule technologie. Chaque couche renforce les autres. Même si une couche est compromise, tes données restent en sécurité.'**
  String get secArchSubtitle;

  /// No description provided for @secLayer1Title.
  ///
  /// In fr, this message translates to:
  /// **'Chiffrement de bout en bout'**
  String get secLayer1Title;

  /// No description provided for @secLayer1Desc.
  ///
  /// In fr, this message translates to:
  /// **'Chaque message est chiffré avec une clé unique. En termes simples : même si quelqu\'un déchiffre un message, il ne pourra pas déchiffrer le suivant. Chaque message a son propre cadenas.'**
  String get secLayer1Desc;

  /// No description provided for @secLayer1Detail.
  ///
  /// In fr, this message translates to:
  /// **'Pour les fichiers (photos, vidéos, documents), Hash utilise un chiffrement AES-256-GCM supplémentaire. Le fichier est chiffré avant de quitter ton téléphone.'**
  String get secLayer1Detail;

  /// No description provided for @secLayer2Title.
  ///
  /// In fr, this message translates to:
  /// **'Sealed Sender (anonymat réseau)'**
  String get secLayer2Title;

  /// No description provided for @secLayer2Desc.
  ///
  /// In fr, this message translates to:
  /// **'Les messageries classiques envoient tes messages avec ton identité attachée. C\'est comme écrire ton nom sur l\'enveloppe. Hash utilise des boîtes aux lettres anonymes : le serveur dépose le message sans savoir qui l\'a envoyé.'**
  String get secLayer2Desc;

  /// No description provided for @secLayer2Detail.
  ///
  /// In fr, this message translates to:
  /// **'Résultat : même en cas de fuite de données du serveur, il est impossible de reconstituer qui parle à qui.'**
  String get secLayer2Detail;

  /// No description provided for @secLayer3Title.
  ///
  /// In fr, this message translates to:
  /// **'Suppression automatique'**
  String get secLayer3Title;

  /// No description provided for @secLayer3Desc.
  ///
  /// In fr, this message translates to:
  /// **'Les messages sont supprimés du serveur dès réception confirmée. Même si un message n\'est jamais récupéré, il est automatiquement détruit après 24 heures.'**
  String get secLayer3Desc;

  /// No description provided for @secLayer3Detail.
  ///
  /// In fr, this message translates to:
  /// **'Sur ton téléphone, les messages s\'auto-détruisent selon la durée que tu choisis : immédiatement, 5 min, 15 min, 30 min, 1h, 3h, 6h ou 12h.'**
  String get secLayer3Detail;

  /// No description provided for @secLayer4Title.
  ///
  /// In fr, this message translates to:
  /// **'Protection d\'accès local'**
  String get secLayer4Title;

  /// No description provided for @secLayer4Desc.
  ///
  /// In fr, this message translates to:
  /// **'L\'application est protégée par un code PIN à 6 chiffres et/ou la biométrie (Face ID, empreinte digitale). Après trop de tentatives échouées, l\'application se verrouille avec un délai qui augmente à chaque échec.'**
  String get secLayer4Desc;

  /// No description provided for @secLayer5Title.
  ///
  /// In fr, this message translates to:
  /// **'Base de données verrouillée'**
  String get secLayer5Title;

  /// No description provided for @secLayer5Desc.
  ///
  /// In fr, this message translates to:
  /// **'Côté serveur, aucun utilisateur ne peut écrire directement dans la base de données. Toutes les actions passent par des fonctions sécurisées qui vérifient chaque demande.'**
  String get secLayer5Desc;

  /// No description provided for @secLayer5Detail.
  ///
  /// In fr, this message translates to:
  /// **'C\'est comme un guichet de banque : tu ne touches jamais le coffre toi-même. Tu fais une demande, et le système vérifie que tu as le droit avant d\'agir.'**
  String get secLayer5Detail;

  /// No description provided for @secVashLabel.
  ///
  /// In fr, this message translates to:
  /// **'UNIQUE AU MONDE'**
  String get secVashLabel;

  /// No description provided for @secVashTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mode Vash'**
  String get secVashTitle;

  /// No description provided for @secVashSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Un système de sécurité d\'urgence qui n\'existe dans aucune autre application de messagerie.'**
  String get secVashSubtitle;

  /// No description provided for @secVashScenarioTitle.
  ///
  /// In fr, this message translates to:
  /// **'Imagine cette situation'**
  String get secVashScenarioTitle;

  /// No description provided for @secVashScenario1.
  ///
  /// In fr, this message translates to:
  /// **'Quelqu\'un accède à ton téléphone'**
  String get secVashScenario1;

  /// No description provided for @secVashScenario2.
  ///
  /// In fr, this message translates to:
  /// **'On te demande ton code PIN'**
  String get secVashScenario2;

  /// No description provided for @secVashScenario3.
  ///
  /// In fr, this message translates to:
  /// **'Tu veux effacer toutes tes données en urgence'**
  String get secVashScenario3;

  /// No description provided for @secVashSolutionTitle.
  ///
  /// In fr, this message translates to:
  /// **'La solution : deux codes PIN'**
  String get secVashSolutionTitle;

  /// No description provided for @secVashSolutionDesc.
  ///
  /// In fr, this message translates to:
  /// **'Tu configures deux codes PIN différents dans Hash :'**
  String get secVashSolutionDesc;

  /// No description provided for @secVashNormalCodeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Code normal'**
  String get secVashNormalCodeLabel;

  /// No description provided for @secVashNormalCodeDesc.
  ///
  /// In fr, this message translates to:
  /// **'Ouvre l\'application normalement avec toutes tes données'**
  String get secVashNormalCodeDesc;

  /// No description provided for @secVashCodeLabel2.
  ///
  /// In fr, this message translates to:
  /// **'Code Vash'**
  String get secVashCodeLabel2;

  /// No description provided for @secVashCodeDescription.
  ///
  /// In fr, this message translates to:
  /// **'Ouvre l\'application normalement... mais toutes tes données sont silencieusement supprimées en arrière-plan'**
  String get secVashCodeDescription;

  /// No description provided for @secVashWhatHappensTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ce qui se passe ensuite'**
  String get secVashWhatHappensTitle;

  /// No description provided for @secVashWhatHappensDesc.
  ///
  /// In fr, this message translates to:
  /// **'L\'application s\'ouvre normalement. Pas d\'alerte, pas d\'animation suspecte. L\'écran affiche simplement une application vide, comme si tu venais de l\'installer.\n\nEn réalité, toutes tes conversations, contacts et messages ont été irréversiblement supprimés en une fraction de seconde.'**
  String get secVashWhatHappensDesc;

  /// No description provided for @secCallsLabel.
  ///
  /// In fr, this message translates to:
  /// **'APPELS & FICHIERS'**
  String get secCallsLabel;

  /// No description provided for @secCallsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tout est chiffré'**
  String get secCallsTitle;

  /// No description provided for @secCallsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ce n\'est pas que les messages. Absolument tout ce qui transite par Hash est chiffré de bout en bout.'**
  String get secCallsSubtitle;

  /// No description provided for @secAudioCallTitle.
  ///
  /// In fr, this message translates to:
  /// **'Appels audio'**
  String get secAudioCallTitle;

  /// No description provided for @secAudioCallDesc.
  ///
  /// In fr, this message translates to:
  /// **'Chiffrés de bout en bout via WebRTC. La voix est transmise directement entre les appareils.'**
  String get secAudioCallDesc;

  /// No description provided for @secVideoCallTitle.
  ///
  /// In fr, this message translates to:
  /// **'Appels vidéo'**
  String get secVideoCallTitle;

  /// No description provided for @secVideoCallDesc.
  ///
  /// In fr, this message translates to:
  /// **'Même technologie, chaque flux chiffré individuellement.'**
  String get secVideoCallDesc;

  /// No description provided for @secPhotosTitle.
  ///
  /// In fr, this message translates to:
  /// **'Photos & vidéos'**
  String get secPhotosTitle;

  /// No description provided for @secPhotosDesc.
  ///
  /// In fr, this message translates to:
  /// **'Chiffrés en AES-256-GCM avant de quitter ton téléphone.'**
  String get secPhotosDesc;

  /// No description provided for @secDocsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Documents'**
  String get secDocsTitle;

  /// No description provided for @secDocsDesc.
  ///
  /// In fr, this message translates to:
  /// **'PDF, ZIP, tout fichier. Nom, taille et contenu chiffrés.'**
  String get secDocsDesc;

  /// No description provided for @secAnonLabel.
  ///
  /// In fr, this message translates to:
  /// **'ANONYMAT'**
  String get secAnonLabel;

  /// No description provided for @secAnonTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucune identité requise'**
  String get secAnonTitle;

  /// No description provided for @secAnonSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Hash ne demande jamais ton numéro de téléphone ni ton email. Tu es identifié par un Hash ID unique et anonyme.'**
  String get secAnonSubtitle;

  /// No description provided for @secHashIdTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ton Hash ID'**
  String get secHashIdTitle;

  /// No description provided for @secHashIdDesc.
  ///
  /// In fr, this message translates to:
  /// **'C\'est ton identifiant unique. Il ne révèle rien sur toi : ni ton nom, ni ton numéro, ni ta localisation. C\'est comme un pseudonyme impossible à relier à ta vraie identité.\n\nPour ajouter un contact, tu partages ton Hash ID ou tu scannes un QR code. C\'est tout. Pas de carnet d\'adresses synchronisé, pas de suggestions \"Personnes que tu connais\".'**
  String get secHashIdDesc;

  /// No description provided for @secDataLabel.
  ///
  /// In fr, this message translates to:
  /// **'DONNÉES'**
  String get secDataLabel;

  /// No description provided for @secDataTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ce que Hash ne sait pas'**
  String get secDataTitle;

  /// No description provided for @secDataSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'La meilleure façon de protéger tes données, c\'est de ne pas les collecter.'**
  String get secDataSubtitle;

  /// No description provided for @secNeverCollected.
  ///
  /// In fr, this message translates to:
  /// **'Jamais collecté'**
  String get secNeverCollected;

  /// No description provided for @secNeverItem1.
  ///
  /// In fr, this message translates to:
  /// **'Contenu des messages'**
  String get secNeverItem1;

  /// No description provided for @secNeverItem2.
  ///
  /// In fr, this message translates to:
  /// **'Liste de contacts'**
  String get secNeverItem2;

  /// No description provided for @secNeverItem3.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de téléphone'**
  String get secNeverItem3;

  /// No description provided for @secNeverItem4.
  ///
  /// In fr, this message translates to:
  /// **'Adresse email'**
  String get secNeverItem4;

  /// No description provided for @secNeverItem5.
  ///
  /// In fr, this message translates to:
  /// **'Adresse IP'**
  String get secNeverItem5;

  /// No description provided for @secNeverItem6.
  ///
  /// In fr, this message translates to:
  /// **'Localisation'**
  String get secNeverItem6;

  /// No description provided for @secNeverItem7.
  ///
  /// In fr, this message translates to:
  /// **'Métadonnées (qui parle à qui)'**
  String get secNeverItem7;

  /// No description provided for @secNeverItem8.
  ///
  /// In fr, this message translates to:
  /// **'Historique d\'appels'**
  String get secNeverItem8;

  /// No description provided for @secNeverItem9.
  ///
  /// In fr, this message translates to:
  /// **'Carnet d\'adresses'**
  String get secNeverItem9;

  /// No description provided for @secNeverItem10.
  ///
  /// In fr, this message translates to:
  /// **'Identifiants publicitaires'**
  String get secNeverItem10;

  /// No description provided for @secTempStored.
  ///
  /// In fr, this message translates to:
  /// **'Stocké temporairement'**
  String get secTempStored;

  /// No description provided for @secTempItem1.
  ///
  /// In fr, this message translates to:
  /// **'Hash ID anonyme (identifiant unique)'**
  String get secTempItem1;

  /// No description provided for @secTempItem2.
  ///
  /// In fr, this message translates to:
  /// **'Clés publiques de chiffrement'**
  String get secTempItem2;

  /// No description provided for @secTempItem3.
  ///
  /// In fr, this message translates to:
  /// **'Messages chiffrés en transit (max 24h)'**
  String get secTempItem3;

  /// No description provided for @secTempNote.
  ///
  /// In fr, this message translates to:
  /// **'Même ces données minimales ne permettent pas de t\'identifier. Ton Hash ID n\'est lié à aucune information personnelle.'**
  String get secTempNote;

  /// No description provided for @secFooterTitle.
  ///
  /// In fr, this message translates to:
  /// **'Ta vie privée, ta liberté'**
  String get secFooterTitle;

  /// No description provided for @secFooterDesc.
  ///
  /// In fr, this message translates to:
  /// **'Hash utilise les mêmes technologies de chiffrement que les applications professionnelles les plus exigeantes. Tes messages sont protégés par les mathématiques, pas par des promesses.'**
  String get secFooterDesc;

  /// No description provided for @sendSound.
  ///
  /// In fr, this message translates to:
  /// **'Son d\'envoi'**
  String get sendSound;

  /// No description provided for @sendSoundSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Jouer un son à l\'envoi d\'un message'**
  String get sendSoundSubtitle;

  /// No description provided for @appIcon.
  ///
  /// In fr, this message translates to:
  /// **'Icône de l\'app'**
  String get appIcon;

  /// No description provided for @appIconSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Changer l\'icône de l\'app'**
  String get appIconSubtitle;

  /// No description provided for @iconDefault.
  ///
  /// In fr, this message translates to:
  /// **'Hash'**
  String get iconDefault;

  /// No description provided for @iconBal.
  ///
  /// In fr, this message translates to:
  /// **'Equilibra'**
  String get iconBal;

  /// No description provided for @iconBell.
  ///
  /// In fr, this message translates to:
  /// **'Echo'**
  String get iconBell;

  /// No description provided for @iconCloud.
  ///
  /// In fr, this message translates to:
  /// **'Nimbus'**
  String get iconCloud;

  /// No description provided for @iconFog.
  ///
  /// In fr, this message translates to:
  /// **'Myst'**
  String get iconFog;

  /// No description provided for @iconGhost.
  ///
  /// In fr, this message translates to:
  /// **'Phantom'**
  String get iconGhost;

  /// No description provided for @iconGlass.
  ///
  /// In fr, this message translates to:
  /// **'Prism'**
  String get iconGlass;

  /// No description provided for @iconKey.
  ///
  /// In fr, this message translates to:
  /// **'Sipher'**
  String get iconKey;

  /// No description provided for @iconLock.
  ///
  /// In fr, this message translates to:
  /// **'Vault'**
  String get iconLock;

  /// No description provided for @iconMsg.
  ///
  /// In fr, this message translates to:
  /// **'Pulse'**
  String get iconMsg;

  /// No description provided for @iconRed.
  ///
  /// In fr, this message translates to:
  /// **'Vash'**
  String get iconRed;

  /// No description provided for @iconPyramid.
  ///
  /// In fr, this message translates to:
  /// **'Apex'**
  String get iconPyramid;

  /// No description provided for @iconRocket.
  ///
  /// In fr, this message translates to:
  /// **'Nova'**
  String get iconRocket;

  /// No description provided for @iconSun.
  ///
  /// In fr, this message translates to:
  /// **'Flare'**
  String get iconSun;

  /// No description provided for @iconAt.
  ///
  /// In fr, this message translates to:
  /// **'Abyss'**
  String get iconAt;

  /// No description provided for @notifyingContacts.
  ///
  /// In fr, this message translates to:
  /// **'Notification des contacts...'**
  String get notifyingContacts;

  /// No description provided for @deletingAccount.
  ///
  /// In fr, this message translates to:
  /// **'Suppression du compte...'**
  String get deletingAccount;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'af',
    'ar',
    'az',
    'bg',
    'bn',
    'bs',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'et',
    'eu',
    'fa',
    'fi',
    'fil',
    'fr',
    'ga',
    'gl',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'ka',
    'kk',
    'km',
    'kn',
    'ko',
    'ky',
    'lt',
    'lv',
    'mk',
    'ml',
    'mr',
    'ms',
    'my',
    'nb',
    'nl',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sl',
    'sq',
    'sr',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tr',
    'ug',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script+country codes are specified.
  switch (locale.toString()) {
    case 'zh_Hant_HK':
      return AppLocalizationsZhHantHk();
  }

  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'ar':
      return AppLocalizationsAr();
    case 'az':
      return AppLocalizationsAz();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'bs':
      return AppLocalizationsBs();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'eu':
      return AppLocalizationsEu();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'ga':
      return AppLocalizationsGa();
    case 'gl':
      return AppLocalizationsGl();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ka':
      return AppLocalizationsKa();
    case 'kk':
      return AppLocalizationsKk();
    case 'km':
      return AppLocalizationsKm();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ky':
      return AppLocalizationsKy();
    case 'lt':
      return AppLocalizationsLt();
    case 'lv':
      return AppLocalizationsLv();
    case 'mk':
      return AppLocalizationsMk();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'my':
      return AppLocalizationsMy();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sq':
      return AppLocalizationsSq();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'ug':
      return AppLocalizationsUg();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
