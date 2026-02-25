// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Cero Rastro. Cero Compromiso.';

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
  String get noConversation => 'Sin chats';

  @override
  String get noConversationSubtitle =>
      'Añade un contacto para empezar a chatear de forma segura';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitudes recibidas',
      one: '1 solicitud recibida',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitudes enviadas pendientes',
      one: '1 solicitud enviada pendiente',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Añadir contacto';

  @override
  String get shareApp => 'Compartir app';

  @override
  String get newMessage => 'Nuevo mensaje';

  @override
  String get newConversation => 'Enviar un mensaje';

  @override
  String get settings => 'Ajustes';

  @override
  String get myHashId => 'Mi Hash ID';

  @override
  String get supportHash => 'Apoyar Hash';

  @override
  String get supportHashSubtitle => 'Hash es un proyecto sin ánimo de lucro';

  @override
  String get donate => 'Donar';

  @override
  String get appearance => 'Apariencia';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automático';

  @override
  String get themeAutoSubtitle => 'Sigue la configuración del sistema';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeRecommendation =>
      'El tema oscuro es recomendado para mayor privacidad';

  @override
  String get language => 'Idioma';

  @override
  String get languageAuto => 'Automático (sistema)';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get messages => 'Mensajes';

  @override
  String get calls => 'Llamadas';

  @override
  String get vibration => 'Vibración';

  @override
  String get notificationContent => 'Contenido de notificaciones';

  @override
  String get notificationContentFull => 'Mostrar todo';

  @override
  String get notificationContentFullDesc =>
      'Nombre del contacto y vista previa del mensaje';

  @override
  String get notificationContentName => 'Solo nombre';

  @override
  String get notificationContentNameDesc =>
      'Muestra solo el nombre del contacto';

  @override
  String get notificationContentDiscrete => 'Discreto';

  @override
  String get notificationContentDiscreteDesc =>
      'Muestra solo \"Nuevo mensaje\"';

  @override
  String get security => 'Seguridad';

  @override
  String get howHashProtectsYou => 'Cómo Hash te protege';

  @override
  String get howHashProtectsYouSubtitle => 'Entiende tu seguridad';

  @override
  String get accountSecurity => 'Seguridad de la cuenta';

  @override
  String get accountSecuritySubtitle => 'PIN, biometría, Modo Vash';

  @override
  String get blockScreenshots => 'Bloquear capturas de pantalla';

  @override
  String get transferDevice => 'Transferir a otro dispositivo';

  @override
  String get transferDeviceSubtitle => 'Migrar tu cuenta';

  @override
  String get pinCode => 'Código PIN';

  @override
  String get changePin => 'Cambiar código PIN';

  @override
  String get currentPin => 'Código PIN actual';

  @override
  String get newPin => 'Nuevo código PIN';

  @override
  String get confirmPin => 'Confirmar código PIN';

  @override
  String get pinChanged => 'Código PIN cambiado';

  @override
  String get incorrectPin => 'PIN incorrecto';

  @override
  String get pinsDoNotMatch => 'Los códigos no coinciden';

  @override
  String get autoLock => 'Bloqueo automático';

  @override
  String get autoLockDelay => 'Tiempo de bloqueo';

  @override
  String get autoLockImmediate => 'Inmediato';

  @override
  String get autoLockMinute => '1 minuto';

  @override
  String autoLockMinutes(int count) {
    return '$count minutos';
  }

  @override
  String get vashCode => 'Código Vash';

  @override
  String get vashModeTitle => 'Modo Vash';

  @override
  String get vashModeExplanation => 'Tu red de seguridad definitiva.';

  @override
  String get vashModeDescription =>
      'Elegirás un segundo código PIN. Si alguna vez te obligan a abrir Hash, introduce este código en lugar de tu PIN habitual.\n\nLa aplicación se abrirá normalmente, pero todas tus conversaciones y contactos habrán desaparecido.\n\nPara cualquiera que mire tu pantalla, Hash simplemente aparece vacío — como si nunca lo hubieras usado.';

  @override
  String get vashModeIrreversible =>
      'Esta acción es silenciosa e irreversible.';

  @override
  String get chooseVashCode => 'Elegir mi código Vash';

  @override
  String get vashCodeInfo =>
      'Un segundo código PIN que abre la app normalmente, pero vacía.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Si introduces este código en lugar de tu PIN:';

  @override
  String get vashDeleteContacts => 'Tus contactos desaparecen';

  @override
  String get vashDeleteMessages => 'Tus conversaciones desaparecen';

  @override
  String get vashDeleteHistory => 'Tus notas desaparecen';

  @override
  String get vashKeepId => 'Tu identidad Hash (#XXX-XXX-XXX) permanece igual';

  @override
  String get vashAppearNormal =>
      'La app aparece normal pero vacía, como nueva. Esta acción es irreversible.';

  @override
  String get setupVashCode => 'Configurar código Vash';

  @override
  String get modifyVashCode => 'Modificar código Vash';

  @override
  String get currentVashCode => 'Código Vash actual';

  @override
  String get newVashCode => 'Nuevo código Vash';

  @override
  String get confirmVashCode => 'Confirmar código Vash';

  @override
  String get vashCodeConfigured => 'Código Vash configurado';

  @override
  String get vashCodeModified => 'Código Vash modificado';

  @override
  String get vashCodeMustDiffer => 'El código Vash debe ser diferente del PIN';

  @override
  String get incorrectVashCode => 'Código Vash incorrecto';

  @override
  String get vashWhatToDelete => '¿Qué debe hacer desaparecer el Modo Vash?';

  @override
  String get vashDeleteContactsOption => 'Contactos';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mensajes';

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
      'Elige un código diferente de tu PIN principal';

  @override
  String get vashConfirmSubtitle => 'Confirma tu código Vash';

  @override
  String get pinCodeForEntry => 'Código PIN para entrar en la aplicación';

  @override
  String get vashCodeSection => 'Modo Vash';

  @override
  String get biometric => 'Biometría';

  @override
  String get biometricUnlock => 'Desbloquear con huella o Face ID';

  @override
  String get enableBiometric => 'Activar biometría';

  @override
  String get biometricWarningMessage =>
      'Al activar la biometría, no podrás usar tu código Vash para entrar en la aplicación.\n\nSolo podrás usar el código Vash si la biometría falla (después de varios intentos fallidos).\n\n¿Estás seguro de querer continuar?';

  @override
  String get understood => 'Entendido';

  @override
  String get shareAppSubtitle => 'Comparte Hash con tus seres queridos';

  @override
  String get share => 'Compartir';

  @override
  String get danger => 'Peligro';

  @override
  String get deleteAccount => 'Eliminar mi cuenta';

  @override
  String get deleteAccountSubtitle => 'Acción irreversible';

  @override
  String get deleteAccountConfirmTitle => 'Eliminar mi cuenta';

  @override
  String get deleteAccountConfirmMessage =>
      'Tu cuenta será eliminada permanentemente. Esta acción es irreversible.\n\n• Todos tus chats\n• Todos tus contactos\n• Tu Hash ID\n\nDeberás crear una nueva cuenta.';

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
    return 'Error al eliminar: $error';
  }

  @override
  String get yourSecurity => 'Tu seguridad';

  @override
  String get securityInfo =>
      '• Cifrado de extremo a extremo (Protocolo Signal)\n• Ningún dato en nuestros servidores tras la entrega\n• Claves almacenadas solo en tu dispositivo\n• Código PIN nunca enviado al servidor';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Bienvenido';

  @override
  String get securityStatement1 => 'Tus mensajes están protegidos.';

  @override
  String get securityStatement2 => 'Cifrado de extremo a extremo.';

  @override
  String get securityStatement3 => 'Sin rastro. Sin compromiso.';

  @override
  String get securityStatement4 => 'Tu privacidad es un derecho.';

  @override
  String get accessBlocked => 'Acceso bloqueado';

  @override
  String get tooManyAttempts => 'Demasiados intentos. Inténtalo más tarde.';

  @override
  String get pleaseWait => 'Por favor espera';

  @override
  String get waitDelay => 'Por favor espera a que termine el tiempo';

  @override
  String attemptCount(int current, int max) {
    return 'Intento $current de $max';
  }

  @override
  String retryIn(String time) {
    return 'Reintentar en $time';
  }

  @override
  String get forgotPin => '¿Olvidaste el PIN? Usa la frase de recuperación';

  @override
  String get useRecoveryPhrase => 'Usar frase de recuperación';

  @override
  String get recoveryWarningTitle => 'Atención';

  @override
  String get recoveryWarningMessage => 'La recuperación de cuenta:';

  @override
  String get recoveryDeleteAllMessages => 'Eliminará TODOS tus mensajes';

  @override
  String get recoveryWaitDelay => 'Requerirá un tiempo de espera de 1 hora';

  @override
  String get recoveryKeepContacts => 'Conservará tus contactos';

  @override
  String get recoveryIrreversible =>
      'Esta acción es irreversible. Tus mensajes se perderán permanentemente.';

  @override
  String get iUnderstand => 'Entiendo';

  @override
  String get accountRecovery => 'Recuperación de cuenta';

  @override
  String get enterRecoveryPhrase =>
      'Introduce las 24 palabras de tu frase de recuperación, separadas por espacios.';

  @override
  String get recoveryPhraseHint => 'palabra1 palabra2 palabra3 ...';

  @override
  String get recover => 'Recuperar';

  @override
  String get recoveryPhraseRequired =>
      'Por favor introduce tu frase de recuperación';

  @override
  String get recoveryPhrase24Words =>
      'La frase debe contener exactamente 24 palabras';

  @override
  String get incorrectRecoveryPhrase => 'Frase de recuperación incorrecta';

  @override
  String get recoveryInitError => 'Error al iniciar la recuperación';

  @override
  String get securityDelay => 'Tiempo de seguridad';

  @override
  String get securityDelayMessage =>
      'Por tu seguridad, se requiere un tiempo de espera antes de poder crear un nuevo PIN.';

  @override
  String get timeRemaining => 'Tiempo restante';

  @override
  String get messagesDeletedForProtection =>
      'Tus mensajes han sido eliminados para tu protección.';

  @override
  String get canCloseApp => 'Puedes cerrar la app y volver más tarde.';

  @override
  String get onboardingTitle1 => 'Bienvenido a Hash';

  @override
  String get onboardingSubtitle1 => 'El mensajero que no deja rastro';

  @override
  String get onboardingTitle2 => 'Cifrado total';

  @override
  String get onboardingSubtitle2 =>
      'Tus mensajes están cifrados de extremo a extremo con el protocolo Signal';

  @override
  String get onboardingTitle3 => 'Sin rastro';

  @override
  String get onboardingSubtitle3 =>
      'Los mensajes se eliminan de los servidores tras su entrega';

  @override
  String get onboardingTitle4 => 'Tu seguridad';

  @override
  String get onboardingSubtitle4 =>
      'Código PIN, Modo Vash y frase de recuperación';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get next => 'Siguiente';

  @override
  String get skip => 'Omitir';

  @override
  String get alreadyHaveAccount => 'Ya tengo una cuenta';

  @override
  String get transferMyAccount => 'Transferir mi cuenta';

  @override
  String get createPin => 'Crear un código PIN';

  @override
  String get createPinSubtitle => 'Este código protegerá el acceso a tu app';

  @override
  String get confirmYourPin => 'Confirma tu código PIN';

  @override
  String get confirmPinSubtitle => 'Introduce tu código PIN de nuevo';

  @override
  String get saveRecoveryPhrase => 'Frase de recuperación';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Anota estas 24 palabras en orden. Te permitirán recuperar tu cuenta si olvidas tu PIN.';

  @override
  String get phraseWritten => 'He anotado mi frase';

  @override
  String get warningRecoveryPhrase =>
      'Si pierdes esta frase y olvidas tu PIN, perderás el acceso a tu cuenta.';

  @override
  String get accountTransferred => 'Cuenta transferida';

  @override
  String get accountTransferredMessage =>
      'Tu cuenta ha sido transferida a otro dispositivo. Esta sesión ya no es válida.';

  @override
  String get accountTransferredInfo =>
      'Si no iniciaste esta transferencia, tu cuenta puede haber sido comprometida.';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get transferAccount => 'Transferir cuenta';

  @override
  String get transferAccountInfo =>
      'Transfiere tu cuenta Hash a un nuevo dispositivo. Tu sesión actual será invalidada.';

  @override
  String get generateTransferCode => 'Generar código de transferencia';

  @override
  String get transferCode => 'Código de transferencia';

  @override
  String transferCodeExpires(int minutes) {
    return 'Este código expira en $minutes minutos';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Introduce este código en tu nuevo dispositivo para transferir tu cuenta.';

  @override
  String get generateNewCode => 'Generar nuevo código';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String get scanQrCodeSubtitle =>
      'Escanea el código QR de un contacto para añadirlo';

  @override
  String get qrCodeDetected => 'Código QR detectado';

  @override
  String get invalidQrCode => 'Código QR inválido';

  @override
  String get cameraPermissionRequired => 'Se requiere permiso de cámara';

  @override
  String get myQrCode => 'Mi código QR';

  @override
  String get myQrCodeSubtitle =>
      'Comparte este código QR para que tus contactos puedan añadirte';

  @override
  String get shareQrCode => 'Compartir';

  @override
  String get addContactTitle => 'Añadir contacto';

  @override
  String get addContactByHashId => 'Introduce el Hash ID de tu contacto';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Buscar';

  @override
  String get contactNotFound => 'Contacto no encontrado';

  @override
  String get contactAlreadyAdded => 'Este contacto ya está en tu lista';

  @override
  String get contactAdded => 'Contacto añadido';

  @override
  String get myProfile => 'Mi perfil';

  @override
  String get myProfileSubtitle =>
      'Comparte esta información para que puedan añadirte';

  @override
  String get temporaryCode => 'Código temporal';

  @override
  String temporaryCodeExpires(String time) {
    return 'Expira en $time';
  }

  @override
  String get codeExpired => 'Código expirado';

  @override
  String get generateNewCodeButton => 'Nuevo código';

  @override
  String get copyHashId => 'Copiar ID';

  @override
  String get copyCode => 'Copiar código';

  @override
  String get copiedToClipboard => 'Copiado';

  @override
  String get showMyQrCode => 'Mostrar mi código QR';

  @override
  String get orDivider => 'o';

  @override
  String get openScanner => 'Abrir escáner';

  @override
  String get addManually => 'Añadir manualmente';

  @override
  String get contactHashIdLabel => 'Hash ID del contacto';

  @override
  String get temporaryCodeLabel => 'Código temporal';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Pide a tu contacto que genere un código desde su perfil';

  @override
  String get verifyAndAdd => 'Verificar y añadir';

  @override
  String get fillAllFields => 'Por favor, rellena todos los campos';

  @override
  String get invalidHashIdFormat => 'Formato de ID inválido (ej: 123-456-ABC)';

  @override
  String get userNotFound => 'Usuario no encontrado';

  @override
  String get cannotAddYourself => 'No puedes añadirte a ti mismo';

  @override
  String get invalidOrExpiredCode => 'Código temporal inválido o expirado';

  @override
  String get contactFound => '¡Contacto encontrado!';

  @override
  String get howToCallContact => '¿Cómo quieres llamarlo?';

  @override
  String get contactNameHint => 'Nombre del contacto';

  @override
  String get addContactButton => 'Añadir';

  @override
  String get contactDetails => 'Detalles del contacto';

  @override
  String get contactName => 'Nombre del contacto';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Añadido el $date';
  }

  @override
  String get deleteContact => 'Eliminar contacto';

  @override
  String deleteContactConfirm(Object name) {
    return '¿Eliminar este contacto?';
  }

  @override
  String get deleteContactMessage => 'Esto también eliminará todo el chat.';

  @override
  String get delete => 'Eliminar';

  @override
  String get typeMessage => 'Escribe un mensaje...';

  @override
  String get messageSent => 'Enviado';

  @override
  String get messageDelivered => 'Entregado';

  @override
  String get messageRead => 'Leído';

  @override
  String get messageFailed => 'Error al enviar';

  @override
  String get now => 'Ahora';

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
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

  @override
  String dateAtTime(String date, String time) {
    return '$date a las $time';
  }

  @override
  String get shareMessage =>
      '¡Únete a mí en Hash! 🔒\n\nEs un mensajero verdaderamente privado: cifrado total, sin rastro en servidores, y modo pánico si lo necesitas.\n\nDescarga la app aquí 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Error';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Ver';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get save => 'Guardar';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Cerrar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get loading => 'Cargando...';

  @override
  String get retry => 'Reintentar';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Solicitudes recibidas';

  @override
  String get noPendingRequests => 'Sin solicitudes pendientes';

  @override
  String get pendingRequestsSubtitle => 'Estas personas quieren añadirte';

  @override
  String requestFromUser(String hashId) {
    return 'Solicitud de $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Expira en $days días';
  }

  @override
  String get acceptRequest => 'Aceptar';

  @override
  String get rejectRequest => 'Rechazar';

  @override
  String get requestAccepted => 'Solicitud aceptada';

  @override
  String get requestRejected => 'Solicitud rechazada';

  @override
  String get requestSent => '¡Solicitud enviada!';

  @override
  String get requestSentSubtitle =>
      'Tu solicitud ha sido enviada. El usuario debe aceptarla para poder chatear.';

  @override
  String get requestAlreadyPending => 'Ya hay una solicitud pendiente';

  @override
  String get requestAlreadySentByOther =>
      'Esta persona ya te ha enviado una solicitud';

  @override
  String get addByHashId => 'Añadir por Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Introduce el Hash ID y el código temporal del contacto';

  @override
  String get enterTemporaryCode => 'Introduce el código de 6 dígitos';

  @override
  String get sendRequest => 'Enviar solicitud';

  @override
  String get acceptContactTitle => 'Aceptar contacto';

  @override
  String get acceptContactSubtitle => 'Puedes darle un nombre personalizado';

  @override
  String get leaveEmptyForHashId => 'Dejar vacío para usar el Hash ID';

  @override
  String get firstName => 'Nombre';

  @override
  String get lastName => 'Apellido';

  @override
  String get notes => 'Notas';

  @override
  String get notesHint => 'Notas personales sobre este contacto';

  @override
  String get photoOptional => 'Foto (opcional)';

  @override
  String get contactNameOptional => 'Nombre (opcional)';

  @override
  String get notesOptional => 'Notas (opcional)';

  @override
  String get storedLocally => 'Almacenado solo en tu dispositivo';

  @override
  String get encryptedMessageLabel => 'Mensaje cifrado';

  @override
  String get identityMessageHint => '¿Quién eres? ¿Cómo se conocen?';

  @override
  String get messageWillBeSentEncrypted =>
      'Este mensaje será cifrado y enviado al destinatario';

  @override
  String get sendRequestButton => 'Enviar solicitud';

  @override
  String get requestExpiresIn24h =>
      'La solicitud expira en 24h si no es aceptada';

  @override
  String get theyAlreadySentYouRequest =>
      'Esta persona ya te ha enviado una solicitud';

  @override
  String get requests => 'Solicitudes';

  @override
  String get receivedRequests => 'Recibidas';

  @override
  String get sentRequests => 'Enviadas';

  @override
  String get noSentRequests => 'Sin solicitudes enviadas';

  @override
  String get cancelRequest => 'Cancelar';

  @override
  String get deleteRequest => 'Eliminar solicitud';

  @override
  String get requestCancelled => 'Solicitud cancelada';

  @override
  String sentTo(String hashId) {
    return 'Enviada a $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Expira en $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Recibida hace $time';
  }

  @override
  String get messageFromRequester => 'Mensaje del solicitante';

  @override
  String get copy => 'Copiar';

  @override
  String get messageInfo => 'Info del mensaje';

  @override
  String get messageDirection => 'Dirección';

  @override
  String get messageSentByYou => 'Enviado por ti';

  @override
  String get messageReceived => 'Recibido';

  @override
  String get messageSentAt => 'Enviado el';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Estado';

  @override
  String get messageReadAt => 'Leído el';

  @override
  String get messageType => 'Tipo';

  @override
  String get messageSize => 'Tamaño';

  @override
  String get messageExpiresAt => 'Expira el';

  @override
  String get messageEncrypted => 'Cifrado de extremo a extremo';

  @override
  String get messageStatusSending => 'Enviando...';

  @override
  String get messageStatusSent => 'Enviado';

  @override
  String get messageStatusDelivered => 'Entregado';

  @override
  String get messageStatusRead => 'Leído';

  @override
  String get messageStatusFailed => 'Fallido';

  @override
  String get serverStatus => 'Servidor';

  @override
  String get onServer => 'Pendiente de entrega';

  @override
  String get deletedFromServer => 'Eliminado';

  @override
  String get messageTypeText => 'Texto';

  @override
  String get messageTypeImage => 'Imagen';

  @override
  String get messageTypeVideo => 'Vídeo';

  @override
  String get messageTypeVoice => 'Audio';

  @override
  String get messageTypeFile => 'Archivo';

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
  String get ephemeralMessages => 'Mensajes efímeros';

  @override
  String get ephemeralMessagesDescription =>
      'Los mensajes se eliminan automáticamente después de este tiempo';

  @override
  String get ephemeralImmediate => 'Inmediato';

  @override
  String get ephemeralImmediateDesc => 'Eliminado al ser leído';

  @override
  String get ephemeralMyPreference => 'Mi preferencia';

  @override
  String get ephemeralMyPreferenceDesc => 'Usar el ajuste global';

  @override
  String get ephemeralDefaultSetting => 'Duración de los mensajes';

  @override
  String get ephemeralChooseDefault => 'Recomendado';

  @override
  String get ephemeral30Seconds => '30 segundos';

  @override
  String get ephemeral30SecondsDesc => 'Eliminado 30s después de leído';

  @override
  String get ephemeral5Minutes => '5 minutos';

  @override
  String get ephemeral5MinutesDesc => 'Eliminado 5min después de leído';

  @override
  String get ephemeral1Hour => '1 hora';

  @override
  String get ephemeral1HourDesc => 'Eliminado 1h después de leído';

  @override
  String get ephemeral3Hours => '3 horas';

  @override
  String get ephemeral6Hours => '6 horas';

  @override
  String get ephemeral6HoursDesc => 'Eliminado 6h después de leído';

  @override
  String get ephemeral12Hours => '12 horas';

  @override
  String get ephemeral24Hours => '24 horas';

  @override
  String get ephemeral24HoursDesc => 'Eliminado 24h después de leído';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Duración personalizada';

  @override
  String get howItWorks => '¿Cómo funciona?';

  @override
  String get ephemeralExplanation1 =>
      'Los mensajes ya se eliminan del servidor al recibirlos.';

  @override
  String get ephemeralExplanation2 =>
      'Este ajuste define cuándo los mensajes desaparecen de TU teléfono después de leerlos.';

  @override
  String get ephemeralExplanation3 =>
      'Tu contacto tiene su propio ajuste para su teléfono.';

  @override
  String get mute1Hour => '1 hora';

  @override
  String get mute8Hours => '8 horas';

  @override
  String get mute1Day => '1 día';

  @override
  String get mute1Week => '1 semana';

  @override
  String get muteAlways => 'Siempre';

  @override
  String get muteExplanation => 'No recibirás notificaciones de este contacto';

  @override
  String get showCallsInRecents => 'Mostrar en llamadas recientes';

  @override
  String get showCallsInRecentsSubtitle =>
      'Las llamadas de Hash aparecen en el historial del teléfono';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Silenciar notificaciones';

  @override
  String get muteDescription => 'No recibirás notificaciones de este contacto';

  @override
  String mutedUntil(String time) {
    return 'Silenciado hasta $time';
  }

  @override
  String get notMuted => 'Notificaciones activadas';

  @override
  String get unmute => 'Reactivar';

  @override
  String get notificationSound => 'Sonido de notificación';

  @override
  String get defaultSound => 'Predeterminado';

  @override
  String get chatSettings => 'Ajustes del chat';

  @override
  String get bubbleColor => 'Color de las burbujas';

  @override
  String get backgroundColor => 'Color de fondo';

  @override
  String get backgroundImage => 'Imagen de fondo';

  @override
  String get chatBackground => 'Fondo del chat';

  @override
  String get customColor => 'Personalizado';

  @override
  String get defaultColor => 'Predeterminado';

  @override
  String get imageSelected => 'Imagen seleccionada';

  @override
  String get noImage => 'Sin imagen';

  @override
  String get color => 'Color';

  @override
  String get image => 'Imagen';

  @override
  String get tapToSelectImage => 'Toca para seleccionar una imagen';

  @override
  String get changeImage => 'Cambiar imagen';

  @override
  String get previewMessageReceived => '¡Hola!';

  @override
  String get previewMessageSent => '¡Hey!';

  @override
  String get messageAction => 'Mensaje';

  @override
  String get callAction => 'Llamada';

  @override
  String get videoAction => 'Vídeo';

  @override
  String get personalNotes => 'Notas personales';

  @override
  String get addNotes => 'Añadir notas...';

  @override
  String get noNotes => 'Sin notas';

  @override
  String get messageNotifications => 'Notificaciones de mensajes';

  @override
  String get callNotifications => 'Notificaciones de llamadas';

  @override
  String get useGradient => 'Usar degradado';

  @override
  String get gradientStart => 'Color de inicio';

  @override
  String get gradientEnd => 'Color final';

  @override
  String get preview => 'Vista previa';

  @override
  String get reset => 'Reiniciar';

  @override
  String get securityNumber => 'Número de seguridad';

  @override
  String securityNumberDescription(String name) {
    return 'Verifica que el número de seguridad coincida con el dispositivo de $name';
  }

  @override
  String get verifyEncryption => 'Verificar cifrado de extremo a extremo';

  @override
  String get tapToCopy => 'Toca para copiar';

  @override
  String get howToVerify => 'Cómo verificar';

  @override
  String get verifyStep1 => 'Reúnete con tu contacto en persona o llámalo';

  @override
  String get verifyStep2 =>
      'Compara los números de seguridad o escanea los códigos QR';

  @override
  String get verifyStep3 => 'Si coinciden, tu chat es seguro';

  @override
  String get scanToVerify => 'Escanear para verificar';

  @override
  String get reportSpam => 'Reportar como spam';

  @override
  String get reportSpamSubtitle => 'Reportar este contacto como spam';

  @override
  String get reportSpamDescription =>
      'Este contacto será reportado de forma anónima. Tu identidad no será compartida. ¿Estás seguro?';

  @override
  String get report => 'Reportar';

  @override
  String get spamReported => 'Spam reportado';

  @override
  String get reportError => 'Error al enviar el reporte. Inténtalo de nuevo.';

  @override
  String get reportRateLimited =>
      'Has alcanzado el número máximo de reportes por hoy.';

  @override
  String get blockContact => 'Bloquear contacto';

  @override
  String get blockContactDescription =>
      'Este contacto ya no podrá enviarte mensajes ni llamarte. No será notificado.';

  @override
  String get unblockContact => 'Desbloquear contacto';

  @override
  String get unblockContactDescription =>
      'Este contacto podrá volver a enviarte mensajes y llamarte.';

  @override
  String get contactBlocked => 'Contacto bloqueado';

  @override
  String get contactUnblocked => 'Contacto desbloqueado';

  @override
  String get contactIsBlocked => 'Este contacto está bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get deleteContactSubtitle => 'Eliminar este contacto y el chat';

  @override
  String get confirmWithPin => 'Confirmar con PIN';

  @override
  String get enterPinToConfirm => 'Introduce tu PIN para confirmar esta acción';

  @override
  String get profilePhoto => 'Foto de perfil';

  @override
  String get takePhoto => 'Tomar una foto';

  @override
  String get chooseFromGallery => 'Elegir de la galería';

  @override
  String get removePhoto => 'Eliminar foto';

  @override
  String get viewContactHashId => 'Ver identificador del contacto';

  @override
  String get hashIdPartiallyMasked =>
      'Parcialmente oculto por tu seguridad y la de tu contacto';

  @override
  String get addFirstContact => 'Añade tu primer contacto';

  @override
  String get addFirstContactSubtitle =>
      'Comparte tu código QR o escanea el de un amigo';

  @override
  String get directory => 'Directorio';

  @override
  String get noContacts => 'Sin contactos';

  @override
  String get noContactsSubtitle => 'Añade un contacto para empezar';

  @override
  String get sendMessageAction => 'Enviar un mensaje';

  @override
  String get audioCall => 'Llamada de audio';

  @override
  String get videoCall => 'Videollamada';

  @override
  String get viewProfile => 'Ver perfil';

  @override
  String get deleteContactDirectory => 'Eliminar contacto';

  @override
  String get scanShort => 'Escanear';

  @override
  String get addShort => 'Añadir';

  @override
  String deleteContactConfirmName(String name) {
    return '¿Seguro que quieres eliminar a $name?';
  }

  @override
  String get noNotesTitle => 'Sin notas';

  @override
  String get noNotesSubtitle => 'Crea tu primera nota';

  @override
  String get newNote => 'Nueva nota';

  @override
  String get editNote => 'Editar nota';

  @override
  String get deleteNote => 'Eliminar nota';

  @override
  String get deleteNoteConfirm =>
      '¿Estás seguro de que quieres eliminar esta nota?';

  @override
  String get noteTitle => 'Título';

  @override
  String get noteContent => 'Contenido';

  @override
  String get addItem => 'Añadir elemento';

  @override
  String get pinNote => 'Fijar';

  @override
  String get unpinNote => 'Desfijar';

  @override
  String get noteColor => 'Color';

  @override
  String get notePassword => 'Contraseña';

  @override
  String get setPassword => 'Establecer contraseña';

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get removePassword => 'Eliminar contraseña';

  @override
  String get enterPassword => 'Introduce la contraseña';

  @override
  String get confirmPassword => 'Confirma la contraseña';

  @override
  String get passwordPin => 'Código PIN';

  @override
  String get passwordText => 'Contraseña de texto';

  @override
  String get protectedNote => 'Nota protegida';

  @override
  String get incorrectPassword => 'Contraseña incorrecta';

  @override
  String get passwordSet => 'Contraseña establecida';

  @override
  String get passwordRemoved => 'Contraseña eliminada';

  @override
  String get notesBiometric => 'Face ID para notas';

  @override
  String get notesBiometricSubtitle =>
      'Requerir autenticación biométrica para abrir notas protegidas';

  @override
  String get textNote => 'Nota de texto';

  @override
  String get checklistNote => 'Lista de tareas';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tareas';
  }

  @override
  String get autoSaved => 'Guardado';

  @override
  String get searchNotes => 'Buscar nota';

  @override
  String get legalConsent => 'Consentimiento legal';

  @override
  String get confirmAge13 => 'Confirmo tener al menos 13 años';

  @override
  String get acceptLegalStart => 'Acepto la ';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get andThe => ' y los ';

  @override
  String get continueButton => 'Continuar';

  @override
  String get mustAcceptTerms =>
      'Debes aceptar ambas condiciones para continuar';

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
  String get contactSupport => 'Contactar soporte';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Reportar abuso';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Legal';

  @override
  String get legalEntity => 'Entidad legal';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fijar';

  @override
  String get unpinConversation => 'Desfijar';

  @override
  String get hideConversation => 'Quitar del hilo';

  @override
  String get deleteConversation => 'Eliminar conversación';

  @override
  String get deleteConversationConfirm =>
      'Ingresa tu PIN para confirmar la eliminación de todos los mensajes';

  @override
  String get noConversations => 'Aún no hay conversaciones';

  @override
  String get startConversation => 'Iniciar';

  @override
  String get microphonePermissionRequired => 'Se requiere acceso al micrófono';

  @override
  String get microphonePermissionExplanation =>
      'Hash necesita el micrófono para realizar llamadas.';

  @override
  String get cameraPermissionExplanation =>
      'Hash necesita la cámara para las videollamadas.';

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
  String get openSettings => 'Abrir ajustes';

  @override
  String get callConnecting => 'Conectando...';

  @override
  String get callRinging => 'Llamando...';

  @override
  String get callReconnecting => 'Reconectando...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Reconectando (${seconds}s)';
  }

  @override
  String get callPaused => 'En pausa';

  @override
  String get callPausedSubtitle => 'La llamada sigue activa';

  @override
  String get callRemoteMicMuted => 'Micrófono del contacto silenciado';

  @override
  String get callMiniControlsMute => 'Silenciar';

  @override
  String get callMiniControlsUnmute => 'Activar micrófono';

  @override
  String get callMiniControlsHangUp => 'Colgar';

  @override
  String get callMiniControlsReturn => 'Volver a la llamada';

  @override
  String get callNetworkPoor => 'Conexión inestable';

  @override
  String get callNetworkLost => 'Conexión perdida';

  @override
  String get callEndedTitle => 'Llamada finalizada';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Datos del dispositivo';

  @override
  String get deviceDataSubtitle => 'Almacenamiento local y servidor';

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
  String get localStorage => 'Almacenamiento local';

  @override
  String get onThisDevice => 'en este dispositivo';

  @override
  String get encryptedDatabases => 'Bases de datos cifradas';

  @override
  String get files => 'Archivos';

  @override
  String get secureKeychain => 'Llavero seguro';

  @override
  String get cache => 'Caché';

  @override
  String get contactsDetail => 'Nombres, avatares, claves Signal';

  @override
  String get messagesDetail => 'Conversaciones cifradas';

  @override
  String get notesDetail => 'Notas personales';

  @override
  String get signalSessions => 'Sesiones Signal';

  @override
  String get signalSessionsDetail => 'Sesiones de cifrado';

  @override
  String get pendingContacts => 'Contactos pendientes';

  @override
  String get pendingContactsDetail => 'Solicitudes en curso';

  @override
  String get callHistory => 'Llamadas';

  @override
  String get callHistoryDetail => 'Historial de llamadas';

  @override
  String get preferences => 'Preferencias';

  @override
  String get preferencesDetail => 'Preferencias de medios y llamadas';

  @override
  String get avatars => 'Avatares';

  @override
  String get media => 'Medios';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '1 archivo',
      zero: 'ningún archivo',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Activo';

  @override
  String get notDefined => 'No definido';

  @override
  String get biometrics => 'Biometría';

  @override
  String get recoveryPhrase => 'Frase de recuperación';

  @override
  String get identity => 'Identidad (Hash ID)';

  @override
  String get signalKeys => 'Claves Signal Protocol';

  @override
  String get authTokens => 'Tokens de autenticación';

  @override
  String get contactNamesCache => 'Caché de nombres';

  @override
  String get remoteConfig => 'Config remota';

  @override
  String get notificationPrefs => 'Preferencias de notificaciones';

  @override
  String get serverData => 'Datos en el servidor';

  @override
  String get serverDataInfo =>
      'Hash conserva un mínimo de datos en el servidor, todos cifrados o temporales.';

  @override
  String get serverProfile => 'Perfil';

  @override
  String get serverProfileDetail => 'Hash ID, claves públicas, token de buzón';

  @override
  String get serverPrekeys => 'Pre-claves';

  @override
  String get serverPrekeysDetail => 'Claves Signal de un solo uso (consumidas)';

  @override
  String get serverMessages => 'Mensajes en tránsito';

  @override
  String get serverMessagesDetail => 'Eliminados tras la recepción (24h máx.)';

  @override
  String get serverMedia => 'Medios en tránsito';

  @override
  String get serverMediaDetail => 'Eliminados tras la descarga';

  @override
  String get serverContactRequests => 'Solicitudes de contacto';

  @override
  String get serverContactRequestsDetail => 'Expiran tras 24h';

  @override
  String get serverRateLimits => 'Límites de frecuencia';

  @override
  String get serverRateLimitsDetail => 'Datos temporales anti-abuso';

  @override
  String get privacyReassurance =>
      'Hash no puede leer tus mensajes. Todos los datos están cifrados de extremo a extremo. Los datos del servidor se eliminan automáticamente.';

  @override
  String get pinTooSimple =>
      'Este PIN es demasiado simple. Elige un código más seguro.';

  @override
  String get genericError => 'Ha ocurrido un error. Inténtalo de nuevo.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'No se pudo crear la cuenta: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frase copiada al portapapeles';

  @override
  String get copyPhrase => 'Copiar frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Anota esta frase en un lugar seguro. Si pierdes tu PIN sin esta frase, perderás permanentemente el acceso a tus datos.';

  @override
  String get noMessages => 'Sin mensajes';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '¿Eliminar todos los mensajes con $name?';
  }

  @override
  String get confirmation => 'Confirmación';

  @override
  String get untitled => 'Sin título';

  @override
  String get noSessions => 'Sin sesiones';

  @override
  String get unknownContact => 'Contacto desconocido';

  @override
  String get unnamed => 'Sin nombre';

  @override
  String get noPendingRequestsAlt => 'Sin solicitudes pendientes';

  @override
  String get deleteAllCallHistory => '¿Eliminar todo el historial de llamadas?';

  @override
  String get noCalls => 'Sin llamadas';

  @override
  String get noPreferences => 'Sin preferencias';

  @override
  String get resetAllMediaPrefs =>
      '¿Reiniciar todas las preferencias de medios?';

  @override
  String get deleteThisAvatar => '¿Eliminar este avatar?';

  @override
  String get deleteAllAvatars => '¿Eliminar todos los avatares?';

  @override
  String get noAvatars => 'Sin avatares';

  @override
  String get deleteThisFile => '¿Eliminar este archivo?';

  @override
  String get deleteAllMediaFiles => '¿Eliminar todos los medios?';

  @override
  String get noMediaFiles => 'Sin medios';

  @override
  String get outgoing => 'Saliente';

  @override
  String get incoming => 'Entrante';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Vista efímera: ${seconds}s';
  }

  @override
  String get normalView => 'Vista normal';

  @override
  String get callReasonCompleted => 'Completada';

  @override
  String get callReasonMissed => 'Perdida';

  @override
  String get callReasonDeclined => 'Rechazada';

  @override
  String get callReasonFailed => 'Fallida';

  @override
  String get justNow => 'Ahora mismo';

  @override
  String timeAgoMinutes(int count) {
    return 'Hace $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Hace ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Hace ${count}d';
  }

  @override
  String get messageTypeContact => 'Contacto';

  @override
  String get messageTypeLocation => 'Ubicación';

  @override
  String get statusQueued => 'En cola';

  @override
  String get blockedBadge => 'Bloqueado';

  @override
  String get protectedBadge => 'Protegida';

  @override
  String messageCount(int count) {
    return '$count mensaje(s)';
  }

  @override
  String get deleteQuestion => '¿Eliminar?';

  @override
  String get transferMyAccountTitle => 'Transferir mi cuenta';

  @override
  String get loadingError => 'Error de carga';

  @override
  String get transferToNewDevice => 'Transferir a un nuevo dispositivo';

  @override
  String get transferInstructions =>
      'En tu nuevo dispositivo, elige \"Recuperar mi cuenta\" e introduce esta información:';

  @override
  String get yourHashIdLabel => 'Tu Hash ID';

  @override
  String get enterYourPinCode => 'Introduce tu código PIN';

  @override
  String get pinOwnerConfirmation =>
      'Para confirmar que eres el propietario de esta cuenta';

  @override
  String get scanThisQrCode => 'Escanea este código QR';

  @override
  String get withYourNewDevice => 'Con tu nuevo dispositivo';

  @override
  String get orEnterTheCode => 'o introduce el código';

  @override
  String get transferCodeLabel => 'Código de transferencia';

  @override
  String get proximityVerification => 'Verificación de proximidad';

  @override
  String get bringDevicesCloser => 'Acerca ambos dispositivos';

  @override
  String get confirmTransferQuestion => '¿Confirmar la transferencia?';

  @override
  String get accountWillBeTransferred =>
      'Tu cuenta será transferida al nuevo dispositivo.\n\nEste dispositivo será desconectado permanentemente.';

  @override
  String get transferComplete => 'Transferencia completada';

  @override
  String get transferSuccessMessage =>
      'Tu cuenta ha sido transferida correctamente.\n\nEsta aplicación se cerrará ahora.';

  @override
  String get manualVerification => 'Verificación manual';

  @override
  String get codeDisplayedOnBothDevices =>
      'Código mostrado en ambos dispositivos:';

  @override
  String get doesCodeMatchNewDevice =>
      '¿Este código coincide con el del nuevo dispositivo?';

  @override
  String get verifiedStatus => 'Verificado';

  @override
  String get inProgressStatus => 'En progreso...';

  @override
  String get notAvailableStatus => 'No disponible';

  @override
  String get codeExpiredRestart =>
      'El código ha expirado. Por favor, reinicia.';

  @override
  String get codesDoNotMatchCancelled =>
      'Los códigos no coinciden. Transferencia cancelada.';

  @override
  String transferToDevice(String device) {
    return 'A: $device';
  }

  @override
  String get copiedExclamation => '¡Copiado!';

  @override
  String expiresInTime(String time) {
    return 'Expira en $time';
  }

  @override
  String get biometricNotAvailable =>
      'La biometría no está disponible en este dispositivo';

  @override
  String get biometricAuthError => 'Error durante la autenticación biométrica';

  @override
  String get authenticateForBiometric =>
      'Autentícate para activar la biometría';

  @override
  String get biometricAuthFailed => 'La autenticación biométrica falló';

  @override
  String get forceUpdateTitle => 'Actualización requerida';

  @override
  String get forceUpdateMessage =>
      'Una nueva versión de Hash está disponible. Por favor actualiza para continuar.';

  @override
  String get updateButton => 'Actualizar';

  @override
  String get maintenanceInProgress => 'Mantenimiento en curso';

  @override
  String get tryAgainLater => 'Inténtalo más tarde';

  @override
  String get information => 'Información';

  @override
  String get later => 'Más tarde';

  @override
  String get doYouLikeHash => '¿Te gusta Hash?';

  @override
  String get yourFeedbackHelps => 'Tu opinión nos ayuda a mejorar la app';

  @override
  String get ratingTerrible => 'Terrible';

  @override
  String get ratingBad => 'Malo';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Bueno';

  @override
  String get ratingExcellent => '¡Excelente!';

  @override
  String get donationMessage =>
      'Hash es un proyecto sin ánimo de lucro. Tu apoyo nos ayuda a seguir construyendo un mensajero verdaderamente privado.';

  @override
  String get recentConnections => 'Conexiones recientes';

  @override
  String get loginInfoText =>
      'Cada desbloqueo con PIN se registra localmente. Solo se conservan las últimas 24 horas.';

  @override
  String get connectionCount => 'Conexión(es)';

  @override
  String get periodLabel => 'Periodo';

  @override
  String get historyLabel => 'Historial';

  @override
  String get noLoginRecorded => 'Ningún inicio de sesión registrado';

  @override
  String get nextUnlocksAppearHere =>
      'Los próximos desbloqueos aparecerán aquí.';

  @override
  String get dataLocalOnly =>
      'Estos datos se almacenan solo en tu dispositivo y nunca se transmiten.';

  @override
  String get currentSession => 'Actual';

  @override
  String get todayLabel => 'Hoy';

  @override
  String get yesterdayLabel => 'Ayer';

  @override
  String get justNowLabel => 'Ahora mismo';

  @override
  String minutesAgoLabel(int count) {
    return 'Hace $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Hace ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Hace ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'No hay mantenimiento planificado';

  @override
  String get everythingWorkingNormally => 'Todo funciona con normalidad';

  @override
  String get maintenanceTitle => 'Mantenimiento';

  @override
  String get maintenanceActiveLabel => 'EN CURSO';

  @override
  String get maintenancePlannedLabel => 'PLANIFICADO';

  @override
  String get locking => 'Bloqueando...';

  @override
  String get newMessageNotification => 'Nuevo mensaje';

  @override
  String get secExplainTitle => 'Cómo Hash te protege';

  @override
  String get secExplainIntro =>
      'Hash está diseñado para que nadie pueda leer tus mensajes.';

  @override
  String get secExplainIntroSub =>
      'Ni siquiera nosotros.\nAquí te explicamos cómo funciona, de forma sencilla.';

  @override
  String get secJourneyLabel => 'EL RECORRIDO';

  @override
  String get secJourneyTitle => 'El recorrido de tu mensaje';

  @override
  String get secJourneySubtitle =>
      'Desde tu dedo hasta la pantalla de tu contacto, cada paso está protegido. Sigue el camino.';

  @override
  String get secStep1Title => 'Escribes tu mensaje';

  @override
  String get secStep1Desc =>
      'Escribes \"¡Hola!\" en la app. En este momento, el mensaje solo existe en la memoria de tu teléfono. No se ha enviado nada.';

  @override
  String get secStep2Title => 'Cifrado con Signal Protocol';

  @override
  String get secStep2Desc =>
      'En cuanto pulsas \"Enviar\", tu mensaje se transforma en una cadena de caracteres incomprensibles. Es como si tu mensaje estuviera encerrado en una caja fuerte cuya llave solo tiene tu contacto.';

  @override
  String get secStep3Title => 'Sealed Sender: el sobre invisible';

  @override
  String get secStep3Desc =>
      'Imagina enviar una carta por correo, pero sin dirección de remitente en el sobre. Eso es exactamente lo que hace Hash. El mensaje se deposita en un buzón anónimo. El servidor no sabe quién lo envió.';

  @override
  String get secStep4Title => 'El servidor no ve nada';

  @override
  String get secStep4Desc =>
      'El servidor actúa como un cartero ciego. Solo sabe que \"alguien dejó algo en el buzón #A7X9\". No sabe quién lo envió, qué es, ni para quién es.';

  @override
  String get secStep4Highlight =>
      'Sin metadatos almacenados: ni dirección IP, ni marca de tiempo, ni vínculo entre remitente y destinatario.';

  @override
  String get secStep5Title => 'Tu contacto recibe el mensaje';

  @override
  String get secStep5Desc =>
      'El teléfono de tu contacto recupera el contenido de su buzón anónimo y descifra el mensaje con su clave privada, que nunca ha salido de su dispositivo. \"¡Hola!\" aparece en su pantalla.';

  @override
  String get secStep6Title => 'El mensaje desaparece del servidor';

  @override
  String get secStep6Desc =>
      'En cuanto tu contacto confirma la recepción, el servidor elimina permanentemente el mensaje. Sin papelera, sin archivo, sin copia de seguridad. Incluso los mensajes no leídos se destruyen automáticamente después de 24 horas.';

  @override
  String get secStep7Title => 'Expiración local';

  @override
  String get secStep7Desc =>
      'En el teléfono de tu contacto, el mensaje se autodestruye según la duración que elegiste: inmediatamente después de leer, 5 minutos, 1 hora... tú decides.';

  @override
  String get secJourneyConclusion =>
      'Resultado: cero rastro en el servidor, cero rastro en los dispositivos. El mensaje solo existió el tiempo necesario para ser leído, luego desapareció.';

  @override
  String get secArchLabel => 'ARQUITECTURA';

  @override
  String get secArchTitle => '5 capas de protección';

  @override
  String get secArchSubtitle =>
      'Hash no depende de una sola tecnología. Cada capa refuerza las demás. Incluso si una capa se ve comprometida, tus datos permanecen seguros.';

  @override
  String get secLayer1Title => 'Cifrado de extremo a extremo';

  @override
  String get secLayer1Desc =>
      'Cada mensaje se cifra con una clave única. En términos simples: incluso si alguien descifra un mensaje, no podrá descifrar el siguiente. Cada mensaje tiene su propia cerradura.';

  @override
  String get secLayer1Detail =>
      'Para archivos (fotos, vídeos, documentos), Hash utiliza cifrado adicional AES-256-GCM. El archivo se cifra antes de salir de tu teléfono.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimato en red)';

  @override
  String get secLayer2Desc =>
      'Los mensajeros normales envían tus mensajes con tu identidad adjunta. Es como escribir tu nombre en el sobre. Hash usa buzones anónimos: el servidor entrega el mensaje sin saber quién lo envió.';

  @override
  String get secLayer2Detail =>
      'Resultado: incluso en caso de filtración de datos del servidor, es imposible reconstruir quién habla con quién.';

  @override
  String get secLayer3Title => 'Eliminación automática';

  @override
  String get secLayer3Desc =>
      'Los mensajes se eliminan del servidor en cuanto se confirma la recepción. Incluso si un mensaje nunca se recupera, se destruye automáticamente después de 24 horas.';

  @override
  String get secLayer3Detail =>
      'En tu teléfono, los mensajes se autodestruyen según la duración que elijas: inmediatamente, 5 min, 15 min, 30 min, 1h, 3h, 6h o 12h.';

  @override
  String get secLayer4Title => 'Protección de acceso local';

  @override
  String get secLayer4Desc =>
      'La app está protegida por un PIN de 6 dígitos y/o biometría (Face ID, huella). Después de demasiados intentos fallidos, la app se bloquea con un retraso creciente tras cada fallo.';

  @override
  String get secLayer5Title => 'Base de datos bloqueada';

  @override
  String get secLayer5Desc =>
      'En el servidor, ningún usuario puede escribir directamente en la base de datos. Todas las acciones pasan por funciones seguras que verifican cada solicitud.';

  @override
  String get secLayer5Detail =>
      'Es como un mostrador de banco: nunca tocas la cámara acorazada tú mismo. Haces una solicitud, y el sistema comprueba que tienes el derecho antes de actuar.';

  @override
  String get secVashLabel => 'ÚNICO EN EL MUNDO';

  @override
  String get secVashTitle => 'Modo Vash';

  @override
  String get secVashSubtitle =>
      'Un sistema de seguridad de emergencia que no existe en ninguna otra app de mensajería.';

  @override
  String get secVashScenarioTitle => 'Imagina esta situación';

  @override
  String get secVashScenario1 => 'Alguien accede a tu teléfono';

  @override
  String get secVashScenario2 => 'Te piden tu código PIN';

  @override
  String get secVashScenario3 => 'Quieres borrar todos tus datos urgentemente';

  @override
  String get secVashSolutionTitle => 'La solución: dos códigos PIN';

  @override
  String get secVashSolutionDesc =>
      'Configuras dos códigos PIN diferentes en Hash:';

  @override
  String get secVashNormalCodeLabel => 'Código normal';

  @override
  String get secVashNormalCodeDesc =>
      'Abre la app normalmente con todos tus datos';

  @override
  String get secVashCodeLabel2 => 'Código Vash';

  @override
  String get secVashCodeDescription =>
      'Abre la app normalmente... pero todos tus datos se eliminan silenciosamente en segundo plano';

  @override
  String get secVashWhatHappensTitle => 'Lo que ocurre después';

  @override
  String get secVashWhatHappensDesc =>
      'La app se abre normalmente. Sin alerta, sin animación sospechosa. La pantalla simplemente muestra una app vacía, como si acabaras de instalarla.\n\nEn realidad, todas tus conversaciones, contactos y mensajes han sido eliminados irreversiblemente en una fracción de segundo.';

  @override
  String get secCallsLabel => 'LLAMADAS Y ARCHIVOS';

  @override
  String get secCallsTitle => 'Todo está cifrado';

  @override
  String get secCallsSubtitle =>
      'No son solo los mensajes. Absolutamente todo lo que pasa por Hash está cifrado de extremo a extremo.';

  @override
  String get secAudioCallTitle => 'Llamadas de audio';

  @override
  String get secAudioCallDesc =>
      'Cifradas de extremo a extremo vía WebRTC. La voz se transmite directamente entre dispositivos.';

  @override
  String get secVideoCallTitle => 'Videollamadas';

  @override
  String get secVideoCallDesc =>
      'Misma tecnología, cada flujo cifrado individualmente.';

  @override
  String get secPhotosTitle => 'Fotos y vídeos';

  @override
  String get secPhotosDesc =>
      'Cifrados en AES-256-GCM antes de salir de tu teléfono.';

  @override
  String get secDocsTitle => 'Documentos';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, cualquier archivo. Nombre, tamaño y contenido cifrados.';

  @override
  String get secAnonLabel => 'ANONIMATO';

  @override
  String get secAnonTitle => 'Sin identidad requerida';

  @override
  String get secAnonSubtitle =>
      'Hash nunca pide tu número de teléfono ni tu email. Te identificas mediante un Hash ID único y anónimo.';

  @override
  String get secHashIdTitle => 'Tu Hash ID';

  @override
  String get secHashIdDesc =>
      'Es tu identificador único. No revela nada sobre ti: ni tu nombre, ni tu número, ni tu ubicación. Es como un seudónimo imposible de vincular a tu identidad real.\n\nPara añadir un contacto, compartes tu Hash ID o escaneas un código QR. Eso es todo. Sin agenda sincronizada, sin sugerencias de \"Personas que quizás conozcas\".';

  @override
  String get secDataLabel => 'DATOS';

  @override
  String get secDataTitle => 'Lo que Hash no sabe';

  @override
  String get secDataSubtitle =>
      'La mejor manera de proteger tus datos es no recopilarlos.';

  @override
  String get secNeverCollected => 'Nunca recopilado';

  @override
  String get secNeverItem1 => 'Contenido de los mensajes';

  @override
  String get secNeverItem2 => 'Lista de contactos';

  @override
  String get secNeverItem3 => 'Número de teléfono';

  @override
  String get secNeverItem4 => 'Dirección de email';

  @override
  String get secNeverItem5 => 'Dirección IP';

  @override
  String get secNeverItem6 => 'Ubicación';

  @override
  String get secNeverItem7 => 'Metadatos (quién habla con quién)';

  @override
  String get secNeverItem8 => 'Historial de llamadas';

  @override
  String get secNeverItem9 => 'Agenda de contactos';

  @override
  String get secNeverItem10 => 'Identificadores publicitarios';

  @override
  String get secTempStored => 'Almacenado temporalmente';

  @override
  String get secTempItem1 => 'Hash ID anónimo (identificador único)';

  @override
  String get secTempItem2 => 'Claves públicas de cifrado';

  @override
  String get secTempItem3 => 'Mensajes cifrados en tránsito (máx. 24h)';

  @override
  String get secTempNote =>
      'Incluso estos datos mínimos no pueden identificarte. Tu Hash ID no está vinculado a ninguna información personal.';

  @override
  String get secFooterTitle => 'Tu privacidad, tu libertad';

  @override
  String get secFooterDesc =>
      'Hash utiliza las mismas tecnologías de cifrado que las aplicaciones profesionales más exigentes. Tus mensajes están protegidos por las matemáticas, no por promesas.';

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
