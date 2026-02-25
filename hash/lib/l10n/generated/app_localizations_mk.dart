// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Без трага. Без компромис.';

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
  String get conversations => 'Разговори';

  @override
  String get contacts => 'Контакти';

  @override
  String get noConversation => 'Нема разговори';

  @override
  String get noConversationSubtitle =>
      'Додајте контакт за да започнете безбедно разговарање';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count барања на чекање',
      one: '1 барање на чекање',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count испратени барања чекаат',
      one: '1 испратено барање чека',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Додај контакт';

  @override
  String get shareApp => 'Сподели апликација';

  @override
  String get newMessage => 'Нова порака';

  @override
  String get newConversation => 'Испрати порака';

  @override
  String get settings => 'Поставки';

  @override
  String get myHashId => 'Мој Hash ID';

  @override
  String get supportHash => 'Поддржи Hash';

  @override
  String get supportHashSubtitle => 'Hash е непрофитен проект';

  @override
  String get donate => 'Донирај';

  @override
  String get appearance => 'Изглед';

  @override
  String get theme => 'Тема';

  @override
  String get themeAuto => 'Автоматски';

  @override
  String get themeAutoSubtitle => 'Ги следи системските поставки';

  @override
  String get themeDark => 'Темна';

  @override
  String get themeLight => 'Светла';

  @override
  String get themeRecommendation =>
      'Темната тема е препорачана за подобра приватност';

  @override
  String get language => 'Јазик';

  @override
  String get languageAuto => 'Автоматски (систем)';

  @override
  String get notifications => 'Известувања';

  @override
  String get messages => 'Пораки';

  @override
  String get calls => 'Повици';

  @override
  String get vibration => 'Вибрација';

  @override
  String get notificationContent => 'Содржина на известување';

  @override
  String get notificationContentFull => 'Прикажи сè';

  @override
  String get notificationContentFullDesc =>
      'Име на контактот и преглед на пораката';

  @override
  String get notificationContentName => 'Само име';

  @override
  String get notificationContentNameDesc => 'Прикажува само име на контактот';

  @override
  String get notificationContentDiscrete => 'Дискретно';

  @override
  String get notificationContentDiscreteDesc =>
      'Прикажува само \"Нова порака\"';

  @override
  String get security => 'Безбедност';

  @override
  String get howHashProtectsYou => 'Како Hash ве штити';

  @override
  String get howHashProtectsYouSubtitle => 'Разберете ја вашата безбедност';

  @override
  String get accountSecurity => 'Безбедност на сметка';

  @override
  String get accountSecuritySubtitle => 'PIN, биометрија, Vash режим';

  @override
  String get blockScreenshots => 'Блокирај снимки на екран';

  @override
  String get transferDevice => 'Пренеси на друг уред';

  @override
  String get transferDeviceSubtitle => 'Мигрирај ја сметката';

  @override
  String get pinCode => 'PIN код';

  @override
  String get changePin => 'Промени PIN код';

  @override
  String get currentPin => 'Тековен PIN код';

  @override
  String get newPin => 'Нов PIN код';

  @override
  String get confirmPin => 'Потврди PIN код';

  @override
  String get pinChanged => 'PIN кодот е променет';

  @override
  String get incorrectPin => 'Неточен PIN';

  @override
  String get pinsDoNotMatch => 'PIN кодовите не се совпаѓаат';

  @override
  String get autoLock => 'Автоматско заклучување';

  @override
  String get autoLockDelay => 'Одложување на заклучување';

  @override
  String get autoLockImmediate => 'Веднаш';

  @override
  String get autoLockMinute => '1 минута';

  @override
  String autoLockMinutes(int count) {
    return '$count минути';
  }

  @override
  String get vashCode => 'Vash код';

  @override
  String get vashModeTitle => 'Vash режим';

  @override
  String get vashModeExplanation => 'Вашата крајна мрежа за безбедност.';

  @override
  String get vashModeDescription =>
      'Ќе изберете втор PIN код. Ако некогаш бидете принудени да го отворите Hash, внесете го овој код наместо вашиот редовен PIN.\n\nАпликацијата ќе се отвори нормално, но сите ваши разговори и контакти ќе исчезнат.\n\nЗа секој кој гледа во вашиот екран, Hash едноставно изгледа празен — како никогаш да не сте го користеле.';

  @override
  String get vashModeIrreversible => 'Оваа акција е тивка и неповратна.';

  @override
  String get chooseVashCode => 'Избери Vash код';

  @override
  String get vashCodeInfo =>
      'Втор PIN код што ја отвора апликацијата нормално, но празна.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Ако го внесете овој код наместо вашиот PIN:';

  @override
  String get vashDeleteContacts => 'Вашите контакти исчезнуваат';

  @override
  String get vashDeleteMessages => 'Вашите разговори исчезнуваат';

  @override
  String get vashDeleteHistory => 'Вашите белешки исчезнуваат';

  @override
  String get vashKeepId => 'Вашиот Hash идентитет (#XXX-XXX-XXX) останува ист';

  @override
  String get vashAppearNormal =>
      'Апликацијата изгледа нормално но празна, како нова. Оваа акција е неповратна.';

  @override
  String get setupVashCode => 'Постави Vash код';

  @override
  String get modifyVashCode => 'Измени Vash код';

  @override
  String get currentVashCode => 'Тековен Vash код';

  @override
  String get newVashCode => 'Нов Vash код';

  @override
  String get confirmVashCode => 'Потврди Vash код';

  @override
  String get vashCodeConfigured => 'Vash кодот е конфигуриран';

  @override
  String get vashCodeModified => 'Vash кодот е изменет';

  @override
  String get vashCodeMustDiffer => 'Vash кодот мора да се разликува од PIN';

  @override
  String get incorrectVashCode => 'Неточен Vash код';

  @override
  String get vashWhatToDelete =>
      'Што треба Vash режимот да направи да исчезне?';

  @override
  String get vashDeleteContactsOption => 'Контакти';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Пораки';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Белешки';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash режимот е активиран';

  @override
  String get vashCreateSubtitle => 'Изберете код различен од вашиот главен PIN';

  @override
  String get vashConfirmSubtitle => 'Потврдете го вашиот Vash код';

  @override
  String get pinCodeForEntry => 'PIN код за влез во апликацијата';

  @override
  String get vashCodeSection => 'Vash режим';

  @override
  String get biometric => 'Биометрија';

  @override
  String get biometricUnlock => 'Отклучи со отпечаток или Face ID';

  @override
  String get enableBiometric => 'Овозможи биометрија';

  @override
  String get biometricWarningMessage =>
      'Со овозможување на биометрија, нема да можете да го користите вашиот PIN. Дали сте сигурни?';

  @override
  String get understood => 'Разбрав';

  @override
  String get shareAppSubtitle => 'Споделете Hash со вашите блиски';

  @override
  String get share => 'Сподели';

  @override
  String get danger => 'Опасност';

  @override
  String get deleteAccount => 'Избриши ја мојата сметка';

  @override
  String get deleteAccountSubtitle => 'Неповратна акција';

  @override
  String get deleteAccountConfirmTitle => 'Избриши ја мојата сметка';

  @override
  String get deleteAccountConfirmMessage =>
      'Вашата сметка ќе биде трајно избришана. Оваа акција е неповратна.\n\n• Сите ваши разговори\n• Сите ваши контакти\n• Вашиот Hash ID\n\nЌе треба да креирате нова сметка.';

  @override
  String get deleteForever => 'Избриши трајно';

  @override
  String get cancel => 'Откажи';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash режимот е активиран.';

  @override
  String deletionError(String error) {
    return 'Грешка при бришење: $error';
  }

  @override
  String get yourSecurity => 'Вашата безбедност';

  @override
  String get securityInfo =>
      '• Целосна енкрипција (Signal Protocol)\n• Нема податоци на нашите сервери по испорака\n• Клучевите се чуваат само на вашиот уред\n• PIN кодот никогаш не се испраќа на сервер';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Добредојдовте';

  @override
  String get securityStatement1 => 'Вашите пораки се заштитени.';

  @override
  String get securityStatement2 => 'Целосна енкрипција.';

  @override
  String get securityStatement3 => 'Без трага. Без компромис.';

  @override
  String get securityStatement4 => 'Вашата приватност е право.';

  @override
  String get accessBlocked => 'Пристапот е блокиран';

  @override
  String get tooManyAttempts => 'Премногу обиди. Обидете се подоцна.';

  @override
  String get pleaseWait => 'Ве молиме почекајте';

  @override
  String get waitDelay => 'Ве молиме почекајте да заврши одложувањето';

  @override
  String attemptCount(int current, int max) {
    return 'Обид $current од $max';
  }

  @override
  String retryIn(String time) {
    return 'Обидете се повторно за $time';
  }

  @override
  String get forgotPin => 'Заборавивте PIN? Користете фраза за обновување';

  @override
  String get useRecoveryPhrase => 'Користи фраза за обновување';

  @override
  String get recoveryWarningTitle => 'Предупредување';

  @override
  String get recoveryWarningMessage => 'Обновувањето на сметката ќе:';

  @override
  String get recoveryDeleteAllMessages => 'Избрише СИТЕ ваши пораки';

  @override
  String get recoveryWaitDelay => 'Бара чекање од 1 час';

  @override
  String get recoveryKeepContacts => 'Ги задржи вашите контакти';

  @override
  String get recoveryIrreversible =>
      'Оваа акција е неповратна. Вашите пораки ќе бидат трајно изгубени.';

  @override
  String get iUnderstand => 'Разбирам';

  @override
  String get accountRecovery => 'Обновување на сметка';

  @override
  String get enterRecoveryPhrase =>
      'Внесете ги 24-те зборови од вашата фраза за обновување, одделени со празни места.';

  @override
  String get recoveryPhraseHint => 'збор1 збор2 збор3 ...';

  @override
  String get recover => 'Обнови';

  @override
  String get recoveryPhraseRequired =>
      'Ве молиме внесете ја вашата фраза за обновување';

  @override
  String get recoveryPhrase24Words => 'Фразата мора да содржи точно 24 збора';

  @override
  String get incorrectRecoveryPhrase => 'Неточна фраза за обновување';

  @override
  String get recoveryInitError => 'Грешка при иницијализација на обновувањето';

  @override
  String get securityDelay => 'Безбедносно одложување';

  @override
  String get securityDelayMessage =>
      'За вашата безбедност, потребен е период на чекање пред да можете да креирате нов PIN.';

  @override
  String get timeRemaining => 'Преостанато време';

  @override
  String get messagesDeletedForProtection =>
      'Вашите пораки се избришани за ваша заштита.';

  @override
  String get canCloseApp =>
      'Можете да ја затворите апликацијата и да се вратите подоцна.';

  @override
  String get onboardingTitle1 => 'Добредојдовте во Hash';

  @override
  String get onboardingSubtitle1 => 'Месинџерот што не остава трага';

  @override
  String get onboardingTitle2 => 'Целосна енкрипција';

  @override
  String get onboardingSubtitle2 =>
      'Вашите пораки се целосно енкриптирани со Signal Protocol';

  @override
  String get onboardingTitle3 => 'Без трага';

  @override
  String get onboardingSubtitle3 =>
      'Пораките се бришат од серверите по испорака';

  @override
  String get onboardingTitle4 => 'Вашата безбедност';

  @override
  String get onboardingSubtitle4 => 'PIN код, Vash режим и фраза за обновување';

  @override
  String get getStarted => 'Започни';

  @override
  String get next => 'Следно';

  @override
  String get skip => 'Прескокни';

  @override
  String get alreadyHaveAccount => 'Веќе имам сметка';

  @override
  String get transferMyAccount => 'Пренеси ја мојата сметка';

  @override
  String get createPin => 'Креирај PIN код';

  @override
  String get createPinSubtitle =>
      'Овој код ќе го заштити пристапот до вашата апликација';

  @override
  String get confirmYourPin => 'Потврдете го вашиот PIN код';

  @override
  String get confirmPinSubtitle => 'Внесете го вашиот PIN код повторно';

  @override
  String get saveRecoveryPhrase => 'Фраза за обновување';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Запишете ги овие 24 збора по ред. Тие ќе ви овозможат да ја обновите сметката ако го заборавите PIN.';

  @override
  String get phraseWritten => 'Ја запишав мојата фраза';

  @override
  String get warningRecoveryPhrase =>
      'Ако ја изгубите оваа фраза и го заборавите PIN, ќе го изгубите пристапот до вашата сметка.';

  @override
  String get accountTransferred => 'Сметката е пренесена';

  @override
  String get accountTransferredMessage =>
      'Вашата сметка е пренесена на друг уред. Оваа сесија повеќе не е валидна.';

  @override
  String get accountTransferredInfo =>
      'Ако не сте го иницирале овој пренос, вашата сметка можеби е компромитирана.';

  @override
  String get logout => 'Одјави се';

  @override
  String get transferAccount => 'Пренеси сметка';

  @override
  String get transferAccountInfo =>
      'Пренесете ја вашата Hash сметка на нов уред. Вашата тековна сесија ќе биде поништена.';

  @override
  String get generateTransferCode => 'Генерирај код за пренос';

  @override
  String get transferCode => 'Код за пренос';

  @override
  String transferCodeExpires(int minutes) {
    return 'Овој код истекува за $minutes минути';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Внесете го овој код на вашиот нов уред за да ја пренесете сметката.';

  @override
  String get generateNewCode => 'Генерирај нов код';

  @override
  String get scanQrCode => 'Скенирај QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Скенирајте го QR code на контактот за да го додадете';

  @override
  String get qrCodeDetected => 'QR code е детектиран';

  @override
  String get invalidQrCode => 'Невалиден QR code';

  @override
  String get cameraPermissionRequired => 'Потребна е дозвола за камера';

  @override
  String get myQrCode => 'Мој QR code';

  @override
  String get myQrCodeSubtitle =>
      'Споделете го овој QR code за вашите контакти да ве додадат';

  @override
  String get shareQrCode => 'Сподели';

  @override
  String get addContactTitle => 'Додај контакт';

  @override
  String get addContactByHashId => 'Внесете го Hash ID на вашиот контакт';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Барај';

  @override
  String get contactNotFound => 'Контактот не е пронајден';

  @override
  String get contactAlreadyAdded => 'Овој контакт е веќе во вашата листа';

  @override
  String get contactAdded => 'Контактот е додаден';

  @override
  String get myProfile => 'Мој профил';

  @override
  String get myProfileSubtitle =>
      'Споделете ги овие информации за другите да ве додадат';

  @override
  String get temporaryCode => 'Привремен код';

  @override
  String temporaryCodeExpires(String time) {
    return 'Истекува за $time';
  }

  @override
  String get codeExpired => 'Кодот истече';

  @override
  String get generateNewCodeButton => 'Нов код';

  @override
  String get copyHashId => 'Копирај ID';

  @override
  String get copyCode => 'Копирај код';

  @override
  String get copiedToClipboard => 'Копирано';

  @override
  String get showMyQrCode => 'Прикажи мој QR code';

  @override
  String get orDivider => 'или';

  @override
  String get openScanner => 'Отвори скенер';

  @override
  String get addManually => 'Додај рачно';

  @override
  String get contactHashIdLabel => 'Hash ID на контактот';

  @override
  String get temporaryCodeLabel => 'Привремен код';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Побарајте од контактот да генерира код од својот профил';

  @override
  String get verifyAndAdd => 'Потврди и додај';

  @override
  String get fillAllFields => 'Ве молиме пополнете ги сите полиња';

  @override
  String get invalidHashIdFormat => 'Невалиден формат на ID (пр.: 123-456-ABC)';

  @override
  String get userNotFound => 'Корисникот не е пронајден';

  @override
  String get cannotAddYourself => 'Не можете да се додадете себеси';

  @override
  String get invalidOrExpiredCode => 'Невалиден или истечен привремен код';

  @override
  String get contactFound => 'Контактот е пронајден!';

  @override
  String get howToCallContact => 'Како сакате да го нарекувате?';

  @override
  String get contactNameHint => 'Име на контакт';

  @override
  String get addContactButton => 'Додај';

  @override
  String get contactDetails => 'Детали за контакт';

  @override
  String get contactName => 'Име на контакт';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Додаден на $date';
  }

  @override
  String get deleteContact => 'Избриши контакт';

  @override
  String deleteContactConfirm(Object name) {
    return 'Избриши го овој контакт?';
  }

  @override
  String get deleteContactMessage => 'Ова исто ќе го избрише целиот разговор.';

  @override
  String get delete => 'Избриши';

  @override
  String get typeMessage => 'Напишете порака...';

  @override
  String get messageSent => 'Испратена';

  @override
  String get messageDelivered => 'Доставена';

  @override
  String get messageRead => 'Прочитана';

  @override
  String get messageFailed => 'Испраќањето не успеа';

  @override
  String get now => 'Сега';

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
  String get today => 'Денес';

  @override
  String get yesterday => 'Вчера';

  @override
  String dateAtTime(String date, String time) {
    return '$date во $time';
  }

  @override
  String get shareMessage =>
      'Придружи ми се на Hash! 🔒\n\nТоа е навистина приватен месинџер: целосна енкрипција, без трага на сервери и паник режим кога е потребно.\n\nПреземи ја апликацијата тука 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Грешка';

  @override
  String get ok => 'ОК';

  @override
  String get view => 'Прикажи';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Не';

  @override
  String get save => 'Зачувај';

  @override
  String get edit => 'Уреди';

  @override
  String get close => 'Затвори';

  @override
  String get confirm => 'Потврди';

  @override
  String get loading => 'Се вчитува...';

  @override
  String get retry => 'Обиди се повторно';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Барања на чекање';

  @override
  String get noPendingRequests => 'Нема барања на чекање';

  @override
  String get pendingRequestsSubtitle => 'Овие луѓе сакаат да ве додадат';

  @override
  String requestFromUser(String hashId) {
    return 'Барање од $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Истекува за $days дена';
  }

  @override
  String get acceptRequest => 'Прифати';

  @override
  String get rejectRequest => 'Одбиј';

  @override
  String get requestAccepted => 'Барањето е прифатено';

  @override
  String get requestRejected => 'Барањето е одбиено';

  @override
  String get requestSent => 'Барањето е испратено!';

  @override
  String get requestSentSubtitle =>
      'Вашето барање е испратено. Корисникот мора да го прифати пред да можете да разговарате.';

  @override
  String get requestAlreadyPending => 'Барањето веќе чека';

  @override
  String get requestAlreadySentByOther =>
      'Оваа личност веќе ви испратила барање';

  @override
  String get addByHashId => 'Додај по Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Внесете го Hash ID и привремениот код на контактот';

  @override
  String get enterTemporaryCode => 'Внесете го 6-цифрениот код';

  @override
  String get sendRequest => 'Испрати барање';

  @override
  String get acceptContactTitle => 'Прифати контакт';

  @override
  String get acceptContactSubtitle => 'Можете да дадете прилагодено име';

  @override
  String get leaveEmptyForHashId => 'Оставете празно за да користите Hash ID';

  @override
  String get firstName => 'Име';

  @override
  String get lastName => 'Презиме';

  @override
  String get notes => 'Белешки';

  @override
  String get notesHint => 'Лични белешки за овој контакт';

  @override
  String get photoOptional => 'Фото (опционално)';

  @override
  String get contactNameOptional => 'Име (опционално)';

  @override
  String get notesOptional => 'Белешки (опционално)';

  @override
  String get storedLocally => 'Зачувано само на вашиот уред';

  @override
  String get encryptedMessageLabel => 'Енкриптирана порака';

  @override
  String get identityMessageHint => 'Кој сте вие? Како се познавате?';

  @override
  String get messageWillBeSentEncrypted =>
      'Оваа порака ќе биде енкриптирана и испратена до примачот';

  @override
  String get sendRequestButton => 'Испрати барање';

  @override
  String get requestExpiresIn24h =>
      'Барањето истекува за 24ч ако не биде прифатено';

  @override
  String get theyAlreadySentYouRequest =>
      'Оваа личност веќе ви испратила барање';

  @override
  String get requests => 'Барања';

  @override
  String get receivedRequests => 'Примени';

  @override
  String get sentRequests => 'Испратени';

  @override
  String get noSentRequests => 'Нема испратени барања';

  @override
  String get cancelRequest => 'Откажи';

  @override
  String get deleteRequest => 'Избриши барање';

  @override
  String get requestCancelled => 'Барањето е откажано';

  @override
  String sentTo(String hashId) {
    return 'Испратено до $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Истекува за $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Примено пред $time';
  }

  @override
  String get messageFromRequester => 'Порака од барателот';

  @override
  String get copy => 'Копирај';

  @override
  String get messageInfo => 'Информации за порака';

  @override
  String get messageDirection => 'Насока';

  @override
  String get messageSentByYou => 'Испратена од вас';

  @override
  String get messageReceived => 'Примена';

  @override
  String get messageSentAt => 'Испратена во';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Статус';

  @override
  String get messageReadAt => 'Прочитана во';

  @override
  String get messageType => 'Тип';

  @override
  String get messageSize => 'Големина';

  @override
  String get messageExpiresAt => 'Истекува во';

  @override
  String get messageEncrypted => 'Целосна енкрипција';

  @override
  String get messageStatusSending => 'Се испраќа...';

  @override
  String get messageStatusSent => 'Испратена';

  @override
  String get messageStatusDelivered => 'Доставена';

  @override
  String get messageStatusRead => 'Прочитана';

  @override
  String get messageStatusFailed => 'Неуспешна';

  @override
  String get serverStatus => 'Сервер';

  @override
  String get onServer => 'Чека испорака';

  @override
  String get deletedFromServer => 'Избришана';

  @override
  String get messageTypeText => 'Текст';

  @override
  String get messageTypeImage => 'Слика';

  @override
  String get messageTypeVideo => 'Видео';

  @override
  String get messageTypeVoice => 'Глас';

  @override
  String get messageTypeFile => 'Датотека';

  @override
  String get indefinitely => 'Неограничено';

  @override
  String get hoursShort => 'ч';

  @override
  String get minutesShort => 'мин';

  @override
  String get hours => 'часови';

  @override
  String get minutes => 'минути';

  @override
  String get seconds => 'секунди';

  @override
  String get ephemeralMessages => 'Ефемерни пораки';

  @override
  String get ephemeralMessagesDescription =>
      'Пораките автоматски се бришат после ова време';

  @override
  String get ephemeralImmediate => 'Веднаш (по читање)';

  @override
  String get ephemeralImmediateDesc => 'Се бриши штом се прочита';

  @override
  String get ephemeralMyPreference => 'Моја преференција';

  @override
  String get ephemeralMyPreferenceDesc => 'Користи глобална поставка';

  @override
  String get ephemeralDefaultSetting => 'Траење на пораки';

  @override
  String get ephemeralChooseDefault => 'Препорачано';

  @override
  String get ephemeral30Seconds => '30 секунди';

  @override
  String get ephemeral30SecondsDesc => 'Избришано 30с по читање';

  @override
  String get ephemeral5Minutes => '5 минути';

  @override
  String get ephemeral5MinutesDesc => 'Избришано 5мин по читање';

  @override
  String get ephemeral1Hour => '1 час';

  @override
  String get ephemeral1HourDesc => 'Избришано 1ч по читање';

  @override
  String get ephemeral3Hours => '3 часа';

  @override
  String get ephemeral6Hours => '6 часа';

  @override
  String get ephemeral6HoursDesc => 'Избришано 6ч по читање';

  @override
  String get ephemeral12Hours => '12 часа';

  @override
  String get ephemeral24Hours => '24 часа';

  @override
  String get ephemeral24HoursDesc => 'Избришано 24ч по читање';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Прилагодено траење';

  @override
  String get howItWorks => 'Како функционира';

  @override
  String get ephemeralExplanation1 =>
      'Пораките се бришат од серверот штом се примат.';

  @override
  String get ephemeralExplanation2 =>
      'Оваа поставка одредува кога пораките исчезнуваат од ВАШИОТ телефон по читање.';

  @override
  String get ephemeralExplanation3 =>
      'Вашиот контакт има своја поставка за својот телефон.';

  @override
  String get mute1Hour => '1 час';

  @override
  String get mute8Hours => '8 часа';

  @override
  String get mute1Day => '1 ден';

  @override
  String get mute1Week => '1 недела';

  @override
  String get muteAlways => 'Секогаш';

  @override
  String get muteExplanation => 'Нема да добивате известувања за овој контакт';

  @override
  String get showCallsInRecents => 'Прикажи во скорешни повици';

  @override
  String get showCallsInRecentsSubtitle =>
      'Повиците на Hash се прикажуваат во историјата на телефонот';

  @override
  String get feedback => 'Повратни информации';

  @override
  String get muteNotifications => 'Исклучи известувања';

  @override
  String get muteDescription => 'Нема да добивате известувања за овој контакт';

  @override
  String mutedUntil(String time) {
    return 'Исклучено до $time';
  }

  @override
  String get notMuted => 'Известувањата се вклучени';

  @override
  String get unmute => 'Вклучи звук';

  @override
  String get notificationSound => 'Звук на известување';

  @override
  String get defaultSound => 'Стандарден';

  @override
  String get chatSettings => 'Поставки на разговор';

  @override
  String get bubbleColor => 'Боја на балонче';

  @override
  String get backgroundColor => 'Боја на позадина';

  @override
  String get backgroundImage => 'Позадинска слика';

  @override
  String get chatBackground => 'Позадина на разговор';

  @override
  String get customColor => 'Прилагодена';

  @override
  String get defaultColor => 'Стандардна';

  @override
  String get imageSelected => 'Сликата е избрана';

  @override
  String get noImage => 'Нема слика';

  @override
  String get color => 'Боја';

  @override
  String get image => 'Слика';

  @override
  String get tapToSelectImage => 'Допрете за да изберете слика';

  @override
  String get changeImage => 'Промени слика';

  @override
  String get previewMessageReceived => 'Здраво!';

  @override
  String get previewMessageSent => 'Ej!';

  @override
  String get messageAction => 'Порака';

  @override
  String get callAction => 'Повик';

  @override
  String get videoAction => 'Видео';

  @override
  String get personalNotes => 'Лични белешки';

  @override
  String get addNotes => 'Додај белешки...';

  @override
  String get noNotes => 'Нема белешки';

  @override
  String get messageNotifications => 'Известувања за пораки';

  @override
  String get callNotifications => 'Известувања за повици';

  @override
  String get useGradient => 'Користи градиент';

  @override
  String get gradientStart => 'Почетна боја';

  @override
  String get gradientEnd => 'Крајна боја';

  @override
  String get preview => 'Преглед';

  @override
  String get reset => 'Ресетирај';

  @override
  String get securityNumber => 'Безбедносен број';

  @override
  String securityNumberDescription(String name) {
    return 'Потврдете дека безбедносниот број се совпаѓа со уредот на $name';
  }

  @override
  String get verifyEncryption => 'Потврди целосна енкрипција';

  @override
  String get tapToCopy => 'Допрете за копирање';

  @override
  String get howToVerify => 'Како да потврдите';

  @override
  String get verifyStep1 => 'Сретнете се со контактот лично или позвонете им';

  @override
  String get verifyStep2 =>
      'Споредете ги безбедносните броеви или скенирајте QR code';

  @override
  String get verifyStep3 => 'Ако се совпаѓаат, вашиот разговор е безбеден';

  @override
  String get scanToVerify => 'Скенирај за потврда';

  @override
  String get reportSpam => 'Пријави спам';

  @override
  String get reportSpamSubtitle => 'Пријави го овој контакт како спам';

  @override
  String get reportSpamDescription =>
      'Ова анонимно ќе го пријави овој контакт. Вашиот идентитет нема да биде споделен. Дали сте сигурни?';

  @override
  String get report => 'Пријави';

  @override
  String get spamReported => 'Спамот е пријавен';

  @override
  String get reportError =>
      'Испраќањето на пријавата не успеа. Ве молиме обидете се повторно.';

  @override
  String get reportRateLimited =>
      'Го достигнавте максималниот број пријави за денес.';

  @override
  String get blockContact => 'Блокирај контакт';

  @override
  String get blockContactDescription =>
      'Овој контакт повеќе нема да може да ви испраќа пораки или да ви се јавува. Нема да бидат известени.';

  @override
  String get unblockContact => 'Одблокирај контакт';

  @override
  String get unblockContactDescription =>
      'Овој контакт повторно ќе може да ви испраќа пораки и да ви се јавува.';

  @override
  String get contactBlocked => 'Контактот е блокиран';

  @override
  String get contactUnblocked => 'Контактот е одблокиран';

  @override
  String get contactIsBlocked => 'Овој контакт е блокиран';

  @override
  String get unblock => 'Одблокирај';

  @override
  String get deleteContactSubtitle => 'Избриши го овој контакт и разговор';

  @override
  String get confirmWithPin => 'Потврди со PIN';

  @override
  String get enterPinToConfirm =>
      'Внесете го вашиот PIN за да ја потврдите оваа акција';

  @override
  String get profilePhoto => 'Профилна фотографија';

  @override
  String get takePhoto => 'Направи фотографија';

  @override
  String get chooseFromGallery => 'Избери од галерија';

  @override
  String get removePhoto => 'Отстрани фотографија';

  @override
  String get viewContactHashId => 'Прикажи го идентификаторот на контактот';

  @override
  String get hashIdPartiallyMasked =>
      'Делумно маскиран за вашата безбедност и приватноста на контактот';

  @override
  String get addFirstContact => 'Додајте го вашиот прв контакт';

  @override
  String get addFirstContactSubtitle =>
      'Споделете го вашиот QR code или скенирајте го QR code на пријател';

  @override
  String get directory => 'Именик';

  @override
  String get noContacts => 'Нема контакти';

  @override
  String get noContactsSubtitle => 'Додајте контакт за да започнете';

  @override
  String get sendMessageAction => 'Испрати порака';

  @override
  String get audioCall => 'Аудио повик';

  @override
  String get videoCall => 'Видео повик';

  @override
  String get viewProfile => 'Прикажи профил';

  @override
  String get deleteContactDirectory => 'Избриши контакт';

  @override
  String get scanShort => 'Скенирај';

  @override
  String get addShort => 'Додај';

  @override
  String deleteContactConfirmName(String name) {
    return 'Дали сте сигурни дека сакате да го избришете $name?';
  }

  @override
  String get noNotesTitle => 'Нема белешки';

  @override
  String get noNotesSubtitle => 'Креирајте ја вашата прва белешка';

  @override
  String get newNote => 'Нова белешка';

  @override
  String get editNote => 'Уреди белешка';

  @override
  String get deleteNote => 'Избриши белешка';

  @override
  String get deleteNoteConfirm =>
      'Дали сте сигурни дека сакате да ја избришете оваа белешка?';

  @override
  String get noteTitle => 'Наслов';

  @override
  String get noteContent => 'Содржина';

  @override
  String get addItem => 'Додај ставка';

  @override
  String get pinNote => 'Закачи';

  @override
  String get unpinNote => 'Откачи';

  @override
  String get noteColor => 'Боја';

  @override
  String get notePassword => 'Лозинка';

  @override
  String get setPassword => 'Постави лозинка';

  @override
  String get changePassword => 'Промени лозинка';

  @override
  String get removePassword => 'Отстрани лозинка';

  @override
  String get enterPassword => 'Внесете лозинка';

  @override
  String get confirmPassword => 'Потврди лозинка';

  @override
  String get passwordPin => 'PIN код';

  @override
  String get passwordText => 'Текстуална лозинка';

  @override
  String get protectedNote => 'Заштитена белешка';

  @override
  String get incorrectPassword => 'Неточна лозинка';

  @override
  String get passwordSet => 'Лозинката е поставена';

  @override
  String get passwordRemoved => 'Лозинката е отстранета';

  @override
  String get notesBiometric => 'Face ID за белешки';

  @override
  String get notesBiometricSubtitle =>
      'Барај биометриска автентикација за отворање заштитени белешки';

  @override
  String get textNote => 'Текстуална белешка';

  @override
  String get checklistNote => 'Листа за проверка';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total задачи';
  }

  @override
  String get autoSaved => 'Зачувано';

  @override
  String get searchNotes => 'Барај белешки';

  @override
  String get legalConsent => 'Правна согласност';

  @override
  String get confirmAge13 => 'Потврдувам дека имам најмалку 13 години';

  @override
  String get acceptLegalStart => 'Ги прифаќам ';

  @override
  String get privacyPolicy => 'Политиката за приватност';

  @override
  String get termsOfService => 'Условите за користење';

  @override
  String get andThe => ' и ';

  @override
  String get continueButton => 'Продолжи';

  @override
  String get mustAcceptTerms =>
      'Мора да ги прифатите двата услови за да продолжите';

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
  String get support => 'Поддршка';

  @override
  String get contactSupport => 'Контактирај поддршка';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Пријави злоупотреба';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Правно';

  @override
  String get legalEntity => 'Правен ентитет';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Закачи';

  @override
  String get unpinConversation => 'Откачи';

  @override
  String get hideConversation => 'Отстрани од фидот';

  @override
  String get deleteConversation => 'Избриши разговор';

  @override
  String get deleteConversationConfirm =>
      'Внесете го вашиот PIN за да го потврдите бришењето на сите пораки';

  @override
  String get noConversations => 'Сè уште нема разговори';

  @override
  String get startConversation => 'Започни';

  @override
  String get microphonePermissionRequired => 'Потребен е пристап до микрофон';

  @override
  String get microphonePermissionExplanation =>
      'Hash има потреба од микрофон за повици.';

  @override
  String get cameraPermissionExplanation =>
      'Hash има потреба од камера за видео повици.';

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
  String get openSettings => 'Отвори поставки';

  @override
  String get callConnecting => 'Се поврзува...';

  @override
  String get callRinging => 'Ѕвони...';

  @override
  String get callReconnecting => 'Повторно поврзување...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Повторно поврзување (${seconds}s)';
  }

  @override
  String get callPaused => 'Паузирано';

  @override
  String get callPausedSubtitle => 'Повикот е сè уште активен';

  @override
  String get callRemoteMicMuted => 'Микрофонот на контактот е исклучен';

  @override
  String get callMiniControlsMute => 'Исклучи';

  @override
  String get callMiniControlsUnmute => 'Вклучи';

  @override
  String get callMiniControlsHangUp => 'Затвори';

  @override
  String get callMiniControlsReturn => 'Врати се на повик';

  @override
  String get callNetworkPoor => 'Нестабилна врска';

  @override
  String get callNetworkLost => 'Врската е изгубена';

  @override
  String get callEndedTitle => 'Повикот заврши';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Податоци на уред';

  @override
  String get deviceDataSubtitle => 'Локално и серверско складирање';

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
  String get localStorage => 'Локално складирање';

  @override
  String get onThisDevice => 'на овој уред';

  @override
  String get encryptedDatabases => 'Енкриптирани бази на податоци';

  @override
  String get files => 'Датотеки';

  @override
  String get secureKeychain => 'Безбеден клучалка';

  @override
  String get cache => 'Кеш';

  @override
  String get contactsDetail => 'Имиња, аватари, Signal клучеви';

  @override
  String get messagesDetail => 'Енкриптирани разговори';

  @override
  String get notesDetail => 'Лични белешки';

  @override
  String get signalSessions => 'Signal сесии';

  @override
  String get signalSessionsDetail => 'Сесии за енкрипција';

  @override
  String get pendingContacts => 'Контакти на чекање';

  @override
  String get pendingContactsDetail => 'Барања на чекање';

  @override
  String get callHistory => 'Повици';

  @override
  String get callHistoryDetail => 'Историја на повици';

  @override
  String get preferences => 'Преференции';

  @override
  String get preferencesDetail => 'Медиумски и поставки за повици';

  @override
  String get avatars => 'Аватари';

  @override
  String get media => 'Медиуми';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count датотеки',
      one: '1 датотека',
      zero: 'нема датотеки',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Активно';

  @override
  String get notDefined => 'Не е дефинирано';

  @override
  String get biometrics => 'Биометрија';

  @override
  String get recoveryPhrase => 'Фраза за обновување';

  @override
  String get identity => 'Идентитет (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol клучеви';

  @override
  String get authTokens => 'Токени за автентикација';

  @override
  String get contactNamesCache => 'Кеш на имиња на контакти';

  @override
  String get remoteConfig => 'Далечинска конфигурација';

  @override
  String get notificationPrefs => 'Преференции за известувања';

  @override
  String get serverData => 'Серверски податоци';

  @override
  String get serverDataInfo =>
      'Hash чува минимални податоци на серверот, сите енкриптирани или привремени.';

  @override
  String get serverProfile => 'Профил';

  @override
  String get serverProfileDetail =>
      'Hash ID, јавни клучеви, токен на поштенско сандаче';

  @override
  String get serverPrekeys => 'Пред-клучеви';

  @override
  String get serverPrekeysDetail => 'Еднократни Signal клучеви (потрошени)';

  @override
  String get serverMessages => 'Пораки во транзит';

  @override
  String get serverMessagesDetail => 'Избришани по испорака (макс 24ч)';

  @override
  String get serverMedia => 'Медиуми во транзит';

  @override
  String get serverMediaDetail => 'Избришани по преземање';

  @override
  String get serverContactRequests => 'Барања за контакт';

  @override
  String get serverContactRequestsDetail => 'Истекуваат по 24ч';

  @override
  String get serverRateLimits => 'Ограничувања на стапка';

  @override
  String get serverRateLimitsDetail => 'Привремени анти-злоупотреба податоци';

  @override
  String get privacyReassurance =>
      'Hash не може да ги чита вашите пораки. Сите податоци се целосно енкриптирани. Серверските податоци автоматски се бришат.';

  @override
  String get pinTooSimple =>
      'Овој PIN е премногу едноставен. Изберете побезбеден код.';

  @override
  String get genericError => 'Настана грешка. Ве молиме обидете се повторно.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Не може да се креира сметка: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Фразата е копирана во клипборд';

  @override
  String get copyPhrase => 'Копирај фраза';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Запишете ја оваа фраза на безбедно место. Ако го изгубите PIN без оваа фраза, трајно ќе го изгубите пристапот до вашите податоци.';

  @override
  String get noMessages => 'Нема пораки';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Избриши ги сите пораки со $name?';
  }

  @override
  String get confirmation => 'Потврда';

  @override
  String get untitled => 'Без наслов';

  @override
  String get noSessions => 'Нема сесии';

  @override
  String get unknownContact => 'Непознат контакт';

  @override
  String get unnamed => 'Без име';

  @override
  String get noPendingRequestsAlt => 'Нема барања на чекање';

  @override
  String get deleteAllCallHistory => 'Избриши ја целата историја на повици?';

  @override
  String get noCalls => 'Нема повици';

  @override
  String get noPreferences => 'Нема преференции';

  @override
  String get resetAllMediaPrefs => 'Ресетирај ги сите медиумски преференции?';

  @override
  String get deleteThisAvatar => 'Избриши го овој аватар?';

  @override
  String get deleteAllAvatars => 'Избриши ги сите аватари?';

  @override
  String get noAvatars => 'Нема аватари';

  @override
  String get deleteThisFile => 'Избриши ја оваа датотека?';

  @override
  String get deleteAllMediaFiles => 'Избриши ги сите медиуми?';

  @override
  String get noMediaFiles => 'Нема медиуми';

  @override
  String get outgoing => 'Излезен';

  @override
  String get incoming => 'Влезен';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Ефемерен преглед: ${seconds}s';
  }

  @override
  String get normalView => 'Нормален преглед';

  @override
  String get callReasonCompleted => 'Завршен';

  @override
  String get callReasonMissed => 'Пропуштен';

  @override
  String get callReasonDeclined => 'Одбиен';

  @override
  String get callReasonFailed => 'Неуспешен';

  @override
  String get justNow => 'Токму сега';

  @override
  String timeAgoMinutes(int count) {
    return 'пред $count мин';
  }

  @override
  String timeAgoHours(int count) {
    return 'пред $countч';
  }

  @override
  String timeAgoDays(int count) {
    return 'пред $countд';
  }

  @override
  String get messageTypeContact => 'Контакт';

  @override
  String get messageTypeLocation => 'Локација';

  @override
  String get statusQueued => 'Во ред';

  @override
  String get blockedBadge => 'Блокиран';

  @override
  String get protectedBadge => 'Заштитен';

  @override
  String messageCount(int count) {
    return '$count порака/и';
  }

  @override
  String get deleteQuestion => 'Избриши?';

  @override
  String get transferMyAccountTitle => 'Пренеси ја мојата сметка';

  @override
  String get loadingError => 'Грешка при вчитување';

  @override
  String get transferToNewDevice => 'Пренеси на нов уред';

  @override
  String get transferInstructions =>
      'На вашиот нов уред, изберете \"Обнови ја мојата сметка\" и внесете ги овие информации:';

  @override
  String get yourHashIdLabel => 'Вашиот Hash ID';

  @override
  String get enterYourPinCode => 'Внесете го вашиот PIN код';

  @override
  String get pinOwnerConfirmation =>
      'За да потврдите дека сте сопственик на оваа сметка';

  @override
  String get scanThisQrCode => 'Скенирајте го овој QR code';

  @override
  String get withYourNewDevice => 'Со вашиот нов уред';

  @override
  String get orEnterTheCode => 'или внесете го кодот';

  @override
  String get transferCodeLabel => 'Код за пренос';

  @override
  String get proximityVerification => 'Проверка на близина';

  @override
  String get bringDevicesCloser => 'Доближете ги двата уреди';

  @override
  String get confirmTransferQuestion => 'Потврди пренос?';

  @override
  String get accountWillBeTransferred =>
      'Вашата сметка ќе биде пренесена на новиот уред.\n\nОвој уред трајно ќе биде исклучен.';

  @override
  String get transferComplete => 'Преносот е завршен';

  @override
  String get transferSuccessMessage =>
      'Вашата сметка е успешно пренесена.\n\nОваа апликација сега ќе се затвори.';

  @override
  String get manualVerification => 'Рачна проверка';

  @override
  String get codeDisplayedOnBothDevices => 'Код прикажан на двата уреди:';

  @override
  String get doesCodeMatchNewDevice =>
      'Дали овој код се совпаѓа со оној на новиот уред?';

  @override
  String get verifiedStatus => 'Потврдено';

  @override
  String get inProgressStatus => 'Во тек...';

  @override
  String get notAvailableStatus => 'Не е достапно';

  @override
  String get codeExpiredRestart => 'Кодот истече. Ве молиме рестартирајте.';

  @override
  String get codesDoNotMatchCancelled =>
      'Кодовите не се совпаѓаат. Преносот е откажан.';

  @override
  String transferToDevice(String device) {
    return 'До: $device';
  }

  @override
  String get copiedExclamation => 'Копирано!';

  @override
  String expiresInTime(String time) {
    return 'Истекува за $time';
  }

  @override
  String get biometricNotAvailable => 'Биометријата не е достапна на овој уред';

  @override
  String get biometricAuthError => 'Грешка при биометриска автентикација';

  @override
  String get authenticateForBiometric =>
      'Ве молиме автентицирајте се за да овозможите биометрија';

  @override
  String get biometricAuthFailed => 'Биометриската автентикација не успеа';

  @override
  String get forceUpdateTitle => 'Потребно ажурирање';

  @override
  String get forceUpdateMessage =>
      'Нова верзија на Hash е достапна. Ве молиме ажурирајте за да продолжите.';

  @override
  String get updateButton => 'Ажурирај';

  @override
  String get maintenanceInProgress => 'Одржување во тек';

  @override
  String get tryAgainLater => 'Ве молиме обидете се подоцна';

  @override
  String get information => 'Информација';

  @override
  String get later => 'Подоцна';

  @override
  String get doYouLikeHash => 'Дали ви се допаѓа Hash?';

  @override
  String get yourFeedbackHelps =>
      'Вашиот коментар ни помага да ја подобриме апликацијата';

  @override
  String get ratingTerrible => 'Страшно';

  @override
  String get ratingBad => 'Лошо';

  @override
  String get ratingOk => 'Во ред';

  @override
  String get ratingGood => 'Добро';

  @override
  String get ratingExcellent => 'Одлично!';

  @override
  String get donationMessage =>
      'Hash е непрофитен проект. Вашата поддршка ни помага да продолжиме.';

  @override
  String get recentConnections => 'Неодамнешни конекции';

  @override
  String get loginInfoText =>
      'Секое отклучување со PIN се евидентира локално. Само вие можете да ги видите.';

  @override
  String get connectionCount => 'Конекција(и)';

  @override
  String get periodLabel => 'Период';

  @override
  String get historyLabel => 'Историја';

  @override
  String get noLoginRecorded => 'Нема забележано најавување';

  @override
  String get nextUnlocksAppearHere =>
      'Следните отклучувања ќе се појават тука.';

  @override
  String get dataLocalOnly =>
      'Овие податоци се зачувани само на вашиот уред и никогаш не се споделуваат.';

  @override
  String get currentSession => 'Тековна';

  @override
  String get todayLabel => 'Денес';

  @override
  String get yesterdayLabel => 'Вчера';

  @override
  String get justNowLabel => 'Токму сега';

  @override
  String minutesAgoLabel(int count) {
    return 'Пред $count мин';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Пред $hoursч';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Пред $hoursч $minutesмин';
  }

  @override
  String get noMaintenancePlanned => 'Нема планирано одржување';

  @override
  String get everythingWorkingNormally => 'Сè работи нормално';

  @override
  String get maintenanceTitle => 'Одржување';

  @override
  String get maintenanceActiveLabel => 'АКТИВНО';

  @override
  String get maintenancePlannedLabel => 'ПЛАНИРАНО';

  @override
  String get locking => 'Заклучување...';

  @override
  String get newMessageNotification => 'Нова порака';

  @override
  String get secExplainTitle => 'Како Hash ве штити';

  @override
  String get secExplainIntro =>
      'Hash е дизајниран така што никој не може да ги чита вашите пораки.';

  @override
  String get secExplainIntroSub =>
      'Ниту ние.\nЕве како функционира, објаснето едноставно.';

  @override
  String get secJourneyLabel => 'ПАТУВАЊЕ';

  @override
  String get secJourneyTitle => 'Патувањето на вашата порака';

  @override
  String get secJourneySubtitle =>
      'Од вашиот прст до екранот на контактот, секој чекор е заштитен. Следете го патот.';

  @override
  String get secStep1Title => 'Ја пишувате вашата порака';

  @override
  String get secStep1Desc =>
      'Пишувате \"Здраво!\" во апликацијата. Во овој момент, пораката постои само во меморијата на вашиот телефон. Ништо не е испратено.';

  @override
  String get secStep2Title => 'Енкрипција со Signal Protocol';

  @override
  String get secStep2Desc =>
      'Штом притиснете \"Испрати\", вашата порака се претвора во низа неразбирливи знаци. Тоа е како вашата порака да е заклучена во сеф за кој само вашиот контакт има клуч.';

  @override
  String get secStep3Title => 'Запечатен испраќач: невидливата обвивка';

  @override
  String get secStep3Desc =>
      'Замислете дека испраќате писмо по пошта, но без адреса на испраќачот на обвивката. Токму тоа го прави Hash. Пораката се остава во анонимно поштенско сандаче. Серверот не знае кој ја испратил.';

  @override
  String get secStep4Title => 'Серверот не гледа ништо';

  @override
  String get secStep4Desc =>
      'Серверот делува како слеп поштар. Знае само \"некој оставил нешто во сандаче #A7X9\". Не знае кој го испратил, што е тоа или за кого е.';

  @override
  String get secStep4Highlight =>
      'Нема зачувани метаподатоци: нема IP адреса, нема временски печат, нема врска меѓу испраќач и примач.';

  @override
  String get secStep5Title => 'Вашиот контакт ја прима пораката';

  @override
  String get secStep5Desc =>
      'Телефонот на вашиот контакт ја презема содржината од анонимното сандаче и ја дешифрира пораката со приватниот клуч, кој никогаш не го напуштил уредот. \"Здраво!\" се појавува на екранот.';

  @override
  String get secStep6Title => 'Пораката исчезнува од серверот';

  @override
  String get secStep6Desc =>
      'Штом вашиот контакт потврди прием, серверот трајно ја брише пораката. Нема корпа, нема архива, нема резервна копија. Дури и непрочитаните пораки автоматски се уништуваат по 24 часа.';

  @override
  String get secStep7Title => 'Локално истекување';

  @override
  String get secStep7Desc =>
      'На телефонот на вашиот контакт, пораката се самоуништува според траењето што го избравте: веднаш по читање, 5 минути, 1 час... вие одлучувате.';

  @override
  String get secJourneyConclusion =>
      'Резултат: нула трага на серверот, нула трага на уредите. Пораката постоеше само доволку долго за да биде прочитана, потоа исчезна.';

  @override
  String get secArchLabel => 'АРХИТЕКТУРА';

  @override
  String get secArchTitle => '5 слоеви на заштита';

  @override
  String get secArchSubtitle =>
      'Hash не се потпира на една технологија. Секој слој ги зајакнува другите. Дури и ако еден слој е компромитиран, вашите податоци остануваат безбедни.';

  @override
  String get secLayer1Title => 'Целосна енкрипција';

  @override
  String get secLayer1Desc =>
      'Секоја порака е енкриптирана со уникатен клуч. Едноставно: дури и ако некој дешифрира една порака, нема да може да ја дешифрира следната. Секоја порака има своја брава.';

  @override
  String get secLayer1Detail =>
      'За датотеки (фотографии, видеа, документи), Hash користи дополнителна AES-256-GCM енкрипција. Датотеката се енкриптира пред да го напушти вашиот телефон.';

  @override
  String get secLayer2Title => 'Запечатен испраќач (мрежна анонимност)';

  @override
  String get secLayer2Desc =>
      'Обичните месинџери ги испраќаат вашите пораки со вашиот идентитет прикачен. Тоа е како да го напишете вашето име на обвивката. Hash користи анонимни поштенски сандачиња: серверот ја доставува пораката без да знае кој ја испратил.';

  @override
  String get secLayer2Detail =>
      'Резултат: дури и во случај на пробив на серверски податоци, невозможно е да се реконструира кој разговара со кого.';

  @override
  String get secLayer3Title => 'Автоматско бришење';

  @override
  String get secLayer3Desc =>
      'Пораките се бришат од серверот штом се потврди приемот. Дури и ако пораката никогаш не се преземе, автоматски се уништува по 24 часа.';

  @override
  String get secLayer3Detail =>
      'На вашиот телефон, пораките се самоуништуваат според траењето што го избравте: веднаш, 5 мин, 15 мин, 30 мин, 1ч, 3ч, 6ч или 12ч.';

  @override
  String get secLayer4Title => 'Локална заштита на пристап';

  @override
  String get secLayer4Desc =>
      'Апликацијата е заштитена со 6-цифрен PIN и/или биометрија (Face ID, отпечаток). По премногу неуспешни обиди, апликацијата се заклучува со зголемено одложување по секој неуспех.';

  @override
  String get secLayer5Title => 'Заклучена база на податоци';

  @override
  String get secLayer5Desc =>
      'На серверската страна, ниеден корисник не може директно да запишува во базата на податоци. Сите акции поминуваат преку безбедни функции кои го проверуваат секое барање.';

  @override
  String get secLayer5Detail =>
      'Тоа е како банкарски шалтер: никогаш не го допирате трезорот самите. Поднесувате барање, и системот проверува дали имате право пред да дејствува.';

  @override
  String get secVashLabel => 'УНИКАТНО ВО СВЕТОТ';

  @override
  String get secVashTitle => 'Vash режим';

  @override
  String get secVashSubtitle =>
      'Систем за итна безбедност што не постои во ниедна друга апликација за пораки.';

  @override
  String get secVashScenarioTitle => 'Замислете ја оваа ситуација';

  @override
  String get secVashScenario1 => 'Некој пристапува до вашиот телефон';

  @override
  String get secVashScenario2 => 'Ви бараат PIN код';

  @override
  String get secVashScenario3 => 'Сакате итно да ги избришете сите податоци';

  @override
  String get secVashSolutionTitle => 'Решението: два PIN кода';

  @override
  String get secVashSolutionDesc =>
      'Конфигурирате два различни PIN кода во Hash:';

  @override
  String get secVashNormalCodeLabel => 'Нормален код';

  @override
  String get secVashNormalCodeDesc =>
      'Ја отвора апликацијата нормално со сите податоци';

  @override
  String get secVashCodeLabel2 => 'Vash код';

  @override
  String get secVashCodeDescription =>
      'Ја отвора апликацијата нормално... но сите податоци тивко се бришат во позадина';

  @override
  String get secVashWhatHappensTitle => 'Што се случува потоа';

  @override
  String get secVashWhatHappensDesc =>
      'Апликацијата се отвора нормално. Нема предупредување, нема сомнителна анимација. Екранот едноставно покажува празна апликација, како штотуку да сте ја инсталирале.\n\nВо реалноста, сите ваши разговори, контакти и пораки се неповратно избришани за дел од секундата.';

  @override
  String get secCallsLabel => 'ПОВИЦИ И ДАТОТЕКИ';

  @override
  String get secCallsTitle => 'Сè е енкриптирано';

  @override
  String get secCallsSubtitle =>
      'Не се само пораките. Апсолутно сè што поминува преку Hash е целосно енкриптирано.';

  @override
  String get secAudioCallTitle => 'Аудио повици';

  @override
  String get secAudioCallDesc =>
      'Целосна енкрипција преку WebRTC. Гласот се пренесува директно меѓу уредите.';

  @override
  String get secVideoCallTitle => 'Видео повици';

  @override
  String get secVideoCallDesc =>
      'Иста технологија, секој проток енкриптиран поединечно.';

  @override
  String get secPhotosTitle => 'Фотографии и видеа';

  @override
  String get secPhotosDesc =>
      'Енкриптирани со AES-256-GCM пред да го напуштат телефонот.';

  @override
  String get secDocsTitle => 'Документи';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, било која датотека. Име, големина и содржина енкриптирани.';

  @override
  String get secAnonLabel => 'АНОНИМНОСТ';

  @override
  String get secAnonTitle => 'Не е потребен идентитет';

  @override
  String get secAnonSubtitle =>
      'Hash никогаш не бара телефонски број или е-пошта. Вие сте идентификувани со уникатен и анонимен Hash ID.';

  @override
  String get secHashIdTitle => 'Вашиот Hash ID';

  @override
  String get secHashIdDesc =>
      'Ова е вашиот уникатен идентификатор. Не открива ништо за вас: ниту вашето име, ниту бројот, ниту локацијата. Тоа е како псевдоним невозможен за поврзување со вашиот вистински идентитет.\n\nЗа да додадете контакт, го споделувате вашиот Hash ID или скенирате QR code. Тоа е сè. Нема синхронизирани адресари, нема предлози \"Луѓе што можеби ги познавате\".';

  @override
  String get secDataLabel => 'ПОДАТОЦИ';

  @override
  String get secDataTitle => 'Што Hash не знае';

  @override
  String get secDataSubtitle =>
      'Најдобриот начин да ги заштитите вашите податоци е да не ги собирате.';

  @override
  String get secNeverCollected => 'Никогаш не се собира';

  @override
  String get secNeverItem1 => 'Содржина на пораки';

  @override
  String get secNeverItem2 => 'Листа на контакти';

  @override
  String get secNeverItem3 => 'Телефонски број';

  @override
  String get secNeverItem4 => 'Е-пошта адреса';

  @override
  String get secNeverItem5 => 'IP адреса';

  @override
  String get secNeverItem6 => 'Локација';

  @override
  String get secNeverItem7 => 'Метаподатоци (кој разговара со кого)';

  @override
  String get secNeverItem8 => 'Историја на повици';

  @override
  String get secNeverItem9 => 'Адресар';

  @override
  String get secNeverItem10 => 'Рекламни идентификатори';

  @override
  String get secTempStored => 'Привремено зачувано';

  @override
  String get secTempItem1 => 'Анонимен Hash ID (уникатен идентификатор)';

  @override
  String get secTempItem2 => 'Јавни клучеви за енкрипција';

  @override
  String get secTempItem3 => 'Енкриптирани пораки во транзит (макс 24ч)';

  @override
  String get secTempNote =>
      'Дури и овие минимални податоци не можат да ве идентификуваат. Вашиот Hash ID не е поврзан со лични информации.';

  @override
  String get secFooterTitle => 'Вашата приватност, вашата слобода';

  @override
  String get secFooterDesc =>
      'Hash ги користи истите технологии за енкрипција како најзаканувачките професионални апликации. Вашите пораки се заштитени со математика, не со ветувања.';

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
