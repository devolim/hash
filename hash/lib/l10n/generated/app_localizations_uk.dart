// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Жодних слідів. Жодних компромісів.';

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
  String get conversations => 'Чати';

  @override
  String get contacts => 'Контакти';

  @override
  String get noConversation => 'Немає чатів';

  @override
  String get noConversationSubtitle =>
      'Додайте контакт, щоб почати безпечне спілкування';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count очікуваних запитів',
      one: '1 очікуваний запит',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count надісланих запитів очікують',
      one: '1 надісланий запит очікує',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Додати контакт';

  @override
  String get shareApp => 'Поділитися додатком';

  @override
  String get newMessage => 'Нове повідомлення';

  @override
  String get newConversation => 'Надіслати повідомлення';

  @override
  String get settings => 'Налаштування';

  @override
  String get myHashId => 'Мій Hash ID';

  @override
  String get supportHash => 'Підтримати Hash';

  @override
  String get supportHashSubtitle => 'Hash — некомерційний проєкт';

  @override
  String get donate => 'Пожертвувати';

  @override
  String get appearance => 'Зовнішній вигляд';

  @override
  String get theme => 'Тема';

  @override
  String get themeAuto => 'Автоматична';

  @override
  String get themeAutoSubtitle => 'Відповідає системним налаштуванням';

  @override
  String get themeDark => 'Темна';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeRecommendation =>
      'Темна тема рекомендована для кращої конфіденційності';

  @override
  String get language => 'Мова';

  @override
  String get languageAuto => 'Автоматично (система)';

  @override
  String get notifications => 'Сповіщення';

  @override
  String get messages => 'Повідомлення';

  @override
  String get calls => 'Дзвінки';

  @override
  String get vibration => 'Вібрація';

  @override
  String get notificationContent => 'Вміст сповіщень';

  @override
  String get notificationContentFull => 'Показувати все';

  @override
  String get notificationContentFullDesc =>
      'Ім\'я контакту та попередній перегляд повідомлення';

  @override
  String get notificationContentName => 'Лише ім\'я';

  @override
  String get notificationContentNameDesc => 'Показує лише ім\'я контакту';

  @override
  String get notificationContentDiscrete => 'Дискретний';

  @override
  String get notificationContentDiscreteDesc =>
      'Показує лише «Нове повідомлення»';

  @override
  String get security => 'Безпека';

  @override
  String get howHashProtectsYou => 'Як Hash захищає вас';

  @override
  String get howHashProtectsYouSubtitle => 'Зрозумійте свою безпеку';

  @override
  String get accountSecurity => 'Безпека облікового запису';

  @override
  String get accountSecuritySubtitle => 'PIN, біометрія, режим Vash';

  @override
  String get blockScreenshots => 'Блокувати знімки екрана';

  @override
  String get transferDevice => 'Перенести на інший пристрій';

  @override
  String get transferDeviceSubtitle => 'Перенесіть свій обліковий запис';

  @override
  String get pinCode => 'PIN-код';

  @override
  String get changePin => 'Змінити PIN-код';

  @override
  String get currentPin => 'Поточний PIN-код';

  @override
  String get newPin => 'Новий PIN-код';

  @override
  String get confirmPin => 'Підтвердити PIN-код';

  @override
  String get pinChanged => 'PIN-код змінено';

  @override
  String get incorrectPin => 'Невірний PIN';

  @override
  String get pinsDoNotMatch => 'PIN-коди не збігаються';

  @override
  String get autoLock => 'Автоблокування';

  @override
  String get autoLockDelay => 'Затримка блокування';

  @override
  String get autoLockImmediate => 'Негайно';

  @override
  String get autoLockMinute => '1 хвилина';

  @override
  String autoLockMinutes(int count) {
    return '$count хвилин';
  }

  @override
  String get vashCode => 'Код Vash';

  @override
  String get vashModeTitle => 'Режим Vash';

  @override
  String get vashModeExplanation => 'Ваша остання мережа безпеки.';

  @override
  String get vashModeDescription =>
      'Ви оберете другий PIN-код. Якщо вас коли-небудь змусять відкрити Hash, введіть цей код замість звичайного PIN.\n\nДодаток відкриється нормально, але всі ваші розмови та контакти зникнуть.\n\nДля будь-кого, хто дивиться на ваш екран, Hash просто виглядає порожнім — ніби ви ніколи ним не користувалися.';

  @override
  String get vashModeIrreversible => 'Ця дія тиха та незворотна.';

  @override
  String get chooseVashCode => 'Обрати мій код Vash';

  @override
  String get vashCodeInfo =>
      'Другий PIN-код, який відкриває додаток нормально, але порожнім.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Якщо ви введете цей код замість свого PIN:';

  @override
  String get vashDeleteContacts => 'Ваші контакти зникнуть';

  @override
  String get vashDeleteMessages => 'Ваші розмови зникнуть';

  @override
  String get vashDeleteHistory => 'Ваші нотатки зникнуть';

  @override
  String get vashKeepId =>
      'Ваша ідентичність Hash (#XXX-XXX-XXX) залишиться такою ж';

  @override
  String get vashAppearNormal =>
      'Додаток виглядає нормально, але порожнім, як новий. Ця дія незворотна.';

  @override
  String get setupVashCode => 'Налаштувати код Vash';

  @override
  String get modifyVashCode => 'Змінити код Vash';

  @override
  String get currentVashCode => 'Поточний код Vash';

  @override
  String get newVashCode => 'Новий код Vash';

  @override
  String get confirmVashCode => 'Підтвердити код Vash';

  @override
  String get vashCodeConfigured => 'Код Vash налаштовано';

  @override
  String get vashCodeModified => 'Код Vash змінено';

  @override
  String get vashCodeMustDiffer => 'Код Vash повинен відрізнятися від PIN';

  @override
  String get incorrectVashCode => 'Невірний код Vash';

  @override
  String get vashWhatToDelete => 'Що повинен приховати режим Vash?';

  @override
  String get vashDeleteContactsOption => 'Контакти';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Повідомлення';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Нотатки';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Режим Vash активовано';

  @override
  String get vashCreateSubtitle =>
      'Оберіть код, відмінний від вашого основного PIN';

  @override
  String get vashConfirmSubtitle => 'Підтвердіть ваш код Vash';

  @override
  String get pinCodeForEntry => 'PIN-код для входу в додаток';

  @override
  String get vashCodeSection => 'Режим Vash';

  @override
  String get biometric => 'Біометрія';

  @override
  String get biometricUnlock => 'Розблокування відбитком пальця або Face ID';

  @override
  String get enableBiometric => 'Увімкнути біометрію';

  @override
  String get biometricWarningMessage =>
      'Увімкнувши біометрію, ви не зможете використовувати Vash-код для входу в додаток.\n\nVash-код можна буде використати лише якщо біометрія не спрацює (після кількох невдалих спроб).\n\nВи впевнені, що хочете продовжити?';

  @override
  String get understood => 'Зрозуміло';

  @override
  String get shareAppSubtitle => 'Поділіться Hash з близькими';

  @override
  String get share => 'Поділитися';

  @override
  String get danger => 'Небезпека';

  @override
  String get deleteAccount => 'Видалити мій обліковий запис';

  @override
  String get deleteAccountSubtitle => 'Незворотна дія';

  @override
  String get deleteAccountConfirmTitle => 'Видалити мій обліковий запис';

  @override
  String get deleteAccountConfirmMessage =>
      'Ваш обліковий запис буде видалено назавжди. Ця дія незворотна.\n\n• Усі ваші чати\n• Усі ваші контакти\n• Ваш Hash ID\n\nВам потрібно буде створити новий обліковий запис.';

  @override
  String get deleteForever => 'Видалити назавжди';

  @override
  String get cancel => 'Скасувати';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Режим Vash активовано.';

  @override
  String deletionError(String error) {
    return 'Помилка видалення: $error';
  }

  @override
  String get yourSecurity => 'Ваша безпека';

  @override
  String get securityInfo =>
      '• Наскрізне шифрування (Signal Protocol)\n• Жодних даних на наших серверах після доставки\n• Ключі зберігаються лише на вашому пристрої\n• PIN-код ніколи не надсилається на сервер';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Ласкаво просимо';

  @override
  String get securityStatement1 => 'Ваші повідомлення захищені.';

  @override
  String get securityStatement2 => 'Наскрізне шифрування.';

  @override
  String get securityStatement3 => 'Жодних слідів. Жодних компромісів.';

  @override
  String get securityStatement4 => 'Ваша конфіденційність — це право.';

  @override
  String get accessBlocked => 'Доступ заблоковано';

  @override
  String get tooManyAttempts => 'Забагато спроб';

  @override
  String get pleaseWait => 'Будь ласка, зачекайте';

  @override
  String get waitDelay => 'Будь ласка, дочекайтесь закінчення затримки';

  @override
  String attemptCount(int current, int max) {
    return 'Спроба $current з $max';
  }

  @override
  String retryIn(String time) {
    return 'Повторити через $time';
  }

  @override
  String get forgotPin => 'Забули PIN? Використайте фразу відновлення';

  @override
  String get useRecoveryPhrase => 'Використати фразу відновлення';

  @override
  String get recoveryWarningTitle => 'Попередження';

  @override
  String get recoveryWarningMessage => 'Відновлення облікового запису:';

  @override
  String get recoveryDeleteAllMessages => 'Видалить УСІ ваші повідомлення';

  @override
  String get recoveryWaitDelay => 'Потребує 1-годинної затримки';

  @override
  String get recoveryKeepContacts => 'Збереже ваші контакти';

  @override
  String get recoveryIrreversible =>
      'Ця дія незворотна. Ваші повідомлення будуть втрачені назавжди.';

  @override
  String get iUnderstand => 'Я розумію';

  @override
  String get accountRecovery => 'Відновлення облікового запису';

  @override
  String get enterRecoveryPhrase =>
      'Введіть 24 слова вашої фрази відновлення, розділені пробілами.';

  @override
  String get recoveryPhraseHint => 'слово1 слово2 слово3 ...';

  @override
  String get recover => 'Відновити';

  @override
  String get recoveryPhraseRequired =>
      'Будь ласка, введіть вашу фразу відновлення';

  @override
  String get recoveryPhrase24Words => 'Фраза повинна містити рівно 24 слова';

  @override
  String get incorrectRecoveryPhrase => 'Невірна фраза відновлення';

  @override
  String get recoveryInitError => 'Помилка ініціалізації відновлення';

  @override
  String get securityDelay => 'Затримка безпеки';

  @override
  String get securityDelayMessage =>
      'Для вашої безпеки потрібен період очікування перед створенням нового PIN.';

  @override
  String get timeRemaining => 'Залишилося часу';

  @override
  String get messagesDeletedForProtection =>
      'Ваші повідомлення видалено для вашого захисту.';

  @override
  String get canCloseApp => 'Ви можете закрити додаток і повернутися пізніше.';

  @override
  String get onboardingTitle1 => 'Ласкаво просимо до Hash';

  @override
  String get onboardingSubtitle1 => 'Месенджер, який не залишає слідів';

  @override
  String get onboardingTitle2 => 'Повне шифрування';

  @override
  String get onboardingSubtitle2 =>
      'Ваші повідомлення наскрізно зашифровані протоколом Signal';

  @override
  String get onboardingTitle3 => 'Жодних слідів';

  @override
  String get onboardingSubtitle3 =>
      'Повідомлення видаляються з серверів після доставки';

  @override
  String get onboardingTitle4 => 'Ваша безпека';

  @override
  String get onboardingSubtitle4 => 'PIN-код, режим Vash та фраза відновлення';

  @override
  String get getStarted => 'Почати';

  @override
  String get next => 'Далі';

  @override
  String get skip => 'Пропустити';

  @override
  String get alreadyHaveAccount => 'У мене вже є обліковий запис';

  @override
  String get transferMyAccount => 'Перенести мій обліковий запис';

  @override
  String get createPin => 'Створити PIN-код';

  @override
  String get createPinSubtitle => 'Цей код захистить доступ до вашого додатку';

  @override
  String get confirmYourPin => 'Підтвердіть ваш PIN-код';

  @override
  String get confirmPinSubtitle => 'Введіть ваш PIN-код ще раз';

  @override
  String get saveRecoveryPhrase => 'Фраза відновлення';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Запишіть ці 24 слова по порядку. Вони дозволять відновити обліковий запис, якщо ви забудете PIN.';

  @override
  String get phraseWritten => 'Я записав свою фразу';

  @override
  String get warningRecoveryPhrase =>
      'Якщо ви втратите цю фразу і забудете PIN, ви втратите доступ до облікового запису.';

  @override
  String get accountTransferred => 'Обліковий запис перенесено';

  @override
  String get accountTransferredMessage =>
      'Ваш обліковий запис перенесено на інший пристрій. Ця сесія більше не дійсна.';

  @override
  String get accountTransferredInfo =>
      'Якщо ви не ініціювали це перенесення, ваш обліковий запис може бути скомпрометовано.';

  @override
  String get logout => 'Вийти';

  @override
  String get transferAccount => 'Перенесення облікового запису';

  @override
  String get transferAccountInfo =>
      'Перенесіть свій обліковий запис Hash на новий пристрій. Поточна сесія буде анульована.';

  @override
  String get generateTransferCode => 'Згенерувати код перенесення';

  @override
  String get transferCode => 'Код перенесення';

  @override
  String transferCodeExpires(int minutes) {
    return 'Цей код діє $minutes хвилин';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Введіть цей код на вашому новому пристрої для перенесення облікового запису.';

  @override
  String get generateNewCode => 'Згенерувати новий код';

  @override
  String get scanQrCode => 'Сканувати QR code';

  @override
  String get scanQrCodeSubtitle => 'Скануйте QR code контакту, щоб додати його';

  @override
  String get qrCodeDetected => 'QR code виявлено';

  @override
  String get invalidQrCode => 'Недійсний QR code';

  @override
  String get cameraPermissionRequired => 'Потрібен дозвіл камери';

  @override
  String get myQrCode => 'Мій QR code';

  @override
  String get myQrCodeSubtitle =>
      'Поділіться цим QR code, щоб ваші контакти могли вас додати';

  @override
  String get shareQrCode => 'Поділитися';

  @override
  String get addContactTitle => 'Додати контакт';

  @override
  String get addContactByHashId => 'Введіть Hash ID вашого контакту';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Шукати';

  @override
  String get contactNotFound => 'Контакт не знайдено';

  @override
  String get contactAlreadyAdded => 'Цей контакт вже є у вашому списку';

  @override
  String get contactAdded => 'Контакт додано';

  @override
  String get myProfile => 'Мій профіль';

  @override
  String get myProfileSubtitle =>
      'Поділіться цією інформацією, щоб інші могли вас додати';

  @override
  String get temporaryCode => 'Тимчасовий код';

  @override
  String temporaryCodeExpires(String time) {
    return 'Діє ще $time';
  }

  @override
  String get codeExpired => 'Код закінчився';

  @override
  String get generateNewCodeButton => 'Новий код';

  @override
  String get copyHashId => 'Копіювати ID';

  @override
  String get copyCode => 'Копіювати код';

  @override
  String get copiedToClipboard => 'Скопійовано';

  @override
  String get showMyQrCode => 'Показати мій QR code';

  @override
  String get orDivider => 'або';

  @override
  String get openScanner => 'Відкрити сканер';

  @override
  String get addManually => 'Додати вручну';

  @override
  String get contactHashIdLabel => 'Hash ID контакту';

  @override
  String get temporaryCodeLabel => 'Тимчасовий код';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Попросіть контакт згенерувати код із свого профілю';

  @override
  String get verifyAndAdd => 'Перевірити та додати';

  @override
  String get fillAllFields => 'Будь ласка, заповніть усі поля';

  @override
  String get invalidHashIdFormat => 'Невірний формат ID (напр.: 123-456-ABC)';

  @override
  String get userNotFound => 'Користувача не знайдено';

  @override
  String get cannotAddYourself => 'Ви не можете додати себе';

  @override
  String get invalidOrExpiredCode => 'Невірний або прострочений тимчасовий код';

  @override
  String get contactFound => 'Контакт знайдено!';

  @override
  String get howToCallContact => 'Як ви хочете їх називати?';

  @override
  String get contactNameHint => 'Ім\'я контакту';

  @override
  String get addContactButton => 'Додати';

  @override
  String get contactDetails => 'Деталі контакту';

  @override
  String get contactName => 'Ім\'я контакту';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Додано $date';
  }

  @override
  String get deleteContact => 'Видалити контакт';

  @override
  String deleteContactConfirm(Object name) {
    return 'Видалити цей контакт?';
  }

  @override
  String get deleteContactMessage => 'Це також видалить весь чат.';

  @override
  String get delete => 'Видалити';

  @override
  String get typeMessage => 'Введіть повідомлення...';

  @override
  String get messageSent => 'Надіслано';

  @override
  String get messageDelivered => 'Доставлено';

  @override
  String get messageRead => 'Прочитано';

  @override
  String get messageFailed => 'Не вдалося надіслати';

  @override
  String get now => 'Зараз';

  @override
  String minutesAgo(int count) {
    return '$countхв';
  }

  @override
  String hoursAgo(int count) {
    return '$countгод';
  }

  @override
  String daysAgo(int count) {
    return '$countд';
  }

  @override
  String get today => 'Сьогодні';

  @override
  String get yesterday => 'Вчора';

  @override
  String dateAtTime(String date, String time) {
    return '$date о $time';
  }

  @override
  String get shareMessage =>
      'Приєднуйтесь до мене в Hash! 🔒\n\nЦе справді приватний месенджер: повне шифрування, жодних слідів на серверах і режим паніки за потреби.\n\nЗавантажте додаток тут 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Помилка';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Переглянути';

  @override
  String get yes => 'Так';

  @override
  String get no => 'Ні';

  @override
  String get save => 'Зберегти';

  @override
  String get edit => 'Редагувати';

  @override
  String get close => 'Закрити';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get loading => 'Завантаження...';

  @override
  String get retry => 'Повторити';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Очікувані запити';

  @override
  String get noPendingRequests => 'Немає очікуваних запитів';

  @override
  String get pendingRequestsSubtitle => 'Ці люди хочуть вас додати';

  @override
  String requestFromUser(String hashId) {
    return 'Запит від $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Діє ще $days днів';
  }

  @override
  String get acceptRequest => 'Прийняти';

  @override
  String get rejectRequest => 'Відхилити';

  @override
  String get requestAccepted => 'Запит прийнято';

  @override
  String get requestRejected => 'Запит відхилено';

  @override
  String get requestSent => 'Запит надіслано!';

  @override
  String get requestSentSubtitle =>
      'Ваш запит надіслано. Користувач повинен його прийняти, перш ніж ви зможете спілкуватися.';

  @override
  String get requestAlreadyPending => 'Запит вже очікує';

  @override
  String get requestAlreadySentByOther => 'Ця людина вже надіслала вам запит';

  @override
  String get addByHashId => 'Додати за Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Введіть Hash ID контакту та тимчасовий код';

  @override
  String get enterTemporaryCode => 'Введіть 6-значний код';

  @override
  String get sendRequest => 'Надіслати запит';

  @override
  String get acceptContactTitle => 'Прийняти контакт';

  @override
  String get acceptContactSubtitle => 'Ви можете дати їм власне ім\'я';

  @override
  String get leaveEmptyForHashId => 'Залиште порожнім для використання Hash ID';

  @override
  String get firstName => 'Ім\'я';

  @override
  String get lastName => 'Прізвище';

  @override
  String get notes => 'Нотатки';

  @override
  String get notesHint => 'Особисті нотатки про цей контакт';

  @override
  String get photoOptional => 'Фото (необов\'язково)';

  @override
  String get contactNameOptional => 'Ім\'я (необов\'язково)';

  @override
  String get notesOptional => 'Нотатки (необов\'язково)';

  @override
  String get storedLocally => 'Зберігається лише на вашому пристрої';

  @override
  String get encryptedMessageLabel => 'Зашифроване повідомлення';

  @override
  String get identityMessageHint => 'Хто ви? Як ви знаєте одне одного?';

  @override
  String get messageWillBeSentEncrypted =>
      'Це повідомлення буде зашифровано та надіслано одержувачу';

  @override
  String get sendRequestButton => 'Надіслати запит';

  @override
  String get requestExpiresIn24h =>
      'Запит закінчується через 24 год, якщо не прийнято';

  @override
  String get theyAlreadySentYouRequest => 'Ця людина вже надіслала вам запит';

  @override
  String get requests => 'Запити';

  @override
  String get receivedRequests => 'Отримані';

  @override
  String get sentRequests => 'Надіслані';

  @override
  String get noSentRequests => 'Немає надісланих запитів';

  @override
  String get cancelRequest => 'Скасувати';

  @override
  String get deleteRequest => 'Видалити запит';

  @override
  String get requestCancelled => 'Запит скасовано';

  @override
  String sentTo(String hashId) {
    return 'Надіслано до $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Діє ще $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Отримано $time тому';
  }

  @override
  String get messageFromRequester => 'Повідомлення від запитувача';

  @override
  String get copy => 'Копіювати';

  @override
  String get messageInfo => 'Інформація про повідомлення';

  @override
  String get messageDirection => 'Напрямок';

  @override
  String get messageSentByYou => 'Надіслано вами';

  @override
  String get messageReceived => 'Отримано';

  @override
  String get messageSentAt => 'Надіслано о';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Статус';

  @override
  String get messageReadAt => 'Прочитано о';

  @override
  String get messageType => 'Тип';

  @override
  String get messageSize => 'Розмір';

  @override
  String get messageExpiresAt => 'Закінчується о';

  @override
  String get messageEncrypted => 'Наскрізне шифрування';

  @override
  String get messageStatusSending => 'Надсилання...';

  @override
  String get messageStatusSent => 'Надіслано';

  @override
  String get messageStatusDelivered => 'Доставлено';

  @override
  String get messageStatusRead => 'Прочитано';

  @override
  String get messageStatusFailed => 'Не вдалося';

  @override
  String get serverStatus => 'Сервер';

  @override
  String get onServer => 'Очікує доставки';

  @override
  String get deletedFromServer => 'Видалено';

  @override
  String get messageTypeText => 'Текст';

  @override
  String get messageTypeImage => 'Зображення';

  @override
  String get messageTypeVideo => 'Відео';

  @override
  String get messageTypeVoice => 'Голос';

  @override
  String get messageTypeFile => 'Файл';

  @override
  String get indefinitely => 'Безстроково';

  @override
  String get hoursShort => 'год';

  @override
  String get minutesShort => 'хв';

  @override
  String get hours => 'годин';

  @override
  String get minutes => 'хвилин';

  @override
  String get seconds => 'секунд';

  @override
  String get ephemeralMessages => 'Тимчасові повідомлення';

  @override
  String get ephemeralMessagesDescription =>
      'Повідомлення автоматично видаляються після цього часу';

  @override
  String get ephemeralImmediate => 'Негайно (після прочитання)';

  @override
  String get ephemeralImmediateDesc => 'Видаляється одразу після прочитання';

  @override
  String get ephemeralMyPreference => 'Моя перевага';

  @override
  String get ephemeralMyPreferenceDesc =>
      'Використовувати глобальне налаштування';

  @override
  String get ephemeralDefaultSetting => 'Тривалість повідомлення';

  @override
  String get ephemeralChooseDefault => 'Рекомендовано';

  @override
  String get ephemeral30Seconds => '30 секунд';

  @override
  String get ephemeral30SecondsDesc => 'Видалено через 30с після прочитання';

  @override
  String get ephemeral5Minutes => '5 хвилин';

  @override
  String get ephemeral5MinutesDesc => 'Видалено через 5хв після прочитання';

  @override
  String get ephemeral1Hour => '1 година';

  @override
  String get ephemeral1HourDesc => 'Видалено через 1год після прочитання';

  @override
  String get ephemeral3Hours => '3 години';

  @override
  String get ephemeral6Hours => '6 годин';

  @override
  String get ephemeral6HoursDesc => 'Видалено через 6год після прочитання';

  @override
  String get ephemeral12Hours => '12 годин';

  @override
  String get ephemeral24Hours => '24 години';

  @override
  String get ephemeral24HoursDesc => 'Видалено через 24год після прочитання';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Власна тривалість';

  @override
  String get howItWorks => 'Як це працює';

  @override
  String get ephemeralExplanation1 =>
      'Повідомлення видаляються з сервера одразу після отримання.';

  @override
  String get ephemeralExplanation2 =>
      'Це налаштування визначає, коли повідомлення зникають з ВАШОГО телефону після прочитання.';

  @override
  String get ephemeralExplanation3 =>
      'Ваш контакт має власне налаштування для свого телефону.';

  @override
  String get mute1Hour => '1 година';

  @override
  String get mute8Hours => '8 годин';

  @override
  String get mute1Day => '1 день';

  @override
  String get mute1Week => '1 тиждень';

  @override
  String get muteAlways => 'Завжди';

  @override
  String get muteExplanation =>
      'Ви не отримуватимете сповіщення для цього контакту';

  @override
  String get showCallsInRecents => 'Показувати в нещодавніх дзвінках';

  @override
  String get showCallsInRecentsSubtitle =>
      'Дзвінки Hash відображаються в історії телефону';

  @override
  String get feedback => 'Зворотній зв\'язок';

  @override
  String get muteNotifications => 'Вимкнути сповіщення';

  @override
  String get muteDescription =>
      'Ви не отримуватимете сповіщення для цього контакту';

  @override
  String mutedUntil(String time) {
    return 'Вимкнено до $time';
  }

  @override
  String get notMuted => 'Сповіщення увімкнено';

  @override
  String get unmute => 'Увімкнути сповіщення';

  @override
  String get notificationSound => 'Звук сповіщення';

  @override
  String get defaultSound => 'За замовчуванням';

  @override
  String get chatSettings => 'Налаштування чату';

  @override
  String get bubbleColor => 'Колір бульбашки';

  @override
  String get backgroundColor => 'Колір фону';

  @override
  String get backgroundImage => 'Фонове зображення';

  @override
  String get chatBackground => 'Фон чату';

  @override
  String get customColor => 'Власний';

  @override
  String get defaultColor => 'За замовчуванням';

  @override
  String get imageSelected => 'Зображення обрано';

  @override
  String get noImage => 'Без зображення';

  @override
  String get color => 'Колір';

  @override
  String get image => 'Зображення';

  @override
  String get tapToSelectImage => 'Натисніть, щоб обрати зображення';

  @override
  String get changeImage => 'Змінити зображення';

  @override
  String get previewMessageReceived => 'Привіт!';

  @override
  String get previewMessageSent => 'Привіт!';

  @override
  String get messageAction => 'Повідомлення';

  @override
  String get callAction => 'Дзвінок';

  @override
  String get videoAction => 'Відео';

  @override
  String get personalNotes => 'Особисті нотатки';

  @override
  String get addNotes => 'Додати нотатки...';

  @override
  String get noNotes => 'Немає нотаток';

  @override
  String get messageNotifications => 'Сповіщення повідомлень';

  @override
  String get callNotifications => 'Сповіщення дзвінків';

  @override
  String get useGradient => 'Використовувати градієнт';

  @override
  String get gradientStart => 'Початковий колір';

  @override
  String get gradientEnd => 'Кінцевий колір';

  @override
  String get preview => 'Попередній перегляд';

  @override
  String get reset => 'Скинути';

  @override
  String get securityNumber => 'Номер безпеки';

  @override
  String securityNumberDescription(String name) {
    return 'Перевірте, що номер безпеки збігається з пристроєм $name';
  }

  @override
  String get verifyEncryption => 'Перевірити наскрізне шифрування';

  @override
  String get tapToCopy => 'Натисніть, щоб скопіювати';

  @override
  String get howToVerify => 'Як перевірити';

  @override
  String get verifyStep1 =>
      'Зустріньтеся з контактом особисто або зателефонуйте';

  @override
  String get verifyStep2 => 'Порівняйте номери безпеки або скануйте QR code';

  @override
  String get verifyStep3 => 'Якщо вони збігаються, ваш чат захищено';

  @override
  String get scanToVerify => 'Сканувати для перевірки';

  @override
  String get reportSpam => 'Поскаржитися на спам';

  @override
  String get reportSpamSubtitle => 'Повідомити про цей контакт як спам';

  @override
  String get reportSpamDescription =>
      'Це анонімно повідомить про цей контакт. Ваша особистість не буде розкрита. Ви впевнені?';

  @override
  String get report => 'Поскаржитися';

  @override
  String get spamReported => 'Спам повідомлено';

  @override
  String get reportError => 'Не вдалося надіслати скаргу. Спробуйте ще раз.';

  @override
  String get reportRateLimited =>
      'Ви досягли максимальної кількості скарг за сьогодні.';

  @override
  String get blockContact => 'Заблокувати контакт';

  @override
  String get blockContactDescription =>
      'Цей контакт більше не зможе надсилати вам повідомлення або дзвонити. Його не буде повідомлено.';

  @override
  String get unblockContact => 'Розблокувати контакт';

  @override
  String get unblockContactDescription =>
      'Цей контакт знову зможе надсилати вам повідомлення та дзвонити.';

  @override
  String get contactBlocked => 'Контакт заблоковано';

  @override
  String get contactUnblocked => 'Контакт розблоковано';

  @override
  String get contactIsBlocked => 'Цей контакт заблоковано';

  @override
  String get unblock => 'Розблокувати';

  @override
  String get deleteContactSubtitle => 'Видалити цей контакт і чат';

  @override
  String get confirmWithPin => 'Підтвердити PIN-кодом';

  @override
  String get enterPinToConfirm => 'Введіть PIN для підтвердження цієї дії';

  @override
  String get profilePhoto => 'Фото профілю';

  @override
  String get takePhoto => 'Зробити фото';

  @override
  String get chooseFromGallery => 'Обрати з галереї';

  @override
  String get removePhoto => 'Видалити фото';

  @override
  String get viewContactHashId => 'Переглянути ідентифікатор контакту';

  @override
  String get hashIdPartiallyMasked =>
      'Частково приховано для вашої безпеки та конфіденційності контакту';

  @override
  String get addFirstContact => 'Додайте свій перший контакт';

  @override
  String get addFirstContactSubtitle =>
      'Поділіться своїм QR code або скануйте QR code друга';

  @override
  String get directory => 'Довідник';

  @override
  String get noContacts => 'Немає контактів';

  @override
  String get noContactsSubtitle => 'Додайте контакт, щоб почати';

  @override
  String get sendMessageAction => 'Надіслати повідомлення';

  @override
  String get audioCall => 'Аудіодзвінок';

  @override
  String get videoCall => 'Відеодзвінок';

  @override
  String get viewProfile => 'Переглянути профіль';

  @override
  String get deleteContactDirectory => 'Видалити контакт';

  @override
  String get scanShort => 'Сканувати';

  @override
  String get addShort => 'Додати';

  @override
  String deleteContactConfirmName(String name) {
    return 'Ви впевнені, що хочете видалити $name?';
  }

  @override
  String get noNotesTitle => 'Немає нотаток';

  @override
  String get noNotesSubtitle => 'Створіть свою першу нотатку';

  @override
  String get newNote => 'Нова нотатка';

  @override
  String get editNote => 'Редагувати нотатку';

  @override
  String get deleteNote => 'Видалити нотатку';

  @override
  String get deleteNoteConfirm => 'Ви впевнені, що хочете видалити цю нотатку?';

  @override
  String get noteTitle => 'Заголовок';

  @override
  String get noteContent => 'Вміст';

  @override
  String get addItem => 'Додати пункт';

  @override
  String get pinNote => 'Закріпити';

  @override
  String get unpinNote => 'Відкріпити';

  @override
  String get noteColor => 'Колір';

  @override
  String get notePassword => 'Пароль';

  @override
  String get setPassword => 'Встановити пароль';

  @override
  String get changePassword => 'Змінити пароль';

  @override
  String get removePassword => 'Видалити пароль';

  @override
  String get enterPassword => 'Введіть пароль';

  @override
  String get confirmPassword => 'Підтвердіть пароль';

  @override
  String get passwordPin => 'PIN-код';

  @override
  String get passwordText => 'Текстовий пароль';

  @override
  String get protectedNote => 'Захищена нотатка';

  @override
  String get incorrectPassword => 'Невірний пароль';

  @override
  String get passwordSet => 'Пароль встановлено';

  @override
  String get passwordRemoved => 'Пароль видалено';

  @override
  String get notesBiometric => 'Face ID для нотаток';

  @override
  String get notesBiometricSubtitle =>
      'Вимагати біометричну автентифікацію для відкриття захищених нотаток';

  @override
  String get textNote => 'Текстова нотатка';

  @override
  String get checklistNote => 'Чеклист';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total завдань';
  }

  @override
  String get autoSaved => 'Збережено';

  @override
  String get searchNotes => 'Шукати нотатки';

  @override
  String get legalConsent => 'Правова згода';

  @override
  String get confirmAge13 => 'Я підтверджую, що мені принаймні 13 років';

  @override
  String get acceptLegalStart => 'Я приймаю ';

  @override
  String get privacyPolicy => 'Політику конфіденційності';

  @override
  String get termsOfService => 'Умови використання';

  @override
  String get andThe => ' та ';

  @override
  String get continueButton => 'Продовжити';

  @override
  String get mustAcceptTerms =>
      'Ви повинні прийняти обидві умови, щоб продовжити';

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
  String get support => 'Підтримка';

  @override
  String get contactSupport => 'Зв\'язатися з підтримкою';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Повідомити про зловживання';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Юридична інформація';

  @override
  String get legalEntity => 'Юридична особа';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Закріпити';

  @override
  String get unpinConversation => 'Відкріпити';

  @override
  String get hideConversation => 'Видалити зі стрічки';

  @override
  String get deleteConversation => 'Видалити розмову';

  @override
  String get deleteConversationConfirm =>
      'Введіть PIN для підтвердження видалення всіх повідомлень';

  @override
  String get noConversations => 'Ще немає розмов';

  @override
  String get startConversation => 'Почати';

  @override
  String get microphonePermissionRequired => 'Потрібен доступ до мікрофона';

  @override
  String get microphonePermissionExplanation =>
      'Hash потребує мікрофон для здійснення дзвінків.';

  @override
  String get cameraPermissionExplanation =>
      'Hash потребує камеру для відеодзвінків.';

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
  String get openSettings => 'Відкрити налаштування';

  @override
  String get callConnecting => 'З\'єднання...';

  @override
  String get callRinging => 'Виклик...';

  @override
  String get callReconnecting => 'Перепідключення...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Перепідключення ($secondsс)';
  }

  @override
  String get callPaused => 'На паузі';

  @override
  String get callPausedSubtitle => 'Дзвінок ще активний';

  @override
  String get callRemoteMicMuted => 'Мікрофон контакту вимкнено';

  @override
  String get callMiniControlsMute => 'Вимкнути звук';

  @override
  String get callMiniControlsUnmute => 'Увімкнути звук';

  @override
  String get callMiniControlsHangUp => 'Завершити';

  @override
  String get callMiniControlsReturn => 'Повернутися до дзвінка';

  @override
  String get callNetworkPoor => 'Нестабільне з\'єднання';

  @override
  String get callNetworkLost => 'З\'єднання втрачено';

  @override
  String get callEndedTitle => 'Дзвінок завершено';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Дані пристрою';

  @override
  String get deviceDataSubtitle => 'Локальне та серверне сховище';

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
  String get localStorage => 'Локальне сховище';

  @override
  String get onThisDevice => 'на цьому пристрої';

  @override
  String get encryptedDatabases => 'Зашифровані бази даних';

  @override
  String get files => 'Файли';

  @override
  String get secureKeychain => 'Захищений зв\'язок ключів';

  @override
  String get cache => 'Кеш';

  @override
  String get contactsDetail => 'Імена, аватари, ключі Signal';

  @override
  String get messagesDetail => 'Зашифровані розмови';

  @override
  String get notesDetail => 'Особисті нотатки';

  @override
  String get signalSessions => 'Сесії Signal';

  @override
  String get signalSessionsDetail => 'Сесії шифрування';

  @override
  String get pendingContacts => 'Очікувані контакти';

  @override
  String get pendingContactsDetail => 'Очікувані запити';

  @override
  String get callHistory => 'Дзвінки';

  @override
  String get callHistoryDetail => 'Історія дзвінків';

  @override
  String get preferences => 'Налаштування';

  @override
  String get preferencesDetail => 'Налаштування медіа та дзвінків';

  @override
  String get avatars => 'Аватари';

  @override
  String get media => 'Медіа';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файлів',
      one: '1 файл',
      zero: 'немає файлів',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Активний';

  @override
  String get notDefined => 'Не визначено';

  @override
  String get biometrics => 'Біометрія';

  @override
  String get recoveryPhrase => 'Фраза відновлення';

  @override
  String get identity => 'Ідентичність (Hash ID)';

  @override
  String get signalKeys => 'Ключі Signal Protocol';

  @override
  String get authTokens => 'Токени автентифікації';

  @override
  String get contactNamesCache => 'Кеш імен контактів';

  @override
  String get remoteConfig => 'Віддалена конфігурація';

  @override
  String get notificationPrefs => 'Налаштування сповіщень';

  @override
  String get serverData => 'Дані сервера';

  @override
  String get serverDataInfo =>
      'Hash зберігає мінімум даних на сервері, все зашифровано або тимчасове.';

  @override
  String get serverProfile => 'Профіль';

  @override
  String get serverProfileDetail =>
      'Hash ID, публічні ключі, токен поштової скриньки';

  @override
  String get serverPrekeys => 'Пре-ключі';

  @override
  String get serverPrekeysDetail => 'Одноразові ключі Signal (використані)';

  @override
  String get serverMessages => 'Повідомлення в транзиті';

  @override
  String get serverMessagesDetail =>
      'Видаляються після доставки (макс. 24 год)';

  @override
  String get serverMedia => 'Медіа в транзиті';

  @override
  String get serverMediaDetail => 'Видаляється після завантаження';

  @override
  String get serverContactRequests => 'Запити контактів';

  @override
  String get serverContactRequestsDetail => 'Закінчуються через 24 год';

  @override
  String get serverRateLimits => 'Обмеження частоти';

  @override
  String get serverRateLimitsDetail => 'Тимчасові дані проти зловживань';

  @override
  String get privacyReassurance =>
      'Hash не може читати ваші повідомлення. Усі дані наскрізно зашифровані. Серверні дані автоматично видаляються.';

  @override
  String get pinTooSimple =>
      'Цей PIN занадто простий. Оберіть більш надійний код.';

  @override
  String get genericError => 'Сталася помилка. Спробуйте ще раз.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Не вдалося створити обліковий запис: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Фразу скопійовано в буфер обміну';

  @override
  String get copyPhrase => 'Копіювати фразу';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Запишіть цю фразу в безпечному місці. Якщо ви втратите PIN без цієї фрази, ви назавжди втратите доступ до своїх даних.';

  @override
  String get noMessages => 'Немає повідомлень';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Видалити всі повідомлення з $name?';
  }

  @override
  String get confirmation => 'Підтвердження';

  @override
  String get untitled => 'Без назви';

  @override
  String get noSessions => 'Немає сесій';

  @override
  String get unknownContact => 'Невідомий контакт';

  @override
  String get unnamed => 'Без імені';

  @override
  String get noPendingRequestsAlt => 'Немає очікуваних запитів';

  @override
  String get deleteAllCallHistory => 'Видалити всю історію дзвінків?';

  @override
  String get noCalls => 'Немає дзвінків';

  @override
  String get noPreferences => 'Немає налаштувань';

  @override
  String get resetAllMediaPrefs => 'Скинути всі налаштування медіа?';

  @override
  String get deleteThisAvatar => 'Видалити цей аватар?';

  @override
  String get deleteAllAvatars => 'Видалити всі аватари?';

  @override
  String get noAvatars => 'Немає аватарів';

  @override
  String get deleteThisFile => 'Видалити цей файл?';

  @override
  String get deleteAllMediaFiles => 'Видалити всі медіа?';

  @override
  String get noMediaFiles => 'Немає медіа';

  @override
  String get outgoing => 'Вихідний';

  @override
  String get incoming => 'Вхідний';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Тимчасовий перегляд: $secondsс';
  }

  @override
  String get normalView => 'Звичайний перегляд';

  @override
  String get callReasonCompleted => 'Завершено';

  @override
  String get callReasonMissed => 'Пропущено';

  @override
  String get callReasonDeclined => 'Відхилено';

  @override
  String get callReasonFailed => 'Не вдалося';

  @override
  String get justNow => 'Щойно';

  @override
  String timeAgoMinutes(int count) {
    return '$count хв тому';
  }

  @override
  String timeAgoHours(int count) {
    return '$countгод тому';
  }

  @override
  String timeAgoDays(int count) {
    return '$countд тому';
  }

  @override
  String get messageTypeContact => 'Контакт';

  @override
  String get messageTypeLocation => 'Місцезнаходження';

  @override
  String get statusQueued => 'У черзі';

  @override
  String get blockedBadge => 'Заблоковано';

  @override
  String get protectedBadge => 'Захищено';

  @override
  String messageCount(int count) {
    return '$count повідомлень';
  }

  @override
  String get deleteQuestion => 'Видалити?';

  @override
  String get transferMyAccountTitle => 'Перенести мій обліковий запис';

  @override
  String get loadingError => 'Помилка завантаження';

  @override
  String get transferToNewDevice => 'Перенести на новий пристрій';

  @override
  String get transferInstructions =>
      'На вашому новому пристрої оберіть «Відновити мій обліковий запис» і введіть цю інформацію:';

  @override
  String get yourHashIdLabel => 'Ваш Hash ID';

  @override
  String get enterYourPinCode => 'Введіть ваш PIN-код';

  @override
  String get pinOwnerConfirmation =>
      'Щоб підтвердити, що ви власник цього облікового запису';

  @override
  String get scanThisQrCode => 'Скануйте цей QR code';

  @override
  String get withYourNewDevice => 'Вашим новим пристроєм';

  @override
  String get orEnterTheCode => 'або введіть код';

  @override
  String get transferCodeLabel => 'Код перенесення';

  @override
  String get proximityVerification => 'Перевірка наближення';

  @override
  String get bringDevicesCloser => 'Піднесіть обидва пристрої ближче';

  @override
  String get confirmTransferQuestion => 'Підтвердити перенесення?';

  @override
  String get accountWillBeTransferred =>
      'Ваш обліковий запис буде перенесено на новий пристрій.\n\nЦей пристрій буде назавжди відключено.';

  @override
  String get transferComplete => 'Перенесення завершено';

  @override
  String get transferSuccessMessage =>
      'Ваш обліковий запис успішно перенесено.\n\nЦей додаток зараз закриється.';

  @override
  String get manualVerification => 'Ручна перевірка';

  @override
  String get codeDisplayedOnBothDevices => 'Код, показаний на обох пристроях:';

  @override
  String get doesCodeMatchNewDevice =>
      'Чи збігається цей код з кодом на новому пристрої?';

  @override
  String get verifiedStatus => 'Перевірено';

  @override
  String get inProgressStatus => 'В процесі...';

  @override
  String get notAvailableStatus => 'Недоступно';

  @override
  String get codeExpiredRestart =>
      'Код закінчився. Будь ласка, почніть заново.';

  @override
  String get codesDoNotMatchCancelled =>
      'Коди не збігаються. Перенесення скасовано.';

  @override
  String transferToDevice(String device) {
    return 'До: $device';
  }

  @override
  String get copiedExclamation => 'Скопійовано!';

  @override
  String expiresInTime(String time) {
    return 'Діє ще $time';
  }

  @override
  String get biometricNotAvailable => 'Біометрія недоступна на цьому пристрої';

  @override
  String get biometricAuthError => 'Помилка біометричної автентифікації';

  @override
  String get authenticateForBiometric =>
      'Будь ласка, пройдіть автентифікацію для увімкнення біометрії';

  @override
  String get biometricAuthFailed => 'Біометрична автентифікація не вдалася';

  @override
  String get forceUpdateTitle => 'Потрібне оновлення';

  @override
  String get forceUpdateMessage =>
      'Доступна нова версія Hash. Будь ласка, оновіть, щоб продовжити.';

  @override
  String get updateButton => 'Оновити';

  @override
  String get maintenanceInProgress => 'Технічне обслуговування';

  @override
  String get tryAgainLater => 'Спробуйте пізніше';

  @override
  String get information => 'Інформація';

  @override
  String get later => 'Пізніше';

  @override
  String get doYouLikeHash => 'Вам подобається Hash?';

  @override
  String get yourFeedbackHelps => 'Ваш відгук допомагає нам покращити додаток';

  @override
  String get ratingTerrible => 'Жахливо';

  @override
  String get ratingBad => 'Погано';

  @override
  String get ratingOk => 'Нормально';

  @override
  String get ratingGood => 'Добре';

  @override
  String get ratingExcellent => 'Чудово!';

  @override
  String get donationMessage =>
      'Hash — некомерційний проект. Ваша підтримка допомагає нам продовжувати створювати справді приватний месенджер.';

  @override
  String get recentConnections => 'Нещодавні з\'єднання';

  @override
  String get loginInfoText =>
      'Кожне розблокування PIN записується локально. Зберігаються лише останні 24 години.';

  @override
  String get connectionCount => 'З\'єднання';

  @override
  String get periodLabel => 'Період';

  @override
  String get historyLabel => 'Історія';

  @override
  String get noLoginRecorded => 'Жодного входу не зареєстровано';

  @override
  String get nextUnlocksAppearHere => 'Наступні розблокування з\'являться тут.';

  @override
  String get dataLocalOnly =>
      'Ці дані зберігаються лише на вашому пристрої і ніколи не передаються.';

  @override
  String get currentSession => 'Поточна';

  @override
  String get todayLabel => 'Сьогодні';

  @override
  String get yesterdayLabel => 'Вчора';

  @override
  String get justNowLabel => 'Щойно';

  @override
  String minutesAgoLabel(int count) {
    return '$count хв тому';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursгод тому';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursгод $minutesхв тому';
  }

  @override
  String get noMaintenancePlanned => 'Обслуговування не заплановано';

  @override
  String get everythingWorkingNormally => 'Все працює нормально';

  @override
  String get maintenanceTitle => 'Обслуговування';

  @override
  String get maintenanceActiveLabel => 'ТРИВАЄ';

  @override
  String get maintenancePlannedLabel => 'ЗАПЛАНОВАНО';

  @override
  String get locking => 'Блокування...';

  @override
  String get newMessageNotification => 'Нове повідомлення';

  @override
  String get secExplainTitle => 'Як Hash захищає вас';

  @override
  String get secExplainIntro =>
      'Hash створено так, щоб ніхто не міг прочитати ваші повідомлення.';

  @override
  String get secExplainIntroSub =>
      'Навіть ми.\nОсь як це працює, пояснено просто.';

  @override
  String get secJourneyLabel => 'ПОДОРОЖ';

  @override
  String get secJourneyTitle => 'Подорож вашого повідомлення';

  @override
  String get secJourneySubtitle =>
      'Від вашого пальця до екрану контакту, кожен крок захищено. Слідуйте за маршрутом.';

  @override
  String get secStep1Title => 'Ви пишете повідомлення';

  @override
  String get secStep1Desc =>
      'Ви набираєте «Привіт!» у додатку. На цей момент повідомлення існує лише в пам\'яті вашого телефону. Нічого не надіслано.';

  @override
  String get secStep2Title => 'Шифрування Signal Protocol';

  @override
  String get secStep2Desc =>
      'Щойно ви натискаєте «Надіслати», ваше повідомлення перетворюється на рядок незрозумілих символів. Ніби ваше повідомлення замкнено в сейфі, ключ від якого є лише у вашого контакту.';

  @override
  String get secStep3Title => 'Sealed Sender: невидимий конверт';

  @override
  String get secStep3Desc =>
      'Уявіть, що ви надсилаєте лист поштою, але без зворотної адреси на конверті. Саме так робить Hash. Повідомлення кидається в анонімну поштову скриньку. Сервер не знає, хто його надіслав.';

  @override
  String get secStep4Title => 'Сервер нічого не бачить';

  @override
  String get secStep4Desc =>
      'Сервер діє як сліпий листоноша. Він знає лише «хтось кинув щось у скриньку #A7X9». Не знає, хто надіслав, що це, або для кого.';

  @override
  String get secStep4Highlight =>
      'Жодних метаданих: ні IP-адреси, ні часової мітки, ні зв\'язку між відправником і одержувачем.';

  @override
  String get secStep5Title => 'Ваш контакт отримує повідомлення';

  @override
  String get secStep5Desc =>
      'Телефон контакту забирає вміст з анонімної скриньки та розшифровує повідомлення приватним ключем, який ніколи не покидав пристрій. На екрані з\'являється «Привіт!».';

  @override
  String get secStep6Title => 'Повідомлення зникає з сервера';

  @override
  String get secStep6Desc =>
      'Щойно контакт підтверджує отримання, сервер назавжди видаляє повідомлення. Жодного кошика, архіву, резервної копії. Навіть непрочитані повідомлення автоматично знищуються через 24 години.';

  @override
  String get secStep7Title => 'Локальне закінчення терміну';

  @override
  String get secStep7Desc =>
      'На телефоні контакту повідомлення самознищується відповідно до обраної тривалості: одразу після прочитання, 5 хвилин, 1 година... ви вирішуєте.';

  @override
  String get secJourneyConclusion =>
      'Результат: жодних слідів на сервері, жодних слідів на пристроях. Повідомлення існувало лише стільки, скільки потрібно для прочитання, потім зникло.';

  @override
  String get secArchLabel => 'АРХІТЕКТУРА';

  @override
  String get secArchTitle => '5 рівнів захисту';

  @override
  String get secArchSubtitle =>
      'Hash не покладається на одну технологію. Кожен рівень посилює інші. Навіть якщо один рівень скомпрометовано, ваші дані залишаються в безпеці.';

  @override
  String get secLayer1Title => 'Наскрізне шифрування';

  @override
  String get secLayer1Desc =>
      'Кожне повідомлення шифрується унікальним ключем. Простими словами: навіть якщо хтось розшифрує одне повідомлення, наступне йому не піддасться. Кожне повідомлення має власний замок.';

  @override
  String get secLayer1Detail =>
      'Для файлів (фото, відео, документів) Hash використовує додаткове шифрування AES-256-GCM. Файл шифрується до того, як покине ваш телефон.';

  @override
  String get secLayer2Title => 'Sealed Sender (мережева анонімність)';

  @override
  String get secLayer2Desc =>
      'Звичайні месенджери надсилають повідомлення з вашою особистістю. Це як написати ім\'я на конверті. Hash використовує анонімні скриньки: сервер доставляє повідомлення, не знаючи, хто його надіслав.';

  @override
  String get secLayer2Detail =>
      'Результат: навіть у разі витоку даних з сервера неможливо відновити, хто з ким спілкується.';

  @override
  String get secLayer3Title => 'Автоматичне видалення';

  @override
  String get secLayer3Desc =>
      'Повідомлення видаляються з сервера одразу після підтвердження отримання. Навіть якщо повідомлення ніколи не забрали, воно автоматично знищується через 24 години.';

  @override
  String get secLayer3Detail =>
      'На вашому телефоні повідомлення самознищуються відповідно до обраної тривалості: негайно, 5 хв, 15 хв, 30 хв, 1 год, 3 год, 6 год або 12 год.';

  @override
  String get secLayer4Title => 'Захист локального доступу';

  @override
  String get secLayer4Desc =>
      'Додаток захищено 6-значним PIN та/або біометрією (Face ID, відбиток пальця). Після занадто багатьох невдалих спроб додаток блокується зі зростаючою затримкою.';

  @override
  String get secLayer5Title => 'Заблокована база даних';

  @override
  String get secLayer5Desc =>
      'На стороні сервера жоден користувач не може записувати безпосередньо в базу даних. Усі дії проходять через захищені функції, що перевіряють кожен запит.';

  @override
  String get secLayer5Detail =>
      'Це як банківська каса: ви ніколи не торкаєтесь сейфа самі. Ви робите запит, і система перевіряє ваші права перед дією.';

  @override
  String get secVashLabel => 'УНІКАЛЬНИЙ У СВІТІ';

  @override
  String get secVashTitle => 'Режим Vash';

  @override
  String get secVashSubtitle =>
      'Система екстреної безпеки, якої немає в жодному іншому месенджері.';

  @override
  String get secVashScenarioTitle => 'Уявіть цю ситуацію';

  @override
  String get secVashScenario1 => 'Хтось отримує доступ до вашого телефону';

  @override
  String get secVashScenario2 => 'Вас просять ввести PIN-код';

  @override
  String get secVashScenario3 => 'Ви хочете терміново стерти всі дані';

  @override
  String get secVashSolutionTitle => 'Рішення: два PIN-коди';

  @override
  String get secVashSolutionDesc =>
      'Ви налаштовуєте два різних PIN-коди в Hash:';

  @override
  String get secVashNormalCodeLabel => 'Звичайний код';

  @override
  String get secVashNormalCodeDesc =>
      'Відкриває додаток нормально з усіма даними';

  @override
  String get secVashCodeLabel2 => 'Код Vash';

  @override
  String get secVashCodeDescription =>
      'Відкриває додаток нормально... але всі дані тихо видаляються у фоновому режимі';

  @override
  String get secVashWhatHappensTitle => 'Що відбувається далі';

  @override
  String get secVashWhatHappensDesc =>
      'Додаток відкривається нормально. Жодного сповіщення, жодної підозрілої анімації. На екрані просто порожній додаток, ніби ви його щойно встановили.\n\nНасправді всі ваші розмови, контакти та повідомлення були безповоротно видалені за частку секунди.';

  @override
  String get secCallsLabel => 'ДЗВІНКИ ТА ФАЙЛИ';

  @override
  String get secCallsTitle => 'Все зашифровано';

  @override
  String get secCallsSubtitle =>
      'Це не лише повідомлення. Абсолютно все, що проходить через Hash, наскрізно зашифровано.';

  @override
  String get secAudioCallTitle => 'Аудіодзвінки';

  @override
  String get secAudioCallDesc =>
      'Наскрізне шифрування через WebRTC. Голос передається безпосередньо між пристроями.';

  @override
  String get secVideoCallTitle => 'Відеодзвінки';

  @override
  String get secVideoCallDesc =>
      'Та сама технологія, кожен потік зашифровано окремо.';

  @override
  String get secPhotosTitle => 'Фото та відео';

  @override
  String get secPhotosDesc =>
      'Зашифровані в AES-256-GCM до того, як покинуть ваш телефон.';

  @override
  String get secDocsTitle => 'Документи';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, будь-який файл. Назва, розмір та вміст зашифровані.';

  @override
  String get secAnonLabel => 'АНОНІМНІСТЬ';

  @override
  String get secAnonTitle => 'Не потрібна ідентифікація';

  @override
  String get secAnonSubtitle =>
      'Hash ніколи не запитує номер телефону чи електронну пошту. Вас ідентифікують за унікальним та анонімним Hash ID.';

  @override
  String get secHashIdTitle => 'Ваш Hash ID';

  @override
  String get secHashIdDesc =>
      'Це ваш унікальний ідентифікатор. Він не розкриває нічого про вас: ні ім\'я, ні номер, ні місцезнаходження. Це як псевдонім, який неможливо пов\'язати з вашою реальною особистістю.\n\nЩоб додати контакт, ви ділитесь Hash ID або скануєте QR code. Ось і все. Жодної синхронізованої адресної книги, жодних пропозицій «Люди, яких ви можете знати».';

  @override
  String get secDataLabel => 'ДАНІ';

  @override
  String get secDataTitle => 'Чого Hash не знає';

  @override
  String get secDataSubtitle =>
      'Найкращий спосіб захистити ваші дані — не збирати їх.';

  @override
  String get secNeverCollected => 'Ніколи не збираються';

  @override
  String get secNeverItem1 => 'Вміст повідомлень';

  @override
  String get secNeverItem2 => 'Список контактів';

  @override
  String get secNeverItem3 => 'Номер телефону';

  @override
  String get secNeverItem4 => 'Електронна адреса';

  @override
  String get secNeverItem5 => 'IP-адреса';

  @override
  String get secNeverItem6 => 'Місцезнаходження';

  @override
  String get secNeverItem7 => 'Метадані (хто з ким спілкується)';

  @override
  String get secNeverItem8 => 'Історія дзвінків';

  @override
  String get secNeverItem9 => 'Адресна книга';

  @override
  String get secNeverItem10 => 'Рекламні ідентифікатори';

  @override
  String get secTempStored => 'Зберігається тимчасово';

  @override
  String get secTempItem1 => 'Анонімний Hash ID (унікальний ідентифікатор)';

  @override
  String get secTempItem2 => 'Публічні ключі шифрування';

  @override
  String get secTempItem3 =>
      'Зашифровані повідомлення в транзиті (макс. 24 год)';

  @override
  String get secTempNote =>
      'Навіть ці мінімальні дані не можуть вас ідентифікувати. Ваш Hash ID не пов\'язаний з жодною особистою інформацією.';

  @override
  String get secFooterTitle => 'Ваша конфіденційність, ваша свобода';

  @override
  String get secFooterDesc =>
      'Hash використовує ті самі технології шифрування, що й найвимогливіші професійні додатки. Ваші повідомлення захищені математикою, а не обіцянками.';

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
