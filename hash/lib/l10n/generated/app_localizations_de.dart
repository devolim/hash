// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Keine Spuren. Keine Kompromisse.';

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
  String get contacts => 'Kontakte';

  @override
  String get noConversation => 'Keine Chats';

  @override
  String get noConversationSubtitle =>
      'Füge einen Kontakt hinzu, um sicher zu chatten';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count eingegangene Anfragen',
      one: '1 eingegangene Anfrage',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gesendete Anfragen ausstehend',
      one: '1 gesendete Anfrage ausstehend',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Kontakt hinzufügen';

  @override
  String get shareApp => 'App teilen';

  @override
  String get newMessage => 'Neue Nachricht';

  @override
  String get newConversation => 'Nachricht senden';

  @override
  String get settings => 'Einstellungen';

  @override
  String get myHashId => 'Meine Hash ID';

  @override
  String get supportHash => 'Hash unterstützen';

  @override
  String get supportHashSubtitle => 'Hash ist ein gemeinnütziges Projekt';

  @override
  String get donate => 'Spenden';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get theme => 'Design';

  @override
  String get themeAuto => 'Automatisch';

  @override
  String get themeAutoSubtitle => 'Folgt den Systemeinstellungen';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeRecommendation =>
      'Das dunkle Design wird für mehr Privatsphäre empfohlen';

  @override
  String get language => 'Sprache';

  @override
  String get languageAuto => 'Automatisch (System)';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get messages => 'Nachrichten';

  @override
  String get calls => 'Anrufe';

  @override
  String get vibration => 'Vibration';

  @override
  String get notificationContent => 'Benachrichtigungsinhalt';

  @override
  String get notificationContentFull => 'Alles anzeigen';

  @override
  String get notificationContentFullDesc =>
      'Kontaktname und Nachrichtenvorschau';

  @override
  String get notificationContentName => 'Nur Name';

  @override
  String get notificationContentNameDesc => 'Zeigt nur den Kontaktnamen';

  @override
  String get notificationContentDiscrete => 'Diskret';

  @override
  String get notificationContentDiscreteDesc => 'Zeigt nur \"Neue Nachricht\"';

  @override
  String get security => 'Sicherheit';

  @override
  String get howHashProtectsYou => 'Wie Hash dich schützt';

  @override
  String get howHashProtectsYouSubtitle => 'Verstehe deine Sicherheit';

  @override
  String get accountSecurity => 'Kontosicherheit';

  @override
  String get accountSecuritySubtitle => 'PIN, Biometrie, Vash-Modus';

  @override
  String get blockScreenshots => 'Screenshots blockieren';

  @override
  String get transferDevice => 'Auf anderes Gerät übertragen';

  @override
  String get transferDeviceSubtitle => 'Konto migrieren';

  @override
  String get pinCode => 'PIN-Code';

  @override
  String get changePin => 'PIN-Code ändern';

  @override
  String get currentPin => 'Aktueller PIN-Code';

  @override
  String get newPin => 'Neuer PIN-Code';

  @override
  String get confirmPin => 'PIN-Code bestätigen';

  @override
  String get pinChanged => 'PIN-Code geändert';

  @override
  String get incorrectPin => 'Falscher PIN';

  @override
  String get pinsDoNotMatch => 'PINs stimmen nicht überein';

  @override
  String get autoLock => 'Automatische Sperre';

  @override
  String get autoLockDelay => 'Sperrverzögerung';

  @override
  String get autoLockImmediate => 'Sofort';

  @override
  String get autoLockMinute => '1 Minute';

  @override
  String autoLockMinutes(int count) {
    return '$count Minuten';
  }

  @override
  String get vashCode => 'Vash-Code';

  @override
  String get vashModeTitle => 'Vash-Modus';

  @override
  String get vashModeExplanation => 'Dein ultimatives Sicherheitsnetz.';

  @override
  String get vashModeDescription =>
      'Du wählst einen zweiten PIN-Code. Wenn du jemals gezwungen wirst, Hash zu öffnen, gib diesen Code anstelle deiner regulären PIN ein.\n\nDie App öffnet sich normal, aber alle deine Gespräche und Kontakte sind verschwunden.\n\nFür jeden, der auf deinen Bildschirm schaut, erscheint Hash einfach leer — als hättest du es nie benutzt.';

  @override
  String get vashModeIrreversible =>
      'Diese Aktion ist lautlos und unwiderruflich.';

  @override
  String get chooseVashCode => 'Meinen Vash-Code wählen';

  @override
  String get vashCodeInfo =>
      'Ein zweiter PIN-Code, der die App normal öffnet, aber leer.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Wenn du diesen Code anstelle deiner PIN eingibst:';

  @override
  String get vashDeleteContacts => 'Deine Kontakte verschwinden';

  @override
  String get vashDeleteMessages => 'Deine Gespräche verschwinden';

  @override
  String get vashDeleteHistory => 'Deine Notizen verschwinden';

  @override
  String get vashKeepId => 'Deine Hash-Identität (#XXX-XXX-XXX) bleibt gleich';

  @override
  String get vashAppearNormal =>
      'Die App erscheint normal, aber leer, wie neu. Diese Aktion ist unwiderruflich.';

  @override
  String get setupVashCode => 'Vash-Code einrichten';

  @override
  String get modifyVashCode => 'Vash-Code ändern';

  @override
  String get currentVashCode => 'Aktueller Vash-Code';

  @override
  String get newVashCode => 'Neuer Vash-Code';

  @override
  String get confirmVashCode => 'Vash-Code bestätigen';

  @override
  String get vashCodeConfigured => 'Vash-Code eingerichtet';

  @override
  String get vashCodeModified => 'Vash-Code geändert';

  @override
  String get vashCodeMustDiffer =>
      'Der Vash-Code muss sich von der PIN unterscheiden';

  @override
  String get incorrectVashCode => 'Falscher Vash-Code';

  @override
  String get vashWhatToDelete => 'Was soll der Vash-Modus verschwinden lassen?';

  @override
  String get vashDeleteContactsOption => 'Kontakte';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Nachrichten';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notizen';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash-Modus aktiviert';

  @override
  String get vashCreateSubtitle =>
      'Wähle einen Code, der sich von deiner Haupt-PIN unterscheidet';

  @override
  String get vashConfirmSubtitle => 'Bestätige deinen Vash-Code';

  @override
  String get pinCodeForEntry => 'PIN-Code zum Öffnen der App';

  @override
  String get vashCodeSection => 'Vash-Modus';

  @override
  String get biometric => 'Biometrie';

  @override
  String get biometricUnlock => 'Mit Fingerabdruck oder Face ID entsperren';

  @override
  String get enableBiometric => 'Biometrie aktivieren';

  @override
  String get biometricWarningMessage =>
      'Wenn du die Biometrie aktivierst, kannst du deinen Vash-Code nicht mehr zum Öffnen der App verwenden.\n\nDu kannst den Vash-Code nur verwenden, wenn die Biometrie fehlschlägt (nach mehreren fehlgeschlagenen Versuchen).\n\nBist du sicher, dass du fortfahren möchtest?';

  @override
  String get understood => 'Verstanden';

  @override
  String get shareAppSubtitle => 'Teile Hash mit deinen Liebsten';

  @override
  String get share => 'Teilen';

  @override
  String get danger => 'Gefahr';

  @override
  String get deleteAccount => 'Mein Konto löschen';

  @override
  String get deleteAccountSubtitle => 'Unwiderrufliche Aktion';

  @override
  String get deleteAccountConfirmTitle => 'Mein Konto löschen';

  @override
  String get deleteAccountConfirmMessage =>
      'Dein Konto wird dauerhaft gelöscht. Diese Aktion ist unwiderruflich.\n\n• Alle deine Chats\n• Alle deine Kontakte\n• Deine Hash ID\n\nDu musst ein neues Konto erstellen.';

  @override
  String get deleteForever => 'Dauerhaft löschen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash-Modus aktiviert.';

  @override
  String deletionError(String error) {
    return 'Löschfehler: $error';
  }

  @override
  String get yourSecurity => 'Deine Sicherheit';

  @override
  String get securityInfo =>
      '• Ende-zu-Ende-Verschlüsselung (Signal-Protokoll)\n• Keine Daten auf unseren Servern nach Zustellung\n• Schlüssel nur auf deinem Gerät gespeichert\n• PIN-Code wird nie an Server gesendet';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Willkommen';

  @override
  String get securityStatement1 => 'Deine Nachrichten sind geschützt.';

  @override
  String get securityStatement2 => 'Ende-zu-Ende-Verschlüsselung.';

  @override
  String get securityStatement3 => 'Keine Spuren. Keine Kompromisse.';

  @override
  String get securityStatement4 => 'Deine Privatsphäre ist ein Recht.';

  @override
  String get accessBlocked => 'Zugang gesperrt';

  @override
  String get tooManyAttempts => 'Zu viele Versuche. Versuche es später erneut.';

  @override
  String get pleaseWait => 'Bitte warten';

  @override
  String get waitDelay => 'Bitte warte bis die Zeit abgelaufen ist';

  @override
  String attemptCount(int current, int max) {
    return 'Versuch $current von $max';
  }

  @override
  String retryIn(String time) {
    return 'Erneut versuchen in $time';
  }

  @override
  String get forgotPin => 'PIN vergessen? Wiederherstellungsphrase verwenden';

  @override
  String get useRecoveryPhrase => 'Wiederherstellungsphrase verwenden';

  @override
  String get recoveryWarningTitle => 'Achtung';

  @override
  String get recoveryWarningMessage => 'Die Kontowiederherstellung wird:';

  @override
  String get recoveryDeleteAllMessages => 'ALLE deine Nachrichten löschen';

  @override
  String get recoveryWaitDelay => 'Eine 1-stündige Wartezeit erfordern';

  @override
  String get recoveryKeepContacts => 'Deine Kontakte behalten';

  @override
  String get recoveryIrreversible =>
      'Diese Aktion ist unwiderruflich. Deine Nachrichten gehen dauerhaft verloren.';

  @override
  String get iUnderstand => 'Ich verstehe';

  @override
  String get accountRecovery => 'Kontowiederherstellung';

  @override
  String get enterRecoveryPhrase =>
      'Gib die 24 Wörter deiner Wiederherstellungsphrase ein, getrennt durch Leerzeichen.';

  @override
  String get recoveryPhraseHint => 'wort1 wort2 wort3 ...';

  @override
  String get recover => 'Wiederherstellen';

  @override
  String get recoveryPhraseRequired =>
      'Bitte gib deine Wiederherstellungsphrase ein';

  @override
  String get recoveryPhrase24Words =>
      'Die Phrase muss genau 24 Wörter enthalten';

  @override
  String get incorrectRecoveryPhrase => 'Falsche Wiederherstellungsphrase';

  @override
  String get recoveryInitError =>
      'Fehler beim Initialisieren der Wiederherstellung';

  @override
  String get securityDelay => 'Sicherheitsverzögerung';

  @override
  String get securityDelayMessage =>
      'Zu deiner Sicherheit ist eine Wartezeit erforderlich, bevor du eine neue PIN erstellen kannst.';

  @override
  String get timeRemaining => 'Verbleibende Zeit';

  @override
  String get messagesDeletedForProtection =>
      'Deine Nachrichten wurden zu deinem Schutz gelöscht.';

  @override
  String get canCloseApp =>
      'Du kannst die App schließen und später zurückkommen.';

  @override
  String get onboardingTitle1 => 'Willkommen bei Hash';

  @override
  String get onboardingSubtitle1 =>
      'Der Messenger, der keine Spuren hinterlässt';

  @override
  String get onboardingTitle2 => 'Vollständige Verschlüsselung';

  @override
  String get onboardingSubtitle2 =>
      'Deine Nachrichten sind mit dem Signal-Protokoll Ende-zu-Ende verschlüsselt';

  @override
  String get onboardingTitle3 => 'Keine Spuren';

  @override
  String get onboardingSubtitle3 =>
      'Nachrichten werden nach Zustellung von den Servern gelöscht';

  @override
  String get onboardingTitle4 => 'Deine Sicherheit';

  @override
  String get onboardingSubtitle4 =>
      'PIN-Code, Vash-Modus und Wiederherstellungsphrase';

  @override
  String get getStarted => 'Los geht\'s';

  @override
  String get next => 'Weiter';

  @override
  String get skip => 'Überspringen';

  @override
  String get alreadyHaveAccount => 'Ich habe bereits ein Konto';

  @override
  String get transferMyAccount => 'Mein Konto übertragen';

  @override
  String get createPin => 'PIN-Code erstellen';

  @override
  String get createPinSubtitle =>
      'Dieser Code schützt den Zugang zu deiner App';

  @override
  String get confirmYourPin => 'Bestätige deinen PIN-Code';

  @override
  String get confirmPinSubtitle => 'Gib deinen PIN-Code erneut ein';

  @override
  String get saveRecoveryPhrase => 'Wiederherstellungsphrase';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Schreibe diese 24 Wörter der Reihe nach auf. Sie ermöglichen dir die Wiederherstellung deines Kontos, falls du deine PIN vergisst.';

  @override
  String get phraseWritten => 'Ich habe meine Phrase aufgeschrieben';

  @override
  String get warningRecoveryPhrase =>
      'Wenn du diese Phrase verlierst und deine PIN vergisst, verlierst du den Zugang zu deinem Konto.';

  @override
  String get accountTransferred => 'Konto übertragen';

  @override
  String get accountTransferredMessage =>
      'Dein Konto wurde auf ein anderes Gerät übertragen. Diese Sitzung ist nicht mehr gültig.';

  @override
  String get accountTransferredInfo =>
      'Wenn du diese Übertragung nicht initiiert hast, wurde dein Konto möglicherweise kompromittiert.';

  @override
  String get logout => 'Abmelden';

  @override
  String get transferAccount => 'Konto übertragen';

  @override
  String get transferAccountInfo =>
      'Übertrage dein Hash-Konto auf ein neues Gerät. Deine aktuelle Sitzung wird ungültig.';

  @override
  String get generateTransferCode => 'Übertragungscode generieren';

  @override
  String get transferCode => 'Übertragungscode';

  @override
  String transferCodeExpires(int minutes) {
    return 'Dieser Code läuft in $minutes Minuten ab';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Gib diesen Code auf deinem neuen Gerät ein, um dein Konto zu übertragen.';

  @override
  String get generateNewCode => 'Neuen Code generieren';

  @override
  String get scanQrCode => 'QR-Code scannen';

  @override
  String get scanQrCodeSubtitle =>
      'Scanne den QR-Code eines Kontakts, um ihn hinzuzufügen';

  @override
  String get qrCodeDetected => 'QR-Code erkannt';

  @override
  String get invalidQrCode => 'Ungültiger QR-Code';

  @override
  String get cameraPermissionRequired => 'Kameraberechtigung erforderlich';

  @override
  String get myQrCode => 'Mein QR-Code';

  @override
  String get myQrCodeSubtitle =>
      'Teile diesen QR-Code, damit deine Kontakte dich hinzufügen können';

  @override
  String get shareQrCode => 'Teilen';

  @override
  String get addContactTitle => 'Kontakt hinzufügen';

  @override
  String get addContactByHashId => 'Gib die Hash ID deines Kontakts ein';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Suchen';

  @override
  String get contactNotFound => 'Kontakt nicht gefunden';

  @override
  String get contactAlreadyAdded =>
      'Dieser Kontakt ist bereits in deiner Liste';

  @override
  String get contactAdded => 'Kontakt hinzugefügt';

  @override
  String get myProfile => 'Mein Profil';

  @override
  String get myProfileSubtitle =>
      'Teile diese Informationen, damit andere dich hinzufügen können';

  @override
  String get temporaryCode => 'Temporärer Code';

  @override
  String temporaryCodeExpires(String time) {
    return 'Läuft ab in $time';
  }

  @override
  String get codeExpired => 'Code abgelaufen';

  @override
  String get generateNewCodeButton => 'Neuer Code';

  @override
  String get copyHashId => 'ID kopieren';

  @override
  String get copyCode => 'Code kopieren';

  @override
  String get copiedToClipboard => 'Kopiert';

  @override
  String get showMyQrCode => 'Meinen QR-Code anzeigen';

  @override
  String get orDivider => 'oder';

  @override
  String get openScanner => 'Scanner öffnen';

  @override
  String get addManually => 'Manuell hinzufügen';

  @override
  String get contactHashIdLabel => 'Hash ID des Kontakts';

  @override
  String get temporaryCodeLabel => 'Temporärer Code';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Bitte deinen Kontakt, einen Code in seinem Profil zu generieren';

  @override
  String get verifyAndAdd => 'Überprüfen und hinzufügen';

  @override
  String get fillAllFields => 'Bitte fülle alle Felder aus';

  @override
  String get invalidHashIdFormat => 'Ungültiges ID-Format (z.B.: 123-456-ABC)';

  @override
  String get userNotFound => 'Benutzer nicht gefunden';

  @override
  String get cannotAddYourself => 'Du kannst dich nicht selbst hinzufügen';

  @override
  String get invalidOrExpiredCode =>
      'Ungültiger oder abgelaufener temporärer Code';

  @override
  String get contactFound => 'Kontakt gefunden!';

  @override
  String get howToCallContact => 'Wie möchtest du ihn nennen?';

  @override
  String get contactNameHint => 'Kontaktname';

  @override
  String get addContactButton => 'Hinzufügen';

  @override
  String get contactDetails => 'Kontaktdetails';

  @override
  String get contactName => 'Kontaktname';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Hinzugefügt am $date';
  }

  @override
  String get deleteContact => 'Kontakt löschen';

  @override
  String deleteContactConfirm(Object name) {
    return 'Diesen Kontakt löschen?';
  }

  @override
  String get deleteContactMessage =>
      'Dadurch wird auch der gesamte Chat gelöscht.';

  @override
  String get delete => 'Löschen';

  @override
  String get typeMessage => 'Nachricht schreiben...';

  @override
  String get messageSent => 'Gesendet';

  @override
  String get messageDelivered => 'Zugestellt';

  @override
  String get messageRead => 'Gelesen';

  @override
  String get messageFailed => 'Senden fehlgeschlagen';

  @override
  String get now => 'Jetzt';

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
    return '${count}T';
  }

  @override
  String get today => 'Heute';

  @override
  String get yesterday => 'Gestern';

  @override
  String dateAtTime(String date, String time) {
    return '$date um $time';
  }

  @override
  String get shareMessage =>
      'Komm zu mir auf Hash! 🔒\n\nEs ist ein wirklich privater Messenger: vollständige Verschlüsselung, keine Spuren auf Servern und Panik-Modus bei Bedarf.\n\nLade die App hier herunter 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Fehler';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Ansehen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get save => 'Speichern';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get close => 'Schließen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get loading => 'Wird geladen...';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Eingegangene Anfragen';

  @override
  String get noPendingRequests => 'Keine ausstehenden Anfragen';

  @override
  String get pendingRequestsSubtitle =>
      'Diese Personen möchten dich hinzufügen';

  @override
  String requestFromUser(String hashId) {
    return 'Anfrage von $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Läuft in $days Tagen ab';
  }

  @override
  String get acceptRequest => 'Akzeptieren';

  @override
  String get rejectRequest => 'Ablehnen';

  @override
  String get requestAccepted => 'Anfrage akzeptiert';

  @override
  String get requestRejected => 'Anfrage abgelehnt';

  @override
  String get requestSent => 'Anfrage gesendet!';

  @override
  String get requestSentSubtitle =>
      'Deine Anfrage wurde gesendet. Der Benutzer muss sie akzeptieren, bevor ihr chatten könnt.';

  @override
  String get requestAlreadyPending => 'Eine Anfrage ist bereits ausstehend';

  @override
  String get requestAlreadySentByOther =>
      'Diese Person hat dir bereits eine Anfrage gesendet';

  @override
  String get addByHashId => 'Per Hash ID hinzufügen';

  @override
  String get addByHashIdSubtitle =>
      'Gib die Hash ID und den temporären Code des Kontakts ein';

  @override
  String get enterTemporaryCode => 'Gib den 6-stelligen Code ein';

  @override
  String get sendRequest => 'Anfrage senden';

  @override
  String get acceptContactTitle => 'Kontakt akzeptieren';

  @override
  String get acceptContactSubtitle => 'Du kannst ihm einen eigenen Namen geben';

  @override
  String get leaveEmptyForHashId => 'Leer lassen, um Hash ID zu verwenden';

  @override
  String get firstName => 'Vorname';

  @override
  String get lastName => 'Nachname';

  @override
  String get notes => 'Notizen';

  @override
  String get notesHint => 'Persönliche Notizen über diesen Kontakt';

  @override
  String get photoOptional => 'Foto (optional)';

  @override
  String get contactNameOptional => 'Name (optional)';

  @override
  String get notesOptional => 'Notizen (optional)';

  @override
  String get storedLocally => 'Nur auf deinem Gerät gespeichert';

  @override
  String get encryptedMessageLabel => 'Verschlüsselte Nachricht';

  @override
  String get identityMessageHint => 'Wer bist du? Woher kennt ihr euch?';

  @override
  String get messageWillBeSentEncrypted =>
      'Diese Nachricht wird verschlüsselt an den Empfänger gesendet';

  @override
  String get sendRequestButton => 'Anfrage senden';

  @override
  String get requestExpiresIn24h =>
      'Die Anfrage läuft in 24h ab, wenn sie nicht akzeptiert wird';

  @override
  String get theyAlreadySentYouRequest =>
      'Diese Person hat dir bereits eine Anfrage gesendet';

  @override
  String get requests => 'Anfragen';

  @override
  String get receivedRequests => 'Empfangen';

  @override
  String get sentRequests => 'Gesendet';

  @override
  String get noSentRequests => 'Keine gesendeten Anfragen';

  @override
  String get cancelRequest => 'Abbrechen';

  @override
  String get deleteRequest => 'Anfrage löschen';

  @override
  String get requestCancelled => 'Anfrage abgebrochen';

  @override
  String sentTo(String hashId) {
    return 'Gesendet an $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Läuft ab in $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Vor $time erhalten';
  }

  @override
  String get messageFromRequester => 'Nachricht des Anfragenden';

  @override
  String get copy => 'Kopieren';

  @override
  String get messageInfo => 'Nachrichteninfo';

  @override
  String get messageDirection => 'Richtung';

  @override
  String get messageSentByYou => 'Von dir gesendet';

  @override
  String get messageReceived => 'Empfangen';

  @override
  String get messageSentAt => 'Gesendet am';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Gelesen am';

  @override
  String get messageType => 'Typ';

  @override
  String get messageSize => 'Größe';

  @override
  String get messageExpiresAt => 'Läuft ab am';

  @override
  String get messageEncrypted => 'Ende-zu-Ende verschlüsselt';

  @override
  String get messageStatusSending => 'Wird gesendet...';

  @override
  String get messageStatusSent => 'Gesendet';

  @override
  String get messageStatusDelivered => 'Zugestellt';

  @override
  String get messageStatusRead => 'Gelesen';

  @override
  String get messageStatusFailed => 'Fehlgeschlagen';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Zustellung ausstehend';

  @override
  String get deletedFromServer => 'Gelöscht';

  @override
  String get messageTypeText => 'Text';

  @override
  String get messageTypeImage => 'Bild';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Audio';

  @override
  String get messageTypeFile => 'Datei';

  @override
  String get indefinitely => 'Unbegrenzt';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'Stunden';

  @override
  String get minutes => 'Minuten';

  @override
  String get seconds => 'Sekunden';

  @override
  String get ephemeralMessages => 'Vergängliche Nachrichten';

  @override
  String get ephemeralMessagesDescription =>
      'Nachrichten werden nach dieser Zeit automatisch gelöscht';

  @override
  String get ephemeralImmediate => 'Sofort';

  @override
  String get ephemeralImmediateDesc => 'Gelöscht sobald gelesen';

  @override
  String get ephemeralMyPreference => 'Meine Präferenz';

  @override
  String get ephemeralMyPreferenceDesc => 'Globale Einstellung verwenden';

  @override
  String get ephemeralDefaultSetting => 'Nachrichtendauer';

  @override
  String get ephemeralChooseDefault => 'Empfohlen';

  @override
  String get ephemeral30Seconds => '30 Sekunden';

  @override
  String get ephemeral30SecondsDesc => '30s nach dem Lesen gelöscht';

  @override
  String get ephemeral5Minutes => '5 Minuten';

  @override
  String get ephemeral5MinutesDesc => '5min nach dem Lesen gelöscht';

  @override
  String get ephemeral1Hour => '1 Stunde';

  @override
  String get ephemeral1HourDesc => '1h nach dem Lesen gelöscht';

  @override
  String get ephemeral3Hours => '3 Stunden';

  @override
  String get ephemeral6Hours => '6 Stunden';

  @override
  String get ephemeral6HoursDesc => '6h nach dem Lesen gelöscht';

  @override
  String get ephemeral12Hours => '12 Stunden';

  @override
  String get ephemeral24Hours => '24 Stunden';

  @override
  String get ephemeral24HoursDesc => '24h nach dem Lesen gelöscht';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Benutzerdefinierte Dauer';

  @override
  String get howItWorks => 'Wie funktioniert es?';

  @override
  String get ephemeralExplanation1 =>
      'Nachrichten werden bereits beim Empfang vom Server gelöscht.';

  @override
  String get ephemeralExplanation2 =>
      'Diese Einstellung legt fest, wann Nachrichten von DEINEM Telefon nach dem Lesen verschwinden.';

  @override
  String get ephemeralExplanation3 =>
      'Dein Kontakt hat seine eigene Einstellung für sein Telefon.';

  @override
  String get mute1Hour => '1 Stunde';

  @override
  String get mute8Hours => '8 Stunden';

  @override
  String get mute1Day => '1 Tag';

  @override
  String get mute1Week => '1 Woche';

  @override
  String get muteAlways => 'Immer';

  @override
  String get muteExplanation =>
      'Du wirst keine Benachrichtigungen mehr für diesen Kontakt erhalten';

  @override
  String get showCallsInRecents => 'In letzten Anrufen anzeigen';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash-Anrufe erscheinen im Anrufverlauf des Telefons';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Benachrichtigungen stummschalten';

  @override
  String get muteDescription =>
      'Du wirst keine Benachrichtigungen für diesen Kontakt erhalten';

  @override
  String mutedUntil(String time) {
    return 'Stumm bis $time';
  }

  @override
  String get notMuted => 'Benachrichtigungen aktiviert';

  @override
  String get unmute => 'Reaktivieren';

  @override
  String get notificationSound => 'Benachrichtigungston';

  @override
  String get defaultSound => 'Standard';

  @override
  String get chatSettings => 'Chat-Einstellungen';

  @override
  String get bubbleColor => 'Blasenfarbe';

  @override
  String get backgroundColor => 'Hintergrundfarbe';

  @override
  String get backgroundImage => 'Hintergrundbild';

  @override
  String get chatBackground => 'Chat-Hintergrund';

  @override
  String get customColor => 'Benutzerdefiniert';

  @override
  String get defaultColor => 'Standard';

  @override
  String get imageSelected => 'Bild ausgewählt';

  @override
  String get noImage => 'Kein Bild';

  @override
  String get color => 'Farbe';

  @override
  String get image => 'Bild';

  @override
  String get tapToSelectImage => 'Tippe, um ein Bild auszuwählen';

  @override
  String get changeImage => 'Bild ändern';

  @override
  String get previewMessageReceived => 'Hallo!';

  @override
  String get previewMessageSent => 'Hey!';

  @override
  String get messageAction => 'Nachricht';

  @override
  String get callAction => 'Anruf';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Persönliche Notizen';

  @override
  String get addNotes => 'Notizen hinzufügen...';

  @override
  String get noNotes => 'Keine Notizen';

  @override
  String get messageNotifications => 'Nachrichtenbenachrichtigungen';

  @override
  String get callNotifications => 'Anrufbenachrichtigungen';

  @override
  String get useGradient => 'Farbverlauf verwenden';

  @override
  String get gradientStart => 'Startfarbe';

  @override
  String get gradientEnd => 'Endfarbe';

  @override
  String get preview => 'Vorschau';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get securityNumber => 'Sicherheitsnummer';

  @override
  String securityNumberDescription(String name) {
    return 'Überprüfe, ob die Sicherheitsnummer mit dem Gerät von $name übereinstimmt';
  }

  @override
  String get verifyEncryption => 'Ende-zu-Ende-Verschlüsselung überprüfen';

  @override
  String get tapToCopy => 'Tippen zum Kopieren';

  @override
  String get howToVerify => 'Wie überprüfen';

  @override
  String get verifyStep1 => 'Triff deinen Kontakt persönlich oder rufe ihn an';

  @override
  String get verifyStep2 =>
      'Vergleiche die Sicherheitsnummern oder scanne die QR-Codes';

  @override
  String get verifyStep3 => 'Wenn sie übereinstimmen, ist dein Chat sicher';

  @override
  String get scanToVerify => 'Scannen zur Überprüfung';

  @override
  String get reportSpam => 'Als Spam melden';

  @override
  String get reportSpamSubtitle => 'Diesen Kontakt als Spam melden';

  @override
  String get reportSpamDescription =>
      'Dieser Kontakt wird anonym gemeldet. Deine Identität wird nicht geteilt. Bist du sicher?';

  @override
  String get report => 'Melden';

  @override
  String get spamReported => 'Spam gemeldet';

  @override
  String get reportError =>
      'Fehler beim Senden der Meldung. Bitte versuche es erneut.';

  @override
  String get reportRateLimited =>
      'Du hast die maximale Anzahl von Meldungen für heute erreicht.';

  @override
  String get blockContact => 'Kontakt blockieren';

  @override
  String get blockContactDescription =>
      'Dieser Kontakt kann dir keine Nachrichten mehr senden oder dich anrufen. Er wird nicht benachrichtigt.';

  @override
  String get unblockContact => 'Kontakt entsperren';

  @override
  String get unblockContactDescription =>
      'Dieser Kontakt kann dir wieder Nachrichten senden und dich anrufen.';

  @override
  String get contactBlocked => 'Kontakt blockiert';

  @override
  String get contactUnblocked => 'Kontakt entsperrt';

  @override
  String get contactIsBlocked => 'Dieser Kontakt ist blockiert';

  @override
  String get unblock => 'Entsperren';

  @override
  String get deleteContactSubtitle => 'Diesen Kontakt und Chat löschen';

  @override
  String get confirmWithPin => 'Mit PIN bestätigen';

  @override
  String get enterPinToConfirm =>
      'Gib deine PIN ein, um diese Aktion zu bestätigen';

  @override
  String get profilePhoto => 'Profilbild';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get chooseFromGallery => 'Aus Galerie wählen';

  @override
  String get removePhoto => 'Foto entfernen';

  @override
  String get viewContactHashId => 'Kontakt-ID anzeigen';

  @override
  String get hashIdPartiallyMasked =>
      'Teilweise maskiert für deine Sicherheit und die deines Kontakts';

  @override
  String get addFirstContact => 'Füge deinen ersten Kontakt hinzu';

  @override
  String get addFirstContactSubtitle =>
      'Teile deinen QR-Code oder scanne den eines Freundes';

  @override
  String get directory => 'Verzeichnis';

  @override
  String get noContacts => 'Keine Kontakte';

  @override
  String get noContactsSubtitle => 'Füge einen Kontakt hinzu, um zu beginnen';

  @override
  String get sendMessageAction => 'Nachricht senden';

  @override
  String get audioCall => 'Audioanruf';

  @override
  String get videoCall => 'Videoanruf';

  @override
  String get viewProfile => 'Profil anzeigen';

  @override
  String get deleteContactDirectory => 'Kontakt löschen';

  @override
  String get scanShort => 'Scannen';

  @override
  String get addShort => 'Hinzufügen';

  @override
  String deleteContactConfirmName(String name) {
    return 'Möchtest du $name wirklich löschen?';
  }

  @override
  String get noNotesTitle => 'Keine Notizen';

  @override
  String get noNotesSubtitle => 'Erstelle deine erste Notiz';

  @override
  String get newNote => 'Neue Notiz';

  @override
  String get editNote => 'Notiz bearbeiten';

  @override
  String get deleteNote => 'Notiz löschen';

  @override
  String get deleteNoteConfirm => 'Möchtest du diese Notiz wirklich löschen?';

  @override
  String get noteTitle => 'Titel';

  @override
  String get noteContent => 'Inhalt';

  @override
  String get addItem => 'Element hinzufügen';

  @override
  String get pinNote => 'Anheften';

  @override
  String get unpinNote => 'Lösen';

  @override
  String get noteColor => 'Farbe';

  @override
  String get notePassword => 'Passwort';

  @override
  String get setPassword => 'Passwort festlegen';

  @override
  String get changePassword => 'Passwort ändern';

  @override
  String get removePassword => 'Passwort entfernen';

  @override
  String get enterPassword => 'Passwort eingeben';

  @override
  String get confirmPassword => 'Passwort bestätigen';

  @override
  String get passwordPin => 'PIN-Code';

  @override
  String get passwordText => 'Textpasswort';

  @override
  String get protectedNote => 'Geschützte Notiz';

  @override
  String get incorrectPassword => 'Falsches Passwort';

  @override
  String get passwordSet => 'Passwort festgelegt';

  @override
  String get passwordRemoved => 'Passwort entfernt';

  @override
  String get notesBiometric => 'Face ID für Notizen';

  @override
  String get notesBiometricSubtitle =>
      'Biometrische Authentifizierung zum Öffnen geschützter Notizen erforderlich';

  @override
  String get textNote => 'Textnotiz';

  @override
  String get checklistNote => 'Checkliste';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total Aufgaben';
  }

  @override
  String get autoSaved => 'Gespeichert';

  @override
  String get searchNotes => 'Notiz suchen';

  @override
  String get legalConsent => 'Rechtliche Einwilligung';

  @override
  String get confirmAge13 =>
      'Ich bestätige, dass ich mindestens 13 Jahre alt bin';

  @override
  String get acceptLegalStart => 'Ich akzeptiere die ';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get andThe => ' und die ';

  @override
  String get continueButton => 'Weiter';

  @override
  String get mustAcceptTerms =>
      'Du musst beide Bedingungen akzeptieren, um fortzufahren';

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
  String get contactSupport => 'Support kontaktieren';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Missbrauch melden';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Rechtliches';

  @override
  String get legalEntity => 'Juristische Person';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Anheften';

  @override
  String get unpinConversation => 'Lösen';

  @override
  String get hideConversation => 'Aus dem Feed entfernen';

  @override
  String get deleteConversation => 'Unterhaltung löschen';

  @override
  String get deleteConversationConfirm =>
      'Gib deine PIN ein, um das Löschen aller Nachrichten zu bestätigen';

  @override
  String get noConversations => 'Noch keine Unterhaltungen';

  @override
  String get startConversation => 'Starten';

  @override
  String get microphonePermissionRequired => 'Mikrofonzugriff erforderlich';

  @override
  String get microphonePermissionExplanation =>
      'Hash benötigt das Mikrofon, um Anrufe zu tätigen.';

  @override
  String get cameraPermissionExplanation =>
      'Hash benötigt die Kamera für Videoanrufe.';

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
  String get openSettings => 'Einstellungen öffnen';

  @override
  String get callConnecting => 'Verbindung wird hergestellt...';

  @override
  String get callRinging => 'Klingelt...';

  @override
  String get callReconnecting => 'Verbindung wird wiederhergestellt...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Verbindung wird wiederhergestellt (${seconds}s)';
  }

  @override
  String get callPaused => 'Pausiert';

  @override
  String get callPausedSubtitle => 'Der Anruf ist noch aktiv';

  @override
  String get callRemoteMicMuted => 'Mikrofon des Kontakts stummgeschaltet';

  @override
  String get callMiniControlsMute => 'Stummschalten';

  @override
  String get callMiniControlsUnmute => 'Stummschaltung aufheben';

  @override
  String get callMiniControlsHangUp => 'Auflegen';

  @override
  String get callMiniControlsReturn => 'Zurück zum Anruf';

  @override
  String get callNetworkPoor => 'Instabile Verbindung';

  @override
  String get callNetworkLost => 'Verbindung verloren';

  @override
  String get callEndedTitle => 'Anruf beendet';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Gerätedaten';

  @override
  String get deviceDataSubtitle => 'Lokaler und Server-Speicher';

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
  String get localStorage => 'Lokaler Speicher';

  @override
  String get onThisDevice => 'auf diesem Gerät';

  @override
  String get encryptedDatabases => 'Verschlüsselte Datenbanken';

  @override
  String get files => 'Dateien';

  @override
  String get secureKeychain => 'Sicherer Schlüsselbund';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Namen, Avatare, Signal-Schlüssel';

  @override
  String get messagesDetail => 'Verschlüsselte Unterhaltungen';

  @override
  String get notesDetail => 'Persönliche Notizen';

  @override
  String get signalSessions => 'Signal-Sitzungen';

  @override
  String get signalSessionsDetail => 'Verschlüsselungssitzungen';

  @override
  String get pendingContacts => 'Ausstehende Kontakte';

  @override
  String get pendingContactsDetail => 'Ausstehende Anfragen';

  @override
  String get callHistory => 'Anrufe';

  @override
  String get callHistoryDetail => 'Anrufverlauf';

  @override
  String get preferences => 'Einstellungen';

  @override
  String get preferencesDetail => 'Medien- und Anrufeinstellungen';

  @override
  String get avatars => 'Avatare';

  @override
  String get media => 'Medien';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '1 Datei',
      zero: 'keine Dateien',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktiv';

  @override
  String get notDefined => 'Nicht definiert';

  @override
  String get biometrics => 'Biometrie';

  @override
  String get recoveryPhrase => 'Wiederherstellungsphrase';

  @override
  String get identity => 'Identität (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol-Schlüssel';

  @override
  String get authTokens => 'Authentifizierungstoken';

  @override
  String get contactNamesCache => 'Kontaktnamen-Cache';

  @override
  String get remoteConfig => 'Fernkonfiguration';

  @override
  String get notificationPrefs => 'Benachrichtigungseinstellungen';

  @override
  String get serverData => 'Serverdaten';

  @override
  String get serverDataInfo =>
      'Hash speichert minimal Daten auf dem Server, alle verschlüsselt oder temporär.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail =>
      'Hash ID, öffentliche Schlüssel, Postfach-Token';

  @override
  String get serverPrekeys => 'Vorab-Schlüssel';

  @override
  String get serverPrekeysDetail => 'Einmalige Signal-Schlüssel (verbraucht)';

  @override
  String get serverMessages => 'Nachrichten im Transit';

  @override
  String get serverMessagesDetail => 'Nach Empfang gelöscht (max. 24h)';

  @override
  String get serverMedia => 'Medien im Transit';

  @override
  String get serverMediaDetail => 'Nach Download gelöscht';

  @override
  String get serverContactRequests => 'Kontaktanfragen';

  @override
  String get serverContactRequestsDetail => 'Verfallen nach 24h';

  @override
  String get serverRateLimits => 'Ratenbegrenzung';

  @override
  String get serverRateLimitsDetail => 'Temporäre Anti-Missbrauch-Daten';

  @override
  String get privacyReassurance =>
      'Hash kann deine Nachrichten nicht lesen. Alle Daten sind Ende-zu-Ende-verschlüsselt. Serverdaten werden automatisch gelöscht.';

  @override
  String get pinTooSimple =>
      'Dieser PIN-Code ist zu einfach. Wähle einen sichereren Code.';

  @override
  String get genericError =>
      'Ein Fehler ist aufgetreten. Bitte versuche es erneut.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Konto konnte nicht erstellt werden: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Phrase in die Zwischenablage kopiert';

  @override
  String get copyPhrase => 'Phrase kopieren';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Schreibe diese Phrase an einem sicheren Ort auf. Wenn du deine PIN ohne diese Phrase verlierst, verlierst du dauerhaft den Zugang zu deinen Daten.';

  @override
  String get noMessages => 'Keine Nachrichten';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Alle Nachrichten mit $name löschen?';
  }

  @override
  String get confirmation => 'Bestätigung';

  @override
  String get untitled => 'Ohne Titel';

  @override
  String get noSessions => 'Keine Sitzungen';

  @override
  String get unknownContact => 'Unbekannter Kontakt';

  @override
  String get unnamed => 'Unbenannt';

  @override
  String get noPendingRequestsAlt => 'Keine ausstehenden Anfragen';

  @override
  String get deleteAllCallHistory => 'Gesamten Anrufverlauf löschen?';

  @override
  String get noCalls => 'Keine Anrufe';

  @override
  String get noPreferences => 'Keine Einstellungen';

  @override
  String get resetAllMediaPrefs => 'Alle Medieneinstellungen zurücksetzen?';

  @override
  String get deleteThisAvatar => 'Diesen Avatar löschen?';

  @override
  String get deleteAllAvatars => 'Alle Avatare löschen?';

  @override
  String get noAvatars => 'Keine Avatare';

  @override
  String get deleteThisFile => 'Diese Datei löschen?';

  @override
  String get deleteAllMediaFiles => 'Alle Medien löschen?';

  @override
  String get noMediaFiles => 'Keine Medien';

  @override
  String get outgoing => 'Ausgehend';

  @override
  String get incoming => 'Eingehend';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Vergängliche Ansicht: ${seconds}s';
  }

  @override
  String get normalView => 'Normale Ansicht';

  @override
  String get callReasonCompleted => 'Abgeschlossen';

  @override
  String get callReasonMissed => 'Verpasst';

  @override
  String get callReasonDeclined => 'Abgelehnt';

  @override
  String get callReasonFailed => 'Fehlgeschlagen';

  @override
  String get justNow => 'Gerade eben';

  @override
  String timeAgoMinutes(int count) {
    return 'Vor $count Min.';
  }

  @override
  String timeAgoHours(int count) {
    return 'Vor ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Vor ${count}T';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Standort';

  @override
  String get statusQueued => 'In Warteschlange';

  @override
  String get blockedBadge => 'Blockiert';

  @override
  String get protectedBadge => 'Geschützt';

  @override
  String messageCount(int count) {
    return '$count Nachricht(en)';
  }

  @override
  String get deleteQuestion => 'Löschen?';

  @override
  String get transferMyAccountTitle => 'Mein Konto übertragen';

  @override
  String get loadingError => 'Ladefehler';

  @override
  String get transferToNewDevice => 'Auf ein neues Gerät übertragen';

  @override
  String get transferInstructions =>
      'Wähle auf deinem neuen Gerät \"Mein Konto wiederherstellen\" und gib diese Informationen ein:';

  @override
  String get yourHashIdLabel => 'Deine Hash ID';

  @override
  String get enterYourPinCode => 'Gib deinen PIN-Code ein';

  @override
  String get pinOwnerConfirmation =>
      'Um zu bestätigen, dass du der Inhaber dieses Kontos bist';

  @override
  String get scanThisQrCode => 'Scanne diesen QR-Code';

  @override
  String get withYourNewDevice => 'Mit deinem neuen Gerät';

  @override
  String get orEnterTheCode => 'oder gib den Code ein';

  @override
  String get transferCodeLabel => 'Übertragungscode';

  @override
  String get proximityVerification => 'Näherungsüberprüfung';

  @override
  String get bringDevicesCloser => 'Bringe beide Geräte näher zusammen';

  @override
  String get confirmTransferQuestion => 'Übertragung bestätigen?';

  @override
  String get accountWillBeTransferred =>
      'Dein Konto wird auf das neue Gerät übertragen.\n\nDieses Gerät wird dauerhaft getrennt.';

  @override
  String get transferComplete => 'Übertragung abgeschlossen';

  @override
  String get transferSuccessMessage =>
      'Dein Konto wurde erfolgreich übertragen.\n\nDiese App wird jetzt geschlossen.';

  @override
  String get manualVerification => 'Manuelle Überprüfung';

  @override
  String get codeDisplayedOnBothDevices =>
      'Auf beiden Geräten angezeigter Code:';

  @override
  String get doesCodeMatchNewDevice =>
      'Stimmt dieser Code mit dem auf dem neuen Gerät überein?';

  @override
  String get verifiedStatus => 'Verifiziert';

  @override
  String get inProgressStatus => 'In Bearbeitung...';

  @override
  String get notAvailableStatus => 'Nicht verfügbar';

  @override
  String get codeExpiredRestart =>
      'Der Code ist abgelaufen. Bitte starte erneut.';

  @override
  String get codesDoNotMatchCancelled =>
      'Die Codes stimmen nicht überein. Übertragung abgebrochen.';

  @override
  String transferToDevice(String device) {
    return 'An: $device';
  }

  @override
  String get copiedExclamation => 'Kopiert!';

  @override
  String expiresInTime(String time) {
    return 'Läuft ab in $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrie ist auf diesem Gerät nicht verfügbar';

  @override
  String get biometricAuthError =>
      'Fehler bei der biometrischen Authentifizierung';

  @override
  String get authenticateForBiometric =>
      'Bitte authentifiziere dich, um Biometrie zu aktivieren';

  @override
  String get biometricAuthFailed =>
      'Biometrische Authentifizierung fehlgeschlagen';

  @override
  String get forceUpdateTitle => 'Update erforderlich';

  @override
  String get forceUpdateMessage =>
      'Eine neue Version von Hash ist verfügbar. Bitte aktualisiere, um fortzufahren.';

  @override
  String get updateButton => 'Aktualisieren';

  @override
  String get maintenanceInProgress => 'Wartung läuft';

  @override
  String get tryAgainLater => 'Bitte versuche es später erneut';

  @override
  String get information => 'Information';

  @override
  String get later => 'Später';

  @override
  String get doYouLikeHash => 'Gefällt dir Hash?';

  @override
  String get yourFeedbackHelps =>
      'Dein Feedback hilft uns, die App zu verbessern';

  @override
  String get ratingTerrible => 'Schrecklich';

  @override
  String get ratingBad => 'Schlecht';

  @override
  String get ratingOk => 'OK';

  @override
  String get ratingGood => 'Gut';

  @override
  String get ratingExcellent => 'Ausgezeichnet!';

  @override
  String get donationMessage =>
      'Hash ist ein gemeinnütziges Projekt. Deine Unterstützung hilft uns, einen wirklich privaten Messenger weiterzuentwickeln.';

  @override
  String get recentConnections => 'Letzte Verbindungen';

  @override
  String get loginInfoText =>
      'Jede PIN-Entsperrung wird lokal aufgezeichnet. Nur die letzten 24 Stunden werden gespeichert.';

  @override
  String get connectionCount => 'Verbindung(en)';

  @override
  String get periodLabel => 'Zeitraum';

  @override
  String get historyLabel => 'Verlauf';

  @override
  String get noLoginRecorded => 'Keine Anmeldung aufgezeichnet';

  @override
  String get nextUnlocksAppearHere => 'Nächste Entsperrungen erscheinen hier.';

  @override
  String get dataLocalOnly =>
      'Diese Daten werden nur auf deinem Gerät gespeichert und niemals übertragen.';

  @override
  String get currentSession => 'Aktuell';

  @override
  String get todayLabel => 'Heute';

  @override
  String get yesterdayLabel => 'Gestern';

  @override
  String get justNowLabel => 'Gerade eben';

  @override
  String minutesAgoLabel(int count) {
    return 'Vor $count Min.';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Vor ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Vor ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Keine Wartung geplant';

  @override
  String get everythingWorkingNormally => 'Alles funktioniert normal';

  @override
  String get maintenanceTitle => 'Wartung';

  @override
  String get maintenanceActiveLabel => 'AKTIV';

  @override
  String get maintenancePlannedLabel => 'GEPLANT';

  @override
  String get locking => 'Wird gesperrt...';

  @override
  String get newMessageNotification => 'Neue Nachricht';

  @override
  String get secExplainTitle => 'Wie Hash dich schützt';

  @override
  String get secExplainIntro =>
      'Hash ist so konzipiert, dass niemand deine Nachrichten lesen kann.';

  @override
  String get secExplainIntroSub =>
      'Nicht einmal wir.\nSo funktioniert es, einfach erklärt.';

  @override
  String get secJourneyLabel => 'DER WEG';

  @override
  String get secJourneyTitle => 'Die Reise deiner Nachricht';

  @override
  String get secJourneySubtitle =>
      'Von deinem Finger bis zum Bildschirm deines Kontakts ist jeder Schritt geschützt. Folge dem Weg.';

  @override
  String get secStep1Title => 'Du schreibst deine Nachricht';

  @override
  String get secStep1Desc =>
      'Du tippst \"Hallo!\" in der App. In diesem Moment existiert die Nachricht nur im Speicher deines Telefons. Nichts wurde gesendet.';

  @override
  String get secStep2Title => 'Verschlüsselung mit dem Signal-Protokoll';

  @override
  String get secStep2Desc =>
      'Sobald du auf \"Senden\" tippst, wird deine Nachricht in eine Zeichenkette unverständlicher Zeichen umgewandelt. Es ist, als wäre deine Nachricht in einem Tresor eingeschlossen, zu dem nur dein Kontakt den Schlüssel hat.';

  @override
  String get secStep3Title => 'Sealed Sender: der unsichtbare Umschlag';

  @override
  String get secStep3Desc =>
      'Stell dir vor, du sendest einen Brief per Post, aber ohne Absenderadresse auf dem Umschlag. Genau das macht Hash. Die Nachricht wird in einem anonymen Briefkasten abgelegt. Der Server weiß nicht, wer sie gesendet hat.';

  @override
  String get secStep4Title => 'Der Server sieht nichts';

  @override
  String get secStep4Desc =>
      'Der Server agiert als blinder Briefträger. Er weiß nur, dass \"jemand etwas in Briefkasten #A7X9 gelegt hat\". Er weiß nicht, wer es gesendet hat, was es ist oder für wen es bestimmt ist.';

  @override
  String get secStep4Highlight =>
      'Keine gespeicherten Metadaten: keine IP-Adresse, kein Zeitstempel, keine Verbindung zwischen Sender und Empfänger.';

  @override
  String get secStep5Title => 'Dein Kontakt empfängt die Nachricht';

  @override
  String get secStep5Desc =>
      'Das Telefon deines Kontakts ruft den Inhalt aus seinem anonymen Briefkasten ab und entschlüsselt die Nachricht mit seinem privaten Schlüssel, der sein Gerät nie verlassen hat. \"Hallo!\" erscheint auf seinem Bildschirm.';

  @override
  String get secStep6Title => 'Die Nachricht verschwindet vom Server';

  @override
  String get secStep6Desc =>
      'Sobald dein Kontakt den Empfang bestätigt, löscht der Server die Nachricht dauerhaft. Kein Papierkorb, kein Archiv, kein Backup. Auch ungelesene Nachrichten werden automatisch nach 24 Stunden vernichtet.';

  @override
  String get secStep7Title => 'Lokale Ablaufzeit';

  @override
  String get secStep7Desc =>
      'Auf dem Telefon deines Kontakts zerstört sich die Nachricht selbst nach der von dir gewählten Dauer: sofort nach dem Lesen, 5 Minuten, 1 Stunde... du entscheidest.';

  @override
  String get secJourneyConclusion =>
      'Ergebnis: keine Spur auf dem Server, keine Spur auf den Geräten. Die Nachricht existierte nur lange genug, um gelesen zu werden, dann verschwand sie.';

  @override
  String get secArchLabel => 'ARCHITEKTUR';

  @override
  String get secArchTitle => '5 Schutzschichten';

  @override
  String get secArchSubtitle =>
      'Hash verlässt sich nicht auf eine einzige Technologie. Jede Schicht verstärkt die anderen. Selbst wenn eine Schicht kompromittiert wird, bleiben deine Daten sicher.';

  @override
  String get secLayer1Title => 'Ende-zu-Ende-Verschlüsselung';

  @override
  String get secLayer1Desc =>
      'Jede Nachricht wird mit einem einzigartigen Schlüssel verschlüsselt. Einfach gesagt: Selbst wenn jemand eine Nachricht entschlüsselt, kann er die nächste nicht entschlüsseln. Jede Nachricht hat ihr eigenes Schloss.';

  @override
  String get secLayer1Detail =>
      'Für Dateien (Fotos, Videos, Dokumente) verwendet Hash eine zusätzliche AES-256-GCM-Verschlüsselung. Die Datei wird verschlüsselt, bevor sie dein Telefon verlässt.';

  @override
  String get secLayer2Title => 'Sealed Sender (Netzwerk-Anonymität)';

  @override
  String get secLayer2Desc =>
      'Normale Messenger senden deine Nachrichten mit deiner Identität angehängt. Es ist wie deinen Namen auf den Umschlag zu schreiben. Hash verwendet anonyme Briefkästen: Der Server stellt die Nachricht zu, ohne zu wissen, wer sie gesendet hat.';

  @override
  String get secLayer2Detail =>
      'Ergebnis: Selbst bei einem Datenleck des Servers ist es unmöglich nachzuvollziehen, wer mit wem kommuniziert.';

  @override
  String get secLayer3Title => 'Automatische Löschung';

  @override
  String get secLayer3Desc =>
      'Nachrichten werden vom Server gelöscht, sobald der Empfang bestätigt ist. Selbst wenn eine Nachricht nie abgerufen wird, wird sie automatisch nach 24 Stunden vernichtet.';

  @override
  String get secLayer3Detail =>
      'Auf deinem Telefon zerstören sich Nachrichten selbst nach der von dir gewählten Dauer: sofort, 5 Min., 15 Min., 30 Min., 1h, 3h, 6h oder 12h.';

  @override
  String get secLayer4Title => 'Lokaler Zugriffsschutz';

  @override
  String get secLayer4Desc =>
      'Die App ist durch einen 6-stelligen PIN-Code und/oder Biometrie (Face ID, Fingerabdruck) geschützt. Nach zu vielen fehlgeschlagenen Versuchen sperrt sich die App mit einer zunehmenden Verzögerung nach jedem Fehlversuch.';

  @override
  String get secLayer5Title => 'Gesperrte Datenbank';

  @override
  String get secLayer5Desc =>
      'Serverseitig kann kein Benutzer direkt in die Datenbank schreiben. Alle Aktionen gehen über sichere Funktionen, die jede Anfrage überprüfen.';

  @override
  String get secLayer5Detail =>
      'Es ist wie ein Bankschalter: Du berührst den Tresor nie selbst. Du stellst eine Anfrage, und das System überprüft, ob du das Recht hast, bevor es handelt.';

  @override
  String get secVashLabel => 'WELTWEIT EINZIGARTIG';

  @override
  String get secVashTitle => 'Vash-Modus';

  @override
  String get secVashSubtitle =>
      'Ein Notfall-Sicherheitssystem, das in keiner anderen Messaging-App existiert.';

  @override
  String get secVashScenarioTitle => 'Stell dir diese Situation vor';

  @override
  String get secVashScenario1 => 'Jemand greift auf dein Telefon zu';

  @override
  String get secVashScenario2 => 'Du wirst nach deinem PIN-Code gefragt';

  @override
  String get secVashScenario3 => 'Du willst dringend alle deine Daten löschen';

  @override
  String get secVashSolutionTitle => 'Die Lösung: zwei PIN-Codes';

  @override
  String get secVashSolutionDesc =>
      'Du konfigurierst zwei verschiedene PIN-Codes in Hash:';

  @override
  String get secVashNormalCodeLabel => 'Normaler Code';

  @override
  String get secVashNormalCodeDesc =>
      'Öffnet die App normal mit all deinen Daten';

  @override
  String get secVashCodeLabel2 => 'Vash-Code';

  @override
  String get secVashCodeDescription =>
      'Öffnet die App normal... aber alle deine Daten werden im Hintergrund lautlos gelöscht';

  @override
  String get secVashWhatHappensTitle => 'Was dann passiert';

  @override
  String get secVashWhatHappensDesc =>
      'Die App öffnet sich normal. Kein Alarm, keine verdächtige Animation. Der Bildschirm zeigt einfach eine leere App, als hättest du sie gerade installiert.\n\nIn Wirklichkeit wurden alle deine Gespräche, Kontakte und Nachrichten in einem Bruchteil einer Sekunde unwiderruflich gelöscht.';

  @override
  String get secCallsLabel => 'ANRUFE & DATEIEN';

  @override
  String get secCallsTitle => 'Alles ist verschlüsselt';

  @override
  String get secCallsSubtitle =>
      'Nicht nur Nachrichten. Absolut alles, was über Hash läuft, ist Ende-zu-Ende verschlüsselt.';

  @override
  String get secAudioCallTitle => 'Audioanrufe';

  @override
  String get secAudioCallDesc =>
      'Ende-zu-Ende verschlüsselt über WebRTC. Sprache wird direkt zwischen den Geräten übertragen.';

  @override
  String get secVideoCallTitle => 'Videoanrufe';

  @override
  String get secVideoCallDesc =>
      'Gleiche Technologie, jeder Stream einzeln verschlüsselt.';

  @override
  String get secPhotosTitle => 'Fotos & Videos';

  @override
  String get secPhotosDesc =>
      'In AES-256-GCM verschlüsselt, bevor sie dein Telefon verlassen.';

  @override
  String get secDocsTitle => 'Dokumente';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, jede Datei. Name, Größe und Inhalt verschlüsselt.';

  @override
  String get secAnonLabel => 'ANONYMITÄT';

  @override
  String get secAnonTitle => 'Keine Identität erforderlich';

  @override
  String get secAnonSubtitle =>
      'Hash fragt nie nach deiner Telefonnummer oder E-Mail. Du wirst durch eine einzigartige und anonyme Hash ID identifiziert.';

  @override
  String get secHashIdTitle => 'Deine Hash ID';

  @override
  String get secHashIdDesc =>
      'Das ist dein einzigartiger Identifikator. Er verrät nichts über dich: nicht deinen Namen, nicht deine Nummer, nicht deinen Standort. Es ist wie ein Pseudonym, das unmöglich mit deiner echten Identität verknüpft werden kann.\n\nUm einen Kontakt hinzuzufügen, teilst du deine Hash ID oder scannst einen QR-Code. Das war\'s. Kein synchronisiertes Adressbuch, keine Vorschläge \"Personen, die du kennen könntest\".';

  @override
  String get secDataLabel => 'DATEN';

  @override
  String get secDataTitle => 'Was Hash nicht weiß';

  @override
  String get secDataSubtitle =>
      'Der beste Weg, deine Daten zu schützen, ist sie nicht zu sammeln.';

  @override
  String get secNeverCollected => 'Nie gesammelt';

  @override
  String get secNeverItem1 => 'Nachrichteninhalt';

  @override
  String get secNeverItem2 => 'Kontaktliste';

  @override
  String get secNeverItem3 => 'Telefonnummer';

  @override
  String get secNeverItem4 => 'E-Mail-Adresse';

  @override
  String get secNeverItem5 => 'IP-Adresse';

  @override
  String get secNeverItem6 => 'Standort';

  @override
  String get secNeverItem7 => 'Metadaten (wer mit wem kommuniziert)';

  @override
  String get secNeverItem8 => 'Anrufverlauf';

  @override
  String get secNeverItem9 => 'Adressbuch';

  @override
  String get secNeverItem10 => 'Werbe-Identifikatoren';

  @override
  String get secTempStored => 'Temporär gespeichert';

  @override
  String get secTempItem1 => 'Anonyme Hash ID (einzigartiger Identifikator)';

  @override
  String get secTempItem2 => 'Öffentliche Verschlüsselungsschlüssel';

  @override
  String get secTempItem3 => 'Verschlüsselte Nachrichten im Transit (max. 24h)';

  @override
  String get secTempNote =>
      'Selbst diese minimalen Daten können dich nicht identifizieren. Deine Hash ID ist mit keinen persönlichen Informationen verknüpft.';

  @override
  String get secFooterTitle => 'Deine Privatsphäre, deine Freiheit';

  @override
  String get secFooterDesc =>
      'Hash verwendet die gleichen Verschlüsselungstechnologien wie die anspruchsvollsten professionellen Anwendungen. Deine Nachrichten sind durch Mathematik geschützt, nicht durch Versprechen.';

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
