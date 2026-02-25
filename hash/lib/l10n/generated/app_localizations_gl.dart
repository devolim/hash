// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero Trace. Zero Compromise.';

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
  String get contacts => 'Contactos';

  @override
  String get noConversation => 'Sen chats';

  @override
  String get noConversationSubtitle =>
      'Engade un contacto para comezar a conversar con seguridade';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitudes recibidas',
      one: '1 solicitude recibida',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitudes enviadas pendentes',
      one: '1 solicitude enviada pendente',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Engadir contacto';

  @override
  String get shareApp => 'Compartir a aplicacion';

  @override
  String get newMessage => 'Nova mensaxe';

  @override
  String get newConversation => 'Enviar unha mensaxe';

  @override
  String get settings => 'Axustes';

  @override
  String get myHashId => 'O meu Hash ID';

  @override
  String get supportHash => 'Apoiar Hash';

  @override
  String get supportHashSubtitle => 'Hash e un proxecto sen animo de lucro';

  @override
  String get donate => 'Doar';

  @override
  String get appearance => 'Aparencia';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatico';

  @override
  String get themeAutoSubtitle => 'Segue os axustes do sistema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeRecommendation =>
      'O tema escuro e recomendado para maior privacidade';

  @override
  String get language => 'Lingua';

  @override
  String get languageAuto => 'Automatico (sistema)';

  @override
  String get notifications => 'Notificacions';

  @override
  String get messages => 'Mensaxes';

  @override
  String get calls => 'Chamadas';

  @override
  String get vibration => 'Vibracion';

  @override
  String get notificationContent => 'Contido das notificacions';

  @override
  String get notificationContentFull => 'Mostrar todo';

  @override
  String get notificationContentFullDesc =>
      'Nome do contacto e vista previa da mensaxe';

  @override
  String get notificationContentName => 'So o nome';

  @override
  String get notificationContentNameDesc => 'Mostra so o nome do contacto';

  @override
  String get notificationContentDiscrete => 'Discreto';

  @override
  String get notificationContentDiscreteDesc => 'Mostra so \"Nova mensaxe\"';

  @override
  String get security => 'Seguridade';

  @override
  String get howHashProtectsYou => 'Como Hash te protexe';

  @override
  String get howHashProtectsYouSubtitle => 'Comprende a tua seguridade';

  @override
  String get accountSecurity => 'Seguridade da conta';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, Modo Vash';

  @override
  String get blockScreenshots => 'Bloquear capturas de pantalla';

  @override
  String get transferDevice => 'Transferir a outro dispositivo';

  @override
  String get transferDeviceSubtitle => 'Migrar a tua conta';

  @override
  String get pinCode => 'Codigo PIN';

  @override
  String get changePin => 'Cambiar codigo PIN';

  @override
  String get currentPin => 'Codigo PIN actual';

  @override
  String get newPin => 'Novo codigo PIN';

  @override
  String get confirmPin => 'Confirmar codigo PIN';

  @override
  String get pinChanged => 'Codigo PIN cambiado';

  @override
  String get incorrectPin => 'PIN incorrecto';

  @override
  String get pinsDoNotMatch => 'Os codigos non coinciden';

  @override
  String get autoLock => 'Bloqueo automatico';

  @override
  String get autoLockDelay => 'Atraso de bloqueo';

  @override
  String get autoLockImmediate => 'Inmediato';

  @override
  String get autoLockMinute => '1 minuto';

  @override
  String autoLockMinutes(int count) {
    return '$count minutos';
  }

  @override
  String get vashCode => 'Codigo Vash';

  @override
  String get vashModeTitle => 'Modo Vash';

  @override
  String get vashModeExplanation => 'A tua rede de seguridade definitiva.';

  @override
  String get vashModeDescription =>
      'Vas elixir un segundo codigo PIN. Se algunha vez te obrigan a abrir Hash, introduce este codigo no canto do teu PIN habitual.\n\nA aplicacion abrirase normalmente, pero todas as tuas conversas e contactos desapareceran.\n\nPara calquera que mire a tua pantalla, Hash simplemente parece baleiro — como se nunca o usaras.';

  @override
  String get vashModeIrreversible => 'Esta accion e silenciosa e irreversible.';

  @override
  String get chooseVashCode => 'Elixir o meu codigo Vash';

  @override
  String get vashCodeInfo =>
      'Un segundo codigo PIN que abre a aplicacion normalmente, pero baleira.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Se introduces este codigo no canto do teu PIN:';

  @override
  String get vashDeleteContacts => 'Os teus contactos desaparecen';

  @override
  String get vashDeleteMessages => 'As tuas conversas desaparecen';

  @override
  String get vashDeleteHistory => 'As tuas notas desaparecen';

  @override
  String get vashKeepId => 'A tua identidade Hash (#XXX-XXX-XXX) segue igual';

  @override
  String get vashAppearNormal =>
      'A aplicacion parece normal pero baleira, como nova. Esta accion e irreversible.';

  @override
  String get setupVashCode => 'Configurar codigo Vash';

  @override
  String get modifyVashCode => 'Modificar codigo Vash';

  @override
  String get currentVashCode => 'Codigo Vash actual';

  @override
  String get newVashCode => 'Novo codigo Vash';

  @override
  String get confirmVashCode => 'Confirmar codigo Vash';

  @override
  String get vashCodeConfigured => 'Codigo Vash configurado';

  @override
  String get vashCodeModified => 'Codigo Vash modificado';

  @override
  String get vashCodeMustDiffer => 'O codigo Vash debe ser diferente do PIN';

  @override
  String get incorrectVashCode => 'Codigo Vash incorrecto';

  @override
  String get vashWhatToDelete => 'Que debe facer desaparecer o Modo Vash?';

  @override
  String get vashDeleteContactsOption => 'Contactos';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mensaxes';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notas';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Modo Vash activado';

  @override
  String get vashCreateSubtitle =>
      'Elixe un codigo diferente do teu PIN principal';

  @override
  String get vashConfirmSubtitle => 'Confirma o teu codigo Vash';

  @override
  String get pinCodeForEntry => 'Codigo PIN para entrar na aplicacion';

  @override
  String get vashCodeSection => 'Modo Vash';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Desbloquear con pegada dixital ou Face ID';

  @override
  String get enableBiometric => 'Activar biometria';

  @override
  String get biometricWarningMessage =>
      'Ao activar a biometria, non poderds usar o teu codigo Vash para entrar na aplicacion.\n\nSo poderas usar o codigo Vash se a biometria falla (despois de varios intentos fallidos).\n\nEstas seguro de continuar?';

  @override
  String get understood => 'Entendido';

  @override
  String get shareAppSubtitle => 'Comparte Hash coas persoas que queres';

  @override
  String get share => 'Compartir';

  @override
  String get danger => 'Perigo';

  @override
  String get deleteAccount => 'Eliminar a mina conta';

  @override
  String get deleteAccountSubtitle => 'Accion irreversible';

  @override
  String get deleteAccountConfirmTitle => 'Eliminar a mina conta';

  @override
  String get deleteAccountConfirmMessage =>
      'A tua conta sera eliminada permanentemente. Esta accion e irreversible.\n\n• Todos os teus chats\n• Todos os teus contactos\n• O teu Hash ID\n\nTeras que crear unha conta nova.';

  @override
  String get deleteForever => 'Eliminar permanentemente';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Modo Vash activado.';

  @override
  String deletionError(String error) {
    return 'Erro ao eliminar: $error';
  }

  @override
  String get yourSecurity => 'A tua seguridade';

  @override
  String get securityInfo =>
      '• Cifrado de extremo a extremo (Signal Protocol)\n• Sen datos nos nosos servidores despois da entrega\n• Chaves almacenadas so no teu dispositivo\n• O codigo PIN nunca se envia ao servidor';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Benvido';

  @override
  String get securityStatement1 => 'As tuas mensaxes estan protexidas.';

  @override
  String get securityStatement2 => 'Cifrado de extremo a extremo.';

  @override
  String get securityStatement3 => 'Sen rastro. Sen compromisos.';

  @override
  String get securityStatement4 => 'A tua privacidade e un dereito.';

  @override
  String get accessBlocked => 'Acceso bloqueado';

  @override
  String get tooManyAttempts => 'Demasiados intentos';

  @override
  String get pleaseWait => 'Agarda';

  @override
  String get waitDelay => 'Agarda a que remate o atraso';

  @override
  String attemptCount(int current, int max) {
    return 'Intento $current de $max';
  }

  @override
  String retryIn(String time) {
    return 'Reintentar en $time';
  }

  @override
  String get forgotPin => 'Esqueceu o PIN? Usa a frase de recuperacion';

  @override
  String get useRecoveryPhrase => 'Usar frase de recuperacion';

  @override
  String get recoveryWarningTitle => 'Atencion';

  @override
  String get recoveryWarningMessage => 'A recuperacion da conta vai:';

  @override
  String get recoveryDeleteAllMessages => 'Eliminar TODAS as tuas mensaxes';

  @override
  String get recoveryWaitDelay => 'Requirir un atraso de 1 hora';

  @override
  String get recoveryKeepContacts => 'Conservar os teus contactos';

  @override
  String get recoveryIrreversible =>
      'Esta accion e irreversible. As tuas mensaxes perderanse permanentemente.';

  @override
  String get iUnderstand => 'Comprendo';

  @override
  String get accountRecovery => 'Recuperacion da conta';

  @override
  String get enterRecoveryPhrase =>
      'Introduce as 24 palabras da tua frase de recuperacion, separadas por espazos.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Recuperar';

  @override
  String get recoveryPhraseRequired => 'Introduce a tua frase de recuperacion';

  @override
  String get recoveryPhrase24Words =>
      'A frase debe conter exactamente 24 palabras';

  @override
  String get incorrectRecoveryPhrase => 'Frase de recuperacion incorrecta';

  @override
  String get recoveryInitError => 'Erro ao inicializar a recuperacion';

  @override
  String get securityDelay => 'Atraso de seguridade';

  @override
  String get securityDelayMessage =>
      'Para a tua seguridade, requirese un tempo de espera antes de crear un novo PIN.';

  @override
  String get timeRemaining => 'Tempo restante';

  @override
  String get messagesDeletedForProtection =>
      'As tuas mensaxes foron eliminadas para a tua proteccion.';

  @override
  String get canCloseApp => 'Podes pechar a aplicacion e volver mais tarde.';

  @override
  String get onboardingTitle1 => 'Benvido a Hash';

  @override
  String get onboardingSubtitle1 => 'A mensaxeria que non deixa rastro';

  @override
  String get onboardingTitle2 => 'Cifrado total';

  @override
  String get onboardingSubtitle2 =>
      'As tuas mensaxes estan cifradas de extremo a extremo co protocolo Signal';

  @override
  String get onboardingTitle3 => 'Sen rastro';

  @override
  String get onboardingSubtitle3 =>
      'As mensaxes eliminanse dos servidores ao ser entregadas';

  @override
  String get onboardingTitle4 => 'A tua seguridade';

  @override
  String get onboardingSubtitle4 =>
      'Codigo PIN, Modo Vash e frase de recuperacion';

  @override
  String get getStarted => 'Comezar';

  @override
  String get next => 'Seguinte';

  @override
  String get skip => 'Saltar';

  @override
  String get alreadyHaveAccount => 'Xa teno unha conta';

  @override
  String get transferMyAccount => 'Transferir a mina conta';

  @override
  String get createPin => 'Crear un codigo PIN';

  @override
  String get createPinSubtitle =>
      'Este codigo protexera o acceso a tua aplicacion';

  @override
  String get confirmYourPin => 'Confirma o teu codigo PIN';

  @override
  String get confirmPinSubtitle => 'Introduce o teu codigo PIN de novo';

  @override
  String get saveRecoveryPhrase => 'Frase de recuperacion';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Anota estas 24 palabras en orde. Permitiranche recuperar a tua conta se esqueces o PIN.';

  @override
  String get phraseWritten => 'Xa anotei a mina frase';

  @override
  String get warningRecoveryPhrase =>
      'Se perdes esta frase e esqueces o PIN, perderas o acceso a tua conta.';

  @override
  String get accountTransferred => 'Conta transferida';

  @override
  String get accountTransferredMessage =>
      'A tua conta foi transferida a outro dispositivo. Esta sesion xa non e valida.';

  @override
  String get accountTransferredInfo =>
      'Se non iniciaches esta transferencia, a tua conta puido ser comprometida.';

  @override
  String get logout => 'Pechar sesion';

  @override
  String get transferAccount => 'Transferir conta';

  @override
  String get transferAccountInfo =>
      'Transfire a tua conta Hash a un novo dispositivo. A tua sesion actual sera invalidada.';

  @override
  String get generateTransferCode => 'Xerar codigo de transferencia';

  @override
  String get transferCode => 'Codigo de transferencia';

  @override
  String transferCodeExpires(int minutes) {
    return 'Este codigo caduca en $minutes minutos';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Introduce este codigo no teu novo dispositivo para transferir a tua conta.';

  @override
  String get generateNewCode => 'Xerar novo codigo';

  @override
  String get scanQrCode => 'Escanear codigo QR';

  @override
  String get scanQrCodeSubtitle =>
      'Escanea o codigo QR dun contacto para engadilo';

  @override
  String get qrCodeDetected => 'Codigo QR detectado';

  @override
  String get invalidQrCode => 'Codigo QR non valido';

  @override
  String get cameraPermissionRequired => 'Requirese permiso da camara';

  @override
  String get myQrCode => 'O meu codigo QR';

  @override
  String get myQrCodeSubtitle =>
      'Comparte este codigo QR para que os teus contactos te poidan engadir';

  @override
  String get shareQrCode => 'Compartir';

  @override
  String get addContactTitle => 'Engadir contacto';

  @override
  String get addContactByHashId => 'Introduce o Hash ID do teu contacto';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Buscar';

  @override
  String get contactNotFound => 'Contacto non atopado';

  @override
  String get contactAlreadyAdded => 'Este contacto xa esta na tua lista';

  @override
  String get contactAdded => 'Contacto engadido';

  @override
  String get myProfile => 'O meu perfil';

  @override
  String get myProfileSubtitle =>
      'Comparte esta informacion para que te poidan engadir';

  @override
  String get temporaryCode => 'Codigo temporal';

  @override
  String temporaryCodeExpires(String time) {
    return 'Caduca en $time';
  }

  @override
  String get codeExpired => 'Codigo caducado';

  @override
  String get generateNewCodeButton => 'Novo codigo';

  @override
  String get copyHashId => 'Copiar ID';

  @override
  String get copyCode => 'Copiar codigo';

  @override
  String get copiedToClipboard => 'Copiado';

  @override
  String get showMyQrCode => 'Mostrar o meu codigo QR';

  @override
  String get orDivider => 'ou';

  @override
  String get openScanner => 'Abrir escaner';

  @override
  String get addManually => 'Engadir manualmente';

  @override
  String get contactHashIdLabel => 'Hash ID do contacto';

  @override
  String get temporaryCodeLabel => 'Codigo temporal';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Pide ao teu contacto que xere un codigo dende o seu perfil';

  @override
  String get verifyAndAdd => 'Verificar e engadir';

  @override
  String get fillAllFields => 'Enche todos os campos';

  @override
  String get invalidHashIdFormat =>
      'Formato de ID non valido (ex.: 123-456-ABC)';

  @override
  String get userNotFound => 'Usuario non atopado';

  @override
  String get cannotAddYourself => 'Non podes engadirte a ti mesmo';

  @override
  String get invalidOrExpiredCode => 'Codigo temporal non valido ou caducado';

  @override
  String get contactFound => 'Contacto atopado!';

  @override
  String get howToCallContact => 'Como lle queres chamar?';

  @override
  String get contactNameHint => 'Nome do contacto';

  @override
  String get addContactButton => 'Engadir';

  @override
  String get contactDetails => 'Detalles do contacto';

  @override
  String get contactName => 'Nome do contacto';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Engadido o $date';
  }

  @override
  String get deleteContact => 'Eliminar contacto';

  @override
  String deleteContactConfirm(Object name) {
    return 'Eliminar este contacto?';
  }

  @override
  String get deleteContactMessage => 'Isto eliminara tamben todo o chat.';

  @override
  String get delete => 'Eliminar';

  @override
  String get typeMessage => 'Escribe unha mensaxe...';

  @override
  String get messageSent => 'Enviado';

  @override
  String get messageDelivered => 'Entregado';

  @override
  String get messageRead => 'Lido';

  @override
  String get messageFailed => 'Erro ao enviar';

  @override
  String get now => 'Agora';

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
  String get today => 'Hoxe';

  @override
  String get yesterday => 'Onte';

  @override
  String dateAtTime(String date, String time) {
    return '$date as $time';
  }

  @override
  String get shareMessage =>
      'Unete a min en Hash! 🔒\n\nE unha mensaxeria realmente privada: cifrado total, sen rastro nos servidores e modo panico se o necesitas.\n\nDescarga a aplicacion aqui 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Erro';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Ver';

  @override
  String get yes => 'Si';

  @override
  String get no => 'Non';

  @override
  String get save => 'Gardar';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Pechar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get loading => 'Cargando...';

  @override
  String get retry => 'Reintentar';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Solicitudes pendentes';

  @override
  String get noPendingRequests => 'Sen solicitudes pendentes';

  @override
  String get pendingRequestsSubtitle => 'Estas persoas queren engadirte';

  @override
  String requestFromUser(String hashId) {
    return 'Solicitude de $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Caduca en $days dias';
  }

  @override
  String get acceptRequest => 'Aceptar';

  @override
  String get rejectRequest => 'Rexeitar';

  @override
  String get requestAccepted => 'Solicitude aceptada';

  @override
  String get requestRejected => 'Solicitude rexeitada';

  @override
  String get requestSent => 'Solicitude enviada!';

  @override
  String get requestSentSubtitle =>
      'A tua solicitude foi enviada. O usuario debe aceptala para poder conversar.';

  @override
  String get requestAlreadyPending => 'Xa hai unha solicitude pendente';

  @override
  String get requestAlreadySentByOther =>
      'Esta persoa xa che enviou unha solicitude';

  @override
  String get addByHashId => 'Engadir por Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Introduce o Hash ID e o codigo temporal do contacto';

  @override
  String get enterTemporaryCode => 'Introduce o codigo de 6 dixitos';

  @override
  String get sendRequest => 'Enviar solicitude';

  @override
  String get acceptContactTitle => 'Aceptar contacto';

  @override
  String get acceptContactSubtitle => 'Podes darlle un nome personalizado';

  @override
  String get leaveEmptyForHashId => 'Deixa baleiro para usar o Hash ID';

  @override
  String get firstName => 'Nome';

  @override
  String get lastName => 'Apelido';

  @override
  String get notes => 'Notas';

  @override
  String get notesHint => 'Notas persoais sobre este contacto';

  @override
  String get photoOptional => 'Foto (opcional)';

  @override
  String get contactNameOptional => 'Nome (opcional)';

  @override
  String get notesOptional => 'Notas (opcional)';

  @override
  String get storedLocally => 'Almacenado so no teu dispositivo';

  @override
  String get encryptedMessageLabel => 'Mensaxe cifrada';

  @override
  String get identityMessageHint => 'Quen es? Como vos conocedes?';

  @override
  String get messageWillBeSentEncrypted =>
      'Esta mensaxe sera cifrada e enviada ao destinatario';

  @override
  String get sendRequestButton => 'Enviar solicitude';

  @override
  String get requestExpiresIn24h =>
      'A solicitude caduca en 24 h se non e aceptada';

  @override
  String get theyAlreadySentYouRequest =>
      'Esta persoa xa che enviou unha solicitude';

  @override
  String get requests => 'Solicitudes';

  @override
  String get receivedRequests => 'Recibidas';

  @override
  String get sentRequests => 'Enviadas';

  @override
  String get noSentRequests => 'Sen solicitudes enviadas';

  @override
  String get cancelRequest => 'Cancelar';

  @override
  String get deleteRequest => 'Eliminar solicitude';

  @override
  String get requestCancelled => 'Solicitude cancelada';

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
    return 'Recibida hai $time';
  }

  @override
  String get messageFromRequester => 'Mensaxe do solicitante';

  @override
  String get copy => 'Copiar';

  @override
  String get messageInfo => 'Info da mensaxe';

  @override
  String get messageDirection => 'Direccion';

  @override
  String get messageSentByYou => 'Enviada por ti';

  @override
  String get messageReceived => 'Recibida';

  @override
  String get messageSentAt => 'Enviada o';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Estado';

  @override
  String get messageReadAt => 'Lida o';

  @override
  String get messageType => 'Tipo';

  @override
  String get messageSize => 'Tamano';

  @override
  String get messageExpiresAt => 'Caduca o';

  @override
  String get messageEncrypted => 'Cifrada de extremo a extremo';

  @override
  String get messageStatusSending => 'Enviando...';

  @override
  String get messageStatusSent => 'Enviada';

  @override
  String get messageStatusDelivered => 'Entregada';

  @override
  String get messageStatusRead => 'Lida';

  @override
  String get messageStatusFailed => 'Erro';

  @override
  String get serverStatus => 'Servidor';

  @override
  String get onServer => 'Pendente de entrega';

  @override
  String get deletedFromServer => 'Eliminada';

  @override
  String get messageTypeText => 'Texto';

  @override
  String get messageTypeImage => 'Imaxe';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Voz';

  @override
  String get messageTypeFile => 'Ficheiro';

  @override
  String get indefinitely => 'Indefinidamente';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'horas';

  @override
  String get minutes => 'minutos';

  @override
  String get seconds => 'segundos';

  @override
  String get ephemeralMessages => 'Mensaxes efemeras';

  @override
  String get ephemeralMessagesDescription =>
      'As mensaxes eliminanse automaticamente despois deste tempo';

  @override
  String get ephemeralImmediate => 'Inmediato (despois de ler)';

  @override
  String get ephemeralImmediateDesc => 'Eliminada en canto se le';

  @override
  String get ephemeralMyPreference => 'A mina preferencia';

  @override
  String get ephemeralMyPreferenceDesc => 'Usar axuste global';

  @override
  String get ephemeralDefaultSetting => 'Duracion das mensaxes';

  @override
  String get ephemeralChooseDefault => 'Recomendado';

  @override
  String get ephemeral30Seconds => '30 segundos';

  @override
  String get ephemeral30SecondsDesc => 'Eliminada 30 s despois de ler';

  @override
  String get ephemeral5Minutes => '5 minutos';

  @override
  String get ephemeral5MinutesDesc => 'Eliminada 5 min despois de ler';

  @override
  String get ephemeral1Hour => '1 hora';

  @override
  String get ephemeral1HourDesc => 'Eliminada 1 h despois de ler';

  @override
  String get ephemeral3Hours => '3 horas';

  @override
  String get ephemeral6Hours => '6 horas';

  @override
  String get ephemeral6HoursDesc => 'Eliminada 6 h despois de ler';

  @override
  String get ephemeral12Hours => '12 horas';

  @override
  String get ephemeral24Hours => '24 horas';

  @override
  String get ephemeral24HoursDesc => 'Eliminada 24 h despois de ler';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Duracion personalizada';

  @override
  String get howItWorks => 'Como funciona';

  @override
  String get ephemeralExplanation1 =>
      'As mensaxes eliminanse do servidor en canto se reciben.';

  @override
  String get ephemeralExplanation2 =>
      'Este axuste define cando as mensaxes desaparecen do TEU telefono despois de lelas.';

  @override
  String get ephemeralExplanation3 =>
      'O teu contacto ten o seu propio axuste para o seu telefono.';

  @override
  String get mute1Hour => '1 hora';

  @override
  String get mute8Hours => '8 horas';

  @override
  String get mute1Day => '1 dia';

  @override
  String get mute1Week => '1 semana';

  @override
  String get muteAlways => 'Sempre';

  @override
  String get muteExplanation => 'Non recibirds notificacions deste contacto';

  @override
  String get showCallsInRecents => 'Mostrar nas chamadas recentes';

  @override
  String get showCallsInRecentsSubtitle =>
      'As chamadas de Hash aparecen no historial do telefono';

  @override
  String get feedback => 'Comentarios';

  @override
  String get muteNotifications => 'Silenciar notificacions';

  @override
  String get muteDescription => 'Non recibirds notificacions deste contacto';

  @override
  String mutedUntil(String time) {
    return 'Silenciado ata $time';
  }

  @override
  String get notMuted => 'Notificacions activadas';

  @override
  String get unmute => 'Activar son';

  @override
  String get notificationSound => 'Son de notificacion';

  @override
  String get defaultSound => 'Predeterminado';

  @override
  String get chatSettings => 'Axustes do chat';

  @override
  String get bubbleColor => 'Cor das burbullas';

  @override
  String get backgroundColor => 'Cor de fondo';

  @override
  String get backgroundImage => 'Imaxe de fondo';

  @override
  String get chatBackground => 'Fondo do chat';

  @override
  String get customColor => 'Personalizada';

  @override
  String get defaultColor => 'Predeterminada';

  @override
  String get imageSelected => 'Imaxe seleccionada';

  @override
  String get noImage => 'Sen imaxe';

  @override
  String get color => 'Cor';

  @override
  String get image => 'Imaxe';

  @override
  String get tapToSelectImage => 'Toca para seleccionar unha imaxe';

  @override
  String get changeImage => 'Cambiar imaxe';

  @override
  String get previewMessageReceived => 'Ola!';

  @override
  String get previewMessageSent => 'Que tal!';

  @override
  String get messageAction => 'Mensaxe';

  @override
  String get callAction => 'Chamar';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Notas persoais';

  @override
  String get addNotes => 'Engadir notas...';

  @override
  String get noNotes => 'Sen notas';

  @override
  String get messageNotifications => 'Notificacions de mensaxes';

  @override
  String get callNotifications => 'Notificacions de chamadas';

  @override
  String get useGradient => 'Usar degradado';

  @override
  String get gradientStart => 'Cor de inicio';

  @override
  String get gradientEnd => 'Cor de fin';

  @override
  String get preview => 'Vista previa';

  @override
  String get reset => 'Restablecer';

  @override
  String get securityNumber => 'Numero de seguridade';

  @override
  String securityNumberDescription(String name) {
    return 'Verifica que o numero de seguridade coincida co dispositivo de $name';
  }

  @override
  String get verifyEncryption => 'Verificar cifrado de extremo a extremo';

  @override
  String get tapToCopy => 'Toca para copiar';

  @override
  String get howToVerify => 'Como verificar';

  @override
  String get verifyStep1 => 'Quedade co contacto en persoa ou chamade';

  @override
  String get verifyStep2 =>
      'Comparade os numeros de seguridade ou escaneade os codigos QR';

  @override
  String get verifyStep3 => 'Se coinciden, o chat e seguro';

  @override
  String get scanToVerify => 'Escanear para verificar';

  @override
  String get reportSpam => 'Denunciar spam';

  @override
  String get reportSpamSubtitle => 'Denunciar este contacto como spam';

  @override
  String get reportSpamDescription =>
      'Este contacto sera denunciado de forma anonima. A tua identidade non sera compartida. Estas seguro?';

  @override
  String get report => 'Denunciar';

  @override
  String get spamReported => 'Spam denunciado';

  @override
  String get reportError => 'Non se puido enviar a denuncia. Intentao de novo.';

  @override
  String get reportRateLimited =>
      'Alcanzaches o numero maximo de denuncias por hoxe.';

  @override
  String get blockContact => 'Bloquear contacto';

  @override
  String get blockContactDescription =>
      'Este contacto xa non podera enviarte mensaxes nin chamarte. Non sera notificado.';

  @override
  String get unblockContact => 'Desbloquear contacto';

  @override
  String get unblockContactDescription =>
      'Este contacto podera enviarte mensaxes e chamarte de novo.';

  @override
  String get contactBlocked => 'Contacto bloqueado';

  @override
  String get contactUnblocked => 'Contacto desbloqueado';

  @override
  String get contactIsBlocked => 'Este contacto esta bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get deleteContactSubtitle => 'Eliminar este contacto e chat';

  @override
  String get confirmWithPin => 'Confirmar co PIN';

  @override
  String get enterPinToConfirm =>
      'Introduce o teu PIN para confirmar esta accion';

  @override
  String get profilePhoto => 'Foto de perfil';

  @override
  String get takePhoto => 'Facer unha foto';

  @override
  String get chooseFromGallery => 'Elixir da galeria';

  @override
  String get removePhoto => 'Eliminar foto';

  @override
  String get viewContactHashId => 'Ver o identificador do contacto';

  @override
  String get hashIdPartiallyMasked =>
      'Parcialmente oculto para a tua seguridade e a privacidade do contacto';

  @override
  String get addFirstContact => 'Engade o teu primeiro contacto';

  @override
  String get addFirstContactSubtitle =>
      'Comparte o teu codigo QR ou escanea o dun amigo';

  @override
  String get directory => 'Directorio';

  @override
  String get noContacts => 'Sen contactos';

  @override
  String get noContactsSubtitle => 'Engade un contacto para comezar';

  @override
  String get sendMessageAction => 'Enviar unha mensaxe';

  @override
  String get audioCall => 'Chamada de voz';

  @override
  String get videoCall => 'Videochamada';

  @override
  String get viewProfile => 'Ver perfil';

  @override
  String get deleteContactDirectory => 'Eliminar contacto';

  @override
  String get scanShort => 'Escanear';

  @override
  String get addShort => 'Engadir';

  @override
  String deleteContactConfirmName(String name) {
    return 'Seguro que queres eliminar a $name?';
  }

  @override
  String get noNotesTitle => 'Sen notas';

  @override
  String get noNotesSubtitle => 'Crea a tua primeira nota';

  @override
  String get newNote => 'Nova nota';

  @override
  String get editNote => 'Editar nota';

  @override
  String get deleteNote => 'Eliminar nota';

  @override
  String get deleteNoteConfirm => 'Seguro que queres eliminar esta nota?';

  @override
  String get noteTitle => 'Titulo';

  @override
  String get noteContent => 'Contido';

  @override
  String get addItem => 'Engadir elemento';

  @override
  String get pinNote => 'Fixar';

  @override
  String get unpinNote => 'Desfixar';

  @override
  String get noteColor => 'Cor';

  @override
  String get notePassword => 'Contrasinal';

  @override
  String get setPassword => 'Establecer contrasinal';

  @override
  String get changePassword => 'Cambiar contrasinal';

  @override
  String get removePassword => 'Eliminar contrasinal';

  @override
  String get enterPassword => 'Introduce o contrasinal';

  @override
  String get confirmPassword => 'Confirmar contrasinal';

  @override
  String get passwordPin => 'Codigo PIN';

  @override
  String get passwordText => 'Contrasinal de texto';

  @override
  String get protectedNote => 'Nota protexida';

  @override
  String get incorrectPassword => 'Contrasinal incorrecto';

  @override
  String get passwordSet => 'Contrasinal establecido';

  @override
  String get passwordRemoved => 'Contrasinal eliminado';

  @override
  String get notesBiometric => 'Face ID para notas';

  @override
  String get notesBiometricSubtitle =>
      'Requirir autenticacion biometrica para abrir notas protexidas';

  @override
  String get textNote => 'Nota de texto';

  @override
  String get checklistNote => 'Lista de tarefas';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tarefas';
  }

  @override
  String get autoSaved => 'Gardado';

  @override
  String get searchNotes => 'Buscar notas';

  @override
  String get legalConsent => 'Consentimento legal';

  @override
  String get confirmAge13 => 'Confirmo que teno polo menos 13 anos';

  @override
  String get acceptLegalStart => 'Acepto a ';

  @override
  String get privacyPolicy => 'Politica de privacidade';

  @override
  String get termsOfService => 'Termos de servizo';

  @override
  String get andThe => ' e os ';

  @override
  String get continueButton => 'Continuar';

  @override
  String get mustAcceptTerms => 'Debes aceptar ambas condicions para continuar';

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
  String get support => 'Soporte';

  @override
  String get contactSupport => 'Contactar co soporte';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Denunciar abuso';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Legal';

  @override
  String get legalEntity => 'Entidade legal';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fixar';

  @override
  String get unpinConversation => 'Desfixar';

  @override
  String get hideConversation => 'Eliminar do muro';

  @override
  String get deleteConversation => 'Eliminar conversa';

  @override
  String get deleteConversationConfirm =>
      'Introduce o teu PIN para confirmar a eliminacion de todas as mensaxes';

  @override
  String get noConversations => 'Sen conversas ainda';

  @override
  String get startConversation => 'Comezar';

  @override
  String get microphonePermissionRequired => 'Requirese acceso ao microfono';

  @override
  String get microphonePermissionExplanation =>
      'Hash necesita o microfono para facer chamadas.';

  @override
  String get cameraPermissionExplanation =>
      'Hash necesita a camara para videochamadas.';

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
  String get openSettings => 'Abrir axustes';

  @override
  String get callConnecting => 'Conectando...';

  @override
  String get callRinging => 'Chamando...';

  @override
  String get callReconnecting => 'Reconectando...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Reconectando (${seconds}s)';
  }

  @override
  String get callPaused => 'En pausa';

  @override
  String get callPausedSubtitle => 'A chamada aínda está activa';

  @override
  String get callRemoteMicMuted => 'O microfono do contacto esta silenciado';

  @override
  String get callMiniControlsMute => 'Silenciar';

  @override
  String get callMiniControlsUnmute => 'Activar son';

  @override
  String get callMiniControlsHangUp => 'Colgar';

  @override
  String get callMiniControlsReturn => 'Volver a chamada';

  @override
  String get callNetworkPoor => 'Conexion inestable';

  @override
  String get callNetworkLost => 'Conexion perdida';

  @override
  String get callEndedTitle => 'Chamada rematada';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Datos do dispositivo';

  @override
  String get deviceDataSubtitle => 'Almacenamento local e do servidor';

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
  String get localStorage => 'Almacenamento local';

  @override
  String get onThisDevice => 'neste dispositivo';

  @override
  String get encryptedDatabases => 'Bases de datos cifradas';

  @override
  String get files => 'Ficheiros';

  @override
  String get secureKeychain => 'Chaves seguras';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Nomes, avatares, chaves Signal';

  @override
  String get messagesDetail => 'Conversas cifradas';

  @override
  String get notesDetail => 'Notas persoais';

  @override
  String get signalSessions => 'Sesions Signal';

  @override
  String get signalSessionsDetail => 'Sesions de cifrado';

  @override
  String get pendingContacts => 'Contactos pendentes';

  @override
  String get pendingContactsDetail => 'Solicitudes pendentes';

  @override
  String get callHistory => 'Chamadas';

  @override
  String get callHistoryDetail => 'Historial de chamadas';

  @override
  String get preferences => 'Preferencias';

  @override
  String get preferencesDetail => 'Preferencias de medios e chamadas';

  @override
  String get avatars => 'Avatares';

  @override
  String get media => 'Medios';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ficheiros',
      one: '1 ficheiro',
      zero: 'sen ficheiros',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Activo';

  @override
  String get notDefined => 'Non definido';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Frase de recuperacion';

  @override
  String get identity => 'Identidade (Hash ID)';

  @override
  String get signalKeys => 'Chaves Signal Protocol';

  @override
  String get authTokens => 'Tokens de autenticacion';

  @override
  String get contactNamesCache => 'Cache de nomes de contactos';

  @override
  String get remoteConfig => 'Configuracion remota';

  @override
  String get notificationPrefs => 'Preferencias de notificacions';

  @override
  String get serverData => 'Datos do servidor';

  @override
  String get serverDataInfo =>
      'Hash garda un minimo de datos no servidor, todos cifrados ou temporais.';

  @override
  String get serverProfile => 'Perfil';

  @override
  String get serverProfileDetail => 'Hash ID, chaves publicas, token de buzon';

  @override
  String get serverPrekeys => 'Pre-chaves';

  @override
  String get serverPrekeysDetail => 'Chaves Signal dun so uso (consumidas)';

  @override
  String get serverMessages => 'Mensaxes en transito';

  @override
  String get serverMessagesDetail => 'Eliminadas despois da entrega (max 24 h)';

  @override
  String get serverMedia => 'Medios en transito';

  @override
  String get serverMediaDetail => 'Eliminados despois da descarga';

  @override
  String get serverContactRequests => 'Solicitudes de contacto';

  @override
  String get serverContactRequestsDetail => 'Caducan despois de 24 h';

  @override
  String get serverRateLimits => 'Limites de velocidade';

  @override
  String get serverRateLimitsDetail => 'Datos temporais contra o abuso';

  @override
  String get privacyReassurance =>
      'Hash non pode ler as tuas mensaxes. Todos os datos estan cifrados de extremo a extremo. Os datos do servidor eliminanse automaticamente.';

  @override
  String get pinTooSimple =>
      'Este PIN e demasiado simple. Elixe un codigo mais seguro.';

  @override
  String get genericError => 'Produciuse un erro. Intentao de novo.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Non se puido crear a conta: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frase copiada ao portapapeis';

  @override
  String get copyPhrase => 'Copiar frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Anota esta frase nun lugar seguro. Se perdes o teu PIN sen esta frase, perderas permanentemente o acceso aos teus datos.';

  @override
  String get noMessages => 'Sen mensaxes';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Eliminar todas as mensaxes con $name?';
  }

  @override
  String get confirmation => 'Confirmacion';

  @override
  String get untitled => 'Sen titulo';

  @override
  String get noSessions => 'Sen sesions';

  @override
  String get unknownContact => 'Contacto desconecido';

  @override
  String get unnamed => 'Sen nome';

  @override
  String get noPendingRequestsAlt => 'Sen solicitudes pendentes';

  @override
  String get deleteAllCallHistory => 'Eliminar todo o historial de chamadas?';

  @override
  String get noCalls => 'Sen chamadas';

  @override
  String get noPreferences => 'Sen preferencias';

  @override
  String get resetAllMediaPrefs =>
      'Restablecer todas as preferencias de medios?';

  @override
  String get deleteThisAvatar => 'Eliminar este avatar?';

  @override
  String get deleteAllAvatars => 'Eliminar todos os avatares?';

  @override
  String get noAvatars => 'Sen avatares';

  @override
  String get deleteThisFile => 'Eliminar este ficheiro?';

  @override
  String get deleteAllMediaFiles => 'Eliminar todos os medios?';

  @override
  String get noMediaFiles => 'Sen medios';

  @override
  String get outgoing => 'Sainte';

  @override
  String get incoming => 'Entrante';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Vista efemera: ${seconds}s';
  }

  @override
  String get normalView => 'Vista normal';

  @override
  String get callReasonCompleted => 'Completada';

  @override
  String get callReasonMissed => 'Perdida';

  @override
  String get callReasonDeclined => 'Rexeitada';

  @override
  String get callReasonFailed => 'Fallida';

  @override
  String get justNow => 'Agora mesmo';

  @override
  String timeAgoMinutes(int count) {
    return 'Hai $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Hai ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Hai ${count}d';
  }

  @override
  String get messageTypeContact => 'Contacto';

  @override
  String get messageTypeLocation => 'Localizacion';

  @override
  String get statusQueued => 'En cola';

  @override
  String get blockedBadge => 'Bloqueado';

  @override
  String get protectedBadge => 'Protexida';

  @override
  String messageCount(int count) {
    return '$count mensaxe(s)';
  }

  @override
  String get deleteQuestion => 'Eliminar?';

  @override
  String get transferMyAccountTitle => 'Transferir a mina conta';

  @override
  String get loadingError => 'Erro de carga';

  @override
  String get transferToNewDevice => 'Transferir a un novo dispositivo';

  @override
  String get transferInstructions =>
      'No teu novo dispositivo, elixe \"Recuperar a mina conta\" e introduce esta informacion:';

  @override
  String get yourHashIdLabel => 'O teu Hash ID';

  @override
  String get enterYourPinCode => 'Introduce o teu codigo PIN';

  @override
  String get pinOwnerConfirmation =>
      'Para confirmar que es o propietario desta conta';

  @override
  String get scanThisQrCode => 'Escanea este codigo QR';

  @override
  String get withYourNewDevice => 'Co teu novo dispositivo';

  @override
  String get orEnterTheCode => 'ou introduce o codigo';

  @override
  String get transferCodeLabel => 'Codigo de transferencia';

  @override
  String get proximityVerification => 'Verificacion de proximidade';

  @override
  String get bringDevicesCloser => 'Achega ambos dispositivos';

  @override
  String get confirmTransferQuestion => 'Confirmar a transferencia?';

  @override
  String get accountWillBeTransferred =>
      'A tua conta sera transferida ao novo dispositivo.\n\nEste dispositivo sera desconectado permanentemente.';

  @override
  String get transferComplete => 'Transferencia completada';

  @override
  String get transferSuccessMessage =>
      'A tua conta foi transferida con exito.\n\nEsta aplicacion pecharase agora.';

  @override
  String get manualVerification => 'Verificacion manual';

  @override
  String get codeDisplayedOnBothDevices =>
      'Codigo mostrado en ambos dispositivos:';

  @override
  String get doesCodeMatchNewDevice =>
      'Este codigo coincide co do novo dispositivo?';

  @override
  String get verifiedStatus => 'Verificado';

  @override
  String get inProgressStatus => 'En curso...';

  @override
  String get notAvailableStatus => 'Non disponidle';

  @override
  String get codeExpiredRestart => 'O codigo caducou. Comeza de novo.';

  @override
  String get codesDoNotMatchCancelled =>
      'Os codigos non coinciden. Transferencia cancelada.';

  @override
  String transferToDevice(String device) {
    return 'A: $device';
  }

  @override
  String get copiedExclamation => 'Copiado!';

  @override
  String expiresInTime(String time) {
    return 'Caduca en $time';
  }

  @override
  String get biometricNotAvailable =>
      'A biometria non esta disponidle neste dispositivo';

  @override
  String get biometricAuthError => 'Erro na autenticacion biometrica';

  @override
  String get authenticateForBiometric => 'Autenticate para activar a biometria';

  @override
  String get biometricAuthFailed => 'A autenticacion biometrica fallou';

  @override
  String get forceUpdateTitle => 'Actualizacion requirida';

  @override
  String get forceUpdateMessage =>
      'Hai unha nova version de Hash disponidle. Actualiza para continuar.';

  @override
  String get updateButton => 'Actualizar';

  @override
  String get maintenanceInProgress => 'Mantemento en curso';

  @override
  String get tryAgainLater => 'Intentao de novo mais tarde';

  @override
  String get information => 'Informacion';

  @override
  String get later => 'Mais tarde';

  @override
  String get doYouLikeHash => 'Gustache Hash?';

  @override
  String get yourFeedbackHelps =>
      'A tua opinion axudanos a mellorar a aplicacion';

  @override
  String get ratingTerrible => 'Terrible';

  @override
  String get ratingBad => 'Malo';

  @override
  String get ratingOk => 'Aceptable';

  @override
  String get ratingGood => 'Bo';

  @override
  String get ratingExcellent => 'Excelente!';

  @override
  String get donationMessage =>
      'Hash e un proxecto sen animo de lucro. O teu apoio axudanos a seguir construindo unha mensaxeria realmente privada.';

  @override
  String get recentConnections => 'Conexions recentes';

  @override
  String get loginInfoText =>
      'Cada desbloqueo con PIN rexistrase localmente. So se gardan as ultimas 24 horas.';

  @override
  String get connectionCount => 'Conexion(s)';

  @override
  String get periodLabel => 'Periodo';

  @override
  String get historyLabel => 'Historial';

  @override
  String get noLoginRecorded => 'Ningun inicio de sesion rexistrado';

  @override
  String get nextUnlocksAppearHere =>
      'Os proximos desbloqueos aparecerdn aqui.';

  @override
  String get dataLocalOnly =>
      'Estes datos almacenanse so no teu dispositivo e nunca se transmiten.';

  @override
  String get currentSession => 'Actual';

  @override
  String get todayLabel => 'Hoxe';

  @override
  String get yesterdayLabel => 'Onte';

  @override
  String get justNowLabel => 'Agora mesmo';

  @override
  String minutesAgoLabel(int count) {
    return 'Hai $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Hai ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Hai ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Sen mantemento previsto';

  @override
  String get everythingWorkingNormally => 'Todo funciona normalmente';

  @override
  String get maintenanceTitle => 'Mantemento';

  @override
  String get maintenanceActiveLabel => 'EN CURSO';

  @override
  String get maintenancePlannedLabel => 'PREVISTO';

  @override
  String get locking => 'Bloqueando...';

  @override
  String get newMessageNotification => 'Nova mensaxe';

  @override
  String get secExplainTitle => 'Como Hash te protexe';

  @override
  String get secExplainIntro =>
      'Hash esta desenado para que ninguén poida ler as tuas mensaxes.';

  @override
  String get secExplainIntroSub =>
      'Nin nos mesmos.\nAsi e como funciona, explicado de forma sinxela.';

  @override
  String get secJourneyLabel => 'O PERCORRIDO';

  @override
  String get secJourneyTitle => 'A viaxe da tua mensaxe';

  @override
  String get secJourneySubtitle =>
      'Dende o teu dedo ata a pantalla do teu contacto, cada paso esta protexido. Segue o camino.';

  @override
  String get secStep1Title => 'Escribes a tua mensaxe';

  @override
  String get secStep1Desc =>
      'Escribes \"Ola!\" na aplicacion. Neste momento, a mensaxe so existe na memoria do teu telefono. Non se enviou nada.';

  @override
  String get secStep2Title => 'Cifrado co protocolo Signal';

  @override
  String get secStep2Desc =>
      'En canto premes \"Enviar\", a tua mensaxe transformase nunha cadea de caracteres incomprensibles. E como se a tua mensaxe estivese gardada nunha caixa forte da que so o teu contacto ten a chave.';

  @override
  String get secStep3Title => 'Sealed Sender: o sobre invisible';

  @override
  String get secStep3Desc =>
      'Imaxina que envias unha carta por correo, pero sen direccion de remitente no sobre. Iso e exactamente o que fai Hash. A mensaxe depositase nunha caixa de correo anonima. O servidor non sabe quen a enviou.';

  @override
  String get secStep4Title => 'O servidor non ve nada';

  @override
  String get secStep4Desc =>
      'O servidor actua como un carteiro cego. So sabe que \"alguén deixou algo na caixa #A7X9\". Non sabe quen o enviou, que e, nin para quen e.';

  @override
  String get secStep4Highlight =>
      'Sen metadatos almacenados: sen direccion IP, sen marca de tempo, sen vinculo entre remitente e destinatario.';

  @override
  String get secStep5Title => 'O teu contacto recibe a mensaxe';

  @override
  String get secStep5Desc =>
      'O telefono do teu contacto recolle o contido da sua caixa de correo anonima e descifra a mensaxe coa sua chave privada, que nunca saiu do seu dispositivo. \"Ola!\" aparece na sua pantalla.';

  @override
  String get secStep6Title => 'A mensaxe desaparece do servidor';

  @override
  String get secStep6Desc =>
      'En canto o teu contacto confirma a recepcion, o servidor elimina permanentemente a mensaxe. Sen papeleira, sen arquivo, sen copia de seguridade. Incluso as mensaxes non lidas destruense automaticamente despois de 24 horas.';

  @override
  String get secStep7Title => 'Expiracion local';

  @override
  String get secStep7Desc =>
      'No telefono do teu contacto, a mensaxe autodestruese segundo a duracion que elixiches: inmediatamente despois de ler, 5 minutos, 1 hora... ti decides.';

  @override
  String get secJourneyConclusion =>
      'Resultado: cero rastro no servidor, cero rastro nos dispositivos. A mensaxe existiu so o tempo necesario para ser lida e despois desapareceu.';

  @override
  String get secArchLabel => 'ARQUITECTURA';

  @override
  String get secArchTitle => '5 capas de proteccion';

  @override
  String get secArchSubtitle =>
      'Hash non depende dunha soa tecnoloxia. Cada capa reforza as demais. Ainda que unha capa se vexa comprometida, os teus datos seguen a salvo.';

  @override
  String get secLayer1Title => 'Cifrado de extremo a extremo';

  @override
  String get secLayer1Desc =>
      'Cada mensaxe cifrase cunha chave unica. En termos sinxelos: ainda que alguén descifre unha mensaxe, non podera descifrar a seguinte. Cada mensaxe ten o seu propio cadeado.';

  @override
  String get secLayer1Detail =>
      'Para ficheiros (fotos, videos, documentos), Hash usa cifrado adicional AES-256-GCM. O ficheiro cifrase antes de saír do teu telefono.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimato na rede)';

  @override
  String get secLayer2Desc =>
      'As mensaxerias convencionais envian as tuas mensaxes coa tua identidade adxunta. E como escribir o teu nome no sobre. Hash usa caixas de correo anonimas: o servidor entrega a mensaxe sen saber quen a enviou.';

  @override
  String get secLayer2Detail =>
      'Resultado: ainda en caso de filtracion de datos do servidor, e imposible reconstruir quen fala con quen.';

  @override
  String get secLayer3Title => 'Eliminacion automatica';

  @override
  String get secLayer3Desc =>
      'As mensaxes eliminanse do servidor en canto se confirma a recepcion. Ainda que unha mensaxe nunca se recolla, destruese automaticamente despois de 24 horas.';

  @override
  String get secLayer3Detail =>
      'No teu telefono, as mensaxes autodestruense segundo a duracion que elixas: inmediatamente, 5 min, 15 min, 30 min, 1 h, 3 h, 6 h ou 12 h.';

  @override
  String get secLayer4Title => 'Proteccion de acceso local';

  @override
  String get secLayer4Desc =>
      'A aplicacion esta protexida por un PIN de 6 dixitos e/ou biometria (Face ID, pegada dixital). Despois de demasiados intentos fallidos, a aplicacion bloquease cun atraso crecente despois de cada fallo.';

  @override
  String get secLayer5Title => 'Base de datos bloqueada';

  @override
  String get secLayer5Desc =>
      'No lado do servidor, ningun usuario pode escribir directamente na base de datos. Todas as accions pasan por funcions seguras que verifican cada solicitude.';

  @override
  String get secLayer5Detail =>
      'E como un mostrador de banco: nunca tocas a caixa forte ti mesmo. Fas unha solicitude e o sistema verifica que tes dereito antes de actuar.';

  @override
  String get secVashLabel => 'UNICO NO MUNDO';

  @override
  String get secVashTitle => 'Modo Vash';

  @override
  String get secVashSubtitle =>
      'Un sistema de seguridade de emerxencia que non existe en ningunha outra aplicacion de mensaxeria.';

  @override
  String get secVashScenarioTitle => 'Imaxina esta situacion';

  @override
  String get secVashScenario1 => 'Alguén accede ao teu telefono';

  @override
  String get secVashScenario2 => 'Pidenche o teu codigo PIN';

  @override
  String get secVashScenario3 =>
      'Queres borrar todos os teus datos con urxencia';

  @override
  String get secVashSolutionTitle => 'A solucion: dous codigos PIN';

  @override
  String get secVashSolutionDesc =>
      'Configuras dous codigos PIN diferentes en Hash:';

  @override
  String get secVashNormalCodeLabel => 'Codigo normal';

  @override
  String get secVashNormalCodeDesc =>
      'Abre a aplicacion normalmente con todos os teus datos';

  @override
  String get secVashCodeLabel2 => 'Codigo Vash';

  @override
  String get secVashCodeDescription =>
      'Abre a aplicacion normalmente... pero todos os teus datos eliminanse silenciosamente en segundo plano';

  @override
  String get secVashWhatHappensTitle => 'Que pasa despois';

  @override
  String get secVashWhatHappensDesc =>
      'A aplicacion abrese normalmente. Sen alerta, sen animacion sospeitosa. A pantalla simplemente mostra unha aplicacion baleira, como se a acabases de instalar.\n\nEn realidade, todas as tuas conversas, contactos e mensaxes foron eliminados irreversiblemente nunha fraccion de segundo.';

  @override
  String get secCallsLabel => 'CHAMADAS E FICHEIROS';

  @override
  String get secCallsTitle => 'Todo esta cifrado';

  @override
  String get secCallsSubtitle =>
      'Non son so as mensaxes. Absolutamente todo o que pasa por Hash esta cifrado de extremo a extremo.';

  @override
  String get secAudioCallTitle => 'Chamadas de voz';

  @override
  String get secAudioCallDesc =>
      'Cifradas de extremo a extremo via WebRTC. A voz transmitese directamente entre dispositivos.';

  @override
  String get secVideoCallTitle => 'Videochamadas';

  @override
  String get secVideoCallDesc =>
      'A mesma tecnoloxia, cada fluxo cifrado individualmente.';

  @override
  String get secPhotosTitle => 'Fotos e videos';

  @override
  String get secPhotosDesc =>
      'Cifrados en AES-256-GCM antes de saír do teu telefono.';

  @override
  String get secDocsTitle => 'Documentos';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, calquera ficheiro. Nome, tamano e contido cifrados.';

  @override
  String get secAnonLabel => 'ANONIMATO';

  @override
  String get secAnonTitle => 'Non se require identidade';

  @override
  String get secAnonSubtitle =>
      'Hash nunca pide o teu numero de telefono nin o teu email. Identificaste cun Hash ID unico e anonimo.';

  @override
  String get secHashIdTitle => 'O teu Hash ID';

  @override
  String get secHashIdDesc =>
      'Este e o teu identificador unico. Non revela nada sobre ti: nin o teu nome, nin o teu numero, nin a tua localizacion. E como un pseudonimo imposible de vincular a tua identidade real.\n\nPara engadir un contacto, compartes o teu Hash ID ou escaneas un codigo QR. Iso e todo. Sen axenda sincronizada, sen suxerencias de \"Persoas que quizais conezas\".';

  @override
  String get secDataLabel => 'DATOS';

  @override
  String get secDataTitle => 'O que Hash non sabe';

  @override
  String get secDataSubtitle =>
      'A mellor forma de protexer os teus datos e non recollelos.';

  @override
  String get secNeverCollected => 'Nunca recollido';

  @override
  String get secNeverItem1 => 'Contido das mensaxes';

  @override
  String get secNeverItem2 => 'Lista de contactos';

  @override
  String get secNeverItem3 => 'Numero de telefono';

  @override
  String get secNeverItem4 => 'Direccion de email';

  @override
  String get secNeverItem5 => 'Direccion IP';

  @override
  String get secNeverItem6 => 'Localizacion';

  @override
  String get secNeverItem7 => 'Metadatos (quen fala con quen)';

  @override
  String get secNeverItem8 => 'Historial de chamadas';

  @override
  String get secNeverItem9 => 'Axenda de direccions';

  @override
  String get secNeverItem10 => 'Identificadores publicitarios';

  @override
  String get secTempStored => 'Almacenado temporalmente';

  @override
  String get secTempItem1 => 'Hash ID anonimo (identificador unico)';

  @override
  String get secTempItem2 => 'Chaves publicas de cifrado';

  @override
  String get secTempItem3 => 'Mensaxes cifradas en transito (max 24 h)';

  @override
  String get secTempNote =>
      'Nin estes datos minimos permiten identificarte. O teu Hash ID non esta vinculado a ningunha informacion persoal.';

  @override
  String get secFooterTitle => 'A tua privacidade, a tua liberdade';

  @override
  String get secFooterDesc =>
      'Hash usa as mesmas tecnoloxias de cifrado que as aplicacions profesionais mais esixentes. As tuas mensaxes estan protexidas polas matematicas, non por promesas.';

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
