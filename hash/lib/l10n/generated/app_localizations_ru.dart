// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Ноль следов. Ноль компромиссов.';

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
  String get conversations => 'Чаты';

  @override
  String get contacts => 'Контакты';

  @override
  String get noConversation => 'Нет чатов';

  @override
  String get noConversationSubtitle =>
      'Добавьте контакт, чтобы начать безопасное общение';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ожидающих запросов',
      one: '1 ожидающий запрос',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count отправленных запросов',
      one: '1 отправленный запрос',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Добавить контакт';

  @override
  String get shareApp => 'Поделиться приложением';

  @override
  String get newMessage => 'Новое сообщение';

  @override
  String get newConversation => 'Отправить сообщение';

  @override
  String get settings => 'Настройки';

  @override
  String get myHashId => 'Мой Hash ID';

  @override
  String get supportHash => 'Поддержать Hash';

  @override
  String get supportHashSubtitle => 'Hash — некоммерческий проект';

  @override
  String get donate => 'Пожертвовать';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get theme => 'Тема';

  @override
  String get themeAuto => 'Автоматически';

  @override
  String get themeAutoSubtitle => 'Следует настройкам системы';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeRecommendation =>
      'Тёмная тема рекомендуется для лучшей конфиденциальности';

  @override
  String get language => 'Язык';

  @override
  String get languageAuto => 'Автоматически (система)';

  @override
  String get notifications => 'Уведомления';

  @override
  String get messages => 'Сообщения';

  @override
  String get calls => 'Звонки';

  @override
  String get vibration => 'Вибрация';

  @override
  String get notificationContent => 'Содержание уведомления';

  @override
  String get notificationContentFull => 'Показать всё';

  @override
  String get notificationContentFullDesc =>
      'Имя контакта и предпросмотр сообщения';

  @override
  String get notificationContentName => 'Только имя';

  @override
  String get notificationContentNameDesc => 'Показывает только имя контакта';

  @override
  String get notificationContentDiscrete => 'Скрытно';

  @override
  String get notificationContentDiscreteDesc =>
      'Показывает только «Новое сообщение»';

  @override
  String get security => 'Безопасность';

  @override
  String get howHashProtectsYou => 'Как Hash защищает вас';

  @override
  String get howHashProtectsYouSubtitle => 'Узнайте о своей безопасности';

  @override
  String get accountSecurity => 'Безопасность аккаунта';

  @override
  String get accountSecuritySubtitle => 'PIN, биометрия, режим Vash';

  @override
  String get blockScreenshots => 'Блокировать снимки экрана';

  @override
  String get transferDevice => 'Перенести на другое устройство';

  @override
  String get transferDeviceSubtitle => 'Перенести ваш аккаунт';

  @override
  String get pinCode => 'PIN-код';

  @override
  String get changePin => 'Изменить PIN-код';

  @override
  String get currentPin => 'Текущий PIN-код';

  @override
  String get newPin => 'Новый PIN-код';

  @override
  String get confirmPin => 'Подтвердить PIN-код';

  @override
  String get pinChanged => 'PIN-код изменён';

  @override
  String get incorrectPin => 'Неверный PIN';

  @override
  String get pinsDoNotMatch => 'PIN-коды не совпадают';

  @override
  String get autoLock => 'Автоблокировка';

  @override
  String get autoLockDelay => 'Задержка блокировки';

  @override
  String get autoLockImmediate => 'Немедленно';

  @override
  String get autoLockMinute => '1 минута';

  @override
  String autoLockMinutes(int count) {
    return '$count минут';
  }

  @override
  String get vashCode => 'Код Vash';

  @override
  String get vashModeTitle => 'Режим Vash';

  @override
  String get vashModeExplanation => 'Ваша последняя страховка.';

  @override
  String get vashModeDescription =>
      'Вы выберете второй PIN-код. Если вас когда-либо заставят открыть Hash, введите этот код вместо обычного PIN.\n\nПриложение откроется нормально, но все ваши разговоры и контакты исчезнут.\n\nДля любого, кто смотрит на ваш экран, Hash просто выглядит пустым — как будто вы никогда им не пользовались.';

  @override
  String get vashModeIrreversible => 'Это действие беззвучно и необратимо.';

  @override
  String get chooseVashCode => 'Выбрать мой код Vash';

  @override
  String get vashCodeInfo =>
      'Второй PIN-код, который открывает приложение нормально, но пустым.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Если вы введёте этот код вместо PIN:';

  @override
  String get vashDeleteContacts => 'Ваши контакты исчезнут';

  @override
  String get vashDeleteMessages => 'Ваши разговоры исчезнут';

  @override
  String get vashDeleteHistory => 'Ваши заметки исчезнут';

  @override
  String get vashKeepId =>
      'Ваша личность Hash (#XXX-XXX-XXX) останется прежней';

  @override
  String get vashAppearNormal =>
      'Приложение выглядит нормально, но пустым, как новое. Это действие необратимо.';

  @override
  String get setupVashCode => 'Настроить код Vash';

  @override
  String get modifyVashCode => 'Изменить код Vash';

  @override
  String get currentVashCode => 'Текущий код Vash';

  @override
  String get newVashCode => 'Новый код Vash';

  @override
  String get confirmVashCode => 'Подтвердить код Vash';

  @override
  String get vashCodeConfigured => 'Код Vash настроен';

  @override
  String get vashCodeModified => 'Код Vash изменён';

  @override
  String get vashCodeMustDiffer => 'Код Vash должен отличаться от PIN';

  @override
  String get incorrectVashCode => 'Неверный код Vash';

  @override
  String get vashWhatToDelete => 'Что должен скрыть режим Vash?';

  @override
  String get vashDeleteContactsOption => 'Контакты';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Сообщения';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Заметки';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Режим Vash активирован';

  @override
  String get vashCreateSubtitle => 'Выберите код, отличный от основного PIN';

  @override
  String get vashConfirmSubtitle => 'Подтвердите ваш код Vash';

  @override
  String get pinCodeForEntry => 'PIN-код для входа в приложение';

  @override
  String get vashCodeSection => 'Режим Vash';

  @override
  String get biometric => 'Биометрия';

  @override
  String get biometricUnlock => 'Разблокировка отпечатком пальца или Face ID';

  @override
  String get enableBiometric => 'Включить биометрию';

  @override
  String get biometricWarningMessage =>
      'При включении биометрии вы не сможете использовать Vash-код для входа в приложение.\n\nVash-код можно будет использовать только при сбое биометрии (после нескольких неудачных попыток).\n\nВы уверены, что хотите продолжить?';

  @override
  String get understood => 'Понятно';

  @override
  String get shareAppSubtitle => 'Поделитесь Hash с близкими';

  @override
  String get share => 'Поделиться';

  @override
  String get danger => 'Опасность';

  @override
  String get deleteAccount => 'Удалить мой аккаунт';

  @override
  String get deleteAccountSubtitle => 'Необратимое действие';

  @override
  String get deleteAccountConfirmTitle => 'Удалить мой аккаунт';

  @override
  String get deleteAccountConfirmMessage =>
      'Ваш аккаунт будет удалён навсегда. Это действие необратимо.\n\n• Все ваши чаты\n• Все ваши контакты\n• Ваш Hash ID\n\nВам нужно будет создать новый аккаунт.';

  @override
  String get deleteForever => 'Удалить навсегда';

  @override
  String get cancel => 'Отмена';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Режим Vash активирован.';

  @override
  String deletionError(String error) {
    return 'Ошибка удаления: $error';
  }

  @override
  String get yourSecurity => 'Ваша безопасность';

  @override
  String get securityInfo =>
      '• Сквозное шифрование (Signal Protocol)\n• Нет данных на наших серверах после доставки\n• Ключи хранятся только на вашем устройстве\n• PIN-код никогда не отправляется на сервер';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Добро пожаловать';

  @override
  String get securityStatement1 => 'Ваши сообщения защищены.';

  @override
  String get securityStatement2 => 'Сквозное шифрование.';

  @override
  String get securityStatement3 => 'Без следов. Без компромиссов.';

  @override
  String get securityStatement4 => 'Ваша конфиденциальность — это право.';

  @override
  String get accessBlocked => 'Доступ заблокирован';

  @override
  String get tooManyAttempts => 'Слишком много попыток. Попробуйте позже.';

  @override
  String get pleaseWait => 'Пожалуйста, подождите';

  @override
  String get waitDelay => 'Пожалуйста, дождитесь окончания задержки';

  @override
  String attemptCount(int current, int max) {
    return 'Попытка $current из $max';
  }

  @override
  String retryIn(String time) {
    return 'Повторить через $time';
  }

  @override
  String get forgotPin => 'Забыли PIN? Используйте фразу восстановления';

  @override
  String get useRecoveryPhrase => 'Использовать фразу восстановления';

  @override
  String get recoveryWarningTitle => 'Предупреждение';

  @override
  String get recoveryWarningMessage => 'Восстановление аккаунта:';

  @override
  String get recoveryDeleteAllMessages => 'Удалит ВСЕ ваши сообщения';

  @override
  String get recoveryWaitDelay => 'Потребуется задержка в 1 час';

  @override
  String get recoveryKeepContacts => 'Сохранит ваши контакты';

  @override
  String get recoveryIrreversible =>
      'Это действие необратимо. Ваши сообщения будут безвозвратно утеряны.';

  @override
  String get iUnderstand => 'Я понимаю';

  @override
  String get accountRecovery => 'Восстановление аккаунта';

  @override
  String get enterRecoveryPhrase =>
      'Введите 24 слова вашей фразы восстановления, разделённые пробелами.';

  @override
  String get recoveryPhraseHint => 'слово1 слово2 слово3 ...';

  @override
  String get recover => 'Восстановить';

  @override
  String get recoveryPhraseRequired =>
      'Пожалуйста, введите фразу восстановления';

  @override
  String get recoveryPhrase24Words => 'Фраза должна содержать ровно 24 слова';

  @override
  String get incorrectRecoveryPhrase => 'Неверная фраза восстановления';

  @override
  String get recoveryInitError => 'Ошибка инициализации восстановления';

  @override
  String get securityDelay => 'Задержка безопасности';

  @override
  String get securityDelayMessage =>
      'Для вашей безопасности требуется период ожидания, прежде чем вы сможете создать новый PIN.';

  @override
  String get timeRemaining => 'Оставшееся время';

  @override
  String get messagesDeletedForProtection =>
      'Ваши сообщения были удалены для вашей защиты.';

  @override
  String get canCloseApp => 'Вы можете закрыть приложение и вернуться позже.';

  @override
  String get onboardingTitle1 => 'Добро пожаловать в Hash';

  @override
  String get onboardingSubtitle1 => 'Мессенджер, который не оставляет следов';

  @override
  String get onboardingTitle2 => 'Полное шифрование';

  @override
  String get onboardingSubtitle2 =>
      'Ваши сообщения зашифрованы сквозным шифрованием по протоколу Signal';

  @override
  String get onboardingTitle3 => 'Без следов';

  @override
  String get onboardingSubtitle3 =>
      'Сообщения удаляются с серверов после доставки';

  @override
  String get onboardingTitle4 => 'Ваша безопасность';

  @override
  String get onboardingSubtitle4 =>
      'PIN-код, режим Vash и фраза восстановления';

  @override
  String get getStarted => 'Начать';

  @override
  String get next => 'Далее';

  @override
  String get skip => 'Пропустить';

  @override
  String get alreadyHaveAccount => 'У меня уже есть аккаунт';

  @override
  String get transferMyAccount => 'Перенести мой аккаунт';

  @override
  String get createPin => 'Создайте PIN-код';

  @override
  String get createPinSubtitle => 'Этот код защитит доступ к вашему приложению';

  @override
  String get confirmYourPin => 'Подтвердите ваш PIN-код';

  @override
  String get confirmPinSubtitle => 'Введите PIN-код ещё раз';

  @override
  String get saveRecoveryPhrase => 'Фраза восстановления';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Запишите эти 24 слова по порядку. Они позволят восстановить аккаунт, если вы забудете PIN.';

  @override
  String get phraseWritten => 'Я записал фразу';

  @override
  String get warningRecoveryPhrase =>
      'Если вы потеряете эту фразу и забудете PIN, вы потеряете доступ к аккаунту.';

  @override
  String get accountTransferred => 'Аккаунт перенесён';

  @override
  String get accountTransferredMessage =>
      'Ваш аккаунт был перенесён на другое устройство. Эта сессия больше недействительна.';

  @override
  String get accountTransferredInfo =>
      'Если вы не инициировали этот перенос, ваш аккаунт мог быть скомпрометирован.';

  @override
  String get logout => 'Выйти';

  @override
  String get transferAccount => 'Перенести аккаунт';

  @override
  String get transferAccountInfo =>
      'Перенесите ваш аккаунт Hash на новое устройство. Текущая сессия будет аннулирована.';

  @override
  String get generateTransferCode => 'Сгенерировать код переноса';

  @override
  String get transferCode => 'Код переноса';

  @override
  String transferCodeExpires(int minutes) {
    return 'Этот код истекает через $minutes минут';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Введите этот код на новом устройстве для переноса аккаунта.';

  @override
  String get generateNewCode => 'Сгенерировать новый код';

  @override
  String get scanQrCode => 'Сканировать QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Сканируйте QR code контакта, чтобы добавить его';

  @override
  String get qrCodeDetected => 'QR code обнаружен';

  @override
  String get invalidQrCode => 'Недействительный QR code';

  @override
  String get cameraPermissionRequired => 'Требуется разрешение камеры';

  @override
  String get myQrCode => 'Мой QR code';

  @override
  String get myQrCodeSubtitle =>
      'Поделитесь этим QR code, чтобы контакты могли вас добавить';

  @override
  String get shareQrCode => 'Поделиться';

  @override
  String get addContactTitle => 'Добавить контакт';

  @override
  String get addContactByHashId => 'Введите Hash ID вашего контакта';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Поиск';

  @override
  String get contactNotFound => 'Контакт не найден';

  @override
  String get contactAlreadyAdded => 'Этот контакт уже в вашем списке';

  @override
  String get contactAdded => 'Контакт добавлен';

  @override
  String get myProfile => 'Мой профиль';

  @override
  String get myProfileSubtitle =>
      'Поделитесь этой информацией, чтобы другие могли вас добавить';

  @override
  String get temporaryCode => 'Временный код';

  @override
  String temporaryCodeExpires(String time) {
    return 'Истекает через $time';
  }

  @override
  String get codeExpired => 'Код истёк';

  @override
  String get generateNewCodeButton => 'Новый код';

  @override
  String get copyHashId => 'Копировать ID';

  @override
  String get copyCode => 'Копировать код';

  @override
  String get copiedToClipboard => 'Скопировано';

  @override
  String get showMyQrCode => 'Показать мой QR code';

  @override
  String get orDivider => 'или';

  @override
  String get openScanner => 'Открыть сканер';

  @override
  String get addManually => 'Добавить вручную';

  @override
  String get contactHashIdLabel => 'Hash ID контакта';

  @override
  String get temporaryCodeLabel => 'Временный код';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Попросите контакт сгенерировать код из его профиля';

  @override
  String get verifyAndAdd => 'Проверить и добавить';

  @override
  String get fillAllFields => 'Пожалуйста, заполните все поля';

  @override
  String get invalidHashIdFormat =>
      'Неверный формат ID (например: 123-456-ABC)';

  @override
  String get userNotFound => 'Пользователь не найден';

  @override
  String get cannotAddYourself => 'Вы не можете добавить себя';

  @override
  String get invalidOrExpiredCode =>
      'Недействительный или истёкший временный код';

  @override
  String get contactFound => 'Контакт найден!';

  @override
  String get howToCallContact => 'Как вы хотите его назвать?';

  @override
  String get contactNameHint => 'Имя контакта';

  @override
  String get addContactButton => 'Добавить';

  @override
  String get contactDetails => 'Данные контакта';

  @override
  String get contactName => 'Имя контакта';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Добавлен $date';
  }

  @override
  String get deleteContact => 'Удалить контакт';

  @override
  String deleteContactConfirm(Object name) {
    return 'Удалить этот контакт?';
  }

  @override
  String get deleteContactMessage => 'Это также удалит весь чат.';

  @override
  String get delete => 'Удалить';

  @override
  String get typeMessage => 'Введите сообщение...';

  @override
  String get messageSent => 'Отправлено';

  @override
  String get messageDelivered => 'Доставлено';

  @override
  String get messageRead => 'Прочитано';

  @override
  String get messageFailed => 'Ошибка отправки';

  @override
  String get now => 'Сейчас';

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
  String get today => 'Сегодня';

  @override
  String get yesterday => 'Вчера';

  @override
  String dateAtTime(String date, String time) {
    return '$date в $time';
  }

  @override
  String get shareMessage =>
      'Присоединяйтесь ко мне в Hash! 🔒\n\nЭто по-настоящему приватный мессенджер: полное шифрование, без следов на серверах и режим паники при необходимости.\n\nСкачайте приложение здесь 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Ошибка';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Просмотр';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get save => 'Сохранить';

  @override
  String get edit => 'Редактировать';

  @override
  String get close => 'Закрыть';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get loading => 'Загрузка...';

  @override
  String get retry => 'Повторить';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Ожидающие запросы';

  @override
  String get noPendingRequests => 'Нет ожидающих запросов';

  @override
  String get pendingRequestsSubtitle => 'Эти люди хотят вас добавить';

  @override
  String requestFromUser(String hashId) {
    return 'Запрос от $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Истекает через $days дней';
  }

  @override
  String get acceptRequest => 'Принять';

  @override
  String get rejectRequest => 'Отклонить';

  @override
  String get requestAccepted => 'Запрос принят';

  @override
  String get requestRejected => 'Запрос отклонён';

  @override
  String get requestSent => 'Запрос отправлен!';

  @override
  String get requestSentSubtitle =>
      'Ваш запрос отправлен. Пользователь должен его принять, прежде чем вы сможете общаться.';

  @override
  String get requestAlreadyPending => 'Запрос уже ожидает';

  @override
  String get requestAlreadySentByOther =>
      'Этот человек уже отправил вам запрос';

  @override
  String get addByHashId => 'Добавить по Hash ID';

  @override
  String get addByHashIdSubtitle => 'Введите Hash ID и временный код контакта';

  @override
  String get enterTemporaryCode => 'Введите 6-значный код';

  @override
  String get sendRequest => 'Отправить запрос';

  @override
  String get acceptContactTitle => 'Принять контакт';

  @override
  String get acceptContactSubtitle => 'Вы можете дать ему своё имя';

  @override
  String get leaveEmptyForHashId => 'Оставьте пустым для использования Hash ID';

  @override
  String get firstName => 'Имя';

  @override
  String get lastName => 'Фамилия';

  @override
  String get notes => 'Заметки';

  @override
  String get notesHint => 'Личные заметки об этом контакте';

  @override
  String get photoOptional => 'Фото (необязательно)';

  @override
  String get contactNameOptional => 'Имя (необязательно)';

  @override
  String get notesOptional => 'Заметки (необязательно)';

  @override
  String get storedLocally => 'Хранится только на вашем устройстве';

  @override
  String get encryptedMessageLabel => 'Зашифрованное сообщение';

  @override
  String get identityMessageHint => 'Кто вы? Как вы знакомы?';

  @override
  String get messageWillBeSentEncrypted =>
      'Это сообщение будет зашифровано и отправлено получателю';

  @override
  String get sendRequestButton => 'Отправить запрос';

  @override
  String get requestExpiresIn24h =>
      'Запрос истекает через 24 ч, если не принят';

  @override
  String get theyAlreadySentYouRequest =>
      'Этот человек уже отправил вам запрос';

  @override
  String get requests => 'Запросы';

  @override
  String get receivedRequests => 'Полученные';

  @override
  String get sentRequests => 'Отправленные';

  @override
  String get noSentRequests => 'Нет отправленных запросов';

  @override
  String get cancelRequest => 'Отмена';

  @override
  String get deleteRequest => 'Удалить запрос';

  @override
  String get requestCancelled => 'Запрос отменён';

  @override
  String sentTo(String hashId) {
    return 'Отправлено $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Истекает через $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Получено $time назад';
  }

  @override
  String get messageFromRequester => 'Сообщение от отправителя';

  @override
  String get copy => 'Копировать';

  @override
  String get messageInfo => 'Информация о сообщении';

  @override
  String get messageDirection => 'Направление';

  @override
  String get messageSentByYou => 'Отправлено вами';

  @override
  String get messageReceived => 'Получено';

  @override
  String get messageSentAt => 'Отправлено в';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Статус';

  @override
  String get messageReadAt => 'Прочитано в';

  @override
  String get messageType => 'Тип';

  @override
  String get messageSize => 'Размер';

  @override
  String get messageExpiresAt => 'Истекает в';

  @override
  String get messageEncrypted => 'Сквозное шифрование';

  @override
  String get messageStatusSending => 'Отправка...';

  @override
  String get messageStatusSent => 'Отправлено';

  @override
  String get messageStatusDelivered => 'Доставлено';

  @override
  String get messageStatusRead => 'Прочитано';

  @override
  String get messageStatusFailed => 'Ошибка';

  @override
  String get serverStatus => 'Сервер';

  @override
  String get onServer => 'Ожидает доставки';

  @override
  String get deletedFromServer => 'Удалено';

  @override
  String get messageTypeText => 'Текст';

  @override
  String get messageTypeImage => 'Изображение';

  @override
  String get messageTypeVideo => 'Видео';

  @override
  String get messageTypeVoice => 'Голос';

  @override
  String get messageTypeFile => 'Файл';

  @override
  String get indefinitely => 'Бессрочно';

  @override
  String get hoursShort => 'ч';

  @override
  String get minutesShort => 'мин';

  @override
  String get hours => 'часов';

  @override
  String get minutes => 'минут';

  @override
  String get seconds => 'секунд';

  @override
  String get ephemeralMessages => 'Исчезающие сообщения';

  @override
  String get ephemeralMessagesDescription =>
      'Сообщения автоматически удаляются через это время';

  @override
  String get ephemeralImmediate => 'Немедленно (после прочтения)';

  @override
  String get ephemeralImmediateDesc => 'Удаляются сразу после прочтения';

  @override
  String get ephemeralMyPreference => 'Мои предпочтения';

  @override
  String get ephemeralMyPreferenceDesc => 'Использовать глобальную настройку';

  @override
  String get ephemeralDefaultSetting => 'Длительность сообщения';

  @override
  String get ephemeralChooseDefault => 'Рекомендуемый';

  @override
  String get ephemeral30Seconds => '30 секунд';

  @override
  String get ephemeral30SecondsDesc => 'Удалено через 30с после прочтения';

  @override
  String get ephemeral5Minutes => '5 минут';

  @override
  String get ephemeral5MinutesDesc => 'Удалено через 5мин после прочтения';

  @override
  String get ephemeral1Hour => '1 час';

  @override
  String get ephemeral1HourDesc => 'Удалено через 1ч после прочтения';

  @override
  String get ephemeral3Hours => '3 часа';

  @override
  String get ephemeral6Hours => '6 часов';

  @override
  String get ephemeral6HoursDesc => 'Удалено через 6ч после прочтения';

  @override
  String get ephemeral12Hours => '12 часов';

  @override
  String get ephemeral24Hours => '24 часа';

  @override
  String get ephemeral24HoursDesc => 'Удалено через 24ч после прочтения';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Пользовательская длительность';

  @override
  String get howItWorks => 'Как это работает';

  @override
  String get ephemeralExplanation1 =>
      'Сообщения удаляются с сервера сразу после получения.';

  @override
  String get ephemeralExplanation2 =>
      'Эта настройка определяет, когда сообщения исчезают с ВАШЕГО телефона после прочтения.';

  @override
  String get ephemeralExplanation3 =>
      'У вашего контакта своя настройка для его телефона.';

  @override
  String get mute1Hour => '1 час';

  @override
  String get mute8Hours => '8 часов';

  @override
  String get mute1Day => '1 день';

  @override
  String get mute1Week => '1 неделя';

  @override
  String get muteAlways => 'Всегда';

  @override
  String get muteExplanation =>
      'Вы не будете получать уведомления от этого контакта';

  @override
  String get showCallsInRecents => 'Показать в недавних звонках';

  @override
  String get showCallsInRecentsSubtitle =>
      'Звонки Hash отображаются в истории телефона';

  @override
  String get feedback => 'Обратная связь';

  @override
  String get muteNotifications => 'Отключить уведомления';

  @override
  String get muteDescription =>
      'Вы не будете получать уведомления от этого контакта';

  @override
  String mutedUntil(String time) {
    return 'Отключено до $time';
  }

  @override
  String get notMuted => 'Уведомления включены';

  @override
  String get unmute => 'Включить';

  @override
  String get notificationSound => 'Звук уведомления';

  @override
  String get defaultSound => 'По умолчанию';

  @override
  String get chatSettings => 'Настройки чата';

  @override
  String get bubbleColor => 'Цвет пузыря';

  @override
  String get backgroundColor => 'Цвет фона';

  @override
  String get backgroundImage => 'Фоновое изображение';

  @override
  String get chatBackground => 'Фон чата';

  @override
  String get customColor => 'Пользовательский';

  @override
  String get defaultColor => 'По умолчанию';

  @override
  String get imageSelected => 'Изображение выбрано';

  @override
  String get noImage => 'Нет изображения';

  @override
  String get color => 'Цвет';

  @override
  String get image => 'Изображение';

  @override
  String get tapToSelectImage => 'Нажмите для выбора изображения';

  @override
  String get changeImage => 'Изменить изображение';

  @override
  String get previewMessageReceived => 'Привет!';

  @override
  String get previewMessageSent => 'Здравствуйте!';

  @override
  String get messageAction => 'Сообщение';

  @override
  String get callAction => 'Звонок';

  @override
  String get videoAction => 'Видео';

  @override
  String get personalNotes => 'Личные заметки';

  @override
  String get addNotes => 'Добавить заметки...';

  @override
  String get noNotes => 'Нет заметок';

  @override
  String get messageNotifications => 'Уведомления о сообщениях';

  @override
  String get callNotifications => 'Уведомления о звонках';

  @override
  String get useGradient => 'Использовать градиент';

  @override
  String get gradientStart => 'Начальный цвет';

  @override
  String get gradientEnd => 'Конечный цвет';

  @override
  String get preview => 'Предпросмотр';

  @override
  String get reset => 'Сбросить';

  @override
  String get securityNumber => 'Номер безопасности';

  @override
  String securityNumberDescription(String name) {
    return 'Убедитесь, что номер безопасности совпадает с устройством $name';
  }

  @override
  String get verifyEncryption => 'Проверить сквозное шифрование';

  @override
  String get tapToCopy => 'Нажмите для копирования';

  @override
  String get howToVerify => 'Как проверить';

  @override
  String get verifyStep1 => 'Встретьтесь с контактом лично или позвоните';

  @override
  String get verifyStep2 =>
      'Сравните номера безопасности или сканируйте QR code';

  @override
  String get verifyStep3 => 'Если совпадают, ваш чат защищён';

  @override
  String get scanToVerify => 'Сканировать для проверки';

  @override
  String get reportSpam => 'Пожаловаться на спам';

  @override
  String get reportSpamSubtitle => 'Пожаловаться на этот контакт как спам';

  @override
  String get reportSpamDescription =>
      'Это анонимно сообщит об этом контакте. Ваша личность не будет раскрыта. Вы уверены?';

  @override
  String get report => 'Пожаловаться';

  @override
  String get spamReported => 'Спам отмечен';

  @override
  String get reportError => 'Не удалось отправить жалобу. Попробуйте снова.';

  @override
  String get reportRateLimited =>
      'Вы достигли максимального количества жалоб на сегодня.';

  @override
  String get blockContact => 'Заблокировать контакт';

  @override
  String get blockContactDescription =>
      'Этот контакт больше не сможет отправлять вам сообщения или звонить. Он не будет уведомлён.';

  @override
  String get unblockContact => 'Разблокировать контакт';

  @override
  String get unblockContactDescription =>
      'Этот контакт снова сможет отправлять вам сообщения и звонить.';

  @override
  String get contactBlocked => 'Контакт заблокирован';

  @override
  String get contactUnblocked => 'Контакт разблокирован';

  @override
  String get contactIsBlocked => 'Этот контакт заблокирован';

  @override
  String get unblock => 'Разблокировать';

  @override
  String get deleteContactSubtitle => 'Удалить этот контакт и чат';

  @override
  String get confirmWithPin => 'Подтвердить с PIN';

  @override
  String get enterPinToConfirm => 'Введите PIN для подтверждения действия';

  @override
  String get profilePhoto => 'Фото профиля';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get chooseFromGallery => 'Выбрать из галереи';

  @override
  String get removePhoto => 'Удалить фото';

  @override
  String get viewContactHashId => 'Посмотреть идентификатор контакта';

  @override
  String get hashIdPartiallyMasked =>
      'Частично скрыт для вашей безопасности и конфиденциальности контакта';

  @override
  String get addFirstContact => 'Добавьте первый контакт';

  @override
  String get addFirstContactSubtitle =>
      'Поделитесь QR code или сканируйте QR code друга';

  @override
  String get directory => 'Справочник';

  @override
  String get noContacts => 'Нет контактов';

  @override
  String get noContactsSubtitle => 'Добавьте контакт для начала';

  @override
  String get sendMessageAction => 'Отправить сообщение';

  @override
  String get audioCall => 'Аудиозвонок';

  @override
  String get videoCall => 'Видеозвонок';

  @override
  String get viewProfile => 'Просмотр профиля';

  @override
  String get deleteContactDirectory => 'Удалить контакт';

  @override
  String get scanShort => 'Скан';

  @override
  String get addShort => 'Добавить';

  @override
  String deleteContactConfirmName(String name) {
    return 'Вы уверены, что хотите удалить $name?';
  }

  @override
  String get noNotesTitle => 'Нет заметок';

  @override
  String get noNotesSubtitle => 'Создайте первую заметку';

  @override
  String get newNote => 'Новая заметка';

  @override
  String get editNote => 'Редактировать заметку';

  @override
  String get deleteNote => 'Удалить заметку';

  @override
  String get deleteNoteConfirm => 'Вы уверены, что хотите удалить эту заметку?';

  @override
  String get noteTitle => 'Заголовок';

  @override
  String get noteContent => 'Содержание';

  @override
  String get addItem => 'Добавить элемент';

  @override
  String get pinNote => 'Закрепить';

  @override
  String get unpinNote => 'Открепить';

  @override
  String get noteColor => 'Цвет';

  @override
  String get notePassword => 'Пароль';

  @override
  String get setPassword => 'Установить пароль';

  @override
  String get changePassword => 'Изменить пароль';

  @override
  String get removePassword => 'Удалить пароль';

  @override
  String get enterPassword => 'Введите пароль';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get passwordPin => 'PIN-код';

  @override
  String get passwordText => 'Текстовый пароль';

  @override
  String get protectedNote => 'Защищённая заметка';

  @override
  String get incorrectPassword => 'Неверный пароль';

  @override
  String get passwordSet => 'Пароль установлен';

  @override
  String get passwordRemoved => 'Пароль удалён';

  @override
  String get notesBiometric => 'Face ID для заметок';

  @override
  String get notesBiometricSubtitle =>
      'Требовать биометрическую аутентификацию для открытия защищённых заметок';

  @override
  String get textNote => 'Текстовая заметка';

  @override
  String get checklistNote => 'Чек-лист';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total задач';
  }

  @override
  String get autoSaved => 'Сохранено';

  @override
  String get searchNotes => 'Поиск заметок';

  @override
  String get legalConsent => 'Юридическое согласие';

  @override
  String get confirmAge13 => 'Я подтверждаю, что мне не менее 13 лет';

  @override
  String get acceptLegalStart => 'Я принимаю ';

  @override
  String get privacyPolicy => 'Политику конфиденциальности';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get andThe => ' и ';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get mustAcceptTerms => 'Вы должны принять оба условия для продолжения';

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
  String get support => 'Поддержка';

  @override
  String get contactSupport => 'Связаться с поддержкой';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Сообщить о нарушении';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Юридическая информация';

  @override
  String get legalEntity => 'Юридическое лицо';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Закрепить';

  @override
  String get unpinConversation => 'Открепить';

  @override
  String get hideConversation => 'Убрать из ленты';

  @override
  String get deleteConversation => 'Удалить разговор';

  @override
  String get deleteConversationConfirm =>
      'Введите PIN для подтверждения удаления всех сообщений';

  @override
  String get noConversations => 'Пока нет разговоров';

  @override
  String get startConversation => 'Начать';

  @override
  String get microphonePermissionRequired => 'Требуется доступ к микрофону';

  @override
  String get microphonePermissionExplanation =>
      'Hash нужен микрофон для совершения звонков.';

  @override
  String get cameraPermissionExplanation =>
      'Hash нужна камера для видеозвонков.';

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
  String get openSettings => 'Открыть настройки';

  @override
  String get callConnecting => 'Подключение...';

  @override
  String get callRinging => 'Вызов...';

  @override
  String get callReconnecting => 'Переподключение...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Переподключение ($secondsс)';
  }

  @override
  String get callPaused => 'На паузе';

  @override
  String get callPausedSubtitle => 'Звонок ещё активен';

  @override
  String get callRemoteMicMuted => 'Микрофон контакта выключен';

  @override
  String get callMiniControlsMute => 'Выключить';

  @override
  String get callMiniControlsUnmute => 'Включить';

  @override
  String get callMiniControlsHangUp => 'Завершить';

  @override
  String get callMiniControlsReturn => 'Вернуться к звонку';

  @override
  String get callNetworkPoor => 'Нестабильное соединение';

  @override
  String get callNetworkLost => 'Соединение потеряно';

  @override
  String get callEndedTitle => 'Звонок завершён';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Данные устройства';

  @override
  String get deviceDataSubtitle => 'Локальное и серверное хранение';

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
  String get localStorage => 'Локальное хранилище';

  @override
  String get onThisDevice => 'на этом устройстве';

  @override
  String get encryptedDatabases => 'Зашифрованные базы данных';

  @override
  String get files => 'Файлы';

  @override
  String get secureKeychain => 'Безопасная связка ключей';

  @override
  String get cache => 'Кэш';

  @override
  String get contactsDetail => 'Имена, аватары, ключи Signal';

  @override
  String get messagesDetail => 'Зашифрованные разговоры';

  @override
  String get notesDetail => 'Личные заметки';

  @override
  String get signalSessions => 'Сессии Signal';

  @override
  String get signalSessionsDetail => 'Сессии шифрования';

  @override
  String get pendingContacts => 'Ожидающие контакты';

  @override
  String get pendingContactsDetail => 'Ожидающие запросы';

  @override
  String get callHistory => 'Звонки';

  @override
  String get callHistoryDetail => 'История звонков';

  @override
  String get preferences => 'Предпочтения';

  @override
  String get preferencesDetail => 'Предпочтения медиа и звонков';

  @override
  String get avatars => 'Аватары';

  @override
  String get media => 'Медиа';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файлов',
      one: '1 файл',
      zero: 'нет файлов',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Активен';

  @override
  String get notDefined => 'Не задано';

  @override
  String get biometrics => 'Биометрия';

  @override
  String get recoveryPhrase => 'Фраза восстановления';

  @override
  String get identity => 'Личность (Hash ID)';

  @override
  String get signalKeys => 'Ключи Signal Protocol';

  @override
  String get authTokens => 'Токены аутентификации';

  @override
  String get contactNamesCache => 'Кэш имён контактов';

  @override
  String get remoteConfig => 'Удалённая конфигурация';

  @override
  String get notificationPrefs => 'Настройки уведомлений';

  @override
  String get serverData => 'Данные сервера';

  @override
  String get serverDataInfo =>
      'Hash хранит минимум данных на сервере, все зашифрованные или временные.';

  @override
  String get serverProfile => 'Профиль';

  @override
  String get serverProfileDetail =>
      'Hash ID, публичные ключи, токен почтового ящика';

  @override
  String get serverPrekeys => 'Предключи';

  @override
  String get serverPrekeysDetail => 'Одноразовые ключи Signal (использованные)';

  @override
  String get serverMessages => 'Сообщения в транзите';

  @override
  String get serverMessagesDetail => 'Удаляются после доставки (макс. 24 ч)';

  @override
  String get serverMedia => 'Медиа в транзите';

  @override
  String get serverMediaDetail => 'Удаляются после загрузки';

  @override
  String get serverContactRequests => 'Запросы контактов';

  @override
  String get serverContactRequestsDetail => 'Истекают через 24 ч';

  @override
  String get serverRateLimits => 'Ограничения скорости';

  @override
  String get serverRateLimitsDetail =>
      'Временные данные защиты от злоупотреблений';

  @override
  String get privacyReassurance =>
      'Hash не может читать ваши сообщения. Все данные зашифрованы сквозным шифрованием. Серверные данные удаляются автоматически.';

  @override
  String get pinTooSimple =>
      'Этот PIN слишком простой. Выберите более надёжный код.';

  @override
  String get genericError => 'Произошла ошибка. Попробуйте снова.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Не удалось создать аккаунт: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Фраза скопирована в буфер обмена';

  @override
  String get copyPhrase => 'Копировать фразу';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Запишите эту фразу в безопасном месте. Если вы потеряете PIN без этой фразы, вы навсегда потеряете доступ к данным.';

  @override
  String get noMessages => 'Нет сообщений';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Удалить все сообщения с $name?';
  }

  @override
  String get confirmation => 'Подтверждение';

  @override
  String get untitled => 'Без названия';

  @override
  String get noSessions => 'Нет сессий';

  @override
  String get unknownContact => 'Неизвестный контакт';

  @override
  String get unnamed => 'Без имени';

  @override
  String get noPendingRequestsAlt => 'Нет ожидающих запросов';

  @override
  String get deleteAllCallHistory => 'Удалить всю историю звонков?';

  @override
  String get noCalls => 'Нет звонков';

  @override
  String get noPreferences => 'Нет предпочтений';

  @override
  String get resetAllMediaPrefs => 'Сбросить все медиа-предпочтения?';

  @override
  String get deleteThisAvatar => 'Удалить этот аватар?';

  @override
  String get deleteAllAvatars => 'Удалить все аватары?';

  @override
  String get noAvatars => 'Нет аватаров';

  @override
  String get deleteThisFile => 'Удалить этот файл?';

  @override
  String get deleteAllMediaFiles => 'Удалить все медиафайлы?';

  @override
  String get noMediaFiles => 'Нет медиафайлов';

  @override
  String get outgoing => 'Исходящий';

  @override
  String get incoming => 'Входящий';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Исчезающий просмотр: $secondsс';
  }

  @override
  String get normalView => 'Обычный просмотр';

  @override
  String get callReasonCompleted => 'Завершён';

  @override
  String get callReasonMissed => 'Пропущен';

  @override
  String get callReasonDeclined => 'Отклонён';

  @override
  String get callReasonFailed => 'Ошибка';

  @override
  String get justNow => 'Только что';

  @override
  String timeAgoMinutes(int count) {
    return '$count мин назад';
  }

  @override
  String timeAgoHours(int count) {
    return '$countч назад';
  }

  @override
  String timeAgoDays(int count) {
    return '$countд назад';
  }

  @override
  String get messageTypeContact => 'Контакт';

  @override
  String get messageTypeLocation => 'Местоположение';

  @override
  String get statusQueued => 'В очереди';

  @override
  String get blockedBadge => 'Заблокирован';

  @override
  String get protectedBadge => 'Защищён';

  @override
  String messageCount(int count) {
    return '$count сообщение(й)';
  }

  @override
  String get deleteQuestion => 'Удалить?';

  @override
  String get transferMyAccountTitle => 'Перенести мой аккаунт';

  @override
  String get loadingError => 'Ошибка загрузки';

  @override
  String get transferToNewDevice => 'Перенести на новое устройство';

  @override
  String get transferInstructions =>
      'На новом устройстве выберите «Восстановить аккаунт» и введите эту информацию:';

  @override
  String get yourHashIdLabel => 'Ваш Hash ID';

  @override
  String get enterYourPinCode => 'Введите ваш PIN-код';

  @override
  String get pinOwnerConfirmation =>
      'Чтобы подтвердить, что вы владелец этого аккаунта';

  @override
  String get scanThisQrCode => 'Сканируйте этот QR code';

  @override
  String get withYourNewDevice => 'Вашим новым устройством';

  @override
  String get orEnterTheCode => 'или введите код';

  @override
  String get transferCodeLabel => 'Код переноса';

  @override
  String get proximityVerification => 'Проверка близости';

  @override
  String get bringDevicesCloser => 'Поднесите оба устройства ближе';

  @override
  String get confirmTransferQuestion => 'Подтвердить перенос?';

  @override
  String get accountWillBeTransferred =>
      'Ваш аккаунт будет перенесён на новое устройство.\n\nЭто устройство будет отключено навсегда.';

  @override
  String get transferComplete => 'Перенос завершён';

  @override
  String get transferSuccessMessage =>
      'Ваш аккаунт успешно перенесён.\n\nПриложение сейчас закроется.';

  @override
  String get manualVerification => 'Ручная проверка';

  @override
  String get codeDisplayedOnBothDevices =>
      'Код, отображённый на обоих устройствах:';

  @override
  String get doesCodeMatchNewDevice =>
      'Совпадает ли этот код с кодом на новом устройстве?';

  @override
  String get verifiedStatus => 'Проверено';

  @override
  String get inProgressStatus => 'В процессе...';

  @override
  String get notAvailableStatus => 'Недоступно';

  @override
  String get codeExpiredRestart => 'Код истёк. Пожалуйста, начните заново.';

  @override
  String get codesDoNotMatchCancelled => 'Коды не совпадают. Перенос отменён.';

  @override
  String transferToDevice(String device) {
    return 'На: $device';
  }

  @override
  String get copiedExclamation => 'Скопировано!';

  @override
  String expiresInTime(String time) {
    return 'Истекает через $time';
  }

  @override
  String get biometricNotAvailable => 'Биометрия недоступна на этом устройстве';

  @override
  String get biometricAuthError => 'Ошибка биометрической аутентификации';

  @override
  String get authenticateForBiometric =>
      'Пожалуйста, аутентифицируйтесь для включения биометрии';

  @override
  String get biometricAuthFailed => 'Биометрическая аутентификация не удалась';

  @override
  String get forceUpdateTitle => 'Требуется обновление';

  @override
  String get forceUpdateMessage =>
      'Доступна новая версия Hash. Обновите для продолжения.';

  @override
  String get updateButton => 'Обновить';

  @override
  String get maintenanceInProgress => 'Идёт техническое обслуживание';

  @override
  String get tryAgainLater => 'Пожалуйста, попробуйте позже';

  @override
  String get information => 'Информация';

  @override
  String get later => 'Позже';

  @override
  String get doYouLikeHash => 'Вам нравится Hash?';

  @override
  String get yourFeedbackHelps => 'Ваш отзыв помогает нам улучшить приложение';

  @override
  String get ratingTerrible => 'Ужасно';

  @override
  String get ratingBad => 'Плохо';

  @override
  String get ratingOk => 'Нормально';

  @override
  String get ratingGood => 'Хорошо';

  @override
  String get ratingExcellent => 'Отлично!';

  @override
  String get donationMessage =>
      'Hash — некоммерческий проект. Ваша поддержка помогает нам продолжать создавать по-настоящему приватный мессенджер.';

  @override
  String get recentConnections => 'Недавние подключения';

  @override
  String get loginInfoText =>
      'Каждая разблокировка PIN записывается локально. Сохраняются только последние 24 часа.';

  @override
  String get connectionCount => 'Подключение(я)';

  @override
  String get periodLabel => 'Период';

  @override
  String get historyLabel => 'История';

  @override
  String get noLoginRecorded => 'Входов не зарегистрировано';

  @override
  String get nextUnlocksAppearHere => 'Следующие разблокировки появятся здесь.';

  @override
  String get dataLocalOnly =>
      'Эти данные хранятся только на вашем устройстве и никогда не передаются.';

  @override
  String get currentSession => 'Текущая';

  @override
  String get todayLabel => 'Сегодня';

  @override
  String get yesterdayLabel => 'Вчера';

  @override
  String get justNowLabel => 'Только что';

  @override
  String minutesAgoLabel(int count) {
    return '$count мин назад';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursч назад';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursч $minutesмин назад';
  }

  @override
  String get noMaintenancePlanned => 'Техобслуживание не запланировано';

  @override
  String get everythingWorkingNormally => 'Всё работает нормально';

  @override
  String get maintenanceTitle => 'Обслуживание';

  @override
  String get maintenanceActiveLabel => 'ИДЁТ';

  @override
  String get maintenancePlannedLabel => 'ЗАПЛАНИРОВАНО';

  @override
  String get locking => 'Блокировка...';

  @override
  String get newMessageNotification => 'Новое сообщение';

  @override
  String get secExplainTitle => 'Как Hash защищает вас';

  @override
  String get secExplainIntro =>
      'Hash создан так, чтобы никто не мог прочитать ваши сообщения.';

  @override
  String get secExplainIntroSub =>
      'Даже мы.\nВот как это работает, простым языком.';

  @override
  String get secJourneyLabel => 'ПУТЕШЕСТВИЕ';

  @override
  String get secJourneyTitle => 'Путешествие вашего сообщения';

  @override
  String get secJourneySubtitle =>
      'От вашего пальца до экрана контакта, каждый шаг защищён. Проследите путь.';

  @override
  String get secStep1Title => 'Вы пишете сообщение';

  @override
  String get secStep1Desc =>
      'Вы набираете «Привет!» в приложении. В этот момент сообщение существует только в памяти телефона. Ничего не отправлено.';

  @override
  String get secStep2Title => 'Шифрование с Signal Protocol';

  @override
  String get secStep2Desc =>
      'Как только вы нажимаете «Отправить», сообщение превращается в набор непонятных символов. Это как если бы ваше сообщение было заперто в сейфе, ключ от которого есть только у вашего контакта.';

  @override
  String get secStep3Title => 'Sealed Sender: невидимый конверт';

  @override
  String get secStep3Desc =>
      'Представьте, что вы отправляете письмо по почте, но без обратного адреса на конверте. Именно это делает Hash. Сообщение опускается в анонимный почтовый ящик. Сервер не знает, кто его отправил.';

  @override
  String get secStep4Title => 'Сервер ничего не видит';

  @override
  String get secStep4Desc =>
      'Сервер действует как слепой почтальон. Он знает только, что «кто-то положил что-то в ящик #A7X9». Он не знает, кто отправил, что это и для кого.';

  @override
  String get secStep4Highlight =>
      'Метаданные не хранятся: ни IP-адрес, ни временная метка, ни связь между отправителем и получателем.';

  @override
  String get secStep5Title => 'Ваш контакт получает сообщение';

  @override
  String get secStep5Desc =>
      'Телефон контакта получает содержимое из анонимного ящика и расшифровывает сообщение своим приватным ключом, который никогда не покидал его устройство. «Привет!» появляется на экране.';

  @override
  String get secStep6Title => 'Сообщение исчезает с сервера';

  @override
  String get secStep6Desc =>
      'Как только контакт подтверждает получение, сервер безвозвратно удаляет сообщение. Ни корзины, ни архива, ни резервной копии. Даже непрочитанные сообщения автоматически уничтожаются через 24 часа.';

  @override
  String get secStep7Title => 'Локальное истечение';

  @override
  String get secStep7Desc =>
      'На телефоне контакта сообщение самоуничтожается в соответствии с выбранной вами длительностью: сразу после прочтения, 5 минут, 1 час... вы решаете.';

  @override
  String get secJourneyConclusion =>
      'Результат: ноль следов на сервере, ноль следов на устройствах. Сообщение существовало ровно столько, сколько нужно для прочтения, затем исчезло.';

  @override
  String get secArchLabel => 'АРХИТЕКТУРА';

  @override
  String get secArchTitle => '5 уровней защиты';

  @override
  String get secArchSubtitle =>
      'Hash не полагается на одну технологию. Каждый уровень усиливает остальные. Даже если один скомпрометирован, ваши данные в безопасности.';

  @override
  String get secLayer1Title => 'Сквозное шифрование';

  @override
  String get secLayer1Desc =>
      'Каждое сообщение шифруется уникальным ключом. Проще говоря: даже если кто-то расшифрует одно сообщение, следующее расшифровать не удастся. У каждого сообщения свой замок.';

  @override
  String get secLayer1Detail =>
      'Для файлов (фото, видео, документов) Hash использует дополнительное шифрование AES-256-GCM. Файл шифруется до отправки с телефона.';

  @override
  String get secLayer2Title => 'Sealed Sender (сетевая анонимность)';

  @override
  String get secLayer2Desc =>
      'Обычные мессенджеры отправляют сообщения с вашей личностью. Это как написать имя на конверте. Hash использует анонимные ящики: сервер доставляет сообщение, не зная отправителя.';

  @override
  String get secLayer2Detail =>
      'Результат: даже при утечке данных сервера невозможно восстановить, кто с кем общается.';

  @override
  String get secLayer3Title => 'Автоматическое удаление';

  @override
  String get secLayer3Desc =>
      'Сообщения удаляются с сервера сразу после подтверждения получения. Даже если сообщение не получено, оно автоматически уничтожается через 24 часа.';

  @override
  String get secLayer3Detail =>
      'На телефоне сообщения самоуничтожаются по выбранной длительности: сразу, 5 мин, 15 мин, 30 мин, 1ч, 3ч, 6ч или 12ч.';

  @override
  String get secLayer4Title => 'Защита локального доступа';

  @override
  String get secLayer4Desc =>
      'Приложение защищено 6-значным PIN и/или биометрией (Face ID, отпечаток). После слишком многих неудачных попыток приложение блокируется с нарастающей задержкой.';

  @override
  String get secLayer5Title => 'Закрытая база данных';

  @override
  String get secLayer5Desc =>
      'На стороне сервера ни один пользователь не может писать в базу данных напрямую. Все действия проходят через защищённые функции.';

  @override
  String get secLayer5Detail =>
      'Это как банковская стойка: вы никогда не касаетесь хранилища сами. Вы делаете запрос, и система проверяет ваши права.';

  @override
  String get secVashLabel => 'УНИКАЛЬНЫЙ В МИРЕ';

  @override
  String get secVashTitle => 'Режим Vash';

  @override
  String get secVashSubtitle =>
      'Система экстренной безопасности, которой нет ни в одном другом мессенджере.';

  @override
  String get secVashScenarioTitle => 'Представьте эту ситуацию';

  @override
  String get secVashScenario1 => 'Кто-то получает доступ к вашему телефону';

  @override
  String get secVashScenario2 => 'У вас просят PIN-код';

  @override
  String get secVashScenario3 => 'Вы хотите срочно стереть все данные';

  @override
  String get secVashSolutionTitle => 'Решение: два PIN-кода';

  @override
  String get secVashSolutionDesc =>
      'Вы настраиваете два разных PIN-кода в Hash:';

  @override
  String get secVashNormalCodeLabel => 'Обычный код';

  @override
  String get secVashNormalCodeDesc =>
      'Открывает приложение нормально со всеми данными';

  @override
  String get secVashCodeLabel2 => 'Код Vash';

  @override
  String get secVashCodeDescription =>
      'Открывает приложение нормально... но все данные тихо удаляются в фоне';

  @override
  String get secVashWhatHappensTitle => 'Что происходит дальше';

  @override
  String get secVashWhatHappensDesc =>
      'Приложение открывается нормально. Никаких оповещений, никаких подозрительных анимаций. Экран просто показывает пустое приложение, как будто вы только что установили его.\n\nНа самом деле все ваши разговоры, контакты и сообщения были необратимо удалены за долю секунды.';

  @override
  String get secCallsLabel => 'ЗВОНКИ И ФАЙЛЫ';

  @override
  String get secCallsTitle => 'Всё зашифровано';

  @override
  String get secCallsSubtitle =>
      'Не только сообщения. Абсолютно всё, что проходит через Hash, зашифровано сквозным шифрованием.';

  @override
  String get secAudioCallTitle => 'Аудиозвонки';

  @override
  String get secAudioCallDesc =>
      'Сквозное шифрование через WebRTC. Голос передаётся напрямую между устройствами.';

  @override
  String get secVideoCallTitle => 'Видеозвонки';

  @override
  String get secVideoCallDesc =>
      'Та же технология, каждый поток шифруется отдельно.';

  @override
  String get secPhotosTitle => 'Фото и видео';

  @override
  String get secPhotosDesc => 'Зашифрованы AES-256-GCM до отправки с телефона.';

  @override
  String get secDocsTitle => 'Документы';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, любой файл. Имя, размер и содержимое зашифрованы.';

  @override
  String get secAnonLabel => 'АНОНИМНОСТЬ';

  @override
  String get secAnonTitle => 'Личность не требуется';

  @override
  String get secAnonSubtitle =>
      'Hash никогда не спрашивает номер телефона или email. Вы идентифицируетесь уникальным анонимным Hash ID.';

  @override
  String get secHashIdTitle => 'Ваш Hash ID';

  @override
  String get secHashIdDesc =>
      'Это ваш уникальный идентификатор. Он ничего не раскрывает о вас: ни имя, ни номер, ни местоположение. Это как псевдоним, который невозможно связать с реальной личностью.\n\nЧтобы добавить контакт, вы делитесь Hash ID или сканируете QR code. Вот и всё. Никакой синхронизации контактов, никаких предложений «Люди, которых вы можете знать».';

  @override
  String get secDataLabel => 'ДАННЫЕ';

  @override
  String get secDataTitle => 'Чего Hash не знает';

  @override
  String get secDataSubtitle =>
      'Лучший способ защитить данные — не собирать их.';

  @override
  String get secNeverCollected => 'Никогда не собирается';

  @override
  String get secNeverItem1 => 'Содержание сообщений';

  @override
  String get secNeverItem2 => 'Список контактов';

  @override
  String get secNeverItem3 => 'Номер телефона';

  @override
  String get secNeverItem4 => 'Адрес электронной почты';

  @override
  String get secNeverItem5 => 'IP-адрес';

  @override
  String get secNeverItem6 => 'Местоположение';

  @override
  String get secNeverItem7 => 'Метаданные (кто с кем общается)';

  @override
  String get secNeverItem8 => 'История звонков';

  @override
  String get secNeverItem9 => 'Адресная книга';

  @override
  String get secNeverItem10 => 'Рекламные идентификаторы';

  @override
  String get secTempStored => 'Хранится временно';

  @override
  String get secTempItem1 => 'Анонимный Hash ID (уникальный идентификатор)';

  @override
  String get secTempItem2 => 'Публичные ключи шифрования';

  @override
  String get secTempItem3 => 'Зашифрованные сообщения в транзите (макс. 24 ч)';

  @override
  String get secTempNote =>
      'Даже эти минимальные данные не могут идентифицировать вас. Ваш Hash ID не связан ни с какой личной информацией.';

  @override
  String get secFooterTitle => 'Ваша конфиденциальность, ваша свобода';

  @override
  String get secFooterDesc =>
      'Hash использует те же технологии шифрования, что и самые требовательные профессиональные приложения. Ваши сообщения защищены математикой, а не обещаниями.';

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
