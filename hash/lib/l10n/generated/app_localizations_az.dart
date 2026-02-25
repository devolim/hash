// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Sıfır İz. Sıfır Güzəşt.';

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
  String get conversations => 'Söhbətlər';

  @override
  String get contacts => 'Kontaktlar';

  @override
  String get noConversation => 'Söhbət yoxdur';

  @override
  String get noConversationSubtitle =>
      'Təhlükəsiz söhbətə başlamaq üçün kontakt əlavə edin';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gözləyən sorğu',
      one: '1 gözləyən sorğu',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count göndərilmiş sorğu gözləyir',
      one: '1 göndərilmiş sorğu gözləyir',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Kontakt əlavə et';

  @override
  String get shareApp => 'Tətbiqi paylaş';

  @override
  String get newMessage => 'Yeni mesaj';

  @override
  String get newConversation => 'Mesaj göndər';

  @override
  String get settings => 'Parametrlər';

  @override
  String get myHashId => 'Mənim Hash ID';

  @override
  String get supportHash => 'Hash-ı dəstəklə';

  @override
  String get supportHashSubtitle => 'Hash qeyri-kommersiya layihəsidir';

  @override
  String get donate => 'İanə et';

  @override
  String get appearance => 'Görünüş';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Avtomatik';

  @override
  String get themeAutoSubtitle => 'Sistem parametrlərinə uyğundur';

  @override
  String get themeDark => 'Qaranlıq';

  @override
  String get themeLight => 'İşıqlı';

  @override
  String get themeRecommendation =>
      'Daha yaxşı məxfilik üçün qaranlıq tema tövsiyə olunur';

  @override
  String get language => 'Dil';

  @override
  String get languageAuto => 'Avtomatik (sistem)';

  @override
  String get notifications => 'Bildirişlər';

  @override
  String get messages => 'Mesajlar';

  @override
  String get calls => 'Zənglər';

  @override
  String get vibration => 'Vibrasiya';

  @override
  String get notificationContent => 'Bildiriş məzmunu';

  @override
  String get notificationContentFull => 'Hamısını göstər';

  @override
  String get notificationContentFullDesc => 'Kontakt adı və mesaj önizləməsi';

  @override
  String get notificationContentName => 'Yalnız ad';

  @override
  String get notificationContentNameDesc => 'Yalnız kontakt adını göstərir';

  @override
  String get notificationContentDiscrete => 'Diskret';

  @override
  String get notificationContentDiscreteDesc =>
      'Yalnız \"Yeni mesaj\" göstərir';

  @override
  String get security => 'Təhlükəsizlik';

  @override
  String get howHashProtectsYou => 'Hash sizi necə qoruyur';

  @override
  String get howHashProtectsYouSubtitle => 'Təhlükəsizliyinizi anlayın';

  @override
  String get accountSecurity => 'Hesab təhlükəsizliyi';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrika, Vash rejimi';

  @override
  String get blockScreenshots => 'Ekran görüntülərini blokla';

  @override
  String get transferDevice => 'Başqa cihaza köçür';

  @override
  String get transferDeviceSubtitle => 'Hesabınızı köçürün';

  @override
  String get pinCode => 'PIN kodu';

  @override
  String get changePin => 'PIN kodunu dəyiş';

  @override
  String get currentPin => 'Cari PIN kodu';

  @override
  String get newPin => 'Yeni PIN kodu';

  @override
  String get confirmPin => 'PIN kodunu təsdiqlə';

  @override
  String get pinChanged => 'PIN kodu dəyişdirildi';

  @override
  String get incorrectPin => 'Yanlış PIN';

  @override
  String get pinsDoNotMatch => 'PIN-lər uyğun gəlmir';

  @override
  String get autoLock => 'Avto-kilidləmə';

  @override
  String get autoLockDelay => 'Kilidləmə gecikməsi';

  @override
  String get autoLockImmediate => 'Dərhal';

  @override
  String get autoLockMinute => '1 dəqiqə';

  @override
  String autoLockMinutes(int count) {
    return '$count dəqiqə';
  }

  @override
  String get vashCode => 'Vash kodu';

  @override
  String get vashModeTitle => 'Vash rejimi';

  @override
  String get vashModeExplanation => 'Sizin son təhlükəsizlik şəbəkəniz.';

  @override
  String get vashModeDescription =>
      'İkinci bir PIN kodu seçəcəksiniz. Əgər sizi Hash-ı açmağa məcbur etsələr, adi PIN-inizin əvəzinə bu kodu daxil edin.\n\nTətbiq normal açılacaq, lakin bütün söhbətləriniz və kontaktlarınız yox olacaq.\n\nEkranınıza baxan hər kəs üçün Hash sadəcə boş görünəcək — sanki heç istifadə etməmisiniz.';

  @override
  String get vashModeIrreversible => 'Bu əməliyyat səssiz və geri dönməzdir.';

  @override
  String get chooseVashCode => 'Vash kodumu seç';

  @override
  String get vashCodeInfo => 'Tətbiqi normal, lakin boş açan ikinci PIN kodu.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Bu kodu PIN-inizin əvəzinə daxil etsəniz:';

  @override
  String get vashDeleteContacts => 'Kontaktlarınız yox olur';

  @override
  String get vashDeleteMessages => 'Söhbətləriniz yox olur';

  @override
  String get vashDeleteHistory => 'Qeydləriniz yox olur';

  @override
  String get vashKeepId => 'Hash kimliyiniz (#XXX-XXX-XXX) eyni qalır';

  @override
  String get vashAppearNormal =>
      'Tətbiq normal, lakin yeni kimi boş görünür. Bu əməliyyat geri dönməzdir.';

  @override
  String get setupVashCode => 'Vash kodunu qur';

  @override
  String get modifyVashCode => 'Vash kodunu dəyiş';

  @override
  String get currentVashCode => 'Cari Vash kodu';

  @override
  String get newVashCode => 'Yeni Vash kodu';

  @override
  String get confirmVashCode => 'Vash kodunu təsdiqlə';

  @override
  String get vashCodeConfigured => 'Vash kodu quruldu';

  @override
  String get vashCodeModified => 'Vash kodu dəyişdirildi';

  @override
  String get vashCodeMustDiffer => 'Vash kodu PIN-dən fərqli olmalıdır';

  @override
  String get incorrectVashCode => 'Yanlış Vash kodu';

  @override
  String get vashWhatToDelete => 'Vash rejimi nəyi yox etməlidir?';

  @override
  String get vashDeleteContactsOption => 'Kontaktlar';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mesajlar';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Qeydlər';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash rejimi aktivləşdirildi';

  @override
  String get vashCreateSubtitle => 'Əsas PIN-inizdən fərqli bir kod seçin';

  @override
  String get vashConfirmSubtitle => 'Vash kodunuzu təsdiqləyin';

  @override
  String get pinCodeForEntry => 'Tətbiqə giriş üçün PIN kod';

  @override
  String get vashCodeSection => 'Vash rejimi';

  @override
  String get biometric => 'Biometrik';

  @override
  String get biometricUnlock => 'Barmaq izi və ya Face ID ilə kilidi aç';

  @override
  String get enableBiometric => 'Biometrikanı aktivləşdir';

  @override
  String get biometricWarningMessage =>
      'Biometrikanı aktivləşdirməklə, tətbiqə daxil olmaq üçün Vash kodunuzu istifadə edə bilməyəcəksiniz.\n\nVash kodunu yalnız biometrika uğursuz olarsa (bir neçə uğursuz cəhddən sonra) istifadə edə biləcəksiniz.\n\nDavam etmək istədiyinizə əminsiniz?';

  @override
  String get understood => 'Başa düşdüm';

  @override
  String get shareAppSubtitle => 'Hash-ı yaxınlarınızla paylaşın';

  @override
  String get share => 'Paylaş';

  @override
  String get danger => 'Təhlükə';

  @override
  String get deleteAccount => 'Hesabımı sil';

  @override
  String get deleteAccountSubtitle => 'Geri dönməz əməliyyat';

  @override
  String get deleteAccountConfirmTitle => 'Hesabımı sil';

  @override
  String get deleteAccountConfirmMessage =>
      'Hesabınız həmişəlik silinəcək. Bu əməliyyat geri dönməzdir.\n\n• Bütün söhbətləriniz\n• Bütün kontaktlarınız\n• Hash ID-niz\n\nYeni hesab yaratmalı olacaqsınız.';

  @override
  String get deleteForever => 'Həmişəlik sil';

  @override
  String get cancel => 'Ləğv et';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash rejimi aktivləşdirildi.';

  @override
  String deletionError(String error) {
    return 'Silmə xətası: $error';
  }

  @override
  String get yourSecurity => 'Təhlükəsizliyiniz';

  @override
  String get securityInfo =>
      '• Ucdan-uca şifrələmə (Signal Protocol)\n• Çatdırıldıqdan sonra serverimizdə məlumat yoxdur\n• Açarlar yalnız cihazınızda saxlanılır\n• PIN kodu heç vaxt serverə göndərilmir';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Xoş gəldiniz';

  @override
  String get securityStatement1 => 'Mesajlarınız qorunur.';

  @override
  String get securityStatement2 => 'Ucdan-uca şifrələmə.';

  @override
  String get securityStatement3 => 'İz yoxdur. Güzəşt yoxdur.';

  @override
  String get securityStatement4 => 'Məxfiliyiniz bir haqdır.';

  @override
  String get accessBlocked => 'Giriş bloklandı';

  @override
  String get tooManyAttempts => 'Çox sayda cəhd';

  @override
  String get pleaseWait => 'Xahiş edirik gözləyin';

  @override
  String get waitDelay => 'Xahiş edirik gecikməni gözləyin';

  @override
  String attemptCount(int current, int max) {
    return 'Cəhd $current/$max';
  }

  @override
  String retryIn(String time) {
    return '$time sonra yenidən cəhd edin';
  }

  @override
  String get forgotPin => 'PIN-i unutdunuz? Bərpa ifadəsini istifadə edin';

  @override
  String get useRecoveryPhrase => 'Bərpa ifadəsini istifadə et';

  @override
  String get recoveryWarningTitle => 'Xəbərdarlıq';

  @override
  String get recoveryWarningMessage => 'Hesab bərpası:';

  @override
  String get recoveryDeleteAllMessages => 'BÜTÜN mesajlarınızı siləcək';

  @override
  String get recoveryWaitDelay => '1 saatlıq gecikmə tələb edəcək';

  @override
  String get recoveryKeepContacts => 'Kontaktlarınızı saxlayacaq';

  @override
  String get recoveryIrreversible =>
      'Bu əməliyyat geri dönməzdir. Mesajlarınız həmişəlik itiriləcək.';

  @override
  String get iUnderstand => 'Başa düşürəm';

  @override
  String get accountRecovery => 'Hesab bərpası';

  @override
  String get enterRecoveryPhrase =>
      'Bərpa ifadənizin 24 sözünü boşluqlarla ayırılmış şəkildə daxil edin.';

  @override
  String get recoveryPhraseHint => 'söz1 söz2 söz3 ...';

  @override
  String get recover => 'Bərpa et';

  @override
  String get recoveryPhraseRequired =>
      'Xahiş edirik bərpa ifadənizi daxil edin';

  @override
  String get recoveryPhrase24Words => 'İfadə tam 24 sözdən ibarət olmalıdır';

  @override
  String get incorrectRecoveryPhrase => 'Yanlış bərpa ifadəsi';

  @override
  String get recoveryInitError => 'Bərpanın başlatılmasında xəta';

  @override
  String get securityDelay => 'Təhlükəsizlik gecikməsi';

  @override
  String get securityDelayMessage =>
      'Təhlükəsizliyiniz üçün yeni PIN yaratmazdan əvvəl gözləmə müddəti tələb olunur.';

  @override
  String get timeRemaining => 'Qalan vaxt';

  @override
  String get messagesDeletedForProtection =>
      'Mesajlarınız qorunmanız üçün silindi.';

  @override
  String get canCloseApp => 'Tətbiqi bağlayıb sonra qayıda bilərsiniz.';

  @override
  String get onboardingTitle1 => 'Hash-a xoş gəldiniz';

  @override
  String get onboardingSubtitle1 => 'İz qoymayan mesajlaşma tətbiqi';

  @override
  String get onboardingTitle2 => 'Tam şifrələmə';

  @override
  String get onboardingSubtitle2 =>
      'Mesajlarınız Signal Protocol ilə ucdan-uca şifrələnir';

  @override
  String get onboardingTitle3 => 'İz yoxdur';

  @override
  String get onboardingSubtitle3 =>
      'Mesajlar çatdırıldıqdan sonra serverlərdən silinir';

  @override
  String get onboardingTitle4 => 'Təhlükəsizliyiniz';

  @override
  String get onboardingSubtitle4 => 'PIN kodu, Vash rejimi və bərpa ifadəsi';

  @override
  String get getStarted => 'Başla';

  @override
  String get next => 'Növbəti';

  @override
  String get skip => 'Keç';

  @override
  String get alreadyHaveAccount => 'Artıq hesabım var';

  @override
  String get transferMyAccount => 'Hesabımı köçür';

  @override
  String get createPin => 'PIN kodu yarat';

  @override
  String get createPinSubtitle => 'Bu kod tətbiqinizə girişi qoruyacaq';

  @override
  String get confirmYourPin => 'PIN kodunuzu təsdiqləyin';

  @override
  String get confirmPinSubtitle => 'PIN kodunuzu yenidən daxil edin';

  @override
  String get saveRecoveryPhrase => 'Bərpa ifadəsi';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Bu 24 sözü sıra ilə yazın. PIN-inizi unutsanız hesabınızı bərpa etməyə imkan verəcək.';

  @override
  String get phraseWritten => 'İfadəmi yazdım';

  @override
  String get warningRecoveryPhrase =>
      'Bu ifadəni itirsəniz və PIN-inizi unutsanız, hesabınıza girişi itirəcəksiniz.';

  @override
  String get accountTransferred => 'Hesab köçürüldü';

  @override
  String get accountTransferredMessage =>
      'Hesabınız başqa bir cihaza köçürüldü. Bu sessiya artıq etibarlı deyil.';

  @override
  String get accountTransferredInfo =>
      'Bu köçürməni siz başlatmamısınızsa, hesabınız kompromis edilmiş ola bilər.';

  @override
  String get logout => 'Çıxış';

  @override
  String get transferAccount => 'Hesabı köçür';

  @override
  String get transferAccountInfo =>
      'Hash hesabınızı yeni cihaza köçürün. Cari sessiyanız ləğv ediləcək.';

  @override
  String get generateTransferCode => 'Köçürmə kodu yarat';

  @override
  String get transferCode => 'Köçürmə kodu';

  @override
  String transferCodeExpires(int minutes) {
    return 'Bu kod $minutes dəqiqə sonra bitəcək';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Hesabınızı köçürmək üçün bu kodu yeni cihazınızda daxil edin.';

  @override
  String get generateNewCode => 'Yeni kod yarat';

  @override
  String get scanQrCode => 'QR kodu skan et';

  @override
  String get scanQrCodeSubtitle =>
      'Kontaktı əlavə etmək üçün onun QR kodunu skan edin';

  @override
  String get qrCodeDetected => 'QR kodu aşkarlandı';

  @override
  String get invalidQrCode => 'Yanlış QR kodu';

  @override
  String get cameraPermissionRequired => 'Kamera icazəsi tələb olunur';

  @override
  String get myQrCode => 'Mənim QR kodum';

  @override
  String get myQrCodeSubtitle =>
      'Kontaktlarınızın sizi əlavə edə bilməsi üçün bu QR kodu paylaşın';

  @override
  String get shareQrCode => 'Paylaş';

  @override
  String get addContactTitle => 'Kontakt əlavə et';

  @override
  String get addContactByHashId => 'Kontaktınızın Hash ID-ni daxil edin';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Axtar';

  @override
  String get contactNotFound => 'Kontakt tapılmadı';

  @override
  String get contactAlreadyAdded => 'Bu kontakt artıq siyahınızdadır';

  @override
  String get contactAdded => 'Kontakt əlavə edildi';

  @override
  String get myProfile => 'Profilim';

  @override
  String get myProfileSubtitle =>
      'Başqalarının sizi əlavə edə bilməsi üçün bu məlumatı paylaşın';

  @override
  String get temporaryCode => 'Müvəqqəti kod';

  @override
  String temporaryCodeExpires(String time) {
    return '$time sonra bitəcək';
  }

  @override
  String get codeExpired => 'Kod bitmişdir';

  @override
  String get generateNewCodeButton => 'Yeni kod';

  @override
  String get copyHashId => 'ID-ni kopyala';

  @override
  String get copyCode => 'Kodu kopyala';

  @override
  String get copiedToClipboard => 'Kopyalandı';

  @override
  String get showMyQrCode => 'QR kodumu göstər';

  @override
  String get orDivider => 'və ya';

  @override
  String get openScanner => 'Skaneri aç';

  @override
  String get addManually => 'Əllə əlavə et';

  @override
  String get contactHashIdLabel => 'Kontaktın Hash ID-si';

  @override
  String get temporaryCodeLabel => 'Müvəqqəti kod';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Kontaktınızdan profilindən kod yaratmasını xahiş edin';

  @override
  String get verifyAndAdd => 'Doğrula və əlavə et';

  @override
  String get fillAllFields => 'Xahiş edirik bütün sahələri doldurun';

  @override
  String get invalidHashIdFormat => 'Yanlış ID formatı (məs.: 123-456-ABC)';

  @override
  String get userNotFound => 'İstifadəçi tapılmadı';

  @override
  String get cannotAddYourself => 'Özünüzü əlavə edə bilməzsiniz';

  @override
  String get invalidOrExpiredCode => 'Yanlış və ya vaxtı keçmiş müvəqqəti kod';

  @override
  String get contactFound => 'Kontakt tapıldı!';

  @override
  String get howToCallContact => 'Onlara nə ad vermək istəyirsiniz?';

  @override
  String get contactNameHint => 'Kontakt adı';

  @override
  String get addContactButton => 'Əlavə et';

  @override
  String get contactDetails => 'Kontakt təfərrüatları';

  @override
  String get contactName => 'Kontakt adı';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date tarixində əlavə edildi';
  }

  @override
  String get deleteContact => 'Kontaktı sil';

  @override
  String deleteContactConfirm(Object name) {
    return 'Bu kontakt silinsin?';
  }

  @override
  String get deleteContactMessage => 'Bu həmçinin bütün söhbəti siləcək.';

  @override
  String get delete => 'Sil';

  @override
  String get typeMessage => 'Mesaj yazın...';

  @override
  String get messageSent => 'Göndərildi';

  @override
  String get messageDelivered => 'Çatdırıldı';

  @override
  String get messageRead => 'Oxundu';

  @override
  String get messageFailed => 'Göndərilmədi';

  @override
  String get now => 'İndi';

  @override
  String minutesAgo(int count) {
    return '${count}dəq';
  }

  @override
  String hoursAgo(int count) {
    return '${count}s';
  }

  @override
  String daysAgo(int count) {
    return '${count}g';
  }

  @override
  String get today => 'Bu gün';

  @override
  String get yesterday => 'Dünən';

  @override
  String dateAtTime(String date, String time) {
    return '$date, $time';
  }

  @override
  String get shareMessage =>
      'Hash-da mənə qoşulun! 🔒\n\nBu həqiqətən məxfi mesajlaşma tətbiqidir: tam şifrələmə, serverlərdə iz yoxdur, lazım olduqda panik rejimi.\n\nTətbiqi buradan yükləyin 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Xəta';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Bax';

  @override
  String get yes => 'Bəli';

  @override
  String get no => 'Xeyr';

  @override
  String get save => 'Saxla';

  @override
  String get edit => 'Redaktə et';

  @override
  String get close => 'Bağla';

  @override
  String get confirm => 'Təsdiqlə';

  @override
  String get loading => 'Yüklənir...';

  @override
  String get retry => 'Yenidən cəhd et';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Gözləyən sorğular';

  @override
  String get noPendingRequests => 'Gözləyən sorğu yoxdur';

  @override
  String get pendingRequestsSubtitle => 'Bu insanlar sizi əlavə etmək istəyir';

  @override
  String requestFromUser(String hashId) {
    return '$hashId tərəfindən sorğu';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days gün sonra bitəcək';
  }

  @override
  String get acceptRequest => 'Qəbul et';

  @override
  String get rejectRequest => 'Rədd et';

  @override
  String get requestAccepted => 'Sorğu qəbul edildi';

  @override
  String get requestRejected => 'Sorğu rədd edildi';

  @override
  String get requestSent => 'Sorğu göndərildi!';

  @override
  String get requestSentSubtitle =>
      'Sorğunuz göndərildi. Söhbət edə bilməniz üçün istifadəçi onu qəbul etməlidir.';

  @override
  String get requestAlreadyPending => 'Sorğu artıq gözləyir';

  @override
  String get requestAlreadySentByOther => 'Bu şəxs artıq sizə sorğu göndərib';

  @override
  String get addByHashId => 'Hash ID ilə əlavə et';

  @override
  String get addByHashIdSubtitle =>
      'Kontaktın Hash ID-ni və müvəqqəti kodunu daxil edin';

  @override
  String get enterTemporaryCode => '6 rəqəmli kodu daxil edin';

  @override
  String get sendRequest => 'Sorğu göndər';

  @override
  String get acceptContactTitle => 'Kontaktı qəbul et';

  @override
  String get acceptContactSubtitle => 'Onlara xüsusi ad verə bilərsiniz';

  @override
  String get leaveEmptyForHashId => 'Hash ID istifadə etmək üçün boş buraxın';

  @override
  String get firstName => 'Ad';

  @override
  String get lastName => 'Soyad';

  @override
  String get notes => 'Qeydlər';

  @override
  String get notesHint => 'Bu kontakt haqqında şəxsi qeydlər';

  @override
  String get photoOptional => 'Şəkil (isteğe bağlı)';

  @override
  String get contactNameOptional => 'Ad (isteğe bağlı)';

  @override
  String get notesOptional => 'Qeydlər (isteğe bağlı)';

  @override
  String get storedLocally => 'Yalnız cihazınızda saxlanılır';

  @override
  String get encryptedMessageLabel => 'Şifrələnmiş mesaj';

  @override
  String get identityMessageHint =>
      'Siz kimsiniz? Bir-birinizi necə tanıyırsınız?';

  @override
  String get messageWillBeSentEncrypted =>
      'Bu mesaj şifrələnib alıcıya göndəriləcək';

  @override
  String get sendRequestButton => 'Sorğu göndər';

  @override
  String get requestExpiresIn24h =>
      'Sorğu 24 saat ərzində qəbul edilməsə bitəcək';

  @override
  String get theyAlreadySentYouRequest => 'Bu şəxs artıq sizə sorğu göndərib';

  @override
  String get requests => 'Sorğular';

  @override
  String get receivedRequests => 'Alınan';

  @override
  String get sentRequests => 'Göndərilən';

  @override
  String get noSentRequests => 'Göndərilmiş sorğu yoxdur';

  @override
  String get cancelRequest => 'Ləğv et';

  @override
  String get deleteRequest => 'Sorğunu sil';

  @override
  String get requestCancelled => 'Sorğu ləğv edildi';

  @override
  String sentTo(String hashId) {
    return '$hashId-ə göndərildi';
  }

  @override
  String expiresIn(String time) {
    return '$time sonra bitəcək';
  }

  @override
  String receivedAgo(String time) {
    return '$time əvvəl alındı';
  }

  @override
  String get messageFromRequester => 'Sorğu göndərəndən mesaj';

  @override
  String get copy => 'Kopyala';

  @override
  String get messageInfo => 'Mesaj məlumatı';

  @override
  String get messageDirection => 'İstiqamət';

  @override
  String get messageSentByYou => 'Sizin tərəfindən göndərildi';

  @override
  String get messageReceived => 'Alındı';

  @override
  String get messageSentAt => 'Göndərilmə vaxtı';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Oxunma vaxtı';

  @override
  String get messageType => 'Növ';

  @override
  String get messageSize => 'Ölçü';

  @override
  String get messageExpiresAt => 'Bitmə vaxtı';

  @override
  String get messageEncrypted => 'Ucdan-uca şifrələnmiş';

  @override
  String get messageStatusSending => 'Göndərilir...';

  @override
  String get messageStatusSent => 'Göndərildi';

  @override
  String get messageStatusDelivered => 'Çatdırıldı';

  @override
  String get messageStatusRead => 'Oxundu';

  @override
  String get messageStatusFailed => 'Uğursuz';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Çatdırılma gözləyir';

  @override
  String get deletedFromServer => 'Silinib';

  @override
  String get messageTypeText => 'Mətn';

  @override
  String get messageTypeImage => 'Şəkil';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Səs';

  @override
  String get messageTypeFile => 'Fayl';

  @override
  String get indefinitely => 'Müddətsiz';

  @override
  String get hoursShort => 's';

  @override
  String get minutesShort => 'dəq';

  @override
  String get hours => 'saat';

  @override
  String get minutes => 'dəqiqə';

  @override
  String get seconds => 'saniyə';

  @override
  String get ephemeralMessages => 'Müvəqqəti mesajlar';

  @override
  String get ephemeralMessagesDescription =>
      'Mesajlar bu müddətdən sonra avtomatik silinir';

  @override
  String get ephemeralImmediate => 'Dərhal (oxunduqdan sonra)';

  @override
  String get ephemeralImmediateDesc => 'Oxunduğu kimi silinir';

  @override
  String get ephemeralMyPreference => 'Mənim seçimim';

  @override
  String get ephemeralMyPreferenceDesc => 'Qlobal parametri istifadə et';

  @override
  String get ephemeralDefaultSetting => 'Mesaj müddəti';

  @override
  String get ephemeralChooseDefault => 'Tövsiyə olunan';

  @override
  String get ephemeral30Seconds => '30 saniyə';

  @override
  String get ephemeral30SecondsDesc => '30s sonra silinir';

  @override
  String get ephemeral5Minutes => '5 dəqiqə';

  @override
  String get ephemeral5MinutesDesc => '5dəq sonra silinir';

  @override
  String get ephemeral1Hour => '1 saat';

  @override
  String get ephemeral1HourDesc => '1 saat sonra silinir';

  @override
  String get ephemeral3Hours => '3 saat';

  @override
  String get ephemeral6Hours => '6 saat';

  @override
  String get ephemeral6HoursDesc => '6 saat sonra silinir';

  @override
  String get ephemeral12Hours => '12 saat';

  @override
  String get ephemeral24Hours => '24 saat';

  @override
  String get ephemeral24HoursDesc => '24 saat sonra silinir';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Xüsusi müddət';

  @override
  String get howItWorks => 'Necə işləyir';

  @override
  String get ephemeralExplanation1 =>
      'Mesajlar alındıqdan sonra serverdən silinir.';

  @override
  String get ephemeralExplanation2 =>
      'Bu parametr mesajların oxunduqdan sonra SİZİN telefonunuzdan nə vaxt yox olacağını müəyyən edir.';

  @override
  String get ephemeralExplanation3 =>
      'Kontaktınızın öz telefonu üçün öz parametri var.';

  @override
  String get mute1Hour => '1 saat';

  @override
  String get mute8Hours => '8 saat';

  @override
  String get mute1Day => '1 gün';

  @override
  String get mute1Week => '1 həftə';

  @override
  String get muteAlways => 'Həmişə';

  @override
  String get muteExplanation => 'Bu kontakt üçün bildiriş almayacaqsınız';

  @override
  String get showCallsInRecents => 'Son zənglərdə göstər';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash zəngləri telefon tarixində görünür';

  @override
  String get feedback => 'Rəy';

  @override
  String get muteNotifications => 'Bildirişləri sustur';

  @override
  String get muteDescription => 'Bu kontakt üçün bildiriş almayacaqsınız';

  @override
  String mutedUntil(String time) {
    return '$time tarixinə qədər susdurulub';
  }

  @override
  String get notMuted => 'Bildirişlər aktiv';

  @override
  String get unmute => 'Susdurmanı aç';

  @override
  String get notificationSound => 'Bildiriş səsi';

  @override
  String get defaultSound => 'Standart';

  @override
  String get chatSettings => 'Söhbət parametrləri';

  @override
  String get bubbleColor => 'Qabarcıq rəngi';

  @override
  String get backgroundColor => 'Arxa fon rəngi';

  @override
  String get backgroundImage => 'Arxa fon şəkli';

  @override
  String get chatBackground => 'Söhbət arxa fonu';

  @override
  String get customColor => 'Xüsusi';

  @override
  String get defaultColor => 'Standart';

  @override
  String get imageSelected => 'Şəkil seçildi';

  @override
  String get noImage => 'Şəkil yoxdur';

  @override
  String get color => 'Rəng';

  @override
  String get image => 'Şəkil';

  @override
  String get tapToSelectImage => 'Şəkil seçmək üçün toxunun';

  @override
  String get changeImage => 'Şəkli dəyiş';

  @override
  String get previewMessageReceived => 'Salam!';

  @override
  String get previewMessageSent => 'Necəsən!';

  @override
  String get messageAction => 'Mesaj';

  @override
  String get callAction => 'Zəng';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Şəxsi qeydlər';

  @override
  String get addNotes => 'Qeydlər əlavə et...';

  @override
  String get noNotes => 'Qeyd yoxdur';

  @override
  String get messageNotifications => 'Mesaj bildirişləri';

  @override
  String get callNotifications => 'Zəng bildirişləri';

  @override
  String get useGradient => 'Gradient istifadə et';

  @override
  String get gradientStart => 'Başlanğıc rəng';

  @override
  String get gradientEnd => 'Son rəng';

  @override
  String get preview => 'Önizləmə';

  @override
  String get reset => 'Sıfırla';

  @override
  String get securityNumber => 'Təhlükəsizlik nömrəsi';

  @override
  String securityNumberDescription(String name) {
    return 'Təhlükəsizlik nömrəsinin $name cihazı ilə uyğun olduğunu doğrulayın';
  }

  @override
  String get verifyEncryption => 'Ucdan-uca şifrələməni doğrula';

  @override
  String get tapToCopy => 'Kopyalamaq üçün toxunun';

  @override
  String get howToVerify => 'Necə doğrulamaq olar';

  @override
  String get verifyStep1 => 'Kontaktınızla şəxsən görüşün və ya zəng edin';

  @override
  String get verifyStep2 =>
      'Təhlükəsizlik nömrələrini müqayisə edin və ya QR kodları skan edin';

  @override
  String get verifyStep3 => 'Uyğun gəlirlərsə, söhbətiniz təhlükəsizdir';

  @override
  String get scanToVerify => 'Doğrulamaq üçün skan et';

  @override
  String get reportSpam => 'Spam bildir';

  @override
  String get reportSpamSubtitle => 'Bu kontaktı spam kimi bildir';

  @override
  String get reportSpamDescription =>
      'Bu kontaktı anonim şəkildə bildirəcək. Kimliyiniz paylaşılmayacaq. Əminsiniz?';

  @override
  String get report => 'Bildir';

  @override
  String get spamReported => 'Spam bildirildi';

  @override
  String get reportError =>
      'Bildiriş göndərilmədi. Xahiş edirik yenidən cəhd edin.';

  @override
  String get reportRateLimited =>
      'Bu gün üçün maksimum bildiriş sayına çatdınız.';

  @override
  String get blockContact => 'Kontaktı blokla';

  @override
  String get blockContactDescription =>
      'Bu kontakt artıq sizə mesaj göndərə və ya zəng edə bilməyəcək. Xəbərdar edilməyəcəklər.';

  @override
  String get unblockContact => 'Kontaktın blokunu aç';

  @override
  String get unblockContactDescription =>
      'Bu kontakt yenidən sizə mesaj göndərə və zəng edə biləcək.';

  @override
  String get contactBlocked => 'Kontakt bloklandı';

  @override
  String get contactUnblocked => 'Kontaktın bloku açıldı';

  @override
  String get contactIsBlocked => 'Bu kontakt bloklanıb';

  @override
  String get unblock => 'Bloku aç';

  @override
  String get deleteContactSubtitle => 'Bu kontaktı və söhbəti sil';

  @override
  String get confirmWithPin => 'PIN ilə təsdiqlə';

  @override
  String get enterPinToConfirm =>
      'Bu əməliyyatı təsdiqləmək üçün PIN-inizi daxil edin';

  @override
  String get profilePhoto => 'Profil şəkli';

  @override
  String get takePhoto => 'Şəkil çək';

  @override
  String get chooseFromGallery => 'Qalereyadan seç';

  @override
  String get removePhoto => 'Şəkli sil';

  @override
  String get viewContactHashId => 'Kontaktın identifikatorunu gör';

  @override
  String get hashIdPartiallyMasked =>
      'Təhlükəsizliyiniz və kontaktınızın məxfiliyi üçün qismən maskalanıb';

  @override
  String get addFirstContact => 'İlk kontaktınızı əlavə edin';

  @override
  String get addFirstContactSubtitle =>
      'QR kodunuzu paylaşın və ya dostunuzunkunu skan edin';

  @override
  String get directory => 'Kataloq';

  @override
  String get noContacts => 'Kontakt yoxdur';

  @override
  String get noContactsSubtitle => 'Başlamaq üçün kontakt əlavə edin';

  @override
  String get sendMessageAction => 'Mesaj göndər';

  @override
  String get audioCall => 'Səs zəngi';

  @override
  String get videoCall => 'Video zəng';

  @override
  String get viewProfile => 'Profili gör';

  @override
  String get deleteContactDirectory => 'Kontaktı sil';

  @override
  String get scanShort => 'Skan et';

  @override
  String get addShort => 'Əlavə et';

  @override
  String deleteContactConfirmName(String name) {
    return '$name silinsin?';
  }

  @override
  String get noNotesTitle => 'Qeyd yoxdur';

  @override
  String get noNotesSubtitle => 'İlk qeydinizi yaradın';

  @override
  String get newNote => 'Yeni qeyd';

  @override
  String get editNote => 'Qeydi redaktə et';

  @override
  String get deleteNote => 'Qeydi sil';

  @override
  String get deleteNoteConfirm => 'Bu qeydi silmək istədiyinizə əminsiniz?';

  @override
  String get noteTitle => 'Başlıq';

  @override
  String get noteContent => 'Məzmun';

  @override
  String get addItem => 'Element əlavə et';

  @override
  String get pinNote => 'Sabitlə';

  @override
  String get unpinNote => 'Sabitləmədən çıxar';

  @override
  String get noteColor => 'Rəng';

  @override
  String get notePassword => 'Şifrə';

  @override
  String get setPassword => 'Şifrə qoy';

  @override
  String get changePassword => 'Şifrəni dəyiş';

  @override
  String get removePassword => 'Şifrəni sil';

  @override
  String get enterPassword => 'Şifrəni daxil et';

  @override
  String get confirmPassword => 'Şifrəni təsdiqlə';

  @override
  String get passwordPin => 'PIN kodu';

  @override
  String get passwordText => 'Mətn şifrəsi';

  @override
  String get protectedNote => 'Qorunan qeyd';

  @override
  String get incorrectPassword => 'Yanlış şifrə';

  @override
  String get passwordSet => 'Şifrə qoyuldu';

  @override
  String get passwordRemoved => 'Şifrə silindi';

  @override
  String get notesBiometric => 'Qeydlər üçün Face ID';

  @override
  String get notesBiometricSubtitle =>
      'Qorunan qeydləri açmaq üçün biometrik doğrulama tələb et';

  @override
  String get textNote => 'Mətn qeydi';

  @override
  String get checklistNote => 'Yoxlama siyahısı';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tapşırıq';
  }

  @override
  String get autoSaved => 'Saxlanıldı';

  @override
  String get searchNotes => 'Qeydləri axtar';

  @override
  String get legalConsent => 'Hüquqi razılıq';

  @override
  String get confirmAge13 => 'Ən azı 13 yaşımın olduğunu təsdiqləyirəm';

  @override
  String get acceptLegalStart => 'Qəbul edirəm ';

  @override
  String get privacyPolicy => 'Məxfilik Siyasəti';

  @override
  String get termsOfService => 'Xidmət Şərtləri';

  @override
  String get andThe => ' və ';

  @override
  String get continueButton => 'Davam et';

  @override
  String get mustAcceptTerms =>
      'Davam etmək üçün hər iki şərti qəbul etməlisiniz';

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
  String get support => 'Dəstək';

  @override
  String get contactSupport => 'Dəstəklə əlaqə';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Sui-istifadə bildir';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Hüquqi';

  @override
  String get legalEntity => 'Hüquqi şəxs';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Sabitlə';

  @override
  String get unpinConversation => 'Sabitləmədən çıxar';

  @override
  String get hideConversation => 'Lentdən sil';

  @override
  String get deleteConversation => 'Söhbəti sil';

  @override
  String get deleteConversationConfirm =>
      'Bütün mesajların silinməsini təsdiqləmək üçün PIN-inizi daxil edin';

  @override
  String get noConversations => 'Hələ söhbət yoxdur';

  @override
  String get startConversation => 'Başla';

  @override
  String get microphonePermissionRequired => 'Mikrofon icazəsi tələb olunur';

  @override
  String get microphonePermissionExplanation =>
      'Hash-ın zəng etmək üçün mikrofona ehtiyacı var.';

  @override
  String get cameraPermissionExplanation =>
      'Hash-ın video zənglər üçün kameraya ehtiyacı var.';

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
  String get openSettings => 'Parametrləri aç';

  @override
  String get callConnecting => 'Bağlanır...';

  @override
  String get callRinging => 'Zəng çalır...';

  @override
  String get callReconnecting => 'Yenidən bağlanır...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Yenidən bağlanır (${seconds}s)';
  }

  @override
  String get callPaused => 'Fasilə';

  @override
  String get callPausedSubtitle => 'Zəng hələ davam edir';

  @override
  String get callRemoteMicMuted => 'Kontaktın mikrofonu susdurulub';

  @override
  String get callMiniControlsMute => 'Sustur';

  @override
  String get callMiniControlsUnmute => 'Susdurmanı aç';

  @override
  String get callMiniControlsHangUp => 'Bağla';

  @override
  String get callMiniControlsReturn => 'Zəngə qayıt';

  @override
  String get callNetworkPoor => 'Qeyri-sabit bağlantı';

  @override
  String get callNetworkLost => 'Bağlantı kəsildi';

  @override
  String get callEndedTitle => 'Zəng bitdi';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Cihaz məlumatları';

  @override
  String get deviceDataSubtitle => 'Yerli və server yaddaşı';

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
  String get localStorage => 'Yerli yaddaş';

  @override
  String get onThisDevice => 'bu cihazda';

  @override
  String get encryptedDatabases => 'Şifrələnmiş verilənlər bazaları';

  @override
  String get files => 'Fayllar';

  @override
  String get secureKeychain => 'Təhlükəsiz açar zənciri';

  @override
  String get cache => 'Keş';

  @override
  String get contactsDetail => 'Adlar, avatarlar, Signal açarları';

  @override
  String get messagesDetail => 'Şifrələnmiş söhbətlər';

  @override
  String get notesDetail => 'Şəxsi qeydlər';

  @override
  String get signalSessions => 'Signal sessiyaları';

  @override
  String get signalSessionsDetail => 'Şifrələmə sessiyaları';

  @override
  String get pendingContacts => 'Gözləyən kontaktlar';

  @override
  String get pendingContactsDetail => 'Gözləyən sorğular';

  @override
  String get callHistory => 'Zənglər';

  @override
  String get callHistoryDetail => 'Zəng tarixçəsi';

  @override
  String get preferences => 'Seçimlər';

  @override
  String get preferencesDetail => 'Media və zəng seçimləri';

  @override
  String get avatars => 'Avatarlar';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fayl',
      one: '1 fayl',
      zero: 'fayl yoxdur',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktiv';

  @override
  String get notDefined => 'Müəyyən edilməyib';

  @override
  String get biometrics => 'Biometrika';

  @override
  String get recoveryPhrase => 'Bərpa ifadəsi';

  @override
  String get identity => 'Kimlik (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol açarları';

  @override
  String get authTokens => 'Doğrulama tokenləri';

  @override
  String get contactNamesCache => 'Kontakt adları keşi';

  @override
  String get remoteConfig => 'Uzaq konfiqurasiya';

  @override
  String get notificationPrefs => 'Bildiriş seçimləri';

  @override
  String get serverData => 'Server məlumatları';

  @override
  String get serverDataInfo =>
      'Hash serverdə minimal məlumat saxlayır, hamısı şifrələnmiş və ya müvəqqəti.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, açıq açarlar, poçt qutusu tokeni';

  @override
  String get serverPrekeys => 'Ön-açarlar';

  @override
  String get serverPrekeysDetail =>
      'Birdəfəlik Signal açarları (istifadə olunmuş)';

  @override
  String get serverMessages => 'Tranzitdəki mesajlar';

  @override
  String get serverMessagesDetail => 'Çatdırıldıqdan sonra silinir (maks 24s)';

  @override
  String get serverMedia => 'Tranzitdəki media';

  @override
  String get serverMediaDetail => 'Yükləndikdən sonra silinir';

  @override
  String get serverContactRequests => 'Kontakt sorğuları';

  @override
  String get serverContactRequestsDetail => '24 saat sonra bitir';

  @override
  String get serverRateLimits => 'Tarif limitləri';

  @override
  String get serverRateLimitsDetail =>
      'Müvəqqəti sui-istifadə əleyhinə məlumatlar';

  @override
  String get privacyReassurance =>
      'Hash mesajlarınızı oxuya bilmir. Bütün məlumatlar ucdan-uca şifrələnir. Server məlumatları avtomatik silinir.';

  @override
  String get pinTooSimple => 'Bu PIN çox sadədir. Daha təhlükəsiz kod seçin.';

  @override
  String get genericError => 'Xəta baş verdi. Xahiş edirik yenidən cəhd edin.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Hesab yaradıla bilmir: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'İfadə mübadilə buferinə kopyalandı';

  @override
  String get copyPhrase => 'İfadəni kopyala';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Bu ifadəni təhlükəsiz yerdə yazın. PIN-inizi bu ifadə olmadan itirsəniz, məlumatlarınıza girişi həmişəlik itirəcəksiniz.';

  @override
  String get noMessages => 'Mesaj yoxdur';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name ilə bütün mesajlar silinsin?';
  }

  @override
  String get confirmation => 'Təsdiq';

  @override
  String get untitled => 'Başlıqsız';

  @override
  String get noSessions => 'Sessiya yoxdur';

  @override
  String get unknownContact => 'Naməlum kontakt';

  @override
  String get unnamed => 'Adsız';

  @override
  String get noPendingRequestsAlt => 'Gözləyən sorğu yoxdur';

  @override
  String get deleteAllCallHistory => 'Bütün zəng tarixçəsi silinsin?';

  @override
  String get noCalls => 'Zəng yoxdur';

  @override
  String get noPreferences => 'Seçim yoxdur';

  @override
  String get resetAllMediaPrefs => 'Bütün media seçimləri sıfırlansın?';

  @override
  String get deleteThisAvatar => 'Bu avatar silinsin?';

  @override
  String get deleteAllAvatars => 'Bütün avatarlar silinsin?';

  @override
  String get noAvatars => 'Avatar yoxdur';

  @override
  String get deleteThisFile => 'Bu fayl silinsin?';

  @override
  String get deleteAllMediaFiles => 'Bütün media silinsin?';

  @override
  String get noMediaFiles => 'Media yoxdur';

  @override
  String get outgoing => 'Gedən';

  @override
  String get incoming => 'Gələn';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Müvəqqəti baxış: ${seconds}s';
  }

  @override
  String get normalView => 'Normal baxış';

  @override
  String get callReasonCompleted => 'Tamamlandı';

  @override
  String get callReasonMissed => 'Buraxılmış';

  @override
  String get callReasonDeclined => 'Rədd edilmiş';

  @override
  String get callReasonFailed => 'Uğursuz';

  @override
  String get justNow => 'İndicə';

  @override
  String timeAgoMinutes(int count) {
    return '$count dəq əvvəl';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}s əvvəl';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}g əvvəl';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Məkan';

  @override
  String get statusQueued => 'Növbədə';

  @override
  String get blockedBadge => 'Bloklanmış';

  @override
  String get protectedBadge => 'Qorunan';

  @override
  String messageCount(int count) {
    return '$count mesaj';
  }

  @override
  String get deleteQuestion => 'Silinsin?';

  @override
  String get transferMyAccountTitle => 'Hesabımı köçür';

  @override
  String get loadingError => 'Yükləmə xətası';

  @override
  String get transferToNewDevice => 'Yeni cihaza köçür';

  @override
  String get transferInstructions =>
      'Yeni cihazınızda \"Hesabımı bərpa et\" seçib bu məlumatı daxil edin:';

  @override
  String get yourHashIdLabel => 'Hash ID-niz';

  @override
  String get enterYourPinCode => 'PIN kodunuzu daxil edin';

  @override
  String get pinOwnerConfirmation =>
      'Bu hesabın sahibi olduğunuzu təsdiqləmək üçün';

  @override
  String get scanThisQrCode => 'Bu QR kodu skan edin';

  @override
  String get withYourNewDevice => 'Yeni cihazınızla';

  @override
  String get orEnterTheCode => 'və ya kodu daxil edin';

  @override
  String get transferCodeLabel => 'Köçürmə kodu';

  @override
  String get proximityVerification => 'Yaxınlıq doğrulaması';

  @override
  String get bringDevicesCloser => 'Hər iki cihazı yaxınlaşdırın';

  @override
  String get confirmTransferQuestion => 'Köçürmə təsdiqlənsin?';

  @override
  String get accountWillBeTransferred =>
      'Hesabınız yeni cihaza köçürüləcək.\n\nBu cihaz həmişəlik ayrılacaq.';

  @override
  String get transferComplete => 'Köçürmə tamamlandı';

  @override
  String get transferSuccessMessage =>
      'Hesabınız uğurla köçürüldü.\n\nBu tətbiq indi bağlanacaq.';

  @override
  String get manualVerification => 'Əl ilə doğrulama';

  @override
  String get codeDisplayedOnBothDevices => 'Hər iki cihazda göstərilən kod:';

  @override
  String get doesCodeMatchNewDevice =>
      'Bu kod yeni cihazdakı ilə uyğun gəlirmi?';

  @override
  String get verifiedStatus => 'Doğrulanıb';

  @override
  String get inProgressStatus => 'Davam edir...';

  @override
  String get notAvailableStatus => 'Mövcud deyil';

  @override
  String get codeExpiredRestart =>
      'Kodun vaxtı bitmişdir. Xahiş edirik yenidən başladın.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kodlar uyğun gəlmir. Köçürmə ləğv edildi.';

  @override
  String transferToDevice(String device) {
    return 'Hədəf: $device';
  }

  @override
  String get copiedExclamation => 'Kopyalandı!';

  @override
  String expiresInTime(String time) {
    return '$time sonra bitəcək';
  }

  @override
  String get biometricNotAvailable => 'Bu cihazda biometrika mövcud deyil';

  @override
  String get biometricAuthError => 'Biometrik doğrulama zamanı xəta';

  @override
  String get authenticateForBiometric =>
      'Biometrikanı aktivləşdirmək üçün doğrulayın';

  @override
  String get biometricAuthFailed => 'Biometrik doğrulama uğursuz oldu';

  @override
  String get forceUpdateTitle => 'Yeniləmə tələb olunur';

  @override
  String get forceUpdateMessage =>
      'Hash-ın yeni versiyası mövcuddur. Davam etmək üçün yeniləyin.';

  @override
  String get updateButton => 'Yenilə';

  @override
  String get maintenanceInProgress => 'Texniki iş davam edir';

  @override
  String get tryAgainLater => 'Xahiş edirik sonra yenidən cəhd edin';

  @override
  String get information => 'Məlumat';

  @override
  String get later => 'Sonra';

  @override
  String get doYouLikeHash => 'Hash xoşunuza gəlir?';

  @override
  String get yourFeedbackHelps => 'Rəyiniz tətbiqi yaxşılaşdırmağa kömək edir';

  @override
  String get ratingTerrible => 'Dəhşətli';

  @override
  String get ratingBad => 'Pis';

  @override
  String get ratingOk => 'Normal';

  @override
  String get ratingGood => 'Yaxşı';

  @override
  String get ratingExcellent => 'Əla!';

  @override
  String get donationMessage =>
      'Hash qeyri-kommersiya layihəsidir. Dəstəyiniz həqiqətən gizli messencer yaratmağa kömək edir.';

  @override
  String get recentConnections => 'Son bağlantılar';

  @override
  String get loginInfoText =>
      'Hər PIN açma yerli olaraq qeyd olunur. Yalnız son 24 saat saxlanılır.';

  @override
  String get connectionCount => 'Bağlantı(lar)';

  @override
  String get periodLabel => 'Müddət';

  @override
  String get historyLabel => 'Tarix';

  @override
  String get noLoginRecorded => 'Giriş qeydə alınmayıb';

  @override
  String get nextUnlocksAppearHere => 'Növbəti kilidaçmalar burada görünəcək.';

  @override
  String get dataLocalOnly =>
      'Bu məlumatlar yalnız cihazınızda saxlanılır və heç vaxt ötürülmür.';

  @override
  String get currentSession => 'Cari';

  @override
  String get todayLabel => 'Bu gün';

  @override
  String get yesterdayLabel => 'Dünən';

  @override
  String get justNowLabel => 'İndicə';

  @override
  String minutesAgoLabel(int count) {
    return '$count dəq əvvəl';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}s əvvəl';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}s ${minutes}dəq əvvəl';
  }

  @override
  String get noMaintenancePlanned => 'Planlaşdırılmış texniki iş yoxdur';

  @override
  String get everythingWorkingNormally => 'Hər şey normal işləyir';

  @override
  String get maintenanceTitle => 'Texniki xidmət';

  @override
  String get maintenanceActiveLabel => 'DAVAM EDİR';

  @override
  String get maintenancePlannedLabel => 'PLANLAŞDIRILMIŞ';

  @override
  String get locking => 'Kilidlənir...';

  @override
  String get newMessageNotification => 'Yeni mesaj';

  @override
  String get secExplainTitle => 'Hash sizi necə qoruyur';

  @override
  String get secExplainIntro =>
      'Hash elə qurulub ki, heç kim mesajlarınızı oxuya bilməsin.';

  @override
  String get secExplainIntroSub =>
      'Hətta biz də.\nBudur necə işləyir, sadə izah.';

  @override
  String get secJourneyLabel => 'SƏYAHƏT';

  @override
  String get secJourneyTitle => 'Mesajınızın səyahəti';

  @override
  String get secJourneySubtitle =>
      'Barmağınızdan kontaktınızın ekranına qədər hər addım qorunur. Yolu izləyin.';

  @override
  String get secStep1Title => 'Mesajınızı yazırsınız';

  @override
  String get secStep1Desc =>
      'Tətbiqdə \"Salam!\" yazırsınız. Bu anda mesaj yalnız telefonunuzun yaddaşında mövcuddur. Heç nə göndərilməyib.';

  @override
  String get secStep2Title => 'Signal Protocol ilə şifrələmə';

  @override
  String get secStep2Desc =>
      '\"Göndər\" düyməsinə basdığınız anda mesajınız anlaşılmaz simvollara çevrilir. Sanki mesajınız yalnız kontaktınızın açarı olan bir seyfə kilidlənir.';

  @override
  String get secStep3Title => 'Sealed Sender: görünməz zərf';

  @override
  String get secStep3Desc =>
      'Təsəvvür edin ki, poçtla məktub göndərirsiniz, amma zərfdə göndərən ünvanı yoxdur. Hash məhz bunu edir. Mesaj anonim poçt qutusuna atılır. Server kimin göndərdiyini bilmir.';

  @override
  String get secStep4Title => 'Server heç nə görmür';

  @override
  String get secStep4Desc =>
      'Server kor poçtalyon rolunu oynayır. Yalnız \"kimsə #A7X9 poçt qutusuna nəsə atdı\" bilir. Kimin göndərdiyini, nə olduğunu və ya kimə olduğunu bilmir.';

  @override
  String get secStep4Highlight =>
      'Heç bir metadata saxlanılmır: IP ünvanı, zaman damğası, göndərən ilə alıcı arasında əlaqə yoxdur.';

  @override
  String get secStep5Title => 'Kontaktınız mesajı alır';

  @override
  String get secStep5Desc =>
      'Kontaktınızın telefonu anonim poçt qutusundan məzmunu alır və cihazından heç vaxt çıxmamış şəxsi açarla mesajı deşifrə edir. Ekranda \"Salam!\" görünür.';

  @override
  String get secStep6Title => 'Mesaj serverdən yox olur';

  @override
  String get secStep6Desc =>
      'Kontaktınız qəbulunu təsdiqlədikdən sonra server mesajı həmişəlik silir. Zibil qutusu yoxdur, arxiv yoxdur, ehtiyat nüsxə yoxdur. Hətta oxunmamış mesajlar 24 saatdan sonra avtomatik məhv edilir.';

  @override
  String get secStep7Title => 'Yerli bitmə';

  @override
  String get secStep7Desc =>
      'Kontaktınızın telefonunda mesaj seçdiyiniz müddətə görə özünü məhv edir: oxunduqdan dərhal sonra, 5 dəqiqə, 1 saat... siz qərar verirsiniz.';

  @override
  String get secJourneyConclusion =>
      'Nəticə: serverdə sıfır iz, cihazlarda sıfır iz. Mesaj yalnız oxunmaq üçün lazım olan müddət mövcud oldu, sonra yox oldu.';

  @override
  String get secArchLabel => 'ARXİTEKTURA';

  @override
  String get secArchTitle => '5 qoruma qatı';

  @override
  String get secArchSubtitle =>
      'Hash tək bir texnologiyaya güvənmir. Hər qat digərlərini gücləndirir. Bir qat kompromis edilsə belə, məlumatlarınız təhlükəsiz qalır.';

  @override
  String get secLayer1Title => 'Ucdan-uca şifrələmə';

  @override
  String get secLayer1Desc =>
      'Hər mesaj unikal açarla şifrələnir. Sadə dillə: kimsə bir mesajı deşifrə etsə belə, növbətisini deşifrə edə bilməyəcək. Hər mesajın öz kilidi var.';

  @override
  String get secLayer1Detail =>
      'Fayllar (şəkillər, videolar, sənədlər) üçün Hash əlavə AES-256-GCM şifrələmə istifadə edir. Fayl telefonunuzdan çıxmazdan əvvəl şifrələnir.';

  @override
  String get secLayer2Title => 'Sealed Sender (şəbəkə anonimliyi)';

  @override
  String get secLayer2Desc =>
      'Adi mesajlaşma tətbiqləri mesajlarınızı kimliyinizlə birlikdə göndərir. Sanki adınızı zərfə yazırsınız. Hash anonim poçt qutularından istifadə edir: server mesajı kimin göndərdiyini bilmədən çatdırır.';

  @override
  String get secLayer2Detail =>
      'Nəticə: hətta server məlumat sızması halında belə, kimin kiminlə danışdığını yenidən qurmaq mümkün deyil.';

  @override
  String get secLayer3Title => 'Avtomatik silmə';

  @override
  String get secLayer3Desc =>
      'Mesajlar qəbul təsdiqləndikdən sonra serverdən silinir. Mesaj heç vaxt alınmasa belə, 24 saatdan sonra avtomatik məhv edilir.';

  @override
  String get secLayer3Detail =>
      'Telefonunuzda mesajlar seçdiyiniz müddətə görə özlərini məhv edir: dərhal, 5 dəq, 15 dəq, 30 dəq, 1s, 3s, 6s, və ya 12s.';

  @override
  String get secLayer4Title => 'Yerli giriş qorunması';

  @override
  String get secLayer4Desc =>
      'Tətbiq 6 rəqəmli PIN və/və ya biometrika (Face ID, barmaq izi) ilə qorunur. Çox sayda uğursuz cəhddən sonra tətbiq hər uğursuzluqdan sonra artan gecikmə ilə kilidlənir.';

  @override
  String get secLayer5Title => 'Kilidlənmiş verilənlər bazası';

  @override
  String get secLayer5Desc =>
      'Server tərəfində heç bir istifadəçi birbaşa verilənlər bazasına yaza bilmir. Bütün əməliyyatlar hər sorğunu doğrulayan təhlükəsiz funksiyalardan keçir.';

  @override
  String get secLayer5Detail =>
      'Bu bank gişəsi kimidir: seyfi özünüz heç vaxt toxunmursunuz. Sorğu edirsiniz, sistem hərəkət etməzdən əvvəl hüququnuzu yoxlayır.';

  @override
  String get secVashLabel => 'DÜNYADA TƏK';

  @override
  String get secVashTitle => 'Vash rejimi';

  @override
  String get secVashSubtitle =>
      'Heç bir başqa mesajlaşma tətbiqində mövcud olmayan təcili təhlükəsizlik sistemi.';

  @override
  String get secVashScenarioTitle => 'Bu vəziyyəti təsəvvür edin';

  @override
  String get secVashScenario1 => 'Kimsə telefonunuza giriş əldə edir';

  @override
  String get secVashScenario2 => 'PIN kodunuz istənilir';

  @override
  String get secVashScenario3 =>
      'Bütün məlumatlarınızı təcili silmək istəyirsiniz';

  @override
  String get secVashSolutionTitle => 'Həll: iki PIN kodu';

  @override
  String get secVashSolutionDesc => 'Hash-da iki fərqli PIN kodu qurursunuz:';

  @override
  String get secVashNormalCodeLabel => 'Normal kod';

  @override
  String get secVashNormalCodeDesc =>
      'Tətbiqi bütün məlumatlarınızla normal açır';

  @override
  String get secVashCodeLabel2 => 'Vash kodu';

  @override
  String get secVashCodeDescription =>
      'Tətbiqi normal açır... amma bütün məlumatlarınız arxa planda sessiz silinir';

  @override
  String get secVashWhatHappensTitle => 'Sonra nə baş verir';

  @override
  String get secVashWhatHappensDesc =>
      'Tətbiq normal açılır. Xəbərdarlıq yoxdur, şübhəli animasiya yoxdur. Ekran sadəcə boş bir tətbiq göstərir, sanki indicə qurmuşsunuz.\n\nƏslində, bütün söhbətləriniz, kontaktlarınız və mesajlarınız saniyənin fraksiyasında geri dönməz şəkildə silinib.';

  @override
  String get secCallsLabel => 'ZƏNGLƏR VƏ FAYLLAR';

  @override
  String get secCallsTitle => 'Hər şey şifrələnir';

  @override
  String get secCallsSubtitle =>
      'Yalnız mesajlar deyil. Hash-dan keçən mütləq hər şey ucdan-uca şifrələnir.';

  @override
  String get secAudioCallTitle => 'Səs zəngləri';

  @override
  String get secAudioCallDesc =>
      'WebRTC vasitəsilə ucdan-uca şifrələnir. Səs cihazlar arasında birbaşa ötürülür.';

  @override
  String get secVideoCallTitle => 'Video zənglər';

  @override
  String get secVideoCallDesc =>
      'Eyni texnologiya, hər axın ayrı-ayrılıqda şifrələnir.';

  @override
  String get secPhotosTitle => 'Şəkillər və videolar';

  @override
  String get secPhotosDesc =>
      'Telefonunuzdan çıxmazdan əvvəl AES-256-GCM ilə şifrələnir.';

  @override
  String get secDocsTitle => 'Sənədlər';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, istənilən fayl. Ad, ölçü və məzmun şifrələnir.';

  @override
  String get secAnonLabel => 'ANONİMLİK';

  @override
  String get secAnonTitle => 'Kimlik tələb olunmur';

  @override
  String get secAnonSubtitle =>
      'Hash heç vaxt telefon nömrənizi və ya e-poçtunuzu istəmir. Siz unikal və anonim Hash ID ilə tanınırsınız.';

  @override
  String get secHashIdTitle => 'Hash ID-niz';

  @override
  String get secHashIdDesc =>
      'Bu sizin unikal identifikatorunuzdur. Haqqınızda heç nə aşkar etmir: nə adınızı, nə nömrənizi, nə yerinizi. Real kimliyinizlə əlaqələndirmək mümkün olmayan ləqəb kimidir.\n\nKontakt əlavə etmək üçün Hash ID-nizi paylaşırsınız və ya QR kodu skan edirsiniz. Vəssalam. Sinxronizasiya edilmiş ünvan dəftəri yoxdur, \"Tanıya biləcəyiniz insanlar\" təklifləri yoxdur.';

  @override
  String get secDataLabel => 'MƏLUMAT';

  @override
  String get secDataTitle => 'Hash-ın bilmədiyi';

  @override
  String get secDataSubtitle =>
      'Məlumatlarınızı qorumanın ən yaxşı yolu onları toplamamaqdır.';

  @override
  String get secNeverCollected => 'Heç vaxt toplanmır';

  @override
  String get secNeverItem1 => 'Mesaj məzmunu';

  @override
  String get secNeverItem2 => 'Kontakt siyahısı';

  @override
  String get secNeverItem3 => 'Telefon nömrəsi';

  @override
  String get secNeverItem4 => 'E-poçt ünvanı';

  @override
  String get secNeverItem5 => 'IP ünvanı';

  @override
  String get secNeverItem6 => 'Məkan';

  @override
  String get secNeverItem7 => 'Metadata (kimin kiminlə danışması)';

  @override
  String get secNeverItem8 => 'Zəng tarixçəsi';

  @override
  String get secNeverItem9 => 'Ünvan dəftəri';

  @override
  String get secNeverItem10 => 'Reklam identifikatorları';

  @override
  String get secTempStored => 'Müvəqqəti saxlanılır';

  @override
  String get secTempItem1 => 'Anonim Hash ID (unikal identifikator)';

  @override
  String get secTempItem2 => 'Açıq şifrələmə açarları';

  @override
  String get secTempItem3 => 'Tranzitdəki şifrələnmiş mesajlar (maks 24s)';

  @override
  String get secTempNote =>
      'Hətta bu minimal məlumat belə sizi tanıya bilmir. Hash ID-niz heç bir şəxsi məlumatla əlaqəli deyil.';

  @override
  String get secFooterTitle => 'Məxfiliyiniz, azadlığınız';

  @override
  String get secFooterDesc =>
      'Hash ən tələbkar peşəkar tətbiqlərlə eyni şifrələmə texnologiyalarını istifadə edir. Mesajlarınız riyaziyyatla qorunur, vədlərlə deyil.';

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
