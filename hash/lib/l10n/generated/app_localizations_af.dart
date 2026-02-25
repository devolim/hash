// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Geen spoor. Geen kompromie.';

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
  String get conversations => 'Geselsies';

  @override
  String get contacts => 'Kontakte';

  @override
  String get noConversation => 'Geen geselsies';

  @override
  String get noConversationSubtitle =>
      'Voeg \'n kontak by om veilig te begin gesels';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hangende versoeke',
      one: '1 hangende versoek',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gestuurde versoeke hangend',
      one: '1 gestuurde versoek hangend',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Voeg kontak by';

  @override
  String get shareApp => 'Deel app';

  @override
  String get newMessage => 'Nuwe boodskap';

  @override
  String get newConversation => 'Stuur \'n boodskap';

  @override
  String get settings => 'Instellings';

  @override
  String get myHashId => 'My Hash ID';

  @override
  String get supportHash => 'Ondersteun Hash';

  @override
  String get supportHashSubtitle => 'Hash is \'n nie-winsgewende projek';

  @override
  String get donate => 'Skenk';

  @override
  String get appearance => 'Voorkoms';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Outomaties';

  @override
  String get themeAutoSubtitle => 'Volg stelselinstellings';

  @override
  String get themeDark => 'Donker';

  @override
  String get themeLight => 'Lig';

  @override
  String get themeRecommendation =>
      'Donker tema word aanbeveel vir beter privaatheid';

  @override
  String get language => 'Taal';

  @override
  String get languageAuto => 'Outomaties (stelsel)';

  @override
  String get notifications => 'Kennisgewings';

  @override
  String get messages => 'Boodskappe';

  @override
  String get calls => 'Oproepe';

  @override
  String get vibration => 'Vibrasie';

  @override
  String get notificationContent => 'Kennisgewinginhoud';

  @override
  String get notificationContentFull => 'Wys alles';

  @override
  String get notificationContentFullDesc => 'Kontaknaam en boodskapvoorskou';

  @override
  String get notificationContentName => 'Slegs naam';

  @override
  String get notificationContentNameDesc => 'Wys slegs die kontaknaam';

  @override
  String get notificationContentDiscrete => 'Diskreet';

  @override
  String get notificationContentDiscreteDesc => 'Wys slegs \"Nuwe boodskap\"';

  @override
  String get security => 'Sekuriteit';

  @override
  String get howHashProtectsYou => 'Hoe Hash jou beskerm';

  @override
  String get howHashProtectsYouSubtitle => 'Verstaan jou sekuriteit';

  @override
  String get accountSecurity => 'Rekeningsekuriteit';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrie, Vash-modus';

  @override
  String get blockScreenshots => 'Blokkeer skermskote';

  @override
  String get transferDevice => 'Dra oor na ander toestel';

  @override
  String get transferDeviceSubtitle => 'Migreer jou rekening';

  @override
  String get pinCode => 'PIN-kode';

  @override
  String get changePin => 'Verander PIN-kode';

  @override
  String get currentPin => 'Huidige PIN-kode';

  @override
  String get newPin => 'Nuwe PIN-kode';

  @override
  String get confirmPin => 'Bevestig PIN-kode';

  @override
  String get pinChanged => 'PIN-kode verander';

  @override
  String get incorrectPin => 'Verkeerde PIN';

  @override
  String get pinsDoNotMatch => 'PIN\'s stem nie ooreen nie';

  @override
  String get autoLock => 'Outo-sluit';

  @override
  String get autoLockDelay => 'Sluitvertraging';

  @override
  String get autoLockImmediate => 'Onmiddellik';

  @override
  String get autoLockMinute => '1 minuut';

  @override
  String autoLockMinutes(int count) {
    return '$count minute';
  }

  @override
  String get vashCode => 'Vash-kode';

  @override
  String get vashModeTitle => 'Vash-modus';

  @override
  String get vashModeExplanation => 'Jou uiteindelike veiligheidsnet.';

  @override
  String get vashModeDescription =>
      'Jy sal \'n tweede PIN-kode kies. As jy ooit gedwing word om Hash oop te maak, voer hierdie kode in plaas van jou gewone PIN in.\n\nDie app sal normaal oopmaak, maar al jou gesprekke en kontakte sal weg wees.\n\nVir enigiemand wat na jou skerm kyk, lyk Hash eenvoudig leeg — asof jy dit nooit gebruik het nie.';

  @override
  String get vashModeIrreversible => 'Hierdie aksie is stil en onomkeerbaar.';

  @override
  String get chooseVashCode => 'Kies my Vash-kode';

  @override
  String get vashCodeInfo =>
      '\'n Tweede PIN-kode wat die app normaal oopmaak, maar leeg.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'As jy hierdie kode in plaas van jou PIN invoer:';

  @override
  String get vashDeleteContacts => 'Jou kontakte verdwyn';

  @override
  String get vashDeleteMessages => 'Jou gesprekke verdwyn';

  @override
  String get vashDeleteHistory => 'Jou notas verdwyn';

  @override
  String get vashKeepId => 'Jou Hash-identiteit (#XXX-XXX-XXX) bly dieselfde';

  @override
  String get vashAppearNormal =>
      'Die app lyk normaal maar leeg, soos nuut. Hierdie aksie is onomkeerbaar.';

  @override
  String get setupVashCode => 'Stel Vash-kode op';

  @override
  String get modifyVashCode => 'Wysig Vash-kode';

  @override
  String get currentVashCode => 'Huidige Vash-kode';

  @override
  String get newVashCode => 'Nuwe Vash-kode';

  @override
  String get confirmVashCode => 'Bevestig Vash-kode';

  @override
  String get vashCodeConfigured => 'Vash-kode opgestel';

  @override
  String get vashCodeModified => 'Vash-kode gewysig';

  @override
  String get vashCodeMustDiffer => 'Vash-kode moet verskil van PIN';

  @override
  String get incorrectVashCode => 'Verkeerde Vash-kode';

  @override
  String get vashWhatToDelete => 'Wat moet Vash-modus laat verdwyn?';

  @override
  String get vashDeleteContactsOption => 'Kontakte';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Boodskappe';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notas';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash-modus geaktiveer';

  @override
  String get vashCreateSubtitle => 'Kies \'n kode anders as jou hoof-PIN';

  @override
  String get vashConfirmSubtitle => 'Bevestig jou Vash-kode';

  @override
  String get pinCodeForEntry => 'PIN-kode om die toep oop te maak';

  @override
  String get vashCodeSection => 'Vash-modus';

  @override
  String get biometric => 'Biometrie';

  @override
  String get biometricUnlock => 'Ontsluit met vingerafdruk of Face ID';

  @override
  String get enableBiometric => 'Aktiveer biometrie';

  @override
  String get biometricWarningMessage =>
      'Deur biometrie te aktiveer, sal jy nie jou Vash-kode kan gebruik om in die toepassing in te kom nie.\n\nJy sal slegs die Vash-kode kan gebruik as biometrie misluk (na verskeie mislukte pogings).\n\nIs jy seker jy wil voortgaan?';

  @override
  String get understood => 'Ek verstaan';

  @override
  String get shareAppSubtitle => 'Deel Hash met jou naastes';

  @override
  String get share => 'Deel';

  @override
  String get danger => 'Gevaar';

  @override
  String get deleteAccount => 'Verwyder my rekening';

  @override
  String get deleteAccountSubtitle => 'Onomkeerbare aksie';

  @override
  String get deleteAccountConfirmTitle => 'Verwyder my rekening';

  @override
  String get deleteAccountConfirmMessage =>
      'Jou rekening sal permanent verwyder word. Hierdie aksie is onomkeerbaar.\n\n• Al jou geselsies\n• Al jou kontakte\n• Jou Hash ID\n\nJy sal \'n nuwe rekening moet skep.';

  @override
  String get deleteForever => 'Verwyder permanent';

  @override
  String get cancel => 'Kanselleer';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash-modus geaktiveer.';

  @override
  String deletionError(String error) {
    return 'Verwyderingsfout: $error';
  }

  @override
  String get yourSecurity => 'Jou sekuriteit';

  @override
  String get securityInfo =>
      '• End-tot-end-enkripsie (Signal Protocol)\n• Geen data op ons bedieners na aflewering nie\n• Sleutels slegs op jou toestel gestoor\n• PIN-kode nooit na bediener gestuur nie';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Welkom';

  @override
  String get securityStatement1 => 'Jou boodskappe is beskerm.';

  @override
  String get securityStatement2 => 'End-tot-end-enkripsie.';

  @override
  String get securityStatement3 => 'Geen spoor. Geen kompromie.';

  @override
  String get securityStatement4 => 'Jou privaatheid is \'n reg.';

  @override
  String get accessBlocked => 'Toegang geblokkeer';

  @override
  String get tooManyAttempts => 'Te veel pogings';

  @override
  String get pleaseWait => 'Wag asseblief';

  @override
  String get waitDelay => 'Wag asseblief vir die vertraging om te eindig';

  @override
  String attemptCount(int current, int max) {
    return 'Poging $current van $max';
  }

  @override
  String retryIn(String time) {
    return 'Probeer weer oor $time';
  }

  @override
  String get forgotPin => 'PIN vergeet? Gebruik herstelfrase';

  @override
  String get useRecoveryPhrase => 'Gebruik herstelfrase';

  @override
  String get recoveryWarningTitle => 'Waarskuwing';

  @override
  String get recoveryWarningMessage => 'Rekeningherwinning sal:';

  @override
  String get recoveryDeleteAllMessages => 'AL jou boodskappe verwyder';

  @override
  String get recoveryWaitDelay => '\'n Vertraging van 1 uur vereis';

  @override
  String get recoveryKeepContacts => 'Jou kontakte behou';

  @override
  String get recoveryIrreversible =>
      'Hierdie aksie is onomkeerbaar. Jou boodskappe sal permanent verlore gaan.';

  @override
  String get iUnderstand => 'Ek verstaan';

  @override
  String get accountRecovery => 'Rekeningherwinning';

  @override
  String get enterRecoveryPhrase =>
      'Voer die 24 woorde van jou herstelfrase in, geskei deur spasies.';

  @override
  String get recoveryPhraseHint => 'woord1 woord2 woord3 ...';

  @override
  String get recover => 'Herwin';

  @override
  String get recoveryPhraseRequired => 'Voer asseblief jou herstelfrase in';

  @override
  String get recoveryPhrase24Words => 'Die frase moet presies 24 woorde bevat';

  @override
  String get incorrectRecoveryPhrase => 'Verkeerde herstelfrase';

  @override
  String get recoveryInitError => 'Fout met inisialisering van herwinning';

  @override
  String get securityDelay => 'Sekuriteitsvertraging';

  @override
  String get securityDelayMessage =>
      'Vir jou sekuriteit word \'n wagperiode vereis voordat jy \'n nuwe PIN kan skep.';

  @override
  String get timeRemaining => 'Tyd oor';

  @override
  String get messagesDeletedForProtection =>
      'Jou boodskappe is verwyder vir jou beskerming.';

  @override
  String get canCloseApp => 'Jy kan die app sluit en later terugkom.';

  @override
  String get onboardingTitle1 => 'Welkom by Hash';

  @override
  String get onboardingSubtitle1 => 'Die boodskapdiens wat geen spoor laat nie';

  @override
  String get onboardingTitle2 => 'Totale enkripsie';

  @override
  String get onboardingSubtitle2 =>
      'Jou boodskappe is end-tot-end geënkripteer met Signal Protocol';

  @override
  String get onboardingTitle3 => 'Geen spoor';

  @override
  String get onboardingSubtitle3 =>
      'Boodskappe word van bedieners verwyder by aflewering';

  @override
  String get onboardingTitle4 => 'Jou sekuriteit';

  @override
  String get onboardingSubtitle4 => 'PIN-kode, Vash-modus en herstelfrase';

  @override
  String get getStarted => 'Begin';

  @override
  String get next => 'Volgende';

  @override
  String get skip => 'Slaan oor';

  @override
  String get alreadyHaveAccount => 'Ek het reeds \'n rekening';

  @override
  String get transferMyAccount => 'Dra my rekening oor';

  @override
  String get createPin => 'Skep \'n PIN-kode';

  @override
  String get createPinSubtitle =>
      'Hierdie kode sal toegang tot jou app beskerm';

  @override
  String get confirmYourPin => 'Bevestig jou PIN-kode';

  @override
  String get confirmPinSubtitle => 'Voer jou PIN-kode weer in';

  @override
  String get saveRecoveryPhrase => 'Herstelfrase';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Skryf hierdie 24 woorde in volgorde neer. Dit sal jou toelaat om jou rekening te herwin as jy jou PIN vergeet.';

  @override
  String get phraseWritten => 'Ek het my frase neergeskryf';

  @override
  String get warningRecoveryPhrase =>
      'As jy hierdie frase verloor en jou PIN vergeet, sal jy toegang tot jou rekening verloor.';

  @override
  String get accountTransferred => 'Rekening oorgedra';

  @override
  String get accountTransferredMessage =>
      'Jou rekening is na \'n ander toestel oorgedra. Hierdie sessie is nie meer geldig nie.';

  @override
  String get accountTransferredInfo =>
      'As jy nie hierdie oordrag begin het nie, is jou rekening moontlik gekompromitteer.';

  @override
  String get logout => 'Teken uit';

  @override
  String get transferAccount => 'Dra rekening oor';

  @override
  String get transferAccountInfo =>
      'Dra jou Hash-rekening oor na \'n nuwe toestel. Jou huidige sessie sal ongeldig gemaak word.';

  @override
  String get generateTransferCode => 'Genereer oordragkode';

  @override
  String get transferCode => 'Oordragkode';

  @override
  String transferCodeExpires(int minutes) {
    return 'Hierdie kode verval oor $minutes minute';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Voer hierdie kode op jou nuwe toestel in om jou rekening oor te dra.';

  @override
  String get generateNewCode => 'Genereer nuwe kode';

  @override
  String get scanQrCode => 'Skandeer QR-kode';

  @override
  String get scanQrCodeSubtitle =>
      'Skandeer \'n kontak se QR-kode om hulle by te voeg';

  @override
  String get qrCodeDetected => 'QR-kode opgespoor';

  @override
  String get invalidQrCode => 'Ongeldige QR-kode';

  @override
  String get cameraPermissionRequired => 'Kameratoestemming vereis';

  @override
  String get myQrCode => 'My QR-kode';

  @override
  String get myQrCodeSubtitle =>
      'Deel hierdie QR-kode sodat jou kontakte jou kan byvoeg';

  @override
  String get shareQrCode => 'Deel';

  @override
  String get addContactTitle => 'Voeg kontak by';

  @override
  String get addContactByHashId => 'Voer jou kontak se Hash ID in';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Soek';

  @override
  String get contactNotFound => 'Kontak nie gevind nie';

  @override
  String get contactAlreadyAdded => 'Hierdie kontak is reeds in jou lys';

  @override
  String get contactAdded => 'Kontak bygevoeg';

  @override
  String get myProfile => 'My profiel';

  @override
  String get myProfileSubtitle =>
      'Deel hierdie inligting sodat ander jou kan byvoeg';

  @override
  String get temporaryCode => 'Tydelike kode';

  @override
  String temporaryCodeExpires(String time) {
    return 'Verval oor $time';
  }

  @override
  String get codeExpired => 'Kode verval';

  @override
  String get generateNewCodeButton => 'Nuwe kode';

  @override
  String get copyHashId => 'Kopieer ID';

  @override
  String get copyCode => 'Kopieer kode';

  @override
  String get copiedToClipboard => 'Gekopieer';

  @override
  String get showMyQrCode => 'Wys my QR-kode';

  @override
  String get orDivider => 'of';

  @override
  String get openScanner => 'Maak skandeerder oop';

  @override
  String get addManually => 'Voeg handmatig by';

  @override
  String get contactHashIdLabel => 'Kontak se Hash ID';

  @override
  String get temporaryCodeLabel => 'Tydelike kode';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Vra jou kontak om \'n kode van hul profiel te genereer';

  @override
  String get verifyAndAdd => 'Verifieer en voeg by';

  @override
  String get fillAllFields => 'Vul asseblief alle velde in';

  @override
  String get invalidHashIdFormat => 'Ongeldige ID-formaat (bv.: 123-456-ABC)';

  @override
  String get userNotFound => 'Gebruiker nie gevind nie';

  @override
  String get cannotAddYourself => 'Jy kan nie jouself byvoeg nie';

  @override
  String get invalidOrExpiredCode => 'Ongeldige of vervalde tydelike kode';

  @override
  String get contactFound => 'Kontak gevind!';

  @override
  String get howToCallContact => 'Wat wil jy hulle noem?';

  @override
  String get contactNameHint => 'Kontaknaam';

  @override
  String get addContactButton => 'Voeg by';

  @override
  String get contactDetails => 'Kontakbesonderhede';

  @override
  String get contactName => 'Kontaknaam';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Bygevoeg op $date';
  }

  @override
  String get deleteContact => 'Verwyder kontak';

  @override
  String deleteContactConfirm(Object name) {
    return 'Verwyder hierdie kontak?';
  }

  @override
  String get deleteContactMessage => 'Dit sal ook die hele geselsie verwyder.';

  @override
  String get delete => 'Verwyder';

  @override
  String get typeMessage => 'Tik \'n boodskap...';

  @override
  String get messageSent => 'Gestuur';

  @override
  String get messageDelivered => 'Afgelewer';

  @override
  String get messageRead => 'Gelees';

  @override
  String get messageFailed => 'Kon nie stuur nie';

  @override
  String get now => 'Nou';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}u';
  }

  @override
  String daysAgo(int count) {
    return '${count}d';
  }

  @override
  String get today => 'Vandag';

  @override
  String get yesterday => 'Gister';

  @override
  String dateAtTime(String date, String time) {
    return '$date om $time';
  }

  @override
  String get shareMessage =>
      'Sluit aan by my op Hash! 🔒\n\nDit is \'n werklik private boodskapdiens: totale enkripsie, geen spoor op bedieners, en paniekmodus indien nodig.\n\nLaai die app hier af 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Fout';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Bekyk';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nee';

  @override
  String get save => 'Stoor';

  @override
  String get edit => 'Wysig';

  @override
  String get close => 'Sluit';

  @override
  String get confirm => 'Bevestig';

  @override
  String get loading => 'Laai...';

  @override
  String get retry => 'Probeer weer';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Hangende versoeke';

  @override
  String get noPendingRequests => 'Geen hangende versoeke';

  @override
  String get pendingRequestsSubtitle => 'Hierdie mense wil jou byvoeg';

  @override
  String requestFromUser(String hashId) {
    return 'Versoek van $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Verval oor $days dae';
  }

  @override
  String get acceptRequest => 'Aanvaar';

  @override
  String get rejectRequest => 'Weier';

  @override
  String get requestAccepted => 'Versoek aanvaar';

  @override
  String get requestRejected => 'Versoek geweier';

  @override
  String get requestSent => 'Versoek gestuur!';

  @override
  String get requestSentSubtitle =>
      'Jou versoek is gestuur. Die gebruiker moet dit aanvaar voordat julle kan gesels.';

  @override
  String get requestAlreadyPending => '\'n Versoek is reeds hangend';

  @override
  String get requestAlreadySentByOther =>
      'Hierdie persoon het reeds vir jou \'n versoek gestuur';

  @override
  String get addByHashId => 'Voeg by met Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Voer die kontak se Hash ID en tydelike kode in';

  @override
  String get enterTemporaryCode => 'Voer die 6-syfer kode in';

  @override
  String get sendRequest => 'Stuur versoek';

  @override
  String get acceptContactTitle => 'Aanvaar kontak';

  @override
  String get acceptContactSubtitle => 'Jy kan hulle \'n pasgemaakte naam gee';

  @override
  String get leaveEmptyForHashId => 'Laat leeg om Hash ID te gebruik';

  @override
  String get firstName => 'Voornaam';

  @override
  String get lastName => 'Van';

  @override
  String get notes => 'Notas';

  @override
  String get notesHint => 'Persoonlike notas oor hierdie kontak';

  @override
  String get photoOptional => 'Foto (opsioneel)';

  @override
  String get contactNameOptional => 'Naam (opsioneel)';

  @override
  String get notesOptional => 'Notas (opsioneel)';

  @override
  String get storedLocally => 'Slegs op jou toestel gestoor';

  @override
  String get encryptedMessageLabel => 'Geënkripteerde boodskap';

  @override
  String get identityMessageHint => 'Wie is jy? Hoe ken julle mekaar?';

  @override
  String get messageWillBeSentEncrypted =>
      'Hierdie boodskap sal geënkripteer en aan die ontvanger gestuur word';

  @override
  String get sendRequestButton => 'Stuur versoek';

  @override
  String get requestExpiresIn24h =>
      'Versoek verval binne 24u as dit nie aanvaar word nie';

  @override
  String get theyAlreadySentYouRequest =>
      'Hierdie persoon het reeds vir jou \'n versoek gestuur';

  @override
  String get requests => 'Versoeke';

  @override
  String get receivedRequests => 'Ontvang';

  @override
  String get sentRequests => 'Gestuur';

  @override
  String get noSentRequests => 'Geen gestuurde versoeke';

  @override
  String get cancelRequest => 'Kanselleer';

  @override
  String get deleteRequest => 'Verwyder versoek';

  @override
  String get requestCancelled => 'Versoek gekanselleer';

  @override
  String sentTo(String hashId) {
    return 'Gestuur aan $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Verval oor $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Ontvang $time gelede';
  }

  @override
  String get messageFromRequester => 'Boodskap van versoeker';

  @override
  String get copy => 'Kopieer';

  @override
  String get messageInfo => 'Boodskapinligting';

  @override
  String get messageDirection => 'Rigting';

  @override
  String get messageSentByYou => 'Deur jou gestuur';

  @override
  String get messageReceived => 'Ontvang';

  @override
  String get messageSentAt => 'Gestuur om';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Gelees om';

  @override
  String get messageType => 'Tipe';

  @override
  String get messageSize => 'Grootte';

  @override
  String get messageExpiresAt => 'Verval om';

  @override
  String get messageEncrypted => 'End-tot-end geënkripteer';

  @override
  String get messageStatusSending => 'Stuur...';

  @override
  String get messageStatusSent => 'Gestuur';

  @override
  String get messageStatusDelivered => 'Afgelewer';

  @override
  String get messageStatusRead => 'Gelees';

  @override
  String get messageStatusFailed => 'Misluk';

  @override
  String get serverStatus => 'Bediener';

  @override
  String get onServer => 'Wag op aflewering';

  @override
  String get deletedFromServer => 'Verwyder';

  @override
  String get messageTypeText => 'Teks';

  @override
  String get messageTypeImage => 'Beeld';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Stem';

  @override
  String get messageTypeFile => 'Lêer';

  @override
  String get indefinitely => 'Onbepaald';

  @override
  String get hoursShort => 'u';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'ure';

  @override
  String get minutes => 'minute';

  @override
  String get seconds => 'sekondes';

  @override
  String get ephemeralMessages => 'Verganklike boodskappe';

  @override
  String get ephemeralMessagesDescription =>
      'Boodskappe word outomaties verwyder na hierdie tyd';

  @override
  String get ephemeralImmediate => 'Onmiddellik (na lees)';

  @override
  String get ephemeralImmediateDesc => 'Verwyder sodra dit gelees is';

  @override
  String get ephemeralMyPreference => 'My voorkeur';

  @override
  String get ephemeralMyPreferenceDesc => 'Gebruik globale instelling';

  @override
  String get ephemeralDefaultSetting => 'Boodskapduur';

  @override
  String get ephemeralChooseDefault => 'Aanbeveel';

  @override
  String get ephemeral30Seconds => '30 sekondes';

  @override
  String get ephemeral30SecondsDesc => 'Verwyder 30s na lees';

  @override
  String get ephemeral5Minutes => '5 minute';

  @override
  String get ephemeral5MinutesDesc => 'Verwyder 5min na lees';

  @override
  String get ephemeral1Hour => '1 uur';

  @override
  String get ephemeral1HourDesc => 'Verwyder 1u na lees';

  @override
  String get ephemeral3Hours => '3 ure';

  @override
  String get ephemeral6Hours => '6 ure';

  @override
  String get ephemeral6HoursDesc => 'Verwyder 6u na lees';

  @override
  String get ephemeral12Hours => '12 ure';

  @override
  String get ephemeral24Hours => '24 ure';

  @override
  String get ephemeral24HoursDesc => 'Verwyder 24u na lees';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Pasgemaakte duur';

  @override
  String get howItWorks => 'Hoe dit werk';

  @override
  String get ephemeralExplanation1 =>
      'Boodskappe word van die bediener verwyder sodra dit ontvang is.';

  @override
  String get ephemeralExplanation2 =>
      'Hierdie instelling bepaal wanneer boodskappe van JOU foon verdwyn na lees.';

  @override
  String get ephemeralExplanation3 =>
      'Jou kontak het hul eie instelling vir hul foon.';

  @override
  String get mute1Hour => '1 uur';

  @override
  String get mute8Hours => '8 ure';

  @override
  String get mute1Day => '1 dag';

  @override
  String get mute1Week => '1 week';

  @override
  String get muteAlways => 'Altyd';

  @override
  String get muteExplanation =>
      'Jy sal nie kennisgewings vir hierdie kontak ontvang nie';

  @override
  String get showCallsInRecents => 'Wys in onlangse oproepe';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash-oproepe verskyn in die foon se geskiedenis';

  @override
  String get feedback => 'Terugvoer';

  @override
  String get muteNotifications => 'Demp kennisgewings';

  @override
  String get muteDescription =>
      'Jy sal nie kennisgewings vir hierdie kontak ontvang nie';

  @override
  String mutedUntil(String time) {
    return 'Gedemp tot $time';
  }

  @override
  String get notMuted => 'Kennisgewings geaktiveer';

  @override
  String get unmute => 'Ontdemp';

  @override
  String get notificationSound => 'Kennisgewingklank';

  @override
  String get defaultSound => 'Verstek';

  @override
  String get chatSettings => 'Geselsieinstellings';

  @override
  String get bubbleColor => 'Borrelkleur';

  @override
  String get backgroundColor => 'Agtergrondkleur';

  @override
  String get backgroundImage => 'Agtergrondbeeld';

  @override
  String get chatBackground => 'Geselsie-agtergrond';

  @override
  String get customColor => 'Pasgemaak';

  @override
  String get defaultColor => 'Verstek';

  @override
  String get imageSelected => 'Beeld gekies';

  @override
  String get noImage => 'Geen beeld';

  @override
  String get color => 'Kleur';

  @override
  String get image => 'Beeld';

  @override
  String get tapToSelectImage => 'Tik om \'n beeld te kies';

  @override
  String get changeImage => 'Verander beeld';

  @override
  String get previewMessageReceived => 'Hallo!';

  @override
  String get previewMessageSent => 'Haai daar!';

  @override
  String get messageAction => 'Boodskap';

  @override
  String get callAction => 'Bel';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Persoonlike notas';

  @override
  String get addNotes => 'Voeg notas by...';

  @override
  String get noNotes => 'Geen notas';

  @override
  String get messageNotifications => 'Boodskapkennisgewings';

  @override
  String get callNotifications => 'Oproepkennisgewings';

  @override
  String get useGradient => 'Gebruik gradiënt';

  @override
  String get gradientStart => 'Beginkleur';

  @override
  String get gradientEnd => 'Eindkleur';

  @override
  String get preview => 'Voorskou';

  @override
  String get reset => 'Herstel';

  @override
  String get securityNumber => 'Sekuriteitsnommer';

  @override
  String securityNumberDescription(String name) {
    return 'Verifieer dat die sekuriteitsnommer ooreenstem met $name se toestel';
  }

  @override
  String get verifyEncryption => 'Verifieer end-tot-end-enkripsie';

  @override
  String get tapToCopy => 'Tik om te kopieer';

  @override
  String get howToVerify => 'Hoe om te verifieer';

  @override
  String get verifyStep1 => 'Ontmoet jou kontak persoonlik of bel hulle';

  @override
  String get verifyStep2 =>
      'Vergelyk die sekuriteitsnommers of skandeer QR-kodes';

  @override
  String get verifyStep3 => 'As hulle ooreenstem, is jou geselsie veilig';

  @override
  String get scanToVerify => 'Skandeer om te verifieer';

  @override
  String get reportSpam => 'Rapporteer gemorspos';

  @override
  String get reportSpamSubtitle => 'Rapporteer hierdie kontak as gemorspos';

  @override
  String get reportSpamDescription =>
      'Dit sal hierdie kontak anoniem rapporteer. Jou identiteit sal nie gedeel word nie. Is jy seker?';

  @override
  String get report => 'Rapporteer';

  @override
  String get spamReported => 'Gemorspos gerapporteer';

  @override
  String get reportError =>
      'Kon nie rapport stuur nie. Probeer asseblief weer.';

  @override
  String get reportRateLimited =>
      'Jy het die maksimum aantal rapporte vir vandag bereik.';

  @override
  String get blockContact => 'Blokkeer kontak';

  @override
  String get blockContactDescription =>
      'Hierdie kontak sal nie meer vir jou boodskappe kan stuur of jou kan bel nie. Hulle sal nie in kennis gestel word nie.';

  @override
  String get unblockContact => 'Deblokkeer kontak';

  @override
  String get unblockContactDescription =>
      'Hierdie kontak sal weer vir jou boodskappe kan stuur en jou kan bel.';

  @override
  String get contactBlocked => 'Kontak geblokkeer';

  @override
  String get contactUnblocked => 'Kontak gedeblokkeer';

  @override
  String get contactIsBlocked => 'Hierdie kontak is geblokkeer';

  @override
  String get unblock => 'Deblokkeer';

  @override
  String get deleteContactSubtitle => 'Verwyder hierdie kontak en geselsie';

  @override
  String get confirmWithPin => 'Bevestig met PIN';

  @override
  String get enterPinToConfirm =>
      'Voer jou PIN in om hierdie aksie te bevestig';

  @override
  String get profilePhoto => 'Profielfoto';

  @override
  String get takePhoto => 'Neem \'n foto';

  @override
  String get chooseFromGallery => 'Kies uit galery';

  @override
  String get removePhoto => 'Verwyder foto';

  @override
  String get viewContactHashId => 'Bekyk kontak se identifiseerder';

  @override
  String get hashIdPartiallyMasked =>
      'Gedeeltelik gemaskeer vir jou sekuriteit en jou kontak se privaatheid';

  @override
  String get addFirstContact => 'Voeg jou eerste kontak by';

  @override
  String get addFirstContactSubtitle =>
      'Deel jou QR-kode of skandeer \'n vriend se kode';

  @override
  String get directory => 'Gids';

  @override
  String get noContacts => 'Geen kontakte';

  @override
  String get noContactsSubtitle => 'Voeg \'n kontak by om te begin';

  @override
  String get sendMessageAction => 'Stuur \'n boodskap';

  @override
  String get audioCall => 'Klankoproep';

  @override
  String get videoCall => 'Video-oproep';

  @override
  String get viewProfile => 'Bekyk profiel';

  @override
  String get deleteContactDirectory => 'Verwyder kontak';

  @override
  String get scanShort => 'Skandeer';

  @override
  String get addShort => 'Voeg by';

  @override
  String deleteContactConfirmName(String name) {
    return 'Is jy seker jy wil $name verwyder?';
  }

  @override
  String get noNotesTitle => 'Geen notas';

  @override
  String get noNotesSubtitle => 'Skep jou eerste nota';

  @override
  String get newNote => 'Nuwe nota';

  @override
  String get editNote => 'Wysig nota';

  @override
  String get deleteNote => 'Verwyder nota';

  @override
  String get deleteNoteConfirm => 'Is jy seker jy wil hierdie nota verwyder?';

  @override
  String get noteTitle => 'Titel';

  @override
  String get noteContent => 'Inhoud';

  @override
  String get addItem => 'Voeg item by';

  @override
  String get pinNote => 'Vaspen';

  @override
  String get unpinNote => 'Lospen';

  @override
  String get noteColor => 'Kleur';

  @override
  String get notePassword => 'Wagwoord';

  @override
  String get setPassword => 'Stel wagwoord';

  @override
  String get changePassword => 'Verander wagwoord';

  @override
  String get removePassword => 'Verwyder wagwoord';

  @override
  String get enterPassword => 'Voer wagwoord in';

  @override
  String get confirmPassword => 'Bevestig wagwoord';

  @override
  String get passwordPin => 'PIN-kode';

  @override
  String get passwordText => 'Tekswagwoord';

  @override
  String get protectedNote => 'Beskermde nota';

  @override
  String get incorrectPassword => 'Verkeerde wagwoord';

  @override
  String get passwordSet => 'Wagwoord gestel';

  @override
  String get passwordRemoved => 'Wagwoord verwyder';

  @override
  String get notesBiometric => 'Face ID vir notas';

  @override
  String get notesBiometricSubtitle =>
      'Vereis biometriese verifikasie om beskermde notas oop te maak';

  @override
  String get textNote => 'Teksnota';

  @override
  String get checklistNote => 'Kontrolelys';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total take';
  }

  @override
  String get autoSaved => 'Gestoor';

  @override
  String get searchNotes => 'Soek notas';

  @override
  String get legalConsent => 'Wetlike toestemming';

  @override
  String get confirmAge13 => 'Ek bevestig dat ek minstens 13 jaar oud is';

  @override
  String get acceptLegalStart => 'Ek aanvaar die ';

  @override
  String get privacyPolicy => 'Privaatheidsbeleid';

  @override
  String get termsOfService => 'Diensvoorwaardes';

  @override
  String get andThe => ' en die ';

  @override
  String get continueButton => 'Gaan voort';

  @override
  String get mustAcceptTerms =>
      'Jy moet albei voorwaardes aanvaar om voort te gaan';

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
  String get support => 'Ondersteuning';

  @override
  String get contactSupport => 'Kontak ondersteuning';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Rapporteer misbruik';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Wetlik';

  @override
  String get legalEntity => 'Wetlike entiteit';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Vaspen';

  @override
  String get unpinConversation => 'Lospen';

  @override
  String get hideConversation => 'Verwyder uit voer';

  @override
  String get deleteConversation => 'Verwyder gesprek';

  @override
  String get deleteConversationConfirm =>
      'Voer jou PIN in om die verwydering van alle boodskappe te bevestig';

  @override
  String get noConversations => 'Nog geen gesprekke';

  @override
  String get startConversation => 'Begin';

  @override
  String get microphonePermissionRequired => 'Mikrofoontoestemming vereis';

  @override
  String get microphonePermissionExplanation =>
      'Hash het die mikrofoon nodig om oproepe te maak.';

  @override
  String get cameraPermissionExplanation =>
      'Hash het die kamera nodig vir video-oproepe.';

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
  String get openSettings => 'Maak instellings oop';

  @override
  String get callConnecting => 'Verbind...';

  @override
  String get callRinging => 'Lui...';

  @override
  String get callReconnecting => 'Herverbind...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Herverbind (${seconds}s)';
  }

  @override
  String get callPaused => 'Onderbreek';

  @override
  String get callPausedSubtitle => 'Die oproep is steeds aktief';

  @override
  String get callRemoteMicMuted => 'Kontak se mikrofoon is gedemp';

  @override
  String get callMiniControlsMute => 'Demp';

  @override
  String get callMiniControlsUnmute => 'Ontdemp';

  @override
  String get callMiniControlsHangUp => 'Beëindig';

  @override
  String get callMiniControlsReturn => 'Keer terug na oproep';

  @override
  String get callNetworkPoor => 'Onstabiele verbinding';

  @override
  String get callNetworkLost => 'Verbinding verloor';

  @override
  String get callEndedTitle => 'Oproep beëindig';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Toesteldata';

  @override
  String get deviceDataSubtitle => 'Plaaslike en bedienerberging';

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
  String get localStorage => 'Plaaslike berging';

  @override
  String get onThisDevice => 'op hierdie toestel';

  @override
  String get encryptedDatabases => 'Geënkripteerde databasisse';

  @override
  String get files => 'Lêers';

  @override
  String get secureKeychain => 'Veilige sleutelbos';

  @override
  String get cache => 'Kas';

  @override
  String get contactsDetail => 'Name, avatars, Signal-sleutels';

  @override
  String get messagesDetail => 'Geënkripteerde gesprekke';

  @override
  String get notesDetail => 'Persoonlike notas';

  @override
  String get signalSessions => 'Signal-sessies';

  @override
  String get signalSessionsDetail => 'Enkripsiesessies';

  @override
  String get pendingContacts => 'Hangende kontakte';

  @override
  String get pendingContactsDetail => 'Hangende versoeke';

  @override
  String get callHistory => 'Oproepe';

  @override
  String get callHistoryDetail => 'Oproepgeskiedenis';

  @override
  String get preferences => 'Voorkeure';

  @override
  String get preferencesDetail => 'Media- en oproepvoorkeure';

  @override
  String get avatars => 'Avatars';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lêers',
      one: '1 lêer',
      zero: 'geen lêers',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktief';

  @override
  String get notDefined => 'Nie gedefinieer';

  @override
  String get biometrics => 'Biometrie';

  @override
  String get recoveryPhrase => 'Herstelfrase';

  @override
  String get identity => 'Identiteit (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol-sleutels';

  @override
  String get authTokens => 'Verifikasiestekens';

  @override
  String get contactNamesCache => 'Kontakname-kas';

  @override
  String get remoteConfig => 'Afgeleë konfigurasie';

  @override
  String get notificationPrefs => 'Kennisgewingvoorkeure';

  @override
  String get serverData => 'Bedienerdata';

  @override
  String get serverDataInfo =>
      'Hash hou minimale data op die bediener, alles geënkripteer of tydelik.';

  @override
  String get serverProfile => 'Profiel';

  @override
  String get serverProfileDetail => 'Hash ID, publieke sleutels, posbus-token';

  @override
  String get serverPrekeys => 'Voorsleutels';

  @override
  String get serverPrekeysDetail => 'Eenmalige Signal-sleutels (verbruik)';

  @override
  String get serverMessages => 'Boodskappe in transito';

  @override
  String get serverMessagesDetail => 'Verwyder na aflewering (maks 24u)';

  @override
  String get serverMedia => 'Media in transito';

  @override
  String get serverMediaDetail => 'Verwyder na aflaai';

  @override
  String get serverContactRequests => 'Kontakversoeke';

  @override
  String get serverContactRequestsDetail => 'Verval na 24u';

  @override
  String get serverRateLimits => 'Tarieflimiete';

  @override
  String get serverRateLimitsDetail => 'Tydelike anti-misbruik data';

  @override
  String get privacyReassurance =>
      'Hash kan nie jou boodskappe lees nie. Alle data is end-tot-end geënkripteer. Bedienerdata word outomaties verwyder.';

  @override
  String get pinTooSimple =>
      'Hierdie PIN is te eenvoudig. Kies \'n veiliger kode.';

  @override
  String get genericError => '\'n Fout het voorgekom. Probeer asseblief weer.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Kan nie rekening skep nie: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frase na knipbord gekopieer';

  @override
  String get copyPhrase => 'Kopieer frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Skryf hierdie frase op \'n veilige plek neer. As jy jou PIN sonder hierdie frase verloor, sal jy permanent toegang tot jou data verloor.';

  @override
  String get noMessages => 'Geen boodskappe';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Verwyder alle boodskappe met $name?';
  }

  @override
  String get confirmation => 'Bevestiging';

  @override
  String get untitled => 'Titelloos';

  @override
  String get noSessions => 'Geen sessies';

  @override
  String get unknownContact => 'Onbekende kontak';

  @override
  String get unnamed => 'Naamloos';

  @override
  String get noPendingRequestsAlt => 'Geen hangende versoeke';

  @override
  String get deleteAllCallHistory => 'Verwyder alle oproepgeskiedenis?';

  @override
  String get noCalls => 'Geen oproepe';

  @override
  String get noPreferences => 'Geen voorkeure';

  @override
  String get resetAllMediaPrefs => 'Herstel alle mediavoorkeure?';

  @override
  String get deleteThisAvatar => 'Verwyder hierdie avatar?';

  @override
  String get deleteAllAvatars => 'Verwyder alle avatars?';

  @override
  String get noAvatars => 'Geen avatars';

  @override
  String get deleteThisFile => 'Verwyder hierdie lêer?';

  @override
  String get deleteAllMediaFiles => 'Verwyder alle media?';

  @override
  String get noMediaFiles => 'Geen media';

  @override
  String get outgoing => 'Uitgaande';

  @override
  String get incoming => 'Inkomende';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Verganklike vertoning: ${seconds}s';
  }

  @override
  String get normalView => 'Normale vertoning';

  @override
  String get callReasonCompleted => 'Voltooid';

  @override
  String get callReasonMissed => 'Gemis';

  @override
  String get callReasonDeclined => 'Geweier';

  @override
  String get callReasonFailed => 'Misluk';

  @override
  String get justNow => 'Sopas';

  @override
  String timeAgoMinutes(int count) {
    return '$count min gelede';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}u gelede';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}d gelede';
  }

  @override
  String get messageTypeContact => 'Kontak';

  @override
  String get messageTypeLocation => 'Ligging';

  @override
  String get statusQueued => 'In ry';

  @override
  String get blockedBadge => 'Geblokkeer';

  @override
  String get protectedBadge => 'Beskerm';

  @override
  String messageCount(int count) {
    return '$count boodskap(pe)';
  }

  @override
  String get deleteQuestion => 'Verwyder?';

  @override
  String get transferMyAccountTitle => 'Dra my rekening oor';

  @override
  String get loadingError => 'Laaifout';

  @override
  String get transferToNewDevice => 'Dra oor na \'n nuwe toestel';

  @override
  String get transferInstructions =>
      'Op jou nuwe toestel, kies \"Herwin my rekening\" en voer hierdie inligting in:';

  @override
  String get yourHashIdLabel => 'Jou Hash ID';

  @override
  String get enterYourPinCode => 'Voer jou PIN-kode in';

  @override
  String get pinOwnerConfirmation =>
      'Om te bevestig dat jy die eienaar van hierdie rekening is';

  @override
  String get scanThisQrCode => 'Skandeer hierdie QR-kode';

  @override
  String get withYourNewDevice => 'Met jou nuwe toestel';

  @override
  String get orEnterTheCode => 'of voer die kode in';

  @override
  String get transferCodeLabel => 'Oordragkode';

  @override
  String get proximityVerification => 'Nabyheidsverifikasie';

  @override
  String get bringDevicesCloser => 'Bring albei toestelle nader';

  @override
  String get confirmTransferQuestion => 'Bevestig die oordrag?';

  @override
  String get accountWillBeTransferred =>
      'Jou rekening sal na die nuwe toestel oorgedra word.\n\nHierdie toestel sal permanent ontkoppel word.';

  @override
  String get transferComplete => 'Oordrag voltooid';

  @override
  String get transferSuccessMessage =>
      'Jou rekening is suksesvol oorgedra.\n\nHierdie toepassing sal nou sluit.';

  @override
  String get manualVerification => 'Handmatige verifikasie';

  @override
  String get codeDisplayedOnBothDevices => 'Kode vertoon op albei toestelle:';

  @override
  String get doesCodeMatchNewDevice =>
      'Stem hierdie kode ooreen met die een op die nuwe toestel?';

  @override
  String get verifiedStatus => 'Geverifieer';

  @override
  String get inProgressStatus => 'In proses...';

  @override
  String get notAvailableStatus => 'Nie beskikbaar';

  @override
  String get codeExpiredRestart => 'Die kode het verval. Begin asseblief oor.';

  @override
  String get codesDoNotMatchCancelled =>
      'Die kodes stem nie ooreen nie. Oordrag gekanselleer.';

  @override
  String transferToDevice(String device) {
    return 'Na: $device';
  }

  @override
  String get copiedExclamation => 'Gekopieer!';

  @override
  String expiresInTime(String time) {
    return 'Verval oor $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrie is nie beskikbaar op hierdie toestel nie';

  @override
  String get biometricAuthError => 'Fout tydens biometriese verifikasie';

  @override
  String get authenticateForBiometric =>
      'Verifieer asseblief om biometrie te aktiveer';

  @override
  String get biometricAuthFailed => 'Biometriese verifikasie het misluk';

  @override
  String get forceUpdateTitle => 'Opdatering vereis';

  @override
  String get forceUpdateMessage =>
      '\'n Nuwe weergawe van Hash is beskikbaar. Dateer asseblief op om voort te gaan.';

  @override
  String get updateButton => 'Opdateer';

  @override
  String get maintenanceInProgress => 'Onderhoud aan die gang';

  @override
  String get tryAgainLater => 'Probeer asseblief later weer';

  @override
  String get information => 'Inligting';

  @override
  String get later => 'Later';

  @override
  String get doYouLikeHash => 'Hou jy van Hash?';

  @override
  String get yourFeedbackHelps =>
      'Jou terugvoer help ons om die toep te verbeter';

  @override
  String get ratingTerrible => 'Verskriklik';

  @override
  String get ratingBad => 'Sleg';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Goed';

  @override
  String get ratingExcellent => 'Uitstekend!';

  @override
  String get donationMessage =>
      'Hash is \'n niewinsgewende projek. Jou ondersteuning help ons om \'n werklik private boodskapper te bou.';

  @override
  String get recentConnections => 'Onlangse verbindings';

  @override
  String get loginInfoText =>
      'Elke PIN-ontsluit word plaaslik aangeteken. Slegs die laaste 24 uur word gehou.';

  @override
  String get connectionCount => 'Verbinding(e)';

  @override
  String get periodLabel => 'Tydperk';

  @override
  String get historyLabel => 'Geskiedenis';

  @override
  String get noLoginRecorded => 'Geen aanmelding aangeteken';

  @override
  String get nextUnlocksAppearHere => 'Volgende ontsluitings sal hier verskyn.';

  @override
  String get dataLocalOnly =>
      'Hierdie data word slegs op jou toestel gestoor en word nooit gestuur nie.';

  @override
  String get currentSession => 'Huidig';

  @override
  String get todayLabel => 'Vandag';

  @override
  String get yesterdayLabel => 'Gister';

  @override
  String get justNowLabel => 'Sopas';

  @override
  String minutesAgoLabel(int count) {
    return '$count min gelede';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}u gelede';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}u ${minutes}min gelede';
  }

  @override
  String get noMaintenancePlanned => 'Geen onderhoud beplan';

  @override
  String get everythingWorkingNormally => 'Alles werk normaal';

  @override
  String get maintenanceTitle => 'Onderhoud';

  @override
  String get maintenanceActiveLabel => 'AAN DIE GANG';

  @override
  String get maintenancePlannedLabel => 'BEPLAN';

  @override
  String get locking => 'Sluit...';

  @override
  String get newMessageNotification => 'Nuwe boodskap';

  @override
  String get secExplainTitle => 'Hoe Hash jou beskerm';

  @override
  String get secExplainIntro =>
      'Hash is ontwerp sodat niemand jou boodskappe kan lees nie.';

  @override
  String get secExplainIntroSub =>
      'Nie eens ons nie.\nHier is hoe dit werk, eenvoudig verduidelik.';

  @override
  String get secJourneyLabel => 'DIE REIS';

  @override
  String get secJourneyTitle => 'Die reis van jou boodskap';

  @override
  String get secJourneySubtitle =>
      'Van jou vinger tot jou kontak se skerm, elke stap is beskerm. Volg die pad.';

  @override
  String get secStep1Title => 'Jy skryf jou boodskap';

  @override
  String get secStep1Desc =>
      'Jy tik \"Hallo!\" in die app. Op hierdie punt bestaan die boodskap slegs in jou foon se geheue. Niks is gestuur nie.';

  @override
  String get secStep2Title => 'Enkripsie met Signal Protocol';

  @override
  String get secStep2Desc =>
      'Sodra jy \"Stuur\" druk, word jou boodskap omgeskakel in \'n string onverstaanbare karakters. Dit is asof jou boodskap in \'n kluis gesluit is waarvoor slegs jou kontak die sleutel het.';

  @override
  String get secStep3Title => 'Sealed Sender: die onsigbare koevert';

  @override
  String get secStep3Desc =>
      'Stel jou voor jy stuur \'n brief per pos, maar sonder \'n terugstuuradres op die koevert. Dit is presies wat Hash doen. Die boodskap word in \'n anonieme posbus geplaas. Die bediener weet nie wie dit gestuur het nie.';

  @override
  String get secStep4Title => 'Die bediener sien niks';

  @override
  String get secStep4Desc =>
      'Die bediener tree op as \'n blinde posman. Dit weet net \"iemand het iets in posbus #A7X9 geplaas\". Dit weet nie wie dit gestuur het, wat dit is, of vir wie dit is nie.';

  @override
  String get secStep4Highlight =>
      'Geen metadata gestoor nie: geen IP-adres, geen tydstempel, geen skakel tussen sender en ontvanger.';

  @override
  String get secStep5Title => 'Jou kontak ontvang die boodskap';

  @override
  String get secStep5Desc =>
      'Jou kontak se foon haal die inhoud uit hul anonieme posbus en dekripteer die boodskap met hul private sleutel, wat nooit hul toestel verlaat het nie. \"Hallo!\" verskyn op hul skerm.';

  @override
  String get secStep6Title => 'Die boodskap verdwyn van die bediener';

  @override
  String get secStep6Desc =>
      'Sodra jou kontak ontvangs bevestig, verwyder die bediener die boodskap permanent. Geen asblik, geen argief, geen rugsteun nie. Selfs ongelees boodskappe word outomaties vernietig na 24 uur.';

  @override
  String get secStep7Title => 'Plaaslike verval';

  @override
  String get secStep7Desc =>
      'Op jou kontak se foon vernietig die boodskap homself volgens die duur wat jy gekies het: onmiddellik na lees, 5 minute, 1 uur... jy besluit.';

  @override
  String get secJourneyConclusion =>
      'Resultaat: geen spoor op die bediener, geen spoor op toestelle. Die boodskap het net lank genoeg bestaan om gelees te word, dan het dit verdwyn.';

  @override
  String get secArchLabel => 'ARGITEKTUUR';

  @override
  String get secArchTitle => '5 lae van beskerming';

  @override
  String get secArchSubtitle =>
      'Hash maak nie staat op \'n enkele tegnologie nie. Elke laag versterk die ander. Selfs as een laag gekompromitteer word, bly jou data veilig.';

  @override
  String get secLayer1Title => 'End-tot-end-enkripsie';

  @override
  String get secLayer1Desc =>
      'Elke boodskap word met \'n unieke sleutel geënkripteer. In eenvoudige terme: selfs as iemand een boodskap dekripteer, sal hulle nie die volgende een kan dekripteer nie. Elke boodskap het sy eie slot.';

  @override
  String get secLayer1Detail =>
      'Vir lêers (foto\'s, video\'s, dokumente) gebruik Hash addisionele AES-256-GCM-enkripsie. Die lêer word geënkripteer voordat dit jou foon verlaat.';

  @override
  String get secLayer2Title => 'Sealed Sender (netwerkanonimiteit)';

  @override
  String get secLayer2Desc =>
      'Gewone boodskapdienste stuur jou boodskappe met jou identiteit aangeheg. Dit is asof jy jou naam op die koevert skryf. Hash gebruik anonieme posbusse: die bediener lewer die boodskap af sonder om te weet wie dit gestuur het.';

  @override
  String get secLayer2Detail =>
      'Resultaat: selfs in geval van \'n bediener-datalek, is dit onmoontlik om te rekonstrueer wie met wie praat.';

  @override
  String get secLayer3Title => 'Outomatiese verwydering';

  @override
  String get secLayer3Desc =>
      'Boodskappe word van die bediener verwyder sodra ontvangs bevestig is. Selfs as \'n boodskap nooit onttrek word, word dit outomaties vernietig na 24 uur.';

  @override
  String get secLayer3Detail =>
      'Op jou foon vernietig boodskappe hulself volgens die duur wat jy kies: onmiddellik, 5 min, 15 min, 30 min, 1u, 3u, 6u, of 12u.';

  @override
  String get secLayer4Title => 'Plaaslike toegangsbeskerming';

  @override
  String get secLayer4Desc =>
      'Die app word beskerm deur \'n 6-syfer PIN en/of biometrie (Face ID, vingerafdruk). Na te veel mislukte pogings sluit die app met \'n toenemende vertraging na elke mislukking.';

  @override
  String get secLayer5Title => 'Geslote databasis';

  @override
  String get secLayer5Desc =>
      'Aan die bedienerkant kan geen gebruiker direk na die databasis skryf nie. Alle aksies gaan deur veilige funksies wat elke versoek verifieer.';

  @override
  String get secLayer5Detail =>
      'Dit is soos \'n banktoonbank: jy raak nooit self aan die kluis nie. Jy maak \'n versoek, en die stelsel kontroleer dat jy die reg het voordat dit optree.';

  @override
  String get secVashLabel => 'UNIEK IN DIE WÊRELD';

  @override
  String get secVashTitle => 'Vash-modus';

  @override
  String get secVashSubtitle =>
      '\'n Nood-sekuriteitstelsel wat nie in enige ander boodskap-app bestaan nie.';

  @override
  String get secVashScenarioTitle => 'Stel jou hierdie situasie voor';

  @override
  String get secVashScenario1 => 'Iemand kry toegang tot jou foon';

  @override
  String get secVashScenario2 => 'Jou PIN-kode word gevra';

  @override
  String get secVashScenario3 => 'Jy wil al jou data dringend uitvee';

  @override
  String get secVashSolutionTitle => 'Die oplossing: twee PIN-kodes';

  @override
  String get secVashSolutionDesc =>
      'Jy stel twee verskillende PIN-kodes in Hash op:';

  @override
  String get secVashNormalCodeLabel => 'Normale kode';

  @override
  String get secVashNormalCodeDesc =>
      'Maak die app normaal oop met al jou data';

  @override
  String get secVashCodeLabel2 => 'Vash-kode';

  @override
  String get secVashCodeDescription =>
      'Maak die app normaal oop... maar al jou data word stilweg in die agtergrond verwyder';

  @override
  String get secVashWhatHappensTitle => 'Wat gebeur daarna';

  @override
  String get secVashWhatHappensDesc =>
      'Die app maak normaal oop. Geen waarskuwing, geen verdagte animasie nie. Die skerm wys eenvoudig \'n leë app, asof jy dit pas geïnstalleer het.\n\nIn werklikheid is al jou gesprekke, kontakte en boodskappe onomkeerbaar verwyder in \'n fraksie van \'n sekonde.';

  @override
  String get secCallsLabel => 'OPROEPE EN LÊERS';

  @override
  String get secCallsTitle => 'Alles is geënkripteer';

  @override
  String get secCallsSubtitle =>
      'Dit is nie net boodskappe nie. Absoluut alles wat deur Hash gaan, is end-tot-end geënkripteer.';

  @override
  String get secAudioCallTitle => 'Klankoproepe';

  @override
  String get secAudioCallDesc =>
      'End-tot-end geënkripteer via WebRTC. Stem word direk tussen toestelle oorgedra.';

  @override
  String get secVideoCallTitle => 'Video-oproepe';

  @override
  String get secVideoCallDesc =>
      'Dieselfde tegnologie, elke stroom individueel geënkripteer.';

  @override
  String get secPhotosTitle => 'Foto\'s en video\'s';

  @override
  String get secPhotosDesc =>
      'Geënkripteer in AES-256-GCM voordat dit jou foon verlaat.';

  @override
  String get secDocsTitle => 'Dokumente';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, enige lêer. Naam, grootte en inhoud geënkripteer.';

  @override
  String get secAnonLabel => 'ANONIMITEIT';

  @override
  String get secAnonTitle => 'Geen identiteit nodig';

  @override
  String get secAnonSubtitle =>
      'Hash vra nooit vir jou telefoonnommer of e-pos nie. Jy word geïdentifiseer deur \'n unieke en anonieme Hash ID.';

  @override
  String get secHashIdTitle => 'Jou Hash ID';

  @override
  String get secHashIdDesc =>
      'Dit is jou unieke identifiseerder. Dit onthul niks oor jou nie: nie jou naam, nie jou nommer, nie jou ligging nie. Dit is soos \'n skuilnaam wat onmoontlik aan jou werklike identiteit gekoppel kan word.\n\nOm \'n kontak by te voeg, deel jy jou Hash ID of skandeer \'n QR-kode. Dit is al. Geen gesinkroniseerde adresboek, geen \"Mense wat jy dalk ken\" voorstelle nie.';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => 'Wat Hash nie weet nie';

  @override
  String get secDataSubtitle =>
      'Die beste manier om jou data te beskerm, is om dit nie in te samel nie.';

  @override
  String get secNeverCollected => 'Nooit ingesamel';

  @override
  String get secNeverItem1 => 'Boodskapinhoud';

  @override
  String get secNeverItem2 => 'Kontaklys';

  @override
  String get secNeverItem3 => 'Telefoonnommer';

  @override
  String get secNeverItem4 => 'E-posadres';

  @override
  String get secNeverItem5 => 'IP-adres';

  @override
  String get secNeverItem6 => 'Ligging';

  @override
  String get secNeverItem7 => 'Metadata (wie praat met wie)';

  @override
  String get secNeverItem8 => 'Oproepgeskiedenis';

  @override
  String get secNeverItem9 => 'Adresboek';

  @override
  String get secNeverItem10 => 'Advertensie-identifiseerders';

  @override
  String get secTempStored => 'Tydelik gestoor';

  @override
  String get secTempItem1 => 'Anonieme Hash ID (unieke identifiseerder)';

  @override
  String get secTempItem2 => 'Publieke enkripsie-sleutels';

  @override
  String get secTempItem3 => 'Geënkripteerde boodskappe in transito (maks 24u)';

  @override
  String get secTempNote =>
      'Selfs hierdie minimale data kan jou nie identifiseer nie. Jou Hash ID is nie aan enige persoonlike inligting gekoppel nie.';

  @override
  String get secFooterTitle => 'Jou privaatheid, jou vryheid';

  @override
  String get secFooterDesc =>
      'Hash gebruik dieselfde enkripsietegnologieë as die mees veeleisende professionele toepassings. Jou boodskappe word deur wiskunde beskerm, nie deur beloftes nie.';

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
