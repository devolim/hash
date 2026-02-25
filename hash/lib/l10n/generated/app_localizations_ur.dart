// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'کوئی نشان نہیں۔ کوئی سمجھوتا نہیں۔';

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
  String get conversations => 'چیٹس';

  @override
  String get contacts => 'رابطے';

  @override
  String get noConversation => 'کوئی چیٹ نہیں';

  @override
  String get noConversationSubtitle =>
      'محفوظ طریقے سے چیٹ شروع کرنے کے لیے ایک رابطہ شامل کریں';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زیر التوا درخواستیں',
      one: '1 زیر التوا درخواست',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count بھیجی گئی درخواستیں زیر التوا',
      one: '1 بھیجی گئی درخواست زیر التوا',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'رابطہ شامل کریں';

  @override
  String get shareApp => 'ایپ شیئر کریں';

  @override
  String get newMessage => 'نیا پیغام';

  @override
  String get newConversation => 'پیغام بھیجیں';

  @override
  String get settings => 'ترتیبات';

  @override
  String get myHashId => 'میرا Hash ID';

  @override
  String get supportHash => 'Hash کی حمایت کریں';

  @override
  String get supportHashSubtitle => 'Hash ایک غیر منافع بخش منصوبہ ہے';

  @override
  String get donate => 'عطیہ دیں';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get theme => 'تھیم';

  @override
  String get themeAuto => 'خودکار';

  @override
  String get themeAutoSubtitle => 'سسٹم ترتیبات کی پیروی کرتا ہے';

  @override
  String get themeDark => 'ڈارک';

  @override
  String get themeLight => 'لائٹ';

  @override
  String get themeRecommendation =>
      'بہتر رازداری کے لیے ڈارک تھیم تجویز کی جاتی ہے';

  @override
  String get language => 'زبان';

  @override
  String get languageAuto => 'خودکار (سسٹم)';

  @override
  String get notifications => 'اطلاعات';

  @override
  String get messages => 'پیغامات';

  @override
  String get calls => 'کالز';

  @override
  String get vibration => 'کمپن';

  @override
  String get notificationContent => 'اطلاع کا مواد';

  @override
  String get notificationContentFull => 'سب دکھائیں';

  @override
  String get notificationContentFullDesc =>
      'رابطے کا نام اور پیغام کا پیش نظارہ';

  @override
  String get notificationContentName => 'صرف نام';

  @override
  String get notificationContentNameDesc => 'صرف رابطے کا نام دکھاتا ہے';

  @override
  String get notificationContentDiscrete => 'مختصر';

  @override
  String get notificationContentDiscreteDesc => 'صرف \"نیا پیغام\" دکھاتا ہے';

  @override
  String get security => 'سیکیورٹی';

  @override
  String get howHashProtectsYou => 'Hash آپ کی حفاظت کیسے کرتا ہے';

  @override
  String get howHashProtectsYouSubtitle => 'اپنی سیکیورٹی کو سمجھیں';

  @override
  String get accountSecurity => 'اکاؤنٹ سیکیورٹی';

  @override
  String get accountSecuritySubtitle => 'PIN، بایومیٹرکس، Vash موڈ';

  @override
  String get blockScreenshots => 'اسکرین شاٹس بلاک کریں';

  @override
  String get transferDevice => 'دوسرے آلے پر منتقل کریں';

  @override
  String get transferDeviceSubtitle => 'اپنا اکاؤنٹ منتقل کریں';

  @override
  String get pinCode => 'PIN کوڈ';

  @override
  String get changePin => 'PIN کوڈ تبدیل کریں';

  @override
  String get currentPin => 'موجودہ PIN کوڈ';

  @override
  String get newPin => 'نیا PIN کوڈ';

  @override
  String get confirmPin => 'PIN کوڈ کی تصدیق کریں';

  @override
  String get pinChanged => 'PIN کوڈ تبدیل ہو گیا';

  @override
  String get incorrectPin => 'غلط PIN';

  @override
  String get pinsDoNotMatch => 'PIN مماثل نہیں ہیں';

  @override
  String get autoLock => 'آٹو لاک';

  @override
  String get autoLockDelay => 'لاک تاخیر';

  @override
  String get autoLockImmediate => 'فوری';

  @override
  String get autoLockMinute => '1 منٹ';

  @override
  String autoLockMinutes(int count) {
    return '$count منٹ';
  }

  @override
  String get vashCode => 'Vash کوڈ';

  @override
  String get vashModeTitle => 'Vash موڈ';

  @override
  String get vashModeExplanation => 'آپ کا حتمی حفاظتی جال۔';

  @override
  String get vashModeDescription =>
      'آپ ایک دوسرا PIN کوڈ منتخب کریں گے۔ اگر آپ کو کبھی Hash کھولنے پر مجبور کیا جائے، تو اپنے عام PIN کی بجائے یہ کوڈ درج کریں۔\n\nایپ عام طور پر کھلے گی، لیکن آپ کی تمام گفتگو اور رابطے ختم ہو جائیں گے۔\n\nآپ کی اسکرین دیکھنے والے کسی بھی شخص کو Hash خالی نظر آئے گا — جیسے آپ نے کبھی استعمال نہیں کیا۔';

  @override
  String get vashModeIrreversible => 'یہ عمل خاموش اور ناقابل واپسی ہے۔';

  @override
  String get chooseVashCode => 'اپنا Vash کوڈ منتخب کریں';

  @override
  String get vashCodeInfo =>
      'ایک دوسرا PIN کوڈ جو ایپ کو عام طور پر کھولتا ہے، لیکن خالی۔';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'اگر آپ اپنے PIN کی بجائے یہ کوڈ درج کریں:';

  @override
  String get vashDeleteContacts => 'آپ کے رابطے غائب ہو جائیں گے';

  @override
  String get vashDeleteMessages => 'آپ کی گفتگو غائب ہو جائیں گی';

  @override
  String get vashDeleteHistory => 'آپ کے نوٹس غائب ہو جائیں گے';

  @override
  String get vashKeepId => 'آپ کی Hash شناخت (#XXX-XXX-XXX) وہی رہے گی';

  @override
  String get vashAppearNormal =>
      'ایپ عام لیکن خالی نظر آئے گی، جیسے نئی۔ یہ عمل ناقابل واپسی ہے۔';

  @override
  String get setupVashCode => 'Vash کوڈ ترتیب دیں';

  @override
  String get modifyVashCode => 'Vash کوڈ تبدیل کریں';

  @override
  String get currentVashCode => 'موجودہ Vash کوڈ';

  @override
  String get newVashCode => 'نیا Vash کوڈ';

  @override
  String get confirmVashCode => 'Vash کوڈ کی تصدیق کریں';

  @override
  String get vashCodeConfigured => 'Vash کوڈ ترتیب دیا گیا';

  @override
  String get vashCodeModified => 'Vash کوڈ تبدیل ہو گیا';

  @override
  String get vashCodeMustDiffer => 'Vash کوڈ PIN سے مختلف ہونا چاہیے';

  @override
  String get incorrectVashCode => 'غلط Vash کوڈ';

  @override
  String get vashWhatToDelete => 'Vash موڈ کو کیا غائب کرنا چاہیے؟';

  @override
  String get vashDeleteContactsOption => 'رابطے';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'پیغامات';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'نوٹس';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash موڈ فعال ہو گیا';

  @override
  String get vashCreateSubtitle => 'اپنے اصل PIN سے مختلف کوڈ منتخب کریں';

  @override
  String get vashConfirmSubtitle => 'اپنے Vash کوڈ کی تصدیق کریں';

  @override
  String get pinCodeForEntry => 'ایپ میں داخل ہونے کے لیے PIN کوڈ';

  @override
  String get vashCodeSection => 'Vash موڈ';

  @override
  String get biometric => 'بایومیٹرک';

  @override
  String get biometricUnlock => 'فنگر پرنٹ یا Face ID سے ان لاک کریں';

  @override
  String get enableBiometric => 'بایومیٹرک فعال کریں';

  @override
  String get biometricWarningMessage =>
      'بایومیٹرک کو فعال کرنے سے، آپ ایپ میں داخل ہونے کے لیے Vash کوڈ استعمال نہیں کر سکیں گے۔\n\nآپ Vash کوڈ صرف اس صورت میں استعمال کر سکیں گے جب بایومیٹرک ناکام ہو جائے (کئی ناکام کوششوں کے بعد)۔\n\nکیا آپ واقعی جاری رکھنا چاہتے ہیں؟';

  @override
  String get understood => 'سمجھ آ گئی';

  @override
  String get shareAppSubtitle => 'Hash اپنے قریبیوں سے شیئر کریں';

  @override
  String get share => 'شیئر کریں';

  @override
  String get danger => 'خطرہ';

  @override
  String get deleteAccount => 'میرا اکاؤنٹ حذف کریں';

  @override
  String get deleteAccountSubtitle => 'ناقابل واپسی عمل';

  @override
  String get deleteAccountConfirmTitle => 'میرا اکاؤنٹ حذف کریں';

  @override
  String get deleteAccountConfirmMessage =>
      'آپ کا اکاؤنٹ مستقل طور پر حذف ہو جائے گا۔ یہ عمل ناقابل واپسی ہے۔\n\n• آپ کی تمام چیٹس\n• آپ کے تمام رابطے\n• آپ کا Hash ID\n\nآپ کو نیا اکاؤنٹ بنانا ہوگا۔';

  @override
  String get deleteForever => 'مستقل طور پر حذف کریں';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash موڈ فعال ہو گیا۔';

  @override
  String deletionError(String error) {
    return 'حذف کرنے میں خرابی: $error';
  }

  @override
  String get yourSecurity => 'آپ کی سیکیورٹی';

  @override
  String get securityInfo =>
      '• اینڈ ٹو اینڈ انکرپشن (Signal Protocol)\n• ترسیل کے بعد ہمارے سرورز پر کوئی ڈیٹا نہیں\n• چابیاں صرف آپ کے آلے پر محفوظ ہیں\n• PIN کوڈ کبھی سرور کو نہیں بھیجا جاتا';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'خوش آمدید';

  @override
  String get securityStatement1 => 'آپ کے پیغامات محفوظ ہیں۔';

  @override
  String get securityStatement2 => 'اینڈ ٹو اینڈ انکرپشن۔';

  @override
  String get securityStatement3 => 'کوئی نشان نہیں۔ کوئی سمجھوتا نہیں۔';

  @override
  String get securityStatement4 => 'آپ کی رازداری ایک حق ہے۔';

  @override
  String get accessBlocked => 'رسائی بلاک ہے';

  @override
  String get tooManyAttempts => 'بہت زیادہ کوششیں';

  @override
  String get pleaseWait => 'براہ کرم انتظار کریں';

  @override
  String get waitDelay => 'براہ کرم تاخیر ختم ہونے تک انتظار کریں';

  @override
  String attemptCount(int current, int max) {
    return 'کوشش $current از $max';
  }

  @override
  String retryIn(String time) {
    return '$time میں دوبارہ کوشش کریں';
  }

  @override
  String get forgotPin => 'PIN بھول گئے؟ بازیابی جملہ استعمال کریں';

  @override
  String get useRecoveryPhrase => 'بازیابی جملہ استعمال کریں';

  @override
  String get recoveryWarningTitle => 'تنبیہ';

  @override
  String get recoveryWarningMessage => 'اکاؤنٹ بازیابی:';

  @override
  String get recoveryDeleteAllMessages => 'آپ کے تمام پیغامات حذف کر دے گا';

  @override
  String get recoveryWaitDelay => '1 گھنٹے کی تاخیر درکار ہے';

  @override
  String get recoveryKeepContacts => 'آپ کے رابطے رکھے گا';

  @override
  String get recoveryIrreversible =>
      'یہ عمل ناقابل واپسی ہے۔ آپ کے پیغامات مستقل طور پر ضائع ہو جائیں گے۔';

  @override
  String get iUnderstand => 'میں سمجھتا ہوں';

  @override
  String get accountRecovery => 'اکاؤنٹ بازیابی';

  @override
  String get enterRecoveryPhrase =>
      'اپنے بازیابی جملے کے 24 الفاظ خالی جگہوں سے الگ کر کے درج کریں۔';

  @override
  String get recoveryPhraseHint => 'لفظ1 لفظ2 لفظ3 ...';

  @override
  String get recover => 'بازیاب کریں';

  @override
  String get recoveryPhraseRequired => 'براہ کرم اپنا بازیابی جملہ درج کریں';

  @override
  String get recoveryPhrase24Words => 'جملے میں بالکل 24 الفاظ ہونے چاہییں';

  @override
  String get incorrectRecoveryPhrase => 'غلط بازیابی جملہ';

  @override
  String get recoveryInitError => 'بازیابی شروع کرنے میں خرابی';

  @override
  String get securityDelay => 'سیکیورٹی تاخیر';

  @override
  String get securityDelayMessage =>
      'آپ کی سیکیورٹی کے لیے، نیا PIN بنانے سے پہلے انتظار کی مدت ضروری ہے۔';

  @override
  String get timeRemaining => 'باقی وقت';

  @override
  String get messagesDeletedForProtection =>
      'آپ کی حفاظت کے لیے آپ کے پیغامات حذف کر دیے گئے ہیں۔';

  @override
  String get canCloseApp => 'آپ ایپ بند کر کے بعد میں واپس آ سکتے ہیں۔';

  @override
  String get onboardingTitle1 => 'Hash میں خوش آمدید';

  @override
  String get onboardingSubtitle1 => 'وہ میسنجر جو کوئی نشان نہیں چھوڑتا';

  @override
  String get onboardingTitle2 => 'مکمل انکرپشن';

  @override
  String get onboardingSubtitle2 =>
      'آپ کے پیغامات Signal protocol کے ساتھ اینڈ ٹو اینڈ انکرپٹڈ ہیں';

  @override
  String get onboardingTitle3 => 'کوئی نشان نہیں';

  @override
  String get onboardingSubtitle3 =>
      'ترسیل کے بعد پیغامات سرورز سے حذف ہو جاتے ہیں';

  @override
  String get onboardingTitle4 => 'آپ کی سیکیورٹی';

  @override
  String get onboardingSubtitle4 => 'PIN کوڈ، Vash موڈ اور بازیابی جملہ';

  @override
  String get getStarted => 'شروع کریں';

  @override
  String get next => 'اگلا';

  @override
  String get skip => 'چھوڑیں';

  @override
  String get alreadyHaveAccount => 'میرا پہلے سے اکاؤنٹ ہے';

  @override
  String get transferMyAccount => 'اپنا اکاؤنٹ منتقل کریں';

  @override
  String get createPin => 'PIN کوڈ بنائیں';

  @override
  String get createPinSubtitle => 'یہ کوڈ آپ کی ایپ تک رسائی کی حفاظت کرے گا';

  @override
  String get confirmYourPin => 'اپنے PIN کوڈ کی تصدیق کریں';

  @override
  String get confirmPinSubtitle => 'اپنا PIN کوڈ دوبارہ درج کریں';

  @override
  String get saveRecoveryPhrase => 'بازیابی جملہ';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'ان 24 الفاظ کو ترتیب سے لکھیں۔ اگر آپ PIN بھول جائیں تو یہ آپ کے اکاؤنٹ کی بازیابی میں مدد کریں گے۔';

  @override
  String get phraseWritten => 'میں نے اپنا جملہ لکھ لیا ہے';

  @override
  String get warningRecoveryPhrase =>
      'اگر آپ یہ جملہ کھو دیں اور اپنا PIN بھول جائیں، تو آپ اپنے اکاؤنٹ تک رسائی کھو دیں گے۔';

  @override
  String get accountTransferred => 'اکاؤنٹ منتقل ہو گیا';

  @override
  String get accountTransferredMessage =>
      'آپ کا اکاؤنٹ دوسرے آلے پر منتقل ہو گیا ہے۔ یہ سیشن اب درست نہیں ہے۔';

  @override
  String get accountTransferredInfo =>
      'اگر آپ نے یہ منتقلی شروع نہیں کی، تو آپ کا اکاؤنٹ خطرے میں ہو سکتا ہے۔';

  @override
  String get logout => 'لاگ آؤٹ';

  @override
  String get transferAccount => 'اکاؤنٹ منتقلی';

  @override
  String get transferAccountInfo =>
      'اپنا Hash اکاؤنٹ نئے آلے پر منتقل کریں۔ آپ کا موجودہ سیشن منسوخ ہو جائے گا۔';

  @override
  String get generateTransferCode => 'منتقلی کوڈ بنائیں';

  @override
  String get transferCode => 'منتقلی کوڈ';

  @override
  String transferCodeExpires(int minutes) {
    return 'یہ کوڈ $minutes منٹ میں ختم ہو جائے گا';
  }

  @override
  String get enterCodeOnNewDevice =>
      'اپنا اکاؤنٹ منتقل کرنے کے لیے اپنے نئے آلے پر یہ کوڈ درج کریں۔';

  @override
  String get generateNewCode => 'نیا کوڈ بنائیں';

  @override
  String get scanQrCode => 'QR code اسکین کریں';

  @override
  String get scanQrCodeSubtitle =>
      'رابطے کو شامل کرنے کے لیے ان کا QR code اسکین کریں';

  @override
  String get qrCodeDetected => 'QR code پہچان لیا گیا';

  @override
  String get invalidQrCode => 'غلط QR code';

  @override
  String get cameraPermissionRequired => 'کیمرے کی اجازت ضروری ہے';

  @override
  String get myQrCode => 'میرا QR code';

  @override
  String get myQrCodeSubtitle =>
      'یہ QR code شیئر کریں تاکہ آپ کے رابطے آپ کو شامل کر سکیں';

  @override
  String get shareQrCode => 'شیئر کریں';

  @override
  String get addContactTitle => 'رابطہ شامل کریں';

  @override
  String get addContactByHashId => 'اپنے رابطے کا Hash ID درج کریں';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'تلاش کریں';

  @override
  String get contactNotFound => 'رابطہ نہیں ملا';

  @override
  String get contactAlreadyAdded => 'یہ رابطہ پہلے سے آپ کی فہرست میں ہے';

  @override
  String get contactAdded => 'رابطہ شامل ہو گیا';

  @override
  String get myProfile => 'میرا پروفائل';

  @override
  String get myProfileSubtitle =>
      'یہ معلومات شیئر کریں تاکہ دوسرے آپ کو شامل کر سکیں';

  @override
  String get temporaryCode => 'عارضی کوڈ';

  @override
  String temporaryCodeExpires(String time) {
    return '$time میں ختم ہو جائے گا';
  }

  @override
  String get codeExpired => 'کوڈ ختم ہو گیا';

  @override
  String get generateNewCodeButton => 'نیا کوڈ';

  @override
  String get copyHashId => 'ID کاپی کریں';

  @override
  String get copyCode => 'کوڈ کاپی کریں';

  @override
  String get copiedToClipboard => 'کاپی ہو گیا';

  @override
  String get showMyQrCode => 'میرا QR code دکھائیں';

  @override
  String get orDivider => 'یا';

  @override
  String get openScanner => 'اسکینر کھولیں';

  @override
  String get addManually => 'دستی طور پر شامل کریں';

  @override
  String get contactHashIdLabel => 'رابطے کا Hash ID';

  @override
  String get temporaryCodeLabel => 'عارضی کوڈ';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'اپنے رابطے سے اپنے پروفائل سے کوڈ بنانے کو کہیں';

  @override
  String get verifyAndAdd => 'تصدیق کریں اور شامل کریں';

  @override
  String get fillAllFields => 'براہ کرم تمام فیلڈز پُر کریں';

  @override
  String get invalidHashIdFormat => 'غلط ID فارمیٹ (مثال: 123-456-ABC)';

  @override
  String get userNotFound => 'صارف نہیں ملا';

  @override
  String get cannotAddYourself => 'آپ خود کو شامل نہیں کر سکتے';

  @override
  String get invalidOrExpiredCode => 'غلط یا ختم شدہ عارضی کوڈ';

  @override
  String get contactFound => 'رابطہ مل گیا!';

  @override
  String get howToCallContact => 'آپ انہیں کیا پکارنا چاہتے ہیں؟';

  @override
  String get contactNameHint => 'رابطے کا نام';

  @override
  String get addContactButton => 'شامل کریں';

  @override
  String get contactDetails => 'رابطے کی تفصیلات';

  @override
  String get contactName => 'رابطے کا نام';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date کو شامل کیا گیا';
  }

  @override
  String get deleteContact => 'رابطہ حذف کریں';

  @override
  String deleteContactConfirm(Object name) {
    return 'یہ رابطہ حذف کریں؟';
  }

  @override
  String get deleteContactMessage => 'اس سے پوری چیٹ بھی حذف ہو جائے گی۔';

  @override
  String get delete => 'حذف کریں';

  @override
  String get typeMessage => 'پیغام ٹائپ کریں...';

  @override
  String get messageSent => 'بھیجا گیا';

  @override
  String get messageDelivered => 'پہنچا دیا گیا';

  @override
  String get messageRead => 'پڑھ لیا گیا';

  @override
  String get messageFailed => 'بھیجنے میں ناکامی';

  @override
  String get now => 'ابھی';

  @override
  String minutesAgo(int count) {
    return '$countمنٹ';
  }

  @override
  String hoursAgo(int count) {
    return '$countگھنٹے';
  }

  @override
  String daysAgo(int count) {
    return '$countدن';
  }

  @override
  String get today => 'آج';

  @override
  String get yesterday => 'کل';

  @override
  String dateAtTime(String date, String time) {
    return '$date بوقت $time';
  }

  @override
  String get shareMessage =>
      'Hash پر میرے ساتھ شامل ہوں! 🔒\n\nیہ واقعی ایک نجی میسنجر ہے: مکمل انکرپشن، سرورز پر کوئی نشان نہیں، اور ضرورت پڑنے پر پینک موڈ۔\n\nایپ یہاں سے ڈاؤنلوڈ کریں 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'خرابی';

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String get view => 'دیکھیں';

  @override
  String get yes => 'ہاں';

  @override
  String get no => 'نہیں';

  @override
  String get save => 'محفوظ کریں';

  @override
  String get edit => 'ترمیم کریں';

  @override
  String get close => 'بند کریں';

  @override
  String get confirm => 'تصدیق کریں';

  @override
  String get loading => 'لوڈ ہو رہا ہے...';

  @override
  String get retry => 'دوبارہ کوشش کریں';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'زیر التوا درخواستیں';

  @override
  String get noPendingRequests => 'کوئی زیر التوا درخواست نہیں';

  @override
  String get pendingRequestsSubtitle => 'یہ لوگ آپ کو شامل کرنا چاہتے ہیں';

  @override
  String requestFromUser(String hashId) {
    return '$hashId کی طرف سے درخواست';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days دنوں میں ختم ہو جائے گی';
  }

  @override
  String get acceptRequest => 'قبول کریں';

  @override
  String get rejectRequest => 'مسترد کریں';

  @override
  String get requestAccepted => 'درخواست قبول ہو گئی';

  @override
  String get requestRejected => 'درخواست مسترد ہو گئی';

  @override
  String get requestSent => 'درخواست بھیج دی گئی!';

  @override
  String get requestSentSubtitle =>
      'آپ کی درخواست بھیج دی گئی۔ چیٹ کرنے سے پہلے صارف کو اسے قبول کرنا ہوگا۔';

  @override
  String get requestAlreadyPending => 'ایک درخواست پہلے سے زیر التوا ہے';

  @override
  String get requestAlreadySentByOther =>
      'اس شخص نے آپ کو پہلے ہی درخواست بھیج دی ہے';

  @override
  String get addByHashId => 'Hash ID سے شامل کریں';

  @override
  String get addByHashIdSubtitle => 'رابطے کا Hash ID اور عارضی کوڈ درج کریں';

  @override
  String get enterTemporaryCode => '6 ہندسوں کا کوڈ درج کریں';

  @override
  String get sendRequest => 'درخواست بھیجیں';

  @override
  String get acceptContactTitle => 'رابطہ قبول کریں';

  @override
  String get acceptContactSubtitle => 'آپ انہیں اپنی مرضی کا نام دے سکتے ہیں';

  @override
  String get leaveEmptyForHashId => 'Hash ID استعمال کرنے کے لیے خالی چھوڑیں';

  @override
  String get firstName => 'پہلا نام';

  @override
  String get lastName => 'آخری نام';

  @override
  String get notes => 'نوٹس';

  @override
  String get notesHint => 'اس رابطے کے بارے میں ذاتی نوٹس';

  @override
  String get photoOptional => 'تصویر (اختیاری)';

  @override
  String get contactNameOptional => 'نام (اختیاری)';

  @override
  String get notesOptional => 'نوٹس (اختیاری)';

  @override
  String get storedLocally => 'صرف آپ کے آلے پر محفوظ ہے';

  @override
  String get encryptedMessageLabel => 'انکرپٹڈ پیغام';

  @override
  String get identityMessageHint =>
      'آپ کون ہیں؟ آپ ایک دوسرے کو کیسے جانتے ہیں؟';

  @override
  String get messageWillBeSentEncrypted =>
      'یہ پیغام انکرپٹ ہو کر وصول کنندہ کو بھیجا جائے گا';

  @override
  String get sendRequestButton => 'درخواست بھیجیں';

  @override
  String get requestExpiresIn24h =>
      'قبول نہ ہونے پر درخواست 24 گھنٹوں میں ختم ہو جائے گی';

  @override
  String get theyAlreadySentYouRequest =>
      'اس شخص نے آپ کو پہلے ہی درخواست بھیج دی ہے';

  @override
  String get requests => 'درخواستیں';

  @override
  String get receivedRequests => 'موصول شدہ';

  @override
  String get sentRequests => 'بھیجی گئی';

  @override
  String get noSentRequests => 'بھیجی گئی درخواستیں نہیں';

  @override
  String get cancelRequest => 'منسوخ کریں';

  @override
  String get deleteRequest => 'درخواست حذف کریں';

  @override
  String get requestCancelled => 'درخواست منسوخ ہو گئی';

  @override
  String sentTo(String hashId) {
    return '$hashId کو بھیجا گیا';
  }

  @override
  String expiresIn(String time) {
    return '$time میں ختم ہو جائے گی';
  }

  @override
  String receivedAgo(String time) {
    return '$time پہلے موصول ہوئی';
  }

  @override
  String get messageFromRequester => 'درخواست کنندہ کی طرف سے پیغام';

  @override
  String get copy => 'کاپی کریں';

  @override
  String get messageInfo => 'پیغام کی معلومات';

  @override
  String get messageDirection => 'سمت';

  @override
  String get messageSentByYou => 'آپ نے بھیجا';

  @override
  String get messageReceived => 'موصول ہوا';

  @override
  String get messageSentAt => 'بھیجنے کا وقت';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'حالت';

  @override
  String get messageReadAt => 'پڑھنے کا وقت';

  @override
  String get messageType => 'قسم';

  @override
  String get messageSize => 'سائز';

  @override
  String get messageExpiresAt => 'ختم ہونے کا وقت';

  @override
  String get messageEncrypted => 'اینڈ ٹو اینڈ انکرپٹڈ';

  @override
  String get messageStatusSending => 'بھیج رہا ہے...';

  @override
  String get messageStatusSent => 'بھیجا گیا';

  @override
  String get messageStatusDelivered => 'پہنچا دیا گیا';

  @override
  String get messageStatusRead => 'پڑھ لیا گیا';

  @override
  String get messageStatusFailed => 'ناکام';

  @override
  String get serverStatus => 'سرور';

  @override
  String get onServer => 'ترسیل زیر التوا';

  @override
  String get deletedFromServer => 'حذف شدہ';

  @override
  String get messageTypeText => 'متن';

  @override
  String get messageTypeImage => 'تصویر';

  @override
  String get messageTypeVideo => 'ویڈیو';

  @override
  String get messageTypeVoice => 'آواز';

  @override
  String get messageTypeFile => 'فائل';

  @override
  String get indefinitely => 'غیر معینہ مدت';

  @override
  String get hoursShort => 'گھنٹے';

  @override
  String get minutesShort => 'منٹ';

  @override
  String get hours => 'گھنٹے';

  @override
  String get minutes => 'منٹ';

  @override
  String get seconds => 'سیکنڈ';

  @override
  String get ephemeralMessages => 'عارضی پیغامات';

  @override
  String get ephemeralMessagesDescription =>
      'اس وقت کے بعد پیغامات خودکار طور پر حذف ہو جاتے ہیں';

  @override
  String get ephemeralImmediate => 'فوری (پڑھنے کے بعد)';

  @override
  String get ephemeralImmediateDesc => 'پڑھتے ہی حذف ہو جاتا ہے';

  @override
  String get ephemeralMyPreference => 'میری ترجیح';

  @override
  String get ephemeralMyPreferenceDesc => 'عالمی ترتیب استعمال کریں';

  @override
  String get ephemeralDefaultSetting => 'پیغام کی مدت';

  @override
  String get ephemeralChooseDefault => 'تجویز کردہ';

  @override
  String get ephemeral30Seconds => '30 سیکنڈ';

  @override
  String get ephemeral30SecondsDesc => 'پڑھنے کے 30 سیکنڈ بعد حذف';

  @override
  String get ephemeral5Minutes => '5 منٹ';

  @override
  String get ephemeral5MinutesDesc => 'پڑھنے کے 5 منٹ بعد حذف';

  @override
  String get ephemeral1Hour => '1 گھنٹا';

  @override
  String get ephemeral1HourDesc => 'پڑھنے کے 1 گھنٹے بعد حذف';

  @override
  String get ephemeral3Hours => '3 گھنٹے';

  @override
  String get ephemeral6Hours => '6 گھنٹے';

  @override
  String get ephemeral6HoursDesc => 'پڑھنے کے 6 گھنٹے بعد حذف';

  @override
  String get ephemeral12Hours => '12 گھنٹے';

  @override
  String get ephemeral24Hours => '24 گھنٹے';

  @override
  String get ephemeral24HoursDesc => 'پڑھنے کے 24 گھنٹے بعد حذف';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'حسب ضرورت مدت';

  @override
  String get howItWorks => 'یہ کیسے کام کرتا ہے';

  @override
  String get ephemeralExplanation1 =>
      'پیغامات موصول ہوتے ہی سرور سے حذف ہو جاتے ہیں۔';

  @override
  String get ephemeralExplanation2 =>
      'یہ ترتیب اس بات کی وضاحت کرتی ہے کہ پڑھنے کے بعد آپ کے فون سے پیغامات کب غائب ہوں گے۔';

  @override
  String get ephemeralExplanation3 =>
      'آپ کے رابطے کی اپنے فون کے لیے الگ ترتیب ہے۔';

  @override
  String get mute1Hour => '1 گھنٹا';

  @override
  String get mute8Hours => '8 گھنٹے';

  @override
  String get mute1Day => '1 دن';

  @override
  String get mute1Week => '1 ہفتہ';

  @override
  String get muteAlways => 'ہمیشہ';

  @override
  String get muteExplanation => 'آپ کو اس رابطے کی اطلاعات نہیں ملیں گی';

  @override
  String get showCallsInRecents => 'حالیہ کالز میں دکھائیں';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash کالز فون کی تاریخ میں ظاہر ہوتی ہیں';

  @override
  String get feedback => 'رائے';

  @override
  String get muteNotifications => 'اطلاعات خاموش کریں';

  @override
  String get muteDescription => 'آپ کو اس رابطے کی اطلاعات نہیں ملیں گی';

  @override
  String mutedUntil(String time) {
    return '$time تک خاموش';
  }

  @override
  String get notMuted => 'اطلاعات فعال ہیں';

  @override
  String get unmute => 'آواز بحال کریں';

  @override
  String get notificationSound => 'اطلاع کی آواز';

  @override
  String get defaultSound => 'پہلے سے طے شدہ';

  @override
  String get chatSettings => 'چیٹ ترتیبات';

  @override
  String get bubbleColor => 'ببل رنگ';

  @override
  String get backgroundColor => 'پس منظر رنگ';

  @override
  String get backgroundImage => 'پس منظر تصویر';

  @override
  String get chatBackground => 'چیٹ پس منظر';

  @override
  String get customColor => 'حسب ضرورت';

  @override
  String get defaultColor => 'پہلے سے طے شدہ';

  @override
  String get imageSelected => 'تصویر منتخب ہو گئی';

  @override
  String get noImage => 'کوئی تصویر نہیں';

  @override
  String get color => 'رنگ';

  @override
  String get image => 'تصویر';

  @override
  String get tapToSelectImage => 'تصویر منتخب کرنے کے لیے ٹیپ کریں';

  @override
  String get changeImage => 'تصویر تبدیل کریں';

  @override
  String get previewMessageReceived => 'ہیلو!';

  @override
  String get previewMessageSent => 'سلام!';

  @override
  String get messageAction => 'پیغام';

  @override
  String get callAction => 'کال';

  @override
  String get videoAction => 'ویڈیو';

  @override
  String get personalNotes => 'ذاتی نوٹس';

  @override
  String get addNotes => 'نوٹس شامل کریں...';

  @override
  String get noNotes => 'کوئی نوٹس نہیں';

  @override
  String get messageNotifications => 'پیغام اطلاعات';

  @override
  String get callNotifications => 'کال اطلاعات';

  @override
  String get useGradient => 'گریڈینٹ استعمال کریں';

  @override
  String get gradientStart => 'شروعاتی رنگ';

  @override
  String get gradientEnd => 'آخری رنگ';

  @override
  String get preview => 'پیش نظارہ';

  @override
  String get reset => 'ری سیٹ';

  @override
  String get securityNumber => 'سیکیورٹی نمبر';

  @override
  String securityNumberDescription(String name) {
    return 'تصدیق کریں کہ سیکیورٹی نمبر $name کے آلے سے ملتا ہے';
  }

  @override
  String get verifyEncryption => 'اینڈ ٹو اینڈ انکرپشن کی تصدیق کریں';

  @override
  String get tapToCopy => 'کاپی کرنے کے لیے ٹیپ کریں';

  @override
  String get howToVerify => 'تصدیق کیسے کریں';

  @override
  String get verifyStep1 => 'اپنے رابطے سے ذاتی طور پر ملیں یا کال کریں';

  @override
  String get verifyStep2 =>
      'سیکیورٹی نمبرز کا موازنہ کریں یا QR code اسکین کریں';

  @override
  String get verifyStep3 => 'اگر وہ ملتے ہیں، تو آپ کی چیٹ محفوظ ہے';

  @override
  String get scanToVerify => 'تصدیق کے لیے اسکین کریں';

  @override
  String get reportSpam => 'سپیم رپورٹ کریں';

  @override
  String get reportSpamSubtitle => 'اس رابطے کو سپیم کے طور پر رپورٹ کریں';

  @override
  String get reportSpamDescription =>
      'یہ اس رابطے کی گمنام رپورٹ کرے گا۔ آپ کی شناخت شیئر نہیں کی جائے گی۔ کیا آپ یقینی ہیں؟';

  @override
  String get report => 'رپورٹ کریں';

  @override
  String get spamReported => 'سپیم رپورٹ ہو گیا';

  @override
  String get reportError =>
      'رپورٹ بھیجنے میں ناکامی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get reportRateLimited =>
      'آپ آج کی زیادہ سے زیادہ رپورٹس تک پہنچ گئے ہیں۔';

  @override
  String get blockContact => 'رابطہ بلاک کریں';

  @override
  String get blockContactDescription =>
      'یہ رابطہ اب آپ کو پیغامات نہیں بھیج سکے گا اور نہ ہی کال کر سکے گا۔ انہیں مطلع نہیں کیا جائے گا۔';

  @override
  String get unblockContact => 'رابطہ ان بلاک کریں';

  @override
  String get unblockContactDescription =>
      'یہ رابطہ دوبارہ آپ کو پیغامات بھیج سکے گا اور کال کر سکے گا۔';

  @override
  String get contactBlocked => 'رابطہ بلاک ہو گیا';

  @override
  String get contactUnblocked => 'رابطہ ان بلاک ہو گیا';

  @override
  String get contactIsBlocked => 'یہ رابطہ بلاک ہے';

  @override
  String get unblock => 'ان بلاک کریں';

  @override
  String get deleteContactSubtitle => 'یہ رابطہ اور چیٹ حذف کریں';

  @override
  String get confirmWithPin => 'PIN سے تصدیق کریں';

  @override
  String get enterPinToConfirm => 'اس عمل کی تصدیق کے لیے اپنا PIN درج کریں';

  @override
  String get profilePhoto => 'پروفائل تصویر';

  @override
  String get takePhoto => 'تصویر لیں';

  @override
  String get chooseFromGallery => 'گیلری سے منتخب کریں';

  @override
  String get removePhoto => 'تصویر ہٹائیں';

  @override
  String get viewContactHashId => 'رابطے کا شناختی نمبر دیکھیں';

  @override
  String get hashIdPartiallyMasked =>
      'آپ کی سیکیورٹی اور رابطے کی رازداری کے لیے جزوی طور پر چھپا ہوا';

  @override
  String get addFirstContact => 'اپنا پہلا رابطہ شامل کریں';

  @override
  String get addFirstContactSubtitle =>
      'اپنا QR code شیئر کریں یا دوست کا QR code اسکین کریں';

  @override
  String get directory => 'ڈائریکٹری';

  @override
  String get noContacts => 'کوئی رابطے نہیں';

  @override
  String get noContactsSubtitle => 'شروع کرنے کے لیے ایک رابطہ شامل کریں';

  @override
  String get sendMessageAction => 'پیغام بھیجیں';

  @override
  String get audioCall => 'آڈیو کال';

  @override
  String get videoCall => 'ویڈیو کال';

  @override
  String get viewProfile => 'پروفائل دیکھیں';

  @override
  String get deleteContactDirectory => 'رابطہ حذف کریں';

  @override
  String get scanShort => 'اسکین';

  @override
  String get addShort => 'شامل کریں';

  @override
  String deleteContactConfirmName(String name) {
    return 'کیا آپ واقعی $name کو حذف کرنا چاہتے ہیں؟';
  }

  @override
  String get noNotesTitle => 'کوئی نوٹس نہیں';

  @override
  String get noNotesSubtitle => 'اپنا پہلا نوٹ بنائیں';

  @override
  String get newNote => 'نیا نوٹ';

  @override
  String get editNote => 'نوٹ میں ترمیم کریں';

  @override
  String get deleteNote => 'نوٹ حذف کریں';

  @override
  String get deleteNoteConfirm => 'کیا آپ واقعی یہ نوٹ حذف کرنا چاہتے ہیں؟';

  @override
  String get noteTitle => 'عنوان';

  @override
  String get noteContent => 'مواد';

  @override
  String get addItem => 'آئٹم شامل کریں';

  @override
  String get pinNote => 'پن کریں';

  @override
  String get unpinNote => 'ان پن کریں';

  @override
  String get noteColor => 'رنگ';

  @override
  String get notePassword => 'پاس ورڈ';

  @override
  String get setPassword => 'پاس ورڈ سیٹ کریں';

  @override
  String get changePassword => 'پاس ورڈ تبدیل کریں';

  @override
  String get removePassword => 'پاس ورڈ ہٹائیں';

  @override
  String get enterPassword => 'پاس ورڈ درج کریں';

  @override
  String get confirmPassword => 'پاس ورڈ کی تصدیق کریں';

  @override
  String get passwordPin => 'PIN کوڈ';

  @override
  String get passwordText => 'متنی پاس ورڈ';

  @override
  String get protectedNote => 'محفوظ نوٹ';

  @override
  String get incorrectPassword => 'غلط پاس ورڈ';

  @override
  String get passwordSet => 'پاس ورڈ سیٹ ہو گیا';

  @override
  String get passwordRemoved => 'پاس ورڈ ہٹا دیا گیا';

  @override
  String get notesBiometric => 'نوٹس کے لیے Face ID';

  @override
  String get notesBiometricSubtitle =>
      'محفوظ نوٹس کھولنے کے لیے بایومیٹرک تصدیق کی ضرورت ہے';

  @override
  String get textNote => 'متنی نوٹ';

  @override
  String get checklistNote => 'چیک لسٹ';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total کام';
  }

  @override
  String get autoSaved => 'محفوظ ہو گیا';

  @override
  String get searchNotes => 'نوٹس تلاش کریں';

  @override
  String get legalConsent => 'قانونی رضامندی';

  @override
  String get confirmAge13 =>
      'میں تصدیق کرتا ہوں کہ میری عمر کم از کم 13 سال ہے';

  @override
  String get acceptLegalStart => 'میں قبول کرتا ہوں ';

  @override
  String get privacyPolicy => 'رازداری کی پالیسی';

  @override
  String get termsOfService => 'سروس کی شرائط';

  @override
  String get andThe => ' اور ';

  @override
  String get continueButton => 'جاری رکھیں';

  @override
  String get mustAcceptTerms =>
      'جاری رکھنے کے لیے آپ کو دونوں شرائط قبول کرنی ہوں گی';

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
  String get support => 'معاونت';

  @override
  String get contactSupport => 'معاونت سے رابطہ کریں';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'بدسلوکی کی رپورٹ کریں';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'قانونی';

  @override
  String get legalEntity => 'قانونی ادارہ';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'پن کریں';

  @override
  String get unpinConversation => 'ان پن کریں';

  @override
  String get hideConversation => 'فیڈ سے ہٹائیں';

  @override
  String get deleteConversation => 'گفتگو حذف کریں';

  @override
  String get deleteConversationConfirm =>
      'تمام پیغامات کی حذف شدگی کی تصدیق کے لیے اپنا PIN درج کریں';

  @override
  String get noConversations => 'ابھی تک کوئی گفتگو نہیں';

  @override
  String get startConversation => 'شروع کریں';

  @override
  String get microphonePermissionRequired => 'مائیکروفون تک رسائی ضروری ہے';

  @override
  String get microphonePermissionExplanation =>
      'Hash کو کالز کے لیے مائیکروفون کی ضرورت ہے۔';

  @override
  String get cameraPermissionExplanation =>
      'Hash کو ویڈیو کالز کے لیے کیمرے کی ضرورت ہے۔';

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
  String get openSettings => 'ترتیبات کھولیں';

  @override
  String get callConnecting => 'جوڑ رہا ہے...';

  @override
  String get callRinging => 'گھنٹی بج رہی ہے...';

  @override
  String get callReconnecting => 'دوبارہ جوڑ رہا ہے...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'دوبارہ جوڑ رہا ہے (${seconds}s)';
  }

  @override
  String get callPaused => 'روکا ہوا';

  @override
  String get callPausedSubtitle => 'کال ابھی بھی جاری ہے';

  @override
  String get callRemoteMicMuted => 'رابطے کا مائیکروفون خاموش ہے';

  @override
  String get callMiniControlsMute => 'خاموش کریں';

  @override
  String get callMiniControlsUnmute => 'آواز بحال کریں';

  @override
  String get callMiniControlsHangUp => 'کال ختم کریں';

  @override
  String get callMiniControlsReturn => 'کال پر واپس جائیں';

  @override
  String get callNetworkPoor => 'غیر مستحکم کنکشن';

  @override
  String get callNetworkLost => 'کنکشن ختم ہو گیا';

  @override
  String get callEndedTitle => 'کال ختم ہو گئی';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'آلے کا ڈیٹا';

  @override
  String get deviceDataSubtitle => 'مقامی اور سرور اسٹوریج';

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
  String get localStorage => 'مقامی اسٹوریج';

  @override
  String get onThisDevice => 'اس آلے پر';

  @override
  String get encryptedDatabases => 'انکرپٹڈ ڈیٹابیسز';

  @override
  String get files => 'فائلز';

  @override
  String get secureKeychain => 'محفوظ کی چین';

  @override
  String get cache => 'کیش';

  @override
  String get contactsDetail => 'نام، اوتار، Signal کیز';

  @override
  String get messagesDetail => 'انکرپٹڈ گفتگو';

  @override
  String get notesDetail => 'ذاتی نوٹس';

  @override
  String get signalSessions => 'Signal سیشنز';

  @override
  String get signalSessionsDetail => 'انکرپشن سیشنز';

  @override
  String get pendingContacts => 'زیر التوا رابطے';

  @override
  String get pendingContactsDetail => 'زیر التوا درخواستیں';

  @override
  String get callHistory => 'کالز';

  @override
  String get callHistoryDetail => 'کال ہسٹری';

  @override
  String get preferences => 'ترجیحات';

  @override
  String get preferencesDetail => 'میڈیا اور کال ترجیحات';

  @override
  String get avatars => 'اوتار';

  @override
  String get media => 'میڈیا';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فائلز',
      one: '1 فائل',
      zero: 'کوئی فائل نہیں',
    );
    return '$_temp0';
  }

  @override
  String get active => 'فعال';

  @override
  String get notDefined => 'متعین نہیں';

  @override
  String get biometrics => 'بایومیٹرکس';

  @override
  String get recoveryPhrase => 'بازیابی جملہ';

  @override
  String get identity => 'شناخت (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol کیز';

  @override
  String get authTokens => 'تصدیقی ٹوکنز';

  @override
  String get contactNamesCache => 'رابطوں کے ناموں کی کیش';

  @override
  String get remoteConfig => 'ریموٹ ترتیب';

  @override
  String get notificationPrefs => 'اطلاعات کی ترجیحات';

  @override
  String get serverData => 'سرور ڈیٹا';

  @override
  String get serverDataInfo =>
      'Hash سرور پر کم سے کم ڈیٹا رکھتا ہے، سب انکرپٹڈ یا عارضی۔';

  @override
  String get serverProfile => 'پروفائل';

  @override
  String get serverProfileDetail => 'Hash ID، عوامی کیز، میل باکس ٹوکن';

  @override
  String get serverPrekeys => 'پری کیز';

  @override
  String get serverPrekeysDetail =>
      'ایک بار استعمال ہونے والی Signal کیز (استعمال شدہ)';

  @override
  String get serverMessages => 'ٹرانزٹ میں پیغامات';

  @override
  String get serverMessagesDetail =>
      'ترسیل کے بعد حذف (زیادہ سے زیادہ 24 گھنٹے)';

  @override
  String get serverMedia => 'ٹرانزٹ میں میڈیا';

  @override
  String get serverMediaDetail => 'ڈاؤنلوڈ کے بعد حذف';

  @override
  String get serverContactRequests => 'رابطے کی درخواستیں';

  @override
  String get serverContactRequestsDetail => '24 گھنٹے بعد ختم ہو جاتی ہیں';

  @override
  String get serverRateLimits => 'شرح حدود';

  @override
  String get serverRateLimitsDetail => 'عارضی انسداد بدسلوکی ڈیٹا';

  @override
  String get privacyReassurance =>
      'Hash آپ کے پیغامات نہیں پڑھ سکتا۔ تمام ڈیٹا اینڈ ٹو اینڈ انکرپٹڈ ہے۔ سرور ڈیٹا خودکار طور پر حذف ہو جاتا ہے۔';

  @override
  String get pinTooSimple => 'یہ PIN بہت سادہ ہے۔ زیادہ محفوظ کوڈ منتخب کریں۔';

  @override
  String get genericError => 'خرابی ہوئی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'اکاؤنٹ بنانے میں ناکامی: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'جملہ کلپ بورڈ پر کاپی ہو گیا';

  @override
  String get copyPhrase => 'جملہ کاپی کریں';

  @override
  String get recoveryPhraseSecurityWarning =>
      'اس جملے کو محفوظ جگہ لکھیں۔ اگر آپ اس جملے کے بغیر اپنا PIN کھو دیں، تو آپ مستقل طور پر اپنے ڈیٹا تک رسائی کھو دیں گے۔';

  @override
  String get noMessages => 'کوئی پیغامات نہیں';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name کے ساتھ تمام پیغامات حذف کریں؟';
  }

  @override
  String get confirmation => 'تصدیق';

  @override
  String get untitled => 'بے عنوان';

  @override
  String get noSessions => 'کوئی سیشنز نہیں';

  @override
  String get unknownContact => 'نامعلوم رابطہ';

  @override
  String get unnamed => 'بے نام';

  @override
  String get noPendingRequestsAlt => 'کوئی زیر التوا درخواستیں نہیں';

  @override
  String get deleteAllCallHistory => 'تمام کال ہسٹری حذف کریں؟';

  @override
  String get noCalls => 'کوئی کالز نہیں';

  @override
  String get noPreferences => 'کوئی ترجیحات نہیں';

  @override
  String get resetAllMediaPrefs => 'تمام میڈیا ترجیحات ری سیٹ کریں؟';

  @override
  String get deleteThisAvatar => 'یہ اوتار حذف کریں؟';

  @override
  String get deleteAllAvatars => 'تمام اوتار حذف کریں؟';

  @override
  String get noAvatars => 'کوئی اوتار نہیں';

  @override
  String get deleteThisFile => 'یہ فائل حذف کریں؟';

  @override
  String get deleteAllMediaFiles => 'تمام میڈیا حذف کریں؟';

  @override
  String get noMediaFiles => 'کوئی میڈیا نہیں';

  @override
  String get outgoing => 'باہر جانے والی';

  @override
  String get incoming => 'آنے والی';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'عارضی منظر: ${seconds}s';
  }

  @override
  String get normalView => 'عام منظر';

  @override
  String get callReasonCompleted => 'مکمل';

  @override
  String get callReasonMissed => 'چھوٹی ہوئی';

  @override
  String get callReasonDeclined => 'مسترد';

  @override
  String get callReasonFailed => 'ناکام';

  @override
  String get justNow => 'ابھی';

  @override
  String timeAgoMinutes(int count) {
    return '$count منٹ پہلے';
  }

  @override
  String timeAgoHours(int count) {
    return '$count گھنٹے پہلے';
  }

  @override
  String timeAgoDays(int count) {
    return '$count دن پہلے';
  }

  @override
  String get messageTypeContact => 'رابطہ';

  @override
  String get messageTypeLocation => 'مقام';

  @override
  String get statusQueued => 'قطار میں';

  @override
  String get blockedBadge => 'بلاک شدہ';

  @override
  String get protectedBadge => 'محفوظ';

  @override
  String messageCount(int count) {
    return '$count پیغام(ات)';
  }

  @override
  String get deleteQuestion => 'حذف کریں؟';

  @override
  String get transferMyAccountTitle => 'میرا اکاؤنٹ منتقل کریں';

  @override
  String get loadingError => 'لوڈنگ خرابی';

  @override
  String get transferToNewDevice => 'نئے آلے پر منتقل کریں';

  @override
  String get transferInstructions =>
      'اپنے نئے آلے پر، \"میرا اکاؤنٹ بازیاب کریں\" منتخب کریں اور یہ معلومات درج کریں:';

  @override
  String get yourHashIdLabel => 'آپ کا Hash ID';

  @override
  String get enterYourPinCode => 'اپنا PIN کوڈ درج کریں';

  @override
  String get pinOwnerConfirmation => 'تصدیق کے لیے کہ آپ اس اکاؤنٹ کے مالک ہیں';

  @override
  String get scanThisQrCode => 'یہ QR code اسکین کریں';

  @override
  String get withYourNewDevice => 'اپنے نئے آلے سے';

  @override
  String get orEnterTheCode => 'یا کوڈ درج کریں';

  @override
  String get transferCodeLabel => 'منتقلی کوڈ';

  @override
  String get proximityVerification => 'قربت کی تصدیق';

  @override
  String get bringDevicesCloser => 'دونوں آلوں کو قریب لائیں';

  @override
  String get confirmTransferQuestion => 'منتقلی کی تصدیق کریں؟';

  @override
  String get accountWillBeTransferred =>
      'آپ کا اکاؤنٹ نئے آلے پر منتقل ہو جائے گا۔\n\nیہ آلہ مستقل طور پر منقطع ہو جائے گا۔';

  @override
  String get transferComplete => 'منتقلی مکمل';

  @override
  String get transferSuccessMessage =>
      'آپ کا اکاؤنٹ کامیابی سے منتقل ہو گیا ہے۔\n\nیہ ایپلیکیشن اب بند ہو جائے گی۔';

  @override
  String get manualVerification => 'دستی تصدیق';

  @override
  String get codeDisplayedOnBothDevices => 'دونوں آلوں پر دکھایا گیا کوڈ:';

  @override
  String get doesCodeMatchNewDevice =>
      'کیا یہ کوڈ نئے آلے پر موجود کوڈ سے ملتا ہے؟';

  @override
  String get verifiedStatus => 'تصدیق شدہ';

  @override
  String get inProgressStatus => 'جاری ہے...';

  @override
  String get notAvailableStatus => 'دستیاب نہیں';

  @override
  String get codeExpiredRestart => 'کوڈ ختم ہو گیا۔ براہ کرم دوبارہ شروع کریں۔';

  @override
  String get codesDoNotMatchCancelled => 'کوڈ مماثل نہیں ہیں۔ منتقلی منسوخ۔';

  @override
  String transferToDevice(String device) {
    return 'کو: $device';
  }

  @override
  String get copiedExclamation => 'کاپی ہو گیا!';

  @override
  String expiresInTime(String time) {
    return '$time میں ختم ہو جائے گا';
  }

  @override
  String get biometricNotAvailable => 'اس آلے پر بایومیٹرکس دستیاب نہیں';

  @override
  String get biometricAuthError => 'بایومیٹرک تصدیق میں خرابی';

  @override
  String get authenticateForBiometric =>
      'بایومیٹرکس فعال کرنے کے لیے براہ کرم تصدیق کریں';

  @override
  String get biometricAuthFailed => 'بایومیٹرک تصدیق ناکام';

  @override
  String get forceUpdateTitle => 'اپڈیٹ ضروری ہے';

  @override
  String get forceUpdateMessage =>
      'Hash کا نیا ورژن دستیاب ہے۔ جاری رکھنے کے لیے براہ کرم اپڈیٹ کریں۔';

  @override
  String get updateButton => 'اپڈیٹ کریں';

  @override
  String get maintenanceInProgress => 'دیکھ بھال جاری ہے';

  @override
  String get tryAgainLater => 'براہ کرم بعد میں دوبارہ کوشش کریں';

  @override
  String get information => 'معلومات';

  @override
  String get later => 'بعد میں';

  @override
  String get doYouLikeHash => 'کیا آپ کو Hash پسند ہے؟';

  @override
  String get yourFeedbackHelps =>
      'آپ کی رائے ایپ کو بہتر بنانے میں مدد کرتی ہے';

  @override
  String get ratingTerrible => 'خوفناک';

  @override
  String get ratingBad => 'برا';

  @override
  String get ratingOk => 'ٹھیک';

  @override
  String get ratingGood => 'اچھا';

  @override
  String get ratingExcellent => 'بہترین!';

  @override
  String get donationMessage =>
      'Hash ایک غیر منافع بخش منصوبہ ہے۔ آپ کی مدد ہمیں واقعی نجی میسنجر بنانے میں مدد کرتی ہے۔';

  @override
  String get recentConnections => 'حالیہ کنکشنز';

  @override
  String get loginInfoText =>
      'ہر PIN ان لاک مقامی طور پر ریکارڈ ہوتا ہے۔ صرف آخری 24 گھنٹے محفوظ رہتے ہیں۔';

  @override
  String get connectionCount => 'کنکشن';

  @override
  String get periodLabel => 'مدت';

  @override
  String get historyLabel => 'تاریخ';

  @override
  String get noLoginRecorded => 'کوئی لاگ ان ریکارڈ نہیں';

  @override
  String get nextUnlocksAppearHere => 'اگلے ان لاک یہاں ظاہر ہوں گے۔';

  @override
  String get dataLocalOnly =>
      'یہ ڈیٹا صرف آپ کے آلے پر محفوظ ہے اور کبھی منتقل نہیں ہوتا۔';

  @override
  String get currentSession => 'موجودہ';

  @override
  String get todayLabel => 'آج';

  @override
  String get yesterdayLabel => 'کل';

  @override
  String get justNowLabel => 'ابھی';

  @override
  String minutesAgoLabel(int count) {
    return '$count منٹ پہلے';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours گھنٹے پہلے';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours گھنٹے $minutes منٹ پہلے';
  }

  @override
  String get noMaintenancePlanned => 'کوئی دیکھ بھال منصوبہ بند نہیں';

  @override
  String get everythingWorkingNormally => 'سب کچھ عام طور پر کام کر رہا ہے';

  @override
  String get maintenanceTitle => 'دیکھ بھال';

  @override
  String get maintenanceActiveLabel => 'جاری ہے';

  @override
  String get maintenancePlannedLabel => 'منصوبہ بند';

  @override
  String get locking => 'لاک ہو رہا ہے...';

  @override
  String get newMessageNotification => 'نیا پیغام';

  @override
  String get secExplainTitle => 'Hash آپ کی حفاظت کیسے کرتا ہے';

  @override
  String get secExplainIntro =>
      'Hash اس طرح ڈیزائن کیا گیا ہے کہ کوئی آپ کے پیغامات نہیں پڑھ سکتا۔';

  @override
  String get secExplainIntroSub =>
      'ہم بھی نہیں۔\nیہاں بتایا گیا ہے کہ یہ کیسے کام کرتا ہے، سادہ الفاظ میں۔';

  @override
  String get secJourneyLabel => 'سفر';

  @override
  String get secJourneyTitle => 'آپ کے پیغام کا سفر';

  @override
  String get secJourneySubtitle =>
      'آپ کی انگلی سے آپ کے رابطے کی اسکرین تک، ہر قدم محفوظ ہے۔ راستے کی پیروی کریں۔';

  @override
  String get secStep1Title => 'آپ اپنا پیغام لکھتے ہیں';

  @override
  String get secStep1Desc =>
      'آپ ایپ میں \"ہیلو!\" ٹائپ کرتے ہیں۔ اس وقت، پیغام صرف آپ کے فون کی میموری میں موجود ہے۔ کچھ نہیں بھیجا گیا۔';

  @override
  String get secStep2Title => 'Signal Protocol سے انکرپشن';

  @override
  String get secStep2Desc =>
      'جیسے ہی آپ \"بھیجیں\" دبائیں، آپ کا پیغام ناقابل فہم حروف کی ایک تار میں بدل جاتا ہے۔ جیسے آپ کا پیغام ایک تجوری میں بند ہو جہاں کی چابی صرف آپ کے رابطے کے پاس ہو۔';

  @override
  String get secStep3Title => 'Sealed Sender: غیر مرئی لفافہ';

  @override
  String get secStep3Desc =>
      'تصور کریں کہ آپ ڈاک سے خط بھیجتے ہیں، لیکن لفافے پر واپسی کا پتہ نہیں ہے۔ Hash بالکل یہی کرتا ہے۔ پیغام ایک گمنام میل باکس میں ڈال دیا جاتا ہے۔ سرور کو نہیں معلوم کس نے بھیجا۔';

  @override
  String get secStep4Title => 'سرور کچھ نہیں دیکھتا';

  @override
  String get secStep4Desc =>
      'سرور ایک اندھے ڈاکیے کی طرح کام کرتا ہے۔ اسے صرف اتنا معلوم ہے کہ \"کسی نے میل باکس #A7X9 میں کچھ ڈالا\"۔ نہ معلوم کس نے بھیجا، کیا ہے، یا کس کے لیے ہے۔';

  @override
  String get secStep4Highlight =>
      'کوئی میٹا ڈیٹا محفوظ نہیں: نہ IP ایڈریس، نہ ٹائم اسٹیمپ، نہ بھیجنے والے اور وصول کنندے کے درمیان کوئی ربط۔';

  @override
  String get secStep5Title => 'آپ کا رابطہ پیغام وصول کرتا ہے';

  @override
  String get secStep5Desc =>
      'آپ کے رابطے کا فون اپنے گمنام میل باکس سے مواد لیتا ہے اور اپنی نجی کلید سے پیغام کو ڈیکرپٹ کرتا ہے، جو کبھی آلے سے باہر نہیں گئی۔ \"ہیلو!\" ان کی اسکرین پر ظاہر ہوتا ہے۔';

  @override
  String get secStep6Title => 'پیغام سرور سے غائب ہو جاتا ہے';

  @override
  String get secStep6Desc =>
      'جیسے ہی آپ کا رابطہ وصولی کی تصدیق کرتا ہے، سرور پیغام کو مستقل طور پر حذف کر دیتا ہے۔ کوئی ردی، کوئی آرکائیو، کوئی بیک اپ نہیں۔ غیر پڑھے پیغامات بھی 24 گھنٹوں بعد خودکار طور پر تباہ ہو جاتے ہیں۔';

  @override
  String get secStep7Title => 'مقامی میعاد';

  @override
  String get secStep7Desc =>
      'آپ کے رابطے کے فون پر، پیغام آپ کی منتخب کردہ مدت کے مطابق خود تباہ ہو جاتا ہے: پڑھتے ہی، 5 منٹ، 1 گھنٹا... آپ فیصلہ کرتے ہیں۔';

  @override
  String get secJourneyConclusion =>
      'نتیجہ: سرور پر صفر نشان، آلوں پر صفر نشان۔ پیغام صرف پڑھنے کے لیے ضروری وقت تک موجود رہا، پھر غائب ہو گیا۔';

  @override
  String get secArchLabel => 'فن تعمیر';

  @override
  String get secArchTitle => 'تحفظ کی 5 تہیں';

  @override
  String get secArchSubtitle =>
      'Hash ایک ٹیکنالوجی پر انحصار نہیں کرتا۔ ہر تہ دوسروں کو مضبوط کرتی ہے۔ اگر ایک تہ سے سمجھوتا ہو بھی جائے، آپ کا ڈیٹا محفوظ رہتا ہے۔';

  @override
  String get secLayer1Title => 'اینڈ ٹو اینڈ انکرپشن';

  @override
  String get secLayer1Desc =>
      'ہر پیغام ایک منفرد کلید سے انکرپٹ ہوتا ہے۔ سادہ الفاظ میں: اگر کوئی ایک پیغام ڈیکرپٹ کر لے بھی، اگلا نہیں کر سکے گا۔ ہر پیغام کا اپنا تالا ہے۔';

  @override
  String get secLayer1Detail =>
      'فائلز (تصاویر، ویڈیوز، دستاویزات) کے لیے Hash اضافی AES-256-GCM انکرپشن استعمال کرتا ہے۔ فائل آپ کے فون سے نکلنے سے پہلے انکرپٹ ہو جاتی ہے۔';

  @override
  String get secLayer2Title => 'Sealed Sender (نیٹ ورک گمنامی)';

  @override
  String get secLayer2Desc =>
      'عام میسنجرز آپ کے پیغامات آپ کی شناخت کے ساتھ بھیجتے ہیں۔ جیسے لفافے پر اپنا نام لکھنا۔ Hash گمنام میل باکس استعمال کرتا ہے: سرور پیغام پہنچاتا ہے بغیر جانے کس نے بھیجا۔';

  @override
  String get secLayer2Detail =>
      'نتیجہ: سرور ڈیٹا کی خلاف ورزی کی صورت میں بھی، یہ دوبارہ بنانا ناممکن ہے کہ کون کس سے بات کرتا ہے۔';

  @override
  String get secLayer3Title => 'خودکار حذف';

  @override
  String get secLayer3Desc =>
      'وصولی کی تصدیق ہوتے ہی پیغامات سرور سے حذف ہو جاتے ہیں۔ اگر پیغام کبھی وصول نہ ہو، تب بھی 24 گھنٹوں بعد خودکار طور پر تباہ ہو جاتا ہے۔';

  @override
  String get secLayer3Detail =>
      'آپ کے فون پر، آپ کی منتخب کردہ مدت کے مطابق پیغامات خود تباہ ہو جاتے ہیں: فوری، 5 منٹ، 15 منٹ، 30 منٹ، 1 گھنٹا، 3 گھنٹے، 6 گھنٹے، یا 12 گھنٹے۔';

  @override
  String get secLayer4Title => 'مقامی رسائی تحفظ';

  @override
  String get secLayer4Desc =>
      'ایپ 6 ہندسوں کے PIN اور/یا بایومیٹرکس (Face ID، فنگرپرنٹ) سے محفوظ ہے۔ بہت زیادہ ناکام کوششوں کے بعد، ایپ بڑھتی ہوئی تاخیر سے لاک ہو جاتی ہے۔';

  @override
  String get secLayer5Title => 'مقفل ڈیٹابیس';

  @override
  String get secLayer5Desc =>
      'سرور کی طرف، کوئی صارف براہ راست ڈیٹابیس میں نہیں لکھ سکتا۔ تمام اعمال محفوظ فنکشنز سے گزرتے ہیں جو ہر درخواست کی تصدیق کرتے ہیں۔';

  @override
  String get secLayer5Detail =>
      'یہ بینک کاؤنٹر کی طرح ہے: آپ کبھی خود خزانے کو نہیں چھوتے۔ آپ درخواست کرتے ہیں، اور سسٹم عمل کرنے سے پہلے آپ کے حق کی تصدیق کرتا ہے۔';

  @override
  String get secVashLabel => 'دنیا میں منفرد';

  @override
  String get secVashTitle => 'Vash موڈ';

  @override
  String get secVashSubtitle =>
      'ایک ہنگامی سیکیورٹی نظام جو کسی اور میسجنگ ایپ میں نہیں ہے۔';

  @override
  String get secVashScenarioTitle => 'اس صورتحال کا تصور کریں';

  @override
  String get secVashScenario1 => 'کوئی آپ کے فون تک رسائی حاصل کرتا ہے';

  @override
  String get secVashScenario2 => 'آپ سے PIN کوڈ مانگا جاتا ہے';

  @override
  String get secVashScenario3 =>
      'آپ فوری طور پر اپنا تمام ڈیٹا مٹانا چاہتے ہیں';

  @override
  String get secVashSolutionTitle => 'حل: دو PIN کوڈز';

  @override
  String get secVashSolutionDesc =>
      'آپ Hash میں دو مختلف PIN کوڈز ترتیب دیتے ہیں:';

  @override
  String get secVashNormalCodeLabel => 'عام کوڈ';

  @override
  String get secVashNormalCodeDesc =>
      'ایپ کو آپ کے تمام ڈیٹا کے ساتھ عام طور پر کھولتا ہے';

  @override
  String get secVashCodeLabel2 => 'Vash کوڈ';

  @override
  String get secVashCodeDescription =>
      'ایپ کو عام طور پر کھولتا ہے... لیکن آپ کا تمام ڈیٹا پس منظر میں خاموشی سے حذف ہو جاتا ہے';

  @override
  String get secVashWhatHappensTitle => 'اس کے بعد کیا ہوتا ہے';

  @override
  String get secVashWhatHappensDesc =>
      'ایپ عام طور پر کھلتی ہے۔ کوئی الرٹ نہیں، کوئی مشکوک اینیمیشن نہیں۔ اسکرین صرف ایک خالی ایپ دکھاتی ہے، جیسے آپ نے ابھی انسٹال کیا ہو۔\n\nحقیقت میں، آپ کی تمام گفتگو، رابطے اور پیغامات ایک سیکنڈ کے حصے میں ناقابل واپسی طور پر حذف ہو چکے ہیں۔';

  @override
  String get secCallsLabel => 'کالز اور فائلز';

  @override
  String get secCallsTitle => 'سب کچھ انکرپٹڈ ہے';

  @override
  String get secCallsSubtitle =>
      'یہ صرف پیغامات نہیں ہیں۔ Hash سے گزرنے والی ہر چیز اینڈ ٹو اینڈ انکرپٹڈ ہے۔';

  @override
  String get secAudioCallTitle => 'آڈیو کالز';

  @override
  String get secAudioCallDesc =>
      'WebRTC کے ذریعے اینڈ ٹو اینڈ انکرپٹڈ۔ آواز براہ راست آلوں کے درمیان منتقل ہوتی ہے۔';

  @override
  String get secVideoCallTitle => 'ویڈیو کالز';

  @override
  String get secVideoCallDesc =>
      'وہی ٹیکنالوجی، ہر سلسلہ انفرادی طور پر انکرپٹڈ۔';

  @override
  String get secPhotosTitle => 'تصاویر اور ویڈیوز';

  @override
  String get secPhotosDesc =>
      'آپ کے فون سے نکلنے سے پہلے AES-256-GCM میں انکرپٹڈ۔';

  @override
  String get secDocsTitle => 'دستاویزات';

  @override
  String get secDocsDesc =>
      'PDF، ZIP، کوئی بھی فائل۔ نام، سائز اور مواد انکرپٹڈ۔';

  @override
  String get secAnonLabel => 'گمنامی';

  @override
  String get secAnonTitle => 'کوئی شناخت درکار نہیں';

  @override
  String get secAnonSubtitle =>
      'Hash کبھی آپ کا فون نمبر یا ای میل نہیں مانگتا۔ آپ ایک منفرد اور گمنام Hash ID سے پہچانے جاتے ہیں۔';

  @override
  String get secHashIdTitle => 'آپ کا Hash ID';

  @override
  String get secHashIdDesc =>
      'یہ آپ کا منفرد شناختی نمبر ہے۔ یہ آپ کے بارے میں کچھ ظاہر نہیں کرتا: نہ آپ کا نام، نہ نمبر، نہ مقام۔ یہ ایک ایسا فرضی نام ہے جسے آپ کی اصل شناخت سے جوڑنا ناممکن ہے۔\n\nرابطہ شامل کرنے کے لیے، آپ اپنا Hash ID شیئر کرتے ہیں یا QR code اسکین کرتے ہیں۔ بس۔ کوئی مطابقت شدہ ایڈریس بک نہیں، کوئی \"جن لوگوں کو آپ جانتے ہوں گے\" کی تجاویز نہیں۔';

  @override
  String get secDataLabel => 'ڈیٹا';

  @override
  String get secDataTitle => 'Hash کو کیا معلوم نہیں';

  @override
  String get secDataSubtitle =>
      'آپ کے ڈیٹا کی حفاظت کا بہترین طریقہ اسے جمع نہ کرنا ہے۔';

  @override
  String get secNeverCollected => 'کبھی جمع نہیں کیا جاتا';

  @override
  String get secNeverItem1 => 'پیغام کا مواد';

  @override
  String get secNeverItem2 => 'رابطوں کی فہرست';

  @override
  String get secNeverItem3 => 'فون نمبر';

  @override
  String get secNeverItem4 => 'ای میل ایڈریس';

  @override
  String get secNeverItem5 => 'IP ایڈریس';

  @override
  String get secNeverItem6 => 'مقام';

  @override
  String get secNeverItem7 => 'میٹا ڈیٹا (کون کس سے بات کرتا ہے)';

  @override
  String get secNeverItem8 => 'کال ہسٹری';

  @override
  String get secNeverItem9 => 'ایڈریس بک';

  @override
  String get secNeverItem10 => 'اشتہاری شناخت کنندگان';

  @override
  String get secTempStored => 'عارضی طور پر محفوظ';

  @override
  String get secTempItem1 => 'گمنام Hash ID (منفرد شناخت کنندہ)';

  @override
  String get secTempItem2 => 'عوامی انکرپشن کیز';

  @override
  String get secTempItem3 =>
      'ٹرانزٹ میں انکرپٹڈ پیغامات (زیادہ سے زیادہ 24 گھنٹے)';

  @override
  String get secTempNote =>
      'یہ کم سے کم ڈیٹا بھی آپ کی شناخت نہیں کر سکتا۔ آپ کا Hash ID کسی ذاتی معلومات سے نہیں جڑا۔';

  @override
  String get secFooterTitle => 'آپ کی رازداری، آپ کی آزادی';

  @override
  String get secFooterDesc =>
      'Hash انہی انکرپشن ٹیکنالوجیز کا استعمال کرتا ہے جو سب سے زیادہ مطالبہ کرنے والی پیشہ ورانہ ایپلیکیشنز استعمال کرتی ہیں۔ آپ کے پیغامات ریاضی سے محفوظ ہیں، وعدوں سے نہیں۔';

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
