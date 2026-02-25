// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Tanpa Jejak. Tanpa Kompromi.';

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
  String get conversations => 'Obrolan';

  @override
  String get contacts => 'Kontak';

  @override
  String get noConversation => 'Tidak ada obrolan';

  @override
  String get noConversationSubtitle =>
      'Tambahkan kontak untuk mulai mengobrol dengan aman';

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
      other: '$count permintaan terkirim tertunda',
      one: '1 permintaan terkirim tertunda',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Tambah kontak';

  @override
  String get shareApp => 'Bagikan aplikasi';

  @override
  String get newMessage => 'Pesan baru';

  @override
  String get newConversation => 'Kirim pesan';

  @override
  String get settings => 'Pengaturan';

  @override
  String get myHashId => 'Hash ID saya';

  @override
  String get supportHash => 'Dukung Hash';

  @override
  String get supportHashSubtitle => 'Hash adalah proyek nirlaba';

  @override
  String get donate => 'Donasi';

  @override
  String get appearance => 'Tampilan';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Otomatis';

  @override
  String get themeAutoSubtitle => 'Mengikuti pengaturan sistem';

  @override
  String get themeDark => 'Gelap';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeRecommendation =>
      'Tema gelap disarankan untuk privasi lebih baik';

  @override
  String get language => 'Bahasa';

  @override
  String get languageAuto => 'Otomatis (sistem)';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get messages => 'Pesan';

  @override
  String get calls => 'Panggilan';

  @override
  String get vibration => 'Getaran';

  @override
  String get notificationContent => 'Konten notifikasi';

  @override
  String get notificationContentFull => 'Tampilkan semua';

  @override
  String get notificationContentFullDesc => 'Nama kontak dan pratinjau pesan';

  @override
  String get notificationContentName => 'Hanya nama';

  @override
  String get notificationContentNameDesc => 'Hanya menampilkan nama kontak';

  @override
  String get notificationContentDiscrete => 'Diskret';

  @override
  String get notificationContentDiscreteDesc =>
      'Hanya menampilkan \"Pesan baru\"';

  @override
  String get security => 'Keamanan';

  @override
  String get howHashProtectsYou => 'Bagaimana Hash melindungi Anda';

  @override
  String get howHashProtectsYouSubtitle => 'Pahami keamanan Anda';

  @override
  String get accountSecurity => 'Keamanan akun';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrik, Mode Vash';

  @override
  String get blockScreenshots => 'Blokir tangkapan layar';

  @override
  String get transferDevice => 'Transfer ke perangkat lain';

  @override
  String get transferDeviceSubtitle => 'Migrasikan akun Anda';

  @override
  String get pinCode => 'Kode PIN';

  @override
  String get changePin => 'Ubah kode PIN';

  @override
  String get currentPin => 'Kode PIN saat ini';

  @override
  String get newPin => 'Kode PIN baru';

  @override
  String get confirmPin => 'Konfirmasi kode PIN';

  @override
  String get pinChanged => 'Kode PIN diubah';

  @override
  String get incorrectPin => 'PIN salah';

  @override
  String get pinsDoNotMatch => 'PIN tidak cocok';

  @override
  String get autoLock => 'Kunci otomatis';

  @override
  String get autoLockDelay => 'Jeda penguncian';

  @override
  String get autoLockImmediate => 'Segera';

  @override
  String get autoLockMinute => '1 menit';

  @override
  String autoLockMinutes(int count) {
    return '$count menit';
  }

  @override
  String get vashCode => 'Kode Vash';

  @override
  String get vashModeTitle => 'Mode Vash';

  @override
  String get vashModeExplanation => 'Jaring pengaman terakhir Anda.';

  @override
  String get vashModeDescription =>
      'Anda akan memilih kode PIN kedua. Jika Anda dipaksa membuka Hash, masukkan kode ini alih-alih PIN biasa Anda.\n\nAplikasi akan terbuka secara normal, tetapi semua percakapan dan kontak Anda akan hilang.\n\nBagi siapa pun yang melihat layar Anda, Hash tampak kosong — seolah-olah Anda tidak pernah menggunakannya.';

  @override
  String get vashModeIrreversible =>
      'Tindakan ini diam-diam dan tidak dapat dibatalkan.';

  @override
  String get chooseVashCode => 'Pilih kode Vash saya';

  @override
  String get vashCodeInfo =>
      'Kode PIN kedua yang membuka aplikasi secara normal, tetapi kosong.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Jika Anda memasukkan kode ini alih-alih PIN Anda:';

  @override
  String get vashDeleteContacts => 'Kontak Anda menghilang';

  @override
  String get vashDeleteMessages => 'Percakapan Anda menghilang';

  @override
  String get vashDeleteHistory => 'Catatan Anda menghilang';

  @override
  String get vashKeepId => 'Identitas Hash Anda (#XXX-XXX-XXX) tetap sama';

  @override
  String get vashAppearNormal =>
      'Aplikasi tampak normal tetapi kosong, seperti baru. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get setupVashCode => 'Atur kode Vash';

  @override
  String get modifyVashCode => 'Ubah kode Vash';

  @override
  String get currentVashCode => 'Kode Vash saat ini';

  @override
  String get newVashCode => 'Kode Vash baru';

  @override
  String get confirmVashCode => 'Konfirmasi kode Vash';

  @override
  String get vashCodeConfigured => 'Kode Vash dikonfigurasi';

  @override
  String get vashCodeModified => 'Kode Vash diubah';

  @override
  String get vashCodeMustDiffer => 'Kode Vash harus berbeda dari PIN';

  @override
  String get incorrectVashCode => 'Kode Vash salah';

  @override
  String get vashWhatToDelete => 'Apa yang harus dihilangkan Mode Vash?';

  @override
  String get vashDeleteContactsOption => 'Kontak';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Pesan';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Catatan';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Mode Vash diaktifkan';

  @override
  String get vashCreateSubtitle =>
      'Pilih kode yang berbeda dari PIN utama Anda';

  @override
  String get vashConfirmSubtitle => 'Konfirmasi kode Vash Anda';

  @override
  String get pinCodeForEntry => 'Kode PIN untuk masuk aplikasi';

  @override
  String get vashCodeSection => 'Mode Vash';

  @override
  String get biometric => 'Biometrik';

  @override
  String get biometricUnlock => 'Buka dengan sidik jari atau Face ID';

  @override
  String get enableBiometric => 'Aktifkan biometrik';

  @override
  String get biometricWarningMessage =>
      'Dengan mengaktifkan biometrik, Anda tidak akan dapat menggunakan kode Vash untuk masuk ke aplikasi.\n\nAnda hanya dapat menggunakan kode Vash jika biometrik gagal (setelah beberapa percobaan gagal).\n\nApakah Anda yakin ingin melanjutkan?';

  @override
  String get understood => 'Saya mengerti';

  @override
  String get shareAppSubtitle => 'Bagikan Hash dengan orang terdekat Anda';

  @override
  String get share => 'Bagikan';

  @override
  String get danger => 'Bahaya';

  @override
  String get deleteAccount => 'Hapus akun saya';

  @override
  String get deleteAccountSubtitle => 'Tindakan tidak dapat dibatalkan';

  @override
  String get deleteAccountConfirmTitle => 'Hapus akun saya';

  @override
  String get deleteAccountConfirmMessage =>
      'Akun Anda akan dihapus secara permanen. Tindakan ini tidak dapat dibatalkan.\n\n• Semua obrolan Anda\n• Semua kontak Anda\n• Hash ID Anda\n\nAnda harus membuat akun baru.';

  @override
  String get deleteForever => 'Hapus permanen';

  @override
  String get cancel => 'Batal';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Mode Vash diaktifkan.';

  @override
  String deletionError(String error) {
    return 'Kesalahan penghapusan: $error';
  }

  @override
  String get yourSecurity => 'Keamanan Anda';

  @override
  String get securityInfo =>
      '• Enkripsi ujung-ke-ujung (Signal Protocol)\n• Tidak ada data di server kami setelah pengiriman\n• Kunci disimpan hanya di perangkat Anda\n• Kode PIN tidak pernah dikirim ke server';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Selamat datang';

  @override
  String get securityStatement1 => 'Pesan Anda dilindungi.';

  @override
  String get securityStatement2 => 'Enkripsi ujung-ke-ujung.';

  @override
  String get securityStatement3 => 'Tanpa jejak. Tanpa kompromi.';

  @override
  String get securityStatement4 => 'Privasi Anda adalah hak.';

  @override
  String get accessBlocked => 'Akses diblokir';

  @override
  String get tooManyAttempts => 'Terlalu banyak percobaan';

  @override
  String get pleaseWait => 'Mohon tunggu';

  @override
  String get waitDelay => 'Mohon tunggu hingga jeda berakhir';

  @override
  String attemptCount(int current, int max) {
    return 'Percobaan $current dari $max';
  }

  @override
  String retryIn(String time) {
    return 'Coba lagi dalam $time';
  }

  @override
  String get forgotPin => 'Lupa PIN? Gunakan frasa pemulihan';

  @override
  String get useRecoveryPhrase => 'Gunakan frasa pemulihan';

  @override
  String get recoveryWarningTitle => 'Peringatan';

  @override
  String get recoveryWarningMessage => 'Pemulihan akun akan:';

  @override
  String get recoveryDeleteAllMessages => 'Menghapus SEMUA pesan Anda';

  @override
  String get recoveryWaitDelay => 'Memerlukan jeda 1 jam';

  @override
  String get recoveryKeepContacts => 'Menyimpan kontak Anda';

  @override
  String get recoveryIrreversible =>
      'Tindakan ini tidak dapat dibatalkan. Pesan Anda akan hilang secara permanen.';

  @override
  String get iUnderstand => 'Saya mengerti';

  @override
  String get accountRecovery => 'Pemulihan akun';

  @override
  String get enterRecoveryPhrase =>
      'Masukkan 24 kata dari frasa pemulihan Anda, dipisahkan oleh spasi.';

  @override
  String get recoveryPhraseHint => 'kata1 kata2 kata3 ...';

  @override
  String get recover => 'Pulihkan';

  @override
  String get recoveryPhraseRequired => 'Silakan masukkan frasa pemulihan Anda';

  @override
  String get recoveryPhrase24Words => 'Frasa harus berisi tepat 24 kata';

  @override
  String get incorrectRecoveryPhrase => 'Frasa pemulihan salah';

  @override
  String get recoveryInitError => 'Kesalahan inisialisasi pemulihan';

  @override
  String get securityDelay => 'Jeda keamanan';

  @override
  String get securityDelayMessage =>
      'Demi keamanan Anda, diperlukan waktu tunggu sebelum Anda dapat membuat PIN baru.';

  @override
  String get timeRemaining => 'Waktu tersisa';

  @override
  String get messagesDeletedForProtection =>
      'Pesan Anda telah dihapus untuk perlindungan Anda.';

  @override
  String get canCloseApp => 'Anda dapat menutup aplikasi dan kembali nanti.';

  @override
  String get onboardingTitle1 => 'Selamat datang di Hash';

  @override
  String get onboardingSubtitle1 =>
      'Pesan instan yang tidak meninggalkan jejak';

  @override
  String get onboardingTitle2 => 'Enkripsi total';

  @override
  String get onboardingSubtitle2 =>
      'Pesan Anda dienkripsi ujung-ke-ujung dengan Signal Protocol';

  @override
  String get onboardingTitle3 => 'Tanpa jejak';

  @override
  String get onboardingSubtitle3 =>
      'Pesan dihapus dari server setelah pengiriman';

  @override
  String get onboardingTitle4 => 'Keamanan Anda';

  @override
  String get onboardingSubtitle4 => 'Kode PIN, Mode Vash, dan frasa pemulihan';

  @override
  String get getStarted => 'Mulai';

  @override
  String get next => 'Selanjutnya';

  @override
  String get skip => 'Lewati';

  @override
  String get alreadyHaveAccount => 'Saya sudah memiliki akun';

  @override
  String get transferMyAccount => 'Transfer akun saya';

  @override
  String get createPin => 'Buat kode PIN';

  @override
  String get createPinSubtitle =>
      'Kode ini akan melindungi akses ke aplikasi Anda';

  @override
  String get confirmYourPin => 'Konfirmasi kode PIN Anda';

  @override
  String get confirmPinSubtitle => 'Masukkan kode PIN Anda lagi';

  @override
  String get saveRecoveryPhrase => 'Frasa pemulihan';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Tulis 24 kata ini secara berurutan. Kata-kata ini akan memungkinkan Anda memulihkan akun jika Anda lupa PIN.';

  @override
  String get phraseWritten => 'Saya telah menulis frasa saya';

  @override
  String get warningRecoveryPhrase =>
      'Jika Anda kehilangan frasa ini dan lupa PIN, Anda akan kehilangan akses ke akun Anda.';

  @override
  String get accountTransferred => 'Akun ditransfer';

  @override
  String get accountTransferredMessage =>
      'Akun Anda telah ditransfer ke perangkat lain. Sesi ini tidak lagi valid.';

  @override
  String get accountTransferredInfo =>
      'Jika Anda tidak memulai transfer ini, akun Anda mungkin telah dikompromikan.';

  @override
  String get logout => 'Keluar';

  @override
  String get transferAccount => 'Transfer akun';

  @override
  String get transferAccountInfo =>
      'Transfer akun Hash Anda ke perangkat baru. Sesi Anda saat ini akan dibatalkan.';

  @override
  String get generateTransferCode => 'Buat kode transfer';

  @override
  String get transferCode => 'Kode transfer';

  @override
  String transferCodeExpires(int minutes) {
    return 'Kode ini kedaluwarsa dalam $minutes menit';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Masukkan kode ini di perangkat baru Anda untuk mentransfer akun.';

  @override
  String get generateNewCode => 'Buat kode baru';

  @override
  String get scanQrCode => 'Pindai kode QR';

  @override
  String get scanQrCodeSubtitle =>
      'Pindai kode QR kontak untuk menambahkan mereka';

  @override
  String get qrCodeDetected => 'Kode QR terdeteksi';

  @override
  String get invalidQrCode => 'Kode QR tidak valid';

  @override
  String get cameraPermissionRequired => 'Izin kamera diperlukan';

  @override
  String get myQrCode => 'Kode QR saya';

  @override
  String get myQrCodeSubtitle =>
      'Bagikan kode QR ini agar kontak Anda dapat menambahkan Anda';

  @override
  String get shareQrCode => 'Bagikan';

  @override
  String get addContactTitle => 'Tambah kontak';

  @override
  String get addContactByHashId => 'Masukkan Hash ID kontak Anda';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Cari';

  @override
  String get contactNotFound => 'Kontak tidak ditemukan';

  @override
  String get contactAlreadyAdded => 'Kontak ini sudah ada di daftar Anda';

  @override
  String get contactAdded => 'Kontak ditambahkan';

  @override
  String get myProfile => 'Profil saya';

  @override
  String get myProfileSubtitle =>
      'Bagikan informasi ini agar orang lain dapat menambahkan Anda';

  @override
  String get temporaryCode => 'Kode sementara';

  @override
  String temporaryCodeExpires(String time) {
    return 'Kedaluwarsa dalam $time';
  }

  @override
  String get codeExpired => 'Kode kedaluwarsa';

  @override
  String get generateNewCodeButton => 'Kode baru';

  @override
  String get copyHashId => 'Salin ID';

  @override
  String get copyCode => 'Salin kode';

  @override
  String get copiedToClipboard => 'Disalin';

  @override
  String get showMyQrCode => 'Tampilkan kode QR saya';

  @override
  String get orDivider => 'atau';

  @override
  String get openScanner => 'Buka pemindai';

  @override
  String get addManually => 'Tambah manual';

  @override
  String get contactHashIdLabel => 'Hash ID kontak';

  @override
  String get temporaryCodeLabel => 'Kode sementara';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Minta kontak Anda membuat kode dari profil mereka';

  @override
  String get verifyAndAdd => 'Verifikasi dan tambah';

  @override
  String get fillAllFields => 'Silakan isi semua kolom';

  @override
  String get invalidHashIdFormat => 'Format ID tidak valid (cth.: 123-456-ABC)';

  @override
  String get userNotFound => 'Pengguna tidak ditemukan';

  @override
  String get cannotAddYourself => 'Anda tidak dapat menambahkan diri sendiri';

  @override
  String get invalidOrExpiredCode =>
      'Kode sementara tidak valid atau kedaluwarsa';

  @override
  String get contactFound => 'Kontak ditemukan!';

  @override
  String get howToCallContact => 'Apa nama yang ingin Anda berikan?';

  @override
  String get contactNameHint => 'Nama kontak';

  @override
  String get addContactButton => 'Tambah';

  @override
  String get contactDetails => 'Detail kontak';

  @override
  String get contactName => 'Nama kontak';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Ditambahkan pada $date';
  }

  @override
  String get deleteContact => 'Hapus kontak';

  @override
  String deleteContactConfirm(Object name) {
    return 'Hapus kontak ini?';
  }

  @override
  String get deleteContactMessage => 'Ini juga akan menghapus seluruh obrolan.';

  @override
  String get delete => 'Hapus';

  @override
  String get typeMessage => 'Ketik pesan...';

  @override
  String get messageSent => 'Terkirim';

  @override
  String get messageDelivered => 'Tersampaikan';

  @override
  String get messageRead => 'Dibaca';

  @override
  String get messageFailed => 'Gagal mengirim';

  @override
  String get now => 'Sekarang';

  @override
  String minutesAgo(int count) {
    return '${count}mnt';
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
  String get yesterday => 'Kemarin';

  @override
  String dateAtTime(String date, String time) {
    return '$date pukul $time';
  }

  @override
  String get shareMessage =>
      'Bergabunglah dengan saya di Hash! 🔒\n\nIni adalah pesan instan yang benar-benar privat: enkripsi total, tanpa jejak di server, dan mode panik jika diperlukan.\n\nUnduh aplikasinya di sini 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Kesalahan';

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
  String get confirm => 'Konfirmasi';

  @override
  String get loading => 'Memuat...';

  @override
  String get retry => 'Coba lagi';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Permintaan tertunda';

  @override
  String get noPendingRequests => 'Tidak ada permintaan tertunda';

  @override
  String get pendingRequestsSubtitle =>
      'Orang-orang ini ingin menambahkan Anda';

  @override
  String requestFromUser(String hashId) {
    return 'Permintaan dari $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Kedaluwarsa dalam $days hari';
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
  String get requestSent => 'Permintaan terkirim!';

  @override
  String get requestSentSubtitle =>
      'Permintaan Anda telah dikirim. Pengguna harus menerimanya sebelum Anda dapat mengobrol.';

  @override
  String get requestAlreadyPending => 'Permintaan sudah tertunda';

  @override
  String get requestAlreadySentByOther =>
      'Orang ini sudah mengirimkan permintaan kepada Anda';

  @override
  String get addByHashId => 'Tambah dengan Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Masukkan Hash ID dan kode sementara kontak';

  @override
  String get enterTemporaryCode => 'Masukkan kode 6 digit';

  @override
  String get sendRequest => 'Kirim permintaan';

  @override
  String get acceptContactTitle => 'Terima kontak';

  @override
  String get acceptContactSubtitle => 'Anda dapat memberi mereka nama khusus';

  @override
  String get leaveEmptyForHashId => 'Biarkan kosong untuk menggunakan Hash ID';

  @override
  String get firstName => 'Nama depan';

  @override
  String get lastName => 'Nama belakang';

  @override
  String get notes => 'Catatan';

  @override
  String get notesHint => 'Catatan pribadi tentang kontak ini';

  @override
  String get photoOptional => 'Foto (opsional)';

  @override
  String get contactNameOptional => 'Nama (opsional)';

  @override
  String get notesOptional => 'Catatan (opsional)';

  @override
  String get storedLocally => 'Disimpan hanya di perangkat Anda';

  @override
  String get encryptedMessageLabel => 'Pesan terenkripsi';

  @override
  String get identityMessageHint =>
      'Siapa Anda? Bagaimana Anda saling mengenal?';

  @override
  String get messageWillBeSentEncrypted =>
      'Pesan ini akan dienkripsi dan dikirim ke penerima';

  @override
  String get sendRequestButton => 'Kirim permintaan';

  @override
  String get requestExpiresIn24h =>
      'Permintaan kedaluwarsa dalam 24 jam jika tidak diterima';

  @override
  String get theyAlreadySentYouRequest =>
      'Orang ini sudah mengirimkan permintaan kepada Anda';

  @override
  String get requests => 'Permintaan';

  @override
  String get receivedRequests => 'Diterima';

  @override
  String get sentRequests => 'Terkirim';

  @override
  String get noSentRequests => 'Tidak ada permintaan terkirim';

  @override
  String get cancelRequest => 'Batal';

  @override
  String get deleteRequest => 'Hapus permintaan';

  @override
  String get requestCancelled => 'Permintaan dibatalkan';

  @override
  String sentTo(String hashId) {
    return 'Dikirim ke $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Kedaluwarsa dalam $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Diterima $time lalu';
  }

  @override
  String get messageFromRequester => 'Pesan dari peminta';

  @override
  String get copy => 'Salin';

  @override
  String get messageInfo => 'Info pesan';

  @override
  String get messageDirection => 'Arah';

  @override
  String get messageSentByYou => 'Dikirim oleh Anda';

  @override
  String get messageReceived => 'Diterima';

  @override
  String get messageSentAt => 'Dikirim pada';

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
  String get messageSize => 'Ukuran';

  @override
  String get messageExpiresAt => 'Kedaluwarsa pada';

  @override
  String get messageEncrypted => 'Terenkripsi ujung-ke-ujung';

  @override
  String get messageStatusSending => 'Mengirim...';

  @override
  String get messageStatusSent => 'Terkirim';

  @override
  String get messageStatusDelivered => 'Tersampaikan';

  @override
  String get messageStatusRead => 'Dibaca';

  @override
  String get messageStatusFailed => 'Gagal';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Menunggu pengiriman';

  @override
  String get deletedFromServer => 'Dihapus';

  @override
  String get messageTypeText => 'Teks';

  @override
  String get messageTypeImage => 'Gambar';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Suara';

  @override
  String get messageTypeFile => 'Berkas';

  @override
  String get indefinitely => 'Tanpa batas';

  @override
  String get hoursShort => 'j';

  @override
  String get minutesShort => 'mnt';

  @override
  String get hours => 'jam';

  @override
  String get minutes => 'menit';

  @override
  String get seconds => 'detik';

  @override
  String get ephemeralMessages => 'Pesan sementara';

  @override
  String get ephemeralMessagesDescription =>
      'Pesan dihapus otomatis setelah waktu ini';

  @override
  String get ephemeralImmediate => 'Segera (setelah dibaca)';

  @override
  String get ephemeralImmediateDesc => 'Dihapus segera setelah dibaca';

  @override
  String get ephemeralMyPreference => 'Preferensi saya';

  @override
  String get ephemeralMyPreferenceDesc => 'Gunakan pengaturan global';

  @override
  String get ephemeralDefaultSetting => 'Durasi pesan';

  @override
  String get ephemeralChooseDefault => 'Disarankan';

  @override
  String get ephemeral30Seconds => '30 detik';

  @override
  String get ephemeral30SecondsDesc => 'Dihapus 30d setelah dibaca';

  @override
  String get ephemeral5Minutes => '5 menit';

  @override
  String get ephemeral5MinutesDesc => 'Dihapus 5mnt setelah dibaca';

  @override
  String get ephemeral1Hour => '1 jam';

  @override
  String get ephemeral1HourDesc => 'Dihapus 1j setelah dibaca';

  @override
  String get ephemeral3Hours => '3 jam';

  @override
  String get ephemeral6Hours => '6 jam';

  @override
  String get ephemeral6HoursDesc => 'Dihapus 6j setelah dibaca';

  @override
  String get ephemeral12Hours => '12 jam';

  @override
  String get ephemeral24Hours => '24 jam';

  @override
  String get ephemeral24HoursDesc => 'Dihapus 24j setelah dibaca';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Durasi khusus';

  @override
  String get howItWorks => 'Cara kerja';

  @override
  String get ephemeralExplanation1 =>
      'Pesan dihapus dari server segera setelah diterima.';

  @override
  String get ephemeralExplanation2 =>
      'Pengaturan ini menentukan kapan pesan menghilang dari ponsel ANDA setelah dibaca.';

  @override
  String get ephemeralExplanation3 =>
      'Kontak Anda memiliki pengaturan sendiri untuk ponsel mereka.';

  @override
  String get mute1Hour => '1 jam';

  @override
  String get mute8Hours => '8 jam';

  @override
  String get mute1Day => '1 hari';

  @override
  String get mute1Week => '1 minggu';

  @override
  String get muteAlways => 'Selalu';

  @override
  String get muteExplanation =>
      'Anda tidak akan menerima notifikasi untuk kontak ini';

  @override
  String get showCallsInRecents => 'Tampilkan di panggilan terbaru';

  @override
  String get showCallsInRecentsSubtitle =>
      'Panggilan Hash muncul di riwayat telepon';

  @override
  String get feedback => 'Umpan balik';

  @override
  String get muteNotifications => 'Bisukan notifikasi';

  @override
  String get muteDescription =>
      'Anda tidak akan menerima notifikasi untuk kontak ini';

  @override
  String mutedUntil(String time) {
    return 'Dibisukan hingga $time';
  }

  @override
  String get notMuted => 'Notifikasi aktif';

  @override
  String get unmute => 'Bunyikan';

  @override
  String get notificationSound => 'Suara notifikasi';

  @override
  String get defaultSound => 'Default';

  @override
  String get chatSettings => 'Pengaturan obrolan';

  @override
  String get bubbleColor => 'Warna gelembung';

  @override
  String get backgroundColor => 'Warna latar belakang';

  @override
  String get backgroundImage => 'Gambar latar belakang';

  @override
  String get chatBackground => 'Latar belakang obrolan';

  @override
  String get customColor => 'Khusus';

  @override
  String get defaultColor => 'Default';

  @override
  String get imageSelected => 'Gambar dipilih';

  @override
  String get noImage => 'Tidak ada gambar';

  @override
  String get color => 'Warna';

  @override
  String get image => 'Gambar';

  @override
  String get tapToSelectImage => 'Ketuk untuk memilih gambar';

  @override
  String get changeImage => 'Ubah gambar';

  @override
  String get previewMessageReceived => 'Halo!';

  @override
  String get previewMessageSent => 'Hai!';

  @override
  String get messageAction => 'Pesan';

  @override
  String get callAction => 'Panggil';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Catatan pribadi';

  @override
  String get addNotes => 'Tambah catatan...';

  @override
  String get noNotes => 'Tidak ada catatan';

  @override
  String get messageNotifications => 'Notifikasi pesan';

  @override
  String get callNotifications => 'Notifikasi panggilan';

  @override
  String get useGradient => 'Gunakan gradien';

  @override
  String get gradientStart => 'Warna awal';

  @override
  String get gradientEnd => 'Warna akhir';

  @override
  String get preview => 'Pratinjau';

  @override
  String get reset => 'Reset';

  @override
  String get securityNumber => 'Nomor keamanan';

  @override
  String securityNumberDescription(String name) {
    return 'Verifikasi bahwa nomor keamanan cocok dengan perangkat $name';
  }

  @override
  String get verifyEncryption => 'Verifikasi enkripsi ujung-ke-ujung';

  @override
  String get tapToCopy => 'Ketuk untuk menyalin';

  @override
  String get howToVerify => 'Cara memverifikasi';

  @override
  String get verifyStep1 =>
      'Temui kontak Anda secara langsung atau hubungi mereka';

  @override
  String get verifyStep2 => 'Bandingkan nomor keamanan atau pindai kode QR';

  @override
  String get verifyStep3 => 'Jika cocok, obrolan Anda aman';

  @override
  String get scanToVerify => 'Pindai untuk memverifikasi';

  @override
  String get reportSpam => 'Laporkan spam';

  @override
  String get reportSpamSubtitle => 'Laporkan kontak ini sebagai spam';

  @override
  String get reportSpamDescription =>
      'Ini akan melaporkan kontak ini secara anonim. Identitas Anda tidak akan dibagikan. Anda yakin?';

  @override
  String get report => 'Laporkan';

  @override
  String get spamReported => 'Spam dilaporkan';

  @override
  String get reportError => 'Gagal mengirim laporan. Silakan coba lagi.';

  @override
  String get reportRateLimited =>
      'Anda telah mencapai jumlah maksimum laporan untuk hari ini.';

  @override
  String get blockContact => 'Blokir kontak';

  @override
  String get blockContactDescription =>
      'Kontak ini tidak akan dapat mengirim pesan atau menelepon Anda lagi. Mereka tidak akan diberi tahu.';

  @override
  String get unblockContact => 'Buka blokir kontak';

  @override
  String get unblockContactDescription =>
      'Kontak ini akan dapat mengirim pesan dan menelepon Anda lagi.';

  @override
  String get contactBlocked => 'Kontak diblokir';

  @override
  String get contactUnblocked => 'Kontak dibuka blokirnya';

  @override
  String get contactIsBlocked => 'Kontak ini diblokir';

  @override
  String get unblock => 'Buka blokir';

  @override
  String get deleteContactSubtitle => 'Hapus kontak dan obrolan ini';

  @override
  String get confirmWithPin => 'Konfirmasi dengan PIN';

  @override
  String get enterPinToConfirm =>
      'Masukkan PIN Anda untuk mengonfirmasi tindakan ini';

  @override
  String get profilePhoto => 'Foto profil';

  @override
  String get takePhoto => 'Ambil foto';

  @override
  String get chooseFromGallery => 'Pilih dari galeri';

  @override
  String get removePhoto => 'Hapus foto';

  @override
  String get viewContactHashId => 'Lihat identifikasi kontak';

  @override
  String get hashIdPartiallyMasked =>
      'Disamarkan sebagian untuk keamanan Anda dan privasi kontak Anda';

  @override
  String get addFirstContact => 'Tambahkan kontak pertama Anda';

  @override
  String get addFirstContactSubtitle =>
      'Bagikan kode QR Anda atau pindai milik teman';

  @override
  String get directory => 'Direktori';

  @override
  String get noContacts => 'Tidak ada kontak';

  @override
  String get noContactsSubtitle => 'Tambah kontak untuk memulai';

  @override
  String get sendMessageAction => 'Kirim pesan';

  @override
  String get audioCall => 'Panggilan suara';

  @override
  String get videoCall => 'Panggilan video';

  @override
  String get viewProfile => 'Lihat profil';

  @override
  String get deleteContactDirectory => 'Hapus kontak';

  @override
  String get scanShort => 'Pindai';

  @override
  String get addShort => 'Tambah';

  @override
  String deleteContactConfirmName(String name) {
    return 'Anda yakin ingin menghapus $name?';
  }

  @override
  String get noNotesTitle => 'Tidak ada catatan';

  @override
  String get noNotesSubtitle => 'Buat catatan pertama Anda';

  @override
  String get newNote => 'Catatan baru';

  @override
  String get editNote => 'Edit catatan';

  @override
  String get deleteNote => 'Hapus catatan';

  @override
  String get deleteNoteConfirm => 'Anda yakin ingin menghapus catatan ini?';

  @override
  String get noteTitle => 'Judul';

  @override
  String get noteContent => 'Konten';

  @override
  String get addItem => 'Tambah item';

  @override
  String get pinNote => 'Sematkan';

  @override
  String get unpinNote => 'Lepas sematan';

  @override
  String get noteColor => 'Warna';

  @override
  String get notePassword => 'Kata sandi';

  @override
  String get setPassword => 'Atur kata sandi';

  @override
  String get changePassword => 'Ubah kata sandi';

  @override
  String get removePassword => 'Hapus kata sandi';

  @override
  String get enterPassword => 'Masukkan kata sandi';

  @override
  String get confirmPassword => 'Konfirmasi kata sandi';

  @override
  String get passwordPin => 'Kode PIN';

  @override
  String get passwordText => 'Kata sandi teks';

  @override
  String get protectedNote => 'Catatan dilindungi';

  @override
  String get incorrectPassword => 'Kata sandi salah';

  @override
  String get passwordSet => 'Kata sandi diatur';

  @override
  String get passwordRemoved => 'Kata sandi dihapus';

  @override
  String get notesBiometric => 'Face ID untuk catatan';

  @override
  String get notesBiometricSubtitle =>
      'Memerlukan autentikasi biometrik untuk membuka catatan dilindungi';

  @override
  String get textNote => 'Catatan teks';

  @override
  String get checklistNote => 'Daftar centang';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tugas';
  }

  @override
  String get autoSaved => 'Tersimpan';

  @override
  String get searchNotes => 'Cari catatan';

  @override
  String get legalConsent => 'Persetujuan hukum';

  @override
  String get confirmAge13 =>
      'Saya mengonfirmasi bahwa saya berusia minimal 13 tahun';

  @override
  String get acceptLegalStart => 'Saya menerima ';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String get andThe => ' dan ';

  @override
  String get continueButton => 'Lanjutkan';

  @override
  String get mustAcceptTerms =>
      'Anda harus menerima kedua ketentuan untuk melanjutkan';

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
  String get support => 'Dukungan';

  @override
  String get contactSupport => 'Hubungi dukungan';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Laporkan penyalahgunaan';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Hukum';

  @override
  String get legalEntity => 'Badan hukum';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Sematkan';

  @override
  String get unpinConversation => 'Lepas sematan';

  @override
  String get hideConversation => 'Hapus dari feed';

  @override
  String get deleteConversation => 'Hapus percakapan';

  @override
  String get deleteConversationConfirm =>
      'Masukkan PIN Anda untuk mengonfirmasi penghapusan semua pesan';

  @override
  String get noConversations => 'Belum ada percakapan';

  @override
  String get startConversation => 'Mulai';

  @override
  String get microphonePermissionRequired => 'Izin mikrofon diperlukan';

  @override
  String get microphonePermissionExplanation =>
      'Hash memerlukan mikrofon untuk melakukan panggilan.';

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
  String get openSettings => 'Buka Pengaturan';

  @override
  String get callConnecting => 'Menghubungkan...';

  @override
  String get callRinging => 'Berdering...';

  @override
  String get callReconnecting => 'Menghubungkan ulang...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Menghubungkan ulang (${seconds}d)';
  }

  @override
  String get callPaused => 'Dijeda';

  @override
  String get callPausedSubtitle => 'Panggilan masih berlangsung';

  @override
  String get callRemoteMicMuted => 'Mikrofon kontak dibisukan';

  @override
  String get callMiniControlsMute => 'Bisukan';

  @override
  String get callMiniControlsUnmute => 'Bunyikan';

  @override
  String get callMiniControlsHangUp => 'Akhiri';

  @override
  String get callMiniControlsReturn => 'Kembali ke panggilan';

  @override
  String get callNetworkPoor => 'Koneksi tidak stabil';

  @override
  String get callNetworkLost => 'Koneksi terputus';

  @override
  String get callEndedTitle => 'Panggilan berakhir';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Data perangkat';

  @override
  String get deviceDataSubtitle => 'Penyimpanan lokal dan server';

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
  String get localStorage => 'Penyimpanan lokal';

  @override
  String get onThisDevice => 'di perangkat ini';

  @override
  String get encryptedDatabases => 'Basis data terenkripsi';

  @override
  String get files => 'Berkas';

  @override
  String get secureKeychain => 'Rantai kunci aman';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Nama, avatar, kunci Signal';

  @override
  String get messagesDetail => 'Percakapan terenkripsi';

  @override
  String get notesDetail => 'Catatan pribadi';

  @override
  String get signalSessions => 'Sesi Signal';

  @override
  String get signalSessionsDetail => 'Sesi enkripsi';

  @override
  String get pendingContacts => 'Kontak tertunda';

  @override
  String get pendingContactsDetail => 'Permintaan tertunda';

  @override
  String get callHistory => 'Panggilan';

  @override
  String get callHistoryDetail => 'Riwayat panggilan';

  @override
  String get preferences => 'Preferensi';

  @override
  String get preferencesDetail => 'Preferensi media dan panggilan';

  @override
  String get avatars => 'Avatar';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count berkas',
      one: '1 berkas',
      zero: 'tidak ada berkas',
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
  String get identity => 'Identitas (Hash ID)';

  @override
  String get signalKeys => 'Kunci Signal Protocol';

  @override
  String get authTokens => 'Token autentikasi';

  @override
  String get contactNamesCache => 'Cache nama kontak';

  @override
  String get remoteConfig => 'Konfigurasi jarak jauh';

  @override
  String get notificationPrefs => 'Preferensi notifikasi';

  @override
  String get serverData => 'Data server';

  @override
  String get serverDataInfo =>
      'Hash menyimpan data minimal di server, semuanya terenkripsi atau sementara.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, kunci publik, token kotak surat';

  @override
  String get serverPrekeys => 'Pre-keys';

  @override
  String get serverPrekeysDetail => 'Kunci Signal sekali pakai (dikonsumsi)';

  @override
  String get serverMessages => 'Pesan dalam transit';

  @override
  String get serverMessagesDetail => 'Dihapus setelah pengiriman (maks 24j)';

  @override
  String get serverMedia => 'Media dalam transit';

  @override
  String get serverMediaDetail => 'Dihapus setelah diunduh';

  @override
  String get serverContactRequests => 'Permintaan kontak';

  @override
  String get serverContactRequestsDetail => 'Kedaluwarsa setelah 24j';

  @override
  String get serverRateLimits => 'Batas kecepatan';

  @override
  String get serverRateLimitsDetail => 'Data anti-penyalahgunaan sementara';

  @override
  String get privacyReassurance =>
      'Hash tidak dapat membaca pesan Anda. Semua data dienkripsi ujung-ke-ujung. Data server dihapus otomatis.';

  @override
  String get pinTooSimple =>
      'PIN ini terlalu sederhana. Pilih kode yang lebih aman.';

  @override
  String get genericError => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Tidak dapat membuat akun: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frasa disalin ke papan klip';

  @override
  String get copyPhrase => 'Salin frasa';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Tulis frasa ini di tempat yang aman. Jika Anda kehilangan PIN tanpa frasa ini, Anda akan kehilangan akses ke data secara permanen.';

  @override
  String get noMessages => 'Tidak ada pesan';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Hapus semua pesan dengan $name?';
  }

  @override
  String get confirmation => 'Konfirmasi';

  @override
  String get untitled => 'Tanpa judul';

  @override
  String get noSessions => 'Tidak ada sesi';

  @override
  String get unknownContact => 'Kontak tidak dikenal';

  @override
  String get unnamed => 'Tanpa nama';

  @override
  String get noPendingRequestsAlt => 'Tidak ada permintaan tertunda';

  @override
  String get deleteAllCallHistory => 'Hapus semua riwayat panggilan?';

  @override
  String get noCalls => 'Tidak ada panggilan';

  @override
  String get noPreferences => 'Tidak ada preferensi';

  @override
  String get resetAllMediaPrefs => 'Reset semua preferensi media?';

  @override
  String get deleteThisAvatar => 'Hapus avatar ini?';

  @override
  String get deleteAllAvatars => 'Hapus semua avatar?';

  @override
  String get noAvatars => 'Tidak ada avatar';

  @override
  String get deleteThisFile => 'Hapus berkas ini?';

  @override
  String get deleteAllMediaFiles => 'Hapus semua media?';

  @override
  String get noMediaFiles => 'Tidak ada media';

  @override
  String get outgoing => 'Keluar';

  @override
  String get incoming => 'Masuk';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Tampilan sementara: ${seconds}d';
  }

  @override
  String get normalView => 'Tampilan normal';

  @override
  String get callReasonCompleted => 'Selesai';

  @override
  String get callReasonMissed => 'Tidak terjawab';

  @override
  String get callReasonDeclined => 'Ditolak';

  @override
  String get callReasonFailed => 'Gagal';

  @override
  String get justNow => 'Baru saja';

  @override
  String timeAgoMinutes(int count) {
    return '$count mnt lalu';
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
  String get messageTypeContact => 'Kontak';

  @override
  String get messageTypeLocation => 'Lokasi';

  @override
  String get statusQueued => 'Dalam antrean';

  @override
  String get blockedBadge => 'Diblokir';

  @override
  String get protectedBadge => 'Dilindungi';

  @override
  String messageCount(int count) {
    return '$count pesan';
  }

  @override
  String get deleteQuestion => 'Hapus?';

  @override
  String get transferMyAccountTitle => 'Transfer akun saya';

  @override
  String get loadingError => 'Kesalahan pemuatan';

  @override
  String get transferToNewDevice => 'Transfer ke perangkat baru';

  @override
  String get transferInstructions =>
      'Di perangkat baru Anda, pilih \"Pulihkan akun saya\" dan masukkan informasi ini:';

  @override
  String get yourHashIdLabel => 'Hash ID Anda';

  @override
  String get enterYourPinCode => 'Masukkan kode PIN Anda';

  @override
  String get pinOwnerConfirmation =>
      'Untuk mengonfirmasi bahwa Anda pemilik akun ini';

  @override
  String get scanThisQrCode => 'Pindai kode QR ini';

  @override
  String get withYourNewDevice => 'Dengan perangkat baru Anda';

  @override
  String get orEnterTheCode => 'atau masukkan kode';

  @override
  String get transferCodeLabel => 'Kode transfer';

  @override
  String get proximityVerification => 'Verifikasi kedekatan';

  @override
  String get bringDevicesCloser => 'Dekatkan kedua perangkat';

  @override
  String get confirmTransferQuestion => 'Konfirmasi transfer?';

  @override
  String get accountWillBeTransferred =>
      'Akun Anda akan ditransfer ke perangkat baru.\n\nPerangkat ini akan terputus secara permanen.';

  @override
  String get transferComplete => 'Transfer selesai';

  @override
  String get transferSuccessMessage =>
      'Akun Anda telah berhasil ditransfer.\n\nAplikasi ini akan ditutup sekarang.';

  @override
  String get manualVerification => 'Verifikasi manual';

  @override
  String get codeDisplayedOnBothDevices =>
      'Kode ditampilkan di kedua perangkat:';

  @override
  String get doesCodeMatchNewDevice =>
      'Apakah kode ini cocok dengan yang ada di perangkat baru?';

  @override
  String get verifiedStatus => 'Terverifikasi';

  @override
  String get inProgressStatus => 'Sedang berlangsung...';

  @override
  String get notAvailableStatus => 'Tidak tersedia';

  @override
  String get codeExpiredRestart =>
      'Kode telah kedaluwarsa. Silakan mulai ulang.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kode tidak cocok. Transfer dibatalkan.';

  @override
  String transferToDevice(String device) {
    return 'Ke: $device';
  }

  @override
  String get copiedExclamation => 'Disalin!';

  @override
  String expiresInTime(String time) {
    return 'Kedaluwarsa dalam $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrik tidak tersedia di perangkat ini';

  @override
  String get biometricAuthError => 'Kesalahan autentikasi biometrik';

  @override
  String get authenticateForBiometric =>
      'Silakan autentikasi untuk mengaktifkan biometrik';

  @override
  String get biometricAuthFailed => 'Autentikasi biometrik gagal';

  @override
  String get forceUpdateTitle => 'Pembaruan diperlukan';

  @override
  String get forceUpdateMessage =>
      'Versi baru Hash tersedia. Silakan perbarui untuk melanjutkan.';

  @override
  String get updateButton => 'Perbarui';

  @override
  String get maintenanceInProgress => 'Pemeliharaan sedang berlangsung';

  @override
  String get tryAgainLater => 'Silakan coba lagi nanti';

  @override
  String get information => 'Informasi';

  @override
  String get later => 'Nanti';

  @override
  String get doYouLikeHash => 'Apakah Anda suka Hash?';

  @override
  String get yourFeedbackHelps =>
      'Umpan balik Anda membantu kami meningkatkan aplikasi';

  @override
  String get ratingTerrible => 'Sangat buruk';

  @override
  String get ratingBad => 'Buruk';

  @override
  String get ratingOk => 'Cukup';

  @override
  String get ratingGood => 'Bagus';

  @override
  String get ratingExcellent => 'Luar biasa!';

  @override
  String get donationMessage =>
      'Hash adalah proyek nirlaba. Dukungan Anda membantu kami terus membangun messenger yang benar-benar pribadi.';

  @override
  String get recentConnections => 'Koneksi terbaru';

  @override
  String get loginInfoText =>
      'Setiap pembukaan PIN dicatat secara lokal. Hanya 24 jam terakhir yang disimpan.';

  @override
  String get connectionCount => 'Koneksi';

  @override
  String get periodLabel => 'Periode';

  @override
  String get historyLabel => 'Riwayat';

  @override
  String get noLoginRecorded => 'Tidak ada login tercatat';

  @override
  String get nextUnlocksAppearHere =>
      'Pembukaan kunci berikutnya akan muncul di sini.';

  @override
  String get dataLocalOnly =>
      'Data ini hanya disimpan di perangkat Anda dan tidak pernah dikirim.';

  @override
  String get currentSession => 'Saat ini';

  @override
  String get todayLabel => 'Hari ini';

  @override
  String get yesterdayLabel => 'Kemarin';

  @override
  String get justNowLabel => 'Baru saja';

  @override
  String minutesAgoLabel(int count) {
    return '$count mnt lalu';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}j lalu';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}j ${minutes}mnt lalu';
  }

  @override
  String get noMaintenancePlanned => 'Tidak ada pemeliharaan yang direncanakan';

  @override
  String get everythingWorkingNormally => 'Semuanya berfungsi normal';

  @override
  String get maintenanceTitle => 'Pemeliharaan';

  @override
  String get maintenanceActiveLabel => 'BERLANGSUNG';

  @override
  String get maintenancePlannedLabel => 'DIRENCANAKAN';

  @override
  String get locking => 'Mengunci...';

  @override
  String get newMessageNotification => 'Pesan baru';

  @override
  String get secExplainTitle => 'Bagaimana Hash melindungi Anda';

  @override
  String get secExplainIntro =>
      'Hash dirancang agar tidak ada yang bisa membaca pesan Anda.';

  @override
  String get secExplainIntroSub =>
      'Termasuk kami.\nBerikut cara kerjanya, dijelaskan secara sederhana.';

  @override
  String get secJourneyLabel => 'PERJALANAN';

  @override
  String get secJourneyTitle => 'Perjalanan pesan Anda';

  @override
  String get secJourneySubtitle =>
      'Dari jari Anda ke layar kontak Anda, setiap langkah dilindungi. Ikuti jalurnya.';

  @override
  String get secStep1Title => 'Anda menulis pesan';

  @override
  String get secStep1Desc =>
      'Anda mengetik \"Hai!\" di aplikasi. Pada titik ini, pesan hanya ada di memori ponsel Anda. Tidak ada yang dikirim.';

  @override
  String get secStep2Title => 'Enkripsi dengan Signal Protocol';

  @override
  String get secStep2Desc =>
      'Segera setelah Anda menekan \"Kirim\", pesan Anda diubah menjadi rangkaian karakter yang tidak dapat dipahami. Seolah-olah pesan Anda dikunci dalam brankas yang hanya kontak Anda yang memiliki kuncinya.';

  @override
  String get secStep3Title => 'Sealed Sender: amplop tak terlihat';

  @override
  String get secStep3Desc =>
      'Bayangkan mengirim surat melalui pos, tetapi tanpa alamat pengirim di amplop. Itulah yang dilakukan Hash. Pesan dijatuhkan ke kotak surat anonim. Server tidak tahu siapa yang mengirimnya.';

  @override
  String get secStep4Title => 'Server tidak melihat apa-apa';

  @override
  String get secStep4Desc =>
      'Server bertindak sebagai tukang pos yang buta. Ia hanya tahu \"seseorang menjatuhkan sesuatu di kotak surat #A7X9\". Ia tidak tahu siapa yang mengirimnya, apa itu, atau untuk siapa.';

  @override
  String get secStep4Highlight =>
      'Tidak ada metadata yang disimpan: tidak ada alamat IP, tidak ada cap waktu, tidak ada hubungan antara pengirim dan penerima.';

  @override
  String get secStep5Title => 'Kontak Anda menerima pesan';

  @override
  String get secStep5Desc =>
      'Ponsel kontak Anda mengambil konten dari kotak surat anonim mereka dan mendekripsi pesan dengan kunci privat mereka, yang tidak pernah meninggalkan perangkat mereka. \"Hai!\" muncul di layar mereka.';

  @override
  String get secStep6Title => 'Pesan menghilang dari server';

  @override
  String get secStep6Desc =>
      'Segera setelah kontak Anda mengonfirmasi penerimaan, server menghapus pesan secara permanen. Tidak ada tempat sampah, tidak ada arsip, tidak ada cadangan. Bahkan pesan yang belum dibaca otomatis dihancurkan setelah 24 jam.';

  @override
  String get secStep7Title => 'Kedaluwarsa lokal';

  @override
  String get secStep7Desc =>
      'Di ponsel kontak Anda, pesan menghancurkan diri sesuai durasi yang Anda pilih: segera setelah dibaca, 5 menit, 1 jam... Anda yang memutuskan.';

  @override
  String get secJourneyConclusion =>
      'Hasilnya: nol jejak di server, nol jejak di perangkat. Pesan hanya ada cukup lama untuk dibaca, lalu menghilang.';

  @override
  String get secArchLabel => 'ARSITEKTUR';

  @override
  String get secArchTitle => '5 lapisan perlindungan';

  @override
  String get secArchSubtitle =>
      'Hash tidak bergantung pada satu teknologi. Setiap lapisan memperkuat yang lain. Bahkan jika satu lapisan dikompromikan, data Anda tetap aman.';

  @override
  String get secLayer1Title => 'Enkripsi ujung-ke-ujung';

  @override
  String get secLayer1Desc =>
      'Setiap pesan dienkripsi dengan kunci unik. Sederhananya: bahkan jika seseorang mendekripsi satu pesan, mereka tidak akan bisa mendekripsi yang berikutnya. Setiap pesan memiliki kuncinya sendiri.';

  @override
  String get secLayer1Detail =>
      'Untuk berkas (foto, video, dokumen), Hash menggunakan enkripsi AES-256-GCM tambahan. Berkas dienkripsi sebelum meninggalkan ponsel Anda.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimitas jaringan)';

  @override
  String get secLayer2Desc =>
      'Pesan instan biasa mengirim pesan Anda dengan identitas Anda terlampir. Seperti menulis nama Anda di amplop. Hash menggunakan kotak surat anonim: server mengirimkan pesan tanpa mengetahui siapa pengirimnya.';

  @override
  String get secLayer2Detail =>
      'Hasilnya: bahkan dalam kasus pelanggaran data server, mustahil untuk merekonstruksi siapa berbicara dengan siapa.';

  @override
  String get secLayer3Title => 'Penghapusan otomatis';

  @override
  String get secLayer3Desc =>
      'Pesan dihapus dari server segera setelah penerimaan dikonfirmasi. Bahkan jika pesan tidak pernah diambil, ia otomatis dihancurkan setelah 24 jam.';

  @override
  String get secLayer3Detail =>
      'Di ponsel Anda, pesan menghancurkan diri sesuai durasi yang Anda pilih: segera, 5 mnt, 15 mnt, 30 mnt, 1j, 3j, 6j, atau 12j.';

  @override
  String get secLayer4Title => 'Perlindungan akses lokal';

  @override
  String get secLayer4Desc =>
      'Aplikasi dilindungi oleh PIN 6 digit dan/atau biometrik (Face ID, sidik jari). Setelah terlalu banyak percobaan gagal, aplikasi terkunci dengan jeda yang meningkat setelah setiap kegagalan.';

  @override
  String get secLayer5Title => 'Basis data terkunci';

  @override
  String get secLayer5Desc =>
      'Di sisi server, tidak ada pengguna yang dapat menulis langsung ke basis data. Semua tindakan melewati fungsi aman yang memverifikasi setiap permintaan.';

  @override
  String get secLayer5Detail =>
      'Seperti loket bank: Anda tidak pernah menyentuh brankas sendiri. Anda membuat permintaan, dan sistem memeriksa bahwa Anda memiliki hak sebelum bertindak.';

  @override
  String get secVashLabel => 'UNIK DI DUNIA';

  @override
  String get secVashTitle => 'Mode Vash';

  @override
  String get secVashSubtitle =>
      'Sistem keamanan darurat yang tidak ada di aplikasi pesan lainnya.';

  @override
  String get secVashScenarioTitle => 'Bayangkan situasi ini';

  @override
  String get secVashScenario1 => 'Seseorang mengakses ponsel Anda';

  @override
  String get secVashScenario2 => 'Anda diminta kode PIN';

  @override
  String get secVashScenario3 =>
      'Anda ingin menghapus semua data secara mendesak';

  @override
  String get secVashSolutionTitle => 'Solusinya: dua kode PIN';

  @override
  String get secVashSolutionDesc =>
      'Anda mengonfigurasi dua kode PIN berbeda di Hash:';

  @override
  String get secVashNormalCodeLabel => 'Kode normal';

  @override
  String get secVashNormalCodeDesc =>
      'Membuka aplikasi secara normal dengan semua data Anda';

  @override
  String get secVashCodeLabel2 => 'Kode Vash';

  @override
  String get secVashCodeDescription =>
      'Membuka aplikasi secara normal... tetapi semua data Anda diam-diam dihapus di latar belakang';

  @override
  String get secVashWhatHappensTitle => 'Apa yang terjadi selanjutnya';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikasi terbuka secara normal. Tidak ada peringatan, tidak ada animasi mencurigakan. Layar hanya menampilkan aplikasi kosong, seolah-olah Anda baru saja menginstalnya.\n\nPada kenyataannya, semua percakapan, kontak, dan pesan Anda telah dihapus secara tidak dapat dibatalkan dalam sepersekian detik.';

  @override
  String get secCallsLabel => 'PANGGILAN & BERKAS';

  @override
  String get secCallsTitle => 'Semuanya terenkripsi';

  @override
  String get secCallsSubtitle =>
      'Bukan hanya pesan. Benar-benar semua yang melewati Hash dienkripsi ujung-ke-ujung.';

  @override
  String get secAudioCallTitle => 'Panggilan suara';

  @override
  String get secAudioCallDesc =>
      'Terenkripsi ujung-ke-ujung melalui WebRTC. Suara ditransmisikan langsung antar perangkat.';

  @override
  String get secVideoCallTitle => 'Panggilan video';

  @override
  String get secVideoCallDesc =>
      'Teknologi yang sama, setiap aliran dienkripsi secara individual.';

  @override
  String get secPhotosTitle => 'Foto & video';

  @override
  String get secPhotosDesc =>
      'Dienkripsi dalam AES-256-GCM sebelum meninggalkan ponsel Anda.';

  @override
  String get secDocsTitle => 'Dokumen';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, berkas apa pun. Nama, ukuran, dan konten dienkripsi.';

  @override
  String get secAnonLabel => 'ANONIMITAS';

  @override
  String get secAnonTitle => 'Tidak perlu identitas';

  @override
  String get secAnonSubtitle =>
      'Hash tidak pernah meminta nomor telepon atau email Anda. Anda diidentifikasi oleh Hash ID yang unik dan anonim.';

  @override
  String get secHashIdTitle => 'Hash ID Anda';

  @override
  String get secHashIdDesc =>
      'Ini adalah pengenal unik Anda. Tidak mengungkapkan apa pun tentang Anda: bukan nama, bukan nomor, bukan lokasi Anda. Seperti nama samaran yang mustahil untuk dihubungkan ke identitas asli Anda.\n\nUntuk menambahkan kontak, Anda membagikan Hash ID atau memindai kode QR. Itu saja. Tidak ada buku alamat tersinkronisasi, tidak ada saran \"Orang yang mungkin Anda kenal\".';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => 'Yang Hash tidak ketahui';

  @override
  String get secDataSubtitle =>
      'Cara terbaik untuk melindungi data Anda adalah tidak mengumpulkannya.';

  @override
  String get secNeverCollected => 'Tidak pernah dikumpulkan';

  @override
  String get secNeverItem1 => 'Konten pesan';

  @override
  String get secNeverItem2 => 'Daftar kontak';

  @override
  String get secNeverItem3 => 'Nomor telepon';

  @override
  String get secNeverItem4 => 'Alamat email';

  @override
  String get secNeverItem5 => 'Alamat IP';

  @override
  String get secNeverItem6 => 'Lokasi';

  @override
  String get secNeverItem7 => 'Metadata (siapa berbicara dengan siapa)';

  @override
  String get secNeverItem8 => 'Riwayat panggilan';

  @override
  String get secNeverItem9 => 'Buku alamat';

  @override
  String get secNeverItem10 => 'Pengenal iklan';

  @override
  String get secTempStored => 'Disimpan sementara';

  @override
  String get secTempItem1 => 'Hash ID anonim (pengenal unik)';

  @override
  String get secTempItem2 => 'Kunci enkripsi publik';

  @override
  String get secTempItem3 => 'Pesan terenkripsi dalam transit (maks 24j)';

  @override
  String get secTempNote =>
      'Bahkan data minimal ini tidak dapat mengidentifikasi Anda. Hash ID Anda tidak terhubung ke informasi pribadi apa pun.';

  @override
  String get secFooterTitle => 'Privasi Anda, kebebasan Anda';

  @override
  String get secFooterDesc =>
      'Hash menggunakan teknologi enkripsi yang sama dengan aplikasi profesional paling menuntut. Pesan Anda dilindungi oleh matematika, bukan oleh janji.';

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
