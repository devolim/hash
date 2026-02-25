// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero Tracce. Zero Compromessi.';

  @override
  String get conversations => 'Chat';

  @override
  String get noConversation => 'Nessuna chat';

  @override
  String get noConversationSubtitle =>
      'Aggiungi un contatto per iniziare a chattare in sicurezza';

  @override
  String get addContact => 'Aggiungi contatto';

  @override
  String get shareApp => 'Condividi app';

  @override
  String get newMessage => 'Nuovo messaggio';

  @override
  String get newConversation => 'Nuova chat';

  @override
  String get settings => 'Impostazioni';

  @override
  String get myHashId => 'Il mio Hash ID';

  @override
  String get supportHash => 'Supporta Hash';

  @override
  String get supportHashSubtitle => 'Hash è un progetto senza scopo di lucro';

  @override
  String get donate => 'Dona';

  @override
  String get appearance => 'Aspetto';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatico';

  @override
  String get themeAutoSubtitle => 'Segue le impostazioni di sistema';

  @override
  String get themeDark => 'Scuro';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeRecommendation =>
      'Il tema scuro è consigliato per maggiore privacy';

  @override
  String get language => 'Lingua';

  @override
  String get notifications => 'Notifiche';

  @override
  String get messages => 'Messaggi';

  @override
  String get calls => 'Chiamate';

  @override
  String get security => 'Sicurezza';

  @override
  String get accountSecurity => 'Sicurezza account';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, codice trappola';

  @override
  String get blockScreenshots => 'Blocca screenshot';

  @override
  String get transferDevice => 'Trasferisci su altro dispositivo';

  @override
  String get transferDeviceSubtitle => 'Migra il tuo account';

  @override
  String get pinCode => 'Codice PIN';

  @override
  String get changePin => 'Cambia codice PIN';

  @override
  String get currentPin => 'Codice PIN attuale';

  @override
  String get newPin => 'Nuovo codice PIN';

  @override
  String get confirmPin => 'Conferma codice PIN';

  @override
  String get pinChanged => 'Codice PIN cambiato';

  @override
  String get incorrectPin => 'PIN errato';

  @override
  String get pinsDoNotMatch => 'I codici non corrispondono';

  @override
  String get autoLock => 'Blocco automatico';

  @override
  String get autoLockDelay => 'Tempo di blocco';

  @override
  String get autoLockDisabled => 'Disattivato';

  @override
  String get autoLockMinute => '1 minuto';

  @override
  String autoLockMinutes(int count) {
    return '$count minuti';
  }

  @override
  String get destructionCode => 'Codice di distruzione';

  @override
  String get destructionCodeInfo =>
      'Se inserisci questo codice al posto del PIN:';

  @override
  String get destructionDeleteMessages =>
      'Tutti i tuoi messaggi saranno eliminati';

  @override
  String get destructionDeleteContacts =>
      'Tutti i tuoi contatti saranno eliminati';

  @override
  String get destructionDeleteHistory =>
      'La cronologia chiamate sarà cancellata';

  @override
  String get destructionKeepId =>
      'La tua identità Hash (#XXX-XXX-XXX) rimane la stessa';

  @override
  String get destructionAppearNormal =>
      'L\'app apparirà normale ma vuota. Questa azione è irreversibile.';

  @override
  String get setupDestructionCode => 'Configura codice di distruzione';

  @override
  String get modifyDestructionCode => 'Modifica codice di distruzione';

  @override
  String get currentDestructionCode => 'Codice di distruzione attuale';

  @override
  String get newDestructionCode => 'Nuovo codice di distruzione';

  @override
  String get confirmDestructionCode => 'Conferma codice';

  @override
  String get destructionCodeConfigured => 'Codice di distruzione configurato';

  @override
  String get destructionCodeModified => 'Codice di distruzione modificato';

  @override
  String get destructionCodeMustDiffer =>
      'Il codice di distruzione deve essere diverso dal PIN';

  @override
  String get incorrectDestructionCode => 'Codice di distruzione errato';

  @override
  String get danger => 'Pericolo';

  @override
  String get panicButton => 'Pulsante panico';

  @override
  String get panicButtonSubtitle => 'Elimina tutti i dati';

  @override
  String get deleteAccount => 'Elimina il mio account';

  @override
  String get deleteAccountSubtitle => 'Azione irreversibile';

  @override
  String get deleteAccountConfirmTitle => 'Elimina il mio account';

  @override
  String get deleteAccountConfirmMessage =>
      'Il tuo account sarà eliminato permanentemente. Questa azione è irreversibile.\n\n• Tutte le tue chat\n• Tutti i tuoi contatti\n• Il tuo Hash ID\n\nDovrai creare un nuovo account.';

  @override
  String get deleteForever => 'Elimina permanentemente';

  @override
  String get cancel => 'Annulla';

  @override
  String get panicConfirmTitle => 'Pulsante Panico';

  @override
  String get panicConfirmMessage =>
      'Questa azione eliminerà TUTTI i tuoi dati permanentemente:\n\n• Tutti i tuoi messaggi\n• Tutti i tuoi contatti\n• Il tuo account\n\nSei assolutamente sicuro?';

  @override
  String get deleteAll => 'ELIMINA TUTTO';

  @override
  String get dataDeletedForSecurity => 'Dati eliminati per sicurezza.';

  @override
  String deletionError(String error) {
    return 'Errore di eliminazione: $error';
  }

  @override
  String get yourSecurity => 'La tua sicurezza';

  @override
  String get securityInfo =>
      '• Crittografia end-to-end (Protocollo Signal)\n• Nessun dato sui nostri server dopo la consegna\n• Chiavi memorizzate solo sul tuo dispositivo\n• Codice PIN mai inviato al server';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Benvenuto';

  @override
  String get securityStatement1 => 'I tuoi messaggi sono protetti.';

  @override
  String get securityStatement2 => 'Crittografia end-to-end.';

  @override
  String get securityStatement3 => 'Nessuna traccia. Nessun compromesso.';

  @override
  String get securityStatement4 => 'La tua privacy è un diritto.';

  @override
  String get accessBlocked => 'Accesso bloccato';

  @override
  String get tooManyAttempts => 'Troppi tentativi';

  @override
  String get pleaseWait => 'Attendi';

  @override
  String get waitDelay => 'Attendi la fine del tempo';

  @override
  String attemptCount(int current, int max) {
    return 'Tentativo $current di $max';
  }

  @override
  String retryIn(String time) {
    return 'Riprova tra $time';
  }

  @override
  String get forgotPin => 'PIN dimenticato? Usa la frase di recupero';

  @override
  String get useRecoveryPhrase => 'Usa frase di recupero';

  @override
  String get recoveryWarningTitle => 'Attenzione';

  @override
  String get recoveryWarningMessage => 'Il recupero dell\'account:';

  @override
  String get recoveryDeleteAllMessages => 'Eliminerà TUTTI i tuoi messaggi';

  @override
  String get recoveryWaitDelay => 'Richiederà un\'attesa di 1 ora';

  @override
  String get recoveryKeepContacts => 'Manterrà i tuoi contatti';

  @override
  String get recoveryIrreversible =>
      'Questa azione è irreversibile. I tuoi messaggi saranno persi permanentemente.';

  @override
  String get iUnderstand => 'Capisco';

  @override
  String get accountRecovery => 'Recupero account';

  @override
  String get enterRecoveryPhrase =>
      'Inserisci le 24 parole della tua frase di recupero, separate da spazi.';

  @override
  String get recoveryPhraseHint => 'parola1 parola2 parola3 ...';

  @override
  String get recover => 'Recupera';

  @override
  String get recoveryPhraseRequired => 'Inserisci la tua frase di recupero';

  @override
  String get recoveryPhrase24Words =>
      'La frase deve contenere esattamente 24 parole';

  @override
  String get incorrectRecoveryPhrase => 'Frase di recupero errata';

  @override
  String get recoveryInitError => 'Errore nell\'inizializzazione del recupero';

  @override
  String get securityDelay => 'Tempo di sicurezza';

  @override
  String get securityDelayMessage =>
      'Per la tua sicurezza, è richiesto un tempo di attesa prima di poter creare un nuovo PIN.';

  @override
  String get timeRemaining => 'Tempo rimanente';

  @override
  String get messagesDeletedForProtection =>
      'I tuoi messaggi sono stati eliminati per la tua protezione.';

  @override
  String get canCloseApp => 'Puoi chiudere l\'app e tornare più tardi.';

  @override
  String get onboardingTitle1 => 'Benvenuto su Hash';

  @override
  String get onboardingSubtitle1 => 'Il messenger che non lascia tracce';

  @override
  String get onboardingTitle2 => 'Crittografia totale';

  @override
  String get onboardingSubtitle2 =>
      'I tuoi messaggi sono crittografati end-to-end con il protocollo Signal';

  @override
  String get onboardingTitle3 => 'Nessuna traccia';

  @override
  String get onboardingSubtitle3 =>
      'I messaggi vengono eliminati dai server dopo la consegna';

  @override
  String get onboardingTitle4 => 'La tua sicurezza';

  @override
  String get onboardingSubtitle4 =>
      'Codice PIN, modalità panico e frase di recupero';

  @override
  String get getStarted => 'Inizia';

  @override
  String get next => 'Avanti';

  @override
  String get skip => 'Salta';

  @override
  String get alreadyHaveAccount => 'Ho già un account';

  @override
  String get createPin => 'Crea un codice PIN';

  @override
  String get createPinSubtitle =>
      'Questo codice proteggerà l\'accesso alla tua app';

  @override
  String get confirmYourPin => 'Conferma il tuo codice PIN';

  @override
  String get confirmPinSubtitle => 'Inserisci nuovamente il tuo codice PIN';

  @override
  String get saveRecoveryPhrase => 'Frase di recupero';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Scrivi queste 24 parole in ordine. Ti permetteranno di recuperare il tuo account se dimentichi il PIN.';

  @override
  String get phraseWritten => 'Ho scritto la mia frase';

  @override
  String get warningRecoveryPhrase =>
      'Se perdi questa frase e dimentichi il PIN, perderai l\'accesso al tuo account.';

  @override
  String get accountTransferred => 'Account trasferito';

  @override
  String get accountTransferredMessage =>
      'Il tuo account è stato trasferito su un altro dispositivo. Questa sessione non è più valida.';

  @override
  String get accountTransferredInfo =>
      'Se non hai avviato questo trasferimento, il tuo account potrebbe essere stato compromesso.';

  @override
  String get logout => 'Esci';

  @override
  String get transferAccount => 'Trasferisci account';

  @override
  String get transferAccountInfo =>
      'Trasferisci il tuo account Hash su un nuovo dispositivo. La tua sessione attuale sarà invalidata.';

  @override
  String get generateTransferCode => 'Genera codice di trasferimento';

  @override
  String get transferCode => 'Codice di trasferimento';

  @override
  String transferCodeExpires(int minutes) {
    return 'Questo codice scade tra $minutes minuti';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Inserisci questo codice sul tuo nuovo dispositivo per trasferire il tuo account.';

  @override
  String get generateNewCode => 'Genera nuovo codice';

  @override
  String get scanQrCode => 'Scansiona codice QR';

  @override
  String get scanQrCodeSubtitle =>
      'Scansiona il codice QR di un contatto per aggiungerlo';

  @override
  String get qrCodeDetected => 'Codice QR rilevato';

  @override
  String get invalidQrCode => 'Codice QR non valido';

  @override
  String get cameraPermissionRequired => 'Permesso fotocamera richiesto';

  @override
  String get myQrCode => 'Il mio codice QR';

  @override
  String get myQrCodeSubtitle =>
      'Condividi questo codice QR per permettere ai tuoi contatti di aggiungerti';

  @override
  String get shareQrCode => 'Condividi';

  @override
  String get addContactTitle => 'Aggiungi contatto';

  @override
  String get addContactByHashId => 'Inserisci l\'Hash ID del tuo contatto';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Cerca';

  @override
  String get contactNotFound => 'Contatto non trovato';

  @override
  String get contactAlreadyAdded => 'Questo contatto è già nella tua lista';

  @override
  String get contactAdded => 'Contatto aggiunto';

  @override
  String get contactDetails => 'Dettagli contatto';

  @override
  String get contactName => 'Nome contatto';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String get deleteContact => 'Elimina contatto';

  @override
  String get deleteContactConfirm => 'Eliminare questo contatto?';

  @override
  String get deleteContactMessage =>
      'Questo eliminerà anche l\'intera conversazione.';

  @override
  String get delete => 'Elimina';

  @override
  String get typeMessage => 'Scrivi un messaggio...';

  @override
  String get messageSent => 'Inviato';

  @override
  String get messageDelivered => 'Consegnato';

  @override
  String get messageRead => 'Letto';

  @override
  String get messageFailed => 'Invio fallito';

  @override
  String get now => 'Ora';

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
    return '${count}g';
  }

  @override
  String get shareMessage =>
      'Unisciti a me su Hash! 🔒\n\nÈ un messenger davvero privato: crittografia totale, nessuna traccia sui server e modalità panico se necessario.\n\nScarica l\'app qui 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Errore';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get save => 'Salva';

  @override
  String get edit => 'Modifica';

  @override
  String get close => 'Chiudi';

  @override
  String get confirm => 'Conferma';

  @override
  String get loading => 'Caricamento...';

  @override
  String get retry => 'Riprova';
}
