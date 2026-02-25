// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uighur Uyghur (`ug`).
class AppLocalizationsUg extends AppLocalizations {
  AppLocalizationsUg([String locale = 'ug']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'ئىز قالدۇرمايدۇ. تاۋۇر بەرمەيدۇ.';

  @override
  String get onboardingStatement1 => 'La messagerie qui ne sait rien de vous.';

  @override
  String get onboardingStatement2 => 'Chiffrement de bout en bout. Toujours.';

  @override
  String get onboardingStatement3 =>
      'Code VASH : Tout s\'efface. Sans laisser de trace.';

  @override
  String get onboardingStatement4 =>
      'Aucune publicité. Aucune revente de données.';

  @override
  String get onboardingStatement5 =>
      'Conçu pour vous protéger. Pas pour vous monétiser.';

  @override
  String get onboardingStatement6 => 'Un appareil. Un compte. Aucun cloud.';

  @override
  String get conversations => 'پاراڭلار';

  @override
  String get contacts => 'ئالاقىداشلار';

  @override
  String get noConversation => 'پاراڭ يوق';

  @override
  String get noConversationSubtitle =>
      'بىخەتەر پاراڭلاشتۇرۇش ئۈچۈن ئالاقىداش قوشۇڭ';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساقلاۋاتقان ئىلتىماسلار',
      one: '1 ساقلاۋاتقان ئىلتىماس',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count يوللانغان ئىلتىماسلار ساقلاۋاتىدۇ',
      one: '1 يوللانغان ئىلتىماس ساقلاۋاتىدۇ',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'ئالاقىداش قوشۇش';

  @override
  String get shareApp => 'ئەپنى ھەمبەھىرلەش';

  @override
  String get newMessage => 'يېڭى ئۇچۇر';

  @override
  String get newConversation => 'ئۇچۇر يوللاش';

  @override
  String get settings => 'تەڭشەكلەر';

  @override
  String get myHashId => 'مېنىڭ Hash ID';

  @override
  String get supportHash => 'Hash نى قوللاش';

  @override
  String get supportHashSubtitle => 'Hash پايدا ئىزدىمەيدىغان تۈر';

  @override
  String get donate => 'ئىئانە';

  @override
  String get appearance => 'كۆرۈنۈش';

  @override
  String get theme => 'تېما';

  @override
  String get themeAuto => 'ئاپتوماتىك';

  @override
  String get themeAutoSubtitle => 'سىستېما تەڭشىكىگە ئەگىشىدۇ';

  @override
  String get themeDark => 'قاراڭغۇ';

  @override
  String get themeLight => 'يورۇق';

  @override
  String get themeRecommendation =>
      'ياخشىراق مەخپىيەتلىك ئۈچۈن قاراڭغۇ تېما تەۋسىيە قىلىنىدۇ';

  @override
  String get language => 'تىل';

  @override
  String get languageAuto => 'ئاپتوماتىك (سىستېما)';

  @override
  String get notifications => 'ئۇقتۇرۇشلار';

  @override
  String get messages => 'ئۇچۇرلار';

  @override
  String get calls => 'چاقىرىشلار';

  @override
  String get vibration => 'تىترەش';

  @override
  String get notificationContent => 'ئۇقتۇرۇش مەزمۇنى';

  @override
  String get notificationContentFull => 'ھەممىنى كۆرسەت';

  @override
  String get notificationContentFullDesc =>
      'ئالاقىداش ئىسمى ۋە ئۇچۇر ئالدىن كۆرۈشى';

  @override
  String get notificationContentName => 'پەقەت ئىسىم';

  @override
  String get notificationContentNameDesc => 'پەقەت ئالاقىداش ئىسمىنى كۆرسىتىدۇ';

  @override
  String get notificationContentDiscrete => 'ئەستايىدىل';

  @override
  String get notificationContentDiscreteDesc => 'پەقەت «يېڭى ئۇچۇر» كۆرسىتىدۇ';

  @override
  String get security => 'بىخەتەرلىك';

  @override
  String get howHashProtectsYou => 'Hash سىزنى قانداق قوغدايدۇ';

  @override
  String get howHashProtectsYouSubtitle => 'بىخەتەرلىكىڭىزنى چۈشىنىڭ';

  @override
  String get accountSecurity => 'ھېسابات بىخەتەرلىكى';

  @override
  String get accountSecuritySubtitle => 'PIN، بىئولوگىيىلىك، Vash ھالىتى';

  @override
  String get blockScreenshots => 'ئېكران رەسىمىنى توسۇش';

  @override
  String get transferDevice => 'باشقا ئۈسكۈنىگە يۆتكەش';

  @override
  String get transferDeviceSubtitle => 'ھېساباتىڭىزنى يۆتكەڭ';

  @override
  String get pinCode => 'PIN كود';

  @override
  String get changePin => 'PIN كودنى ئۆزگەرتىش';

  @override
  String get currentPin => 'نۆۋەتتىكى PIN كود';

  @override
  String get newPin => 'يېڭى PIN كود';

  @override
  String get confirmPin => 'PIN كودنى جەزملەش';

  @override
  String get pinChanged => 'PIN كود ئۆزگەرتىلدى';

  @override
  String get incorrectPin => 'خاتا PIN';

  @override
  String get pinsDoNotMatch => 'PIN لار ماس كەلمىدى';

  @override
  String get autoLock => 'ئاپتوماتىك قۇلۇپلاش';

  @override
  String get autoLockDelay => 'قۇلۇپلاش كېچىكتۈرۈش';

  @override
  String get autoLockImmediate => 'دەرھال';

  @override
  String get autoLockMinute => '1 مىنۇت';

  @override
  String autoLockMinutes(int count) {
    return '$count مىنۇت';
  }

  @override
  String get vashCode => 'Vash كودى';

  @override
  String get vashModeTitle => 'Vash ھالىتى';

  @override
  String get vashModeExplanation => 'ئاخىرقى بىخەتەرلىك تورىڭىز.';

  @override
  String get vashModeDescription =>
      'سىز ئىككىنچى PIN كود تاللايسىز. ئەگەر سىزنى Hash ئېچىشقا مەجبۇرلىسا، نورمال PIN ئورنىغا بۇ كودنى كىرگۈزۈڭ.\n\nئەپ نورمال ئېچىلىدۇ، لېكىن بارلىق سۆھبەت ۋە ئالاقىداشلىرىڭىز يوقىلىدۇ.\n\nئېكرانىڭىزغا قاراۋاتقان ھەر كىشىگە، Hash بوش كۆرۈنىدۇ — ھەرگىز ئىشلەتمىگەندەك.';

  @override
  String get vashModeIrreversible => 'بۇ مەشغۇلات جىم ۋە قايتۇرغۇسىز.';

  @override
  String get chooseVashCode => 'Vash كودىمنى تاللاش';

  @override
  String get vashCodeInfo =>
      'ئەپنى نورمال لېكىن بوش ئاچىدىغان ئىككىنچى PIN كود.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'ئەگەر PIN ئورنىغا بۇ كودنى كىرگۈزسىڭىز:';

  @override
  String get vashDeleteContacts => 'ئالاقىداشلىرىڭىز يوقىلىدۇ';

  @override
  String get vashDeleteMessages => 'سۆھبەتلىرىڭىز يوقىلىدۇ';

  @override
  String get vashDeleteHistory => 'خاتىرىلىرىڭىز يوقىلىدۇ';

  @override
  String get vashKeepId => 'Hash كىملىكىڭىز (#XXX-XXX-XXX) ئۆزگەرمەيدۇ';

  @override
  String get vashAppearNormal =>
      'ئەپ نورمال لېكىن بوش كۆرۈنىدۇ، يېڭىدەك. بۇ مەشغۇلات قايتۇرغۇسىز.';

  @override
  String get setupVashCode => 'Vash كودىنى تەڭشەش';

  @override
  String get modifyVashCode => 'Vash كودىنى ئۆزگەرتىش';

  @override
  String get currentVashCode => 'نۆۋەتتىكى Vash كودى';

  @override
  String get newVashCode => 'يېڭى Vash كودى';

  @override
  String get confirmVashCode => 'Vash كودىنى جەزملەش';

  @override
  String get vashCodeConfigured => 'Vash كودى تەڭشەلدى';

  @override
  String get vashCodeModified => 'Vash كودى ئۆزگەرتىلدى';

  @override
  String get vashCodeMustDiffer => 'Vash كودى PIN دىن ئوخشىمىسلىقى كېرەك';

  @override
  String get incorrectVashCode => 'خاتا Vash كودى';

  @override
  String get vashWhatToDelete => 'Vash ھالىتى نېمىنى يوقىتىشى كېرەك؟';

  @override
  String get vashDeleteContactsOption => 'ئالاقىداشلار';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'ئۇچۇرلار';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'خاتىرىلەر';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash ھالىتى ئاكتىپلاندى';

  @override
  String get vashCreateSubtitle => 'ئاساسىي PIN دىن باشقا كود تاللاڭ';

  @override
  String get vashConfirmSubtitle => 'Vash كودىڭىزنى جەزملەڭ';

  @override
  String get pinCodeForEntry => 'ئەپكە كىرىش ئۈچۈن PIN كود';

  @override
  String get vashCodeSection => 'Vash ھالىتى';

  @override
  String get biometric => 'بىئولوگىيەلىك';

  @override
  String get biometricUnlock => 'بارماق ئىزى ياكى Face ID بىلەن قۇلۇپ ئېچىش';

  @override
  String get enableBiometric => 'بىئولوگىيەلىكنى قوزغىتىش';

  @override
  String get biometricWarningMessage =>
      'بىئولوگىيەلىكنى قوزغىتىش بىلەن، Vash كودىڭىزنى ئەپكە كىرىشكە ئىشلەتەلمەيسىز.\n\nVash كودىنى پەقەت بىئولوگىيەلىك مەغلۇب بولغاندا (بىر قانچە مەغلۇب سىناقتىن كېيىن) ئىشلەتەلەيسىز.\n\nداۋاملاشتۇرماقچىمۇ?';

  @override
  String get understood => 'چۈشەندىم';

  @override
  String get shareAppSubtitle => 'Hash نى يېقىنلىرىڭىز بىلەن ھەمبەھىرلەڭ';

  @override
  String get share => 'ھەمبەھىرلەش';

  @override
  String get danger => 'خەتەر';

  @override
  String get deleteAccount => 'ھېساباتىمنى ئۆچۈرۈش';

  @override
  String get deleteAccountSubtitle => 'قايتۇرغۇسىز مەشغۇلات';

  @override
  String get deleteAccountConfirmTitle => 'ھېساباتىمنى ئۆچۈرۈش';

  @override
  String get deleteAccountConfirmMessage =>
      'ھېساباتىڭىز مەڭگۈلۈك ئۆچۈرۈلىدۇ. بۇ مەشغۇلات قايتۇرغۇسىز.\n\n• بارلىق پاراڭلىرىڭىز\n• بارلىق ئالاقىداشلىرىڭىز\n• Hash ID ڭىز\n\nيېڭى ھېسابات قۇرۇشىڭىز كېرەك.';

  @override
  String get deleteForever => 'مەڭگۈلۈك ئۆچۈرۈش';

  @override
  String get cancel => 'بىكار قىلىش';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash ھالىتى ئاكتىپلاندى.';

  @override
  String deletionError(String error) {
    return 'ئۆچۈرۈش خاتالىقى: $error';
  }

  @override
  String get yourSecurity => 'بىخەتەرلىكىڭىز';

  @override
  String get securityInfo =>
      '• ئۇچتىن-ئۇچقا شىفىرلاش (Signal Protocol)\n• يەتكۈزگەندىن كېيىن مۇلازىمېتىردا سانلىق مەلۇمات يوق\n• ئاچقۇچلار پەقەت ئۈسكۈنىڭىزدە ساقلىنىدۇ\n• PIN كود ھەرگىز مۇلازىمېتىرغا يوللانمايدۇ';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'خۇش كەلدىڭىز';

  @override
  String get securityStatement1 => 'ئۇچۇرلىرىڭىز قوغدالغان.';

  @override
  String get securityStatement2 => 'ئۇچتىن-ئۇچقا شىفىرلاش.';

  @override
  String get securityStatement3 => 'ئىز يوق. تاۋۇر يوق.';

  @override
  String get securityStatement4 => 'مەخپىيەتلىكىڭىز بىر ھوقۇق.';

  @override
  String get accessBlocked => 'كىرىش توسۇلدى';

  @override
  String get tooManyAttempts => 'بەك كۆپ سىناش';

  @override
  String get pleaseWait => 'ساقلاڭ';

  @override
  String get waitDelay => 'كېچىكتۈرۈش ئاخىرلاشقۇچە ساقلاڭ';

  @override
  String attemptCount(int current, int max) {
    return 'سىناش $current / $max';
  }

  @override
  String retryIn(String time) {
    return '$time دىن كېيىن قايتا سىناڭ';
  }

  @override
  String get forgotPin =>
      'PIN ئۇنتۇلدىمۇ؟ ئەسلىگە كەلتۈرۈش ئىبارىسىنى ئىشلىتىڭ';

  @override
  String get useRecoveryPhrase => 'ئەسلىگە كەلتۈرۈش ئىبارىسىنى ئىشلىتىش';

  @override
  String get recoveryWarningTitle => 'ئاگاھلاندۇرۇش';

  @override
  String get recoveryWarningMessage => 'ھېسابات ئەسلىگە كەلتۈرۈش:';

  @override
  String get recoveryDeleteAllMessages => 'بارلىق ئۇچۇرلىرىڭىزنى ئۆچۈرىدۇ';

  @override
  String get recoveryWaitDelay => '1 سائەت كېچىكتۈرۈش تەلەپ قىلىنىدۇ';

  @override
  String get recoveryKeepContacts => 'ئالاقىداشلىرىڭىزنى ساقلايدۇ';

  @override
  String get recoveryIrreversible =>
      'بۇ مەشغۇلات قايتۇرغۇسىز. ئۇچۇرلىرىڭىز مەڭگۈلۈك يوقىلىدۇ.';

  @override
  String get iUnderstand => 'چۈشەندىم';

  @override
  String get accountRecovery => 'ھېسابات ئەسلىگە كەلتۈرۈش';

  @override
  String get enterRecoveryPhrase =>
      'ئەسلىگە كەلتۈرۈش ئىبارىسىنىڭ 24 سۆزىنى بوشلۇق بىلەن ئايرىپ كىرگۈزۈڭ.';

  @override
  String get recoveryPhraseHint => 'سۆز1 سۆز2 سۆز3 ...';

  @override
  String get recover => 'ئەسلىگە كەلتۈرۈش';

  @override
  String get recoveryPhraseRequired => 'ئەسلىگە كەلتۈرۈش ئىبارىسىنى كىرگۈزۈڭ';

  @override
  String get recoveryPhrase24Words => 'ئىبارە چوقۇم 24 سۆزدىن تۈزۈلىشى كېرەك';

  @override
  String get incorrectRecoveryPhrase => 'خاتا ئەسلىگە كەلتۈرۈش ئىبارىسى';

  @override
  String get recoveryInitError => 'ئەسلىگە كەلتۈرۈشنى باشلاشتا خاتالىق';

  @override
  String get securityDelay => 'بىخەتەرلىك كېچىكتۈرۈشى';

  @override
  String get securityDelayMessage =>
      'بىخەتەرلىكىڭىز ئۈچۈن، يېڭى PIN قۇرۇشتىن بۇرۇن كۈتۈش مەزگىلى تەلەپ قىلىنىدۇ.';

  @override
  String get timeRemaining => 'قالغان ۋاقىت';

  @override
  String get messagesDeletedForProtection =>
      'قوغداش ئۈچۈن ئۇچۇرلىرىڭىز ئۆچۈرۈلدى.';

  @override
  String get canCloseApp => 'ئەپنى ئېتىپ كېيىن قايتىپ كېلەلەيسىز.';

  @override
  String get onboardingTitle1 => 'Hash غا خۇش كەلدىڭىز';

  @override
  String get onboardingSubtitle1 => 'ئىز قالدۇرمايدىغان ئۇچۇرلاشقۇ';

  @override
  String get onboardingTitle2 => 'تولۇق شىفىرلاش';

  @override
  String get onboardingSubtitle2 =>
      'ئۇچۇرلىرىڭىز Signal protocol بىلەن ئۇچتىن-ئۇچقا شىفىرلانغان';

  @override
  String get onboardingTitle3 => 'ئىز يوق';

  @override
  String get onboardingSubtitle3 =>
      'يەتكۈزگەندىن كېيىن ئۇچۇرلار مۇلازىمېتىرلاردىن ئۆچۈرۈلىدۇ';

  @override
  String get onboardingTitle4 => 'بىخەتەرلىكىڭىز';

  @override
  String get onboardingSubtitle4 =>
      'PIN كود، Vash ھالىتى ۋە ئەسلىگە كەلتۈرۈش ئىبارىسى';

  @override
  String get getStarted => 'باشلاش';

  @override
  String get next => 'كېيىنكى';

  @override
  String get skip => 'ئاتلاش';

  @override
  String get alreadyHaveAccount => 'ھېساباتىم بار';

  @override
  String get transferMyAccount => 'ھېساباتىمنى يۆتكەش';

  @override
  String get createPin => 'PIN كود قۇرۇش';

  @override
  String get createPinSubtitle => 'بۇ كود ئەپنىڭ كىرىشىنى قوغدايدۇ';

  @override
  String get confirmYourPin => 'PIN كودىڭىزنى جەزملەڭ';

  @override
  String get confirmPinSubtitle => 'PIN كودىڭىزنى قايتا كىرگۈزۈڭ';

  @override
  String get saveRecoveryPhrase => 'ئەسلىگە كەلتۈرۈش ئىبارىسى';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'بۇ 24 سۆزنى تەرتىپ بويىچە يېزىپ قويۇڭ. PIN ئۇنتۇلسا ھېساباتنى ئەسلىگە كەلتۈرەلەيسىز.';

  @override
  String get phraseWritten => 'ئىبارىمنى يېزىپ بولدۇم';

  @override
  String get warningRecoveryPhrase =>
      'بۇ ئىبارىنى يوقىتىپ PIN نى ئۇنتۇسىڭىز، ھېساباتقا كىرەلمەيسىز.';

  @override
  String get accountTransferred => 'ھېسابات يۆتكەلدى';

  @override
  String get accountTransferredMessage =>
      'ھېساباتىڭىز باشقا ئۈسكۈنىگە يۆتكەلدى. بۇ يىغىن ئەمدى ئىناۋەتسىز.';

  @override
  String get accountTransferredInfo =>
      'بۇ يۆتكەشنى سىز باشلىمىغان بولسىڭىز، ھېساباتىڭىز خەتەرگە ئۇچرىغان بولۇشى مۇمكىن.';

  @override
  String get logout => 'چېكىنىش';

  @override
  String get transferAccount => 'ھېسابات يۆتكەش';

  @override
  String get transferAccountInfo =>
      'Hash ھېساباتىڭىزنى يېڭى ئۈسكۈنىگە يۆتكەڭ. نۆۋەتتىكى يىغىنىڭىز ئىناۋەتسىز بولىدۇ.';

  @override
  String get generateTransferCode => 'يۆتكەش كودى ھاسىللاش';

  @override
  String get transferCode => 'يۆتكەش كودى';

  @override
  String transferCodeExpires(int minutes) {
    return 'بۇ كود $minutes مىنۇتتا ۋاقتى ئۆتىدۇ';
  }

  @override
  String get enterCodeOnNewDevice =>
      'ھېساباتىڭىزنى يۆتكەش ئۈچۈن يېڭى ئۈسكۈنىدە بۇ كودنى كىرگۈزۈڭ.';

  @override
  String get generateNewCode => 'يېڭى كود ھاسىللاش';

  @override
  String get scanQrCode => 'QR code سىكانىرلاش';

  @override
  String get scanQrCodeSubtitle => 'ئالاقىداشنىڭ QR code نى سىكانىرلاپ قوشۇڭ';

  @override
  String get qrCodeDetected => 'QR code بايقالدى';

  @override
  String get invalidQrCode => 'ئىناۋەتسىز QR code';

  @override
  String get cameraPermissionRequired => 'كامېرا ئىجازىتى تەلەپ قىلىنىدۇ';

  @override
  String get myQrCode => 'مېنىڭ QR code';

  @override
  String get myQrCodeSubtitle =>
      'ئالاقىداشلىرىڭىز سىزنى قوشالاشى ئۈچۈن بۇ QR code نى ھەمبەھىرلەڭ';

  @override
  String get shareQrCode => 'ھەمبەھىرلەش';

  @override
  String get addContactTitle => 'ئالاقىداش قوشۇش';

  @override
  String get addContactByHashId => 'ئالاقىداشىڭىزنىڭ Hash ID سىنى كىرگۈزۈڭ';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'ئىزدەش';

  @override
  String get contactNotFound => 'ئالاقىداش تېپىلمىدى';

  @override
  String get contactAlreadyAdded => 'بۇ ئالاقىداش تىزىملىكتە بار';

  @override
  String get contactAdded => 'ئالاقىداش قوشۇلدى';

  @override
  String get myProfile => 'مېنىڭ تەرجىمىھالىم';

  @override
  String get myProfileSubtitle =>
      'باشقىلار سىزنى قوشالاشى ئۈچۈن بۇ ئۇچۇرنى ھەمبەھىرلەڭ';

  @override
  String get temporaryCode => 'ۋاقىتلىق كود';

  @override
  String temporaryCodeExpires(String time) {
    return '$time دا ۋاقتى ئۆتىدۇ';
  }

  @override
  String get codeExpired => 'كود ۋاقتى ئۆتتى';

  @override
  String get generateNewCodeButton => 'يېڭى كود';

  @override
  String get copyHashId => 'ID كۆچۈرۈش';

  @override
  String get copyCode => 'كود كۆچۈرۈش';

  @override
  String get copiedToClipboard => 'كۆچۈرۈلدى';

  @override
  String get showMyQrCode => 'QR code منى كۆرسەت';

  @override
  String get orDivider => 'ياكى';

  @override
  String get openScanner => 'سىكانېرنى ئاچ';

  @override
  String get addManually => 'قولدا قوشۇش';

  @override
  String get contactHashIdLabel => 'ئالاقىداشنىڭ Hash ID سى';

  @override
  String get temporaryCodeLabel => 'ۋاقىتلىق كود';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'ئالاقىداشىڭىزدىن تەرجىمىھالىدىن كود ھاسىللاشنى سوراڭ';

  @override
  String get verifyAndAdd => 'تەكشۈرۈپ قوشۇش';

  @override
  String get fillAllFields => 'بارلىق بۆلەكلەرنى تولدۇرۇڭ';

  @override
  String get invalidHashIdFormat =>
      'ئىناۋەتسىز ID فورماتى (مەسىلەن: 123-456-ABC)';

  @override
  String get userNotFound => 'ئىشلەتكۈچى تېپىلمىدى';

  @override
  String get cannotAddYourself => 'ئۆزىڭىزنى قوشالمايسىز';

  @override
  String get invalidOrExpiredCode =>
      'ئىناۋەتسىز ياكى ۋاقتى ئۆتكەن ۋاقىتلىق كود';

  @override
  String get contactFound => 'ئالاقىداش تېپىلدى!';

  @override
  String get howToCallContact => 'ئۇلارنى نېمە دەپ ئاتىماقچى؟';

  @override
  String get contactNameHint => 'ئالاقىداش ئىسمى';

  @override
  String get addContactButton => 'قوشۇش';

  @override
  String get contactDetails => 'ئالاقىداش تەپسىلاتى';

  @override
  String get contactName => 'ئالاقىداش ئىسمى';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date دا قوشۇلغان';
  }

