// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => '零痕迹。零妥协。';

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
  String get conversations => '聊天';

  @override
  String get contacts => '联系人';

  @override
  String get noConversation => '暂无聊天';

  @override
  String get noConversationSubtitle => '添加联系人开始安全聊天';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个收到的请求',
      one: '1 个收到的请求',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个待处理的已发送请求',
      one: '1 个待处理的已发送请求',
    );
    return '$_temp0';
  }

  @override
  String get addContact => '添加联系人';

  @override
  String get shareApp => '分享应用';

  @override
  String get newMessage => '新消息';

  @override
  String get newConversation => '发送消息';

  @override
  String get settings => '设置';

  @override
  String get myHashId => '我的 Hash ID';

  @override
  String get supportHash => '支持 Hash';

  @override
  String get supportHashSubtitle => 'Hash 是一个非营利项目';

  @override
  String get donate => '捐赠';

  @override
  String get appearance => '外观';

  @override
  String get theme => '主题';

  @override
  String get themeAuto => '自动';

  @override
  String get themeAutoSubtitle => '跟随系统设置';

  @override
  String get themeDark => '深色';

  @override
  String get themeLight => '浅色';

  @override
  String get themeRecommendation => '深色主题推荐用于更好的隐私保护';

  @override
  String get language => '语言';

  @override
  String get languageAuto => '自动（系统）';

  @override
  String get notifications => '通知';

  @override
  String get messages => '消息';

  @override
  String get calls => '通话';

  @override
  String get vibration => '振动';

  @override
  String get notificationContent => '通知内容';

  @override
  String get notificationContentFull => '显示全部';

  @override
  String get notificationContentFullDesc => '联系人姓名和消息预览';

  @override
  String get notificationContentName => '仅显示姓名';

  @override
  String get notificationContentNameDesc => '只显示联系人姓名';

  @override
  String get notificationContentDiscrete => '低调';

  @override
  String get notificationContentDiscreteDesc => '只显示\"新消息\"';

  @override
  String get security => '安全';

  @override
  String get howHashProtectsYou => 'Hash 如何保护你';

  @override
  String get howHashProtectsYouSubtitle => '了解你的安全保障';

  @override
  String get accountSecurity => '账户安全';

  @override
  String get accountSecuritySubtitle => 'PIN码、生物识别、Vash 模式';

  @override
  String get blockScreenshots => '禁止截屏';

  @override
  String get transferDevice => '转移到其他设备';

  @override
  String get transferDeviceSubtitle => '迁移您的账户';

  @override
  String get pinCode => 'PIN码';

  @override
  String get changePin => '更改PIN码';

  @override
  String get currentPin => '当前PIN码';

  @override
  String get newPin => '新PIN码';

  @override
  String get confirmPin => '确认PIN码';

  @override
  String get pinChanged => 'PIN码已更改';

  @override
  String get incorrectPin => 'PIN码错误';

  @override
  String get pinsDoNotMatch => 'PIN码不匹配';

  @override
  String get autoLock => '自动锁定';

  @override
  String get autoLockDelay => '锁定延迟';

  @override
  String get autoLockImmediate => '立即';

  @override
  String get autoLockMinute => '1分钟';

  @override
  String autoLockMinutes(int count) {
    return '$count分钟';
  }

  @override
  String get vashCode => 'Vash 码';

  @override
  String get vashModeTitle => 'Vash 模式';

  @override
  String get vashModeExplanation => '您的终极安全网。';

  @override
  String get vashModeDescription =>
      '您将选择第二个PIN码。如果有一天您被迫打开Hash，请输入此码代替您的常规PIN码。\n\n应用将正常打开，但您的所有对话和联系人都将消失。\n\n对于任何看到您屏幕的人来说，Hash看起来就是空的——好像您从未使用过。';

  @override
  String get vashModeIrreversible => '此操作是无声且不可逆的。';

  @override
  String get chooseVashCode => '选择我的 Vash 码';

  @override
  String get vashCodeInfo => '第二个PIN码，正常打开应用，但内容为空。';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => '如果您输入此码代替PIN码：';

  @override
  String get vashDeleteContacts => '您的联系人将消失';

  @override
  String get vashDeleteMessages => '您的对话将消失';

  @override
  String get vashDeleteHistory => '您的笔记将消失';

  @override
  String get vashKeepId => '您的 Hash 身份 (#XXX-XXX-XXX) 保持不变';

  @override
  String get vashAppearNormal => '应用显示正常但为空，如同全新安装。此操作不可逆。';

  @override
  String get setupVashCode => '设置 Vash 码';

  @override
  String get modifyVashCode => '修改 Vash 码';

  @override
  String get currentVashCode => '当前 Vash 码';

  @override
  String get newVashCode => '新 Vash 码';

  @override
  String get confirmVashCode => '确认 Vash 码';

  @override
  String get vashCodeConfigured => 'Vash 码已配置';

  @override
  String get vashCodeModified => 'Vash 码已修改';

  @override
  String get vashCodeMustDiffer => 'Vash 码必须与PIN码不同';

  @override
  String get incorrectVashCode => 'Vash 码错误';

  @override
  String get vashWhatToDelete => 'Vash 模式要清除什么？';

  @override
  String get vashDeleteContactsOption => '联系人';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => '消息';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => '笔记';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash 模式已激活';

  @override
  String get vashCreateSubtitle => '选择一个与主PIN码不同的代码';

  @override
  String get vashConfirmSubtitle => '确认您的 Vash 码';

  @override
  String get pinCodeForEntry => '进入应用的PIN码';

  @override
  String get vashCodeSection => 'Vash 模式';

  @override
  String get biometric => '生物识别';

  @override
  String get biometricUnlock => '使用指纹或Face ID解锁';

  @override
  String get enableBiometric => '启用生物识别';

  @override
  String get biometricWarningMessage =>
      '启用生物识别后，您将无法使用 Vash 码进入应用。\n\n只有在生物识别失败时（多次尝试失败后），您才能使用 Vash 码。\n\n您确定要继续吗？';

  @override
  String get understood => '我明白了';

  @override
  String get shareAppSubtitle => '与亲友分享 Hash';

  @override
  String get share => '分享';

  @override
  String get danger => '危险';

  @override
  String get deleteAccount => '删除我的账户';

  @override
  String get deleteAccountSubtitle => '不可逆操作';

  @override
  String get deleteAccountConfirmTitle => '删除我的账户';

  @override
  String get deleteAccountConfirmMessage =>
      '您的账户将被永久删除。此操作不可逆。\n\n• 您的所有聊天\n• 您的所有联系人\n• 您的Hash ID\n\n您需要创建新账户。';

  @override
  String get deleteForever => '永久删除';

  @override
  String get cancel => '取消';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash 模式已激活。';

  @override
  String deletionError(String error) {
    return '删除错误：$error';
  }

  @override
  String get yourSecurity => '您的安全';

  @override
  String get securityInfo =>
      '• 端到端加密（Signal协议）\n• 传送后服务器不保留数据\n• 密钥仅存储在您的设备上\n• PIN码永不发送到服务器';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => '欢迎';

  @override
  String get securityStatement1 => '您的消息受到保护。';

  @override
  String get securityStatement2 => '端到端加密。';

  @override
  String get securityStatement3 => '零痕迹。零妥协。';

  @override
  String get securityStatement4 => '您的隐私是一项权利。';

  @override
  String get accessBlocked => '访问被阻止';

  @override
  String get tooManyAttempts => '尝试次数过多，请稍后重试。';

  @override
  String get pleaseWait => '请等待';

  @override
  String get waitDelay => '请等待倒计时结束';

  @override
  String attemptCount(int current, int max) {
    return '第$current次尝试，共$max次';
  }

  @override
  String retryIn(String time) {
    return '$time后重试';
  }

  @override
  String get forgotPin => '忘记PIN码？使用恢复短语';

  @override
  String get useRecoveryPhrase => '使用恢复短语';

  @override
  String get recoveryWarningTitle => '警告';

  @override
  String get recoveryWarningMessage => '账户恢复将：';

  @override
  String get recoveryDeleteAllMessages => '删除您的所有消息';

  @override
  String get recoveryWaitDelay => '需要等待1小时';

  @override
  String get recoveryKeepContacts => '保留您的联系人';

  @override
  String get recoveryIrreversible => '此操作不可逆。您的消息将永久丢失。';

  @override
  String get iUnderstand => '我理解';

  @override
  String get accountRecovery => '账户恢复';

  @override
  String get enterRecoveryPhrase => '输入您的24个恢复短语单词，用空格分隔。';

  @override
  String get recoveryPhraseHint => '单词1 单词2 单词3 ...';

  @override
  String get recover => '恢复';

  @override
  String get recoveryPhraseRequired => '请输入您的恢复短语';

  @override
  String get recoveryPhrase24Words => '短语必须包含24个单词';

  @override
  String get incorrectRecoveryPhrase => '恢复短语错误';

  @override
  String get recoveryInitError => '初始化恢复时出错';

  @override
  String get securityDelay => '安全延迟';

  @override
  String get securityDelayMessage => '为了您的安全，在创建新PIN码之前需要等待一段时间。';

  @override
  String get timeRemaining => '剩余时间';

  @override
  String get messagesDeletedForProtection => '您的消息已被删除以保护您。';

  @override
  String get canCloseApp => '您可以关闭应用稍后再回来。';

  @override
  String get onboardingTitle1 => '欢迎使用Hash';

  @override
  String get onboardingSubtitle1 => '不留痕迹的通讯工具';

  @override
  String get onboardingTitle2 => '完全加密';

  @override
  String get onboardingSubtitle2 => '您的消息使用Signal协议进行端到端加密';

  @override
  String get onboardingTitle3 => '零痕迹';

  @override
  String get onboardingSubtitle3 => '消息在传送后从服务器删除';

  @override
  String get onboardingTitle4 => '您的安全';

  @override
  String get onboardingSubtitle4 => 'PIN码、Vash 模式和恢复短语';

  @override
  String get getStarted => '开始使用';

  @override
  String get next => '下一步';

  @override
  String get skip => '跳过';

  @override
  String get alreadyHaveAccount => '我已有账户';

  @override
  String get transferMyAccount => '转移我的账户';

  @override
  String get createPin => '创建PIN码';

  @override
  String get createPinSubtitle => '此代码将保护您的应用访问';

  @override
  String get confirmYourPin => '确认您的PIN码';

  @override
  String get confirmPinSubtitle => '再次输入您的PIN码';

  @override
  String get saveRecoveryPhrase => '恢复短语';

  @override
  String get saveRecoveryPhraseSubtitle => '按顺序写下这24个单词。如果您忘记PIN码，它们将帮助您恢复账户。';

  @override
  String get phraseWritten => '我已写下短语';

  @override
  String get warningRecoveryPhrase => '如果您丢失此短语并忘记PIN码，您将无法访问您的账户。';

  @override
  String get accountTransferred => '账户已转移';

  @override
  String get accountTransferredMessage => '您的账户已转移到另一台设备。此会话不再有效。';

  @override
  String get accountTransferredInfo => '如果您没有发起此转移，您的账户可能已被盗用。';

  @override
  String get logout => '退出登录';

  @override
  String get transferAccount => '转移账户';

  @override
  String get transferAccountInfo => '将您的Hash账户转移到新设备。您当前的会话将失效。';

  @override
  String get generateTransferCode => '生成转移码';

  @override
  String get transferCode => '转移码';

  @override
  String transferCodeExpires(int minutes) {
    return '此代码将在$minutes分钟后过期';
  }

  @override
  String get enterCodeOnNewDevice => '在新设备上输入此代码以转移您的账户。';

  @override
  String get generateNewCode => '生成新代码';

  @override
  String get scanQrCode => '扫描二维码';

  @override
  String get scanQrCodeSubtitle => '扫描联系人的二维码以添加';

  @override
  String get qrCodeDetected => '检测到二维码';

  @override
  String get invalidQrCode => '无效的二维码';

  @override
  String get cameraPermissionRequired => '需要相机权限';

  @override
  String get myQrCode => '我的二维码';

  @override
  String get myQrCodeSubtitle => '分享此二维码让您的联系人添加您';

  @override
  String get shareQrCode => '分享';

  @override
  String get addContactTitle => '添加联系人';

  @override
  String get addContactByHashId => '输入联系人的Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => '搜索';

  @override
  String get contactNotFound => '未找到联系人';

  @override
  String get contactAlreadyAdded => '此联系人已在您的列表中';

  @override
  String get contactAdded => '联系人已添加';

  @override
  String get myProfile => '我的资料';

  @override
  String get myProfileSubtitle => '分享此信息以便他人添加您';

  @override
  String get temporaryCode => '临时码';

  @override
  String temporaryCodeExpires(String time) {
    return '$time后过期';
  }

  @override
  String get codeExpired => '验证码已过期';

  @override
  String get generateNewCodeButton => '新验证码';

  @override
  String get copyHashId => '复制ID';

  @override
  String get copyCode => '复制验证码';

  @override
  String get copiedToClipboard => '已复制';

  @override
  String get showMyQrCode => '显示我的二维码';

  @override
  String get orDivider => '或';

  @override
  String get openScanner => '打开扫描器';

  @override
  String get addManually => '手动添加';

  @override
  String get contactHashIdLabel => '联系人的Hash ID';

  @override
  String get temporaryCodeLabel => '临时码';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode => '请联系人从其个人资料中生成验证码';

  @override
  String get verifyAndAdd => '验证并添加';

  @override
  String get fillAllFields => '请填写所有字段';

  @override
  String get invalidHashIdFormat => 'ID格式无效（例如：123-456-ABC）';

  @override
  String get userNotFound => '未找到用户';

  @override
  String get cannotAddYourself => '您不能添加自己';

  @override
  String get invalidOrExpiredCode => '临时码无效或已过期';

  @override
  String get contactFound => '找到联系人！';

  @override
  String get howToCallContact => '您想怎么称呼他？';

  @override
  String get contactNameHint => '联系人姓名';

  @override
  String get addContactButton => '添加';

  @override
  String get contactDetails => '联系人详情';

  @override
  String get contactName => '联系人姓名';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '添加于 $date';
  }

  @override
  String get deleteContact => '删除联系人';

  @override
  String deleteContactConfirm(Object name) {
    return '删除此联系人？';
  }

  @override
  String get deleteContactMessage => '这也将删除整个聊天。';

  @override
  String get delete => '删除';

  @override
  String get typeMessage => '输入消息...';

  @override
  String get messageSent => '已发送';

  @override
  String get messageDelivered => '已送达';

  @override
  String get messageRead => '已读';

  @override
  String get messageFailed => '发送失败';

  @override
  String get now => '现在';

  @override
  String minutesAgo(int count) {
    return '$count分钟';
  }

  @override
  String hoursAgo(int count) {
    return '$count小时';
  }

  @override
  String daysAgo(int count) {
    return '$count天';
  }

  @override
  String get today => '今天';

  @override
  String get yesterday => '昨天';

  @override
  String dateAtTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get shareMessage =>
      '加入我使用Hash！🔒\n\n这是一款真正私密的通讯工具：完全加密，服务器零痕迹，需要时还有紧急模式。\n\n在这里下载应用 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => '错误';

  @override
  String get ok => '确定';

  @override
  String get view => '查看';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get save => '保存';

  @override
  String get edit => '编辑';

  @override
  String get close => '关闭';

  @override
  String get confirm => '确认';

  @override
  String get loading => '加载中...';

  @override
  String get retry => '重试';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => '收到的请求';

  @override
  String get noPendingRequests => '没有待处理的请求';

  @override
  String get pendingRequestsSubtitle => '这些人想要添加您';

  @override
  String requestFromUser(String hashId) {
    return '来自 $hashId 的请求';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days天后过期';
  }

  @override
  String get acceptRequest => '接受';

  @override
  String get rejectRequest => '拒绝';

  @override
  String get requestAccepted => '请求已接受';

  @override
  String get requestRejected => '请求已拒绝';

  @override
  String get requestSent => '请求已发送！';

  @override
  String get requestSentSubtitle => '您的请求已发送。用户需要接受后才能聊天。';

  @override
  String get requestAlreadyPending => '已有一个待处理的请求';

  @override
  String get requestAlreadySentByOther => '此人已经向您发送了请求';

  @override
  String get addByHashId => '通过 Hash ID 添加';

  @override
  String get addByHashIdSubtitle => '输入联系人的 Hash ID 和临时码';

  @override
  String get enterTemporaryCode => '输入6位数字码';

  @override
  String get sendRequest => '发送请求';

  @override
  String get acceptContactTitle => '接受联系人';

  @override
  String get acceptContactSubtitle => '您可以为其设置自定义名称';

  @override
  String get leaveEmptyForHashId => '留空则使用 Hash ID';

  @override
  String get firstName => '名';

  @override
  String get lastName => '姓';

  @override
  String get notes => '笔记';

  @override
  String get notesHint => '关于此联系人的个人备注';

  @override
  String get photoOptional => '照片（可选）';

  @override
  String get contactNameOptional => '姓名（可选）';

  @override
  String get notesOptional => '备注（可选）';

  @override
  String get storedLocally => '仅存储在您的设备上';

  @override
  String get encryptedMessageLabel => '加密消息';

  @override
  String get identityMessageHint => '您是谁？你们是怎么认识的？';

  @override
  String get messageWillBeSentEncrypted => '此消息将加密后发送给接收者';

  @override
  String get sendRequestButton => '发送请求';

  @override
  String get requestExpiresIn24h => '请求将在24小时内过期（如果未被接受）';

  @override
  String get theyAlreadySentYouRequest => '此人已经向您发送了请求';

  @override
  String get requests => '请求';

  @override
  String get receivedRequests => '已收到';

  @override
  String get sentRequests => '已发送';

  @override
  String get noSentRequests => '没有已发送的请求';

  @override
  String get cancelRequest => '取消';

  @override
  String get deleteRequest => '删除请求';

  @override
  String get requestCancelled => '请求已取消';

  @override
  String sentTo(String hashId) {
    return '已发送给 $hashId';
  }

  @override
  String expiresIn(String time) {
    return '$time后过期';
  }

  @override
  String receivedAgo(String time) {
    return '$time前收到';
  }

  @override
  String get messageFromRequester => '请求者的消息';

  @override
  String get copy => '复制';

  @override
  String get messageInfo => '消息详情';

  @override
  String get messageDirection => '方向';

  @override
  String get messageSentByYou => '您发送的';

  @override
  String get messageReceived => '已收到';

  @override
  String get messageSentAt => '发送于';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => '状态';

  @override
  String get messageReadAt => '已读于';

  @override
  String get messageType => '类型';

  @override
  String get messageSize => '大小';

  @override
  String get messageExpiresAt => '过期于';

  @override
  String get messageEncrypted => '端到端加密';

  @override
  String get messageStatusSending => '发送中...';

  @override
  String get messageStatusSent => '已发送';

  @override
  String get messageStatusDelivered => '已送达';

  @override
  String get messageStatusRead => '已读';

  @override
  String get messageStatusFailed => '失败';

  @override
  String get serverStatus => '服务器';

  @override
  String get onServer => '等待送达';

  @override
  String get deletedFromServer => '已删除';

  @override
  String get messageTypeText => '文本';

  @override
  String get messageTypeImage => '图片';

  @override
  String get messageTypeVideo => '视频';

  @override
  String get messageTypeVoice => '音频';

  @override
  String get messageTypeFile => '文件';

  @override
  String get indefinitely => '永久';

  @override
  String get hoursShort => '小时';

  @override
  String get minutesShort => '分钟';

  @override
  String get hours => '小时';

  @override
  String get minutes => '分钟';

  @override
  String get seconds => '秒';

  @override
  String get ephemeralMessages => '阅后即焚消息';

  @override
  String get ephemeralMessagesDescription => '消息将在此时间后自动删除';

  @override
  String get ephemeralImmediate => '立即';

  @override
  String get ephemeralImmediateDesc => '阅读后立即删除';

  @override
  String get ephemeralMyPreference => '我的偏好';

  @override
  String get ephemeralMyPreferenceDesc => '使用全局设置';

  @override
  String get ephemeralDefaultSetting => '消息持续时间';

  @override
  String get ephemeralChooseDefault => '推荐';

  @override
  String get ephemeral30Seconds => '30秒';

  @override
  String get ephemeral30SecondsDesc => '阅读后30秒删除';

  @override
  String get ephemeral5Minutes => '5分钟';

  @override
  String get ephemeral5MinutesDesc => '阅读后5分钟删除';

  @override
  String get ephemeral1Hour => '1小时';

  @override
  String get ephemeral1HourDesc => '阅读后1小时删除';

  @override
  String get ephemeral3Hours => '3小时';

  @override
  String get ephemeral6Hours => '6小时';

  @override
  String get ephemeral6HoursDesc => '阅读后6小时删除';

  @override
  String get ephemeral12Hours => '12小时';

  @override
  String get ephemeral24Hours => '24小时';

  @override
  String get ephemeral24HoursDesc => '阅读后24小时删除';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => '自定义时长';

  @override
  String get howItWorks => '如何运作？';

  @override
  String get ephemeralExplanation1 => '消息在接收后已从服务器删除。';

  @override
  String get ephemeralExplanation2 => '此设置定义消息在您阅读后何时从您的手机上消失。';

  @override
  String get ephemeralExplanation3 => '您的联系人在其手机上有自己的设置。';

  @override
  String get mute1Hour => '1小时';

  @override
  String get mute8Hours => '8小时';

  @override
  String get mute1Day => '1天';

  @override
  String get mute1Week => '1周';

  @override
  String get muteAlways => '永久';

  @override
  String get muteExplanation => '您将不再收到此联系人的通知';

  @override
  String get showCallsInRecents => '在最近通话中显示';

  @override
  String get showCallsInRecentsSubtitle => 'Hash 通话将出现在手机通话记录中';

  @override
  String get feedback => '反馈';

  @override
  String get muteNotifications => '静音通知';

  @override
  String get muteDescription => '您将不会收到此联系人的通知';

  @override
  String mutedUntil(String time) {
    return '静音至 $time';
  }

  @override
  String get notMuted => '通知已开启';

  @override
  String get unmute => '取消静音';

  @override
  String get notificationSound => '通知声音';

  @override
  String get defaultSound => '默认';

  @override
  String get chatSettings => '聊天设置';

  @override
  String get bubbleColor => '气泡颜色';

  @override
  String get backgroundColor => '背景颜色';

  @override
  String get backgroundImage => '背景图片';

  @override
  String get chatBackground => '聊天背景';

  @override
  String get customColor => '自定义';

  @override
  String get defaultColor => '默认';

  @override
  String get imageSelected => '已选择图片';

  @override
  String get noImage => '无图片';

  @override
  String get color => '颜色';

  @override
  String get image => '图片';

  @override
  String get tapToSelectImage => '点击选择图片';

  @override
  String get changeImage => '更换图片';

  @override
  String get previewMessageReceived => '你好！';

  @override
  String get previewMessageSent => '嗨！';

  @override
  String get messageAction => '消息';

  @override
  String get callAction => '通话';

  @override
  String get videoAction => '视频';

  @override
  String get personalNotes => '个人备注';

  @override
  String get addNotes => '添加备注...';

  @override
  String get noNotes => '没有备注';

  @override
  String get messageNotifications => '消息通知';

  @override
  String get callNotifications => '通话通知';

  @override
  String get useGradient => '使用渐变';

  @override
  String get gradientStart => '起始颜色';

  @override
  String get gradientEnd => '结束颜色';

  @override
  String get preview => '预览';

  @override
  String get reset => '重置';

  @override
  String get securityNumber => '安全号码';

  @override
  String securityNumberDescription(String name) {
    return '验证安全号码是否与 $name 的设备匹配';
  }

  @override
  String get verifyEncryption => '验证端到端加密';

  @override
  String get tapToCopy => '点击复制';

  @override
  String get howToVerify => '如何验证';

  @override
  String get verifyStep1 => '与联系人面对面或通话';

  @override
  String get verifyStep2 => '比较安全号码或扫描二维码';

  @override
  String get verifyStep3 => '如果匹配，则您的聊天是安全的';

  @override
  String get scanToVerify => '扫描验证';

  @override
  String get reportSpam => '举报垃圾信息';

  @override
  String get reportSpamSubtitle => '将此联系人举报为垃圾信息';

  @override
  String get reportSpamDescription => '此联系人将被匿名举报。您的身份不会被分享。您确定吗？';

  @override
  String get report => '举报';

  @override
  String get spamReported => '已举报垃圾信息';

  @override
  String get reportError => '举报发送失败。请重试。';

  @override
  String get reportRateLimited => '您已达到今日最大举报次数。';

  @override
  String get blockContact => '屏蔽联系人';

  @override
  String get blockContactDescription => '此联系人将无法再向您发送消息或拨打电话。对方不会收到通知。';

  @override
  String get unblockContact => '取消屏蔽联系人';

  @override
  String get unblockContactDescription => '此联系人将能够再次向您发送消息和拨打电话。';

  @override
  String get contactBlocked => '联系人已屏蔽';

  @override
  String get contactUnblocked => '联系人已取消屏蔽';

  @override
  String get contactIsBlocked => '此联系人已被屏蔽';

  @override
  String get unblock => '取消屏蔽';

  @override
  String get deleteContactSubtitle => '删除此联系人和聊天';

  @override
  String get confirmWithPin => '使用PIN码确认';

  @override
  String get enterPinToConfirm => '输入您的PIN码以确认此操作';

  @override
  String get profilePhoto => '头像';

  @override
  String get takePhoto => '拍照';

  @override
  String get chooseFromGallery => '从相册选择';

  @override
  String get removePhoto => '移除照片';

  @override
  String get viewContactHashId => '查看联系人标识';

  @override
  String get hashIdPartiallyMasked => '为了您和联系人的安全，部分已被隐藏';

  @override
  String get addFirstContact => '添加您的第一个联系人';

  @override
  String get addFirstContactSubtitle => '分享您的二维码或扫描朋友的二维码';

  @override
  String get directory => '通讯录';

  @override
  String get noContacts => '没有联系人';

  @override
  String get noContactsSubtitle => '添加联系人以开始';

  @override
  String get sendMessageAction => '发送消息';

  @override
  String get audioCall => '语音通话';

  @override
  String get videoCall => '视频通话';

  @override
  String get viewProfile => '查看资料';

  @override
  String get deleteContactDirectory => '删除联系人';

  @override
  String get scanShort => '扫描';

  @override
  String get addShort => '添加';

  @override
  String deleteContactConfirmName(String name) {
    return '确定要删除 $name 吗？';
  }

  @override
  String get noNotesTitle => '没有笔记';

  @override
  String get noNotesSubtitle => '创建您的第一个笔记';

  @override
  String get newNote => '新笔记';

  @override
  String get editNote => '编辑笔记';

  @override
  String get deleteNote => '删除笔记';

  @override
  String get deleteNoteConfirm => '确定要删除此笔记吗？';

  @override
  String get noteTitle => '标题';

  @override
  String get noteContent => '内容';

  @override
  String get addItem => '添加项目';

  @override
  String get pinNote => '置顶';

  @override
  String get unpinNote => '取消置顶';

  @override
  String get noteColor => '颜色';

  @override
  String get notePassword => '密码';

  @override
  String get setPassword => '设置密码';

  @override
  String get changePassword => '更改密码';

  @override
  String get removePassword => '移除密码';

  @override
  String get enterPassword => '输入密码';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get passwordPin => 'PIN码';

  @override
  String get passwordText => '文本密码';

  @override
  String get protectedNote => '受保护的笔记';

  @override
  String get incorrectPassword => '密码错误';

  @override
  String get passwordSet => '密码已设置';

  @override
  String get passwordRemoved => '密码已移除';

  @override
  String get notesBiometric => 'Face ID用于笔记';

  @override
  String get notesBiometricSubtitle => '需要生物识别认证才能打开受保护的笔记';

  @override
  String get textNote => '文本笔记';

  @override
  String get checklistNote => '待办清单';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total 任务';
  }

  @override
  String get autoSaved => '已保存';

  @override
  String get searchNotes => '搜索笔记';

  @override
  String get legalConsent => '法律同意';

  @override
  String get confirmAge13 => '我确认我至少13岁';

  @override
  String get acceptLegalStart => '我接受';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get termsOfService => '服务条款';

  @override
  String get andThe => '和';

  @override
  String get continueButton => '继续';

  @override
  String get mustAcceptTerms => '您必须接受两项条款才能继续';

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
  String get support => '支持';

  @override
  String get contactSupport => '联系支持';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => '举报滥用';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => '法律';

  @override
  String get legalEntity => '法律实体';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => '置顶';

  @override
  String get unpinConversation => '取消置顶';

  @override
  String get hideConversation => '从列表中移除';

  @override
  String get deleteConversation => '删除对话';

  @override
  String get deleteConversationConfirm => '输入PIN码以确认删除所有消息';

  @override
  String get noConversations => '暂无对话';

  @override
  String get startConversation => '开始';

  @override
  String get microphonePermissionRequired => '需要麦克风访问权限';

  @override
  String get microphonePermissionExplanation => 'Hash 需要麦克风来进行通话。';

  @override
  String get cameraPermissionExplanation => 'Hash 需要摄像头来进行视频通话。';

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
  String get openSettings => '打开设置';

  @override
  String get callConnecting => '连接中...';

  @override
  String get callRinging => '呼叫中...';

  @override
  String get callReconnecting => '重新连接中...';

  @override
  String callReconnectingTimer(int seconds) {
    return '重新连接中 ($seconds秒)';
  }

  @override
  String get callPaused => '已暂停';

  @override
  String get callPausedSubtitle => '通话仍在进行中';

  @override
  String get callRemoteMicMuted => '对方麦克风已静音';

  @override
  String get callMiniControlsMute => '静音';

  @override
  String get callMiniControlsUnmute => '取消静音';

  @override
  String get callMiniControlsHangUp => '挂断';

  @override
  String get callMiniControlsReturn => '返回通话';

  @override
  String get callNetworkPoor => '连接不稳定';

  @override
  String get callNetworkLost => '连接已断开';

  @override
  String get callEndedTitle => '通话已结束';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => '设备数据';

  @override
  String get deviceDataSubtitle => '本地和服务器存储';

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
  String get localStorage => '本地存储';

  @override
  String get onThisDevice => '在此设备上';

  @override
  String get encryptedDatabases => '加密数据库';

  @override
  String get files => '文件';

  @override
  String get secureKeychain => '安全钥匙串';

  @override
  String get cache => '缓存';

  @override
  String get contactsDetail => '姓名、头像、Signal密钥';

  @override
  String get messagesDetail => '加密对话';

  @override
  String get notesDetail => '个人笔记';

  @override
  String get signalSessions => 'Signal会话';

  @override
  String get signalSessionsDetail => '加密会话';

  @override
  String get pendingContacts => '待处理联系人';

  @override
  String get pendingContactsDetail => '待处理的请求';

  @override
  String get callHistory => '通话';

  @override
  String get callHistoryDetail => '通话记录';

  @override
  String get preferences => '偏好设置';

  @override
  String get preferencesDetail => '媒体和通话偏好';

  @override
  String get avatars => '头像';

  @override
  String get media => '媒体';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个文件',
      one: '1个文件',
      zero: '无文件',
    );
    return '$_temp0';
  }

  @override
  String get active => '已启用';

  @override
  String get notDefined => '未设置';

  @override
  String get biometrics => '生物识别';

  @override
  String get recoveryPhrase => '恢复短语';

  @override
  String get identity => '身份 (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol密钥';

  @override
  String get authTokens => '认证令牌';

  @override
  String get contactNamesCache => '联系人名称缓存';

  @override
  String get remoteConfig => '远程配置';

  @override
  String get notificationPrefs => '通知偏好';

  @override
  String get serverData => '服务器数据';

  @override
  String get serverDataInfo => 'Hash在服务器上保留最少的数据，全部加密或临时存储。';

  @override
  String get serverProfile => '个人资料';

  @override
  String get serverProfileDetail => 'Hash ID、公钥、邮箱令牌';

  @override
  String get serverPrekeys => '预密钥';

  @override
  String get serverPrekeysDetail => '一次性Signal密钥（已消耗）';

  @override
  String get serverMessages => '传输中的消息';

  @override
  String get serverMessagesDetail => '接收后删除（最长24小时）';

  @override
  String get serverMedia => '传输中的媒体';

  @override
  String get serverMediaDetail => '下载后删除';

  @override
  String get serverContactRequests => '联系请求';

  @override
  String get serverContactRequestsDetail => '24小时后过期';

  @override
  String get serverRateLimits => '速率限制';

  @override
  String get serverRateLimitsDetail => '临时反滥用数据';

  @override
  String get privacyReassurance => 'Hash无法读取您的消息。所有数据均采用端到端加密。服务器数据会自动删除。';

  @override
  String get pinTooSimple => '此PIN码太简单。请选择更安全的代码。';

  @override
  String get genericError => '发生错误。请重试。';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return '无法创建账户：$error';
  }

  @override
  String get phraseCopiedToClipboard => '短语已复制到剪贴板';

  @override
  String get copyPhrase => '复制短语';

  @override
  String get recoveryPhraseSecurityWarning =>
      '请将此短语保存在安全的地方。如果您丢失PIN码且没有此短语，您将永久失去对数据的访问权。';

  @override
  String get noMessages => '没有消息';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '删除与 $name 的所有消息？';
  }

  @override
  String get confirmation => '确认';

  @override
  String get untitled => '无标题';

  @override
  String get noSessions => '没有会话';

  @override
  String get unknownContact => '未知联系人';

  @override
  String get unnamed => '未命名';

  @override
  String get noPendingRequestsAlt => '没有待处理的请求';

  @override
  String get deleteAllCallHistory => '删除所有通话记录？';

  @override
  String get noCalls => '没有通话';

  @override
  String get noPreferences => '没有偏好设置';

  @override
  String get resetAllMediaPrefs => '重置所有媒体偏好？';

  @override
  String get deleteThisAvatar => '删除此头像？';

  @override
  String get deleteAllAvatars => '删除所有头像？';

  @override
  String get noAvatars => '没有头像';

  @override
  String get deleteThisFile => '删除此文件？';

  @override
  String get deleteAllMediaFiles => '删除所有媒体？';

  @override
  String get noMediaFiles => '没有媒体';

  @override
  String get outgoing => '去电';

  @override
  String get incoming => '来电';

  @override
  String ephemeralViewDuration(int seconds) {
    return '阅后即焚：$seconds秒';
  }

  @override
  String get normalView => '正常查看';

  @override
  String get callReasonCompleted => '已完成';

  @override
  String get callReasonMissed => '未接';

  @override
  String get callReasonDeclined => '已拒绝';

  @override
  String get callReasonFailed => '失败';

  @override
  String get justNow => '刚刚';

  @override
  String timeAgoMinutes(int count) {
    return '$count分钟前';
  }

  @override
  String timeAgoHours(int count) {
    return '$count小时前';
  }

  @override
  String timeAgoDays(int count) {
    return '$count天前';
  }

  @override
  String get messageTypeContact => '联系人';

  @override
  String get messageTypeLocation => '位置';

  @override
  String get statusQueued => '排队中';

  @override
  String get blockedBadge => '已屏蔽';

  @override
  String get protectedBadge => '受保护';

  @override
  String messageCount(int count) {
    return '$count 条消息';
  }

  @override
  String get deleteQuestion => '删除？';

  @override
  String get transferMyAccountTitle => '转移我的账户';

  @override
  String get loadingError => '加载错误';

  @override
  String get transferToNewDevice => '转移到新设备';

  @override
  String get transferInstructions => '在您的新设备上，选择\"恢复我的账户\"并输入以下信息：';

  @override
  String get yourHashIdLabel => '您的 Hash ID';

  @override
  String get enterYourPinCode => '输入您的PIN码';

  @override
  String get pinOwnerConfirmation => '以确认您是此账户的所有者';

  @override
  String get scanThisQrCode => '扫描此二维码';

  @override
  String get withYourNewDevice => '使用您的新设备';

  @override
  String get orEnterTheCode => '或输入代码';

  @override
  String get transferCodeLabel => '转移码';

  @override
  String get proximityVerification => '近距离验证';

  @override
  String get bringDevicesCloser => '将两台设备靠近';

  @override
  String get confirmTransferQuestion => '确认转移？';

  @override
  String get accountWillBeTransferred => '您的账户将被转移到新设备。\n\n此设备将被永久断开连接。';

  @override
  String get transferComplete => '转移完成';

  @override
  String get transferSuccessMessage => '您的账户已成功转移。\n\n此应用现在将关闭。';

  @override
  String get manualVerification => '手动验证';

  @override
  String get codeDisplayedOnBothDevices => '在两台设备上显示的代码：';

  @override
  String get doesCodeMatchNewDevice => '此代码与新设备上的代码一致吗？';

  @override
  String get verifiedStatus => '已验证';

  @override
  String get inProgressStatus => '进行中...';

  @override
  String get notAvailableStatus => '不可用';

  @override
  String get codeExpiredRestart => '代码已过期。请重新开始。';

  @override
  String get codesDoNotMatchCancelled => '代码不匹配。转移已取消。';

  @override
  String transferToDevice(String device) {
    return '目标：$device';
  }

  @override
  String get copiedExclamation => '已复制！';

  @override
  String expiresInTime(String time) {
    return '$time后过期';
  }

  @override
  String get biometricNotAvailable => '此设备不支持生物识别';

  @override
  String get biometricAuthError => '生物识别认证错误';

  @override
  String get authenticateForBiometric => '请进行身份验证以启用生物识别';

  @override
  String get biometricAuthFailed => '生物识别认证失败';

  @override
  String get forceUpdateTitle => '需要更新';

  @override
  String get forceUpdateMessage => 'Hash 有新版本可用。请更新以继续使用。';

  @override
  String get updateButton => '更新';

  @override
  String get maintenanceInProgress => '维护中';

  @override
  String get tryAgainLater => '请稍后重试';

  @override
  String get information => '信息';

  @override
  String get later => '稍后';

  @override
  String get doYouLikeHash => '您喜欢 Hash 吗？';

  @override
  String get yourFeedbackHelps => '您的反馈帮助我们改进应用';

  @override
  String get ratingTerrible => '很差';

  @override
  String get ratingBad => '差';

  @override
  String get ratingOk => '一般';

  @override
  String get ratingGood => '好';

  @override
  String get ratingExcellent => '优秀！';

  @override
  String get donationMessage => 'Hash 是一个非营利项目。您的支持帮助我们继续开发真正私密的通讯工具。';

  @override
  String get recentConnections => '最近连接';

  @override
  String get loginInfoText => '每次PIN码解锁都会在本地记录。仅保留最近24小时的记录。';

  @override
  String get connectionCount => '连接次数';

  @override
  String get periodLabel => '时段';

  @override
  String get historyLabel => '历史记录';

  @override
  String get noLoginRecorded => '没有记录的连接';

  @override
  String get nextUnlocksAppearHere => '下次解锁将显示在此处。';

  @override
  String get dataLocalOnly => '这些数据仅存储在您的设备上，永远不会被传输。';

  @override
  String get currentSession => '当前';

  @override
  String get todayLabel => '今天';

  @override
  String get yesterdayLabel => '昨天';

  @override
  String get justNowLabel => '刚刚';

  @override
  String minutesAgoLabel(int count) {
    return '$count分钟前';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours小时前';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours小时$minutes分钟前';
  }

  @override
  String get noMaintenancePlanned => '没有计划的维护';

  @override
  String get everythingWorkingNormally => '一切正常运行';

  @override
  String get maintenanceTitle => '维护';

  @override
  String get maintenanceActiveLabel => '进行中';

  @override
  String get maintenancePlannedLabel => '计划中';

  @override
  String get locking => '锁定中...';

  @override
  String get newMessageNotification => '新消息';

  @override
  String get secExplainTitle => 'Hash 如何保护你';

  @override
  String get secExplainIntro => 'Hash 的设计使得任何人都无法读取你的消息。';

  @override
  String get secExplainIntroSub => '包括我们自己。\n以下是简单的解释。';

  @override
  String get secJourneyLabel => '旅程';

  @override
  String get secJourneyTitle => '你的消息之旅';

  @override
  String get secJourneySubtitle => '从你的手指到联系人的屏幕，每一步都受到保护。跟随这条路径。';

  @override
  String get secStep1Title => '你编写消息';

  @override
  String get secStep1Desc => '你在应用中输入\"你好！\"。此时，消息仅存在于你手机的内存中。什么都还没有发送。';

  @override
  String get secStep2Title => '使用Signal协议加密';

  @override
  String get secStep2Desc =>
      '当你按下\"发送\"时，你的消息会被转换成一串无法理解的字符。就像你的消息被锁在一个只有你的联系人拥有钥匙的保险箱中。';

  @override
  String get secStep3Title => 'Sealed Sender：隐形信封';

  @override
  String get secStep3Desc =>
      '想象你通过邮局寄信，但信封上没有寄件人地址。这正是Hash所做的。消息被放入一个匿名邮箱中。服务器不知道是谁发送的。';

  @override
  String get secStep4Title => '服务器什么都看不到';

  @override
  String get secStep4Desc =>
      '服务器扮演一个盲目邮递员的角色。它只知道\"有人在邮箱#A7X9中放了东西\"。它不知道是谁发送的、是什么内容、也不知道发给谁。';

  @override
  String get secStep4Highlight => '不存储任何元数据：没有IP地址、没有时间戳、没有发送者与接收者之间的关联。';

  @override
  String get secStep5Title => '你的联系人收到消息';

  @override
  String get secStep5Desc =>
      '你联系人的手机从其匿名邮箱中获取内容，并使用其从未离开过设备的私钥解密消息。\"你好！\"出现在他的屏幕上。';

  @override
  String get secStep6Title => '消息从服务器消失';

  @override
  String get secStep6Desc =>
      '一旦你的联系人确认接收，服务器将永久删除该消息。没有回收站、没有存档、没有备份。即使未读消息也会在24小时后自动销毁。';

  @override
  String get secStep7Title => '本地过期';

  @override
  String get secStep7Desc => '在你联系人的手机上，消息会按照你选择的时长自动销毁：阅读后立即、5分钟、1小时...由你决定。';

  @override
  String get secJourneyConclusion => '结果：服务器上零痕迹，设备上零痕迹。消息存在的时间仅够被阅读，然后便消失了。';

  @override
  String get secArchLabel => '架构';

  @override
  String get secArchTitle => '5层保护';

  @override
  String get secArchSubtitle => 'Hash不依赖于单一技术。每一层都加强了其他层。即使一层被攻破，你的数据仍然安全。';

  @override
  String get secLayer1Title => '端到端加密';

  @override
  String get secLayer1Desc =>
      '每条消息都使用唯一的密钥加密。简单来说：即使有人解密了一条消息，他也无法解密下一条。每条消息都有自己的锁。';

  @override
  String get secLayer1Detail =>
      '对于文件（照片、视频、文档），Hash使用额外的AES-256-GCM加密。文件在离开你的手机之前就已加密。';

  @override
  String get secLayer2Title => 'Sealed Sender（网络匿名）';

  @override
  String get secLayer2Desc =>
      '传统通讯应用发送消息时会附带你的身份。就像在信封上写下你的名字。Hash使用匿名邮箱：服务器在不知道发送者身份的情况下投递消息。';

  @override
  String get secLayer2Detail => '结果：即使服务器数据泄露，也无法重建谁在与谁通信。';

  @override
  String get secLayer3Title => '自动删除';

  @override
  String get secLayer3Desc => '确认接收后，消息立即从服务器删除。即使消息从未被取回，也会在24小时后自动销毁。';

  @override
  String get secLayer3Detail =>
      '在你的手机上，消息会按照你选择的时长自动销毁：立即、5分钟、15分钟、30分钟、1小时、3小时、6小时或12小时。';

  @override
  String get secLayer4Title => '本地访问保护';

  @override
  String get secLayer4Desc =>
      '应用受6位PIN码和/或生物识别（Face ID、指纹）保护。尝试失败次数过多后，应用将锁定，且每次失败后延迟时间递增。';

  @override
  String get secLayer5Title => '锁定的数据库';

  @override
  String get secLayer5Desc => '在服务器端，没有用户可以直接写入数据库。所有操作都通过安全函数进行，每个请求都会被验证。';

  @override
  String get secLayer5Detail => '就像银行柜台：你永远不会自己触碰金库。你提出请求，系统在执行前验证你是否有权限。';

  @override
  String get secVashLabel => '全球独创';

  @override
  String get secVashTitle => 'Vash 模式';

  @override
  String get secVashSubtitle => '一个在任何其他通讯应用中都不存在的紧急安全系统。';

  @override
  String get secVashScenarioTitle => '想象这个场景';

  @override
  String get secVashScenario1 => '有人获取了你的手机';

  @override
  String get secVashScenario2 => '有人要求你提供PIN码';

  @override
  String get secVashScenario3 => '你想紧急清除所有数据';

  @override
  String get secVashSolutionTitle => '解决方案：两个PIN码';

  @override
  String get secVashSolutionDesc => '你在Hash中配置两个不同的PIN码：';

  @override
  String get secVashNormalCodeLabel => '正常码';

  @override
  String get secVashNormalCodeDesc => '正常打开应用，显示所有数据';

  @override
  String get secVashCodeLabel2 => 'Vash 码';

  @override
  String get secVashCodeDescription => '正常打开应用...但所有数据在后台被静默删除';

  @override
  String get secVashWhatHappensTitle => '接下来会发生什么';

  @override
  String get secVashWhatHappensDesc =>
      '应用正常打开。没有警报，没有可疑动画。屏幕只是显示一个空的应用，就像你刚刚安装的一样。\n\n实际上，你所有的对话、联系人和消息都在一瞬间被不可逆地删除了。';

  @override
  String get secCallsLabel => '通话和文件';

  @override
  String get secCallsTitle => '一切都已加密';

  @override
  String get secCallsSubtitle => '不仅是消息。通过Hash传输的所有内容都经过端到端加密。';

  @override
  String get secAudioCallTitle => '语音通话';

  @override
  String get secAudioCallDesc => '通过WebRTC端到端加密。语音在设备之间直接传输。';

  @override
  String get secVideoCallTitle => '视频通话';

  @override
  String get secVideoCallDesc => '相同技术，每个流单独加密。';

  @override
  String get secPhotosTitle => '照片和视频';

  @override
  String get secPhotosDesc => '在离开你的手机之前使用AES-256-GCM加密。';

  @override
  String get secDocsTitle => '文档';

  @override
  String get secDocsDesc => 'PDF、ZIP、任何文件。名称、大小和内容都已加密。';

  @override
  String get secAnonLabel => '匿名';

  @override
  String get secAnonTitle => '无需任何身份';

  @override
  String get secAnonSubtitle => 'Hash从不要求你的电话号码或电子邮件。你通过一个唯一的匿名Hash ID进行标识。';

  @override
  String get secHashIdTitle => '你的 Hash ID';

  @override
  String get secHashIdDesc =>
      '这是你的唯一标识。它不会透露关于你的任何信息：不是你的名字，不是你的号码，也不是你的位置。这就像一个无法与你真实身份关联的化名。\n\n要添加联系人，你分享你的Hash ID或扫描二维码。就这样。没有同步的通讯录，没有\"你可能认识的人\"建议。';

  @override
  String get secDataLabel => '数据';

  @override
  String get secDataTitle => 'Hash不知道的事';

  @override
  String get secDataSubtitle => '保护你数据的最佳方式就是不收集它们。';

  @override
  String get secNeverCollected => '从不收集';

  @override
  String get secNeverItem1 => '消息内容';

  @override
  String get secNeverItem2 => '联系人列表';

  @override
  String get secNeverItem3 => '电话号码';

  @override
  String get secNeverItem4 => '电子邮件地址';

  @override
  String get secNeverItem5 => 'IP地址';

  @override
  String get secNeverItem6 => '位置';

  @override
  String get secNeverItem7 => '元数据（谁与谁通信）';

  @override
  String get secNeverItem8 => '通话记录';

  @override
  String get secNeverItem9 => '通讯录';

  @override
  String get secNeverItem10 => '广告标识';

  @override
  String get secTempStored => '临时存储';

  @override
  String get secTempItem1 => '匿名Hash ID（唯一标识）';

  @override
  String get secTempItem2 => '公共加密密钥';

  @override
  String get secTempItem3 => '传输中的加密消息（最长24小时）';

  @override
  String get secTempNote => '即使这些最少的数据也无法识别你。你的Hash ID不与任何个人信息关联。';

  @override
  String get secFooterTitle => '你的隐私，你的自由';

  @override
  String get secFooterDesc => 'Hash使用与最严格的专业应用相同的加密技术。你的消息受数学保护，而非承诺。';

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

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => '零痕跡。零妥協。';

  @override
  String get conversations => '聊天';

  @override
  String get contacts => '聯絡人';

  @override
  String get noConversation => '尚無聊天';

  @override
  String get noConversationSubtitle => '新增聯絡人開始安全聊天';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則待處理請求',
      one: '1 則待處理請求',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則已發送的請求待處理',
      one: '1 則已發送的請求待處理',
    );
    return '$_temp0';
  }

  @override
  String get addContact => '新增聯絡人';

  @override
  String get shareApp => '分享應用程式';

  @override
  String get newMessage => '新訊息';

  @override
  String get newConversation => '發送訊息';

  @override
  String get settings => '設定';

  @override
  String get myHashId => '我的 Hash ID';

  @override
  String get supportHash => '支持 Hash';

  @override
  String get supportHashSubtitle => 'Hash 是非營利專案';

  @override
  String get donate => '捐款';

  @override
  String get appearance => '外觀';

  @override
  String get theme => '主題';

  @override
  String get themeAuto => '自動';

  @override
  String get themeAutoSubtitle => '跟隨系統設定';

  @override
  String get themeDark => '深色';

  @override
  String get themeLight => '淺色';

  @override
  String get themeRecommendation => '建議使用深色主題以獲得更好的隱私保護';

  @override
  String get language => '語言';

  @override
  String get languageAuto => '自動（系統）';

  @override
  String get notifications => '通知';

  @override
  String get messages => '訊息';

  @override
  String get calls => '通話';

  @override
  String get vibration => '振動';

  @override
  String get notificationContent => '通知內容';

  @override
  String get notificationContentFull => '顯示全部';

  @override
  String get notificationContentFullDesc => '聯絡人姓名與訊息預覽';

  @override
  String get notificationContentName => '僅顯示姓名';

  @override
  String get notificationContentNameDesc => '僅顯示聯絡人姓名';

  @override
  String get notificationContentDiscrete => '低調';

  @override
  String get notificationContentDiscreteDesc => '僅顯示「新訊息」';

  @override
  String get security => '安全';

  @override
  String get howHashProtectsYou => 'Hash 如何保護你';

  @override
  String get howHashProtectsYouSubtitle => '瞭解你的安全防護';

  @override
  String get accountSecurity => '帳號安全';

  @override
  String get accountSecuritySubtitle => 'PIN碼、生物辨識、Vash 模式';

  @override
  String get blockScreenshots => '禁止截圖';

  @override
  String get transferDevice => '轉移到其他裝置';

  @override
  String get transferDeviceSubtitle => '遷移你的帳號';

  @override
  String get pinCode => 'PIN碼';

  @override
  String get changePin => '變更PIN碼';

  @override
  String get currentPin => '目前PIN碼';

  @override
  String get newPin => '新PIN碼';

  @override
  String get confirmPin => '確認PIN碼';

  @override
  String get pinChanged => 'PIN碼已變更';

  @override
  String get incorrectPin => 'PIN碼錯誤';

  @override
  String get pinsDoNotMatch => 'PIN碼不一致';

  @override
  String get autoLock => '自動鎖定';

  @override
  String get autoLockDelay => '鎖定延遲';

  @override
  String get autoLockImmediate => '立即';

  @override
  String get autoLockMinute => '1 分鐘';

  @override
  String autoLockMinutes(int count) {
    return '$count 分鐘';
  }

  @override
  String get vashCode => 'Vash 碼';

  @override
  String get vashModeTitle => 'Vash 模式';

  @override
  String get vashModeExplanation => '你的終極安全網。';

  @override
  String get vashModeDescription =>
      '你將選擇第二個PIN碼。如果你被迫開啟Hash，輸入此碼代替你的常規PIN。\n\n應用程式將正常開啟，但你的所有對話和聯絡人都已消失。\n\n對任何看著你螢幕的人來說，Hash看起來就是空的——彷彿你從未使用過。';

  @override
  String get vashModeIrreversible => '此操作無聲且不可逆。';

  @override
  String get chooseVashCode => '選擇我的 Vash 碼';

  @override
  String get vashCodeInfo => '第二個PIN碼，可正常開啟應用程式，但內容為空。';

  @override
  String get vashCodeInfoDetail => '如果你輸入此碼代替PIN碼：';

  @override
  String get vashDeleteContacts => '你的聯絡人會消失';

  @override
  String get vashDeleteMessages => '你的對話會消失';

  @override
  String get vashDeleteHistory => '你的筆記會消失';

  @override
  String get vashKeepId => '你的Hash身份（#XXX-XXX-XXX）保持不變';

  @override
  String get vashAppearNormal => '應用程式看起來正常但為空，如同全新。此操作不可逆。';

  @override
  String get setupVashCode => '設定 Vash 碼';

  @override
  String get modifyVashCode => '修改 Vash 碼';

  @override
  String get currentVashCode => '目前 Vash 碼';

  @override
  String get newVashCode => '新 Vash 碼';

  @override
  String get confirmVashCode => '確認 Vash 碼';

  @override
  String get vashCodeConfigured => 'Vash 碼已設定';

  @override
  String get vashCodeModified => 'Vash 碼已修改';

  @override
  String get vashCodeMustDiffer => 'Vash 碼必須與PIN碼不同';

  @override
  String get incorrectVashCode => 'Vash 碼錯誤';

  @override
  String get vashWhatToDelete => 'Vash 模式要讓什麼消失？';

  @override
  String get vashDeleteContactsOption => '聯絡人';

  @override
  String get vashDeleteMessagesOption => '訊息';

  @override
  String get vashDeleteNotesOption => '筆記';

  @override
  String get vashActivated => 'Vash 模式已啟用';

  @override
  String get vashCreateSubtitle => '請選擇與主PIN不同的碼';

  @override
  String get vashConfirmSubtitle => '確認你的 Vash 碼';

  @override
  String get pinCodeForEntry => 'PIN碼用於進入應用程式';

  @override
  String get vashCodeSection => 'Vash 模式';

  @override
  String get biometric => '生物辨識';

  @override
  String get biometricUnlock => '使用指紋或 Face ID 解鎖';

  @override
  String get enableBiometric => '啟用生物辨識';

  @override
  String get biometricWarningMessage =>
      '啟用生物辨識後，你將無法使用 Vash 碼進入應用程式。\n\n只有在生物辨識失敗（多次嘗試未果後）時，才能使用 Vash 碼。\n\n你確定要繼續嗎？';

  @override
  String get understood => '我明白了';

  @override
  String get shareAppSubtitle => '與你的親友分享 Hash';

  @override
  String get share => '分享';

  @override
  String get danger => '危險';

  @override
  String get deleteAccount => '刪除我的帳號';

  @override
  String get deleteAccountSubtitle => '不可逆操作';

  @override
  String get deleteAccountConfirmTitle => '刪除我的帳號';

  @override
  String get deleteAccountConfirmMessage =>
      '你的帳號將被永久刪除。此操作不可逆。\n\n• 你的所有聊天\n• 你的所有聯絡人\n• 你的 Hash ID\n\n你將需要建立新帳號。';

  @override
  String get deleteForever => '永久刪除';

  @override
  String get cancel => '取消';

  @override
  String get dataDeletedForSecurity => 'Vash 模式已啟用。';

  @override
  String deletionError(String error) {
    return '刪除錯誤：$error';
  }

  @override
  String get yourSecurity => '你的安全';

  @override
  String get securityInfo =>
      '• 端對端加密（Signal Protocol）\n• 傳送後伺服器不保留資料\n• 金鑰僅儲存在你的裝置上\n• PIN碼從不傳送到伺服器';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => '歡迎';

  @override
  String get securityStatement1 => '你的訊息受到保護。';

  @override
  String get securityStatement2 => '端對端加密。';

  @override
  String get securityStatement3 => '零痕跡。零妥協。';

  @override
  String get securityStatement4 => '你的隱私是一項權利。';

  @override
  String get accessBlocked => '存取被封鎖';

  @override
  String get tooManyAttempts => '嘗試次數過多，請稍後再試。';

  @override
  String get pleaseWait => '請稍候';

  @override
  String get waitDelay => '請等待倒數結束';

  @override
  String attemptCount(int current, int max) {
    return '第 $current 次嘗試，共 $max 次';
  }

  @override
  String retryIn(String time) {
    return '$time後重試';
  }

  @override
  String get forgotPin => '忘記PIN碼？使用恢復短語';

  @override
  String get useRecoveryPhrase => '使用恢復短語';

  @override
  String get recoveryWarningTitle => '警告';

  @override
  String get recoveryWarningMessage => '帳號恢復將：';

  @override
  String get recoveryDeleteAllMessages => '刪除你的所有訊息';

  @override
  String get recoveryWaitDelay => '需要等待 1 小時';

  @override
  String get recoveryKeepContacts => '保留你的聯絡人';

  @override
  String get recoveryIrreversible => '此操作不可逆。你的訊息將永久遺失。';

  @override
  String get iUnderstand => '我瞭解';

  @override
  String get accountRecovery => '帳號恢復';

  @override
  String get enterRecoveryPhrase => '輸入你的24個恢復短語單詞，以空格分隔。';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => '恢復';

  @override
  String get recoveryPhraseRequired => '請輸入你的恢復短語';

  @override
  String get recoveryPhrase24Words => '短語必須包含24個單詞';

  @override
  String get incorrectRecoveryPhrase => '恢復短語錯誤';

  @override
  String get recoveryInitError => '初始化恢復時發生錯誤';

  @override
  String get securityDelay => '安全延遲';

  @override
  String get securityDelayMessage => '為了你的安全，建立新PIN碼前需要一段等待時間。';

  @override
  String get timeRemaining => '剩餘時間';

  @override
  String get messagesDeletedForProtection => '你的訊息已被刪除以保護你。';

  @override
  String get canCloseApp => '你可以關閉應用程式稍後再回來。';

  @override
  String get onboardingTitle1 => '歡迎使用 Hash';

  @override
  String get onboardingSubtitle1 => '不留痕跡的通訊工具';

  @override
  String get onboardingTitle2 => '完全加密';

  @override
  String get onboardingSubtitle2 => '你的訊息使用 Signal 協議進行端對端加密';

  @override
  String get onboardingTitle3 => '零痕跡';

  @override
  String get onboardingSubtitle3 => '訊息在傳送後即從伺服器刪除';

  @override
  String get onboardingTitle4 => '你的安全';

  @override
  String get onboardingSubtitle4 => 'PIN碼、Vash 模式與恢復短語';

  @override
  String get getStarted => '開始使用';

  @override
  String get next => '下一步';

  @override
  String get skip => '略過';

  @override
  String get alreadyHaveAccount => '我已有帳號';

  @override
  String get transferMyAccount => '轉移我的帳號';

  @override
  String get createPin => '建立PIN碼';

  @override
  String get createPinSubtitle => '此碼將保護你的應用程式存取';

  @override
  String get confirmYourPin => '確認你的PIN碼';

  @override
  String get confirmPinSubtitle => '再次輸入你的PIN碼';

  @override
  String get saveRecoveryPhrase => '恢復短語';

  @override
  String get saveRecoveryPhraseSubtitle => '按順序寫下這24個單詞。如果你忘記PIN碼，它們將幫助你恢復帳號。';

  @override
  String get phraseWritten => '我已寫下短語';

  @override
  String get warningRecoveryPhrase => '如果你遺失此短語並忘記PIN碼，你將無法存取你的帳號。';

  @override
  String get accountTransferred => '帳號已轉移';

  @override
  String get accountTransferredMessage => '你的帳號已轉移到另一台裝置。此工作階段已失效。';

  @override
  String get accountTransferredInfo => '如果你沒有發起此轉移，你的帳號可能已被盜用。';

  @override
  String get logout => '登出';

  @override
  String get transferAccount => '轉移帳號';

  @override
  String get transferAccountInfo => '將你的Hash帳號轉移到新裝置。你目前的工作階段將失效。';

  @override
  String get generateTransferCode => '產生轉移碼';

  @override
  String get transferCode => '轉移碼';

  @override
  String transferCodeExpires(int minutes) {
    return '此碼將在 $minutes 分鐘後過期';
  }

  @override
  String get enterCodeOnNewDevice => '在新裝置上輸入此碼以轉移你的帳號。';

  @override
  String get generateNewCode => '產生新碼';

  @override
  String get scanQrCode => '掃描 QR 碼';

  @override
  String get scanQrCodeSubtitle => '掃描聯絡人的 QR 碼以新增';

  @override
  String get qrCodeDetected => '偵測到 QR 碼';

  @override
  String get invalidQrCode => '無效的 QR 碼';

  @override
  String get cameraPermissionRequired => '需要相機權限';

  @override
  String get myQrCode => '我的 QR 碼';

  @override
  String get myQrCodeSubtitle => '分享此 QR 碼讓你的聯絡人新增你';

  @override
  String get shareQrCode => '分享';

  @override
  String get addContactTitle => '新增聯絡人';

  @override
  String get addContactByHashId => '輸入聯絡人的 Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => '搜尋';

  @override
  String get contactNotFound => '找不到聯絡人';

  @override
  String get contactAlreadyAdded => '此聯絡人已在你的清單中';

  @override
  String get contactAdded => '聯絡人已新增';

  @override
  String get myProfile => '我的個人資料';

  @override
  String get myProfileSubtitle => '分享此資訊以便他人新增你';

  @override
  String get temporaryCode => '臨時碼';

  @override
  String temporaryCodeExpires(String time) {
    return '$time後過期';
  }

  @override
  String get codeExpired => '驗證碼已過期';

  @override
  String get generateNewCodeButton => '新驗證碼';

  @override
  String get copyHashId => '複製 ID';

  @override
  String get copyCode => '複製驗證碼';

  @override
  String get copiedToClipboard => '已複製';

  @override
  String get showMyQrCode => '顯示我的 QR 碼';

  @override
  String get orDivider => '或';

  @override
  String get openScanner => '開啟掃描器';

  @override
  String get addManually => '手動新增';

  @override
  String get contactHashIdLabel => '聯絡人的 Hash ID';

  @override
  String get temporaryCodeLabel => '臨時碼';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode => '請聯絡人從其個人資料中產生驗證碼';

  @override
  String get verifyAndAdd => '驗證並新增';

  @override
  String get fillAllFields => '請填寫所有欄位';

  @override
  String get invalidHashIdFormat => 'ID格式無效（例如：123-456-ABC）';

  @override
  String get userNotFound => '找不到使用者';

  @override
  String get cannotAddYourself => '你不能新增自己';

  @override
  String get invalidOrExpiredCode => '臨時碼無效或已過期';

  @override
  String get contactFound => '找到聯絡人！';

  @override
  String get howToCallContact => '你想怎麼稱呼對方？';

  @override
  String get contactNameHint => '聯絡人名稱';

  @override
  String get addContactButton => '新增';

  @override
  String get contactDetails => '聯絡人詳情';

  @override
  String get contactName => '聯絡人名稱';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '新增於 $date';
  }

  @override
  String get deleteContact => '刪除聯絡人';

  @override
  String deleteContactConfirm(Object name) {
    return '刪除此聯絡人？';
  }

  @override
  String get deleteContactMessage => '這也將刪除整個聊天。';

  @override
  String get delete => '刪除';

  @override
  String get typeMessage => '輸入訊息...';

  @override
  String get messageSent => '已傳送';

  @override
  String get messageDelivered => '已送達';

  @override
  String get messageRead => '已讀';

  @override
  String get messageFailed => '傳送失敗';

  @override
  String get now => '現在';

  @override
  String minutesAgo(int count) {
    return '$count分鐘';
  }

  @override
  String hoursAgo(int count) {
    return '$count小時';
  }

  @override
  String daysAgo(int count) {
    return '$count天';
  }

  @override
  String get today => '今天';

  @override
  String get yesterday => '昨天';

  @override
  String dateAtTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get shareMessage =>
      '加入我使用 Hash！🔒\n\n這是一款真正私密的通訊工具：完全加密，伺服器零痕跡，需要時還有緊急模式。\n\n在這裡下載應用程式 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => '錯誤';

  @override
  String get ok => '確定';

  @override
  String get view => '檢視';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get save => '儲存';

  @override
  String get edit => '編輯';

  @override
  String get close => '關閉';

  @override
  String get confirm => '確認';

  @override
  String get loading => '載入中...';

  @override
  String get retry => '重試';

  @override
  String get pendingRequests => '待處理請求';

  @override
  String get noPendingRequests => '沒有待處理的請求';

  @override
  String get pendingRequestsSubtitle => '這些人想要新增你';

  @override
  String requestFromUser(String hashId) {
    return '來自 $hashId 的請求';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days 天後過期';
  }

  @override
  String get acceptRequest => '接受';

  @override
  String get rejectRequest => '拒絕';

  @override
  String get requestAccepted => '請求已接受';

  @override
  String get requestRejected => '請求已拒絕';

  @override
  String get requestSent => '請求已傳送！';

  @override
  String get requestSentSubtitle => '你的請求已傳送。對方必須接受後你們才能聊天。';

  @override
  String get requestAlreadyPending => '已有一個待處理的請求';

  @override
  String get requestAlreadySentByOther => '此人已向你發送請求';

  @override
  String get addByHashId => '透過 Hash ID 新增';

  @override
  String get addByHashIdSubtitle => '輸入聯絡人的 Hash ID 與臨時碼';

  @override
  String get enterTemporaryCode => '輸入6位數驗證碼';

  @override
  String get sendRequest => '傳送請求';

  @override
  String get acceptContactTitle => '接受聯絡人';

  @override
  String get acceptContactSubtitle => '你可以給對方取一個自訂名稱';

  @override
  String get leaveEmptyForHashId => '留空則使用 Hash ID';

  @override
  String get firstName => '名字';

  @override
  String get lastName => '姓氏';

  @override
  String get notes => '筆記';

  @override
  String get notesHint => '關於此聯絡人的個人筆記';

  @override
  String get photoOptional => '照片（選填）';

  @override
  String get contactNameOptional => '名稱（選填）';

  @override
  String get notesOptional => '筆記（選填）';

  @override
  String get storedLocally => '僅儲存在你的裝置上';

  @override
  String get encryptedMessageLabel => '加密訊息';

  @override
  String get identityMessageHint => '你是誰？你們怎麼認識的？';

  @override
  String get messageWillBeSentEncrypted => '此訊息將被加密並傳送給對方';

  @override
  String get sendRequestButton => '傳送請求';

  @override
  String get requestExpiresIn24h => '請求將在24小時內未接受則過期';

  @override
  String get theyAlreadySentYouRequest => '此人已向你發送請求';

  @override
  String get requests => '請求';

  @override
  String get receivedRequests => '已接收';

  @override
  String get sentRequests => '已傳送';

  @override
  String get noSentRequests => '沒有已傳送的請求';

  @override
  String get cancelRequest => '取消';

  @override
  String get deleteRequest => '刪除請求';

  @override
  String get requestCancelled => '請求已取消';

  @override
  String sentTo(String hashId) {
    return '已傳送至 $hashId';
  }

  @override
  String expiresIn(String time) {
    return '$time後過期';
  }

  @override
  String receivedAgo(String time) {
    return '$time前收到';
  }

  @override
  String get messageFromRequester => '請求者的訊息';

  @override
  String get copy => '複製';

  @override
  String get messageInfo => '訊息資訊';

  @override
  String get messageDirection => '方向';

  @override
  String get messageSentByYou => '你傳送的';

  @override
  String get messageReceived => '已接收';

  @override
  String get messageSentAt => '傳送於';

  @override
  String get messageStatus => '狀態';

  @override
  String get messageReadAt => '讀取於';

  @override
  String get messageType => '類型';

  @override
  String get messageSize => '大小';

  @override
  String get messageExpiresAt => '過期於';

  @override
  String get messageEncrypted => '端對端加密';

  @override
  String get messageStatusSending => '傳送中...';

  @override
  String get messageStatusSent => '已傳送';

  @override
  String get messageStatusDelivered => '已送達';

  @override
  String get messageStatusRead => '已讀';

  @override
  String get messageStatusFailed => '失敗';

  @override
  String get serverStatus => '伺服器';

  @override
  String get onServer => '等待送達';

  @override
  String get deletedFromServer => '已刪除';

  @override
  String get messageTypeText => '文字';

  @override
  String get messageTypeImage => '圖片';

  @override
  String get messageTypeVideo => '影片';

  @override
  String get messageTypeVoice => '語音';

  @override
  String get messageTypeFile => '檔案';

  @override
  String get indefinitely => '無限期';

  @override
  String get hoursShort => '小時';

  @override
  String get minutesShort => '分鐘';

  @override
  String get hours => '小時';

  @override
  String get minutes => '分鐘';

  @override
  String get seconds => '秒';

  @override
  String get ephemeralMessages => '閱後即焚訊息';

  @override
  String get ephemeralMessagesDescription => '訊息在此時間後自動刪除';

  @override
  String get ephemeralImmediate => '立即（閱讀後）';

  @override
  String get ephemeralImmediateDesc => '閱讀後立即刪除';

  @override
  String get ephemeralMyPreference => '我的偏好';

  @override
  String get ephemeralMyPreferenceDesc => '使用全域設定';

  @override
  String get ephemeralDefaultSetting => '訊息存續時間';

  @override
  String get ephemeralChooseDefault => '建議';

  @override
  String get ephemeral30Seconds => '30 秒';

  @override
  String get ephemeral30SecondsDesc => '閱讀後30秒刪除';

  @override
  String get ephemeral5Minutes => '5 分鐘';

  @override
  String get ephemeral5MinutesDesc => '閱讀後5分鐘刪除';

  @override
  String get ephemeral1Hour => '1 小時';

  @override
  String get ephemeral1HourDesc => '閱讀後1小時刪除';

  @override
  String get ephemeral3Hours => '3 小時';

  @override
  String get ephemeral6Hours => '6 小時';

  @override
  String get ephemeral6HoursDesc => '閱讀後6小時刪除';

  @override
  String get ephemeral12Hours => '12 小時';

  @override
  String get ephemeral24Hours => '24 小時';

  @override
  String get ephemeral24HoursDesc => '閱讀後24小時刪除';

  @override
  String get customDuration => '自訂時間';

  @override
  String get howItWorks => '如何運作';

  @override
  String get ephemeralExplanation1 => '訊息在接收後即從伺服器刪除。';

  @override
  String get ephemeralExplanation2 => '此設定定義訊息在你閱讀後何時從你的手機上消失。';

  @override
  String get ephemeralExplanation3 => '你的聯絡人有自己的設定用於其手機。';

  @override
  String get mute1Hour => '1 小時';

  @override
  String get mute8Hours => '8 小時';

  @override
  String get mute1Day => '1 天';

  @override
  String get mute1Week => '1 週';

  @override
  String get muteAlways => '永遠';

  @override
  String get muteExplanation => '你將不會收到此聯絡人的通知';

  @override
  String get showCallsInRecents => '在最近通話中顯示';

  @override
  String get showCallsInRecentsSubtitle => 'Hash 通話將出現在手機通話紀錄中';

  @override
  String get feedback => '意見回饋';

  @override
  String get muteNotifications => '靜音通知';

  @override
  String get muteDescription => '你將不會收到此聯絡人的通知';

  @override
  String mutedUntil(String time) {
    return '靜音至 $time';
  }

  @override
  String get notMuted => '通知已啟用';

  @override
  String get unmute => '取消靜音';

  @override
  String get notificationSound => '通知音效';

  @override
  String get defaultSound => '預設';

  @override
  String get chatSettings => '聊天設定';

  @override
  String get bubbleColor => '氣泡顏色';

  @override
  String get backgroundColor => '背景顏色';

  @override
  String get backgroundImage => '背景圖片';

  @override
  String get chatBackground => '聊天背景';

  @override
  String get customColor => '自訂';

  @override
  String get defaultColor => '預設';

  @override
  String get imageSelected => '已選擇圖片';

  @override
  String get noImage => '沒有圖片';

  @override
  String get color => '顏色';

  @override
  String get image => '圖片';

  @override
  String get tapToSelectImage => '點選以選擇圖片';

  @override
  String get changeImage => '更換圖片';

  @override
  String get previewMessageReceived => '你好！';

  @override
  String get previewMessageSent => '嗨！';

  @override
  String get messageAction => '訊息';

  @override
  String get callAction => '通話';

  @override
  String get videoAction => '視訊';

  @override
  String get personalNotes => '個人筆記';

  @override
  String get addNotes => '新增筆記...';

  @override
  String get noNotes => '沒有筆記';

  @override
  String get messageNotifications => '訊息通知';

  @override
  String get callNotifications => '通話通知';

  @override
  String get useGradient => '使用漸層';

  @override
  String get gradientStart => '起始顏色';

  @override
  String get gradientEnd => '結束顏色';

  @override
  String get preview => '預覽';

  @override
  String get reset => '重設';

  @override
  String get securityNumber => '安全號碼';

  @override
  String securityNumberDescription(String name) {
    return '驗證安全號碼是否與 $name 的裝置一致';
  }

  @override
  String get verifyEncryption => '驗證端對端加密';

  @override
  String get tapToCopy => '點選複製';

  @override
  String get howToVerify => '如何驗證';

  @override
  String get verifyStep1 => '親自見面或打電話給你的聯絡人';

  @override
  String get verifyStep2 => '比較安全號碼或掃描 QR 碼';

  @override
  String get verifyStep3 => '如果一致，你的聊天是安全的';

  @override
  String get scanToVerify => '掃描驗證';

  @override
  String get reportSpam => '檢舉垃圾訊息';

  @override
  String get reportSpamSubtitle => '將此聯絡人檢舉為垃圾訊息';

  @override
  String get reportSpamDescription => '這將匿名檢舉此聯絡人。你的身份不會被分享。你確定嗎？';

  @override
  String get report => '檢舉';

  @override
  String get spamReported => '垃圾訊息已檢舉';

  @override
  String get reportError => '檢舉傳送失敗。請重試。';

  @override
  String get reportRateLimited => '你今天的檢舉次數已達上限。';

  @override
  String get blockContact => '封鎖聯絡人';

  @override
  String get blockContactDescription => '此聯絡人將無法再向你傳送訊息或撥打電話。對方不會收到通知。';

  @override
  String get unblockContact => '解除封鎖';

  @override
  String get unblockContactDescription => '此聯絡人將能夠再次向你傳送訊息和撥打電話。';

  @override
  String get contactBlocked => '聯絡人已封鎖';

  @override
  String get contactUnblocked => '聯絡人已解除封鎖';

  @override
  String get contactIsBlocked => '此聯絡人已被封鎖';

  @override
  String get unblock => '解除封鎖';

  @override
  String get deleteContactSubtitle => '刪除此聯絡人與聊天';

  @override
  String get confirmWithPin => '使用PIN碼確認';

  @override
  String get enterPinToConfirm => '輸入你的PIN碼以確認此操作';

  @override
  String get profilePhoto => '個人照片';

  @override
  String get takePhoto => '拍照';

  @override
  String get chooseFromGallery => '從相簿選擇';

  @override
  String get removePhoto => '移除照片';

  @override
  String get viewContactHashId => '檢視聯絡人識別碼';

  @override
  String get hashIdPartiallyMasked => '為你的安全和聯絡人的隱私而部分遮蔽';

  @override
  String get addFirstContact => '新增你的第一個聯絡人';

  @override
  String get addFirstContactSubtitle => '分享你的 QR 碼或掃描朋友的';

  @override
  String get directory => '通訊錄';

  @override
  String get noContacts => '沒有聯絡人';

  @override
  String get noContactsSubtitle => '新增聯絡人以開始';

  @override
  String get sendMessageAction => '傳送訊息';

  @override
  String get audioCall => '語音通話';

  @override
  String get videoCall => '視訊通話';

  @override
  String get viewProfile => '檢視個人資料';

  @override
  String get deleteContactDirectory => '刪除聯絡人';

  @override
  String get scanShort => '掃描';

  @override
  String get addShort => '新增';

  @override
  String deleteContactConfirmName(String name) {
    return '確定要刪除 $name 嗎？';
  }

  @override
  String get noNotesTitle => '沒有筆記';

  @override
  String get noNotesSubtitle => '建立你的第一個筆記';

  @override
  String get newNote => '新筆記';

  @override
  String get editNote => '編輯筆記';

  @override
  String get deleteNote => '刪除筆記';

  @override
  String get deleteNoteConfirm => '確定要刪除此筆記嗎？';

  @override
  String get noteTitle => '標題';

  @override
  String get noteContent => '內容';

  @override
  String get addItem => '新增項目';

  @override
  String get pinNote => '釘選';

  @override
  String get unpinNote => '取消釘選';

  @override
  String get noteColor => '顏色';

  @override
  String get notePassword => '密碼';

  @override
  String get setPassword => '設定密碼';

  @override
  String get changePassword => '變更密碼';

  @override
  String get removePassword => '移除密碼';

  @override
  String get enterPassword => '輸入密碼';

  @override
  String get confirmPassword => '確認密碼';

  @override
  String get passwordPin => 'PIN碼';

  @override
  String get passwordText => '文字密碼';

  @override
  String get protectedNote => '受保護的筆記';

  @override
  String get incorrectPassword => '密碼錯誤';

  @override
  String get passwordSet => '密碼已設定';

  @override
  String get passwordRemoved => '密碼已移除';

  @override
  String get notesBiometric => 'Face ID 用於筆記';

  @override
  String get notesBiometricSubtitle => '需要生物辨識驗證才能開啟受保護的筆記';

  @override
  String get textNote => '文字筆記';

  @override
  String get checklistNote => '待辦清單';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total 個任務';
  }

  @override
  String get autoSaved => '已儲存';

  @override
  String get searchNotes => '搜尋筆記';

  @override
  String get legalConsent => '法律同意';

  @override
  String get confirmAge13 => '我確認我已年滿13歲';

  @override
  String get acceptLegalStart => '我接受';

  @override
  String get privacyPolicy => '隱私權政策';

  @override
  String get termsOfService => '服務條款';

  @override
  String get andThe => '與';

  @override
  String get continueButton => '繼續';

  @override
  String get mustAcceptTerms => '你必須同意兩項條件才能繼續';

  @override
  String get support => '支援';

  @override
  String get contactSupport => '聯絡支援';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => '檢舉濫用';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => '法律';

  @override
  String get legalEntity => '法律實體';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => '釘選';

  @override
  String get unpinConversation => '取消釘選';

  @override
  String get hideConversation => '從動態中移除';

  @override
  String get deleteConversation => '刪除對話';

  @override
  String get deleteConversationConfirm => '輸入你的PIN碼以確認刪除所有訊息';

  @override
  String get noConversations => '尚無對話';

  @override
  String get startConversation => '開始';

  @override
  String get microphonePermissionRequired => '需要麥克風存取權限';

  @override
  String get microphonePermissionExplanation => 'Hash 需要麥克風來進行通話。';

  @override
  String get cameraPermissionExplanation => 'Hash 需要相機來進行視訊通話。';

  @override
  String get openSettings => '開啟設定';

  @override
  String get callConnecting => '連線中...';

  @override
  String get callRinging => '撥號中...';

  @override
  String get callReconnecting => '重新連線中...';

  @override
  String callReconnectingTimer(int seconds) {
    return '重新連線中（$seconds秒）';
  }

  @override
  String get callPaused => '已暫停';

  @override
  String get callPausedSubtitle => '通話仍在進行中';

  @override
  String get callRemoteMicMuted => '對方已靜音';

  @override
  String get callMiniControlsMute => '靜音';

  @override
  String get callMiniControlsUnmute => '取消靜音';

  @override
  String get callMiniControlsHangUp => '掛斷';

  @override
  String get callMiniControlsReturn => '返回通話';

  @override
  String get callNetworkPoor => '連線不穩定';

  @override
  String get callNetworkLost => '連線已中斷';

  @override
  String get callEndedTitle => '通話已結束';

  @override
  String get deviceData => '裝置資料';

  @override
  String get deviceDataSubtitle => '本機與伺服器儲存';

  @override
  String get localStorage => '本機儲存';

  @override
  String get onThisDevice => '在此裝置上';

  @override
  String get encryptedDatabases => '加密資料庫';

  @override
  String get files => '檔案';

  @override
  String get secureKeychain => '安全鑰匙圈';

  @override
  String get cache => '快取';

  @override
  String get contactsDetail => '姓名、頭像、Signal 金鑰';

  @override
  String get messagesDetail => '加密對話';

  @override
  String get notesDetail => '個人筆記';

  @override
  String get signalSessions => 'Signal 工作階段';

  @override
  String get signalSessionsDetail => '加密工作階段';

  @override
  String get pendingContacts => '待處理聯絡人';

  @override
  String get pendingContactsDetail => '待處理的請求';

  @override
  String get callHistory => '通話';

  @override
  String get callHistoryDetail => '通話紀錄';

  @override
  String get preferences => '偏好設定';

  @override
  String get preferencesDetail => '媒體與通話偏好';

  @override
  String get avatars => '頭像';

  @override
  String get media => '媒體';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個檔案',
      one: '1 個檔案',
      zero: '無檔案',
    );
    return '$_temp0';
  }

  @override
  String get active => '已啟用';

  @override
  String get notDefined => '未設定';

  @override
  String get biometrics => '生物辨識';

  @override
  String get recoveryPhrase => '恢復短語';

  @override
  String get identity => '身份（Hash ID）';

  @override
  String get signalKeys => 'Signal Protocol 金鑰';

  @override
  String get authTokens => '驗證權杖';

  @override
  String get contactNamesCache => '聯絡人名稱快取';

  @override
  String get remoteConfig => '遠端設定';

  @override
  String get notificationPrefs => '通知偏好';

  @override
  String get serverData => '伺服器資料';

  @override
  String get serverDataInfo => 'Hash 在伺服器上僅保留最少量的資料，全部加密或為臨時性。';

  @override
  String get serverProfile => '個人資料';

  @override
  String get serverProfileDetail => 'Hash ID、公鑰、信箱權杖';

  @override
  String get serverPrekeys => '預先金鑰';

  @override
  String get serverPrekeysDetail => '一次性 Signal 金鑰（已消耗）';

  @override
  String get serverMessages => '傳輸中的訊息';

  @override
  String get serverMessagesDetail => '送達後刪除（最長24小時）';

  @override
  String get serverMedia => '傳輸中的媒體';

  @override
  String get serverMediaDetail => '下載後刪除';

  @override
  String get serverContactRequests => '聯絡請求';

  @override
  String get serverContactRequestsDetail => '24小時後過期';

  @override
  String get serverRateLimits => '速率限制';

  @override
  String get serverRateLimitsDetail => '臨時防濫用資料';

  @override
  String get privacyReassurance => 'Hash 無法讀取你的訊息。所有資料均採用端對端加密。伺服器資料會自動刪除。';

  @override
  String get pinTooSimple => '此PIN碼太簡單。請選擇更安全的碼。';

  @override
  String get genericError => '發生錯誤。請重試。';

  @override
  String accountCreationError(String error) {
    return '無法建立帳號：$error';
  }

  @override
  String get phraseCopiedToClipboard => '短語已複製到剪貼簿';

  @override
  String get copyPhrase => '複製短語';

  @override
  String get recoveryPhraseSecurityWarning =>
      '請將此短語寫在安全的地方。如果你遺失PIN碼又沒有此短語，你將永久失去資料存取權。';

  @override
  String get noMessages => '沒有訊息';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '刪除與 $name 的所有訊息？';
  }

  @override
  String get confirmation => '確認';

  @override
  String get untitled => '無標題';

  @override
  String get noSessions => '沒有工作階段';

  @override
  String get unknownContact => '未知聯絡人';

  @override
  String get unnamed => '未命名';

  @override
  String get noPendingRequestsAlt => '沒有待處理的請求';

  @override
  String get deleteAllCallHistory => '刪除所有通話紀錄？';

  @override
  String get noCalls => '沒有通話';

  @override
  String get noPreferences => '沒有偏好設定';

  @override
  String get resetAllMediaPrefs => '重設所有媒體偏好？';

  @override
  String get deleteThisAvatar => '刪除此頭像？';

  @override
  String get deleteAllAvatars => '刪除所有頭像？';

  @override
  String get noAvatars => '沒有頭像';

  @override
  String get deleteThisFile => '刪除此檔案？';

  @override
  String get deleteAllMediaFiles => '刪除所有媒體？';

  @override
  String get noMediaFiles => '沒有媒體';

  @override
  String get outgoing => '撥出';

  @override
  String get incoming => '撥入';

  @override
  String ephemeralViewDuration(int seconds) {
    return '閱後即焚：$seconds秒';
  }

  @override
  String get normalView => '一般檢視';

  @override
  String get callReasonCompleted => '已完成';

  @override
  String get callReasonMissed => '未接';

  @override
  String get callReasonDeclined => '已拒絕';

  @override
  String get callReasonFailed => '失敗';

  @override
  String get justNow => '剛剛';

  @override
  String timeAgoMinutes(int count) {
    return '$count 分鐘前';
  }

  @override
  String timeAgoHours(int count) {
    return '$count 小時前';
  }

  @override
  String timeAgoDays(int count) {
    return '$count 天前';
  }

  @override
  String get messageTypeContact => '聯絡人';

  @override
  String get messageTypeLocation => '位置';

  @override
  String get statusQueued => '排隊中';

  @override
  String get blockedBadge => '已封鎖';

  @override
  String get protectedBadge => '受保護';

  @override
  String messageCount(int count) {
    return '$count 則訊息';
  }

  @override
  String get deleteQuestion => '刪除？';

  @override
  String get transferMyAccountTitle => '轉移我的帳號';

  @override
  String get loadingError => '載入錯誤';

  @override
  String get transferToNewDevice => '轉移到新裝置';

  @override
  String get transferInstructions => '在新裝置上選擇「恢復我的帳號」並輸入以下資訊：';

  @override
  String get yourHashIdLabel => '你的 Hash ID';

  @override
  String get enterYourPinCode => '輸入你的PIN碼';

  @override
  String get pinOwnerConfirmation => '確認你是此帳號的擁有者';

  @override
  String get scanThisQrCode => '掃描此 QR 碼';

  @override
  String get withYourNewDevice => '使用你的新裝置';

  @override
  String get orEnterTheCode => '或輸入代碼';

  @override
  String get transferCodeLabel => '轉移碼';

  @override
  String get proximityVerification => '近距離驗證';

  @override
  String get bringDevicesCloser => '將兩台裝置靠近';

  @override
  String get confirmTransferQuestion => '確認轉移？';

  @override
  String get accountWillBeTransferred => '你的帳號將轉移到新裝置。\n\n此裝置將被永久中斷連線。';

  @override
  String get transferComplete => '轉移完成';

  @override
  String get transferSuccessMessage => '你的帳號已成功轉移。\n\n此應用程式將立即關閉。';

  @override
  String get manualVerification => '手動驗證';

  @override
  String get codeDisplayedOnBothDevices => '兩台裝置上顯示的代碼：';

  @override
  String get doesCodeMatchNewDevice => '此代碼是否與新裝置上的一致？';

  @override
  String get verifiedStatus => '已驗證';

  @override
  String get inProgressStatus => '進行中...';

  @override
  String get notAvailableStatus => '無法使用';

  @override
  String get codeExpiredRestart => '代碼已過期。請重新開始。';

  @override
  String get codesDoNotMatchCancelled => '代碼不一致。轉移已取消。';

  @override
  String transferToDevice(String device) {
    return '至：$device';
  }

  @override
  String get copiedExclamation => '已複製！';

  @override
  String expiresInTime(String time) {
    return '$time後過期';
  }

  @override
  String get biometricNotAvailable => '此裝置不支援生物辨識';

  @override
  String get biometricAuthError => '生物辨識驗證時發生錯誤';

  @override
  String get authenticateForBiometric => '請進行驗證以啟用生物辨識';

  @override
  String get biometricAuthFailed => '生物辨識驗證失敗';

  @override
  String get forceUpdateTitle => '需要更新';

  @override
  String get forceUpdateMessage => '有新版本的 Hash 可用。請更新以繼續使用。';

  @override
  String get updateButton => '更新';

  @override
  String get maintenanceInProgress => '維護中';

  @override
  String get tryAgainLater => '請稍後再試';

  @override
  String get information => '資訊';

  @override
  String get later => '稍後';

  @override
  String get doYouLikeHash => '你喜歡 Hash 嗎？';

  @override
  String get yourFeedbackHelps => '你的回饋有助於我們改善應用程式';

  @override
  String get ratingTerrible => '很差';

  @override
  String get ratingBad => '差';

  @override
  String get ratingOk => '一般';

  @override
  String get ratingGood => '好';

  @override
  String get ratingExcellent => '非常好！';

  @override
  String get donationMessage => 'Hash 是非營利專案。你的支持幫助我們持續開發真正私密的通訊工具。';

  @override
  String get recentConnections => '最近的連線';

  @override
  String get loginInfoText => '每次PIN解鎖都會在本機記錄。僅保留最近24小時的紀錄。';

  @override
  String get connectionCount => '連線次數';

  @override
  String get periodLabel => '期間';

  @override
  String get historyLabel => '紀錄';

  @override
  String get noLoginRecorded => '沒有登入紀錄';

  @override
  String get nextUnlocksAppearHere => '下次解鎖將顯示在此。';

  @override
  String get dataLocalOnly => '此資料僅儲存在你的裝置上，永不傳送。';

  @override
  String get currentSession => '目前';

  @override
  String get todayLabel => '今天';

  @override
  String get yesterdayLabel => '昨天';

  @override
  String get justNowLabel => '剛剛';

  @override
  String minutesAgoLabel(int count) {
    return '$count 分鐘前';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours 小時前';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours小時$minutes分鐘前';
  }

  @override
  String get noMaintenancePlanned => '無預定維護';

  @override
  String get everythingWorkingNormally => '一切運作正常';

  @override
  String get maintenanceTitle => '維護';

  @override
  String get maintenanceActiveLabel => '進行中';

  @override
  String get maintenancePlannedLabel => '已預定';

  @override
  String get locking => '鎖定中...';

  @override
  String get newMessageNotification => '新訊息';

  @override
  String get secExplainTitle => 'Hash 如何保護你';

  @override
  String get secExplainIntro => 'Hash 的設計使任何人都無法讀取你的訊息。';

  @override
  String get secExplainIntroSub => '連我們也不行。\n以下是簡單說明。';

  @override
  String get secJourneyLabel => '旅程';

  @override
  String get secJourneyTitle => '你的訊息之旅';

  @override
  String get secJourneySubtitle => '從你的手指到聯絡人的螢幕，每一步都受到保護。跟隨這條路。';

  @override
  String get secStep1Title => '你撰寫訊息';

  @override
  String get secStep1Desc => '你在應用程式中輸入「嗨！」。此時訊息僅存在於手機記憶體中。什麼都還沒送出。';

  @override
  String get secStep2Title => 'Signal Protocol 加密';

  @override
  String get secStep2Desc =>
      '當你按下「傳送」，你的訊息會被轉換成一串無法理解的字元。就像你的訊息被鎖進一個只有聯絡人才有鑰匙的保險箱。';

  @override
  String get secStep3Title => 'Sealed Sender：隱形信封';

  @override
  String get secStep3Desc =>
      '想像你寄了一封信，但信封上沒有寄件人地址。這正是 Hash 所做的。訊息被投入匿名信箱。伺服器不知道是誰寄的。';

  @override
  String get secStep4Title => '伺服器什麼都看不到';

  @override
  String get secStep4Desc =>
      '伺服器扮演一個盲目的郵差。它只知道「有人在信箱 #A7X9 投了東西」。它不知道是誰寄的、內容是什麼、也不知道要給誰。';

  @override
  String get secStep4Highlight => '不儲存任何中繼資料：沒有 IP 位址、沒有時間戳記、沒有寄件人與收件人的關聯。';

  @override
  String get secStep5Title => '你的聯絡人收到訊息';

  @override
  String get secStep5Desc => '聯絡人的手機從匿名信箱取出內容，並用從未離開其裝置的私鑰解密訊息。「嗨！」出現在其螢幕上。';

  @override
  String get secStep6Title => '訊息從伺服器消失';

  @override
  String get secStep6Desc =>
      '聯絡人確認收到後，伺服器會永久刪除訊息。沒有垃圾桶、沒有存檔、沒有備份。未讀訊息也會在24小時後自動銷毀。';

  @override
  String get secStep7Title => '本機過期';

  @override
  String get secStep7Desc => '在聯絡人的手機上，訊息會根據你選擇的時間自動銷毀：閱讀後立即、5分鐘、1小時……由你決定。';

  @override
  String get secJourneyConclusion => '結果：伺服器上零痕跡，裝置上零痕跡。訊息僅存在到被閱讀為止，然後消失。';

  @override
  String get secArchLabel => '架構';

  @override
  String get secArchTitle => '5 層保護';

  @override
  String get secArchSubtitle => 'Hash 不依賴單一技術。每一層都強化其他層。即使一層被突破，你的資料仍然安全。';

  @override
  String get secLayer1Title => '端對端加密';

  @override
  String get secLayer1Desc =>
      '每則訊息都使用獨特的金鑰加密。簡單來說：即使有人解密了一則訊息，也無法解密下一則。每則訊息都有自己的鎖。';

  @override
  String get secLayer1Detail =>
      '對於檔案（照片、影片、文件），Hash 使用額外的 AES-256-GCM 加密。檔案在離開你的手機前就已加密。';

  @override
  String get secLayer2Title => 'Sealed Sender（網路匿名）';

  @override
  String get secLayer2Desc =>
      '一般通訊工具傳送訊息時會附上你的身份，就像在信封上寫上你的名字。Hash 使用匿名信箱：伺服器送出訊息時不知道是誰寄的。';

  @override
  String get secLayer2Detail => '結果：即使伺服器資料洩漏，也不可能重建誰與誰通訊。';

  @override
  String get secLayer3Title => '自動刪除';

  @override
  String get secLayer3Desc => '訊息在確認收到後即從伺服器刪除。即使訊息從未被取回，也會在24小時後自動銷毀。';

  @override
  String get secLayer3Detail =>
      '在你的手機上，訊息會根據你選擇的時間自動銷毀：立即、5分鐘、15分鐘、30分鐘、1小時、3小時、6小時或12小時。';

  @override
  String get secLayer4Title => '本機存取保護';

  @override
  String get secLayer4Desc =>
      '應用程式受6位數PIN碼和/或生物辨識（Face ID、指紋）保護。嘗試失敗過多次後，應用程式會鎖定，每次失敗延遲遞增。';

  @override
  String get secLayer5Title => '鎖定的資料庫';

  @override
  String get secLayer5Desc => '在伺服器端，沒有使用者可以直接寫入資料庫。所有操作都通過安全函式進行，每個請求都會被驗證。';

  @override
  String get secLayer5Detail => '就像銀行櫃台：你永遠不會自己碰到金庫。你提出請求，系統在執行前驗證你的權限。';

  @override
  String get secVashLabel => '全球獨創';

  @override
  String get secVashTitle => 'Vash 模式';

  @override
  String get secVashSubtitle => '一個不存在於任何其他通訊應用程式的緊急安全系統。';

  @override
  String get secVashScenarioTitle => '想像這個情境';

  @override
  String get secVashScenario1 => '有人拿到你的手機';

  @override
  String get secVashScenario2 => '有人要求你輸入PIN碼';

  @override
  String get secVashScenario3 => '你想緊急清除所有資料';

  @override
  String get secVashSolutionTitle => '解決方案：兩組PIN碼';

  @override
  String get secVashSolutionDesc => '你在 Hash 中設定兩組不同的PIN碼：';

  @override
  String get secVashNormalCodeLabel => '正常碼';

  @override
  String get secVashNormalCodeDesc => '正常開啟應用程式，顯示所有資料';

  @override
  String get secVashCodeLabel2 => 'Vash 碼';

  @override
  String get secVashCodeDescription => '正常開啟應用程式……但所有資料在背景中悄悄被刪除';

  @override
  String get secVashWhatHappensTitle => '接下來會發生什麼';

  @override
  String get secVashWhatHappensDesc =>
      '應用程式正常開啟。沒有警示、沒有可疑動畫。螢幕只是顯示一個空的應用程式，彷彿你剛安裝。\n\n實際上，你的所有對話、聯絡人和訊息已在瞬間被不可逆地刪除。';

  @override
  String get secCallsLabel => '通話與檔案';

  @override
  String get secCallsTitle => '一切都經過加密';

  @override
  String get secCallsSubtitle => '不僅僅是訊息。所有通過 Hash 傳輸的內容都經過端對端加密。';

  @override
  String get secAudioCallTitle => '語音通話';

  @override
  String get secAudioCallDesc => '透過 WebRTC 端對端加密。語音在裝置間直接傳輸。';

  @override
  String get secVideoCallTitle => '視訊通話';

  @override
  String get secVideoCallDesc => '相同技術，每個串流個別加密。';

  @override
  String get secPhotosTitle => '照片與影片';

  @override
  String get secPhotosDesc => '以 AES-256-GCM 加密後才離開你的手機。';

  @override
  String get secDocsTitle => '文件';

  @override
  String get secDocsDesc => 'PDF、ZIP 或任何檔案。名稱、大小與內容皆加密。';

  @override
  String get secAnonLabel => '匿名';

  @override
  String get secAnonTitle => '不需要任何身份';

  @override
  String get secAnonSubtitle => 'Hash 從不要求你的電話號碼或電子郵件。你以獨特且匿名的 Hash ID 識別。';

  @override
  String get secHashIdTitle => '你的 Hash ID';

  @override
  String get secHashIdDesc =>
      '這是你的唯一識別碼。它不揭露你的任何資訊：你的名字、電話號碼、位置。就像一個無法與你真實身份連結的化名。\n\n要新增聯絡人，你分享 Hash ID 或掃描 QR 碼。就這樣。沒有同步的通訊錄，沒有「你可能認識的人」建議。';

  @override
  String get secDataLabel => '資料';

  @override
  String get secDataTitle => 'Hash 不知道的事';

  @override
  String get secDataSubtitle => '保護資料的最好方式就是不收集它。';

  @override
  String get secNeverCollected => '從未收集';

  @override
  String get secNeverItem1 => '訊息內容';

  @override
  String get secNeverItem2 => '聯絡人清單';

  @override
  String get secNeverItem3 => '電話號碼';

  @override
  String get secNeverItem4 => '電子郵件';

  @override
  String get secNeverItem5 => 'IP 位址';

  @override
  String get secNeverItem6 => '位置';

  @override
  String get secNeverItem7 => '中繼資料（誰與誰通訊）';

  @override
  String get secNeverItem8 => '通話紀錄';

  @override
  String get secNeverItem9 => '通訊錄';

  @override
  String get secNeverItem10 => '廣告識別碼';

  @override
  String get secTempStored => '臨時儲存';

  @override
  String get secTempItem1 => '匿名 Hash ID（唯一識別碼）';

  @override
  String get secTempItem2 => '公開加密金鑰';

  @override
  String get secTempItem3 => '傳輸中的加密訊息（最長24小時）';

  @override
  String get secTempNote => '即使是這些最少量的資料也無法識別你的身份。你的 Hash ID 未與任何個人資訊連結。';

  @override
  String get secFooterTitle => '你的隱私，你的自由';

  @override
  String get secFooterDesc => 'Hash 使用與最嚴格的專業應用程式相同的加密技術。你的訊息受數學保護，而非承諾。';
}

