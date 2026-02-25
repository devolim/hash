// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => '痕跡ゼロ。妥協ゼロ。';

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
  String get conversations => 'チャット';

  @override
  String get contacts => '連絡先';

  @override
  String get noConversation => 'チャットなし';

  @override
  String get noConversationSubtitle => '安全にチャットするには連絡先を追加してください';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の保留中リクエスト',
      one: '1件の保留中リクエスト',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の送信済みリクエスト保留中',
      one: '1件の送信済みリクエスト保留中',
    );
    return '$_temp0';
  }

  @override
  String get addContact => '連絡先を追加';

  @override
  String get shareApp => 'アプリを共有';

  @override
  String get newMessage => '新しいメッセージ';

  @override
  String get newConversation => 'メッセージを送信';

  @override
  String get settings => '設定';

  @override
  String get myHashId => 'マイ Hash ID';

  @override
  String get supportHash => 'Hash を支援';

  @override
  String get supportHashSubtitle => 'Hash は非営利プロジェクトです';

  @override
  String get donate => '寄付';

  @override
  String get appearance => '外観';

  @override
  String get theme => 'テーマ';

  @override
  String get themeAuto => '自動';

  @override
  String get themeAutoSubtitle => 'システム設定に従う';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeRecommendation => 'プライバシー保護のためダークテーマを推奨';

  @override
  String get language => '言語';

  @override
  String get languageAuto => '自動（システム）';

  @override
  String get notifications => '通知';

  @override
  String get messages => 'メッセージ';

  @override
  String get calls => '通話';

  @override
  String get vibration => 'バイブレーション';

  @override
  String get notificationContent => '通知内容';

  @override
  String get notificationContentFull => 'すべて表示';

  @override
  String get notificationContentFullDesc => '連絡先名とメッセージプレビュー';

  @override
  String get notificationContentName => '名前のみ';

  @override
  String get notificationContentNameDesc => '連絡先名のみ表示';

  @override
  String get notificationContentDiscrete => '控えめ';

  @override
  String get notificationContentDiscreteDesc => '\"新しいメッセージ\"のみ表示';

  @override
  String get security => 'セキュリティ';

  @override
  String get howHashProtectsYou => 'Hash があなたを守る方法';

  @override
  String get howHashProtectsYouSubtitle => 'セキュリティを理解する';

  @override
  String get accountSecurity => 'アカウントセキュリティ';

  @override
  String get accountSecuritySubtitle => 'PIN、生体認証、Vash モード';

  @override
  String get blockScreenshots => 'スクリーンショットをブロック';

  @override
  String get transferDevice => '別のデバイスに移行';

  @override
  String get transferDeviceSubtitle => 'アカウントを移行';

  @override
  String get pinCode => 'PIN コード';

  @override
  String get changePin => 'PIN コードを変更';

  @override
  String get currentPin => '現在の PIN コード';

  @override
  String get newPin => '新しい PIN コード';

  @override
  String get confirmPin => 'PIN コードを確認';

  @override
  String get pinChanged => 'PIN コードが変更されました';

  @override
  String get incorrectPin => 'PIN が正しくありません';

  @override
  String get pinsDoNotMatch => 'PIN が一致しません';

  @override
  String get autoLock => '自動ロック';

  @override
  String get autoLockDelay => 'ロック遅延';

  @override
  String get autoLockImmediate => '即時';

  @override
  String get autoLockMinute => '1分';

  @override
  String autoLockMinutes(int count) {
    return '$count分';
  }

  @override
  String get vashCode => 'Vash コード';

  @override
  String get vashModeTitle => 'Vash モード';

  @override
  String get vashModeExplanation => 'あなたの究極のセーフティネット。';

  @override
  String get vashModeDescription =>
      '2つ目の PIN コードを選びます。Hash を開くことを強制された場合、通常の PIN の代わりにこのコードを入力してください。\n\nアプリは通常通り開きますが、すべての会話と連絡先は消えます。\n\n画面を見ている人には、Hash は空に見えます — まるで使ったことがないかのように。';

  @override
  String get vashModeIrreversible => 'この操作は静かで取り消し不可能です。';

  @override
  String get chooseVashCode => 'Vash コードを選択';

  @override
  String get vashCodeInfo => 'アプリを通常通り開くが、空の状態にする2つ目の PIN コード。';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'PIN の代わりにこのコードを入力すると：';

  @override
  String get vashDeleteContacts => '連絡先が消えます';

  @override
  String get vashDeleteMessages => '会話が消えます';

  @override
  String get vashDeleteHistory => 'メモが消えます';

  @override
  String get vashKeepId => 'Hash アイデンティティ（#XXX-XXX-XXX）は変わりません';

  @override
  String get vashAppearNormal => 'アプリは正常に見えますが空で、新品のようです。この操作は取り消し不可能です。';

  @override
  String get setupVashCode => 'Vash コードを設定';

  @override
  String get modifyVashCode => 'Vash コードを変更';

  @override
  String get currentVashCode => '現在の Vash コード';

  @override
  String get newVashCode => '新しい Vash コード';

  @override
  String get confirmVashCode => 'Vash コードを確認';

  @override
  String get vashCodeConfigured => 'Vash コードが設定されました';

  @override
  String get vashCodeModified => 'Vash コードが変更されました';

  @override
  String get vashCodeMustDiffer => 'Vash コードは PIN と異なる必要があります';

  @override
  String get incorrectVashCode => 'Vash コードが正しくありません';

  @override
  String get vashWhatToDelete => 'Vash モードで何を消しますか？';

  @override
  String get vashDeleteContactsOption => '連絡先';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'メッセージ';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'メモ';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash モードが有効化されました';

  @override
  String get vashCreateSubtitle => 'メイン PIN とは異なるコードを選択してください';

  @override
  String get vashConfirmSubtitle => 'Vash コードを確認してください';

  @override
  String get pinCodeForEntry => 'アプリ入室用PINコード';

  @override
  String get vashCodeSection => 'Vash モード';

  @override
  String get biometric => '生体認証';

  @override
  String get biometricUnlock => '指紋またはFace IDでロック解除';

  @override
  String get enableBiometric => '生体認証を有効にする';

  @override
  String get biometricWarningMessage =>
      '生体認証を有効にすると、Vashコードでアプリに入ることができなくなります。\n\nVashコードは生体認証が失敗した場合のみ使用できます（複数回の失敗後）。\n\n続行してもよろしいですか？';

  @override
  String get understood => '理解しました';

  @override
  String get shareAppSubtitle => 'Hashを大切な人と共有';

  @override
  String get share => '共有';

  @override
  String get danger => '危険';

  @override
  String get deleteAccount => 'アカウントを削除';

  @override
  String get deleteAccountSubtitle => '取り消し不可能な操作';

  @override
  String get deleteAccountConfirmTitle => 'アカウントを削除';

  @override
  String get deleteAccountConfirmMessage =>
      'アカウントは完全に削除されます。この操作は取り消し不可能です。\n\n• すべてのチャット\n• すべての連絡先\n• Hash ID\n\n新しいアカウントを作成する必要があります。';

  @override
  String get deleteForever => '完全に削除';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash モードが有効化されました。';

  @override
  String deletionError(String error) {
    return '削除エラー：$error';
  }

  @override
  String get yourSecurity => 'あなたのセキュリティ';

  @override
  String get securityInfo =>
      '• エンドツーエンド暗号化（Signal Protocol）\n• 配信後サーバーにデータなし\n• 鍵はデバイスにのみ保存\n• PIN コードはサーバーに送信されません';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'ようこそ';

  @override
  String get securityStatement1 => 'メッセージは保護されています。';

  @override
  String get securityStatement2 => 'エンドツーエンド暗号化。';

  @override
  String get securityStatement3 => '痕跡なし。妥協なし。';

  @override
  String get securityStatement4 => 'プライバシーは権利です。';

  @override
  String get accessBlocked => 'アクセスがブロックされました';

  @override
  String get tooManyAttempts => '試行回数が多すぎます。後でもう一度お試しください。';

  @override
  String get pleaseWait => 'お待ちください';

  @override
  String get waitDelay => '遅延が終了するまでお待ちください';

  @override
  String attemptCount(int current, int max) {
    return '試行 $current/$max';
  }

  @override
  String retryIn(String time) {
    return '$time後に再試行';
  }

  @override
  String get forgotPin => 'PIN を忘れましたか？リカバリフレーズを使用';

  @override
  String get useRecoveryPhrase => 'リカバリフレーズを使用';

  @override
  String get recoveryWarningTitle => '警告';

  @override
  String get recoveryWarningMessage => 'アカウントの回復は：';

  @override
  String get recoveryDeleteAllMessages => 'すべてのメッセージを削除します';

  @override
  String get recoveryWaitDelay => '1時間の待機が必要です';

  @override
  String get recoveryKeepContacts => '連絡先は保持されます';

  @override
  String get recoveryIrreversible => 'この操作は取り消し不可能です。メッセージは完全に失われます。';

  @override
  String get iUnderstand => '理解しました';

  @override
  String get accountRecovery => 'アカウントの回復';

  @override
  String get enterRecoveryPhrase => 'リカバリフレーズの24語をスペースで区切って入力してください。';

  @override
  String get recoveryPhraseHint => '単語1 単語2 単語3 ...';

  @override
  String get recover => '回復';

  @override
  String get recoveryPhraseRequired => 'リカバリフレーズを入力してください';

  @override
  String get recoveryPhrase24Words => 'フレーズは正確に24語である必要があります';

  @override
  String get incorrectRecoveryPhrase => 'リカバリフレーズが正しくありません';

  @override
  String get recoveryInitError => '回復の初期化エラー';

  @override
  String get securityDelay => 'セキュリティ遅延';

  @override
  String get securityDelayMessage => 'セキュリティのため、新しい PIN を作成する前に待機期間が必要です。';

  @override
  String get timeRemaining => '残り時間';

  @override
  String get messagesDeletedForProtection => '保護のためメッセージが削除されました。';

  @override
  String get canCloseApp => 'アプリを閉じて後で戻ることができます。';

  @override
  String get onboardingTitle1 => 'Hash へようこそ';

  @override
  String get onboardingSubtitle1 => '痕跡を残さないメッセンジャー';

  @override
  String get onboardingTitle2 => '完全な暗号化';

  @override
  String get onboardingSubtitle2 => 'メッセージは Signal プロトコルでエンドツーエンド暗号化されます';

  @override
  String get onboardingTitle3 => '痕跡なし';

  @override
  String get onboardingSubtitle3 => 'メッセージは配信後にサーバーから削除されます';

  @override
  String get onboardingTitle4 => 'あなたのセキュリティ';

  @override
  String get onboardingSubtitle4 => 'PIN コード、Vash モード、リカバリフレーズ';

  @override
  String get getStarted => '始める';

  @override
  String get next => '次へ';

  @override
  String get skip => 'スキップ';

  @override
  String get alreadyHaveAccount => 'アカウントをお持ちです';

  @override
  String get transferMyAccount => 'アカウントを移行';

  @override
  String get createPin => 'PIN コードを作成';

  @override
  String get createPinSubtitle => 'このコードでアプリへのアクセスを保護します';

  @override
  String get confirmYourPin => 'PIN コードを確認';

  @override
  String get confirmPinSubtitle => 'PIN コードをもう一度入力してください';

  @override
  String get saveRecoveryPhrase => 'リカバリフレーズ';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'これらの24語を順番に書き留めてください。PIN を忘れた場合にアカウントを回復できます。';

  @override
  String get phraseWritten => 'フレーズを書き留めました';

  @override
  String get warningRecoveryPhrase => 'このフレーズを失い、PIN を忘れると、アカウントへのアクセスを失います。';

  @override
  String get accountTransferred => 'アカウントが移行されました';

  @override
  String get accountTransferredMessage => 'アカウントは別のデバイスに移行されました。このセッションは無効です。';

  @override
  String get accountTransferredInfo => 'この移行を開始していない場合、アカウントが侵害された可能性があります。';

  @override
  String get logout => 'ログアウト';

  @override
  String get transferAccount => 'アカウント移行';

  @override
  String get transferAccountInfo =>
      'Hash アカウントを新しいデバイスに移行します。現在のセッションは無効になります。';

  @override
  String get generateTransferCode => '移行コードを生成';

  @override
  String get transferCode => '移行コード';

  @override
  String transferCodeExpires(int minutes) {
    return 'このコードは$minutes分で期限切れになります';
  }

  @override
  String get enterCodeOnNewDevice => '新しいデバイスでこのコードを入力してアカウントを移行してください。';

  @override
  String get generateNewCode => '新しいコードを生成';

  @override
  String get scanQrCode => 'QR code をスキャン';

  @override
  String get scanQrCodeSubtitle => '連絡先の QR code をスキャンして追加';

  @override
  String get qrCodeDetected => 'QR code が検出されました';

  @override
  String get invalidQrCode => '無効な QR code';

  @override
  String get cameraPermissionRequired => 'カメラの許可が必要です';

  @override
  String get myQrCode => 'マイ QR code';

  @override
  String get myQrCodeSubtitle => 'この QR code を共有して連絡先に追加してもらいましょう';

  @override
  String get shareQrCode => '共有';

  @override
  String get addContactTitle => '連絡先を追加';

  @override
  String get addContactByHashId => '連絡先の Hash ID を入力';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => '検索';

  @override
  String get contactNotFound => '連絡先が見つかりません';

  @override
  String get contactAlreadyAdded => 'この連絡先はすでにリストにあります';

  @override
  String get contactAdded => '連絡先が追加されました';

  @override
  String get myProfile => 'マイプロフィール';

  @override
  String get myProfileSubtitle => 'この情報を共有して他の人に追加してもらいましょう';

  @override
  String get temporaryCode => '一時コード';

  @override
  String temporaryCodeExpires(String time) {
    return '$timeで期限切れ';
  }

  @override
  String get codeExpired => 'コードの期限切れ';

  @override
  String get generateNewCodeButton => '新しいコード';

  @override
  String get copyHashId => 'ID をコピー';

  @override
  String get copyCode => 'コードをコピー';

  @override
  String get copiedToClipboard => 'コピーしました';

  @override
  String get showMyQrCode => 'マイ QR code を表示';

  @override
  String get orDivider => 'または';

  @override
  String get openScanner => 'スキャナーを開く';

  @override
  String get addManually => '手動で追加';

  @override
  String get contactHashIdLabel => '連絡先の Hash ID';

  @override
  String get temporaryCodeLabel => '一時コード';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode => '連絡先にプロフィールからコードを生成してもらってください';

  @override
  String get verifyAndAdd => '確認して追加';

  @override
  String get fillAllFields => 'すべてのフィールドを入力してください';

  @override
  String get invalidHashIdFormat => '無効な ID 形式（例：123-456-ABC）';

  @override
  String get userNotFound => 'ユーザーが見つかりません';

  @override
  String get cannotAddYourself => '自分自身を追加することはできません';

  @override
  String get invalidOrExpiredCode => '無効または期限切れの一時コード';

  @override
  String get contactFound => '連絡先が見つかりました！';

  @override
  String get howToCallContact => 'どのように呼びますか？';

  @override
  String get contactNameHint => '連絡先名';

  @override
  String get addContactButton => '追加';

  @override
  String get contactDetails => '連絡先の詳細';

  @override
  String get contactName => '連絡先名';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$dateに追加';
  }

  @override
  String get deleteContact => '連絡先を削除';

  @override
  String deleteContactConfirm(Object name) {
    return 'この連絡先を削除しますか？';
  }

  @override
  String get deleteContactMessage => 'チャット全体も削除されます。';

  @override
  String get delete => '削除';

  @override
  String get typeMessage => 'メッセージを入力...';

  @override
  String get messageSent => '送信済み';

  @override
  String get messageDelivered => '配信済み';

  @override
  String get messageRead => '既読';

  @override
  String get messageFailed => '送信失敗';

  @override
  String get now => '今';

  @override
  String minutesAgo(int count) {
    return '$count分';
  }

  @override
  String hoursAgo(int count) {
    return '$count時間';
  }

  @override
  String daysAgo(int count) {
    return '$count日';
  }

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String dateAtTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get shareMessage =>
      'Hash で一緒にチャットしよう！🔒\n\n本当にプライベートなメッセンジャー：完全な暗号化、サーバーに痕跡なし、必要に応じてパニックモード。\n\nここからアプリをダウンロード 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'エラー';

  @override
  String get ok => 'OK';

  @override
  String get view => '表示';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get save => '保存';

  @override
  String get edit => '編集';

  @override
  String get close => '閉じる';

  @override
  String get confirm => '確認';

  @override
  String get loading => '読み込み中...';

  @override
  String get retry => '再試行';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => '保留中のリクエスト';

  @override
  String get noPendingRequests => '保留中のリクエストはありません';

  @override
  String get pendingRequestsSubtitle => 'これらの人があなたを追加したいと思っています';

  @override
  String requestFromUser(String hashId) {
    return '$hashIdからのリクエスト';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days日後に期限切れ';
  }

  @override
  String get acceptRequest => '承諾';

  @override
  String get rejectRequest => '拒否';

  @override
  String get requestAccepted => 'リクエストが承諾されました';

  @override
  String get requestRejected => 'リクエストが拒否されました';

  @override
  String get requestSent => 'リクエストが送信されました！';

  @override
  String get requestSentSubtitle => 'リクエストが送信されました。ユーザーが承諾するとチャットできるようになります。';

  @override
  String get requestAlreadyPending => 'リクエストはすでに保留中です';

  @override
  String get requestAlreadySentByOther => 'この人はすでにあなたにリクエストを送信しています';

  @override
  String get addByHashId => 'Hash ID で追加';

  @override
  String get addByHashIdSubtitle => '連絡先の Hash ID と一時コードを入力';

  @override
  String get enterTemporaryCode => '6桁のコードを入力';

  @override
  String get sendRequest => 'リクエストを送信';

  @override
  String get acceptContactTitle => '連絡先を承諾';

  @override
  String get acceptContactSubtitle => 'カスタム名を付けることができます';

  @override
  String get leaveEmptyForHashId => 'Hash ID を使用するには空のままにしてください';

  @override
  String get firstName => '名';

  @override
  String get lastName => '姓';

  @override
  String get notes => 'メモ';

  @override
  String get notesHint => 'この連絡先に関する個人的なメモ';

  @override
  String get photoOptional => '写真（任意）';

  @override
  String get contactNameOptional => '名前（任意）';

  @override
  String get notesOptional => 'メモ（任意）';

  @override
  String get storedLocally => 'デバイスにのみ保存';

  @override
  String get encryptedMessageLabel => '暗号化されたメッセージ';

  @override
  String get identityMessageHint => 'あなたは誰ですか？どのように知り合いですか？';

  @override
  String get messageWillBeSentEncrypted => 'このメッセージは暗号化されて受信者に送信されます';

  @override
  String get sendRequestButton => 'リクエストを送信';

  @override
  String get requestExpiresIn24h => 'リクエストは24時間以内に承諾されないと期限切れになります';

  @override
  String get theyAlreadySentYouRequest => 'この人はすでにあなたにリクエストを送信しています';

  @override
  String get requests => 'リクエスト';

  @override
  String get receivedRequests => '受信済み';

  @override
  String get sentRequests => '送信済み';

  @override
  String get noSentRequests => '送信済みリクエストはありません';

  @override
  String get cancelRequest => 'キャンセル';

  @override
  String get deleteRequest => 'リクエストを削除';

  @override
  String get requestCancelled => 'リクエストがキャンセルされました';

  @override
  String sentTo(String hashId) {
    return '$hashIdに送信済み';
  }

  @override
  String expiresIn(String time) {
    return '$time後に期限切れ';
  }

  @override
  String receivedAgo(String time) {
    return '$time前に受信';
  }

  @override
  String get messageFromRequester => 'リクエスト者からのメッセージ';

  @override
  String get copy => 'コピー';

  @override
  String get messageInfo => 'メッセージ情報';

  @override
  String get messageDirection => '方向';

  @override
  String get messageSentByYou => 'あなたが送信';

  @override
  String get messageReceived => '受信';

  @override
  String get messageSentAt => '送信日時';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'ステータス';

  @override
  String get messageReadAt => '既読日時';

  @override
  String get messageType => 'タイプ';

  @override
  String get messageSize => 'サイズ';

  @override
  String get messageExpiresAt => '期限';

  @override
  String get messageEncrypted => 'エンドツーエンド暗号化';

  @override
  String get messageStatusSending => '送信中...';

  @override
  String get messageStatusSent => '送信済み';

  @override
  String get messageStatusDelivered => '配信済み';

  @override
  String get messageStatusRead => '既読';

  @override
  String get messageStatusFailed => '失敗';

  @override
  String get serverStatus => 'サーバー';

  @override
  String get onServer => '配信待ち';

  @override
  String get deletedFromServer => '削除済み';

  @override
  String get messageTypeText => 'テキスト';

  @override
  String get messageTypeImage => '画像';

  @override
  String get messageTypeVideo => '動画';

  @override
  String get messageTypeVoice => '音声';

  @override
  String get messageTypeFile => 'ファイル';

  @override
  String get indefinitely => '無期限';

  @override
  String get hoursShort => '時';

  @override
  String get minutesShort => '分';

  @override
  String get hours => '時間';

  @override
  String get minutes => '分';

  @override
  String get seconds => '秒';

  @override
  String get ephemeralMessages => '一時メッセージ';

  @override
  String get ephemeralMessagesDescription => 'メッセージはこの時間後に自動的に削除されます';

  @override
  String get ephemeralImmediate => '即時（既読後）';

  @override
  String get ephemeralImmediateDesc => '既読後すぐに削除';

  @override
  String get ephemeralMyPreference => 'マイ設定';

  @override
  String get ephemeralMyPreferenceDesc => 'グローバル設定を使用';

  @override
  String get ephemeralDefaultSetting => 'メッセージの有効期間';

  @override
  String get ephemeralChooseDefault => '推奨';

  @override
  String get ephemeral30Seconds => '30秒';

  @override
  String get ephemeral30SecondsDesc => '既読30秒後に削除';

  @override
  String get ephemeral5Minutes => '5分';

  @override
  String get ephemeral5MinutesDesc => '既読5分後に削除';

  @override
  String get ephemeral1Hour => '1時間';

  @override
  String get ephemeral1HourDesc => '既読1時間後に削除';

  @override
  String get ephemeral3Hours => '3時間';

  @override
  String get ephemeral6Hours => '6時間';

  @override
  String get ephemeral6HoursDesc => '既読6時間後に削除';

  @override
  String get ephemeral12Hours => '12時間';

  @override
  String get ephemeral24Hours => '24時間';

  @override
  String get ephemeral24HoursDesc => '既読24時間後に削除';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'カスタム期間';

  @override
  String get howItWorks => '仕組み';

  @override
  String get ephemeralExplanation1 => 'メッセージは受信後すぐにサーバーから削除されます。';

  @override
  String get ephemeralExplanation2 => 'この設定は、既読後にメッセージがあなたの電話から消えるタイミングを定義します。';

  @override
  String get ephemeralExplanation3 => '連絡先には自分の電話用の独自の設定があります。';

  @override
  String get mute1Hour => '1時間';

  @override
  String get mute8Hours => '8時間';

  @override
  String get mute1Day => '1日';

  @override
  String get mute1Week => '1週間';

  @override
  String get muteAlways => '常時';

  @override
  String get muteExplanation => 'この連絡先の通知を受け取りません';

  @override
  String get showCallsInRecents => '最近の通話に表示';

  @override
  String get showCallsInRecentsSubtitle => 'Hash通話が電話の履歴に表示されます';

  @override
  String get feedback => 'フィードバック';

  @override
  String get muteNotifications => '通知をミュート';

  @override
  String get muteDescription => 'この連絡先の通知を受け取りません';

  @override
  String mutedUntil(String time) {
    return '$timeまでミュート';
  }

  @override
  String get notMuted => '通知が有効';

  @override
  String get unmute => 'ミュート解除';

  @override
  String get notificationSound => '通知音';

  @override
  String get defaultSound => 'デフォルト';

  @override
  String get chatSettings => 'チャット設定';

  @override
  String get bubbleColor => '吹き出しの色';

  @override
  String get backgroundColor => '背景色';

  @override
  String get backgroundImage => '背景画像';

  @override
  String get chatBackground => 'チャット背景';

  @override
  String get customColor => 'カスタム';

  @override
  String get defaultColor => 'デフォルト';

  @override
  String get imageSelected => '画像が選択されました';

  @override
  String get noImage => '画像なし';

  @override
  String get color => '色';

  @override
  String get image => '画像';

  @override
  String get tapToSelectImage => 'タップして画像を選択';

  @override
  String get changeImage => '画像を変更';

  @override
  String get previewMessageReceived => 'こんにちは！';

  @override
  String get previewMessageSent => 'やあ！';

  @override
  String get messageAction => 'メッセージ';

  @override
  String get callAction => '通話';

  @override
  String get videoAction => 'ビデオ';

  @override
  String get personalNotes => '個人メモ';

  @override
  String get addNotes => 'メモを追加...';

  @override
  String get noNotes => 'メモなし';

  @override
  String get messageNotifications => 'メッセージ通知';

  @override
  String get callNotifications => '通話通知';

  @override
  String get useGradient => 'グラデーションを使用';

  @override
  String get gradientStart => '開始色';

  @override
  String get gradientEnd => '終了色';

  @override
  String get preview => 'プレビュー';

  @override
  String get reset => 'リセット';

  @override
  String get securityNumber => 'セキュリティ番号';

  @override
  String securityNumberDescription(String name) {
    return 'セキュリティ番号が$nameのデバイスと一致することを確認してください';
  }

  @override
  String get verifyEncryption => 'エンドツーエンド暗号化を確認';

  @override
  String get tapToCopy => 'タップしてコピー';

  @override
  String get howToVerify => '確認方法';

  @override
  String get verifyStep1 => '連絡先と直接会うか電話する';

  @override
  String get verifyStep2 => 'セキュリティ番号を比較するか QR code をスキャンする';

  @override
  String get verifyStep3 => '一致すればチャットは安全です';

  @override
  String get scanToVerify => 'スキャンして確認';

  @override
  String get reportSpam => 'スパムを報告';

  @override
  String get reportSpamSubtitle => 'この連絡先をスパムとして報告';

  @override
  String get reportSpamDescription => 'この連絡先を匿名で報告します。あなたの身元は共有されません。よろしいですか？';

  @override
  String get report => '報告';

  @override
  String get spamReported => 'スパムが報告されました';

  @override
  String get reportError => '報告の送信に失敗しました。もう一度お試しください。';

  @override
  String get reportRateLimited => '本日の報告上限に達しました。';

  @override
  String get blockContact => '連絡先をブロック';

  @override
  String get blockContactDescription => 'この連絡先はメッセージの送信や通話ができなくなります。通知されません。';

  @override
  String get unblockContact => '連絡先のブロックを解除';

  @override
  String get unblockContactDescription => 'この連絡先は再びメッセージの送信や通話ができるようになります。';

  @override
  String get contactBlocked => '連絡先がブロックされました';

  @override
  String get contactUnblocked => '連絡先のブロックが解除されました';

  @override
  String get contactIsBlocked => 'この連絡先はブロックされています';

  @override
  String get unblock => 'ブロック解除';

  @override
  String get deleteContactSubtitle => '連絡先とチャットを削除';

  @override
  String get confirmWithPin => 'PIN で確認';

  @override
  String get enterPinToConfirm => 'この操作を確認するため PIN を入力してください';

  @override
  String get profilePhoto => 'プロフィール写真';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get chooseFromGallery => 'ギャラリーから選択';

  @override
  String get removePhoto => '写真を削除';

  @override
  String get viewContactHashId => '連絡先の識別子を表示';

  @override
  String get hashIdPartiallyMasked => 'あなたのセキュリティと連絡先のプライバシーのため部分的にマスクされています';

  @override
  String get addFirstContact => '最初の連絡先を追加';

  @override
  String get addFirstContactSubtitle => 'QR code を共有するか友達のをスキャン';

  @override
  String get directory => 'ディレクトリ';

  @override
  String get noContacts => '連絡先なし';

  @override
  String get noContactsSubtitle => '開始するには連絡先を追加してください';

  @override
  String get sendMessageAction => 'メッセージを送信';

  @override
  String get audioCall => '音声通話';

  @override
  String get videoCall => 'ビデオ通話';

  @override
  String get viewProfile => 'プロフィールを表示';

  @override
  String get deleteContactDirectory => '連絡先を削除';

  @override
  String get scanShort => 'スキャン';

  @override
  String get addShort => '追加';

  @override
  String deleteContactConfirmName(String name) {
    return '$nameを削除してもよろしいですか？';
  }

  @override
  String get noNotesTitle => 'メモなし';

  @override
  String get noNotesSubtitle => '最初のメモを作成';

  @override
  String get newNote => '新しいメモ';

  @override
  String get editNote => 'メモを編集';

  @override
  String get deleteNote => 'メモを削除';

  @override
  String get deleteNoteConfirm => 'このメモを削除してもよろしいですか？';

  @override
  String get noteTitle => 'タイトル';

  @override
  String get noteContent => '内容';

  @override
  String get addItem => 'アイテムを追加';

  @override
  String get pinNote => 'ピン留め';

  @override
  String get unpinNote => 'ピン留め解除';

  @override
  String get noteColor => '色';

  @override
  String get notePassword => 'パスワード';

  @override
  String get setPassword => 'パスワードを設定';

  @override
  String get changePassword => 'パスワードを変更';

  @override
  String get removePassword => 'パスワードを削除';

  @override
  String get enterPassword => 'パスワードを入力';

  @override
  String get confirmPassword => 'パスワードを確認';

  @override
  String get passwordPin => 'PIN コード';

  @override
  String get passwordText => 'テキストパスワード';

  @override
  String get protectedNote => '保護されたメモ';

  @override
  String get incorrectPassword => 'パスワードが正しくありません';

  @override
  String get passwordSet => 'パスワードが設定されました';

  @override
  String get passwordRemoved => 'パスワードが削除されました';

  @override
  String get notesBiometric => 'メモ用 Face ID';

  @override
  String get notesBiometricSubtitle => '保護されたメモを開くために生体認証を要求';

  @override
  String get textNote => 'テキストメモ';

  @override
  String get checklistNote => 'チェックリスト';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$totalタスク';
  }

  @override
  String get autoSaved => '保存済み';

  @override
  String get searchNotes => 'メモを検索';

  @override
  String get legalConsent => '法的同意';

  @override
  String get confirmAge13 => '13歳以上であることを確認します';

  @override
  String get acceptLegalStart => '';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get termsOfService => '利用規約';

  @override
  String get andThe => 'と';

  @override
  String get continueButton => '続行';

  @override
  String get mustAcceptTerms => '続行するには両方の条件に同意する必要があります';

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
  String get support => 'サポート';

  @override
  String get contactSupport => 'サポートに連絡';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => '不正使用を報告';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => '法的情報';

  @override
  String get legalEntity => '法人';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'ピン留め';

  @override
  String get unpinConversation => 'ピン留め解除';

  @override
  String get hideConversation => 'フィードから削除';

  @override
  String get deleteConversation => '会話を削除';

  @override
  String get deleteConversationConfirm => 'すべてのメッセージの削除を確認するため PIN を入力してください';

  @override
  String get noConversations => 'まだ会話がありません';

  @override
  String get startConversation => '開始';

  @override
  String get microphonePermissionRequired => 'マイクへのアクセスが必要です';

  @override
  String get microphonePermissionExplanation => 'Hash は通話にマイクが必要です。';

  @override
  String get cameraPermissionExplanation => 'Hash はビデオ通話にカメラが必要です。';

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
  String get openSettings => '設定を開く';

  @override
  String get callConnecting => '接続中...';

  @override
  String get callRinging => '呼び出し中...';

  @override
  String get callReconnecting => '再接続中...';

  @override
  String callReconnectingTimer(int seconds) {
    return '再接続中（$seconds秒）';
  }

  @override
  String get callPaused => '一時停止中';

  @override
  String get callPausedSubtitle => '通話はまだ続いています';

  @override
  String get callRemoteMicMuted => '連絡先のマイクがミュートされています';

  @override
  String get callMiniControlsMute => 'ミュート';

  @override
  String get callMiniControlsUnmute => 'ミュート解除';

  @override
  String get callMiniControlsHangUp => '切断';

  @override
  String get callMiniControlsReturn => '通話に戻る';

  @override
  String get callNetworkPoor => '不安定な接続';

  @override
  String get callNetworkLost => '接続が切れました';

  @override
  String get callEndedTitle => '通話終了';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'デバイスデータ';

  @override
  String get deviceDataSubtitle => 'ローカルとサーバーのストレージ';

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
  String get localStorage => 'ローカルストレージ';

  @override
  String get onThisDevice => 'このデバイス上';

  @override
  String get encryptedDatabases => '暗号化されたデータベース';

  @override
  String get files => 'ファイル';

  @override
  String get secureKeychain => 'セキュアキーチェーン';

  @override
  String get cache => 'キャッシュ';

  @override
  String get contactsDetail => '名前、アバター、Signal 鍵';

  @override
  String get messagesDetail => '暗号化された会話';

  @override
  String get notesDetail => '個人メモ';

  @override
  String get signalSessions => 'Signal セッション';

  @override
  String get signalSessionsDetail => '暗号化セッション';

  @override
  String get pendingContacts => '保留中の連絡先';

  @override
  String get pendingContactsDetail => '保留中のリクエスト';

  @override
  String get callHistory => '通話';

  @override
  String get callHistoryDetail => '通話履歴';

  @override
  String get preferences => '設定';

  @override
  String get preferencesDetail => 'メディアと通話の設定';

  @override
  String get avatars => 'アバター';

  @override
  String get media => 'メディア';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countファイル',
      one: '1ファイル',
      zero: 'ファイルなし',
    );
    return '$_temp0';
  }

  @override
  String get active => '有効';

  @override
  String get notDefined => '未設定';

  @override
  String get biometrics => '生体認証';

  @override
  String get recoveryPhrase => 'リカバリフレーズ';

  @override
  String get identity => 'アイデンティティ（Hash ID）';

  @override
  String get signalKeys => 'Signal Protocol 鍵';

  @override
  String get authTokens => '認証トークン';

  @override
  String get contactNamesCache => '連絡先名キャッシュ';

  @override
  String get remoteConfig => 'リモート設定';

  @override
  String get notificationPrefs => '通知設定';

  @override
  String get serverData => 'サーバーデータ';

  @override
  String get serverDataInfo => 'Hash はサーバーに最小限のデータのみ保持し、すべて暗号化または一時的です。';

  @override
  String get serverProfile => 'プロフィール';

  @override
  String get serverProfileDetail => 'Hash ID、公開鍵、メールボックストークン';

  @override
  String get serverPrekeys => 'プリキー';

  @override
  String get serverPrekeysDetail => 'ワンタイム Signal 鍵（消費済み）';

  @override
  String get serverMessages => '転送中のメッセージ';

  @override
  String get serverMessagesDetail => '配信後に削除（最大24時間）';

  @override
  String get serverMedia => '転送中のメディア';

  @override
  String get serverMediaDetail => 'ダウンロード後に削除';

  @override
  String get serverContactRequests => '連絡先リクエスト';

  @override
  String get serverContactRequestsDetail => '24時間後に期限切れ';

  @override
  String get serverRateLimits => 'レート制限';

  @override
  String get serverRateLimitsDetail => '一時的な不正使用防止データ';

  @override
  String get privacyReassurance =>
      'Hash はあなたのメッセージを読むことができません。すべてのデータはエンドツーエンド暗号化されています。サーバーデータは自動的に削除されます。';

  @override
  String get pinTooSimple => 'この PIN は簡単すぎます。より安全なコードを選択してください。';

  @override
  String get genericError => 'エラーが発生しました。もう一度お試しください。';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'アカウントを作成できません：$error';
  }

  @override
  String get phraseCopiedToClipboard => 'フレーズがクリップボードにコピーされました';

  @override
  String get copyPhrase => 'フレーズをコピー';

  @override
  String get recoveryPhraseSecurityWarning =>
      'このフレーズを安全な場所に書き留めてください。このフレーズなしで PIN を失うと、データへのアクセスを永久に失います。';

  @override
  String get noMessages => 'メッセージなし';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$nameとのすべてのメッセージを削除しますか？';
  }

  @override
  String get confirmation => '確認';

  @override
  String get untitled => '無題';

  @override
  String get noSessions => 'セッションなし';

  @override
  String get unknownContact => '不明な連絡先';

  @override
  String get unnamed => '名前なし';

  @override
  String get noPendingRequestsAlt => '保留中のリクエストはありません';

  @override
  String get deleteAllCallHistory => 'すべての通話履歴を削除しますか？';

  @override
  String get noCalls => '通話なし';

  @override
  String get noPreferences => '設定なし';

  @override
  String get resetAllMediaPrefs => 'すべてのメディア設定をリセットしますか？';

  @override
  String get deleteThisAvatar => 'このアバターを削除しますか？';

  @override
  String get deleteAllAvatars => 'すべてのアバターを削除しますか？';

  @override
  String get noAvatars => 'アバターなし';

  @override
  String get deleteThisFile => 'このファイルを削除しますか？';

  @override
  String get deleteAllMediaFiles => 'すべてのメディアを削除しますか？';

  @override
  String get noMediaFiles => 'メディアなし';

  @override
  String get outgoing => '発信';

  @override
  String get incoming => '着信';

  @override
  String ephemeralViewDuration(int seconds) {
    return '一時表示：$seconds秒';
  }

  @override
  String get normalView => '通常表示';

  @override
  String get callReasonCompleted => '完了';

  @override
  String get callReasonMissed => '不在着信';

  @override
  String get callReasonDeclined => '拒否';

  @override
  String get callReasonFailed => '失敗';

  @override
  String get justNow => '今';

  @override
  String timeAgoMinutes(int count) {
    return '$count分前';
  }

  @override
  String timeAgoHours(int count) {
    return '$count時間前';
  }

  @override
  String timeAgoDays(int count) {
    return '$count日前';
  }

  @override
  String get messageTypeContact => '連絡先';

  @override
  String get messageTypeLocation => '位置情報';

  @override
  String get statusQueued => 'キュー待ち';

  @override
  String get blockedBadge => 'ブロック済み';

  @override
  String get protectedBadge => '保護済み';

  @override
  String messageCount(int count) {
    return '$count件のメッセージ';
  }

  @override
  String get deleteQuestion => '削除しますか？';

  @override
  String get transferMyAccountTitle => 'アカウントを移行';

  @override
  String get loadingError => '読み込みエラー';

  @override
  String get transferToNewDevice => '新しいデバイスに移行';

  @override
  String get transferInstructions => '新しいデバイスで「アカウントを回復」を選択し、この情報を入力してください：';

  @override
  String get yourHashIdLabel => 'あなたの Hash ID';

  @override
  String get enterYourPinCode => 'PIN コードを入力';

  @override
  String get pinOwnerConfirmation => 'このアカウントの所有者であることを確認するため';

  @override
  String get scanThisQrCode => 'この QR code をスキャン';

  @override
  String get withYourNewDevice => '新しいデバイスで';

  @override
  String get orEnterTheCode => 'またはコードを入力';

  @override
  String get transferCodeLabel => '移行コード';

  @override
  String get proximityVerification => '近接確認';

  @override
  String get bringDevicesCloser => '両方のデバイスを近づけてください';

  @override
  String get confirmTransferQuestion => '移行を確認しますか？';

  @override
  String get accountWillBeTransferred =>
      'アカウントは新しいデバイスに移行されます。\n\nこのデバイスは完全に切断されます。';

  @override
  String get transferComplete => '移行完了';

  @override
  String get transferSuccessMessage => 'アカウントが正常に移行されました。\n\nこのアプリは閉じられます。';

  @override
  String get manualVerification => '手動確認';

  @override
  String get codeDisplayedOnBothDevices => '両方のデバイスに表示されたコード：';

  @override
  String get doesCodeMatchNewDevice => 'このコードは新しいデバイスのものと一致しますか？';

  @override
  String get verifiedStatus => '確認済み';

  @override
  String get inProgressStatus => '進行中...';

  @override
  String get notAvailableStatus => '利用不可';

  @override
  String get codeExpiredRestart => 'コードの期限が切れました。やり直してください。';

  @override
  String get codesDoNotMatchCancelled => 'コードが一致しません。移行がキャンセルされました。';

  @override
  String transferToDevice(String device) {
    return '宛先：$device';
  }

  @override
  String get copiedExclamation => 'コピーしました！';

  @override
  String expiresInTime(String time) {
    return '$timeで期限切れ';
  }

  @override
  String get biometricNotAvailable => 'このデバイスでは生体認証を利用できません';

  @override
  String get biometricAuthError => '生体認証中にエラーが発生しました';

  @override
  String get authenticateForBiometric => '生体認証を有効にするため認証してください';

  @override
  String get biometricAuthFailed => '生体認証に失敗しました';

  @override
  String get forceUpdateTitle => 'アップデートが必要です';

  @override
  String get forceUpdateMessage => 'Hash の新しいバージョンが利用可能です。続行するにはアップデートしてください。';

  @override
  String get updateButton => 'アップデート';

  @override
  String get maintenanceInProgress => 'メンテナンス中';

  @override
  String get tryAgainLater => '後でもう一度お試しください';

  @override
  String get information => '情報';

  @override
  String get later => '後で';

  @override
  String get doYouLikeHash => 'Hashは気に入りましたか？';

  @override
  String get yourFeedbackHelps => 'フィードバックがアプリの改善に役立ちます';

  @override
  String get ratingTerrible => 'ひどい';

  @override
  String get ratingBad => '悪い';

  @override
  String get ratingOk => '普通';

  @override
  String get ratingGood => '良い';

  @override
  String get ratingExcellent => '素晴らしい！';

  @override
  String get donationMessage =>
      'Hashは非営利プロジェクトです。あなたのサポートが本当にプライベートなメッセンジャーの構築を助けます。';

  @override
  String get recentConnections => '最近の接続';

  @override
  String get loginInfoText => 'PINでのロック解除はすべてローカルに記録されます。過去24時間のみ保持されます。';

  @override
  String get connectionCount => '接続';

  @override
  String get periodLabel => '期間';

  @override
  String get historyLabel => '履歴';

  @override
  String get noLoginRecorded => 'ログイン記録はありません';

  @override
  String get nextUnlocksAppearHere => '次のロック解除がここに表示されます。';

  @override
  String get dataLocalOnly => 'このデータはデバイスにのみ保存され、送信されることはありません。';

  @override
  String get currentSession => '現在';

  @override
  String get todayLabel => '今日';

  @override
  String get yesterdayLabel => '昨日';

  @override
  String get justNowLabel => 'たった今';

  @override
  String minutesAgoLabel(int count) {
    return '$count分前';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours時間前';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours時間$minutes分前';
  }

  @override
  String get noMaintenancePlanned => 'メンテナンスの予定はありません';

  @override
  String get everythingWorkingNormally => 'すべて正常に動作しています';

  @override
  String get maintenanceTitle => 'メンテナンス';

  @override
  String get maintenanceActiveLabel => '進行中';

  @override
  String get maintenancePlannedLabel => '予定';

  @override
  String get locking => 'ロック中...';

  @override
  String get newMessageNotification => '新しいメッセージ';

  @override
  String get secExplainTitle => 'Hash があなたを守る方法';

  @override
  String get secExplainIntro => 'Hash は誰もあなたのメッセージを読めないように設計されています。';

  @override
  String get secExplainIntroSub => '私たちでさえも。\nその仕組みを簡単に説明します。';

  @override
  String get secJourneyLabel => '旅';

  @override
  String get secJourneyTitle => 'メッセージの旅';

  @override
  String get secJourneySubtitle =>
      'あなたの指から連絡先の画面まで、すべてのステップが保護されています。その道をたどりましょう。';

  @override
  String get secStep1Title => 'メッセージを書く';

  @override
  String get secStep1Desc =>
      'アプリに「こんにちは！」と入力します。この時点で、メッセージは電話のメモリにのみ存在します。何も送信されていません。';

  @override
  String get secStep2Title => 'Signal Protocol で暗号化';

  @override
  String get secStep2Desc =>
      '「送信」を押すと、メッセージは理解不能な文字列に変換されます。メッセージが金庫に閉じ込められ、連絡先だけが鍵を持っているようなものです。';

  @override
  String get secStep3Title => 'Sealed Sender：見えない封筒';

  @override
  String get secStep3Desc =>
      '差出人の住所なしで手紙を送ることを想像してください。それがまさに Hash のすることです。メッセージは匿名のメールボックスに投函されます。サーバーは誰が送ったか知りません。';

  @override
  String get secStep4Title => 'サーバーには何も見えない';

  @override
  String get secStep4Desc =>
      'サーバーは目の見えない郵便配達員のように機能します。「誰かがメールボックス #A7X9 に何かを入れた」ということだけを知っています。誰が送ったか、何であるか、誰宛てかは分かりません。';

  @override
  String get secStep4Highlight =>
      'メタデータは保存されません：IP アドレスなし、タイムスタンプなし、送信者と受信者の間のリンクなし。';

  @override
  String get secStep5Title => '連絡先がメッセージを受信';

  @override
  String get secStep5Desc =>
      '連絡先の電話が匿名メールボックスからコンテンツを取得し、デバイスから離れたことのない秘密鍵でメッセージを復号します。「こんにちは！」が画面に表示されます。';

  @override
  String get secStep6Title => 'メッセージがサーバーから消える';

  @override
  String get secStep6Desc =>
      '連絡先が受信を確認するとすぐに、サーバーはメッセージを完全に削除します。ゴミ箱なし、アーカイブなし、バックアップなし。未読メッセージも24時間後に自動的に破棄されます。';

  @override
  String get secStep7Title => 'ローカルでの期限切れ';

  @override
  String get secStep7Desc =>
      '連絡先の電話では、あなたが選択した期間に従ってメッセージが自己破壊されます：既読後すぐ、5分、1時間...あなたが決めます。';

  @override
  String get secJourneyConclusion =>
      '結果：サーバーにゼロの痕跡、デバイスにゼロの痕跡。メッセージは読まれるのに十分な時間だけ存在し、その後消えました。';

  @override
  String get secArchLabel => 'アーキテクチャ';

  @override
  String get secArchTitle => '5層の保護';

  @override
  String get secArchSubtitle =>
      'Hash は単一の技術に依存していません。各層が他の層を強化します。1つの層が侵害されても、データは安全です。';

  @override
  String get secLayer1Title => 'エンドツーエンド暗号化';

  @override
  String get secLayer1Desc =>
      '各メッセージは固有の鍵で暗号化されます。簡単に言えば：誰かが1つのメッセージを解読しても、次のメッセージは解読できません。各メッセージに独自のロックがあります。';

  @override
  String get secLayer1Detail =>
      'ファイル（写真、動画、ドキュメント）には、Hash は追加の AES-256-GCM 暗号化を使用します。ファイルは電話を離れる前に暗号化されます。';

  @override
  String get secLayer2Title => 'Sealed Sender（ネットワーク匿名性）';

  @override
  String get secLayer2Desc =>
      '通常のメッセンジャーはあなたの身元と一緒にメッセージを送信します。封筒に名前を書くようなものです。Hash は匿名のメールボックスを使用します：サーバーは誰が送ったか知らずにメッセージを配信します。';

  @override
  String get secLayer2Detail => '結果：サーバーのデータ侵害が発生しても、誰が誰と話しているかを再構築することは不可能です。';

  @override
  String get secLayer3Title => '自動削除';

  @override
  String get secLayer3Desc =>
      'メッセージは受信確認後すぐにサーバーから削除されます。取得されなかったメッセージも24時間後に自動的に破棄されます。';

  @override
  String get secLayer3Detail =>
      '電話では、選択した期間に従ってメッセージが自己破壊されます：即時、5分、15分、30分、1時間、3時間、6時間、または12時間。';

  @override
  String get secLayer4Title => 'ローカルアクセス保護';

  @override
  String get secLayer4Desc =>
      'アプリは6桁の PIN と/または生体認証（Face ID、指紋）で保護されています。失敗が多すぎると、失敗ごとに増加する遅延でアプリがロックされます。';

  @override
  String get secLayer5Title => 'ロックされたデータベース';

  @override
  String get secLayer5Desc =>
      'サーバー側では、ユーザーがデータベースに直接書き込むことはできません。すべてのアクションは各リクエストを検証する安全な関数を経由します。';

  @override
  String get secLayer5Detail =>
      '銀行の窓口のようなものです：金庫に自分で触れることはありません。リクエストを出し、システムが行動する前に権利があるか確認します。';

  @override
  String get secVashLabel => '世界で唯一';

  @override
  String get secVashTitle => 'Vash モード';

  @override
  String get secVashSubtitle => '他のメッセージングアプリには存在しない緊急セキュリティシステム。';

  @override
  String get secVashScenarioTitle => 'この状況を想像してください';

  @override
  String get secVashScenario1 => '誰かがあなたの電話にアクセスする';

  @override
  String get secVashScenario2 => 'PIN コードを求められる';

  @override
  String get secVashScenario3 => 'すべてのデータを緊急に消去したい';

  @override
  String get secVashSolutionTitle => '解決策：2つの PIN コード';

  @override
  String get secVashSolutionDesc => 'Hash で2つの異なる PIN コードを設定します：';

  @override
  String get secVashNormalCodeLabel => '通常コード';

  @override
  String get secVashNormalCodeDesc => 'すべてのデータと共にアプリを通常通り開きます';

  @override
  String get secVashCodeLabel2 => 'Vash コード';

  @override
  String get secVashCodeDescription =>
      'アプリを通常通り開きます...しかしすべてのデータがバックグラウンドで静かに削除されます';

  @override
  String get secVashWhatHappensTitle => '次に何が起こるか';

  @override
  String get secVashWhatHappensDesc =>
      'アプリは通常通り開きます。アラートなし、怪しいアニメーションなし。画面は単にインストールしたばかりのような空のアプリを表示します。\n\n実際には、すべての会話、連絡先、メッセージが一瞬で不可逆的に削除されています。';

  @override
  String get secCallsLabel => '通話とファイル';

  @override
  String get secCallsTitle => 'すべてが暗号化';

  @override
  String get secCallsSubtitle =>
      'メッセージだけではありません。Hash を通過するすべてのものがエンドツーエンド暗号化されています。';

  @override
  String get secAudioCallTitle => '音声通話';

  @override
  String get secAudioCallDesc => 'WebRTC 経由でエンドツーエンド暗号化。音声はデバイス間で直接送信されます。';

  @override
  String get secVideoCallTitle => 'ビデオ通話';

  @override
  String get secVideoCallDesc => '同じ技術、各ストリームが個別に暗号化。';

  @override
  String get secPhotosTitle => '写真と動画';

  @override
  String get secPhotosDesc => '電話を離れる前に AES-256-GCM で暗号化。';

  @override
  String get secDocsTitle => 'ドキュメント';

  @override
  String get secDocsDesc => 'PDF、ZIP、あらゆるファイル。名前、サイズ、内容が暗号化。';

  @override
  String get secAnonLabel => '匿名性';

  @override
  String get secAnonTitle => '身元確認不要';

  @override
  String get secAnonSubtitle =>
      'Hash は電話番号やメールアドレスを要求しません。固有の匿名 Hash ID で識別されます。';

  @override
  String get secHashIdTitle => 'あなたの Hash ID';

  @override
  String get secHashIdDesc =>
      'これはあなたの固有の識別子です。名前も、番号も、場所も明かしません。実際の身元に結びつけることが不可能な仮名のようなものです。\n\n連絡先を追加するには、Hash ID を共有するか QR code をスキャンします。それだけです。同期されたアドレス帳なし、「知り合いかも」の提案なし。';

  @override
  String get secDataLabel => 'データ';

  @override
  String get secDataTitle => 'Hash が知らないこと';

  @override
  String get secDataSubtitle => 'データを保護する最善の方法は、収集しないことです。';

  @override
  String get secNeverCollected => '収集しない情報';

  @override
  String get secNeverItem1 => 'メッセージ内容';

  @override
  String get secNeverItem2 => '連絡先リスト';

  @override
  String get secNeverItem3 => '電話番号';

  @override
  String get secNeverItem4 => 'メールアドレス';

  @override
  String get secNeverItem5 => 'IP アドレス';

  @override
  String get secNeverItem6 => '位置情報';

  @override
  String get secNeverItem7 => 'メタデータ（誰が誰と話しているか）';

  @override
  String get secNeverItem8 => '通話履歴';

  @override
  String get secNeverItem9 => 'アドレス帳';

  @override
  String get secNeverItem10 => '広告識別子';

  @override
  String get secTempStored => '一時的に保存';

  @override
  String get secTempItem1 => '匿名 Hash ID（固有識別子）';

  @override
  String get secTempItem2 => '公開暗号鍵';

  @override
  String get secTempItem3 => '転送中の暗号化メッセージ（最大24時間）';

  @override
  String get secTempNote =>
      'この最小限のデータでさえ、あなたを特定することはできません。Hash ID は個人情報に紐づいていません。';

  @override
  String get secFooterTitle => 'あなたのプライバシー、あなたの自由';

  @override
  String get secFooterDesc =>
      'Hash は最も要求の厳しいプロフェッショナルアプリケーションと同じ暗号化技術を使用しています。メッセージは約束ではなく数学で保護されています。';

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
