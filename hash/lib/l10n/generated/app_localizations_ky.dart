// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kirghiz Kyrgyz (`ky`).
class AppLocalizationsKy extends AppLocalizations {
  AppLocalizationsKy([String locale = 'ky']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Из жок. Компромисс жок.';

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
  String get contacts => 'Контакттар';

  @override
  String get noConversation => 'Чат жок';

  @override
  String get noConversationSubtitle =>
      'Коопсуз баарлашууну баштоо үчүн контакт кошуңуз';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count күтүлгөн суроо',
      one: '1 күтүлгөн суроо',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count жөнөтүлгөн суроо күтүүдө',
      one: '1 жөнөтүлгөн суроо күтүүдө',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Контакт кошуу';

  @override
  String get shareApp => 'Колдонмону бөлүшүү';

  @override
  String get newMessage => 'Жаңы кат';

  @override
  String get newConversation => 'Кат жөнөтүү';

  @override
  String get settings => 'Жөндөөлөр';

  @override
  String get myHashId => 'Менин Hash ID';

  @override
  String get supportHash => 'Hash\'ты колдоо';

  @override
  String get supportHashSubtitle => 'Hash — коммерциялык эмес долбоор';

  @override
  String get donate => 'Кайрымдуулук кылуу';

  @override
  String get appearance => 'Көрүнүш';

  @override
  String get theme => 'Тема';

  @override
  String get themeAuto => 'Автоматтык';

  @override
  String get themeAutoSubtitle => 'Тутум жөндөөлөрүнө ылайык';

  @override
  String get themeDark => 'Караңгы';

  @override
  String get themeLight => 'Жарык';

  @override
  String get themeRecommendation => 'Жашыруундук үчүн караңгы тема сунушталат';

  @override
  String get language => 'Тил';

  @override
  String get languageAuto => 'Автоматтык (тутум)';

  @override
  String get notifications => 'Билдирмелер';

  @override
  String get messages => 'Каттар';

  @override
  String get calls => 'Чалуулар';

  @override
  String get vibration => 'Титирөө';

  @override
  String get notificationContent => 'Билдирме мазмуну';

  @override
  String get notificationContentFull => 'Баарын көрсөтүү';

  @override
  String get notificationContentFullDesc =>
      'Контакттын аты жана каттын алдын ала көрүнүшү';

  @override
  String get notificationContentName => 'Аты гана';

  @override
  String get notificationContentNameDesc => 'Контакттын атын гана көрсөтөт';

  @override
  String get notificationContentDiscrete => 'Жашыруун';

  @override
  String get notificationContentDiscreteDesc => '\"Жаңы кат\" гана көрсөтөт';

  @override
  String get security => 'Коопсуздук';

  @override
  String get howHashProtectsYou => 'Hash сизди кантип коргойт';

  @override
  String get howHashProtectsYouSubtitle => 'Коопсуздугуңузду түшүнүңүз';

  @override
  String get accountSecurity => 'Аккаунт коопсуздугу';

  @override
  String get accountSecuritySubtitle => 'PIN, биометрия, Vash режими';

  @override
  String get blockScreenshots => 'Скриншотторду бөгөттөө';

  @override
  String get transferDevice => 'Башка түзмөккө өткөрүү';

  @override
  String get transferDeviceSubtitle => 'Аккаунтуңузду көчүрүү';

  @override
  String get pinCode => 'PIN код';

  @override
  String get changePin => 'PIN кодду өзгөртүү';

  @override
  String get currentPin => 'Учурдагы PIN код';

  @override
  String get newPin => 'Жаңы PIN код';

  @override
  String get confirmPin => 'PIN кодду ырастоо';

  @override
  String get pinChanged => 'PIN код өзгөртүлдү';

  @override
  String get incorrectPin => 'Туура эмес PIN';

  @override
  String get pinsDoNotMatch => 'PIN коддор дал келбейт';

  @override
  String get autoLock => 'Авто-кулпулоо';

  @override
  String get autoLockDelay => 'Кулпулоо кечиктирүүсү';

  @override
  String get autoLockImmediate => 'Заматта';

  @override
  String get autoLockMinute => '1 мүнөт';

  @override
  String autoLockMinutes(int count) {
    return '$count мүнөт';
  }

  @override
  String get vashCode => 'Vash коду';

  @override
  String get vashModeTitle => 'Vash режими';

  @override
  String get vashModeExplanation => 'Сиздин акыркы коопсуздук тармагыңыз.';

  @override
  String get vashModeDescription =>
      'Сиз экинчи PIN кодду тандайсыз. Эгер сизди Hash\'ты ачууга мажбурлашса, кадимки PIN\'иңиздин ордуна бул кодду киргизиңиз.\n\nКолдонмо кадимкидей ачылат, бирок бардык сүйлөшүүлөрүңүз жана контакттарыңыз жок болот.\n\nЭкраныңызды караган ар бир адам үчүн Hash жөн гана бош көрүнөт — эч качан колдонулбагандай.';

  @override
  String get vashModeIrreversible => 'Бул аракет үнсүз жана кайтарылгыс.';

  @override
  String get chooseVashCode => 'Vash кодумду тандоо';

  @override
  String get vashCodeInfo =>
      'Колдонмону кадимкидей ачкан, бирок бош экинчи PIN код.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Эгер сиз PIN\'иңиздин ордуна бул кодду киргизсеңиз:';

  @override
  String get vashDeleteContacts => 'Контакттарыңыз жоголот';

  @override
  String get vashDeleteMessages => 'Сүйлөшүүлөрүңүз жоголот';

  @override
  String get vashDeleteHistory => 'Жазуулардарыңыз жоголот';

  @override
  String get vashKeepId =>
      'Hash идентификацияңыз (#XXX-XXX-XXX) ошол бойдон калат';

  @override
  String get vashAppearNormal =>
      'Колдонмо кадимки, бирок бош, жаңыдай көрүнөт. Бул аракет кайтарылгыс.';

  @override
  String get setupVashCode => 'Vash кодун орнотуу';

  @override
  String get modifyVashCode => 'Vash кодун өзгөртүү';

  @override
  String get currentVashCode => 'Учурдагы Vash коду';

  @override
  String get newVashCode => 'Жаңы Vash коду';

  @override
  String get confirmVashCode => 'Vash кодун ырастоо';

  @override
  String get vashCodeConfigured => 'Vash коду конфигурацияланды';

  @override
  String get vashCodeModified => 'Vash коду өзгөртүлдү';

  @override
  String get vashCodeMustDiffer => 'Vash коду PIN\'ден айырмаланышы керек';

  @override
  String get incorrectVashCode => 'Туура эмес Vash коду';

  @override
  String get vashWhatToDelete => 'Vash режими менен эмнени жоготуу керек?';

  @override
  String get vashDeleteContactsOption => 'Контакттар';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Каттар';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Жазуулар';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash режими иштетилди';

  @override
  String get vashCreateSubtitle => 'Негизги PIN\'иңизден башка код тандаңыз';

  @override
  String get vashConfirmSubtitle => 'Vash кодуңузду ырастаңыз';

  @override
  String get pinCodeForEntry => 'Колдонмого кирүү үчүн PIN код';

  @override
  String get vashCodeSection => 'Vash режими';

  @override
  String get biometric => 'Биометрия';

  @override
  String get biometricUnlock => 'Манжа изи же Face ID менен кулпуну ачуу';

  @override
  String get enableBiometric => 'Биометрияны иштетүү';

  @override
  String get biometricWarningMessage =>
      'Биометрияны иштетсеңиз, колдонмого кирүү үчүн Vash кодуңузду колдоно албайсыз.\n\nVash кодун биометрия иштебей калганда гана колдоно аласыз (бир нече ийгиликсиз аракеттен кийин).\n\nУлантууну каалайсызбы?';

  @override
  String get understood => 'Түшүндүм';

  @override
  String get shareAppSubtitle => 'Hash\'ты жакындарыңыз менен бөлүшүңүз';

  @override
  String get share => 'Бөлүшүү';

  @override
  String get danger => 'Коркунуч';

  @override
  String get deleteAccount => 'Аккаунтумду өчүрүү';

  @override
  String get deleteAccountSubtitle => 'Кайтарылгыс аракет';

  @override
  String get deleteAccountConfirmTitle => 'Аккаунтумду өчүрүү';

  @override
  String get deleteAccountConfirmMessage =>
      'Аккаунтуңуз биротоло өчүрүлөт. Бул аракет кайтарылгыс.\n\n• Бардык чаттарыңыз\n• Бардык контакттарыңыз\n• Hash ID\'ңыз\n\nЖаңы аккаунт түзүшүңүз керек болот.';

  @override
  String get deleteForever => 'Биротоло өчүрүү';

  @override
  String get cancel => 'Жокко чыгаруу';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash режими иштетилди.';

  @override
  String deletionError(String error) {
    return 'Өчүрүү катасы: $error';
  }

  @override
  String get yourSecurity => 'Сиздин коопсуздугуңуз';

  @override
  String get securityInfo =>
      '• Учтан-учка шифрлөө (Signal Protocol)\n• Жеткирүүдөн кийин серверлерибизде маалымат жок\n• Ачкычтар сиздин түзмөктө гана сакталат\n• PIN код эч качан серверге жөнөтүлбөйт';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Кош келиңиз';

  @override
  String get securityStatement1 => 'Каттарыңыз корголгон.';

  @override
  String get securityStatement2 => 'Учтан-учка шифрлөө.';

  @override
  String get securityStatement3 => 'Из жок. Компромисс жок.';

  @override
  String get securityStatement4 => 'Жашыруундугуңуз — бул укук.';

  @override
  String get accessBlocked => 'Кирүү бөгөттөлгөн';

  @override
  String get tooManyAttempts => 'Өтө көп аракет. Кийинчерээк кайталаңыз.';

  @override
  String get pleaseWait => 'Күтүңүз';

  @override
  String get waitDelay => 'Кечиктирүүнүн бүтүшүн күтүңүз';

  @override
  String attemptCount(int current, int max) {
    return 'Аракет $current / $max';
  }

  @override
  String retryIn(String time) {
    return '$time кийин кайталаңыз';
  }

  @override
  String get forgotPin =>
      'PIN\'ди унутуңузбу? Калыбына келтирүү фразасын колдонуңуз';

  @override
  String get useRecoveryPhrase => 'Калыбына келтирүү фразасын колдонуу';

  @override
  String get recoveryWarningTitle => 'Эскертүү';

  @override
  String get recoveryWarningMessage => 'Аккаунтту калыбына келтирүү:';

  @override
  String get recoveryDeleteAllMessages => 'БАРДЫК каттарыңызды өчүрөт';

  @override
  String get recoveryWaitDelay => '1 сааттык кечиктирүү талап кылат';

  @override
  String get recoveryKeepContacts => 'Контакттарыңызды сактайт';

  @override
  String get recoveryIrreversible =>
      'Бул аракет кайтарылгыс. Каттарыңыз биротоло жоголот.';

  @override
  String get iUnderstand => 'Түшүндүм';

  @override
  String get accountRecovery => 'Аккаунтту калыбына келтирүү';

  @override
  String get enterRecoveryPhrase =>
      'Калыбына келтирүү фразаңыздын 24 сөзүн боштуктар менен бөлүп киргизиңиз.';

  @override
  String get recoveryPhraseHint => 'сөз1 сөз2 сөз3 ...';

  @override
  String get recover => 'Калыбына келтирүү';

  @override
  String get recoveryPhraseRequired => 'Калыбына келтирүү фразасын киргизиңиз';

  @override
  String get recoveryPhrase24Words => 'Фраза так 24 сөздү камтышы керек';

  @override
  String get incorrectRecoveryPhrase => 'Туура эмес калыбына келтирүү фразасы';

  @override
  String get recoveryInitError => 'Калыбына келтирүүнү баштоо катасы';

  @override
  String get securityDelay => 'Коопсуздук кечиктирүүсү';

  @override
  String get securityDelayMessage =>
      'Коопсуздугуңуз үчүн жаңы PIN түзүүдөн мурун күтүү мөөнөтү талап кылынат.';

  @override
  String get timeRemaining => 'Калган убакыт';

  @override
  String get messagesDeletedForProtection => 'Каттарыңыз коргоо үчүн өчүрүлдү.';

  @override
  String get canCloseApp =>
      'Колдонмону жаап, кийинчерээк кайтып келсеңиз болот.';

  @override
  String get onboardingTitle1 => 'Hash\'ка кош келиңиз';

  @override
  String get onboardingSubtitle1 => 'Эч кандай из калтырбаган мессенжер';

  @override
  String get onboardingTitle2 => 'Толук шифрлөө';

  @override
  String get onboardingSubtitle2 =>
      'Каттарыңыз Signal протоколу менен учтан-учка шифрленген';

  @override
  String get onboardingTitle3 => 'Из жок';

  @override
  String get onboardingSubtitle3 =>
      'Каттар жеткирилгенден кийин серверлерден өчүрүлөт';

  @override
  String get onboardingTitle4 => 'Сиздин коопсуздугуңуз';

  @override
  String get onboardingSubtitle4 =>
      'PIN код, Vash режими жана калыбына келтирүү фразасы';

  @override
  String get getStarted => 'Баштоо';

  @override
  String get next => 'Кийинки';

  @override
  String get skip => 'Өткөрүп жиберүү';

  @override
  String get alreadyHaveAccount => 'Менде аккаунт бар';

  @override
  String get transferMyAccount => 'Аккаунтумду өткөрүү';

  @override
  String get createPin => 'PIN код түзүү';

  @override
  String get createPinSubtitle => 'Бул код колдонмоңузга кирүүнү коргойт';

  @override
  String get confirmYourPin => 'PIN кодуңузду ырастаңыз';

  @override
  String get confirmPinSubtitle => 'PIN кодуңузду кайра киргизиңиз';

  @override
  String get saveRecoveryPhrase => 'Калыбына келтирүү фразасы';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Бул 24 сөздү ирети менен жазып алыңыз. Алар PIN\'иңизди унутсаңыз аккаунтуңузду калыбына келтирүүгө мүмкүндүк берет.';

  @override
  String get phraseWritten => 'Фразамды жазып алдым';

  @override
  String get warningRecoveryPhrase =>
      'Эгер бул фразаны жоготуп, PIN\'иңизди унутсаңыз, аккаунтуңузга кирүүнү жоготосуз.';

  @override
  String get accountTransferred => 'Аккаунт өткөрүлдү';

  @override
  String get accountTransferredMessage =>
      'Аккаунтуңуз башка түзмөккө өткөрүлдү. Бул сессия жараксыз.';

  @override
  String get accountTransferredInfo =>
      'Бул өткөрүүнү сиз баштабасаңыз, аккаунтуңуз бузулган болушу мүмкүн.';

  @override
  String get logout => 'Чыгуу';

  @override
  String get transferAccount => 'Аккаунтту өткөрүү';

  @override
  String get transferAccountInfo =>
      'Hash аккаунтуңузду жаңы түзмөккө өткөрүңүз. Учурдагы сессияңыз жараксыз болот.';

  @override
  String get generateTransferCode => 'Өткөрүү кодун түзүү';

  @override
  String get transferCode => 'Өткөрүү коду';

  @override
  String transferCodeExpires(int minutes) {
    return 'Бул коддун мөөнөтү $minutes мүнөттө бүтөт';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Аккаунтуңузду өткөрүү үчүн бул кодду жаңы түзмөгүңүзгө киргизиңиз.';

  @override
  String get generateNewCode => 'Жаңы код түзүү';

  @override
  String get scanQrCode => 'QR кодду скандоо';

  @override
  String get scanQrCodeSubtitle => 'Контактты кошуу үчүн QR кодун скандаңыз';

  @override
  String get qrCodeDetected => 'QR код аныкталды';

  @override
  String get invalidQrCode => 'Жараксыз QR код';

  @override
  String get cameraPermissionRequired => 'Камера уруксаты талап кылынат';

  @override
  String get myQrCode => 'Менин QR кодум';

  @override
  String get myQrCodeSubtitle =>
      'Контакттарыңыз сизди кошо алышы үчүн бул QR кодду бөлүшүңүз';

  @override
  String get shareQrCode => 'Бөлүшүү';

  @override
  String get addContactTitle => 'Контакт кошуу';

  @override
  String get addContactByHashId => 'Контактыңыздын Hash ID\'син киргизиңиз';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Издөө';

  @override
  String get contactNotFound => 'Контакт табылган жок';

  @override
  String get contactAlreadyAdded => 'Бул контакт тизмеңизде бар';

  @override
  String get contactAdded => 'Контакт кошулду';

  @override
  String get myProfile => 'Менин профилим';

  @override
  String get myProfileSubtitle =>
      'Башкалар сизди кошо алышы үчүн бул маалыматты бөлүшүңүз';

  @override
  String get temporaryCode => 'Убактылуу код';

  @override
  String temporaryCodeExpires(String time) {
    return '$time кийин мөөнөтү бүтөт';
  }

  @override
  String get codeExpired => 'Коддун мөөнөтү бүттү';

  @override
  String get generateNewCodeButton => 'Жаңы код';

  @override
  String get copyHashId => 'ID көчүрүү';

  @override
  String get copyCode => 'Кодду көчүрүү';

  @override
  String get copiedToClipboard => 'Көчүрүлдү';

  @override
  String get showMyQrCode => 'Менин QR кодумду көрсөтүү';

  @override
  String get orDivider => 'же';

  @override
  String get openScanner => 'Сканерди ачуу';

  @override
  String get addManually => 'Кол менен кошуу';

  @override
  String get contactHashIdLabel => 'Контакттын Hash ID\'си';

  @override
  String get temporaryCodeLabel => 'Убактылуу код';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Контактыңыздан профилинен код түзүүсүн сураңыз';

  @override
  String get verifyAndAdd => 'Текшерүү жана кошуу';

  @override
  String get fillAllFields => 'Бардык талааларды толтуруңуз';

  @override
  String get invalidHashIdFormat => 'Жараксыз ID форматы (мисалы: 123-456-ABC)';

  @override
  String get userNotFound => 'Колдонуучу табылган жок';

  @override
  String get cannotAddYourself => 'Өзүңүздү кошо албайсыз';

  @override
  String get invalidOrExpiredCode => 'Убактылуу код жараксыз же мөөнөтү өткөн';

  @override
  String get contactFound => 'Контакт табылды!';

  @override
  String get howToCallContact => 'Аны кантип атагыңыз келет?';

  @override
  String get contactNameHint => 'Контакттын аты';

  @override
  String get addContactButton => 'Кошуу';

  @override
  String get contactDetails => 'Контакт маалыматы';

  @override
  String get contactName => 'Контакттын аты';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date кошулду';
  }

  @override
  String get deleteContact => 'Контактты өчүрүү';

  @override
  String deleteContactConfirm(Object name) {
    return 'Бул контактты өчүрөсүзбү?';
  }

  @override
  String get deleteContactMessage => 'Бул чатты да өчүрөт.';

  @override
  String get delete => 'Өчүрүү';

  @override
  String get typeMessage => 'Кат жазыңыз...';

  @override
  String get messageSent => 'Жөнөтүлдү';

  @override
  String get messageDelivered => 'Жеткирилди';

  @override
  String get messageRead => 'Окулду';

  @override
  String get messageFailed => 'Жөнөтүү ийгиликсиз';

  @override
  String get now => 'Азыр';

  @override
  String minutesAgo(int count) {
    return '$countмүн';
  }

  @override
  String hoursAgo(int count) {
    return '$countс';
  }

  @override
  String daysAgo(int count) {
    return '$countк';
  }

  @override
  String get today => 'Бүгүн';

  @override
  String get yesterday => 'Кечээ';

  @override
  String dateAtTime(String date, String time) {
    return '$date саат $time';
  }

  @override
  String get shareMessage =>
      'Hash\'та мени менен кошулуңуз! 🔒\n\nБул чыныгы жашыруун мессенжер: толук шифрлөө, серверлерде из жок жана зарыл болсо паника режими.\n\nКолдонмону бул жерден жүктөп алыңыз 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Ката';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Көрүү';

  @override
  String get yes => 'Ооба';

  @override
  String get no => 'Жок';

  @override
  String get save => 'Сактоо';

  @override
  String get edit => 'Түзөтүү';

  @override
  String get close => 'Жабуу';

  @override
  String get confirm => 'Ырастоо';

  @override
  String get loading => 'Жүктөлүүдө...';

  @override
  String get retry => 'Кайталоо';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Күтүлгөн суроолор';

  @override
  String get noPendingRequests => 'Күтүлгөн суроо жок';

  @override
  String get pendingRequestsSubtitle => 'Бул адамдар сизди кошкусу келет';

  @override
  String requestFromUser(String hashId) {
    return '$hashId суроосу';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days күндөн кийин мөөнөтү бүтөт';
  }

  @override
  String get acceptRequest => 'Кабыл алуу';

  @override
  String get rejectRequest => 'Баш тартуу';

  @override
  String get requestAccepted => 'Суроо кабыл алынды';

  @override
  String get requestRejected => 'Суроо четке кагылды';

  @override
  String get requestSent => 'Суроо жөнөтүлдү!';

  @override
  String get requestSentSubtitle =>
      'Суроо жөнөтүлдү. Сүйлөшүүгө чейин колдонуучу кабыл алышы керек.';

  @override
  String get requestAlreadyPending => 'Суроо күтүүдө';

  @override
  String get requestAlreadySentByOther => 'Бул адам сизге суроо жөнөткөн';

  @override
  String get addByHashId => 'Hash ID менен кошуу';

  @override
  String get addByHashIdSubtitle =>
      'Контакттын Hash ID жана убактылуу кодун киргизиңиз';

  @override
  String get enterTemporaryCode => '6 сандык кодду киргизиңиз';

  @override
  String get sendRequest => 'Суроо жөнөтүү';

  @override
  String get acceptContactTitle => 'Контактты кабыл алуу';

  @override
  String get acceptContactSubtitle => 'Ыңгайлаштырылган ат бере аласыз';

  @override
  String get leaveEmptyForHashId => 'Hash ID колдонуу үчүн бош калтырыңыз';

  @override
  String get firstName => 'Аты';

  @override
  String get lastName => 'Фамилиясы';

  @override
  String get notes => 'Жазуулар';

  @override
  String get notesHint => 'Бул контакт жөнүндө жеке жазуулар';

  @override
  String get photoOptional => 'Сүрөт (милдеттүү эмес)';

  @override
  String get contactNameOptional => 'Аты (милдеттүү эмес)';

  @override
  String get notesOptional => 'Жазуулар (милдеттүү эмес)';

  @override
  String get storedLocally => 'Сиздин түзмөктө гана сакталат';

  @override
  String get encryptedMessageLabel => 'Шифрленген кат';

  @override
  String get identityMessageHint =>
      'Сиз кимсиз? Бири-бириңизди кантип билесиз?';

  @override
  String get messageWillBeSentEncrypted =>
      'Бул кат шифрленип алуучуга жөнөтүлөт';

  @override
  String get sendRequestButton => 'Суроо жөнөтүү';

  @override
  String get requestExpiresIn24h =>
      'Кабыл алынбаса суроонун мөөнөтү 24 сааттан кийин бүтөт';

  @override
  String get theyAlreadySentYouRequest => 'Бул адам сизге суроо жөнөткөн';

  @override
  String get requests => 'Суроолор';

  @override
  String get receivedRequests => 'Алынган';

  @override
  String get sentRequests => 'Жөнөтүлгөн';

  @override
  String get noSentRequests => 'Жөнөтүлгөн суроо жок';

  @override
  String get cancelRequest => 'Жокко чыгаруу';

  @override
  String get deleteRequest => 'Суроону өчүрүү';

  @override
  String get requestCancelled => 'Суроо жокко чыгарылды';

  @override
  String sentTo(String hashId) {
    return '$hashId жөнөтүлдү';
  }

  @override
  String expiresIn(String time) {
    return '$time кийин мөөнөтү бүтөт';
  }

  @override
  String receivedAgo(String time) {
    return '$time мурун алынды';
  }

  @override
  String get messageFromRequester => 'Суроочудан кат';

  @override
  String get copy => 'Көчүрүү';

  @override
  String get messageInfo => 'Кат маалыматы';

  @override
  String get messageDirection => 'Багыт';

  @override
  String get messageSentByYou => 'Сиз жөнөттүңүз';

  @override
  String get messageReceived => 'Алынды';

  @override
  String get messageSentAt => 'Жөнөтүлдү';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Абал';

  @override
  String get messageReadAt => 'Окулду';

  @override
  String get messageType => 'Түр';

  @override
  String get messageSize => 'Өлчөм';

  @override
  String get messageExpiresAt => 'Мөөнөтү бүтөт';

  @override
  String get messageEncrypted => 'Учтан-учка шифрленген';

  @override
  String get messageStatusSending => 'Жөнөтүлүүдө...';

  @override
  String get messageStatusSent => 'Жөнөтүлдү';

  @override
  String get messageStatusDelivered => 'Жеткирилди';

  @override
  String get messageStatusRead => 'Окулду';

  @override
  String get messageStatusFailed => 'Ийгиликсиз';

  @override
  String get serverStatus => 'Сервер';

  @override
  String get onServer => 'Жеткирүү күтүүдө';

  @override
  String get deletedFromServer => 'Өчүрүлдү';

  @override
  String get messageTypeText => 'Текст';

  @override
  String get messageTypeImage => 'Сүрөт';

  @override
  String get messageTypeVideo => 'Видео';

  @override
  String get messageTypeVoice => 'Үн';

  @override
  String get messageTypeFile => 'Файл';

  @override
  String get indefinitely => 'Чексиз';

  @override
  String get hoursShort => 'с';

  @override
  String get minutesShort => 'мүн';

  @override
  String get hours => 'саат';

  @override
  String get minutes => 'мүнөт';

  @override
  String get seconds => 'секунд';

  @override
  String get ephemeralMessages => 'Убактылуу каттар';

  @override
  String get ephemeralMessagesDescription =>
      'Каттар бул убакыттан кийин автоматтык түрдө өчүрүлөт';

  @override
  String get ephemeralImmediate => 'Заматта (окугандан кийин)';

  @override
  String get ephemeralImmediateDesc => 'Окулгандан кийин өчүрүлөт';

  @override
  String get ephemeralMyPreference => 'Менин тандоом';

  @override
  String get ephemeralMyPreferenceDesc => 'Глобалдык жөндөөнү колдонуу';

  @override
  String get ephemeralDefaultSetting => 'Каттын узактыгы';

  @override
  String get ephemeralChooseDefault => 'Сунушталган';

  @override
  String get ephemeral30Seconds => '30 секунд';

  @override
  String get ephemeral30SecondsDesc => 'Окугандан 30 секунд кийин өчүрүлөт';

  @override
  String get ephemeral5Minutes => '5 мүнөт';

  @override
  String get ephemeral5MinutesDesc => 'Окугандан 5 мүнөт кийин өчүрүлөт';

  @override
  String get ephemeral1Hour => '1 саат';

  @override
  String get ephemeral1HourDesc => 'Окугандан 1 саат кийин өчүрүлөт';

  @override
  String get ephemeral3Hours => '3 саат';

  @override
  String get ephemeral6Hours => '6 саат';

  @override
  String get ephemeral6HoursDesc => 'Окугандан 6 саат кийин өчүрүлөт';

  @override
  String get ephemeral12Hours => '12 саат';

  @override
  String get ephemeral24Hours => '24 саат';

  @override
  String get ephemeral24HoursDesc => 'Окугандан 24 саат кийин өчүрүлөт';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Ыңгайлаштырылган узактык';

  @override
  String get howItWorks => 'Кантип иштейт';

  @override
  String get ephemeralExplanation1 =>
      'Каттар алынгандан кийин серверден өчүрүлөт.';

  @override
  String get ephemeralExplanation2 =>
      'Бул жөндөө каттар СИЗДИН телефонуңуздан окулгандан кийин качан жоголорун аныктайт.';

  @override
  String get ephemeralExplanation3 =>
      'Контактыңыздын өз телефону үчүн өз жөндөөсү бар.';

  @override
  String get mute1Hour => '1 саат';

  @override
  String get mute8Hours => '8 саат';

  @override
  String get mute1Day => '1 күн';

  @override
  String get mute1Week => '1 жума';

  @override
  String get muteAlways => 'Дайыма';

  @override
  String get muteExplanation => 'Бул контакт үчүн билдирмелер алынбайт';

  @override
  String get showCallsInRecents => 'Акыркы чалууларда көрсөтүү';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash чалуулары телефондун чалуу тарыхында көрүнөт';

  @override
  String get feedback => 'Пикир';

  @override
  String get muteNotifications => 'Билдирмелерди өчүрүү';

  @override
  String get muteDescription => 'Бул контакт үчүн билдирмелер алынбайт';

  @override
  String mutedUntil(String time) {
    return '$time чейин үнсүз';
  }

  @override
  String get notMuted => 'Билдирмелер иштетилген';

  @override
  String get unmute => 'Үндү кайтаруу';

  @override
  String get notificationSound => 'Билдирме үнү';

  @override
  String get defaultSound => 'Демейки';

  @override
  String get chatSettings => 'Чат жөндөөлөрү';

  @override
  String get bubbleColor => 'Көбүк түсү';

  @override
  String get backgroundColor => 'Фон түсү';

  @override
  String get backgroundImage => 'Фон сүрөтү';

  @override
  String get chatBackground => 'Чат фону';

  @override
  String get customColor => 'Ыңгайлаштырылган';

  @override
  String get defaultColor => 'Демейки';

  @override
  String get imageSelected => 'Сүрөт тандалды';

  @override
  String get noImage => 'Сүрөт жок';

  @override
  String get color => 'Түс';

  @override
  String get image => 'Сүрөт';

  @override
  String get tapToSelectImage => 'Сүрөт тандоо үчүн басыңыз';

  @override
  String get changeImage => 'Сүрөттү өзгөртүү';

  @override
  String get previewMessageReceived => 'Салам!';

  @override
  String get previewMessageSent => 'Саламатсызбы!';

  @override
  String get messageAction => 'Кат';

  @override
  String get callAction => 'Чалуу';

  @override
  String get videoAction => 'Видео';

  @override
  String get personalNotes => 'Жеке жазуулар';

  @override
  String get addNotes => 'Жазуу кошуу...';

  @override
  String get noNotes => 'Жазуу жок';

  @override
  String get messageNotifications => 'Кат билдирмелери';

  @override
  String get callNotifications => 'Чалуу билдирмелери';

  @override
  String get useGradient => 'Градиент колдонуу';

  @override
  String get gradientStart => 'Баштапкы түс';

  @override
  String get gradientEnd => 'Аяктоо түсү';

  @override
  String get preview => 'Алдын ала көрүү';

  @override
  String get reset => 'Баштапкы абалга';

  @override
  String get securityNumber => 'Коопсуздук номери';

  @override
  String securityNumberDescription(String name) {
    return 'Коопсуздук номеринин $name түзмөгүнө дал келерин текшериңиз';
  }

  @override
  String get verifyEncryption => 'Учтан-учка шифрлөөнү текшерүү';

  @override
  String get tapToCopy => 'Көчүрүү үчүн басыңыз';

  @override
  String get howToVerify => 'Кантип текшерүү керек';

  @override
  String get verifyStep1 => 'Контактыңыз менен жүз-жүзгө жолугуңуз же чалыңыз';

  @override
  String get verifyStep2 =>
      'Коопсуздук номерлерин салыштырыңыз же QR коддорду скандаңыз';

  @override
  String get verifyStep3 => 'Эгер дал келсе, чатыңыз коопсуз';

  @override
  String get scanToVerify => 'Текшерүү үчүн скандоо';

  @override
  String get reportSpam => 'Спам деп кабарлоо';

  @override
  String get reportSpamSubtitle => 'Бул контактты спам деп кабарлоо';

  @override
  String get reportSpamDescription =>
      'Бул контакт анонимдүү түрдө кабарланат. Сиздин инсандыгыңыз бөлүшүлбөйт. Ишенесизби?';

  @override
  String get report => 'Кабарлоо';

  @override
  String get spamReported => 'Спам кабарланды';

  @override
  String get reportError =>
      'Кабарды жөнөтүү ийгиликсиз болду. Кайра аракет кылыңыз.';

  @override
  String get reportRateLimited => 'Бүгүнкү кабарлоо чегине жеттиңиз.';

  @override
  String get blockContact => 'Контактты бөгөттөө';

  @override
  String get blockContactDescription =>
      'Бул контакт сизге кат жөнөтө же чала албайт. Ал эскертилбейт.';

  @override
  String get unblockContact => 'Контакттын бөгөтүн алуу';

  @override
  String get unblockContactDescription =>
      'Бул контакт кайрадан кат жөнөтүп жана чала алат.';

  @override
  String get contactBlocked => 'Контакт бөгөттөлдү';

  @override
  String get contactUnblocked => 'Контакттын бөгөтү алынды';

  @override
  String get contactIsBlocked => 'Бул контакт бөгөттөлгөн';

  @override
  String get unblock => 'Бөгөттөн алуу';

  @override
  String get deleteContactSubtitle => 'Бул контактты жана чатты өчүрүү';

  @override
  String get confirmWithPin => 'PIN менен ырастоо';

  @override
  String get enterPinToConfirm =>
      'Бул аракетти ырастоо үчүн PIN\'иңизди киргизиңиз';

  @override
  String get profilePhoto => 'Профил сүрөтү';

  @override
  String get takePhoto => 'Сүрөт тартуу';

  @override
  String get chooseFromGallery => 'Галереядан тандоо';

  @override
  String get removePhoto => 'Сүрөттү алып салуу';

  @override
  String get viewContactHashId => 'Контакттын идентификаторун көрүү';

  @override
  String get hashIdPartiallyMasked =>
      'Сиздин коопсуздугуңуз жана контактыңыздын жашыруундугу үчүн жарым-жартылай жашырылган';

  @override
  String get addFirstContact => 'Биринчи контактыңызды кошуңуз';

  @override
  String get addFirstContactSubtitle =>
      'QR кодуңузду бөлүшүңүз же досуңуздукун скандаңыз';

  @override
  String get directory => 'Каталог';

  @override
  String get noContacts => 'Контакт жок';

  @override
  String get noContactsSubtitle => 'Баштоо үчүн контакт кошуңуз';

  @override
  String get sendMessageAction => 'Кат жөнөтүү';

  @override
  String get audioCall => 'Аудио чалуу';

  @override
  String get videoCall => 'Видео чалуу';

  @override
  String get viewProfile => 'Профилди көрүү';

  @override
  String get deleteContactDirectory => 'Контактты өчүрүү';

  @override
  String get scanShort => 'Скандоо';

  @override
  String get addShort => 'Кошуу';

  @override
  String deleteContactConfirmName(String name) {
    return '$name өчүрүүнү каалайсызбы?';
  }

  @override
  String get noNotesTitle => 'Жазуу жок';

  @override
  String get noNotesSubtitle => 'Биринчи жазууңузду түзүңүз';

  @override
  String get newNote => 'Жаңы жазуу';

  @override
  String get editNote => 'Жазууну түзөтүү';

  @override
  String get deleteNote => 'Жазууну өчүрүү';

  @override
  String get deleteNoteConfirm => 'Бул жазууну өчүрөсүзбү?';

  @override
  String get noteTitle => 'Аталыш';

  @override
  String get noteContent => 'Мазмун';

  @override
  String get addItem => 'Элемент кошуу';

  @override
  String get pinNote => 'Кадоо';

  @override
  String get unpinNote => 'Кадоону алуу';

  @override
  String get noteColor => 'Түс';

  @override
  String get notePassword => 'Сырсөз';

  @override
  String get setPassword => 'Сырсөз коюу';

  @override
  String get changePassword => 'Сырсөздү өзгөртүү';

  @override
  String get removePassword => 'Сырсөздү алып салуу';

  @override
  String get enterPassword => 'Сырсөздү киргизиңиз';

  @override
  String get confirmPassword => 'Сырсөздү ырастаңыз';

  @override
  String get passwordPin => 'PIN код';

  @override
  String get passwordText => 'Тексттик сырсөз';

  @override
  String get protectedNote => 'Корголгон жазуу';

  @override
  String get incorrectPassword => 'Туура эмес сырсөз';

  @override
  String get passwordSet => 'Сырсөз коюлду';

  @override
  String get passwordRemoved => 'Сырсөз алынды';

  @override
  String get notesBiometric => 'Жазуулар үчүн Face ID';

  @override
  String get notesBiometricSubtitle =>
      'Корголгон жазууларды ачуу үчүн биометрик аутентификация талап кылуу';

  @override
  String get textNote => 'Текст жазуусу';

  @override
  String get checklistNote => 'Тизме';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total тапшырма';
  }

