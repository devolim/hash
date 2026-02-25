// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Khmer Central Khmer (`km`).
class AppLocalizationsKm extends AppLocalizations {
  AppLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'គ្មានដាន។ គ្មានការសម្រុះសម្រួល។';

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
  String get conversations => 'ការជជែក';

  @override
  String get contacts => 'ទំនាក់ទំនង';

  @override
  String get noConversation => 'គ្មានការជជែក';

  @override
  String get noConversationSubtitle =>
      'បន្ថែមទំនាក់ទំនងដើម្បីចាប់ផ្តើមជជែកដោយសុវត្ថិភាព';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'សំណើ $count កំពុងរង់ចាំ',
      one: 'សំណើ 1 កំពុងរង់ចាំ',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'សំណើ $count បានផ្ញើកំពុងរង់ចាំ',
      one: 'សំណើ 1 បានផ្ញើកំពុងរង់ចាំ',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'បន្ថែមទំនាក់ទំនង';

  @override
  String get shareApp => 'ចែករំលែកកម្មវិធី';

  @override
  String get newMessage => 'សារថ្មី';

  @override
  String get newConversation => 'ផ្ញើសារ';

  @override
  String get settings => 'ការកំណត់';

  @override
  String get myHashId => 'Hash ID របស់ខ្ញុំ';

  @override
  String get supportHash => 'គាំទ្រ Hash';

  @override
  String get supportHashSubtitle => 'Hash គឺជាគម្រោងមិនរកប្រាក់ចំណេញ';

  @override
  String get donate => 'បរិច្ចាគ';

  @override
  String get appearance => 'រូបរាង';

  @override
  String get theme => 'រចនាបថ';

  @override
  String get themeAuto => 'ស្វ័យប្រវត្តិ';

  @override
  String get themeAutoSubtitle => 'តាមការកំណត់ប្រព័ន្ធ';

  @override
  String get themeDark => 'ងងឹត';

  @override
  String get themeLight => 'ភ្លឺ';

  @override
  String get themeRecommendation =>
      'រចនាបថងងឹតត្រូវបានណែនាំសម្រាប់ភាពឯកជនកាន់តែប្រសើរ';

  @override
  String get language => 'ភាសា';

  @override
  String get languageAuto => 'ស្វ័យប្រវត្តិ (ប្រព័ន្ធ)';

  @override
  String get notifications => 'ការជូនដំណឹង';

  @override
  String get messages => 'សារ';

  @override
  String get calls => 'ការហៅ';

  @override
  String get vibration => 'រំញ័រ';

  @override
  String get notificationContent => 'មាតិកាការជូនដំណឹង';

  @override
  String get notificationContentFull => 'បង្ហាញទាំងអស់';

  @override
  String get notificationContentFullDesc =>
      'ឈ្មោះទំនាក់ទំនង និងការមើលជាមុននៃសារ';

  @override
  String get notificationContentName => 'ឈ្មោះតែប៉ុណ្ណោះ';

  @override
  String get notificationContentNameDesc => 'បង្ហាញតែឈ្មោះទំនាក់ទំនង';

  @override
  String get notificationContentDiscrete => 'រម្ងាប់';

  @override
  String get notificationContentDiscreteDesc => 'បង្ហាញតែ \"សារថ្មី\"';

  @override
  String get security => 'សុវត្ថិភាព';

  @override
  String get howHashProtectsYou => 'របៀបដែល Hash ការពារអ្នក';

  @override
  String get howHashProtectsYouSubtitle => 'ស្វែងយល់ពីសុវត្ថិភាពរបស់អ្នក';

  @override
  String get accountSecurity => 'សុវត្ថិភាពគណនី';

  @override
  String get accountSecuritySubtitle => 'PIN, ជីវមាត្រ, មុខងារ Vash';

  @override
  String get blockScreenshots => 'ទប់ស្កាត់ការថតអេក្រង់';

  @override
  String get transferDevice => 'ផ្ទេរទៅឧបករណ៍ផ្សេង';

  @override
  String get transferDeviceSubtitle => 'ផ្លាស់ប្តូរគណនីរបស់អ្នក';

  @override
  String get pinCode => 'លេខកូដ PIN';

  @override
  String get changePin => 'ប្តូរលេខកូដ PIN';

  @override
  String get currentPin => 'លេខកូដ PIN បច្ចុប្បន្ន';

  @override
  String get newPin => 'លេខកូដ PIN ថ្មី';

  @override
  String get confirmPin => 'បញ្ជាក់លេខកូដ PIN';

  @override
  String get pinChanged => 'លេខកូដ PIN បានផ្លាស់ប្តូរ';

  @override
  String get incorrectPin => 'PIN មិនត្រឹមត្រូវ';

  @override
  String get pinsDoNotMatch => 'PIN មិនដូចគ្នា';

  @override
  String get autoLock => 'ចាក់សោស្វ័យប្រវត្តិ';

  @override
  String get autoLockDelay => 'រយៈពេលចាក់សោ';

  @override
  String get autoLockImmediate => 'ភ្លាមៗ';

  @override
  String get autoLockMinute => '១ នាទី';

  @override
  String autoLockMinutes(int count) {
    return '$count នាទី';
  }

  @override
  String get vashCode => 'លេខកូដ Vash';

  @override
  String get vashModeTitle => 'មុខងារ Vash';

  @override
  String get vashModeExplanation => 'បណ្តាញសុវត្ថិភាពចុងក្រោយរបស់អ្នក។';

  @override
  String get vashModeDescription =>
      'អ្នកនឹងជ្រើសរើសលេខកូដ PIN ទីពីរ។ ប្រសិនបើអ្នកត្រូវបានបង្ខំឱ្យបើក Hash សូមបញ្ចូលលេខកូដនេះជំនួសឱ្យ PIN ធម្មតារបស់អ្នក។\n\nកម្មវិធីនឹងបើកធម្មតា ប៉ុន្តែការសន្ទនា និងទំនាក់ទំនងរបស់អ្នកទាំងអស់នឹងបាត់។\n\nសម្រាប់អ្នកណាម្នាក់ដែលមើលអេក្រង់របស់អ្នក Hash គ្រាន់តែបង្ហាញទទេ — ដូចជាអ្នកមិនធ្លាប់ប្រើវា។';

  @override
  String get vashModeIrreversible => 'សកម្មភាពនេះស្ងាត់ និងមិនអាចត្រឡប់វិញ។';

  @override
  String get chooseVashCode => 'ជ្រើសរើសលេខកូដ Vash របស់ខ្ញុំ';

  @override
  String get vashCodeInfo => 'លេខកូដ PIN ទីពីរដែលបើកកម្មវិធីធម្មតា ប៉ុន្តែទទេ។';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'ប្រសិនបើអ្នកបញ្ចូលលេខកូដនេះជំនួសឱ្យ PIN:';

  @override
  String get vashDeleteContacts => 'ទំនាក់ទំនងរបស់អ្នកបាត់';

  @override
  String get vashDeleteMessages => 'ការសន្ទនារបស់អ្នកបាត់';

  @override
  String get vashDeleteHistory => 'កំណត់ត្រារបស់អ្នកបាត់';

  @override
  String get vashKeepId => 'អត្តសញ្ញាណ Hash (#XXX-XXX-XXX) របស់អ្នកនៅដដែល';

  @override
  String get vashAppearNormal =>
      'កម្មវិធីបង្ហាញធម្មតាប៉ុន្តែទទេ ដូចថ្មី។ សកម្មភាពនេះមិនអាចត្រឡប់វិញ។';

  @override
  String get setupVashCode => 'រៀបចំលេខកូដ Vash';

  @override
  String get modifyVashCode => 'កែប្រែលេខកូដ Vash';

  @override
  String get currentVashCode => 'លេខកូដ Vash បច្ចុប្បន្ន';

  @override
  String get newVashCode => 'លេខកូដ Vash ថ្មី';

  @override
  String get confirmVashCode => 'បញ្ជាក់លេខកូដ Vash';

  @override
  String get vashCodeConfigured => 'លេខកូដ Vash បានកំណត់';

  @override
  String get vashCodeModified => 'លេខកូដ Vash បានកែប្រែ';

  @override
  String get vashCodeMustDiffer => 'លេខកូដ Vash ត្រូវតែខុសពី PIN';

  @override
  String get incorrectVashCode => 'លេខកូដ Vash មិនត្រឹមត្រូវ';

  @override
  String get vashWhatToDelete => 'តើមុខងារ Vash គួរលុបអ្វីខ្លះ?';

  @override
  String get vashDeleteContactsOption => 'ទំនាក់ទំនង';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'សារ';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'កំណត់ត្រា';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'មុខងារ Vash បានបើក';

  @override
  String get vashCreateSubtitle => 'ជ្រើសរើសលេខកូដខុសពី PIN ចម្បង';

  @override
  String get vashConfirmSubtitle => 'បញ្ជាក់លេខកូដ Vash របស់អ្នក';

  @override
  String get pinCodeForEntry => 'លេខកូដ PIN សម្រាប់ចូលកម្មវិធី';

  @override
  String get vashCodeSection => 'មុខងារ Vash';

  @override
  String get biometric => 'ជីវមាត្រ';

  @override
  String get biometricUnlock => 'ដោះសោដោយស្នាមម្រាមដៃ ឬ Face ID';

  @override
  String get enableBiometric => 'បើកជីវមាត្រ';

  @override
  String get biometricWarningMessage =>
      'ការបើកជីវមាត្រនឹងធ្វើឱ្យអ្នកមិនអាចប្រើលេខកូដ Vash ដើម្បីចូលកម្មវិធី។\n\nអ្នកអាចប្រើលេខកូដ Vash បានតែប្រសិនបើជីវមាត្របរាជ័យ (បន្ទាប់ពីការព្យាយាមបរាជ័យច្រើនដង)។\n\nតើអ្នកប្រាកដថាចង់បន្តទេ?';

  @override
  String get understood => 'ខ្ញុំយល់ហើយ';

  @override
  String get shareAppSubtitle => 'ចែករំលែក Hash ជាមួយមនុស្សជិតស្និទ្ធ';

  @override
  String get share => 'ចែករំលែក';

  @override
  String get danger => 'គ្រោះថ្នាក់';

  @override
  String get deleteAccount => 'លុបគណនីរបស់ខ្ញុំ';

  @override
  String get deleteAccountSubtitle => 'សកម្មភាពមិនអាចត្រឡប់វិញ';

  @override
  String get deleteAccountConfirmTitle => 'លុបគណនីរបស់ខ្ញុំ';

