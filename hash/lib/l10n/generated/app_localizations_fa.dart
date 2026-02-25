// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'بدون ردپا. بدون سازش.';

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
  String get conversations => 'گفتگوها';

  @override
  String get contacts => 'مخاطبین';

  @override
  String get noConversation => 'گفتگویی وجود ندارد';

  @override
  String get noConversationSubtitle =>
      'یک مخاطب اضافه کنید تا گفتگوی امن شروع شود';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count درخواست در انتظار',
      one: '۱ درخواست در انتظار',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count درخواست ارسالی در انتظار',
      one: '۱ درخواست ارسالی در انتظار',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'افزودن مخاطب';

  @override
  String get shareApp => 'اشتراک‌گذاری برنامه';

  @override
  String get newMessage => 'پیام جدید';

  @override
  String get newConversation => 'ارسال پیام';

  @override
  String get settings => 'تنظیمات';

  @override
  String get myHashId => 'Hash ID من';

  @override
  String get supportHash => 'حمایت از Hash';

  @override
  String get supportHashSubtitle => 'Hash یک پروژه غیرانتفاعی است';

  @override
  String get donate => 'کمک مالی';

  @override
  String get appearance => 'ظاهر';

  @override
  String get theme => 'تم';

  @override
  String get themeAuto => 'خودکار';

  @override
  String get themeAutoSubtitle => 'تنظیمات سیستم را دنبال می‌کند';

  @override
  String get themeDark => 'تاریک';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeRecommendation =>
      'تم تاریک برای حریم خصوصی بهتر توصیه می‌شود';

  @override
  String get language => 'زبان';

  @override
  String get languageAuto => 'خودکار (سیستم)';

  @override
  String get notifications => 'اعلان‌ها';

  @override
  String get messages => 'پیام‌ها';

  @override
  String get calls => 'تماس‌ها';

  @override
  String get vibration => 'لرزش';

  @override
  String get notificationContent => 'محتوای اعلان';

  @override
  String get notificationContentFull => 'نمایش همه';

  @override
  String get notificationContentFullDesc => 'نام مخاطب و پیش‌نمایش پیام';

  @override
  String get notificationContentName => 'فقط نام';

  @override
  String get notificationContentNameDesc => 'فقط نام مخاطب را نمایش می‌دهد';

  @override
  String get notificationContentDiscrete => 'محرمانه';

  @override
  String get notificationContentDiscreteDesc =>
      'فقط \"پیام جدید\" نمایش می‌دهد';

  @override
  String get security => 'امنیت';

  @override
  String get howHashProtectsYou => 'Hash چگونه از شما محافظت می‌کند';

  @override
  String get howHashProtectsYouSubtitle => 'امنیت خود را درک کنید';

  @override
  String get accountSecurity => 'امنیت حساب';

  @override
  String get accountSecuritySubtitle => 'PIN، بیومتریک، حالت Vash';

  @override
  String get blockScreenshots => 'مسدود کردن تصاویر صفحه';

  @override
  String get transferDevice => 'انتقال به دستگاه دیگر';

  @override
  String get transferDeviceSubtitle => 'انتقال حساب خود';

  @override
  String get pinCode => 'کد PIN';

  @override
  String get changePin => 'تغییر کد PIN';

  @override
  String get currentPin => 'کد PIN فعلی';

  @override
  String get newPin => 'کد PIN جدید';

  @override
  String get confirmPin => 'تأیید کد PIN';

  @override
  String get pinChanged => 'کد PIN تغییر کرد';

  @override
  String get incorrectPin => 'PIN نادرست';

  @override
  String get pinsDoNotMatch => 'کدهای PIN مطابقت ندارند';

  @override
  String get autoLock => 'قفل خودکار';

  @override
  String get autoLockDelay => 'تأخیر قفل';

  @override
  String get autoLockImmediate => 'فوری';

  @override
  String get autoLockMinute => '۱ دقیقه';

  @override
  String autoLockMinutes(int count) {
    return '$count دقیقه';
  }

  @override
  String get vashCode => 'کد Vash';

  @override
  String get vashModeTitle => 'حالت Vash';

  @override
  String get vashModeExplanation => 'آخرین شبکه امنیتی شما.';

  @override
  String get vashModeDescription =>
      'یک کد PIN دوم انتخاب خواهید کرد. اگر مجبور به باز کردن Hash شدید، این کد را به جای PIN معمولی خود وارد کنید.\n\nبرنامه به طور عادی باز می‌شود، اما همه مکالمات و مخاطبین شما ناپدید شده‌اند.\n\nبرای هر کسی که به صفحه شما نگاه می‌کند، Hash خالی به نظر می‌رسد — انگار هرگز استفاده نشده.';

  @override
  String get vashModeIrreversible => 'این عمل بی‌صدا و برگشت‌ناپذیر است.';

  @override
  String get chooseVashCode => 'انتخاب کد Vash';

  @override
  String get vashCodeInfo =>
      'یک کد PIN دوم که برنامه را به طور عادی اما خالی باز می‌کند.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'اگر این کد را به جای PIN وارد کنید:';

  @override
  String get vashDeleteContacts => 'مخاطبین شما ناپدید می‌شوند';

  @override
  String get vashDeleteMessages => 'مکالمات شما ناپدید می‌شوند';

  @override
  String get vashDeleteHistory => 'یادداشت‌های شما ناپدید می‌شوند';

  @override
  String get vashKeepId =>
      'هویت Hash شما (#XXX-XXX-XXX) بدون تغییر باقی می‌ماند';

  @override
  String get vashAppearNormal =>
      'برنامه عادی اما خالی به نظر می‌رسد، مانند جدید. این عمل برگشت‌ناپذیر است.';

  @override
  String get setupVashCode => 'راه‌اندازی کد Vash';

  @override
  String get modifyVashCode => 'تغییر کد Vash';

  @override
  String get currentVashCode => 'کد Vash فعلی';

  @override
  String get newVashCode => 'کد Vash جدید';

  @override
  String get confirmVashCode => 'تأیید کد Vash';

  @override
  String get vashCodeConfigured => 'کد Vash پیکربندی شد';

  @override
  String get vashCodeModified => 'کد Vash تغییر کرد';

  @override
  String get vashCodeMustDiffer => 'کد Vash باید از PIN متفاوت باشد';

  @override
  String get incorrectVashCode => 'کد Vash نادرست';

  @override
  String get vashWhatToDelete => 'حالت Vash چه چیزی را ناپدید کند؟';

  @override
  String get vashDeleteContactsOption => 'مخاطبین';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'پیام‌ها';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'یادداشت‌ها';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'حالت Vash فعال شد';

  @override
  String get vashCreateSubtitle => 'کدی متفاوت از PIN اصلی خود انتخاب کنید';

  @override
  String get vashConfirmSubtitle => 'کد Vash خود را تأیید کنید';

  @override
  String get pinCodeForEntry => 'کد PIN برای ورود به برنامه';

  @override
  String get vashCodeSection => 'حالت Vash';

  @override
  String get biometric => 'بیومتریک';

  @override
  String get biometricUnlock => 'باز کردن با اثر انگشت یا Face ID';

  @override
  String get enableBiometric => 'فعال کردن بیومتریک';

  @override
  String get biometricWarningMessage =>
      'با فعال کردن بیومتریک، نمی‌توانید از کد Vash برای ورود به برنامه استفاده کنید.\n\nفقط در صورت شکست بیومتریک (پس از چند تلاش ناموفق) می‌توانید از کد Vash استفاده کنید.\n\nآیا مطمئن هستید که می‌خواهید ادامه دهید؟';

  @override
  String get understood => 'متوجه شدم';

  @override
  String get shareAppSubtitle => 'Hash را با نزدیکان خود به اشتراک بگذارید';

  @override
  String get share => 'اشتراک‌گذاری';

  @override
  String get danger => 'خطر';

  @override
  String get deleteAccount => 'حذف حساب من';

  @override
  String get deleteAccountSubtitle => 'عمل برگشت‌ناپذیر';

  @override
  String get deleteAccountConfirmTitle => 'حذف حساب من';

  @override
  String get deleteAccountConfirmMessage =>
      'حساب شما برای همیشه حذف خواهد شد. این عمل برگشت‌ناپذیر است.\n\n- همه گفتگوهای شما\n- همه مخاطبین شما\n- Hash ID شما\n\nباید یک حساب جدید بسازید.';

  @override
  String get deleteForever => 'حذف دائمی';

  @override
  String get cancel => 'لغو';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'حالت Vash فعال شد.';

  @override
  String deletionError(String error) {
    return 'خطای حذف: $error';
  }

  @override
  String get yourSecurity => 'امنیت شما';

  @override
  String get securityInfo =>
      '- رمزنگاری سرتاسری (Signal Protocol)\n- بدون داده در سرورهای ما پس از تحویل\n- کلیدها فقط در دستگاه شما ذخیره می‌شوند\n- کد PIN هرگز به سرور ارسال نمی‌شود';

  @override
  String version(String version) {
    return 'Hash نسخه $version';
  }

  @override
  String get welcome => 'خوش آمدید';

  @override
  String get securityStatement1 => 'پیام‌های شما محافظت شده‌اند.';

  @override
  String get securityStatement2 => 'رمزنگاری سرتاسری.';

  @override
  String get securityStatement3 => 'بدون ردپا. بدون سازش.';

  @override
  String get securityStatement4 => 'حریم خصوصی شما یک حق است.';

  @override
  String get accessBlocked => 'دسترسی مسدود شد';

  @override
  String get tooManyAttempts => 'تلاش‌های بیش از حد';

  @override
  String get pleaseWait => 'لطفاً صبر کنید';

  @override
  String get waitDelay => 'لطفاً تا پایان تأخیر صبر کنید';

  @override
  String attemptCount(int current, int max) {
    return 'تلاش $current از $max';
  }

  @override
  String retryIn(String time) {
    return 'تلاش مجدد در $time';
  }

  @override
  String get forgotPin => 'PIN را فراموش کردید؟ از عبارت بازیابی استفاده کنید';

  @override
  String get useRecoveryPhrase => 'استفاده از عبارت بازیابی';

  @override
  String get recoveryWarningTitle => 'هشدار';

  @override
  String get recoveryWarningMessage => 'بازیابی حساب:';

  @override
  String get recoveryDeleteAllMessages => 'همه پیام‌های شما را حذف می‌کند';

  @override
  String get recoveryWaitDelay => 'نیاز به تأخیر ۱ ساعته دارد';

  @override
  String get recoveryKeepContacts => 'مخاطبین شما را نگه می‌دارد';

  @override
  String get recoveryIrreversible =>
      'این عمل برگشت‌ناپذیر است. پیام‌های شما برای همیشه از دست خواهند رفت.';

  @override
  String get iUnderstand => 'متوجه هستم';

  @override
  String get accountRecovery => 'بازیابی حساب';

  @override
  String get enterRecoveryPhrase =>
      '۲۴ کلمه عبارت بازیابی خود را با فاصله وارد کنید.';

  @override
  String get recoveryPhraseHint => 'کلمه۱ کلمه۲ کلمه۳ ...';

  @override
  String get recover => 'بازیابی';

  @override
  String get recoveryPhraseRequired => 'لطفاً عبارت بازیابی خود را وارد کنید';

  @override
  String get recoveryPhrase24Words => 'عبارت باید دقیقاً ۲۴ کلمه داشته باشد';

  @override
  String get incorrectRecoveryPhrase => 'عبارت بازیابی نادرست';

  @override
  String get recoveryInitError => 'خطا در شروع بازیابی';

  @override
  String get securityDelay => 'تأخیر امنیتی';

  @override
  String get securityDelayMessage =>
      'برای امنیت شما، قبل از ایجاد PIN جدید یک دوره انتظار لازم است.';

  @override
  String get timeRemaining => 'زمان باقی‌مانده';

  @override
  String get messagesDeletedForProtection =>
      'پیام‌های شما برای محافظت حذف شده‌اند.';

  @override
  String get canCloseApp => 'می‌توانید برنامه را ببندید و بعداً برگردید.';

  @override
  String get onboardingTitle1 => 'به Hash خوش آمدید';

  @override
  String get onboardingSubtitle1 => 'پیام‌رسانی که ردپایی از خود نمی‌گذارد';

  @override
  String get onboardingTitle2 => 'رمزنگاری کامل';

  @override
  String get onboardingSubtitle2 =>
      'پیام‌های شما با Signal Protocol سرتاسر رمزنگاری شده‌اند';

  @override
  String get onboardingTitle3 => 'بدون ردپا';

  @override
  String get onboardingSubtitle3 => 'پیام‌ها پس از تحویل از سرورها حذف می‌شوند';

  @override
  String get onboardingTitle4 => 'امنیت شما';

  @override
  String get onboardingSubtitle4 => 'کد PIN، حالت Vash و عبارت بازیابی';

  @override
  String get getStarted => 'شروع کنید';

  @override
  String get next => 'بعدی';

  @override
  String get skip => 'رد شدن';

  @override
  String get alreadyHaveAccount => 'قبلاً حساب دارم';

  @override
  String get transferMyAccount => 'انتقال حساب من';

  @override
  String get createPin => 'ایجاد کد PIN';

  @override
  String get createPinSubtitle =>
      'این کد از دسترسی به برنامه شما محافظت می‌کند';

  @override
  String get confirmYourPin => 'تأیید کد PIN';

  @override
  String get confirmPinSubtitle => 'کد PIN خود را دوباره وارد کنید';

  @override
  String get saveRecoveryPhrase => 'عبارت بازیابی';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'این ۲۴ کلمه را به ترتیب بنویسید. در صورت فراموشی PIN، امکان بازیابی حساب شما را فراهم می‌کنند.';

  @override
  String get phraseWritten => 'عبارت خود را نوشته‌ام';

  @override
  String get warningRecoveryPhrase =>
      'اگر این عبارت را گم کنید و PIN خود را فراموش کنید، دسترسی به حساب خود را از دست خواهید داد.';

  @override
  String get accountTransferred => 'حساب منتقل شد';

  @override
  String get accountTransferredMessage =>
      'حساب شما به دستگاه دیگری منتقل شده است. این نشست دیگر معتبر نیست.';

  @override
  String get accountTransferredInfo =>
      'اگر شما این انتقال را آغاز نکرده‌اید، ممکن است حساب شما به خطر افتاده باشد.';

  @override
  String get logout => 'خروج';

  @override
  String get transferAccount => 'انتقال حساب';

  @override
  String get transferAccountInfo =>
      'حساب Hash خود را به دستگاه جدید منتقل کنید. نشست فعلی شما باطل خواهد شد.';

  @override
  String get generateTransferCode => 'تولید کد انتقال';

  @override
  String get transferCode => 'کد انتقال';

  @override
  String transferCodeExpires(int minutes) {
    return 'این کد در $minutes دقیقه منقضی می‌شود';
  }

  @override
  String get enterCodeOnNewDevice =>
      'این کد را در دستگاه جدید خود وارد کنید تا حساب منتقل شود.';

  @override
  String get generateNewCode => 'تولید کد جدید';

  @override
  String get scanQrCode => 'اسکن QR code';

  @override
  String get scanQrCodeSubtitle =>
      'QR code مخاطب را اسکن کنید تا او را اضافه کنید';

  @override
  String get qrCodeDetected => 'QR code شناسایی شد';

  @override
  String get invalidQrCode => 'QR code نامعتبر';

  @override
  String get cameraPermissionRequired => 'مجوز دوربین لازم است';

  @override
  String get myQrCode => 'QR code من';

  @override
  String get myQrCodeSubtitle =>
      'این QR code را به اشتراک بگذارید تا مخاطبینتان شما را اضافه کنند';

  @override
  String get shareQrCode => 'اشتراک‌گذاری';

  @override
  String get addContactTitle => 'افزودن مخاطب';

  @override
  String get addContactByHashId => 'Hash ID مخاطب خود را وارد کنید';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'جستجو';

  @override
  String get contactNotFound => 'مخاطب یافت نشد';

  @override
  String get contactAlreadyAdded => 'این مخاطب قبلاً در لیست شماست';

  @override
  String get contactAdded => 'مخاطب اضافه شد';

  @override
  String get myProfile => 'پروفایل من';

  @override
  String get myProfileSubtitle =>
      'این اطلاعات را به اشتراک بگذارید تا دیگران شما را اضافه کنند';

  @override
  String get temporaryCode => 'کد موقت';

  @override
  String temporaryCodeExpires(String time) {
    return 'در $time منقضی می‌شود';
  }

  @override
  String get codeExpired => 'کد منقضی شده';

  @override
  String get generateNewCodeButton => 'کد جدید';

  @override
  String get copyHashId => 'کپی ID';

  @override
  String get copyCode => 'کپی کد';

  @override
  String get copiedToClipboard => 'کپی شد';

  @override
  String get showMyQrCode => 'نمایش QR code من';

  @override
  String get orDivider => 'یا';

  @override
  String get openScanner => 'باز کردن اسکنر';

  @override
  String get addManually => 'افزودن دستی';

  @override
  String get contactHashIdLabel => 'Hash ID مخاطب';

  @override
  String get temporaryCodeLabel => 'کد موقت';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'از مخاطب خود بخواهید از پروفایلش کد تولید کند';

  @override
  String get verifyAndAdd => 'تأیید و افزودن';

  @override
  String get fillAllFields => 'لطفاً همه فیلدها را پر کنید';

  @override
  String get invalidHashIdFormat => 'فرمت ID نامعتبر (مثال: 123-456-ABC)';

  @override
  String get userNotFound => 'کاربر یافت نشد';

  @override
  String get cannotAddYourself => 'نمی‌توانید خودتان را اضافه کنید';

  @override
  String get invalidOrExpiredCode => 'کد موقت نامعتبر یا منقضی شده';

  @override
  String get contactFound => 'مخاطب یافت شد!';

  @override
  String get howToCallContact => 'می‌خواهید آنها را چه بنامید؟';

  @override
  String get contactNameHint => 'نام مخاطب';

  @override
  String get addContactButton => 'افزودن';

  @override
  String get contactDetails => 'جزئیات مخاطب';

  @override
  String get contactName => 'نام مخاطب';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'اضافه شده در $date';
  }

  @override
  String get deleteContact => 'حذف مخاطب';

  @override
  String deleteContactConfirm(Object name) {
    return 'این مخاطب حذف شود؟';
  }

  @override
  String get deleteContactMessage => 'این کار گفتگوی کامل را نیز حذف می‌کند.';

  @override
  String get delete => 'حذف';

  @override
  String get typeMessage => 'پیام بنویسید...';

  @override
  String get messageSent => 'ارسال شد';

  @override
  String get messageDelivered => 'تحویل داده شد';

  @override
  String get messageRead => 'خوانده شد';

  @override
  String get messageFailed => 'ارسال نشد';

  @override
  String get now => 'الان';

  @override
  String minutesAgo(int count) {
    return '$countدقیقه';
  }

  @override
  String hoursAgo(int count) {
    return '$countساعت';
  }

  @override
  String daysAgo(int count) {
    return '$countروز';
  }

  @override
  String get today => 'امروز';

  @override
  String get yesterday => 'دیروز';

  @override
  String dateAtTime(String date, String time) {
    return '$date ساعت $time';
  }

  @override
  String get shareMessage =>
      'به من در Hash بپیوندید! یک پیام‌رسان واقعاً خصوصی: رمزنگاری کامل، بدون ردپا در سرورها و حالت وحشت در صورت نیاز.\n\nبرنامه را اینجا دانلود کنید\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'خطا';

  @override
  String get ok => 'تأیید';

  @override
  String get view => 'مشاهده';

  @override
  String get yes => 'بله';

  @override
  String get no => 'خیر';

  @override
  String get save => 'ذخیره';

  @override
  String get edit => 'ویرایش';

  @override
  String get close => 'بستن';

  @override
  String get confirm => 'تأیید';

  @override
  String get loading => 'بارگذاری...';

  @override
  String get retry => 'تلاش مجدد';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'درخواست‌های در انتظار';

  @override
  String get noPendingRequests => 'درخواست در انتظاری نیست';

  @override
  String get pendingRequestsSubtitle => 'این افراد می‌خواهند شما را اضافه کنند';

  @override
  String requestFromUser(String hashId) {
    return 'درخواست از $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'در $days روز منقضی می‌شود';
  }

  @override
  String get acceptRequest => 'قبول';

  @override
  String get rejectRequest => 'رد';

  @override
  String get requestAccepted => 'درخواست پذیرفته شد';

  @override
  String get requestRejected => 'درخواست رد شد';

  @override
  String get requestSent => 'درخواست ارسال شد!';

  @override
  String get requestSentSubtitle =>
      'درخواست شما ارسال شد. کاربر باید آن را بپذیرد تا بتوانید گفتگو کنید.';

  @override
  String get requestAlreadyPending => 'یک درخواست در انتظار است';

  @override
  String get requestAlreadySentByOther =>
      'این شخص قبلاً به شما درخواست فرستاده است';

  @override
  String get addByHashId => 'افزودن با Hash ID';

  @override
  String get addByHashIdSubtitle => 'Hash ID و کد موقت مخاطب را وارد کنید';

  @override
  String get enterTemporaryCode => 'کد ۶ رقمی را وارد کنید';

  @override
  String get sendRequest => 'ارسال درخواست';

  @override
  String get acceptContactTitle => 'پذیرش مخاطب';

  @override
  String get acceptContactSubtitle => 'می‌توانید نام سفارشی بدهید';

  @override
  String get leaveEmptyForHashId => 'برای استفاده از Hash ID خالی بگذارید';

  @override
  String get firstName => 'نام';

  @override
  String get lastName => 'نام خانوادگی';

  @override
  String get notes => 'یادداشت‌ها';

  @override
  String get notesHint => 'یادداشت‌های شخصی درباره این مخاطب';

  @override
  String get photoOptional => 'عکس (اختیاری)';

  @override
  String get contactNameOptional => 'نام (اختیاری)';

  @override
  String get notesOptional => 'یادداشت‌ها (اختیاری)';

  @override
  String get storedLocally => 'فقط در دستگاه شما ذخیره شده';

  @override
  String get encryptedMessageLabel => 'پیام رمزنگاری‌شده';

  @override
  String get identityMessageHint => 'شما کی هستید؟ چگونه یکدیگر را می‌شناسید؟';

  @override
  String get messageWillBeSentEncrypted =>
      'این پیام رمزنگاری شده و به گیرنده ارسال خواهد شد';

  @override
  String get sendRequestButton => 'ارسال درخواست';

  @override
  String get requestExpiresIn24h =>
      'درخواست در صورت عدم پذیرش در ۲۴ ساعت منقضی می‌شود';

  @override
  String get theyAlreadySentYouRequest =>
      'این شخص قبلاً به شما درخواست فرستاده است';

  @override
  String get requests => 'درخواست‌ها';

  @override
  String get receivedRequests => 'دریافت‌شده';

  @override
  String get sentRequests => 'ارسال‌شده';

  @override
  String get noSentRequests => 'درخواست ارسالی نیست';

  @override
  String get cancelRequest => 'لغو';

  @override
  String get deleteRequest => 'حذف درخواست';

  @override
  String get requestCancelled => 'درخواست لغو شد';

  @override
  String sentTo(String hashId) {
    return 'ارسال شده به $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'در $time منقضی می‌شود';
  }

  @override
  String receivedAgo(String time) {
    return '$time پیش دریافت شد';
  }

  @override
  String get messageFromRequester => 'پیام از درخواست‌کننده';

  @override
  String get copy => 'کپی';

  @override
  String get messageInfo => 'اطلاعات پیام';

  @override
  String get messageDirection => 'جهت';

  @override
  String get messageSentByYou => 'ارسال‌شده توسط شما';

  @override
  String get messageReceived => 'دریافت‌شده';

  @override
  String get messageSentAt => 'ارسال‌شده در';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'وضعیت';

  @override
  String get messageReadAt => 'خوانده‌شده در';

  @override
  String get messageType => 'نوع';

  @override
  String get messageSize => 'اندازه';

  @override
  String get messageExpiresAt => 'منقضی می‌شود در';

  @override
  String get messageEncrypted => 'رمزنگاری سرتاسری';

  @override
  String get messageStatusSending => 'در حال ارسال...';

  @override
  String get messageStatusSent => 'ارسال شد';

  @override
  String get messageStatusDelivered => 'تحویل داده شد';

  @override
  String get messageStatusRead => 'خوانده شد';

  @override
  String get messageStatusFailed => 'ناموفق';

  @override
  String get serverStatus => 'سرور';

  @override
  String get onServer => 'در انتظار تحویل';

  @override
  String get deletedFromServer => 'حذف شد';

  @override
  String get messageTypeText => 'متن';

  @override
  String get messageTypeImage => 'تصویر';

  @override
  String get messageTypeVideo => 'ویدیو';

  @override
  String get messageTypeVoice => 'صدا';

  @override
  String get messageTypeFile => 'فایل';

  @override
  String get indefinitely => 'نامحدود';

  @override
  String get hoursShort => 'ساعت';

  @override
  String get minutesShort => 'دقیقه';

  @override
  String get hours => 'ساعت';

  @override
  String get minutes => 'دقیقه';

  @override
  String get seconds => 'ثانیه';

  @override
  String get ephemeralMessages => 'پیام‌های ناپایدار';

  @override
  String get ephemeralMessagesDescription =>
      'پیام‌ها پس از این مدت به طور خودکار حذف می‌شوند';

  @override
  String get ephemeralImmediate => 'فوری (پس از خواندن)';

  @override
  String get ephemeralImmediateDesc => 'بلافاصله پس از خواندن حذف می‌شود';

  @override
  String get ephemeralMyPreference => 'ترجیح من';

  @override
  String get ephemeralMyPreferenceDesc => 'استفاده از تنظیم کلی';

  @override
  String get ephemeralDefaultSetting => 'مدت پیام';

  @override
  String get ephemeralChooseDefault => 'توصیه‌شده';

  @override
  String get ephemeral30Seconds => '۳۰ ثانیه';

  @override
  String get ephemeral30SecondsDesc => 'حذف ۳۰ ثانیه پس از خواندن';

  @override
  String get ephemeral5Minutes => '۵ دقیقه';

  @override
  String get ephemeral5MinutesDesc => 'حذف ۵ دقیقه پس از خواندن';

  @override
  String get ephemeral1Hour => '۱ ساعت';

  @override
  String get ephemeral1HourDesc => 'حذف ۱ ساعت پس از خواندن';

  @override
  String get ephemeral3Hours => '۳ ساعت';

  @override
  String get ephemeral6Hours => '۶ ساعت';

  @override
  String get ephemeral6HoursDesc => 'حذف ۶ ساعت پس از خواندن';

  @override
  String get ephemeral12Hours => '۱۲ ساعت';

  @override
  String get ephemeral24Hours => '۲۴ ساعت';

  @override
  String get ephemeral24HoursDesc => 'حذف ۲۴ ساعت پس از خواندن';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'مدت سفارشی';

  @override
  String get howItWorks => 'نحوه کار';

  @override
  String get ephemeralExplanation1 =>
      'پیام‌ها بلافاصله پس از دریافت از سرور حذف می‌شوند.';

  @override
  String get ephemeralExplanation2 =>
      'این تنظیم مشخص می‌کند پیام‌ها چه زمانی پس از خواندن از تلفن شما ناپدید شوند.';

  @override
  String get ephemeralExplanation3 =>
      'مخاطب شما تنظیمات خود را برای تلفن خود دارد.';

  @override
  String get mute1Hour => '۱ ساعت';

  @override
  String get mute8Hours => '۸ ساعت';

  @override
  String get mute1Day => '۱ روز';

  @override
  String get mute1Week => '۱ هفته';

  @override
  String get muteAlways => 'همیشه';

  @override
  String get muteExplanation => 'اعلانی برای این مخاطب دریافت نخواهید کرد';

  @override
  String get showCallsInRecents => 'نمایش در تماس‌های اخیر';

  @override
  String get showCallsInRecentsSubtitle =>
      'تماس‌های Hash در تاریخچه تلفن نمایش داده می‌شوند';

  @override
  String get feedback => 'بازخورد';

  @override
  String get muteNotifications => 'بی‌صدا کردن اعلان‌ها';

  @override
  String get muteDescription => 'اعلانی برای این مخاطب دریافت نخواهید کرد';

  @override
  String mutedUntil(String time) {
    return 'بی‌صدا تا $time';
  }

  @override
  String get notMuted => 'اعلان‌ها فعال';

  @override
  String get unmute => 'فعال کردن صدا';

  @override
  String get notificationSound => 'صدای اعلان';

  @override
  String get defaultSound => 'پیش‌فرض';

  @override
  String get chatSettings => 'تنظیمات گفتگو';

  @override
  String get bubbleColor => 'رنگ حباب';

  @override
  String get backgroundColor => 'رنگ پس‌زمینه';

  @override
  String get backgroundImage => 'تصویر پس‌زمینه';

  @override
  String get chatBackground => 'پس‌زمینه گفتگو';

  @override
  String get customColor => 'سفارشی';

  @override
  String get defaultColor => 'پیش‌فرض';

  @override
  String get imageSelected => 'تصویر انتخاب شد';

  @override
  String get noImage => 'بدون تصویر';

  @override
  String get color => 'رنگ';

  @override
  String get image => 'تصویر';

  @override
  String get tapToSelectImage => 'برای انتخاب تصویر ضربه بزنید';

  @override
  String get changeImage => 'تغییر تصویر';

  @override
  String get previewMessageReceived => 'سلام!';

  @override
  String get previewMessageSent => 'درود!';

  @override
  String get messageAction => 'پیام';

  @override
  String get callAction => 'تماس';

  @override
  String get videoAction => 'ویدیو';

  @override
  String get personalNotes => 'یادداشت‌های شخصی';

  @override
  String get addNotes => 'افزودن یادداشت...';

  @override
  String get noNotes => 'بدون یادداشت';

  @override
  String get messageNotifications => 'اعلان‌های پیام';

  @override
  String get callNotifications => 'اعلان‌های تماس';

  @override
  String get useGradient => 'استفاده از گرادیانت';

  @override
  String get gradientStart => 'رنگ شروع';

  @override
  String get gradientEnd => 'رنگ پایان';

  @override
  String get preview => 'پیش‌نمایش';

  @override
  String get reset => 'بازنشانی';

  @override
  String get securityNumber => 'شماره امنیتی';

  @override
  String securityNumberDescription(String name) {
    return 'تأیید کنید که شماره امنیتی با دستگاه $name مطابقت دارد';
  }

  @override
  String get verifyEncryption => 'تأیید رمزنگاری سرتاسری';

  @override
  String get tapToCopy => 'برای کپی ضربه بزنید';

  @override
  String get howToVerify => 'چگونه تأیید کنیم';

  @override
  String get verifyStep1 => 'مخاطب خود را حضوری ملاقات کنید یا تماس بگیرید';

  @override
  String get verifyStep2 =>
      'شماره‌های امنیتی را مقایسه کنید یا QR code اسکن کنید';

  @override
  String get verifyStep3 => 'اگر مطابقت دارند، گفتگوی شما امن است';

  @override
  String get scanToVerify => 'اسکن برای تأیید';

  @override
  String get reportSpam => 'گزارش هرزنامه';

  @override
  String get reportSpamSubtitle => 'گزارش این مخاطب به عنوان هرزنامه';

  @override
  String get reportSpamDescription =>
      'این مخاطب به صورت ناشناس گزارش می‌شود. هویت شما فاش نمی‌شود. آیا مطمئن هستید؟';

  @override
  String get report => 'گزارش';

  @override
  String get spamReported => 'هرزنامه گزارش شد';

  @override
  String get reportError => 'ارسال گزارش ناموفق بود. لطفاً دوباره تلاش کنید.';

  @override
  String get reportRateLimited => 'به حداکثر تعداد گزارش‌های امروز رسیده‌اید.';

  @override
  String get blockContact => 'مسدود کردن مخاطب';

  @override
  String get blockContactDescription =>
      'این مخاطب دیگر نمی‌تواند برای شما پیام بفرستد یا تماس بگیرد. مطلع نخواهد شد.';

  @override
  String get unblockContact => 'رفع مسدودیت مخاطب';

  @override
  String get unblockContactDescription =>
      'این مخاطب دوباره می‌تواند برای شما پیام بفرستد و تماس بگیرد.';

  @override
  String get contactBlocked => 'مخاطب مسدود شد';

  @override
  String get contactUnblocked => 'مسدودیت مخاطب رفع شد';

  @override
  String get contactIsBlocked => 'این مخاطب مسدود است';

  @override
  String get unblock => 'رفع مسدودیت';

  @override
  String get deleteContactSubtitle => 'حذف این مخاطب و گفتگو';

  @override
  String get confirmWithPin => 'تأیید با PIN';

  @override
  String get enterPinToConfirm => 'PIN خود را برای تأیید این عمل وارد کنید';

  @override
  String get profilePhoto => 'عکس پروفایل';

  @override
  String get takePhoto => 'عکس بگیرید';

  @override
  String get chooseFromGallery => 'انتخاب از گالری';

  @override
  String get removePhoto => 'حذف عکس';

  @override
  String get viewContactHashId => 'مشاهده شناسه مخاطب';

  @override
  String get hashIdPartiallyMasked =>
      'برای امنیت شما و حریم خصوصی مخاطبتان تا حدی پنهان شده';

  @override
  String get addFirstContact => 'اولین مخاطب خود را اضافه کنید';

  @override
  String get addFirstContactSubtitle =>
      'QR code خود را به اشتراک بگذارید یا مال دوستتان را اسکن کنید';

  @override
  String get directory => 'فهرست';

  @override
  String get noContacts => 'مخاطبی نیست';

  @override
  String get noContactsSubtitle => 'یک مخاطب اضافه کنید تا شروع کنید';

  @override
  String get sendMessageAction => 'ارسال پیام';

  @override
  String get audioCall => 'تماس صوتی';

  @override
  String get videoCall => 'تماس تصویری';

  @override
  String get viewProfile => 'مشاهده پروفایل';

  @override
  String get deleteContactDirectory => 'حذف مخاطب';

  @override
  String get scanShort => 'اسکن';

  @override
  String get addShort => 'افزودن';

  @override
  String deleteContactConfirmName(String name) {
    return 'آیا مطمئن هستید که می‌خواهید $name را حذف کنید؟';
  }

  @override
  String get noNotesTitle => 'یادداشتی نیست';

  @override
  String get noNotesSubtitle => 'اولین یادداشت خود را بسازید';

  @override
  String get newNote => 'یادداشت جدید';

  @override
  String get editNote => 'ویرایش یادداشت';

  @override
  String get deleteNote => 'حذف یادداشت';

  @override
  String get deleteNoteConfirm =>
      'آیا مطمئن هستید که می‌خواهید این یادداشت را حذف کنید؟';

  @override
  String get noteTitle => 'عنوان';

  @override
  String get noteContent => 'محتوا';

  @override
  String get addItem => 'افزودن مورد';

  @override
  String get pinNote => 'سنجاق';

  @override
  String get unpinNote => 'برداشتن سنجاق';

  @override
  String get noteColor => 'رنگ';

  @override
  String get notePassword => 'رمز عبور';

  @override
  String get setPassword => 'تنظیم رمز عبور';

  @override
  String get changePassword => 'تغییر رمز عبور';

  @override
  String get removePassword => 'حذف رمز عبور';

  @override
  String get enterPassword => 'رمز عبور را وارد کنید';

  @override
  String get confirmPassword => 'تأیید رمز عبور';

  @override
  String get passwordPin => 'کد PIN';

  @override
  String get passwordText => 'رمز عبور متنی';

  @override
  String get protectedNote => 'یادداشت محافظت‌شده';

  @override
  String get incorrectPassword => 'رمز عبور نادرست';

  @override
  String get passwordSet => 'رمز عبور تنظیم شد';

  @override
  String get passwordRemoved => 'رمز عبور حذف شد';

  @override
  String get notesBiometric => 'Face ID برای یادداشت‌ها';

  @override
  String get notesBiometricSubtitle =>
      'نیاز به احراز هویت بیومتریک برای باز کردن یادداشت‌های محافظت‌شده';

  @override
  String get textNote => 'یادداشت متنی';

  @override
  String get checklistNote => 'چک‌لیست';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total وظیفه';
  }

  @override
  String get autoSaved => 'ذخیره شد';

  @override
  String get searchNotes => 'جستجوی یادداشت‌ها';

  @override
  String get legalConsent => 'رضایت قانونی';

  @override
  String get confirmAge13 => 'تأیید می‌کنم که حداقل ۱۳ سال دارم';

  @override
  String get acceptLegalStart => 'می‌پذیرم ';

  @override
  String get privacyPolicy => 'سیاست حریم خصوصی';

  @override
  String get termsOfService => 'شرایط خدمات';

  @override
  String get andThe => ' و ';

  @override
  String get continueButton => 'ادامه';

  @override
  String get mustAcceptTerms => 'برای ادامه باید هر دو شرط را بپذیرید';

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
  String get support => 'پشتیبانی';

  @override
  String get contactSupport => 'تماس با پشتیبانی';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'گزارش سوء‌استفاده';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'قانونی';

  @override
  String get legalEntity => 'شخص حقوقی';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'سنجاق';

  @override
  String get unpinConversation => 'برداشتن سنجاق';

  @override
  String get hideConversation => 'حذف از فید';

  @override
  String get deleteConversation => 'حذف گفتگو';

  @override
  String get deleteConversationConfirm =>
      'PIN خود را برای تأیید حذف همه پیام‌ها وارد کنید';

  @override
  String get noConversations => 'هنوز گفتگویی نیست';

  @override
  String get startConversation => 'شروع';

  @override
  String get microphonePermissionRequired => 'دسترسی میکروفون لازم است';

  @override
  String get microphonePermissionExplanation =>
      'Hash برای برقراری تماس به میکروفون نیاز دارد.';

  @override
  String get cameraPermissionExplanation =>
      'Hash برای تماس تصویری به دوربین نیاز دارد.';

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
  String get openSettings => 'باز کردن تنظیمات';

  @override
  String get callConnecting => 'اتصال...';

  @override
  String get callRinging => 'زنگ زدن...';

  @override
  String get callReconnecting => 'اتصال مجدد...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'اتصال مجدد ($secondsث)';
  }

  @override
  String get callPaused => 'متوقف';

  @override
  String get callPausedSubtitle => 'تماس هنوز فعال است';

  @override
  String get callRemoteMicMuted => 'میکروفون مخاطب بی‌صداست';

  @override
  String get callMiniControlsMute => 'بی‌صدا';

  @override
  String get callMiniControlsUnmute => 'فعال کردن صدا';

  @override
  String get callMiniControlsHangUp => 'قطع تماس';

  @override
  String get callMiniControlsReturn => 'بازگشت به تماس';

  @override
  String get callNetworkPoor => 'اتصال ناپایدار';

  @override
  String get callNetworkLost => 'اتصال قطع شد';

  @override
  String get callEndedTitle => 'تماس پایان یافت';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'داده‌های دستگاه';

  @override
  String get deviceDataSubtitle => 'فضای ذخیره‌سازی محلی و سرور';

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
  String get localStorage => 'فضای ذخیره‌سازی محلی';

  @override
  String get onThisDevice => 'در این دستگاه';

  @override
  String get encryptedDatabases => 'پایگاه‌های داده رمزنگاری‌شده';

  @override
  String get files => 'فایل‌ها';

  @override
  String get secureKeychain => 'زنجیره کلید امن';

  @override
  String get cache => 'حافظه پنهان';

  @override
  String get contactsDetail => 'نام‌ها، آواتارها، کلیدهای Signal';

  @override
  String get messagesDetail => 'مکالمات رمزنگاری‌شده';

  @override
  String get notesDetail => 'یادداشت‌های شخصی';

  @override
  String get signalSessions => 'نشست‌های Signal';

  @override
  String get signalSessionsDetail => 'نشست‌های رمزنگاری';

  @override
  String get pendingContacts => 'مخاطبین در انتظار';

  @override
  String get pendingContactsDetail => 'درخواست‌های در انتظار';

  @override
  String get callHistory => 'تماس‌ها';

  @override
  String get callHistoryDetail => 'سابقه تماس';

  @override
  String get preferences => 'ترجیحات';

  @override
  String get preferencesDetail => 'ترجیحات رسانه و تماس';

  @override
  String get avatars => 'آواتارها';

  @override
  String get media => 'رسانه';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فایل',
      one: '۱ فایل',
      zero: 'بدون فایل',
    );
    return '$_temp0';
  }

  @override
  String get active => 'فعال';

  @override
  String get notDefined => 'تعریف نشده';

  @override
  String get biometrics => 'بیومتریک';

  @override
  String get recoveryPhrase => 'عبارت بازیابی';

  @override
  String get identity => 'هویت (Hash ID)';

  @override
  String get signalKeys => 'کلیدهای Signal Protocol';

  @override
  String get authTokens => 'توکن‌های احراز هویت';

  @override
  String get contactNamesCache => 'حافظه پنهان نام مخاطبین';

  @override
  String get remoteConfig => 'پیکربندی راه دور';

  @override
  String get notificationPrefs => 'ترجیحات اعلان';

  @override
  String get serverData => 'داده‌های سرور';

  @override
  String get serverDataInfo =>
      'Hash حداقل داده را در سرور نگه می‌دارد، همه رمزنگاری‌شده یا موقت.';

  @override
  String get serverProfile => 'پروفایل';

  @override
  String get serverProfileDetail => 'Hash ID، کلیدهای عمومی، توکن صندوق پستی';

  @override
  String get serverPrekeys => 'پیش‌کلیدها';

  @override
  String get serverPrekeysDetail => 'کلیدهای یک‌بار مصرف Signal (مصرف‌شده)';

  @override
  String get serverMessages => 'پیام‌های در حال انتقال';

  @override
  String get serverMessagesDetail => 'پس از تحویل حذف می‌شوند (حداکثر ۲۴ ساعت)';

  @override
  String get serverMedia => 'رسانه در حال انتقال';

  @override
  String get serverMediaDetail => 'پس از دانلود حذف می‌شود';

  @override
  String get serverContactRequests => 'درخواست‌های مخاطب';

  @override
  String get serverContactRequestsDetail => 'پس از ۲۴ ساعت منقضی می‌شوند';

  @override
  String get serverRateLimits => 'محدودیت‌های نرخ';

  @override
  String get serverRateLimitsDetail => 'داده‌های موقت ضد سوء‌استفاده';

  @override
  String get privacyReassurance =>
      'Hash نمی‌تواند پیام‌های شما را بخواند. همه داده‌ها سرتاسر رمزنگاری شده‌اند. داده‌های سرور به طور خودکار حذف می‌شوند.';

  @override
  String get pinTooSimple => 'این PIN خیلی ساده است. کد امن‌تری انتخاب کنید.';

  @override
  String get genericError => 'خطایی رخ داد. لطفاً دوباره تلاش کنید.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'ایجاد حساب ناموفق: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'عبارت در کلیپ‌بورد کپی شد';

  @override
  String get copyPhrase => 'کپی عبارت';

  @override
  String get recoveryPhraseSecurityWarning =>
      'این عبارت را در مکانی امن بنویسید. اگر PIN خود را بدون این عبارت گم کنید، برای همیشه دسترسی به داده‌های خود را از دست خواهید داد.';

  @override
  String get noMessages => 'پیامی نیست';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'همه پیام‌ها با $name حذف شوند؟';
  }

  @override
  String get confirmation => 'تأیید';

  @override
  String get untitled => 'بدون عنوان';

  @override
  String get noSessions => 'نشستی نیست';

  @override
  String get unknownContact => 'مخاطب ناشناس';

  @override
  String get unnamed => 'بدون نام';

  @override
  String get noPendingRequestsAlt => 'درخواست در انتظاری نیست';

  @override
  String get deleteAllCallHistory => 'همه سابقه تماس حذف شود؟';

  @override
  String get noCalls => 'تماسی نیست';

  @override
  String get noPreferences => 'ترجیحی نیست';

  @override
  String get resetAllMediaPrefs => 'همه ترجیحات رسانه بازنشانی شوند؟';

  @override
  String get deleteThisAvatar => 'این آواتار حذف شود؟';

  @override
  String get deleteAllAvatars => 'همه آواتارها حذف شوند؟';

  @override
  String get noAvatars => 'آواتاری نیست';

  @override
  String get deleteThisFile => 'این فایل حذف شود؟';

  @override
  String get deleteAllMediaFiles => 'همه رسانه‌ها حذف شوند؟';

  @override
  String get noMediaFiles => 'رسانه‌ای نیست';

  @override
  String get outgoing => 'خروجی';

  @override
  String get incoming => 'ورودی';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'نمایش ناپایدار: $secondsث';
  }

  @override
  String get normalView => 'نمایش عادی';

  @override
  String get callReasonCompleted => 'تکمیل‌شده';

  @override
  String get callReasonMissed => 'بی‌پاسخ';

  @override
  String get callReasonDeclined => 'رد شده';

  @override
  String get callReasonFailed => 'ناموفق';

  @override
  String get justNow => 'همین الان';

  @override
  String timeAgoMinutes(int count) {
    return '$count دقیقه پیش';
  }

  @override
  String timeAgoHours(int count) {
    return '$count ساعت پیش';
  }

  @override
  String timeAgoDays(int count) {
    return '$count روز پیش';
  }

  @override
  String get messageTypeContact => 'مخاطب';

  @override
  String get messageTypeLocation => 'موقعیت';

  @override
  String get statusQueued => 'در صف';

  @override
  String get blockedBadge => 'مسدود';

  @override
  String get protectedBadge => 'محافظت‌شده';

  @override
  String messageCount(int count) {
    return '$count پیام';
  }

  @override
  String get deleteQuestion => 'حذف شود؟';

  @override
  String get transferMyAccountTitle => 'انتقال حساب من';

  @override
  String get loadingError => 'خطای بارگذاری';

  @override
  String get transferToNewDevice => 'انتقال به دستگاه جدید';

  @override
  String get transferInstructions =>
      'در دستگاه جدید خود، \"بازیابی حساب من\" را انتخاب کنید و این اطلاعات را وارد کنید:';

  @override
  String get yourHashIdLabel => 'Hash ID شما';

  @override
  String get enterYourPinCode => 'کد PIN خود را وارد کنید';

  @override
  String get pinOwnerConfirmation => 'برای تأیید اینکه مالک این حساب هستید';

  @override
  String get scanThisQrCode => 'این QR code را اسکن کنید';

  @override
  String get withYourNewDevice => 'با دستگاه جدید خود';

  @override
  String get orEnterTheCode => 'یا کد را وارد کنید';

  @override
  String get transferCodeLabel => 'کد انتقال';

  @override
  String get proximityVerification => 'تأیید مجاورت';

  @override
  String get bringDevicesCloser => 'هر دو دستگاه را نزدیک‌تر کنید';

  @override
  String get confirmTransferQuestion => 'تأیید انتقال؟';

  @override
  String get accountWillBeTransferred =>
      'حساب شما به دستگاه جدید منتقل خواهد شد.\n\nاین دستگاه برای همیشه قطع خواهد شد.';

  @override
  String get transferComplete => 'انتقال کامل شد';

  @override
  String get transferSuccessMessage =>
      'حساب شما با موفقیت منتقل شد.\n\nبرنامه اکنون بسته می‌شود.';

  @override
  String get manualVerification => 'تأیید دستی';

  @override
  String get codeDisplayedOnBothDevices => 'کد نمایش‌داده‌شده در هر دو دستگاه:';

  @override
  String get doesCodeMatchNewDevice =>
      'آیا این کد با کد دستگاه جدید مطابقت دارد؟';

  @override
  String get verifiedStatus => 'تأیید شد';

  @override
  String get inProgressStatus => 'در حال انجام...';

  @override
  String get notAvailableStatus => 'در دسترس نیست';

  @override
  String get codeExpiredRestart => 'کد منقضی شده. لطفاً دوباره شروع کنید.';

  @override
  String get codesDoNotMatchCancelled => 'کدها مطابقت ندارند. انتقال لغو شد.';

  @override
  String transferToDevice(String device) {
    return 'به: $device';
  }

  @override
  String get copiedExclamation => 'کپی شد!';

  @override
  String expiresInTime(String time) {
    return 'در $time منقضی می‌شود';
  }

  @override
  String get biometricNotAvailable => 'بیومتریک در این دستگاه در دسترس نیست';

  @override
  String get biometricAuthError => 'خطا در احراز هویت بیومتریک';

  @override
  String get authenticateForBiometric =>
      'لطفاً برای فعال‌سازی بیومتریک احراز هویت کنید';

  @override
  String get biometricAuthFailed => 'احراز هویت بیومتریک ناموفق بود';

  @override
  String get forceUpdateTitle => 'به‌روزرسانی لازم است';

  @override
  String get forceUpdateMessage =>
      'نسخه جدیدی از Hash در دسترس است. لطفاً برای ادامه به‌روزرسانی کنید.';

  @override
  String get updateButton => 'به‌روزرسانی';

  @override
  String get maintenanceInProgress => 'تعمیرات در حال انجام';

  @override
  String get tryAgainLater => 'لطفاً بعداً دوباره تلاش کنید';

  @override
  String get information => 'اطلاعات';

  @override
  String get later => 'بعداً';

  @override
  String get doYouLikeHash => 'آیا Hash را دوست دارید؟';

  @override
  String get yourFeedbackHelps =>
      'بازخورد شما به ما کمک می‌کند برنامه را بهبود دهیم';

  @override
  String get ratingTerrible => 'وحشتناک';

  @override
  String get ratingBad => 'بد';

  @override
  String get ratingOk => 'متوسط';

  @override
  String get ratingGood => 'خوب';

  @override
  String get ratingExcellent => 'عالی!';

  @override
  String get donationMessage =>
      'Hash یک پروژه غیرانتفاعی است. حمایت شما به ما کمک می‌کند تا یک پیام‌رسان واقعاً خصوصی بسازیم.';

  @override
  String get recentConnections => 'اتصالات اخیر';

  @override
  String get loginInfoText =>
      'هر باز کردن با PIN به صورت محلی ثبت می‌شود. فقط ۲۴ ساعت آخر نگهداری می‌شود.';

  @override
  String get connectionCount => 'اتصال(ها)';

  @override
  String get periodLabel => 'دوره';

  @override
  String get historyLabel => 'تاریخچه';

  @override
  String get noLoginRecorded => 'ورودی ثبت نشده';

  @override
  String get nextUnlocksAppearHere =>
      'بازگشایی‌های بعدی اینجا نمایش داده می‌شوند.';

  @override
  String get dataLocalOnly =>
      'این داده‌ها فقط در دستگاه شما ذخیره می‌شوند و هرگز ارسال نمی‌شوند.';

  @override
  String get currentSession => 'فعلی';

  @override
  String get todayLabel => 'امروز';

  @override
  String get yesterdayLabel => 'دیروز';

  @override
  String get justNowLabel => 'همین الان';

  @override
  String minutesAgoLabel(int count) {
    return '$count دقیقه پیش';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours ساعت پیش';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours ساعت و $minutes دقیقه پیش';
  }

  @override
  String get noMaintenancePlanned => 'تعمیراتی برنامه‌ریزی نشده';

  @override
  String get everythingWorkingNormally => 'همه چیز به طور عادی کار می‌کند';

  @override
  String get maintenanceTitle => 'تعمیرات';

  @override
  String get maintenanceActiveLabel => 'در حال انجام';

  @override
  String get maintenancePlannedLabel => 'برنامه‌ریزی شده';

  @override
  String get locking => 'قفل شدن...';

  @override
  String get newMessageNotification => 'پیام جدید';

  @override
  String get secExplainTitle => 'Hash چگونه از شما محافظت می‌کند';

  @override
  String get secExplainIntro =>
      'Hash طراحی شده تا هیچ‌کس نتواند پیام‌های شما را بخواند.';

  @override
  String get secExplainIntroSub =>
      'حتی ما.\nاینجا نحوه کار آن به زبان ساده توضیح داده شده.';

  @override
  String get secJourneyLabel => 'سفر';

  @override
  String get secJourneyTitle => 'سفر پیام شما';

  @override
  String get secJourneySubtitle =>
      'از انگشت شما تا صفحه مخاطبتان، هر مرحله محافظت شده است. مسیر را دنبال کنید.';

  @override
  String get secStep1Title => 'پیام خود را می‌نویسید';

  @override
  String get secStep1Desc =>
      '\"سلام!\" را در برنامه تایپ می‌کنید. در این مرحله، پیام فقط در حافظه تلفن شما وجود دارد. هیچ چیز ارسال نشده.';

  @override
  String get secStep2Title => 'رمزنگاری با Signal Protocol';

  @override
  String get secStep2Desc =>
      'به محض فشردن \"ارسال\"، پیام شما به رشته‌ای از کاراکترهای نامفهوم تبدیل می‌شود. مثل اینکه پیام شما در گاوصندوقی قفل شود که فقط مخاطب شما کلید آن را دارد.';

  @override
  String get secStep3Title => 'Sealed Sender: پاکت نامه نامرئی';

  @override
  String get secStep3Desc =>
      'تصور کنید نامه‌ای بدون آدرس فرستنده روی پاکت ارسال می‌کنید. دقیقاً همین کار را Hash انجام می‌دهد. پیام در صندوق پستی ناشناس رها می‌شود. سرور نمی‌داند چه کسی آن را فرستاده.';

  @override
  String get secStep4Title => 'سرور چیزی نمی‌بیند';

  @override
  String get secStep4Desc =>
      'سرور مانند یک پستچی نابینا عمل می‌کند. فقط می‌داند \"کسی چیزی در صندوق پستی #A7X9 گذاشت\". نمی‌داند چه کسی فرستاده، چیست، یا برای کیست.';

  @override
  String get secStep4Highlight =>
      'هیچ فراداده‌ای ذخیره نمی‌شود: آدرس IP نه، مهر زمانی نه، ارتباطی بین فرستنده و گیرنده نه.';

  @override
  String get secStep5Title => 'مخاطب شما پیام را دریافت می‌کند';

  @override
  String get secStep5Desc =>
      'تلفن مخاطب شما محتوا را از صندوق پستی ناشناس خود بازیابی می‌کند و پیام را با کلید خصوصی خود رمزگشایی می‌کند، کلیدی که هرگز دستگاه را ترک نکرده. \"سلام!\" روی صفحه ظاهر می‌شود.';

  @override
  String get secStep6Title => 'پیام از سرور ناپدید می‌شود';

  @override
  String get secStep6Desc =>
      'به محض تأیید دریافت توسط مخاطب، سرور پیام را برای همیشه حذف می‌کند. سطل زباله نه، آرشیو نه، پشتیبان نه. حتی پیام‌های خوانده‌نشده پس از ۲۴ ساعت به طور خودکار نابود می‌شوند.';

  @override
  String get secStep7Title => 'انقضای محلی';

  @override
  String get secStep7Desc =>
      'در تلفن مخاطب شما، پیام طبق مدتی که انتخاب کرده‌اید خود را نابود می‌کند: بلافاصله پس از خواندن، ۵ دقیقه، ۱ ساعت... شما تصمیم می‌گیرید.';

  @override
  String get secJourneyConclusion =>
      'نتیجه: صفر ردپا در سرور، صفر ردپا در دستگاه‌ها. پیام فقط به اندازه خوانده شدن وجود داشت، سپس ناپدید شد.';

  @override
  String get secArchLabel => 'معماری';

  @override
  String get secArchTitle => '۵ لایه محافظت';

  @override
  String get secArchSubtitle =>
      'Hash به یک فناوری تکیه نمی‌کند. هر لایه بقیه را تقویت می‌کند. حتی اگر یک لایه به خطر بیفتد، داده‌های شما امن می‌مانند.';

  @override
  String get secLayer1Title => 'رمزنگاری سرتاسری';

  @override
  String get secLayer1Desc =>
      'هر پیام با کلیدی منحصربه‌فرد رمزنگاری می‌شود. به زبان ساده: حتی اگر کسی یک پیام را رمزگشایی کند، نمی‌تواند پیام بعدی را رمزگشایی کند. هر پیام قفل خود را دارد.';

  @override
  String get secLayer1Detail =>
      'برای فایل‌ها (عکس‌ها، ویدیوها، اسناد)، Hash از رمزنگاری اضافی AES-256-GCM استفاده می‌کند. فایل قبل از خروج از تلفن شما رمزنگاری می‌شود.';

  @override
  String get secLayer2Title => 'Sealed Sender (ناشناسی شبکه)';

  @override
  String get secLayer2Desc =>
      'پیام‌رسان‌های معمولی پیام‌های شما را با هویتتان ارسال می‌کنند. مانند نوشتن نامتان روی پاکت. Hash از صندوق‌های پستی ناشناس استفاده می‌کند: سرور پیام را بدون دانستن فرستنده تحویل می‌دهد.';

  @override
  String get secLayer2Detail =>
      'نتیجه: حتی در صورت نشت داده سرور، بازسازی اینکه چه کسی با چه کسی صحبت می‌کند غیرممکن است.';

  @override
  String get secLayer3Title => 'حذف خودکار';

  @override
  String get secLayer3Desc =>
      'پیام‌ها بلافاصله پس از تأیید دریافت از سرور حذف می‌شوند. حتی اگر پیامی هرگز بازیابی نشود، پس از ۲۴ ساعت به طور خودکار نابود می‌شود.';

  @override
  String get secLayer3Detail =>
      'در تلفن شما، پیام‌ها طبق مدت انتخابی خود نابود می‌شوند: فوری، ۵ دقیقه، ۱۵ دقیقه، ۳۰ دقیقه، ۱ ساعت، ۳ ساعت، ۶ ساعت یا ۱۲ ساعت.';

  @override
  String get secLayer4Title => 'محافظت از دسترسی محلی';

  @override
  String get secLayer4Desc =>
      'برنامه با PIN ۶ رقمی و/یا بیومتریک (Face ID، اثر انگشت) محافظت می‌شود. پس از تلاش‌های ناموفق زیاد، برنامه با تأخیر افزایشی پس از هر شکست قفل می‌شود.';

  @override
  String get secLayer5Title => 'پایگاه داده قفل‌شده';

  @override
  String get secLayer5Desc =>
      'در سمت سرور، هیچ کاربری نمی‌تواند مستقیماً در پایگاه داده بنویسد. همه اقدامات از طریق توابع امن که هر درخواست را بررسی می‌کنند انجام می‌شوند.';

  @override
  String get secLayer5Detail =>
      'مانند باجه بانک: شما هرگز خودتان به خزانه دسترسی ندارید. درخواست می‌دهید و سیستم قبل از اقدام بررسی می‌کند که حق دارید.';

  @override
  String get secVashLabel => 'منحصر در جهان';

  @override
  String get secVashTitle => 'حالت Vash';

  @override
  String get secVashSubtitle =>
      'سیستم امنیتی اضطراری که در هیچ برنامه پیام‌رسان دیگری وجود ندارد.';

  @override
  String get secVashScenarioTitle => 'این وضعیت را تصور کنید';

  @override
  String get secVashScenario1 => 'کسی به تلفن شما دسترسی پیدا می‌کند';

  @override
  String get secVashScenario2 => 'کد PIN شما خواسته می‌شود';

  @override
  String get secVashScenario3 => 'می‌خواهید همه داده‌ها را فوراً پاک کنید';

  @override
  String get secVashSolutionTitle => 'راه‌حل: دو کد PIN';

  @override
  String get secVashSolutionDesc =>
      'دو کد PIN متفاوت در Hash پیکربندی می‌کنید:';

  @override
  String get secVashNormalCodeLabel => 'کد عادی';

  @override
  String get secVashNormalCodeDesc =>
      'برنامه را به طور عادی با همه داده‌هایتان باز می‌کند';

  @override
  String get secVashCodeLabel2 => 'کد Vash';

  @override
  String get secVashCodeDescription =>
      'برنامه را به طور عادی باز می‌کند... اما همه داده‌هایتان بی‌صدا در پس‌زمینه حذف می‌شوند';

  @override
  String get secVashWhatHappensTitle => 'بعد چه اتفاقی می‌افتد';

  @override
  String get secVashWhatHappensDesc =>
      'برنامه به طور عادی باز می‌شود. هشداری نه، انیمیشن مشکوکی نه. صفحه فقط برنامه‌ای خالی نشان می‌دهد، انگار تازه نصب شده.\n\nدر واقعیت، همه مکالمات، مخاطبین و پیام‌های شما در کسری از ثانیه به طور غیرقابل برگشت حذف شده‌اند.';

  @override
  String get secCallsLabel => 'تماس‌ها و فایل‌ها';

  @override
  String get secCallsTitle => 'همه چیز رمزنگاری شده';

  @override
  String get secCallsSubtitle =>
      'فقط پیام‌ها نیست. مطلقاً هر چیزی که از Hash عبور می‌کند سرتاسر رمزنگاری شده است.';

  @override
  String get secAudioCallTitle => 'تماس‌های صوتی';

  @override
  String get secAudioCallDesc =>
      'رمزنگاری سرتاسری از طریق WebRTC. صدا مستقیماً بین دستگاه‌ها منتقل می‌شود.';

  @override
  String get secVideoCallTitle => 'تماس‌های تصویری';

  @override
  String get secVideoCallDesc =>
      'همان فناوری، هر جریان به صورت جداگانه رمزنگاری شده.';

  @override
  String get secPhotosTitle => 'عکس‌ها و ویدیوها';

  @override
  String get secPhotosDesc =>
      'با AES-256-GCM قبل از خروج از تلفن شما رمزنگاری می‌شوند.';

  @override
  String get secDocsTitle => 'اسناد';

  @override
  String get secDocsDesc =>
      'PDF، ZIP، هر فایلی. نام، اندازه و محتوا رمزنگاری شده.';

  @override
  String get secAnonLabel => 'ناشناسی';

  @override
  String get secAnonTitle => 'نیازی به هویت نیست';

  @override
  String get secAnonSubtitle =>
      'Hash هرگز شماره تلفن یا ایمیل شما را نمی‌خواهد. شما با یک Hash ID منحصربه‌فرد و ناشناس شناسایی می‌شوید.';

  @override
  String get secHashIdTitle => 'Hash ID شما';

  @override
  String get secHashIdDesc =>
      'این شناسه منحصربه‌فرد شماست. هیچ چیز درباره شما فاش نمی‌کند: نه نامتان، نه شماره‌تان، نه موقعیتتان. مانند نام مستعاری است که غیرممکن است به هویت واقعی شما مرتبط شود.\n\nبرای افزودن مخاطب، Hash ID خود را به اشتراک می‌گذارید یا QR code اسکن می‌کنید. همین. دفترچه تلفن همگام‌شده نه، پیشنهاد \"افرادی که ممکن است بشناسید\" نه.';

  @override
  String get secDataLabel => 'داده‌ها';

  @override
  String get secDataTitle => 'چیزی که Hash نمی‌داند';

  @override
  String get secDataSubtitle =>
      'بهترین راه محافظت از داده‌های شما، جمع‌نکردن آنهاست.';

  @override
  String get secNeverCollected => 'هرگز جمع‌آوری نمی‌شود';

  @override
  String get secNeverItem1 => 'محتوای پیام';

  @override
  String get secNeverItem2 => 'لیست مخاطبین';

  @override
  String get secNeverItem3 => 'شماره تلفن';

  @override
  String get secNeverItem4 => 'آدرس ایمیل';

  @override
  String get secNeverItem5 => 'آدرس IP';

  @override
  String get secNeverItem6 => 'موقعیت مکانی';

  @override
  String get secNeverItem7 => 'فراداده (چه کسی با چه کسی صحبت می‌کند)';

  @override
  String get secNeverItem8 => 'سابقه تماس';

  @override
  String get secNeverItem9 => 'دفترچه تلفن';

  @override
  String get secNeverItem10 => 'شناسه‌های تبلیغاتی';

  @override
  String get secTempStored => 'به طور موقت ذخیره شده';

  @override
  String get secTempItem1 => 'Hash ID ناشناس (شناسه منحصربه‌فرد)';

  @override
  String get secTempItem2 => 'کلیدهای عمومی رمزنگاری';

  @override
  String get secTempItem3 =>
      'پیام‌های رمزنگاری‌شده در حال انتقال (حداکثر ۲۴ ساعت)';

  @override
  String get secTempNote =>
      'حتی این حداقل داده‌ها نمی‌توانند شما را شناسایی کنند. Hash ID شما به هیچ اطلاعات شخصی مرتبط نیست.';

  @override
  String get secFooterTitle => 'حریم خصوصی شما، آزادی شما';

  @override
  String get secFooterDesc =>
      'Hash از همان فناوری‌های رمزنگاری استفاده می‌کند که سخت‌گیرترین برنامه‌های حرفه‌ای. پیام‌های شما با ریاضیات محافظت می‌شوند، نه با وعده‌ها.';

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
