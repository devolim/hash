// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Walang Bakas. Walang Kompromiso.';

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
  String get conversations => 'Mga Chat';

  @override
  String get contacts => 'Mga Kontak';

  @override
  String get noConversation => 'Walang chat';

  @override
  String get noConversationSubtitle =>
      'Magdagdag ng kontak para magsimulang mag-chat nang ligtas';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mga naghihintay na kahilingan',
      one: '1 naghihintay na kahilingan',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mga naipadala na kahilingan na naghihintay',
      one: '1 naipadala na kahilingan na naghihintay',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Magdagdag ng kontak';

  @override
  String get shareApp => 'Ibahagi ang app';

  @override
  String get newMessage => 'Bagong mensahe';

  @override
  String get newConversation => 'Magpadala ng mensahe';

  @override
  String get settings => 'Mga Setting';

  @override
  String get myHashId => 'Aking Hash ID';

  @override
  String get supportHash => 'Suportahan ang Hash';

  @override
  String get supportHashSubtitle => 'Ang Hash ay isang non-profit na proyekto';

  @override
  String get donate => 'Mag-donate';

  @override
  String get appearance => 'Hitsura';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Awtomatiko';

  @override
  String get themeAutoSubtitle => 'Sumusunod sa mga setting ng system';

  @override
  String get themeDark => 'Madilim';

  @override
  String get themeLight => 'Maliwanag';

  @override
  String get themeRecommendation =>
      'Inirerekomenda ang madilim na tema para sa mas magandang privacy';

  @override
  String get language => 'Wika';

  @override
  String get languageAuto => 'Awtomatiko (system)';

  @override
  String get notifications => 'Mga Notipikasyon';

  @override
  String get messages => 'Mga Mensahe';

  @override
  String get calls => 'Mga Tawag';

  @override
  String get vibration => 'Vibrasyon';

  @override
  String get notificationContent => 'Nilalaman ng notipikasyon';

  @override
  String get notificationContentFull => 'Ipakita lahat';

  @override
  String get notificationContentFullDesc =>
      'Pangalan ng kontak at preview ng mensahe';

  @override
  String get notificationContentName => 'Pangalan lamang';

  @override
  String get notificationContentNameDesc =>
      'Ipinapakita lamang ang pangalan ng kontak';

  @override
  String get notificationContentDiscrete => 'Diskrete';

  @override
  String get notificationContentDiscreteDesc =>
      'Ipinapakita lamang ang \"Bagong mensahe\"';

  @override
  String get security => 'Seguridad';

  @override
  String get howHashProtectsYou => 'Paano ka pinoprotektahan ng Hash';

  @override
  String get howHashProtectsYouSubtitle => 'Unawain ang iyong seguridad';

  @override
  String get accountSecurity => 'Seguridad ng account';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrics, Vash Mode';

  @override
  String get blockScreenshots => 'I-block ang mga screenshot';

  @override
  String get transferDevice => 'Ilipat sa ibang device';

  @override
  String get transferDeviceSubtitle => 'Ilipat ang iyong account';

  @override
  String get pinCode => 'PIN code';

  @override
  String get changePin => 'Palitan ang PIN code';

  @override
  String get currentPin => 'Kasalukuyang PIN code';

  @override
  String get newPin => 'Bagong PIN code';

  @override
  String get confirmPin => 'Kumpirmahin ang PIN code';

  @override
  String get pinChanged => 'Nabago ang PIN code';

  @override
  String get incorrectPin => 'Maling PIN';

  @override
  String get pinsDoNotMatch => 'Hindi magkatugma ang mga PIN';

  @override
  String get autoLock => 'Auto-lock';

  @override
  String get autoLockDelay => 'Pagkaantala ng lock';

  @override
  String get autoLockImmediate => 'Agad-agad';

  @override
  String get autoLockMinute => '1 minuto';

  @override
  String autoLockMinutes(int count) {
    return '$count minuto';
  }

  @override
  String get vashCode => 'Vash code';

  @override
  String get vashModeTitle => 'Vash Mode';

  @override
  String get vashModeExplanation => 'Ang iyong pinakahuling safety net.';

  @override
  String get vashModeDescription =>
      'Pipili ka ng pangalawang PIN code. Kung mapilitan kang buksan ang Hash, ilagay ang code na ito sa halip na ang iyong regular na PIN.\n\nBubuksan ang app nang normal, pero mawawala na ang lahat ng iyong mga usapan at kontak.\n\nSa sinumang tumitingin sa iyong screen, mukhang walang laman ang Hash — parang hindi mo pa ito ginamit.';

  @override
  String get vashModeIrreversible =>
      'Ang aksyong ito ay tahimik at hindi na maibabalik.';

  @override
  String get chooseVashCode => 'Piliin ang aking Vash code';

  @override
  String get vashCodeInfo =>
      'Isang pangalawang PIN code na nagbubukas ng app nang normal, pero walang laman.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Kung ilalagay mo ang code na ito sa halip na iyong PIN:';

  @override
  String get vashDeleteContacts => 'Mawawala ang iyong mga kontak';

  @override
  String get vashDeleteMessages => 'Mawawala ang iyong mga usapan';

  @override
  String get vashDeleteHistory => 'Mawawala ang iyong mga tala';

  @override
  String get vashKeepId => 'Mananatili ang iyong Hash identity (#XXX-XXX-XXX)';

  @override
  String get vashAppearNormal =>
      'Mukhang normal pero walang laman ang app, parang bago. Hindi na maibabalik ang aksyong ito.';

  @override
  String get setupVashCode => 'I-setup ang Vash code';

  @override
  String get modifyVashCode => 'Baguhin ang Vash code';

  @override
  String get currentVashCode => 'Kasalukuyang Vash code';

  @override
  String get newVashCode => 'Bagong Vash code';

  @override
  String get confirmVashCode => 'Kumpirmahin ang Vash code';

  @override
  String get vashCodeConfigured => 'Na-configure na ang Vash code';

  @override
  String get vashCodeModified => 'Nabago ang Vash code';

  @override
  String get vashCodeMustDiffer => 'Ang Vash code ay dapat iba sa PIN';

  @override
  String get incorrectVashCode => 'Maling Vash code';

  @override
  String get vashWhatToDelete => 'Ano ang dapat ipawala ng Vash Mode?';

  @override
  String get vashDeleteContactsOption => 'Mga Kontak';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mga Mensahe';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Mga Tala';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Na-activate ang Vash Mode';

  @override
  String get vashCreateSubtitle =>
      'Pumili ng code na iba sa iyong pangunahing PIN';

  @override
  String get vashConfirmSubtitle => 'Kumpirmahin ang iyong Vash code';

  @override
  String get pinCodeForEntry => 'PIN code para makapasok sa app';

  @override
  String get vashCodeSection => 'Vash Mode';

  @override
  String get biometric => 'Biometrics';

  @override
  String get biometricUnlock => 'I-unlock gamit ang fingerprint o Face ID';

  @override
  String get enableBiometric => 'I-enable ang biometrics';

  @override
  String get biometricWarningMessage =>
      'Sa pag-enable ng biometrics, hindi mo magagamit ang iyong Vash code para pumasok sa app.\n\nMagagamit mo lamang ang Vash code kung mabigo ang biometrics (pagkatapos ng ilang nabigong pagtatangka).\n\nSigurado ka bang gusto mong magpatuloy?';

  @override
  String get understood => 'Naiintindihan ko';

  @override
  String get shareAppSubtitle => 'Ibahagi ang Hash sa iyong mga mahal sa buhay';

  @override
  String get share => 'Ibahagi';

  @override
  String get danger => 'Panganib';

  @override
  String get deleteAccount => 'Burahin ang aking account';

  @override
  String get deleteAccountSubtitle => 'Hindi na maibabalik na aksyon';

  @override
  String get deleteAccountConfirmTitle => 'Burahin ang aking account';

  @override
  String get deleteAccountConfirmMessage =>
      'Permanenteng mabubura ang iyong account. Hindi na maibabalik ang aksyong ito.\n\n• Lahat ng iyong mga chat\n• Lahat ng iyong mga kontak\n• Ang iyong Hash ID\n\nKailangan mong gumawa ng bagong account.';

  @override
  String get deleteForever => 'Burahin nang permanente';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Na-activate ang Vash Mode.';

  @override
  String deletionError(String error) {
    return 'Error sa pagbura: $error';
  }

  @override
  String get yourSecurity => 'Ang iyong seguridad';

  @override
  String get securityInfo =>
      '• End-to-end encryption (Signal Protocol)\n• Walang data sa aming mga server pagkatapos ng delivery\n• Mga susi na nakaimbak lamang sa iyong device\n• Hindi kailanman ipinapadala ang PIN code sa server';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Maligayang pagdating';

  @override
  String get securityStatement1 => 'Protektado ang iyong mga mensahe.';

  @override
  String get securityStatement2 => 'End-to-end encryption.';

  @override
  String get securityStatement3 => 'Walang bakas. Walang kompromiso.';

  @override
  String get securityStatement4 => 'Ang iyong privacy ay isang karapatan.';

  @override
  String get accessBlocked => 'Naka-block ang access';

  @override
  String get tooManyAttempts =>
      'Masyadong maraming pagtatangka. Subukan muli mamaya.';

  @override
  String get pleaseWait => 'Mangyaring maghintay';

  @override
  String get waitDelay => 'Mangyaring hintayin ang pagtatapos ng pagkaantala';

  @override
  String attemptCount(int current, int max) {
    return 'Pagtatangka $current sa $max';
  }

  @override
  String retryIn(String time) {
    return 'Subukan muli sa $time';
  }

  @override
  String get forgotPin => 'Nakalimutan ang PIN? Gamitin ang recovery phrase';

  @override
  String get useRecoveryPhrase => 'Gamitin ang recovery phrase';

  @override
  String get recoveryWarningTitle => 'Babala';

  @override
  String get recoveryWarningMessage => 'Ang account recovery ay:';

  @override
  String get recoveryDeleteAllMessages =>
      'Buburahin ang LAHAT ng iyong mga mensahe';

  @override
  String get recoveryWaitDelay => 'Kailangan ng 1 oras na paghihintay';

  @override
  String get recoveryKeepContacts => 'Pananatilihin ang iyong mga kontak';

  @override
  String get recoveryIrreversible =>
      'Hindi na maibabalik ang aksyong ito. Permanenteng mawawala ang iyong mga mensahe.';

  @override
  String get iUnderstand => 'Naiintindihan ko';

  @override
  String get accountRecovery => 'Account recovery';

  @override
  String get enterRecoveryPhrase =>
      'Ilagay ang 24 na salita ng iyong recovery phrase, pinaghihiwalay ng mga espasyo.';

  @override
  String get recoveryPhraseHint => 'salita1 salita2 salita3 ...';

  @override
  String get recover => 'I-recover';

  @override
  String get recoveryPhraseRequired =>
      'Mangyaring ilagay ang iyong recovery phrase';

  @override
  String get recoveryPhrase24Words => 'Dapat eksakto 24 na salita ang phrase';

  @override
  String get incorrectRecoveryPhrase => 'Maling recovery phrase';

  @override
  String get recoveryInitError => 'Error sa pag-initialize ng recovery';

  @override
  String get securityDelay => 'Pagkaantala ng seguridad';

  @override
  String get securityDelayMessage =>
      'Para sa iyong seguridad, kailangan ng panahon ng paghihintay bago ka makagawa ng bagong PIN.';

  @override
  String get timeRemaining => 'Natitirang oras';

  @override
  String get messagesDeletedForProtection =>
      'Nabura na ang iyong mga mensahe para sa iyong proteksyon.';

  @override
  String get canCloseApp => 'Puwede mong isara ang app at bumalik mamaya.';

  @override
  String get onboardingTitle1 => 'Maligayang pagdating sa Hash';

  @override
  String get onboardingSubtitle1 => 'Ang messenger na walang iniiwanang bakas';

  @override
  String get onboardingTitle2 => 'Kabuuang encryption';

  @override
  String get onboardingSubtitle2 =>
      'Ang iyong mga mensahe ay end-to-end encrypted gamit ang Signal Protocol';

  @override
  String get onboardingTitle3 => 'Walang bakas';

  @override
  String get onboardingSubtitle3 =>
      'Binubura ang mga mensahe sa mga server pagkatapos maihatid';

  @override
  String get onboardingTitle4 => 'Ang iyong seguridad';

  @override
  String get onboardingSubtitle4 => 'PIN code, Vash Mode at recovery phrase';

  @override
  String get getStarted => 'Magsimula';

  @override
  String get next => 'Susunod';

  @override
  String get skip => 'Laktawan';

  @override
  String get alreadyHaveAccount => 'Mayroon na akong account';

  @override
  String get transferMyAccount => 'Ilipat ang aking account';

  @override
  String get createPin => 'Gumawa ng PIN code';

  @override
  String get createPinSubtitle =>
      'Poprotektahan ng code na ito ang access sa iyong app';

  @override
  String get confirmYourPin => 'Kumpirmahin ang iyong PIN code';

  @override
  String get confirmPinSubtitle => 'Ilagay muli ang iyong PIN code';

  @override
  String get saveRecoveryPhrase => 'Recovery phrase';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Isulat ang 24 na salitang ito nang maayos. Magagamit mo ang mga ito para ma-recover ang iyong account kung makalimutan mo ang iyong PIN.';

  @override
  String get phraseWritten => 'Naisulat ko na ang aking phrase';

  @override
  String get warningRecoveryPhrase =>
      'Kung mawala mo ang phrase na ito at makalimutan ang iyong PIN, mawawala ang access mo sa iyong account.';

  @override
  String get accountTransferred => 'Nailipat na ang account';

  @override
  String get accountTransferredMessage =>
      'Nailipat na ang iyong account sa ibang device. Hindi na valid ang session na ito.';

  @override
  String get accountTransferredInfo =>
      'Kung hindi ikaw ang nagsimula ng paglilipat na ito, maaaring nakompromiso ang iyong account.';

  @override
  String get logout => 'Mag-log out';

  @override
  String get transferAccount => 'Ilipat ang account';

  @override
  String get transferAccountInfo =>
      'Ilipat ang iyong Hash account sa isang bagong device. Ma-i-invalidate ang iyong kasalukuyang session.';

  @override
  String get generateTransferCode => 'Gumawa ng transfer code';

  @override
  String get transferCode => 'Transfer code';

  @override
  String transferCodeExpires(int minutes) {
    return 'Mag-e-expire ang code na ito sa $minutes minuto';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Ilagay ang code na ito sa iyong bagong device para ilipat ang iyong account.';

  @override
  String get generateNewCode => 'Gumawa ng bagong code';

  @override
  String get scanQrCode => 'I-scan ang QR code';

  @override
  String get scanQrCodeSubtitle =>
      'I-scan ang QR code ng isang kontak para idagdag sila';

  @override
  String get qrCodeDetected => 'Na-detect ang QR code';

  @override
  String get invalidQrCode => 'Hindi valid na QR code';

  @override
  String get cameraPermissionRequired => 'Kailangan ng pahintulot sa camera';

  @override
  String get myQrCode => 'Aking QR code';

  @override
  String get myQrCodeSubtitle =>
      'Ibahagi ang QR code na ito para maidagdag ka ng iyong mga kontak';

  @override
  String get shareQrCode => 'Ibahagi';

  @override
  String get addContactTitle => 'Magdagdag ng kontak';

  @override
  String get addContactByHashId => 'Ilagay ang Hash ID ng iyong kontak';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Hanapin';

  @override
  String get contactNotFound => 'Hindi natagpuan ang kontak';

  @override
  String get contactAlreadyAdded => 'Nasa iyong listahan na ang kontak na ito';

  @override
  String get contactAdded => 'Naidagdag ang kontak';

  @override
  String get myProfile => 'Aking profile';

  @override
  String get myProfileSubtitle =>
      'Ibahagi ang impormasyong ito para maidagdag ka ng iba';

  @override
  String get temporaryCode => 'Pansamantalang code';

  @override
  String temporaryCodeExpires(String time) {
    return 'Mag-e-expire sa $time';
  }

  @override
  String get codeExpired => 'Nag-expire na ang code';

  @override
  String get generateNewCodeButton => 'Bagong code';

  @override
  String get copyHashId => 'Kopyahin ang ID';

  @override
  String get copyCode => 'Kopyahin ang code';

  @override
  String get copiedToClipboard => 'Nakopya';

  @override
  String get showMyQrCode => 'Ipakita ang aking QR code';

  @override
  String get orDivider => 'o';

  @override
  String get openScanner => 'Buksan ang scanner';

  @override
  String get addManually => 'Manu-manong idagdag';

  @override
  String get contactHashIdLabel => 'Hash ID ng kontak';

  @override
  String get temporaryCodeLabel => 'Pansamantalang code';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Hilingin sa iyong kontak na gumawa ng code mula sa kanilang profile';

  @override
  String get verifyAndAdd => 'I-verify at idagdag';

  @override
  String get fillAllFields => 'Mangyaring punan ang lahat ng field';

  @override
  String get invalidHashIdFormat =>
      'Hindi valid na format ng ID (hal.: 123-456-ABC)';

  @override
  String get userNotFound => 'Hindi natagpuan ang user';

  @override
  String get cannotAddYourself => 'Hindi mo puwedeng idagdag ang iyong sarili';

  @override
  String get invalidOrExpiredCode =>
      'Hindi valid o nag-expire na ang pansamantalang code';

  @override
  String get contactFound => 'Natagpuan ang kontak!';

  @override
  String get howToCallContact => 'Ano ang gusto mong itawag sa kanila?';

  @override
  String get contactNameHint => 'Pangalan ng kontak';

  @override
  String get addContactButton => 'Idagdag';

  @override
  String get contactDetails => 'Mga detalye ng kontak';

  @override
  String get contactName => 'Pangalan ng kontak';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Idinagdag noong $date';
  }

  @override
  String get deleteContact => 'Burahin ang kontak';

  @override
  String deleteContactConfirm(Object name) {
    return 'Burahin ang kontak na ito?';
  }

  @override
  String get deleteContactMessage => 'Mabubura rin ang buong chat.';

  @override
  String get delete => 'Burahin';

  @override
  String get typeMessage => 'Mag-type ng mensahe...';

  @override
  String get messageSent => 'Naipadala';

  @override
  String get messageDelivered => 'Naihatid';

  @override
  String get messageRead => 'Nabasa';

  @override
  String get messageFailed => 'Hindi naipadala';

  @override
  String get now => 'Ngayon';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}o';
  }

  @override
  String daysAgo(int count) {
    return '${count}a';
  }

  @override
  String get today => 'Ngayon';

  @override
  String get yesterday => 'Kahapon';

  @override
  String dateAtTime(String date, String time) {
    return '$date nang $time';
  }

  @override
  String get shareMessage =>
      'Samahan mo ako sa Hash! 🔒\n\nIto ay isang tunay na pribadong messenger: kabuuang encryption, walang bakas sa mga server, at panic mode kung kinakailangan.\n\nI-download ang app dito 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Error';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Tingnan';

  @override
  String get yes => 'Oo';

  @override
  String get no => 'Hindi';

  @override
  String get save => 'I-save';

  @override
  String get edit => 'I-edit';

  @override
  String get close => 'Isara';

  @override
  String get confirm => 'Kumpirmahin';

  @override
  String get loading => 'Naglo-load...';

  @override
  String get retry => 'Subukan muli';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Mga naghihintay na kahilingan';

  @override
  String get noPendingRequests => 'Walang naghihintay na kahilingan';

  @override
  String get pendingRequestsSubtitle => 'Gustong idagdag ka ng mga taong ito';

  @override
  String requestFromUser(String hashId) {
    return 'Kahilingan mula sa $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Mag-e-expire sa $days araw';
  }

  @override
  String get acceptRequest => 'Tanggapin';

  @override
  String get rejectRequest => 'Tanggihan';

  @override
  String get requestAccepted => 'Tinanggap ang kahilingan';

  @override
  String get requestRejected => 'Tinanggihan ang kahilingan';

  @override
  String get requestSent => 'Naipadala ang kahilingan!';

  @override
  String get requestSentSubtitle =>
      'Naipadala na ang iyong kahilingan. Kailangan itong tanggapin ng user bago kayo makapag-chat.';

  @override
  String get requestAlreadyPending => 'May naghihintay nang kahilingan';

  @override
  String get requestAlreadySentByOther =>
      'Nagpadala na sa iyo ng kahilingan ang taong ito';

  @override
  String get addByHashId => 'Idagdag gamit ang Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Ilagay ang Hash ID at pansamantalang code ng kontak';

  @override
  String get enterTemporaryCode => 'Ilagay ang 6 na digit na code';

  @override
  String get sendRequest => 'Ipadala ang kahilingan';

  @override
  String get acceptContactTitle => 'Tanggapin ang kontak';

  @override
  String get acceptContactSubtitle =>
      'Puwede mong bigyan sila ng custom na pangalan';

  @override
  String get leaveEmptyForHashId => 'Iwanang blangko para gamitin ang Hash ID';

  @override
  String get firstName => 'Unang pangalan';

  @override
  String get lastName => 'Apelyido';

  @override
  String get notes => 'Mga Tala';

  @override
  String get notesHint => 'Mga personal na tala tungkol sa kontak na ito';

  @override
  String get photoOptional => 'Larawan (opsyonal)';

  @override
  String get contactNameOptional => 'Pangalan (opsyonal)';

  @override
  String get notesOptional => 'Mga tala (opsyonal)';

  @override
  String get storedLocally => 'Nakaimbak lamang sa iyong device';

  @override
  String get encryptedMessageLabel => 'Naka-encrypt na mensahe';

  @override
  String get identityMessageHint => 'Sino ka? Paano kayo nagkakilala?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ie-encrypt at ipapadala ang mensaheng ito sa tatanggap';

  @override
  String get sendRequestButton => 'Ipadala ang kahilingan';

  @override
  String get requestExpiresIn24h =>
      'Mag-e-expire ang kahilingan sa 24 oras kung hindi tanggapin';

  @override
  String get theyAlreadySentYouRequest =>
      'Nagpadala na sa iyo ng kahilingan ang taong ito';

  @override
  String get requests => 'Mga Kahilingan';

  @override
  String get receivedRequests => 'Natanggap';

  @override
  String get sentRequests => 'Naipadala';

  @override
  String get noSentRequests => 'Walang naipadala na kahilingan';

  @override
  String get cancelRequest => 'Kanselahin';

  @override
  String get deleteRequest => 'Burahin ang kahilingan';

  @override
  String get requestCancelled => 'Nakansela ang kahilingan';

  @override
  String sentTo(String hashId) {
    return 'Naipadala sa $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Mag-e-expire sa $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Natanggap $time na ang nakalipas';
  }

  @override
  String get messageFromRequester => 'Mensahe mula sa nagpadala';

  @override
  String get copy => 'Kopyahin';

  @override
  String get messageInfo => 'Impormasyon ng mensahe';

  @override
  String get messageDirection => 'Direksyon';

  @override
  String get messageSentByYou => 'Ipinadala mo';

  @override
  String get messageReceived => 'Natanggap';

  @override
  String get messageSentAt => 'Naipadala noong';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Nabasa noong';

  @override
  String get messageType => 'Uri';

  @override
  String get messageSize => 'Laki';

  @override
  String get messageExpiresAt => 'Mag-e-expire noong';

  @override
  String get messageEncrypted => 'End-to-end encrypted';

  @override
  String get messageStatusSending => 'Ipinapadala...';

  @override
  String get messageStatusSent => 'Naipadala';

  @override
  String get messageStatusDelivered => 'Naihatid';

  @override
  String get messageStatusRead => 'Nabasa';

  @override
  String get messageStatusFailed => 'Nabigo';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Naghihintay ng pag-deliver';

  @override
  String get deletedFromServer => 'Nabura na';

  @override
  String get messageTypeText => 'Teksto';

  @override
  String get messageTypeImage => 'Larawan';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Boses';

  @override
  String get messageTypeFile => 'File';

  @override
  String get indefinitely => 'Walang katapusan';

  @override
  String get hoursShort => 'o';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'oras';

  @override
  String get minutes => 'minuto';

  @override
  String get seconds => 'segundo';

  @override
  String get ephemeralMessages => 'Mga ephemeral na mensahe';

  @override
  String get ephemeralMessagesDescription =>
      'Awtomatikong binubura ang mga mensahe pagkatapos ng panahong ito';

  @override
  String get ephemeralImmediate => 'Agad-agad (pagkatapos basahin)';

  @override
  String get ephemeralImmediateDesc => 'Binubura pagkatapos mabasa';

  @override
  String get ephemeralMyPreference => 'Aking kagustuhan';

  @override
  String get ephemeralMyPreferenceDesc => 'Gamitin ang global na setting';

  @override
  String get ephemeralDefaultSetting => 'Tagal ng mensahe';

  @override
  String get ephemeralChooseDefault => 'Inirerekomenda';

  @override
  String get ephemeral30Seconds => '30 segundo';

  @override
  String get ephemeral30SecondsDesc => 'Binubura 30s pagkatapos mabasa';

  @override
  String get ephemeral5Minutes => '5 minuto';

  @override
  String get ephemeral5MinutesDesc => 'Binubura 5min pagkatapos mabasa';

  @override
  String get ephemeral1Hour => '1 oras';

  @override
  String get ephemeral1HourDesc => 'Binubura 1o pagkatapos mabasa';

  @override
  String get ephemeral3Hours => '3 oras';

  @override
  String get ephemeral6Hours => '6 na oras';

  @override
  String get ephemeral6HoursDesc => 'Binubura 6o pagkatapos mabasa';

  @override
  String get ephemeral12Hours => '12 oras';

  @override
  String get ephemeral24Hours => '24 oras';

  @override
  String get ephemeral24HoursDesc => 'Binubura 24o pagkatapos mabasa';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Custom na tagal';

  @override
  String get howItWorks => 'Paano ito gumagana';

  @override
  String get ephemeralExplanation1 =>
      'Binubura ang mga mensahe mula sa server pagkakatanggap.';

  @override
  String get ephemeralExplanation2 =>
      'Tinutukoy ng setting na ito kung kailan mawawala ang mga mensahe mula sa IYONG telepono pagkatapos basahin.';

  @override
  String get ephemeralExplanation3 =>
      'May sariling setting ang iyong kontak para sa kanilang telepono.';

  @override
  String get mute1Hour => '1 oras';

  @override
  String get mute8Hours => '8 oras';

  @override
  String get mute1Day => '1 araw';

  @override
  String get mute1Week => '1 linggo';

  @override
  String get muteAlways => 'Palagi';

  @override
  String get muteExplanation =>
      'Hindi ka makakatanggap ng mga notipikasyon para sa kontak na ito';

  @override
  String get showCallsInRecents => 'Ipakita sa mga kamakailang tawag';

  @override
  String get showCallsInRecentsSubtitle =>
      'Lalabas ang mga Hash na tawag sa history ng tawag ng telepono';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'I-mute ang mga notipikasyon';

  @override
  String get muteDescription =>
      'Hindi ka makakatanggap ng mga notipikasyon para sa kontak na ito';

  @override
  String mutedUntil(String time) {
    return 'Naka-mute hanggang $time';
  }

  @override
  String get notMuted => 'Naka-enable ang mga notipikasyon';

  @override
  String get unmute => 'I-unmute';

  @override
  String get notificationSound => 'Tunog ng notipikasyon';

  @override
  String get defaultSound => 'Default';

  @override
  String get chatSettings => 'Mga setting ng chat';

  @override
  String get bubbleColor => 'Kulay ng bubble';

  @override
  String get backgroundColor => 'Kulay ng background';

  @override
  String get backgroundImage => 'Larawan ng background';

  @override
  String get chatBackground => 'Background ng chat';

  @override
  String get customColor => 'Custom';

  @override
  String get defaultColor => 'Default';

  @override
  String get imageSelected => 'Napili ang larawan';

  @override
  String get noImage => 'Walang larawan';

  @override
  String get color => 'Kulay';

  @override
  String get image => 'Larawan';

  @override
  String get tapToSelectImage => 'Mag-tap para pumili ng larawan';

  @override
  String get changeImage => 'Palitan ang larawan';

  @override
  String get previewMessageReceived => 'Kumusta!';

  @override
  String get previewMessageSent => 'Uy, kamusta!';

  @override
  String get messageAction => 'Mensahe';

  @override
  String get callAction => 'Tawag';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Mga personal na tala';

  @override
  String get addNotes => 'Magdagdag ng mga tala...';

  @override
  String get noNotes => 'Walang mga tala';

  @override
  String get messageNotifications => 'Mga notipikasyon ng mensahe';

  @override
  String get callNotifications => 'Mga notipikasyon ng tawag';

  @override
  String get useGradient => 'Gumamit ng gradient';

  @override
  String get gradientStart => 'Panimulang kulay';

  @override
  String get gradientEnd => 'Pangwakas na kulay';

  @override
  String get preview => 'Preview';

  @override
  String get reset => 'I-reset';

  @override
  String get securityNumber => 'Security number';

  @override
  String securityNumberDescription(String name) {
    return 'I-verify na tumutugma ang security number sa device ni $name';
  }

  @override
  String get verifyEncryption => 'I-verify ang end-to-end encryption';

  @override
  String get tapToCopy => 'Mag-tap para kopyahin';

  @override
  String get howToVerify => 'Paano i-verify';

  @override
  String get verifyStep1 =>
      'Makipagkita nang personal sa iyong kontak o tawagan sila';

  @override
  String get verifyStep2 =>
      'Ikumpara ang mga security number o mag-scan ng mga QR code';

  @override
  String get verifyStep3 => 'Kung magkatugma sila, ligtas ang iyong chat';

  @override
  String get scanToVerify => 'Mag-scan para i-verify';

  @override
  String get reportSpam => 'I-report ang spam';

  @override
  String get reportSpamSubtitle => 'I-report ang kontak na ito bilang spam';

  @override
  String get reportSpamDescription =>
      'Anonymously ire-report ang kontak na ito. Hindi ibabahagi ang iyong identity. Sigurado ka ba?';

  @override
  String get report => 'I-report';

  @override
  String get spamReported => 'Na-report ang spam';

  @override
  String get reportError => 'Hindi naipadala ang report. Subukan muli.';

  @override
  String get reportRateLimited =>
      'Naabot mo na ang maximum na bilang ng mga report para ngayon.';

  @override
  String get blockContact => 'I-block ang kontak';

  @override
  String get blockContactDescription =>
      'Hindi na makakapadala ng mga mensahe o makakatawag sa iyo ang kontak na ito. Hindi sila aabisuhan.';

  @override
  String get unblockContact => 'I-unblock ang kontak';

  @override
  String get unblockContactDescription =>
      'Makakapadala muli ng mga mensahe at makakatawag sa iyo ang kontak na ito.';

  @override
  String get contactBlocked => 'Na-block ang kontak';

  @override
  String get contactUnblocked => 'Na-unblock ang kontak';

  @override
  String get contactIsBlocked => 'Naka-block ang kontak na ito';

  @override
  String get unblock => 'I-unblock';

  @override
  String get deleteContactSubtitle => 'Burahin ang kontak at chat na ito';

  @override
  String get confirmWithPin => 'Kumpirmahin gamit ang PIN';

  @override
  String get enterPinToConfirm =>
      'Ilagay ang iyong PIN para kumpirmahin ang aksyong ito';

  @override
  String get profilePhoto => 'Larawan ng profile';

  @override
  String get takePhoto => 'Kumuha ng larawan';

  @override
  String get chooseFromGallery => 'Pumili mula sa gallery';

  @override
  String get removePhoto => 'Alisin ang larawan';

  @override
  String get viewContactHashId => 'Tingnan ang identifier ng kontak';

  @override
  String get hashIdPartiallyMasked =>
      'Bahagyang naka-mask para sa iyong seguridad at privacy ng iyong kontak';

  @override
  String get addFirstContact => 'Idagdag ang iyong unang kontak';

  @override
  String get addFirstContactSubtitle =>
      'Ibahagi ang iyong QR code o i-scan ang sa isang kaibigan';

  @override
  String get directory => 'Direktoryo';

  @override
  String get noContacts => 'Walang mga kontak';

  @override
  String get noContactsSubtitle => 'Magdagdag ng kontak para makapagsimula';

  @override
  String get sendMessageAction => 'Magpadala ng mensahe';

  @override
  String get audioCall => 'Audio call';

  @override
  String get videoCall => 'Video call';

  @override
  String get viewProfile => 'Tingnan ang profile';

  @override
  String get deleteContactDirectory => 'Burahin ang kontak';

  @override
  String get scanShort => 'I-scan';

  @override
  String get addShort => 'Idagdag';

  @override
  String deleteContactConfirmName(String name) {
    return 'Sigurado ka bang gusto mong burahin si $name?';
  }

  @override
  String get noNotesTitle => 'Walang mga tala';

  @override
  String get noNotesSubtitle => 'Gumawa ng iyong unang tala';

  @override
  String get newNote => 'Bagong tala';

  @override
  String get editNote => 'I-edit ang tala';

  @override
  String get deleteNote => 'Burahin ang tala';

  @override
  String get deleteNoteConfirm =>
      'Sigurado ka bang gusto mong burahin ang talang ito?';

  @override
  String get noteTitle => 'Pamagat';

  @override
  String get noteContent => 'Nilalaman';

  @override
  String get addItem => 'Magdagdag ng item';

  @override
  String get pinNote => 'I-pin';

  @override
  String get unpinNote => 'I-unpin';

  @override
  String get noteColor => 'Kulay';

  @override
  String get notePassword => 'Password';

  @override
  String get setPassword => 'Magtakda ng password';

  @override
  String get changePassword => 'Palitan ang password';

  @override
  String get removePassword => 'Alisin ang password';

  @override
  String get enterPassword => 'Ilagay ang password';

  @override
  String get confirmPassword => 'Kumpirmahin ang password';

  @override
  String get passwordPin => 'PIN code';

  @override
  String get passwordText => 'Text password';

  @override
  String get protectedNote => 'Protektadong tala';

  @override
  String get incorrectPassword => 'Maling password';

  @override
  String get passwordSet => 'Naitakda ang password';

  @override
  String get passwordRemoved => 'Naalis ang password';

  @override
  String get notesBiometric => 'Face ID para sa mga tala';

  @override
  String get notesBiometricSubtitle =>
      'Mangailangan ng biometric authentication para buksan ang mga protektadong tala';

  @override
  String get textNote => 'Text na tala';

  @override
  String get checklistNote => 'Checklist';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total gawain';
  }

  @override
  String get autoSaved => 'Na-save';

  @override
  String get searchNotes => 'Maghanap ng mga tala';

  @override
  String get legalConsent => 'Legal na pahintulot';

  @override
  String get confirmAge13 =>
      'Kinukumpirma kong hindi bababa sa 13 taon ang aking edad';

  @override
  String get acceptLegalStart => 'Tinatanggap ko ang ';

  @override
  String get privacyPolicy => 'Patakaran sa Privacy';

  @override
  String get termsOfService => 'Mga Tuntunin ng Serbisyo';

  @override
  String get andThe => ' at ang ';

  @override
  String get continueButton => 'Magpatuloy';

  @override
  String get mustAcceptTerms =>
      'Kailangan mong tanggapin ang dalawang kondisyon para makapagpatuloy';

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
  String get support => 'Suporta';

  @override
  String get contactSupport => 'Makipag-ugnayan sa suporta';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'I-report ang pang-aabuso';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Legal';

  @override
  String get legalEntity => 'Legal na entity';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'I-pin';

  @override
  String get unpinConversation => 'I-unpin';

  @override
  String get hideConversation => 'Alisin sa feed';

  @override
  String get deleteConversation => 'Burahin ang usapan';

  @override
  String get deleteConversationConfirm =>
      'Ilagay ang iyong PIN para kumpirmahin ang pagbura ng lahat ng mensahe';

  @override
  String get noConversations => 'Wala pang mga usapan';

  @override
  String get startConversation => 'Magsimula';

  @override
  String get microphonePermissionRequired => 'Kailangan ng access sa mikropono';

  @override
  String get microphonePermissionExplanation =>
      'Kailangan ng Hash ang mikropono para tumawag.';

  @override
  String get cameraPermissionExplanation =>
      'Kailangan ng Hash ang camera para sa mga video call.';

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
  String get openSettings => 'Buksan ang Mga Setting';

  @override
  String get callConnecting => 'Kumokonekta...';

  @override
  String get callRinging => 'Tumutunog...';

  @override
  String get callReconnecting => 'Muling kumokonekta...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Muling kumokonekta (${seconds}s)';
  }

  @override
  String get callPaused => 'Naka-pause';

  @override
  String get callPausedSubtitle => 'Ang tawag ay aktibo pa rin';

  @override
  String get callRemoteMicMuted => 'Naka-mute ang mikropono ng kontak';

  @override
  String get callMiniControlsMute => 'I-mute';

  @override
  String get callMiniControlsUnmute => 'I-unmute';

  @override
  String get callMiniControlsHangUp => 'Ibaba';

  @override
  String get callMiniControlsReturn => 'Bumalik sa tawag';

  @override
  String get callNetworkPoor => 'Hindi matatag na koneksyon';

  @override
  String get callNetworkLost => 'Nawala ang koneksyon';

  @override
  String get callEndedTitle => 'Natapos ang tawag';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Data ng device';

  @override
  String get deviceDataSubtitle => 'Lokal at server storage';

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
  String get localStorage => 'Lokal na storage';

  @override
  String get onThisDevice => 'sa device na ito';

  @override
  String get encryptedDatabases => 'Mga naka-encrypt na database';

  @override
  String get files => 'Mga File';

  @override
  String get secureKeychain => 'Secure na keychain';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Mga pangalan, avatar, Signal key';

  @override
  String get messagesDetail => 'Mga naka-encrypt na usapan';

  @override
  String get notesDetail => 'Mga personal na tala';

  @override
  String get signalSessions => 'Mga Signal session';

  @override
  String get signalSessionsDetail => 'Mga encryption session';

  @override
  String get pendingContacts => 'Mga naghihintay na kontak';

  @override
  String get pendingContactsDetail => 'Mga naghihintay na kahilingan';

  @override
  String get callHistory => 'Mga Tawag';

  @override
  String get callHistoryDetail => 'History ng tawag';

  @override
  String get preferences => 'Mga Kagustuhan';

  @override
  String get preferencesDetail => 'Mga kagustuhan sa media at tawag';

  @override
  String get avatars => 'Mga Avatar';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mga file',
      one: '1 file',
      zero: 'walang mga file',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktibo';

  @override
  String get notDefined => 'Hindi tinukoy';

  @override
  String get biometrics => 'Biometrics';

  @override
  String get recoveryPhrase => 'Recovery phrase';

  @override
  String get identity => 'Identity (Hash ID)';

  @override
  String get signalKeys => 'Mga Signal Protocol key';

  @override
  String get authTokens => 'Mga authentication token';

  @override
  String get contactNamesCache => 'Cache ng mga pangalan ng kontak';

  @override
  String get remoteConfig => 'Remote config';

  @override
  String get notificationPrefs => 'Mga kagustuhan sa notipikasyon';

  @override
  String get serverData => 'Data ng server';

  @override
  String get serverDataInfo =>
      'Nagtatago ang Hash ng minimal na data sa server, lahat naka-encrypt o pansamantala.';

  @override
  String get serverProfile => 'Profile';

  @override
  String get serverProfileDetail =>
      'Hash ID, mga pampublikong susi, mailbox token';

  @override
  String get serverPrekeys => 'Mga Pre-key';

  @override
  String get serverPrekeysDetail =>
      'Mga isang-beses na Signal key (nagamit na)';

  @override
  String get serverMessages => 'Mga mensahe na in-transit';

  @override
  String get serverMessagesDetail => 'Binubura pagkatapos maihatid (24o max)';

  @override
  String get serverMedia => 'Mga media na in-transit';

  @override
  String get serverMediaDetail => 'Binubura pagkatapos ma-download';

  @override
  String get serverContactRequests => 'Mga kahilingan sa kontak';

  @override
  String get serverContactRequestsDetail => 'Mag-e-expire pagkatapos ng 24o';

  @override
  String get serverRateLimits => 'Mga rate limit';

  @override
  String get serverRateLimitsDetail => 'Pansamantalang anti-abuse data';

  @override
  String get privacyReassurance =>
      'Hindi mababasa ng Hash ang iyong mga mensahe. Lahat ng data ay end-to-end encrypted. Awtomatikong binubura ang data sa server.';

  @override
  String get pinTooSimple =>
      'Masyadong simple ang PIN na ito. Pumili ng mas secure na code.';

  @override
  String get genericError => 'May nangyaring error. Subukan muli.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Hindi makalikha ng account: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Nakopya ang phrase sa clipboard';

  @override
  String get copyPhrase => 'Kopyahin ang phrase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Isulat ang phrase na ito sa isang ligtas na lugar. Kung mawala mo ang iyong PIN nang wala ang phrase na ito, permanenteng mawawala ang access mo sa iyong data.';

  @override
  String get noMessages => 'Walang mga mensahe';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Burahin ang lahat ng mensahe kay $name?';
  }

  @override
  String get confirmation => 'Kumpirmasyon';

  @override
  String get untitled => 'Walang pamagat';

  @override
  String get noSessions => 'Walang mga session';

  @override
  String get unknownContact => 'Hindi kilalang kontak';

  @override
  String get unnamed => 'Walang pangalan';

  @override
  String get noPendingRequestsAlt => 'Walang naghihintay na kahilingan';

  @override
  String get deleteAllCallHistory => 'Burahin ang lahat ng history ng tawag?';

  @override
  String get noCalls => 'Walang mga tawag';

  @override
  String get noPreferences => 'Walang mga kagustuhan';

  @override
  String get resetAllMediaPrefs => 'I-reset ang lahat ng kagustuhan sa media?';

  @override
  String get deleteThisAvatar => 'Burahin ang avatar na ito?';

  @override
  String get deleteAllAvatars => 'Burahin ang lahat ng avatar?';

  @override
  String get noAvatars => 'Walang mga avatar';

  @override
  String get deleteThisFile => 'Burahin ang file na ito?';

  @override
  String get deleteAllMediaFiles => 'Burahin ang lahat ng media?';

  @override
  String get noMediaFiles => 'Walang media';

  @override
  String get outgoing => 'Papalabas';

  @override
  String get incoming => 'Papasok';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Ephemeral na view: ${seconds}s';
  }

  @override
  String get normalView => 'Normal na view';

  @override
  String get callReasonCompleted => 'Natapos';

  @override
  String get callReasonMissed => 'Hindi nasagot';

  @override
  String get callReasonDeclined => 'Tinanggihan';

  @override
  String get callReasonFailed => 'Nabigo';

  @override
  String get justNow => 'Ngayon lang';

  @override
  String timeAgoMinutes(int count) {
    return '$count min nakalipas';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}o nakalipas';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}a nakalipas';
  }

  @override
  String get messageTypeContact => 'Kontak';

  @override
  String get messageTypeLocation => 'Lokasyon';

  @override
  String get statusQueued => 'Nakapila';

  @override
  String get blockedBadge => 'Naka-block';

  @override
  String get protectedBadge => 'Protektado';

  @override
  String messageCount(int count) {
    return '$count (mga) mensahe';
  }

  @override
  String get deleteQuestion => 'Burahin?';

  @override
  String get transferMyAccountTitle => 'Ilipat ang aking account';

  @override
  String get loadingError => 'Error sa pag-load';

  @override
  String get transferToNewDevice => 'Ilipat sa bagong device';

  @override
  String get transferInstructions =>
      'Sa iyong bagong device, piliin ang \"I-recover ang aking account\" at ilagay ang impormasyong ito:';

  @override
  String get yourHashIdLabel => 'Ang iyong Hash ID';

  @override
  String get enterYourPinCode => 'Ilagay ang iyong PIN code';

  @override
  String get pinOwnerConfirmation =>
      'Para kumpirmahin na ikaw ang may-ari ng account na ito';

  @override
  String get scanThisQrCode => 'I-scan ang QR code na ito';

  @override
  String get withYourNewDevice => 'Gamit ang iyong bagong device';

  @override
  String get orEnterTheCode => 'o ilagay ang code';

  @override
  String get transferCodeLabel => 'Transfer code';

  @override
  String get proximityVerification => 'Proximity verification';

  @override
  String get bringDevicesCloser => 'Ilapit ang dalawang device';

  @override
  String get confirmTransferQuestion => 'Kumpirmahin ang paglipat?';

  @override
  String get accountWillBeTransferred =>
      'Ililipat ang iyong account sa bagong device.\n\nPermanenteng madi-disconnect ang device na ito.';

  @override
  String get transferComplete => 'Kumpleto ang paglipat';

  @override
  String get transferSuccessMessage =>
      'Matagumpay na nailipat ang iyong account.\n\nIsasara na ang application na ito.';

  @override
  String get manualVerification => 'Manu-manong verification';

  @override
  String get codeDisplayedOnBothDevices =>
      'Code na ipinapakita sa dalawang device:';

  @override
  String get doesCodeMatchNewDevice =>
      'Tumutugma ba ang code na ito sa nasa bagong device?';

  @override
  String get verifiedStatus => 'Na-verify';

  @override
  String get inProgressStatus => 'Isinasagawa...';

  @override
  String get notAvailableStatus => 'Hindi available';

  @override
  String get codeExpiredRestart =>
      'Nag-expire na ang code. Mangyaring magsimula muli.';

  @override
  String get codesDoNotMatchCancelled =>
      'Hindi magkatugma ang mga code. Kinansela ang paglipat.';

  @override
  String transferToDevice(String device) {
    return 'Sa: $device';
  }

  @override
  String get copiedExclamation => 'Nakopya!';

  @override
  String expiresInTime(String time) {
    return 'Mag-e-expire sa $time';
  }

  @override
  String get biometricNotAvailable =>
      'Hindi available ang biometrics sa device na ito';

  @override
  String get biometricAuthError => 'Error sa biometric authentication';

  @override
  String get authenticateForBiometric =>
      'Mangyaring mag-authenticate para i-enable ang biometrics';

  @override
  String get biometricAuthFailed => 'Nabigo ang biometric authentication';

  @override
  String get forceUpdateTitle => 'Kailangan ng update';

  @override
  String get forceUpdateMessage =>
      'May bagong version ng Hash na available. Mangyaring mag-update para makapagpatuloy.';

  @override
  String get updateButton => 'Mag-update';

  @override
  String get maintenanceInProgress => 'May isinasagawang maintenance';

  @override
  String get tryAgainLater => 'Subukan muli mamaya';

  @override
  String get information => 'Impormasyon';

  @override
  String get later => 'Mamaya';

  @override
  String get doYouLikeHash => 'Gusto mo ba ang Hash?';

  @override
  String get yourFeedbackHelps =>
      'Nakakatulong ang iyong feedback para mapabuti ang app';

  @override
  String get ratingTerrible => 'Kahindik-hindik';

  @override
  String get ratingBad => 'Masama';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Maganda';

  @override
  String get ratingExcellent => 'Napakagaling!';

  @override
  String get donationMessage =>
      'Ang Hash ay isang non-profit na proyekto. Nakakatulong ang iyong suporta para makapagpatuloy kaming bumuo ng tunay na pribadong messenger.';

  @override
  String get recentConnections => 'Mga kamakailang koneksyon';

  @override
  String get loginInfoText =>
      'Bawat PIN unlock ay naitatala nang lokal. Ang huling 24 oras lamang ang pinapanatili.';

  @override
  String get connectionCount => '(Mga) Koneksyon';

  @override
  String get periodLabel => 'Panahon';

  @override
  String get historyLabel => 'History';

  @override
  String get noLoginRecorded => 'Walang naitatalang login';

  @override
  String get nextUnlocksAppearHere => 'Lalabas dito ang mga susunod na unlock.';

  @override
  String get dataLocalOnly =>
      'Ang data na ito ay nakaimbak lamang sa iyong device at hindi kailanman ipinapadala.';

  @override
  String get currentSession => 'Kasalukuyan';

  @override
  String get todayLabel => 'Ngayon';

  @override
  String get yesterdayLabel => 'Kahapon';

  @override
  String get justNowLabel => 'Ngayon lang';

  @override
  String minutesAgoLabel(int count) {
    return '$count min nakalipas';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}o nakalipas';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}o ${minutes}min nakalipas';
  }

  @override
  String get noMaintenancePlanned => 'Walang nakaplanong maintenance';

  @override
  String get everythingWorkingNormally => 'Normal ang lahat ng gumagana';

  @override
  String get maintenanceTitle => 'Maintenance';

  @override
  String get maintenanceActiveLabel => 'ISINASAGAWA';

  @override
  String get maintenancePlannedLabel => 'NAKAPLANDOP';

  @override
  String get locking => 'Nagla-lock...';

  @override
  String get newMessageNotification => 'Bagong mensahe';

  @override
  String get secExplainTitle => 'Paano ka pinoprotektahan ng Hash';

  @override
  String get secExplainIntro =>
      'Dinisenyo ang Hash para walang sinumang makabasa ng iyong mga mensahe.';

  @override
  String get secExplainIntroSub =>
      'Kahit kami.\nGanito ang paraan nito, ipinaliwanag nang simple.';

  @override
  String get secJourneyLabel => 'ANG PAGLALAKBAY';

  @override
  String get secJourneyTitle => 'Ang paglalakbay ng iyong mensahe';

  @override
  String get secJourneySubtitle =>
      'Mula sa iyong daliri hanggang sa screen ng iyong kontak, protektado ang bawat hakbang. Sundan ang landas.';

  @override
  String get secStep1Title => 'Sinusulat mo ang iyong mensahe';

  @override
  String get secStep1Desc =>
      'Tina-type mo ang \"Kumusta!\" sa app. Sa puntong ito, nasa memorya lamang ng iyong telepono ang mensahe. Wala pang naipadala.';

  @override
  String get secStep2Title => 'Encryption gamit ang Signal Protocol';

  @override
  String get secStep2Desc =>
      'Pagka-tap mo ng \"Ipadala\", ang iyong mensahe ay nagiging isang hanay ng hindi maintindihang mga karakter. Parang naka-lock ang iyong mensahe sa isang safe na ang iyong kontak lamang ang may susi.';

  @override
  String get secStep3Title => 'Sealed Sender: ang hindi nakikitang sobre';

  @override
  String get secStep3Desc =>
      'Isipin mong nagpapadala ka ng liham sa koreo, pero walang return address sa sobre. Yan mismo ang ginagawa ng Hash. Inilalagay ang mensahe sa isang anonymous na mailbox. Hindi alam ng server kung sino ang nagpadala.';

  @override
  String get secStep4Title => 'Walang nakikita ang server';

  @override
  String get secStep4Desc =>
      'Ang server ay parang isang bulag na kartero. Alam lang nito na \"may naglagay ng isang bagay sa mailbox #A7X9\". Hindi nito alam kung sino ang nagpadala, ano ito, o para kanino.';

  @override
  String get secStep4Highlight =>
      'Walang nakaimbak na metadata: walang IP address, walang timestamp, walang koneksyon sa pagitan ng nagpadala at tumanggap.';

  @override
  String get secStep5Title => 'Natatanggap ng iyong kontak ang mensahe';

  @override
  String get secStep5Desc =>
      'Kinukuha ng telepono ng iyong kontak ang nilalaman mula sa kanilang anonymous na mailbox at dine-decrypt ang mensahe gamit ang kanilang private key, na hindi kailanman umalis sa kanilang device. Lumalabas ang \"Kumusta!\" sa kanilang screen.';

  @override
  String get secStep6Title => 'Nawawala ang mensahe mula sa server';

  @override
  String get secStep6Desc =>
      'Pagkakumpirma ng iyong kontak na natanggap na, permanenteng binubura ng server ang mensahe. Walang trash, walang archive, walang backup. Kahit ang mga hindi nabasa na mensahe ay awtomatikong sinisira pagkatapos ng 24 oras.';

  @override
  String get secStep7Title => 'Lokal na expiration';

  @override
  String get secStep7Desc =>
      'Sa telepono ng iyong kontak, awtomatikong nasisira ang mensahe ayon sa pinili mong tagal: agad pagkabasa, 5 minuto, 1 oras... ikaw ang magpapasya.';

  @override
  String get secJourneyConclusion =>
      'Resulta: zero trace sa server, zero trace sa mga device. Umiral lamang ang mensahe nang sapat para mabasa, pagkatapos ay nawala ito.';

  @override
  String get secArchLabel => 'ARKITEKTURA';

  @override
  String get secArchTitle => '5 patong ng proteksyon';

  @override
  String get secArchSubtitle =>
      'Hindi umaasa ang Hash sa iisang teknolohiya. Pinapalakas ng bawat patong ang iba. Kahit makompromiso ang isang patong, ligtas pa rin ang iyong data.';

  @override
  String get secLayer1Title => 'End-to-end encryption';

  @override
  String get secLayer1Desc =>
      'Ang bawat mensahe ay naka-encrypt gamit ang natatanging susi. Sa simpleng salita: kahit ma-decrypt ng isang tao ang isang mensahe, hindi niya madi-decrypt ang susunod. May sariling lock ang bawat mensahe.';

  @override
  String get secLayer1Detail =>
      'Para sa mga file (mga larawan, video, dokumento), gumagamit ang Hash ng karagdagang AES-256-GCM encryption. Naka-encrypt ang file bago ito umalis sa iyong telepono.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonymity sa network)';

  @override
  String get secLayer2Desc =>
      'Ang karaniwang mga messenger ay nagpapadala ng iyong mga mensahe kasama ang iyong identity. Parang sinusulat mo ang pangalan mo sa sobre. Gumagamit ang Hash ng anonymous na mga mailbox: nagde-deliver ang server ng mensahe nang hindi alam kung sino ang nagpadala.';

  @override
  String get secLayer2Detail =>
      'Resulta: kahit sa kaso ng data breach sa server, imposibleng i-reconstruct kung sino ang nag-uusap sa sino.';

  @override
  String get secLayer3Title => 'Awtomatikong pagbura';

  @override
  String get secLayer3Desc =>
      'Binubura ang mga mensahe mula sa server pagkakumpirma ng pagtanggap. Kahit hindi kailanman makuha ang isang mensahe, awtomatiko itong sinisira pagkatapos ng 24 oras.';

  @override
  String get secLayer3Detail =>
      'Sa iyong telepono, ang mga mensahe ay awtomatikong nasisira ayon sa pinili mong tagal: agad, 5 min, 15 min, 30 min, 1o, 3o, 6o, o 12o.';

  @override
  String get secLayer4Title => 'Proteksyon ng lokal na access';

  @override
  String get secLayer4Desc =>
      'Protektado ang app ng 6 na digit na PIN code at/o biometrics (Face ID, fingerprint). Pagkatapos ng masyadong maraming nabigong pagtatangka, nagla-lock ang app na may pagtaas na pagkaantala pagkatapos ng bawat pagkabigo.';

  @override
  String get secLayer5Title => 'Naka-lock na database';

  @override
  String get secLayer5Desc =>
      'Sa panig ng server, walang user ang makakapagsulat nang direkta sa database. Ang lahat ng aksyon ay dumadaan sa mga secure na function na nagve-verify ng bawat kahilingan.';

  @override
  String get secLayer5Detail =>
      'Parang isang bank counter: hindi mo kailanman hahawakan ang vault nang mag-isa. Gumawa ka ng kahilingan, at tsine-check ng system na may karapatan ka bago kumilos.';

  @override
  String get secVashLabel => 'NATATANGI SA MUNDO';

  @override
  String get secVashTitle => 'Vash Mode';

  @override
  String get secVashSubtitle =>
      'Isang emergency na sistema ng seguridad na wala sa anumang iba pang messaging app.';

  @override
  String get secVashScenarioTitle => 'Isipin ang sitwasyong ito';

  @override
  String get secVashScenario1 => 'May nakaka-access sa iyong telepono';

  @override
  String get secVashScenario2 => 'Hinihinging ilagay mo ang iyong PIN code';

  @override
  String get secVashScenario3 =>
      'Gusto mong burahin agad ang lahat ng iyong data';

  @override
  String get secVashSolutionTitle => 'Ang solusyon: dalawang PIN code';

  @override
  String get secVashSolutionDesc =>
      'Nagko-configure ka ng dalawang magkaibang PIN code sa Hash:';

  @override
  String get secVashNormalCodeLabel => 'Normal na code';

  @override
  String get secVashNormalCodeDesc =>
      'Binubuksan ang app nang normal kasama ang lahat ng iyong data';

  @override
  String get secVashCodeLabel2 => 'Vash code';

  @override
  String get secVashCodeDescription =>
      'Binubuksan ang app nang normal... pero tahimik na binubura ang lahat ng iyong data sa background';

  @override
  String get secVashWhatHappensTitle => 'Ano ang nangyayari pagkatapos';

  @override
  String get secVashWhatHappensDesc =>
      'Bumubukas ang app nang normal. Walang alerto, walang kahina-hinalang animation. Ipinapakita lamang ng screen ang isang walang lamang app, parang kaka-install mo lang.\n\nSa katotohanan, lahat ng iyong mga usapan, kontak, at mensahe ay hindi na maibabalik na nabura sa isang bahagi ng isang segundo.';

  @override
  String get secCallsLabel => 'MGA TAWAG AT FILE';

  @override
  String get secCallsTitle => 'Lahat ay naka-encrypt';

  @override
  String get secCallsSubtitle =>
      'Hindi lang mga mensahe. Lahat ng dumadaan sa Hash ay end-to-end encrypted.';

  @override
  String get secAudioCallTitle => 'Mga audio call';

  @override
  String get secAudioCallDesc =>
      'End-to-end encrypted sa pamamagitan ng WebRTC. Direktang ipinapadala ang boses sa pagitan ng mga device.';

  @override
  String get secVideoCallTitle => 'Mga video call';

  @override
  String get secVideoCallDesc =>
      'Parehong teknolohiya, bawat stream ay naka-encrypt nang isa-isa.';

  @override
  String get secPhotosTitle => 'Mga larawan at video';

  @override
  String get secPhotosDesc =>
      'Naka-encrypt sa AES-256-GCM bago umalis sa iyong telepono.';

  @override
  String get secDocsTitle => 'Mga Dokumento';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, anumang file. Pangalan, laki, at nilalaman ay naka-encrypt.';

  @override
  String get secAnonLabel => 'ANONYMITY';

  @override
  String get secAnonTitle => 'Walang kinakailangang identity';

  @override
  String get secAnonSubtitle =>
      'Hindi kailanman hinihingi ng Hash ang iyong numero ng telepono o email. Kinikilala ka sa pamamagitan ng isang natatangi at anonymous na Hash ID.';

  @override
  String get secHashIdTitle => 'Ang iyong Hash ID';

  @override
  String get secHashIdDesc =>
      'Ito ang iyong natatanging identifier. Walang ibinubunyag ito tungkol sa iyo: hindi ang iyong pangalan, hindi ang iyong numero, hindi ang iyong lokasyon. Parang isang pseudonym na imposibleng i-link sa iyong tunay na identity.\n\nPara magdagdag ng kontak, ibahagi mo ang iyong Hash ID o mag-scan ng QR code. Yan na. Walang naka-sync na address book, walang \"Mga taong maaaring kilala mo\" na mga mungkahi.';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => 'Ang hindi alam ng Hash';

  @override
  String get secDataSubtitle =>
      'Ang pinakamahusay na paraan para protektahan ang iyong data ay hindi kolektahin ito.';

  @override
  String get secNeverCollected => 'Hindi kailanman kinokolekta';

  @override
  String get secNeverItem1 => 'Nilalaman ng mensahe';

  @override
  String get secNeverItem2 => 'Listahan ng kontak';

  @override
  String get secNeverItem3 => 'Numero ng telepono';

  @override
  String get secNeverItem4 => 'Email address';

  @override
  String get secNeverItem5 => 'IP address';

  @override
  String get secNeverItem6 => 'Lokasyon';

  @override
  String get secNeverItem7 => 'Metadata (sino ang nag-uusap sa sino)';

  @override
  String get secNeverItem8 => 'History ng tawag';

  @override
  String get secNeverItem9 => 'Address book';

  @override
  String get secNeverItem10 => 'Mga advertising identifier';

  @override
  String get secTempStored => 'Pansamantalang nakaimbak';

  @override
  String get secTempItem1 => 'Anonymous na Hash ID (natatanging identifier)';

  @override
  String get secTempItem2 => 'Mga pampublikong encryption key';

  @override
  String get secTempItem3 =>
      'Mga naka-encrypt na mensahe na in-transit (max 24o)';

  @override
  String get secTempNote =>
      'Kahit ang minimal na data na ito ay hindi makakatukoy sa iyo. Ang iyong Hash ID ay hindi konektado sa anumang personal na impormasyon.';

  @override
  String get secFooterTitle => 'Ang iyong privacy, ang iyong kalayaan';

  @override
  String get secFooterDesc =>
      'Gumagamit ang Hash ng parehong mga encryption technology tulad ng mga pinakamahigpit na propesyonal na application. Protektado ang iyong mga mensahe ng matematika, hindi ng mga pangako.';

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
