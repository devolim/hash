// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Bez pēdām. Bez kompromisiem.';

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
  String get conversations => 'Sarunas';

  @override
  String get contacts => 'Kontakti';

  @override
  String get noConversation => 'Nav sarunu';

  @override
  String get noConversationSubtitle =>
      'Pievienojiet kontaktu, lai sāktu drošu sarunu';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gaidītie pieprasījumi',
      one: '1 gaidītais pieprasījums',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nosūtītie pieprasījumi gaida',
      one: '1 nosūtīts pieprasījums gaida',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Pievienot kontaktu';

  @override
  String get shareApp => 'Dalīties ar lietotni';

  @override
  String get newMessage => 'Jauna ziņa';

  @override
  String get newConversation => 'Nosūtīt ziņu';

  @override
  String get settings => 'Iestatījumi';

  @override
  String get myHashId => 'Mans Hash ID';

  @override
  String get supportHash => 'Atbalstīt Hash';

  @override
  String get supportHashSubtitle => 'Hash ir bezpeļņas projekts';

  @override
  String get donate => 'Ziedot';

  @override
  String get appearance => 'Izskats';

  @override
  String get theme => 'Motīvs';

  @override
  String get themeAuto => 'Automātiski';

  @override
  String get themeAutoSubtitle => 'Seko sistēmas iestatījumiem';

  @override
  String get themeDark => 'Tumšs';

  @override
  String get themeLight => 'Gaiss';

  @override
  String get themeRecommendation =>
      'Tumšais motīvs ir ieteicams labākai privātumam';

  @override
  String get language => 'Valoda';

  @override
  String get languageAuto => 'Automātiski (sistēma)';

  @override
  String get notifications => 'Paziņojumi';

  @override
  String get messages => 'Ziņas';

  @override
  String get calls => 'Zvani';

  @override
  String get vibration => 'Vibrācija';

  @override
  String get notificationContent => 'Paziņojuma saturs';

  @override
  String get notificationContentFull => 'Rādīt visu';

  @override
  String get notificationContentFullDesc =>
      'Kontakta vārds un ziņas priekšskatījums';

  @override
  String get notificationContentName => 'Tikai vārds';

  @override
  String get notificationContentNameDesc => 'Rāda tikai kontakta vārdu';

  @override
  String get notificationContentDiscrete => 'Diskrēts';

  @override
  String get notificationContentDiscreteDesc => 'Rāda tikai “Jauna ziņa”';

  @override
  String get security => 'Drošība';

  @override
  String get howHashProtectsYou => 'Kā Hash jūs aizsargā';

  @override
  String get howHashProtectsYouSubtitle => 'Izprotiet savu drošību';

  @override
  String get accountSecurity => 'Konta drošība';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrija, Vash režīms';

  @override
  String get blockScreenshots => 'Bloķēt ekrānuzņēmumus';

  @override
  String get transferDevice => 'Pārsūtīt uz citu ierīci';

  @override
  String get transferDeviceSubtitle => 'Migrēt savu kontu';

  @override
  String get pinCode => 'PIN kods';

  @override
  String get changePin => 'Mainīt PIN kodu';

  @override
  String get currentPin => 'Pašreizējais PIN kods';

  @override
  String get newPin => 'Jaunais PIN kods';

  @override
  String get confirmPin => 'Apstiprināt PIN kodu';

  @override
  String get pinChanged => 'PIN kods nomainīts';

  @override
  String get incorrectPin => 'Nepareizs PIN';

  @override
  String get pinsDoNotMatch => 'PIN kodi nesakrīt';

  @override
  String get autoLock => 'Automātiskā bloķēšana';

  @override
  String get autoLockDelay => 'Bloķēšanas aizkave';

  @override
  String get autoLockImmediate => 'Tūlītēja';

  @override
  String get autoLockMinute => '1 minūte';

  @override
  String autoLockMinutes(int count) {
    return '$count minūtes';
  }

  @override
  String get vashCode => 'Vash kods';

  @override
  String get vashModeTitle => 'Vash režīms';

  @override
  String get vashModeExplanation => 'Jūsu galvenais drošības tīkls.';

  @override
  String get vashModeDescription =>
      'Jūs izvēlēsieties otru PIN kodu. Ja jebkad esat spiests atvērt Hash, ievadiet šo kodu parastā PIN vietā.\n\nLietotne atvērsies normāli, bet visas jūsu sarunas un kontakti būs pazuduši.\n\nIkvienam, kas skatās jūsu ekrānā, Hash izskatīsies tukšs — it kā jūs to nekad nebūtu lietojis.';

  @override
  String get vashModeIrreversible => 'Šī darbība ir klusa un neatgriezeniska.';

  @override
  String get chooseVashCode => 'Izvēlēties Vash kodu';

  @override
  String get vashCodeInfo =>
      'Otrs PIN kods, kas atver lietotni normāli, bet tukšu.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Ja ievadīsiet šo kodu sava PIN vietā:';

  @override
  String get vashDeleteContacts => 'Jūsu kontakti pazudīs';

  @override
  String get vashDeleteMessages => 'Jūsu sarunas pazudīs';

  @override
  String get vashDeleteHistory => 'Jūsu piezīmes pazudīs';

  @override
  String get vashKeepId => 'Jūsu Hash identitāte (#XXX-XXX-XXX) paliks tā pati';

  @override
  String get vashAppearNormal =>
      'Lietotne izskatīsies normāla, bet tukša, kā jauna. Šī darbība ir neatgriezeniska.';

  @override
  String get setupVashCode => 'Iestatīt Vash kodu';

  @override
  String get modifyVashCode => 'Mainīt Vash kodu';

  @override
  String get currentVashCode => 'Pašreizējais Vash kods';

  @override
  String get newVashCode => 'Jaunais Vash kods';

  @override
  String get confirmVashCode => 'Apstiprināt Vash kodu';

  @override
  String get vashCodeConfigured => 'Vash kods konfigurēts';

  @override
  String get vashCodeModified => 'Vash kods mainīts';

  @override
  String get vashCodeMustDiffer => 'Vash kodam jāatšķiras no PIN';

  @override
  String get incorrectVashCode => 'Nepareizs Vash kods';

  @override
  String get vashWhatToDelete => 'Ko Vash režīmam jāliek pazust?';

  @override
  String get vashDeleteContactsOption => 'Kontakti';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Ziņas';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Piezīmes';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash režīms aktivizēts';

  @override
  String get vashCreateSubtitle =>
      'Izvēlieties kodu, kas atšķiras no jūsu galvenā PIN';

  @override
  String get vashConfirmSubtitle => 'Apstipriniet savu Vash kodu';

  @override
  String get pinCodeForEntry => 'PIN kods lietotnes atvēršanai';

  @override
  String get vashCodeSection => 'Vash režīms';

  @override
  String get biometric => 'Biometrija';

  @override
  String get biometricUnlock => 'Atbloķēt ar pirkstu nospiedumu vai Face ID';

  @override
  String get enableBiometric => 'Aktivizēt biometriju';

  @override
  String get biometricWarningMessage =>
      'Aktivizējot biometriju, jūs nevarēsiet izmantot Vash kodu, lai ievadītu lietotni.\n\nVash kodu varēsiet izmantot tikai tad, ja biometrija neizdodas (pēc vairākiem neveiksmīgiem mēģinājumiem).\n\nVai esat pārliecināts, ka vēlaties turpināt?';

  @override
  String get understood => 'Saprotu';

  @override
  String get shareAppSubtitle => 'Dalieties ar Hash saviem tuvākajiem';

  @override
  String get share => 'Dalīties';

  @override
  String get danger => 'Bīstami';

  @override
  String get deleteAccount => 'Dzēst manu kontu';

  @override
  String get deleteAccountSubtitle => 'Neatgriezeniska darbība';

  @override
  String get deleteAccountConfirmTitle => 'Dzēst manu kontu';

  @override
  String get deleteAccountConfirmMessage =>
      'Jūsu konts tiks neatgriezeniski dzēsts. Šī darbība ir neatgriezeniska.\n\n• Visas jūsu sarunas\n• Visi jūsu kontakti\n• Jūsu Hash ID\n\nJums būs jāizveido jauns konts.';

  @override
  String get deleteForever => 'Dzēst neatgriezeniski';

  @override
  String get cancel => 'Atcelt';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash režīms aktivizēts.';

  @override
  String deletionError(String error) {
    return 'Dzēšanas kļūda: $error';
  }

  @override
  String get yourSecurity => 'Jūsu drošība';

  @override
  String get securityInfo =>
      '• Pilna šifrēšana (Signal Protocol)\n• Nav datu mūsu serveros pēc piegādes\n• Atslēgas glabājas tikai jūsu ierīcē\n• PIN kods nekad netiek nosūtīts uz serveri';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Laipni lūgti';

  @override
  String get securityStatement1 => 'Jūsu ziņas ir aizsargātas.';

  @override
  String get securityStatement2 => 'Pilna šifrēšana.';

  @override
  String get securityStatement3 => 'Bez pēdām. Bez kompromisiem.';

  @override
  String get securityStatement4 => 'Jūsu privātums ir tiesības.';

  @override
  String get accessBlocked => 'Piekļuve bloķēta';

  @override
  String get tooManyAttempts => 'Pārāk daudz mēģinājumu. Mēģiniet vēlāk.';

  @override
  String get pleaseWait => 'Lūdzu, uzgaidiet';

  @override
  String get waitDelay => 'Lūdzu, pagaidiet, kamēr beigsies aizkave';

  @override
  String attemptCount(int current, int max) {
    return 'Mēģinājums $current no $max';
  }

  @override
  String retryIn(String time) {
    return 'Mēģināt vēlreiz pēc $time';
  }

  @override
  String get forgotPin => 'Aizmirsāt PIN? Izmantojiet atjaunošanas frāzi';

  @override
  String get useRecoveryPhrase => 'Izmantot atjaunošanas frāzi';

  @override
  String get recoveryWarningTitle => 'Brīdinājums';

  @override
  String get recoveryWarningMessage => 'Konta atjaunošana veiks:';

  @override
  String get recoveryDeleteAllMessages => 'Dzēsīs VISAS jūsu ziņas';

  @override
  String get recoveryWaitDelay => 'Prasīs 1 stundu gaidīšanu';

  @override
  String get recoveryKeepContacts => 'Saglabās jūsu kontaktus';

  @override
  String get recoveryIrreversible =>
      'Šī darbība ir neatgriezeniska. Jūsu ziņas tiks neatgriezeniski zaudētas.';

  @override
  String get iUnderstand => 'Es saprotu';

  @override
  String get accountRecovery => 'Konta atjaunošana';

  @override
  String get enterRecoveryPhrase =>
      'Ievadiet 24 vārdus no savas atjaunošanas frāzes, atdalot ar atstarpēm.';

  @override
  String get recoveryPhraseHint => 'vārds1 vārds2 vārds3 ...';

  @override
  String get recover => 'Atjaunot';

  @override
  String get recoveryPhraseRequired =>
      'Lūdzu, ievadiet savu atjaunošanas frāzi';

  @override
  String get recoveryPhrase24Words => 'Frāzei jāsatur tieši 24 vārdi';

  @override
  String get incorrectRecoveryPhrase => 'Nepareiza atjaunošanas frāze';

  @override
  String get recoveryInitError => 'Kļūda, inicializējot atjaunošanu';

  @override
  String get securityDelay => 'Drošības aizkave';

  @override
  String get securityDelayMessage =>
      'Jūsu drošībai ir nepieciešams gaidīšanas periods, pirms varat izveidot jaunu PIN.';

  @override
  String get timeRemaining => 'Atlikušais laiks';

  @override
  String get messagesDeletedForProtection =>
      'Jūsu ziņas ir dzēstas jūsu aizsardzībai.';

  @override
  String get canCloseApp => 'Varat aizvērt lietotni un atgriezties vēlāk.';

  @override
  String get onboardingTitle1 => 'Laipni lūgti Hash';

  @override
  String get onboardingSubtitle1 => 'Ziņojumu lietotne, kas neatstāj pēdas';

  @override
  String get onboardingTitle2 => 'Pilnīga šifrēšana';

  @override
  String get onboardingSubtitle2 =>
      'Jūsu ziņas ir pilnībā šifrētas ar Signal Protocol';

  @override
  String get onboardingTitle3 => 'Bez pēdām';

  @override
  String get onboardingSubtitle3 =>
      'Ziņas tiek dzēstas no serveriem pēc piegādes';

  @override
  String get onboardingTitle4 => 'Jūsu drošība';

  @override
  String get onboardingSubtitle4 =>
      'PIN kods, Vash režīms un atjaunošanas frāze';

  @override
  String get getStarted => 'Sākt';

  @override
  String get next => 'Tālāk';

  @override
  String get skip => 'Izlaist';

  @override
  String get alreadyHaveAccount => 'Man jau ir konts';

  @override
  String get transferMyAccount => 'Pārsūtīt manu kontu';

  @override
  String get createPin => 'Izveidot PIN kodu';

  @override
  String get createPinSubtitle => 'Šis kods aizsargās piekļuvi jūsu lietotnei';

  @override
  String get confirmYourPin => 'Apstipriniet savu PIN kodu';

  @override
  String get confirmPinSubtitle => 'Ievadiet savu PIN kodu vēlreiz';

  @override
  String get saveRecoveryPhrase => 'Atjaunošanas frāze';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Pierakstiet šos 24 vārdus secībā. Tie ļauj atjaunot kontu, ja aizmirsīsiet PIN.';

  @override
  String get phraseWritten => 'Esmu pierakstījis savu frāzi';

  @override
  String get warningRecoveryPhrase =>
      'Ja zaudēsiet šo frāzi un aizmirsīsiet PIN, jūs zaudēsiet piekļuvi savam kontam.';

  @override
  String get accountTransferred => 'Konts pārsūtīts';

  @override
  String get accountTransferredMessage =>
      'Jūsu konts ir pārsūtīts uz citu ierīci. Šī sesija vairs nav derīga.';

  @override
  String get accountTransferredInfo =>
      'Ja jūs neuzsākāt šo pārsūtīšanu, jūsu konts varētu būt apdraudēts.';

  @override
  String get logout => 'Izrakstīties';

  @override
  String get transferAccount => 'Pārsūtīt kontu';

  @override
  String get transferAccountInfo =>
      'Pārsūtiet savu Hash kontu uz jaunu ierīci. Jūsu pašreizējā sesija tiks anulēta.';

  @override
  String get generateTransferCode => 'Ģenerēt pārsūtīšanas kodu';

  @override
  String get transferCode => 'Pārsūtīšanas kods';

  @override
  String transferCodeExpires(int minutes) {
    return 'Šis kods beigsies pēc $minutes minūtēm';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Ievadiet šo kodu jaunajā ierīcē, lai pārsūtītu kontu.';

  @override
  String get generateNewCode => 'Ģenerēt jaunu kodu';

  @override
  String get scanQrCode => 'Skenēt QR code';

  @override
  String get scanQrCodeSubtitle => 'Skenējiet kontakta QR code, lai pievienotu';

  @override
  String get qrCodeDetected => 'QR code atpazīts';

  @override
  String get invalidQrCode => 'Nederīgs QR code';

  @override
  String get cameraPermissionRequired => 'Nepieciešama kameras atļauja';

  @override
  String get myQrCode => 'Mans QR code';

  @override
  String get myQrCodeSubtitle =>
      'Dalījieties ar šo QR code, lai kontakti varētu jūs pievienot';

  @override
  String get shareQrCode => 'Dalīties';

  @override
  String get addContactTitle => 'Pievienot kontaktu';

  @override
  String get addContactByHashId => 'Ievadiet kontakta Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Meklēt';

  @override
  String get contactNotFound => 'Kontakts nav atrasts';

  @override
  String get contactAlreadyAdded => 'Šis kontakts jau ir jūsu sarakstā';

  @override
  String get contactAdded => 'Kontakts pievienots';

  @override
  String get myProfile => 'Mans profils';

  @override
  String get myProfileSubtitle =>
      'Dalījieties ar šo informāciju, lai citi varētu jūs pievienot';

  @override
  String get temporaryCode => 'Pagaidu kods';

  @override
  String temporaryCodeExpires(String time) {
    return 'Beidzas pēc $time';
  }

  @override
  String get codeExpired => 'Kods beidzies';

  @override
  String get generateNewCodeButton => 'Jauns kods';

  @override
  String get copyHashId => 'Kopēt ID';

  @override
  String get copyCode => 'Kopēt kodu';

  @override
  String get copiedToClipboard => 'Nokopēts';

  @override
  String get showMyQrCode => 'Rādīt manu QR code';

  @override
  String get orDivider => 'vai';

  @override
  String get openScanner => 'Atvērt skeneri';

  @override
  String get addManually => 'Pievienot manuāli';

  @override
  String get contactHashIdLabel => 'Kontakta Hash ID';

  @override
  String get temporaryCodeLabel => 'Pagaidu kods';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Lūdziet kontaktam ģenerēt kodu no sava profila';

  @override
  String get verifyAndAdd => 'Pārbaudīt un pievienot';

  @override
  String get fillAllFields => 'Lūdzu, aizpildiet visus laukus';

  @override
  String get invalidHashIdFormat => 'Nederīgs ID formāts (piem.: 123-456-ABC)';

  @override
  String get userNotFound => 'Lietotājs nav atrasts';

  @override
  String get cannotAddYourself => 'Jūs nevarat pievienot sevi';

  @override
  String get invalidOrExpiredCode => 'Nederīgs vai beidzies pagaidu kods';

  @override
  String get contactFound => 'Kontakts atrasts!';

  @override
  String get howToCallContact => 'Kā jūs vēlaties viņu saukt?';

  @override
  String get contactNameHint => 'Kontakta vārds';

  @override
  String get addContactButton => 'Pievienot';

  @override
  String get contactDetails => 'Kontakta detaļas';

  @override
  String get contactName => 'Kontakta vārds';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Pievienots $date';
  }

  @override
  String get deleteContact => 'Dzēst kontaktu';

  @override
  String deleteContactConfirm(Object name) {
    return 'Dzēst šo kontaktu?';
  }

  @override
  String get deleteContactMessage => 'Tas arī dzēsīs visu sarunu.';

  @override
  String get delete => 'Dzēst';

  @override
  String get typeMessage => 'Rakstīt ziņu...';

  @override
  String get messageSent => 'Nosūtīts';

  @override
  String get messageDelivered => 'Piegādāts';

  @override
  String get messageRead => 'Izlasīts';

  @override
  String get messageFailed => 'Nosūtīšana neizdevās';

  @override
  String get now => 'Tagad';

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
  String get today => 'Šodien';

  @override
  String get yesterday => 'Vakar';

  @override
  String dateAtTime(String date, String time) {
    return '$date plkst. $time';
  }

  @override
  String get shareMessage =>
      'Pievienojies man Hash! 🔒\n\nTas ir patiesi privāts ziņojumu lietotne: pilnīga šifrēšana, nav pēdu serveros un pānikas režīms vajadzības gadījumā.\n\nLejupielādē lietotni šeit 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Kļūda';

  @override
  String get ok => 'Labi';

  @override
  String get view => 'Skatīt';

  @override
  String get yes => 'Jā';

  @override
  String get no => 'Nē';

  @override
  String get save => 'Saglabāt';

  @override
  String get edit => 'Rediģēt';

  @override
  String get close => 'Aizvērt';

  @override
  String get confirm => 'Apstiprināt';

  @override
  String get loading => 'Ielādē...';

  @override
  String get retry => 'Mēģināt vēlreiz';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Gaidītie pieprasījumi';

  @override
  String get noPendingRequests => 'Nav gaidīto pieprasījumu';

  @override
  String get pendingRequestsSubtitle => 'Šie cilvēki vēlas jūs pievienot';

  @override
  String requestFromUser(String hashId) {
    return 'Pieprasījums no $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Beidzas pēc $days dienām';
  }

  @override
  String get acceptRequest => 'Pieņemt';

  @override
  String get rejectRequest => 'Noraidīt';

  @override
  String get requestAccepted => 'Pieprasījums pieņemts';

  @override
  String get requestRejected => 'Pieprasījums noraidīts';

  @override
  String get requestSent => 'Pieprasījums nosūtīts!';

  @override
  String get requestSentSubtitle =>
      'Jūsu pieprasījums ir nosūtīts. Lietotājam tas jāpieņem pirms varat sākt sarunu.';

  @override
  String get requestAlreadyPending => 'Pieprasījums jau gaida';

  @override
  String get requestAlreadySentByOther =>
      'Šī persona jau ir nosūtījusi jums pieprasījumu';

  @override
  String get addByHashId => 'Pievienot ar Hash ID';

  @override
  String get addByHashIdSubtitle => 'Ievadiet kontakta Hash ID un pagaidu kodu';

  @override
  String get enterTemporaryCode => 'Ievadiet 6 ciparu kodu';

  @override
  String get sendRequest => 'Nosūtīt pieprasījumu';

  @override
  String get acceptContactTitle => 'Pieņemt kontaktu';

  @override
  String get acceptContactSubtitle => 'Varat piešķirt pielāgotu vārdu';

  @override
  String get leaveEmptyForHashId => 'Atstājiet tukšu, lai izmantotu Hash ID';

  @override
  String get firstName => 'Vārds';

  @override
  String get lastName => 'Uzvārds';

  @override
  String get notes => 'Piezīmes';

  @override
  String get notesHint => 'Personīgās piezīmes par šo kontaktu';

  @override
  String get photoOptional => 'Foto (neobligāti)';

  @override
  String get contactNameOptional => 'Vārds (neobligāti)';

  @override
  String get notesOptional => 'Piezīmes (neobligāti)';

  @override
  String get storedLocally => 'Glabājas tikai jūsu ierīcē';

  @override
  String get encryptedMessageLabel => 'Šifrēta ziņa';

  @override
  String get identityMessageHint => 'Kas jūs esat? Kā jūs pazīstat viens otru?';

  @override
  String get messageWillBeSentEncrypted =>
      'Šī ziņa tiks šifrēta un nosūtīta saņēmējam';

  @override
  String get sendRequestButton => 'Nosūtīt pieprasījumu';

  @override
  String get requestExpiresIn24h =>
      'Pieprasījums beidzas pēc 24h, ja netiek pieņemts';

  @override
  String get theyAlreadySentYouRequest =>
      'Šī persona jau ir nosūtījusi jums pieprasījumu';

  @override
  String get requests => 'Pieprasījumi';

  @override
  String get receivedRequests => 'Saņemtie';

  @override
  String get sentRequests => 'Nosūtītie';

  @override
  String get noSentRequests => 'Nav nosūtītu pieprasījumu';

  @override
  String get cancelRequest => 'Atcelt';

  @override
  String get deleteRequest => 'Dzēst pieprasījumu';

  @override
  String get requestCancelled => 'Pieprasījums atcelts';

  @override
  String sentTo(String hashId) {
    return 'Nosūtīts $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Beidzas pēc $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Saņemts pirms $time';
  }

  @override
  String get messageFromRequester => 'Ziņa no pieprasītāja';

  @override
  String get copy => 'Kopēt';

  @override
  String get messageInfo => 'Ziņas informācija';

  @override
  String get messageDirection => 'Virziens';

  @override
  String get messageSentByYou => 'Nosūtīts no jums';

  @override
  String get messageReceived => 'Saņemts';

  @override
  String get messageSentAt => 'Nosūtīts';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Statuss';

  @override
  String get messageReadAt => 'Izlasīts';

  @override
  String get messageType => 'Tips';

  @override
  String get messageSize => 'Izmērs';

  @override
  String get messageExpiresAt => 'Beidzas';

  @override
  String get messageEncrypted => 'Pilna šifrēšana';

  @override
  String get messageStatusSending => 'Sūta...';

  @override
  String get messageStatusSent => 'Nosūtīts';

  @override
  String get messageStatusDelivered => 'Piegādāts';

  @override
  String get messageStatusRead => 'Izlasīts';

  @override
  String get messageStatusFailed => 'Neizdevās';

  @override
  String get serverStatus => 'Serveris';

  @override
  String get onServer => 'Gaida piegādi';

  @override
  String get deletedFromServer => 'Dzēsts';

  @override
  String get messageTypeText => 'Teksts';

  @override
  String get messageTypeImage => 'Attēls';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Balss';

  @override
  String get messageTypeFile => 'Fails';

  @override
  String get indefinitely => 'Bezgalīgi';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'stundas';

  @override
  String get minutes => 'minūtes';

  @override
  String get seconds => 'sekundes';

  @override
  String get ephemeralMessages => 'īslaicīgas ziņas';

  @override
  String get ephemeralMessagesDescription =>
      'Ziņas tiek automātiski dzēstas pēc šī laika';

  @override
  String get ephemeralImmediate => 'Tūlītēji (pēc izlasīšanas)';

  @override
  String get ephemeralImmediateDesc => 'Dzēsts, tiklīdz izlasīts';

  @override
  String get ephemeralMyPreference => 'Mana preference';

  @override
  String get ephemeralMyPreferenceDesc => 'Izmantot globālo iestatījumu';

  @override
  String get ephemeralDefaultSetting => 'Ziņu ilgums';

  @override
  String get ephemeralChooseDefault => 'Ieteicams';

  @override
  String get ephemeral30Seconds => '30 sekundes';

  @override
  String get ephemeral30SecondsDesc => 'Dzēsts 30s pēc lasīšanas';

  @override
  String get ephemeral5Minutes => '5 minūtes';

  @override
  String get ephemeral5MinutesDesc => 'Dzēsts 5min pēc lasīšanas';

  @override
  String get ephemeral1Hour => '1 stunda';

  @override
  String get ephemeral1HourDesc => 'Dzēsts 1h pēc lasīšanas';

  @override
  String get ephemeral3Hours => '3 stundas';

  @override
  String get ephemeral6Hours => '6 stundas';

  @override
  String get ephemeral6HoursDesc => 'Dzēsts 6h pēc lasīšanas';

  @override
  String get ephemeral12Hours => '12 stundas';

  @override
  String get ephemeral24Hours => '24 stundas';

  @override
  String get ephemeral24HoursDesc => 'Dzēsts 24h pēc lasīšanas';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Pielāgots ilgums';

  @override
  String get howItWorks => 'Kā tas darbojas';

  @override
  String get ephemeralExplanation1 =>
      'Ziņas tiek dzēstas no servera, tiklīdz saņemtas.';

  @override
  String get ephemeralExplanation2 =>
      'Šis iestatījums nosaka, kad ziņas pazudīs no JūSU tālruņa pēc izlasīšanas.';

  @override
  String get ephemeralExplanation3 =>
      'Jūsu kontaktam ir savs iestatījums savam tālrunim.';

  @override
  String get mute1Hour => '1 stunda';

  @override
  String get mute8Hours => '8 stundas';

  @override
  String get mute1Day => '1 diena';

  @override
  String get mute1Week => '1 nedēļa';

  @override
  String get muteAlways => 'Vienmēr';

  @override
  String get muteExplanation => 'Jūs nesaņemsiet paziņojumus par šo kontaktu';

  @override
  String get showCallsInRecents => 'Rādīt nesenajiem zvaniem';

  @override
  String get showCallsInRecentsSubtitle => 'Hash zvani parādās tālruņa vēsturē';

  @override
  String get feedback => 'Atsauksmes';

  @override
  String get muteNotifications => 'Apklusināt paziņojumus';

  @override
  String get muteDescription => 'Jūs nesaņemsiet paziņojumus par šo kontaktu';

  @override
  String mutedUntil(String time) {
    return 'Apklusināts līdz $time';
  }

  @override
  String get notMuted => 'Paziņojumi ieslēgti';

  @override
  String get unmute => 'Atcelt apklusināšanu';

  @override
  String get notificationSound => 'Paziņojuma skaņa';

  @override
  String get defaultSound => 'Noklusējuma';

  @override
  String get chatSettings => 'Sarunas iestatījumi';

  @override
  String get bubbleColor => 'Burbuļa krāsa';

  @override
  String get backgroundColor => 'Fona krāsa';

  @override
  String get backgroundImage => 'Fona attēls';

  @override
  String get chatBackground => 'Sarunas fons';

  @override
  String get customColor => 'Pielāgota';

  @override
  String get defaultColor => 'Noklusējuma';

  @override
  String get imageSelected => 'Attēls izvēlēts';

  @override
  String get noImage => 'Nav attēla';

  @override
  String get color => 'Krāsa';

  @override
  String get image => 'Attēls';

  @override
  String get tapToSelectImage => 'Pieskarieties, lai izvēlētos attēlu';

  @override
  String get changeImage => 'Mainīt attēlu';

  @override
  String get previewMessageReceived => 'Sveiki!';

  @override
  String get previewMessageSent => 'Čau!';

  @override
  String get messageAction => 'Ziņa';

  @override
  String get callAction => 'Zvans';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Personīgās piezīmes';

  @override
  String get addNotes => 'Pievienot piezīmes...';

  @override
  String get noNotes => 'Nav piezīmju';

  @override
  String get messageNotifications => 'Ziņu paziņojumi';

  @override
  String get callNotifications => 'Zvanu paziņojumi';

  @override
  String get useGradient => 'Izmantot gradientu';

  @override
  String get gradientStart => 'Sākuma krāsa';

  @override
  String get gradientEnd => 'Beigu krāsa';

  @override
  String get preview => 'Priekšskatījums';

  @override
  String get reset => 'Atiestatīt';

  @override
  String get securityNumber => 'Drošības numurs';

  @override
  String securityNumberDescription(String name) {
    return 'Pārbaudiet, vai drošības numurs sakrīt ar $name ierīci';
  }

  @override
  String get verifyEncryption => 'Pārbaudīt pilno šifrēšanu';

  @override
  String get tapToCopy => 'Pieskarieties, lai kopētu';

  @override
  String get howToVerify => 'Kā pārbaudīt';

  @override
  String get verifyStep1 => 'Tiecieties ar kontaktu personīgi vai piezvaniet';

  @override
  String get verifyStep2 =>
      'Salīdziniet drošības numurus vai skenējiet QR code';

  @override
  String get verifyStep3 => 'Ja tie sakrīt, jūsu saruna ir droša';

  @override
  String get scanToVerify => 'Skenēt, lai pārbaudītu';

  @override
  String get reportSpam => 'Ziņot par mēstuli';

  @override
  String get reportSpamSubtitle => 'Ziņot par šo kontaktu kā mēstuli';

  @override
  String get reportSpamDescription =>
      'Tas anonīmi ziņos par šo kontaktu. Jūsu identitāte netiks kopīgota. Vai esat pārliecināts?';

  @override
  String get report => 'Ziņot';

  @override
  String get spamReported => 'Ziņots par mēstuli';

  @override
  String get reportError =>
      'Neizdevās nosūtīt ziņojumu. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get reportRateLimited =>
      'Jūs esat sasniedzis maksimālo ziņojumu skaitu šodienai.';

  @override
  String get blockContact => 'Bloķēt kontaktu';

  @override
  String get blockContactDescription =>
      'Šis kontakts vairs nevarēs jums sūtīt ziņas vai zvanīt. Viņš netiks informēts.';

  @override
  String get unblockContact => 'Atbloķēt kontaktu';

  @override
  String get unblockContactDescription =>
      'Šis kontakts atkal varēs jums sūtīt ziņas un zvanīt.';

  @override
  String get contactBlocked => 'Kontakts bloķēts';

  @override
  String get contactUnblocked => 'Kontakts atbloķēts';

  @override
  String get contactIsBlocked => 'Šis kontakts ir bloķēts';

  @override
  String get unblock => 'Atbloķēt';

  @override
  String get deleteContactSubtitle => 'Dzēst šo kontaktu un sarunu';

  @override
  String get confirmWithPin => 'Apstiprināt ar PIN';

  @override
  String get enterPinToConfirm => 'Ievadiet PIN, lai apstiprinātu šo darbību';

  @override
  String get profilePhoto => 'Profila foto';

  @override
  String get takePhoto => 'Uzņemt foto';

  @override
  String get chooseFromGallery => 'Izvēlēties no galerijas';

  @override
  String get removePhoto => 'Noņemt foto';

  @override
  String get viewContactHashId => 'Skatīt kontakta identifikatoru';

  @override
  String get hashIdPartiallyMasked =>
      'Daļēji maskēts jūsu un kontakta privātuma dēļ';

  @override
  String get addFirstContact => 'Pievienojiet pirmo kontaktu';

  @override
  String get addFirstContactSubtitle =>
      'Dalījieties ar savu QR code vai skenējiet drauga QR code';

  @override
  String get directory => 'Direktorija';

  @override
  String get noContacts => 'Nav kontaktu';

  @override
  String get noContactsSubtitle => 'Pievienojiet kontaktu, lai sāktu';

  @override
  String get sendMessageAction => 'Nosūtīt ziņu';

  @override
  String get audioCall => 'Audio zvans';

  @override
  String get videoCall => 'Video zvans';

  @override
  String get viewProfile => 'Skatīt profilu';

  @override
  String get deleteContactDirectory => 'Dzēst kontaktu';

  @override
  String get scanShort => 'Skenēt';

  @override
  String get addShort => 'Pievienot';

  @override
  String deleteContactConfirmName(String name) {
    return 'Vai tiešām vēlaties dzēst $name?';
  }

  @override
  String get noNotesTitle => 'Nav piezīmju';

  @override
  String get noNotesSubtitle => 'Izveidojiet savu pirmo piezīmi';

  @override
  String get newNote => 'Jauna piezīme';

  @override
  String get editNote => 'Rediģēt piezīmi';

  @override
  String get deleteNote => 'Dzēst piezīmi';

  @override
  String get deleteNoteConfirm => 'Vai tiešām vēlaties dzēst šo piezīmi?';

  @override
  String get noteTitle => 'Virsraksts';

  @override
  String get noteContent => 'Saturs';

  @override
  String get addItem => 'Pievienot vienību';

  @override
  String get pinNote => 'Piespraust';

  @override
  String get unpinNote => 'Atspraust';

  @override
  String get noteColor => 'Krāsa';

  @override
  String get notePassword => 'Parole';

  @override
  String get setPassword => 'Iestatīt paroli';

  @override
  String get changePassword => 'Mainīt paroli';

  @override
  String get removePassword => 'Noņemt paroli';

  @override
  String get enterPassword => 'Ievadīt paroli';

  @override
  String get confirmPassword => 'Apstiprināt paroli';

  @override
  String get passwordPin => 'PIN kods';

  @override
  String get passwordText => 'Teksta parole';

  @override
  String get protectedNote => 'Aizsargāta piezīme';

  @override
  String get incorrectPassword => 'Nepareiza parole';

  @override
  String get passwordSet => 'Parole iestatīta';

  @override
  String get passwordRemoved => 'Parole noņemta';

  @override
  String get notesBiometric => 'Face ID piezīmēm';

  @override
  String get notesBiometricSubtitle =>
      'Pieprasīt biometrisko autentifikāciju, lai atvērtu aizsargātas piezīmes';

  @override
  String get textNote => 'Teksta piezīme';

  @override
  String get checklistNote => 'Kontrolsaraksts';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total uzdevumi';
  }

  @override
  String get autoSaved => 'Saglabāts';

  @override
  String get searchNotes => 'Meklēt piezīmes';

  @override
  String get legalConsent => 'Juridiskā piekrišana';

  @override
  String get confirmAge13 => 'Apstiprināt, ka man ir vismaz 13 gadi';

  @override
  String get acceptLegalStart => 'Es piekrītu ';

  @override
  String get privacyPolicy => 'Privātuma politikai';

  @override
  String get termsOfService => 'Lietošanas noteikumiem';

  @override
  String get andThe => ' un ';

  @override
  String get continueButton => 'Turpināt';

  @override
  String get mustAcceptTerms => 'Jums jāpieņem abi nosacījumi, lai turpinātu';

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
  String get support => 'Atbalsts';

  @override
  String get contactSupport => 'Sazināties ar atbalstu';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Ziņot par ļaunātnošanu';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Juridiskais';

  @override
  String get legalEntity => 'Juridiskā persona';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Piespraust';

  @override
  String get unpinConversation => 'Atspraust';

  @override
  String get hideConversation => 'Noņemt no plūsmas';

  @override
  String get deleteConversation => 'Dzēst sarunu';

  @override
  String get deleteConversationConfirm =>
      'Ievadiet PIN, lai apstiprinātu visu ziņu dzēšanu';

  @override
  String get noConversations => 'Vēl nav sarunu';

  @override
  String get startConversation => 'Sākt';

  @override
  String get microphonePermissionRequired => 'Nepieciešama mikrofona piekļuve';

  @override
  String get microphonePermissionExplanation =>
      'Hash nepieciešams mikrofons, lai veiktu zvanus.';

  @override
  String get cameraPermissionExplanation =>
      'Hash nepieciešama kamera video zvaniem.';

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
  String get openSettings => 'Atvērt iestatījumus';

  @override
  String get callConnecting => 'Savienojas...';

  @override
  String get callRinging => 'Zvana...';

  @override
  String get callReconnecting => 'Atkārtoti savienojas...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Atkārtoti savienojas (${seconds}s)';
  }

  @override
  String get callPaused => 'Apturēts';

  @override
  String get callPausedSubtitle => 'Zvans joprojām ir aktīvs';

  @override
  String get callRemoteMicMuted => 'Kontakta mikrofons ir apklusināts';

  @override
  String get callMiniControlsMute => 'Apklusināt';

  @override
  String get callMiniControlsUnmute => 'Ieslēgt skaņu';

  @override
  String get callMiniControlsHangUp => 'Nolikt klausi';

  @override
  String get callMiniControlsReturn => 'Atgriezties zvanā';

  @override
  String get callNetworkPoor => 'Nestabīls savienojums';

  @override
  String get callNetworkLost => 'Savienojums zaudēts';

  @override
  String get callEndedTitle => 'Zvans beidzies';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Ierīces dati';

  @override
  String get deviceDataSubtitle => 'Lokālā un servera krātuve';

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
  String get localStorage => 'Lokālā krātuve';

  @override
  String get onThisDevice => 'šajā ierīcē';

  @override
  String get encryptedDatabases => 'Šifrētas datubāzes';

  @override
  String get files => 'Faili';

  @override
  String get secureKeychain => 'Drošā atslēgu ķēde';

  @override
  String get cache => 'Kešatmiņa';

  @override
  String get contactsDetail => 'Vārdi, avatāri, Signal atslēgas';

  @override
  String get messagesDetail => 'Šifrētas sarunas';

  @override
  String get notesDetail => 'Personīgās piezīmes';

  @override
  String get signalSessions => 'Signal sesijas';

  @override
  String get signalSessionsDetail => 'Šifrēšanas sesijas';

  @override
  String get pendingContacts => 'Gaidītie kontakti';

  @override
  String get pendingContactsDetail => 'Gaidītie pieprasījumi';

  @override
  String get callHistory => 'Zvani';

  @override
  String get callHistoryDetail => 'Zvanu vēsture';

  @override
  String get preferences => 'Iestatījumi';

  @override
  String get preferencesDetail => 'Multivides un zvanu iestatījumi';

  @override
  String get avatars => 'Avatāri';

  @override
  String get media => 'Multivide';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count faili',
      one: '1 fails',
      zero: 'nav failu',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktīvs';

  @override
  String get notDefined => 'Nav noteikts';

  @override
  String get biometrics => 'Biometrija';

  @override
  String get recoveryPhrase => 'Atjaunošanas frāze';

  @override
  String get identity => 'Identitāte (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol atslēgas';

  @override
  String get authTokens => 'Autentifikācijas marķieri';

  @override
  String get contactNamesCache => 'Kontaktu vārdu kešatmiņa';

  @override
  String get remoteConfig => 'Attālā konfigurācija';

  @override
  String get notificationPrefs => 'Paziņojumu iestatījumi';

  @override
  String get serverData => 'Servera dati';

  @override
  String get serverDataInfo =>
      'Hash glabā minimālus datus serverī, visus šifrētus vai īslaicīgus.';

  @override
  String get serverProfile => 'Profils';

  @override
  String get serverProfileDetail =>
      'Hash ID, publiskās atslēgas, pastkastes marķieris';

  @override
  String get serverPrekeys => 'Iepriekšējās atslēgas';

  @override
  String get serverPrekeysDetail => 'Vienreizējās Signal atslēgas (izlietotas)';

  @override
  String get serverMessages => 'Ziņas tranzītā';

  @override
  String get serverMessagesDetail => 'Dzēstas pēc piegādes (maks. 24h)';

  @override
  String get serverMedia => 'Multivide tranzītā';

  @override
  String get serverMediaDetail => 'Dzēsta pēc lejupielādes';

  @override
  String get serverContactRequests => 'Kontaktu pieprasījumi';

  @override
  String get serverContactRequestsDetail => 'Beidzas pēc 24h';

  @override
  String get serverRateLimits => 'Ātruma ierobežojumi';

  @override
  String get serverRateLimitsDetail => 'īslaicīgi pretļaunprātības dati';

  @override
  String get privacyReassurance =>
      'Hash nevar lasīt jūsu ziņas. Visi dati ir pilnībā šifrēti. Servera dati tiek automātiski dzēsti.';

  @override
  String get pinTooSimple =>
      'Šis PIN ir pārāk vienkāršs. Izvēlieties drošāku kodu.';

  @override
  String get genericError => 'Radās kļūda. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nevar izveidot kontu: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frāze nokopēta starpliktuvē';

  @override
  String get copyPhrase => 'Kopēt frāzi';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Pierakstiet šo frāzi drošā vietā. Ja zaudēsiet PIN bez šīs frāzes, jūs neatgriezeniski zaudēsiet piekļuvi datiem.';

  @override
  String get noMessages => 'Nav ziņu';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Dzēst visas ziņas ar $name?';
  }

  @override
  String get confirmation => 'Apstiprinājums';

  @override
  String get untitled => 'Bez nosaukuma';

  @override
  String get noSessions => 'Nav sesiju';

  @override
  String get unknownContact => 'Nezināms kontakts';

  @override
  String get unnamed => 'Bez vārda';

  @override
  String get noPendingRequestsAlt => 'Nav gaidītu pieprasījumu';

  @override
  String get deleteAllCallHistory => 'Dzēst visu zvanu vēsturi?';

  @override
  String get noCalls => 'Nav zvanu';

  @override
  String get noPreferences => 'Nav iestatījumu';

  @override
  String get resetAllMediaPrefs => 'Atiestatīt visus multivides iestatījumus?';

  @override
  String get deleteThisAvatar => 'Dzēst šo avatāru?';

  @override
  String get deleteAllAvatars => 'Dzēst visus avatārus?';

  @override
  String get noAvatars => 'Nav avatāru';

  @override
  String get deleteThisFile => 'Dzēst šo failu?';

  @override
  String get deleteAllMediaFiles => 'Dzēst visu multividi?';

  @override
  String get noMediaFiles => 'Nav multivides';

  @override
  String get outgoing => 'Izejošais';

  @override
  String get incoming => 'Ienākošais';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'īslaicīgs skats: ${seconds}s';
  }

  @override
  String get normalView => 'Parasts skats';

  @override
  String get callReasonCompleted => 'Pabeigts';

  @override
  String get callReasonMissed => 'Neatbildēts';

  @override
  String get callReasonDeclined => 'Noraidīts';

  @override
  String get callReasonFailed => 'Neizdevās';

  @override
  String get justNow => 'Tikko';

  @override
  String timeAgoMinutes(int count) {
    return 'pirms $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'pirms ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'pirms ${count}d';
  }

  @override
  String get messageTypeContact => 'Kontakts';

  @override
  String get messageTypeLocation => 'Atrašanās vieta';

  @override
  String get statusQueued => 'Rindā';

  @override
  String get blockedBadge => 'Bloķēts';

  @override
  String get protectedBadge => 'Aizsargāts';

  @override
  String messageCount(int count) {
    return '$count ziņa(-as)';
  }

  @override
  String get deleteQuestion => 'Dzēst?';

  @override
  String get transferMyAccountTitle => 'Pārsūtīt manu kontu';

  @override
  String get loadingError => 'Ielādes kļūda';

  @override
  String get transferToNewDevice => 'Pārsūtīt uz jaunu ierīci';

  @override
  String get transferInstructions =>
      'Jaunajā ierīcē izvēlieties “Atjaunot manu kontu” un ievadiet šo informāciju:';

  @override
  String get yourHashIdLabel => 'Jūsu Hash ID';

  @override
  String get enterYourPinCode => 'Ievadiet savu PIN kodu';

  @override
  String get pinOwnerConfirmation =>
      'Lai apstiprinātu, ka esat šī konta īpašnieks';

  @override
  String get scanThisQrCode => 'Skenējiet šo QR code';

  @override
  String get withYourNewDevice => 'Ar jūsu jauno ierīci';

  @override
  String get orEnterTheCode => 'vai ievadiet kodu';

  @override
  String get transferCodeLabel => 'Pārsūtīšanas kods';

  @override
  String get proximityVerification => 'Tuvības pārbaude';

  @override
  String get bringDevicesCloser => 'Tuviniet abas ierīces';

  @override
  String get confirmTransferQuestion => 'Apstiprināt pārsūtīšanu?';

  @override
  String get accountWillBeTransferred =>
      'Jūsu konts tiks pārsūtīts uz jauno ierīci.\n\nŠī ierīce tiks pastāvīgi atvienota.';

  @override
  String get transferComplete => 'Pārsūtīšana pabeigta';

  @override
  String get transferSuccessMessage =>
      'Jūsu konts ir veiksmīgi pārsūtīts.\n\nŠī lietotne tagad tiks aizvērta.';

  @override
  String get manualVerification => 'Manuāla pārbaude';

  @override
  String get codeDisplayedOnBothDevices => 'Kods, kas parādīts abās ierīcēs:';

  @override
  String get doesCodeMatchNewDevice =>
      'Vai šis kods sakrīt ar jaunās ierīces kodu?';

  @override
  String get verifiedStatus => 'Pārbaudīts';

  @override
  String get inProgressStatus => 'Norit...';

  @override
  String get notAvailableStatus => 'Nav pieejams';

  @override
  String get codeExpiredRestart => 'Kods ir beidzies. Lūdzu, sāciet no jauna.';

  @override
  String get codesDoNotMatchCancelled => 'Kodi nesakrīt. Pārsūtīšana atcelta.';

  @override
  String transferToDevice(String device) {
    return 'Uz: $device';
  }

  @override
  String get copiedExclamation => 'Nokopēts!';

  @override
  String expiresInTime(String time) {
    return 'Beidzas pēc $time';
  }

  @override
  String get biometricNotAvailable => 'Biometrija nav pieejama šajā ierīcē';

  @override
  String get biometricAuthError => 'Kļūda biometriskās autentifikācijas laikā';

  @override
  String get authenticateForBiometric =>
      'Lūdzu, autentificējieties, lai ieslēgtu biometriju';

  @override
  String get biometricAuthFailed => 'Biometriskā autentifikācija neizdevās';

  @override
  String get forceUpdateTitle => 'Nepieciešams atjauninājums';

  @override
  String get forceUpdateMessage =>
      'Ir pieejama jauna Hash versija. Lūdzu, atjauniniet, lai turpinātu.';

  @override
  String get updateButton => 'Atjaunināt';

  @override
  String get maintenanceInProgress => 'Notiek apkope';

  @override
  String get tryAgainLater => 'Lūdzu, mēģiniet vēlāk';

  @override
  String get information => 'Informācija';

  @override
  String get later => 'Vēlāk';

  @override
  String get doYouLikeHash => 'Vai jums patīk Hash?';

  @override
  String get yourFeedbackHelps =>
      'Jūsu atsauksmes palīdz mums uzlabot lietotni';

  @override
  String get ratingTerrible => 'Šausmīgi';

  @override
  String get ratingBad => 'Slikti';

  @override
  String get ratingOk => 'Normāli';

  @override
  String get ratingGood => 'Labi';

  @override
  String get ratingExcellent => 'Lieliski!';

  @override
  String get donationMessage =>
      'Hash ir bezpeļņas projekts. Jūsu atbalsts palīdz mums turpināt veidot patiesi privātu ziņojumu lietotni.';

  @override
  String get recentConnections => 'Nesenie savienojumi';

  @override
  String get loginInfoText =>
      'Katra PIN atbloķēšana tiek ierakstīta lokāli. Tiek saglabātas tikai pēdējās 24 stundas.';

  @override
  String get connectionCount => 'Savienojums(i)';

  @override
  String get periodLabel => 'Periods';

  @override
  String get historyLabel => 'Vēsture';

  @override
  String get noLoginRecorded => 'Nav reģistrētu pieteikšanos';

  @override
  String get nextUnlocksAppearHere => 'Nākamās atbloķēšanas parādīsies šeit.';

  @override
  String get dataLocalOnly =>
      'Šie dati tiek glabāti tikai jūsu ierīcē un nekad netiek pārsūtīti.';

  @override
  String get currentSession => 'Pašreizējā';

  @override
  String get todayLabel => 'Šodien';

  @override
  String get yesterdayLabel => 'Vakar';

  @override
  String get justNowLabel => 'Tikko';

  @override
  String minutesAgoLabel(int count) {
    return 'Pirms $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Pirms ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Pirms ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Nav plānota apkope';

  @override
  String get everythingWorkingNormally => 'Viss darbojas normāli';

  @override
  String get maintenanceTitle => 'Uzturēšana';

  @override
  String get maintenanceActiveLabel => 'NOTIEK';

  @override
  String get maintenancePlannedLabel => 'PLĀNOTA';

  @override
  String get locking => 'Bloķē...';

  @override
  String get newMessageNotification => 'Jauna ziņa';

  @override
  String get secExplainTitle => 'Kā Hash jūs aizsargā';

  @override
  String get secExplainIntro =>
      'Hash ir izveidots tā, lai neviens nevarētu lasīt jūsu ziņas.';

  @override
  String get secExplainIntroSub =>
      'Pat mēs ne.\nLūk, kā tas darbojas, izskaidrots vienkārši.';

  @override
  String get secJourneyLabel => 'CEĻŠ';

  @override
  String get secJourneyTitle => 'Jūsu ziņas ceļš';

  @override
  String get secJourneySubtitle =>
      'No jūsu pirksta līdz kontakta ekrānam, katrs solis ir aizsargāts. Sekojiet ceļam.';

  @override
  String get secStep1Title => 'Jūs rakstāt ziņu';

  @override
  String get secStep1Desc =>
      'Jūs ierakstāt “Sveiki!” lietotnē. Šobrīd ziņa pastāv tikai jūsu tālruņa atmiņā. Nekas nav nosūtīts.';

  @override
  String get secStep2Title => 'Šifrēšana ar Signal Protocol';

  @override
  String get secStep2Desc =>
      'Tiklīdz nospiežat “Nosūtīt”, jūsu ziņa tiek pārvērsta nesaprotamā rakstzīmju virknē. Tas ir kā ieslēgt ziņu seifā, kuram atslēga ir tikai jūsu kontaktam.';

  @override
  String get secStep3Title => 'Aizzīmogots sūtītājs: neredzamā aploksne';

  @override
  String get secStep3Desc =>
      'Iedomājieties, ka sūtāt vēstuli pa pastu, bet bez atpakaļ adreses uz aploksnes. Tieši to dara Hash. Ziņa tiek ievietota anonīmā pastkastītē. Serveris nezina, kas to nosūtīja.';

  @override
  String get secStep4Title => 'Serveris neredz neko';

  @override
  String get secStep4Desc =>
      'Serveris darbojas kā akls pastnieks. Tas zina tikai “kāds ievietoja kaut ko pastkastītē #A7X9”. Tas nezina, kas to nosūtīja, kas tas ir, vai kam tas domāts.';

  @override
  String get secStep4Highlight =>
      'Nav saglabātu metadatu: nav IP adreses, nav laikspiedoga, nav saites starp sūtītāju un saņēmēju.';

  @override
  String get secStep5Title => 'Jūsu kontakts saņem ziņu';

  @override
  String get secStep5Desc =>
      'Jūsu kontakta tālrunis izņem saturu no anonīmās pastkastītes un atšifrē ziņu ar privāto atslēgu, kas nekad nav pametusi ierīci. “Sveiki!” parādās ekrānā.';

  @override
  String get secStep6Title => 'Ziņa pazūd no servera';

  @override
  String get secStep6Desc =>
      'Tiklīdz kontakts apstiprina saņemšanu, serveris neatgriezeniski dzēš ziņu. Nav atkritnes, nav arhīva, nav rezerves kopijas. Pat neizlasītas ziņas tiek automātiski iznīcinātas pēc 24 stundām.';

  @override
  String get secStep7Title => 'Lokālā termiņš';

  @override
  String get secStep7Desc =>
      'Kontakta tālrunī ziņa pašiznīcinās atbilstoši jūsu izvēlētajam ilgumam: tūlīt pēc izlasīšanas, 5 minūtes, 1 stunda... jūs izlemjat.';

  @override
  String get secJourneyConclusion =>
      'Rezultāts: nulles pēdas serverī, nulles pēdas ierīcēs. Ziņa pastāvēja tikai tik ilgi, cik nepieciešams, lai to izlasītu, tad pazuda.';

  @override
  String get secArchLabel => 'ARHITEKTŪRA';

  @override
  String get secArchTitle => '5 aizsardzības slāņi';

  @override
  String get secArchSubtitle =>
      'Hash nepaļaujas uz vienu tehnoloģiju. Katrs slānis pastiprina pārējos. Pat ja viens slānis tiek kompromitēts, jūsu dati paliek drošībā.';

  @override
  String get secLayer1Title => 'Pilna šifrēšana';

  @override
  String get secLayer1Desc =>
      'Katra ziņa tiek šifrēta ar unikālu atslēgu. Vienkārši: pat ja kāds atšifrē vienu ziņu, viņš nevarēs atšifrēt nākamo. Katrai ziņai ir sava slēdzene.';

  @override
  String get secLayer1Detail =>
      'Failiem (fotoattēli, video, dokumenti) Hash izmanto papildu AES-256-GCM šifrēšanu. Fails tiek šifrēts, pirms tas pamet jūsu tālruni.';

  @override
  String get secLayer2Title => 'Aizzīmogots sūtītājs (tīkla anonimitāte)';

  @override
  String get secLayer2Desc =>
      'Parastās ziņojumu lietotnes sūta ziņas ar jūsu pievienoto identitāti. Tas ir kā rakstīt vārdu uz aploksnes. Hash izmanto anonīmas pastkastītes: serveris piegādā ziņu, nezinot, kas to nosūtīja.';

  @override
  String get secLayer2Detail =>
      'Rezultāts: pat servera datu noplūdes gadījumā nav iespējams rekonstruēt, kas ar ko sarunājas.';

  @override
  String get secLayer3Title => 'Automātiskā dzēšana';

  @override
  String get secLayer3Desc =>
      'Ziņas tiek dzēstas no servera, tiklīdz saņemšana ir apstiprināta. Pat ja ziņa nekad netiek saņemta, tā automātiski tiek iznīcināta pēc 24 stundām.';

  @override
  String get secLayer3Detail =>
      'Jūsu tālrunī ziņas pašiznīcinās atbilstoši izvēlētajam ilgumam: tūlīt, 5 min, 15 min, 30 min, 1h, 3h, 6h vai 12h.';

  @override
  String get secLayer4Title => 'Lokālā piekļuves aizsardzība';

  @override
  String get secLayer4Desc =>
      'Lietotne ir aizsargāta ar 6 ciparu PIN un/vai biometriju (Face ID, pirkstu nospiedums). Pēc pārāk daudziem neveiksmīgiem mēģinājumiem lietotne bloķējas ar pieaugošu aizkavi pēc katras neizdošanās.';

  @override
  String get secLayer5Title => 'Noslēgta datubāze';

  @override
  String get secLayer5Desc =>
      'Servera pusē neviens lietotājs nevar tieši rakstīt datubāzē. Visas darbības iet caur drošām funkcijām, kas pārbauda katru pieprasījumu.';

  @override
  String get secLayer5Detail =>
      'Tas ir kā bankas skatis: jūs nekad nepieskaraties seifam pats. Jūs izsakāt pieprasījumu, un sistēma pārbauda, vai jums ir tiesības, pirms rīkojas.';

  @override
  String get secVashLabel => 'UNIKĀLS PASAULĒ';

  @override
  String get secVashTitle => 'Vash režīms';

  @override
  String get secVashSubtitle =>
      'Ārkārtas drošības sistēma, kas neeksistē nevienā citā ziņojumu lietotnē.';

  @override
  String get secVashScenarioTitle => 'Iedomājieties šo situāciju';

  @override
  String get secVashScenario1 => 'Kāds piekļūst jūsu tālrunim';

  @override
  String get secVashScenario2 => 'Jums prasa PIN kodu';

  @override
  String get secVashScenario3 => 'Vēlaties steidzami dzēst visus datus';

  @override
  String get secVashSolutionTitle => 'Risinājums: divi PIN kodi';

  @override
  String get secVashSolutionDesc =>
      'Jūs konfigurējat divus dažādus PIN kodus Hash:';

  @override
  String get secVashNormalCodeLabel => 'Parastais kods';

  @override
  String get secVashNormalCodeDesc => 'Atver lietotni normāli ar visiem datiem';

  @override
  String get secVashCodeLabel2 => 'Vash kods';

  @override
  String get secVashCodeDescription =>
      'Atver lietotni normāli... bet visi dati tiek klusi dzēsti fonā';

  @override
  String get secVashWhatHappensTitle => 'Kas notiek tālāk';

  @override
  String get secVashWhatHappensDesc =>
      'Lietotne atvēras normāli. Nav brīdinājuma, nav aizdomīgas animācijas. Ekrāns vienkārši rāda tukšu lietotni, it kā jūs to tikko instalējāt.\n\nPatīām visas jūsu sarunas, kontakti un ziņas ir neatgriezeniski dzēsti sekundes daļā.';

  @override
  String get secCallsLabel => 'ZVANI UN FAILI';

  @override
  String get secCallsTitle => 'Viss ir šifrēts';

  @override
  String get secCallsSubtitle =>
      'Tas nav tikai ziņas. Pilnīgi viss, kas iet caur Hash, ir pilnībā šifrēts.';

  @override
  String get secAudioCallTitle => 'Audio zvani';

  @override
  String get secAudioCallDesc =>
      'Pilna šifrēšana caur WebRTC. Balss tiek pārraidīta tieši starp ierīcēm.';

  @override
  String get secVideoCallTitle => 'Video zvani';

  @override
  String get secVideoCallDesc =>
      'Tā pati tehnoloģija, katrs plūsma šifrēta individuāli.';

  @override
  String get secPhotosTitle => 'Fotoattēli un video';

  @override
  String get secPhotosDesc =>
      'Šifrēti ar AES-256-GCM pirms aiziešanas no tālruņa.';

  @override
  String get secDocsTitle => 'Dokumenti';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, jebkurš fails. Nosaukums, izmērs un saturs šifrēts.';

  @override
  String get secAnonLabel => 'ANONIMITĀTE';

  @override
  String get secAnonTitle => 'Nav nepieciešama identitāte';

  @override
  String get secAnonSubtitle =>
      'Hash nekad neprasa jūsu tālruņa numuru vai e-pastu. Jūs esat identificēts ar unikālu un anonīmu Hash ID.';

  @override
  String get secHashIdTitle => 'Jūsu Hash ID';

  @override
  String get secHashIdDesc =>
      'Šis ir jūsu unikālais identifikators. Tas neatkļāj neko par jums: ne jūsu vārdu, ne numuru, ne atrašanās vietu. Tas ir kā pseidonīms, ko neiespējami saistīt ar jūsu īsto identitāti.\n\nLai pievienotu kontaktu, jūs dalāties ar savu Hash ID vai skenējat QR code. Tas ir viss. Nav sinhronizētu adrešu grāmatu, nav “Cilvēki, kurus varētu pazīt” ieteikumu.';

  @override
  String get secDataLabel => 'DATI';

  @override
  String get secDataTitle => 'Ko Hash nezina';

  @override
  String get secDataSubtitle =>
      'Labākais veids, kā aizsargāt jūsu datus, ir tos neievākt.';

  @override
  String get secNeverCollected => 'Nekad netiek ievākts';

  @override
  String get secNeverItem1 => 'Ziņu saturs';

  @override
  String get secNeverItem2 => 'Kontaktu saraksts';

  @override
  String get secNeverItem3 => 'Tālruņa numurs';

  @override
  String get secNeverItem4 => 'E-pasta adrese';

  @override
  String get secNeverItem5 => 'IP adrese';

  @override
  String get secNeverItem6 => 'Atrašanās vieta';

  @override
  String get secNeverItem7 => 'Metadati (kas ar ko sarunājas)';

  @override
  String get secNeverItem8 => 'Zvanu vēsture';

  @override
  String get secNeverItem9 => 'Adrešu grāmata';

  @override
  String get secNeverItem10 => 'Reklāmas identifikatori';

  @override
  String get secTempStored => 'Glabāts īslaicīgi';

  @override
  String get secTempItem1 => 'Anonīms Hash ID (unikāls identifikators)';

  @override
  String get secTempItem2 => 'Publiskās šifrēšanas atslēgas';

  @override
  String get secTempItem3 => 'Šifrētas ziņas tranzītā (maks. 24h)';

  @override
  String get secTempNote =>
      'Pat šie minimālie dati nevar jūs identificēt. Jūsu Hash ID nav saistīts ar personīgu informāciju.';

  @override
  String get secFooterTitle => 'Jūsu privātums, jūsu brīvība';

  @override
  String get secFooterDesc =>
      'Hash izmanto tās pašas šifrēšanas tehnoloģijas kā visprasīgākās profesionālās lietojumprogrammas. Jūsu ziņas aizsargā matemātika, nevis solījumi.';

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
