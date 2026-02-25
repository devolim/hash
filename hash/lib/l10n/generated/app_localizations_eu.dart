// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Arrastorik zero. Konpromisorik zero.';

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
  String get conversations => 'Txatak';

  @override
  String get contacts => 'Kontaktuak';

  @override
  String get noConversation => 'Txatik ez';

  @override
  String get noConversationSubtitle =>
      'Gehitu kontaktu bat modu seguruan txateatzen hasteko';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count eskaera zain',
      one: 'Eskaera 1 zain',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bidalitako $count eskaera zain',
      one: 'Bidalitako eskaera 1 zain',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Gehitu kontaktua';

  @override
  String get shareApp => 'Partekatu aplikazioa';

  @override
  String get newMessage => 'Mezu berria';

  @override
  String get newConversation => 'Bidali mezua';

  @override
  String get settings => 'Ezarpenak';

  @override
  String get myHashId => 'Nire Hash ID';

  @override
  String get supportHash => 'Lagundu Hash';

  @override
  String get supportHashSubtitle => 'Hash irabazi-asmorik gabeko proiektua da';

  @override
  String get donate => 'Dohaintza egin';

  @override
  String get appearance => 'Itxura';

  @override
  String get theme => 'Gaia';

  @override
  String get themeAuto => 'Automatikoa';

  @override
  String get themeAutoSubtitle => 'Sistemaren ezarpenak jarraitzen ditu';

  @override
  String get themeDark => 'Iluna';

  @override
  String get themeLight => 'Argia';

  @override
  String get themeRecommendation =>
      'Gai iluna gomendatzen da pribatutasun hobea lortzeko';

  @override
  String get language => 'Hizkuntza';

  @override
  String get languageAuto => 'Automatikoa (sistema)';

  @override
  String get notifications => 'Jakinarazpenak';

  @override
  String get messages => 'Mezuak';

  @override
  String get calls => 'Deiak';

  @override
  String get vibration => 'Bibrazioa';

  @override
  String get notificationContent => 'Jakinarazpenaren edukia';

  @override
  String get notificationContentFull => 'Dena erakutsi';

  @override
  String get notificationContentFullDesc =>
      'Kontaktuaren izena eta mezuaren aurrebista';

  @override
  String get notificationContentName => 'Izena bakarrik';

  @override
  String get notificationContentNameDesc =>
      'Kontaktuaren izena bakarrik erakusten du';

  @override
  String get notificationContentDiscrete => 'Diskretua';

  @override
  String get notificationContentDiscreteDesc =>
      '\"Mezu berria\" bakarrik erakusten du';

  @override
  String get security => 'Segurtasuna';

  @override
  String get howHashProtectsYou => 'Nola babesten zaitu Hash-ek';

  @override
  String get howHashProtectsYouSubtitle => 'Ulertu zure segurtasuna';

  @override
  String get accountSecurity => 'Kontuaren segurtasuna';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrikoak, Vash modua';

  @override
  String get blockScreenshots => 'Pantaila-argazkiak blokeatu';

  @override
  String get transferDevice => 'Beste gailu batera transferitu';

  @override
  String get transferDeviceSubtitle => 'Migratu zure kontua';

  @override
  String get pinCode => 'PIN kodea';

  @override
  String get changePin => 'Aldatu PIN kodea';

  @override
  String get currentPin => 'Oraingo PIN kodea';

  @override
  String get newPin => 'PIN kode berria';

  @override
  String get confirmPin => 'Berretsi PIN kodea';

  @override
  String get pinChanged => 'PIN kodea aldatuta';

  @override
  String get incorrectPin => 'PIN okerra';

  @override
  String get pinsDoNotMatch => 'PIN kodeak ez datoz bat';

  @override
  String get autoLock => 'Auto-blokeoa';

  @override
  String get autoLockDelay => 'Blokeo-atzerapena';

  @override
  String get autoLockImmediate => 'Berehalakoa';

  @override
  String get autoLockMinute => 'Minutu 1';

  @override
  String autoLockMinutes(int count) {
    return '$count minutu';
  }

  @override
  String get vashCode => 'Vash kodea';

  @override
  String get vashModeTitle => 'Vash modua';

  @override
  String get vashModeExplanation => 'Zure azken segurtasun-sarea.';

  @override
  String get vashModeDescription =>
      'Bigarren PIN kode bat aukeratuko duzu. Inoiz Hash irekitzera behartzen bazaituzte, sartu kode hau zure ohiko PIN-aren ordez.\n\nAplikazioa normaltasunez irekiko da, baina zure elkarrizketa eta kontaktu guztiak desagertu egingo dira.\n\nZure pantailari begiratzen dion edonorentzat, Hash hutsik agertzen da — inoiz erabili ez bazenu bezala.';

  @override
  String get vashModeIrreversible => 'Ekintza hau isila eta itzulezina da.';

  @override
  String get chooseVashCode => 'Aukeratu Vash kodea';

  @override
  String get vashCodeInfo =>
      'Bigarren PIN kode bat, aplikazioa normaltasunez baina hutsik irekitzen duena.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Kode hau zure PIN-aren ordez sartzen baduzu:';

  @override
  String get vashDeleteContacts => 'Zure kontaktuak desagertzen dira';

  @override
  String get vashDeleteMessages => 'Zure elkarrizketak desagertzen dira';

  @override
  String get vashDeleteHistory => 'Zure oharrak desagertzen dira';

  @override
  String get vashKeepId =>
      'Zure Hash identitatea (#XXX-XXX-XXX) bera izaten jarraitzen du';

  @override
  String get vashAppearNormal =>
      'Aplikazioa normal baina hutsik agertzen da, berria balitz bezala. Ekintza hau itzulezina da.';

  @override
  String get setupVashCode => 'Konfiguratu Vash kodea';

  @override
  String get modifyVashCode => 'Aldatu Vash kodea';

  @override
  String get currentVashCode => 'Oraingo Vash kodea';

  @override
  String get newVashCode => 'Vash kode berria';

  @override
  String get confirmVashCode => 'Berretsi Vash kodea';

  @override
  String get vashCodeConfigured => 'Vash kodea konfiguratuta';

  @override
  String get vashCodeModified => 'Vash kodea aldatuta';

  @override
  String get vashCodeMustDiffer =>
      'Vash kodeak PIN-etik ezberdina izan behar du';

  @override
  String get incorrectVashCode => 'Vash kode okerra';

  @override
  String get vashWhatToDelete => 'Zer desagertu behar du Vash moduak?';

  @override
  String get vashDeleteContactsOption => 'Kontaktuak';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mezuak';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Oharrak';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash modua aktibatuta';

  @override
  String get vashCreateSubtitle =>
      'Aukeratu zure PIN nagusitik ezberdina den kodea';

  @override
  String get vashConfirmSubtitle => 'Berretsi zure Vash kodea';

  @override
  String get pinCodeForEntry => 'PIN kodea aplikazioan sartzeko';

  @override
  String get vashCodeSection => 'Vash modua';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Desblokeatu hatz-markarekin edo Face ID-rekin';

  @override
  String get enableBiometric => 'Biometria aktibatu';

  @override
  String get biometricWarningMessage =>
      'Biometria aktibatuz gero, ezin izango duzu Vash kodea erabili aplikazioan sartzeko.\n\nVash kodea biometriak huts egiten duenean soilik erabil dezakezu (hainbat saiakera arrakastatsu ondoren).\n\nZiur al zaude jarraitu nahi duzula?';

  @override
  String get understood => 'Ulertzen dut';

  @override
  String get shareAppSubtitle => 'Hash zure hurbilekoekin partekatu';

  @override
  String get share => 'Partekatu';

  @override
  String get danger => 'Arriskua';

  @override
  String get deleteAccount => 'Ezabatu nire kontua';

  @override
  String get deleteAccountSubtitle => 'Ekintza itzulezina';

  @override
  String get deleteAccountConfirmTitle => 'Ezabatu nire kontua';

  @override
  String get deleteAccountConfirmMessage =>
      'Zure kontua betirako ezabatuko da. Ekintza hau itzulezina da.\n\n- Zure txat guztiak\n- Zure kontaktu guztiak\n- Zure Hash ID\n\nKontu berri bat sortu beharko duzu.';

  @override
  String get deleteForever => 'Betirako ezabatu';

  @override
  String get cancel => 'Utzi';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash modua aktibatuta.';

  @override
  String deletionError(String error) {
    return 'Ezabatze-errorea: $error';
  }

  @override
  String get yourSecurity => 'Zure segurtasuna';

  @override
  String get securityInfo =>
      '- Muturretik muturrerako enkriptazioa (Signal Protocol)\n- Entregaren ondoren daturik gure zerbitzarietan ez\n- Gakoak zure gailuan bakarrik gordetzen dira\n- PIN kodea ez da inoiz zerbitzarira bidaltzen';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Ongi etorri';

  @override
  String get securityStatement1 => 'Zure mezuak babestuta daude.';

  @override
  String get securityStatement2 => 'Muturretik muturrerako enkriptazioa.';

  @override
  String get securityStatement3 => 'Arrastorik ez. Konpromisorik ez.';

  @override
  String get securityStatement4 => 'Zure pribatutasuna eskubide bat da.';

  @override
  String get accessBlocked => 'Sarbidea blokeatuta';

  @override
  String get tooManyAttempts => 'Saiakera gehiegi';

  @override
  String get pleaseWait => 'Itxaron mesedez';

  @override
  String get waitDelay => 'Itxaron atzerapena amaitu arte';

  @override
  String attemptCount(int current, int max) {
    return 'Saiakera $current/$max';
  }

  @override
  String retryIn(String time) {
    return 'Saiatu berriro $time-n';
  }

  @override
  String get forgotPin => 'PIN-a ahaztu? Erabili berreskuratze-esaldia';

  @override
  String get useRecoveryPhrase => 'Erabili berreskuratze-esaldia';

  @override
  String get recoveryWarningTitle => 'Kontuz';

  @override
  String get recoveryWarningMessage => 'Kontuaren berreskuratzeak:';

  @override
  String get recoveryDeleteAllMessages => 'Zure mezu GUZTIAK ezabatuko ditu';

  @override
  String get recoveryWaitDelay => 'Ordubeteko atzerapena eskatuko du';

  @override
  String get recoveryKeepContacts => 'Zure kontaktuak mantenduko ditu';

  @override
  String get recoveryIrreversible =>
      'Ekintza hau itzulezina da. Zure mezuak betirako galduko dira.';

  @override
  String get iUnderstand => 'Ulertzen dut';

  @override
  String get accountRecovery => 'Kontuaren berreskuratzea';

  @override
  String get enterRecoveryPhrase =>
      'Sartu zure berreskuratze-esaldiaren 24 hitzak, zuriuneez bereizita.';

  @override
  String get recoveryPhraseHint => 'hitza1 hitza2 hitza3 ...';

  @override
  String get recover => 'Berreskuratu';

  @override
  String get recoveryPhraseRequired => 'Sartu zure berreskuratze-esaldia';

  @override
  String get recoveryPhrase24Words =>
      'Esaldiak zehazki 24 hitz izan behar ditu';

  @override
  String get incorrectRecoveryPhrase => 'Berreskuratze-esaldi okerra';

  @override
  String get recoveryInitError => 'Errorea berreskuratzea hasieratzerakoan';

  @override
  String get securityDelay => 'Segurtasun-atzerapena';

  @override
  String get securityDelayMessage =>
      'Zure segurtasunerako, itxaron-aldi bat beharrezkoa da PIN berria sortu baino lehen.';

  @override
  String get timeRemaining => 'Geratzen den denbora';

  @override
  String get messagesDeletedForProtection =>
      'Zure mezuak ezabatu dira zure babeserako.';

  @override
  String get canCloseApp => 'Aplikazioa itxi dezakezu eta geroago itzuli.';

  @override
  String get onboardingTitle1 => 'Ongi etorri Hash-era';

  @override
  String get onboardingSubtitle1 => 'Arrastorik uzten ez duen mezularia';

  @override
  String get onboardingTitle2 => 'Enkriptazio osoa';

  @override
  String get onboardingSubtitle2 =>
      'Zure mezuak muturretik muturrera enkriptatuta daude Signal Protocol-ekin';

  @override
  String get onboardingTitle3 => 'Arrastorik ez';

  @override
  String get onboardingSubtitle3 =>
      'Mezuak zerbitzarietatik ezabatzen dira entregatzean';

  @override
  String get onboardingTitle4 => 'Zure segurtasuna';

  @override
  String get onboardingSubtitle4 =>
      'PIN kodea, Vash modua eta berreskuratze-esaldia';

  @override
  String get getStarted => 'Hasi';

  @override
  String get next => 'Hurrengoa';

  @override
  String get skip => 'Saltatu';

  @override
  String get alreadyHaveAccount => 'Dagoeneko kontua daukat';

  @override
  String get transferMyAccount => 'Transferitu nire kontua';

  @override
  String get createPin => 'Sortu PIN kodea';

  @override
  String get createPinSubtitle =>
      'Kode honek zure aplikaziorako sarbidea babestuko du';

  @override
  String get confirmYourPin => 'Berretsi zure PIN kodea';

  @override
  String get confirmPinSubtitle => 'Sartu berriro zure PIN kodea';

  @override
  String get saveRecoveryPhrase => 'Berreskuratze-esaldia';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Idatzi 24 hitz hauek ordenan. Zure kontua berreskuratzeko aukera emango dizute PIN-a ahazten baduzu.';

  @override
  String get phraseWritten => 'Nire esaldia idatzi dut';

  @override
  String get warningRecoveryPhrase =>
      'Esaldi hau galtzen baduzu eta PIN-a ahazten baduzu, zure konturako sarbidea galduko duzu.';

  @override
  String get accountTransferred => 'Kontua transferituta';

  @override
  String get accountTransferredMessage =>
      'Zure kontua beste gailu batera transferitu da. Saio hau jada ez da baliozkoa.';

  @override
  String get accountTransferredInfo =>
      'Transferentzia hau zuk hasi ez baduzu, zure kontua arriskuan egon daiteke.';

  @override
  String get logout => 'Saioa itxi';

  @override
  String get transferAccount => 'Transferitu kontua';

  @override
  String get transferAccountInfo =>
      'Transferitu zure Hash kontua gailu berri batera. Zure oraingo saioa baliogabetuko da.';

  @override
  String get generateTransferCode => 'Sortu transferentzia-kodea';

  @override
  String get transferCode => 'Transferentzia-kodea';

  @override
  String transferCodeExpires(int minutes) {
    return 'Kode honek $minutes minututan iraungitzen du';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Sartu kode hau zure gailu berrian kontua transferitzeko.';

  @override
  String get generateNewCode => 'Sortu kode berria';

  @override
  String get scanQrCode => 'Eskaneatu QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Eskaneatu kontaktu baten QR code-a gehitzeko';

  @override
  String get qrCodeDetected => 'QR code detektatuta';

  @override
  String get invalidQrCode => 'QR code baliogabea';

  @override
  String get cameraPermissionRequired => 'Kameraren baimena beharrezkoa da';

  @override
  String get myQrCode => 'Nire QR code';

  @override
  String get myQrCodeSubtitle =>
      'Partekatu QR code hau zure kontaktuek zu gehitu ahal izateko';

  @override
  String get shareQrCode => 'Partekatu';

  @override
  String get addContactTitle => 'Gehitu kontaktua';

  @override
  String get addContactByHashId => 'Sartu zure kontaktuaren Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Bilatu';

  @override
  String get contactNotFound => 'Kontaktua ez da aurkitu';

  @override
  String get contactAlreadyAdded =>
      'Kontaktu hau dagoeneko zure zerrendan dago';

  @override
  String get contactAdded => 'Kontaktua gehituta';

  @override
  String get myProfile => 'Nire profila';

  @override
  String get myProfileSubtitle =>
      'Partekatu informazio hau besteek zu gehitu ahal izateko';

  @override
  String get temporaryCode => 'Aldi baterako kodea';

  @override
  String temporaryCodeExpires(String time) {
    return '$time-n iraungitzen da';
  }

  @override
  String get codeExpired => 'Kodea iraungi da';

  @override
  String get generateNewCodeButton => 'Kode berria';

  @override
  String get copyHashId => 'Kopiatu ID';

  @override
  String get copyCode => 'Kopiatu kodea';

  @override
  String get copiedToClipboard => 'Kopiatuta';

  @override
  String get showMyQrCode => 'Erakutsi nire QR code';

  @override
  String get orDivider => 'edo';

  @override
  String get openScanner => 'Ireki eskanerra';

  @override
  String get addManually => 'Gehitu eskuz';

  @override
  String get contactHashIdLabel => 'Kontaktuaren Hash ID';

  @override
  String get temporaryCodeLabel => 'Aldi baterako kodea';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Eskatu zure kontaktuari kodea bere profiletik sortzeko';

  @override
  String get verifyAndAdd => 'Egiaztatu eta gehitu';

  @override
  String get fillAllFields => 'Bete eremu guztiak';

  @override
  String get invalidHashIdFormat =>
      'ID formatu baliogabea (adib.: 123-456-ABC)';

  @override
  String get userNotFound => 'Erabiltzailea ez da aurkitu';

  @override
  String get cannotAddYourself => 'Ezin duzu zure burua gehitu';

  @override
  String get invalidOrExpiredCode =>
      'Aldi baterako kode baliogabea edo iraungitua';

  @override
  String get contactFound => 'Kontaktua aurkituta!';

  @override
  String get howToCallContact => 'Nola nahi duzu deitzea?';

  @override
  String get contactNameHint => 'Kontaktuaren izena';

  @override
  String get addContactButton => 'Gehitu';

  @override
  String get contactDetails => 'Kontaktuaren xehetasunak';

  @override
  String get contactName => 'Kontaktuaren izena';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date-(e)an gehituta';
  }

  @override
  String get deleteContact => 'Ezabatu kontaktua';

  @override
  String deleteContactConfirm(Object name) {
    return 'Kontaktu hau ezabatu?';
  }

  @override
  String get deleteContactMessage => 'Honek txat osoa ere ezabatuko du.';

  @override
  String get delete => 'Ezabatu';

  @override
  String get typeMessage => 'Idatzi mezua...';

  @override
  String get messageSent => 'Bidalita';

  @override
  String get messageDelivered => 'Entregatuta';

  @override
  String get messageRead => 'Irakurrita';

  @override
  String get messageFailed => 'Bidalketa huts egin du';

  @override
  String get now => 'Orain';

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
    return '${count}e';
  }

  @override
  String get today => 'Gaur';

  @override
  String get yesterday => 'Atzo';

  @override
  String dateAtTime(String date, String time) {
    return '$date $time-(e)tan';
  }

  @override
  String get shareMessage =>
      'Batu niri Hash-en! Egiazko mezu pribatua da: enkriptazio osoa, arrastorik zerbitzarietan ez eta izubide-modua behar izanez gero.\n\nDeskargatu aplikazioa hemen\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Errorea';

  @override
  String get ok => 'Ados';

  @override
  String get view => 'Ikusi';

  @override
  String get yes => 'Bai';

  @override
  String get no => 'Ez';

  @override
  String get save => 'Gorde';

  @override
  String get edit => 'Editatu';

  @override
  String get close => 'Itxi';

  @override
  String get confirm => 'Berretsi';

  @override
  String get loading => 'Kargatzen...';

  @override
  String get retry => 'Saiatu berriro';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Zain dauden eskaerak';

  @override
  String get noPendingRequests => 'Zain dagoen eskaera';

  @override
  String get pendingRequestsSubtitle =>
      'Pertsona hauek zu gehitu nahi zaituzte';

  @override
  String requestFromUser(String hashId) {
    return '$hashId-(r)en eskaera';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days egunetan iraungitzen da';
  }

  @override
  String get acceptRequest => 'Onartu';

  @override
  String get rejectRequest => 'Ukatu';

  @override
  String get requestAccepted => 'Eskaera onartuta';

  @override
  String get requestRejected => 'Eskaera ukatuta';

  @override
  String get requestSent => 'Eskaera bidalita!';

  @override
  String get requestSentSubtitle =>
      'Zure eskaera bidali da. Erabiltzaileak onartu behar du txateatzen hasi baino lehen.';

  @override
  String get requestAlreadyPending => 'Eskaera bat dagoeneko zain dago';

  @override
  String get requestAlreadySentByOther =>
      'Pertsona honek dagoeneko eskaera bat bidali dizu';

  @override
  String get addByHashId => 'Gehitu Hash ID bidez';

  @override
  String get addByHashIdSubtitle =>
      'Sartu kontaktuaren Hash ID eta aldi baterako kodea';

  @override
  String get enterTemporaryCode => 'Sartu 6 digituko kodea';

  @override
  String get sendRequest => 'Bidali eskaera';

  @override
  String get acceptContactTitle => 'Onartu kontaktua';

  @override
  String get acceptContactSubtitle =>
      'Izen pertsonalizatu bat eman diezaiekezu';

  @override
  String get leaveEmptyForHashId => 'Utzi hutsik Hash ID erabiltzeko';

  @override
  String get firstName => 'Izena';

  @override
  String get lastName => 'Abizena';

  @override
  String get notes => 'Oharrak';

  @override
  String get notesHint => 'Ohar pertsonalak kontaktu honi buruz';

  @override
  String get photoOptional => 'Argazkia (aukerakoa)';

  @override
  String get contactNameOptional => 'Izena (aukerakoa)';

  @override
  String get notesOptional => 'Oharrak (aukerakoa)';

  @override
  String get storedLocally => 'Zure gailuan bakarrik gordeta';

  @override
  String get encryptedMessageLabel => 'Mezu enkriptatua';

  @override
  String get identityMessageHint => 'Nor zara? Nola ezagutzen zarete?';

  @override
  String get messageWillBeSentEncrypted =>
      'Mezu hau enkriptatu eta hartzaileari bidaliko zaio';

  @override
  String get sendRequestButton => 'Bidali eskaera';

  @override
  String get requestExpiresIn24h =>
      'Eskaera 24 ordutan iraungitzen da onartzen ez bada';

  @override
  String get theyAlreadySentYouRequest =>
      'Pertsona honek dagoeneko eskaera bat bidali dizu';

  @override
  String get requests => 'Eskaerak';

  @override
  String get receivedRequests => 'Jasotakoak';

  @override
  String get sentRequests => 'Bidalitakoak';

  @override
  String get noSentRequests => 'Bidalitako eskaerarik ez';

  @override
  String get cancelRequest => 'Utzi';

  @override
  String get deleteRequest => 'Ezabatu eskaera';

  @override
  String get requestCancelled => 'Eskaera bertan behera utzita';

  @override
  String sentTo(String hashId) {
    return '$hashId-(r)i bidalita';
  }

  @override
  String expiresIn(String time) {
    return '$time-n iraungitzen da';
  }

  @override
  String receivedAgo(String time) {
    return 'Duela $time jasota';
  }

  @override
  String get messageFromRequester => 'Eskatzailearen mezua';

  @override
  String get copy => 'Kopiatu';

  @override
  String get messageInfo => 'Mezuaren informazioa';

  @override
  String get messageDirection => 'Norabidea';

  @override
  String get messageSentByYou => 'Zuk bidalita';

  @override
  String get messageReceived => 'Jasota';

  @override
  String get messageSentAt => 'Bidalita';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Egoera';

  @override
  String get messageReadAt => 'Irakurrita';

  @override
  String get messageType => 'Mota';

  @override
  String get messageSize => 'Tamaina';

  @override
  String get messageExpiresAt => 'Iraungitzen da';

  @override
  String get messageEncrypted => 'Muturretik muturrerako enkriptazioa';

  @override
  String get messageStatusSending => 'Bidaltzen...';

  @override
  String get messageStatusSent => 'Bidalita';

  @override
  String get messageStatusDelivered => 'Entregatuta';

  @override
  String get messageStatusRead => 'Irakurrita';

  @override
  String get messageStatusFailed => 'Huts eginda';

  @override
  String get serverStatus => 'Zerbitzaria';

  @override
  String get onServer => 'Entregaren zain';

  @override
  String get deletedFromServer => 'Ezabatuta';

  @override
  String get messageTypeText => 'Testua';

  @override
  String get messageTypeImage => 'Irudia';

  @override
  String get messageTypeVideo => 'Bideoa';

  @override
  String get messageTypeVoice => 'Ahotsa';

  @override
  String get messageTypeFile => 'Fitxategia';

  @override
  String get indefinitely => 'Mugagabe';

  @override
  String get hoursShort => 'o';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'ordu';

  @override
  String get minutes => 'minutu';

  @override
  String get seconds => 'segundo';

  @override
  String get ephemeralMessages => 'Mezu iragankorrak';

  @override
  String get ephemeralMessagesDescription =>
      'Mezuak automatikoki ezabatzen dira denbora honen ondoren';

  @override
  String get ephemeralImmediate => 'Berehalakoa (irakurri ondoren)';

  @override
  String get ephemeralImmediateDesc => 'Irakurri bezain laster ezabatzen da';

  @override
  String get ephemeralMyPreference => 'Nire lehentasuna';

  @override
  String get ephemeralMyPreferenceDesc => 'Erabili ezarpen orokorra';

  @override
  String get ephemeralDefaultSetting => 'Mezuaren iraupena';

  @override
  String get ephemeralChooseDefault => 'Gomendatua';

  @override
  String get ephemeral30Seconds => '30 segundo';

  @override
  String get ephemeral30SecondsDesc => 'Ezabatua irakurri eta 30s-ra';

  @override
  String get ephemeral5Minutes => '5 minutu';

  @override
  String get ephemeral5MinutesDesc => 'Ezabatua irakurri eta 5min-ra';

  @override
  String get ephemeral1Hour => 'Ordu 1';

  @override
  String get ephemeral1HourDesc => 'Ezabatua irakurri eta 1o-ra';

  @override
  String get ephemeral3Hours => '3 ordu';

  @override
  String get ephemeral6Hours => '6 ordu';

  @override
  String get ephemeral6HoursDesc => 'Ezabatua irakurri eta 6o-ra';

  @override
  String get ephemeral12Hours => '12 ordu';

  @override
  String get ephemeral24Hours => '24 ordu';

  @override
  String get ephemeral24HoursDesc => 'Ezabatua irakurri eta 24o-ra';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Iraupena pertsonalizatua';

  @override
  String get howItWorks => 'Nola funtzionatzen du';

  @override
  String get ephemeralExplanation1 =>
      'Mezuak zerbitzaritik ezabatzen dira jaso bezain laster.';

  @override
  String get ephemeralExplanation2 =>
      'Ezarpen honek ZURE telefonotik mezuak noiz desagertzen diren definitzen du irakurri ondoren.';

  @override
  String get ephemeralExplanation3 =>
      'Zure kontaktuak bere ezarpena du bere telefonorako.';

  @override
  String get mute1Hour => 'Ordu 1';

  @override
  String get mute8Hours => '8 ordu';

  @override
  String get mute1Day => 'Egun 1';

  @override
  String get mute1Week => 'Aste 1';

  @override
  String get muteAlways => 'Beti';

  @override
  String get muteExplanation => 'Ez duzu kontaktu honen jakinarazpenik jasoko';

  @override
  String get showCallsInRecents => 'Azken deietan erakutsi';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash deiak telefonoaren historian agertzen dira';

  @override
  String get feedback => 'Iritzia';

  @override
  String get muteNotifications => 'Isilduta jakinarazpenak';

  @override
  String get muteDescription => 'Ez duzu kontaktu honen jakinarazpenik jasoko';

  @override
  String mutedUntil(String time) {
    return 'Isilduta $time arte';
  }

  @override
  String get notMuted => 'Jakinarazpenak gaituta';

  @override
  String get unmute => 'Desblokeatu soinua';

  @override
  String get notificationSound => 'Jakinarazpen-soinua';

  @override
  String get defaultSound => 'Lehenetsia';

  @override
  String get chatSettings => 'Txataren ezarpenak';

  @override
  String get bubbleColor => 'Burbuilaren kolorea';

  @override
  String get backgroundColor => 'Atzeko kolorea';

  @override
  String get backgroundImage => 'Atzeko irudia';

  @override
  String get chatBackground => 'Txataren atzeko planoa';

  @override
  String get customColor => 'Pertsonalizatua';

  @override
  String get defaultColor => 'Lehenetsia';

  @override
  String get imageSelected => 'Irudia hautatuta';

  @override
  String get noImage => 'Irudirik ez';

  @override
  String get color => 'Kolorea';

  @override
  String get image => 'Irudia';

  @override
  String get tapToSelectImage => 'Sakatu irudia hautatzeko';

  @override
  String get changeImage => 'Aldatu irudia';

  @override
  String get previewMessageReceived => 'Kaixo!';

  @override
  String get previewMessageSent => 'Aupa!';

  @override
  String get messageAction => 'Mezua';

  @override
  String get callAction => 'Deia';

  @override
  String get videoAction => 'Bideoa';

  @override
  String get personalNotes => 'Ohar pertsonalak';

  @override
  String get addNotes => 'Gehitu oharrak...';

  @override
  String get noNotes => 'Oharrik ez';

  @override
  String get messageNotifications => 'Mezu-jakinarazpenak';

  @override
  String get callNotifications => 'Dei-jakinarazpenak';

  @override
  String get useGradient => 'Erabili gradientea';

  @override
  String get gradientStart => 'Hasierako kolorea';

  @override
  String get gradientEnd => 'Amaierako kolorea';

  @override
  String get preview => 'Aurrebista';

  @override
  String get reset => 'Berrezarri';

  @override
  String get securityNumber => 'Segurtasun-zenbakia';

  @override
  String securityNumberDescription(String name) {
    return 'Egiaztatu segurtasun-zenbakia $name-(r)en gailuarekin bat datorrela';
  }

  @override
  String get verifyEncryption =>
      'Egiaztatu muturretik muturrerako enkriptazioa';

  @override
  String get tapToCopy => 'Sakatu kopiatzeko';

  @override
  String get howToVerify => 'Nola egiaztatu';

  @override
  String get verifyStep1 =>
      'Aurrez aurre bildu zure kontaktuarekin edo deitu iezaiozu';

  @override
  String get verifyStep2 =>
      'Konparatu segurtasun-zenbakiak edo eskaneatu QR code-ak';

  @override
  String get verifyStep3 => 'Bat badatoz, zure txata segurua da';

  @override
  String get scanToVerify => 'Eskaneatu egiaztatzeko';

  @override
  String get reportSpam => 'Salatu spam-a';

  @override
  String get reportSpamSubtitle => 'Salatu kontaktu hau spam gisa';

  @override
  String get reportSpamDescription =>
      'Honek kontaktu hau anonimoki salatuko du. Zure identitatea ez da partekatuko. Ziur zaude?';

  @override
  String get report => 'Salatu';

  @override
  String get spamReported => 'Spam-a salatuta';

  @override
  String get reportError => 'Huts egin du salaketa bidaltzean. Saiatu berriro.';

  @override
  String get reportRateLimited => 'Gaurko salaketen muga maximora iritsi zara.';

  @override
  String get blockContact => 'Blokeatu kontaktua';

  @override
  String get blockContactDescription =>
      'Kontaktu honek ezin izango dizu mezurik bidali edo deitu. Ez zaio jakinaraziko.';

  @override
  String get unblockContact => 'Desblokeatu kontaktua';

  @override
  String get unblockContactDescription =>
      'Kontaktu honek berriro mezuak bidali eta deitu ahal izango dizu.';

  @override
  String get contactBlocked => 'Kontaktua blokeatuta';

  @override
  String get contactUnblocked => 'Kontaktua desblokeatuta';

  @override
  String get contactIsBlocked => 'Kontaktu hau blokeatuta dago';

  @override
  String get unblock => 'Desblokeatu';

  @override
  String get deleteContactSubtitle => 'Ezabatu kontaktu hau eta txata';

  @override
  String get confirmWithPin => 'Berretsi PIN-arekin';

  @override
  String get enterPinToConfirm => 'Sartu zure PIN-a ekintza hau berresteko';

  @override
  String get profilePhoto => 'Profilaren argazkia';

  @override
  String get takePhoto => 'Atera argazkia';

  @override
  String get chooseFromGallery => 'Aukeratu galeriatik';

  @override
  String get removePhoto => 'Kendu argazkia';

  @override
  String get viewContactHashId => 'Ikusi kontaktuaren identifikadorea';

  @override
  String get hashIdPartiallyMasked =>
      'Partzialki maskaratua zure segurtasunerako eta zure kontaktuaren pribatutasunerako';

  @override
  String get addFirstContact => 'Gehitu zure lehen kontaktua';

  @override
  String get addFirstContactSubtitle =>
      'Partekatu zure QR code edo eskaneatu lagun batena';

  @override
  String get directory => 'Direktorioa';

  @override
  String get noContacts => 'Kontakturik ez';

  @override
  String get noContactsSubtitle => 'Gehitu kontaktu bat hasteko';

  @override
  String get sendMessageAction => 'Bidali mezua';

  @override
  String get audioCall => 'Audio-deia';

  @override
  String get videoCall => 'Bideo-deia';

  @override
  String get viewProfile => 'Ikusi profila';

  @override
  String get deleteContactDirectory => 'Ezabatu kontaktua';

  @override
  String get scanShort => 'Eskaneatu';

  @override
  String get addShort => 'Gehitu';

  @override
  String deleteContactConfirmName(String name) {
    return 'Ziur $name ezabatu nahi duzula?';
  }

  @override
  String get noNotesTitle => 'Oharrik ez';

  @override
  String get noNotesSubtitle => 'Sortu zure lehen oharra';

  @override
  String get newNote => 'Ohar berria';

  @override
  String get editNote => 'Editatu oharra';

  @override
  String get deleteNote => 'Ezabatu oharra';

  @override
  String get deleteNoteConfirm => 'Ziur ohar hau ezabatu nahi duzula?';

  @override
  String get noteTitle => 'Izenburua';

  @override
  String get noteContent => 'Edukia';

  @override
  String get addItem => 'Gehitu elementua';

  @override
  String get pinNote => 'Finkatu';

  @override
  String get unpinNote => 'Desfinkatu';

  @override
  String get noteColor => 'Kolorea';

  @override
  String get notePassword => 'Pasahitza';

  @override
  String get setPassword => 'Ezarri pasahitza';

  @override
  String get changePassword => 'Aldatu pasahitza';

  @override
  String get removePassword => 'Kendu pasahitza';

  @override
  String get enterPassword => 'Sartu pasahitza';

  @override
  String get confirmPassword => 'Berretsi pasahitza';

  @override
  String get passwordPin => 'PIN kodea';

  @override
  String get passwordText => 'Testu-pasahitza';

  @override
  String get protectedNote => 'Ohar babestua';

  @override
  String get incorrectPassword => 'Pasahitz okerra';

  @override
  String get passwordSet => 'Pasahitza ezarrita';

  @override
  String get passwordRemoved => 'Pasahitza kenduta';

  @override
  String get notesBiometric => 'Face ID oharretarako';

  @override
  String get notesBiometricSubtitle =>
      'Eskatu autentifikazio biometrikoa ohar babestuak irekitzeko';

  @override
  String get textNote => 'Testu-oharra';

  @override
  String get checklistNote => 'Egiaztapen-zerrenda';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total zeregin';
  }

  @override
  String get autoSaved => 'Gordeta';

  @override
  String get searchNotes => 'Bilatu oharrak';

  @override
  String get legalConsent => 'Lege-adostasuna';

  @override
  String get confirmAge13 => 'Gutxienez 13 urte ditudala baieztatzen dut';

  @override
  String get acceptLegalStart => 'Onartzen dut ';

  @override
  String get privacyPolicy => 'Pribatutasun Politika';

  @override
  String get termsOfService => 'Erabilera Baldintzak';

  @override
  String get andThe => ' eta ';

  @override
  String get continueButton => 'Jarraitu';

  @override
  String get mustAcceptTerms => 'Bi baldintzak onartu behar dituzu jarraitzeko';

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
  String get support => 'Laguntza';

  @override
  String get contactSupport => 'Jarri harremanetan laguntzarekin';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Salatu abusua';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Legala';

  @override
  String get legalEntity => 'Entitate legala';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Finkatu';

  @override
  String get unpinConversation => 'Desfinkatu';

  @override
  String get hideConversation => 'Kendu jario-tik';

  @override
  String get deleteConversation => 'Ezabatu elkarrizketa';

  @override
  String get deleteConversationConfirm =>
      'Sartu zure PIN-a mezu guztien ezabatzea berresteko';

  @override
  String get noConversations => 'Oraindik elkarrizketarik ez';

  @override
  String get startConversation => 'Hasi';

  @override
  String get microphonePermissionRequired =>
      'Mikrofonoaren sarbidea beharrezkoa';

  @override
  String get microphonePermissionExplanation =>
      'Hash-ek mikrofonoa behar du deiak egiteko.';

  @override
  String get cameraPermissionExplanation =>
      'Hash-ek kamera behar du bideo-deietarako.';

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
  String get openSettings => 'Ireki ezarpenak';

  @override
  String get callConnecting => 'Konektatzen...';

  @override
  String get callRinging => 'Jotzen...';

  @override
  String get callReconnecting => 'Birkonektatzen...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Birkonektatzen (${seconds}s)';
  }

  @override
  String get callPaused => 'Pausatuta';

  @override
  String get callPausedSubtitle => 'Deia oraindik ere aktiboa da';

  @override
  String get callRemoteMicMuted => 'Kontaktuaren mikrofonoa isilduta dago';

  @override
  String get callMiniControlsMute => 'Isilduta';

  @override
  String get callMiniControlsUnmute => 'Soinua aktibatu';

  @override
  String get callMiniControlsHangUp => 'Eseki';

  @override
  String get callMiniControlsReturn => 'Itzuli deira';

  @override
  String get callNetworkPoor => 'Konexio ezegonkorra';

  @override
  String get callNetworkLost => 'Konexioa galdu da';

  @override
  String get callEndedTitle => 'Deia amaitu da';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Gailuaren datuak';

  @override
  String get deviceDataSubtitle => 'Biltegi lokala eta zerbitzaria';

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
  String get localStorage => 'Biltegi lokala';

  @override
  String get onThisDevice => 'gailu honetan';

  @override
  String get encryptedDatabases => 'Datu-base enkriptatuak';

  @override
  String get files => 'Fitxategiak';

  @override
  String get secureKeychain => 'Gako-kate segurua';

  @override
  String get cache => 'Cachea';

  @override
  String get contactsDetail => 'Izenak, avatarrak, Signal gakoak';

  @override
  String get messagesDetail => 'Elkarrizketa enkriptatuak';

  @override
  String get notesDetail => 'Ohar pertsonalak';

  @override
  String get signalSessions => 'Signal saioak';

  @override
  String get signalSessionsDetail => 'Enkriptazio saioak';

  @override
  String get pendingContacts => 'Zain dauden kontaktuak';

  @override
  String get pendingContactsDetail => 'Zain dauden eskaerak';

  @override
  String get callHistory => 'Deiak';

  @override
  String get callHistoryDetail => 'Dei-historia';

  @override
  String get preferences => 'Lehentasunak';

  @override
  String get preferencesDetail => 'Multimedia eta deien lehentasunak';

  @override
  String get avatars => 'Avatarrak';

  @override
  String get media => 'Multimedia';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fitxategi',
      one: 'fitxategi 1',
      zero: 'fitxategirik ez',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktibo';

  @override
  String get notDefined => 'Ez definitu';

  @override
  String get biometrics => 'Biometrikoak';

  @override
  String get recoveryPhrase => 'Berreskuratze-esaldia';

  @override
  String get identity => 'Identitatea (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol gakoak';

  @override
  String get authTokens => 'Autentifikazio tokenak';

  @override
  String get contactNamesCache => 'Kontaktu-izenen cachea';

  @override
  String get remoteConfig => 'Urruneko konfigurazioa';

  @override
  String get notificationPrefs => 'Jakinarazpen-lehentasunak';

  @override
  String get serverData => 'Zerbitzariaren datuak';

  @override
  String get serverDataInfo =>
      'Hash-ek gutxieneko datuak gordetzen ditu zerbitzarian, guztiak enkriptatuta edo aldi baterakoak.';

  @override
  String get serverProfile => 'Profila';

  @override
  String get serverProfileDetail =>
      'Hash ID, gako publikoak, postontziaren tokena';

  @override
  String get serverPrekeys => 'Aurre-gakoak';

  @override
  String get serverPrekeysDetail =>
      'Erabilera bakarreko Signal gakoak (kontsumituta)';

  @override
  String get serverMessages => 'Bidean dauden mezuak';

  @override
  String get serverMessagesDetail =>
      'Entregaren ondoren ezabatzen dira (max 24o)';

  @override
  String get serverMedia => 'Bidean dagoen multimedia';

  @override
  String get serverMediaDetail => 'Deskargaren ondoren ezabatzen da';

  @override
  String get serverContactRequests => 'Kontaktu-eskaerak';

  @override
  String get serverContactRequestsDetail => '24 ordutan iraungitzen dira';

  @override
  String get serverRateLimits => 'Tasa-mugak';

  @override
  String get serverRateLimitsDetail => 'Aldi baterako anti-abusu datuak';

  @override
  String get privacyReassurance =>
      'Hash-ek ezin ditu zure mezuak irakurri. Datu guztiak muturretik muturrera enkriptatuta daude. Zerbitzariaren datuak automatikoki ezabatzen dira.';

  @override
  String get pinTooSimple =>
      'PIN hau sinpleegia da. Aukeratu kode seguruago bat.';

  @override
  String get genericError => 'Errore bat gertatu da. Saiatu berriro.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Ezin da kontua sortu: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Esaldia arbelera kopiatuta';

  @override
  String get copyPhrase => 'Kopiatu esaldia';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Idatzi esaldi hau leku seguru batean. PIN-a esaldi hau gabe galtzen baduzu, betirako galduko duzu zure datuetarako sarbidea.';

  @override
  String get noMessages => 'Mezurik ez';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name-(r)ekin mezu guztiak ezabatu?';
  }

  @override
  String get confirmation => 'Berrespena';

  @override
  String get untitled => 'Izenbururik gabe';

  @override
  String get noSessions => 'Saiorik ez';

  @override
  String get unknownContact => 'Kontaktu ezezaguna';

  @override
  String get unnamed => 'Izenik gabe';

  @override
  String get noPendingRequestsAlt => 'Zain dagoen eskaerarik ez';

  @override
  String get deleteAllCallHistory => 'Dei-historia osoa ezabatu?';

  @override
  String get noCalls => 'Deirik ez';

  @override
  String get noPreferences => 'Lehentasunik ez';

  @override
  String get resetAllMediaPrefs => 'Multimedia lehentasun guztiak berrezarri?';

  @override
  String get deleteThisAvatar => 'Avatar hau ezabatu?';

  @override
  String get deleteAllAvatars => 'Avatar guztiak ezabatu?';

  @override
  String get noAvatars => 'Avatarrik ez';

  @override
  String get deleteThisFile => 'Fitxategi hau ezabatu?';

  @override
  String get deleteAllMediaFiles => 'Multimedia guztia ezabatu?';

  @override
  String get noMediaFiles => 'Multimediarik ez';

  @override
  String get outgoing => 'Irteerako';

  @override
  String get incoming => 'Sarrerako';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Aldi baterako ikuspegia: ${seconds}s';
  }

  @override
  String get normalView => 'Ikuspegi normala';

  @override
  String get callReasonCompleted => 'Osatua';

  @override
  String get callReasonMissed => 'Galdua';

  @override
  String get callReasonDeclined => 'Baztertua';

  @override
  String get callReasonFailed => 'Huts eginda';

  @override
  String get justNow => 'Oraintxe';

  @override
  String timeAgoMinutes(int count) {
    return 'Duela $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Duela ${count}o';
  }

  @override
  String timeAgoDays(int count) {
    return 'Duela ${count}e';
  }

  @override
  String get messageTypeContact => 'Kontaktua';

  @override
  String get messageTypeLocation => 'Kokapena';

  @override
  String get statusQueued => 'Ilaran';

  @override
  String get blockedBadge => 'Blokeatuta';

  @override
  String get protectedBadge => 'Babestuta';

  @override
  String messageCount(int count) {
    return '$count mezu';
  }

  @override
  String get deleteQuestion => 'Ezabatu?';

  @override
  String get transferMyAccountTitle => 'Transferitu nire kontua';

  @override
  String get loadingError => 'Karga-errorea';

  @override
  String get transferToNewDevice => 'Transferitu gailu berri batera';

  @override
  String get transferInstructions =>
      'Zure gailu berrian, aukeratu \"Berreskuratu nire kontua\" eta sartu informazio hau:';

  @override
  String get yourHashIdLabel => 'Zure Hash ID';

  @override
  String get enterYourPinCode => 'Sartu zure PIN kodea';

  @override
  String get pinOwnerConfirmation => 'Kontu honen jabea zarela berresteko';

  @override
  String get scanThisQrCode => 'Eskaneatu QR code hau';

  @override
  String get withYourNewDevice => 'Zure gailu berriarekin';

  @override
  String get orEnterTheCode => 'edo sartu kodea';

  @override
  String get transferCodeLabel => 'Transferentzia-kodea';

  @override
  String get proximityVerification => 'Hurbiltasun-egiaztapena';

  @override
  String get bringDevicesCloser => 'Hurbildu bi gailuak';

  @override
  String get confirmTransferQuestion => 'Berretsi transferentzia?';

  @override
  String get accountWillBeTransferred =>
      'Zure kontua gailu berrira transferituko da.\n\nGailu hau betirako deskonektatuko da.';

  @override
  String get transferComplete => 'Transferentzia osatuta';

  @override
  String get transferSuccessMessage =>
      'Zure kontua arrakastaz transferitu da.\n\nAplikazioa itxiko da orain.';

  @override
  String get manualVerification => 'Eskuzko egiaztapena';

  @override
  String get codeDisplayedOnBothDevices => 'Bi gailuetan erakusten den kodea:';

  @override
  String get doesCodeMatchNewDevice =>
      'Kode honek bat al dator gailu berrian dagoenarekin?';

  @override
  String get verifiedStatus => 'Egiaztatuta';

  @override
  String get inProgressStatus => 'Abian...';

  @override
  String get notAvailableStatus => 'Ez dago eskuragarri';

  @override
  String get codeExpiredRestart => 'Kodea iraungi da. Hasi berriro.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kodeak ez datoz bat. Transferentzia bertan behera utzita.';

  @override
  String transferToDevice(String device) {
    return 'Nora: $device';
  }

  @override
  String get copiedExclamation => 'Kopiatuta!';

  @override
  String expiresInTime(String time) {
    return '$time-n iraungitzen da';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrikoak ez daude gailu honetan eskuragarri';

  @override
  String get biometricAuthError => 'Errorea autentifikazio biometrikoan';

  @override
  String get authenticateForBiometric => 'Autentifikatu biometrikoak gaitzeko';

  @override
  String get biometricAuthFailed => 'Autentifikazio biometrikoak huts egin du';

  @override
  String get forceUpdateTitle => 'Eguneratzea beharrezkoa';

  @override
  String get forceUpdateMessage =>
      'Hash-en bertsio berri bat eskuragarri dago. Eguneratu jarraitzeko.';

  @override
  String get updateButton => 'Eguneratu';

  @override
  String get maintenanceInProgress => 'Mantentze-lanak abian';

  @override
  String get tryAgainLater => 'Saiatu berriro geroago';

  @override
  String get information => 'Informazioa';

  @override
  String get later => 'Geroago';

  @override
  String get doYouLikeHash => 'Hash gustuko duzu?';

  @override
  String get yourFeedbackHelps =>
      'Zure iritziak aplikazioa hobetzen laguntzen digu';

  @override
  String get ratingTerrible => 'Izugarria';

  @override
  String get ratingBad => 'Txarra';

  @override
  String get ratingOk => 'Ondo';

  @override
  String get ratingGood => 'Ona';

  @override
  String get ratingExcellent => 'Bikaina!';

  @override
  String get donationMessage =>
      'Hash irabazi-asmorik gabeko proiektua da. Zure laguntzak benetan pribatua den mezulari bat eraikitzen jarraitzen laguntzen digu.';

  @override
  String get recentConnections => 'Azken konexioak';

  @override
  String get loginInfoText =>
      'PIN bidezko desblokeoa lokalean gordetzen da. Azken 24 orduak soilik gordetzen dira.';

  @override
  String get connectionCount => 'Konexio(ak)';

  @override
  String get periodLabel => 'Aldia';

  @override
  String get historyLabel => 'Historia';

  @override
  String get noLoginRecorded => 'Ez da saioa hasierarik erregistratu';

  @override
  String get nextUnlocksAppearHere =>
      'Hurrengo desblokeatuak hemen agertuko dira.';

  @override
  String get dataLocalOnly =>
      'Datu hauek zure gailuan bakarrik gordetzen dira eta ez dira inoiz transmititzen.';

  @override
  String get currentSession => 'Unekoa';

  @override
  String get todayLabel => 'Gaur';

  @override
  String get yesterdayLabel => 'Atzo';

  @override
  String get justNowLabel => 'Oraintxe';

  @override
  String minutesAgoLabel(int count) {
    return 'Duela $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Duela ${hours}o';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Duela ${hours}o ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Mantentze-lanik ez dago aurreikusia';

  @override
  String get everythingWorkingNormally => 'Dena normaltasunez funtzionatzen du';

  @override
  String get maintenanceTitle => 'Mantentze-lanak';

  @override
  String get maintenanceActiveLabel => 'ABIAN';

  @override
  String get maintenancePlannedLabel => 'AURREIKUSITA';

  @override
  String get locking => 'Blokeatzen...';

  @override
  String get newMessageNotification => 'Mezu berria';

  @override
  String get secExplainTitle => 'Nola babesten zaitu Hash-ek';

  @override
  String get secExplainIntro =>
      'Hash diseinatuta dago inork zure mezuak irakurri ez ditzan.';

  @override
  String get secExplainIntroSub =>
      'Guk ere ez.\nHona hemen nola funtzionatzen duen, modu sinplean azalduta.';

  @override
  String get secJourneyLabel => 'BIDAIA';

  @override
  String get secJourneyTitle => 'Zure mezuaren bidaia';

  @override
  String get secJourneySubtitle =>
      'Zure hatzetik kontaktuaren pantailara, urrats bakoitza babestuta dago. Jarraitu bidea.';

  @override
  String get secStep1Title => 'Zure mezua idazten duzu';

  @override
  String get secStep1Desc =>
      '\"Kaixo!\" idazten duzu aplikazioan. Momentu honetan, mezua zure telefonoaren memorian bakarrik existitzen da. Ezer ez da bidali.';

  @override
  String get secStep2Title => 'Enkriptazioa Signal Protocol-ekin';

  @override
  String get secStep2Desc =>
      '\"Bidali\" sakatu bezain laster, zure mezua ulertezinezko karaktere-kate batean bihurtzen da. Zure mezua gako-kutxa batean sartu eta zure kontaktuak bakarrik duela gakoa bezala da.';

  @override
  String get secStep3Title => 'Sealed Sender: ikusezinezko gutun-azala';

  @override
  String get secStep3Desc =>
      'Imajinatu gutun bat bidaltzen itzulera-helbiderik gabe gutun-azalean. Hori da zehazki Hash-ek egiten duena. Mezua postontzi anonimo batean uzten da. Zerbitzariak ez daki nork bidali duen.';

  @override
  String get secStep4Title => 'Zerbitzariak ezer ikusten ez du';

  @override
  String get secStep4Desc =>
      'Zerbitzariak kartero itsu gisa jarduten du. Bakarrik badaki \"norbaitek zerbait utzi du #A7X9 postontzia\". Ez daki nork bidali zuen, zer den, edo norentzat den.';

  @override
  String get secStep4Highlight =>
      'Metadaturik ez da gordetzen: IP helbiderik ez, denbora-zigilurik ez, bidaltzaile eta hartzaileen arteko loturarik ez.';

  @override
  String get secStep5Title => 'Zure kontaktuak mezua jasotzen du';

  @override
  String get secStep5Desc =>
      'Zure kontaktuaren telefonoak edukia bere postontzi anonimotik eskuratzen du eta mezua bere gako pribatuarekin deszifratzen du, gailutik inoiz atera ez dena. \"Kaixo!\" pantailan agertzen da.';

  @override
  String get secStep6Title => 'Mezua zerbitzaritik desagertzen da';

  @override
  String get secStep6Desc =>
      'Zure kontaktuak jasotze-agiria berretsi bezain laster, zerbitzariak mezua betirako ezabatzen du. Zakarrontzirik ez, artxiborik ez, babeskopiarik ez. Irakurri gabeko mezuak ere automatikoki suntsitzen dira 24 orduren buruan.';

  @override
  String get secStep7Title => 'Tokiko iraungitzea';

  @override
  String get secStep7Desc =>
      'Zure kontaktuaren telefonoan, mezua auto-suntsitzen da aukeratu duzun iraupenaren arabera: irakurri ondoren berehala, 5 minutu, ordu 1... zuk erabakitzen duzu.';

  @override
  String get secJourneyConclusion =>
      'Emaitza: zero arrasto zerbitzarian, zero arrasto gailuetan. Mezua irakurtzeko behar adinako denboran existitu zen, eta gero desagertu egin zen.';

  @override
  String get secArchLabel => 'ARKITEKTURA';

  @override
  String get secArchTitle => 'Babesaren 5 geruza';

  @override
  String get secArchSubtitle =>
      'Hash-ek ez du teknologia bakar batean oinarritzen. Geruza bakoitzak besteak indartzen ditu. Geruza bat arriskuan jarri arren, zure datuak seguru mantendu egiten dira.';

  @override
  String get secLayer1Title => 'Muturretik muturrerako enkriptazioa';

  @override
  String get secLayer1Desc =>
      'Mezu bakoitza gako bakar batekin enkriptatzen da. Modu sinplean: mezu bat deszifratzea lortzen bada ere, ezin izango da hurrengoa deszifratu. Mezu bakoitzak bere sarraila du.';

  @override
  String get secLayer1Detail =>
      'Fitxategietarako (argazkiak, bideoak, dokumentuak), Hash-ek AES-256-GCM enkriptazio gehigarria erabiltzen du. Fitxategia enkriptatzen da zure telefonotik atera baino lehen.';

  @override
  String get secLayer2Title => 'Sealed Sender (sarearen anonimotasuna)';

  @override
  String get secLayer2Desc =>
      'Ohiko mezulariek zure identitatearekin bidaltzen dituzte zure mezuak. Gutun-azalean zure izena idaztea bezala da. Hash-ek postontzi anonimoak erabiltzen ditu: zerbitzariak mezua entregatzen du nork bidali duen jakin gabe.';

  @override
  String get secLayer2Detail =>
      'Emaitza: zerbitzariaren datu-filtrazio baten kasuan ere, ezinezkoa da nork norekin hitz egiten duen berreraikitzea.';

  @override
  String get secLayer3Title => 'Ezabatze automatikoa';

  @override
  String get secLayer3Desc =>
      'Mezuak zerbitzaritik ezabatzen dira jasotze-agiria berretsi bezain laster. Mezu bat inoiz eskuratzen ez bada ere, automatikoki suntsitzen da 24 orduren ondoren.';

  @override
  String get secLayer3Detail =>
      'Zure telefonoan, mezuak auto-suntsitzen dira aukeratu duzun iraupenaren arabera: berehala, 5 min, 15 min, 30 min, 1o, 3o, 6o edo 12o.';

  @override
  String get secLayer4Title => 'Tokiko sarbidearen babesa';

  @override
  String get secLayer4Desc =>
      'Aplikazioa 6 digituko PIN batekin eta/edo biometrikoekin (Face ID, hatz-marka) babestuta dago. Saiakera huts gehiegi ondoren, aplikazioak blokeo-aldi handiagoarekin blokeatzen du porrot bakoitzaren ondoren.';

  @override
  String get secLayer5Title => 'Blokeatutako datu-basea';

  @override
  String get secLayer5Desc =>
      'Zerbitzariaren aldean, ez dago erabiltzaileak zuzenean datu-basean idatzi dezakeenik. Ekintza guztiak eskaera bakoitza egiaztatzen duten funtzio seguruen bidez pasatzen dira.';

  @override
  String get secLayer5Detail =>
      'Banku-leihatila bat bezalakoa da: zu ez duzu inoiz gordailua ukitzen. Eskaera bat egiten duzu, eta sistemak egiaztatzen du eskubidea duzula ekin baino lehen.';

  @override
  String get secVashLabel => 'MUNDUAN BAKARRA';

  @override
  String get secVashTitle => 'Vash modua';

  @override
  String get secVashSubtitle =>
      'Larrialdiko segurtasun-sistema bat, beste inongo mezu-aplikaziotan existitzen ez dena.';

  @override
  String get secVashScenarioTitle => 'Imajinatu egoera hau';

  @override
  String get secVashScenario1 => 'Norbaitek zure telefonora sarbidea lortu du';

  @override
  String get secVashScenario2 => 'Zure PIN kodea eskatzen dizute';

  @override
  String get secVashScenario3 =>
      'Zure datu guztiak urgentziaz ezabatu nahi dituzu';

  @override
  String get secVashSolutionTitle => 'Irtenbidea: bi PIN kode';

  @override
  String get secVashSolutionDesc =>
      'Bi PIN kode ezberdin konfiguratzen dituzu Hash-en:';

  @override
  String get secVashNormalCodeLabel => 'Kode normala';

  @override
  String get secVashNormalCodeDesc =>
      'Aplikazioa normaltasunez irekitzen du zure datu guztiekin';

  @override
  String get secVashCodeLabel2 => 'Vash kodea';

  @override
  String get secVashCodeDescription =>
      'Aplikazioa normaltasunez irekitzen du... baina zure datu guztiak isil-isilik ezabatzen dira atzeko planoan';

  @override
  String get secVashWhatHappensTitle => 'Zer gertatzen den ondoren';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikazioa normaltasunez irekitzen da. Alertarik ez, animazio susmagarririk ez. Pantailak aplikazio huts bat erakusten du, instalatu berri bazenu bezala.\n\nErrealitatean, zure elkarrizketa, kontaktu eta mezu guztiak itzulezinik ezabatu dira segundo baten frakzio batean.';

  @override
  String get secCallsLabel => 'DEIAK ETA FITXATEGIAK';

  @override
  String get secCallsTitle => 'Dena enkriptatuta dago';

  @override
  String get secCallsSubtitle =>
      'Ez dira mezuak bakarrik. Hash-en zehar igarotzen den absolutuki dena muturretik muturrera enkriptatuta dago.';

  @override
  String get secAudioCallTitle => 'Audio-deiak';

  @override
  String get secAudioCallDesc =>
      'Muturretik muturrera enkriptatuta WebRTC bidez. Ahotsa zuzenean gailuen artean transmititzen da.';

  @override
  String get secVideoCallTitle => 'Bideo-deiak';

  @override
  String get secVideoCallDesc =>
      'Teknologia bera, fluxu bakoitza banaka enkriptatuta.';

  @override
  String get secPhotosTitle => 'Argazkiak eta bideoak';

  @override
  String get secPhotosDesc =>
      'AES-256-GCM-rekin enkriptatuta zure telefonotik atera baino lehen.';

  @override
  String get secDocsTitle => 'Dokumentuak';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, edozein fitxategi. Izena, tamaina eta edukia enkriptatuta.';

  @override
  String get secAnonLabel => 'ANONIMOTASUNA';

  @override
  String get secAnonTitle => 'Identitaterik ez da beharrezkoa';

  @override
  String get secAnonSubtitle =>
      'Hash-ek ez dizu inoiz zure telefono-zenbakia edo emaila eskatzen. Hash ID bakar eta anonimo baten bidez identifikatzen zaitu.';

  @override
  String get secHashIdTitle => 'Zure Hash ID';

  @override
  String get secHashIdDesc =>
      'Hau da zure identifikatzaile bakarra. Ez du zuregainean ezer agertzen: ez zure izena, ez zure zenbakia, ez zure kokapena. Zure benetako identitatearekin lotzea ezinezkoa den ezizen bat bezala da.\n\nKontaktu bat gehitzeko, zure Hash ID partekatzen duzu edo QR code bat eskaneatzen duzu. Hori da dena. Sinkronizatutako helbide-libururik ez, \"Agian ezagutzen dituzun pertsonak\" gomendiorik ez.';

  @override
  String get secDataLabel => 'DATUAK';

  @override
  String get secDataTitle => 'Zer ez dakien Hash-ek';

  @override
  String get secDataSubtitle =>
      'Zure datuak babesteko modurik hoberena da ez biltzea.';

  @override
  String get secNeverCollected => 'Inoiz ez dira biltzen';

  @override
  String get secNeverItem1 => 'Mezuen edukia';

  @override
  String get secNeverItem2 => 'Kontaktu-zerrenda';

  @override
  String get secNeverItem3 => 'Telefono-zenbakia';

  @override
  String get secNeverItem4 => 'Email helbidea';

  @override
  String get secNeverItem5 => 'IP helbidea';

  @override
  String get secNeverItem6 => 'Kokapena';

  @override
  String get secNeverItem7 => 'Metadatuak (nork norekin hitz egiten duen)';

  @override
  String get secNeverItem8 => 'Dei-historia';

  @override
  String get secNeverItem9 => 'Helbide-liburua';

  @override
  String get secNeverItem10 => 'Iragarki-identifikatzaileak';

  @override
  String get secTempStored => 'Aldi baterako gordeta';

  @override
  String get secTempItem1 => 'Hash ID anonimoa (identifikatzaile bakarra)';

  @override
  String get secTempItem2 => 'Enkriptazio gako publikoak';

  @override
  String get secTempItem3 => 'Bidean dauden mezu enkriptatuak (max 24o)';

  @override
  String get secTempNote =>
      'Gutxieneko datu hauek ere ezin zaituzte identifikatu. Zure Hash ID ez dago informazio pertsonalekin lotuta.';

  @override
  String get secFooterTitle => 'Zure pribatutasuna, zure askatasuna';

  @override
  String get secFooterDesc =>
      'Hash-ek aplikazio profesional zorrotzenek erabiltzen dituzten enkriptazio-teknologia berak erabiltzen ditu. Zure mezuak matematikak babesten ditu, ez promesek.';

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