  @override
  String get deleteAccountConfirmMessage =>
      'គណនីរបស់អ្នកនឹងត្រូវលុបជាអចិន្ត្រៃយ៍។ សកម្មភាពនេះមិនអាចត្រឡប់វិញ។\n\n• ការជជែកទាំងអស់\n• ទំនាក់ទំនងទាំងអស់\n• Hash ID របស់អ្នក\n\nអ្នកនឹងត្រូវបង្កើតគណនីថ្មី។';

  @override
  String get deleteForever => 'លុបជាអចិន្ត្រៃយ៍';

  @override
  String get cancel => 'បោះបង់';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'មុខងារ Vash បានបើក។';

  @override
  String deletionError(String error) {
    return 'កំហុសក្នុងការលុប: $error';
  }

  @override
  String get yourSecurity => 'សុវត្ថិភាពរបស់អ្នក';

  @override
  String get securityInfo =>
      '• ការអ៊ិនគ្រីបពីចុងដល់ចុង (Signal Protocol)\n• គ្មានទិន្នន័យនៅលើម៉ាស៊ីនមេបន្ទាប់ពីការដឹកជញ្ជូន\n• កូនសោរក្សាតែនៅលើឧបករណ៍របស់អ្នក\n• លេខកូដ PIN មិនដែលផ្ញើទៅម៉ាស៊ីនមេ';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'សូមស្វាគមន៍';

  @override
  String get securityStatement1 => 'សាររបស់អ្នកត្រូវបានការពារ។';

  @override
  String get securityStatement2 => 'ការអ៊ិនគ្រីបពីចុងដល់ចុង។';

  @override
  String get securityStatement3 => 'គ្មានដាន។ គ្មានការសម្រុះសម្រួល។';

  @override
  String get securityStatement4 => 'ភាពឯកជនរបស់អ្នកគឺជាសិទ្ធិ។';

  @override
  String get accessBlocked => 'ការចូលត្រូវបានបិទ';

  @override
  String get tooManyAttempts => 'ការព្យាយាមច្រើនពេក។ ព្យាយាមម្តងទៀតពេលក្រោយ។';

  @override
  String get pleaseWait => 'សូមរង់ចាំ';

  @override
  String get waitDelay => 'សូមរង់ចាំឱ្យរយៈពេលបញ្ចប់';

  @override
  String attemptCount(int current, int max) {
    return 'ការព្យាយាម $current នៃ $max';
  }

  @override
  String retryIn(String time) {
    return 'ព្យាយាមម្តងទៀតក្នុង $time';
  }

  @override
  String get forgotPin => 'ភ្លេច PIN? ប្រើឃ្លាសង្គ្រោះ';

  @override
  String get useRecoveryPhrase => 'ប្រើឃ្លាសង្គ្រោះ';

  @override
  String get recoveryWarningTitle => 'ការព្រមាន';

  @override
  String get recoveryWarningMessage => 'ការសង្គ្រោះគណនីនឹង:';

  @override
  String get recoveryDeleteAllMessages => 'លុបសារទាំងអស់របស់អ្នក';

  @override
  String get recoveryWaitDelay => 'ទាមទាររយៈពេលរង់ចាំ ១ ម៉ោង';

  @override
  String get recoveryKeepContacts => 'រក្សាទំនាក់ទំនងរបស់អ្នក';

  @override
  String get recoveryIrreversible =>
      'សកម្មភាពនេះមិនអាចត្រឡប់វិញ។ សាររបស់អ្នកនឹងបាត់បង់ជារៀងរហូត។';

  @override
  String get iUnderstand => 'ខ្ញុំយល់';

  @override
  String get accountRecovery => 'ការសង្គ្រោះគណនី';

  @override
  String get enterRecoveryPhrase =>
      'បញ្ចូលពាក្យ ២៤ នៃឃ្លាសង្គ្រោះរបស់អ្នក ដាក់ដោយចន្លោះ។';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'សង្គ្រោះ';

  @override
  String get recoveryPhraseRequired => 'សូមបញ្ចូលឃ្លាសង្គ្រោះរបស់អ្នក';

  @override
  String get recoveryPhrase24Words => 'ឃ្លាត្រូវមានពាក្យ ២៤ ពិតប្រាកដ';

  @override
  String get incorrectRecoveryPhrase => 'ឃ្លាសង្គ្រោះមិនត្រឹមត្រូវ';

  @override
  String get recoveryInitError => 'កំហុសក្នុងការចាប់ផ្តើមការសង្គ្រោះ';

  @override
  String get securityDelay => 'រយៈពេលសុវត្ថិភាព';

  @override
  String get securityDelayMessage =>
      'សម្រាប់សុវត្ថិភាពរបស់អ្នក ត្រូវការរយៈពេលរង់ចាំមុនពេលអ្នកអាចបង្កើត PIN ថ្មី។';

  @override
  String get timeRemaining => 'ពេលវេលានៅសល់';

  @override
  String get messagesDeletedForProtection =>
      'សាររបស់អ្នកត្រូវបានលុបដើម្បីការពាររបស់អ្នក។';

  @override
  String get canCloseApp => 'អ្នកអាចបិទកម្មវិធី ហើយត្រឡប់មកវិញពេលក្រោយ។';

  @override
  String get onboardingTitle1 => 'សូមស្វាគមន៍មកកាន់ Hash';

  @override
  String get onboardingSubtitle1 => 'កម្មវិធីផ្ញើសារដែលមិនទុកដាន';

  @override
  String get onboardingTitle2 => 'ការអ៊ិនគ្រីបពេញលេញ';

  @override
  String get onboardingSubtitle2 =>
      'សាររបស់អ្នកត្រូវបានអ៊ិនគ្រីបពីចុងដល់ចុងជាមួយ Signal Protocol';

  @override
  String get onboardingTitle3 => 'គ្មានដាន';

  @override
  String get onboardingSubtitle3 => 'សារត្រូវបានលុបពីម៉ាស៊ីនមេនៅពេលដឹកជញ្ជូន';

  @override
  String get onboardingTitle4 => 'សុវត្ថិភាពរបស់អ្នក';

  @override
  String get onboardingSubtitle4 => 'លេខកូដ PIN, មុខងារ Vash និងឃ្លាសង្គ្រោះ';

  @override
  String get getStarted => 'ចាប់ផ្តើម';

  @override
  String get next => 'បន្ទាប់';

  @override
  String get skip => 'រំលង';

  @override
  String get alreadyHaveAccount => 'ខ្ញុំមានគណនីរួចហើយ';

  @override
  String get transferMyAccount => 'ផ្ទេរគណនីរបស់ខ្ញុំ';

  @override
  String get createPin => 'បង្កើតលេខកូដ PIN';

  @override
  String get createPinSubtitle =>
      'លេខកូដនេះនឹងការពារការចូលប្រើកម្មវិធីរបស់អ្នក';

  @override
  String get confirmYourPin => 'បញ្ជាក់លេខកូដ PIN របស់អ្នក';

  @override
  String get confirmPinSubtitle => 'បញ្ចូលលេខកូដ PIN របស់អ្នកម្តងទៀត';

  @override
  String get saveRecoveryPhrase => 'ឃ្លាសង្គ្រោះ';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'កត់ពាក្យ ២៤ នេះតាមលំដាប់។ វានឹងអនុញ្ញាតឱ្យអ្នកសង្គ្រោះគណនីប្រសិនបើអ្នកភ្លេច PIN។';

  @override
  String get phraseWritten => 'ខ្ញុំបានកត់ឃ្លារបស់ខ្ញុំ';

  @override
  String get warningRecoveryPhrase =>
      'ប្រសិនបើអ្នកបាត់ឃ្លានេះ ហើយភ្លេច PIN អ្នកនឹងបាត់បង់ការចូលប្រើគណនី។';

  @override
  String get accountTransferred => 'គណនីបានផ្ទេរ';

  @override
  String get accountTransferredMessage =>
      'គណនីរបស់អ្នកត្រូវបានផ្ទេរទៅឧបករណ៍ផ្សេង។ វគ្គនេះលែងមានសុពលភាព។';

  @override
  String get accountTransferredInfo =>
      'ប្រសិនបើអ្នកមិនបានផ្តួចផ្តើមការផ្ទេរនេះ គណនីរបស់អ្នកប្រហែលជាត្រូវបានសម្រុះសម្រួល។';

  @override
  String get logout => 'ចាកចេញ';

  @override
  String get transferAccount => 'ផ្ទេរគណនី';

  @override
  String get transferAccountInfo =>
      'ផ្ទេរគណនី Hash របស់អ្នកទៅឧបករណ៍ថ្មី។ វគ្គបច្ចុប្បន្នរបស់អ្នកនឹងត្រូវបានបោះបង់។';

  @override
  String get generateTransferCode => 'បង្កើតលេខកូដផ្ទេរ';

  @override
  String get transferCode => 'លេខកូដផ្ទេរ';

  @override
  String transferCodeExpires(int minutes) {
    return 'លេខកូដនេះផុតកំណត់ក្នុង $minutes នាទី';
  }

  @override
  String get enterCodeOnNewDevice =>
      'បញ្ចូលលេខកូដនេះនៅលើឧបករណ៍ថ្មីរបស់អ្នកដើម្បីផ្ទេរគណនី។';

  @override
  String get generateNewCode => 'បង្កើតលេខកូដថ្មី';

  @override
  String get scanQrCode => 'ស្កេន QR code';

  @override
  String get scanQrCodeSubtitle =>
      'ស្កេន QR code របស់ទំនាក់ទំនងដើម្បីបន្ថែមពួកគេ';

  @override
  String get qrCodeDetected => 'រកឃើញ QR code';

  @override
  String get invalidQrCode => 'QR code មិនត្រឹមត្រូវ';

  @override
  String get cameraPermissionRequired => 'ត្រូវការការអនុញ្ញាតកាមេរ៉ា';

  @override
  String get myQrCode => 'QR code របស់ខ្ញុំ';

  @override
  String get myQrCodeSubtitle =>
      'ចែករំលែក QR code នេះដើម្បីឱ្យទំនាក់ទំនងអាចបន្ថែមអ្នក';

  @override
  String get shareQrCode => 'ចែករំលែក';

  @override
  String get addContactTitle => 'បន្ថែមទំនាក់ទំនង';

  @override
  String get addContactByHashId => 'បញ្ចូល Hash ID របស់ទំនាក់ទំនង';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'ស្វែងរក';

  @override
  String get contactNotFound => 'រកមិនឃើញទំនាក់ទំនង';

  @override
  String get contactAlreadyAdded =>
      'ទំនាក់ទំនងនេះមាននៅក្នុងបញ្ជីរបស់អ្នករួចហើយ';

  @override
  String get contactAdded => 'បានបន្ថែមទំនាក់ទំនង';

