// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'ნულოვანი კვალი. ნულოვანი კომპრომისი.';

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
  String get conversations => 'ჩატები';

  @override
  String get contacts => 'კონტაქტები';

  @override
  String get noConversation => 'ჩატები არ არის';

  @override
  String get noConversationSubtitle =>
      'დაამატეთ კონტაქტი უსაფრთხო მიმოწერის დასაწყებად';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count მოლოდინის მოთხოვნა',
      one: '1 მოლოდინის მოთხოვნა',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count გაგზავნილი მოთხოვნა მოლოდინში',
      one: '1 გაგზავნილი მოთხოვნა მოლოდინში',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'კონტაქტის დამატება';

  @override
  String get shareApp => 'აპის გაზიარება';

  @override
  String get newMessage => 'ახალი შეტყობინება';

  @override
  String get newConversation => 'შეტყობინების გაგზავნა';

  @override
  String get settings => 'პარამეტრები';

  @override
  String get myHashId => 'ჩემი Hash ID';

  @override
  String get supportHash => 'Hash-ის მხარდაჭერა';

  @override
  String get supportHashSubtitle => 'Hash არაკომერციული პროექტია';

  @override
  String get donate => 'შემოწირულობა';

  @override
  String get appearance => 'გარეგნობა';

  @override
  String get theme => 'თემა';

  @override
  String get themeAuto => 'ავტომატური';

  @override
  String get themeAutoSubtitle => 'სისტემის პარამეტრებს მიჰყვება';

  @override
  String get themeDark => 'მუქი';

  @override
  String get themeLight => 'ნათელი';

  @override
  String get themeRecommendation =>
      'მუქი თემა რეკომენდებულია უკეთესი კონფიდენციალურობისთვის';

  @override
  String get language => 'ენა';

  @override
  String get languageAuto => 'ავტომატური (სისტემა)';

  @override
  String get notifications => 'შეტყობინებები';

  @override
  String get messages => 'შეტყობინებები';

  @override
  String get calls => 'ზარები';

  @override
  String get vibration => 'ვიბრაცია';

  @override
  String get notificationContent => 'შეტყობინების შინაარსი';

  @override
  String get notificationContentFull => 'ყველაფრის ჩვენება';

  @override
  String get notificationContentFullDesc =>
      'კონტაქტის სახელი და შეტყობინების გადახედვა';

  @override
  String get notificationContentName => 'მხოლოდ სახელი';

  @override
  String get notificationContentNameDesc => 'მხოლოდ კონტაქტის სახელს აჩვენებს';

  @override
  String get notificationContentDiscrete => 'დისკრეტული';

  @override
  String get notificationContentDiscreteDesc =>
      'მხოლოდ \"ახალი შეტყობინება\" აჩვენებს';

  @override
  String get security => 'უსაფრთხოება';

  @override
  String get howHashProtectsYou => 'როგორ გიცავთ Hash';

  @override
  String get howHashProtectsYouSubtitle => 'გაიგეთ თქვენი უსაფრთხოების შესახებ';

  @override
  String get accountSecurity => 'ანგარიშის უსაფრთხოება';

  @override
  String get accountSecuritySubtitle => 'PIN, ბიომეტრია, Vash რეჟიმი';

  @override
  String get blockScreenshots => 'ეკრანის ანაბეჭდების დაბლოკვა';

  @override
  String get transferDevice => 'სხვა მოწყობილობაზე გადატანა';

  @override
  String get transferDeviceSubtitle => 'ანგარიშის მიგრაცია';

  @override
  String get pinCode => 'PIN კოდი';

  @override
  String get changePin => 'PIN კოდის შეცვლა';

  @override
  String get currentPin => 'მიმდინარე PIN კოდი';

  @override
  String get newPin => 'ახალი PIN კოდი';

  @override
  String get confirmPin => 'PIN კოდის დადასტურება';

  @override
  String get pinChanged => 'PIN კოდი შეიცვალა';

  @override
  String get incorrectPin => 'არასწორი PIN';

  @override
  String get pinsDoNotMatch => 'PIN-ები არ ემთხვევა';

  @override
  String get autoLock => 'ავტო-ჩაკეტვა';

  @override
  String get autoLockDelay => 'ჩაკეტვის დაყოვნება';

  @override
  String get autoLockImmediate => 'დაუყოვნებლივ';

  @override
  String get autoLockMinute => '1 წუთი';

  @override
  String autoLockMinutes(int count) {
    return '$count წუთი';
  }

  @override
  String get vashCode => 'Vash კოდი';

  @override
  String get vashModeTitle => 'Vash რეჟიმი';

  @override
  String get vashModeExplanation => 'თქვენი საბოლოო უსაფრთხოების ქსელი.';

  @override
  String get vashModeDescription =>
      'თქვენ აირჩევთ მეორე PIN კოდს. თუ ოდესმე აიძულებენ Hash-ის გახსნას, შეიყვანეთ ეს კოდი ჩვეულებრივი PIN-ის ნაცვლად.\n\nაპი ჩვეულებრივად გაიხსნება, მაგრამ ყველა თქვენი საუბარი და კონტაქტი გაქრება.\n\nნებისმიერი ადამიანისთვის, ვინც თქვენს ეკრანს შეხედავს, Hash უბრალოდ ცარიელი გამოჩნდება — თითქოს არასოდეს გამოგეყენებინათ.';

  @override
  String get vashModeIrreversible => 'ეს მოქმედება ჩუმია და შეუქცევადი.';

  @override
  String get chooseVashCode => 'Vash კოდის არჩევა';

  @override
  String get vashCodeInfo =>
      'მეორე PIN კოდი, რომელიც აპს ჩვეულებრივად ხსნის, მაგრამ ცარიელს.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'თუ ამ კოდს შეიყვანთ PIN-ის ნაცვლად:';

  @override
  String get vashDeleteContacts => 'თქვენი კონტაქტები გაქრება';

  @override
  String get vashDeleteMessages => 'თქვენი საუბრები გაქრება';

  @override
  String get vashDeleteHistory => 'თქვენი ჩანაწერები გაქრება';

  @override
  String get vashKeepId => 'თქვენი Hash იდენტობა (#XXX-XXX-XXX) იგივე რჩება';

  @override
  String get vashAppearNormal =>
      'აპი ჩვეულებრივად გამოიყურება, მაგრამ ცარიელია, როგორც ახალი. ეს მოქმედება შეუქცევადია.';

  @override
  String get setupVashCode => 'Vash კოდის დაყენება';

  @override
  String get modifyVashCode => 'Vash კოდის შეცვლა';

  @override
  String get currentVashCode => 'მიმდინარე Vash კოდი';

  @override
  String get newVashCode => 'ახალი Vash კოდი';

  @override
  String get confirmVashCode => 'Vash კოდის დადასტურება';

  @override
  String get vashCodeConfigured => 'Vash კოდი დაყენებულია';

  @override
  String get vashCodeModified => 'Vash კოდი შეცვლილია';

  @override
  String get vashCodeMustDiffer =>
      'Vash კოდი PIN-ისგან განსხვავებული უნდა იყოს';

  @override
  String get incorrectVashCode => 'არასწორი Vash კოდი';

  @override
  String get vashWhatToDelete => 'რა უნდა გააქროს Vash რეჟიმმა?';

  @override
  String get vashDeleteContactsOption => 'კონტაქტები';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'შეტყობინებები';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'ჩანაწერები';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash რეჟიმი გააქტიურებულია';

  @override
  String get vashCreateSubtitle =>
      'აირჩიეთ ძირითადი PIN-ისგან განსხვავებული კოდი';

  @override
  String get vashConfirmSubtitle => 'დაადასტურეთ თქვენი Vash კოდი';

  @override
  String get pinCodeForEntry => 'PIN კოდი აპში შესასვლელად';

  @override
  String get vashCodeSection => 'Vash რეჟიმი';

  @override
  String get biometric => 'ბიომეტრია';

  @override
  String get biometricUnlock => 'თითის ანაბეჭდით ან Face ID-ით განბლოკვა';

  @override
  String get enableBiometric => 'ბიომეტრიის ჩართვა';

  @override
  String get biometricWarningMessage =>
      'ბიომეტრიის ჩართვით, ვერ შეძლებთ Vash კოდის გამოყენებას აპში შესასვლელად.\n\nVash კოდის გამოყენება შესაძლებელი იქნება მხოლოდ ბიომეტრიის წარუმატებლობის შემთხვევაში (რამდენიმე წარუმატებელი მცდელობის შემდეგ).\n\nდარწმუნებული ხართ, რომ გსურთ გაგრძელება?';

  @override
  String get understood => 'გავიგე';

  @override
  String get shareAppSubtitle => 'გაუზიარეთ Hash ახლობლებს';

  @override
  String get share => 'გაზიარება';

  @override
  String get danger => 'საფრთხე';

  @override
  String get deleteAccount => 'ჩემი ანგარიშის წაშლა';

  @override
  String get deleteAccountSubtitle => 'შეუქცევადი მოქმედება';

  @override
  String get deleteAccountConfirmTitle => 'ჩემი ანგარიშის წაშლა';

  @override
  String get deleteAccountConfirmMessage =>
      'თქვენი ანგარიში სამუდამოდ წაიშლება. ეს მოქმედება შეუქცევადია.\n\n• ყველა თქვენი ჩატი\n• ყველა თქვენი კონტაქტი\n• თქვენი Hash ID\n\nახალი ანგარიშის შექმნა დაგჭირდებათ.';

  @override
  String get deleteForever => 'სამუდამოდ წაშლა';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash რეჟიმი გააქტიურებულია.';

  @override
  String deletionError(String error) {
    return 'წაშლის შეცდომა: $error';
  }

  @override
  String get yourSecurity => 'თქვენი უსაფრთხოება';

  @override
  String get securityInfo =>
      '• ბოლოდან ბოლომდე დაშიფვრა (Signal Protocol)\n• მონაცემები არ რჩება ჩვენს სერვერებზე მიწოდების შემდეგ\n• გასაღებები მხოლოდ თქვენს მოწყობილობაზეა შენახული\n• PIN კოდი არასოდეს იგზავნება სერვერზე';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'მოგესალმებით';

  @override
  String get securityStatement1 => 'თქვენი შეტყობინებები დაცულია.';

  @override
  String get securityStatement2 => 'ბოლოდან ბოლომდე დაშიფვრა.';

  @override
  String get securityStatement3 => 'კვალი არ არის. კომპრომისი არ არის.';

  @override
  String get securityStatement4 => 'თქვენი კონფიდენციალურობა უფლებაა.';

  @override
  String get accessBlocked => 'წვდომა დაბლოკილია';

  @override
  String get tooManyAttempts => 'ძალიან ბევრი მცდელობა. სცადეთ მოგვიანებით.';

  @override
  String get pleaseWait => 'გთხოვთ დაელოდეთ';

  @override
  String get waitDelay => 'გთხოვთ დაელოდეთ დაყოვნების დასრულებას';

  @override
  String attemptCount(int current, int max) {
    return 'მცდელობა $current / $max';
  }

  @override
  String retryIn(String time) {
    return 'ხელახლა ცდა $time-ში';
  }

  @override
  String get forgotPin => 'დაგავიწყდათ PIN? გამოიყენეთ აღდგენის ფრაზა';

  @override
  String get useRecoveryPhrase => 'აღდგენის ფრაზის გამოყენება';

  @override
  String get recoveryWarningTitle => 'გაფრთხილება';

  @override
  String get recoveryWarningMessage => 'ანგარიშის აღდგენა:';

  @override
  String get recoveryDeleteAllMessages => 'წაშლის ყველა თქვენს შეტყობინებას';

  @override
  String get recoveryWaitDelay => 'საჭიროებს 1 საათიან დაყოვნებას';

  @override
  String get recoveryKeepContacts => 'შეინარჩუნებს თქვენს კონტაქტებს';

  @override
  String get recoveryIrreversible =>
      'ეს მოქმედება შეუქცევადია. თქვენი შეტყობინებები სამუდამოდ დაიკარგება.';

  @override
  String get iUnderstand => 'მესმის';

  @override
  String get accountRecovery => 'ანგარიშის აღდგენა';

  @override
  String get enterRecoveryPhrase =>
      'შეიყვანეთ თქვენი აღდგენის ფრაზის 24 სიტყვა, გამოყოფილი სივრცეებით.';

  @override
  String get recoveryPhraseHint => 'სიტყვა1 სიტყვა2 სიტყვა3 ...';

  @override
  String get recover => 'აღდგენა';

  @override
  String get recoveryPhraseRequired => 'გთხოვთ შეიყვანეთ აღდგენის ფრაზა';

  @override
  String get recoveryPhrase24Words => 'ფრაზა ზუსტად 24 სიტყვას უნდა შეიცავდეს';

  @override
  String get incorrectRecoveryPhrase => 'არასწორი აღდგენის ფრაზა';

  @override
  String get recoveryInitError => 'აღდგენის ინიციალიზაციის შეცდომა';

  @override
  String get securityDelay => 'უსაფრთხოების დაყოვნება';

  @override
  String get securityDelayMessage =>
      'თქვენი უსაფრთხოებისთვის, ახალი PIN-ის შექმნამდე ლოდინის პერიოდია საჭირო.';

  @override
  String get timeRemaining => 'დარჩენილი დრო';

  @override
  String get messagesDeletedForProtection =>
      'თქვენი შეტყობინებები წაშლილია თქვენი დაცვისთვის.';

  @override
  String get canCloseApp => 'შეგიძლიათ დახუროთ აპი და მოგვიანებით დაბრუნდეთ.';

  @override
  String get onboardingTitle1 => 'მოგესალმებით Hash-ში';

  @override
  String get onboardingSubtitle1 => 'მესენჯერი, რომელიც კვალს არ ტოვებს';

  @override
  String get onboardingTitle2 => 'სრული დაშიფვრა';

  @override
  String get onboardingSubtitle2 =>
      'თქვენი შეტყობინებები ბოლოდან ბოლომდე დაშიფრულია Signal პროტოკოლით';

  @override
  String get onboardingTitle3 => 'კვალი არ არის';

  @override
  String get onboardingSubtitle3 =>
      'შეტყობინებები სერვერებიდან იშლება მიწოდების შემდეგ';

  @override
  String get onboardingTitle4 => 'თქვენი უსაფრთხოება';

  @override
  String get onboardingSubtitle4 => 'PIN კოდი, Vash რეჟიმი და აღდგენის ფრაზა';

  @override
  String get getStarted => 'დაწყება';

  @override
  String get next => 'შემდეგი';

  @override
  String get skip => 'გამოტოვება';

  @override
  String get alreadyHaveAccount => 'უკვე მაქვს ანგარიში';

  @override
  String get transferMyAccount => 'ჩემი ანგარიშის გადატანა';

  @override
  String get createPin => 'PIN კოდის შექმნა';

  @override
  String get createPinSubtitle => 'ეს კოდი დაიცავს თქვენი აპის წვდომას';

  @override
  String get confirmYourPin => 'დაადასტურეთ PIN კოდი';

  @override
  String get confirmPinSubtitle => 'კვლავ შეიყვანეთ PIN კოდი';

  @override
  String get saveRecoveryPhrase => 'აღდგენის ფრაზა';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'ჩაწერეთ ეს 24 სიტყვა თანმიმდევრობით. ისინი საშუალებას მოგცემთ აღადგინოთ ანგარიში, თუ PIN-ს დაივიწყებთ.';

  @override
  String get phraseWritten => 'ჩავწერე ჩემი ფრაზა';

  @override
  String get warningRecoveryPhrase =>
      'თუ დაკარგავთ ამ ფრაზას და დაივიწყებთ PIN-ს, დაკარგავთ ანგარიშზე წვდომას.';

  @override
  String get accountTransferred => 'ანგარიში გადატანილია';

  @override
  String get accountTransferredMessage =>
      'თქვენი ანგარიში სხვა მოწყობილობაზე გადატანილია. ეს სესია აღარ არის ძალაში.';

  @override
  String get accountTransferredInfo =>
      'თუ თქვენ არ წამოიწყეთ ეს გადატანა, თქვენი ანგარიში შესაძლოა კომპრომეტირებული იყოს.';

  @override
  String get logout => 'გამოსვლა';

  @override
  String get transferAccount => 'ანგარიშის გადატანა';

  @override
  String get transferAccountInfo =>
      'გადაიტანეთ თქვენი Hash ანგარიში ახალ მოწყობილობაზე. თქვენი მიმდინარე სესია გაუქმდება.';

  @override
  String get generateTransferCode => 'გადატანის კოდის გენერაცია';

  @override
  String get transferCode => 'გადატანის კოდი';

  @override
  String transferCodeExpires(int minutes) {
    return 'ეს კოდი ვადას გაუვა $minutes წუთში';
  }

  @override
  String get enterCodeOnNewDevice =>
      'შეიყვანეთ ეს კოდი ახალ მოწყობილობაზე ანგარიშის გადასატანად.';

  @override
  String get generateNewCode => 'ახალი კოდის გენერაცია';

  @override
  String get scanQrCode => 'QR code-ის სკანირება';

  @override
  String get scanQrCodeSubtitle => 'დაასკანერეთ კონტაქტის QR code დასამატებლად';

  @override
  String get qrCodeDetected => 'QR code აღმოჩენილია';

  @override
  String get invalidQrCode => 'არასწორი QR code';

  @override
  String get cameraPermissionRequired => 'კამერის ნებართვა საჭიროა';

  @override
  String get myQrCode => 'ჩემი QR code';

  @override
  String get myQrCodeSubtitle =>
      'გააზიარეთ ეს QR code, რომ კონტაქტებმა შეძლონ თქვენი დამატება';

  @override
  String get shareQrCode => 'გაზიარება';

  @override
  String get addContactTitle => 'კონტაქტის დამატება';

  @override
  String get addContactByHashId => 'შეიყვანეთ კონტაქტის Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'ძიება';

  @override
  String get contactNotFound => 'კონტაქტი ვერ მოიძებნა';

  @override
  String get contactAlreadyAdded => 'ეს კონტაქტი უკვე თქვენს სიაშია';

  @override
  String get contactAdded => 'კონტაქტი დამატებულია';

  @override
  String get myProfile => 'ჩემი პროფილი';

  @override
  String get myProfileSubtitle =>
      'გააზიარეთ ეს ინფორმაცია, რომ სხვებმა შეძლონ თქვენი დამატება';

  @override
  String get temporaryCode => 'დროებითი კოდი';

  @override
  String temporaryCodeExpires(String time) {
    return 'ვადა გაუვა $time-ში';
  }

  @override
  String get codeExpired => 'კოდის ვადა გასულია';

  @override
  String get generateNewCodeButton => 'ახალი კოდი';

  @override
  String get copyHashId => 'ID-ის კოპირება';

  @override
  String get copyCode => 'კოდის კოპირება';

  @override
  String get copiedToClipboard => 'კოპირებულია';

  @override
  String get showMyQrCode => 'ჩემი QR code-ის ჩვენება';

  @override
  String get orDivider => 'ან';

  @override
  String get openScanner => 'სკანერის გახსნა';

  @override
  String get addManually => 'ხელით დამატება';

  @override
  String get contactHashIdLabel => 'კონტაქტის Hash ID';

  @override
  String get temporaryCodeLabel => 'დროებითი კოდი';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'სთხოვეთ კონტაქტს კოდის გენერაცია თავისი პროფილიდან';

  @override
  String get verifyAndAdd => 'შემოწმება და დამატება';

  @override
  String get fillAllFields => 'გთხოვთ შეავსეთ ყველა ველი';

  @override
  String get invalidHashIdFormat => 'არასწორი ID ფორმატი (მაგ.: 123-456-ABC)';

  @override
  String get userNotFound => 'მომხმარებელი ვერ მოიძებნა';

  @override
  String get cannotAddYourself => 'საკუთარი თავის დამატება არ შეგიძლიათ';

  @override
  String get invalidOrExpiredCode => 'არასწორი ან ვადაგასული დროებითი კოდი';

  @override
  String get contactFound => 'კონტაქტი ნაპოვნია!';

  @override
  String get howToCallContact => 'როგორ გსურთ მათ დაუძახოთ?';

  @override
  String get contactNameHint => 'კონტაქტის სახელი';

  @override
  String get addContactButton => 'დამატება';

  @override
  String get contactDetails => 'კონტაქტის დეტალები';

  @override
  String get contactName => 'კონტაქტის სახელი';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'დამატებულია $date';
  }

  @override
  String get deleteContact => 'კონტაქტის წაშლა';

  @override
  String deleteContactConfirm(Object name) {
    return 'წაიშალოს ეს კონტაქტი?';
  }

  @override
  String get deleteContactMessage => 'ეს ასევე წაშლის მთელ ჩატს.';

  @override
  String get delete => 'წაშლა';

  @override
  String get typeMessage => 'შეიყვანეთ შეტყობინება...';

  @override
  String get messageSent => 'გაგზავნილია';

  @override
  String get messageDelivered => 'მიწოდებულია';

  @override
  String get messageRead => 'წაკითხულია';

  @override
  String get messageFailed => 'გაგზავნა ვერ მოხერხდა';

  @override
  String get now => 'ახლა';

  @override
  String minutesAgo(int count) {
    return '$countწთ';
  }

  @override
  String hoursAgo(int count) {
    return '$countსთ';
  }

  @override
  String daysAgo(int count) {
    return '$countდ';
  }

  @override
  String get today => 'დღეს';

  @override
  String get yesterday => 'გუშინ';

  @override
  String dateAtTime(String date, String time) {
    return '$date, $time';
  }

  @override
  String get shareMessage =>
      'შემოგვიერთდი Hash-ში! 🔒\n\nეს ნამდვილად კონფიდენციალური მესენჯერია: სრული დაშიფვრა, სერვერებზე კვალი არ რჩება და პანიკის რეჟიმი საჭიროებისამებრ.\n\nჩამოტვირთეთ აპი აქ 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'შეცდომა';

  @override
  String get ok => 'კარგი';

  @override
  String get view => 'ნახვა';

  @override
  String get yes => 'დიახ';

  @override
  String get no => 'არა';

  @override
  String get save => 'შენახვა';

  @override
  String get edit => 'რედაქტირება';

  @override
  String get close => 'დახურვა';

  @override
  String get confirm => 'დადასტურება';

  @override
  String get loading => 'იტვირთება...';

  @override
  String get retry => 'ხელახლა ცდა';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'მოლოდინის მოთხოვნები';

  @override
  String get noPendingRequests => 'მოლოდინის მოთხოვნები არ არის';

  @override
  String get pendingRequestsSubtitle => 'ეს ადამიანები გსურთ თქვენს დამატებას';

  @override
  String requestFromUser(String hashId) {
    return 'მოთხოვნა $hashId-დან';
  }

  @override
  String requestExpiresIn(int days) {
    return 'ვადა გაუვა $days დღეში';
  }

  @override
  String get acceptRequest => 'მიღება';

  @override
  String get rejectRequest => 'უარყოფა';

  @override
  String get requestAccepted => 'მოთხოვნა მიღებულია';

  @override
  String get requestRejected => 'მოთხოვნა უარყოფილია';

  @override
  String get requestSent => 'მოთხოვნა გაგზავნილია!';

  @override
  String get requestSentSubtitle =>
      'თქვენი მოთხოვნა გაგზავნილია. მომხმარებელმა უნდა მიიღოს სანამ ჩატს დაიწყებთ.';

  @override
  String get requestAlreadyPending => 'მოთხოვნა უკვე მოლოდინშია';

  @override
  String get requestAlreadySentByOther =>
      'ამ ადამიანმა უკვე გამოგიგზავნათ მოთხოვნა';

  @override
  String get addByHashId => 'Hash ID-ით დამატება';

  @override
  String get addByHashIdSubtitle =>
      'შეიყვანეთ კონტაქტის Hash ID და დროებითი კოდი';

  @override
  String get enterTemporaryCode => 'შეიყვანეთ 6-ციფრიანი კოდი';

  @override
  String get sendRequest => 'მოთხოვნის გაგზავნა';

  @override
  String get acceptContactTitle => 'კონტაქტის მიღება';

  @override
  String get acceptContactSubtitle => 'შეგიძლიათ მისცეთ მორგებული სახელი';

  @override
  String get leaveEmptyForHashId => 'დატოვეთ ცარიელი Hash ID-ის გამოსაყენებლად';

  @override
  String get firstName => 'სახელი';

  @override
  String get lastName => 'გვარი';

  @override
  String get notes => 'ჩანაწერები';

  @override
  String get notesHint => 'პირადი ჩანაწერები ამ კონტაქტის შესახებ';

  @override
  String get photoOptional => 'ფოტო (არასავალდებულო)';

  @override
  String get contactNameOptional => 'სახელი (არასავალდებულო)';

  @override
  String get notesOptional => 'ჩანაწერები (არასავალდებულო)';

  @override
  String get storedLocally => 'მხოლოდ თქვენს მოწყობილობაზეა შენახული';

  @override
  String get encryptedMessageLabel => 'დაშიფრული შეტყობინება';

  @override
  String get identityMessageHint => 'ვინ ხართ? როგორ იცნობთ ერთმანეთს?';

  @override
  String get messageWillBeSentEncrypted =>
      'ეს შეტყობინება დაშიფრული გაეგზავნება მიმღებს';

  @override
  String get sendRequestButton => 'მოთხოვნის გაგზავნა';

  @override
  String get requestExpiresIn24h =>
      'მოთხოვნა ვადას გაუვა 24სთ-ში, თუ არ მიიღეს';

  @override
  String get theyAlreadySentYouRequest =>
      'ამ ადამიანმა უკვე გამოგიგზავნათ მოთხოვნა';

  @override
  String get requests => 'მოთხოვნები';

  @override
  String get receivedRequests => 'მიღებული';

  @override
  String get sentRequests => 'გაგზავნილი';

  @override
  String get noSentRequests => 'გაგზავნილი მოთხოვნები არ არის';

  @override
  String get cancelRequest => 'გაუქმება';

  @override
  String get deleteRequest => 'მოთხოვნის წაშლა';

  @override
  String get requestCancelled => 'მოთხოვნა გაუქმებულია';

  @override
  String sentTo(String hashId) {
    return 'გაგზავნილია $hashId-ზე';
  }

  @override
  String expiresIn(String time) {
    return 'ვადა გაუვა $time-ში';
  }

  @override
  String receivedAgo(String time) {
    return 'მიღებულია $time-ის წინ';
  }

  @override
  String get messageFromRequester => 'შეტყობინება მომთხოვნისგან';

  @override
  String get copy => 'კოპირება';

  @override
  String get messageInfo => 'შეტყობინების ინფორმაცია';

  @override
  String get messageDirection => 'მიმართულება';

  @override
  String get messageSentByYou => 'თქვენ გაგზავნეთ';

  @override
  String get messageReceived => 'მიღებული';

  @override
  String get messageSentAt => 'გაგზავნილია';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'სტატუსი';

  @override
  String get messageReadAt => 'წაკითხულია';

  @override
  String get messageType => 'ტიპი';

  @override
  String get messageSize => 'ზომა';

  @override
  String get messageExpiresAt => 'ვადა ეწურება';

  @override
  String get messageEncrypted => 'ბოლოდან ბოლომდე დაშიფრული';

  @override
  String get messageStatusSending => 'იგზავნება...';

  @override
  String get messageStatusSent => 'გაგზავნილია';

  @override
  String get messageStatusDelivered => 'მიწოდებულია';

  @override
  String get messageStatusRead => 'წაკითხულია';

  @override
  String get messageStatusFailed => 'ვერ მოხერხდა';

  @override
  String get serverStatus => 'სერვერი';

  @override
  String get onServer => 'მიწოდების მოლოდინში';

  @override
  String get deletedFromServer => 'წაშლილია';

  @override
  String get messageTypeText => 'ტექსტი';

  @override
  String get messageTypeImage => 'სურათი';

  @override
  String get messageTypeVideo => 'ვიდეო';

  @override
  String get messageTypeVoice => 'ხმოვანი';

  @override
  String get messageTypeFile => 'ფაილი';

  @override
  String get indefinitely => 'უვადოდ';

  @override
  String get hoursShort => 'სთ';

  @override
  String get minutesShort => 'წთ';

  @override
  String get hours => 'საათი';

  @override
  String get minutes => 'წუთი';

  @override
  String get seconds => 'წამი';

  @override
  String get ephemeralMessages => 'ეფემერული შეტყობინებები';

  @override
  String get ephemeralMessagesDescription =>
      'შეტყობინებები ავტომატურად იშლება ამ დროის შემდეგ';

  @override
  String get ephemeralImmediate => 'დაუყოვნებლივ (წაკითხვის შემდეგ)';

  @override
  String get ephemeralImmediateDesc => 'წაკითხვისთანავე იშლება';

  @override
  String get ephemeralMyPreference => 'ჩემი პრეფერენცია';

  @override
  String get ephemeralMyPreferenceDesc => 'გლობალური პარამეტრის გამოყენება';

  @override
  String get ephemeralDefaultSetting => 'შეტყობინების ხანგრძლივობა';

  @override
  String get ephemeralChooseDefault => 'რეკომენდებული';

  @override
  String get ephemeral30Seconds => '30 წამი';

  @override
  String get ephemeral30SecondsDesc => 'წაშლილი 30წმ წაკითხვის შემდეგ';

  @override
  String get ephemeral5Minutes => '5 წუთი';

  @override
  String get ephemeral5MinutesDesc => 'წაშლილი 5წთ წაკითხვის შემდეგ';

  @override
  String get ephemeral1Hour => '1 საათი';

  @override
  String get ephemeral1HourDesc => 'წაშლილი 1სთ წაკითხვის შემდეგ';

  @override
  String get ephemeral3Hours => '3 საათი';

  @override
  String get ephemeral6Hours => '6 საათი';

  @override
  String get ephemeral6HoursDesc => 'წაშლილი 6სთ წაკითხვის შემდეგ';

  @override
  String get ephemeral12Hours => '12 საათი';

  @override
  String get ephemeral24Hours => '24 საათი';

  @override
  String get ephemeral24HoursDesc => 'წაშლილი 24სთ წაკითხვის შემდეგ';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'მორგებული ხანგრძლივობა';

  @override
  String get howItWorks => 'როგორ მუშაობს';

  @override
  String get ephemeralExplanation1 =>
      'შეტყობინებები სერვერიდან იშლება მიღებისთანავე.';

  @override
  String get ephemeralExplanation2 =>
      'ეს პარამეტრი განსაზღვრავს, როდის გაქრება შეტყობინებები თქვენი ტელეფონიდან წაკითხვის შემდეგ.';

  @override
  String get ephemeralExplanation3 =>
      'თქვენს კონტაქტს აქვს საკუთარი პარამეტრი თავისი ტელეფონისთვის.';

  @override
  String get mute1Hour => '1 საათი';

  @override
  String get mute8Hours => '8 საათი';

  @override
  String get mute1Day => '1 დღე';

  @override
  String get mute1Week => '1 კვირა';

  @override
  String get muteAlways => 'ყოველთვის';

  @override
  String get muteExplanation => 'ამ კონტაქტის შეტყობინებებს აღარ მიიღებთ';

  @override
  String get showCallsInRecents => 'ბოლო ზარებში ჩვენება';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash ზარები ტელეფონის ისტორიაში ჩანს';

  @override
  String get feedback => 'გამოხმაურება';

  @override
  String get muteNotifications => 'შეტყობინებების დადუმება';

  @override
  String get muteDescription => 'ამ კონტაქტის შეტყობინებებს აღარ მიიღებთ';

  @override
  String mutedUntil(String time) {
    return 'დადუმებულია $time-მდე';
  }

  @override
  String get notMuted => 'შეტყობინებები ჩართულია';

  @override
  String get unmute => 'ხმის ჩართვა';

  @override
  String get notificationSound => 'შეტყობინების ხმა';

  @override
  String get defaultSound => 'ნაგულისხმევი';

  @override
  String get chatSettings => 'ჩატის პარამეტრები';

  @override
  String get bubbleColor => 'ბუშტის ფერი';

  @override
  String get backgroundColor => 'ფონის ფერი';

  @override
  String get backgroundImage => 'ფონის სურათი';

  @override
  String get chatBackground => 'ჩატის ფონი';

  @override
  String get customColor => 'მორგებული';

  @override
  String get defaultColor => 'ნაგულისხმევი';

  @override
  String get imageSelected => 'სურათი არჩეულია';

  @override
  String get noImage => 'სურათი არ არის';

  @override
  String get color => 'ფერი';

  @override
  String get image => 'სურათი';

  @override
  String get tapToSelectImage => 'შეხებით აირჩიეთ სურათი';

  @override
  String get changeImage => 'სურათის შეცვლა';

  @override
  String get previewMessageReceived => 'გამარჯობა!';

  @override
  String get previewMessageSent => 'გამარჯობა!';

  @override
  String get messageAction => 'შეტყობინება';

  @override
  String get callAction => 'ზარი';

  @override
  String get videoAction => 'ვიდეო';

  @override
  String get personalNotes => 'პირადი ჩანაწერები';

  @override
  String get addNotes => 'ჩანაწერების დამატება...';

  @override
  String get noNotes => 'ჩანაწერები არ არის';

  @override
  String get messageNotifications => 'შეტყობინებების ნოტიფიკაციები';

  @override
  String get callNotifications => 'ზარის ნოტიფიკაციები';

  @override
  String get useGradient => 'გრადიენტის გამოყენება';

  @override
  String get gradientStart => 'საწყისი ფერი';

  @override
  String get gradientEnd => 'საბოლოო ფერი';

  @override
  String get preview => 'გადახედვა';

  @override
  String get reset => 'გადატვირთვა';

  @override
  String get securityNumber => 'უსაფრთხოების ნომერი';

  @override
  String securityNumberDescription(String name) {
    return 'შეამოწმეთ, რომ უსაფრთხოების ნომერი ემთხვევა $name-ის მოწყობილობას';
  }

  @override
  String get verifyEncryption => 'ბოლოდან ბოლომდე დაშიფვრის შემოწმება';

  @override
  String get tapToCopy => 'შეხებით კოპირება';

  @override
  String get howToVerify => 'როგორ შევამოწმოთ';

  @override
  String get verifyStep1 => 'პირადად შეხვდით კონტაქტს ან დაურეკეთ';

  @override
  String get verifyStep2 =>
      'შეადარეთ უსაფრთხოების ნომრები ან დაასკანერეთ QR code-ები';

  @override
  String get verifyStep3 => 'თუ ემთხვევა, თქვენი ჩატი უსაფრთხოა';

  @override
  String get scanToVerify => 'სკანირება შესამოწმებლად';

  @override
  String get reportSpam => 'სპამის შეტყობინება';

  @override
  String get reportSpamSubtitle => 'ამ კონტაქტის სპამად შეტყობინება';

  @override
  String get reportSpamDescription =>
      'ეს ანონიმურად შეატყობინებს ამ კონტაქტის შესახებ. თქვენი ვინაობა არ გაზიარდება. დარწმუნებული ხართ?';

  @override
  String get report => 'შეტყობინება';

  @override
  String get spamReported => 'სპამი შეტყობინებულია';

  @override
  String get reportError =>
      'შეტყობინების გაგზავნა ვერ მოხერხდა. გთხოვთ სცადეთ ხელახლა.';

  @override
  String get reportRateLimited =>
      'თქვენ მიაღწიეთ დღის მაქსიმალურ შეტყობინებების რაოდენობას.';

  @override
  String get blockContact => 'კონტაქტის დაბლოკვა';

  @override
  String get blockContactDescription =>
      'ეს კონტაქტი ვეღარ შეძლებს შეტყობინებების გაგზავნას ან ზარს. არ ეცნობება.';

  @override
  String get unblockContact => 'კონტაქტის განბლოკვა';

  @override
  String get unblockContactDescription =>
      'ეს კონტაქტი კვლავ შეძლებს შეტყობინებების გაგზავნას და ზარს.';

  @override
  String get contactBlocked => 'კონტაქტი დაბლოკილია';

  @override
  String get contactUnblocked => 'კონტაქტი განბლოკილია';

  @override
  String get contactIsBlocked => 'ეს კონტაქტი დაბლოკილია';

  @override
  String get unblock => 'განბლოკვა';

  @override
  String get deleteContactSubtitle => 'კონტაქტის და ჩატის წაშლა';

  @override
  String get confirmWithPin => 'PIN-ით დადასტურება';

  @override
  String get enterPinToConfirm => 'შეიყვანეთ PIN ამ მოქმედების დასადასტურებლად';

  @override
  String get profilePhoto => 'პროფილის ფოტო';

  @override
  String get takePhoto => 'ფოტოს გადაღება';

  @override
  String get chooseFromGallery => 'გალერიიდან არჩევა';

  @override
  String get removePhoto => 'ფოტოს წაშლა';

  @override
  String get viewContactHashId => 'კონტაქტის იდენტიფიკატორის ნახვა';

  @override
  String get hashIdPartiallyMasked =>
      'ნაწილობრივ დაფარულია თქვენი უსაფრთხოებისა და კონტაქტის კონფიდენციალურობისთვის';

  @override
  String get addFirstContact => 'დაამატეთ პირველი კონტაქტი';

  @override
  String get addFirstContactSubtitle =>
      'გააზიარეთ QR code ან დაასკანერეთ მეგობრის';

  @override
  String get directory => 'დირექტორია';

  @override
  String get noContacts => 'კონტაქტები არ არის';

  @override
  String get noContactsSubtitle => 'დასაწყებად დაამატეთ კონტაქტი';

  @override
  String get sendMessageAction => 'შეტყობინების გაგზავნა';

  @override
  String get audioCall => 'აუდიო ზარი';

  @override
  String get videoCall => 'ვიდეო ზარი';

  @override
  String get viewProfile => 'პროფილის ნახვა';

  @override
  String get deleteContactDirectory => 'კონტაქტის წაშლა';

  @override
  String get scanShort => 'სკანირება';

  @override
  String get addShort => 'დამატება';

  @override
  String deleteContactConfirmName(String name) {
    return 'ნამდვილად გსურთ $name-ის წაშლა?';
  }

  @override
  String get noNotesTitle => 'ჩანაწერები არ არის';

  @override
  String get noNotesSubtitle => 'შექმენით პირველი ჩანაწერი';

  @override
  String get newNote => 'ახალი ჩანაწერი';

  @override
  String get editNote => 'ჩანაწერის რედაქტირება';

  @override
  String get deleteNote => 'ჩანაწერის წაშლა';

  @override
  String get deleteNoteConfirm => 'ნამდვილად გსურთ ამ ჩანაწერის წაშლა?';

  @override
  String get noteTitle => 'სათაური';

  @override
  String get noteContent => 'შინაარსი';

  @override
  String get addItem => 'ელემენტის დამატება';

  @override
  String get pinNote => 'მიმაგრება';

  @override
  String get unpinNote => 'მოხსნა';

  @override
  String get noteColor => 'ფერი';

  @override
  String get notePassword => 'პაროლი';

  @override
  String get setPassword => 'პაროლის დაყენება';

  @override
  String get changePassword => 'პაროლის შეცვლა';

  @override
  String get removePassword => 'პაროლის წაშლა';

  @override
  String get enterPassword => 'პაროლის შეყვანა';

  @override
  String get confirmPassword => 'პაროლის დადასტურება';

  @override
  String get passwordPin => 'PIN კოდი';

  @override
  String get passwordText => 'ტექსტური პაროლი';

  @override
  String get protectedNote => 'დაცული ჩანაწერი';

  @override
  String get incorrectPassword => 'არასწორი პაროლი';

  @override
  String get passwordSet => 'პაროლი დაყენებულია';

  @override
  String get passwordRemoved => 'პაროლი წაშლილია';

  @override
  String get notesBiometric => 'Face ID ჩანაწერებისთვის';

  @override
  String get notesBiometricSubtitle =>
      'ბიომეტრიული ავთენტიფიკაციის მოთხოვნა დაცული ჩანაწერების გასახსნელად';

  @override
  String get textNote => 'ტექსტური ჩანაწერი';

  @override
  String get checklistNote => 'ჩამონათვალი';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total ამოცანა';
  }

  @override
  String get autoSaved => 'შენახულია';

  @override
  String get searchNotes => 'ჩანაწერების ძიება';

  @override
  String get legalConsent => 'იურიდიული თანხმობა';

  @override
  String get confirmAge13 => 'ვადასტურებ, რომ სულ მცირე 13 წლის ვარ';

  @override
  String get acceptLegalStart => 'ვეთანხმები ';

  @override
  String get privacyPolicy => 'კონფიდენციალურობის პოლიტიკას';

  @override
  String get termsOfService => 'მომსახურების პირობებს';

  @override
  String get andThe => ' და ';

  @override
  String get continueButton => 'გაგრძელება';

  @override
  String get mustAcceptTerms => 'გასაგრძელებლად ორივე პირობას უნდა დაეთანხმოთ';

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
  String get support => 'მხარდაჭერა';

  @override
  String get contactSupport => 'მხარდაჭერასთან დაკავშირება';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'ბოროტად გამოყენების შეტყობინება';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'იურიდიული';

  @override
  String get legalEntity => 'იურიდიული პირი';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'მიმაგრება';

  @override
  String get unpinConversation => 'მოხსნა';

  @override
  String get hideConversation => 'ფიდიდან წაშლა';

  @override
  String get deleteConversation => 'საუბრის წაშლა';

  @override
  String get deleteConversationConfirm =>
      'შეიყვანეთ PIN ყველა შეტყობინების წაშლის დასადასტურებლად';

  @override
  String get noConversations => 'საუბრები ჯერ არ არის';

  @override
  String get startConversation => 'დაწყება';

  @override
  String get microphonePermissionRequired => 'მიკროფონზე წვდომა საჭიროა';

  @override
  String get microphonePermissionExplanation =>
      'Hash-ს ზარებისთვის მიკროფონი სჭირდება.';

  @override
  String get cameraPermissionExplanation =>
      'Hash-ს ვიდეო ზარებისთვის კამერა სჭირდება.';

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
  String get openSettings => 'პარამეტრების გახსნა';

  @override
  String get callConnecting => 'დაკავშირება...';

  @override
  String get callRinging => 'რეკავს...';

  @override
  String get callReconnecting => 'ხელახალი დაკავშირება...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'ხელახალი დაკავშირება ($secondsწმ)';
  }

  @override
  String get callPaused => 'შეჩერებულია';

  @override
  String get callPausedSubtitle => 'ზარი ჯერ კიდევ აქტიურია';

  @override
  String get callRemoteMicMuted => 'კონტაქტის მიკროფონი დადუმებულია';

  @override
  String get callMiniControlsMute => 'დადუმება';

  @override
  String get callMiniControlsUnmute => 'ხმის ჩართვა';

  @override
  String get callMiniControlsHangUp => 'დახურვა';

  @override
  String get callMiniControlsReturn => 'ზარზე დაბრუნება';

  @override
  String get callNetworkPoor => 'არასტაბილური კავშირი';

  @override
  String get callNetworkLost => 'კავშირი დაიკარგა';

  @override
  String get callEndedTitle => 'ზარი დასრულდა';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'მოწყობილობის მონაცემები';

  @override
  String get deviceDataSubtitle => 'ლოკალური და სერვერის საცავი';

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
  String get localStorage => 'ლოკალური საცავი';

  @override
  String get onThisDevice => 'ამ მოწყობილობაზე';

  @override
  String get encryptedDatabases => 'დაშიფრული ბაზები';

  @override
  String get files => 'ფაილები';

  @override
  String get secureKeychain => 'უსაფრთხო გასაღებების ჯაჭვი';

  @override
  String get cache => 'ქეში';

  @override
  String get contactsDetail => 'სახელები, ავატარები, Signal გასაღებები';

  @override
  String get messagesDetail => 'დაშიფრული საუბრები';

  @override
  String get notesDetail => 'პირადი ჩანაწერები';

  @override
  String get signalSessions => 'Signal სესიები';

  @override
  String get signalSessionsDetail => 'დაშიფვრის სესიები';

  @override
  String get pendingContacts => 'მოლოდინის კონტაქტები';

  @override
  String get pendingContactsDetail => 'მოლოდინის მოთხოვნები';

  @override
  String get callHistory => 'ზარები';

  @override
  String get callHistoryDetail => 'ზარების ისტორია';

  @override
  String get preferences => 'პრეფერენციები';

  @override
  String get preferencesDetail => 'მედიის და ზარის პრეფერენციები';

  @override
  String get avatars => 'ავატარები';

  @override
  String get media => 'მედია';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ფაილი',
      one: '1 ფაილი',
      zero: 'ფაილები არ არის',
    );
    return '$_temp0';
  }

  @override
  String get active => 'აქტიური';

  @override
  String get notDefined => 'განუსაზღვრელი';

  @override
  String get biometrics => 'ბიომეტრია';

  @override
  String get recoveryPhrase => 'აღდგენის ფრაზა';

  @override
  String get identity => 'იდენტობა (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol გასაღებები';

  @override
  String get authTokens => 'ავთენტიფიკაციის ტოკენები';

  @override
  String get contactNamesCache => 'კონტაქტების სახელების ქეში';

  @override
  String get remoteConfig => 'დისტანციური კონფიგურაცია';

  @override
  String get notificationPrefs => 'შეტყობინებების პრეფერენციები';

  @override
  String get serverData => 'სერვერის მონაცემები';

  @override
  String get serverDataInfo =>
      'Hash სერვერზე მინიმალურ მონაცემებს ინახავს, ყველა დაშიფრული ან დროებითი.';

  @override
  String get serverProfile => 'პროფილი';

  @override
  String get serverProfileDetail =>
      'Hash ID, საჯარო გასაღებები, საფოსტო ყუთის ტოკენი';

  @override
  String get serverPrekeys => 'წინასწარი გასაღებები';

  @override
  String get serverPrekeysDetail => 'ერთჯერადი Signal გასაღებები (მოხმარებული)';

  @override
  String get serverMessages => 'ტრანზიტში მყოფი შეტყობინებები';

  @override
  String get serverMessagesDetail => 'იშლება მიწოდების შემდეგ (მაქს. 24სთ)';

  @override
  String get serverMedia => 'ტრანზიტში მყოფი მედია';

  @override
  String get serverMediaDetail => 'იშლება ჩამოტვირთვის შემდეგ';

  @override
  String get serverContactRequests => 'კონტაქტის მოთხოვნები';

  @override
  String get serverContactRequestsDetail => 'ვადა გაუვა 24 საათში';

  @override
  String get serverRateLimits => 'სიჩქარის ლიმიტები';

  @override
  String get serverRateLimitsDetail =>
      'დროებითი ანტი-ბოროტად გამოყენების მონაცემები';

  @override
  String get privacyReassurance =>
      'Hash ვერ წაიკითხავს თქვენს შეტყობინებებს. ყველა მონაცემი ბოლოდან ბოლომდე დაშიფრულია. სერვერის მონაცემები ავტომატურად იშლება.';

  @override
  String get pinTooSimple =>
      'ეს PIN ძალიან მარტივია. აირჩიეთ უფრო უსაფრთხო კოდი.';

  @override
  String get genericError => 'მოხდა შეცდომა. გთხოვთ სცადეთ ხელახლა.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'ანგარიშის შექმნა ვერ მოხერხდა: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'ფრაზა კოპირებულია ბუფერში';

  @override
  String get copyPhrase => 'ფრაზის კოპირება';

  @override
  String get recoveryPhraseSecurityWarning =>
      'ჩაწერეთ ეს ფრაზა უსაფრთხო ადგილას. თუ დაკარგავთ PIN-ს ამ ფრაზის გარეშე, სამუდამოდ დაკარგავთ წვდომას თქვენს მონაცემებზე.';

  @override
  String get noMessages => 'შეტყობინებები არ არის';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'წაიშალოს ყველა შეტყობინება $name-თან?';
  }

  @override
  String get confirmation => 'დადასტურება';

  @override
  String get untitled => 'უსათაურო';

  @override
  String get noSessions => 'სესიები არ არის';

  @override
  String get unknownContact => 'უცნობი კონტაქტი';

  @override
  String get unnamed => 'უსახელო';

  @override
  String get noPendingRequestsAlt => 'მოლოდინის მოთხოვნები არ არის';

  @override
  String get deleteAllCallHistory => 'წაიშალოს ზარების ისტორია?';

  @override
  String get noCalls => 'ზარები არ არის';

  @override
  String get noPreferences => 'პრეფერენციები არ არის';

  @override
  String get resetAllMediaPrefs => 'გადაიტვირთოს ყველა მედიის პარამეტრი?';

  @override
  String get deleteThisAvatar => 'წაიშალოს ეს ავატარი?';

  @override
  String get deleteAllAvatars => 'წაიშალოს ყველა ავატარი?';

  @override
  String get noAvatars => 'ავატარები არ არის';

  @override
  String get deleteThisFile => 'წაიშალოს ეს ფაილი?';

  @override
  String get deleteAllMediaFiles => 'წაიშალოს ყველა მედია?';

  @override
  String get noMediaFiles => 'მედია არ არის';

  @override
  String get outgoing => 'გამავალი';

  @override
  String get incoming => 'შემომავალი';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'ეფემერული ნახვა: $secondsწმ';
  }

  @override
  String get normalView => 'ჩვეულებრივი ნახვა';

  @override
  String get callReasonCompleted => 'დასრულებული';

  @override
  String get callReasonMissed => 'გამოტოვებული';

  @override
  String get callReasonDeclined => 'უარყოფილი';

  @override
  String get callReasonFailed => 'ვერ მოხერხდა';

  @override
  String get justNow => 'ახლახანს';

  @override
  String timeAgoMinutes(int count) {
    return '$count წთ-ის წინ';
  }

  @override
  String timeAgoHours(int count) {
    return '$countსთ-ის წინ';
  }

  @override
  String timeAgoDays(int count) {
    return '$countდ-ის წინ';
  }

  @override
  String get messageTypeContact => 'კონტაქტი';

  @override
  String get messageTypeLocation => 'მდებარეობა';

  @override
  String get statusQueued => 'რიგში';

  @override
  String get blockedBadge => 'დაბლოკილი';

  @override
  String get protectedBadge => 'დაცული';

  @override
  String messageCount(int count) {
    return '$count შეტყობინება';
  }

  @override
  String get deleteQuestion => 'წაიშალოს?';

  @override
  String get transferMyAccountTitle => 'ჩემი ანგარიშის გადატანა';

  @override
  String get loadingError => 'ჩატვირთვის შეცდომა';

  @override
  String get transferToNewDevice => 'ახალ მოწყობილობაზე გადატანა';

  @override
  String get transferInstructions =>
      'ახალ მოწყობილობაზე აირჩიეთ \"ჩემი ანგარიშის აღდგენა\" და შეიყვანეთ ეს ინფორმაცია:';

  @override
  String get yourHashIdLabel => 'თქვენი Hash ID';

  @override
  String get enterYourPinCode => 'შეიყვანეთ PIN კოდი';

  @override
  String get pinOwnerConfirmation =>
      'იმის დასადასტურებლად, რომ ამ ანგარიშის მფლობელი ხართ';

  @override
  String get scanThisQrCode => 'დაასკანერეთ ეს QR code';

  @override
  String get withYourNewDevice => 'ახალი მოწყობილობით';

  @override
  String get orEnterTheCode => 'ან შეიყვანეთ კოდი';

  @override
  String get transferCodeLabel => 'გადატანის კოდი';

  @override
  String get proximityVerification => 'სიახლოვის შემოწმება';

  @override
  String get bringDevicesCloser => 'მიუახლოვეთ ორივე მოწყობილობა';

  @override
  String get confirmTransferQuestion => 'დადასტურდეს გადატანა?';

  @override
  String get accountWillBeTransferred =>
      'თქვენი ანგარიში ახალ მოწყობილობაზე გადაიტანება.\n\nეს მოწყობილობა სამუდამოდ გაითიშება.';

  @override
  String get transferComplete => 'გადატანა დასრულებულია';

  @override
  String get transferSuccessMessage =>
      'თქვენი ანგარიში წარმატებით გადაიტანა.\n\nეს აპლიკაცია ახლა დაიხურება.';

  @override
  String get manualVerification => 'ხელით შემოწმება';

  @override
  String get codeDisplayedOnBothDevices =>
      'ორივე მოწყობილობაზე ნაჩვენები კოდი:';

  @override
  String get doesCodeMatchNewDevice =>
      'ემთხვევა ეს კოდი ახალ მოწყობილობაზე ნაჩვენებს?';

  @override
  String get verifiedStatus => 'შემოწმებულია';

  @override
  String get inProgressStatus => 'მიმდინარეობს...';

  @override
  String get notAvailableStatus => 'მიუწვდომელია';

  @override
  String get codeExpiredRestart => 'კოდს ვადა გაუვა. გთხოვთ დაიწყეთ თავიდან.';

  @override
  String get codesDoNotMatchCancelled =>
      'კოდები არ ემთხვევა. გადატანა გაუქმებულია.';

  @override
  String transferToDevice(String device) {
    return 'მიმღები: $device';
  }

  @override
  String get copiedExclamation => 'კოპირებულია!';

  @override
  String expiresInTime(String time) {
    return 'ვადა გაუვა $time-ში';
  }

  @override
  String get biometricNotAvailable => 'ბიომეტრია ამ მოწყობილობაზე მიუწვდომელია';

  @override
  String get biometricAuthError => 'ბიომეტრიული ავთენტიფიკაციის შეცდომა';

  @override
  String get authenticateForBiometric =>
      'გთხოვთ გაიარეთ ავთენტიფიკაცია ბიომეტრიის ჩასართავად';

  @override
  String get biometricAuthFailed => 'ბიომეტრიული ავთენტიფიკაცია ვერ მოხერხდა';

  @override
  String get forceUpdateTitle => 'განახლება საჭიროა';

  @override
  String get forceUpdateMessage =>
      'Hash-ის ახალი ვერსია ხელმისაწვდომია. გთხოვთ განაახლეთ გასაგრძელებლად.';

  @override
  String get updateButton => 'განახლება';

  @override
  String get maintenanceInProgress => 'ტექნიკური მომსახურება მიმდინარეობს';

  @override
  String get tryAgainLater => 'გთხოვთ სცადეთ მოგვიანებით';

  @override
  String get information => 'ინფორმაცია';

  @override
  String get later => 'მოგვიანებით';

  @override
  String get doYouLikeHash => 'მოგწონთ Hash?';

  @override
  String get yourFeedbackHelps =>
      'თქვენი გამოხმაურება გვეხმარება აპის გაუმჯობესებაში';

  @override
  String get ratingTerrible => 'საშინელი';

  @override
  String get ratingBad => 'ცუდი';

  @override
  String get ratingOk => 'ნორმალური';

  @override
  String get ratingGood => 'კარგი';

  @override
  String get ratingExcellent => 'შესანიშნავი!';

  @override
  String get donationMessage =>
      'Hash არაკომერციული პროექტია. თქვენი მხარდაჭერა გვეხმარება ნამდვილად კონფიდენციალური მესენჯერის შექმნაში.';

  @override
  String get recentConnections => 'ბოლო კავშირები';

  @override
  String get loginInfoText =>
      'ყოველი PIN-ით განბლოკვა ლოკალურად ფიქსირდება. მხოლოდ ბოლო 24 საათი ინახება.';

  @override
  String get connectionCount => 'კავშირ(ებ)ი';

  @override
  String get periodLabel => 'პერიოდი';

  @override
  String get historyLabel => 'ისტორია';

  @override
  String get noLoginRecorded => 'შესვლა არ არის ჩაწერილი';

  @override
  String get nextUnlocksAppearHere => 'შემდეგი განბლოკვები აქ გამოჩნდება.';

  @override
  String get dataLocalOnly =>
      'ეს მონაცემები ინახება მხოლოდ თქვენს მოწყობილობაზე და არასდროს გადაიცემა.';

  @override
  String get currentSession => 'მიმდინარე';

  @override
  String get todayLabel => 'დღეს';

  @override
  String get yesterdayLabel => 'გუშინ';

  @override
  String get justNowLabel => 'ახლახანს';

  @override
  String minutesAgoLabel(int count) {
    return '$count წთ წინ';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursსთ წინ';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursსთ $minutesწთ წინ';
  }

  @override
  String get noMaintenancePlanned => 'ტექნიკური მომსახურება დაგეგმილი არ არის';

  @override
  String get everythingWorkingNormally => 'ყველაფერი ნორმალურად მუშაობს';

  @override
  String get maintenanceTitle => 'ტექნიკური მომსახურება';

  @override
  String get maintenanceActiveLabel => 'მიმდინარეობს';

  @override
  String get maintenancePlannedLabel => 'დაგეგმილი';

  @override
  String get locking => 'იკეტება...';

  @override
  String get newMessageNotification => 'ახალი შეტყობინება';

  @override
  String get secExplainTitle => 'როგორ გიცავთ Hash';

  @override
  String get secExplainIntro =>
      'Hash შექმნილია ისე, რომ ვერავინ წაიკითხავს თქვენს შეტყობინებებს.';

  @override
  String get secExplainIntroSub =>
      'ჩვენც კი ვერ.\nაი, როგორ მუშაობს, მარტივად ახსნილი.';

  @override
  String get secJourneyLabel => 'მოგზაურობა';

  @override
  String get secJourneyTitle => 'თქვენი შეტყობინების მოგზაურობა';

  @override
  String get secJourneySubtitle =>
      'თქვენი თითიდან კონტაქტის ეკრანამდე, ყველა ნაბიჯი დაცულია. გაჰყევით გზას.';

  @override
  String get secStep1Title => 'წერთ შეტყობინებას';

  @override
  String get secStep1Desc =>
      'აპში წერთ \"გამარჯობა!\". ამ მომენტში შეტყობინება მხოლოდ ტელეფონის მეხსიერებაში არსებობს. არაფერი არ გაგზავნილა.';

  @override
  String get secStep2Title => 'დაშიფვრა Signal Protocol-ით';

  @override
  String get secStep2Desc =>
      'როგორც კი \"გაგზავნას\" დააჭერთ, თქვენი შეტყობინება გაუგებარ სიმბოლოებად გარდაიქმნება. ეს იმის მსგავსია, რომ თქვენი შეტყობინება სეიფში ჩაიკეტა, რომლის გასაღები მხოლოდ თქვენს კონტაქტს აქვს.';

  @override
  String get secStep3Title => 'Sealed Sender: უხილავი კონვერტი';

  @override
  String get secStep3Desc =>
      'წარმოიდგინეთ, რომ წერილს აგზავნით ფოსტით, მაგრამ კონვერტზე გამომგზავნის მისამართი არ არის. ზუსტად ამას აკეთებს Hash. შეტყობინება ანონიმურ საფოსტო ყუთში იტოვება. სერვერს არ იცის ვინ გაგზავნა.';

  @override
  String get secStep4Title => 'სერვერი ვერაფერს ხედავს';

  @override
  String get secStep4Desc =>
      'სერვერი ბრმა ფოსტალიონის როლს ასრულებს. მხოლოდ იცის, რომ \"ვიღაცამ რაღაც ჩააგდო საფოსტო ყუთში #A7X9\". არ იცის ვინ გაგზავნა, რა არის, ან ვისთვისაა.';

  @override
  String get secStep4Highlight =>
      'მეტამონაცემები არ ინახება: არა IP მისამართი, არა დროის ნიშანი, არა კავშირი გამომგზავნსა და მიმღებს შორის.';

  @override
  String get secStep5Title => 'კონტაქტი იღებს შეტყობინებას';

  @override
  String get secStep5Desc =>
      'კონტაქტის ტელეფონი ანონიმური საფოსტო ყუთიდან შინაარსს იღებს და შეტყობინებას გაშიფრავს პირადი გასაღებით, რომელიც არასოდეს დატოვებია მათი მოწყობილობა. \"გამარჯობა!\" ეკრანზე გამოჩნდება.';

  @override
  String get secStep6Title => 'შეტყობინება სერვერიდან ქრება';

  @override
  String get secStep6Desc =>
      'როგორც კი კონტაქტი მიღებას დაადასტურებს, სერვერი სამუდამოდ წაშლის შეტყობინებას. არა ნაგავი, არა არქივი, არა სარეზერვო ასლი. წაუკითხავი შეტყობინებებიც კი ავტომატურად ნადგურდება 24 საათის შემდეგ.';

  @override
  String get secStep7Title => 'ლოკალური ვადის გასვლა';

  @override
  String get secStep7Desc =>
      'კონტაქტის ტელეფონზე შეტყობინება თვითნადგურდება თქვენ მიერ არჩეული ხანგრძლივობის მიხედვით: წაკითხვისთანავე, 5 წუთი, 1 საათი... თქვენ წყვეტთ.';

  @override
  String get secJourneyConclusion =>
      'შედეგი: ნულოვანი კვალი სერვერზე, ნულოვანი კვალი მოწყობილობებზე. შეტყობინება მხოლოდ იმდენ ხანს არსებობდა, რამდენიც წაკითხვას დასჭირდა, შემდეგ გაქრა.';

  @override
  String get secArchLabel => 'არქიტექტურა';

  @override
  String get secArchTitle => '5 დაცვის ფენა';

  @override
  String get secArchSubtitle =>
      'Hash არ ეყრდნობა ერთ ტექნოლოგიას. ყველა ფენა აძლიერებს სხვებს. თუნდაც ერთი ფენა კომპრომეტირებული იყოს, თქვენი მონაცემები უსაფრთხოდ რჩება.';

  @override
  String get secLayer1Title => 'ბოლოდან ბოლომდე დაშიფვრა';

  @override
  String get secLayer1Desc =>
      'ყველა შეტყობინება უნიკალური გასაღებით არის დაშიფრული. მარტივად: თუნდაც ვინმემ ერთი შეტყობინება გაშიფროს, შემდეგს ვერ შეძლებს. ყველა შეტყობინებას საკუთარი საკეტი აქვს.';

  @override
  String get secLayer1Detail =>
      'ფაილებისთვის (ფოტოები, ვიდეოები, დოკუმენტები), Hash დამატებით AES-256-GCM დაშიფვრას იყენებს. ფაილი დაშიფრულია სანამ ტელეფონს დატოვებს.';

  @override
  String get secLayer2Title => 'Sealed Sender (ქსელური ანონიმურობა)';

  @override
  String get secLayer2Desc =>
      'ჩვეულებრივი მესენჯერები შეტყობინებებს თქვენი ვინაობით აგზავნიან. ეს კონვერტზე სახელის დაწერას ჰგავს. Hash ანონიმურ საფოსტო ყუთებს იყენებს: სერვერი შეტყობინებას მიაწვდის გამომგზავნის ცოდნის გარეშე.';

  @override
  String get secLayer2Detail =>
      'შედეგი: სერვერის მონაცემთა გაჟონვის შემთხვევაშიც კი, შეუძლებელია ვინ ვისთან საუბრობს რეკონსტრუქცია.';

  @override
  String get secLayer3Title => 'ავტომატური წაშლა';

  @override
  String get secLayer3Desc =>
      'შეტყობინებები სერვერიდან იშლება მიღების დადასტურებისთანავე. თუნდაც შეტყობინება არასოდეს იქნას მიღებული, ავტომატურად ნადგურდება 24 საათის შემდეგ.';

  @override
  String get secLayer3Detail =>
      'ტელეფონზე შეტყობინებები თვითნადგურდება თქვენ მიერ არჩეული ხანგრძლივობის მიხედვით: დაუყოვნებლივ, 5 წთ, 15 წთ, 30 წთ, 1სთ, 3სთ, 6სთ ან 12სთ.';

  @override
  String get secLayer4Title => 'ლოკალური წვდომის დაცვა';

  @override
  String get secLayer4Desc =>
      'აპი დაცულია 6-ციფრიანი PIN-ით და/ან ბიომეტრიით (Face ID, თითის ანაბეჭდი). ძალიან ბევრი წარუმატებელი მცდელობის შემდეგ, აპი იკეტება მზარდი დაყოვნებით ყოველი წარუმატებლობის შემდეგ.';

  @override
  String get secLayer5Title => 'ჩაკეტილი ბაზა';

  @override
  String get secLayer5Desc =>
      'სერვერის მხარეს, არცერთ მომხმარებელს არ შეუძლია პირდაპირ ჩაწერა ბაზაში. ყველა მოქმედება გადის უსაფრთხო ფუნქციებში, რომლებიც ამოწმებენ ყველა მოთხოვნას.';

  @override
  String get secLayer5Detail =>
      'ეს ბანკის მრიცხველს ჰგავს: სეიფს თვითონ არასოდეს ეხებით. მოთხოვნას აკეთებთ და სისტემა ამოწმებს გაქვთ თუ არა უფლება სანამ იმოქმედებს.';

  @override
  String get secVashLabel => 'უნიკალური მსოფლიოში';

  @override
  String get secVashTitle => 'Vash რეჟიმი';

  @override
  String get secVashSubtitle =>
      'საგანგებო უსაფრთხოების სისტემა, რომელიც არცერთ სხვა მესენჯერ აპში არ არსებობს.';

  @override
  String get secVashScenarioTitle => 'წარმოიდგინეთ ეს სიტუაცია';

  @override
  String get secVashScenario1 => 'ვიღაც წვდება თქვენს ტელეფონს';

  @override
  String get secVashScenario2 => 'გთხოვენ PIN კოდს';

  @override
  String get secVashScenario3 => 'გსურთ სასწრაფოდ წაშალოთ ყველა მონაცემი';

  @override
  String get secVashSolutionTitle => 'გადაწყვეტა: ორი PIN კოდი';

  @override
  String get secVashSolutionDesc => 'Hash-ში ორ განსხვავებულ PIN კოდს აყენებთ:';

  @override
  String get secVashNormalCodeLabel => 'ჩვეულებრივი კოდი';

  @override
  String get secVashNormalCodeDesc => 'ჩვეულებრივად ხსნის აპს ყველა მონაცემით';

  @override
  String get secVashCodeLabel2 => 'Vash კოდი';

  @override
  String get secVashCodeDescription =>
      'ჩვეულებრივად ხსნის აპს... მაგრამ ყველა მონაცემი ჩუმად იშლება ფონზე';

  @override
  String get secVashWhatHappensTitle => 'რა ხდება შემდეგ';

  @override
  String get secVashWhatHappensDesc =>
      'აპი ჩვეულებრივად იხსნება. არა გაფრთხილება, არა საეჭვო ანიმაცია. ეკრანი უბრალოდ ცარიელ აპს აჩვენებს, თითქოს ახლახანს დააყენეთ.\n\nსინამდვილეში, ყველა საუბარი, კონტაქტი და შეტყობინება შეუქცევადად წაიშალა წამის მეასედში.';

  @override
  String get secCallsLabel => 'ზარები და ფაილები';

  @override
  String get secCallsTitle => 'ყველაფერი დაშიფრულია';

  @override
  String get secCallsSubtitle =>
      'არა მხოლოდ შეტყობინებები. აბსოლუტურად ყველაფერი, რაც Hash-ის გავლით გადის, ბოლოდან ბოლომდე დაშიფრულია.';

  @override
  String get secAudioCallTitle => 'აუდიო ზარები';

  @override
  String get secAudioCallDesc =>
      'ბოლოდან ბოლომდე დაშიფრული WebRTC-ით. ხმა პირდაპირ მოწყობილობებს შორის გადაიცემა.';

  @override
  String get secVideoCallTitle => 'ვიდეო ზარები';

  @override
  String get secVideoCallDesc =>
      'იგივე ტექნოლოგია, ყველა ნაკადი ინდივიდუალურად დაშიფრული.';

  @override
  String get secPhotosTitle => 'ფოტოები და ვიდეოები';

  @override
  String get secPhotosDesc =>
      'AES-256-GCM-ით დაშიფრული სანამ ტელეფონს დატოვებს.';

  @override
  String get secDocsTitle => 'დოკუმენტები';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, ნებისმიერი ფაილი. სახელი, ზომა და შინაარსი დაშიფრული.';

  @override
  String get secAnonLabel => 'ანონიმურობა';

  @override
  String get secAnonTitle => 'ვინაობის მოთხოვნა არ არის';

  @override
  String get secAnonSubtitle =>
      'Hash არასოდეს ითხოვს ტელეფონის ნომერს ან ელფოსტას. თქვენ იდენტიფიცირებული ხართ უნიკალური და ანონიმური Hash ID-ით.';

  @override
  String get secHashIdTitle => 'თქვენი Hash ID';

  @override
  String get secHashIdDesc =>
      'ეს თქვენი უნიკალური იდენტიფიკატორია. არაფერს ამჟღავნებს თქვენ შესახებ: არა თქვენი სახელი, არა თქვენი ნომერი, არა თქვენი მდებარეობა. ეს ფსევდონიმის მსგავსია, რომლის თქვენს ნამდვილ ვინაობასთან დაკავშირება შეუძლებელია.\n\nკონტაქტის დასამატებლად, აზიარებთ Hash ID-ს ან ასკანერებთ QR code-ს. სულ ეს არის. არა სინქრონიზებული მისამართების წიგნი, არა \"ხალხი, ვისაც შეიძლება იცნობთ\" შეთავაზებები.';

  @override
  String get secDataLabel => 'მონაცემები';

  @override
  String get secDataTitle => 'რა არ იცის Hash-მა';

  @override
  String get secDataSubtitle =>
      'მონაცემების დაცვის საუკეთესო გზა მათი არშეგროვებაა.';

  @override
  String get secNeverCollected => 'არასოდეს შეგროვებული';

  @override
  String get secNeverItem1 => 'შეტყობინებების შინაარსი';

  @override
  String get secNeverItem2 => 'კონტაქტების სია';

  @override
  String get secNeverItem3 => 'ტელეფონის ნომერი';

  @override
  String get secNeverItem4 => 'ელფოსტის მისამართი';

  @override
  String get secNeverItem5 => 'IP მისამართი';

  @override
  String get secNeverItem6 => 'მდებარეობა';

  @override
  String get secNeverItem7 => 'მეტამონაცემები (ვინ ვისთან საუბრობს)';

  @override
  String get secNeverItem8 => 'ზარების ისტორია';

  @override
  String get secNeverItem9 => 'მისამართების წიგნი';

  @override
  String get secNeverItem10 => 'სარეკლამო იდენტიფიკატორები';

  @override
  String get secTempStored => 'დროებით შენახული';

  @override
  String get secTempItem1 => 'ანონიმური Hash ID (უნიკალური იდენტიფიკატორი)';

  @override
  String get secTempItem2 => 'საჯარო დაშიფვრის გასაღებები';

  @override
  String get secTempItem3 =>
      'ტრანზიტში მყოფი დაშიფრული შეტყობინებები (მაქს. 24სთ)';

  @override
  String get secTempNote =>
      'ეს მინიმალური მონაცემებიც კი ვერ გაიდენტიფიცირებს თქვენ. თქვენი Hash ID არანაირ პირად ინფორმაციასთან არ არის დაკავშირებული.';

  @override
  String get secFooterTitle => 'თქვენი კონფიდენციალურობა, თქვენი თავისუფლება';

  @override
  String get secFooterDesc =>
      'Hash იყენებს იგივე დაშიფვრის ტექნოლოგიებს, რასაც ყველაზე მოთხოვნადი პროფესიონალური აპლიკაციები. თქვენი შეტყობინებები მათემატიკით არის დაცული, არა დაპირებებით.';

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
