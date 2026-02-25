// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Sifir Iz. Sifir Taviz.';

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
  String get conversations => 'Sohbetler';

  @override
  String get contacts => 'Kisiler';

  @override
  String get noConversation => 'Sohbet yok';

  @override
  String get noConversationSubtitle =>
      'Guvenli bir sekilde sohbet etmeye baslamak icin bir kisi ekleyin';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bekleyen istek',
      one: '1 bekleyen istek',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gonderilmis istek bekliyor',
      one: '1 gonderilmis istek bekliyor',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Kisi ekle';

  @override
  String get shareApp => 'Uygulamayi paylas';

  @override
  String get newMessage => 'Yeni mesaj';

  @override
  String get newConversation => 'Mesaj gonder';

  @override
  String get settings => 'Ayarlar';

  @override
  String get myHashId => 'Hash Kimligim';

  @override
  String get supportHash => 'Hash\'i Destekle';

  @override
  String get supportHashSubtitle => 'Hash kar amaci gutmeyen bir projedir';

  @override
  String get donate => 'Bagis yap';

  @override
  String get appearance => 'Gorunum';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Otomatik';

  @override
  String get themeAutoSubtitle => 'Sistem ayarlarini takip eder';

  @override
  String get themeDark => 'Karanlik';

  @override
  String get themeLight => 'Aydinlik';

  @override
  String get themeRecommendation =>
      'Daha iyi gizlilik icin karanlik tema onerilir';

  @override
  String get language => 'Dil';

  @override
  String get languageAuto => 'Otomatik (sistem)';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get messages => 'Mesajlar';

  @override
  String get calls => 'Aramalar';

  @override
  String get vibration => 'Titresim';

  @override
  String get notificationContent => 'Bildirim icerigi';

  @override
  String get notificationContentFull => 'Tumunu goster';

  @override
  String get notificationContentFullDesc => 'Kisi adi ve mesaj onizlemesi';

  @override
  String get notificationContentName => 'Yalnizca ad';

  @override
  String get notificationContentNameDesc => 'Yalnizca kisi adini gosterir';

  @override
  String get notificationContentDiscrete => 'Gizli';

  @override
  String get notificationContentDiscreteDesc =>
      'Yalnizca \"Yeni mesaj\" gosterir';

  @override
  String get security => 'Guvenlik';

  @override
  String get howHashProtectsYou => 'Hash seni nasil koruyor';

  @override
  String get howHashProtectsYouSubtitle => 'Guvenligini anla';

  @override
  String get accountSecurity => 'Hesap guvenligi';

  @override
  String get accountSecuritySubtitle => 'PIN, biyometri, Vash Modu';

  @override
  String get blockScreenshots => 'Ekran goruntularini engelle';

  @override
  String get transferDevice => 'Baska bir cihaza aktar';

  @override
  String get transferDeviceSubtitle => 'Hesabinizi tasiyin';

  @override
  String get pinCode => 'PIN kodu';

  @override
  String get changePin => 'PIN kodunu degistir';

  @override
  String get currentPin => 'Mevcut PIN kodu';

  @override
  String get newPin => 'Yeni PIN kodu';

  @override
  String get confirmPin => 'PIN kodunu onayla';

  @override
  String get pinChanged => 'PIN kodu degistirildi';

  @override
  String get incorrectPin => 'Yanlis PIN';

  @override
  String get pinsDoNotMatch => 'PIN kodlari eslesmiyor';

  @override
  String get autoLock => 'Otomatik kilitleme';

  @override
  String get autoLockDelay => 'Kilitleme gecikmesi';

  @override
  String get autoLockImmediate => 'Hemen';

  @override
  String get autoLockMinute => '1 dakika';

  @override
  String autoLockMinutes(int count) {
    return '$count dakika';
  }

  @override
  String get vashCode => 'Vash kodu';

  @override
  String get vashModeTitle => 'Vash Modu';

  @override
  String get vashModeExplanation => 'En son guvenlik aginiz.';

  @override
  String get vashModeDescription =>
      'Ikinci bir PIN kodu sececeksiniz. Hash\'i acmaya zorlanirseniz, normal PIN\'iniz yerine bu kodu girin.\n\nUygulama normal sekilde acilacak, ancak tum sohbetleriniz ve kisileriniz yok olmus olacak.\n\nEkraniniza bakan herhangi biri icin Hash bos gorunur - sanki hic kullanmamissiniz gibi.';

  @override
  String get vashModeIrreversible => 'Bu islem sessiz ve geri donusuzdur.';

  @override
  String get chooseVashCode => 'Vash kodumu sec';

  @override
  String get vashCodeInfo =>
      'Uygulamayi normal ama bos acan ikinci bir PIN kodu.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'PIN\'iniz yerine bu kodu girerseniz:';

  @override
  String get vashDeleteContacts => 'Kisileriniz kaybolur';

  @override
  String get vashDeleteMessages => 'Sohbetleriniz kaybolur';

  @override
  String get vashDeleteHistory => 'Notlariniz kaybolur';

  @override
  String get vashKeepId => 'Hash kimliginiz (#XXX-XXX-XXX) ayni kalir';

  @override
  String get vashAppearNormal =>
      'Uygulama normal ama bos gorunur, yeni gibi. Bu islem geri donusuzdur.';

  @override
  String get setupVashCode => 'Vash kodunu ayarla';

  @override
  String get modifyVashCode => 'Vash kodunu degistir';

  @override
  String get currentVashCode => 'Mevcut Vash kodu';

  @override
  String get newVashCode => 'Yeni Vash kodu';

  @override
  String get confirmVashCode => 'Vash kodunu onayla';

  @override
  String get vashCodeConfigured => 'Vash kodu yapilandirildi';

  @override
  String get vashCodeModified => 'Vash kodu degistirildi';

  @override
  String get vashCodeMustDiffer => 'Vash kodu PIN\'den farkli olmalidir';

  @override
  String get incorrectVashCode => 'Yanlis Vash kodu';

  @override
  String get vashWhatToDelete => 'Vash Modu neyi yok etsin?';

  @override
  String get vashDeleteContactsOption => 'Kisiler';

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
  String get vashDeleteNotesOption => 'Notlar';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash Modu etkinlestirildi';

  @override
  String get vashCreateSubtitle => 'Ana PIN\'inizden farkli bir kod secin';

  @override
  String get vashConfirmSubtitle => 'Vash kodunuzu onaylayin';

  @override
  String get pinCodeForEntry => 'Uygulamaya giris PIN kodu';

  @override
  String get vashCodeSection => 'Vash Modu';

  @override
  String get biometric => 'Biyometri';

  @override
  String get biometricUnlock => 'Parmak izi veya Face ID ile kilidi ac';

  @override
  String get enableBiometric => 'Biyometriyi etkinlestir';

  @override
  String get biometricWarningMessage =>
      'Biyometriyi etkinlestirdiginizde, uygulamaya girmek icin Vash kodunuzu kullanamazsiniz.\n\nVash kodunu yalnizca biyometri basarisiz olursa (birden fazla basarisiz denemeden sonra) kullanabilirsiniz.\n\nDevam etmek istediginizden emin misiniz?';

  @override
  String get understood => 'Anladim';

  @override
  String get shareAppSubtitle => 'Hash\'i yakinlarinizla paylasin';

  @override
  String get share => 'Paylas';

  @override
  String get danger => 'Tehlike';

  @override
  String get deleteAccount => 'Hesabimi sil';

  @override
  String get deleteAccountSubtitle => 'Geri donulemez islem';

  @override
  String get deleteAccountConfirmTitle => 'Hesabimi sil';

  @override
  String get deleteAccountConfirmMessage =>
      'Hesabiniz kalici olarak silinecektir. Bu islem geri donusuzdur.\n\n- Tum sohbetleriniz\n- Tum kisileriniz\n- Hash Kimliginiz\n\nYeni bir hesap olusturmaniz gerekecektir.';

  @override
  String get deleteForever => 'Kalici olarak sil';

  @override
  String get cancel => 'Iptal';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash Modu etkinlestirildi.';

  @override
  String deletionError(String error) {
    return 'Silme hatasi: $error';
  }

  @override
  String get yourSecurity => 'Guvenliginiz';

  @override
  String get securityInfo =>
      '- Uctan uca sifreleme (Signal Protocol)\n- Teslimattan sonra sunucularimizda veri yok\n- Anahtarlar yalnizca cihazinizda saklanir\n- PIN kodu asla sunucuya gonderilmez';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Hos geldiniz';

  @override
  String get securityStatement1 => 'Mesajlariniz koruma altinda.';

  @override
  String get securityStatement2 => 'Uctan uca sifreleme.';

  @override
  String get securityStatement3 => 'Iz yok. Taviz yok.';

  @override
  String get securityStatement4 => 'Gizliliginiz bir haktir.';

  @override
  String get accessBlocked => 'Erisim engellendi';

  @override
  String get tooManyAttempts => 'Cok fazla deneme. Daha sonra tekrar deneyin.';

  @override
  String get pleaseWait => 'Lutfen bekleyin';

  @override
  String get waitDelay => 'Lutfen gecikmenin bitmesini bekleyin';

  @override
  String attemptCount(int current, int max) {
    return 'Deneme $current / $max';
  }

  @override
  String retryIn(String time) {
    return '$time sonra tekrar deneyin';
  }

  @override
  String get forgotPin => 'PIN\'i mi unuttunuz? Kurtarma ifadesini kullanin';

  @override
  String get useRecoveryPhrase => 'Kurtarma ifadesini kullan';

  @override
  String get recoveryWarningTitle => 'Uyari';

  @override
  String get recoveryWarningMessage =>
      'Hesap kurtarma su islemleri yapacaktir:';

  @override
  String get recoveryDeleteAllMessages => 'TUM mesajlarinizi silecektir';

  @override
  String get recoveryWaitDelay => '1 saatlik bekleme suresi gerektirecektir';

  @override
  String get recoveryKeepContacts => 'Kisilerinizi koruyacaktir';

  @override
  String get recoveryIrreversible =>
      'Bu islem geri donusuzdur. Mesajlariniz kalici olarak kaybolacaktir.';

  @override
  String get iUnderstand => 'Anliyorum';

  @override
  String get accountRecovery => 'Hesap kurtarma';

  @override
  String get enterRecoveryPhrase =>
      'Kurtarma ifadenizin 24 kelimesini boslukla ayirarak girin.';

  @override
  String get recoveryPhraseHint => 'kelime1 kelime2 kelime3 ...';

  @override
  String get recover => 'Kurtar';

  @override
  String get recoveryPhraseRequired => 'Lutfen kurtarma ifadenizi girin';

  @override
  String get recoveryPhrase24Words => 'Ifade tam olarak 24 kelime icermelidir';

  @override
  String get incorrectRecoveryPhrase => 'Yanlis kurtarma ifadesi';

  @override
  String get recoveryInitError => 'Kurtarma baslatma hatasi';

  @override
  String get securityDelay => 'Guvenlik gecikmesi';

  @override
  String get securityDelayMessage =>
      'Guvenliginiz icin, yeni bir PIN olusturmadan once bekleme suresi gerekmektedir.';

  @override
  String get timeRemaining => 'Kalan sure';

  @override
  String get messagesDeletedForProtection =>
      'Mesajlariniz korumaniz icin silindi.';

  @override
  String get canCloseApp =>
      'Uygulamayi kapatip daha sonra geri donebilirsiniz.';

  @override
  String get onboardingTitle1 => 'Hash\'e Hos Geldiniz';

  @override
  String get onboardingSubtitle1 => 'Iz birakmayan mesajlasma uygulamasi';

  @override
  String get onboardingTitle2 => 'Tam sifreleme';

  @override
  String get onboardingSubtitle2 =>
      'Mesajlariniz Signal protokolu ile uctan uca sifrelenir';

  @override
  String get onboardingTitle3 => 'Iz yok';

  @override
  String get onboardingSubtitle3 =>
      'Mesajlar teslim edildiginde sunuculardan silinir';

  @override
  String get onboardingTitle4 => 'Guvenliginiz';

  @override
  String get onboardingSubtitle4 => 'PIN kodu, Vash Modu ve kurtarma ifadesi';

  @override
  String get getStarted => 'Basla';

  @override
  String get next => 'Ileri';

  @override
  String get skip => 'Atla';

  @override
  String get alreadyHaveAccount => 'Zaten bir hesabim var';

  @override
  String get transferMyAccount => 'Hesabimi aktar';

  @override
  String get createPin => 'Bir PIN kodu olusturun';

  @override
  String get createPinSubtitle => 'Bu kod uygulamaniza erisimi koruyacaktir';

  @override
  String get confirmYourPin => 'PIN kodunuzu onaylayin';

  @override
  String get confirmPinSubtitle => 'PIN kodunuzu tekrar girin';

  @override
  String get saveRecoveryPhrase => 'Kurtarma ifadesi';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Bu 24 kelimeyi sirasiyla yazin. PIN\'inizi unutursaniz hesabinizi kurtarmanizi saglayacaktir.';

  @override
  String get phraseWritten => 'Ifademi yazdim';

  @override
  String get warningRecoveryPhrase =>
      'Bu ifadeyi kaybeder ve PIN\'inizi unutursaniz, hesabiniza erisimi kaybedersiniz.';

  @override
  String get accountTransferred => 'Hesap aktarildi';

  @override
  String get accountTransferredMessage =>
      'Hesabiniz baska bir cihaza aktarildi. Bu oturum artik gecerli degil.';

  @override
  String get accountTransferredInfo =>
      'Bu aktarimi siz baslatmadiyseniz, hesabiniz ele gecirilmis olabilir.';

  @override
  String get logout => 'Cikis yap';

  @override
  String get transferAccount => 'Hesabi aktar';

  @override
  String get transferAccountInfo =>
      'Hash hesabinizi yeni bir cihaza aktarin. Mevcut oturumunuz gecersiz kilinacaktir.';

  @override
  String get generateTransferCode => 'Aktarim kodu olustur';

  @override
  String get transferCode => 'Aktarim kodu';

  @override
  String transferCodeExpires(int minutes) {
    return 'Bu kodun suresi $minutes dakika icinde dolacak';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Hesabinizi aktarmak icin bu kodu yeni cihaziniza girin.';

  @override
  String get generateNewCode => 'Yeni kod olustur';

  @override
  String get scanQrCode => 'QR kodu tara';

  @override
  String get scanQrCodeSubtitle => 'Eklemek icin bir kisinin QR kodunu tarayin';

  @override
  String get qrCodeDetected => 'QR kodu algilandi';

  @override
  String get invalidQrCode => 'Gecersiz QR kodu';

  @override
  String get cameraPermissionRequired => 'Kamera izni gerekli';

  @override
  String get myQrCode => 'QR Kodum';

  @override
  String get myQrCodeSubtitle =>
      'Kisilerinizin sizi ekleyebilmesi icin bu QR kodu paylasin';

  @override
  String get shareQrCode => 'Paylas';

  @override
  String get addContactTitle => 'Kisi ekle';

  @override
  String get addContactByHashId => 'Kisinizin Hash Kimligini girin';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Ara';

  @override
  String get contactNotFound => 'Kisi bulunamadi';

  @override
  String get contactAlreadyAdded => 'Bu kisi zaten listenizde';

  @override
  String get contactAdded => 'Kisi eklendi';

  @override
  String get myProfile => 'Profilim';

  @override
  String get myProfileSubtitle =>
      'Baskalari sizi ekleyebilsin diye bu bilgileri paylasin';

  @override
  String get temporaryCode => 'Gecici kod';

  @override
  String temporaryCodeExpires(String time) {
    return '$time icinde sona erer';
  }

  @override
  String get codeExpired => 'Kodun suresi doldu';

  @override
  String get generateNewCodeButton => 'Yeni kod';

  @override
  String get copyHashId => 'Kimligi kopyala';

  @override
  String get copyCode => 'Kodu kopyala';

  @override
  String get copiedToClipboard => 'Kopyalandi';

  @override
  String get showMyQrCode => 'QR kodumu goster';

  @override
  String get orDivider => 'veya';

  @override
  String get openScanner => 'Tarayiciyi ac';

  @override
  String get addManually => 'Elle ekle';

  @override
  String get contactHashIdLabel => 'Kisinin Hash Kimligi';

  @override
  String get temporaryCodeLabel => 'Gecici kod';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Kisinizden profilinden bir kod olusturmasini isteyin';

  @override
  String get verifyAndAdd => 'Dogrula ve ekle';

  @override
  String get fillAllFields => 'Lutfen tum alanlari doldurun';

  @override
  String get invalidHashIdFormat =>
      'Gecersiz kimlik formati (orn: 123-456-ABC)';

  @override
  String get userNotFound => 'Kullanici bulunamadi';

  @override
  String get cannotAddYourself => 'Kendinizi ekleyemezsiniz';

  @override
  String get invalidOrExpiredCode => 'Gecersiz veya suresi dolmus gecici kod';

  @override
  String get contactFound => 'Kisi bulundu!';

  @override
  String get howToCallContact => 'Ona ne ad vermek istersiniz?';

  @override
  String get contactNameHint => 'Kisi adi';

  @override
  String get addContactButton => 'Ekle';

  @override
  String get contactDetails => 'Kisi detaylari';

  @override
  String get contactName => 'Kisi adi';

  @override
  String get contactHashId => 'Hash Kimligi';

  @override
  String addedOn(String date) {
    return '$date tarihinde eklendi';
  }

  @override
  String get deleteContact => 'Kisiyi sil';

  @override
  String deleteContactConfirm(Object name) {
    return 'Bu kisi silinsin mi?';
  }

  @override
  String get deleteContactMessage => 'Bu islem tum sohbeti de silecektir.';

  @override
  String get delete => 'Sil';

  @override
  String get typeMessage => 'Bir mesaj yazin...';

  @override
  String get messageSent => 'Gonderildi';

  @override
  String get messageDelivered => 'Iletildi';

  @override
  String get messageRead => 'Okundu';

  @override
  String get messageFailed => 'Gonderilemedi';

  @override
  String get now => 'Simdi';

  @override
  String minutesAgo(int count) {
    return '${count}dk';
  }

  @override
  String hoursAgo(int count) {
    return '${count}sa';
  }

  @override
  String daysAgo(int count) {
    return '${count}g';
  }

  @override
  String get today => 'Bugun';

  @override
  String get yesterday => 'Dun';

  @override
  String dateAtTime(String date, String time) {
    return '$date saat $time';
  }

  @override
  String get shareMessage =>
      'Hash\'te bana katil! 🔒\n\nGercekten ozel bir mesajlasma uygulamasi: tam sifreleme, sunucularda iz yok ve gerekirse panik modu.\n\nUygulamayi buradan indir 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Hata';

  @override
  String get ok => 'Tamam';

  @override
  String get view => 'Goruntule';

  @override
  String get yes => 'Evet';

  @override
  String get no => 'Hayir';

  @override
  String get save => 'Kaydet';

  @override
  String get edit => 'Duzenle';

  @override
  String get close => 'Kapat';

  @override
  String get confirm => 'Onayla';

  @override
  String get loading => 'Yukleniyor...';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Bekleyen istekler';

  @override
  String get noPendingRequests => 'Bekleyen istek yok';

  @override
  String get pendingRequestsSubtitle => 'Bu kisiler sizi eklemek istiyor';

  @override
  String requestFromUser(String hashId) {
    return '$hashId tarafindan istek';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days gun icinde sona erer';
  }

  @override
  String get acceptRequest => 'Kabul et';

  @override
  String get rejectRequest => 'Reddet';

  @override
  String get requestAccepted => 'Istek kabul edildi';

  @override
  String get requestRejected => 'Istek reddedildi';

  @override
  String get requestSent => 'Istek gonderildi!';

  @override
  String get requestSentSubtitle =>
      'Isteginiz gonderildi. Sohbet edebilmeniz icin kullanicinin kabul etmesi gerekiyor.';

  @override
  String get requestAlreadyPending => 'Bir istek zaten beklemede';

  @override
  String get requestAlreadySentByOther =>
      'Bu kisi size zaten bir istek gonderdi';

  @override
  String get addByHashId => 'Hash Kimligi ile ekle';

  @override
  String get addByHashIdSubtitle =>
      'Kisinin Hash Kimligini ve gecici kodunu girin';

  @override
  String get enterTemporaryCode => '6 haneli kodu girin';

  @override
  String get sendRequest => 'Istek gonder';

  @override
  String get acceptContactTitle => 'Kisiyi kabul et';

  @override
  String get acceptContactSubtitle => 'Ona ozel bir ad verebilirsiniz';

  @override
  String get leaveEmptyForHashId => 'Hash Kimligini kullanmak icin bos birakin';

  @override
  String get firstName => 'Ad';

  @override
  String get lastName => 'Soyad';

  @override
  String get notes => 'Notlar';

  @override
  String get notesHint => 'Bu kisi hakkinda kisisel notlar';

  @override
  String get photoOptional => 'Fotograf (istege bagli)';

  @override
  String get contactNameOptional => 'Ad (istege bagli)';

  @override
  String get notesOptional => 'Notlar (istege bagli)';

  @override
  String get storedLocally => 'Yalnizca cihazinizda saklanir';

  @override
  String get encryptedMessageLabel => 'Sifreli mesaj';

  @override
  String get identityMessageHint => 'Kimsiniz? Birbirinizi nasil taniyorsunuz?';

  @override
  String get messageWillBeSentEncrypted =>
      'Bu mesaj sifrelenerek aliciya gonderilecektir';

  @override
  String get sendRequestButton => 'Istek gonder';

  @override
  String get requestExpiresIn24h =>
      'Kabul edilmezse istek 24 saat icinde sona erer';

  @override
  String get theyAlreadySentYouRequest =>
      'Bu kisi size zaten bir istek gonderdi';

  @override
  String get requests => 'Istekler';

  @override
  String get receivedRequests => 'Alinan';

  @override
  String get sentRequests => 'Gonderilen';

  @override
  String get noSentRequests => 'Gonderilen istek yok';

  @override
  String get cancelRequest => 'Iptal';

  @override
  String get deleteRequest => 'Istegi sil';

  @override
  String get requestCancelled => 'Istek iptal edildi';

  @override
  String sentTo(String hashId) {
    return '$hashId adresine gonderildi';
  }

  @override
  String expiresIn(String time) {
    return '$time icinde sona erer';
  }

  @override
  String receivedAgo(String time) {
    return '$time once alindi';
  }

  @override
  String get messageFromRequester => 'Istek sahibinden mesaj';

  @override
  String get copy => 'Kopyala';

  @override
  String get messageInfo => 'Mesaj bilgisi';

  @override
  String get messageDirection => 'Yon';

  @override
  String get messageSentByYou => 'Sizin tarafinizdan gonderildi';

  @override
  String get messageReceived => 'Alindi';

  @override
  String get messageSentAt => 'Gonderilme zamani';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Durum';

  @override
  String get messageReadAt => 'Okunma zamani';

  @override
  String get messageType => 'Tur';

  @override
  String get messageSize => 'Boyut';

  @override
  String get messageExpiresAt => 'Sona erme zamani';

  @override
  String get messageEncrypted => 'Uctan uca sifreli';

  @override
  String get messageStatusSending => 'Gonderiliyor...';

  @override
  String get messageStatusSent => 'Gonderildi';

  @override
  String get messageStatusDelivered => 'Iletildi';

  @override
  String get messageStatusRead => 'Okundu';

  @override
  String get messageStatusFailed => 'Basarisiz';

  @override
  String get serverStatus => 'Sunucu';

  @override
  String get onServer => 'Teslim bekliyor';

  @override
  String get deletedFromServer => 'Silindi';

  @override
  String get messageTypeText => 'Metin';

  @override
  String get messageTypeImage => 'Gorsel';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Ses';

  @override
  String get messageTypeFile => 'Dosya';

  @override
  String get indefinitely => 'Suresiz';

  @override
  String get hoursShort => 'sa';

  @override
  String get minutesShort => 'dk';

  @override
  String get hours => 'saat';

  @override
  String get minutes => 'dakika';

  @override
  String get seconds => 'saniye';

  @override
  String get ephemeralMessages => 'Gecici mesajlar';

  @override
  String get ephemeralMessagesDescription =>
      'Mesajlar bu sureden sonra otomatik olarak silinir';

  @override
  String get ephemeralImmediate => 'Aninda (okuduktan sonra)';

  @override
  String get ephemeralImmediateDesc => 'Okunur okunmaz silinir';

  @override
  String get ephemeralMyPreference => 'Benim tercihim';

  @override
  String get ephemeralMyPreferenceDesc => 'Genel ayari kullan';

  @override
  String get ephemeralDefaultSetting => 'Mesaj suresi';

  @override
  String get ephemeralChooseDefault => 'Onerilen';

  @override
  String get ephemeral30Seconds => '30 saniye';

  @override
  String get ephemeral30SecondsDesc => 'Okuduktan 30 saniye sonra silinir';

  @override
  String get ephemeral5Minutes => '5 dakika';

  @override
  String get ephemeral5MinutesDesc => 'Okuduktan 5 dakika sonra silinir';

  @override
  String get ephemeral1Hour => '1 saat';

  @override
  String get ephemeral1HourDesc => 'Okuduktan 1 saat sonra silinir';

  @override
  String get ephemeral3Hours => '3 saat';

  @override
  String get ephemeral6Hours => '6 saat';

  @override
  String get ephemeral6HoursDesc => 'Okuduktan 6 saat sonra silinir';

  @override
  String get ephemeral12Hours => '12 saat';

  @override
  String get ephemeral24Hours => '24 saat';

  @override
  String get ephemeral24HoursDesc => 'Okuduktan 24 saat sonra silinir';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Ozel sure';

  @override
  String get howItWorks => 'Nasil calisir';

  @override
  String get ephemeralExplanation1 =>
      'Mesajlar alinir alinmaz sunucudan silinir.';

  @override
  String get ephemeralExplanation2 =>
      'Bu ayar, mesajlarin okuduktan sonra SIZIN telefonunuzdan ne zaman kaybolacagini belirler.';

  @override
  String get ephemeralExplanation3 =>
      'Kisinizin kendi telefonu icin kendi ayari vardir.';

  @override
  String get mute1Hour => '1 saat';

  @override
  String get mute8Hours => '8 saat';

  @override
  String get mute1Day => '1 gun';

  @override
  String get mute1Week => '1 hafta';

  @override
  String get muteAlways => 'Her zaman';

  @override
  String get muteExplanation => 'Bu kisi icin bildirim almayacaksiniz';

  @override
  String get showCallsInRecents => 'Son aramalarda goster';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash aramalari telefonun arama gecmisinde gorunur';

  @override
  String get feedback => 'Geri bildirim';

  @override
  String get muteNotifications => 'Bildirimleri sustur';

  @override
  String get muteDescription => 'Bu kisi icin bildirim almayacaksiniz';

  @override
  String mutedUntil(String time) {
    return '$time tarihine kadar sessiz';
  }

  @override
  String get notMuted => 'Bildirimler etkin';

  @override
  String get unmute => 'Sesi ac';

  @override
  String get notificationSound => 'Bildirim sesi';

  @override
  String get defaultSound => 'Varsayilan';

  @override
  String get chatSettings => 'Sohbet ayarlari';

  @override
  String get bubbleColor => 'Balon rengi';

  @override
  String get backgroundColor => 'Arka plan rengi';

  @override
  String get backgroundImage => 'Arka plan gorseli';

  @override
  String get chatBackground => 'Sohbet arka plani';

  @override
  String get customColor => 'Ozel';

  @override
  String get defaultColor => 'Varsayilan';

  @override
  String get imageSelected => 'Gorsel secildi';

  @override
  String get noImage => 'Gorsel yok';

  @override
  String get color => 'Renk';

  @override
  String get image => 'Gorsel';

  @override
  String get tapToSelectImage => 'Gorsel secmek icin dokunun';

  @override
  String get changeImage => 'Gorseli degistir';

  @override
  String get previewMessageReceived => 'Merhaba!';

  @override
  String get previewMessageSent => 'Selam!';

  @override
  String get messageAction => 'Mesaj';

  @override
  String get callAction => 'Ara';

  @override
  String get videoAction => 'Goruntulu';

  @override
  String get personalNotes => 'Kisisel notlar';

  @override
  String get addNotes => 'Not ekle...';

  @override
  String get noNotes => 'Not yok';

  @override
  String get messageNotifications => 'Mesaj bildirimleri';

  @override
  String get callNotifications => 'Arama bildirimleri';

  @override
  String get useGradient => 'Degrade kullan';

  @override
  String get gradientStart => 'Baslangic rengi';

  @override
  String get gradientEnd => 'Bitis rengi';

  @override
  String get preview => 'Onizleme';

  @override
  String get reset => 'Sifirla';

  @override
  String get securityNumber => 'Guvenlik numarasi';

  @override
  String securityNumberDescription(String name) {
    return 'Guvenlik numarasinin $name cihazindakiyle eslestigi dogrulayin';
  }

  @override
  String get verifyEncryption => 'Uctan uca sifrelemeyi dogrula';

  @override
  String get tapToCopy => 'Kopyalamak icin dokunun';

  @override
  String get howToVerify => 'Nasil dogrulanir';

  @override
  String get verifyStep1 => 'Kisinizle yuz yuze gorusun veya arayin';

  @override
  String get verifyStep2 =>
      'Guvenlik numaralarini karsilastirin veya QR kodlari tarayin';

  @override
  String get verifyStep3 => 'Eslesiyorsa, sohbetiniz guvenlidir';

  @override
  String get scanToVerify => 'Dogrulamak icin tarayin';

  @override
  String get reportSpam => 'Spam olarak bildir';

  @override
  String get reportSpamSubtitle => 'Bu kisiyi spam olarak bildir';

  @override
  String get reportSpamDescription =>
      'Bu kisi anonim olarak bildirilecektir. Kimliginiz paylasılmayacaktir. Emin misiniz?';

  @override
  String get report => 'Bildir';

  @override
  String get spamReported => 'Spam bildirildi';

  @override
  String get reportError => 'Bildirim gonderilemedi. Lutfen tekrar deneyin.';

  @override
  String get reportRateLimited =>
      'Bugun icin maksimum bildirim sayisina ulastiniz.';

  @override
  String get blockContact => 'Kisiyi engelle';

  @override
  String get blockContactDescription =>
      'Bu kisi artik size mesaj gonderemez veya sizi arayamaz. Bilgilendirilmeyecektir.';

  @override
  String get unblockContact => 'Engeli kaldir';

  @override
  String get unblockContactDescription =>
      'Bu kisi tekrar size mesaj gonderebilir ve sizi arayabilir.';

  @override
  String get contactBlocked => 'Kisi engellendi';

  @override
  String get contactUnblocked => 'Engel kaldirildi';

  @override
  String get contactIsBlocked => 'Bu kisi engellenmis';

  @override
  String get unblock => 'Engeli kaldir';

  @override
  String get deleteContactSubtitle => 'Bu kisiyi ve sohbeti sil';

  @override
  String get confirmWithPin => 'PIN ile onayla';

  @override
  String get enterPinToConfirm => 'Bu islemi onaylamak icin PIN\'inizi girin';

  @override
  String get profilePhoto => 'Profil fotografi';

  @override
  String get takePhoto => 'Fotograf cek';

  @override
  String get chooseFromGallery => 'Galeriden sec';

  @override
  String get removePhoto => 'Fotografi kaldir';

  @override
  String get viewContactHashId => 'Kisinin kimligini goruntule';

  @override
  String get hashIdPartiallyMasked =>
      'Guvenliginiz ve kisinizin gizliligi icin kismen maskelenmis';

  @override
  String get addFirstContact => 'Ilk kisinizi ekleyin';

  @override
  String get addFirstContactSubtitle =>
      'QR kodunuzu paylasin veya bir arkadasinizinkini tarayin';

  @override
  String get directory => 'Rehber';

  @override
  String get noContacts => 'Kisi yok';

  @override
  String get noContactsSubtitle => 'Baslamak icin bir kisi ekleyin';

  @override
  String get sendMessageAction => 'Mesaj gonder';

  @override
  String get audioCall => 'Sesli arama';

  @override
  String get videoCall => 'Goruntulu arama';

  @override
  String get viewProfile => 'Profili goruntule';

  @override
  String get deleteContactDirectory => 'Kisiyi sil';

  @override
  String get scanShort => 'Tara';

  @override
  String get addShort => 'Ekle';

  @override
  String deleteContactConfirmName(String name) {
    return '$name adli kisiyi silmek istediginizden emin misiniz?';
  }

  @override
  String get noNotesTitle => 'Not yok';

  @override
  String get noNotesSubtitle => 'Ilk notunuzu olusturun';

  @override
  String get newNote => 'Yeni not';

  @override
  String get editNote => 'Notu duzenle';

  @override
  String get deleteNote => 'Notu sil';

  @override
  String get deleteNoteConfirm => 'Bu notu silmek istediginizden emin misiniz?';

  @override
  String get noteTitle => 'Baslik';

  @override
  String get noteContent => 'Icerik';

  @override
  String get addItem => 'Oge ekle';

  @override
  String get pinNote => 'Sabitle';

  @override
  String get unpinNote => 'Sabitlemeyi kaldir';

  @override
  String get noteColor => 'Renk';

  @override
  String get notePassword => 'Sifre';

  @override
  String get setPassword => 'Sifre belirle';

  @override
  String get changePassword => 'Sifreyi degistir';

  @override
  String get removePassword => 'Sifreyi kaldir';

  @override
  String get enterPassword => 'Sifreyi girin';

  @override
  String get confirmPassword => 'Sifreyi onaylayin';

  @override
  String get passwordPin => 'PIN kodu';

  @override
  String get passwordText => 'Metin sifresi';

  @override
  String get protectedNote => 'Korumali not';

  @override
  String get incorrectPassword => 'Yanlis sifre';

  @override
  String get passwordSet => 'Sifre belirlendi';

  @override
  String get passwordRemoved => 'Sifre kaldirildi';

  @override
  String get notesBiometric => 'Notlar icin Face ID';

  @override
  String get notesBiometricSubtitle =>
      'Korumali notlari acmak icin biyometrik dogrulama gerektir';

  @override
  String get textNote => 'Metin notu';

  @override
  String get checklistNote => 'Kontrol listesi';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total gorev';
  }

  @override
  String get autoSaved => 'Kaydedildi';

  @override
  String get searchNotes => 'Not ara';

  @override
  String get legalConsent => 'Yasal onay';

  @override
  String get confirmAge13 => 'En az 13 yasinda oldugumu onayliyorum';

  @override
  String get acceptLegalStart => 'Kabul ediyorum: ';

  @override
  String get privacyPolicy => 'Gizlilik Politikasi';

  @override
  String get termsOfService => 'Kullanim Kosullari';

  @override
  String get andThe => ' ve ';

  @override
  String get continueButton => 'Devam';

  @override
  String get mustAcceptTerms =>
      'Devam etmek icin her iki kosulu da kabul etmelisiniz';

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
  String get support => 'Destek';

  @override
  String get contactSupport => 'Destekle iletisime gec';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Kotuye kullanimi bildir';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Yasal';

  @override
  String get legalEntity => 'Tüzel kisilik';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Sabitle';

  @override
  String get unpinConversation => 'Sabitlemeyi kaldir';

  @override
  String get hideConversation => 'Akistan kaldir';

  @override
  String get deleteConversation => 'Sohbeti sil';

  @override
  String get deleteConversationConfirm =>
      'Tum mesajlarin silinmesini onaylamak icin PIN\'inizi girin';

  @override
  String get noConversations => 'Henuz sohbet yok';

  @override
  String get startConversation => 'Basla';

  @override
  String get microphonePermissionRequired => 'Mikrofon erisimi gerekli';

  @override
  String get microphonePermissionExplanation =>
      'Hash\'in arama yapmak icin mikrofona ihtiyaci var.';

  @override
  String get cameraPermissionExplanation =>
      'Hash\'in goruntulu aramalar icin kameraya ihtiyaci var.';

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
  String get openSettings => 'Ayarlari ac';

  @override
  String get callConnecting => 'Baglaniyor...';

  @override
  String get callRinging => 'Caliyor...';

  @override
  String get callReconnecting => 'Yeniden baglaniyor...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Yeniden baglaniyor (${seconds}sn)';
  }

  @override
  String get callPaused => 'Duraklatıldı';

  @override
  String get callPausedSubtitle => 'Arama hâlâ devam ediyor';

  @override
  String get callRemoteMicMuted => 'Kisinin mikrofonu kapali';

  @override
  String get callMiniControlsMute => 'Sesi kapat';

  @override
  String get callMiniControlsUnmute => 'Sesi ac';

  @override
  String get callMiniControlsHangUp => 'Kapat';

  @override
  String get callMiniControlsReturn => 'Aramaya don';

  @override
  String get callNetworkPoor => 'Kararsiz baglanti';

  @override
  String get callNetworkLost => 'Baglanti kesildi';

  @override
  String get callEndedTitle => 'Arama sona erdi';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Cihaz verileri';

  @override
  String get deviceDataSubtitle => 'Yerel ve sunucu depolama';

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
  String get localStorage => 'Yerel depolama';

  @override
  String get onThisDevice => 'bu cihazda';

  @override
  String get encryptedDatabases => 'Sifreli veritabanlari';

  @override
  String get files => 'Dosyalar';

  @override
  String get secureKeychain => 'Guvenli anahtar zinciri';

  @override
  String get cache => 'Onbellek';

  @override
  String get contactsDetail => 'Adlar, avatarlar, Signal anahtarlari';

  @override
  String get messagesDetail => 'Sifreli sohbetler';

  @override
  String get notesDetail => 'Kisisel notlar';

  @override
  String get signalSessions => 'Signal oturumlari';

  @override
  String get signalSessionsDetail => 'Sifreleme oturumlari';

  @override
  String get pendingContacts => 'Bekleyen kisiler';

  @override
  String get pendingContactsDetail => 'Bekleyen istekler';

  @override
  String get callHistory => 'Aramalar';

  @override
  String get callHistoryDetail => 'Arama gecmisi';

  @override
  String get preferences => 'Tercihler';

  @override
  String get preferencesDetail => 'Medya ve arama tercihleri';

  @override
  String get avatars => 'Avatarlar';

  @override
  String get media => 'Medya';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dosya',
      one: '1 dosya',
      zero: 'dosya yok',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Etkin';

  @override
  String get notDefined => 'Tanimlanmamis';

  @override
  String get biometrics => 'Biyometri';

  @override
  String get recoveryPhrase => 'Kurtarma ifadesi';

  @override
  String get identity => 'Kimlik (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol anahtarlari';

  @override
  String get authTokens => 'Kimlik dogrulama belirtecleri';

  @override
  String get contactNamesCache => 'Kisi adlari onbellegi';

  @override
  String get remoteConfig => 'Uzak yapilandirma';

  @override
  String get notificationPrefs => 'Bildirim tercihleri';

  @override
  String get serverData => 'Sunucu verileri';

  @override
  String get serverDataInfo =>
      'Hash sunucuda minimum veri tutar, hepsi sifreli veya gecicidir.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail =>
      'Hash Kimligi, genel anahtarlar, posta kutusu belirteci';

  @override
  String get serverPrekeys => 'On-anahtarlar';

  @override
  String get serverPrekeysDetail =>
      'Tek kullanimlik Signal anahtarlari (tuketilmis)';

  @override
  String get serverMessages => 'Aktarimdaki mesajlar';

  @override
  String get serverMessagesDetail => 'Teslimattan sonra silinir (maks 24sa)';

  @override
  String get serverMedia => 'Aktarimdaki medya';

  @override
  String get serverMediaDetail => 'Indirmeden sonra silinir';

  @override
  String get serverContactRequests => 'Kisi istekleri';

  @override
  String get serverContactRequestsDetail => '24 saat sonra sona erer';

  @override
  String get serverRateLimits => 'Hiz sinirlari';

  @override
  String get serverRateLimitsDetail => 'Gecici kotuye kullanim onleme verileri';

  @override
  String get privacyReassurance =>
      'Hash mesajlarinizi okuyamaz. Tum veriler uctan uca sifrelenmistir. Sunucu verileri otomatik olarak silinir.';

  @override
  String get pinTooSimple => 'Bu PIN cok basit. Daha guvenli bir kod secin.';

  @override
  String get genericError => 'Bir hata olustu. Lutfen tekrar deneyin.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Hesap olusturulamadi: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Ifade panoya kopyalandi';

  @override
  String get copyPhrase => 'Ifadeyi kopyala';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Bu ifadeyi guvenli bir yere yazin. PIN\'inizi bu ifade olmadan kaybederseniz, verilerinize erisimi kalici olarak kaybedersiniz.';

  @override
  String get noMessages => 'Mesaj yok';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name ile tum mesajlar silinsin mi?';
  }

  @override
  String get confirmation => 'Onay';

  @override
  String get untitled => 'Baslıksiz';

  @override
  String get noSessions => 'Oturum yok';

  @override
  String get unknownContact => 'Bilinmeyen kisi';

  @override
  String get unnamed => 'Isimsiz';

  @override
  String get noPendingRequestsAlt => 'Bekleyen istek yok';

  @override
  String get deleteAllCallHistory => 'Tum arama gecmisi silinsin mi?';

  @override
  String get noCalls => 'Arama yok';

  @override
  String get noPreferences => 'Tercih yok';

  @override
  String get resetAllMediaPrefs => 'Tum medya tercihleri sifirlansin mi?';

  @override
  String get deleteThisAvatar => 'Bu avatar silinsin mi?';

  @override
  String get deleteAllAvatars => 'Tum avatarlar silinsin mi?';

  @override
  String get noAvatars => 'Avatar yok';

  @override
  String get deleteThisFile => 'Bu dosya silinsin mi?';

  @override
  String get deleteAllMediaFiles => 'Tum medya silinsin mi?';

  @override
  String get noMediaFiles => 'Medya yok';

  @override
  String get outgoing => 'Giden';

  @override
  String get incoming => 'Gelen';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Gecici goruntuleme: ${seconds}sn';
  }

  @override
  String get normalView => 'Normal goruntuleme';

  @override
  String get callReasonCompleted => 'Tamamlandi';

  @override
  String get callReasonMissed => 'Cevapsiz';

  @override
  String get callReasonDeclined => 'Reddedildi';

  @override
  String get callReasonFailed => 'Basarisiz';

  @override
  String get justNow => 'Az once';

  @override
  String timeAgoMinutes(int count) {
    return '$count dk once';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}sa once';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}g once';
  }

  @override
  String get messageTypeContact => 'Kisi';

  @override
  String get messageTypeLocation => 'Konum';

  @override
  String get statusQueued => 'Sirada';

  @override
  String get blockedBadge => 'Engellenmis';

  @override
  String get protectedBadge => 'Korumali';

  @override
  String messageCount(int count) {
    return '$count mesaj';
  }

  @override
  String get deleteQuestion => 'Silinsin mi?';

  @override
  String get transferMyAccountTitle => 'Hesabimi aktar';

  @override
  String get loadingError => 'Yukleme hatasi';

  @override
  String get transferToNewDevice => 'Yeni bir cihaza aktar';

  @override
  String get transferInstructions =>
      'Yeni cihazinizda \"Hesabimi kurtar\" secenegini secin ve bu bilgileri girin:';

  @override
  String get yourHashIdLabel => 'Hash Kimliginiz';

  @override
  String get enterYourPinCode => 'PIN kodunuzu girin';

  @override
  String get pinOwnerConfirmation =>
      'Bu hesabin sahibi oldugunuzu onaylamak icin';

  @override
  String get scanThisQrCode => 'Bu QR kodu tarayin';

  @override
  String get withYourNewDevice => 'Yeni cihazinizla';

  @override
  String get orEnterTheCode => 'veya kodu girin';

  @override
  String get transferCodeLabel => 'Aktarim kodu';

  @override
  String get proximityVerification => 'Yakinlik dogrulamasi';

  @override
  String get bringDevicesCloser => 'Her iki cihazi yaklastirin';

  @override
  String get confirmTransferQuestion => 'Aktarim onaylansin mi?';

  @override
  String get accountWillBeTransferred =>
      'Hesabiniz yeni cihaza aktarilacaktir.\n\nBu cihazin baglantisi kalici olarak kesilecektir.';

  @override
  String get transferComplete => 'Aktarim tamamlandi';

  @override
  String get transferSuccessMessage =>
      'Hesabiniz basariyla aktarildi.\n\nBu uygulama simdi kapanacak.';

  @override
  String get manualVerification => 'Elle dogrulama';

  @override
  String get codeDisplayedOnBothDevices => 'Her iki cihazda gorunen kod:';

  @override
  String get doesCodeMatchNewDevice => 'Bu kod yeni cihazdakiyle eslesiyor mu?';

  @override
  String get verifiedStatus => 'Dogrulandi';

  @override
  String get inProgressStatus => 'Devam ediyor...';

  @override
  String get notAvailableStatus => 'Mevcut degil';

  @override
  String get codeExpiredRestart =>
      'Kodun suresi doldu. Lutfen yeniden baslatin.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kodlar eslesmiyor. Aktarim iptal edildi.';

  @override
  String transferToDevice(String device) {
    return 'Hedef: $device';
  }

  @override
  String get copiedExclamation => 'Kopyalandi!';

  @override
  String expiresInTime(String time) {
    return '$time icinde sona erer';
  }

  @override
  String get biometricNotAvailable =>
      'Bu cihazda biyometri kullanilabilir degil';

  @override
  String get biometricAuthError => 'Biyometrik dogrulama sirasinda hata olustu';

  @override
  String get authenticateForBiometric =>
      'Biyometriyi etkinlestirmek icin lutfen kimliginizi dogrulayin';

  @override
  String get biometricAuthFailed => 'Biyometrik dogrulama basarisiz oldu';

  @override
  String get forceUpdateTitle => 'Guncelleme gerekli';

  @override
  String get forceUpdateMessage =>
      'Hash\'in yeni bir surumu mevcut. Devam etmek icin lutfen guncelleyin.';

  @override
  String get updateButton => 'Guncelle';

  @override
  String get maintenanceInProgress => 'Bakim devam ediyor';

  @override
  String get tryAgainLater => 'Lutfen daha sonra tekrar deneyin';

  @override
  String get information => 'Bilgi';

  @override
  String get later => 'Daha sonra';

  @override
  String get doYouLikeHash => 'Hash\'i begendiniz mi?';

  @override
  String get yourFeedbackHelps =>
      'Geri bildiriminiz uygulamayi gelistirmemize yardimci olur';

  @override
  String get ratingTerrible => 'Cok kotu';

  @override
  String get ratingBad => 'Kotu';

  @override
  String get ratingOk => 'Orta';

  @override
  String get ratingGood => 'Iyi';

  @override
  String get ratingExcellent => 'Mukemmel!';

  @override
  String get donationMessage =>
      'Hash kar amaci gutmeyen bir projedir. Desteginiz gercekten ozel bir mesajlasma uygulamasi gelistirmeye devam etmemizi saglar.';

  @override
  String get recentConnections => 'Son baglantilar';

  @override
  String get loginInfoText =>
      'Her PIN ile acma islemi yerel olarak kaydedilir. Yalnizca son 24 saat saklanir.';

  @override
  String get connectionCount => 'Baglanti(lar)';

  @override
  String get periodLabel => 'Donem';

  @override
  String get historyLabel => 'Gecmis';

  @override
  String get noLoginRecorded => 'Kaydedilmis giris yok';

  @override
  String get nextUnlocksAppearHere =>
      'Sonraki acma islemleri burada gorunecek.';

  @override
  String get dataLocalOnly =>
      'Bu veriler yalnizca cihazinizda saklanir ve asla iletilmez.';

  @override
  String get currentSession => 'Mevcut';

  @override
  String get todayLabel => 'Bugun';

  @override
  String get yesterdayLabel => 'Dun';

  @override
  String get justNowLabel => 'Az once';

  @override
  String minutesAgoLabel(int count) {
    return '$count dk once';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}sa once';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}sa ${minutes}dk once';
  }

  @override
  String get noMaintenancePlanned => 'Planli bakim yok';

  @override
  String get everythingWorkingNormally => 'Her sey normal calisiyor';

  @override
  String get maintenanceTitle => 'Bakim';

  @override
  String get maintenanceActiveLabel => 'DEVAM EDIYOR';

  @override
  String get maintenancePlannedLabel => 'PLANLI';

  @override
  String get locking => 'Kilitleniyor...';

  @override
  String get newMessageNotification => 'Yeni mesaj';

  @override
  String get secExplainTitle => 'Hash seni nasil koruyor';

  @override
  String get secExplainIntro =>
      'Hash, kimsenin mesajlarini okuyamamasi icin tasarlandi.';

  @override
  String get secExplainIntroSub =>
      'Biz bile okuyamayiz.\nIste nasil calistigi, basitce anlatilmis.';

  @override
  String get secJourneyLabel => 'YOLCULUK';

  @override
  String get secJourneyTitle => 'Mesajinin yolculugu';

  @override
  String get secJourneySubtitle =>
      'Parmagindan kisinin ekranina kadar her adim korunuyor. Yolu takip et.';

  @override
  String get secStep1Title => 'Mesajini yaziyorsun';

  @override
  String get secStep1Desc =>
      'Uygulamada \"Merhaba!\" yaziyorsun. Bu anda mesaj yalnizca telefonunun belleginde var. Hicbir sey gonderilmedi.';

  @override
  String get secStep2Title => 'Signal Protocol ile sifreleme';

  @override
  String get secStep2Desc =>
      '\"Gonder\" dugmesine bastigin anda mesajin anlamsiz karakterlere donusturulur. Mesajin, yalnizca kisinin anahtarina sahip oldugu bir kasaya kilitlenmis gibidir.';

  @override
  String get secStep3Title => 'Sealed Sender: gorunmez zarf';

  @override
  String get secStep3Desc =>
      'Posta ile mektup gonderdiginizi ama zarfta gonderici adresi olmadigini hayal edin. Hash tam olarak bunu yapar. Mesaj anonim bir posta kutusuna birakilir. Sunucu kimin gonderdigini bilmez.';

  @override
  String get secStep4Title => 'Sunucu hicbir sey gormez';

  @override
  String get secStep4Desc =>
      'Sunucu kor bir postaci rolunu oynar. Yalnizca \"birisi #A7X9 kutusuna bir sey birakti\" bilir. Kimin gonderdigini, ne oldugunu veya kime yonelik oldugunu bilmez.';

  @override
  String get secStep4Highlight =>
      'Hicbir metaveri saklanmaz: IP adresi yok, zaman damgasi yok, gonderici-alici baglantisi yok.';

  @override
  String get secStep5Title => 'Kisin mesaji aliyor';

  @override
  String get secStep5Desc =>
      'Kisinin telefonu anonim posta kutusundan icerigi alir ve mesaji, cihazindan hic ayrilmamis olan ozel anahtariyla cozer. \"Merhaba!\" ekraninda gorunur.';

  @override
  String get secStep6Title => 'Mesaj sunucudan kayboluyor';

  @override
  String get secStep6Desc =>
      'Kisin alimi onayladiginda, sunucu mesaji kalici olarak siler. Cop kutusu yok, arsiv yok, yedek yok. Okunmamis mesajlar bile 24 saat sonra otomatik olarak yok edilir.';

  @override
  String get secStep7Title => 'Yerel sona erme';

  @override
  String get secStep7Desc =>
      'Kisinin telefonunda mesaj, sectigin sureye gore kendini imha eder: okuduktan hemen sonra, 5 dakika, 1 saat... sen karar verirsin.';

  @override
  String get secJourneyConclusion =>
      'Sonuc: sunucuda sifir iz, cihazlarda sifir iz. Mesaj yalnizca okunacak kadar var oldu, sonra kayboldu.';

  @override
  String get secArchLabel => 'MIMARI';

  @override
  String get secArchTitle => '5 koruma katmani';

  @override
  String get secArchSubtitle =>
      'Hash tek bir teknolojiye dayanmaz. Her katman digerlerini guclendirir. Bir katman bile tehlikeye girse verileriniz guvendedir.';

  @override
  String get secLayer1Title => 'Uctan uca sifreleme';

  @override
  String get secLayer1Desc =>
      'Her mesaj benzersiz bir anahtarla sifrelenir. Basitce: birisi bir mesaji cozse bile bir sonrakini cozemez. Her mesajin kendi kilidi vardir.';

  @override
  String get secLayer1Detail =>
      'Dosyalar (fotograflar, videolar, belgeler) icin Hash ek AES-256-GCM sifreleme kullanir. Dosya telefonunuzdan cikmadan once sifrelenir.';

  @override
  String get secLayer2Title => 'Sealed Sender (ag anonimlik)';

  @override
  String get secLayer2Desc =>
      'Normal mesajlasma uygulamalari mesajlarinizi kimliginiz ekli olarak gonderir. Zarfa adinizi yazmak gibi. Hash anonim posta kutulari kullanir: sunucu mesaji kimin gonderdigini bilmeden iletir.';

  @override
  String get secLayer2Detail =>
      'Sonuc: sunucu veri sizintisi durumunda bile kimin kiminle konustugunu yeniden olusturmak mumkun degildir.';

  @override
  String get secLayer3Title => 'Otomatik silme';

  @override
  String get secLayer3Desc =>
      'Mesajlar alim onaylanir onaylanmaz sunucudan silinir. Bir mesaj hic alinmasa bile 24 saat sonra otomatik olarak yok edilir.';

  @override
  String get secLayer3Detail =>
      'Telefonunuzda mesajlar sectiginiz sureye gore kendini imha eder: hemen, 5dk, 15dk, 30dk, 1sa, 3sa, 6sa veya 12sa.';

  @override
  String get secLayer4Title => 'Yerel erisim korumasi';

  @override
  String get secLayer4Desc =>
      'Uygulama 6 haneli PIN kodu ve/veya biyometri (Face ID, parmak izi) ile korunur. Cok fazla basarisiz denemeden sonra uygulama, her basarisizlikta artan bir gecikmeyle kilitlenir.';

  @override
  String get secLayer5Title => 'Kilitli veritabani';

  @override
  String get secLayer5Desc =>
      'Sunucu tarafinda hicbir kullanici dogrudan veritabanina yazamaz. Tum islemler her istegi dogrulayan guvenli fonksiyonlar uzerinden gider.';

  @override
  String get secLayer5Detail =>
      'Bu bir banka gisesi gibidir: kasaya kendiniz asla dokunmazsiniz. Bir istek yaparsiniz ve sistem harekete gecmeden once hakkiinizi dogrular.';

  @override
  String get secVashLabel => 'DUNYADA ESSIZ';

  @override
  String get secVashTitle => 'Vash Modu';

  @override
  String get secVashSubtitle =>
      'Baska hicbir mesajlasma uygulamasinda bulunmayan bir acil guvenlik sistemi.';

  @override
  String get secVashScenarioTitle => 'Bu durumu hayal et';

  @override
  String get secVashScenario1 => 'Birisi telefonuna erisiyor';

  @override
  String get secVashScenario2 => 'Senden PIN kodun isteniyor';

  @override
  String get secVashScenario3 => 'Tum verilerini acilen silmek istiyorsun';

  @override
  String get secVashSolutionTitle => 'Cozum: iki PIN kodu';

  @override
  String get secVashSolutionDesc =>
      'Hash\'te iki farkli PIN kodu yapilandirirsin:';

  @override
  String get secVashNormalCodeLabel => 'Normal kod';

  @override
  String get secVashNormalCodeDesc =>
      'Uygulamayi tum verilerinle normal olarak acar';

  @override
  String get secVashCodeLabel2 => 'Vash kodu';

  @override
  String get secVashCodeDescription =>
      'Uygulamayi normal olarak acar... ama tum verilerin arka planda sessizce silinir';

  @override
  String get secVashWhatHappensTitle => 'Sonra ne olur';

  @override
  String get secVashWhatHappensDesc =>
      'Uygulama normal olarak acilir. Uyari yok, suphe uyandiran animasyon yok. Ekran sadece bos bir uygulama gosterir, sanki yeni yuklemissiniz gibi.\n\nGerekte tum sohbetleriniz, kisileriniz ve mesajlariniz bir saniyelik kesirde geri donulemez sekilde silindi.';

  @override
  String get secCallsLabel => 'ARAMALAR & DOSYALAR';

  @override
  String get secCallsTitle => 'Her sey sifrelidir';

  @override
  String get secCallsSubtitle =>
      'Sadece mesajlar degil. Hash uzerinden gecen her sey uctan uca sifrelenir.';

  @override
  String get secAudioCallTitle => 'Sesli aramalar';

  @override
  String get secAudioCallDesc =>
      'WebRTC ile uctan uca sifreli. Ses dogrudan cihazlar arasinda iletilir.';

  @override
  String get secVideoCallTitle => 'Goruntulu aramalar';

  @override
  String get secVideoCallDesc =>
      'Ayni teknoloji, her akis ayri ayri sifrelenmis.';

  @override
  String get secPhotosTitle => 'Fotograflar ve videolar';

  @override
  String get secPhotosDesc =>
      'Telefonunuzdan cikmadan once AES-256-GCM ile sifrelenir.';

  @override
  String get secDocsTitle => 'Belgeler';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, her dosya. Ad, boyut ve icerik sifrelenir.';

  @override
  String get secAnonLabel => 'ANONIMLIK';

  @override
  String get secAnonTitle => 'Kimlik gerektirmez';

  @override
  String get secAnonSubtitle =>
      'Hash asla telefon numaranizi veya e-posta adresinizi sormaz. Benzersiz ve anonim bir Hash Kimligi ile tanimlanirsiniz.';

  @override
  String get secHashIdTitle => 'Hash Kimligin';

  @override
  String get secHashIdDesc =>
      'Bu senin benzersiz tanimlayicin. Hakkinda hicbir sey ortaya koymaz: ne adin, ne numaran, ne konumun. Gercek kimligine baglanamaycak bir takma ad gibi.\n\nBir kisi eklemek icin Hash Kimligini paylasirsin veya QR kodu taratirsin. Hepsi bu. Senkronize edilmis adres defteri yok, \"Taniyabileceklerin\" onerileri yok.';

  @override
  String get secDataLabel => 'VERILER';

  @override
  String get secDataTitle => 'Hash\'in bilmedikleri';

  @override
  String get secDataSubtitle =>
      'Verilerinizi korumanin en iyi yolu onlari toplamamaktir.';

  @override
  String get secNeverCollected => 'Asla toplanmaz';

  @override
  String get secNeverItem1 => 'Mesaj icerigi';

  @override
  String get secNeverItem2 => 'Kisi listesi';

  @override
  String get secNeverItem3 => 'Telefon numarasi';

  @override
  String get secNeverItem4 => 'E-posta adresi';

  @override
  String get secNeverItem5 => 'IP adresi';

  @override
  String get secNeverItem6 => 'Konum';

  @override
  String get secNeverItem7 => 'Metaveriler (kim kiminle konusuyor)';

  @override
  String get secNeverItem8 => 'Arama gecmisi';

  @override
  String get secNeverItem9 => 'Adres defteri';

  @override
  String get secNeverItem10 => 'Reklam tanimlayicilari';

  @override
  String get secTempStored => 'Gecici olarak saklanir';

  @override
  String get secTempItem1 => 'Anonim Hash Kimligi (benzersiz tanimlayici)';

  @override
  String get secTempItem2 => 'Genel sifreleme anahtarlari';

  @override
  String get secTempItem3 => 'Aktarimdaki sifreli mesajlar (maks 24sa)';

  @override
  String get secTempNote =>
      'Bu minimum veriler bile sizi tanimlayamaz. Hash Kimliginiz hicbir kisisel bilgiye baglantilanmamistir.';

  @override
  String get secFooterTitle => 'Gizliligin, ozgurlugun';

  @override
  String get secFooterDesc =>
      'Hash, en titiz profesyonel uygulamalarla ayni sifreleme teknolojilerini kullanir. Mesajlariniz vaatlerle degil, matematikle korunur.';

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