  @override
  String get myProfile => 'ប្រវត្តិរូបរបស់ខ្ញុំ';

  @override
  String get myProfileSubtitle =>
      'ចែករំលែកព័ត៌មាននេះដើម្បីឱ្យអ្នកដ៏ទៃអាចបន្ថែមអ្នក';

  @override
  String get temporaryCode => 'លេខកូដបណ្តោះអាសន្ន';

  @override
  String temporaryCodeExpires(String time) {
    return 'ផុតកំណត់ក្នុង $time';
  }

  @override
  String get codeExpired => 'លេខកូដផុតកំណត់';

  @override
  String get generateNewCodeButton => 'លេខកូដថ្មី';

  @override
  String get copyHashId => 'ចម្លង ID';

  @override
  String get copyCode => 'ចម្លងលេខកូដ';

  @override
  String get copiedToClipboard => 'បានចម្លង';

  @override
  String get showMyQrCode => 'បង្ហាញ QR code របស់ខ្ញុំ';

  @override
  String get orDivider => 'ឬ';

  @override
  String get openScanner => 'បើកម៉ាស៊ីនស្កេន';

  @override
  String get addManually => 'បន្ថែមដោយដៃ';

  @override
  String get contactHashIdLabel => 'Hash ID របស់ទំនាក់ទំនង';

  @override
  String get temporaryCodeLabel => 'លេខកូដបណ្តោះអាសន្ន';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'សុំឱ្យទំនាក់ទំនងរបស់អ្នកបង្កើតលេខកូដពីប្រវត្តិរូបរបស់ពួកគេ';

  @override
  String get verifyAndAdd => 'ផ្ទៀងផ្ទាត់ និងបន្ថែម';

  @override
  String get fillAllFields => 'សូមបំពេញគ្រប់វាល';

  @override
  String get invalidHashIdFormat => 'ទម្រង់ ID មិនត្រឹមត្រូវ (ឧ: 123-456-ABC)';

  @override
  String get userNotFound => 'រកមិនឃើញអ្នកប្រើ';

  @override
  String get cannotAddYourself => 'អ្នកមិនអាចបន្ថែមខ្លួនឯង';

  @override
  String get invalidOrExpiredCode =>
      'លេខកូដបណ្តោះអាសន្នមិនត្រឹមត្រូវ ឬផុតកំណត់';

  @override
  String get contactFound => 'រកឃើញទំនាក់ទំនង!';

  @override
  String get howToCallContact => 'តើអ្នកចង់ហៅពួកគេអ្វី?';

  @override
  String get contactNameHint => 'ឈ្មោះទំនាក់ទំនង';

  @override
  String get addContactButton => 'បន្ថែម';

  @override
  String get contactDetails => 'ព័ត៌មានទំនាក់ទំនង';