  @override
  String get autoSaved => 'Сакталды';

  @override
  String get searchNotes => 'Жазууларды издөө';

  @override
  String get legalConsent => 'Укуктук макулдук';

  @override
  String get confirmAge13 => 'Жашым кеминде 13 экенин ырастайм';

  @override
  String get acceptLegalStart => 'Мен кабыл алам ';

  @override
  String get privacyPolicy => 'Купуялуулук саясаты';

  @override
  String get termsOfService => 'Колдонуу шарттары';

  @override
  String get andThe => ' жана ';

  @override
  String get continueButton => 'Улантуу';

  @override
  String get mustAcceptTerms =>
      'Улантуу үчүн эки шартты тең кабыл алышыңыз керек';

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
  String get support => 'Колдоо';

  @override
  String get contactSupport => 'Колдоого кайрылуу';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Кыянаттыкты кабарлоо';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Укуктук';

  @override
  String get legalEntity => 'Юридикалык жак';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Кадоо';

  @override
  String get unpinConversation => 'Кадоону алуу';

  @override
  String get hideConversation => 'Тасмадан алып салуу';

  @override
  String get deleteConversation => 'Сүйлөшүүнү өчүрүү';

  @override
  String get deleteConversationConfirm =>
      'Бардык каттарды өчүрүүнү ырастоо үчүн PIN\'иңизди киргизиңиз';

