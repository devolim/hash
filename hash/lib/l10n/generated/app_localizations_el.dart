// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Kανένα ίχνος. Κανένας συμβιβασμός.';

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
  String get conversations => 'Συνομιλίες';

  @override
  String get contacts => 'Επαφές';

  @override
  String get noConversation => 'Καμία συνομιλία';

  @override
  String get noConversationSubtitle =>
      'Προσθέστε μια επαφή για να ξεκινήσετε μια ασφαλή συνομιλία';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εκκρεμή αιτήματα',
      one: '1 εκκρεμές αίτημα',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εκκρεμή απεσταλμένα αιτήματα',
      one: '1 εκκρεμές απεσταλμένο αίτημα',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Προσθήκη επαφής';

  @override
  String get shareApp => 'Κοινοποίηση εφαρμογής';

  @override
  String get newMessage => 'Νέο μήνυμα';

  @override
  String get newConversation => 'Αποστολή μηνύματος';

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get myHashId => 'Το Hash ID μου';

  @override
  String get supportHash => 'Υποστήριξη Hash';

  @override
  String get supportHashSubtitle => 'Το Hash είναι ένα μη κερδοσκοπικό έργο';

  @override
  String get donate => 'Δωρεά';

  @override
  String get appearance => 'Εμφάνιση';

  @override
  String get theme => 'Θέμα';

  @override
  String get themeAuto => 'Αυτόματο';

  @override
  String get themeAutoSubtitle => 'Ακολουθεί τις ρυθμίσεις συστήματος';

  @override
  String get themeDark => 'Σκοτεινό';

  @override
  String get themeLight => 'Φωτεινό';

  @override
  String get themeRecommendation =>
      'Το σκοτεινό θέμα συνιστάται για καλύτερη ιδιωτικότητα';

  @override
  String get language => 'Γλώσσα';

  @override
  String get languageAuto => 'Αυτόματο (σύστημα)';

  @override
  String get notifications => 'Ειδοποιήσεις';

  @override
  String get messages => 'Μηνύματα';

  @override
  String get calls => 'Κλήσεις';

  @override
  String get vibration => 'Δόνηση';

  @override
  String get notificationContent => 'Περιεχόμενο ειδοποιήσεων';

  @override
  String get notificationContentFull => 'Εμφάνιση όλων';

  @override
  String get notificationContentFullDesc =>
      'Όνομα επαφής και προεπισκόπηση μηνύματος';

  @override
  String get notificationContentName => 'Μόνο όνομα';

  @override
  String get notificationContentNameDesc =>
      'Εμφανίζει μόνο το όνομα της επαφής';

  @override
  String get notificationContentDiscrete => 'Διακριτικό';

  @override
  String get notificationContentDiscreteDesc => 'Εμφανίζει μόνο \"Νέο μήνυμα\"';

  @override
  String get security => 'Ασφάλεια';

  @override
  String get howHashProtectsYou => 'Πώς σε προστατεύει το Hash';

  @override
  String get howHashProtectsYouSubtitle => 'Κατανοήστε την ασφάλειά σας';

  @override
  String get accountSecurity => 'Ασφάλεια λογαριασμού';

  @override
  String get accountSecuritySubtitle => 'PIN, βιομετρικά, Vash Mode';

  @override
  String get blockScreenshots => 'Αποκλεισμός στιγμιότυπων';

  @override
  String get transferDevice => 'Μεταφορά σε άλλη συσκευή';

  @override
  String get transferDeviceSubtitle => 'Μεταφέρετε τον λογαριασμό σας';

  @override
  String get pinCode => 'Κωδικός PIN';

  @override
  String get changePin => 'Αλλαγή κωδικού PIN';

  @override
  String get currentPin => 'Τρέχων κωδικός PIN';

  @override
  String get newPin => 'Νέος κωδικός PIN';

  @override
  String get confirmPin => 'Επιβεβαίωση κωδικού PIN';

  @override
  String get pinChanged => 'Ο κωδικός PIN άλλαξε';

  @override
  String get incorrectPin => 'Λανθασμένος κωδικός PIN';

  @override
  String get pinsDoNotMatch => 'Οι κωδικοί PIN δεν ταιριάζουν';

  @override
  String get autoLock => 'Αυτόματο κλείδωμα';

  @override
  String get autoLockDelay => 'Καθυστέρηση κλειδώματος';

  @override
  String get autoLockImmediate => 'Άμεσο';

  @override
  String get autoLockMinute => '1 λεπτό';

  @override
  String autoLockMinutes(int count) {
    return '$count λεπτά';
  }

  @override
  String get vashCode => 'Κωδικός Vash';

  @override
  String get vashModeTitle => 'Λειτουργία Vash';

  @override
  String get vashModeExplanation => 'Το απόλυτο δίχτυ ασφαλείας σας.';

  @override
  String get vashModeDescription =>
      'Θα επιλέξετε ένα δεύτερο κωδικό PIN. Αν ποτέ αναγκαστείτε να ανοίξετε το Hash, εισάγετε αυτόν τον κωδικό αντί για τον κανονικό σας PIN.\n\nΗ εφαρμογή θα ανοίξει κανονικά, αλλά όλες οι συνομιλίες και οι επαφές σας θα έχουν εξαφανιστεί.\n\nΣε οποιονδήποτε κοιτάζει την οθόνη σας, το Hash φαίνεται απλά άδειο — σαν να μην το χρησιμοποιήσατε ποτέ.';

  @override
  String get vashModeIrreversible =>
      'Αυτή η ενέργεια είναι σιωπηλή και μη αναστρέψιμη.';

  @override
  String get chooseVashCode => 'Επιλογή κωδικού Vash';

  @override
  String get vashCodeInfo =>
      'Ένας δεύτερος κωδικός PIN που ανοίγει κανονικά την εφαρμογή, αλλά άδεια.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Αν εισάγετε αυτόν τον κωδικό αντί για το PIN σας:';

  @override
  String get vashDeleteContacts => 'Οι επαφές σας εξαφανίζονται';

  @override
  String get vashDeleteMessages => 'Οι συνομιλίες σας εξαφανίζονται';

  @override
  String get vashDeleteHistory => 'Οι σημειώσεις σας εξαφανίζονται';

  @override
  String get vashKeepId =>
      'Η ταυτότητά σας Hash (#XXX-XXX-XXX) παραμένει η ίδια';

  @override
  String get vashAppearNormal =>
      'Η εφαρμογή φαίνεται κανονική αλλά άδεια, σαν καινούρια. Αυτή η ενέργεια είναι μη αναστρέψιμη.';

  @override
  String get setupVashCode => 'Ρύθμιση κωδικού Vash';

  @override
  String get modifyVashCode => 'Τροποποίηση κωδικού Vash';

  @override
  String get currentVashCode => 'Τρέχων κωδικός Vash';

  @override
  String get newVashCode => 'Νέος κωδικός Vash';

  @override
  String get confirmVashCode => 'Επιβεβαίωση κωδικού Vash';

  @override
  String get vashCodeConfigured => 'Ο κωδικός Vash ρυθμίστηκε';

  @override
  String get vashCodeModified => 'Ο κωδικός Vash τροποποιήθηκε';

  @override
  String get vashCodeMustDiffer =>
      'Ο κωδικός Vash πρέπει να διαφέρει από το PIN';

  @override
  String get incorrectVashCode => 'Λανθασμένος κωδικός Vash';

  @override
  String get vashWhatToDelete => 'Τι πρέπει να εξαφανίσει η λειτουργία Vash;';

  @override
  String get vashDeleteContactsOption => 'Επαφές';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Μηνύματα';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Σημειώσεις';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Η λειτουργία Vash ενεργοποιήθηκε';

  @override
  String get vashCreateSubtitle =>
      'Επιλέξτε έναν κωδικό διαφορετικό από τον κύριο PIN σας';

  @override
  String get vashConfirmSubtitle => 'Επιβεβαιώστε τον κωδικό Vash σας';

  @override
  String get pinCodeForEntry => 'Κωδικός PIN για είσοδο στην εφαρμογή';

  @override
  String get vashCodeSection => 'Λειτουργία Vash';

  @override
  String get biometric => 'Βιομετρικά';

  @override
  String get biometricUnlock => 'Ξεκλείδωμα με δαχτυλικό αποτύπωμα ή Face ID';

  @override
  String get enableBiometric => 'Ενεργοποίηση βιομετρικών';

  @override
  String get biometricWarningMessage =>
      'Ενεργοποιώντας τα βιομετρικά, δεν θα μπορείτε να χρησιμοποιήσετε τον κωδικό Vash για να μπείτε στην εφαρμογή.\n\nΘα μπορείτε να χρησιμοποιήσετε τον κωδικό Vash μόνο αν τα βιομετρικά αποτύχουν (μετά από αρκετές αποτυχημένες προσπάθειες).\n\nΕίστε σίγουροι ότι θέλετε να συνεχίσετε;';

  @override
  String get understood => 'Κατάλαβα';

  @override
  String get shareAppSubtitle => 'Μοιραστείτε το Hash με τους κοντινούς σας';

  @override
  String get share => 'Κοινοποίηση';

  @override
  String get danger => 'Κίνδυνος';

  @override
  String get deleteAccount => 'Διαγραφή λογαριασμού';

  @override
  String get deleteAccountSubtitle => 'Μη αναστρέψιμη ενέργεια';

  @override
  String get deleteAccountConfirmTitle => 'Διαγραφή λογαριασμού';

  @override
  String get deleteAccountConfirmMessage =>
      'Ο λογαριασμός σας θα διαγραφεί οριστικά. Αυτή η ενέργεια είναι μη αναστρέψιμη.\n\n- Όλες οι συνομιλίες σας\n- Όλες οι επαφές σας\n- Το Hash ID σας\n\nΘα χρειαστεί να δημιουργήσετε νέο λογαριασμό.';

  @override
  String get deleteForever => 'Οριστική διαγραφή';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Η λειτουργία Vash ενεργοποιήθηκε.';

  @override
  String deletionError(String error) {
    return 'Σφάλμα διαγραφής: $error';
  }

  @override
  String get yourSecurity => 'Η ασφάλειά σας';

  @override
  String get securityInfo =>
      '- Κρυπτογράφηση από άκρο σε άκρο (Signal Protocol)\n- Κανένα δεδομένο στους διακομιστές μας μετά την παράδοση\n- Κλειδιά αποθηκευμένα μόνο στη συσκευή σας\n- Ο κωδικός PIN δεν αποστέλλεται ποτέ στον διακομιστή';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Καλώς ήρθατε';

  @override
  String get securityStatement1 => 'Τα μηνύματά σας είναι προστατευμένα.';

  @override
  String get securityStatement2 => 'Κρυπτογράφηση από άκρο σε άκρο.';

  @override
  String get securityStatement3 => 'Κανένα ίχνος. Κανένας συμβιβασμός.';

  @override
  String get securityStatement4 => 'Η ιδιωτικότητά σας είναι δικαίωμα.';

  @override
  String get accessBlocked => 'Η πρόσβαση αποκλείστηκε';

  @override
  String get tooManyAttempts => 'Πολλές αποτυχημένες προσπάθειες';

  @override
  String get pleaseWait => 'Παρακαλώ περιμένετε';

  @override
  String get waitDelay => 'Παρακαλώ περιμένετε να λήξει η καθυστέρηση';

  @override
  String attemptCount(int current, int max) {
    return 'Προσπάθεια $current από $max';
  }

  @override
  String retryIn(String time) {
    return 'Επανάληψη σε $time';
  }

  @override
  String get forgotPin => 'Ξεχάσατε το PIN; Χρησιμοποιήστε τη φράση ανάκτησης';

  @override
  String get useRecoveryPhrase => 'Χρήση φράσης ανάκτησης';

  @override
  String get recoveryWarningTitle => 'Προειδοποίηση';

  @override
  String get recoveryWarningMessage => 'Η ανάκτηση λογαριασμού θα:';

  @override
  String get recoveryDeleteAllMessages => 'Διαγράψει ΟΛΑ τα μηνύματά σας';

  @override
  String get recoveryWaitDelay => 'Απαιτήσει καθυστέρηση 1 ώρας';

  @override
  String get recoveryKeepContacts => 'Διατηρήσει τις επαφές σας';

  @override
  String get recoveryIrreversible =>
      'Αυτή η ενέργεια είναι μη αναστρέψιμη. Τα μηνύματά σας θα χαθούν μόνιμα.';

  @override
  String get iUnderstand => 'Κατανοώ';

  @override
  String get accountRecovery => 'Ανάκτηση λογαριασμού';

  @override
  String get enterRecoveryPhrase =>
      'Εισάγετε τις 24 λέξεις της φράσης ανάκτησής σας, χωρισμένες με κενά.';

  @override
  String get recoveryPhraseHint => 'λέξη1 λέξη2 λέξη3 ...';

  @override
  String get recover => 'Ανάκτηση';

  @override
  String get recoveryPhraseRequired => 'Παρακαλώ εισάγετε τη φράση ανάκτησης';

  @override
  String get recoveryPhrase24Words =>
      'Η φράση πρέπει να περιέχει ακριβώς 24 λέξεις';

  @override
  String get incorrectRecoveryPhrase => 'Λανθασμένη φράση ανάκτησης';

  @override
  String get recoveryInitError => 'Σφάλμα κατά την αρχικοποίηση ανάκτησης';

  @override
  String get securityDelay => 'Καθυστέρηση ασφαλείας';

  @override
  String get securityDelayMessage =>
      'Για την ασφάλειά σας, απαιτείται περίοδος αναμονής πριν δημιουργήσετε νέο PIN.';

  @override
  String get timeRemaining => 'Υπολειπόμενος χρόνος';

  @override
  String get messagesDeletedForProtection =>
      'Τα μηνύματά σας διαγράφηκαν για την προστασία σας.';

  @override
  String get canCloseApp =>
      'Μπορείτε να κλείσετε την εφαρμογή και να επιστρέψετε αργότερα.';

  @override
  String get onboardingTitle1 => 'Καλώς ήρθατε στο Hash';

  @override
  String get onboardingSubtitle1 => 'Ο messenger που δεν αφήνει ίχνη';

  @override
  String get onboardingTitle2 => 'Πλήρης κρυπτογράφηση';

  @override
  String get onboardingSubtitle2 =>
      'Τα μηνύματά σας κρυπτογραφούνται από άκρο σε άκρο με Signal Protocol';

  @override
  String get onboardingTitle3 => 'Κανένα ίχνος';

  @override
  String get onboardingSubtitle3 =>
      'Τα μηνύματα διαγράφονται από τους διακομιστές κατά την παράδοση';

  @override
  String get onboardingTitle4 => 'Η ασφάλειά σας';

  @override
  String get onboardingSubtitle4 =>
      'Κωδικός PIN, λειτουργία Vash και φράση ανάκτησης';

  @override
  String get getStarted => 'Ξεκινήστε';

  @override
  String get next => 'Επόμενο';

  @override
  String get skip => 'Παράλειψη';

  @override
  String get alreadyHaveAccount => 'Έχω ήδη λογαριασμό';

  @override
  String get transferMyAccount => 'Μεταφορά του λογαριασμού μου';

  @override
  String get createPin => 'Δημιουργία κωδικού PIN';

  @override
  String get createPinSubtitle =>
      'Αυτός ο κωδικός θα προστατεύει την πρόσβαση στην εφαρμογή σας';

  @override
  String get confirmYourPin => 'Επιβεβαιώστε τον κωδικό PIN σας';

  @override
  String get confirmPinSubtitle => 'Εισάγετε ξανά τον κωδικό PIN σας';

  @override
  String get saveRecoveryPhrase => 'Φράση ανάκτησης';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Σημειώστε αυτές τις 24 λέξεις με τη σειρά. Θα σας επιτρέψουν να ανακτήσετε τον λογαριασμό σας αν ξεχάσετε το PIN σας.';

  @override
  String get phraseWritten => 'Σημείωσα τη φράση μου';

  @override
  String get warningRecoveryPhrase =>
      'Αν χάσετε αυτή τη φράση και ξεχάσετε το PIN σας, θα χάσετε την πρόσβαση στον λογαριασμό σας.';

  @override
  String get accountTransferred => 'Ο λογαριασμός μεταφέρθηκε';

  @override
  String get accountTransferredMessage =>
      'Ο λογαριασμός σας μεταφέρθηκε σε άλλη συσκευή. Αυτή η συνεδρία δεν είναι πλέον έγκυρη.';

  @override
  String get accountTransferredInfo =>
      'Αν δεν ξεκινήσατε εσείς αυτή τη μεταφορά, ο λογαριασμός σας μπορεί να έχει παραβιαστεί.';

  @override
  String get logout => 'Αποσύνδεση';

  @override
  String get transferAccount => 'Μεταφορά λογαριασμού';

  @override
  String get transferAccountInfo =>
      'Μεταφέρετε τον λογαριασμό Hash σας σε νέα συσκευή. Η τρέχουσα συνεδρία σας θα ακυρωθεί.';

  @override
  String get generateTransferCode => 'Δημιουργία κωδικού μεταφοράς';

  @override
  String get transferCode => 'Κωδικός μεταφοράς';

  @override
  String transferCodeExpires(int minutes) {
    return 'Αυτός ο κωδικός λήγει σε $minutes λεπτά';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Εισάγετε αυτόν τον κωδικό στη νέα σας συσκευή για να μεταφέρετε τον λογαριασμό σας.';

  @override
  String get generateNewCode => 'Δημιουργία νέου κωδικού';

  @override
  String get scanQrCode => 'Σάρωση QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Σαρώστε το QR code μιας επαφής για να την προσθέσετε';

  @override
  String get qrCodeDetected => 'Ανιχνεύτηκε QR code';

  @override
  String get invalidQrCode => 'Μη έγκυρο QR code';

  @override
  String get cameraPermissionRequired => 'Απαιτείται άδεια κάμερας';

  @override
  String get myQrCode => 'Το QR code μου';

  @override
  String get myQrCodeSubtitle =>
      'Μοιραστείτε αυτό το QR code ώστε οι επαφές σας να σας προσθέσουν';

  @override
  String get shareQrCode => 'Κοινοποίηση';

  @override
  String get addContactTitle => 'Προσθήκη επαφής';

  @override
  String get addContactByHashId => 'Εισάγετε το Hash ID της επαφής σας';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Αναζήτηση';

  @override
  String get contactNotFound => 'Η επαφή δεν βρέθηκε';

  @override
  String get contactAlreadyAdded => 'Αυτή η επαφή είναι ήδη στη λίστα σας';

  @override
  String get contactAdded => 'Η επαφή προστέθηκε';

  @override
  String get myProfile => 'Το προφίλ μου';

  @override
  String get myProfileSubtitle =>
      'Μοιραστείτε αυτές τις πληροφορίες ώστε άλλοι να σας προσθέσουν';

  @override
  String get temporaryCode => 'Προσωρινός κωδικός';

  @override
  String temporaryCodeExpires(String time) {
    return 'Λήγει σε $time';
  }

  @override
  String get codeExpired => 'Ο κωδικός έληξε';

  @override
  String get generateNewCodeButton => 'Νέος κωδικός';

  @override
  String get copyHashId => 'Αντιγραφή ID';

  @override
  String get copyCode => 'Αντιγραφή κωδικού';

  @override
  String get copiedToClipboard => 'Αντιγράφηκε';

  @override
  String get showMyQrCode => 'Εμφάνιση του QR code μου';

  @override
  String get orDivider => 'ή';

  @override
  String get openScanner => 'Άνοιγμα σαρωτή';

  @override
  String get addManually => 'Χειροκίνητη προσθήκη';

  @override
  String get contactHashIdLabel => 'Hash ID επαφής';

  @override
  String get temporaryCodeLabel => 'Προσωρινός κωδικός';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Ζητήστε από την επαφή σας να δημιουργήσει έναν κωδικό από το προφίλ της';

  @override
  String get verifyAndAdd => 'Επαλήθευση και προσθήκη';

  @override
  String get fillAllFields => 'Παρακαλώ συμπληρώστε όλα τα πεδία';

  @override
  String get invalidHashIdFormat => 'Μη έγκυρη μορφή ID (π.χ.: 123-456-ABC)';

  @override
  String get userNotFound => 'Ο χρήστης δεν βρέθηκε';

  @override
  String get cannotAddYourself => 'Δεν μπορείτε να προσθέσετε τον εαυτό σας';

  @override
  String get invalidOrExpiredCode => 'Μη έγκυρος ή ληγμένος προσωρινός κωδικός';

  @override
  String get contactFound => 'Η επαφή βρέθηκε!';

  @override
  String get howToCallContact => 'Πώς θέλετε να τον/την αποκαλείτε;';

  @override
  String get contactNameHint => 'Όνομα επαφής';

  @override
  String get addContactButton => 'Προσθήκη';

  @override
  String get contactDetails => 'Στοιχεία επαφής';

  @override
  String get contactName => 'Όνομα επαφής';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Προστέθηκε στις $date';
  }

  @override
  String get deleteContact => 'Διαγραφή επαφής';

  @override
  String deleteContactConfirm(Object name) {
    return 'Διαγραφή αυτής της επαφής;';
  }

  @override
  String get deleteContactMessage =>
      'Αυτό θα διαγράψει επίσης ολόκληρη τη συνομιλία.';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get typeMessage => 'Πληκτρολογήστε ένα μήνυμα...';

  @override
  String get messageSent => 'Απεστάλη';

  @override
  String get messageDelivered => 'Παραδόθηκε';

  @override
  String get messageRead => 'Διαβάστηκε';

  @override
  String get messageFailed => 'Αποτυχία αποστολής';

  @override
  String get now => 'Τώρα';

  @override
  String minutesAgo(int count) {
    return '$countλ';
  }

  @override
  String hoursAgo(int count) {
    return '$countω';
  }

  @override
  String daysAgo(int count) {
    return '$countμ';
  }

  @override
  String get today => 'Σήμερα';

  @override
  String get yesterday => 'Χθες';

  @override
  String dateAtTime(String date, String time) {
    return '$date στις $time';
  }

  @override
  String get shareMessage =>
      'Ελάτε στο Hash! Είναι ένας πραγματικά ιδιωτικός messenger: πλήρης κρυπτογράφηση, κανένα ίχνος στους διακομιστές και λειτουργία πανικού αν χρειαστεί.\n\nΚατεβάστε την εφαρμογή εδώ\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Σφάλμα';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Προβολή';

  @override
  String get yes => 'Ναι';

  @override
  String get no => 'Όχι';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get edit => 'Επεξεργασία';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get confirm => 'Επιβεβαίωση';

  @override
  String get loading => 'Φόρτωση...';

  @override
  String get retry => 'Επανάληψη';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Εκκρεμή αιτήματα';

  @override
  String get noPendingRequests => 'Κανένα εκκρεμές αίτημα';

  @override
  String get pendingRequestsSubtitle =>
      'Αυτοί οι άνθρωποι θέλουν να σας προσθέσουν';

  @override
  String requestFromUser(String hashId) {
    return 'Αίτημα από $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Λήγει σε $days ημέρες';
  }

  @override
  String get acceptRequest => 'Αποδοχή';

  @override
  String get rejectRequest => 'Απόρριψη';

  @override
  String get requestAccepted => 'Το αίτημα έγινε δεκτό';

  @override
  String get requestRejected => 'Το αίτημα απορρίφθηκε';

  @override
  String get requestSent => 'Το αίτημα εστάλη!';

  @override
  String get requestSentSubtitle =>
      'Το αίτημά σας εστάλη. Ο χρήστης πρέπει να το αποδεχτεί πριν μπορέσετε να συνομιλήσετε.';

  @override
  String get requestAlreadyPending => 'Ένα αίτημα είναι ήδη σε εκκρεμότητα';

  @override
  String get requestAlreadySentByOther =>
      'Αυτό το άτομο σας έχει ήδη στείλει αίτημα';

  @override
  String get addByHashId => 'Προσθήκη μέσω Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Εισάγετε το Hash ID και τον προσωρινό κωδικό της επαφής';

  @override
  String get enterTemporaryCode => 'Εισάγετε τον 6-ψήφιο κωδικό';

  @override
  String get sendRequest => 'Αποστολή αιτήματος';

  @override
  String get acceptContactTitle => 'Αποδοχή επαφής';

  @override
  String get acceptContactSubtitle =>
      'Μπορείτε να τους δώσετε ένα προσαρμοσμένο όνομα';

  @override
  String get leaveEmptyForHashId =>
      'Αφήστε κενό για να χρησιμοποιηθεί το Hash ID';

  @override
  String get firstName => 'Όνομα';

  @override
  String get lastName => 'Επώνυμο';

  @override
  String get notes => 'Σημειώσεις';

  @override
  String get notesHint => 'Προσωπικές σημειώσεις για αυτήν την επαφή';

  @override
  String get photoOptional => 'Φωτογραφία (προαιρετικό)';

  @override
  String get contactNameOptional => 'Όνομα (προαιρετικό)';

  @override
  String get notesOptional => 'Σημειώσεις (προαιρετικό)';

  @override
  String get storedLocally => 'Αποθηκευμένο μόνο στη συσκευή σας';

  @override
  String get encryptedMessageLabel => 'Κρυπτογραφημένο μήνυμα';

  @override
  String get identityMessageHint => 'Ποιος είστε; Πώς γνωρίζεστε;';

  @override
  String get messageWillBeSentEncrypted =>
      'Αυτό το μήνυμα θα κρυπτογραφηθεί και θα σταλεί στον παραλήπτη';

  @override
  String get sendRequestButton => 'Αποστολή αιτήματος';

  @override
  String get requestExpiresIn24h =>
      'Το αίτημα λήγει σε 24ω αν δεν γίνει αποδεκτό';

  @override
  String get theyAlreadySentYouRequest =>
      'Αυτό το άτομο σας έχει ήδη στείλει αίτημα';

  @override
  String get requests => 'Αιτήματα';

  @override
  String get receivedRequests => 'Ληφθέντα';

  @override
  String get sentRequests => 'Απεσταλμένα';

  @override
  String get noSentRequests => 'Κανένα απεσταλμένο αίτημα';

  @override
  String get cancelRequest => 'Ακύρωση';

  @override
  String get deleteRequest => 'Διαγραφή αιτήματος';

  @override
  String get requestCancelled => 'Το αίτημα ακυρώθηκε';

  @override
  String sentTo(String hashId) {
    return 'Στάλθηκε σε $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Λήγει σε $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Ελήφθη πριν από $time';
  }

  @override
  String get messageFromRequester => 'Μήνυμα από τον αποστολέα';

  @override
  String get copy => 'Αντιγραφή';

  @override
  String get messageInfo => 'Πληροφορίες μηνύματος';

  @override
  String get messageDirection => 'Κατεύθυνση';

  @override
  String get messageSentByYou => 'Απεστάλη από εσάς';

  @override
  String get messageReceived => 'Ελήφθη';

  @override
  String get messageSentAt => 'Απεστάλη στις';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Κατάσταση';

  @override
  String get messageReadAt => 'Διαβάστηκε στις';

  @override
  String get messageType => 'Τύπος';

  @override
  String get messageSize => 'Μέγεθος';

  @override
  String get messageExpiresAt => 'Λήγει στις';

  @override
  String get messageEncrypted => 'Κρυπτογράφηση από άκρο σε άκρο';

  @override
  String get messageStatusSending => 'Αποστολή...';

  @override
  String get messageStatusSent => 'Απεστάλη';

  @override
  String get messageStatusDelivered => 'Παραδόθηκε';

  @override
  String get messageStatusRead => 'Διαβάστηκε';

  @override
  String get messageStatusFailed => 'Απέτυχε';

  @override
  String get serverStatus => 'Διακομιστής';

  @override
  String get onServer => 'Εκκρεμής παράδοση';

  @override
  String get deletedFromServer => 'Διαγράφηκε';

  @override
  String get messageTypeText => 'Κείμενο';

  @override
  String get messageTypeImage => 'Εικόνα';

  @override
  String get messageTypeVideo => 'Βίντεο';

  @override
  String get messageTypeVoice => 'Φωνή';

  @override
  String get messageTypeFile => 'Αρχείο';

  @override
  String get indefinitely => 'Επ\' αόριστον';

  @override
  String get hoursShort => 'ω';

  @override
  String get minutesShort => 'λ';

  @override
  String get hours => 'ώρες';

  @override
  String get minutes => 'λεπτά';

  @override
  String get seconds => 'δευτερόλεπτα';

  @override
  String get ephemeralMessages => 'Εφήμερα μηνύματα';

  @override
  String get ephemeralMessagesDescription =>
      'Τα μηνύματα διαγράφονται αυτόματα μετά από αυτό το χρονικό διάστημα';

  @override
  String get ephemeralImmediate => 'Άμεσα (μετά την ανάγνωση)';

  @override
  String get ephemeralImmediateDesc => 'Διαγράφεται αμέσως μετά την ανάγνωση';

  @override
  String get ephemeralMyPreference => 'Η προτίμησή μου';

  @override
  String get ephemeralMyPreferenceDesc => 'Χρήση γενικής ρύθμισης';

  @override
  String get ephemeralDefaultSetting => 'Διάρκεια μηνύματος';

  @override
  String get ephemeralChooseDefault => 'Συνιστώμενο';

  @override
  String get ephemeral30Seconds => '30 δευτερόλεπτα';

  @override
  String get ephemeral30SecondsDesc => 'Διαγραφή 30δ μετά την ανάγνωση';

  @override
  String get ephemeral5Minutes => '5 λεπτά';

  @override
  String get ephemeral5MinutesDesc => 'Διαγραφή 5λ μετά την ανάγνωση';

  @override
  String get ephemeral1Hour => '1 ώρα';

  @override
  String get ephemeral1HourDesc => 'Διαγραφή 1ώ μετά την ανάγνωση';

  @override
  String get ephemeral3Hours => '3 ώρες';

  @override
  String get ephemeral6Hours => '6 ώρες';

  @override
  String get ephemeral6HoursDesc => 'Διαγραφή 6ώ μετά την ανάγνωση';

  @override
  String get ephemeral12Hours => '12 ώρες';

  @override
  String get ephemeral24Hours => '24 ώρες';

  @override
  String get ephemeral24HoursDesc => 'Διαγραφή 24ώ μετά την ανάγνωση';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Προσαρμοσμένη διάρκεια';

  @override
  String get howItWorks => 'Πώς λειτουργεί';

  @override
  String get ephemeralExplanation1 =>
      'Τα μηνύματα διαγράφονται από τον διακομιστή αμέσως μόλις ληφθούν.';

  @override
  String get ephemeralExplanation2 =>
      'Αυτή η ρύθμιση καθορίζει πότε τα μηνύματα εξαφανίζονται από ΤΟ ΤΗΛΕΦΩΝΟ ΣΑΣ μετά την ανάγνωση.';

  @override
  String get ephemeralExplanation3 =>
      'Η επαφή σας έχει τη δική της ρύθμιση για το τηλέφωνό της.';

  @override
  String get mute1Hour => '1 ώρα';

  @override
  String get mute8Hours => '8 ώρες';

  @override
  String get mute1Day => '1 ημέρα';

  @override
  String get mute1Week => '1 εβδομάδα';

  @override
  String get muteAlways => 'Πάντα';

  @override
  String get muteExplanation =>
      'Δεν θα λαμβάνετε ειδοποιήσεις για αυτήν την επαφή';

  @override
  String get showCallsInRecents => 'Εμφάνιση στις πρόσφατες κλήσεις';

  @override
  String get showCallsInRecentsSubtitle =>
      'Οι κλήσεις Hash εμφανίζονται στο ιστορικό κλήσεων';

  @override
  String get feedback => 'Σχόλια';

  @override
  String get muteNotifications => 'Σίγαση ειδοποιήσεων';

  @override
  String get muteDescription =>
      'Δεν θα λαμβάνετε ειδοποιήσεις για αυτήν την επαφή';

  @override
  String mutedUntil(String time) {
    return 'Σε σίγαση μέχρι $time';
  }

  @override
  String get notMuted => 'Οι ειδοποιήσεις είναι ενεργοποιημένες';

  @override
  String get unmute => 'Κατάργηση σίγασης';

  @override
  String get notificationSound => 'Ήχος ειδοποίησης';

  @override
  String get defaultSound => 'Προεπιλογή';

  @override
  String get chatSettings => 'Ρυθμίσεις συνομιλίας';

  @override
  String get bubbleColor => 'Χρώμα φούσκας';

  @override
  String get backgroundColor => 'Χρώμα φόντου';

  @override
  String get backgroundImage => 'Εικόνα φόντου';

  @override
  String get chatBackground => 'Φόντο συνομιλίας';

  @override
  String get customColor => 'Προσαρμοσμένο';

  @override
  String get defaultColor => 'Προεπιλογή';

  @override
  String get imageSelected => 'Η εικόνα επιλέχθηκε';

  @override
  String get noImage => 'Καμία εικόνα';

  @override
  String get color => 'Χρώμα';

  @override
  String get image => 'Εικόνα';

  @override
  String get tapToSelectImage => 'Πατήστε για επιλογή εικόνας';

  @override
  String get changeImage => 'Αλλαγή εικόνας';

  @override
  String get previewMessageReceived => 'Γεια σου!';

  @override
  String get previewMessageSent => 'Γεια σας!';

  @override
  String get messageAction => 'Μήνυμα';

  @override
  String get callAction => 'Κλήση';

  @override
  String get videoAction => 'Βίντεο';

  @override
  String get personalNotes => 'Προσωπικές σημειώσεις';

  @override
  String get addNotes => 'Προσθήκη σημειώσεων...';

  @override
  String get noNotes => 'Δεν υπάρχουν σημειώσεις';

  @override
  String get messageNotifications => 'Ειδοποιήσεις μηνυμάτων';

  @override
  String get callNotifications => 'Ειδοποιήσεις κλήσεων';

  @override
  String get useGradient => 'Χρήση ντεγκραντέ';

  @override
  String get gradientStart => 'Αρχικό χρώμα';

  @override
  String get gradientEnd => 'Τελικό χρώμα';

  @override
  String get preview => 'Προεπισκόπηση';

  @override
  String get reset => 'Επαναφορά';

  @override
  String get securityNumber => 'Αριθμός ασφαλείας';

  @override
  String securityNumberDescription(String name) {
    return 'Επαληθεύστε ότι ο αριθμός ασφαλείας ταιριάζει με τη συσκευή του/της $name';
  }

  @override
  String get verifyEncryption => 'Επαλήθευση κρυπτογράφησης από άκρο σε άκρο';

  @override
  String get tapToCopy => 'Πατήστε για αντιγραφή';

  @override
  String get howToVerify => 'Πώς να επαληθεύσετε';

  @override
  String get verifyStep1 =>
      'Συναντήστε την επαφή σας αυτοπροσώπως ή καλέστε την';

  @override
  String get verifyStep2 =>
      'Συγκρίνετε τους αριθμούς ασφαλείας ή σαρώστε τα QR code';

  @override
  String get verifyStep3 => 'Αν ταιριάζουν, η συνομιλία σας είναι ασφαλής';

  @override
  String get scanToVerify => 'Σάρωση για επαλήθευση';

  @override
  String get reportSpam => 'Αναφορά spam';

  @override
  String get reportSpamSubtitle => 'Αναφέρετε αυτήν την επαφή ως spam';

  @override
  String get reportSpamDescription =>
      'Αυτό θα αναφέρει ανώνυμα αυτήν την επαφή. Η ταυτότητά σας δεν θα κοινοποιηθεί. Είστε σίγουροι;';

  @override
  String get report => 'Αναφορά';

  @override
  String get spamReported => 'Αναφέρθηκε ως spam';

  @override
  String get reportError =>
      'Αποτυχία αποστολής αναφοράς. Παρακαλώ δοκιμάστε ξανά.';

  @override
  String get reportRateLimited =>
      'Έχετε φτάσει τον μέγιστο αριθμό αναφορών για σήμερα.';

  @override
  String get blockContact => 'Αποκλεισμός επαφής';

  @override
  String get blockContactDescription =>
      'Αυτή η επαφή δεν θα μπορεί πλέον να σας στέλνει μηνύματα ή να σας καλεί. Δεν θα ειδοποιηθεί.';

  @override
  String get unblockContact => 'Ξεμπλοκάρισμα επαφής';

  @override
  String get unblockContactDescription =>
      'Αυτή η επαφή θα μπορεί ξανά να σας στέλνει μηνύματα και να σας καλεί.';

  @override
  String get contactBlocked => 'Η επαφή αποκλείστηκε';

  @override
  String get contactUnblocked => 'Η επαφή ξεμπλοκαρίστηκε';

  @override
  String get contactIsBlocked => 'Αυτή η επαφή είναι αποκλεισμένη';

  @override
  String get unblock => 'Ξεμπλοκάρισμα';

  @override
  String get deleteContactSubtitle =>
      'Διαγραφή αυτής της επαφής και της συνομιλίας';

  @override
  String get confirmWithPin => 'Επιβεβαίωση με PIN';

  @override
  String get enterPinToConfirm =>
      'Εισάγετε το PIN σας για επιβεβαίωση αυτής της ενέργειας';

  @override
  String get profilePhoto => 'Φωτογραφία προφίλ';

  @override
  String get takePhoto => 'Λήψη φωτογραφίας';

  @override
  String get chooseFromGallery => 'Επιλογή από τη γκαλερί';

  @override
  String get removePhoto => 'Αφαίρεση φωτογραφίας';

  @override
  String get viewContactHashId => 'Προβολή αναγνωριστικού επαφής';

  @override
  String get hashIdPartiallyMasked =>
      'Μερικώς κρυφό για την ασφάλειά σας και την ιδιωτικότητα της επαφής σας';

  @override
  String get addFirstContact => 'Προσθέστε την πρώτη σας επαφή';

  @override
  String get addFirstContactSubtitle =>
      'Μοιραστείτε το QR code σας ή σαρώστε ενός φίλου';

  @override
  String get directory => 'Κατάλογος';

  @override
  String get noContacts => 'Δεν υπάρχουν επαφές';

  @override
  String get noContactsSubtitle => 'Προσθέστε μια επαφή για να ξεκινήσετε';

  @override
  String get sendMessageAction => 'Αποστολή μηνύματος';

  @override
  String get audioCall => 'Φωνητική κλήση';

  @override
  String get videoCall => 'Βιντεοκλήση';

  @override
  String get viewProfile => 'Προβολή προφίλ';

  @override
  String get deleteContactDirectory => 'Διαγραφή επαφής';

  @override
  String get scanShort => 'Σάρωση';

  @override
  String get addShort => 'Προσθήκη';

  @override
  String deleteContactConfirmName(String name) {
    return 'Σίγουρα θέλετε να διαγράψετε $name;';
  }

  @override
  String get noNotesTitle => 'Δεν υπάρχουν σημειώσεις';

  @override
  String get noNotesSubtitle => 'Δημιουργήστε την πρώτη σας σημείωση';

  @override
  String get newNote => 'Νέα σημείωση';

  @override
  String get editNote => 'Επεξεργασία σημείωσης';

  @override
  String get deleteNote => 'Διαγραφή σημείωσης';

  @override
  String get deleteNoteConfirm =>
      'Σίγουρα θέλετε να διαγράψετε αυτή τη σημείωση;';

  @override
  String get noteTitle => 'Τίτλος';

  @override
  String get noteContent => 'Περιεχόμενο';

  @override
  String get addItem => 'Προσθήκη στοιχείου';

  @override
  String get pinNote => 'Καρφίτσωμα';

  @override
  String get unpinNote => 'Ξεκαρφίτσωμα';

  @override
  String get noteColor => 'Χρώμα';

  @override
  String get notePassword => 'Κωδικός πρόσβασης';

  @override
  String get setPassword => 'Ορισμός κωδικού πρόσβασης';

  @override
  String get changePassword => 'Αλλαγή κωδικού πρόσβασης';

  @override
  String get removePassword => 'Αφαίρεση κωδικού πρόσβασης';

  @override
  String get enterPassword => 'Εισαγωγή κωδικού πρόσβασης';

  @override
  String get confirmPassword => 'Επιβεβαίωση κωδικού πρόσβασης';

  @override
  String get passwordPin => 'Κωδικός PIN';

  @override
  String get passwordText => 'Κωδικός κειμένου';

  @override
  String get protectedNote => 'Προστατευμένη σημείωση';

  @override
  String get incorrectPassword => 'Λανθασμένος κωδικός πρόσβασης';

  @override
  String get passwordSet => 'Ο κωδικός πρόσβασης ορίστηκε';

  @override
  String get passwordRemoved => 'Ο κωδικός πρόσβασης αφαιρέθηκε';

  @override
  String get notesBiometric => 'Face ID για σημειώσεις';

  @override
  String get notesBiometricSubtitle =>
      'Απαίτηση βιομετρικής ταυτοποίησης για το άνοιγμα προστατευμένων σημειώσεων';

  @override
  String get textNote => 'Σημείωση κειμένου';

  @override
  String get checklistNote => 'Λίστα ελέγχου';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total εργασίες';
  }

  @override
  String get autoSaved => 'Αποθηκεύτηκε';

  @override
  String get searchNotes => 'Αναζήτηση σημειώσεων';

  @override
  String get legalConsent => 'Νομική συγκατάθεση';

  @override
  String get confirmAge13 => 'Επιβεβαιώνω ότι είμαι τουλάχιστον 13 ετών';

  @override
  String get acceptLegalStart => 'Αποδέχομαι την ';

  @override
  String get privacyPolicy => 'Πολιτική Απορρήτου';

  @override
  String get termsOfService => 'Όρους Χρήσης';

  @override
  String get andThe => ' και τους ';

  @override
  String get continueButton => 'Συνέχεια';

  @override
  String get mustAcceptTerms =>
      'Πρέπει να αποδεχτείτε και τις δύο προϋποθέσεις για να συνεχίσετε';

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
  String get support => 'Υποστήριξη';

  @override
  String get contactSupport => 'Επικοινωνία με υποστήριξη';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Αναφορά κατάχρησης';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Νομικά';

  @override
  String get legalEntity => 'Νομική οντότητα';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Καρφίτσωμα';

  @override
  String get unpinConversation => 'Ξεκαρφίτσωμα';

  @override
  String get hideConversation => 'Αφαίρεση από τη ροή';

  @override
  String get deleteConversation => 'Διαγραφή συνομιλίας';

  @override
  String get deleteConversationConfirm =>
      'Εισάγετε το PIN σας για επιβεβαίωση της διαγραφής όλων των μηνυμάτων';

  @override
  String get noConversations => 'Δεν υπάρχουν ακόμη συνομιλίες';

  @override
  String get startConversation => 'Έναρξη';

  @override
  String get microphonePermissionRequired =>
      'Απαιτείται πρόσβαση στο μικρόφωνο';

  @override
  String get microphonePermissionExplanation =>
      'Το Hash χρειάζεται το μικρόφωνο για πραγματοποίηση κλήσεων.';

  @override
  String get cameraPermissionExplanation =>
      'Το Hash χρειάζεται την κάμερα για βιντεοκλήσεις.';

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
  String get openSettings => 'Άνοιγμα ρυθμίσεων';

  @override
  String get callConnecting => 'Σύνδεση...';

  @override
  String get callRinging => 'Κουδουνίζει...';

  @override
  String get callReconnecting => 'Επανασύνδεση...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Επανασύνδεση ($secondsδ)';
  }

  @override
  String get callPaused => 'Σε παύση';

  @override
  String get callPausedSubtitle => 'Η κλήση είναι ακόμα ενεργή';

  @override
  String get callRemoteMicMuted => 'Το μικρόφωνο της επαφής είναι σε σίγαση';

  @override
  String get callMiniControlsMute => 'Σίγαση';

  @override
  String get callMiniControlsUnmute => 'Κατάργηση σίγασης';

  @override
  String get callMiniControlsHangUp => 'Τερματισμός';

  @override
  String get callMiniControlsReturn => 'Επιστροφή στην κλήση';

  @override
  String get callNetworkPoor => 'Ασταθής σύνδεση';

  @override
  String get callNetworkLost => 'Η σύνδεση χάθηκε';

  @override
  String get callEndedTitle => 'Η κλήση τερματίστηκε';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Δεδομένα συσκευής';

  @override
  String get deviceDataSubtitle => 'Τοπική και απομακρυσμένη αποθήκευση';

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
  String get localStorage => 'Τοπική αποθήκευση';

  @override
  String get onThisDevice => 'σε αυτή τη συσκευή';

  @override
  String get encryptedDatabases => 'Κρυπτογραφημένες βάσεις δεδομένων';

  @override
  String get files => 'Αρχεία';

  @override
  String get secureKeychain => 'Ασφαλές κλειδοθήκη';

  @override
  String get cache => 'Προσωρινή μνήμη';

  @override
  String get contactsDetail => 'Ονόματα, εικονίδια, κλειδιά Signal';

  @override
  String get messagesDetail => 'Κρυπτογραφημένες συνομιλίες';

  @override
  String get notesDetail => 'Προσωπικές σημειώσεις';

  @override
  String get signalSessions => 'Συνεδρίες Signal';

  @override
  String get signalSessionsDetail => 'Συνεδρίες κρυπτογράφησης';

  @override
  String get pendingContacts => 'Εκκρεμείς επαφές';

  @override
  String get pendingContactsDetail => 'Εκκρεμή αιτήματα';

  @override
  String get callHistory => 'Κλήσεις';

  @override
  String get callHistoryDetail => 'Ιστορικό κλήσεων';

  @override
  String get preferences => 'Προτιμήσεις';

  @override
  String get preferencesDetail => 'Προτιμήσεις πολυμέσων και κλήσεων';

  @override
  String get avatars => 'Εικονίδια';

  @override
  String get media => 'Πολυμέσα';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '1 αρχείο',
      zero: 'κανένα αρχείο',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Ενεργό';

  @override
  String get notDefined => 'Δεν έχει οριστεί';

  @override
  String get biometrics => 'Βιομετρικά';

  @override
  String get recoveryPhrase => 'Φράση ανάκτησης';

  @override
  String get identity => 'Ταυτότητα (Hash ID)';

  @override
  String get signalKeys => 'Κλειδιά Signal Protocol';

  @override
  String get authTokens => 'Διακριτικά ταυτοποίησης';

  @override
  String get contactNamesCache => 'Προσωρινή μνήμη ονομάτων επαφών';

  @override
  String get remoteConfig => 'Απομακρυσμένη διαμόρφωση';

  @override
  String get notificationPrefs => 'Προτιμήσεις ειδοποιήσεων';

  @override
  String get serverData => 'Δεδομένα διακομιστή';

  @override
  String get serverDataInfo =>
      'Το Hash κρατά ελάχιστα δεδομένα στον διακομιστή, όλα κρυπτογραφημένα ή προσωρινά.';

  @override
  String get serverProfile => 'Προφίλ';

  @override
  String get serverProfileDetail =>
      'Hash ID, δημόσια κλειδιά, token γραμματοκιβωτίου';

  @override
  String get serverPrekeys => 'Προ-κλειδιά';

  @override
  String get serverPrekeysDetail => 'Κλειδιά Signal μίας χρήσης (αναλωμένα)';

  @override
  String get serverMessages => 'Μηνύματα σε μεταφορά';

  @override
  String get serverMessagesDetail =>
      'Διαγράφονται μετά την παράδοση (μέγ. 24ω)';

  @override
  String get serverMedia => 'Πολυμέσα σε μεταφορά';

  @override
  String get serverMediaDetail => 'Διαγράφονται μετά τη λήψη';

  @override
  String get serverContactRequests => 'Αιτήματα επαφών';

  @override
  String get serverContactRequestsDetail => 'Λήγουν μετά από 24ω';

  @override
  String get serverRateLimits => 'Όρια ρυθμού';

  @override
  String get serverRateLimitsDetail => 'Προσωρινά δεδομένα κατά της κατάχρησης';

  @override
  String get privacyReassurance =>
      'Το Hash δεν μπορεί να διαβάσει τα μηνύματά σας. Όλα τα δεδομένα κρυπτογραφούνται από άκρο σε άκρο. Τα δεδομένα του διακομιστή διαγράφονται αυτόματα.';

  @override
  String get pinTooSimple =>
      'Αυτός ο κωδικός PIN είναι πολύ απλός. Επιλέξτε έναν πιο ασφαλή κωδικό.';

  @override
  String get genericError => 'Παρουσιάστηκε σφάλμα. Παρακαλώ δοκιμάστε ξανά.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Αδυναμία δημιουργίας λογαριασμού: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Η φράση αντιγράφηκε στο πρόχειρο';

  @override
  String get copyPhrase => 'Αντιγραφή φράσης';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Σημειώστε αυτή τη φράση σε ασφαλές μέρος. Αν χάσετε το PIN σας χωρίς αυτή τη φράση, θα χάσετε μόνιμα την πρόσβαση στα δεδομένα σας.';

  @override
  String get noMessages => 'Κανένα μήνυμα';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Διαγραφή όλων των μηνυμάτων με $name;';
  }

  @override
  String get confirmation => 'Επιβεβαίωση';

  @override
  String get untitled => 'Χωρίς τίτλο';

  @override
  String get noSessions => 'Καμία συνεδρία';

  @override
  String get unknownContact => 'Άγνωστη επαφή';

  @override
  String get unnamed => 'Χωρίς όνομα';

  @override
  String get noPendingRequestsAlt => 'Κανένα εκκρεμές αίτημα';

  @override
  String get deleteAllCallHistory => 'Διαγραφή όλου του ιστορικού κλήσεων;';

  @override
  String get noCalls => 'Καμία κλήση';

  @override
  String get noPreferences => 'Δεν υπάρχουν προτιμήσεις';

  @override
  String get resetAllMediaPrefs => 'Επαναφορά όλων των προτιμήσεων πολυμέσων;';

  @override
  String get deleteThisAvatar => 'Διαγραφή αυτού του εικονιδίου;';

  @override
  String get deleteAllAvatars => 'Διαγραφή όλων των εικονιδίων;';

  @override
  String get noAvatars => 'Κανένα εικονίδιο';

  @override
  String get deleteThisFile => 'Διαγραφή αυτού του αρχείου;';

  @override
  String get deleteAllMediaFiles => 'Διαγραφή όλων των πολυμέσων;';

  @override
  String get noMediaFiles => 'Κανένα πολυμέσο';

  @override
  String get outgoing => 'Εξερχόμενο';

  @override
  String get incoming => 'Εισερχόμενο';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Εφήμερη προβολή: $secondsδ';
  }

  @override
  String get normalView => 'Κανονική προβολή';

  @override
  String get callReasonCompleted => 'Ολοκληρώθηκε';

  @override
  String get callReasonMissed => 'Αναπάντητη';

  @override
  String get callReasonDeclined => 'Απορρίφθηκε';

  @override
  String get callReasonFailed => 'Απέτυχε';

  @override
  String get justNow => 'Μόλις τώρα';

  @override
  String timeAgoMinutes(int count) {
    return 'πριν $count λ';
  }

  @override
  String timeAgoHours(int count) {
    return 'πριν $countω';
  }

  @override
  String timeAgoDays(int count) {
    return 'πριν $countμ';
  }

  @override
  String get messageTypeContact => 'Επαφή';

  @override
  String get messageTypeLocation => 'Τοποθεσία';

  @override
  String get statusQueued => 'Στην ουρά';

  @override
  String get blockedBadge => 'Αποκλεισμένος';

  @override
  String get protectedBadge => 'Προστατευμένο';

  @override
  String messageCount(int count) {
    return '$count μήνυμα(τα)';
  }

  @override
  String get deleteQuestion => 'Διαγραφή;';

  @override
  String get transferMyAccountTitle => 'Μεταφορά λογαριασμού μου';

  @override
  String get loadingError => 'Σφάλμα φόρτωσης';

  @override
  String get transferToNewDevice => 'Μεταφορά σε νέα συσκευή';

  @override
  String get transferInstructions =>
      'Στη νέα σας συσκευή, επιλέξτε \"Ανάκτηση λογαριασμού\" και εισάγετε αυτές τις πληροφορίες:';

  @override
  String get yourHashIdLabel => 'Το Hash ID σας';

  @override
  String get enterYourPinCode => 'Εισάγετε τον κωδικό PIN σας';

  @override
  String get pinOwnerConfirmation =>
      'Για να επιβεβαιώσετε ότι είστε ο κάτοχος αυτού του λογαριασμού';

  @override
  String get scanThisQrCode => 'Σαρώστε αυτό το QR code';

  @override
  String get withYourNewDevice => 'Με τη νέα σας συσκευή';

  @override
  String get orEnterTheCode => 'ή εισάγετε τον κωδικό';

  @override
  String get transferCodeLabel => 'Κωδικός μεταφοράς';

  @override
  String get proximityVerification => 'Επαλήθευση εγγύτητας';

  @override
  String get bringDevicesCloser => 'Φέρτε τις δύο συσκευές κοντύτερα';

  @override
  String get confirmTransferQuestion => 'Επιβεβαίωση μεταφοράς;';

  @override
  String get accountWillBeTransferred =>
      'Ο λογαριασμός σας θα μεταφερθεί στη νέα συσκευή.\n\nΑυτή η συσκευή θα αποσυνδεθεί μόνιμα.';

  @override
  String get transferComplete => 'Η μεταφορά ολοκληρώθηκε';

  @override
  String get transferSuccessMessage =>
      'Ο λογαριασμός σας μεταφέρθηκε με επιτυχία.\n\nΗ εφαρμογή θα κλείσει τώρα.';

  @override
  String get manualVerification => 'Χειροκίνητη επαλήθευση';

  @override
  String get codeDisplayedOnBothDevices =>
      'Κωδικός που εμφανίζεται και στις δύο συσκευές:';

  @override
  String get doesCodeMatchNewDevice =>
      'Ταιριάζει αυτός ο κωδικός με αυτόν στη νέα συσκευή;';

  @override
  String get verifiedStatus => 'Επαληθεύτηκε';

  @override
  String get inProgressStatus => 'Σε εξέλιξη...';

  @override
  String get notAvailableStatus => 'Μη διαθέσιμο';

  @override
  String get codeExpiredRestart => 'Ο κωδικός έληξε. Παρακαλώ ξεκινήστε ξανά.';

  @override
  String get codesDoNotMatchCancelled =>
      'Οι κωδικοί δεν ταιριάζουν. Η μεταφορά ακυρώθηκε.';

  @override
  String transferToDevice(String device) {
    return 'Προς: $device';
  }

  @override
  String get copiedExclamation => 'Αντιγράφηκε!';

  @override
  String expiresInTime(String time) {
    return 'Λήγει σε $time';
  }

  @override
  String get biometricNotAvailable =>
      'Τα βιομετρικά δεν είναι διαθέσιμα σε αυτή τη συσκευή';

  @override
  String get biometricAuthError => 'Σφάλμα κατά τη βιομετρική ταυτοποίηση';

  @override
  String get authenticateForBiometric =>
      'Παρακαλώ πιστοποιηθείτε για να ενεργοποιήσετε τα βιομετρικά';

  @override
  String get biometricAuthFailed => 'Η βιομετρική ταυτοποίηση απέτυχε';

  @override
  String get forceUpdateTitle => 'Απαιτείται ενημέρωση';

  @override
  String get forceUpdateMessage =>
      'Μια νέα έκδοση του Hash είναι διαθέσιμη. Παρακαλώ ενημερώστε για να συνεχίσετε.';

  @override
  String get updateButton => 'Ενημέρωση';

  @override
  String get maintenanceInProgress => 'Συντήρηση σε εξέλιξη';

  @override
  String get tryAgainLater => 'Παρακαλώ δοκιμάστε ξανά αργότερα';

  @override
  String get information => 'Πληροφορίες';

  @override
  String get later => 'Αργότερα';

  @override
  String get doYouLikeHash => 'Σας αρέσει το Hash;';

  @override
  String get yourFeedbackHelps =>
      'Τα σχόλιά σας μας βοηθούν να βελτιώσουμε την εφαρμογή';

  @override
  String get ratingTerrible => 'Τρομερό';

  @override
  String get ratingBad => 'Κακό';

  @override
  String get ratingOk => 'Μέτριο';

  @override
  String get ratingGood => 'Καλό';

  @override
  String get ratingExcellent => 'Εξαιρετικό!';

  @override
  String get donationMessage =>
      'Το Hash είναι ένα μη κερδοσκοπικό έργο. Η υποστήριξή σας μας βοηθά να συνεχίσουμε να χτίζουμε έναν πραγματικά ιδιωτικό messenger.';

  @override
  String get recentConnections => 'Πρόσφατες συνδέσεις';

  @override
  String get loginInfoText =>
      'Κάθε ξεκλείδωμα με PIN καταγράφεται τοπικά. Μόνο οι τελευταίες 24 ώρες διατηρούνται.';

  @override
  String get connectionCount => 'Σύνδεση(εις)';

  @override
  String get periodLabel => 'Περίοδος';

  @override
  String get historyLabel => 'Ιστορικό';

  @override
  String get noLoginRecorded => 'Δεν καταγράφηκε σύνδεση';

  @override
  String get nextUnlocksAppearHere =>
      'Τα επόμενα ξεκλειδώματα θα εμφανιστούν εδώ.';

  @override
  String get dataLocalOnly =>
      'Αυτά τα δεδομένα αποθηκεύονται μόνο στη συσκευή σας και δεν μεταδίδονται ποτέ.';

  @override
  String get currentSession => 'Τρέχουσα';

  @override
  String get todayLabel => 'Σήμερα';

  @override
  String get yesterdayLabel => 'Χθες';

  @override
  String get justNowLabel => 'Μόλις τώρα';

  @override
  String minutesAgoLabel(int count) {
    return 'Πριν $count λεπ';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Πριν $hoursώ';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Πριν $hoursώ $minutesλ';
  }

  @override
  String get noMaintenancePlanned => 'Δεν υπάρχει προγραμματισμένη συντήρηση';

  @override
  String get everythingWorkingNormally => 'Όλα λειτουργούν κανονικά';

  @override
  String get maintenanceTitle => 'Συντήρηση';

  @override
  String get maintenanceActiveLabel => 'ΣΕ ΕΞΕΛΙΞΗ';

  @override
  String get maintenancePlannedLabel => 'ΠΡΟΓΡΑΜΜΑΤΙΣΜΕΝΗ';

  @override
  String get locking => 'Κλείδωμα...';

  @override
  String get newMessageNotification => 'Νέο μήνυμα';

  @override
  String get secExplainTitle => 'Πώς σε προστατεύει το Hash';

  @override
  String get secExplainIntro =>
      'Το Hash σχεδιάστηκε ώστε κανείς να μην μπορεί να διαβάσει τα μηνύματά σας.';

  @override
  String get secExplainIntroSub =>
      'Ούτε καν εμείς.\nΔείτε πώς λειτουργεί, με απλά λόγια.';

  @override
  String get secJourneyLabel => 'Η ΔΙΑΔΡΟΜΗ';

  @override
  String get secJourneyTitle => 'Η διαδρομή του μηνύματός σας';

  @override
  String get secJourneySubtitle =>
      'Από το δάχτυλό σας μέχρι την οθόνη της επαφής σας, κάθε βήμα είναι προστατευμένο. Ακολουθήστε τη διαδρομή.';

  @override
  String get secStep1Title => 'Γράφετε το μήνυμά σας';

  @override
  String get secStep1Desc =>
      'Πληκτρολογείτε \"Γεια!\" στην εφαρμογή. Σε αυτό το σημείο, το μήνυμα υπάρχει μόνο στη μνήμη του τηλεφώνου σας. Τίποτα δεν έχει σταλεί.';

  @override
  String get secStep2Title => 'Κρυπτογράφηση με Signal Protocol';

  @override
  String get secStep2Desc =>
      'Μόλις πατήσετε \"Αποστολή\", το μήνυμά σας μετατρέπεται σε μια σειρά ακατανόητων χαρακτήρων. Είναι σαν το μήνυμά σας να κλειδώνεται σε ένα χρηματοκιβώτιο που μόνο η επαφή σας έχει το κλειδί.';

  @override
  String get secStep3Title => 'Sealed Sender: ο αόρατος φάκελος';

  @override
  String get secStep3Desc =>
      'Φανταστείτε να στέλνετε ένα γράμμα χωρίς διεύθυνση αποστολέα στον φάκελο. Αυτό ακριβώς κάνει το Hash. Το μήνυμα αφήνεται σε ένα ανώνυμο γραμματοκιβώτιο. Ο διακομιστής δεν ξέρει ποιος το έστειλε.';

  @override
  String get secStep4Title => 'Ο διακομιστής δεν βλέπει τίποτα';

  @override
  String get secStep4Desc =>
      'Ο διακομιστής λειτουργεί ως τυφλός ταχυδρόμος. Ξέρει μόνο \"κάποιος άφησε κάτι στο γραμματοκιβώτιο #A7X9\". Δεν ξέρει ποιος το έστειλε, τι είναι ή σε ποιον απευθύνεται.';

  @override
  String get secStep4Highlight =>
      'Κανένα μεταδεδομένο δεν αποθηκεύεται: καμία διεύθυνση IP, καμία χρονοσφραγίδα, κανένας σύνδεσμος μεταξύ αποστολέα και παραλήπτη.';

  @override
  String get secStep5Title => 'Η επαφή σας λαμβάνει το μήνυμα';

  @override
  String get secStep5Desc =>
      'Το τηλέφωνο της επαφής σας ανακτά το περιεχόμενο από το ανώνυμο γραμματοκιβώτιό της και αποκρυπτογραφεί το μήνυμα με το ιδιωτικό κλειδί της, που δεν έχει φύγει ποτέ από τη συσκευή της. Το \"Γεια!\" εμφανίζεται στην οθόνη της.';

  @override
  String get secStep6Title => 'Το μήνυμα εξαφανίζεται από τον διακομιστή';

  @override
  String get secStep6Desc =>
      'Μόλις η επαφή σας επιβεβαιώσει τη λήψη, ο διακομιστής διαγράφει μόνιμα το μήνυμα. Κανένας κάδος, κανένα αρχείο, κανένα αντίγραφο ασφαλείας. Ακόμη και τα αδιάβαστα μηνύματα καταστρέφονται αυτόματα μετά από 24 ώρες.';

  @override
  String get secStep7Title => 'Τοπική λήξη';

  @override
  String get secStep7Desc =>
      'Στο τηλέφωνο της επαφής σας, το μήνυμα αυτοκαταστρέφεται σύμφωνα με τη διάρκεια που επιλέξατε: αμέσως μετά την ανάγνωση, 5 λεπτά, 1 ώρα... εσείς αποφασίζετε.';

  @override
  String get secJourneyConclusion =>
      'Αποτέλεσμα: μηδέν ίχνη στον διακομιστή, μηδέν ίχνη στις συσκευές. Το μήνυμα υπήρχε μόνο αρκετά ώστε να διαβαστεί, μετά εξαφανίστηκε.';

  @override
  String get secArchLabel => 'ΑΡΧΙΤΕΚΤΟΝΙΚΗ';

  @override
  String get secArchTitle => '5 επίπεδα προστασίας';

  @override
  String get secArchSubtitle =>
      'Το Hash δεν βασίζεται σε μία μόνο τεχνολογία. Κάθε επίπεδο ενισχύει τα υπόλοιπα. Ακόμη κι αν ένα επίπεδο παραβιαστεί, τα δεδομένα σας παραμένουν ασφαλή.';

  @override
  String get secLayer1Title => 'Κρυπτογράφηση από άκρο σε άκρο';

  @override
  String get secLayer1Desc =>
      'Κάθε μήνυμα κρυπτογραφείται με ένα μοναδικό κλειδί. Με απλά λόγια: ακόμη κι αν κάποιος αποκρυπτογραφήσει ένα μήνυμα, δεν θα μπορέσει να αποκρυπτογραφήσει το επόμενο. Κάθε μήνυμα έχει τη δική του κλειδαριά.';

  @override
  String get secLayer1Detail =>
      'Για αρχεία (φωτογραφίες, βίντεο, έγγραφα), το Hash χρησιμοποιεί πρόσθετη κρυπτογράφηση AES-256-GCM. Το αρχείο κρυπτογραφείται πριν φύγει από το τηλέφωνό σας.';

  @override
  String get secLayer2Title => 'Sealed Sender (ανωνυμία δικτύου)';

  @override
  String get secLayer2Desc =>
      'Οι συνηθισμένοι messenger στέλνουν τα μηνύματά σας με την ταυτότητά σας. Είναι σαν να γράφετε το όνομά σας στον φάκελο. Το Hash χρησιμοποιεί ανώνυμα γραμματοκιβώτια: ο διακομιστής παραδίδει το μήνυμα χωρίς να ξέρει ποιος το έστειλε.';

  @override
  String get secLayer2Detail =>
      'Αποτέλεσμα: ακόμη και σε περίπτωση παραβίασης δεδομένων του διακομιστή, είναι αδύνατο να ανασυνθέσει κανείς ποιος μιλά σε ποιον.';

  @override
  String get secLayer3Title => 'Αυτόματη διαγραφή';

  @override
  String get secLayer3Desc =>
      'Τα μηνύματα διαγράφονται από τον διακομιστή αμέσως μόλις επιβεβαιωθεί η λήψη. Ακόμη κι αν ένα μήνυμα δεν ανακτηθεί ποτέ, καταστρέφεται αυτόματα μετά από 24 ώρες.';

  @override
  String get secLayer3Detail =>
      'Στο τηλέφωνό σας, τα μηνύματα αυτοκαταστρέφονται σύμφωνα με τη διάρκεια που επιλέγετε: αμέσως, 5 λ, 15 λ, 30 λ, 1ω, 3ω, 6ω ή 12ω.';

  @override
  String get secLayer4Title => 'Προστασία τοπικής πρόσβασης';

  @override
  String get secLayer4Desc =>
      'Η εφαρμογή προστατεύεται από ένα 6-ψήφιο PIN ή/και βιομετρικά (Face ID, δαχτυλικό αποτύπωμα). Μετά από πολλές αποτυχημένες προσπάθειες, η εφαρμογή κλειδώνει με αυξανόμενη καθυστέρηση μετά από κάθε αποτυχία.';

  @override
  String get secLayer5Title => 'Κλειδωμένη βάση δεδομένων';

  @override
  String get secLayer5Desc =>
      'Στην πλευρά του διακομιστή, κανένας χρήστης δεν μπορεί να γράψει απευθείας στη βάση δεδομένων. Όλες οι ενέργειες περνούν από ασφαλείς λειτουργίες που ελέγχουν κάθε αίτημα.';

  @override
  String get secLayer5Detail =>
      'Είναι σαν ταμείο τράπεζας: δεν αγγίζετε ποτέ το θησαυροφυλάκιο μόνοι σας. Κάνετε ένα αίτημα και το σύστημα ελέγχει ότι έχετε το δικαίωμα πριν ενεργήσει.';

  @override
  String get secVashLabel => 'ΜΟΝΑΔΙΚΟ ΣΤΟΝ ΚΟΣΜΟ';

  @override
  String get secVashTitle => 'Λειτουργία Vash';

  @override
  String get secVashSubtitle =>
      'Ένα σύστημα ασφαλείας έκτακτης ανάγκης που δεν υπάρχει σε καμία άλλη εφαρμογή μηνυμάτων.';

  @override
  String get secVashScenarioTitle => 'Φανταστείτε αυτή την κατάσταση';

  @override
  String get secVashScenario1 => 'Κάποιος αποκτά πρόσβαση στο τηλέφωνό σας';

  @override
  String get secVashScenario2 => 'Σας ζητούν τον κωδικό PIN σας';

  @override
  String get secVashScenario3 =>
      'Θέλετε να διαγράψετε όλα τα δεδομένα σας επειγόντως';

  @override
  String get secVashSolutionTitle => 'Η λύση: δύο κωδικοί PIN';

  @override
  String get secVashSolutionDesc =>
      'Ρυθμίζετε δύο διαφορετικούς κωδικούς PIN στο Hash:';

  @override
  String get secVashNormalCodeLabel => 'Κανονικός κωδικός';

  @override
  String get secVashNormalCodeDesc =>
      'Ανοίγει κανονικά την εφαρμογή με όλα τα δεδομένα σας';

  @override
  String get secVashCodeLabel2 => 'Κωδικός Vash';

  @override
  String get secVashCodeDescription =>
      'Ανοίγει κανονικά την εφαρμογή... αλλά όλα τα δεδομένα σας διαγράφονται σιωπηλά στο παρασκήνιο';

  @override
  String get secVashWhatHappensTitle => 'Τι συμβαίνει μετά';

  @override
  String get secVashWhatHappensDesc =>
      'Η εφαρμογή ανοίγει κανονικά. Καμία ειδοποίηση, κανένα ύποπτο animation. Η οθόνη δείχνει απλά μια άδεια εφαρμογή, σαν να μόλις την εγκαταστήσατε.\n\nΣτην πραγματικότητα, όλες οι συνομιλίες, επαφές και μηνύματά σας έχουν διαγραφεί αμετάκλητα σε κλάσμα δευτερολέπτου.';

  @override
  String get secCallsLabel => 'ΚΛΗΣΕΙΣ & ΑΡΧΕΙΑ';

  @override
  String get secCallsTitle => 'Τα πάντα κρυπτογραφούνται';

  @override
  String get secCallsSubtitle =>
      'Δεν είναι μόνο τα μηνύματα. Απολύτως τα πάντα που περνούν από το Hash κρυπτογραφούνται από άκρο σε άκρο.';

  @override
  String get secAudioCallTitle => 'Φωνητικές κλήσεις';

  @override
  String get secAudioCallDesc =>
      'Κρυπτογράφηση από άκρο σε άκρο μέσω WebRTC. Η φωνή μεταδίδεται απευθείας μεταξύ συσκευών.';

  @override
  String get secVideoCallTitle => 'Βιντεοκλήσεις';

  @override
  String get secVideoCallDesc =>
      'Ίδια τεχνολογία, κάθε ροή κρυπτογραφείται ξεχωριστά.';

  @override
  String get secPhotosTitle => 'Φωτογραφίες & βίντεο';

  @override
  String get secPhotosDesc =>
      'Κρυπτογράφηση σε AES-256-GCM πριν φύγουν από το τηλέφωνό σας.';

  @override
  String get secDocsTitle => 'Έγγραφα';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, οποιοδήποτε αρχείο. Όνομα, μέγεθος και περιεχόμενο κρυπτογραφημένα.';

  @override
  String get secAnonLabel => 'ΑΝΩΝΥΜΙΑ';

  @override
  String get secAnonTitle => 'Δεν απαιτείται ταυτότητα';

  @override
  String get secAnonSubtitle =>
      'Το Hash δεν ζητά ποτέ τον αριθμό τηλεφώνου ή το email σας. Αναγνωρίζεστε από ένα μοναδικό και ανώνυμο Hash ID.';

  @override
  String get secHashIdTitle => 'Το Hash ID σας';

  @override
  String get secHashIdDesc =>
      'Αυτό είναι το μοναδικό σας αναγνωριστικό. Δεν αποκαλύπτει τίποτα για εσάς: ούτε το όνομα, ούτε τον αριθμό, ούτε την τοποθεσία σας. Είναι σαν ένα ψευδώνυμο αδύνατο να συνδεθεί με την πραγματική σας ταυτότητα.\n\nΓια να προσθέσετε μια επαφή, μοιράζεστε το Hash ID σας ή σαρώνετε ένα QR code. Αυτό είναι. Κανένα συγχρονισμένο βιβλίο διευθύνσεων, καμία πρόταση \"Άτομα που ίσως γνωρίζετε\".';

  @override
  String get secDataLabel => 'ΔΕΔΟΜΕΝΑ';

  @override
  String get secDataTitle => 'Τι δεν γνωρίζει το Hash';

  @override
  String get secDataSubtitle =>
      'Ο καλύτερος τρόπος να προστατεύσετε τα δεδομένα σας είναι να μην τα συλλέγετε.';

  @override
  String get secNeverCollected => 'Δεν συλλέγονται ποτέ';

  @override
  String get secNeverItem1 => 'Περιεχόμενο μηνυμάτων';

  @override
  String get secNeverItem2 => 'Λίστα επαφών';

  @override
  String get secNeverItem3 => 'Αριθμός τηλεφώνου';

  @override
  String get secNeverItem4 => 'Διεύθυνση email';

  @override
  String get secNeverItem5 => 'Διεύθυνση IP';

  @override
  String get secNeverItem6 => 'Τοποθεσία';

  @override
  String get secNeverItem7 => 'Μεταδεδομένα (ποιος μιλά σε ποιον)';

  @override
  String get secNeverItem8 => 'Ιστορικό κλήσεων';

  @override
  String get secNeverItem9 => 'Βιβλίο διευθύνσεων';

  @override
  String get secNeverItem10 => 'Διαφημιστικά αναγνωριστικά';

  @override
  String get secTempStored => 'Προσωρινά αποθηκευμένα';

  @override
  String get secTempItem1 => 'Ανώνυμο Hash ID (μοναδικό αναγνωριστικό)';

  @override
  String get secTempItem2 => 'Δημόσια κλειδιά κρυπτογράφησης';

  @override
  String get secTempItem3 => 'Κρυπτογραφημένα μηνύματα σε μεταφορά (μέγ. 24ω)';

  @override
  String get secTempNote =>
      'Ακόμη και αυτά τα ελάχιστα δεδομένα δεν μπορούν να σας ταυτοποιήσουν. Το Hash ID σας δεν συνδέεται με κανένα προσωπικό στοιχείο.';

  @override
  String get secFooterTitle => 'Η ιδιωτικότητά σας, η ελευθερία σας';

  @override
  String get secFooterDesc =>
      'Το Hash χρησιμοποιεί τις ίδιες τεχνολογίες κρυπτογράφησης με τις πιο απαιτητικές επαγγελματικές εφαρμογές. Τα μηνύματά σας προστατεύονται από μαθηματικά, όχι από υποσχέσεις.';

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
