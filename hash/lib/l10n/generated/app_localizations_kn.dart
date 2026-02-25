// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'ಯಾವುದೇ ಕುರುಹಿಲ್ಲ. ರಾಜಿ ಇಲ್ಲ.';

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
  String get conversations => 'ಚಾಟ್‌ಗಳು';

  @override
  String get contacts => 'ಸಂಪರ್ಕಗಳು';

  @override
  String get noConversation => 'ಯಾವುದೇ ಚಾಟ್ ಇಲ್ಲ';

  @override
  String get noConversationSubtitle =>
      'ಸುರಕ್ಷಿತ ಚಾಟ್ ಪ್ರಾರಂಭಿಸಲು ಸಂಪರ್ಕ ಸೇರಿಸಿ';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಬಾಕಿ ವಿನಂತಿಗಳು',
      one: '1 ಬಾಕಿ ವಿನಂತಿ',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಕಳಿಸಿದ ವಿನಂತಿಗಳು ಬಾಕಿ',
      one: '1 ಕಳಿಸಿದ ವಿನಂತಿ ಬಾಕಿ',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'ಸಂಪರ್ಕ ಸೇರಿಸಿ';

  @override
  String get shareApp => 'ಅಪ್ಲಿಕೇಶನ್ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get newMessage => 'ಹೊಸ ಸಂದೇಶ';

  @override
  String get newConversation => 'ಸಂದೇಶ ಕಳಿಸಿ';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get myHashId => 'ನನ್ನ Hash ID';

  @override
  String get supportHash => 'Hash ಬೆಂಬಲಿಸಿ';

  @override
  String get supportHashSubtitle => 'Hash ಅಭಿವೃದ್ಧಿಗೆ ಸಹಾಯ ಮಾಡಿ';

  @override
  String get donate => 'ದೇಣಿಗೆ ನೀಡಿ';

  @override
  String get appearance => 'ನೋಟ';

  @override
  String get theme => 'ಥೀಮ್';

  @override
  String get themeAuto => 'ಸ್ವಯಂ';

  @override
  String get themeAutoSubtitle => 'Follows system settings';

  @override
  String get themeDark => 'ಕತ್ತಲೆ';

  @override
  String get themeLight => 'ಬೆಳಕು';

  @override
  String get themeRecommendation =>
      'Dark theme is recommended for better privacy';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get languageAuto => 'ಸ್ವಯಂ (ಸಿಸ್ಟಂ)';

  @override
  String get notifications => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get messages => 'Messages';

  @override
  String get calls => 'Calls';

  @override
  String get vibration => 'Vibration';

  @override
  String get notificationContent => 'ಅಧಿಸೂಚನೆ ವಿಷಯ';

  @override
  String get notificationContentFull => 'ಪೂರ್ಣ';

  @override
  String get notificationContentFullDesc => 'ಕಳಿಸುವವರ ಹೆಸರು ಮತ್ತು ಸಂದೇಶ ತೋರಿಸಿ';

  @override
  String get notificationContentName => 'ಹೆಸರು ಮಾತ್ರ';

  @override
  String get notificationContentNameDesc => 'ಸಂಪರ್ಕದ ಹೆಸರು ಮಾತ್ರ ತೋರಿಸಿ';

  @override
  String get notificationContentDiscrete => 'ಸಂಕ್ಷಿಪ್ತ';

  @override
  String get notificationContentDiscreteDesc => '\"ಹೊಸ ಸಂದೇಶ\" ಮಾತ್ರ ತೋರಿಸಿ';

  @override
  String get security => 'ಭದ್ರತೆ';

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
  String get pinCode => 'PIN ಕೋಡ್';

  @override
  String get changePin => 'PIN ಬದಲಿಸಿ';

  @override
  String get currentPin => 'Current PIN code';

  @override
  String get newPin => 'ಹೊಸ PIN';

  @override
  String get confirmPin => 'PIN ದೃಢೀಕರಿಸಿ';

  @override
  String get pinChanged => 'PIN ಬದಲಾಯಿಸಲಾಗಿದೆ';

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
  String get pinCodeForEntry => 'ಅಪ್ಲಿಕೇಶನ್ ಪ್ರವೇಶಕ್ಕಾಗಿ PIN ಕೋಡ್';

  @override
  String get vashCodeSection => 'Vash Mode';

  @override
  String get biometric => 'ಬಯೋಮೆಟ್ರಿಕ್';

  @override
  String get biometricUnlock => 'ಬೆರಳಚ್ಚು ಅಥವಾ Face ID ಮೂಲಕ ಅನ್‌ಲಾಕ್';

  @override
  String get enableBiometric => 'ಬಯೋಮೆಟ್ರಿಕ್ ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get biometricWarningMessage =>
      'ಬಯೋಮೆಟ್ರಿಕ್ ಸಕ್ರಿಯಗೊಳಿಸಿದರೆ PIN ಬಳಸಲಾಗುವುದಿಲ್ಲ. ಖಚಿತವಾಗಿ?';

  @override
  String get understood => 'ಅರ್ಥವಾಯಿತು';

  @override
  String get shareAppSubtitle => 'ನಿಮ್ಮ ಪ್ರಿಯಜನರೊಂದಿಗೆ Hash ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get share => 'ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get danger => 'Danger';

  @override
  String get deleteAccount => 'ಖಾತೆ ಅಳಿಸಿ';

  @override
  String get deleteAccountSubtitle => 'ಎಲ್ಲಾ ಡೇಟಾ ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಿ';

  @override
  String get deleteAccountConfirmTitle => 'Delete my account';

  @override
  String get deleteAccountConfirmMessage =>
      'Your account will be permanently deleted. This action is irreversible.\n\n• All your chats\n• All your contacts\n• Your Hash ID\n\nYou will need to create a new account.';

  @override
  String get deleteForever => 'Delete permanently';

  @override
  String get cancel => 'ರದ್ದು';

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
  String get securityInfo => 'ಭದ್ರತಾ ಮಾಹಿತಿ';

  @override
  String version(String version) {
    return 'ಆವೃತ್ತಿ';
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
  String get getStarted => 'ಪ್ರಾರಂಭಿಸಿ';

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
  String get transferAccount => 'ಖಾತೆ ವರ್ಗಾಯಿಸಿ';

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
  String get generateNewCode => 'ಹೊಸ ಕೋಡ್ ರಚಿಸಿ';

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
  String get addContactTitle => 'ಸಂಪರ್ಕ ಸೇರಿಸಿ';

  @override
  String get addContactByHashId => 'Enter your contact\'s Hash ID';

  @override
  String get hashIdHint => 'Hash ID ನಮೂದಿಸಿ';

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
  String get codeExpired => 'ಕೋಡ್ ಅವಧಿ ಮೀರಿದೆ';

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
  String get deleteContact => 'ಸಂಪರ್ಕ ಅಳಿಸಿ';

  @override
  String deleteContactConfirm(Object name) {
    return '$name ಅಳಿಸಲು ಬಯಸುತ್ತೀರಾ?';
  }

  @override
  String get deleteContactMessage =>
      'ಈ ಸಂಪರ್ಕದೊಂದಿಗಿನ ಎಲ್ಲಾ ಸಂದೇಶಗಳು ಅಳಿಯಲ್ಪಡುತ್ತವೆ';

  @override
  String get delete => 'ಅಳಿಸಿ';

  @override
  String get typeMessage => 'ಸಂದೇಶ ಟೈಪ್ ಮಾಡಿ...';

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
  String get error => 'ದೋಷ';

  @override
  String get ok => 'ಸರಿ';

  @override
  String get view => 'View';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get save => 'ಉಳಿಸಿ';

  @override
  String get edit => 'ಸಂಪಾದಿಸಿ';

  @override
  String get close => 'ಮುಚ್ಚಿ';

  @override
  String get confirm => 'ದೃಢೀಕರಿಸಿ';

  @override
  String get loading => 'ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get retry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'ಬಾಕಿ ವಿನಂತಿಗಳು';

  @override
  String get noPendingRequests => 'ಬಾಕಿ ವಿನಂತಿಗಳಿಲ್ಲ';

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
  String get acceptRequest => 'ಸ್ವೀಕರಿಸಿ';

  @override
  String get rejectRequest => 'Reject';

  @override
  String get requestAccepted => 'ವಿನಂತಿ ಸ್ವೀಕರಿಸಲಾಗಿದೆ';

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
  String get sentRequests => 'ಕಳಿಸಿದ ವಿನಂತಿಗಳು';

  @override
  String get noSentRequests => 'ಕಳಿಸಿದ ವಿನಂತಿಗಳಿಲ್ಲ';

  @override
  String get cancelRequest => 'ರದ್ದು';

  @override
  String get deleteRequest => 'Delete request';

  @override
  String get requestCancelled => 'ವಿನಂತಿ ರದ್ದು ಮಾಡಲಾಗಿದೆ';

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
  String get copy => 'ನಕಲಿಸಿ';

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
  String get ephemeral30Seconds => '30 ಸೆಕೆಂಡ್';

  @override
  String get ephemeral30SecondsDesc => 'ಓದಿದ 30 ಸೆಕೆಂಡ್ ನಂತರ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get ephemeral5Minutes => '5 ನಿಮಿಷ';

  @override
  String get ephemeral5MinutesDesc => 'ಓದಿದ 5 ನಿಮಿಷ ನಂತರ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get ephemeral1Hour => '1 ಗಂಟೆ';

  @override
  String get ephemeral1HourDesc => 'ಓದಿದ 1 ಗಂಟೆ ನಂತರ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get ephemeral3Hours => '3 hours';

  @override
  String get ephemeral6Hours => '6 ಗಂಟೆ';

  @override
  String get ephemeral6HoursDesc => 'ಓದಿದ 6 ಗಂಟೆ ನಂತರ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get ephemeral12Hours => '12 hours';

  @override
  String get ephemeral24Hours => '24 ಗಂಟೆ';

  @override
  String get ephemeral24HoursDesc => 'ಓದಿದ 24 ಗಂಟೆ ನಂತರ ಅಳಿಸಲಾಗಿದೆ';

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
  String get showCallsInRecents => 'ಇತ್ತೀಚಿನ ಕರೆಗಳಲ್ಲಿ ತೋರಿಸಿ';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash ಕರೆಗಳು ಫೋನ್ ಇತಿಹಾಸದಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ';

  @override
  String get feedback => 'ಪ್ರತಿಕ್ರಿಯೆ';

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
  String get reportSpam => 'ಸ್ಪ್ಯಾಮ್ ವರದಿ';

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
  String get blockContact => 'ಸಂಪರ್ಕ ನಿರ್ಬಂಧಿಸಿ';

  @override
  String get blockContactDescription =>
      'This contact will no longer be able to send you messages or call you. They won\'t be notified.';

  @override
  String get unblockContact => 'ನಿರ್ಬಂಧ ತೆಗೆದು';

  @override
  String get unblockContactDescription =>
      'This contact will be able to send you messages and call you again.';

  @override
  String get contactBlocked => 'ಸಂಪರ್ಕ ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String get contactUnblocked => 'ನಿರ್ಬಂಧ ತೆಗೆದುಹಾಕಲಾಗಿದೆ';

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
  String get takePhoto => 'ಫೋಟೋ ತೆಗೆಯಿರಿ';

  @override
  String get chooseFromGallery => 'ಗ್ಯಾಲರಿಯಿಂದ ಆರಿಸಿ';

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
  String get privacyPolicy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get termsOfService => 'ಸೇವಾ ನಿಯಮಗಳು';

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
  String get support => 'ಬೆಂಬಲ';

  @override
  String get contactSupport => 'ಬೆಂಬಲ ತಂಡವನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'ವರದಿ ಮಾಡಿ';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'ಕಾನೂನು';

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
  String get callPaused => 'ವಿರಾಮ';

  @override
  String get callPausedSubtitle => 'ಕರೆ ಇನ್ನೂ ಸಕ್ರಿಯವಾಗಿದೆ';

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
  String get loadingError => 'ಲೋಡಿಂಗ್ ದೋಷ';

  @override
  String get transferToNewDevice => 'ಹೊಸ ಸಾಧನಕ್ಕೆ ವರ್ಗಾಯಿಸಿ';

  @override
  String get transferInstructions =>
      'ಹೊಸ ಸಾಧನದಲ್ಲಿ \"ಖಾತೆ ಮರುಸ್ಥಾಪಿಸಿ\" ಆಯ್ಕೆಮಾಡಿ ಮತ್ತು ಈ ಮಾಹಿತಿ ನಮೂದಿಸಿ:';

  @override
  String get yourHashIdLabel => 'ನಿಮ್ಮ Hash ID';

  @override
  String get enterYourPinCode => 'PIN ಕೋಡ್ ನಮೂದಿಸಿ';

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
  String get forceUpdateTitle => 'ಅಪ್‌ಡೇಟ್ ಅಗತ್ಯ';

  @override
  String get forceUpdateMessage =>
      'ಈ ಆವೃತ್ತಿ ಇನ್ನು ಬೆಂಬಲಿಸಲ್ಪಡುವುದಿಲ್ಲ. ಮುಂದುವರಿಸಲು ಅಪ್‌ಡೇಟ್ ಮಾಡಿ.';

  @override
  String get updateButton => 'Update';

  @override
  String get maintenanceInProgress => 'Maintenance in progress';

  @override
  String get tryAgainLater => 'Please try again later';

  @override
  String get information => 'Information';

  @override
  String get later => 'ನಂತರ';

  @override
  String get doYouLikeHash => 'Hash ನಿಮಗೆ ಇಷ್ಟವಾಗುತ್ತದೆಯೇ?';

  @override
  String get yourFeedbackHelps =>
      'ನಿಮ್ಮ ಅಭಿಪ್ರಾಯ ಅಪ್ಲಿಕೇಶನ್ ಸುಧಾರಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ';

  @override
  String get ratingTerrible => 'ಭಯಾನಕ';

  @override
  String get ratingBad => 'ಕೆಟ್ಟ';

  @override
  String get ratingOk => 'ಸರಿ';

  @override
  String get ratingGood => 'ಒಳ್ಳೆಯ';

  @override
  String get ratingExcellent => 'ಅದ್ಭುತ!';

  @override
  String get donationMessage =>
      'Hash ಒಂದು ಲಾಭರಹಿತ ಯೋಜನೆ. ನಿಮ್ಮ ಬೆಂಬಲ ಸಹಾಯ ಮಾಡುತ್ತದೆ.';

  @override
  String get recentConnections => 'ಇತ್ತೀಚಿನ ಸಂಪರ್ಕಗಳು';

  @override
  String get loginInfoText =>
      'ಪ್ರತಿ PIN ಅನ್‌ಲಾಕ್ ಸ್ಥಳೀಯವಾಗಿ ದಾಖಲಿಸಲಾಗುತ್ತದೆ. ನೀವು ಮಾತ್ರ ನೋಡಬಹುದು.';

  @override
  String get connectionCount => 'ಸಂಪರ್ಕ ಸಂಖ್ಯೆ';

  @override
  String get periodLabel => 'ಅವಧಿ';

  @override
  String get historyLabel => 'ಇತಿಹಾಸ';

  @override
  String get noLoginRecorded => 'No login recorded';

  @override
  String get nextUnlocksAppearHere => 'Next unlocks will appear here.';

  @override
  String get dataLocalOnly =>
      'ಈ ಡೇಟಾ ನಿಮ್ಮ ಸಾಧನದಲ್ಲಿ ಮಾತ್ರ ಸಂಗ್ರಹಿಸಲಾಗುತ್ತದೆ ಮತ್ತು ಹಂಚಿಕೊಳ್ಳಲ್ಲ.';

  @override
  String get currentSession => 'ಪ್ರಸ್ತುತ';

  @override
  String get todayLabel => 'ಇಂದು';

  @override
  String get yesterdayLabel => 'ನಿನ್ನೆ';

  @override
  String get justNowLabel => 'ಈಗಷ್ಟೇ';

  @override
  String minutesAgoLabel(int count) {
    return '$count ನಿಮಿಷ ಹಿಂದೆ';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours ಗಂಟೆ ಹಿಂದೆ';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours ಗಂಟೆ $minutes ನಿಮಿಷ ಹಿಂದೆ';
  }

  @override
  String get noMaintenancePlanned => 'No maintenance planned';

  @override
  String get everythingWorkingNormally => 'Everything is working normally';

  @override
  String get maintenanceTitle => 'ನಿರ್ವಹಣೆ';

  @override
  String get maintenanceActiveLabel => 'ಸಕ್ರಿಯ';

  @override
  String get maintenancePlannedLabel => 'ಯೋಜಿಸಲಾಗಿದೆ';

  @override
  String get locking => 'ಲಾಕ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get newMessageNotification => 'ಹೊಸ ಸಂದೇಶ';

  @override
  String get secExplainTitle => 'Hash ಹೇಗೆ ನಿಮ್ಮನ್ನು ರಕ್ಷಿಸುತ್ತದೆ';

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
  String get secStep1Title => 'ಸಂದೇಶ ಬರೆಯಿರಿ';

  @override
  String get secStep1Desc =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಟೈಪ್ ಮಾಡಿ. ಈ ಕ್ಷಣದಲ್ಲಿ ಸಂದೇಶ ನಿಮ್ಮ ಫೋನ್ ಮೆಮೊರಿಯಲ್ಲಿ ಮಾತ್ರ ಇದೆ.';

  @override
  String get secStep2Title => 'ತ್ವರಿತ ಎನ್‌ಕ್ರಿಪ್ಶನ್';

  @override
  String get secStep2Desc =>
      'ಕಳಿಸಿದಾಗ Signal ಪ್ರೋಟೋಕಾಲ್ ಸಂದೇಶವನ್ನು ಅಕ್ಷರಗಳ ಸಮೂಹಕ್ಕೆ ಪರಿವರ್ತಿಸುತ್ತದೆ.';

  @override
  String get secStep3Title => 'ಅನಾಮಧೇಯ ಪ್ರಸರಣ';

  @override
  String get secStep3Desc =>
      'ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಿದ ಡೇಟಾ ಸರ್ವರ್‌ಗೆ ಕಳಿಸಲಾಗುತ್ತದೆ. ಸರ್ವರ್‌ಗೆ ಯಾರು ಕಳಿಸುತ್ತಿದ್ದಾರೆ ಗೊತ್ತಿಲ್ಲ.';

  @override
  String get secStep4Title => 'ಕುರುಡು ಸರ್ವರ್';

  @override
  String get secStep4Desc =>
      'ಸರ್ವರ್ ಕುರುಡು ಅಂಚೆ ಸಿಬ್ಬಂದಿಯಂತೆ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ. ಯಾರೋ ಒಬ್ಬರು ಪೆಟ್ಟಿಗೆಯಲ್ಲಿ ಏನನ್ನೋ ಇಟ್ಟಿದ್ದಾರೆ ಎಂದು ಮಾತ್ರ ಗೊತ್ತು.';

  @override
  String get secStep4Highlight =>
      'No metadata stored: no IP address, no timestamp, no link between sender and recipient.';

  @override
  String get secStep5Title => 'ಸ್ವೀಕರಿಸುವವರು ಡಿಕ್ರಿಪ್ಟ್ ಮಾಡುತ್ತಾರೆ';

  @override
  String get secStep5Desc =>
      'ಸ್ವೀಕರಿಸುವವರ ಫೋನ್ ವಿಷಯ ತೆಗೆದುಕೊಂಡು ಸ್ಥಳೀಯವಾಗಿ ಡಿಕ್ರಿಪ್ಟ್ ಮಾಡುತ್ತದೆ.';

  @override
  String get secStep6Title => 'ಸ್ವಯಂಚಾಲಿತ ಅಳಿಸುವಿಕೆ';

  @override
  String get secStep6Desc =>
      'ಓದಿದ ನಂತರ ಸಂದೇಶ ಸರ್ವರ್‌ನಿಂದ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಅಳಿಯಲ್ಪಡುತ್ತದೆ.';

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
  String get secDataTitle => 'ಸಂಗ್ರಹಿಸಿದ ಡೇಟಾ';

  @override
  String get secDataSubtitle => 'Hash ಕನಿಷ್ಠ ಡೇಟಾ ಸಂಗ್ರಹಿಸುತ್ತದೆ';

  @override
  String get secNeverCollected => 'ಎಂದಿಗೂ ಸಂಗ್ರಹಿಸಲ್ಲ';

  @override
  String get secNeverItem1 => 'ಫೋನ್ ಸಂಖ್ಯೆ ಅಥವಾ ಇಮೇಲ್';

  @override
  String get secNeverItem2 => 'ನಿಜ ಹೆಸರು';

  @override
  String get secNeverItem3 => 'ಸ್ಥಳ ಡೇಟಾ';

  @override
  String get secNeverItem4 => 'ಸಂಪರ್ಕ ಪಟ್ಟಿ';

  @override
  String get secNeverItem5 => 'ಸಂದೇಶ ವಿಷಯ';

  @override
  String get secNeverItem6 => 'ಬಳಕೆ ಅಂಕಿಅಂಶ';

  @override
  String get secNeverItem7 => 'ಜಾಹೀರಾತು ID';

  @override
  String get secNeverItem8 => 'ಸಾಧನ ಮಾಹಿತಿ';

  @override
  String get secNeverItem9 => 'IP ವಿಳಾಸ';

  @override
  String get secNeverItem10 => 'ಬಯೋಮೆಟ್ರಿಕ್ ಡೇಟಾ';

  @override
  String get secTempStored => 'ತಾತ್ಕಾಲಿಕವಾಗಿ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ';

  @override
  String get secTempItem1 => 'Hash ID (ಅನಾಮಧೇಯ ID)';

  @override
  String get secTempItem2 => 'ಎನ್‌ಕ್ರಿಪ್ಟ್ ಸಂದೇಶಗಳು (ಡೆಲಿವರಿ ವರೆಗೆ)';

  @override
  String get secTempItem3 => 'ಸಾರ್ವಜನಿಕ ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಕೀಲಿಗಳು';

  @override
  String get secTempNote => 'ಎಲ್ಲಾ ತಾತ್ಕಾಲಿಕ ಡೇಟಾ ಡೆಲಿವರಿ ನಂತರ ಅಳಿಯಲ್ಪಡುತ್ತದೆ';

  @override
  String get secFooterTitle => 'ಸಂಪೂರ್ಣ ಗೌಪ್ಯತೆ';

  @override
  String get secFooterDesc => 'Hash ನಿಮ್ಮ ಖಾಸಗಿ ಡೇಟಾ ಎಂದಿಗೂ ಮಾರಾಟ ಮಾಡಲ್ಲ.';

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
