// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero Trace. Zero Compromise.';

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
  String get conversations => 'चैट';

  @override
  String get contacts => 'संपर्क';

  @override
  String get noConversation => 'कोई चैट नहीं';

  @override
  String get noConversationSubtitle =>
      'सुरक्षित बातचीत शुरू करने के लिए एक संपर्क जोड़ें';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लंबित अनुरोध',
      one: '1 लंबित अनुरोध',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count भेजे गए अनुरोध लंबित',
      one: '1 भेजा गया अनुरोध लंबित',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'संपर्क जोड़ें';

  @override
  String get shareApp => 'ऐप शेयर करें';

  @override
  String get newMessage => 'नया संदेश';

  @override
  String get newConversation => 'संदेश भेजें';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get myHashId => 'मेरा Hash ID';

  @override
  String get supportHash => 'Hash का समर्थन करें';

  @override
  String get supportHashSubtitle => 'Hash एक गैर-लाभकारी परियोजना है';

  @override
  String get donate => 'दान करें';

  @override
  String get appearance => 'दिखावट';

  @override
  String get theme => 'थीम';

  @override
  String get themeAuto => 'स्वचालित';

  @override
  String get themeAutoSubtitle => 'सिस्टम सेटिंग्स का पालन करता है';

  @override
  String get themeDark => 'डार्क';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeRecommendation =>
      'बेहतर गोपनीयता के लिए डार्क थीम की सिफारिश की जाती है';

  @override
  String get language => 'भाषा';

  @override
  String get languageAuto => 'स्वचालित (सिस्टम)';

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get messages => 'संदेश';

  @override
  String get calls => 'कॉल';

  @override
  String get vibration => 'कंपन';

  @override
  String get notificationContent => 'सूचना सामग्री';

  @override
  String get notificationContentFull => 'सब दिखाएं';

  @override
  String get notificationContentFullDesc =>
      'संपर्क का नाम और संदेश पूर्वावलोकन';

  @override
  String get notificationContentName => 'केवल नाम';

  @override
  String get notificationContentNameDesc => 'केवल संपर्क का नाम दिखाता है';

  @override
  String get notificationContentDiscrete => 'गोपनीय';

  @override
  String get notificationContentDiscreteDesc => 'केवल \"नया संदेश\" दिखाता है';

  @override
  String get security => 'सुरक्षा';

  @override
  String get howHashProtectsYou => 'Hash आपकी कैसे रक्षा करता है';

  @override
  String get howHashProtectsYouSubtitle => 'अपनी सुरक्षा को समझें';

  @override
  String get accountSecurity => 'खाता सुरक्षा';

  @override
  String get accountSecuritySubtitle => 'PIN, बायोमेट्रिक्स, Vash मोड';

  @override
  String get blockScreenshots => 'स्क्रीनशॉट ब्लॉक करें';

  @override
  String get transferDevice => 'दूसरे डिवाइस पर ट्रांसफर करें';

  @override
  String get transferDeviceSubtitle => 'अपना खाता माइग्रेट करें';

  @override
  String get pinCode => 'PIN कोड';

  @override
  String get changePin => 'PIN कोड बदलें';

  @override
  String get currentPin => 'वर्तमान PIN कोड';

  @override
  String get newPin => 'नया PIN कोड';

  @override
  String get confirmPin => 'PIN कोड की पुष्टि करें';

  @override
  String get pinChanged => 'PIN कोड बदला गया';

  @override
  String get incorrectPin => 'गलत PIN';

  @override
  String get pinsDoNotMatch => 'PIN कोड मेल नहीं खाते';

  @override
  String get autoLock => 'ऑटो-लॉक';

  @override
  String get autoLockDelay => 'लॉक विलंब';

  @override
  String get autoLockImmediate => 'तुरंत';

  @override
  String get autoLockMinute => '1 मिनट';

  @override
  String autoLockMinutes(int count) {
    return '$count मिनट';
  }

  @override
  String get vashCode => 'Vash कोड';

  @override
  String get vashModeTitle => 'Vash मोड';

  @override
  String get vashModeExplanation => 'आपकी अंतिम सुरक्षा जाल।';

  @override
  String get vashModeDescription =>
      'आप एक दूसरा PIN कोड चुनेंगे। यदि कभी आपको Hash खोलने के लिए मजबूर किया जाए, तो अपने सामान्य PIN की जगह यह कोड दर्ज करें।\n\nऐप सामान्य रूप से खुलेगा, लेकिन आपकी सभी बातचीत और संपर्क गायब हो जाएंगे।\n\nआपकी स्क्रीन देखने वाले किसी भी व्यक्ति के लिए, Hash बस खाली दिखता है — जैसे आपने इसे कभी इस्तेमाल ही नहीं किया।';

  @override
  String get vashModeIrreversible => 'यह क्रिया मौन और अपरिवर्तनीय है।';

  @override
  String get chooseVashCode => 'मेरा Vash कोड चुनें';

  @override
  String get vashCodeInfo =>
      'एक दूसरा PIN कोड जो ऐप को सामान्य रूप से खोलता है, लेकिन खाली।';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'यदि आप अपने PIN की जगह यह कोड दर्ज करते हैं:';

  @override
  String get vashDeleteContacts => 'आपके संपर्क गायब हो जाते हैं';

  @override
  String get vashDeleteMessages => 'आपकी बातचीत गायब हो जाती है';

  @override
  String get vashDeleteHistory => 'आपके नोट्स गायब हो जाते हैं';

  @override
  String get vashKeepId => 'आपकी Hash पहचान (#XXX-XXX-XXX) वही रहती है';

  @override
  String get vashAppearNormal =>
      'ऐप सामान्य लेकिन खाली दिखता है, जैसे नया हो। यह क्रिया अपरिवर्तनीय है।';

  @override
  String get setupVashCode => 'Vash कोड सेट करें';

  @override
  String get modifyVashCode => 'Vash कोड बदलें';

  @override
  String get currentVashCode => 'वर्तमान Vash कोड';

  @override
  String get newVashCode => 'नया Vash कोड';

  @override
  String get confirmVashCode => 'Vash कोड की पुष्टि करें';

  @override
  String get vashCodeConfigured => 'Vash कोड कॉन्फ़िगर किया गया';

  @override
  String get vashCodeModified => 'Vash कोड संशोधित किया गया';

  @override
  String get vashCodeMustDiffer => 'Vash कोड PIN से अलग होना चाहिए';

  @override
  String get incorrectVashCode => 'गलत Vash कोड';

  @override
  String get vashWhatToDelete => 'Vash मोड से क्या गायब होना चाहिए?';

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
  String get vashCreateSubtitle => 'अपने मुख्य PIN से अलग कोड चुनें';

  @override
  String get vashConfirmSubtitle => 'अपने Vash कोड की पुष्टि करें';

  @override
  String get pinCodeForEntry => 'ऐप में प्रवेश के लिए PIN कोड';

  @override
  String get vashCodeSection => 'Vash मोड';

  @override
  String get biometric => 'बायोमेट्रिक';

  @override
  String get biometricUnlock => 'फिंगरप्रिंट या Face ID से अनलॉक करें';

  @override
  String get enableBiometric => 'बायोमेट्रिक सक्षम करें';

  @override
  String get biometricWarningMessage =>
      'बायोमेट्रिक सक्षम करने पर, आप ऐप में प्रवेश के लिए अपना Vash कोड उपयोग नहीं कर पाएंगे।\n\nVash कोड केवल तभी उपयोग कर सकते हैं जब बायोमेट्रिक विफल हो (कई असफल प्रयासों के बाद)।\n\nक्या आप जारी रखना चाहते हैं?';

  @override
  String get understood => 'समझ गया';

  @override
  String get shareAppSubtitle => 'Hash को अपनों के साथ शेयर करें';

  @override
  String get share => 'शेयर करें';

  @override
  String get danger => 'खतरा';

  @override
  String get deleteAccount => 'मेरा खाता हटाएं';

  @override
  String get deleteAccountSubtitle => 'अपरिवर्तनीय क्रिया';

  @override
  String get deleteAccountConfirmTitle => 'मेरा खाता हटाएं';

  @override
  String get deleteAccountConfirmMessage =>
      'आपका खाता स्थायी रूप से हटा दिया जाएगा। यह क्रिया अपरिवर्तनीय है।\n\n• आपके सभी चैट\n• आपके सभी संपर्क\n• आपका Hash ID\n\nआपको एक नया खाता बनाना होगा।';

  @override
  String get deleteForever => 'स्थायी रूप से हटाएं';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash मोड सक्रिय।';

  @override
  String deletionError(String error) {
    return 'हटाने में त्रुटि: $error';
  }

  @override
  String get yourSecurity => 'आपकी सुरक्षा';

  @override
  String get securityInfo =>
      '• एंड-टू-एंड एन्क्रिप्शन (Signal Protocol)\n• डिलीवरी के बाद हमारे सर्वर पर कोई डेटा नहीं\n• कुंजियां केवल आपके डिवाइस पर संग्रहीत\n• PIN कोड कभी सर्वर को नहीं भेजा जाता';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'स्वागत है';

  @override
  String get securityStatement1 => 'आपके संदेश सुरक्षित हैं।';

  @override
  String get securityStatement2 => 'एंड-टू-एंड एन्क्रिप्शन।';

  @override
  String get securityStatement3 => 'कोई निशान नहीं। कोई समझौता नहीं।';

  @override
  String get securityStatement4 => 'आपकी गोपनीयता एक अधिकार है।';

  @override
  String get accessBlocked => 'पहुंच अवरुद्ध';

  @override
  String get tooManyAttempts => 'बहुत अधिक प्रयास';

  @override
  String get pleaseWait => 'कृपया प्रतीक्षा करें';

  @override
  String get waitDelay => 'कृपया विलंब समाप्त होने की प्रतीक्षा करें';

  @override
  String attemptCount(int current, int max) {
    return 'प्रयास $current / $max';
  }

  @override
  String retryIn(String time) {
    return '$time में पुनः प्रयास करें';
  }

  @override
  String get forgotPin => 'PIN भूल गए? रिकवरी वाक्यांश का उपयोग करें';

  @override
  String get useRecoveryPhrase => 'रिकवरी वाक्यांश का उपयोग करें';

  @override
  String get recoveryWarningTitle => 'चेतावनी';

  @override
  String get recoveryWarningMessage => 'खाता रिकवरी करेगी:';

  @override
  String get recoveryDeleteAllMessages => 'आपके सभी संदेश हटाएगी';

  @override
  String get recoveryWaitDelay => '1 घंटे की प्रतीक्षा अवधि की आवश्यकता होगी';

  @override
  String get recoveryKeepContacts => 'आपके संपर्क सुरक्षित रहेंगे';

  @override
  String get recoveryIrreversible =>
      'यह क्रिया अपरिवर्तनीय है। आपके संदेश स्थायी रूप से खो जाएंगे।';

  @override
  String get iUnderstand => 'मैं समझता हूं';

  @override
  String get accountRecovery => 'खाता रिकवरी';

  @override
  String get enterRecoveryPhrase =>
      'अपने रिकवरी वाक्यांश के 24 शब्द दर्ज करें, रिक्त स्थान से अलग किए हुए।';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'रिकवर करें';

  @override
  String get recoveryPhraseRequired => 'कृपया अपना रिकवरी वाक्यांश दर्ज करें';

  @override
  String get recoveryPhrase24Words => 'वाक्यांश में ठीक 24 शब्द होने चाहिए';

  @override
  String get incorrectRecoveryPhrase => 'गलत रिकवरी वाक्यांश';

  @override
  String get recoveryInitError => 'रिकवरी प्रारंभ करने में त्रुटि';

  @override
  String get securityDelay => 'सुरक्षा विलंब';

  @override
  String get securityDelayMessage =>
      'आपकी सुरक्षा के लिए, नया PIN बनाने से पहले प्रतीक्षा अवधि आवश्यक है।';

  @override
  String get timeRemaining => 'शेष समय';

  @override
  String get messagesDeletedForProtection =>
      'आपकी सुरक्षा के लिए आपके संदेश हटा दिए गए हैं।';

  @override
  String get canCloseApp => 'आप ऐप बंद कर सकते हैं और बाद में वापस आ सकते हैं।';

  @override
  String get onboardingTitle1 => 'Hash में आपका स्वागत है';

  @override
  String get onboardingSubtitle1 => 'वो मैसेंजर जो कोई निशान नहीं छोड़ता';

  @override
  String get onboardingTitle2 => 'पूर्ण एन्क्रिप्शन';

  @override
  String get onboardingSubtitle2 =>
      'आपके संदेश Signal प्रोटोकॉल के साथ एंड-टू-एंड एन्क्रिप्टेड हैं';

  @override
  String get onboardingTitle3 => 'कोई निशान नहीं';

  @override
  String get onboardingSubtitle3 =>
      'डिलीवरी के बाद संदेश सर्वर से हटा दिए जाते हैं';

  @override
  String get onboardingTitle4 => 'आपकी सुरक्षा';

  @override
  String get onboardingSubtitle4 => 'PIN कोड, Vash मोड और रिकवरी वाक्यांश';

  @override
  String get getStarted => 'शुरू करें';

  @override
  String get next => 'अगला';

  @override
  String get skip => 'छोड़ें';

  @override
  String get alreadyHaveAccount => 'मेरा पहले से खाता है';

  @override
  String get transferMyAccount => 'मेरा खाता ट्रांसफर करें';

  @override
  String get createPin => 'PIN कोड बनाएं';

  @override
  String get createPinSubtitle => 'यह कोड आपके ऐप की पहुंच की सुरक्षा करेगा';

  @override
  String get confirmYourPin => 'अपने PIN कोड की पुष्टि करें';

  @override
  String get confirmPinSubtitle => 'अपना PIN कोड दोबारा दर्ज करें';

  @override
  String get saveRecoveryPhrase => 'रिकवरी वाक्यांश';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'इन 24 शब्दों को क्रम में लिख लें। ये आपको PIN भूलने पर खाता रिकवर करने में मदद करेंगे।';

  @override
  String get phraseWritten => 'मैंने अपना वाक्यांश लिख लिया है';

  @override
  String get warningRecoveryPhrase =>
      'यदि आप यह वाक्यांश खो देते हैं और अपना PIN भूल जाते हैं, तो आप अपने खाते तक पहुंच खो देंगे।';

  @override
  String get accountTransferred => 'खाता ट्रांसफर हो गया';

  @override
  String get accountTransferredMessage =>
      'आपका खाता दूसरे डिवाइस पर ट्रांसफर कर दिया गया है। यह सत्र अब मान्य नहीं है।';

  @override
  String get accountTransferredInfo =>
      'यदि आपने यह ट्रांसफर शुरू नहीं किया, तो आपका खाता समझौता हो सकता है।';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get transferAccount => 'खाता ट्रांसफर करें';

  @override
  String get transferAccountInfo =>
      'अपना Hash खाता नए डिवाइस पर ट्रांसफर करें। आपका वर्तमान सत्र अमान्य हो जाएगा।';

  @override
  String get generateTransferCode => 'ट्रांसफर कोड जनरेट करें';

  @override
  String get transferCode => 'ट्रांसफर कोड';

  @override
  String transferCodeExpires(int minutes) {
    return 'यह कोड $minutes मिनट में समाप्त हो जाएगा';
  }

  @override
  String get enterCodeOnNewDevice =>
      'अपना खाता ट्रांसफर करने के लिए नए डिवाइस पर यह कोड दर्ज करें।';

  @override
  String get generateNewCode => 'नया कोड जनरेट करें';

  @override
  String get scanQrCode => 'QR कोड स्कैन करें';

  @override
  String get scanQrCodeSubtitle =>
      'संपर्क जोड़ने के लिए उनका QR कोड स्कैन करें';

  @override
  String get qrCodeDetected => 'QR कोड पहचाना गया';

  @override
  String get invalidQrCode => 'अमान्य QR कोड';

  @override
  String get cameraPermissionRequired => 'कैमरा अनुमति आवश्यक';

  @override
  String get myQrCode => 'मेरा QR कोड';

  @override
  String get myQrCodeSubtitle =>
      'यह QR कोड शेयर करें ताकि आपके संपर्क आपको जोड़ सकें';

  @override
  String get shareQrCode => 'शेयर करें';

  @override
  String get addContactTitle => 'संपर्क जोड़ें';

  @override
  String get addContactByHashId => 'अपने संपर्क का Hash ID दर्ज करें';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'खोजें';

  @override
  String get contactNotFound => 'संपर्क नहीं मिला';

  @override
  String get contactAlreadyAdded => 'यह संपर्क पहले से आपकी सूची में है';

  @override
  String get contactAdded => 'संपर्क जोड़ा गया';

  @override
  String get myProfile => 'मेरा प्रोफ़ाइल';

  @override
  String get myProfileSubtitle =>
      'यह जानकारी शेयर करें ताकि अन्य आपको जोड़ सकें';

  @override
  String get temporaryCode => 'अस्थायी कोड';

  @override
  String temporaryCodeExpires(String time) {
    return '$time में समाप्त होगा';
  }

  @override
  String get codeExpired => 'कोड समाप्त हो गया';

  @override
  String get generateNewCodeButton => 'नया कोड';

  @override
  String get copyHashId => 'ID कॉपी करें';

  @override
  String get copyCode => 'कोड कॉपी करें';

  @override
  String get copiedToClipboard => 'कॉपी किया गया';

  @override
  String get showMyQrCode => 'मेरा QR कोड दिखाएं';

  @override
  String get orDivider => 'या';

  @override
  String get openScanner => 'स्कैनर खोलें';

  @override
  String get addManually => 'मैन्युअल रूप से जोड़ें';

  @override
  String get contactHashIdLabel => 'संपर्क का Hash ID';

  @override
  String get temporaryCodeLabel => 'अस्थायी कोड';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'अपने संपर्क से उनके प्रोफ़ाइल से कोड जनरेट करने को कहें';

  @override
  String get verifyAndAdd => 'सत्यापित करें और जोड़ें';

  @override
  String get fillAllFields => 'कृपया सभी फ़ील्ड भरें';

  @override
  String get invalidHashIdFormat => 'अमान्य ID प्रारूप (उदा.: 123-456-ABC)';

  @override
  String get userNotFound => 'उपयोगकर्ता नहीं मिला';

  @override
  String get cannotAddYourself => 'आप स्वयं को नहीं जोड़ सकते';

  @override
  String get invalidOrExpiredCode => 'अमान्य या समाप्त अस्थायी कोड';

  @override
  String get contactFound => 'संपर्क मिला!';

  @override
  String get howToCallContact => 'आप उन्हें क्या नाम देना चाहेंगे?';

  @override
  String get contactNameHint => 'संपर्क का नाम';

  @override
  String get addContactButton => 'जोड़ें';

  @override
  String get contactDetails => 'संपर्क विवरण';

  @override
  String get contactName => 'संपर्क का नाम';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date को जोड़ा गया';
  }

  @override
  String get deleteContact => 'संपर्क हटाएं';

  @override
  String deleteContactConfirm(Object name) {
    return 'यह संपर्क हटाएं?';
  }

  @override
  String get deleteContactMessage => 'इससे पूरा चैट भी हट जाएगा।';

  @override
  String get delete => 'हटाएं';

  @override
  String get typeMessage => 'संदेश लिखें...';

  @override
  String get messageSent => 'भेजा गया';

  @override
  String get messageDelivered => 'वितरित';

  @override
  String get messageRead => 'पढ़ा गया';

  @override
  String get messageFailed => 'भेजने में विफल';

  @override
  String get now => 'अभी';

  @override
  String minutesAgo(int count) {
    return '$countमिनट';
  }

  @override
  String hoursAgo(int count) {
    return '$countघंटे';
  }

  @override
  String daysAgo(int count) {
    return '$countदिन';
  }

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'कल';

  @override
  String dateAtTime(String date, String time) {
    return '$date को $time बजे';
  }

  @override
  String get shareMessage =>
      'Hash पर मेरे साथ जुड़ें! 🔒\n\nयह एक सच में निजी मैसेंजर है: पूर्ण एन्क्रिप्शन, सर्वर पर कोई निशान नहीं, और ज़रूरत पड़ने पर पैनिक मोड।\n\nऐप यहां डाउनलोड करें 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'त्रुटि';

  @override
  String get ok => 'ठीक';

  @override
  String get view => 'देखें';

  @override
  String get yes => 'हां';

  @override
  String get no => 'नहीं';

  @override
  String get save => 'सहेजें';

  @override
  String get edit => 'संपादित करें';

  @override
  String get close => 'बंद करें';

  @override
  String get confirm => 'पुष्टि करें';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get retry => 'पुनः प्रयास';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'लंबित अनुरोध';

  @override
  String get noPendingRequests => 'कोई लंबित अनुरोध नहीं';

  @override
  String get pendingRequestsSubtitle => 'ये लोग आपको जोड़ना चाहते हैं';

  @override
  String requestFromUser(String hashId) {
    return '$hashId से अनुरोध';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days दिनों में समाप्त होगा';
  }

  @override
  String get acceptRequest => 'स्वीकार करें';

  @override
  String get rejectRequest => 'अस्वीकार करें';

  @override
  String get requestAccepted => 'अनुरोध स्वीकार किया गया';

  @override
  String get requestRejected => 'अनुरोध अस्वीकार किया गया';

  @override
  String get requestSent => 'अनुरोध भेजा गया!';

  @override
  String get requestSentSubtitle =>
      'आपका अनुरोध भेज दिया गया है। चैट करने से पहले उपयोगकर्ता को इसे स्वीकार करना होगा।';

  @override
  String get requestAlreadyPending => 'एक अनुरोध पहले से लंबित है';

  @override
  String get requestAlreadySentByOther =>
      'इस व्यक्ति ने आपको पहले ही अनुरोध भेजा है';

  @override
  String get addByHashId => 'Hash ID से जोड़ें';

  @override
  String get addByHashIdSubtitle =>
      'संपर्क का Hash ID और अस्थायी कोड दर्ज करें';

  @override
  String get enterTemporaryCode => '6 अंकों का कोड दर्ज करें';

  @override
  String get sendRequest => 'अनुरोध भेजें';

  @override
  String get acceptContactTitle => 'संपर्क स्वीकार करें';

  @override
  String get acceptContactSubtitle => 'आप उन्हें एक कस्टम नाम दे सकते हैं';

  @override
  String get leaveEmptyForHashId => 'Hash ID का उपयोग करने के लिए खाली छोड़ें';

  @override
  String get firstName => 'पहला नाम';

  @override
  String get lastName => 'उपनाम';

  @override
  String get notes => 'नोट्स';

  @override
  String get notesHint => 'इस संपर्क के बारे में व्यक्तिगत नोट्स';

  @override
  String get photoOptional => 'फ़ोटो (वैकल्पिक)';

  @override
  String get contactNameOptional => 'नाम (वैकल्पिक)';

  @override
  String get notesOptional => 'नोट्स (वैकल्पिक)';

  @override
  String get storedLocally => 'केवल आपके डिवाइस पर संग्रहीत';

  @override
  String get encryptedMessageLabel => 'एन्क्रिप्टेड संदेश';

  @override
  String get identityMessageHint =>
      'आप कौन हैं? आप एक-दूसरे को कैसे जानते हैं?';

  @override
  String get messageWillBeSentEncrypted =>
      'यह संदेश एन्क्रिप्ट करके प्राप्तकर्ता को भेजा जाएगा';

  @override
  String get sendRequestButton => 'अनुरोध भेजें';

  @override
  String get requestExpiresIn24h =>
      'स्वीकार न होने पर अनुरोध 24 घंटे में समाप्त हो जाएगा';

  @override
  String get theyAlreadySentYouRequest =>
      'इस व्यक्ति ने आपको पहले ही अनुरोध भेजा है';

  @override
  String get requests => 'अनुरोध';

  @override
  String get receivedRequests => 'प्राप्त';

  @override
  String get sentRequests => 'भेजे गए';

  @override
  String get noSentRequests => 'कोई भेजे गए अनुरोध नहीं';

  @override
  String get cancelRequest => 'रद्द करें';

  @override
  String get deleteRequest => 'अनुरोध हटाएं';

  @override
  String get requestCancelled => 'अनुरोध रद्द किया गया';

  @override
  String sentTo(String hashId) {
    return '$hashId को भेजा गया';
  }

  @override
  String expiresIn(String time) {
    return '$time में समाप्त होगा';
  }

  @override
  String receivedAgo(String time) {
    return '$time पहले प्राप्त';
  }

  @override
  String get messageFromRequester => 'अनुरोधकर्ता का संदेश';

  @override
  String get copy => 'कॉपी करें';

  @override
  String get messageInfo => 'संदेश जानकारी';

  @override
  String get messageDirection => 'दिशा';

  @override
  String get messageSentByYou => 'आपके द्वारा भेजा गया';

  @override
  String get messageReceived => 'प्राप्त';

  @override
  String get messageSentAt => 'भेजा गया';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'स्थिति';

  @override
  String get messageReadAt => 'पढ़ा गया';

  @override
  String get messageType => 'प्रकार';

  @override
  String get messageSize => 'आकार';

  @override
  String get messageExpiresAt => 'समाप्ति';

  @override
  String get messageEncrypted => 'एंड-टू-एंड एन्क्रिप्टेड';

  @override
  String get messageStatusSending => 'भेज रहे हैं...';

  @override
  String get messageStatusSent => 'भेजा गया';

  @override
  String get messageStatusDelivered => 'वितरित';

  @override
  String get messageStatusRead => 'पढ़ा गया';

  @override
  String get messageStatusFailed => 'विफल';

  @override
  String get serverStatus => 'सर्वर';

  @override
  String get onServer => 'वितरण लंबित';

  @override
  String get deletedFromServer => 'हटाया गया';

  @override
  String get messageTypeText => 'टेक्स्ट';

  @override
  String get messageTypeImage => 'चित्र';

  @override
  String get messageTypeVideo => 'वीडियो';

  @override
  String get messageTypeVoice => 'आवाज़';

  @override
  String get messageTypeFile => 'फ़ाइल';

  @override
  String get indefinitely => 'अनिश्चित काल';

  @override
  String get hoursShort => 'घंटे';

  @override
  String get minutesShort => 'मिनट';

  @override
  String get hours => 'घंटे';

  @override
  String get minutes => 'मिनट';

  @override
  String get seconds => 'सेकंड';

  @override
  String get ephemeralMessages => 'अस्थायी संदेश';

  @override
  String get ephemeralMessagesDescription =>
      'इस समय के बाद संदेश स्वचालित रूप से हटा दिए जाते हैं';

  @override
  String get ephemeralImmediate => 'तुरंत (पढ़ने के बाद)';

  @override
  String get ephemeralImmediateDesc => 'पढ़ते ही हटा दिया जाता है';

  @override
  String get ephemeralMyPreference => 'मेरी प्राथमिकता';

  @override
  String get ephemeralMyPreferenceDesc => 'वैश्विक सेटिंग का उपयोग करें';

  @override
  String get ephemeralDefaultSetting => 'संदेश अवधि';

  @override
  String get ephemeralChooseDefault => 'अनुशंसित';

  @override
  String get ephemeral30Seconds => '30 सेकंड';

  @override
  String get ephemeral30SecondsDesc => 'पढ़ने के 30 सेकंड बाद हटाया जाता है';

  @override
  String get ephemeral5Minutes => '5 मिनट';

  @override
  String get ephemeral5MinutesDesc => 'पढ़ने के 5 मिनट बाद हटाया जाता है';

  @override
  String get ephemeral1Hour => '1 घंटा';

  @override
  String get ephemeral1HourDesc => 'पढ़ने के 1 घंटे बाद हटाया जाता है';

  @override
  String get ephemeral3Hours => '3 घंटे';

  @override
  String get ephemeral6Hours => '6 घंटे';

  @override
  String get ephemeral6HoursDesc => 'पढ़ने के 6 घंटे बाद हटाया जाता है';

  @override
  String get ephemeral12Hours => '12 घंटे';

  @override
  String get ephemeral24Hours => '24 घंटे';

  @override
  String get ephemeral24HoursDesc => 'पढ़ने के 24 घंटे बाद हटाया जाता है';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'कस्टम अवधि';

  @override
  String get howItWorks => 'यह कैसे काम करता है';

  @override
  String get ephemeralExplanation1 =>
      'संदेश प्राप्त होते ही सर्वर से हटा दिए जाते हैं।';

  @override
  String get ephemeralExplanation2 =>
      'यह सेटिंग निर्धारित करती है कि पढ़ने के बाद संदेश आपके फ़ोन से कब गायब होंगे।';

  @override
  String get ephemeralExplanation3 =>
      'आपके संपर्क की अपने फ़ोन के लिए अपनी सेटिंग है।';

  @override
  String get mute1Hour => '1 घंटा';

  @override
  String get mute8Hours => '8 घंटे';

  @override
  String get mute1Day => '1 दिन';

  @override
  String get mute1Week => '1 सप्ताह';

  @override
  String get muteAlways => 'हमेशा';

  @override
  String get muteExplanation => 'आपको इस संपर्क से सूचनाएं नहीं मिलेंगी';

  @override
  String get showCallsInRecents => 'हाल के कॉल में दिखाएं';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash कॉल फ़ोन इतिहास में दिखाई देंगे';

  @override
  String get feedback => 'प्रतिक्रिया';

  @override
  String get muteNotifications => 'सूचनाएं म्यूट करें';

  @override
  String get muteDescription => 'आपको इस संपर्क से सूचनाएं नहीं मिलेंगी';

  @override
  String mutedUntil(String time) {
    return '$time तक म्यूट';
  }

  @override
  String get notMuted => 'सूचनाएं सक्षम';

  @override
  String get unmute => 'अनम्यूट करें';

  @override
  String get notificationSound => 'सूचना ध्वनि';

  @override
  String get defaultSound => 'डिफ़ॉल्ट';

  @override
  String get chatSettings => 'चैट सेटिंग्स';

  @override
  String get bubbleColor => 'बबल का रंग';

  @override
  String get backgroundColor => 'पृष्ठभूमि का रंग';

  @override
  String get backgroundImage => 'पृष्ठभूमि चित्र';

  @override
  String get chatBackground => 'चैट पृष्ठभूमि';

  @override
  String get customColor => 'कस्टम';

  @override
  String get defaultColor => 'डिफ़ॉल्ट';

  @override
  String get imageSelected => 'चित्र चयनित';

  @override
  String get noImage => 'कोई चित्र नहीं';

  @override
  String get color => 'रंग';

  @override
  String get image => 'चित्र';

  @override
  String get tapToSelectImage => 'चित्र चुनने के लिए टैप करें';

  @override
  String get changeImage => 'चित्र बदलें';

  @override
  String get previewMessageReceived => 'नमस्ते!';

  @override
  String get previewMessageSent => 'कैसे हो!';

  @override
  String get messageAction => 'संदेश';

  @override
  String get callAction => 'कॉल';

  @override
  String get videoAction => 'वीडियो';

  @override
  String get personalNotes => 'व्यक्तिगत नोट्स';

  @override
  String get addNotes => 'नोट्स जोड़ें...';

  @override
  String get noNotes => 'कोई नोट नहीं';

  @override
  String get messageNotifications => 'संदेश सूचनाएं';

  @override
  String get callNotifications => 'कॉल सूचनाएं';

  @override
  String get useGradient => 'ग्रेडिएंट का उपयोग करें';

  @override
  String get gradientStart => 'शुरुआती रंग';

  @override
  String get gradientEnd => 'अंतिम रंग';

  @override
  String get preview => 'पूर्वावलोकन';

  @override
  String get reset => 'रीसेट करें';

  @override
  String get securityNumber => 'सुरक्षा संख्या';

  @override
  String securityNumberDescription(String name) {
    return 'सत्यापित करें कि सुरक्षा संख्या $name के डिवाइस से मेल खाती है';
  }

  @override
  String get verifyEncryption => 'एंड-टू-एंड एन्क्रिप्शन सत्यापित करें';

  @override
  String get tapToCopy => 'कॉपी करने के लिए टैप करें';

  @override
  String get howToVerify => 'कैसे सत्यापित करें';

  @override
  String get verifyStep1 => 'अपने संपर्क से व्यक्तिगत रूप से मिलें या कॉल करें';

  @override
  String get verifyStep2 =>
      'सुरक्षा संख्याओं की तुलना करें या QR कोड स्कैन करें';

  @override
  String get verifyStep3 => 'यदि वे मेल खाती हैं, तो आपका चैट सुरक्षित है';

  @override
  String get scanToVerify => 'सत्यापन के लिए स्कैन करें';

  @override
  String get reportSpam => 'स्पैम की रिपोर्ट करें';

  @override
  String get reportSpamSubtitle => 'इस संपर्क को स्पैम के रूप में रिपोर्ट करें';

  @override
  String get reportSpamDescription =>
      'इस संपर्क की गुमनाम रूप से रिपोर्ट की जाएगी। आपकी पहचान साझा नहीं की जाएगी। क्या आप निश्चित हैं?';

  @override
  String get report => 'रिपोर्ट करें';

  @override
  String get spamReported => 'स्पैम रिपोर्ट किया गया';

  @override
  String get reportError => 'रिपोर्ट भेजने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String get reportRateLimited =>
      'आपने आज के लिए अधिकतम रिपोर्ट सीमा पूरी कर ली है।';

  @override
  String get blockContact => 'संपर्क ब्लॉक करें';

  @override
  String get blockContactDescription =>
      'यह संपर्क अब आपको संदेश या कॉल नहीं कर पाएगा। उन्हें सूचित नहीं किया जाएगा।';

  @override
  String get unblockContact => 'संपर्क अनब्लॉक करें';

  @override
  String get unblockContactDescription =>
      'यह संपर्क फिर से आपको संदेश भेज और कॉल कर सकेगा।';

  @override
  String get contactBlocked => 'संपर्क ब्लॉक किया गया';

  @override
  String get contactUnblocked => 'संपर्क अनब्लॉक किया गया';

  @override
  String get contactIsBlocked => 'यह संपर्क ब्लॉक है';

  @override
  String get unblock => 'अनब्लॉक करें';

  @override
  String get deleteContactSubtitle => 'यह संपर्क और चैट हटाएं';

  @override
  String get confirmWithPin => 'PIN से पुष्टि करें';

  @override
  String get enterPinToConfirm =>
      'इस क्रिया की पुष्टि के लिए अपना PIN दर्ज करें';

  @override
  String get profilePhoto => 'प्रोफ़ाइल फ़ोटो';

  @override
  String get takePhoto => 'फ़ोटो लें';

  @override
  String get chooseFromGallery => 'गैलरी से चुनें';

  @override
  String get removePhoto => 'फ़ोटो हटाएं';

  @override
  String get viewContactHashId => 'संपर्क का पहचानकर्ता देखें';

  @override
  String get hashIdPartiallyMasked =>
      'आपकी सुरक्षा और संपर्क की गोपनीयता के लिए आंशिक रूप से छिपा हुआ';

  @override
  String get addFirstContact => 'अपना पहला संपर्क जोड़ें';

  @override
  String get addFirstContactSubtitle =>
      'अपना QR कोड शेयर करें या किसी मित्र का स्कैन करें';

  @override
  String get directory => 'निर्देशिका';

  @override
  String get noContacts => 'कोई संपर्क नहीं';

  @override
  String get noContactsSubtitle => 'शुरू करने के लिए एक संपर्क जोड़ें';

  @override
  String get sendMessageAction => 'संदेश भेजें';

  @override
  String get audioCall => 'ऑडियो कॉल';

  @override
  String get videoCall => 'वीडियो कॉल';

  @override
  String get viewProfile => 'प्रोफ़ाइल देखें';

  @override
  String get deleteContactDirectory => 'संपर्क हटाएं';

  @override
  String get scanShort => 'स्कैन';

  @override
  String get addShort => 'जोड़ें';

  @override
  String deleteContactConfirmName(String name) {
    return 'क्या आप वाकई $name को हटाना चाहते हैं?';
  }

  @override
  String get noNotesTitle => 'कोई नोट नहीं';

  @override
  String get noNotesSubtitle => 'अपना पहला नोट बनाएं';

  @override
  String get newNote => 'नया नोट';

  @override
  String get editNote => 'नोट संपादित करें';

  @override
  String get deleteNote => 'नोट हटाएं';

  @override
  String get deleteNoteConfirm => 'क्या आप वाकई यह नोट हटाना चाहते हैं?';

  @override
  String get noteTitle => 'शीर्षक';

  @override
  String get noteContent => 'सामग्री';

  @override
  String get addItem => 'आइटम जोड़ें';

  @override
  String get pinNote => 'पिन करें';

  @override
  String get unpinNote => 'अनपिन करें';

  @override
  String get noteColor => 'रंग';

  @override
  String get notePassword => 'पासवर्ड';

  @override
  String get setPassword => 'पासवर्ड सेट करें';

  @override
  String get changePassword => 'पासवर्ड बदलें';

  @override
  String get removePassword => 'पासवर्ड हटाएं';

  @override
  String get enterPassword => 'पासवर्ड दर्ज करें';

  @override
  String get confirmPassword => 'पासवर्ड की पुष्टि करें';

  @override
  String get passwordPin => 'PIN कोड';

  @override
  String get passwordText => 'टेक्स्ट पासवर्ड';

  @override
  String get protectedNote => 'सुरक्षित नोट';

  @override
  String get incorrectPassword => 'गलत पासवर्ड';

  @override
  String get passwordSet => 'पासवर्ड सेट किया गया';

  @override
  String get passwordRemoved => 'पासवर्ड हटाया गया';

  @override
  String get notesBiometric => 'नोट्स के लिए Face ID';

  @override
  String get notesBiometricSubtitle =>
      'सुरक्षित नोट खोलने के लिए बायोमेट्रिक प्रमाणीकरण आवश्यक करें';

  @override
  String get textNote => 'टेक्स्ट नोट';

  @override
  String get checklistNote => 'चेकलिस्ट';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total कार्य';
  }

  @override
  String get autoSaved => 'सहेजा गया';

  @override
  String get searchNotes => 'नोट खोजें';

  @override
  String get legalConsent => 'कानूनी सहमति';

  @override
  String get confirmAge13 =>
      'मैं पुष्टि करता/करती हूं कि मेरी आयु कम से कम 13 वर्ष है';

  @override
  String get acceptLegalStart => 'मैं स्वीकार करता/करती हूं ';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get andThe => ' और ';

  @override
  String get continueButton => 'जारी रखें';

  @override
  String get mustAcceptTerms =>
      'जारी रखने के लिए आपको दोनों शर्तें स्वीकार करनी होंगी';

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
  String get support => 'सहायता';

  @override
  String get contactSupport => 'सहायता से संपर्क करें';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'दुरुपयोग की रिपोर्ट करें';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'कानूनी';

  @override
  String get legalEntity => 'कानूनी इकाई';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'पिन करें';

  @override
  String get unpinConversation => 'अनपिन करें';

  @override
  String get hideConversation => 'फ़ीड से हटाएं';

  @override
  String get deleteConversation => 'बातचीत हटाएं';

  @override
  String get deleteConversationConfirm =>
      'सभी संदेशों को हटाने की पुष्टि के लिए अपना PIN दर्ज करें';

  @override
  String get noConversations => 'अभी कोई बातचीत नहीं';

  @override
  String get startConversation => 'शुरू करें';

  @override
  String get microphonePermissionRequired => 'माइक्रोफ़ोन पहुंच आवश्यक';

  @override
  String get microphonePermissionExplanation =>
      'Hash को कॉल करने के लिए माइक्रोफ़ोन चाहिए।';

  @override
  String get cameraPermissionExplanation =>
      'Hash को वीडियो कॉल के लिए कैमरा चाहिए।';

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
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String get callConnecting => 'कनेक्ट हो रहा है...';

  @override
  String get callRinging => 'बज रहा है...';

  @override
  String get callReconnecting => 'पुनः कनेक्ट हो रहा है...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'पुनः कनेक्ट हो रहा है (${seconds}s)';
  }

  @override
  String get callPaused => 'रुका हुआ';

  @override
  String get callPausedSubtitle => 'कॉल अभी भी चालू है';

  @override
  String get callRemoteMicMuted => 'संपर्क का माइक्रोफ़ोन म्यूट है';

  @override
  String get callMiniControlsMute => 'म्यूट करें';

  @override
  String get callMiniControlsUnmute => 'अनम्यूट करें';

  @override
  String get callMiniControlsHangUp => 'कॉल काटें';

  @override
  String get callMiniControlsReturn => 'कॉल पर वापस जाएं';

  @override
  String get callNetworkPoor => 'अस्थिर कनेक्शन';

  @override
  String get callNetworkLost => 'कनेक्शन खो गया';

  @override
  String get callEndedTitle => 'कॉल समाप्त';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'डिवाइस डेटा';

  @override
  String get deviceDataSubtitle => 'स्थानीय और सर्वर स्टोरेज';

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
  String get localStorage => 'स्थानीय स्टोरेज';

  @override
  String get onThisDevice => 'इस डिवाइस पर';

  @override
  String get encryptedDatabases => 'एन्क्रिप्टेड डेटाबेस';

  @override
  String get files => 'फ़ाइलें';

  @override
  String get secureKeychain => 'सुरक्षित कीचेन';

  @override
  String get cache => 'कैश';

  @override
  String get contactsDetail => 'नाम, अवतार, Signal कुंजियां';

  @override
  String get messagesDetail => 'एन्क्रिप्टेड बातचीत';

  @override
  String get notesDetail => 'व्यक्तिगत नोट्स';

  @override
  String get signalSessions => 'Signal सत्र';

  @override
  String get signalSessionsDetail => 'एन्क्रिप्शन सत्र';

  @override
  String get pendingContacts => 'लंबित संपर्क';

  @override
  String get pendingContactsDetail => 'लंबित अनुरोध';

  @override
  String get callHistory => 'कॉल';

  @override
  String get callHistoryDetail => 'कॉल इतिहास';

  @override
  String get preferences => 'प्राथमिकताएं';

  @override
  String get preferencesDetail => 'मीडिया और कॉल प्राथमिकताएं';

  @override
  String get avatars => 'अवतार';

  @override
  String get media => 'मीडिया';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ाइलें',
      one: '1 फ़ाइल',
      zero: 'कोई फ़ाइल नहीं',
    );
    return '$_temp0';
  }

  @override
  String get active => 'सक्रिय';

  @override
  String get notDefined => 'परिभाषित नहीं';

  @override
  String get biometrics => 'बायोमेट्रिक्स';

  @override
  String get recoveryPhrase => 'रिकवरी वाक्यांश';

  @override
  String get identity => 'पहचान (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol कुंजियां';

  @override
  String get authTokens => 'प्रमाणीकरण टोकन';

  @override
  String get contactNamesCache => 'संपर्क नाम कैश';

  @override
  String get remoteConfig => 'दूरस्थ कॉन्फ़िगरेशन';

  @override
  String get notificationPrefs => 'सूचना प्राथमिकताएं';

  @override
  String get serverData => 'सर्वर डेटा';

  @override
  String get serverDataInfo =>
      'Hash सर्वर पर न्यूनतम डेटा रखता है, सभी एन्क्रिप्टेड या अस्थायी।';

  @override
  String get serverProfile => 'प्रोफ़ाइल';

  @override
  String get serverProfileDetail =>
      'Hash ID, सार्वजनिक कुंजियां, मेलबॉक्स टोकन';

  @override
  String get serverPrekeys => 'प्री-कुंजियां';

  @override
  String get serverPrekeysDetail => 'एकबार Signal कुंजियां (उपभोग की गई)';

  @override
  String get serverMessages => 'ट्रांज़िट में संदेश';

  @override
  String get serverMessagesDetail => 'डिलीवरी के बाद हटाए गए (अधिकतम 24 घंटे)';

  @override
  String get serverMedia => 'ट्रांज़िट में मीडिया';

  @override
  String get serverMediaDetail => 'डाउनलोड के बाद हटाया गया';

  @override
  String get serverContactRequests => 'संपर्क अनुरोध';

  @override
  String get serverContactRequestsDetail => '24 घंटे बाद समाप्त';

  @override
  String get serverRateLimits => 'दर सीमाएं';

  @override
  String get serverRateLimitsDetail => 'अस्थायी दुरुपयोग-रोधी डेटा';

  @override
  String get privacyReassurance =>
      'Hash आपके संदेश नहीं पढ़ सकता। सभी डेटा एंड-टू-एंड एन्क्रिप्टेड है। सर्वर डेटा स्वचालित रूप से हटाया जाता है।';

  @override
  String get pinTooSimple => 'यह PIN बहुत सरल है। एक अधिक सुरक्षित कोड चुनें।';

  @override
  String get genericError => 'एक त्रुटि हुई। कृपया पुनः प्रयास करें।';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'खाता बनाने में असमर्थ: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'वाक्यांश क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get copyPhrase => 'वाक्यांश कॉपी करें';

  @override
  String get recoveryPhraseSecurityWarning =>
      'इस वाक्यांश को सुरक्षित स्थान पर लिखें। यदि आप इस वाक्यांश के बिना अपना PIN खो देते हैं, तो आप स्थायी रूप से अपने डेटा तक पहुंच खो देंगे।';

  @override
  String get noMessages => 'कोई संदेश नहीं';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name के साथ सभी संदेश हटाएं?';
  }

  @override
  String get confirmation => 'पुष्टि';

  @override
  String get untitled => 'शीर्षकहीन';

  @override
  String get noSessions => 'कोई सत्र नहीं';

  @override
  String get unknownContact => 'अज्ञात संपर्क';

  @override
  String get unnamed => 'नामहीन';

  @override
  String get noPendingRequestsAlt => 'कोई लंबित अनुरोध नहीं';

  @override
  String get deleteAllCallHistory => 'सभी कॉल इतिहास हटाएं?';

  @override
  String get noCalls => 'कोई कॉल नहीं';

  @override
  String get noPreferences => 'कोई प्राथमिकता नहीं';

  @override
  String get resetAllMediaPrefs => 'सभी मीडिया प्राथमिकताएं रीसेट करें?';

  @override
  String get deleteThisAvatar => 'यह अवतार हटाएं?';

  @override
  String get deleteAllAvatars => 'सभी अवतार हटाएं?';

  @override
  String get noAvatars => 'कोई अवतार नहीं';

  @override
  String get deleteThisFile => 'यह फ़ाइल हटाएं?';

  @override
  String get deleteAllMediaFiles => 'सभी मीडिया हटाएं?';

  @override
  String get noMediaFiles => 'कोई मीडिया नहीं';

  @override
  String get outgoing => 'आउटगोइंग';

  @override
  String get incoming => 'इनकमिंग';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'अस्थायी दृश्य: ${seconds}s';
  }

  @override
  String get normalView => 'सामान्य दृश्य';

  @override
  String get callReasonCompleted => 'पूर्ण';

  @override
  String get callReasonMissed => 'मिस्ड';

  @override
  String get callReasonDeclined => 'अस्वीकृत';

  @override
  String get callReasonFailed => 'विफल';

  @override
  String get justNow => 'अभी';

  @override
  String timeAgoMinutes(int count) {
    return '$count मिनट पहले';
  }

  @override
  String timeAgoHours(int count) {
    return '$count घंटे पहले';
  }

  @override
  String timeAgoDays(int count) {
    return '$count दिन पहले';
  }

  @override
  String get messageTypeContact => 'संपर्क';

  @override
  String get messageTypeLocation => 'स्थान';

  @override
  String get statusQueued => 'कतार में';

  @override
  String get blockedBadge => 'ब्लॉक किया गया';

  @override
  String get protectedBadge => 'सुरक्षित';

  @override
  String messageCount(int count) {
    return '$count संदेश';
  }

  @override
  String get deleteQuestion => 'हटाएं?';

  @override
  String get transferMyAccountTitle => 'मेरा खाता ट्रांसफर करें';

  @override
  String get loadingError => 'लोडिंग त्रुटि';

  @override
  String get transferToNewDevice => 'नए डिवाइस पर ट्रांसफर करें';

  @override
  String get transferInstructions =>
      'अपने नए डिवाइस पर \"मेरा खाता रिकवर करें\" चुनें और यह जानकारी दर्ज करें:';

  @override
  String get yourHashIdLabel => 'आपका Hash ID';

  @override
  String get enterYourPinCode => 'अपना PIN कोड दर्ज करें';

  @override
  String get pinOwnerConfirmation =>
      'यह पुष्टि करने के लिए कि आप इस खाते के स्वामी हैं';

  @override
  String get scanThisQrCode => 'यह QR कोड स्कैन करें';

  @override
  String get withYourNewDevice => 'अपने नए डिवाइस से';

  @override
  String get orEnterTheCode => 'या कोड दर्ज करें';

  @override
  String get transferCodeLabel => 'ट्रांसफर कोड';

  @override
  String get proximityVerification => 'निकटता सत्यापन';

  @override
  String get bringDevicesCloser => 'दोनों डिवाइस पास लाएं';

  @override
  String get confirmTransferQuestion => 'ट्रांसफर की पुष्टि करें?';

  @override
  String get accountWillBeTransferred =>
      'आपका खाता नए डिवाइस पर ट्रांसफर किया जाएगा।\n\nयह डिवाइस स्थायी रूप से डिस्कनेक्ट हो जाएगा।';

  @override
  String get transferComplete => 'ट्रांसफर पूर्ण';

  @override
  String get transferSuccessMessage =>
      'आपका खाता सफलतापूर्वक ट्रांसफर हो गया।\n\nयह एप्लिकेशन अब बंद होगा।';

  @override
  String get manualVerification => 'मैन्युअल सत्यापन';

  @override
  String get codeDisplayedOnBothDevices => 'दोनों डिवाइस पर दिखाया गया कोड:';

  @override
  String get doesCodeMatchNewDevice =>
      'क्या यह कोड नए डिवाइस पर दिखाए गए कोड से मेल खाता है?';

  @override
  String get verifiedStatus => 'सत्यापित';

  @override
  String get inProgressStatus => 'प्रगति में...';

  @override
  String get notAvailableStatus => 'उपलब्ध नहीं';

  @override
  String get codeExpiredRestart => 'कोड समाप्त हो गया। कृपया दोबारा शुरू करें।';

  @override
  String get codesDoNotMatchCancelled => 'कोड मेल नहीं खाते। ट्रांसफर रद्द।';

  @override
  String transferToDevice(String device) {
    return 'को: $device';
  }

  @override
  String get copiedExclamation => 'कॉपी किया गया!';

  @override
  String expiresInTime(String time) {
    return '$time में समाप्त होगा';
  }

  @override
  String get biometricNotAvailable =>
      'इस डिवाइस पर बायोमेट्रिक्स उपलब्ध नहीं है';

  @override
  String get biometricAuthError => 'बायोमेट्रिक प्रमाणीकरण में त्रुटि';

  @override
  String get authenticateForBiometric =>
      'बायोमेट्रिक्स सक्षम करने के लिए कृपया प्रमाणित करें';

  @override
  String get biometricAuthFailed => 'बायोमेट्रिक प्रमाणीकरण विफल';

  @override
  String get forceUpdateTitle => 'अपडेट आवश्यक';

  @override
  String get forceUpdateMessage =>
      'Hash का नया संस्करण उपलब्ध है। जारी रखने के लिए कृपया अपडेट करें।';

  @override
  String get updateButton => 'अपडेट करें';

  @override
  String get maintenanceInProgress => 'रखरखाव जारी';

  @override
  String get tryAgainLater => 'कृपया बाद में पुनः प्रयास करें';

  @override
  String get information => 'जानकारी';

  @override
  String get later => 'बाद में';

  @override
  String get doYouLikeHash => 'क्या आपको Hash पसंद है?';

  @override
  String get yourFeedbackHelps =>
      'आपकी प्रतिक्रिया ऐप को बेहतर बनाने में मदद करती है';

  @override
  String get ratingTerrible => 'भयानक';

  @override
  String get ratingBad => 'खराब';

  @override
  String get ratingOk => 'ठीक';

  @override
  String get ratingGood => 'अच्छा';

  @override
  String get ratingExcellent => 'उत्कृष्ट!';

  @override
  String get donationMessage =>
      'Hash एक गैर-लाभकारी परियोजना है। आपका समर्थन हमें सच में निजी मैसेंजर बनाते रहने में मदद करता है।';

  @override
  String get recentConnections => 'हाल के कनेक्शन';

  @override
  String get loginInfoText =>
      'हर PIN अनलॉक स्थानीय रूप से रिकॉर्ड किया जाता है। केवल पिछले 24 घंटे सहेजे जाते हैं।';

  @override
  String get connectionCount => 'कनेक्शन';

  @override
  String get periodLabel => 'अवधि';

  @override
  String get historyLabel => 'इतिहास';

  @override
  String get noLoginRecorded => 'कोई लॉगिन रिकॉर्ड नहीं';

  @override
  String get nextUnlocksAppearHere => 'अगले अनलॉक यहां दिखाई देंगे।';

  @override
  String get dataLocalOnly =>
      'यह डेटा केवल आपके डिवाइस पर संग्रहीत है और कभी प्रेषित नहीं किया जाता।';

  @override
  String get currentSession => 'वर्तमान';

  @override
  String get todayLabel => 'आज';

  @override
  String get yesterdayLabel => 'कल';

  @override
  String get justNowLabel => 'अभी';

  @override
  String minutesAgoLabel(int count) {
    return '$count मिनट पहले';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours घंटे पहले';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours घंटे $minutes मिनट पहले';
  }

  @override
  String get noMaintenancePlanned => 'कोई रखरखाव नियोजित नहीं';

  @override
  String get everythingWorkingNormally => 'सब कुछ सामान्य रूप से काम कर रहा है';

  @override
  String get maintenanceTitle => 'रखरखाव';

  @override
  String get maintenanceActiveLabel => 'जारी';

  @override
  String get maintenancePlannedLabel => 'नियोजित';

  @override
  String get locking => 'लॉक हो रहा है...';

  @override
  String get newMessageNotification => 'नया संदेश';

  @override
  String get secExplainTitle => 'Hash आपकी कैसे रक्षा करता है';

  @override
  String get secExplainIntro =>
      'Hash इस तरह बनाया गया है कि कोई भी आपके संदेश नहीं पढ़ सकता।';

  @override
  String get secExplainIntroSub =>
      'हम भी नहीं।\nयहां बताया गया है कि यह कैसे काम करता है, सरल शब्दों में।';

  @override
  String get secJourneyLabel => 'यात्रा';

  @override
  String get secJourneyTitle => 'आपके संदेश की यात्रा';

  @override
  String get secJourneySubtitle =>
      'आपकी उंगली से आपके संपर्क की स्क्रीन तक, हर कदम सुरक्षित है। रास्ते का अनुसरण करें।';

  @override
  String get secStep1Title => 'आप अपना संदेश लिखते हैं';

  @override
  String get secStep1Desc =>
      'आप ऐप में \"नमस्ते!\" टाइप करते हैं। इस समय, संदेश केवल आपके फ़ोन की मेमोरी में मौजूद है। कुछ भी नहीं भेजा गया है।';

  @override
  String get secStep2Title => 'Signal Protocol से एन्क्रिप्शन';

  @override
  String get secStep2Desc =>
      'जैसे ही आप \"भेजें\" दबाते हैं, आपका संदेश अपठनीय वर्णों की एक श्रृंखला में बदल जाता है। यह ऐसा है जैसे आपका संदेश एक तिजोरी में बंद है जिसकी चाबी केवल आपके संपर्क के पास है।';

  @override
  String get secStep3Title => 'Sealed Sender: अदृश्य लिफ़ाफ़ा';

  @override
  String get secStep3Desc =>
      'कल्पना करें कि आप डाक से पत्र भेजते हैं, लेकिन लिफ़ाफ़े पर प्रेषक का पता नहीं है। Hash ठीक यही करता है। संदेश एक गुमनाम मेलबॉक्स में डाला जाता है। सर्वर को नहीं पता कि इसे किसने भेजा।';

  @override
  String get secStep4Title => 'सर्वर कुछ नहीं देखता';

  @override
  String get secStep4Desc =>
      'सर्वर एक अंधे डाकिये की तरह काम करता है। वह केवल जानता है कि \"किसी ने मेलबॉक्स #A7X9 में कुछ डाला\"। उसे नहीं पता कि किसने भेजा, क्या है, या किसके लिए है।';

  @override
  String get secStep4Highlight =>
      'कोई मेटाडेटा संग्रहीत नहीं: कोई IP पता नहीं, कोई टाइमस्टैम्प नहीं, प्रेषक और प्राप्तकर्ता के बीच कोई लिंक नहीं।';

  @override
  String get secStep5Title => 'आपका संपर्क संदेश प्राप्त करता है';

  @override
  String get secStep5Desc =>
      'आपके संपर्क का फ़ोन अपने गुमनाम मेलबॉक्स से सामग्री लेता है और अपनी निजी कुंजी से संदेश डिक्रिप्ट करता है, जो कभी उनके डिवाइस से नहीं गई। उनकी स्क्रीन पर \"नमस्ते!\" दिखाई देता है।';

  @override
  String get secStep6Title => 'संदेश सर्वर से गायब हो जाता है';

  @override
  String get secStep6Desc =>
      'जैसे ही आपका संपर्क प्राप्ति की पुष्टि करता है, सर्वर संदेश को स्थायी रूप से हटा देता है। कोई ट्रैश नहीं, कोई आर्काइव नहीं, कोई बैकअप नहीं। अपठित संदेश भी 24 घंटे बाद स्वचालित रूप से नष्ट हो जाते हैं।';

  @override
  String get secStep7Title => 'स्थानीय समाप्ति';

  @override
  String get secStep7Desc =>
      'आपके संपर्क के फ़ोन पर, संदेश आपकी चुनी हुई अवधि के अनुसार स्वयं नष्ट हो जाता है: पढ़ने के तुरंत बाद, 5 मिनट, 1 घंटा... आप तय करते हैं।';

  @override
  String get secJourneyConclusion =>
      'परिणाम: सर्वर पर शून्य निशान, डिवाइस पर शून्य निशान। संदेश केवल पढ़े जाने भर के लिए अस्तित्व में था, फिर गायब हो गया।';

  @override
  String get secArchLabel => 'आर्किटेक्चर';

  @override
  String get secArchTitle => 'सुरक्षा की 5 परतें';

  @override
  String get secArchSubtitle =>
      'Hash एक ही तकनीक पर निर्भर नहीं है। प्रत्येक परत दूसरी को मजबूत करती है। भले ही एक परत समझौता हो जाए, आपका डेटा सुरक्षित रहता है।';

  @override
  String get secLayer1Title => 'एंड-टू-एंड एन्क्रिप्शन';

  @override
  String get secLayer1Desc =>
      'प्रत्येक संदेश एक अद्वितीय कुंजी से एन्क्रिप्ट किया जाता है। सरल शब्दों में: भले ही कोई एक संदेश डिक्रिप्ट कर ले, वे अगला डिक्रिप्ट नहीं कर पाएंगे। प्रत्येक संदेश का अपना ताला है।';

  @override
  String get secLayer1Detail =>
      'फ़ाइलों (फ़ोटो, वीडियो, दस्तावेज़) के लिए, Hash अतिरिक्त AES-256-GCM एन्क्रिप्शन का उपयोग करता है। फ़ाइल आपके फ़ोन छोड़ने से पहले एन्क्रिप्ट की जाती है।';

  @override
  String get secLayer2Title => 'Sealed Sender (नेटवर्क गुमनामी)';

  @override
  String get secLayer2Desc =>
      'सामान्य मैसेंजर आपके संदेश आपकी पहचान के साथ भेजते हैं। यह लिफ़ाफ़े पर अपना नाम लिखने जैसा है। Hash गुमनाम मेलबॉक्स का उपयोग करता है: सर्वर संदेश वितरित करता है बिना जाने कि किसने भेजा।';

  @override
  String get secLayer2Detail =>
      'परिणाम: सर्वर डेटा लीक होने पर भी, कौन किससे बात करता है यह पुनर्निर्माण करना असंभव है।';

  @override
  String get secLayer3Title => 'स्वचालित हटाना';

  @override
  String get secLayer3Desc =>
      'प्राप्ति की पुष्टि होते ही संदेश सर्वर से हटा दिए जाते हैं। भले ही कोई संदेश कभी प्राप्त न हो, वह 24 घंटे बाद स्वचालित रूप से नष्ट हो जाता है।';

  @override
  String get secLayer3Detail =>
      'आपके फ़ोन पर, संदेश आपकी चुनी अवधि के अनुसार स्वयं नष्ट होते हैं: तुरंत, 5 मिनट, 15 मिनट, 30 मिनट, 1 घंटा, 3 घंटे, 6 घंटे, या 12 घंटे।';

  @override
  String get secLayer4Title => 'स्थानीय पहुंच सुरक्षा';

  @override
  String get secLayer4Desc =>
      'ऐप 6 अंकों के PIN और/या बायोमेट्रिक्स (Face ID, फिंगरप्रिंट) से सुरक्षित है। बहुत अधिक विफल प्रयासों के बाद, ऐप हर विफलता पर बढ़ती विलंबता के साथ लॉक हो जाता है।';

  @override
  String get secLayer5Title => 'लॉक किया हुआ डेटाबेस';

  @override
  String get secLayer5Desc =>
      'सर्वर की तरफ, कोई भी उपयोगकर्ता सीधे डेटाबेस में नहीं लिख सकता। सभी क्रियाएं सुरक्षित फ़ंक्शन से गुज़रती हैं जो हर अनुरोध को सत्यापित करती हैं।';

  @override
  String get secLayer5Detail =>
      'यह बैंक काउंटर जैसा है: आप कभी खुद तिजोरी को नहीं छूते। आप अनुरोध करते हैं, और सिस्टम कार्रवाई करने से पहले सत्यापित करता है कि आपका अधिकार है।';

  @override
  String get secVashLabel => 'दुनिया में अनूठा';

  @override
  String get secVashTitle => 'Vash मोड';

  @override
  String get secVashSubtitle =>
      'एक आपातकालीन सुरक्षा प्रणाली जो किसी अन्य मैसेजिंग ऐप में मौजूद नहीं है।';

  @override
  String get secVashScenarioTitle => 'यह स्थिति कल्पना करें';

  @override
  String get secVashScenario1 => 'कोई आपके फ़ोन तक पहुंच जाता है';

  @override
  String get secVashScenario2 => 'आपसे PIN कोड मांगा जाता है';

  @override
  String get secVashScenario3 => 'आप तत्काल अपना सारा डेटा मिटाना चाहते हैं';

  @override
  String get secVashSolutionTitle => 'समाधान: दो PIN कोड';

  @override
  String get secVashSolutionDesc =>
      'आप Hash में दो अलग-अलग PIN कोड कॉन्फ़िगर करते हैं:';

  @override
  String get secVashNormalCodeLabel => 'सामान्य कोड';

  @override
  String get secVashNormalCodeDesc =>
      'आपके सभी डेटा के साथ ऐप सामान्य रूप से खोलता है';

  @override
  String get secVashCodeLabel2 => 'Vash कोड';

  @override
  String get secVashCodeDescription =>
      'ऐप सामान्य रूप से खोलता है... लेकिन आपका सारा डेटा पृष्ठभूमि में चुपचाप हटा दिया जाता है';

  @override
  String get secVashWhatHappensTitle => 'फिर क्या होता है';

  @override
  String get secVashWhatHappensDesc =>
      'ऐप सामान्य रूप से खुलता है। कोई अलर्ट नहीं, कोई संदिग्ध एनिमेशन नहीं। स्क्रीन बस एक खाली ऐप दिखाती है, जैसे आपने इसे अभी इंस्टॉल किया हो।\n\nवास्तव में, आपकी सभी बातचीत, संपर्क और संदेश एक सेकंड के अंश में अपरिवर्तनीय रूप से हटा दिए गए हैं।';

  @override
  String get secCallsLabel => 'कॉल और फ़ाइलें';

  @override
  String get secCallsTitle => 'सब कुछ एन्क्रिप्टेड है';

  @override
  String get secCallsSubtitle =>
      'यह केवल संदेशों के बारे में नहीं है। Hash से गुज़रने वाली हर चीज़ एंड-टू-एंड एन्क्रिप्टेड है।';

  @override
  String get secAudioCallTitle => 'ऑडियो कॉल';

  @override
  String get secAudioCallDesc =>
      'WebRTC के माध्यम से एंड-टू-एंड एन्क्रिप्टेड। आवाज़ सीधे डिवाइस के बीच प्रसारित होती है।';

  @override
  String get secVideoCallTitle => 'वीडियो कॉल';

  @override
  String get secVideoCallDesc =>
      'वही तकनीक, प्रत्येक स्ट्रीम अलग-अलग एन्क्रिप्टेड।';

  @override
  String get secPhotosTitle => 'फ़ोटो और वीडियो';

  @override
  String get secPhotosDesc =>
      'आपके फ़ोन छोड़ने से पहले AES-256-GCM में एन्क्रिप्टेड।';

  @override
  String get secDocsTitle => 'दस्तावेज़';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, कोई भी फ़ाइल। नाम, आकार और सामग्री एन्क्रिप्टेड।';

  @override
  String get secAnonLabel => 'गुमनामी';

  @override
  String get secAnonTitle => 'कोई पहचान आवश्यक नहीं';

  @override
  String get secAnonSubtitle =>
      'Hash कभी आपका फ़ोन नंबर या ईमेल नहीं मांगता। आपकी पहचान एक अद्वितीय और गुमनाम Hash ID से होती है।';

  @override
  String get secHashIdTitle => 'आपका Hash ID';

  @override
  String get secHashIdDesc =>
      'यह आपका अद्वितीय पहचानकर्ता है। यह आपके बारे में कुछ भी प्रकट नहीं करता: न आपका नाम, न आपका नंबर, न आपका स्थान। यह एक ऐसा उपनाम है जिसे आपकी वास्तविक पहचान से जोड़ना असंभव है।\n\nसंपर्क जोड़ने के लिए, आप अपना Hash ID शेयर करते हैं या QR कोड स्कैन करते हैं। बस। कोई सिंक्रनाइज़ एड्रेस बुक नहीं, कोई \"आप शायद इन्हें जानते हैं\" सुझाव नहीं।';

  @override
  String get secDataLabel => 'डेटा';

  @override
  String get secDataTitle => 'Hash क्या नहीं जानता';

  @override
  String get secDataSubtitle =>
      'आपके डेटा की रक्षा का सबसे अच्छा तरीका है उसे एकत्र न करना।';

  @override
  String get secNeverCollected => 'कभी एकत्र नहीं किया';

  @override
  String get secNeverItem1 => 'संदेश सामग्री';

  @override
  String get secNeverItem2 => 'संपर्क सूची';

  @override
  String get secNeverItem3 => 'फ़ोन नंबर';

  @override
  String get secNeverItem4 => 'ईमेल पता';

  @override
  String get secNeverItem5 => 'IP पता';

  @override
  String get secNeverItem6 => 'स्थान';

  @override
  String get secNeverItem7 => 'मेटाडेटा (कौन किससे बात करता है)';

  @override
  String get secNeverItem8 => 'कॉल इतिहास';

  @override
  String get secNeverItem9 => 'एड्रेस बुक';

  @override
  String get secNeverItem10 => 'विज्ञापन पहचानकर्ता';

  @override
  String get secTempStored => 'अस्थायी रूप से संग्रहीत';

  @override
  String get secTempItem1 => 'गुमनाम Hash ID (अद्वितीय पहचानकर्ता)';

  @override
  String get secTempItem2 => 'सार्वजनिक एन्क्रिप्शन कुंजियां';

  @override
  String get secTempItem3 =>
      'ट्रांज़िट में एन्क्रिप्टेड संदेश (अधिकतम 24 घंटे)';

  @override
  String get secTempNote =>
      'यह न्यूनतम डेटा भी आपकी पहचान नहीं कर सकता। आपका Hash ID किसी भी व्यक्तिगत जानकारी से जुड़ा नहीं है।';

  @override
  String get secFooterTitle => 'आपकी गोपनीयता, आपकी स्वतंत्रता';

  @override
  String get secFooterDesc =>
      'Hash उन्हीं एन्क्रिप्शन तकनीकों का उपयोग करता है जो सबसे कठोर पेशेवर एप्लिकेशन करते हैं। आपके संदेश गणित द्वारा सुरक्षित हैं, वादों से नहीं।';

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
