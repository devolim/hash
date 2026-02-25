// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Brez sledi. Brez kompromisov.';

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
  String get conversations => 'Pogovori';

  @override
  String get contacts => 'Stiki';

  @override
  String get noConversation => 'Ni pogovorov';

  @override
  String get noConversationSubtitle => 'Dodajte stik za varno komunikacijo';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cakajoce zahteve',
      one: '1 cakajoca zahteva',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poslane zahteve cakajo',
      one: '1 poslana zahteva caka',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Dodaj stik';

  @override
  String get shareApp => 'Deli aplikacijo';

  @override
  String get newMessage => 'Novo sporocilo';

  @override
  String get newConversation => 'Posli sporocilo';

  @override
  String get settings => 'Nastavitve';

  @override
  String get myHashId => 'Moj Hash ID';

  @override
  String get supportHash => 'Podpri Hash';

  @override
  String get supportHashSubtitle => 'Hash je neprofitni projekt';

  @override
  String get donate => 'Doniraj';

  @override
  String get appearance => 'Videz';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Samodejno';

  @override
  String get themeAutoSubtitle => 'Sledi sistemskim nastavitvam';

  @override
  String get themeDark => 'Temna';

  @override
  String get themeLight => 'Svetla';

  @override
  String get themeRecommendation =>
      'Temna tema je priporocena za boljso zasebnost';

  @override
  String get language => 'Jezik';

  @override
  String get languageAuto => 'Samodejno (sistem)';

  @override
  String get notifications => 'Obvestila';

  @override
  String get messages => 'Sporocila';

  @override
  String get calls => 'Klici';

  @override
  String get vibration => 'Vibracija';

  @override
  String get notificationContent => 'Vsebina obvestila';

  @override
  String get notificationContentFull => 'Pokazi vse';

  @override
  String get notificationContentFullDesc => 'Ime stika in predogled sporocila';

  @override
  String get notificationContentName => 'Samo ime';

  @override
  String get notificationContentNameDesc => 'Pokaze samo ime stika';

  @override
  String get notificationContentDiscrete => 'Diskretno';

  @override
  String get notificationContentDiscreteDesc =>
      'Pokaze samo \"Novo sporocilo\"';

  @override
  String get security => 'Varnost';

  @override
  String get howHashProtectsYou => 'Kako vas Hash sciti';

  @override
  String get howHashProtectsYouSubtitle => 'Razumite svojo varnost';

  @override
  String get accountSecurity => 'Varnost racuna';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrija, nacin Vash';

  @override
  String get blockScreenshots => 'Blokiraj posnetke zaslona';

  @override
  String get transferDevice => 'Prenesi na drugo napravo';

  @override
  String get transferDeviceSubtitle => 'Preseli svoj racun';

  @override
  String get pinCode => 'PIN koda';

  @override
  String get changePin => 'Spremeni PIN kodo';

  @override
  String get currentPin => 'Trenutna PIN koda';

  @override
  String get newPin => 'Nova PIN koda';

  @override
  String get confirmPin => 'Potrdi PIN kodo';

  @override
  String get pinChanged => 'PIN koda spremenjena';

  @override
  String get incorrectPin => 'Napacen PIN';

  @override
  String get pinsDoNotMatch => 'PIN kodi se ne ujemata';

  @override
  String get autoLock => 'Samodejna zaklenitev';

  @override
  String get autoLockDelay => 'Zakasnitev zaklenitve';

  @override
  String get autoLockImmediate => 'Takoj';

  @override
  String get autoLockMinute => '1 minuta';

  @override
  String autoLockMinutes(int count) {
    return '$count minut';
  }

  @override
  String get vashCode => 'Koda Vash';

  @override
  String get vashModeTitle => 'Nacin Vash';

  @override
  String get vashModeExplanation => 'Vasa zadnja varnostna mreza.';

  @override
  String get vashModeDescription =>
      'Izbrali boste drugo PIN kodo. Ce vas kdaj prisilijo odpreti Hash, vnesite to kodo namesto obicajne PIN.\n\nAplikacija se bo odprla normalno, vendar bodo vsi pogovori in stiki izginili.\n\nZa vsakogar, ki gleda na zaslon, je Hash preprosto prazen — kot da ga nikoli niste uporabili.';

  @override
  String get vashModeIrreversible => 'To dejanje je tiho in nepreklicno.';

  @override
  String get chooseVashCode => 'Izberi mojo kodo Vash';

  @override
  String get vashCodeInfo =>
      'Druga PIN koda, ki odpre aplikacijo normalno, ampak prazno.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Ce vnesete to kodo namesto PIN:';

  @override
  String get vashDeleteContacts => 'Vasi stiki izginejo';

  @override
  String get vashDeleteMessages => 'Vasi pogovori izginejo';

  @override
  String get vashDeleteHistory => 'Vase beležke izginejo';

  @override
  String get vashKeepId => 'Vasa identiteta Hash (#XXX-XXX-XXX) ostane enaka';

  @override
  String get vashAppearNormal =>
      'Aplikacija izgleda normalno, ampak prazna, kot nova. To dejanje je nepreklicno.';

  @override
  String get setupVashCode => 'Nastavi kodo Vash';

  @override
  String get modifyVashCode => 'Spremeni kodo Vash';

  @override
  String get currentVashCode => 'Trenutna koda Vash';

  @override
  String get newVashCode => 'Nova koda Vash';

  @override
  String get confirmVashCode => 'Potrdi kodo Vash';

  @override
  String get vashCodeConfigured => 'Koda Vash nastavljena';

  @override
  String get vashCodeModified => 'Koda Vash spremenjena';

  @override
  String get vashCodeMustDiffer => 'Koda Vash mora biti razlicna od PIN';

  @override
  String get incorrectVashCode => 'Napacna koda Vash';

  @override
  String get vashWhatToDelete => 'Kaj naj nacin Vash skrije?';

  @override
  String get vashDeleteContactsOption => 'Stiki';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Sporocila';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Beležke';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Nacin Vash aktiviran';

  @override
  String get vashCreateSubtitle => 'Izberite kodo, razlicno od glavne PIN';

  @override
  String get vashConfirmSubtitle => 'Potrdite svojo kodo Vash';

  @override
  String get pinCodeForEntry => 'PIN koda za vstop v aplikacijo';

  @override
  String get vashCodeSection => 'Nacin Vash';

  @override
  String get biometric => 'Biometrija';

  @override
  String get biometricUnlock => 'Odkleni s prstnim odtisom ali Face ID';

  @override
  String get enableBiometric => 'Omogoči biometrijo';

  @override
  String get biometricWarningMessage =>
      'Z aktivacijo biometrije ne boste mogli uporabiti kode Vash za vstop v aplikacijo.\n\nKodo Vash boste lahko uporabili le, če biometrija ne uspe (po večkratnih neuspelih poskusih).\n\nSte prepričani, da želite nadaljevati?';

  @override
  String get understood => 'Razumem';

  @override
  String get shareAppSubtitle => 'Delite Hash s svojimi bližnjimi';

  @override
  String get share => 'Deli';

  @override
  String get danger => 'Nevarnost';

  @override
  String get deleteAccount => 'Izbrisi moj racun';

  @override
  String get deleteAccountSubtitle => 'Nepreklicno dejanje';

  @override
  String get deleteAccountConfirmTitle => 'Izbrisi moj racun';

  @override
  String get deleteAccountConfirmMessage =>
      'Vas racun bo trajno izbrisan. To dejanje je nepreklicno.\n\n• Vsi vasi pogovori\n• Vsi vasi stiki\n• Vas Hash ID\n\nMorali boste ustvariti nov racun.';

  @override
  String get deleteForever => 'Izbrisi trajno';

  @override
  String get cancel => 'Preklici';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Nacin Vash aktiviran.';

  @override
  String deletionError(String error) {
    return 'Napaka pri brisanju: $error';
  }

  @override
  String get yourSecurity => 'Vasa varnost';

  @override
  String get securityInfo =>
      '• Sifriranje od konca do konca (Signal Protocol)\n• Brez podatkov na nasih strežnikih po dostavi\n• Kljuci shranjeni samo na vasi napravi\n• PIN koda nikoli ni poslana na strežnik';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Dobrodosli';

  @override
  String get securityStatement1 => 'Vasa sporocila so zascitena.';

  @override
  String get securityStatement2 => 'Sifriranje od konca do konca.';

  @override
  String get securityStatement3 => 'Brez sledi. Brez kompromisov.';

  @override
  String get securityStatement4 => 'Vasa zasebnost je pravica.';

  @override
  String get accessBlocked => 'Dostop blokiran';

  @override
  String get tooManyAttempts => 'Prevec poskusov. Poskusite pozneje.';

  @override
  String get pleaseWait => 'Prosim pocakajte';

  @override
  String get waitDelay => 'Prosim pocakajte na konec zakasnitve';

  @override
  String attemptCount(int current, int max) {
    return 'Poskus $current od $max';
  }

  @override
  String retryIn(String time) {
    return 'Poskusite znova cez $time';
  }

  @override
  String get forgotPin => 'Pozabljen PIN? Uporabite obnovitveno frazo';

  @override
  String get useRecoveryPhrase => 'Uporabi obnovitveno frazo';

  @override
  String get recoveryWarningTitle => 'Opozorilo';

  @override
  String get recoveryWarningMessage => 'Obnovitev racuna bo:';

  @override
  String get recoveryDeleteAllMessages => 'Izbrisala VSA vasa sporocila';

  @override
  String get recoveryWaitDelay => 'Zahtevala 1-urno zakasnitev';

  @override
  String get recoveryKeepContacts => 'Obdržala vase stike';

  @override
  String get recoveryIrreversible =>
      'To dejanje je nepreklicno. Vasa sporocila bodo trajno izgubljena.';

  @override
  String get iUnderstand => 'Razumem';

  @override
  String get accountRecovery => 'Obnovitev racuna';

  @override
  String get enterRecoveryPhrase =>
      'Vnesite 24 besed vase obnovitvene fraze, locene s presledki.';

  @override
  String get recoveryPhraseHint => 'beseda1 beseda2 beseda3 ...';

  @override
  String get recover => 'Obnovi';

  @override
  String get recoveryPhraseRequired => 'Prosim vnesite obnovitveno frazo';

  @override
  String get recoveryPhrase24Words => 'Fraza mora vsebovati natancno 24 besed';

  @override
  String get incorrectRecoveryPhrase => 'Napacna obnovitvena fraza';

  @override
  String get recoveryInitError => 'Napaka pri inicializaciji obnovitve';

  @override
  String get securityDelay => 'Varnostna zakasnitev';

  @override
  String get securityDelayMessage =>
      'Za vaso varnost je potrebno cakalno obdobje pred ustvarjanjem nove PIN kode.';

  @override
  String get timeRemaining => 'Preostali cas';

  @override
  String get messagesDeletedForProtection =>
      'Vasa sporocila so bila izbrisana za vaso zascito.';

  @override
  String get canCloseApp => 'Aplikacijo lahko zaprete in se vrnete pozneje.';

  @override
  String get onboardingTitle1 => 'Dobrodosli v Hash';

  @override
  String get onboardingSubtitle1 => 'Sporocilnik, ki ne puscza sledi';

  @override
  String get onboardingTitle2 => 'Popolno sifriranje';

  @override
  String get onboardingSubtitle2 =>
      'Vasa sporocila so sifrirana od konca do konca s protokolom Signal';

  @override
  String get onboardingTitle3 => 'Brez sledi';

  @override
  String get onboardingSubtitle3 =>
      'Sporocila so po dostavi izbrisana s strežnikov';

  @override
  String get onboardingTitle4 => 'Vasa varnost';

  @override
  String get onboardingSubtitle4 => 'PIN koda, nacin Vash in obnovitvena fraza';

  @override
  String get getStarted => 'Zacni';

  @override
  String get next => 'Naprej';

  @override
  String get skip => 'Preskoci';

  @override
  String get alreadyHaveAccount => 'Že imam racun';

  @override
  String get transferMyAccount => 'Prenesi moj racun';

  @override
  String get createPin => 'Ustvarite PIN kodo';

  @override
  String get createPinSubtitle =>
      'Ta koda bo scitila dostop do vase aplikacije';

  @override
  String get confirmYourPin => 'Potrdite svojo PIN kodo';

  @override
  String get confirmPinSubtitle => 'Znova vnesite svojo PIN kodo';

  @override
  String get saveRecoveryPhrase => 'Obnovitvena fraza';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Zapisite si teh 24 besed po vrsti. Omogocile vam bodo obnovitev racuna, ce pozabite PIN.';

  @override
  String get phraseWritten => 'Zapisal sem frazo';

  @override
  String get warningRecoveryPhrase =>
      'Ce izgubite to frazo in pozabite PIN, boste izgubili dostop do racuna.';

  @override
  String get accountTransferred => 'Racun prenesen';

  @override
  String get accountTransferredMessage =>
      'Vas racun je bil prenesen na drugo napravo. Ta seja ni vec veljavna.';

  @override
  String get accountTransferredInfo =>
      'Ce niste zaceli tega prenosa, je vas racun morda ogrožen.';

  @override
  String get logout => 'Odjava';

  @override
  String get transferAccount => 'Prenesi racun';

  @override
  String get transferAccountInfo =>
      'Prenesite svoj racun Hash na novo napravo. Trenutna seja bo razveljavljena.';

  @override
  String get generateTransferCode => 'Generiraj kodo za prenos';

  @override
  String get transferCode => 'Koda za prenos';

  @override
  String transferCodeExpires(int minutes) {
    return 'Ta koda potece cez $minutes minut';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Vnesite to kodo na novi napravi za prenos racuna.';

  @override
  String get generateNewCode => 'Generiraj novo kodo';

  @override
  String get scanQrCode => 'Skeniraj QR code';

  @override
  String get scanQrCodeSubtitle => 'Skenirajte QR code stika, da ga dodate';

  @override
  String get qrCodeDetected => 'QR code zaznan';

  @override
  String get invalidQrCode => 'Neveljaven QR code';

  @override
  String get cameraPermissionRequired => 'Potrebno je dovoljenje za kamero';

  @override
  String get myQrCode => 'Moj QR code';

  @override
  String get myQrCodeSubtitle => 'Delite ta QR code, da vas stiki lahko dodajo';

  @override
  String get shareQrCode => 'Deli';

  @override
  String get addContactTitle => 'Dodaj stik';

  @override
  String get addContactByHashId => 'Vnesite Hash ID svojega stika';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Isci';

  @override
  String get contactNotFound => 'Stik ni najden';

  @override
  String get contactAlreadyAdded => 'Ta stik je že na vasem seznamu';

  @override
  String get contactAdded => 'Stik dodan';

  @override
  String get myProfile => 'Moj profil';

  @override
  String get myProfileSubtitle =>
      'Delite te informacije, da vas drugi lahko dodajo';

  @override
  String get temporaryCode => 'Zacasna koda';

  @override
  String temporaryCodeExpires(String time) {
    return 'Potece cez $time';
  }

  @override
  String get codeExpired => 'Koda je potekla';

  @override
  String get generateNewCodeButton => 'Nova koda';

  @override
  String get copyHashId => 'Kopiraj ID';

  @override
  String get copyCode => 'Kopiraj kodo';

  @override
  String get copiedToClipboard => 'Kopirano';

  @override
  String get showMyQrCode => 'Pokazi moj QR code';

  @override
  String get orDivider => 'ali';

  @override
  String get openScanner => 'Odpri skener';

  @override
  String get addManually => 'Dodaj rocno';

  @override
  String get contactHashIdLabel => 'Hash ID stika';

  @override
  String get temporaryCodeLabel => 'Zacasna koda';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Prosite stik, naj generira kodo iz svojega profila';

  @override
  String get verifyAndAdd => 'Preveri in dodaj';

  @override
  String get fillAllFields => 'Prosim izpolnite vsa polja';

  @override
  String get invalidHashIdFormat => 'Neveljavna oblika ID (npr.: 123-456-ABC)';

  @override
  String get userNotFound => 'Uporabnik ni najden';

  @override
  String get cannotAddYourself => 'Ne morete dodati sami sebe';

  @override
  String get invalidOrExpiredCode => 'Neveljavna ali potekla zacasna koda';

  @override
  String get contactFound => 'Stik najden!';

  @override
  String get howToCallContact => 'Kako bi jih radi poimenovali?';

  @override
  String get contactNameHint => 'Ime stika';

  @override
  String get addContactButton => 'Dodaj';

  @override
  String get contactDetails => 'Podrobnosti stika';

  @override
  String get contactName => 'Ime stika';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Dodano $date';
  }

  @override
  String get deleteContact => 'Izbrisi stik';

  @override
  String deleteContactConfirm(Object name) {
    return 'Izbrisati ta stik?';
  }

  @override
  String get deleteContactMessage => 'To bo izbrisalo tudi celoten pogovor.';

  @override
  String get delete => 'Izbrisi';

  @override
  String get typeMessage => 'Vnesite sporocilo...';

  @override
  String get messageSent => 'Poslano';

  @override
  String get messageDelivered => 'Dostavljeno';

  @override
  String get messageRead => 'Prebrano';

  @override
  String get messageFailed => 'Posiljanje ni uspelo';

  @override
  String get now => 'Zdaj';

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
  String get today => 'Danes';

  @override
  String get yesterday => 'Vceraj';

  @override
  String dateAtTime(String date, String time) {
    return '$date ob $time';
  }

  @override
  String get shareMessage =>
      'Pridružite se mi na Hash! 🔒\n\nJe resnično zaseben sporocilnik: popolno sifriranje, brez sledi na strežnikih in panicni nacin po potrebi.\n\nPrenesite aplikacijo tukaj 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Napaka';

  @override
  String get ok => 'V redu';

  @override
  String get view => 'Ogled';

  @override
  String get yes => 'Da';

  @override
  String get no => 'Ne';

  @override
  String get save => 'Shrani';

  @override
  String get edit => 'Uredi';

  @override
  String get close => 'Zapri';

  @override
  String get confirm => 'Potrdi';

  @override
  String get loading => 'Nalaganje...';

  @override
  String get retry => 'Poskusi znova';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Cakajoce zahteve';

  @override
  String get noPendingRequests => 'Ni cakajoce zahteve';

  @override
  String get pendingRequestsSubtitle => 'Ti ljudje vas želijo dodati';

  @override
  String requestFromUser(String hashId) {
    return 'Zahteva od $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Potece cez $days dni';
  }

  @override
  String get acceptRequest => 'Sprejmi';

  @override
  String get rejectRequest => 'Zavrni';

  @override
  String get requestAccepted => 'Zahteva sprejeta';

  @override
  String get requestRejected => 'Zahteva zavrnjena';

  @override
  String get requestSent => 'Zahteva poslana!';

  @override
  String get requestSentSubtitle =>
      'Vasa zahteva je bila poslana. Uporabnik jo mora sprejeti, preden lahko komunicirate.';

  @override
  String get requestAlreadyPending => 'Zahteva že caka';

  @override
  String get requestAlreadySentByOther => 'Ta oseba vam je že poslala zahtevo';

  @override
  String get addByHashId => 'Dodaj po Hash ID';

  @override
  String get addByHashIdSubtitle => 'Vnesite Hash ID in zacasno kodo stika';

  @override
  String get enterTemporaryCode => 'Vnesite 6-mestno kodo';

  @override
  String get sendRequest => 'Posli zahtevo';

  @override
  String get acceptContactTitle => 'Sprejmi stik';

  @override
  String get acceptContactSubtitle => 'Lahko mu dodelite lastno ime';

  @override
  String get leaveEmptyForHashId => 'Pustite prazno za uporabo Hash ID';

  @override
  String get firstName => 'Ime';

  @override
  String get lastName => 'Priimek';

  @override
  String get notes => 'Beležke';

  @override
  String get notesHint => 'Osebne beležke o tem stiku';

  @override
  String get photoOptional => 'Fotografija (neobvezno)';

  @override
  String get contactNameOptional => 'Ime (neobvezno)';

  @override
  String get notesOptional => 'Beležke (neobvezno)';

  @override
  String get storedLocally => 'Shranjeno samo na vasi napravi';

  @override
  String get encryptedMessageLabel => 'Sifrirano sporocilo';

  @override
  String get identityMessageHint => 'Kdo ste? Kako se poznate?';

  @override
  String get messageWillBeSentEncrypted =>
      'To sporocilo bo sifrirano in poslano prejemniku';

  @override
  String get sendRequestButton => 'Posli zahtevo';

  @override
  String get requestExpiresIn24h => 'Zahteva potece v 24h, ce ni sprejeta';

  @override
  String get theyAlreadySentYouRequest => 'Ta oseba vam je že poslala zahtevo';

  @override
  String get requests => 'Zahteve';

  @override
  String get receivedRequests => 'Prejete';

  @override
  String get sentRequests => 'Poslane';

  @override
  String get noSentRequests => 'Ni poslanih zahtev';

  @override
  String get cancelRequest => 'Preklici';

  @override
  String get deleteRequest => 'Izbrisi zahtevo';

  @override
  String get requestCancelled => 'Zahteva preklicana';

  @override
  String sentTo(String hashId) {
    return 'Poslano $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Potece cez $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Prejeto pred $time';
  }

  @override
  String get messageFromRequester => 'Sporocilo od pošiljatelja';

  @override
  String get copy => 'Kopiraj';

  @override
  String get messageInfo => 'Informacije o sporocilu';

  @override
  String get messageDirection => 'Smer';

  @override
  String get messageSentByYou => 'Poslano od vas';

  @override
  String get messageReceived => 'Prejeto';

  @override
  String get messageSentAt => 'Poslano ob';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Stanje';

  @override
  String get messageReadAt => 'Prebrano ob';

  @override
  String get messageType => 'Tip';

  @override
  String get messageSize => 'Velikost';

  @override
  String get messageExpiresAt => 'Potece ob';

  @override
  String get messageEncrypted => 'Sifrirano od konca do konca';

  @override
  String get messageStatusSending => 'Posiljanje...';

  @override
  String get messageStatusSent => 'Poslano';

  @override
  String get messageStatusDelivered => 'Dostavljeno';

  @override
  String get messageStatusRead => 'Prebrano';

  @override
  String get messageStatusFailed => 'Neuspesno';

  @override
  String get serverStatus => 'Strežnik';

  @override
  String get onServer => 'Caka na dostavo';

  @override
  String get deletedFromServer => 'Izbrisano';

  @override
  String get messageTypeText => 'Besedilo';

  @override
  String get messageTypeImage => 'Slika';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Glas';

  @override
  String get messageTypeFile => 'Datoteka';

  @override
  String get indefinitely => 'Neomejeno';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'ur';

  @override
  String get minutes => 'minut';

  @override
  String get seconds => 'sekund';

  @override
  String get ephemeralMessages => 'Minljiva sporocila';

  @override
  String get ephemeralMessagesDescription =>
      'Sporocila so samodejno izbrisana po tem casu';

  @override
  String get ephemeralImmediate => 'Takoj (po branju)';

  @override
  String get ephemeralImmediateDesc => 'Izbrisana takoj po branju';

  @override
  String get ephemeralMyPreference => 'Moja nastavitev';

  @override
  String get ephemeralMyPreferenceDesc => 'Uporabi globalno nastavitev';

  @override
  String get ephemeralDefaultSetting => 'Trajanje sporocila';

  @override
  String get ephemeralChooseDefault => 'Priporoceno';

  @override
  String get ephemeral30Seconds => '30 sekund';

  @override
  String get ephemeral30SecondsDesc => 'Izbrisano 30s po branju';

  @override
  String get ephemeral5Minutes => '5 minut';

  @override
  String get ephemeral5MinutesDesc => 'Izbrisano 5min po branju';

  @override
  String get ephemeral1Hour => '1 ura';

  @override
  String get ephemeral1HourDesc => 'Izbrisano 1u po branju';

  @override
  String get ephemeral3Hours => '3 ure';

  @override
  String get ephemeral6Hours => '6 ur';

  @override
  String get ephemeral6HoursDesc => 'Izbrisano 6u po branju';

  @override
  String get ephemeral12Hours => '12 ur';

  @override
  String get ephemeral24Hours => '24 ur';

  @override
  String get ephemeral24HoursDesc => 'Izbrisano 24u po branju';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Trajanje po meri';

  @override
  String get howItWorks => 'Kako deluje';

  @override
  String get ephemeralExplanation1 =>
      'Sporocila so izbrisana s strežnika takoj po prejemu.';

  @override
  String get ephemeralExplanation2 =>
      'Ta nastavitev doloca, kdaj sporocila izginejo z VASEGA telefona po branju.';

  @override
  String get ephemeralExplanation3 =>
      'Vas stik ima svojo nastavitev za svoj telefon.';

  @override
  String get mute1Hour => '1 ura';

  @override
  String get mute8Hours => '8 ur';

  @override
  String get mute1Day => '1 dan';

  @override
  String get mute1Week => '1 teden';

  @override
  String get muteAlways => 'Vedno';

  @override
  String get muteExplanation => 'Ne boste prejemali obvestil za ta stik';

  @override
  String get showCallsInRecents => 'Prikaži v nedavnih klicih';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash klici se prikažejo v zgodovini telefona';

  @override
  String get feedback => 'Povratna informacija';

  @override
  String get muteNotifications => 'Utisaj obvestila';

  @override
  String get muteDescription => 'Ne boste prejemali obvestil za ta stik';

  @override
  String mutedUntil(String time) {
    return 'Utisano do $time';
  }

  @override
  String get notMuted => 'Obvestila vklopljena';

  @override
  String get unmute => 'Vklopi';

  @override
  String get notificationSound => 'Zvok obvestila';

  @override
  String get defaultSound => 'Privzeto';

  @override
  String get chatSettings => 'Nastavitve pogovora';

  @override
  String get bubbleColor => 'Barva oblacka';

  @override
  String get backgroundColor => 'Barva ozadja';

  @override
  String get backgroundImage => 'Slika ozadja';

  @override
  String get chatBackground => 'Ozadje pogovora';

  @override
  String get customColor => 'Po meri';

  @override
  String get defaultColor => 'Privzeto';

  @override
  String get imageSelected => 'Slika izbrana';

  @override
  String get noImage => 'Brez slike';

  @override
  String get color => 'Barva';

  @override
  String get image => 'Slika';

  @override
  String get tapToSelectImage => 'Tapnite za izbiro slike';

  @override
  String get changeImage => 'Spremeni sliko';

  @override
  String get previewMessageReceived => 'Živjo!';

  @override
  String get previewMessageSent => 'Hej!';

  @override
  String get messageAction => 'Sporocilo';

  @override
  String get callAction => 'Klic';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Osebne beležke';

  @override
  String get addNotes => 'Dodaj beležke...';

  @override
  String get noNotes => 'Ni beležk';

  @override
  String get messageNotifications => 'Obvestila o sporocilih';

  @override
  String get callNotifications => 'Obvestila o klicih';

  @override
  String get useGradient => 'Uporabi preliv';

  @override
  String get gradientStart => 'Zacetna barva';

  @override
  String get gradientEnd => 'Koncna barva';

  @override
  String get preview => 'Predogled';

  @override
  String get reset => 'Ponastavi';

  @override
  String get securityNumber => 'Varnostna stevilka';

  @override
  String securityNumberDescription(String name) {
    return 'Preverite, da se varnostna stevilka ujema z napravo $name';
  }

  @override
  String get verifyEncryption => 'Preveri sifriranje od konca do konca';

  @override
  String get tapToCopy => 'Tapnite za kopiranje';

  @override
  String get howToVerify => 'Kako preveriti';

  @override
  String get verifyStep1 => 'Srecajte se s stikom osebno ali ga pokličite';

  @override
  String get verifyStep2 =>
      'Primerjajte varnostne stevilke ali skenirajte QR code';

  @override
  String get verifyStep3 => 'Ce se ujemajo, je vas pogovor varen';

  @override
  String get scanToVerify => 'Skeniraj za preverjanje';

  @override
  String get reportSpam => 'Prijavi nezaželeno pošto';

  @override
  String get reportSpamSubtitle => 'Prijavite ta stik kot nezaželeno pošto';

  @override
  String get reportSpamDescription =>
      'To bo anonimno prijavilo ta stik. Vasa identiteta ne bo razkrita. Ste prepricani?';

  @override
  String get report => 'Prijavi';

  @override
  String get spamReported => 'Nezaželena pošta prijavljena';

  @override
  String get reportError => 'Prijave ni bilo mogoce poslati. Poskusite znova.';

  @override
  String get reportRateLimited =>
      'Dosegli ste najvecje stevilo prijav za danes.';

  @override
  String get blockContact => 'Blokiraj stik';

  @override
  String get blockContactDescription =>
      'Ta stik vam ne bo vec mogel posiljati sporocil ali klicati. Ne bo obvescen.';

  @override
  String get unblockContact => 'Odblokiraj stik';

  @override
  String get unblockContactDescription =>
      'Ta stik vam bo spet lahko posiljal sporocila in klical.';

  @override
  String get contactBlocked => 'Stik blokiran';

  @override
  String get contactUnblocked => 'Stik odblokiran';

  @override
  String get contactIsBlocked => 'Ta stik je blokiran';

  @override
  String get unblock => 'Odblokiraj';

  @override
  String get deleteContactSubtitle => 'Izbrisi ta stik in pogovor';

  @override
  String get confirmWithPin => 'Potrdi s PIN';

  @override
  String get enterPinToConfirm => 'Vnesite PIN za potrditev tega dejanja';

  @override
  String get profilePhoto => 'Profilna fotografija';

  @override
  String get takePhoto => 'Posnemi fotografijo';

  @override
  String get chooseFromGallery => 'Izberi iz galerije';

  @override
  String get removePhoto => 'Odstrani fotografijo';

  @override
  String get viewContactHashId => 'Ogled identifikatorja stika';

  @override
  String get hashIdPartiallyMasked =>
      'Delno prikrito za vaso varnost in zasebnost stika';

  @override
  String get addFirstContact => 'Dodajte prvi stik';

  @override
  String get addFirstContactSubtitle =>
      'Delite svoj QR code ali skenirajte prijateljevega';

  @override
  String get directory => 'Imenik';

  @override
  String get noContacts => 'Ni stikov';

  @override
  String get noContactsSubtitle => 'Dodajte stik za zacetek';

  @override
  String get sendMessageAction => 'Posli sporocilo';

  @override
  String get audioCall => 'Zvocni klic';

  @override
  String get videoCall => 'Video klic';

  @override
  String get viewProfile => 'Ogled profila';

  @override
  String get deleteContactDirectory => 'Izbrisi stik';

  @override
  String get scanShort => 'Skeniraj';

  @override
  String get addShort => 'Dodaj';

  @override
  String deleteContactConfirmName(String name) {
    return 'Ali ste prepricani, da želite izbrisati $name?';
  }

  @override
  String get noNotesTitle => 'Ni beležk';

  @override
  String get noNotesSubtitle => 'Ustvarite svojo prvo beležko';

  @override
  String get newNote => 'Nova beležka';

  @override
  String get editNote => 'Uredi beležko';

  @override
  String get deleteNote => 'Izbrisi beležko';

  @override
  String get deleteNoteConfirm =>
      'Ali ste prepricani, da želite izbrisati to beležko?';

  @override
  String get noteTitle => 'Naslov';

  @override
  String get noteContent => 'Vsebina';

  @override
  String get addItem => 'Dodaj element';

  @override
  String get pinNote => 'Pripni';

  @override
  String get unpinNote => 'Odpni';

  @override
  String get noteColor => 'Barva';

  @override
  String get notePassword => 'Geslo';

  @override
  String get setPassword => 'Nastavi geslo';

  @override
  String get changePassword => 'Spremeni geslo';

  @override
  String get removePassword => 'Odstrani geslo';

  @override
  String get enterPassword => 'Vnesite geslo';

  @override
  String get confirmPassword => 'Potrdite geslo';

  @override
  String get passwordPin => 'PIN koda';

  @override
  String get passwordText => 'Besedilno geslo';

  @override
  String get protectedNote => 'Zascitena beležka';

  @override
  String get incorrectPassword => 'Napacno geslo';

  @override
  String get passwordSet => 'Geslo nastavljeno';

  @override
  String get passwordRemoved => 'Geslo odstranjeno';

  @override
  String get notesBiometric => 'Face ID za beležke';

  @override
  String get notesBiometricSubtitle =>
      'Zahtevaj biometricno preverjanje za odpiranje zascitenih beležk';

  @override
  String get textNote => 'Besedilna beležka';

  @override
  String get checklistNote => 'Kontrolni seznam';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total nalog';
  }

  @override
  String get autoSaved => 'Shranjeno';

  @override
  String get searchNotes => 'Isci beležke';

  @override
  String get legalConsent => 'Pravno soglasje';

  @override
  String get confirmAge13 => 'Potrjujem, da sem star vsaj 13 let';

  @override
  String get acceptLegalStart => 'Sprejmem ';

  @override
  String get privacyPolicy => 'Pravilnik o zasebnosti';

  @override
  String get termsOfService => 'Pogoje uporabe';

  @override
  String get andThe => ' in ';

  @override
  String get continueButton => 'Nadaljuj';

  @override
  String get mustAcceptTerms => 'Za nadaljevanje morate sprejeti oba pogoja';

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
  String get contactSupport => 'Kontaktirajte podporo';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Prijavi zlorabo';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Pravne informacije';

  @override
  String get legalEntity => 'Pravni subjekt';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Pripni';

  @override
  String get unpinConversation => 'Odpni';

  @override
  String get hideConversation => 'Odstrani iz vira';

  @override
  String get deleteConversation => 'Izbrisi pogovor';

  @override
  String get deleteConversationConfirm =>
      'Vnesite PIN za potrditev brisanja vseh sporocil';

  @override
  String get noConversations => 'Se ni pogovorov';

  @override
  String get startConversation => 'Zacni';

  @override
  String get microphonePermissionRequired => 'Potreben je dostop do mikrofona';

  @override
  String get microphonePermissionExplanation =>
      'Hash potrebuje mikrofon za klicanje.';

  @override
  String get cameraPermissionExplanation =>
      'Hash potrebuje kamero za video klice.';

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
  String get openSettings => 'Odpri nastavitve';

  @override
  String get callConnecting => 'Povezovanje...';

  @override
  String get callRinging => 'Zvoni...';

  @override
  String get callReconnecting => 'Ponovno povezovanje...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Ponovno povezovanje (${seconds}s)';
  }

  @override
  String get callPaused => 'Zaustavljeno';

  @override
  String get callPausedSubtitle => 'Klic je še aktiven';

  @override
  String get callRemoteMicMuted => 'Mikrofon stika je utisan';

  @override
  String get callMiniControlsMute => 'Utisaj';

  @override
  String get callMiniControlsUnmute => 'Vklopi';

  @override
  String get callMiniControlsHangUp => 'Prekini';

  @override
  String get callMiniControlsReturn => 'Vrni se h klicu';

  @override
  String get callNetworkPoor => 'Nestabilna povezava';

  @override
  String get callNetworkLost => 'Povezava izgubljena';

  @override
  String get callEndedTitle => 'Klic koncen';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Podatki naprave';

  @override
  String get deviceDataSubtitle => 'Lokalno in strežnisko shranjevanje';

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
  String get localStorage => 'Lokalno shranjevanje';

  @override
  String get onThisDevice => 'na tej napravi';

  @override
  String get encryptedDatabases => 'Sifrirane podatkovne baze';

  @override
  String get files => 'Datoteke';

  @override
  String get secureKeychain => 'Varni privesek za kljuce';

  @override
  String get cache => 'Predpomnilnik';

  @override
  String get contactsDetail => 'Imena, avatarji, kljuci Signal';

  @override
  String get messagesDetail => 'Sifrirani pogovori';

  @override
  String get notesDetail => 'Osebne beležke';

  @override
  String get signalSessions => 'Seje Signal';

  @override
  String get signalSessionsDetail => 'Sifrirane seje';

  @override
  String get pendingContacts => 'Cakajoce stiki';

  @override
  String get pendingContactsDetail => 'Cakajoce zahteve';

  @override
  String get callHistory => 'Klici';

  @override
  String get callHistoryDetail => 'Zgodovina klicev';

  @override
  String get preferences => 'Nastavitve';

  @override
  String get preferencesDetail => 'Nastavitve medijev in klicev';

  @override
  String get avatars => 'Avatarji';

  @override
  String get media => 'Mediji';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count datotek',
      one: '1 datoteka',
      zero: 'brez datotek',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktivno';

  @override
  String get notDefined => 'Ni doloceno';

  @override
  String get biometrics => 'Biometrija';

  @override
  String get recoveryPhrase => 'Obnovitvena fraza';

  @override
  String get identity => 'Identiteta (Hash ID)';

  @override
  String get signalKeys => 'Kljuci Signal Protocol';

  @override
  String get authTokens => 'Žetoni za preverjanje';

  @override
  String get contactNamesCache => 'Predpomnilnik imen stikov';

  @override
  String get remoteConfig => 'Oddaljena konfiguracija';

  @override
  String get notificationPrefs => 'Nastavitve obvestil';

  @override
  String get serverData => 'Podatki strežnika';

  @override
  String get serverDataInfo =>
      'Hash hrani minimalne podatke na strežniku, vse sifrirano ali zacasno.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, javni kljuci, žeton nabiralnika';

  @override
  String get serverPrekeys => 'Predkljuci';

  @override
  String get serverPrekeysDetail => 'Enkratni kljuci Signal (porabljeni)';

  @override
  String get serverMessages => 'Sporocila v tranzitu';

  @override
  String get serverMessagesDetail => 'Izbrisana po dostavi (najv. 24h)';

  @override
  String get serverMedia => 'Mediji v tranzitu';

  @override
  String get serverMediaDetail => 'Izbrisani po prenosu';

  @override
  String get serverContactRequests => 'Zahteve za stik';

  @override
  String get serverContactRequestsDetail => 'Potecejo po 24h';

  @override
  String get serverRateLimits => 'Omejitve hitrosti';

  @override
  String get serverRateLimitsDetail => 'Zacasni podatki proti zlorabi';

  @override
  String get privacyReassurance =>
      'Hash ne more brati vasih sporocil. Vsi podatki so sifrirani od konca do konca. Podatki strežnika so samodejno izbrisani.';

  @override
  String get pinTooSimple => 'Ta PIN je preprosta. Izberite varnejso kodo.';

  @override
  String get genericError => 'Prislo je do napake. Poskusite znova.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Racuna ni mogoce ustvariti: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraza kopirana v odložisce';

  @override
  String get copyPhrase => 'Kopiraj frazo';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Zapisite to frazo na varno mesto. Ce izgubite PIN brez te fraze, boste trajno izgubili dostop do podatkov.';

  @override
  String get noMessages => 'Ni sporocil';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Izbrisati vsa sporocila z $name?';
  }

  @override
  String get confirmation => 'Potrditev';

  @override
  String get untitled => 'Brez naslova';

  @override
  String get noSessions => 'Ni sej';

  @override
  String get unknownContact => 'Neznan stik';

  @override
  String get unnamed => 'Brez imena';

  @override
  String get noPendingRequestsAlt => 'Ni cakajoce zahteve';

  @override
  String get deleteAllCallHistory => 'Izbrisati vso zgodovino klicev?';

  @override
  String get noCalls => 'Ni klicev';

  @override
  String get noPreferences => 'Ni nastavitev';

  @override
  String get resetAllMediaPrefs => 'Ponastaviti vse medijske nastavitve?';

  @override
  String get deleteThisAvatar => 'Izbrisati ta avatar?';

  @override
  String get deleteAllAvatars => 'Izbrisati vse avatarje?';

  @override
  String get noAvatars => 'Ni avatarjev';

  @override
  String get deleteThisFile => 'Izbrisati to datoteko?';

  @override
  String get deleteAllMediaFiles => 'Izbrisati vse medije?';

  @override
  String get noMediaFiles => 'Ni medijev';

  @override
  String get outgoing => 'Odhodni';

  @override
  String get incoming => 'Dohodni';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Minljiv ogled: ${seconds}s';
  }

  @override
  String get normalView => 'Navaden ogled';

  @override
  String get callReasonCompleted => 'Koncano';

  @override
  String get callReasonMissed => 'Zgrešeno';

  @override
  String get callReasonDeclined => 'Zavrnjeno';

  @override
  String get callReasonFailed => 'Neuspelo';

  @override
  String get justNow => 'Ravnokar';

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
  String get messageTypeContact => 'Stik';

  @override
  String get messageTypeLocation => 'Lokacija';

  @override
  String get statusQueued => 'V vrsti';

  @override
  String get blockedBadge => 'Blokirano';

  @override
  String get protectedBadge => 'Zasciteno';

  @override
  String messageCount(int count) {
    return '$count sporocilo(a)';
  }

  @override
  String get deleteQuestion => 'Izbrisati?';

  @override
  String get transferMyAccountTitle => 'Prenesi moj racun';

  @override
  String get loadingError => 'Napaka pri nalaganju';

  @override
  String get transferToNewDevice => 'Prenesi na novo napravo';

  @override
  String get transferInstructions =>
      'Na novi napravi izberite \"Obnovi moj racun\" in vnesite te informacije:';

  @override
  String get yourHashIdLabel => 'Vas Hash ID';

  @override
  String get enterYourPinCode => 'Vnesite svojo PIN kodo';

  @override
  String get pinOwnerConfirmation => 'Za potrditev, da ste lastnik tega racuna';

  @override
  String get scanThisQrCode => 'Skenirajte ta QR code';

  @override
  String get withYourNewDevice => 'Z vaso novo napravo';

  @override
  String get orEnterTheCode => 'ali vnesite kodo';

  @override
  String get transferCodeLabel => 'Koda za prenos';

  @override
  String get proximityVerification => 'Preverjanje bližine';

  @override
  String get bringDevicesCloser => 'Približajte obe napravi';

  @override
  String get confirmTransferQuestion => 'Potrditi prenos?';

  @override
  String get accountWillBeTransferred =>
      'Vas racun bo prenesen na novo napravo.\n\nTa naprava bo trajno odklopljena.';

  @override
  String get transferComplete => 'Prenos koncen';

  @override
  String get transferSuccessMessage =>
      'Vas racun je bil uspesno prenesen.\n\nTa aplikacija se bo zdaj zaprla.';

  @override
  String get manualVerification => 'Rocno preverjanje';

  @override
  String get codeDisplayedOnBothDevices => 'Koda prikazana na obeh napravah:';

  @override
  String get doesCodeMatchNewDevice =>
      'Ali se ta koda ujema s kodo na novi napravi?';

  @override
  String get verifiedStatus => 'Preverjeno';

  @override
  String get inProgressStatus => 'V teku...';

  @override
  String get notAvailableStatus => 'Ni na voljo';

  @override
  String get codeExpiredRestart => 'Koda je potekla. Prosim zacnite znova.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kodi se ne ujemata. Prenos preklican.';

  @override
  String transferToDevice(String device) {
    return 'Na: $device';
  }

  @override
  String get copiedExclamation => 'Kopirano!';

  @override
  String expiresInTime(String time) {
    return 'Potece cez $time';
  }

  @override
  String get biometricNotAvailable => 'Biometrija ni na voljo na tej napravi';

  @override
  String get biometricAuthError => 'Napaka pri biometricnem preverjanju';

  @override
  String get authenticateForBiometric =>
      'Prosim preverite identiteto za omogocanje biometrije';

  @override
  String get biometricAuthFailed => 'Biometricno preverjanje ni uspelo';

  @override
  String get forceUpdateTitle => 'Posodobitev potrebna';

  @override
  String get forceUpdateMessage =>
      'Na voljo je nova razlicica Hash. Posodobite za nadaljevanje.';

  @override
  String get updateButton => 'Posodobi';

  @override
  String get maintenanceInProgress => 'Vzdrževo v teku';

  @override
  String get tryAgainLater => 'Prosim poskusite pozneje';

  @override
  String get information => 'Informacije';

  @override
  String get later => 'Pozneje';

  @override
  String get doYouLikeHash => 'Vam je všeč Hash?';

  @override
  String get yourFeedbackHelps =>
      'Vaše povratne informacije nam pomagajo izboljšati aplikacijo';

  @override
  String get ratingTerrible => 'Grozno';

  @override
  String get ratingBad => 'Slabo';

  @override
  String get ratingOk => 'V redu';

  @override
  String get ratingGood => 'Dobro';

  @override
  String get ratingExcellent => 'Odlično!';

  @override
  String get donationMessage =>
      'Hash je neprofitni projekt. Vaša podpora nam pomaga nadaljevati z gradnjo resnično zasebnega sporočilnika.';

  @override
  String get recentConnections => 'Nedavne povezave';

  @override
  String get loginInfoText =>
      'Vsak odklep s PIN-om se zabeleži lokalno. Shranjenih je le zadnjih 24 ur.';

  @override
  String get connectionCount => 'Povezava(e)';

  @override
  String get periodLabel => 'Obdobje';

  @override
  String get historyLabel => 'Zgodovina';

  @override
  String get noLoginRecorded => 'Ni zabeležene prijave';

  @override
  String get nextUnlocksAppearHere =>
      'Naslednja odklepanja se bodo prikazala tukaj.';

  @override
  String get dataLocalOnly =>
      'Ti podatki so shranjeni samo na vaši napravi in se nikoli ne prenašajo.';

  @override
  String get currentSession => 'Trenutna';

  @override
  String get todayLabel => 'Danes';

  @override
  String get yesterdayLabel => 'Včeraj';

  @override
  String get justNowLabel => 'Ravnokar';

  @override
  String minutesAgoLabel(int count) {
    return 'Pred $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Pred ${hours}u';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Pred ${hours}u ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Ni nacrtovanega vzdrževa';

  @override
  String get everythingWorkingNormally => 'Vse deluje normalno';

  @override
  String get maintenanceTitle => 'Vzdrževanje';

  @override
  String get maintenanceActiveLabel => 'V TEKU';

  @override
  String get maintenancePlannedLabel => 'NAČRTOVANO';

  @override
  String get locking => 'Zaklepanje...';

  @override
  String get newMessageNotification => 'Novo sporocilo';

  @override
  String get secExplainTitle => 'Kako vas Hash sciti';

  @override
  String get secExplainIntro =>
      'Hash je zasnovan tako, da nihce ne more brati vasih sporocil.';

  @override
  String get secExplainIntroSub =>
      'Niti mi.\nTako deluje, razloženo preprosto.';

  @override
  String get secJourneyLabel => 'POTOVANJE';

  @override
  String get secJourneyTitle => 'Potovanje vasega sporocila';

  @override
  String get secJourneySubtitle =>
      'Od vasega prsta do zaslona stika, vsak korak je zasciten. Sledite poti.';

  @override
  String get secStep1Title => 'Napisete sporocilo';

  @override
  String get secStep1Desc =>
      'Vnesete \"Živjo!\" v aplikacijo. V tem trenutku sporocilo obstaja samo v pomnilniku telefona. Nic ni bilo poslano.';

  @override
  String get secStep2Title => 'Sifriranje s Signal Protocol';

  @override
  String get secStep2Desc =>
      'Takoj ko pritisnete \"Posli\", se vase sporocilo pretvori v niz nerazumljivih znakov. Kot da bi bilo vase sporocilo zaklenjeno v sefu, do katerega ima kljuc samo vas stik.';

  @override
  String get secStep3Title => 'Sealed Sender: nevidna ovojnica';

  @override
  String get secStep3Desc =>
      'Predstavljajte si, da posiljate pismo po posti, vendar brez povratnega naslova na ovojnici. Tocno to pocne Hash. Sporocilo je odloženo v anonimni nabiralnik. Strežnik ne ve, kdo ga je poslal.';

  @override
  String get secStep4Title => 'Strežnik ne vidi nicesar';

  @override
  String get secStep4Desc =>
      'Strežnik deluje kot slep postar. Ve samo, da je \"nekdo nekaj odložil v nabiralnik #A7X9\". Ne ve, kdo je poslal, kaj je ali za koga je.';

  @override
  String get secStep4Highlight =>
      'Brez shranjenih metapodatkov: brez IP naslova, brez casovnega žiga, brez povezave med pošiljateljem in prejemnikom.';

  @override
  String get secStep5Title => 'Vas stik prejme sporocilo';

  @override
  String get secStep5Desc =>
      'Telefon stika pridobi vsebino iz anonimnega nabiralnika in desifrira sporocilo s svojim zasebnim kljucem, ki nikoli ni zapustil naprave. \"Živjo!\" se prikaže na zaslonu.';

  @override
  String get secStep6Title => 'Sporocilo izgine s strežnika';

  @override
  String get secStep6Desc =>
      'Takoj ko vas stik potrdi prejem, strežnik trajno izbrise sporocilo. Brez kosa, brez arhiva, brez varnostne kopije. Tudi neprebrana sporocila so samodejno unicena po 24 urah.';

  @override
  String get secStep7Title => 'Lokalno potekanje';

  @override
  String get secStep7Desc =>
      'Na telefonu stika se sporocilo samounici glede na trajanje, ki ste ga izbrali: takoj po branju, 5 minut, 1 ura... vi odlocate.';

  @override
  String get secJourneyConclusion =>
      'Rezultat: nic sledi na strežniku, nic sledi na napravah. Sporocilo je obstajalo samo toliko casa, kolikor je bilo potrebno za branje, nato je izginilo.';

  @override
  String get secArchLabel => 'ARHITEKTURA';

  @override
  String get secArchTitle => '5 plasti zascite';

  @override
  String get secArchSubtitle =>
      'Hash se ne zanasa na eno samo tehnologijo. Vsaka plast krepi ostale. Tudi ce je ena plast ogrožena, vasi podatki ostanejo varni.';

  @override
  String get secLayer1Title => 'Sifriranje od konca do konca';

  @override
  String get secLayer1Desc =>
      'Vsako sporocilo je sifrirano z edinstvenim kljucem. Preprosto: tudi ce nekdo desifrira eno sporocilo, naslednjega ne bo mogel. Vsako sporocilo ima svojo kljucavnico.';

  @override
  String get secLayer1Detail =>
      'Za datoteke (fotografije, videe, dokumente) Hash uporablja dodatno sifriranje AES-256-GCM. Datoteka je sifrirana pred posiljanjem s telefona.';

  @override
  String get secLayer2Title => 'Sealed Sender (omrežna anonimnost)';

  @override
  String get secLayer2Desc =>
      'Obicajni sporocilniki posiljajo sporocila z vaso identiteto. Kot da bi napisali ime na ovojnico. Hash uporablja anonimne nabiralnike: strežnik dostavi sporocilo, ne da bi vedel, kdo ga je poslal.';

  @override
  String get secLayer2Detail =>
      'Rezultat: tudi v primeru vdora v strežnik je nemogoce rekonstruirati, kdo komunicira s kom.';

  @override
  String get secLayer3Title => 'Samodejno brisanje';

  @override
  String get secLayer3Desc =>
      'Sporocila so izbrisana s strežnika takoj po potrditvi prejema. Tudi ce sporocilo nikoli ni prevzeto, je samodejno uniceno po 24 urah.';

  @override
  String get secLayer3Detail =>
      'Na telefonu se sporocila samounicijo glede na izbrano trajanje: takoj, 5 min, 15 min, 30 min, 1h, 3h, 6h ali 12h.';

  @override
  String get secLayer4Title => 'Zascita lokalnega dostopa';

  @override
  String get secLayer4Desc =>
      'Aplikacija je zascitena s 6-mestno PIN kodo in/ali biometrijo (Face ID, prstni odtis). Po prevelikem stevilu neuspesnih poskusov se aplikacija zaklene z narasajoco zakasnitvijo.';

  @override
  String get secLayer5Title => 'Zaklenjena podatkovna baza';

  @override
  String get secLayer5Desc =>
      'Na strani strežnika noben uporabnik ne more neposredno pisati v podatkovno bazo. Vsa dejanja gredo skozi varne funkcije, ki preverijo vsako zahtevo.';

  @override
  String get secLayer5Detail =>
      'Kot bancni okence: nikoli se ne dotaknete trezorja sami. Podate zahtevo in sistem preveri, ali imate pravico pred izvajanjem.';

  @override
  String get secVashLabel => 'EDINSTVEN NA SVETU';

  @override
  String get secVashTitle => 'Nacin Vash';

  @override
  String get secVashSubtitle =>
      'Sistem nujne varnosti, ki ne obstaja v nobeni drugi aplikaciji za sporocanje.';

  @override
  String get secVashScenarioTitle => 'Predstavljajte si to situacijo';

  @override
  String get secVashScenario1 => 'Nekdo dostopa do vasega telefona';

  @override
  String get secVashScenario2 => 'Zahtevajo vaso PIN kodo';

  @override
  String get secVashScenario3 => 'Želite nujno izbrisati vse podatke';

  @override
  String get secVashSolutionTitle => 'Resitev: dve PIN kodi';

  @override
  String get secVashSolutionDesc => 'V Hash nastavite dve razlicni PIN kodi:';

  @override
  String get secVashNormalCodeLabel => 'Navadna koda';

  @override
  String get secVashNormalCodeDesc =>
      'Odpre aplikacijo normalno z vsemi podatki';

  @override
  String get secVashCodeLabel2 => 'Koda Vash';

  @override
  String get secVashCodeDescription =>
      'Odpre aplikacijo normalno... toda vsi podatki so tiho izbrisani v ozadju';

  @override
  String get secVashWhatHappensTitle => 'Kaj se zgodi potem';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikacija se odpre normalno. Brez opozoril, brez sumljivih animacij. Zaslon preprosto pokaze prazno aplikacijo, kot da ste jo pravkar namestili.\n\nV resnici so bili vsi vasi pogovori, stiki in sporocila nepreklicno izbrisani v delcku sekunde.';

  @override
  String get secCallsLabel => 'KLICI IN DATOTEKE';

  @override
  String get secCallsTitle => 'Vse je sifrirano';

  @override
  String get secCallsSubtitle =>
      'Ne samo sporocila. Absolutno vse, kar gre skozi Hash, je sifrirano od konca do konca.';

  @override
  String get secAudioCallTitle => 'Zvocni klici';

  @override
  String get secAudioCallDesc =>
      'Sifrirani od konca do konca prek WebRTC. Glas se prenasa neposredno med napravami.';

  @override
  String get secVideoCallTitle => 'Video klici';

  @override
  String get secVideoCallDesc =>
      'Enaka tehnologija, vsak tok sifriran posamezno.';

  @override
  String get secPhotosTitle => 'Fotografije in videi';

  @override
  String get secPhotosDesc =>
      'Sifrirani z AES-256-GCM pred posiljanjem s telefona.';

  @override
  String get secDocsTitle => 'Dokumenti';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, katera koli datoteka. Ime, velikost in vsebina sifrirani.';

  @override
  String get secAnonLabel => 'ANONIMNOST';

  @override
  String get secAnonTitle => 'Identiteta ni potrebna';

  @override
  String get secAnonSubtitle =>
      'Hash nikoli ne zahteva vase telefonske stevilke ali e-poste. Identificirani ste z edinstvenim in anonimnim Hash ID.';

  @override
  String get secHashIdTitle => 'Vas Hash ID';

  @override
  String get secHashIdDesc =>
      'To je vas edinstveni identifikator. Ne razkrije nicesar o vas: ne imena, ne stevilke, ne lokacije. Kot vzdevek, ki ga je nemogoce povezati z vaso resnično identiteto.\n\nZa dodajanje stika delite Hash ID ali skenirate QR code. To je vse. Brez sinhronizirane adresne knjige, brez predlogov \"Ljudje, ki jih morda poznate\".';

  @override
  String get secDataLabel => 'PODATKI';

  @override
  String get secDataTitle => 'Cesar Hash ne ve';

  @override
  String get secDataSubtitle =>
      'Najboljsi nacin za zascito vasih podatkov je, da jih ne zbiramo.';

  @override
  String get secNeverCollected => 'Nikoli zbrano';

  @override
  String get secNeverItem1 => 'Vsebina sporocil';

  @override
  String get secNeverItem2 => 'Seznam stikov';

  @override
  String get secNeverItem3 => 'Telefonska stevilka';

  @override
  String get secNeverItem4 => 'E-postni naslov';

  @override
  String get secNeverItem5 => 'IP naslov';

  @override
  String get secNeverItem6 => 'Lokacija';

  @override
  String get secNeverItem7 => 'Metapodatki (kdo komunicira s kom)';

  @override
  String get secNeverItem8 => 'Zgodovina klicev';

  @override
  String get secNeverItem9 => 'Adresna knjiga';

  @override
  String get secNeverItem10 => 'Oglaševalski identifikatorji';

  @override
  String get secTempStored => 'Zacasno shranjeno';

  @override
  String get secTempItem1 => 'Anonimni Hash ID (edinstveni identifikator)';

  @override
  String get secTempItem2 => 'Javni kljuci za sifriranje';

  @override
  String get secTempItem3 => 'Sifrirana sporocila v tranzitu (najv. 24h)';

  @override
  String get secTempNote =>
      'Tudi ti minimalni podatki vas ne morejo identificirati. Vas Hash ID ni povezan z nobeno osebno informacijo.';

  @override
  String get secFooterTitle => 'Vasa zasebnost, vasa svoboda';

  @override
  String get secFooterDesc =>
      'Hash uporablja enake tehnologije sifriranja kot najzahtevnejse profesionalne aplikacije. Vasa sporocila so zascitena z matematiko, ne z obljubami.';

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
