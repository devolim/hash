// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => '흔적 없음. 타협 없음.';

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
  String get conversations => '채팅';

  @override
  String get contacts => '연락처';

  @override
  String get noConversation => '채팅 없음';

  @override
  String get noConversationSubtitle => '안전하게 대화하려면 연락처를 추가하세요';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '대기 중인 요청 $count개',
      one: '대기 중인 요청 1개',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '보낸 요청 $count개 대기 중',
      one: '보낸 요청 1개 대기 중',
    );
    return '$_temp0';
  }

  @override
  String get addContact => '연락처 추가';

  @override
  String get shareApp => '앱 공유';

  @override
  String get newMessage => '새 메시지';

  @override
  String get newConversation => '메시지 보내기';

  @override
  String get settings => '설정';

  @override
  String get myHashId => '내 Hash ID';

  @override
  String get supportHash => 'Hash 지원';

  @override
  String get supportHashSubtitle => 'Hash 개발을 지원해 주세요';

  @override
  String get donate => '기부하기';

  @override
  String get appearance => '화면';

  @override
  String get theme => '테마';

  @override
  String get themeAuto => '자동';

  @override
  String get themeAutoSubtitle => 'Follows system settings';

  @override
  String get themeDark => '어둡게';

  @override
  String get themeLight => '밝게';

  @override
  String get themeRecommendation =>
      'Dark theme is recommended for better privacy';

  @override
  String get language => '언어';

  @override
  String get languageAuto => '자동 (시스템)';

  @override
  String get notifications => '알림';

  @override
  String get messages => 'Messages';

  @override
  String get calls => 'Calls';

  @override
  String get vibration => 'Vibration';

  @override
  String get notificationContent => '알림 내용';

  @override
  String get notificationContentFull => '전체';

  @override
  String get notificationContentFullDesc => '발신자 이름과 메시지 미리보기 표시';

  @override
  String get notificationContentName => '이름만';

  @override
  String get notificationContentNameDesc => '연락처 이름만 표시';

  @override
  String get notificationContentDiscrete => '간략히';

  @override
  String get notificationContentDiscreteDesc => '\"새 메시지\"만 표시';

  @override
  String get security => '보안';

  @override
  String get howHashProtectsYou => 'How Hash protects you';

  @override
  String get howHashProtectsYouSubtitle => 'Understand your security';

  @override
  String get accountSecurity => 'Account security';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrics, Vash Mode';

  @override
  String get blockScreenshots => 'Block screenshots';

  @override
  String get transferDevice => 'Transfer to another device';

  @override
  String get transferDeviceSubtitle => 'Migrate your account';

  @override
  String get pinCode => 'PIN 코드';

  @override
  String get changePin => 'PIN 변경';

  @override
  String get currentPin => 'Current PIN code';

  @override
  String get newPin => '새 PIN';

  @override
  String get confirmPin => 'PIN 확인';

  @override
  String get pinChanged => 'PIN이 변경되었습니다';

  @override
  String get incorrectPin => 'Incorrect PIN';

  @override
  String get pinsDoNotMatch => 'PINs do not match';

  @override
  String get autoLock => 'Auto-lock';

  @override
  String get autoLockDelay => 'Lock delay';

  @override
  String get autoLockImmediate => 'Immediate';

  @override
  String get autoLockMinute => '1 minute';

  @override
  String autoLockMinutes(int count) {
    return '$count minutes';
  }

  @override
  String get vashCode => 'Vash code';

  @override
  String get vashModeTitle => 'Vash Mode';

  @override
  String get vashModeExplanation => 'Your ultimate safety net.';

  @override
  String get vashModeDescription =>
      'You will choose a second PIN code. If you are ever forced to open Hash, enter this code instead of your regular PIN.\n\nThe app will open normally, but all your conversations and contacts will be gone.\n\nTo anyone looking at your screen, Hash simply appears empty — as if you never used it.';

  @override
  String get vashModeIrreversible => 'This action is silent and irreversible.';

  @override
  String get chooseVashCode => 'Choose my Vash code';

  @override
  String get vashCodeInfo =>
      'A second PIN code that opens the app normally, but empty.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'If you enter this code instead of your PIN:';

  @override
  String get vashDeleteContacts => 'Your contacts disappear';

  @override
  String get vashDeleteMessages => 'Your conversations disappear';

  @override
  String get vashDeleteHistory => 'Your notes disappear';

  @override
  String get vashKeepId => 'Your Hash identity (#XXX-XXX-XXX) remains the same';

  @override
  String get vashAppearNormal =>
      'The app appears normal but empty, like new. This action is irreversible.';

  @override
  String get setupVashCode => 'Set up Vash code';

  @override
  String get modifyVashCode => 'Modify Vash code';

  @override
  String get currentVashCode => 'Current Vash code';

  @override
  String get newVashCode => 'New Vash code';

  @override
  String get confirmVashCode => 'Confirm Vash code';

  @override
  String get vashCodeConfigured => 'Vash code configured';

  @override
  String get vashCodeModified => 'Vash code modified';

  @override
  String get vashCodeMustDiffer => 'Vash code must be different from PIN';

  @override
  String get incorrectVashCode => 'Incorrect Vash code';

  @override
  String get vashWhatToDelete => 'What should Vash Mode make disappear?';

  @override
  String get vashDeleteContactsOption => 'Contacts';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Messages';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notes';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash Mode activated';

  @override
  String get vashCreateSubtitle => 'Choose a code different from your main PIN';

  @override
  String get vashConfirmSubtitle => 'Confirm your Vash code';

  @override
  String get pinCodeForEntry => '앱 진입용 PIN 코드';

  @override
  String get vashCodeSection => 'Vash Mode';

  @override
  String get biometric => '생체 인식';

  @override
  String get biometricUnlock => '지문 또는 Face ID로 잠금 해제';

  @override
  String get enableBiometric => '생체 인식 활성화';

  @override
  String get biometricWarningMessage =>
      '생체 인식을 활성화하면 PIN을 사용할 수 없습니다. 계속하시겠습니까?';

  @override
  String get understood => '이해했습니다';

  @override
  String get shareAppSubtitle => '소중한 사람들과 Hash를 공유하세요';

  @override
  String get share => '공유';

  @override
  String get danger => 'Danger';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get deleteAccountSubtitle => '모든 데이터 영구 삭제';

  @override
  String get deleteAccountConfirmTitle => 'Delete my account';

  @override
  String get deleteAccountConfirmMessage =>
      'Your account will be permanently deleted. This action is irreversible.\n\n• All your chats\n• All your contacts\n• Your Hash ID\n\nYou will need to create a new account.';

  @override
  String get deleteForever => 'Delete permanently';

  @override
  String get cancel => '취소';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash Mode activated.';

  @override
  String deletionError(String error) {
    return 'Deletion error: $error';
  }

  @override
  String get yourSecurity => 'Your security';

  @override
  String get securityInfo => '보안 정보';

  @override
  String version(String version) {
    return '버전';
  }

  @override
  String get welcome => 'Welcome';

  @override
  String get securityStatement1 => 'Your messages are protected.';

  @override
  String get securityStatement2 => 'End-to-end encryption.';

  @override
  String get securityStatement3 => 'No trace. No compromise.';

  @override
  String get securityStatement4 => 'Your privacy is a right.';

  @override
  String get accessBlocked => 'Access blocked';

  @override
  String get tooManyAttempts => 'Too many attempts. Try again later.';

  @override
  String get pleaseWait => 'Please wait';

  @override
  String get waitDelay => 'Please wait for the delay to end';

  @override
  String attemptCount(int current, int max) {
    return 'Attempt $current of $max';
  }

  @override
  String retryIn(String time) {
    return 'Retry in $time';
  }

  @override
  String get forgotPin => 'Forgot PIN? Use recovery phrase';

  @override
  String get useRecoveryPhrase => 'Use recovery phrase';

  @override
  String get recoveryWarningTitle => 'Warning';

  @override
  String get recoveryWarningMessage => 'Account recovery will:';

  @override
  String get recoveryDeleteAllMessages => 'Delete ALL your messages';

  @override
  String get recoveryWaitDelay => 'Require a 1-hour delay';

  @override
  String get recoveryKeepContacts => 'Keep your contacts';

  @override
  String get recoveryIrreversible =>
      'This action is irreversible. Your messages will be permanently lost.';

  @override
  String get iUnderstand => 'I understand';

  @override
  String get accountRecovery => 'Account recovery';

  @override
  String get enterRecoveryPhrase =>
      'Enter the 24 words of your recovery phrase, separated by spaces.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Recover';

  @override
  String get recoveryPhraseRequired => 'Please enter your recovery phrase';

  @override
  String get recoveryPhrase24Words =>
      'The phrase must contain exactly 24 words';

  @override
  String get incorrectRecoveryPhrase => 'Incorrect recovery phrase';

  @override
  String get recoveryInitError => 'Error initializing recovery';

  @override
  String get securityDelay => 'Security delay';

  @override
  String get securityDelayMessage =>
      'For your security, a waiting period is required before you can create a new PIN.';

  @override
  String get timeRemaining => 'Time remaining';

  @override
  String get messagesDeletedForProtection =>
      'Your messages have been deleted for your protection.';

  @override
  String get canCloseApp => 'You can close the app and come back later.';

  @override
  String get onboardingTitle1 => 'Welcome to Hash';

  @override
  String get onboardingSubtitle1 => 'The messenger that leaves no trace';

  @override
  String get onboardingTitle2 => 'Total encryption';

  @override
  String get onboardingSubtitle2 =>
      'Your messages are end-to-end encrypted with Signal protocol';

  @override
  String get onboardingTitle3 => 'No trace';

  @override
  String get onboardingSubtitle3 =>
      'Messages are deleted from servers upon delivery';

  @override
  String get onboardingTitle4 => 'Your security';

  @override
  String get onboardingSubtitle4 => 'PIN code, Vash Mode and recovery phrase';

  @override
  String get getStarted => '시작하기';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get alreadyHaveAccount => 'I already have an account';

  @override
  String get transferMyAccount => 'Transfer my account';

  @override
  String get createPin => 'Create a PIN code';

  @override
  String get createPinSubtitle => 'This code will protect access to your app';

  @override
  String get confirmYourPin => 'Confirm your PIN code';

  @override
  String get confirmPinSubtitle => 'Enter your PIN code again';

  @override
  String get saveRecoveryPhrase => 'Recovery phrase';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Write down these 24 words in order. They will allow you to recover your account if you forget your PIN.';

  @override
  String get phraseWritten => 'I\'ve written my phrase';

  @override
  String get warningRecoveryPhrase =>
      'If you lose this phrase and forget your PIN, you will lose access to your account.';

  @override
  String get accountTransferred => 'Account transferred';

  @override
  String get accountTransferredMessage =>
      'Your account has been transferred to another device. This session is no longer valid.';

  @override
  String get accountTransferredInfo =>
      'If you did not initiate this transfer, your account may have been compromised.';

  @override
  String get logout => 'Log out';

  @override
  String get transferAccount => '계정 이전';

  @override
  String get transferAccountInfo =>
      'Transfer your Hash account to a new device. Your current session will be invalidated.';

  @override
  String get generateTransferCode => 'Generate transfer code';

  @override
  String get transferCode => 'Transfer code';

  @override
  String transferCodeExpires(int minutes) {
    return 'This code expires in $minutes minutes';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Enter this code on your new device to transfer your account.';

  @override
  String get generateNewCode => '새 코드 생성';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String get scanQrCodeSubtitle => 'Scan a contact\'s QR code to add them';

  @override
  String get qrCodeDetected => 'QR code detected';

  @override
  String get invalidQrCode => 'Invalid QR code';

  @override
  String get cameraPermissionRequired => 'Camera permission required';

  @override
  String get myQrCode => 'My QR code';

  @override
  String get myQrCodeSubtitle =>
      'Share this QR code so your contacts can add you';

  @override
  String get shareQrCode => 'Share';

  @override
  String get addContactTitle => '연락처 추가';

  @override
  String get addContactByHashId => 'Enter your contact\'s Hash ID';

  @override
  String get hashIdHint => 'Hash ID를 입력하세요';

  @override
  String get searchContact => 'Search';

  @override
  String get contactNotFound => 'Contact not found';

  @override
  String get contactAlreadyAdded => 'This contact is already in your list';

  @override
  String get contactAdded => 'Contact added';

  @override
  String get myProfile => 'My profile';

  @override
  String get myProfileSubtitle =>
      'Share this information so others can add you';

  @override
  String get temporaryCode => 'Temporary code';

  @override
  String temporaryCodeExpires(String time) {
    return 'Expires in $time';
  }

  @override
  String get codeExpired => '코드가 만료되었습니다';

  @override
  String get generateNewCodeButton => 'New code';

  @override
  String get copyHashId => 'Copy ID';

  @override
  String get copyCode => 'Copy code';

  @override
  String get copiedToClipboard => 'Copied';

  @override
  String get showMyQrCode => 'Show my QR code';

  @override
  String get orDivider => 'or';

  @override
  String get openScanner => 'Open scanner';

  @override
  String get addManually => 'Add manually';

  @override
  String get contactHashIdLabel => 'Contact\'s Hash ID';

  @override
  String get temporaryCodeLabel => 'Temporary code';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Ask your contact to generate a code from their profile';

  @override
  String get verifyAndAdd => 'Verify and add';

  @override
  String get fillAllFields => 'Please fill in all fields';

  @override
  String get invalidHashIdFormat => 'Invalid ID format (e.g.: 123-456-ABC)';

  @override
  String get userNotFound => 'User not found';

  @override
  String get cannotAddYourself => 'You cannot add yourself';

  @override
  String get invalidOrExpiredCode => 'Invalid or expired temporary code';

  @override
  String get contactFound => 'Contact found!';

  @override
  String get howToCallContact => 'What would you like to call them?';

  @override
  String get contactNameHint => 'Contact name';

  @override
  String get addContactButton => 'Add';

  @override
  String get contactDetails => 'Contact details';

  @override
  String get contactName => 'Contact name';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Added on $date';
  }

  @override
  String get deleteContact => '연락처 삭제';

  @override
  String deleteContactConfirm(Object name) {
    return '$name을(를) 삭제하시겠습니까?';
  }

  @override
  String get deleteContactMessage => '이 연락처와의 모든 메시지가 삭제됩니다';

  @override
  String get delete => '삭제';

  @override
  String get typeMessage => '메시지 입력...';

  @override
  String get messageSent => 'Sent';

  @override
  String get messageDelivered => 'Delivered';

  @override
  String get messageRead => 'Read';

  @override
  String get messageFailed => 'Failed to send';

  @override
  String get now => 'Now';

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
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String dateAtTime(String date, String time) {
    return '$date at $time';
  }

  @override
  String get shareMessage =>
      'Join me on Hash! 🔒\n\nIt\'s a truly private messenger: total encryption, no trace on servers, and panic mode if needed.\n\nDownload the app here 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => '오류';

  @override
  String get ok => '확인';

  @override
  String get view => 'View';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get save => '저장';

  @override
  String get edit => '편집';

  @override
  String get close => '닫기';

  @override
  String get confirm => '확인';

  @override
  String get loading => '로딩 중...';

  @override
  String get retry => '다시 시도';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => '대기 중인 요청';

  @override
  String get noPendingRequests => '대기 중인 요청 없음';

  @override
  String get pendingRequestsSubtitle => 'These people want to add you';

  @override
  String requestFromUser(String hashId) {
    return 'Request from $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Expires in $days days';
  }

  @override
  String get acceptRequest => '수락';

  @override
  String get rejectRequest => 'Reject';

  @override
  String get requestAccepted => '요청이 수락되었습니다';

  @override
  String get requestRejected => 'Request rejected';

  @override
  String get requestSent => 'Request sent!';

  @override
  String get requestSentSubtitle =>
      'Your request has been sent. The user must accept it before you can chat.';

  @override
  String get requestAlreadyPending => 'A request is already pending';

  @override
  String get requestAlreadySentByOther =>
      'This person has already sent you a request';

  @override
  String get addByHashId => 'Add by Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Enter the contact\'s Hash ID and temporary code';

  @override
  String get enterTemporaryCode => 'Enter the 6-digit code';

  @override
  String get sendRequest => 'Send request';

  @override
  String get acceptContactTitle => 'Accept contact';

  @override
  String get acceptContactSubtitle => 'You can give them a custom name';

  @override
  String get leaveEmptyForHashId => 'Leave empty to use Hash ID';

  @override
  String get firstName => 'First name';

  @override
  String get lastName => 'Last name';

  @override
  String get notes => 'Notes';

  @override
  String get notesHint => 'Personal notes about this contact';

  @override
  String get photoOptional => 'Photo (optional)';

  @override
  String get contactNameOptional => 'Name (optional)';

  @override
  String get notesOptional => 'Notes (optional)';

  @override
  String get storedLocally => 'Stored on your device only';

  @override
  String get encryptedMessageLabel => 'Encrypted message';

  @override
  String get identityMessageHint => 'Who are you? How do you know each other?';

  @override
  String get messageWillBeSentEncrypted =>
      'This message will be encrypted and sent to the recipient';

  @override
  String get sendRequestButton => 'Send request';

  @override
  String get requestExpiresIn24h => 'Request expires in 24h if not accepted';

  @override
  String get theyAlreadySentYouRequest =>
      'This person has already sent you a request';

  @override
  String get requests => 'Requests';

  @override
  String get receivedRequests => 'Received';

  @override
  String get sentRequests => '보낸 요청';

  @override
  String get noSentRequests => '보낸 요청 없음';

  @override
  String get cancelRequest => '취소';

  @override
  String get deleteRequest => 'Delete request';

  @override
  String get requestCancelled => '요청이 취소되었습니다';

  @override
  String sentTo(String hashId) {
    return 'Sent to $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Expires in $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Received $time ago';
  }

  @override
  String get messageFromRequester => 'Message from requester';

  @override
  String get copy => '복사';

  @override
  String get messageInfo => 'Message info';

  @override
  String get messageDirection => 'Direction';

  @override
  String get messageSentByYou => 'Sent by you';

  @override
  String get messageReceived => 'Received';

  @override
  String get messageSentAt => 'Sent at';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Read at';

  @override
  String get messageType => 'Type';

  @override
  String get messageSize => 'Size';

  @override
  String get messageExpiresAt => 'Expires at';

  @override
  String get messageEncrypted => 'End-to-end encrypted';

  @override
  String get messageStatusSending => 'Sending...';

  @override
  String get messageStatusSent => 'Sent';

  @override
  String get messageStatusDelivered => 'Delivered';

  @override
  String get messageStatusRead => 'Read';

  @override
  String get messageStatusFailed => 'Failed';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Pending delivery';

  @override
  String get deletedFromServer => 'Deleted';

  @override
  String get messageTypeText => 'Text';

  @override
  String get messageTypeImage => 'Image';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Voice';

  @override
  String get messageTypeFile => 'File';

  @override
  String get indefinitely => 'Indefinitely';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'hours';

  @override
  String get minutes => 'minutes';

  @override
  String get seconds => 'seconds';

  @override
  String get ephemeralMessages => 'Ephemeral messages';

  @override
  String get ephemeralMessagesDescription =>
      'Messages are automatically deleted after this time';

  @override
  String get ephemeralImmediate => 'Immediate (after reading)';

  @override
  String get ephemeralImmediateDesc => 'Deleted as soon as read';

  @override
  String get ephemeralMyPreference => 'My preference';

  @override
  String get ephemeralMyPreferenceDesc => 'Use global setting';

  @override
  String get ephemeralDefaultSetting => 'Message duration';

  @override
  String get ephemeralChooseDefault => 'Recommended';

  @override
  String get ephemeral30Seconds => '30초';

  @override
  String get ephemeral30SecondsDesc => '읽은 후 30초 후 삭제';

  @override
  String get ephemeral5Minutes => '5분';

  @override
  String get ephemeral5MinutesDesc => '읽은 후 5분 후 삭제';

  @override
  String get ephemeral1Hour => '1시간';

  @override
  String get ephemeral1HourDesc => '읽은 후 1시간 후 삭제';

  @override
  String get ephemeral3Hours => '3 hours';

  @override
  String get ephemeral6Hours => '6시간';

  @override
  String get ephemeral6HoursDesc => '읽은 후 6시간 후 삭제';

  @override
  String get ephemeral12Hours => '12 hours';

  @override
  String get ephemeral24Hours => '24시간';

  @override
  String get ephemeral24HoursDesc => '읽은 후 24시간 후 삭제';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Custom duration';

  @override
  String get howItWorks => 'How it works';

  @override
  String get ephemeralExplanation1 =>
      'Messages are deleted from the server as soon as received.';

  @override
  String get ephemeralExplanation2 =>
      'This setting defines when messages disappear from YOUR phone after reading.';

  @override
  String get ephemeralExplanation3 =>
      'Your contact has their own setting for their phone.';

  @override
  String get mute1Hour => '1 hour';

  @override
  String get mute8Hours => '8 hours';

  @override
  String get mute1Day => '1 day';

  @override
  String get mute1Week => '1 week';

  @override
  String get muteAlways => 'Always';

  @override
  String get muteExplanation =>
      'You won\'t receive notifications for this contact';

  @override
  String get showCallsInRecents => '최근 통화에 표시';

  @override
  String get showCallsInRecentsSubtitle => 'Hash 통화가 전화 기록에 표시됩니다';

  @override
  String get feedback => '피드백';

  @override
  String get muteNotifications => 'Mute notifications';

  @override
  String get muteDescription =>
      'You won\'t receive notifications for this contact';

  @override
  String mutedUntil(String time) {
    return 'Muted until $time';
  }

  @override
  String get notMuted => 'Notifications enabled';

  @override
  String get unmute => 'Unmute';

  @override
  String get notificationSound => 'Notification sound';

  @override
  String get defaultSound => 'Default';

  @override
  String get chatSettings => 'Chat settings';

  @override
  String get bubbleColor => 'Bubble color';

  @override
  String get backgroundColor => 'Background color';

  @override
  String get backgroundImage => 'Background image';

  @override
  String get chatBackground => 'Chat background';

  @override
  String get customColor => 'Custom';

  @override
  String get defaultColor => 'Default';

  @override
  String get imageSelected => 'Image selected';

  @override
  String get noImage => 'No image';

  @override
  String get color => 'Color';

  @override
  String get image => 'Image';

  @override
  String get tapToSelectImage => 'Tap to select an image';

  @override
  String get changeImage => 'Change image';

  @override
  String get previewMessageReceived => 'Hello!';

  @override
  String get previewMessageSent => 'Hey there!';

  @override
  String get messageAction => 'Message';

  @override
  String get callAction => 'Call';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Personal notes';

  @override
  String get addNotes => 'Add notes...';

  @override
  String get noNotes => 'No notes';

  @override
  String get messageNotifications => 'Message notifications';

  @override
  String get callNotifications => 'Call notifications';

  @override
  String get useGradient => 'Use gradient';

  @override
  String get gradientStart => 'Start color';

  @override
  String get gradientEnd => 'End color';

  @override
  String get preview => 'Preview';

  @override
  String get reset => 'Reset';

  @override
  String get securityNumber => 'Security number';

  @override
  String securityNumberDescription(String name) {
    return 'Verify that the security number matches $name\'s device';
  }

  @override
  String get verifyEncryption => 'Verify end-to-end encryption';

  @override
  String get tapToCopy => 'Tap to copy';

  @override
  String get howToVerify => 'How to verify';

  @override
  String get verifyStep1 => 'Meet your contact in person or call them';

  @override
  String get verifyStep2 => 'Compare the security numbers or scan QR codes';

  @override
  String get verifyStep3 => 'If they match, your chat is secure';

  @override
  String get scanToVerify => 'Scan to verify';

  @override
  String get reportSpam => '스팸 신고';

  @override
  String get reportSpamSubtitle => 'Report this contact as spam';

  @override
  String get reportSpamDescription =>
      'This will anonymously report this contact. Your identity will not be shared. Are you sure?';

  @override
  String get report => 'Report';

  @override
  String get spamReported => 'Spam reported';

  @override
  String get reportError => 'Failed to send report. Please try again.';

  @override
  String get reportRateLimited =>
      'You have reached the maximum number of reports for today.';

  @override
  String get blockContact => '연락처 차단';

  @override
  String get blockContactDescription =>
      'This contact will no longer be able to send you messages or call you. They won\'t be notified.';

  @override
  String get unblockContact => '차단 해제';

  @override
  String get unblockContactDescription =>
      'This contact will be able to send you messages and call you again.';

  @override
  String get contactBlocked => '연락처가 차단되었습니다';

  @override
  String get contactUnblocked => '차단이 해제되었습니다';

  @override
  String get contactIsBlocked => 'This contact is blocked';

  @override
  String get unblock => 'Unblock';

  @override
  String get deleteContactSubtitle => 'Delete this contact and chat';

  @override
  String get confirmWithPin => 'Confirm with PIN';

  @override
  String get enterPinToConfirm => 'Enter your PIN to confirm this action';

  @override
  String get profilePhoto => 'Profile photo';

  @override
  String get takePhoto => '사진 촬영';

  @override
  String get chooseFromGallery => '갤러리에서 선택';

  @override
  String get removePhoto => 'Remove photo';

  @override
  String get viewContactHashId => 'View contact\'s identifier';

  @override
  String get hashIdPartiallyMasked =>
      'Partially masked for your security and your contact\'s privacy';

  @override
  String get addFirstContact => 'Add your first contact';

  @override
  String get addFirstContactSubtitle =>
      'Share your QR code or scan a friend\'s';

  @override
  String get directory => 'Directory';

  @override
  String get noContacts => 'No contacts';

  @override
  String get noContactsSubtitle => 'Add a contact to get started';

  @override
  String get sendMessageAction => 'Send a message';

  @override
  String get audioCall => 'Audio call';

  @override
  String get videoCall => 'Video call';

  @override
  String get viewProfile => 'View profile';

  @override
  String get deleteContactDirectory => 'Delete contact';

  @override
  String get scanShort => 'Scan';

  @override
  String get addShort => 'Add';

  @override
  String deleteContactConfirmName(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get noNotesTitle => 'No notes';

  @override
  String get noNotesSubtitle => 'Create your first note';

  @override
  String get newNote => 'New note';

  @override
  String get editNote => 'Edit note';

  @override
  String get deleteNote => 'Delete note';

  @override
  String get deleteNoteConfirm => 'Are you sure you want to delete this note?';

  @override
  String get noteTitle => 'Title';

  @override
  String get noteContent => 'Content';

  @override
  String get addItem => 'Add item';

  @override
  String get pinNote => 'Pin';

  @override
  String get unpinNote => 'Unpin';

  @override
  String get noteColor => 'Color';

  @override
  String get notePassword => 'Password';

  @override
  String get setPassword => 'Set password';

  @override
  String get changePassword => 'Change password';

  @override
  String get removePassword => 'Remove password';

  @override
  String get enterPassword => 'Enter password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get passwordPin => 'PIN code';

  @override
  String get passwordText => 'Text password';

  @override
  String get protectedNote => 'Protected note';

  @override
  String get incorrectPassword => 'Incorrect password';

  @override
  String get passwordSet => 'Password set';

  @override
  String get passwordRemoved => 'Password removed';

  @override
  String get notesBiometric => 'Face ID for notes';

  @override
  String get notesBiometricSubtitle =>
      'Require biometric authentication to open protected notes';

  @override
  String get textNote => 'Text note';

  @override
  String get checklistNote => 'Checklist';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tasks';
  }

  @override
  String get autoSaved => 'Saved';

  @override
  String get searchNotes => 'Search notes';

  @override
  String get legalConsent => 'Legal consent';

  @override
  String get confirmAge13 => 'I confirm that I am at least 13 years old';

  @override
  String get acceptLegalStart => 'I accept the ';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get termsOfService => '서비스 약관';

  @override
  String get andThe => ' and the ';

  @override
  String get continueButton => 'Continue';

  @override
  String get mustAcceptTerms => 'You must accept both conditions to continue';

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
  String get support => '지원';

  @override
  String get contactSupport => '지원팀 문의';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => '신고하기';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => '법적 정보';

  @override
  String get legalEntity => 'Legal entity';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Pin';

  @override
  String get unpinConversation => 'Unpin';

  @override
  String get hideConversation => 'Remove from feed';

  @override
  String get deleteConversation => 'Delete conversation';

  @override
  String get deleteConversationConfirm =>
      'Enter your PIN to confirm the deletion of all messages';

  @override
  String get noConversations => 'No conversations yet';

  @override
  String get startConversation => 'Start';

  @override
  String get microphonePermissionRequired => 'Microphone access required';

  @override
  String get microphonePermissionExplanation =>
      'Hash needs the microphone to make calls.';

  @override
  String get cameraPermissionExplanation =>
      'Hash needs the camera for video calls.';

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
  String get openSettings => 'Open Settings';

  @override
  String get callConnecting => 'Connecting...';

  @override
  String get callRinging => 'Ringing...';

  @override
  String get callReconnecting => 'Reconnecting...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Reconnecting (${seconds}s)';
  }

  @override
  String get callPaused => '일시정지';

  @override
  String get callPausedSubtitle => '통화가 계속 진행 중입니다';

  @override
  String get callRemoteMicMuted => 'Contact\'s microphone is muted';

  @override
  String get callMiniControlsMute => 'Mute';

  @override
  String get callMiniControlsUnmute => 'Unmute';

  @override
  String get callMiniControlsHangUp => 'Hang up';

  @override
  String get callMiniControlsReturn => 'Return to call';

  @override
  String get callNetworkPoor => 'Unstable connection';

  @override
  String get callNetworkLost => 'Connection lost';

  @override
  String get callEndedTitle => 'Call ended';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Device data';

  @override
  String get deviceDataSubtitle => 'Local and server storage';

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
  String get localStorage => 'Local storage';

  @override
  String get onThisDevice => 'on this device';

  @override
  String get encryptedDatabases => 'Encrypted databases';

  @override
  String get files => 'Files';

  @override
  String get secureKeychain => 'Secure keychain';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Names, avatars, Signal keys';

  @override
  String get messagesDetail => 'Encrypted conversations';

  @override
  String get notesDetail => 'Personal notes';

  @override
  String get signalSessions => 'Signal sessions';

  @override
  String get signalSessionsDetail => 'Encryption sessions';

  @override
  String get pendingContacts => 'Pending contacts';

  @override
  String get pendingContactsDetail => 'Pending requests';

  @override
  String get callHistory => 'Calls';

  @override
  String get callHistoryDetail => 'Call history';

  @override
  String get preferences => 'Preferences';

  @override
  String get preferencesDetail => 'Media and call preferences';

  @override
  String get avatars => 'Avatars';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files',
      one: '1 file',
      zero: 'no files',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Active';

  @override
  String get notDefined => 'Not defined';

  @override
  String get biometrics => 'Biometrics';

  @override
  String get recoveryPhrase => 'Recovery phrase';

  @override
  String get identity => 'Identity (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol keys';

  @override
  String get authTokens => 'Authentication tokens';

  @override
  String get contactNamesCache => 'Contact names cache';

  @override
  String get remoteConfig => 'Remote config';

  @override
  String get notificationPrefs => 'Notification preferences';

  @override
  String get serverData => 'Server data';

  @override
  String get serverDataInfo =>
      'Hash keeps minimal data on the server, all encrypted or temporary.';

  @override
  String get serverProfile => 'Profile';

  @override
  String get serverProfileDetail => 'Hash ID, public keys, mailbox token';

  @override
  String get serverPrekeys => 'Pre-keys';

  @override
  String get serverPrekeysDetail => 'One-time Signal keys (consumed)';

  @override
  String get serverMessages => 'Messages in transit';

  @override
  String get serverMessagesDetail => 'Deleted after delivery (24h max)';

  @override
  String get serverMedia => 'Media in transit';

  @override
  String get serverMediaDetail => 'Deleted after download';

  @override
  String get serverContactRequests => 'Contact requests';

  @override
  String get serverContactRequestsDetail => 'Expire after 24h';

  @override
  String get serverRateLimits => 'Rate limits';

  @override
  String get serverRateLimitsDetail => 'Temporary anti-abuse data';

  @override
  String get privacyReassurance =>
      'Hash cannot read your messages. All data is end-to-end encrypted. Server data is automatically deleted.';

  @override
  String get pinTooSimple =>
      'This PIN is too simple. Choose a more secure code.';

  @override
  String get genericError => 'An error occurred. Please try again.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Unable to create account: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Phrase copied to clipboard';

  @override
  String get copyPhrase => 'Copy phrase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Write down this phrase in a safe place. If you lose your PIN without this phrase, you will permanently lose access to your data.';

  @override
  String get noMessages => 'No messages';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Delete all messages with $name?';
  }

  @override
  String get confirmation => 'Confirmation';

  @override
  String get untitled => 'Untitled';

  @override
  String get noSessions => 'No sessions';

  @override
  String get unknownContact => 'Unknown contact';

  @override
  String get unnamed => 'Unnamed';

  @override
  String get noPendingRequestsAlt => 'No pending requests';

  @override
  String get deleteAllCallHistory => 'Delete all call history?';

  @override
  String get noCalls => 'No calls';

  @override
  String get noPreferences => 'No preferences';

  @override
  String get resetAllMediaPrefs => 'Reset all media preferences?';

  @override
  String get deleteThisAvatar => 'Delete this avatar?';

  @override
  String get deleteAllAvatars => 'Delete all avatars?';

  @override
  String get noAvatars => 'No avatars';

  @override
  String get deleteThisFile => 'Delete this file?';

  @override
  String get deleteAllMediaFiles => 'Delete all media?';

  @override
  String get noMediaFiles => 'No media';

  @override
  String get outgoing => 'Outgoing';

  @override
  String get incoming => 'Incoming';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Ephemeral view: ${seconds}s';
  }

  @override
  String get normalView => 'Normal view';

  @override
  String get callReasonCompleted => 'Completed';

  @override
  String get callReasonMissed => 'Missed';

  @override
  String get callReasonDeclined => 'Declined';

  @override
  String get callReasonFailed => 'Failed';

  @override
  String get justNow => 'Just now';

  @override
  String timeAgoMinutes(int count) {
    return '$count min ago';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}h ago';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}d ago';
  }

  @override
  String get messageTypeContact => 'Contact';

  @override
  String get messageTypeLocation => 'Location';

  @override
  String get statusQueued => 'Queued';

  @override
  String get blockedBadge => 'Blocked';

  @override
  String get protectedBadge => 'Protected';

  @override
  String messageCount(int count) {
    return '$count message(s)';
  }

  @override
  String get deleteQuestion => 'Delete?';

  @override
  String get transferMyAccountTitle => 'Transfer my account';

  @override
  String get loadingError => '로딩 오류';

  @override
  String get transferToNewDevice => '새 기기로 이전';

  @override
  String get transferInstructions => '새 기기에서 \"계정 복원\"을 선택하고 이 정보를 입력하세요:';

  @override
  String get yourHashIdLabel => '내 Hash ID';

  @override
  String get enterYourPinCode => 'PIN 코드 입력';

  @override
  String get pinOwnerConfirmation =>
      'To confirm that you are the owner of this account';

  @override
  String get scanThisQrCode => 'Scan this QR code';

  @override
  String get withYourNewDevice => 'With your new device';

  @override
  String get orEnterTheCode => 'or enter the code';

  @override
  String get transferCodeLabel => 'Transfer code';

  @override
  String get proximityVerification => 'Proximity verification';

  @override
  String get bringDevicesCloser => 'Bring both devices closer';

  @override
  String get confirmTransferQuestion => 'Confirm the transfer?';

  @override
  String get accountWillBeTransferred =>
      'Your account will be transferred to the new device.\n\nThis device will be permanently disconnected.';

  @override
  String get transferComplete => 'Transfer complete';

  @override
  String get transferSuccessMessage =>
      'Your account has been transferred successfully.\n\nThis application will now close.';

  @override
  String get manualVerification => 'Manual verification';

  @override
  String get codeDisplayedOnBothDevices => 'Code displayed on both devices:';

  @override
  String get doesCodeMatchNewDevice =>
      'Does this code match the one on the new device?';

  @override
  String get verifiedStatus => 'Verified';

  @override
  String get inProgressStatus => 'In progress...';

  @override
  String get notAvailableStatus => 'Not available';

  @override
  String get codeExpiredRestart => 'The code has expired. Please restart.';

  @override
  String get codesDoNotMatchCancelled =>
      'The codes do not match. Transfer cancelled.';

  @override
  String transferToDevice(String device) {
    return 'To: $device';
  }

  @override
  String get copiedExclamation => 'Copied!';

  @override
  String expiresInTime(String time) {
    return 'Expires in $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrics is not available on this device';

  @override
  String get biometricAuthError => 'Error during biometric authentication';

  @override
  String get authenticateForBiometric =>
      'Please authenticate to enable biometrics';

  @override
  String get biometricAuthFailed => 'Biometric authentication failed';

  @override
  String get forceUpdateTitle => '업데이트 필요';

  @override
  String get forceUpdateMessage => '이 버전은 더 이상 지원되지 않습니다. 업데이트하세요.';

  @override
  String get updateButton => 'Update';

  @override
  String get maintenanceInProgress => 'Maintenance in progress';

  @override
  String get tryAgainLater => 'Please try again later';

  @override
  String get information => 'Information';

  @override
  String get later => '나중에';

  @override
  String get doYouLikeHash => 'Hash가 마음에 드시나요?';

  @override
  String get yourFeedbackHelps => '여러분의 의견이 앱 개선에 도움이 됩니다';

  @override
  String get ratingTerrible => '최악';

  @override
  String get ratingBad => '나쁨';

  @override
  String get ratingOk => '보통';

  @override
  String get ratingGood => '좋음';

  @override
  String get ratingExcellent => '훌륭함!';

  @override
  String get donationMessage => 'Hash는 비영리 프로젝트입니다. 여러분의 지원이 도움이 됩니다.';

  @override
  String get recentConnections => '최근 연결';

  @override
  String get loginInfoText => '각 PIN 잠금 해제는 로컬에서 기록됩니다. 본인만 볼 수 있습니다.';

  @override
  String get connectionCount => '연결 수';

  @override
  String get periodLabel => '기간';

  @override
  String get historyLabel => '기록';

  @override
  String get noLoginRecorded => 'No login recorded';

  @override
  String get nextUnlocksAppearHere => 'Next unlocks will appear here.';

  @override
  String get dataLocalOnly => '이 데이터는 기기에만 저장되며 공유되지 않습니다.';

  @override
  String get currentSession => '현재';

  @override
  String get todayLabel => '오늘';

  @override
  String get yesterdayLabel => '어제';

  @override
  String get justNowLabel => '방금';

  @override
  String minutesAgoLabel(int count) {
    return '$count분 전';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours시간 전';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours시간 $minutes분 전';
  }

  @override
  String get noMaintenancePlanned => 'No maintenance planned';

  @override
  String get everythingWorkingNormally => 'Everything is working normally';

  @override
  String get maintenanceTitle => '유지 관리';

  @override
  String get maintenanceActiveLabel => '진행 중';

  @override
  String get maintenancePlannedLabel => '예정됨';

  @override
  String get locking => '잠금 중...';

  @override
  String get newMessageNotification => '새 메시지';

  @override
  String get secExplainTitle => 'Hash의 보호 방법';

  @override
  String get secExplainIntro =>
      'Hash is designed so that nobody can read your messages.';

  @override
  String get secExplainIntroSub =>
      'Not even us.\nHere\'s how it works, explained simply.';

  @override
  String get secJourneyLabel => 'THE JOURNEY';

  @override
  String get secJourneyTitle => 'The journey of your message';

  @override
  String get secJourneySubtitle =>
      'From your finger to your contact\'s screen, every step is protected. Follow the path.';

  @override
  String get secStep1Title => '메시지 작성';

  @override
  String get secStep1Desc => '앱에서 \"안녕하세요!\"를 입력합니다. 메시지가 휴대폰 메모리에만 존재합니다.';

  @override
  String get secStep2Title => '즉각적인 암호화';

  @override
  String get secStep2Desc => '\"보내기\"를 누르면 메시지가 알 수 없는 문자열로 변환됩니다.';

  @override
  String get secStep3Title => '익명 전송';

  @override
  String get secStep3Desc => '암호화된 데이터가 서버로 전송됩니다. 서버는 누가 보내는지 알 수 없습니다.';

  @override
  String get secStep4Title => '블라인드 서버';

  @override
  String get secStep4Desc =>
      '서버는 눈먼 우편 배달부 역할을 합니다. 누군가가 우편함에 무언가를 넣었다는 것만 압니다.';

  @override
  String get secStep4Highlight =>
      'No metadata stored: no IP address, no timestamp, no link between sender and recipient.';

  @override
  String get secStep5Title => '수신자 복호화';

  @override
  String get secStep5Desc => '연락처의 휴대폰이 내용을 로컬에서 복호화합니다. 서버는 내용을 볼 수 없습니다.';

  @override
  String get secStep6Title => '자동 삭제';

  @override
  String get secStep6Desc => '읽힌 후 메시지는 서버에서 자동으로 삭제됩니다. 어떤 흔적도 남지 않습니다.';

  @override
  String get secStep7Title => 'Local expiration';

  @override
  String get secStep7Desc =>
      'On your contact\'s phone, the message self-destructs according to the duration you chose: immediately after reading, 5 minutes, 1 hour... you decide.';

  @override
  String get secJourneyConclusion =>
      'Result: zero trace on the server, zero trace on devices. The message existed only long enough to be read, then it disappeared.';

  @override
  String get secArchLabel => 'ARCHITECTURE';

  @override
  String get secArchTitle => '5 layers of protection';

  @override
  String get secArchSubtitle =>
      'Hash doesn\'t rely on a single technology. Each layer reinforces the others. Even if one layer is compromised, your data remains safe.';

  @override
  String get secLayer1Title => 'End-to-end encryption';

  @override
  String get secLayer1Desc =>
      'Each message is encrypted with a unique key. In simple terms: even if someone decrypts one message, they won\'t be able to decrypt the next one. Each message has its own lock.';

  @override
  String get secLayer1Detail =>
      'For files (photos, videos, documents), Hash uses additional AES-256-GCM encryption. The file is encrypted before it leaves your phone.';

  @override
  String get secLayer2Title => 'Sealed Sender (network anonymity)';

  @override
  String get secLayer2Desc =>
      'Regular messengers send your messages with your identity attached. It\'s like writing your name on the envelope. Hash uses anonymous mailboxes: the server delivers the message without knowing who sent it.';

  @override
  String get secLayer2Detail =>
      'Result: even in case of a server data breach, it\'s impossible to reconstruct who talks to whom.';

  @override
  String get secLayer3Title => 'Automatic deletion';

  @override
  String get secLayer3Desc =>
      'Messages are deleted from the server as soon as receipt is confirmed. Even if a message is never retrieved, it\'s automatically destroyed after 24 hours.';

  @override
  String get secLayer3Detail =>
      'On your phone, messages self-destruct according to the duration you choose: immediately, 5 min, 15 min, 30 min, 1h, 3h, 6h, or 12h.';

  @override
  String get secLayer4Title => 'Local access protection';

  @override
  String get secLayer4Desc =>
      'The app is protected by a 6-digit PIN and/or biometrics (Face ID, fingerprint). After too many failed attempts, the app locks with an increasing delay after each failure.';

  @override
  String get secLayer5Title => 'Locked database';

  @override
  String get secLayer5Desc =>
      'On the server side, no user can write directly to the database. All actions go through secure functions that verify each request.';

  @override
  String get secLayer5Detail =>
      'It\'s like a bank counter: you never touch the vault yourself. You make a request, and the system checks that you have the right before acting.';

  @override
  String get secVashLabel => 'UNIQUE IN THE WORLD';

  @override
  String get secVashTitle => 'Vash Mode';

  @override
  String get secVashSubtitle =>
      'An emergency security system that doesn\'t exist in any other messaging app.';

  @override
  String get secVashScenarioTitle => 'Imagine this situation';

  @override
  String get secVashScenario1 => 'Someone accesses your phone';

  @override
  String get secVashScenario2 => 'You\'re asked for your PIN code';

  @override
  String get secVashScenario3 => 'You want to erase all your data urgently';

  @override
  String get secVashSolutionTitle => 'The solution: two PIN codes';

  @override
  String get secVashSolutionDesc =>
      'You configure two different PIN codes in Hash:';

  @override
  String get secVashNormalCodeLabel => 'Normal code';

  @override
  String get secVashNormalCodeDesc =>
      'Opens the app normally with all your data';

  @override
  String get secVashCodeLabel2 => 'Vash code';

  @override
  String get secVashCodeDescription =>
      'Opens the app normally... but all your data is silently deleted in the background';

  @override
  String get secVashWhatHappensTitle => 'What happens next';

  @override
  String get secVashWhatHappensDesc =>
      'The app opens normally. No alert, no suspicious animation. The screen simply shows an empty app, as if you just installed it.\n\nIn reality, all your conversations, contacts, and messages have been irreversibly deleted in a fraction of a second.';

  @override
  String get secCallsLabel => 'CALLS & FILES';

  @override
  String get secCallsTitle => 'Everything is encrypted';

  @override
  String get secCallsSubtitle =>
      'It\'s not just messages. Absolutely everything that goes through Hash is end-to-end encrypted.';

  @override
  String get secAudioCallTitle => 'Audio calls';

  @override
  String get secAudioCallDesc =>
      'End-to-end encrypted via WebRTC. Voice is transmitted directly between devices.';

  @override
  String get secVideoCallTitle => 'Video calls';

  @override
  String get secVideoCallDesc =>
      'Same technology, each stream encrypted individually.';

  @override
  String get secPhotosTitle => 'Photos & videos';

  @override
  String get secPhotosDesc =>
      'Encrypted in AES-256-GCM before leaving your phone.';

  @override
  String get secDocsTitle => 'Documents';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, any file. Name, size, and content encrypted.';

  @override
  String get secAnonLabel => 'ANONYMITY';

  @override
  String get secAnonTitle => 'No identity required';

  @override
  String get secAnonSubtitle =>
      'Hash never asks for your phone number or email. You are identified by a unique and anonymous Hash ID.';

  @override
  String get secHashIdTitle => 'Your Hash ID';

  @override
  String get secHashIdDesc =>
      'This is your unique identifier. It reveals nothing about you: not your name, not your number, not your location. It\'s like a pseudonym impossible to link to your real identity.\n\nTo add a contact, you share your Hash ID or scan a QR code. That\'s it. No synchronized address book, no \"People you may know\" suggestions.';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => '수집되는 데이터';

  @override
  String get secDataSubtitle => 'Hash는 최소한의 데이터만 수집합니다';

  @override
  String get secNeverCollected => '절대 수집하지 않음';

  @override
  String get secNeverItem1 => '전화번호 또는 이메일';

  @override
  String get secNeverItem2 => '실명';

  @override
  String get secNeverItem3 => '위치 정보';

  @override
  String get secNeverItem4 => '연락처 목록';

  @override
  String get secNeverItem5 => '메시지 내용';

  @override
  String get secNeverItem6 => '사용 통계';

  @override
  String get secNeverItem7 => '광고 식별자';

  @override
  String get secNeverItem8 => '기기 정보';

  @override
  String get secNeverItem9 => 'IP 주소';

  @override
  String get secNeverItem10 => '생체 인식 데이터';

  @override
  String get secTempStored => '임시 저장';

  @override
  String get secTempItem1 => 'Hash ID (익명 식별자)';

  @override
  String get secTempItem2 => '암호화된 메시지 (전달 확인까지)';

  @override
  String get secTempItem3 => '공개 암호화 키';

  @override
  String get secTempNote => '모든 임시 데이터는 전달 확인 후 삭제됩니다';

  @override
  String get secFooterTitle => '완전한 개인정보 보호';

  @override
  String get secFooterDesc => 'Hash는 개인정보를 판매하거나 공유하지 않습니다. 절대로.';

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