  @override
  String get deleteContact => 'ئالاقىداش ئۆچۈرۈش';

  @override
  String deleteContactConfirm(Object name) {
    return 'بۇ ئالاقىداشنى ئۆچۈرەمسىز؟';
  }

  @override
  String get deleteContactMessage => 'بۇ پۈتۈن پاراڭنىمۇ ئۆچۈرىدۇ.';

  @override
  String get delete => 'ئۆچۈرۈش';

  @override
  String get typeMessage => 'ئۇچۇر يېزىڭ...';

  @override
  String get messageSent => 'يوللاندى';

  @override
  String get messageDelivered => 'يەتكۈزۈلدى';

  @override
  String get messageRead => 'ئوقۇلدى';

  @override
  String get messageFailed => 'يوللاش مەغلۇب بولدى';

  @override
  String get now => 'ھازىر';

  @override
  String minutesAgo(int count) {
    return '$countمىن';
  }

  @override
  String hoursAgo(int count) {
    return '$countسائ';
  }

  @override
  String daysAgo(int count) {
    return '$countكۈن';
  }

  @override
  String get today => 'بۈگۈن';

  @override
  String get yesterday => 'تۈنۈگۈن';

  @override
  String dateAtTime(String date, String time) {
    return '$date سائەت $time';
  }

