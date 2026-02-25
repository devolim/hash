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
  String get conversations => 'Chat';

  @override
  String get contacts => 'Contatti';

  @override
  String get noConversation => 'Nessuna chat';

  @override
  String get noConversationSubtitle =>
      'Aggiungi un contatto per iniziare a chattare in sicurezza';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count richieste ricevute',
      one: '1 richiesta ricevuta',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count richieste inviate in attesa',
      one: '1 richiesta inviata in attesa',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Aggiungi contatto';

  @override
  String get shareApp => 'Condividi app';

  @override
  String get newMessage => 'Nuovo messaggio';

  @override
  String get newConversation => 'Invia un messaggio';

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
  String get languageAuto => 'Automatico (sistema)';

  @override
  String get notifications => 'Notifiche';

  @override
  String get messages => 'Messaggi';

  @override
  String get calls => 'Chiamate';

  @override
  String get vibration => 'Vibrazione';

  @override
  String get notificationContent => 'Contenuto delle notifiche';

  @override
  String get notificationContentFull => 'Mostra tutto';

  @override
  String get notificationContentFullDesc =>
      'Nome del contatto e anteprima del messaggio';

  @override
  String get notificationContentName => 'Solo nome';

  @override
  String get notificationContentNameDesc => 'Mostra solo il nome del contatto';

  @override
  String get notificationContentDiscrete => 'Discreto';

  @override
  String get notificationContentDiscreteDesc =>
      'Mostra solo \"Nuovo messaggio\"';

  @override
  String get security => 'Sicurezza';

  @override
  String get howHashProtectsYou => 'Come Hash ti protegge';

  @override
  String get howHashProtectsYouSubtitle => 'Comprendi la tua sicurezza';

  @override
  String get accountSecurity => 'Sicurezza account';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, Modalità Vash';

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
  String get autoLockImmediate => 'Immediato';

  @override
  String get autoLockMinute => '1 minuto';

  @override
  String autoLockMinutes(int count) {
    return '$count minuti';
  }

  @override
  String get vashCode => 'Codice Vash';

  @override
  String get vashModeTitle => 'Modalità Vash';

  @override
  String get vashModeExplanation => 'La tua rete di sicurezza definitiva.';

  @override
  String get vashModeDescription =>
      'Sceglierai un secondo codice PIN. Se un giorno sarai costretto ad aprire Hash, inserisci questo codice al posto del tuo PIN abituale.\n\nL\'app si aprirà normalmente, ma tutte le tue conversazioni e contatti saranno scomparsi.\n\nPer chiunque guardi il tuo schermo, Hash apparirà semplicemente vuoto — come se non lo avessi mai usato.';

  @override
  String get vashModeIrreversible =>
      'Questa azione è silenziosa e irreversibile.';

  @override
  String get chooseVashCode => 'Scegli il mio codice Vash';

  @override
  String get vashCodeInfo =>
      'Un secondo codice PIN che apre l\'app normalmente, ma vuota.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Se inserisci questo codice al posto del tuo PIN:';

  @override
  String get vashDeleteContacts => 'I tuoi contatti scompaiono';

  @override
  String get vashDeleteMessages => 'Le tue conversazioni scompaiono';

  @override
  String get vashDeleteHistory => 'Le tue note scompaiono';

  @override
  String get vashKeepId =>
      'La tua identità Hash (#XXX-XXX-XXX) rimane la stessa';

  @override
  String get vashAppearNormal =>
      'L\'app appare normale ma vuota, come nuova. Questa azione è irreversibile.';

  @override
  String get setupVashCode => 'Configura codice Vash';

  @override
  String get modifyVashCode => 'Modifica codice Vash';

  @override
  String get currentVashCode => 'Codice Vash attuale';

  @override
  String get newVashCode => 'Nuovo codice Vash';

  @override
  String get confirmVashCode => 'Conferma codice Vash';

  @override
  String get vashCodeConfigured => 'Codice Vash configurato';

  @override
  String get vashCodeModified => 'Codice Vash modificato';

  @override
  String get vashCodeMustDiffer => 'Il codice Vash deve essere diverso dal PIN';

  @override
  String get incorrectVashCode => 'Codice Vash errato';

  @override
  String get vashWhatToDelete => 'Cosa deve far scomparire la Modalità Vash?';

  @override
  String get vashDeleteContactsOption => 'Contatti';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Messaggi';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Note';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Modalità Vash attivata';

  @override
  String get vashCreateSubtitle =>
      'Scegli un codice diverso dal tuo PIN principale';

  @override
  String get vashConfirmSubtitle => 'Conferma il tuo codice Vash';

  @override
  String get pinCodeForEntry => 'Codice PIN per entrare nell\'applicazione';

  @override
  String get vashCodeSection => 'Modalità Vash';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Sblocca con impronta o Face ID';

  @override
  String get enableBiometric => 'Attiva biometria';

  @override
  String get biometricWarningMessage =>
      'Attivando la biometria, non potrai usare il tuo codice Vash per entrare nell\'applicazione.\n\nPotrai usare il codice Vash solo se la biometria fallisce (dopo diversi tentativi falliti).\n\nSei sicuro di voler continuare?';

  @override
  String get understood => 'Ho capito';

  @override
  String get shareAppSubtitle => 'Condividi Hash con i tuoi cari';

  @override
  String get share => 'Condividi';

  @override
  String get danger => 'Pericolo';

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
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Modalità Vash attivata.';

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
  String get tooManyAttempts => 'Troppi tentativi. Riprova più tardi.';

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
      'Codice PIN, Modalità Vash e frase di recupero';

  @override
  String get getStarted => 'Inizia';

  @override
  String get next => 'Avanti';

  @override
  String get skip => 'Salta';

  @override
  String get alreadyHaveAccount => 'Ho già un account';

  @override
  String get transferMyAccount => 'Trasferisci il mio account';

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
  String get myProfile => 'Il mio profilo';

  @override
  String get myProfileSubtitle =>
      'Condividi queste informazioni per farti aggiungere';

  @override
  String get temporaryCode => 'Codice temporaneo';

  @override
  String temporaryCodeExpires(String time) {
    return 'Scade tra $time';
  }

  @override
  String get codeExpired => 'Codice scaduto';

  @override
  String get generateNewCodeButton => 'Nuovo codice';

  @override
  String get copyHashId => 'Copia ID';

  @override
  String get copyCode => 'Copia codice';

  @override
  String get copiedToClipboard => 'Copiato';

  @override
  String get showMyQrCode => 'Mostra il mio QR code';

  @override
  String get orDivider => 'o';

  @override
  String get openScanner => 'Apri scanner';

  @override
  String get addManually => 'Aggiungi manualmente';

  @override
  String get contactHashIdLabel => 'Hash ID del contatto';

  @override
  String get temporaryCodeLabel => 'Codice temporaneo';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Chiedi al tuo contatto di generare un codice dal suo profilo';

  @override
  String get verifyAndAdd => 'Verifica e aggiungi';

  @override
  String get fillAllFields => 'Per favore, compila tutti i campi';

  @override
  String get invalidHashIdFormat => 'Formato ID non valido (es: 123-456-ABC)';

  @override
  String get userNotFound => 'Utente non trovato';

  @override
  String get cannotAddYourself => 'Non puoi aggiungere te stesso';

  @override
  String get invalidOrExpiredCode => 'Codice temporaneo non valido o scaduto';

  @override
  String get contactFound => 'Contatto trovato!';

  @override
  String get howToCallContact => 'Come vuoi chiamarlo?';

  @override
  String get contactNameHint => 'Nome del contatto';

  @override
  String get addContactButton => 'Aggiungi';

  @override
  String get contactDetails => 'Dettagli contatto';

  @override
  String get contactName => 'Nome contatto';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Aggiunto il $date';
  }

  @override
  String get deleteContact => 'Elimina contatto';

  @override
  String deleteContactConfirm(Object name) {
    return 'Eliminare questo contatto?';
  }

  @override
  String get deleteContactMessage => 'Questo eliminerà anche l\'intera chat.';

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
  String get today => 'Oggi';

  @override
  String get yesterday => 'Ieri';

  @override
  String dateAtTime(String date, String time) {
    return '$date alle $time';
  }

  @override
  String get shareMessage =>
      'Unisciti a me su Hash! 🔒\n\nÈ un messenger davvero privato: crittografia totale, nessuna traccia sui server e modalità panico se necessario.\n\nScarica l\'app qui 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Errore';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Vedi';

  @override
  String get yes => 'Si';

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

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Richieste ricevute';

  @override
  String get noPendingRequests => 'Nessuna richiesta in attesa';

  @override
  String get pendingRequestsSubtitle => 'Queste persone vogliono aggiungerti';

  @override
  String requestFromUser(String hashId) {
    return 'Richiesta da $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Scade tra $days giorni';
  }

  @override
  String get acceptRequest => 'Accetta';

  @override
  String get rejectRequest => 'Rifiuta';

  @override
  String get requestAccepted => 'Richiesta accettata';

  @override
  String get requestRejected => 'Richiesta rifiutata';

  @override
  String get requestSent => 'Richiesta inviata!';

  @override
  String get requestSentSubtitle =>
      'La tua richiesta è stata inviata. L\'utente deve accettarla per poter chattare.';

  @override
  String get requestAlreadyPending => 'Una richiesta è già in attesa';

  @override
  String get requestAlreadySentByOther =>
      'Questa persona ti ha già inviato una richiesta';

  @override
  String get addByHashId => 'Aggiungi per Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Inserisci l\'Hash ID e il codice temporaneo del contatto';

  @override
  String get enterTemporaryCode => 'Inserisci il codice a 6 cifre';

  @override
  String get sendRequest => 'Invia richiesta';

  @override
  String get acceptContactTitle => 'Accetta contatto';

  @override
  String get acceptContactSubtitle => 'Puoi dargli un nome personalizzato';

  @override
  String get leaveEmptyForHashId => 'Lascia vuoto per usare l\'Hash ID';

  @override
  String get firstName => 'Nome';

  @override
  String get lastName => 'Cognome';

  @override
  String get notes => 'Note';

  @override
  String get notesHint => 'Note personali su questo contatto';

  @override
  String get photoOptional => 'Foto (opzionale)';

  @override
  String get contactNameOptional => 'Nome (opzionale)';

  @override
  String get notesOptional => 'Note (opzionale)';

  @override
  String get storedLocally => 'Memorizzato solo sul tuo dispositivo';

  @override
  String get encryptedMessageLabel => 'Messaggio crittografato';

  @override
  String get identityMessageHint => 'Chi sei? Come vi conoscete?';

  @override
  String get messageWillBeSentEncrypted =>
      'Questo messaggio sarà crittografato e inviato al destinatario';

  @override
  String get sendRequestButton => 'Invia richiesta';

  @override
  String get requestExpiresIn24h =>
      'La richiesta scade in 24h se non accettata';

  @override
  String get theyAlreadySentYouRequest =>
      'Questa persona ti ha già inviato una richiesta';

  @override
  String get requests => 'Richieste';

  @override
  String get receivedRequests => 'Ricevute';

  @override
  String get sentRequests => 'Inviate';

  @override
  String get noSentRequests => 'Nessuna richiesta inviata';

  @override
  String get cancelRequest => 'Annulla';

  @override
  String get deleteRequest => 'Elimina richiesta';

  @override
  String get requestCancelled => 'Richiesta annullata';

  @override
  String sentTo(String hashId) {
    return 'Inviata a $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Scade tra $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Ricevuta $time fa';
  }

  @override
  String get messageFromRequester => 'Messaggio del richiedente';

  @override
  String get copy => 'Copia';

  @override
  String get messageInfo => 'Info messaggio';

  @override
  String get messageDirection => 'Direzione';

  @override
  String get messageSentByYou => 'Inviato da te';

  @override
  String get messageReceived => 'Ricevuto';

  @override
  String get messageSentAt => 'Inviato il';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Stato';

  @override
  String get messageReadAt => 'Letto il';

  @override
  String get messageType => 'Tipo';

  @override
  String get messageSize => 'Dimensione';

  @override
  String get messageExpiresAt => 'Scade il';

  @override
  String get messageEncrypted => 'Crittografato end-to-end';

  @override
  String get messageStatusSending => 'Invio...';

  @override
  String get messageStatusSent => 'Inviato';

  @override
  String get messageStatusDelivered => 'Consegnato';

  @override
  String get messageStatusRead => 'Letto';

  @override
  String get messageStatusFailed => 'Fallito';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'In attesa di consegna';

  @override
  String get deletedFromServer => 'Eliminato';

  @override
  String get messageTypeText => 'Testo';

  @override
  String get messageTypeImage => 'Immagine';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Audio';

  @override
  String get messageTypeFile => 'File';

  @override
  String get indefinitely => 'Indefinitamente';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'ore';

  @override
  String get minutes => 'minuti';

  @override
  String get seconds => 'secondi';

  @override
  String get ephemeralMessages => 'Messaggi effimeri';

  @override
  String get ephemeralMessagesDescription =>
      'I messaggi vengono eliminati automaticamente dopo questo tempo';

  @override
  String get ephemeralImmediate => 'Immediato';

  @override
  String get ephemeralImmediateDesc => 'Eliminato appena letto';

  @override
  String get ephemeralMyPreference => 'La mia preferenza';

  @override
  String get ephemeralMyPreferenceDesc => 'Usa l\'impostazione globale';

  @override
  String get ephemeralDefaultSetting => 'Durata dei messaggi';

  @override
  String get ephemeralChooseDefault => 'Consigliato';

  @override
  String get ephemeral30Seconds => '30 secondi';

  @override
  String get ephemeral30SecondsDesc => 'Eliminato 30s dopo la lettura';

  @override
  String get ephemeral5Minutes => '5 minuti';

  @override
  String get ephemeral5MinutesDesc => 'Eliminato 5min dopo la lettura';

  @override
  String get ephemeral1Hour => '1 ora';

  @override
  String get ephemeral1HourDesc => 'Eliminato 1h dopo la lettura';

  @override
  String get ephemeral3Hours => '3 ore';

  @override
  String get ephemeral6Hours => '6 ore';

  @override
  String get ephemeral6HoursDesc => 'Eliminato 6h dopo la lettura';

  @override
  String get ephemeral12Hours => '12 ore';

  @override
  String get ephemeral24Hours => '24 ore';

  @override
  String get ephemeral24HoursDesc => 'Eliminato 24h dopo la lettura';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Durata personalizzata';

  @override
  String get howItWorks => 'Come funziona?';

  @override
  String get ephemeralExplanation1 =>
      'I messaggi vengono già eliminati dal server alla ricezione.';

  @override
  String get ephemeralExplanation2 =>
      'Questa impostazione definisce quando i messaggi scompaiono dal TUO telefono dopo averli letti.';

  @override
  String get ephemeralExplanation3 =>
      'Il tuo contatto ha la sua impostazione per il suo telefono.';

  @override
  String get mute1Hour => '1 ora';

  @override
  String get mute8Hours => '8 ore';

  @override
  String get mute1Day => '1 giorno';

  @override
  String get mute1Week => '1 settimana';

  @override
  String get muteAlways => 'Sempre';

  @override
  String get muteExplanation =>
      'Non riceverai più notifiche per questo contatto';

  @override
  String get showCallsInRecents => 'Mostra nelle chiamate recenti';

  @override
  String get showCallsInRecentsSubtitle =>
      'Le chiamate Hash appaiono nella cronologia del telefono';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Silenzia notifiche';

  @override
  String get muteDescription => 'Non riceverai notifiche per questo contatto';

  @override
  String mutedUntil(String time) {
    return 'Silenziato fino a $time';
  }

  @override
  String get notMuted => 'Notifiche attivate';

  @override
  String get unmute => 'Riattiva';

  @override
  String get notificationSound => 'Suono di notifica';

  @override
  String get defaultSound => 'Predefinito';

  @override
  String get chatSettings => 'Impostazioni chat';

  @override
  String get bubbleColor => 'Colore delle bolle';

  @override
  String get backgroundColor => 'Colore di sfondo';

  @override
  String get backgroundImage => 'Immagine di sfondo';

  @override
  String get chatBackground => 'Sfondo della chat';

  @override
  String get customColor => 'Personalizzato';

  @override
  String get defaultColor => 'Predefinito';

  @override
  String get imageSelected => 'Immagine selezionata';

  @override
  String get noImage => 'Nessuna immagine';

  @override
  String get color => 'Colore';

  @override
  String get image => 'Immagine';

  @override
  String get tapToSelectImage => 'Tocca per selezionare un\'immagine';

  @override
  String get changeImage => 'Cambia immagine';

  @override
  String get previewMessageReceived => 'Ciao!';

  @override
  String get previewMessageSent => 'Ehi!';

  @override
  String get messageAction => 'Messaggio';

  @override
  String get callAction => 'Chiamata';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Note personali';

  @override
  String get addNotes => 'Aggiungi note...';

  @override
  String get noNotes => 'Nessuna nota';

  @override
  String get messageNotifications => 'Notifiche messaggi';

  @override
  String get callNotifications => 'Notifiche chiamate';

  @override
  String get useGradient => 'Usa sfumatura';

  @override
  String get gradientStart => 'Colore iniziale';

  @override
  String get gradientEnd => 'Colore finale';

  @override
  String get preview => 'Anteprima';

  @override
  String get reset => 'Ripristina';

  @override
  String get securityNumber => 'Numero di sicurezza';

  @override
  String securityNumberDescription(String name) {
    return 'Verifica che il numero di sicurezza corrisponda al dispositivo di $name';
  }

  @override
  String get verifyEncryption => 'Verifica crittografia end-to-end';

  @override
  String get tapToCopy => 'Tocca per copiare';

  @override
  String get howToVerify => 'Come verificare';

  @override
  String get verifyStep1 => 'Incontra il tuo contatto di persona o chiamalo';

  @override
  String get verifyStep2 =>
      'Confronta i numeri di sicurezza o scansiona i codici QR';

  @override
  String get verifyStep3 => 'Se corrispondono, la tua chat è sicura';

  @override
  String get scanToVerify => 'Scansiona per verificare';

  @override
  String get reportSpam => 'Segnala come spam';

  @override
  String get reportSpamSubtitle => 'Segnala questo contatto come spam';

  @override
  String get reportSpamDescription =>
      'Questo contatto sarà segnalato in modo anonimo. La tua identità non sarà condivisa. Sei sicuro?';

  @override
  String get report => 'Segnala';

  @override
  String get spamReported => 'Spam segnalato';

  @override
  String get reportError => 'Errore nell\'invio della segnalazione. Riprova.';

  @override
  String get reportRateLimited =>
      'Hai raggiunto il numero massimo di segnalazioni per oggi.';

  @override
  String get blockContact => 'Blocca contatto';

  @override
  String get blockContactDescription =>
      'Questo contatto non potrà più inviarti messaggi o chiamarti. Non sarà notificato.';

  @override
  String get unblockContact => 'Sblocca contatto';

  @override
  String get unblockContactDescription =>
      'Questo contatto potrà nuovamente inviarti messaggi e chiamarti.';

  @override
  String get contactBlocked => 'Contatto bloccato';

  @override
  String get contactUnblocked => 'Contatto sbloccato';

  @override
  String get contactIsBlocked => 'Questo contatto è bloccato';

  @override
  String get unblock => 'Sblocca';

  @override
  String get deleteContactSubtitle => 'Elimina questo contatto e la chat';

  @override
  String get confirmWithPin => 'Conferma con PIN';

  @override
  String get enterPinToConfirm =>
      'Inserisci il tuo PIN per confermare questa azione';

  @override
  String get profilePhoto => 'Foto profilo';

  @override
  String get takePhoto => 'Scatta una foto';

  @override
  String get chooseFromGallery => 'Scegli dalla galleria';

  @override
  String get removePhoto => 'Rimuovi foto';

  @override
  String get viewContactHashId => 'Visualizza identificativo del contatto';

  @override
  String get hashIdPartiallyMasked =>
      'Parzialmente mascherato per la tua sicurezza e quella del tuo contatto';

  @override
  String get addFirstContact => 'Aggiungi il tuo primo contatto';

  @override
  String get addFirstContactSubtitle =>
      'Condividi il tuo codice QR o scansiona quello di un amico';

  @override
  String get directory => 'Rubrica';

  @override
  String get noContacts => 'Nessun contatto';

  @override
  String get noContactsSubtitle => 'Aggiungi un contatto per iniziare';

  @override
  String get sendMessageAction => 'Invia un messaggio';

  @override
  String get audioCall => 'Chiamata audio';

  @override
  String get videoCall => 'Videochiamata';

  @override
  String get viewProfile => 'Visualizza profilo';

  @override
  String get deleteContactDirectory => 'Elimina contatto';

  @override
  String get scanShort => 'Scansiona';

  @override
  String get addShort => 'Aggiungi';

  @override
  String deleteContactConfirmName(String name) {
    return 'Vuoi davvero eliminare $name?';
  }

  @override
  String get noNotesTitle => 'Nessuna nota';

  @override
  String get noNotesSubtitle => 'Crea la tua prima nota';

  @override
  String get newNote => 'Nuova nota';

  @override
  String get editNote => 'Modifica nota';

  @override
  String get deleteNote => 'Elimina nota';

  @override
  String get deleteNoteConfirm => 'Vuoi davvero eliminare questa nota?';

  @override
  String get noteTitle => 'Titolo';

  @override
  String get noteContent => 'Contenuto';

  @override
  String get addItem => 'Aggiungi elemento';

  @override
  String get pinNote => 'Fissa';

  @override
  String get unpinNote => 'Rimuovi fissaggio';

  @override
  String get noteColor => 'Colore';

  @override
  String get notePassword => 'Password';

  @override
  String get setPassword => 'Imposta password';

  @override
  String get changePassword => 'Cambia password';

  @override
  String get removePassword => 'Rimuovi password';

  @override
  String get enterPassword => 'Inserisci la password';

  @override
  String get confirmPassword => 'Conferma la password';

  @override
  String get passwordPin => 'Codice PIN';

  @override
  String get passwordText => 'Password di testo';

  @override
  String get protectedNote => 'Nota protetta';

  @override
  String get incorrectPassword => 'Password errata';

  @override
  String get passwordSet => 'Password impostata';

  @override
  String get passwordRemoved => 'Password rimossa';

  @override
  String get notesBiometric => 'Face ID per le note';

  @override
  String get notesBiometricSubtitle =>
      'Richiedi autenticazione biometrica per aprire le note protette';

  @override
  String get textNote => 'Nota di testo';

  @override
  String get checklistNote => 'Lista di attività';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total attività';
  }

  @override
  String get autoSaved => 'Salvato';

  @override
  String get searchNotes => 'Cerca nota';

  @override
  String get legalConsent => 'Consenso legale';

  @override
  String get confirmAge13 => 'Confermo di avere almeno 13 anni';

  @override
  String get acceptLegalStart => 'Accetto la ';

  @override
  String get privacyPolicy => 'Informativa sulla privacy';

  @override
  String get termsOfService => 'Termini di servizio';

  @override
  String get andThe => ' e i ';

  @override
  String get continueButton => 'Continua';

  @override
  String get mustAcceptTerms =>
      'Devi accettare entrambe le condizioni per continuare';

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
  String get support => 'Supporto';

  @override
  String get contactSupport => 'Contatta il supporto';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Segnala abuso';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Legale';

  @override
  String get legalEntity => 'Entità legale';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fissa';

  @override
  String get unpinConversation => 'Sgancia';

  @override
  String get hideConversation => 'Rimuovi dal feed';

  @override
  String get deleteConversation => 'Elimina conversazione';

  @override
  String get deleteConversationConfirm =>
      'Inserisci il PIN per confermare l\'eliminazione di tutti i messaggi';

  @override
  String get noConversations => 'Nessuna conversazione';

  @override
  String get startConversation => 'Inizia';

  @override
  String get microphonePermissionRequired => 'Accesso al microfono richiesto';

  @override
  String get microphonePermissionExplanation =>
      'Hash ha bisogno del microfono per effettuare chiamate.';

  @override
  String get cameraPermissionExplanation =>
      'Hash ha bisogno della fotocamera per le videochiamate.';

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
  String get openSettings => 'Apri impostazioni';

  @override
  String get callConnecting => 'Connessione...';

  @override
  String get callRinging => 'Chiamata in corso...';

  @override
  String get callReconnecting => 'Riconnessione...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Riconnessione (${seconds}s)';
  }

  @override
  String get callPaused => 'In pausa';

  @override
  String get callPausedSubtitle => 'La chiamata è ancora attiva';

  @override
  String get callRemoteMicMuted => 'Microfono del contatto disattivato';

  @override
  String get callMiniControlsMute => 'Disattiva microfono';

  @override
  String get callMiniControlsUnmute => 'Attiva microfono';

  @override
  String get callMiniControlsHangUp => 'Riaggancia';

  @override
  String get callMiniControlsReturn => 'Torna alla chiamata';

  @override
  String get callNetworkPoor => 'Connessione instabile';

  @override
  String get callNetworkLost => 'Connessione persa';

  @override
  String get callEndedTitle => 'Chiamata terminata';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Dati del dispositivo';

  @override
  String get deviceDataSubtitle => 'Archiviazione locale e server';

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
  String get localStorage => 'Archiviazione locale';

  @override
  String get onThisDevice => 'su questo dispositivo';

  @override
  String get encryptedDatabases => 'Database crittografati';

  @override
  String get files => 'File';

  @override
  String get secureKeychain => 'Portachiavi sicuro';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Nomi, avatar, chiavi Signal';

  @override
  String get messagesDetail => 'Conversazioni crittografate';

  @override
  String get notesDetail => 'Note personali';

  @override
  String get signalSessions => 'Sessioni Signal';

  @override
  String get signalSessionsDetail => 'Sessioni di crittografia';

  @override
  String get pendingContacts => 'Contatti in attesa';

  @override
  String get pendingContactsDetail => 'Richieste in corso';

  @override
  String get callHistory => 'Chiamate';

  @override
  String get callHistoryDetail => 'Cronologia chiamate';

  @override
  String get preferences => 'Preferenze';

  @override
  String get preferencesDetail => 'Preferenze media e chiamate';

  @override
  String get avatars => 'Avatar';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
      zero: 'nessun file',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Attivo';

  @override
  String get notDefined => 'Non definito';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Frase di recupero';

  @override
  String get identity => 'Identità (Hash ID)';

  @override
  String get signalKeys => 'Chiavi Signal Protocol';

  @override
  String get authTokens => 'Token di autenticazione';

  @override
  String get contactNamesCache => 'Cache nomi contatti';

  @override
  String get remoteConfig => 'Config remota';

  @override
  String get notificationPrefs => 'Preferenze notifiche';

  @override
  String get serverData => 'Dati sul server';

  @override
  String get serverDataInfo =>
      'Hash conserva un minimo di dati sul server, tutti crittografati o temporanei.';

  @override
  String get serverProfile => 'Profilo';

  @override
  String get serverProfileDetail => 'Hash ID, chiavi pubbliche, token casella';

  @override
  String get serverPrekeys => 'Pre-chiavi';

  @override
  String get serverPrekeysDetail => 'Chiavi Signal monouso (consumate)';

  @override
  String get serverMessages => 'Messaggi in transito';

  @override
  String get serverMessagesDetail => 'Eliminati dopo la ricezione (max 24h)';

  @override
  String get serverMedia => 'Media in transito';

  @override
  String get serverMediaDetail => 'Eliminati dopo il download';

  @override
  String get serverContactRequests => 'Richieste di contatto';

  @override
  String get serverContactRequestsDetail => 'Scadono dopo 24h';

  @override
  String get serverRateLimits => 'Limiti di frequenza';

  @override
  String get serverRateLimitsDetail => 'Dati temporanei anti-abuso';

  @override
  String get privacyReassurance =>
      'Hash non può leggere i tuoi messaggi. Tutti i dati sono crittografati end-to-end. I dati del server vengono eliminati automaticamente.';

  @override
  String get pinTooSimple =>
      'Questo codice PIN è troppo semplice. Scegli un codice più sicuro.';

  @override
  String get genericError => 'Si è verificato un errore. Riprova.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Impossibile creare l\'account: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frase copiata negli appunti';

  @override
  String get copyPhrase => 'Copia la frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Annota questa frase in un luogo sicuro. Se perdi il tuo codice PIN senza questa frase, perderai definitivamente l\'accesso ai tuoi dati.';

  @override
  String get noMessages => 'Nessun messaggio';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Eliminare tutti i messaggi con $name?';
  }

  @override
  String get confirmation => 'Conferma';

  @override
  String get untitled => 'Senza titolo';

  @override
  String get noSessions => 'Nessuna sessione';

  @override
  String get unknownContact => 'Contatto sconosciuto';

  @override
  String get unnamed => 'Senza nome';

  @override
  String get noPendingRequestsAlt => 'Nessuna richiesta in attesa';

  @override
  String get deleteAllCallHistory =>
      'Eliminare tutta la cronologia delle chiamate?';

  @override
  String get noCalls => 'Nessuna chiamata';

  @override
  String get noPreferences => 'Nessuna preferenza';

  @override
  String get resetAllMediaPrefs => 'Ripristinare tutte le preferenze media?';

  @override
  String get deleteThisAvatar => 'Eliminare questo avatar?';

  @override
  String get deleteAllAvatars => 'Eliminare tutti gli avatar?';

  @override
  String get noAvatars => 'Nessun avatar';

  @override
  String get deleteThisFile => 'Eliminare questo file?';

  @override
  String get deleteAllMediaFiles => 'Eliminare tutti i media?';

  @override
  String get noMediaFiles => 'Nessun media';

  @override
  String get outgoing => 'In uscita';

  @override
  String get incoming => 'In entrata';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Vista effimera: ${seconds}s';
  }

  @override
  String get normalView => 'Vista normale';

  @override
  String get callReasonCompleted => 'Completata';

  @override
  String get callReasonMissed => 'Persa';

  @override
  String get callReasonDeclined => 'Rifiutata';

  @override
  String get callReasonFailed => 'Fallita';

  @override
  String get justNow => 'Adesso';

  @override
  String timeAgoMinutes(int count) {
    return '$count min fa';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}h fa';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}g fa';
  }

  @override
  String get messageTypeContact => 'Contatto';

  @override
  String get messageTypeLocation => 'Posizione';

  @override
  String get statusQueued => 'In coda';

  @override
  String get blockedBadge => 'Bloccato';

  @override
  String get protectedBadge => 'Protetta';

  @override
  String messageCount(int count) {
    return '$count messaggio/i';
  }

  @override
  String get deleteQuestion => 'Eliminare?';

  @override
  String get transferMyAccountTitle => 'Trasferisci il mio account';

  @override
  String get loadingError => 'Errore di caricamento';

  @override
  String get transferToNewDevice => 'Trasferisci su un nuovo dispositivo';

  @override
  String get transferInstructions =>
      'Sul tuo nuovo dispositivo, scegli \"Recupera il mio account\" e inserisci queste informazioni:';

  @override
  String get yourHashIdLabel => 'Il tuo Hash ID';

  @override
  String get enterYourPinCode => 'Inserisci il tuo codice PIN';

  @override
  String get pinOwnerConfirmation =>
      'Per confermare che sei il proprietario di questo account';

  @override
  String get scanThisQrCode => 'Scansiona questo codice QR';

  @override
  String get withYourNewDevice => 'Con il tuo nuovo dispositivo';

  @override
  String get orEnterTheCode => 'oppure inserisci il codice';

  @override
  String get transferCodeLabel => 'Codice di trasferimento';

  @override
  String get proximityVerification => 'Verifica di prossimità';

  @override
  String get bringDevicesCloser => 'Avvicina i due dispositivi';

  @override
  String get confirmTransferQuestion => 'Confermare il trasferimento?';

  @override
  String get accountWillBeTransferred =>
      'Il tuo account sarà trasferito sul nuovo dispositivo.\n\nQuesto dispositivo sarà definitivamente disconnesso.';

  @override
  String get transferComplete => 'Trasferimento completato';

  @override
  String get transferSuccessMessage =>
      'Il tuo account è stato trasferito con successo.\n\nQuesta applicazione si chiuderà ora.';

  @override
  String get manualVerification => 'Verifica manuale';

  @override
  String get codeDisplayedOnBothDevices =>
      'Codice visualizzato su entrambi i dispositivi:';

  @override
  String get doesCodeMatchNewDevice =>
      'Questo codice corrisponde a quello del nuovo dispositivo?';

  @override
  String get verifiedStatus => 'Verificato';

  @override
  String get inProgressStatus => 'In corso...';

  @override
  String get notAvailableStatus => 'Non disponibile';

  @override
  String get codeExpiredRestart => 'Il codice è scaduto. Ricomincia.';

  @override
  String get codesDoNotMatchCancelled =>
      'I codici non corrispondono. Trasferimento annullato.';

  @override
  String transferToDevice(String device) {
    return 'Verso: $device';
  }

  @override
  String get copiedExclamation => 'Copiato!';

  @override
  String expiresInTime(String time) {
    return 'Scade tra $time';
  }

  @override
  String get biometricNotAvailable =>
      'La biometria non è disponibile su questo dispositivo';

  @override
  String get biometricAuthError =>
      'Errore durante l\'autenticazione biometrica';

  @override
  String get authenticateForBiometric =>
      'Autenticati per attivare la biometria';

  @override
  String get biometricAuthFailed => 'Autenticazione biometrica fallita';

  @override
  String get forceUpdateTitle => 'Aggiornamento richiesto';

  @override
  String get forceUpdateMessage =>
      'È disponibile una nuova versione di Hash. Aggiorna per continuare.';

  @override
  String get updateButton => 'Aggiorna';

  @override
  String get maintenanceInProgress => 'Manutenzione in corso';

  @override
  String get tryAgainLater => 'Riprova più tardi';

  @override
  String get information => 'Informazione';

  @override
  String get later => 'Più tardi';

  @override
  String get doYouLikeHash => 'Ti piace Hash?';

  @override
  String get yourFeedbackHelps =>
      'Il tuo feedback ci aiuta a migliorare l\'app';

  @override
  String get ratingTerrible => 'Terribile';

  @override
  String get ratingBad => 'Brutto';

  @override
  String get ratingOk => 'Discreto';

  @override
  String get ratingGood => 'Buono';

  @override
  String get ratingExcellent => 'Eccellente!';

  @override
  String get donationMessage =>
      'Hash è un progetto senza scopo di lucro. Il tuo supporto ci permette di continuare a sviluppare un messenger davvero privato.';

  @override
  String get recentConnections => 'Connessioni recenti';

  @override
  String get loginInfoText =>
      'Ogni sblocco tramite PIN viene registrato localmente. Vengono conservate solo le ultime 24 ore.';

  @override
  String get connectionCount => 'Connessione/i';

  @override
  String get periodLabel => 'Periodo';

  @override
  String get historyLabel => 'Cronologia';

  @override
  String get noLoginRecorded => 'Nessuna connessione registrata';

  @override
  String get nextUnlocksAppearHere => 'I prossimi sblocchi appariranno qui.';

  @override
  String get dataLocalOnly =>
      'Questi dati sono memorizzati solo sul tuo dispositivo e non vengono mai trasmessi.';

  @override
  String get currentSession => 'Attuale';

  @override
  String get todayLabel => 'Oggi';

  @override
  String get yesterdayLabel => 'Ieri';

  @override
  String get justNowLabel => 'Adesso';

  @override
  String minutesAgoLabel(int count) {
    return '$count min fa';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}h fa';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}h ${minutes}min fa';
  }

  @override
  String get noMaintenancePlanned => 'Nessuna manutenzione prevista';

  @override
  String get everythingWorkingNormally => 'Tutto funziona normalmente';

  @override
  String get maintenanceTitle => 'Manutenzione';

  @override
  String get maintenanceActiveLabel => 'IN CORSO';

  @override
  String get maintenancePlannedLabel => 'PREVISTA';

  @override
  String get locking => 'Blocco...';

  @override
  String get newMessageNotification => 'Nuovo messaggio';

  @override
  String get secExplainTitle => 'Come Hash ti protegge';

  @override
  String get secExplainIntro =>
      'Hash è progettato in modo che nessuno possa leggere i tuoi messaggi.';

  @override
  String get secExplainIntroSub =>
      'Nemmeno noi.\nEcco come funziona, spiegato semplicemente.';

  @override
  String get secJourneyLabel => 'IL PERCORSO';

  @override
  String get secJourneyTitle => 'Il viaggio del tuo messaggio';

  @override
  String get secJourneySubtitle =>
      'Dal tuo dito allo schermo del tuo contatto, ogni passaggio è protetto. Segui il percorso.';

  @override
  String get secStep1Title => 'Scrivi il tuo messaggio';

  @override
  String get secStep1Desc =>
      'Scrivi \"Ciao!\" nell\'app. In questo momento, il messaggio esiste solo nella memoria del tuo telefono. Niente è stato inviato.';

  @override
  String get secStep2Title => 'Crittografia con il protocollo Signal';

  @override
  String get secStep2Desc =>
      'Quando premi \"Invia\", il tuo messaggio viene trasformato in una serie di caratteri incomprensibili. È come se il tuo messaggio fosse chiuso in una cassaforte di cui solo il tuo contatto possiede la chiave.';

  @override
  String get secStep3Title => 'Sealed Sender: la busta invisibile';

  @override
  String get secStep3Desc =>
      'Immagina di inviare una lettera per posta, ma senza indirizzo del mittente sulla busta. È esattamente ciò che fa Hash. Il messaggio viene depositato in una casella postale anonima. Il server non sa chi lo ha inviato.';

  @override
  String get secStep4Title => 'Il server non vede nulla';

  @override
  String get secStep4Desc =>
      'Il server funge da postino cieco. Sa solo che \"qualcuno ha depositato qualcosa nella casella #A7X9\". Non sa chi lo ha inviato, cosa sia, né a chi è destinato.';

  @override
  String get secStep4Highlight =>
      'Nessun metadato memorizzato: nessun indirizzo IP, nessun timestamp, nessun collegamento tra mittente e destinatario.';

  @override
  String get secStep5Title => 'Il tuo contatto riceve il messaggio';

  @override
  String get secStep5Desc =>
      'Il telefono del tuo contatto recupera il contenuto dalla sua casella postale anonima e decritta il messaggio con la sua chiave privata, che non ha mai lasciato il suo dispositivo. \"Ciao!\" appare sul suo schermo.';

  @override
  String get secStep6Title => 'Il messaggio scompare dal server';

  @override
  String get secStep6Desc =>
      'Non appena il tuo contatto conferma la ricezione, il server elimina definitivamente il messaggio. Nessun cestino, nessun archivio, nessun backup. Anche i messaggi non letti vengono automaticamente distrutti dopo 24 ore.';

  @override
  String get secStep7Title => 'Scadenza locale';

  @override
  String get secStep7Desc =>
      'Sul telefono del tuo contatto, il messaggio si autodistrugge secondo la durata che hai scelto: immediatamente dopo la lettura, 5 minuti, 1 ora... decidi tu.';

  @override
  String get secJourneyConclusion =>
      'Risultato: zero tracce sul server, zero tracce sui dispositivi. Il messaggio è esistito il tempo di essere letto, poi è scomparso.';

  @override
  String get secArchLabel => 'ARCHITETTURA';

  @override
  String get secArchTitle => '5 livelli di protezione';

  @override
  String get secArchSubtitle =>
      'Hash non si basa su una sola tecnologia. Ogni livello rafforza gli altri. Anche se un livello viene compromesso, i tuoi dati rimangono al sicuro.';

  @override
  String get secLayer1Title => 'Crittografia end-to-end';

  @override
  String get secLayer1Desc =>
      'Ogni messaggio viene crittografato con una chiave unica. In parole semplici: anche se qualcuno decifra un messaggio, non potrà decifrare il successivo. Ogni messaggio ha il proprio lucchetto.';

  @override
  String get secLayer1Detail =>
      'Per i file (foto, video, documenti), Hash utilizza una crittografia AES-256-GCM aggiuntiva. Il file viene crittografato prima di lasciare il tuo telefono.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimato di rete)';

  @override
  String get secLayer2Desc =>
      'Le app di messaggistica classiche inviano i tuoi messaggi con la tua identità allegata. È come scrivere il tuo nome sulla busta. Hash utilizza caselle postali anonime: il server deposita il messaggio senza sapere chi lo ha inviato.';

  @override
  String get secLayer2Detail =>
      'Risultato: anche in caso di violazione dei dati del server, è impossibile ricostruire chi parla con chi.';

  @override
  String get secLayer3Title => 'Eliminazione automatica';

  @override
  String get secLayer3Desc =>
      'I messaggi vengono eliminati dal server alla ricezione confermata. Anche se un messaggio non viene mai recuperato, viene automaticamente distrutto dopo 24 ore.';

  @override
  String get secLayer3Detail =>
      'Sul tuo telefono, i messaggi si autodistruggono secondo la durata che scegli: immediatamente, 5 min, 15 min, 30 min, 1h, 3h, 6h o 12h.';

  @override
  String get secLayer4Title => 'Protezione dell\'accesso locale';

  @override
  String get secLayer4Desc =>
      'L\'app è protetta da un codice PIN a 6 cifre e/o dalla biometria (Face ID, impronta digitale). Dopo troppi tentativi falliti, l\'app si blocca con un ritardo che aumenta ad ogni fallimento.';

  @override
  String get secLayer5Title => 'Database bloccato';

  @override
  String get secLayer5Desc =>
      'Lato server, nessun utente può scrivere direttamente nel database. Tutte le azioni passano attraverso funzioni sicure che verificano ogni richiesta.';

  @override
  String get secLayer5Detail =>
      'È come lo sportello di una banca: non tocchi mai la cassaforte tu stesso. Fai una richiesta, e il sistema verifica che tu ne abbia il diritto prima di agire.';

  @override
  String get secVashLabel => 'UNICO AL MONDO';

  @override
  String get secVashTitle => 'Modalità Vash';

  @override
  String get secVashSubtitle =>
      'Un sistema di sicurezza d\'emergenza che non esiste in nessun\'altra app di messaggistica.';

  @override
  String get secVashScenarioTitle => 'Immagina questa situazione';

  @override
  String get secVashScenario1 => 'Qualcuno accede al tuo telefono';

  @override
  String get secVashScenario2 => 'Ti chiedono il codice PIN';

  @override
  String get secVashScenario3 => 'Vuoi cancellare tutti i tuoi dati d\'urgenza';

  @override
  String get secVashSolutionTitle => 'La soluzione: due codici PIN';

  @override
  String get secVashSolutionDesc => 'Configuri due codici PIN diversi in Hash:';

  @override
  String get secVashNormalCodeLabel => 'Codice normale';

  @override
  String get secVashNormalCodeDesc =>
      'Apre l\'app normalmente con tutti i tuoi dati';

  @override
  String get secVashCodeLabel2 => 'Codice Vash';

  @override
  String get secVashCodeDescription =>
      'Apre l\'app normalmente... ma tutti i tuoi dati vengono silenziosamente eliminati in background';

  @override
  String get secVashWhatHappensTitle => 'Cosa succede dopo';

  @override
  String get secVashWhatHappensDesc =>
      'L\'app si apre normalmente. Nessun avviso, nessuna animazione sospetta. Lo schermo mostra semplicemente un\'app vuota, come se l\'avessi appena installata.\n\nIn realtà, tutte le tue conversazioni, contatti e messaggi sono stati irreversibilmente eliminati in una frazione di secondo.';

  @override
  String get secCallsLabel => 'CHIAMATE E FILE';

  @override
  String get secCallsTitle => 'Tutto è crittografato';

  @override
  String get secCallsSubtitle =>
      'Non solo i messaggi. Assolutamente tutto ciò che transita per Hash è crittografato end-to-end.';

  @override
  String get secAudioCallTitle => 'Chiamate audio';

  @override
  String get secAudioCallDesc =>
      'Crittografate end-to-end tramite WebRTC. La voce viene trasmessa direttamente tra i dispositivi.';

  @override
  String get secVideoCallTitle => 'Videochiamate';

  @override
  String get secVideoCallDesc =>
      'Stessa tecnologia, ogni flusso crittografato individualmente.';

  @override
  String get secPhotosTitle => 'Foto e video';

  @override
  String get secPhotosDesc =>
      'Crittografati in AES-256-GCM prima di lasciare il tuo telefono.';

  @override
  String get secDocsTitle => 'Documenti';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, qualsiasi file. Nome, dimensione e contenuto crittografati.';

  @override
  String get secAnonLabel => 'ANONIMATO';

  @override
  String get secAnonTitle => 'Nessuna identità richiesta';

  @override
  String get secAnonSubtitle =>
      'Hash non chiede mai il tuo numero di telefono né la tua email. Sei identificato da un Hash ID unico e anonimo.';

  @override
  String get secHashIdTitle => 'Il tuo Hash ID';

  @override
  String get secHashIdDesc =>
      'È il tuo identificativo unico. Non rivela nulla su di te: né il tuo nome, né il tuo numero, né la tua posizione. È come uno pseudonimo impossibile da collegare alla tua vera identità.\n\nPer aggiungere un contatto, condividi il tuo Hash ID o scansioni un codice QR. È tutto. Nessuna rubrica sincronizzata, nessun suggerimento \"Persone che potresti conoscere\".';

  @override
  String get secDataLabel => 'DATI';

  @override
  String get secDataTitle => 'Cosa Hash non sa';

  @override
  String get secDataSubtitle =>
      'Il modo migliore per proteggere i tuoi dati è non raccoglierli.';

  @override
  String get secNeverCollected => 'Mai raccolto';

  @override
  String get secNeverItem1 => 'Contenuto dei messaggi';

  @override
  String get secNeverItem2 => 'Lista dei contatti';

  @override
  String get secNeverItem3 => 'Numero di telefono';

  @override
  String get secNeverItem4 => 'Indirizzo email';

  @override
  String get secNeverItem5 => 'Indirizzo IP';

  @override
  String get secNeverItem6 => 'Posizione';

  @override
  String get secNeverItem7 => 'Metadati (chi parla con chi)';

  @override
  String get secNeverItem8 => 'Cronologia delle chiamate';

  @override
  String get secNeverItem9 => 'Rubrica';

  @override
  String get secNeverItem10 => 'Identificatori pubblicitari';

  @override
  String get secTempStored => 'Memorizzato temporaneamente';

  @override
  String get secTempItem1 => 'Hash ID anonimo (identificativo unico)';

  @override
  String get secTempItem2 => 'Chiavi pubbliche di crittografia';

  @override
  String get secTempItem3 => 'Messaggi crittografati in transito (max 24h)';

  @override
  String get secTempNote =>
      'Anche questi dati minimi non permettono di identificarti. Il tuo Hash ID non è collegato a nessuna informazione personale.';

  @override
  String get secFooterTitle => 'La tua privacy, la tua libertà';

  @override
  String get secFooterDesc =>
      'Hash utilizza le stesse tecnologie di crittografia delle applicazioni professionali più esigenti. I tuoi messaggi sono protetti dalla matematica, non da promesse.';

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
