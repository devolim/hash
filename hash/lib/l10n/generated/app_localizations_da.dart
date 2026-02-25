// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Nul spor. Nul kompromis.';

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
  String get conversations => 'Chats';

  @override
  String get contacts => 'Kontakter';

  @override
  String get noConversation => 'Ingen chats';

  @override
  String get noConversationSubtitle =>
      'Tilføj en kontakt for at begynde at chatte sikkert';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ventende anmodninger',
      one: '1 ventende anmodning',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sendte anmodninger afventer',
      one: '1 sendt anmodning afventer',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Tilføj kontakt';

  @override
  String get shareApp => 'Del appen';

  @override
  String get newMessage => 'Ny besked';

  @override
  String get newConversation => 'Send en besked';

  @override
  String get settings => 'Indstillinger';

  @override
  String get myHashId => 'Mit Hash-ID';

  @override
  String get supportHash => 'Støt Hash';

  @override
  String get supportHashSubtitle => 'Hash er et non-profit projekt';

  @override
  String get donate => 'Doner';

  @override
  String get appearance => 'Udseende';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatisk';

  @override
  String get themeAutoSubtitle => 'Følger systemindstillinger';

  @override
  String get themeDark => 'Mørk';

  @override
  String get themeLight => 'Lys';

  @override
  String get themeRecommendation => 'Mørkt tema anbefales for bedre privatliv';

  @override
  String get language => 'Sprog';

  @override
  String get languageAuto => 'Automatisk (system)';

  @override
  String get notifications => 'Notifikationer';

  @override
  String get messages => 'Beskeder';

  @override
  String get calls => 'Opkald';

  @override
  String get vibration => 'Vibration';

  @override
  String get notificationContent => 'Notifikationsindhold';

  @override
  String get notificationContentFull => 'Vis alt';

  @override
  String get notificationContentFullDesc =>
      'Kontaktnavn og beskedforhåndsvisning';

  @override
  String get notificationContentName => 'Kun navn';

  @override
  String get notificationContentNameDesc => 'Viser kun kontaktnavnet';

  @override
  String get notificationContentDiscrete => 'Diskret';

  @override
  String get notificationContentDiscreteDesc => 'Viser kun \"Ny besked\"';

  @override
  String get security => 'Sikkerhed';

  @override
  String get howHashProtectsYou => 'Sådan beskytter Hash dig';

  @override
  String get howHashProtectsYouSubtitle => 'Forstå din sikkerhed';

  @override
  String get accountSecurity => 'Kontosikkerhed';

  @override
  String get accountSecuritySubtitle => 'PIN, biometri, Vash-tilstand';

  @override
  String get blockScreenshots => 'Bloker skærmbilleder';

  @override
  String get transferDevice => 'Overfør til en anden enhed';

  @override
  String get transferDeviceSubtitle => 'Migrer din konto';

  @override
  String get pinCode => 'PIN-kode';

  @override
  String get changePin => 'Ændre PIN-kode';

  @override
  String get currentPin => 'Nuværende PIN-kode';

  @override
  String get newPin => 'Ny PIN-kode';

  @override
  String get confirmPin => 'Bekræft PIN-kode';

  @override
  String get pinChanged => 'PIN-kode ændret';

  @override
  String get incorrectPin => 'Forkert PIN';

  @override
  String get pinsDoNotMatch => 'PIN-koderne stemmer ikke overens';

  @override
  String get autoLock => 'Automatisk lås';

  @override
  String get autoLockDelay => 'Låseforsinkelse';

  @override
  String get autoLockImmediate => 'Med det samme';

  @override
  String get autoLockMinute => '1 minut';

  @override
  String autoLockMinutes(int count) {
    return '$count minutter';
  }

  @override
  String get vashCode => 'Vash-kode';

  @override
  String get vashModeTitle => 'Vash-tilstand';

  @override
  String get vashModeExplanation => 'Dit ultimative sikkerhedsnet.';

  @override
  String get vashModeDescription =>
      'Du vælger en anden PIN-kode. Hvis du nogensinde bliver tvunget til at åbne Hash, skal du indtaste denne kode i stedet for din normale PIN.\n\nAppen åbner normalt, men alle dine samtaler og kontakter vil være væk.\n\nFor enhver der ser på din skærm, ser Hash simpelthen tom ud — som om du aldrig har brugt den.';

  @override
  String get vashModeIrreversible =>
      'Denne handling er lydløs og irreversibel.';

  @override
  String get chooseVashCode => 'Vælg min Vash-kode';

  @override
  String get vashCodeInfo =>
      'En anden PIN-kode der åbner appen normalt, men tom.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Hvis du indtaster denne kode i stedet for din PIN:';

  @override
  String get vashDeleteContacts => 'Dine kontakter forsvinder';

  @override
  String get vashDeleteMessages => 'Dine samtaler forsvinder';

  @override
  String get vashDeleteHistory => 'Dine noter forsvinder';

  @override
  String get vashKeepId =>
      'Din Hash-identitet (#XXX-XXX-XXX) forbliver den samme';

  @override
  String get vashAppearNormal =>
      'Appen ser normal men tom ud, som ny. Denne handling er irreversibel.';

  @override
  String get setupVashCode => 'Opsæt Vash-kode';

  @override
  String get modifyVashCode => 'Ændre Vash-kode';

  @override
  String get currentVashCode => 'Nuværende Vash-kode';

  @override
  String get newVashCode => 'Ny Vash-kode';

  @override
  String get confirmVashCode => 'Bekræft Vash-kode';

  @override
  String get vashCodeConfigured => 'Vash-kode konfigureret';

  @override
  String get vashCodeModified => 'Vash-kode ændret';

  @override
  String get vashCodeMustDiffer =>
      'Vash-koden skal være forskellig fra PIN-koden';

  @override
  String get incorrectVashCode => 'Forkert Vash-kode';

  @override
  String get vashWhatToDelete => 'Hvad skal Vash-tilstand få til at forsvinde?';

  @override
  String get vashDeleteContactsOption => 'Kontakter';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Beskeder';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Noter';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash-tilstand aktiveret';

  @override
  String get vashCreateSubtitle =>
      'Vælg en kode der er forskellig fra din hoved-PIN';

  @override
  String get vashConfirmSubtitle => 'Bekræft din Vash-kode';

  @override
  String get pinCodeForEntry => 'PIN-kode for at åbne appen';

  @override
  String get vashCodeSection => 'Vash-tilstand';

  @override
  String get biometric => 'Biometri';

  @override
  String get biometricUnlock => 'Lås op med fingeraftryk eller Face ID';

  @override
  String get enableBiometric => 'Aktivér biometri';

  @override
  String get biometricWarningMessage =>
      'Ved at aktivere biometri kan du ikke bruge din Vash-kode til at åbne appen.\n\nDu kan kun bruge Vash-koden, hvis biometrien fejler (efter flere mislykkede forsøg).\n\nEr du sikker på, at du vil fortsætte?';

  @override
  String get understood => 'Forstået';

  @override
  String get shareAppSubtitle => 'Del Hash med dine nærmeste';

  @override
  String get share => 'Del';

  @override
  String get danger => 'Fare';

  @override
  String get deleteAccount => 'Slet min konto';

  @override
  String get deleteAccountSubtitle => 'Irreversibel handling';

  @override
  String get deleteAccountConfirmTitle => 'Slet min konto';

  @override
  String get deleteAccountConfirmMessage =>
      'Din konto vil blive permanent slettet. Denne handling er irreversibel.\n\n• Alle dine chats\n• Alle dine kontakter\n• Dit Hash-ID\n\nDu skal oprette en ny konto.';

  @override
  String get deleteForever => 'Slet permanent';

  @override
  String get cancel => 'Annuller';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash-tilstand aktiveret.';

  @override
  String deletionError(String error) {
    return 'Slettefejl: $error';
  }

  @override
  String get yourSecurity => 'Din sikkerhed';

  @override
  String get securityInfo =>
      '• End-to-end-kryptering (Signal Protocol)\n• Ingen data på vores servere efter levering\n• Nøgler opbevares kun på din enhed\n• PIN-kode sendes aldrig til serveren';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Velkommen';

  @override
  String get securityStatement1 => 'Dine beskeder er beskyttet.';

  @override
  String get securityStatement2 => 'End-to-end-kryptering.';

  @override
  String get securityStatement3 => 'Intet spor. Intet kompromis.';

  @override
  String get securityStatement4 => 'Dit privatliv er en rettighed.';

  @override
  String get accessBlocked => 'Adgang blokeret';

  @override
  String get tooManyAttempts => 'For mange forsøg. Prøv igen senere.';

  @override
  String get pleaseWait => 'Vent venligst';

  @override
  String get waitDelay => 'Vent venligst til forsinkelsen er ovre';

  @override
  String attemptCount(int current, int max) {
    return 'Forsøg $current af $max';
  }

  @override
  String retryIn(String time) {
    return 'Prøv igen om $time';
  }

  @override
  String get forgotPin => 'Glemt PIN? Brug gendannelsesfrase';

  @override
  String get useRecoveryPhrase => 'Brug gendannelsesfrase';

  @override
  String get recoveryWarningTitle => 'Advarsel';

  @override
  String get recoveryWarningMessage => 'Kontogendannelse vil:';

  @override
  String get recoveryDeleteAllMessages => 'Slette ALLE dine beskeder';

  @override
  String get recoveryWaitDelay => 'Kræve en ventetid på 1 time';

  @override
  String get recoveryKeepContacts => 'Beholde dine kontakter';

  @override
  String get recoveryIrreversible =>
      'Denne handling er irreversibel. Dine beskeder går permanent tabt.';

  @override
  String get iUnderstand => 'Jeg forstår';

  @override
  String get accountRecovery => 'Kontogendannelse';

  @override
  String get enterRecoveryPhrase =>
      'Indtast de 24 ord i din gendannelsesfrase, adskilt af mellemrum.';

  @override
  String get recoveryPhraseHint => 'ord1 ord2 ord3 ...';

  @override
  String get recover => 'Gendan';

  @override
  String get recoveryPhraseRequired => 'Indtast venligst din gendannelsesfrase';

  @override
  String get recoveryPhrase24Words => 'Frasen skal indeholde præcis 24 ord';

  @override
  String get incorrectRecoveryPhrase => 'Forkert gendannelsesfrase';

  @override
  String get recoveryInitError => 'Fejl ved initialisering af gendannelse';

  @override
  String get securityDelay => 'Sikkerhedsforsinkelse';

  @override
  String get securityDelayMessage =>
      'For din sikkerhed kræves en venteperiode, før du kan oprette en ny PIN.';

  @override
  String get timeRemaining => 'Tid tilbage';

  @override
  String get messagesDeletedForProtection =>
      'Dine beskeder er blevet slettet for din beskyttelse.';

  @override
  String get canCloseApp => 'Du kan lukke appen og komme tilbage senere.';

  @override
  String get onboardingTitle1 => 'Velkommen til Hash';

  @override
  String get onboardingSubtitle1 => 'Beskedtjenesten der ikke efterlader spor';

  @override
  String get onboardingTitle2 => 'Total kryptering';

  @override
  String get onboardingSubtitle2 =>
      'Dine beskeder er end-to-end-krypteret med Signal Protocol';

  @override
  String get onboardingTitle3 => 'Intet spor';

  @override
  String get onboardingSubtitle3 =>
      'Beskeder slettes fra serverne ved levering';

  @override
  String get onboardingTitle4 => 'Din sikkerhed';

  @override
  String get onboardingSubtitle4 =>
      'PIN-kode, Vash-tilstand og gendannelsesfrase';

  @override
  String get getStarted => 'Kom i gang';

  @override
  String get next => 'Næste';

  @override
  String get skip => 'Spring over';

  @override
  String get alreadyHaveAccount => 'Jeg har allerede en konto';

  @override
  String get transferMyAccount => 'Overfør min konto';

  @override
  String get createPin => 'Opret en PIN-kode';

  @override
  String get createPinSubtitle =>
      'Denne kode vil beskytte adgangen til din app';

  @override
  String get confirmYourPin => 'Bekræft din PIN-kode';

  @override
  String get confirmPinSubtitle => 'Indtast din PIN-kode igen';

  @override
  String get saveRecoveryPhrase => 'Gendannelsesfrase';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Skriv disse 24 ord ned i rækkefølge. De giver dig mulighed for at gendanne din konto, hvis du glemmer din PIN.';

  @override
  String get phraseWritten => 'Jeg har skrevet min frase ned';

  @override
  String get warningRecoveryPhrase =>
      'Hvis du mister denne frase og glemmer din PIN, mister du adgangen til din konto.';

  @override
  String get accountTransferred => 'Konto overført';

  @override
  String get accountTransferredMessage =>
      'Din konto er blevet overført til en anden enhed. Denne session er ikke længere gyldig.';

  @override
  String get accountTransferredInfo =>
      'Hvis du ikke har igangsat denne overførsel, kan din konto være blevet kompromitteret.';

  @override
  String get logout => 'Log ud';

  @override
  String get transferAccount => 'Overfør konto';

  @override
  String get transferAccountInfo =>
      'Overfør din Hash-konto til en ny enhed. Din nuværende session bliver ugyldig.';

  @override
  String get generateTransferCode => 'Generér overførselskode';

  @override
  String get transferCode => 'Overførselskode';

  @override
  String transferCodeExpires(int minutes) {
    return 'Denne kode udløber om $minutes minutter';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Indtast denne kode på din nye enhed for at overføre din konto.';

  @override
  String get generateNewCode => 'Generér ny kode';

  @override
  String get scanQrCode => 'Scan QR-kode';

  @override
  String get scanQrCodeSubtitle =>
      'Scan en kontakts QR-kode for at tilføje dem';

  @override
  String get qrCodeDetected => 'QR-kode registreret';

  @override
  String get invalidQrCode => 'Ugyldig QR-kode';

  @override
  String get cameraPermissionRequired => 'Kameratilladelse kræves';

  @override
  String get myQrCode => 'Min QR-kode';

  @override
  String get myQrCodeSubtitle =>
      'Del denne QR-kode, så dine kontakter kan tilføje dig';

  @override
  String get shareQrCode => 'Del';

  @override
  String get addContactTitle => 'Tilføj kontakt';

  @override
  String get addContactByHashId => 'Indtast din kontakts Hash-ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Søg';

  @override
  String get contactNotFound => 'Kontakt ikke fundet';

  @override
  String get contactAlreadyAdded => 'Denne kontakt er allerede på din liste';

  @override
  String get contactAdded => 'Kontakt tilføjet';

  @override
  String get myProfile => 'Min profil';

  @override
  String get myProfileSubtitle =>
      'Del disse oplysninger, så andre kan tilføje dig';

  @override
  String get temporaryCode => 'Midlertidig kode';

  @override
  String temporaryCodeExpires(String time) {
    return 'Udløber om $time';
  }

  @override
  String get codeExpired => 'Kode udløbet';

  @override
  String get generateNewCodeButton => 'Ny kode';

  @override
  String get copyHashId => 'Kopiér ID';

  @override
  String get copyCode => 'Kopiér kode';

  @override
  String get copiedToClipboard => 'Kopieret';

  @override
  String get showMyQrCode => 'Vis min QR-kode';

  @override
  String get orDivider => 'eller';

  @override
  String get openScanner => 'Åbn scanner';

  @override
  String get addManually => 'Tilføj manuelt';

  @override
  String get contactHashIdLabel => 'Kontaktens Hash-ID';

  @override
  String get temporaryCodeLabel => 'Midlertidig kode';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Bed din kontakt om at generere en kode fra deres profil';

  @override
  String get verifyAndAdd => 'Bekræft og tilføj';

  @override
  String get fillAllFields => 'Udfyld venligst alle felter';

  @override
  String get invalidHashIdFormat => 'Ugyldigt ID-format (f.eks.: 123-456-ABC)';

  @override
  String get userNotFound => 'Bruger ikke fundet';

  @override
  String get cannotAddYourself => 'Du kan ikke tilføje dig selv';

  @override
  String get invalidOrExpiredCode => 'Ugyldig eller udløbet midlertidig kode';

  @override
  String get contactFound => 'Kontakt fundet!';

  @override
  String get howToCallContact => 'Hvad vil du kalde dem?';

  @override
  String get contactNameHint => 'Kontaktnavn';

  @override
  String get addContactButton => 'Tilføj';

  @override
  String get contactDetails => 'Kontaktdetaljer';

  @override
  String get contactName => 'Kontaktnavn';

  @override
  String get contactHashId => 'Hash-ID';

  @override
  String addedOn(String date) {
    return 'Tilføjet den $date';
  }

  @override
  String get deleteContact => 'Slet kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Slet denne kontakt?';
  }

  @override
  String get deleteContactMessage => 'Dette vil også slette hele chatten.';

  @override
  String get delete => 'Slet';

  @override
  String get typeMessage => 'Skriv en besked...';

  @override
  String get messageSent => 'Sendt';

  @override
  String get messageDelivered => 'Leveret';

  @override
  String get messageRead => 'Læst';

  @override
  String get messageFailed => 'Kunne ikke sende';

  @override
  String get now => 'Nu';

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
      'Følg med mig på Hash! 🔒\n\nDet er en virkelig privat beskedtjeneste: total kryptering, ingen spor på servere og paniktilstand ved behov.\n\nDownload appen her 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Fejl';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Vis';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nej';

  @override
  String get save => 'Gem';

  @override
  String get edit => 'Rediger';

  @override
  String get close => 'Luk';

  @override
  String get confirm => 'Bekræft';

  @override
  String get loading => 'Indlæser...';

  @override
  String get retry => 'Prøv igen';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Ventende anmodninger';

  @override
  String get noPendingRequests => 'Ingen ventende anmodninger';

  @override
  String get pendingRequestsSubtitle => 'Disse personer vil tilføje dig';

  @override
  String requestFromUser(String hashId) {
    return 'Anmodning fra $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Udløber om $days dage';
  }

  @override
  String get acceptRequest => 'Accepter';

  @override
  String get rejectRequest => 'Afvis';

  @override
  String get requestAccepted => 'Anmodning accepteret';

  @override
  String get requestRejected => 'Anmodning afvist';

  @override
  String get requestSent => 'Anmodning sendt!';

  @override
  String get requestSentSubtitle =>
      'Din anmodning er sendt. Brugeren skal acceptere den, før I kan chatte.';

  @override
  String get requestAlreadyPending => 'En anmodning afventer allerede';

  @override
  String get requestAlreadySentByOther =>
      'Denne person har allerede sendt dig en anmodning';

  @override
  String get addByHashId => 'Tilføj med Hash-ID';

  @override
  String get addByHashIdSubtitle =>
      'Indtast kontaktens Hash-ID og midlertidige kode';

  @override
  String get enterTemporaryCode => 'Indtast den 6-cifrede kode';

  @override
  String get sendRequest => 'Send anmodning';

  @override
  String get acceptContactTitle => 'Accepter kontakt';

  @override
  String get acceptContactSubtitle => 'Du kan give dem et tilpasset navn';

  @override
  String get leaveEmptyForHashId => 'Lad være tom for at bruge Hash-ID';

  @override
  String get firstName => 'Fornavn';

  @override
  String get lastName => 'Efternavn';

  @override
  String get notes => 'Noter';

  @override
  String get notesHint => 'Personlige noter om denne kontakt';

  @override
  String get photoOptional => 'Foto (valgfrit)';

  @override
  String get contactNameOptional => 'Navn (valgfrit)';

  @override
  String get notesOptional => 'Noter (valgfrit)';

  @override
  String get storedLocally => 'Opbevares kun på din enhed';

  @override
  String get encryptedMessageLabel => 'Krypteret besked';

  @override
  String get identityMessageHint => 'Hvem er du? Hvordan kender I hinanden?';

  @override
  String get messageWillBeSentEncrypted =>
      'Denne besked vil blive krypteret og sendt til modtageren';

  @override
  String get sendRequestButton => 'Send anmodning';

  @override
  String get requestExpiresIn24h =>
      'Anmodningen udløber om 24 timer, hvis den ikke accepteres';

  @override
  String get theyAlreadySentYouRequest =>
      'Denne person har allerede sendt dig en anmodning';

  @override
  String get requests => 'Anmodninger';

  @override
  String get receivedRequests => 'Modtaget';

  @override
  String get sentRequests => 'Sendt';

  @override
  String get noSentRequests => 'Ingen sendte anmodninger';

  @override
  String get cancelRequest => 'Annuller';

  @override
  String get deleteRequest => 'Slet anmodning';

  @override
  String get requestCancelled => 'Anmodning annulleret';

  @override
  String sentTo(String hashId) {
    return 'Sendt til $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Udløber om $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Modtaget for $time siden';
  }

  @override
  String get messageFromRequester => 'Besked fra afsender';

  @override
  String get copy => 'Kopiér';

  @override
  String get messageInfo => 'Beskedinfo';

  @override
  String get messageDirection => 'Retning';

  @override
  String get messageSentByYou => 'Sendt af dig';

  @override
  String get messageReceived => 'Modtaget';

  @override
  String get messageSentAt => 'Sendt den';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Læst den';

  @override
  String get messageType => 'Type';

  @override
  String get messageSize => 'Størrelse';

  @override
  String get messageExpiresAt => 'Udløber den';

  @override
  String get messageEncrypted => 'End-to-end-krypteret';

  @override
  String get messageStatusSending => 'Sender...';

  @override
  String get messageStatusSent => 'Sendt';

  @override
  String get messageStatusDelivered => 'Leveret';

  @override
  String get messageStatusRead => 'Læst';

  @override
  String get messageStatusFailed => 'Fejlet';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Afventer levering';

  @override
  String get deletedFromServer => 'Slettet';

  @override
  String get messageTypeText => 'Tekst';

  @override
  String get messageTypeImage => 'Billede';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Stemme';

  @override
  String get messageTypeFile => 'Fil';

  @override
  String get indefinitely => 'På ubestemt tid';

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
  String get ephemeralMessages => 'Selvdestruerende beskeder';

  @override
  String get ephemeralMessagesDescription =>
      'Beskeder slettes automatisk efter denne tid';

  @override
  String get ephemeralImmediate => 'Med det samme (efter læsning)';

  @override
  String get ephemeralImmediateDesc => 'Slettes så snart de er læst';

  @override
  String get ephemeralMyPreference => 'Min præference';

  @override
  String get ephemeralMyPreferenceDesc => 'Brug global indstilling';

  @override
  String get ephemeralDefaultSetting => 'Beskedvarighed';

  @override
  String get ephemeralChooseDefault => 'Anbefalet';

  @override
  String get ephemeral30Seconds => '30 sekunder';

  @override
  String get ephemeral30SecondsDesc => 'Slettes 30s efter læsning';

  @override
  String get ephemeral5Minutes => '5 minutter';

  @override
  String get ephemeral5MinutesDesc => 'Slettes 5min efter læsning';

  @override
  String get ephemeral1Hour => '1 time';

  @override
  String get ephemeral1HourDesc => 'Slettes 1t efter læsning';

  @override
  String get ephemeral3Hours => '3 timer';

  @override
  String get ephemeral6Hours => '6 timer';

  @override
  String get ephemeral6HoursDesc => 'Slettes 6t efter læsning';

  @override
  String get ephemeral12Hours => '12 timer';

  @override
  String get ephemeral24Hours => '24 timer';

  @override
  String get ephemeral24HoursDesc => 'Slettes 24t efter læsning';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Tilpasset varighed';

  @override
  String get howItWorks => 'Sådan virker det';

  @override
  String get ephemeralExplanation1 =>
      'Beskeder slettes fra serveren, så snart de er modtaget.';

  @override
  String get ephemeralExplanation2 =>
      'Denne indstilling bestemmer, hvornår beskeder forsvinder fra DIN telefon efter læsning.';

  @override
  String get ephemeralExplanation3 =>
      'Din kontakt har sin egen indstilling for sin telefon.';

  @override
  String get mute1Hour => '1 time';

  @override
  String get mute8Hours => '8 timer';

  @override
  String get mute1Day => '1 dag';

  @override
  String get mute1Week => '1 uge';

  @override
  String get muteAlways => 'Altid';

  @override
  String get muteExplanation =>
      'Du modtager ikke notifikationer for denne kontakt';

  @override
  String get showCallsInRecents => 'Vis i seneste opkald';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash-opkald vises i telefonens opkaldshistorik';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Slå notifikationer fra';

  @override
  String get muteDescription =>
      'Du modtager ikke notifikationer for denne kontakt';

  @override
  String mutedUntil(String time) {
    return 'Lydløs indtil $time';
  }

  @override
  String get notMuted => 'Notifikationer aktiveret';

  @override
  String get unmute => 'Slå til';

  @override
  String get notificationSound => 'Notifikationslyd';

  @override
  String get defaultSound => 'Standard';

  @override
  String get chatSettings => 'Chatindstillinger';

  @override
  String get bubbleColor => 'Boblens farve';

  @override
  String get backgroundColor => 'Baggrundsfarve';

  @override
  String get backgroundImage => 'Baggrundsbillede';

  @override
  String get chatBackground => 'Chatbaggrund';

  @override
  String get customColor => 'Tilpasset';

  @override
  String get defaultColor => 'Standard';

  @override
  String get imageSelected => 'Billede valgt';

  @override
  String get noImage => 'Intet billede';

  @override
  String get color => 'Farve';

  @override
  String get image => 'Billede';

  @override
  String get tapToSelectImage => 'Tryk for at vælge et billede';

  @override
  String get changeImage => 'Skift billede';

  @override
  String get previewMessageReceived => 'Hej!';

  @override
  String get previewMessageSent => 'Hejsa!';

  @override
  String get messageAction => 'Besked';

  @override
  String get callAction => 'Ring';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Personlige noter';

  @override
  String get addNotes => 'Tilføj noter...';

  @override
  String get noNotes => 'Ingen noter';

  @override
  String get messageNotifications => 'Beskednotifikationer';

  @override
  String get callNotifications => 'Opkaldsnotifikationer';

  @override
  String get useGradient => 'Brug gradient';

  @override
  String get gradientStart => 'Startfarve';

  @override
  String get gradientEnd => 'Slutfarve';

  @override
  String get preview => 'Forhåndsvisning';

  @override
  String get reset => 'Nulstil';

  @override
  String get securityNumber => 'Sikkerhedsnummer';

  @override
  String securityNumberDescription(String name) {
    return 'Bekræft at sikkerhedsnummeret stemmer overens med ${name}s enhed';
  }

  @override
  String get verifyEncryption => 'Bekræft end-to-end-kryptering';

  @override
  String get tapToCopy => 'Tryk for at kopiere';

  @override
  String get howToVerify => 'Sådan bekræfter du';

  @override
  String get verifyStep1 => 'Mød din kontakt personligt eller ring til dem';

  @override
  String get verifyStep2 => 'Sammenlign sikkerhedsnumrene eller scan QR-koder';

  @override
  String get verifyStep3 => 'Hvis de stemmer overens, er din chat sikker';

  @override
  String get scanToVerify => 'Scan for at bekræfte';

  @override
  String get reportSpam => 'Rapporter spam';

  @override
  String get reportSpamSubtitle => 'Rapporter denne kontakt som spam';

  @override
  String get reportSpamDescription =>
      'Denne kontakt vil blive rapporteret anonymt. Din identitet vil ikke blive delt. Er du sikker?';

  @override
  String get report => 'Rapporter';

  @override
  String get spamReported => 'Spam rapporteret';

  @override
  String get reportError => 'Kunne ikke sende rapport. Prøv venligst igen.';

  @override
  String get reportRateLimited =>
      'Du har nået det maksimale antal rapporter for i dag.';

  @override
  String get blockContact => 'Bloker kontakt';

  @override
  String get blockContactDescription =>
      'Denne kontakt vil ikke længere kunne sende dig beskeder eller ringe til dig. De bliver ikke underrettet.';

  @override
  String get unblockContact => 'Fjern blokering af kontakt';

  @override
  String get unblockContactDescription =>
      'Denne kontakt vil igen kunne sende dig beskeder og ringe til dig.';

  @override
  String get contactBlocked => 'Kontakt blokeret';

  @override
  String get contactUnblocked => 'Kontakt blokering fjernet';

  @override
  String get contactIsBlocked => 'Denne kontakt er blokeret';

  @override
  String get unblock => 'Fjern blokering';

  @override
  String get deleteContactSubtitle => 'Slet denne kontakt og chat';

  @override
  String get confirmWithPin => 'Bekræft med PIN';

  @override
  String get enterPinToConfirm =>
      'Indtast din PIN for at bekræfte denne handling';

  @override
  String get profilePhoto => 'Profilbillede';

  @override
  String get takePhoto => 'Tag et billede';

  @override
  String get chooseFromGallery => 'Vælg fra galleri';

  @override
  String get removePhoto => 'Fjern billede';

  @override
  String get viewContactHashId => 'Vis kontaktens identifikator';

  @override
  String get hashIdPartiallyMasked =>
      'Delvist maskeret for din sikkerhed og din kontakts privatliv';

  @override
  String get addFirstContact => 'Tilføj din første kontakt';

  @override
  String get addFirstContactSubtitle => 'Del din QR-kode eller scan en vens';

  @override
  String get directory => 'Telefonbog';

  @override
  String get noContacts => 'Ingen kontakter';

  @override
  String get noContactsSubtitle => 'Tilføj en kontakt for at komme i gang';

  @override
  String get sendMessageAction => 'Send en besked';

  @override
  String get audioCall => 'Lydopkald';

  @override
  String get videoCall => 'Videoopkald';

  @override
  String get viewProfile => 'Vis profil';

  @override
  String get deleteContactDirectory => 'Slet kontakt';

  @override
  String get scanShort => 'Scan';

  @override
  String get addShort => 'Tilføj';

  @override
  String deleteContactConfirmName(String name) {
    return 'Er du sikker på, at du vil slette $name?';
  }

  @override
  String get noNotesTitle => 'Ingen noter';

  @override
  String get noNotesSubtitle => 'Opret din første note';

  @override
  String get newNote => 'Ny note';

  @override
  String get editNote => 'Rediger note';

  @override
  String get deleteNote => 'Slet note';

  @override
  String get deleteNoteConfirm =>
      'Er du sikker på, at du vil slette denne note?';

  @override
  String get noteTitle => 'Titel';

  @override
  String get noteContent => 'Indhold';

  @override
  String get addItem => 'Tilføj element';

  @override
  String get pinNote => 'Fastgør';

  @override
  String get unpinNote => 'Frigiv';

  @override
  String get noteColor => 'Farve';

  @override
  String get notePassword => 'Adgangskode';

  @override
  String get setPassword => 'Indstil adgangskode';

  @override
  String get changePassword => 'Ændre adgangskode';

  @override
  String get removePassword => 'Fjern adgangskode';

  @override
  String get enterPassword => 'Indtast adgangskode';

  @override
  String get confirmPassword => 'Bekræft adgangskode';

  @override
  String get passwordPin => 'PIN-kode';

  @override
  String get passwordText => 'Tekstadgangskode';

  @override
  String get protectedNote => 'Beskyttet note';

  @override
  String get incorrectPassword => 'Forkert adgangskode';

  @override
  String get passwordSet => 'Adgangskode indstillet';

  @override
  String get passwordRemoved => 'Adgangskode fjernet';

  @override
  String get notesBiometric => 'Face ID til noter';

  @override
  String get notesBiometricSubtitle =>
      'Kræv biometrisk godkendelse for at åbne beskyttede noter';

  @override
  String get textNote => 'Tekstnote';

  @override
  String get checklistNote => 'Tjekliste';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total opgaver';
  }

  @override
  String get autoSaved => 'Gemt';

  @override
  String get searchNotes => 'Søg i noter';

  @override
  String get legalConsent => 'Juridisk samtykke';

  @override
  String get confirmAge13 => 'Jeg bekræfter, at jeg er mindst 13 år gammel';

  @override
  String get acceptLegalStart => 'Jeg accepterer ';

  @override
  String get privacyPolicy => 'Privatlivspolitikken';

  @override
  String get termsOfService => 'Servicevilkårene';

  @override
  String get andThe => ' og ';

  @override
  String get continueButton => 'Fortsæt';

  @override
  String get mustAcceptTerms =>
      'Du skal acceptere begge betingelser for at fortsætte';

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
  String get support => 'Support';

  @override
  String get contactSupport => 'Kontakt support';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Rapporter misbrug';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Juridisk';

  @override
  String get legalEntity => 'Juridisk enhed';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fastgør';

  @override
  String get unpinConversation => 'Frigiv';

  @override
  String get hideConversation => 'Fjern fra feed';

  @override
  String get deleteConversation => 'Slet samtale';

  @override
  String get deleteConversationConfirm =>
      'Indtast din PIN for at bekræfte sletning af alle beskeder';

  @override
  String get noConversations => 'Ingen samtaler endnu';

  @override
  String get startConversation => 'Start';

  @override
  String get microphonePermissionRequired => 'Mikrofontilladelse kræves';

  @override
  String get microphonePermissionExplanation =>
      'Hash har brug for mikrofonen for at foretage opkald.';

  @override
  String get cameraPermissionExplanation =>
      'Hash har brug for kameraet til videoopkald.';

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
  String get openSettings => 'Åbn indstillinger';

  @override
  String get callConnecting => 'Forbinder...';

  @override
  String get callRinging => 'Ringer...';

  @override
  String get callReconnecting => 'Genopretter forbindelse...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Genopretter forbindelse (${seconds}s)';
  }

  @override
  String get callPaused => 'Sat på pause';

  @override
  String get callPausedSubtitle => 'Opkaldet er stadig aktivt';

  @override
  String get callRemoteMicMuted => 'Kontaktens mikrofon er slået fra';

  @override
  String get callMiniControlsMute => 'Slå fra';

  @override
  String get callMiniControlsUnmute => 'Slå til';

  @override
  String get callMiniControlsHangUp => 'Læg på';

  @override
  String get callMiniControlsReturn => 'Tilbage til opkald';

  @override
  String get callNetworkPoor => 'Ustabil forbindelse';

  @override
  String get callNetworkLost => 'Forbindelse tabt';

  @override
  String get callEndedTitle => 'Opkald afsluttet';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Enhedsdata';

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
  String get onThisDevice => 'på denne enhed';

  @override
  String get encryptedDatabases => 'Krypterede databaser';

  @override
  String get files => 'Filer';

  @override
  String get secureKeychain => 'Sikker nøglering';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Navne, avatarer, Signal-nøgler';

  @override
  String get messagesDetail => 'Krypterede samtaler';

  @override
  String get notesDetail => 'Personlige noter';

  @override
  String get signalSessions => 'Signal-sessioner';

  @override
  String get signalSessionsDetail => 'Krypteringssessioner';

  @override
  String get pendingContacts => 'Ventende kontakter';

  @override
  String get pendingContactsDetail => 'Ventende anmodninger';

  @override
  String get callHistory => 'Opkald';

  @override
  String get callHistoryDetail => 'Opkaldshistorik';

  @override
  String get preferences => 'Præferencer';

  @override
  String get preferencesDetail => 'Medie- og opkaldspræferencer';

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
  String get notDefined => 'Ikke defineret';

  @override
  String get biometrics => 'Biometri';

  @override
  String get recoveryPhrase => 'Gendannelsesfrase';

  @override
  String get identity => 'Identitet (Hash-ID)';

  @override
  String get signalKeys => 'Signal Protocol-nøgler';

  @override
  String get authTokens => 'Godkendelsestokens';

  @override
  String get contactNamesCache => 'Cache for kontaktnavne';

  @override
  String get remoteConfig => 'Fjernkonfiguration';

  @override
  String get notificationPrefs => 'Notifikationspræferencer';

  @override
  String get serverData => 'Serverdata';

  @override
  String get serverDataInfo =>
      'Hash opbevarer minimale data på serveren, alle krypterede eller midlertidige.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail =>
      'Hash-ID, offentlige nøgler, postkassetoken';

  @override
  String get serverPrekeys => 'For-nøgler';

  @override
  String get serverPrekeysDetail => 'Engangs Signal-nøgler (brugt)';

  @override
  String get serverMessages => 'Beskeder under transport';

  @override
  String get serverMessagesDetail => 'Slettes efter levering (maks 24t)';

  @override
  String get serverMedia => 'Medier under transport';

  @override
  String get serverMediaDetail => 'Slettes efter download';

  @override
  String get serverContactRequests => 'Kontaktanmodninger';

  @override
  String get serverContactRequestsDetail => 'Udløber efter 24t';

  @override
  String get serverRateLimits => 'Hastighedsgrænser';

  @override
  String get serverRateLimitsDetail => 'Midlertidige anti-misbrugsdata';

  @override
  String get privacyReassurance =>
      'Hash kan ikke læse dine beskeder. Alle data er end-to-end-krypteret. Serverdata slettes automatisk.';

  @override
  String get pinTooSimple =>
      'Denne PIN-kode er for simpel. Vælg en mere sikker kode.';

  @override
  String get genericError => 'Der opstod en fejl. Prøv venligst igen.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Kan ikke oprette konto: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frase kopieret til udklipsholder';

  @override
  String get copyPhrase => 'Kopiér frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Skriv denne frase ned et sikkert sted. Hvis du mister din PIN uden denne frase, mister du permanent adgang til dine data.';

  @override
  String get noMessages => 'Ingen beskeder';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Slet alle beskeder med $name?';
  }

  @override
  String get confirmation => 'Bekræftelse';

  @override
  String get untitled => 'Uden titel';

  @override
  String get noSessions => 'Ingen sessioner';

  @override
  String get unknownContact => 'Ukendt kontakt';

  @override
  String get unnamed => 'Unavngivet';

  @override
  String get noPendingRequestsAlt => 'Ingen ventende anmodninger';

  @override
  String get deleteAllCallHistory => 'Slet al opkaldshistorik?';

  @override
  String get noCalls => 'Ingen opkald';

  @override
  String get noPreferences => 'Ingen præferencer';

  @override
  String get resetAllMediaPrefs => 'Nulstil alle mediepræferencer?';

  @override
  String get deleteThisAvatar => 'Slet denne avatar?';

  @override
  String get deleteAllAvatars => 'Slet alle avatarer?';

  @override
  String get noAvatars => 'Ingen avatarer';

  @override
  String get deleteThisFile => 'Slet denne fil?';

  @override
  String get deleteAllMediaFiles => 'Slet alle medier?';

  @override
  String get noMediaFiles => 'Ingen medier';

  @override
  String get outgoing => 'Udgående';

  @override
  String get incoming => 'Indgående';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Efemær visning: ${seconds}s';
  }

  @override
  String get normalView => 'Normal visning';

  @override
  String get callReasonCompleted => 'Afsluttet';

  @override
  String get callReasonMissed => 'Mistet';

  @override
  String get callReasonDeclined => 'Afvist';

  @override
  String get callReasonFailed => 'Fejlet';

  @override
  String get justNow => 'Lige nu';

  @override
  String timeAgoMinutes(int count) {
    return '$count min siden';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}t siden';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}d siden';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Placering';

  @override
  String get statusQueued => 'I kø';

  @override
  String get blockedBadge => 'Blokeret';

  @override
  String get protectedBadge => 'Beskyttet';

  @override
  String messageCount(int count) {
    return '$count besked(er)';
  }

  @override
  String get deleteQuestion => 'Slet?';

  @override
  String get transferMyAccountTitle => 'Overfør min konto';

  @override
  String get loadingError => 'Indlæsningsfejl';

  @override
  String get transferToNewDevice => 'Overfør til en ny enhed';

  @override
  String get transferInstructions =>
      'På din nye enhed skal du vælge \"Gendan min konto\" og indtaste disse oplysninger:';

  @override
  String get yourHashIdLabel => 'Dit Hash-ID';

  @override
  String get enterYourPinCode => 'Indtast din PIN-kode';

  @override
  String get pinOwnerConfirmation =>
      'For at bekræfte at du er ejer af denne konto';

  @override
  String get scanThisQrCode => 'Scan denne QR-kode';

  @override
  String get withYourNewDevice => 'Med din nye enhed';

  @override
  String get orEnterTheCode => 'eller indtast koden';

  @override
  String get transferCodeLabel => 'Overførselskode';

  @override
  String get proximityVerification => 'Nærhedsbekræftelse';

  @override
  String get bringDevicesCloser => 'Bring begge enheder tættere på hinanden';

  @override
  String get confirmTransferQuestion => 'Bekræft overførslen?';

  @override
  String get accountWillBeTransferred =>
      'Din konto vil blive overført til den nye enhed.\n\nDenne enhed vil permanent blive afbrudt.';

  @override
  String get transferComplete => 'Overførsel færdig';

  @override
  String get transferSuccessMessage =>
      'Din konto er blevet overført.\n\nDenne app lukker nu.';

  @override
  String get manualVerification => 'Manuel bekræftelse';

  @override
  String get codeDisplayedOnBothDevices => 'Kode vist på begge enheder:';

  @override
  String get doesCodeMatchNewDevice =>
      'Stemmer denne kode overens med den på den nye enhed?';

  @override
  String get verifiedStatus => 'Bekræftet';

  @override
  String get inProgressStatus => 'I gang...';

  @override
  String get notAvailableStatus => 'Ikke tilgængelig';

  @override
  String get codeExpiredRestart => 'Koden er udløbet. Start venligst forfra.';

  @override
  String get codesDoNotMatchCancelled =>
      'Koderne stemmer ikke overens. Overførsel annulleret.';

  @override
  String transferToDevice(String device) {
    return 'Til: $device';
  }

  @override
  String get copiedExclamation => 'Kopieret!';

  @override
  String expiresInTime(String time) {
    return 'Udløber om $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometri er ikke tilgængelig på denne enhed';

  @override
  String get biometricAuthError => 'Fejl under biometrisk godkendelse';

  @override
  String get authenticateForBiometric =>
      'Godkend venligst for at aktivere biometri';

  @override
  String get biometricAuthFailed => 'Biometrisk godkendelse mislykkedes';

  @override
  String get forceUpdateTitle => 'Opdatering kræves';

  @override
  String get forceUpdateMessage =>
      'En ny version af Hash er tilgængelig. Opdater venligst for at fortsætte.';

  @override
  String get updateButton => 'Opdater';

  @override
  String get maintenanceInProgress => 'Vedligeholdelse i gang';

  @override
  String get tryAgainLater => 'Prøv venligst igen senere';

  @override
  String get information => 'Information';

  @override
  String get later => 'Senere';

  @override
  String get doYouLikeHash => 'Kan du lide Hash?';

  @override
  String get yourFeedbackHelps =>
      'Din feedback hjælper os med at forbedre appen';

  @override
  String get ratingTerrible => 'Forfærdelig';

  @override
  String get ratingBad => 'Dårlig';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'God';

  @override
  String get ratingExcellent => 'Fremragende!';

  @override
  String get donationMessage =>
      'Hash er et non-profit projekt. Din støtte hjælper os med at blive ved med at bygge en virkelig privat beskedtjeneste.';

  @override
  String get recentConnections => 'Seneste forbindelser';

  @override
  String get loginInfoText =>
      'Hver PIN-oplåsning registreres lokalt. Kun de sidste 24 timer gemmes.';

  @override
  String get connectionCount => 'Forbindelse(r)';

  @override
  String get periodLabel => 'Periode';

  @override
  String get historyLabel => 'Historik';

  @override
  String get noLoginRecorded => 'Ingen login registreret';

  @override
  String get nextUnlocksAppearHere => 'Næste oplåsninger vises her.';

  @override
  String get dataLocalOnly =>
      'Disse data opbevares kun på din enhed og transmitteres aldrig.';

  @override
  String get currentSession => 'Nuværende';

  @override
  String get todayLabel => 'I dag';

  @override
  String get yesterdayLabel => 'I går';

  @override
  String get justNowLabel => 'Lige nu';

  @override
  String minutesAgoLabel(int count) {
    return '$count min siden';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}t siden';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}t ${minutes}min siden';
  }

  @override
  String get noMaintenancePlanned => 'Ingen vedligeholdelse planlagt';

  @override
  String get everythingWorkingNormally => 'Alt fungerer normalt';

  @override
  String get maintenanceTitle => 'Vedligeholdelse';

  @override
  String get maintenanceActiveLabel => 'I GANG';

  @override
  String get maintenancePlannedLabel => 'PLANLAGT';

  @override
  String get locking => 'Låser...';

  @override
  String get newMessageNotification => 'Ny besked';

  @override
  String get secExplainTitle => 'Sådan beskytter Hash dig';

  @override
  String get secExplainIntro =>
      'Hash er designet så ingen kan læse dine beskeder.';

  @override
  String get secExplainIntroSub =>
      'Ikke engang os.\nHer er hvordan det virker, forklaret enkelt.';

  @override
  String get secJourneyLabel => 'REJSEN';

  @override
  String get secJourneyTitle => 'Din beskeds rejse';

  @override
  String get secJourneySubtitle =>
      'Fra din finger til din kontakts skærm er hvert trin beskyttet. Følg vejen.';

  @override
  String get secStep1Title => 'Du skriver din besked';

  @override
  String get secStep1Desc =>
      'Du skriver \"Hej!\" i appen. På dette tidspunkt eksisterer beskeden kun i din telefons hukommelse. Intet er blevet sendt.';

  @override
  String get secStep2Title => 'Kryptering med Signal Protocol';

  @override
  String get secStep2Desc =>
      'Så snart du trykker \"Send\", omdannes din besked til en streng af uforståelige tegn. Det er som om din besked er låst i en boks, som kun din kontakt har nøglen til.';

  @override
  String get secStep3Title => 'Sealed Sender: den usynlige konvolut';

  @override
  String get secStep3Desc =>
      'Forestil dig at sende et brev med posten, men uden en afsenderadresse på konvolutten. Det er præcis hvad Hash gør. Beskeden lægges i en anonym postkasse. Serveren ved ikke, hvem der sendte den.';

  @override
  String get secStep4Title => 'Serveren ser intet';

  @override
  String get secStep4Desc =>
      'Serveren fungerer som en blind postbud. Den ved kun \"nogen lagde noget i postkasse #A7X9\". Den ved ikke, hvem der sendte det, hvad det er, eller hvem det er til.';

  @override
  String get secStep4Highlight =>
      'Ingen metadata gemt: ingen IP-adresse, intet tidsstempel, ingen forbindelse mellem afsender og modtager.';

  @override
  String get secStep5Title => 'Din kontakt modtager beskeden';

  @override
  String get secStep5Desc =>
      'Din kontakts telefon henter indholdet fra deres anonyme postkasse og dekrypterer beskeden med deres private nøgle, som aldrig har forladt deres enhed. \"Hej!\" vises på deres skærm.';

  @override
  String get secStep6Title => 'Beskeden forsvinder fra serveren';

  @override
  String get secStep6Desc =>
      'Så snart din kontakt bekræfter modtagelsen, sletter serveren permanent beskeden. Ingen papirkurv, intet arkiv, ingen backup. Selv ulæste beskeder ødelægges automatisk efter 24 timer.';

  @override
  String get secStep7Title => 'Lokal udløb';

  @override
  String get secStep7Desc =>
      'På din kontakts telefon selvdestruerer beskeden efter den varighed, du valgte: straks efter læsning, 5 minutter, 1 time... du bestemmer.';

  @override
  String get secJourneyConclusion =>
      'Resultat: nul spor på serveren, nul spor på enheder. Beskeden eksisterede kun længe nok til at blive læst, og så forsvandt den.';

  @override
  String get secArchLabel => 'ARKITEKTUR';

  @override
  String get secArchTitle => '5 lag af beskyttelse';

  @override
  String get secArchSubtitle =>
      'Hash er ikke afhængig af én enkelt teknologi. Hvert lag forstærker de andre. Selv hvis ét lag kompromitteres, forbliver dine data sikre.';

  @override
  String get secLayer1Title => 'End-to-end-kryptering';

  @override
  String get secLayer1Desc =>
      'Hver besked krypteres med en unik nøgle. Enkelt sagt: selv hvis nogen dekrypterer én besked, kan de ikke dekryptere den næste. Hver besked har sin egen lås.';

  @override
  String get secLayer1Detail =>
      'For filer (fotos, videoer, dokumenter) bruger Hash ekstra AES-256-GCM-kryptering. Filen krypteres, før den forlader din telefon.';

  @override
  String get secLayer2Title => 'Sealed Sender (netværksanonymitet)';

  @override
  String get secLayer2Desc =>
      'Almindelige beskedtjenester sender dine beskeder med din identitet vedhæftet. Det er som at skrive dit navn på konvolutten. Hash bruger anonyme postkasser: serveren leverer beskeden uden at vide, hvem der sendte den.';

  @override
  String get secLayer2Detail =>
      'Resultat: selv i tilfælde af et serverdatabrud er det umuligt at rekonstruere, hvem der taler med hvem.';

  @override
  String get secLayer3Title => 'Automatisk sletning';

  @override
  String get secLayer3Desc =>
      'Beskeder slettes fra serveren, så snart modtagelsen er bekræftet. Selv hvis en besked aldrig hentes, ødelægges den automatisk efter 24 timer.';

  @override
  String get secLayer3Detail =>
      'På din telefon selvdestruerer beskeder efter den varighed, du vælger: straks, 5 min, 15 min, 30 min, 1t, 3t, 6t eller 12t.';

  @override
  String get secLayer4Title => 'Lokal adgangsbeskyttelse';

  @override
  String get secLayer4Desc =>
      'Appen er beskyttet af en 6-cifret PIN-kode og/eller biometri (Face ID, fingeraftryk). Efter for mange mislykkede forsøg låser appen med en stigende forsinkelse efter hvert fejlslag.';

  @override
  String get secLayer5Title => 'Låst database';

  @override
  String get secLayer5Desc =>
      'På serversiden kan ingen bruger skrive direkte til databasen. Alle handlinger går gennem sikre funktioner, der verificerer hver anmodning.';

  @override
  String get secLayer5Detail =>
      'Det er som en bankskranke: du rører aldrig boksen selv. Du laver en anmodning, og systemet kontrollerer, at du har ret før det handler.';

  @override
  String get secVashLabel => 'UNIK I VERDEN';

  @override
  String get secVashTitle => 'Vash-tilstand';

  @override
  String get secVashSubtitle =>
      'Et nødsikkerhedssystem der ikke eksisterer i nogen anden beskedapp.';

  @override
  String get secVashScenarioTitle => 'Forestil dig denne situation';

  @override
  String get secVashScenario1 => 'Nogen får adgang til din telefon';

  @override
  String get secVashScenario2 => 'Du bliver bedt om din PIN-kode';

  @override
  String get secVashScenario3 => 'Du vil slette alle dine data med det samme';

  @override
  String get secVashSolutionTitle => 'Løsningen: to PIN-koder';

  @override
  String get secVashSolutionDesc =>
      'Du konfigurerer to forskellige PIN-koder i Hash:';

  @override
  String get secVashNormalCodeLabel => 'Normal kode';

  @override
  String get secVashNormalCodeDesc => 'Åbner appen normalt med alle dine data';

  @override
  String get secVashCodeLabel2 => 'Vash-kode';

  @override
  String get secVashCodeDescription =>
      'Åbner appen normalt... men alle dine data slettes lydløst i baggrunden';

  @override
  String get secVashWhatHappensTitle => 'Hvad der sker derefter';

  @override
  String get secVashWhatHappensDesc =>
      'Appen åbner normalt. Ingen alarm, ingen mistænkelig animation. Skærmen viser simpelthen en tom app, som om du lige har installeret den.\n\nI virkeligheden er alle dine samtaler, kontakter og beskeder blevet irreversibelt slettet på et brøkdel af et sekund.';

  @override
  String get secCallsLabel => 'OPKALD & FILER';

  @override
  String get secCallsTitle => 'Alt er krypteret';

  @override
  String get secCallsSubtitle =>
      'Det er ikke kun beskeder. Absolut alt der går gennem Hash er end-to-end-krypteret.';

  @override
  String get secAudioCallTitle => 'Lydopkald';

  @override
  String get secAudioCallDesc =>
      'End-to-end-krypteret via WebRTC. Stemme transmitteres direkte mellem enheder.';

  @override
  String get secVideoCallTitle => 'Videoopkald';

  @override
  String get secVideoCallDesc =>
      'Samme teknologi, hver strøm krypteret individuelt.';

  @override
  String get secPhotosTitle => 'Fotos & videoer';

  @override
  String get secPhotosDesc =>
      'Krypteret i AES-256-GCM før de forlader din telefon.';

  @override
  String get secDocsTitle => 'Dokumenter';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, enhver fil. Navn, størrelse og indhold krypteret.';

  @override
  String get secAnonLabel => 'ANONYMITET';

  @override
  String get secAnonTitle => 'Ingen identitet kræves';

  @override
  String get secAnonSubtitle =>
      'Hash beder aldrig om dit telefonnummer eller din email. Du identificeres med et unikt og anonymt Hash-ID.';

  @override
  String get secHashIdTitle => 'Dit Hash-ID';

  @override
  String get secHashIdDesc =>
      'Dette er din unikke identifikator. Den afslører intet om dig: ikke dit navn, ikke dit nummer, ikke din placering. Det er som et pseudonym der er umuligt at knytte til din rigtige identitet.\n\nFor at tilføje en kontakt deler du dit Hash-ID eller scanner en QR-kode. Det er det. Ingen synkroniseret adressebog, ingen \"Personer du måske kender\"-forslag.';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => 'Hvad Hash ikke ved';

  @override
  String get secDataSubtitle =>
      'Den bedste måde at beskytte dine data på er ikke at indsamle dem.';

  @override
  String get secNeverCollected => 'Aldrig indsamlet';

  @override
  String get secNeverItem1 => 'Beskedindhold';

  @override
  String get secNeverItem2 => 'Kontaktliste';

  @override
  String get secNeverItem3 => 'Telefonnummer';

  @override
  String get secNeverItem4 => 'Emailadresse';

  @override
  String get secNeverItem5 => 'IP-adresse';

  @override
  String get secNeverItem6 => 'Placering';

  @override
  String get secNeverItem7 => 'Metadata (hvem taler med hvem)';

  @override
  String get secNeverItem8 => 'Opkaldshistorik';

  @override
  String get secNeverItem9 => 'Adressebog';

  @override
  String get secNeverItem10 => 'Reklameidentifikatorer';

  @override
  String get secTempStored => 'Midlertidigt gemt';

  @override
  String get secTempItem1 => 'Anonymt Hash-ID (unik identifikator)';

  @override
  String get secTempItem2 => 'Offentlige krypteringsnøgler';

  @override
  String get secTempItem3 => 'Krypterede beskeder under transport (maks 24t)';

  @override
  String get secTempNote =>
      'Selv disse minimale data kan ikke identificere dig. Dit Hash-ID er ikke knyttet til nogen personlige oplysninger.';

  @override
  String get secFooterTitle => 'Dit privatliv, din frihed';

  @override
  String get secFooterDesc =>
      'Hash bruger de samme krypteringsteknologier som de mest krævende professionelle applikationer. Dine beskeder er beskyttet af matematik, ikke af løfter.';

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
