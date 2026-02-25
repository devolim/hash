// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero rastre. Zero compromís.';

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
  String get conversations => 'Xats';

  @override
  String get contacts => 'Contactes';

  @override
  String get noConversation => 'Cap xat';

  @override
  String get noConversationSubtitle =>
      'Afegeix un contacte per començar a xatejar de forma segura';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sol·licituds pendents',
      one: '1 sol·licitud pendent',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sol·licituds enviades pendents',
      one: '1 sol·licitud enviada pendent',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Afegir contacte';

  @override
  String get shareApp => 'Compartir l\'aplicació';

  @override
  String get newMessage => 'Missatge nou';

  @override
  String get newConversation => 'Envia un missatge';

  @override
  String get settings => 'Configuració';

  @override
  String get myHashId => 'El meu Hash ID';

  @override
  String get supportHash => 'Dona suport a Hash';

  @override
  String get supportHashSubtitle => 'Hash és un projecte sense ànim de lucre';

  @override
  String get donate => 'Donar';

  @override
  String get appearance => 'Aparença';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automàtic';

  @override
  String get themeAutoSubtitle => 'Segueix la configuració del sistema';

  @override
  String get themeDark => 'Fosc';

  @override
  String get themeLight => 'Clar';

  @override
  String get themeRecommendation =>
      'El tema fosc es recomana per a més privacitat';

  @override
  String get language => 'Idioma';

  @override
  String get languageAuto => 'Automàtic (sistema)';

  @override
  String get notifications => 'Notificacions';

  @override
  String get messages => 'Missatges';

  @override
  String get calls => 'Trucades';

  @override
  String get vibration => 'Vibració';

  @override
  String get notificationContent => 'Contingut de les notificacions';

  @override
  String get notificationContentFull => 'Mostra-ho tot';

  @override
  String get notificationContentFullDesc =>
      'Nom del contacte i previsualització del missatge';

  @override
  String get notificationContentName => 'Només el nom';

  @override
  String get notificationContentNameDesc => 'Mostra només el nom del contacte';

  @override
  String get notificationContentDiscrete => 'Discret';

  @override
  String get notificationContentDiscreteDesc => 'Mostra només \"Missatge nou\"';

  @override
  String get security => 'Seguretat';

  @override
  String get howHashProtectsYou => 'Com Hash et protegeix';

  @override
  String get howHashProtectsYouSubtitle => 'Entén la teva seguretat';

  @override
  String get accountSecurity => 'Seguretat del compte';

  @override
  String get accountSecuritySubtitle => 'PIN, biomètrics, Mode Vash';

  @override
  String get blockScreenshots => 'Bloquejar captures de pantalla';

  @override
  String get transferDevice => 'Transferir a un altre dispositiu';

  @override
  String get transferDeviceSubtitle => 'Migrar el teu compte';

  @override
  String get pinCode => 'Codi PIN';

  @override
  String get changePin => 'Canviar codi PIN';

  @override
  String get currentPin => 'Codi PIN actual';

  @override
  String get newPin => 'Nou codi PIN';

  @override
  String get confirmPin => 'Confirmar codi PIN';

  @override
  String get pinChanged => 'Codi PIN canviat';

  @override
  String get incorrectPin => 'PIN incorrecte';

  @override
  String get pinsDoNotMatch => 'Els PIN no coincideixen';

  @override
  String get autoLock => 'Bloqueig automàtic';

  @override
  String get autoLockDelay => 'Retard de bloqueig';

  @override
  String get autoLockImmediate => 'Immediat';

  @override
  String get autoLockMinute => '1 minut';

  @override
  String autoLockMinutes(int count) {
    return '$count minuts';
  }

  @override
  String get vashCode => 'Codi Vash';

  @override
  String get vashModeTitle => 'Mode Vash';

  @override
  String get vashModeExplanation => 'La teva xarxa de seguretat definitiva.';

  @override
  String get vashModeDescription =>
      'Triaràs un segon codi PIN. Si alguna vegada et forcen a obrir Hash, introdueix aquest codi en lloc del teu PIN habitual.\n\nL\'aplicació s\'obrirà normalment, però totes les teves converses i contactes hauran desaparegut.\n\nPer a qualsevol que miri la teva pantalla, Hash simplement apareix buit — com si mai l\'haguessis usat.';

  @override
  String get vashModeIrreversible =>
      'Aquesta acció és silenciosa i irreversible.';

  @override
  String get chooseVashCode => 'Triar el meu codi Vash';

  @override
  String get vashCodeInfo =>
      'Un segon codi PIN que obre l\'aplicació normalment, però buida.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Si introdueixes aquest codi en lloc del teu PIN:';

  @override
  String get vashDeleteContacts => 'Els teus contactes desapareixen';

  @override
  String get vashDeleteMessages => 'Les teves converses desapareixen';

  @override
  String get vashDeleteHistory => 'Les teves notes desapareixen';

  @override
  String get vashKeepId =>
      'La teva identitat Hash (#XXX-XXX-XXX) es manté igual';

  @override
  String get vashAppearNormal =>
      'L\'aplicació apareix normal però buida, com nova. Aquesta acció és irreversible.';

  @override
  String get setupVashCode => 'Configurar codi Vash';

  @override
  String get modifyVashCode => 'Modificar codi Vash';

  @override
  String get currentVashCode => 'Codi Vash actual';

  @override
  String get newVashCode => 'Nou codi Vash';

  @override
  String get confirmVashCode => 'Confirmar codi Vash';

  @override
  String get vashCodeConfigured => 'Codi Vash configurat';

  @override
  String get vashCodeModified => 'Codi Vash modificat';

  @override
  String get vashCodeMustDiffer => 'El codi Vash ha de ser diferent del PIN';

  @override
  String get incorrectVashCode => 'Codi Vash incorrecte';

  @override
  String get vashWhatToDelete => 'Què ha de fer desaparèixer el Mode Vash?';

  @override
  String get vashDeleteContactsOption => 'Contactes';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Missatges';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notes';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Mode Vash activat';

  @override
  String get vashCreateSubtitle =>
      'Tria un codi diferent del teu PIN principal';

  @override
  String get vashConfirmSubtitle => 'Confirma el teu codi Vash';

  @override
  String get pinCodeForEntry => 'Codi PIN per entrar a l\'aplicació';

  @override
  String get vashCodeSection => 'Mode Vash';

  @override
  String get biometric => 'Biomètrics';

  @override
  String get biometricUnlock => 'Desbloquejar amb empremta o Face ID';

  @override
  String get enableBiometric => 'Activar biomètrics';

  @override
  String get biometricWarningMessage =>
      'En activar els biomètrics, no podràs usar el teu codi Vash per entrar a l\'aplicació.\n\nNomés podràs usar el codi Vash si els biomètrics fallen (després de diversos intents fallits).\n\nEstàs segur que vols continuar?';

  @override
  String get understood => 'Ho entenc';

  @override
  String get shareAppSubtitle => 'Comparteix Hash amb els teus propers';

  @override
  String get share => 'Compartir';

  @override
  String get danger => 'Perill';

  @override
  String get deleteAccount => 'Eliminar el meu compte';

  @override
  String get deleteAccountSubtitle => 'Acció irreversible';

  @override
  String get deleteAccountConfirmTitle => 'Eliminar el meu compte';

  @override
  String get deleteAccountConfirmMessage =>
      'El teu compte s\'eliminarà permanentment. Aquesta acció és irreversible.\n\n• Tots els teus xats\n• Tots els teus contactes\n• El teu Hash ID\n\nHauràs de crear un compte nou.';

  @override
  String get deleteForever => 'Eliminar permanentment';

  @override
  String get cancel => 'Cancel·lar';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Mode Vash activat.';

  @override
  String deletionError(String error) {
    return 'Error d\'eliminació: $error';
  }

  @override
  String get yourSecurity => 'La teva seguretat';

  @override
  String get securityInfo =>
      '• Xifrat d\'extrem a extrem (Signal Protocol)\n• Cap dada als nostres servidors després del lliurament\n• Claus emmagatzemades només al teu dispositiu\n• Codi PIN mai enviat al servidor';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Benvingut';

  @override
  String get securityStatement1 => 'Els teus missatges estan protegits.';

  @override
  String get securityStatement2 => 'Xifrat d\'extrem a extrem.';

  @override
  String get securityStatement3 => 'Cap rastre. Cap compromís.';

  @override
  String get securityStatement4 => 'La teva privacitat és un dret.';

  @override
  String get accessBlocked => 'Accés bloquejat';

  @override
  String get tooManyAttempts => 'Massa intents. Torna-ho a provar més tard.';

  @override
  String get pleaseWait => 'Si us plau, espera';

  @override
  String get waitDelay => 'Si us plau, espera que finalitzi el retard';

  @override
  String attemptCount(int current, int max) {
    return 'Intent $current de $max';
  }

  @override
  String retryIn(String time) {
    return 'Torna-ho a provar en $time';
  }

  @override
  String get forgotPin => 'Has oblidat el PIN? Usa la frase de recuperació';

  @override
  String get useRecoveryPhrase => 'Usar la frase de recuperació';

  @override
  String get recoveryWarningTitle => 'Atenció';

  @override
  String get recoveryWarningMessage => 'La recuperació del compte:';

  @override
  String get recoveryDeleteAllMessages => 'Eliminarà TOTS els teus missatges';

  @override
  String get recoveryWaitDelay => 'Requerirà un retard d\'1 hora';

  @override
  String get recoveryKeepContacts => 'Conservarà els teus contactes';

  @override
  String get recoveryIrreversible =>
      'Aquesta acció és irreversible. Els teus missatges es perdran permanentment.';

  @override
  String get iUnderstand => 'Ho entenc';

  @override
  String get accountRecovery => 'Recuperació del compte';

  @override
  String get enterRecoveryPhrase =>
      'Introdueix les 24 paraules de la teva frase de recuperació, separades per espais.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Recuperar';

  @override
  String get recoveryPhraseRequired =>
      'Si us plau, introdueix la teva frase de recuperació';

  @override
  String get recoveryPhrase24Words =>
      'La frase ha de contenir exactament 24 paraules';

  @override
  String get incorrectRecoveryPhrase => 'Frase de recuperació incorrecta';

  @override
  String get recoveryInitError => 'Error en inicialitzar la recuperació';

  @override
  String get securityDelay => 'Retard de seguretat';

  @override
  String get securityDelayMessage =>
      'Per la teva seguretat, cal un temps d\'espera abans de poder crear un nou PIN.';

  @override
  String get timeRemaining => 'Temps restant';

  @override
  String get messagesDeletedForProtection =>
      'Els teus missatges s\'han eliminat per la teva protecció.';

  @override
  String get canCloseApp => 'Pots tancar l\'aplicació i tornar més tard.';

  @override
  String get onboardingTitle1 => 'Benvingut a Hash';

  @override
  String get onboardingSubtitle1 => 'El missatger que no deixa rastre';

  @override
  String get onboardingTitle2 => 'Xifrat total';

  @override
  String get onboardingSubtitle2 =>
      'Els teus missatges estan xifrats d\'extrem a extrem amb el protocol Signal';

  @override
  String get onboardingTitle3 => 'Cap rastre';

  @override
  String get onboardingSubtitle3 =>
      'Els missatges s\'eliminen dels servidors un cop lliurats';

  @override
  String get onboardingTitle4 => 'La teva seguretat';

  @override
  String get onboardingSubtitle4 =>
      'Codi PIN, Mode Vash i frase de recuperació';

  @override
  String get getStarted => 'Començar';

  @override
  String get next => 'Següent';

  @override
  String get skip => 'Saltar';

  @override
  String get alreadyHaveAccount => 'Ja tinc un compte';

  @override
  String get transferMyAccount => 'Transferir el meu compte';

  @override
  String get createPin => 'Crea un codi PIN';

  @override
  String get createPinSubtitle =>
      'Aquest codi protegirà l\'accés a la teva aplicació';

  @override
  String get confirmYourPin => 'Confirma el teu codi PIN';

  @override
  String get confirmPinSubtitle => 'Torna a introduir el teu codi PIN';

  @override
  String get saveRecoveryPhrase => 'Frase de recuperació';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Apunta aquestes 24 paraules en ordre. Et permetran recuperar el teu compte si oblides el PIN.';

  @override
  String get phraseWritten => 'He apuntat la meva frase';

  @override
  String get warningRecoveryPhrase =>
      'Si perds aquesta frase i oblides el PIN, perdràs l\'accés al teu compte.';

  @override
  String get accountTransferred => 'Compte transferit';

  @override
  String get accountTransferredMessage =>
      'El teu compte s\'ha transferit a un altre dispositiu. Aquesta sessió ja no és vàlida.';

  @override
  String get accountTransferredInfo =>
      'Si no has iniciat aquesta transferència, el teu compte podria estar compromès.';

  @override
  String get logout => 'Tancar sessió';

  @override
  String get transferAccount => 'Transferir compte';

  @override
  String get transferAccountInfo =>
      'Transfereix el teu compte Hash a un nou dispositiu. La teva sessió actual serà invalidada.';

  @override
  String get generateTransferCode => 'Generar codi de transferència';

  @override
  String get transferCode => 'Codi de transferència';

  @override
  String transferCodeExpires(int minutes) {
    return 'Aquest codi caduca en $minutes minuts';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Introdueix aquest codi al teu nou dispositiu per transferir el compte.';

  @override
  String get generateNewCode => 'Generar nou codi';

  @override
  String get scanQrCode => 'Escanejar codi QR';

  @override
  String get scanQrCodeSubtitle =>
      'Escaneja el codi QR d\'un contacte per afegir-lo';

  @override
  String get qrCodeDetected => 'Codi QR detectat';

  @override
  String get invalidQrCode => 'Codi QR no vàlid';

  @override
  String get cameraPermissionRequired => 'Permís de càmera requerit';

  @override
  String get myQrCode => 'El meu codi QR';

  @override
  String get myQrCodeSubtitle =>
      'Comparteix aquest codi QR perquè els teus contactes et puguin afegir';

  @override
  String get shareQrCode => 'Compartir';

  @override
  String get addContactTitle => 'Afegir contacte';

  @override
  String get addContactByHashId => 'Introdueix el Hash ID del teu contacte';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Cercar';

  @override
  String get contactNotFound => 'Contacte no trobat';

  @override
  String get contactAlreadyAdded => 'Aquest contacte ja és a la teva llista';

  @override
  String get contactAdded => 'Contacte afegit';

  @override
  String get myProfile => 'El meu perfil';

  @override
  String get myProfileSubtitle =>
      'Comparteix aquesta informació perquè et puguin afegir';

  @override
  String get temporaryCode => 'Codi temporal';

  @override
  String temporaryCodeExpires(String time) {
    return 'Caduca en $time';
  }

  @override
  String get codeExpired => 'Codi caducat';

  @override
  String get generateNewCodeButton => 'Nou codi';

  @override
  String get copyHashId => 'Copiar ID';

  @override
  String get copyCode => 'Copiar codi';

  @override
  String get copiedToClipboard => 'Copiat';

  @override
  String get showMyQrCode => 'Mostrar el meu codi QR';

  @override
  String get orDivider => 'o';

  @override
  String get openScanner => 'Obrir escàner';

  @override
  String get addManually => 'Afegir manualment';

  @override
  String get contactHashIdLabel => 'Hash ID del contacte';

  @override
  String get temporaryCodeLabel => 'Codi temporal';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Demana al teu contacte que generi un codi des del seu perfil';

  @override
  String get verifyAndAdd => 'Verificar i afegir';

  @override
  String get fillAllFields => 'Si us plau, omple tots els camps';

  @override
  String get invalidHashIdFormat =>
      'Format d\'ID no vàlid (p. ex.: 123-456-ABC)';

  @override
  String get userNotFound => 'Usuari no trobat';

  @override
  String get cannotAddYourself => 'No et pots afegir a tu mateix';

  @override
  String get invalidOrExpiredCode => 'Codi temporal no vàlid o caducat';

  @override
  String get contactFound => 'Contacte trobat!';

  @override
  String get howToCallContact => 'Com vols dir-li?';

  @override
  String get contactNameHint => 'Nom del contacte';

  @override
  String get addContactButton => 'Afegir';

  @override
  String get contactDetails => 'Detalls del contacte';

  @override
  String get contactName => 'Nom del contacte';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Afegit el $date';
  }

  @override
  String get deleteContact => 'Eliminar contacte';

  @override
  String deleteContactConfirm(Object name) {
    return 'Eliminar aquest contacte?';
  }

  @override
  String get deleteContactMessage => 'Això també eliminarà tot el xat.';

  @override
  String get delete => 'Eliminar';

  @override
  String get typeMessage => 'Escriu un missatge...';

  @override
  String get messageSent => 'Enviat';

  @override
  String get messageDelivered => 'Lliurat';

  @override
  String get messageRead => 'Llegit';

  @override
  String get messageFailed => 'Error en l\'enviament';

  @override
  String get now => 'Ara';

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
    return '${count}d';
  }

  @override
  String get today => 'Avui';

  @override
  String get yesterday => 'Ahir';

  @override
  String dateAtTime(String date, String time) {
    return '$date a les $time';
  }

  @override
  String get shareMessage =>
      'Uneix-te a mi a Hash! 🔒\n\nÉs un missatger realment privat: xifrat total, cap rastre als servidors, i mode pànic si cal.\n\nDescarrega l\'app aquí 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Error';

  @override
  String get ok => 'D\'acord';

  @override
  String get view => 'Veure';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get save => 'Desar';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Tancar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get loading => 'Carregant...';

  @override
  String get retry => 'Tornar-ho a provar';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Sol·licituds pendents';

  @override
  String get noPendingRequests => 'Cap sol·licitud pendent';

  @override
  String get pendingRequestsSubtitle => 'Aquestes persones volen afegir-te';

  @override
  String requestFromUser(String hashId) {
    return 'Sol·licitud de $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Caduca en $days dies';
  }

  @override
  String get acceptRequest => 'Acceptar';

  @override
  String get rejectRequest => 'Rebutjar';

  @override
  String get requestAccepted => 'Sol·licitud acceptada';

  @override
  String get requestRejected => 'Sol·licitud rebutjada';

  @override
  String get requestSent => 'Sol·licitud enviada!';

  @override
  String get requestSentSubtitle =>
      'La teva sol·licitud s\'ha enviat. L\'usuari l\'ha d\'acceptar per poder xatejar.';

  @override
  String get requestAlreadyPending => 'Ja hi ha una sol·licitud pendent';

  @override
  String get requestAlreadySentByOther =>
      'Aquesta persona ja t\'ha enviat una sol·licitud';

  @override
  String get addByHashId => 'Afegir per Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Introdueix el Hash ID i el codi temporal del contacte';

  @override
  String get enterTemporaryCode => 'Introdueix el codi de 6 dígits';

  @override
  String get sendRequest => 'Enviar sol·licitud';

  @override
  String get acceptContactTitle => 'Acceptar contacte';

  @override
  String get acceptContactSubtitle => 'Li pots donar un nom personalitzat';

  @override
  String get leaveEmptyForHashId => 'Deixa buit per usar el Hash ID';

  @override
  String get firstName => 'Nom';

  @override
  String get lastName => 'Cognom';

  @override
  String get notes => 'Notes';

  @override
  String get notesHint => 'Notes personals sobre aquest contacte';

  @override
  String get photoOptional => 'Foto (opcional)';

  @override
  String get contactNameOptional => 'Nom (opcional)';

  @override
  String get notesOptional => 'Notes (opcional)';

  @override
  String get storedLocally => 'Emmagatzemat només al teu dispositiu';

  @override
  String get encryptedMessageLabel => 'Missatge xifrat';

  @override
  String get identityMessageHint => 'Qui ets? Com us coneixeu?';

  @override
  String get messageWillBeSentEncrypted =>
      'Aquest missatge serà xifrat i enviat al destinatari';

  @override
  String get sendRequestButton => 'Enviar sol·licitud';

  @override
  String get requestExpiresIn24h =>
      'La sol·licitud caduca en 24h si no s\'accepta';

  @override
  String get theyAlreadySentYouRequest =>
      'Aquesta persona ja t\'ha enviat una sol·licitud';

  @override
  String get requests => 'Sol·licituds';

  @override
  String get receivedRequests => 'Rebudes';

  @override
  String get sentRequests => 'Enviades';

  @override
  String get noSentRequests => 'Cap sol·licitud enviada';

  @override
  String get cancelRequest => 'Cancel·lar';

  @override
  String get deleteRequest => 'Eliminar sol·licitud';

  @override
  String get requestCancelled => 'Sol·licitud cancel·lada';

  @override
  String sentTo(String hashId) {
    return 'Enviada a $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Caduca en $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Rebuda fa $time';
  }

  @override
  String get messageFromRequester => 'Missatge del sol·licitant';

  @override
  String get copy => 'Copiar';

  @override
  String get messageInfo => 'Info del missatge';

  @override
  String get messageDirection => 'Direcció';

  @override
  String get messageSentByYou => 'Enviat per tu';

  @override
  String get messageReceived => 'Rebut';

  @override
  String get messageSentAt => 'Enviat el';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Estat';

  @override
  String get messageReadAt => 'Llegit el';

  @override
  String get messageType => 'Tipus';

  @override
  String get messageSize => 'Mida';

  @override
  String get messageExpiresAt => 'Caduca el';

  @override
  String get messageEncrypted => 'Xifrat d\'extrem a extrem';

  @override
  String get messageStatusSending => 'Enviant...';

  @override
  String get messageStatusSent => 'Enviat';

  @override
  String get messageStatusDelivered => 'Lliurat';

  @override
  String get messageStatusRead => 'Llegit';

  @override
  String get messageStatusFailed => 'Fallat';

  @override
  String get serverStatus => 'Servidor';

  @override
  String get onServer => 'Pendent de lliurament';

  @override
  String get deletedFromServer => 'Eliminat';

  @override
  String get messageTypeText => 'Text';

  @override
  String get messageTypeImage => 'Imatge';

  @override
  String get messageTypeVideo => 'Vídeo';

  @override
  String get messageTypeVoice => 'Veu';

  @override
  String get messageTypeFile => 'Fitxer';

  @override
  String get indefinitely => 'Indefinidament';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'hores';

  @override
  String get minutes => 'minuts';

  @override
  String get seconds => 'segons';

  @override
  String get ephemeralMessages => 'Missatges efímers';

  @override
  String get ephemeralMessagesDescription =>
      'Els missatges s\'eliminen automàticament després d\'aquest temps';

  @override
  String get ephemeralImmediate => 'Immediat (després de llegir)';

  @override
  String get ephemeralImmediateDesc => 'Eliminat en llegir-lo';

  @override
  String get ephemeralMyPreference => 'La meva preferència';

  @override
  String get ephemeralMyPreferenceDesc => 'Usar la configuració global';

  @override
  String get ephemeralDefaultSetting => 'Durada dels missatges';

  @override
  String get ephemeralChooseDefault => 'Recomanat';

  @override
  String get ephemeral30Seconds => '30 segons';

  @override
  String get ephemeral30SecondsDesc => 'Eliminat 30s després de llegir';

  @override
  String get ephemeral5Minutes => '5 minuts';

  @override
  String get ephemeral5MinutesDesc => 'Eliminat 5min després de llegir';

  @override
  String get ephemeral1Hour => '1 hora';

  @override
  String get ephemeral1HourDesc => 'Eliminat 1h després de llegir';

  @override
  String get ephemeral3Hours => '3 hores';

  @override
  String get ephemeral6Hours => '6 hores';

  @override
  String get ephemeral6HoursDesc => 'Eliminat 6h després de llegir';

  @override
  String get ephemeral12Hours => '12 hores';

  @override
  String get ephemeral24Hours => '24 hores';

  @override
  String get ephemeral24HoursDesc => 'Eliminat 24h després de llegir';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Durada personalitzada';

  @override
  String get howItWorks => 'Com funciona';

  @override
  String get ephemeralExplanation1 =>
      'Els missatges s\'eliminen del servidor tan bon punt es reben.';

  @override
  String get ephemeralExplanation2 =>
      'Aquesta configuració defineix quan els missatges desapareixen del TEU telèfon després de llegir-los.';

  @override
  String get ephemeralExplanation3 =>
      'El teu contacte té la seva pròpia configuració per al seu telèfon.';

  @override
  String get mute1Hour => '1 hora';

  @override
  String get mute8Hours => '8 hores';

  @override
  String get mute1Day => '1 dia';

  @override
  String get mute1Week => '1 setmana';

  @override
  String get muteAlways => 'Sempre';

  @override
  String get muteExplanation => 'No rebràs notificacions d\'aquest contacte';

  @override
  String get showCallsInRecents => 'Mostrar a trucades recents';

  @override
  String get showCallsInRecentsSubtitle =>
      'Les trucades de Hash apareixen a l\'historial de trucades del telèfon';

  @override
  String get feedback => 'Comentaris';

  @override
  String get muteNotifications => 'Silenciar notificacions';

  @override
  String get muteDescription => 'No rebràs notificacions d\'aquest contacte';

  @override
  String mutedUntil(String time) {
    return 'Silenciat fins $time';
  }

  @override
  String get notMuted => 'Notificacions activades';

  @override
  String get unmute => 'Activar so';

  @override
  String get notificationSound => 'So de notificació';

  @override
  String get defaultSound => 'Per defecte';

  @override
  String get chatSettings => 'Configuració del xat';

  @override
  String get bubbleColor => 'Color de les bombolles';

  @override
  String get backgroundColor => 'Color de fons';

  @override
  String get backgroundImage => 'Imatge de fons';

  @override
  String get chatBackground => 'Fons del xat';

  @override
  String get customColor => 'Personalitzat';

  @override
  String get defaultColor => 'Per defecte';

  @override
  String get imageSelected => 'Imatge seleccionada';

  @override
  String get noImage => 'Cap imatge';

  @override
  String get color => 'Color';

  @override
  String get image => 'Imatge';

  @override
  String get tapToSelectImage => 'Toca per seleccionar una imatge';

  @override
  String get changeImage => 'Canviar imatge';

  @override
  String get previewMessageReceived => 'Hola!';

  @override
  String get previewMessageSent => 'Ei, com va!';

  @override
  String get messageAction => 'Missatge';

  @override
  String get callAction => 'Trucada';

  @override
  String get videoAction => 'Vídeo';

  @override
  String get personalNotes => 'Notes personals';

  @override
  String get addNotes => 'Afegir notes...';

  @override
  String get noNotes => 'Cap nota';

  @override
  String get messageNotifications => 'Notificacions de missatges';

  @override
  String get callNotifications => 'Notificacions de trucades';

  @override
  String get useGradient => 'Usar degradat';

  @override
  String get gradientStart => 'Color inicial';

  @override
  String get gradientEnd => 'Color final';

  @override
  String get preview => 'Previsualització';

  @override
  String get reset => 'Restablir';

  @override
  String get securityNumber => 'Número de seguretat';

  @override
  String securityNumberDescription(String name) {
    return 'Verifica que el número de seguretat coincideixi amb el dispositiu de $name';
  }

  @override
  String get verifyEncryption => 'Verificar xifrat d\'extrem a extrem';

  @override
  String get tapToCopy => 'Toca per copiar';

  @override
  String get howToVerify => 'Com verificar';

  @override
  String get verifyStep1 =>
      'Trobeu-vos amb el contacte en persona o truqueu-li';

  @override
  String get verifyStep2 =>
      'Compareu els números de seguretat o escanegeu els codis QR';

  @override
  String get verifyStep3 => 'Si coincideixen, el xat és segur';

  @override
  String get scanToVerify => 'Escanejar per verificar';

  @override
  String get reportSpam => 'Reportar spam';

  @override
  String get reportSpamSubtitle => 'Reporta aquest contacte com a spam';

  @override
  String get reportSpamDescription =>
      'Aquest contacte serà reportat de forma anònima. La teva identitat no serà compartida. N\'estàs segur?';

  @override
  String get report => 'Reportar';

  @override
  String get spamReported => 'Spam reportat';

  @override
  String get reportError =>
      'Error en enviar el report. Si us plau, torna-ho a provar.';

  @override
  String get reportRateLimited =>
      'Has assolit el nombre màxim de reports per avui.';

  @override
  String get blockContact => 'Bloquejar contacte';

  @override
  String get blockContactDescription =>
      'Aquest contacte ja no podrà enviar-te missatges ni trucar-te. No serà notificat.';

  @override
  String get unblockContact => 'Desbloquejar contacte';

  @override
  String get unblockContactDescription =>
      'Aquest contacte podrà tornar a enviar-te missatges i trucar-te.';

  @override
  String get contactBlocked => 'Contacte bloquejat';

  @override
  String get contactUnblocked => 'Contacte desbloquejat';

  @override
  String get contactIsBlocked => 'Aquest contacte està bloquejat';

  @override
  String get unblock => 'Desbloquejar';

  @override
  String get deleteContactSubtitle => 'Eliminar aquest contacte i el xat';

  @override
  String get confirmWithPin => 'Confirmar amb PIN';

  @override
  String get enterPinToConfirm =>
      'Introdueix el teu PIN per confirmar aquesta acció';

  @override
  String get profilePhoto => 'Foto de perfil';

  @override
  String get takePhoto => 'Fer una foto';

  @override
  String get chooseFromGallery => 'Triar de la galeria';

  @override
  String get removePhoto => 'Eliminar foto';

  @override
  String get viewContactHashId => 'Veure l\'identificador del contacte';

  @override
  String get hashIdPartiallyMasked =>
      'Parcialment ocultat per la teva seguretat i la privacitat del teu contacte';

  @override
  String get addFirstContact => 'Afegeix el teu primer contacte';

  @override
  String get addFirstContactSubtitle =>
      'Comparteix el teu codi QR o escaneja el d\'un amic';

  @override
  String get directory => 'Directori';

  @override
  String get noContacts => 'Cap contacte';

  @override
  String get noContactsSubtitle => 'Afegeix un contacte per començar';

  @override
  String get sendMessageAction => 'Enviar un missatge';

  @override
  String get audioCall => 'Trucada d\'àudio';

  @override
  String get videoCall => 'Videotrucada';

  @override
  String get viewProfile => 'Veure perfil';

  @override
  String get deleteContactDirectory => 'Eliminar contacte';

  @override
  String get scanShort => 'Escanejar';

  @override
  String get addShort => 'Afegir';

  @override
  String deleteContactConfirmName(String name) {
    return 'Estàs segur que vols eliminar $name?';
  }

  @override
  String get noNotesTitle => 'Cap nota';

  @override
  String get noNotesSubtitle => 'Crea la teva primera nota';

  @override
  String get newNote => 'Nova nota';

  @override
  String get editNote => 'Editar nota';

  @override
  String get deleteNote => 'Eliminar nota';

  @override
  String get deleteNoteConfirm => 'Estàs segur que vols eliminar aquesta nota?';

  @override
  String get noteTitle => 'Títol';

  @override
  String get noteContent => 'Contingut';

  @override
  String get addItem => 'Afegir element';

  @override
  String get pinNote => 'Fixar';

  @override
  String get unpinNote => 'Desafixar';

  @override
  String get noteColor => 'Color';

  @override
  String get notePassword => 'Contrasenya';

  @override
  String get setPassword => 'Establir contrasenya';

  @override
  String get changePassword => 'Canviar contrasenya';

  @override
  String get removePassword => 'Eliminar contrasenya';

  @override
  String get enterPassword => 'Introdueix la contrasenya';

  @override
  String get confirmPassword => 'Confirma la contrasenya';

  @override
  String get passwordPin => 'Codi PIN';

  @override
  String get passwordText => 'Contrasenya de text';

  @override
  String get protectedNote => 'Nota protegida';

  @override
  String get incorrectPassword => 'Contrasenya incorrecta';

  @override
  String get passwordSet => 'Contrasenya establerta';

  @override
  String get passwordRemoved => 'Contrasenya eliminada';

  @override
  String get notesBiometric => 'Face ID per a notes';

  @override
  String get notesBiometricSubtitle =>
      'Requerir autenticació biomètrica per obrir notes protegides';

  @override
  String get textNote => 'Nota de text';

  @override
  String get checklistNote => 'Llista de tasques';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tasques';
  }

  @override
  String get autoSaved => 'Desat';

  @override
  String get searchNotes => 'Cercar notes';

  @override
  String get legalConsent => 'Consentiment legal';

  @override
  String get confirmAge13 => 'Confirmo que tinc almenys 13 anys';

  @override
  String get acceptLegalStart => 'Accepto la ';

  @override
  String get privacyPolicy => 'Política de privacitat';

  @override
  String get termsOfService => 'Condicions d\'ús';

  @override
  String get andThe => ' i les ';

  @override
  String get continueButton => 'Continuar';

  @override
  String get mustAcceptTerms =>
      'Has d\'acceptar ambdues condicions per continuar';

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
  String get support => 'Suport';

  @override
  String get contactSupport => 'Contactar suport';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Reportar abús';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Legal';

  @override
  String get legalEntity => 'Entitat legal';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fixar';

  @override
  String get unpinConversation => 'Desafixar';

  @override
  String get hideConversation => 'Eliminar del feed';

  @override
  String get deleteConversation => 'Eliminar conversa';

  @override
  String get deleteConversationConfirm =>
      'Introdueix el PIN per confirmar l\'eliminació de tots els missatges';

  @override
  String get noConversations => 'Cap conversa encara';

  @override
  String get startConversation => 'Iniciar';

  @override
  String get microphonePermissionRequired => 'Accés al micròfon requerit';

  @override
  String get microphonePermissionExplanation =>
      'Hash necessita el micròfon per fer trucades.';

  @override
  String get cameraPermissionExplanation =>
      'Hash necessita la càmera per a videotrucades.';

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
  String get openSettings => 'Obrir configuració';

  @override
  String get callConnecting => 'Connectant...';

  @override
  String get callRinging => 'Sonant...';

  @override
  String get callReconnecting => 'Reconnectant...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Reconnectant (${seconds}s)';
  }

  @override
  String get callPaused => 'En pausa';

  @override
  String get callPausedSubtitle => 'La trucada encara és activa';

  @override
  String get callRemoteMicMuted => 'El micròfon del contacte està silenciat';

  @override
  String get callMiniControlsMute => 'Silenciar';

  @override
  String get callMiniControlsUnmute => 'Activar so';

  @override
  String get callMiniControlsHangUp => 'Penjar';

  @override
  String get callMiniControlsReturn => 'Tornar a la trucada';

  @override
  String get callNetworkPoor => 'Connexió inestable';

  @override
  String get callNetworkLost => 'Connexió perduda';

  @override
  String get callEndedTitle => 'Trucada finalitzada';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Dades del dispositiu';

  @override
  String get deviceDataSubtitle => 'Emmagatzematge local i del servidor';

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
  String get localStorage => 'Emmagatzematge local';

  @override
  String get onThisDevice => 'en aquest dispositiu';

  @override
  String get encryptedDatabases => 'Bases de dades xifrades';

  @override
  String get files => 'Fitxers';

  @override
  String get secureKeychain => 'Clauer segur';

  @override
  String get cache => 'Memòria cau';

  @override
  String get contactsDetail => 'Noms, avatars, claus Signal';

  @override
  String get messagesDetail => 'Converses xifrades';

  @override
  String get notesDetail => 'Notes personals';

  @override
  String get signalSessions => 'Sessions Signal';

  @override
  String get signalSessionsDetail => 'Sessions de xifrat';

  @override
  String get pendingContacts => 'Contactes pendents';

  @override
  String get pendingContactsDetail => 'Sol·licituds pendents';

  @override
  String get callHistory => 'Trucades';

  @override
  String get callHistoryDetail => 'Historial de trucades';

  @override
  String get preferences => 'Preferències';

  @override
  String get preferencesDetail => 'Preferències de mèdia i trucades';

  @override
  String get avatars => 'Avatars';

  @override
  String get media => 'Mèdia';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fitxers',
      one: '1 fitxer',
      zero: 'cap fitxer',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Actiu';

  @override
  String get notDefined => 'No definit';

  @override
  String get biometrics => 'Biomètrics';

  @override
  String get recoveryPhrase => 'Frase de recuperació';

  @override
  String get identity => 'Identitat (Hash ID)';

  @override
  String get signalKeys => 'Claus Signal Protocol';

  @override
  String get authTokens => 'Tokens d\'autenticació';

  @override
  String get contactNamesCache => 'Memòria cau de noms de contactes';

  @override
  String get remoteConfig => 'Configuració remota';

  @override
  String get notificationPrefs => 'Preferències de notificacions';

  @override
  String get serverData => 'Dades al servidor';

  @override
  String get serverDataInfo =>
      'Hash conserva dades mínimes al servidor, totes xifrades o temporals.';

  @override
  String get serverProfile => 'Perfil';

  @override
  String get serverProfileDetail => 'Hash ID, claus públiques, token de bústia';

  @override
  String get serverPrekeys => 'Pre-claus';

  @override
  String get serverPrekeysDetail => 'Claus Signal d\'un sol ús (consumides)';

  @override
  String get serverMessages => 'Missatges en trànsit';

  @override
  String get serverMessagesDetail =>
      'Eliminats després del lliurament (màx 24h)';

  @override
  String get serverMedia => 'Mèdia en trànsit';

  @override
  String get serverMediaDetail => 'Eliminats després de la descàrrega';

  @override
  String get serverContactRequests => 'Sol·licituds de contacte';

  @override
  String get serverContactRequestsDetail => 'Caduquen després de 24h';

  @override
  String get serverRateLimits => 'Límits de velocitat';

  @override
  String get serverRateLimitsDetail => 'Dades temporals anti-abús';

  @override
  String get privacyReassurance =>
      'Hash no pot llegir els teus missatges. Totes les dades estan xifrades d\'extrem a extrem. Les dades del servidor s\'eliminen automàticament.';

  @override
  String get pinTooSimple =>
      'Aquest PIN és massa simple. Tria un codi més segur.';

  @override
  String get genericError =>
      'S\'ha produït un error. Si us plau, torna-ho a provar.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'No s\'ha pogut crear el compte: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frase copiada al porta-retalls';

  @override
  String get copyPhrase => 'Copiar frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Apunta aquesta frase en un lloc segur. Si perds el PIN sense aquesta frase, perdràs permanentment l\'accés a les teves dades.';

  @override
  String get noMessages => 'Cap missatge';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Eliminar tots els missatges amb $name?';
  }

  @override
  String get confirmation => 'Confirmació';

  @override
  String get untitled => 'Sense títol';

  @override
  String get noSessions => 'Cap sessió';

  @override
  String get unknownContact => 'Contacte desconegut';

  @override
  String get unnamed => 'Sense nom';

  @override
  String get noPendingRequestsAlt => 'Cap sol·licitud pendent';

  @override
  String get deleteAllCallHistory => 'Eliminar tot l\'historial de trucades?';

  @override
  String get noCalls => 'Cap trucada';

  @override
  String get noPreferences => 'Cap preferència';

  @override
  String get resetAllMediaPrefs => 'Restablir totes les preferències de mèdia?';

  @override
  String get deleteThisAvatar => 'Eliminar aquest avatar?';

  @override
  String get deleteAllAvatars => 'Eliminar tots els avatars?';

  @override
  String get noAvatars => 'Cap avatar';

  @override
  String get deleteThisFile => 'Eliminar aquest fitxer?';

  @override
  String get deleteAllMediaFiles => 'Eliminar tots els mèdia?';

  @override
  String get noMediaFiles => 'Cap mèdia';

  @override
  String get outgoing => 'Sortint';

  @override
  String get incoming => 'Entrant';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Vista efímera: ${seconds}s';
  }

  @override
  String get normalView => 'Vista normal';

  @override
  String get callReasonCompleted => 'Completada';

  @override
  String get callReasonMissed => 'Perduda';

  @override
  String get callReasonDeclined => 'Rebutjada';

  @override
  String get callReasonFailed => 'Fallada';

  @override
  String get justNow => 'Ara mateix';

  @override
  String timeAgoMinutes(int count) {
    return 'Fa $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Fa ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Fa ${count}d';
  }

  @override
  String get messageTypeContact => 'Contacte';

  @override
  String get messageTypeLocation => 'Ubicació';

  @override
  String get statusQueued => 'En cua';

  @override
  String get blockedBadge => 'Bloquejat';

  @override
  String get protectedBadge => 'Protegida';

  @override
  String messageCount(int count) {
    return '$count missatge(s)';
  }

  @override
  String get deleteQuestion => 'Eliminar?';

  @override
  String get transferMyAccountTitle => 'Transferir el meu compte';

  @override
  String get loadingError => 'Error de càrrega';

  @override
  String get transferToNewDevice => 'Transferir a un nou dispositiu';

  @override
  String get transferInstructions =>
      'Al teu nou dispositiu, tria \"Recuperar el meu compte\" i introdueix aquesta informació:';

  @override
  String get yourHashIdLabel => 'El teu Hash ID';

  @override
  String get enterYourPinCode => 'Introdueix el teu codi PIN';

  @override
  String get pinOwnerConfirmation =>
      'Per confirmar que ets el propietari d\'aquest compte';

  @override
  String get scanThisQrCode => 'Escaneja aquest codi QR';

  @override
  String get withYourNewDevice => 'Amb el teu nou dispositiu';

  @override
  String get orEnterTheCode => 'o introdueix el codi';

  @override
  String get transferCodeLabel => 'Codi de transferència';

  @override
  String get proximityVerification => 'Verificació de proximitat';

  @override
  String get bringDevicesCloser => 'Apropa els dos dispositius';

  @override
  String get confirmTransferQuestion => 'Confirmar la transferència?';

  @override
  String get accountWillBeTransferred =>
      'El teu compte es transferirà al nou dispositiu.\n\nAquest dispositiu es desconnectarà permanentment.';

  @override
  String get transferComplete => 'Transferència completada';

  @override
  String get transferSuccessMessage =>
      'El teu compte s\'ha transferit correctament.\n\nAquesta aplicació es tancarà ara.';

  @override
  String get manualVerification => 'Verificació manual';

  @override
  String get codeDisplayedOnBothDevices => 'Codi mostrat als dos dispositius:';

  @override
  String get doesCodeMatchNewDevice =>
      'Coincideix aquest codi amb el del nou dispositiu?';

  @override
  String get verifiedStatus => 'Verificat';

  @override
  String get inProgressStatus => 'En curs...';

  @override
  String get notAvailableStatus => 'No disponible';

  @override
  String get codeExpiredRestart => 'El codi ha caducat. Si us plau, reinicia.';

  @override
  String get codesDoNotMatchCancelled =>
      'Els codis no coincideixen. Transferència cancel·lada.';

  @override
  String transferToDevice(String device) {
    return 'A: $device';
  }

  @override
  String get copiedExclamation => 'Copiat!';

  @override
  String expiresInTime(String time) {
    return 'Caduca en $time';
  }

  @override
  String get biometricNotAvailable =>
      'Els biomètrics no estan disponibles en aquest dispositiu';

  @override
  String get biometricAuthError => 'Error durant l\'autenticació biomètrica';

  @override
  String get authenticateForBiometric =>
      'Si us plau, autenticà\'t per activar els biomètrics';

  @override
  String get biometricAuthFailed => 'L\'autenticació biomètrica ha fallat';

  @override
  String get forceUpdateTitle => 'Actualització requerida';

  @override
  String get forceUpdateMessage =>
      'Hi ha una nova versió de Hash disponible. Si us plau, actualitza per continuar.';

  @override
  String get updateButton => 'Actualitzar';

  @override
  String get maintenanceInProgress => 'Manteniment en curs';

  @override
  String get tryAgainLater => 'Si us plau, torna-ho a provar més tard';

  @override
  String get information => 'Informació';

  @override
  String get later => 'Més tard';

  @override
  String get doYouLikeHash => 'T\'agrada Hash?';

  @override
  String get yourFeedbackHelps =>
      'La teva opinió ens ajuda a millorar l\'aplicació';

  @override
  String get ratingTerrible => 'Terrible';

  @override
  String get ratingBad => 'Dolent';

  @override
  String get ratingOk => 'Acceptable';

  @override
  String get ratingGood => 'Bo';

  @override
  String get ratingExcellent => 'Excel·lent!';

  @override
  String get donationMessage =>
      'Hash és un projecte sense ànim de lucre. El teu suport ens ajuda a continuar construint un missatger realment privat.';

  @override
  String get recentConnections => 'Connexions recents';

  @override
  String get loginInfoText =>
      'Cada desbloqueig amb PIN es registra localment. Només es conserven les últimes 24 hores.';

  @override
  String get connectionCount => 'Connexió(ns)';

  @override
  String get periodLabel => 'Període';

  @override
  String get historyLabel => 'Historial';

  @override
  String get noLoginRecorded => 'Cap inici de sessió registrat';

  @override
  String get nextUnlocksAppearHere =>
      'Els propers desbloqueigs apareixeran aquí.';

  @override
  String get dataLocalOnly =>
      'Aquestes dades s\'emmagatzemen només al teu dispositiu i mai es transmeten.';

  @override
  String get currentSession => 'Actual';

  @override
  String get todayLabel => 'Avui';

  @override
  String get yesterdayLabel => 'Ahir';

  @override
  String get justNowLabel => 'Ara mateix';

  @override
  String minutesAgoLabel(int count) {
    return 'Fa $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Fa ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Fa ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Cap manteniment planificat';

  @override
  String get everythingWorkingNormally => 'Tot funciona normalment';

  @override
  String get maintenanceTitle => 'Manteniment';

  @override
  String get maintenanceActiveLabel => 'EN CURS';

  @override
  String get maintenancePlannedLabel => 'PLANIFICAT';

  @override
  String get locking => 'Bloquejant...';

  @override
  String get newMessageNotification => 'Missatge nou';

  @override
  String get secExplainTitle => 'Com Hash et protegeix';

  @override
  String get secExplainIntro =>
      'Hash està dissenyat perquè ningú pugui llegir els teus missatges.';

  @override
  String get secExplainIntroSub =>
      'Ni tan sols nosaltres.\nAixí és com funciona, explicat de forma senzilla.';

  @override
  String get secJourneyLabel => 'EL VIATGE';

  @override
  String get secJourneyTitle => 'El viatge del teu missatge';

  @override
  String get secJourneySubtitle =>
      'Del teu dit a la pantalla del teu contacte, cada pas està protegit. Segueix el camí.';

  @override
  String get secStep1Title => 'Escrius el teu missatge';

  @override
  String get secStep1Desc =>
      'Escrius \"Hola!\" a l\'aplicació. En aquest moment, el missatge només existeix a la memòria del teu telèfon. Res no s\'ha enviat.';

  @override
  String get secStep2Title => 'Xifrat amb Signal Protocol';

  @override
  String get secStep2Desc =>
      'Quan prems \"Enviar\", el teu missatge es transforma en una cadena de caràcters incomprensibles. És com si el missatge estigués tancat en una caixa forta de la qual només el teu contacte té la clau.';

  @override
  String get secStep3Title => 'Sealed Sender: el sobre invisible';

  @override
  String get secStep3Desc =>
      'Imagina que envies una carta per correu, però sense adreça del remitent al sobre. Això és exactament el que fa Hash. El missatge es diposita en una bústia anònima. El servidor no sap qui l\'ha enviat.';

  @override
  String get secStep4Title => 'El servidor no veu res';

  @override
  String get secStep4Desc =>
      'El servidor fa de carter cec. Només sap que \"algú ha dipositat alguna cosa a la bústia #A7X9\". No sap qui l\'ha enviat, què és, ni per a qui és.';

  @override
  String get secStep4Highlight =>
      'Cap metadada emmagatzemada: ni adreça IP, ni marca de temps, ni enllaç entre remitent i destinatari.';

  @override
  String get secStep5Title => 'El teu contacte rep el missatge';

  @override
  String get secStep5Desc =>
      'El telèfon del teu contacte recupera el contingut de la seva bústia anònima i desxifra el missatge amb la seva clau privada, que mai ha sortit del seu dispositiu. \"Hola!\" apareix a la seva pantalla.';

  @override
  String get secStep6Title => 'El missatge desapareix del servidor';

  @override
  String get secStep6Desc =>
      'Quan el teu contacte confirma la recepció, el servidor elimina permanentment el missatge. Cap paperera, cap arxiu, cap còpia de seguretat. Fins i tot els missatges no llegits es destrueixen automàticament després de 24 hores.';

  @override
  String get secStep7Title => 'Caducitat local';

  @override
  String get secStep7Desc =>
      'Al telèfon del teu contacte, el missatge s\'autodestrueix segons la durada que has triat: immediatament després de llegir, 5 minuts, 1 hora... tu decideixes.';

  @override
  String get secJourneyConclusion =>
      'Resultat: zero rastres al servidor, zero rastres als dispositius. El missatge ha existit només el temps necessari per ser llegit, després ha desaparegut.';

  @override
  String get secArchLabel => 'ARQUITECTURA';

  @override
  String get secArchTitle => '5 capes de protecció';

  @override
  String get secArchSubtitle =>
      'Hash no depèn d\'una sola tecnologia. Cada capa reforça les altres. Fins i tot si una capa es compromet, les teves dades romanen segures.';

  @override
  String get secLayer1Title => 'Xifrat d\'extrem a extrem';

  @override
  String get secLayer1Desc =>
      'Cada missatge es xifra amb una clau única. En termes senzills: fins i tot si algú desxifra un missatge, no podrà desxifrar el següent. Cada missatge té el seu propi pany.';

  @override
  String get secLayer1Detail =>
      'Per als fitxers (fotos, vídeos, documents), Hash utilitza xifrat addicional AES-256-GCM. El fitxer es xifra abans de sortir del teu telèfon.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimat de xarxa)';

  @override
  String get secLayer2Desc =>
      'Els missatgers normals envien els teus missatges amb la teva identitat adjunta. És com escriure el teu nom al sobre. Hash utilitza bústies anònimes: el servidor lliura el missatge sense saber qui l\'ha enviat.';

  @override
  String get secLayer2Detail =>
      'Resultat: fins i tot en cas de filtració de dades del servidor, és impossible reconstruir qui parla amb qui.';

  @override
  String get secLayer3Title => 'Eliminació automàtica';

  @override
  String get secLayer3Desc =>
      'Els missatges s\'eliminen del servidor tan bon punt es confirma la recepció. Fins i tot si un missatge mai es recupera, es destrueix automàticament després de 24 hores.';

  @override
  String get secLayer3Detail =>
      'Al teu telèfon, els missatges s\'autodestrueixen segons la durada que tries: immediatament, 5 min, 15 min, 30 min, 1h, 3h, 6h o 12h.';

  @override
  String get secLayer4Title => 'Protecció d\'accés local';

  @override
  String get secLayer4Desc =>
      'L\'aplicació està protegida per un PIN de 6 dígits i/o biomètrics (Face ID, empremta digital). Després de massa intents fallits, l\'aplicació es bloqueja amb un retard creixent després de cada error.';

  @override
  String get secLayer5Title => 'Base de dades bloquejada';

  @override
  String get secLayer5Desc =>
      'Al costat del servidor, cap usuari pot escriure directament a la base de dades. Totes les accions passen per funcions segures que verifiquen cada sol·licitud.';

  @override
  String get secLayer5Detail =>
      'És com un taulell de banc: mai toques la caixa forta tu mateix. Fas una sol·licitud, i el sistema verifica que tens el dret abans d\'actuar.';

  @override
  String get secVashLabel => 'ÚNIC AL MÓN';

  @override
  String get secVashTitle => 'Mode Vash';

  @override
  String get secVashSubtitle =>
      'Un sistema de seguretat d\'emergència que no existeix en cap altra aplicació de missatgeria.';

  @override
  String get secVashScenarioTitle => 'Imagina aquesta situació';

  @override
  String get secVashScenario1 => 'Algú accedeix al teu telèfon';

  @override
  String get secVashScenario2 => 'Et demanen el codi PIN';

  @override
  String get secVashScenario3 => 'Vols esborrar totes les dades urgentment';

  @override
  String get secVashSolutionTitle => 'La solució: dos codis PIN';

  @override
  String get secVashSolutionDesc =>
      'Configures dos codis PIN diferents a Hash:';

  @override
  String get secVashNormalCodeLabel => 'Codi normal';

  @override
  String get secVashNormalCodeDesc =>
      'Obre l\'aplicació normalment amb totes les teves dades';

  @override
  String get secVashCodeLabel2 => 'Codi Vash';

  @override
  String get secVashCodeDescription =>
      'Obre l\'aplicació normalment... però totes les teves dades s\'eliminen silenciosament en segon pla';

  @override
  String get secVashWhatHappensTitle => 'Què passa després';

  @override
  String get secVashWhatHappensDesc =>
      'L\'aplicació s\'obre normalment. Cap alerta, cap animació sospitosa. La pantalla simplement mostra una aplicació buida, com si l\'acabessis d\'instal·lar.\n\nEn realitat, totes les teves converses, contactes i missatges s\'han eliminat irreversiblement en una fracció de segon.';

  @override
  String get secCallsLabel => 'TRUCADES I FITXERS';

  @override
  String get secCallsTitle => 'Tot està xifrat';

  @override
  String get secCallsSubtitle =>
      'No són només els missatges. Absolutament tot el que passa per Hash està xifrat d\'extrem a extrem.';

  @override
  String get secAudioCallTitle => 'Trucades d\'àudio';

  @override
  String get secAudioCallDesc =>
      'Xifrades d\'extrem a extrem via WebRTC. La veu es transmet directament entre dispositius.';

  @override
  String get secVideoCallTitle => 'Videotrucades';

  @override
  String get secVideoCallDesc =>
      'Mateixa tecnologia, cada flux xifrat individualment.';

  @override
  String get secPhotosTitle => 'Fotos i vídeos';

  @override
  String get secPhotosDesc =>
      'Xifrats en AES-256-GCM abans de sortir del teu telèfon.';

  @override
  String get secDocsTitle => 'Documents';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, qualsevol fitxer. Nom, mida i contingut xifrats.';

  @override
  String get secAnonLabel => 'ANONIMAT';

  @override
  String get secAnonTitle => 'Cap identitat requerida';

  @override
  String get secAnonSubtitle =>
      'Hash mai demana el teu número de telèfon ni el teu correu electrònic. Ets identificat per un Hash ID únic i anònim.';

  @override
  String get secHashIdTitle => 'El teu Hash ID';

  @override
  String get secHashIdDesc =>
      'Aquest és el teu identificador únic. No revela res sobre tu: ni el nom, ni el número, ni la ubicació. És com un pseudònim impossible de vincular a la teva identitat real.\n\nPer afegir un contacte, comparteixes el teu Hash ID o escaneges un codi QR. Això és tot. Sense llibreta d\'adreces sincronitzada, sense suggeriments \"Persones que potser coneixes\".';

  @override
  String get secDataLabel => 'DADES';

  @override
  String get secDataTitle => 'Què no sap Hash';

  @override
  String get secDataSubtitle =>
      'La millor manera de protegir les teves dades és no recollir-les.';

  @override
  String get secNeverCollected => 'Mai recollit';

  @override
  String get secNeverItem1 => 'Contingut dels missatges';

  @override
  String get secNeverItem2 => 'Llista de contactes';

  @override
  String get secNeverItem3 => 'Número de telèfon';

  @override
  String get secNeverItem4 => 'Adreça de correu electrònic';

  @override
  String get secNeverItem5 => 'Adreça IP';

  @override
  String get secNeverItem6 => 'Ubicació';

  @override
  String get secNeverItem7 => 'Metadades (qui parla amb qui)';

  @override
  String get secNeverItem8 => 'Historial de trucades';

  @override
  String get secNeverItem9 => 'Llibreta d\'adreces';

  @override
  String get secNeverItem10 => 'Identificadors publicitaris';

  @override
  String get secTempStored => 'Emmagatzemat temporalment';

  @override
  String get secTempItem1 => 'Hash ID anònim (identificador únic)';

  @override
  String get secTempItem2 => 'Claus públiques de xifrat';

  @override
  String get secTempItem3 => 'Missatges xifrats en trànsit (màx 24h)';

  @override
  String get secTempNote =>
      'Fins i tot aquestes dades mínimes no et poden identificar. El teu Hash ID no està vinculat a cap informació personal.';

  @override
  String get secFooterTitle => 'La teva privacitat, la teva llibertat';

  @override
  String get secFooterDesc =>
      'Hash utilitza les mateixes tecnologies de xifrat que les aplicacions professionals més exigents. Els teus missatges estan protegits per les matemàtiques, no per promeses.';

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
