import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';
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
/// import 'l10n/app_localizations.dart';
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
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt'),
    Locale('zh'),
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

  /// No description provided for @conversations.
  ///
  /// In fr, this message translates to:
  /// \*\*'Chats'\*\*
  String get conversations;

  /// No description provided for @noConversation.
  ///
  /// In fr, this message translates to:
  /// \*\*'Aucun chat'\*\*
  String get noConversation;

  /// No description provided for @noConversationSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez un contact pour commencer à discuter en toute sécurité'**
  String get noConversationSubtitle;

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
  /// \*\*'Nouveau chat'\*\*
  String get newConversation;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
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
  /// **'Hash est un projet à but non lucratif'**
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

  /// No description provided for @security.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get security;

  /// No description provided for @accountSecurity.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité du compte'**
  String get accountSecurity;

  /// No description provided for @accountSecuritySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'PIN, biométrie, code piège'**
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

  /// No description provided for @autoLockDisabled.
  ///
  /// In fr, this message translates to:
  /// **'Désactivé'**
  String get autoLockDisabled;

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

  /// No description provided for @destructionCode.
  ///
  /// In fr, this message translates to:
  /// **'Code de destruction'**
  String get destructionCode;

  /// No description provided for @destructionCodeInfo.
  ///
  /// In fr, this message translates to:
  /// **'Si vous entrez ce code à la place de votre PIN :'**
  String get destructionCodeInfo;

  /// No description provided for @destructionDeleteMessages.
  ///
  /// In fr, this message translates to:
  /// **'Tous vos messages seront supprimés'**
  String get destructionDeleteMessages;

  /// No description provided for @destructionDeleteContacts.
  ///
  /// In fr, this message translates to:
  /// **'Tous vos contacts seront supprimés'**
  String get destructionDeleteContacts;

  /// No description provided for @destructionDeleteHistory.
  ///
  /// In fr, this message translates to:
  /// **'Votre historique d\'appels sera effacé'**
  String get destructionDeleteHistory;

  /// No description provided for @destructionKeepId.
  ///
  /// In fr, this message translates to:
  /// **'Votre identité Hash (#XXX-XXX-XXX) reste la même'**
  String get destructionKeepId;

  /// No description provided for @destructionAppearNormal.
  ///
  /// In fr, this message translates to:
  /// **'L\'application apparaîtra normale mais vide. Cette action est irréversible.'**
  String get destructionAppearNormal;

  /// No description provided for @setupDestructionCode.
  ///
  /// In fr, this message translates to:
  /// **'Configurer un code de destruction'**
  String get setupDestructionCode;

  /// No description provided for @modifyDestructionCode.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le code de destruction'**
  String get modifyDestructionCode;

  /// No description provided for @currentDestructionCode.
  ///
  /// In fr, this message translates to:
  /// **'Code de destruction actuel'**
  String get currentDestructionCode;

  /// No description provided for @newDestructionCode.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau code de destruction'**
  String get newDestructionCode;

  /// No description provided for @confirmDestructionCode.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le code'**
  String get confirmDestructionCode;

  /// No description provided for @destructionCodeConfigured.
  ///
  /// In fr, this message translates to:
  /// **'Code de destruction configuré'**
  String get destructionCodeConfigured;

  /// No description provided for @destructionCodeModified.
  ///
  /// In fr, this message translates to:
  /// **'Code de destruction modifié'**
  String get destructionCodeModified;

  /// No description provided for @destructionCodeMustDiffer.
  ///
  /// In fr, this message translates to:
  /// **'Le code de destruction doit être différent du code PIN'**
  String get destructionCodeMustDiffer;

  /// No description provided for @incorrectDestructionCode.
  ///
  /// In fr, this message translates to:
  /// **'Code de destruction incorrect'**
  String get incorrectDestructionCode;

  /// No description provided for @danger.
  ///
  /// In fr, this message translates to:
  /// **'Danger'**
  String get danger;

  /// No description provided for @panicButton.
  ///
  /// In fr, this message translates to:
  /// **'Bouton panique'**
  String get panicButton;

  /// No description provided for @panicButtonSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer toutes les données'**
  String get panicButtonSubtitle;

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
  /// **'Votre compte sera définitivement supprimé. Cette action est irréversible.\n\n• Tous vos chats\n• Tous vos contacts\n• Votre Hash ID\n\nVous devrez recréer un nouveau compte.'**
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

  /// No description provided for @panicConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bouton Panique'**
  String get panicConfirmTitle;

  /// No description provided for @panicConfirmMessage.
  ///
  /// In fr, this message translates to:
  /// **'Cette action supprimera TOUTES vos données de manière irréversible :\n\n• Tous vos messages\n• Tous vos contacts\n• Votre compte\n\nÊtes-vous absolument sûr ?'**
  String get panicConfirmMessage;

  /// No description provided for @deleteAll.
  ///
  /// In fr, this message translates to:
  /// **'TOUT SUPPRIMER'**
  String get deleteAll;

  /// No description provided for @dataDeletedForSecurity.
  ///
  /// In fr, this message translates to:
  /// **'Données supprimées par sécurité.'**
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
  /// **'Trop de tentatives'**
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
  /// **'Code PIN, mode panique et phrase de récupération'**
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

  /// No description provided for @deleteContact.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer le contact'**
  String get deleteContact;

  /// No description provided for @deleteContactConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer ce contact ?'**
  String get deleteContactConfirm;

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
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'it',
    'pt',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
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
