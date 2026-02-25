// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Nulova stopa. Nulovy kompromis.';

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
  String get conversations => 'Konverzacie';

  @override
  String get contacts => 'Kontakty';

  @override
  String get noConversation => 'Ziadne konverzacie';

  @override
  String get noConversationSubtitle =>
      'Pridajte kontakt a zacnite bezpecne komunikovat';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cakajucich ziadosti',
      one: '1 cakajuca ziadost',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odoslanych ziadosti caka',
      one: '1 odoslana ziadost caka',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Pridat kontakt';

  @override
  String get shareApp => 'Zdielat aplikaciu';

  @override
  String get newMessage => 'Nova sprava';

  @override
  String get newConversation => 'Poslat spravu';

  @override
  String get settings => 'Nastavenia';

  @override
  String get myHashId => 'Moje Hash ID';

  @override
  String get supportHash => 'Podporit Hash';

  @override
  String get supportHashSubtitle => 'Hash je neziskovy projekt';

  @override
  String get donate => 'Darovat';

  @override
  String get appearance => 'Vzhled';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automaticky';

  @override
  String get themeAutoSubtitle => 'Nasleduje systemove nastavenia';

  @override
  String get themeDark => 'Tmava';

  @override
  String get themeLight => 'Svetla';

  @override
  String get themeRecommendation =>
      'Tmava tema je odporucana pre lepsie sukromie';

  @override
  String get language => 'Jazyk';

  @override
  String get languageAuto => 'Automaticky (system)';

  @override
  String get notifications => 'Notifikacie';

  @override
  String get messages => 'Spravy';

  @override
  String get calls => 'Hovory';

  @override
  String get vibration => 'Vibracie';

  @override
  String get notificationContent => 'Obsah notifikacie';

  @override
  String get notificationContentFull => 'Zobrazit vsetko';

  @override
  String get notificationContentFullDesc => 'Meno kontaktu a nahled spravy';

  @override
  String get notificationContentName => 'Len meno';

  @override
  String get notificationContentNameDesc => 'Zobrazi len meno kontaktu';

  @override
  String get notificationContentDiscrete => 'Diskretne';

  @override
  String get notificationContentDiscreteDesc => 'Zobrazi len \"Nova sprava\"';

  @override
  String get security => 'Bezpecnost';

  @override
  String get howHashProtectsYou => 'Ako vas Hash chrani';

  @override
  String get howHashProtectsYouSubtitle => 'Pochopte svoju bezpecnost';

  @override
  String get accountSecurity => 'Bezpecnost uctu';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, rezim Vash';

  @override
  String get blockScreenshots => 'Blokovat snimky obrazovky';

  @override
  String get transferDevice => 'Preniest na ine zariadenie';

  @override
  String get transferDeviceSubtitle => 'Migrovat vas ucet';

  @override
  String get pinCode => 'PIN kod';

  @override
  String get changePin => 'Zmenit PIN kod';

  @override
  String get currentPin => 'Aktualny PIN kod';

  @override
  String get newPin => 'Novy PIN kod';

  @override
  String get confirmPin => 'Potvrdit PIN kod';

  @override
  String get pinChanged => 'PIN kod zmeneny';

  @override
  String get incorrectPin => 'Nespravny PIN';

  @override
  String get pinsDoNotMatch => 'PIN kody sa nezhoduju';

  @override
  String get autoLock => 'Automaticke zamknutie';

  @override
  String get autoLockDelay => 'Oneskorenie zamknutia';

  @override
  String get autoLockImmediate => 'Okamzite';

  @override
  String get autoLockMinute => '1 minuta';

  @override
  String autoLockMinutes(int count) {
    return '$count minut';
  }

  @override
  String get vashCode => 'Kod Vash';

  @override
  String get vashModeTitle => 'Rezim Vash';

  @override
  String get vashModeExplanation => 'Vasa posledna zachranna siet.';

  @override
  String get vashModeDescription =>
      'Vyberiete si druhy PIN kod. Ak vas niekedy nutia otvorit Hash, zadajte tento kod namiesto bezneho PIN.\n\nAplikacia sa otvori normalne, ale vsetky konverzacie a kontakty budu prec.\n\nPre kohokoivek, kto sa diva na obrazovku, Hash vyzera prazdny — akoby ste ho nikdy nepouzili.';

  @override
  String get vashModeIrreversible => 'Tato akcia je ticha a nevratna.';

  @override
  String get chooseVashCode => 'Zvolit moj kod Vash';

  @override
  String get vashCodeInfo =>
      'Druhy PIN kod, ktory otvori aplikaciu normalne, ale prazdnu.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Ak zadate tento kod namiesto PIN:';

  @override
  String get vashDeleteContacts => 'Vase kontakty zmiznú';

  @override
  String get vashDeleteMessages => 'Vase konverzacie zmiznú';

  @override
  String get vashDeleteHistory => 'Vase poznamky zmiznú';

  @override
  String get vashKeepId => 'Vasa identita Hash (#XXX-XXX-XXX) zostane rovnaka';

  @override
  String get vashAppearNormal =>
      'Aplikacia vyzera normalne ale prazdna, ako nova. Tato akcia je nevratna.';

  @override
  String get setupVashCode => 'Nastavit kod Vash';

  @override
  String get modifyVashCode => 'Upravit kod Vash';

  @override
  String get currentVashCode => 'Aktualny kod Vash';

  @override
  String get newVashCode => 'Novy kod Vash';

  @override
  String get confirmVashCode => 'Potvrdit kod Vash';

  @override
  String get vashCodeConfigured => 'Kod Vash nastaveny';

  @override
  String get vashCodeModified => 'Kod Vash upraveny';

  @override
  String get vashCodeMustDiffer => 'Kod Vash musi byt odlisny od PIN';

  @override
  String get incorrectVashCode => 'Nespravny kod Vash';

  @override
  String get vashWhatToDelete => 'Co ma rezim Vash nechat zmiznut?';

  @override
  String get vashDeleteContactsOption => 'Kontakty';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Spravy';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Poznamky';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Rezim Vash aktivovany';

  @override
  String get vashCreateSubtitle => 'Zvolte kod odlisny od hlavneho PIN';

  @override
  String get vashConfirmSubtitle => 'Potvrdte vas kod Vash';

  @override
  String get pinCodeForEntry => 'PIN kód pre vstup do aplikácie';

  @override
  String get vashCodeSection => 'Rezim Vash';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Odomknúť odtlačkom prsta alebo Face ID';

  @override
  String get enableBiometric => 'Povoliť biometriu';

  @override
  String get biometricWarningMessage =>
      'Povolením biometrie nebudete môcť používať Vash kód na vstup do aplikácie.\n\nVash kód budete môcť použiť iba ak biometria zlyhá (po viacerých neúspešných pokusoch).\n\nSte si istí, že chcete pokračovať?';

  @override
  String get understood => 'Rozumiem';

  @override
  String get shareAppSubtitle => 'Zdieľajte Hash so svojimi blízkymi';

  @override
  String get share => 'Zdieľať';

  @override
  String get danger => 'Nebezpecenstvo';

  @override
  String get deleteAccount => 'Zmazat moj ucet';

  @override
  String get deleteAccountSubtitle => 'Nevratna akcia';

  @override
  String get deleteAccountConfirmTitle => 'Zmazat moj ucet';

  @override
  String get deleteAccountConfirmMessage =>
      'Vas ucet bude trvalo zmazany. Tato akcia je nevratna.\n\n• Vsetky vase konverzacie\n• Vsetky vase kontakty\n• Vase Hash ID\n\nBudete si musiet vytvorit novy ucet.';

  @override
  String get deleteForever => 'Zmazat trvalo';

  @override
  String get cancel => 'Zrusit';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Rezim Vash aktivovany.';

  @override
  String deletionError(String error) {
    return 'Chyba pri mazani: $error';
  }

  @override
  String get yourSecurity => 'Vasa bezpecnost';

  @override
  String get securityInfo =>
      '• End-to-end sifrovanie (Signal Protocol)\n• Ziadne udaje na nasich serveroch po doruceni\n• Kluce ulozene len na vasom zariadeni\n• PIN kod sa nikdy neodosiela na server';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Vitajte';

  @override
  String get securityStatement1 => 'Vase spravy su chranene.';

  @override
  String get securityStatement2 => 'End-to-end sifrovanie.';

  @override
  String get securityStatement3 => 'Ziadna stopa. Ziadny kompromis.';

  @override
  String get securityStatement4 => 'Vase sukromie je pravo.';

  @override
  String get accessBlocked => 'Pristup blokovany';

  @override
  String get tooManyAttempts => 'Prilis vela pokusov. Skuste neskor.';

  @override
  String get pleaseWait => 'Prosim cakajte';

  @override
  String get waitDelay => 'Prosim pockajte na koniec oneskorenia';

  @override
  String attemptCount(int current, int max) {
    return 'Pokus $current z $max';
  }

  @override
  String retryIn(String time) {
    return 'Skusit znova o $time';
  }

  @override
  String get forgotPin => 'Zabudli ste PIN? Pouzite frazu na obnovenie';

  @override
  String get useRecoveryPhrase => 'Pouzit frazu na obnovenie';

  @override
  String get recoveryWarningTitle => 'Upozornenie';

  @override
  String get recoveryWarningMessage => 'Obnovenie uctu:';

  @override
  String get recoveryDeleteAllMessages => 'Zmaze VSETKY vase spravy';

  @override
  String get recoveryWaitDelay => 'Vyzaduje 1-hodinove oneskorenie';

  @override
  String get recoveryKeepContacts => 'Ponecha vase kontakty';

  @override
  String get recoveryIrreversible =>
      'Tato akcia je nevratna. Vase spravy budu trvalo stratene.';

  @override
  String get iUnderstand => 'Rozumiem';

  @override
  String get accountRecovery => 'Obnovenie uctu';

  @override
  String get enterRecoveryPhrase =>
      'Zadajte 24 slov vasej frazy na obnovenie, oddelene medzerami.';

  @override
  String get recoveryPhraseHint => 'slovo1 slovo2 slovo3 ...';

  @override
  String get recover => 'Obnovit';

  @override
  String get recoveryPhraseRequired => 'Prosim zadajte frazu na obnovenie';

  @override
  String get recoveryPhrase24Words => 'Fraza musi obsahovat presne 24 slov';

  @override
  String get incorrectRecoveryPhrase => 'Nespravna fraza na obnovenie';

  @override
  String get recoveryInitError => 'Chyba pri inicializacii obnovenia';

  @override
  String get securityDelay => 'Bezpecnostne oneskorenie';

  @override
  String get securityDelayMessage =>
      'Pre vasu bezpecnost je potrebna cakacia doba pred vytvorenim noveho PIN.';

  @override
  String get timeRemaining => 'Zostava cas';

  @override
  String get messagesDeletedForProtection =>
      'Vase spravy boli zmazane pre vasu ochranu.';

  @override
  String get canCloseApp => 'Mozete zavriet aplikaciu a vratit sa neskor.';

  @override
  String get onboardingTitle1 => 'Vitajte v Hash';

  @override
  String get onboardingSubtitle1 => 'Messenger, ktory nezanechava stopy';

  @override
  String get onboardingTitle2 => 'Uplne sifrovanie';

  @override
  String get onboardingSubtitle2 =>
      'Vase spravy su end-to-end sifrovane protokolom Signal';

  @override
  String get onboardingTitle3 => 'Ziadna stopa';

  @override
  String get onboardingSubtitle3 => 'Spravy su po doruceni zo serverov zmazane';

  @override
  String get onboardingTitle4 => 'Vasa bezpecnost';

  @override
  String get onboardingSubtitle4 => 'PIN kod, rezim Vash a fraza na obnovenie';

  @override
  String get getStarted => 'Zacat';

  @override
  String get next => 'Dalej';

  @override
  String get skip => 'Preskocit';

  @override
  String get alreadyHaveAccount => 'Uz mam ucet';

  @override
  String get transferMyAccount => 'Preniest moj ucet';

  @override
  String get createPin => 'Vytvorte PIN kod';

  @override
  String get createPinSubtitle =>
      'Tento kod bude chranit pristup k vasej aplikacii';

  @override
  String get confirmYourPin => 'Potvrdte vas PIN kod';

  @override
  String get confirmPinSubtitle => 'Zadajte PIN kod znova';

  @override
  String get saveRecoveryPhrase => 'Fraza na obnovenie';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Zapisite si tieto 24 slov v poradi. Umoznia vam obnovit ucet, ak zabudnete PIN.';

  @override
  String get phraseWritten => 'Zapisal som si frazu';

  @override
  String get warningRecoveryPhrase =>
      'Ak stratite tuto frazu a zabudnete PIN, stratite pristup k uctu.';

  @override
  String get accountTransferred => 'Ucet preneseny';

  @override
  String get accountTransferredMessage =>
      'Vas ucet bol preneseny na ine zariadenie. Toto sedenie uz nie je platne.';

  @override
  String get accountTransferredInfo =>
      'Ak ste tento prenos neiniciovali, vas ucet mohol byt kompromitovany.';

  @override
  String get logout => 'Odhlasit sa';

  @override
  String get transferAccount => 'Preniest ucet';

  @override
  String get transferAccountInfo =>
      'Preneste vas ucet Hash na nove zariadenie. Aktualne sedenie bude zneplatnene.';

  @override
  String get generateTransferCode => 'Vygenerovat kod prenosu';

  @override
  String get transferCode => 'Kod prenosu';

  @override
  String transferCodeExpires(int minutes) {
    return 'Tento kod vyprsi za $minutes minut';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Zadajte tento kod na novom zariadeni pre prenos uctu.';

  @override
  String get generateNewCode => 'Vygenerovat novy kod';

  @override
  String get scanQrCode => 'Naskenovat QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Naskenujte QR code kontaktu na jeho pridanie';

  @override
  String get qrCodeDetected => 'QR code detekovany';

  @override
  String get invalidQrCode => 'Neplatny QR code';

  @override
  String get cameraPermissionRequired => 'Vyzaduje sa povolenie kamery';

  @override
  String get myQrCode => 'Moj QR code';

  @override
  String get myQrCodeSubtitle =>
      'Zdielajte tento QR code, aby vas kontakty mohli pridat';

  @override
  String get shareQrCode => 'Zdielat';

  @override
  String get addContactTitle => 'Pridat kontakt';

  @override
  String get addContactByHashId => 'Zadajte Hash ID vasho kontaktu';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Hladat';

  @override
  String get contactNotFound => 'Kontakt nenajdeny';

  @override
  String get contactAlreadyAdded => 'Tento kontakt uz je vo vasom zozname';

  @override
  String get contactAdded => 'Kontakt pridany';

  @override
  String get myProfile => 'Moj profil';

  @override
  String get myProfileSubtitle =>
      'Zdielajte tieto informacie, aby vas ostatni mohli pridat';

  @override
  String get temporaryCode => 'Docasny kod';

  @override
  String temporaryCodeExpires(String time) {
    return 'Vyprsi za $time';
  }

  @override
  String get codeExpired => 'Kod vyprsal';

  @override
  String get generateNewCodeButton => 'Novy kod';

  @override
  String get copyHashId => 'Kopirovat ID';

  @override
  String get copyCode => 'Kopirovat kod';

  @override
  String get copiedToClipboard => 'Skopirovane';

  @override
  String get showMyQrCode => 'Zobrazit moj QR code';

  @override
  String get orDivider => 'alebo';

  @override
  String get openScanner => 'Otvorit skener';

  @override
  String get addManually => 'Pridat manualne';

  @override
  String get contactHashIdLabel => 'Hash ID kontaktu';

  @override
  String get temporaryCodeLabel => 'Docasny kod';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Poziadajte kontakt o vygenerovanie kodu z jeho profilu';

  @override
  String get verifyAndAdd => 'Overit a pridat';

  @override
  String get fillAllFields => 'Prosim vyplnte vsetky polia';

  @override
  String get invalidHashIdFormat => 'Neplatny format ID (napr.: 123-456-ABC)';

  @override
  String get userNotFound => 'Pouzivatel nenajdeny';

  @override
  String get cannotAddYourself => 'Nemozete pridat sameho seba';

  @override
  String get invalidOrExpiredCode => 'Neplatny alebo expirovany docasny kod';

  @override
  String get contactFound => 'Kontakt najdeny!';

  @override
  String get howToCallContact => 'Ako by ste ich chceli nazvat?';

  @override
  String get contactNameHint => 'Meno kontaktu';

  @override
  String get addContactButton => 'Pridat';

  @override
  String get contactDetails => 'Podrobnosti kontaktu';

  @override
  String get contactName => 'Meno kontaktu';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Pridany $date';
  }

  @override
  String get deleteContact => 'Zmazat kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Zmazat tento kontakt?';
  }

  @override
  String get deleteContactMessage => 'Toto zmaze aj celu konverzaciu.';

  @override
  String get delete => 'Zmazat';

  @override
  String get typeMessage => 'Napisat spravu...';

  @override
  String get messageSent => 'Odoslane';

  @override
  String get messageDelivered => 'Dorucene';

  @override
  String get messageRead => 'Precitane';

  @override
  String get messageFailed => 'Odoslanie zlyhalo';

  @override
  String get now => 'Teraz';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h';
  }

  @override
  String daysAgo(int count) {
    return '${count}d';
  }

  @override
  String get today => 'Dnes';

  @override
  String get yesterday => 'Vcera';

  @override
  String dateAtTime(String date, String time) {
    return '$date o $time';
  }

  @override
  String get shareMessage =>
      'Pridajte sa ku mne na Hash! 🔒\n\nJe to skutocne sukromny messenger: uplne sifrovanie, ziadna stopa na serveroch a panicke tlacidlo v pripade potreby.\n\nStiahnite aplikaciu tu 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Chyba';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Zobrazit';

  @override
  String get yes => 'Ano';

  @override
  String get no => 'Nie';

  @override
  String get save => 'Ulozit';

  @override
  String get edit => 'Upravit';

  @override
  String get close => 'Zavriet';

  @override
  String get confirm => 'Potvrdit';

  @override
  String get loading => 'Nacitava sa...';

  @override
  String get retry => 'Skusit znova';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Cakajuce ziadosti';

  @override
  String get noPendingRequests => 'Ziadne cakajuce ziadosti';

  @override
  String get pendingRequestsSubtitle => 'Tito ludia vas chcu pridat';

  @override
  String requestFromUser(String hashId) {
    return 'Ziadost od $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Vyprsi za $days dni';
  }

  @override
  String get acceptRequest => 'Prijat';

  @override
  String get rejectRequest => 'Odmietnut';

  @override
  String get requestAccepted => 'Ziadost prijata';

  @override
  String get requestRejected => 'Ziadost odmietnuta';

  @override
  String get requestSent => 'Ziadost odoslana!';

  @override
  String get requestSentSubtitle =>
      'Vasa ziadost bola odoslana. Pouzivatel ju musi prijat pred tym, nez budete moct komunikovat.';

  @override
  String get requestAlreadyPending => 'Ziadost uz caka';

  @override
  String get requestAlreadySentByOther => 'Tato osoba vam uz poslala ziadost';

  @override
  String get addByHashId => 'Pridat podla Hash ID';

  @override
  String get addByHashIdSubtitle => 'Zadajte Hash ID a docasny kod kontaktu';

  @override
  String get enterTemporaryCode => 'Zadajte 6-miestny kod';

  @override
  String get sendRequest => 'Poslat ziadost';

  @override
  String get acceptContactTitle => 'Prijat kontakt';

  @override
  String get acceptContactSubtitle => 'Mozete mu dat vlastne meno';

  @override
  String get leaveEmptyForHashId => 'Nechajte prazdne pre pouzitie Hash ID';

  @override
  String get firstName => 'Meno';

  @override
  String get lastName => 'Priezvisko';

  @override
  String get notes => 'Poznamky';

  @override
  String get notesHint => 'Osobne poznamky o tomto kontakte';

  @override
  String get photoOptional => 'Foto (volitelne)';

  @override
  String get contactNameOptional => 'Meno (volitelne)';

  @override
  String get notesOptional => 'Poznamky (volitelne)';

  @override
  String get storedLocally => 'Ulozene len na vasom zariadeni';

  @override
  String get encryptedMessageLabel => 'Sifrovana sprava';

  @override
  String get identityMessageHint => 'Kto ste? Ako sa poznate?';

  @override
  String get messageWillBeSentEncrypted =>
      'Tato sprava bude sifrovana a odoslana prijemcovi';

  @override
  String get sendRequestButton => 'Poslat ziadost';

  @override
  String get requestExpiresIn24h => 'Ziadost vyprsi za 24h, ak nebude prijata';

  @override
  String get theyAlreadySentYouRequest => 'Tato osoba vam uz poslala ziadost';

  @override
  String get requests => 'Ziadosti';

  @override
  String get receivedRequests => 'Prijate';

  @override
  String get sentRequests => 'Odoslane';

  @override
  String get noSentRequests => 'Ziadne odoslane ziadosti';

  @override
  String get cancelRequest => 'Zrusit';

  @override
  String get deleteRequest => 'Zmazat ziadost';

  @override
  String get requestCancelled => 'Ziadost zrusena';

  @override
  String sentTo(String hashId) {
    return 'Odoslane $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Vyprsi za $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Prijate pred $time';
  }

  @override
  String get messageFromRequester => 'Sprava od ziadatela';

  @override
  String get copy => 'Kopirovat';

  @override
  String get messageInfo => 'Informacie o sprave';

  @override
  String get messageDirection => 'Smer';

  @override
  String get messageSentByYou => 'Odoslane vami';

  @override
  String get messageReceived => 'Prijate';

  @override
  String get messageSentAt => 'Odoslane o';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Stav';

  @override
  String get messageReadAt => 'Precitane o';

  @override
  String get messageType => 'Typ';

  @override
  String get messageSize => 'Velkost';

  @override
  String get messageExpiresAt => 'Vyprsi o';

  @override
  String get messageEncrypted => 'End-to-end sifrovane';

  @override
  String get messageStatusSending => 'Odosiela sa...';

  @override
  String get messageStatusSent => 'Odoslane';

  @override
  String get messageStatusDelivered => 'Dorucene';

  @override
  String get messageStatusRead => 'Precitane';

  @override
  String get messageStatusFailed => 'Zlyhalo';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Caka na dorucenie';

  @override
  String get deletedFromServer => 'Zmazane';

  @override
  String get messageTypeText => 'Text';

  @override
  String get messageTypeImage => 'Obrazok';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Hlas';

  @override
  String get messageTypeFile => 'Subor';

  @override
  String get indefinitely => 'Neurcito';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'hodin';

  @override
  String get minutes => 'minut';

  @override
  String get seconds => 'sekund';

  @override
  String get ephemeralMessages => 'Pomijive spravy';

  @override
  String get ephemeralMessagesDescription =>
      'Spravy su automaticky zmazane po tomto case';

  @override
  String get ephemeralImmediate => 'Okamzite (po precitani)';

  @override
  String get ephemeralImmediateDesc => 'Zmazane hned po precitani';

  @override
  String get ephemeralMyPreference => 'Moja preferencia';

  @override
  String get ephemeralMyPreferenceDesc => 'Pouzit globalne nastavenie';

  @override
  String get ephemeralDefaultSetting => 'Trvanie spravy';

  @override
  String get ephemeralChooseDefault => 'Odporucane';

  @override
  String get ephemeral30Seconds => '30 sekund';

  @override
  String get ephemeral30SecondsDesc => 'Zmazané 30s po prečítaní';

  @override
  String get ephemeral5Minutes => '5 minut';

  @override
  String get ephemeral5MinutesDesc => 'Zmazané 5min po prečítaní';

  @override
  String get ephemeral1Hour => '1 hodina';

  @override
  String get ephemeral1HourDesc => 'Zmazané 1h po prečítaní';

  @override
  String get ephemeral3Hours => '3 hodiny';

  @override
  String get ephemeral6Hours => '6 hodin';

  @override
  String get ephemeral6HoursDesc => 'Zmazané 6h po prečítaní';

  @override
  String get ephemeral12Hours => '12 hodin';

  @override
  String get ephemeral24Hours => '24 hodin';

  @override
  String get ephemeral24HoursDesc => 'Zmazané 24h po prečítaní';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Vlastne trvanie';

  @override
  String get howItWorks => 'Ako to funguje';

  @override
  String get ephemeralExplanation1 =>
      'Spravy su zo servera zmazane hned po prijati.';

  @override
  String get ephemeralExplanation2 =>
      'Toto nastavenie urcuje, kedy spravy zmiznú z VASHO telefonu po precitani.';

  @override
  String get ephemeralExplanation3 =>
      'Vas kontakt ma vlastne nastavenie pre svoj telefon.';

  @override
  String get mute1Hour => '1 hodina';

  @override
  String get mute8Hours => '8 hodin';

  @override
  String get mute1Day => '1 den';

  @override
  String get mute1Week => '1 tyzden';

  @override
  String get muteAlways => 'Vzdy';

  @override
  String get muteExplanation =>
      'Nebudete dostavat notifikacie pre tento kontakt';

  @override
  String get showCallsInRecents => 'Zobraziť v posledných hovoroch';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash hovory sa zobrazujú v histórii telefónu';

  @override
  String get feedback => 'Spätná väzba';

  @override
  String get muteNotifications => 'Stlmit notifikacie';

  @override
  String get muteDescription =>
      'Nebudete dostavat notifikacie pre tento kontakt';

  @override
  String mutedUntil(String time) {
    return 'Stlmene do $time';
  }

  @override
  String get notMuted => 'Notifikacie zapnute';

  @override
  String get unmute => 'Zapnut';

  @override
  String get notificationSound => 'Zvuk notifikacie';

  @override
  String get defaultSound => 'Predvoleny';

  @override
  String get chatSettings => 'Nastavenia konverzacie';

  @override
  String get bubbleColor => 'Farba bubliny';

  @override
  String get backgroundColor => 'Farba pozadia';

  @override
  String get backgroundImage => 'Obrazok pozadia';

  @override
  String get chatBackground => 'Pozadie konverzacie';

  @override
  String get customColor => 'Vlastna';

  @override
  String get defaultColor => 'Predvolena';

  @override
  String get imageSelected => 'Obrazok vybrany';

  @override
  String get noImage => 'Ziadny obrazok';

  @override
  String get color => 'Farba';

  @override
  String get image => 'Obrazok';

  @override
  String get tapToSelectImage => 'Klepnite na vyber obrazku';

  @override
  String get changeImage => 'Zmenit obrazok';

  @override
  String get previewMessageReceived => 'Ahoj!';

  @override
  String get previewMessageSent => 'Cau!';

  @override
  String get messageAction => 'Sprava';

  @override
  String get callAction => 'Hovor';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Osobne poznamky';

  @override
  String get addNotes => 'Pridat poznamky...';

  @override
  String get noNotes => 'Ziadne poznamky';

  @override
  String get messageNotifications => 'Notifikacie sprav';

  @override
  String get callNotifications => 'Notifikacie hovorov';

  @override
  String get useGradient => 'Pouzit gradient';

  @override
  String get gradientStart => 'Pociatocna farba';

  @override
  String get gradientEnd => 'Koncova farba';

  @override
  String get preview => 'Nahled';

  @override
  String get reset => 'Resetovat';

  @override
  String get securityNumber => 'Bezpecnostne cislo';

  @override
  String securityNumberDescription(String name) {
    return 'Overte, ze sa bezpecnostne cislo zhoduje so zariadenim $name';
  }

  @override
  String get verifyEncryption => 'Overit end-to-end sifrovanie';

  @override
  String get tapToCopy => 'Klepnite na kopirovanie';

  @override
  String get howToVerify => 'Ako overit';

  @override
  String get verifyStep1 =>
      'Stretnite sa s kontaktom osobne alebo mu zavolajte';

  @override
  String get verifyStep2 =>
      'Porovnajte bezpecnostne cisla alebo naskenujte QR code';

  @override
  String get verifyStep3 => 'Ak sa zhoduju, vasa konverzacia je bezpecna';

  @override
  String get scanToVerify => 'Naskenovat na overenie';

  @override
  String get reportSpam => 'Nahlasit spam';

  @override
  String get reportSpamSubtitle => 'Nahlasit tento kontakt ako spam';

  @override
  String get reportSpamDescription =>
      'Toto anonymne nahlasi tento kontakt. Vasa identita nebude zdielana. Ste si isty?';

  @override
  String get report => 'Nahlasit';

  @override
  String get spamReported => 'Spam nahlaseny';

  @override
  String get reportError =>
      'Nepodarilo sa odoslat nahlasenie. Skuste to znova.';

  @override
  String get reportRateLimited =>
      'Dosiahli ste maximalny pocet nahlaseni na dnes.';

  @override
  String get blockContact => 'Blokovat kontakt';

  @override
  String get blockContactDescription =>
      'Tento kontakt vam uz nebude moct posielat spravy ani volat. Nebude o tom informovany.';

  @override
  String get unblockContact => 'Odblokovat kontakt';

  @override
  String get unblockContactDescription =>
      'Tento kontakt vam bude opat moct posielat spravy a volat.';

  @override
  String get contactBlocked => 'Kontakt blokovany';

  @override
  String get contactUnblocked => 'Kontakt odblokovany';

  @override
  String get contactIsBlocked => 'Tento kontakt je blokovany';

  @override
  String get unblock => 'Odblokovat';

  @override
  String get deleteContactSubtitle => 'Zmazat tento kontakt a konverzaciu';

  @override
  String get confirmWithPin => 'Potvrdit PIN-om';

  @override
  String get enterPinToConfirm => 'Zadajte PIN na potvrdenie tejto akcie';

  @override
  String get profilePhoto => 'Profilova fotka';

  @override
  String get takePhoto => 'Odfotit';

  @override
  String get chooseFromGallery => 'Vybrat z galerie';

  @override
  String get removePhoto => 'Odstranit fotku';

  @override
  String get viewContactHashId => 'Zobrazit identifikator kontaktu';

  @override
  String get hashIdPartiallyMasked =>
      'Ciastocne maskovane pre vasu bezpecnost a sukromie kontaktu';

  @override
  String get addFirstContact => 'Pridajte prvy kontakt';

  @override
  String get addFirstContactSubtitle =>
      'Zdielajte vas QR code alebo naskenujte priatela';

  @override
  String get directory => 'Adresar';

  @override
  String get noContacts => 'Ziadne kontakty';

  @override
  String get noContactsSubtitle => 'Pridajte kontakt na zaciatok';

  @override
  String get sendMessageAction => 'Poslat spravu';

  @override
  String get audioCall => 'Audio hovor';

  @override
  String get videoCall => 'Video hovor';

  @override
  String get viewProfile => 'Zobrazit profil';

  @override
  String get deleteContactDirectory => 'Zmazat kontakt';

  @override
  String get scanShort => 'Skenovat';

  @override
  String get addShort => 'Pridat';

  @override
  String deleteContactConfirmName(String name) {
    return 'Naozaj chcete zmazat $name?';
  }

  @override
  String get noNotesTitle => 'Ziadne poznamky';

  @override
  String get noNotesSubtitle => 'Vytvorte svoju prvu poznamku';

  @override
  String get newNote => 'Nova poznamka';

  @override
  String get editNote => 'Upravit poznamku';

  @override
  String get deleteNote => 'Zmazat poznamku';

  @override
  String get deleteNoteConfirm => 'Naozaj chcete zmazat tuto poznamku?';

  @override
  String get noteTitle => 'Nazov';

  @override
  String get noteContent => 'Obsah';

  @override
  String get addItem => 'Pridat polozku';

  @override
  String get pinNote => 'Pripnut';

  @override
  String get unpinNote => 'Odopnut';

  @override
  String get noteColor => 'Farba';

  @override
  String get notePassword => 'Heslo';

  @override
  String get setPassword => 'Nastavit heslo';

  @override
  String get changePassword => 'Zmenit heslo';

  @override
  String get removePassword => 'Odstranit heslo';

  @override
  String get enterPassword => 'Zadat heslo';

  @override
  String get confirmPassword => 'Potvrdit heslo';

  @override
  String get passwordPin => 'PIN kod';

  @override
  String get passwordText => 'Textove heslo';

  @override
  String get protectedNote => 'Chranena poznamka';

  @override
  String get incorrectPassword => 'Nespravne heslo';

  @override
  String get passwordSet => 'Heslo nastavene';

  @override
  String get passwordRemoved => 'Heslo odstranene';

  @override
  String get notesBiometric => 'Face ID pre poznamky';

  @override
  String get notesBiometricSubtitle =>
      'Vyzadovat biometricku autentifikaciu na otvorenie chranenych poznamok';

  @override
  String get textNote => 'Textova poznamka';

  @override
  String get checklistNote => 'Kontrolny zoznam';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total uloh';
  }

  @override
  String get autoSaved => 'Ulozene';

  @override
  String get searchNotes => 'Hladat poznamky';

  @override
  String get legalConsent => 'Pravny suhlas';

  @override
  String get confirmAge13 => 'Potvrdzujem, ze mam aspon 13 rokov';

  @override
  String get acceptLegalStart => 'Akceptujem ';

  @override
  String get privacyPolicy => 'Zasady ochrany sukromia';

  @override
  String get termsOfService => 'Podmienky pouzivania';

  @override
  String get andThe => ' a ';

  @override
  String get continueButton => 'Pokracovat';

  @override
  String get mustAcceptTerms =>
      'Musite akceptovat obe podmienky na pokracovanie';

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
  String get support => 'Podpora';

  @override
  String get contactSupport => 'Kontaktovat podporu';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Nahlasit zneuzitie';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Pravne informacie';

  @override
  String get legalEntity => 'Pravny subjekt';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Pripnut';

  @override
  String get unpinConversation => 'Odopnut';

  @override
  String get hideConversation => 'Odstranit z kanala';

  @override
  String get deleteConversation => 'Zmazat konverzaciu';

  @override
  String get deleteConversationConfirm =>
      'Zadajte PIN na potvrdenie zmazania vsetkych sprav';

  @override
  String get noConversations => 'Zatial ziadne konverzacie';

  @override
  String get startConversation => 'Zacat';

  @override
  String get microphonePermissionRequired => 'Vyzaduje sa pristup k mikrofonu';

  @override
  String get microphonePermissionExplanation =>
      'Hash potrebuje mikrofon na uskutocnenie hovorov.';

  @override
  String get cameraPermissionExplanation =>
      'Hash potrebuje kameru na videohovory.';

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
  String get openSettings => 'Otvorit nastavenia';

  @override
  String get callConnecting => 'Pripajanie...';

  @override
  String get callRinging => 'Zvoni...';

  @override
  String get callReconnecting => 'Opätovne pripajanie...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Opätovne pripajanie (${seconds}s)';
  }

  @override
  String get callPaused => 'Pozastavené';

  @override
  String get callPausedSubtitle => 'Hovor stále prebieha';

  @override
  String get callRemoteMicMuted => 'Mikrofon kontaktu je stlmeny';

  @override
  String get callMiniControlsMute => 'Stlmit';

  @override
  String get callMiniControlsUnmute => 'Zapnut';

  @override
  String get callMiniControlsHangUp => 'Zavesit';

  @override
  String get callMiniControlsReturn => 'Vratit sa k hovoru';

  @override
  String get callNetworkPoor => 'Nestabilne pripojenie';

  @override
  String get callNetworkLost => 'Pripojenie stratene';

  @override
  String get callEndedTitle => 'Hovor ukonceny';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Udaje zariadenia';

  @override
  String get deviceDataSubtitle => 'Lokalne a serverove ulozisko';

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
  String get localStorage => 'Lokalne ulozisko';

  @override
  String get onThisDevice => 'na tomto zariadeni';

  @override
  String get encryptedDatabases => 'Sifrovane databazy';

  @override
  String get files => 'Subory';

  @override
  String get secureKeychain => 'Bezpecna klucenka';

  @override
  String get cache => 'Vyrovnavacia pamat';

  @override
  String get contactsDetail => 'Mena, avatary, kluce Signal';

  @override
  String get messagesDetail => 'Sifrovane konverzacie';

  @override
  String get notesDetail => 'Osobne poznamky';

  @override
  String get signalSessions => 'Sedenia Signal';

  @override
  String get signalSessionsDetail => 'Sifrovacie sedenia';

  @override
  String get pendingContacts => 'Cakajuce kontakty';

  @override
  String get pendingContactsDetail => 'Cakajuce ziadosti';

  @override
  String get callHistory => 'Hovory';

  @override
  String get callHistoryDetail => 'Historia hovorov';

  @override
  String get preferences => 'Preferencie';

  @override
  String get preferencesDetail => 'Preferencie medii a hovorov';

  @override
  String get avatars => 'Avatary';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count suborov',
      one: '1 subor',
      zero: 'ziadne subory',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktivne';

  @override
  String get notDefined => 'Nedefinovane';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Fraza na obnovenie';

  @override
  String get identity => 'Identita (Hash ID)';

  @override
  String get signalKeys => 'Kluce Signal Protocol';

  @override
  String get authTokens => 'Autentifikacne tokeny';

  @override
  String get contactNamesCache => 'Vyrovnavacia pamat mien kontaktov';

  @override
  String get remoteConfig => 'Vzdialena konfiguracia';

  @override
  String get notificationPrefs => 'Preferencie notifikacii';

  @override
  String get serverData => 'Serverove udaje';

  @override
  String get serverDataInfo =>
      'Hash uchovava minimalne udaje na serveri, vsetky sifrovane alebo docasne.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, verejne kluce, token schranky';

  @override
  String get serverPrekeys => 'Predkluce';

  @override
  String get serverPrekeysDetail => 'Jednorazove kluce Signal (spotrebovane)';

  @override
  String get serverMessages => 'Spravy v tranzite';

  @override
  String get serverMessagesDetail => 'Zmazane po doruceni (max 24h)';

  @override
  String get serverMedia => 'Media v tranzite';

  @override
  String get serverMediaDetail => 'Zmazane po stiahnuti';

  @override
  String get serverContactRequests => 'Ziadosti o kontakt';

  @override
  String get serverContactRequestsDetail => 'Vyprsia po 24h';

  @override
  String get serverRateLimits => 'Limity rychlosti';

  @override
  String get serverRateLimitsDetail => 'Docasne anti-abuzne udaje';

  @override
  String get privacyReassurance =>
      'Hash nemoze citat vase spravy. Vsetky udaje su end-to-end sifrovane. Serverove udaje su automaticky mazane.';

  @override
  String get pinTooSimple =>
      'Tento PIN je prilis jednoduchy. Zvolte bezpecnejsi kod.';

  @override
  String get genericError => 'Vyskytla sa chyba. Skuste to znova.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nepodarilo sa vytvorit ucet: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraza skopirovana do schranky';

  @override
  String get copyPhrase => 'Kopirovat frazu';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Zapisite si tuto frazu na bezpecne miesto. Ak stratite PIN bez tejto frazy, trvalo stratite pristup k udajom.';

  @override
  String get noMessages => 'Ziadne spravy';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Zmazat vsetky spravy s $name?';
  }

  @override
  String get confirmation => 'Potvrdenie';

  @override
  String get untitled => 'Bez nazvu';

  @override
  String get noSessions => 'Ziadne sedenia';

  @override
  String get unknownContact => 'Neznamy kontakt';

  @override
  String get unnamed => 'Bez mena';

  @override
  String get noPendingRequestsAlt => 'Ziadne cakajuce ziadosti';

  @override
  String get deleteAllCallHistory => 'Zmazat celu historiu hovorov?';

  @override
  String get noCalls => 'Ziadne hovory';

  @override
  String get noPreferences => 'Ziadne preferencie';

  @override
  String get resetAllMediaPrefs => 'Resetovat vsetky preferencie medii?';

  @override
  String get deleteThisAvatar => 'Zmazat tento avatar?';

  @override
  String get deleteAllAvatars => 'Zmazat vsetky avatary?';

  @override
  String get noAvatars => 'Ziadne avatary';

  @override
  String get deleteThisFile => 'Zmazat tento subor?';

  @override
  String get deleteAllMediaFiles => 'Zmazat vsetky media?';

  @override
  String get noMediaFiles => 'Ziadne media';

  @override
  String get outgoing => 'Odchadzajuce';

  @override
  String get incoming => 'Prichadzajuce';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Pomijive zobrazenie: ${seconds}s';
  }

  @override
  String get normalView => 'Normalne zobrazenie';

  @override
  String get callReasonCompleted => 'Dokonceny';

  @override
  String get callReasonMissed => 'Zmeskany';

  @override
  String get callReasonDeclined => 'Odmietnuty';

  @override
  String get callReasonFailed => 'Zlyhal';

  @override
  String get justNow => 'Prave teraz';

  @override
  String timeAgoMinutes(int count) {
    return 'pred $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'pred ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'pred ${count}d';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Poloha';

  @override
  String get statusQueued => 'V rade';

  @override
  String get blockedBadge => 'Blokovany';

  @override
  String get protectedBadge => 'Chraneny';

  @override
  String messageCount(int count) {
    return '$count sprava(y)';
  }

  @override
  String get deleteQuestion => 'Zmazat?';

  @override
  String get transferMyAccountTitle => 'Preniest moj ucet';

  @override
  String get loadingError => 'Chyba nacitania';

  @override
  String get transferToNewDevice => 'Preniest na nove zariadenie';

  @override
  String get transferInstructions =>
      'Na novom zariadeni zvolte \"Obnovit moj ucet\" a zadajte tieto informacie:';

  @override
  String get yourHashIdLabel => 'Vase Hash ID';

  @override
  String get enterYourPinCode => 'Zadajte vas PIN kod';

  @override
  String get pinOwnerConfirmation =>
      'Na potvrdenie, ze ste vlastnikom tohto uctu';

  @override
  String get scanThisQrCode => 'Naskenujte tento QR code';

  @override
  String get withYourNewDevice => 'Vasim novym zariadenim';

  @override
  String get orEnterTheCode => 'alebo zadajte kod';

  @override
  String get transferCodeLabel => 'Kod prenosu';

  @override
  String get proximityVerification => 'Overenie blizkosti';

  @override
  String get bringDevicesCloser => 'Priblizite obe zariadenia';

  @override
  String get confirmTransferQuestion => 'Potvrdit prenos?';

  @override
  String get accountWillBeTransferred =>
      'Vas ucet bude preneseny na nove zariadenie.\n\nToto zariadenie bude trvalo odpojene.';

  @override
  String get transferComplete => 'Prenos dokonceny';

  @override
  String get transferSuccessMessage =>
      'Vas ucet bol uspesne preneseny.\n\nTato aplikacia sa teraz zatvori.';

  @override
  String get manualVerification => 'Manualne overenie';

  @override
  String get codeDisplayedOnBothDevices =>
      'Kod zobrazeny na oboch zariadeniach:';

  @override
  String get doesCodeMatchNewDevice =>
      'Zhoduje sa tento kod s kodom na novom zariadeni?';

  @override
  String get verifiedStatus => 'Overene';

  @override
  String get inProgressStatus => 'Prebieha...';

  @override
  String get notAvailableStatus => 'Nedostupne';

  @override
  String get codeExpiredRestart => 'Kod vyprsal. Prosim zacnite odznova.';

  @override
  String get codesDoNotMatchCancelled => 'Kody sa nezhoduju. Prenos zruseny.';

  @override
  String transferToDevice(String device) {
    return 'Na: $device';
  }

  @override
  String get copiedExclamation => 'Skopirovane!';

  @override
  String expiresInTime(String time) {
    return 'Vyprsi za $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometria nie je na tomto zariadeni dostupna';

  @override
  String get biometricAuthError => 'Chyba pri biometrickej autentifikacii';

  @override
  String get authenticateForBiometric =>
      'Prosim autentifikujte sa na povolenie biometrie';

  @override
  String get biometricAuthFailed => 'Biometricka autentifikacia zlyhala';

  @override
  String get forceUpdateTitle => 'Vyzadovana aktualizacia';

  @override
  String get forceUpdateMessage =>
      'K dispozicii je nova verzia Hash. Aktualizujte na pokracovanie.';

  @override
  String get updateButton => 'Aktualizovat';

  @override
  String get maintenanceInProgress => 'Prebieha udrzba';

  @override
  String get tryAgainLater => 'Prosim skuste neskor';

  @override
  String get information => 'Informacie';

  @override
  String get later => 'Neskôr';

  @override
  String get doYouLikeHash => 'Páči sa vám Hash?';

  @override
  String get yourFeedbackHelps =>
      'Vaša spätná väzba nám pomáha zlepšovať aplikáciu';

  @override
  String get ratingTerrible => 'Hrozné';

  @override
  String get ratingBad => 'Zlé';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Dobré';

  @override
  String get ratingExcellent => 'Výborné!';

  @override
  String get donationMessage =>
      'Hash je neziskový projekt. Vaša podpora nám pomáha pokračovať v budovaní skutočne súkromného messengera.';

  @override
  String get recentConnections => 'Posledné pripojenia';

  @override
  String get loginInfoText =>
      'Každé odomknutie PIN-om sa zaznamenáva lokálne. Uchovávajú sa len posledných 24 hodín.';

  @override
  String get connectionCount => 'Pripojenie(a)';

  @override
  String get periodLabel => 'Obdobie';

  @override
  String get historyLabel => 'História';

  @override
  String get noLoginRecorded => 'Ziadne zaznamenane prihlasenie';

  @override
  String get nextUnlocksAppearHere => 'Nasledujuce odomknutia sa zobraziatu.';

  @override
  String get dataLocalOnly =>
      'Tieto údaje sú uložené len vo vašom zariadení a nikdy sa neprenášajú.';

  @override
  String get currentSession => 'Aktuálne';

  @override
  String get todayLabel => 'Dnes';

  @override
  String get yesterdayLabel => 'Včera';

  @override
  String get justNowLabel => 'Práve teraz';

  @override
  String minutesAgoLabel(int count) {
    return 'Pred $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Pred ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Pred ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Ziadna planovana udrzba';

  @override
  String get everythingWorkingNormally => 'Vsetko funguje normalne';

  @override
  String get maintenanceTitle => 'Údržba';

  @override
  String get maintenanceActiveLabel => 'PREBIEHA';

  @override
  String get maintenancePlannedLabel => 'PLÁNOVANÁ';

  @override
  String get locking => 'Zamykanie...';

  @override
  String get newMessageNotification => 'Nova sprava';

  @override
  String get secExplainTitle => 'Ako vas Hash chrani';

  @override
  String get secExplainIntro =>
      'Hash je navrhnuty tak, aby nikto nemohol citat vase spravy.';

  @override
  String get secExplainIntroSub => 'Ani my.\nTu je vysvetlenie, jednoducho.';

  @override
  String get secJourneyLabel => 'CESTA';

  @override
  String get secJourneyTitle => 'Cesta vasej spravy';

  @override
  String get secJourneySubtitle =>
      'Od vasho prsta po obrazovku kontaktu, kazdy krok je chraneny. Sledujte cestu.';

  @override
  String get secStep1Title => 'Napisete spravu';

  @override
  String get secStep1Desc =>
      'Napisete \"Ahoj!\" v aplikacii. V tomto momente sprava existuje iba v pamati telefonu. Nic nebolo odoslane.';

  @override
  String get secStep2Title => 'Sifrovanie s Signal Protocol';

  @override
  String get secStep2Desc =>
      'Hned ako stlacite \"Odoslat\", vasa sprava sa premeni na retazec nezrozumitelnych znakov. Je to, akoby bola vasa sprava zamknuta v trezore, od ktoreho ma kluc iba vas kontakt.';

  @override
  String get secStep3Title => 'Sealed Sender: neviditelna obalka';

  @override
  String get secStep3Desc =>
      'Predstavte si, ze posielate list postou, ale bez spatocnej adresy na obalke. Presne to robi Hash. Sprava je vlozena do anonymnej schranky. Server nevie, kto ju poslal.';

  @override
  String get secStep4Title => 'Server nic nevidi';

  @override
  String get secStep4Desc =>
      'Server funguje ako slepy postar. Vie len, ze \"niekto nieco vlozil do schranky #A7X9\". Nevie, kto to poslal, co to je ani pre koho to je.';

  @override
  String get secStep4Highlight =>
      'Ziadne metaudaje: ziadna IP adresa, ziadna casova znacka, ziadne prepojenie medzi odosielatelom a prijemcom.';

  @override
  String get secStep5Title => 'Vas kontakt prijme spravu';

  @override
  String get secStep5Desc =>
      'Telefon kontaktu stiahne obsah z anonymnej schranky a dessifruje spravu svojim sukromnym klucom, ktory nikdy neopustil jeho zariadenie. \"Ahoj!\" sa zobrazi na obrazovke.';

  @override
  String get secStep6Title => 'Sprava zmizne zo servera';

  @override
  String get secStep6Desc =>
      'Hned ako vas kontakt potvrdí prijatie, server trvalo zmaze spravu. Ziadny kos, ziadny archiv, ziadna zaloha. Aj neprecitane spravy su automaticky znicene po 24 hodinach.';

  @override
  String get secStep7Title => 'Lokalna expiracia';

  @override
  String get secStep7Desc =>
      'Na telefone kontaktu sa sprava samoznici podla vasho nastavenia: okamzite po precitani, 5 minut, 1 hodina... vy rozhodujete.';

  @override
  String get secJourneyConclusion =>
      'Vysledok: ziadna stopa na serveri, ziadna stopa na zariadeniach. Sprava existovala len tak dlho, aby bola precitana, potom zmizla.';

  @override
  String get secArchLabel => 'ARCHITEKTURA';

  @override
  String get secArchTitle => '5 vrstiev ochrany';

  @override
  String get secArchSubtitle =>
      'Hash sa nespoleha na jednu technologiu. Kazda vrstva posilnuje ostatne. Aj ked je jedna vrstva kompromitovana, vase udaje zostavaju v bezpeci.';

  @override
  String get secLayer1Title => 'End-to-end sifrovanie';

  @override
  String get secLayer1Desc =>
      'Kazda sprava je sifrovana jedinecnym klucom. Jednoducho: aj ked niekto dessifruje jednu spravu, nasledujucu uz nedesifruje. Kazda sprava ma vlastny zamok.';

  @override
  String get secLayer1Detail =>
      'Pre subory (fotky, videa, dokumenty) Hash pouziva dodatocne sifrovanie AES-256-GCM. Subor je sifrovany pred odoslanim z telefonu.';

  @override
  String get secLayer2Title => 'Sealed Sender (sietova anonymita)';

  @override
  String get secLayer2Desc =>
      'Bezne messengery posielajú spravy s vasou identitou. Je to akoby ste napisali meno na obalku. Hash pouziva anonymne schranky: server doruci spravu bez vedenia, kto ju poslal.';

  @override
  String get secLayer2Detail =>
      'Vysledok: aj pri uniku dat zo servera je nemozne zrekonstruovat, kto s kym komunikuje.';

  @override
  String get secLayer3Title => 'Automaticke mazanie';

  @override
  String get secLayer3Desc =>
      'Spravy su zo servera zmazane hned po potvrdeni prijatia. Aj ked sprava nie je nikdy vyzdvihnuta, je automaticky znicena po 24 hodinach.';

  @override
  String get secLayer3Detail =>
      'Na telefone sa spravy samozncia podla vasho nastavenia: okamzite, 5 min, 15 min, 30 min, 1h, 3h, 6h alebo 12h.';

  @override
  String get secLayer4Title => 'Ochrana lokalneho pristupu';

  @override
  String get secLayer4Desc =>
      'Aplikacia je chranena 6-miestnym PIN a/alebo biometriou (Face ID, odtlacok). Po prilis velkym poctom neuspesnych pokusov sa aplikacia zamkne s rastucim oneskorenim.';

  @override
  String get secLayer5Title => 'Zamknuta databaza';

  @override
  String get secLayer5Desc =>
      'Na strane servera ziadny pouzivatel nemoze priamo zapisovat do databazy. Vsetky akcie prechádzajú cez bezpecnostne funkcie.';

  @override
  String get secLayer5Detail =>
      'Je to ako bankovy prepazka: nikdy sa nedotknete trezoru sami. Podate ziadost a system overi, ci mate pravo pred vykonanim.';

  @override
  String get secVashLabel => 'JEDINEENY NA SVETE';

  @override
  String get secVashTitle => 'Rezim Vash';

  @override
  String get secVashSubtitle =>
      'System nudzovej bezpecnosti, ktory neexistuje v ziadnej inej aplikacii na posielanie sprav.';

  @override
  String get secVashScenarioTitle => 'Predstavte si tuto situaciu';

  @override
  String get secVashScenario1 => 'Niekto ziska pristup k vasmu telefonu';

  @override
  String get secVashScenario2 => 'Pytaju si od vas PIN kod';

  @override
  String get secVashScenario3 => 'Chcete nudzovo vymazat vsetky udaje';

  @override
  String get secVashSolutionTitle => 'Riesenie: dva PIN kody';

  @override
  String get secVashSolutionDesc => 'V Hash nastavite dva rozne PIN kody:';

  @override
  String get secVashNormalCodeLabel => 'Normalny kod';

  @override
  String get secVashNormalCodeDesc =>
      'Otvori aplikaciu normalne so vsetkymi udajmi';

  @override
  String get secVashCodeLabel2 => 'Kod Vash';

  @override
  String get secVashCodeDescription =>
      'Otvori aplikaciu normalne... ale vsetky vase udaje sa ticho zmazú na pozadi';

  @override
  String get secVashWhatHappensTitle => 'Co sa stane potom';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikacia sa otvori normalne. Ziadne upozornenie, ziadna podozriva animacia. Obrazovka jednoducho zobrazuje prazdnu aplikaciu, akoby ste ju prave nainštalovali.\n\nV skutocnosti boli vsetky vase konverzacie, kontakty a spravy nenavratne zmazane za zlomok sekundy.';

  @override
  String get secCallsLabel => 'HOVORY A SUBORY';

  @override
  String get secCallsTitle => 'Vsetko je sifrovane';

  @override
  String get secCallsSubtitle =>
      'Nie len spravy. Absolutne vsetko, co prechadza cez Hash, je end-to-end sifrovane.';

  @override
  String get secAudioCallTitle => 'Audio hovory';

  @override
  String get secAudioCallDesc =>
      'End-to-end sifrovane cez WebRTC. Hlas je prenasany priamo medzi zariadeniami.';

  @override
  String get secVideoCallTitle => 'Video hovory';

  @override
  String get secVideoCallDesc =>
      'Rovnaka technologia, kazdy prúd sifrovany individualne.';

  @override
  String get secPhotosTitle => 'Fotky a videa';

  @override
  String get secPhotosDesc => 'Sifrovane AES-256-GCM pred opustenim telefonu.';

  @override
  String get secDocsTitle => 'Dokumenty';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, akykolvek subor. Nazov, velkost a obsah sifrovane.';

  @override
  String get secAnonLabel => 'ANONYMITA';

  @override
  String get secAnonTitle => 'Ziadna identita nie je potrebna';

  @override
  String get secAnonSubtitle =>
      'Hash nikdy nepyta vase telefonne cislo ani email. Ste identifikovany jedinecnym a anonymnym Hash ID.';

  @override
  String get secHashIdTitle => 'Vase Hash ID';

  @override
  String get secHashIdDesc =>
      'Toto je vas jedinecny identifikator. Neodhaluje nic o vas: ani meno, ani cislo, ani polohu. Je to ako pseudonym, ktory je nemozne prepojit s vasou skutocnou identitou.\n\nNa pridanie kontaktu zdielate Hash ID alebo naskenujete QR code. To je vsetko. Ziadny synchronizovany adresar, ziadne navrhy \"Ludia, ktorych mozete poznat\".';

  @override
  String get secDataLabel => 'UDAJE';

  @override
  String get secDataTitle => 'Co Hash nevie';

  @override
  String get secDataSubtitle =>
      'Najlepsi sposob, ako chranit vase udaje, je nezbieraT ich.';

  @override
  String get secNeverCollected => 'Nikdy zbierane';

  @override
  String get secNeverItem1 => 'Obsah sprav';

  @override
  String get secNeverItem2 => 'Zoznam kontaktov';

  @override
  String get secNeverItem3 => 'Telefonne cislo';

  @override
  String get secNeverItem4 => 'Emailova adresa';

  @override
  String get secNeverItem5 => 'IP adresa';

  @override
  String get secNeverItem6 => 'Poloha';

  @override
  String get secNeverItem7 => 'Metaudaje (kto s kym komunikuje)';

  @override
  String get secNeverItem8 => 'Historia hovorov';

  @override
  String get secNeverItem9 => 'Adresar';

  @override
  String get secNeverItem10 => 'Reklamne identifikatory';

  @override
  String get secTempStored => 'Ulozene docasne';

  @override
  String get secTempItem1 => 'Anonymne Hash ID (jedinecny identifikator)';

  @override
  String get secTempItem2 => 'Verejne sifrovacie kluce';

  @override
  String get secTempItem3 => 'Sifrovane spravy v tranzite (max 24h)';

  @override
  String get secTempNote =>
      'Ani tieto minimalne udaje vas nemozu identifikovat. Vase Hash ID nie je prepojene so ziadnymi osobnymi informaciami.';

  @override
  String get secFooterTitle => 'Vase sukromie, vasa sloboda';

  @override
  String get secFooterDesc =>
      'Hash pouziva rovnake sifrovacie technologie ako najnarocnejsie profesionalne aplikacie. Vase spravy su chranene matematikou, nie slubmi.';

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
