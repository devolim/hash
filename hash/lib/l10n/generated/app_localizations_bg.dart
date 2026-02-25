// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Нулева следа. Нулев компромис.';

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
  String get conversations => 'Чатове';

  @override
  String get contacts => 'Контакти';

  @override
  String get noConversation => 'Няма чатове';

  @override
  String get noConversationSubtitle =>
      'Добавете контакт, за да започнете да чатите сигурно';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чакащи заявки',
      one: '1 чакаща заявка',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изпратени заявки в изчакване',
      one: '1 изпратена заявка в изчакване',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Добавяне на контакт';

  @override
  String get shareApp => 'Споделяне на приложение';

  @override
  String get newMessage => 'Ново съобщение';

  @override
  String get newConversation => 'Изпращане на съобщение';

  @override
  String get settings => 'Настройки';

  @override
  String get myHashId => 'Моят Hash ID';

  @override
  String get supportHash => 'Подкрепете Hash';

  @override
  String get supportHashSubtitle => 'Hash е нестопански проект';

  @override
  String get donate => 'Дарете';

  @override
  String get appearance => 'Външен вид';

  @override
  String get theme => 'Тема';

  @override
  String get themeAuto => 'Автоматично';

  @override
  String get themeAutoSubtitle => 'Следва системните настройки';

  @override
  String get themeDark => 'Тъмна';

  @override
  String get themeLight => 'Светла';

  @override
  String get themeRecommendation =>
      'Тъмната тема се препоръчва за по-добра поверителност';

  @override
  String get language => 'Език';

  @override
  String get languageAuto => 'Автоматично (система)';

  @override
  String get notifications => 'Известия';

  @override
  String get messages => 'Съобщения';

  @override
  String get calls => 'Обаждания';

  @override
  String get vibration => 'Вибрация';

  @override
  String get notificationContent => 'Съдържание на известие';

  @override
  String get notificationContentFull => 'Показване на всичко';

  @override
  String get notificationContentFullDesc =>
      'Име на контакт и преглед на съобщение';

  @override
  String get notificationContentName => 'Само име';

  @override
  String get notificationContentNameDesc => 'Показва само името на контакта';

  @override
  String get notificationContentDiscrete => 'Дискретно';

  @override
  String get notificationContentDiscreteDesc =>
      'Показва само \"Ново съобщение\"';

  @override
  String get security => 'Сигурност';

  @override
  String get howHashProtectsYou => 'Как Hash ви защитава';

  @override
  String get howHashProtectsYouSubtitle => 'Разберете вашата сигурност';

  @override
  String get accountSecurity => 'Сигурност на акаунта';

  @override
  String get accountSecuritySubtitle => 'PIN, биометрия, Режим Vash';

  @override
  String get blockScreenshots => 'Блокиране на екранни снимки';

  @override
  String get transferDevice => 'Прехвърляне на друго устройство';

  @override
  String get transferDeviceSubtitle => 'Мигрирайте акаунта си';

  @override
  String get pinCode => 'PIN код';

  @override
  String get changePin => 'Промяна на PIN код';

  @override
  String get currentPin => 'Текущ PIN код';

  @override
  String get newPin => 'Нов PIN код';

  @override
  String get confirmPin => 'Потвърдете PIN код';

  @override
  String get pinChanged => 'PIN кодът е променен';

  @override
  String get incorrectPin => 'Грешен PIN';

  @override
  String get pinsDoNotMatch => 'PIN кодовете не съвпадат';

  @override
  String get autoLock => 'Автоматично заключване';

  @override
  String get autoLockDelay => 'Забавяне на заключване';

  @override
  String get autoLockImmediate => 'Незабавно';

  @override
  String get autoLockMinute => '1 минута';

  @override
  String autoLockMinutes(int count) {
    return '$count минути';
  }

  @override
  String get vashCode => 'Vash код';

  @override
  String get vashModeTitle => 'Режим Vash';

  @override
  String get vashModeExplanation => 'Вашата крайна предпазна мрежа.';

  @override
  String get vashModeDescription =>
      'Ще изберете втори PIN код. Ако някога бъдете принудени да отворите Hash, въведете този код вместо обичайния си PIN.\n\nПриложението ще се отвори нормално, но всички ваши разговори и контакти ще изчезнат.\n\nЗа всеки, който гледа екрана ви, Hash просто изглежда празен — сякаш никога не сте го използвали.';

  @override
  String get vashModeIrreversible => 'Това действие е тихо и необратимо.';

  @override
  String get chooseVashCode => 'Изберете моя Vash код';

  @override
  String get vashCodeInfo =>
      'Втори PIN код, който отваря приложението нормално, но празно.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Ако въведете този код вместо вашия PIN:';

  @override
  String get vashDeleteContacts => 'Контактите ви изчезват';

  @override
  String get vashDeleteMessages => 'Разговорите ви изчезват';

  @override
  String get vashDeleteHistory => 'Бележките ви изчезват';

  @override
  String get vashKeepId =>
      'Вашата Hash идентичност (#XXX-XXX-XXX) остава същата';

  @override
  String get vashAppearNormal =>
      'Приложението изглежда нормално, но празно, като ново. Това действие е необратимо.';

  @override
  String get setupVashCode => 'Настройка на Vash код';

  @override
  String get modifyVashCode => 'Промяна на Vash код';

  @override
  String get currentVashCode => 'Текущ Vash код';

  @override
  String get newVashCode => 'Нов Vash код';

  @override
  String get confirmVashCode => 'Потвърдете Vash код';

  @override
  String get vashCodeConfigured => 'Vash кодът е конфигуриран';

  @override
  String get vashCodeModified => 'Vash кодът е променен';

  @override
  String get vashCodeMustDiffer => 'Vash кодът трябва да е различен от PIN';

  @override
  String get incorrectVashCode => 'Грешен Vash код';

  @override
  String get vashWhatToDelete =>
      'Какво трябва да накара да изчезне Режим Vash?';

  @override
  String get vashDeleteContactsOption => 'Контакти';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Съобщения';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Бележки';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Режим Vash е активиран';

  @override
  String get vashCreateSubtitle => 'Изберете код, различен от основния ви PIN';

  @override
  String get vashConfirmSubtitle => 'Потвърдете вашия Vash код';

  @override
  String get pinCodeForEntry => 'PIN код за влизане в приложението';

  @override
  String get vashCodeSection => 'Режим Vash';

  @override
  String get biometric => 'Биометрия';

  @override
  String get biometricUnlock => 'Отключване с пръстов отпечатък или Face ID';

  @override
  String get enableBiometric => 'Активиране на биометрия';

  @override
  String get biometricWarningMessage =>
      'С активирането на биометрията, няма да можете да използвате Vash кода си за влизане в приложението.\n\nЩе можете да използвате Vash кода само ако биометрията се провали (след няколко неуспешни опита).\n\nСигурни ли сте, че искате да продължите?';

  @override
  String get understood => 'Разбрах';

  @override
  String get shareAppSubtitle => 'Споделете Hash с близките си';

  @override
  String get share => 'Сподели';

  @override
  String get danger => 'Опасност';

  @override
  String get deleteAccount => 'Изтриване на акаунта ми';

  @override
  String get deleteAccountSubtitle => 'Необратимо действие';

  @override
  String get deleteAccountConfirmTitle => 'Изтриване на акаунта ми';

  @override
  String get deleteAccountConfirmMessage =>
      'Акаунтът ви ще бъде изтрит завинаги. Това действие е необратимо.\n\n• Всички ваши чатове\n• Всички ваши контакти\n• Вашият Hash ID\n\nЩе трябва да създадете нов акаунт.';

  @override
  String get deleteForever => 'Изтриване завинаги';

  @override
  String get cancel => 'Отказ';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Режим Vash е активиран.';

  @override
  String deletionError(String error) {
    return 'Грешка при изтриване: $error';
  }

  @override
  String get yourSecurity => 'Вашата сигурност';

  @override
  String get securityInfo =>
      '• Криптиране от край до край (Signal Protocol)\n• Няма данни на нашите сървъри след доставка\n• Ключовете се съхраняват само на вашето устройство\n• PIN кодът никога не се изпраща към сървъра';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Добре дошли';

  @override
  String get securityStatement1 => 'Вашите съобщения са защитени.';

  @override
  String get securityStatement2 => 'Криптиране от край до край.';

  @override
  String get securityStatement3 => 'Без следи. Без компромис.';

  @override
  String get securityStatement4 => 'Вашата поверителност е право.';

  @override
  String get accessBlocked => 'Достъпът е блокиран';

  @override
  String get tooManyAttempts => 'Твърде много опити';

  @override
  String get pleaseWait => 'Моля, изчакайте';

  @override
  String get waitDelay => 'Моля, изчакайте забавянето да приключи';

  @override
  String attemptCount(int current, int max) {
    return 'Опит $current от $max';
  }

  @override
  String retryIn(String time) {
    return 'Опитайте отново след $time';
  }

  @override
  String get forgotPin => 'Забравен PIN? Използвайте фраза за възстановяване';

  @override
  String get useRecoveryPhrase => 'Използвайте фраза за възстановяване';

  @override
  String get recoveryWarningTitle => 'Предупреждение';

  @override
  String get recoveryWarningMessage => 'Възстановяването на акаунта ще:';

  @override
  String get recoveryDeleteAllMessages => 'Изтрие ВСИЧКИ ваши съобщения';

  @override
  String get recoveryWaitDelay => 'Изисква 1 час изчакване';

  @override
  String get recoveryKeepContacts => 'Запази контактите ви';

  @override
  String get recoveryIrreversible =>
      'Това действие е необратимо. Съобщенията ви ще бъдат загубени завинаги.';

  @override
  String get iUnderstand => 'Разбирам';

  @override
  String get accountRecovery => 'Възстановяване на акаунт';

  @override
  String get enterRecoveryPhrase =>
      'Въведете 24-те думи от фразата за възстановяване, разделени с интервали.';

  @override
  String get recoveryPhraseHint => 'дума1 дума2 дума3 ...';

  @override
  String get recover => 'Възстановяване';

  @override
  String get recoveryPhraseRequired =>
      'Моля, въведете фразата за възстановяване';

  @override
  String get recoveryPhrase24Words => 'Фразата трябва да съдържа точно 24 думи';

  @override
  String get incorrectRecoveryPhrase => 'Грешна фраза за възстановяване';

  @override
  String get recoveryInitError =>
      'Грешка при инициализиране на възстановяването';

  @override
  String get securityDelay => 'Забавяне за сигурност';

  @override
  String get securityDelayMessage =>
      'За вашата сигурност е необходимо изчакване, преди да можете да създадете нов PIN.';

  @override
  String get timeRemaining => 'Оставащо време';

  @override
  String get messagesDeletedForProtection =>
      'Съобщенията ви бяха изтрити за ваша защита.';

  @override
  String get canCloseApp =>
      'Можете да затворите приложението и да се върнете по-късно.';

  @override
  String get onboardingTitle1 => 'Добре дошли в Hash';

  @override
  String get onboardingSubtitle1 => 'Месинджърът, който не оставя следи';

  @override
  String get onboardingTitle2 => 'Пълно криптиране';

  @override
  String get onboardingSubtitle2 =>
      'Вашите съобщения са криптирани от край до край със Signal Protocol';

  @override
  String get onboardingTitle3 => 'Без следи';

  @override
  String get onboardingSubtitle3 =>
      'Съобщенията се изтриват от сървърите при доставка';

  @override
  String get onboardingTitle4 => 'Вашата сигурност';

  @override
  String get onboardingSubtitle4 =>
      'PIN код, Режим Vash и фраза за възстановяване';

  @override
  String get getStarted => 'Започнете';

  @override
  String get next => 'Напред';

  @override
  String get skip => 'Пропускане';

  @override
  String get alreadyHaveAccount => 'Вече имам акаунт';

  @override
  String get transferMyAccount => 'Прехвърляне на акаунта ми';

  @override
  String get createPin => 'Създайте PIN код';

  @override
  String get createPinSubtitle =>
      'Този код ще защитава достъпа до вашето приложение';

  @override
  String get confirmYourPin => 'Потвърдете вашия PIN код';

  @override
  String get confirmPinSubtitle => 'Въведете PIN кода си отново';

  @override
  String get saveRecoveryPhrase => 'Фраза за възстановяване';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Запишете тези 24 думи по ред. Те ще ви позволят да възстановите акаунта си, ако забравите PIN-а си.';

  @override
  String get phraseWritten => 'Записах фразата си';

  @override
  String get warningRecoveryPhrase =>
      'Ако загубите тази фраза и забравите PIN-а си, ще загубите достъп до акаунта си.';

  @override
  String get accountTransferred => 'Акаунтът е прехвърлен';

  @override
  String get accountTransferredMessage =>
      'Акаунтът ви е прехвърлен на друго устройство. Тази сесия вече не е валидна.';

  @override
  String get accountTransferredInfo =>
      'Ако не сте инициирали това прехвърляне, акаунтът ви може да е бил компрометиран.';

  @override
  String get logout => 'Излизане';

  @override
  String get transferAccount => 'Прехвърляне на акаунт';

  @override
  String get transferAccountInfo =>
      'Прехвърлете вашия Hash акаунт на ново устройство. Текущата ви сесия ще бъде анулирана.';

  @override
  String get generateTransferCode => 'Генериране на код за прехвърляне';

  @override
  String get transferCode => 'Код за прехвърляне';

  @override
  String transferCodeExpires(int minutes) {
    return 'Този код изтича след $minutes минути';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Въведете този код на новото си устройство, за да прехвърлите акаунта си.';

  @override
  String get generateNewCode => 'Генериране на нов код';

  @override
  String get scanQrCode => 'Сканиране на QR код';

  @override
  String get scanQrCodeSubtitle =>
      'Сканирайте QR кода на контакт, за да го добавите';

  @override
  String get qrCodeDetected => 'QR код е открит';

  @override
  String get invalidQrCode => 'Невалиден QR код';

  @override
  String get cameraPermissionRequired => 'Необходимо е разрешение за камера';

  @override
  String get myQrCode => 'Моят QR код';

  @override
  String get myQrCodeSubtitle =>
      'Споделете този QR код, за да могат контактите ви да ви добавят';

  @override
  String get shareQrCode => 'Споделяне';

  @override
  String get addContactTitle => 'Добавяне на контакт';

  @override
  String get addContactByHashId => 'Въведете Hash ID на вашия контакт';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Търсене';

  @override
  String get contactNotFound => 'Контактът не е намерен';

  @override
  String get contactAlreadyAdded => 'Този контакт вече е във вашия списък';

  @override
  String get contactAdded => 'Контактът е добавен';

  @override
  String get myProfile => 'Моят профил';

  @override
  String get myProfileSubtitle =>
      'Споделете тази информация, за да могат другите да ви добавят';

  @override
  String get temporaryCode => 'Временен код';

  @override
  String temporaryCodeExpires(String time) {
    return 'Изтича след $time';
  }

  @override
  String get codeExpired => 'Кодът е изтекъл';

  @override
  String get generateNewCodeButton => 'Нов код';

  @override
  String get copyHashId => 'Копиране на ID';

  @override
  String get copyCode => 'Копиране на код';

  @override
  String get copiedToClipboard => 'Копирано';

  @override
  String get showMyQrCode => 'Показване на моя QR код';

  @override
  String get orDivider => 'или';

  @override
  String get openScanner => 'Отваряне на скенер';

  @override
  String get addManually => 'Ръчно добавяне';

  @override
  String get contactHashIdLabel => 'Hash ID на контакта';

  @override
  String get temporaryCodeLabel => 'Временен код';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Помолете контакта си да генерира код от профила си';

  @override
  String get verifyAndAdd => 'Проверка и добавяне';

  @override
  String get fillAllFields => 'Моля, попълнете всички полета';

  @override
  String get invalidHashIdFormat =>
      'Невалиден формат на ID (напр.: 123-456-ABC)';

  @override
  String get userNotFound => 'Потребителят не е намерен';

  @override
  String get cannotAddYourself => 'Не можете да добавите себе си';

  @override
  String get invalidOrExpiredCode => 'Невалиден или изтекъл временен код';

  @override
  String get contactFound => 'Контактът е намерен!';

  @override
  String get howToCallContact => 'Как бихте искали да ги наречете?';

  @override
  String get contactNameHint => 'Име на контакт';

  @override
  String get addContactButton => 'Добавяне';

  @override
  String get contactDetails => 'Детайли на контакта';

  @override
  String get contactName => 'Име на контакт';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Добавен на $date';
  }

  @override
  String get deleteContact => 'Изтриване на контакт';

  @override
  String deleteContactConfirm(Object name) {
    return 'Изтриване на този контакт?';
  }

  @override
  String get deleteContactMessage => 'Това ще изтрие и целия чат.';

  @override
  String get delete => 'Изтриване';

  @override
  String get typeMessage => 'Напишете съобщение...';

  @override
  String get messageSent => 'Изпратено';

  @override
  String get messageDelivered => 'Доставено';

  @override
  String get messageRead => 'Прочетено';

  @override
  String get messageFailed => 'Неуспешно изпращане';

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
  String get today => 'Днес';

  @override
  String get yesterday => 'Вчера';

  @override
  String dateAtTime(String date, String time) {
    return '$date в $time';
  }

  @override
  String get shareMessage =>
      'Присъединете се към мен в Hash! 🔒\n\nТова е наистина поверителен месинджър: пълно криптиране, без следи на сървърите и режим на паника при нужда.\n\nИзтеглете приложението тук 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Грешка';

  @override
  String get ok => 'ОК';

  @override
  String get view => 'Преглед';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Не';

  @override
  String get save => 'Запазване';

  @override
  String get edit => 'Редактиране';

  @override
  String get close => 'Затваряне';

  @override
  String get confirm => 'Потвърждаване';

  @override
  String get loading => 'Зареждане...';

  @override
  String get retry => 'Опитайте отново';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Чакащи заявки';

  @override
  String get noPendingRequests => 'Няма чакащи заявки';

  @override
  String get pendingRequestsSubtitle => 'Тези хора искат да ви добавят';

  @override
  String requestFromUser(String hashId) {
    return 'Заявка от $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Изтича след $days дни';
  }

  @override
  String get acceptRequest => 'Приемане';

  @override
  String get rejectRequest => 'Отхвърляне';

  @override
  String get requestAccepted => 'Заявката е приета';

  @override
  String get requestRejected => 'Заявката е отхвърлена';

  @override
  String get requestSent => 'Заявката е изпратена!';

  @override
  String get requestSentSubtitle =>
      'Вашата заявка е изпратена. Потребителят трябва да я приеме, преди да можете да чатите.';

  @override
  String get requestAlreadyPending => 'Заявка вече чака';

  @override
  String get requestAlreadySentByOther =>
      'Този човек вече ви е изпратил заявка';

  @override
  String get addByHashId => 'Добавяне чрез Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Въведете Hash ID и временния код на контакта';

  @override
  String get enterTemporaryCode => 'Въведете 6-цифрения код';

  @override
  String get sendRequest => 'Изпращане на заявка';

  @override
  String get acceptContactTitle => 'Приемане на контакт';

  @override
  String get acceptContactSubtitle => 'Можете да им дадете персонализирано име';

  @override
  String get leaveEmptyForHashId => 'Оставете празно, за да използвате Hash ID';

  @override
  String get firstName => 'Име';

  @override
  String get lastName => 'Фамилия';

  @override
  String get notes => 'Бележки';

  @override
  String get notesHint => 'Лични бележки за този контакт';

  @override
  String get photoOptional => 'Снимка (незадължително)';

  @override
  String get contactNameOptional => 'Име (незадължително)';

  @override
  String get notesOptional => 'Бележки (незадължително)';

  @override
  String get storedLocally => 'Съхранява се само на вашето устройство';

  @override
  String get encryptedMessageLabel => 'Криптирано съобщение';

  @override
  String get identityMessageHint => 'Кой сте? Как се познавате?';

  @override
  String get messageWillBeSentEncrypted =>
      'Това съобщение ще бъде криптирано и изпратено до получателя';

  @override
  String get sendRequestButton => 'Изпращане на заявка';

  @override
  String get requestExpiresIn24h =>
      'Заявката изтича след 24ч, ако не бъде приета';

  @override
  String get theyAlreadySentYouRequest =>
      'Този човек вече ви е изпратил заявка';

  @override
  String get requests => 'Заявки';

  @override
  String get receivedRequests => 'Получени';

  @override
  String get sentRequests => 'Изпратени';

  @override
  String get noSentRequests => 'Няма изпратени заявки';

  @override
  String get cancelRequest => 'Отказ';

  @override
  String get deleteRequest => 'Изтриване на заявка';

  @override
  String get requestCancelled => 'Заявката е отменена';

  @override
  String sentTo(String hashId) {
    return 'Изпратено до $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Изтича след $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Получено преди $time';
  }

  @override
  String get messageFromRequester => 'Съобщение от заявителя';

  @override
  String get copy => 'Копиране';

  @override
  String get messageInfo => 'Информация за съобщение';

  @override
  String get messageDirection => 'Посока';

  @override
  String get messageSentByYou => 'Изпратено от вас';

  @override
  String get messageReceived => 'Получено';

  @override
  String get messageSentAt => 'Изпратено на';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Статус';

  @override
  String get messageReadAt => 'Прочетено на';

  @override
  String get messageType => 'Тип';

  @override
  String get messageSize => 'Размер';

  @override
  String get messageExpiresAt => 'Изтича на';

  @override
  String get messageEncrypted => 'Криптирано от край до край';

  @override
  String get messageStatusSending => 'Изпращане...';

  @override
  String get messageStatusSent => 'Изпратено';

  @override
  String get messageStatusDelivered => 'Доставено';

  @override
  String get messageStatusRead => 'Прочетено';

  @override
  String get messageStatusFailed => 'Неуспешно';

  @override
  String get serverStatus => 'Сървър';

  @override
  String get onServer => 'В очакване на доставка';

  @override
  String get deletedFromServer => 'Изтрито';

  @override
  String get messageTypeText => 'Текст';

  @override
  String get messageTypeImage => 'Изображение';

  @override
  String get messageTypeVideo => 'Видео';

  @override
  String get messageTypeVoice => 'Глас';

  @override
  String get messageTypeFile => 'Файл';

  @override
  String get indefinitely => 'Неограничено';

  @override
  String get hoursShort => 'ч';

  @override
  String get minutesShort => 'мин';

  @override
  String get hours => 'часа';

  @override
  String get minutes => 'минути';

  @override
  String get seconds => 'секунди';

  @override
  String get ephemeralMessages => 'Ефемерни съобщения';

  @override
  String get ephemeralMessagesDescription =>
      'Съобщенията се изтриват автоматично след това време';

  @override
  String get ephemeralImmediate => 'Незабавно (след прочитане)';

  @override
  String get ephemeralImmediateDesc => 'Изтрива се веднага след прочитане';

  @override
  String get ephemeralMyPreference => 'Моето предпочитание';

  @override
  String get ephemeralMyPreferenceDesc => 'Използвай глобалната настройка';

  @override
  String get ephemeralDefaultSetting => 'Продължителност на съобщение';

  @override
  String get ephemeralChooseDefault => 'Препоръчително';

  @override
  String get ephemeral30Seconds => '30 секунди';

  @override
  String get ephemeral30SecondsDesc => 'Изтрито 30сек след прочитане';

  @override
  String get ephemeral5Minutes => '5 минути';

  @override
  String get ephemeral5MinutesDesc => 'Изтрито 5мин след прочитане';

  @override
  String get ephemeral1Hour => '1 час';

  @override
  String get ephemeral1HourDesc => 'Изтрито 1ч след прочитане';

  @override
  String get ephemeral3Hours => '3 часа';

  @override
  String get ephemeral6Hours => '6 часа';

  @override
  String get ephemeral6HoursDesc => 'Изтрито 6ч след прочитане';

  @override
  String get ephemeral12Hours => '12 часа';

  @override
  String get ephemeral24Hours => '24 часа';

  @override
  String get ephemeral24HoursDesc => 'Изтрито 24ч след прочитане';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Персонализирана продължителност';

  @override
  String get howItWorks => 'Как работи';

  @override
  String get ephemeralExplanation1 =>
      'Съобщенията се изтриват от сървъра веднага след получаване.';

  @override
  String get ephemeralExplanation2 =>
      'Тази настройка определя кога съобщенията изчезват от ВАШИЯ телефон след прочитане.';

  @override
  String get ephemeralExplanation3 =>
      'Контактът ви има собствена настройка за своя телефон.';

  @override
  String get mute1Hour => '1 час';

  @override
  String get mute8Hours => '8 часа';

  @override
  String get mute1Day => '1 ден';

  @override
  String get mute1Week => '1 седмица';

  @override
  String get muteAlways => 'Винаги';

  @override
  String get muteExplanation => 'Няма да получавате известия за този контакт';

  @override
  String get showCallsInRecents => 'Показване в скорошни обаждания';

  @override
  String get showCallsInRecentsSubtitle =>
      'Обажданията от Hash се показват в историята на телефона';

  @override
  String get feedback => 'Обратна връзка';

  @override
  String get muteNotifications => 'Заглушаване на известия';

  @override
  String get muteDescription => 'Няма да получавате известия за този контакт';

  @override
  String mutedUntil(String time) {
    return 'Заглушено до $time';
  }

  @override
  String get notMuted => 'Известията са активни';

  @override
  String get unmute => 'Включване на звука';

  @override
  String get notificationSound => 'Звук на известие';

  @override
  String get defaultSound => 'По подразбиране';

  @override
  String get chatSettings => 'Настройки на чат';

  @override
  String get bubbleColor => 'Цвят на балонче';

  @override
  String get backgroundColor => 'Цвят на фона';

  @override
  String get backgroundImage => 'Фоново изображение';

  @override
  String get chatBackground => 'Фон на чата';

  @override
  String get customColor => 'Персонализиран';

  @override
  String get defaultColor => 'По подразбиране';

  @override
  String get imageSelected => 'Изображението е избрано';

  @override
  String get noImage => 'Без изображение';

  @override
  String get color => 'Цвят';

  @override
  String get image => 'Изображение';

  @override
  String get tapToSelectImage => 'Докоснете, за да изберете изображение';

  @override
  String get changeImage => 'Промяна на изображение';

  @override
  String get previewMessageReceived => 'Здравей!';

  @override
  String get previewMessageSent => 'Здрасти!';

  @override
  String get messageAction => 'Съобщение';

  @override
  String get callAction => 'Обаждане';

  @override
  String get videoAction => 'Видео';

  @override
  String get personalNotes => 'Лични бележки';

  @override
  String get addNotes => 'Добавяне на бележки...';

  @override
  String get noNotes => 'Без бележки';

  @override
  String get messageNotifications => 'Известия за съобщения';

  @override
  String get callNotifications => 'Известия за обаждания';

  @override
  String get useGradient => 'Използване на градиент';

  @override
  String get gradientStart => 'Начален цвят';

  @override
  String get gradientEnd => 'Краен цвят';

  @override
  String get preview => 'Преглед';

  @override
  String get reset => 'Нулиране';

  @override
  String get securityNumber => 'Номер за сигурност';

  @override
  String securityNumberDescription(String name) {
    return 'Проверете дали номерът за сигурност съвпада с устройството на $name';
  }

  @override
  String get verifyEncryption => 'Проверка на криптирането от край до край';

  @override
  String get tapToCopy => 'Докоснете, за да копирате';

  @override
  String get howToVerify => 'Как да проверите';

  @override
  String get verifyStep1 => 'Срещнете се с контакта си лично или му се обадете';

  @override
  String get verifyStep2 =>
      'Сравнете номерата за сигурност или сканирайте QR кодове';

  @override
  String get verifyStep3 => 'Ако съвпадат, чатът ви е сигурен';

  @override
  String get scanToVerify => 'Сканирайте за проверка';

  @override
  String get reportSpam => 'Докладване на спам';

  @override
  String get reportSpamSubtitle => 'Докладвайте този контакт като спам';

  @override
  String get reportSpamDescription =>
      'Това ще докладва анонимно този контакт. Вашата самоличност няма да бъде споделена. Сигурни ли сте?';

  @override
  String get report => 'Докладване';

  @override
  String get spamReported => 'Спамът е докладван';

  @override
  String get reportError =>
      'Неуспешно изпращане на доклад. Моля, опитайте отново.';

  @override
  String get reportRateLimited =>
      'Достигнахте максималния брой доклади за днес.';

  @override
  String get blockContact => 'Блокиране на контакт';

  @override
  String get blockContactDescription =>
      'Този контакт няма да може да ви изпраща съобщения или да ви се обажда. Няма да бъде уведомен.';

  @override
  String get unblockContact => 'Деблокиране на контакт';

  @override
  String get unblockContactDescription =>
      'Този контакт ще може отново да ви изпраща съобщения и да ви се обажда.';

  @override
  String get contactBlocked => 'Контактът е блокиран';

  @override
  String get contactUnblocked => 'Контактът е деблокиран';

  @override
  String get contactIsBlocked => 'Този контакт е блокиран';

  @override
  String get unblock => 'Деблокиране';

  @override
  String get deleteContactSubtitle => 'Изтриване на този контакт и чат';

  @override
  String get confirmWithPin => 'Потвърдете с PIN';

  @override
  String get enterPinToConfirm =>
      'Въведете PIN-а си, за да потвърдите това действие';

  @override
  String get profilePhoto => 'Профилна снимка';

  @override
  String get takePhoto => 'Направете снимка';

  @override
  String get chooseFromGallery => 'Изберете от галерия';

  @override
  String get removePhoto => 'Премахване на снимка';

  @override
  String get viewContactHashId => 'Преглед на идентификатора на контакта';

  @override
  String get hashIdPartiallyMasked =>
      'Частично маскиран за вашата сигурност и поверителността на контакта ви';

  @override
  String get addFirstContact => 'Добавете първия си контакт';

  @override
  String get addFirstContactSubtitle =>
      'Споделете вашия QR код или сканирайте този на приятел';

  @override
  String get directory => 'Указател';

  @override
  String get noContacts => 'Няма контакти';

  @override
  String get noContactsSubtitle => 'Добавете контакт, за да започнете';

  @override
  String get sendMessageAction => 'Изпращане на съобщение';

  @override
  String get audioCall => 'Аудио обаждане';

  @override
  String get videoCall => 'Видео обаждане';

  @override
  String get viewProfile => 'Преглед на профил';

  @override
  String get deleteContactDirectory => 'Изтриване на контакт';

  @override
  String get scanShort => 'Сканиране';

  @override
  String get addShort => 'Добавяне';

  @override
  String deleteContactConfirmName(String name) {
    return 'Сигурни ли сте, че искате да изтриете $name?';
  }

  @override
  String get noNotesTitle => 'Без бележки';

  @override
  String get noNotesSubtitle => 'Създайте първата си бележка';

  @override
  String get newNote => 'Нова бележка';

  @override
  String get editNote => 'Редактиране на бележка';

  @override
  String get deleteNote => 'Изтриване на бележка';

  @override
  String get deleteNoteConfirm =>
      'Сигурни ли сте, че искате да изтриете тази бележка?';

  @override
  String get noteTitle => 'Заглавие';

  @override
  String get noteContent => 'Съдържание';

  @override
  String get addItem => 'Добавяне на елемент';

  @override
  String get pinNote => 'Закачане';

  @override
  String get unpinNote => 'Откачане';

  @override
  String get noteColor => 'Цвят';

  @override
  String get notePassword => 'Парола';

  @override
  String get setPassword => 'Задаване на парола';

  @override
  String get changePassword => 'Промяна на парола';

  @override
  String get removePassword => 'Премахване на парола';

  @override
  String get enterPassword => 'Въведете парола';

  @override
  String get confirmPassword => 'Потвърдете парола';

  @override
  String get passwordPin => 'PIN код';

  @override
  String get passwordText => 'Текстова парола';

  @override
  String get protectedNote => 'Защитена бележка';

  @override
  String get incorrectPassword => 'Грешна парола';

  @override
  String get passwordSet => 'Паролата е зададена';

  @override
  String get passwordRemoved => 'Паролата е премахната';

  @override
  String get notesBiometric => 'Face ID за бележки';

  @override
  String get notesBiometricSubtitle =>
      'Изисква биометрична автентикация за отваряне на защитени бележки';

  @override
  String get textNote => 'Текстова бележка';

  @override
  String get checklistNote => 'Списък за отметки';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total задачи';
  }

  @override
  String get autoSaved => 'Запазено';

  @override
  String get searchNotes => 'Търсене на бележки';

  @override
  String get legalConsent => 'Правно съгласие';

  @override
  String get confirmAge13 => 'Потвърждавам, че съм на поне 13 години';

  @override
  String get acceptLegalStart => 'Приемам ';

  @override
  String get privacyPolicy => 'Политика за поверителност';

  @override
  String get termsOfService => 'Условия за ползване';

  @override
  String get andThe => ' и ';

  @override
  String get continueButton => 'Продължаване';

  @override
  String get mustAcceptTerms =>
      'Трябва да приемете и двете условия, за да продължите';

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
  String get support => 'Поддръжка';

  @override
  String get contactSupport => 'Свържете се с поддръжката';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Докладване на злоупотреба';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Правна информация';

  @override
  String get legalEntity => 'Юридическо лице';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Закачане';

  @override
  String get unpinConversation => 'Откачане';

  @override
  String get hideConversation => 'Премахване от списъка';

  @override
  String get deleteConversation => 'Изтриване на разговор';

  @override
  String get deleteConversationConfirm =>
      'Въведете PIN-а си, за да потвърдите изтриването на всички съобщения';

  @override
  String get noConversations => 'Все още няма разговори';

  @override
  String get startConversation => 'Начало';

  @override
  String get microphonePermissionRequired => 'Необходим е достъп до микрофон';

  @override
  String get microphonePermissionExplanation =>
      'Hash се нуждае от микрофон, за да осъществява обаждания.';

  @override
  String get cameraPermissionExplanation =>
      'Hash се нуждае от камера за видео обаждания.';

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
  String get openSettings => 'Отваряне на настройки';

  @override
  String get callConnecting => 'Свързване...';

  @override
  String get callRinging => 'Звъни...';

  @override
  String get callReconnecting => 'Повторно свързване...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Повторно свързване ($secondsс)';
  }

  @override
  String get callPaused => 'На пауза';

  @override
  String get callPausedSubtitle => 'Обаждането все още е активно';

  @override
  String get callRemoteMicMuted => 'Микрофонът на контакта е заглушен';

  @override
  String get callMiniControlsMute => 'Заглушаване';

  @override
  String get callMiniControlsUnmute => 'Включване';

  @override
  String get callMiniControlsHangUp => 'Затваряне';

  @override
  String get callMiniControlsReturn => 'Връщане към обаждането';

  @override
  String get callNetworkPoor => 'Нестабилна връзка';

  @override
  String get callNetworkLost => 'Загубена връзка';

  @override
  String get callEndedTitle => 'Обаждането приключи';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Данни на устройството';

  @override
  String get deviceDataSubtitle => 'Локално и сървърно хранилище';

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
  String get localStorage => 'Локално хранилище';

  @override
  String get onThisDevice => 'на това устройство';

  @override
  String get encryptedDatabases => 'Криптирани бази данни';

  @override
  String get files => 'Файлове';

  @override
  String get secureKeychain => 'Сигурен ключодържател';

  @override
  String get cache => 'Кеш';

  @override
  String get contactsDetail => 'Имена, аватари, Signal ключове';

  @override
  String get messagesDetail => 'Криптирани разговори';

  @override
  String get notesDetail => 'Лични бележки';

  @override
  String get signalSessions => 'Signal сесии';

  @override
  String get signalSessionsDetail => 'Сесии за криптиране';

  @override
  String get pendingContacts => 'Чакащи контакти';

  @override
  String get pendingContactsDetail => 'Чакащи заявки';

  @override
  String get callHistory => 'Обаждания';

  @override
  String get callHistoryDetail => 'История на обажданията';

  @override
  String get preferences => 'Предпочитания';

  @override
  String get preferencesDetail => 'Предпочитания за медия и обаждания';

  @override
  String get avatars => 'Аватари';

  @override
  String get media => 'Медия';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      one: '1 файл',
      zero: 'няма файлове',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Активен';

  @override
  String get notDefined => 'Не е определено';

  @override
  String get biometrics => 'Биометрия';

  @override
  String get recoveryPhrase => 'Фраза за възстановяване';

  @override
  String get identity => 'Идентичност (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol ключове';

  @override
  String get authTokens => 'Токени за удостоверяване';

  @override
  String get contactNamesCache => 'Кеш на имена на контакти';

  @override
  String get remoteConfig => 'Отдалечена конфигурация';

  @override
  String get notificationPrefs => 'Предпочитания за известия';

  @override
  String get serverData => 'Сървърни данни';

  @override
  String get serverDataInfo =>
      'Hash съхранява минимум данни на сървъра, всички криптирани или временни.';

  @override
  String get serverProfile => 'Профил';

  @override
  String get serverProfileDetail =>
      'Hash ID, публични ключове, токен на пощенска кутия';

  @override
  String get serverPrekeys => 'Предварителни ключове';

  @override
  String get serverPrekeysDetail => 'Еднократни Signal ключове (използвани)';

  @override
  String get serverMessages => 'Съобщения в транзит';

  @override
  String get serverMessagesDetail => 'Изтрити след доставка (макс. 24ч)';

  @override
  String get serverMedia => 'Медия в транзит';

  @override
  String get serverMediaDetail => 'Изтрита след изтегляне';

  @override
  String get serverContactRequests => 'Заявки за контакт';

  @override
  String get serverContactRequestsDetail => 'Изтичат след 24ч';

  @override
  String get serverRateLimits => 'Ограничения на скоростта';

  @override
  String get serverRateLimitsDetail => 'Временни данни срещу злоупотреба';

  @override
  String get privacyReassurance =>
      'Hash не може да чете вашите съобщения. Всички данни са криптирани от край до край. Сървърните данни се изтриват автоматично.';

  @override
  String get pinTooSimple =>
      'Този PIN е твърде прост. Изберете по-сигурен код.';

  @override
  String get genericError => 'Възникна грешка. Моля, опитайте отново.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Не може да се създаде акаунт: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Фразата е копирана в клипборда';

  @override
  String get copyPhrase => 'Копиране на фраза';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Запишете тази фраза на сигурно място. Ако загубите PIN-а си без тази фраза, ще загубите достъп до данните си завинаги.';

  @override
  String get noMessages => 'Без съобщения';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Изтриване на всички съобщения с $name?';
  }

  @override
  String get confirmation => 'Потвърждение';

  @override
  String get untitled => 'Без заглавие';

  @override
  String get noSessions => 'Без сесии';

  @override
  String get unknownContact => 'Неизвестен контакт';

  @override
  String get unnamed => 'Без име';

  @override
  String get noPendingRequestsAlt => 'Няма чакащи заявки';

  @override
  String get deleteAllCallHistory =>
      'Изтриване на цялата история на обажданията?';

  @override
  String get noCalls => 'Без обаждания';

  @override
  String get noPreferences => 'Без предпочитания';

  @override
  String get resetAllMediaPrefs => 'Нулиране на всички медийни предпочитания?';

  @override
  String get deleteThisAvatar => 'Изтриване на този аватар?';

  @override
  String get deleteAllAvatars => 'Изтриване на всички аватари?';

  @override
  String get noAvatars => 'Без аватари';

  @override
  String get deleteThisFile => 'Изтриване на този файл?';

  @override
  String get deleteAllMediaFiles => 'Изтриване на всички медии?';

  @override
  String get noMediaFiles => 'Без медии';

  @override
  String get outgoing => 'Изходящо';

  @override
  String get incoming => 'Входящо';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Ефемерен преглед: $secondsс';
  }

  @override
  String get normalView => 'Нормален преглед';

  @override
  String get callReasonCompleted => 'Завършено';

  @override
  String get callReasonMissed => 'Пропуснато';

  @override
  String get callReasonDeclined => 'Отхвърлено';

  @override
  String get callReasonFailed => 'Неуспешно';

  @override
  String get justNow => 'Току-що';

  @override
  String timeAgoMinutes(int count) {
    return 'преди $count мин';
  }

  @override
  String timeAgoHours(int count) {
    return 'преди $countч';
  }

  @override
  String timeAgoDays(int count) {
    return 'преди $countд';
  }

  @override
  String get messageTypeContact => 'Контакт';

  @override
  String get messageTypeLocation => 'Местоположение';

  @override
  String get statusQueued => 'На опашка';

  @override
  String get blockedBadge => 'Блокиран';

  @override
  String get protectedBadge => 'Защитен';

  @override
  String messageCount(int count) {
    return '$count съобщение(я)';
  }

  @override
  String get deleteQuestion => 'Изтриване?';

  @override
  String get transferMyAccountTitle => 'Прехвърляне на акаунта ми';

  @override
  String get loadingError => 'Грешка при зареждане';

  @override
  String get transferToNewDevice => 'Прехвърляне на ново устройство';

  @override
  String get transferInstructions =>
      'На новото си устройство изберете \"Възстановяване на акаунта ми\" и въведете тази информация:';

  @override
  String get yourHashIdLabel => 'Вашият Hash ID';

  @override
  String get enterYourPinCode => 'Въведете вашия PIN код';

  @override
  String get pinOwnerConfirmation =>
      'За да потвърдите, че сте собственикът на този акаунт';

  @override
  String get scanThisQrCode => 'Сканирайте този QR код';

  @override
  String get withYourNewDevice => 'С новото си устройство';

  @override
  String get orEnterTheCode => 'или въведете кода';

  @override
  String get transferCodeLabel => 'Код за прехвърляне';

  @override
  String get proximityVerification => 'Проверка на близост';

  @override
  String get bringDevicesCloser => 'Доближете двете устройства';

  @override
  String get confirmTransferQuestion => 'Потвърждаване на прехвърлянето?';

  @override
  String get accountWillBeTransferred =>
      'Акаунтът ви ще бъде прехвърлен на новото устройство.\n\nТова устройство ще бъде трайно изключено.';

  @override
  String get transferComplete => 'Прехвърлянето е завършено';

  @override
  String get transferSuccessMessage =>
      'Акаунтът ви е успешно прехвърлен.\n\nТова приложение ще се затвори сега.';

  @override
  String get manualVerification => 'Ръчна проверка';

  @override
  String get codeDisplayedOnBothDevices => 'Код, показан на двете устройства:';

  @override
  String get doesCodeMatchNewDevice =>
      'Този код съвпада ли с този на новото устройство?';

  @override
  String get verifiedStatus => 'Потвърдено';

  @override
  String get inProgressStatus => 'В процес...';

  @override
  String get notAvailableStatus => 'Не е налично';

  @override
  String get codeExpiredRestart => 'Кодът е изтекъл. Моля, започнете отначало.';

  @override
  String get codesDoNotMatchCancelled =>
      'Кодовете не съвпадат. Прехвърлянето е отменено.';

  @override
  String transferToDevice(String device) {
    return 'Към: $device';
  }

  @override
  String get copiedExclamation => 'Копирано!';

  @override
  String expiresInTime(String time) {
    return 'Изтича след $time';
  }

  @override
  String get biometricNotAvailable =>
      'Биометрията не е налична на това устройство';

  @override
  String get biometricAuthError => 'Грешка при биометрична автентикация';

  @override
  String get authenticateForBiometric =>
      'Моля, удостоверете се, за да активирате биометрията';

  @override
  String get biometricAuthFailed => 'Биометричната автентикация е неуспешна';

  @override
  String get forceUpdateTitle => 'Необходимо е обновяване';

  @override
  String get forceUpdateMessage =>
      'Налична е нова версия на Hash. Моля, обновете, за да продължите.';

  @override
  String get updateButton => 'Обновяване';

  @override
  String get maintenanceInProgress => 'Поддръжка в ход';

  @override
  String get tryAgainLater => 'Моля, опитайте отново по-късно';

  @override
  String get information => 'Информация';

  @override
  String get later => 'По-късно';

  @override
  String get doYouLikeHash => 'Харесвате ли Hash?';

  @override
  String get yourFeedbackHelps =>
      'Вашата обратна връзка ни помага да подобрим приложението';

  @override
  String get ratingTerrible => 'Ужасно';

  @override
  String get ratingBad => 'Лошо';

  @override
  String get ratingOk => 'Нормално';

  @override
  String get ratingGood => 'Добре';

  @override
  String get ratingExcellent => 'Отлично!';

  @override
  String get donationMessage =>
      'Hash е нестопански проект. Вашата подкрепа ни помага да продължим да изграждаме наистина частен месинджър.';

  @override
  String get recentConnections => 'Скорошни връзки';

  @override
  String get loginInfoText =>
      'Всяко отключване с PIN се записва локално. Само последните 24 часа се пазят.';

  @override
  String get connectionCount => 'Връзка(и)';

  @override
  String get periodLabel => 'Период';

  @override
  String get historyLabel => 'История';

  @override
  String get noLoginRecorded => 'Няма записано влизане';

  @override
  String get nextUnlocksAppearHere =>
      'Следващите отключвания ще се появят тук.';

  @override
  String get dataLocalOnly =>
      'Тези данни се съхраняват само на вашето устройство и никога не се предават.';

  @override
  String get currentSession => 'Текуща';

  @override
  String get todayLabel => 'Днес';

  @override
  String get yesterdayLabel => 'Вчера';

  @override
  String get justNowLabel => 'Току-що';

  @override
  String minutesAgoLabel(int count) {
    return 'Преди $count мин';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Преди $hoursч';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Преди $hoursч $minutesмин';
  }

  @override
  String get noMaintenancePlanned => 'Няма планирана поддръжка';

  @override
  String get everythingWorkingNormally => 'Всичко работи нормално';

  @override
  String get maintenanceTitle => 'Поддръжка';

  @override
  String get maintenanceActiveLabel => 'В ХОД';

  @override
  String get maintenancePlannedLabel => 'ПЛАНИРАНА';

  @override
  String get locking => 'Заключване...';

  @override
  String get newMessageNotification => 'Ново съобщение';

  @override
  String get secExplainTitle => 'Как Hash ви защитава';

  @override
  String get secExplainIntro =>
      'Hash е проектиран така, че никой да не може да чете вашите съобщения.';

  @override
  String get secExplainIntroSub =>
      'Дори ние.\nЕто как работи, обяснено просто.';

  @override
  String get secJourneyLabel => 'ПЪТЕШЕСТВИЕТО';

  @override
  String get secJourneyTitle => 'Пътешествието на вашето съобщение';

  @override
  String get secJourneySubtitle =>
      'От пръста ви до екрана на контакта ви, всяка стъпка е защитена. Следвайте пътя.';

  @override
  String get secStep1Title => 'Пишете съобщението си';

  @override
  String get secStep1Desc =>
      'Въвеждате \"Здравей!\" в приложението. В този момент съобщението съществува само в паметта на телефона ви. Нищо не е изпратено.';

  @override
  String get secStep2Title => 'Криптиране със Signal Protocol';

  @override
  String get secStep2Desc =>
      'Веднага щом натиснете \"Изпрати\", съобщението ви се трансформира в низ от неразбираеми символи. Сякаш съобщението ви е заключено в сейф, за който само контактът ви има ключ.';

  @override
  String get secStep3Title => 'Sealed Sender: невидимият плик';

  @override
  String get secStep3Desc =>
      'Представете си, че изпращате писмо по пощата, но без обратен адрес на плика. Точно това прави Hash. Съобщението се пуска в анонимна пощенска кутия. Сървърът не знае кой го е изпратил.';

  @override
  String get secStep4Title => 'Сървърът не вижда нищо';

  @override
  String get secStep4Desc =>
      'Сървърът действа като сляп пощальон. Той знае само, че \"някой е пуснал нещо в пощенска кутия #A7X9\". Не знае кой го е изпратил, какво е или за кого е.';

  @override
  String get secStep4Highlight =>
      'Не се съхраняват метаданни: нито IP адрес, нито времева марка, нито връзка между изпращач и получател.';

  @override
  String get secStep5Title => 'Контактът ви получава съобщението';

  @override
  String get secStep5Desc =>
      'Телефонът на контакта ви извлича съдържанието от анонимната им пощенска кутия и дешифрира съобщението с частния им ключ, който никога не е напускал устройството им. \"Здравей!\" се появява на екрана им.';

  @override
  String get secStep6Title => 'Съобщението изчезва от сървъра';

  @override
  String get secStep6Desc =>
      'Веднага щом контактът ви потвърди получаването, сървърът изтрива съобщението завинаги. Без кошче, без архив, без резервно копие. Дори непрочетените съобщения се унищожават автоматично след 24 часа.';

  @override
  String get secStep7Title => 'Локално изтичане';

  @override
  String get secStep7Desc =>
      'На телефона на контакта ви съобщението се самоунищожава според продължителността, която сте избрали: веднага след прочитане, 5 минути, 1 час... вие решавате.';

  @override
  String get secJourneyConclusion =>
      'Резултат: нулева следа на сървъра, нулева следа на устройствата. Съобщението е съществувало само достатъчно дълго, за да бъде прочетено, след което е изчезнало.';

  @override
  String get secArchLabel => 'АРХИТЕКТУРА';

  @override
  String get secArchTitle => '5 слоя защита';

  @override
  String get secArchSubtitle =>
      'Hash не разчита на една технология. Всеки слой укрепва останалите. Дори ако един слой е компрометиран, данните ви остават защитени.';

  @override
  String get secLayer1Title => 'Криптиране от край до край';

  @override
  String get secLayer1Desc =>
      'Всяко съобщение е криптирано с уникален ключ. С прости думи: дори ако някой декриптира едно съобщение, няма да може да декриптира следващото. Всяко съобщение има собствена ключалка.';

  @override
  String get secLayer1Detail =>
      'За файлове (снимки, видеоклипове, документи) Hash използва допълнително AES-256-GCM криптиране. Файлът се криптира, преди да напусне телефона ви.';

  @override
  String get secLayer2Title => 'Sealed Sender (мрежова анонимност)';

  @override
  String get secLayer2Desc =>
      'Обичайните месинджъри изпращат съобщенията ви с вашата идентичност прикачена. Сякаш пишете името си на плика. Hash използва анонимни пощенски кутии: сървърът доставя съобщението, без да знае кой го е изпратил.';

  @override
  String get secLayer2Detail =>
      'Резултат: дори в случай на пробив в данните на сървъра, е невъзможно да се възстанови кой с кого говори.';

  @override
  String get secLayer3Title => 'Автоматично изтриване';

  @override
  String get secLayer3Desc =>
      'Съобщенията се изтриват от сървъра веднага след потвърждение на получаването. Дори ако съобщение никога не е извлечено, то се унищожава автоматично след 24 часа.';

  @override
  String get secLayer3Detail =>
      'На телефона ви съобщенията се самоунищожават според продължителността, която изберете: веднага, 5 мин, 15 мин, 30 мин, 1ч, 3ч, 6ч или 12ч.';

  @override
  String get secLayer4Title => 'Локална защита на достъпа';

  @override
  String get secLayer4Desc =>
      'Приложението е защитено с 6-цифрен PIN и/или биометрия (Face ID, пръстов отпечатък). След твърде много неуспешни опити приложението се заключва с нарастващо забавяне след всеки неуспех.';

  @override
  String get secLayer5Title => 'Заключена база данни';

  @override
  String get secLayer5Desc =>
      'От страна на сървъра никой потребител не може да пише директно в базата данни. Всички действия преминават през сигурни функции, които проверяват всяка заявка.';

  @override
  String get secLayer5Detail =>
      'Това е като банков гише: никога не докосвате трезора сами. Правите заявка и системата проверява дали имате право, преди да действа.';

  @override
  String get secVashLabel => 'УНИКАЛНО В СВЕТА';

  @override
  String get secVashTitle => 'Режим Vash';

  @override
  String get secVashSubtitle =>
      'Система за аварийна сигурност, която не съществува в нито едно друго приложение за съобщения.';

  @override
  String get secVashScenarioTitle => 'Представете си тази ситуация';

  @override
  String get secVashScenario1 => 'Някой получава достъп до телефона ви';

  @override
  String get secVashScenario2 => 'Поискан ви е PIN кодът';

  @override
  String get secVashScenario3 => 'Искате спешно да изтриете всички данни';

  @override
  String get secVashSolutionTitle => 'Решението: два PIN кода';

  @override
  String get secVashSolutionDesc =>
      'Конфигурирате два различни PIN кода в Hash:';

  @override
  String get secVashNormalCodeLabel => 'Нормален код';

  @override
  String get secVashNormalCodeDesc =>
      'Отваря приложението нормално с всичките ви данни';

  @override
  String get secVashCodeLabel2 => 'Vash код';

  @override
  String get secVashCodeDescription =>
      'Отваря приложението нормално... но всичките ви данни се изтриват тихо на заден план';

  @override
  String get secVashWhatHappensTitle => 'Какво се случва след това';

  @override
  String get secVashWhatHappensDesc =>
      'Приложението се отваря нормално. Без предупреждение, без подозрителна анимация. Екранът просто показва празно приложение, сякаш току-що сте го инсталирали.\n\nВ действителност всички ваши разговори, контакти и съобщения са необратимо изтрити за части от секундата.';

  @override
  String get secCallsLabel => 'ОБАЖДАНИЯ И ФАЙЛОВЕ';

  @override
  String get secCallsTitle => 'Всичко е криптирано';

  @override
  String get secCallsSubtitle =>
      'Не само съобщенията. Абсолютно всичко, което преминава през Hash, е криптирано от край до край.';

  @override
  String get secAudioCallTitle => 'Аудио обаждания';

  @override
  String get secAudioCallDesc =>
      'Криптирани от край до край чрез WebRTC. Гласът се предава директно между устройствата.';

  @override
  String get secVideoCallTitle => 'Видео обаждания';

  @override
  String get secVideoCallDesc =>
      'Същата технология, всеки поток криптиран поотделно.';

  @override
  String get secPhotosTitle => 'Снимки и видеоклипове';

  @override
  String get secPhotosDesc =>
      'Криптирани с AES-256-GCM преди да напуснат телефона ви.';

  @override
  String get secDocsTitle => 'Документи';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, всеки файл. Име, размер и съдържание — криптирани.';

  @override
  String get secAnonLabel => 'АНОНИМНОСТ';

  @override
  String get secAnonTitle => 'Не е необходима идентичност';

  @override
  String get secAnonSubtitle =>
      'Hash никога не пита за телефонен номер или имейл. Идентифицирани сте чрез уникален и анонимен Hash ID.';

  @override
  String get secHashIdTitle => 'Вашият Hash ID';

  @override
  String get secHashIdDesc =>
      'Това е вашият уникален идентификатор. Той не разкрива нищо за вас: нито името ви, нито номера ви, нито местоположението ви. Все едно псевдоним, който е невъзможно да се свърже с истинската ви самоличност.\n\nЗа да добавите контакт, споделяте вашия Hash ID или сканирате QR код. Толкова. Без синхронизиран адресник, без предложения \"Хора, които може да познавате\".';

  @override
  String get secDataLabel => 'ДАННИ';

  @override
  String get secDataTitle => 'Какво Hash не знае';

  @override
  String get secDataSubtitle =>
      'Най-добрият начин да защитите данните си е да не ги събирате.';

  @override
  String get secNeverCollected => 'Никога не се събират';

  @override
  String get secNeverItem1 => 'Съдържание на съобщения';

  @override
  String get secNeverItem2 => 'Списък с контакти';

  @override
  String get secNeverItem3 => 'Телефонен номер';

  @override
  String get secNeverItem4 => 'Имейл адрес';

  @override
  String get secNeverItem5 => 'IP адрес';

  @override
  String get secNeverItem6 => 'Местоположение';

  @override
  String get secNeverItem7 => 'Метаданни (кой с кого говори)';

  @override
  String get secNeverItem8 => 'История на обажданията';

  @override
  String get secNeverItem9 => 'Адресна книга';

  @override
  String get secNeverItem10 => 'Рекламни идентификатори';

  @override
  String get secTempStored => 'Временно съхранявани';

  @override
  String get secTempItem1 => 'Анонимен Hash ID (уникален идентификатор)';

  @override
  String get secTempItem2 => 'Публични ключове за криптиране';

  @override
  String get secTempItem3 => 'Криптирани съобщения в транзит (макс. 24ч)';

  @override
  String get secTempNote =>
      'Дори тези минимални данни не могат да ви идентифицират. Вашият Hash ID не е свързан с никаква лична информация.';

  @override
  String get secFooterTitle => 'Вашата поверителност, вашата свобода';

  @override
  String get secFooterDesc =>
      'Hash използва същите технологии за криптиране като най-взискателните професионални приложения. Вашите съобщения са защитени от математика, не от обещания.';

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
