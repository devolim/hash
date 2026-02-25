// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'ਕੋਈ ਨਿਸ਼ਾਨ ਨਹੀਂ। ਕੋਈ ਸਮਝੌਤਾ ਨਹੀਂ।';

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
  String get conversations => 'ਗੱਲਬਾਤ';

  @override
  String get contacts => 'ਸੰਪਰਕ';

  @override
  String get noConversation => 'ਕੋਈ ਗੱਲਬਾਤ ਨਹੀਂ';

  @override
  String get noConversationSubtitle =>
      'ਸੁਰੱਖਿਅਤ ਗੱਲਬਾਤ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਸੰਪਰਕ ਜੋੜੋ';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਬੇਨਤੀਆਂ ਲੰਬਿਤ',
      one: '1 ਬੇਨਤੀ ਲੰਬਿਤ',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਭੇਜੀਆਂ ਬੇਨਤੀਆਂ ਲੰਬਿਤ',
      one: '1 ਭੇਜੀ ਬੇਨਤੀ ਲੰਬਿਤ',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'ਸੰਪਰਕ ਜੋੜੋ';

  @override
  String get shareApp => 'ਐਪ ਸਾਂਝੀ ਕਰੋ';

  @override
  String get newMessage => 'ਨਵਾਂ ਸੁਨੇਹਾ';

  @override
  String get newConversation => 'ਸੁਨੇਹਾ ਭੇਜੋ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get myHashId => 'ਮੇਰੀ Hash ID';

  @override
  String get supportHash => 'Hash ਦੀ ਮਦਦ ਕਰੋ';

  @override
  String get supportHashSubtitle => 'Hash ਦੇ ਵਿਕਾਸ ਵਿੱਚ ਯੋਗਦਾਨ ਪਾਓ';

  @override
  String get donate => 'ਦਾਨ ਕਰੋ';

  @override
  String get appearance => 'ਦਿੱਖ';

  @override
  String get theme => 'ਥੀਮ';

  @override
  String get themeAuto => 'ਆਟੋ';

  @override
  String get themeAutoSubtitle => 'Follows system settings';

  @override
  String get themeDark => 'ਹਨੇਰਾ';

  @override
  String get themeLight => 'ਚਾਨਣਾ';

  @override
  String get themeRecommendation =>
      'Dark theme is recommended for better privacy';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get languageAuto => 'ਆਟੋ (ਸਿਸਟਮ)';

  @override
  String get notifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get messages => 'Messages';

  @override
  String get calls => 'Calls';

  @override
  String get vibration => 'Vibration';

  @override
  String get notificationContent => 'ਸੂਚਨਾ ਸਮੱਗਰੀ';

  @override
  String get notificationContentFull => 'ਪੂਰੀ';

  @override
  String get notificationContentFullDesc => 'ਭੇਜਣ ਵਾਲੇ ਦਾ ਨਾਮ ਅਤੇ ਸੁਨੇਹਾ ਦਿਖਾਓ';

  @override
  String get notificationContentName => 'ਸਿਰਫ਼ ਨਾਮ';

  @override
  String get notificationContentNameDesc => 'ਸਿਰਫ਼ ਸੰਪਰਕ ਦਾ ਨਾਮ ਦਿਖਾਓ';

  @override
  String get notificationContentDiscrete => 'ਸੰਖੇਪ';

  @override
  String get notificationContentDiscreteDesc => 'ਸਿਰਫ਼ \"ਨਵਾਂ ਸੁਨੇਹਾ\" ਦਿਖਾਓ';

  @override
  String get security => 'ਸੁਰੱਖਿਆ';

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
  String get pinCode => 'PIN ਕੋਡ';

  @override
  String get changePin => 'PIN ਬਦਲੋ';

  @override
  String get currentPin => 'Current PIN code';

  @override
  String get newPin => 'ਨਵਾਂ PIN';

  @override
  String get confirmPin => 'PIN ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get pinChanged => 'PIN ਬਦਲ ਦਿੱਤੀ';

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
  String get pinCodeForEntry => 'ਐਪ ਵਿੱਚ ਦਾਖਲੇ ਲਈ PIN ਕੋਡ';

  @override
  String get vashCodeSection => 'Vash Mode';

  @override
  String get biometric => 'ਬਾਇਓਮੈਟ੍ਰਿਕ';

  @override
  String get biometricUnlock => 'ਫਿੰਗਰਪ੍ਰਿੰਟ ਜਾਂ Face ID ਨਾਲ ਅਨਲੌਕ ਕਰੋ';

  @override
  String get enableBiometric => 'ਬਾਇਓਮੈਟ੍ਰਿਕ ਚਾਲੂ ਕਰੋ';

  @override
  String get biometricWarningMessage =>
      'ਬਾਇਓਮੈਟ੍ਰਿਕ ਚਾਲੂ ਕਰਨ ਨਾਲ PIN ਵਰਤੋਂਯੋਗ ਨਹੀਂ ਰਹੇਗੀ। ਕੀ ਤੁਸੀਂ ਯਕੀਨੀ ਹੋ?';

  @override
  String get understood => 'ਸਮਝਿਆ';

  @override
  String get shareAppSubtitle => 'ਆਪਣੇ ਅਜ਼ੀਜ਼ਾਂ ਨਾਲ Hash ਸਾਂਝੀ ਕਰੋ';

  @override
  String get share => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String get danger => 'Danger';

  @override
  String get deleteAccount => 'ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get deleteAccountSubtitle => 'ਸਾਰਾ ਡੇਟਾ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾਓ';

  @override
  String get deleteAccountConfirmTitle => 'Delete my account';

  @override
  String get deleteAccountConfirmMessage =>
      'Your account will be permanently deleted. This action is irreversible.\n\n• All your chats\n• All your contacts\n• Your Hash ID\n\nYou will need to create a new account.';

  @override
  String get deleteForever => 'Delete permanently';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

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
  String get securityInfo => 'ਸੁਰੱਖਿਆ ਜਾਣਕਾਰੀ';

  @override
  String version(String version) {
    return 'ਵਰਜ਼ਨ';
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
  String get getStarted => 'ਸ਼ੁਰੂ ਕਰੋ';

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
  String get transferAccount => 'ਖਾਤਾ ਟ੍ਰਾਂਸਫਰ ਕਰੋ';

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
  String get generateNewCode => 'ਨਵਾਂ ਕੋਡ ਬਣਾਓ';

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
  String get addContactTitle => 'ਸੰਪਰਕ ਜੋੜੋ';

  @override
  String get addContactByHashId => 'Enter your contact\'s Hash ID';

  @override
  String get hashIdHint => 'Hash ID ਦਾਖਲ ਕਰੋ';

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
  String get codeExpired => 'ਕੋਡ ਦੀ ਮਿਆਦ ਖਤਮ ਹੋ ਗਈ';

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
  String get deleteContact => 'ਸੰਪਰਕ ਮਿਟਾਓ';

  @override
  String deleteContactConfirm(Object name) {
    return 'ਕੀ ਤੁਸੀਂ $name ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
  }

  @override
  String get deleteContactMessage => 'ਇਸ ਸੰਪਰਕ ਦੇ ਸਾਰੇ ਸੁਨੇਹੇ ਮਿਟ ਜਾਣਗੇ';

  @override
  String get delete => 'ਮਿਟਾਓ';

  @override
  String get typeMessage => 'ਸੁਨੇਹਾ ਟਾਈਪ ਕਰੋ...';

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
  String get error => 'ਗਲਤੀ';

  @override
  String get ok => 'ਠੀਕ ਹੈ';

  @override
  String get view => 'View';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get save => 'ਸੇਵ ਕਰੋ';

  @override
  String get edit => 'ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String get confirm => 'ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get loading => 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'ਲੰਬਿਤ ਬੇਨਤੀਆਂ';

  @override
  String get noPendingRequests => 'ਕੋਈ ਲੰਬਿਤ ਬੇਨਤੀ ਨਹੀਂ';

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
  String get acceptRequest => 'ਸਵੀਕਾਰ ਕਰੋ';

  @override
  String get rejectRequest => 'Reject';

  @override
  String get requestAccepted => 'ਬੇਨਤੀ ਸਵੀਕਾਰ ਕੀਤੀ';

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
  String get sentRequests => 'ਭੇਜੀਆਂ ਬੇਨਤੀਆਂ';

  @override
  String get noSentRequests => 'ਕੋਈ ਭੇਜੀ ਬੇਨਤੀ ਨਹੀਂ';

  @override
  String get cancelRequest => 'ਰੱਦ ਕਰੋ';

  @override
  String get deleteRequest => 'Delete request';

  @override
  String get requestCancelled => 'ਬੇਨਤੀ ਰੱਦ ਕੀਤੀ';

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
  String get copy => 'ਕਾਪੀ ਕਰੋ';

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
  String get ephemeral30Seconds => '30 ਸਕਿੰਟ';

  @override
  String get ephemeral30SecondsDesc => 'ਪੜ੍ਹਨ ਤੋਂ 30 ਸਕਿੰਟ ਬਾਅਦ ਮਿਟਾਇਆ';

  @override
  String get ephemeral5Minutes => '5 ਮਿੰਟ';

  @override
  String get ephemeral5MinutesDesc => 'ਪੜ੍ਹਨ ਤੋਂ 5 ਮਿੰਟ ਬਾਅਦ ਮਿਟਾਇਆ';

  @override
  String get ephemeral1Hour => '1 ਘੰਟਾ';

  @override
  String get ephemeral1HourDesc => 'ਪੜ੍ਹਨ ਤੋਂ 1 ਘੰਟੇ ਬਾਅਦ ਮਿਟਾਇਆ';

  @override
  String get ephemeral3Hours => '3 hours';

  @override
  String get ephemeral6Hours => '6 ਘੰਟੇ';

  @override
  String get ephemeral6HoursDesc => 'ਪੜ੍ਹਨ ਤੋਂ 6 ਘੰਟੇ ਬਾਅਦ ਮਿਟਾਇਆ';

  @override
  String get ephemeral12Hours => '12 hours';

  @override
  String get ephemeral24Hours => '24 ਘੰਟੇ';

  @override
  String get ephemeral24HoursDesc => 'ਪੜ੍ਹਨ ਤੋਂ 24 ਘੰਟੇ ਬਾਅਦ ਮਿਟਾਇਆ';

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
  String get showCallsInRecents => 'ਤਾਜ਼ੀਆਂ ਕਾਲਾਂ ਵਿੱਚ ਦਿਖਾਓ';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash ਕਾਲਾਂ ਫੋਨ ਇਤਿਹਾਸ ਵਿੱਚ ਦਿਖਦੀਆਂ ਹਨ';

  @override
  String get feedback => 'ਫੀਡਬੈਕ';

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
  String get reportSpam => 'ਸਪੈਮ ਰਿਪੋਰਟ';

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
  String get blockContact => 'ਸੰਪਰਕ ਬਲੌਕ ਕਰੋ';

  @override
  String get blockContactDescription =>
      'This contact will no longer be able to send you messages or call you. They won\'t be notified.';

  @override
  String get unblockContact => 'ਬਲੌਕ ਹਟਾਓ';

  @override
  String get unblockContactDescription =>
      'This contact will be able to send you messages and call you again.';

  @override
  String get contactBlocked => 'ਸੰਪਰਕ ਬਲੌਕ ਕੀਤਾ';

  @override
  String get contactUnblocked => 'ਬਲੌਕ ਹਟਾਇਆ';

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
  String get takePhoto => 'ਫੋਟੋ ਖਿੱਚੋ';

  @override
  String get chooseFromGallery => 'ਗੈਲਰੀ ਤੋਂ ਚੁਣੋ';

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
  String get privacyPolicy => 'ਗੋਪਨੀਯਤਾ ਨੀਤੀ';

  @override
  String get termsOfService => 'ਸੇਵਾ ਦੀਆਂ ਸ਼ਰਤਾਂ';

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
  String get support => 'ਸਹਾਇਤਾ';

  @override
  String get contactSupport => 'ਸਹਾਇਤਾ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'ਰਿਪੋਰਟ ਕਰੋ';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'ਕਾਨੂੰਨੀ';

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
  String get callPaused => 'ਰੁਕਿਆ ਹੋਇਆ';

  @override
  String get callPausedSubtitle => 'ਕਾਲ ਅਜੇ ਵੀ ਜਾਰੀ ਹੈ';

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
  String get loadingError => 'ਲੋਡਿੰਗ ਗਲਤੀ';

  @override
  String get transferToNewDevice => 'ਨਵੇਂ ਡਿਵਾਈਸ ਵਿੱਚ ਟ੍ਰਾਂਸਫਰ ਕਰੋ';

  @override
  String get transferInstructions =>
      'ਨਵੇਂ ਡਿਵਾਈਸ \'ਤੇ \"ਖਾਤਾ ਬਹਾਲ ਕਰੋ\" ਚੁਣੋ ਅਤੇ ਇਹ ਜਾਣਕਾਰੀ ਦਰਜ ਕਰੋ:';

  @override
  String get yourHashIdLabel => 'ਤੁਹਾਡੀ Hash ID';

  @override
  String get enterYourPinCode => 'ਆਪਣਾ PIN ਕੋਡ ਦਾਖਲ ਕਰੋ';

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
  String get forceUpdateTitle => 'ਅੱਪਡੇਟ ਲੋੜੀਂਦੀ';

  @override
  String get forceUpdateMessage =>
      'ਇਹ ਵਰਜ਼ਨ ਹੁਣ ਸਮਰਥਿਤ ਨਹੀਂ। ਜਾਰੀ ਰੱਖਣ ਲਈ ਅੱਪਡੇਟ ਕਰੋ।';

  @override
  String get updateButton => 'Update';

  @override
  String get maintenanceInProgress => 'Maintenance in progress';

  @override
  String get tryAgainLater => 'Please try again later';

  @override
  String get information => 'Information';

  @override
  String get later => 'ਬਾਅਦ ਵਿੱਚ';

  @override
  String get doYouLikeHash => 'ਕੀ ਤੁਹਾਨੂੰ Hash ਪਸੰਦ ਹੈ?';

  @override
  String get yourFeedbackHelps =>
      'ਤੁਹਾਡੀ ਰਾਏ ਸਾਨੂੰ ਐਪ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ';

  @override
  String get ratingTerrible => 'ਬਹੁਤ ਮਾੜਾ';

  @override
  String get ratingBad => 'ਮਾੜਾ';

  @override
  String get ratingOk => 'ਠੀਕ';

  @override
  String get ratingGood => 'ਚੰਗਾ';

  @override
  String get ratingExcellent => 'ਸ਼ਾਨਦਾਰ!';

  @override
  String get donationMessage =>
      'Hash ਇੱਕ ਗੈਰ-ਲਾਭਕਾਰੀ ਪ੍ਰੋਜੈਕਟ ਹੈ। ਤੁਹਾਡਾ ਸਮਰਥਨ ਮਦਦਗਾਰ ਹੈ।';

  @override
  String get recentConnections => 'ਹਾਲੀਆ ਕੁਨੈਕਸ਼ਨ';

  @override
  String get loginInfoText =>
      'ਹਰ PIN ਅਨਲੌਕ ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਰਿਕਾਰਡ ਹੁੰਦਾ ਹੈ। ਸਿਰਫ਼ ਤੁਸੀਂ ਦੇਖ ਸਕਦੇ ਹੋ।';

  @override
  String get connectionCount => 'ਕੁਨੈਕਸ਼ਨ ਗਿਣਤੀ';

  @override
  String get periodLabel => 'ਸਮਾਂ-ਕਾਲ';

  @override
  String get historyLabel => 'ਇਤਿਹਾਸ';

  @override
  String get noLoginRecorded => 'No login recorded';

  @override
  String get nextUnlocksAppearHere => 'Next unlocks will appear here.';

  @override
  String get dataLocalOnly =>
      'ਇਹ ਡੇਟਾ ਸਿਰਫ਼ ਤੁਹਾਡੇ ਡਿਵਾਈਸ \'ਤੇ ਸੁਰੱਖਿਅਤ ਹੈ ਅਤੇ ਸਾਂਝਾ ਨਹੀਂ ਕੀਤਾ ਜਾਂਦਾ।';

  @override
  String get currentSession => 'ਮੌਜੂਦਾ';

  @override
  String get todayLabel => 'ਅੱਜ';

  @override
  String get yesterdayLabel => 'ਕੱਲ੍ਹ';

  @override
  String get justNowLabel => 'ਹੁਣੇ';

  @override
  String minutesAgoLabel(int count) {
    return '$count ਮਿੰਟ ਪਹਿਲਾਂ';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours ਘੰਟੇ ਪਹਿਲਾਂ';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours ਘੰਟੇ $minutes ਮਿੰਟ ਪਹਿਲਾਂ';
  }

  @override
  String get noMaintenancePlanned => 'No maintenance planned';

  @override
  String get everythingWorkingNormally => 'Everything is working normally';

  @override
  String get maintenanceTitle => 'ਰੱਖ-ਰਖਾਅ';

  @override
  String get maintenanceActiveLabel => 'ਚੱਲ ਰਿਹਾ ਹੈ';

  @override
  String get maintenancePlannedLabel => 'ਯੋਜਨਾਬੱਧ';

  @override
  String get locking => 'ਲੌਕ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get newMessageNotification => 'ਨਵਾਂ ਸੁਨੇਹਾ';

  @override
  String get secExplainTitle => 'Hash ਕਿਵੇਂ ਸੁਰੱਖਿਅਤ ਕਰਦਾ ਹੈ';

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
  String get secStep1Title => 'ਸੁਨੇਹਾ ਲਿਖੋ';

  @override
  String get secStep1Desc =>
      'ਤੁਸੀਂ ਐਪ ਵਿੱਚ ਕੁਝ ਟਾਈਪ ਕਰਦੇ ਹੋ। ਇਸ ਵੇਲੇ ਸੁਨੇਹਾ ਸਿਰਫ਼ ਤੁਹਾਡੇ ਫੋਨ ਦੀ ਮੈਮੋਰੀ ਵਿੱਚ ਹੈ।';

  @override
  String get secStep2Title => 'ਤੁਰੰਤ ਏਨਕ੍ਰਿਪਸ਼ਨ';

  @override
  String get secStep2Desc =>
      'ਭੇਜਣ \'ਤੇ ਸੁਨੇਹਾ Signal ਪ੍ਰੋਟੋਕੋਲ ਦੁਆਰਾ ਅਣਪਛਾਣੇ ਅੱਖਰਾਂ ਵਿੱਚ ਬਦਲ ਜਾਂਦਾ ਹੈ।';

  @override
  String get secStep3Title => 'ਗੁਮਨਾਮ ਟ੍ਰਾਂਸਮਿਸ਼ਨ';

  @override
  String get secStep3Desc =>
      'ਏਨਕ੍ਰਿਪਟਡ ਡੇਟਾ ਸਰਵਰ ਨੂੰ ਭੇਜਿਆ ਜਾਂਦਾ ਹੈ। ਸਰਵਰ ਨਹੀਂ ਜਾਣਦਾ ਕੌਣ ਭੇਜ ਰਿਹਾ ਹੈ।';

  @override
  String get secStep4Title => 'ਅੰਨ੍ਹਾ ਸਰਵਰ';

  @override
  String get secStep4Desc =>
      'ਸਰਵਰ ਅੰਨ੍ਹੇ ਡਾਕੀਏ ਵਾਂਗੂ ਕੰਮ ਕਰਦਾ ਹੈ। ਉਹ ਸਿਰਫ਼ ਜਾਣਦਾ ਹੈ ਕਿ ਕਿਸੇ ਨੇ ਕੁਝ ਡੱਬੇ ਵਿੱਚ ਪਾਇਆ।';

  @override
  String get secStep4Highlight =>
      'No metadata stored: no IP address, no timestamp, no link between sender and recipient.';

  @override
  String get secStep5Title => 'ਪ੍ਰਾਪਤਕਰਤਾ ਡੀਕ੍ਰਿਪਟ ਕਰਦਾ ਹੈ';

  @override
  String get secStep5Desc =>
      'ਪ੍ਰਾਪਤਕਰਤਾ ਦਾ ਫੋਨ ਸਮੱਗਰੀ ਲੈ ਕੇ ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਡੀਕ੍ਰਿਪਟ ਕਰਦਾ ਹੈ।';

  @override
  String get secStep6Title => 'ਆਟੋਮੈਟਿਕ ਮਿਟਾਉਣਾ';

  @override
  String get secStep6Desc =>
      'ਪੜ੍ਹਨ ਤੋਂ ਬਾਅਦ ਸੁਨੇਹਾ ਸਰਵਰ ਤੋਂ ਆਪਣੇ ਆਪ ਮਿਟ ਜਾਂਦਾ ਹੈ।';

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
  String get secDataTitle => 'ਇਕੱਠਾ ਕੀਤਾ ਡੇਟਾ';

  @override
  String get secDataSubtitle => 'Hash ਘੱਟੋ-ਘੱਟ ਡੇਟਾ ਇਕੱਠਾ ਕਰਦਾ ਹੈ';

  @override
  String get secNeverCollected => 'ਕਦੇ ਇਕੱਠਾ ਨਹੀਂ ਕੀਤਾ';

  @override
  String get secNeverItem1 => 'ਫੋਨ ਨੰਬਰ ਜਾਂ ਈਮੇਲ';

  @override
  String get secNeverItem2 => 'ਅਸਲੀ ਨਾਮ';

  @override
  String get secNeverItem3 => 'ਸਥਾਨ ਡੇਟਾ';

  @override
  String get secNeverItem4 => 'ਸੰਪਰਕ ਸੂਚੀ';

  @override
  String get secNeverItem5 => 'ਸੁਨੇਹੇ ਦੀ ਸਮੱਗਰੀ';

  @override
  String get secNeverItem6 => 'ਵਰਤੋਂ ਅੰਕੜੇ';

  @override
  String get secNeverItem7 => 'ਇਸ਼ਤਿਹਾਰ ID';

  @override
  String get secNeverItem8 => 'ਡਿਵਾਈਸ ਜਾਣਕਾਰੀ';

  @override
  String get secNeverItem9 => 'IP ਪਤਾ';

  @override
  String get secNeverItem10 => 'ਬਾਇਓਮੈਟ੍ਰਿਕ ਡੇਟਾ';

  @override
  String get secTempStored => 'ਅਸਥਾਈ ਤੌਰ \'ਤੇ ਸੁਰੱਖਿਅਤ';

  @override
  String get secTempItem1 => 'Hash ID (ਗੁਮਨਾਮ ID)';

  @override
  String get secTempItem2 => 'ਏਨਕ੍ਰਿਪਟਡ ਸੁਨੇਹੇ (ਡਿਲੀਵਰੀ ਤੱਕ)';

  @override
  String get secTempItem3 => 'ਪਬਲਿਕ ਏਨਕ੍ਰਿਪਸ਼ਨ ਕੁੰਜੀਆਂ';

  @override
  String get secTempNote => 'ਸਾਰਾ ਅਸਥਾਈ ਡੇਟਾ ਡਿਲੀਵਰੀ ਤੋਂ ਬਾਅਦ ਮਿਟ ਜਾਂਦਾ ਹੈ';

  @override
  String get secFooterTitle => 'ਪੂਰੀ ਗੋਪਨੀਯਤਾ';

  @override
  String get secFooterDesc =>
      'Hash ਕਦੇ ਤੁਹਾਡਾ ਨਿੱਜੀ ਡੇਟਾ ਵੇਚਦਾ ਜਾਂ ਸਾਂਝਾ ਨਹੀਂ ਕਰਦਾ।';

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
