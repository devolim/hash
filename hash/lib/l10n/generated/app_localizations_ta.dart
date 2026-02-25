// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'தடமில்லை. சமரசமில்லை.';

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
  String get conversations => 'உரையாடல்கள்';

  @override
  String get contacts => 'தொடர்புகள்';

  @override
  String get noConversation => 'உரையாடல்கள் இல்லை';

  @override
  String get noConversationSubtitle =>
      'பாதுகாப்பாக உரையாடத் தொடர்பைச் சேர்க்கவும்';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count நிலுவை கோரிக்கைகள்',
      one: '1 நிலுவை கோரிக்கை',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count அனுப்பிய கோரிக்கைகள் நிலுவையில்',
      one: '1 அனுப்பிய கோரிக்கை நிலுவையில்',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'தொடர்பைச் சேர்';

  @override
  String get shareApp => 'செயலியைப் பகிர்';

  @override
  String get newMessage => 'புதிய செய்தி';

  @override
  String get newConversation => 'செய்தி அனுப்பு';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get myHashId => 'எனது Hash ID';

  @override
  String get supportHash => 'Hash-ஐ ஆதரி';

  @override
  String get supportHashSubtitle => 'Hash ஒரு இலாப நோக்கற்ற திட்டம்';

  @override
  String get donate => 'நன்கொடை';

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get theme => 'தீம்';

  @override
  String get themeAuto => 'தானியங்கு';

  @override
  String get themeAutoSubtitle => 'கணினி அமைப்புகளைப் பின்பற்றும்';

  @override
  String get themeDark => 'இருண்ட';

  @override
  String get themeLight => 'ஒளிர்';

  @override
  String get themeRecommendation =>
      'சிறந்த தனியுரிமைக்கு இருண்ட தீம் பரிந்துரைக்கப்படுகிறது';

  @override
  String get language => 'மொழி';

  @override
  String get languageAuto => 'தானியங்கு (கணினி)';

  @override
  String get notifications => 'அறிவிப்புகள்';

  @override
  String get messages => 'செய்திகள்';

  @override
  String get calls => 'அழைப்புகள்';

  @override
  String get vibration => 'அதிர்வு';

  @override
  String get notificationContent => 'அறிவிப்பு உள்ளடக்கம்';

  @override
  String get notificationContentFull => 'அனைத்தையும் காட்டு';

  @override
  String get notificationContentFullDesc =>
      'தொடர்பு பெயர் மற்றும் செய்தி முன்னோட்டம்';

  @override
  String get notificationContentName => 'பெயர் மட்டும்';

  @override
  String get notificationContentNameDesc => 'தொடர்பு பெயரை மட்டும் காட்டும்';

  @override
  String get notificationContentDiscrete => 'மறைமுகமான';

  @override
  String get notificationContentDiscreteDesc =>
      '\"புதிய செய்தி\" என்று மட்டும் காட்டும்';

  @override
  String get security => 'பாதுகாப்பு';

  @override
  String get howHashProtectsYou => 'Hash உங்களை எப்படிப் பாதுகாக்கிறது';

  @override
  String get howHashProtectsYouSubtitle =>
      'உங்கள் பாதுகாப்பைப் புரிந்துகொள்ளுங்கள்';

  @override
  String get accountSecurity => 'கணக்கு பாதுகாப்பு';

  @override
  String get accountSecuritySubtitle => 'PIN, உயிரியல் அளவீடு, Vash பயன்முறை';

  @override
  String get blockScreenshots => 'திரைப்பிடிப்புகளைத் தடு';

  @override
  String get transferDevice => 'மற்றொரு சாதனத்திற்கு மாற்று';

  @override
  String get transferDeviceSubtitle => 'உங்கள் கணக்கை இடமாற்றம் செய்யுங்கள்';

  @override
  String get pinCode => 'PIN குறியீடு';

  @override
  String get changePin => 'PIN குறியீட்டை மாற்று';

  @override
  String get currentPin => 'தற்போதைய PIN குறியீடு';

  @override
  String get newPin => 'புதிய PIN குறியீடு';

  @override
  String get confirmPin => 'PIN குறியீட்டை உறுதிசெய்';

  @override
  String get pinChanged => 'PIN குறியீடு மாற்றப்பட்டது';

  @override
  String get incorrectPin => 'தவறான PIN';

  @override
  String get pinsDoNotMatch => 'PIN-கள் பொருந்தவில்லை';

  @override
  String get autoLock => 'தானியங்கு பூட்டு';

  @override
  String get autoLockDelay => 'பூட்டு தாமதம்';

  @override
  String get autoLockImmediate => 'உடனடி';

  @override
  String get autoLockMinute => '1 நிமிடம்';

  @override
  String autoLockMinutes(int count) {
    return '$count நிமிடங்கள்';
  }

  @override
  String get vashCode => 'Vash குறியீடு';

  @override
  String get vashModeTitle => 'Vash பயன்முறை';

  @override
  String get vashModeExplanation => 'உங்கள் இறுதிப் பாதுகாப்பு வலை.';

  @override
  String get vashModeDescription =>
      'நீங்கள் இரண்டாவது PIN குறியீட்டைத் தேர்வு செய்வீர்கள். எப்போதாவது Hash-ஐத் திறக்கக் கட்டாயப்படுத்தப்பட்டால், உங்கள் வழக்கமான PIN-க்குப் பதிலாக இந்தக் குறியீட்டை உள்ளிடுங்கள்.\n\nசெயலி சாதாரணமாகத் திறக்கும், ஆனால் உங்கள் அனைத்து உரையாடல்களும் தொடர்புகளும் மறைந்திருக்கும்.\n\nஉங்கள் திரையைப் பார்க்கும் எவருக்கும், Hash வெறுமையாகத் தோன்றும் — நீங்கள் இதை ஒருபோதும் பயன்படுத்தாதது போல.';

  @override
  String get vashModeIrreversible =>
      'இந்த செயல் அமைதியானது மற்றும் மீளமுடியாதது.';

  @override
  String get chooseVashCode => 'எனது Vash குறியீட்டைத் தேர்வு செய்';

  @override
  String get vashCodeInfo =>
      'செயலியை சாதாரணமாகத் திறக்கும் இரண்டாவது PIN குறியீடு, ஆனால் காலியாக.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'உங்கள் PIN-க்குப் பதிலாக இந்தக் குறியீட்டை உள்ளிட்டால்:';

  @override
  String get vashDeleteContacts => 'உங்கள் தொடர்புகள் மறையும்';

  @override
  String get vashDeleteMessages => 'உங்கள் உரையாடல்கள் மறையும்';

  @override
  String get vashDeleteHistory => 'உங்கள் குறிப்புகள் மறையும்';

  @override
  String get vashKeepId =>
      'உங்கள் Hash அடையாளம் (#XXX-XXX-XXX) அப்படியே இருக்கும்';

  @override
  String get vashAppearNormal =>
      'செயலி சாதாரணமாக ஆனால் காலியாகத் தோன்றும், புதியது போல. இந்தச் செயல் மீளமுடியாதது.';

  @override
  String get setupVashCode => 'Vash குறியீட்டை அமை';

  @override
  String get modifyVashCode => 'Vash குறியீட்டை மாற்று';

  @override
  String get currentVashCode => 'தற்போதைய Vash குறியீடு';

  @override
  String get newVashCode => 'புதிய Vash குறியீடு';

  @override
  String get confirmVashCode => 'Vash குறியீட்டை உறுதிசெய்';

  @override
  String get vashCodeConfigured => 'Vash குறியீடு அமைக்கப்பட்டது';

  @override
  String get vashCodeModified => 'Vash குறியீடு மாற்றப்பட்டது';

  @override
  String get vashCodeMustDiffer =>
      'Vash குறியீடு PIN-இலிருந்து வேறுபட்டதாக இருக்க வேண்டும்';

  @override
  String get incorrectVashCode => 'தவறான Vash குறியீடு';

  @override
  String get vashWhatToDelete => 'Vash பயன்முறை எதை மறையச் செய்ய வேண்டும்?';

  @override
  String get vashDeleteContactsOption => 'தொடர்புகள்';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'செய்திகள்';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'குறிப்புகள்';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash பயன்முறை செயல்படுத்தப்பட்டது';

  @override
  String get vashCreateSubtitle =>
      'உங்கள் முக்கிய PIN-இலிருந்து வேறுபட்ட குறியீட்டைத் தேர்வு செய்யுங்கள்';

  @override
  String get vashConfirmSubtitle => 'உங்கள் Vash குறியீட்டை உறுதிசெய்யுங்கள்';

  @override
  String get pinCodeForEntry => 'செயலியில் நுழைவதற்கான PIN குறியீடு';

  @override
  String get vashCodeSection => 'Vash பயன்முறை';

  @override
  String get biometric => 'உயிரியல் அளவீடு';

  @override
  String get biometricUnlock => 'கைரேகை அல்லது Face ID மூலம் திற';

  @override
  String get enableBiometric => 'உயிரியல் அளவீட்டை இயக்கு';

  @override
  String get biometricWarningMessage =>
      'உயிரியல் அளவீட்டை இயக்கினால், செயலியில் நுழைய உங்கள் Vash குறியீட்டைப் பயன்படுத்த முடியாது.\n\nஉயிரியல் அளவீடு தோல்வியுற்றால் மட்டுமே (பல தோல்வியான முயற்சிகளுக்குப் பிறகு) Vash குறியீட்டைப் பயன்படுத்த முடியும்.\n\nதொடர விரும்புகிறீர்களா?';

  @override
  String get understood => 'புரிந்துகொண்டேன்';

  @override
  String get shareAppSubtitle => 'Hash-ஐ உங்கள் நெருங்கியவர்களுடன் பகிருங்கள்';

  @override
  String get share => 'பகிர்';

  @override
  String get danger => 'ஆபத்து';

  @override
  String get deleteAccount => 'எனது கணக்கை நீக்கு';

  @override
  String get deleteAccountSubtitle => 'மீளமுடியாத செயல்';

  @override
  String get deleteAccountConfirmTitle => 'எனது கணக்கை நீக்கு';

  @override
  String get deleteAccountConfirmMessage =>
      'உங்கள் கணக்கு நிரந்தரமாக நீக்கப்படும். இந்தச் செயல் மீளமுடியாதது.\n\n• உங்கள் அனைத்து உரையாடல்கள்\n• உங்கள் அனைத்து தொடர்புகள்\n• உங்கள் Hash ID\n\nபுதிய கணக்கை உருவாக்க வேண்டும்.';

  @override
  String get deleteForever => 'நிரந்தரமாக நீக்கு';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash பயன்முறை செயல்படுத்தப்பட்டது.';

  @override
  String deletionError(String error) {
    return 'நீக்குவதில் பிழை: $error';
  }

  @override
  String get yourSecurity => 'உங்கள் பாதுகாப்பு';

  @override
  String get securityInfo =>
      '• முழுமையான குறியாக்கம் (Signal Protocol)\n• வழங்கலுக்குப் பிறகு எங்கள் சேவையகங்களில் தரவு இல்லை\n• விசைகள் உங்கள் சாதனத்தில் மட்டுமே சேமிக்கப்படும்\n• PIN குறியீடு ஒருபோதும் சேவையகத்திற்கு அனுப்பப்படாது';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'வரவேற்பு';

  @override
  String get securityStatement1 => 'உங்கள் செய்திகள் பாதுகாக்கப்படுகின்றன.';

  @override
  String get securityStatement2 => 'முழுமையான குறியாக்கம்.';

  @override
  String get securityStatement3 => 'தடமில்லை. சமரசமில்லை.';

  @override
  String get securityStatement4 => 'உங்கள் தனியுரிமை ஒரு உரிமை.';

  @override
  String get accessBlocked => 'அணுகல் தடுக்கப்பட்டது';

  @override
  String get tooManyAttempts =>
      'அதிகமான முயற்சிகள். பின்னர் மீண்டும் முயற்சிக்கவும்.';

  @override
  String get pleaseWait => 'காத்திருங்கள்';

  @override
  String get waitDelay => 'தாமதம் முடியும் வரை காத்திருங்கள்';

  @override
  String attemptCount(int current, int max) {
    return 'முயற்சி $current / $max';
  }

  @override
  String retryIn(String time) {
    return '$time இல் மீண்டும் முயற்சிக்கவும்';
  }

  @override
  String get forgotPin =>
      'PIN மறந்துவிட்டதா? மீட்பு சொற்றொடரைப் பயன்படுத்துங்கள்';

  @override
  String get useRecoveryPhrase => 'மீட்பு சொற்றொடரைப் பயன்படுத்து';

  @override
  String get recoveryWarningTitle => 'எச்சரிக்கை';

  @override
  String get recoveryWarningMessage => 'கணக்கு மீட்பு:';

  @override
  String get recoveryDeleteAllMessages =>
      'உங்கள் அனைத்து செய்திகளையும் நீக்கும்';

  @override
  String get recoveryWaitDelay => '1 மணி நேரக் காத்திருப்பு தேவை';

  @override
  String get recoveryKeepContacts => 'உங்கள் தொடர்புகளை வைத்திருக்கும்';

  @override
  String get recoveryIrreversible =>
      'இந்தச் செயல் மீளமுடியாதது. உங்கள் செய்திகள் நிரந்தரமாக இழக்கப்படும்.';

  @override
  String get iUnderstand => 'புரிந்துகொண்டேன்';

  @override
  String get accountRecovery => 'கணக்கு மீட்பு';

  @override
  String get enterRecoveryPhrase =>
      'உங்கள் மீட்பு சொற்றொடரின் 24 வார்த்தைகளை இடைவெளிகளால் பிரித்து உள்ளிடுங்கள்.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'மீட்டெடு';

  @override
  String get recoveryPhraseRequired => 'உங்கள் மீட்பு சொற்றொடரை உள்ளிடுங்கள்';

  @override
  String get recoveryPhrase24Words =>
      'சொற்றொடரில் சரியாக 24 வார்த்தைகள் இருக்க வேண்டும்';

  @override
  String get incorrectRecoveryPhrase => 'தவறான மீட்பு சொற்றொடர்';

  @override
  String get recoveryInitError => 'மீட்பு தொடக்கத்தில் பிழை';

  @override
  String get securityDelay => 'பாதுகாப்பு தாமதம்';

  @override
  String get securityDelayMessage =>
      'உங்கள் பாதுகாப்பிற்காக, புதிய PIN உருவாக்குவதற்கு முன் காத்திருப்பு காலம் தேவை.';

  @override
  String get timeRemaining => 'மீதமுள்ள நேரம்';

  @override
  String get messagesDeletedForProtection =>
      'உங்கள் பாதுகாப்பிற்காக செய்திகள் நீக்கப்பட்டன.';

  @override
  String get canCloseApp => 'செயலியை மூடிவிட்டு பின்னர் திரும்பி வரலாம்.';

  @override
  String get onboardingTitle1 => 'Hash-க்கு வரவேற்பு';

  @override
  String get onboardingSubtitle1 => 'தடம் விடாத தூதுவர்';

  @override
  String get onboardingTitle2 => 'முழுமையான குறியாக்கம்';

  @override
  String get onboardingSubtitle2 =>
      'உங்கள் செய்திகள் Signal Protocol மூலம் முழுமையாக குறியாக்கம் செய்யப்படுகின்றன';

  @override
  String get onboardingTitle3 => 'தடமில்லை';

  @override
  String get onboardingSubtitle3 =>
      'செய்திகள் வழங்கப்பட்டவுடன் சேவையகங்களிலிருந்து நீக்கப்படும்';

  @override
  String get onboardingTitle4 => 'உங்கள் பாதுகாப்பு';

  @override
  String get onboardingSubtitle4 =>
      'PIN குறியீடு, Vash பயன்முறை மற்றும் மீட்பு சொற்றொடர்';

  @override
  String get getStarted => 'தொடங்கு';

  @override
  String get next => 'அடுத்து';

  @override
  String get skip => 'தவிர்';

  @override
  String get alreadyHaveAccount => 'ஏற்கனவே கணக்கு உள்ளது';

  @override
  String get transferMyAccount => 'எனது கணக்கை மாற்று';

  @override
  String get createPin => 'PIN குறியீட்டை உருவாக்கு';

  @override
  String get createPinSubtitle =>
      'இந்தக் குறியீடு உங்கள் செயலி அணுகலைப் பாதுகாக்கும்';

  @override
  String get confirmYourPin => 'உங்கள் PIN குறியீட்டை உறுதிசெய்யுங்கள்';

  @override
  String get confirmPinSubtitle =>
      'உங்கள் PIN குறியீட்டை மீண்டும் உள்ளிடுங்கள்';

  @override
  String get saveRecoveryPhrase => 'மீட்பு சொற்றொடர்';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'இந்த 24 வார்த்தைகளை வரிசையாக எழுதுங்கள். PIN மறந்தால் கணக்கை மீட்டெடுக்க இவை உதவும்.';

  @override
  String get phraseWritten => 'சொற்றொடரை எழுதிவிட்டேன்';

  @override
  String get warningRecoveryPhrase =>
      'இந்தச் சொற்றொடரை இழந்து PIN-ஐ மறந்தால், உங்கள் கணக்கிற்கான அணுகலை இழப்பீர்கள்.';

  @override
  String get accountTransferred => 'கணக்கு மாற்றப்பட்டது';

  @override
  String get accountTransferredMessage =>
      'உங்கள் கணக்கு மற்றொரு சாதனத்திற்கு மாற்றப்பட்டது. இந்த அமர்வு இனி செல்லாது.';

  @override
  String get accountTransferredInfo =>
      'இந்த மாற்றத்தை நீங்கள் தொடங்கவில்லை என்றால், உங்கள் கணக்கு சமரசம் செய்யப்பட்டிருக்கலாம்.';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get transferAccount => 'கணக்கை மாற்று';

  @override
  String get transferAccountInfo =>
      'உங்கள் Hash கணக்கை புதிய சாதனத்திற்கு மாற்றுங்கள். உங்கள் தற்போதைய அமர்வு செல்லாததாகும்.';

  @override
  String get generateTransferCode => 'மாற்றக் குறியீட்டை உருவாக்கு';

  @override
  String get transferCode => 'மாற்றக் குறியீடு';

  @override
  String transferCodeExpires(int minutes) {
    return 'இந்தக் குறியீடு $minutes நிமிடங்களில் காலாவதியாகும்';
  }

  @override
  String get enterCodeOnNewDevice =>
      'உங்கள் கணக்கை மாற்ற புதிய சாதனத்தில் இந்தக் குறியீட்டை உள்ளிடுங்கள்.';

  @override
  String get generateNewCode => 'புதிய குறியீட்டை உருவாக்கு';

  @override
  String get scanQrCode => 'QR குறியீட்டை ஸ்கேன் செய்';

  @override
  String get scanQrCodeSubtitle =>
      'தொடர்பின் QR குறியீட்டை ஸ்கேன் செய்து சேர்க்கவும்';

  @override
  String get qrCodeDetected => 'QR குறியீடு கண்டறியப்பட்டது';

  @override
  String get invalidQrCode => 'தவறான QR குறியீடு';

  @override
  String get cameraPermissionRequired => 'கேமரா அனுமதி தேவை';

  @override
  String get myQrCode => 'எனது QR குறியீடு';

  @override
  String get myQrCodeSubtitle =>
      'உங்கள் தொடர்புகள் உங்களைச் சேர்க்க இந்த QR குறியீட்டைப் பகிருங்கள்';

  @override
  String get shareQrCode => 'பகிர்';

  @override
  String get addContactTitle => 'தொடர்பைச் சேர்';

  @override
  String get addContactByHashId => 'உங்கள் தொடர்பின் Hash ID-ஐ உள்ளிடுங்கள்';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'தேடு';

  @override
  String get contactNotFound => 'தொடர்பு கிடைக்கவில்லை';

  @override
  String get contactAlreadyAdded =>
      'இந்தத் தொடர்பு ஏற்கனவே உங்கள் பட்டியலில் உள்ளது';

  @override
  String get contactAdded => 'தொடர்பு சேர்க்கப்பட்டது';

  @override
  String get myProfile => 'எனது சுயவிவரம்';

  @override
  String get myProfileSubtitle =>
      'மற்றவர்கள் உங்களைச் சேர்க்க இந்தத் தகவலைப் பகிருங்கள்';

  @override
  String get temporaryCode => 'தற்காலிகக் குறியீடு';

  @override
  String temporaryCodeExpires(String time) {
    return '$time இல் காலாவதியாகும்';
  }

  @override
  String get codeExpired => 'குறியீடு காலாவதியானது';

  @override
  String get generateNewCodeButton => 'புதிய குறியீடு';

  @override
  String get copyHashId => 'ID-ஐ நகலெடு';

  @override
  String get copyCode => 'குறியீட்டை நகலெடு';

  @override
  String get copiedToClipboard => 'நகலெடுக்கப்பட்டது';

  @override
  String get showMyQrCode => 'எனது QR குறியீட்டைக் காட்டு';

  @override
  String get orDivider => 'அல்லது';

  @override
  String get openScanner => 'ஸ்கேனரைத் திற';

  @override
  String get addManually => 'கைமுறையாகச் சேர்';

  @override
  String get contactHashIdLabel => 'தொடர்பின் Hash ID';

  @override
  String get temporaryCodeLabel => 'தற்காலிகக் குறியீடு';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'உங்கள் தொடர்பிடம் அவரது சுயவிவரத்திலிருந்து குறியீட்டை உருவாக்கச் சொல்லுங்கள்';

  @override
  String get verifyAndAdd => 'சரிபார்த்துச் சேர்';

  @override
  String get fillAllFields => 'அனைத்து புலங்களையும் நிரப்புங்கள்';

  @override
  String get invalidHashIdFormat => 'தவறான ID வடிவம் (எ.கா.: 123-456-ABC)';

  @override
  String get userNotFound => 'பயனர் கிடைக்கவில்லை';

  @override
  String get cannotAddYourself => 'உங்களையே சேர்க்க முடியாது';

  @override
  String get invalidOrExpiredCode =>
      'தவறான அல்லது காலாவதியான தற்காலிகக் குறியீடு';

  @override
  String get contactFound => 'தொடர்பு கண்டுபிடிக்கப்பட்டது!';

  @override
  String get howToCallContact => 'அவர்களை எப்படி அழைக்க விரும்புகிறீர்கள்?';

  @override
  String get contactNameHint => 'தொடர்பு பெயர்';

  @override
  String get addContactButton => 'சேர்';

  @override
  String get contactDetails => 'தொடர்பு விவரங்கள்';

  @override
  String get contactName => 'தொடர்பு பெயர்';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date அன்று சேர்க்கப்பட்டது';
  }

  @override
  String get deleteContact => 'தொடர்பை நீக்கு';

  @override
  String deleteContactConfirm(Object name) {
    return 'இந்தத் தொடர்பை நீக்கவா?';
  }

  @override
  String get deleteContactMessage => 'இது முழு உரையாடலையும் நீக்கும்.';

  @override
  String get delete => 'நீக்கு';

  @override
  String get typeMessage => 'செய்தியை எழுதுங்கள்...';

  @override
  String get messageSent => 'அனுப்பப்பட்டது';

  @override
  String get messageDelivered => 'வழங்கப்பட்டது';

  @override
  String get messageRead => 'படிக்கப்பட்டது';

  @override
  String get messageFailed => 'அனுப்புவது தோல்வியுற்றது';

  @override
  String get now => 'இப்போது';

  @override
  String minutesAgo(int count) {
    return '$countநிமி';
  }

  @override
  String hoursAgo(int count) {
    return '$countம.நே';
  }

  @override
  String daysAgo(int count) {
    return '$countநா';
  }

  @override
  String get today => 'இன்று';

  @override
  String get yesterday => 'நேற்று';

  @override
  String dateAtTime(String date, String time) {
    return '$date $time மணிக்கு';
  }

  @override
  String get shareMessage =>
      'Hash-இல் என்னுடன் இணையுங்கள்! 🔒\n\nஇது உண்மையிலேயே தனிப்பட்ட தூதுவர்: முழுமையான குறியாக்கம், சேவையகங்களில் தடமில்லை, தேவைப்பட்டால் அவசரப் பயன்முறை.\n\nசெயலியைப் பதிவிறக்குங்கள் 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'பிழை';

  @override
  String get ok => 'சரி';

  @override
  String get view => 'பார்';

  @override
  String get yes => 'ஆம்';

  @override
  String get no => 'இல்லை';

  @override
  String get save => 'சேமி';

  @override
  String get edit => 'திருத்து';

  @override
  String get close => 'மூடு';

  @override
  String get confirm => 'உறுதிசெய்';

  @override
  String get loading => 'ஏற்றுகிறது...';

  @override
  String get retry => 'மீண்டும் முயற்சி';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'நிலுவை கோரிக்கைகள்';

  @override
  String get noPendingRequests => 'நிலுவை கோரிக்கைகள் இல்லை';

  @override
  String get pendingRequestsSubtitle =>
      'இவர்கள் உங்களைச் சேர்க்க விரும்புகிறார்கள்';

  @override
  String requestFromUser(String hashId) {
    return '$hashId இலிருந்து கோரிக்கை';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days நாட்களில் காலாவதியாகும்';
  }

  @override
  String get acceptRequest => 'ஏற்கவும்';

  @override
  String get rejectRequest => 'நிராகரி';

  @override
  String get requestAccepted => 'கோரிக்கை ஏற்கப்பட்டது';

  @override
  String get requestRejected => 'கோரிக்கை நிராகரிக்கப்பட்டது';

  @override
  String get requestSent => 'கோரிக்கை அனுப்பப்பட்டது!';

  @override
  String get requestSentSubtitle =>
      'உங்கள் கோரிக்கை அனுப்பப்பட்டது. நீங்கள் உரையாடுவதற்கு முன் பயனர் அதை ஏற்க வேண்டும்.';

  @override
  String get requestAlreadyPending => 'ஒரு கோரிக்கை ஏற்கனவே நிலுவையில் உள்ளது';

  @override
  String get requestAlreadySentByOther =>
      'இந்த நபர் ஏற்கனவே உங்களுக்கு ஒரு கோரிக்கை அனுப்பியுள்ளார்';

  @override
  String get addByHashId => 'Hash ID மூலம் சேர்';

  @override
  String get addByHashIdSubtitle =>
      'தொடர்பின் Hash ID மற்றும் தற்காலிகக் குறியீட்டை உள்ளிடுங்கள்';

  @override
  String get enterTemporaryCode => '6 இலக்கக் குறியீட்டை உள்ளிடுங்கள்';

  @override
  String get sendRequest => 'கோரிக்கை அனுப்பு';

  @override
  String get acceptContactTitle => 'தொடர்பை ஏற்கவும்';

  @override
  String get acceptContactSubtitle =>
      'நீங்கள் அவர்களுக்கு ஒரு தனிப்பயன் பெயரைக் கொடுக்கலாம்';

  @override
  String get leaveEmptyForHashId => 'Hash ID-ஐப் பயன்படுத்த காலியாக விடுங்கள்';

  @override
  String get firstName => 'முதல் பெயர்';

  @override
  String get lastName => 'குடும்பப் பெயர்';

  @override
  String get notes => 'குறிப்புகள்';

  @override
  String get notesHint => 'இந்தத் தொடர்பைப் பற்றிய தனிப்பட்ட குறிப்புகள்';

  @override
  String get photoOptional => 'புகைப்படம் (விருப்பத்தேர்வு)';

  @override
  String get contactNameOptional => 'பெயர் (விருப்பத்தேர்வு)';

  @override
  String get notesOptional => 'குறிப்புகள் (விருப்பத்தேர்வு)';

  @override
  String get storedLocally => 'உங்கள் சாதனத்தில் மட்டும் சேமிக்கப்படும்';

  @override
  String get encryptedMessageLabel => 'குறியாக்கம் செய்யப்பட்ட செய்தி';

  @override
  String get identityMessageHint =>
      'நீங்கள் யார்? எப்படி ஒருவரை ஒருவர் அறிவீர்கள்?';

  @override
  String get messageWillBeSentEncrypted =>
      'இந்தச் செய்தி குறியாக்கம் செய்யப்பட்டு பெறுநருக்கு அனுப்பப்படும்';

  @override
  String get sendRequestButton => 'கோரிக்கை அனுப்பு';

  @override
  String get requestExpiresIn24h =>
      'ஏற்கப்படாவிட்டால் கோரிக்கை 24 மணி நேரத்தில் காலாவதியாகும்';

  @override
  String get theyAlreadySentYouRequest =>
      'இந்த நபர் ஏற்கனவே உங்களுக்கு கோரிக்கை அனுப்பியுள்ளார்';

  @override
  String get requests => 'கோரிக்கைகள்';

  @override
  String get receivedRequests => 'பெறப்பட்டவை';

  @override
  String get sentRequests => 'அனுப்பப்பட்டவை';

  @override
  String get noSentRequests => 'அனுப்பிய கோரிக்கைகள் இல்லை';

  @override
  String get cancelRequest => 'ரத்துசெய்';

  @override
  String get deleteRequest => 'கோரிக்கையை நீக்கு';

  @override
  String get requestCancelled => 'கோரிக்கை ரத்துசெய்யப்பட்டது';

  @override
  String sentTo(String hashId) {
    return '$hashId-க்கு அனுப்பப்பட்டது';
  }

  @override
  String expiresIn(String time) {
    return '$time இல் காலாவதியாகும்';
  }

  @override
  String receivedAgo(String time) {
    return '$time முன் பெறப்பட்டது';
  }

  @override
  String get messageFromRequester => 'கோரிக்கையாளரிடமிருந்து செய்தி';

  @override
  String get copy => 'நகலெடு';

  @override
  String get messageInfo => 'செய்தி தகவல்';

  @override
  String get messageDirection => 'திசை';

  @override
  String get messageSentByYou => 'உங்களால் அனுப்பப்பட்டது';

  @override
  String get messageReceived => 'பெறப்பட்டது';

  @override
  String get messageSentAt => 'அனுப்பிய நேரம்';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'நிலை';

  @override
  String get messageReadAt => 'படிக்கப்பட்ட நேரம்';

  @override
  String get messageType => 'வகை';

  @override
  String get messageSize => 'அளவு';

  @override
  String get messageExpiresAt => 'காலாவதியாகும் நேரம்';

  @override
  String get messageEncrypted => 'முழுமையாக குறியாக்கம் செய்யப்பட்டது';

  @override
  String get messageStatusSending => 'அனுப்புகிறது...';

  @override
  String get messageStatusSent => 'அனுப்பப்பட்டது';

  @override
  String get messageStatusDelivered => 'வழங்கப்பட்டது';

  @override
  String get messageStatusRead => 'படிக்கப்பட்டது';

  @override
  String get messageStatusFailed => 'தோல்வி';

  @override
  String get serverStatus => 'சேவையகம்';

  @override
  String get onServer => 'வழங்கலுக்கு நிலுவையில்';

  @override
  String get deletedFromServer => 'நீக்கப்பட்டது';

  @override
  String get messageTypeText => 'உரை';

  @override
  String get messageTypeImage => 'படம்';

  @override
  String get messageTypeVideo => 'வீடியோ';

  @override
  String get messageTypeVoice => 'குரல்';

  @override
  String get messageTypeFile => 'கோப்பு';

  @override
  String get indefinitely => 'வரையறையின்றி';

  @override
  String get hoursShort => 'ம.நே';

  @override
  String get minutesShort => 'நிமி';

  @override
  String get hours => 'மணி நேரம்';

  @override
  String get minutes => 'நிமிடங்கள்';

  @override
  String get seconds => 'விநாடிகள்';

  @override
  String get ephemeralMessages => 'நிலையற்ற செய்திகள்';

  @override
  String get ephemeralMessagesDescription =>
      'இந்த நேரத்திற்குப் பிறகு செய்திகள் தானாக நீக்கப்படும்';

  @override
  String get ephemeralImmediate => 'உடனடி (படித்த பிறகு)';

  @override
  String get ephemeralImmediateDesc => 'படிக்கப்பட்டவுடன் நீக்கப்படும்';

  @override
  String get ephemeralMyPreference => 'எனது விருப்பம்';

  @override
  String get ephemeralMyPreferenceDesc => 'உலகளாவிய அமைப்பைப் பயன்படுத்து';

  @override
  String get ephemeralDefaultSetting => 'செய்தி காலம்';

  @override
  String get ephemeralChooseDefault => 'பரிந்துரைக்கப்பட்டது';

  @override
  String get ephemeral30Seconds => '30 விநாடிகள்';

  @override
  String get ephemeral30SecondsDesc =>
      'படிக்கப்பட்ட 30 விநாடிகளுக்குப் பிறகு நீக்கப்படும்';

  @override
  String get ephemeral5Minutes => '5 நிமிடங்கள்';

  @override
  String get ephemeral5MinutesDesc =>
      'படிக்கப்பட்ட 5 நிமிடங்களுக்குப் பிறகு நீக்கப்படும்';

  @override
  String get ephemeral1Hour => '1 மணி நேரம்';

  @override
  String get ephemeral1HourDesc =>
      'படிக்கப்பட்ட 1 மணி நேரத்திற்குப் பிறகு நீக்கப்படும்';

  @override
  String get ephemeral3Hours => '3 மணி நேரம்';

  @override
  String get ephemeral6Hours => '6 மணி நேரம்';

  @override
  String get ephemeral6HoursDesc =>
      'படிக்கப்பட்ட 6 மணி நேரத்திற்குப் பிறகு நீக்கப்படும்';

  @override
  String get ephemeral12Hours => '12 மணி நேரம்';

  @override
  String get ephemeral24Hours => '24 மணி நேரம்';

  @override
  String get ephemeral24HoursDesc =>
      'படிக்கப்பட்ட 24 மணி நேரத்திற்குப் பிறகு நீக்கப்படும்';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'தனிப்பயன் காலம்';

  @override
  String get howItWorks => 'எப்படி வேலை செய்கிறது';

  @override
  String get ephemeralExplanation1 =>
      'செய்திகள் பெறப்பட்டவுடன் சேவையகத்திலிருந்து நீக்கப்படும்.';

  @override
  String get ephemeralExplanation2 =>
      'இந்த அமைப்பு படிக்கப்பட்ட பிறகு உங்கள் தொலைபேசியில் செய்திகள் எப்போது மறையும் என்பதை வரையறுக்கிறது.';

  @override
  String get ephemeralExplanation3 =>
      'உங்கள் தொடர்புக்கு அவரது தொலைபேசிக்கான சொந்த அமைப்பு உள்ளது.';

  @override
  String get mute1Hour => '1 மணி நேரம்';

  @override
  String get mute8Hours => '8 மணி நேரம்';

  @override
  String get mute1Day => '1 நாள்';

  @override
  String get mute1Week => '1 வாரம்';

  @override
  String get muteAlways => 'எப்போதும்';

  @override
  String get muteExplanation => 'இந்தத் தொடர்புக்கு அறிவிப்புகள் வராது';

  @override
  String get showCallsInRecents => 'சமீபத்திய அழைப்புகளில் காட்டு';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash அழைப்புகள் தொலைபேசி வரலாற்றில் தோன்றும்';

  @override
  String get feedback => 'கருத்து';

  @override
  String get muteNotifications => 'அறிவிப்புகளை முடக்கு';

  @override
  String get muteDescription => 'இந்தத் தொடர்புக்கு அறிவிப்புகள் வராது';

  @override
  String mutedUntil(String time) {
    return '$time வரை முடக்கப்பட்டது';
  }

  @override
  String get notMuted => 'அறிவிப்புகள் இயக்கப்பட்டுள்ளன';

  @override
  String get unmute => 'முடக்கத்தை நீக்கு';

  @override
  String get notificationSound => 'அறிவிப்பு ஒலி';

  @override
  String get defaultSound => 'இயல்புநிலை';

  @override
  String get chatSettings => 'உரையாடல் அமைப்புகள்';

  @override
  String get bubbleColor => 'குமிழி நிறம்';

  @override
  String get backgroundColor => 'பின்னணி நிறம்';

  @override
  String get backgroundImage => 'பின்னணிப் படம்';

  @override
  String get chatBackground => 'உரையாடல் பின்னணி';

  @override
  String get customColor => 'தனிப்பயன்';

  @override
  String get defaultColor => 'இயல்புநிலை';

  @override
  String get imageSelected => 'படம் தேர்ந்தெடுக்கப்பட்டது';

  @override
  String get noImage => 'படம் இல்லை';

  @override
  String get color => 'நிறம்';

  @override
  String get image => 'படம்';

  @override
  String get tapToSelectImage => 'படத்தைத் தேர்ந்தெடுக்க தட்டுங்கள்';

  @override
  String get changeImage => 'படத்தை மாற்று';

  @override
  String get previewMessageReceived => 'வணக்கம்!';

  @override
  String get previewMessageSent => 'ஹலோ!';

  @override
  String get messageAction => 'செய்தி';

  @override
  String get callAction => 'அழைப்பு';

  @override
  String get videoAction => 'வீடியோ';

  @override
  String get personalNotes => 'தனிப்பட்ட குறிப்புகள்';

  @override
  String get addNotes => 'குறிப்புகளைச் சேர்...';

  @override
  String get noNotes => 'குறிப்புகள் இல்லை';

  @override
  String get messageNotifications => 'செய்தி அறிவிப்புகள்';

  @override
  String get callNotifications => 'அழைப்பு அறிவிப்புகள்';

  @override
  String get useGradient => 'சாய்வு நிறம் பயன்படுத்து';

  @override
  String get gradientStart => 'ஆரம்ப நிறம்';

  @override
  String get gradientEnd => 'இறுதி நிறம்';

  @override
  String get preview => 'முன்னோட்டம்';

  @override
  String get reset => 'மீட்டமை';

  @override
  String get securityNumber => 'பாதுகாப்பு எண்';

  @override
  String securityNumberDescription(String name) {
    return 'பாதுகாப்பு எண் $name இன் சாதனத்துடன் பொருந்துகிறதா என சரிபார்க்கவும்';
  }

  @override
  String get verifyEncryption => 'முழுமையான குறியாக்கத்தை சரிபார்';

  @override
  String get tapToCopy => 'நகலெடுக்க தட்டுங்கள்';

  @override
  String get howToVerify => 'எப்படி சரிபார்ப்பது';

  @override
  String get verifyStep1 =>
      'உங்கள் தொடர்பை நேரில் சந்தியுங்கள் அல்லது அழையுங்கள்';

  @override
  String get verifyStep2 =>
      'பாதுகாப்பு எண்களை ஒப்பிடுங்கள் அல்லது QR குறியீடுகளை ஸ்கேன் செய்யுங்கள்';

  @override
  String get verifyStep3 => 'அவை பொருந்தினால், உங்கள் உரையாடல் பாதுகாப்பானது';

  @override
  String get scanToVerify => 'சரிபார்க்க ஸ்கேன் செய்';

  @override
  String get reportSpam => 'ஸ்பேம் புகார்';

  @override
  String get reportSpamSubtitle => 'இந்தத் தொடர்பை ஸ்பேம் எனப் புகார் செய்';

  @override
  String get reportSpamDescription =>
      'இந்தத் தொடர்பு அநாமதேயமாகப் புகார் செய்யப்படும். உங்கள் அடையாளம் பகிரப்படாது. உறுதியா?';

  @override
  String get report => 'புகார்';

  @override
  String get spamReported => 'ஸ்பேம் புகார் செய்யப்பட்டது';

  @override
  String get reportError =>
      'புகாரை அனுப்புவதில் தோல்வி. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get reportRateLimited => 'இன்றைய அதிகபட்ச புகார்களை எட்டிவிட்டீர்கள்.';

  @override
  String get blockContact => 'தொடர்பைத் தடு';

  @override
  String get blockContactDescription =>
      'இந்தத் தொடர்பால் உங்களுக்கு செய்திகள் அனுப்பவோ அழைக்கவோ முடியாது. அவர்களுக்குத் தெரிவிக்கப்படாது.';

  @override
  String get unblockContact => 'தொடர்பைத் தடைநீக்கு';

  @override
  String get unblockContactDescription =>
      'இந்தத் தொடர்பு மீண்டும் உங்களுக்கு செய்திகள் அனுப்பவும் அழைக்கவும் முடியும்.';

  @override
  String get contactBlocked => 'தொடர்பு தடுக்கப்பட்டது';

  @override
  String get contactUnblocked => 'தொடர்பு தடைநீக்கப்பட்டது';

  @override
  String get contactIsBlocked => 'இந்தத் தொடர்பு தடுக்கப்பட்டுள்ளது';

  @override
  String get unblock => 'தடைநீக்கு';

  @override
  String get deleteContactSubtitle => 'இந்தத் தொடர்பையும் உரையாடலையும் நீக்கு';

  @override
  String get confirmWithPin => 'PIN மூலம் உறுதிசெய்';

  @override
  String get enterPinToConfirm =>
      'இந்தச் செயலை உறுதிசெய்ய உங்கள் PIN-ஐ உள்ளிடுங்கள்';

  @override
  String get profilePhoto => 'சுயவிவரப் புகைப்படம்';

  @override
  String get takePhoto => 'புகைப்படம் எடு';

  @override
  String get chooseFromGallery => 'கேலரியிலிருந்து தேர்வு செய்';

  @override
  String get removePhoto => 'புகைப்படத்தை நீக்கு';

  @override
  String get viewContactHashId => 'தொடர்பின் அடையாளத்தைப் பார்';

  @override
  String get hashIdPartiallyMasked =>
      'உங்கள் பாதுகாப்பிற்கும் தொடர்பின் தனியுரிமைக்கும் ஓரளவு மறைக்கப்பட்டுள்ளது';

  @override
  String get addFirstContact => 'உங்கள் முதல் தொடர்பைச் சேர்க்கவும்';

  @override
  String get addFirstContactSubtitle =>
      'உங்கள் QR குறியீட்டைப் பகிருங்கள் அல்லது நண்பரின் குறியீட்டை ஸ்கேன் செய்யுங்கள்';

  @override
  String get directory => 'அடைவு';

  @override
  String get noContacts => 'தொடர்புகள் இல்லை';

  @override
  String get noContactsSubtitle => 'தொடங்க ஒரு தொடர்பைச் சேர்க்கவும்';

  @override
  String get sendMessageAction => 'செய்தி அனுப்பு';

  @override
  String get audioCall => 'குரல் அழைப்பு';

  @override
  String get videoCall => 'வீடியோ அழைப்பு';

  @override
  String get viewProfile => 'சுயவிவரத்தைப் பார்';

  @override
  String get deleteContactDirectory => 'தொடர்பை நீக்கு';

  @override
  String get scanShort => 'ஸ்கேன்';

  @override
  String get addShort => 'சேர்';

  @override
  String deleteContactConfirmName(String name) {
    return '$name-ஐ நீக்க விரும்புகிறீர்களா?';
  }

  @override
  String get noNotesTitle => 'குறிப்புகள் இல்லை';

  @override
  String get noNotesSubtitle => 'உங்கள் முதல் குறிப்பை உருவாக்குங்கள்';

  @override
  String get newNote => 'புதிய குறிப்பு';

  @override
  String get editNote => 'குறிப்பைத் திருத்து';

  @override
  String get deleteNote => 'குறிப்பை நீக்கு';

  @override
  String get deleteNoteConfirm => 'இந்தக் குறிப்பை நீக்க விரும்புகிறீர்களா?';

  @override
  String get noteTitle => 'தலைப்பு';

  @override
  String get noteContent => 'உள்ளடக்கம்';

  @override
  String get addItem => 'உருப்படியைச் சேர்';

  @override
  String get pinNote => 'பின் செய்';

  @override
  String get unpinNote => 'பின் நீக்கு';

  @override
  String get noteColor => 'நிறம்';

  @override
  String get notePassword => 'கடவுச்சொல்';

  @override
  String get setPassword => 'கடவுச்சொல்லை அமை';

  @override
  String get changePassword => 'கடவுச்சொல்லை மாற்று';

  @override
  String get removePassword => 'கடவுச்சொல்லை நீக்கு';

  @override
  String get enterPassword => 'கடவுச்சொல்லை உள்ளிடுங்கள்';

  @override
  String get confirmPassword => 'கடவுச்சொல்லை உறுதிசெய்யுங்கள்';

  @override
  String get passwordPin => 'PIN குறியீடு';

  @override
  String get passwordText => 'உரை கடவுச்சொல்';

  @override
  String get protectedNote => 'பாதுகாக்கப்பட்ட குறிப்பு';

  @override
  String get incorrectPassword => 'தவறான கடவுச்சொல்';

  @override
  String get passwordSet => 'கடவுச்சொல் அமைக்கப்பட்டது';

  @override
  String get passwordRemoved => 'கடவுச்சொல் நீக்கப்பட்டது';

  @override
  String get notesBiometric => 'குறிப்புகளுக்கு Face ID';

  @override
  String get notesBiometricSubtitle =>
      'பாதுகாக்கப்பட்ட குறிப்புகளைத் திறக்க உயிரியல் அளவீடு சரிபார்ப்பு தேவை';

  @override
  String get textNote => 'உரைக் குறிப்பு';

  @override
  String get checklistNote => 'சரிபார்ப்புப் பட்டியல்';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total பணிகள்';
  }

  @override
  String get autoSaved => 'சேமிக்கப்பட்டது';

  @override
  String get searchNotes => 'குறிப்புகளைத் தேடு';

  @override
  String get legalConsent => 'சட்ட ஒப்புதல்';

  @override
  String get confirmAge13 =>
      'எனக்கு குறைந்தது 13 வயது நிறைவடைந்துள்ளது என உறுதிசெய்கிறேன்';

  @override
  String get acceptLegalStart => 'நான் ஏற்கிறேன் ';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get termsOfService => 'சேவை விதிமுறைகள்';

  @override
  String get andThe => ' மற்றும் ';

  @override
  String get continueButton => 'தொடர்';

  @override
  String get mustAcceptTerms => 'தொடர இரு நிபந்தனைகளையும் ஏற்க வேண்டும்';

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
  String get support => 'ஆதரவு';

  @override
  String get contactSupport => 'ஆதரவைத் தொடர்பு கொள்';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'துஷ்பிரயோகத்தைப் புகார் செய்';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'சட்டம்';

  @override
  String get legalEntity => 'சட்ட நிறுவனம்';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'பின் செய்';

  @override
  String get unpinConversation => 'பின் நீக்கு';

  @override
  String get hideConversation => 'ஊட்டத்திலிருந்து நீக்கு';

  @override
  String get deleteConversation => 'உரையாடலை நீக்கு';

  @override
  String get deleteConversationConfirm =>
      'அனைத்து செய்திகளையும் நீக்குவதை உறுதிசெய்ய உங்கள் PIN-ஐ உள்ளிடுங்கள்';

  @override
  String get noConversations => 'இன்னும் உரையாடல்கள் இல்லை';

  @override
  String get startConversation => 'தொடங்கு';

  @override
  String get microphonePermissionRequired => 'ஒலிவாங்கி அணுகல் தேவை';

  @override
  String get microphonePermissionExplanation =>
      'அழைப்புகளுக்கு Hash-க்கு ஒலிவாங்கி தேவை.';

  @override
  String get cameraPermissionExplanation =>
      'வீடியோ அழைப்புகளுக்கு Hash-க்கு கேமரா தேவை.';

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
  String get openSettings => 'அமைப்புகளைத் திற';

  @override
  String get callConnecting => 'இணைக்கிறது...';

  @override
  String get callRinging => 'ஒலிக்கிறது...';

  @override
  String get callReconnecting => 'மீண்டும் இணைக்கிறது...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'மீண்டும் இணைக்கிறது ($secondsவி)';
  }

  @override
  String get callPaused => 'இடைநிறுத்தம்';

  @override
  String get callPausedSubtitle => 'அழைப்பு இன்னும் செயலில் உள்ளது';

  @override
  String get callRemoteMicMuted => 'தொடர்பின் ஒலிவாங்கி முடக்கப்பட்டுள்ளது';

  @override
  String get callMiniControlsMute => 'முடக்கு';

  @override
  String get callMiniControlsUnmute => 'முடக்கத்தை நீக்கு';

  @override
  String get callMiniControlsHangUp => 'துண்டி';

  @override
  String get callMiniControlsReturn => 'அழைப்புக்குத் திரும்பு';

  @override
  String get callNetworkPoor => 'நிலையற்ற இணைப்பு';

  @override
  String get callNetworkLost => 'இணைப்பு துண்டிக்கப்பட்டது';

  @override
  String get callEndedTitle => 'அழைப்பு முடிந்தது';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'சாதனத் தரவு';

  @override
  String get deviceDataSubtitle => 'உள்ளூர் மற்றும் சேவையக சேமிப்பு';

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
  String get localStorage => 'உள்ளூர் சேமிப்பு';

  @override
  String get onThisDevice => 'இந்தச் சாதனத்தில்';

  @override
  String get encryptedDatabases => 'குறியாக்கம் செய்யப்பட்ட தரவுத்தளங்கள்';

  @override
  String get files => 'கோப்புகள்';

  @override
  String get secureKeychain => 'பாதுகாப்பான சாவித்தொகுப்பு';

  @override
  String get cache => 'தற்காலிகச் சேமிப்பு';

  @override
  String get contactsDetail => 'பெயர்கள், அவதாரங்கள், Signal விசைகள்';

  @override
  String get messagesDetail => 'குறியாக்கம் செய்யப்பட்ட உரையாடல்கள்';

  @override
  String get notesDetail => 'தனிப்பட்ட குறிப்புகள்';

  @override
  String get signalSessions => 'Signal அமர்வுகள்';

  @override
  String get signalSessionsDetail => 'குறியாக்க அமர்வுகள்';

  @override
  String get pendingContacts => 'நிலுவைத் தொடர்புகள்';

  @override
  String get pendingContactsDetail => 'நிலுவை கோரிக்கைகள்';

  @override
  String get callHistory => 'அழைப்புகள்';

  @override
  String get callHistoryDetail => 'அழைப்பு வரலாறு';

  @override
  String get preferences => 'விருப்பங்கள்';

  @override
  String get preferencesDetail => 'ஊடக மற்றும் அழைப்பு விருப்பங்கள்';

  @override
  String get avatars => 'அவதாரங்கள்';

  @override
  String get media => 'ஊடகம்';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count கோப்புகள்',
      one: '1 கோப்பு',
      zero: 'கோப்புகள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get active => 'செயலில்';

  @override
  String get notDefined => 'வரையறுக்கப்படவில்லை';

  @override
  String get biometrics => 'உயிரியல் அளவீடு';

  @override
  String get recoveryPhrase => 'மீட்பு சொற்றொடர்';

  @override
  String get identity => 'அடையாளம் (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol விசைகள்';

  @override
  String get authTokens => 'அங்கீகார டோக்கன்கள்';

  @override
  String get contactNamesCache => 'தொடர்பு பெயர்கள் தற்காலிகச் சேமிப்பு';

  @override
  String get remoteConfig => 'தொலைநிலை அமைப்பு';

  @override
  String get notificationPrefs => 'அறிவிப்பு விருப்பங்கள்';

  @override
  String get serverData => 'சேவையகத் தரவு';

  @override
  String get serverDataInfo =>
      'Hash சேவையகத்தில் குறைந்தபட்ச தரவை வைத்திருக்கிறது, அனைத்தும் குறியாக்கம் செய்யப்பட்ட அல்லது தற்காலிகமானவை.';

  @override
  String get serverProfile => 'சுயவிவரம்';

  @override
  String get serverProfileDetail =>
      'Hash ID, பொது விசைகள், அஞ்சல் பெட்டி டோக்கன்';

  @override
  String get serverPrekeys => 'முன்-விசைகள்';

  @override
  String get serverPrekeysDetail =>
      'ஒருமுறை பயன்படுத்தும் Signal விசைகள் (பயன்படுத்தப்பட்டவை)';

  @override
  String get serverMessages => 'போக்குவரத்தில் உள்ள செய்திகள்';

  @override
  String get serverMessagesDetail =>
      'வழங்கலுக்குப் பிறகு நீக்கப்படும் (அதிகபட்சம் 24 மணி நேரம்)';

  @override
  String get serverMedia => 'போக்குவரத்தில் உள்ள ஊடகம்';

  @override
  String get serverMediaDetail => 'பதிவிறக்கத்திற்குப் பிறகு நீக்கப்படும்';

  @override
  String get serverContactRequests => 'தொடர்பு கோரிக்கைகள்';

  @override
  String get serverContactRequestsDetail =>
      '24 மணி நேரத்திற்குப் பிறகு காலாவதியாகும்';

  @override
  String get serverRateLimits => 'வீத வரம்புகள்';

  @override
  String get serverRateLimitsDetail => 'தற்காலிக துஷ்பிரயோக எதிர்ப்பு தரவு';

  @override
  String get privacyReassurance =>
      'Hash உங்கள் செய்திகளைப் படிக்க முடியாது. அனைத்து தரவும் முழுமையாக குறியாக்கம் செய்யப்பட்டுள்ளது. சேவையக தரவு தானாக நீக்கப்படும்.';

  @override
  String get pinTooSimple =>
      'இந்த PIN மிகவும் எளிமையானது. மிகவும் பாதுகாப்பான குறியீட்டைத் தேர்வு செய்யுங்கள்.';

  @override
  String get genericError => 'பிழை ஏற்பட்டது. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'கணக்கை உருவாக்க முடியவில்லை: $error';
  }

  @override
  String get phraseCopiedToClipboard =>
      'சொற்றொடர் கிளிப்போர்டுக்கு நகலெடுக்கப்பட்டது';

  @override
  String get copyPhrase => 'சொற்றொடரை நகலெடு';

  @override
  String get recoveryPhraseSecurityWarning =>
      'இந்தச் சொற்றொடரை பாதுகாப்பான இடத்தில் எழுதுங்கள். இந்தச் சொற்றொடர் இல்லாமல் உங்கள் PIN-ஐ இழந்தால், உங்கள் தரவிற்கான அணுகலை நிரந்தரமாக இழப்பீர்கள்.';

  @override
  String get noMessages => 'செய்திகள் இல்லை';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name உடனான அனைத்து செய்திகளையும் நீக்கவா?';
  }

  @override
  String get confirmation => 'உறுதிப்படுத்தல்';

  @override
  String get untitled => 'தலைப்பில்லாத';

  @override
  String get noSessions => 'அமர்வுகள் இல்லை';

  @override
  String get unknownContact => 'அறியாத தொடர்பு';

  @override
  String get unnamed => 'பெயரிடப்படாத';

  @override
  String get noPendingRequestsAlt => 'நிலுவை கோரிக்கைகள் இல்லை';

  @override
  String get deleteAllCallHistory => 'அனைத்து அழைப்பு வரலாற்றையும் நீக்கவா?';

  @override
  String get noCalls => 'அழைப்புகள் இல்லை';

  @override
  String get noPreferences => 'விருப்பங்கள் இல்லை';

  @override
  String get resetAllMediaPrefs => 'அனைத்து ஊடக விருப்பங்களையும் மீட்டமைக்கவா?';

  @override
  String get deleteThisAvatar => 'இந்த அவதாரத்தை நீக்கவா?';

  @override
  String get deleteAllAvatars => 'அனைத்து அவதாரங்களையும் நீக்கவா?';

  @override
  String get noAvatars => 'அவதாரங்கள் இல்லை';

  @override
  String get deleteThisFile => 'இந்தக் கோப்பை நீக்கவா?';

  @override
  String get deleteAllMediaFiles => 'அனைத்து ஊடகங்களையும் நீக்கவா?';

  @override
  String get noMediaFiles => 'ஊடகம் இல்லை';

  @override
  String get outgoing => 'வெளிச்செல்லும்';

  @override
  String get incoming => 'உள்வரும்';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'நிலையற்ற காட்சி: $secondsவி';
  }

  @override
  String get normalView => 'சாதாரண காட்சி';

  @override
  String get callReasonCompleted => 'முடிந்தது';

  @override
  String get callReasonMissed => 'தவறிவிட்டது';

  @override
  String get callReasonDeclined => 'நிராகரிக்கப்பட்டது';

  @override
  String get callReasonFailed => 'தோல்வி';

  @override
  String get justNow => 'இப்போதே';

  @override
  String timeAgoMinutes(int count) {
    return '$count நிமிடம் முன்';
  }

  @override
  String timeAgoHours(int count) {
    return '$count ம.நே முன்';
  }

  @override
  String timeAgoDays(int count) {
    return '$count நாள் முன்';
  }

  @override
  String get messageTypeContact => 'தொடர்பு';

  @override
  String get messageTypeLocation => 'இருப்பிடம்';

  @override
  String get statusQueued => 'வரிசையில்';

  @override
  String get blockedBadge => 'தடுக்கப்பட்டது';

  @override
  String get protectedBadge => 'பாதுகாக்கப்பட்டது';

  @override
  String messageCount(int count) {
    return '$count செய்தி(கள்)';
  }

  @override
  String get deleteQuestion => 'நீக்கவா?';

  @override
  String get transferMyAccountTitle => 'எனது கணக்கை மாற்று';

  @override
  String get loadingError => 'ஏற்றுவதில் பிழை';

  @override
  String get transferToNewDevice => 'புதிய சாதனத்திற்கு மாற்று';

  @override
  String get transferInstructions =>
      'உங்கள் புதிய சாதனத்தில், \"எனது கணக்கை மீட்டெடு\" என்பதைத் தேர்ந்தெடுத்து இந்தத் தகவலை உள்ளிடுங்கள்:';

  @override
  String get yourHashIdLabel => 'உங்கள் Hash ID';

  @override
  String get enterYourPinCode => 'உங்கள் PIN குறியீட்டை உள்ளிடுங்கள்';

  @override
  String get pinOwnerConfirmation =>
      'இந்தக் கணக்கின் உரிமையாளர் நீங்கள்தான் என்பதை உறுதிசெய்ய';

  @override
  String get scanThisQrCode => 'இந்த QR குறியீட்டை ஸ்கேன் செய்யுங்கள்';

  @override
  String get withYourNewDevice => 'உங்கள் புதிய சாதனத்துடன்';

  @override
  String get orEnterTheCode => 'அல்லது குறியீட்டை உள்ளிடுங்கள்';

  @override
  String get transferCodeLabel => 'மாற்றக் குறியீடு';

  @override
  String get proximityVerification => 'அருகாமை சரிபார்ப்பு';

  @override
  String get bringDevicesCloser => 'இரு சாதனங்களையும் அருகில் கொண்டு வாருங்கள்';

  @override
  String get confirmTransferQuestion => 'மாற்றத்தை உறுதிசெய்யவா?';

  @override
  String get accountWillBeTransferred =>
      'உங்கள் கணக்கு புதிய சாதனத்திற்கு மாற்றப்படும்.\n\nஇந்தச் சாதனம் நிரந்தரமாகத் துண்டிக்கப்படும்.';

  @override
  String get transferComplete => 'மாற்றம் முடிந்தது';

  @override
  String get transferSuccessMessage =>
      'உங்கள் கணக்கு வெற்றிகரமாக மாற்றப்பட்டது.\n\nஇந்தச் செயலி இப்போது மூடப்படும்.';

  @override
  String get manualVerification => 'கைமுறை சரிபார்ப்பு';

  @override
  String get codeDisplayedOnBothDevices =>
      'இரு சாதனங்களிலும் காட்டப்படும் குறியீடு:';

  @override
  String get doesCodeMatchNewDevice =>
      'இந்தக் குறியீடு புதிய சாதனத்தில் உள்ளதுடன் பொருந்துகிறதா?';

  @override
  String get verifiedStatus => 'சரிபார்க்கப்பட்டது';

  @override
  String get inProgressStatus => 'செயல்பாட்டில்...';

  @override
  String get notAvailableStatus => 'கிடைக்கவில்லை';

  @override
  String get codeExpiredRestart =>
      'குறியீடு காலாவதியானது. மீண்டும் தொடங்குங்கள்.';

  @override
  String get codesDoNotMatchCancelled =>
      'குறியீடுகள் பொருந்தவில்லை. மாற்றம் ரத்துசெய்யப்பட்டது.';

  @override
  String transferToDevice(String device) {
    return 'இலக்கு: $device';
  }

  @override
  String get copiedExclamation => 'நகலெடுக்கப்பட்டது!';

  @override
  String expiresInTime(String time) {
    return '$time இல் காலாவதியாகும்';
  }

  @override
  String get biometricNotAvailable =>
      'இந்தச் சாதனத்தில் உயிரியல் அளவீடு கிடைக்கவில்லை';

  @override
  String get biometricAuthError => 'உயிரியல் அளவீடு சரிபார்ப்பில் பிழை';

  @override
  String get authenticateForBiometric =>
      'உயிரியல் அளவீட்டை இயக்க சரிபார்க்கவும்';

  @override
  String get biometricAuthFailed => 'உயிரியல் அளவீடு சரிபார்ப்பு தோல்வியுற்றது';

  @override
  String get forceUpdateTitle => 'புதுப்பிப்பு தேவை';

  @override
  String get forceUpdateMessage =>
      'Hash-இன் புதிய பதிப்பு கிடைக்கிறது. தொடர புதுப்பிக்கவும்.';

  @override
  String get updateButton => 'புதுப்பி';

  @override
  String get maintenanceInProgress => 'பராமரிப்பு நடைபெறுகிறது';

  @override
  String get tryAgainLater => 'பின்னர் மீண்டும் முயற்சிக்கவும்';

  @override
  String get information => 'தகவல்';

  @override
  String get later => 'பின்னர்';

  @override
  String get doYouLikeHash => 'Hash பிடிக்குமா?';

  @override
  String get yourFeedbackHelps => 'உங்கள் கருத்து செயலியை மேம்படுத்த உதவுகிறது';

  @override
  String get ratingTerrible => 'மோசமான';

  @override
  String get ratingBad => 'கெட்ட';

  @override
  String get ratingOk => 'சரி';

  @override
  String get ratingGood => 'நல்ல';

  @override
  String get ratingExcellent => 'அருமை!';

  @override
  String get donationMessage =>
      'Hash ஒரு இலாப நோக்கற்ற திட்டம். உண்மையிலேயே தனிப்பட்ட தூதுவரை உருவாக்கத் தொடர உங்கள் ஆதரவு உதவுகிறது.';

  @override
  String get recentConnections => 'சமீபத்திய இணைப்புகள்';

  @override
  String get loginInfoText =>
      'ஒவ்வொரு PIN திறப்பும் உள்ளூரில் பதிவு செய்யப்படுகிறது. கடந்த 24 மணி நேரம் மட்டுமே வைக்கப்படும்.';

  @override
  String get connectionCount => 'இணைப்பு(கள்)';

  @override
  String get periodLabel => 'காலம்';

  @override
  String get historyLabel => 'வரலாறு';

  @override
  String get noLoginRecorded => 'உள்நுழைவு பதிவு இல்லை';

  @override
  String get nextUnlocksAppearHere => 'அடுத்த திறப்புகள் இங்கே தோன்றும்.';

  @override
  String get dataLocalOnly =>
      'இந்தத் தரவு உங்கள் சாதனத்தில் மட்டுமே சேமிக்கப்பட்டு ஒருபோதும் அனுப்பப்படாது.';

  @override
  String get currentSession => 'தற்போதைய';

  @override
  String get todayLabel => 'இன்று';

  @override
  String get yesterdayLabel => 'நேற்று';

  @override
  String get justNowLabel => 'இப்போதே';

  @override
  String minutesAgoLabel(int count) {
    return '$count நிமிடம் முன்';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours ம.நே முன்';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours ம.நே $minutes நிமி முன்';
  }

  @override
  String get noMaintenancePlanned => 'பராமரிப்பு திட்டமிடப்படவில்லை';

  @override
  String get everythingWorkingNormally => 'எல்லாம் சாதாரணமாக வேலை செய்கிறது';

  @override
  String get maintenanceTitle => 'பராமரிப்பு';

  @override
  String get maintenanceActiveLabel => 'நடைபெறுகிறது';

  @override
  String get maintenancePlannedLabel => 'திட்டமிடப்பட்டது';

  @override
  String get locking => 'பூட்டுகிறது...';

  @override
  String get newMessageNotification => 'புதிய செய்தி';

  @override
  String get secExplainTitle => 'Hash உங்களை எப்படிப் பாதுகாக்கிறது';

  @override
  String get secExplainIntro =>
      'யாரும் உங்கள் செய்திகளைப் படிக்க முடியாதபடி Hash வடிவமைக்கப்பட்டுள்ளது.';

  @override
  String get secExplainIntroSub =>
      'நாங்கள் கூட முடியாது.\nஎப்படி வேலை செய்கிறது என்பதை எளிமையாக விளக்குகிறோம்.';

  @override
  String get secJourneyLabel => 'பயணம்';

  @override
  String get secJourneyTitle => 'உங்கள் செய்தியின் பயணம்';

  @override
  String get secJourneySubtitle =>
      'உங்கள் விரலிலிருந்து உங்கள் தொடர்பின் திரை வரை, ஒவ்வொரு படியும் பாதுகாக்கப்படுகிறது. பாதையைப் பின்தொடருங்கள்.';

  @override
  String get secStep1Title => 'உங்கள் செய்தியை எழுதுகிறீர்கள்';

  @override
  String get secStep1Desc =>
      'செயலியில் \"வணக்கம்!\" என்று தட்டச்சு செய்கிறீர்கள். இந்த நேரத்தில், செய்தி உங்கள் தொலைபேசியின் நினைவகத்தில் மட்டுமே உள்ளது. எதுவும் அனுப்பப்படவில்லை.';

  @override
  String get secStep2Title => 'Signal Protocol குறியாக்கம்';

  @override
  String get secStep2Desc =>
      '\"அனுப்பு\" பொத்தானை அழுத்தியவுடன், உங்கள் செய்தி புரிந்துகொள்ள முடியாத எழுத்துகளின் வரிசையாக மாற்றப்படுகிறது. உங்கள் தொடர்பிடம் மட்டுமே விசை உள்ள பெட்டகத்தில் செய்தி பூட்டப்பட்டது போல.';

  @override
  String get secStep3Title => 'Sealed Sender: கண்ணுக்குத் தெரியாத உறை';

  @override
  String get secStep3Desc =>
      'திருப்பி அனுப்பும் முகவரி இல்லாமல் கடிதம் அனுப்புவது போல நினைத்துப் பாருங்கள். Hash சரியாக அதையே செய்கிறது. செய்தி அநாமதேய அஞ்சல் பெட்டியில் போடப்படுகிறது. யார் அனுப்பினார்கள் என்று சேவையகத்திற்குத் தெரியாது.';

  @override
  String get secStep4Title => 'சேவையகம் எதையும் பார்க்காது';

  @override
  String get secStep4Desc =>
      'சேவையகம் ஒரு கண்ணில்லா தபால்காரனாக செயல்படுகிறது. \"யாரோ #A7X9 பெட்டியில் ஏதோ போட்டார்கள்\" என்று மட்டுமே அது அறியும். யார் அனுப்பினார்கள், என்ன, யாருக்கு என்று தெரியாது.';

  @override
  String get secStep4Highlight =>
      'மெட்டாடேட்டா சேமிக்கப்படாது: IP முகவரி இல்லை, நேர முத்திரை இல்லை, அனுப்புநர்-பெறுநர் இடையே இணைப்பு இல்லை.';

  @override
  String get secStep5Title => 'உங்கள் தொடர்பு செய்தியைப் பெறுகிறார்';

  @override
  String get secStep5Desc =>
      'உங்கள் தொடர்பின் தொலைபேசி அநாமதேய அஞ்சல் பெட்டியிலிருந்து உள்ளடக்கத்தைப் பெற்று, சாதனத்தை விட்டு ஒருபோதும் வெளியேறாத தனிப்பட்ட விசையுடன் செய்தியை மறைகுறியாக்கம் செய்கிறது. \"வணக்கம்!\" அவர்களின் திரையில் தோன்றும்.';

  @override
  String get secStep6Title => 'செய்தி சேவையகத்திலிருந்து மறைகிறது';

  @override
  String get secStep6Desc =>
      'உங்கள் தொடர்பு பெறுதலை உறுதிசெய்தவுடன், சேவையகம் செய்தியை நிரந்தரமாக நீக்குகிறது. குப்பை இல்லை, காப்பகம் இல்லை, காப்புப்பிரதி இல்லை. படிக்கப்படாத செய்திகள் கூட 24 மணி நேரத்திற்குப் பிறகு தானாக அழிக்கப்படும்.';

  @override
  String get secStep7Title => 'உள்ளூர் காலாவதி';

  @override
  String get secStep7Desc =>
      'உங்கள் தொடர்பின் தொலைபேசியில், நீங்கள் தேர்ந்தெடுத்த காலத்திற்கு ஏற்ப செய்தி தானாக அழிக்கப்படும்: படிக்கப்பட்டவுடன், 5 நிமிடங்கள், 1 மணி நேரம்... நீங்கள் முடிவு செய்கிறீர்கள்.';

  @override
  String get secJourneyConclusion =>
      'முடிவு: சேவையகத்தில் தடம் இல்லை, சாதனங்களில் தடம் இல்லை. செய்தி படிக்கப்படுவதற்கு மட்டுமே இருந்தது, பிறகு மறைந்தது.';

  @override
  String get secArchLabel => 'கட்டமைப்பு';

  @override
  String get secArchTitle => '5 பாதுகாப்பு அடுக்குகள்';

  @override
  String get secArchSubtitle =>
      'Hash ஒரே தொழில்நுட்பத்தை நம்பவில்லை. ஒவ்வொரு அடுக்கும் மற்றவற்றை வலுப்படுத்துகிறது. ஒரு அடுக்கு சமரசம் செய்யப்பட்டாலும், உங்கள் தரவு பாதுகாப்பாக இருக்கும்.';

  @override
  String get secLayer1Title => 'முழுமையான குறியாக்கம்';

  @override
  String get secLayer1Desc =>
      'ஒவ்வொரு செய்தியும் தனிப்பட்ட விசையால் குறியாக்கம் செய்யப்படுகிறது. எளிமையாகச் சொன்னால்: ஒரு செய்தியை மறைகுறியாக்கம் செய்தாலும், அடுத்ததை மறைகுறியாக்கம் செய்ய முடியாது. ஒவ்வொரு செய்திக்கும் சொந்த பூட்டு உள்ளது.';

  @override
  String get secLayer1Detail =>
      'கோப்புகளுக்கு (புகைப்படங்கள், வீடியோக்கள், ஆவணங்கள்), Hash கூடுதல் AES-256-GCM குறியாக்கத்தைப் பயன்படுத்துகிறது. கோப்பு உங்கள் தொலைபேசியை விட்டு வெளியேறுவதற்கு முன் குறியாக்கம் செய்யப்படுகிறது.';

  @override
  String get secLayer2Title => 'Sealed Sender (பிணைய அநாமதேயம்)';

  @override
  String get secLayer2Desc =>
      'வழக்கமான தூதுவர்கள் உங்கள் அடையாளத்துடன் செய்திகளை அனுப்புகின்றன. உறையில் உங்கள் பெயரை எழுதுவது போல. Hash அநாமதேய அஞ்சல் பெட்டிகளைப் பயன்படுத்துகிறது: யார் அனுப்பினார்கள் என்று தெரியாமல் சேவையகம் செய்தியை வழங்குகிறது.';

  @override
  String get secLayer2Detail =>
      'முடிவு: சேவையக தரவு கசிவு நிகழ்ந்தாலும், யார் யாருடன் பேசுகிறார்கள் என்பதை மறுகட்டமைக்க இயலாது.';

  @override
  String get secLayer3Title => 'தானியங்கு நீக்குதல்';

  @override
  String get secLayer3Desc =>
      'பெறுதல் உறுதிசெய்யப்பட்டவுடன் செய்திகள் சேவையகத்திலிருந்து நீக்கப்படும். செய்தி ஒருபோதும் மீட்டெடுக்கப்படாவிட்டாலும், 24 மணி நேரத்திற்குப் பிறகு தானாக அழிக்கப்படும்.';

  @override
  String get secLayer3Detail =>
      'உங்கள் தொலைபேசியில், நீங்கள் தேர்ந்தெடுக்கும் காலத்திற்கு ஏற்ப செய்திகள் தானாக அழிக்கப்படும்: உடனடியாக, 5 நிமி, 15 நிமி, 30 நிமி, 1 ம.நே, 3 ம.நே, 6 ம.நே, அல்லது 12 ம.நே.';

  @override
  String get secLayer4Title => 'உள்ளூர் அணுகல் பாதுகாப்பு';

  @override
  String get secLayer4Desc =>
      'செயலி 6 இலக்க PIN குறியீடு மற்றும்/அல்லது உயிரியல் அளவீடு (Face ID, கைரேகை) மூலம் பாதுகாக்கப்படுகிறது. அதிகமான தோல்வி முயற்சிகளுக்குப் பிறகு, ஒவ்வொரு தோல்விக்கும் அதிகரிக்கும் தாமதத்துடன் செயலி பூட்டப்படும்.';

  @override
  String get secLayer5Title => 'பூட்டப்பட்ட தரவுத்தளம்';

  @override
  String get secLayer5Desc =>
      'சேவையக பக்கத்தில், எந்தப் பயனரும் தரவுத்தளத்தில் நேரடியாக எழுத முடியாது. அனைத்து செயல்களும் ஒவ்வொரு கோரிக்கையையும் சரிபார்க்கும் பாதுகாப்பான செயல்பாடுகள் வழியாகச் செல்கின்றன.';

  @override
  String get secLayer5Detail =>
      'வங்கி கவுண்டர் போல: நீங்கள் ஒருபோதும் பெட்டகத்தைத் தொட மாட்டீர்கள். கோரிக்கை செய்கிறீர்கள், செயல்படுவதற்கு முன் உரிமை உள்ளதா என்று அமைப்பு சரிபார்க்கிறது.';

  @override
  String get secVashLabel => 'உலகில் தனித்துவமானது';

  @override
  String get secVashTitle => 'Vash பயன்முறை';

  @override
  String get secVashSubtitle =>
      'வேறு எந்த தூதுவர் செயலியிலும் இல்லாத அவசர பாதுகாப்பு அமைப்பு.';

  @override
  String get secVashScenarioTitle => 'இந்தச் சூழலை நினைத்துப் பாருங்கள்';

  @override
  String get secVashScenario1 => 'யாரோ உங்கள் தொலைபேசியை அணுகுகிறார்கள்';

  @override
  String get secVashScenario2 => 'உங்கள் PIN குறியீட்டைக் கேட்கிறார்கள்';

  @override
  String get secVashScenario3 =>
      'உங்கள் அனைத்து தரவையும் அவசரமாக அழிக்க விரும்புகிறீர்கள்';

  @override
  String get secVashSolutionTitle => 'தீர்வு: இரண்டு PIN குறியீடுகள்';

  @override
  String get secVashSolutionDesc =>
      'Hash-இல் இரண்டு வெவ்வேறு PIN குறியீடுகளை அமைக்கிறீர்கள்:';

  @override
  String get secVashNormalCodeLabel => 'சாதாரண குறியீடு';

  @override
  String get secVashNormalCodeDesc =>
      'உங்கள் அனைத்து தரவுடன் செயலியை சாதாரணமாகத் திறக்கும்';

  @override
  String get secVashCodeLabel2 => 'Vash குறியீடு';

  @override
  String get secVashCodeDescription =>
      'செயலியை சாதாரணமாகத் திறக்கும்... ஆனால் உங்கள் அனைத்து தரவும் பின்னணியில் அமைதியாக நீக்கப்படும்';

  @override
  String get secVashWhatHappensTitle => 'பிறகு என்ன நடக்கும்';

  @override
  String get secVashWhatHappensDesc =>
      'செயலி சாதாரணமாகத் திறக்கும். விழிப்பூட்டல் இல்லை, சந்தேகத்திற்குரிய அனிமேஷன் இல்லை. நீங்கள் இப்போதுதான் நிறுவியது போல திரை வெறுமையான செயலியைக் காட்டும்.\n\nஉண்மையில், உங்கள் அனைத்து உரையாடல்கள், தொடர்புகள் மற்றும் செய்திகள் ஒரு நொடியில் மீளமுடியாமல் நீக்கப்பட்டிருக்கும்.';

  @override
  String get secCallsLabel => 'அழைப்புகள் & கோப்புகள்';

  @override
  String get secCallsTitle => 'எல்லாம் குறியாக்கம் செய்யப்பட்டுள்ளது';

  @override
  String get secCallsSubtitle =>
      'செய்திகள் மட்டுமல்ல. Hash வழியாகச் செல்லும் அனைத்தும் முழுமையாக குறியாக்கம் செய்யப்பட்டுள்ளன.';

  @override
  String get secAudioCallTitle => 'குரல் அழைப்புகள்';

  @override
  String get secAudioCallDesc =>
      'WebRTC வழியாக முழுமையாக குறியாக்கம் செய்யப்பட்டது. குரல் சாதனங்களுக்கு இடையே நேரடியாக அனுப்பப்படுகிறது.';

  @override
  String get secVideoCallTitle => 'வீடியோ அழைப்புகள்';

  @override
  String get secVideoCallDesc =>
      'அதே தொழில்நுட்பம், ஒவ்வொரு ஸ்ட்ரீமும் தனித்தனியாக குறியாக்கம் செய்யப்பட்டுள்ளது.';

  @override
  String get secPhotosTitle => 'புகைப்படங்கள் & வீடியோக்கள்';

  @override
  String get secPhotosDesc =>
      'உங்கள் தொலைபேசியை விட்டு வெளியேறுவதற்கு முன் AES-256-GCM இல் குறியாக்கம் செய்யப்பட்டது.';

  @override
  String get secDocsTitle => 'ஆவணங்கள்';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, எந்தக் கோப்பும். பெயர், அளவு மற்றும் உள்ளடக்கம் குறியாக்கம் செய்யப்பட்டது.';

  @override
  String get secAnonLabel => 'அநாமதேயம்';

  @override
  String get secAnonTitle => 'அடையாளம் தேவையில்லை';

  @override
  String get secAnonSubtitle =>
      'Hash ஒருபோதும் உங்கள் தொலைபேசி எண்ணையோ மின்னஞ்சலையோ கேட்காது. நீங்கள் ஒரு தனிப்பட்ட மற்றும் அநாமதேய Hash ID மூலம் அடையாளம் காணப்படுவீர்கள்.';

  @override
  String get secHashIdTitle => 'உங்கள் Hash ID';

  @override
  String get secHashIdDesc =>
      'இது உங்கள் தனிப்பட்ட அடையாளங்காட்டி. இது உங்களைப் பற்றி எதையும் வெளிப்படுத்தாது: உங்கள் பெயர், எண், அல்லது இருப்பிடம் எதுவும் இல்லை. உங்கள் உண்மையான அடையாளத்துடன் இணைக்க இயலாத புனைப்பெயர் போன்றது.\n\nதொடர்பைச் சேர்க்க, உங்கள் Hash ID-ஐப் பகிருங்கள் அல்லது QR குறியீட்டை ஸ்கேன் செய்யுங்கள். அவ்வளவுதான். ஒத்திசைக்கப்பட்ட முகவரிப் புத்தகம் இல்லை, \"உங்களுக்குத் தெரிந்தவர்கள்\" பரிந்துரைகள் இல்லை.';

  @override
  String get secDataLabel => 'தரவு';

  @override
  String get secDataTitle => 'Hash-க்குத் தெரியாதவை';

  @override
  String get secDataSubtitle =>
      'உங்கள் தரவைப் பாதுகாக்க சிறந்த வழி அதைச் சேகரிக்காமல் இருப்பதே.';

  @override
  String get secNeverCollected => 'ஒருபோதும் சேகரிக்கப்படாது';

  @override
  String get secNeverItem1 => 'செய்தி உள்ளடக்கம்';

  @override
  String get secNeverItem2 => 'தொடர்புப் பட்டியல்';

  @override
  String get secNeverItem3 => 'தொலைபேசி எண்';

  @override
  String get secNeverItem4 => 'மின்னஞ்சல் முகவரி';

  @override
  String get secNeverItem5 => 'IP முகவரி';

  @override
  String get secNeverItem6 => 'இருப்பிடம்';

  @override
  String get secNeverItem7 => 'மெட்டாடேட்டா (யார் யாருடன் பேசுகிறார்கள்)';

  @override
  String get secNeverItem8 => 'அழைப்பு வரலாறு';

  @override
  String get secNeverItem9 => 'முகவரிப் புத்தகம்';

  @override
  String get secNeverItem10 => 'விளம்பர அடையாளங்காட்டிகள்';

  @override
  String get secTempStored => 'தற்காலிகமாக சேமிக்கப்படும்';

  @override
  String get secTempItem1 => 'அநாமதேய Hash ID (தனிப்பட்ட அடையாளங்காட்டி)';

  @override
  String get secTempItem2 => 'பொது குறியாக்க விசைகள்';

  @override
  String get secTempItem3 =>
      'போக்குவரத்தில் குறியாக்கம் செய்யப்பட்ட செய்திகள் (அதிகபட்சம் 24 மணி நேரம்)';

  @override
  String get secTempNote =>
      'இந்த குறைந்தபட்ச தரவு கூட உங்களை அடையாளம் காண முடியாது. உங்கள் Hash ID எந்த தனிப்பட்ட தகவலுடனும் இணைக்கப்படவில்லை.';

  @override
  String get secFooterTitle => 'உங்கள் தனியுரிமை, உங்கள் சுதந்திரம்';

  @override
  String get secFooterDesc =>
      'Hash மிகவும் கோரும் தொழில்முறை பயன்பாடுகளின் அதே குறியாக்க தொழில்நுட்பங்களைப் பயன்படுத்துகிறது. உங்கள் செய்திகள் கணிதத்தால் பாதுகாக்கப்படுகின்றன, வாக்குறுதிகளால் அல்ல.';

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