  @override
  String get noConversations => 'Сүйлөшүү жок';

  @override
  String get startConversation => 'Баштоо';

  @override
  String get microphonePermissionRequired => 'Микрофон уруксаты талап кылынат';

  @override
  String get microphonePermissionExplanation =>
      'Hash чалуулар үчүн микрофон керек.';

  @override
  String get cameraPermissionExplanation =>
      'Hash видео чалуулар үчүн камера керек.';

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
  String get openSettings => 'Жөндөөлөрдү ачуу';

  @override
  String get callConnecting => 'Туташууда...';

  @override
  String get callRinging => 'Чалууда...';

  @override
  String get callReconnecting => 'Кайра туташууда...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Кайра туташууда ($secondsс)';
  }

  @override
  String get callPaused => 'Тыныгуу';

  @override
  String get callPausedSubtitle => 'Чалуу дагы эле активдүү';

  @override
  String get callRemoteMicMuted => 'Контакттын микрофону өчүрүлгөн';

  @override
  String get callMiniControlsMute => 'Үнсүз';

  @override
  String get callMiniControlsUnmute => 'Үндү ачуу';

  @override
  String get callMiniControlsHangUp => 'Коюу';

  @override
  String get callMiniControlsReturn => 'Чалууга кайтуу';

  @override
  String get callNetworkPoor => 'Туруксуз байланыш';

  @override
  String get callNetworkLost => 'Байланыш жоголду';

  @override
  String get callEndedTitle => 'Чалуу аяктады';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Түзмөк маалыматтары';

  @override
  String get deviceDataSubtitle => 'Жергиликтүү жана сервер сактагычы';

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
  String get localStorage => 'Жергиликтүү сактагыч';

  @override
  String get onThisDevice => 'бул түзмөктө';

  @override
  String get encryptedDatabases => 'Шифрленген маалымат базалары';

  @override
  String get files => 'Файлдар';

  @override
  String get secureKeychain => 'Коопсуз ачкычтар топтому';

  @override
  String get cache => 'Кэш';

  @override
  String get contactsDetail => 'Аттар, аватарлар, Signal ачкычтары';

  @override
  String get messagesDetail => 'Шифрленген сүйлөшүүлөр';

  @override
  String get notesDetail => 'Жеке жазуулар';

  @override
  String get signalSessions => 'Signal сессиялары';

  @override
  String get signalSessionsDetail => 'Шифрлөө сессиялары';

  @override
  String get pendingContacts => 'Күтүлгөн контакттар';

  @override
  String get pendingContactsDetail => 'Күтүлгөн суроолор';

  @override
  String get callHistory => 'Чалуулар';

  @override
  String get callHistoryDetail => 'Чалуу тарыхы';

  @override
  String get preferences => 'Тандоолор';

  @override
  String get preferencesDetail => 'Медиа жана чалуу тандоолору';

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
      zero: 'файл жок',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Жигердүү';

  @override
  String get notDefined => 'Аныкталган эмес';

  @override
  String get biometrics => 'Биометрия';

  @override
  String get recoveryPhrase => 'Калыбына келтирүү фразасы';

  @override
  String get identity => 'Инсандык (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol ачкычтары';

  @override
  String get authTokens => 'Аутентификация токендери';

  @override
  String get contactNamesCache => 'Контакт аттарынын кэши';

  @override
  String get remoteConfig => 'Алыскы конфигурация';

  @override
  String get notificationPrefs => 'Билдирме тандоолору';

  @override
  String get serverData => 'Сервер маалыматтары';

  @override
  String get serverDataInfo =>
      'Hash серверде минималдуу маалымат сактайт, баары шифрленген же убактылуу.';

  @override
  String get serverProfile => 'Профил';

  @override
  String get serverProfileDetail =>
      'Hash ID, ачык ачкычтар, почта кутусу токени';

  @override
  String get serverPrekeys => 'Алдын ала ачкычтар';

  @override
  String get serverPrekeysDetail => 'Бир жолку Signal ачкычтары (жумшалган)';

  @override
  String get serverMessages => 'Транзиттеги каттар';

  @override
  String get serverMessagesDetail => 'Жеткирилгенден кийин өчүрүлөт (макс 24с)';

  @override
  String get serverMedia => 'Транзиттеги медиа';

  @override
  String get serverMediaDetail => 'Жүктөлгөндөн кийин өчүрүлөт';

  @override
  String get serverContactRequests => 'Контакт суроолору';

  @override
  String get serverContactRequestsDetail => '24 сааттан кийин мөөнөтү бүтөт';

  @override
  String get serverRateLimits => 'Чектөө лимиттери';

  @override
  String get serverRateLimitsDetail =>
      'Убактылуу кыянаттыкка каршы маалыматтар';

  @override
  String get privacyReassurance =>
      'Hash каттарыңызды окуй албайт. Бардык маалыматтар учтан-учка шифрленген. Сервер маалыматтары автоматтык түрдө өчүрүлөт.';

  @override
  String get pinTooSimple => 'Бул PIN өтө жөнөкөй. Коопсузураак код тандаңыз.';

  @override
  String get genericError => 'Ката пайда болду. Кайра аракет кылыңыз.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Аккаунт түзүү мүмкүн эмес: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Фраза алмашуу буферине көчүрүлдү';

  @override
  String get copyPhrase => 'Фразаны көчүрүү';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Бул фразаны коопсуз жерге жазып алыңыз. PIN кодуңузду бул фразасыз жоготсоңуз, маалыматтарыңызга кирүүнү биротоло жоготосуз.';

  @override
  String get noMessages => 'Кат жок';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name менен бардык каттарды өчүрөсүзбү?';
  }

  @override
  String get confirmation => 'Ырастоо';

  @override
  String get untitled => 'Аталышсыз';

  @override
  String get noSessions => 'Сессия жок';

  @override
  String get unknownContact => 'Белгисиз контакт';

  @override
  String get unnamed => 'Атсыз';

  @override
  String get noPendingRequestsAlt => 'Күтүлгөн суроо жок';

  @override
  String get deleteAllCallHistory => 'Бардык чалуу тарыхын өчүрөсүзбү?';

  @override
  String get noCalls => 'Чалуу жок';

  @override
  String get noPreferences => 'Тандоо жок';

  @override
  String get resetAllMediaPrefs =>
      'Бардык медиа тандоолорун баштапкы абалга келтиресизби?';

  @override
  String get deleteThisAvatar => 'Бул аватарды өчүрөсүзбү?';

  @override
  String get deleteAllAvatars => 'Бардык аватарларды өчүрөсүзбү?';

  @override
  String get noAvatars => 'Аватар жок';

  @override
  String get deleteThisFile => 'Бул файлды өчүрөсүзбү?';

  @override
  String get deleteAllMediaFiles => 'Бардык медианы өчүрөсүзбү?';

  @override
  String get noMediaFiles => 'Медиа жок';

  @override
  String get outgoing => 'Чыгуучу';

  @override
  String get incoming => 'Кируучү';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Убактылуу көрүнүш: $secondsс';
  }

  @override
  String get normalView => 'Кадимки көрүнүш';

  @override
  String get callReasonCompleted => 'Аяктады';

  @override
  String get callReasonMissed => 'Жоголду';

  @override
  String get callReasonDeclined => 'Четке кагылды';

  @override
  String get callReasonFailed => 'Ийгиликсиз';

  @override
  String get justNow => 'Жаңы эле';

  @override
  String timeAgoMinutes(int count) {
    return '$count мүн мурун';
  }

  @override
  String timeAgoHours(int count) {
    return '$countс мурун';
  }

  @override
  String timeAgoDays(int count) {
    return '$countк мурун';
  }

  @override
  String get messageTypeContact => 'Контакт';

  @override
  String get messageTypeLocation => 'Жайгашуу';

  @override
  String get statusQueued => 'Кезекте';

  @override
  String get blockedBadge => 'Бөгөттөлгөн';

  @override
  String get protectedBadge => 'Корголгон';

  @override
  String messageCount(int count) {
    return '$count кат';
  }

  @override
  String get deleteQuestion => 'Өчүрөсүзбү?';

  @override
  String get transferMyAccountTitle => 'Аккаунтумду өткөрүү';

  @override
  String get loadingError => 'Жүктөө катасы';

  @override
  String get transferToNewDevice => 'Жаңы түзмөккө өткөрүү';

  @override
  String get transferInstructions =>
      'Жаңы түзмөгүңүздө \"Аккаунтумду калыбына келтирүү\" тандап, бул маалыматты киргизиңиз:';

  @override
  String get yourHashIdLabel => 'Сиздин Hash ID';

  @override
  String get enterYourPinCode => 'PIN кодуңузду киргизиңиз';

  @override
  String get pinOwnerConfirmation =>
      'Бул аккаунттун ээси экениңизди ырастоо үчүн';

  @override
  String get scanThisQrCode => 'Бул QR кодду скандаңыз';

  @override
  String get withYourNewDevice => 'Жаңы түзмөгүңүз менен';

  @override
  String get orEnterTheCode => 'же кодду киргизиңиз';

  @override
  String get transferCodeLabel => 'Өткөрүү коду';

  @override
  String get proximityVerification => 'Жакындык текшерүү';

  @override
  String get bringDevicesCloser => 'Эки түзмөктү жакындатыңыз';

  @override
  String get confirmTransferQuestion => 'Өткөрүүнү ырастайсызбы?';

  @override
  String get accountWillBeTransferred =>
      'Аккаунтуңуз жаңы түзмөккө өткөрүлөт.\n\nБул түзмөк биротоло ажыратылат.';

  @override
  String get transferComplete => 'Өткөрүү аяктады';

  @override
  String get transferSuccessMessage =>
      'Аккаунтуңуз ийгиликтүү өткөрүлдү.\n\nБул колдонмо азыр жабылат.';

  @override
  String get manualVerification => 'Кол менен текшерүү';

  @override
  String get codeDisplayedOnBothDevices => 'Эки түзмөктө көрсөтүлгөн код:';

  @override
  String get doesCodeMatchNewDevice =>
      'Бул код жаңы түзмөктөгү код менен дал келеби?';

  @override
  String get verifiedStatus => 'Текшерилди';

  @override
  String get inProgressStatus => 'Жүрүүдө...';

  @override
  String get notAvailableStatus => 'Жеткиликсиз';

  @override
  String get codeExpiredRestart => 'Коддун мөөнөтү бүттү. Кайра баштаңыз.';

  @override
  String get codesDoNotMatchCancelled =>
      'Коддор дал келбейт. Өткөрүү жокко чыгарылды.';

  @override
  String transferToDevice(String device) {
    return 'Кимге: $device';
  }

  @override
  String get copiedExclamation => 'Көчүрүлдү!';

  @override
  String expiresInTime(String time) {
    return '$time кийин мөөнөтү бүтөт';
  }

  @override
  String get biometricNotAvailable => 'Биометрия бул түзмөктө жеткиликсиз';

  @override
  String get biometricAuthError => 'Биометрик аутентификация катасы';

  @override
  String get authenticateForBiometric =>
      'Биометрияны иштетүү үчүн аутентификациялаңыз';

  @override
  String get biometricAuthFailed => 'Биометрик аутентификация ийгиликсиз';

  @override
  String get forceUpdateTitle => 'Жаңыртуу талап кылынат';

  @override
  String get forceUpdateMessage =>
      'Hash\'тын жаңы версиясы жеткиликтүү. Улантуу үчүн жаңыртыңыз.';

  @override
  String get updateButton => 'Жаңыртуу';

  @override
  String get maintenanceInProgress => 'Тейлөө иштери жүрүүдө';

  @override
  String get tryAgainLater => 'Кийинчерээк кайра аракет кылыңыз';

  @override
  String get information => 'Маалымат';

  @override
  String get later => 'Кийинчерээк';

  @override
  String get doYouLikeHash => 'Hash жагабы?';

  @override
  String get yourFeedbackHelps =>
      'Пикириңиз колдонмону жакшыртууга жардам берет';

  @override
  String get ratingTerrible => 'Жаман';

  @override
  String get ratingBad => 'Начар';

  @override
  String get ratingOk => 'Жарайт';

  @override
  String get ratingGood => 'Жакшы';

  @override
  String get ratingExcellent => 'Эң сонун!';

  @override
  String get donationMessage =>
      'Hash коммерциялык эмес долбоор. Сиздин колдооңуз чыныгы жашыруун мессенжерди куруп жатканда жардам берет.';

  @override
  String get recentConnections => 'Акыркы туташуулар';

  @override
  String get loginInfoText =>
      'Ар бир PIN менен кулпу ачуу жергиликтүү жазылат. Акыркы 24 саат гана сакталат.';

  @override
  String get connectionCount => 'Туташуу(лар)';

  @override
  String get periodLabel => 'Мезгил';

  @override
  String get historyLabel => 'Тарых';

  @override
  String get noLoginRecorded => 'Катталган кирүү жок';

  @override
  String get nextUnlocksAppearHere =>
      'Кийинки кулпу ачуулар бул жерде пайда болот.';

  @override
  String get dataLocalOnly =>
      'Бул маалыматтар сиздин түзмөктө гана сакталат жана эч качан жөнөтүлбөйт.';

  @override
  String get currentSession => 'Учурдагы';

  @override
  String get todayLabel => 'Бүгүн';

  @override
  String get yesterdayLabel => 'Кечээ';

  @override
  String get justNowLabel => 'Жаңы эле';

  @override
  String minutesAgoLabel(int count) {
    return '$count мүн мурун';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursс мурун';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursс $minutesмүн мурун';
  }

  @override
  String get noMaintenancePlanned => 'Пландалган тейлөө жок';

  @override
  String get everythingWorkingNormally => 'Баары нормалдуу иштеп жатат';

  @override
  String get maintenanceTitle => 'Тейлөө';

  @override
  String get maintenanceActiveLabel => 'ЖҮРҮҮДӨ';

  @override
  String get maintenancePlannedLabel => 'ПЛАНДАЛГАН';

  @override
  String get locking => 'Кулпулоо...';

  @override
  String get newMessageNotification => 'Жаңы кат';

  @override
  String get secExplainTitle => 'Hash сизди кантип коргойт';

  @override
  String get secExplainIntro =>
      'Hash сиздин каттарыңызды эч ким окуй албагандай иштелип чыккан.';

  @override
  String get secExplainIntroSub =>
      'Биз да окуй албайбыз.\nМындай иштейт, жөнөкөй түшүндүрмө.';

  @override
  String get secJourneyLabel => 'ЖОЛ';

  @override
  String get secJourneyTitle => 'Катыңыздын сапары';

  @override
  String get secJourneySubtitle =>
      'Манжаңыздан контактыңыздын экранына чейин, ар бир кадам корголгон. Жолду ээрчиңиз.';

  @override
  String get secStep1Title => 'Катыңызды жазасыз';

  @override
  String get secStep1Desc =>
      'Колдонмого \"Салам!\" деп жазасыз. Бул учурда кат телефонуңуздун эс тутумунда гана. Эч нерсе жөнөтүлгөн эмес.';

  @override
  String get secStep2Title => 'Signal Protocol менен шифрлөө';

  @override
  String get secStep2Desc =>
      '\"Жөнөтүү\" баскычын басканыңызда, катыңыз түшүнүксүз белгилер топтомуна айланат. Бул катыңыз контактыңыз гана ачкычы бар сейфке кулпуланган сыяктуу.';

  @override
  String get secStep3Title => 'Sealed Sender: көрүнбөс конверт';

  @override
  String get secStep3Desc =>
      'Кат жөнөтүүнү элестетиңиз, бирок конвертте кайтарым дареги жок. Hash дал ушуну кылат. Кат анонимдик почта кутусуна ташталат. Сервер кимдин жөнөткөнүн билбейт.';

  @override
  String get secStep4Title => 'Сервер эч нерсе көрбөйт';

  @override
  String get secStep4Desc =>
      'Сервер сокур почтачы ролун аткарат. Ал \"кимдир бирөө #A7X9 кутусуна бир нерсе таштады\" деп гана билет. Кимдин жөнөткөнүн, эмне экенин же кимге арналганын билбейт.';

  @override
  String get secStep4Highlight =>
      'Метамаалымат сакталбайт: IP дареги жок, убакыт белгиси жок, жөнөтүүчү менен алуучу арасында байланыш жок.';

  @override
  String get secStep5Title => 'Контактыңыз катты алат';

  @override
  String get secStep5Desc =>
      'Контактыңыздын телефону анонимдик почта кутусунан мазмунду алат жана катты түзмөгүнөн чыкпаган жеке ачкычы менен ачат. \"Салам!\" экранда пайда болот.';

  @override
  String get secStep6Title => 'Кат серверден жоголот';

  @override
  String get secStep6Desc =>
      'Контактыңыз алуусун ырастаганда, сервер катты биротоло өчүрөт. Таштанды жок, архив жок, көчүрмө жок. Окулбаган каттар да 24 сааттан кийин автоматтык түрдө жок кылынат.';

  @override
  String get secStep7Title => 'Жергиликтүү мөөнөтү бүтүү';

  @override
  String get secStep7Desc =>
      'Контактыңыздын телефонунда кат сиз тандаган убакытка жараша өзүн-өзү жок кылат: окулгандан кийин дароо, 5 мүнөт, 1 саат... сиз чечесиз.';

  @override
  String get secJourneyConclusion =>
      'Жыйынтык: серверде из жок, түзмөктөрдө из жок. Кат окулуу үчүн гана жашады, андан кийин жоголду.';

  @override
  String get secArchLabel => 'АРХИТЕКТУРА';

  @override
  String get secArchTitle => '5 коргоо катмары';

  @override
  String get secArchSubtitle =>
      'Hash бир технологияга гана таянбайт. Ар бир катмар башкаларын бекемдейт. Бир катмар бузулса да, маалыматтарыңыз коопсуз бойдон калат.';

  @override
  String get secLayer1Title => 'Учтан-учка шифрлөө';

  @override
  String get secLayer1Desc =>
      'Ар бир кат уникалдуу ачкыч менен шифрленет. Жөнөкөй сөз менен: бирөө бир катты чечсе да, кийинкисин чече албайт. Ар бир каттын өзүнүн кулпусу бар.';

  @override
  String get secLayer1Detail =>
      'Файлдар (сүрөттөр, видеолор, документтер) үчүн Hash кошумча AES-256-GCM шифрлөөнү колдонот. Файл телефонуңуздан чыгардан мурун шифрленет.';

  @override
  String get secLayer2Title => 'Sealed Sender (тармактык анонимдик)';

  @override
  String get secLayer2Desc =>
      'Кадимки мессенжерлер каттарыңызды инсандыгыңыз тиркелген. Бул конвертке атыңызды жазгандай. Hash анонимдик почта кутуларын колдонот: сервер кимдин жөнөткөнүн билбестен катты жеткирет.';

  @override
  String get secLayer2Detail =>
      'Жыйынтык: сервер маалыматтары чыгып кетсе да, кимдин ким менен сүйлөшкөнүн калыбына келтирүү мүмкүн эмес.';

  @override
  String get secLayer3Title => 'Автоматтык өчүрүү';

  @override
  String get secLayer3Desc =>
      'Каттар алуу ырасталгандан кийин серверден өчүрүлөт. Кат эч качан алынбаса да, 24 сааттан кийин автоматтык түрдө жок кылынат.';

  @override
  String get secLayer3Detail =>
      'Телефонуңузда каттар сиз тандаган узактыкка жараша өзүн-өзү жок кылат: дароо, 5 мүн, 15 мүн, 30 мүн, 1с, 3с, 6с же 12с.';

  @override
  String get secLayer4Title => 'Жергиликтүү кирүү коргоосу';

  @override
  String get secLayer4Desc =>
      'Колдонмо 6 сандык PIN код жана/же биометрия (Face ID, манжа изи) менен корголгон. Өтө көп ийгиликсиз аракеттен кийин, колдонмо ар бир ийгиликсиздиктен кийин көбөйгөн кечиктирүү менен кулпуланат.';

  @override
  String get secLayer5Title => 'Кулпуланган маалымат базасы';

  @override
  String get secLayer5Desc =>
      'Сервер тарабында эч бир колдонуучу маалымат базасына түз жаза албайт. Бардык аракеттер ар бир суроону текшерген коопсуз функциялар аркылуу жүрөт.';

  @override
  String get secLayer5Detail =>
      'Бул банк кассасы сыяктуу: сиз сейфке эч качан өзүңүз тийбейсиз. Суроо жасайсыз, жана тутум аракет кылардан мурун укугуңузду текшерет.';

  @override
  String get secVashLabel => 'ДҮЙНӨДӨ УНИКАЛДУУ';

  @override
  String get secVashTitle => 'Vash режими';

  @override
  String get secVashSubtitle =>
      'Башка эч бир мессенжерде жок шашылыш коопсуздук тутуму.';

  @override
  String get secVashScenarioTitle => 'Бул кырдаалды элестетиңиз';

  @override
  String get secVashScenario1 => 'Кимдир бирөө телефонуңузга кирди';

  @override
  String get secVashScenario2 => 'Сизден PIN кодуңузду сурашат';

  @override
  String get secVashScenario3 =>
      'Бардык маалыматтарыңызды тез арада өчүргүңүз келет';

  @override
  String get secVashSolutionTitle => 'Чечим: эки PIN код';

  @override
  String get secVashSolutionDesc =>
      'Hash\'та эки башка PIN код конфигурациялайсыз:';

  @override
  String get secVashNormalCodeLabel => 'Кадимки код';

  @override
  String get secVashNormalCodeDesc =>
      'Колдонмону бардык маалыматтарыңыз менен кадимкидей ачат';

  @override
  String get secVashCodeLabel2 => 'Vash коду';

  @override
  String get secVashCodeDescription =>
      'Колдонмону кадимкидей ачат... бирок бардык маалыматтарыңыз фондо үнсүз өчүрүлөт';

  @override
  String get secVashWhatHappensTitle => 'Андан кийин эмне болот';

  @override
  String get secVashWhatHappensDesc =>
      'Колдонмо кадимкидей ачылат. Эскертүү жок, шектүү анимация жок. Экранда жөн гана бош колдонмо көрүнөт, жаңы эле орнотулгандай.\n\nЧындыгында, бардык сүйлөшүүлөрүңүз, контакттарыңыз жана каттарыңыз бир секунданын ичинде кайтарылгыс түрдө өчүрүлдү.';

  @override
  String get secCallsLabel => 'ЧАЛУУЛАР & ФАЙЛДАР';

  @override
  String get secCallsTitle => 'Баары шифрленген';

  @override
  String get secCallsSubtitle =>
      'Бул каттар гана эмес. Hash аркылуу өткөн бардыгы учтан-учка шифрленген.';

  @override
  String get secAudioCallTitle => 'Аудио чалуулар';

  @override
  String get secAudioCallDesc =>
      'WebRTC аркылуу учтан-учка шифрленген. Үн түзмөктөр арасында түз өткөрүлөт.';

  @override
  String get secVideoCallTitle => 'Видео чалуулар';

  @override
  String get secVideoCallDesc =>
      'Ошол эле технология, ар бир агым өзүнчө шифрленген.';

  @override
  String get secPhotosTitle => 'Сүрөттөр & видеолор';

  @override
  String get secPhotosDesc =>
      'Телефонуңуздан чыгардан мурун AES-256-GCM менен шифрленген.';

  @override
  String get secDocsTitle => 'Документтер';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, каалаган файл. Аталышы, өлчөмү жана мазмуну шифрленген.';

  @override
  String get secAnonLabel => 'АНОНИМДИК';

  @override
  String get secAnonTitle => 'Инсандык талап кылынбайт';

  @override
  String get secAnonSubtitle =>
      'Hash телефон номериңизди же электрондук почтаңызды эч качан сурабайт. Сиз уникалдуу жана анонимдик Hash ID менен аныкталасыз.';

  @override
  String get secHashIdTitle => 'Сиздин Hash ID';

  @override
  String get secHashIdDesc =>
      'Бул сиздин уникалдуу идентификаторуңуз. Ал сиз жөнүндө эч нерсе ачпайт: атыңызды да, номериңизди да, жайгашууңузду да. Бул чыныгы инсандыгыңызга байланыштыруу мүмкүн эмес болгон лакап ат сыяктуу.\n\nКонтакт кошуу үчүн Hash ID\'ңизди бөлүшөсүз же QR кодду скандайсыз. Баары ушул. Синхрондолгон дарек китеби жок, \"Сиз билген адамдар\" сунуштары жок.';

  @override
  String get secDataLabel => 'МААЛЫМАТТАР';

  @override
  String get secDataTitle => 'Hash эмнени билбейт';

  @override
  String get secDataSubtitle =>
      'Маалыматтарыңызды коргоонун эң жакшы жолу — аларды чогултпоо.';

  @override
  String get secNeverCollected => 'Эч качан чогултулбайт';

  @override
  String get secNeverItem1 => 'Кат мазмуну';

  @override
  String get secNeverItem2 => 'Контакттар тизмеси';

  @override
  String get secNeverItem3 => 'Телефон номери';

  @override
  String get secNeverItem4 => 'Электрондук почта дареги';

  @override
  String get secNeverItem5 => 'IP дареги';

  @override
  String get secNeverItem6 => 'Жайгашуу';

  @override
  String get secNeverItem7 => 'Метамаалыматтар (кимдин ким менен сүйлөшкөнү)';

  @override
  String get secNeverItem8 => 'Чалуу тарыхы';

  @override
  String get secNeverItem9 => 'Дарек китеби';

  @override
  String get secNeverItem10 => 'Жарнама идентификаторлору';

  @override
  String get secTempStored => 'Убактылуу сакталган';

  @override
  String get secTempItem1 => 'Анонимдик Hash ID (уникалдуу идентификатор)';

  @override
  String get secTempItem2 => 'Ачык шифрлөө ачкычтары';

  @override
  String get secTempItem3 => 'Транзиттеги шифрленген каттар (макс 24с)';

  @override
  String get secTempNote =>
      'Бул минималдуу маалыматтар да сизди аныктай албайт. Hash ID\'ңыз эч кандай жеке маалыматка байланышкан эмес.';

  @override
  String get secFooterTitle => 'Жашыруундугуңуз, эркиндигиңиз';

  @override
  String get secFooterDesc =>
      'Hash эң талапчыл кесиптик колдонмолор сыяктуу шифрлөө технологияларын колдонот. Каттарыңыз математика менен корголгон, убадалар менен эмес.';

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
