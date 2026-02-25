// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'אפס עקבות. אפס פשרות.';

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
  String get conversations => 'צ\'אטים';

  @override
  String get contacts => 'אנשי קשר';

  @override
  String get noConversation => 'אין צ\'אטים';

  @override
  String get noConversationSubtitle =>
      'הוסף איש קשר כדי להתחיל לשוחח בצורה מאובטחת';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count בקשות ממתינות',
      one: 'בקשה ממתינה אחת',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count בקשות שנשלחו ממתינות',
      one: 'בקשה שנשלחה ממתינה',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'הוסף איש קשר';

  @override
  String get shareApp => 'שתף אפליקציה';

  @override
  String get newMessage => 'הודעה חדשה';

  @override
  String get newConversation => 'שלח הודעה';

  @override
  String get settings => 'הגדרות';

  @override
  String get myHashId => 'ה-Hash ID שלי';

  @override
  String get supportHash => 'תמוך ב-Hash';

  @override
  String get supportHashSubtitle => 'Hash הוא פרויקט ללא מטרות רווח';

  @override
  String get donate => 'תרום';

  @override
  String get appearance => 'מראה';

  @override
  String get theme => 'ערכת נושא';

  @override
  String get themeAuto => 'אוטומטי';

  @override
  String get themeAutoSubtitle => 'עוקב אחר הגדרות המערכת';

  @override
  String get themeDark => 'כהה';

  @override
  String get themeLight => 'בהיר';

  @override
  String get themeRecommendation => 'ערכת נושא כהה מומלצת לפרטיות טובה יותר';

  @override
  String get language => 'שפה';

  @override
  String get languageAuto => 'אוטומטי (מערכת)';

  @override
  String get notifications => 'התראות';

  @override
  String get messages => 'הודעות';

  @override
  String get calls => 'שיחות';

  @override
  String get vibration => 'רטט';

  @override
  String get notificationContent => 'תוכן ההתראה';

  @override
  String get notificationContentFull => 'הצג הכל';

  @override
  String get notificationContentFullDesc =>
      'שם איש הקשר ותצוגה מקדימה של ההודעה';

  @override
  String get notificationContentName => 'שם בלבד';

  @override
  String get notificationContentNameDesc => 'מציג רק את שם איש הקשר';

  @override
  String get notificationContentDiscrete => 'דיסקרטי';

  @override
  String get notificationContentDiscreteDesc => 'מציג רק \"הודעה חדשה\"';

  @override
  String get security => 'אבטחה';

  @override
  String get howHashProtectsYou => 'כיצד Hash מגן עליך';

  @override
  String get howHashProtectsYouSubtitle => 'הבן את האבטחה שלך';

  @override
  String get accountSecurity => 'אבטחת חשבון';

  @override
  String get accountSecuritySubtitle => 'PIN, ביומטריה, מצב Vash';

  @override
  String get blockScreenshots => 'חסום צילומי מסך';

  @override
  String get transferDevice => 'העבר למכשיר אחר';

  @override
  String get transferDeviceSubtitle => 'העבר את החשבון שלך';

  @override
  String get pinCode => 'קוד PIN';

  @override
  String get changePin => 'שנה קוד PIN';

  @override
  String get currentPin => 'קוד PIN נוכחי';

  @override
  String get newPin => 'קוד PIN חדש';

  @override
  String get confirmPin => 'אשר קוד PIN';

  @override
  String get pinChanged => 'קוד PIN שונה';

  @override
  String get incorrectPin => 'PIN שגוי';

  @override
  String get pinsDoNotMatch => 'קודי ה-PIN אינם תואמים';

  @override
  String get autoLock => 'נעילה אוטומטית';

  @override
  String get autoLockDelay => 'השהיית נעילה';

  @override
  String get autoLockImmediate => 'מיידי';

  @override
  String get autoLockMinute => 'דקה אחת';

  @override
  String autoLockMinutes(int count) {
    return '$count דקות';
  }

  @override
  String get vashCode => 'קוד Vash';

  @override
  String get vashModeTitle => 'מצב Vash';

  @override
  String get vashModeExplanation => 'רשת הביטחון האולטימטיבית שלך.';

  @override
  String get vashModeDescription =>
      'תבחר קוד PIN שני. אם אי פעם תיאלץ לפתוח את Hash, הכנס קוד זה במקום ה-PIN הרגיל שלך.\n\nהאפליקציה תיפתח כרגיל, אבל כל השיחות ואנשי הקשר שלך ייעלמו.\n\nלכל מי שמסתכל על המסך שלך, Hash פשוט נראה ריק — כאילו מעולם לא השתמשת בו.';

  @override
  String get vashModeIrreversible => 'פעולה זו שקטה ובלתי הפיכה.';

  @override
  String get chooseVashCode => 'בחר את קוד ה-Vash שלי';

  @override
  String get vashCodeInfo => 'קוד PIN שני שפותח את האפליקציה כרגיל, אך ריקה.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'אם תכניס קוד זה במקום ה-PIN:';

  @override
  String get vashDeleteContacts => 'אנשי הקשר שלך נעלמים';

  @override
  String get vashDeleteMessages => 'השיחות שלך נעלמות';

  @override
  String get vashDeleteHistory => 'ההערות שלך נעלמות';

  @override
  String get vashKeepId => 'זהות ה-Hash שלך (#XXX-XXX-XXX) נשארת זהה';

  @override
  String get vashAppearNormal =>
      'האפליקציה נראית רגילה אך ריקה, כמו חדשה. פעולה זו בלתי הפיכה.';

  @override
  String get setupVashCode => 'הגדר קוד Vash';

  @override
  String get modifyVashCode => 'שנה קוד Vash';

  @override
  String get currentVashCode => 'קוד Vash נוכחי';

  @override
  String get newVashCode => 'קוד Vash חדש';

  @override
  String get confirmVashCode => 'אשר קוד Vash';

  @override
  String get vashCodeConfigured => 'קוד Vash הוגדר';

  @override
  String get vashCodeModified => 'קוד Vash שונה';

  @override
  String get vashCodeMustDiffer => 'קוד Vash חייב להיות שונה מה-PIN';

  @override
  String get incorrectVashCode => 'קוד Vash שגוי';

  @override
  String get vashWhatToDelete => 'מה מצב Vash יעלים?';

  @override
  String get vashDeleteContactsOption => 'אנשי קשר';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'הודעות';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'הערות';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'מצב Vash הופעל';

  @override
  String get vashCreateSubtitle => 'בחר קוד שונה מה-PIN הראשי שלך';

  @override
  String get vashConfirmSubtitle => 'אשר את קוד ה-Vash שלך';

  @override
  String get pinCodeForEntry => 'קוד PIN לכניסה לאפליקציה';

  @override
  String get vashCodeSection => 'מצב Vash';

  @override
  String get biometric => 'ביומטריה';

  @override
  String get biometricUnlock => 'פתח עם טביעת אצבע או Face ID';

  @override
  String get enableBiometric => 'הפעל ביומטריה';

  @override
  String get biometricWarningMessage =>
      'הפעלת ביומטריה תמנע ממך להשתמש בקוד Vash לכניסה לאפליקציה.\n\nתוכל להשתמש בקוד Vash רק אם הביומטריה נכשלת (לאחר מספר ניסיונות כושלים).\n\nהאם אתה בטוח שברצונך להמשיך?';

  @override
  String get understood => 'הבנתי';

  @override
  String get shareAppSubtitle => 'שתף את Hash עם הקרובים אליך';

  @override
  String get share => 'שתף';

  @override
  String get danger => 'סכנה';

  @override
  String get deleteAccount => 'מחק את החשבון שלי';

  @override
  String get deleteAccountSubtitle => 'פעולה בלתי הפיכה';

  @override
  String get deleteAccountConfirmTitle => 'מחק את החשבון שלי';

  @override
  String get deleteAccountConfirmMessage =>
      'החשבון שלך יימחק לצמיתות. פעולה זו בלתי הפיכה.\n\n• כל הצ\'אטים שלך\n• כל אנשי הקשר שלך\n• ה-Hash ID שלך\n\nתצטרך ליצור חשבון חדש.';

  @override
  String get deleteForever => 'מחק לצמיתות';

  @override
  String get cancel => 'ביטול';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'מצב Vash הופעל.';

  @override
  String deletionError(String error) {
    return 'שגיאת מחיקה: $error';
  }

  @override
  String get yourSecurity => 'האבטחה שלך';

  @override
  String get securityInfo =>
      '• הצפנה מקצה לקצה (Signal Protocol)\n• אין נתונים בשרתים שלנו לאחר מסירה\n• מפתחות מאוחסנים רק במכשיר שלך\n• קוד PIN אף פעם לא נשלח לשרת';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'ברוך הבא';

  @override
  String get securityStatement1 => 'ההודעות שלך מוגנות.';

  @override
  String get securityStatement2 => 'הצפנה מקצה לקצה.';

  @override
  String get securityStatement3 => 'אפס עקבות. אפס פשרות.';

  @override
  String get securityStatement4 => 'הפרטיות שלך היא זכות.';

  @override
  String get accessBlocked => 'הגישה חסומה';

  @override
  String get tooManyAttempts => 'יותר מדי ניסיונות. נסה שוב מאוחר יותר.';

  @override
  String get pleaseWait => 'אנא המתן';

  @override
  String get waitDelay => 'אנא המתן עד לסיום ההשהיה';

  @override
  String attemptCount(int current, int max) {
    return 'ניסיון $current מתוך $max';
  }

  @override
  String retryIn(String time) {
    return 'נסה שוב בעוד $time';
  }

  @override
  String get forgotPin => 'שכחת PIN? השתמש בביטוי שחזור';

  @override
  String get useRecoveryPhrase => 'השתמש בביטוי שחזור';

  @override
  String get recoveryWarningTitle => 'אזהרה';

  @override
  String get recoveryWarningMessage => 'שחזור חשבון:';

  @override
  String get recoveryDeleteAllMessages => 'ימחק את כל ההודעות שלך';

  @override
  String get recoveryWaitDelay => 'ידרוש השהיה של שעה';

  @override
  String get recoveryKeepContacts => 'ישמור על אנשי הקשר שלך';

  @override
  String get recoveryIrreversible =>
      'פעולה זו בלתי הפיכה. ההודעות שלך יאבדו לצמיתות.';

  @override
  String get iUnderstand => 'אני מבין';

  @override
  String get accountRecovery => 'שחזור חשבון';

  @override
  String get enterRecoveryPhrase =>
      'הכנס את 24 המילים של ביטוי השחזור שלך, מופרדות ברווחים.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'שחזר';

  @override
  String get recoveryPhraseRequired => 'אנא הכנס את ביטוי השחזור שלך';

  @override
  String get recoveryPhrase24Words => 'הביטוי חייב להכיל בדיוק 24 מילים';

  @override
  String get incorrectRecoveryPhrase => 'ביטוי שחזור שגוי';

  @override
  String get recoveryInitError => 'שגיאה באתחול השחזור';

  @override
  String get securityDelay => 'השהיית אבטחה';

  @override
  String get securityDelayMessage =>
      'לביטחונך, נדרשת תקופת המתנה לפני שתוכל ליצור PIN חדש.';

  @override
  String get timeRemaining => 'זמן שנותר';

  @override
  String get messagesDeletedForProtection => 'ההודעות שלך נמחקו להגנתך.';

  @override
  String get canCloseApp => 'תוכל לסגור את האפליקציה ולחזור מאוחר יותר.';

  @override
  String get onboardingTitle1 => 'ברוך הבא ל-Hash';

  @override
  String get onboardingSubtitle1 => 'המסנג\'ר שלא משאיר עקבות';

  @override
  String get onboardingTitle2 => 'הצפנה מלאה';

  @override
  String get onboardingSubtitle2 =>
      'ההודעות שלך מוצפנות מקצה לקצה עם פרוטוקול Signal';

  @override
  String get onboardingTitle3 => 'אפס עקבות';

  @override
  String get onboardingSubtitle3 => 'הודעות נמחקות מהשרתים עם המסירה';

  @override
  String get onboardingTitle4 => 'האבטחה שלך';

  @override
  String get onboardingSubtitle4 => 'קוד PIN, מצב Vash וביטוי שחזור';

  @override
  String get getStarted => 'התחל';

  @override
  String get next => 'הבא';

  @override
  String get skip => 'דלג';

  @override
  String get alreadyHaveAccount => 'כבר יש לי חשבון';

  @override
  String get transferMyAccount => 'העבר את החשבון שלי';

  @override
  String get createPin => 'צור קוד PIN';

  @override
  String get createPinSubtitle => 'קוד זה יגן על הגישה לאפליקציה שלך';

  @override
  String get confirmYourPin => 'אשר את קוד ה-PIN שלך';

  @override
  String get confirmPinSubtitle => 'הכנס שוב את קוד ה-PIN שלך';

  @override
  String get saveRecoveryPhrase => 'ביטוי שחזור';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'רשום את 24 המילים האלה לפי הסדר. הן יאפשרו לך לשחזר את החשבון אם תשכח את ה-PIN.';

  @override
  String get phraseWritten => 'רשמתי את הביטוי שלי';

  @override
  String get warningRecoveryPhrase =>
      'אם תאבד ביטוי זה ותשכח את ה-PIN, תאבד גישה לחשבון שלך.';

  @override
  String get accountTransferred => 'החשבון הועבר';

  @override
  String get accountTransferredMessage =>
      'החשבון שלך הועבר למכשיר אחר. הפעלה זו אינה תקפה יותר.';

  @override
  String get accountTransferredInfo =>
      'אם לא יזמת העברה זו, ייתכן שהחשבון שלך נפרץ.';

  @override
  String get logout => 'התנתק';

  @override
  String get transferAccount => 'העבר חשבון';

  @override
  String get transferAccountInfo =>
      'העבר את חשבון ה-Hash שלך למכשיר חדש. ההפעלה הנוכחית שלך תבוטל.';

  @override
  String get generateTransferCode => 'צור קוד העברה';

  @override
  String get transferCode => 'קוד העברה';

  @override
  String transferCodeExpires(int minutes) {
    return 'קוד זה יפוג בעוד $minutes דקות';
  }

  @override
  String get enterCodeOnNewDevice =>
      'הכנס קוד זה במכשיר החדש שלך כדי להעביר את חשבונך.';

  @override
  String get generateNewCode => 'צור קוד חדש';

  @override
  String get scanQrCode => 'סרוק קוד QR';

  @override
  String get scanQrCodeSubtitle =>
      'סרוק את קוד ה-QR של איש קשר כדי להוסיף אותו';

  @override
  String get qrCodeDetected => 'קוד QR זוהה';

  @override
  String get invalidQrCode => 'קוד QR לא תקין';

  @override
  String get cameraPermissionRequired => 'נדרשת הרשאת מצלמה';

  @override
  String get myQrCode => 'קוד ה-QR שלי';

  @override
  String get myQrCodeSubtitle =>
      'שתף קוד QR זה כדי שאנשי הקשר שלך יוכלו להוסיף אותך';

  @override
  String get shareQrCode => 'שתף';

  @override
  String get addContactTitle => 'הוסף איש קשר';

  @override
  String get addContactByHashId => 'הכנס את ה-Hash ID של איש הקשר שלך';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'חפש';

  @override
  String get contactNotFound => 'איש קשר לא נמצא';

  @override
  String get contactAlreadyAdded => 'איש קשר זה כבר ברשימה שלך';

  @override
  String get contactAdded => 'איש קשר נוסף';

  @override
  String get myProfile => 'הפרופיל שלי';

  @override
  String get myProfileSubtitle => 'שתף מידע זה כדי שאחרים יוכלו להוסיף אותך';

  @override
  String get temporaryCode => 'קוד זמני';

  @override
  String temporaryCodeExpires(String time) {
    return 'יפוג בעוד $time';
  }

  @override
  String get codeExpired => 'הקוד פג';

  @override
  String get generateNewCodeButton => 'קוד חדש';

  @override
  String get copyHashId => 'העתק ID';

  @override
  String get copyCode => 'העתק קוד';

  @override
  String get copiedToClipboard => 'הועתק';

  @override
  String get showMyQrCode => 'הצג את קוד ה-QR שלי';

  @override
  String get orDivider => 'או';

  @override
  String get openScanner => 'פתח סורק';

  @override
  String get addManually => 'הוסף ידנית';

  @override
  String get contactHashIdLabel => 'Hash ID של איש הקשר';

  @override
  String get temporaryCodeLabel => 'קוד זמני';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode => 'בקש מאיש הקשר שלך ליצור קוד מהפרופיל שלו';

  @override
  String get verifyAndAdd => 'אמת והוסף';

  @override
  String get fillAllFields => 'אנא מלא את כל השדות';

  @override
  String get invalidHashIdFormat => 'פורמט ID לא תקין (דוגמה: 123-456-ABC)';

  @override
  String get userNotFound => 'משתמש לא נמצא';

  @override
  String get cannotAddYourself => 'אינך יכול להוסיף את עצמך';

  @override
  String get invalidOrExpiredCode => 'קוד זמני לא תקין או שפג תוקפו';

  @override
  String get contactFound => 'איש קשר נמצא!';

  @override
  String get howToCallContact => 'איך תרצה לקרוא להם?';

  @override
  String get contactNameHint => 'שם איש קשר';

  @override
  String get addContactButton => 'הוסף';

  @override
  String get contactDetails => 'פרטי איש קשר';

  @override
  String get contactName => 'שם איש קשר';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'נוסף ב-$date';
  }

  @override
  String get deleteContact => 'מחק איש קשר';

  @override
  String deleteContactConfirm(Object name) {
    return 'למחוק את איש הקשר?';
  }

  @override
  String get deleteContactMessage => 'פעולה זו תמחק גם את כל הצ\'אט.';

  @override
  String get delete => 'מחק';

  @override
  String get typeMessage => 'כתוב הודעה...';

  @override
  String get messageSent => 'נשלח';

  @override
  String get messageDelivered => 'נמסר';

  @override
  String get messageRead => 'נקרא';

  @override
  String get messageFailed => 'השליחה נכשלה';

  @override
  String get now => 'עכשיו';

  @override
  String minutesAgo(int count) {
    return '$countד\'';
  }

  @override
  String hoursAgo(int count) {
    return '$countש\'';
  }

  @override
  String daysAgo(int count) {
    return '$countי\'';
  }

  @override
  String get today => 'היום';

  @override
  String get yesterday => 'אתמול';

  @override
  String dateAtTime(String date, String time) {
    return '$date ב-$time';
  }

  @override
  String get shareMessage =>
      'הצטרף אליי ב-Hash! 🔒\n\nזהו מסנג\'ר פרטי באמת: הצפנה מלאה, אפס עקבות על השרתים, ומצב פאניקה בעת הצורך.\n\nהורד את האפליקציה כאן 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'שגיאה';

  @override
  String get ok => 'אישור';

  @override
  String get view => 'הצג';

  @override
  String get yes => 'כן';

  @override
  String get no => 'לא';

  @override
  String get save => 'שמור';

  @override
  String get edit => 'ערוך';

  @override
  String get close => 'סגור';

  @override
  String get confirm => 'אשר';

  @override
  String get loading => 'טוען...';

  @override
  String get retry => 'נסה שוב';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'בקשות ממתינות';

  @override
  String get noPendingRequests => 'אין בקשות ממתינות';

  @override
  String get pendingRequestsSubtitle => 'אנשים אלה רוצים להוסיף אותך';

  @override
  String requestFromUser(String hashId) {
    return 'בקשה מ-$hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'יפוג בעוד $days ימים';
  }

  @override
  String get acceptRequest => 'אשר';

  @override
  String get rejectRequest => 'דחה';

  @override
  String get requestAccepted => 'הבקשה אושרה';

  @override
  String get requestRejected => 'הבקשה נדחתה';

  @override
  String get requestSent => 'הבקשה נשלחה!';

  @override
  String get requestSentSubtitle =>
      'הבקשה שלך נשלחה. המשתמש צריך לאשר אותה לפני שתוכלו לשוחח.';

  @override
  String get requestAlreadyPending => 'בקשה כבר ממתינה';

  @override
  String get requestAlreadySentByOther => 'אדם זה כבר שלח לך בקשה';

  @override
  String get addByHashId => 'הוסף לפי Hash ID';

  @override
  String get addByHashIdSubtitle => 'הכנס את ה-Hash ID והקוד הזמני של איש הקשר';

  @override
  String get enterTemporaryCode => 'הכנס את הקוד בן 6 הספרות';

  @override
  String get sendRequest => 'שלח בקשה';

  @override
  String get acceptContactTitle => 'אשר איש קשר';

  @override
  String get acceptContactSubtitle => 'תוכל לתת להם שם מותאם אישית';

  @override
  String get leaveEmptyForHashId => 'השאר ריק לשימוש ב-Hash ID';

  @override
  String get firstName => 'שם פרטי';

  @override
  String get lastName => 'שם משפחה';

  @override
  String get notes => 'הערות';

  @override
  String get notesHint => 'הערות אישיות על איש קשר זה';

  @override
  String get photoOptional => 'תמונה (אופציונלי)';

  @override
  String get contactNameOptional => 'שם (אופציונלי)';

  @override
  String get notesOptional => 'הערות (אופציונלי)';

  @override
  String get storedLocally => 'מאוחסן במכשיר שלך בלבד';

  @override
  String get encryptedMessageLabel => 'הודעה מוצפנת';

  @override
  String get identityMessageHint => 'מי אתה? איך אתם מכירים?';

  @override
  String get messageWillBeSentEncrypted => 'הודעה זו תוצפן ותישלח לנמען';

  @override
  String get sendRequestButton => 'שלח בקשה';

  @override
  String get requestExpiresIn24h => 'הבקשה תפוג תוך 24 שעות אם לא תאושר';

  @override
  String get theyAlreadySentYouRequest => 'אדם זה כבר שלח לך בקשה';

  @override
  String get requests => 'בקשות';

  @override
  String get receivedRequests => 'התקבלו';

  @override
  String get sentRequests => 'נשלחו';

  @override
  String get noSentRequests => 'אין בקשות שנשלחו';

  @override
  String get cancelRequest => 'ביטול';

  @override
  String get deleteRequest => 'מחק בקשה';

  @override
  String get requestCancelled => 'הבקשה בוטלה';

  @override
  String sentTo(String hashId) {
    return 'נשלח ל-$hashId';
  }

  @override
  String expiresIn(String time) {
    return 'יפוג בעוד $time';
  }

  @override
  String receivedAgo(String time) {
    return 'התקבל לפני $time';
  }

  @override
  String get messageFromRequester => 'הודעה מהמבקש';

  @override
  String get copy => 'העתק';

  @override
  String get messageInfo => 'פרטי הודעה';

  @override
  String get messageDirection => 'כיוון';

  @override
  String get messageSentByYou => 'נשלח על ידך';

  @override
  String get messageReceived => 'התקבל';

  @override
  String get messageSentAt => 'נשלח ב';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'סטטוס';

  @override
  String get messageReadAt => 'נקרא ב';

  @override
  String get messageType => 'סוג';

  @override
  String get messageSize => 'גודל';

  @override
  String get messageExpiresAt => 'יפוג ב';

  @override
  String get messageEncrypted => 'מוצפן מקצה לקצה';

  @override
  String get messageStatusSending => 'שולח...';

  @override
  String get messageStatusSent => 'נשלח';

  @override
  String get messageStatusDelivered => 'נמסר';

  @override
  String get messageStatusRead => 'נקרא';

  @override
  String get messageStatusFailed => 'נכשל';

  @override
  String get serverStatus => 'שרת';

  @override
  String get onServer => 'ממתין למסירה';

  @override
  String get deletedFromServer => 'נמחק';

  @override
  String get messageTypeText => 'טקסט';

  @override
  String get messageTypeImage => 'תמונה';

  @override
  String get messageTypeVideo => 'סרטון';

  @override
  String get messageTypeVoice => 'קול';

  @override
  String get messageTypeFile => 'קובץ';

  @override
  String get indefinitely => 'ללא הגבלה';

  @override
  String get hoursShort => 'ש\'';

  @override
  String get minutesShort => 'ד\'';

  @override
  String get hours => 'שעות';

  @override
  String get minutes => 'דקות';

  @override
  String get seconds => 'שניות';

  @override
  String get ephemeralMessages => 'הודעות חולפות';

  @override
  String get ephemeralMessagesDescription =>
      'הודעות נמחקות אוטומטית אחרי זמן זה';

  @override
  String get ephemeralImmediate => 'מיידי (אחרי קריאה)';

  @override
  String get ephemeralImmediateDesc => 'נמחק מיד עם הקריאה';

  @override
  String get ephemeralMyPreference => 'ההעדפה שלי';

  @override
  String get ephemeralMyPreferenceDesc => 'השתמש בהגדרה הכללית';

  @override
  String get ephemeralDefaultSetting => 'משך ההודעה';

  @override
  String get ephemeralChooseDefault => 'מומלץ';

  @override
  String get ephemeral30Seconds => '30 שניות';

  @override
  String get ephemeral30SecondsDesc => 'נמחק 30 שניות אחרי קריאה';

  @override
  String get ephemeral5Minutes => '5 דקות';

  @override
  String get ephemeral5MinutesDesc => 'נמחק 5 דקות אחרי קריאה';

  @override
  String get ephemeral1Hour => 'שעה';

  @override
  String get ephemeral1HourDesc => 'נמחק שעה אחרי קריאה';

  @override
  String get ephemeral3Hours => '3 שעות';

  @override
  String get ephemeral6Hours => '6 שעות';

  @override
  String get ephemeral6HoursDesc => 'נמחק 6 שעות אחרי קריאה';

  @override
  String get ephemeral12Hours => '12 שעות';

  @override
  String get ephemeral24Hours => '24 שעות';

  @override
  String get ephemeral24HoursDesc => 'נמחק 24 שעות אחרי קריאה';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'משך מותאם אישית';

  @override
  String get howItWorks => 'איך זה עובד';

  @override
  String get ephemeralExplanation1 => 'הודעות נמחקות מהשרת מיד עם קבלתן.';

  @override
  String get ephemeralExplanation2 =>
      'הגדרה זו קובעת מתי הודעות נעלמות מהטלפון שלך אחרי קריאה.';

  @override
  String get ephemeralExplanation3 => 'לאיש הקשר שלך יש הגדרה משלו לטלפון שלו.';

  @override
  String get mute1Hour => 'שעה';

  @override
  String get mute8Hours => '8 שעות';

  @override
  String get mute1Day => 'יום';

  @override
  String get mute1Week => 'שבוע';

  @override
  String get muteAlways => 'תמיד';

  @override
  String get muteExplanation => 'לא תקבל התראות עבור איש קשר זה';

  @override
  String get showCallsInRecents => 'הצג בשיחות אחרונות';

  @override
  String get showCallsInRecentsSubtitle =>
      'שיחות Hash מופיעות בהיסטוריית הטלפון';

  @override
  String get feedback => 'משוב';

  @override
  String get muteNotifications => 'השתק התראות';

  @override
  String get muteDescription => 'לא תקבל התראות עבור איש קשר זה';

  @override
  String mutedUntil(String time) {
    return 'מושתק עד $time';
  }

  @override
  String get notMuted => 'התראות מופעלות';

  @override
  String get unmute => 'בטל השתקה';

  @override
  String get notificationSound => 'צליל התראה';

  @override
  String get defaultSound => 'ברירת מחדל';

  @override
  String get chatSettings => 'הגדרות צ\'אט';

  @override
  String get bubbleColor => 'צבע בועה';

  @override
  String get backgroundColor => 'צבע רקע';

  @override
  String get backgroundImage => 'תמונת רקע';

  @override
  String get chatBackground => 'רקע צ\'אט';

  @override
  String get customColor => 'מותאם אישית';

  @override
  String get defaultColor => 'ברירת מחדל';

  @override
  String get imageSelected => 'תמונה נבחרה';

  @override
  String get noImage => 'ללא תמונה';

  @override
  String get color => 'צבע';

  @override
  String get image => 'תמונה';

  @override
  String get tapToSelectImage => 'הקש לבחירת תמונה';

  @override
  String get changeImage => 'החלף תמונה';

  @override
  String get previewMessageReceived => '!שלום';

  @override
  String get previewMessageSent => '!מה נשמע';

  @override
  String get messageAction => 'הודעה';

  @override
  String get callAction => 'שיחה';

  @override
  String get videoAction => 'וידאו';

  @override
  String get personalNotes => 'הערות אישיות';

  @override
  String get addNotes => 'הוסף הערות...';

  @override
  String get noNotes => 'אין הערות';

  @override
  String get messageNotifications => 'התראות הודעות';

  @override
  String get callNotifications => 'התראות שיחות';

  @override
  String get useGradient => 'השתמש בהדרגה';

  @override
  String get gradientStart => 'צבע התחלה';

  @override
  String get gradientEnd => 'צבע סיום';

  @override
  String get preview => 'תצוגה מקדימה';

  @override
  String get reset => 'איפוס';

  @override
  String get securityNumber => 'מספר אבטחה';

  @override
  String securityNumberDescription(String name) {
    return 'ודא שמספר האבטחה תואם למכשיר של $name';
  }

  @override
  String get verifyEncryption => 'אמת הצפנה מקצה לקצה';

  @override
  String get tapToCopy => 'הקש להעתקה';

  @override
  String get howToVerify => 'כיצד לאמת';

  @override
  String get verifyStep1 => 'פגוש את איש הקשר שלך באופן אישי או התקשר אליו';

  @override
  String get verifyStep2 => 'השווה את מספרי האבטחה או סרוק קודי QR';

  @override
  String get verifyStep3 => 'אם הם תואמים, הצ\'אט שלך מאובטח';

  @override
  String get scanToVerify => 'סרוק לאימות';

  @override
  String get reportSpam => 'דווח על ספאם';

  @override
  String get reportSpamSubtitle => 'דווח על איש קשר זה כספאם';

  @override
  String get reportSpamDescription =>
      'איש קשר זה ידווח באופן אנונימי. הזהות שלך לא תשותף. האם אתה בטוח?';

  @override
  String get report => 'דווח';

  @override
  String get spamReported => 'ספאם דווח';

  @override
  String get reportError => 'שליחת הדיווח נכשלה. אנא נסה שוב.';

  @override
  String get reportRateLimited => 'הגעת למספר המקסימלי של דיווחים להיום.';

  @override
  String get blockContact => 'חסום איש קשר';

  @override
  String get blockContactDescription =>
      'איש קשר זה לא יוכל עוד לשלוח לך הודעות או להתקשר אליך. הוא לא יקבל הודעה.';

  @override
  String get unblockContact => 'בטל חסימת איש קשר';

  @override
  String get unblockContactDescription =>
      'איש קשר זה יוכל שוב לשלוח לך הודעות ולהתקשר אליך.';

  @override
  String get contactBlocked => 'איש קשר נחסם';

  @override
  String get contactUnblocked => 'חסימת איש קשר בוטלה';

  @override
  String get contactIsBlocked => 'איש קשר זה חסום';

  @override
  String get unblock => 'בטל חסימה';

  @override
  String get deleteContactSubtitle => 'מחק איש קשר וצ\'אט זה';

  @override
  String get confirmWithPin => 'אשר עם PIN';

  @override
  String get enterPinToConfirm => 'הכנס את ה-PIN שלך כדי לאשר פעולה זו';

  @override
  String get profilePhoto => 'תמונת פרופיל';

  @override
  String get takePhoto => 'צלם תמונה';

  @override
  String get chooseFromGallery => 'בחר מהגלריה';

  @override
  String get removePhoto => 'הסר תמונה';

  @override
  String get viewContactHashId => 'הצג מזהה איש הקשר';

  @override
  String get hashIdPartiallyMasked =>
      'מוסתר חלקית לביטחונך ולפרטיות איש הקשר שלך';

  @override
  String get addFirstContact => 'הוסף את איש הקשר הראשון שלך';

  @override
  String get addFirstContactSubtitle => 'שתף את קוד ה-QR שלך או סרוק של חבר';

  @override
  String get directory => 'ספרייה';

  @override
  String get noContacts => 'אין אנשי קשר';

  @override
  String get noContactsSubtitle => 'הוסף איש קשר כדי להתחיל';

  @override
  String get sendMessageAction => 'שלח הודעה';

  @override
  String get audioCall => 'שיחת קול';

  @override
  String get videoCall => 'שיחת וידאו';

  @override
  String get viewProfile => 'הצג פרופיל';

  @override
  String get deleteContactDirectory => 'מחק איש קשר';

  @override
  String get scanShort => 'סרוק';

  @override
  String get addShort => 'הוסף';

  @override
  String deleteContactConfirmName(String name) {
    return 'האם אתה בטוח שברצונך למחוק את $name?';
  }

  @override
  String get noNotesTitle => 'אין הערות';

  @override
  String get noNotesSubtitle => 'צור את ההערה הראשונה שלך';

  @override
  String get newNote => 'הערה חדשה';

  @override
  String get editNote => 'ערוך הערה';

  @override
  String get deleteNote => 'מחק הערה';

  @override
  String get deleteNoteConfirm => 'האם אתה בטוח שברצונך למחוק הערה זו?';

  @override
  String get noteTitle => 'כותרת';

  @override
  String get noteContent => 'תוכן';

  @override
  String get addItem => 'הוסף פריט';

  @override
  String get pinNote => 'הצמד';

  @override
  String get unpinNote => 'בטל הצמדה';

  @override
  String get noteColor => 'צבע';

  @override
  String get notePassword => 'סיסמה';

  @override
  String get setPassword => 'הגדר סיסמה';

  @override
  String get changePassword => 'שנה סיסמה';

  @override
  String get removePassword => 'הסר סיסמה';

  @override
  String get enterPassword => 'הכנס סיסמה';

  @override
  String get confirmPassword => 'אשר סיסמה';

  @override
  String get passwordPin => 'קוד PIN';

  @override
  String get passwordText => 'סיסמת טקסט';

  @override
  String get protectedNote => 'הערה מוגנת';

  @override
  String get incorrectPassword => 'סיסמה שגויה';

  @override
  String get passwordSet => 'סיסמה הוגדרה';

  @override
  String get passwordRemoved => 'סיסמה הוסרה';

  @override
  String get notesBiometric => 'Face ID להערות';

  @override
  String get notesBiometricSubtitle => 'דרוש אימות ביומטרי לפתיחת הערות מוגנות';

  @override
  String get textNote => 'הערת טקסט';

  @override
  String get checklistNote => 'רשימת משימות';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total משימות';
  }

  @override
  String get autoSaved => 'נשמר';

  @override
  String get searchNotes => 'חפש הערות';

  @override
  String get legalConsent => 'הסכמה משפטית';

  @override
  String get confirmAge13 => 'אני מאשר שגילי לפחות 13';

  @override
  String get acceptLegalStart => 'אני מסכים ל';

  @override
  String get privacyPolicy => 'מדיניות פרטיות';

  @override
  String get termsOfService => 'תנאי השימוש';

  @override
  String get andThe => ' ול';

  @override
  String get continueButton => 'המשך';

  @override
  String get mustAcceptTerms => 'עליך לקבל את שני התנאים כדי להמשיך';

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
  String get support => 'תמיכה';

  @override
  String get contactSupport => 'צור קשר עם התמיכה';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'דווח על התעללות';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'משפטי';

  @override
  String get legalEntity => 'ישות משפטית';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'הצמד';

  @override
  String get unpinConversation => 'בטל הצמדה';

  @override
  String get hideConversation => 'הסר מהפיד';

  @override
  String get deleteConversation => 'מחק שיחה';

  @override
  String get deleteConversationConfirm =>
      'הכנס את ה-PIN שלך כדי לאשר מחיקת כל ההודעות';

  @override
  String get noConversations => 'עדיין אין שיחות';

  @override
  String get startConversation => 'התחל';

  @override
  String get microphonePermissionRequired => 'נדרשת גישה למיקרופון';

  @override
  String get microphonePermissionExplanation =>
      'Hash צריך את המיקרופון כדי לבצע שיחות.';

  @override
  String get cameraPermissionExplanation => 'Hash צריך את המצלמה לשיחות וידאו.';

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
  String get openSettings => 'פתח הגדרות';

  @override
  String get callConnecting => 'מתחבר...';

  @override
  String get callRinging => 'מצלצל...';

  @override
  String get callReconnecting => 'מתחבר מחדש...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'מתחבר מחדש ($secondsש\')';
  }

  @override
  String get callPaused => 'מושהה';

  @override
  String get callPausedSubtitle => 'השיחה עדיין פעילה';

  @override
  String get callRemoteMicMuted => 'המיקרופון של איש הקשר מושתק';

  @override
  String get callMiniControlsMute => 'השתק';

  @override
  String get callMiniControlsUnmute => 'בטל השתקה';

  @override
  String get callMiniControlsHangUp => 'נתק';

  @override
  String get callMiniControlsReturn => 'חזור לשיחה';

  @override
  String get callNetworkPoor => 'חיבור לא יציב';

  @override
  String get callNetworkLost => 'החיבור אבד';

  @override
  String get callEndedTitle => 'השיחה הסתיימה';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'נתוני מכשיר';

  @override
  String get deviceDataSubtitle => 'אחסון מקומי ושרת';

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
  String get localStorage => 'אחסון מקומי';

  @override
  String get onThisDevice => 'במכשיר זה';

  @override
  String get encryptedDatabases => 'מסדי נתונים מוצפנים';

  @override
  String get files => 'קבצים';

  @override
  String get secureKeychain => 'מחזיק מפתחות מאובטח';

  @override
  String get cache => 'מטמון';

  @override
  String get contactsDetail => 'שמות, אווטארים, מפתחות Signal';

  @override
  String get messagesDetail => 'שיחות מוצפנות';

  @override
  String get notesDetail => 'הערות אישיות';

  @override
  String get signalSessions => 'הפעלות Signal';

  @override
  String get signalSessionsDetail => 'הפעלות הצפנה';

  @override
  String get pendingContacts => 'אנשי קשר ממתינים';

  @override
  String get pendingContactsDetail => 'בקשות ממתינות';

  @override
  String get callHistory => 'שיחות';

  @override
  String get callHistoryDetail => 'היסטוריית שיחות';

  @override
  String get preferences => 'העדפות';

  @override
  String get preferencesDetail => 'העדפות מדיה ושיחות';

  @override
  String get avatars => 'אווטארים';

  @override
  String get media => 'מדיה';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קבצים',
      one: 'קובץ אחד',
      zero: 'אין קבצים',
    );
    return '$_temp0';
  }

  @override
  String get active => 'פעיל';

  @override
  String get notDefined => 'לא מוגדר';

  @override
  String get biometrics => 'ביומטריה';

  @override
  String get recoveryPhrase => 'ביטוי שחזור';

  @override
  String get identity => 'זהות (Hash ID)';

  @override
  String get signalKeys => 'מפתחות Signal Protocol';

  @override
  String get authTokens => 'אסימוני אימות';

  @override
  String get contactNamesCache => 'מטמון שמות אנשי קשר';

  @override
  String get remoteConfig => 'תצורה מרחוק';

  @override
  String get notificationPrefs => 'העדפות התראות';

  @override
  String get serverData => 'נתוני שרת';

  @override
  String get serverDataInfo =>
      'Hash שומר מינימום נתונים בשרת, כולם מוצפנים או זמניים.';

  @override
  String get serverProfile => 'פרופיל';

  @override
  String get serverProfileDetail => 'Hash ID, מפתחות ציבוריים, אסימון תיבה';

  @override
  String get serverPrekeys => 'מפתחות מקדימים';

  @override
  String get serverPrekeysDetail => 'מפתחות Signal חד-פעמיים (נצרכו)';

  @override
  String get serverMessages => 'הודעות במעבר';

  @override
  String get serverMessagesDetail => 'נמחקות אחרי מסירה (24 שעות מקס\')';

  @override
  String get serverMedia => 'מדיה במעבר';

  @override
  String get serverMediaDetail => 'נמחקת אחרי הורדה';

  @override
  String get serverContactRequests => 'בקשות אנשי קשר';

  @override
  String get serverContactRequestsDetail => 'פגות אחרי 24 שעות';

  @override
  String get serverRateLimits => 'הגבלות קצב';

  @override
  String get serverRateLimitsDetail => 'נתונים זמניים למניעת ניצול';

  @override
  String get privacyReassurance =>
      'Hash לא יכול לקרוא את ההודעות שלך. כל הנתונים מוצפנים מקצה לקצה. נתוני השרת נמחקים אוטומטית.';

  @override
  String get pinTooSimple => 'ה-PIN הזה פשוט מדי. בחר קוד מאובטח יותר.';

  @override
  String get genericError => 'אירעה שגיאה. אנא נסה שוב.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'לא ניתן ליצור חשבון: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'הביטוי הועתק ללוח';

  @override
  String get copyPhrase => 'העתק ביטוי';

  @override
  String get recoveryPhraseSecurityWarning =>
      'רשום ביטוי זה במקום בטוח. אם תאבד את ה-PIN בלי ביטוי זה, תאבד לצמיתות גישה לנתונים שלך.';

  @override
  String get noMessages => 'אין הודעות';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'למחוק את כל ההודעות עם $name?';
  }

  @override
  String get confirmation => 'אישור';

  @override
  String get untitled => 'ללא כותרת';

  @override
  String get noSessions => 'אין הפעלות';

  @override
  String get unknownContact => 'איש קשר לא ידוע';

  @override
  String get unnamed => 'ללא שם';

  @override
  String get noPendingRequestsAlt => 'אין בקשות ממתינות';

  @override
  String get deleteAllCallHistory => 'למחוק את כל היסטוריית השיחות?';

  @override
  String get noCalls => 'אין שיחות';

  @override
  String get noPreferences => 'אין העדפות';

  @override
  String get resetAllMediaPrefs => 'לאפס את כל העדפות המדיה?';

  @override
  String get deleteThisAvatar => 'למחוק אווטאר זה?';

  @override
  String get deleteAllAvatars => 'למחוק את כל האווטארים?';

  @override
  String get noAvatars => 'אין אווטארים';

  @override
  String get deleteThisFile => 'למחוק קובץ זה?';

  @override
  String get deleteAllMediaFiles => 'למחוק את כל המדיה?';

  @override
  String get noMediaFiles => 'אין מדיה';

  @override
  String get outgoing => 'יוצא';

  @override
  String get incoming => 'נכנס';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'תצוגה חולפת: $secondsש\'';
  }

  @override
  String get normalView => 'תצוגה רגילה';

  @override
  String get callReasonCompleted => 'הושלמה';

  @override
  String get callReasonMissed => 'לא נענתה';

  @override
  String get callReasonDeclined => 'נדחתה';

  @override
  String get callReasonFailed => 'נכשלה';

  @override
  String get justNow => 'עכשיו';

  @override
  String timeAgoMinutes(int count) {
    return 'לפני $count דקות';
  }

  @override
  String timeAgoHours(int count) {
    return 'לפני $count שעות';
  }

  @override
  String timeAgoDays(int count) {
    return 'לפני $count ימים';
  }

  @override
  String get messageTypeContact => 'איש קשר';

  @override
  String get messageTypeLocation => 'מיקום';

  @override
  String get statusQueued => 'בתור';

  @override
  String get blockedBadge => 'חסום';

  @override
  String get protectedBadge => 'מוגן';

  @override
  String messageCount(int count) {
    return '$count הודעות';
  }

  @override
  String get deleteQuestion => 'למחוק?';

  @override
  String get transferMyAccountTitle => 'העבר את החשבון שלי';

  @override
  String get loadingError => 'שגיאת טעינה';

  @override
  String get transferToNewDevice => 'העבר למכשיר חדש';

  @override
  String get transferInstructions =>
      'במכשיר החדש שלך, בחר \"שחזר את החשבון שלי\" והכנס מידע זה:';

  @override
  String get yourHashIdLabel => 'ה-Hash ID שלך';

  @override
  String get enterYourPinCode => 'הכנס את קוד ה-PIN שלך';

  @override
  String get pinOwnerConfirmation => 'כדי לאשר שאתה בעל חשבון זה';

  @override
  String get scanThisQrCode => 'סרוק קוד QR זה';

  @override
  String get withYourNewDevice => 'עם המכשיר החדש שלך';

  @override
  String get orEnterTheCode => 'או הכנס את הקוד';

  @override
  String get transferCodeLabel => 'קוד העברה';

  @override
  String get proximityVerification => 'אימות קרבה';

  @override
  String get bringDevicesCloser => 'קרב את שני המכשירים';

  @override
  String get confirmTransferQuestion => 'לאשר את ההעברה?';

  @override
  String get accountWillBeTransferred =>
      'החשבון שלך יועבר למכשיר החדש.\n\nמכשיר זה ינותק לצמיתות.';

  @override
  String get transferComplete => 'ההעברה הושלמה';

  @override
  String get transferSuccessMessage =>
      'החשבון שלך הועבר בהצלחה.\n\nאפליקציה זו תיסגר כעת.';

  @override
  String get manualVerification => 'אימות ידני';

  @override
  String get codeDisplayedOnBothDevices => 'קוד המוצג בשני המכשירים:';

  @override
  String get doesCodeMatchNewDevice => 'האם קוד זה תואם לזה שבמכשיר החדש?';

  @override
  String get verifiedStatus => 'מאומת';

  @override
  String get inProgressStatus => 'בתהליך...';

  @override
  String get notAvailableStatus => 'לא זמין';

  @override
  String get codeExpiredRestart => 'הקוד פג. אנא התחל מחדש.';

  @override
  String get codesDoNotMatchCancelled => 'הקודים אינם תואמים. ההעברה בוטלה.';

  @override
  String transferToDevice(String device) {
    return 'אל: $device';
  }

  @override
  String get copiedExclamation => 'הועתק!';

  @override
  String expiresInTime(String time) {
    return 'יפוג בעוד $time';
  }

  @override
  String get biometricNotAvailable => 'ביומטריה אינה זמינה במכשיר זה';

  @override
  String get biometricAuthError => 'שגיאה באימות ביומטרי';

  @override
  String get authenticateForBiometric => 'אנא אמת כדי להפעיל ביומטריה';

  @override
  String get biometricAuthFailed => 'אימות ביומטרי נכשל';

  @override
  String get forceUpdateTitle => 'נדרש עדכון';

  @override
  String get forceUpdateMessage =>
      'גרסה חדשה של Hash זמינה. אנא עדכן כדי להמשיך.';

  @override
  String get updateButton => 'עדכן';

  @override
  String get maintenanceInProgress => 'תחזוקה בתהליך';

  @override
  String get tryAgainLater => 'אנא נסה שוב מאוחר יותר';

  @override
  String get information => 'מידע';

  @override
  String get later => 'מאוחר יותר';

  @override
  String get doYouLikeHash => 'אתה אוהב את Hash?';

  @override
  String get yourFeedbackHelps => 'המשוב שלך עוזר לנו לשפר את האפליקציה';

  @override
  String get ratingTerrible => 'נורא';

  @override
  String get ratingBad => 'רע';

  @override
  String get ratingOk => 'בסדר';

  @override
  String get ratingGood => 'טוב';

  @override
  String get ratingExcellent => 'מצוין!';

  @override
  String get donationMessage =>
      'Hash הוא פרויקט ללא מטרות רווח. התמיכה שלך עוזרת לנו להמשיך לבנות מסנג\'ר פרטי באמת.';

  @override
  String get recentConnections => 'חיבורים אחרונים';

  @override
  String get loginInfoText =>
      'כל פתיחה עם PIN נרשמת מקומית. רק 24 השעות האחרונות נשמרות.';

  @override
  String get connectionCount => 'חיבורים';

  @override
  String get periodLabel => 'תקופה';

  @override
  String get historyLabel => 'היסטוריה';

  @override
  String get noLoginRecorded => 'לא נרשמה כניסה';

  @override
  String get nextUnlocksAppearHere => 'פתיחות הבאות יופיעו כאן.';

  @override
  String get dataLocalOnly =>
      'נתונים אלה מאוחסנים רק במכשיר שלך ואינם מועברים לעולם.';

  @override
  String get currentSession => 'נוכחי';

  @override
  String get todayLabel => 'היום';

  @override
  String get yesterdayLabel => 'אתמול';

  @override
  String get justNowLabel => 'עכשיו';

  @override
  String minutesAgoLabel(int count) {
    return 'לפני $count דקות';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'לפני $hours שעות';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'לפני $hours שעות ו-$minutes דקות';
  }

  @override
  String get noMaintenancePlanned => 'אין תחזוקה מתוכננת';

  @override
  String get everythingWorkingNormally => 'הכל עובד כרגיל';

  @override
  String get maintenanceTitle => 'תחזוקה';

  @override
  String get maintenanceActiveLabel => 'בתהליך';

  @override
  String get maintenancePlannedLabel => 'מתוכנן';

  @override
  String get locking => 'נועל...';

  @override
  String get newMessageNotification => 'הודעה חדשה';

  @override
  String get secExplainTitle => 'כיצד Hash מגן עליך';

  @override
  String get secExplainIntro =>
      'Hash תוכנן כך שאף אחד לא יוכל לקרוא את ההודעות שלך.';

  @override
  String get secExplainIntroSub =>
      'אפילו לא אנחנו.\nהנה איך זה עובד, מוסבר בפשטות.';

  @override
  String get secJourneyLabel => 'המסע';

  @override
  String get secJourneyTitle => 'המסע של ההודעה שלך';

  @override
  String get secJourneySubtitle =>
      'מהאצבע שלך ועד למסך של איש הקשר שלך, כל שלב מוגן. עקוב אחר הנתיב.';

  @override
  String get secStep1Title => 'אתה כותב את ההודעה שלך';

  @override
  String get secStep1Desc =>
      'אתה מקליד \"שלום!\" באפליקציה. ברגע זה, ההודעה קיימת רק בזיכרון הטלפון שלך. שום דבר לא נשלח.';

  @override
  String get secStep2Title => 'הצפנה עם Signal Protocol';

  @override
  String get secStep2Desc =>
      'ברגע שאתה לוחץ \"שלח\", ההודעה שלך מומרת לרצף תווים בלתי מובנים. זה כאילו ההודעה שלך ננעלה בכספת שרק לאיש הקשר שלך יש את המפתח אליה.';

  @override
  String get secStep3Title => 'Sealed Sender: המעטפה הבלתי נראית';

  @override
  String get secStep3Desc =>
      'דמיין שאתה שולח מכתב בדואר, אבל בלי כתובת חוזרת על המעטפה. זה בדיוק מה ש-Hash עושה. ההודעה מופקדת בתיבת דואר אנונימית. השרת לא יודע מי שלח אותה.';

  @override
  String get secStep4Title => 'השרת לא רואה כלום';

  @override
  String get secStep4Desc =>
      'השרת פועל כדוור עיוור. הוא רק יודע \"מישהו הפקיד משהו בתיבה #A7X9\". הוא לא יודע מי שלח, מה זה, או למי זה מיועד.';

  @override
  String get secStep4Highlight =>
      'לא נשמרים מטא-נתונים: לא כתובת IP, לא חותמת זמן, לא קשר בין שולח לנמען.';

  @override
  String get secStep5Title => 'איש הקשר שלך מקבל את ההודעה';

  @override
  String get secStep5Desc =>
      'הטלפון של איש הקשר שלך מושך את התוכן מתיבת הדואר האנונימית שלו ומפענח את ההודעה עם המפתח הפרטי שלו, שמעולם לא עזב את מכשירו. \"שלום!\" מופיע על המסך שלו.';

  @override
  String get secStep6Title => 'ההודעה נעלמת מהשרת';

  @override
  String get secStep6Desc =>
      'ברגע שאיש הקשר שלך מאשר קבלה, השרת מוחק לצמיתות את ההודעה. לא פח אשפה, לא ארכיון, לא גיבוי. גם הודעות שלא נקראו נהרסות אוטומטית אחרי 24 שעות.';

  @override
  String get secStep7Title => 'תפוגה מקומית';

  @override
  String get secStep7Desc =>
      'בטלפון של איש הקשר שלך, ההודעה מתרסקת בעצמה בהתאם למשך שבחרת: מיד אחרי קריאה, 5 דקות, שעה... אתה מחליט.';

  @override
  String get secJourneyConclusion =>
      'תוצאה: אפס עקבות בשרת, אפס עקבות במכשירים. ההודעה התקיימה רק מספיק זמן כדי להיקרא, ואז נעלמה.';

  @override
  String get secArchLabel => 'ארכיטקטורה';

  @override
  String get secArchTitle => '5 שכבות הגנה';

  @override
  String get secArchSubtitle =>
      'Hash לא מסתמך על טכנולוגיה אחת. כל שכבה מחזקת את האחרות. גם אם שכבה אחת נפרצת, הנתונים שלך נשארים בטוחים.';

  @override
  String get secLayer1Title => 'הצפנה מקצה לקצה';

  @override
  String get secLayer1Desc =>
      'כל הודעה מוצפנת במפתח ייחודי. בפשטות: גם אם מישהו מפענח הודעה אחת, הוא לא יוכל לפענח את הבאה. לכל הודעה יש מנעול משלה.';

  @override
  String get secLayer1Detail =>
      'עבור קבצים (תמונות, סרטונים, מסמכים), Hash משתמש בהצפנת AES-256-GCM נוספת. הקובץ מוצפן לפני שהוא עוזב את הטלפון שלך.';

  @override
  String get secLayer2Title => 'Sealed Sender (אנונימיות רשת)';

  @override
  String get secLayer2Desc =>
      'מסנג\'רים רגילים שולחים את ההודעות שלך עם הזהות שלך מצורפת. זה כמו לכתוב את שמך על המעטפה. Hash משתמש בתיבות דואר אנונימיות: השרת מוסר את ההודעה בלי לדעת מי שלח אותה.';

  @override
  String get secLayer2Detail =>
      'תוצאה: גם במקרה של דליפת נתונים מהשרת, בלתי אפשרי לשחזר מי מדבר עם מי.';

  @override
  String get secLayer3Title => 'מחיקה אוטומטית';

  @override
  String get secLayer3Desc =>
      'הודעות נמחקות מהשרת ברגע שהקבלה אושרה. גם אם הודעה מעולם לא נמשכה, היא נהרסת אוטומטית אחרי 24 שעות.';

  @override
  String get secLayer3Detail =>
      'בטלפון שלך, הודעות מתרסקות בעצמן בהתאם למשך שתבחר: מיד, 5 דק\', 15 דק\', 30 דק\', שעה, 3 שעות, 6 שעות, או 12 שעות.';

  @override
  String get secLayer4Title => 'הגנת גישה מקומית';

  @override
  String get secLayer4Desc =>
      'האפליקציה מוגנת בקוד PIN בן 6 ספרות ו/או ביומטריה (Face ID, טביעת אצבע). אחרי יותר מדי ניסיונות כושלים, האפליקציה ננעלת עם השהיה שגדלה אחרי כל כישלון.';

  @override
  String get secLayer5Title => 'מסד נתונים נעול';

  @override
  String get secLayer5Desc =>
      'בצד השרת, שום משתמש לא יכול לכתוב ישירות למסד הנתונים. כל הפעולות עוברות דרך פונקציות מאובטחות שמאמתות כל בקשה.';

  @override
  String get secLayer5Detail =>
      'זה כמו דלפק בנק: אתה אף פעם לא נוגע בכספת בעצמך. אתה מגיש בקשה, והמערכת בודקת שיש לך הרשאה לפני שהיא פועלת.';

  @override
  String get secVashLabel => 'ייחודי בעולם';

  @override
  String get secVashTitle => 'מצב Vash';

  @override
  String get secVashSubtitle =>
      'מערכת אבטחת חירום שלא קיימת באף אפליקציית מסרים אחרת.';

  @override
  String get secVashScenarioTitle => 'דמיין את המצב הזה';

  @override
  String get secVashScenario1 => 'מישהו ניגש לטלפון שלך';

  @override
  String get secVashScenario2 => 'מבקשים ממך את קוד ה-PIN';

  @override
  String get secVashScenario3 => 'אתה רוצה למחוק את כל הנתונים שלך בדחיפות';

  @override
  String get secVashSolutionTitle => 'הפתרון: שני קודי PIN';

  @override
  String get secVashSolutionDesc => 'אתה מגדיר שני קודי PIN שונים ב-Hash:';

  @override
  String get secVashNormalCodeLabel => 'קוד רגיל';

  @override
  String get secVashNormalCodeDesc =>
      'פותח את האפליקציה כרגיל עם כל הנתונים שלך';

  @override
  String get secVashCodeLabel2 => 'קוד Vash';

  @override
  String get secVashCodeDescription =>
      'פותח את האפליקציה כרגיל... אבל כל הנתונים שלך נמחקים בשקט ברקע';

  @override
  String get secVashWhatHappensTitle => 'מה קורה אחרי';

  @override
  String get secVashWhatHappensDesc =>
      'האפליקציה נפתחת כרגיל. ללא התראה, ללא אנימציה חשודה. המסך פשוט מציג אפליקציה ריקה, כאילו רק התקנת אותה.\n\nבמציאות, כל השיחות, אנשי הקשר וההודעות שלך נמחקו באופן בלתי הפיך בשבריר שנייה.';

  @override
  String get secCallsLabel => 'שיחות וקבצים';

  @override
  String get secCallsTitle => 'הכל מוצפן';

  @override
  String get secCallsSubtitle =>
      'לא רק הודעות. הכל שעובר דרך Hash מוצפן מקצה לקצה.';

  @override
  String get secAudioCallTitle => 'שיחות קוליות';

  @override
  String get secAudioCallDesc =>
      'מוצפנות מקצה לקצה דרך WebRTC. הקול מועבר ישירות בין המכשירים.';

  @override
  String get secVideoCallTitle => 'שיחות וידאו';

  @override
  String get secVideoCallDesc => 'אותה טכנולוגיה, כל זרם מוצפן בנפרד.';

  @override
  String get secPhotosTitle => 'תמונות וסרטונים';

  @override
  String get secPhotosDesc =>
      'מוצפנים ב-AES-256-GCM לפני שהם עוזבים את הטלפון שלך.';

  @override
  String get secDocsTitle => 'מסמכים';

  @override
  String get secDocsDesc => 'PDF, ZIP, כל קובץ. שם, גודל ותוכן מוצפנים.';

  @override
  String get secAnonLabel => 'אנונימיות';

  @override
  String get secAnonTitle => 'לא נדרש זיהוי';

  @override
  String get secAnonSubtitle =>
      'Hash לעולם לא מבקש את מספר הטלפון או האימייל שלך. אתה מזוהה באמצעות Hash ID ייחודי ואנונימי.';

  @override
  String get secHashIdTitle => 'ה-Hash ID שלך';

  @override
  String get secHashIdDesc =>
      'זהו המזהה הייחודי שלך. הוא לא חושף שום דבר עליך: לא השם שלך, לא המספר שלך, לא המיקום שלך. זה כמו כינוי שבלתי אפשרי לקשר לזהות האמיתית שלך.\n\nכדי להוסיף איש קשר, אתה משתף את ה-Hash ID שלך או סורק קוד QR. זהו. לא ספר כתובות מסונכרן, לא הצעות \"אנשים שאתה אולי מכיר\".';

  @override
  String get secDataLabel => 'נתונים';

  @override
  String get secDataTitle => 'מה Hash לא יודע';

  @override
  String get secDataSubtitle =>
      'הדרך הטובה ביותר להגן על הנתונים שלך היא לא לאסוף אותם.';

  @override
  String get secNeverCollected => 'אף פעם לא נאסף';

  @override
  String get secNeverItem1 => 'תוכן הודעות';

  @override
  String get secNeverItem2 => 'רשימת אנשי קשר';

  @override
  String get secNeverItem3 => 'מספר טלפון';

  @override
  String get secNeverItem4 => 'כתובת אימייל';

  @override
  String get secNeverItem5 => 'כתובת IP';

  @override
  String get secNeverItem6 => 'מיקום';

  @override
  String get secNeverItem7 => 'מטא-נתונים (מי מדבר עם מי)';

  @override
  String get secNeverItem8 => 'היסטוריית שיחות';

  @override
  String get secNeverItem9 => 'ספר כתובות';

  @override
  String get secNeverItem10 => 'מזהי פרסום';

  @override
  String get secTempStored => 'מאוחסן זמנית';

  @override
  String get secTempItem1 => 'Hash ID אנונימי (מזהה ייחודי)';

  @override
  String get secTempItem2 => 'מפתחות הצפנה ציבוריים';

  @override
  String get secTempItem3 => 'הודעות מוצפנות במעבר (24 שעות מקס\')';

  @override
  String get secTempNote =>
      'גם הנתונים המינימליים האלה לא יכולים לזהות אותך. ה-Hash ID שלך אינו מקושר לשום מידע אישי.';

  @override
  String get secFooterTitle => 'הפרטיות שלך, החופש שלך';

  @override
  String get secFooterDesc =>
      'Hash משתמש באותן טכנולוגיות הצפנה כמו האפליקציות המקצועיות המחמירות ביותר. ההודעות שלך מוגנות על ידי מתמטיקה, לא על ידי הבטחות.';

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
