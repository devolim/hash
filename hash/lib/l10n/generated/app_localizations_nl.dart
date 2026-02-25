// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Geen spoor. Geen compromis.';

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
  String get contacts => 'Contacten';

  @override
  String get noConversation => 'Geen chats';

  @override
  String get noConversationSubtitle =>
      'Voeg een contact toe om veilig te beginnen chatten';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wachtende verzoeken',
      one: '1 wachtend verzoek',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count verzonden verzoeken in afwachting',
      one: '1 verzonden verzoek in afwachting',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Contact toevoegen';

  @override
  String get shareApp => 'App delen';

  @override
  String get newMessage => 'Nieuw bericht';

  @override
  String get newConversation => 'Stuur een bericht';

  @override
  String get settings => 'Instellingen';

  @override
  String get myHashId => 'Mijn Hash-ID';

  @override
  String get supportHash => 'Steun Hash';

  @override
  String get supportHashSubtitle => 'Hash is een project zonder winstoogmerk';

  @override
  String get donate => 'Doneren';

  @override
  String get appearance => 'Uiterlijk';

  @override
  String get theme => 'Thema';

  @override
  String get themeAuto => 'Automatisch';

  @override
  String get themeAutoSubtitle => 'Volgt systeeminstellingen';

  @override
  String get themeDark => 'Donker';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeRecommendation =>
      'Donker thema wordt aanbevolen voor betere privacy';

  @override
  String get language => 'Taal';

  @override
  String get languageAuto => 'Automatisch (systeem)';

  @override
  String get notifications => 'Meldingen';

  @override
  String get messages => 'Berichten';

  @override
  String get calls => 'Oproepen';

  @override
  String get vibration => 'Trillen';

  @override
  String get notificationContent => 'Meldingsinhoud';

  @override
  String get notificationContentFull => 'Alles tonen';

  @override
  String get notificationContentFullDesc => 'Contactnaam en berichtvoorbeeld';

  @override
  String get notificationContentName => 'Alleen naam';

  @override
  String get notificationContentNameDesc => 'Toont alleen de contactnaam';

  @override
  String get notificationContentDiscrete => 'Discreet';

  @override
  String get notificationContentDiscreteDesc =>
      'Toont alleen \"Nieuw bericht\"';

  @override
  String get security => 'Beveiliging';

  @override
  String get howHashProtectsYou => 'Hoe Hash je beschermt';

  @override
  String get howHashProtectsYouSubtitle => 'Begrijp je beveiliging';

  @override
  String get accountSecurity => 'Accountbeveiliging';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrie, Vash-modus';

  @override
  String get blockScreenshots => 'Screenshots blokkeren';

  @override
  String get transferDevice => 'Overzetten naar ander apparaat';

  @override
  String get transferDeviceSubtitle => 'Je account migreren';

  @override
  String get pinCode => 'PIN-code';

  @override
  String get changePin => 'PIN-code wijzigen';

  @override
  String get currentPin => 'Huidige PIN-code';

  @override
  String get newPin => 'Nieuwe PIN-code';

  @override
  String get confirmPin => 'PIN-code bevestigen';

  @override
  String get pinChanged => 'PIN-code gewijzigd';

  @override
  String get incorrectPin => 'Onjuiste PIN';

  @override
  String get pinsDoNotMatch => 'PIN-codes komen niet overeen';

  @override
  String get autoLock => 'Automatisch vergrendelen';

  @override
  String get autoLockDelay => 'Vergrendelingsvertraging';

  @override
  String get autoLockImmediate => 'Onmiddellijk';

  @override
  String get autoLockMinute => '1 minuut';

  @override
  String autoLockMinutes(int count) {
    return '$count minuten';
  }

  @override
  String get vashCode => 'Vash-code';

  @override
  String get vashModeTitle => 'Vash-modus';

  @override
  String get vashModeExplanation => 'Je ultieme vangnet.';

  @override
  String get vashModeDescription =>
      'Je kiest een tweede PIN-code. Als je ooit gedwongen wordt om Hash te openen, voer je deze code in in plaats van je gewone PIN.\n\nDe app opent normaal, maar al je gesprekken en contacten zijn verdwenen.\n\nVoor iedereen die naar je scherm kijkt, lijkt Hash gewoon leeg — alsof je het nooit hebt gebruikt.';

  @override
  String get vashModeIrreversible => 'Deze actie is stil en onomkeerbaar.';

  @override
  String get chooseVashCode => 'Kies mijn Vash-code';

  @override
  String get vashCodeInfo =>
      'Een tweede PIN-code die de app normaal opent, maar leeg.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Als je deze code invoert in plaats van je PIN:';

  @override
  String get vashDeleteContacts => 'Je contacten verdwijnen';

  @override
  String get vashDeleteMessages => 'Je gesprekken verdwijnen';

  @override
  String get vashDeleteHistory => 'Je notities verdwijnen';

  @override
  String get vashKeepId => 'Je Hash-identiteit (#XXX-XXX-XXX) blijft hetzelfde';

  @override
  String get vashAppearNormal =>
      'De app ziet er normaal maar leeg uit, als nieuw. Deze actie is onomkeerbaar.';

  @override
  String get setupVashCode => 'Vash-code instellen';

  @override
  String get modifyVashCode => 'Vash-code wijzigen';

  @override
  String get currentVashCode => 'Huidige Vash-code';

  @override
  String get newVashCode => 'Nieuwe Vash-code';

  @override
  String get confirmVashCode => 'Vash-code bevestigen';

  @override
  String get vashCodeConfigured => 'Vash-code geconfigureerd';

  @override
  String get vashCodeModified => 'Vash-code gewijzigd';

  @override
  String get vashCodeMustDiffer => 'Vash-code moet verschillen van de PIN';

  @override
  String get incorrectVashCode => 'Onjuiste Vash-code';

  @override
  String get vashWhatToDelete => 'Wat moet Vash-modus laten verdwijnen?';

  @override
  String get vashDeleteContactsOption => 'Contacten';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Berichten';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notities';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash-modus geactiveerd';

  @override
  String get vashCreateSubtitle =>
      'Kies een code die verschilt van je hoofd-PIN';

  @override
  String get vashConfirmSubtitle => 'Bevestig je Vash-code';

  @override
  String get pinCodeForEntry => 'PIN-code om de app te openen';

  @override
  String get vashCodeSection => 'Vash-modus';

  @override
  String get biometric => 'Biometrie';

  @override
  String get biometricUnlock => 'Ontgrendelen met vingerafdruk of Face ID';

  @override
  String get enableBiometric => 'Biometrie activeren';

  @override
  String get biometricWarningMessage =>
      'Als je biometrie activeert, kun je je Vash-code niet gebruiken om de app te openen.\n\nJe kunt de Vash-code alleen gebruiken als biometrie mislukt (na meerdere mislukte pogingen).\n\nWeet je zeker dat je wilt doorgaan?';

  @override
  String get understood => 'Ik begrijp het';

  @override
  String get shareAppSubtitle => 'Deel Hash met je naasten';

  @override
  String get share => 'Delen';

  @override
  String get danger => 'Gevaar';

  @override
  String get deleteAccount => 'Mijn account verwijderen';

  @override
  String get deleteAccountSubtitle => 'Onomkeerbare actie';

  @override
  String get deleteAccountConfirmTitle => 'Mijn account verwijderen';

  @override
  String get deleteAccountConfirmMessage =>
      'Je account wordt permanent verwijderd. Deze actie is onomkeerbaar.\n\n• Al je chats\n• Al je contacten\n• Je Hash-ID\n\nJe moet een nieuw account aanmaken.';

  @override
  String get deleteForever => 'Permanent verwijderen';

  @override
  String get cancel => 'Annuleren';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash-modus geactiveerd.';

  @override
  String deletionError(String error) {
    return 'Verwijderingsfout: $error';
  }

  @override
  String get yourSecurity => 'Jouw beveiliging';

  @override
  String get securityInfo =>
      '• End-to-end-versleuteling (Signal Protocol)\n• Geen gegevens op onze servers na aflevering\n• Sleutels alleen opgeslagen op jouw apparaat\n• PIN-code wordt nooit naar de server gestuurd';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Welkom';

  @override
  String get securityStatement1 => 'Je berichten zijn beschermd.';

  @override
  String get securityStatement2 => 'End-to-end-versleuteling.';

  @override
  String get securityStatement3 => 'Geen spoor. Geen compromis.';

  @override
  String get securityStatement4 => 'Je privacy is een recht.';

  @override
  String get accessBlocked => 'Toegang geblokkeerd';

  @override
  String get tooManyAttempts => 'Te veel pogingen. Probeer het later opnieuw.';

  @override
  String get pleaseWait => 'Even geduld';

  @override
  String get waitDelay => 'Wacht tot de vertraging is afgelopen';

  @override
  String attemptCount(int current, int max) {
    return 'Poging $current van $max';
  }

  @override
  String retryIn(String time) {
    return 'Opnieuw proberen in $time';
  }

  @override
  String get forgotPin => 'PIN vergeten? Gebruik herstelfrase';

  @override
  String get useRecoveryPhrase => 'Herstelfrase gebruiken';

  @override
  String get recoveryWarningTitle => 'Waarschuwing';

  @override
  String get recoveryWarningMessage => 'Accountherstel zal:';

  @override
  String get recoveryDeleteAllMessages => 'AL je berichten verwijderen';

  @override
  String get recoveryWaitDelay => 'Een wachttijd van 1 uur vereisen';

  @override
  String get recoveryKeepContacts => 'Je contacten behouden';

  @override
  String get recoveryIrreversible =>
      'Deze actie is onomkeerbaar. Je berichten gaan permanent verloren.';

  @override
  String get iUnderstand => 'Ik begrijp het';

  @override
  String get accountRecovery => 'Accountherstel';

  @override
  String get enterRecoveryPhrase =>
      'Voer de 24 woorden van je herstelfrase in, gescheiden door spaties.';

  @override
  String get recoveryPhraseHint => 'woord1 woord2 woord3 ...';

  @override
  String get recover => 'Herstellen';

  @override
  String get recoveryPhraseRequired => 'Voer je herstelfrase in';

  @override
  String get recoveryPhrase24Words =>
      'De frase moet precies 24 woorden bevatten';

  @override
  String get incorrectRecoveryPhrase => 'Onjuiste herstelfrase';

  @override
  String get recoveryInitError => 'Fout bij initialiseren van herstel';

  @override
  String get securityDelay => 'Beveiligingsvertraging';

  @override
  String get securityDelayMessage =>
      'Voor je veiligheid is een wachttijd vereist voordat je een nieuwe PIN kunt maken.';

  @override
  String get timeRemaining => 'Resterende tijd';

  @override
  String get messagesDeletedForProtection =>
      'Je berichten zijn verwijderd voor je bescherming.';

  @override
  String get canCloseApp => 'Je kunt de app sluiten en later terugkomen.';

  @override
  String get onboardingTitle1 => 'Welkom bij Hash';

  @override
  String get onboardingSubtitle1 => 'De messenger die geen spoor achterlaat';

  @override
  String get onboardingTitle2 => 'Totale versleuteling';

  @override
  String get onboardingSubtitle2 =>
      'Je berichten zijn end-to-end versleuteld met het Signal-protocol';

  @override
  String get onboardingTitle3 => 'Geen spoor';

  @override
  String get onboardingSubtitle3 =>
      'Berichten worden bij aflevering van de servers verwijderd';

  @override
  String get onboardingTitle4 => 'Jouw beveiliging';

  @override
  String get onboardingSubtitle4 => 'PIN-code, Vash-modus en herstelfrase';

  @override
  String get getStarted => 'Aan de slag';

  @override
  String get next => 'Volgende';

  @override
  String get skip => 'Overslaan';

  @override
  String get alreadyHaveAccount => 'Ik heb al een account';

  @override
  String get transferMyAccount => 'Mijn account overzetten';

  @override
  String get createPin => 'Maak een PIN-code aan';

  @override
  String get createPinSubtitle => 'Deze code beschermt de toegang tot je app';

  @override
  String get confirmYourPin => 'Bevestig je PIN-code';

  @override
  String get confirmPinSubtitle => 'Voer je PIN-code opnieuw in';

  @override
  String get saveRecoveryPhrase => 'Herstelfrase';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Schrijf deze 24 woorden op volgorde op. Ze stellen je in staat om je account te herstellen als je je PIN vergeet.';

  @override
  String get phraseWritten => 'Ik heb mijn frase opgeschreven';

  @override
  String get warningRecoveryPhrase =>
      'Als je deze frase verliest en je PIN vergeet, verlies je de toegang tot je account.';

  @override
  String get accountTransferred => 'Account overgezet';

  @override
  String get accountTransferredMessage =>
      'Je account is overgezet naar een ander apparaat. Deze sessie is niet meer geldig.';

  @override
  String get accountTransferredInfo =>
      'Als je deze overdracht niet hebt gestart, is je account mogelijk gecompromitteerd.';

  @override
  String get logout => 'Uitloggen';

  @override
  String get transferAccount => 'Account overzetten';

  @override
  String get transferAccountInfo =>
      'Zet je Hash-account over naar een nieuw apparaat. Je huidige sessie wordt ongeldig gemaakt.';

  @override
  String get generateTransferCode => 'Overdrachtscode genereren';

  @override
  String get transferCode => 'Overdrachtscode';

  @override
  String transferCodeExpires(int minutes) {
    return 'Deze code verloopt over $minutes minuten';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Voer deze code in op je nieuwe apparaat om je account over te zetten.';

  @override
  String get generateNewCode => 'Nieuwe code genereren';

  @override
  String get scanQrCode => 'QR-code scannen';

  @override
  String get scanQrCodeSubtitle =>
      'Scan de QR-code van een contact om ze toe te voegen';

  @override
  String get qrCodeDetected => 'QR-code gedetecteerd';

  @override
  String get invalidQrCode => 'Ongeldige QR-code';

  @override
  String get cameraPermissionRequired => 'Cameratoestemming vereist';

  @override
  String get myQrCode => 'Mijn QR-code';

  @override
  String get myQrCodeSubtitle =>
      'Deel deze QR-code zodat je contacten je kunnen toevoegen';

  @override
  String get shareQrCode => 'Delen';

  @override
  String get addContactTitle => 'Contact toevoegen';

  @override
  String get addContactByHashId => 'Voer de Hash-ID van je contact in';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Zoeken';

  @override
  String get contactNotFound => 'Contact niet gevonden';

  @override
  String get contactAlreadyAdded => 'Dit contact staat al in je lijst';

  @override
  String get contactAdded => 'Contact toegevoegd';

  @override
  String get myProfile => 'Mijn profiel';

  @override
  String get myProfileSubtitle =>
      'Deel deze informatie zodat anderen je kunnen toevoegen';

  @override
  String get temporaryCode => 'Tijdelijke code';

  @override
  String temporaryCodeExpires(String time) {
    return 'Verloopt over $time';
  }

  @override
  String get codeExpired => 'Code verlopen';

  @override
  String get generateNewCodeButton => 'Nieuwe code';

  @override
  String get copyHashId => 'ID kopiëren';

  @override
  String get copyCode => 'Code kopiëren';

  @override
  String get copiedToClipboard => 'Gekopieerd';

  @override
  String get showMyQrCode => 'Mijn QR-code tonen';

  @override
  String get orDivider => 'of';

  @override
  String get openScanner => 'Scanner openen';

  @override
  String get addManually => 'Handmatig toevoegen';

  @override
  String get contactHashIdLabel => 'Hash-ID van contact';

  @override
  String get temporaryCodeLabel => 'Tijdelijke code';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Vraag je contact om een code te genereren vanuit hun profiel';

  @override
  String get verifyAndAdd => 'Verifiëren en toevoegen';

  @override
  String get fillAllFields => 'Vul alle velden in';

  @override
  String get invalidHashIdFormat => 'Ongeldig ID-formaat (bijv.: 123-456-ABC)';

  @override
  String get userNotFound => 'Gebruiker niet gevonden';

  @override
  String get cannotAddYourself => 'Je kunt jezelf niet toevoegen';

  @override
  String get invalidOrExpiredCode => 'Ongeldige of verlopen tijdelijke code';

  @override
  String get contactFound => 'Contact gevonden!';

  @override
  String get howToCallContact => 'Hoe wil je ze noemen?';

  @override
  String get contactNameHint => 'Contactnaam';

  @override
  String get addContactButton => 'Toevoegen';

  @override
  String get contactDetails => 'Contactgegevens';

  @override
  String get contactName => 'Contactnaam';

  @override
  String get contactHashId => 'Hash-ID';

  @override
  String addedOn(String date) {
    return 'Toegevoegd op $date';
  }

  @override
  String get deleteContact => 'Contact verwijderen';

  @override
  String deleteContactConfirm(Object name) {
    return 'Dit contact verwijderen?';
  }

  @override
  String get deleteContactMessage => 'Dit verwijdert ook de hele chat.';

  @override
  String get delete => 'Verwijderen';

  @override
  String get typeMessage => 'Typ een bericht...';

  @override
  String get messageSent => 'Verzonden';

  @override
  String get messageDelivered => 'Afgeleverd';

  @override
  String get messageRead => 'Gelezen';

  @override
  String get messageFailed => 'Verzenden mislukt';

  @override
  String get now => 'Nu';

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
  String get today => 'Vandaag';

  @override
  String get yesterday => 'Gisteren';

  @override
  String dateAtTime(String date, String time) {
    return '$date om $time';
  }

  @override
  String get shareMessage =>
      'Doe mee met Hash! 🔒\n\nHet is een echt privé-messenger: totale versleuteling, geen spoor op servers en paniekmodus indien nodig.\n\nDownload de app hier 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Fout';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Bekijken';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nee';

  @override
  String get save => 'Opslaan';

  @override
  String get edit => 'Bewerken';

  @override
  String get close => 'Sluiten';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get loading => 'Laden...';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Wachtende verzoeken';

  @override
  String get noPendingRequests => 'Geen wachtende verzoeken';

  @override
  String get pendingRequestsSubtitle => 'Deze mensen willen je toevoegen';

  @override
  String requestFromUser(String hashId) {
    return 'Verzoek van $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Verloopt over $days dagen';
  }

  @override
  String get acceptRequest => 'Accepteren';

  @override
  String get rejectRequest => 'Weigeren';

  @override
  String get requestAccepted => 'Verzoek geaccepteerd';

  @override
  String get requestRejected => 'Verzoek geweigerd';

  @override
  String get requestSent => 'Verzoek verzonden!';

  @override
  String get requestSentSubtitle =>
      'Je verzoek is verzonden. De gebruiker moet het accepteren voordat jullie kunnen chatten.';

  @override
  String get requestAlreadyPending => 'Er is al een verzoek in afwachting';

  @override
  String get requestAlreadySentByOther =>
      'Deze persoon heeft je al een verzoek gestuurd';

  @override
  String get addByHashId => 'Toevoegen via Hash-ID';

  @override
  String get addByHashIdSubtitle =>
      'Voer de Hash-ID en tijdelijke code van het contact in';

  @override
  String get enterTemporaryCode => 'Voer de 6-cijferige code in';

  @override
  String get sendRequest => 'Verzoek versturen';

  @override
  String get acceptContactTitle => 'Contact accepteren';

  @override
  String get acceptContactSubtitle => 'Je kunt ze een aangepaste naam geven';

  @override
  String get leaveEmptyForHashId => 'Laat leeg om Hash-ID te gebruiken';

  @override
  String get firstName => 'Voornaam';

  @override
  String get lastName => 'Achternaam';

  @override
  String get notes => 'Notities';

  @override
  String get notesHint => 'Persoonlijke notities over dit contact';

  @override
  String get photoOptional => 'Foto (optioneel)';

  @override
  String get contactNameOptional => 'Naam (optioneel)';

  @override
  String get notesOptional => 'Notities (optioneel)';

  @override
  String get storedLocally => 'Alleen op je apparaat opgeslagen';

  @override
  String get encryptedMessageLabel => 'Versleuteld bericht';

  @override
  String get identityMessageHint => 'Wie ben je? Hoe kennen jullie elkaar?';

  @override
  String get messageWillBeSentEncrypted =>
      'Dit bericht wordt versleuteld en naar de ontvanger gestuurd';

  @override
  String get sendRequestButton => 'Verzoek versturen';

  @override
  String get requestExpiresIn24h =>
      'Verzoek verloopt over 24 uur als het niet wordt geaccepteerd';

  @override
  String get theyAlreadySentYouRequest =>
      'Deze persoon heeft je al een verzoek gestuurd';

  @override
  String get requests => 'Verzoeken';

  @override
  String get receivedRequests => 'Ontvangen';

  @override
  String get sentRequests => 'Verzonden';

  @override
  String get noSentRequests => 'Geen verzonden verzoeken';

  @override
  String get cancelRequest => 'Annuleren';

  @override
  String get deleteRequest => 'Verzoek verwijderen';

  @override
  String get requestCancelled => 'Verzoek geannuleerd';

  @override
  String sentTo(String hashId) {
    return 'Verzonden naar $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Verloopt over $time';
  }

  @override
  String receivedAgo(String time) {
    return '$time geleden ontvangen';
  }

  @override
  String get messageFromRequester => 'Bericht van verzoeker';

  @override
  String get copy => 'Kopiëren';

  @override
  String get messageInfo => 'Berichtinfo';

  @override
  String get messageDirection => 'Richting';

  @override
  String get messageSentByYou => 'Door jou verzonden';

  @override
  String get messageReceived => 'Ontvangen';

  @override
  String get messageSentAt => 'Verzonden op';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Gelezen op';

  @override
  String get messageType => 'Type';

  @override
  String get messageSize => 'Grootte';

  @override
  String get messageExpiresAt => 'Verloopt op';

  @override
  String get messageEncrypted => 'End-to-end versleuteld';

  @override
  String get messageStatusSending => 'Verzenden...';

  @override
  String get messageStatusSent => 'Verzonden';

  @override
  String get messageStatusDelivered => 'Afgeleverd';

  @override
  String get messageStatusRead => 'Gelezen';

  @override
  String get messageStatusFailed => 'Mislukt';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Wacht op aflevering';

  @override
  String get deletedFromServer => 'Verwijderd';

  @override
  String get messageTypeText => 'Tekst';

  @override
  String get messageTypeImage => 'Afbeelding';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Spraak';

  @override
  String get messageTypeFile => 'Bestand';

  @override
  String get indefinitely => 'Onbeperkt';

  @override
  String get hoursShort => 'u';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'uur';

  @override
  String get minutes => 'minuten';

  @override
  String get seconds => 'seconden';

  @override
  String get ephemeralMessages => 'Verdwijnende berichten';

  @override
  String get ephemeralMessagesDescription =>
      'Berichten worden automatisch verwijderd na deze tijd';

  @override
  String get ephemeralImmediate => 'Onmiddellijk (na lezen)';

  @override
  String get ephemeralImmediateDesc => 'Verwijderd zodra gelezen';

  @override
  String get ephemeralMyPreference => 'Mijn voorkeur';

  @override
  String get ephemeralMyPreferenceDesc => 'Algemene instelling gebruiken';

  @override
  String get ephemeralDefaultSetting => 'Berichtduur';

  @override
  String get ephemeralChooseDefault => 'Aanbevolen';

  @override
  String get ephemeral30Seconds => '30 seconden';

  @override
  String get ephemeral30SecondsDesc => 'Verwijderd 30s na lezen';

  @override
  String get ephemeral5Minutes => '5 minuten';

  @override
  String get ephemeral5MinutesDesc => 'Verwijderd 5min na lezen';

  @override
  String get ephemeral1Hour => '1 uur';

  @override
  String get ephemeral1HourDesc => 'Verwijderd 1u na lezen';

  @override
  String get ephemeral3Hours => '3 uur';

  @override
  String get ephemeral6Hours => '6 uur';

  @override
  String get ephemeral6HoursDesc => 'Verwijderd 6u na lezen';

  @override
  String get ephemeral12Hours => '12 uur';

  @override
  String get ephemeral24Hours => '24 uur';

  @override
  String get ephemeral24HoursDesc => 'Verwijderd 24u na lezen';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Aangepaste duur';

  @override
  String get howItWorks => 'Hoe het werkt';

  @override
  String get ephemeralExplanation1 =>
      'Berichten worden van de server verwijderd zodra ze zijn ontvangen.';

  @override
  String get ephemeralExplanation2 =>
      'Deze instelling bepaalt wanneer berichten van JOUW telefoon verdwijnen na het lezen.';

  @override
  String get ephemeralExplanation3 =>
      'Je contact heeft een eigen instelling voor hun telefoon.';

  @override
  String get mute1Hour => '1 uur';

  @override
  String get mute8Hours => '8 uur';

  @override
  String get mute1Day => '1 dag';

  @override
  String get mute1Week => '1 week';

  @override
  String get muteAlways => 'Altijd';

  @override
  String get muteExplanation => 'Je ontvangt geen meldingen voor dit contact';

  @override
  String get showCallsInRecents => 'Tonen in recente oproepen';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash-oproepen verschijnen in de telefoongeschiedenis';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Meldingen dempen';

  @override
  String get muteDescription => 'Je ontvangt geen meldingen voor dit contact';

  @override
  String mutedUntil(String time) {
    return 'Gedempt tot $time';
  }

  @override
  String get notMuted => 'Meldingen ingeschakeld';

  @override
  String get unmute => 'Dempen opheffen';

  @override
  String get notificationSound => 'Meldingsgeluid';

  @override
  String get defaultSound => 'Standaard';

  @override
  String get chatSettings => 'Chatinstellingen';

  @override
  String get bubbleColor => 'Bubbekleur';

  @override
  String get backgroundColor => 'Achtergrondkleur';

  @override
  String get backgroundImage => 'Achtergrondafbeelding';

  @override
  String get chatBackground => 'Chatachtergrond';

  @override
  String get customColor => 'Aangepast';

  @override
  String get defaultColor => 'Standaard';

  @override
  String get imageSelected => 'Afbeelding geselecteerd';

  @override
  String get noImage => 'Geen afbeelding';

  @override
  String get color => 'Kleur';

  @override
  String get image => 'Afbeelding';

  @override
  String get tapToSelectImage => 'Tik om een afbeelding te selecteren';

  @override
  String get changeImage => 'Afbeelding wijzigen';

  @override
  String get previewMessageReceived => 'Hallo!';

  @override
  String get previewMessageSent => 'Hoi!';

  @override
  String get messageAction => 'Bericht';

  @override
  String get callAction => 'Bellen';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Persoonlijke notities';

  @override
  String get addNotes => 'Notities toevoegen...';

  @override
  String get noNotes => 'Geen notities';

  @override
  String get messageNotifications => 'Berichtmeldingen';

  @override
  String get callNotifications => 'Oproepmeldingen';

  @override
  String get useGradient => 'Verloop gebruiken';

  @override
  String get gradientStart => 'Startkleur';

  @override
  String get gradientEnd => 'Eindkleur';

  @override
  String get preview => 'Voorbeeld';

  @override
  String get reset => 'Resetten';

  @override
  String get securityNumber => 'Beveiligingsnummer';

  @override
  String securityNumberDescription(String name) {
    return 'Controleer of het beveiligingsnummer overeenkomt met het apparaat van $name';
  }

  @override
  String get verifyEncryption => 'End-to-end-versleuteling verifiëren';

  @override
  String get tapToCopy => 'Tik om te kopiëren';

  @override
  String get howToVerify => 'Hoe te verifiëren';

  @override
  String get verifyStep1 => 'Ontmoet je contact persoonlijk of bel ze';

  @override
  String get verifyStep2 => 'Vergelijk de beveiligingsnummers of scan QR-codes';

  @override
  String get verifyStep3 => 'Als ze overeenkomen, is je chat beveiligd';

  @override
  String get scanToVerify => 'Scannen om te verifiëren';

  @override
  String get reportSpam => 'Spam melden';

  @override
  String get reportSpamSubtitle => 'Dit contact als spam melden';

  @override
  String get reportSpamDescription =>
      'Dit contact wordt anoniem gemeld. Je identiteit wordt niet gedeeld. Weet je het zeker?';

  @override
  String get report => 'Melden';

  @override
  String get spamReported => 'Spam gemeld';

  @override
  String get reportError =>
      'Rapport kon niet worden verzonden. Probeer het opnieuw.';

  @override
  String get reportRateLimited =>
      'Je hebt het maximale aantal meldingen voor vandaag bereikt.';

  @override
  String get blockContact => 'Contact blokkeren';

  @override
  String get blockContactDescription =>
      'Dit contact kan je geen berichten meer sturen of bellen. Ze worden niet op de hoogte gebracht.';

  @override
  String get unblockContact => 'Contact deblokkeren';

  @override
  String get unblockContactDescription =>
      'Dit contact kan je weer berichten sturen en bellen.';

  @override
  String get contactBlocked => 'Contact geblokkeerd';

  @override
  String get contactUnblocked => 'Contact gedeblokkeerd';

  @override
  String get contactIsBlocked => 'Dit contact is geblokkeerd';

  @override
  String get unblock => 'Deblokkeren';

  @override
  String get deleteContactSubtitle => 'Dit contact en chat verwijderen';

  @override
  String get confirmWithPin => 'Bevestigen met PIN';

  @override
  String get enterPinToConfirm => 'Voer je PIN in om deze actie te bevestigen';

  @override
  String get profilePhoto => 'Profielfoto';

  @override
  String get takePhoto => 'Foto nemen';

  @override
  String get chooseFromGallery => 'Kiezen uit galerij';

  @override
  String get removePhoto => 'Foto verwijderen';

  @override
  String get viewContactHashId => 'Identificatie van contact bekijken';

  @override
  String get hashIdPartiallyMasked =>
      'Gedeeltelijk gemaskeerd voor jouw veiligheid en de privacy van je contact';

  @override
  String get addFirstContact => 'Voeg je eerste contact toe';

  @override
  String get addFirstContactSubtitle =>
      'Deel je QR-code of scan die van een vriend';

  @override
  String get directory => 'Adresboek';

  @override
  String get noContacts => 'Geen contacten';

  @override
  String get noContactsSubtitle => 'Voeg een contact toe om te beginnen';

  @override
  String get sendMessageAction => 'Stuur een bericht';

  @override
  String get audioCall => 'Audiogesprek';

  @override
  String get videoCall => 'Videogesprek';

  @override
  String get viewProfile => 'Profiel bekijken';

  @override
  String get deleteContactDirectory => 'Contact verwijderen';

  @override
  String get scanShort => 'Scannen';

  @override
  String get addShort => 'Toevoegen';

  @override
  String deleteContactConfirmName(String name) {
    return 'Weet je zeker dat je $name wilt verwijderen?';
  }

  @override
  String get noNotesTitle => 'Geen notities';

  @override
  String get noNotesSubtitle => 'Maak je eerste notitie';

  @override
  String get newNote => 'Nieuwe notitie';

  @override
  String get editNote => 'Notitie bewerken';

  @override
  String get deleteNote => 'Notitie verwijderen';

  @override
  String get deleteNoteConfirm =>
      'Weet je zeker dat je deze notitie wilt verwijderen?';

  @override
  String get noteTitle => 'Titel';

  @override
  String get noteContent => 'Inhoud';

  @override
  String get addItem => 'Item toevoegen';

  @override
  String get pinNote => 'Vastpinnen';

  @override
  String get unpinNote => 'Losmaken';

  @override
  String get noteColor => 'Kleur';

  @override
  String get notePassword => 'Wachtwoord';

  @override
  String get setPassword => 'Wachtwoord instellen';

  @override
  String get changePassword => 'Wachtwoord wijzigen';

  @override
  String get removePassword => 'Wachtwoord verwijderen';

  @override
  String get enterPassword => 'Voer wachtwoord in';

  @override
  String get confirmPassword => 'Bevestig wachtwoord';

  @override
  String get passwordPin => 'PIN-code';

  @override
  String get passwordText => 'Tekstwachtwoord';

  @override
  String get protectedNote => 'Beveiligde notitie';

  @override
  String get incorrectPassword => 'Onjuist wachtwoord';

  @override
  String get passwordSet => 'Wachtwoord ingesteld';

  @override
  String get passwordRemoved => 'Wachtwoord verwijderd';

  @override
  String get notesBiometric => 'Face ID voor notities';

  @override
  String get notesBiometricSubtitle =>
      'Biometrische authenticatie vereisen om beveiligde notities te openen';

  @override
  String get textNote => 'Tekstnotitie';

  @override
  String get checklistNote => 'Checklist';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total taken';
  }

  @override
  String get autoSaved => 'Opgeslagen';

  @override
  String get searchNotes => 'Notities zoeken';

  @override
  String get legalConsent => 'Juridische toestemming';

  @override
  String get confirmAge13 => 'Ik bevestig dat ik minstens 13 jaar oud ben';

  @override
  String get acceptLegalStart => 'Ik accepteer het ';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get termsOfService => 'Servicevoorwaarden';

  @override
  String get andThe => ' en de ';

  @override
  String get continueButton => 'Doorgaan';

  @override
  String get mustAcceptTerms =>
      'Je moet beide voorwaarden accepteren om door te gaan';

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
  String get contactSupport => 'Contact opnemen met ondersteuning';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Misbruik melden';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Juridisch';

  @override
  String get legalEntity => 'Juridische entiteit';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Vastpinnen';

  @override
  String get unpinConversation => 'Losmaken';

  @override
  String get hideConversation => 'Verwijderen uit feed';

  @override
  String get deleteConversation => 'Gesprek verwijderen';

  @override
  String get deleteConversationConfirm =>
      'Voer je PIN in om het verwijderen van alle berichten te bevestigen';

  @override
  String get noConversations => 'Nog geen gesprekken';

  @override
  String get startConversation => 'Start';

  @override
  String get microphonePermissionRequired => 'Microfoontoegang vereist';

  @override
  String get microphonePermissionExplanation =>
      'Hash heeft de microfoon nodig om te bellen.';

  @override
  String get cameraPermissionExplanation =>
      'Hash heeft de camera nodig voor videogesprekken.';

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
  String get openSettings => 'Instellingen openen';

  @override
  String get callConnecting => 'Verbinden...';

  @override
  String get callRinging => 'Bellen...';

  @override
  String get callReconnecting => 'Opnieuw verbinden...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Opnieuw verbinden (${seconds}s)';
  }

  @override
  String get callPaused => 'Gepauzeerd';

  @override
  String get callPausedSubtitle => 'Het gesprek is nog actief';

  @override
  String get callRemoteMicMuted => 'Microfoon van contact is gedempt';

  @override
  String get callMiniControlsMute => 'Dempen';

  @override
  String get callMiniControlsUnmute => 'Dempen opheffen';

  @override
  String get callMiniControlsHangUp => 'Ophangen';

  @override
  String get callMiniControlsReturn => 'Terug naar gesprek';

  @override
  String get callNetworkPoor => 'Instabiele verbinding';

  @override
  String get callNetworkLost => 'Verbinding verloren';

  @override
  String get callEndedTitle => 'Gesprek beëindigd';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Apparaatgegevens';

  @override
  String get deviceDataSubtitle => 'Lokale en serveropslag';

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
  String get localStorage => 'Lokale opslag';

  @override
  String get onThisDevice => 'op dit apparaat';

  @override
  String get encryptedDatabases => 'Versleutelde databases';

  @override
  String get files => 'Bestanden';

  @override
  String get secureKeychain => 'Beveiligde sleutelhanger';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Namen, avatars, Signal-sleutels';

  @override
  String get messagesDetail => 'Versleutelde gesprekken';

  @override
  String get notesDetail => 'Persoonlijke notities';

  @override
  String get signalSessions => 'Signal-sessies';

  @override
  String get signalSessionsDetail => 'Versleutelingssessies';

  @override
  String get pendingContacts => 'Wachtende contacten';

  @override
  String get pendingContactsDetail => 'Lopende verzoeken';

  @override
  String get callHistory => 'Oproepen';

  @override
  String get callHistoryDetail => 'Oproepgeschiedenis';

  @override
  String get preferences => 'Voorkeuren';

  @override
  String get preferencesDetail => 'Media- en oproepvoorkeuren';

  @override
  String get avatars => 'Avatars';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bestanden',
      one: '1 bestand',
      zero: 'geen bestanden',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Actief';

  @override
  String get notDefined => 'Niet gedefinieerd';

  @override
  String get biometrics => 'Biometrie';

  @override
  String get recoveryPhrase => 'Herstelfrase';

  @override
  String get identity => 'Identiteit (Hash-ID)';

  @override
  String get signalKeys => 'Signal Protocol-sleutels';

  @override
  String get authTokens => 'Authenticatietokens';

  @override
  String get contactNamesCache => 'Contactnamencache';

  @override
  String get remoteConfig => 'Externe configuratie';

  @override
  String get notificationPrefs => 'Meldingsvoorkeuren';

  @override
  String get serverData => 'Servergegevens';

  @override
  String get serverDataInfo =>
      'Hash bewaart minimale gegevens op de server, allemaal versleuteld of tijdelijk.';

  @override
  String get serverProfile => 'Profiel';

  @override
  String get serverProfileDetail => 'Hash-ID, openbare sleutels, mailboxtoken';

  @override
  String get serverPrekeys => 'Pre-sleutels';

  @override
  String get serverPrekeysDetail => 'Eenmalige Signal-sleutels (verbruikt)';

  @override
  String get serverMessages => 'Berichten onderweg';

  @override
  String get serverMessagesDetail => 'Verwijderd na aflevering (max 24u)';

  @override
  String get serverMedia => 'Media onderweg';

  @override
  String get serverMediaDetail => 'Verwijderd na download';

  @override
  String get serverContactRequests => 'Contactverzoeken';

  @override
  String get serverContactRequestsDetail => 'Verlopen na 24u';

  @override
  String get serverRateLimits => 'Snelheidslimieten';

  @override
  String get serverRateLimitsDetail => 'Tijdelijke anti-misbruikgegevens';

  @override
  String get privacyReassurance =>
      'Hash kan je berichten niet lezen. Alle gegevens zijn end-to-end versleuteld. Servergegevens worden automatisch verwijderd.';

  @override
  String get pinTooSimple =>
      'Deze PIN is te eenvoudig. Kies een veiligere code.';

  @override
  String get genericError => 'Er is een fout opgetreden. Probeer het opnieuw.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Kan account niet aanmaken: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frase gekopieerd naar klembord';

  @override
  String get copyPhrase => 'Frase kopiëren';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Schrijf deze frase op een veilige plaats op. Als je je PIN verliest zonder deze frase, verlies je permanent de toegang tot je gegevens.';

  @override
  String get noMessages => 'Geen berichten';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Alle berichten met $name verwijderen?';
  }

  @override
  String get confirmation => 'Bevestiging';

  @override
  String get untitled => 'Zonder titel';

  @override
  String get noSessions => 'Geen sessies';

  @override
  String get unknownContact => 'Onbekend contact';

  @override
  String get unnamed => 'Naamloos';

  @override
  String get noPendingRequestsAlt => 'Geen wachtende verzoeken';

  @override
  String get deleteAllCallHistory => 'Alle oproepgeschiedenis verwijderen?';

  @override
  String get noCalls => 'Geen oproepen';

  @override
  String get noPreferences => 'Geen voorkeuren';

  @override
  String get resetAllMediaPrefs => 'Alle mediavoorkeuren resetten?';

  @override
  String get deleteThisAvatar => 'Deze avatar verwijderen?';

  @override
  String get deleteAllAvatars => 'Alle avatars verwijderen?';

  @override
  String get noAvatars => 'Geen avatars';

  @override
  String get deleteThisFile => 'Dit bestand verwijderen?';

  @override
  String get deleteAllMediaFiles => 'Alle media verwijderen?';

  @override
  String get noMediaFiles => 'Geen media';

  @override
  String get outgoing => 'Uitgaand';

  @override
  String get incoming => 'Inkomend';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Verdwijnende weergave: ${seconds}s';
  }

  @override
  String get normalView => 'Normale weergave';

  @override
  String get callReasonCompleted => 'Voltooid';

  @override
  String get callReasonMissed => 'Gemist';

  @override
  String get callReasonDeclined => 'Geweigerd';

  @override
  String get callReasonFailed => 'Mislukt';

  @override
  String get justNow => 'Zojuist';

  @override
  String timeAgoMinutes(int count) {
    return '$count min geleden';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}u geleden';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}d geleden';
  }

  @override
  String get messageTypeContact => 'Contact';

  @override
  String get messageTypeLocation => 'Locatie';

  @override
  String get statusQueued => 'In wachtrij';

  @override
  String get blockedBadge => 'Geblokkeerd';

  @override
  String get protectedBadge => 'Beveiligd';

  @override
  String messageCount(int count) {
    return '$count bericht(en)';
  }

  @override
  String get deleteQuestion => 'Verwijderen?';

  @override
  String get transferMyAccountTitle => 'Mijn account overzetten';

  @override
  String get loadingError => 'Laadfout';

  @override
  String get transferToNewDevice => 'Overzetten naar een nieuw apparaat';

  @override
  String get transferInstructions =>
      'Kies op je nieuwe apparaat \"Mijn account herstellen\" en voer deze informatie in:';

  @override
  String get yourHashIdLabel => 'Je Hash-ID';

  @override
  String get enterYourPinCode => 'Voer je PIN-code in';

  @override
  String get pinOwnerConfirmation =>
      'Om te bevestigen dat je de eigenaar van dit account bent';

  @override
  String get scanThisQrCode => 'Scan deze QR-code';

  @override
  String get withYourNewDevice => 'Met je nieuwe apparaat';

  @override
  String get orEnterTheCode => 'of voer de code in';

  @override
  String get transferCodeLabel => 'Overdrachtscode';

  @override
  String get proximityVerification => 'Nabijheidsverificatie';

  @override
  String get bringDevicesCloser => 'Breng beide apparaten dichterbij';

  @override
  String get confirmTransferQuestion => 'Overdracht bevestigen?';

  @override
  String get accountWillBeTransferred =>
      'Je account wordt overgezet naar het nieuwe apparaat.\n\nDit apparaat wordt permanent losgekoppeld.';

  @override
  String get transferComplete => 'Overdracht voltooid';

  @override
  String get transferSuccessMessage =>
      'Je account is succesvol overgezet.\n\nDeze applicatie wordt nu gesloten.';

  @override
  String get manualVerification => 'Handmatige verificatie';

  @override
  String get codeDisplayedOnBothDevices =>
      'Code weergegeven op beide apparaten:';

  @override
  String get doesCodeMatchNewDevice =>
      'Komt deze code overeen met die op het nieuwe apparaat?';

  @override
  String get verifiedStatus => 'Geverifieerd';

  @override
  String get inProgressStatus => 'Bezig...';

  @override
  String get notAvailableStatus => 'Niet beschikbaar';

  @override
  String get codeExpiredRestart => 'De code is verlopen. Begin opnieuw.';

  @override
  String get codesDoNotMatchCancelled =>
      'De codes komen niet overeen. Overdracht geannuleerd.';

  @override
  String transferToDevice(String device) {
    return 'Naar: $device';
  }

  @override
  String get copiedExclamation => 'Gekopieerd!';

  @override
  String expiresInTime(String time) {
    return 'Verloopt over $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrie is niet beschikbaar op dit apparaat';

  @override
  String get biometricAuthError => 'Fout bij biometrische authenticatie';

  @override
  String get authenticateForBiometric =>
      'Authenticeer om biometrie te activeren';

  @override
  String get biometricAuthFailed => 'Biometrische authenticatie mislukt';

  @override
  String get forceUpdateTitle => 'Update vereist';

  @override
  String get forceUpdateMessage =>
      'Een nieuwe versie van Hash is beschikbaar. Update om door te gaan.';

  @override
  String get updateButton => 'Updaten';

  @override
  String get maintenanceInProgress => 'Onderhoud bezig';

  @override
  String get tryAgainLater => 'Probeer het later opnieuw';

  @override
  String get information => 'Informatie';

  @override
  String get later => 'Later';

  @override
  String get doYouLikeHash => 'Vind je Hash leuk?';

  @override
  String get yourFeedbackHelps => 'Je feedback helpt ons de app te verbeteren';

  @override
  String get ratingTerrible => 'Verschrikkelijk';

  @override
  String get ratingBad => 'Slecht';

  @override
  String get ratingOk => 'Oké';

  @override
  String get ratingGood => 'Goed';

  @override
  String get ratingExcellent => 'Uitstekend!';

  @override
  String get donationMessage =>
      'Hash is een project zonder winstoogmerk. Jouw steun helpt ons een echt privé-messenger te blijven bouwen.';

  @override
  String get recentConnections => 'Recente verbindingen';

  @override
  String get loginInfoText =>
      'Elke PIN-ontgrendeling wordt lokaal geregistreerd. Alleen de laatste 24 uur worden bewaard.';

  @override
  String get connectionCount => 'Verbinding(en)';

  @override
  String get periodLabel => 'Periode';

  @override
  String get historyLabel => 'Geschiedenis';

  @override
  String get noLoginRecorded => 'Geen login geregistreerd';

  @override
  String get nextUnlocksAppearHere =>
      'Volgende ontgrendelingen verschijnen hier.';

  @override
  String get dataLocalOnly =>
      'Deze gegevens worden alleen op je apparaat opgeslagen en worden nooit verzonden.';

  @override
  String get currentSession => 'Huidig';

  @override
  String get todayLabel => 'Vandaag';

  @override
  String get yesterdayLabel => 'Gisteren';

  @override
  String get justNowLabel => 'Zojuist';

  @override
  String minutesAgoLabel(int count) {
    return '$count min geleden';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}u geleden';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}u ${minutes}min geleden';
  }

  @override
  String get noMaintenancePlanned => 'Geen onderhoud gepland';

  @override
  String get everythingWorkingNormally => 'Alles werkt normaal';

  @override
  String get maintenanceTitle => 'Onderhoud';

  @override
  String get maintenanceActiveLabel => 'BEZIG';

  @override
  String get maintenancePlannedLabel => 'GEPLAND';

  @override
  String get locking => 'Vergrendelen...';

  @override
  String get newMessageNotification => 'Nieuw bericht';

  @override
  String get secExplainTitle => 'Hoe Hash je beschermt';

  @override
  String get secExplainIntro =>
      'Hash is ontworpen zodat niemand je berichten kan lezen.';

  @override
  String get secExplainIntroSub =>
      'Zelfs wij niet.\nZo werkt het, eenvoudig uitgelegd.';

  @override
  String get secJourneyLabel => 'DE REIS';

  @override
  String get secJourneyTitle => 'De reis van je bericht';

  @override
  String get secJourneySubtitle =>
      'Van je vinger tot het scherm van je contact, elke stap is beschermd. Volg het pad.';

  @override
  String get secStep1Title => 'Je schrijft je bericht';

  @override
  String get secStep1Desc =>
      'Je typt \"Hoi!\" in de app. Op dit moment bestaat het bericht alleen in het geheugen van je telefoon. Er is niets verzonden.';

  @override
  String get secStep2Title => 'Versleuteling met Signal Protocol';

  @override
  String get secStep2Desc =>
      'Zodra je op \"Verzenden\" drukt, wordt je bericht omgezet in een reeks onbegrijpelijke tekens. Het is alsof je bericht in een kluis is opgesloten waarvan alleen je contact de sleutel heeft.';

  @override
  String get secStep3Title => 'Sealed Sender: de onzichtbare envelop';

  @override
  String get secStep3Desc =>
      'Stel je voor dat je een brief per post verstuurt, maar zonder afzender op de envelop. Dat is precies wat Hash doet. Het bericht wordt in een anonieme brievenbus gedeponeerd. De server weet niet wie het heeft verstuurd.';

  @override
  String get secStep4Title => 'De server ziet niets';

  @override
  String get secStep4Desc =>
      'De server fungeert als een blinde postbode. Het weet alleen dat \"iemand iets in brievenbus #A7X9 heeft gedeponeerd\". Het weet niet wie het heeft gestuurd, wat het is of voor wie het is.';

  @override
  String get secStep4Highlight =>
      'Geen metadata opgeslagen: geen IP-adres, geen tijdstempel, geen link tussen afzender en ontvanger.';

  @override
  String get secStep5Title => 'Je contact ontvangt het bericht';

  @override
  String get secStep5Desc =>
      'De telefoon van je contact haalt de inhoud op uit hun anonieme brievenbus en ontsleutelt het bericht met hun privésleutel, die nooit hun apparaat heeft verlaten. \"Hoi!\" verschijnt op hun scherm.';

  @override
  String get secStep6Title => 'Het bericht verdwijnt van de server';

  @override
  String get secStep6Desc =>
      'Zodra je contact de ontvangst bevestigt, verwijdert de server het bericht permanent. Geen prullenbak, geen archief, geen back-up. Zelfs ongelezen berichten worden automatisch vernietigd na 24 uur.';

  @override
  String get secStep7Title => 'Lokale verlooptijd';

  @override
  String get secStep7Desc =>
      'Op de telefoon van je contact vernietigt het bericht zichzelf volgens de duur die je hebt gekozen: direct na lezen, 5 minuten, 1 uur... jij beslist.';

  @override
  String get secJourneyConclusion =>
      'Resultaat: geen spoor op de server, geen spoor op apparaten. Het bericht bestond net lang genoeg om gelezen te worden en verdween toen.';

  @override
  String get secArchLabel => 'ARCHITECTUUR';

  @override
  String get secArchTitle => '5 lagen bescherming';

  @override
  String get secArchSubtitle =>
      'Hash vertrouwt niet op één enkele technologie. Elke laag versterkt de andere. Zelfs als één laag wordt gecompromitteerd, blijven je gegevens veilig.';

  @override
  String get secLayer1Title => 'End-to-end-versleuteling';

  @override
  String get secLayer1Desc =>
      'Elk bericht wordt versleuteld met een unieke sleutel. Simpel gezegd: zelfs als iemand één bericht ontsleutelt, kan diegene het volgende niet ontsleutelen. Elk bericht heeft zijn eigen slot.';

  @override
  String get secLayer1Detail =>
      'Voor bestanden (foto\'s, video\'s, documenten) gebruikt Hash extra AES-256-GCM-versleuteling. Het bestand wordt versleuteld voordat het je telefoon verlaat.';

  @override
  String get secLayer2Title => 'Sealed Sender (netwerkanonimiteit)';

  @override
  String get secLayer2Desc =>
      'Gewone messengers sturen je berichten met je identiteit erbij. Het is alsof je je naam op de envelop schrijft. Hash gebruikt anonieme brievenbussen: de server bezorgt het bericht zonder te weten wie het heeft gestuurd.';

  @override
  String get secLayer2Detail =>
      'Resultaat: zelfs bij een serverdatalek is het onmogelijk te reconstrueren wie met wie praat.';

  @override
  String get secLayer3Title => 'Automatische verwijdering';

  @override
  String get secLayer3Desc =>
      'Berichten worden van de server verwijderd zodra ontvangst is bevestigd. Zelfs als een bericht nooit wordt opgehaald, wordt het automatisch vernietigd na 24 uur.';

  @override
  String get secLayer3Detail =>
      'Op je telefoon vernietigen berichten zichzelf volgens de duur die je kiest: onmiddellijk, 5 min, 15 min, 30 min, 1u, 3u, 6u of 12u.';

  @override
  String get secLayer4Title => 'Lokale toegangsbescherming';

  @override
  String get secLayer4Desc =>
      'De app is beveiligd met een 6-cijferige PIN-code en/of biometrie (Face ID, vingerafdruk). Na te veel mislukte pogingen wordt de app vergrendeld met een toenemende vertraging na elke mislukking.';

  @override
  String get secLayer5Title => 'Vergrendelde database';

  @override
  String get secLayer5Desc =>
      'Aan de serverzijde kan geen enkele gebruiker rechtstreeks naar de database schrijven. Alle acties verlopen via beveiligde functies die elk verzoek verifiëren.';

  @override
  String get secLayer5Detail =>
      'Het is als een bankbalie: je raakt nooit zelf de kluis aan. Je doet een verzoek en het systeem controleert of je het recht hebt voordat het handelt.';

  @override
  String get secVashLabel => 'UNIEK IN DE WERELD';

  @override
  String get secVashTitle => 'Vash-modus';

  @override
  String get secVashSubtitle =>
      'Een noodbeveiligingssysteem dat in geen enkele andere messaging-app bestaat.';

  @override
  String get secVashScenarioTitle => 'Stel je deze situatie voor';

  @override
  String get secVashScenario1 => 'Iemand krijgt toegang tot je telefoon';

  @override
  String get secVashScenario2 => 'Je wordt gevraagd om je PIN-code';

  @override
  String get secVashScenario3 => 'Je wilt al je gegevens dringend wissen';

  @override
  String get secVashSolutionTitle => 'De oplossing: twee PIN-codes';

  @override
  String get secVashSolutionDesc =>
      'Je configureert twee verschillende PIN-codes in Hash:';

  @override
  String get secVashNormalCodeLabel => 'Normale code';

  @override
  String get secVashNormalCodeDesc => 'Opent de app normaal met al je gegevens';

  @override
  String get secVashCodeLabel2 => 'Vash-code';

  @override
  String get secVashCodeDescription =>
      'Opent de app normaal... maar al je gegevens worden stil op de achtergrond verwijderd';

  @override
  String get secVashWhatHappensTitle => 'Wat er daarna gebeurt';

  @override
  String get secVashWhatHappensDesc =>
      'De app opent normaal. Geen melding, geen verdachte animatie. Het scherm toont gewoon een lege app, alsof je het net hebt geïnstalleerd.\n\nIn werkelijkheid zijn al je gesprekken, contacten en berichten onomkeerbaar verwijderd in een fractie van een seconde.';

  @override
  String get secCallsLabel => 'OPROEPEN & BESTANDEN';

  @override
  String get secCallsTitle => 'Alles is versleuteld';

  @override
  String get secCallsSubtitle =>
      'Het zijn niet alleen berichten. Absoluut alles dat door Hash gaat is end-to-end versleuteld.';

  @override
  String get secAudioCallTitle => 'Audiogesprekken';

  @override
  String get secAudioCallDesc =>
      'End-to-end versleuteld via WebRTC. Spraak wordt rechtstreeks tussen apparaten verzonden.';

  @override
  String get secVideoCallTitle => 'Videogesprekken';

  @override
  String get secVideoCallDesc =>
      'Dezelfde technologie, elke stream individueel versleuteld.';

  @override
  String get secPhotosTitle => 'Foto\'s en video\'s';

  @override
  String get secPhotosDesc =>
      'Versleuteld in AES-256-GCM voordat ze je telefoon verlaten.';

  @override
  String get secDocsTitle => 'Documenten';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, elk bestand. Naam, grootte en inhoud versleuteld.';

  @override
  String get secAnonLabel => 'ANONIMITEIT';

  @override
  String get secAnonTitle => 'Geen identiteit vereist';

  @override
  String get secAnonSubtitle =>
      'Hash vraagt nooit om je telefoonnummer of e-mailadres. Je wordt geïdentificeerd door een unieke en anonieme Hash-ID.';

  @override
  String get secHashIdTitle => 'Je Hash-ID';

  @override
  String get secHashIdDesc =>
      'Dit is je unieke identificatiecode. Het onthult niets over jou: niet je naam, niet je nummer, niet je locatie. Het is als een pseudoniem dat onmogelijk te koppelen is aan je echte identiteit.\n\nOm een contact toe te voegen, deel je je Hash-ID of scan je een QR-code. Dat is alles. Geen gesynchroniseerd adresboek, geen \"Mensen die je misschien kent\"-suggesties.';

  @override
  String get secDataLabel => 'GEGEVENS';

  @override
  String get secDataTitle => 'Wat Hash niet weet';

  @override
  String get secDataSubtitle =>
      'De beste manier om je gegevens te beschermen is ze niet te verzamelen.';

  @override
  String get secNeverCollected => 'Nooit verzameld';

  @override
  String get secNeverItem1 => 'Berichtinhoud';

  @override
  String get secNeverItem2 => 'Contactenlijst';

  @override
  String get secNeverItem3 => 'Telefoonnummer';

  @override
  String get secNeverItem4 => 'E-mailadres';

  @override
  String get secNeverItem5 => 'IP-adres';

  @override
  String get secNeverItem6 => 'Locatie';

  @override
  String get secNeverItem7 => 'Metadata (wie praat met wie)';

  @override
  String get secNeverItem8 => 'Oproepgeschiedenis';

  @override
  String get secNeverItem9 => 'Adresboek';

  @override
  String get secNeverItem10 => 'Advertentie-identificatoren';

  @override
  String get secTempStored => 'Tijdelijk opgeslagen';

  @override
  String get secTempItem1 => 'Anonieme Hash-ID (unieke identificatiecode)';

  @override
  String get secTempItem2 => 'Openbare versleutelingssleutels';

  @override
  String get secTempItem3 => 'Versleutelde berichten onderweg (max 24u)';

  @override
  String get secTempNote =>
      'Zelfs deze minimale gegevens kunnen je niet identificeren. Je Hash-ID is niet gekoppeld aan persoonlijke informatie.';

  @override
  String get secFooterTitle => 'Jouw privacy, jouw vrijheid';

  @override
  String get secFooterDesc =>
      'Hash gebruikt dezelfde versleutelingstechnologieën als de meest veeleisende professionele applicaties. Je berichten worden beschermd door wiskunde, niet door beloften.';

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
