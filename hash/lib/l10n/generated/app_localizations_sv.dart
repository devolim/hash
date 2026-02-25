// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Inga spår. Inga kompromisser.';

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
  String get conversations => 'Chattar';

  @override
  String get contacts => 'Kontakter';

  @override
  String get noConversation => 'Inga chattar';

  @override
  String get noConversationSubtitle =>
      'Lägg till en kontakt för att börja chatta säkert';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count väntande förfrågningar',
      one: '1 väntande förfrågan',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skickade förfrågningar väntar',
      one: '1 skickad förfrågan väntar',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Lägg till kontakt';

  @override
  String get shareApp => 'Dela appen';

  @override
  String get newMessage => 'Nytt meddelande';

  @override
  String get newConversation => 'Skicka ett meddelande';

  @override
  String get settings => 'Inställningar';

  @override
  String get myHashId => 'Mitt Hash-ID';

  @override
  String get supportHash => 'Stöd Hash';

  @override
  String get supportHashSubtitle => 'Hash är ett ideellt projekt';

  @override
  String get donate => 'Donera';

  @override
  String get appearance => 'Utseende';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatiskt';

  @override
  String get themeAutoSubtitle => 'Följer systeminställningarna';

  @override
  String get themeDark => 'Mörkt';

  @override
  String get themeLight => 'Ljust';

  @override
  String get themeRecommendation =>
      'Mörkt tema rekommenderas för bättre integritet';

  @override
  String get language => 'Språk';

  @override
  String get languageAuto => 'Automatiskt (system)';

  @override
  String get notifications => 'Aviseringar';

  @override
  String get messages => 'Meddelanden';

  @override
  String get calls => 'Samtal';

  @override
  String get vibration => 'Vibration';

  @override
  String get notificationContent => 'Aviseringsinnehåll';

  @override
  String get notificationContentFull => 'Visa allt';

  @override
  String get notificationContentFullDesc =>
      'Kontaktnamn och meddelandeförhandsgranskning';

  @override
  String get notificationContentName => 'Endast namn';

  @override
  String get notificationContentNameDesc => 'Visar bara kontaktens namn';

  @override
  String get notificationContentDiscrete => 'Diskret';

  @override
  String get notificationContentDiscreteDesc =>
      'Visar bara \"Nytt meddelande\"';

  @override
  String get security => 'Säkerhet';

  @override
  String get howHashProtectsYou => 'Hur Hash skyddar dig';

  @override
  String get howHashProtectsYouSubtitle => 'Förstå din säkerhet';

  @override
  String get accountSecurity => 'Kontosäkerhet';

  @override
  String get accountSecuritySubtitle => 'PIN, biometri, Vash-läge';

  @override
  String get blockScreenshots => 'Blockera skärmdumpar';

  @override
  String get transferDevice => 'Överför till en annan enhet';

  @override
  String get transferDeviceSubtitle => 'Migrera ditt konto';

  @override
  String get pinCode => 'PIN-kod';

  @override
  String get changePin => 'Ändra PIN-kod';

  @override
  String get currentPin => 'Nuvarande PIN-kod';

  @override
  String get newPin => 'Ny PIN-kod';

  @override
  String get confirmPin => 'Bekräfta PIN-kod';

  @override
  String get pinChanged => 'PIN-kod ändrad';

  @override
  String get incorrectPin => 'Felaktig PIN';

  @override
  String get pinsDoNotMatch => 'PIN-koderna matchar inte';

  @override
  String get autoLock => 'Automatisk låsning';

  @override
  String get autoLockDelay => 'Låsfördröjning';

  @override
  String get autoLockImmediate => 'Omedelbar';

  @override
  String get autoLockMinute => '1 minut';

  @override
  String autoLockMinutes(int count) {
    return '$count minuter';
  }

  @override
  String get vashCode => 'Vash-kod';

  @override
  String get vashModeTitle => 'Vash-läge';

  @override
  String get vashModeExplanation => 'Ditt ultimata skyddsnät.';

  @override
  String get vashModeDescription =>
      'Du väljer en andra PIN-kod. Om du någonsin tvingas öppna Hash, ange denna kod istället för din vanliga PIN.\n\nAppen öppnas normalt, men alla dina konversationer och kontakter är borta.\n\nFör alla som tittar på din skärm ser Hash helt enkelt tom ut — som om du aldrig använt den.';

  @override
  String get vashModeIrreversible => 'Denna åtgärd är tyst och oåterkallelig.';

  @override
  String get chooseVashCode => 'Välj min Vash-kod';

  @override
  String get vashCodeInfo =>
      'En andra PIN-kod som öppnar appen normalt, men tom.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Om du anger denna kod istället för din PIN:';

  @override
  String get vashDeleteContacts => 'Dina kontakter försvinner';

  @override
  String get vashDeleteMessages => 'Dina konversationer försvinner';

  @override
  String get vashDeleteHistory => 'Dina anteckningar försvinner';

  @override
  String get vashKeepId => 'Din Hash-identitet (#XXX-XXX-XXX) förblir densamma';

  @override
  String get vashAppearNormal =>
      'Appen ser normal men tom ut, som ny. Denna åtgärd är oåterkallelig.';

  @override
  String get setupVashCode => 'Konfigurera Vash-kod';

  @override
  String get modifyVashCode => 'Ändra Vash-kod';

  @override
  String get currentVashCode => 'Nuvarande Vash-kod';

  @override
  String get newVashCode => 'Ny Vash-kod';

  @override
  String get confirmVashCode => 'Bekräfta Vash-kod';

  @override
  String get vashCodeConfigured => 'Vash-kod konfigurerad';

  @override
  String get vashCodeModified => 'Vash-kod ändrad';

  @override
  String get vashCodeMustDiffer => 'Vash-koden måste skilja sig från PIN';

  @override
  String get incorrectVashCode => 'Felaktig Vash-kod';

  @override
  String get vashWhatToDelete => 'Vad ska Vash-läget ta bort?';

  @override
  String get vashDeleteContactsOption => 'Kontakter';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Meddelanden';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Anteckningar';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash-läge aktiverat';

  @override
  String get vashCreateSubtitle =>
      'Välj en kod som skiljer sig från din huvud-PIN';

  @override
  String get vashConfirmSubtitle => 'Bekräfta din Vash-kod';

  @override
  String get pinCodeForEntry => 'PIN-kod för att komma in i appen';

  @override
  String get vashCodeSection => 'Vash-läge';

  @override
  String get biometric => 'Biometri';

  @override
  String get biometricUnlock => 'Lås upp med fingeravtryck eller Face ID';

  @override
  String get enableBiometric => 'Aktivera biometri';

  @override
  String get biometricWarningMessage =>
      'Genom att aktivera biometri kommer du inte att kunna använda din Vash-kod för att logga in i appen.\n\nDu kan bara använda Vash-koden om biometrin misslyckas (efter flera misslyckade försök).\n\nÄr du säker på att du vill fortsätta?';

  @override
  String get understood => 'Jag förstår';

  @override
  String get shareAppSubtitle => 'Dela Hash med dina nära och kära';

  @override
  String get share => 'Dela';

  @override
  String get danger => 'Fara';

  @override
  String get deleteAccount => 'Radera mitt konto';

  @override
  String get deleteAccountSubtitle => 'Oåterkallelig åtgärd';

  @override
  String get deleteAccountConfirmTitle => 'Radera mitt konto';

  @override
  String get deleteAccountConfirmMessage =>
      'Ditt konto kommer att raderas permanent. Denna åtgärd är oåterkallelig.\n\n• Alla dina chattar\n• Alla dina kontakter\n• Ditt Hash-ID\n\nDu behöver skapa ett nytt konto.';

  @override
  String get deleteForever => 'Radera permanent';

  @override
  String get cancel => 'Avbryt';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash-läge aktiverat.';

  @override
  String deletionError(String error) {
    return 'Raderingsfel: $error';
  }

  @override
  String get yourSecurity => 'Din säkerhet';

  @override
  String get securityInfo =>
      '• Ände-till-ände-kryptering (Signal Protocol)\n• Ingen data på våra servrar efter leverans\n• Nycklar lagras bara på din enhet\n• PIN-kod skickas aldrig till servern';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Välkommen';

  @override
  String get securityStatement1 => 'Dina meddelanden är skyddade.';

  @override
  String get securityStatement2 => 'Ände-till-ände-kryptering.';

  @override
  String get securityStatement3 => 'Inga spår. Inga kompromisser.';

  @override
  String get securityStatement4 => 'Din integritet är en rättighet.';

  @override
  String get accessBlocked => 'Åtkomst blockerad';

  @override
  String get tooManyAttempts => 'För många försök. Försök igen senare.';

  @override
  String get pleaseWait => 'Vänligen vänta';

  @override
  String get waitDelay => 'Vänligen vänta tills fördröjningen är slut';

  @override
  String attemptCount(int current, int max) {
    return 'Försök $current av $max';
  }

  @override
  String retryIn(String time) {
    return 'Försök igen om $time';
  }

  @override
  String get forgotPin => 'Glömt PIN? Använd återställningsfras';

  @override
  String get useRecoveryPhrase => 'Använd återställningsfras';

  @override
  String get recoveryWarningTitle => 'Varning';

  @override
  String get recoveryWarningMessage => 'Kontoåterställning kommer att:';

  @override
  String get recoveryDeleteAllMessages => 'Radera ALLA dina meddelanden';

  @override
  String get recoveryWaitDelay => 'Kräva 1 timmes väntetid';

  @override
  String get recoveryKeepContacts => 'Behålla dina kontakter';

  @override
  String get recoveryIrreversible =>
      'Denna åtgärd är oåterkallelig. Dina meddelanden går permanent förlorade.';

  @override
  String get iUnderstand => 'Jag förstår';

  @override
  String get accountRecovery => 'Kontoåterställning';

  @override
  String get enterRecoveryPhrase =>
      'Ange de 24 orden i din återställningsfras, separerade med mellanslag.';

  @override
  String get recoveryPhraseHint => 'ord1 ord2 ord3 ...';

  @override
  String get recover => 'Återställ';

  @override
  String get recoveryPhraseRequired => 'Ange din återställningsfras';

  @override
  String get recoveryPhrase24Words => 'Frasen måste innehålla exakt 24 ord';

  @override
  String get incorrectRecoveryPhrase => 'Felaktig återställningsfras';

  @override
  String get recoveryInitError => 'Fel vid initiering av återställning';

  @override
  String get securityDelay => 'Säkerhetsfördröjning';

  @override
  String get securityDelayMessage =>
      'För din säkerhet krävs en väntetid innan du kan skapa en ny PIN.';

  @override
  String get timeRemaining => 'Tid kvar';

  @override
  String get messagesDeletedForProtection =>
      'Dina meddelanden har raderats för ditt skydd.';

  @override
  String get canCloseApp => 'Du kan stänga appen och komma tillbaka senare.';

  @override
  String get onboardingTitle1 => 'Välkommen till Hash';

  @override
  String get onboardingSubtitle1 =>
      'Meddelandeappen som inte lämnar några spår';

  @override
  String get onboardingTitle2 => 'Total kryptering';

  @override
  String get onboardingSubtitle2 =>
      'Dina meddelanden är ände-till-ände-krypterade med Signal-protokollet';

  @override
  String get onboardingTitle3 => 'Inga spår';

  @override
  String get onboardingSubtitle3 =>
      'Meddelanden raderas från servrarna vid leverans';

  @override
  String get onboardingTitle4 => 'Din säkerhet';

  @override
  String get onboardingSubtitle4 => 'PIN-kod, Vash-läge och återställningsfras';

  @override
  String get getStarted => 'Kom igång';

  @override
  String get next => 'Nästa';

  @override
  String get skip => 'Hoppa över';

  @override
  String get alreadyHaveAccount => 'Jag har redan ett konto';

  @override
  String get transferMyAccount => 'Överför mitt konto';

  @override
  String get createPin => 'Skapa en PIN-kod';

  @override
  String get createPinSubtitle => 'Denna kod skyddar åtkomsten till din app';

  @override
  String get confirmYourPin => 'Bekräfta din PIN-kod';

  @override
  String get confirmPinSubtitle => 'Ange din PIN-kod igen';

  @override
  String get saveRecoveryPhrase => 'Återställningsfras';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Skriv ner dessa 24 ord i ordning. De låter dig återställa ditt konto om du glömmer din PIN.';

  @override
  String get phraseWritten => 'Jag har skrivit ner min fras';

  @override
  String get warningRecoveryPhrase =>
      'Om du förlorar denna fras och glömmer din PIN förlorar du åtkomsten till ditt konto.';

  @override
  String get accountTransferred => 'Konto överfört';

  @override
  String get accountTransferredMessage =>
      'Ditt konto har överförts till en annan enhet. Denna session är inte längre giltig.';

  @override
  String get accountTransferredInfo =>
      'Om du inte initierade denna överföring kan ditt konto ha komprometterats.';

  @override
  String get logout => 'Logga ut';

  @override
  String get transferAccount => 'Överför konto';

  @override
  String get transferAccountInfo =>
      'Överför ditt Hash-konto till en ny enhet. Din nuvarande session ogiltigförklaras.';

  @override
  String get generateTransferCode => 'Generera överföringskod';

  @override
  String get transferCode => 'Överföringskod';

  @override
  String transferCodeExpires(int minutes) {
    return 'Denna kod löper ut om $minutes minuter';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Ange denna kod på din nya enhet för att överföra ditt konto.';

  @override
  String get generateNewCode => 'Generera ny kod';

  @override
  String get scanQrCode => 'Skanna QR-kod';

  @override
  String get scanQrCodeSubtitle =>
      'Skanna en kontakts QR-kod för att lägga till dem';

  @override
  String get qrCodeDetected => 'QR-kod identifierad';

  @override
  String get invalidQrCode => 'Ogiltig QR-kod';

  @override
  String get cameraPermissionRequired => 'Kamerabehörighet krävs';

  @override
  String get myQrCode => 'Min QR-kod';

  @override
  String get myQrCodeSubtitle =>
      'Dela denna QR-kod så att dina kontakter kan lägga till dig';

  @override
  String get shareQrCode => 'Dela';

  @override
  String get addContactTitle => 'Lägg till kontakt';

  @override
  String get addContactByHashId => 'Ange din kontakts Hash-ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Sök';

  @override
  String get contactNotFound => 'Kontakt hittades inte';

  @override
  String get contactAlreadyAdded => 'Denna kontakt finns redan i din lista';

  @override
  String get contactAdded => 'Kontakt tillagd';

  @override
  String get myProfile => 'Min profil';

  @override
  String get myProfileSubtitle =>
      'Dela denna information så att andra kan lägga till dig';

  @override
  String get temporaryCode => 'Tillfällig kod';

  @override
  String temporaryCodeExpires(String time) {
    return 'Löper ut om $time';
  }

  @override
  String get codeExpired => 'Koden har löpt ut';

  @override
  String get generateNewCodeButton => 'Ny kod';

  @override
  String get copyHashId => 'Kopiera ID';

  @override
  String get copyCode => 'Kopiera kod';

  @override
  String get copiedToClipboard => 'Kopierat';

  @override
  String get showMyQrCode => 'Visa min QR-kod';

  @override
  String get orDivider => 'eller';

  @override
  String get openScanner => 'Öppna skanner';

  @override
  String get addManually => 'Lägg till manuellt';

  @override
  String get contactHashIdLabel => 'Kontaktens Hash-ID';

  @override
  String get temporaryCodeLabel => 'Tillfällig kod';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Be din kontakt att generera en kod från sin profil';

  @override
  String get verifyAndAdd => 'Verifiera och lägg till';

  @override
  String get fillAllFields => 'Fyll i alla fält';

  @override
  String get invalidHashIdFormat => 'Ogiltigt ID-format (t.ex.: 123-456-ABC)';

  @override
  String get userNotFound => 'Användaren hittades inte';

  @override
  String get cannotAddYourself => 'Du kan inte lägga till dig själv';

  @override
  String get invalidOrExpiredCode => 'Ogiltig eller utgången tillfällig kod';

  @override
  String get contactFound => 'Kontakt hittad!';

  @override
  String get howToCallContact => 'Vad vill du kalla dem?';

  @override
  String get contactNameHint => 'Kontaktnamn';

  @override
  String get addContactButton => 'Lägg till';

  @override
  String get contactDetails => 'Kontaktdetaljer';

  @override
  String get contactName => 'Kontaktnamn';

  @override
  String get contactHashId => 'Hash-ID';

  @override
  String addedOn(String date) {
    return 'Tillagd $date';
  }

  @override
  String get deleteContact => 'Radera kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Radera denna kontakt?';
  }

  @override
  String get deleteContactMessage => 'Detta raderar även hela chatten.';

  @override
  String get delete => 'Radera';

  @override
  String get typeMessage => 'Skriv ett meddelande...';

  @override
  String get messageSent => 'Skickat';

  @override
  String get messageDelivered => 'Levererat';

  @override
  String get messageRead => 'Läst';

  @override
  String get messageFailed => 'Kunde inte skicka';

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
  String get today => 'Idag';

  @override
  String get yesterday => 'Igår';

  @override
  String dateAtTime(String date, String time) {
    return '$date kl $time';
  }

  @override
  String get shareMessage =>
      'Kom med mig på Hash! 🔒\n\nDet är en verkligt privat meddelandeapp: total kryptering, inga spår på servrar och panikläge vid behov.\n\nLadda ner appen här 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Fel';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Visa';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nej';

  @override
  String get save => 'Spara';

  @override
  String get edit => 'Redigera';

  @override
  String get close => 'Stäng';

  @override
  String get confirm => 'Bekräfta';

  @override
  String get loading => 'Laddar...';

  @override
  String get retry => 'Försök igen';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Väntande förfrågningar';

  @override
  String get noPendingRequests => 'Inga väntande förfrågningar';

  @override
  String get pendingRequestsSubtitle => 'Dessa personer vill lägga till dig';

  @override
  String requestFromUser(String hashId) {
    return 'Förfrågan från $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Löper ut om $days dagar';
  }

  @override
  String get acceptRequest => 'Acceptera';

  @override
  String get rejectRequest => 'Avvisa';

  @override
  String get requestAccepted => 'Förfrågan accepterad';

  @override
  String get requestRejected => 'Förfrågan avvisad';

  @override
  String get requestSent => 'Förfrågan skickad!';

  @override
  String get requestSentSubtitle =>
      'Din förfrågan har skickats. Användaren måste acceptera den innan ni kan chatta.';

  @override
  String get requestAlreadyPending => 'En förfrågan väntar redan';

  @override
  String get requestAlreadySentByOther =>
      'Denna person har redan skickat dig en förfrågan';

  @override
  String get addByHashId => 'Lägg till via Hash-ID';

  @override
  String get addByHashIdSubtitle =>
      'Ange kontaktens Hash-ID och tillfälliga kod';

  @override
  String get enterTemporaryCode => 'Ange den 6-siffriga koden';

  @override
  String get sendRequest => 'Skicka förfrågan';

  @override
  String get acceptContactTitle => 'Acceptera kontakt';

  @override
  String get acceptContactSubtitle => 'Du kan ge dem ett eget namn';

  @override
  String get leaveEmptyForHashId => 'Lämna tomt för att använda Hash-ID';

  @override
  String get firstName => 'Förnamn';

  @override
  String get lastName => 'Efternamn';

  @override
  String get notes => 'Anteckningar';

  @override
  String get notesHint => 'Personliga anteckningar om denna kontakt';

  @override
  String get photoOptional => 'Foto (valfritt)';

  @override
  String get contactNameOptional => 'Namn (valfritt)';

  @override
  String get notesOptional => 'Anteckningar (valfritt)';

  @override
  String get storedLocally => 'Lagras bara på din enhet';

  @override
  String get encryptedMessageLabel => 'Krypterat meddelande';

  @override
  String get identityMessageHint => 'Vem är du? Hur känner ni varandra?';

  @override
  String get messageWillBeSentEncrypted =>
      'Detta meddelande krypteras och skickas till mottagaren';

  @override
  String get sendRequestButton => 'Skicka förfrågan';

  @override
  String get requestExpiresIn24h =>
      'Förfrågan löper ut om 24 timmar om den inte accepteras';

  @override
  String get theyAlreadySentYouRequest =>
      'Denna person har redan skickat dig en förfrågan';

  @override
  String get requests => 'Förfrågningar';

  @override
  String get receivedRequests => 'Mottagna';

  @override
  String get sentRequests => 'Skickade';

  @override
  String get noSentRequests => 'Inga skickade förfrågningar';

  @override
  String get cancelRequest => 'Avbryt';

  @override
  String get deleteRequest => 'Radera förfrågan';

  @override
  String get requestCancelled => 'Förfrågan avbruten';

  @override
  String sentTo(String hashId) {
    return 'Skickad till $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Löper ut om $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Mottagen $time sedan';
  }

  @override
  String get messageFromRequester => 'Meddelande från avsändaren';

  @override
  String get copy => 'Kopiera';

  @override
  String get messageInfo => 'Meddelandeinfo';

  @override
  String get messageDirection => 'Riktning';

  @override
  String get messageSentByYou => 'Skickat av dig';

  @override
  String get messageReceived => 'Mottaget';

  @override
  String get messageSentAt => 'Skickat';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Läst';

  @override
  String get messageType => 'Typ';

  @override
  String get messageSize => 'Storlek';

  @override
  String get messageExpiresAt => 'Löper ut';

  @override
  String get messageEncrypted => 'Ände-till-ände-krypterat';

  @override
  String get messageStatusSending => 'Skickar...';

  @override
  String get messageStatusSent => 'Skickat';

  @override
  String get messageStatusDelivered => 'Levererat';

  @override
  String get messageStatusRead => 'Läst';

  @override
  String get messageStatusFailed => 'Misslyckades';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Väntar på leverans';

  @override
  String get deletedFromServer => 'Raderat';

  @override
  String get messageTypeText => 'Text';

  @override
  String get messageTypeImage => 'Bild';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Röst';

  @override
  String get messageTypeFile => 'Fil';

  @override
  String get indefinitely => 'På obestämd tid';

  @override
  String get hoursShort => 't';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'timmar';

  @override
  String get minutes => 'minuter';

  @override
  String get seconds => 'sekunder';

  @override
  String get ephemeralMessages => 'Försvinnande meddelanden';

  @override
  String get ephemeralMessagesDescription =>
      'Meddelanden raderas automatiskt efter denna tid';

  @override
  String get ephemeralImmediate => 'Omedelbart (efter läsning)';

  @override
  String get ephemeralImmediateDesc => 'Raderas direkt efter läsning';

  @override
  String get ephemeralMyPreference => 'Min preferens';

  @override
  String get ephemeralMyPreferenceDesc => 'Använd global inställning';

  @override
  String get ephemeralDefaultSetting => 'Meddelandets varaktighet';

  @override
  String get ephemeralChooseDefault => 'Rekommenderat';

  @override
  String get ephemeral30Seconds => '30 sekunder';

  @override
  String get ephemeral30SecondsDesc => 'Raderas 30s efter läsning';

  @override
  String get ephemeral5Minutes => '5 minuter';

  @override
  String get ephemeral5MinutesDesc => 'Raderas 5min efter läsning';

  @override
  String get ephemeral1Hour => '1 timme';

  @override
  String get ephemeral1HourDesc => 'Raderas 1t efter läsning';

  @override
  String get ephemeral3Hours => '3 timmar';

  @override
  String get ephemeral6Hours => '6 timmar';

  @override
  String get ephemeral6HoursDesc => 'Raderas 6t efter läsning';

  @override
  String get ephemeral12Hours => '12 timmar';

  @override
  String get ephemeral24Hours => '24 timmar';

  @override
  String get ephemeral24HoursDesc => 'Raderas 24t efter läsning';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Anpassad varaktighet';

  @override
  String get howItWorks => 'Hur det fungerar';

  @override
  String get ephemeralExplanation1 =>
      'Meddelanden raderas från servern direkt vid mottagning.';

  @override
  String get ephemeralExplanation2 =>
      'Denna inställning bestämmer när meddelanden försvinner från DIN telefon efter läsning.';

  @override
  String get ephemeralExplanation3 =>
      'Din kontakt har sin egen inställning för sin telefon.';

  @override
  String get mute1Hour => '1 timme';

  @override
  String get mute8Hours => '8 timmar';

  @override
  String get mute1Day => '1 dag';

  @override
  String get mute1Week => '1 vecka';

  @override
  String get muteAlways => 'Alltid';

  @override
  String get muteExplanation => 'Du får inga aviseringar för denna kontakt';

  @override
  String get showCallsInRecents => 'Visa i senaste samtal';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash-samtal visas i telefonens samtalshistorik';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Tysta aviseringar';

  @override
  String get muteDescription => 'Du får inga aviseringar för denna kontakt';

  @override
  String mutedUntil(String time) {
    return 'Tystad till $time';
  }

  @override
  String get notMuted => 'Aviseringar aktiverade';

  @override
  String get unmute => 'Slå på ljud';

  @override
  String get notificationSound => 'Aviseringsljud';

  @override
  String get defaultSound => 'Standard';

  @override
  String get chatSettings => 'Chattinställningar';

  @override
  String get bubbleColor => 'Bubbelfärg';

  @override
  String get backgroundColor => 'Bakgrundsfärg';

  @override
  String get backgroundImage => 'Bakgrundsbild';

  @override
  String get chatBackground => 'Chattbakgrund';

  @override
  String get customColor => 'Anpassad';

  @override
  String get defaultColor => 'Standard';

  @override
  String get imageSelected => 'Bild vald';

  @override
  String get noImage => 'Ingen bild';

  @override
  String get color => 'Färg';

  @override
  String get image => 'Bild';

  @override
  String get tapToSelectImage => 'Tryck för att välja en bild';

  @override
  String get changeImage => 'Ändra bild';

  @override
  String get previewMessageReceived => 'Hej!';

  @override
  String get previewMessageSent => 'Tjena!';

  @override
  String get messageAction => 'Meddelande';

  @override
  String get callAction => 'Samtal';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Personliga anteckningar';

  @override
  String get addNotes => 'Lägg till anteckningar...';

  @override
  String get noNotes => 'Inga anteckningar';

  @override
  String get messageNotifications => 'Meddelandeaviseringar';

  @override
  String get callNotifications => 'Samtalsaviseringar';

  @override
  String get useGradient => 'Använd gradient';

  @override
  String get gradientStart => 'Startfärg';

  @override
  String get gradientEnd => 'Slutfärg';

  @override
  String get preview => 'Förhandsgranskning';

  @override
  String get reset => 'Återställ';

  @override
  String get securityNumber => 'Säkerhetsnummer';

  @override
  String securityNumberDescription(String name) {
    return 'Verifiera att säkerhetsnumret matchar ${name}s enhet';
  }

  @override
  String get verifyEncryption => 'Verifiera ände-till-ände-kryptering';

  @override
  String get tapToCopy => 'Tryck för att kopiera';

  @override
  String get howToVerify => 'Hur verifierar man';

  @override
  String get verifyStep1 => 'Träffa din kontakt personligen eller ring dem';

  @override
  String get verifyStep2 => 'Jämför säkerhetsnumren eller skanna QR-koder';

  @override
  String get verifyStep3 => 'Om de matchar är din chatt säker';

  @override
  String get scanToVerify => 'Skanna för att verifiera';

  @override
  String get reportSpam => 'Rapportera spam';

  @override
  String get reportSpamSubtitle => 'Rapportera denna kontakt som spam';

  @override
  String get reportSpamDescription =>
      'Denna kontakt rapporteras anonymt. Din identitet delas inte. Är du säker?';

  @override
  String get report => 'Rapportera';

  @override
  String get spamReported => 'Spam rapporterat';

  @override
  String get reportError => 'Kunde inte skicka rapport. Försök igen.';

  @override
  String get reportRateLimited =>
      'Du har nått det maximala antalet rapporter för idag.';

  @override
  String get blockContact => 'Blockera kontakt';

  @override
  String get blockContactDescription =>
      'Denna kontakt kan inte längre skicka meddelanden till dig eller ringa dig. De meddelas inte.';

  @override
  String get unblockContact => 'Avblockera kontakt';

  @override
  String get unblockContactDescription =>
      'Denna kontakt kan åter skicka meddelanden till dig och ringa dig.';

  @override
  String get contactBlocked => 'Kontakt blockerad';

  @override
  String get contactUnblocked => 'Kontakt avblockerad';

  @override
  String get contactIsBlocked => 'Denna kontakt är blockerad';

  @override
  String get unblock => 'Avblockera';

  @override
  String get deleteContactSubtitle => 'Radera denna kontakt och chatt';

  @override
  String get confirmWithPin => 'Bekräfta med PIN';

  @override
  String get enterPinToConfirm => 'Ange din PIN för att bekräfta denna åtgärd';

  @override
  String get profilePhoto => 'Profilbild';

  @override
  String get takePhoto => 'Ta ett foto';

  @override
  String get chooseFromGallery => 'Välj från galleri';

  @override
  String get removePhoto => 'Ta bort foto';

  @override
  String get viewContactHashId => 'Visa kontaktens identifierare';

  @override
  String get hashIdPartiallyMasked =>
      'Delvis maskerat för din säkerhet och din kontakts integritet';

  @override
  String get addFirstContact => 'Lägg till din första kontakt';

  @override
  String get addFirstContactSubtitle => 'Dela din QR-kod eller skanna en väns';

  @override
  String get directory => 'Katalog';

  @override
  String get noContacts => 'Inga kontakter';

  @override
  String get noContactsSubtitle => 'Lägg till en kontakt för att komma igång';

  @override
  String get sendMessageAction => 'Skicka ett meddelande';

  @override
  String get audioCall => 'Röstsamtal';

  @override
  String get videoCall => 'Videosamtal';

  @override
  String get viewProfile => 'Visa profil';

  @override
  String get deleteContactDirectory => 'Radera kontakt';

  @override
  String get scanShort => 'Skanna';

  @override
  String get addShort => 'Lägg till';

  @override
  String deleteContactConfirmName(String name) {
    return 'Är du säker på att du vill radera $name?';
  }

  @override
  String get noNotesTitle => 'Inga anteckningar';

  @override
  String get noNotesSubtitle => 'Skapa din första anteckning';

  @override
  String get newNote => 'Ny anteckning';

  @override
  String get editNote => 'Redigera anteckning';

  @override
  String get deleteNote => 'Radera anteckning';

  @override
  String get deleteNoteConfirm =>
      'Är du säker på att du vill radera denna anteckning?';

  @override
  String get noteTitle => 'Titel';

  @override
  String get noteContent => 'Innehåll';

  @override
  String get addItem => 'Lägg till objekt';

  @override
  String get pinNote => 'Fäst';

  @override
  String get unpinNote => 'Lossa';

  @override
  String get noteColor => 'Färg';

  @override
  String get notePassword => 'Lösenord';

  @override
  String get setPassword => 'Ange lösenord';

  @override
  String get changePassword => 'Ändra lösenord';

  @override
  String get removePassword => 'Ta bort lösenord';

  @override
  String get enterPassword => 'Ange lösenord';

  @override
  String get confirmPassword => 'Bekräfta lösenord';

  @override
  String get passwordPin => 'PIN-kod';

  @override
  String get passwordText => 'Textlösenord';

  @override
  String get protectedNote => 'Skyddad anteckning';

  @override
  String get incorrectPassword => 'Felaktigt lösenord';

  @override
  String get passwordSet => 'Lösenord angivet';

  @override
  String get passwordRemoved => 'Lösenord borttaget';

  @override
  String get notesBiometric => 'Face ID för anteckningar';

  @override
  String get notesBiometricSubtitle =>
      'Kräv biometrisk autentisering för att öppna skyddade anteckningar';

  @override
  String get textNote => 'Textanteckning';

  @override
  String get checklistNote => 'Checklista';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total uppgifter';
  }

  @override
  String get autoSaved => 'Sparat';

  @override
  String get searchNotes => 'Sök anteckningar';

  @override
  String get legalConsent => 'Juridiskt samtycke';

  @override
  String get confirmAge13 => 'Jag bekräftar att jag är minst 13 år';

  @override
  String get acceptLegalStart => 'Jag accepterar ';

  @override
  String get privacyPolicy => 'Integritetspolicyn';

  @override
  String get termsOfService => 'Användarvillkoren';

  @override
  String get andThe => ' och ';

  @override
  String get continueButton => 'Fortsätt';

  @override
  String get mustAcceptTerms =>
      'Du måste acceptera båda villkoren för att fortsätta';

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
  String get contactSupport => 'Kontakta support';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Rapportera missbruk';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Juridiskt';

  @override
  String get legalEntity => 'Juridisk enhet';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fäst';

  @override
  String get unpinConversation => 'Lossa';

  @override
  String get hideConversation => 'Ta bort från flödet';

  @override
  String get deleteConversation => 'Radera konversation';

  @override
  String get deleteConversationConfirm =>
      'Ange din PIN för att bekräfta radering av alla meddelanden';

  @override
  String get noConversations => 'Inga konversationer ännu';

  @override
  String get startConversation => 'Starta';

  @override
  String get microphonePermissionRequired => 'Mikrofonåtkomst krävs';

  @override
  String get microphonePermissionExplanation =>
      'Hash behöver mikrofonen för samtal.';

  @override
  String get cameraPermissionExplanation =>
      'Hash behöver kameran för videosamtal.';

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
  String get openSettings => 'Öppna inställningar';

  @override
  String get callConnecting => 'Ansluter...';

  @override
  String get callRinging => 'Ringer...';

  @override
  String get callReconnecting => 'Återansluter...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Återansluter (${seconds}s)';
  }

  @override
  String get callPaused => 'Pausad';

  @override
  String get callPausedSubtitle => 'Samtalet pågår fortfarande';

  @override
  String get callRemoteMicMuted => 'Kontaktens mikrofon är tystad';

  @override
  String get callMiniControlsMute => 'Tysta';

  @override
  String get callMiniControlsUnmute => 'Slå på ljud';

  @override
  String get callMiniControlsHangUp => 'Lägg på';

  @override
  String get callMiniControlsReturn => 'Återgå till samtalet';

  @override
  String get callNetworkPoor => 'Instabil anslutning';

  @override
  String get callNetworkLost => 'Anslutning förlorad';

  @override
  String get callEndedTitle => 'Samtal avslutat';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Enhetsdata';

  @override
  String get deviceDataSubtitle => 'Lokal och serverlagring';

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
  String get onThisDevice => 'på denna enhet';

  @override
  String get encryptedDatabases => 'Krypterade databaser';

  @override
  String get files => 'Filer';

  @override
  String get secureKeychain => 'Säker nyckelring';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Namn, avatarer, Signal-nycklar';

  @override
  String get messagesDetail => 'Krypterade konversationer';

  @override
  String get notesDetail => 'Personliga anteckningar';

  @override
  String get signalSessions => 'Signal-sessioner';

  @override
  String get signalSessionsDetail => 'Krypteringssessioner';

  @override
  String get pendingContacts => 'Väntande kontakter';

  @override
  String get pendingContactsDetail => 'Väntande förfrågningar';

  @override
  String get callHistory => 'Samtal';

  @override
  String get callHistoryDetail => 'Samtalshistorik';

  @override
  String get preferences => 'Inställningar';

  @override
  String get preferencesDetail => 'Media- och samtalsinställningar';

  @override
  String get avatars => 'Avatarer';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
      zero: 'inga filer',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktiv';

  @override
  String get notDefined => 'Ej definierad';

  @override
  String get biometrics => 'Biometri';

  @override
  String get recoveryPhrase => 'Återställningsfras';

  @override
  String get identity => 'Identitet (Hash-ID)';

  @override
  String get signalKeys => 'Signal Protocol-nycklar';

  @override
  String get authTokens => 'Autentiseringstoken';

  @override
  String get contactNamesCache => 'Cache för kontaktnamn';

  @override
  String get remoteConfig => 'Fjärrkonfiguration';

  @override
  String get notificationPrefs => 'Aviseringsinställningar';

  @override
  String get serverData => 'Serverdata';

  @override
  String get serverDataInfo =>
      'Hash lagrar minimal data på servern, allt krypterat eller tillfälligt.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash-ID, publika nycklar, brevlådetoken';

  @override
  String get serverPrekeys => 'Förnycklar';

  @override
  String get serverPrekeysDetail => 'Engångs-Signal-nycklar (förbrukade)';

  @override
  String get serverMessages => 'Meddelanden under transport';

  @override
  String get serverMessagesDetail => 'Raderas efter leverans (max 24t)';

  @override
  String get serverMedia => 'Media under transport';

  @override
  String get serverMediaDetail => 'Raderas efter nedladdning';

  @override
  String get serverContactRequests => 'Kontaktförfrågningar';

  @override
  String get serverContactRequestsDetail => 'Löper ut efter 24t';

  @override
  String get serverRateLimits => 'Hastighetsbegränsningar';

  @override
  String get serverRateLimitsDetail => 'Tillfällig data mot missbruk';

  @override
  String get privacyReassurance =>
      'Hash kan inte läsa dina meddelanden. All data är ände-till-ände-krypterad. Serverdata raderas automatiskt.';

  @override
  String get pinTooSimple => 'Denna PIN är för enkel. Välj en säkrare kod.';

  @override
  String get genericError => 'Ett fel uppstod. Försök igen.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Kunde inte skapa konto: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fras kopierad till urklipp';

  @override
  String get copyPhrase => 'Kopiera fras';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Skriv ner denna fras på en säker plats. Om du förlorar din PIN utan denna fras förlorar du permanent åtkomst till dina data.';

  @override
  String get noMessages => 'Inga meddelanden';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Radera alla meddelanden med $name?';
  }

  @override
  String get confirmation => 'Bekräftelse';

  @override
  String get untitled => 'Utan titel';

  @override
  String get noSessions => 'Inga sessioner';

  @override
  String get unknownContact => 'Okänd kontakt';

  @override
  String get unnamed => 'Namnlös';

  @override
  String get noPendingRequestsAlt => 'Inga väntande förfrågningar';

  @override
  String get deleteAllCallHistory => 'Radera all samtalshistorik?';

  @override
  String get noCalls => 'Inga samtal';

  @override
  String get noPreferences => 'Inga inställningar';

  @override
  String get resetAllMediaPrefs => 'Återställ alla mediainställningar?';

  @override
  String get deleteThisAvatar => 'Radera denna avatar?';

  @override
  String get deleteAllAvatars => 'Radera alla avatarer?';

  @override
  String get noAvatars => 'Inga avatarer';

  @override
  String get deleteThisFile => 'Radera denna fil?';

  @override
  String get deleteAllMediaFiles => 'Radera all media?';

  @override
  String get noMediaFiles => 'Ingen media';

  @override
  String get outgoing => 'Utgående';

  @override
  String get incoming => 'Inkommande';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Försvinnande visning: ${seconds}s';
  }

  @override
  String get normalView => 'Normal visning';

  @override
  String get callReasonCompleted => 'Avslutad';

  @override
  String get callReasonMissed => 'Missat';

  @override
  String get callReasonDeclined => 'Avvisat';

  @override
  String get callReasonFailed => 'Misslyckat';

  @override
  String get justNow => 'Just nu';

  @override
  String timeAgoMinutes(int count) {
    return '$count min sedan';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}t sedan';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}d sedan';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Plats';

  @override
  String get statusQueued => 'I kö';

  @override
  String get blockedBadge => 'Blockerad';

  @override
  String get protectedBadge => 'Skyddad';

  @override
  String messageCount(int count) {
    return '$count meddelande(n)';
  }

  @override
  String get deleteQuestion => 'Radera?';

  @override
  String get transferMyAccountTitle => 'Överför mitt konto';

  @override
  String get loadingError => 'Laddningsfel';

  @override
  String get transferToNewDevice => 'Överför till en ny enhet';

  @override
  String get transferInstructions =>
      'Välj \"Återställ mitt konto\" på din nya enhet och ange denna information:';

  @override
  String get yourHashIdLabel => 'Ditt Hash-ID';

  @override
  String get enterYourPinCode => 'Ange din PIN-kod';

  @override
  String get pinOwnerConfirmation =>
      'För att bekräfta att du är ägaren av detta konto';

  @override
  String get scanThisQrCode => 'Skanna denna QR-kod';

  @override
  String get withYourNewDevice => 'Med din nya enhet';

  @override
  String get orEnterTheCode => 'eller ange koden';

  @override
  String get transferCodeLabel => 'Överföringskod';

  @override
  String get proximityVerification => 'Närhetsverifiering';

  @override
  String get bringDevicesCloser => 'Håll båda enheterna nära';

  @override
  String get confirmTransferQuestion => 'Bekräfta överföringen?';

  @override
  String get accountWillBeTransferred =>
      'Ditt konto överförs till den nya enheten.\n\nDenna enhet kopplas permanent bort.';

  @override
  String get transferComplete => 'Överföring klar';

  @override
  String get transferSuccessMessage =>
      'Ditt konto har överförts framgångsrikt.\n\nDenna applikation stängs nu.';

  @override
  String get manualVerification => 'Manuell verifiering';

  @override
  String get codeDisplayedOnBothDevices => 'Kod visad på båda enheterna:';

  @override
  String get doesCodeMatchNewDevice =>
      'Matchar denna kod den på den nya enheten?';

  @override
  String get verifiedStatus => 'Verifierad';

  @override
  String get inProgressStatus => 'Pågår...';

  @override
  String get notAvailableStatus => 'Ej tillgänglig';

  @override
  String get codeExpiredRestart => 'Koden har löpt ut. Vänligen börja om.';

  @override
  String get codesDoNotMatchCancelled =>
      'Koderna matchar inte. Överföring avbruten.';

  @override
  String transferToDevice(String device) {
    return 'Till: $device';
  }

  @override
  String get copiedExclamation => 'Kopierat!';

  @override
  String expiresInTime(String time) {
    return 'Löper ut om $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometri är inte tillgänglig på denna enhet';

  @override
  String get biometricAuthError => 'Fel vid biometrisk autentisering';

  @override
  String get authenticateForBiometric =>
      'Autentisera dig för att aktivera biometri';

  @override
  String get biometricAuthFailed => 'Biometrisk autentisering misslyckades';

  @override
  String get forceUpdateTitle => 'Uppdatering krävs';

  @override
  String get forceUpdateMessage =>
      'En ny version av Hash finns tillgänglig. Uppdatera för att fortsätta.';

  @override
  String get updateButton => 'Uppdatera';

  @override
  String get maintenanceInProgress => 'Underhåll pågår';

  @override
  String get tryAgainLater => 'Försök igen senare';

  @override
  String get information => 'Information';

  @override
  String get later => 'Senare';

  @override
  String get doYouLikeHash => 'Gillar du Hash?';

  @override
  String get yourFeedbackHelps =>
      'Din feedback hjälper oss att förbättra appen';

  @override
  String get ratingTerrible => 'Hemskt';

  @override
  String get ratingBad => 'Dåligt';

  @override
  String get ratingOk => 'Okej';

  @override
  String get ratingGood => 'Bra';

  @override
  String get ratingExcellent => 'Utmärkt!';

  @override
  String get donationMessage =>
      'Hash är ett ideellt projekt. Ditt stöd hjälper oss att fortsätta bygga en verkligt privat meddelandeapp.';

  @override
  String get recentConnections => 'Senaste anslutningar';

  @override
  String get loginInfoText =>
      'Varje PIN-upplåsning registreras lokalt. Bara de senaste 24 timmarna sparas.';

  @override
  String get connectionCount => 'Anslutning(ar)';

  @override
  String get periodLabel => 'Period';

  @override
  String get historyLabel => 'Historik';

  @override
  String get noLoginRecorded => 'Inga inloggningar registrerade';

  @override
  String get nextUnlocksAppearHere => 'Nästa upplåsningar visas här.';

  @override
  String get dataLocalOnly =>
      'Denna data lagras bara på din enhet och överförs aldrig.';

  @override
  String get currentSession => 'Nuvarande';

  @override
  String get todayLabel => 'Idag';

  @override
  String get yesterdayLabel => 'Igår';

  @override
  String get justNowLabel => 'Just nu';

  @override
  String minutesAgoLabel(int count) {
    return '$count min sedan';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}t sedan';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}t ${minutes}min sedan';
  }

  @override
  String get noMaintenancePlanned => 'Inget planerat underhåll';

  @override
  String get everythingWorkingNormally => 'Allt fungerar normalt';

  @override
  String get maintenanceTitle => 'Underhåll';

  @override
  String get maintenanceActiveLabel => 'PÅGÅR';

  @override
  String get maintenancePlannedLabel => 'PLANERAT';

  @override
  String get locking => 'Låser...';

  @override
  String get newMessageNotification => 'Nytt meddelande';

  @override
  String get secExplainTitle => 'Hur Hash skyddar dig';

  @override
  String get secExplainIntro =>
      'Hash är designat så att ingen kan läsa dina meddelanden.';

  @override
  String get secExplainIntroSub =>
      'Inte ens vi.\nSå här fungerar det, enkelt förklarat.';

  @override
  String get secJourneyLabel => 'RESAN';

  @override
  String get secJourneyTitle => 'Ditt meddelandes resa';

  @override
  String get secJourneySubtitle =>
      'Från ditt finger till din kontakts skärm, varje steg är skyddat. Följ vägen.';

  @override
  String get secStep1Title => 'Du skriver ditt meddelande';

  @override
  String get secStep1Desc =>
      'Du skriver \"Hej!\" i appen. I detta skede existerar meddelandet bara i din telefons minne. Inget har skickats.';

  @override
  String get secStep2Title => 'Kryptering med Signal-protokollet';

  @override
  String get secStep2Desc =>
      'Så fort du trycker \"Skicka\" omvandlas ditt meddelande till en sträng av obegripliga tecken. Det är som att ditt meddelande låses i ett kassaskåp som bara din kontakt har nyckeln till.';

  @override
  String get secStep3Title => 'Sealed Sender: det osynliga kuvertet';

  @override
  String get secStep3Desc =>
      'Föreställ dig att du skickar ett brev med posten, men utan avsändaradress på kuvertet. Det är precis vad Hash gör. Meddelandet läggs i en anonym brevlåda. Servern vet inte vem som skickade det.';

  @override
  String get secStep4Title => 'Servern ser ingenting';

  @override
  String get secStep4Desc =>
      'Servern agerar som en blind brevbärare. Den vet bara \"någon lade något i brevlåda #A7X9\". Den vet inte vem som skickade det, vad det är eller vem det är till.';

  @override
  String get secStep4Highlight =>
      'Ingen metadata lagras: ingen IP-adress, ingen tidsstämpel, ingen koppling mellan avsändare och mottagare.';

  @override
  String get secStep5Title => 'Din kontakt tar emot meddelandet';

  @override
  String get secStep5Desc =>
      'Din kontakts telefon hämtar innehållet från sin anonyma brevlåda och dekrypterar meddelandet med sin privata nyckel, som aldrig lämnat deras enhet. \"Hej!\" visas på deras skärm.';

  @override
  String get secStep6Title => 'Meddelandet försvinner från servern';

  @override
  String get secStep6Desc =>
      'Så fort din kontakt bekräftar mottagandet raderar servern permanent meddelandet. Ingen papperskorg, inget arkiv, ingen säkerhetskopia. Även olästa meddelanden förstörs automatiskt efter 24 timmar.';

  @override
  String get secStep7Title => 'Lokal utgång';

  @override
  String get secStep7Desc =>
      'På din kontakts telefon förstörs meddelandet enligt den varaktighet du valde: direkt efter läsning, 5 minuter, 1 timme... du bestämmer.';

  @override
  String get secJourneyConclusion =>
      'Resultat: inga spår på servern, inga spår på enheterna. Meddelandet existerade bara tillräckligt länge för att bli läst, sedan försvann det.';

  @override
  String get secArchLabel => 'ARKITEKTUR';

  @override
  String get secArchTitle => '5 skyddslager';

  @override
  String get secArchSubtitle =>
      'Hash förlitar sig inte på en enda teknologi. Varje lager förstärker de andra. Även om ett lager komprometteras förblir din data säker.';

  @override
  String get secLayer1Title => 'Ände-till-ände-kryptering';

  @override
  String get secLayer1Desc =>
      'Varje meddelande krypteras med en unik nyckel. Enkelt uttryckt: även om någon dekrypterar ett meddelande kan de inte dekryptera nästa. Varje meddelande har sitt eget lås.';

  @override
  String get secLayer1Detail =>
      'För filer (foton, videor, dokument) använder Hash ytterligare AES-256-GCM-kryptering. Filen krypteras innan den lämnar din telefon.';

  @override
  String get secLayer2Title => 'Sealed Sender (nätverksanonymitet)';

  @override
  String get secLayer2Desc =>
      'Vanliga meddelandeappar skickar dina meddelanden med din identitet bifogad. Det är som att skriva ditt namn på kuvertet. Hash använder anonyma brevlådor: servern levererar meddelandet utan att veta vem som skickade det.';

  @override
  String get secLayer2Detail =>
      'Resultat: även vid ett serverdataläckage är det omöjligt att rekonstruera vem som pratar med vem.';

  @override
  String get secLayer3Title => 'Automatisk radering';

  @override
  String get secLayer3Desc =>
      'Meddelanden raderas från servern så fort mottagandet bekräftas. Även om ett meddelande aldrig hämtas förstörs det automatiskt efter 24 timmar.';

  @override
  String get secLayer3Detail =>
      'På din telefon förstörs meddelanden enligt den varaktighet du väljer: omedelbart, 5 min, 15 min, 30 min, 1t, 3t, 6t eller 12t.';

  @override
  String get secLayer4Title => 'Lokalt åtkomstskydd';

  @override
  String get secLayer4Desc =>
      'Appen skyddas av en 6-siffrig PIN-kod och/eller biometri (Face ID, fingeravtryck). Efter för många misslyckade försök låses appen med en ökande fördröjning efter varje misslyckande.';

  @override
  String get secLayer5Title => 'Låst databas';

  @override
  String get secLayer5Desc =>
      'På serversidan kan ingen användare skriva direkt till databasen. Alla åtgärder går genom säkra funktioner som verifierar varje förfrågan.';

  @override
  String get secLayer5Detail =>
      'Det är som en bankdisk: du rör aldrig valvet själv. Du gör en förfrågan, och systemet kontrollerar att du har rätt innan det agerar.';

  @override
  String get secVashLabel => 'UNIKT I VÄRLDEN';

  @override
  String get secVashTitle => 'Vash-läge';

  @override
  String get secVashSubtitle =>
      'Ett nödsäkerhetssystem som inte finns i någon annan meddelandeapp.';

  @override
  String get secVashScenarioTitle => 'Föreställ dig denna situation';

  @override
  String get secVashScenario1 => 'Någon kommer åt din telefon';

  @override
  String get secVashScenario2 => 'Du ombeds ange din PIN-kod';

  @override
  String get secVashScenario3 => 'Du vill radera all din data omedelbart';

  @override
  String get secVashSolutionTitle => 'Lösningen: två PIN-koder';

  @override
  String get secVashSolutionDesc =>
      'Du konfigurerar två olika PIN-koder i Hash:';

  @override
  String get secVashNormalCodeLabel => 'Normal kod';

  @override
  String get secVashNormalCodeDesc => 'Öppnar appen normalt med all din data';

  @override
  String get secVashCodeLabel2 => 'Vash-kod';

  @override
  String get secVashCodeDescription =>
      'Öppnar appen normalt... men all din data raderas tyst i bakgrunden';

  @override
  String get secVashWhatHappensTitle => 'Vad som händer sedan';

  @override
  String get secVashWhatHappensDesc =>
      'Appen öppnas normalt. Ingen varning, ingen misstänkt animation. Skärmen visar helt enkelt en tom app, som om du precis installerat den.\n\nI verkligheten har alla dina konversationer, kontakter och meddelanden oåterkalleligt raderats på en bråkdel av en sekund.';

  @override
  String get secCallsLabel => 'SAMTAL & FILER';

  @override
  String get secCallsTitle => 'Allt är krypterat';

  @override
  String get secCallsSubtitle =>
      'Det är inte bara meddelanden. Absolut allt som passerar genom Hash är ände-till-ände-krypterat.';

  @override
  String get secAudioCallTitle => 'Röstsamtal';

  @override
  String get secAudioCallDesc =>
      'Ände-till-ände-krypterade via WebRTC. Rösten överförs direkt mellan enheterna.';

  @override
  String get secVideoCallTitle => 'Videosamtal';

  @override
  String get secVideoCallDesc =>
      'Samma teknologi, varje ström krypterad individuellt.';

  @override
  String get secPhotosTitle => 'Foton & videor';

  @override
  String get secPhotosDesc =>
      'Krypterade med AES-256-GCM innan de lämnar din telefon.';

  @override
  String get secDocsTitle => 'Dokument';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, vilken fil som helst. Namn, storlek och innehåll krypterat.';

  @override
  String get secAnonLabel => 'ANONYMITET';

  @override
  String get secAnonTitle => 'Ingen identitet krävs';

  @override
  String get secAnonSubtitle =>
      'Hash ber aldrig om ditt telefonnummer eller din e-post. Du identifieras med ett unikt och anonymt Hash-ID.';

  @override
  String get secHashIdTitle => 'Ditt Hash-ID';

  @override
  String get secHashIdDesc =>
      'Detta är din unika identifierare. Den avslöjar ingenting om dig: inte ditt namn, inte ditt nummer, inte din plats. Det är som en pseudonym omöjlig att koppla till din riktiga identitet.\n\nFör att lägga till en kontakt delar du ditt Hash-ID eller skannar en QR-kod. Det är allt. Ingen synkroniserad adressbok, inga \"Personer du kanske känner\"-förslag.';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => 'Vad Hash inte vet';

  @override
  String get secDataSubtitle =>
      'Det bästa sättet att skydda din data är att inte samla in den.';

  @override
  String get secNeverCollected => 'Aldrig insamlat';

  @override
  String get secNeverItem1 => 'Meddelandeinnehåll';

  @override
  String get secNeverItem2 => 'Kontaktlista';

  @override
  String get secNeverItem3 => 'Telefonnummer';

  @override
  String get secNeverItem4 => 'E-postadress';

  @override
  String get secNeverItem5 => 'IP-adress';

  @override
  String get secNeverItem6 => 'Plats';

  @override
  String get secNeverItem7 => 'Metadata (vem pratar med vem)';

  @override
  String get secNeverItem8 => 'Samtalshistorik';

  @override
  String get secNeverItem9 => 'Adressbok';

  @override
  String get secNeverItem10 => 'Reklamidentifierare';

  @override
  String get secTempStored => 'Tillfälligt lagrat';

  @override
  String get secTempItem1 => 'Anonymt Hash-ID (unik identifierare)';

  @override
  String get secTempItem2 => 'Publika krypteringsnycklar';

  @override
  String get secTempItem3 => 'Krypterade meddelanden under transport (max 24t)';

  @override
  String get secTempNote =>
      'Inte ens denna minimala data kan identifiera dig. Ditt Hash-ID är inte kopplat till någon personlig information.';

  @override
  String get secFooterTitle => 'Din integritet, din frihet';

  @override
  String get secFooterDesc =>
      'Hash använder samma krypteringsteknologier som de mest krävande professionella applikationerna. Dina meddelanden skyddas av matematik, inte av löften.';

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
