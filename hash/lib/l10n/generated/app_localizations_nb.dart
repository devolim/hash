// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Null spor. Null kompromiss.';

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
  String get conversations => 'Chatter';

  @override
  String get contacts => 'Kontakter';

  @override
  String get noConversation => 'Ingen chatter';

  @override
  String get noConversationSubtitle =>
      'Legg til en kontakt for å begynne å chatte sikkert';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ventende forespørsler',
      one: '1 ventende forespørsel',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sendte forespørsler venter',
      one: '1 sendt forespørsel venter',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Legg til kontakt';

  @override
  String get shareApp => 'Del appen';

  @override
  String get newMessage => 'Ny melding';

  @override
  String get newConversation => 'Send en melding';

  @override
  String get settings => 'Innstillinger';

  @override
  String get myHashId => 'Min Hash-ID';

  @override
  String get supportHash => 'Støtt Hash';

  @override
  String get supportHashSubtitle => 'Hash er et ideelt prosjekt';

  @override
  String get donate => 'Doner';

  @override
  String get appearance => 'Utseende';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatisk';

  @override
  String get themeAutoSubtitle => 'Følger systeminnstillingene';

  @override
  String get themeDark => 'Mørkt';

  @override
  String get themeLight => 'Lyst';

  @override
  String get themeRecommendation => 'Mørkt tema anbefales for bedre personvern';

  @override
  String get language => 'Språk';

  @override
  String get languageAuto => 'Automatisk (system)';

  @override
  String get notifications => 'Varsler';

  @override
  String get messages => 'Meldinger';

  @override
  String get calls => 'Samtaler';

  @override
  String get vibration => 'Vibrasjon';

  @override
  String get notificationContent => 'Varselinnhold';

  @override
  String get notificationContentFull => 'Vis alt';

  @override
  String get notificationContentFullDesc =>
      'Kontaktnavn og forhåndsvisning av melding';

  @override
  String get notificationContentName => 'Kun navn';

  @override
  String get notificationContentNameDesc => 'Viser bare kontaktnavnet';

  @override
  String get notificationContentDiscrete => 'Diskret';

  @override
  String get notificationContentDiscreteDesc => 'Viser bare «Ny melding»';

  @override
  String get security => 'Sikkerhet';

  @override
  String get howHashProtectsYou => 'Hvordan Hash beskytter deg';

  @override
  String get howHashProtectsYouSubtitle => 'Forstå sikkerheten din';

  @override
  String get accountSecurity => 'Kontosikkerhet';

  @override
  String get accountSecuritySubtitle => 'PIN, biometri, Vash-modus';

  @override
  String get blockScreenshots => 'Blokker skjermbilder';

  @override
  String get transferDevice => 'Overfør til en annen enhet';

  @override
  String get transferDeviceSubtitle => 'Migrer kontoen din';

  @override
  String get pinCode => 'PIN-kode';

  @override
  String get changePin => 'Endre PIN-kode';

  @override
  String get currentPin => 'Nåværende PIN-kode';

  @override
  String get newPin => 'Ny PIN-kode';

  @override
  String get confirmPin => 'Bekreft PIN-kode';

  @override
  String get pinChanged => 'PIN-kode endret';

  @override
  String get incorrectPin => 'Feil PIN';

  @override
  String get pinsDoNotMatch => 'PIN-kodene stemmer ikke overens';

  @override
  String get autoLock => 'Autolås';

  @override
  String get autoLockDelay => 'Låseforsinkelse';

  @override
  String get autoLockImmediate => 'Umiddelbart';

  @override
  String get autoLockMinute => '1 minutt';

  @override
  String autoLockMinutes(int count) {
    return '$count minutter';
  }

  @override
  String get vashCode => 'Vash-kode';

  @override
  String get vashModeTitle => 'Vash-modus';

  @override
  String get vashModeExplanation => 'Ditt ultimate sikkerhetsnett.';

  @override
  String get vashModeDescription =>
      'Du velger en ekstra PIN-kode. Hvis du noen gang blir tvunget til å åpne Hash, taster du inn denne koden i stedet for din vanlige PIN.\n\nAppen åpnes normalt, men alle samtaler og kontakter er borte.\n\nFor alle som ser på skjermen din, ser Hash bare tomt ut — som om du aldri har brukt den.';

  @override
  String get vashModeIrreversible =>
      'Denne handlingen er stille og irreversibel.';

  @override
  String get chooseVashCode => 'Velg min Vash-kode';

  @override
  String get vashCodeInfo =>
      'En ekstra PIN-kode som åpner appen normalt, men tom.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Hvis du taster inn denne koden i stedet for PIN-en din:';

  @override
  String get vashDeleteContacts => 'Kontaktene dine forsvinner';

  @override
  String get vashDeleteMessages => 'Samtalene dine forsvinner';

  @override
  String get vashDeleteHistory => 'Notatene dine forsvinner';

  @override
  String get vashKeepId =>
      'Hash-identiteten din (#XXX-XXX-XXX) forblir den samme';

  @override
  String get vashAppearNormal =>
      'Appen ser normal men tom ut, som ny. Denne handlingen er irreversibel.';

  @override
  String get setupVashCode => 'Sett opp Vash-kode';

  @override
  String get modifyVashCode => 'Endre Vash-kode';

  @override
  String get currentVashCode => 'Nåværende Vash-kode';

  @override
  String get newVashCode => 'Ny Vash-kode';

  @override
  String get confirmVashCode => 'Bekreft Vash-kode';

  @override
  String get vashCodeConfigured => 'Vash-kode konfigurert';

  @override
  String get vashCodeModified => 'Vash-kode endret';

  @override
  String get vashCodeMustDiffer =>
      'Vash-koden må være forskjellig fra PIN-koden';

  @override
  String get incorrectVashCode => 'Feil Vash-kode';

  @override
  String get vashWhatToDelete => 'Hva skal Vash-modus fjerne?';

  @override
  String get vashDeleteContactsOption => 'Kontakter';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Meldinger';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notater';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash-modus aktivert';

  @override
  String get vashCreateSubtitle =>
      'Velg en kode som er forskjellig fra hoved-PIN-en din';

  @override
  String get vashConfirmSubtitle => 'Bekreft Vash-koden din';

  @override
  String get pinCodeForEntry => 'PIN-kode for å gå inn i appen';

  @override
  String get vashCodeSection => 'Vash-modus';

  @override
  String get biometric => 'Biometri';

  @override
  String get biometricUnlock => 'Lås opp med fingeravtrykk eller Face ID';

  @override
  String get enableBiometric => 'Aktiver biometri';

  @override
  String get biometricWarningMessage =>
      'Hvis du aktiverer biometri, kan du ikke bruke Vash-koden din til å logge inn i appen.\n\nDu kan bare bruke Vash-koden hvis biometri mislykkes (etter flere mislykkede forsøk).\n\nEr du sikker på at du vil fortsette?';

  @override
  String get understood => 'Jeg forstår';

  @override
  String get shareAppSubtitle => 'Del Hash med venner og familie';

  @override
  String get share => 'Del';

  @override
  String get danger => 'Fare';

  @override
  String get deleteAccount => 'Slett kontoen min';

  @override
  String get deleteAccountSubtitle => 'Irreversibel handling';

  @override
  String get deleteAccountConfirmTitle => 'Slett kontoen min';

  @override
  String get deleteAccountConfirmMessage =>
      'Kontoen din vil bli permanent slettet. Denne handlingen er irreversibel.\n\n• Alle chattene dine\n• Alle kontaktene dine\n• Hash-ID-en din\n\nDu må opprette en ny konto.';

  @override
  String get deleteForever => 'Slett permanent';

  @override
  String get cancel => 'Avbryt';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash-modus aktivert.';

  @override
  String deletionError(String error) {
    return 'Slettingsfeil: $error';
  }

  @override
  String get yourSecurity => 'Din sikkerhet';

  @override
  String get securityInfo =>
      '• Ende-til-ende-kryptering (Signal Protocol)\n• Ingen data på serverne våre etter levering\n• Nøkler lagret kun på enheten din\n• PIN-kode sendes aldri til serveren';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Velkommen';

  @override
  String get securityStatement1 => 'Meldingene dine er beskyttet.';

  @override
  String get securityStatement2 => 'Ende-til-ende-kryptering.';

  @override
  String get securityStatement3 => 'Ingen spor. Ingen kompromiss.';

  @override
  String get securityStatement4 => 'Personvernet ditt er en rettighet.';

  @override
  String get accessBlocked => 'Tilgang blokkert';

  @override
  String get tooManyAttempts => 'For mange forsøk. Prøv igjen senere.';

  @override
  String get pleaseWait => 'Vennligst vent';

  @override
  String get waitDelay => 'Vennligst vent til forsinkelsen er over';

  @override
  String attemptCount(int current, int max) {
    return 'Forsøk $current av $max';
  }

  @override
  String retryIn(String time) {
    return 'Prøv igjen om $time';
  }

  @override
  String get forgotPin => 'Glemt PIN? Bruk gjenopprettingsfrase';

  @override
  String get useRecoveryPhrase => 'Bruk gjenopprettingsfrase';

  @override
  String get recoveryWarningTitle => 'Advarsel';

  @override
  String get recoveryWarningMessage => 'Kontogjenoppretting vil:';

  @override
  String get recoveryDeleteAllMessages => 'Slette ALLE meldingene dine';

  @override
  String get recoveryWaitDelay => 'Kreve en ventetid på 1 time';

  @override
  String get recoveryKeepContacts => 'Beholde kontaktene dine';

  @override
  String get recoveryIrreversible =>
      'Denne handlingen er irreversibel. Meldingene dine vil bli permanent tapt.';

  @override
  String get iUnderstand => 'Jeg forstår';

  @override
  String get accountRecovery => 'Kontogjenoppretting';

  @override
  String get enterRecoveryPhrase =>
      'Skriv inn de 24 ordene i gjenopprettingsfrasen din, atskilt med mellomrom.';

  @override
  String get recoveryPhraseHint => 'ord1 ord2 ord3 ...';

  @override
  String get recover => 'Gjenopprett';

  @override
  String get recoveryPhraseRequired =>
      'Vennligst skriv inn gjenopprettingsfrasen din';

  @override
  String get recoveryPhrase24Words => 'Frasen må inneholde nøyaktig 24 ord';

  @override
  String get incorrectRecoveryPhrase => 'Feil gjenopprettingsfrase';

  @override
  String get recoveryInitError => 'Feil ved initialisering av gjenoppretting';

  @override
  String get securityDelay => 'Sikkerhetsforsinkelse';

  @override
  String get securityDelayMessage =>
      'For din sikkerhet kreves en ventetid før du kan opprette en ny PIN.';

  @override
  String get timeRemaining => 'Tid igjen';

  @override
  String get messagesDeletedForProtection =>
      'Meldingene dine er slettet for din beskyttelse.';

  @override
  String get canCloseApp => 'Du kan lukke appen og komme tilbake senere.';

  @override
  String get onboardingTitle1 => 'Velkommen til Hash';

  @override
  String get onboardingSubtitle1 =>
      'Meldingstjenesten som ikke etterlater spor';

  @override
  String get onboardingTitle2 => 'Total kryptering';

  @override
  String get onboardingSubtitle2 =>
      'Meldingene dine er ende-til-ende-kryptert med Signal-protokollen';

  @override
  String get onboardingTitle3 => 'Ingen spor';

  @override
  String get onboardingSubtitle3 =>
      'Meldinger slettes fra serverne ved levering';

  @override
  String get onboardingTitle4 => 'Din sikkerhet';

  @override
  String get onboardingSubtitle4 =>
      'PIN-kode, Vash-modus og gjenopprettingsfrase';

  @override
  String get getStarted => 'Kom i gang';

  @override
  String get next => 'Neste';

  @override
  String get skip => 'Hopp over';

  @override
  String get alreadyHaveAccount => 'Jeg har allerede en konto';

  @override
  String get transferMyAccount => 'Overfør kontoen min';

  @override
  String get createPin => 'Opprett en PIN-kode';

  @override
  String get createPinSubtitle =>
      'Denne koden beskytter tilgangen til appen din';

  @override
  String get confirmYourPin => 'Bekreft PIN-koden din';

  @override
  String get confirmPinSubtitle => 'Tast inn PIN-koden din igjen';

  @override
  String get saveRecoveryPhrase => 'Gjenopprettingsfrase';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Skriv ned disse 24 ordene i rekkefølge. De lar deg gjenopprette kontoen din hvis du glemmer PIN-koden.';

  @override
  String get phraseWritten => 'Jeg har skrevet ned frasen min';

  @override
  String get warningRecoveryPhrase =>
      'Hvis du mister denne frasen og glemmer PIN-koden din, mister du tilgangen til kontoen din.';

  @override
  String get accountTransferred => 'Konto overført';

  @override
  String get accountTransferredMessage =>
      'Kontoen din er overført til en annen enhet. Denne økten er ikke lenger gyldig.';

  @override
  String get accountTransferredInfo =>
      'Hvis du ikke startet denne overføringen, kan kontoen din ha blitt kompromittert.';

  @override
  String get logout => 'Logg ut';

  @override
  String get transferAccount => 'Overfør konto';

  @override
  String get transferAccountInfo =>
      'Overfør Hash-kontoen din til en ny enhet. Den nåværende økten din vil bli ugyldiggjort.';

  @override
  String get generateTransferCode => 'Generer overføringskode';

  @override
  String get transferCode => 'Overføringskode';

  @override
  String transferCodeExpires(int minutes) {
    return 'Denne koden utløper om $minutes minutter';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Tast inn denne koden på den nye enheten din for å overføre kontoen.';

  @override
  String get generateNewCode => 'Generer ny kode';

  @override
  String get scanQrCode => 'Skann QR-kode';

  @override
  String get scanQrCodeSubtitle =>
      'Skann en kontakts QR-kode for å legge dem til';

  @override
  String get qrCodeDetected => 'QR-kode oppdaget';

  @override
  String get invalidQrCode => 'Ugyldig QR-kode';

  @override
  String get cameraPermissionRequired => 'Kameratillatelse kreves';

  @override
  String get myQrCode => 'Min QR-kode';

  @override
  String get myQrCodeSubtitle =>
      'Del denne QR-koden slik at kontaktene dine kan legge deg til';

  @override
  String get shareQrCode => 'Del';

  @override
  String get addContactTitle => 'Legg til kontakt';

  @override
  String get addContactByHashId => 'Skriv inn kontaktens Hash-ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Søk';

  @override
  String get contactNotFound => 'Kontakt ikke funnet';

  @override
  String get contactAlreadyAdded => 'Denne kontakten er allerede i listen din';

  @override
  String get contactAdded => 'Kontakt lagt til';

  @override
  String get myProfile => 'Min profil';

  @override
  String get myProfileSubtitle =>
      'Del denne informasjonen slik at andre kan legge deg til';

  @override
  String get temporaryCode => 'Midlertidig kode';

  @override
  String temporaryCodeExpires(String time) {
    return 'Utløper om $time';
  }

  @override
  String get codeExpired => 'Kode utløpt';

  @override
  String get generateNewCodeButton => 'Ny kode';

  @override
  String get copyHashId => 'Kopier ID';

  @override
  String get copyCode => 'Kopier kode';

  @override
  String get copiedToClipboard => 'Kopiert';

  @override
  String get showMyQrCode => 'Vis min QR-kode';

  @override
  String get orDivider => 'eller';

  @override
  String get openScanner => 'Åpne skanner';

  @override
  String get addManually => 'Legg til manuelt';

  @override
  String get contactHashIdLabel => 'Kontaktens Hash-ID';

  @override
  String get temporaryCodeLabel => 'Midlertidig kode';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Be kontakten din om å generere en kode fra profilen sin';

  @override
  String get verifyAndAdd => 'Verifiser og legg til';

  @override
  String get fillAllFields => 'Vennligst fyll ut alle felt';

  @override
  String get invalidHashIdFormat => 'Ugyldig ID-format (f.eks.: 123-456-ABC)';

  @override
  String get userNotFound => 'Bruker ikke funnet';

  @override
  String get cannotAddYourself => 'Du kan ikke legge til deg selv';

  @override
  String get invalidOrExpiredCode => 'Ugyldig eller utløpt midlertidig kode';

  @override
  String get contactFound => 'Kontakt funnet!';

  @override
  String get howToCallContact => 'Hva vil du kalle dem?';

  @override
  String get contactNameHint => 'Kontaktnavn';

  @override
  String get addContactButton => 'Legg til';

  @override
  String get contactDetails => 'Kontaktdetaljer';

  @override
  String get contactName => 'Kontaktnavn';

  @override
  String get contactHashId => 'Hash-ID';

  @override
  String addedOn(String date) {
    return 'Lagt til $date';
  }

  @override
  String get deleteContact => 'Slett kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Slette denne kontakten?';
  }

  @override
  String get deleteContactMessage => 'Dette sletter også hele chatten.';

  @override
  String get delete => 'Slett';

  @override
  String get typeMessage => 'Skriv en melding...';

  @override
  String get messageSent => 'Sendt';

  @override
  String get messageDelivered => 'Levert';

  @override
  String get messageRead => 'Lest';

  @override
  String get messageFailed => 'Sending mislyktes';

  @override
  String get now => 'Nå';

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
    return '${count}d';
  }

  @override
  String get today => 'I dag';

  @override
  String get yesterday => 'I går';

  @override
  String dateAtTime(String date, String time) {
    return '$date kl. $time';
  }

  @override
  String get shareMessage =>
      'Bli med meg på Hash! 🔒\n\nDet er en virkelig privat meldingstjeneste: total kryptering, ingen spor på servere, og panikkmodus ved behov.\n\nLast ned appen her 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Feil';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Vis';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nei';

  @override
  String get save => 'Lagre';

  @override
  String get edit => 'Rediger';

  @override
  String get close => 'Lukk';

  @override
  String get confirm => 'Bekreft';

  @override
  String get loading => 'Laster...';

  @override
  String get retry => 'Prøv igjen';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Ventende forespørsler';

  @override
  String get noPendingRequests => 'Ingen ventende forespørsler';

  @override
  String get pendingRequestsSubtitle =>
      'Disse personene ønsker å legge deg til';

  @override
  String requestFromUser(String hashId) {
    return 'Forespørsel fra $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Utløper om $days dager';
  }

  @override
  String get acceptRequest => 'Godta';

  @override
  String get rejectRequest => 'Avvis';

  @override
  String get requestAccepted => 'Forespørsel godtatt';

  @override
  String get requestRejected => 'Forespørsel avvist';

  @override
  String get requestSent => 'Forespørsel sendt!';

  @override
  String get requestSentSubtitle =>
      'Forespørselen din er sendt. Brukeren må godta den før dere kan chatte.';

  @override
  String get requestAlreadyPending => 'En forespørsel venter allerede';

  @override
  String get requestAlreadySentByOther =>
      'Denne personen har allerede sendt deg en forespørsel';

  @override
  String get addByHashId => 'Legg til med Hash-ID';

  @override
  String get addByHashIdSubtitle =>
      'Skriv inn kontaktens Hash-ID og midlertidige kode';

  @override
  String get enterTemporaryCode => 'Skriv inn den 6-sifrede koden';

  @override
  String get sendRequest => 'Send forespørsel';

  @override
  String get acceptContactTitle => 'Godta kontakt';

  @override
  String get acceptContactSubtitle => 'Du kan gi dem et tilpasset navn';

  @override
  String get leaveEmptyForHashId => 'La stå tomt for å bruke Hash-ID';

  @override
  String get firstName => 'Fornavn';

  @override
  String get lastName => 'Etternavn';

  @override
  String get notes => 'Notater';

  @override
  String get notesHint => 'Personlige notater om denne kontakten';

  @override
  String get photoOptional => 'Bilde (valgfritt)';

  @override
  String get contactNameOptional => 'Navn (valgfritt)';

  @override
  String get notesOptional => 'Notater (valgfritt)';

  @override
  String get storedLocally => 'Lagret kun på enheten din';

  @override
  String get encryptedMessageLabel => 'Kryptert melding';

  @override
  String get identityMessageHint =>
      'Hvem er du? Hvordan kjenner dere hverandre?';

  @override
  String get messageWillBeSentEncrypted =>
      'Denne meldingen blir kryptert og sendt til mottakeren';

  @override
  String get sendRequestButton => 'Send forespørsel';

  @override
  String get requestExpiresIn24h =>
      'Forespørselen utløper om 24 timer hvis den ikke godtas';

  @override
  String get theyAlreadySentYouRequest =>
      'Denne personen har allerede sendt deg en forespørsel';

  @override
  String get requests => 'Forespørsler';

  @override
  String get receivedRequests => 'Mottatt';

  @override
  String get sentRequests => 'Sendt';

  @override
  String get noSentRequests => 'Ingen sendte forespørsler';

  @override
  String get cancelRequest => 'Avbryt';

  @override
  String get deleteRequest => 'Slett forespørsel';

  @override
  String get requestCancelled => 'Forespørsel avbrutt';

  @override
  String sentTo(String hashId) {
    return 'Sendt til $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Utløper om $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Mottatt for $time siden';
  }

  @override
  String get messageFromRequester => 'Melding fra avsender';

  @override
  String get copy => 'Kopier';

  @override
  String get messageInfo => 'Meldingsinfo';

  @override
  String get messageDirection => 'Retning';

  @override
  String get messageSentByYou => 'Sendt av deg';

  @override
  String get messageReceived => 'Mottatt';

  @override
  String get messageSentAt => 'Sendt';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Lest';

  @override
  String get messageType => 'Type';

  @override
  String get messageSize => 'Størrelse';

  @override
  String get messageExpiresAt => 'Utløper';

  @override
  String get messageEncrypted => 'Ende-til-ende-kryptert';

  @override
  String get messageStatusSending => 'Sender...';

  @override
  String get messageStatusSent => 'Sendt';

  @override
  String get messageStatusDelivered => 'Levert';

  @override
  String get messageStatusRead => 'Lest';

  @override
  String get messageStatusFailed => 'Mislyktes';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Venter på levering';

  @override
  String get deletedFromServer => 'Slettet';

  @override
  String get messageTypeText => 'Tekst';

  @override
  String get messageTypeImage => 'Bilde';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Stemme';

  @override
  String get messageTypeFile => 'Fil';

  @override
  String get indefinitely => 'Ubestemt';

  @override
  String get hoursShort => 't';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'timer';

  @override
  String get minutes => 'minutter';

  @override
  String get seconds => 'sekunder';

  @override
  String get ephemeralMessages => 'Forsvinnende meldinger';

  @override
  String get ephemeralMessagesDescription =>
      'Meldinger slettes automatisk etter denne tiden';

  @override
  String get ephemeralImmediate => 'Umiddelbart (etter lesing)';

  @override
  String get ephemeralImmediateDesc => 'Slettes så snart de er lest';

  @override
  String get ephemeralMyPreference => 'Min preferanse';

  @override
  String get ephemeralMyPreferenceDesc => 'Bruk global innstilling';

  @override
  String get ephemeralDefaultSetting => 'Meldingsvarighet';

  @override
  String get ephemeralChooseDefault => 'Anbefalt';

  @override
  String get ephemeral30Seconds => '30 sekunder';

  @override
  String get ephemeral30SecondsDesc => 'Slettes 30s etter lesing';

  @override
  String get ephemeral5Minutes => '5 minutter';

  @override
  String get ephemeral5MinutesDesc => 'Slettes 5min etter lesing';

  @override
  String get ephemeral1Hour => '1 time';

  @override
  String get ephemeral1HourDesc => 'Slettes 1t etter lesing';

  @override
  String get ephemeral3Hours => '3 timer';

  @override
  String get ephemeral6Hours => '6 timer';

  @override
  String get ephemeral6HoursDesc => 'Slettes 6t etter lesing';

  @override
  String get ephemeral12Hours => '12 timer';

  @override
  String get ephemeral24Hours => '24 timer';

  @override
  String get ephemeral24HoursDesc => 'Slettes 24t etter lesing';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Egendefinert varighet';

  @override
  String get howItWorks => 'Slik fungerer det';

  @override
  String get ephemeralExplanation1 =>
      'Meldinger slettes fra serveren så snart de er mottatt.';

  @override
  String get ephemeralExplanation2 =>
      'Denne innstillingen definerer når meldinger forsvinner fra DIN telefon etter lesing.';

  @override
  String get ephemeralExplanation3 =>
      'Kontakten din har sin egen innstilling for sin telefon.';

  @override
  String get mute1Hour => '1 time';

  @override
  String get mute8Hours => '8 timer';

  @override
  String get mute1Day => '1 dag';

  @override
  String get mute1Week => '1 uke';

  @override
  String get muteAlways => 'Alltid';

  @override
  String get muteExplanation => 'Du vil ikke motta varsler for denne kontakten';

  @override
  String get showCallsInRecents => 'Vis i nylige samtaler';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash-samtaler vises i telefonhistorikken';

  @override
  String get feedback => 'Tilbakemelding';

  @override
  String get muteNotifications => 'Demp varsler';

  @override
  String get muteDescription => 'Du vil ikke motta varsler for denne kontakten';

  @override
  String mutedUntil(String time) {
    return 'Dempet til $time';
  }

  @override
  String get notMuted => 'Varsler aktivert';

  @override
  String get unmute => 'Slå på igjen';

  @override
  String get notificationSound => 'Varsellyd';

  @override
  String get defaultSound => 'Standard';

  @override
  String get chatSettings => 'Chat-innstillinger';

  @override
  String get bubbleColor => 'Boblefarge';

  @override
  String get backgroundColor => 'Bakgrunnsfarge';

  @override
  String get backgroundImage => 'Bakgrunnsbilde';

  @override
  String get chatBackground => 'Chat-bakgrunn';

  @override
  String get customColor => 'Egendefinert';

  @override
  String get defaultColor => 'Standard';

  @override
  String get imageSelected => 'Bilde valgt';

  @override
  String get noImage => 'Ingen bilde';

  @override
  String get color => 'Farge';

  @override
  String get image => 'Bilde';

  @override
  String get tapToSelectImage => 'Trykk for å velge et bilde';

  @override
  String get changeImage => 'Bytt bilde';

  @override
  String get previewMessageReceived => 'Hei!';

  @override
  String get previewMessageSent => 'Hei der!';

  @override
  String get messageAction => 'Melding';

  @override
  String get callAction => 'Ring';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Personlige notater';

  @override
  String get addNotes => 'Legg til notater...';

  @override
  String get noNotes => 'Ingen notater';

  @override
  String get messageNotifications => 'Meldingsvarsler';

  @override
  String get callNotifications => 'Samtalevarsler';

  @override
  String get useGradient => 'Bruk gradient';

  @override
  String get gradientStart => 'Startfarge';

  @override
  String get gradientEnd => 'Sluttfarge';

  @override
  String get preview => 'Forhåndsvisning';

  @override
  String get reset => 'Tilbakestill';

  @override
  String get securityNumber => 'Sikkerhetsnummer';

  @override
  String securityNumberDescription(String name) {
    return 'Bekreft at sikkerhetsnummeret stemmer med enheten til $name';
  }

  @override
  String get verifyEncryption => 'Verifiser ende-til-ende-kryptering';

  @override
  String get tapToCopy => 'Trykk for å kopiere';

  @override
  String get howToVerify => 'Hvordan verifisere';

  @override
  String get verifyStep1 => 'Møt kontakten din personlig eller ring dem';

  @override
  String get verifyStep2 => 'Sammenlign sikkerhetsnumrene eller skann QR-koder';

  @override
  String get verifyStep3 => 'Hvis de stemmer, er chatten din sikker';

  @override
  String get scanToVerify => 'Skann for å verifisere';

  @override
  String get reportSpam => 'Rapporter som spam';

  @override
  String get reportSpamSubtitle => 'Rapporter denne kontakten som spam';

  @override
  String get reportSpamDescription =>
      'Denne kontakten rapporteres anonymt. Din identitet deles ikke. Er du sikker?';

  @override
  String get report => 'Rapporter';

  @override
  String get spamReported => 'Spam rapportert';

  @override
  String get reportError => 'Kunne ikke sende rapport. Vennligst prøv igjen.';

  @override
  String get reportRateLimited =>
      'Du har nådd maksimalt antall rapporter for i dag.';

  @override
  String get blockContact => 'Blokker kontakt';

  @override
  String get blockContactDescription =>
      'Denne kontakten vil ikke lenger kunne sende deg meldinger eller ringe deg. De vil ikke bli varslet.';

  @override
  String get unblockContact => 'Opphev blokkering';

  @override
  String get unblockContactDescription =>
      'Denne kontakten vil igjen kunne sende deg meldinger og ringe deg.';

  @override
  String get contactBlocked => 'Kontakt blokkert';

  @override
  String get contactUnblocked => 'Blokkering opphevet';

  @override
  String get contactIsBlocked => 'Denne kontakten er blokkert';

  @override
  String get unblock => 'Opphev blokkering';

  @override
  String get deleteContactSubtitle => 'Slett denne kontakten og chatten';

  @override
  String get confirmWithPin => 'Bekreft med PIN';

  @override
  String get enterPinToConfirm =>
      'Tast inn PIN-koden din for å bekrefte denne handlingen';

  @override
  String get profilePhoto => 'Profilbilde';

  @override
  String get takePhoto => 'Ta et bilde';

  @override
  String get chooseFromGallery => 'Velg fra galleri';

  @override
  String get removePhoto => 'Fjern bilde';

  @override
  String get viewContactHashId => 'Vis kontaktens identifikator';

  @override
  String get hashIdPartiallyMasked =>
      'Delvis maskert for din sikkerhet og kontaktens personvern';

  @override
  String get addFirstContact => 'Legg til din første kontakt';

  @override
  String get addFirstContactSubtitle => 'Del QR-koden din eller skann en venns';

  @override
  String get directory => 'Katalog';

  @override
  String get noContacts => 'Ingen kontakter';

  @override
  String get noContactsSubtitle => 'Legg til en kontakt for å komme i gang';

  @override
  String get sendMessageAction => 'Send en melding';

  @override
  String get audioCall => 'Lydsamtale';

  @override
  String get videoCall => 'Videosamtale';

  @override
  String get viewProfile => 'Vis profil';

  @override
  String get deleteContactDirectory => 'Slett kontakt';

  @override
  String get scanShort => 'Skann';

  @override
  String get addShort => 'Legg til';

  @override
  String deleteContactConfirmName(String name) {
    return 'Er du sikker på at du vil slette $name?';
  }

  @override
  String get noNotesTitle => 'Ingen notater';

  @override
  String get noNotesSubtitle => 'Opprett ditt første notat';

  @override
  String get newNote => 'Nytt notat';

  @override
  String get editNote => 'Rediger notat';

  @override
  String get deleteNote => 'Slett notat';

  @override
  String get deleteNoteConfirm =>
      'Er du sikker på at du vil slette dette notatet?';

  @override
  String get noteTitle => 'Tittel';

  @override
  String get noteContent => 'Innhold';

  @override
  String get addItem => 'Legg til element';

  @override
  String get pinNote => 'Fest';

  @override
  String get unpinNote => 'Løsne';

  @override
  String get noteColor => 'Farge';

  @override
  String get notePassword => 'Passord';

  @override
  String get setPassword => 'Sett passord';

  @override
  String get changePassword => 'Endre passord';

  @override
  String get removePassword => 'Fjern passord';

  @override
  String get enterPassword => 'Skriv inn passord';

  @override
  String get confirmPassword => 'Bekreft passord';

  @override
  String get passwordPin => 'PIN-kode';

  @override
  String get passwordText => 'Tekstpassord';

  @override
  String get protectedNote => 'Beskyttet notat';

  @override
  String get incorrectPassword => 'Feil passord';

  @override
  String get passwordSet => 'Passord satt';

  @override
  String get passwordRemoved => 'Passord fjernet';

  @override
  String get notesBiometric => 'Face ID for notater';

  @override
  String get notesBiometricSubtitle =>
      'Krev biometrisk autentisering for å åpne beskyttede notater';

  @override
  String get textNote => 'Tekstnotat';

  @override
  String get checklistNote => 'Sjekkliste';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total oppgaver';
  }

  @override
  String get autoSaved => 'Lagret';

  @override
  String get searchNotes => 'Søk i notater';

  @override
  String get legalConsent => 'Juridisk samtykke';

  @override
  String get confirmAge13 => 'Jeg bekrefter at jeg er minst 13 år gammel';

  @override
  String get acceptLegalStart => 'Jeg godtar ';

  @override
  String get privacyPolicy => 'Personvernregler';

  @override
  String get termsOfService => 'Vilkår for bruk';

  @override
  String get andThe => ' og ';

  @override
  String get continueButton => 'Fortsett';

  @override
  String get mustAcceptTerms =>
      'Du må godta begge betingelsene for å fortsette';

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
  String get support => 'Støtte';

  @override
  String get contactSupport => 'Kontakt kundestøtte';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Rapporter misbruk';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Juridisk';

  @override
  String get legalEntity => 'Juridisk enhet';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fest';

  @override
  String get unpinConversation => 'Løsne';

  @override
  String get hideConversation => 'Fjern fra feed';

  @override
  String get deleteConversation => 'Slett samtale';

  @override
  String get deleteConversationConfirm =>
      'Tast inn PIN-koden din for å bekrefte sletting av alle meldinger';

  @override
  String get noConversations => 'Ingen samtaler ennå';

  @override
  String get startConversation => 'Start';

  @override
  String get microphonePermissionRequired => 'Mikrofontilgang kreves';

  @override
  String get microphonePermissionExplanation =>
      'Hash trenger mikrofonen for å ringe.';

  @override
  String get cameraPermissionExplanation =>
      'Hash trenger kameraet for videosamtaler.';

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
  String get openSettings => 'Åpne innstillinger';

  @override
  String get callConnecting => 'Kobler til...';

  @override
  String get callRinging => 'Ringer...';

  @override
  String get callReconnecting => 'Kobler til på nytt...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Kobler til på nytt (${seconds}s)';
  }

  @override
  String get callPaused => 'Satt på pause';

  @override
  String get callPausedSubtitle => 'Samtalen pågår fortsatt';

  @override
  String get callRemoteMicMuted => 'Kontaktens mikrofon er dempet';

  @override
  String get callMiniControlsMute => 'Demp';

  @override
  String get callMiniControlsUnmute => 'Slå på lyd';

  @override
  String get callMiniControlsHangUp => 'Legg på';

  @override
  String get callMiniControlsReturn => 'Tilbake til samtalen';

  @override
  String get callNetworkPoor => 'Ustabil tilkobling';

  @override
  String get callNetworkLost => 'Tilkobling tapt';

  @override
  String get callEndedTitle => 'Samtale avsluttet';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Enhetsdata';

  @override
  String get deviceDataSubtitle => 'Lokal og serverlagring';

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
  String get localStorage => 'Lokal lagring';

  @override
  String get onThisDevice => 'på denne enheten';

  @override
  String get encryptedDatabases => 'Krypterte databaser';

  @override
  String get files => 'Filer';

  @override
  String get secureKeychain => 'Sikker nøkkelring';

  @override
  String get cache => 'Hurtigbuffer';

  @override
  String get contactsDetail => 'Navn, avatarer, Signal-nøkler';

  @override
  String get messagesDetail => 'Krypterte samtaler';

  @override
  String get notesDetail => 'Personlige notater';

  @override
  String get signalSessions => 'Signal-økter';

  @override
  String get signalSessionsDetail => 'Krypteringsøkter';

  @override
  String get pendingContacts => 'Ventende kontakter';

  @override
  String get pendingContactsDetail => 'Ventende forespørsler';

  @override
  String get callHistory => 'Samtaler';

  @override
  String get callHistoryDetail => 'Samtalehistorikk';

  @override
  String get preferences => 'Preferanser';

  @override
  String get preferencesDetail => 'Medie- og samtalepreferanser';

  @override
  String get avatars => 'Avatarer';

  @override
  String get media => 'Medier';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
      zero: 'ingen filer',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktiv';

  @override
  String get notDefined => 'Ikke definert';

  @override
  String get biometrics => 'Biometri';

  @override
  String get recoveryPhrase => 'Gjenopprettingsfrase';

  @override
  String get identity => 'Identitet (Hash-ID)';

  @override
  String get signalKeys => 'Signal Protocol-nøkler';

  @override
  String get authTokens => 'Autentiseringstokens';

  @override
  String get contactNamesCache => 'Hurtigbuffer for kontaktnavn';

  @override
  String get remoteConfig => 'Fjernkonfigurasjon';

  @override
  String get notificationPrefs => 'Varselpreferanser';

  @override
  String get serverData => 'Serverdata';

  @override
  String get serverDataInfo =>
      'Hash lagrer minimalt med data på serveren, alt kryptert eller midlertidig.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail =>
      'Hash-ID, offentlige nøkler, postkassetoken';

  @override
  String get serverPrekeys => 'Forhåndsnøkler';

  @override
  String get serverPrekeysDetail => 'Engangsnøkler for Signal (brukt opp)';

  @override
  String get serverMessages => 'Meldinger under overføring';

  @override
  String get serverMessagesDetail => 'Slettes etter levering (maks 24t)';

  @override
  String get serverMedia => 'Medier under overføring';

  @override
  String get serverMediaDetail => 'Slettes etter nedlasting';

  @override
  String get serverContactRequests => 'Kontaktforespørsler';

  @override
  String get serverContactRequestsDetail => 'Utløper etter 24t';

  @override
  String get serverRateLimits => 'Hastighetsbegrensninger';

  @override
  String get serverRateLimitsDetail => 'Midlertidige anti-misbruk-data';

  @override
  String get privacyReassurance =>
      'Hash kan ikke lese meldingene dine. All data er ende-til-ende-kryptert. Serverdata slettes automatisk.';

  @override
  String get pinTooSimple =>
      'Denne PIN-koden er for enkel. Velg en mer sikker kode.';

  @override
  String get genericError => 'En feil oppstod. Vennligst prøv igjen.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Kunne ikke opprette konto: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frase kopiert til utklippstavle';

  @override
  String get copyPhrase => 'Kopier frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Skriv ned denne frasen på et trygt sted. Hvis du mister PIN-koden uten denne frasen, mister du permanent tilgangen til dataene dine.';

  @override
  String get noMessages => 'Ingen meldinger';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Slette alle meldinger med $name?';
  }

  @override
  String get confirmation => 'Bekreftelse';

  @override
  String get untitled => 'Uten tittel';

  @override
  String get noSessions => 'Ingen økter';

  @override
  String get unknownContact => 'Ukjent kontakt';

  @override
  String get unnamed => 'Uten navn';

  @override
  String get noPendingRequestsAlt => 'Ingen ventende forespørsler';

  @override
  String get deleteAllCallHistory => 'Slette all samtalehistorikk?';

  @override
  String get noCalls => 'Ingen samtaler';

  @override
  String get noPreferences => 'Ingen preferanser';

  @override
  String get resetAllMediaPrefs => 'Tilbakestille alle mediepreferanser?';

  @override
  String get deleteThisAvatar => 'Slette denne avataren?';

  @override
  String get deleteAllAvatars => 'Slette alle avatarer?';

  @override
  String get noAvatars => 'Ingen avatarer';

  @override
  String get deleteThisFile => 'Slette denne filen?';

  @override
  String get deleteAllMediaFiles => 'Slette alle medier?';

  @override
  String get noMediaFiles => 'Ingen medier';

  @override
  String get outgoing => 'Utgående';

  @override
  String get incoming => 'Innkommende';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Forsvinnende visning: ${seconds}s';
  }

  @override
  String get normalView => 'Normal visning';

  @override
  String get callReasonCompleted => 'Fullført';

  @override
  String get callReasonMissed => 'Ubesvart';

  @override
  String get callReasonDeclined => 'Avvist';

  @override
  String get callReasonFailed => 'Mislyktes';

  @override
  String get justNow => 'Akkurat nå';

  @override
  String timeAgoMinutes(int count) {
    return 'For $count min siden';
  }

  @override
  String timeAgoHours(int count) {
    return 'For ${count}t siden';
  }

  @override
  String timeAgoDays(int count) {
    return 'For ${count}d siden';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Posisjon';

  @override
  String get statusQueued => 'I kø';

  @override
  String get blockedBadge => 'Blokkert';

  @override
  String get protectedBadge => 'Beskyttet';

  @override
  String messageCount(int count) {
    return '$count melding(er)';
  }

  @override
  String get deleteQuestion => 'Slette?';

  @override
  String get transferMyAccountTitle => 'Overfør kontoen min';

  @override
  String get loadingError => 'Innlastingsfeil';

  @override
  String get transferToNewDevice => 'Overfør til en ny enhet';

  @override
  String get transferInstructions =>
      'Velg «Gjenopprett kontoen min» på den nye enheten din og skriv inn denne informasjonen:';

  @override
  String get yourHashIdLabel => 'Din Hash-ID';

  @override
  String get enterYourPinCode => 'Tast inn PIN-koden din';

  @override
  String get pinOwnerConfirmation =>
      'For å bekrefte at du er eieren av denne kontoen';

  @override
  String get scanThisQrCode => 'Skann denne QR-koden';

  @override
  String get withYourNewDevice => 'Med den nye enheten din';

  @override
  String get orEnterTheCode => 'eller tast inn koden';

  @override
  String get transferCodeLabel => 'Overføringskode';

  @override
  String get proximityVerification => 'Nærhetverifisering';

  @override
  String get bringDevicesCloser => 'Hold begge enhetene nærmere hverandre';

  @override
  String get confirmTransferQuestion => 'Bekreft overføringen?';

  @override
  String get accountWillBeTransferred =>
      'Kontoen din overføres til den nye enheten.\n\nDenne enheten kobles permanent fra.';

  @override
  String get transferComplete => 'Overføring fullført';

  @override
  String get transferSuccessMessage =>
      'Kontoen din er overført.\n\nDenne applikasjonen lukkes nå.';

  @override
  String get manualVerification => 'Manuell verifisering';

  @override
  String get codeDisplayedOnBothDevices => 'Kode vist på begge enheter:';

  @override
  String get doesCodeMatchNewDevice =>
      'Stemmer denne koden med den på den nye enheten?';

  @override
  String get verifiedStatus => 'Verifisert';

  @override
  String get inProgressStatus => 'Pågår...';

  @override
  String get notAvailableStatus => 'Ikke tilgjengelig';

  @override
  String get codeExpiredRestart => 'Koden har utløpt. Vennligst start på nytt.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kodene stemmer ikke overens. Overføring avbrutt.';

  @override
  String transferToDevice(String device) {
    return 'Til: $device';
  }

  @override
  String get copiedExclamation => 'Kopiert!';

  @override
  String expiresInTime(String time) {
    return 'Utløper om $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometri er ikke tilgjengelig på denne enheten';

  @override
  String get biometricAuthError => 'Feil under biometrisk autentisering';

  @override
  String get authenticateForBiometric =>
      'Vennligst autentiser for å aktivere biometri';

  @override
  String get biometricAuthFailed => 'Biometrisk autentisering mislyktes';

  @override
  String get forceUpdateTitle => 'Oppdatering kreves';

  @override
  String get forceUpdateMessage =>
      'En ny versjon av Hash er tilgjengelig. Vennligst oppdater for å fortsette.';

  @override
  String get updateButton => 'Oppdater';

  @override
  String get maintenanceInProgress => 'Vedlikehold pågår';

  @override
  String get tryAgainLater => 'Vennligst prøv igjen senere';

  @override
  String get information => 'Informasjon';

  @override
  String get later => 'Senere';

  @override
  String get doYouLikeHash => 'Liker du Hash?';

  @override
  String get yourFeedbackHelps =>
      'Din tilbakemelding hjelper oss med å forbedre appen';

  @override
  String get ratingTerrible => 'Forferdelig';

  @override
  String get ratingBad => 'Dårlig';

  @override
  String get ratingOk => 'Greit';

  @override
  String get ratingGood => 'Bra';

  @override
  String get ratingExcellent => 'Utmerket!';

  @override
  String get donationMessage =>
      'Hash er et ideelt prosjekt. Din støtte hjelper oss med å fortsette å bygge en virkelig privat meldingstjeneste.';

  @override
  String get recentConnections => 'Nylige tilkoblinger';

  @override
  String get loginInfoText =>
      'Hver PIN-opplåsing registreres lokalt. Kun de siste 24 timene lagres.';

  @override
  String get connectionCount => 'Tilkobling(er)';

  @override
  String get periodLabel => 'Periode';

  @override
  String get historyLabel => 'Historikk';

  @override
  String get noLoginRecorded => 'Ingen innlogging registrert';

  @override
  String get nextUnlocksAppearHere => 'Neste opplåsinger vil vises her.';

  @override
  String get dataLocalOnly =>
      'Disse dataene lagres kun på enheten din og overføres aldri.';

  @override
  String get currentSession => 'Nåværende';

  @override
  String get todayLabel => 'I dag';

  @override
  String get yesterdayLabel => 'I går';

  @override
  String get justNowLabel => 'Akkurat nå';

  @override
  String minutesAgoLabel(int count) {
    return 'For $count min siden';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'For ${hours}t siden';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'For ${hours}t ${minutes}min siden';
  }

  @override
  String get noMaintenancePlanned => 'Ingen planlagt vedlikehold';

  @override
  String get everythingWorkingNormally => 'Alt fungerer normalt';

  @override
  String get maintenanceTitle => 'Vedlikehold';

  @override
  String get maintenanceActiveLabel => 'PÅGÅR';

  @override
  String get maintenancePlannedLabel => 'PLANLAGT';

  @override
  String get locking => 'Låser...';

  @override
  String get newMessageNotification => 'Ny melding';

  @override
  String get secExplainTitle => 'Hvordan Hash beskytter deg';

  @override
  String get secExplainIntro =>
      'Hash er designet slik at ingen kan lese meldingene dine.';

  @override
  String get secExplainIntroSub =>
      'Ikke engang oss.\nSlik fungerer det, enkelt forklart.';

  @override
  String get secJourneyLabel => 'REISEN';

  @override
  String get secJourneyTitle => 'Meldingen din sin reise';

  @override
  String get secJourneySubtitle =>
      'Fra fingeren din til kontaktens skjerm er hvert steg beskyttet. Følg stien.';

  @override
  String get secStep1Title => 'Du skriver meldingen din';

  @override
  String get secStep1Desc =>
      'Du skriver «Hei!» i appen. Nå eksisterer meldingen bare i telefonens minne. Ingenting er sendt.';

  @override
  String get secStep2Title => 'Kryptering med Signal Protocol';

  @override
  String get secStep2Desc =>
      'Så snart du trykker «Send», forvandles meldingen din til en rekke uforståelige tegn. Det er som om meldingen din er låst i en safe som bare kontakten din har nøkkelen til.';

  @override
  String get secStep3Title => 'Sealed Sender: den usynlige konvolutten';

  @override
  String get secStep3Desc =>
      'Se for deg at du sender et brev i posten, men uten avsenderadresse på konvolutten. Det er akkurat det Hash gjør. Meldingen legges i en anonym postkasse. Serveren vet ikke hvem som sendte den.';

  @override
  String get secStep4Title => 'Serveren ser ingenting';

  @override
  String get secStep4Desc =>
      'Serveren fungerer som en blind postmann. Den vet bare at «noen la noe i postkasse #A7X9». Den vet ikke hvem som sendte det, hva det er, eller hvem det er til.';

  @override
  String get secStep4Highlight =>
      'Ingen metadata lagres: ingen IP-adresse, ingen tidsstempel, ingen kobling mellom avsender og mottaker.';

  @override
  String get secStep5Title => 'Kontakten din mottar meldingen';

  @override
  String get secStep5Desc =>
      'Kontaktens telefon henter innholdet fra den anonyme postkassen og dekrypterer meldingen med sin private nøkkel, som aldri har forlatt enheten. «Hei!» vises på skjermen.';

  @override
  String get secStep6Title => 'Meldingen forsvinner fra serveren';

  @override
  String get secStep6Desc =>
      'Så snart kontakten din bekrefter mottak, sletter serveren meldingen permanent. Ingen papirkurv, ingen arkiv, ingen sikkerhetskopi. Selv uleste meldinger ødelegges automatisk etter 24 timer.';

  @override
  String get secStep7Title => 'Lokal utløp';

  @override
  String get secStep7Desc =>
      'På kontaktens telefon selvdestruerer meldingen i henhold til varigheten du valgte: umiddelbart etter lesing, 5 minutter, 1 time... du bestemmer.';

  @override
  String get secJourneyConclusion =>
      'Resultat: null spor på serveren, null spor på enhetene. Meldingen eksisterte bare lenge nok til å bli lest, deretter forsvant den.';

  @override
  String get secArchLabel => 'ARKITEKTUR';

  @override
  String get secArchTitle => '5 lag med beskyttelse';

  @override
  String get secArchSubtitle =>
      'Hash baserer seg ikke på én enkelt teknologi. Hvert lag forsterker de andre. Selv om ett lag kompromitteres, forblir dataene dine trygge.';

  @override
  String get secLayer1Title => 'Ende-til-ende-kryptering';

  @override
  String get secLayer1Desc =>
      'Hver melding krypteres med en unik nøkkel. Enkelt sagt: selv om noen dekrypterer én melding, kan de ikke dekryptere den neste. Hver melding har sin egen lås.';

  @override
  String get secLayer1Detail =>
      'For filer (bilder, videoer, dokumenter) bruker Hash ekstra AES-256-GCM-kryptering. Filen krypteres før den forlater telefonen din.';

  @override
  String get secLayer2Title => 'Sealed Sender (nettverksanonymitet)';

  @override
  String get secLayer2Desc =>
      'Vanlige meldingstjenester sender meldingene dine med identiteten din vedlagt. Det er som å skrive navnet ditt på konvolutten. Hash bruker anonyme postkasser: serveren leverer meldingen uten å vite hvem som sendte den.';

  @override
  String get secLayer2Detail =>
      'Resultat: selv ved en serverdatalekkasje er det umulig å rekonstruere hvem som snakker med hvem.';

  @override
  String get secLayer3Title => 'Automatisk sletting';

  @override
  String get secLayer3Desc =>
      'Meldinger slettes fra serveren så snart mottak er bekreftet. Selv om en melding aldri hentes, ødelegges den automatisk etter 24 timer.';

  @override
  String get secLayer3Detail =>
      'På telefonen din selvdestruerer meldinger i henhold til varigheten du velger: umiddelbart, 5 min, 15 min, 30 min, 1t, 3t, 6t eller 12t.';

  @override
  String get secLayer4Title => 'Lokal tilgangsbeskyttelse';

  @override
  String get secLayer4Desc =>
      'Appen er beskyttet med en 6-sifret PIN-kode og/eller biometri (Face ID, fingeravtrykk). Etter for mange mislykkede forsøk låses appen med en økende forsinkelse etter hvert feil.';

  @override
  String get secLayer5Title => 'Låst database';

  @override
  String get secLayer5Desc =>
      'På serversiden kan ingen bruker skrive direkte til databasen. Alle handlinger går gjennom sikre funksjoner som verifiserer hver forespørsel.';

  @override
  String get secLayer5Detail =>
      'Det er som en bankskranke: du rører aldri hvelvet selv. Du sender en forespørsel, og systemet sjekker at du har rettigheten før det handler.';

  @override
  String get secVashLabel => 'UNIKT I VERDEN';

  @override
  String get secVashTitle => 'Vash-modus';

  @override
  String get secVashSubtitle =>
      'Et nødsikkerhetssystem som ikke finnes i noen annen meldingsapp.';

  @override
  String get secVashScenarioTitle => 'Se for deg denne situasjonen';

  @override
  String get secVashScenario1 => 'Noen får tilgang til telefonen din';

  @override
  String get secVashScenario2 => 'Du blir bedt om PIN-koden din';

  @override
  String get secVashScenario3 => 'Du vil slette alle dataene dine umiddelbart';

  @override
  String get secVashSolutionTitle => 'Løsningen: to PIN-koder';

  @override
  String get secVashSolutionDesc =>
      'Du konfigurerer to forskjellige PIN-koder i Hash:';

  @override
  String get secVashNormalCodeLabel => 'Normal kode';

  @override
  String get secVashNormalCodeDesc =>
      'Åpner appen normalt med alle dataene dine';

  @override
  String get secVashCodeLabel2 => 'Vash-kode';

  @override
  String get secVashCodeDescription =>
      'Åpner appen normalt... men alle dataene dine slettes stille i bakgrunnen';

  @override
  String get secVashWhatHappensTitle => 'Hva som skjer etterpå';

  @override
  String get secVashWhatHappensDesc =>
      'Appen åpnes normalt. Ingen varsel, ingen mistenkelig animasjon. Skjermen viser ganske enkelt en tom app, som om du nettopp installerte den.\n\nI virkeligheten har alle samtalene, kontaktene og meldingene dine blitt irreversibelt slettet på en brøkdel av et sekund.';

  @override
  String get secCallsLabel => 'SAMTALER & FILER';

  @override
  String get secCallsTitle => 'Alt er kryptert';

  @override
  String get secCallsSubtitle =>
      'Det er ikke bare meldinger. Absolutt alt som går gjennom Hash er ende-til-ende-kryptert.';

  @override
  String get secAudioCallTitle => 'Lydsamtaler';

  @override
  String get secAudioCallDesc =>
      'Ende-til-ende-kryptert via WebRTC. Tale overføres direkte mellom enheter.';

  @override
  String get secVideoCallTitle => 'Videosamtaler';

  @override
  String get secVideoCallDesc =>
      'Samme teknologi, hver strøm kryptert individuelt.';

  @override
  String get secPhotosTitle => 'Bilder og videoer';

  @override
  String get secPhotosDesc =>
      'Kryptert med AES-256-GCM før de forlater telefonen din.';

  @override
  String get secDocsTitle => 'Dokumenter';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, enhver fil. Navn, størrelse og innhold kryptert.';

  @override
  String get secAnonLabel => 'ANONYMITET';

  @override
  String get secAnonTitle => 'Ingen identitet kreves';

  @override
  String get secAnonSubtitle =>
      'Hash ber aldri om telefonnummeret eller e-posten din. Du identifiseres med en unik og anonym Hash-ID.';

  @override
  String get secHashIdTitle => 'Din Hash-ID';

  @override
  String get secHashIdDesc =>
      'Dette er din unike identifikator. Den avslører ingenting om deg: ikke navnet ditt, ikke nummeret ditt, ikke posisjonen din. Det er som et pseudonym som er umulig å knytte til din virkelige identitet.\n\nFor å legge til en kontakt deler du Hash-ID-en din eller skanner en QR-kode. Det er alt. Ingen synkronisert adressebok, ingen «Personer du kanskje kjenner»-forslag.';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => 'Hva Hash ikke vet';

  @override
  String get secDataSubtitle =>
      'Den beste måten å beskytte dataene dine på er å ikke samle dem inn.';

  @override
  String get secNeverCollected => 'Aldri samlet inn';

  @override
  String get secNeverItem1 => 'Meldingsinnhold';

  @override
  String get secNeverItem2 => 'Kontaktliste';

  @override
  String get secNeverItem3 => 'Telefonnummer';

  @override
  String get secNeverItem4 => 'E-postadresse';

  @override
  String get secNeverItem5 => 'IP-adresse';

  @override
  String get secNeverItem6 => 'Posisjon';

  @override
  String get secNeverItem7 => 'Metadata (hvem snakker med hvem)';

  @override
  String get secNeverItem8 => 'Samtalehistorikk';

  @override
  String get secNeverItem9 => 'Adressebok';

  @override
  String get secNeverItem10 => 'Reklameidentifikatorer';

  @override
  String get secTempStored => 'Lagret midlertidig';

  @override
  String get secTempItem1 => 'Anonym Hash-ID (unik identifikator)';

  @override
  String get secTempItem2 => 'Offentlige krypteringsnøkler';

  @override
  String get secTempItem3 => 'Krypterte meldinger under overføring (maks 24t)';

  @override
  String get secTempNote =>
      'Selv disse minimale dataene kan ikke identifisere deg. Hash-ID-en din er ikke knyttet til noen personlig informasjon.';

  @override
  String get secFooterTitle => 'Personvernet ditt, friheten din';

  @override
  String get secFooterDesc =>
      'Hash bruker de samme krypteringsteknologiene som de mest krevende profesjonelle applikasjonene. Meldingene dine er beskyttet av matematikk, ikke av løfter.';

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
