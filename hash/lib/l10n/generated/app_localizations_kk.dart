// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

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
  String get conversations => 'Чаттар';

  @override
  String get contacts => 'Контактілер';

  @override
  String get noConversation => 'Чаттар жоқ';

  @override
  String get noConversationSubtitle =>
      'Қауіпсіз сөйлесуді бастау үшін контакт қосыңыз';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count күтілетін сұраныс',
      one: '1 күтілетін сұраныс',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count жіберілген сұраныс күтуде',
      one: '1 жіберілген сұраныс күтуде',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Контакт қосу';

  @override
  String get shareApp => 'Қосымшаны бөлісу';

  @override
  String get newMessage => 'Жаңа хабарлама';

  @override
  String get newConversation => 'Хабарлама жіберу';

  @override
  String get settings => 'Баптаулар';

  @override
  String get myHashId => 'Менің Hash ID';

  @override
  String get supportHash => 'Hash-ті қолдау';

  @override
  String get supportHashSubtitle => 'Hash коммерциялық емес жоба';

  @override
  String get donate => 'Қайырмалдық';

  @override
  String get appearance => 'Көрініс';

  @override
  String get theme => 'Тақырып';

  @override
  String get themeAuto => 'Автоматты';

  @override
  String get themeAutoSubtitle => 'Жүйе параметрлерін ұстанады';

  @override
  String get themeDark => 'Қараңғы';

  @override
  String get themeLight => 'Жарық';

  @override
  String get themeRecommendation =>
      'Жақсырақ құпиялылық үшін қараңғы тақырып ұсынылады';

  @override
  String get language => 'Тіл';

  @override
  String get languageAuto => 'Автоматты (жүйе)';

  @override
  String get notifications => 'Хабарландырулар';

  @override
  String get messages => 'Хабарламалар';

  @override
  String get calls => 'Қоңыраулар';

  @override
  String get vibration => 'Діріл';

  @override
  String get notificationContent => 'Хабарландыру мазмұны';

  @override
  String get notificationContentFull => 'Барлығын көрсету';

  @override
  String get notificationContentFullDesc =>
      'Контакт аты және хабарлама алдын ала көрінісі';

  @override
  String get notificationContentName => 'Тек аты';

  @override
  String get notificationContentNameDesc => 'Тек контакт атын көрсетеді';

  @override
  String get notificationContentDiscrete => 'Құпия';

  @override
  String get notificationContentDiscreteDesc =>
      'Тек \"Жаңа хабарлама\" көрсетеді';

  @override
  String get security => 'Қауіпсіздік';

  @override
  String get howHashProtectsYou => 'Hash сізді қалай қорғайды';

  @override
  String get howHashProtectsYouSubtitle => 'Қауіпсіздігіңізді түсініңіз';

  @override
  String get accountSecurity => 'Аккаунт қауіпсіздігі';

  @override
  String get accountSecuritySubtitle => 'PIN, биометрия, Vash режимі';

  @override
  String get blockScreenshots => 'Скриншоттарды блоктау';

  @override
  String get transferDevice => 'Басқа құрылғыға тасымалдау';

  @override
  String get transferDeviceSubtitle => 'Аккаунтыңызды көшіру';

  @override
  String get pinCode => 'PIN код';

  @override
  String get changePin => 'PIN кодты өзгерту';

  @override
  String get currentPin => 'Ағымдағы PIN код';

  @override
  String get newPin => 'Жаңа PIN код';

  @override
  String get confirmPin => 'PIN кодты растау';

  @override
  String get pinChanged => 'PIN код өзгертілді';

  @override
  String get incorrectPin => 'Қате PIN';

  @override
  String get pinsDoNotMatch => 'PIN кодтар сәйкес келмейді';

  @override
  String get autoLock => 'Автоматты құлыптау';

  @override
  String get autoLockDelay => 'Құлыптау кідірісі';

  @override
  String get autoLockImmediate => 'Бірден';

  @override
  String get autoLockMinute => '1 минут';

  @override
  String autoLockMinutes(int count) {
    return '$count минут';
  }

  @override
  String get vashCode => 'Vash коды';

  @override
  String get vashModeTitle => 'Vash режимі';

  @override
  String get vashModeExplanation => 'Сіздің соңғы қорғаныс желіңіз.';

  @override
  String get vashModeDescription =>
      'Сіз екінші PIN код таңдайсыз. Егер сізді Hash ашуға мәжбүрлесе, кәдімгі PIN орнына осы кодты енгізіңіз.\n\nҚосымша қалыпты түрде ашылады, бірақ барлық сұхбаттар мен контактілер жоғалады.\n\nЭкраныңызға қараған кез келген адам үшін Hash жай ғана бос көрінеді — оны ешқашан қолданбағандай.';

  @override
  String get vashModeIrreversible => 'Бұл әрекет үнсіз және қайтарымсыз.';

  @override
  String get chooseVashCode => 'Vash кодымды таңдау';

  @override
  String get vashCodeInfo =>
      'Қосымшаны қалыпты түрде ашатын, бірақ бос екінші PIN код.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Егер PIN орнына бұл кодты енгізсеңіз:';

  @override
  String get vashDeleteContacts => 'Контактілеріңіз жоғалады';

  @override
  String get vashDeleteMessages => 'Сұхбаттарыңыз жоғалады';

  @override
  String get vashDeleteHistory => 'Жазбаларыңыз жоғалады';

  @override
  String get vashKeepId =>
      'Hash жеке басыңыз (#XXX-XXX-XXX) сол күйінде қалады';

  @override
  String get vashAppearNormal =>
      'Қосымша қалыпты, бірақ бос көрінеді, жаңа сияқты. Бұл әрекет қайтарымсыз.';

  @override
  String get setupVashCode => 'Vash кодын баптау';

  @override
  String get modifyVashCode => 'Vash кодын өзгерту';

  @override
  String get currentVashCode => 'Ағымдағы Vash коды';

  @override
  String get newVashCode => 'Жаңа Vash коды';

  @override
  String get confirmVashCode => 'Vash кодын растау';

  @override
  String get vashCodeConfigured => 'Vash коды бапталды';

  @override
  String get vashCodeModified => 'Vash коды өзгертілді';

  @override
  String get vashCodeMustDiffer => 'Vash коды PIN-нен басқа болуы керек';

  @override
  String get incorrectVashCode => 'Қате Vash коды';

  @override
  String get vashWhatToDelete => 'Vash режимі нені жоғалтуы керек?';

  @override
  String get vashDeleteContactsOption => 'Контактілер';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Хабарламалар';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Жазбалар';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash режимі қосылды';

  @override
  String get vashCreateSubtitle => 'Негізгі PIN-нен басқа код таңдаңыз';

  @override
  String get vashConfirmSubtitle => 'Vash кодыңызды растаңыз';

  @override
  String get pinCodeForEntry => 'Қосымшаға кіру үшін PIN код';

  @override
  String get vashCodeSection => 'Vash режимі';

  @override
  String get biometric => 'Биометрия';

  @override
  String get biometricUnlock => 'Саусақ ізі немесе Face ID арқылы ашу';

  @override
  String get enableBiometric => 'Биометрияны қосу';

  @override
  String get biometricWarningMessage =>
      'Биометрияны қосқанда, қосымшаға кіру үшін Vash кодын қолдана алмайсыз.\n\nVash кодын тек биометрия сәтсіз болғанда (бірнеше сәтсіз әрекеттен кейін) қолдана аласыз.\n\nЖалғастырғыңыз келе ме?';

  @override
  String get understood => 'Түсіндім';

  @override
  String get shareAppSubtitle => 'Hash-ті жақындарыңызбен бөлісіңіз';

  @override
  String get share => 'Бөлісу';

  @override
  String get danger => 'Қауіп';

  @override
  String get deleteAccount => 'Аккаунтымды жою';

  @override
  String get deleteAccountSubtitle => 'Қайтарымсыз әрекет';

  @override
  String get deleteAccountConfirmTitle => 'Аккаунтымды жою';

  @override
  String get deleteAccountConfirmMessage =>
      'Аккаунтыңыз біржола жойылады. Бұл әрекет қайтарымсыз.\n\n• Барлық чаттарыңыз\n• Барлық контактілеріңіз\n• Hash ID-іңіз\n\nЖаңа аккаунт жасауыңыз керек болады.';

  @override
  String get deleteForever => 'Біржола жою';

  @override
  String get cancel => 'Болдырмау';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash режимі қосылды.';

  @override
  String deletionError(String error) {
    return 'Жою қатесі: $error';
  }

  @override
  String get yourSecurity => 'Сіздің қауіпсіздігіңіз';

  @override
  String get securityInfo =>
      '• Толық шифрлау (Signal Protocol)\n• Жеткізуден кейін серверлерде деректер жоқ\n• Кілттер тек сіздің құрылғыңызда сақталады\n• PIN код ешқашан серверге жіберілмейді';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Қош келдіңіз';

  @override
  String get securityStatement1 => 'Хабарламаларыңыз қорғалған.';

  @override
  String get securityStatement2 => 'Толық шифрлау.';

  @override
  String get securityStatement3 => 'Із жоқ. Ымыра жоқ.';

  @override
  String get securityStatement4 => 'Құпиялылығыңыз — бұл құқық.';

  @override
  String get accessBlocked => 'Кіру блокталды';

  @override
  String get tooManyAttempts => 'Тым көп әрекет';

  @override
  String get pleaseWait => 'Күте тұрыңыз';

  @override
  String get waitDelay => 'Кідіріс аяқталғанша күтіңіз';

  @override
  String attemptCount(int current, int max) {
    return '$current / $max әрекет';
  }

  @override
  String retryIn(String time) {
    return '$time кейін қайталаңыз';
  }

  @override
  String get forgotPin =>
      'PIN ұмытылды ма? Қалпына келтіру фразасын қолданыңыз';

  @override
  String get useRecoveryPhrase => 'Қалпына келтіру фразасын қолдану';

  @override
  String get recoveryWarningTitle => 'Ескерту';

  @override
  String get recoveryWarningMessage => 'Аккаунтты қалпына келтіру:';

  @override
  String get recoveryDeleteAllMessages => 'БАРЛЫҚ хабарламаларыңызды жояды';

  @override
  String get recoveryWaitDelay => '1 сағаттық кідіріс қажет';

  @override
  String get recoveryKeepContacts => 'Контактілеріңізді сақтайды';

  @override
  String get recoveryIrreversible =>
      'Бұл әрекет қайтарымсыз. Хабарламаларыңыз біржола жоғалады.';

  @override
  String get iUnderstand => 'Мен түсіндім';

  @override
  String get accountRecovery => 'Аккаунтты қалпына келтіру';

  @override
  String get enterRecoveryPhrase =>
      'Қалпына келтіру фразаңыздың 24 сөзін бос орындармен бөліп енгізіңіз.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Қалпына келтіру';

  @override
  String get recoveryPhraseRequired => 'Қалпына келтіру фразаңызды енгізіңіз';

  @override
  String get recoveryPhrase24Words => 'Фраза дәл 24 сөзден тұруы керек';

  @override
  String get incorrectRecoveryPhrase => 'Қате қалпына келтіру фразасы';

  @override
  String get recoveryInitError => 'Қалпына келтіруді іске қосу қатесі';

  @override
  String get securityDelay => 'Қауіпсіздік кідірісі';

  @override
  String get securityDelayMessage =>
      'Қауіпсіздігіңіз үшін жаңа PIN жасаудан бұрын күту мерзімі қажет.';

  @override
  String get timeRemaining => 'Қалған уақыт';

  @override
  String get messagesDeletedForProtection =>
      'Қорғаныс үшін хабарламаларыңыз жойылды.';

  @override
  String get canCloseApp => 'Қосымшаны жабып, кейін оралуыңызға болады.';

  @override
  String get onboardingTitle1 => 'Hash-қа қош келдіңіз';

  @override
  String get onboardingSubtitle1 => 'Із қалдырмайтын мессенджер';

  @override
  String get onboardingTitle2 => 'Толық шифрлау';

  @override
  String get onboardingSubtitle2 =>
      'Хабарламаларыңыз Signal протоколымен толық шифрланған';

  @override
  String get onboardingTitle3 => 'Із жоқ';

  @override
  String get onboardingSubtitle3 =>
      'Хабарламалар жеткізілгеннен кейін серверлерден жойылады';

  @override
  String get onboardingTitle4 => 'Сіздің қауіпсіздігіңіз';

  @override
  String get onboardingSubtitle4 =>
      'PIN код, Vash режимі және қалпына келтіру фразасы';

  @override
  String get getStarted => 'Бастау';

  @override
  String get next => 'Келесі';

  @override
  String get skip => 'Өткізіп жіберу';

  @override
  String get alreadyHaveAccount => 'Менің аккаунтым бар';

  @override
  String get transferMyAccount => 'Аккаунтымды тасымалдау';

  @override
  String get createPin => 'PIN код жасау';

  @override
  String get createPinSubtitle => 'Бұл код қосымшаңызға кіруді қорғайды';

  @override
  String get confirmYourPin => 'PIN кодыңызды растаңыз';

  @override
  String get confirmPinSubtitle => 'PIN кодыңызды қайта енгізіңіз';

  @override
  String get saveRecoveryPhrase => 'Қалпына келтіру фразасы';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Осы 24 сөзді ретімен жазып алыңыз. Олар PIN-ді ұмытсаңыз аккаунтыңызды қалпына келтіруге мүмкіндік береді.';

  @override
  String get phraseWritten => 'Мен фразамды жазып алдым';

  @override
  String get warningRecoveryPhrase =>
      'Бұл фразаны жоғалтып, PIN-ді ұмытсаңыз, аккаунтыңызға кіру мүмкіндігін жоғалтасыз.';

  @override
  String get accountTransferred => 'Аккаунт тасымалданды';

  @override
  String get accountTransferredMessage =>
      'Аккаунтыңыз басқа құрылғыға тасымалданды. Бұл сеанс енді жарамсыз.';

  @override
  String get accountTransferredInfo =>
      'Бұл тасымалдауды сіз бастамасаңыз, аккаунтыңыз бұзылған болуы мүмкін.';

  @override
  String get logout => 'Шығу';

  @override
  String get transferAccount => 'Аккаунтты тасымалдау';

  @override
  String get transferAccountInfo =>
      'Hash аккаунтыңызды жаңа құрылғыға тасымалдаңыз. Ағымдағы сеансыңыз жарамсыз болады.';

  @override
  String get generateTransferCode => 'Тасымалдау кодын жасау';

  @override
  String get transferCode => 'Тасымалдау коды';

  @override
  String transferCodeExpires(int minutes) {
    return 'Бұл код $minutes минутта аяқталады';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Аккаунтыңызды тасымалдау үшін жаңа құрылғыда осы кодты енгізіңіз.';

  @override
  String get generateNewCode => 'Жаңа код жасау';

  @override
  String get scanQrCode => 'QR кодты сканерлеу';

  @override
  String get scanQrCodeSubtitle =>
      'Контактты қосу үшін оның QR кодын сканерлеңіз';

  @override
  String get qrCodeDetected => 'QR код анықталды';

  @override
  String get invalidQrCode => 'Жарамсыз QR код';

  @override
  String get cameraPermissionRequired => 'Камера рұқсаты қажет';

  @override
  String get myQrCode => 'Менің QR кодым';

  @override
  String get myQrCodeSubtitle =>
      'Контактілеріңіз сізді қоса алуы үшін осы QR кодты бөлісіңіз';

  @override
  String get shareQrCode => 'Бөлісу';

  @override
  String get addContactTitle => 'Контакт қосу';

  @override
  String get addContactByHashId => 'Контактіңіздің Hash ID-ін енгізіңіз';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Іздеу';

  @override
  String get contactNotFound => 'Контакт табылмады';

  @override
  String get contactAlreadyAdded => 'Бұл контакт сіздің тізіміңізде бар';

  @override
  String get contactAdded => 'Контакт қосылды';

  @override
  String get myProfile => 'Менің профилім';

  @override
  String get myProfileSubtitle =>
      'Басқалар сізді қоса алуы үшін осы ақпаратты бөлісіңіз';

  @override
  String get temporaryCode => 'Уақытша код';

  @override
  String temporaryCodeExpires(String time) {
    return '$time кейін аяқталады';
  }

  @override
  String get codeExpired => 'Код мерзімі аяқталды';

  @override
  String get generateNewCodeButton => 'Жаңа код';

  @override
  String get copyHashId => 'ID көшіру';

  @override
  String get copyCode => 'Кодты көшіру';

  @override
  String get copiedToClipboard => 'Көшірілді';

  @override
  String get showMyQrCode => 'QR кодымды көрсету';

  @override
  String get orDivider => 'немесе';

  @override
  String get openScanner => 'Сканерді ашу';

  @override
  String get addManually => 'Қолмен қосу';

  @override
  String get contactHashIdLabel => 'Контакттың Hash ID-і';

  @override
  String get temporaryCodeLabel => 'Уақытша код';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Контактіңізден профилінен код жасауын сұраңыз';

  @override
  String get verifyAndAdd => 'Тексеру және қосу';

  @override
  String get fillAllFields => 'Барлық өрістерді толтырыңыз';

  @override
  String get invalidHashIdFormat => 'Жарамсыз ID форматы (мыс.: 123-456-ABC)';

  @override
  String get userNotFound => 'Пайдаланушы табылмады';

  @override
  String get cannotAddYourself => 'Өзіңізді қоса алмайсыз';

  @override
  String get invalidOrExpiredCode =>
      'Жарамсыз немесе мерзімі аяқталған уақытша код';

  @override
  String get contactFound => 'Контакт табылды!';

  @override
  String get howToCallContact => 'Оны қалай атағыңыз келеді?';

  @override
  String get contactNameHint => 'Контакт аты';

  @override
  String get addContactButton => 'Қосу';

  @override
  String get contactDetails => 'Контакт мәліметтері';

  @override
  String get contactName => 'Контакт аты';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date қосылды';
  }

  @override
  String get deleteContact => 'Контактты жою';

  @override
  String deleteContactConfirm(Object name) {
    return 'Бұл контактты жою?';
  }

  @override
  String get deleteContactMessage => 'Бұл бүкіл чатты да жояды.';

  @override
  String get delete => 'Жою';

  @override
  String get typeMessage => 'Хабарлама жазыңыз...';

  @override
  String get messageSent => 'Жіберілді';

  @override
  String get messageDelivered => 'Жеткізілді';

  @override
  String get messageRead => 'Оқылды';

  @override
  String get messageFailed => 'Жіберу сәтсіз';

  @override
  String get now => 'Қазір';

  @override
  String minutesAgo(int count) {
    return '$countмин';
  }

  @override
  String hoursAgo(int count) {
    return '$countсағ';
  }

  @override
  String daysAgo(int count) {
    return '$countк';
  }

  @override
  String get today => 'Бүгін';

  @override
  String get yesterday => 'Кеше';

  @override
  String dateAtTime(String date, String time) {
    return '$date сағат $time';
  }

  @override
  String get shareMessage =>
      'Hash-та маған қосылыңыз! 🔒\n\nБұл шынымен құпия мессенджер: толық шифрлау, серверлерде із жоқ, қажет болса дабыл режимі.\n\nҚосымшаны осы жерден жүктеңіз 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Қате';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Көру';

  @override
  String get yes => 'Иә';

  @override
  String get no => 'Жоқ';

  @override
  String get save => 'Сақтау';

  @override
  String get edit => 'Өңдеу';

  @override
  String get close => 'Жабу';

  @override
  String get confirm => 'Растау';

  @override
  String get loading => 'Жүктелуде...';

  @override
  String get retry => 'Қайталау';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Күтілетін сұраныстар';

  @override
  String get noPendingRequests => 'Күтілетін сұраныстар жоқ';

  @override
  String get pendingRequestsSubtitle => 'Бұл адамдар сізді қосқысы келеді';

  @override
  String requestFromUser(String hashId) {
    return '$hashId сұранысы';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days күнде аяқталады';
  }

  @override
  String get acceptRequest => 'Қабылдау';

  @override
  String get rejectRequest => 'Бас тарту';

  @override
  String get requestAccepted => 'Сұраныс қабылданды';

  @override
  String get requestRejected => 'Сұраныс қабылданбады';

  @override
  String get requestSent => 'Сұраныс жіберілді!';

  @override
  String get requestSentSubtitle =>
      'Сұранысыңыз жіберілді. Чат бастау үшін пайдаланушы оны қабылдауы керек.';

  @override
  String get requestAlreadyPending => 'Сұраныс күтуде';

  @override
  String get requestAlreadySentByOther => 'Бұл адам сізге сұраныс жіберген';

  @override
  String get addByHashId => 'Hash ID арқылы қосу';

  @override
  String get addByHashIdSubtitle =>
      'Контакттың Hash ID-ін және уақытша кодын енгізіңіз';

  @override
  String get enterTemporaryCode => '6 таңбалы кодты енгізіңіз';

  @override
  String get sendRequest => 'Сұраныс жіберу';

  @override
  String get acceptContactTitle => 'Контактты қабылдау';

  @override
  String get acceptContactSubtitle => 'Оған жеке ат бере аласыз';

  @override
  String get leaveEmptyForHashId => 'Hash ID қолдану үшін бос қалдырыңыз';

  @override
  String get firstName => 'Аты';

  @override
  String get lastName => 'Тегі';

  @override
  String get notes => 'Жазбалар';

  @override
  String get notesHint => 'Осы контакт туралы жеке жазбалар';

  @override
  String get photoOptional => 'Фото (міндетті емес)';

  @override
  String get contactNameOptional => 'Аты (міндетті емес)';

  @override
  String get notesOptional => 'Жазбалар (міндетті емес)';

  @override
  String get storedLocally => 'Тек сіздің құрылғыңызда сақталады';

  @override
  String get encryptedMessageLabel => 'Шифрланған хабарлама';

  @override
  String get identityMessageHint => 'Сіз кімсіз? Бір-біріңізді қалай білесіз?';

  @override
  String get messageWillBeSentEncrypted =>
      'Бұл хабарлама шифрланып алушыға жіберіледі';

  @override
  String get sendRequestButton => 'Сұраныс жіберу';

  @override
  String get requestExpiresIn24h =>
      'Қабылданбаса, сұраныс 24 сағатта аяқталады';

  @override
  String get theyAlreadySentYouRequest => 'Бұл адам сізге сұраныс жіберген';

  @override
  String get requests => 'Сұраныстар';

  @override
  String get receivedRequests => 'Алынған';

  @override
  String get sentRequests => 'Жіберілген';

  @override
  String get noSentRequests => 'Жіберілген сұраныстар жоқ';

  @override
  String get cancelRequest => 'Болдырмау';

  @override
  String get deleteRequest => 'Сұранысты жою';

  @override
  String get requestCancelled => 'Сұраныс болдырылмады';

  @override
  String sentTo(String hashId) {
    return '$hashId жіберілді';
  }

  @override
  String expiresIn(String time) {
    return '$time кейін аяқталады';
  }

  @override
  String receivedAgo(String time) {
    return '$time бұрын алынды';
  }

  @override
  String get messageFromRequester => 'Сұраныс жіберушінің хабарламасы';

  @override
  String get copy => 'Көшіру';

  @override
  String get messageInfo => 'Хабарлама ақпараты';

  @override
  String get messageDirection => 'Бағыт';

  @override
  String get messageSentByYou => 'Сіз жібердіңіз';

  @override
  String get messageReceived => 'Алынды';

  @override
  String get messageSentAt => 'Жіберілді';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Күй';

  @override
  String get messageReadAt => 'Оқылды';

  @override
  String get messageType => 'Түрі';

  @override
  String get messageSize => 'Көлемі';

  @override
  String get messageExpiresAt => 'Аяқталады';

  @override
  String get messageEncrypted => 'Толық шифрланған';

  @override
  String get messageStatusSending => 'Жіберілуде...';

  @override
  String get messageStatusSent => 'Жіберілді';

  @override
  String get messageStatusDelivered => 'Жеткізілді';

  @override
  String get messageStatusRead => 'Оқылды';

  @override
  String get messageStatusFailed => 'Сәтсіз';

  @override
  String get serverStatus => 'Сервер';

  @override
  String get onServer => 'Жеткізу күтілуде';

  @override
  String get deletedFromServer => 'Жойылды';

  @override
  String get messageTypeText => 'Мәтін';

  @override
  String get messageTypeImage => 'Сурет';

  @override
  String get messageTypeVideo => 'Бейне';

  @override
  String get messageTypeVoice => 'Дауыс';

  @override
  String get messageTypeFile => 'Файл';

  @override
  String get indefinitely => 'Шексіз';

  @override
  String get hoursShort => 'сағ';

  @override
  String get minutesShort => 'мин';

  @override
  String get hours => 'сағат';

  @override
  String get minutes => 'минут';

  @override
  String get seconds => 'секунд';

  @override
  String get ephemeralMessages => 'Уақытша хабарламалар';

  @override
  String get ephemeralMessagesDescription =>
      'Хабарламалар осы уақыттан кейін автоматты түрде жойылады';

  @override
  String get ephemeralImmediate => 'Бірден (оқығаннан кейін)';

  @override
  String get ephemeralImmediateDesc => 'Оқылысымен жойылады';

  @override
  String get ephemeralMyPreference => 'Менің қалауым';

  @override
  String get ephemeralMyPreferenceDesc => 'Жалпы баптауды қолдану';

  @override
  String get ephemeralDefaultSetting => 'Хабарлама ұзақтығы';

  @override
  String get ephemeralChooseDefault => 'Ұсынылатын';

  @override
  String get ephemeral30Seconds => '30 секунд';

  @override
  String get ephemeral30SecondsDesc => 'Оқығаннан 30 с кейін жойылады';

  @override
  String get ephemeral5Minutes => '5 минут';

  @override
  String get ephemeral5MinutesDesc => 'Оқығаннан 5 мин кейін жойылады';

  @override
  String get ephemeral1Hour => '1 сағат';

  @override
  String get ephemeral1HourDesc => 'Оқығаннан 1 сағ кейін жойылады';

  @override
  String get ephemeral3Hours => '3 сағат';

  @override
  String get ephemeral6Hours => '6 сағат';

  @override
  String get ephemeral6HoursDesc => 'Оқығаннан 6 сағ кейін жойылады';

  @override
  String get ephemeral12Hours => '12 сағат';

  @override
  String get ephemeral24Hours => '24 сағат';

  @override
  String get ephemeral24HoursDesc => 'Оқығаннан 24 сағ кейін жойылады';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Өзгеше ұзақтық';

  @override
  String get howItWorks => 'Қалай жұмыс істейді';

  @override
  String get ephemeralExplanation1 =>
      'Хабарламалар алынысымен серверден жойылады.';

  @override
  String get ephemeralExplanation2 =>
      'Бұл баптау оқығаннан кейін хабарламалар СІЗДІҢ телефоныңыздан қашан жоғалатынын анықтайды.';

  @override
  String get ephemeralExplanation3 =>
      'Контактіңіздің өз телефоны үшін жеке баптауы бар.';

  @override
  String get mute1Hour => '1 сағат';

  @override
  String get mute8Hours => '8 сағат';

  @override
  String get mute1Day => '1 күн';

  @override
  String get mute1Week => '1 апта';

  @override
  String get muteAlways => 'Әрқашан';

  @override
  String get muteExplanation => 'Бұл контакттан хабарландырулар алмайсыз';

  @override
  String get showCallsInRecents => 'Соңғы қоңырауларда көрсету';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash қоңыраулары телефон тарихында көрінеді';

  @override
  String get feedback => 'Кері байланыс';

  @override
  String get muteNotifications => 'Хабарландыруларды өшіру';

  @override
  String get muteDescription => 'Бұл контакттан хабарландырулар алмайсыз';

  @override
  String mutedUntil(String time) {
    return '$time дейін өшірілген';
  }

  @override
  String get notMuted => 'Хабарландырулар қосулы';

  @override
  String get unmute => 'Қосу';

  @override
  String get notificationSound => 'Хабарландыру дыбысы';

  @override
  String get defaultSound => 'Әдепкі';

  @override
  String get chatSettings => 'Чат баптаулары';

  @override
  String get bubbleColor => 'Көпіршік түсі';

  @override
  String get backgroundColor => 'Фон түсі';

  @override
  String get backgroundImage => 'Фон суреті';

  @override
  String get chatBackground => 'Чат фоны';

  @override
  String get customColor => 'Өзгеше';

  @override
  String get defaultColor => 'Әдепкі';

  @override
  String get imageSelected => 'Сурет таңдалды';

  @override
  String get noImage => 'Сурет жоқ';

  @override
  String get color => 'Түс';

  @override
  String get image => 'Сурет';

  @override
  String get tapToSelectImage => 'Сурет таңдау үшін басыңыз';

  @override
  String get changeImage => 'Суретті өзгерту';

  @override
  String get previewMessageReceived => 'Сәлем!';

  @override
  String get previewMessageSent => 'Қалайсың!';

  @override
  String get messageAction => 'Хабарлама';

  @override
  String get callAction => 'Қоңырау';

  @override
  String get videoAction => 'Бейне';

  @override
  String get personalNotes => 'Жеке жазбалар';

  @override
  String get addNotes => 'Жазба қосу...';

  @override
  String get noNotes => 'Жазбалар жоқ';

  @override
  String get messageNotifications => 'Хабарлама хабарландырулары';

  @override
  String get callNotifications => 'Қоңырау хабарландырулары';

  @override
  String get useGradient => 'Градиент қолдану';

  @override
  String get gradientStart => 'Бастапқы түс';

  @override
  String get gradientEnd => 'Соңғы түс';

  @override
  String get preview => 'Алдын ала көру';

  @override
  String get reset => 'Қалпына келтіру';

  @override
  String get securityNumber => 'Қауіпсіздік нөмірі';

  @override
  String securityNumberDescription(String name) {
    return 'Қауіпсіздік нөмірі $name құрылғысымен сәйкес келетінін тексеріңіз';
  }

  @override
  String get verifyEncryption => 'Толық шифрлауды тексеру';

  @override
  String get tapToCopy => 'Көшіру үшін басыңыз';

  @override
  String get howToVerify => 'Қалай тексеру керек';

  @override
  String get verifyStep1 =>
      'Контактіңізбен жеке кездесіңіз немесе қоңырау шалыңыз';

  @override
  String get verifyStep2 =>
      'Қауіпсіздік нөмірлерін салыстырыңыз немесе QR кодтарды сканерлеңіз';

  @override
  String get verifyStep3 => 'Сәйкес келсе, чатыңыз қауіпсіз';

  @override
  String get scanToVerify => 'Тексеру үшін сканерлеу';

  @override
  String get reportSpam => 'Спам туралы хабарлау';

  @override
  String get reportSpamSubtitle => 'Бұл контактты спам ретінде хабарлау';

  @override
  String get reportSpamDescription =>
      'Бұл контакт анонимді түрде хабарланады. Сіздің жеке басыңыз бөлісілмейді. Сенімдісіз бе?';

  @override
  String get report => 'Хабарлау';

  @override
  String get spamReported => 'Спам хабарланды';

  @override
  String get reportError =>
      'Хабарламаны жіберу сәтсіз болды. Қайталап көріңіз.';

  @override
  String get reportRateLimited =>
      'Бүгін хабарлаудың ең жоғары санына жеттіңіз.';

  @override
  String get blockContact => 'Контактты блоктау';

  @override
  String get blockContactDescription =>
      'Бұл контакт сізге хабарлама немесе қоңырау жібере алмайды. Ол хабарландырылмайды.';

  @override
  String get unblockContact => 'Контактты блоктан шығару';

  @override
  String get unblockContactDescription =>
      'Бұл контакт қайтадан хабарлама жіберіп, қоңырау шала алады.';

  @override
  String get contactBlocked => 'Контакт блокталды';

  @override
  String get contactUnblocked => 'Контакт блоктан шығарылды';

  @override
  String get contactIsBlocked => 'Бұл контакт блокталған';

  @override
  String get unblock => 'Блоктан шығару';

  @override
  String get deleteContactSubtitle => 'Бұл контактты және чатты жою';

  @override
  String get confirmWithPin => 'PIN-мен растау';

  @override
  String get enterPinToConfirm => 'Бұл әрекетті растау үшін PIN-ді енгізіңіз';

  @override
  String get profilePhoto => 'Профиль фотосы';

  @override
  String get takePhoto => 'Фото түсіру';

  @override
  String get chooseFromGallery => 'Галереядан таңдау';

  @override
  String get removePhoto => 'Фотоны жою';

  @override
  String get viewContactHashId => 'Контакт идентификаторын көру';

  @override
  String get hashIdPartiallyMasked =>
      'Қауіпсіздігіңіз бен контактіңіздің құпиялылығы үшін жартылай жасырылған';

  @override
  String get addFirstContact => 'Алғашқы контактыңызды қосыңыз';

  @override
  String get addFirstContactSubtitle =>
      'QR кодыңызды бөлісіңіз немесе достыңыздікін сканерлеңіз';

  @override
  String get directory => 'Анықтамалық';

  @override
  String get noContacts => 'Контактілер жоқ';

  @override
  String get noContactsSubtitle => 'Бастау үшін контакт қосыңыз';

  @override
  String get sendMessageAction => 'Хабарлама жіберу';

  @override
  String get audioCall => 'Аудио қоңырау';

  @override
  String get videoCall => 'Бейне қоңырау';

  @override
  String get viewProfile => 'Профильді көру';

  @override
  String get deleteContactDirectory => 'Контактты жою';

  @override
  String get scanShort => 'Сканерлеу';

  @override
  String get addShort => 'Қосу';

  @override
  String deleteContactConfirmName(String name) {
    return '$name жоюға сенімдісіз бе?';
  }

  @override
  String get noNotesTitle => 'Жазбалар жоқ';

  @override
  String get noNotesSubtitle => 'Алғашқы жазбаңызды жасаңыз';

  @override
  String get newNote => 'Жаңа жазба';

  @override
  String get editNote => 'Жазбаны өңдеу';

  @override
  String get deleteNote => 'Жазбаны жою';

  @override
  String get deleteNoteConfirm => 'Бұл жазбаны жоюға сенімдісіз бе?';

  @override
  String get noteTitle => 'Тақырып';

  @override
  String get noteContent => 'Мазмұн';

  @override
  String get addItem => 'Элемент қосу';

  @override
  String get pinNote => 'Бекіту';

  @override
  String get unpinNote => 'Бекітуден алу';

  @override
  String get noteColor => 'Түс';

  @override
  String get notePassword => 'Құпия сөз';

  @override
  String get setPassword => 'Құпия сөз орнату';

  @override
  String get changePassword => 'Құпия сөзді өзгерту';

  @override
  String get removePassword => 'Құпия сөзді жою';

  @override
  String get enterPassword => 'Құпия сөзді енгізіңіз';

  @override
  String get confirmPassword => 'Құпия сөзді растаңыз';

  @override
  String get passwordPin => 'PIN код';

  @override
  String get passwordText => 'Мәтіндік құпия сөз';

  @override
  String get protectedNote => 'Қорғалған жазба';

  @override
  String get incorrectPassword => 'Қате құпия сөз';

  @override
  String get passwordSet => 'Құпия сөз орнатылды';

  @override
  String get passwordRemoved => 'Құпия сөз жойылды';

  @override
  String get notesBiometric => 'Жазбалар үшін Face ID';

  @override
  String get notesBiometricSubtitle =>
      'Қорғалған жазбаларды ашу үшін биометриялық аутентификация талап ету';

  @override
  String get textNote => 'Мәтіндік жазба';

  @override
  String get checklistNote => 'Тексеру тізімі';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total тапсырма';
  }

  @override
  String get autoSaved => 'Сақталды';

  @override
  String get searchNotes => 'Жазба іздеу';

  @override
  String get legalConsent => 'Заңды келісім';

  @override
  String get confirmAge13 => 'Менің жасым кемінде 13 екенін растаймын';

  @override
  String get acceptLegalStart => 'Мен қабылдаймын ';

  @override
  String get privacyPolicy => 'Құпиялылық саясатын';

  @override
  String get termsOfService => 'Қызмет көрсету шарттарын';

  @override
  String get andThe => ' және ';

  @override
  String get continueButton => 'Жалғастыру';

  @override
  String get mustAcceptTerms =>
      'Жалғастыру үшін екі шартты да қабылдауыңыз керек';

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
  String get support => 'Қолдау';

  @override
  String get contactSupport => 'Қолдау қызметіне хабарласу';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Теріс пайдалануды хабарлау';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Құқықтық';

  @override
  String get legalEntity => 'Заңды тұлға';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Бекіту';

  @override
  String get unpinConversation => 'Бекітуден алу';

  @override
  String get hideConversation => 'Лентадан жою';

  @override
  String get deleteConversation => 'Сұхбатты жою';

  @override
  String get deleteConversationConfirm =>
      'Барлық хабарламаларды жоюды растау үшін PIN-ді енгізіңіз';

  @override
  String get noConversations => 'Әзірге сұхбаттар жоқ';

  @override
  String get startConversation => 'Бастау';

  @override
  String get microphonePermissionRequired => 'Микрофон рұқсаты қажет';

  @override
  String get microphonePermissionExplanation =>
      'Hash-қа қоңырау шалу үшін микрофон қажет.';

  @override
  String get cameraPermissionExplanation =>
      'Hash-қа бейне қоңырау үшін камера қажет.';

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
  String get openSettings => 'Баптауларды ашу';

  @override
  String get callConnecting => 'Қосылуда...';

  @override
  String get callRinging => 'Шақыруда...';

  @override
  String get callReconnecting => 'Қайта қосылуда...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Қайта қосылуда ($secondsс)';
  }

  @override
  String get callPaused => 'Үзіліс';

  @override
  String get callPausedSubtitle => 'Қоңырау әлі жалғасуда';

  @override
  String get callRemoteMicMuted => 'Контакттың микрофоны өшірілген';

  @override
  String get callMiniControlsMute => 'Өшіру';

  @override
  String get callMiniControlsUnmute => 'Қосу';

  @override
  String get callMiniControlsHangUp => 'Қою';

  @override
  String get callMiniControlsReturn => 'Қоңырауға оралу';

  @override
  String get callNetworkPoor => 'Тұрақсыз байланыс';

  @override
  String get callNetworkLost => 'Байланыс жоғалды';

  @override
  String get callEndedTitle => 'Қоңырау аяқталды';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Құрылғы деректері';

  @override
  String get deviceDataSubtitle => 'Жергілікті және сервер сақтауышы';

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
  String get localStorage => 'Жергілікті сақтауыш';

  @override
  String get onThisDevice => 'осы құрылғыда';

  @override
  String get encryptedDatabases => 'Шифрланған деректер қоры';

  @override
  String get files => 'Файлдар';

  @override
  String get secureKeychain => 'Қауіпсіз кілттік';

  @override
  String get cache => 'Кэш';

  @override
  String get contactsDetail => 'Аттар, аватарлар, Signal кілттері';

  @override
  String get messagesDetail => 'Шифрланған сұхбаттар';

  @override
  String get notesDetail => 'Жеке жазбалар';

  @override
  String get signalSessions => 'Signal сеанстары';

  @override
  String get signalSessionsDetail => 'Шифрлау сеанстары';

  @override
  String get pendingContacts => 'Күтілетін контактілер';

  @override
  String get pendingContactsDetail => 'Күтілетін сұраныстар';

  @override
  String get callHistory => 'Қоңыраулар';

  @override
  String get callHistoryDetail => 'Қоңырау тарихы';

  @override
  String get preferences => 'Қалаулар';

  @override
  String get preferencesDetail => 'Медиа және қоңырау қалаулары';

  @override
  String get avatars => 'Аватарлар';

  @override
  String get media => 'Медиа';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файл',
      one: '1 файл',
      zero: 'файл жоқ',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Белсенді';

  @override
  String get notDefined => 'Анықталмаған';

  @override
  String get biometrics => 'Биометрия';

  @override
  String get recoveryPhrase => 'Қалпына келтіру фразасы';

  @override
  String get identity => 'Жеке бас (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol кілттері';

  @override
  String get authTokens => 'Аутентификация токендері';

  @override
  String get contactNamesCache => 'Контакт аттар кэші';

  @override
  String get remoteConfig => 'Қашықтағы конфигурация';

  @override
  String get notificationPrefs => 'Хабарландыру қалаулары';

  @override
  String get serverData => 'Сервер деректері';

  @override
  String get serverDataInfo =>
      'Hash серверде ең аз деректерді сақтайды, барлығы шифрланған немесе уақытша.';

  @override
  String get serverProfile => 'Профиль';

  @override
  String get serverProfileDetail =>
      'Hash ID, ашық кілттер, пошта жәшігі токені';

  @override
  String get serverPrekeys => 'Алдын ала кілттер';

  @override
  String get serverPrekeysDetail => 'Бір рет Signal кілттері (қолданылған)';

  @override
  String get serverMessages => 'Транзиттегі хабарламалар';

  @override
  String get serverMessagesDetail =>
      'Жеткізуден кейін жойылады (ең көбі 24 сағ)';

  @override
  String get serverMedia => 'Транзиттегі медиа';

  @override
  String get serverMediaDetail => 'Жүктеуден кейін жойылады';

  @override
  String get serverContactRequests => 'Контакт сұраныстары';

  @override
  String get serverContactRequestsDetail => '24 сағаттан кейін аяқталады';

  @override
  String get serverRateLimits => 'Жылдамдық шектеулері';

  @override
  String get serverRateLimitsDetail =>
      'Уақытша теріс пайдалануға қарсы деректер';

  @override
  String get privacyReassurance =>
      'Hash хабарламаларыңызды оқи алмайды. Барлық деректер толық шифрланған. Сервер деректері автоматты түрде жойылады.';

  @override
  String get pinTooSimple =>
      'Бұл PIN тым қарапайым. Қауіпсізірек код таңдаңыз.';

  @override
  String get genericError => 'Қате пайда болды. Қайталап көріңіз.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Аккаунт жасау мүмкін емес: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Фраза алмасу буферіне көшірілді';

  @override
  String get copyPhrase => 'Фразаны көшіру';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Бұл фразаны қауіпсіз жерге жазып алыңыз. Бұл фразасыз PIN-ді жоғалтсаңыз, деректеріңізге кіру мүмкіндігін біржола жоғалтасыз.';

  @override
  String get noMessages => 'Хабарламалар жоқ';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name бар барлық хабарламаларды жою?';
  }

  @override
  String get confirmation => 'Растау';

  @override
  String get untitled => 'Атаусыз';

  @override
  String get noSessions => 'Сеанстар жоқ';

  @override
  String get unknownContact => 'Белгісіз контакт';

  @override
  String get unnamed => 'Атсыз';

  @override
  String get noPendingRequestsAlt => 'Күтілетін сұраныстар жоқ';

  @override
  String get deleteAllCallHistory => 'Барлық қоңырау тарихын жою?';

  @override
  String get noCalls => 'Қоңыраулар жоқ';

  @override
  String get noPreferences => 'Қалаулар жоқ';

  @override
  String get resetAllMediaPrefs => 'Барлық медиа қалауларын қалпына келтіру?';

  @override
  String get deleteThisAvatar => 'Бұл аватарды жою?';

  @override
  String get deleteAllAvatars => 'Барлық аватарларды жою?';

  @override
  String get noAvatars => 'Аватарлар жоқ';

  @override
  String get deleteThisFile => 'Бұл файлды жою?';

  @override
  String get deleteAllMediaFiles => 'Барлық медианы жою?';

  @override
  String get noMediaFiles => 'Медиа жоқ';

  @override
  String get outgoing => 'Шығыс';

  @override
  String get incoming => 'Кіріс';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Уақытша көрініс: $secondsс';
  }

  @override
  String get normalView => 'Қалыпты көрініс';

  @override
  String get callReasonCompleted => 'Аяқталды';

  @override
  String get callReasonMissed => 'Жіберіп алынды';

  @override
  String get callReasonDeclined => 'Бас тартылды';

  @override
  String get callReasonFailed => 'Сәтсіз';

  @override
  String get justNow => 'Дәл қазір';

  @override
  String timeAgoMinutes(int count) {
    return '$count мин бұрын';
  }

  @override
  String timeAgoHours(int count) {
    return '$count сағ бұрын';
  }

  @override
  String timeAgoDays(int count) {
    return '$count күн бұрын';
  }

  @override
  String get messageTypeContact => 'Контакт';

  @override
  String get messageTypeLocation => 'Орналасқан жер';

  @override
  String get statusQueued => 'Кезекте';

  @override
  String get blockedBadge => 'Блокталған';

  @override
  String get protectedBadge => 'Қорғалған';

  @override
  String messageCount(int count) {
    return '$count хабарлама';
  }

  @override
  String get deleteQuestion => 'Жою?';

  @override
  String get transferMyAccountTitle => 'Аккаунтымды тасымалдау';

  @override
  String get loadingError => 'Жүктеу қатесі';

  @override
  String get transferToNewDevice => 'Жаңа құрылғыға тасымалдау';

  @override
  String get transferInstructions =>
      'Жаңа құрылғыда \"Аккаунтымды қалпына келтіру\" таңдап, осы ақпаратты енгізіңіз:';

  @override
  String get yourHashIdLabel => 'Hash ID-іңіз';

  @override
  String get enterYourPinCode => 'PIN кодыңызды енгізіңіз';

  @override
  String get pinOwnerConfirmation =>
      'Осы аккаунттың иесі екеніңізді растау үшін';

  @override
  String get scanThisQrCode => 'Осы QR кодты сканерлеңіз';

  @override
  String get withYourNewDevice => 'Жаңа құрылғыңызбен';

  @override
  String get orEnterTheCode => 'немесе кодты енгізіңіз';

  @override
  String get transferCodeLabel => 'Тасымалдау коды';

  @override
  String get proximityVerification => 'Жақындық тексерісі';

  @override
  String get bringDevicesCloser => 'Екі құрылғыны жақындатыңыз';

  @override
  String get confirmTransferQuestion => 'Тасымалдауды растау?';

  @override
  String get accountWillBeTransferred =>
      'Аккаунтыңыз жаңа құрылғыға тасымалданады.\n\nБұл құрылғы біржола ажыратылады.';

  @override
  String get transferComplete => 'Тасымалдау аяқталды';

  @override
  String get transferSuccessMessage =>
      'Аккаунтыңыз сәтті тасымалданды.\n\nБұл қосымша енді жабылады.';

  @override
  String get manualVerification => 'Қолмен тексеру';

  @override
  String get codeDisplayedOnBothDevices => 'Екі құрылғыда көрсетілген код:';

  @override
  String get doesCodeMatchNewDevice =>
      'Бұл код жаңа құрылғыдағы кодпен сәйкес келе ме?';

  @override
  String get verifiedStatus => 'Тексерілді';

  @override
  String get inProgressStatus => 'Орындалуда...';

  @override
  String get notAvailableStatus => 'Қолжетімсіз';

  @override
  String get codeExpiredRestart => 'Код мерзімі аяқталды. Қайтадан бастаңыз.';

  @override
  String get codesDoNotMatchCancelled =>
      'Кодтар сәйкес келмейді. Тасымалдау болдырылмады.';

  @override
  String transferToDevice(String device) {
    return 'Кімге: $device';
  }

  @override
  String get copiedExclamation => 'Көшірілді!';

  @override
  String expiresInTime(String time) {
    return '$time кейін аяқталады';
  }

  @override
  String get biometricNotAvailable => 'Бұл құрылғыда биометрия қолжетімсіз';

  @override
  String get biometricAuthError => 'Биометриялық аутентификация қатесі';

  @override
  String get authenticateForBiometric =>
      'Биометрияны қосу үшін аутентификация жасаңыз';

  @override
  String get biometricAuthFailed => 'Биометриялық аутентификация сәтсіз';

  @override
  String get forceUpdateTitle => 'Жаңарту қажет';

  @override
  String get forceUpdateMessage =>
      'Hash-тың жаңа нұсқасы қолжетімді. Жалғастыру үшін жаңартыңыз.';

  @override
  String get updateButton => 'Жаңарту';

  @override
  String get maintenanceInProgress => 'Техникалық қызмет көрсетілуде';

  @override
  String get tryAgainLater => 'Кейінірек қайталап көріңіз';

  @override
  String get information => 'Ақпарат';

  @override
  String get later => 'Кейінірек';

  @override
  String get doYouLikeHash => 'Сізге Hash ұнай ма?';

  @override
  String get yourFeedbackHelps =>
      'Сіздің пікіріңіз қосымшаны жақсартуға көмектеседі';

  @override
  String get ratingTerrible => 'Өте нашар';

  @override
  String get ratingBad => 'Нашар';

  @override
  String get ratingOk => 'Қалыпты';

  @override
  String get ratingGood => 'Жақсы';

  @override
  String get ratingExcellent => 'Керемет!';

  @override
  String get donationMessage =>
      'Hash коммерциялық емес жоба. Сіздің қолдауыңыз шынайы құпия мессенджер жасауды жалғастыруға көмектеседі.';

  @override
  String get recentConnections => 'Соңғы қосылулар';

  @override
  String get loginInfoText =>
      'Әрбір PIN арқылы ашу жергілікті түрде жазылады. Тек соңғы 24 сағат сақталады.';

  @override
  String get connectionCount => 'Қосылу(лар)';

  @override
  String get periodLabel => 'Кезең';

  @override
  String get historyLabel => 'Тарих';

  @override
  String get noLoginRecorded => 'Кіру жазылмаған';

  @override
  String get nextUnlocksAppearHere => 'Келесі ашулар осы жерде көрінеді.';

  @override
  String get dataLocalOnly =>
      'Бұл деректер тек сіздің құрылғыңызда сақталады және ешқашан жіберілмейді.';

  @override
  String get currentSession => 'Ағымдағы';

  @override
  String get todayLabel => 'Бүгін';

  @override
  String get yesterdayLabel => 'Кеше';

  @override
  String get justNowLabel => 'Дәл қазір';

  @override
  String minutesAgoLabel(int count) {
    return '$count мин бұрын';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours сағ бұрын';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours сағ $minutes мин бұрын';
  }

  @override
  String get noMaintenancePlanned => 'Жоспарланған техникалық қызмет жоқ';

  @override
  String get everythingWorkingNormally => 'Барлығы қалыпты жұмыс істеуде';

  @override
  String get maintenanceTitle => 'Техникалық қызмет';

  @override
  String get maintenanceActiveLabel => 'ЖҮРУДЕ';

  @override
  String get maintenancePlannedLabel => 'ЖОСПАРЛАНҒАН';

  @override
  String get locking => 'Құлыпталуда...';

  @override
  String get newMessageNotification => 'Жаңа хабарлама';

  @override
  String get secExplainTitle => 'Hash сізді қалай қорғайды';

  @override
  String get secExplainIntro =>
      'Hash ешкім хабарламаларыңызды оқи алмайтындай жасалған.';

  @override
  String get secExplainIntroSub =>
      'Тіпті біз де.\nМұның қалай жұмыс істейтінін, қарапайым тілмен.';

  @override
  String get secJourneyLabel => 'ЖОЛ';

  @override
  String get secJourneyTitle => 'Хабарламаңыздың жолы';

  @override
  String get secJourneySubtitle =>
      'Саусағыңыздан контактіңіздің экранына дейін, әр қадам қорғалған. Жолды бақылаңыз.';

  @override
  String get secStep1Title => 'Хабарлама жазасыз';

  @override
  String get secStep1Desc =>
      'Қосымшада \"Сәлем!\" деп жазасыз. Бұл сәтте хабарлама тек телефон жадында бар. Ештеңе жіберілмеген.';

  @override
  String get secStep2Title => 'Signal Protocol шифрлауы';

  @override
  String get secStep2Desc =>
      '\"Жіберу\" басысымен хабарламаңыз түсініксіз таңбалар тізбегіне айналады. Хабарламаңыз кілті тек контактіңізде бар сейфке салынғандай.';

  @override
  String get secStep3Title => 'Sealed Sender: көрінбейтін конверт';

  @override
  String get secStep3Desc =>
      'Пошта арқылы хат жіберіп, бірақ конверттегі жіберушінің мекенжайы жоқ деп елестетіңіз. Hash дәл осылай жасайды. Хабарлама анонимді пошта жәшігіне салынады. Сервер оны кімнің жібергенін білмейді.';

  @override
  String get secStep4Title => 'Сервер ештеңе көрмейді';

  @override
  String get secStep4Desc =>
      'Сервер соқыр пошташы сияқты. Ол тек \"біреу #A7X9 жәшігіне бірдеңе салды\" деп біледі. Кімнің жібергенін, не екенін немесе кімге арналғанын білмейді.';

  @override
  String get secStep4Highlight =>
      'Метадеректер сақталмайды: IP мекенжай жоқ, уақыт белгісі жоқ, жіберуші мен алушы арасында байланыс жоқ.';

  @override
  String get secStep5Title => 'Контактіңіз хабарламаны алады';

  @override
  String get secStep5Desc =>
      'Контактіңіздің телефоны анонимді пошта жәшігінен мазмұнды алады және хабарламаны құрылғыдан ешқашан кетпеген жеке кілтімен шифрын ашады. Экранда \"Сәлем!\" көрінеді.';

  @override
  String get secStep6Title => 'Хабарлама серверден жоғалады';

  @override
  String get secStep6Desc =>
      'Контактіңіз қабылдауды растағаннан кейін, сервер хабарламаны біржола жояды. Себет жоқ, мұрағат жоқ, сақтық көшірме жоқ. Тіпті оқылмаған хабарламалар 24 сағаттан кейін автоматты түрде жойылады.';

  @override
  String get secStep7Title => 'Жергілікті мерзім аяқталуы';

  @override
  String get secStep7Desc =>
      'Контактіңіздің телефонында хабарлама сіз таңдаған ұзақтыққа сәйкес өзін-өзі жояды: оқығаннан кейін бірден, 5 минут, 1 сағат... сіз шешесіз.';

  @override
  String get secJourneyConclusion =>
      'Нәтиже: серверде нөлдік із, құрылғыларда нөлдік із. Хабарлама тек оқылу үшін болды, содан кейін жоғалды.';

  @override
  String get secArchLabel => 'АРХИТЕКТУРА';

  @override
  String get secArchTitle => 'Қорғаныстың 5 қабаты';

  @override
  String get secArchSubtitle =>
      'Hash бір технологияға сенбейді. Әр қабат басқаларын нығайтады. Тіпті бір қабат бұзылса да, деректеріңіз қауіпсіз қалады.';

  @override
  String get secLayer1Title => 'Толық шифрлау';

  @override
  String get secLayer1Desc =>
      'Әр хабарлама бірегей кілтпен шифрланады. Қарапайым тілмен: біреу бір хабарламаның шифрын ашса да, келесісін аша алмайды. Әр хабарламаның өз құлпы бар.';

  @override
  String get secLayer1Detail =>
      'Файлдар (фотолар, бейнелер, құжаттар) үшін Hash қосымша AES-256-GCM шифрлау қолданады. Файл телефоныңыздан шықпас бұрын шифрланады.';

  @override
  String get secLayer2Title => 'Sealed Sender (желі анонимдігі)';

  @override
  String get secLayer2Desc =>
      'Кәдімгі мессенджерлер хабарламаларыңызды жеке басыңызбен жібереді. Бұл конвертке атыңызды жазу сияқты. Hash анонимді пошта жәшіктерін қолданады: сервер хабарламаны кімнің жібергенін білмей жеткізеді.';

  @override
  String get secLayer2Detail =>
      'Нәтиже: тіпті сервер деректері ағып кетсе де, кімнің кіммен сөйлескенін қалпына келтіру мүмкін емес.';

  @override
  String get secLayer3Title => 'Автоматты жою';

  @override
  String get secLayer3Desc =>
      'Хабарламалар қабылдау расталысымен серверден жойылады. Тіпті хабарлама ешқашан алынбаса, 24 сағаттан кейін автоматты түрде жойылады.';

  @override
  String get secLayer3Detail =>
      'Телефоныңызда хабарламалар сіз таңдаған ұзақтыққа сәйкес өзін-өзі жояды: бірден, 5 мин, 15 мин, 30 мин, 1 сағ, 3 сағ, 6 сағ немесе 12 сағ.';

  @override
  String get secLayer4Title => 'Жергілікті кіру қорғанысы';

  @override
  String get secLayer4Desc =>
      'Қосымша 6 таңбалы PIN және/немесе биометриямен (Face ID, саусақ ізі) қорғалған. Тым көп сәтсіз әрекеттен кейін, қосымша әр сәтсіздіктен кейін ұлғаятын кідіріспен құлыпталады.';

  @override
  String get secLayer5Title => 'Құлыпталған деректер қоры';

  @override
  String get secLayer5Desc =>
      'Сервер жағында ешбір пайдаланушы деректер қорына тікелей жаза алмайды. Барлық әрекеттер әр сұранысты тексеретін қауіпсіз функциялар арқылы өтеді.';

  @override
  String get secLayer5Detail =>
      'Бұл банк есептеуіші сияқты: сіз ешқашан сейфке тікелей тимейсіз. Сұраныс жасайсыз, жүйе әрекет жасамас бұрын құқығыңызды тексереді.';

  @override
  String get secVashLabel => 'ӘЛЕМДЕ БІРЕГЕЙ';

  @override
  String get secVashTitle => 'Vash режимі';

  @override
  String get secVashSubtitle =>
      'Басқа ешбір мессенджерде жоқ төтенше қауіпсіздік жүйесі.';

  @override
  String get secVashScenarioTitle => 'Мына жағдайды елестетіңіз';

  @override
  String get secVashScenario1 => 'Біреу телефоныңызға қол жеткізеді';

  @override
  String get secVashScenario2 => 'Сізден PIN кодты сұрайды';

  @override
  String get secVashScenario3 => 'Барлық деректеріңізді шұғыл жойғыңыз келеді';

  @override
  String get secVashSolutionTitle => 'Шешім: екі PIN код';

  @override
  String get secVashSolutionDesc => 'Hash-та екі басқа PIN код баптайсыз:';

  @override
  String get secVashNormalCodeLabel => 'Қалыпты код';

  @override
  String get secVashNormalCodeDesc =>
      'Барлық деректеріңізбен қосымшаны қалыпты ашады';

  @override
  String get secVashCodeLabel2 => 'Vash коды';

  @override
  String get secVashCodeDescription =>
      'Қосымшаны қалыпты ашады... бірақ барлық деректеріңіз артта үнсіз жойылады';

  @override
  String get secVashWhatHappensTitle => 'Содан кейін не болады';

  @override
  String get secVashWhatHappensDesc =>
      'Қосымша қалыпты ашылады. Ескерту жоқ, күдікті анимация жоқ. Экранда жай ғана бос қосымша көрінеді, оны жаңа ғана орнатқандай.\n\nШындығында, барлық сұхбаттарыңыз, контактілеріңіз және хабарламаларыңыз секундтың бөлшегінде қайтарымсыз жойылды.';

  @override
  String get secCallsLabel => 'ҚОҢЫРАУЛАР ЖӘНЕ ФАЙЛДАР';

  @override
  String get secCallsTitle => 'Бәрі шифрланған';

  @override
  String get secCallsSubtitle =>
      'Бұл тек хабарламалар туралы емес. Hash арқылы өтетін барлық нәрсе толық шифрланған.';

  @override
  String get secAudioCallTitle => 'Аудио қоңыраулар';

  @override
  String get secAudioCallDesc =>
      'WebRTC арқылы толық шифрланған. Дауыс тікелей құрылғылар арасында беріледі.';

  @override
  String get secVideoCallTitle => 'Бейне қоңыраулар';

  @override
  String get secVideoCallDesc => 'Дәл сол технология, әр ағын жеке шифрланған.';

  @override
  String get secPhotosTitle => 'Фотолар және бейнелер';

  @override
  String get secPhotosDesc =>
      'Телефоныңыздан шықпас бұрын AES-256-GCM-мен шифрланған.';

  @override
  String get secDocsTitle => 'Құжаттар';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, кез келген файл. Аты, көлемі және мазмұны шифрланған.';

  @override
  String get secAnonLabel => 'АНОНИМДІК';

  @override
  String get secAnonTitle => 'Жеке бас қажет емес';

  @override
  String get secAnonSubtitle =>
      'Hash ешқашан телефон нөміріңізді немесе электрондық поштаңызды сұрамайды. Сіз бірегей және анонимді Hash ID арқылы анықталасыз.';

  @override
  String get secHashIdTitle => 'Hash ID-іңіз';

  @override
  String get secHashIdDesc =>
      'Бұл сіздің бірегей идентификаторыңыз. Ол сіз туралы ештеңе ашпайды: атыңызды да, нөміріңізді де, орналасқан жеріңізді де. Бұл нақты жеке басыңызбен байланыстыру мүмкін емес лақап ат сияқты.\n\nКонтакт қосу үшін Hash ID-іңізбен бөлісесіз немесе QR кодты сканерлейсіз. Бәрі осы. Синхрондалған мекенжай кітапшасы жоқ, \"Сіз білуіңіз мүмкін адамдар\" ұсыныстары жоқ.';

  @override
  String get secDataLabel => 'ДЕРЕКТЕР';

  @override
  String get secDataTitle => 'Hash не білмейді';

  @override
  String get secDataSubtitle =>
      'Деректеріңізді қорғаудың ең жақсы жолы — оларды жинамау.';

  @override
  String get secNeverCollected => 'Ешқашан жиналмайды';

  @override
  String get secNeverItem1 => 'Хабарлама мазмұны';

  @override
  String get secNeverItem2 => 'Контактілер тізімі';

  @override
  String get secNeverItem3 => 'Телефон нөмірі';

  @override
  String get secNeverItem4 => 'Электрондық пошта мекенжайы';

  @override
  String get secNeverItem5 => 'IP мекенжайы';

  @override
  String get secNeverItem6 => 'Орналасқан жер';

  @override
  String get secNeverItem7 => 'Метадеректер (кім кіммен сөйлеседі)';

  @override
  String get secNeverItem8 => 'Қоңырау тарихы';

  @override
  String get secNeverItem9 => 'Мекенжай кітапшасы';

  @override
  String get secNeverItem10 => 'Жарнама идентификаторлары';

  @override
  String get secTempStored => 'Уақытша сақталады';

  @override
  String get secTempItem1 => 'Анонимді Hash ID (бірегей идентификатор)';

  @override
  String get secTempItem2 => 'Ашық шифрлау кілттері';

  @override
  String get secTempItem3 =>
      'Транзиттегі шифрланған хабарламалар (ең көбі 24 сағ)';

  @override
  String get secTempNote =>
      'Тіпті бұл минималды деректер сізді анықтауға мүмкіндік бермейді. Hash ID-іңіз ешбір жеке ақпаратпен байланыстырылмаған.';

  @override
  String get secFooterTitle => 'Құпиялылығыңыз, бостандығыңыз';

  @override
  String get secFooterDesc =>
      'Hash ең талапшыл кәсіби қосымшалармен бірдей шифрлау технологияларын қолданады. Хабарламаларыңыз математикамен қорғалған, уәделермен емес.';

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