  @override
  String get contactName => 'ឈ្មោះទំនាក់ទំនង';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'បានបន្ថែមនៅ $date';
  }

  @override
  String get deleteContact => 'លុបទំនាក់ទំនង';

  @override
  String deleteContactConfirm(Object name) {
    return 'លុបទំនាក់ទំនងនេះ?';
  }

  @override
  String get deleteContactMessage => 'សកម្មភាពនេះនឹងលុបការជជែកទាំងមូលផងដែរ។';

  @override
  String get delete => 'លុប';

  @override
  String get typeMessage => 'វាយសារ...';

  @override
  String get messageSent => 'បានផ្ញើ';

  @override
  String get messageDelivered => 'បានទទួល';

  @override
  String get messageRead => 'បានអាន';

  @override
  String get messageFailed => 'ការផ្ញើបរាជ័យ';

  @override
  String get now => 'ឥឡូវ';

  @override
  String minutesAgo(int count) {
    return '$countនាទី';
  }

  @override
  String hoursAgo(int count) {
    return '$countម៉ោង';
  }

  @override
  String daysAgo(int count) {
    return '$countថ្ងៃ';
  }

  @override
  String get today => 'ថ្ងៃនេះ';

  @override
  String get yesterday => 'ម្សិលមិញ';

  @override
  String dateAtTime(String date, String time) {
    return '$date វេលា $time';
  }

  @override
  String get shareMessage =>
      'ចូលរួមជាមួយខ្ញុំនៅលើ Hash!\n\nវាជាកម្មវិធីផ្ញើសារឯកជនពិតប្រាកដ: ការអ៊ិនគ្រីបពេញលេញ គ្មានដាននៅលើម៉ាស៊ីនមេ និងមុខងារបន្ទាន់បើត្រូវការ។\n\nទាញយកកម្មវិធីនៅទីនេះ\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'កំហុស';

  @override
  String get ok => 'យល់ព្រម';

  @override
  String get view => 'មើល';

  @override
  String get yes => 'បាទ/ចាស';

  @override
  String get no => 'ទេ';

  @override
  String get save => 'រក្សាទុក';

  @override
  String get edit => 'កែសម្រួល';

  @override
  String get close => 'បិទ';

  @override
  String get confirm => 'បញ្ជាក់';

  @override
  String get loading => 'កំពុងផ្ទុក...';

  @override
  String get retry => 'ព្យាយាមម្តងទៀត';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'សំណើកំពុងរង់ចាំ';

  @override
  String get noPendingRequests => 'គ្មានសំណើកំពុងរង់ចាំ';

  @override
  String get pendingRequestsSubtitle => 'មនុស្សទាំងនេះចង់បន្ថែមអ្នក';

  @override
  String requestFromUser(String hashId) {
    return 'សំណើពី $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'ផុតកំណត់ក្នុង $days ថ្ងៃ';
  }

  @override
  String get acceptRequest => 'ទទួលយក';

  @override
  String get rejectRequest => 'បដិសេធ';

  @override
  String get requestAccepted => 'សំណើបានទទួលយក';

  @override
  String get requestRejected => 'សំណើបានបដិសេធ';

  @override
  String get requestSent => 'សំណើបានផ្ញើ!';

  @override
  String get requestSentSubtitle =>
      'សំណើរបស់អ្នកត្រូវបានផ្ញើ។ អ្នកប្រើត្រូវទទួលយកវាមុនពេលអ្នកអាចជជែក។';

  @override
  String get requestAlreadyPending => 'សំណើកំពុងរង់ចាំរួចហើយ';

  @override
  String get requestAlreadySentByOther => 'បុគ្គលនេះបានផ្ញើសំណើដល់អ្នករួចហើយ';

  @override
  String get addByHashId => 'បន្ថែមដោយ Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'បញ្ចូល Hash ID និងលេខកូដបណ្តោះអាសន្នរបស់ទំនាក់ទំនង';

  @override
  String get enterTemporaryCode => 'បញ្ចូលលេខកូដ ៦ ខ្ទង់';

  @override
  String get sendRequest => 'ផ្ញើសំណើ';

  @override
  String get acceptContactTitle => 'ទទួលយកទំនាក់ទំនង';

  @override
  String get acceptContactSubtitle => 'អ្នកអាចដាក់ឈ្មោះផ្ទាល់ខ្លួន';

  @override
  String get leaveEmptyForHashId => 'ទុកទទេដើម្បីប្រើ Hash ID';

  @override
  String get firstName => 'នាមខ្លួន';

  @override
  String get lastName => 'នាមត្រកូល';

  @override
  String get notes => 'កំណត់ត្រា';

  @override
  String get notesHint => 'កំណត់ត្រាផ្ទាល់ខ្លួនអំពីទំនាក់ទំនងនេះ';

  @override
  String get photoOptional => 'រូបថត (ជាជម្រើស)';

  @override
  String get contactNameOptional => 'ឈ្មោះ (ជាជម្រើស)';

  @override
  String get notesOptional => 'កំណត់ត្រា (ជាជម្រើស)';

  @override
  String get storedLocally => 'រក្សាទុកនៅលើឧបករណ៍របស់អ្នកតែប៉ុណ្ណោះ';

  @override
  String get encryptedMessageLabel => 'សារអ៊ិនគ្រីប';

  @override
  String get identityMessageHint => 'អ្នកជានរណា? អ្នកស្គាល់គ្នាដោយរបៀបណា?';

  @override
  String get messageWillBeSentEncrypted =>
      'សារនេះនឹងត្រូវបានអ៊ិនគ្រីប និងផ្ញើទៅអ្នកទទួល';

  @override
  String get sendRequestButton => 'ផ្ញើសំណើ';

  @override
  String get requestExpiresIn24h =>
      'សំណើផុតកំណត់ក្នុង ២៤ ម៉ោងប្រសិនបើមិនទទួលយក';

  @override
  String get theyAlreadySentYouRequest => 'បុគ្គលនេះបានផ្ញើសំណើដល់អ្នករួចហើយ';

  @override
  String get requests => 'សំណើ';

  @override
  String get receivedRequests => 'បានទទួល';

  @override
  String get sentRequests => 'បានផ្ញើ';

  @override
  String get noSentRequests => 'គ្មានសំណើបានផ្ញើ';

  @override
  String get cancelRequest => 'បោះបង់';

  @override
  String get deleteRequest => 'លុបសំណើ';

  @override
  String get requestCancelled => 'សំណើបានបោះបង់';

  @override
  String sentTo(String hashId) {
    return 'ផ្ញើទៅ $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'ផុតកំណត់ក្នុង $time';
  }

  @override
  String receivedAgo(String time) {
    return 'ទទួលបាន $time មុន';
  }

  @override
  String get messageFromRequester => 'សារពីអ្នកស្នើ';

  @override
  String get copy => 'ចម្លង';

  @override
  String get messageInfo => 'ព័ត៌មានសារ';

  @override
  String get messageDirection => 'ទិសដៅ';

  @override
  String get messageSentByYou => 'ផ្ញើដោយអ្នក';

  @override
  String get messageReceived => 'បានទទួល';

  @override
  String get messageSentAt => 'ផ្ញើនៅ';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'ស្ថានភាព';

  @override
  String get messageReadAt => 'អាននៅ';

  @override
  String get messageType => 'ប្រភេទ';

  @override
  String get messageSize => 'ទំហំ';

  @override
  String get messageExpiresAt => 'ផុតកំណត់នៅ';

  @override
  String get messageEncrypted => 'អ៊ិនគ្រីបពីចុងដល់ចុង';

  @override
  String get messageStatusSending => 'កំពុងផ្ញើ...';

  @override
  String get messageStatusSent => 'បានផ្ញើ';

  @override
  String get messageStatusDelivered => 'បានទទួល';

  @override
  String get messageStatusRead => 'បានអាន';

  @override
  String get messageStatusFailed => 'បរាជ័យ';

  @override
  String get serverStatus => 'ម៉ាស៊ីនមេ';

  @override
  String get onServer => 'កំពុងរង់ចាំដឹកជញ្ជូន';

  @override
  String get deletedFromServer => 'បានលុប';

  @override
  String get messageTypeText => 'អត្ថបទ';

  @override
  String get messageTypeImage => 'រូបភាព';

  @override
  String get messageTypeVideo => 'វីដេអូ';

  @override
  String get messageTypeVoice => 'សំឡេង';

  @override
  String get messageTypeFile => 'ឯកសារ';

  @override
  String get indefinitely => 'គ្មានកំណត់';

  @override
  String get hoursShort => 'ម៉ោង';

  @override
  String get minutesShort => 'នាទី';

  @override
  String get hours => 'ម៉ោង';

  @override
  String get minutes => 'នាទី';

  @override
  String get seconds => 'វិនាទី';

  @override
  String get ephemeralMessages => 'សារបណ្តោះអាសន្ន';

  @override
  String get ephemeralMessagesDescription =>
      'សារត្រូវបានលុបដោយស្វ័យប្រវត្តិបន្ទាប់ពីរយៈពេលនេះ';

  @override
  String get ephemeralImmediate => 'ភ្លាមៗ (បន្ទាប់ពីអាន)';

  @override
  String get ephemeralImmediateDesc => 'លុបភ្លាមៗពេលអាន';

  @override
  String get ephemeralMyPreference => 'ចំណូលចិត្តរបស់ខ្ញុំ';

  @override
  String get ephemeralMyPreferenceDesc => 'ប្រើការកំណត់សកល';

  @override
  String get ephemeralDefaultSetting => 'រយៈពេលសារ';

  @override
  String get ephemeralChooseDefault => 'ណែនាំ';

  @override
  String get ephemeral30Seconds => '៣០ វិនាទី';

  @override
  String get ephemeral30SecondsDesc => 'លុប ៣០ វិនាទីបន្ទាប់ពីអាន';

  @override
  String get ephemeral5Minutes => '៥ នាទី';

  @override
  String get ephemeral5MinutesDesc => 'លុប ៥ នាទីបន្ទាប់ពីអាន';

  @override
  String get ephemeral1Hour => '១ ម៉ោង';

  @override
  String get ephemeral1HourDesc => 'លុប ១ ម៉ោងបន្ទាប់ពីអាន';

  @override
  String get ephemeral3Hours => '៣ ម៉ោង';

  @override
  String get ephemeral6Hours => '៦ ម៉ោង';

  @override
  String get ephemeral6HoursDesc => 'លុប ៦ ម៉ោងបន្ទាប់ពីអាន';

  @override
  String get ephemeral12Hours => '១២ ម៉ោង';

  @override
  String get ephemeral24Hours => '២៤ ម៉ោង';

  @override
  String get ephemeral24HoursDesc => 'លុប ២៤ ម៉ោងបន្ទាប់ពីអាន';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'រយៈពេលផ្ទាល់ខ្លួន';

  @override
  String get howItWorks => 'របៀបដែលវាដំណើរការ';

  @override
  String get ephemeralExplanation1 => 'សារត្រូវបានលុបពីម៉ាស៊ីនមេភ្លាមៗពេលទទួល។';

  @override
  String get ephemeralExplanation2 =>
      'ការកំណត់នេះកំណត់ពេលដែលសារបាត់ពីទូរស័ព្ទអ្នកបន្ទាប់ពីអាន។';

  @override
  String get ephemeralExplanation3 =>
      'ទំនាក់ទំនងរបស់អ្នកមានការកំណត់ផ្ទាល់ខ្លួនសម្រាប់ទូរស័ព្ទរបស់ពួកគេ។';

  @override
  String get mute1Hour => '១ ម៉ោង';

  @override
  String get mute8Hours => '៨ ម៉ោង';

  @override
  String get mute1Day => '១ ថ្ងៃ';

  @override
  String get mute1Week => '១ សប្តាហ៍';

  @override
  String get muteAlways => 'តែងតែ';

  @override
  String get muteExplanation => 'អ្នកនឹងមិនទទួលការជូនដំណឹងសម្រាប់ទំនាក់ទំនងនេះ';

  @override
  String get showCallsInRecents => 'បង្ហាញក្នុងការហៅថ្មីៗ';

  @override
  String get showCallsInRecentsSubtitle =>
      'ការហៅ Hash បង្ហាញក្នុងប្រវត្តិទូរស័ព្ទ';

  @override
  String get feedback => 'មតិកែលម្អ';

  @override
  String get muteNotifications => 'បិទសំឡេងការជូនដំណឹង';

  @override
  String get muteDescription => 'អ្នកនឹងមិនទទួលការជូនដំណឹងសម្រាប់ទំនាក់ទំនងនេះ';

  @override
  String mutedUntil(String time) {
    return 'បិទសំឡេងរហូតដល់ $time';
  }

  @override
  String get notMuted => 'ការជូនដំណឹងបានបើក';

  @override
  String get unmute => 'បើកសំឡេងវិញ';

  @override
  String get notificationSound => 'សំឡេងការជូនដំណឹង';

  @override
  String get defaultSound => 'លំនាំដើម';

  @override
  String get chatSettings => 'ការកំណត់ការជជែក';

  @override
  String get bubbleColor => 'ពណ៌បាឡុង';

  @override
  String get backgroundColor => 'ពណ៌ផ្ទៃខាងក្រោយ';

  @override
  String get backgroundImage => 'រូបភាពផ្ទៃខាងក្រោយ';

  @override
  String get chatBackground => 'ផ្ទៃខាងក្រោយការជជែក';

  @override
  String get customColor => 'ផ្ទាល់ខ្លួន';

  @override
  String get defaultColor => 'លំនាំដើម';

  @override
  String get imageSelected => 'រូបភាពបានជ្រើសរើស';

  @override
  String get noImage => 'គ្មានរូបភាព';

  @override
  String get color => 'ពណ៌';

  @override
  String get image => 'រូបភាព';

  @override
  String get tapToSelectImage => 'ចុចដើម្បីជ្រើសរើសរូបភាព';

  @override
  String get changeImage => 'ប្តូររូបភាព';

  @override
  String get previewMessageReceived => 'សួស្តី!';

  @override
  String get previewMessageSent => 'ជំរាបសួរ!';

  @override
  String get messageAction => 'សារ';

  @override
  String get callAction => 'ហៅ';

  @override
  String get videoAction => 'វីដេអូ';

  @override
  String get personalNotes => 'កំណត់ត្រាផ្ទាល់ខ្លួន';

  @override
  String get addNotes => 'បន្ថែមកំណត់ត្រា...';

  @override
  String get noNotes => 'គ្មានកំណត់ត្រា';

  @override
  String get messageNotifications => 'ការជូនដំណឹងសារ';

  @override
  String get callNotifications => 'ការជូនដំណឹងការហៅ';

  @override
  String get useGradient => 'ប្រើពណ៌ជម្រាល';

  @override
  String get gradientStart => 'ពណ៌ចាប់ផ្តើម';

  @override
  String get gradientEnd => 'ពណ៌បញ្ចប់';

  @override
  String get preview => 'មើលជាមុន';

  @override
  String get reset => 'កំណត់ឡើងវិញ';

  @override
  String get securityNumber => 'លេខសុវត្ថិភាព';

  @override
  String securityNumberDescription(String name) {
    return 'ផ្ទៀងផ្ទាត់ថាលេខសុវត្ថិភាពត្រូវគ្នាជាមួយឧបករណ៍របស់ $name';
  }

  @override
  String get verifyEncryption => 'ផ្ទៀងផ្ទាត់ការអ៊ិនគ្រីបពីចុងដល់ចុង';

  @override
  String get tapToCopy => 'ចុចដើម្បីចម្លង';

  @override
  String get howToVerify => 'របៀបផ្ទៀងផ្ទាត់';

  @override
  String get verifyStep1 => 'ជួបទំនាក់ទំនងដោយផ្ទាល់ ឬហៅពួកគេ';

  @override
  String get verifyStep2 => 'ប្រៀបធៀបលេខសុវត្ថិភាព ឬស្កេន QR code';

  @override
  String get verifyStep3 => 'ប្រសិនបើវាត្រូវគ្នា ការជជែករបស់អ្នកមានសុវត្ថិភាព';

  @override
  String get scanToVerify => 'ស្កេនដើម្បីផ្ទៀងផ្ទាត់';

  @override
  String get reportSpam => 'រាយការណ៍ spam';

  @override
  String get reportSpamSubtitle => 'រាយការណ៍ទំនាក់ទំនងនេះជា spam';

  @override
  String get reportSpamDescription =>
      'ទំនាក់ទំនងនេះនឹងត្រូវបានរាយការណ៍ដោយអនាមិក។ អត្តសញ្ញាណរបស់អ្នកនឹងមិនត្រូវបានចែករំលែក។ តើអ្នកប្រាកដទេ?';

  @override
  String get report => 'រាយការណ៍';

  @override
  String get spamReported => 'Spam បានរាយការណ៍';

  @override
  String get reportError => 'ការផ្ញើរបាយការណ៍បរាជ័យ។ សូមព្យាយាមម្តងទៀត។';

  @override
  String get reportRateLimited =>
      'អ្នកបានឈានដល់ចំនួនអតិបរមានៃរបាយការណ៍សម្រាប់ថ្ងៃនេះ។';

  @override
  String get blockContact => 'រារាំងទំនាក់ទំនង';

  @override
  String get blockContactDescription =>
      'ទំនាក់ទំនងនេះនឹងមិនអាចផ្ញើសារ ឬហៅអ្នកទៀត។ ពួកគេនឹងមិនត្រូវបានជូនដំណឹង។';

  @override
  String get unblockContact => 'ដោះរារាំងទំនាក់ទំនង';

  @override
  String get unblockContactDescription =>
      'ទំនាក់ទំនងនេះនឹងអាចផ្ញើសារ និងហៅអ្នកម្តងទៀត។';

  @override
  String get contactBlocked => 'ទំនាក់ទំនងត្រូវបានរារាំង';

  @override
  String get contactUnblocked => 'ទំនាក់ទំនងត្រូវបានដោះរារាំង';

  @override
  String get contactIsBlocked => 'ទំនាក់ទំនងនេះត្រូវបានរារាំង';

  @override
  String get unblock => 'ដោះរារាំង';

  @override
  String get deleteContactSubtitle => 'លុបទំនាក់ទំនង និងការជជែកនេះ';

  @override
  String get confirmWithPin => 'បញ្ជាក់ជាមួយ PIN';

  @override
  String get enterPinToConfirm => 'បញ្ចូល PIN របស់អ្នកដើម្បីបញ្ជាក់សកម្មភាពនេះ';

  @override
  String get profilePhoto => 'រូបថតប្រវត្តិរូប';

  @override
  String get takePhoto => 'ថតរូប';

  @override
  String get chooseFromGallery => 'ជ្រើសរើសពីវិចិត្រសាល';

  @override
  String get removePhoto => 'ដករូបថត';

  @override
  String get viewContactHashId => 'មើលអត្តសញ្ញាណទំនាក់ទំនង';

  @override
  String get hashIdPartiallyMasked =>
      'លាក់ដោយផ្នែកសម្រាប់សុវត្ថិភាពរបស់អ្នក និងភាពឯកជនរបស់ទំនាក់ទំនង';

  @override
  String get addFirstContact => 'បន្ថែមទំនាក់ទំនងដំបូងរបស់អ្នក';

  @override
  String get addFirstContactSubtitle =>
      'ចែករំលែក QR code របស់អ្នក ឬស្កេនរបស់មិត្តភ័ក្តិ';

  @override
  String get directory => 'បញ្ជីទំនាក់ទំនង';

  @override
  String get noContacts => 'គ្មានទំនាក់ទំនង';

  @override
  String get noContactsSubtitle => 'បន្ថែមទំនាក់ទំនងដើម្បីចាប់ផ្តើម';

  @override
  String get sendMessageAction => 'ផ្ញើសារ';

  @override
  String get audioCall => 'ការហៅសំឡេង';

  @override
  String get videoCall => 'ការហៅវីដេអូ';

  @override
  String get viewProfile => 'មើលប្រវត្តិរូប';

  @override
  String get deleteContactDirectory => 'លុបទំនាក់ទំនង';

  @override
  String get scanShort => 'ស្កេន';

  @override
  String get addShort => 'បន្ថែម';

  @override
  String deleteContactConfirmName(String name) {
    return 'តើអ្នកប្រាកដថាចង់លុប $name?';
  }

  @override
  String get noNotesTitle => 'គ្មានកំណត់ត្រា';

  @override
  String get noNotesSubtitle => 'បង្កើតកំណត់ត្រាដំបូងរបស់អ្នក';

  @override
  String get newNote => 'កំណត់ត្រាថ្មី';

  @override
  String get editNote => 'កែកំណត់ត្រា';

  @override
  String get deleteNote => 'លុបកំណត់ត្រា';

  @override
  String get deleteNoteConfirm => 'តើអ្នកប្រាកដថាចង់លុបកំណត់ត្រានេះ?';

  @override
  String get noteTitle => 'ចំណងជើង';

  @override
  String get noteContent => 'មាតិកា';

  @override
  String get addItem => 'បន្ថែមធាតុ';

  @override
  String get pinNote => 'ខ្ទាស់';

  @override
  String get unpinNote => 'ដោះខ្ទាស់';

  @override
  String get noteColor => 'ពណ៌';

  @override
  String get notePassword => 'ពាក្យសម្ងាត់';

  @override
  String get setPassword => 'កំណត់ពាក្យសម្ងាត់';

  @override
  String get changePassword => 'ប្តូរពាក្យសម្ងាត់';

  @override
  String get removePassword => 'ដកពាក្យសម្ងាត់';

  @override
  String get enterPassword => 'បញ្ចូលពាក្យសម្ងាត់';

  @override
  String get confirmPassword => 'បញ្ជាក់ពាក្យសម្ងាត់';

  @override
  String get passwordPin => 'លេខកូដ PIN';

  @override
  String get passwordText => 'ពាក្យសម្ងាត់អត្ថបទ';

  @override
  String get protectedNote => 'កំណត់ត្រាការពារ';

  @override
  String get incorrectPassword => 'ពាក្យសម្ងាត់មិនត្រឹមត្រូវ';

  @override
  String get passwordSet => 'បានកំណត់ពាក្យសម្ងាត់';

  @override
  String get passwordRemoved => 'បានដកពាក្យសម្ងាត់';

  @override
  String get notesBiometric => 'Face ID សម្រាប់កំណត់ត្រា';

  @override
  String get notesBiometricSubtitle =>
      'ទាមទារការផ្ទៀងផ្ទាត់ជីវមាត្រដើម្បីបើកកំណត់ត្រាការពារ';

  @override
  String get textNote => 'កំណត់ត្រាអត្ថបទ';

  @override
  String get checklistNote => 'បញ្ជីត្រួតពិនិត្យ';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total កិច្ចការ';
  }

  @override
  String get autoSaved => 'បានរក្សាទុក';

  @override
  String get searchNotes => 'ស្វែងរកកំណត់ត្រា';

  @override
  String get legalConsent => 'ការយល់ព្រមផ្នែកច្បាប់';

  @override
  String get confirmAge13 => 'ខ្ញុំបញ្ជាក់ថាខ្ញុំមានអាយុយ៉ាងតិច ១៣ ឆ្នាំ';

  @override
  String get acceptLegalStart => 'ខ្ញុំយល់ព្រមនឹង ';

  @override
  String get privacyPolicy => 'គោលការណ៍ភាពឯកជន';

  @override
  String get termsOfService => 'លក្ខខណ្ឌប្រើប្រាស់';

  @override
  String get andThe => ' និង ';

  @override
  String get continueButton => 'បន្ត';

  @override
  String get mustAcceptTerms => 'អ្នកត្រូវយល់ព្រមនឹងលក្ខខណ្ឌទាំងពីរដើម្បីបន្ត';

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
  String get support => 'ជំនួយ';

  @override
  String get contactSupport => 'ទាក់ទងជំនួយ';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'រាយការណ៍ការរំលោភបំពាន';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'ផ្នែកច្បាប់';

  @override
  String get legalEntity => 'អង្គភាពច្បាប់';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'ខ្ទាស់';

  @override
  String get unpinConversation => 'ដោះខ្ទាស់';

  @override
  String get hideConversation => 'ដកចេញពីបញ្ជី';

  @override
  String get deleteConversation => 'លុបការសន្ទនា';

  @override
  String get deleteConversationConfirm =>
      'បញ្ចូល PIN របស់អ្នកដើម្បីបញ្ជាក់ការលុបសារទាំងអស់';

  @override
  String get noConversations => 'គ្មានការសន្ទនានៅឡើយ';

  @override
  String get startConversation => 'ចាប់ផ្តើម';

  @override
  String get microphonePermissionRequired => 'ត្រូវការការអនុញ្ញាតមីក្រូហ្វូន';

  @override
  String get microphonePermissionExplanation =>
      'Hash ត្រូវការមីក្រូហ្វូនដើម្បីធ្វើការហៅ។';

  @override
  String get cameraPermissionExplanation =>
      'Hash ត្រូវការកាមេរ៉ាសម្រាប់ការហៅវីដេអូ។';

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
  String get openSettings => 'បើកការកំណត់';

  @override
  String get callConnecting => 'កំពុងភ្ជាប់...';

  @override
  String get callRinging => 'កំពុងរោទ៍...';

  @override
  String get callReconnecting => 'កំពុងភ្ជាប់ឡើងវិញ...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'កំពុងភ្ជាប់ឡើងវិញ ($secondsវិ)';
  }

  @override
  String get callPaused => 'ផ្អាក';

  @override
  String get callPausedSubtitle => 'ការហៅទូរសព្ទនៅតែបន្ត';

  @override
  String get callRemoteMicMuted => 'មីក្រូហ្វូនរបស់ទំនាក់ទំនងត្រូវបានបិទ';

  @override
  String get callMiniControlsMute => 'បិទសំឡេង';

  @override
  String get callMiniControlsUnmute => 'បើកសំឡេង';

  @override
  String get callMiniControlsHangUp => 'ដាក់ចុះ';

  @override
  String get callMiniControlsReturn => 'ត្រឡប់ទៅការហៅ';

  @override
  String get callNetworkPoor => 'ការតភ្ជាប់មិនស្ថិតស្ថេរ';

  @override
  String get callNetworkLost => 'បាត់បង់ការតភ្ជាប់';

  @override
  String get callEndedTitle => 'ការហៅបានបញ្ចប់';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'ទិន្នន័យឧបករណ៍';

  @override
  String get deviceDataSubtitle => 'ការផ្ទុកមូលដ្ឋាន និងម៉ាស៊ីនមេ';

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
  String get localStorage => 'ការផ្ទុកមូលដ្ឋាន';

  @override
  String get onThisDevice => 'នៅលើឧបករណ៍នេះ';

  @override
  String get encryptedDatabases => 'មូលដ្ឋានទិន្នន័យអ៊ិនគ្រីប';

  @override
  String get files => 'ឯកសារ';

  @override
  String get secureKeychain => 'ខ្សែកូនសោសុវត្ថិភាព';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'ឈ្មោះ, រូបតំណាង, កូនសោ Signal';

  @override
  String get messagesDetail => 'ការសន្ទនាអ៊ិនគ្រីប';

  @override
  String get notesDetail => 'កំណត់ត្រាផ្ទាល់ខ្លួន';

  @override
  String get signalSessions => 'វគ្គ Signal';

  @override
  String get signalSessionsDetail => 'វគ្គអ៊ិនគ្រីប';

  @override
  String get pendingContacts => 'ទំនាក់ទំនងកំពុងរង់ចាំ';

  @override
  String get pendingContactsDetail => 'សំណើកំពុងរង់ចាំ';

  @override
  String get callHistory => 'ការហៅ';

  @override
  String get callHistoryDetail => 'ប្រវត្តិការហៅ';

  @override
  String get preferences => 'ចំណូលចិត្ត';

  @override
  String get preferencesDetail => 'ចំណូលចិត្តមេឌៀ និងការហៅ';

  @override
  String get avatars => 'រូបតំណាង';

  @override
  String get media => 'មេឌៀ';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ឯកសារ',
      one: '១ ឯកសារ',
      zero: 'គ្មានឯកសារ',
    );
    return '$_temp0';
  }

  @override
  String get active => 'សកម្ម';

  @override
  String get notDefined => 'មិនបានកំណត់';

  @override
  String get biometrics => 'ជីវមាត្រ';

  @override
  String get recoveryPhrase => 'ឃ្លាសង្គ្រោះ';

  @override
  String get identity => 'អត្តសញ្ញាណ (Hash ID)';

  @override
  String get signalKeys => 'កូនសោ Signal Protocol';

  @override
  String get authTokens => 'និមិត្តសញ្ញាផ្ទៀងផ្ទាត់';

  @override
  String get contactNamesCache => 'Cache ឈ្មោះទំនាក់ទំនង';

  @override
  String get remoteConfig => 'ការកំណត់ពីចម្ងាយ';

  @override
  String get notificationPrefs => 'ចំណូលចិត្តការជូនដំណឹង';

  @override
  String get serverData => 'ទិន្នន័យម៉ាស៊ីនមេ';

  @override
  String get serverDataInfo =>
      'Hash រក្សាទិន្នន័យអប្បបរមានៅលើម៉ាស៊ីនមេ ទាំងអស់អ៊ិនគ្រីប ឬបណ្តោះអាសន្ន។';

  @override
  String get serverProfile => 'ប្រវត org រូប';

  @override
  String get serverProfileDetail =>
      'Hash ID, កូនសោសាធារណៈ, និមិត្តសញ្ញាប្រអប់សំបុត្រ';

  @override
  String get serverPrekeys => 'កូនសោមុន';

  @override
  String get serverPrekeysDetail => 'កូនសោ Signal ប្រើម្តង (បានប្រើ)';

  @override
  String get serverMessages => 'សារកំពុងដឹកជញ្ជូន';

  @override
  String get serverMessagesDetail => 'លុបបន្ទាប់ពីទទួល (អតិបរមា ២៤ ម៉ោង)';

  @override
  String get serverMedia => 'មេឌៀកំពុងដឹកជញ្ជូន';

  @override
  String get serverMediaDetail => 'លុបបន្ទាប់ពីទាញយក';

  @override
  String get serverContactRequests => 'សំណើទំនាក់ទំនង';

  @override
  String get serverContactRequestsDetail => 'ផុតកំណត់បន្ទាប់ពី ២៤ ម៉ោង';

  @override
  String get serverRateLimits => 'ដែនកំណត់អត្រា';

  @override
  String get serverRateLimitsDetail =>
      'ទិន្នន័យបណ្តោះអាសន្នប្រឆាំងការរំលោភបំពាន';

  @override
  String get privacyReassurance =>
      'Hash មិនអាចអានសាររបស់អ្នក។ ទិន្នន័យទាំងអស់ត្រូវបានអ៊ិនគ្រីបពីចុងដល់ចុង។ ទិន្នន័យម៉ាស៊ីនមេត្រូវបានលុបដោយស្វ័យប្រវត្តិ។';

  @override
  String get pinTooSimple =>
      'PIN នេះសាមញ្ញពេក។ សូមជ្រើសរើសលេខកូដមានសុវត្ថិភាពជាង។';

  @override
  String get genericError => 'មានកំហុសកើតឡើង។ សូមព្យាយាមម្តងទៀត។';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'មិនអាចបង្កើតគណនី: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'បានចម្លងឃ្លា';

  @override
  String get copyPhrase => 'ចម្លងឃ្លា';

  @override
  String get recoveryPhraseSecurityWarning =>
      'កត់ឃ្លានេះនៅកន្លែងសុវត្ថិភាព។ ប្រសិនបើអ្នកបាត់ PIN ដោយគ្មានឃ្លានេះ អ្នកនឹងបាត់បង់ការចូលប្រើទិន្នន័យជារៀងរហូត។';

  @override
  String get noMessages => 'គ្មានសារ';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'លុបសារទាំងអស់ជាមួយ $name?';
  }

  @override
  String get confirmation => 'ការបញ្ជាក់';

  @override
  String get untitled => 'គ្មានចំណងជើង';

  @override
  String get noSessions => 'គ្មានវគ្គ';

  @override
  String get unknownContact => 'ទំនាក់ទំនងមិនស្គាល់';

  @override
  String get unnamed => 'គ្មានឈ្មោះ';

  @override
  String get noPendingRequestsAlt => 'គ្មានសំណើកំពុងរង់ចាំ';

  @override
  String get deleteAllCallHistory => 'លុបប្រវត្តិការហៅទាំងអស់?';

  @override
  String get noCalls => 'គ្មានការហៅ';

  @override
  String get noPreferences => 'គ្មានចំណូលចិត្ត';

  @override
  String get resetAllMediaPrefs => 'កំណត់ចំណូលចិត្តមេឌៀទាំងអស់ឡើងវិញ?';

  @override
  String get deleteThisAvatar => 'លុបរូបតំណាងនេះ?';

  @override
  String get deleteAllAvatars => 'លុបរូបតំណាងទាំងអស់?';

  @override
  String get noAvatars => 'គ្មានរូបតំណាង';

  @override
  String get deleteThisFile => 'លុបឯកសារនេះ?';

  @override
  String get deleteAllMediaFiles => 'លុបមេឌៀទាំងអស់?';

  @override
  String get noMediaFiles => 'គ្មានមេឌៀ';

  @override
  String get outgoing => 'ចេញ';

  @override
  String get incoming => 'ចូល';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'ការមើលបណ្តោះអាសន្ន: $secondsវិ';
  }

  @override
  String get normalView => 'ការមើលធម្មតា';

  @override
  String get callReasonCompleted => 'បានបញ្ចប់';

  @override
  String get callReasonMissed => 'បាត់';

  @override
  String get callReasonDeclined => 'បានបដិសេធ';

  @override
  String get callReasonFailed => 'បរាជ័យ';

  @override
  String get justNow => 'ទើបតែ';

  @override
  String timeAgoMinutes(int count) {
    return '$count នាទីមុន';
  }

  @override
  String timeAgoHours(int count) {
    return '$countម៉ោងមុន';
  }

  @override
  String timeAgoDays(int count) {
    return '$countថ្ងៃមុន';
  }

  @override
  String get messageTypeContact => 'ទំនាក់ទំនង';

  @override
  String get messageTypeLocation => 'ទីតាំង';

  @override
  String get statusQueued => 'កំពុងរង់ចាំ';

  @override
  String get blockedBadge => 'បានរារាំង';

  @override
  String get protectedBadge => 'បានការពារ';

  @override
  String messageCount(int count) {
    return '$count សារ';
  }

  @override
  String get deleteQuestion => 'លុប?';

  @override
  String get transferMyAccountTitle => 'ផ្ទេរគណនីរបស់ខ្ញុំ';

  @override
  String get loadingError => 'កំហុសក្នុងការផ្ទុក';

  @override
  String get transferToNewDevice => 'ផ្ទេរទៅឧបករណ៍ថ្មី';

  @override
  String get transferInstructions =>
      'នៅលើឧបករណ៍ថ្មីរបស់អ្នក ជ្រើសរើស \"សង្គ្រោះគណនី\" ហើយបញ្ចូលព័ត៌មាននេះ:';

  @override
  String get yourHashIdLabel => 'Hash ID របស់អ្នក';

  @override
  String get enterYourPinCode => 'បញ្ចូលលេខកូដ PIN របស់អ្នក';

  @override
  String get pinOwnerConfirmation => 'ដើម្បីបញ្ជាក់ថាអ្នកជាម្ចាស់គណនីនេះ';

  @override
  String get scanThisQrCode => 'ស្កេន QR code នេះ';

  @override
  String get withYourNewDevice => 'ជាមួយឧបករណ៍ថ្មីរបស់អ្នក';

  @override
  String get orEnterTheCode => 'ឬបញ្ចូលលេខកូដ';

  @override
  String get transferCodeLabel => 'លេខកូដផ្ទេរ';

  @override
  String get proximityVerification => 'ការផ្ទៀងផ្ទាត់ជិតគ្នា';

  @override
  String get bringDevicesCloser => 'នាំឧបករណ៍ទាំងពីរមកជិតគ្នា';

  @override
  String get confirmTransferQuestion => 'បញ្ជាក់ការផ្ទេរ?';

  @override
  String get accountWillBeTransferred =>
      'គណនីរបស់អ្នកនឹងត្រូវផ្ទេរទៅឧបករណ៍ថ្មី។\n\nឧបករណ៍នេះនឹងត្រូវផ្តាច់ជាអចិន្ត្រៃយ៍។';

  @override
  String get transferComplete => 'ការផ្ទេរបានបញ្ចប់';

  @override
  String get transferSuccessMessage =>
      'គណនីរបស់អ្នកត្រូវបានផ្ទេរដោយជោគជ័យ។\n\nកម្មវិធីនេះនឹងបិទឥឡូវនេះ។';

  @override
  String get manualVerification => 'ការផ្ទៀងផ្ទាត់ដោយដៃ';

  @override
  String get codeDisplayedOnBothDevices => 'លេខកូដបង្ហាញនៅលើឧបករណ៍ទាំងពីរ:';

  @override
  String get doesCodeMatchNewDevice =>
      'តើលេខកូដនេះត្រូវគ្នាជាមួយលេខកូដនៅលើឧបករណ៍ថ្មីទេ?';

  @override
  String get verifiedStatus => 'បានផ្ទៀងផ្ទាត់';

  @override
  String get inProgressStatus => 'កំពុងដំណើរការ...';

  @override
  String get notAvailableStatus => 'មិនអាចប្រើបាន';

  @override
  String get codeExpiredRestart => 'លេខកូដផុតកំណត់។ សូមចាប់ផ្តើមឡើងវិញ។';

  @override
  String get codesDoNotMatchCancelled =>
      'លេខកូដមិនត្រូវគ្នា។ ការផ្ទេរត្រូវបានបោះបង់។';

  @override
  String transferToDevice(String device) {
    return 'ទៅ: $device';
  }

  @override
  String get copiedExclamation => 'បានចម្លង!';

  @override
  String expiresInTime(String time) {
    return 'ផុតកំណត់ក្នុង $time';
  }

  @override
  String get biometricNotAvailable => 'ជីវមាត្រមិនអាចប្រើបាននៅលើឧបករណ៍នេះ';

  @override
  String get biometricAuthError => 'កំហុសក្នុងការផ្ទៀងផ្ទាត់ជីវមាត្រ';

  @override
  String get authenticateForBiometric => 'សូមផ្ទៀងផ្ទាត់ដើម្បីបើកជីវមាត្រ';

  @override
  String get biometricAuthFailed => 'ការផ្ទៀងផ្ទាត់ជីវមាត្របរាជ័យ';

  @override
  String get forceUpdateTitle => 'ត្រូវការការធ្វើបច្ចុប្បន្នភាព';

  @override
  String get forceUpdateMessage =>
      'កំណែថ្មីនៃ Hash មាន។ សូមធ្វើបច្ចុប្បន្នភាពដើម្បីបន្ត។';

  @override
  String get updateButton => 'ធ្វើបច្ចុប្បន្នភាព';

  @override
  String get maintenanceInProgress => 'ការថែទាំកំពុងដំណើរការ';

  @override
  String get tryAgainLater => 'សូមព្យាយាមម្តងទៀតពេលក្រោយ';

  @override
  String get information => 'ព័ត៌មាន';

  @override
  String get later => 'ពេលក្រោយ';

  @override
  String get doYouLikeHash => 'តើអ្នកចូលចិត្ត Hash ទេ?';

  @override
  String get yourFeedbackHelps => 'មតិកែលម្អរបស់អ្នកជួយយើងកែលម្អកម្មវិធី';

  @override
  String get ratingTerrible => 'អាក្រក់ណាស់';

  @override
  String get ratingBad => 'អាក្រក់';

  @override
  String get ratingOk => 'ធម្មតា';

  @override
  String get ratingGood => 'ល្អ';

  @override
  String get ratingExcellent => 'អស្ចារ្យ!';

  @override
  String get donationMessage =>
      'Hash គឺជាគម្រោងមិនរកប្រាក់ចំណេញ។ ការគាំទ្ររបស់អ្នកជួយយើងបន្តបង្កើតកម្មវិធីផ្ញើសារឯកជនពិតប្រាកដ។';

  @override
  String get recentConnections => 'ការភ្ជាប់ថ្មីៗ';

  @override
  String get loginInfoText =>
      'រាល់ការដោះសោ PIN ត្រូវបានកត់ត្រានៅមូលដ្ឋាន។ មានតែ ២៤ ម៉ោងចុងក្រោយត្រូវបានរក្សា។';

  @override
  String get connectionCount => 'ការភ្ជាប់';

  @override
  String get periodLabel => 'រយៈពេល';

  @override
  String get historyLabel => 'ប្រវត្តិ';

  @override
  String get noLoginRecorded => 'គ្មានការចូលត្រូវបានកត់ត្រា';

  @override
  String get nextUnlocksAppearHere => 'ការដោះសោបន្ទាប់នឹងបង្ហាញនៅទីនេះ។';

  @override
  String get dataLocalOnly =>
      'ទិន្នន័យនេះត្រូវបានរក្សាទុកតែនៅលើឧបករណ៍របស់អ្នក ហើយមិនដែលផ្ញើចេញ។';

  @override
  String get currentSession => 'បច្ចុប្បន្ន';

  @override
  String get todayLabel => 'ថ្ងៃនេះ';

  @override
  String get yesterdayLabel => 'ម្សិលមិញ';

  @override
  String get justNowLabel => 'ទើបតែ';

  @override
  String minutesAgoLabel(int count) {
    return '$count នាទីមុន';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursម៉ោងមុន';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursម៉ោង $minutesនាទីមុន';
  }

  @override
  String get noMaintenancePlanned => 'គ្មានការថែទាំគ្រោងទុក';

  @override
  String get everythingWorkingNormally => 'អ្វីៗទាំងអស់ដំណើរការធម្មតា';

  @override
  String get maintenanceTitle => 'ការថែទាំ';

  @override
  String get maintenanceActiveLabel => 'កំពុងដំណើរការ';

  @override
  String get maintenancePlannedLabel => 'គ្រោងទុក';

  @override
  String get locking => 'កំពុងចាក់សោ...';

  @override
  String get newMessageNotification => 'សារថ្មី';

  @override
  String get secExplainTitle => 'របៀបដែល Hash ការពារអ្នក';

  @override
  String get secExplainIntro =>
      'Hash ត្រូវបានរចនាដើម្បីមិនមានអ្នកណាអាចអានសាររបស់អ្នក។';

  @override
  String get secExplainIntroSub =>
      'សូម្បីតែយើង។\nនេះជារបៀបដែលវាដំណើរការ ពន្យល់យ៉ាងសាមញ្ញ។';

  @override
  String get secJourneyLabel => 'ដំណើរ';

  @override
  String get secJourneyTitle => 'ដំណើររបស់សាររបស់អ្នក';

  @override
  String get secJourneySubtitle =>
      'ពីម្រាមដៃរបស់អ្នកទៅអេក្រង់របស់ទំនាក់ទំនង រាល់ជំហានត្រូវបានការពារ។ តាមដានផ្លូវ។';

  @override
  String get secStep1Title => 'អ្នកសរសេរសាររបស់អ្នក';

  @override
  String get secStep1Desc =>
      'អ្នកវាយ \"សួស្តី!\" នៅក្នុងកម្មវិធី។ នៅពេលនេះ សារមាននៅក្នុងអង្គចងចាំទូរស័ព្ទរបស់អ្នកតែប៉ុណ្ណោះ។ គ្មានអ្វីត្រូវបានផ្ញើ។';

  @override
  String get secStep2Title => 'ការអ៊ិនគ្រីបជាមួយ Signal Protocol';

  @override
  String get secStep2Desc =>
      'ភ្លាមៗដែលអ្នកចុច \"ផ្ញើ\" សាររបស់អ្នកត្រូវបានបម្លែងទៅជាតួអក្សរដែលមិនអាចយល់បាន។ វាដូចជាសាររបស់អ្នកត្រូវបានចាក់សោក្នុងសុវត្ថិភាពដែលមានតែទំនាក់ទំនងរបស់អ្នកមានកូនសោ។';

  @override
  String get secStep3Title => 'Sealed Sender: ស្រោមសំបុត្រដែលមើលមិនឃើញ';

  @override
  String get secStep3Desc =>
      'ស្រមៃថាអ្នកផ្ញើលិខិតតាមប្រៃសណីយ៍ ប៉ុន្តែគ្មានអាសយដ្ឋានអ្នកផ្ញើនៅលើស្រោម។ នោះពិតជាអ្វីដែល Hash ធ្វើ។ សារត្រូវបានដាក់ក្នុងប្រអប់សំបុត្រអនាមិក។ ម៉ាស៊ីនមេមិនដឹងថានរណាផ្ញើវា។';

  @override
  String get secStep4Title => 'ម៉ាស៊ីនមេមើលមិនឃើញអ្វី';

  @override
  String get secStep4Desc =>
      'ម៉ាស៊ីនមេដើរតួជាអ្នកប្រៃសណីយ៍ខ្វាក់។ វាដឹងតែ \"នរណាម្នាក់បានដាក់អ្វីមួយនៅក្នុងប្រអប់ #A7X9\"។ វាមិនដឹងថានរណាផ្ញើ អ្វីនោះ ឬសម្រាប់នរណា។';

  @override
  String get secStep4Highlight =>
      'គ្មាន metadata ត្រូវបានរក្សាទុក: គ្មានអាសយដ្ឋាន IP គ្មានត្រា​ពេលវេលា គ្មានទំនាក់ទំនងរវាងអ្នកផ្ញើ និងអ្នកទទួល។';

  @override
  String get secStep5Title => 'ទំនាក់ទំនងរបស់អ្នកទទួលសារ';

  @override
  String get secStep5Desc =>
      'ទូរស័ព្ទរបស់ទំនាក់ទំនងទាញយកមាតិកាពីប្រអប់សំបុត្រអនាមិក ហើយឌិគ្រីបសារជាមួយកូនសោឯកជនរបស់ពួកគេ ដែលមិនធ្លាប់ចាកចេញពីឧបករណ៍។ \"សួស្តី!\" បង្ហាញនៅលើអេក្រង់។';

  @override
  String get secStep6Title => 'សារបាត់ពីម៉ាស៊ីនមេ';

  @override
  String get secStep6Desc =>
      'ភ្លាមៗដែលទំនាក់ទំនងរបស់អ្នកបញ្ជាក់ការទទួល ម៉ាស៊ីនមេលុបសារជាអចិន្ត្រៃយ៍។ គ្មានធុងសម្រាម គ្មានបណ្ណសារ គ្មានការបម្រុងទុក។ សូម្បីតែសារដែលមិនបានអាន ក៏ត្រូវបានបំផ្លាញដោយស្វ័យប្រវត្តិបន្ទាប់ពី ២៤ ម៉ោង។';

  @override
  String get secStep7Title => 'ការផុតកំណត់មូលដ្ឋាន';

  @override
  String get secStep7Desc =>
      'នៅលើទូរស័ព្ទរបស់ទំនាក់ទំនង សារបំផ្លាញខ្លួនឯងតាមរយៈពេលដែលអ្នកបានជ្រើសរើស: ភ្លាមៗបន្ទាប់ពីអាន ៥ នាទី ១ ម៉ោង... អ្នកសម្រេចចិត្ត។';

  @override
  String get secJourneyConclusion =>
      'លទ្ធផល: គ្មានដាននៅលើម៉ាស៊ីនមេ គ្មានដាននៅលើឧបករណ៍។ សារមានតែពេលគ្រប់គ្រាន់ដើម្បីអាន បន្ទាប់មកវាបាត់។';

  @override
  String get secArchLabel => 'ស្ថាបត្យកម្ម';

  @override
  String get secArchTitle => 'ស្រទាប់ការពារ ៥';

  @override
  String get secArchSubtitle =>
      'Hash មិនពឹងផ្អែកលើបច្ចេកវិទ្យាតែមួយ។ រាល់ស្រទាប់ពង្រឹងស្រទាប់ផ្សេង។ សូម្បីតែស្រទាប់មួយត្រូវបានសម្រុះសម្រួល ទិន្នន័យរបស់អ្នកនៅសុវត្ថិភាព។';

  @override
  String get secLayer1Title => 'ការអ៊ិនគ្រីបពីចុងដល់ចុង';

  @override
  String get secLayer1Desc =>
      'រាល់សារត្រូវបានអ៊ិនគ្រីបជាមួយកូនសោតែមួយ។ និយាយសាមញ្ញ: សូម្បីតែនរណាម្នាក់ឌិគ្រីបសារមួយ ពួកគេមិនអាចឌិគ្រីបសារបន្ទាប់បាន។ រាល់សារមានសោផ្ទាល់ខ្លួន។';

  @override
  String get secLayer1Detail =>
      'សម្រាប់ឯកសារ (រូបថត វីដេអូ ឯកសារ) Hash ប្រើការអ៊ិនគ្រីប AES-256-GCM បន្ថែម។ ឯកសារត្រូវបានអ៊ិនគ្រីបមុនពេលចាកចេញពីទូរស័ព្ទរបស់អ្នក។';

  @override
  String get secLayer2Title => 'Sealed Sender (អនាមិកបណ្តាញ)';

  @override
  String get secLayer2Desc =>
      'កម្មវិធីផ្ញើសារធម្មតាផ្ញើសាររបស់អ្នកជាមួយអត្តសញ្ញាណរបស់អ្នក។ វាដូចជាសរសេរឈ្មោះរបស់អ្នកនៅលើស្រោម។ Hash ប្រើប្រអប់សំបុត្រអនាមិក: ម៉ាស៊ីនមេដឹកជញ្ជូនសារដោយមិនដឹងថានរណាផ្ញើ។';

  @override
  String get secLayer2Detail =>
      'លទ្ធផល: សូម្បីតែក្នុងករណីទិន្នន័យម៉ាស៊ីនមេធ្លាយ វាមិនអាចកសាងឡើងវិញថានរណាជជែកជាមួយនរណា។';

  @override
  String get secLayer3Title => 'ការលុបស្វ័យប្រវត្តិ';

  @override
  String get secLayer3Desc =>
      'សារត្រូវបានលុបពីម៉ាស៊ីនមេភ្លាមៗពេលការទទួលត្រូវបានបញ្ជាក់។ សូម្បីតែសារមិនត្រូវបានទៅយក ក៏ត្រូវបានបំផ្លាញដោយស្វ័យប្រវត្តិបន្ទាប់ពី ២៤ ម៉ោង។';

  @override
  String get secLayer3Detail =>
      'នៅលើទូរស័ព្ទរបស់អ្នក សារបំផ្លាញខ្លួនឯងតាមរយៈពេលដែលអ្នកជ្រើសរើស: ភ្លាមៗ ៥ នាទី ១៥ នាទី ៣០ នាទី ១ ម៉ោង ៣ ម៉ោង ៦ ម៉ោង ឬ ១២ ម៉ោង។';

  @override
  String get secLayer4Title => 'ការការពារការចូលប្រើមូលដ្ឋាន';

  @override
  String get secLayer4Desc =>
      'កម្មវិធីត្រូវបានការពារដោយ PIN ៦ ខ្ទង់ និង/ឬជីវមាត្រ (Face ID ស្នាមម្រាមដៃ)។ បន្ទាប់ពីការព្យាយាមបរាជ័យច្រើន កម្មវិធីចាក់សោជាមួយរយៈពេលដែលកើនឡើងបន្ទាប់ពីរាល់ការបរាជ័យ។';

  @override
  String get secLayer5Title => 'មូលដ្ឋានទិន្នន័យចាក់សោ';

  @override
  String get secLayer5Desc =>
      'នៅផ្នែកម៉ាស៊ីនមេ គ្មានអ្នកប្រើអាចសរសេរដោយផ្ទាល់ទៅក្នុងមូលដ្ឋានទិន្នន័យ។ រាល់សកម្មភាពឆ្លងកាត់មុខងារសុវត្ថិភាពដែលផ្ទៀងផ្ទាត់រាល់សំណើ។';

  @override
  String get secLayer5Detail =>
      'វាដូចជាបញ្ជរធនាគារ: អ្នកមិនដែលប៉ះសុវត្ថិភាពដោយខ្លួនឯង។ អ្នកធ្វើសំណើ ហើយប្រព័ន្ធផ្ទៀងផ្ទាត់ថាអ្នកមានសិទ្ធិមុនពេលធ្វើ។';

  @override
  String get secVashLabel => 'តែមួយគត់នៅលើពិភពលោក';

  @override
  String get secVashTitle => 'មុខងារ Vash';

  @override
  String get secVashSubtitle =>
      'ប្រព័ន្ធសុវត្ថិភាពបន្ទាន់ដែលមិនមាននៅក្នុងកម្មវិធីផ្ញើសារផ្សេង។';

  @override
  String get secVashScenarioTitle => 'ស្រមៃស្ថានភាពនេះ';

  @override
  String get secVashScenario1 => 'នរណាម្នាក់ចូលប្រើទូរស័ព្ទរបស់អ្នក';

  @override
  String get secVashScenario2 => 'អ្នកត្រូវបានសុំលេខកូដ PIN';

  @override
  String get secVashScenario3 => 'អ្នកចង់លុបទិន្នន័យទាំងអស់ជាបន្ទាន់';

  @override
  String get secVashSolutionTitle => 'ដំណោះស្រាយ: លេខកូដ PIN ពីរ';

  @override
  String get secVashSolutionDesc =>
      'អ្នកកំណត់លេខកូដ PIN ពីរផ្សេងគ្នានៅក្នុង Hash:';

  @override
  String get secVashNormalCodeLabel => 'លេខកូដធម្មតា';

  @override
  String get secVashNormalCodeDesc => 'បើកកម្មវិធីធម្មតាជាមួយទិន្នន័យទាំងអស់';

  @override
  String get secVashCodeLabel2 => 'លេខកូដ Vash';

  @override
  String get secVashCodeDescription =>
      'បើកកម្មវិធីធម្មតា... ប៉ុន្តែទិន្នន័យទាំងអស់ត្រូវបានលុបស្ងាត់នៅផ្ទៃខាងក្រោយ';

  @override
  String get secVashWhatHappensTitle => 'អ្វីកើតឡើងបន្ទាប់មក';

  @override
  String get secVashWhatHappensDesc =>
      'កម្មវិធីបើកធម្មតា។ គ្មានការជូនដំណឹង គ្មានចលនាគួរឱ្យសង្ស័យ។ អេក្រង់បង្ហាញកម្មវិធីទទេ ដូចជាអ្នកទើបតែដំឡើង។\n\nតាមពិត ការសន្ទនា ទំនាក់ទំនង និងសារទាំងអស់ត្រូវបានលុបដែលមិនអាចត្រឡប់វិញក្នុងមួយភ្លែត។';

  @override
  String get secCallsLabel => 'ការហៅ និងឯកសារ';

  @override
  String get secCallsTitle => 'អ្វីៗទាំងអស់ត្រូវបានអ៊ិនគ្រីប';

  @override
  String get secCallsSubtitle =>
      'មិនមែនតែសារ។ អ្វីៗទាំងអស់ដែលឆ្លងកាត់ Hash ត្រូវបានអ៊ិនគ្រីបពីចុងដល់ចុង។';

  @override
  String get secAudioCallTitle => 'ការហៅសំឡេង';

  @override
  String get secAudioCallDesc =>
      'អ៊ិនគ្រីបពីចុងដល់ចុងតាមរយៈ WebRTC។ សំឡេងត្រូវបានបញ្ជូនដោយផ្ទាល់រវាងឧបករណ៍។';

  @override
  String get secVideoCallTitle => 'ការហៅវីដេអូ';

  @override
  String get secVideoCallDesc =>
      'បច្ចេកវិទ្យាដូចគ្នា រាល់ stream អ៊ិនគ្រីបដាច់ដោយឡែក។';

  @override
  String get secPhotosTitle => 'រូបថត និងវីដេអូ';

  @override
  String get secPhotosDesc =>
      'អ៊ិនគ្រីបជា AES-256-GCM មុនពេលចាកចេញពីទូរស័ព្ទរបស់អ្នក។';

  @override
  String get secDocsTitle => 'ឯកសារ';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, រាល់ឯកសារ។ ឈ្មោះ ទំហំ និងមាតិកាត្រូវបានអ៊ិនគ្រីប។';

  @override
  String get secAnonLabel => 'អនាមិក';

  @override
  String get secAnonTitle => 'គ្មានអត្តសញ្ញាណចាំបាច់';

  @override
  String get secAnonSubtitle =>
      'Hash មិនដែលសុំលេខទូរស័ព្ទ ឬអ៊ីមែលរបស់អ្នក។ អ្នកត្រូវបានកំណត់អត្តសញ្ញាណដោយ Hash ID តែមួយ និងអនាមិក។';

  @override
  String get secHashIdTitle => 'Hash ID របស់អ្នក';

  @override
  String get secHashIdDesc =>
      'នេះជាអត្តសញ្ញាណតែមួយរបស់អ្នក។ វាមិនបង្ហាញអ្វីអំពីអ្នក: ឈ្មោះ លេខ ឬទីតាំង។ វាដូចជាឈ្មោះក្លែងក្លាយដែលមិនអាចផ្សារភ្ជាប់ទៅអត្តសញ្ញាណពិតរបស់អ្នក។\n\nដើម្បីបន្ថែមទំនាក់ទំនង អ្នកចែករំលែក Hash ID ឬស្កេន QR code។ ប៉ុណ្ណឹង។ គ្មានសៀវភៅអាសយដ្ឋានធ្វើសមកាលកម្ម គ្មានការណែនាំ \"មនុស្សដែលអ្នកអាចស្គាល់\"។';

  @override
  String get secDataLabel => 'ទិន្នន័យ';

  @override
  String get secDataTitle => 'អ្វីដែល Hash មិនដឹង';

  @override
  String get secDataSubtitle =>
      'វិធីល្អបំផុតដើម្បីការពារទិន្នន័យរបស់អ្នកគឺមិនប្រមូលវា។';

  @override
  String get secNeverCollected => 'មិនដែលប្រមូល';

  @override
  String get secNeverItem1 => 'មាតិកាសារ';

  @override
  String get secNeverItem2 => 'បញ្ជីទំនាក់ទំនង';

  @override
  String get secNeverItem3 => 'លេខទូរស័ព្ទ';

  @override
  String get secNeverItem4 => 'អាសយដ្ឋានអ៊ីមែល';

  @override
  String get secNeverItem5 => 'អាសយដ្ឋាន IP';

  @override
  String get secNeverItem6 => 'ទីតាំង';

  @override
  String get secNeverItem7 => 'Metadata (នរណាជជែកជាមួយនរណា)';

  @override
  String get secNeverItem8 => 'ប្រវត្តិការហៅ';

  @override
  String get secNeverItem9 => 'សៀវភៅអាសយដ្ឋាន';

  @override
  String get secNeverItem10 => 'អត្តសញ្ញាណផ្សាយពាណិជ្ជកម្ម';

  @override
  String get secTempStored => 'រក្សាទុកបណ្តោះអាសន្ន';

  @override
  String get secTempItem1 => 'Hash ID អនាមិក (អត្តសញ្ញាណតែមួយ)';

  @override
  String get secTempItem2 => 'កូនសោសាធារណៈអ៊ិនគ្រីប';

  @override
  String get secTempItem3 => 'សារអ៊ិនគ្រីបកំពុងដឹកជញ្ជូន (អតិបរមា ២៤ ម៉ោង)';

  @override
  String get secTempNote =>
      'សូម្បីតែទិន្នន័យអប្បបរមានេះមិនអាចកំណត់អត្តសញ្ញាណអ្នក។ Hash ID របស់អ្នកមិនត្រូវបានផ្សារភ្ជាប់ទៅព័ត៌មានផ្ទាល់ខ្លួនណាមួយ។';

  @override
  String get secFooterTitle => 'ភាពឯកជនរបស់អ្នក សេរីភាពរបស់អ្នក';

  @override
  String get secFooterDesc =>
      'Hash ប្រើបច្ចេកវិទ្យាអ៊ិនគ្រីបដូចគ្នាជាមួយកម្មវិធីវិជ្ជាជីវៈដែលតម្រូវការខ្ពស់បំផុត។ សាររបស់អ្នកត្រូវបានការពារដោយគណិតវិទ្យា មិនមែនដោយការសន្យា។';

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
