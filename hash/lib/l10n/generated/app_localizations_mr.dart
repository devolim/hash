// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'कोणताही मागोवा नाही. कोणतीही तडजोड नाही.';

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
  String get conversations => 'चॅट्स';

  @override
  String get contacts => 'संपर्क';

  @override
  String get noConversation => 'चॅट नाहीत';

  @override
  String get noConversationSubtitle =>
      'सुरक्षितपणे गप्पा मारण्यासाठी संपर्क जोडा';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count प्रलंबित विनंत्या',
      one: '1 प्रलंबित विनंती',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पाठवलेल्या विनंत्या प्रलंबित',
      one: '1 पाठवलेली विनंती प्रलंबित',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'संपर्क जोडा';

  @override
  String get shareApp => 'अॅप शेअर करा';

  @override
  String get newMessage => 'नवीन संदेश';

  @override
  String get newConversation => 'संदेश पाठवा';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get myHashId => 'माझा Hash ID';

  @override
  String get supportHash => 'Hash ला सहाय्य करा';

  @override
  String get supportHashSubtitle => 'Hash हा ना-नफा प्रकल्प आहे';

  @override
  String get donate => 'देणगी द्या';

  @override
  String get appearance => 'दिसावट';

  @override
  String get theme => 'थीम';

  @override
  String get themeAuto => 'स्वयंचलित';

  @override
  String get themeAutoSubtitle => 'सिस्टम सेटिंग्ज फॉलो करते';

  @override
  String get themeDark => 'गडद';

  @override
  String get themeLight => 'उजळ';

  @override
  String get themeRecommendation =>
      'अधिक गोपनीयतेसाठी गडद थीम शिफारस केली जाते';

  @override
  String get language => 'भाषा';

  @override
  String get languageAuto => 'स्वयंचलित (सिस्टम)';

  @override
  String get notifications => 'सूचना';

  @override
  String get messages => 'संदेश';

  @override
  String get calls => 'कॉल्स';

  @override
  String get vibration => 'कंपन';

  @override
  String get notificationContent => 'सूचना सामग्री';

  @override
  String get notificationContentFull => 'सर्व दाखवा';

  @override
  String get notificationContentFullDesc =>
      'संपर्काचे नाव आणि संदेश पूर्वावलोकन';

  @override
  String get notificationContentName => 'फक्त नाव';

  @override
  String get notificationContentNameDesc => 'फक्त संपर्काचे नाव दाखवते';

  @override
  String get notificationContentDiscrete => 'गुप्त';

  @override
  String get notificationContentDiscreteDesc => 'फक्त \"नवीन संदेश\" दाखवते';

  @override
  String get security => 'सुरक्षा';

  @override
  String get howHashProtectsYou => 'Hash तुमचे संरक्षण कसे करते';

  @override
  String get howHashProtectsYouSubtitle => 'तुमची सुरक्षा समजून घ्या';

  @override
  String get accountSecurity => 'खाते सुरक्षा';

  @override
  String get accountSecuritySubtitle => 'PIN, बायोमेट्रिक्स, Vash मोड';

  @override
  String get blockScreenshots => 'स्क्रीनशॉट ब्लॉक करा';

  @override
  String get transferDevice => 'दुसऱ्या डिव्हाइसवर हस्तांतरित करा';

  @override
  String get transferDeviceSubtitle => 'तुमचे खाते स्थलांतरित करा';

  @override
  String get pinCode => 'PIN कोड';

  @override
  String get changePin => 'PIN कोड बदला';

  @override
  String get currentPin => 'सध्याचा PIN कोड';

  @override
  String get newPin => 'नवीन PIN कोड';

  @override
  String get confirmPin => 'PIN कोड पुष्टी करा';

  @override
  String get pinChanged => 'PIN कोड बदलला';

  @override
  String get incorrectPin => 'चुकीचा PIN';

  @override
  String get pinsDoNotMatch => 'PIN जुळत नाहीत';

  @override
  String get autoLock => 'स्वयं-लॉक';

  @override
  String get autoLockDelay => 'लॉक विलंब';

  @override
  String get autoLockImmediate => 'तात्काळ';

  @override
  String get autoLockMinute => '1 मिनिट';

  @override
  String autoLockMinutes(int count) {
    return '$count मिनिटे';
  }

  @override
  String get vashCode => 'Vash कोड';

  @override
  String get vashModeTitle => 'Vash मोड';

  @override
  String get vashModeExplanation => 'तुमचे अंतिम सुरक्षा जाळे.';

  @override
  String get vashModeDescription =>
      'तुम्ही दुसरा PIN कोड निवडाल. जर तुम्हाला कधी Hash उघडण्यास भाग पाडले गेले, तर तुमच्या नियमित PIN ऐवजी हा कोड टाका.\n\nअॅप सामान्यपणे उघडेल, पण तुमचे सर्व संभाषणे आणि संपर्क गायब होतील.\n\nतुमची स्क्रीन पाहणाऱ्या कोणालाही Hash फक्त रिकामे दिसते — जसे की तुम्ही ते कधी वापरलेच नाही.';

  @override
  String get vashModeIrreversible => 'ही क्रिया शांत आणि अपरिवर्तनीय आहे.';

  @override
  String get chooseVashCode => 'माझा Vash कोड निवडा';

  @override
  String get vashCodeInfo =>
      'एक दुसरा PIN कोड जो अॅप सामान्यपणे उघडतो, पण रिकामा.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'जर तुम्ही तुमच्या PIN ऐवजी हा कोड टाकलात:';

  @override
  String get vashDeleteContacts => 'तुमचे संपर्क गायब होतात';

  @override
  String get vashDeleteMessages => 'तुमची संभाषणे गायब होतात';

  @override
  String get vashDeleteHistory => 'तुमच्या नोट्स गायब होतात';

  @override
  String get vashKeepId => 'तुमची Hash ओळख (#XXX-XXX-XXX) तशीच राहते';

  @override
  String get vashAppearNormal =>
      'अॅप सामान्य पण रिकामे दिसते, नवीन सारखे. ही क्रिया अपरिवर्तनीय आहे.';

  @override
  String get setupVashCode => 'Vash कोड सेट करा';

  @override
  String get modifyVashCode => 'Vash कोड बदला';

  @override
  String get currentVashCode => 'सध्याचा Vash कोड';

  @override
  String get newVashCode => 'नवीन Vash कोड';

  @override
  String get confirmVashCode => 'Vash कोड पुष्टी करा';

  @override
  String get vashCodeConfigured => 'Vash कोड कॉन्फिगर केला';

  @override
  String get vashCodeModified => 'Vash कोड बदलला';

  @override
  String get vashCodeMustDiffer => 'Vash कोड PIN पेक्षा वेगळा असणे आवश्यक आहे';

  @override
  String get incorrectVashCode => 'चुकीचा Vash कोड';

  @override
  String get vashWhatToDelete => 'Vash मोडने काय गायब करावे?';

  @override
  String get vashDeleteContactsOption => 'संपर्क';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'संदेश';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'नोट्स';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash मोड सक्रिय';

  @override
  String get vashCreateSubtitle => 'तुमच्या मुख्य PIN पेक्षा वेगळा कोड निवडा';

  @override
  String get vashConfirmSubtitle => 'तुमचा Vash कोड पुष्टी करा';

  @override
  String get pinCodeForEntry => 'अॅपमध्ये प्रवेशासाठी PIN कोड';

  @override
  String get vashCodeSection => 'Vash मोड';

  @override
  String get biometric => 'बायोमेट्रिक';

  @override
  String get biometricUnlock => 'फिंगरप्रिंट किंवा Face ID ने अनलॉक करा';

  @override
  String get enableBiometric => 'बायोमेट्रिक सक्रिय करा';

  @override
  String get biometricWarningMessage =>
      'बायोमेट्रिक सक्रिय केल्यास, तुम्ही अॅपमध्ये प्रवेश करण्यासाठी तुमचा Vash कोड वापरू शकणार नाही.\n\nबायोमेट्रिक अयशस्वी झाल्यावरच (अनेक अयशस्वी प्रयत्नांनंतर) तुम्ही Vash कोड वापरू शकता.\n\nतुम्हाला पुढे जायचे आहे का?';

  @override
  String get understood => 'मला समजले';

  @override
  String get shareAppSubtitle => 'Hash तुमच्या जवळच्यांसोबत शेअर करा';

  @override
  String get share => 'शेअर करा';

  @override
  String get danger => 'धोका';

  @override
  String get deleteAccount => 'माझे खाते हटवा';

  @override
  String get deleteAccountSubtitle => 'अपरिवर्तनीय क्रिया';

  @override
  String get deleteAccountConfirmTitle => 'माझे खाते हटवा';

  @override
  String get deleteAccountConfirmMessage =>
      'तुमचे खाते कायमचे हटवले जाईल. ही क्रिया अपरिवर्तनीय आहे.\n\n• तुमचे सर्व चॅट्स\n• तुमचे सर्व संपर्क\n• तुमचा Hash ID\n\nतुम्हाला नवीन खाते तयार करावे लागेल.';

  @override
  String get deleteForever => 'कायमचे हटवा';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash मोड सक्रिय.';

  @override
  String deletionError(String error) {
    return 'हटवण्यात त्रुटी: $error';
  }

  @override
  String get yourSecurity => 'तुमची सुरक्षा';

  @override
  String get securityInfo =>
      '• एंड-टू-एंड एन्क्रिप्शन (Signal Protocol)\n• डिलिव्हरीनंतर आमच्या सर्व्हरवर कोणताही डेटा नाही\n• की फक्त तुमच्या डिव्हाइसवर साठवल्या जातात\n• PIN कोड कधीही सर्व्हरला पाठवला जात नाही';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'स्वागत आहे';

  @override
  String get securityStatement1 => 'तुमचे संदेश संरक्षित आहेत.';

  @override
  String get securityStatement2 => 'एंड-टू-एंड एन्क्रिप्शन.';

  @override
  String get securityStatement3 => 'कोणताही मागोवा नाही. कोणतीही तडजोड नाही.';

  @override
  String get securityStatement4 => 'तुमची गोपनीयता हा अधिकार आहे.';

  @override
  String get accessBlocked => 'प्रवेश अवरोधित';

  @override
  String get tooManyAttempts => 'खूप जास्त प्रयत्न. नंतर पुन्हा प्रयत्न करा.';

  @override
  String get pleaseWait => 'कृपया प्रतीक्षा करा';

  @override
  String get waitDelay => 'कृपया विलंब संपण्याची वाट पहा';

  @override
  String attemptCount(int current, int max) {
    return 'प्रयत्न $current पैकी $max';
  }

  @override
  String retryIn(String time) {
    return '$time मध्ये पुन्हा प्रयत्न करा';
  }

  @override
  String get forgotPin => 'PIN विसरलात? रिकव्हरी वाक्यांश वापरा';

  @override
  String get useRecoveryPhrase => 'रिकव्हरी वाक्यांश वापरा';

  @override
  String get recoveryWarningTitle => 'चेतावणी';

  @override
  String get recoveryWarningMessage => 'खाते रिकव्हरी हे करेल:';

  @override
  String get recoveryDeleteAllMessages => 'तुमचे सर्व संदेश हटवा';

  @override
  String get recoveryWaitDelay => '1 तासाचा विलंब आवश्यक';

  @override
  String get recoveryKeepContacts => 'तुमचे संपर्क ठेवा';

  @override
  String get recoveryIrreversible =>
      'ही क्रिया अपरिवर्तनीय आहे. तुमचे संदेश कायमचे गमावले जातील.';

  @override
  String get iUnderstand => 'मला समजले';

  @override
  String get accountRecovery => 'खाते रिकव्हरी';

  @override
  String get enterRecoveryPhrase =>
      'तुमच्या रिकव्हरी वाक्यांशाचे 24 शब्द स्पेसने विभक्त करून टाका.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'रिकव्हर करा';

  @override
  String get recoveryPhraseRequired => 'कृपया तुमचा रिकव्हरी वाक्यांश टाका';

  @override
  String get recoveryPhrase24Words =>
      'वाक्यांशात नेमके 24 शब्द असणे आवश्यक आहे';

  @override
  String get incorrectRecoveryPhrase => 'चुकीचा रिकव्हरी वाक्यांश';

  @override
  String get recoveryInitError => 'रिकव्हरी सुरू करताना त्रुटी';

  @override
  String get securityDelay => 'सुरक्षा विलंब';

  @override
  String get securityDelayMessage =>
      'तुमच्या सुरक्षेसाठी, नवीन PIN तयार करण्यापूर्वी प्रतीक्षा कालावधी आवश्यक आहे.';

  @override
  String get timeRemaining => 'उर्वरित वेळ';

  @override
  String get messagesDeletedForProtection =>
      'तुमच्या संरक्षणासाठी तुमचे संदेश हटवले गेले आहेत.';

  @override
  String get canCloseApp => 'तुम्ही अॅप बंद करू शकता आणि नंतर परत येऊ शकता.';

  @override
  String get onboardingTitle1 => 'Hash मध्ये स्वागत आहे';

  @override
  String get onboardingSubtitle1 => 'कोणताही मागोवा न ठेवणारा मेसेंजर';

  @override
  String get onboardingTitle2 => 'संपूर्ण एन्क्रिप्शन';

  @override
  String get onboardingSubtitle2 =>
      'तुमचे संदेश Signal प्रोटोकॉलने एंड-टू-एंड एन्क्रिप्टेड आहेत';

  @override
  String get onboardingTitle3 => 'कोणताही मागोवा नाही';

  @override
  String get onboardingSubtitle3 =>
      'डिलिव्हरीनंतर सर्व्हरवरून संदेश हटवले जातात';

  @override
  String get onboardingTitle4 => 'तुमची सुरक्षा';

  @override
  String get onboardingSubtitle4 => 'PIN कोड, Vash मोड आणि रिकव्हरी वाक्यांश';

  @override
  String get getStarted => 'सुरू करा';

  @override
  String get next => 'पुढे';

  @override
  String get skip => 'वगळा';

  @override
  String get alreadyHaveAccount => 'माझ्याकडे आधीच खाते आहे';

  @override
  String get transferMyAccount => 'माझे खाते हस्तांतरित करा';

  @override
  String get createPin => 'PIN कोड तयार करा';

  @override
  String get createPinSubtitle =>
      'हा कोड तुमच्या अॅपच्या प्रवेशाचे संरक्षण करेल';

  @override
  String get confirmYourPin => 'तुमचा PIN कोड पुष्टी करा';

  @override
  String get confirmPinSubtitle => 'तुमचा PIN कोड पुन्हा टाका';

  @override
  String get saveRecoveryPhrase => 'रिकव्हरी वाक्यांश';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'हे 24 शब्द क्रमाने लिहून ठेवा. तुम्ही तुमचा PIN विसरलात तर ते तुम्हाला खाते रिकव्हर करण्यास मदत करतील.';

  @override
  String get phraseWritten => 'मी माझा वाक्यांश लिहून ठेवला आहे';

  @override
  String get warningRecoveryPhrase =>
      'जर तुम्ही हा वाक्यांश गमावलात आणि तुमचा PIN विसरलात, तर तुम्ही तुमच्या खात्याचा प्रवेश गमावाल.';

  @override
  String get accountTransferred => 'खाते हस्तांतरित';

  @override
  String get accountTransferredMessage =>
      'तुमचे खाते दुसऱ्या डिव्हाइसवर हस्तांतरित केले गेले आहे. हे सत्र आता वैध नाही.';

  @override
  String get accountTransferredInfo =>
      'जर तुम्ही हे हस्तांतरण सुरू केले नसेल, तर तुमचे खाते तडजोड झाले असू शकते.';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get transferAccount => 'खाते हस्तांतरित करा';

  @override
  String get transferAccountInfo =>
      'तुमचे Hash खाते नवीन डिव्हाइसवर हस्तांतरित करा. तुमचे सध्याचे सत्र अवैध होईल.';

  @override
  String get generateTransferCode => 'हस्तांतरण कोड तयार करा';

  @override
  String get transferCode => 'हस्तांतरण कोड';

  @override
  String transferCodeExpires(int minutes) {
    return 'हा कोड $minutes मिनिटांत कालबाह्य होईल';
  }

  @override
  String get enterCodeOnNewDevice =>
      'तुमचे खाते हस्तांतरित करण्यासाठी हा कोड तुमच्या नवीन डिव्हाइसवर टाका.';

  @override
  String get generateNewCode => 'नवीन कोड तयार करा';

  @override
  String get scanQrCode => 'QR कोड स्कॅन करा';

  @override
  String get scanQrCodeSubtitle => 'संपर्क जोडण्यासाठी त्याचा QR कोड स्कॅन करा';

  @override
  String get qrCodeDetected => 'QR कोड आढळला';

  @override
  String get invalidQrCode => 'अवैध QR कोड';

  @override
  String get cameraPermissionRequired => 'कॅमेरा परवानगी आवश्यक';

  @override
  String get myQrCode => 'माझा QR कोड';

  @override
  String get myQrCodeSubtitle =>
      'तुमचे संपर्क तुम्हाला जोडू शकतील यासाठी हा QR कोड शेअर करा';

  @override
  String get shareQrCode => 'शेअर करा';

  @override
  String get addContactTitle => 'संपर्क जोडा';

  @override
  String get addContactByHashId => 'तुमच्या संपर्काचा Hash ID टाका';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'शोधा';

  @override
  String get contactNotFound => 'संपर्क सापडला नाही';

  @override
  String get contactAlreadyAdded => 'हा संपर्क आधीच तुमच्या यादीत आहे';

  @override
  String get contactAdded => 'संपर्क जोडला';

  @override
  String get myProfile => 'माझे प्रोफाइल';

  @override
  String get myProfileSubtitle =>
      'इतरांना तुम्हाला जोडता यावे म्हणून ही माहिती शेअर करा';

  @override
  String get temporaryCode => 'तात्पुरता कोड';

  @override
  String temporaryCodeExpires(String time) {
    return '$time मध्ये कालबाह्य होतो';
  }

  @override
  String get codeExpired => 'कोड कालबाह्य झाला';

  @override
  String get generateNewCodeButton => 'नवीन कोड';

  @override
  String get copyHashId => 'ID कॉपी करा';

  @override
  String get copyCode => 'कोड कॉपी करा';

  @override
  String get copiedToClipboard => 'कॉपी केले';

  @override
  String get showMyQrCode => 'माझा QR कोड दाखवा';

  @override
  String get orDivider => 'किंवा';

  @override
  String get openScanner => 'स्कॅनर उघडा';

  @override
  String get addManually => 'स्वतः जोडा';

  @override
  String get contactHashIdLabel => 'संपर्काचा Hash ID';

  @override
  String get temporaryCodeLabel => 'तात्पुरता कोड';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'तुमच्या संपर्काला त्याच्या प्रोफाइलमधून कोड तयार करण्यास सांगा';

  @override
  String get verifyAndAdd => 'सत्यापित करा आणि जोडा';

  @override
  String get fillAllFields => 'कृपया सर्व फील्ड भरा';

  @override
  String get invalidHashIdFormat => 'अवैध ID स्वरूप (उदा.: 123-456-ABC)';

  @override
  String get userNotFound => 'वापरकर्ता सापडला नाही';

  @override
  String get cannotAddYourself => 'तुम्ही स्वतःला जोडू शकत नाही';

  @override
  String get invalidOrExpiredCode => 'अवैध किंवा कालबाह्य तात्पुरता कोड';

  @override
  String get contactFound => 'संपर्क सापडला!';

  @override
  String get howToCallContact => 'तुम्हाला त्यांना काय नाव द्यायचे आहे?';

  @override
  String get contactNameHint => 'संपर्काचे नाव';

  @override
  String get addContactButton => 'जोडा';

  @override
  String get contactDetails => 'संपर्क तपशील';

  @override
  String get contactName => 'संपर्काचे नाव';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date रोजी जोडले';
  }

  @override
  String get deleteContact => 'संपर्क हटवा';

  @override
  String deleteContactConfirm(Object name) {
    return 'हा संपर्क हटवायचा?';
  }

  @override
  String get deleteContactMessage => 'यामुळे संपूर्ण चॅट देखील हटवला जाईल.';

  @override
  String get delete => 'हटवा';

  @override
  String get typeMessage => 'संदेश टाइप करा...';

  @override
  String get messageSent => 'पाठवला';

  @override
  String get messageDelivered => 'डिलिव्हर झाला';

  @override
  String get messageRead => 'वाचला';

  @override
  String get messageFailed => 'पाठवण्यात अयशस्वी';

  @override
  String get now => 'आता';

  @override
  String minutesAgo(int count) {
    return '$countमि';
  }

  @override
  String hoursAgo(int count) {
    return '$countता';
  }

  @override
  String daysAgo(int count) {
    return '$countदि';
  }

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'काल';

  @override
  String dateAtTime(String date, String time) {
    return '$date वाजता $time';
  }

  @override
  String get shareMessage =>
      'Hash वर माझ्यासोबत सामील व्हा! 🔒\n\nहा खरोखरच खाजगी मेसेंजर आहे: संपूर्ण एन्क्रिप्शन, सर्व्हरवर कोणताही मागोवा नाही, आणि आवश्यक असल्यास पॅनिक मोड.\n\nअॅप येथे डाउनलोड करा 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'त्रुटी';

  @override
  String get ok => 'ठीक आहे';

  @override
  String get view => 'पहा';

  @override
  String get yes => 'होय';

  @override
  String get no => 'नाही';

  @override
  String get save => 'जतन करा';

  @override
  String get edit => 'संपादित करा';

  @override
  String get close => 'बंद करा';

  @override
  String get confirm => 'पुष्टी करा';

  @override
  String get loading => 'लोड होत आहे...';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'प्रलंबित विनंत्या';

  @override
  String get noPendingRequests => 'प्रलंबित विनंत्या नाहीत';

  @override
  String get pendingRequestsSubtitle => 'या लोकांना तुम्हाला जोडायचे आहे';

  @override
  String requestFromUser(String hashId) {
    return '$hashId कडून विनंती';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days दिवसांत कालबाह्य होते';
  }

  @override
  String get acceptRequest => 'स्वीकारा';

  @override
  String get rejectRequest => 'नकार द्या';

  @override
  String get requestAccepted => 'विनंती स्वीकारली';

  @override
  String get requestRejected => 'विनंती नाकारली';

  @override
  String get requestSent => 'विनंती पाठवली!';

  @override
  String get requestSentSubtitle =>
      'तुमची विनंती पाठवली गेली आहे. तुम्ही गप्पा मारण्यापूर्वी वापरकर्त्याने ती स्वीकारणे आवश्यक आहे.';

  @override
  String get requestAlreadyPending => 'एक विनंती आधीच प्रलंबित आहे';

  @override
  String get requestAlreadySentByOther =>
      'या व्यक्तीने तुम्हाला आधीच विनंती पाठवली आहे';

  @override
  String get addByHashId => 'Hash ID ने जोडा';

  @override
  String get addByHashIdSubtitle => 'संपर्काचा Hash ID आणि तात्पुरता कोड टाका';

  @override
  String get enterTemporaryCode => '6-अंकी कोड टाका';

  @override
  String get sendRequest => 'विनंती पाठवा';

  @override
  String get acceptContactTitle => 'संपर्क स्वीकारा';

  @override
  String get acceptContactSubtitle => 'तुम्ही त्यांना सानुकूल नाव देऊ शकता';

  @override
  String get leaveEmptyForHashId => 'Hash ID वापरण्यासाठी रिकामे ठेवा';

  @override
  String get firstName => 'पहिले नाव';

  @override
  String get lastName => 'आडनाव';

  @override
  String get notes => 'नोट्स';

  @override
  String get notesHint => 'या संपर्काबद्दल वैयक्तिक नोट्स';

  @override
  String get photoOptional => 'फोटो (ऐच्छिक)';

  @override
  String get contactNameOptional => 'नाव (ऐच्छिक)';

  @override
  String get notesOptional => 'नोट्स (ऐच्छिक)';

  @override
  String get storedLocally => 'फक्त तुमच्या डिव्हाइसवर साठवले';

  @override
  String get encryptedMessageLabel => 'एन्क्रिप्टेड संदेश';

  @override
  String get identityMessageHint =>
      'तुम्ही कोण आहात? तुम्ही एकमेकांना कसे ओळखता?';

  @override
  String get messageWillBeSentEncrypted =>
      'हा संदेश एन्क्रिप्ट केला जाईल आणि प्राप्तकर्त्याला पाठवला जाईल';

  @override
  String get sendRequestButton => 'विनंती पाठवा';

  @override
  String get requestExpiresIn24h =>
      'स्वीकारली नाही तर विनंती 24 तासांत कालबाह्य होते';

  @override
  String get theyAlreadySentYouRequest =>
      'या व्यक्तीने तुम्हाला आधीच विनंती पाठवली आहे';

  @override
  String get requests => 'विनंत्या';

  @override
  String get receivedRequests => 'प्राप्त';

  @override
  String get sentRequests => 'पाठवलेल्या';

  @override
  String get noSentRequests => 'पाठवलेल्या विनंत्या नाहीत';

  @override
  String get cancelRequest => 'रद्द करा';

  @override
  String get deleteRequest => 'विनंती हटवा';

  @override
  String get requestCancelled => 'विनंती रद्द केली';

  @override
  String sentTo(String hashId) {
    return '$hashId ला पाठवली';
  }

  @override
  String expiresIn(String time) {
    return '$time मध्ये कालबाह्य';
  }

  @override
  String receivedAgo(String time) {
    return '$time पूर्वी प्राप्त';
  }

  @override
  String get messageFromRequester => 'विनंतीकर्त्याचा संदेश';

  @override
  String get copy => 'कॉपी करा';

  @override
  String get messageInfo => 'संदेश माहिती';

  @override
  String get messageDirection => 'दिशा';

  @override
  String get messageSentByYou => 'तुम्ही पाठवले';

  @override
  String get messageReceived => 'प्राप्त';

  @override
  String get messageSentAt => 'पाठवण्याची वेळ';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'स्थिती';

  @override
  String get messageReadAt => 'वाचण्याची वेळ';

  @override
  String get messageType => 'प्रकार';

  @override
  String get messageSize => 'आकार';

  @override
  String get messageExpiresAt => 'कालबाह्य वेळ';

  @override
  String get messageEncrypted => 'एंड-टू-एंड एन्क्रिप्टेड';

  @override
  String get messageStatusSending => 'पाठवत आहे...';

  @override
  String get messageStatusSent => 'पाठवला';

  @override
  String get messageStatusDelivered => 'डिलिव्हर झाला';

  @override
  String get messageStatusRead => 'वाचला';

  @override
  String get messageStatusFailed => 'अयशस्वी';

  @override
  String get serverStatus => 'सर्व्हर';

  @override
  String get onServer => 'डिलिव्हरी प्रलंबित';

  @override
  String get deletedFromServer => 'हटवला';

  @override
  String get messageTypeText => 'मजकूर';

  @override
  String get messageTypeImage => 'प्रतिमा';

  @override
  String get messageTypeVideo => 'व्हिडिओ';

  @override
  String get messageTypeVoice => 'व्हॉइस';

  @override
  String get messageTypeFile => 'फाइल';

  @override
  String get indefinitely => 'अनिश्चित काळ';

  @override
  String get hoursShort => 'ता';

  @override
  String get minutesShort => 'मि';

  @override
  String get hours => 'तास';

  @override
  String get minutes => 'मिनिटे';

  @override
  String get seconds => 'सेकंद';

  @override
  String get ephemeralMessages => 'तात्पुरते संदेश';

  @override
  String get ephemeralMessagesDescription =>
      'या वेळेनंतर संदेश आपोआप हटवले जातात';

  @override
  String get ephemeralImmediate => 'तात्काळ (वाचल्यानंतर)';

  @override
  String get ephemeralImmediateDesc => 'वाचताच हटवले';

  @override
  String get ephemeralMyPreference => 'माझी प्राधान्ये';

  @override
  String get ephemeralMyPreferenceDesc => 'जागतिक सेटिंग वापरा';

  @override
  String get ephemeralDefaultSetting => 'संदेश कालावधी';

  @override
  String get ephemeralChooseDefault => 'शिफारस केलेले';

  @override
  String get ephemeral30Seconds => '30 सेकंद';

  @override
  String get ephemeral30SecondsDesc => 'वाचल्यानंतर 30 सेकंदात हटवले';

  @override
  String get ephemeral5Minutes => '5 मिनिटे';

  @override
  String get ephemeral5MinutesDesc => 'वाचल्यानंतर 5 मिनिटांत हटवले';

  @override
  String get ephemeral1Hour => '1 तास';

  @override
  String get ephemeral1HourDesc => 'वाचल्यानंतर 1 तासात हटवले';

  @override
  String get ephemeral3Hours => '3 तास';

  @override
  String get ephemeral6Hours => '6 तास';

  @override
  String get ephemeral6HoursDesc => 'वाचल्यानंतर 6 तासांत हटवले';

  @override
  String get ephemeral12Hours => '12 तास';

  @override
  String get ephemeral24Hours => '24 तास';

  @override
  String get ephemeral24HoursDesc => 'वाचल्यानंतर 24 तासांत हटवले';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'सानुकूल कालावधी';

  @override
  String get howItWorks => 'हे कसे काम करते';

  @override
  String get ephemeralExplanation1 =>
      'प्राप्त होताच सर्व्हरवरून संदेश हटवले जातात.';

  @override
  String get ephemeralExplanation2 =>
      'हे सेटिंग वाचल्यानंतर तुमच्या फोनवरून संदेश कधी गायब होतात ते ठरवते.';

  @override
  String get ephemeralExplanation3 =>
      'तुमच्या संपर्काकडे त्यांच्या फोनसाठी स्वतःचे सेटिंग आहे.';

  @override
  String get mute1Hour => '1 तास';

  @override
  String get mute8Hours => '8 तास';

  @override
  String get mute1Day => '1 दिवस';

  @override
  String get mute1Week => '1 आठवडा';

  @override
  String get muteAlways => 'नेहमी';

  @override
  String get muteExplanation => 'या संपर्कासाठी तुम्हाला सूचना मिळणार नाहीत';

  @override
  String get showCallsInRecents => 'अलीकडील कॉल्समध्ये दाखवा';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash कॉल्स फोनच्या कॉल इतिहासात दिसतात';

  @override
  String get feedback => 'अभिप्राय';

  @override
  String get muteNotifications => 'सूचना बंद करा';

  @override
  String get muteDescription => 'या संपर्कासाठी तुम्हाला सूचना मिळणार नाहीत';

  @override
  String mutedUntil(String time) {
    return '$time पर्यंत शांत';
  }

  @override
  String get notMuted => 'सूचना सक्रिय';

  @override
  String get unmute => 'अनम्यूट करा';

  @override
  String get notificationSound => 'सूचना ध्वनी';

  @override
  String get defaultSound => 'डिफॉल्ट';

  @override
  String get chatSettings => 'चॅट सेटिंग्ज';

  @override
  String get bubbleColor => 'बबल रंग';

  @override
  String get backgroundColor => 'पार्श्वभूमी रंग';

  @override
  String get backgroundImage => 'पार्श्वभूमी प्रतिमा';

  @override
  String get chatBackground => 'चॅट पार्श्वभूमी';

  @override
  String get customColor => 'सानुकूल';

  @override
  String get defaultColor => 'डिफॉल्ट';

  @override
  String get imageSelected => 'प्रतिमा निवडली';

  @override
  String get noImage => 'प्रतिमा नाही';

  @override
  String get color => 'रंग';

  @override
  String get image => 'प्रतिमा';

  @override
  String get tapToSelectImage => 'प्रतिमा निवडण्यासाठी टॅप करा';

  @override
  String get changeImage => 'प्रतिमा बदला';

  @override
  String get previewMessageReceived => 'नमस्कार!';

  @override
  String get previewMessageSent => 'कसे आहात!';

  @override
  String get messageAction => 'संदेश';

  @override
  String get callAction => 'कॉल';

  @override
  String get videoAction => 'व्हिडिओ';

  @override
  String get personalNotes => 'वैयक्तिक नोट्स';

  @override
  String get addNotes => 'नोट्स जोडा...';

  @override
  String get noNotes => 'नोट्स नाहीत';

  @override
  String get messageNotifications => 'संदेश सूचना';

  @override
  String get callNotifications => 'कॉल सूचना';

  @override
  String get useGradient => 'ग्रेडिएंट वापरा';

  @override
  String get gradientStart => 'सुरुवातीचा रंग';

  @override
  String get gradientEnd => 'शेवटचा रंग';

  @override
  String get preview => 'पूर्वावलोकन';

  @override
  String get reset => 'रीसेट करा';

  @override
  String get securityNumber => 'सुरक्षा क्रमांक';

  @override
  String securityNumberDescription(String name) {
    return 'सुरक्षा क्रमांक $name च्या डिव्हाइसशी जुळतो का ते सत्यापित करा';
  }

  @override
  String get verifyEncryption => 'एंड-टू-एंड एन्क्रिप्शन सत्यापित करा';

  @override
  String get tapToCopy => 'कॉपी करण्यासाठी टॅप करा';

  @override
  String get howToVerify => 'सत्यापन कसे करावे';

  @override
  String get verifyStep1 => 'तुमच्या संपर्काला प्रत्यक्ष भेटा किंवा कॉल करा';

  @override
  String get verifyStep2 =>
      'सुरक्षा क्रमांकांची तुलना करा किंवा QR कोड स्कॅन करा';

  @override
  String get verifyStep3 => 'जर ते जुळले, तर तुमचा चॅट सुरक्षित आहे';

  @override
  String get scanToVerify => 'सत्यापनासाठी स्कॅन करा';

  @override
  String get reportSpam => 'स्पॅम रिपोर्ट करा';

  @override
  String get reportSpamSubtitle => 'या संपर्काला स्पॅम म्हणून रिपोर्ट करा';

  @override
  String get reportSpamDescription =>
      'हा संपर्क निनावीपणे रिपोर्ट केला जाईल. तुमची ओळख शेअर केली जाणार नाही. तुम्हाला खात्री आहे का?';

  @override
  String get report => 'रिपोर्ट करा';

  @override
  String get spamReported => 'स्पॅम रिपोर्ट केला';

  @override
  String get reportError =>
      'रिपोर्ट पाठवण्यात अयशस्वी. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get reportRateLimited =>
      'तुम्ही आजच्या रिपोर्टची कमाल मर्यादा गाठली आहे.';

  @override
  String get blockContact => 'संपर्क ब्लॉक करा';

  @override
  String get blockContactDescription =>
      'हा संपर्क तुम्हाला संदेश पाठवू किंवा कॉल करू शकणार नाही. त्यांना सूचित केले जाणार नाही.';

  @override
  String get unblockContact => 'संपर्क अनब्लॉक करा';

  @override
  String get unblockContactDescription =>
      'हा संपर्क तुम्हाला पुन्हा संदेश पाठवू आणि कॉल करू शकेल.';

  @override
  String get contactBlocked => 'संपर्क ब्लॉक केला';

  @override
  String get contactUnblocked => 'संपर्क अनब्लॉक केला';

  @override
  String get contactIsBlocked => 'हा संपर्क ब्लॉक केला आहे';

  @override
  String get unblock => 'अनब्लॉक करा';

  @override
  String get deleteContactSubtitle => 'हा संपर्क आणि चॅट हटवा';

  @override
  String get confirmWithPin => 'PIN ने पुष्टी करा';

  @override
  String get enterPinToConfirm =>
      'या क्रियेची पुष्टी करण्यासाठी तुमचा PIN टाका';

  @override
  String get profilePhoto => 'प्रोफाइल फोटो';

  @override
  String get takePhoto => 'फोटो काढा';

  @override
  String get chooseFromGallery => 'गॅलरीतून निवडा';

  @override
  String get removePhoto => 'फोटो काढून टाका';

  @override
  String get viewContactHashId => 'संपर्काचा ओळखकर्ता पहा';

  @override
  String get hashIdPartiallyMasked =>
      'तुमच्या सुरक्षेसाठी आणि तुमच्या संपर्काच्या गोपनीयतेसाठी अंशतः मास्क केलेला';

  @override
  String get addFirstContact => 'तुमचा पहिला संपर्क जोडा';

  @override
  String get addFirstContactSubtitle =>
      'तुमचा QR कोड शेअर करा किंवा मित्राचा स्कॅन करा';

  @override
  String get directory => 'संपर्क सूची';

  @override
  String get noContacts => 'संपर्क नाहीत';

  @override
  String get noContactsSubtitle => 'सुरू करण्यासाठी संपर्क जोडा';

  @override
  String get sendMessageAction => 'संदेश पाठवा';

  @override
  String get audioCall => 'ऑडिओ कॉल';

  @override
  String get videoCall => 'व्हिडिओ कॉल';

  @override
  String get viewProfile => 'प्रोफाइल पहा';

  @override
  String get deleteContactDirectory => 'संपर्क हटवा';

  @override
  String get scanShort => 'स्कॅन';

  @override
  String get addShort => 'जोडा';

  @override
  String deleteContactConfirmName(String name) {
    return 'तुम्हाला खात्री आहे की तुम्ही $name हटवू इच्छिता?';
  }

  @override
  String get noNotesTitle => 'नोट्स नाहीत';

  @override
  String get noNotesSubtitle => 'तुमची पहिली नोट तयार करा';

  @override
  String get newNote => 'नवीन नोट';

  @override
  String get editNote => 'नोट संपादित करा';

  @override
  String get deleteNote => 'नोट हटवा';

  @override
  String get deleteNoteConfirm =>
      'तुम्हाला खात्री आहे की तुम्ही ही नोट हटवू इच्छिता?';

  @override
  String get noteTitle => 'शीर्षक';

  @override
  String get noteContent => 'सामग्री';

  @override
  String get addItem => 'आयटम जोडा';

  @override
  String get pinNote => 'पिन करा';

  @override
  String get unpinNote => 'अनपिन करा';

  @override
  String get noteColor => 'रंग';

  @override
  String get notePassword => 'पासवर्ड';

  @override
  String get setPassword => 'पासवर्ड सेट करा';

  @override
  String get changePassword => 'पासवर्ड बदला';

  @override
  String get removePassword => 'पासवर्ड काढून टाका';

  @override
  String get enterPassword => 'पासवर्ड टाका';

  @override
  String get confirmPassword => 'पासवर्ड पुष्टी करा';

  @override
  String get passwordPin => 'PIN कोड';

  @override
  String get passwordText => 'मजकूर पासवर्ड';

  @override
  String get protectedNote => 'संरक्षित नोट';

  @override
  String get incorrectPassword => 'चुकीचा पासवर्ड';

  @override
  String get passwordSet => 'पासवर्ड सेट केला';

  @override
  String get passwordRemoved => 'पासवर्ड काढून टाकला';

  @override
  String get notesBiometric => 'नोट्ससाठी Face ID';

  @override
  String get notesBiometricSubtitle =>
      'संरक्षित नोट्स उघडण्यासाठी बायोमेट्रिक प्रमाणीकरण आवश्यक';

  @override
  String get textNote => 'मजकूर नोट';

  @override
  String get checklistNote => 'चेकलिस्ट';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total कार्ये';
  }

  @override
  String get autoSaved => 'जतन केले';

  @override
  String get searchNotes => 'नोट्स शोधा';

  @override
  String get legalConsent => 'कायदेशीर संमती';

  @override
  String get confirmAge13 =>
      'मी पुष्टी करतो/करते की मी किमान 13 वर्षांचा/ची आहे';

  @override
  String get acceptLegalStart => 'मी स्वीकारतो/स्वीकारते ';

  @override
  String get privacyPolicy => 'गोपनीयता धोरण';

  @override
  String get termsOfService => 'सेवा अटी';

  @override
  String get andThe => ' आणि ';

  @override
  String get continueButton => 'पुढे जा';

  @override
  String get mustAcceptTerms =>
      'पुढे जाण्यासाठी तुम्ही दोन्ही अटी स्वीकारणे आवश्यक आहे';

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
  String get support => 'सहाय्य';

  @override
  String get contactSupport => 'सहाय्यासाठी संपर्क साधा';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'गैरवर्तन रिपोर्ट करा';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'कायदेशीर';

  @override
  String get legalEntity => 'कायदेशीर संस्था';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'पिन करा';

  @override
  String get unpinConversation => 'अनपिन करा';

  @override
  String get hideConversation => 'फीडमधून काढून टाका';

  @override
  String get deleteConversation => 'संभाषण हटवा';

  @override
  String get deleteConversationConfirm =>
      'सर्व संदेश हटवण्याची पुष्टी करण्यासाठी तुमचा PIN टाका';

  @override
  String get noConversations => 'अजून संभाषणे नाहीत';

  @override
  String get startConversation => 'सुरू करा';

  @override
  String get microphonePermissionRequired => 'मायक्रोफोन प्रवेश आवश्यक';

  @override
  String get microphonePermissionExplanation =>
      'कॉल करण्यासाठी Hash ला मायक्रोफोनची गरज आहे.';

  @override
  String get cameraPermissionExplanation =>
      'व्हिडिओ कॉलसाठी Hash ला कॅमेराची गरज आहे.';

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
  String get openSettings => 'सेटिंग्ज उघडा';

  @override
  String get callConnecting => 'जोडत आहे...';

  @override
  String get callRinging => 'रिंग होत आहे...';

  @override
  String get callReconnecting => 'पुन्हा जोडत आहे...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'पुन्हा जोडत आहे (${seconds}s)';
  }

  @override
  String get callPaused => 'थांबवले';

  @override
  String get callPausedSubtitle => 'कॉल अजूनही सक्रिय आहे';

  @override
  String get callRemoteMicMuted => 'संपर्काचा मायक्रोफोन बंद आहे';

  @override
  String get callMiniControlsMute => 'म्यूट करा';

  @override
  String get callMiniControlsUnmute => 'अनम्यूट करा';

  @override
  String get callMiniControlsHangUp => 'कट करा';

  @override
  String get callMiniControlsReturn => 'कॉलवर परत या';

  @override
  String get callNetworkPoor => 'अस्थिर कनेक्शन';

  @override
  String get callNetworkLost => 'कनेक्शन गमावले';

  @override
  String get callEndedTitle => 'कॉल संपला';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'डिव्हाइस डेटा';

  @override
  String get deviceDataSubtitle => 'स्थानिक आणि सर्व्हर स्टोरेज';

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
  String get localStorage => 'स्थानिक स्टोरेज';

  @override
  String get onThisDevice => 'या डिव्हाइसवर';

  @override
  String get encryptedDatabases => 'एन्क्रिप्टेड डेटाबेस';

  @override
  String get files => 'फाइल्स';

  @override
  String get secureKeychain => 'सुरक्षित कीचेन';

  @override
  String get cache => 'कॅशे';

  @override
  String get contactsDetail => 'नावे, अवतार, Signal की';

  @override
  String get messagesDetail => 'एन्क्रिप्टेड संभाषणे';

  @override
  String get notesDetail => 'वैयक्तिक नोट्स';

  @override
  String get signalSessions => 'Signal सत्रे';

  @override
  String get signalSessionsDetail => 'एन्क्रिप्शन सत्रे';

  @override
  String get pendingContacts => 'प्रलंबित संपर्क';

  @override
  String get pendingContactsDetail => 'प्रलंबित विनंत्या';

  @override
  String get callHistory => 'कॉल्स';

  @override
  String get callHistoryDetail => 'कॉल इतिहास';

  @override
  String get preferences => 'प्राधान्ये';

  @override
  String get preferencesDetail => 'मीडिया आणि कॉल प्राधान्ये';

  @override
  String get avatars => 'अवतार';

  @override
  String get media => 'मीडिया';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फाइल्स',
      one: '1 फाइल',
      zero: 'फाइल्स नाहीत',
    );
    return '$_temp0';
  }

  @override
  String get active => 'सक्रिय';

  @override
  String get notDefined => 'परिभाषित नाही';

  @override
  String get biometrics => 'बायोमेट्रिक्स';

  @override
  String get recoveryPhrase => 'रिकव्हरी वाक्यांश';

  @override
  String get identity => 'ओळख (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol की';

  @override
  String get authTokens => 'प्रमाणीकरण टोकन';

  @override
  String get contactNamesCache => 'संपर्क नावे कॅशे';

  @override
  String get remoteConfig => 'रिमोट कॉन्फिग';

  @override
  String get notificationPrefs => 'सूचना प्राधान्ये';

  @override
  String get serverData => 'सर्व्हर डेटा';

  @override
  String get serverDataInfo =>
      'Hash सर्व्हरवर किमान डेटा ठेवते, सर्व एन्क्रिप्टेड किंवा तात्पुरता.';

  @override
  String get serverProfile => 'प्रोफाइल';

  @override
  String get serverProfileDetail => 'Hash ID, सार्वजनिक की, मेलबॉक्स टोकन';

  @override
  String get serverPrekeys => 'प्री-की';

  @override
  String get serverPrekeysDetail => 'एकदा वापरायच्या Signal की (वापरलेल्या)';

  @override
  String get serverMessages => 'ट्रान्झिटमधील संदेश';

  @override
  String get serverMessagesDetail =>
      'डिलिव्हरीनंतर हटवले (जास्तीत जास्त 24 तास)';

  @override
  String get serverMedia => 'ट्रान्झिटमधील मीडिया';

  @override
  String get serverMediaDetail => 'डाउनलोडनंतर हटवले';

  @override
  String get serverContactRequests => 'संपर्क विनंत्या';

  @override
  String get serverContactRequestsDetail => '24 तासांनंतर कालबाह्य';

  @override
  String get serverRateLimits => 'दर मर्यादा';

  @override
  String get serverRateLimitsDetail => 'तात्पुरता गैरवापर-विरोधी डेटा';

  @override
  String get privacyReassurance =>
      'Hash तुमचे संदेश वाचू शकत नाही. सर्व डेटा एंड-टू-एंड एन्क्रिप्टेड आहे. सर्व्हर डेटा आपोआप हटवला जातो.';

  @override
  String get pinTooSimple => 'हा PIN खूप सोपा आहे. अधिक सुरक्षित कोड निवडा.';

  @override
  String get genericError => 'एक त्रुटी आली. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'खाते तयार करता आले नाही: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'वाक्यांश क्लिपबोर्डवर कॉपी केला';

  @override
  String get copyPhrase => 'वाक्यांश कॉपी करा';

  @override
  String get recoveryPhraseSecurityWarning =>
      'हा वाक्यांश सुरक्षित ठिकाणी लिहून ठेवा. जर तुम्ही या वाक्यांशाशिवाय तुमचा PIN गमावलात, तर तुम्ही तुमच्या डेटाचा प्रवेश कायमचा गमावाल.';

  @override
  String get noMessages => 'संदेश नाहीत';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name सोबतचे सर्व संदेश हटवायचे?';
  }

  @override
  String get confirmation => 'पुष्टी';

  @override
  String get untitled => 'शीर्षकहीन';

  @override
  String get noSessions => 'सत्रे नाहीत';

  @override
  String get unknownContact => 'अज्ञात संपर्क';

  @override
  String get unnamed => 'नावहीन';

  @override
  String get noPendingRequestsAlt => 'प्रलंबित विनंत्या नाहीत';

  @override
  String get deleteAllCallHistory => 'सर्व कॉल इतिहास हटवायचा?';

  @override
  String get noCalls => 'कॉल्स नाहीत';

  @override
  String get noPreferences => 'प्राधान्ये नाहीत';

  @override
  String get resetAllMediaPrefs => 'सर्व मीडिया प्राधान्ये रीसेट करायची?';

  @override
  String get deleteThisAvatar => 'हा अवतार हटवायचा?';

  @override
  String get deleteAllAvatars => 'सर्व अवतार हटवायचे?';

  @override
  String get noAvatars => 'अवतार नाहीत';

  @override
  String get deleteThisFile => 'ही फाइल हटवायची?';

  @override
  String get deleteAllMediaFiles => 'सर्व मीडिया हटवायचा?';

  @override
  String get noMediaFiles => 'मीडिया नाही';

  @override
  String get outgoing => 'बाहेर जाणारा';

  @override
  String get incoming => 'येणारा';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'तात्पुरते दृश्य: ${seconds}s';
  }

  @override
  String get normalView => 'सामान्य दृश्य';

  @override
  String get callReasonCompleted => 'पूर्ण';

  @override
  String get callReasonMissed => 'चुकलेला';

  @override
  String get callReasonDeclined => 'नकारलेला';

  @override
  String get callReasonFailed => 'अयशस्वी';

  @override
  String get justNow => 'आत्ताच';

  @override
  String timeAgoMinutes(int count) {
    return '$count मि पूर्वी';
  }

  @override
  String timeAgoHours(int count) {
    return '$countता पूर्वी';
  }

  @override
  String timeAgoDays(int count) {
    return '$countदि पूर्वी';
  }

  @override
  String get messageTypeContact => 'संपर्क';

  @override
  String get messageTypeLocation => 'स्थान';

  @override
  String get statusQueued => 'रांगेत';

  @override
  String get blockedBadge => 'ब्लॉक केलेला';

  @override
  String get protectedBadge => 'संरक्षित';

  @override
  String messageCount(int count) {
    return '$count संदेश';
  }

  @override
  String get deleteQuestion => 'हटवायचे?';

  @override
  String get transferMyAccountTitle => 'माझे खाते हस्तांतरित करा';

  @override
  String get loadingError => 'लोडिंग त्रुटी';

  @override
  String get transferToNewDevice => 'नवीन डिव्हाइसवर हस्तांतरित करा';

  @override
  String get transferInstructions =>
      'तुमच्या नवीन डिव्हाइसवर, \"माझे खाते रिकव्हर करा\" निवडा आणि ही माहिती टाका:';

  @override
  String get yourHashIdLabel => 'तुमचा Hash ID';

  @override
  String get enterYourPinCode => 'तुमचा PIN कोड टाका';

  @override
  String get pinOwnerConfirmation =>
      'तुम्ही या खात्याचे मालक आहात याची पुष्टी करण्यासाठी';

  @override
  String get scanThisQrCode => 'हा QR कोड स्कॅन करा';

  @override
  String get withYourNewDevice => 'तुमच्या नवीन डिव्हाइसने';

  @override
  String get orEnterTheCode => 'किंवा कोड टाका';

  @override
  String get transferCodeLabel => 'हस्तांतरण कोड';

  @override
  String get proximityVerification => 'सान्निध्य सत्यापन';

  @override
  String get bringDevicesCloser => 'दोन्ही डिव्हाइस जवळ आणा';

  @override
  String get confirmTransferQuestion => 'हस्तांतरणाची पुष्टी करायची?';

  @override
  String get accountWillBeTransferred =>
      'तुमचे खाते नवीन डिव्हाइसवर हस्तांतरित केले जाईल.\n\nहे डिव्हाइस कायमचे डिस्कनेक्ट होईल.';

  @override
  String get transferComplete => 'हस्तांतरण पूर्ण';

  @override
  String get transferSuccessMessage =>
      'तुमचे खाते यशस्वीरित्या हस्तांतरित केले गेले.\n\nहा अॅप आता बंद होईल.';

  @override
  String get manualVerification => 'मॅन्युअल सत्यापन';

  @override
  String get codeDisplayedOnBothDevices => 'दोन्ही डिव्हाइसवर प्रदर्शित कोड:';

  @override
  String get doesCodeMatchNewDevice =>
      'हा कोड नवीन डिव्हाइसवरील कोडशी जुळतो का?';

  @override
  String get verifiedStatus => 'सत्यापित';

  @override
  String get inProgressStatus => 'चालू आहे...';

  @override
  String get notAvailableStatus => 'उपलब्ध नाही';

  @override
  String get codeExpiredRestart => 'कोड कालबाह्य झाला. कृपया पुन्हा सुरू करा.';

  @override
  String get codesDoNotMatchCancelled => 'कोड जुळत नाहीत. हस्तांतरण रद्द.';

  @override
  String transferToDevice(String device) {
    return 'कडे: $device';
  }

  @override
  String get copiedExclamation => 'कॉपी केले!';

  @override
  String expiresInTime(String time) {
    return '$time मध्ये कालबाह्य';
  }

  @override
  String get biometricNotAvailable => 'या डिव्हाइसवर बायोमेट्रिक्स उपलब्ध नाही';

  @override
  String get biometricAuthError => 'बायोमेट्रिक प्रमाणीकरण दरम्यान त्रुटी';

  @override
  String get authenticateForBiometric =>
      'कृपया बायोमेट्रिक्स सक्रिय करण्यासाठी प्रमाणीकरण करा';

  @override
  String get biometricAuthFailed => 'बायोमेट्रिक प्रमाणीकरण अयशस्वी';

  @override
  String get forceUpdateTitle => 'अद्ययावत करणे आवश्यक';

  @override
  String get forceUpdateMessage =>
      'Hash ची नवीन आवृत्ती उपलब्ध आहे. कृपया पुढे जाण्यासाठी अद्ययावत करा.';

  @override
  String get updateButton => 'अद्ययावत करा';

  @override
  String get maintenanceInProgress => 'देखभाल सुरू आहे';

  @override
  String get tryAgainLater => 'कृपया नंतर पुन्हा प्रयत्न करा';

  @override
  String get information => 'माहिती';

  @override
  String get later => 'नंतर';

  @override
  String get doYouLikeHash => 'तुम्हाला Hash आवडते का?';

  @override
  String get yourFeedbackHelps =>
      'तुमचा अभिप्राय आम्हाला अॅप सुधारण्यास मदत करतो';

  @override
  String get ratingTerrible => 'भयंकर';

  @override
  String get ratingBad => 'वाईट';

  @override
  String get ratingOk => 'ठीक';

  @override
  String get ratingGood => 'चांगले';

  @override
  String get ratingExcellent => 'उत्कृष्ट!';

  @override
  String get donationMessage =>
      'Hash हा ना-नफा प्रकल्प आहे. तुमचे सहाय्य आम्हाला खरोखर खाजगी मेसेंजर बनवत राहण्यास मदत करते.';

  @override
  String get recentConnections => 'अलीकडील कनेक्शन';

  @override
  String get loginInfoText =>
      'प्रत्येक PIN अनलॉक स्थानिकरित्या नोंदवले जाते. फक्त शेवटचे 24 तास ठेवले जातात.';

  @override
  String get connectionCount => 'कनेक्शन(स)';

  @override
  String get periodLabel => 'कालावधी';

  @override
  String get historyLabel => 'इतिहास';

  @override
  String get noLoginRecorded => 'कोणतेही लॉगिन नोंदवलेले नाही';

  @override
  String get nextUnlocksAppearHere => 'पुढील अनलॉक्स येथे दिसतील.';

  @override
  String get dataLocalOnly =>
      'हा डेटा फक्त तुमच्या डिव्हाइसवर साठवला जातो आणि कधीही प्रसारित केला जात नाही.';

  @override
  String get currentSession => 'सध्याचे';

  @override
  String get todayLabel => 'आज';

  @override
  String get yesterdayLabel => 'काल';

  @override
  String get justNowLabel => 'आत्ताच';

  @override
  String minutesAgoLabel(int count) {
    return '$count मि पूर्वी';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursता पूर्वी';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursता $minutesमि पूर्वी';
  }

  @override
  String get noMaintenancePlanned => 'कोणतीही देखभाल नियोजित नाही';

  @override
  String get everythingWorkingNormally => 'सर्व काही सामान्यपणे कार्यरत आहे';

  @override
  String get maintenanceTitle => 'देखभाल';

  @override
  String get maintenanceActiveLabel => 'चालू';

  @override
  String get maintenancePlannedLabel => 'नियोजित';

  @override
  String get locking => 'लॉक होत आहे...';

  @override
  String get newMessageNotification => 'नवीन संदेश';

  @override
  String get secExplainTitle => 'Hash तुमचे संरक्षण कसे करते';

  @override
  String get secExplainIntro =>
      'Hash अशा प्रकारे तयार केले आहे की कोणीही तुमचे संदेश वाचू शकत नाही.';

  @override
  String get secExplainIntroSub =>
      'आम्हीसुद्धा नाही.\nहे कसे काम करते, ते सोप्या शब्दांत सांगतो.';

  @override
  String get secJourneyLabel => 'प्रवास';

  @override
  String get secJourneyTitle => 'तुमच्या संदेशाचा प्रवास';

  @override
  String get secJourneySubtitle =>
      'तुमच्या बोटांपासून तुमच्या संपर्काच्या स्क्रीनपर्यंत, प्रत्येक पायरी संरक्षित आहे. मार्ग अनुसरा.';

  @override
  String get secStep1Title => 'तुम्ही तुमचा संदेश लिहिता';

  @override
  String get secStep1Desc =>
      'तुम्ही अॅपमध्ये \"नमस्कार!\" टाइप करता. या क्षणी, संदेश फक्त तुमच्या फोनच्या मेमरीमध्ये आहे. काहीही पाठवले गेले नाही.';

  @override
  String get secStep2Title => 'Signal Protocol सह एन्क्रिप्शन';

  @override
  String get secStep2Desc =>
      'तुम्ही \"पाठवा\" दाबताच, तुमचा संदेश अनाकलनीय अक्षरांच्या मालिकेत बदलतो. तुमचा संदेश एका तिजोरीत बंद केल्यासारखे आहे ज्याची चावी फक्त तुमच्या संपर्काकडे आहे.';

  @override
  String get secStep3Title => 'Sealed Sender: अदृश्य लिफाफा';

  @override
  String get secStep3Desc =>
      'कल्पना करा की तुम्ही पत्र पाठवता, पण लिफाफ्यावर पाठवणाऱ्याचा पत्ता नाही. Hash नेमके हेच करते. संदेश एका अनामिक मेलबॉक्समध्ये टाकला जातो. सर्व्हरला कोणी पाठवला हे माहित नाही.';

  @override
  String get secStep4Title => 'सर्व्हरला काहीही दिसत नाही';

  @override
  String get secStep4Desc =>
      'सर्व्हर एका आंधळ्या पोस्टमनसारखे काम करतो. त्याला फक्त माहित आहे \"कोणीतरी मेलबॉक्स #A7X9 मध्ये काहीतरी टाकले\". कोणी पाठवले, काय आहे, किंवा कोणासाठी आहे हे माहित नाही.';

  @override
  String get secStep4Highlight =>
      'कोणताही मेटाडेटा साठवला जात नाही: IP पत्ता नाही, टाइमस्टॅम्प नाही, पाठवणारा आणि प्राप्तकर्ता यांचा कोणताही दुवा नाही.';

  @override
  String get secStep5Title => 'तुमच्या संपर्काला संदेश मिळतो';

  @override
  String get secStep5Desc =>
      'तुमच्या संपर्काचा फोन त्यांच्या अनामिक मेलबॉक्समधून सामग्री मिळवतो आणि त्यांच्या खाजगी कीने संदेश डिक्रिप्ट करतो, जी कधीही त्यांच्या डिव्हाइसमधून बाहेर गेली नाही. \"नमस्कार!\" त्यांच्या स्क्रीनवर दिसतो.';

  @override
  String get secStep6Title => 'सर्व्हरवरून संदेश गायब होतो';

  @override
  String get secStep6Desc =>
      'तुमचा संपर्क प्राप्ती पुष्टी करताच, सर्व्हर संदेश कायमचा हटवतो. कचरापेटी नाही, संग्रह नाही, बॅकअप नाही. न वाचलेले संदेशही 24 तासांनंतर आपोआप नष्ट होतात.';

  @override
  String get secStep7Title => 'स्थानिक कालबाह्यता';

  @override
  String get secStep7Desc =>
      'तुमच्या संपर्काच्या फोनवर, तुम्ही निवडलेल्या कालावधीनुसार संदेश स्वतःहून नष्ट होतो: वाचल्यानंतर लगेच, 5 मिनिटे, 1 तास... तुम्ही ठरवता.';

  @override
  String get secJourneyConclusion =>
      'परिणाम: सर्व्हरवर शून्य मागोवा, डिव्हाइसवर शून्य मागोवा. संदेश फक्त वाचण्यापुरता अस्तित्वात होता, मग तो गायब झाला.';

  @override
  String get secArchLabel => 'आर्किटेक्चर';

  @override
  String get secArchTitle => 'संरक्षणाचे 5 स्तर';

  @override
  String get secArchSubtitle =>
      'Hash एकाच तंत्रज्ञानावर अवलंबून नाही. प्रत्येक स्तर इतरांना बळकट करतो. एक स्तर तडजोड झाला तरीही, तुमचा डेटा सुरक्षित राहतो.';

  @override
  String get secLayer1Title => 'एंड-टू-एंड एन्क्रिप्शन';

  @override
  String get secLayer1Desc =>
      'प्रत्येक संदेश अद्वितीय कीने एन्क्रिप्ट केला जातो. सोप्या शब्दांत: कोणी एक संदेश डिक्रिप्ट केला तरी, पुढचा डिक्रिप्ट करता येणार नाही. प्रत्येक संदेशाला स्वतःचे कुलूप आहे.';

  @override
  String get secLayer1Detail =>
      'फाइल्ससाठी (फोटो, व्हिडिओ, कागदपत्रे), Hash अतिरिक्त AES-256-GCM एन्क्रिप्शन वापरते. फाइल तुमचा फोन सोडण्यापूर्वी एन्क्रिप्ट होते.';

  @override
  String get secLayer2Title => 'Sealed Sender (नेटवर्क अनामिकता)';

  @override
  String get secLayer2Desc =>
      'सामान्य मेसेंजर तुमचे संदेश तुमच्या ओळखीसह पाठवतात. हे लिफाफ्यावर नाव लिहिण्यासारखे आहे. Hash अनामिक मेलबॉक्स वापरते: सर्व्हर कोणी पाठवले हे न जाणता संदेश वितरित करतो.';

  @override
  String get secLayer2Detail =>
      'परिणाम: सर्व्हर डेटा लीक झाला तरीही, कोण कोणाशी बोलतो हे पुनर्रचित करणे अशक्य आहे.';

  @override
  String get secLayer3Title => 'स्वयंचलित हटवणे';

  @override
  String get secLayer3Desc =>
      'प्राप्ती पुष्टी होताच सर्व्हरवरून संदेश हटवले जातात. संदेश कधीही मिळवला नाही तरी, 24 तासांनंतर तो आपोआप नष्ट होतो.';

  @override
  String get secLayer3Detail =>
      'तुमच्या फोनवर, तुम्ही निवडलेल्या कालावधीनुसार संदेश स्वतःहून नष्ट होतात: तात्काळ, 5 मि, 15 मि, 30 मि, 1 ता, 3 ता, 6 ता किंवा 12 ता.';

  @override
  String get secLayer4Title => 'स्थानिक प्रवेश संरक्षण';

  @override
  String get secLayer4Desc =>
      'अॅप 6-अंकी PIN कोड आणि/किंवा बायोमेट्रिक्स (Face ID, फिंगरप्रिंट) ने संरक्षित आहे. अनेक अयशस्वी प्रयत्नांनंतर, प्रत्येक अपयशानंतर वाढत्या विलंबासह अॅप लॉक होतो.';

  @override
  String get secLayer5Title => 'लॉक केलेला डेटाबेस';

  @override
  String get secLayer5Desc =>
      'सर्व्हर बाजूला, कोणताही वापरकर्ता थेट डेटाबेसमध्ये लिहू शकत नाही. सर्व क्रिया सुरक्षित फंक्शन्सद्वारे जातात जे प्रत्येक विनंती सत्यापित करतात.';

  @override
  String get secLayer5Detail =>
      'हे बँक काउंटरसारखे आहे: तुम्ही कधीही तिजोरीला स्वतः स्पर्श करत नाही. तुम्ही विनंती करता, आणि सिस्टम कृती करण्यापूर्वी तुम्हाला अधिकार आहे का ते तपासते.';

  @override
  String get secVashLabel => 'जगात अद्वितीय';

  @override
  String get secVashTitle => 'Vash मोड';

  @override
  String get secVashSubtitle =>
      'एक आपत्कालीन सुरक्षा प्रणाली जी इतर कोणत्याही मेसेंजिंग अॅपमध्ये नाही.';

  @override
  String get secVashScenarioTitle => 'ही परिस्थिती कल्पना करा';

  @override
  String get secVashScenario1 => 'कोणीतरी तुमच्या फोनमध्ये प्रवेश करतो';

  @override
  String get secVashScenario2 => 'तुम्हाला तुमचा PIN कोड विचारला जातो';

  @override
  String get secVashScenario3 => 'तुम्हाला तातडीने सर्व डेटा मिटवायचा आहे';

  @override
  String get secVashSolutionTitle => 'उपाय: दोन PIN कोड';

  @override
  String get secVashSolutionDesc =>
      'तुम्ही Hash मध्ये दोन वेगवेगळे PIN कोड कॉन्फिगर करता:';

  @override
  String get secVashNormalCodeLabel => 'सामान्य कोड';

  @override
  String get secVashNormalCodeDesc =>
      'तुमच्या सर्व डेटासह अॅप सामान्यपणे उघडतो';

  @override
  String get secVashCodeLabel2 => 'Vash कोड';

  @override
  String get secVashCodeDescription =>
      'अॅप सामान्यपणे उघडतो... पण तुमचा सर्व डेटा शांतपणे पार्श्वभूमीत हटवला जातो';

  @override
  String get secVashWhatHappensTitle => 'पुढे काय होते';

  @override
  String get secVashWhatHappensDesc =>
      'अॅप सामान्यपणे उघडतो. कोणताही इशारा नाही, कोणतेही संशयास्पद अॅनिमेशन नाही. स्क्रीनवर फक्त रिकामा अॅप दिसतो, जणू तुम्ही नुकताच इंस्टॉल केला.\n\nवास्तवात, तुमची सर्व संभाषणे, संपर्क आणि संदेश एका सेकंदाच्या अंशात अपरिवर्तनीयपणे हटवले गेले आहेत.';

  @override
  String get secCallsLabel => 'कॉल आणि फाइल्स';

  @override
  String get secCallsTitle => 'सर्वकाही एन्क्रिप्टेड आहे';

  @override
  String get secCallsSubtitle =>
      'फक्त संदेशच नाही. Hash मधून जाणारे प्रत्येक गोष्ट एंड-टू-एंड एन्क्रिप्टेड आहे.';

  @override
  String get secAudioCallTitle => 'ऑडिओ कॉल्स';

  @override
  String get secAudioCallDesc =>
      'WebRTC द्वारे एंड-टू-एंड एन्क्रिप्टेड. व्हॉइस थेट डिव्हाइसमध्ये प्रसारित होतो.';

  @override
  String get secVideoCallTitle => 'व्हिडिओ कॉल्स';

  @override
  String get secVideoCallDesc =>
      'समान तंत्रज्ञान, प्रत्येक स्ट्रीम वैयक्तिकरित्या एन्क्रिप्टेड.';

  @override
  String get secPhotosTitle => 'फोटो आणि व्हिडिओ';

  @override
  String get secPhotosDesc =>
      'तुमचा फोन सोडण्यापूर्वी AES-256-GCM मध्ये एन्क्रिप्टेड.';

  @override
  String get secDocsTitle => 'कागदपत्रे';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, कोणतीही फाइल. नाव, आकार आणि सामग्री एन्क्रिप्टेड.';

  @override
  String get secAnonLabel => 'अनामिकता';

  @override
  String get secAnonTitle => 'कोणतीही ओळख आवश्यक नाही';

  @override
  String get secAnonSubtitle =>
      'Hash कधीही तुमचा फोन नंबर किंवा ईमेल विचारत नाही. तुम्ही एका अद्वितीय आणि अनामिक Hash ID ने ओळखले जाता.';

  @override
  String get secHashIdTitle => 'तुमचा Hash ID';

  @override
  String get secHashIdDesc =>
      'हा तुमचा अद्वितीय ओळखकर्ता आहे. तो तुमच्याबद्दल काहीही उघड करत नाही: तुमचे नाव नाही, तुमचा नंबर नाही, तुमचे स्थान नाही. हा एक टोपणनाव आहे जो तुमच्या खऱ्या ओळखीशी जोडणे अशक्य आहे.\n\nसंपर्क जोडण्यासाठी, तुम्ही तुमचा Hash ID शेअर करता किंवा QR कोड स्कॅन करता. बस एवढेच. कोणतेही सिंक्रोनाइझ पत्ता पुस्तक नाही, \"तुम्ही ओळखत असलेले लोक\" सूचना नाही.';

  @override
  String get secDataLabel => 'डेटा';

  @override
  String get secDataTitle => 'Hash ला काय माहित नाही';

  @override
  String get secDataSubtitle =>
      'तुमचा डेटा संरक्षित करण्याचा सर्वोत्तम मार्ग म्हणजे तो गोळा न करणे.';

  @override
  String get secNeverCollected => 'कधीही गोळा केले नाही';

  @override
  String get secNeverItem1 => 'संदेश सामग्री';

  @override
  String get secNeverItem2 => 'संपर्क यादी';

  @override
  String get secNeverItem3 => 'फोन नंबर';

  @override
  String get secNeverItem4 => 'ईमेल पत्ता';

  @override
  String get secNeverItem5 => 'IP पत्ता';

  @override
  String get secNeverItem6 => 'स्थान';

  @override
  String get secNeverItem7 => 'मेटाडेटा (कोण कोणाशी बोलतो)';

  @override
  String get secNeverItem8 => 'कॉल इतिहास';

  @override
  String get secNeverItem9 => 'पत्ता पुस्तक';

  @override
  String get secNeverItem10 => 'जाहिरात ओळखकर्ते';

  @override
  String get secTempStored => 'तात्पुरते साठवलेले';

  @override
  String get secTempItem1 => 'अनामिक Hash ID (अद्वितीय ओळखकर्ता)';

  @override
  String get secTempItem2 => 'सार्वजनिक एन्क्रिप्शन की';

  @override
  String get secTempItem3 =>
      'ट्रान्झिटमधील एन्क्रिप्टेड संदेश (जास्तीत जास्त 24 ता)';

  @override
  String get secTempNote =>
      'हा किमान डेटाही तुम्हाला ओळखू शकत नाही. तुमचा Hash ID कोणत्याही वैयक्तिक माहितीशी जोडलेला नाही.';

  @override
  String get secFooterTitle => 'तुमची गोपनीयता, तुमचे स्वातंत्र्य';

  @override
  String get secFooterDesc =>
      'Hash सर्वात मागणी असलेल्या व्यावसायिक अॅप्लिकेशन्ससारख्याच एन्क्रिप्शन तंत्रज्ञानाचा वापर करते. तुमचे संदेश गणिताद्वारे संरक्षित आहेत, आश्वासनांद्वारे नाही.';

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
