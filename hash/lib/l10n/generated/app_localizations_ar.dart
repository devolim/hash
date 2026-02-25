// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'بدون أثر. بدون تنازل.';

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
  String get conversations => 'الدردشات';

  @override
  String get contacts => 'جهات الاتصال';

  @override
  String get noConversation => 'لا توجد دردشات';

  @override
  String get noConversationSubtitle => 'أضف جهة اتصال لبدء الدردشة بأمان';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count طلبات معلقة',
      one: 'طلب واحد معلق',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count طلبات مرسلة معلقة',
      one: 'طلب مرسل واحد معلق',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'إضافة جهة اتصال';

  @override
  String get shareApp => 'مشاركة التطبيق';

  @override
  String get newMessage => 'رسالة جديدة';

  @override
  String get newConversation => 'أرسل رسالة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get myHashId => 'معرّف Hash الخاص بي';

  @override
  String get supportHash => 'دعم Hash';

  @override
  String get supportHashSubtitle => 'Hash مشروع غير ربحي';

  @override
  String get donate => 'تبرع';

  @override
  String get appearance => 'المظهر';

  @override
  String get theme => 'السمة';

  @override
  String get themeAuto => 'تلقائي';

  @override
  String get themeAutoSubtitle => 'يتبع إعدادات النظام';

  @override
  String get themeDark => 'داكن';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeRecommendation => 'السمة الداكنة موصى بها لمزيد من الخصوصية';

  @override
  String get language => 'اللغة';

  @override
  String get languageAuto => 'تلقائي (النظام)';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get messages => 'الرسائل';

  @override
  String get calls => 'المكالمات';

  @override
  String get vibration => 'الاهتزاز';

  @override
  String get notificationContent => 'محتوى الإشعارات';

  @override
  String get notificationContentFull => 'عرض الكل';

  @override
  String get notificationContentFullDesc => 'اسم جهة الاتصال ومعاينة الرسالة';

  @override
  String get notificationContentName => 'الاسم فقط';

  @override
  String get notificationContentNameDesc => 'يعرض فقط اسم جهة الاتصال';

  @override
  String get notificationContentDiscrete => 'سري';

  @override
  String get notificationContentDiscreteDesc => 'يعرض فقط \"رسالة جديدة\"';

  @override
  String get security => 'الأمان';

  @override
  String get howHashProtectsYou => 'كيف يحميك Hash';

  @override
  String get howHashProtectsYouSubtitle => 'افهم أمانك';

  @override
  String get accountSecurity => 'أمان الحساب';

  @override
  String get accountSecuritySubtitle => 'رمز PIN، البصمة، وضع Vash';

  @override
  String get blockScreenshots => 'حظر لقطات الشاشة';

  @override
  String get transferDevice => 'النقل إلى جهاز آخر';

  @override
  String get transferDeviceSubtitle => 'نقل حسابك';

  @override
  String get pinCode => 'رمز PIN';

  @override
  String get changePin => 'تغيير رمز PIN';

  @override
  String get currentPin => 'رمز PIN الحالي';

  @override
  String get newPin => 'رمز PIN الجديد';

  @override
  String get confirmPin => 'تأكيد رمز PIN';

  @override
  String get pinChanged => 'تم تغيير رمز PIN';

  @override
  String get incorrectPin => 'رمز PIN غير صحيح';

  @override
  String get pinsDoNotMatch => 'الرموز غير متطابقة';

  @override
  String get autoLock => 'القفل التلقائي';

  @override
  String get autoLockDelay => 'مهلة القفل';

  @override
  String get autoLockImmediate => 'فوري';

  @override
  String get autoLockMinute => 'دقيقة واحدة';

  @override
  String autoLockMinutes(int count) {
    return '$count دقائق';
  }

  @override
  String get vashCode => 'رمز Vash';

  @override
  String get vashModeTitle => 'وضع Vash';

  @override
  String get vashModeExplanation => 'شبكة أمانك المطلقة.';

  @override
  String get vashModeDescription =>
      'ستختار رمز PIN ثانٍ. إذا أُجبرت يوماً على فتح Hash، أدخل هذا الرمز بدلاً من رمز PIN العادي.\n\nسيفتح التطبيق بشكل عادي، لكن جميع محادثاتك وجهات اتصالك ستكون قد اختفت.\n\nلأي شخص ينظر إلى شاشتك، سيبدو Hash فارغاً — كأنك لم تستخدمه أبداً.';

  @override
  String get vashModeIrreversible => 'هذا الإجراء صامت ولا رجعة فيه.';

  @override
  String get chooseVashCode => 'اختيار رمز Vash الخاص بي';

  @override
  String get vashCodeInfo => 'رمز PIN ثانٍ يفتح التطبيق بشكل عادي، لكن فارغاً.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'إذا أدخلت هذا الرمز بدلاً من PIN:';

  @override
  String get vashDeleteContacts => 'جهات اتصالك تختفي';

  @override
  String get vashDeleteMessages => 'محادثاتك تختفي';

  @override
  String get vashDeleteHistory => 'ملاحظاتك تختفي';

  @override
  String get vashKeepId => 'هويتك في Hash (#XXX-XXX-XXX) تبقى كما هي';

  @override
  String get vashAppearNormal =>
      'سيظهر التطبيق عادياً لكن فارغاً، كأنه جديد. هذا الإجراء لا رجعة فيه.';

  @override
  String get setupVashCode => 'إعداد رمز Vash';

  @override
  String get modifyVashCode => 'تعديل رمز Vash';

  @override
  String get currentVashCode => 'رمز Vash الحالي';

  @override
  String get newVashCode => 'رمز Vash الجديد';

  @override
  String get confirmVashCode => 'تأكيد رمز Vash';

  @override
  String get vashCodeConfigured => 'تم إعداد رمز Vash';

  @override
  String get vashCodeModified => 'تم تعديل رمز Vash';

  @override
  String get vashCodeMustDiffer => 'يجب أن يكون رمز Vash مختلفاً عن PIN';

  @override
  String get incorrectVashCode => 'رمز Vash غير صحيح';

  @override
  String get vashWhatToDelete => 'ماذا يجب أن يُخفي وضع Vash؟';

  @override
  String get vashDeleteContactsOption => 'جهات الاتصال';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'الرسائل';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'الملاحظات';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'تم تفعيل وضع Vash';

  @override
  String get vashCreateSubtitle => 'اختر رمزاً مختلفاً عن رمز PIN الرئيسي';

  @override
  String get vashConfirmSubtitle => 'أكد رمز Vash الخاص بك';

  @override
  String get pinCodeForEntry => 'رمز PIN للدخول إلى التطبيق';

  @override
  String get vashCodeSection => 'وضع Vash';

  @override
  String get biometric => 'القياسات الحيوية';

  @override
  String get biometricUnlock => 'فتح ببصمة الإصبع أو Face ID';

  @override
  String get enableBiometric => 'تفعيل القياسات الحيوية';

  @override
  String get biometricWarningMessage =>
      'بتفعيل القياسات الحيوية، لن تتمكن من استخدام رمز PIN الخاص بك. هل أنت متأكد؟';

  @override
  String get understood => 'فهمت';

  @override
  String get shareAppSubtitle => 'شارك Hash مع أحبائك';

  @override
  String get share => 'مشاركة';

  @override
  String get danger => 'خطر';

  @override
  String get deleteAccount => 'حذف حسابي';

  @override
  String get deleteAccountSubtitle => 'إجراء لا رجعة فيه';

  @override
  String get deleteAccountConfirmTitle => 'حذف حسابي';

  @override
  String get deleteAccountConfirmMessage =>
      'سيتم حذف حسابك نهائياً. هذا الإجراء لا رجعة فيه.\n\n• جميع دردشاتك\n• جميع جهات اتصالك\n• معرّف Hash الخاص بك\n\nستحتاج إلى إنشاء حساب جديد.';

  @override
  String get deleteForever => 'حذف نهائي';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'تم تفعيل وضع Vash.';

  @override
  String deletionError(String error) {
    return 'خطأ في الحذف: $error';
  }

  @override
  String get yourSecurity => 'أمانك';

  @override
  String get securityInfo =>
      '• تشفير من طرف إلى طرف (بروتوكول Signal)\n• لا بيانات على خوادمنا بعد التسليم\n• المفاتيح مخزنة فقط على جهازك\n• رمز PIN لا يُرسل أبداً للخادم';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'مرحباً';

  @override
  String get securityStatement1 => 'رسائلك محمية.';

  @override
  String get securityStatement2 => 'تشفير من طرف إلى طرف.';

  @override
  String get securityStatement3 => 'بدون أثر. بدون تنازل.';

  @override
  String get securityStatement4 => 'خصوصيتك حق.';

  @override
  String get accessBlocked => 'تم حظر الوصول';

  @override
  String get tooManyAttempts => 'محاولات كثيرة جداً. حاول مرة أخرى لاحقاً.';

  @override
  String get pleaseWait => 'يرجى الانتظار';

  @override
  String get waitDelay => 'يرجى انتظار انتهاء المهلة';

  @override
  String attemptCount(int current, int max) {
    return 'المحاولة $current من $max';
  }

  @override
  String retryIn(String time) {
    return 'أعد المحاولة خلال $time';
  }

  @override
  String get forgotPin => 'نسيت PIN؟ استخدم عبارة الاسترداد';

  @override
  String get useRecoveryPhrase => 'استخدم عبارة الاسترداد';

  @override
  String get recoveryWarningTitle => 'تنبيه';

  @override
  String get recoveryWarningMessage => 'استرداد الحساب سيقوم بـ:';

  @override
  String get recoveryDeleteAllMessages => 'حذف جميع رسائلك';

  @override
  String get recoveryWaitDelay => 'طلب انتظار ساعة واحدة';

  @override
  String get recoveryKeepContacts => 'الاحتفاظ بجهات اتصالك';

  @override
  String get recoveryIrreversible =>
      'هذا الإجراء لا رجعة فيه. ستفقد رسائلك نهائياً.';

  @override
  String get iUnderstand => 'أفهم';

  @override
  String get accountRecovery => 'استرداد الحساب';

  @override
  String get enterRecoveryPhrase =>
      'أدخل الكلمات الـ 24 لعبارة الاسترداد، مفصولة بمسافات.';

  @override
  String get recoveryPhraseHint => 'كلمة1 كلمة2 كلمة3 ...';

  @override
  String get recover => 'استرداد';

  @override
  String get recoveryPhraseRequired => 'يرجى إدخال عبارة الاسترداد';

  @override
  String get recoveryPhrase24Words => 'يجب أن تحتوي العبارة على 24 كلمة بالضبط';

  @override
  String get incorrectRecoveryPhrase => 'عبارة الاسترداد غير صحيحة';

  @override
  String get recoveryInitError => 'خطأ في بدء الاسترداد';

  @override
  String get securityDelay => 'مهلة الأمان';

  @override
  String get securityDelayMessage =>
      'لأمانك، مطلوب فترة انتظار قبل إنشاء PIN جديد.';

  @override
  String get timeRemaining => 'الوقت المتبقي';

  @override
  String get messagesDeletedForProtection => 'تم حذف رسائلك لحمايتك.';

  @override
  String get canCloseApp => 'يمكنك إغلاق التطبيق والعودة لاحقاً.';

  @override
  String get onboardingTitle1 => 'مرحباً بك في Hash';

  @override
  String get onboardingSubtitle1 => 'تطبيق المراسلة الذي لا يترك أثراً';

  @override
  String get onboardingTitle2 => 'تشفير كامل';

  @override
  String get onboardingSubtitle2 =>
      'رسائلك مشفرة من طرف إلى طرف ببروتوكول Signal';

  @override
  String get onboardingTitle3 => 'بدون أثر';

  @override
  String get onboardingSubtitle3 => 'الرسائل تُحذف من الخوادم بعد التسليم';

  @override
  String get onboardingTitle4 => 'أمانك';

  @override
  String get onboardingSubtitle4 => 'رمز PIN، وضع Vash وعبارة الاسترداد';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get next => 'التالي';

  @override
  String get skip => 'تخطي';

  @override
  String get alreadyHaveAccount => 'لدي حساب بالفعل';

  @override
  String get transferMyAccount => 'نقل حسابي';

  @override
  String get createPin => 'إنشاء رمز PIN';

  @override
  String get createPinSubtitle => 'سيحمي هذا الرمز الوصول إلى تطبيقك';

  @override
  String get confirmYourPin => 'تأكيد رمز PIN';

  @override
  String get confirmPinSubtitle => 'أدخل رمز PIN مرة أخرى';

  @override
  String get saveRecoveryPhrase => 'عبارة الاسترداد';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'اكتب هذه الكلمات الـ 24 بالترتيب. ستسمح لك باسترداد حسابك إذا نسيت PIN.';

  @override
  String get phraseWritten => 'كتبت العبارة';

  @override
  String get warningRecoveryPhrase =>
      'إذا فقدت هذه العبارة ونسيت PIN، ستفقد الوصول إلى حسابك.';

  @override
  String get accountTransferred => 'تم نقل الحساب';

  @override
  String get accountTransferredMessage =>
      'تم نقل حسابك إلى جهاز آخر. هذه الجلسة لم تعد صالحة.';

  @override
  String get accountTransferredInfo =>
      'إذا لم تبدأ هذا النقل، فربما تم اختراق حسابك.';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get transferAccount => 'نقل الحساب';

  @override
  String get transferAccountInfo =>
      'انقل حساب Hash إلى جهاز جديد. ستُبطل جلستك الحالية.';

  @override
  String get generateTransferCode => 'إنشاء رمز النقل';

  @override
  String get transferCode => 'رمز النقل';

  @override
  String transferCodeExpires(int minutes) {
    return 'ينتهي هذا الرمز خلال $minutes دقائق';
  }

  @override
  String get enterCodeOnNewDevice =>
      'أدخل هذا الرمز على جهازك الجديد لنقل حسابك.';

  @override
  String get generateNewCode => 'إنشاء رمز جديد';

  @override
  String get scanQrCode => 'مسح رمز QR';

  @override
  String get scanQrCodeSubtitle => 'امسح رمز QR لجهة اتصال لإضافتها';

  @override
  String get qrCodeDetected => 'تم اكتشاف رمز QR';

  @override
  String get invalidQrCode => 'رمز QR غير صالح';

  @override
  String get cameraPermissionRequired => 'إذن الكاميرا مطلوب';

  @override
  String get myQrCode => 'رمز QR الخاص بي';

  @override
  String get myQrCodeSubtitle => 'شارك رمز QR هذا ليتمكن جهات اتصالك من إضافتك';

  @override
  String get shareQrCode => 'مشاركة';

  @override
  String get addContactTitle => 'إضافة جهة اتصال';

  @override
  String get addContactByHashId => 'أدخل معرّف Hash لجهة اتصالك';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'بحث';

  @override
  String get contactNotFound => 'جهة الاتصال غير موجودة';

  @override
  String get contactAlreadyAdded => 'جهة الاتصال موجودة بالفعل في قائمتك';

  @override
  String get contactAdded => 'تمت إضافة جهة الاتصال';

  @override
  String get myProfile => 'ملفي الشخصي';

  @override
  String get myProfileSubtitle => 'شارك هذه المعلومات ليتمكن الآخرون من إضافتك';

  @override
  String get temporaryCode => 'الرمز المؤقت';

  @override
  String temporaryCodeExpires(String time) {
    return 'ينتهي خلال $time';
  }

  @override
  String get codeExpired => 'انتهت صلاحية الرمز';

  @override
  String get generateNewCodeButton => 'رمز جديد';

  @override
  String get copyHashId => 'نسخ المعرّف';

  @override
  String get copyCode => 'نسخ الرمز';

  @override
  String get copiedToClipboard => 'تم النسخ';

  @override
  String get showMyQrCode => 'عرض رمز QR الخاص بي';

  @override
  String get orDivider => 'أو';

  @override
  String get openScanner => 'فتح الماسح';

  @override
  String get addManually => 'إضافة يدوياً';

  @override
  String get contactHashIdLabel => 'معرّف Hash لجهة الاتصال';

  @override
  String get temporaryCodeLabel => 'الرمز المؤقت';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode => 'اطلب من جهة اتصالك إنشاء رمز من ملفه الشخصي';

  @override
  String get verifyAndAdd => 'التحقق والإضافة';

  @override
  String get fillAllFields => 'يرجى ملء جميع الحقول';

  @override
  String get invalidHashIdFormat =>
      'صيغة المعرّف غير صالحة (مثال: 123-456-ABC)';

  @override
  String get userNotFound => 'المستخدم غير موجود';

  @override
  String get cannotAddYourself => 'لا يمكنك إضافة نفسك';

  @override
  String get invalidOrExpiredCode => 'الرمز المؤقت غير صالح أو منتهي الصلاحية';

  @override
  String get contactFound => 'تم العثور على جهة الاتصال!';

  @override
  String get howToCallContact => 'ماذا تريد تسميته؟';

  @override
  String get contactNameHint => 'اسم جهة الاتصال';

  @override
  String get addContactButton => 'إضافة';

  @override
  String get contactDetails => 'تفاصيل جهة الاتصال';

  @override
  String get contactName => 'اسم جهة الاتصال';

  @override
  String get contactHashId => 'معرّف Hash';

  @override
  String addedOn(String date) {
    return 'تمت الإضافة في $date';
  }

  @override
  String get deleteContact => 'حذف جهة الاتصال';

  @override
  String deleteContactConfirm(Object name) {
    return 'حذف جهة الاتصال هذه؟';
  }

  @override
  String get deleteContactMessage => 'سيحذف هذا أيضاً الدردشة بأكملها.';

  @override
  String get delete => 'حذف';

  @override
  String get typeMessage => 'اكتب رسالة...';

  @override
  String get messageSent => 'مُرسلة';

  @override
  String get messageDelivered => 'تم التسليم';

  @override
  String get messageRead => 'مقروءة';

  @override
  String get messageFailed => 'فشل الإرسال';

  @override
  String get now => 'الآن';

  @override
  String minutesAgo(int count) {
    return '$countد';
  }

  @override
  String hoursAgo(int count) {
    return '$countس';
  }

  @override
  String daysAgo(int count) {
    return '$countي';
  }

  @override
  String get today => 'اليوم';

  @override
  String get yesterday => 'أمس';

  @override
  String dateAtTime(String date, String time) {
    return '$date في $time';
  }

  @override
  String get shareMessage =>
      'انضم إليّ على Hash! 🔒\n\nإنه تطبيق مراسلة خاص حقاً: تشفير كامل، بدون أثر على الخوادم، ووضع الذعر عند الحاجة.\n\nحمّل التطبيق من هنا 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'خطأ';

  @override
  String get ok => 'موافق';

  @override
  String get view => 'عرض';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get save => 'حفظ';

  @override
  String get edit => 'تعديل';

  @override
  String get close => 'إغلاق';

  @override
  String get confirm => 'تأكيد';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'الطلبات المعلقة';

  @override
  String get noPendingRequests => 'لا توجد طلبات معلقة';

  @override
  String get pendingRequestsSubtitle => 'هؤلاء الأشخاص يريدون إضافتك';

  @override
  String requestFromUser(String hashId) {
    return 'طلب من $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'ينتهي خلال $days أيام';
  }

  @override
  String get acceptRequest => 'قبول';

  @override
  String get rejectRequest => 'رفض';

  @override
  String get requestAccepted => 'تم قبول الطلب';

  @override
  String get requestRejected => 'تم رفض الطلب';

  @override
  String get requestSent => 'تم إرسال الطلب!';

  @override
  String get requestSentSubtitle =>
      'تم إرسال طلبك. يجب على المستخدم قبوله قبل أن تتمكن من الدردشة.';

  @override
  String get requestAlreadyPending => 'هناك طلب معلق بالفعل';

  @override
  String get requestAlreadySentByOther => 'هذا الشخص أرسل لك طلباً بالفعل';

  @override
  String get addByHashId => 'إضافة عبر Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'أدخل معرّف Hash والرمز المؤقت لجهة الاتصال';

  @override
  String get enterTemporaryCode => 'أدخل الرمز المكون من 6 أرقام';

  @override
  String get sendRequest => 'إرسال الطلب';

  @override
  String get acceptContactTitle => 'قبول جهة الاتصال';

  @override
  String get acceptContactSubtitle => 'يمكنك إعطاؤه اسماً مخصصاً';

  @override
  String get leaveEmptyForHashId => 'اتركه فارغاً لاستخدام Hash ID';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'الاسم الأخير';

  @override
  String get notes => 'الملاحظات';

  @override
  String get notesHint => 'ملاحظات شخصية عن جهة الاتصال هذه';

  @override
  String get photoOptional => 'صورة (اختياري)';

  @override
  String get contactNameOptional => 'الاسم (اختياري)';

  @override
  String get notesOptional => 'ملاحظات (اختياري)';

  @override
  String get storedLocally => 'مخزن على جهازك فقط';

  @override
  String get encryptedMessageLabel => 'رسالة مشفرة';

  @override
  String get identityMessageHint => 'من أنت؟ كيف تعرفون بعضكم؟';

  @override
  String get messageWillBeSentEncrypted =>
      'سيتم تشفير هذه الرسالة وإرسالها إلى المستلم';

  @override
  String get sendRequestButton => 'إرسال الطلب';

  @override
  String get requestExpiresIn24h => 'ينتهي الطلب خلال 24 ساعة إذا لم يُقبل';

  @override
  String get theyAlreadySentYouRequest => 'هذا الشخص أرسل لك طلباً بالفعل';

  @override
  String get requests => 'الطلبات';

  @override
  String get receivedRequests => 'المستلمة';

  @override
  String get sentRequests => 'المرسلة';

  @override
  String get noSentRequests => 'لا توجد طلبات مرسلة';

  @override
  String get cancelRequest => 'إلغاء';

  @override
  String get deleteRequest => 'حذف الطلب';

  @override
  String get requestCancelled => 'تم إلغاء الطلب';

  @override
  String sentTo(String hashId) {
    return 'أُرسل إلى $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'ينتهي خلال $time';
  }

  @override
  String receivedAgo(String time) {
    return 'تم الاستلام منذ $time';
  }

  @override
  String get messageFromRequester => 'رسالة من مقدم الطلب';

  @override
  String get copy => 'نسخ';

  @override
  String get messageInfo => 'معلومات الرسالة';

  @override
  String get messageDirection => 'الاتجاه';

  @override
  String get messageSentByYou => 'أرسلتها أنت';

  @override
  String get messageReceived => 'مستلمة';

  @override
  String get messageSentAt => 'أُرسلت في';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'الحالة';

  @override
  String get messageReadAt => 'قُرئت في';

  @override
  String get messageType => 'النوع';

  @override
  String get messageSize => 'الحجم';

  @override
  String get messageExpiresAt => 'تنتهي في';

  @override
  String get messageEncrypted => 'مشفرة من طرف إلى طرف';

  @override
  String get messageStatusSending => 'جارٍ الإرسال...';

  @override
  String get messageStatusSent => 'مُرسلة';

  @override
  String get messageStatusDelivered => 'تم التسليم';

  @override
  String get messageStatusRead => 'مقروءة';

  @override
  String get messageStatusFailed => 'فشلت';

  @override
  String get serverStatus => 'الخادم';

  @override
  String get onServer => 'في انتظار التسليم';

  @override
  String get deletedFromServer => 'محذوفة';

  @override
  String get messageTypeText => 'نص';

  @override
  String get messageTypeImage => 'صورة';

  @override
  String get messageTypeVideo => 'فيديو';

  @override
  String get messageTypeVoice => 'صوت';

  @override
  String get messageTypeFile => 'ملف';

  @override
  String get indefinitely => 'إلى أجل غير مسمى';

  @override
  String get hoursShort => 'س';

  @override
  String get minutesShort => 'د';

  @override
  String get hours => 'ساعات';

  @override
  String get minutes => 'دقائق';

  @override
  String get seconds => 'ثوانٍ';

  @override
  String get ephemeralMessages => 'الرسائل المؤقتة';

  @override
  String get ephemeralMessagesDescription =>
      'تُحذف الرسائل تلقائياً بعد هذه المدة';

  @override
  String get ephemeralImmediate => 'فوري (بعد القراءة)';

  @override
  String get ephemeralImmediateDesc => 'تُحذف فور قراءتها';

  @override
  String get ephemeralMyPreference => 'تفضيلي';

  @override
  String get ephemeralMyPreferenceDesc => 'استخدام الإعداد العام';

  @override
  String get ephemeralDefaultSetting => 'مدة الرسائل';

  @override
  String get ephemeralChooseDefault => 'موصى به';

  @override
  String get ephemeral30Seconds => '30 ثانية';

  @override
  String get ephemeral30SecondsDesc => 'يُحذف بعد 30 ثانية من القراءة';

  @override
  String get ephemeral5Minutes => '5 دقائق';

  @override
  String get ephemeral5MinutesDesc => 'يُحذف بعد 5 دقائق من القراءة';

  @override
  String get ephemeral1Hour => 'ساعة واحدة';

  @override
  String get ephemeral1HourDesc => 'يُحذف بعد ساعة من القراءة';

  @override
  String get ephemeral3Hours => '3 ساعات';

  @override
  String get ephemeral6Hours => '6 ساعات';

  @override
  String get ephemeral6HoursDesc => 'يُحذف بعد 6 ساعات من القراءة';

  @override
  String get ephemeral12Hours => '12 ساعة';

  @override
  String get ephemeral24Hours => '24 ساعة';

  @override
  String get ephemeral24HoursDesc => 'يُحذف بعد 24 ساعة من القراءة';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'مدة مخصصة';

  @override
  String get howItWorks => 'كيف يعمل';

  @override
  String get ephemeralExplanation1 => 'تُحذف الرسائل من الخادم فور استلامها.';

  @override
  String get ephemeralExplanation2 =>
      'يحدد هذا الإعداد متى تختفي الرسائل من هاتفك بعد قراءتها.';

  @override
  String get ephemeralExplanation3 => 'لدى جهة اتصالك إعداد خاص بهاتفها.';

  @override
  String get mute1Hour => 'ساعة واحدة';

  @override
  String get mute8Hours => '8 ساعات';

  @override
  String get mute1Day => 'يوم واحد';

  @override
  String get mute1Week => 'أسبوع واحد';

  @override
  String get muteAlways => 'دائماً';

  @override
  String get muteExplanation => 'لن تتلقى إشعارات لجهة الاتصال هذه';

  @override
  String get showCallsInRecents => 'عرض في المكالمات الأخيرة';

  @override
  String get showCallsInRecentsSubtitle => 'تظهر مكالمات Hash في سجل الهاتف';

  @override
  String get feedback => 'ملاحظات';

  @override
  String get muteNotifications => 'كتم الإشعارات';

  @override
  String get muteDescription => 'لن تتلقى إشعارات لجهة الاتصال هذه';

  @override
  String mutedUntil(String time) {
    return 'مكتوم حتى $time';
  }

  @override
  String get notMuted => 'الإشعارات مفعلة';

  @override
  String get unmute => 'إلغاء الكتم';

  @override
  String get notificationSound => 'صوت الإشعار';

  @override
  String get defaultSound => 'افتراضي';

  @override
  String get chatSettings => 'إعدادات الدردشة';

  @override
  String get bubbleColor => 'لون الفقاعات';

  @override
  String get backgroundColor => 'لون الخلفية';

  @override
  String get backgroundImage => 'صورة الخلفية';

  @override
  String get chatBackground => 'خلفية الدردشة';

  @override
  String get customColor => 'مخصص';

  @override
  String get defaultColor => 'افتراضي';

  @override
  String get imageSelected => 'تم اختيار الصورة';

  @override
  String get noImage => 'بدون صورة';

  @override
  String get color => 'اللون';

  @override
  String get image => 'صورة';

  @override
  String get tapToSelectImage => 'انقر لاختيار صورة';

  @override
  String get changeImage => 'تغيير الصورة';

  @override
  String get previewMessageReceived => 'مرحباً!';

  @override
  String get previewMessageSent => 'أهلاً!';

  @override
  String get messageAction => 'رسالة';

  @override
  String get callAction => 'مكالمة';

  @override
  String get videoAction => 'فيديو';

  @override
  String get personalNotes => 'ملاحظات شخصية';

  @override
  String get addNotes => 'إضافة ملاحظات...';

  @override
  String get noNotes => 'لا توجد ملاحظات';

  @override
  String get messageNotifications => 'إشعارات الرسائل';

  @override
  String get callNotifications => 'إشعارات المكالمات';

  @override
  String get useGradient => 'استخدام تدرج';

  @override
  String get gradientStart => 'لون البداية';

  @override
  String get gradientEnd => 'لون النهاية';

  @override
  String get preview => 'معاينة';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get securityNumber => 'رقم الأمان';

  @override
  String securityNumberDescription(String name) {
    return 'تحقق من أن رقم الأمان يتطابق مع جهاز $name';
  }

  @override
  String get verifyEncryption => 'التحقق من التشفير من طرف إلى طرف';

  @override
  String get tapToCopy => 'انقر للنسخ';

  @override
  String get howToVerify => 'كيفية التحقق';

  @override
  String get verifyStep1 => 'قابل جهة اتصالك شخصياً أو اتصل بها';

  @override
  String get verifyStep2 => 'قارن أرقام الأمان أو امسح رموز QR';

  @override
  String get verifyStep3 => 'إذا تطابقت، فدردشتك آمنة';

  @override
  String get scanToVerify => 'امسح للتحقق';

  @override
  String get reportSpam => 'الإبلاغ عن رسائل غير مرغوبة';

  @override
  String get reportSpamSubtitle =>
      'الإبلاغ عن جهة الاتصال هذه كرسائل غير مرغوبة';

  @override
  String get reportSpamDescription =>
      'سيتم الإبلاغ عن جهة الاتصال هذه بشكل مجهول. لن تتم مشاركة هويتك. هل أنت متأكد؟';

  @override
  String get report => 'إبلاغ';

  @override
  String get spamReported => 'تم الإبلاغ عن الرسائل غير المرغوبة';

  @override
  String get reportError => 'فشل إرسال البلاغ. يرجى المحاولة مرة أخرى.';

  @override
  String get reportRateLimited =>
      'لقد وصلت إلى الحد الأقصى من البلاغات لهذا اليوم.';

  @override
  String get blockContact => 'حظر جهة الاتصال';

  @override
  String get blockContactDescription =>
      'لن تتمكن جهة الاتصال هذه من إرسال رسائل إليك أو الاتصال بك. لن يتم إخطارها.';

  @override
  String get unblockContact => 'إلغاء حظر جهة الاتصال';

  @override
  String get unblockContactDescription =>
      'ستتمكن جهة الاتصال هذه من إرسال رسائل إليك والاتصال بك مرة أخرى.';

  @override
  String get contactBlocked => 'تم حظر جهة الاتصال';

  @override
  String get contactUnblocked => 'تم إلغاء حظر جهة الاتصال';

  @override
  String get contactIsBlocked => 'جهة الاتصال هذه محظورة';

  @override
  String get unblock => 'إلغاء الحظر';

  @override
  String get deleteContactSubtitle => 'حذف جهة الاتصال هذه والدردشة';

  @override
  String get confirmWithPin => 'تأكيد بالـ PIN';

  @override
  String get enterPinToConfirm => 'أدخل رمز PIN لتأكيد هذا الإجراء';

  @override
  String get profilePhoto => 'صورة الملف الشخصي';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get chooseFromGallery => 'اختيار من المعرض';

  @override
  String get removePhoto => 'إزالة الصورة';

  @override
  String get viewContactHashId => 'عرض معرّف جهة الاتصال';

  @override
  String get hashIdPartiallyMasked => 'مخفي جزئياً لأمانك وخصوصية جهة اتصالك';

  @override
  String get addFirstContact => 'أضف أول جهة اتصال';

  @override
  String get addFirstContactSubtitle => 'شارك رمز QR الخاص بك أو امسح رمز صديق';

  @override
  String get directory => 'الدليل';

  @override
  String get noContacts => 'لا توجد جهات اتصال';

  @override
  String get noContactsSubtitle => 'أضف جهة اتصال للبدء';

  @override
  String get sendMessageAction => 'إرسال رسالة';

  @override
  String get audioCall => 'مكالمة صوتية';

  @override
  String get videoCall => 'مكالمة فيديو';

  @override
  String get viewProfile => 'عرض الملف الشخصي';

  @override
  String get deleteContactDirectory => 'حذف جهة الاتصال';

  @override
  String get scanShort => 'مسح';

  @override
  String get addShort => 'إضافة';

  @override
  String deleteContactConfirmName(String name) {
    return 'هل تريد حقًا حذف $name؟';
  }

  @override
  String get noNotesTitle => 'لا توجد ملاحظات';

  @override
  String get noNotesSubtitle => 'أنشئ ملاحظتك الأولى';

  @override
  String get newNote => 'ملاحظة جديدة';

  @override
  String get editNote => 'تعديل الملاحظة';

  @override
  String get deleteNote => 'حذف الملاحظة';

  @override
  String get deleteNoteConfirm => 'هل تريد حقًا حذف هذه الملاحظة؟';

  @override
  String get noteTitle => 'العنوان';

  @override
  String get noteContent => 'المحتوى';

  @override
  String get addItem => 'إضافة عنصر';

  @override
  String get pinNote => 'تثبيت';

  @override
  String get unpinNote => 'إلغاء التثبيت';

  @override
  String get noteColor => 'اللون';

  @override
  String get notePassword => 'كلمة المرور';

  @override
  String get setPassword => 'تعيين كلمة مرور';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get removePassword => 'إزالة كلمة المرور';

  @override
  String get enterPassword => 'أدخل كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get passwordPin => 'رمز PIN';

  @override
  String get passwordText => 'كلمة مرور نصية';

  @override
  String get protectedNote => 'ملاحظة محمية';

  @override
  String get incorrectPassword => 'كلمة مرور غير صحيحة';

  @override
  String get passwordSet => 'تم تعيين كلمة المرور';

  @override
  String get passwordRemoved => 'تمت إزالة كلمة المرور';

  @override
  String get notesBiometric => 'Face ID للملاحظات';

  @override
  String get notesBiometricSubtitle =>
      'طلب المصادقة البيومترية لفتح الملاحظات المحمية';

  @override
  String get textNote => 'ملاحظة نصية';

  @override
  String get checklistNote => 'قائمة مهام';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total مهام';
  }

  @override
  String get autoSaved => 'تم الحفظ';

  @override
  String get searchNotes => 'البحث عن ملاحظة';

  @override
  String get legalConsent => 'الموافقة القانونية';

  @override
  String get confirmAge13 => 'أؤكد أنني أبلغ من العمر 13 عاماً على الأقل';

  @override
  String get acceptLegalStart => 'أقبل ';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get andThe => ' و';

  @override
  String get continueButton => 'متابعة';

  @override
  String get mustAcceptTerms => 'يجب قبول الشرطين للمتابعة';

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
  String get support => 'الدعم';

  @override
  String get contactSupport => 'الاتصال بالدعم';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'الإبلاغ عن إساءة';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'قانوني';

  @override
  String get legalEntity => 'الكيان القانوني';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'تثبيت';

  @override
  String get unpinConversation => 'إلغاء التثبيت';

  @override
  String get hideConversation => 'إزالة من المحادثات';

  @override
  String get deleteConversation => 'حذف المحادثة';

  @override
  String get deleteConversationConfirm =>
      'أدخل رمز PIN لتأكيد حذف جميع الرسائل';

  @override
  String get noConversations => 'لا توجد محادثات بعد';

  @override
  String get startConversation => 'ابدأ';

  @override
  String get microphonePermissionRequired => 'مطلوب الوصول إلى الميكروفون';

  @override
  String get microphonePermissionExplanation =>
      'يحتاج Hash إلى الميكروفون لإجراء المكالمات.';

  @override
  String get cameraPermissionExplanation =>
      'يحتاج Hash إلى الكاميرا لمكالمات الفيديو.';

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
  String get openSettings => 'فتح الإعدادات';

  @override
  String get callConnecting => 'جارٍ الاتصال...';

  @override
  String get callRinging => 'جارٍ الرنين...';

  @override
  String get callReconnecting => 'إعادة الاتصال...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'إعادة الاتصال ($secondsث)';
  }

  @override
  String get callPaused => 'متوقف مؤقتاً';

  @override
  String get callPausedSubtitle => 'المكالمة لا تزال نشطة';

  @override
  String get callRemoteMicMuted => 'ميكروفون جهة الاتصال مكتوم';

  @override
  String get callMiniControlsMute => 'كتم الصوت';

  @override
  String get callMiniControlsUnmute => 'إلغاء كتم الصوت';

  @override
  String get callMiniControlsHangUp => 'إنهاء المكالمة';

  @override
  String get callMiniControlsReturn => 'العودة إلى المكالمة';

  @override
  String get callNetworkPoor => 'اتصال غير مستقر';

  @override
  String get callNetworkLost => 'فُقد الاتصال';

  @override
  String get callEndedTitle => 'انتهت المكالمة';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'بيانات الجهاز';

  @override
  String get deviceDataSubtitle => 'التخزين المحلي والخادم';

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
  String get localStorage => 'التخزين المحلي';

  @override
  String get onThisDevice => 'على هذا الجهاز';

  @override
  String get encryptedDatabases => 'قواعد بيانات مشفرة';

  @override
  String get files => 'الملفات';

  @override
  String get secureKeychain => 'سلسلة المفاتيح الآمنة';

  @override
  String get cache => 'ذاكرة التخزين المؤقت';

  @override
  String get contactsDetail => 'الأسماء والصور ومفاتيح Signal';

  @override
  String get messagesDetail => 'المحادثات المشفرة';

  @override
  String get notesDetail => 'الملاحظات الشخصية';

  @override
  String get signalSessions => 'جلسات Signal';

  @override
  String get signalSessionsDetail => 'جلسات التشفير';

  @override
  String get pendingContacts => 'جهات اتصال معلقة';

  @override
  String get pendingContactsDetail => 'طلبات قيد الانتظار';

  @override
  String get callHistory => 'المكالمات';

  @override
  String get callHistoryDetail => 'سجل المكالمات';

  @override
  String get preferences => 'التفضيلات';

  @override
  String get preferencesDetail => 'تفضيلات الوسائط والمكالمات';

  @override
  String get avatars => 'الصور الرمزية';

  @override
  String get media => 'الوسائط';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملفات',
      one: 'ملف واحد',
      zero: 'لا ملفات',
    );
    return '$_temp0';
  }

  @override
  String get active => 'نشط';

  @override
  String get notDefined => 'غير محدد';

  @override
  String get biometrics => 'المقاييس الحيوية';

  @override
  String get recoveryPhrase => 'عبارة الاسترداد';

  @override
  String get identity => 'الهوية (Hash ID)';

  @override
  String get signalKeys => 'مفاتيح Signal Protocol';

  @override
  String get authTokens => 'رموز المصادقة';

  @override
  String get contactNamesCache => 'ذاكرة أسماء جهات الاتصال';

  @override
  String get remoteConfig => 'التكوين عن بُعد';

  @override
  String get notificationPrefs => 'تفضيلات الإشعارات';

  @override
  String get serverData => 'بيانات على الخادم';

  @override
  String get serverDataInfo =>
      'يحتفظ Hash بالحد الأدنى من البيانات على الخادم، جميعها مشفرة أو مؤقتة.';

  @override
  String get serverProfile => 'الملف الشخصي';

  @override
  String get serverProfileDetail =>
      'Hash ID، المفاتيح العامة، رمز صندوق البريد';

  @override
  String get serverPrekeys => 'مفاتيح مسبقة';

  @override
  String get serverPrekeysDetail => 'مفاتيح Signal للاستخدام الواحد (مستهلكة)';

  @override
  String get serverMessages => 'رسائل في الطريق';

  @override
  String get serverMessagesDetail => 'تُحذف بعد الاستلام (24 ساعة كحد أقصى)';

  @override
  String get serverMedia => 'وسائط في الطريق';

  @override
  String get serverMediaDetail => 'تُحذف بعد التنزيل';

  @override
  String get serverContactRequests => 'طلبات الاتصال';

  @override
  String get serverContactRequestsDetail => 'تنتهي بعد 24 ساعة';

  @override
  String get serverRateLimits => 'حدود المعدل';

  @override
  String get serverRateLimitsDetail => 'بيانات مؤقتة لمنع إساءة الاستخدام';

  @override
  String get privacyReassurance =>
      'لا يمكن لـ Hash قراءة رسائلك. جميع البيانات مشفرة من طرف إلى طرف. تُحذف بيانات الخادم تلقائيًا.';

  @override
  String get pinTooSimple => 'رمز PIN هذا بسيط جداً. اختر رمزاً أكثر أماناً.';

  @override
  String get genericError => 'حدث خطأ. يرجى المحاولة مرة أخرى.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'تعذر إنشاء الحساب: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'تم نسخ العبارة إلى الحافظة';

  @override
  String get copyPhrase => 'نسخ العبارة';

  @override
  String get recoveryPhraseSecurityWarning =>
      'اكتب هذه العبارة في مكان آمن. إذا فقدت رمز PIN بدون هذه العبارة، ستفقد الوصول إلى بياناتك نهائياً.';

  @override
  String get noMessages => 'لا توجد رسائل';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'حذف جميع الرسائل مع $name؟';
  }

  @override
  String get confirmation => 'تأكيد';

  @override
  String get untitled => 'بدون عنوان';

  @override
  String get noSessions => 'لا توجد جلسات';

  @override
  String get unknownContact => 'جهة اتصال غير معروفة';

  @override
  String get unnamed => 'بدون اسم';

  @override
  String get noPendingRequestsAlt => 'لا توجد طلبات معلقة';

  @override
  String get deleteAllCallHistory => 'حذف سجل المكالمات بالكامل؟';

  @override
  String get noCalls => 'لا توجد مكالمات';

  @override
  String get noPreferences => 'لا توجد تفضيلات';

  @override
  String get resetAllMediaPrefs => 'إعادة تعيين جميع تفضيلات الوسائط؟';

  @override
  String get deleteThisAvatar => 'حذف هذه الصورة الرمزية؟';

  @override
  String get deleteAllAvatars => 'حذف جميع الصور الرمزية؟';

  @override
  String get noAvatars => 'لا توجد صور رمزية';

  @override
  String get deleteThisFile => 'حذف هذا الملف؟';

  @override
  String get deleteAllMediaFiles => 'حذف جميع الوسائط؟';

  @override
  String get noMediaFiles => 'لا توجد وسائط';

  @override
  String get outgoing => 'صادر';

  @override
  String get incoming => 'وارد';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'عرض مؤقت: $secondsث';
  }

  @override
  String get normalView => 'عرض عادي';

  @override
  String get callReasonCompleted => 'مكتمل';

  @override
  String get callReasonMissed => 'فائت';

  @override
  String get callReasonDeclined => 'مرفوض';

  @override
  String get callReasonFailed => 'فشل';

  @override
  String get justNow => 'الآن';

  @override
  String timeAgoMinutes(int count) {
    return 'منذ $count دقيقة';
  }

  @override
  String timeAgoHours(int count) {
    return 'منذ $count ساعة';
  }

  @override
  String timeAgoDays(int count) {
    return 'منذ $count يوم';
  }

  @override
  String get messageTypeContact => 'جهة اتصال';

  @override
  String get messageTypeLocation => 'موقع';

  @override
  String get statusQueued => 'في قائمة الانتظار';

  @override
  String get blockedBadge => 'محظور';

  @override
  String get protectedBadge => 'محمي';

  @override
  String messageCount(int count) {
    return '$count رسالة(رسائل)';
  }

  @override
  String get deleteQuestion => 'حذف؟';

  @override
  String get transferMyAccountTitle => 'نقل حسابي';

  @override
  String get loadingError => 'خطأ في التحميل';

  @override
  String get transferToNewDevice => 'النقل إلى جهاز جديد';

  @override
  String get transferInstructions =>
      'على جهازك الجديد، اختر \"استرداد حسابي\" وأدخل هذه المعلومات:';

  @override
  String get yourHashIdLabel => 'معرّف Hash الخاص بك';

  @override
  String get enterYourPinCode => 'أدخل رمز PIN الخاص بك';

  @override
  String get pinOwnerConfirmation => 'لتأكيد أنك مالك هذا الحساب';

  @override
  String get scanThisQrCode => 'امسح رمز QR هذا';

  @override
  String get withYourNewDevice => 'بجهازك الجديد';

  @override
  String get orEnterTheCode => 'أو أدخل الرمز';

  @override
  String get transferCodeLabel => 'رمز النقل';

  @override
  String get proximityVerification => 'التحقق من القرب';

  @override
  String get bringDevicesCloser => 'قرّب الجهازين من بعضهما';

  @override
  String get confirmTransferQuestion => 'تأكيد النقل؟';

  @override
  String get accountWillBeTransferred =>
      'سيتم نقل حسابك إلى الجهاز الجديد.\n\nسيتم فصل هذا الجهاز نهائياً.';

  @override
  String get transferComplete => 'اكتمل النقل';

  @override
  String get transferSuccessMessage =>
      'تم نقل حسابك بنجاح.\n\nسيتم إغلاق هذا التطبيق الآن.';

  @override
  String get manualVerification => 'التحقق اليدوي';

  @override
  String get codeDisplayedOnBothDevices => 'الرمز المعروض على كلا الجهازين:';

  @override
  String get doesCodeMatchNewDevice =>
      'هل يتطابق هذا الرمز مع الرمز على الجهاز الجديد؟';

  @override
  String get verifiedStatus => 'تم التحقق';

  @override
  String get inProgressStatus => 'جارٍ...';

  @override
  String get notAvailableStatus => 'غير متوفر';

  @override
  String get codeExpiredRestart => 'انتهت صلاحية الرمز. يرجى البدء من جديد.';

  @override
  String get codesDoNotMatchCancelled => 'الرموز غير متطابقة. تم إلغاء النقل.';

  @override
  String transferToDevice(String device) {
    return 'إلى: $device';
  }

  @override
  String get copiedExclamation => 'تم النسخ!';

  @override
  String expiresInTime(String time) {
    return 'ينتهي خلال $time';
  }

  @override
  String get biometricNotAvailable =>
      'المقاييس الحيوية غير متوفرة على هذا الجهاز';

  @override
  String get biometricAuthError => 'خطأ أثناء المصادقة البيومترية';

  @override
  String get authenticateForBiometric =>
      'يرجى المصادقة لتفعيل المقاييس الحيوية';

  @override
  String get biometricAuthFailed => 'فشلت المصادقة البيومترية';

  @override
  String get forceUpdateTitle => 'تحديث مطلوب';

  @override
  String get forceUpdateMessage =>
      'إصدار جديد من Hash متوفر. يرجى التحديث للمتابعة.';

  @override
  String get updateButton => 'تحديث';

  @override
  String get maintenanceInProgress => 'الصيانة جارية';

  @override
  String get tryAgainLater => 'يرجى المحاولة مرة أخرى لاحقاً';

  @override
  String get information => 'معلومات';

  @override
  String get later => 'لاحقاً';

  @override
  String get doYouLikeHash => 'هل يعجبك Hash؟';

  @override
  String get yourFeedbackHelps => 'ملاحظاتك تساعدنا على تحسين التطبيق';

  @override
  String get ratingTerrible => 'سيء جداً';

  @override
  String get ratingBad => 'سيء';

  @override
  String get ratingOk => 'مقبول';

  @override
  String get ratingGood => 'جيد';

  @override
  String get ratingExcellent => 'ممتاز!';

  @override
  String get donationMessage =>
      'Hash مشروع غير ربحي. دعمك يساعدنا في الاستمرار في بناء تطبيق مراسلة خاص حقاً.';

  @override
  String get recentConnections => 'الاتصالات الأخيرة';

  @override
  String get loginInfoText =>
      'يتم تسجيل كل فتح بالـ PIN محلياً. يتم الاحتفاظ بآخر 24 ساعة فقط.';

  @override
  String get connectionCount => 'اتصال(ات)';

  @override
  String get periodLabel => 'الفترة';

  @override
  String get historyLabel => 'السجل';

  @override
  String get noLoginRecorded => 'لم يتم تسجيل أي دخول';

  @override
  String get nextUnlocksAppearHere => 'ستظهر عمليات الفتح القادمة هنا.';

  @override
  String get dataLocalOnly =>
      'هذه البيانات مخزنة فقط على جهازك ولا يتم إرسالها أبداً.';

  @override
  String get currentSession => 'الحالية';

  @override
  String get todayLabel => 'اليوم';

  @override
  String get yesterdayLabel => 'أمس';

  @override
  String get justNowLabel => 'الآن';

  @override
  String minutesAgoLabel(int count) {
    return 'منذ $count دقيقة';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'منذ $hours ساعة';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'منذ $hours ساعة و$minutes دقيقة';
  }

  @override
  String get noMaintenancePlanned => 'لا توجد صيانة مخططة';

  @override
  String get everythingWorkingNormally => 'كل شيء يعمل بشكل طبيعي';

  @override
  String get maintenanceTitle => 'الصيانة';

  @override
  String get maintenanceActiveLabel => 'جارية';

  @override
  String get maintenancePlannedLabel => 'مخططة';

  @override
  String get locking => 'جارٍ القفل...';

  @override
  String get newMessageNotification => 'رسالة جديدة';

  @override
  String get secExplainTitle => 'كيف يحميك Hash';

  @override
  String get secExplainIntro => 'صُمم Hash بحيث لا يستطيع أحد قراءة رسائلك.';

  @override
  String get secExplainIntroSub =>
      'حتى نحن لا نستطيع.\nإليك كيف يعمل الأمر، بشرح بسيط.';

  @override
  String get secJourneyLabel => 'الرحلة';

  @override
  String get secJourneyTitle => 'رحلة رسالتك';

  @override
  String get secJourneySubtitle =>
      'من إصبعك إلى شاشة جهة اتصالك، كل خطوة محمية. تابع المسار.';

  @override
  String get secStep1Title => 'تكتب رسالتك';

  @override
  String get secStep1Desc =>
      'تكتب \"مرحباً!\" في التطبيق. في هذه اللحظة، الرسالة موجودة فقط في ذاكرة هاتفك. لم يتم إرسال أي شيء.';

  @override
  String get secStep2Title => 'التشفير ببروتوكول Signal';

  @override
  String get secStep2Desc =>
      'بمجرد الضغط على \"إرسال\"، تتحول رسالتك إلى سلسلة من الأحرف غير المفهومة. كأن رسالتك أُقفلت في خزنة لا يملك مفتاحها إلا جهة اتصالك.';

  @override
  String get secStep3Title => 'Sealed Sender: المظروف الخفي';

  @override
  String get secStep3Desc =>
      'تخيل أنك ترسل رسالة بالبريد، لكن بدون عنوان مرسل على المظروف. هذا بالضبط ما يفعله Hash. تُوضع الرسالة في صندوق بريد مجهول. الخادم لا يعرف من أرسلها.';

  @override
  String get secStep4Title => 'الخادم لا يرى شيئاً';

  @override
  String get secStep4Desc =>
      'يعمل الخادم كساعي بريد أعمى. يعرف فقط أن \"شخصاً ما وضع شيئاً في الصندوق #A7X9\". لا يعرف من أرسله، ولا ما هو، ولا لمن.';

  @override
  String get secStep4Highlight =>
      'لا يتم تخزين أي بيانات وصفية: لا عنوان IP، لا طابع زمني، لا رابط بين المرسل والمستلم.';

  @override
  String get secStep5Title => 'جهة اتصالك تستلم الرسالة';

  @override
  String get secStep5Desc =>
      'يسترجع هاتف جهة اتصالك المحتوى من صندوق البريد المجهول ويفك تشفير الرسالة بمفتاحه الخاص، الذي لم يغادر جهازه أبداً. تظهر \"مرحباً!\" على شاشته.';

  @override
  String get secStep6Title => 'الرسالة تختفي من الخادم';

  @override
  String get secStep6Desc =>
      'بمجرد تأكيد جهة اتصالك للاستلام، يحذف الخادم الرسالة نهائياً. لا سلة محذوفات، لا أرشيف، لا نسخ احتياطية. حتى الرسائل غير المقروءة تُدمر تلقائياً بعد 24 ساعة.';

  @override
  String get secStep7Title => 'انتهاء الصلاحية المحلي';

  @override
  String get secStep7Desc =>
      'على هاتف جهة اتصالك، تتدمر الرسالة ذاتياً حسب المدة التي اخترتها: فوراً بعد القراءة، 5 دقائق، ساعة واحدة... أنت تقرر.';

  @override
  String get secJourneyConclusion =>
      'النتيجة: صفر أثر على الخادم، صفر أثر على الأجهزة. الرسالة وُجدت فقط بما يكفي لقراءتها، ثم اختفت.';

  @override
  String get secArchLabel => 'البنية';

  @override
  String get secArchTitle => '5 طبقات حماية';

  @override
  String get secArchSubtitle =>
      'لا يعتمد Hash على تقنية واحدة. كل طبقة تعزز الأخرى. حتى لو تم اختراق طبقة واحدة، تبقى بياناتك آمنة.';

  @override
  String get secLayer1Title => 'التشفير من طرف إلى طرف';

  @override
  String get secLayer1Desc =>
      'كل رسالة مشفرة بمفتاح فريد. ببساطة: حتى لو فك شخص تشفير رسالة واحدة، لن يتمكن من فك تشفير التالية. كل رسالة لها قفلها الخاص.';

  @override
  String get secLayer1Detail =>
      'للملفات (الصور والفيديوهات والمستندات)، يستخدم Hash تشفير AES-256-GCM إضافي. يتم تشفير الملف قبل مغادرة هاتفك.';

  @override
  String get secLayer2Title => 'Sealed Sender (إخفاء هوية الشبكة)';

  @override
  String get secLayer2Desc =>
      'تطبيقات المراسلة العادية ترسل رسائلك مع هويتك مرفقة. كأنك تكتب اسمك على المظروف. يستخدم Hash صناديق بريد مجهولة: الخادم يسلم الرسالة دون معرفة من أرسلها.';

  @override
  String get secLayer2Detail =>
      'النتيجة: حتى في حالة اختراق بيانات الخادم، يستحيل إعادة بناء من يتحدث مع من.';

  @override
  String get secLayer3Title => 'الحذف التلقائي';

  @override
  String get secLayer3Desc =>
      'تُحذف الرسائل من الخادم فور تأكيد الاستلام. حتى لو لم يتم استلام رسالة أبداً، تُدمر تلقائياً بعد 24 ساعة.';

  @override
  String get secLayer3Detail =>
      'على هاتفك، تتدمر الرسائل ذاتياً حسب المدة التي تختارها: فوراً، 5 دقائق، 15 دقيقة، 30 دقيقة، ساعة، 3 ساعات، 6 ساعات أو 12 ساعة.';

  @override
  String get secLayer4Title => 'حماية الوصول المحلي';

  @override
  String get secLayer4Desc =>
      'التطبيق محمي برمز PIN من 6 أرقام و/أو البصمة (Face ID، بصمة الإصبع). بعد محاولات فاشلة كثيرة، يُقفل التطبيق مع تأخير متزايد بعد كل فشل.';

  @override
  String get secLayer5Title => 'قاعدة بيانات مقفلة';

  @override
  String get secLayer5Desc =>
      'من جانب الخادم، لا يمكن لأي مستخدم الكتابة مباشرة في قاعدة البيانات. جميع الإجراءات تمر عبر وظائف آمنة تتحقق من كل طلب.';

  @override
  String get secLayer5Detail =>
      'كأنه شباك بنك: لا تلمس الخزنة بنفسك أبداً. تقدم طلباً، والنظام يتحقق من أن لديك الحق قبل التنفيذ.';

  @override
  String get secVashLabel => 'فريد في العالم';

  @override
  String get secVashTitle => 'وضع Vash';

  @override
  String get secVashSubtitle =>
      'نظام أمان طوارئ لا يوجد في أي تطبيق مراسلة آخر.';

  @override
  String get secVashScenarioTitle => 'تخيل هذا الموقف';

  @override
  String get secVashScenario1 => 'شخص ما يصل إلى هاتفك';

  @override
  String get secVashScenario2 => 'يُطلب منك رمز PIN';

  @override
  String get secVashScenario3 => 'تريد مسح جميع بياناتك بشكل عاجل';

  @override
  String get secVashSolutionTitle => 'الحل: رمزا PIN';

  @override
  String get secVashSolutionDesc => 'تُعدّ رمزي PIN مختلفين في Hash:';

  @override
  String get secVashNormalCodeLabel => 'الرمز العادي';

  @override
  String get secVashNormalCodeDesc => 'يفتح التطبيق بشكل عادي مع جميع بياناتك';

  @override
  String get secVashCodeLabel2 => 'رمز Vash';

  @override
  String get secVashCodeDescription =>
      'يفتح التطبيق بشكل عادي... لكن جميع بياناتك تُحذف بصمت في الخلفية';

  @override
  String get secVashWhatHappensTitle => 'ماذا يحدث بعد ذلك';

  @override
  String get secVashWhatHappensDesc =>
      'يفتح التطبيق بشكل عادي. لا تنبيه، لا حركة مشبوهة. الشاشة تعرض ببساطة تطبيقاً فارغاً، كأنك ثبته للتو.\n\nفي الواقع، جميع محادثاتك وجهات اتصالك ورسائلك حُذفت بشكل لا رجعة فيه في جزء من الثانية.';

  @override
  String get secCallsLabel => 'المكالمات والملفات';

  @override
  String get secCallsTitle => 'كل شيء مشفر';

  @override
  String get secCallsSubtitle =>
      'ليست الرسائل فقط. كل شيء يمر عبر Hash مشفر من طرف إلى طرف.';

  @override
  String get secAudioCallTitle => 'المكالمات الصوتية';

  @override
  String get secAudioCallDesc =>
      'مشفرة من طرف إلى طرف عبر WebRTC. الصوت ينتقل مباشرة بين الأجهزة.';

  @override
  String get secVideoCallTitle => 'مكالمات الفيديو';

  @override
  String get secVideoCallDesc => 'نفس التقنية، كل تدفق مشفر بشكل فردي.';

  @override
  String get secPhotosTitle => 'الصور والفيديوهات';

  @override
  String get secPhotosDesc => 'مشفرة بـ AES-256-GCM قبل مغادرة هاتفك.';

  @override
  String get secDocsTitle => 'المستندات';

  @override
  String get secDocsDesc => 'PDF، ZIP، أي ملف. الاسم والحجم والمحتوى مشفرة.';

  @override
  String get secAnonLabel => 'إخفاء الهوية';

  @override
  String get secAnonTitle => 'لا هوية مطلوبة';

  @override
  String get secAnonSubtitle =>
      'لا يطلب Hash أبداً رقم هاتفك أو بريدك الإلكتروني. يتم التعرف عليك بمعرّف Hash فريد ومجهول.';

  @override
  String get secHashIdTitle => 'معرّف Hash الخاص بك';

  @override
  String get secHashIdDesc =>
      'هذا هو معرّفك الفريد. لا يكشف شيئاً عنك: لا اسمك، لا رقمك، لا موقعك. إنه كاسم مستعار يستحيل ربطه بهويتك الحقيقية.\n\nلإضافة جهة اتصال، تشارك معرّف Hash الخاص بك أو تمسح رمز QR. هذا كل شيء. لا دفتر عناوين متزامن، لا اقتراحات \"أشخاص قد تعرفهم\".';

  @override
  String get secDataLabel => 'البيانات';

  @override
  String get secDataTitle => 'ما لا يعرفه Hash';

  @override
  String get secDataSubtitle => 'أفضل طريقة لحماية بياناتك هي عدم جمعها.';

  @override
  String get secNeverCollected => 'لا تُجمع أبداً';

  @override
  String get secNeverItem1 => 'محتوى الرسائل';

  @override
  String get secNeverItem2 => 'قائمة جهات الاتصال';

  @override
  String get secNeverItem3 => 'رقم الهاتف';

  @override
  String get secNeverItem4 => 'عنوان البريد الإلكتروني';

  @override
  String get secNeverItem5 => 'عنوان IP';

  @override
  String get secNeverItem6 => 'الموقع';

  @override
  String get secNeverItem7 => 'البيانات الوصفية (من يتحدث مع من)';

  @override
  String get secNeverItem8 => 'سجل المكالمات';

  @override
  String get secNeverItem9 => 'دفتر العناوين';

  @override
  String get secNeverItem10 => 'معرّفات الإعلانات';

  @override
  String get secTempStored => 'مخزن مؤقتاً';

  @override
  String get secTempItem1 => 'معرّف Hash مجهول (معرّف فريد)';

  @override
  String get secTempItem2 => 'مفاتيح التشفير العامة';

  @override
  String get secTempItem3 => 'رسائل مشفرة في الطريق (24 ساعة كحد أقصى)';

  @override
  String get secTempNote =>
      'حتى هذه البيانات الدنيا لا يمكنها التعرف عليك. معرّف Hash الخاص بك غير مرتبط بأي معلومات شخصية.';

  @override
  String get secFooterTitle => 'خصوصيتك، حريتك';

  @override
  String get secFooterDesc =>
      'يستخدم Hash نفس تقنيات التشفير المستخدمة في التطبيقات المهنية الأكثر تطلباً. رسائلك محمية بالرياضيات، وليس بالوعود.';

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