  @override
  String get shareMessage =>
      'Hash دا ماڭا قوشۇلۇڭ! 🔒\n\nبۇ ھەقىقىي مەخپىي ئۇچۇرلاشقۇ: تولۇق شىفىرلاش، مۇلازىمېتىرلاردا ئىز يوق ۋە لازىم بولسا ۋەھىمە ھالىتى.\n\nئەپنى بۇ يەردىن چۈشۈرۈڭ 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'خاتالىق';

  @override
  String get ok => 'ماقۇل';

  @override
  String get view => 'كۆرۈش';

  @override
  String get yes => 'ھەئە';

  @override
  String get no => 'ياق';

  @override
  String get save => 'ساقلاش';

  @override
  String get edit => 'تەھرىرلەش';

  @override
  String get close => 'تاقاش';

  @override
  String get confirm => 'جەزملەش';

  @override
  String get loading => 'يۈكلىنىۋاتىدۇ...';

  @override
  String get retry => 'قايتا سىناش';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'ساقلاۋاتقان ئىلتىماسلار';

  @override
  String get noPendingRequests => 'ساقلاۋاتقان ئىلتىماس يوق';

  @override
  String get pendingRequestsSubtitle => 'بۇ كىشىلەر سىزنى قوشماقچى';

  @override
  String requestFromUser(String hashId) {
    return '$hashId دىن ئىلتىماس';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days كۈندىن كېيىن ۋاقتى ئۆتىدۇ';
  }

  @override
  String get acceptRequest => 'قوبۇل قىلىش';

  @override
  String get rejectRequest => 'رەت قىلىش';

  @override
  String get requestAccepted => 'ئىلتىماس قوبۇل قىلىندى';

  @override
  String get requestRejected => 'ئىلتىماس رەت قىلىندى';

  @override
  String get requestSent => 'ئىلتىماس يوللاندى!';

  @override
  String get requestSentSubtitle =>
      'ئىلتىماسىڭىز يوللاندى. پاراڭلاشتىن بۇرۇن ئىشلەتكۈچى قوبۇل قىلىشى كېرەك.';

  @override
  String get requestAlreadyPending => 'ئىلتىماس ساقلاۋاتىدۇ';

  @override
  String get requestAlreadySentByOther => 'بۇ كىشى سىزگە ئىلتىماس يوللىغان';

  @override
  String get addByHashId => 'Hash ID بىلەن قوشۇش';

  @override
  String get addByHashIdSubtitle =>
      'ئالاقىداشنىڭ Hash ID سى ۋە ۋاقىتلىق كودنى كىرگۈزۈڭ';

  @override
  String get enterTemporaryCode => '6 خانىلىق كودنى كىرگۈزۈڭ';

  @override
  String get sendRequest => 'ئىلتىماس يوللاش';

  @override
  String get acceptContactTitle => 'ئالاقىداش قوبۇل قىلىش';

  @override
  String get acceptContactSubtitle => 'ئۇلارغا ئالاھىدە ئىسىم بەرسىڭىز بولىدۇ';

  @override
  String get leaveEmptyForHashId => 'Hash ID ئىشلىتىش ئۈچۈن بوش قالدۇرۇڭ';

  @override
  String get firstName => 'ئىسمى';

  @override
  String get lastName => 'فامىلىسى';

  @override
  String get notes => 'خاتىرىلەر';

  @override
  String get notesHint => 'بۇ ئالاقىداش ھەققىدە شەخسىي خاتىرىلەر';

  @override
  String get photoOptional => 'رەسىم (ئىختىيارىي)';

  @override
  String get contactNameOptional => 'ئىسىم (ئىختىيارىي)';

  @override
  String get notesOptional => 'خاتىرىلەر (ئىختىيارىي)';

  @override
  String get storedLocally => 'پەقەت ئۈسكۈنىڭىزدە ساقلىنىدۇ';

  @override
  String get encryptedMessageLabel => 'شىفىرلانغان ئۇچۇر';

  @override
  String get identityMessageHint => 'سىز كىم؟ بىر-بىرىڭىزنى قانداق تونۇيسىز؟';

  @override
  String get messageWillBeSentEncrypted =>
      'بۇ ئۇچۇر شىفىرلىنىپ تاپشۇرۇۋالغۇچىغا يوللىنىدۇ';

  @override
  String get sendRequestButton => 'ئىلتىماس يوللاش';

  @override
  String get requestExpiresIn24h =>
      'قوبۇل قىلىنمىسا ئىلتىماس 24 سائەتتە ۋاقتى ئۆتىدۇ';

  @override
  String get theyAlreadySentYouRequest => 'بۇ كىشى سىزگە ئىلتىماس يوللىغان';

  @override
  String get requests => 'ئىلتىماسلار';

  @override
  String get receivedRequests => 'كەلگەن';

  @override
  String get sentRequests => 'يوللانغان';

  @override
  String get noSentRequests => 'يوللانغان ئىلتىماس يوق';

  @override
  String get cancelRequest => 'بىكار قىلىش';

  @override
  String get deleteRequest => 'ئىلتىماس ئۆچۈرۈش';

  @override
  String get requestCancelled => 'ئىلتىماس بىكار قىلىندى';

  @override
  String sentTo(String hashId) {
    return '$hashId غا يوللاندى';
  }

  @override
  String expiresIn(String time) {
    return '$time دا ۋاقتى ئۆتىدۇ';
  }

  @override
  String receivedAgo(String time) {
    return '$time ئىلگىرى كەلگەن';
  }

  @override
  String get messageFromRequester => 'ئىلتىماسچىدىن ئۇچۇر';

  @override
  String get copy => 'كۆچۈرۈش';

  @override
  String get messageInfo => 'ئۇچۇر ئۇچۇرى';

  @override
  String get messageDirection => 'يۆنىلىش';

  @override
  String get messageSentByYou => 'سىز يوللىدىڭىز';

  @override
  String get messageReceived => 'كەلدى';

  @override
  String get messageSentAt => 'يوللانغان ۋاقىت';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'ھالەت';

  @override
  String get messageReadAt => 'ئوقۇلغان ۋاقىت';

  @override
  String get messageType => 'تۈرى';

  @override
  String get messageSize => 'چوڭلۇقى';

  @override
  String get messageExpiresAt => 'ۋاقتى ئۆتىدىغان ۋاقىت';

  @override
  String get messageEncrypted => 'ئۇچتىن-ئۇچقا شىفىرلانغان';

  @override
  String get messageStatusSending => 'يوللاۋاتىدۇ...';

  @override
  String get messageStatusSent => 'يوللاندى';

  @override
  String get messageStatusDelivered => 'يەتكۈزۈلدى';

  @override
  String get messageStatusRead => 'ئوقۇلدى';

  @override
  String get messageStatusFailed => 'مەغلۇب';

  @override
  String get serverStatus => 'مۇلازىمېتىر';

  @override
  String get onServer => 'يەتكۈزۈش ساقلاۋاتىدۇ';

  @override
  String get deletedFromServer => 'ئۆچۈرۈلدى';

  @override
  String get messageTypeText => 'تېكىست';

  @override
  String get messageTypeImage => 'رەسىم';

  @override
  String get messageTypeVideo => 'سىن';

  @override
  String get messageTypeVoice => 'ئاۋاز';

  @override
  String get messageTypeFile => 'ھۆججەت';

