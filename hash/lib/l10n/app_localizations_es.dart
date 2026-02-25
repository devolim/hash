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
  String get conversations => 'Chats';

  @override
  String get noConversation => 'Sin chats';

  @override
  String get noConversationSubtitle =>
      'Añade un contacto para empezar a chatear de forma segura';

  @override
  String get addContact => 'Añadir contacto';

  @override
  String get shareApp => 'Compartir app';

  @override
  String get newMessage => 'Nuevo mensaje';

  @override
  String get newConversation => 'Nuevo chat';

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
  String get notifications => 'Notificaciones';

  @override
  String get messages => 'Mensajes';

  @override
  String get calls => 'Llamadas';

  @override
  String get security => 'Seguridad';

  @override
  String get accountSecurity => 'Seguridad de la cuenta';

  @override
  String get accountSecuritySubtitle => 'PIN, biometría, código trampa';

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
  String get autoLockDisabled => 'Desactivado';

  @override
  String get autoLockMinute => '1 minuto';

  @override
  String autoLockMinutes(int count) {
    return '$count minutos';
  }

  @override
  String get destructionCode => 'Código de destrucción';

  @override
  String get destructionCodeInfo =>
      'Si introduces este código en lugar de tu PIN:';

  @override
  String get destructionDeleteMessages => 'Todos tus mensajes serán eliminados';

  @override
  String get destructionDeleteContacts =>
      'Todos tus contactos serán eliminados';

  @override
  String get destructionDeleteHistory =>
      'Tu historial de llamadas será borrado';

  @override
  String get destructionKeepId =>
      'Tu identidad Hash (#XXX-XXX-XXX) permanece igual';

  @override
  String get destructionAppearNormal =>
      'La app aparecerá normal pero vacía. Esta acción es irreversible.';

  @override
  String get setupDestructionCode => 'Configurar código de destrucción';

  @override
  String get modifyDestructionCode => 'Modificar código de destrucción';

  @override
  String get currentDestructionCode => 'Código de destrucción actual';

  @override
  String get newDestructionCode => 'Nuevo código de destrucción';

  @override
  String get confirmDestructionCode => 'Confirmar código';

  @override
  String get destructionCodeConfigured => 'Código de destrucción configurado';

  @override
  String get destructionCodeModified => 'Código de destrucción modificado';

  @override
  String get destructionCodeMustDiffer =>
      'El código de destrucción debe ser diferente del PIN';

  @override
  String get incorrectDestructionCode => 'Código de destrucción incorrecto';

  @override
  String get danger => 'Peligro';

  @override
  String get panicButton => 'Botón de pánico';

  @override
  String get panicButtonSubtitle => 'Eliminar todos los datos';

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
  String get panicConfirmTitle => 'Botón de Pánico';

  @override
  String get panicConfirmMessage =>
      'Esta acción eliminará TODOS tus datos de forma permanente:\n\n• Todos tus mensajes\n• Todos tus contactos\n• Tu cuenta\n\n¿Estás absolutamente seguro?';

  @override
  String get deleteAll => 'ELIMINAR TODO';

  @override
  String get dataDeletedForSecurity => 'Datos eliminados por seguridad.';

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
  String get tooManyAttempts => 'Demasiados intentos';

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
      'Código PIN, modo pánico y frase de recuperación';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get next => 'Siguiente';

  @override
  String get skip => 'Omitir';

  @override
  String get alreadyHaveAccount => 'Ya tengo una cuenta';

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
  String get contactDetails => 'Detalles del contacto';

  @override
  String get contactName => 'Nombre del contacto';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String get deleteContact => 'Eliminar contacto';

  @override
  String get deleteContactConfirm => '¿Eliminar este contacto?';

  @override
  String get deleteContactMessage =>
      'Esto también eliminará todo el chat.';

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
  String get shareMessage =>
      '¡Únete a mí en Hash! 🔒\n\nEs un mensajero verdaderamente privado: cifrado total, sin rastro en servidores, y modo pánico si lo necesitas.\n\nDescarga la app aquí 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Error';

  @override
  String get ok => 'OK';

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
}
