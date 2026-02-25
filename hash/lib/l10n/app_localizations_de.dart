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
  String get conversations => 'Chats';

  @override
  String get noConversation => 'Keine Chats';

  @override
  String get noConversationSubtitle =>
      'Füge einen Kontakt hinzu, um sicher zu chatten';

  @override
  String get addContact => 'Kontakt hinzufügen';

  @override
  String get shareApp => 'App teilen';

  @override
  String get newMessage => 'Neue Nachricht';

  @override
  String get newConversation => 'Neuer Chat';

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
  String get notifications => 'Benachrichtigungen';

  @override
  String get messages => 'Nachrichten';

  @override
  String get calls => 'Anrufe';

  @override
  String get security => 'Sicherheit';

  @override
  String get accountSecurity => 'Kontosicherheit';

  @override
  String get accountSecuritySubtitle => 'PIN, Biometrie, Fallencode';

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
  String get autoLockDisabled => 'Deaktiviert';

  @override
  String get autoLockMinute => '1 Minute';

  @override
  String autoLockMinutes(int count) {
    return '$count Minuten';
  }

  @override
  String get destructionCode => 'Zerstörungscode';

  @override
  String get destructionCodeInfo =>
      'Wenn du diesen Code anstelle deiner PIN eingibst:';

  @override
  String get destructionDeleteMessages =>
      'Alle deine Nachrichten werden gelöscht';

  @override
  String get destructionDeleteContacts => 'Alle deine Kontakte werden gelöscht';

  @override
  String get destructionDeleteHistory => 'Dein Anrufverlauf wird gelöscht';

  @override
  String get destructionKeepId =>
      'Deine Hash-Identität (#XXX-XXX-XXX) bleibt gleich';

  @override
  String get destructionAppearNormal =>
      'Die App erscheint normal, aber leer. Diese Aktion ist unwiderruflich.';

  @override
  String get setupDestructionCode => 'Zerstörungscode einrichten';

  @override
  String get modifyDestructionCode => 'Zerstörungscode ändern';

  @override
  String get currentDestructionCode => 'Aktueller Zerstörungscode';

  @override
  String get newDestructionCode => 'Neuer Zerstörungscode';

  @override
  String get confirmDestructionCode => 'Code bestätigen';

  @override
  String get destructionCodeConfigured => 'Zerstörungscode eingerichtet';

  @override
  String get destructionCodeModified => 'Zerstörungscode geändert';

  @override
  String get destructionCodeMustDiffer =>
      'Der Zerstörungscode muss sich von der PIN unterscheiden';

  @override
  String get incorrectDestructionCode => 'Falscher Zerstörungscode';

  @override
  String get danger => 'Gefahr';

  @override
  String get panicButton => 'Panik-Taste';

  @override
  String get panicButtonSubtitle => 'Alle Daten löschen';

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
  String get panicConfirmTitle => 'Panik-Taste';

  @override
  String get panicConfirmMessage =>
      'Diese Aktion löscht ALLE deine Daten dauerhaft:\n\n• Alle deine Nachrichten\n• Alle deine Kontakte\n• Dein Konto\n\nBist du dir absolut sicher?';

  @override
  String get deleteAll => 'ALLES LÖSCHEN';

  @override
  String get dataDeletedForSecurity => 'Daten aus Sicherheitsgründen gelöscht.';

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
  String get tooManyAttempts => 'Zu viele Versuche';

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
      'PIN-Code, Panik-Modus und Wiederherstellungsphrase';

  @override
  String get getStarted => 'Los geht\'s';

  @override
  String get next => 'Weiter';

  @override
  String get skip => 'Überspringen';

  @override
  String get alreadyHaveAccount => 'Ich habe bereits ein Konto';

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
  String get contactDetails => 'Kontaktdetails';

  @override
  String get contactName => 'Kontaktname';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String get deleteContact => 'Kontakt löschen';

  @override
  String get deleteContactConfirm => 'Diesen Kontakt löschen?';

  @override
  String get deleteContactMessage =>
      'Dadurch wird auch den gesamten Chat gelöscht.';

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
  String get shareMessage =>
      'Komm zu mir auf Hash! 🔒\n\nEs ist ein wirklich privater Messenger: vollständige Verschlüsselung, keine Spuren auf Servern und Panik-Modus bei Bedarf.\n\nLade die App hier herunter 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Fehler';

  @override
  String get ok => 'OK';

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
}
