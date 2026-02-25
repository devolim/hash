// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'কোনো চিহ্ন নেই। কোনো আপস নেই।';

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
  String get conversations => 'চ্যাট';

  @override
  String get contacts => 'পরিচিতি';

  @override
  String get noConversation => 'কোনো চ্যাট নেই';

  @override
  String get noConversationSubtitle =>
      'নিরাপদে চ্যাট শুরু করতে একটি পরিচিতি যোগ করুন';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি অপেক্ষমাণ অনুরোধ',
      one: '১টি অপেক্ষমাণ অনুরোধ',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি প্রেরিত অনুরোধ অপেক্ষমাণ',
      one: '১টি প্রেরিত অনুরোধ অপেক্ষমাণ',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'পরিচিতি যোগ করুন';

  @override
  String get shareApp => 'অ্যাপ শেয়ার করুন';

  @override
  String get newMessage => 'নতুন বার্তা';

  @override
  String get newConversation => 'একটি বার্তা পাঠান';

  @override
  String get settings => 'সেটিংস';

  @override
  String get myHashId => 'আমার Hash ID';

  @override
  String get supportHash => 'Hash সমর্থন করুন';

  @override
  String get supportHashSubtitle => 'Hash একটি অলাভজনক প্রকল্প';

  @override
  String get donate => 'দান করুন';

  @override
  String get appearance => 'চেহারা';

  @override
  String get theme => 'থিম';

  @override
  String get themeAuto => 'স্বয়ংক্রিয়';

  @override
  String get themeAutoSubtitle => 'সিস্টেম সেটিংস অনুসরণ করে';

  @override
  String get themeDark => 'গাঢ়';

  @override
  String get themeLight => 'হালকা';

  @override
  String get themeRecommendation => 'গোপনীয়তার জন্য গাঢ় থিম সুপারিশ করা হয়';

  @override
  String get language => 'ভাষা';

  @override
  String get languageAuto => 'স্বয়ংক্রিয় (সিস্টেম)';

  @override
  String get notifications => 'বিজ্ঞপ্তি';

  @override
  String get messages => 'বার্তা';

  @override
  String get calls => 'কল';

  @override
  String get vibration => 'কম্পন';

  @override
  String get notificationContent => 'বিজ্ঞপ্তির বিষয়বস্তু';

  @override
  String get notificationContentFull => 'সব দেখান';

  @override
  String get notificationContentFullDesc => 'পরিচিতির নাম ও বার্তার পূর্বরূপ';

  @override
  String get notificationContentName => 'শুধু নাম';

  @override
  String get notificationContentNameDesc => 'শুধুমাত্র পরিচিতির নাম দেখায়';

  @override
  String get notificationContentDiscrete => 'বিচক্ষণ';

  @override
  String get notificationContentDiscreteDesc =>
      'শুধুমাত্র \"নতুন বার্তা\" দেখায়';

  @override
  String get security => 'নিরাপত্তা';

  @override
  String get howHashProtectsYou => 'Hash কীভাবে আপনাকে রক্ষা করে';

  @override
  String get howHashProtectsYouSubtitle => 'আপনার নিরাপত্তা বুঝুন';

  @override
  String get accountSecurity => 'অ্যাকাউন্ট নিরাপত্তা';

  @override
  String get accountSecuritySubtitle => 'PIN, বায়োমেট্রিক্স, Vash মোড';

  @override
  String get blockScreenshots => 'স্ক্রিনশট ব্লক করুন';

  @override
  String get transferDevice => 'অন্য ডিভাইসে স্থানান্তর করুন';

  @override
  String get transferDeviceSubtitle => 'আপনার অ্যাকাউন্ট স্থানান্তর করুন';

  @override
  String get pinCode => 'PIN কোড';

  @override
  String get changePin => 'PIN কোড পরিবর্তন করুন';

  @override
  String get currentPin => 'বর্তমান PIN কোড';

  @override
  String get newPin => 'নতুন PIN কোড';

  @override
  String get confirmPin => 'PIN কোড নিশ্চিত করুন';

  @override
  String get pinChanged => 'PIN কোড পরিবর্তিত হয়েছে';

  @override
  String get incorrectPin => 'ভুল PIN';

  @override
  String get pinsDoNotMatch => 'PIN মিলছে না';

  @override
  String get autoLock => 'স্বয়ংক্রিয় লক';

  @override
  String get autoLockDelay => 'লক বিলম্ব';

  @override
  String get autoLockImmediate => 'তাৎক্ষণিক';

  @override
  String get autoLockMinute => '১ মিনিট';

  @override
  String autoLockMinutes(int count) {
    return '$count মিনিট';
  }

  @override
  String get vashCode => 'Vash কোড';

  @override
  String get vashModeTitle => 'Vash মোড';

  @override
  String get vashModeExplanation => 'আপনার চূড়ান্ত সুরক্ষা জাল।';

  @override
  String get vashModeDescription =>
      'আপনি একটি দ্বিতীয় PIN কোড বেছে নেবেন। যদি কখনো আপনাকে Hash খুলতে বাধ্য করা হয়, আপনার সাধারণ PIN এর বদলে এই কোডটি দিন।\n\nঅ্যাপটি স্বাভাবিকভাবে খুলবে, কিন্তু আপনার সমস্ত কথোপকথন ও পরিচিতি মুছে যাবে।\n\nআপনার স্ক্রিনে যে কেউ দেখবে, Hash কেবল খালি দেখাবে — যেন আপনি এটি কখনো ব্যবহার করেননি।';

  @override
  String get vashModeIrreversible => 'এই কাজটি নীরব ও অপরিবর্তনীয়।';

  @override
  String get chooseVashCode => 'আমার Vash কোড বেছে নিন';

  @override
  String get vashCodeInfo =>
      'একটি দ্বিতীয় PIN কোড যা অ্যাপটি স্বাভাবিকভাবে খোলে, তবে খালি।';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'আপনি যদি আপনার PIN এর বদলে এই কোডটি দেন:';

  @override
  String get vashDeleteContacts => 'আপনার পরিচিতি অদৃশ্য হয়ে যায়';

  @override
  String get vashDeleteMessages => 'আপনার কথোপকথন অদৃশ্য হয়ে যায়';

  @override
  String get vashDeleteHistory => 'আপনার নোট অদৃশ্য হয়ে যায়';

  @override
  String get vashKeepId => 'আপনার Hash পরিচয় (#XXX-XXX-XXX) একই থাকে';

  @override
  String get vashAppearNormal =>
      'অ্যাপটি স্বাভাবিক কিন্তু খালি দেখায়, নতুনের মতো। এই কাজটি অপরিবর্তনীয়।';

  @override
  String get setupVashCode => 'Vash কোড সেটআপ করুন';

  @override
  String get modifyVashCode => 'Vash কোড পরিবর্তন করুন';

  @override
  String get currentVashCode => 'বর্তমান Vash কোড';

  @override
  String get newVashCode => 'নতুন Vash কোড';

  @override
  String get confirmVashCode => 'Vash কোড নিশ্চিত করুন';

  @override
  String get vashCodeConfigured => 'Vash কোড কনফিগার করা হয়েছে';

  @override
  String get vashCodeModified => 'Vash কোড পরিবর্তিত হয়েছে';

  @override
  String get vashCodeMustDiffer => 'Vash কোড PIN থেকে আলাদা হতে হবে';

  @override
  String get incorrectVashCode => 'ভুল Vash কোড';

  @override
  String get vashWhatToDelete => 'Vash মোডে কী অদৃশ্য হবে?';

  @override
  String get vashDeleteContactsOption => 'পরিচিতি';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'বার্তা';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'নোট';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash মোড সক্রিয়';

  @override
  String get vashCreateSubtitle =>
      'আপনার প্রধান PIN থেকে আলাদা একটি কোড বেছে নিন';

  @override
  String get vashConfirmSubtitle => 'আপনার Vash কোড নিশ্চিত করুন';

  @override
  String get pinCodeForEntry => 'অ্যাপে প্রবেশের জন্য PIN কোড';

  @override
  String get vashCodeSection => 'Vash মোড';

  @override
  String get biometric => 'বায়োমেট্রিক';

  @override
  String get biometricUnlock => 'আঙুলের ছাপ বা Face ID দিয়ে আনলক করুন';

  @override
  String get enableBiometric => 'বায়োমেট্রিক সক্রিয় করুন';

  @override
  String get biometricWarningMessage =>
      'বায়োমেট্রিক সক্রিয় করলে, আপনি অ্যাপে প্রবেশ করতে আপনার Vash কোড ব্যবহার করতে পারবেন না।\n\nবায়োমেট্রিক ব্যর্থ হলে (একাধিক ব্যর্থ প্রচেষ্টার পরে) আপনি শুধুমাত্র Vash কোড ব্যবহার করতে পারবেন।\n\nআপনি কি চালিয়ে যেতে চান?';

  @override
  String get understood => 'আমি বুঝেছি';

  @override
  String get shareAppSubtitle => 'আপনার প্রিয়জনদের সাথে Hash শেয়ার করুন';

  @override
  String get share => 'শেয়ার';

  @override
  String get danger => 'বিপদ';

  @override
  String get deleteAccount => 'আমার অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountSubtitle => 'অপরিবর্তনীয় কাজ';

  @override
  String get deleteAccountConfirmTitle => 'আমার অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountConfirmMessage =>
      'আপনার অ্যাকাউন্ট স্থায়ীভাবে মুছে যাবে। এই কাজটি অপরিবর্তনীয়।\n\n• আপনার সমস্ত চ্যাট\n• আপনার সমস্ত পরিচিতি\n• আপনার Hash ID\n\nআপনাকে একটি নতুন অ্যাকাউন্ট তৈরি করতে হবে।';

  @override
  String get deleteForever => 'স্থায়ীভাবে মুছুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash মোড সক্রিয়।';

  @override
  String deletionError(String error) {
    return 'মোছায় ত্রুটি: $error';
  }

  @override
  String get yourSecurity => 'আপনার নিরাপত্তা';

  @override
  String get securityInfo =>
      '• এন্ড-টু-এন্ড এনক্রিপশন (Signal Protocol)\n• ডেলিভারির পর আমাদের সার্ভারে কোনো ডেটা নেই\n• কী শুধুমাত্র আপনার ডিভাইসে সংরক্ষিত\n• PIN কোড কখনো সার্ভারে পাঠানো হয় না';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'স্বাগতম';

  @override
  String get securityStatement1 => 'আপনার বার্তা সুরক্ষিত।';

  @override
  String get securityStatement2 => 'এন্ড-টু-এন্ড এনক্রিপশন।';

  @override
  String get securityStatement3 => 'কোনো চিহ্ন নেই। কোনো আপস নেই।';

  @override
  String get securityStatement4 => 'আপনার গোপনীয়তা একটি অধিকার।';

  @override
  String get accessBlocked => 'প্রবেশ অবরুদ্ধ';

  @override
  String get tooManyAttempts => 'অনেক বেশি প্রচেষ্টা। পরে আবার চেষ্টা করুন।';

  @override
  String get pleaseWait => 'অনুগ্রহ করে অপেক্ষা করুন';

  @override
  String get waitDelay => 'অনুগ্রহ করে বিলম্ব শেষ হওয়া পর্যন্ত অপেক্ষা করুন';

  @override
  String attemptCount(int current, int max) {
    return 'প্রচেষ্টা $current/$max';
  }

  @override
  String retryIn(String time) {
    return '$time পরে আবার চেষ্টা করুন';
  }

  @override
  String get forgotPin => 'PIN ভুলে গেছেন? পুনরুদ্ধার বাক্যাংশ ব্যবহার করুন';

  @override
  String get useRecoveryPhrase => 'পুনরুদ্ধার বাক্যাংশ ব্যবহার করুন';

  @override
  String get recoveryWarningTitle => 'সতর্কতা';

  @override
  String get recoveryWarningMessage => 'অ্যাকাউন্ট পুনরুদ্ধার করলে:';

  @override
  String get recoveryDeleteAllMessages => 'আপনার সমস্ত বার্তা মুছে যাবে';

  @override
  String get recoveryWaitDelay => '১ ঘণ্টা অপেক্ষা প্রয়োজন';

  @override
  String get recoveryKeepContacts => 'আপনার পরিচিতি রাখা হবে';

  @override
  String get recoveryIrreversible =>
      'এই কাজটি অপরিবর্তনীয়। আপনার বার্তা স্থায়ীভাবে হারিয়ে যাবে।';

  @override
  String get iUnderstand => 'আমি বুঝেছি';

  @override
  String get accountRecovery => 'অ্যাকাউন্ট পুনরুদ্ধার';

  @override
  String get enterRecoveryPhrase =>
      'আপনার পুনরুদ্ধার বাক্যাংশের ২৪টি শব্দ স্পেস দিয়ে আলাদা করে লিখুন।';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'পুনরুদ্ধার';

  @override
  String get recoveryPhraseRequired =>
      'অনুগ্রহ করে আপনার পুনরুদ্ধার বাক্যাংশ লিখুন';

  @override
  String get recoveryPhrase24Words => 'বাক্যাংশে ঠিক ২৪টি শব্দ থাকতে হবে';

  @override
  String get incorrectRecoveryPhrase => 'ভুল পুনরুদ্ধার বাক্যাংশ';

  @override
  String get recoveryInitError => 'পুনরুদ্ধার শুরুতে ত্রুটি';

  @override
  String get securityDelay => 'নিরাপত্তা বিলম্ব';

  @override
  String get securityDelayMessage =>
      'আপনার নিরাপত্তার জন্য, নতুন PIN তৈরি করার আগে একটি অপেক্ষার সময় প্রয়োজন।';

  @override
  String get timeRemaining => 'বাকি সময়';

  @override
  String get messagesDeletedForProtection =>
      'আপনার সুরক্ষার জন্য আপনার বার্তা মুছে ফেলা হয়েছে।';

  @override
  String get canCloseApp => 'আপনি অ্যাপ বন্ধ করে পরে ফিরে আসতে পারেন।';

  @override
  String get onboardingTitle1 => 'Hash-এ স্বাগতম';

  @override
  String get onboardingSubtitle1 => 'যে মেসেঞ্জার কোনো চিহ্ন রাখে না';

  @override
  String get onboardingTitle2 => 'সম্পূর্ণ এনক্রিপশন';

  @override
  String get onboardingSubtitle2 =>
      'আপনার বার্তা Signal protocol দিয়ে এন্ড-টু-এন্ড এনক্রিপ্টেড';

  @override
  String get onboardingTitle3 => 'কোনো চিহ্ন নেই';

  @override
  String get onboardingSubtitle3 =>
      'ডেলিভারির পর বার্তা সার্ভার থেকে মুছে যায়';

  @override
  String get onboardingTitle4 => 'আপনার নিরাপত্তা';

  @override
  String get onboardingSubtitle4 => 'PIN কোড, Vash মোড এবং পুনরুদ্ধার বাক্যাংশ';

  @override
  String get getStarted => 'শুরু করুন';

  @override
  String get next => 'পরবর্তী';

  @override
  String get skip => 'এড়িয়ে যান';

  @override
  String get alreadyHaveAccount => 'আমার ইতিমধ্যে একটি অ্যাকাউন্ট আছে';

  @override
  String get transferMyAccount => 'আমার অ্যাকাউন্ট স্থানান্তর করুন';

  @override
  String get createPin => 'একটি PIN কোড তৈরি করুন';

  @override
  String get createPinSubtitle => 'এই কোড আপনার অ্যাপে প্রবেশ রক্ষা করবে';

  @override
  String get confirmYourPin => 'আপনার PIN কোড নিশ্চিত করুন';

  @override
  String get confirmPinSubtitle => 'আবার আপনার PIN কোড দিন';

  @override
  String get saveRecoveryPhrase => 'পুনরুদ্ধার বাক্যাংশ';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'এই ২৪টি শব্দ ক্রমানুসারে লিখে রাখুন। PIN ভুলে গেলে এগুলো আপনার অ্যাকাউন্ট পুনরুদ্ধার করতে সাহায্য করবে।';

  @override
  String get phraseWritten => 'আমি আমার বাক্যাংশ লিখে রেখেছি';

  @override
  String get warningRecoveryPhrase =>
      'এই বাক্যাংশ হারালে এবং PIN ভুলে গেলে, আপনি আপনার অ্যাকাউন্টে প্রবেশ হারাবেন।';

  @override
  String get accountTransferred => 'অ্যাকাউন্ট স্থানান্তরিত';

  @override
  String get accountTransferredMessage =>
      'আপনার অ্যাকাউন্ট অন্য ডিভাইসে স্থানান্তরিত হয়েছে। এই সেশন আর বৈধ নয়।';

  @override
  String get accountTransferredInfo =>
      'আপনি এই স্থানান্তর শুরু না করলে, আপনার অ্যাকাউন্ট আপস করা হতে পারে।';

  @override
  String get logout => 'লগ আউট';

  @override
  String get transferAccount => 'অ্যাকাউন্ট স্থানান্তর';

  @override
  String get transferAccountInfo =>
      'আপনার Hash অ্যাকাউন্ট নতুন ডিভাইসে স্থানান্তর করুন। আপনার বর্তমান সেশন বাতিল হয়ে যাবে।';

  @override
  String get generateTransferCode => 'স্থানান্তর কোড তৈরি করুন';

  @override
  String get transferCode => 'স্থানান্তর কোড';

  @override
  String transferCodeExpires(int minutes) {
    return 'এই কোড $minutes মিনিটে মেয়াদ শেষ হবে';
  }

  @override
  String get enterCodeOnNewDevice =>
      'আপনার অ্যাকাউন্ট স্থানান্তর করতে আপনার নতুন ডিভাইসে এই কোড দিন।';

  @override
  String get generateNewCode => 'নতুন কোড তৈরি করুন';

  @override
  String get scanQrCode => 'QR কোড স্ক্যান করুন';

  @override
  String get scanQrCodeSubtitle => 'যোগ করতে পরিচিতির QR কোড স্ক্যান করুন';

  @override
  String get qrCodeDetected => 'QR কোড সনাক্ত হয়েছে';

  @override
  String get invalidQrCode => 'অবৈধ QR কোড';

  @override
  String get cameraPermissionRequired => 'ক্যামেরা অনুমতি প্রয়োজন';

  @override
  String get myQrCode => 'আমার QR কোড';

  @override
  String get myQrCodeSubtitle =>
      'এই QR কোড শেয়ার করুন যাতে আপনার পরিচিতিরা আপনাকে যোগ করতে পারে';

  @override
  String get shareQrCode => 'শেয়ার';

  @override
  String get addContactTitle => 'পরিচিতি যোগ করুন';

  @override
  String get addContactByHashId => 'আপনার পরিচিতির Hash ID লিখুন';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'খুঁজুন';

  @override
  String get contactNotFound => 'পরিচিতি পাওয়া যায়নি';

  @override
  String get contactAlreadyAdded => 'এই পরিচিতি ইতিমধ্যে আপনার তালিকায় আছে';

  @override
  String get contactAdded => 'পরিচিতি যোগ করা হয়েছে';

  @override
  String get myProfile => 'আমার প্রোফাইল';

  @override
  String get myProfileSubtitle =>
      'এই তথ্য শেয়ার করুন যাতে অন্যরা আপনাকে যোগ করতে পারে';

  @override
  String get temporaryCode => 'অস্থায়ী কোড';

  @override
  String temporaryCodeExpires(String time) {
    return '$time-এ মেয়াদ শেষ';
  }

  @override
  String get codeExpired => 'কোডের মেয়াদ শেষ';

  @override
  String get generateNewCodeButton => 'নতুন কোড';

  @override
  String get copyHashId => 'ID কপি করুন';

  @override
  String get copyCode => 'কোড কপি করুন';

  @override
  String get copiedToClipboard => 'কপি হয়েছে';

  @override
  String get showMyQrCode => 'আমার QR কোড দেখান';

  @override
  String get orDivider => 'অথবা';

  @override
  String get openScanner => 'স্ক্যানার খুলুন';

  @override
  String get addManually => 'ম্যানুয়ালি যোগ করুন';

  @override
  String get contactHashIdLabel => 'পরিচিতির Hash ID';

  @override
  String get temporaryCodeLabel => 'অস্থায়ী কোড';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'আপনার পরিচিতিকে তার প্রোফাইল থেকে একটি কোড তৈরি করতে বলুন';

  @override
  String get verifyAndAdd => 'যাচাই ও যোগ করুন';

  @override
  String get fillAllFields => 'অনুগ্রহ করে সমস্ত ক্ষেত্র পূরণ করুন';

  @override
  String get invalidHashIdFormat => 'অবৈধ ID ফরম্যাট (উদা: 123-456-ABC)';

  @override
  String get userNotFound => 'ব্যবহারকারী পাওয়া যায়নি';

  @override
  String get cannotAddYourself => 'আপনি নিজেকে যোগ করতে পারবেন না';

  @override
  String get invalidOrExpiredCode => 'অবৈধ বা মেয়াদোত্তীর্ণ অস্থায়ী কোড';

  @override
  String get contactFound => 'পরিচিতি পাওয়া গেছে!';

  @override
  String get howToCallContact => 'আপনি তাকে কী নামে ডাকতে চান?';

  @override
  String get contactNameHint => 'পরিচিতির নাম';

  @override
  String get addContactButton => 'যোগ করুন';

  @override
  String get contactDetails => 'পরিচিতির বিবরণ';

  @override
  String get contactName => 'পরিচিতির নাম';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date-এ যোগ করা হয়েছে';
  }

  @override
  String get deleteContact => 'পরিচিতি মুছুন';

  @override
  String deleteContactConfirm(Object name) {
    return 'এই পরিচিতি মুছবেন?';
  }

  @override
  String get deleteContactMessage => 'এটি সমস্ত চ্যাটও মুছে ফেলবে।';

  @override
  String get delete => 'মুছুন';

  @override
  String get typeMessage => 'একটি বার্তা লিখুন...';

  @override
  String get messageSent => 'পাঠানো হয়েছে';

  @override
  String get messageDelivered => 'বিতরণ করা হয়েছে';

  @override
  String get messageRead => 'পড়া হয়েছে';

  @override
  String get messageFailed => 'পাঠাতে ব্যর্থ';

  @override
  String get now => 'এখন';

  @override
  String minutesAgo(int count) {
    return '$countমিনিট';
  }

  @override
  String hoursAgo(int count) {
    return '$countঘ';
  }

  @override
  String daysAgo(int count) {
    return '$countদিন';
  }

  @override
  String get today => 'আজ';

  @override
  String get yesterday => 'গতকাল';

  @override
  String dateAtTime(String date, String time) {
    return '$date $time-এ';
  }

  @override
  String get shareMessage =>
      'Hash-এ আমার সাথে যোগ দিন! 🔒\n\nএটি একটি সত্যিকারের গোপনীয় মেসেঞ্জার: সম্পূর্ণ এনক্রিপশন, সার্ভারে কোনো চিহ্ন নেই, এবং প্রয়োজনে প্যানিক মোড।\n\nএখানে অ্যাপটি ডাউনলোড করুন 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'ত্রুটি';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get view => 'দেখুন';

  @override
  String get yes => 'হ্যাঁ';

  @override
  String get no => 'না';

  @override
  String get save => 'সংরক্ষণ';

  @override
  String get edit => 'সম্পাদনা';

  @override
  String get close => 'বন্ধ';

  @override
  String get confirm => 'নিশ্চিত';

  @override
  String get loading => 'লোড হচ্ছে...';

  @override
  String get retry => 'পুনরায় চেষ্টা';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'অপেক্ষমাণ অনুরোধ';

  @override
  String get noPendingRequests => 'কোনো অপেক্ষমাণ অনুরোধ নেই';

  @override
  String get pendingRequestsSubtitle => 'এই ব্যক্তিরা আপনাকে যোগ করতে চান';

  @override
  String requestFromUser(String hashId) {
    return '$hashId থেকে অনুরোধ';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days দিনে মেয়াদ শেষ';
  }

  @override
  String get acceptRequest => 'গ্রহণ';

  @override
  String get rejectRequest => 'প্রত্যাখ্যান';

  @override
  String get requestAccepted => 'অনুরোধ গৃহীত';

  @override
  String get requestRejected => 'অনুরোধ প্রত্যাখ্যাত';

  @override
  String get requestSent => 'অনুরোধ পাঠানো হয়েছে!';

  @override
  String get requestSentSubtitle =>
      'আপনার অনুরোধ পাঠানো হয়েছে। চ্যাট করতে ব্যবহারকারীকে এটি গ্রহণ করতে হবে।';

  @override
  String get requestAlreadyPending => 'একটি অনুরোধ ইতিমধ্যে অপেক্ষমাণ';

  @override
  String get requestAlreadySentByOther =>
      'এই ব্যক্তি ইতিমধ্যে আপনাকে একটি অনুরোধ পাঠিয়েছে';

  @override
  String get addByHashId => 'Hash ID দিয়ে যোগ করুন';

  @override
  String get addByHashIdSubtitle => 'পরিচিতির Hash ID এবং অস্থায়ী কোড দিন';

  @override
  String get enterTemporaryCode => '৬ সংখ্যার কোড দিন';

  @override
  String get sendRequest => 'অনুরোধ পাঠান';

  @override
  String get acceptContactTitle => 'পরিচিতি গ্রহণ';

  @override
  String get acceptContactSubtitle => 'আপনি তাকে একটি কাস্টম নাম দিতে পারেন';

  @override
  String get leaveEmptyForHashId => 'Hash ID ব্যবহার করতে খালি রাখুন';

  @override
  String get firstName => 'নাম';

  @override
  String get lastName => 'পদবি';

  @override
  String get notes => 'নোট';

  @override
  String get notesHint => 'এই পরিচিতি সম্পর্কে ব্যক্তিগত নোট';

  @override
  String get photoOptional => 'ছবি (ঐচ্ছিক)';

  @override
  String get contactNameOptional => 'নাম (ঐচ্ছিক)';

  @override
  String get notesOptional => 'নোট (ঐচ্ছিক)';

  @override
  String get storedLocally => 'শুধুমাত্র আপনার ডিভাইসে সংরক্ষিত';

  @override
  String get encryptedMessageLabel => 'এনক্রিপ্টেড বার্তা';

  @override
  String get identityMessageHint => 'আপনি কে? আপনারা কীভাবে পরিচিত?';

  @override
  String get messageWillBeSentEncrypted =>
      'এই বার্তাটি এনক্রিপ্ট করে প্রাপকের কাছে পাঠানো হবে';

  @override
  String get sendRequestButton => 'অনুরোধ পাঠান';

  @override
  String get requestExpiresIn24h =>
      'গৃহীত না হলে অনুরোধ ২৪ ঘণ্টায় মেয়াদ শেষ হবে';

  @override
  String get theyAlreadySentYouRequest =>
      'এই ব্যক্তি ইতিমধ্যে আপনাকে একটি অনুরোধ পাঠিয়েছে';

  @override
  String get requests => 'অনুরোধ';

  @override
  String get receivedRequests => 'প্রাপ্ত';

  @override
  String get sentRequests => 'প্রেরিত';

  @override
  String get noSentRequests => 'কোনো প্রেরিত অনুরোধ নেই';

  @override
  String get cancelRequest => 'বাতিল';

  @override
  String get deleteRequest => 'অনুরোধ মুছুন';

  @override
  String get requestCancelled => 'অনুরোধ বাতিল হয়েছে';

  @override
  String sentTo(String hashId) {
    return '$hashId-কে পাঠানো হয়েছে';
  }

  @override
  String expiresIn(String time) {
    return '$time-এ মেয়াদ শেষ';
  }

  @override
  String receivedAgo(String time) {
    return '$time আগে প্রাপ্ত';
  }

  @override
  String get messageFromRequester => 'অনুরোধকারীর বার্তা';

  @override
  String get copy => 'কপি';

  @override
  String get messageInfo => 'বার্তার তথ্য';

  @override
  String get messageDirection => 'দিক';

  @override
  String get messageSentByYou => 'আপনার পাঠানো';

  @override
  String get messageReceived => 'প্রাপ্ত';

  @override
  String get messageSentAt => 'পাঠানোর সময়';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'অবস্থা';

  @override
  String get messageReadAt => 'পড়ার সময়';

  @override
  String get messageType => 'ধরন';

  @override
  String get messageSize => 'আকার';

  @override
  String get messageExpiresAt => 'মেয়াদ শেষের সময়';

  @override
  String get messageEncrypted => 'এন্ড-টু-এন্ড এনক্রিপ্টেড';

  @override
  String get messageStatusSending => 'পাঠানো হচ্ছে...';

  @override
  String get messageStatusSent => 'পাঠানো হয়েছে';

  @override
  String get messageStatusDelivered => 'বিতরণ হয়েছে';

  @override
  String get messageStatusRead => 'পড়া হয়েছে';

  @override
  String get messageStatusFailed => 'ব্যর্থ';

  @override
  String get serverStatus => 'সার্ভার';

  @override
  String get onServer => 'বিতরণ অপেক্ষমাণ';

  @override
  String get deletedFromServer => 'মোছা হয়েছে';

  @override
  String get messageTypeText => 'টেক্সট';

  @override
  String get messageTypeImage => 'ছবি';

  @override
  String get messageTypeVideo => 'ভিডিও';

  @override
  String get messageTypeVoice => 'ভয়েস';

  @override
  String get messageTypeFile => 'ফাইল';

  @override
  String get indefinitely => 'অনির্দিষ্টকালের জন্য';

  @override
  String get hoursShort => 'ঘ';

  @override
  String get minutesShort => 'মিনিট';

  @override
  String get hours => 'ঘণ্টা';

  @override
  String get minutes => 'মিনিট';

  @override
  String get seconds => 'সেকেন্ড';

  @override
  String get ephemeralMessages => 'ক্ষণস্থায়ী বার্তা';

  @override
  String get ephemeralMessagesDescription =>
      'এই সময়ের পরে বার্তা স্বয়ংক্রিয়ভাবে মুছে যায়';

  @override
  String get ephemeralImmediate => 'তাৎক্ষণিক (পড়ার পর)';

  @override
  String get ephemeralImmediateDesc => 'পড়ার সাথে সাথে মুছে যায়';

  @override
  String get ephemeralMyPreference => 'আমার পছন্দ';

  @override
  String get ephemeralMyPreferenceDesc => 'গ্লোবাল সেটিং ব্যবহার করুন';

  @override
  String get ephemeralDefaultSetting => 'বার্তার সময়কাল';

  @override
  String get ephemeralChooseDefault => 'প্রস্তাবিত';

  @override
  String get ephemeral30Seconds => '৩০ সেকেন্ড';

  @override
  String get ephemeral30SecondsDesc => 'পড়ার ৩০ সেকেন্ড পরে মোছা হয়';

  @override
  String get ephemeral5Minutes => '৫ মিনিট';

  @override
  String get ephemeral5MinutesDesc => 'পড়ার ৫ মিনিট পরে মোছা হয়';

  @override
  String get ephemeral1Hour => '১ ঘণ্টা';

  @override
  String get ephemeral1HourDesc => 'পড়ার ১ ঘণ্টা পরে মোছা হয়';

  @override
  String get ephemeral3Hours => '৩ ঘণ্টা';

  @override
  String get ephemeral6Hours => '৬ ঘণ্টা';

  @override
  String get ephemeral6HoursDesc => 'পড়ার ৬ ঘণ্টা পরে মোছা হয়';

  @override
  String get ephemeral12Hours => '১২ ঘণ্টা';

  @override
  String get ephemeral24Hours => '২৪ ঘণ্টা';

  @override
  String get ephemeral24HoursDesc => 'পড়ার ২৪ ঘণ্টা পরে মোছা হয়';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'কাস্টম সময়কাল';

  @override
  String get howItWorks => 'এটি কীভাবে কাজ করে';

  @override
  String get ephemeralExplanation1 =>
      'বার্তা প্রাপ্তির সাথে সাথে সার্ভার থেকে মুছে যায়।';

  @override
  String get ephemeralExplanation2 =>
      'এই সেটিং নির্ধারণ করে পড়ার পর কখন বার্তা আপনার ফোন থেকে অদৃশ্য হবে।';

  @override
  String get ephemeralExplanation3 =>
      'আপনার পরিচিতির নিজের ফোনের জন্য নিজস্ব সেটিং আছে।';

  @override
  String get mute1Hour => '১ ঘণ্টা';

  @override
  String get mute8Hours => '৮ ঘণ্টা';

  @override
  String get mute1Day => '১ দিন';

  @override
  String get mute1Week => '১ সপ্তাহ';

  @override
  String get muteAlways => 'সবসময়';

  @override
  String get muteExplanation => 'এই পরিচিতির জন্য আপনি বিজ্ঞপ্তি পাবেন না';

  @override
  String get showCallsInRecents => 'সাম্প্রতিক কলে দেখান';

  @override
  String get showCallsInRecentsSubtitle => 'Hash কল ফোনের কল ইতিহাসে দেখায়';

  @override
  String get feedback => 'মতামত';

  @override
  String get muteNotifications => 'বিজ্ঞপ্তি নিঃশব্দ করুন';

  @override
  String get muteDescription => 'এই পরিচিতির জন্য আপনি বিজ্ঞপ্তি পাবেন না';

  @override
  String mutedUntil(String time) {
    return '$time পর্যন্ত নিঃশব্দ';
  }

  @override
  String get notMuted => 'বিজ্ঞপ্তি সক্রিয়';

  @override
  String get unmute => 'শব্দ চালু করুন';

  @override
  String get notificationSound => 'বিজ্ঞপ্তির শব্দ';

  @override
  String get defaultSound => 'ডিফল্ট';

  @override
  String get chatSettings => 'চ্যাট সেটিংস';

  @override
  String get bubbleColor => 'বাবল রঙ';

  @override
  String get backgroundColor => 'পটভূমির রঙ';

  @override
  String get backgroundImage => 'পটভূমির ছবি';

  @override
  String get chatBackground => 'চ্যাট পটভূমি';

  @override
  String get customColor => 'কাস্টম';

  @override
  String get defaultColor => 'ডিফল্ট';

  @override
  String get imageSelected => 'ছবি নির্বাচিত';

  @override
  String get noImage => 'কোনো ছবি নেই';

  @override
  String get color => 'রঙ';

  @override
  String get image => 'ছবি';

  @override
  String get tapToSelectImage => 'ছবি নির্বাচন করতে ট্যাপ করুন';

  @override
  String get changeImage => 'ছবি পরিবর্তন করুন';

  @override
  String get previewMessageReceived => 'হ্যালো!';

  @override
  String get previewMessageSent => 'কেমন আছেন!';

  @override
  String get messageAction => 'বার্তা';

  @override
  String get callAction => 'কল';

  @override
  String get videoAction => 'ভিডিও';

  @override
  String get personalNotes => 'ব্যক্তিগত নোট';

  @override
  String get addNotes => 'নোট যোগ করুন...';

  @override
  String get noNotes => 'কোনো নোট নেই';

  @override
  String get messageNotifications => 'বার্তা বিজ্ঞপ্তি';

  @override
  String get callNotifications => 'কল বিজ্ঞপ্তি';

  @override
  String get useGradient => 'গ্রেডিয়েন্ট ব্যবহার করুন';

  @override
  String get gradientStart => 'শুরুর রঙ';

  @override
  String get gradientEnd => 'শেষের রঙ';

  @override
  String get preview => 'পূর্বরূপ';

  @override
  String get reset => 'রিসেট';

  @override
  String get securityNumber => 'নিরাপত্তা নম্বর';

  @override
  String securityNumberDescription(String name) {
    return 'নিরাপত্তা নম্বর $name-এর ডিভাইসের সাথে মিলছে কিনা যাচাই করুন';
  }

  @override
  String get verifyEncryption => 'এন্ড-টু-এন্ড এনক্রিপশন যাচাই করুন';

  @override
  String get tapToCopy => 'কপি করতে ট্যাপ করুন';

  @override
  String get howToVerify => 'কীভাবে যাচাই করবেন';

  @override
  String get verifyStep1 =>
      'আপনার পরিচিতির সাথে সামনাসামনি দেখা করুন বা কল করুন';

  @override
  String get verifyStep2 => 'নিরাপত্তা নম্বর তুলনা করুন বা QR কোড স্ক্যান করুন';

  @override
  String get verifyStep3 => 'যদি মিলে যায়, আপনার চ্যাট নিরাপদ';

  @override
  String get scanToVerify => 'যাচাই করতে স্ক্যান করুন';

  @override
  String get reportSpam => 'স্প্যাম রিপোর্ট করুন';

  @override
  String get reportSpamSubtitle => 'এই পরিচিতিকে স্প্যাম হিসেবে রিপোর্ট করুন';

  @override
  String get reportSpamDescription =>
      'এই পরিচিতিকে বেনামে রিপোর্ট করা হবে। আপনার পরিচয় শেয়ার করা হবে না। আপনি কি নিশ্চিত?';

  @override
  String get report => 'রিপোর্ট';

  @override
  String get spamReported => 'স্প্যাম রিপোর্ট করা হয়েছে';

  @override
  String get reportError =>
      'রিপোর্ট পাঠাতে ব্যর্থ। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get reportRateLimited =>
      'আজকের জন্য সর্বোচ্চ রিপোর্ট সংখ্যা পৌঁছে গেছে।';

  @override
  String get blockContact => 'পরিচিতি ব্লক করুন';

  @override
  String get blockContactDescription =>
      'এই পরিচিতি আর আপনাকে বার্তা বা কল করতে পারবে না। তাকে জানানো হবে না।';

  @override
  String get unblockContact => 'পরিচিতি আনব্লক করুন';

  @override
  String get unblockContactDescription =>
      'এই পরিচিতি আবার আপনাকে বার্তা ও কল করতে পারবে।';

  @override
  String get contactBlocked => 'পরিচিতি ব্লক করা হয়েছে';

  @override
  String get contactUnblocked => 'পরিচিতি আনব্লক করা হয়েছে';

  @override
  String get contactIsBlocked => 'এই পরিচিতি ব্লক করা আছে';

  @override
  String get unblock => 'আনব্লক';

  @override
  String get deleteContactSubtitle => 'এই পরিচিতি ও চ্যাট মুছুন';

  @override
  String get confirmWithPin => 'PIN দিয়ে নিশ্চিত করুন';

  @override
  String get enterPinToConfirm => 'এই কাজ নিশ্চিত করতে আপনার PIN দিন';

  @override
  String get profilePhoto => 'প্রোফাইল ছবি';

  @override
  String get takePhoto => 'ছবি তুলুন';

  @override
  String get chooseFromGallery => 'গ্যালারি থেকে বেছে নিন';

  @override
  String get removePhoto => 'ছবি সরান';

  @override
  String get viewContactHashId => 'পরিচিতির পরিচয় দেখুন';

  @override
  String get hashIdPartiallyMasked =>
      'আপনার নিরাপত্তা ও আপনার পরিচিতির গোপনীয়তার জন্য আংশিক ঢাকা';

  @override
  String get addFirstContact => 'আপনার প্রথম পরিচিতি যোগ করুন';

  @override
  String get addFirstContactSubtitle =>
      'আপনার QR কোড শেয়ার করুন বা একটি বন্ধুর স্ক্যান করুন';

  @override
  String get directory => 'ডিরেক্টরি';

  @override
  String get noContacts => 'কোনো পরিচিতি নেই';

  @override
  String get noContactsSubtitle => 'শুরু করতে একটি পরিচিতি যোগ করুন';

  @override
  String get sendMessageAction => 'একটি বার্তা পাঠান';

  @override
  String get audioCall => 'অডিও কল';

  @override
  String get videoCall => 'ভিডিও কল';

  @override
  String get viewProfile => 'প্রোফাইল দেখুন';

  @override
  String get deleteContactDirectory => 'পরিচিতি মুছুন';

  @override
  String get scanShort => 'স্ক্যান';

  @override
  String get addShort => 'যোগ';

  @override
  String deleteContactConfirmName(String name) {
    return 'আপনি কি সত্যিই $name মুছতে চান?';
  }

  @override
  String get noNotesTitle => 'কোনো নোট নেই';

  @override
  String get noNotesSubtitle => 'আপনার প্রথম নোট তৈরি করুন';

  @override
  String get newNote => 'নতুন নোট';

  @override
  String get editNote => 'নোট সম্পাদনা';

  @override
  String get deleteNote => 'নোট মুছুন';

  @override
  String get deleteNoteConfirm => 'আপনি কি সত্যিই এই নোট মুছতে চান?';

  @override
  String get noteTitle => 'শিরোনাম';

  @override
  String get noteContent => 'বিষয়বস্তু';

  @override
  String get addItem => 'আইটেম যোগ করুন';

  @override
  String get pinNote => 'পিন করুন';

  @override
  String get unpinNote => 'আনপিন করুন';

  @override
  String get noteColor => 'রঙ';

  @override
  String get notePassword => 'পাসওয়ার্ড';

  @override
  String get setPassword => 'পাসওয়ার্ড সেট করুন';

  @override
  String get changePassword => 'পাসওয়ার্ড পরিবর্তন করুন';

  @override
  String get removePassword => 'পাসওয়ার্ড সরান';

  @override
  String get enterPassword => 'পাসওয়ার্ড দিন';

  @override
  String get confirmPassword => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get passwordPin => 'PIN কোড';

  @override
  String get passwordText => 'টেক্সট পাসওয়ার্ড';

  @override
  String get protectedNote => 'সুরক্ষিত নোট';

  @override
  String get incorrectPassword => 'ভুল পাসওয়ার্ড';

  @override
  String get passwordSet => 'পাসওয়ার্ড সেট হয়েছে';

  @override
  String get passwordRemoved => 'পাসওয়ার্ড সরানো হয়েছে';

  @override
  String get notesBiometric => 'নোটের জন্য Face ID';

  @override
  String get notesBiometricSubtitle =>
      'সুরক্ষিত নোট খুলতে বায়োমেট্রিক প্রমাণীকরণ প্রয়োজন';

  @override
  String get textNote => 'টেক্সট নোট';

  @override
  String get checklistNote => 'চেকলিস্ট';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total কাজ';
  }

  @override
  String get autoSaved => 'সংরক্ষিত';

  @override
  String get searchNotes => 'নোট খুঁজুন';

  @override
  String get legalConsent => 'আইনি সম্মতি';

  @override
  String get confirmAge13 => 'আমি নিশ্চিত করছি যে আমার বয়স কমপক্ষে ১৩ বছর';

  @override
  String get acceptLegalStart => 'আমি গ্রহণ করছি ';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get termsOfService => 'সেবার শর্তাবলী';

  @override
  String get andThe => ' এবং ';

  @override
  String get continueButton => 'চালিয়ে যান';

  @override
  String get mustAcceptTerms => 'চালিয়ে যেতে আপনাকে উভয় শর্ত গ্রহণ করতে হবে';

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
  String get support => 'সহায়তা';

  @override
  String get contactSupport => 'সহায়তায় যোগাযোগ করুন';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'অপব্যবহার রিপোর্ট করুন';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'আইনি';

  @override
  String get legalEntity => 'আইনি সত্তা';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'পিন করুন';

  @override
  String get unpinConversation => 'আনপিন করুন';

  @override
  String get hideConversation => 'ফিড থেকে সরান';

  @override
  String get deleteConversation => 'কথোপকথন মুছুন';

  @override
  String get deleteConversationConfirm =>
      'সমস্ত বার্তা মোছা নিশ্চিত করতে আপনার PIN দিন';

  @override
  String get noConversations => 'এখনো কোনো কথোপকথন নেই';

  @override
  String get startConversation => 'শুরু করুন';

  @override
  String get microphonePermissionRequired => 'মাইক্রোফোন অ্যাক্সেস প্রয়োজন';

  @override
  String get microphonePermissionExplanation =>
      'কল করতে Hash-এর মাইক্রোফোন প্রয়োজন।';

  @override
  String get cameraPermissionExplanation =>
      'ভিডিও কলের জন্য Hash-এর ক্যামেরা প্রয়োজন।';

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
  String get openSettings => 'সেটিংস খুলুন';

  @override
  String get callConnecting => 'সংযোগ হচ্ছে...';

  @override
  String get callRinging => 'রিং হচ্ছে...';

  @override
  String get callReconnecting => 'পুনঃসংযোগ হচ্ছে...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'পুনঃসংযোগ ($secondsসে)';
  }

  @override
  String get callPaused => 'বিরতি';

  @override
  String get callPausedSubtitle => 'কলটি এখনও সক্রিয় আছে';

  @override
  String get callRemoteMicMuted => 'পরিচিতির মাইক্রোফোন নিঃশব্দ';

  @override
  String get callMiniControlsMute => 'নিঃশব্দ';

  @override
  String get callMiniControlsUnmute => 'শব্দ চালু';

  @override
  String get callMiniControlsHangUp => 'কল শেষ';

  @override
  String get callMiniControlsReturn => 'কলে ফিরুন';

  @override
  String get callNetworkPoor => 'অস্থির সংযোগ';

  @override
  String get callNetworkLost => 'সংযোগ হারিয়ে গেছে';

  @override
  String get callEndedTitle => 'কল শেষ হয়েছে';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'ডিভাইস ডেটা';

  @override
  String get deviceDataSubtitle => 'স্থানীয় ও সার্ভার স্টোরেজ';

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
  String get localStorage => 'স্থানীয় স্টোরেজ';

  @override
  String get onThisDevice => 'এই ডিভাইসে';

  @override
  String get encryptedDatabases => 'এনক্রিপ্টেড ডাটাবেস';

  @override
  String get files => 'ফাইল';

  @override
  String get secureKeychain => 'নিরাপদ কীচেইন';

  @override
  String get cache => 'ক্যাশ';

  @override
  String get contactsDetail => 'নাম, অবতার, Signal কী';

  @override
  String get messagesDetail => 'এনক্রিপ্টেড কথোপকথন';

  @override
  String get notesDetail => 'ব্যক্তিগত নোট';

  @override
  String get signalSessions => 'Signal সেশন';

  @override
  String get signalSessionsDetail => 'এনক্রিপশন সেশন';

  @override
  String get pendingContacts => 'অপেক্ষমাণ পরিচিতি';

  @override
  String get pendingContactsDetail => 'অপেক্ষমাণ অনুরোধ';

  @override
  String get callHistory => 'কল';

  @override
  String get callHistoryDetail => 'কল ইতিহাস';

  @override
  String get preferences => 'পছন্দসমূহ';

  @override
  String get preferencesDetail => 'মিডিয়া ও কল পছন্দ';

  @override
  String get avatars => 'অবতার';

  @override
  String get media => 'মিডিয়া';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ফাইল',
      one: '১টি ফাইল',
      zero: 'কোনো ফাইল নেই',
    );
    return '$_temp0';
  }

  @override
  String get active => 'সক্রিয়';

  @override
  String get notDefined => 'নির্ধারিত নয়';

  @override
  String get biometrics => 'বায়োমেট্রিক্স';

  @override
  String get recoveryPhrase => 'পুনরুদ্ধার বাক্যাংশ';

  @override
  String get identity => 'পরিচয় (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol কী';

  @override
  String get authTokens => 'প্রমাণীকরণ টোকেন';

  @override
  String get contactNamesCache => 'পরিচিতির নাম ক্যাশ';

  @override
  String get remoteConfig => 'দূরবর্তী কনফিগ';

  @override
  String get notificationPrefs => 'বিজ্ঞপ্তি পছন্দ';

  @override
  String get serverData => 'সার্ভার ডেটা';

  @override
  String get serverDataInfo =>
      'Hash সার্ভারে ন্যূনতম ডেটা রাখে, সব এনক্রিপ্টেড বা অস্থায়ী।';

  @override
  String get serverProfile => 'প্রোফাইল';

  @override
  String get serverProfileDetail => 'Hash ID, পাবলিক কী, মেইলবক্স টোকেন';

  @override
  String get serverPrekeys => 'প্রি-কী';

  @override
  String get serverPrekeysDetail => 'এককালীন Signal কী (ব্যবহৃত)';

  @override
  String get serverMessages => 'ট্রানজিটে বার্তা';

  @override
  String get serverMessagesDetail => 'বিতরণের পর মোছা হয় (সর্বোচ্চ ২৪ ঘণ্টা)';

  @override
  String get serverMedia => 'ট্রানজিটে মিডিয়া';

  @override
  String get serverMediaDetail => 'ডাউনলোডের পর মোছা হয়';

  @override
  String get serverContactRequests => 'পরিচিতি অনুরোধ';

  @override
  String get serverContactRequestsDetail => '২৪ ঘণ্টা পর মেয়াদ শেষ';

  @override
  String get serverRateLimits => 'হার সীমা';

  @override
  String get serverRateLimitsDetail => 'অস্থায়ী অপব্যবহার-বিরোধী ডেটা';

  @override
  String get privacyReassurance =>
      'Hash আপনার বার্তা পড়তে পারে না। সমস্ত ডেটা এন্ড-টু-এন্ড এনক্রিপ্টেড। সার্ভার ডেটা স্বয়ংক্রিয়ভাবে মুছে যায়।';

  @override
  String get pinTooSimple => 'এই PIN খুব সহজ। আরও নিরাপদ কোড বেছে নিন।';

  @override
  String get genericError =>
      'একটি ত্রুটি হয়েছে। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'অ্যাকাউন্ট তৈরি করতে অক্ষম: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'বাক্যাংশ ক্লিপবোর্ডে কপি হয়েছে';

  @override
  String get copyPhrase => 'বাক্যাংশ কপি করুন';

  @override
  String get recoveryPhraseSecurityWarning =>
      'এই বাক্যাংশ নিরাপদ স্থানে লিখে রাখুন। এই বাক্যাংশ ছাড়া PIN হারালে, আপনি স্থায়ীভাবে আপনার ডেটায় প্রবেশ হারাবেন।';

  @override
  String get noMessages => 'কোনো বার্তা নেই';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name-এর সাথে সমস্ত বার্তা মুছবেন?';
  }

  @override
  String get confirmation => 'নিশ্চিতকরণ';

  @override
  String get untitled => 'শিরোনামহীন';

  @override
  String get noSessions => 'কোনো সেশন নেই';

  @override
  String get unknownContact => 'অজানা পরিচিতি';

  @override
  String get unnamed => 'নামহীন';

  @override
  String get noPendingRequestsAlt => 'কোনো অপেক্ষমাণ অনুরোধ নেই';

  @override
  String get deleteAllCallHistory => 'সমস্ত কল ইতিহাস মুছবেন?';

  @override
  String get noCalls => 'কোনো কল নেই';

  @override
  String get noPreferences => 'কোনো পছন্দ নেই';

  @override
  String get resetAllMediaPrefs => 'সমস্ত মিডিয়া পছন্দ রিসেট করবেন?';

  @override
  String get deleteThisAvatar => 'এই অবতার মুছবেন?';

  @override
  String get deleteAllAvatars => 'সমস্ত অবতার মুছবেন?';

  @override
  String get noAvatars => 'কোনো অবতার নেই';

  @override
  String get deleteThisFile => 'এই ফাইল মুছবেন?';

  @override
  String get deleteAllMediaFiles => 'সমস্ত মিডিয়া মুছবেন?';

  @override
  String get noMediaFiles => 'কোনো মিডিয়া নেই';

  @override
  String get outgoing => 'বহির্গামী';

  @override
  String get incoming => 'আগত';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'ক্ষণস্থায়ী দর্শন: $secondsসে';
  }

  @override
  String get normalView => 'সাধারণ দর্শন';

  @override
  String get callReasonCompleted => 'সম্পন্ন';

  @override
  String get callReasonMissed => 'মিসড';

  @override
  String get callReasonDeclined => 'প্রত্যাখ্যাত';

  @override
  String get callReasonFailed => 'ব্যর্থ';

  @override
  String get justNow => 'এইমাত্র';

  @override
  String timeAgoMinutes(int count) {
    return '$count মিনিট আগে';
  }

  @override
  String timeAgoHours(int count) {
    return '$countঘ আগে';
  }

  @override
  String timeAgoDays(int count) {
    return '$countদিন আগে';
  }

  @override
  String get messageTypeContact => 'পরিচিতি';

  @override
  String get messageTypeLocation => 'অবস্থান';

  @override
  String get statusQueued => 'সারিবদ্ধ';

  @override
  String get blockedBadge => 'ব্লক করা';

  @override
  String get protectedBadge => 'সুরক্ষিত';

  @override
  String messageCount(int count) {
    return '$countটি বার্তা';
  }

  @override
  String get deleteQuestion => 'মুছবেন?';

  @override
  String get transferMyAccountTitle => 'আমার অ্যাকাউন্ট স্থানান্তর করুন';

  @override
  String get loadingError => 'লোডিং ত্রুটি';

  @override
  String get transferToNewDevice => 'নতুন ডিভাইসে স্থানান্তর করুন';

  @override
  String get transferInstructions =>
      'আপনার নতুন ডিভাইসে \"আমার অ্যাকাউন্ট পুনরুদ্ধার করুন\" বেছে নিন এবং এই তথ্য দিন:';

  @override
  String get yourHashIdLabel => 'আপনার Hash ID';

  @override
  String get enterYourPinCode => 'আপনার PIN কোড দিন';

  @override
  String get pinOwnerConfirmation =>
      'এই অ্যাকাউন্টের মালিক আপনি তা নিশ্চিত করতে';

  @override
  String get scanThisQrCode => 'এই QR কোড স্ক্যান করুন';

  @override
  String get withYourNewDevice => 'আপনার নতুন ডিভাইস দিয়ে';

  @override
  String get orEnterTheCode => 'অথবা কোড দিন';

  @override
  String get transferCodeLabel => 'স্থানান্তর কোড';

  @override
  String get proximityVerification => 'নৈকট্য যাচাইকরণ';

  @override
  String get bringDevicesCloser => 'দুটি ডিভাইস কাছে আনুন';

  @override
  String get confirmTransferQuestion => 'স্থানান্তর নিশ্চিত করবেন?';

  @override
  String get accountWillBeTransferred =>
      'আপনার অ্যাকাউন্ট নতুন ডিভাইসে স্থানান্তরিত হবে।\n\nএই ডিভাইস স্থায়ীভাবে সংযোগবিচ্ছিন্ন হবে।';

  @override
  String get transferComplete => 'স্থানান্তর সম্পন্ন';

  @override
  String get transferSuccessMessage =>
      'আপনার অ্যাকাউন্ট সফলভাবে স্থানান্তরিত হয়েছে।\n\nএই অ্যাপ্লিকেশন এখন বন্ধ হবে।';

  @override
  String get manualVerification => 'ম্যানুয়াল যাচাইকরণ';

  @override
  String get codeDisplayedOnBothDevices => 'দুটি ডিভাইসে প্রদর্শিত কোড:';

  @override
  String get doesCodeMatchNewDevice =>
      'এই কোড কি নতুন ডিভাইসের কোডের সাথে মিলছে?';

  @override
  String get verifiedStatus => 'যাচাইকৃত';

  @override
  String get inProgressStatus => 'চলছে...';

  @override
  String get notAvailableStatus => 'উপলব্ধ নয়';

  @override
  String get codeExpiredRestart =>
      'কোডের মেয়াদ শেষ। অনুগ্রহ করে পুনরায় শুরু করুন।';

  @override
  String get codesDoNotMatchCancelled => 'কোড মিলছে না। স্থানান্তর বাতিল।';

  @override
  String transferToDevice(String device) {
    return 'গন্তব্য: $device';
  }

  @override
  String get copiedExclamation => 'কপি হয়েছে!';

  @override
  String expiresInTime(String time) {
    return '$time-এ মেয়াদ শেষ';
  }

  @override
  String get biometricNotAvailable => 'এই ডিভাইসে বায়োমেট্রিক্স উপলব্ধ নয়';

  @override
  String get biometricAuthError => 'বায়োমেট্রিক প্রমাণীকরণে ত্রুটি';

  @override
  String get authenticateForBiometric =>
      'বায়োমেট্রিক সক্রিয় করতে অনুগ্রহ করে প্রমাণীকরণ করুন';

  @override
  String get biometricAuthFailed => 'বায়োমেট্রিক প্রমাণীকরণ ব্যর্থ';

  @override
  String get forceUpdateTitle => 'আপডেট প্রয়োজন';

  @override
  String get forceUpdateMessage =>
      'Hash-এর নতুন সংস্করণ পাওয়া যাচ্ছে। চালিয়ে যেতে অনুগ্রহ করে আপডেট করুন।';

  @override
  String get updateButton => 'আপডেট';

  @override
  String get maintenanceInProgress => 'রক্ষণাবেক্ষণ চলছে';

  @override
  String get tryAgainLater => 'অনুগ্রহ করে পরে আবার চেষ্টা করুন';

  @override
  String get information => 'তথ্য';

  @override
  String get later => 'পরে';

  @override
  String get doYouLikeHash => 'Hash আপনার ভালো লাগছে?';

  @override
  String get yourFeedbackHelps => 'আপনার মতামত অ্যাপ উন্নত করতে সাহায্য করে';

  @override
  String get ratingTerrible => 'ভয়াবহ';

  @override
  String get ratingBad => 'খারাপ';

  @override
  String get ratingOk => 'ঠিকঠাক';

  @override
  String get ratingGood => 'ভালো';

  @override
  String get ratingExcellent => 'চমৎকার!';

  @override
  String get donationMessage =>
      'Hash একটি অলাভজনক প্রকল্প। আপনার সমর্থন সত্যিকারের গোপনীয় মেসেঞ্জার তৈরি করতে সাহায্য করে।';

  @override
  String get recentConnections => 'সাম্প্রতিক সংযোগ';

  @override
  String get loginInfoText =>
      'প্রতিটি PIN আনলক স্থানীয়ভাবে রেকর্ড করা হয়। শুধুমাত্র শেষ ২৪ ঘণ্টা রাখা হয়।';

  @override
  String get connectionCount => 'সংযোগ';

  @override
  String get periodLabel => 'সময়কাল';

  @override
  String get historyLabel => 'ইতিহাস';

  @override
  String get noLoginRecorded => 'কোনো লগইন রেকর্ড নেই';

  @override
  String get nextUnlocksAppearHere => 'পরবর্তী আনলক এখানে দেখাবে।';

  @override
  String get dataLocalOnly =>
      'এই ডেটা শুধুমাত্র আপনার ডিভাইসে সংরক্ষিত এবং কখনো পাঠানো হয় না।';

  @override
  String get currentSession => 'বর্তমান';

  @override
  String get todayLabel => 'আজ';

  @override
  String get yesterdayLabel => 'গতকাল';

  @override
  String get justNowLabel => 'এইমাত্র';

  @override
  String minutesAgoLabel(int count) {
    return '$count মিনিট আগে';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursঘ আগে';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursঘ $minutesমিনিট আগে';
  }

  @override
  String get noMaintenancePlanned => 'কোনো রক্ষণাবেক্ষণ পরিকল্পিত নেই';

  @override
  String get everythingWorkingNormally => 'সবকিছু স্বাভাবিকভাবে কাজ করছে';

  @override
  String get maintenanceTitle => 'রক্ষণাবেক্ষণ';

  @override
  String get maintenanceActiveLabel => 'চলমান';

  @override
  String get maintenancePlannedLabel => 'পরিকল্পিত';

  @override
  String get locking => 'লক হচ্ছে...';

  @override
  String get newMessageNotification => 'নতুন বার্তা';

  @override
  String get secExplainTitle => 'Hash কীভাবে আপনাকে রক্ষা করে';

  @override
  String get secExplainIntro =>
      'Hash এমনভাবে তৈরি যে কেউ আপনার বার্তা পড়তে পারবে না।';

  @override
  String get secExplainIntroSub =>
      'আমরাও না।\nএটি কীভাবে কাজ করে, সহজভাবে ব্যাখ্যা করা হলো।';

  @override
  String get secJourneyLabel => 'যাত্রা';

  @override
  String get secJourneyTitle => 'আপনার বার্তার যাত্রা';

  @override
  String get secJourneySubtitle =>
      'আপনার আঙুল থেকে পরিচিতির স্ক্রিন পর্যন্ত, প্রতিটি ধাপ সুরক্ষিত। পথ অনুসরণ করুন।';

  @override
  String get secStep1Title => 'আপনি আপনার বার্তা লেখেন';

  @override
  String get secStep1Desc =>
      'আপনি অ্যাপে \"হ্যালো!\" টাইপ করেন। এই মুহূর্তে, বার্তাটি শুধুমাত্র আপনার ফোনের মেমোরিতে আছে। কিছুই পাঠানো হয়নি।';

  @override
  String get secStep2Title => 'Signal Protocol দিয়ে এনক্রিপশন';

  @override
  String get secStep2Desc =>
      '\"পাঠান\" চাপার সাথে সাথে, আপনার বার্তা অবোধ্য অক্ষরের সারিতে রূপান্তরিত হয়। এটা যেন আপনার বার্তা একটি তিজোরিতে বন্ধ যার চাবি শুধু আপনার পরিচিতির কাছে।';

  @override
  String get secStep3Title => 'Sealed Sender: অদৃশ্য খাম';

  @override
  String get secStep3Desc =>
      'কল্পনা করুন আপনি চিঠি পাঠাচ্ছেন, কিন্তু খামে কোনো প্রেরকের ঠিকানা নেই। Hash ঠিক এটাই করে। বার্তাটি একটি বেনামী মেইলবক্সে রাখা হয়। সার্ভার জানে না কে পাঠিয়েছে।';

  @override
  String get secStep4Title => 'সার্ভার কিছুই দেখে না';

  @override
  String get secStep4Desc =>
      'সার্ভার একজন অন্ধ ডাকপিয়নের মতো। এটি শুধু জানে \"কেউ #A7X9 মেইলবক্সে কিছু রেখেছে\"। কে পাঠিয়েছে, কী আছে বা কার জন্য — জানে না।';

  @override
  String get secStep4Highlight =>
      'কোনো মেটাডেটা সংরক্ষিত হয় না: কোনো IP ঠিকানা, টাইমস্ট্যাম্প বা প্রেরক-প্রাপকের সংযোগ নেই।';

  @override
  String get secStep5Title => 'আপনার পরিচিতি বার্তা পায়';

  @override
  String get secStep5Desc =>
      'আপনার পরিচিতির ফোন তার বেনামী মেইলবক্স থেকে বিষয়বস্তু নেয় এবং তার প্রাইভেট কী দিয়ে বার্তা ডিক্রিপ্ট করে, যা কখনো তার ডিভাইস ছাড়েনি। \"হ্যালো!\" তার স্ক্রিনে দেখা যায়।';

  @override
  String get secStep6Title => 'বার্তা সার্ভার থেকে অদৃশ্য হয়';

  @override
  String get secStep6Desc =>
      'আপনার পরিচিতি প্রাপ্তি নিশ্চিত করার সাথে সাথে সার্ভার স্থায়ীভাবে বার্তা মুছে দেয়। কোনো ট্র্যাশ, আর্কাইভ বা ব্যাকআপ নেই। অপঠিত বার্তাও ২৪ ঘণ্টা পর স্বয়ংক্রিয়ভাবে ধ্বংস হয়।';

  @override
  String get secStep7Title => 'স্থানীয় মেয়াদ শেষ';

  @override
  String get secStep7Desc =>
      'আপনার পরিচিতির ফোনে, বার্তা আপনার বেছে নেওয়া সময় অনুযায়ী স্বয়ংক্রিয়ভাবে মুছে যায়: পড়ার সাথে সাথে, ৫ মিনিট, ১ ঘণ্টা... আপনি সিদ্ধান্ত নেন।';

  @override
  String get secJourneyConclusion =>
      'ফলাফল: সার্ভারে শূন্য চিহ্ন, ডিভাইসে শূন্য চিহ্ন। বার্তাটি শুধু পড়ার জন্য প্রয়োজনীয় সময় ছিল, তারপর অদৃশ্য হয়ে গেছে।';

  @override
  String get secArchLabel => 'স্থাপত্য';

  @override
  String get secArchTitle => 'সুরক্ষার ৫টি স্তর';

  @override
  String get secArchSubtitle =>
      'Hash একটি মাত্র প্রযুক্তির উপর নির্ভর করে না। প্রতিটি স্তর অন্যগুলোকে শক্তিশালী করে। একটি স্তর আপস হলেও, আপনার ডেটা নিরাপদ থাকে।';

  @override
  String get secLayer1Title => 'এন্ড-টু-এন্ড এনক্রিপশন';

  @override
  String get secLayer1Desc =>
      'প্রতিটি বার্তা একটি অনন্য কী দিয়ে এনক্রিপ্ট করা হয়। সহজ ভাষায়: কেউ একটি বার্তা ডিক্রিপ্ট করলেও, পরেরটি করতে পারবে না। প্রতিটি বার্তার নিজস্ব তালা আছে।';

  @override
  String get secLayer1Detail =>
      'ফাইলের জন্য (ছবি, ভিডিও, ডকুমেন্ট), Hash অতিরিক্ত AES-256-GCM এনক্রিপশন ব্যবহার করে। ফাইল আপনার ফোন ছাড়ার আগেই এনক্রিপ্ট হয়।';

  @override
  String get secLayer2Title => 'Sealed Sender (নেটওয়ার্ক বেনামিতা)';

  @override
  String get secLayer2Desc =>
      'সাধারণ মেসেঞ্জার আপনার পরিচয় সংযুক্ত করে বার্তা পাঠায়। এটা যেন খামে নাম লেখা। Hash বেনামী মেইলবক্স ব্যবহার করে: সার্ভার বার্তা পৌঁছায় কে পাঠিয়েছে না জেনে।';

  @override
  String get secLayer2Detail =>
      'ফলাফল: সার্ভার ডেটা ফাঁস হলেও, কে কার সাথে কথা বলে পুনর্গঠন করা অসম্ভব।';

  @override
  String get secLayer3Title => 'স্বয়ংক্রিয় মোছা';

  @override
  String get secLayer3Desc =>
      'প্রাপ্তি নিশ্চিত হলে বার্তা সার্ভার থেকে মুছে যায়। কোনো বার্তা না পাওয়া গেলেও ২৪ ঘণ্টা পর স্বয়ংক্রিয়ভাবে ধ্বংস হয়।';

  @override
  String get secLayer3Detail =>
      'আপনার ফোনে, বার্তা আপনার বেছে নেওয়া সময় অনুযায়ী স্বয়ংক্রিয়ভাবে মুছে যায়: তাৎক্ষণিক, ৫ মিনিট, ১৫ মিনিট, ৩০ মিনিট, ১ ঘণ্টা, ৩ ঘণ্টা, ৬ ঘণ্টা বা ১২ ঘণ্টা।';

  @override
  String get secLayer4Title => 'স্থানীয় প্রবেশ সুরক্ষা';

  @override
  String get secLayer4Desc =>
      'অ্যাপটি ৬ সংখ্যার PIN এবং/অথবা বায়োমেট্রিক্স (Face ID, আঙুলের ছাপ) দিয়ে সুরক্ষিত। অনেক ব্যর্থ প্রচেষ্টার পর, প্রতিটি ব্যর্থতায় ক্রমবর্ধমান বিলম্বের সাথে অ্যাপ লক হয়।';

  @override
  String get secLayer5Title => 'লক করা ডাটাবেস';

  @override
  String get secLayer5Desc =>
      'সার্ভার দিকে, কোনো ব্যবহারকারী সরাসরি ডাটাবেসে লিখতে পারে না। সমস্ত কাজ নিরাপদ ফাংশনের মাধ্যমে হয় যা প্রতিটি অনুরোধ যাচাই করে।';

  @override
  String get secLayer5Detail =>
      'এটা ব্যাংকের কাউন্টারের মতো: আপনি নিজে কখনো ভল্ট ছোঁন না। আপনি অনুরোধ করেন, এবং সিস্টেম কাজ করার আগে আপনার অধিকার যাচাই করে।';

  @override
  String get secVashLabel => 'বিশ্বে অনন্য';

  @override
  String get secVashTitle => 'Vash মোড';

  @override
  String get secVashSubtitle =>
      'একটি জরুরি নিরাপত্তা ব্যবস্থা যা অন্য কোনো মেসেজিং অ্যাপে নেই।';

  @override
  String get secVashScenarioTitle => 'এই পরিস্থিতি কল্পনা করুন';

  @override
  String get secVashScenario1 => 'কেউ আপনার ফোনে প্রবেশ করে';

  @override
  String get secVashScenario2 => 'আপনার কাছে PIN কোড চাওয়া হয়';

  @override
  String get secVashScenario3 => 'আপনি জরুরিভাবে সমস্ত ডেটা মুছতে চান';

  @override
  String get secVashSolutionTitle => 'সমাধান: দুটি PIN কোড';

  @override
  String get secVashSolutionDesc =>
      'আপনি Hash-এ দুটি ভিন্ন PIN কোড কনফিগার করেন:';

  @override
  String get secVashNormalCodeLabel => 'সাধারণ কোড';

  @override
  String get secVashNormalCodeDesc =>
      'আপনার সমস্ত ডেটা সহ অ্যাপ স্বাভাবিকভাবে খোলে';

  @override
  String get secVashCodeLabel2 => 'Vash কোড';

  @override
  String get secVashCodeDescription =>
      'অ্যাপ স্বাভাবিকভাবে খোলে... কিন্তু পেছনে নীরবে আপনার সমস্ত ডেটা মুছে যায়';

  @override
  String get secVashWhatHappensTitle => 'এরপর কী হয়';

  @override
  String get secVashWhatHappensDesc =>
      'অ্যাপ স্বাভাবিকভাবে খোলে। কোনো সতর্কতা নেই, কোনো সন্দেহজনক অ্যানিমেশন নেই। স্ক্রিনে কেবল একটি খালি অ্যাপ দেখায়, যেন আপনি এটি সদ্য ইনস্টল করেছেন।\n\nবাস্তবে, আপনার সমস্ত কথোপকথন, পরিচিতি ও বার্তা মুহূর্তের মধ্যে অপরিবর্তনীয়ভাবে মুছে গেছে।';

  @override
  String get secCallsLabel => 'কল ও ফাইল';

  @override
  String get secCallsTitle => 'সবকিছু এনক্রিপ্টেড';

  @override
  String get secCallsSubtitle =>
      'শুধু বার্তা নয়। Hash-এর মধ্য দিয়ে যায় এমন সবকিছু এন্ড-টু-এন্ড এনক্রিপ্টেড।';

  @override
  String get secAudioCallTitle => 'অডিও কল';

  @override
  String get secAudioCallDesc =>
      'WebRTC-র মাধ্যমে এন্ড-টু-এন্ড এনক্রিপ্টেড। ভয়েস সরাসরি ডিভাইসের মধ্যে প্রেরিত হয়।';

  @override
  String get secVideoCallTitle => 'ভিডিও কল';

  @override
  String get secVideoCallDesc =>
      'একই প্রযুক্তি, প্রতিটি স্ট্রিম আলাদাভাবে এনক্রিপ্টেড।';

  @override
  String get secPhotosTitle => 'ছবি ও ভিডিও';

  @override
  String get secPhotosDesc => 'আপনার ফোন ছাড়ার আগে AES-256-GCM-এ এনক্রিপ্টেড।';

  @override
  String get secDocsTitle => 'ডকুমেন্ট';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, যেকোনো ফাইল। নাম, আকার ও বিষয়বস্তু এনক্রিপ্টেড।';

  @override
  String get secAnonLabel => 'বেনামিতা';

  @override
  String get secAnonTitle => 'কোনো পরিচয় প্রয়োজন নেই';

  @override
  String get secAnonSubtitle =>
      'Hash কখনো আপনার ফোন নম্বর বা ইমেইল চায় না। আপনাকে একটি অনন্য ও বেনামী Hash ID দিয়ে চেনা হয়।';

  @override
  String get secHashIdTitle => 'আপনার Hash ID';

  @override
  String get secHashIdDesc =>
      'এটি আপনার অনন্য পরিচয়। এটি আপনার সম্পর্কে কিছুই প্রকাশ করে না: নাম নয়, নম্বর নয়, অবস্থান নয়। এটা একটি ছদ্মনাম যা আপনার আসল পরিচয়ের সাথে সংযুক্ত করা অসম্ভব।\n\nপরিচিতি যোগ করতে, আপনি আপনার Hash ID শেয়ার করেন বা QR কোড স্ক্যান করেন। ব্যস। কোনো সিঙ্ক্রোনাইজড ঠিকানা বই নেই, \"আপনার পরিচিত\" সুপারিশ নেই।';

  @override
  String get secDataLabel => 'ডেটা';

  @override
  String get secDataTitle => 'Hash কী জানে না';

  @override
  String get secDataSubtitle =>
      'আপনার ডেটা সুরক্ষিত করার সর্বোত্তম উপায় হলো সেগুলো সংগ্রহ না করা।';

  @override
  String get secNeverCollected => 'কখনো সংগ্রহ করা হয় না';

  @override
  String get secNeverItem1 => 'বার্তার বিষয়বস্তু';

  @override
  String get secNeverItem2 => 'পরিচিতি তালিকা';

  @override
  String get secNeverItem3 => 'ফোন নম্বর';

  @override
  String get secNeverItem4 => 'ইমেইল ঠিকানা';

  @override
  String get secNeverItem5 => 'IP ঠিকানা';

  @override
  String get secNeverItem6 => 'অবস্থান';

  @override
  String get secNeverItem7 => 'মেটাডেটা (কে কার সাথে কথা বলে)';

  @override
  String get secNeverItem8 => 'কল ইতিহাস';

  @override
  String get secNeverItem9 => 'ঠিকানা বই';

  @override
  String get secNeverItem10 => 'বিজ্ঞাপন শনাক্তকারী';

  @override
  String get secTempStored => 'অস্থায়ীভাবে সংরক্ষিত';

  @override
  String get secTempItem1 => 'বেনামী Hash ID (অনন্য শনাক্তকারী)';

  @override
  String get secTempItem2 => 'পাবলিক এনক্রিপশন কী';

  @override
  String get secTempItem3 => 'ট্রানজিটে এনক্রিপ্টেড বার্তা (সর্বোচ্চ ২৪ ঘণ্টা)';

  @override
  String get secTempNote =>
      'এই ন্যূনতম ডেটাও আপনাকে শনাক্ত করতে পারে না। আপনার Hash ID কোনো ব্যক্তিগত তথ্যের সাথে সংযুক্ত নয়।';

  @override
  String get secFooterTitle => 'আপনার গোপনীয়তা, আপনার স্বাধীনতা';

  @override
  String get secFooterDesc =>
      'Hash সবচেয়ে চাহিদাবহুল পেশাদার অ্যাপ্লিকেশনের মতো একই এনক্রিপশন প্রযুক্তি ব্যবহার করে। আপনার বার্তা গণিত দিয়ে সুরক্ষিত, প্রতিশ্রুতি দিয়ে নয়।';

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
