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
  String get conversations => 'الدردشات';

  @override
  String get noConversation => 'لا توجد دردشات';

  @override
  String get noConversationSubtitle => 'أضف جهة اتصال لبدء الدردشة بأمان';

  @override
  String get addContact => 'إضافة جهة اتصال';

  @override
  String get shareApp => 'مشاركة التطبيق';

  @override
  String get newMessage => 'رسالة جديدة';

  @override
  String get newConversation => 'دردشة جديدة';

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
  String get notifications => 'الإشعارات';

  @override
  String get messages => 'الرسائل';

  @override
  String get calls => 'المكالمات';

  @override
  String get security => 'الأمان';

  @override
  String get accountSecurity => 'أمان الحساب';

  @override
  String get accountSecuritySubtitle => 'رمز PIN، البصمة، رمز الفخ';

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
  String get autoLockDisabled => 'معطل';

  @override
  String get autoLockMinute => 'دقيقة واحدة';

  @override
  String autoLockMinutes(int count) {
    return '$count دقائق';
  }

  @override
  String get destructionCode => 'رمز التدمير';

  @override
  String get destructionCodeInfo => 'إذا أدخلت هذا الرمز بدلاً من PIN:';

  @override
  String get destructionDeleteMessages => 'سيتم حذف جميع رسائلك';

  @override
  String get destructionDeleteContacts => 'سيتم حذف جميع جهات اتصالك';

  @override
  String get destructionDeleteHistory => 'سيتم مسح سجل مكالماتك';

  @override
  String get destructionKeepId => 'هويتك في Hash (#XXX-XXX-XXX) تبقى كما هي';

  @override
  String get destructionAppearNormal =>
      'سيظهر التطبيق عادياً لكن فارغاً. هذا الإجراء لا رجعة فيه.';

  @override
  String get setupDestructionCode => 'إعداد رمز التدمير';

  @override
  String get modifyDestructionCode => 'تعديل رمز التدمير';

  @override
  String get currentDestructionCode => 'رمز التدمير الحالي';

  @override
  String get newDestructionCode => 'رمز التدمير الجديد';

  @override
  String get confirmDestructionCode => 'تأكيد الرمز';

  @override
  String get destructionCodeConfigured => 'تم إعداد رمز التدمير';

  @override
  String get destructionCodeModified => 'تم تعديل رمز التدمير';

  @override
  String get destructionCodeMustDiffer =>
      'يجب أن يكون رمز التدمير مختلفاً عن PIN';

  @override
  String get incorrectDestructionCode => 'رمز التدمير غير صحيح';

  @override
  String get danger => 'خطر';

  @override
  String get panicButton => 'زر الذعر';

  @override
  String get panicButtonSubtitle => 'حذف جميع البيانات';

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
  String get panicConfirmTitle => 'زر الذعر';

  @override
  String get panicConfirmMessage =>
      'سيحذف هذا الإجراء جميع بياناتك نهائياً:\n\n• جميع رسائلك\n• جميع جهات اتصالك\n• حسابك\n\nهل أنت متأكد تماماً؟';

  @override
  String get deleteAll => 'حذف الكل';

  @override
  String get dataDeletedForSecurity => 'تم حذف البيانات للأمان.';

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
  String get tooManyAttempts => 'محاولات كثيرة جداً';

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
  String get onboardingSubtitle4 => 'رمز PIN، وضع الذعر وعبارة الاسترداد';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get next => 'التالي';

  @override
  String get skip => 'تخطي';

  @override
  String get alreadyHaveAccount => 'لدي حساب بالفعل';

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
  String get contactDetails => 'تفاصيل جهة الاتصال';

  @override
  String get contactName => 'اسم جهة الاتصال';

  @override
  String get contactHashId => 'معرّف Hash';

  @override
  String get deleteContact => 'حذف جهة الاتصال';

  @override
  String get deleteContactConfirm => 'حذف جهة الاتصال هذه؟';

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
  String get shareMessage =>
      'انضم إليّ على Hash! 🔒\n\nإنه تطبيق مراسلة خاص حقاً: تشفير كامل، بدون أثر على الخوادم، ووضع الذعر عند الحاجة.\n\nحمّل التطبيق من هنا 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'خطأ';

  @override
  String get ok => 'موافق';

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
}