  @override
  String get indefinitely => 'چەكسىز';

  @override
  String get hoursShort => 'سائ';

  @override
  String get minutesShort => 'مىن';

  @override
  String get hours => 'سائەت';

  @override
  String get minutes => 'مىنۇت';

  @override
  String get seconds => 'سېكۇنت';

  @override
  String get ephemeralMessages => 'ۋاقىتلىق ئۇچۇرلار';

  @override
  String get ephemeralMessagesDescription =>
      'بۇ ۋاقىتتىن كېيىن ئۇچۇرلار ئاپتوماتىك ئۆچۈرۈلىدۇ';

  @override
  String get ephemeralImmediate => 'دەرھال (ئوقۇغاندىن كېيىن)';

  @override
  String get ephemeralImmediateDesc => 'ئوقۇغاندىلا ئۆچۈرۈلىدۇ';

  @override
  String get ephemeralMyPreference => 'مېنىڭ مايىللىقىم';

  @override
  String get ephemeralMyPreferenceDesc => 'ئومۇمىي تەڭشەكنى ئىشلىتىش';

  @override
  String get ephemeralDefaultSetting => 'ئۇچۇر مۇددىتى';

  @override
  String get ephemeralChooseDefault => 'تەۋسىيە';

  @override
  String get ephemeral30Seconds => '30 سېكۇنت';

  @override
  String get ephemeral30SecondsDesc => 'ئوقۇغاندىن 30 سېكۇنت كېيىن ئۆچۈرۈلىدۇ';

  @override
  String get ephemeral5Minutes => '5 مىنۇت';

  @override
  String get ephemeral5MinutesDesc => 'ئوقۇغاندىن 5 مىنۇت كېيىن ئۆچۈرۈلىدۇ';

  @override
  String get ephemeral1Hour => '1 سائەت';

  @override
  String get ephemeral1HourDesc => 'ئوقۇغاندىن 1 سائەت كېيىن ئۆچۈرۈلىدۇ';

  @override
  String get ephemeral3Hours => '3 سائەت';

  @override
  String get ephemeral6Hours => '6 سائەت';

  @override
  String get ephemeral6HoursDesc => 'ئوقۇغاندىن 6 سائەت كېيىن ئۆچۈرۈلىدۇ';

  @override
  String get ephemeral12Hours => '12 سائەت';

  @override
  String get ephemeral24Hours => '24 سائەت';

  @override
  String get ephemeral24HoursDesc => 'ئوقۇغاندىن 24 سائەت كېيىن ئۆچۈرۈلىدۇ';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'ئىختىيارىي مۇددەت';

  @override
  String get howItWorks => 'قانداق ئىشلەيدۇ';

  @override
  String get ephemeralExplanation1 =>
      'ئۇچۇرلار كەلگەندىلا مۇلازىمېتىردىن ئۆچۈرۈلىدۇ.';

  @override
  String get ephemeralExplanation2 =>
      'بۇ تەڭشەك ئوقۇغاندىن كېيىن تېلېفونىڭىزدىن ئۇچۇرلار قاچان يوقىلىدىغانلىقىنى بەلگىلەيدۇ.';

  @override
  String get ephemeralExplanation3 =>
      'ئالاقىداشىڭىزنىڭ ئۆز تېلېفونى ئۈچۈن ئۆز تەڭشىكى بار.';

  @override
  String get mute1Hour => '1 سائەت';

  @override
  String get mute8Hours => '8 سائەت';

  @override
  String get mute1Day => '1 كۈن';

  @override
  String get mute1Week => '1 ھەپتە';

  @override
  String get muteAlways => 'ھەمىشە';

  @override
  String get muteExplanation => 'بۇ ئالاقىداشتىن ئۇقتۇرۇش كەلمەيدۇ';

  @override
  String get showCallsInRecents => 'يېقىنقى چاقىرىقلاردا كۆرسەت';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash چاقىرىقلىرى تېلېفون تارىخىدا كۆرۈنىدۇ';

  @override
  String get feedback => 'ئىنكاس';

  @override
  String get muteNotifications => 'ئۇقتۇرۇشلارنى ئۈنسىز قىلىش';

  @override
  String get muteDescription => 'بۇ ئالاقىداشتىن ئۇقتۇرۇش كەلمەيدۇ';

  @override
  String mutedUntil(String time) {
    return '$time غىچە ئۈنسىز';
  }

  @override
  String get notMuted => 'ئۇقتۇرۇشلار ئاكتىپ';

  @override
  String get unmute => 'ئۈن ئاچ';

  @override
  String get notificationSound => 'ئۇقتۇرۇش ئاۋازى';

  @override
  String get defaultSound => 'سۈكۈتتىكى';

  @override
  String get chatSettings => 'پاراڭ تەڭشىكى';

  @override
  String get bubbleColor => 'كۆپۈكچە رەڭگى';

  @override
  String get backgroundColor => 'تەگلىك رەڭگى';

  @override
  String get backgroundImage => 'تەگلىك رەسىمى';

  @override
  String get chatBackground => 'پاراڭ تەگلىكى';

  @override
  String get customColor => 'ئىختىيارىي';

  @override
  String get defaultColor => 'سۈكۈتتىكى';

  @override
  String get imageSelected => 'رەسىم تاللاندى';

  @override
  String get noImage => 'رەسىم يوق';

  @override
  String get color => 'رەڭ';

  @override
  String get image => 'رەسىم';

  @override
  String get tapToSelectImage => 'رەسىم تاللاش ئۈچۈن چېكىڭ';

  @override
  String get changeImage => 'رەسىم ئۆزگەرتىش';

  @override
  String get previewMessageReceived => 'ياخشىمۇسىز!';

  @override
  String get previewMessageSent => 'سالام!';

  @override
  String get messageAction => 'ئۇچۇر';

  @override
  String get callAction => 'چاقىرىش';

  @override
  String get videoAction => 'سىن';

  @override
  String get personalNotes => 'شەخسىي خاتىرىلەر';

  @override
  String get addNotes => 'خاتىرە قوشۇش...';

  @override
  String get noNotes => 'خاتىرە يوق';

  @override
  String get messageNotifications => 'ئۇچۇر ئۇقتۇرۇشى';

  @override
  String get callNotifications => 'چاقىرىش ئۇقتۇرۇشى';

  @override
  String get useGradient => 'گرادىيېنت ئىشلىتىش';

  @override
  String get gradientStart => 'باشلىنىش رەڭگى';

  @override
  String get gradientEnd => 'ئاخىرقى رەڭگى';

  @override
  String get preview => 'ئالدىن كۆرۈش';

  @override
  String get reset => 'ئەسلىگە قايتۇرۇش';

  @override
  String get securityNumber => 'بىخەتەرلىك نومۇرى';

  @override
  String securityNumberDescription(String name) {
    return 'بىخەتەرلىك نومۇرى $name نىڭ ئۈسكۈنىسى بىلەن ماسلىشىدىغانلىقىنى تەكشۈرۈڭ';
  }

  @override
  String get verifyEncryption => 'ئۇچتىن-ئۇچقا شىفىرلاشنى تەكشۈرۈش';

  @override
  String get tapToCopy => 'كۆچۈرۈش ئۈچۈن چېكىڭ';

  @override
  String get howToVerify => 'قانداق تەكشۈرۈش';

  @override
  String get verifyStep1 =>
      'ئالاقىداشىڭىز بىلەن يۈزمۇ-يۈز كۆرۈشۈڭ ياكى چاقىرىڭ';

  @override
  String get verifyStep2 =>
      'بىخەتەرلىك نومۇرلىرىنى سېلىشتۇرۇڭ ياكى QR code سىكانىرلاڭ';

  @override
  String get verifyStep3 => 'ماس كەلسە، پاراڭىڭىز بىخەتەر';

  @override
  String get scanToVerify => 'تەكشۈرۈش ئۈچۈن سىكانىرلاش';

  @override
  String get reportSpam => 'ئەخلەت خەت دوكلاتىش';

  @override
  String get reportSpamSubtitle => 'بۇ ئالاقىداشنى ئەخلەت دەپ دوكلاتىش';

  @override
  String get reportSpamDescription =>
      'بۇ ئالاقىداشنى نامسىز دوكلاتىدۇ. كىملىكىڭىز ئاشكارىلانمايدۇ. جەزىملىمۇ؟';

  @override
  String get report => 'دوكلاتىش';

  @override
  String get spamReported => 'ئەخلەت خەت دوكلاتىلدى';

  @override
  String get reportError => 'دوكلات يوللاش مەغلۇب بولدى. قايتا سىناڭ.';

  @override
  String get reportRateLimited => 'بۈگۈنكى ئەڭ كۆپ دوكلات سانىغا يەتتىڭىز.';

  @override
  String get blockContact => 'ئالاقىداش توسۇش';

  @override
  String get blockContactDescription =>
      'بۇ ئالاقىداش سىزگە ئۇچۇر يوللاش ياكى چاقىرىش ئىمكانىيىتىدىن مەھرۇم بولىدۇ. ئۇقتۇرۇش بېرىلمەيدۇ.';

  @override
  String get unblockContact => 'ئالاقىداش توسۇشنى ئېچىش';

  @override
  String get unblockContactDescription =>
      'بۇ ئالاقىداش قايتا ئۇچۇر يوللاش ۋە چاقىرىش ئىمكانىيىتىگە ئېرىشىدۇ.';

  @override
  String get contactBlocked => 'ئالاقىداش توسۇلدى';

  @override
  String get contactUnblocked => 'ئالاقىداش توسۇشى ئېچىلدى';

  @override
  String get contactIsBlocked => 'بۇ ئالاقىداش توسۇلغان';

  @override
  String get unblock => 'توسۇشنى ئېچىش';

  @override
  String get deleteContactSubtitle => 'بۇ ئالاقىداش ۋە پاراڭنى ئۆچۈرۈش';

  @override
  String get confirmWithPin => 'PIN بىلەن جەزملەش';

  @override
  String get enterPinToConfirm => 'بۇ مەشغۇلاتنى جەزملەش ئۈچۈن PIN كىرگۈزۈڭ';

  @override
  String get profilePhoto => 'تەرجىمىھال رەسىمى';

  @override
  String get takePhoto => 'رەسىم تارتىش';

  @override
  String get chooseFromGallery => 'رەسىم ئامبىرىدىن تاللاش';

  @override
  String get removePhoto => 'رەسىم ئۆچۈرۈش';

  @override
  String get viewContactHashId => 'ئالاقىداشنىڭ كىملىكىنى كۆرۈش';

  @override
  String get hashIdPartiallyMasked =>
      'بىخەتەرلىكىڭىز ۋە ئالاقىداشنىڭ مەخپىيەتلىكى ئۈچۈن قىسمەن يوشۇرۇلغان';

  @override
  String get addFirstContact => 'بىرىنچى ئالاقىداشنى قوشۇڭ';

