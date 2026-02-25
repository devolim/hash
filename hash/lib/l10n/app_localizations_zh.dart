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
  String get conversations => '聊天';

  @override
  String get noConversation => '暂无聊天';

  @override
  String get noConversationSubtitle => '添加联系人开始安全聊天';

  @override
  String get addContact => '添加联系人';

  @override
  String get shareApp => '分享应用';

  @override
  String get newMessage => '新消息';

  @override
  String get newConversation => '新聊天';

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
  String get notifications => '通知';

  @override
  String get messages => '消息';

  @override
  String get calls => '通话';

  @override
  String get security => '安全';

  @override
  String get accountSecurity => '账户安全';

  @override
  String get accountSecuritySubtitle => 'PIN码、生物识别、陷阱码';

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
  String get autoLockDisabled => '已禁用';

  @override
  String get autoLockMinute => '1分钟';

  @override
  String autoLockMinutes(int count) {
    return '$count分钟';
  }

  @override
  String get destructionCode => '销毁码';

  @override
  String get destructionCodeInfo => '如果您输入此代码而不是PIN码：';

  @override
  String get destructionDeleteMessages => '您的所有消息将被删除';

  @override
  String get destructionDeleteContacts => '您的所有联系人将被删除';

  @override
  String get destructionDeleteHistory => '您的通话记录将被清除';

  @override
  String get destructionKeepId => '您的Hash身份(#XXX-XXX-XXX)保持不变';

  @override
  String get destructionAppearNormal => '应用将显示正常但为空。此操作不可逆。';

  @override
  String get setupDestructionCode => '设置销毁码';

  @override
  String get modifyDestructionCode => '修改销毁码';

  @override
  String get currentDestructionCode => '当前销毁码';

  @override
  String get newDestructionCode => '新销毁码';

  @override
  String get confirmDestructionCode => '确认代码';

  @override
  String get destructionCodeConfigured => '销毁码已设置';

  @override
  String get destructionCodeModified => '销毁码已修改';

  @override
  String get destructionCodeMustDiffer => '销毁码必须与PIN码不同';

  @override
  String get incorrectDestructionCode => '销毁码错误';

  @override
  String get danger => '危险';

  @override
  String get panicButton => '紧急按钮';

  @override
  String get panicButtonSubtitle => '删除所有数据';

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
  String get panicConfirmTitle => '紧急按钮';

  @override
  String get panicConfirmMessage =>
      '此操作将永久删除您的所有数据：\n\n• 您的所有消息\n• 您的所有联系人\n• 您的账户\n\n您确定吗？';

  @override
  String get deleteAll => '全部删除';

  @override
  String get dataDeletedForSecurity => '数据已为安全删除。';

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
  String get tooManyAttempts => '尝试次数过多';

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
  String get onboardingSubtitle4 => 'PIN码、紧急模式和恢复短语';

  @override
  String get getStarted => '开始使用';

  @override
  String get next => '下一步';

  @override
  String get skip => '跳过';

  @override
  String get alreadyHaveAccount => '我已有账户';

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
  String get contactDetails => '联系人详情';

  @override
  String get contactName => '联系人姓名';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String get deleteContact => '删除联系人';

  @override
  String get deleteContactConfirm => '删除此联系人？';

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
  String get shareMessage =>
      '加入我使用Hash！🔒\n\n这是一款真正私密的通讯工具：完全加密，服务器零痕迹，需要时还有紧急模式。\n\n在这里下载应用 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => '错误';

  @override
  String get ok => '确定';

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
}