/// The translations for Chinese, as used in Hong Kong, using the Han script (`zh_Hant_HK`).
class AppLocalizationsZhHantHk extends AppLocalizationsZh {
  AppLocalizationsZhHantHk() : super('zh_Hant_HK');

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => '零痕跡。零妥協。';

  @override
  String get conversations => '傾偈';

  @override
  String get contacts => '聯絡人';

  @override
  String get noConversation => '冇傾偈';

  @override
  String get noConversationSubtitle => '加個聯絡人開始安全傾偈啦';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個待處理請求',
      one: '1 個待處理請求',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個已發送嘅請求待處理',
      one: '1 個已發送嘅請求待處理',
    );
    return '$_temp0';
  }

  @override
  String get addContact => '加聯絡人';

  @override
  String get shareApp => '分享應用程式';

  @override
  String get newMessage => '新訊息';

  @override
  String get newConversation => '發送訊息';

  @override
  String get settings => '設定';

  @override
  String get myHashId => '我嘅 Hash ID';

  @override
  String get supportHash => '支持 Hash';

  @override
  String get supportHashSubtitle => 'Hash 係非牟利項目';

  @override
  String get donate => '捐款';

  @override
  String get appearance => '外觀';

  @override
  String get theme => '主題';

  @override
  String get themeAuto => '自動';

  @override
  String get themeAutoSubtitle => '跟住系統設定';

  @override
  String get themeDark => '深色';

  @override
  String get themeLight => '淺色';

  @override
  String get themeRecommendation => '建議用深色主題，更加保障私隱';

  @override
  String get language => '語言';

  @override
  String get languageAuto => '自動（系統）';

  @override
  String get notifications => '通知';

  @override
  String get messages => '訊息';

  @override
  String get calls => '通話';

  @override
  String get vibration => '震動';

  @override
  String get notificationContent => '通知內容';

  @override
  String get notificationContentFull => '顯示全部';

  @override
  String get notificationContentFullDesc => '聯絡人名同訊息預覽';

  @override
  String get notificationContentName => '淨係顯示名';

  @override
  String get notificationContentNameDesc => '淨係顯示聯絡人名';

  @override
  String get notificationContentDiscrete => '低調';

  @override
  String get notificationContentDiscreteDesc => '淨係顯示「新訊息」';

  @override
  String get security => '安全';

  @override
  String get howHashProtectsYou => 'Hash 點樣保護你';

  @override
  String get howHashProtectsYouSubtitle => '了解你嘅安全保障';

  @override
  String get accountSecurity => '帳號安全';

  @override
  String get accountSecuritySubtitle => 'PIN碼、生物辨識、Vash 模式';

  @override
  String get blockScreenshots => '禁止截圖';

  @override
  String get transferDevice => '轉移去其他裝置';

  @override
  String get transferDeviceSubtitle => '搬你嘅帳號';

  @override
  String get pinCode => 'PIN碼';

  @override
  String get changePin => '改PIN碼';

  @override
  String get currentPin => '而家嘅PIN碼';

  @override
  String get newPin => '新PIN碼';

  @override
  String get confirmPin => '確認PIN碼';

  @override
  String get pinChanged => 'PIN碼已改咗';

  @override
  String get incorrectPin => 'PIN碼錯咗';

  @override
  String get pinsDoNotMatch => 'PIN碼唔一樣';

  @override
  String get autoLock => '自動鎖定';

  @override
  String get autoLockDelay => '鎖定延遲';

  @override
  String get autoLockImmediate => '即刻';

  @override
  String get autoLockMinute => '1 分鐘';

  @override
  String autoLockMinutes(int count) {
    return '$count 分鐘';
  }

  @override
  String get vashCode => 'Vash 碼';

  @override
  String get vashModeTitle => 'Vash 模式';

  @override
  String get vashModeExplanation => '你嘅終極安全網。';

  @override
  String get vashModeDescription =>
      '你會揀第二個PIN碼。如果你俾人迫住開 Hash，就輸入呢個碼代替你嘅正常PIN。\n\n應用程式會正常開到，但你所有對話同聯絡人都已經冇晒。\n\n任何人望住你個螢幕，Hash 睇落就好似空嘅——好似你從來冇用過咁。';

  @override
  String get vashModeIrreversible => '呢個操作係靜靜雞同埋唔可以逆轉嘅。';

  @override
  String get chooseVashCode => '揀我嘅 Vash 碼';

  @override
  String get vashCodeInfo => '第二個PIN碼，可以正常開應用程式，但入面係空嘅。';

  @override
  String get vashCodeInfoDetail => '如果你輸入呢個碼代替PIN碼：';

  @override
  String get vashDeleteContacts => '你嘅聯絡人會消失';

  @override
  String get vashDeleteMessages => '你嘅對話會消失';

  @override
  String get vashDeleteHistory => '你嘅筆記會消失';

  @override
  String get vashKeepId => '你嘅 Hash 身份（#XXX-XXX-XXX）保持唔變';

  @override
  String get vashAppearNormal => '應用程式睇落正常但係空嘅，好似全新咁。呢個操作唔可以逆轉。';

  @override
  String get setupVashCode => '設定 Vash 碼';

  @override
  String get modifyVashCode => '改 Vash 碼';

  @override
  String get currentVashCode => '而家嘅 Vash 碼';

  @override
  String get newVashCode => '新 Vash 碼';

  @override
  String get confirmVashCode => '確認 Vash 碼';

  @override
  String get vashCodeConfigured => 'Vash 碼設定好咗';

  @override
  String get vashCodeModified => 'Vash 碼改咗';

  @override
  String get vashCodeMustDiffer => 'Vash 碼一定要同PIN碼唔同';

  @override
  String get incorrectVashCode => 'Vash 碼錯咗';

  @override
  String get vashWhatToDelete => 'Vash 模式要令乜嘢消失？';

  @override
  String get vashDeleteContactsOption => '聯絡人';

  @override
  String get vashDeleteMessagesOption => '訊息';

  @override
  String get vashDeleteNotesOption => '筆記';

  @override
  String get vashActivated => 'Vash 模式已啟用';

  @override
  String get vashCreateSubtitle => '揀一個同你主PIN唔同嘅碼';

  @override
  String get vashConfirmSubtitle => '確認你嘅 Vash 碼';

  @override
  String get pinCodeForEntry => 'PIN碼用嚟入應用程式';

  @override
  String get vashCodeSection => 'Vash 模式';

  @override
  String get biometric => '生物辨識';

  @override
  String get biometricUnlock => '用指紋或 Face ID 解鎖';

  @override
  String get enableBiometric => '啟用生物辨識';

  @override
  String get biometricWarningMessage =>
      '啟用生物辨識之後，你就唔可以用 Vash 碼入應用程式。\n\n淨係喺生物辨識失敗（試咗幾次之後）先可以用 Vash 碼。\n\n你確定要繼續？';

  @override
  String get understood => '我明白';

  @override
  String get shareAppSubtitle => '同你嘅朋友分享 Hash';

  @override
  String get share => '分享';

  @override
  String get danger => '危險';

  @override
  String get deleteAccount => '刪除我嘅帳號';

  @override
  String get deleteAccountSubtitle => '唔可以逆轉嘅操作';

  @override
  String get deleteAccountConfirmTitle => '刪除我嘅帳號';

  @override
  String get deleteAccountConfirmMessage =>
      '你嘅帳號會被永久刪除。呢個操作唔可以逆轉。\n\n• 你所有傾偈\n• 你所有聯絡人\n• 你嘅 Hash ID\n\n你需要重新開個新帳號。';

  @override
  String get deleteForever => '永久刪除';

  @override
  String get cancel => '取消';

  @override
  String get dataDeletedForSecurity => 'Vash 模式已啟用。';

  @override
  String deletionError(String error) {
    return '刪除錯誤：$error';
  }

  @override
  String get yourSecurity => '你嘅安全';

  @override
  String get securityInfo =>
      '• 端對端加密（Signal Protocol）\n• 傳送後伺服器唔會保留資料\n• 密鑰淨係儲喺你嘅裝置\n• PIN碼永遠唔會傳去伺服器';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => '歡迎';

  @override
  String get securityStatement1 => '你嘅訊息受到保護。';

  @override
  String get securityStatement2 => '端對端加密。';

  @override
  String get securityStatement3 => '零痕跡。零妥協。';

  @override
  String get securityStatement4 => '你嘅私隱係一項權利。';

  @override
  String get accessBlocked => '存取被封鎖';

  @override
  String get tooManyAttempts => '試太多次喇，請遲啲再試。';

  @override
  String get pleaseWait => '請等一陣';

  @override
  String get waitDelay => '請等倒數完';

  @override
  String attemptCount(int current, int max) {
    return '第 $current 次嘗試，共 $max 次';
  }

  @override
  String retryIn(String time) {
    return '$time之後再試';
  }

  @override
  String get forgotPin => '唔記得PIN碼？用恢復短語';

  @override
  String get useRecoveryPhrase => '用恢復短語';

  @override
  String get recoveryWarningTitle => '警告';

  @override
  String get recoveryWarningMessage => '帳號恢復會：';

  @override
  String get recoveryDeleteAllMessages => '刪除你所有訊息';

  @override
  String get recoveryWaitDelay => '需要等 1 個鐘';

  @override
  String get recoveryKeepContacts => '保留你嘅聯絡人';

  @override
  String get recoveryIrreversible => '呢個操作唔可以逆轉。你嘅訊息會永久消失。';

  @override
  String get iUnderstand => '我明白';

  @override
  String get accountRecovery => '帳號恢復';

  @override
  String get enterRecoveryPhrase => '輸入你嘅24個恢復短語單詞，用空格分隔。';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => '恢復';

  @override
  String get recoveryPhraseRequired => '請輸入你嘅恢復短語';

  @override
  String get recoveryPhrase24Words => '短語一定要有24個詞';

  @override
  String get incorrectRecoveryPhrase => '恢復短語錯咗';

  @override
  String get recoveryInitError => '初始化恢復嗰陣出錯';

  @override
  String get securityDelay => '安全延遲';

  @override
  String get securityDelayMessage => '為咗你嘅安全，建立新PIN碼之前需要等一陣。';

  @override
  String get timeRemaining => '剩餘時間';

  @override
  String get messagesDeletedForProtection => '你嘅訊息已經刪除嚟保護你。';

  @override
  String get canCloseApp => '你可以閂咗應用程式遲啲再返嚟。';

  @override
  String get onboardingTitle1 => '歡迎使用 Hash';

  @override
  String get onboardingSubtitle1 => '唔留痕跡嘅通訊工具';

  @override
  String get onboardingTitle2 => '全面加密';

  @override
  String get onboardingSubtitle2 => '你嘅訊息用 Signal 協議進行端對端加密';

  @override
  String get onboardingTitle3 => '零痕跡';

  @override
  String get onboardingSubtitle3 => '訊息喺傳送後即刻從伺服器刪除';

  @override
  String get onboardingTitle4 => '你嘅安全';

  @override
  String get onboardingSubtitle4 => 'PIN碼、Vash 模式同恢復短語';

  @override
  String get getStarted => '開始使用';

  @override
  String get next => '下一步';

  @override
  String get skip => '跳過';

  @override
  String get alreadyHaveAccount => '我已經有帳號';

  @override
  String get transferMyAccount => '轉移我嘅帳號';

  @override
  String get createPin => '建立PIN碼';

  @override
  String get createPinSubtitle => '呢個碼會保護你嘅應用程式存取';

  @override
  String get confirmYourPin => '確認你嘅PIN碼';

  @override
  String get confirmPinSubtitle => '再輸入一次你嘅PIN碼';

  @override
  String get saveRecoveryPhrase => '恢復短語';

  @override
  String get saveRecoveryPhraseSubtitle => '按順序寫低呢24個詞。如果你唔記得PIN碼，佢哋可以幫你恢復帳號。';

  @override
  String get phraseWritten => '我已經寫低短語';

  @override
  String get warningRecoveryPhrase => '如果你唔見咗呢個短語又唔記得PIN碼，你就冇辦法入到你嘅帳號。';

  @override
  String get accountTransferred => '帳號已轉移';

  @override
  String get accountTransferredMessage => '你嘅帳號已經轉移去另一部裝置。呢個工作階段已經失效。';

  @override
  String get accountTransferredInfo => '如果唔係你發起呢個轉移，你嘅帳號可能已經被人攞咗。';

  @override
  String get logout => '登出';

  @override
  String get transferAccount => '轉移帳號';

  @override
  String get transferAccountInfo => '將你嘅 Hash 帳號轉移去新裝置。你而家嘅工作階段會失效。';

  @override
  String get generateTransferCode => '產生轉移碼';

  @override
  String get transferCode => '轉移碼';

  @override
  String transferCodeExpires(int minutes) {
    return '呢個碼會喺 $minutes 分鐘後過期';
  }

  @override
  String get enterCodeOnNewDevice => '喺新裝置上輸入呢個碼嚟轉移你嘅帳號。';

  @override
  String get generateNewCode => '產生新碼';

  @override
  String get scanQrCode => '掃描 QR 碼';

  @override
  String get scanQrCodeSubtitle => '掃描聯絡人嘅 QR 碼嚟加佢';

  @override
  String get qrCodeDetected => '偵測到 QR 碼';

  @override
  String get invalidQrCode => '無效嘅 QR 碼';

  @override
  String get cameraPermissionRequired => '需要相機權限';

  @override
  String get myQrCode => '我嘅 QR 碼';

  @override
  String get myQrCodeSubtitle => '分享呢個 QR 碼俾你嘅聯絡人加你';

  @override
  String get shareQrCode => '分享';

  @override
  String get addContactTitle => '加聯絡人';

  @override
  String get addContactByHashId => '輸入聯絡人嘅 Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => '搜尋';

  @override
  String get contactNotFound => '搵唔到聯絡人';

  @override
  String get contactAlreadyAdded => '呢個聯絡人已經喺你嘅清單入面';

  @override
  String get contactAdded => '聯絡人已加咗';

  @override
  String get myProfile => '我嘅個人資料';

  @override
  String get myProfileSubtitle => '分享呢啲資料俾人加你';

  @override
  String get temporaryCode => '臨時碼';

  @override
  String temporaryCodeExpires(String time) {
    return '$time後過期';
  }

  @override
  String get codeExpired => '驗證碼已過期';

  @override
  String get generateNewCodeButton => '新驗證碼';

  @override
  String get copyHashId => '複製 ID';

  @override
  String get copyCode => '複製驗證碼';

  @override
  String get copiedToClipboard => '已複製';

  @override
  String get showMyQrCode => '顯示我嘅 QR 碼';

  @override
  String get orDivider => '或';

  @override
  String get openScanner => '開掃描器';

  @override
  String get addManually => '手動加';

  @override
  String get contactHashIdLabel => '聯絡人嘅 Hash ID';

  @override
  String get temporaryCodeLabel => '臨時碼';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode => '叫你嘅聯絡人喺佢嘅個人資料度產生驗證碼';

  @override
  String get verifyAndAdd => '驗證並加入';

  @override
  String get fillAllFields => '請填好所有欄位';

  @override
  String get invalidHashIdFormat => 'ID格式唔啱（例如：123-456-ABC）';

  @override
  String get userNotFound => '搵唔到用戶';

  @override
  String get cannotAddYourself => '你唔可以加自己';

  @override
  String get invalidOrExpiredCode => '臨時碼無效或已過期';

  @override
  String get contactFound => '搵到聯絡人！';

  @override
  String get howToCallContact => '你想點稱呼佢？';

  @override
  String get contactNameHint => '聯絡人名稱';

  @override
  String get addContactButton => '加入';

  @override
  String get contactDetails => '聯絡人詳情';

  @override
  String get contactName => '聯絡人名稱';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '喺 $date 加入';
  }

  @override
  String get deleteContact => '刪除聯絡人';

  @override
  String deleteContactConfirm(Object name) {
    return '刪除呢個聯絡人？';
  }

  @override
  String get deleteContactMessage => '呢個操作會連埋成個傾偈一齊刪除。';

  @override
  String get delete => '刪除';

  @override
  String get typeMessage => '輸入訊息...';

  @override
  String get messageSent => '已傳送';

  @override
  String get messageDelivered => '已送達';

  @override
  String get messageRead => '已讀';

  @override
  String get messageFailed => '傳送失敗';

  @override
  String get now => '而家';

  @override
  String minutesAgo(int count) {
    return '$count分鐘';
  }

  @override
  String hoursAgo(int count) {
    return '$count個鐘';
  }

  @override
  String daysAgo(int count) {
    return '$count日';
  }

  @override
  String get today => '今日';

  @override
  String get yesterday => '尋日';

  @override
  String dateAtTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get shareMessage =>
      '一齊用 Hash 啦！🔒\n\n呢個係一個真正私密嘅通訊工具：全面加密，伺服器零痕跡，需要嗰陣仲有緊急模式。\n\n喺呢度下載應用程式 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => '錯誤';

  @override
  String get ok => '確定';

  @override
  String get view => '睇吓';

  @override
  String get yes => '係';

  @override
  String get no => '唔係';

  @override
  String get save => '儲存';

  @override
  String get edit => '編輯';

  @override
  String get close => '關閉';

  @override
  String get confirm => '確認';

  @override
  String get loading => '載入緊...';

  @override
  String get retry => '再試';

  @override
  String get pendingRequests => '待處理請求';

  @override
  String get noPendingRequests => '冇待處理嘅請求';

  @override
  String get pendingRequestsSubtitle => '呢啲人想加你';

  @override
  String requestFromUser(String hashId) {
    return '來自 $hashId 嘅請求';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days 日後過期';
  }

  @override
  String get acceptRequest => '接受';

  @override
  String get rejectRequest => '拒絕';

  @override
  String get requestAccepted => '請求已接受';

  @override
  String get requestRejected => '請求已拒絕';

  @override
  String get requestSent => '請求已傳送！';

  @override
  String get requestSentSubtitle => '你嘅請求已傳送。對方要接受咗先可以傾偈。';

  @override
  String get requestAlreadyPending => '已經有一個待處理嘅請求';

  @override
  String get requestAlreadySentByOther => '呢個人已經send咗請求俾你';

  @override
  String get addByHashId => '透過 Hash ID 加入';

  @override
  String get addByHashIdSubtitle => '輸入聯絡人嘅 Hash ID 同臨時碼';

  @override
  String get enterTemporaryCode => '輸入6位數驗證碼';

  @override
  String get sendRequest => '傳送請求';

  @override
  String get acceptContactTitle => '接受聯絡人';

  @override
  String get acceptContactSubtitle => '你可以幫佢改個自訂名';

  @override
  String get leaveEmptyForHashId => '留空就會用 Hash ID';

  @override
  String get firstName => '名';

  @override
  String get lastName => '姓';

  @override
  String get notes => '筆記';

  @override
  String get notesHint => '關於呢個聯絡人嘅個人筆記';

  @override
  String get photoOptional => '相片（可選）';

  @override
  String get contactNameOptional => '名稱（可選）';

  @override
  String get notesOptional => '筆記（可選）';

  @override
  String get storedLocally => '淨係儲喺你嘅裝置';

  @override
  String get encryptedMessageLabel => '加密訊息';

  @override
  String get identityMessageHint => '你係邊個？你哋點認識嘅？';

  @override
  String get messageWillBeSentEncrypted => '呢個訊息會加密後傳送俾對方';

  @override
  String get sendRequestButton => '傳送請求';

  @override
  String get requestExpiresIn24h => '請求會喺24個鐘內未接受就過期';

  @override
  String get theyAlreadySentYouRequest => '呢個人已經send咗請求俾你';

  @override
  String get requests => '請求';

  @override
  String get receivedRequests => '已接收';

  @override
  String get sentRequests => '已傳送';

  @override
  String get noSentRequests => '冇已傳送嘅請求';

  @override
  String get cancelRequest => '取消';

  @override
  String get deleteRequest => '刪除請求';

  @override
  String get requestCancelled => '請求已取消';

  @override
  String sentTo(String hashId) {
    return '已傳送俾 $hashId';
  }

  @override
  String expiresIn(String time) {
    return '$time後過期';
  }

  @override
  String receivedAgo(String time) {
    return '$time前收到';
  }

  @override
  String get messageFromRequester => '請求者嘅訊息';

  @override
  String get copy => '複製';

  @override
  String get messageInfo => '訊息資訊';

  @override
  String get messageDirection => '方向';

  @override
  String get messageSentByYou => '你傳送嘅';

  @override
  String get messageReceived => '已接收';

  @override
  String get messageSentAt => '傳送於';

  @override
  String get messageStatus => '狀態';

  @override
  String get messageReadAt => '讀取於';

  @override
  String get messageType => '類型';

  @override
  String get messageSize => '大小';

  @override
  String get messageExpiresAt => '過期於';

  @override
  String get messageEncrypted => '端對端加密';

  @override
  String get messageStatusSending => '傳送緊...';

  @override
  String get messageStatusSent => '已傳送';

  @override
  String get messageStatusDelivered => '已送達';

  @override
  String get messageStatusRead => '已讀';

  @override
  String get messageStatusFailed => '失敗';

  @override
  String get serverStatus => '伺服器';

  @override
  String get onServer => '等緊送達';

  @override
  String get deletedFromServer => '已刪除';

  @override
  String get messageTypeText => '文字';

  @override
  String get messageTypeImage => '圖片';

  @override
  String get messageTypeVideo => '影片';

  @override
  String get messageTypeVoice => '語音';

  @override
  String get messageTypeFile => '檔案';

  @override
  String get indefinitely => '無限期';

  @override
  String get hoursShort => '個鐘';

  @override
  String get minutesShort => '分鐘';

  @override
  String get hours => '個鐘';

  @override
  String get minutes => '分鐘';

  @override
  String get seconds => '秒';

  @override
  String get ephemeralMessages => '閱後即焚訊息';

  @override
  String get ephemeralMessagesDescription => '訊息喺呢段時間後自動刪除';

  @override
  String get ephemeralImmediate => '即刻（睇完之後）';

  @override
  String get ephemeralImmediateDesc => '睇完即刻刪除';

  @override
  String get ephemeralMyPreference => '我嘅偏好';

  @override
  String get ephemeralMyPreferenceDesc => '用全域設定';

  @override
  String get ephemeralDefaultSetting => '訊息存續時間';

  @override
  String get ephemeralChooseDefault => '建議';

  @override
  String get ephemeral30Seconds => '30 秒';

  @override
  String get ephemeral30SecondsDesc => '睇完後30秒刪除';

  @override
  String get ephemeral5Minutes => '5 分鐘';

  @override
  String get ephemeral5MinutesDesc => '睇完後5分鐘刪除';

  @override
  String get ephemeral1Hour => '1 個鐘';

  @override
  String get ephemeral1HourDesc => '睇完後1個鐘刪除';

  @override
  String get ephemeral3Hours => '3 個鐘';

  @override
  String get ephemeral6Hours => '6 個鐘';

  @override
  String get ephemeral6HoursDesc => '睇完後6個鐘刪除';

  @override
  String get ephemeral12Hours => '12 個鐘';

  @override
  String get ephemeral24Hours => '24 個鐘';

  @override
  String get ephemeral24HoursDesc => '睇完後24個鐘刪除';

  @override
  String get customDuration => '自訂時間';

  @override
  String get howItWorks => '點樣運作';

  @override
  String get ephemeralExplanation1 => '訊息喺收到之後即刻從伺服器刪除。';

  @override
  String get ephemeralExplanation2 => '呢個設定定義訊息喺你睇完之後幾時從你手機消失。';

  @override
  String get ephemeralExplanation3 => '你嘅聯絡人有佢自己嘅設定用喺佢嘅手機。';

  @override
  String get mute1Hour => '1 個鐘';

  @override
  String get mute8Hours => '8 個鐘';

  @override
  String get mute1Day => '1 日';

  @override
  String get mute1Week => '1 個禮拜';

  @override
  String get muteAlways => '永遠';

  @override
  String get muteExplanation => '你唔會收到呢個聯絡人嘅通知';

  @override
  String get showCallsInRecents => '喺最近通話顯示';

  @override
  String get showCallsInRecentsSubtitle => 'Hash 通話會出現喺手機通話紀錄';

  @override
  String get feedback => '意見回饋';

  @override
  String get muteNotifications => '靜音通知';

  @override
  String get muteDescription => '你唔會收到呢個聯絡人嘅通知';

  @override
  String mutedUntil(String time) {
    return '靜音至 $time';
  }

  @override
  String get notMuted => '通知已啟用';

  @override
  String get unmute => '取消靜音';

  @override
  String get notificationSound => '通知音效';

  @override
  String get defaultSound => '預設';

  @override
  String get chatSettings => '傾偈設定';

  @override
  String get bubbleColor => '氣泡顏色';

  @override
  String get backgroundColor => '背景顏色';

  @override
  String get backgroundImage => '背景圖片';

  @override
  String get chatBackground => '傾偈背景';

  @override
  String get customColor => '自訂';

  @override
  String get defaultColor => '預設';

  @override
  String get imageSelected => '已揀圖片';

  @override
  String get noImage => '冇圖片';

  @override
  String get color => '顏色';

  @override
  String get image => '圖片';

  @override
  String get tapToSelectImage => '撳嚟揀圖片';

  @override
  String get changeImage => '換圖片';

  @override
  String get previewMessageReceived => '你好！';

  @override
  String get previewMessageSent => '喂！';

  @override
  String get messageAction => '訊息';

  @override
  String get callAction => '打電話';

  @override
  String get videoAction => '視像';

  @override
  String get personalNotes => '個人筆記';

  @override
  String get addNotes => '加筆記...';

  @override
  String get noNotes => '冇筆記';

  @override
  String get messageNotifications => '訊息通知';

  @override
  String get callNotifications => '通話通知';

  @override
  String get useGradient => '用漸變';

  @override
  String get gradientStart => '開始顏色';

  @override
  String get gradientEnd => '結束顏色';

  @override
  String get preview => '預覽';

  @override
  String get reset => '重設';

  @override
  String get securityNumber => '安全號碼';

  @override
  String securityNumberDescription(String name) {
    return '驗證安全號碼係咪同 $name 嘅裝置一致';
  }

  @override
  String get verifyEncryption => '驗證端對端加密';

  @override
  String get tapToCopy => '撳嚟複製';

  @override
  String get howToVerify => '點樣驗證';

  @override
  String get verifyStep1 => '親身見面或者打電話俾你嘅聯絡人';

  @override
  String get verifyStep2 => '比較安全號碼或者掃 QR 碼';

  @override
  String get verifyStep3 => '如果一樣，你哋嘅傾偈就係安全嘅';

  @override
  String get scanToVerify => '掃描驗證';

  @override
  String get reportSpam => '舉報垃圾訊息';

  @override
  String get reportSpamSubtitle => '將呢個聯絡人舉報為垃圾訊息';

  @override
  String get reportSpamDescription => '呢個會匿名舉報呢個聯絡人。你嘅身份唔會被分享。你確定？';

  @override
  String get report => '舉報';

  @override
  String get spamReported => '垃圾訊息已舉報';

  @override
  String get reportError => '舉報傳送失敗。請再試。';

  @override
  String get reportRateLimited => '你今日嘅舉報次數已達上限。';

  @override
  String get blockContact => '封鎖聯絡人';

  @override
  String get blockContactDescription => '呢個聯絡人唔可以再send訊息或者打電話俾你。對方唔會收到通知。';

  @override
  String get unblockContact => '解除封鎖';

  @override
  String get unblockContactDescription => '呢個聯絡人可以再send訊息同打電話俾你。';

  @override
  String get contactBlocked => '聯絡人已封鎖';

  @override
  String get contactUnblocked => '聯絡人已解除封鎖';

  @override
  String get contactIsBlocked => '呢個聯絡人已被封鎖';

  @override
  String get unblock => '解除封鎖';

  @override
  String get deleteContactSubtitle => '刪除呢個聯絡人同傾偈';

  @override
  String get confirmWithPin => '用PIN碼確認';

  @override
  String get enterPinToConfirm => '輸入你嘅PIN碼嚟確認呢個操作';

  @override
  String get profilePhoto => '個人相片';

  @override
  String get takePhoto => '影相';

  @override
  String get chooseFromGallery => '從相簿揀';

  @override
  String get removePhoto => '移除相片';

  @override
  String get viewContactHashId => '睇聯絡人識別碼';

  @override
  String get hashIdPartiallyMasked => '為你嘅安全同聯絡人嘅私隱而部分遮蔽';

  @override
  String get addFirstContact => '加你第一個聯絡人';

  @override
  String get addFirstContactSubtitle => '分享你嘅 QR 碼或者掃朋友嘅';

  @override
  String get directory => '通訊錄';

  @override
  String get noContacts => '冇聯絡人';

  @override
  String get noContactsSubtitle => '加個聯絡人開始啦';

  @override
  String get sendMessageAction => '傳送訊息';

  @override
  String get audioCall => '語音通話';

  @override
  String get videoCall => '視像通話';

  @override
  String get viewProfile => '睇個人資料';

  @override
  String get deleteContactDirectory => '刪除聯絡人';

  @override
  String get scanShort => '掃描';

  @override
  String get addShort => '加入';

  @override
  String deleteContactConfirmName(String name) {
    return '確定要刪除 $name？';
  }

  @override
  String get noNotesTitle => '冇筆記';

  @override
  String get noNotesSubtitle => '建立你第一個筆記';

  @override
  String get newNote => '新筆記';

  @override
  String get editNote => '編輯筆記';

  @override
  String get deleteNote => '刪除筆記';

  @override
  String get deleteNoteConfirm => '確定要刪除呢個筆記？';

  @override
  String get noteTitle => '標題';

  @override
  String get noteContent => '內容';

  @override
  String get addItem => '加項目';

  @override
  String get pinNote => '釘選';

  @override
  String get unpinNote => '取消釘選';

  @override
  String get noteColor => '顏色';

  @override
  String get notePassword => '密碼';

  @override
  String get setPassword => '設定密碼';

  @override
  String get changePassword => '改密碼';

  @override
  String get removePassword => '移除密碼';

  @override
  String get enterPassword => '輸入密碼';

  @override
  String get confirmPassword => '確認密碼';

  @override
  String get passwordPin => 'PIN碼';

  @override
  String get passwordText => '文字密碼';

  @override
  String get protectedNote => '受保護嘅筆記';

  @override
  String get incorrectPassword => '密碼錯咗';

  @override
  String get passwordSet => '密碼已設定';

  @override
  String get passwordRemoved => '密碼已移除';

  @override
  String get notesBiometric => 'Face ID 用於筆記';

  @override
  String get notesBiometricSubtitle => '需要生物辨識驗證先可以開受保護嘅筆記';

  @override
  String get textNote => '文字筆記';

  @override
  String get checklistNote => '待辦清單';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total 個任務';
  }

  @override
  String get autoSaved => '已儲存';

  @override
  String get searchNotes => '搜尋筆記';

  @override
  String get legalConsent => '法律同意';

  @override
  String get confirmAge13 => '我確認我已年滿13歲';

  @override
  String get acceptLegalStart => '我接受';

  @override
  String get privacyPolicy => '私隱政策';

  @override
  String get termsOfService => '服務條款';

  @override
  String get andThe => '同';

  @override
  String get continueButton => '繼續';

  @override
  String get mustAcceptTerms => '你一定要同意兩項條件先可以繼續';

  @override
  String get support => '支援';

  @override
  String get contactSupport => '聯絡支援';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => '舉報濫用';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => '法律';

  @override
  String get legalEntity => '法律實體';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => '釘選';

  @override
  String get unpinConversation => '取消釘選';

  @override
  String get hideConversation => '從動態移除';

  @override
  String get deleteConversation => '刪除對話';

  @override
  String get deleteConversationConfirm => '輸入你嘅PIN碼嚟確認刪除所有訊息';

  @override
  String get noConversations => '未有對話';

  @override
  String get startConversation => '開始';

  @override
  String get microphonePermissionRequired => '需要麥克風存取權限';

  @override
  String get microphonePermissionExplanation => 'Hash 需要麥克風嚟打電話。';

  @override
  String get cameraPermissionExplanation => 'Hash 需要相機嚟打視像電話。';

  @override
  String get openSettings => '開設定';

  @override
  String get callConnecting => '連線緊...';

  @override
  String get callRinging => '響緊...';

  @override
  String get callReconnecting => '重新連線緊...';

  @override
  String callReconnectingTimer(int seconds) {
    return '重新連線緊（$seconds秒）';
  }

  @override
  String get callPaused => '已暫停';

  @override
  String get callPausedSubtitle => '通話仍在進行中';

  @override
  String get callRemoteMicMuted => '對方已靜音';

  @override
  String get callMiniControlsMute => '靜音';

  @override
  String get callMiniControlsUnmute => '取消靜音';

  @override
  String get callMiniControlsHangUp => '收線';

  @override
  String get callMiniControlsReturn => '返回通話';

  @override
  String get callNetworkPoor => '連線唔穩定';

  @override
  String get callNetworkLost => '連線斷咗';

  @override
  String get callEndedTitle => '通話完咗';

  @override
  String get deviceData => '裝置資料';

  @override
  String get deviceDataSubtitle => '本機同伺服器儲存';

  @override
  String get localStorage => '本機儲存';

  @override
  String get onThisDevice => '喺呢部裝置';

  @override
  String get encryptedDatabases => '加密資料庫';

  @override
  String get files => '檔案';

  @override
  String get secureKeychain => '安全鑰匙圈';

  @override
  String get cache => '快取';

  @override
  String get contactsDetail => '名、頭像、Signal 密鑰';

  @override
  String get messagesDetail => '加密對話';

  @override
  String get notesDetail => '個人筆記';

  @override
  String get signalSessions => 'Signal 工作階段';

  @override
  String get signalSessionsDetail => '加密工作階段';

  @override
  String get pendingContacts => '待處理聯絡人';

  @override
  String get pendingContactsDetail => '待處理嘅請求';

  @override
  String get callHistory => '通話';

  @override
  String get callHistoryDetail => '通話紀錄';

  @override
  String get preferences => '偏好設定';

  @override
  String get preferencesDetail => '媒體同通話偏好';

  @override
  String get avatars => '頭像';

  @override
  String get media => '媒體';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個檔案',
      one: '1 個檔案',
      zero: '冇檔案',
    );
    return '$_temp0';
  }

  @override
  String get active => '已啟用';

  @override
  String get notDefined => '未設定';

  @override
  String get biometrics => '生物辨識';

  @override
  String get recoveryPhrase => '恢復短語';

  @override
  String get identity => '身份（Hash ID）';

  @override
  String get signalKeys => 'Signal Protocol 密鑰';

  @override
  String get authTokens => '驗證權杖';

  @override
  String get contactNamesCache => '聯絡人名稱快取';

  @override
  String get remoteConfig => '遠端設定';

  @override
  String get notificationPrefs => '通知偏好';

  @override
  String get serverData => '伺服器資料';

  @override
  String get serverDataInfo => 'Hash 喺伺服器上淨係保留最少量嘅資料，全部加密或者臨時性。';

  @override
  String get serverProfile => '個人資料';

  @override
  String get serverProfileDetail => 'Hash ID、公鑰、信箱權杖';

  @override
  String get serverPrekeys => '預先密鑰';

  @override
  String get serverPrekeysDetail => '一次性 Signal 密鑰（已消耗）';

  @override
  String get serverMessages => '傳輸緊嘅訊息';

  @override
  String get serverMessagesDetail => '送達後刪除（最長24個鐘）';

  @override
  String get serverMedia => '傳輸緊嘅媒體';

  @override
  String get serverMediaDetail => '下載後刪除';

  @override
  String get serverContactRequests => '聯絡請求';

  @override
  String get serverContactRequestsDetail => '24個鐘後過期';

  @override
  String get serverRateLimits => '速率限制';

  @override
  String get serverRateLimitsDetail => '臨時防濫用資料';

  @override
  String get privacyReassurance => 'Hash 睇唔到你嘅訊息。所有資料都係端對端加密。伺服器資料會自動刪除。';

  @override
  String get pinTooSimple => '呢個PIN碼太簡單喇。請揀個更安全嘅碼。';

  @override
  String get genericError => '出錯喇，請再試。';

  @override
  String accountCreationError(String error) {
    return '開唔到帳號：$error';
  }

  @override
  String get phraseCopiedToClipboard => '短語已複製到剪貼簿';

  @override
  String get copyPhrase => '複製短語';

  @override
  String get recoveryPhraseSecurityWarning =>
      '請將呢個短語寫喺安全嘅地方。如果你唔見咗PIN碼又冇呢個短語，你就永遠冇辦法攞返你嘅資料。';

  @override
  String get noMessages => '冇訊息';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '刪除同 $name 嘅所有訊息？';
  }

  @override
  String get confirmation => '確認';

  @override
  String get untitled => '無標題';

  @override
  String get noSessions => '冇工作階段';

  @override
  String get unknownContact => '唔識嘅聯絡人';

  @override
  String get unnamed => '未命名';

  @override
  String get noPendingRequestsAlt => '冇待處理嘅請求';

  @override
  String get deleteAllCallHistory => '刪除所有通話紀錄？';

  @override
  String get noCalls => '冇通話';

  @override
  String get noPreferences => '冇偏好設定';

  @override
  String get resetAllMediaPrefs => '重設所有媒體偏好？';

  @override
  String get deleteThisAvatar => '刪除呢個頭像？';

  @override
  String get deleteAllAvatars => '刪除所有頭像？';

  @override
  String get noAvatars => '冇頭像';

  @override
  String get deleteThisFile => '刪除呢個檔案？';

  @override
  String get deleteAllMediaFiles => '刪除所有媒體？';

  @override
  String get noMediaFiles => '冇媒體';

  @override
  String get outgoing => '撥出';

  @override
  String get incoming => '撥入';

  @override
  String ephemeralViewDuration(int seconds) {
    return '閱後即焚：$seconds秒';
  }

  @override
  String get normalView => '正常睇';

  @override
  String get callReasonCompleted => '完成';

  @override
  String get callReasonMissed => '未接';

  @override
  String get callReasonDeclined => '拒絕咗';

  @override
  String get callReasonFailed => '失敗';

  @override
  String get justNow => '啱啱';

  @override
  String timeAgoMinutes(int count) {
    return '$count 分鐘前';
  }

  @override
  String timeAgoHours(int count) {
    return '$count 個鐘前';
  }

  @override
  String timeAgoDays(int count) {
    return '$count 日前';
  }

  @override
  String get messageTypeContact => '聯絡人';

  @override
  String get messageTypeLocation => '位置';

  @override
  String get statusQueued => '排隊中';

  @override
  String get blockedBadge => '已封鎖';

  @override
  String get protectedBadge => '受保護';

  @override
  String messageCount(int count) {
    return '$count 條訊息';
  }

  @override
  String get deleteQuestion => '刪除？';

  @override
  String get transferMyAccountTitle => '轉移我嘅帳號';

  @override
  String get loadingError => '載入錯誤';

  @override
  String get transferToNewDevice => '轉移去新裝置';

  @override
  String get transferInstructions => '喺新裝置上揀「恢復我嘅帳號」然後輸入以下資訊：';

  @override
  String get yourHashIdLabel => '你嘅 Hash ID';

  @override
  String get enterYourPinCode => '輸入你嘅PIN碼';

  @override
  String get pinOwnerConfirmation => '確認你係呢個帳號嘅擁有者';

  @override
  String get scanThisQrCode => '掃描呢個 QR 碼';

  @override
  String get withYourNewDevice => '用你嘅新裝置';

  @override
  String get orEnterTheCode => '或者輸入代碼';

  @override
  String get transferCodeLabel => '轉移碼';

  @override
  String get proximityVerification => '近距離驗證';

  @override
  String get bringDevicesCloser => '將兩部裝置擺埋啲';

  @override
  String get confirmTransferQuestion => '確認轉移？';

  @override
  String get accountWillBeTransferred => '你嘅帳號會轉移去新裝置。\n\n呢部裝置會被永久中斷連線。';

  @override
  String get transferComplete => '轉移完成';

  @override
  String get transferSuccessMessage => '你嘅帳號已成功轉移。\n\n呢個應用程式會即刻關閉。';

  @override
  String get manualVerification => '手動驗證';

  @override
  String get codeDisplayedOnBothDevices => '兩部裝置上顯示嘅代碼：';

  @override
  String get doesCodeMatchNewDevice => '呢個代碼同新裝置上嗰個一唔一樣？';

  @override
  String get verifiedStatus => '已驗證';

  @override
  String get inProgressStatus => '進行緊...';

  @override
  String get notAvailableStatus => '用唔到';

  @override
  String get codeExpiredRestart => '代碼已過期。請重新開始。';

  @override
  String get codesDoNotMatchCancelled => '代碼唔一樣。轉移已取消。';

  @override
  String transferToDevice(String device) {
    return '至：$device';
  }

  @override
  String get copiedExclamation => '已複製！';

  @override
  String expiresInTime(String time) {
    return '$time後過期';
  }

  @override
  String get biometricNotAvailable => '呢部裝置唔支援生物辨識';

  @override
  String get biometricAuthError => '生物辨識驗證嗰陣出錯';

  @override
  String get authenticateForBiometric => '請驗證嚟啟用生物辨識';

  @override
  String get biometricAuthFailed => '生物辨識驗證失敗';

  @override
  String get forceUpdateTitle => '需要更新';

  @override
  String get forceUpdateMessage => '有新版本嘅 Hash 可以用。請更新先繼續。';

  @override
  String get updateButton => '更新';

  @override
  String get maintenanceInProgress => '維護緊';

  @override
  String get tryAgainLater => '請遲啲再試';

  @override
  String get information => '資訊';

  @override
  String get later => '遲啲';

  @override
  String get doYouLikeHash => '你鍾唔鍾意 Hash？';

  @override
  String get yourFeedbackHelps => '你嘅意見幫到我哋改善應用程式';

  @override
  String get ratingTerrible => '好差';

  @override
  String get ratingBad => '差';

  @override
  String get ratingOk => '一般';

  @override
  String get ratingGood => '好';

  @override
  String get ratingExcellent => '好正！';

  @override
  String get donationMessage => 'Hash 係非牟利項目。你嘅支持幫我哋繼續開發真正私密嘅通訊工具。';

  @override
  String get recentConnections => '最近嘅連線';

  @override
  String get loginInfoText => '每次PIN解鎖都會喺本機記錄。淨係保留最近24個鐘嘅紀錄。';

  @override
  String get connectionCount => '連線次數';

  @override
  String get periodLabel => '期間';

  @override
  String get historyLabel => '紀錄';

  @override
  String get noLoginRecorded => '冇登入紀錄';

  @override
  String get nextUnlocksAppearHere => '下次解鎖會顯示喺呢度。';

  @override
  String get dataLocalOnly => '呢啲資料淨係儲喺你嘅裝置，永遠唔會傳出去。';

  @override
  String get currentSession => '而家';

  @override
  String get todayLabel => '今日';

  @override
  String get yesterdayLabel => '尋日';

  @override
  String get justNowLabel => '啱啱';

  @override
  String minutesAgoLabel(int count) {
    return '$count 分鐘前';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours 個鐘前';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours個鐘$minutes分鐘前';
  }

  @override
  String get noMaintenancePlanned => '冇預定維護';

  @override
  String get everythingWorkingNormally => '一切運作正常';

  @override
  String get maintenanceTitle => '維護';

  @override
  String get maintenanceActiveLabel => '進行緊';

  @override
  String get maintenancePlannedLabel => '已預定';

  @override
  String get locking => '鎖定緊...';

  @override
  String get newMessageNotification => '新訊息';

  @override
  String get secExplainTitle => 'Hash 點樣保護你';

  @override
  String get secExplainIntro => 'Hash 嘅設計令到冇人可以讀到你嘅訊息。';

  @override
  String get secExplainIntroSub => '連我哋都唔得。\n以下係簡單解釋。';

  @override
  String get secJourneyLabel => '旅程';

  @override
  String get secJourneyTitle => '你嘅訊息之旅';

  @override
  String get secJourneySubtitle => '由你隻手指到聯絡人嘅螢幕，每一步都受保護。跟住條路。';

  @override
  String get secStep1Title => '你寫訊息';

  @override
  String get secStep1Desc => '你喺應用程式入面打「喂！」。呢個時候訊息淨係存在於手機記憶體入面。乜都未送出。';

  @override
  String get secStep2Title => 'Signal Protocol 加密';

  @override
  String get secStep2Desc =>
      '當你撳「傳送」，你嘅訊息會變成一串睇唔明嘅字元。就好似你嘅訊息俾人鎖咗入一個淨得你聯絡人先有鎖匙嘅夾萬。';

  @override
  String get secStep3Title => 'Sealed Sender：隱形信封';

  @override
  String get secStep3Desc =>
      '想像你寄咗封信，但信封上面冇寄件人地址。呢個就係 Hash 做嘅嘢。訊息放入匿名信箱。伺服器唔知邊個寄嘅。';

  @override
  String get secStep4Title => '伺服器乜都睇唔到';

  @override
  String get secStep4Desc =>
      '伺服器好似一個盲嘅郵差。佢只知道「有人喺信箱 #A7X9 放咗嘢」。佢唔知邊個寄嘅、入面係乜、同埋俾邊個。';

  @override
  String get secStep4Highlight => '唔儲存任何中繼資料：冇 IP 地址、冇時間記錄、冇寄件人同收件人嘅關聯。';

  @override
  String get secStep5Title => '你嘅聯絡人收到訊息';

  @override
  String get secStep5Desc => '聯絡人嘅手機從匿名信箱攞出內容，再用從未離開過佢裝置嘅私鑰解密訊息。「喂！」出現喺佢個螢幕上。';

  @override
  String get secStep6Title => '訊息從伺服器消失';

  @override
  String get secStep6Desc =>
      '聯絡人確認收到之後，伺服器會永久刪除訊息。冇垃圾桶、冇存檔、冇備份。未讀嘅訊息都會喺24個鐘後自動銷毀。';

  @override
  String get secStep7Title => '本機過期';

  @override
  String get secStep7Desc => '喺聯絡人嘅手機上，訊息會根據你揀嘅時間自動銷毀：睇完即刻、5分鐘、1個鐘……你話事。';

  @override
  String get secJourneyConclusion => '結果：伺服器上零痕跡，裝置上零痕跡。訊息淨係存在到俾人睇到為止，然後就消失。';

  @override
  String get secArchLabel => '架構';

  @override
  String get secArchTitle => '5 層保護';

  @override
  String get secArchSubtitle => 'Hash 唔係靠單一技術。每一層都強化其他層。就算一層被突破，你嘅資料都仲係安全嘅。';

  @override
  String get secLayer1Title => '端對端加密';

  @override
  String get secLayer1Desc =>
      '每條訊息都用獨特嘅密鑰加密。簡單啲講：就算有人解密咗一條訊息，都解唔到下一條。每條訊息都有自己嘅鎖。';

  @override
  String get secLayer1Detail =>
      '對於檔案（相片、影片、文件），Hash 用額外嘅 AES-256-GCM 加密。檔案喺離開你手機之前就已經加密。';

  @override
  String get secLayer2Title => 'Sealed Sender（網路匿名）';

  @override
  String get secLayer2Desc =>
      '一般通訊工具發訊息嗰陣會附上你嘅身份，好似喺信封寫你個名。Hash 用匿名信箱：伺服器送訊息嗰陣唔知邊個寄嘅。';

  @override
  String get secLayer2Detail => '結果：就算伺服器資料洩漏，都冇辦法知道邊個同邊個傾偈。';

  @override
  String get secLayer3Title => '自動刪除';

  @override
  String get secLayer3Desc => '訊息喺確認收到後即刻從伺服器刪除。就算訊息從來冇人攞，都會喺24個鐘後自動銷毀。';

  @override
  String get secLayer3Detail =>
      '喺你手機上，訊息會根據你揀嘅時間自動銷毀：即刻、5分鐘、15分鐘、30分鐘、1個鐘、3個鐘、6個鐘或12個鐘。';

  @override
  String get secLayer4Title => '本機存取保護';

  @override
  String get secLayer4Desc =>
      '應用程式受6位數PIN碼同/或生物辨識（Face ID、指紋）保護。試得太多次嘅話，應用程式會鎖住，每次失敗延遲會加長。';

  @override
  String get secLayer5Title => '鎖住嘅資料庫';

  @override
  String get secLayer5Desc => '喺伺服器端，冇用戶可以直接寫入資料庫。所有操作都經過安全函式，每個請求都會被驗證。';

  @override
  String get secLayer5Detail => '就好似銀行櫃枱：你永遠唔會自己掂到金庫。你提出請求，系統喺執行前驗證你嘅權限。';

  @override
  String get secVashLabel => '全球獨創';

  @override
  String get secVashTitle => 'Vash 模式';

  @override
  String get secVashSubtitle => '一個喺任何其他通訊應用程式都搵唔到嘅緊急安全系統。';

  @override
  String get secVashScenarioTitle => '想像吓呢個情況';

  @override
  String get secVashScenario1 => '有人攞到你部手機';

  @override
  String get secVashScenario2 => '有人叫你輸入PIN碼';

  @override
  String get secVashScenario3 => '你想緊急清除所有資料';

  @override
  String get secVashSolutionTitle => '解決方法：兩組PIN碼';

  @override
  String get secVashSolutionDesc => '你喺 Hash 入面設定兩組唔同嘅PIN碼：';

  @override
  String get secVashNormalCodeLabel => '正常碼';

  @override
  String get secVashNormalCodeDesc => '正常開應用程式，顯示所有資料';

  @override
  String get secVashCodeLabel2 => 'Vash 碼';

  @override
  String get secVashCodeDescription => '正常開應用程式……但所有資料會喺背景靜靜刪除';

  @override
  String get secVashWhatHappensTitle => '之後會點';

  @override
  String get secVashWhatHappensDesc =>
      '應用程式正常開。冇警示、冇可疑動畫。螢幕淨係顯示一個空嘅應用程式，好似你啱啱裝好咁。\n\n實際上，你所有對話、聯絡人同訊息已經喺一瞬間被永久刪除。';

  @override
  String get secCallsLabel => '通話同檔案';

  @override
  String get secCallsTitle => '所有嘢都經過加密';

  @override
  String get secCallsSubtitle => '唔止訊息。所有經 Hash 傳輸嘅嘢都經過端對端加密。';

  @override
  String get secAudioCallTitle => '語音通話';

  @override
  String get secAudioCallDesc => '透過 WebRTC 端對端加密。語音喺裝置之間直接傳輸。';

  @override
  String get secVideoCallTitle => '視像通話';

  @override
  String get secVideoCallDesc => '同一技術，每個串流獨立加密。';

  @override
  String get secPhotosTitle => '相片同影片';

  @override
  String get secPhotosDesc => '以 AES-256-GCM 加密後先離開你部手機。';

  @override
  String get secDocsTitle => '文件';

  @override
  String get secDocsDesc => 'PDF、ZIP 或任何檔案。名稱、大小同內容全部加密。';

  @override
  String get secAnonLabel => '匿名';

  @override
  String get secAnonTitle => '唔需要任何身份';

  @override
  String get secAnonSubtitle => 'Hash 從來唔會問你嘅電話號碼或電郵。你以獨特同匿名嘅 Hash ID 識別。';

  @override
  String get secHashIdTitle => '你嘅 Hash ID';

  @override
  String get secHashIdDesc =>
      '呢個係你嘅唯一識別碼。佢唔會透露你嘅任何資料：你嘅名、電話號碼、位置。就好似一個冇辦法同你真實身份連結嘅化名。\n\n要加聯絡人，你分享 Hash ID 或者掃 QR 碼。就係咁。冇同步嘅通訊錄，冇「你可能認識嘅人」建議。';

  @override
  String get secDataLabel => '資料';

  @override
  String get secDataTitle => 'Hash 唔知嘅嘢';

  @override
  String get secDataSubtitle => '保護資料嘅最好方法就係唔收集佢。';

  @override
  String get secNeverCollected => '從來冇收集';

  @override
  String get secNeverItem1 => '訊息內容';

  @override
  String get secNeverItem2 => '聯絡人清單';

  @override
  String get secNeverItem3 => '電話號碼';

  @override
  String get secNeverItem4 => '電郵地址';

  @override
  String get secNeverItem5 => 'IP 地址';

  @override
  String get secNeverItem6 => '位置';

  @override
  String get secNeverItem7 => '中繼資料（邊個同邊個傾偈）';

  @override
  String get secNeverItem8 => '通話紀錄';

  @override
  String get secNeverItem9 => '通訊錄';

  @override
  String get secNeverItem10 => '廣告識別碼';

  @override
  String get secTempStored => '臨時儲存';

  @override
  String get secTempItem1 => '匿名 Hash ID（唯一識別碼）';

  @override
  String get secTempItem2 => '公開加密密鑰';

  @override
  String get secTempItem3 => '傳輸緊嘅加密訊息（最長24個鐘）';

  @override
  String get secTempNote => '就算係呢啲最少嘅資料都唔可以識別你嘅身份。你嘅 Hash ID 冇同任何個人資料連結。';

  @override
  String get secFooterTitle => '你嘅私隱，你嘅自由';

  @override
  String get secFooterDesc => 'Hash 用同最嚴格嘅專業應用程式一樣嘅加密技術。你嘅訊息受數學保護，唔係靠承諾。';
}