  @override
  String get addFirstContactSubtitle =>
      'QR code ھەمبەھىرلەڭ ياكى دوستىڭىزنىڭ QR code نى سىكانىرلاڭ';

  @override
  String get directory => 'مۇندەرىجە';

  @override
  String get noContacts => 'ئالاقىداش يوق';

  @override
  String get noContactsSubtitle => 'باشلاش ئۈچۈن ئالاقىداش قوشۇڭ';

  @override
  String get sendMessageAction => 'ئۇچۇر يوللاش';

  @override
  String get audioCall => 'ئاۋاز چاقىرىش';

  @override
  String get videoCall => 'سىن چاقىرىش';

  @override
  String get viewProfile => 'تەرجىمىھالنى كۆرۈش';

  @override
  String get deleteContactDirectory => 'ئالاقىداش ئۆچۈرۈش';

  @override
  String get scanShort => 'سىكانىرلاش';

  @override
  String get addShort => 'قوشۇش';

  @override
  String deleteContactConfirmName(String name) {
    return '$name نى ئۆچۈرمەكچىمۇ؟';
  }

  @override
  String get noNotesTitle => 'خاتىرە يوق';

  @override
  String get noNotesSubtitle => 'بىرىنچى خاتىرىڭىزنى قۇرۇڭ';

  @override
  String get newNote => 'يېڭى خاتىرە';

  @override
  String get editNote => 'خاتىرە تەھرىرلەش';

  @override
  String get deleteNote => 'خاتىرە ئۆچۈرۈش';

  @override
  String get deleteNoteConfirm => 'بۇ خاتىرىنى ئۆچۈرمەكچىمۇ؟';

  @override
  String get noteTitle => 'ماۋزۇ';

  @override
  String get noteContent => 'مەزمۇن';

  @override
  String get addItem => 'تۈر قوشۇش';

  @override
  String get pinNote => 'چىڭلاش';

  @override
  String get unpinNote => 'چىڭلاشنى بىكار قىلىش';

  @override
  String get noteColor => 'رەڭ';

  @override
  String get notePassword => 'پارول';

  @override
  String get setPassword => 'پارول بەلگىلەش';

  @override
  String get changePassword => 'پارول ئۆزگەرتىش';

  @override
  String get removePassword => 'پارول ئۆچۈرۈش';

  @override
  String get enterPassword => 'پارول كىرگۈزۈش';

  @override
  String get confirmPassword => 'پارول جەزملەش';

  @override
  String get passwordPin => 'PIN كود';

  @override
  String get passwordText => 'تېكىست پارول';

  @override
  String get protectedNote => 'قوغدالغان خاتىرە';

  @override
  String get incorrectPassword => 'خاتا پارول';

  @override
  String get passwordSet => 'پارول بەلگىلەندى';

  @override
  String get passwordRemoved => 'پارول ئۆچۈرۈلدى';

  @override
  String get notesBiometric => 'خاتىرىلەر ئۈچۈن Face ID';

  @override
  String get notesBiometricSubtitle =>
      'قوغدالغان خاتىرىلەرنى ئېچىش ئۈچۈن بىئولوگىيىلىك دەلىللەش تەلەپ قىلىنىدۇ';

  @override
  String get textNote => 'تېكىست خاتىرەسى';

