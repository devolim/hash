// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Нула трагова. Нула компромиса.';

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
  String get conversations => 'Четови';

  @override
  String get contacts => 'Контакти';

  @override
  String get noConversation => 'Нема четова';

  @override
  String get noConversationSubtitle =>
      'Додајте контакт да бисте почели безбедно да разговарате';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count захтева на чекању',
      one: '1 захтев на чекању',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count послатих захтева на чекању',
      one: '1 послат захтев на чекању',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Додај контакт';

  @override
  String get shareApp => 'Подели апликацију';

  @override
  String get newMessage => 'Нова порука';

  @override
  String get newConversation => 'Пошаљи поруку';

  @override
  String get settings => 'Подешавања';

  @override
  String get myHashId => 'Мој Hash ID';

  @override
  String get supportHash => 'Подржи Hash';

  @override
  String get supportHashSubtitle => 'Hash је непрофитни пројекат';

  @override
  String get donate => 'Донирај';

  @override
  String get appearance => 'Изглед';

  @override
  String get theme => 'Тема';

  @override
  String get themeAuto => 'Аутоматски';

  @override
  String get themeAutoSubtitle => 'Прати системска подешавања';

  @override
  String get themeDark => 'Тамна';

  @override
  String get themeLight => 'Светла';

  @override
  String get themeRecommendation =>
      'Тамна тема се препоручује за бољу приватност';

  @override
  String get language => 'Језик';

  @override
  String get languageAuto => 'Аутоматски (системски)';

  @override
  String get notifications => 'Обавештења';

  @override
  String get messages => 'Поруке';

  @override
  String get calls => 'Позиви';

  @override
  String get vibration => 'Вибрација';

  @override
  String get notificationContent => 'Садржај обавештења';

  @override
  String get notificationContentFull => 'Прикажи све';

  @override
  String get notificationContentFullDesc => 'Име контакта и преглед поруке';

  @override
  String get notificationContentName => 'Само име';

  @override
  String get notificationContentNameDesc => 'Приказује само име контакта';

  @override
  String get notificationContentDiscrete => 'Дискретно';

  @override
  String get notificationContentDiscreteDesc =>
      'Приказује само \"Нова порука\"';

  @override
  String get security => 'Безбедност';

  @override
  String get howHashProtectsYou => 'Како те Hash штити';

  @override
  String get howHashProtectsYouSubtitle => 'Разуми своју безбедност';

  @override
  String get accountSecurity => 'Безбедност налога';

  @override
  String get accountSecuritySubtitle => 'PIN, биометрија, Vash режим';

  @override
  String get blockScreenshots => 'Блокирај снимке екрана';

  @override
  String get transferDevice => 'Пренеси на други уређај';

  @override
  String get transferDeviceSubtitle => 'Мигрирај свој налог';

  @override
  String get pinCode => 'PIN код';

  @override
  String get changePin => 'Промени PIN код';

  @override
  String get currentPin => 'Тренутни PIN код';

  @override
  String get newPin => 'Нови PIN код';

  @override
  String get confirmPin => 'Потврди PIN код';

  @override
  String get pinChanged => 'PIN код промењен';

  @override
  String get incorrectPin => 'Нетачан PIN';

  @override
  String get pinsDoNotMatch => 'PIN кодови се не поклапају';

  @override
  String get autoLock => 'Аутоматско закључавање';

  @override
  String get autoLockDelay => 'Одлагање закључавања';

  @override
  String get autoLockImmediate => 'Одмах';

  @override
  String get autoLockMinute => '1 минут';

  @override
  String autoLockMinutes(int count) {
    return '$count минута';
  }

  @override
  String get vashCode => 'Vash код';

  @override
  String get vashModeTitle => 'Vash режим';

  @override
  String get vashModeExplanation => 'Ваша коначна мрежа безбедности.';

  @override
  String get vashModeDescription =>
      'Изабраћете други PIN код. Ако икада будете приморани да отворите Hash, унесите овај код уместо свог уобичајеног PIN-а.\n\nАпликација ће се отворити нормално, али сви ваши разговори и контакти ће нестати.\n\nЗа свакога ко гледа ваш екран, Hash изгледа празно — као да га никада нисте користили.';

  @override
  String get vashModeIrreversible => 'Ова акција је тиха и неповратна.';

  @override
  String get chooseVashCode => 'Изабери мој Vash код';

  @override
  String get vashCodeInfo =>
      'Други PIN код који отвара апликацију нормално, али празну.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Ако унесете овај код уместо свог PIN-а:';

  @override
  String get vashDeleteContacts => 'Ваши контакти нестају';

  @override
  String get vashDeleteMessages => 'Ваши разговори нестају';

  @override
  String get vashDeleteHistory => 'Ваше белешке нестају';

  @override
  String get vashKeepId => 'Ваш Hash идентитет (#XXX-XXX-XXX) остаје исти';

  @override
  String get vashAppearNormal =>
      'Апликација изгледа нормално али празно, као нова. Ова акција је неповратна.';

  @override
  String get setupVashCode => 'Подеси Vash код';

  @override
  String get modifyVashCode => 'Измени Vash код';

  @override
  String get currentVashCode => 'Тренутни Vash код';

  @override
  String get newVashCode => 'Нови Vash код';

  @override
  String get confirmVashCode => 'Потврди Vash код';

  @override
  String get vashCodeConfigured => 'Vash код подешен';

  @override
  String get vashCodeModified => 'Vash код измењен';

  @override
  String get vashCodeMustDiffer => 'Vash код мора бити другачији од PIN-а';

  @override
  String get incorrectVashCode => 'Нетачан Vash код';

  @override
  String get vashWhatToDelete => 'Шта Vash режим треба да уклони?';

  @override
  String get vashDeleteContactsOption => 'Контакти';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Поруке';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Белешке';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash режим активиран';

  @override
  String get vashCreateSubtitle => 'Изаберите код другачији од главног PIN-а';

  @override
  String get vashConfirmSubtitle => 'Потврдите свој Vash код';

  @override
  String get pinCodeForEntry => 'PIN код за улазак у апликацију';

  @override
  String get vashCodeSection => 'Vash режим';

  @override
  String get biometric => 'Биометрија';

  @override
  String get biometricUnlock => 'Откључај отиском прста или Face ID';

  @override
  String get enableBiometric => 'Укључи биометрију';

  @override
  String get biometricWarningMessage =>
      'Укључивањем биометрије нећете моћи да користите Vash код за улазак у апликацију.\n\nVash код ћете моћи да користите само ако биометрија не успе (после више неуспешних покушаја).\n\nДа ли сте сигурни да желите да наставите?';

  @override
  String get understood => 'Разумем';

  @override
  String get shareAppSubtitle => 'Поделите Hash са блиским особама';

  @override
  String get share => 'Подели';

  @override
  String get danger => 'Опасност';

  @override
  String get deleteAccount => 'Обриши мој налог';

  @override
  String get deleteAccountSubtitle => 'Неповратна акција';

  @override
  String get deleteAccountConfirmTitle => 'Обриши мој налог';

  @override
  String get deleteAccountConfirmMessage =>
      'Ваш налог ће бити трајно обрисан. Ова акција је неповратна.\n\n• Сви ваши четови\n• Сви ваши контакти\n• Ваш Hash ID\n\nМораћете да направите нови налог.';

  @override
  String get deleteForever => 'Обриши трајно';

  @override
  String get cancel => 'Откажи';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash режим активиран.';

  @override
  String deletionError(String error) {
    return 'Грешка при брисању: $error';
  }

  @override
  String get yourSecurity => 'Ваша безбедност';

  @override
  String get securityInfo =>
      '• Шифровање с краја на крај (Signal Protocol)\n• Нема података на нашим серверима после испоруке\n• Кључеви се чувају само на вашем уређају\n• PIN код се никада не шаље серверу';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Добродошли';

  @override
  String get securityStatement1 => 'Ваше поруке су заштићене.';

  @override
  String get securityStatement2 => 'Шифровање с краја на крај.';

  @override
  String get securityStatement3 => 'Нула трагова. Нула компромиса.';

  @override
  String get securityStatement4 => 'Ваша приватност је право.';

  @override
  String get accessBlocked => 'Приступ блокиран';

  @override
  String get tooManyAttempts => 'Превише покушаја. Покушајте поново касније.';

  @override
  String get pleaseWait => 'Молимо сачекајте';

  @override
  String get waitDelay => 'Молимо сачекајте да истекне одлагање';

  @override
  String attemptCount(int current, int max) {
    return 'Покушај $current од $max';
  }

  @override
  String retryIn(String time) {
    return 'Покушајте поново за $time';
  }

  @override
  String get forgotPin => 'Заборавили PIN? Користите фразу за опоравак';

  @override
  String get useRecoveryPhrase => 'Користи фразу за опоравак';

  @override
  String get recoveryWarningTitle => 'Упозорење';

  @override
  String get recoveryWarningMessage => 'Опоравак налога ће:';

  @override
  String get recoveryDeleteAllMessages => 'Обрисати СВЕ ваше поруке';

  @override
  String get recoveryWaitDelay => 'Захтевати одлагање од 1 сат';

  @override
  String get recoveryKeepContacts => 'Задржати ваше контакте';

  @override
  String get recoveryIrreversible =>
      'Ова акција је неповратна. Ваше поруке ће бити трајно изгубљене.';

  @override
  String get iUnderstand => 'Разумем';

  @override
  String get accountRecovery => 'Опоравак налога';

  @override
  String get enterRecoveryPhrase =>
      'Унесите 24 речи ваше фразе за опоравак, раздвојене размацима.';

  @override
  String get recoveryPhraseHint => 'реч1 реч2 реч3 ...';

  @override
  String get recover => 'Опорави';

  @override
  String get recoveryPhraseRequired => 'Молимо унесите фразу за опоравак';

  @override
  String get recoveryPhrase24Words => 'Фраза мора садржати тачно 24 речи';

  @override
  String get incorrectRecoveryPhrase => 'Нетачна фраза за опоравак';

  @override
  String get recoveryInitError => 'Грешка при покретању опоравка';

  @override
  String get securityDelay => 'Безбедносно одлагање';

  @override
  String get securityDelayMessage =>
      'За вашу безбедност, потребан је период чекања пре него што можете да направите нови PIN.';

  @override
  String get timeRemaining => 'Преостало време';

  @override
  String get messagesDeletedForProtection =>
      'Ваше поруке су обрисане за вашу заштиту.';

  @override
  String get canCloseApp => 'Можете затворити апликацију и вратити се касније.';

  @override
  String get onboardingTitle1 => 'Добродошли у Hash';

  @override
  String get onboardingSubtitle1 => 'Месенџер који не оставља трагове';

  @override
  String get onboardingTitle2 => 'Потпуно шифровање';

  @override
  String get onboardingSubtitle2 =>
      'Ваше поруке су шифроване с краја на крај Signal протоколом';

  @override
  String get onboardingTitle3 => 'Нула трагова';

  @override
  String get onboardingSubtitle3 => 'Поруке се бришу са сервера по испоруци';

  @override
  String get onboardingTitle4 => 'Ваша безбедност';

  @override
  String get onboardingSubtitle4 => 'PIN код, Vash режим и фраза за опоравак';

  @override
  String get getStarted => 'Започни';

  @override
  String get next => 'Даље';

  @override
  String get skip => 'Прескочи';

  @override
  String get alreadyHaveAccount => 'Већ имам налог';

  @override
  String get transferMyAccount => 'Пренеси мој налог';

  @override
  String get createPin => 'Направи PIN код';

  @override
  String get createPinSubtitle =>
      'Овај код ће штитити приступ вашој апликацији';

  @override
  String get confirmYourPin => 'Потврди свој PIN код';

  @override
  String get confirmPinSubtitle => 'Унесите поново свој PIN код';

  @override
  String get saveRecoveryPhrase => 'Фраза за опоравак';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Запишите ових 24 речи по реду. Они ће вам омогућити да опоравите налог ако заборавите PIN.';

  @override
  String get phraseWritten => 'Записао/ла сам своју фразу';

  @override
  String get warningRecoveryPhrase =>
      'Ако изгубите ову фразу и заборавите PIN, изгубићете приступ свом налогу.';

  @override
  String get accountTransferred => 'Налог пренет';

  @override
  String get accountTransferredMessage =>
      'Ваш налог је пренет на други уређај. Ова сесија више није важећа.';

  @override
  String get accountTransferredInfo =>
      'Ако нисте покренули овај пренос, ваш налог је можда компромитован.';

  @override
  String get logout => 'Одјави се';

  @override
  String get transferAccount => 'Пренеси налог';

  @override
  String get transferAccountInfo =>
      'Пренесите свој Hash налог на нови уређај. Ваша тренутна сесија ће бити поништена.';

  @override
  String get generateTransferCode => 'Генериши код за пренос';

  @override
  String get transferCode => 'Код за пренос';

  @override
  String transferCodeExpires(int minutes) {
    return 'Овај код истиче за $minutes минута';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Унесите овај код на свом новом уређају да бисте пренели налог.';

  @override
  String get generateNewCode => 'Генериши нови код';

  @override
  String get scanQrCode => 'Скенирај QR код';

  @override
  String get scanQrCodeSubtitle =>
      'Скенирајте QR код контакта да бисте га додали';

  @override
  String get qrCodeDetected => 'QR код детектован';

  @override
  String get invalidQrCode => 'Неважећи QR код';

  @override
  String get cameraPermissionRequired => 'Потребна дозвола за камеру';

  @override
  String get myQrCode => 'Мој QR код';

  @override
  String get myQrCodeSubtitle =>
      'Поделите овај QR код да би вас контакти могли додати';

  @override
  String get shareQrCode => 'Подели';

  @override
  String get addContactTitle => 'Додај контакт';

  @override
  String get addContactByHashId => 'Унесите Hash ID вашег контакта';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Претражи';

  @override
  String get contactNotFound => 'Контакт није пронађен';

  @override
  String get contactAlreadyAdded => 'Овај контакт је већ на вашој листи';

  @override
  String get contactAdded => 'Контакт додат';

  @override
  String get myProfile => 'Мој профил';

  @override
  String get myProfileSubtitle =>
      'Поделите ове информације да би вас други могли додати';

  @override
  String get temporaryCode => 'Привремени код';

  @override
  String temporaryCodeExpires(String time) {
    return 'Истиче за $time';
  }

  @override
  String get codeExpired => 'Код истекао';

  @override
  String get generateNewCodeButton => 'Нови код';

  @override
  String get copyHashId => 'Копирај ID';

  @override
  String get copyCode => 'Копирај код';

  @override
  String get copiedToClipboard => 'Копирано';

  @override
  String get showMyQrCode => 'Прикажи мој QR код';

  @override
  String get orDivider => 'или';

  @override
  String get openScanner => 'Отвори скенер';

  @override
  String get addManually => 'Додај ручно';

  @override
  String get contactHashIdLabel => 'Hash ID контакта';

  @override
  String get temporaryCodeLabel => 'Привремени код';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Замолите контакт да генерише код из свог профила';

  @override
  String get verifyAndAdd => 'Провери и додај';

  @override
  String get fillAllFields => 'Молимо попуните сва поља';

  @override
  String get invalidHashIdFormat => 'Неважећи формат ID-а (нпр: 123-456-ABC)';

  @override
  String get userNotFound => 'Корисник није пронађен';

  @override
  String get cannotAddYourself => 'Не можете додати себе';

  @override
  String get invalidOrExpiredCode => 'Неважећи или истекли привремени код';

  @override
  String get contactFound => 'Контакт пронађен!';

  @override
  String get howToCallContact => 'Како желите да га зовете?';

  @override
  String get contactNameHint => 'Име контакта';

  @override
  String get addContactButton => 'Додај';

  @override
  String get contactDetails => 'Детаљи контакта';

  @override
  String get contactName => 'Име контакта';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Додат $date';
  }

  @override
  String get deleteContact => 'Обриши контакт';

  @override
  String deleteContactConfirm(Object name) {
    return 'Обрисати овај контакт?';
  }

  @override
  String get deleteContactMessage => 'Ово ће такође обрисати цео чет.';

  @override
  String get delete => 'Обриши';

  @override
  String get typeMessage => 'Напишите поруку...';

  @override
  String get messageSent => 'Послато';

  @override
  String get messageDelivered => 'Испоручено';

  @override
  String get messageRead => 'Прочитано';

  @override
  String get messageFailed => 'Слање неуспешно';

  @override
  String get now => 'Сада';

  @override
  String minutesAgo(int count) {
    return '$countмин';
  }

  @override
  String hoursAgo(int count) {
    return '$countч';
  }

  @override
  String daysAgo(int count) {
    return '$countд';
  }

  @override
  String get today => 'Данас';

  @override
  String get yesterday => 'Јуче';

  @override
  String dateAtTime(String date, String time) {
    return '$date у $time';
  }

  @override
  String get shareMessage =>
      'Придружи ми се на Hash-у! 🔒\n\nТо је стварно приватан месенџер: потпуно шифровање, нула трагова на серверима и паник режим ако затреба.\n\nПреузми апликацију овде 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Грешка';

  @override
  String get ok => 'У реду';

  @override
  String get view => 'Прикажи';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Не';

  @override
  String get save => 'Сачувај';

  @override
  String get edit => 'Уреди';

  @override
  String get close => 'Затвори';

  @override
  String get confirm => 'Потврди';

  @override
  String get loading => 'Учитавање...';

  @override
  String get retry => 'Покушај поново';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Захтеви на чекању';

  @override
  String get noPendingRequests => 'Нема захтева на чекању';

  @override
  String get pendingRequestsSubtitle => 'Ове особе желе да вас додају';

  @override
  String requestFromUser(String hashId) {
    return 'Захтев од $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Истиче за $days дана';
  }

  @override
  String get acceptRequest => 'Прихвати';

  @override
  String get rejectRequest => 'Одбиј';

  @override
  String get requestAccepted => 'Захтев прихваћен';

  @override
  String get requestRejected => 'Захтев одбијен';

  @override
  String get requestSent => 'Захтев послат!';

  @override
  String get requestSentSubtitle =>
      'Ваш захтев је послат. Корисник мора да га прихвати пре него што можете да разговарате.';

  @override
  String get requestAlreadyPending => 'Захтев је већ на чекању';

  @override
  String get requestAlreadySentByOther => 'Ова особа вам је већ послала захтев';

  @override
  String get addByHashId => 'Додај преко Hash ID-а';

  @override
  String get addByHashIdSubtitle => 'Унесите Hash ID и привремени код контакта';

  @override
  String get enterTemporaryCode => 'Унесите шестоцифрени код';

  @override
  String get sendRequest => 'Пошаљи захтев';

  @override
  String get acceptContactTitle => 'Прихвати контакт';

  @override
  String get acceptContactSubtitle => 'Можете му дати прилагођено име';

  @override
  String get leaveEmptyForHashId => 'Оставите празно за коришћење Hash ID-а';

  @override
  String get firstName => 'Име';

  @override
  String get lastName => 'Презиме';

  @override
  String get notes => 'Белешке';

  @override
  String get notesHint => 'Личне белешке о овом контакту';

  @override
  String get photoOptional => 'Фотографија (опционо)';

  @override
  String get contactNameOptional => 'Име (опционо)';

  @override
  String get notesOptional => 'Белешке (опционо)';

  @override
  String get storedLocally => 'Сачувано само на вашем уређају';

  @override
  String get encryptedMessageLabel => 'Шифрована порука';

  @override
  String get identityMessageHint => 'Ко сте? Како се познајете?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ова порука ће бити шифрована и послата примаоцу';

  @override
  String get sendRequestButton => 'Пошаљи захтев';

  @override
  String get requestExpiresIn24h => 'Захтев истиче за 24ч ако није прихваћен';

  @override
  String get theyAlreadySentYouRequest => 'Ова особа вам је већ послала захтев';

  @override
  String get requests => 'Захтеви';

  @override
  String get receivedRequests => 'Примљени';

  @override
  String get sentRequests => 'Послати';

  @override
  String get noSentRequests => 'Нема послатих захтева';

  @override
  String get cancelRequest => 'Откажи';

  @override
  String get deleteRequest => 'Обриши захтев';

  @override
  String get requestCancelled => 'Захтев отказан';

  @override
  String sentTo(String hashId) {
    return 'Послато ка $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Истиче за $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Примљено пре $time';
  }

  @override
  String get messageFromRequester => 'Порука од подносиоца захтева';

  @override
  String get copy => 'Копирај';

  @override
  String get messageInfo => 'Информације о поруци';

  @override
  String get messageDirection => 'Смер';

  @override
  String get messageSentByYou => 'Послато од вас';

  @override
  String get messageReceived => 'Примљено';

  @override
  String get messageSentAt => 'Послато у';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Статус';

  @override
  String get messageReadAt => 'Прочитано у';

  @override
  String get messageType => 'Тип';

  @override
  String get messageSize => 'Величина';

  @override
  String get messageExpiresAt => 'Истиче';

  @override
  String get messageEncrypted => 'Шифровано с краја на крај';

  @override
  String get messageStatusSending => 'Слање...';

  @override
  String get messageStatusSent => 'Послато';

  @override
  String get messageStatusDelivered => 'Испоручено';

  @override
  String get messageStatusRead => 'Прочитано';

  @override
  String get messageStatusFailed => 'Неуспешно';

  @override
  String get serverStatus => 'Сервер';

  @override
  String get onServer => 'Чека испоруку';

  @override
  String get deletedFromServer => 'Обрисано';

  @override
  String get messageTypeText => 'Текст';

  @override
  String get messageTypeImage => 'Слика';

  @override
  String get messageTypeVideo => 'Видео';

  @override
  String get messageTypeVoice => 'Глас';

  @override
  String get messageTypeFile => 'Фајл';

  @override
  String get indefinitely => 'Неограничено';

  @override
  String get hoursShort => 'ч';

  @override
  String get minutesShort => 'мин';

  @override
  String get hours => 'сати';

  @override
  String get minutes => 'минута';

  @override
  String get seconds => 'секунди';

  @override
  String get ephemeralMessages => 'Ефемерне поруке';

  @override
  String get ephemeralMessagesDescription =>
      'Поруке се аутоматски бришу након овог времена';

  @override
  String get ephemeralImmediate => 'Одмах (после читања)';

  @override
  String get ephemeralImmediateDesc => 'Обрисано чим се прочита';

  @override
  String get ephemeralMyPreference => 'Моја преференца';

  @override
  String get ephemeralMyPreferenceDesc => 'Користи глобално подешавање';

  @override
  String get ephemeralDefaultSetting => 'Трајање порука';

  @override
  String get ephemeralChooseDefault => 'Препоручено';

  @override
  String get ephemeral30Seconds => '30 секунди';

  @override
  String get ephemeral30SecondsDesc => 'Обрисано 30с после читања';

  @override
  String get ephemeral5Minutes => '5 минута';

  @override
  String get ephemeral5MinutesDesc => 'Обрисано 5мин после читања';

  @override
  String get ephemeral1Hour => '1 сат';

  @override
  String get ephemeral1HourDesc => 'Обрисано 1ч после читања';

  @override
  String get ephemeral3Hours => '3 сата';

  @override
  String get ephemeral6Hours => '6 сати';

  @override
  String get ephemeral6HoursDesc => 'Обрисано 6ч после читања';

  @override
  String get ephemeral12Hours => '12 сати';

  @override
  String get ephemeral24Hours => '24 сата';

  @override
  String get ephemeral24HoursDesc => 'Обрисано 24ч после читања';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Прилагођено трајање';

  @override
  String get howItWorks => 'Како функционише';

  @override
  String get ephemeralExplanation1 =>
      'Поруке се бришу са сервера чим буду примљене.';

  @override
  String get ephemeralExplanation2 =>
      'Ово подешавање одређује када поруке нестају са ВАШЕГ телефона након читања.';

  @override
  String get ephemeralExplanation3 =>
      'Ваш контакт има своје подешавање за свој телефон.';

  @override
  String get mute1Hour => '1 сат';

  @override
  String get mute8Hours => '8 сати';

  @override
  String get mute1Day => '1 дан';

  @override
  String get mute1Week => '1 недеља';

  @override
  String get muteAlways => 'Увек';

  @override
  String get muteExplanation => 'Нећете примати обавештења за овај контакт';

  @override
  String get showCallsInRecents => 'Прикажи у недавним позивима';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash позиви се појављују у историји позива телефона';

  @override
  String get feedback => 'Повратне информације';

  @override
  String get muteNotifications => 'Искључи обавештења';

  @override
  String get muteDescription => 'Нећете примати обавештења за овај контакт';

  @override
  String mutedUntil(String time) {
    return 'Утишано до $time';
  }

  @override
  String get notMuted => 'Обавештења укључена';

  @override
  String get unmute => 'Укључи звук';

  @override
  String get notificationSound => 'Звук обавештења';

  @override
  String get defaultSound => 'Подразумевани';

  @override
  String get chatSettings => 'Подешавања чета';

  @override
  String get bubbleColor => 'Боја облачића';

  @override
  String get backgroundColor => 'Боја позадине';

  @override
  String get backgroundImage => 'Слика позадине';

  @override
  String get chatBackground => 'Позадина чета';

  @override
  String get customColor => 'Прилагођена';

  @override
  String get defaultColor => 'Подразумевана';

  @override
  String get imageSelected => 'Слика изабрана';

  @override
  String get noImage => 'Нема слике';

  @override
  String get color => 'Боја';

  @override
  String get image => 'Слика';

  @override
  String get tapToSelectImage => 'Додирните да изаберете слику';

  @override
  String get changeImage => 'Промени слику';

  @override
  String get previewMessageReceived => 'Здраво!';

  @override
  String get previewMessageSent => 'Ћао!';

  @override
  String get messageAction => 'Порука';

  @override
  String get callAction => 'Позив';

  @override
  String get videoAction => 'Видео';

  @override
  String get personalNotes => 'Личне белешке';

  @override
  String get addNotes => 'Додај белешке...';

  @override
  String get noNotes => 'Нема белешки';

  @override
  String get messageNotifications => 'Обавештења о порукама';

  @override
  String get callNotifications => 'Обавештења о позивима';

  @override
  String get useGradient => 'Користи градијент';

  @override
  String get gradientStart => 'Почетна боја';

  @override
  String get gradientEnd => 'Крајња боја';

  @override
  String get preview => 'Преглед';

  @override
  String get reset => 'Ресетуј';

  @override
  String get securityNumber => 'Безбедносни број';

  @override
  String securityNumberDescription(String name) {
    return 'Проверите да ли се безбедносни број поклапа са уређајем корисника $name';
  }

  @override
  String get verifyEncryption => 'Провери шифровање с краја на крај';

  @override
  String get tapToCopy => 'Додирни за копирање';

  @override
  String get howToVerify => 'Како проверити';

  @override
  String get verifyStep1 => 'Сретните се са контактом лично или га позовите';

  @override
  String get verifyStep2 =>
      'Упоредите безбедносне бројеве или скенирајте QR кодове';

  @override
  String get verifyStep3 => 'Ако се поклапају, ваш чет је безбедан';

  @override
  String get scanToVerify => 'Скенирај за проверу';

  @override
  String get reportSpam => 'Пријави спам';

  @override
  String get reportSpamSubtitle => 'Пријави овај контакт као спам';

  @override
  String get reportSpamDescription =>
      'Овај контакт ће бити анонимно пријављен. Ваш идентитет неће бити откривен. Да ли сте сигурни?';

  @override
  String get report => 'Пријави';

  @override
  String get spamReported => 'Спам пријављен';

  @override
  String get reportError => 'Слање пријаве неуспешно. Покушајте поново.';

  @override
  String get reportRateLimited =>
      'Достигли сте максималан број пријава за данас.';

  @override
  String get blockContact => 'Блокирај контакт';

  @override
  String get blockContactDescription =>
      'Овај контакт више неће моћи да вам шаље поруке нити да вас позива. Неће бити обавештен.';

  @override
  String get unblockContact => 'Деблокирај контакт';

  @override
  String get unblockContactDescription =>
      'Овај контакт ће поново моћи да вам шаље поруке и да вас позива.';

  @override
  String get contactBlocked => 'Контакт блокиран';

  @override
  String get contactUnblocked => 'Контакт деблокиран';

  @override
  String get contactIsBlocked => 'Овај контакт је блокиран';

  @override
  String get unblock => 'Деблокирај';

  @override
  String get deleteContactSubtitle => 'Обриши овај контакт и чет';

  @override
  String get confirmWithPin => 'Потврди PIN-ом';

  @override
  String get enterPinToConfirm => 'Унесите свој PIN да потврдите ову акцију';

  @override
  String get profilePhoto => 'Профилна фотографија';

  @override
  String get takePhoto => 'Усликај';

  @override
  String get chooseFromGallery => 'Изабери из галерије';

  @override
  String get removePhoto => 'Уклони фотографију';

  @override
  String get viewContactHashId => 'Прикажи идентификатор контакта';

  @override
  String get hashIdPartiallyMasked =>
      'Делимично маскиран за вашу безбедност и приватност вашег контакта';

  @override
  String get addFirstContact => 'Додајте свој први контакт';

  @override
  String get addFirstContactSubtitle =>
      'Поделите свој QR код или скенирајте пријатељев';

  @override
  String get directory => 'Именик';

  @override
  String get noContacts => 'Нема контаката';

  @override
  String get noContactsSubtitle => 'Додајте контакт да бисте почели';

  @override
  String get sendMessageAction => 'Пошаљи поруку';

  @override
  String get audioCall => 'Аудио позив';

  @override
  String get videoCall => 'Видео позив';

  @override
  String get viewProfile => 'Прикажи профил';

  @override
  String get deleteContactDirectory => 'Обриши контакт';

  @override
  String get scanShort => 'Скенирај';

  @override
  String get addShort => 'Додај';

  @override
  String deleteContactConfirmName(String name) {
    return 'Да ли сте сигурни да желите да обришете $name?';
  }

  @override
  String get noNotesTitle => 'Нема белешки';

  @override
  String get noNotesSubtitle => 'Направите своју прву белешку';

  @override
  String get newNote => 'Нова белешка';

  @override
  String get editNote => 'Уреди белешку';

  @override
  String get deleteNote => 'Обриши белешку';

  @override
  String get deleteNoteConfirm =>
      'Да ли сте сигурни да желите да обришете ову белешку?';

  @override
  String get noteTitle => 'Наслов';

  @override
  String get noteContent => 'Садржај';

  @override
  String get addItem => 'Додај ставку';

  @override
  String get pinNote => 'Закачи';

  @override
  String get unpinNote => 'Откачи';

  @override
  String get noteColor => 'Боја';

  @override
  String get notePassword => 'Лозинка';

  @override
  String get setPassword => 'Постави лозинку';

  @override
  String get changePassword => 'Промени лозинку';

  @override
  String get removePassword => 'Уклони лозинку';

  @override
  String get enterPassword => 'Унесите лозинку';

  @override
  String get confirmPassword => 'Потврдите лозинку';

  @override
  String get passwordPin => 'PIN код';

  @override
  String get passwordText => 'Текстуална лозинка';

  @override
  String get protectedNote => 'Заштићена белешка';

  @override
  String get incorrectPassword => 'Нетачна лозинка';

  @override
  String get passwordSet => 'Лозинка постављена';

  @override
  String get passwordRemoved => 'Лозинка уклоњена';

  @override
  String get notesBiometric => 'Face ID за белешке';

  @override
  String get notesBiometricSubtitle =>
      'Захтевај биометријску аутентификацију за отварање заштићених белешки';

  @override
  String get textNote => 'Текстуална белешка';

  @override
  String get checklistNote => 'Чеклиста';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total задатака';
  }

  @override
  String get autoSaved => 'Сачувано';

  @override
  String get searchNotes => 'Претражи белешке';

  @override
  String get legalConsent => 'Правна сагласност';

  @override
  String get confirmAge13 => 'Потврђујем да имам најмање 13 година';

  @override
  String get acceptLegalStart => 'Прихватам ';

  @override
  String get privacyPolicy => 'Политику приватности';

  @override
  String get termsOfService => 'Услове коришћења';

  @override
  String get andThe => ' и ';

  @override
  String get continueButton => 'Настави';

  @override
  String get mustAcceptTerms =>
      'Морате прихватити оба услова да бисте наставили';

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
  String get support => 'Подршка';

  @override
  String get contactSupport => 'Контактирајте подршку';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Пријави злоупотребу';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Правно';

  @override
  String get legalEntity => 'Правно лице';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Закачи';

  @override
  String get unpinConversation => 'Откачи';

  @override
  String get hideConversation => 'Уклони из листе';

  @override
  String get deleteConversation => 'Обриши разговор';

  @override
  String get deleteConversationConfirm =>
      'Унесите свој PIN да потврдите брисање свих порука';

  @override
  String get noConversations => 'Нема разговора';

  @override
  String get startConversation => 'Започни';

  @override
  String get microphonePermissionRequired => 'Потребан приступ микрофону';

  @override
  String get microphonePermissionExplanation =>
      'Hash-у је потребан микрофон за позиве.';

  @override
  String get cameraPermissionExplanation =>
      'Hash-у је потребна камера за видео позиве.';

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
  String get openSettings => 'Отвори подешавања';

  @override
  String get callConnecting => 'Повезивање...';

  @override
  String get callRinging => 'Звони...';

  @override
  String get callReconnecting => 'Поновно повезивање...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Поновно повезивање ($secondsс)';
  }

  @override
  String get callPaused => 'Паузирано';

  @override
  String get callPausedSubtitle => 'Позив је још увек активан';

  @override
  String get callRemoteMicMuted => 'Микрофон контакта је искључен';

  @override
  String get callMiniControlsMute => 'Искључи микрофон';

  @override
  String get callMiniControlsUnmute => 'Укључи микрофон';

  @override
  String get callMiniControlsHangUp => 'Прекини';

  @override
  String get callMiniControlsReturn => 'Врати се на позив';

  @override
  String get callNetworkPoor => 'Нестабилна веза';

  @override
  String get callNetworkLost => 'Веза изгубљена';

  @override
  String get callEndedTitle => 'Позив завршен';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Подаци уређаја';

  @override
  String get deviceDataSubtitle => 'Локално и серверско складиште';

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
  String get localStorage => 'Локално складиште';

  @override
  String get onThisDevice => 'на овом уређају';

  @override
  String get encryptedDatabases => 'Шифроване базе података';

  @override
  String get files => 'Фајлови';

  @override
  String get secureKeychain => 'Безбедни привезак кључева';

  @override
  String get cache => 'Кеш';

  @override
  String get contactsDetail => 'Имена, аватари, Signal кључеви';

  @override
  String get messagesDetail => 'Шифровани разговори';

  @override
  String get notesDetail => 'Личне белешке';

  @override
  String get signalSessions => 'Signal сесије';

  @override
  String get signalSessionsDetail => 'Сесије шифровања';

  @override
  String get pendingContacts => 'Контакти на чекању';

  @override
  String get pendingContactsDetail => 'Захтеви на чекању';

  @override
  String get callHistory => 'Позиви';

  @override
  String get callHistoryDetail => 'Историја позива';

  @override
  String get preferences => 'Преференце';

  @override
  String get preferencesDetail => 'Преференце за медије и позиве';

  @override
  String get avatars => 'Аватари';

  @override
  String get media => 'Медији';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фајлова',
      one: '1 фајл',
      zero: 'нема фајлова',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Активно';

  @override
  String get notDefined => 'Није дефинисано';

  @override
  String get biometrics => 'Биометрија';

  @override
  String get recoveryPhrase => 'Фраза за опоравак';

  @override
  String get identity => 'Идентитет (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol кључеви';

  @override
  String get authTokens => 'Токени за аутентификацију';

  @override
  String get contactNamesCache => 'Кеш имена контаката';

  @override
  String get remoteConfig => 'Удаљена конфигурација';

  @override
  String get notificationPrefs => 'Преференце обавештења';

  @override
  String get serverData => 'Подаци на серверу';

  @override
  String get serverDataInfo =>
      'Hash чува минимум података на серверу, све шифровано или привремено.';

  @override
  String get serverProfile => 'Профил';

  @override
  String get serverProfileDetail =>
      'Hash ID, јавни кључеви, токен поштанског сандучета';

  @override
  String get serverPrekeys => 'Пре-кључеви';

  @override
  String get serverPrekeysDetail => 'Једнократни Signal кључеви (утрошени)';

  @override
  String get serverMessages => 'Поруке у транзиту';

  @override
  String get serverMessagesDetail => 'Обрисане после испоруке (макс 24ч)';

  @override
  String get serverMedia => 'Медији у транзиту';

  @override
  String get serverMediaDetail => 'Обрисани после преузимања';

  @override
  String get serverContactRequests => 'Захтеви за контакт';

  @override
  String get serverContactRequestsDetail => 'Истичу после 24ч';

  @override
  String get serverRateLimits => 'Ограничења учесталости';

  @override
  String get serverRateLimitsDetail => 'Привремени подаци против злоупотребе';

  @override
  String get privacyReassurance =>
      'Hash не може да чита ваше поруке. Сви подаци су шифровани с краја на крај. Подаци на серверу се аутоматски бришу.';

  @override
  String get pinTooSimple =>
      'Овај PIN је превише једноставан. Изаберите безбеднији код.';

  @override
  String get genericError => 'Дошло је до грешке. Покушајте поново.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Није могуће креирати налог: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Фраза копирана у међуспремник';

  @override
  String get copyPhrase => 'Копирај фразу';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Запишите ову фразу на безбедно место. Ако изгубите PIN без ове фразе, трајно ћете изгубити приступ својим подацима.';

  @override
  String get noMessages => 'Нема порука';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Обрисати све поруке са $name?';
  }

  @override
  String get confirmation => 'Потврда';

  @override
  String get untitled => 'Без наслова';

  @override
  String get noSessions => 'Нема сесија';

  @override
  String get unknownContact => 'Непознат контакт';

  @override
  String get unnamed => 'Без имена';

  @override
  String get noPendingRequestsAlt => 'Нема захтева на чекању';

  @override
  String get deleteAllCallHistory => 'Обрисати целу историју позива?';

  @override
  String get noCalls => 'Нема позива';

  @override
  String get noPreferences => 'Нема преференци';

  @override
  String get resetAllMediaPrefs => 'Ресетовати све преференце за медије?';

  @override
  String get deleteThisAvatar => 'Обрисати овај аватар?';

  @override
  String get deleteAllAvatars => 'Обрисати све аватаре?';

  @override
  String get noAvatars => 'Нема аватара';

  @override
  String get deleteThisFile => 'Обрисати овај фајл?';

  @override
  String get deleteAllMediaFiles => 'Обрисати све медије?';

  @override
  String get noMediaFiles => 'Нема медија';

  @override
  String get outgoing => 'Одлазни';

  @override
  String get incoming => 'Долазни';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Ефемерни приказ: $secondsс';
  }

  @override
  String get normalView => 'Нормалан приказ';

  @override
  String get callReasonCompleted => 'Завршен';

  @override
  String get callReasonMissed => 'Пропуштен';

  @override
  String get callReasonDeclined => 'Одбијен';

  @override
  String get callReasonFailed => 'Неуспешан';

  @override
  String get justNow => 'Управо сада';

  @override
  String timeAgoMinutes(int count) {
    return 'Пре $count мин';
  }

  @override
  String timeAgoHours(int count) {
    return 'Пре $countч';
  }

  @override
  String timeAgoDays(int count) {
    return 'Пре $countд';
  }

  @override
  String get messageTypeContact => 'Контакт';

  @override
  String get messageTypeLocation => 'Локација';

  @override
  String get statusQueued => 'У реду за чекање';

  @override
  String get blockedBadge => 'Блокиран';

  @override
  String get protectedBadge => 'Заштићено';

  @override
  String messageCount(int count) {
    return '$count порука(е)';
  }

  @override
  String get deleteQuestion => 'Обрисати?';

  @override
  String get transferMyAccountTitle => 'Пренеси мој налог';

  @override
  String get loadingError => 'Грешка при учитавању';

  @override
  String get transferToNewDevice => 'Пренеси на нови уређај';

  @override
  String get transferInstructions =>
      'На новом уређају изаберите \"Опорави мој налог\" и унесите ове информације:';

  @override
  String get yourHashIdLabel => 'Ваш Hash ID';

  @override
  String get enterYourPinCode => 'Унесите свој PIN код';

  @override
  String get pinOwnerConfirmation => 'Да потврдите да сте власник овог налога';

  @override
  String get scanThisQrCode => 'Скенирајте овај QR код';

  @override
  String get withYourNewDevice => 'Својим новим уређајем';

  @override
  String get orEnterTheCode => 'или унесите код';

  @override
  String get transferCodeLabel => 'Код за пренос';

  @override
  String get proximityVerification => 'Верификација близине';

  @override
  String get bringDevicesCloser => 'Приближите оба уређаја';

  @override
  String get confirmTransferQuestion => 'Потврдити пренос?';

  @override
  String get accountWillBeTransferred =>
      'Ваш налог ће бити пренет на нови уређај.\n\nОвај уређај ће бити трајно искључен.';

  @override
  String get transferComplete => 'Пренос завршен';

  @override
  String get transferSuccessMessage =>
      'Ваш налог је успешно пренет.\n\nОва апликација ће се сада затворити.';

  @override
  String get manualVerification => 'Ручна верификација';

  @override
  String get codeDisplayedOnBothDevices => 'Код приказан на оба уређаја:';

  @override
  String get doesCodeMatchNewDevice =>
      'Да ли се овај код поклапа са кодом на новом уређају?';

  @override
  String get verifiedStatus => 'Верификовано';

  @override
  String get inProgressStatus => 'У току...';

  @override
  String get notAvailableStatus => 'Није доступно';

  @override
  String get codeExpiredRestart => 'Код је истекао. Покушајте поново.';

  @override
  String get codesDoNotMatchCancelled =>
      'Кодови се не поклапају. Пренос отказан.';

  @override
  String transferToDevice(String device) {
    return 'Ка: $device';
  }

  @override
  String get copiedExclamation => 'Копирано!';

  @override
  String expiresInTime(String time) {
    return 'Истиче за $time';
  }

  @override
  String get biometricNotAvailable =>
      'Биометрија није доступна на овом уређају';

  @override
  String get biometricAuthError => 'Грешка при биометријској аутентификацији';

  @override
  String get authenticateForBiometric =>
      'Молимо аутентификујте се да бисте омогућили биометрију';

  @override
  String get biometricAuthFailed => 'Биометријска аутентификација неуспешна';

  @override
  String get forceUpdateTitle => 'Потребно ажурирање';

  @override
  String get forceUpdateMessage =>
      'Нова верзија Hash-а је доступна. Молимо ажурирајте да бисте наставили.';

  @override
  String get updateButton => 'Ажурирај';

  @override
  String get maintenanceInProgress => 'Одржавање у току';

  @override
  String get tryAgainLater => 'Покушајте поново касније';

  @override
  String get information => 'Информација';

  @override
  String get later => 'Касније';

  @override
  String get doYouLikeHash => 'Да ли вам се свиђа Hash?';

  @override
  String get yourFeedbackHelps =>
      'Ваше мишљење нам помаже да побољшамо апликацију';

  @override
  String get ratingTerrible => 'Ужасно';

  @override
  String get ratingBad => 'Лоше';

  @override
  String get ratingOk => 'У реду';

  @override
  String get ratingGood => 'Добро';

  @override
  String get ratingExcellent => 'Одлично!';

  @override
  String get donationMessage =>
      'Hash је непрофитни пројекат. Ваша подршка нам помаже да наставимо да градимо заиста приватан месенџер.';

  @override
  String get recentConnections => 'Недавне конекције';

  @override
  String get loginInfoText =>
      'Свако откључавање PIN-ом се бележи локално. Чувају се само последњих 24 сата.';

  @override
  String get connectionCount => 'Конекција(е)';

  @override
  String get periodLabel => 'Период';

  @override
  String get historyLabel => 'Историја';

  @override
  String get noLoginRecorded => 'Нема забележених пријава';

  @override
  String get nextUnlocksAppearHere =>
      'Следећа откључавања ће се појавити овде.';

  @override
  String get dataLocalOnly =>
      'Ови подаци се чувају само на вашем уређају и никада се не преносе.';

  @override
  String get currentSession => 'Тренутна';

  @override
  String get todayLabel => 'Данас';

  @override
  String get yesterdayLabel => 'Јуче';

  @override
  String get justNowLabel => 'Управо сада';

  @override
  String minutesAgoLabel(int count) {
    return 'Пре $count мин';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Пре $hoursч';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Пре $hoursч $minutesмин';
  }

  @override
  String get noMaintenancePlanned => 'Нема планираног одржавања';

  @override
  String get everythingWorkingNormally => 'Све ради нормално';

  @override
  String get maintenanceTitle => 'Одржавање';

  @override
  String get maintenanceActiveLabel => 'У ТОКУ';

  @override
  String get maintenancePlannedLabel => 'ПЛАНИРАНО';

  @override
  String get locking => 'Закључавање...';

  @override
  String get newMessageNotification => 'Нова порука';

  @override
  String get secExplainTitle => 'Како те Hash штити';

  @override
  String get secExplainIntro =>
      'Hash је дизајниран тако да нико не може да чита твоје поруке.';

  @override
  String get secExplainIntroSub =>
      'Чак ни ми.\nЕво како то функционише, објашњено једноставно.';

  @override
  String get secJourneyLabel => 'ПУТОВАЊЕ';

  @override
  String get secJourneyTitle => 'Путовање твоје поруке';

  @override
  String get secJourneySubtitle =>
      'Од твог прста до екрана твог контакта, сваки корак је заштићен. Прати пут.';

  @override
  String get secStep1Title => 'Пишеш своју поруку';

  @override
  String get secStep1Desc =>
      'Куцаш \"Здраво!\" у апликацији. У овом тренутку, порука постоји само у меморији твог телефона. Ништа није послато.';

  @override
  String get secStep2Title => 'Шифровање Signal протоколом';

  @override
  String get secStep2Desc =>
      'Чим притиснеш \"Пошаљи\", твоја порука се претвара у низ неразумљивих карактера. Као да је твоја порука закључана у сеф чији кључ има само твој контакт.';

  @override
  String get secStep3Title => 'Sealed Sender: невидљива коверта';

  @override
  String get secStep3Desc =>
      'Замисли да шаљеш писмо поштом, али без повратне адресе на коверти. То је тачно оно што Hash ради. Порука се убацује у анонимно поштанско сандуче. Сервер не зна ко ју је послао.';

  @override
  String get secStep4Title => 'Сервер не види ништа';

  @override
  String get secStep4Desc =>
      'Сервер делује као слепи поштар. Зна само \"неко је убацио нешто у сандуче #A7X9\". Не зна ко је послао, шта је то, нити коме је намењено.';

  @override
  String get secStep4Highlight =>
      'Нема сачуваних метаподатака: нема IP адресе, нема временског печата, нема везе између пошиљаоца и примаоца.';

  @override
  String get secStep5Title => 'Твој контакт прима поруку';

  @override
  String get secStep5Desc =>
      'Телефон твог контакта преузима садржај из свог анонимног сандучета и дешифрује поруку својим приватним кључем, који никада није напустио његов уређај. \"Здраво!\" се појављује на његовом екрану.';

  @override
  String get secStep6Title => 'Порука нестаје са сервера';

  @override
  String get secStep6Desc =>
      'Чим твој контакт потврди пријем, сервер трајно брише поруку. Нема корпе, нема архиве, нема резервне копије. Чак и непрочитане поруке се аутоматски уништавају после 24 сата.';

  @override
  String get secStep7Title => 'Локално истицање';

  @override
  String get secStep7Desc =>
      'На телефону твог контакта, порука се самоуништава према трајању које си изабрао: одмах после читања, 5 минута, 1 сат... ти одлучујеш.';

  @override
  String get secJourneyConclusion =>
      'Резултат: нула трагова на серверу, нула трагова на уређајима. Порука је постојала само довољно дуго да буде прочитана, а затим је нестала.';

  @override
  String get secArchLabel => 'АРХИТЕКТУРА';

  @override
  String get secArchTitle => '5 слојева заштите';

  @override
  String get secArchSubtitle =>
      'Hash се не ослања на једну технологију. Сваки слој јача остале. Чак и ако је један слој компромитован, твоји подаци остају безбедни.';

  @override
  String get secLayer1Title => 'Шифровање с краја на крај';

  @override
  String get secLayer1Desc =>
      'Свака порука је шифрована јединственим кључем. Једноставно речено: чак и ако неко дешифрује једну поруку, неће моћи да дешифрује следећу. Свака порука има свој катанац.';

  @override
  String get secLayer1Detail =>
      'За фајлове (фотографије, видео записе, документе), Hash користи додатно AES-256-GCM шифровање. Фајл је шифрован пре него што напусти твој телефон.';

  @override
  String get secLayer2Title => 'Sealed Sender (мрежна анонимност)';

  @override
  String get secLayer2Desc =>
      'Обични месенџери шаљу твоје поруке са твојим идентитетом. Као да пишеш своје име на коверти. Hash користи анонимна поштанска сандучад: сервер испоручује поруку не знајући ко ју је послао.';

  @override
  String get secLayer2Detail =>
      'Резултат: чак и у случају пробоја података сервера, немогуће је реконструисати ко разговара са ким.';

  @override
  String get secLayer3Title => 'Аутоматско брисање';

  @override
  String get secLayer3Desc =>
      'Поруке се бришу са сервера чим се потврди пријем. Чак и ако порука никада није преузета, аутоматски се уништава после 24 сата.';

  @override
  String get secLayer3Detail =>
      'На твом телефону, поруке се самоуништавају према трајању које изабереш: одмах, 5 мин, 15 мин, 30 мин, 1ч, 3ч, 6ч или 12ч.';

  @override
  String get secLayer4Title => 'Заштита локалног приступа';

  @override
  String get secLayer4Desc =>
      'Апликација је заштићена шестоцифреним PIN кодом и/или биометријом (Face ID, отисак прста). После превише неуспешних покушаја, апликација се закључава са растућим одлагањем после сваког неуспеха.';

  @override
  String get secLayer5Title => 'Закључана база података';

  @override
  String get secLayer5Desc =>
      'На страни сервера, ниједан корисник не може директно писати у базу података. Све акције пролазе кроз безбедне функције које проверавају сваки захтев.';

  @override
  String get secLayer5Detail =>
      'Као шалтер у банци: никада не додирујеш сеф лично. Подносиш захтев, а систем проверава да ли имаш право пре него што поступи.';

  @override
  String get secVashLabel => 'ЈЕДИНСТВЕНО У СВЕТУ';

  @override
  String get secVashTitle => 'Vash режим';

  @override
  String get secVashSubtitle =>
      'Хитни безбедносни систем који не постоји ни у једној другој апликацији за размену порука.';

  @override
  String get secVashScenarioTitle => 'Замисли ову ситуацију';

  @override
  String get secVashScenario1 => 'Неко приступа твом телефону';

  @override
  String get secVashScenario2 => 'Траже ти PIN код';

  @override
  String get secVashScenario3 => 'Желиш хитно да обришеш све своје податке';

  @override
  String get secVashSolutionTitle => 'Решење: два PIN кода';

  @override
  String get secVashSolutionDesc =>
      'Подешаваш два различита PIN кода у Hash-у:';

  @override
  String get secVashNormalCodeLabel => 'Нормалан код';

  @override
  String get secVashNormalCodeDesc =>
      'Отвара апликацију нормално са свим твојим подацима';

  @override
  String get secVashCodeLabel2 => 'Vash код';

  @override
  String get secVashCodeDescription =>
      'Отвара апликацију нормално... али сви твоји подаци се тихо бришу у позадини';

  @override
  String get secVashWhatHappensTitle => 'Шта се дешава затим';

  @override
  String get secVashWhatHappensDesc =>
      'Апликација се отвара нормално. Нема упозорења, нема сумњиве анимације. Екран једноставно приказује празну апликацију, као да си је управо инсталирао.\n\nУ стварности, сви твоји разговори, контакти и поруке су неповратно обрисани за делић секунде.';

  @override
  String get secCallsLabel => 'ПОЗИВИ & ФАЈЛОВИ';

  @override
  String get secCallsTitle => 'Све је шифровано';

  @override
  String get secCallsSubtitle =>
      'Нису само поруке. Апсолутно све што пролази кроз Hash је шифровано с краја на крај.';

  @override
  String get secAudioCallTitle => 'Аудио позиви';

  @override
  String get secAudioCallDesc =>
      'Шифровани с краја на крај преко WebRTC. Глас се преноси директно између уређаја.';

  @override
  String get secVideoCallTitle => 'Видео позиви';

  @override
  String get secVideoCallDesc =>
      'Иста технологија, сваки ток шифрован појединачно.';

  @override
  String get secPhotosTitle => 'Фотографије & видео записи';

  @override
  String get secPhotosDesc =>
      'Шифровани у AES-256-GCM пре него што напусте твој телефон.';

  @override
  String get secDocsTitle => 'Документи';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, било који фајл. Име, величина и садржај шифровани.';

  @override
  String get secAnonLabel => 'АНОНИМНОСТ';

  @override
  String get secAnonTitle => 'Није потребан идентитет';

  @override
  String get secAnonSubtitle =>
      'Hash никада не тражи твој број телефона или имејл. Идентификован си јединственим и анонимним Hash ID-ем.';

  @override
  String get secHashIdTitle => 'Твој Hash ID';

  @override
  String get secHashIdDesc =>
      'Ово је твој јединствени идентификатор. Не открива ништа о теби: ни твоје име, ни твој број, ни твоју локацију. Као псеудоним који је немогуће повезати са твојим правим идентитетом.\n\nДа додаш контакт, делиш свој Hash ID или скенираш QR код. То је све. Нема синхронизованог именика, нема сугестија \"Људи које можда познајеш\".';

  @override
  String get secDataLabel => 'ПОДАЦИ';

  @override
  String get secDataTitle => 'Шта Hash не зна';

  @override
  String get secDataSubtitle =>
      'Најбољи начин да заштитиш своје податке је да их не прикупљаш.';

  @override
  String get secNeverCollected => 'Никада прикупљено';

  @override
  String get secNeverItem1 => 'Садржај порука';

  @override
  String get secNeverItem2 => 'Листа контаката';

  @override
  String get secNeverItem3 => 'Број телефона';

  @override
  String get secNeverItem4 => 'Имејл адреса';

  @override
  String get secNeverItem5 => 'IP адреса';

  @override
  String get secNeverItem6 => 'Локација';

  @override
  String get secNeverItem7 => 'Метаподаци (ко разговара са ким)';

  @override
  String get secNeverItem8 => 'Историја позива';

  @override
  String get secNeverItem9 => 'Именик';

  @override
  String get secNeverItem10 => 'Рекламни идентификатори';

  @override
  String get secTempStored => 'Привремено сачувано';

  @override
  String get secTempItem1 => 'Анониман Hash ID (јединствени идентификатор)';

  @override
  String get secTempItem2 => 'Јавни кључеви за шифровање';

  @override
  String get secTempItem3 => 'Шифроване поруке у транзиту (макс 24ч)';

  @override
  String get secTempNote =>
      'Чак ни ови минимални подаци не могу те идентификовати. Твој Hash ID није повезан ни са једном личном информацијом.';

  @override
  String get secFooterTitle => 'Твоја приватност, твоја слобода';

  @override
  String get secFooterDesc =>
      'Hash користи исте технологије шифровања као најзахтевније професионалне апликације. Твоје поруке су заштићене математиком, а не обећањима.';

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
