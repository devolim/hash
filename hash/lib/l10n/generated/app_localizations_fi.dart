// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Ei jälkiä. Ei kompromisseja.';

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
  String get conversations => 'Keskustelut';

  @override
  String get contacts => 'Yhteystiedot';

  @override
  String get noConversation => 'Ei keskusteluja';

  @override
  String get noConversationSubtitle =>
      'Lisää yhteystieto aloittaaksesi turvallisen keskustelun';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odottavaa pyyntöä',
      one: '1 odottava pyyntö',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lähetettyä pyyntöä odottaa',
      one: '1 lähetetty pyyntö odottaa',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Lisää yhteystieto';

  @override
  String get shareApp => 'Jaa sovellus';

  @override
  String get newMessage => 'Uusi viesti';

  @override
  String get newConversation => 'Lähetä viesti';

  @override
  String get settings => 'Asetukset';

  @override
  String get myHashId => 'Hash ID:ni';

  @override
  String get supportHash => 'Tue Hashia';

  @override
  String get supportHashSubtitle => 'Hash on voittoa tavoittelematon projekti';

  @override
  String get donate => 'Lahjoita';

  @override
  String get appearance => 'Ulkoasu';

  @override
  String get theme => 'Teema';

  @override
  String get themeAuto => 'Automaattinen';

  @override
  String get themeAutoSubtitle => 'Seuraa järjestelmäasetuksia';

  @override
  String get themeDark => 'Tumma';

  @override
  String get themeLight => 'Vaalea';

  @override
  String get themeRecommendation =>
      'Tumma teema on suositeltava paremman yksityisyyden vuoksi';

  @override
  String get language => 'Kieli';

  @override
  String get languageAuto => 'Automaattinen (järjestelmä)';

  @override
  String get notifications => 'Ilmoitukset';

  @override
  String get messages => 'Viestit';

  @override
  String get calls => 'Puhelut';

  @override
  String get vibration => 'Värinä';

  @override
  String get notificationContent => 'Ilmoituksen sisältö';

  @override
  String get notificationContentFull => 'Näytä kaikki';

  @override
  String get notificationContentFullDesc =>
      'Yhteystiedon nimi ja viestin esikatselu';

  @override
  String get notificationContentName => 'Vain nimi';

  @override
  String get notificationContentNameDesc => 'Näyttää vain yhteystiedon nimen';

  @override
  String get notificationContentDiscrete => 'Huomaamaton';

  @override
  String get notificationContentDiscreteDesc => 'Näyttää vain \"Uusi viesti\"';

  @override
  String get security => 'Turvallisuus';

  @override
  String get howHashProtectsYou => 'Kuinka Hash suojaa sinua';

  @override
  String get howHashProtectsYouSubtitle => 'Ymmärrä turvallisuutesi';

  @override
  String get accountSecurity => 'Tilin turvallisuus';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, Vash-tila';

  @override
  String get blockScreenshots => 'Estä kuvakaappaukset';

  @override
  String get transferDevice => 'Siirrä toiselle laitteelle';

  @override
  String get transferDeviceSubtitle => 'Siirrä tilisi';

  @override
  String get pinCode => 'PIN-koodi';

  @override
  String get changePin => 'Vaihda PIN-koodi';

  @override
  String get currentPin => 'Nykyinen PIN-koodi';

  @override
  String get newPin => 'Uusi PIN-koodi';

  @override
  String get confirmPin => 'Vahvista PIN-koodi';

  @override
  String get pinChanged => 'PIN-koodi vaihdettu';

  @override
  String get incorrectPin => 'Väärä PIN';

  @override
  String get pinsDoNotMatch => 'PIN-koodit eivät täsmää';

  @override
  String get autoLock => 'Automaattinen lukitus';

  @override
  String get autoLockDelay => 'Lukitusviive';

  @override
  String get autoLockImmediate => 'Välitön';

  @override
  String get autoLockMinute => '1 minuutti';

  @override
  String autoLockMinutes(int count) {
    return '$count minuuttia';
  }

  @override
  String get vashCode => 'Vash-koodi';

  @override
  String get vashModeTitle => 'Vash-tila';

  @override
  String get vashModeExplanation => 'Viimeinen turvaverkkosi.';

  @override
  String get vashModeDescription =>
      'Valitset toisen PIN-koodin. Jos sinut koskaan pakotetaan avaamaan Hash, syötä tämä koodi tavallisen PIN-koodisi sijaan.\n\nSovellus avautuu normaalisti, mutta kaikki keskustelusi ja yhteystietosi ovat kadonneet.\n\nKenelle tahansa joka katsoo näyttöäsi, Hash näyttää yksinkertaisesti tyhjältä — kuin et olisi koskaan käyttänyt sitä.';

  @override
  String get vashModeIrreversible =>
      'Tämä toiminto on hiljainen ja peruuttamaton.';

  @override
  String get chooseVashCode => 'Valitse Vash-koodini';

  @override
  String get vashCodeInfo =>
      'Toinen PIN-koodi joka avaa sovelluksen normaalisti, mutta tyhjänä.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Jos syötät tämän koodin PIN-koodisi sijaan:';

  @override
  String get vashDeleteContacts => 'Yhteystietosi katoavat';

  @override
  String get vashDeleteMessages => 'Keskustelusi katoavat';

  @override
  String get vashDeleteHistory => 'Muistiinpanosi katoavat';

  @override
  String get vashKeepId => 'Hash-identiteettisi (#XXX-XXX-XXX) pysyy samana';

  @override
  String get vashAppearNormal =>
      'Sovellus näyttää normaalilta mutta tyhjältä, kuin uusi. Tämä toiminto on peruuttamaton.';

  @override
  String get setupVashCode => 'Aseta Vash-koodi';

  @override
  String get modifyVashCode => 'Muokkaa Vash-koodia';

  @override
  String get currentVashCode => 'Nykyinen Vash-koodi';

  @override
  String get newVashCode => 'Uusi Vash-koodi';

  @override
  String get confirmVashCode => 'Vahvista Vash-koodi';

  @override
  String get vashCodeConfigured => 'Vash-koodi asetettu';

  @override
  String get vashCodeModified => 'Vash-koodi muokattu';

  @override
  String get vashCodeMustDiffer => 'Vash-koodin on oltava eri kuin PIN';

  @override
  String get incorrectVashCode => 'Väärä Vash-koodi';

  @override
  String get vashWhatToDelete => 'Mitä Vash-tilan tulisi poistaa?';

  @override
  String get vashDeleteContactsOption => 'Yhteystiedot';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Viestit';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Muistiinpanot';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash-tila aktivoitu';

  @override
  String get vashCreateSubtitle => 'Valitse koodi, joka on eri kuin pää-PIN';

  @override
  String get vashConfirmSubtitle => 'Vahvista Vash-koodisi';

  @override
  String get pinCodeForEntry => 'PIN-koodi sovellukseen kirjautumiseen';

  @override
  String get vashCodeSection => 'Vash-tila';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Avaa sormenjäljellä tai Face ID:llä';

  @override
  String get enableBiometric => 'Ota biometria käyttöön';

  @override
  String get biometricWarningMessage =>
      'Biometrian käyttöönoton jälkeen et voi käyttää Vash-koodia sovellukseen kirjautumiseen.\n\nVoit käyttää Vash-koodia vain jos biometria epäonnistuu (useiden epäonnistuneiden yritysten jälkeen).\n\nHaluatko varmasti jatkaa?';

  @override
  String get understood => 'Ymmärrän';

  @override
  String get shareAppSubtitle => 'Jaa Hash läheistesi kanssa';

  @override
  String get share => 'Jaa';

  @override
  String get danger => 'Vaara';

  @override
  String get deleteAccount => 'Poista tilini';

  @override
  String get deleteAccountSubtitle => 'Peruuttamaton toiminto';

  @override
  String get deleteAccountConfirmTitle => 'Poista tilini';

  @override
  String get deleteAccountConfirmMessage =>
      'Tilisi poistetaan pysyvästi. Tätä toimintoa ei voi peruuttaa.\n\n• Kaikki keskustelusi\n• Kaikki yhteystietosi\n• Hash ID:si\n\nSinun on luotava uusi tili.';

  @override
  String get deleteForever => 'Poista pysyvästi';

  @override
  String get cancel => 'Peruuta';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash-tila aktivoitu.';

  @override
  String deletionError(String error) {
    return 'Poistamisvirhe: $error';
  }

  @override
  String get yourSecurity => 'Turvallisuutesi';

  @override
  String get securityInfo =>
      '• Päästä päähän -salaus (Signal Protocol)\n• Ei tietoja palvelimillamme toimituksen jälkeen\n• Avaimet tallennettu vain laitteellesi\n• PIN-koodia ei koskaan lähetetä palvelimelle';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Tervetuloa';

  @override
  String get securityStatement1 => 'Viestisi ovat suojattuja.';

  @override
  String get securityStatement2 => 'Päästä päähän -salaus.';

  @override
  String get securityStatement3 => 'Ei jälkiä. Ei kompromisseja.';

  @override
  String get securityStatement4 => 'Yksityisyytesi on oikeus.';

  @override
  String get accessBlocked => 'Pääsy estetty';

  @override
  String get tooManyAttempts =>
      'Liian monta yritystä. Yritä myöhemmin uudelleen.';

  @override
  String get pleaseWait => 'Odota';

  @override
  String get waitDelay => 'Odota viiveen päättymistä';

  @override
  String attemptCount(int current, int max) {
    return 'Yritys $current/$max';
  }

  @override
  String retryIn(String time) {
    return 'Yritä uudelleen $time kuluttua';
  }

  @override
  String get forgotPin => 'Unohditko PIN:n? Käytä palautuslausetta';

  @override
  String get useRecoveryPhrase => 'Käytä palautuslausetta';

  @override
  String get recoveryWarningTitle => 'Varoitus';

  @override
  String get recoveryWarningMessage => 'Tilin palautus:';

  @override
  String get recoveryDeleteAllMessages => 'Poistaa KAIKKI viestisi';

  @override
  String get recoveryWaitDelay => 'Vaatii 1 tunnin viiveen';

  @override
  String get recoveryKeepContacts => 'Säilyttää yhteystietosi';

  @override
  String get recoveryIrreversible =>
      'Tämä toiminto on peruuttamaton. Viestisi menetetään pysyvästi.';

  @override
  String get iUnderstand => 'Ymmärrän';

  @override
  String get accountRecovery => 'Tilin palautus';

  @override
  String get enterRecoveryPhrase =>
      'Syötä palautuslauseesi 24 sanaa välilyönneillä erotettuina.';

  @override
  String get recoveryPhraseHint => 'sana1 sana2 sana3 ...';

  @override
  String get recover => 'Palauta';

  @override
  String get recoveryPhraseRequired => 'Syötä palautuslauseesi';

  @override
  String get recoveryPhrase24Words => 'Lauseen on sisällettävä tasan 24 sanaa';

  @override
  String get incorrectRecoveryPhrase => 'Väärä palautuslause';

  @override
  String get recoveryInitError => 'Virhe palautuksen alustuksessa';

  @override
  String get securityDelay => 'Turvallisuusviive';

  @override
  String get securityDelayMessage =>
      'Turvallisuutesi vuoksi odotusaika vaaditaan ennen kuin voit luoda uuden PIN:n.';

  @override
  String get timeRemaining => 'Aikaa jäljellä';

  @override
  String get messagesDeletedForProtection =>
      'Viestisi on poistettu suojauksesi vuoksi.';

  @override
  String get canCloseApp => 'Voit sulkea sovelluksen ja palata myöhemmin.';

  @override
  String get onboardingTitle1 => 'Tervetuloa Hashiin';

  @override
  String get onboardingSubtitle1 => 'Viestisovellus, joka ei jätä jälkiä';

  @override
  String get onboardingTitle2 => 'Täysi salaus';

  @override
  String get onboardingSubtitle2 =>
      'Viestisi salataan päästä päähän Signal-protokollalla';

  @override
  String get onboardingTitle3 => 'Ei jälkiä';

  @override
  String get onboardingSubtitle3 =>
      'Viestit poistetaan palvelimilta toimituksen jälkeen';

  @override
  String get onboardingTitle4 => 'Turvallisuutesi';

  @override
  String get onboardingSubtitle4 => 'PIN-koodi, Vash-tila ja palautuslause';

  @override
  String get getStarted => 'Aloita';

  @override
  String get next => 'Seuraava';

  @override
  String get skip => 'Ohita';

  @override
  String get alreadyHaveAccount => 'Minulla on jo tili';

  @override
  String get transferMyAccount => 'Siirrä tilini';

  @override
  String get createPin => 'Luo PIN-koodi';

  @override
  String get createPinSubtitle => 'Tämä koodi suojaa pääsyn sovellukseesi';

  @override
  String get confirmYourPin => 'Vahvista PIN-koodisi';

  @override
  String get confirmPinSubtitle => 'Syötä PIN-koodisi uudelleen';

  @override
  String get saveRecoveryPhrase => 'Palautuslause';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Kirjoita nämä 24 sanaa muistiin järjestyksessä. Niiden avulla voit palauttaa tilisi, jos unohdat PIN:si.';

  @override
  String get phraseWritten => 'Olen kirjoittanut lauseeni';

  @override
  String get warningRecoveryPhrase =>
      'Jos menetät tämän lauseen ja unohdat PIN:si, menetät pääsyn tiliisi.';

  @override
  String get accountTransferred => 'Tili siirretty';

  @override
  String get accountTransferredMessage =>
      'Tilisi on siirretty toiselle laitteelle. Tämä istunto ei ole enää voimassa.';

  @override
  String get accountTransferredInfo =>
      'Jos et aloittanut tätä siirtoa, tilisi on saattanut vaarantua.';

  @override
  String get logout => 'Kirjaudu ulos';

  @override
  String get transferAccount => 'Siirrä tili';

  @override
  String get transferAccountInfo =>
      'Siirrä Hash-tilisi uudelle laitteelle. Nykyinen istuntosi mitätöidään.';

  @override
  String get generateTransferCode => 'Luo siirtokoodi';

  @override
  String get transferCode => 'Siirtokoodi';

  @override
  String transferCodeExpires(int minutes) {
    return 'Tämä koodi vanhenee $minutes minuutin kuluttua';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Syötä tämä koodi uudella laitteellasi siirtääksesi tilisi.';

  @override
  String get generateNewCode => 'Luo uusi koodi';

  @override
  String get scanQrCode => 'Skannaa QR-koodi';

  @override
  String get scanQrCodeSubtitle =>
      'Skannaa yhteystiedon QR-koodi lisätäksesi hänet';

  @override
  String get qrCodeDetected => 'QR-koodi tunnistettu';

  @override
  String get invalidQrCode => 'Virheellinen QR-koodi';

  @override
  String get cameraPermissionRequired => 'Kameran käyttöoikeus vaaditaan';

  @override
  String get myQrCode => 'QR-koodini';

  @override
  String get myQrCodeSubtitle =>
      'Jaa tämä QR-koodi, jotta yhteystietosi voivat lisätä sinut';

  @override
  String get shareQrCode => 'Jaa';

  @override
  String get addContactTitle => 'Lisää yhteystieto';

  @override
  String get addContactByHashId => 'Syötä yhteystietosi Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Hae';

  @override
  String get contactNotFound => 'Yhteystietoa ei löytynyt';

  @override
  String get contactAlreadyAdded => 'Tämä yhteystieto on jo listallasi';

  @override
  String get contactAdded => 'Yhteystieto lisätty';

  @override
  String get myProfile => 'Profiilini';

  @override
  String get myProfileSubtitle =>
      'Jaa nämä tiedot, jotta muut voivat lisätä sinut';

  @override
  String get temporaryCode => 'Väliaikainen koodi';

  @override
  String temporaryCodeExpires(String time) {
    return 'Vanhenee $time kuluttua';
  }

  @override
  String get codeExpired => 'Koodi vanhentunut';

  @override
  String get generateNewCodeButton => 'Uusi koodi';

  @override
  String get copyHashId => 'Kopioi ID';

  @override
  String get copyCode => 'Kopioi koodi';

  @override
  String get copiedToClipboard => 'Kopioitu';

  @override
  String get showMyQrCode => 'Näytä QR-koodini';

  @override
  String get orDivider => 'tai';

  @override
  String get openScanner => 'Avaa skanneri';

  @override
  String get addManually => 'Lisää manuaalisesti';

  @override
  String get contactHashIdLabel => 'Yhteystiedon Hash ID';

  @override
  String get temporaryCodeLabel => 'Väliaikainen koodi';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Pyydä yhteystietoasi luomaan koodi profiilistaan';

  @override
  String get verifyAndAdd => 'Tarkista ja lisää';

  @override
  String get fillAllFields => 'Täytä kaikki kentät';

  @override
  String get invalidHashIdFormat =>
      'Virheellinen ID-muoto (esim.: 123-456-ABC)';

  @override
  String get userNotFound => 'Käyttäjää ei löytynyt';

  @override
  String get cannotAddYourself => 'Et voi lisätä itseäsi';

  @override
  String get invalidOrExpiredCode =>
      'Virheellinen tai vanhentunut väliaikainen koodi';

  @override
  String get contactFound => 'Yhteystieto löytyi!';

  @override
  String get howToCallContact => 'Millä nimellä haluat kutsua häntä?';

  @override
  String get contactNameHint => 'Yhteystiedon nimi';

  @override
  String get addContactButton => 'Lisää';

  @override
  String get contactDetails => 'Yhteystiedon tiedot';

  @override
  String get contactName => 'Yhteystiedon nimi';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Lisätty $date';
  }

  @override
  String get deleteContact => 'Poista yhteystieto';

  @override
  String deleteContactConfirm(Object name) {
    return 'Poista tämä yhteystieto?';
  }

  @override
  String get deleteContactMessage => 'Tämä poistaa myös koko keskustelun.';

  @override
  String get delete => 'Poista';

  @override
  String get typeMessage => 'Kirjoita viesti...';

  @override
  String get messageSent => 'Lähetetty';

  @override
  String get messageDelivered => 'Toimitettu';

  @override
  String get messageRead => 'Luettu';

  @override
  String get messageFailed => 'Lähetys epäonnistui';

  @override
  String get now => 'Nyt';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}t';
  }

  @override
  String daysAgo(int count) {
    return '${count}pv';
  }

  @override
  String get today => 'Tänään';

  @override
  String get yesterday => 'Eilen';

  @override
  String dateAtTime(String date, String time) {
    return '$date klo $time';
  }

  @override
  String get shareMessage =>
      'Liity mukaani Hashissa! 🔒\n\nSe on todella yksityinen viestisovellus: täysi salaus, ei jälkiä palvelimilla ja paniikkitila tarvittaessa.\n\nLataa sovellus täältä 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Virhe';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Näytä';

  @override
  String get yes => 'Kyllä';

  @override
  String get no => 'Ei';

  @override
  String get save => 'Tallenna';

  @override
  String get edit => 'Muokkaa';

  @override
  String get close => 'Sulje';

  @override
  String get confirm => 'Vahvista';

  @override
  String get loading => 'Ladataan...';

  @override
  String get retry => 'Yritä uudelleen';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Odottavat pyynnöt';

  @override
  String get noPendingRequests => 'Ei odottavia pyyntöjä';

  @override
  String get pendingRequestsSubtitle => 'Nämä henkilöt haluavat lisätä sinut';

  @override
  String requestFromUser(String hashId) {
    return 'Pyyntö käyttäjältä $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Vanhenee $days päivän kuluttua';
  }

  @override
  String get acceptRequest => 'Hyväksy';

  @override
  String get rejectRequest => 'Hylkää';

  @override
  String get requestAccepted => 'Pyyntö hyväksytty';

  @override
  String get requestRejected => 'Pyyntö hylätty';

  @override
  String get requestSent => 'Pyyntö lähetetty!';

  @override
  String get requestSentSubtitle =>
      'Pyyntösi on lähetetty. Käyttäjän on hyväksyttävä se ennen kuin voitte keskustella.';

  @override
  String get requestAlreadyPending => 'Pyyntö on jo odottamassa';

  @override
  String get requestAlreadySentByOther =>
      'Tämä henkilö on jo lähettänyt sinulle pyynnön';

  @override
  String get addByHashId => 'Lisää Hash ID:llä';

  @override
  String get addByHashIdSubtitle =>
      'Syötä yhteystiedon Hash ID ja väliaikainen koodi';

  @override
  String get enterTemporaryCode => 'Syötä 6-numeroinen koodi';

  @override
  String get sendRequest => 'Lähetä pyyntö';

  @override
  String get acceptContactTitle => 'Hyväksy yhteystieto';

  @override
  String get acceptContactSubtitle => 'Voit antaa hänelle mukautetun nimen';

  @override
  String get leaveEmptyForHashId => 'Jätä tyhjäksi käyttääksesi Hash ID:tä';

  @override
  String get firstName => 'Etunimi';

  @override
  String get lastName => 'Sukunimi';

  @override
  String get notes => 'Muistiinpanot';

  @override
  String get notesHint => 'Henkilökohtaiset muistiinpanot tästä yhteystiedosta';

  @override
  String get photoOptional => 'Kuva (valinnainen)';

  @override
  String get contactNameOptional => 'Nimi (valinnainen)';

  @override
  String get notesOptional => 'Muistiinpanot (valinnainen)';

  @override
  String get storedLocally => 'Tallennettu vain laitteellesi';

  @override
  String get encryptedMessageLabel => 'Salattu viesti';

  @override
  String get identityMessageHint => 'Kuka olet? Mistä tunnette toisenne?';

  @override
  String get messageWillBeSentEncrypted =>
      'Tämä viesti salataan ja lähetetään vastaanottajalle';

  @override
  String get sendRequestButton => 'Lähetä pyyntö';

  @override
  String get requestExpiresIn24h =>
      'Pyyntö vanhenee 24 tunnissa, jos sitä ei hyväksytä';

  @override
  String get theyAlreadySentYouRequest =>
      'Tämä henkilö on jo lähettänyt sinulle pyynnön';

  @override
  String get requests => 'Pyynnöt';

  @override
  String get receivedRequests => 'Vastaanotetut';

  @override
  String get sentRequests => 'Lähetetyt';

  @override
  String get noSentRequests => 'Ei lähetettyjä pyyntöjä';

  @override
  String get cancelRequest => 'Peruuta';

  @override
  String get deleteRequest => 'Poista pyyntö';

  @override
  String get requestCancelled => 'Pyyntö peruutettu';

  @override
  String sentTo(String hashId) {
    return 'Lähetetty käyttäjälle $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Vanhenee $time kuluttua';
  }

  @override
  String receivedAgo(String time) {
    return 'Vastaanotettu $time sitten';
  }

  @override
  String get messageFromRequester => 'Viesti pyytäjältä';

  @override
  String get copy => 'Kopioi';

  @override
  String get messageInfo => 'Viestin tiedot';

  @override
  String get messageDirection => 'Suunta';

  @override
  String get messageSentByYou => 'Sinun lähettämä';

  @override
  String get messageReceived => 'Vastaanotettu';

  @override
  String get messageSentAt => 'Lähetetty';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Tila';

  @override
  String get messageReadAt => 'Luettu';

  @override
  String get messageType => 'Tyyppi';

  @override
  String get messageSize => 'Koko';

  @override
  String get messageExpiresAt => 'Vanhenee';

  @override
  String get messageEncrypted => 'Päästä päähän salattu';

  @override
  String get messageStatusSending => 'Lähetetään...';

  @override
  String get messageStatusSent => 'Lähetetty';

  @override
  String get messageStatusDelivered => 'Toimitettu';

  @override
  String get messageStatusRead => 'Luettu';

  @override
  String get messageStatusFailed => 'Epäonnistui';

  @override
  String get serverStatus => 'Palvelin';

  @override
  String get onServer => 'Odottaa toimitusta';

  @override
  String get deletedFromServer => 'Poistettu';

  @override
  String get messageTypeText => 'Teksti';

  @override
  String get messageTypeImage => 'Kuva';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Ääni';

  @override
  String get messageTypeFile => 'Tiedosto';

  @override
  String get indefinitely => 'Toistaiseksi';

  @override
  String get hoursShort => 't';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'tuntia';

  @override
  String get minutes => 'minuuttia';

  @override
  String get seconds => 'sekuntia';

  @override
  String get ephemeralMessages => 'Katoavat viestit';

  @override
  String get ephemeralMessagesDescription =>
      'Viestit poistetaan automaattisesti tämän ajan jälkeen';

  @override
  String get ephemeralImmediate => 'Välitön (lukemisen jälkeen)';

  @override
  String get ephemeralImmediateDesc => 'Poistetaan lukemisen jälkeen';

  @override
  String get ephemeralMyPreference => 'Oma valintani';

  @override
  String get ephemeralMyPreferenceDesc => 'Käytä yleisasetusta';

  @override
  String get ephemeralDefaultSetting => 'Viestin kesto';

  @override
  String get ephemeralChooseDefault => 'Suositeltu';

  @override
  String get ephemeral30Seconds => '30 sekuntia';

  @override
  String get ephemeral30SecondsDesc => 'Poistetaan 30s lukemisen jälkeen';

  @override
  String get ephemeral5Minutes => '5 minuuttia';

  @override
  String get ephemeral5MinutesDesc => 'Poistetaan 5min lukemisen jälkeen';

  @override
  String get ephemeral1Hour => '1 tunti';

  @override
  String get ephemeral1HourDesc => 'Poistetaan 1t lukemisen jälkeen';

  @override
  String get ephemeral3Hours => '3 tuntia';

  @override
  String get ephemeral6Hours => '6 tuntia';

  @override
  String get ephemeral6HoursDesc => 'Poistetaan 6t lukemisen jälkeen';

  @override
  String get ephemeral12Hours => '12 tuntia';

  @override
  String get ephemeral24Hours => '24 tuntia';

  @override
  String get ephemeral24HoursDesc => 'Poistetaan 24t lukemisen jälkeen';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Mukautettu kesto';

  @override
  String get howItWorks => 'Miten se toimii';

  @override
  String get ephemeralExplanation1 =>
      'Viestit poistetaan palvelimelta heti vastaanoton jälkeen.';

  @override
  String get ephemeralExplanation2 =>
      'Tämä asetus määrittää, milloin viestit katoavat SINUN puhelimestasi lukemisen jälkeen.';

  @override
  String get ephemeralExplanation3 =>
      'Yhteystiedollasi on oma asetuksensa omalle puhelimelleen.';

  @override
  String get mute1Hour => '1 tunti';

  @override
  String get mute8Hours => '8 tuntia';

  @override
  String get mute1Day => '1 päivä';

  @override
  String get mute1Week => '1 viikko';

  @override
  String get muteAlways => 'Aina';

  @override
  String get muteExplanation => 'Et saa ilmoituksia tästä yhteystiedosta';

  @override
  String get showCallsInRecents => 'Näytä viimeaikaisissa puheluissa';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash-puhelut näkyvät puhelimen puheluhistoriassa';

  @override
  String get feedback => 'Palaute';

  @override
  String get muteNotifications => 'Mykistä ilmoitukset';

  @override
  String get muteDescription => 'Et saa ilmoituksia tästä yhteystiedosta';

  @override
  String mutedUntil(String time) {
    return 'Mykistetty $time asti';
  }

  @override
  String get notMuted => 'Ilmoitukset käytössä';

  @override
  String get unmute => 'Poista mykistys';

  @override
  String get notificationSound => 'Ilmoitusääni';

  @override
  String get defaultSound => 'Oletus';

  @override
  String get chatSettings => 'Keskustelun asetukset';

  @override
  String get bubbleColor => 'Kuplan väri';

  @override
  String get backgroundColor => 'Taustaväri';

  @override
  String get backgroundImage => 'Taustakuva';

  @override
  String get chatBackground => 'Keskustelun tausta';

  @override
  String get customColor => 'Mukautettu';

  @override
  String get defaultColor => 'Oletus';

  @override
  String get imageSelected => 'Kuva valittu';

  @override
  String get noImage => 'Ei kuvaa';

  @override
  String get color => 'Väri';

  @override
  String get image => 'Kuva';

  @override
  String get tapToSelectImage => 'Napauta valitaksesi kuvan';

  @override
  String get changeImage => 'Vaihda kuva';

  @override
  String get previewMessageReceived => 'Hei!';

  @override
  String get previewMessageSent => 'Moikka!';

  @override
  String get messageAction => 'Viesti';

  @override
  String get callAction => 'Puhelu';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Henkilökohtaiset muistiinpanot';

  @override
  String get addNotes => 'Lisää muistiinpanoja...';

  @override
  String get noNotes => 'Ei muistiinpanoja';

  @override
  String get messageNotifications => 'Viesti-ilmoitukset';

  @override
  String get callNotifications => 'Puheluilmoitukset';

  @override
  String get useGradient => 'Käytä liukuväriä';

  @override
  String get gradientStart => 'Alkuväri';

  @override
  String get gradientEnd => 'Loppuväri';

  @override
  String get preview => 'Esikatselu';

  @override
  String get reset => 'Nollaa';

  @override
  String get securityNumber => 'Turvanumero';

  @override
  String securityNumberDescription(String name) {
    return 'Varmista, että turvanumero vastaa käyttäjän $name laitetta';
  }

  @override
  String get verifyEncryption => 'Tarkista päästä päähän -salaus';

  @override
  String get tapToCopy => 'Napauta kopioidaksesi';

  @override
  String get howToVerify => 'Kuinka tarkistaa';

  @override
  String get verifyStep1 =>
      'Tapaa yhteystietosi henkilökohtaisesti tai soita hänelle';

  @override
  String get verifyStep2 => 'Vertaa turvanumeroita tai skannaa QR-koodit';

  @override
  String get verifyStep3 => 'Jos ne täsmäävät, keskustelusi on turvallinen';

  @override
  String get scanToVerify => 'Skannaa tarkistaaksesi';

  @override
  String get reportSpam => 'Ilmianna roskaposti';

  @override
  String get reportSpamSubtitle => 'Ilmianna tämä yhteystieto roskapostiksi';

  @override
  String get reportSpamDescription =>
      'Tämä yhteystieto ilmiannetaan anonyymisti. Henkilöllisyyttäsi ei jaeta. Oletko varma?';

  @override
  String get report => 'Ilmianna';

  @override
  String get spamReported => 'Roskaposti ilmiannettu';

  @override
  String get reportError =>
      'Ilmiannon lähettäminen epäonnistui. Yritä uudelleen.';

  @override
  String get reportRateLimited =>
      'Olet saavuttanut tämän päivän ilmiantojen enimmäismäärän.';

  @override
  String get blockContact => 'Estä yhteystieto';

  @override
  String get blockContactDescription =>
      'Tämä yhteystieto ei voi enää lähettää sinulle viestejä tai soittaa sinulle. Häntä ei ilmoiteta.';

  @override
  String get unblockContact => 'Poista esto';

  @override
  String get unblockContactDescription =>
      'Tämä yhteystieto voi jälleen lähettää sinulle viestejä ja soittaa sinulle.';

  @override
  String get contactBlocked => 'Yhteystieto estetty';

  @override
  String get contactUnblocked => 'Esto poistettu';

  @override
  String get contactIsBlocked => 'Tämä yhteystieto on estetty';

  @override
  String get unblock => 'Poista esto';

  @override
  String get deleteContactSubtitle => 'Poista tämä yhteystieto ja keskustelu';

  @override
  String get confirmWithPin => 'Vahvista PIN:llä';

  @override
  String get enterPinToConfirm => 'Syötä PIN vahvistaaksesi tämän toiminnon';

  @override
  String get profilePhoto => 'Profiilikuva';

  @override
  String get takePhoto => 'Ota kuva';

  @override
  String get chooseFromGallery => 'Valitse galleriasta';

  @override
  String get removePhoto => 'Poista kuva';

  @override
  String get viewContactHashId => 'Näytä yhteystiedon tunniste';

  @override
  String get hashIdPartiallyMasked =>
      'Osittain peitetty turvallisuutesi ja yhteystietosi yksityisyyden vuoksi';

  @override
  String get addFirstContact => 'Lisää ensimmäinen yhteystietosi';

  @override
  String get addFirstContactSubtitle =>
      'Jaa QR-koodisi tai skannaa ystäväsi koodi';

  @override
  String get directory => 'Yhteystietoluettelo';

  @override
  String get noContacts => 'Ei yhteystietoja';

  @override
  String get noContactsSubtitle => 'Lisää yhteystieto aloittaaksesi';

  @override
  String get sendMessageAction => 'Lähetä viesti';

  @override
  String get audioCall => 'Äänipuhelu';

  @override
  String get videoCall => 'Videopuhelu';

  @override
  String get viewProfile => 'Näytä profiili';

  @override
  String get deleteContactDirectory => 'Poista yhteystieto';

  @override
  String get scanShort => 'Skannaa';

  @override
  String get addShort => 'Lisää';

  @override
  String deleteContactConfirmName(String name) {
    return 'Haluatko varmasti poistaa käyttäjän $name?';
  }

  @override
  String get noNotesTitle => 'Ei muistiinpanoja';

  @override
  String get noNotesSubtitle => 'Luo ensimmäinen muistiinpanosi';

  @override
  String get newNote => 'Uusi muistiinpano';

  @override
  String get editNote => 'Muokkaa muistiinpanoa';

  @override
  String get deleteNote => 'Poista muistiinpano';

  @override
  String get deleteNoteConfirm =>
      'Haluatko varmasti poistaa tämän muistiinpanon?';

  @override
  String get noteTitle => 'Otsikko';

  @override
  String get noteContent => 'Sisältö';

  @override
  String get addItem => 'Lisää kohde';

  @override
  String get pinNote => 'Kiinnitä';

  @override
  String get unpinNote => 'Irrota';

  @override
  String get noteColor => 'Väri';

  @override
  String get notePassword => 'Salasana';

  @override
  String get setPassword => 'Aseta salasana';

  @override
  String get changePassword => 'Vaihda salasana';

  @override
  String get removePassword => 'Poista salasana';

  @override
  String get enterPassword => 'Syötä salasana';

  @override
  String get confirmPassword => 'Vahvista salasana';

  @override
  String get passwordPin => 'PIN-koodi';

  @override
  String get passwordText => 'Tekstisalasana';

  @override
  String get protectedNote => 'Suojattu muistiinpano';

  @override
  String get incorrectPassword => 'Väärä salasana';

  @override
  String get passwordSet => 'Salasana asetettu';

  @override
  String get passwordRemoved => 'Salasana poistettu';

  @override
  String get notesBiometric => 'Face ID muistiinpanoille';

  @override
  String get notesBiometricSubtitle =>
      'Vaadi biometrinen tunnistautuminen suojattujen muistiinpanojen avaamiseen';

  @override
  String get textNote => 'Tekstimuistiinpano';

  @override
  String get checklistNote => 'Tarkistuslista';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tehtävää';
  }

  @override
  String get autoSaved => 'Tallennettu';

  @override
  String get searchNotes => 'Hae muistiinpanoja';

  @override
  String get legalConsent => 'Oikeudellinen suostumus';

  @override
  String get confirmAge13 => 'Vahvistan olevani vähintään 13-vuotias';

  @override
  String get acceptLegalStart => 'Hyväksyn ';

  @override
  String get privacyPolicy => 'Tietosuojakäytännön';

  @override
  String get termsOfService => 'Käyttöehdot';

  @override
  String get andThe => ' ja ';

  @override
  String get continueButton => 'Jatka';

  @override
  String get mustAcceptTerms =>
      'Sinun on hyväksyttävä molemmat ehdot jatkaaksesi';

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
  String get support => 'Tuki';

  @override
  String get contactSupport => 'Ota yhteyttä tukeen';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Ilmianna väärinkäyttö';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Oikeudelliset tiedot';

  @override
  String get legalEntity => 'Oikeushenkilö';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Kiinnitä';

  @override
  String get unpinConversation => 'Irrota';

  @override
  String get hideConversation => 'Poista syötteestä';

  @override
  String get deleteConversation => 'Poista keskustelu';

  @override
  String get deleteConversationConfirm =>
      'Syötä PIN vahvistaaksesi kaikkien viestien poistamisen';

  @override
  String get noConversations => 'Ei vielä keskusteluja';

  @override
  String get startConversation => 'Aloita';

  @override
  String get microphonePermissionRequired =>
      'Mikrofonin käyttöoikeus vaaditaan';

  @override
  String get microphonePermissionExplanation =>
      'Hash tarvitsee mikrofonin puheluihin.';

  @override
  String get cameraPermissionExplanation =>
      'Hash tarvitsee kameran videopuheluihin.';

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
  String get openSettings => 'Avaa asetukset';

  @override
  String get callConnecting => 'Yhdistetään...';

  @override
  String get callRinging => 'Soi...';

  @override
  String get callReconnecting => 'Yhdistetään uudelleen...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Yhdistetään uudelleen (${seconds}s)';
  }

  @override
  String get callPaused => 'Tauolla';

  @override
  String get callPausedSubtitle => 'Puhelu on edelleen käynnissä';

  @override
  String get callRemoteMicMuted => 'Yhteystiedon mikrofoni on mykistetty';

  @override
  String get callMiniControlsMute => 'Mykistä';

  @override
  String get callMiniControlsUnmute => 'Poista mykistys';

  @override
  String get callMiniControlsHangUp => 'Lopeta puhelu';

  @override
  String get callMiniControlsReturn => 'Palaa puheluun';

  @override
  String get callNetworkPoor => 'Epävakaa yhteys';

  @override
  String get callNetworkLost => 'Yhteys katkesi';

  @override
  String get callEndedTitle => 'Puhelu päättyi';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Laitteen tiedot';

  @override
  String get deviceDataSubtitle => 'Paikallinen ja palvelimen tallennus';

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
  String get localStorage => 'Paikallinen tallennus';

  @override
  String get onThisDevice => 'tällä laitteella';

  @override
  String get encryptedDatabases => 'Salatut tietokannat';

  @override
  String get files => 'Tiedostot';

  @override
  String get secureKeychain => 'Suojattu avainketju';

  @override
  String get cache => 'Välimuisti';

  @override
  String get contactsDetail => 'Nimet, avatarit, Signal-avaimet';

  @override
  String get messagesDetail => 'Salatut keskustelut';

  @override
  String get notesDetail => 'Henkilökohtaiset muistiinpanot';

  @override
  String get signalSessions => 'Signal-istunnot';

  @override
  String get signalSessionsDetail => 'Salausistunnot';

  @override
  String get pendingContacts => 'Odottavat yhteystiedot';

  @override
  String get pendingContactsDetail => 'Odottavat pyynnöt';

  @override
  String get callHistory => 'Puhelut';

  @override
  String get callHistoryDetail => 'Puheluhistoria';

  @override
  String get preferences => 'Asetukset';

  @override
  String get preferencesDetail => 'Media- ja puheluasetukset';

  @override
  String get avatars => 'Avatarit';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tiedostoa',
      one: '1 tiedosto',
      zero: 'ei tiedostoja',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktiivinen';

  @override
  String get notDefined => 'Ei määritelty';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Palautuslause';

  @override
  String get identity => 'Identiteetti (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol -avaimet';

  @override
  String get authTokens => 'Todennustunnisteet';

  @override
  String get contactNamesCache => 'Yhteystietonimien välimuisti';

  @override
  String get remoteConfig => 'Etäkonfiguraatio';

  @override
  String get notificationPrefs => 'Ilmoitusasetukset';

  @override
  String get serverData => 'Palvelimen tiedot';

  @override
  String get serverDataInfo =>
      'Hash säilyttää minimaalisen määrän tietoja palvelimella, kaikki salattuja tai väliaikaisia.';

  @override
  String get serverProfile => 'Profiili';

  @override
  String get serverProfileDetail =>
      'Hash ID, julkiset avaimet, postilaatikon tunniste';

  @override
  String get serverPrekeys => 'Esiavaimet';

  @override
  String get serverPrekeysDetail =>
      'Kertakäyttöiset Signal-avaimet (kulutetut)';

  @override
  String get serverMessages => 'Kuljetettavat viestit';

  @override
  String get serverMessagesDetail =>
      'Poistetaan toimituksen jälkeen (maks. 24t)';

  @override
  String get serverMedia => 'Kuljetettava media';

  @override
  String get serverMediaDetail => 'Poistetaan latauksen jälkeen';

  @override
  String get serverContactRequests => 'Yhteystietopyynnöt';

  @override
  String get serverContactRequestsDetail => 'Vanhenevat 24 tunnin jälkeen';

  @override
  String get serverRateLimits => 'Nopeusrajoitukset';

  @override
  String get serverRateLimitsDetail => 'Väliaikaiset väärinkäytön estotiedot';

  @override
  String get privacyReassurance =>
      'Hash ei voi lukea viestejäsi. Kaikki tiedot on salattu päästä päähän. Palvelimen tiedot poistetaan automaattisesti.';

  @override
  String get pinTooSimple =>
      'Tämä PIN on liian yksinkertainen. Valitse turvallisempi koodi.';

  @override
  String get genericError => 'Tapahtui virhe. Yritä uudelleen.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Tilin luonti epäonnistui: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Lause kopioitu leikepöydälle';

  @override
  String get copyPhrase => 'Kopioi lause';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Kirjoita tämä lause turvalliseen paikkaan. Jos menetät PIN:si ilman tätä lausetta, menetät pysyvästi pääsyn tietoihisi.';

  @override
  String get noMessages => 'Ei viestejä';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Poista kaikki viestit käyttäjän $name kanssa?';
  }

  @override
  String get confirmation => 'Vahvistus';

  @override
  String get untitled => 'Nimetön';

  @override
  String get noSessions => 'Ei istuntoja';

  @override
  String get unknownContact => 'Tuntematon yhteystieto';

  @override
  String get unnamed => 'Nimetön';

  @override
  String get noPendingRequestsAlt => 'Ei odottavia pyyntöjä';

  @override
  String get deleteAllCallHistory => 'Poista koko puheluhistoria?';

  @override
  String get noCalls => 'Ei puheluita';

  @override
  String get noPreferences => 'Ei asetuksia';

  @override
  String get resetAllMediaPrefs => 'Nollaa kaikki media-asetukset?';

  @override
  String get deleteThisAvatar => 'Poista tämä avatar?';

  @override
  String get deleteAllAvatars => 'Poista kaikki avatarit?';

  @override
  String get noAvatars => 'Ei avatareita';

  @override
  String get deleteThisFile => 'Poista tämä tiedosto?';

  @override
  String get deleteAllMediaFiles => 'Poista kaikki media?';

  @override
  String get noMediaFiles => 'Ei mediaa';

  @override
  String get outgoing => 'Lähtevä';

  @override
  String get incoming => 'Saapuva';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Katoava näkymä: ${seconds}s';
  }

  @override
  String get normalView => 'Normaali näkymä';

  @override
  String get callReasonCompleted => 'Päättynyt';

  @override
  String get callReasonMissed => 'Vastaamaton';

  @override
  String get callReasonDeclined => 'Hylätty';

  @override
  String get callReasonFailed => 'Epäonnistunut';

  @override
  String get justNow => 'Juuri nyt';

  @override
  String timeAgoMinutes(int count) {
    return '$count min sitten';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}t sitten';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}pv sitten';
  }

  @override
  String get messageTypeContact => 'Yhteystieto';

  @override
  String get messageTypeLocation => 'Sijainti';

  @override
  String get statusQueued => 'Jonossa';

  @override
  String get blockedBadge => 'Estetty';

  @override
  String get protectedBadge => 'Suojattu';

  @override
  String messageCount(int count) {
    return '$count viesti(ä)';
  }

  @override
  String get deleteQuestion => 'Poista?';

  @override
  String get transferMyAccountTitle => 'Siirrä tilini';

  @override
  String get loadingError => 'Latausvirhe';

  @override
  String get transferToNewDevice => 'Siirrä uudelle laitteelle';

  @override
  String get transferInstructions =>
      'Valitse uudella laitteellasi \"Palauta tilini\" ja syötä nämä tiedot:';

  @override
  String get yourHashIdLabel => 'Hash ID:si';

  @override
  String get enterYourPinCode => 'Syötä PIN-koodisi';

  @override
  String get pinOwnerConfirmation =>
      'Vahvistaaksesi, että olet tämän tilin omistaja';

  @override
  String get scanThisQrCode => 'Skannaa tämä QR-koodi';

  @override
  String get withYourNewDevice => 'Uudella laitteellasi';

  @override
  String get orEnterTheCode => 'tai syötä koodi';

  @override
  String get transferCodeLabel => 'Siirtokoodi';

  @override
  String get proximityVerification => 'Läheisyysvahvistus';

  @override
  String get bringDevicesCloser => 'Tuo molemmat laitteet lähemmäksi';

  @override
  String get confirmTransferQuestion => 'Vahvista siirto?';

  @override
  String get accountWillBeTransferred =>
      'Tilisi siirretään uudelle laitteelle.\n\nTämä laite poistetaan pysyvästi käytöstä.';

  @override
  String get transferComplete => 'Siirto valmis';

  @override
  String get transferSuccessMessage =>
      'Tilisi on siirretty onnistuneesti.\n\nTämä sovellus sulkeutuu nyt.';

  @override
  String get manualVerification => 'Manuaalinen vahvistus';

  @override
  String get codeDisplayedOnBothDevices =>
      'Koodi näytetään molemmilla laitteilla:';

  @override
  String get doesCodeMatchNewDevice =>
      'Vastaako tämä koodi uuden laitteen koodia?';

  @override
  String get verifiedStatus => 'Vahvistettu';

  @override
  String get inProgressStatus => 'Käynnissä...';

  @override
  String get notAvailableStatus => 'Ei saatavilla';

  @override
  String get codeExpiredRestart => 'Koodi on vanhentunut. Aloita uudelleen.';

  @override
  String get codesDoNotMatchCancelled =>
      'Koodit eivät täsmää. Siirto peruutettu.';

  @override
  String transferToDevice(String device) {
    return 'Kohde: $device';
  }

  @override
  String get copiedExclamation => 'Kopioitu!';

  @override
  String expiresInTime(String time) {
    return 'Vanhenee $time kuluttua';
  }

  @override
  String get biometricNotAvailable =>
      'Biometria ei ole saatavilla tällä laitteella';

  @override
  String get biometricAuthError => 'Virhe biometrisessä tunnistautumisessa';

  @override
  String get authenticateForBiometric =>
      'Tunnistaudu ottaaksesi biometrian käyttöön';

  @override
  String get biometricAuthFailed => 'Biometrinen tunnistautuminen epäonnistui';

  @override
  String get forceUpdateTitle => 'Päivitys vaaditaan';

  @override
  String get forceUpdateMessage =>
      'Uusi versio Hashista on saatavilla. Päivitä jatkaaksesi.';

  @override
  String get updateButton => 'Päivitä';

  @override
  String get maintenanceInProgress => 'Huolto käynnissä';

  @override
  String get tryAgainLater => 'Yritä myöhemmin uudelleen';

  @override
  String get information => 'Tiedot';

  @override
  String get later => 'Myöhemmin';

  @override
  String get doYouLikeHash => 'Pidätkö Hashista?';

  @override
  String get yourFeedbackHelps =>
      'Palautteesi auttaa meitä parantamaan sovellusta';

  @override
  String get ratingTerrible => 'Kauhea';

  @override
  String get ratingBad => 'Huono';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Hyvä';

  @override
  String get ratingExcellent => 'Erinomainen!';

  @override
  String get donationMessage =>
      'Hash on voittoa tavoittelematon projekti. Tukesi auttaa meitä jatkamaan todella yksityisen viestisovelluksen rakentamista.';

  @override
  String get recentConnections => 'Viimeaikaiset yhteydet';

  @override
  String get loginInfoText =>
      'Jokainen PIN-avaus kirjataan paikallisesti. Vain viimeiset 24 tuntia säilytetään.';

  @override
  String get connectionCount => 'Yhteys/yhteyksiä';

  @override
  String get periodLabel => 'Ajanjakso';

  @override
  String get historyLabel => 'Historia';

  @override
  String get noLoginRecorded => 'Ei kirjattuja kirjautumisia';

  @override
  String get nextUnlocksAppearHere => 'Seuraavat avaukset näkyvät täällä.';

  @override
  String get dataLocalOnly =>
      'Nämä tiedot tallennetaan vain laitteellesi eikä niitä koskaan lähetetä.';

  @override
  String get currentSession => 'Nykyinen';

  @override
  String get todayLabel => 'Tänään';

  @override
  String get yesterdayLabel => 'Eilen';

  @override
  String get justNowLabel => 'Juuri nyt';

  @override
  String minutesAgoLabel(int count) {
    return '$count min sitten';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}t sitten';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}t ${minutes}min sitten';
  }

  @override
  String get noMaintenancePlanned => 'Ei suunniteltuja huoltokatkoja';

  @override
  String get everythingWorkingNormally => 'Kaikki toimii normaalisti';

  @override
  String get maintenanceTitle => 'Huolto';

  @override
  String get maintenanceActiveLabel => 'KÄYNNISSÄ';

  @override
  String get maintenancePlannedLabel => 'SUUNNITELTU';

  @override
  String get locking => 'Lukitaan...';

  @override
  String get newMessageNotification => 'Uusi viesti';

  @override
  String get secExplainTitle => 'Kuinka Hash suojaa sinua';

  @override
  String get secExplainIntro =>
      'Hash on suunniteltu niin, ettei kukaan voi lukea viestejäsi.';

  @override
  String get secExplainIntroSub =>
      'Ei edes me.\nNäin se toimii, yksinkertaisesti selitettynä.';

  @override
  String get secJourneyLabel => 'MATKA';

  @override
  String get secJourneyTitle => 'Viestisi matka';

  @override
  String get secJourneySubtitle =>
      'Sormestasi yhteystietosi näytölle, jokainen vaihe on suojattu. Seuraa polkua.';

  @override
  String get secStep1Title => 'Kirjoitat viestisi';

  @override
  String get secStep1Desc =>
      'Kirjoitat \"Hei!\" sovelluksessa. Tässä vaiheessa viesti on olemassa vain puhelimesi muistissa. Mitään ei ole lähetetty.';

  @override
  String get secStep2Title => 'Salaus Signal-protokollalla';

  @override
  String get secStep2Desc =>
      'Heti kun painat \"Lähetä\", viestisi muuttuu käsittämättömiksi merkeiksi. On kuin viestisi lukittaisiin kassakaappiin, jonka avain on vain yhteystiedollasi.';

  @override
  String get secStep3Title => 'Sealed Sender: näkymätön kirjekuori';

  @override
  String get secStep3Desc =>
      'Kuvittele lähettäväsi kirjeen postitse, mutta ilman lähettäjän osoitetta kirjekuoressa. Juuri niin Hash tekee. Viesti pudotetaan anonyymiin postilaatikkoon. Palvelin ei tiedä, kuka sen lähetti.';

  @override
  String get secStep4Title => 'Palvelin ei näe mitään';

  @override
  String get secStep4Desc =>
      'Palvelin toimii sokeana postinkantajana. Se tietää vain \"joku pudotti jotain postilaatikkoon #A7X9\". Se ei tiedä kuka lähetti, mitä se on tai kenelle se on tarkoitettu.';

  @override
  String get secStep4Highlight =>
      'Ei tallennettuja metatietoja: ei IP-osoitetta, ei aikaleimaa, ei yhteyttä lähettäjän ja vastaanottajan välillä.';

  @override
  String get secStep5Title => 'Yhteystietosi vastaanottaa viestin';

  @override
  String get secStep5Desc =>
      'Yhteystietosi puhelin noutaa sisällön anonyymistä postilaatikostaan ja purkaa viestin salauksen yksityisellä avaimellaan, joka ei ole koskaan poistunut hänen laitteeltaan. \"Hei!\" ilmestyy hänen näytölleen.';

  @override
  String get secStep6Title => 'Viesti katoaa palvelimelta';

  @override
  String get secStep6Desc =>
      'Heti kun yhteystietosi vahvistaa vastaanoton, palvelin poistaa viestin pysyvästi. Ei roskakoria, ei arkistoa, ei varmuuskopiota. Jopa lukemattomat viestit tuhotaan automaattisesti 24 tunnin jälkeen.';

  @override
  String get secStep7Title => 'Paikallinen vanheneminen';

  @override
  String get secStep7Desc =>
      'Yhteystietosi puhelimessa viesti tuhoutuu itsestään valitsemasi keston mukaan: heti lukemisen jälkeen, 5 minuuttia, 1 tunti... sinä päätät.';

  @override
  String get secJourneyConclusion =>
      'Tulos: nolla jälkiä palvelimella, nolla jälkiä laitteilla. Viesti oli olemassa vain sen lukemiseen tarvittavan ajan, sitten se katosi.';

  @override
  String get secArchLabel => 'ARKKITEHTUURI';

  @override
  String get secArchTitle => '5 suojakerrosta';

  @override
  String get secArchSubtitle =>
      'Hash ei luota yhteen teknologiaan. Jokainen kerros vahvistaa muita. Vaikka yksi kerros murrettaisiin, tietosi pysyvät turvassa.';

  @override
  String get secLayer1Title => 'Päästä päähän -salaus';

  @override
  String get secLayer1Desc =>
      'Jokainen viesti salataan ainutlaatuisella avaimella. Yksinkertaisesti: vaikka joku purkaa yhden viestin salauksen, hän ei pysty purkamaan seuraavaa. Jokaisella viestillä on oma lukkonsa.';

  @override
  String get secLayer1Detail =>
      'Tiedostoille (kuvat, videot, dokumentit) Hash käyttää lisäksi AES-256-GCM-salausta. Tiedosto salataan ennen kuin se lähtee puhelimestasi.';

  @override
  String get secLayer2Title => 'Sealed Sender (verkon anonymiteetti)';

  @override
  String get secLayer2Desc =>
      'Tavalliset viestisovellukset lähettävät viestisi henkilöllisyytesi kanssa. Se on kuin kirjoittaisit nimesi kirjekuoreen. Hash käyttää anonyymejä postilaatikoita: palvelin toimittaa viestin tietämättä, kuka sen lähetti.';

  @override
  String get secLayer2Detail =>
      'Tulos: jopa palvelimen tietomurron tapauksessa on mahdotonta selvittää, kuka puhuu kenelle.';

  @override
  String get secLayer3Title => 'Automaattinen poisto';

  @override
  String get secLayer3Desc =>
      'Viestit poistetaan palvelimelta heti vastaanoton vahvistuksen jälkeen. Vaikka viestiä ei koskaan noudeta, se tuhotaan automaattisesti 24 tunnin jälkeen.';

  @override
  String get secLayer3Detail =>
      'Puhelimessasi viestit tuhoutuvat itsestään valitsemasi keston mukaan: heti, 5 min, 15 min, 30 min, 1t, 3t, 6t tai 12t.';

  @override
  String get secLayer4Title => 'Paikallinen pääsynsuojaus';

  @override
  String get secLayer4Desc =>
      'Sovellus on suojattu 6-numeroisella PIN-koodilla ja/tai biometrialla (Face ID, sormenjälki). Liian monen epäonnistuneen yrityksen jälkeen sovellus lukittuu kasvavalla viiveellä jokaisen epäonnistumisen jälkeen.';

  @override
  String get secLayer5Title => 'Lukittu tietokanta';

  @override
  String get secLayer5Desc =>
      'Palvelinpuolella kukaan käyttäjä ei voi kirjoittaa suoraan tietokantaan. Kaikki toiminnot kulkevat suojattujen funktioiden kautta, jotka tarkistavat jokaisen pyynnön.';

  @override
  String get secLayer5Detail =>
      'Se on kuin pankin palvelutiski: et koskaan kosketa holviin itse. Teet pyynnön, ja järjestelmä tarkistaa, että sinulla on oikeus ennen toimintaa.';

  @override
  String get secVashLabel => 'AINUTLAATUINEN MAAILMASSA';

  @override
  String get secVashTitle => 'Vash-tila';

  @override
  String get secVashSubtitle =>
      'Hätäturvallisuusjärjestelmä, jota ei ole missään muussa viestisovelluksessa.';

  @override
  String get secVashScenarioTitle => 'Kuvittele tämä tilanne';

  @override
  String get secVashScenario1 => 'Joku pääsee käsiksi puhelimeesi';

  @override
  String get secVashScenario2 => 'Sinulta kysytään PIN-koodiasi';

  @override
  String get secVashScenario3 => 'Haluat poistaa kaikki tietosi kiireellisesti';

  @override
  String get secVashSolutionTitle => 'Ratkaisu: kaksi PIN-koodia';

  @override
  String get secVashSolutionDesc => 'Asetat kaksi eri PIN-koodia Hashissa:';

  @override
  String get secVashNormalCodeLabel => 'Normaali koodi';

  @override
  String get secVashNormalCodeDesc =>
      'Avaa sovelluksen normaalisti kaikilla tiedoillasi';

  @override
  String get secVashCodeLabel2 => 'Vash-koodi';

  @override
  String get secVashCodeDescription =>
      'Avaa sovelluksen normaalisti... mutta kaikki tietosi poistetaan hiljaa taustalla';

  @override
  String get secVashWhatHappensTitle => 'Mitä tapahtuu seuraavaksi';

  @override
  String get secVashWhatHappensDesc =>
      'Sovellus avautuu normaalisti. Ei hälytystä, ei epäilyttävää animaatiota. Näyttö näyttää yksinkertaisesti tyhjän sovelluksen, kuin olisit juuri asentanut sen.\n\nTodellisuudessa kaikki keskustelusi, yhteystietosi ja viestisi on peruuttamattomasti poistettu sekunnin murto-osassa.';

  @override
  String get secCallsLabel => 'PUHELUT & TIEDOSTOT';

  @override
  String get secCallsTitle => 'Kaikki on salattua';

  @override
  String get secCallsSubtitle =>
      'Eivät vain viestit. Aivan kaikki Hashin kautta kulkeva on päästä päähän salattua.';

  @override
  String get secAudioCallTitle => 'Äänipuhelut';

  @override
  String get secAudioCallDesc =>
      'Päästä päähän salattu WebRTC:n kautta. Ääni siirretään suoraan laitteiden välillä.';

  @override
  String get secVideoCallTitle => 'Videopuhelut';

  @override
  String get secVideoCallDesc =>
      'Sama teknologia, jokainen virta salattu erikseen.';

  @override
  String get secPhotosTitle => 'Kuvat & videot';

  @override
  String get secPhotosDesc =>
      'Salattu AES-256-GCM:llä ennen kuin ne lähtevät puhelimestasi.';

  @override
  String get secDocsTitle => 'Dokumentit';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, mikä tahansa tiedosto. Nimi, koko ja sisältö salattu.';

  @override
  String get secAnonLabel => 'ANONYMITEETTI';

  @override
  String get secAnonTitle => 'Ei vaadittua henkilöllisyyttä';

  @override
  String get secAnonSubtitle =>
      'Hash ei koskaan kysy puhelinnumeroasi tai sähköpostiasi. Sinut tunnistetaan ainutlaatuisella ja anonyymillä Hash ID:llä.';

  @override
  String get secHashIdTitle => 'Hash ID:si';

  @override
  String get secHashIdDesc =>
      'Tämä on ainutlaatuinen tunnisteesi. Se ei paljasta mitään sinusta: ei nimeäsi, ei numeroasi, ei sijaintiasi. Se on kuin pseudonyymi, jota on mahdotonta yhdistää todelliseen henkilöllisyyteesi.\n\nLisätäksesi yhteystiedon jaat Hash ID:si tai skannaat QR-koodin. Siinä kaikki. Ei synkronoitua osoitekirjaa, ei \"Henkilöt jotka saatat tuntea\" -ehdotuksia.';

  @override
  String get secDataLabel => 'TIEDOT';

  @override
  String get secDataTitle => 'Mitä Hash ei tiedä';

  @override
  String get secDataSubtitle =>
      'Paras tapa suojata tietojasi on olla keräämättä niitä.';

  @override
  String get secNeverCollected => 'Ei koskaan kerätty';

  @override
  String get secNeverItem1 => 'Viestien sisältö';

  @override
  String get secNeverItem2 => 'Yhteystietoluettelo';

  @override
  String get secNeverItem3 => 'Puhelinnumero';

  @override
  String get secNeverItem4 => 'Sähköpostiosoite';

  @override
  String get secNeverItem5 => 'IP-osoite';

  @override
  String get secNeverItem6 => 'Sijainti';

  @override
  String get secNeverItem7 => 'Metatiedot (kuka puhuu kenelle)';

  @override
  String get secNeverItem8 => 'Puheluhistoria';

  @override
  String get secNeverItem9 => 'Osoitekirja';

  @override
  String get secNeverItem10 => 'Mainostunnisteet';

  @override
  String get secTempStored => 'Väliaikaisesti tallennettu';

  @override
  String get secTempItem1 => 'Anonyymi Hash ID (ainutlaatuinen tunniste)';

  @override
  String get secTempItem2 => 'Julkiset salausavaimet';

  @override
  String get secTempItem3 => 'Salatut viestit kuljetettavana (maks. 24t)';

  @override
  String get secTempNote =>
      'Edes nämä minimaaliset tiedot eivät voi tunnistaa sinua. Hash ID:täsi ei ole yhdistetty mihinkään henkilötietoon.';

  @override
  String get secFooterTitle => 'Yksityisyytesi, vapautesi';

  @override
  String get secFooterDesc =>
      'Hash käyttää samoja salausteknologioita kuin vaativimmat ammattisovellukset. Viestisi ovat matematiikan suojaamia, eivät lupausten.';

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