  @override
  String get checklistNote => 'تەكشۈرۈش تىزىملىكى';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total ۋەزىپە';
  }

  @override
  String get autoSaved => 'ساقلاندى';

  @override
  String get searchNotes => 'خاتىرە ئىزدەش';

  @override
  String get legalConsent => 'قانۇنىي رازىلىق';

  @override
  String get confirmAge13 => 'كەم دېگەندە 13 ياشقا تولغانلىقىمنى جەزملەيمەن';

  @override
  String get acceptLegalStart => 'مەن قوبۇل قىلىمەن ';

  @override
  String get privacyPolicy => 'مەخپىيەتلىك سىياسىتى';

  @override
  String get termsOfService => 'مۇلازىمەت شەرتلىرى';

  @override
  String get andThe => ' ۋە ';

  @override
  String get continueButton => 'داۋاملاشتۇرۇش';

  @override
  String get mustAcceptTerms =>
      'داۋاملاشتۇرۇش ئۈچۈن ھەر ئىككى شەرتنى قوبۇل قىلىشىڭىز كېرەك';

  @override
  String get lastStepTitle => 'Dernière étape avant de créer votre compte';

  @override
  String get ephemeralDeviceDuration =>
      'Durée de conservation des messages sur votre appareil :';

  @override
  String get serverDeletionInfo =>
      'Les messages sont supprimés instantanément du serveur dès réception.';

  @override
  String get deviceRetentionInfo =>
      'Les messages restent sur votre téléphone pendant la durée choisie, puis sont automatiquement effacés.';

  @override
  String get serverLabel => 'Serveur';

  @override
  String get yourDeviceLabel => 'Votre appareil';

  @override
  String get createMyAccount => 'Créer mon compte';

  @override
  String get timeoutError =>
      'Le serveur ne répond pas. Vérifiez votre connexion internet et réessayez.';

  @override
  String get support => 'قوللاش';

  @override
  String get contactSupport => 'قوللاش بىلەن ئالاقىلىشىش';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'سۇئىستىمال دوكلاتىش';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'قانۇنىي';

  @override
  String get legalEntity => 'قانۇنىي ئورگان';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'چىڭلاش';

  @override
  String get unpinConversation => 'چىڭلاشنى بىكار قىلىش';

  @override
  String get hideConversation => 'ئېقىمدىن ئۆچۈرۈش';

  @override
  String get deleteConversation => 'سۆھبەت ئۆچۈرۈش';

  @override
  String get deleteConversationConfirm =>
      'بارلىق ئۇچۇرلارنى ئۆچۈرۈشنى جەزملەش ئۈچۈن PIN كىرگۈزۈڭ';

  @override
  String get noConversations => 'تېخى سۆھبەت يوق';

  @override
  String get startConversation => 'باشلاش';

  @override
  String get microphonePermissionRequired => 'مىكروفون ئىجازىتى تەلەپ قىلىنىدۇ';

  @override
  String get microphonePermissionExplanation =>
      'Hash چاقىرىش ئۈچۈن مىكروفون ئىشلىتىدۇ.';

  @override
  String get cameraPermissionExplanation =>
      'Hash سىن چاقىرىش ئۈچۈن كامېرا ئىشلىتىدۇ.';

  @override
  String get microphonePermissionRecordExplanation =>
      'Hash a besoin du microphone pour enregistrer des messages vocaux.';

  @override
  String get cameraPermissionCaptureExplanation =>
      'Hash a besoin de la caméra pour prendre des photos et vidéos.';

  @override
  String get locationPermissionRequired => 'Accès à la localisation requis';

  @override
  String get locationPermissionExplanation =>
      'Hash a besoin de votre position pour la partager.';

  @override
  String get locationServiceDisabled =>
      'La localisation est désactivée. Veuillez activer le GPS.';

  @override
  String get openSettings => 'تەڭشەكلەرنى ئاچ';

  @override
  String get callConnecting => 'ئۇلاۋاتىدۇ...';

  @override
  String get callRinging => 'جىرىڭلاۋاتىدۇ...';

  @override
  String get callReconnecting => 'قايتا ئۇلاۋاتىدۇ...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'قايتا ئۇلاۋاتىدۇ (${seconds}s)';
  }

  @override
  String get callPaused => 'ۋاقىتلىق توختىتىلدى';

  @override
  String get callPausedSubtitle => 'تېلېفون ھازاھان ئاكتىپ';

  @override
  String get callRemoteMicMuted => 'ئالاقىداشنىڭ مىكروفونى ئۈنسىز';

  @override
  String get callMiniControlsMute => 'ئۈنسىز';

  @override
  String get callMiniControlsUnmute => 'ئۈن ئاچ';

  @override
  String get callMiniControlsHangUp => 'ئۈزۈش';

  @override
  String get callMiniControlsReturn => 'چاقىرىشقا قايتىش';

  @override
  String get callNetworkPoor => 'تۇراقسىز ئۇلىنىش';

  @override
  String get callNetworkLost => 'ئۇلىنىش ئۈزۈلدى';

  @override
  String get callEndedTitle => 'چاقىرىش تاماملاندى';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'ئۈسكۈنە سانلىق مەلۇماتى';

  @override
  String get deviceDataSubtitle => 'يەرلىك ۋە مۇلازىمېتىر ساقلىغۇچ';

  @override
  String get dataLocalSubtitle => 'Contacts, messages, fichiers, clés';

  @override
  String get dataLocalBadge => 'Chiffré · Accessible qu\'ici';

  @override
  String get dataLocalBody =>
      'Ces données ne quittent jamais votre téléphone. Elles sont chiffrées et protégées par votre code PIN.';

  @override
  String get dataServerSubtitle => 'Clés Signal, messages en transit';

  @override
  String get dataServerBadge => 'Minimum requis · Sans identité';

  @override
  String get dataServerBody =>
      'Hash ne stocke que le strict nécessaire : vos clés publiques de chiffrement et vos messages avant livraison. Aucune donnée personnelle.';

  @override
  String get localStorage => 'يەرلىك ساقلىغۇچ';

  @override
  String get onThisDevice => 'بۇ ئۈسكۈنىدە';

  @override
  String get encryptedDatabases => 'شىفىرلانغان ساندانلار';

  @override
  String get files => 'ھۆججەتلەر';

  @override
  String get secureKeychain => 'بىخەتەر ئاچقۇچ زەنجىرى';

  @override
  String get cache => 'غەملەك';

  @override
  String get contactsDetail => 'ئىسىملار، ئاۋاتارلار، Signal ئاچقۇچلىرى';

  @override
  String get messagesDetail => 'شىفىرلانغان سۆھبەتلەر';

  @override
  String get notesDetail => 'شەخسىي خاتىرىلەر';

  @override
  String get signalSessions => 'Signal يىغىنلىرى';

  @override
  String get signalSessionsDetail => 'شىفىرلاش يىغىنلىرى';

  @override
  String get pendingContacts => 'ساقلاۋاتقان ئالاقىداشلار';

  @override
  String get pendingContactsDetail => 'ساقلاۋاتقان ئىلتىماسلار';

  @override
  String get callHistory => 'چاقىرىشلار';

  @override
  String get callHistoryDetail => 'چاقىرىش تارىخى';

  @override
  String get preferences => 'مايىللىقلار';

  @override
  String get preferencesDetail => 'ۋاسىتە ۋە چاقىرىش مايىللىقلىرى';

  @override
  String get avatars => 'ئاۋاتارلار';

  @override
  String get media => 'ۋاسىتە';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ھۆججەت',
      one: '1 ھۆججەت',
      zero: 'ھۆججەت يوق',
    );
    return '$_temp0';
  }

  @override
  String get active => 'ئاكتىپ';

  @override
  String get notDefined => 'بەلگىلەنمىگەن';

  @override
  String get biometrics => 'بىئولوگىيىلىك';

  @override
  String get recoveryPhrase => 'ئەسلىگە كەلتۈرۈش ئىبارىسى';

  @override
  String get identity => 'كىملىك (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol ئاچقۇچلىرى';

  @override
  String get authTokens => 'دەلىللەش بەلگىلىرى';

  @override
  String get contactNamesCache => 'ئالاقىداش ئىسىم غەملىكى';

  @override
  String get remoteConfig => 'يىراقتىن تەڭشەك';

  @override
  String get notificationPrefs => 'ئۇقتۇرۇش مايىللىقلىرى';

  @override
  String get serverData => 'مۇلازىمېتىر سانلىق مەلۇماتى';

  @override
  String get serverDataInfo =>
      'Hash مۇلازىمېتىردا ئەڭ ئاز سانلىق مەلۇمات ساقلايدۇ، ھەممىسى شىفىرلانغان ياكى ۋاقىتلىق.';

  @override
  String get serverProfile => 'تەرجىمىھال';

  @override
  String get serverProfileDetail =>
      'Hash ID، ئاممىۋى ئاچقۇچلار، پوچتا ساندۇقى بەلگىسى';

  @override
  String get serverPrekeys => 'ئالدىنقى ئاچقۇچلار';

  @override
  String get serverPrekeysDetail =>
      'بىر قېتىملىق Signal ئاچقۇچلىرى (ئىشلىتىلگەن)';

  @override
  String get serverMessages => 'يولدىكى ئۇچۇرلار';

  @override
  String get serverMessagesDetail =>
      'يەتكۈزگەندىن كېيىن ئۆچۈرۈلىدۇ (ئەڭ كۆپ 24 سائەت)';

  @override
  String get serverMedia => 'يولدىكى ۋاسىتە';

  @override
  String get serverMediaDetail => 'چۈشۈرگەندىن كېيىن ئۆچۈرۈلىدۇ';

  @override
  String get serverContactRequests => 'ئالاقىداش ئىلتىماسلىرى';

  @override
  String get serverContactRequestsDetail => '24 سائەتتىن كېيىن ۋاقتى ئۆتىدۇ';

  @override
  String get serverRateLimits => 'تەزلىك چەكلىمىسى';

  @override
  String get serverRateLimitsDetail =>
      'ۋاقىتلىق سۇئىستىمالغا قارشى سانلىق مەلۇمات';

  @override
  String get privacyReassurance =>
      'Hash ئۇچۇرلىرىڭىزنى ئوقۇيالمايدۇ. بارلىق سانلىق مەلۇمات ئۇچتىن-ئۇچقا شىفىرلانغان. مۇلازىمېتىر سانلىق مەلۇماتى ئاپتوماتىك ئۆچۈرۈلىدۇ.';

  @override
  String get pinTooSimple => 'بۇ PIN بەك ئاددىي. تېخىمۇ بىخەتەر كود تاللاڭ.';

  @override
  String get genericError => 'خاتالىق يۈز بەردى. قايتا سىناڭ.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'ھېسابات قۇرالمىدى: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'ئىبارە چاپلاش تاختىسىغا كۆچۈرۈلدى';

  @override
  String get copyPhrase => 'ئىبارە كۆچۈرۈش';

  @override
  String get recoveryPhraseSecurityWarning =>
      'بۇ ئىبارىنى بىخەتەر يەرگە يېزىپ قويۇڭ. ئىبارىسىز PIN نى يوقاتسىڭىز، سانلىق مەلۇماتىڭىزغا مەڭگۈلۈك كىرەلمەيسىز.';

  @override
  String get noMessages => 'ئۇچۇر يوق';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name بىلەن بارلىق ئۇچۇرلارنى ئۆچۈرەمسىز؟';
  }

  @override
  String get confirmation => 'جەزملەش';

  @override
  String get untitled => 'ماۋزۇسىز';

  @override
  String get noSessions => 'يىغىن يوق';

  @override
  String get unknownContact => 'نامەلۇم ئالاقىداش';

  @override
  String get unnamed => 'ئىسىمسىز';

  @override
  String get noPendingRequestsAlt => 'ساقلاۋاتقان ئىلتىماس يوق';

  @override
  String get deleteAllCallHistory => 'بارلىق چاقىرىش تارىخىنى ئۆچۈرەمسىز؟';

  @override
  String get noCalls => 'چاقىرىش يوق';

  @override
  String get noPreferences => 'مايىللىق يوق';

  @override
  String get resetAllMediaPrefs =>
      'بارلىق ۋاسىتە مايىللىقلىرىنى ئەسلىگە قايتۇرامسىز؟';

  @override
  String get deleteThisAvatar => 'بۇ ئاۋاتارنى ئۆچۈرەمسىز؟';

  @override
  String get deleteAllAvatars => 'بارلىق ئاۋاتارلارنى ئۆچۈرەمسىز؟';

  @override
  String get noAvatars => 'ئاۋاتار يوق';

  @override
  String get deleteThisFile => 'بۇ ھۆججەتنى ئۆچۈرەمسىز؟';

  @override
  String get deleteAllMediaFiles => 'بارلىق ۋاسىتىنى ئۆچۈرەمسىز؟';

  @override
  String get noMediaFiles => 'ۋاسىتە يوق';

  @override
  String get outgoing => 'چىقىش';

  @override
  String get incoming => 'كىرىش';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'ۋاقىتلىق كۆرۈش: ${seconds}s';
  }

  @override
  String get normalView => 'نورمال كۆرۈش';

  @override
  String get callReasonCompleted => 'تاماملاندى';

  @override
  String get callReasonMissed => 'قالدۇرۇلدى';

  @override
  String get callReasonDeclined => 'رەت قىلىندى';

  @override
  String get callReasonFailed => 'مەغلۇب';

  @override
  String get justNow => 'ھازىر';

  @override
  String timeAgoMinutes(int count) {
    return '$count مىنۇت ئىلگىرى';
  }

  @override
  String timeAgoHours(int count) {
    return '$count سائەت ئىلگىرى';
  }

  @override
  String timeAgoDays(int count) {
    return '$count كۈن ئىلگىرى';
  }

  @override
  String get messageTypeContact => 'ئالاقىداش';

  @override
  String get messageTypeLocation => 'ئورۇن';

  @override
  String get statusQueued => 'نۆۋەتتە';

  @override
  String get blockedBadge => 'توسۇلغان';

  @override
  String get protectedBadge => 'قوغدالغان';

  @override
  String messageCount(int count) {
    return '$count ئۇچۇر';
  }

  @override
  String get deleteQuestion => 'ئۆچۈرەمسىز؟';

  @override
  String get transferMyAccountTitle => 'ھېساباتىمنى يۆتكەش';

  @override
  String get loadingError => 'يۈكلەش خاتالىقى';

  @override
  String get transferToNewDevice => 'يېڭى ئۈسكۈنىگە يۆتكەش';

  @override
  String get transferInstructions =>
      'يېڭى ئۈسكۈنىڭىزدە «ھېساباتىمنى ئەسلىگە كەلتۈرۈش» نى تاللاپ بۇ ئۇچۇرنى كىرگۈزۈڭ:';

  @override
  String get yourHashIdLabel => 'Hash ID ڭىز';

  @override
  String get enterYourPinCode => 'PIN كودىڭىزنى كىرگۈزۈڭ';

  @override
  String get pinOwnerConfirmation =>
      'بۇ ھېسابات ئىگىسى ئىكەنلىكىڭىزنى جەزملەش ئۈچۈن';

  @override
  String get scanThisQrCode => 'بۇ QR code نى سىكانىرلاڭ';

  @override
  String get withYourNewDevice => 'يېڭى ئۈسكۈنىڭىز بىلەن';

  @override
  String get orEnterTheCode => 'ياكى كود كىرگۈزۈڭ';

  @override
  String get transferCodeLabel => 'يۆتكەش كودى';

  @override
  String get proximityVerification => 'يېقىنلىق تەكشۈرۈشى';

  @override
  String get bringDevicesCloser => 'ئىككى ئۈسكۈنىنى يېقىنلاشتۇرۇڭ';

  @override
  String get confirmTransferQuestion => 'يۆتكەشنى جەزملەمسىز؟';

  @override
  String get accountWillBeTransferred =>
      'ھېساباتىڭىز يېڭى ئۈسكۈنىگە يۆتكىلىدۇ.\n\nبۇ ئۈسكۈنە مەڭگۈلۈك ئۈزۈلىدۇ.';

  @override
  String get transferComplete => 'يۆتكەش تاماملاندى';

  @override
  String get transferSuccessMessage =>
      'ھېساباتىڭىز مۇۋەپپەقىيەتلىك يۆتكەلدى.\n\nبۇ ئەپ ھازىر تاقىلىدۇ.';

  @override
  String get manualVerification => 'قولدا تەكشۈرۈش';

  @override
  String get codeDisplayedOnBothDevices => 'ئىككى ئۈسكۈنىدە كۆرسىتىلگەن كود:';

  @override
  String get doesCodeMatchNewDevice =>
      'بۇ كود يېڭى ئۈسكۈنىدىكى كود بىلەن ماسمۇ؟';

  @override
  String get verifiedStatus => 'تەكشۈرۈلدى';

  @override
  String get inProgressStatus => 'جەرياندا...';

  @override
  String get notAvailableStatus => 'يوق';

  @override
  String get codeExpiredRestart => 'كود ۋاقتى ئۆتتى. قايتا باشلاڭ.';

  @override
  String get codesDoNotMatchCancelled =>
      'كودلار ماس كەلمىدى. يۆتكەش بىكار قىلىندى.';

  @override
  String transferToDevice(String device) {
    return 'غا: $device';
  }

  @override
  String get copiedExclamation => 'كۆچۈرۈلدى!';

  @override
  String expiresInTime(String time) {
    return '$time دا ۋاقتى ئۆتىدۇ';
  }

  @override
  String get biometricNotAvailable => 'بىئولوگىيىلىك بۇ ئۈسكۈنىدە يوق';

  @override
  String get biometricAuthError => 'بىئولوگىيىلىك دەلىللەشتە خاتالىق';

  @override
  String get authenticateForBiometric =>
      'بىئولوگىيىلىكنى ئاكتىپلاش ئۈچۈن دەلىللەڭ';

  @override
  String get biometricAuthFailed => 'بىئولوگىيىلىك دەلىللەش مەغلۇب بولدى';

  @override
  String get forceUpdateTitle => 'يېڭىلاش تەلەپ قىلىنىدۇ';

  @override
  String get forceUpdateMessage =>
      'Hash نىڭ يېڭى نەشرى بار. داۋاملاشتۇرۇش ئۈچۈن يېڭىلاڭ.';

  @override
  String get updateButton => 'يېڭىلاش';

  @override
  String get maintenanceInProgress => 'ئاسراش جەريانى';

  @override
  String get tryAgainLater => 'كېيىن قايتا سىناڭ';

  @override
  String get information => 'ئۇچۇر';

  @override
  String get later => 'كېيىن';

  @override
  String get doYouLikeHash => 'Hash ياقامدۇ?';

  @override
  String get yourFeedbackHelps => 'ئىنكاسىڭىز ئەپنى ياخشىلاشقا ياردەم بېرىدۇ';

  @override
  String get ratingTerrible => 'بەك يامان';

  @override
  String get ratingBad => 'ناچار';

  @override
  String get ratingOk => 'بولىدۇ';

  @override
  String get ratingGood => 'ياخشى';

  @override
  String get ratingExcellent => 'ئەلا!';

  @override
  String get donationMessage =>
      'Hash تىجارەت مەقسىتى يوق تۈر. قوللىشىڭىز بىزگە ھەقىقىي مەخپىيەتلىك ئۇچۇر ئەپى ياسايدىغانلىقىمىزغا ياردەم بېرىدۇ.';

  @override
  String get recentConnections => 'يېقىنقى باغلىنىشلار';

  @override
  String get loginInfoText =>
      'ھەر بىر PIN قۇلۇپ ئېچىش يەرلىكتە خاتىرىلىنىدۇ. پەقەت ئاخىرقى 24 سائەت ساقلىنىدۇ.';

  @override
  String get connectionCount => 'باغلىنىش';

  @override
  String get periodLabel => 'مەزگىل';

  @override
  String get historyLabel => 'تارىخ';

  @override
  String get noLoginRecorded => 'كىرىش خاتىرىلەنمىگەن';

  @override
  String get nextUnlocksAppearHere =>
      'كېيىنكى قۇلۇپ ئېچىشلار بۇ يەردە كۆرۈنىدۇ.';

  @override
  String get dataLocalOnly =>
      'بۇ سانلىق مەلۇماتلار پەقەت ئۈسكۈنىڭىزدە ساقلىنىدۇ ۋە ھەرگىز يوللانمايدۇ.';

  @override
  String get currentSession => 'نۆۋەتتىكى';

  @override
  String get todayLabel => 'بۈگۈن';

  @override
  String get yesterdayLabel => 'تۈنۈگۈن';

  @override
  String get justNowLabel => 'ھازىر';

  @override
  String minutesAgoLabel(int count) {
    return '$count مىنۇت ئىلگىرى';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours سائەت ئىلگىرى';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours سائەت $minutes مىنۇت ئىلگىرى';
  }

  @override
  String get noMaintenancePlanned => 'ئاسراش پىلانلانمىغان';

  @override
  String get everythingWorkingNormally => 'ھەممىسى نورمال ئىشلەۋاتىدۇ';

  @override
  String get maintenanceTitle => 'ئاسراش';

  @override
  String get maintenanceActiveLabel => 'جەريان قىلىۋاتىدۇ';

  @override
  String get maintenancePlannedLabel => 'پىلانلانغان';

  @override
  String get locking => 'قۇلۇپلاۋاتىدۇ...';

  @override
  String get newMessageNotification => 'يېڭى ئۇچۇر';

  @override
  String get secExplainTitle => 'Hash سىزنى قانداق قوغدايدۇ';

  @override
  String get secExplainIntro =>
      'Hash ھېچكىم ئۇچۇرلىرىڭىزنى ئوقۇيالمايدىغان قىلىپ لايىھەلەنگەن.';

  @override
  String get secExplainIntroSub =>
      'بىزمۇ ئوقۇيالمايمىز.\nمانا ئاددىي چۈشەندۈرۈلگىنى.';

  @override
  String get secJourneyLabel => 'سەپەر';

  @override
  String get secJourneyTitle => 'ئۇچۇرىڭىزنىڭ سەپىرى';

  @override
  String get secJourneySubtitle =>
      'بارمىقىڭىزدىن ئالاقىداشنىڭ ئېكرانىغىچە، ھەر قەدەم قوغدالغان. يولنى ئىز قوۋۇڭ.';

  @override
  String get secStep1Title => 'ئۇچۇرىڭىزنى يازىسىز';

  @override
  String get secStep1Desc =>
      'ئەپتە «سالام!» دەپ يازىسىز. بۇ چاغدا ئۇچۇر پەقەت تېلېفون ئەسلىمىسىدە. ھېچنىمە يوللانمىغان.';

  @override
  String get secStep2Title => 'Signal Protocol بىلەن شىفىرلاش';

  @override
  String get secStep2Desc =>
      '«يوللاش» نى باسسىڭىز، ئۇچۇرىڭىز چۈشىنىكسىز ھەرپلەر قاتارىغا ئايلىنىدۇ. ئۇچۇرىڭىز ئاچقۇچى پەقەت ئالاقىداشىڭىزدا بولغان گاۋزاغا قۇلۇپلانغاندەك.';

  @override
  String get secStep3Title => 'Sealed Sender: كۆرۈنمەس كونۋېرت';

  @override
  String get secStep3Desc =>
      'پوچتا بىلەن خەت يوللاشنى تەسەۋۋۇر قىلىڭ، لېكىن كونۋېرتتا قايتۇرۇش ئادرېسى يوق. Hash دەل شۇنداق قىلىدۇ. ئۇچۇر نامسىز پوچتا ساندۇقىغا تاشلىنىدۇ. مۇلازىمېتىر كىمنىڭ يوللىغانلىقىنى بىلمەيدۇ.';

  @override
  String get secStep4Title => 'مۇلازىمېتىر ھېچنىمە كۆرمەيدۇ';

  @override
  String get secStep4Desc =>
      'مۇلازىمېتىر سوقۇر پوچتاچىدەك ئىشلەيدۇ. پەقەت «بىرسى #A7X9 ساندۇقىغا بىرنىمە تاشلىدى» نى بىلىدۇ. كىم يوللىدى، نېمە، كىمگە — بىلمەيدۇ.';

  @override
  String get secStep4Highlight =>
      'ھېچقانداق مېتا سانلىق مەلۇمات ساقلانمايدۇ: IP ئادرېس يوق، ۋاقىت تامغىسى يوق، يوللىغۇچى بىلەن تاپشۇرۇۋالغۇچى ئارىسىدا باغلىنىش يوق.';

  @override
  String get secStep5Title => 'ئالاقىداشىڭىز ئۇچۇرنى تاپشۇرۇۋالىدۇ';

  @override
  String get secStep5Desc =>
      'ئالاقىداشىڭىزنىڭ تېلېفونى نامسىز ساندۇقتىن مەزمۇننى ئېلىپ، ھەرگىز ئۈسكۈنىنى تەرك قىلمىغان شەخسىي ئاچقۇچ بىلەن ئۇچۇرنى يەشلەيدۇ. ئېكراندا «سالام!» كۆرۈنىدۇ.';

  @override
  String get secStep6Title => 'ئۇچۇر مۇلازىمېتىردىن يوقىلىدۇ';

  @override
  String get secStep6Desc =>
      'ئالاقىداش تاپشۇرۇۋېلىشنى جەزملىگەندىلا، مۇلازىمېتىر ئۇچۇرنى مەڭگۈلۈك ئۆچۈرىدۇ. ئەخلەتدان يوق، ئارخىپ يوق، زاپاس يوق. ئوقۇلمىغان ئۇچۇرلارمۇ 24 سائەتتىن كېيىن ئاپتوماتىك يوق قىلىنىدۇ.';

  @override
  String get secStep7Title => 'يەرلىك ۋاقتى ئۆتۈش';

  @override
  String get secStep7Desc =>
      'ئالاقىداشنىڭ تېلېفونىدا، ئۇچۇر تاللىغان مۇددىتىڭىز بويىچە ئۆزىنى يوق قىلىدۇ: ئوقۇغاندىلا، 5 مىنۇت، 1 سائەت... سىز بەلگىلەيسىز.';

  @override
  String get secJourneyConclusion =>
      'نەتىجە: مۇلازىمېتىردا نۆل ئىز، ئۈسكۈنىلەردە نۆل ئىز. ئۇچۇر پەقەت ئوقۇشقا يەتكۈدەك ۋاقىت مەۋجۇت بولدى، ئاندىن يوقالدى.';

  @override
  String get secArchLabel => 'قۇرۇلما';

  @override
  String get secArchTitle => '5 قوغداش قاتلىمى';

  @override
  String get secArchSubtitle =>
      'Hash بىرلا تېخنىكىغا تايانمايدۇ. ھەر قاتلام باشقىلارنى كۈچەيتىدۇ. بىر قاتلام بۇزۇلسىمۇ، سانلىق مەلۇماتىڭىز بىخەتەر.';

  @override
  String get secLayer1Title => 'ئۇچتىن-ئۇچقا شىفىرلاش';

  @override
  String get secLayer1Desc =>
      'ھەر ئۇچۇر ئۆزگىچە ئاچقۇچ بىلەن شىفىرلىنىدۇ. ئاددىي قىلىپ ئېيتقاندا: بىرسى بىر ئۇچۇرنى يەشلىسىمۇ، كېيىنكىسىنى يەشلەيەلمەيدۇ. ھەر ئۇچۇرنىڭ ئۆز قۇلۇپى بار.';

  @override
  String get secLayer1Detail =>
      'ھۆججەتلەر (رەسىم، سىن، ھۆججەت) ئۈچۈن Hash قوشۇمچە AES-256-GCM شىفىرلاش ئىشلىتىدۇ. ھۆججەت تېلېفوندىن چىقىشتىن بۇرۇن شىفىرلىنىدۇ.';

  @override
  String get secLayer2Title => 'Sealed Sender (تور نامسىزلىقى)';

  @override
  String get secLayer2Desc =>
      'ئادەتتىكى ئۇچۇرلاشقۇلار ئۇچۇرلىرىڭىزنى كىملىكىڭىز بىلەن يوللايدۇ. كونۋېرتقا ئىسمىڭىزنى يېزىشتەك. Hash نامسىز ساندۇقلارنى ئىشلىتىدۇ: مۇلازىمېتىر كىمنىڭ يوللىغانلىقىنى بىلمەي ئۇچۇرنى يەتكۈزىدۇ.';

  @override
  String get secLayer2Detail =>
      'نەتىجە: مۇلازىمېتىر سانلىق مەلۇمات ئېقىپ چىققاندا بەلكى، كىم كىم بىلەن سۆزلىشىدىغانلىقىنى قايتا قۇرۇش مۇمكىن ئەمەس.';

  @override
  String get secLayer3Title => 'ئاپتوماتىك ئۆچۈرۈش';

  @override
  String get secLayer3Desc =>
      'تاپشۇرۇۋېلىش جەزملەنگەندىلا ئۇچۇرلار مۇلازىمېتىردىن ئۆچۈرۈلىدۇ. ئۇچۇر ھەرگىز ئېلىنمىسىمۇ، 24 سائەتتىن كېيىن ئاپتوماتىك يوق قىلىنىدۇ.';

  @override
  String get secLayer3Detail =>
      'تېلېفونىڭىزدا، تاللىغان مۇددىتىڭىز بويىچە ئۇچۇرلار ئۆزىنى يوق قىلىدۇ: دەرھال، 5 مىن، 15 مىن، 30 مىن، 1 سائ، 3 سائ، 6 سائ ياكى 12 سائ.';

  @override
  String get secLayer4Title => 'يەرلىك كىرىش قوغدىشى';

  @override
  String get secLayer4Desc =>
      'ئەپ 6 خانىلىق PIN ۋە/ياكى بىئولوگىيىلىك (Face ID، بارماق ئىزى) بىلەن قوغدالغان. بەك كۆپ مەغلۇب سىناشتىن كېيىن، ھەر مەغلۇبىيەتتىن كېيىن ئاشىدىغان كېچىكتۈرۈش بىلەن ئەپ قۇلۇپلىنىدۇ.';

  @override
  String get secLayer5Title => 'قۇلۇپلانغان ساندان';

  @override
  String get secLayer5Desc =>
      'مۇلازىمېتىر تەرەپتە، ھېچبىر ئىشلەتكۈچى ساندانغا بىۋاسىتە يازالمايدۇ. بارلىق مەشغۇلاتلار ھەر ئىلتىماسنى تەكشۈرىدىغان بىخەتەر فۇنكسىيەلەردىن ئۆتىدۇ.';

  @override
  String get secLayer5Detail =>
      'بانكا سايۋىنىدەك: سىز ھەرگىز خەزىنىنى ئۆزىڭىز تەگمەيسىز. ئىلتىماس قىلىسىز، سىستېما مەشغۇلات قىلىشتىن بۇرۇن ھوقۇقىڭىزنى تەكشۈرىدۇ.';

  @override
  String get secVashLabel => 'دۇنيادا يالغۇز';

  @override
  String get secVashTitle => 'Vash ھالىتى';

  @override
  String get secVashSubtitle =>
      'باشقا ھېچبىر ئۇچۇرلاشقۇدا مەۋجۇت بولمىغان جىددىي بىخەتەرلىك سىستېمىسى.';

  @override
  String get secVashScenarioTitle => 'بۇ ئەھۋالنى تەسەۋۋۇر قىلىڭ';

  @override
  String get secVashScenario1 => 'بىرسى تېلېفونىڭىزغا كىرىدۇ';

  @override
  String get secVashScenario2 => 'سىزدىن PIN كود سورايدۇ';

  @override
  String get secVashScenario3 =>
      'بارلىق سانلىق مەلۇماتىڭىزنى جىددىي ئۆچۈرمەكچى';

  @override
  String get secVashSolutionTitle => 'ھەل: ئىككى PIN كود';

  @override
  String get secVashSolutionDesc =>
      'Hash دا ئىككى ئوخشىمىغان PIN كود تەڭشەيسىز:';

  @override
  String get secVashNormalCodeLabel => 'نورمال كود';

  @override
  String get secVashNormalCodeDesc =>
      'ئەپنى بارلىق سانلىق مەلۇمات بىلەن نورمال ئاچىدۇ';

  @override
  String get secVashCodeLabel2 => 'Vash كودى';

  @override
  String get secVashCodeDescription =>
      'ئەپنى نورمال ئاچىدۇ... لېكىن بارلىق سانلىق مەلۇمات ئارقا سۇپىدا جىمجىت ئۆچۈرۈلىدۇ';

  @override
  String get secVashWhatHappensTitle => 'كېيىن نېمە بولىدۇ';

  @override
  String get secVashWhatHappensDesc =>
      'ئەپ نورمال ئېچىلىدۇ. ئاگاھلاندۇرۇش يوق، گۇمانلىق كارتۇن يوق. ئېكران پەقەت بوش ئەپ كۆرسىتىدۇ، ھازىرلا ئورناتقاندەك.\n\nئەمەلىيەتتە، بارلىق سۆھبەت، ئالاقىداش ۋە ئۇچۇرلىرىڭىز بىر سېكۇنت ئىچىدە قايتۇرغۇسىز ئۆچۈرۈلدى.';

  @override
  String get secCallsLabel => 'چاقىرىش ۋە ھۆججەتلەر';

  @override
  String get secCallsTitle => 'ھەممىسى شىفىرلانغان';

  @override
  String get secCallsSubtitle =>
      'پەقەت ئۇچۇرلار ئەمەس. Hash دىن ئۆتىدىغان ھەممە نەرسە ئۇچتىن-ئۇچقا شىفىرلانغان.';

  @override
  String get secAudioCallTitle => 'ئاۋاز چاقىرىش';

  @override
  String get secAudioCallDesc =>
      'WebRTC ئارقىلىق ئۇچتىن-ئۇچقا شىفىرلانغان. ئاۋاز ئۈسكۈنىلەر ئارىسىدا بىۋاسىتە يەتكۈزۈلىدۇ.';

  @override
  String get secVideoCallTitle => 'سىن چاقىرىش';

  @override
  String get secVideoCallDesc =>
      'ئوخشاش تېخنىكا، ھەر ئېقىم ئايرىم شىفىرلانغان.';

  @override
  String get secPhotosTitle => 'رەسىم ۋە سىن';

  @override
  String get secPhotosDesc =>
      'تېلېفوندىن چىقىشتىن بۇرۇن AES-256-GCM دا شىفىرلانغان.';

  @override
  String get secDocsTitle => 'ھۆججەتلەر';

  @override
  String get secDocsDesc =>
      'PDF، ZIP، ھەر قانداق ھۆججەت. ئىسمى، چوڭلۇقى ۋە مەزمۇنى شىفىرلانغان.';

  @override
  String get secAnonLabel => 'نامسىزلىق';

  @override
  String get secAnonTitle => 'كىملىك تەلەپ قىلىنمايدۇ';

  @override
  String get secAnonSubtitle =>
      'Hash ھەرگىز تېلېفون نومۇرى ياكى ئېلخەت سورىمايدۇ. ئۆزگىچە ۋە نامسىز Hash ID بىلەن پەرقلىنىسىز.';

  @override
  String get secHashIdTitle => 'Hash ID ڭىز';

  @override
  String get secHashIdDesc =>
      'بۇ ئۆزگىچە كىملىكىڭىز. سىز ھەققىڭىزدە ھېچنىمە ئاشكارىلىمايدۇ: ئىسمىڭىز ئەمەس، نومۇرىڭىز ئەمەس، ئورنىڭىز ئەمەس. ھەقىقىي كىملىكىڭىزگە باغلاش مۇمكىن بولمىغان تەخەللۇستەك.\n\nئالاقىداش قوشۇش ئۈچۈن Hash ID ھەمبەھىرلەيسىز ياكى QR code سىكانىرلايسىز. شۇ. ماسلاشتۇرۇلغان ئادرېس دەپتىرى يوق، «تونۇشىڭىز مۇمكىن بولغان كىشىلەر» تەۋسىيەسى يوق.';

  @override
  String get secDataLabel => 'سانلىق مەلۇمات';

  @override
  String get secDataTitle => 'Hash بىلمەيدىغانلىرى';

  @override
  String get secDataSubtitle =>
      'سانلىق مەلۇماتنى قوغداشنىڭ ئەڭ ياخشى ئۇسۇلى ئۇنى توپلىماسلىق.';

  @override
  String get secNeverCollected => 'ھەرگىز توپلانمايدۇ';

  @override
  String get secNeverItem1 => 'ئۇچۇر مەزمۇنى';

  @override
  String get secNeverItem2 => 'ئالاقىداش تىزىملىكى';

  @override
  String get secNeverItem3 => 'تېلېفون نومۇرى';

  @override
  String get secNeverItem4 => 'ئېلخەت ئادرېسى';

  @override
  String get secNeverItem5 => 'IP ئادرېسى';

  @override
  String get secNeverItem6 => 'ئورۇن';

  @override
  String get secNeverItem7 => 'مېتا سانلىق مەلۇمات (كىم كىم بىلەن سۆزلىشىدۇ)';

  @override
  String get secNeverItem8 => 'چاقىرىش تارىخى';

  @override
  String get secNeverItem9 => 'ئادرېس دەپتىرى';

  @override
  String get secNeverItem10 => 'ئېلان كىملىكلىرى';

  @override
  String get secTempStored => 'ۋاقىتلىق ساقلىنىدۇ';

  @override
  String get secTempItem1 => 'نامسىز Hash ID (ئۆزگىچە كىملىك)';

  @override
  String get secTempItem2 => 'ئاممىۋى شىفىرلاش ئاچقۇچلىرى';

  @override
  String get secTempItem3 => 'يولدىكى شىفىرلانغان ئۇچۇرلار (ئەڭ كۆپ 24 سائەت)';

  @override
  String get secTempNote =>
      'بۇ ئەڭ ئاز سانلىق مەلۇماتمۇ سىزنى پەرقلەندۈرەلمەيدۇ. Hash ID ڭىز ھېچقانداق شەخسىي ئۇچۇرغا باغلانمىغان.';

  @override
  String get secFooterTitle => 'مەخپىيەتلىكىڭىز، ئەركىنلىكىڭىز';

  @override
  String get secFooterDesc =>
      'Hash ئەڭ تەلەپچان كەسپىي پروگراممىلار بىلەن ئوخشاش شىفىرلاش تېخنىكىلىرىنى ئىشلىتىدۇ. ئۇچۇرلىرىڭىز ماتېماتىكا بىلەن قوغدالغان، ۋەدە بىلەن ئەمەس.';

  @override
  String get sendSound => 'Son d\'envoi';

  @override
  String get sendSoundSubtitle => 'Jouer un son à l\'envoi d\'un message';

  @override
  String get appIcon => 'Icône de l\'app';

  @override
  String get appIconSubtitle => 'Changer l\'icône de l\'app';

  @override
  String get iconDefault => 'Hash';

  @override
  String get iconBal => 'Equilibra';

  @override
  String get iconBell => 'Echo';

  @override
  String get iconCloud => 'Nimbus';

  @override
  String get iconFog => 'Myst';

  @override
  String get iconGhost => 'Phantom';

  @override
  String get iconGlass => 'Prism';

  @override
  String get iconKey => 'Sipher';

  @override
  String get iconLock => 'Vault';

  @override
  String get iconMsg => 'Pulse';

  @override
  String get iconRed => 'Vash';

  @override
  String get iconPyramid => 'Apex';

  @override
  String get iconRocket => 'Nova';

  @override
  String get iconSun => 'Flare';

  @override
  String get iconAt => 'Abyss';

  @override
  String get notifyingContacts => 'Notification des contacts...';

  @override
  String get deletingAccount => 'Suppression du compte...';
}
