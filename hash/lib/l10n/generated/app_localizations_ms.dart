// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Tiada Jejak. Tiada Kompromi.';

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
  String get conversations => 'Sembang';

  @override
  String get contacts => 'Kenalan';

  @override
  String get noConversation => 'Tiada sembang';

  @override
  String get noConversationSubtitle =>
      'Tambah kenalan untuk mula bersembang dengan selamat';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count permintaan tertunda',
      one: '1 permintaan tertunda',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count permintaan dihantar tertunda',
      one: '1 permintaan dihantar tertunda',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Tambah kenalan';

  @override
  String get shareApp => 'Kongsi aplikasi';

  @override
  String get newMessage => 'Mesej baharu';

  @override
  String get newConversation => 'Hantar mesej';

  @override
  String get settings => 'Tetapan';

  @override
  String get myHashId => 'Hash ID saya';

  @override
  String get supportHash => 'Sokong Hash';

  @override
  String get supportHashSubtitle => 'Hash adalah projek bukan untung';

  @override
  String get donate => 'Derma';

  @override
  String get appearance => 'Penampilan';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatik';

  @override
  String get themeAutoSubtitle => 'Mengikut tetapan sistem';

  @override
  String get themeDark => 'Gelap';

  @override
  String get themeLight => 'Cerah';

  @override
  String get themeRecommendation =>
      'Tema gelap disyorkan untuk privasi yang lebih baik';

  @override
  String get language => 'Bahasa';

  @override
  String get languageAuto => 'Automatik (sistem)';

  @override
  String get notifications => 'Pemberitahuan';

  @override
  String get messages => 'Mesej';

  @override
  String get calls => 'Panggilan';

  @override
  String get vibration => 'Getaran';

  @override
  String get notificationContent => 'Kandungan pemberitahuan';

  @override
  String get notificationContentFull => 'Papar semua';

  @override
  String get notificationContentFullDesc => 'Nama kenalan dan pratonton mesej';

  @override
  String get notificationContentName => 'Nama sahaja';

  @override
  String get notificationContentNameDesc => 'Hanya memaparkan nama kenalan';

  @override
  String get notificationContentDiscrete => 'Diskret';

  @override
  String get notificationContentDiscreteDesc =>
      'Hanya memaparkan \"Mesej baharu\"';

  @override
  String get security => 'Keselamatan';

  @override
  String get howHashProtectsYou => 'Bagaimana Hash melindungi anda';

  @override
  String get howHashProtectsYouSubtitle => 'Fahami keselamatan anda';

  @override
  String get accountSecurity => 'Keselamatan akaun';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrik, Mod Vash';

  @override
  String get blockScreenshots => 'Sekat tangkapan skrin';

  @override
  String get transferDevice => 'Pindah ke peranti lain';

  @override
  String get transferDeviceSubtitle => 'Migrasi akaun anda';

  @override
  String get pinCode => 'Kod PIN';

  @override
  String get changePin => 'Tukar kod PIN';

  @override
  String get currentPin => 'Kod PIN semasa';

  @override
  String get newPin => 'Kod PIN baharu';

  @override
  String get confirmPin => 'Sahkan kod PIN';

  @override
  String get pinChanged => 'Kod PIN ditukar';

  @override
  String get incorrectPin => 'PIN salah';

  @override
  String get pinsDoNotMatch => 'PIN tidak sepadan';

  @override
  String get autoLock => 'Kunci automatik';

  @override
  String get autoLockDelay => 'Kelewatan kunci';

  @override
  String get autoLockImmediate => 'Serta-merta';

  @override
  String get autoLockMinute => '1 minit';

  @override
  String autoLockMinutes(int count) {
    return '$count minit';
  }

  @override
  String get vashCode => 'Kod Vash';

  @override
  String get vashModeTitle => 'Mod Vash';

  @override
  String get vashModeExplanation => 'Jaring keselamatan terakhir anda.';

  @override
  String get vashModeDescription =>
      'Anda akan memilih kod PIN kedua. Jika anda dipaksa membuka Hash, masukkan kod ini dan bukannya PIN biasa anda.\n\nAplikasi akan dibuka seperti biasa, tetapi semua perbualan dan kenalan anda akan hilang.\n\nBagi sesiapa yang melihat skrin anda, Hash kelihatan kosong — seolah-olah anda tidak pernah menggunakannya.';

  @override
  String get vashModeIrreversible =>
      'Tindakan ini senyap dan tidak boleh diterbalikkan.';

  @override
  String get chooseVashCode => 'Pilih kod Vash saya';

  @override
  String get vashCodeInfo =>
      'Kod PIN kedua yang membuka aplikasi seperti biasa, tetapi kosong.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Jika anda memasukkan kod ini dan bukannya PIN anda:';

  @override
  String get vashDeleteContacts => 'Kenalan anda hilang';

  @override
  String get vashDeleteMessages => 'Perbualan anda hilang';

  @override
  String get vashDeleteHistory => 'Nota anda hilang';

  @override
  String get vashKeepId => 'Identiti Hash anda (#XXX-XXX-XXX) kekal sama';

  @override
  String get vashAppearNormal =>
      'Aplikasi kelihatan normal tetapi kosong, seperti baharu. Tindakan ini tidak boleh diterbalikkan.';

  @override
  String get setupVashCode => 'Sediakan kod Vash';

  @override
  String get modifyVashCode => 'Ubah suai kod Vash';

  @override
  String get currentVashCode => 'Kod Vash semasa';

  @override
  String get newVashCode => 'Kod Vash baharu';

  @override
  String get confirmVashCode => 'Sahkan kod Vash';

  @override
  String get vashCodeConfigured => 'Kod Vash dikonfigurasi';

  @override
  String get vashCodeModified => 'Kod Vash diubah suai';

  @override
  String get vashCodeMustDiffer => 'Kod Vash mestilah berbeza daripada PIN';

  @override
  String get incorrectVashCode => 'Kod Vash salah';

  @override
  String get vashWhatToDelete => 'Apa yang Mod Vash patut hilangkan?';

  @override
  String get vashDeleteContactsOption => 'Kenalan';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mesej';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Nota';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Mod Vash diaktifkan';

  @override
  String get vashCreateSubtitle =>
      'Pilih kod yang berbeza daripada PIN utama anda';

  @override
  String get vashConfirmSubtitle => 'Sahkan kod Vash anda';

  @override
  String get pinCodeForEntry => 'Kod PIN untuk masuk aplikasi';

  @override
  String get vashCodeSection => 'Mod Vash';

  @override
  String get biometric => 'Biometrik';

  @override
  String get biometricUnlock => 'Buka kunci dengan cap jari atau Face ID';

  @override
  String get enableBiometric => 'Aktifkan biometrik';

  @override
  String get biometricWarningMessage =>
      'Dengan mengaktifkan biometrik, anda tidak akan dapat menggunakan kod Vash untuk masuk ke aplikasi.\n\nAnda hanya boleh menggunakan kod Vash jika biometrik gagal (selepas beberapa percubaan gagal).\n\nAdakah anda pasti mahu meneruskan?';

  @override
  String get understood => 'Saya faham';

  @override
  String get shareAppSubtitle => 'Kongsi Hash dengan orang tersayang';

  @override
  String get share => 'Kongsi';

  @override
  String get danger => 'Bahaya';

  @override
  String get deleteAccount => 'Padam akaun saya';

  @override
  String get deleteAccountSubtitle => 'Tindakan tidak boleh diterbalikkan';

  @override
  String get deleteAccountConfirmTitle => 'Padam akaun saya';

  @override
  String get deleteAccountConfirmMessage =>
      'Akaun anda akan dipadam secara kekal. Tindakan ini tidak boleh diterbalikkan.\n\n• Semua sembang anda\n• Semua kenalan anda\n• Hash ID anda\n\nAnda perlu membuat akaun baharu.';

  @override
  String get deleteForever => 'Padam secara kekal';

  @override
  String get cancel => 'Batal';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Mod Vash diaktifkan.';

  @override
  String deletionError(String error) {
    return 'Ralat pemadaman: $error';
  }

  @override
  String get yourSecurity => 'Keselamatan anda';

  @override
  String get securityInfo =>
      '• Penyulitan hujung-ke-hujung (Signal Protocol)\n• Tiada data di pelayan kami selepas penghantaran\n• Kunci disimpan hanya di peranti anda\n• Kod PIN tidak pernah dihantar ke pelayan';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Selamat datang';

  @override
  String get securityStatement1 => 'Mesej anda dilindungi.';

  @override
  String get securityStatement2 => 'Penyulitan hujung-ke-hujung.';

  @override
  String get securityStatement3 => 'Tiada jejak. Tiada kompromi.';

  @override
  String get securityStatement4 => 'Privasi anda adalah hak.';

  @override
  String get accessBlocked => 'Akses disekat';

  @override
  String get tooManyAttempts => 'Terlalu banyak percubaan';

  @override
  String get pleaseWait => 'Sila tunggu';

  @override
  String get waitDelay => 'Sila tunggu sehingga kelewatan tamat';

  @override
  String attemptCount(int current, int max) {
    return 'Percubaan $current daripada $max';
  }

  @override
  String retryIn(String time) {
    return 'Cuba lagi dalam $time';
  }

  @override
  String get forgotPin => 'Lupa PIN? Gunakan frasa pemulihan';

  @override
  String get useRecoveryPhrase => 'Gunakan frasa pemulihan';

  @override
  String get recoveryWarningTitle => 'Amaran';

  @override
  String get recoveryWarningMessage => 'Pemulihan akaun akan:';

  @override
  String get recoveryDeleteAllMessages => 'Memadamkan SEMUA mesej anda';

  @override
  String get recoveryWaitDelay => 'Memerlukan kelewatan 1 jam';

  @override
  String get recoveryKeepContacts => 'Mengekalkan kenalan anda';

  @override
  String get recoveryIrreversible =>
      'Tindakan ini tidak boleh diterbalikkan. Mesej anda akan hilang secara kekal.';

  @override
  String get iUnderstand => 'Saya faham';

  @override
  String get accountRecovery => 'Pemulihan akaun';

  @override
  String get enterRecoveryPhrase =>
      'Masukkan 24 perkataan frasa pemulihan anda, dipisahkan oleh ruang.';

  @override
  String get recoveryPhraseHint => 'perkataan1 perkataan2 perkataan3 ...';

  @override
  String get recover => 'Pulihkan';

  @override
  String get recoveryPhraseRequired => 'Sila masukkan frasa pemulihan anda';

  @override
  String get recoveryPhrase24Words =>
      'Frasa mesti mengandungi tepat 24 perkataan';

  @override
  String get incorrectRecoveryPhrase => 'Frasa pemulihan salah';

  @override
  String get recoveryInitError => 'Ralat memulakan pemulihan';

  @override
  String get securityDelay => 'Kelewatan keselamatan';

  @override
  String get securityDelayMessage =>
      'Untuk keselamatan anda, tempoh menunggu diperlukan sebelum anda boleh membuat PIN baharu.';

  @override
  String get timeRemaining => 'Masa berbaki';

  @override
  String get messagesDeletedForProtection =>
      'Mesej anda telah dipadamkan untuk perlindungan anda.';

  @override
  String get canCloseApp => 'Anda boleh menutup aplikasi dan kembali kemudian.';

  @override
  String get onboardingTitle1 => 'Selamat datang ke Hash';

  @override
  String get onboardingSubtitle1 => 'Pemesejan yang tidak meninggalkan jejak';

  @override
  String get onboardingTitle2 => 'Penyulitan total';

  @override
  String get onboardingSubtitle2 =>
      'Mesej anda disulitkan hujung-ke-hujung dengan Signal Protocol';

  @override
  String get onboardingTitle3 => 'Tiada jejak';

  @override
  String get onboardingSubtitle3 =>
      'Mesej dipadamkan dari pelayan selepas penghantaran';

  @override
  String get onboardingTitle4 => 'Keselamatan anda';

  @override
  String get onboardingSubtitle4 => 'Kod PIN, Mod Vash dan frasa pemulihan';

  @override
  String get getStarted => 'Mula';

  @override
  String get next => 'Seterusnya';

  @override
  String get skip => 'Langkau';

  @override
  String get alreadyHaveAccount => 'Saya sudah mempunyai akaun';

  @override
  String get transferMyAccount => 'Pindahkan akaun saya';

  @override
  String get createPin => 'Buat kod PIN';

  @override
  String get createPinSubtitle =>
      'Kod ini akan melindungi akses ke aplikasi anda';

  @override
  String get confirmYourPin => 'Sahkan kod PIN anda';

  @override
  String get confirmPinSubtitle => 'Masukkan kod PIN anda sekali lagi';

  @override
  String get saveRecoveryPhrase => 'Frasa pemulihan';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Tulis 24 perkataan ini mengikut urutan. Ia akan membolehkan anda memulihkan akaun jika anda lupa PIN.';

  @override
  String get phraseWritten => 'Saya telah menulis frasa saya';

  @override
  String get warningRecoveryPhrase =>
      'Jika anda kehilangan frasa ini dan lupa PIN, anda akan kehilangan akses ke akaun anda.';

  @override
  String get accountTransferred => 'Akaun dipindahkan';

  @override
  String get accountTransferredMessage =>
      'Akaun anda telah dipindahkan ke peranti lain. Sesi ini tidak lagi sah.';

  @override
  String get accountTransferredInfo =>
      'Jika anda tidak memulakan pemindahan ini, akaun anda mungkin telah terjejas.';

  @override
  String get logout => 'Log keluar';

  @override
  String get transferAccount => 'Pindahkan akaun';

  @override
  String get transferAccountInfo =>
      'Pindahkan akaun Hash anda ke peranti baharu. Sesi semasa anda akan dibatalkan.';

  @override
  String get generateTransferCode => 'Jana kod pemindahan';

  @override
  String get transferCode => 'Kod pemindahan';

  @override
  String transferCodeExpires(int minutes) {
    return 'Kod ini tamat tempoh dalam $minutes minit';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Masukkan kod ini di peranti baharu anda untuk memindahkan akaun.';

  @override
  String get generateNewCode => 'Jana kod baharu';

  @override
  String get scanQrCode => 'Imbas kod QR';

  @override
  String get scanQrCodeSubtitle => 'Imbas kod QR kenalan untuk menambah mereka';

  @override
  String get qrCodeDetected => 'Kod QR dikesan';

  @override
  String get invalidQrCode => 'Kod QR tidak sah';

  @override
  String get cameraPermissionRequired => 'Kebenaran kamera diperlukan';

  @override
  String get myQrCode => 'Kod QR saya';

  @override
  String get myQrCodeSubtitle =>
      'Kongsi kod QR ini supaya kenalan anda boleh menambah anda';

  @override
  String get shareQrCode => 'Kongsi';

  @override
  String get addContactTitle => 'Tambah kenalan';

  @override
  String get addContactByHashId => 'Masukkan Hash ID kenalan anda';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Cari';

  @override
  String get contactNotFound => 'Kenalan tidak dijumpai';

  @override
  String get contactAlreadyAdded => 'Kenalan ini sudah ada dalam senarai anda';

  @override
  String get contactAdded => 'Kenalan ditambah';

  @override
  String get myProfile => 'Profil saya';

  @override
  String get myProfileSubtitle =>
      'Kongsi maklumat ini supaya orang lain boleh menambah anda';

  @override
  String get temporaryCode => 'Kod sementara';

  @override
  String temporaryCodeExpires(String time) {
    return 'Tamat tempoh dalam $time';
  }

  @override
  String get codeExpired => 'Kod tamat tempoh';

  @override
  String get generateNewCodeButton => 'Kod baharu';

  @override
  String get copyHashId => 'Salin ID';

  @override
  String get copyCode => 'Salin kod';

  @override
  String get copiedToClipboard => 'Disalin';

  @override
  String get showMyQrCode => 'Papar kod QR saya';

  @override
  String get orDivider => 'atau';

  @override
  String get openScanner => 'Buka pengimbas';

  @override
  String get addManually => 'Tambah secara manual';

  @override
  String get contactHashIdLabel => 'Hash ID kenalan';

  @override
  String get temporaryCodeLabel => 'Kod sementara';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Minta kenalan anda menjana kod dari profil mereka';

  @override
  String get verifyAndAdd => 'Sahkan dan tambah';

  @override
  String get fillAllFields => 'Sila isi semua medan';

  @override
  String get invalidHashIdFormat => 'Format ID tidak sah (cth.: 123-456-ABC)';

  @override
  String get userNotFound => 'Pengguna tidak dijumpai';

  @override
  String get cannotAddYourself => 'Anda tidak boleh menambah diri sendiri';

  @override
  String get invalidOrExpiredCode =>
      'Kod sementara tidak sah atau tamat tempoh';

  @override
  String get contactFound => 'Kenalan dijumpai!';

  @override
  String get howToCallContact => 'Apa nama yang anda ingin berikan?';

  @override
  String get contactNameHint => 'Nama kenalan';

  @override
  String get addContactButton => 'Tambah';

  @override
  String get contactDetails => 'Butiran kenalan';

  @override
  String get contactName => 'Nama kenalan';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Ditambah pada $date';
  }

  @override
  String get deleteContact => 'Padam kenalan';

  @override
  String deleteContactConfirm(Object name) {
    return 'Padam kenalan ini?';
  }

  @override
  String get deleteContactMessage =>
      'Ini juga akan memadamkan keseluruhan sembang.';

  @override
  String get delete => 'Padam';

  @override
  String get typeMessage => 'Taip mesej...';

  @override
  String get messageSent => 'Dihantar';

  @override
  String get messageDelivered => 'Disampaikan';

  @override
  String get messageRead => 'Dibaca';

  @override
  String get messageFailed => 'Gagal menghantar';

  @override
  String get now => 'Sekarang';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}j';
  }

  @override
  String daysAgo(int count) {
    return '${count}h';
  }

  @override
  String get today => 'Hari ini';

  @override
  String get yesterday => 'Semalam';

  @override
  String dateAtTime(String date, String time) {
    return '$date pada $time';
  }

  @override
  String get shareMessage =>
      'Sertai saya di Hash! 🔒\n\nIni adalah pemesejan yang benar-benar peribadi: penyulitan total, tiada jejak di pelayan, dan mod panik jika perlu.\n\nMuat turun aplikasi di sini 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Ralat';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Lihat';

  @override
  String get yes => 'Ya';

  @override
  String get no => 'Tidak';

  @override
  String get save => 'Simpan';

  @override
  String get edit => 'Edit';

  @override
  String get close => 'Tutup';

  @override
  String get confirm => 'Sahkan';

  @override
  String get loading => 'Memuatkan...';

  @override
  String get retry => 'Cuba lagi';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Permintaan tertunda';

  @override
  String get noPendingRequests => 'Tiada permintaan tertunda';

  @override
  String get pendingRequestsSubtitle => 'Orang-orang ini mahu menambah anda';

  @override
  String requestFromUser(String hashId) {
    return 'Permintaan daripada $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Tamat tempoh dalam $days hari';
  }

  @override
  String get acceptRequest => 'Terima';

  @override
  String get rejectRequest => 'Tolak';

  @override
  String get requestAccepted => 'Permintaan diterima';

  @override
  String get requestRejected => 'Permintaan ditolak';

  @override
  String get requestSent => 'Permintaan dihantar!';

  @override
  String get requestSentSubtitle =>
      'Permintaan anda telah dihantar. Pengguna mesti menerimanya sebelum anda boleh bersembang.';

  @override
  String get requestAlreadyPending => 'Permintaan sudah tertunda';

  @override
  String get requestAlreadySentByOther =>
      'Orang ini sudah menghantar permintaan kepada anda';

  @override
  String get addByHashId => 'Tambah melalui Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Masukkan Hash ID dan kod sementara kenalan';

  @override
  String get enterTemporaryCode => 'Masukkan kod 6 digit';

  @override
  String get sendRequest => 'Hantar permintaan';

  @override
  String get acceptContactTitle => 'Terima kenalan';

  @override
  String get acceptContactSubtitle => 'Anda boleh memberi mereka nama tersuai';

  @override
  String get leaveEmptyForHashId => 'Biarkan kosong untuk menggunakan Hash ID';

  @override
  String get firstName => 'Nama pertama';

  @override
  String get lastName => 'Nama akhir';

  @override
  String get notes => 'Nota';

  @override
  String get notesHint => 'Nota peribadi tentang kenalan ini';

  @override
  String get photoOptional => 'Foto (pilihan)';

  @override
  String get contactNameOptional => 'Nama (pilihan)';

  @override
  String get notesOptional => 'Nota (pilihan)';

  @override
  String get storedLocally => 'Disimpan di peranti anda sahaja';

  @override
  String get encryptedMessageLabel => 'Mesej yang disulitkan';

  @override
  String get identityMessageHint =>
      'Siapa anda? Bagaimana anda saling mengenali?';

  @override
  String get messageWillBeSentEncrypted =>
      'Mesej ini akan disulitkan dan dihantar kepada penerima';

  @override
  String get sendRequestButton => 'Hantar permintaan';

  @override
  String get requestExpiresIn24h =>
      'Permintaan tamat tempoh dalam 24j jika tidak diterima';

  @override
  String get theyAlreadySentYouRequest =>
      'Orang ini sudah menghantar permintaan kepada anda';

  @override
  String get requests => 'Permintaan';

  @override
  String get receivedRequests => 'Diterima';

  @override
  String get sentRequests => 'Dihantar';

  @override
  String get noSentRequests => 'Tiada permintaan dihantar';

  @override
  String get cancelRequest => 'Batal';

  @override
  String get deleteRequest => 'Padam permintaan';

  @override
  String get requestCancelled => 'Permintaan dibatalkan';

  @override
  String sentTo(String hashId) {
    return 'Dihantar kepada $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Tamat tempoh dalam $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Diterima $time lalu';
  }

  @override
  String get messageFromRequester => 'Mesej daripada peminta';

  @override
  String get copy => 'Salin';

  @override
  String get messageInfo => 'Maklumat mesej';

  @override
  String get messageDirection => 'Arah';

  @override
  String get messageSentByYou => 'Dihantar oleh anda';

  @override
  String get messageReceived => 'Diterima';

  @override
  String get messageSentAt => 'Dihantar pada';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Dibaca pada';

  @override
  String get messageType => 'Jenis';

  @override
  String get messageSize => 'Saiz';

  @override
  String get messageExpiresAt => 'Tamat tempoh pada';

  @override
  String get messageEncrypted => 'Penyulitan hujung-ke-hujung';

  @override
  String get messageStatusSending => 'Menghantar...';

  @override
  String get messageStatusSent => 'Dihantar';

  @override
  String get messageStatusDelivered => 'Disampaikan';

  @override
  String get messageStatusRead => 'Dibaca';

  @override
  String get messageStatusFailed => 'Gagal';

  @override
  String get serverStatus => 'Pelayan';

  @override
  String get onServer => 'Menunggu penghantaran';

  @override
  String get deletedFromServer => 'Dipadamkan';

  @override
  String get messageTypeText => 'Teks';

  @override
  String get messageTypeImage => 'Imej';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Suara';

  @override
  String get messageTypeFile => 'Fail';

  @override
  String get indefinitely => 'Tanpa had';

  @override
  String get hoursShort => 'j';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'jam';

  @override
  String get minutes => 'minit';

  @override
  String get seconds => 'saat';

  @override
  String get ephemeralMessages => 'Mesej sementara';

  @override
  String get ephemeralMessagesDescription =>
      'Mesej dipadamkan secara automatik selepas masa ini';

  @override
  String get ephemeralImmediate => 'Serta-merta (selepas dibaca)';

  @override
  String get ephemeralImmediateDesc => 'Dipadamkan sebaik sahaja dibaca';

  @override
  String get ephemeralMyPreference => 'Keutamaan saya';

  @override
  String get ephemeralMyPreferenceDesc => 'Gunakan tetapan global';

  @override
  String get ephemeralDefaultSetting => 'Tempoh mesej';

  @override
  String get ephemeralChooseDefault => 'Disyorkan';

  @override
  String get ephemeral30Seconds => '30 saat';

  @override
  String get ephemeral30SecondsDesc => 'Dipadam 30s selepas dibaca';

  @override
  String get ephemeral5Minutes => '5 minit';

  @override
  String get ephemeral5MinutesDesc => 'Dipadam 5min selepas dibaca';

  @override
  String get ephemeral1Hour => '1 jam';

  @override
  String get ephemeral1HourDesc => 'Dipadam 1j selepas dibaca';

  @override
  String get ephemeral3Hours => '3 jam';

  @override
  String get ephemeral6Hours => '6 jam';

  @override
  String get ephemeral6HoursDesc => 'Dipadam 6j selepas dibaca';

  @override
  String get ephemeral12Hours => '12 jam';

  @override
  String get ephemeral24Hours => '24 jam';

  @override
  String get ephemeral24HoursDesc => 'Dipadam 24j selepas dibaca';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Tempoh tersuai';

  @override
  String get howItWorks => 'Cara ia berfungsi';

  @override
  String get ephemeralExplanation1 =>
      'Mesej dipadamkan dari pelayan sebaik sahaja diterima.';

  @override
  String get ephemeralExplanation2 =>
      'Tetapan ini menentukan bila mesej hilang dari telefon ANDA selepas dibaca.';

  @override
  String get ephemeralExplanation3 =>
      'Kenalan anda mempunyai tetapan sendiri untuk telefon mereka.';

  @override
  String get mute1Hour => '1 jam';

  @override
  String get mute8Hours => '8 jam';

  @override
  String get mute1Day => '1 hari';

  @override
  String get mute1Week => '1 minggu';

  @override
  String get muteAlways => 'Sentiasa';

  @override
  String get muteExplanation =>
      'Anda tidak akan menerima pemberitahuan untuk kenalan ini';

  @override
  String get showCallsInRecents => 'Papar dalam panggilan terkini';

  @override
  String get showCallsInRecentsSubtitle =>
      'Panggilan Hash muncul dalam sejarah telefon';

  @override
  String get feedback => 'Maklum balas';

  @override
  String get muteNotifications => 'Senyapkan pemberitahuan';

  @override
  String get muteDescription =>
      'Anda tidak akan menerima pemberitahuan untuk kenalan ini';

  @override
  String mutedUntil(String time) {
    return 'Disenyapkan sehingga $time';
  }

  @override
  String get notMuted => 'Pemberitahuan aktif';

  @override
  String get unmute => 'Nyahsenyap';

  @override
  String get notificationSound => 'Bunyi pemberitahuan';

  @override
  String get defaultSound => 'Lalai';

  @override
  String get chatSettings => 'Tetapan sembang';

  @override
  String get bubbleColor => 'Warna gelembung';

  @override
  String get backgroundColor => 'Warna latar belakang';

  @override
  String get backgroundImage => 'Imej latar belakang';

  @override
  String get chatBackground => 'Latar belakang sembang';

  @override
  String get customColor => 'Tersuai';

  @override
  String get defaultColor => 'Lalai';

  @override
  String get imageSelected => 'Imej dipilih';

  @override
  String get noImage => 'Tiada imej';

  @override
  String get color => 'Warna';

  @override
  String get image => 'Imej';

  @override
  String get tapToSelectImage => 'Ketik untuk memilih imej';

  @override
  String get changeImage => 'Tukar imej';

  @override
  String get previewMessageReceived => 'Hai!';

  @override
  String get previewMessageSent => 'Apa khabar!';

  @override
  String get messageAction => 'Mesej';

  @override
  String get callAction => 'Panggil';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Nota peribadi';

  @override
  String get addNotes => 'Tambah nota...';

  @override
  String get noNotes => 'Tiada nota';

  @override
  String get messageNotifications => 'Pemberitahuan mesej';

  @override
  String get callNotifications => 'Pemberitahuan panggilan';

  @override
  String get useGradient => 'Gunakan kecerunan';

  @override
  String get gradientStart => 'Warna mula';

  @override
  String get gradientEnd => 'Warna akhir';

  @override
  String get preview => 'Pratonton';

  @override
  String get reset => 'Set semula';

  @override
  String get securityNumber => 'Nombor keselamatan';

  @override
  String securityNumberDescription(String name) {
    return 'Sahkan bahawa nombor keselamatan sepadan dengan peranti $name';
  }

  @override
  String get verifyEncryption => 'Sahkan penyulitan hujung-ke-hujung';

  @override
  String get tapToCopy => 'Ketik untuk menyalin';

  @override
  String get howToVerify => 'Cara mengesahkan';

  @override
  String get verifyStep1 =>
      'Jumpa kenalan anda secara peribadi atau hubungi mereka';

  @override
  String get verifyStep2 => 'Bandingkan nombor keselamatan atau imbas kod QR';

  @override
  String get verifyStep3 => 'Jika sepadan, sembang anda selamat';

  @override
  String get scanToVerify => 'Imbas untuk mengesahkan';

  @override
  String get reportSpam => 'Laporkan spam';

  @override
  String get reportSpamSubtitle => 'Laporkan kenalan ini sebagai spam';

  @override
  String get reportSpamDescription =>
      'Ini akan melaporkan kenalan ini secara tanpa nama. Identiti anda tidak akan dikongsi. Anda pasti?';

  @override
  String get report => 'Laporkan';

  @override
  String get spamReported => 'Spam dilaporkan';

  @override
  String get reportError => 'Gagal menghantar laporan. Sila cuba lagi.';

  @override
  String get reportRateLimited =>
      'Anda telah mencapai jumlah maksimum laporan untuk hari ini.';

  @override
  String get blockContact => 'Sekat kenalan';

  @override
  String get blockContactDescription =>
      'Kenalan ini tidak akan dapat menghantar mesej atau menghubungi anda lagi. Mereka tidak akan diberitahu.';

  @override
  String get unblockContact => 'Nyahsekat kenalan';

  @override
  String get unblockContactDescription =>
      'Kenalan ini akan dapat menghantar mesej dan menghubungi anda semula.';

  @override
  String get contactBlocked => 'Kenalan disekat';

  @override
  String get contactUnblocked => 'Kenalan dinyahsekat';

  @override
  String get contactIsBlocked => 'Kenalan ini disekat';

  @override
  String get unblock => 'Nyahsekat';

  @override
  String get deleteContactSubtitle => 'Padam kenalan dan sembang ini';

  @override
  String get confirmWithPin => 'Sahkan dengan PIN';

  @override
  String get enterPinToConfirm =>
      'Masukkan PIN anda untuk mengesahkan tindakan ini';

  @override
  String get profilePhoto => 'Foto profil';

  @override
  String get takePhoto => 'Ambil foto';

  @override
  String get chooseFromGallery => 'Pilih dari galeri';

  @override
  String get removePhoto => 'Buang foto';

  @override
  String get viewContactHashId => 'Lihat pengecam kenalan';

  @override
  String get hashIdPartiallyMasked =>
      'Separuh bertopeng untuk keselamatan anda dan privasi kenalan anda';

  @override
  String get addFirstContact => 'Tambah kenalan pertama anda';

  @override
  String get addFirstContactSubtitle =>
      'Kongsi kod QR anda atau imbas milik rakan';

  @override
  String get directory => 'Direktori';

  @override
  String get noContacts => 'Tiada kenalan';

  @override
  String get noContactsSubtitle => 'Tambah kenalan untuk bermula';

  @override
  String get sendMessageAction => 'Hantar mesej';

  @override
  String get audioCall => 'Panggilan audio';

  @override
  String get videoCall => 'Panggilan video';

  @override
  String get viewProfile => 'Lihat profil';

  @override
  String get deleteContactDirectory => 'Padam kenalan';

  @override
  String get scanShort => 'Imbas';

  @override
  String get addShort => 'Tambah';

  @override
  String deleteContactConfirmName(String name) {
    return 'Anda pasti mahu memadamkan $name?';
  }

  @override
  String get noNotesTitle => 'Tiada nota';

  @override
  String get noNotesSubtitle => 'Buat nota pertama anda';

  @override
  String get newNote => 'Nota baharu';

  @override
  String get editNote => 'Edit nota';

  @override
  String get deleteNote => 'Padam nota';

  @override
  String get deleteNoteConfirm => 'Anda pasti mahu memadamkan nota ini?';

  @override
  String get noteTitle => 'Tajuk';

  @override
  String get noteContent => 'Kandungan';

  @override
  String get addItem => 'Tambah item';

  @override
  String get pinNote => 'Semat';

  @override
  String get unpinNote => 'Nyahsemat';

  @override
  String get noteColor => 'Warna';

  @override
  String get notePassword => 'Kata laluan';

  @override
  String get setPassword => 'Tetapkan kata laluan';

  @override
  String get changePassword => 'Tukar kata laluan';

  @override
  String get removePassword => 'Buang kata laluan';

  @override
  String get enterPassword => 'Masukkan kata laluan';

  @override
  String get confirmPassword => 'Sahkan kata laluan';

  @override
  String get passwordPin => 'Kod PIN';

  @override
  String get passwordText => 'Kata laluan teks';

  @override
  String get protectedNote => 'Nota dilindungi';

  @override
  String get incorrectPassword => 'Kata laluan salah';

  @override
  String get passwordSet => 'Kata laluan ditetapkan';

  @override
  String get passwordRemoved => 'Kata laluan dibuang';

  @override
  String get notesBiometric => 'Face ID untuk nota';

  @override
  String get notesBiometricSubtitle =>
      'Memerlukan pengesahan biometrik untuk membuka nota dilindungi';

  @override
  String get textNote => 'Nota teks';

  @override
  String get checklistNote => 'Senarai semak';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tugas';
  }

  @override
  String get autoSaved => 'Disimpan';

  @override
  String get searchNotes => 'Cari nota';

  @override
  String get legalConsent => 'Persetujuan undang-undang';

  @override
  String get confirmAge13 =>
      'Saya mengesahkan bahawa saya berumur sekurang-kurangnya 13 tahun';

  @override
  String get acceptLegalStart => 'Saya menerima ';

  @override
  String get privacyPolicy => 'Dasar Privasi';

  @override
  String get termsOfService => 'Terma Perkhidmatan';

  @override
  String get andThe => ' dan ';

  @override
  String get continueButton => 'Teruskan';

  @override
  String get mustAcceptTerms =>
      'Anda mesti menerima kedua-dua syarat untuk meneruskan';

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
  String get support => 'Sokongan';

  @override
  String get contactSupport => 'Hubungi sokongan';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Laporkan penyalahgunaan';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Undang-undang';

  @override
  String get legalEntity => 'Entiti undang-undang';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Semat';

  @override
  String get unpinConversation => 'Nyahsemat';

  @override
  String get hideConversation => 'Buang dari suapan';

  @override
  String get deleteConversation => 'Padam perbualan';

  @override
  String get deleteConversationConfirm =>
      'Masukkan PIN anda untuk mengesahkan pemadaman semua mesej';

  @override
  String get noConversations => 'Belum ada perbualan';

  @override
  String get startConversation => 'Mula';

  @override
  String get microphonePermissionRequired => 'Kebenaran mikrofon diperlukan';

  @override
  String get microphonePermissionExplanation =>
      'Hash memerlukan mikrofon untuk membuat panggilan.';

  @override
  String get cameraPermissionExplanation =>
      'Hash memerlukan kamera untuk panggilan video.';

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
  String get openSettings => 'Buka Tetapan';

  @override
  String get callConnecting => 'Menyambung...';

  @override
  String get callRinging => 'Berdering...';

  @override
  String get callReconnecting => 'Menyambung semula...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Menyambung semula (${seconds}s)';
  }

  @override
  String get callPaused => 'Dijeda';

  @override
  String get callPausedSubtitle => 'Panggilan masih berlangsung';

  @override
  String get callRemoteMicMuted => 'Mikrofon kenalan disenyapkan';

  @override
  String get callMiniControlsMute => 'Senyap';

  @override
  String get callMiniControlsUnmute => 'Nyahsenyap';

  @override
  String get callMiniControlsHangUp => 'Tamatkan';

  @override
  String get callMiniControlsReturn => 'Kembali ke panggilan';

  @override
  String get callNetworkPoor => 'Sambungan tidak stabil';

  @override
  String get callNetworkLost => 'Sambungan terputus';

  @override
  String get callEndedTitle => 'Panggilan tamat';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Data peranti';

  @override
  String get deviceDataSubtitle => 'Storan tempatan dan pelayan';

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
  String get localStorage => 'Storan tempatan';

  @override
  String get onThisDevice => 'di peranti ini';

  @override
  String get encryptedDatabases => 'Pangkalan data yang disulitkan';

  @override
  String get files => 'Fail';

  @override
  String get secureKeychain => 'Rantai kunci selamat';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Nama, avatar, kunci Signal';

  @override
  String get messagesDetail => 'Perbualan yang disulitkan';

  @override
  String get notesDetail => 'Nota peribadi';

  @override
  String get signalSessions => 'Sesi Signal';

  @override
  String get signalSessionsDetail => 'Sesi penyulitan';

  @override
  String get pendingContacts => 'Kenalan tertunda';

  @override
  String get pendingContactsDetail => 'Permintaan tertunda';

  @override
  String get callHistory => 'Panggilan';

  @override
  String get callHistoryDetail => 'Sejarah panggilan';

  @override
  String get preferences => 'Keutamaan';

  @override
  String get preferencesDetail => 'Keutamaan media dan panggilan';

  @override
  String get avatars => 'Avatar';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fail',
      one: '1 fail',
      zero: 'tiada fail',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktif';

  @override
  String get notDefined => 'Tidak ditentukan';

  @override
  String get biometrics => 'Biometrik';

  @override
  String get recoveryPhrase => 'Frasa pemulihan';

  @override
  String get identity => 'Identiti (Hash ID)';

  @override
  String get signalKeys => 'Kunci Signal Protocol';

  @override
  String get authTokens => 'Token pengesahan';

  @override
  String get contactNamesCache => 'Cache nama kenalan';

  @override
  String get remoteConfig => 'Konfigurasi jauh';

  @override
  String get notificationPrefs => 'Keutamaan pemberitahuan';

  @override
  String get serverData => 'Data pelayan';

  @override
  String get serverDataInfo =>
      'Hash menyimpan data minimum di pelayan, semuanya disulitkan atau sementara.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, kunci awam, token peti surat';

  @override
  String get serverPrekeys => 'Pra-kunci';

  @override
  String get serverPrekeysDetail => 'Kunci Signal sekali guna (digunakan)';

  @override
  String get serverMessages => 'Mesej dalam transit';

  @override
  String get serverMessagesDetail =>
      'Dipadamkan selepas penghantaran (maks 24j)';

  @override
  String get serverMedia => 'Media dalam transit';

  @override
  String get serverMediaDetail => 'Dipadamkan selepas dimuat turun';

  @override
  String get serverContactRequests => 'Permintaan kenalan';

  @override
  String get serverContactRequestsDetail => 'Tamat tempoh selepas 24j';

  @override
  String get serverRateLimits => 'Had kadar';

  @override
  String get serverRateLimitsDetail => 'Data anti-penyalahgunaan sementara';

  @override
  String get privacyReassurance =>
      'Hash tidak boleh membaca mesej anda. Semua data disulitkan hujung-ke-hujung. Data pelayan dipadamkan secara automatik.';

  @override
  String get pinTooSimple =>
      'PIN ini terlalu mudah. Pilih kod yang lebih selamat.';

  @override
  String get genericError => 'Ralat berlaku. Sila cuba lagi.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Tidak dapat membuat akaun: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frasa disalin ke papan keratan';

  @override
  String get copyPhrase => 'Salin frasa';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Tulis frasa ini di tempat yang selamat. Jika anda kehilangan PIN tanpa frasa ini, anda akan kehilangan akses ke data anda secara kekal.';

  @override
  String get noMessages => 'Tiada mesej';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Padam semua mesej dengan $name?';
  }

  @override
  String get confirmation => 'Pengesahan';

  @override
  String get untitled => 'Tanpa tajuk';

  @override
  String get noSessions => 'Tiada sesi';

  @override
  String get unknownContact => 'Kenalan tidak diketahui';

  @override
  String get unnamed => 'Tanpa nama';

  @override
  String get noPendingRequestsAlt => 'Tiada permintaan tertunda';

  @override
  String get deleteAllCallHistory => 'Padam semua sejarah panggilan?';

  @override
  String get noCalls => 'Tiada panggilan';

  @override
  String get noPreferences => 'Tiada keutamaan';

  @override
  String get resetAllMediaPrefs => 'Set semula semua keutamaan media?';

  @override
  String get deleteThisAvatar => 'Padam avatar ini?';

  @override
  String get deleteAllAvatars => 'Padam semua avatar?';

  @override
  String get noAvatars => 'Tiada avatar';

  @override
  String get deleteThisFile => 'Padam fail ini?';

  @override
  String get deleteAllMediaFiles => 'Padam semua media?';

  @override
  String get noMediaFiles => 'Tiada media';

  @override
  String get outgoing => 'Keluar';

  @override
  String get incoming => 'Masuk';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Paparan sementara: ${seconds}s';
  }

  @override
  String get normalView => 'Paparan biasa';

  @override
  String get callReasonCompleted => 'Selesai';

  @override
  String get callReasonMissed => 'Terlepas';

  @override
  String get callReasonDeclined => 'Ditolak';

  @override
  String get callReasonFailed => 'Gagal';

  @override
  String get justNow => 'Baru sahaja';

  @override
  String timeAgoMinutes(int count) {
    return '$count min lalu';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}j lalu';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}h lalu';
  }

  @override
  String get messageTypeContact => 'Kenalan';

  @override
  String get messageTypeLocation => 'Lokasi';

  @override
  String get statusQueued => 'Dalam giliran';

  @override
  String get blockedBadge => 'Disekat';

  @override
  String get protectedBadge => 'Dilindungi';

  @override
  String messageCount(int count) {
    return '$count mesej';
  }

  @override
  String get deleteQuestion => 'Padam?';

  @override
  String get transferMyAccountTitle => 'Pindahkan akaun saya';

  @override
  String get loadingError => 'Ralat pemuatan';

  @override
  String get transferToNewDevice => 'Pindah ke peranti baharu';

  @override
  String get transferInstructions =>
      'Pada peranti baharu anda, pilih \"Pulihkan akaun saya\" dan masukkan maklumat ini:';

  @override
  String get yourHashIdLabel => 'Hash ID anda';

  @override
  String get enterYourPinCode => 'Masukkan kod PIN anda';

  @override
  String get pinOwnerConfirmation =>
      'Untuk mengesahkan bahawa anda pemilik akaun ini';

  @override
  String get scanThisQrCode => 'Imbas kod QR ini';

  @override
  String get withYourNewDevice => 'Dengan peranti baharu anda';

  @override
  String get orEnterTheCode => 'atau masukkan kod';

  @override
  String get transferCodeLabel => 'Kod pemindahan';

  @override
  String get proximityVerification => 'Pengesahan berdekatan';

  @override
  String get bringDevicesCloser => 'Dekatkan kedua-dua peranti';

  @override
  String get confirmTransferQuestion => 'Sahkan pemindahan?';

  @override
  String get accountWillBeTransferred =>
      'Akaun anda akan dipindahkan ke peranti baharu.\n\nPeranti ini akan diputuskan secara kekal.';

  @override
  String get transferComplete => 'Pemindahan selesai';

  @override
  String get transferSuccessMessage =>
      'Akaun anda telah berjaya dipindahkan.\n\nAplikasi ini akan ditutup sekarang.';

  @override
  String get manualVerification => 'Pengesahan manual';

  @override
  String get codeDisplayedOnBothDevices =>
      'Kod dipaparkan pada kedua-dua peranti:';

  @override
  String get doesCodeMatchNewDevice =>
      'Adakah kod ini sepadan dengan yang pada peranti baharu?';

  @override
  String get verifiedStatus => 'Disahkan';

  @override
  String get inProgressStatus => 'Sedang berlangsung...';

  @override
  String get notAvailableStatus => 'Tidak tersedia';

  @override
  String get codeExpiredRestart =>
      'Kod telah tamat tempoh. Sila mulakan semula.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kod tidak sepadan. Pemindahan dibatalkan.';

  @override
  String transferToDevice(String device) {
    return 'Ke: $device';
  }

  @override
  String get copiedExclamation => 'Disalin!';

  @override
  String expiresInTime(String time) {
    return 'Tamat tempoh dalam $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrik tidak tersedia pada peranti ini';

  @override
  String get biometricAuthError => 'Ralat pengesahan biometrik';

  @override
  String get authenticateForBiometric =>
      'Sila buat pengesahan untuk mengaktifkan biometrik';

  @override
  String get biometricAuthFailed => 'Pengesahan biometrik gagal';

  @override
  String get forceUpdateTitle => 'Kemas kini diperlukan';

  @override
  String get forceUpdateMessage =>
      'Versi baharu Hash tersedia. Sila kemas kini untuk meneruskan.';

  @override
  String get updateButton => 'Kemas kini';

  @override
  String get maintenanceInProgress => 'Penyelenggaraan sedang berlangsung';

  @override
  String get tryAgainLater => 'Sila cuba lagi kemudian';

  @override
  String get information => 'Maklumat';

  @override
  String get later => 'Kemudian';

  @override
  String get doYouLikeHash => 'Adakah anda suka Hash?';

  @override
  String get yourFeedbackHelps =>
      'Maklum balas anda membantu kami memperbaiki aplikasi';

  @override
  String get ratingTerrible => 'Teruk';

  @override
  String get ratingBad => 'Buruk';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Baik';

  @override
  String get ratingExcellent => 'Cemerlang!';

  @override
  String get donationMessage =>
      'Hash adalah projek bukan untung. Sokongan anda membantu kami terus membina penghantar mesej yang benar-benar peribadi.';

  @override
  String get recentConnections => 'Sambungan terkini';

  @override
  String get loginInfoText =>
      'Setiap pembukaan PIN direkodkan secara tempatan. Hanya 24 jam terakhir disimpan.';

  @override
  String get connectionCount => 'Sambungan';

  @override
  String get periodLabel => 'Tempoh';

  @override
  String get historyLabel => 'Sejarah';

  @override
  String get noLoginRecorded => 'Tiada log masuk dicatatkan';

  @override
  String get nextUnlocksAppearHere =>
      'Pembukaan kunci seterusnya akan muncul di sini.';

  @override
  String get dataLocalOnly =>
      'Data ini disimpan hanya pada peranti anda dan tidak pernah dihantar.';

  @override
  String get currentSession => 'Semasa';

  @override
  String get todayLabel => 'Hari ini';

  @override
  String get yesterdayLabel => 'Semalam';

  @override
  String get justNowLabel => 'Baru sahaja';

  @override
  String minutesAgoLabel(int count) {
    return '$count min lalu';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}j lalu';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}j ${minutes}min lalu';
  }

  @override
  String get noMaintenancePlanned => 'Tiada penyelenggaraan dirancang';

  @override
  String get everythingWorkingNormally => 'Semuanya berfungsi dengan normal';

  @override
  String get maintenanceTitle => 'Penyelenggaraan';

  @override
  String get maintenanceActiveLabel => 'SEDANG BERJALAN';

  @override
  String get maintenancePlannedLabel => 'DIRANCANG';

  @override
  String get locking => 'Mengunci...';

  @override
  String get newMessageNotification => 'Mesej baharu';

  @override
  String get secExplainTitle => 'Bagaimana Hash melindungi anda';

  @override
  String get secExplainIntro =>
      'Hash direka supaya tiada sesiapa boleh membaca mesej anda.';

  @override
  String get secExplainIntroSub =>
      'Termasuk kami.\nBegini cara ia berfungsi, dijelaskan dengan mudah.';

  @override
  String get secJourneyLabel => 'PERJALANAN';

  @override
  String get secJourneyTitle => 'Perjalanan mesej anda';

  @override
  String get secJourneySubtitle =>
      'Dari jari anda ke skrin kenalan anda, setiap langkah dilindungi. Ikuti laluan.';

  @override
  String get secStep1Title => 'Anda menulis mesej anda';

  @override
  String get secStep1Desc =>
      'Anda menaip \"Hai!\" dalam aplikasi. Pada ketika ini, mesej hanya wujud dalam memori telefon anda. Tiada apa yang dihantar.';

  @override
  String get secStep2Title => 'Penyulitan dengan Signal Protocol';

  @override
  String get secStep2Desc =>
      'Sebaik sahaja anda menekan \"Hantar\", mesej anda diubah menjadi rentetan aksara yang tidak dapat difahami. Seolah-olah mesej anda dikunci dalam peti besi yang hanya kenalan anda mempunyai kuncinya.';

  @override
  String get secStep3Title => 'Sealed Sender: sampul surat tidak kelihatan';

  @override
  String get secStep3Desc =>
      'Bayangkan menghantar surat melalui pos, tetapi tanpa alamat pengirim pada sampul surat. Itulah yang Hash lakukan. Mesej dijatuhkan ke dalam peti surat tanpa nama. Pelayan tidak tahu siapa yang menghantarnya.';

  @override
  String get secStep4Title => 'Pelayan tidak melihat apa-apa';

  @override
  String get secStep4Desc =>
      'Pelayan bertindak sebagai posmen buta. Ia hanya tahu \"seseorang menjatuhkan sesuatu dalam peti surat #A7X9\". Ia tidak tahu siapa yang menghantarnya, apa itu, atau untuk siapa.';

  @override
  String get secStep4Highlight =>
      'Tiada metadata disimpan: tiada alamat IP, tiada cap masa, tiada pautan antara pengirim dan penerima.';

  @override
  String get secStep5Title => 'Kenalan anda menerima mesej';

  @override
  String get secStep5Desc =>
      'Telefon kenalan anda mengambil kandungan dari peti surat tanpa nama mereka dan menyahsulit mesej dengan kunci peribadi mereka, yang tidak pernah meninggalkan peranti mereka. \"Hai!\" muncul di skrin mereka.';

  @override
  String get secStep6Title => 'Mesej hilang dari pelayan';

  @override
  String get secStep6Desc =>
      'Sebaik sahaja kenalan anda mengesahkan penerimaan, pelayan memadamkan mesej secara kekal. Tiada tong sampah, tiada arkib, tiada sandaran. Malah mesej yang belum dibaca dimusnahkan secara automatik selepas 24 jam.';

  @override
  String get secStep7Title => 'Tamat tempoh tempatan';

  @override
  String get secStep7Desc =>
      'Di telefon kenalan anda, mesej memusnahkan diri mengikut tempoh yang anda pilih: serta-merta selepas dibaca, 5 minit, 1 jam... anda tentukan.';

  @override
  String get secJourneyConclusion =>
      'Hasilnya: tiada jejak di pelayan, tiada jejak di peranti. Mesej hanya wujud cukup lama untuk dibaca, kemudian ia hilang.';

  @override
  String get secArchLabel => 'SENI BINA';

  @override
  String get secArchTitle => '5 lapisan perlindungan';

  @override
  String get secArchSubtitle =>
      'Hash tidak bergantung pada satu teknologi. Setiap lapisan mengukuhkan yang lain. Walaupun satu lapisan terjejas, data anda kekal selamat.';

  @override
  String get secLayer1Title => 'Penyulitan hujung-ke-hujung';

  @override
  String get secLayer1Desc =>
      'Setiap mesej disulitkan dengan kunci unik. Dalam kata mudah: walaupun seseorang menyahsulit satu mesej, mereka tidak akan dapat menyahsulit yang seterusnya. Setiap mesej mempunyai kuncinya sendiri.';

  @override
  String get secLayer1Detail =>
      'Untuk fail (foto, video, dokumen), Hash menggunakan penyulitan AES-256-GCM tambahan. Fail disulitkan sebelum meninggalkan telefon anda.';

  @override
  String get secLayer2Title => 'Sealed Sender (kerahsiaan rangkaian)';

  @override
  String get secLayer2Desc =>
      'Pemesejan biasa menghantar mesej anda dengan identiti anda dilampirkan. Seperti menulis nama anda pada sampul surat. Hash menggunakan peti surat tanpa nama: pelayan menghantar mesej tanpa tahu siapa pengirimnya.';

  @override
  String get secLayer2Detail =>
      'Hasilnya: walaupun dalam kes kebocoran data pelayan, mustahil untuk membina semula siapa bercakap dengan siapa.';

  @override
  String get secLayer3Title => 'Pemadaman automatik';

  @override
  String get secLayer3Desc =>
      'Mesej dipadamkan dari pelayan sebaik sahaja penerimaan disahkan. Walaupun mesej tidak pernah diambil, ia dimusnahkan secara automatik selepas 24 jam.';

  @override
  String get secLayer3Detail =>
      'Di telefon anda, mesej memusnahkan diri mengikut tempoh yang anda pilih: serta-merta, 5 min, 15 min, 30 min, 1j, 3j, 6j, atau 12j.';

  @override
  String get secLayer4Title => 'Perlindungan akses tempatan';

  @override
  String get secLayer4Desc =>
      'Aplikasi dilindungi oleh PIN 6 digit dan/atau biometrik (Face ID, cap jari). Selepas terlalu banyak percubaan gagal, aplikasi mengunci dengan kelewatan yang meningkat selepas setiap kegagalan.';

  @override
  String get secLayer5Title => 'Pangkalan data berkunci';

  @override
  String get secLayer5Desc =>
      'Di sisi pelayan, tiada pengguna yang boleh menulis terus ke pangkalan data. Semua tindakan melalui fungsi selamat yang mengesahkan setiap permintaan.';

  @override
  String get secLayer5Detail =>
      'Seperti kaunter bank: anda tidak pernah menyentuh bilik kebal sendiri. Anda membuat permintaan, dan sistem memeriksa bahawa anda mempunyai hak sebelum bertindak.';

  @override
  String get secVashLabel => 'UNIK DI DUNIA';

  @override
  String get secVashTitle => 'Mod Vash';

  @override
  String get secVashSubtitle =>
      'Sistem keselamatan kecemasan yang tidak wujud dalam mana-mana aplikasi pemesejan lain.';

  @override
  String get secVashScenarioTitle => 'Bayangkan situasi ini';

  @override
  String get secVashScenario1 => 'Seseorang mengakses telefon anda';

  @override
  String get secVashScenario2 => 'Anda diminta kod PIN anda';

  @override
  String get secVashScenario3 =>
      'Anda mahu memadamkan semua data anda dengan segera';

  @override
  String get secVashSolutionTitle => 'Penyelesaian: dua kod PIN';

  @override
  String get secVashSolutionDesc =>
      'Anda mengkonfigurasi dua kod PIN berbeza dalam Hash:';

  @override
  String get secVashNormalCodeLabel => 'Kod biasa';

  @override
  String get secVashNormalCodeDesc =>
      'Membuka aplikasi seperti biasa dengan semua data anda';

  @override
  String get secVashCodeLabel2 => 'Kod Vash';

  @override
  String get secVashCodeDescription =>
      'Membuka aplikasi seperti biasa... tetapi semua data anda dipadamkan secara senyap di latar belakang';

  @override
  String get secVashWhatHappensTitle => 'Apa yang berlaku seterusnya';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikasi dibuka seperti biasa. Tiada amaran, tiada animasi mencurigakan. Skrin hanya memaparkan aplikasi kosong, seolah-olah anda baru sahaja memasangnya.\n\nHakikatnya, semua perbualan, kenalan, dan mesej anda telah dipadamkan secara tidak boleh diterbalikkan dalam sepersekian saat.';

  @override
  String get secCallsLabel => 'PANGGILAN & FAIL';

  @override
  String get secCallsTitle => 'Semuanya disulitkan';

  @override
  String get secCallsSubtitle =>
      'Bukan hanya mesej. Segala-galanya yang melalui Hash disulitkan hujung-ke-hujung.';

  @override
  String get secAudioCallTitle => 'Panggilan audio';

  @override
  String get secAudioCallDesc =>
      'Disulitkan hujung-ke-hujung melalui WebRTC. Suara dihantar terus antara peranti.';

  @override
  String get secVideoCallTitle => 'Panggilan video';

  @override
  String get secVideoCallDesc =>
      'Teknologi yang sama, setiap aliran disulitkan secara individu.';

  @override
  String get secPhotosTitle => 'Foto & video';

  @override
  String get secPhotosDesc =>
      'Disulitkan dalam AES-256-GCM sebelum meninggalkan telefon anda.';

  @override
  String get secDocsTitle => 'Dokumen';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, sebarang fail. Nama, saiz, dan kandungan disulitkan.';

  @override
  String get secAnonLabel => 'KERAHSIAAN';

  @override
  String get secAnonTitle => 'Tiada identiti diperlukan';

  @override
  String get secAnonSubtitle =>
      'Hash tidak pernah meminta nombor telefon atau emel anda. Anda dikenal pasti oleh Hash ID yang unik dan tanpa nama.';

  @override
  String get secHashIdTitle => 'Hash ID anda';

  @override
  String get secHashIdDesc =>
      'Ini adalah pengecam unik anda. Ia tidak mendedahkan apa-apa tentang anda: bukan nama, bukan nombor, bukan lokasi anda. Seperti nama samaran yang mustahil dikaitkan dengan identiti sebenar anda.\n\nUntuk menambah kenalan, anda berkongsi Hash ID anda atau mengimbas kod QR. Itu sahaja. Tiada buku alamat disegerakkan, tiada cadangan \"Orang yang anda mungkin kenal\".';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => 'Apa yang Hash tidak tahu';

  @override
  String get secDataSubtitle =>
      'Cara terbaik untuk melindungi data anda adalah tidak mengumpulnya.';

  @override
  String get secNeverCollected => 'Tidak pernah dikumpul';

  @override
  String get secNeverItem1 => 'Kandungan mesej';

  @override
  String get secNeverItem2 => 'Senarai kenalan';

  @override
  String get secNeverItem3 => 'Nombor telefon';

  @override
  String get secNeverItem4 => 'Alamat emel';

  @override
  String get secNeverItem5 => 'Alamat IP';

  @override
  String get secNeverItem6 => 'Lokasi';

  @override
  String get secNeverItem7 => 'Metadata (siapa bercakap dengan siapa)';

  @override
  String get secNeverItem8 => 'Sejarah panggilan';

  @override
  String get secNeverItem9 => 'Buku alamat';

  @override
  String get secNeverItem10 => 'Pengecam pengiklanan';

  @override
  String get secTempStored => 'Disimpan sementara';

  @override
  String get secTempItem1 => 'Hash ID tanpa nama (pengecam unik)';

  @override
  String get secTempItem2 => 'Kunci penyulitan awam';

  @override
  String get secTempItem3 => 'Mesej yang disulitkan dalam transit (maks 24j)';

  @override
  String get secTempNote =>
      'Walaupun data minimum ini tidak boleh mengenal pasti anda. Hash ID anda tidak dikaitkan dengan sebarang maklumat peribadi.';

  @override
  String get secFooterTitle => 'Privasi anda, kebebasan anda';

  @override
  String get secFooterDesc =>
      'Hash menggunakan teknologi penyulitan yang sama seperti aplikasi profesional yang paling menuntut. Mesej anda dilindungi oleh matematik, bukan oleh janji.';

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
