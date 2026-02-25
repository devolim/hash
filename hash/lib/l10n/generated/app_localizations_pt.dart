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
  String get contacts => 'Contatos';

  @override
  String get noConversation => 'Nenhum chat';

  @override
  String get noConversationSubtitle =>
      'Adicione um contato para comecar a conversar com seguranca';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitacoes recebidas',
      one: '1 solicitacao recebida',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitacoes enviadas pendentes',
      one: '1 solicitacao enviada pendente',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Adicionar contato';

  @override
  String get shareApp => 'Compartilhar app';

  @override
  String get newMessage => 'Nova mensagem';

  @override
  String get newConversation => 'Enviar uma mensagem';

  @override
  String get settings => 'Configuracoes';

  @override
  String get myHashId => 'Meu Hash ID';

  @override
  String get supportHash => 'Apoiar Hash';

  @override
  String get supportHashSubtitle => 'Hash e um projeto sem fins lucrativos';

  @override
  String get donate => 'Doar';

  @override
  String get appearance => 'Aparencia';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatico';

  @override
  String get themeAutoSubtitle => 'Segue as configuracoes do sistema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeRecommendation =>
      'O tema escuro e recomendado para maior privacidade';

  @override
  String get language => 'Idioma';

  @override
  String get languageAuto => 'Automatico (sistema)';

  @override
  String get notifications => 'Notificacoes';

  @override
  String get messages => 'Mensagens';

  @override
  String get calls => 'Chamadas';

  @override
  String get vibration => 'Vibracao';

  @override
  String get notificationContent => 'Conteudo das notificacoes';

  @override
  String get notificationContentFull => 'Mostrar tudo';

  @override
  String get notificationContentFullDesc =>
      'Nome do contato e previa da mensagem';

  @override
  String get notificationContentName => 'Apenas nome';

  @override
  String get notificationContentNameDesc => 'Mostra apenas o nome do contato';

  @override
  String get notificationContentDiscrete => 'Discreto';

  @override
  String get notificationContentDiscreteDesc =>
      'Mostra apenas \"Nova mensagem\"';

  @override
  String get security => 'Seguranca';

  @override
  String get howHashProtectsYou => 'Como o Hash te protege';

  @override
  String get howHashProtectsYouSubtitle => 'Entenda sua seguranca';

  @override
  String get accountSecurity => 'Seguranca da conta';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, Modo Vash';

  @override
  String get blockScreenshots => 'Bloquear capturas de tela';

  @override
  String get transferDevice => 'Transferir para outro dispositivo';

  @override
  String get transferDeviceSubtitle => 'Migrar sua conta';

  @override
  String get pinCode => 'Codigo PIN';

  @override
  String get changePin => 'Alterar codigo PIN';

  @override
  String get currentPin => 'Codigo PIN atual';

  @override
  String get newPin => 'Novo codigo PIN';

  @override
  String get confirmPin => 'Confirmar codigo PIN';

  @override
  String get pinChanged => 'Codigo PIN alterado';

  @override
  String get incorrectPin => 'PIN incorreto';

  @override
  String get pinsDoNotMatch => 'Os codigos nao coincidem';

  @override
  String get autoLock => 'Bloqueio automatico';

  @override
  String get autoLockDelay => 'Tempo de bloqueio';

  @override
  String get autoLockImmediate => 'Imediato';

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
  String get vashModeExplanation => 'Sua rede de seguranca definitiva.';

  @override
  String get vashModeDescription =>
      'Voce vai escolher um segundo codigo PIN. Se um dia for obrigado a abrir o Hash, digite este codigo no lugar do seu PIN habitual.\n\nO app vai abrir normalmente, mas todas as suas conversas e contatos terao desaparecido.\n\nPara qualquer pessoa olhando sua tela, o Hash parecera simplesmente vazio — como se voce nunca o tivesse usado.';

  @override
  String get vashModeIrreversible => 'Esta acao e silenciosa e irreversivel.';

  @override
  String get chooseVashCode => 'Escolher meu codigo Vash';

  @override
  String get vashCodeInfo =>
      'Um segundo codigo PIN que abre o app normalmente, mas vazio.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Se voce digitar este codigo no lugar do seu PIN:';

  @override
  String get vashDeleteContacts => 'Seus contatos desaparecem';

  @override
  String get vashDeleteMessages => 'Suas conversas desaparecem';

  @override
  String get vashDeleteHistory => 'Suas notas desaparecem';

  @override
  String get vashKeepId =>
      'Sua identidade Hash (#XXX-XXX-XXX) permanece a mesma';

  @override
  String get vashAppearNormal =>
      'O app aparece normal mas vazio, como novo. Esta acao e irreversivel.';

  @override
  String get setupVashCode => 'Configurar codigo Vash';

  @override
  String get modifyVashCode => 'Modificar codigo Vash';

  @override
  String get currentVashCode => 'Codigo Vash atual';

  @override
  String get newVashCode => 'Novo codigo Vash';

  @override
  String get confirmVashCode => 'Confirmar codigo Vash';

  @override
  String get vashCodeConfigured => 'Codigo Vash configurado';

  @override
  String get vashCodeModified => 'Codigo Vash modificado';

  @override
  String get vashCodeMustDiffer => 'O codigo Vash deve ser diferente do PIN';

  @override
  String get incorrectVashCode => 'Codigo Vash incorreto';

  @override
  String get vashWhatToDelete => 'O que o Modo Vash deve apagar?';

  @override
  String get vashDeleteContactsOption => 'Contatos';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mensagens';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notas';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Modo Vash ativado';

  @override
  String get vashCreateSubtitle =>
      'Escolha um codigo diferente do seu PIN principal';

  @override
  String get vashConfirmSubtitle => 'Confirme seu codigo Vash';

  @override
  String get pinCodeForEntry => 'Codigo PIN para entrar no aplicativo';

  @override
  String get vashCodeSection => 'Modo Vash';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Desbloquear com impressao digital ou Face ID';

  @override
  String get enableBiometric => 'Ativar biometria';

  @override
  String get biometricWarningMessage =>
      'Ao ativar a biometria, voce nao podera usar seu codigo Vash para entrar no aplicativo.\n\nVoce so podera usar o codigo Vash se a biometria falhar (apos varias tentativas malsucedidas).\n\nTem certeza de que deseja continuar?';

  @override
  String get understood => 'Entendi';

  @override
  String get shareAppSubtitle => 'Compartilhe o Hash com seus amigos';

  @override
  String get share => 'Compartilhar';

  @override
  String get danger => 'Perigo';

  @override
  String get deleteAccount => 'Excluir minha conta';

  @override
  String get deleteAccountSubtitle => 'Acao irreversivel';

  @override
  String get deleteAccountConfirmTitle => 'Excluir minha conta';

  @override
  String get deleteAccountConfirmMessage =>
      'Sua conta sera excluida permanentemente. Esta acao e irreversivel.\n\n- Todos os seus chats\n- Todos os seus contatos\n- Seu Hash ID\n\nVoce precisara criar uma nova conta.';

  @override
  String get deleteForever => 'Excluir permanentemente';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Modo Vash ativado.';

  @override
  String deletionError(String error) {
    return 'Erro ao excluir: $error';
  }

  @override
  String get yourSecurity => 'Sua seguranca';

  @override
  String get securityInfo =>
      '- Criptografia de ponta a ponta (Protocolo Signal)\n- Nenhum dado em nossos servidores apos entrega\n- Chaves armazenadas apenas no seu dispositivo\n- Codigo PIN nunca enviado ao servidor';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Bem-vindo';

  @override
  String get securityStatement1 => 'Suas mensagens estao protegidas.';

  @override
  String get securityStatement2 => 'Criptografia de ponta a ponta.';

  @override
  String get securityStatement3 => 'Sem rastro. Sem compromisso.';

  @override
  String get securityStatement4 => 'Sua privacidade e um direito.';

  @override
  String get accessBlocked => 'Acesso bloqueado';

  @override
  String get tooManyAttempts =>
      'Muitas tentativas. Tente novamente mais tarde.';

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
  String get forgotPin => 'Esqueceu o PIN? Use a frase de recuperacao';

  @override
  String get useRecoveryPhrase => 'Usar frase de recuperacao';

  @override
  String get recoveryWarningTitle => 'Atencao';

  @override
  String get recoveryWarningMessage => 'A recuperacao da conta ira:';

  @override
  String get recoveryDeleteAllMessages => 'Excluir TODAS as suas mensagens';

  @override
  String get recoveryWaitDelay => 'Exigir um tempo de espera de 1 hora';

  @override
  String get recoveryKeepContacts => 'Manter seus contatos';

  @override
  String get recoveryIrreversible =>
      'Esta acao e irreversivel. Suas mensagens serao perdidas permanentemente.';

  @override
  String get iUnderstand => 'Eu entendo';

  @override
  String get accountRecovery => 'Recuperacao de conta';

  @override
  String get enterRecoveryPhrase =>
      'Digite as 24 palavras da sua frase de recuperacao, separadas por espacos.';

  @override
  String get recoveryPhraseHint => 'palavra1 palavra2 palavra3 ...';

  @override
  String get recover => 'Recuperar';

  @override
  String get recoveryPhraseRequired =>
      'Por favor digite sua frase de recuperacao';

  @override
  String get recoveryPhrase24Words =>
      'A frase deve conter exatamente 24 palavras';

  @override
  String get incorrectRecoveryPhrase => 'Frase de recuperacao incorreta';

  @override
  String get recoveryInitError => 'Erro ao iniciar recuperacao';

  @override
  String get securityDelay => 'Tempo de seguranca';

  @override
  String get securityDelayMessage =>
      'Para sua seguranca, e necessario um tempo de espera antes de poder criar um novo PIN.';

  @override
  String get timeRemaining => 'Tempo restante';

  @override
  String get messagesDeletedForProtection =>
      'Suas mensagens foram excluidas para sua protecao.';

  @override
  String get canCloseApp => 'Voce pode fechar o app e voltar mais tarde.';

  @override
  String get onboardingTitle1 => 'Bem-vindo ao Hash';

  @override
  String get onboardingSubtitle1 => 'O mensageiro que nao deixa rastros';

  @override
  String get onboardingTitle2 => 'Criptografia total';

  @override
  String get onboardingSubtitle2 =>
      'Suas mensagens sao criptografadas de ponta a ponta com o protocolo Signal';

  @override
  String get onboardingTitle3 => 'Sem rastros';

  @override
  String get onboardingSubtitle3 =>
      'As mensagens sao excluidas dos servidores apos a entrega';

  @override
  String get onboardingTitle4 => 'Sua seguranca';

  @override
  String get onboardingSubtitle4 =>
      'Codigo PIN, Modo Vash e frase de recuperacao';

  @override
  String get getStarted => 'Comecar';

  @override
  String get next => 'Proximo';

  @override
  String get skip => 'Pular';

  @override
  String get alreadyHaveAccount => 'Ja tenho uma conta';

  @override
  String get transferMyAccount => 'Transferir minha conta';

  @override
  String get createPin => 'Criar um codigo PIN';

  @override
  String get createPinSubtitle => 'Este codigo protegera o acesso ao seu app';

  @override
  String get confirmYourPin => 'Confirme seu codigo PIN';

  @override
  String get confirmPinSubtitle => 'Digite seu codigo PIN novamente';

  @override
  String get saveRecoveryPhrase => 'Frase de recuperacao';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Anote estas 24 palavras em ordem. Elas permitirao que voce recupere sua conta se esquecer seu PIN.';

  @override
  String get phraseWritten => 'Anotei minha frase';

  @override
  String get warningRecoveryPhrase =>
      'Se voce perder esta frase e esquecer seu PIN, perdera o acesso a sua conta.';

  @override
  String get accountTransferred => 'Conta transferida';

  @override
  String get accountTransferredMessage =>
      'Sua conta foi transferida para outro dispositivo. Esta sessao nao e mais valida.';

  @override
  String get accountTransferredInfo =>
      'Se voce nao iniciou esta transferencia, sua conta pode ter sido comprometida.';

  @override
  String get logout => 'Sair';

  @override
  String get transferAccount => 'Transferir conta';

  @override
  String get transferAccountInfo =>
      'Transfira sua conta Hash para um novo dispositivo. Sua sessao atual sera invalidada.';

  @override
  String get generateTransferCode => 'Gerar codigo de transferencia';

  @override
  String get transferCode => 'Codigo de transferencia';

  @override
  String transferCodeExpires(int minutes) {
    return 'Este codigo expira em $minutes minutos';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Digite este codigo no seu novo dispositivo para transferir sua conta.';

  @override
  String get generateNewCode => 'Gerar novo codigo';

  @override
  String get scanQrCode => 'Escanear codigo QR';

  @override
  String get scanQrCodeSubtitle =>
      'Escaneie o codigo QR de um contato para adiciona-lo';

  @override
  String get qrCodeDetected => 'Codigo QR detectado';

  @override
  String get invalidQrCode => 'Codigo QR invalido';

  @override
  String get cameraPermissionRequired => 'Permissao de camera necessaria';

  @override
  String get myQrCode => 'Meu codigo QR';

  @override
  String get myQrCodeSubtitle =>
      'Compartilhe este codigo QR para que seus contatos possam adiciona-lo';

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
  String get contactNotFound => 'Contato nao encontrado';

  @override
  String get contactAlreadyAdded => 'Este contato ja esta na sua lista';

  @override
  String get contactAdded => 'Contato adicionado';

  @override
  String get myProfile => 'Meu perfil';

  @override
  String get myProfileSubtitle =>
      'Compartilhe essas informacoes para que possam te adicionar';

  @override
  String get temporaryCode => 'Codigo temporario';

  @override
  String temporaryCodeExpires(String time) {
    return 'Expira em $time';
  }

  @override
  String get codeExpired => 'Codigo expirado';

  @override
  String get generateNewCodeButton => 'Novo codigo';

  @override
  String get copyHashId => 'Copiar ID';

  @override
  String get copyCode => 'Copiar codigo';

  @override
  String get copiedToClipboard => 'Copiado';

  @override
  String get showMyQrCode => 'Mostrar meu QR code';

  @override
  String get orDivider => 'ou';

  @override
  String get openScanner => 'Abrir scanner';

  @override
  String get addManually => 'Adicionar manualmente';

  @override
  String get contactHashIdLabel => 'Hash ID do contato';

  @override
  String get temporaryCodeLabel => 'Codigo temporario';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Peca ao seu contato para gerar um codigo no perfil dele';

  @override
  String get verifyAndAdd => 'Verificar e adicionar';

  @override
  String get fillAllFields => 'Por favor, preencha todos os campos';

  @override
  String get invalidHashIdFormat => 'Formato de ID invalido (ex: 123-456-ABC)';

  @override
  String get userNotFound => 'Usuario nao encontrado';

  @override
  String get cannotAddYourself => 'Voce nao pode se adicionar';

  @override
  String get invalidOrExpiredCode => 'Codigo temporario invalido ou expirado';

  @override
  String get contactFound => 'Contato encontrado!';

  @override
  String get howToCallContact => 'Como voce quer chama-lo?';

  @override
  String get contactNameHint => 'Nome do contato';

  @override
  String get addContactButton => 'Adicionar';

  @override
  String get contactDetails => 'Detalhes do contato';

  @override
  String get contactName => 'Nome do contato';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Adicionado em $date';
  }

  @override
  String get deleteContact => 'Excluir contato';

  @override
  String deleteContactConfirm(Object name) {
    return 'Excluir este contato?';
  }

  @override
  String get deleteContactMessage => 'Isso tambem excluira todo o chat.';

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
  String get today => 'Hoje';

  @override
  String get yesterday => 'Ontem';

  @override
  String dateAtTime(String date, String time) {
    return '$date as $time';
  }

  @override
  String get shareMessage =>
      'Junte-se a mim no Hash! 🔒\n\nE um mensageiro verdadeiramente privado: criptografia total, sem rastros nos servidores e modo panico se necessario.\n\nBaixe o app aqui 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Erro';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Ver';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Nao';

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

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Solicitacoes recebidas';

  @override
  String get noPendingRequests => 'Nenhuma solicitacao pendente';

  @override
  String get pendingRequestsSubtitle => 'Estas pessoas querem adicionar voce';

  @override
  String requestFromUser(String hashId) {
    return 'Solicitacao de $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Expira em $days dias';
  }

  @override
  String get acceptRequest => 'Aceitar';

  @override
  String get rejectRequest => 'Recusar';

  @override
  String get requestAccepted => 'Solicitacao aceita';

  @override
  String get requestRejected => 'Solicitacao recusada';

  @override
  String get requestSent => 'Solicitacao enviada!';

  @override
  String get requestSentSubtitle =>
      'Sua solicitacao foi enviada. O usuario precisa aceita-la para que possam conversar.';

  @override
  String get requestAlreadyPending => 'Uma solicitacao ja esta pendente';

  @override
  String get requestAlreadySentByOther =>
      'Esta pessoa ja lhe enviou uma solicitacao';

  @override
  String get addByHashId => 'Adicionar por Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Digite o Hash ID e o codigo temporario do contato';

  @override
  String get enterTemporaryCode => 'Digite o codigo de 6 digitos';

  @override
  String get sendRequest => 'Enviar solicitacao';

  @override
  String get acceptContactTitle => 'Aceitar contato';

  @override
  String get acceptContactSubtitle => 'Voce pode dar um nome personalizado';

  @override
  String get leaveEmptyForHashId => 'Deixe vazio para usar o Hash ID';

  @override
  String get firstName => 'Nome';

  @override
  String get lastName => 'Sobrenome';

  @override
  String get notes => 'Notas';

  @override
  String get notesHint => 'Notas pessoais sobre este contato';

  @override
  String get photoOptional => 'Foto (opcional)';

  @override
  String get contactNameOptional => 'Nome (opcional)';

  @override
  String get notesOptional => 'Notas (opcional)';

  @override
  String get storedLocally => 'Armazenado apenas no seu dispositivo';

  @override
  String get encryptedMessageLabel => 'Mensagem criptografada';

  @override
  String get identityMessageHint => 'Quem e voce? Como se conhecem?';

  @override
  String get messageWillBeSentEncrypted =>
      'Esta mensagem sera criptografada e enviada ao destinatario';

  @override
  String get sendRequestButton => 'Enviar solicitacao';

  @override
  String get requestExpiresIn24h =>
      'A solicitacao expira em 24h se nao for aceita';

  @override
  String get theyAlreadySentYouRequest =>
      'Esta pessoa ja lhe enviou uma solicitacao';

  @override
  String get requests => 'Solicitacoes';

  @override
  String get receivedRequests => 'Recebidas';

  @override
  String get sentRequests => 'Enviadas';

  @override
  String get noSentRequests => 'Nenhuma solicitacao enviada';

  @override
  String get cancelRequest => 'Cancelar';

  @override
  String get deleteRequest => 'Excluir solicitacao';

  @override
  String get requestCancelled => 'Solicitacao cancelada';

  @override
  String sentTo(String hashId) {
    return 'Enviada para $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Expira em $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Recebida ha $time';
  }

  @override
  String get messageFromRequester => 'Mensagem do solicitante';

  @override
  String get copy => 'Copiar';

  @override
  String get messageInfo => 'Info da mensagem';

  @override
  String get messageDirection => 'Direcao';

  @override
  String get messageSentByYou => 'Enviada por voce';

  @override
  String get messageReceived => 'Recebida';

  @override
  String get messageSentAt => 'Enviada em';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Lida em';

  @override
  String get messageType => 'Tipo';

  @override
  String get messageSize => 'Tamanho';

  @override
  String get messageExpiresAt => 'Expira em';

  @override
  String get messageEncrypted => 'Criptografada de ponta a ponta';

  @override
  String get messageStatusSending => 'Enviando...';

  @override
  String get messageStatusSent => 'Enviada';

  @override
  String get messageStatusDelivered => 'Entregue';

  @override
  String get messageStatusRead => 'Lida';

  @override
  String get messageStatusFailed => 'Falhou';

  @override
  String get serverStatus => 'Servidor';

  @override
  String get onServer => 'Aguardando entrega';

  @override
  String get deletedFromServer => 'Excluida';

  @override
  String get messageTypeText => 'Texto';

  @override
  String get messageTypeImage => 'Imagem';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Audio';

  @override
  String get messageTypeFile => 'Arquivo';

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
  String get ephemeralMessages => 'Mensagens efemeras';

  @override
  String get ephemeralMessagesDescription =>
      'As mensagens sao automaticamente excluidas apos este tempo';

  @override
  String get ephemeralImmediate => 'Imediato';

  @override
  String get ephemeralImmediateDesc => 'Excluida assim que lida';

  @override
  String get ephemeralMyPreference => 'Minha preferencia';

  @override
  String get ephemeralMyPreferenceDesc => 'Usar a configuracao global';

  @override
  String get ephemeralDefaultSetting => 'Duracao das mensagens';

  @override
  String get ephemeralChooseDefault => 'Recomendado';

  @override
  String get ephemeral30Seconds => '30 segundos';

  @override
  String get ephemeral30SecondsDesc => 'Excluida 30s apos leitura';

  @override
  String get ephemeral5Minutes => '5 minutos';

  @override
  String get ephemeral5MinutesDesc => 'Excluida 5min apos leitura';

  @override
  String get ephemeral1Hour => '1 hora';

  @override
  String get ephemeral1HourDesc => 'Excluida 1h apos leitura';

  @override
  String get ephemeral3Hours => '3 horas';

  @override
  String get ephemeral6Hours => '6 horas';

  @override
  String get ephemeral6HoursDesc => 'Excluida 6h apos leitura';

  @override
  String get ephemeral12Hours => '12 horas';

  @override
  String get ephemeral24Hours => '24 horas';

  @override
  String get ephemeral24HoursDesc => 'Excluida 24h apos leitura';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Duracao personalizada';

  @override
  String get howItWorks => 'Como funciona?';

  @override
  String get ephemeralExplanation1 =>
      'As mensagens ja sao excluidas do servidor ao serem recebidas.';

  @override
  String get ephemeralExplanation2 =>
      'Esta configuracao define quando as mensagens desaparecem do SEU telefone apos le-las.';

  @override
  String get ephemeralExplanation3 =>
      'Seu contato tem sua propria configuracao para o telefone dele.';

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
  String get muteExplanation =>
      'Voce nao recebera mais notificacoes deste contato';

  @override
  String get showCallsInRecents => 'Mostrar nas chamadas recentes';

  @override
  String get showCallsInRecentsSubtitle =>
      'As chamadas do Hash aparecem no historico do telefone';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Silenciar notificacoes';

  @override
  String get muteDescription => 'Voce nao recebera notificacoes deste contato';

  @override
  String mutedUntil(String time) {
    return 'Silenciado ate $time';
  }

  @override
  String get notMuted => 'Notificacoes ativadas';

  @override
  String get unmute => 'Reativar';

  @override
  String get notificationSound => 'Som de notificacao';

  @override
  String get defaultSound => 'Padrao';

  @override
  String get chatSettings => 'Configuracoes do chat';

  @override
  String get bubbleColor => 'Cor dos baloes';

  @override
  String get backgroundColor => 'Cor de fundo';

  @override
  String get backgroundImage => 'Imagem de fundo';

  @override
  String get chatBackground => 'Fundo do chat';

  @override
  String get customColor => 'Personalizada';

  @override
  String get defaultColor => 'Padrao';

  @override
  String get imageSelected => 'Imagem selecionada';

  @override
  String get noImage => 'Sem imagem';

  @override
  String get color => 'Cor';

  @override
  String get image => 'Imagem';

  @override
  String get tapToSelectImage => 'Toque para selecionar uma imagem';

  @override
  String get changeImage => 'Trocar imagem';

  @override
  String get previewMessageReceived => 'Oi!';

  @override
  String get previewMessageSent => 'Ola!';

  @override
  String get messageAction => 'Mensagem';

  @override
  String get callAction => 'Chamada';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Notas pessoais';

  @override
  String get addNotes => 'Adicionar notas...';

  @override
  String get noNotes => 'Nenhuma nota';

  @override
  String get messageNotifications => 'Notificacoes de mensagens';

  @override
  String get callNotifications => 'Notificacoes de chamadas';

  @override
  String get useGradient => 'Usar degradee';

  @override
  String get gradientStart => 'Cor inicial';

  @override
  String get gradientEnd => 'Cor final';

  @override
  String get preview => 'Previa';

  @override
  String get reset => 'Redefinir';

  @override
  String get securityNumber => 'Numero de seguranca';

  @override
  String securityNumberDescription(String name) {
    return 'Verifique se o numero de seguranca corresponde ao dispositivo de $name';
  }

  @override
  String get verifyEncryption => 'Verificar criptografia de ponta a ponta';

  @override
  String get tapToCopy => 'Toque para copiar';

  @override
  String get howToVerify => 'Como verificar';

  @override
  String get verifyStep1 =>
      'Encontre seu contato pessoalmente ou ligue para ele';

  @override
  String get verifyStep2 =>
      'Compare os numeros de seguranca ou escaneie os codigos QR';

  @override
  String get verifyStep3 => 'Se corresponderem, seu chat e seguro';

  @override
  String get scanToVerify => 'Escanear para verificar';

  @override
  String get reportSpam => 'Denunciar como spam';

  @override
  String get reportSpamSubtitle => 'Denunciar este contato como spam';

  @override
  String get reportSpamDescription =>
      'Este contato sera denunciado anonimamente. Sua identidade nao sera compartilhada. Tem certeza?';

  @override
  String get report => 'Denunciar';

  @override
  String get spamReported => 'Spam denunciado';

  @override
  String get reportError => 'Falha ao enviar a denuncia. Tente novamente.';

  @override
  String get reportRateLimited =>
      'Voce atingiu o numero maximo de denuncias para hoje.';

  @override
  String get blockContact => 'Bloquear contato';

  @override
  String get blockContactDescription =>
      'Este contato nao podera mais lhe enviar mensagens ou ligar. Ele nao sera notificado.';

  @override
  String get unblockContact => 'Desbloquear contato';

  @override
  String get unblockContactDescription =>
      'Este contato podera novamente lhe enviar mensagens e ligar.';

  @override
  String get contactBlocked => 'Contato bloqueado';

  @override
  String get contactUnblocked => 'Contato desbloqueado';

  @override
  String get contactIsBlocked => 'Este contato esta bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get deleteContactSubtitle => 'Excluir este contato e o chat';

  @override
  String get confirmWithPin => 'Confirmar com PIN';

  @override
  String get enterPinToConfirm => 'Digite seu PIN para confirmar esta acao';

  @override
  String get profilePhoto => 'Foto de perfil';

  @override
  String get takePhoto => 'Tirar uma foto';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String get removePhoto => 'Remover foto';

  @override
  String get viewContactHashId => 'Ver identificador do contato';

  @override
  String get hashIdPartiallyMasked =>
      'Parcialmente oculto para sua seguranca e a do seu contato';

  @override
  String get addFirstContact => 'Adicione seu primeiro contato';

  @override
  String get addFirstContactSubtitle =>
      'Compartilhe seu codigo QR ou escaneie o de um amigo';

  @override
  String get directory => 'Diretorio';

  @override
  String get noContacts => 'Nenhum contato';

  @override
  String get noContactsSubtitle => 'Adicione um contato para comecar';

  @override
  String get sendMessageAction => 'Enviar uma mensagem';

  @override
  String get audioCall => 'Chamada de audio';

  @override
  String get videoCall => 'Videochamada';

  @override
  String get viewProfile => 'Ver perfil';

  @override
  String get deleteContactDirectory => 'Excluir contato';

  @override
  String get scanShort => 'Escanear';

  @override
  String get addShort => 'Adicionar';

  @override
  String deleteContactConfirmName(String name) {
    return 'Tem certeza de que deseja excluir $name?';
  }

  @override
  String get noNotesTitle => 'Sem notas';

  @override
  String get noNotesSubtitle => 'Crie sua primeira nota';

  @override
  String get newNote => 'Nova nota';

  @override
  String get editNote => 'Editar nota';

  @override
  String get deleteNote => 'Excluir nota';

  @override
  String get deleteNoteConfirm =>
      'Tem certeza de que deseja excluir esta nota?';

  @override
  String get noteTitle => 'Titulo';

  @override
  String get noteContent => 'Conteudo';

  @override
  String get addItem => 'Adicionar item';

  @override
  String get pinNote => 'Fixar';

  @override
  String get unpinNote => 'Desafixar';

  @override
  String get noteColor => 'Cor';

  @override
  String get notePassword => 'Senha';

  @override
  String get setPassword => 'Definir senha';

  @override
  String get changePassword => 'Alterar senha';

  @override
  String get removePassword => 'Remover senha';

  @override
  String get enterPassword => 'Digite a senha';

  @override
  String get confirmPassword => 'Confirme a senha';

  @override
  String get passwordPin => 'Codigo PIN';

  @override
  String get passwordText => 'Senha de texto';

  @override
  String get protectedNote => 'Nota protegida';

  @override
  String get incorrectPassword => 'Senha incorreta';

  @override
  String get passwordSet => 'Senha definida';

  @override
  String get passwordRemoved => 'Senha removida';

  @override
  String get notesBiometric => 'Face ID para notas';

  @override
  String get notesBiometricSubtitle =>
      'Exigir autenticacao biometrica para abrir notas protegidas';

  @override
  String get textNote => 'Nota de texto';

  @override
  String get checklistNote => 'Lista de tarefas';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tarefas';
  }

  @override
  String get autoSaved => 'Salvo';

  @override
  String get searchNotes => 'Pesquisar nota';

  @override
  String get legalConsent => 'Consentimento legal';

  @override
  String get confirmAge13 => 'Confirmo que tenho pelo menos 13 anos';

  @override
  String get acceptLegalStart => 'Aceito a ';

  @override
  String get privacyPolicy => 'Politica de Privacidade';

  @override
  String get termsOfService => 'Termos de Servico';

  @override
  String get andThe => ' e os ';

  @override
  String get continueButton => 'Continuar';

  @override
  String get mustAcceptTerms =>
      'Voce deve aceitar ambas as condicoes para continuar';

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
  String get support => 'Suporte';

  @override
  String get contactSupport => 'Contatar suporte';

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
  String get hideConversation => 'Remover do feed';

  @override
  String get deleteConversation => 'Excluir conversa';

  @override
  String get deleteConversationConfirm =>
      'Digite seu PIN para confirmar a exclusao de todas as mensagens';

  @override
  String get noConversations => 'Nenhuma conversa';

  @override
  String get startConversation => 'Iniciar';

  @override
  String get microphonePermissionRequired => 'Acesso ao microfone necessario';

  @override
  String get microphonePermissionExplanation =>
      'O Hash precisa do microfone para fazer chamadas.';

  @override
  String get cameraPermissionExplanation =>
      'O Hash precisa da camera para chamadas de video.';

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
  String get openSettings => 'Abrir configuracoes';

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
  String get callPaused => 'Pausado';

  @override
  String get callPausedSubtitle => 'A chamada ainda está ativa';

  @override
  String get callRemoteMicMuted => 'Microfone do contato silenciado';

  @override
  String get callMiniControlsMute => 'Silenciar';

  @override
  String get callMiniControlsUnmute => 'Ativar microfone';

  @override
  String get callMiniControlsHangUp => 'Desligar';

  @override
  String get callMiniControlsReturn => 'Voltar a chamada';

  @override
  String get callNetworkPoor => 'Conexao instavel';

  @override
  String get callNetworkLost => 'Conexao perdida';

  @override
  String get callEndedTitle => 'Chamada encerrada';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Dados do dispositivo';

  @override
  String get deviceDataSubtitle => 'Armazenamento local e servidor';

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
  String get localStorage => 'Armazenamento local';

  @override
  String get onThisDevice => 'neste dispositivo';

  @override
  String get encryptedDatabases => 'Bancos de dados criptografados';

  @override
  String get files => 'Arquivos';

  @override
  String get secureKeychain => 'Chaveiro seguro';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Nomes, avatares, chaves Signal';

  @override
  String get messagesDetail => 'Conversas criptografadas';

  @override
  String get notesDetail => 'Notas pessoais';

  @override
  String get signalSessions => 'Sessoes Signal';

  @override
  String get signalSessionsDetail => 'Sessoes de criptografia';

  @override
  String get pendingContacts => 'Contatos pendentes';

  @override
  String get pendingContactsDetail => 'Solicitacoes em andamento';

  @override
  String get callHistory => 'Chamadas';

  @override
  String get callHistoryDetail => 'Historico de chamadas';

  @override
  String get preferences => 'Preferencias';

  @override
  String get preferencesDetail => 'Preferencias de midia e chamadas';

  @override
  String get avatars => 'Avatares';

  @override
  String get media => 'Midia';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
      zero: 'nenhum arquivo',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Ativo';

  @override
  String get notDefined => 'Nao definido';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Frase de recuperacao';

  @override
  String get identity => 'Identidade (Hash ID)';

  @override
  String get signalKeys => 'Chaves Signal Protocol';

  @override
  String get authTokens => 'Tokens de autenticacao';

  @override
  String get contactNamesCache => 'Cache de nomes';

  @override
  String get remoteConfig => 'Config remota';

  @override
  String get notificationPrefs => 'Preferencias de notificacoes';

  @override
  String get serverData => 'Dados no servidor';

  @override
  String get serverDataInfo =>
      'O Hash mantem o minimo de dados no servidor, todos criptografados ou temporarios.';

  @override
  String get serverProfile => 'Perfil';

  @override
  String get serverProfileDetail => 'Hash ID, chaves publicas, token de caixa';

  @override
  String get serverPrekeys => 'Pre-chaves';

  @override
  String get serverPrekeysDetail => 'Chaves Signal de uso unico (consumidas)';

  @override
  String get serverMessages => 'Mensagens em transito';

  @override
  String get serverMessagesDetail => 'Excluidas apos recebimento (max. 24h)';

  @override
  String get serverMedia => 'Midia em transito';

  @override
  String get serverMediaDetail => 'Excluida apos download';

  @override
  String get serverContactRequests => 'Solicitacoes de contato';

  @override
  String get serverContactRequestsDetail => 'Expiram apos 24h';

  @override
  String get serverRateLimits => 'Limites de taxa';

  @override
  String get serverRateLimitsDetail => 'Dados temporarios anti-abuso';

  @override
  String get privacyReassurance =>
      'O Hash nao pode ler suas mensagens. Todos os dados sao criptografados de ponta a ponta. Os dados do servidor sao excluidos automaticamente.';

  @override
  String get pinTooSimple =>
      'Este codigo PIN e muito simples. Escolha um codigo mais seguro.';

  @override
  String get genericError => 'Ocorreu um erro. Tente novamente.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Impossivel criar a conta: $error';
  }

  @override
  String get phraseCopiedToClipboard =>
      'Frase copiada para a area de transferencia';

  @override
  String get copyPhrase => 'Copiar a frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Anote esta frase em um lugar seguro. Se voce perder seu codigo PIN sem esta frase, perdera permanentemente o acesso aos seus dados.';

  @override
  String get noMessages => 'Nenhuma mensagem';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Excluir todas as mensagens com $name?';
  }

  @override
  String get confirmation => 'Confirmacao';

  @override
  String get untitled => 'Sem titulo';

  @override
  String get noSessions => 'Nenhuma sessao';

  @override
  String get unknownContact => 'Contato desconhecido';

  @override
  String get unnamed => 'Sem nome';

  @override
  String get noPendingRequestsAlt => 'Nenhuma solicitacao pendente';

  @override
  String get deleteAllCallHistory => 'Excluir todo o historico de chamadas?';

  @override
  String get noCalls => 'Nenhuma chamada';

  @override
  String get noPreferences => 'Nenhuma preferencia';

  @override
  String get resetAllMediaPrefs => 'Redefinir todas as preferencias de midia?';

  @override
  String get deleteThisAvatar => 'Excluir este avatar?';

  @override
  String get deleteAllAvatars => 'Excluir todos os avatares?';

  @override
  String get noAvatars => 'Nenhum avatar';

  @override
  String get deleteThisFile => 'Excluir este arquivo?';

  @override
  String get deleteAllMediaFiles => 'Excluir todas as midias?';

  @override
  String get noMediaFiles => 'Nenhuma midia';

  @override
  String get outgoing => 'Efetuada';

  @override
  String get incoming => 'Recebida';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Visualizacao efemera: ${seconds}s';
  }

  @override
  String get normalView => 'Visualizacao normal';

  @override
  String get callReasonCompleted => 'Concluida';

  @override
  String get callReasonMissed => 'Perdida';

  @override
  String get callReasonDeclined => 'Recusada';

  @override
  String get callReasonFailed => 'Falhou';

  @override
  String get justNow => 'Agora mesmo';

  @override
  String timeAgoMinutes(int count) {
    return 'Ha $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Ha ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Ha ${count}d';
  }

  @override
  String get messageTypeContact => 'Contato';

  @override
  String get messageTypeLocation => 'Localizacao';

  @override
  String get statusQueued => 'Na fila';

  @override
  String get blockedBadge => 'Bloqueado';

  @override
  String get protectedBadge => 'Protegida';

  @override
  String messageCount(int count) {
    return '$count mensagem(ns)';
  }

  @override
  String get deleteQuestion => 'Excluir?';

  @override
  String get transferMyAccountTitle => 'Transferir minha conta';

  @override
  String get loadingError => 'Erro de carregamento';

  @override
  String get transferToNewDevice => 'Transferir para um novo dispositivo';

  @override
  String get transferInstructions =>
      'No seu novo dispositivo, escolha \"Recuperar minha conta\" e insira estas informacoes:';

  @override
  String get yourHashIdLabel => 'Seu Hash ID';

  @override
  String get enterYourPinCode => 'Digite seu codigo PIN';

  @override
  String get pinOwnerConfirmation =>
      'Para confirmar que voce e o proprietario desta conta';

  @override
  String get scanThisQrCode => 'Escaneie este codigo QR';

  @override
  String get withYourNewDevice => 'Com seu novo dispositivo';

  @override
  String get orEnterTheCode => 'ou digite o codigo';

  @override
  String get transferCodeLabel => 'Codigo de transferencia';

  @override
  String get proximityVerification => 'Verificacao de proximidade';

  @override
  String get bringDevicesCloser => 'Aproxime os dois dispositivos';

  @override
  String get confirmTransferQuestion => 'Confirmar a transferencia?';

  @override
  String get accountWillBeTransferred =>
      'Sua conta sera transferida para o novo dispositivo.\n\nEste dispositivo sera permanentemente desconectado.';

  @override
  String get transferComplete => 'Transferencia concluida';

  @override
  String get transferSuccessMessage =>
      'Sua conta foi transferida com sucesso.\n\nEste aplicativo sera fechado agora.';

  @override
  String get manualVerification => 'Verificacao manual';

  @override
  String get codeDisplayedOnBothDevices =>
      'Codigo exibido em ambos os dispositivos:';

  @override
  String get doesCodeMatchNewDevice =>
      'Este codigo corresponde ao do novo dispositivo?';

  @override
  String get verifiedStatus => 'Verificado';

  @override
  String get inProgressStatus => 'Em andamento...';

  @override
  String get notAvailableStatus => 'Nao disponivel';

  @override
  String get codeExpiredRestart => 'O codigo expirou. Por favor, recomece.';

  @override
  String get codesDoNotMatchCancelled =>
      'Os codigos nao correspondem. Transferencia cancelada.';

  @override
  String transferToDevice(String device) {
    return 'Para: $device';
  }

  @override
  String get copiedExclamation => 'Copiado!';

  @override
  String expiresInTime(String time) {
    return 'Expira em $time';
  }

  @override
  String get biometricNotAvailable =>
      'A biometria nao esta disponivel neste dispositivo';

  @override
  String get biometricAuthError => 'Erro durante a autenticacao biometrica';

  @override
  String get authenticateForBiometric =>
      'Por favor, autentique-se para ativar a biometria';

  @override
  String get biometricAuthFailed => 'Autenticacao biometrica falhou';

  @override
  String get forceUpdateTitle => 'Atualizacao necessaria';

  @override
  String get forceUpdateMessage =>
      'Uma nova versao do Hash esta disponivel. Por favor, atualize para continuar.';

  @override
  String get updateButton => 'Atualizar';

  @override
  String get maintenanceInProgress => 'Manutencao em andamento';

  @override
  String get tryAgainLater => 'Tente novamente mais tarde';

  @override
  String get information => 'Informacao';

  @override
  String get later => 'Mais tarde';

  @override
  String get doYouLikeHash => 'Voce gosta do Hash?';

  @override
  String get yourFeedbackHelps => 'Seu feedback nos ajuda a melhorar o app';

  @override
  String get ratingTerrible => 'Terrivel';

  @override
  String get ratingBad => 'Ruim';

  @override
  String get ratingOk => 'OK';

  @override
  String get ratingGood => 'Bom';

  @override
  String get ratingExcellent => 'Excelente!';

  @override
  String get donationMessage =>
      'Hash e um projeto sem fins lucrativos. Seu apoio nos permite continuar a desenvolver um mensageiro verdadeiramente privado.';

  @override
  String get recentConnections => 'Conexoes recentes';

  @override
  String get loginInfoText =>
      'Cada desbloqueio por PIN e registrado localmente. Apenas as ultimas 24 horas sao mantidas.';

  @override
  String get connectionCount => 'Conexao(oes)';

  @override
  String get periodLabel => 'Periodo';

  @override
  String get historyLabel => 'Historico';

  @override
  String get noLoginRecorded => 'Nenhuma conexao registrada';

  @override
  String get nextUnlocksAppearHere =>
      'Os proximos desbloqueios aparecera aqui.';

  @override
  String get dataLocalOnly =>
      'Estes dados sao armazenados apenas no seu dispositivo e nunca sao transmitidos.';

  @override
  String get currentSession => 'Atual';

  @override
  String get todayLabel => 'Hoje';

  @override
  String get yesterdayLabel => 'Ontem';

  @override
  String get justNowLabel => 'Agora mesmo';

  @override
  String minutesAgoLabel(int count) {
    return 'Ha $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Ha ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Ha ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Nenhuma manutencao planejada';

  @override
  String get everythingWorkingNormally => 'Tudo funcionando normalmente';

  @override
  String get maintenanceTitle => 'Manutencao';

  @override
  String get maintenanceActiveLabel => 'EM ANDAMENTO';

  @override
  String get maintenancePlannedLabel => 'PLANEJADA';

  @override
  String get locking => 'Bloqueando...';

  @override
  String get newMessageNotification => 'Nova mensagem';

  @override
  String get secExplainTitle => 'Como o Hash te protege';

  @override
  String get secExplainIntro =>
      'O Hash foi projetado para que ninguem possa ler suas mensagens.';

  @override
  String get secExplainIntroSub =>
      'Nem mesmo nos.\nVeja como funciona, explicado de forma simples.';

  @override
  String get secJourneyLabel => 'O PERCURSO';

  @override
  String get secJourneyTitle => 'A viagem da sua mensagem';

  @override
  String get secJourneySubtitle =>
      'Do seu dedo ate a tela do seu contato, cada etapa e protegida. Siga o caminho.';

  @override
  String get secStep1Title => 'Voce escreve sua mensagem';

  @override
  String get secStep1Desc =>
      'Voce digita \"Oi!\" no app. Neste momento, a mensagem existe apenas na memoria do seu telefone. Nada foi enviado.';

  @override
  String get secStep2Title => 'Criptografia com o protocolo Signal';

  @override
  String get secStep2Desc =>
      'Quando voce pressiona \"Enviar\", sua mensagem e transformada em uma serie de caracteres incompreensiveis. E como se sua mensagem fosse trancada em um cofre cuja chave so o seu contato possui.';

  @override
  String get secStep3Title => 'Sealed Sender: o envelope invisivel';

  @override
  String get secStep3Desc =>
      'Imagine que voce envia uma carta pelo correio, mas sem endereco de remetente no envelope. E exatamente isso que o Hash faz. A mensagem e depositada em uma caixa postal anonima. O servidor nao sabe quem a enviou.';

  @override
  String get secStep4Title => 'O servidor nao ve nada';

  @override
  String get secStep4Desc =>
      'O servidor age como um carteiro cego. Ele so sabe que \"alguem depositou algo na caixa #A7X9\". Nao sabe quem enviou, o que e, nem para quem e destinado.';

  @override
  String get secStep4Highlight =>
      'Nenhum metadado armazenado: sem endereco IP, sem timestamp, sem vinculo entre remetente e destinatario.';

  @override
  String get secStep5Title => 'Seu contato recebe a mensagem';

  @override
  String get secStep5Desc =>
      'O telefone do seu contato recupera o conteudo da sua caixa postal anonima e descriptografa a mensagem com sua chave privada, que nunca saiu do dispositivo. \"Oi!\" aparece na tela.';

  @override
  String get secStep6Title => 'A mensagem desaparece do servidor';

  @override
  String get secStep6Desc =>
      'Assim que seu contato confirma o recebimento, o servidor exclui permanentemente a mensagem. Sem lixeira, sem arquivo, sem backup. Mesmo mensagens nao lidas sao automaticamente destruidas apos 24 horas.';

  @override
  String get secStep7Title => 'Expiracao local';

  @override
  String get secStep7Desc =>
      'No telefone do seu contato, a mensagem se autodestroi conforme a duracao que voce escolheu: imediatamente apos a leitura, 5 minutos, 1 hora... voce decide.';

  @override
  String get secJourneyConclusion =>
      'Resultado: zero rastro no servidor, zero rastro nos dispositivos. A mensagem existiu o tempo de ser lida e depois desapareceu.';

  @override
  String get secArchLabel => 'ARQUITETURA';

  @override
  String get secArchTitle => '5 camadas de protecao';

  @override
  String get secArchSubtitle =>
      'O Hash nao depende de uma unica tecnologia. Cada camada reforca as outras. Mesmo se uma camada for comprometida, seus dados permanecem seguros.';

  @override
  String get secLayer1Title => 'Criptografia de ponta a ponta';

  @override
  String get secLayer1Desc =>
      'Cada mensagem e criptografada com uma chave unica. Em termos simples: mesmo se alguem descriptografar uma mensagem, nao podera descriptografar a proxima. Cada mensagem tem seu proprio cadeado.';

  @override
  String get secLayer1Detail =>
      'Para arquivos (fotos, videos, documentos), o Hash usa uma criptografia AES-256-GCM adicional. O arquivo e criptografado antes de sair do seu telefone.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimato de rede)';

  @override
  String get secLayer2Desc =>
      'Apps de mensagens classicos enviam suas mensagens com sua identidade anexada. E como escrever seu nome no envelope. O Hash usa caixas postais anonimas: o servidor deposita a mensagem sem saber quem a enviou.';

  @override
  String get secLayer2Detail =>
      'Resultado: mesmo em caso de vazamento de dados do servidor, e impossivel reconstruir quem fala com quem.';

  @override
  String get secLayer3Title => 'Exclusao automatica';

  @override
  String get secLayer3Desc =>
      'As mensagens sao excluidas do servidor apos confirmacao de recebimento. Mesmo que uma mensagem nunca seja recuperada, ela e automaticamente destruida apos 24 horas.';

  @override
  String get secLayer3Detail =>
      'No seu telefone, as mensagens se autodestroem conforme a duracao que voce escolher: imediatamente, 5 min, 15 min, 30 min, 1h, 3h, 6h ou 12h.';

  @override
  String get secLayer4Title => 'Protecao de acesso local';

  @override
  String get secLayer4Desc =>
      'O app e protegido por um codigo PIN de 6 digitos e/ou biometria (Face ID, impressao digital). Apos muitas tentativas fracassadas, o app e bloqueado com um atraso que aumenta a cada falha.';

  @override
  String get secLayer5Title => 'Banco de dados bloqueado';

  @override
  String get secLayer5Desc =>
      'No lado do servidor, nenhum usuario pode escrever diretamente no banco de dados. Todas as acoes passam por funcoes seguras que verificam cada solicitacao.';

  @override
  String get secLayer5Detail =>
      'E como o guiche de um banco: voce nunca toca no cofre. Voce faz uma solicitacao, e o sistema verifica se voce tem permissao antes de agir.';

  @override
  String get secVashLabel => 'UNICO NO MUNDO';

  @override
  String get secVashTitle => 'Modo Vash';

  @override
  String get secVashSubtitle =>
      'Um sistema de seguranca de emergencia que nao existe em nenhum outro app de mensagens.';

  @override
  String get secVashScenarioTitle => 'Imagine esta situacao';

  @override
  String get secVashScenario1 => 'Alguem acessa seu telefone';

  @override
  String get secVashScenario2 => 'Pedem seu codigo PIN';

  @override
  String get secVashScenario3 =>
      'Voce quer apagar todos os seus dados com urgencia';

  @override
  String get secVashSolutionTitle => 'A solucao: dois codigos PIN';

  @override
  String get secVashSolutionDesc =>
      'Voce configura dois codigos PIN diferentes no Hash:';

  @override
  String get secVashNormalCodeLabel => 'Codigo normal';

  @override
  String get secVashNormalCodeDesc =>
      'Abre o app normalmente com todos os seus dados';

  @override
  String get secVashCodeLabel2 => 'Codigo Vash';

  @override
  String get secVashCodeDescription =>
      'Abre o app normalmente... mas todos os seus dados sao silenciosamente excluidos em segundo plano';

  @override
  String get secVashWhatHappensTitle => 'O que acontece depois';

  @override
  String get secVashWhatHappensDesc =>
      'O app abre normalmente. Sem alerta, sem animacao suspeita. A tela simplesmente mostra um app vazio, como se voce acabou de instala-lo.\n\nNa realidade, todas as suas conversas, contatos e mensagens foram irreversivelmente excluidos em uma fracao de segundo.';

  @override
  String get secCallsLabel => 'CHAMADAS E ARQUIVOS';

  @override
  String get secCallsTitle => 'Tudo e criptografado';

  @override
  String get secCallsSubtitle =>
      'Nao sao apenas as mensagens. Absolutamente tudo que transita pelo Hash e criptografado de ponta a ponta.';

  @override
  String get secAudioCallTitle => 'Chamadas de audio';

  @override
  String get secAudioCallDesc =>
      'Criptografadas de ponta a ponta via WebRTC. A voz e transmitida diretamente entre os dispositivos.';

  @override
  String get secVideoCallTitle => 'Videochamadas';

  @override
  String get secVideoCallDesc =>
      'Mesma tecnologia, cada fluxo criptografado individualmente.';

  @override
  String get secPhotosTitle => 'Fotos e videos';

  @override
  String get secPhotosDesc =>
      'Criptografados em AES-256-GCM antes de sair do seu telefone.';

  @override
  String get secDocsTitle => 'Documentos';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, qualquer arquivo. Nome, tamanho e conteudo criptografados.';

  @override
  String get secAnonLabel => 'ANONIMATO';

  @override
  String get secAnonTitle => 'Nenhuma identidade necessaria';

  @override
  String get secAnonSubtitle =>
      'O Hash nunca pede seu numero de telefone nem seu email. Voce e identificado por um Hash ID unico e anonimo.';

  @override
  String get secHashIdTitle => 'Seu Hash ID';

  @override
  String get secHashIdDesc =>
      'E seu identificador unico. Nao revela nada sobre voce: nem seu nome, nem seu numero, nem sua localizacao. E como um pseudonimo impossivel de vincular a sua identidade real.\n\nPara adicionar um contato, voce compartilha seu Hash ID ou escaneia um codigo QR. E so isso. Sem agenda sincronizada, sem sugestoes \"Pessoas que voce pode conhecer\".';

  @override
  String get secDataLabel => 'DADOS';

  @override
  String get secDataTitle => 'O que o Hash nao sabe';

  @override
  String get secDataSubtitle =>
      'A melhor forma de proteger seus dados e nao coleta-los.';

  @override
  String get secNeverCollected => 'Nunca coletado';

  @override
  String get secNeverItem1 => 'Conteudo das mensagens';

  @override
  String get secNeverItem2 => 'Lista de contatos';

  @override
  String get secNeverItem3 => 'Numero de telefone';

  @override
  String get secNeverItem4 => 'Endereco de email';

  @override
  String get secNeverItem5 => 'Endereco IP';

  @override
  String get secNeverItem6 => 'Localizacao';

  @override
  String get secNeverItem7 => 'Metadados (quem fala com quem)';

  @override
  String get secNeverItem8 => 'Historico de chamadas';

  @override
  String get secNeverItem9 => 'Agenda de contatos';

  @override
  String get secNeverItem10 => 'Identificadores publicitarios';

  @override
  String get secTempStored => 'Armazenado temporariamente';

  @override
  String get secTempItem1 => 'Hash ID anonimo (identificador unico)';

  @override
  String get secTempItem2 => 'Chaves publicas de criptografia';

  @override
  String get secTempItem3 => 'Mensagens criptografadas em transito (max 24h)';

  @override
  String get secTempNote =>
      'Mesmo estes dados minimos nao permitem identifica-lo. Seu Hash ID nao esta vinculado a nenhuma informacao pessoal.';

  @override
  String get secFooterTitle => 'Sua privacidade, sua liberdade';

  @override
  String get secFooterDesc =>
      'O Hash utiliza as mesmas tecnologias de criptografia dos aplicativos profissionais mais exigentes. Suas mensagens sao protegidas pela matematica, nao por promessas.';

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

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero Rastro. Zero Compromisso.';

  @override
  String get conversations => 'Conversas';

  @override
  String get contacts => 'Contatos';

  @override
  String get noConversation => 'Nenhuma conversa';

  @override
  String get noConversationSubtitle =>
      'Adicione um contato para começar a conversar com segurança';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitações pendentes',
      one: '1 solicitação pendente',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count solicitações enviadas pendentes',
      one: '1 solicitação enviada pendente',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Adicionar contato';

  @override
  String get shareApp => 'Compartilhar app';

  @override
  String get newMessage => 'Nova mensagem';

  @override
  String get newConversation => 'Enviar mensagem';

  @override
  String get settings => 'Configurações';

  @override
  String get myHashId => 'Meu Hash ID';

  @override
  String get supportHash => 'Apoie o Hash';

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
  String get languageAuto => 'Automático (sistema)';

  @override
  String get notifications => 'Notificações';

  @override
  String get messages => 'Mensagens';

  @override
  String get calls => 'Chamadas';

  @override
  String get vibration => 'Vibração';

  @override
  String get notificationContent => 'Conteúdo das notificações';

  @override
  String get notificationContentFull => 'Mostrar tudo';

  @override
  String get notificationContentFullDesc =>
      'Nome do contato e prévia da mensagem';

  @override
  String get notificationContentName => 'Apenas nome';

  @override
  String get notificationContentNameDesc => 'Mostra apenas o nome do contato';

  @override
  String get notificationContentDiscrete => 'Discreto';

  @override
  String get notificationContentDiscreteDesc =>
      'Mostra apenas \"Nova mensagem\"';

  @override
  String get security => 'Segurança';

  @override
  String get howHashProtectsYou => 'Como o Hash protege você';

  @override
  String get howHashProtectsYouSubtitle => 'Entenda sua segurança';

  @override
  String get accountSecurity => 'Segurança da conta';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, Modo Vash';

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
  String get pinsDoNotMatch => 'Os PINs não coincidem';

  @override
  String get autoLock => 'Bloqueio automático';

  @override
  String get autoLockDelay => 'Tempo de bloqueio';

  @override
  String get autoLockImmediate => 'Imediato';

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
  String get vashModeExplanation => 'Sua rede de segurança definitiva.';

  @override
  String get vashModeDescription =>
      'Você vai escolher um segundo código PIN. Se algum dia for obrigado a abrir o Hash, digite este código no lugar do seu PIN normal.\n\nO aplicativo abrirá normalmente, mas todas as suas conversas e contatos terão desaparecido.\n\nPara qualquer pessoa olhando sua tela, o Hash simplesmente parece vazio — como se você nunca tivesse usado.';

  @override
  String get vashModeIrreversible => 'Esta ação é silenciosa e irreversível.';

  @override
  String get chooseVashCode => 'Escolher meu código Vash';

  @override
  String get vashCodeInfo =>
      'Um segundo código PIN que abre o app normalmente, mas vazio.';

  @override
  String get vashCodeInfoDetail =>
      'Se você digitar este código no lugar do seu PIN:';

  @override
  String get vashDeleteContacts => 'Seus contatos desaparecem';

  @override
  String get vashDeleteMessages => 'Suas conversas desaparecem';

  @override
  String get vashDeleteHistory => 'Suas notas desaparecem';

  @override
  String get vashKeepId =>
      'Sua identidade Hash (#XXX-XXX-XXX) permanece a mesma';

  @override
  String get vashAppearNormal =>
      'O app parece normal mas vazio, como novo. Esta ação é irreversível.';

  @override
  String get setupVashCode => 'Configurar código Vash';

  @override
  String get modifyVashCode => 'Modificar código Vash';

  @override
  String get currentVashCode => 'Código Vash atual';

  @override
  String get newVashCode => 'Novo código Vash';

  @override
  String get confirmVashCode => 'Confirmar código Vash';

  @override
  String get vashCodeConfigured => 'Código Vash configurado';

  @override
  String get vashCodeModified => 'Código Vash modificado';

  @override
  String get vashCodeMustDiffer => 'O código Vash deve ser diferente do PIN';

  @override
  String get incorrectVashCode => 'Código Vash incorreto';

  @override
  String get vashWhatToDelete => 'O que o Modo Vash deve fazer desaparecer?';

  @override
  String get vashDeleteContactsOption => 'Contatos';

  @override
  String get vashDeleteMessagesOption => 'Mensagens';

  @override
  String get vashDeleteNotesOption => 'Notas';

  @override
  String get vashActivated => 'Modo Vash ativado';

  @override
  String get vashCreateSubtitle =>
      'Escolha um código diferente do seu PIN principal';

  @override
  String get vashConfirmSubtitle => 'Confirme seu código Vash';

  @override
  String get pinCodeForEntry => 'Código PIN para entrar no aplicativo';

  @override
  String get vashCodeSection => 'Modo Vash';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Desbloquear com digital ou Face ID';

  @override
  String get enableBiometric => 'Ativar biometria';

  @override
  String get biometricWarningMessage =>
      'Ao ativar a biometria, você não poderá usar seu código Vash para entrar no aplicativo.\n\nVocê só poderá usar o código Vash se a biometria falhar (após várias tentativas malsucedidas).\n\nTem certeza de que deseja continuar?';

  @override
  String get understood => 'Entendi';

  @override
  String get shareAppSubtitle => 'Compartilhe o Hash com seus amigos';

  @override
  String get share => 'Compartilhar';

  @override
  String get danger => 'Perigo';

  @override
  String get deleteAccount => 'Excluir minha conta';

  @override
  String get deleteAccountSubtitle => 'Ação irreversível';

  @override
  String get deleteAccountConfirmTitle => 'Excluir minha conta';

  @override
  String get deleteAccountConfirmMessage =>
      'Sua conta será excluída permanentemente. Esta ação é irreversível.\n\n• Todas as suas conversas\n• Todos os seus contatos\n• Seu Hash ID\n\nVocê precisará criar uma nova conta.';

  @override
  String get deleteForever => 'Excluir permanentemente';

  @override
  String get cancel => 'Cancelar';

  @override
  String get dataDeletedForSecurity => 'Modo Vash ativado.';

  @override
  String deletionError(String error) {
    return 'Erro ao excluir: $error';
  }

  @override
  String get yourSecurity => 'Sua segurança';

  @override
  String get securityInfo =>
      '• Criptografia de ponta a ponta (Signal Protocol)\n• Nenhum dado em nossos servidores após a entrega\n• Chaves armazenadas apenas no seu dispositivo\n• Código PIN nunca enviado ao servidor';

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
  String get tooManyAttempts =>
      'Muitas tentativas. Tente novamente mais tarde.';

  @override
  String get pleaseWait => 'Aguarde';

  @override
  String get waitDelay => 'Aguarde o fim do prazo';

  @override
  String attemptCount(int current, int max) {
    return 'Tentativa $current de $max';
  }

  @override
  String retryIn(String time) {
    return 'Tente novamente em $time';
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
  String get recoveryWaitDelay => 'Exigir um prazo de 1 hora';

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
      'Por favor, digite sua frase de recuperação';

  @override
  String get recoveryPhrase24Words =>
      'A frase deve conter exatamente 24 palavras';

  @override
  String get incorrectRecoveryPhrase => 'Frase de recuperação incorreta';

  @override
  String get recoveryInitError => 'Erro ao inicializar a recuperação';

  @override
  String get securityDelay => 'Prazo de segurança';

  @override
  String get securityDelayMessage =>
      'Para sua segurança, é necessário aguardar antes de criar um novo PIN.';

  @override
  String get timeRemaining => 'Tempo restante';

  @override
  String get messagesDeletedForProtection =>
      'Suas mensagens foram excluídas para sua proteção.';

  @override
  String get canCloseApp => 'Você pode fechar o app e voltar depois.';

  @override
  String get onboardingTitle1 => 'Bem-vindo ao Hash';

  @override
  String get onboardingSubtitle1 => 'O mensageiro que não deixa rastro';

  @override
  String get onboardingTitle2 => 'Criptografia total';

  @override
  String get onboardingSubtitle2 =>
      'Suas mensagens são criptografadas de ponta a ponta com o protocolo Signal';

  @override
  String get onboardingTitle3 => 'Sem rastro';

  @override
  String get onboardingSubtitle3 =>
      'As mensagens são excluídas dos servidores após a entrega';

  @override
  String get onboardingTitle4 => 'Sua segurança';

  @override
  String get onboardingSubtitle4 =>
      'Código PIN, Modo Vash e frase de recuperação';

  @override
  String get getStarted => 'Começar';

  @override
  String get next => 'Próximo';

  @override
  String get skip => 'Pular';

  @override
  String get alreadyHaveAccount => 'Já tenho uma conta';

  @override
  String get transferMyAccount => 'Transferir minha conta';

  @override
  String get createPin => 'Criar código PIN';

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
      'Anote estas 24 palavras em ordem. Elas permitirão recuperar sua conta se você esquecer seu PIN.';

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
  String get scanQrCode => 'Escanear QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Escaneie o QR code de um contato para adicioná-lo';

  @override
  String get qrCodeDetected => 'QR code detectado';

  @override
  String get invalidQrCode => 'QR code inválido';

  @override
  String get cameraPermissionRequired => 'Permissão de câmera necessária';

  @override
  String get myQrCode => 'Meu QR code';

  @override
  String get myQrCodeSubtitle =>
      'Compartilhe este QR code para que seus contatos possam te adicionar';

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
  String get myProfile => 'Meu perfil';

  @override
  String get myProfileSubtitle =>
      'Compartilhe estas informações para que possam te adicionar';

  @override
  String get temporaryCode => 'Código temporário';

  @override
  String temporaryCodeExpires(String time) {
    return 'Expira em $time';
  }

  @override
  String get codeExpired => 'Código expirado';

  @override
  String get generateNewCodeButton => 'Novo código';

  @override
  String get copyHashId => 'Copiar ID';

  @override
  String get copyCode => 'Copiar código';

  @override
  String get copiedToClipboard => 'Copiado';

  @override
  String get showMyQrCode => 'Mostrar meu QR code';

  @override
  String get orDivider => 'ou';

  @override
  String get openScanner => 'Abrir scanner';

  @override
  String get addManually => 'Adicionar manualmente';

  @override
  String get contactHashIdLabel => 'Hash ID do contato';

  @override
  String get temporaryCodeLabel => 'Código temporário';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Peça ao seu contato para gerar um código no perfil dele';

  @override
  String get verifyAndAdd => 'Verificar e adicionar';

  @override
  String get fillAllFields => 'Por favor, preencha todos os campos';

  @override
  String get invalidHashIdFormat => 'Formato de ID inválido (ex: 123-456-ABC)';

  @override
  String get userNotFound => 'Usuário não encontrado';

  @override
  String get cannotAddYourself => 'Você não pode se adicionar';

  @override
  String get invalidOrExpiredCode => 'Código temporário inválido ou expirado';

  @override
  String get contactFound => 'Contato encontrado!';

  @override
  String get howToCallContact => 'Como você quer chamar essa pessoa?';

  @override
  String get contactNameHint => 'Nome do contato';

  @override
  String get addContactButton => 'Adicionar';

  @override
  String get contactDetails => 'Detalhes do contato';

  @override
  String get contactName => 'Nome do contato';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Adicionado em $date';
  }

  @override
  String get deleteContact => 'Excluir contato';

  @override
  String deleteContactConfirm(Object name) {
    return 'Excluir este contato?';
  }

  @override
  String get deleteContactMessage => 'Isso também excluirá toda a conversa.';

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
  String get today => 'Hoje';

  @override
  String get yesterday => 'Ontem';

  @override
  String dateAtTime(String date, String time) {
    return '$date às $time';
  }

  @override
  String get shareMessage =>
      'Venha para o Hash! 🔒\n\nÉ um mensageiro realmente privado: criptografia total, sem rastro nos servidores, e modo pânico quando precisar.\n\nBaixe o app aqui 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Erro';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Ver';

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

  @override
  String get pendingRequests => 'Solicitações pendentes';

  @override
  String get noPendingRequests => 'Nenhuma solicitação pendente';

  @override
  String get pendingRequestsSubtitle => 'Essas pessoas querem te adicionar';

  @override
  String requestFromUser(String hashId) {
    return 'Solicitação de $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Expira em $days dias';
  }

  @override
  String get acceptRequest => 'Aceitar';

  @override
  String get rejectRequest => 'Rejeitar';

  @override
  String get requestAccepted => 'Solicitação aceita';

  @override
  String get requestRejected => 'Solicitação rejeitada';

  @override
  String get requestSent => 'Solicitação enviada!';

  @override
  String get requestSentSubtitle =>
      'Sua solicitação foi enviada. O usuário precisa aceitá-la para que vocês possam conversar.';

  @override
  String get requestAlreadyPending => 'Uma solicitação já está pendente';

  @override
  String get requestAlreadySentByOther =>
      'Esta pessoa já te enviou uma solicitação';

  @override
  String get addByHashId => 'Adicionar por Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Digite o Hash ID e o código temporário do contato';

  @override
  String get enterTemporaryCode => 'Digite o código de 6 dígitos';

  @override
  String get sendRequest => 'Enviar solicitação';

  @override
  String get acceptContactTitle => 'Aceitar contato';

  @override
  String get acceptContactSubtitle => 'Você pode dar um nome personalizado';

  @override
  String get leaveEmptyForHashId => 'Deixe vazio para usar o Hash ID';

  @override
  String get firstName => 'Nome';

  @override
  String get lastName => 'Sobrenome';

  @override
  String get notes => 'Notas';

  @override
  String get notesHint => 'Notas pessoais sobre este contato';

  @override
  String get photoOptional => 'Foto (opcional)';

  @override
  String get contactNameOptional => 'Nome (opcional)';

  @override
  String get notesOptional => 'Notas (opcional)';

  @override
  String get storedLocally => 'Armazenado apenas no seu dispositivo';

  @override
  String get encryptedMessageLabel => 'Mensagem criptografada';

  @override
  String get identityMessageHint => 'Quem é você? Como vocês se conhecem?';

  @override
  String get messageWillBeSentEncrypted =>
      'Esta mensagem será criptografada e enviada ao destinatário';

  @override
  String get sendRequestButton => 'Enviar solicitação';

  @override
  String get requestExpiresIn24h =>
      'A solicitação expira em 24h se não for aceita';

  @override
  String get theyAlreadySentYouRequest =>
      'Esta pessoa já te enviou uma solicitação';

  @override
  String get requests => 'Solicitações';

  @override
  String get receivedRequests => 'Recebidas';

  @override
  String get sentRequests => 'Enviadas';

  @override
  String get noSentRequests => 'Nenhuma solicitação enviada';

  @override
  String get cancelRequest => 'Cancelar';

  @override
  String get deleteRequest => 'Excluir solicitação';

  @override
  String get requestCancelled => 'Solicitação cancelada';

  @override
  String sentTo(String hashId) {
    return 'Enviada para $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Expira em $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Recebida há $time';
  }

  @override
  String get messageFromRequester => 'Mensagem do solicitante';

  @override
  String get copy => 'Copiar';

  @override
  String get messageInfo => 'Informações da mensagem';

  @override
  String get messageDirection => 'Direção';

  @override
  String get messageSentByYou => 'Enviada por você';

  @override
  String get messageReceived => 'Recebida';

  @override
  String get messageSentAt => 'Enviada em';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Lida em';

  @override
  String get messageType => 'Tipo';

  @override
  String get messageSize => 'Tamanho';

  @override
  String get messageExpiresAt => 'Expira em';

  @override
  String get messageEncrypted => 'Criptografada de ponta a ponta';

  @override
  String get messageStatusSending => 'Enviando...';

  @override
  String get messageStatusSent => 'Enviada';

  @override
  String get messageStatusDelivered => 'Entregue';

  @override
  String get messageStatusRead => 'Lida';

  @override
  String get messageStatusFailed => 'Falhou';

  @override
  String get serverStatus => 'Servidor';

  @override
  String get onServer => 'Aguardando entrega';

  @override
  String get deletedFromServer => 'Excluída';

  @override
  String get messageTypeText => 'Texto';

  @override
  String get messageTypeImage => 'Imagem';

  @override
  String get messageTypeVideo => 'Vídeo';

  @override
  String get messageTypeVoice => 'Áudio';

  @override
  String get messageTypeFile => 'Arquivo';

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
  String get ephemeralMessages => 'Mensagens temporárias';

  @override
  String get ephemeralMessagesDescription =>
      'As mensagens são excluídas automaticamente após este período';

  @override
  String get ephemeralImmediate => 'Imediato (após leitura)';

  @override
  String get ephemeralImmediateDesc => 'Excluída assim que lida';

  @override
  String get ephemeralMyPreference => 'Minha preferência';

  @override
  String get ephemeralMyPreferenceDesc => 'Usar configuração global';

  @override
  String get ephemeralDefaultSetting => 'Duração das mensagens';

  @override
  String get ephemeralChooseDefault => 'Recomendado';

  @override
  String get ephemeral30Seconds => '30 segundos';

  @override
  String get ephemeral30SecondsDesc => 'Excluída 30s após leitura';

  @override
  String get ephemeral5Minutes => '5 minutos';

  @override
  String get ephemeral5MinutesDesc => 'Excluída 5min após leitura';

  @override
  String get ephemeral1Hour => '1 hora';

  @override
  String get ephemeral1HourDesc => 'Excluída 1h após leitura';

  @override
  String get ephemeral3Hours => '3 horas';

  @override
  String get ephemeral6Hours => '6 horas';

  @override
  String get ephemeral6HoursDesc => 'Excluída 6h após leitura';

  @override
  String get ephemeral12Hours => '12 horas';

  @override
  String get ephemeral24Hours => '24 horas';

  @override
  String get ephemeral24HoursDesc => 'Excluída 24h após leitura';

  @override
  String get customDuration => 'Duração personalizada';

  @override
  String get howItWorks => 'Como funciona';

  @override
  String get ephemeralExplanation1 =>
      'As mensagens são excluídas do servidor assim que recebidas.';

  @override
  String get ephemeralExplanation2 =>
      'Esta configuração define quando as mensagens desaparecem do SEU celular após a leitura.';

  @override
  String get ephemeralExplanation3 =>
      'Seu contato tem sua própria configuração para o celular dele.';

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
  String get muteExplanation => 'Você não receberá notificações deste contato';

  @override
  String get showCallsInRecents => 'Mostrar nas chamadas recentes';

  @override
  String get showCallsInRecentsSubtitle =>
      'As chamadas do Hash aparecem no histórico de chamadas do celular';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Silenciar notificações';

  @override
  String get muteDescription => 'Você não receberá notificações deste contato';

  @override
  String mutedUntil(String time) {
    return 'Silenciado até $time';
  }

  @override
  String get notMuted => 'Notificações ativadas';

  @override
  String get unmute => 'Reativar';

  @override
  String get notificationSound => 'Som da notificação';

  @override
  String get defaultSound => 'Padrão';

  @override
  String get chatSettings => 'Configurações da conversa';

  @override
  String get bubbleColor => 'Cor dos balões';

  @override
  String get backgroundColor => 'Cor de fundo';

  @override
  String get backgroundImage => 'Imagem de fundo';

  @override
  String get chatBackground => 'Fundo da conversa';

  @override
  String get customColor => 'Personalizada';

  @override
  String get defaultColor => 'Padrão';

  @override
  String get imageSelected => 'Imagem selecionada';

  @override
  String get noImage => 'Nenhuma imagem';

  @override
  String get color => 'Cor';

  @override
  String get image => 'Imagem';

  @override
  String get tapToSelectImage => 'Toque para selecionar uma imagem';

  @override
  String get changeImage => 'Trocar imagem';

  @override
  String get previewMessageReceived => 'Oi!';

  @override
  String get previewMessageSent => 'E aí!';

  @override
  String get messageAction => 'Mensagem';

  @override
  String get callAction => 'Ligar';

  @override
  String get videoAction => 'Vídeo';

  @override
  String get personalNotes => 'Notas pessoais';

  @override
  String get addNotes => 'Adicionar notas...';

  @override
  String get noNotes => 'Nenhuma nota';

  @override
  String get messageNotifications => 'Notificações de mensagens';

  @override
  String get callNotifications => 'Notificações de chamadas';

  @override
  String get useGradient => 'Usar degradê';

  @override
  String get gradientStart => 'Cor inicial';

  @override
  String get gradientEnd => 'Cor final';

  @override
  String get preview => 'Pré-visualização';

  @override
  String get reset => 'Redefinir';

  @override
  String get securityNumber => 'Número de segurança';

  @override
  String securityNumberDescription(String name) {
    return 'Verifique se o número de segurança corresponde ao dispositivo de $name';
  }

  @override
  String get verifyEncryption => 'Verificar criptografia de ponta a ponta';

  @override
  String get tapToCopy => 'Toque para copiar';

  @override
  String get howToVerify => 'Como verificar';

  @override
  String get verifyStep1 =>
      'Encontre seu contato pessoalmente ou ligue para ele';

  @override
  String get verifyStep2 =>
      'Compare os números de segurança ou escaneie os QR codes';

  @override
  String get verifyStep3 => 'Se forem iguais, sua conversa está segura';

  @override
  String get scanToVerify => 'Escanear para verificar';

  @override
  String get reportSpam => 'Denunciar spam';

  @override
  String get reportSpamSubtitle => 'Denunciar este contato como spam';

  @override
  String get reportSpamDescription =>
      'Isso denunciará anonimamente este contato. Sua identidade não será compartilhada. Tem certeza?';

  @override
  String get report => 'Denunciar';

  @override
  String get spamReported => 'Spam denunciado';

  @override
  String get reportError => 'Falha ao enviar denúncia. Tente novamente.';

  @override
  String get reportRateLimited =>
      'Você atingiu o número máximo de denúncias de hoje.';

  @override
  String get blockContact => 'Bloquear contato';

  @override
  String get blockContactDescription =>
      'Este contato não poderá mais enviar mensagens nem ligar para você. Ele não será notificado.';

  @override
  String get unblockContact => 'Desbloquear contato';

  @override
  String get unblockContactDescription =>
      'Este contato poderá enviar mensagens e ligar para você novamente.';

  @override
  String get contactBlocked => 'Contato bloqueado';

  @override
  String get contactUnblocked => 'Contato desbloqueado';

  @override
  String get contactIsBlocked => 'Este contato está bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get deleteContactSubtitle => 'Excluir este contato e a conversa';

  @override
  String get confirmWithPin => 'Confirmar com PIN';

  @override
  String get enterPinToConfirm => 'Digite seu PIN para confirmar esta ação';

  @override
  String get profilePhoto => 'Foto de perfil';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String get removePhoto => 'Remover foto';

  @override
  String get viewContactHashId => 'Ver identificador do contato';

  @override
  String get hashIdPartiallyMasked =>
      'Parcialmente oculto para sua segurança e a privacidade do seu contato';

  @override
  String get addFirstContact => 'Adicione seu primeiro contato';

  @override
  String get addFirstContactSubtitle =>
      'Compartilhe seu QR code ou escaneie o de um amigo';

  @override
  String get directory => 'Agenda';

  @override
  String get noContacts => 'Nenhum contato';

  @override
  String get noContactsSubtitle => 'Adicione um contato para começar';

  @override
  String get sendMessageAction => 'Enviar mensagem';

  @override
  String get audioCall => 'Chamada de voz';

  @override
  String get videoCall => 'Chamada de vídeo';

  @override
  String get viewProfile => 'Ver perfil';

  @override
  String get deleteContactDirectory => 'Excluir contato';

  @override
  String get scanShort => 'Escanear';

  @override
  String get addShort => 'Adicionar';

  @override
  String deleteContactConfirmName(String name) {
    return 'Tem certeza de que deseja excluir $name?';
  }

  @override
  String get noNotesTitle => 'Nenhuma nota';

  @override
  String get noNotesSubtitle => 'Crie sua primeira nota';

  @override
  String get newNote => 'Nova nota';

  @override
  String get editNote => 'Editar nota';

  @override
  String get deleteNote => 'Excluir nota';

  @override
  String get deleteNoteConfirm =>
      'Tem certeza de que deseja excluir esta nota?';

  @override
  String get noteTitle => 'Título';

  @override
  String get noteContent => 'Conteúdo';

  @override
  String get addItem => 'Adicionar item';

  @override
  String get pinNote => 'Fixar';

  @override
  String get unpinNote => 'Desfixar';

  @override
  String get noteColor => 'Cor';

  @override
  String get notePassword => 'Senha';

  @override
  String get setPassword => 'Definir senha';

  @override
  String get changePassword => 'Alterar senha';

  @override
  String get removePassword => 'Remover senha';

  @override
  String get enterPassword => 'Digite a senha';

  @override
  String get confirmPassword => 'Confirme a senha';

  @override
  String get passwordPin => 'Código PIN';

  @override
  String get passwordText => 'Senha de texto';

  @override
  String get protectedNote => 'Nota protegida';

  @override
  String get incorrectPassword => 'Senha incorreta';

  @override
  String get passwordSet => 'Senha definida';

  @override
  String get passwordRemoved => 'Senha removida';

  @override
  String get notesBiometric => 'Face ID para notas';

  @override
  String get notesBiometricSubtitle =>
      'Exigir autenticação biométrica para abrir notas protegidas';

  @override
  String get textNote => 'Nota de texto';

  @override
  String get checklistNote => 'Lista de tarefas';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tarefas';
  }

  @override
  String get autoSaved => 'Salvo';

  @override
  String get searchNotes => 'Buscar notas';

  @override
  String get legalConsent => 'Consentimento legal';

  @override
  String get confirmAge13 => 'Confirmo que tenho pelo menos 13 anos';

  @override
  String get acceptLegalStart => 'Eu aceito a ';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get termsOfService => 'Termos de Uso';

  @override
  String get andThe => ' e os ';

  @override
  String get continueButton => 'Continuar';

  @override
  String get mustAcceptTerms =>
      'Você precisa aceitar ambas as condições para continuar';

  @override
  String get support => 'Suporte';

  @override
  String get contactSupport => 'Falar com o suporte';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Denunciar abuso';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Jurídico';

  @override
  String get legalEntity => 'Entidade jurídica';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fixar';

  @override
  String get unpinConversation => 'Desfixar';

  @override
  String get hideConversation => 'Remover do feed';

  @override
  String get deleteConversation => 'Excluir conversa';

  @override
  String get deleteConversationConfirm =>
      'Digite seu PIN para confirmar a exclusão de todas as mensagens';

  @override
  String get noConversations => 'Nenhuma conversa ainda';

  @override
  String get startConversation => 'Iniciar';

  @override
  String get microphonePermissionRequired => 'Acesso ao microfone necessário';

  @override
  String get microphonePermissionExplanation =>
      'O Hash precisa do microfone para fazer chamadas.';

  @override
  String get cameraPermissionExplanation =>
      'O Hash precisa da câmera para chamadas de vídeo.';

  @override
  String get openSettings => 'Abrir Configurações';

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
  String get callPaused => 'Pausado';

  @override
  String get callPausedSubtitle => 'A chamada ainda está ativa';

  @override
  String get callRemoteMicMuted => 'Microfone do contato está mudo';

  @override
  String get callMiniControlsMute => 'Silenciar';

  @override
  String get callMiniControlsUnmute => 'Ativar som';

  @override
  String get callMiniControlsHangUp => 'Desligar';

  @override
  String get callMiniControlsReturn => 'Voltar à chamada';

  @override
  String get callNetworkPoor => 'Conexão instável';

  @override
  String get callNetworkLost => 'Conexão perdida';

  @override
  String get callEndedTitle => 'Chamada encerrada';

  @override
  String get deviceData => 'Dados do dispositivo';

  @override
  String get deviceDataSubtitle => 'Armazenamento local e do servidor';

  @override
  String get localStorage => 'Armazenamento local';

  @override
  String get onThisDevice => 'neste dispositivo';

  @override
  String get encryptedDatabases => 'Bancos de dados criptografados';

  @override
  String get files => 'Arquivos';

  @override
  String get secureKeychain => 'Chaveiro seguro';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Nomes, avatares, chaves Signal';

  @override
  String get messagesDetail => 'Conversas criptografadas';

  @override
  String get notesDetail => 'Notas pessoais';

  @override
  String get signalSessions => 'Sessões Signal';

  @override
  String get signalSessionsDetail => 'Sessões de criptografia';

  @override
  String get pendingContacts => 'Contatos pendentes';

  @override
  String get pendingContactsDetail => 'Solicitações pendentes';

  @override
  String get callHistory => 'Chamadas';

  @override
  String get callHistoryDetail => 'Histórico de chamadas';

  @override
  String get preferences => 'Preferências';

  @override
  String get preferencesDetail => 'Preferências de mídia e chamadas';

  @override
  String get avatars => 'Avatares';

  @override
  String get media => 'Mídia';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '1 arquivo',
      zero: 'nenhum arquivo',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Ativo';

  @override
  String get notDefined => 'Não definido';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Frase de recuperação';

  @override
  String get identity => 'Identidade (Hash ID)';

  @override
  String get signalKeys => 'Chaves Signal Protocol';

  @override
  String get authTokens => 'Tokens de autenticação';

  @override
  String get contactNamesCache => 'Cache de nomes de contatos';

  @override
  String get remoteConfig => 'Configuração remota';

  @override
  String get notificationPrefs => 'Preferências de notificações';

  @override
  String get serverData => 'Dados do servidor';

  @override
  String get serverDataInfo =>
      'O Hash mantém o mínimo de dados no servidor, todos criptografados ou temporários.';

  @override
  String get serverProfile => 'Perfil';

  @override
  String get serverProfileDetail =>
      'Hash ID, chaves públicas, token de caixa postal';

  @override
  String get serverPrekeys => 'Pré-chaves';

  @override
  String get serverPrekeysDetail => 'Chaves Signal de uso único (consumidas)';

  @override
  String get serverMessages => 'Mensagens em trânsito';

  @override
  String get serverMessagesDetail => 'Excluídas após recebimento (máx. 24h)';

  @override
  String get serverMedia => 'Mídia em trânsito';

  @override
  String get serverMediaDetail => 'Excluída após download';

  @override
  String get serverContactRequests => 'Solicitações de contato';

  @override
  String get serverContactRequestsDetail => 'Expiram após 24h';

  @override
  String get serverRateLimits => 'Limites de taxa';

  @override
  String get serverRateLimitsDetail => 'Dados temporários anti-abuso';

  @override
  String get privacyReassurance =>
      'O Hash não pode ler suas mensagens. Todos os dados são criptografados de ponta a ponta. Os dados do servidor são excluídos automaticamente.';

  @override
  String get pinTooSimple =>
      'Este PIN é muito simples. Escolha um código mais seguro.';

  @override
  String get genericError => 'Ocorreu um erro. Tente novamente.';

  @override
  String accountCreationError(String error) {
    return 'Não foi possível criar a conta: $error';
  }

  @override
  String get phraseCopiedToClipboard =>
      'Frase copiada para a área de transferência';

  @override
  String get copyPhrase => 'Copiar frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Anote esta frase em um lugar seguro. Se você perder seu PIN sem esta frase, perderá permanentemente o acesso aos seus dados.';

  @override
  String get noMessages => 'Nenhuma mensagem';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Excluir todas as mensagens com $name?';
  }

  @override
  String get confirmation => 'Confirmação';

  @override
  String get untitled => 'Sem título';

  @override
  String get noSessions => 'Nenhuma sessão';

  @override
  String get unknownContact => 'Contato desconhecido';

  @override
  String get unnamed => 'Sem nome';

  @override
  String get noPendingRequestsAlt => 'Nenhuma solicitação pendente';

  @override
  String get deleteAllCallHistory => 'Excluir todo o histórico de chamadas?';

  @override
  String get noCalls => 'Nenhuma chamada';

  @override
  String get noPreferences => 'Nenhuma preferência';

  @override
  String get resetAllMediaPrefs => 'Redefinir todas as preferências de mídia?';

  @override
  String get deleteThisAvatar => 'Excluir este avatar?';

  @override
  String get deleteAllAvatars => 'Excluir todos os avatares?';

  @override
  String get noAvatars => 'Nenhum avatar';

  @override
  String get deleteThisFile => 'Excluir este arquivo?';

  @override
  String get deleteAllMediaFiles => 'Excluir toda a mídia?';

  @override
  String get noMediaFiles => 'Nenhuma mídia';

  @override
  String get outgoing => 'Saída';

  @override
  String get incoming => 'Entrada';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Visualização temporária: ${seconds}s';
  }

  @override
  String get normalView => 'Visualização normal';

  @override
  String get callReasonCompleted => 'Concluída';

  @override
  String get callReasonMissed => 'Perdida';

  @override
  String get callReasonDeclined => 'Recusada';

  @override
  String get callReasonFailed => 'Falhou';

  @override
  String get justNow => 'Agora mesmo';

  @override
  String timeAgoMinutes(int count) {
    return '$count min atrás';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}h atrás';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}d atrás';
  }

  @override
  String get messageTypeContact => 'Contato';

  @override
  String get messageTypeLocation => 'Localização';

  @override
  String get statusQueued => 'Na fila';

  @override
  String get blockedBadge => 'Bloqueado';

  @override
  String get protectedBadge => 'Protegida';

  @override
  String messageCount(int count) {
    return '$count mensagem(ns)';
  }

  @override
  String get deleteQuestion => 'Excluir?';

  @override
  String get transferMyAccountTitle => 'Transferir minha conta';

  @override
  String get loadingError => 'Erro ao carregar';

  @override
  String get transferToNewDevice => 'Transferir para um novo dispositivo';

  @override
  String get transferInstructions =>
      'No seu novo dispositivo, escolha \"Recuperar minha conta\" e insira estas informações:';

  @override
  String get yourHashIdLabel => 'Seu Hash ID';

  @override
  String get enterYourPinCode => 'Digite seu código PIN';

  @override
  String get pinOwnerConfirmation =>
      'Para confirmar que você é o dono desta conta';

  @override
  String get scanThisQrCode => 'Escaneie este QR code';

  @override
  String get withYourNewDevice => 'Com seu novo dispositivo';

  @override
  String get orEnterTheCode => 'ou digite o código';

  @override
  String get transferCodeLabel => 'Código de transferência';

  @override
  String get proximityVerification => 'Verificação de proximidade';

  @override
  String get bringDevicesCloser => 'Aproxime os dois dispositivos';

  @override
  String get confirmTransferQuestion => 'Confirmar a transferência?';

  @override
  String get accountWillBeTransferred =>
      'Sua conta será transferida para o novo dispositivo.\n\nEste dispositivo será desconectado permanentemente.';

  @override
  String get transferComplete => 'Transferência concluída';

  @override
  String get transferSuccessMessage =>
      'Sua conta foi transferida com sucesso.\n\nEste aplicativo será fechado agora.';

  @override
  String get manualVerification => 'Verificação manual';

  @override
  String get codeDisplayedOnBothDevices =>
      'Código exibido nos dois dispositivos:';

  @override
  String get doesCodeMatchNewDevice =>
      'Este código é igual ao do novo dispositivo?';

  @override
  String get verifiedStatus => 'Verificado';

  @override
  String get inProgressStatus => 'Em andamento...';

  @override
  String get notAvailableStatus => 'Não disponível';

  @override
  String get codeExpiredRestart => 'O código expirou. Por favor, reinicie.';

  @override
  String get codesDoNotMatchCancelled =>
      'Os códigos não coincidem. Transferência cancelada.';

  @override
  String transferToDevice(String device) {
    return 'Para: $device';
  }

  @override
  String get copiedExclamation => 'Copiado!';

  @override
  String expiresInTime(String time) {
    return 'Expira em $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometria não disponível neste dispositivo';

  @override
  String get biometricAuthError => 'Erro na autenticação biométrica';

  @override
  String get authenticateForBiometric =>
      'Autentique-se para ativar a biometria';

  @override
  String get biometricAuthFailed => 'Falha na autenticação biométrica';

  @override
  String get forceUpdateTitle => 'Atualização necessária';

  @override
  String get forceUpdateMessage =>
      'Uma nova versão do Hash está disponível. Atualize para continuar.';

  @override
  String get updateButton => 'Atualizar';

  @override
  String get maintenanceInProgress => 'Manutenção em andamento';

  @override
  String get tryAgainLater => 'Tente novamente mais tarde';

  @override
  String get information => 'Informação';

  @override
  String get later => 'Depois';

  @override
  String get doYouLikeHash => 'Você gosta do Hash?';

  @override
  String get yourFeedbackHelps => 'Seu feedback nos ajuda a melhorar o app';

  @override
  String get ratingTerrible => 'Péssimo';

  @override
  String get ratingBad => 'Ruim';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Bom';

  @override
  String get ratingExcellent => 'Excelente!';

  @override
  String get donationMessage =>
      'Hash é um projeto sem fins lucrativos. Seu apoio nos ajuda a continuar construindo um mensageiro verdadeiramente privado.';

  @override
  String get recentConnections => 'Conexões recentes';

  @override
  String get loginInfoText =>
      'Cada desbloqueio por PIN é registrado localmente. Apenas as últimas 24 horas são mantidas.';

  @override
  String get connectionCount => 'Conexão(ões)';

  @override
  String get periodLabel => 'Período';

  @override
  String get historyLabel => 'Histórico';

  @override
  String get noLoginRecorded => 'Nenhum login registrado';

  @override
  String get nextUnlocksAppearHere =>
      'Os próximos desbloqueios aparecerão aqui.';

  @override
  String get dataLocalOnly =>
      'Estes dados são armazenados apenas no seu dispositivo e nunca são transmitidos.';

  @override
  String get currentSession => 'Atual';

  @override
  String get todayLabel => 'Hoje';

  @override
  String get yesterdayLabel => 'Ontem';

  @override
  String get justNowLabel => 'Agora mesmo';

  @override
  String minutesAgoLabel(int count) {
    return '$count min atrás';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}h atrás';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}h ${minutes}min atrás';
  }

  @override
  String get noMaintenancePlanned => 'Nenhuma manutenção planejada';

  @override
  String get everythingWorkingNormally => 'Tudo funcionando normalmente';

  @override
  String get maintenanceTitle => 'Manutenção';

  @override
  String get maintenanceActiveLabel => 'EM ANDAMENTO';

  @override
  String get maintenancePlannedLabel => 'PLANEJADA';

  @override
  String get locking => 'Bloqueando...';

  @override
  String get newMessageNotification => 'Nova mensagem';

  @override
  String get secExplainTitle => 'Como o Hash protege você';

  @override
  String get secExplainIntro =>
      'O Hash foi projetado para que ninguém possa ler suas mensagens.';

  @override
  String get secExplainIntroSub =>
      'Nem mesmo nós.\nVeja como funciona, explicado de forma simples.';

  @override
  String get secJourneyLabel => 'A JORNADA';

  @override
  String get secJourneyTitle => 'A jornada da sua mensagem';

  @override
  String get secJourneySubtitle =>
      'Do seu dedo até a tela do seu contato, cada etapa é protegida. Siga o caminho.';

  @override
  String get secStep1Title => 'Você escreve sua mensagem';

  @override
  String get secStep1Desc =>
      'Você digita \"Oi!\" no app. Neste momento, a mensagem existe apenas na memória do seu celular. Nada foi enviado.';

  @override
  String get secStep2Title => 'Criptografia com Signal Protocol';

  @override
  String get secStep2Desc =>
      'Assim que você aperta \"Enviar\", sua mensagem é transformada em uma sequência de caracteres incompreensíveis. É como se sua mensagem fosse trancada em um cofre cuja chave só o seu contato possui.';

  @override
  String get secStep3Title => 'Sealed Sender: o envelope invisível';

  @override
  String get secStep3Desc =>
      'Imagine enviar uma carta pelo correio, mas sem endereço de remetente no envelope. É exatamente o que o Hash faz. A mensagem é depositada em uma caixa postal anônima. O servidor não sabe quem enviou.';

  @override
  String get secStep4Title => 'O servidor não vê nada';

  @override
  String get secStep4Desc =>
      'O servidor age como um carteiro cego. Ele só sabe que \"alguém deixou algo na caixa postal #A7X9\". Não sabe quem enviou, o que é, nem para quem é.';

  @override
  String get secStep4Highlight =>
      'Nenhum metadado armazenado: sem endereço IP, sem registro de tempo, sem vínculo entre remetente e destinatário.';

  @override
  String get secStep5Title => 'Seu contato recebe a mensagem';

  @override
  String get secStep5Desc =>
      'O celular do seu contato busca o conteúdo da caixa postal anônima e descriptografa a mensagem com sua chave privada, que nunca saiu do dispositivo. \"Oi!\" aparece na tela dele.';

  @override
  String get secStep6Title => 'A mensagem desaparece do servidor';

  @override
  String get secStep6Desc =>
      'Assim que seu contato confirma o recebimento, o servidor exclui permanentemente a mensagem. Sem lixeira, sem arquivo, sem backup. Mensagens não lidas são automaticamente destruídas após 24 horas.';

  @override
  String get secStep7Title => 'Expiração local';

  @override
  String get secStep7Desc =>
      'No celular do seu contato, a mensagem se autodestrói de acordo com o tempo que você escolheu: imediatamente após a leitura, 5 minutos, 1 hora... você decide.';

  @override
  String get secJourneyConclusion =>
      'Resultado: zero rastro no servidor, zero rastro nos dispositivos. A mensagem existiu apenas o tempo necessário para ser lida, depois desapareceu.';

  @override
  String get secArchLabel => 'ARQUITETURA';

  @override
  String get secArchTitle => '5 camadas de proteção';

  @override
  String get secArchSubtitle =>
      'O Hash não depende de uma única tecnologia. Cada camada reforça as outras. Mesmo que uma camada seja comprometida, seus dados permanecem seguros.';

  @override
  String get secLayer1Title => 'Criptografia de ponta a ponta';

  @override
  String get secLayer1Desc =>
      'Cada mensagem é criptografada com uma chave única. Em termos simples: mesmo que alguém descriptografe uma mensagem, não conseguirá descriptografar a próxima. Cada mensagem tem seu próprio cadeado.';

  @override
  String get secLayer1Detail =>
      'Para arquivos (fotos, vídeos, documentos), o Hash usa criptografia AES-256-GCM adicional. O arquivo é criptografado antes de sair do seu celular.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimato na rede)';

  @override
  String get secLayer2Desc =>
      'Mensageiros comuns enviam suas mensagens com sua identidade anexada. É como escrever seu nome no envelope. O Hash usa caixas postais anônimas: o servidor entrega a mensagem sem saber quem enviou.';

  @override
  String get secLayer2Detail =>
      'Resultado: mesmo em caso de vazamento de dados do servidor, é impossível reconstruir quem fala com quem.';

  @override
  String get secLayer3Title => 'Exclusão automática';

  @override
  String get secLayer3Desc =>
      'As mensagens são excluídas do servidor assim que o recebimento é confirmado. Mesmo que uma mensagem nunca seja recuperada, ela é automaticamente destruída após 24 horas.';

  @override
  String get secLayer3Detail =>
      'No seu celular, as mensagens se autodestroem de acordo com o tempo que você escolher: imediatamente, 5 min, 15 min, 30 min, 1h, 3h, 6h ou 12h.';

  @override
  String get secLayer4Title => 'Proteção de acesso local';

  @override
  String get secLayer4Desc =>
      'O app é protegido por um PIN de 6 dígitos e/ou biometria (Face ID, impressão digital). Após muitas tentativas falhas, o app bloqueia com um atraso crescente a cada falha.';

  @override
  String get secLayer5Title => 'Banco de dados bloqueado';

  @override
  String get secLayer5Desc =>
      'No lado do servidor, nenhum usuário pode escrever diretamente no banco de dados. Todas as ações passam por funções seguras que verificam cada solicitação.';

  @override
  String get secLayer5Detail =>
      'É como um caixa de banco: você nunca toca no cofre. Você faz uma solicitação e o sistema verifica se você tem permissão antes de agir.';

  @override
  String get secVashLabel => 'ÚNICO NO MUNDO';

  @override
  String get secVashTitle => 'Modo Vash';

  @override
  String get secVashSubtitle =>
      'Um sistema de segurança de emergência que não existe em nenhum outro mensageiro.';

  @override
  String get secVashScenarioTitle => 'Imagine esta situação';

  @override
  String get secVashScenario1 => 'Alguém acessa seu celular';

  @override
  String get secVashScenario2 => 'Pedem seu código PIN';

  @override
  String get secVashScenario3 =>
      'Você quer apagar todos os seus dados urgentemente';

  @override
  String get secVashSolutionTitle => 'A solução: dois códigos PIN';

  @override
  String get secVashSolutionDesc =>
      'Você configura dois códigos PIN diferentes no Hash:';

  @override
  String get secVashNormalCodeLabel => 'Código normal';

  @override
  String get secVashNormalCodeDesc =>
      'Abre o app normalmente com todos os seus dados';

  @override
  String get secVashCodeLabel2 => 'Código Vash';

  @override
  String get secVashCodeDescription =>
      'Abre o app normalmente... mas todos os seus dados são silenciosamente excluídos em segundo plano';

  @override
  String get secVashWhatHappensTitle => 'O que acontece depois';

  @override
  String get secVashWhatHappensDesc =>
      'O app abre normalmente. Sem alerta, sem animação suspeita. A tela simplesmente mostra um app vazio, como se você tivesse acabado de instalar.\n\nNa realidade, todas as suas conversas, contatos e mensagens foram irreversivelmente excluídos em uma fração de segundo.';

  @override
  String get secCallsLabel => 'CHAMADAS E ARQUIVOS';

  @override
  String get secCallsTitle => 'Tudo é criptografado';

  @override
  String get secCallsSubtitle =>
      'Não são só as mensagens. Absolutamente tudo que passa pelo Hash é criptografado de ponta a ponta.';

  @override
  String get secAudioCallTitle => 'Chamadas de voz';

  @override
  String get secAudioCallDesc =>
      'Criptografadas de ponta a ponta via WebRTC. A voz é transmitida diretamente entre os dispositivos.';

  @override
  String get secVideoCallTitle => 'Chamadas de vídeo';

  @override
  String get secVideoCallDesc =>
      'Mesma tecnologia, cada stream criptografado individualmente.';

  @override
  String get secPhotosTitle => 'Fotos e vídeos';

  @override
  String get secPhotosDesc =>
      'Criptografados em AES-256-GCM antes de sair do seu celular.';

  @override
  String get secDocsTitle => 'Documentos';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, qualquer arquivo. Nome, tamanho e conteúdo criptografados.';

  @override
  String get secAnonLabel => 'ANONIMATO';

  @override
  String get secAnonTitle => 'Nenhuma identidade necessária';

  @override
  String get secAnonSubtitle =>
      'O Hash nunca pede seu número de telefone ou e-mail. Você é identificado por um Hash ID único e anônimo.';

  @override
  String get secHashIdTitle => 'Seu Hash ID';

  @override
  String get secHashIdDesc =>
      'Este é seu identificador único. Ele não revela nada sobre você: nem seu nome, nem seu número, nem sua localização. É como um pseudônimo impossível de vincular à sua identidade real.\n\nPara adicionar um contato, você compartilha seu Hash ID ou escaneia um QR code. É isso. Sem agenda sincronizada, sem sugestões de \"Pessoas que você pode conhecer\".';

  @override
  String get secDataLabel => 'DADOS';

  @override
  String get secDataTitle => 'O que o Hash não sabe';

  @override
  String get secDataSubtitle =>
      'A melhor forma de proteger seus dados é não coletá-los.';

  @override
  String get secNeverCollected => 'Nunca coletados';

  @override
  String get secNeverItem1 => 'Conteúdo das mensagens';

  @override
  String get secNeverItem2 => 'Lista de contatos';

  @override
  String get secNeverItem3 => 'Número de telefone';

  @override
  String get secNeverItem4 => 'Endereço de e-mail';

  @override
  String get secNeverItem5 => 'Endereço IP';

  @override
  String get secNeverItem6 => 'Localização';

  @override
  String get secNeverItem7 => 'Metadados (quem fala com quem)';

  @override
  String get secNeverItem8 => 'Histórico de chamadas';

  @override
  String get secNeverItem9 => 'Agenda de contatos';

  @override
  String get secNeverItem10 => 'Identificadores de publicidade';

  @override
  String get secTempStored => 'Armazenados temporariamente';

  @override
  String get secTempItem1 => 'Hash ID anônimo (identificador único)';

  @override
  String get secTempItem2 => 'Chaves públicas de criptografia';

  @override
  String get secTempItem3 => 'Mensagens criptografadas em trânsito (máx. 24h)';

  @override
  String get secTempNote =>
      'Mesmo esses dados mínimos não podem identificar você. Seu Hash ID não está vinculado a nenhuma informação pessoal.';

  @override
  String get secFooterTitle => 'Sua privacidade, sua liberdade';

  @override
  String get secFooterDesc =>
      'O Hash usa as mesmas tecnologias de criptografia dos aplicativos profissionais mais exigentes. Suas mensagens são protegidas por matemática, não por promessas.';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero Rasto. Zero Compromisso.';

  @override
  String get conversations => 'Conversas';

  @override
  String get contacts => 'Contactos';

  @override
  String get noConversation => 'Sem conversas';

  @override
  String get noConversationSubtitle =>
      'Adicione um contacto para comecar a conversar em seguranca';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pedidos pendentes',
      one: '1 pedido pendente',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pedidos enviados pendentes',
      one: '1 pedido enviado pendente',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Adicionar contacto';

  @override
  String get shareApp => 'Partilhar aplicacao';

  @override
  String get newMessage => 'Nova mensagem';

  @override
  String get newConversation => 'Enviar uma mensagem';

  @override
  String get settings => 'Definicoes';

  @override
  String get myHashId => 'O meu Hash ID';

  @override
  String get supportHash => 'Apoiar o Hash';

  @override
  String get supportHashSubtitle => 'O Hash e um projeto sem fins lucrativos';

  @override
  String get donate => 'Fazer um donativo';

  @override
  String get appearance => 'Aparencia';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatico';

  @override
  String get themeAutoSubtitle => 'Segue as definicoes do sistema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeRecommendation =>
      'O tema escuro e recomendado para maior privacidade';

  @override
  String get language => 'Idioma';

  @override
  String get languageAuto => 'Automatico (sistema)';

  @override
  String get notifications => 'Notificacoes';

  @override
  String get messages => 'Mensagens';

  @override
  String get calls => 'Chamadas';

  @override
  String get vibration => 'Vibracao';

  @override
  String get notificationContent => 'Conteudo das notificacoes';

  @override
  String get notificationContentFull => 'Mostrar tudo';

  @override
  String get notificationContentFullDesc =>
      'Nome do contacto e pre-visualizacao da mensagem';

  @override
  String get notificationContentName => 'Apenas o nome';

  @override
  String get notificationContentNameDesc => 'Mostra apenas o nome do contacto';

  @override
  String get notificationContentDiscrete => 'Discreto';

  @override
  String get notificationContentDiscreteDesc =>
      'Mostra apenas \"Nova mensagem\"';

  @override
  String get security => 'Seguranca';

  @override
  String get howHashProtectsYou => 'Como o Hash te protege';

  @override
  String get howHashProtectsYouSubtitle => 'Compreende a tua seguranca';

  @override
  String get accountSecurity => 'Seguranca da conta';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, Modo Vash';

  @override
  String get blockScreenshots => 'Bloquear capturas de ecra';

  @override
  String get transferDevice => 'Transferir para outro dispositivo';

  @override
  String get transferDeviceSubtitle => 'Migrar a sua conta';

  @override
  String get pinCode => 'Codigo PIN';

  @override
  String get changePin => 'Alterar codigo PIN';

  @override
  String get currentPin => 'Codigo PIN atual';

  @override
  String get newPin => 'Novo codigo PIN';

  @override
  String get confirmPin => 'Confirmar codigo PIN';

  @override
  String get pinChanged => 'Codigo PIN alterado';

  @override
  String get incorrectPin => 'PIN incorreto';

  @override
  String get pinsDoNotMatch => 'Os codigos nao correspondem';

  @override
  String get autoLock => 'Bloqueio automatico';

  @override
  String get autoLockDelay => 'Atraso do bloqueio';

  @override
  String get autoLockImmediate => 'Imediato';

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
  String get vashModeExplanation => 'A sua rede de seguranca definitiva.';

  @override
  String get vashModeDescription =>
      'Vai escolher um segundo codigo PIN. Se algum dia for obrigado a abrir o Hash, introduza este codigo em vez do seu PIN habitual.\n\nA aplicacao abrira normalmente, mas todas as suas conversas e contactos terao desaparecido.\n\nPara qualquer pessoa a olhar para o seu ecra, o Hash simplesmente parece vazio — como se nunca o tivesse utilizado.';

  @override
  String get vashModeIrreversible => 'Esta acao e silenciosa e irreversivel.';

  @override
  String get chooseVashCode => 'Escolher o meu codigo Vash';

  @override
  String get vashCodeInfo =>
      'Um segundo codigo PIN que abre a aplicacao normalmente, mas vazia.';

  @override
  String get vashCodeInfoDetail =>
      'Se introduzir este codigo em vez do seu PIN:';

  @override
  String get vashDeleteContacts => 'Os seus contactos desaparecem';

  @override
  String get vashDeleteMessages => 'As suas conversas desaparecem';

  @override
  String get vashDeleteHistory => 'As suas notas desaparecem';

  @override
  String get vashKeepId =>
      'A sua identidade Hash (#XXX-XXX-XXX) permanece a mesma';

  @override
  String get vashAppearNormal =>
      'A aplicacao parece normal mas vazia, como nova. Esta acao e irreversivel.';

  @override
  String get setupVashCode => 'Configurar codigo Vash';

  @override
  String get modifyVashCode => 'Modificar codigo Vash';

  @override
  String get currentVashCode => 'Codigo Vash atual';

  @override
  String get newVashCode => 'Novo codigo Vash';

  @override
  String get confirmVashCode => 'Confirmar codigo Vash';

  @override
  String get vashCodeConfigured => 'Codigo Vash configurado';

  @override
  String get vashCodeModified => 'Codigo Vash modificado';

  @override
  String get vashCodeMustDiffer => 'O codigo Vash deve ser diferente do PIN';

  @override
  String get incorrectVashCode => 'Codigo Vash incorreto';

  @override
  String get vashWhatToDelete => 'O que deve o Modo Vash fazer desaparecer?';

  @override
  String get vashDeleteContactsOption => 'Contactos';

  @override
  String get vashDeleteMessagesOption => 'Mensagens';

  @override
  String get vashDeleteNotesOption => 'Notas';

  @override
  String get vashActivated => 'Modo Vash ativado';

  @override
  String get vashCreateSubtitle =>
      'Escolha um codigo diferente do seu PIN principal';

  @override
  String get vashConfirmSubtitle => 'Confirme o seu codigo Vash';

  @override
  String get pinCodeForEntry => 'Codigo PIN para entrar na aplicacao';

  @override
  String get vashCodeSection => 'Modo Vash';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Desbloquear com impressao digital ou Face ID';

  @override
  String get enableBiometric => 'Ativar biometria';

  @override
  String get biometricWarningMessage =>
      'Ao ativar a biometria, nao podera utilizar o seu codigo Vash para entrar na aplicacao.\n\nSo podera utilizar o codigo Vash se a biometria falhar (apos varias tentativas falhadas).\n\nTem a certeza de que quer continuar?';

  @override
  String get understood => 'Compreendi';

  @override
  String get shareAppSubtitle => 'Partilhe o Hash com os seus proximos';

  @override
  String get share => 'Partilhar';

  @override
  String get danger => 'Perigo';

  @override
  String get deleteAccount => 'Apagar a minha conta';

  @override
  String get deleteAccountSubtitle => 'Acao irreversivel';

  @override
  String get deleteAccountConfirmTitle => 'Apagar a minha conta';

  @override
  String get deleteAccountConfirmMessage =>
      'A sua conta sera permanentemente apagada. Esta acao e irreversivel.\n\n- Todas as suas conversas\n- Todos os seus contactos\n- O seu Hash ID\n\nTera de criar uma nova conta.';

  @override
  String get deleteForever => 'Apagar permanentemente';

  @override
  String get cancel => 'Cancelar';

  @override
  String get dataDeletedForSecurity => 'Modo Vash ativado.';

  @override
  String deletionError(String error) {
    return 'Erro ao apagar: $error';
  }

  @override
  String get yourSecurity => 'A sua seguranca';

  @override
  String get securityInfo =>
      '- Encriptacao ponta a ponta (Signal Protocol)\n- Sem dados nos nossos servidores apos entrega\n- Chaves armazenadas apenas no seu dispositivo\n- Codigo PIN nunca enviado para o servidor';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Bem-vindo';

  @override
  String get securityStatement1 => 'As suas mensagens estao protegidas.';

  @override
  String get securityStatement2 => 'Encriptacao ponta a ponta.';

  @override
  String get securityStatement3 => 'Sem rasto. Sem compromisso.';

  @override
  String get securityStatement4 => 'A sua privacidade e um direito.';

  @override
  String get accessBlocked => 'Acesso bloqueado';

  @override
  String get tooManyAttempts => 'Demasiadas tentativas. Tente mais tarde.';

  @override
  String get pleaseWait => 'Aguarde';

  @override
  String get waitDelay => 'Aguarde o fim do atraso';

  @override
  String attemptCount(int current, int max) {
    return 'Tentativa $current de $max';
  }

  @override
  String retryIn(String time) {
    return 'Tentar novamente em $time';
  }

  @override
  String get forgotPin => 'Esqueceu o PIN? Use a frase de recuperacao';

  @override
  String get useRecoveryPhrase => 'Usar frase de recuperacao';

  @override
  String get recoveryWarningTitle => 'Aviso';

  @override
  String get recoveryWarningMessage => 'A recuperacao da conta ira:';

  @override
  String get recoveryDeleteAllMessages => 'Apagar TODAS as suas mensagens';

  @override
  String get recoveryWaitDelay => 'Requerer um atraso de 1 hora';

  @override
  String get recoveryKeepContacts => 'Manter os seus contactos';

  @override
  String get recoveryIrreversible =>
      'Esta acao e irreversivel. As suas mensagens serao permanentemente perdidas.';

  @override
  String get iUnderstand => 'Compreendo';

  @override
  String get accountRecovery => 'Recuperacao de conta';

  @override
  String get enterRecoveryPhrase =>
      'Introduza as 24 palavras da sua frase de recuperacao, separadas por espacos.';

  @override
  String get recoveryPhraseHint => 'palavra1 palavra2 palavra3 ...';

  @override
  String get recover => 'Recuperar';

  @override
  String get recoveryPhraseRequired => 'Introduza a sua frase de recuperacao';

  @override
  String get recoveryPhrase24Words =>
      'A frase deve conter exatamente 24 palavras';

  @override
  String get incorrectRecoveryPhrase => 'Frase de recuperacao incorreta';

  @override
  String get recoveryInitError => 'Erro ao iniciar a recuperacao';

  @override
  String get securityDelay => 'Atraso de seguranca';

  @override
  String get securityDelayMessage =>
      'Para a sua seguranca, e necessario um periodo de espera antes de poder criar um novo PIN.';

  @override
  String get timeRemaining => 'Tempo restante';

  @override
  String get messagesDeletedForProtection =>
      'As suas mensagens foram apagadas para sua protecao.';

  @override
  String get canCloseApp => 'Pode fechar a aplicacao e voltar mais tarde.';

  @override
  String get onboardingTitle1 => 'Bem-vindo ao Hash';

  @override
  String get onboardingSubtitle1 => 'O mensageiro que nao deixa rasto';

  @override
  String get onboardingTitle2 => 'Encriptacao total';

  @override
  String get onboardingSubtitle2 =>
      'As suas mensagens sao encriptadas ponta a ponta com o protocolo Signal';

  @override
  String get onboardingTitle3 => 'Sem rasto';

  @override
  String get onboardingSubtitle3 =>
      'As mensagens sao apagadas dos servidores apos a entrega';

  @override
  String get onboardingTitle4 => 'A sua seguranca';

  @override
  String get onboardingSubtitle4 =>
      'Codigo PIN, Modo Vash e frase de recuperacao';

  @override
  String get getStarted => 'Comecar';

  @override
  String get next => 'Seguinte';

  @override
  String get skip => 'Saltar';

  @override
  String get alreadyHaveAccount => 'Ja tenho uma conta';

  @override
  String get transferMyAccount => 'Transferir a minha conta';

  @override
  String get createPin => 'Criar um codigo PIN';

  @override
  String get createPinSubtitle =>
      'Este codigo protegera o acesso a sua aplicacao';

  @override
  String get confirmYourPin => 'Confirme o seu codigo PIN';

  @override
  String get confirmPinSubtitle => 'Introduza novamente o seu codigo PIN';

  @override
  String get saveRecoveryPhrase => 'Frase de recuperacao';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Anote estas 24 palavras por ordem. Permitirao recuperar a sua conta se esquecer o PIN.';

  @override
  String get phraseWritten => 'Anotei a minha frase';

  @override
  String get warningRecoveryPhrase =>
      'Se perder esta frase e esquecer o seu PIN, perdera o acesso a sua conta.';

  @override
  String get accountTransferred => 'Conta transferida';

  @override
  String get accountTransferredMessage =>
      'A sua conta foi transferida para outro dispositivo. Esta sessao ja nao e valida.';

  @override
  String get accountTransferredInfo =>
      'Se nao iniciou esta transferencia, a sua conta pode ter sido comprometida.';

  @override
  String get logout => 'Terminar sessao';

  @override
  String get transferAccount => 'Transferir conta';

  @override
  String get transferAccountInfo =>
      'Transfira a sua conta Hash para um novo dispositivo. A sua sessao atual sera invalidada.';

  @override
  String get generateTransferCode => 'Gerar codigo de transferencia';

  @override
  String get transferCode => 'Codigo de transferencia';

  @override
  String transferCodeExpires(int minutes) {
    return 'Este codigo expira em $minutes minutos';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Introduza este codigo no seu novo dispositivo para transferir a sua conta.';

  @override
  String get generateNewCode => 'Gerar novo codigo';

  @override
  String get scanQrCode => 'Ler codigo QR';

  @override
  String get scanQrCodeSubtitle =>
      'Leia o codigo QR de um contacto para o adicionar';

  @override
  String get qrCodeDetected => 'Codigo QR detetado';

  @override
  String get invalidQrCode => 'Codigo QR invalido';

  @override
  String get cameraPermissionRequired => 'Permissao da camara necessaria';

  @override
  String get myQrCode => 'O meu codigo QR';

  @override
  String get myQrCodeSubtitle =>
      'Partilhe este codigo QR para que os seus contactos o possam adicionar';

  @override
  String get shareQrCode => 'Partilhar';

  @override
  String get addContactTitle => 'Adicionar contacto';

  @override
  String get addContactByHashId => 'Introduza o Hash ID do seu contacto';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Procurar';

  @override
  String get contactNotFound => 'Contacto nao encontrado';

  @override
  String get contactAlreadyAdded => 'Este contacto ja esta na sua lista';

  @override
  String get contactAdded => 'Contacto adicionado';

  @override
  String get myProfile => 'O meu perfil';

  @override
  String get myProfileSubtitle =>
      'Partilhe estas informacoes para que possam adiciona-lo';

  @override
  String get temporaryCode => 'Codigo temporario';

  @override
  String temporaryCodeExpires(String time) {
    return 'Expira em $time';
  }

  @override
  String get codeExpired => 'Codigo expirado';

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
  String get openScanner => 'Abrir leitor';

  @override
  String get addManually => 'Adicionar manualmente';

  @override
  String get contactHashIdLabel => 'Hash ID do contacto';

  @override
  String get temporaryCodeLabel => 'Codigo temporario';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Peca ao seu contacto para gerar um codigo a partir do perfil';

  @override
  String get verifyAndAdd => 'Verificar e adicionar';

  @override
  String get fillAllFields => 'Preencha todos os campos';

  @override
  String get invalidHashIdFormat => 'Formato de ID invalido (ex: 123-456-ABC)';

  @override
  String get userNotFound => 'Utilizador nao encontrado';

  @override
  String get cannotAddYourself => 'Nao se pode adicionar a si proprio';

  @override
  String get invalidOrExpiredCode => 'Codigo temporario invalido ou expirado';

  @override
  String get contactFound => 'Contacto encontrado!';

  @override
  String get howToCallContact => 'Como gostaria de o chamar?';

  @override
  String get contactNameHint => 'Nome do contacto';

  @override
  String get addContactButton => 'Adicionar';

  @override
  String get contactDetails => 'Detalhes do contacto';

  @override
  String get contactName => 'Nome do contacto';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Adicionado a $date';
  }

  @override
  String get deleteContact => 'Apagar contacto';

  @override
  String deleteContactConfirm(Object name) {
    return 'Apagar este contacto?';
  }

  @override
  String get deleteContactMessage => 'Isto tambem ira apagar toda a conversa.';

  @override
  String get delete => 'Apagar';

  @override
  String get typeMessage => 'Escreva uma mensagem...';

  @override
  String get messageSent => 'Enviada';

  @override
  String get messageDelivered => 'Entregue';

  @override
  String get messageRead => 'Lida';

  @override
  String get messageFailed => 'Falha no envio';

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
  String get today => 'Hoje';

  @override
  String get yesterday => 'Ontem';

  @override
  String dateAtTime(String date, String time) {
    return '$date as $time';
  }

  @override
  String get shareMessage =>
      'Junta-te a mim no Hash! 🔒\n\nE um mensageiro verdadeiramente privado: encriptacao total, sem rasto nos servidores e modo panico se necessario.\n\nTransfere a aplicacao aqui 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Erro';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Ver';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Nao';

  @override
  String get save => 'Guardar';

  @override
  String get edit => 'Editar';

  @override
  String get close => 'Fechar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get loading => 'A carregar...';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get pendingRequests => 'Pedidos pendentes';

  @override
  String get noPendingRequests => 'Sem pedidos pendentes';

  @override
  String get pendingRequestsSubtitle => 'Estas pessoas querem adiciona-lo';

  @override
  String requestFromUser(String hashId) {
    return 'Pedido de $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Expira em $days dias';
  }

  @override
  String get acceptRequest => 'Aceitar';

  @override
  String get rejectRequest => 'Rejeitar';

  @override
  String get requestAccepted => 'Pedido aceite';

  @override
  String get requestRejected => 'Pedido rejeitado';

  @override
  String get requestSent => 'Pedido enviado!';

  @override
  String get requestSentSubtitle =>
      'O seu pedido foi enviado. O utilizador deve aceita-lo antes de poderem conversar.';

  @override
  String get requestAlreadyPending => 'Ja existe um pedido pendente';

  @override
  String get requestAlreadySentByOther => 'Esta pessoa ja lhe enviou um pedido';

  @override
  String get addByHashId => 'Adicionar por Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Introduza o Hash ID e o codigo temporario do contacto';

  @override
  String get enterTemporaryCode => 'Introduza o codigo de 6 digitos';

  @override
  String get sendRequest => 'Enviar pedido';

  @override
  String get acceptContactTitle => 'Aceitar contacto';

  @override
  String get acceptContactSubtitle => 'Pode dar-lhe um nome personalizado';

  @override
  String get leaveEmptyForHashId => 'Deixe vazio para usar o Hash ID';

  @override
  String get firstName => 'Nome';

  @override
  String get lastName => 'Apelido';

  @override
  String get notes => 'Notas';

  @override
  String get notesHint => 'Notas pessoais sobre este contacto';

  @override
  String get photoOptional => 'Fotografia (opcional)';

  @override
  String get contactNameOptional => 'Nome (opcional)';

  @override
  String get notesOptional => 'Notas (opcional)';

  @override
  String get storedLocally => 'Armazenado apenas no seu dispositivo';

  @override
  String get encryptedMessageLabel => 'Mensagem encriptada';

  @override
  String get identityMessageHint => 'Quem e? Como se conhecem?';

  @override
  String get messageWillBeSentEncrypted =>
      'Esta mensagem sera encriptada e enviada ao destinatario';

  @override
  String get sendRequestButton => 'Enviar pedido';

  @override
  String get requestExpiresIn24h => 'O pedido expira em 24h se nao for aceite';

  @override
  String get theyAlreadySentYouRequest => 'Esta pessoa ja lhe enviou um pedido';

  @override
  String get requests => 'Pedidos';

  @override
  String get receivedRequests => 'Recebidos';

  @override
  String get sentRequests => 'Enviados';

  @override
  String get noSentRequests => 'Sem pedidos enviados';

  @override
  String get cancelRequest => 'Cancelar';

  @override
  String get deleteRequest => 'Apagar pedido';

  @override
  String get requestCancelled => 'Pedido cancelado';

  @override
  String sentTo(String hashId) {
    return 'Enviado para $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Expira em $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Recebido ha $time';
  }

  @override
  String get messageFromRequester => 'Mensagem do remetente';

  @override
  String get copy => 'Copiar';

  @override
  String get messageInfo => 'Informacoes da mensagem';

  @override
  String get messageDirection => 'Direcao';

  @override
  String get messageSentByYou => 'Enviada por si';

  @override
  String get messageReceived => 'Recebida';

  @override
  String get messageSentAt => 'Enviada a';

  @override
  String get messageStatus => 'Estado';

  @override
  String get messageReadAt => 'Lida a';

  @override
  String get messageType => 'Tipo';

  @override
  String get messageSize => 'Tamanho';

  @override
  String get messageExpiresAt => 'Expira a';

  @override
  String get messageEncrypted => 'Encriptada ponta a ponta';

  @override
  String get messageStatusSending => 'A enviar...';

  @override
  String get messageStatusSent => 'Enviada';

  @override
  String get messageStatusDelivered => 'Entregue';

  @override
  String get messageStatusRead => 'Lida';

  @override
  String get messageStatusFailed => 'Falhou';

  @override
  String get serverStatus => 'Servidor';

  @override
  String get onServer => 'A aguardar entrega';

  @override
  String get deletedFromServer => 'Apagada';

  @override
  String get messageTypeText => 'Texto';

  @override
  String get messageTypeImage => 'Imagem';

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
  String get ephemeralMessages => 'Mensagens efemeras';

  @override
  String get ephemeralMessagesDescription =>
      'As mensagens sao automaticamente apagadas apos este periodo';

  @override
  String get ephemeralImmediate => 'Imediato (apos leitura)';

  @override
  String get ephemeralImmediateDesc => 'Apagada assim que lida';

  @override
  String get ephemeralMyPreference => 'A minha preferencia';

  @override
  String get ephemeralMyPreferenceDesc => 'Usar definicao global';

  @override
  String get ephemeralDefaultSetting => 'Duracao das mensagens';

  @override
  String get ephemeralChooseDefault => 'Recomendado';

  @override
  String get ephemeral30Seconds => '30 segundos';

  @override
  String get ephemeral30SecondsDesc => 'Apagada 30s apos leitura';

  @override
  String get ephemeral5Minutes => '5 minutos';

  @override
  String get ephemeral5MinutesDesc => 'Apagada 5min apos leitura';

  @override
  String get ephemeral1Hour => '1 hora';

  @override
  String get ephemeral1HourDesc => 'Apagada 1h apos leitura';

  @override
  String get ephemeral3Hours => '3 horas';

  @override
  String get ephemeral6Hours => '6 horas';

  @override
  String get ephemeral6HoursDesc => 'Apagada 6h apos leitura';

  @override
  String get ephemeral12Hours => '12 horas';

  @override
  String get ephemeral24Hours => '24 horas';

  @override
  String get ephemeral24HoursDesc => 'Apagada 24h apos leitura';

  @override
  String get customDuration => 'Duracao personalizada';

  @override
  String get howItWorks => 'Como funciona';

  @override
  String get ephemeralExplanation1 =>
      'As mensagens sao apagadas do servidor assim que recebidas.';

  @override
  String get ephemeralExplanation2 =>
      'Esta definicao define quando as mensagens desaparecem do SEU telefone apos a leitura.';

  @override
  String get ephemeralExplanation3 =>
      'O seu contacto tem a sua propria definicao para o seu telefone.';

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
  String get muteExplanation => 'Nao recebera notificacoes deste contacto';

  @override
  String get showCallsInRecents => 'Mostrar nas chamadas recentes';

  @override
  String get showCallsInRecentsSubtitle =>
      'As chamadas Hash aparecem no historico de chamadas do telefone';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Silenciar notificacoes';

  @override
  String get muteDescription => 'Nao recebera notificacoes deste contacto';

  @override
  String mutedUntil(String time) {
    return 'Silenciado ate $time';
  }

  @override
  String get notMuted => 'Notificacoes ativadas';

  @override
  String get unmute => 'Reativar';

  @override
  String get notificationSound => 'Som de notificacao';

  @override
  String get defaultSound => 'Predefinido';

  @override
  String get chatSettings => 'Definicoes da conversa';

  @override
  String get bubbleColor => 'Cor dos baloes';

  @override
  String get backgroundColor => 'Cor de fundo';

  @override
  String get backgroundImage => 'Imagem de fundo';

  @override
  String get chatBackground => 'Fundo da conversa';

  @override
  String get customColor => 'Personalizada';

  @override
  String get defaultColor => 'Predefinida';

  @override
  String get imageSelected => 'Imagem selecionada';

  @override
  String get noImage => 'Sem imagem';

  @override
  String get color => 'Cor';

  @override
  String get image => 'Imagem';

  @override
  String get tapToSelectImage => 'Toque para selecionar uma imagem';

  @override
  String get changeImage => 'Alterar imagem';

  @override
  String get previewMessageReceived => 'Ola!';

  @override
  String get previewMessageSent => 'Viva!';

  @override
  String get messageAction => 'Mensagem';

  @override
  String get callAction => 'Chamada';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Notas pessoais';

  @override
  String get addNotes => 'Adicionar notas...';

  @override
  String get noNotes => 'Sem notas';

  @override
  String get messageNotifications => 'Notificacoes de mensagens';

  @override
  String get callNotifications => 'Notificacoes de chamadas';

  @override
  String get useGradient => 'Usar gradiente';

  @override
  String get gradientStart => 'Cor inicial';

  @override
  String get gradientEnd => 'Cor final';

  @override
  String get preview => 'Pre-visualizacao';

  @override
  String get reset => 'Repor';

  @override
  String get securityNumber => 'Numero de seguranca';

  @override
  String securityNumberDescription(String name) {
    return 'Verifique se o numero de seguranca corresponde ao dispositivo de $name';
  }

  @override
  String get verifyEncryption => 'Verificar encriptacao ponta a ponta';

  @override
  String get tapToCopy => 'Toque para copiar';

  @override
  String get howToVerify => 'Como verificar';

  @override
  String get verifyStep1 => 'Encontre o seu contacto pessoalmente ou ligue-lhe';

  @override
  String get verifyStep2 =>
      'Compare os numeros de seguranca ou leia os codigos QR';

  @override
  String get verifyStep3 => 'Se corresponderem, a sua conversa e segura';

  @override
  String get scanToVerify => 'Ler para verificar';

  @override
  String get reportSpam => 'Denunciar spam';

  @override
  String get reportSpamSubtitle => 'Denunciar este contacto como spam';

  @override
  String get reportSpamDescription =>
      'Este contacto sera denunciado anonimamente. A sua identidade nao sera partilhada. Tem a certeza?';

  @override
  String get report => 'Denunciar';

  @override
  String get spamReported => 'Spam denunciado';

  @override
  String get reportError => 'Falha ao enviar denuncia. Tente novamente.';

  @override
  String get reportRateLimited =>
      'Atingiu o numero maximo de denuncias para hoje.';

  @override
  String get blockContact => 'Bloquear contacto';

  @override
  String get blockContactDescription =>
      'Este contacto nao podera enviar-lhe mensagens nem ligar-lhe. Nao sera notificado.';

  @override
  String get unblockContact => 'Desbloquear contacto';

  @override
  String get unblockContactDescription =>
      'Este contacto podera novamente enviar-lhe mensagens e ligar-lhe.';

  @override
  String get contactBlocked => 'Contacto bloqueado';

  @override
  String get contactUnblocked => 'Contacto desbloqueado';

  @override
  String get contactIsBlocked => 'Este contacto esta bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get deleteContactSubtitle => 'Apagar este contacto e conversa';

  @override
  String get confirmWithPin => 'Confirmar com PIN';

  @override
  String get enterPinToConfirm =>
      'Introduza o seu PIN para confirmar esta acao';

  @override
  String get profilePhoto => 'Fotografia de perfil';

  @override
  String get takePhoto => 'Tirar fotografia';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String get removePhoto => 'Remover fotografia';

  @override
  String get viewContactHashId => 'Ver identificador do contacto';

  @override
  String get hashIdPartiallyMasked =>
      'Parcialmente oculto para a sua seguranca e privacidade do seu contacto';

  @override
  String get addFirstContact => 'Adicione o seu primeiro contacto';

  @override
  String get addFirstContactSubtitle =>
      'Partilhe o seu codigo QR ou leia o de um amigo';

  @override
  String get directory => 'Diretorio';

  @override
  String get noContacts => 'Sem contactos';

  @override
  String get noContactsSubtitle => 'Adicione um contacto para comecar';

  @override
  String get sendMessageAction => 'Enviar mensagem';

  @override
  String get audioCall => 'Chamada de voz';

  @override
  String get videoCall => 'Chamada de video';

  @override
  String get viewProfile => 'Ver perfil';

  @override
  String get deleteContactDirectory => 'Apagar contacto';

  @override
  String get scanShort => 'Ler';

  @override
  String get addShort => 'Adicionar';

  @override
  String deleteContactConfirmName(String name) {
    return 'Tem a certeza de que quer apagar $name?';
  }

  @override
  String get noNotesTitle => 'Sem notas';

  @override
  String get noNotesSubtitle => 'Crie a sua primeira nota';

  @override
  String get newNote => 'Nova nota';

  @override
  String get editNote => 'Editar nota';

  @override
  String get deleteNote => 'Apagar nota';

  @override
  String get deleteNoteConfirm => 'Tem a certeza de que quer apagar esta nota?';

  @override
  String get noteTitle => 'Titulo';

  @override
  String get noteContent => 'Conteudo';

  @override
  String get addItem => 'Adicionar item';

  @override
  String get pinNote => 'Fixar';

  @override
  String get unpinNote => 'Desafixar';

  @override
  String get noteColor => 'Cor';

  @override
  String get notePassword => 'Palavra-passe';

  @override
  String get setPassword => 'Definir palavra-passe';

  @override
  String get changePassword => 'Alterar palavra-passe';

  @override
  String get removePassword => 'Remover palavra-passe';

  @override
  String get enterPassword => 'Introduza a palavra-passe';

  @override
  String get confirmPassword => 'Confirme a palavra-passe';

  @override
  String get passwordPin => 'Codigo PIN';

  @override
  String get passwordText => 'Palavra-passe de texto';

  @override
  String get protectedNote => 'Nota protegida';

  @override
  String get incorrectPassword => 'Palavra-passe incorreta';

  @override
  String get passwordSet => 'Palavra-passe definida';

  @override
  String get passwordRemoved => 'Palavra-passe removida';

  @override
  String get notesBiometric => 'Face ID para notas';

  @override
  String get notesBiometricSubtitle =>
      'Exigir autenticacao biometrica para abrir notas protegidas';

  @override
  String get textNote => 'Nota de texto';

  @override
  String get checklistNote => 'Lista de tarefas';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tarefas';
  }

  @override
  String get autoSaved => 'Guardado';

  @override
  String get searchNotes => 'Procurar notas';

  @override
  String get legalConsent => 'Consentimento legal';

  @override
  String get confirmAge13 => 'Confirmo que tenho pelo menos 13 anos';

  @override
  String get acceptLegalStart => 'Aceito a ';

  @override
  String get privacyPolicy => 'Politica de Privacidade';

  @override
  String get termsOfService => 'Termos de Servico';

  @override
  String get andThe => ' e os ';

  @override
  String get continueButton => 'Continuar';

  @override
  String get mustAcceptTerms =>
      'Deve aceitar ambas as condicoes para continuar';

  @override
  String get support => 'Suporte';

  @override
  String get contactSupport => 'Contactar suporte';

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
  String get unpinConversation => 'Desafixar';

  @override
  String get hideConversation => 'Remover do feed';

  @override
  String get deleteConversation => 'Apagar conversa';

  @override
  String get deleteConversationConfirm =>
      'Introduza o seu PIN para confirmar a eliminacao de todas as mensagens';

  @override
  String get noConversations => 'Sem conversas ainda';

  @override
  String get startConversation => 'Iniciar';

  @override
  String get microphonePermissionRequired => 'Acesso ao microfone necessario';

  @override
  String get microphonePermissionExplanation =>
      'O Hash precisa do microfone para efetuar chamadas.';

  @override
  String get cameraPermissionExplanation =>
      'O Hash precisa da camara para chamadas de video.';

  @override
  String get openSettings => 'Abrir Definicoes';

  @override
  String get callConnecting => 'A ligar...';

  @override
  String get callRinging => 'A tocar...';

  @override
  String get callReconnecting => 'A religar...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'A religar (${seconds}s)';
  }

  @override
  String get callPaused => 'Pausado';

  @override
  String get callPausedSubtitle => 'A chamada ainda está ativa';

  @override
  String get callRemoteMicMuted => 'Microfone do contacto silenciado';

  @override
  String get callMiniControlsMute => 'Silenciar';

  @override
  String get callMiniControlsUnmute => 'Ativar som';

  @override
  String get callMiniControlsHangUp => 'Desligar';

  @override
  String get callMiniControlsReturn => 'Voltar a chamada';

  @override
  String get callNetworkPoor => 'Ligacao instavel';

  @override
  String get callNetworkLost => 'Ligacao perdida';

  @override
  String get callEndedTitle => 'Chamada terminada';

  @override
  String get deviceData => 'Dados do dispositivo';

  @override
  String get deviceDataSubtitle => 'Armazenamento local e no servidor';

  @override
  String get localStorage => 'Armazenamento local';

  @override
  String get onThisDevice => 'neste dispositivo';

  @override
  String get encryptedDatabases => 'Bases de dados encriptadas';

  @override
  String get files => 'Ficheiros';

  @override
  String get secureKeychain => 'Porta-chaves seguro';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Nomes, avatares, chaves Signal';

  @override
  String get messagesDetail => 'Conversas encriptadas';

  @override
  String get notesDetail => 'Notas pessoais';

  @override
  String get signalSessions => 'Sessoes Signal';

  @override
  String get signalSessionsDetail => 'Sessoes de encriptacao';

  @override
  String get pendingContacts => 'Contactos pendentes';

  @override
  String get pendingContactsDetail => 'Pedidos pendentes';

  @override
  String get callHistory => 'Chamadas';

  @override
  String get callHistoryDetail => 'Historico de chamadas';

  @override
  String get preferences => 'Preferencias';

  @override
  String get preferencesDetail => 'Preferencias de multimidia e chamadas';

  @override
  String get avatars => 'Avatares';

  @override
  String get media => 'Multimidia';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ficheiros',
      one: '1 ficheiro',
      zero: 'sem ficheiros',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Ativo';

  @override
  String get notDefined => 'Nao definido';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Frase de recuperacao';

  @override
  String get identity => 'Identidade (Hash ID)';

  @override
  String get signalKeys => 'Chaves Signal Protocol';

  @override
  String get authTokens => 'Tokens de autenticacao';

  @override
  String get contactNamesCache => 'Cache de nomes de contactos';

  @override
  String get remoteConfig => 'Configuracao remota';

  @override
  String get notificationPrefs => 'Preferencias de notificacoes';

  @override
  String get serverData => 'Dados no servidor';

  @override
  String get serverDataInfo =>
      'O Hash mantem o minimo de dados no servidor, todos encriptados ou temporarios.';

  @override
  String get serverProfile => 'Perfil';

  @override
  String get serverProfileDetail =>
      'Hash ID, chaves publicas, token de caixa de correio';

  @override
  String get serverPrekeys => 'Pre-chaves';

  @override
  String get serverPrekeysDetail => 'Chaves Signal de uso unico (consumidas)';

  @override
  String get serverMessages => 'Mensagens em transito';

  @override
  String get serverMessagesDetail => 'Apagadas apos entrega (max 24h)';

  @override
  String get serverMedia => 'Multimidia em transito';

  @override
  String get serverMediaDetail => 'Apagada apos transferencia';

  @override
  String get serverContactRequests => 'Pedidos de contacto';

  @override
  String get serverContactRequestsDetail => 'Expiram apos 24h';

  @override
  String get serverRateLimits => 'Limites de taxa';

  @override
  String get serverRateLimitsDetail => 'Dados temporarios anti-abuso';

  @override
  String get privacyReassurance =>
      'O Hash nao pode ler as suas mensagens. Todos os dados sao encriptados ponta a ponta. Os dados do servidor sao automaticamente apagados.';

  @override
  String get pinTooSimple =>
      'Este PIN e demasiado simples. Escolha um codigo mais seguro.';

  @override
  String get genericError => 'Ocorreu um erro. Tente novamente.';

  @override
  String accountCreationError(String error) {
    return 'Nao foi possivel criar a conta: $error';
  }

  @override
  String get phraseCopiedToClipboard =>
      'Frase copiada para a area de transferencia';

  @override
  String get copyPhrase => 'Copiar frase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Anote esta frase num local seguro. Se perder o PIN sem esta frase, perdera permanentemente o acesso aos seus dados.';

  @override
  String get noMessages => 'Sem mensagens';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Apagar todas as mensagens com $name?';
  }

  @override
  String get confirmation => 'Confirmacao';

  @override
  String get untitled => 'Sem titulo';

  @override
  String get noSessions => 'Sem sessoes';

  @override
  String get unknownContact => 'Contacto desconhecido';

  @override
  String get unnamed => 'Sem nome';

  @override
  String get noPendingRequestsAlt => 'Sem pedidos pendentes';

  @override
  String get deleteAllCallHistory => 'Apagar todo o historico de chamadas?';

  @override
  String get noCalls => 'Sem chamadas';

  @override
  String get noPreferences => 'Sem preferencias';

  @override
  String get resetAllMediaPrefs => 'Repor todas as preferencias de multimidia?';

  @override
  String get deleteThisAvatar => 'Apagar este avatar?';

  @override
  String get deleteAllAvatars => 'Apagar todos os avatares?';

  @override
  String get noAvatars => 'Sem avatares';

  @override
  String get deleteThisFile => 'Apagar este ficheiro?';

  @override
  String get deleteAllMediaFiles => 'Apagar toda a multimidia?';

  @override
  String get noMediaFiles => 'Sem multimidia';

  @override
  String get outgoing => 'Enviada';

  @override
  String get incoming => 'Recebida';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Visualizacao efemera: ${seconds}s';
  }

  @override
  String get normalView => 'Visualizacao normal';

  @override
  String get callReasonCompleted => 'Concluida';

  @override
  String get callReasonMissed => 'Perdida';

  @override
  String get callReasonDeclined => 'Recusada';

  @override
  String get callReasonFailed => 'Falhou';

  @override
  String get justNow => 'Agora mesmo';

  @override
  String timeAgoMinutes(int count) {
    return 'Ha $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Ha ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Ha ${count}d';
  }

  @override
  String get messageTypeContact => 'Contacto';

  @override
  String get messageTypeLocation => 'Localizacao';

  @override
  String get statusQueued => 'Em fila';

  @override
  String get blockedBadge => 'Bloqueado';

  @override
  String get protectedBadge => 'Protegida';

  @override
  String messageCount(int count) {
    return '$count mensagem(ns)';
  }

  @override
  String get deleteQuestion => 'Apagar?';

  @override
  String get transferMyAccountTitle => 'Transferir a minha conta';

  @override
  String get loadingError => 'Erro de carregamento';

  @override
  String get transferToNewDevice => 'Transferir para um novo dispositivo';

  @override
  String get transferInstructions =>
      'No seu novo dispositivo, escolha \"Recuperar a minha conta\" e introduza estas informacoes:';

  @override
  String get yourHashIdLabel => 'O seu Hash ID';

  @override
  String get enterYourPinCode => 'Introduza o seu codigo PIN';

  @override
  String get pinOwnerConfirmation =>
      'Para confirmar que e o proprietario desta conta';

  @override
  String get scanThisQrCode => 'Leia este codigo QR';

  @override
  String get withYourNewDevice => 'Com o seu novo dispositivo';

  @override
  String get orEnterTheCode => 'ou introduza o codigo';

  @override
  String get transferCodeLabel => 'Codigo de transferencia';

  @override
  String get proximityVerification => 'Verificacao de proximidade';

  @override
  String get bringDevicesCloser => 'Aproxime os dois dispositivos';

  @override
  String get confirmTransferQuestion => 'Confirmar a transferencia?';

  @override
  String get accountWillBeTransferred =>
      'A sua conta sera transferida para o novo dispositivo.\n\nEste dispositivo sera permanentemente desligado.';

  @override
  String get transferComplete => 'Transferencia concluida';

  @override
  String get transferSuccessMessage =>
      'A sua conta foi transferida com sucesso.\n\nEsta aplicacao vai agora fechar.';

  @override
  String get manualVerification => 'Verificacao manual';

  @override
  String get codeDisplayedOnBothDevices =>
      'Codigo apresentado em ambos os dispositivos:';

  @override
  String get doesCodeMatchNewDevice =>
      'Este codigo corresponde ao do novo dispositivo?';

  @override
  String get verifiedStatus => 'Verificado';

  @override
  String get inProgressStatus => 'Em curso...';

  @override
  String get notAvailableStatus => 'Nao disponivel';

  @override
  String get codeExpiredRestart => 'O codigo expirou. Recomece.';

  @override
  String get codesDoNotMatchCancelled =>
      'Os codigos nao correspondem. Transferencia cancelada.';

  @override
  String transferToDevice(String device) {
    return 'Para: $device';
  }

  @override
  String get copiedExclamation => 'Copiado!';

  @override
  String expiresInTime(String time) {
    return 'Expira em $time';
  }

  @override
  String get biometricNotAvailable =>
      'A biometria nao esta disponivel neste dispositivo';

  @override
  String get biometricAuthError => 'Erro durante a autenticacao biometrica';

  @override
  String get authenticateForBiometric =>
      'Autentique-se para ativar a biometria';

  @override
  String get biometricAuthFailed => 'Autenticacao biometrica falhou';

  @override
  String get forceUpdateTitle => 'Atualizacao necessaria';

  @override
  String get forceUpdateMessage =>
      'Uma nova versao do Hash esta disponivel. Atualize para continuar.';

  @override
  String get updateButton => 'Atualizar';

  @override
  String get maintenanceInProgress => 'Manutencao em curso';

  @override
  String get tryAgainLater => 'Tente novamente mais tarde';

  @override
  String get information => 'Informacao';

  @override
  String get later => 'Mais tarde';

  @override
  String get doYouLikeHash => 'Gosta do Hash?';

  @override
  String get yourFeedbackHelps =>
      'A sua opiniao ajuda-nos a melhorar a aplicacao';

  @override
  String get ratingTerrible => 'Terrivel';

  @override
  String get ratingBad => 'Mau';

  @override
  String get ratingOk => 'Razoavel';

  @override
  String get ratingGood => 'Bom';

  @override
  String get ratingExcellent => 'Excelente!';

  @override
  String get donationMessage =>
      'O Hash e um projeto sem fins lucrativos. O seu apoio ajuda-nos a continuar a desenvolver um mensageiro verdadeiramente privado.';

  @override
  String get recentConnections => 'Ligacoes recentes';

  @override
  String get loginInfoText =>
      'Cada desbloqueio por PIN e registado localmente. Apenas as ultimas 24 horas sao mantidas.';

  @override
  String get connectionCount => 'Ligacao(oes)';

  @override
  String get periodLabel => 'Periodo';

  @override
  String get historyLabel => 'Historico';

  @override
  String get noLoginRecorded => 'Nenhuma ligacao registada';

  @override
  String get nextUnlocksAppearHere => 'Os proximos desbloqueios aparecao aqui.';

  @override
  String get dataLocalOnly =>
      'Estes dados sao armazenados apenas no seu dispositivo e nunca sao transmitidos.';

  @override
  String get currentSession => 'Atual';

  @override
  String get todayLabel => 'Hoje';

  @override
  String get yesterdayLabel => 'Ontem';

  @override
  String get justNowLabel => 'Agora mesmo';

  @override
  String minutesAgoLabel(int count) {
    return 'Ha $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Ha ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Ha ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Sem manutencao planeada';

  @override
  String get everythingWorkingNormally => 'Tudo a funcionar normalmente';

  @override
  String get maintenanceTitle => 'Manutencao';

  @override
  String get maintenanceActiveLabel => 'EM CURSO';

  @override
  String get maintenancePlannedLabel => 'PLANEADA';

  @override
  String get locking => 'A bloquear...';

  @override
  String get newMessageNotification => 'Nova mensagem';

  @override
  String get secExplainTitle => 'Como o Hash te protege';

  @override
  String get secExplainIntro =>
      'O Hash foi concebido para que ninguem consiga ler as tuas mensagens.';

  @override
  String get secExplainIntroSub =>
      'Nem mesmo nos.\nEis como funciona, explicado de forma simples.';

  @override
  String get secJourneyLabel => 'O PERCURSO';

  @override
  String get secJourneyTitle => 'A viagem da tua mensagem';

  @override
  String get secJourneySubtitle =>
      'Do teu dedo ao ecra do teu contacto, cada passo esta protegido. Segue o caminho.';

  @override
  String get secStep1Title => 'Escreves a tua mensagem';

  @override
  String get secStep1Desc =>
      'Escreves \"Ola!\" na aplicacao. Neste momento, a mensagem existe apenas na memoria do teu telefone. Nada foi enviado.';

  @override
  String get secStep2Title => 'Encriptacao com Signal Protocol';

  @override
  String get secStep2Desc =>
      'Assim que carregas em \"Enviar\", a tua mensagem e transformada numa cadeia de caracteres incompreensiveis. E como se a tua mensagem fosse trancada num cofre cuja chave so o teu contacto possui.';

  @override
  String get secStep3Title => 'Sealed Sender: o envelope invisivel';

  @override
  String get secStep3Desc =>
      'Imagina que envias uma carta pelo correio, mas sem endereco de remetente no envelope. E exatamente isso que o Hash faz. A mensagem e depositada numa caixa de correio anonima. O servidor nao sabe quem a enviou.';

  @override
  String get secStep4Title => 'O servidor nao ve nada';

  @override
  String get secStep4Desc =>
      'O servidor age como um carteiro cego. Apenas sabe \"alguem depositou algo na caixa #A7X9\". Nao sabe quem enviou, o que e, nem para quem e.';

  @override
  String get secStep4Highlight =>
      'Sem metadados armazenados: sem endereco IP, sem carimbo temporal, sem ligacao entre remetente e destinatario.';

  @override
  String get secStep5Title => 'O teu contacto recebe a mensagem';

  @override
  String get secStep5Desc =>
      'O telefone do teu contacto recolhe o conteudo da sua caixa de correio anonima e desencripta a mensagem com a sua chave privada, que nunca saiu do seu dispositivo. \"Ola!\" aparece no seu ecra.';

  @override
  String get secStep6Title => 'A mensagem desaparece do servidor';

  @override
  String get secStep6Desc =>
      'Assim que o teu contacto confirma a rececao, o servidor apaga permanentemente a mensagem. Sem lixo, sem arquivo, sem copia de seguranca. Mesmo as mensagens nao lidas sao automaticamente destruidas apos 24 horas.';

  @override
  String get secStep7Title => 'Expiracao local';

  @override
  String get secStep7Desc =>
      'No telefone do teu contacto, a mensagem autodestroi-se conforme a duracao que escolheste: imediatamente apos leitura, 5 minutos, 1 hora... tu decides.';

  @override
  String get secJourneyConclusion =>
      'Resultado: zero rasto no servidor, zero rasto nos dispositivos. A mensagem existiu apenas o tempo necessario para ser lida, depois desapareceu.';

  @override
  String get secArchLabel => 'ARQUITETURA';

  @override
  String get secArchTitle => '5 camadas de protecao';

  @override
  String get secArchSubtitle =>
      'O Hash nao depende de uma unica tecnologia. Cada camada reforca as outras. Mesmo que uma camada seja comprometida, os teus dados permanecem seguros.';

  @override
  String get secLayer1Title => 'Encriptacao ponta a ponta';

  @override
  String get secLayer1Desc =>
      'Cada mensagem e encriptada com uma chave unica. Em termos simples: mesmo que alguem desencripte uma mensagem, nao conseguira desencriptar a seguinte. Cada mensagem tem o seu proprio cadeado.';

  @override
  String get secLayer1Detail =>
      'Para ficheiros (fotos, videos, documentos), o Hash utiliza encriptacao AES-256-GCM adicional. O ficheiro e encriptado antes de sair do teu telefone.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimato na rede)';

  @override
  String get secLayer2Desc =>
      'Os mensageiros comuns enviam as tuas mensagens com a tua identidade anexada. E como escrever o teu nome no envelope. O Hash utiliza caixas de correio anonimas: o servidor entrega a mensagem sem saber quem a enviou.';

  @override
  String get secLayer2Detail =>
      'Resultado: mesmo em caso de fuga de dados do servidor, e impossivel reconstruir quem fala com quem.';

  @override
  String get secLayer3Title => 'Eliminacao automatica';

  @override
  String get secLayer3Desc =>
      'As mensagens sao apagadas do servidor assim que a rececao e confirmada. Mesmo que uma mensagem nunca seja recuperada, e automaticamente destruida apos 24 horas.';

  @override
  String get secLayer3Detail =>
      'No teu telefone, as mensagens autodestruem-se conforme a duracao que escolhes: imediatamente, 5min, 15min, 30min, 1h, 3h, 6h ou 12h.';

  @override
  String get secLayer4Title => 'Protecao de acesso local';

  @override
  String get secLayer4Desc =>
      'A aplicacao e protegida por um PIN de 6 digitos e/ou biometria (Face ID, impressao digital). Apos demasiadas tentativas falhadas, a aplicacao bloqueia com um atraso crescente apos cada falha.';

  @override
  String get secLayer5Title => 'Base de dados bloqueada';

  @override
  String get secLayer5Desc =>
      'Do lado do servidor, nenhum utilizador pode escrever diretamente na base de dados. Todas as acoes passam por funcoes seguras que verificam cada pedido.';

  @override
  String get secLayer5Detail =>
      'E como um balcao de banco: nunca tocas no cofre tu proprio. Fazes um pedido e o sistema verifica que tens o direito antes de agir.';

  @override
  String get secVashLabel => 'UNICO NO MUNDO';

  @override
  String get secVashTitle => 'Modo Vash';

  @override
  String get secVashSubtitle =>
      'Um sistema de seguranca de emergencia que nao existe em nenhuma outra aplicacao de mensagens.';

  @override
  String get secVashScenarioTitle => 'Imagina esta situacao';

  @override
  String get secVashScenario1 => 'Alguem acede ao teu telefone';

  @override
  String get secVashScenario2 => 'Pedem-te o teu codigo PIN';

  @override
  String get secVashScenario3 =>
      'Queres apagar todos os teus dados urgentemente';

  @override
  String get secVashSolutionTitle => 'A solucao: dois codigos PIN';

  @override
  String get secVashSolutionDesc =>
      'Configuras dois codigos PIN diferentes no Hash:';

  @override
  String get secVashNormalCodeLabel => 'Codigo normal';

  @override
  String get secVashNormalCodeDesc =>
      'Abre a aplicacao normalmente com todos os teus dados';

  @override
  String get secVashCodeLabel2 => 'Codigo Vash';

  @override
  String get secVashCodeDescription =>
      'Abre a aplicacao normalmente... mas todos os teus dados sao silenciosamente apagados em segundo plano';

  @override
  String get secVashWhatHappensTitle => 'O que acontece a seguir';

  @override
  String get secVashWhatHappensDesc =>
      'A aplicacao abre normalmente. Sem alerta, sem animacao suspeita. O ecra simplesmente mostra uma aplicacao vazia, como se a tivesses acabado de instalar.\n\nNa realidade, todas as tuas conversas, contactos e mensagens foram irreversivelmente apagados numa fracao de segundo.';

  @override
  String get secCallsLabel => 'CHAMADAS & FICHEIROS';

  @override
  String get secCallsTitle => 'Tudo e encriptado';

  @override
  String get secCallsSubtitle =>
      'Nao sao so as mensagens. Absolutamente tudo o que passa pelo Hash e encriptado ponta a ponta.';

  @override
  String get secAudioCallTitle => 'Chamadas de voz';

  @override
  String get secAudioCallDesc =>
      'Encriptadas ponta a ponta via WebRTC. A voz e transmitida diretamente entre dispositivos.';

  @override
  String get secVideoCallTitle => 'Chamadas de video';

  @override
  String get secVideoCallDesc =>
      'Mesma tecnologia, cada fluxo encriptado individualmente.';

  @override
  String get secPhotosTitle => 'Fotos e videos';

  @override
  String get secPhotosDesc =>
      'Encriptados em AES-256-GCM antes de sairem do teu telefone.';

  @override
  String get secDocsTitle => 'Documentos';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, qualquer ficheiro. Nome, tamanho e conteudo encriptados.';

  @override
  String get secAnonLabel => 'ANONIMATO';

  @override
  String get secAnonTitle => 'Sem identidade necessaria';

  @override
  String get secAnonSubtitle =>
      'O Hash nunca pede o teu numero de telefone nem o teu email. Es identificado por um Hash ID unico e anonimo.';

  @override
  String get secHashIdTitle => 'O teu Hash ID';

  @override
  String get secHashIdDesc =>
      'Este e o teu identificador unico. Nao revela nada sobre ti: nem o teu nome, nem o teu numero, nem a tua localizacao. E como um pseudonimo impossivel de associar a tua identidade real.\n\nPara adicionar um contacto, partilhas o teu Hash ID ou les um codigo QR. So isso. Sem agenda sincronizada, sem sugestoes \"Pessoas que podes conhecer\".';

  @override
  String get secDataLabel => 'DADOS';

  @override
  String get secDataTitle => 'O que o Hash nao sabe';

  @override
  String get secDataSubtitle =>
      'A melhor forma de proteger os teus dados e nao os recolher.';

  @override
  String get secNeverCollected => 'Nunca recolhido';

  @override
  String get secNeverItem1 => 'Conteudo das mensagens';

  @override
  String get secNeverItem2 => 'Lista de contactos';

  @override
  String get secNeverItem3 => 'Numero de telefone';

  @override
  String get secNeverItem4 => 'Endereco de email';

  @override
  String get secNeverItem5 => 'Endereco IP';

  @override
  String get secNeverItem6 => 'Localizacao';

  @override
  String get secNeverItem7 => 'Metadados (quem fala com quem)';

  @override
  String get secNeverItem8 => 'Historico de chamadas';

  @override
  String get secNeverItem9 => 'Agenda de contactos';

  @override
  String get secNeverItem10 => 'Identificadores publicitarios';

  @override
  String get secTempStored => 'Armazenado temporariamente';

  @override
  String get secTempItem1 => 'Hash ID anonimo (identificador unico)';

  @override
  String get secTempItem2 => 'Chaves publicas de encriptacao';

  @override
  String get secTempItem3 => 'Mensagens encriptadas em transito (max 24h)';

  @override
  String get secTempNote =>
      'Mesmo estes dados minimos nao permitem identifica-lo. O seu Hash ID nao esta ligado a qualquer informacao pessoal.';

  @override
  String get secFooterTitle => 'A tua privacidade, a tua liberdade';

  @override
  String get secFooterDesc =>
      'O Hash utiliza as mesmas tecnologias de encriptacao que as aplicacoes profissionais mais exigentes. As tuas mensagens sao protegidas pela matematica, nao por promessas.';
}
