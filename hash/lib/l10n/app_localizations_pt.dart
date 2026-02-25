// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero Rastro. Zero Compromisso.';

  @override
  String get conversations => 'Chats';

  @override
  String get noConversation => 'Nenhum chat';

  @override
  String get noConversationSubtitle =>
      'Adicione um contato para começar a conversar com segurança';

  @override
  String get addContact => 'Adicionar contato';

  @override
  String get shareApp => 'Compartilhar app';

  @override
  String get newMessage => 'Nova mensagem';

  @override
  String get newConversation => 'Novo chat';

  @override
  String get settings => 'Configurações';

  @override
  String get myHashId => 'Meu Hash ID';

  @override
  String get supportHash => 'Apoiar Hash';

  @override
  String get supportHashSubtitle => 'Hash é um projeto sem fins lucrativos';

  @override
  String get donate => 'Doar';

  @override
  String get appearance => 'Aparência';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automático';

  @override
  String get themeAutoSubtitle => 'Segue as configurações do sistema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeRecommendation =>
      'O tema escuro é recomendado para maior privacidade';

  @override
  String get language => 'Idioma';

  @override
  String get notifications => 'Notificações';

  @override
  String get messages => 'Mensagens';

  @override
  String get calls => 'Chamadas';

  @override
  String get security => 'Segurança';

  @override
  String get accountSecurity => 'Segurança da conta';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, código armadilha';

  @override
  String get blockScreenshots => 'Bloquear capturas de tela';

  @override
  String get transferDevice => 'Transferir para outro dispositivo';

  @override
  String get transferDeviceSubtitle => 'Migrar sua conta';

  @override
  String get pinCode => 'Código PIN';

  @override
  String get changePin => 'Alterar código PIN';

  @override
  String get currentPin => 'Código PIN atual';

  @override
  String get newPin => 'Novo código PIN';

  @override
  String get confirmPin => 'Confirmar código PIN';

  @override
  String get pinChanged => 'Código PIN alterado';

  @override
  String get incorrectPin => 'PIN incorreto';

  @override
  String get pinsDoNotMatch => 'Os códigos não coincidem';

  @override
  String get autoLock => 'Bloqueio automático';

  @override
  String get autoLockDelay => 'Tempo de bloqueio';

  @override
  String get autoLockDisabled => 'Desativado';

  @override
  String get autoLockMinute => '1 minuto';

  @override
  String autoLockMinutes(int count) {
    return '$count minutos';
  }

  @override
  String get destructionCode => 'Código de destruição';

  @override
  String get destructionCodeInfo =>
      'Se você inserir este código em vez do seu PIN:';

  @override
  String get destructionDeleteMessages =>
      'Todas as suas mensagens serão excluídas';

  @override
  String get destructionDeleteContacts =>
      'Todos os seus contatos serão excluídos';

  @override
  String get destructionDeleteHistory =>
      'Seu histórico de chamadas será apagado';

  @override
  String get destructionKeepId =>
      'Sua identidade Hash (#XXX-XXX-XXX) permanece a mesma';

  @override
  String get destructionAppearNormal =>
      'O app aparecerá normal, mas vazio. Esta ação é irreversível.';

  @override
  String get setupDestructionCode => 'Configurar código de destruição';

  @override
  String get modifyDestructionCode => 'Modificar código de destruição';

  @override
  String get currentDestructionCode => 'Código de destruição atual';

  @override
  String get newDestructionCode => 'Novo código de destruição';

  @override
  String get confirmDestructionCode => 'Confirmar código';

  @override
  String get destructionCodeConfigured => 'Código de destruição configurado';

  @override
  String get destructionCodeModified => 'Código de destruição modificado';

  @override
  String get destructionCodeMustDiffer =>
      'O código de destruição deve ser diferente do PIN';

  @override
  String get incorrectDestructionCode => 'Código de destruição incorreto';

  @override
  String get danger => 'Perigo';

  @override
  String get panicButton => 'Botão de pânico';

  @override
  String get panicButtonSubtitle => 'Excluir todos os dados';

  @override
  String get deleteAccount => 'Excluir minha conta';

  @override
  String get deleteAccountSubtitle => 'Ação irreversível';

  @override
  String get deleteAccountConfirmTitle => 'Excluir minha conta';

  @override
  String get deleteAccountConfirmMessage =>
      'Sua conta será excluída permanentemente. Esta ação é irreversível.\n\n• Todos os seus chats\n• Todos os seus contatos\n• Seu Hash ID\n\nVocê precisará criar uma nova conta.';

  @override
  String get deleteForever => 'Excluir permanentemente';

  @override
  String get cancel => 'Cancelar';

  @override
  String get panicConfirmTitle => 'Botão de Pânico';

  @override
  String get panicConfirmMessage =>
      'Esta ação excluirá TODOS os seus dados permanentemente:\n\n• Todas as suas mensagens\n• Todos os seus contatos\n• Sua conta\n\nVocê tem certeza absoluta?';

  @override
  String get deleteAll => 'EXCLUIR TUDO';

  @override
  String get dataDeletedForSecurity => 'Dados excluídos por segurança.';

  @override
  String deletionError(String error) {
    return 'Erro ao excluir: $error';
  }

  @override
  String get yourSecurity => 'Sua segurança';

  @override
  String get securityInfo =>
      '• Criptografia de ponta a ponta (Protocolo Signal)\n• Nenhum dado em nossos servidores após entrega\n• Chaves armazenadas apenas no seu dispositivo\n• Código PIN nunca enviado ao servidor';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Bem-vindo';

  @override
  String get securityStatement1 => 'Suas mensagens estão protegidas.';

  @override
  String get securityStatement2 => 'Criptografia de ponta a ponta.';

  @override
  String get securityStatement3 => 'Sem rastro. Sem compromisso.';

  @override
  String get securityStatement4 => 'Sua privacidade é um direito.';

  @override
  String get accessBlocked => 'Acesso bloqueado';

  @override
  String get tooManyAttempts => 'Muitas tentativas';

  @override
  String get pleaseWait => 'Por favor aguarde';

  @override
  String get waitDelay => 'Por favor aguarde o tempo terminar';

  @override
  String attemptCount(int current, int max) {
    return 'Tentativa $current de $max';
  }

  @override
  String retryIn(String time) {
    return 'Tentar novamente em $time';
  }

  @override
  String get forgotPin => 'Esqueceu o PIN? Use a frase de recuperação';

  @override
  String get useRecoveryPhrase => 'Usar frase de recuperação';

  @override
  String get recoveryWarningTitle => 'Atenção';

  @override
  String get recoveryWarningMessage => 'A recuperação da conta irá:';

  @override
  String get recoveryDeleteAllMessages => 'Excluir TODAS as suas mensagens';

  @override
  String get recoveryWaitDelay => 'Exigir um tempo de espera de 1 hora';

  @override
  String get recoveryKeepContacts => 'Manter seus contatos';

  @override
  String get recoveryIrreversible =>
      'Esta ação é irreversível. Suas mensagens serão perdidas permanentemente.';

  @override
  String get iUnderstand => 'Eu entendo';

  @override
  String get accountRecovery => 'Recuperação de conta';

  @override
  String get enterRecoveryPhrase =>
      'Digite as 24 palavras da sua frase de recuperação, separadas por espaços.';

  @override
  String get recoveryPhraseHint => 'palavra1 palavra2 palavra3 ...';

  @override
  String get recover => 'Recuperar';

  @override
  String get recoveryPhraseRequired =>
      'Por favor digite sua frase de recuperação';

  @override
  String get recoveryPhrase24Words =>
      'A frase deve conter exatamente 24 palavras';

  @override
  String get incorrectRecoveryPhrase => 'Frase de recuperação incorreta';

  @override
  String get recoveryInitError => 'Erro ao iniciar recuperação';

  @override
  String get securityDelay => 'Tempo de segurança';

  @override
  String get securityDelayMessage =>
      'Para sua segurança, é necessário um tempo de espera antes de poder criar um novo PIN.';

  @override
  String get timeRemaining => 'Tempo restante';

  @override
  String get messagesDeletedForProtection =>
      'Suas mensagens foram excluídas para sua proteção.';

  @override
  String get canCloseApp => 'Você pode fechar o app e voltar mais tarde.';

  @override
  String get onboardingTitle1 => 'Bem-vindo ao Hash';

  @override
  String get onboardingSubtitle1 => 'O mensageiro que não deixa rastros';

  @override
  String get onboardingTitle2 => 'Criptografia total';

  @override
  String get onboardingSubtitle2 =>
      'Suas mensagens são criptografadas de ponta a ponta com o protocolo Signal';

  @override
  String get onboardingTitle3 => 'Sem rastros';

  @override
  String get onboardingSubtitle3 =>
      'As mensagens são excluídas dos servidores após a entrega';

  @override
  String get onboardingTitle4 => 'Sua segurança';

  @override
  String get onboardingSubtitle4 =>
      'Código PIN, modo pânico e frase de recuperação';

  @override
  String get getStarted => 'Começar';

  @override
  String get next => 'Próximo';

  @override
  String get skip => 'Pular';

  @override
  String get alreadyHaveAccount => 'Já tenho uma conta';

  @override
  String get createPin => 'Criar um código PIN';

  @override
  String get createPinSubtitle => 'Este código protegerá o acesso ao seu app';

  @override
  String get confirmYourPin => 'Confirme seu código PIN';

  @override
  String get confirmPinSubtitle => 'Digite seu código PIN novamente';

  @override
  String get saveRecoveryPhrase => 'Frase de recuperação';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Anote estas 24 palavras em ordem. Elas permitirão que você recupere sua conta se esquecer seu PIN.';

  @override
  String get phraseWritten => 'Anotei minha frase';

  @override
  String get warningRecoveryPhrase =>
      'Se você perder esta frase e esquecer seu PIN, perderá o acesso à sua conta.';

  @override
  String get accountTransferred => 'Conta transferida';

  @override
  String get accountTransferredMessage =>
      'Sua conta foi transferida para outro dispositivo. Esta sessão não é mais válida.';

  @override
  String get accountTransferredInfo =>
      'Se você não iniciou esta transferência, sua conta pode ter sido comprometida.';

  @override
  String get logout => 'Sair';

  @override
  String get transferAccount => 'Transferir conta';

  @override
  String get transferAccountInfo =>
      'Transfira sua conta Hash para um novo dispositivo. Sua sessão atual será invalidada.';

  @override
  String get generateTransferCode => 'Gerar código de transferência';

  @override
  String get transferCode => 'Código de transferência';

  @override
  String transferCodeExpires(int minutes) {
    return 'Este código expira em $minutes minutos';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Digite este código no seu novo dispositivo para transferir sua conta.';

  @override
  String get generateNewCode => 'Gerar novo código';

  @override
  String get scanQrCode => 'Escanear código QR';

  @override
  String get scanQrCodeSubtitle =>
      'Escaneie o código QR de um contato para adicioná-lo';

  @override
  String get qrCodeDetected => 'Código QR detectado';

  @override
  String get invalidQrCode => 'Código QR inválido';

  @override
  String get cameraPermissionRequired => 'Permissão de câmera necessária';

  @override
  String get myQrCode => 'Meu código QR';

  @override
  String get myQrCodeSubtitle =>
      'Compartilhe este código QR para que seus contatos possam adicioná-lo';

  @override
  String get shareQrCode => 'Compartilhar';

  @override
  String get addContactTitle => 'Adicionar contato';

  @override
  String get addContactByHashId => 'Digite o Hash ID do seu contato';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Buscar';

  @override
  String get contactNotFound => 'Contato não encontrado';

  @override
  String get contactAlreadyAdded => 'Este contato já está na sua lista';

  @override
  String get contactAdded => 'Contato adicionado';

  @override
  String get contactDetails => 'Detalhes do contato';

  @override
  String get contactName => 'Nome do contato';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String get deleteContact => 'Excluir contato';

  @override
  String get deleteContactConfirm => 'Excluir este contato?';

  @override
  String get deleteContactMessage => 'Isso também excluirá todo o chat.';

  @override
  String get delete => 'Excluir';

  @override
  String get typeMessage => 'Digite uma mensagem...';

  @override
  String get messageSent => 'Enviada';

  @override
  String get messageDelivered => 'Entregue';

  @override
  String get messageRead => 'Lida';

  @override
  String get messageFailed => 'Falha ao enviar';

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
  String get shareMessage =>
      'Junte-se a mim no Hash! 🔒\n\nÉ um mensageiro verdadeiramente privado: criptografia total, sem rastros nos servidores e modo pânico se necessário.\n\nBaixe o app aqui 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Erro';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get save => 'Salvar';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Fechar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get loading => 'Carregando...';

  @override
  String get retry => 'Tentar novamente';
}
