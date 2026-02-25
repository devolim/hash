// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Jokiu pėdsakų. Jokių kompromisų.';

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
  String get conversations => 'Pokalbiai';

  @override
  String get contacts => 'Kontaktai';

  @override
  String get noConversation => 'Nėra pokalbių';

  @override
  String get noConversationSubtitle =>
      'Pridėkite kontaktą, kad pradėtumėte saugiai bendrauti';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count laukiančios užklausos',
      one: '1 laukianti užklausa',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count išsiųstos laukiančios užklausos',
      one: '1 išsiųsta laukianti užklausa',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Pridėti kontaktą';

  @override
  String get shareApp => 'Dalintis programėle';

  @override
  String get newMessage => 'Nauja žinutė';

  @override
  String get newConversation => 'Siųsti žinutę';

  @override
  String get settings => 'Nustatymai';

  @override
  String get myHashId => 'Mano Hash ID';

  @override
  String get supportHash => 'Paremti Hash';

  @override
  String get supportHashSubtitle => 'Hash yra ne pelno siekiantis projektas';

  @override
  String get donate => 'Paaukoti';

  @override
  String get appearance => 'Išvaizda';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatinė';

  @override
  String get themeAutoSubtitle => 'Pagal sistemos nustatymus';

  @override
  String get themeDark => 'Tamsi';

  @override
  String get themeLight => 'Šviesi';

  @override
  String get themeRecommendation =>
      'Tamsi tema rekomenduojama geresniam privatumui';

  @override
  String get language => 'Kalba';

  @override
  String get languageAuto => 'Automatinė (sistemos)';

  @override
  String get notifications => 'Pranešimai';

  @override
  String get messages => 'Žinutės';

  @override
  String get calls => 'Skambučiai';

  @override
  String get vibration => 'Vibracija';

  @override
  String get notificationContent => 'Pranešimų turinys';

  @override
  String get notificationContentFull => 'Rodyti viską';

  @override
  String get notificationContentFullDesc =>
      'Kontakto vardas ir žinutės peržiūra';

  @override
  String get notificationContentName => 'Tik vardas';

  @override
  String get notificationContentNameDesc => 'Rodo tik kontakto vardą';

  @override
  String get notificationContentDiscrete => 'Diskretiškas';

  @override
  String get notificationContentDiscreteDesc => 'Rodo tik \"Nauja žinutė\"';

  @override
  String get security => 'Saugumas';

  @override
  String get howHashProtectsYou => 'Kaip Hash tave saugo';

  @override
  String get howHashProtectsYouSubtitle => 'Suprask savo saugumą';

  @override
  String get accountSecurity => 'Paskyros saugumas';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrika, Vash režimas';

  @override
  String get blockScreenshots => 'Blokuoti ekrano kopijas';

  @override
  String get transferDevice => 'Perkelti į kitą įrenginį';

  @override
  String get transferDeviceSubtitle => 'Perkelti paskyrą';

  @override
  String get pinCode => 'PIN kodas';

  @override
  String get changePin => 'Keisti PIN kodą';

  @override
  String get currentPin => 'Dabartinis PIN kodas';

  @override
  String get newPin => 'Naujas PIN kodas';

  @override
  String get confirmPin => 'Patvirtinti PIN kodą';

  @override
  String get pinChanged => 'PIN kodas pakeistas';

  @override
  String get incorrectPin => 'Neteisingas PIN';

  @override
  String get pinsDoNotMatch => 'PIN kodai nesutampa';

  @override
  String get autoLock => 'Automatinis užraktas';

  @override
  String get autoLockDelay => 'Užrakinimo delsa';

  @override
  String get autoLockImmediate => 'Nedelsiant';

  @override
  String get autoLockMinute => '1 minutė';

  @override
  String autoLockMinutes(int count) {
    return '$count minutės';
  }

  @override
  String get vashCode => 'Vash kodas';

  @override
  String get vashModeTitle => 'Vash režimas';

  @override
  String get vashModeExplanation => 'Jūsų galutinis saugos tinklas.';

  @override
  String get vashModeDescription =>
      'Pasirinksite antrą PIN kodą. Jei kada nors būsite priversti atidaryti Hash, įveskite šį kodą vietoj įprasto PIN.\n\nProgramėlė atsidarys normaliai, bet visi jūsų pokalbiai ir kontaktai bus dingę.\n\nBet kam žiūrinčiam į jūsų ekraną Hash atrodys tiesiog tuščia — tarsi niekada jos nenaudojote.';

  @override
  String get vashModeIrreversible => 'Šis veiksmas yra tylus ir neatšaukiamas.';

  @override
  String get chooseVashCode => 'Pasirinkti Vash kodą';

  @override
  String get vashCodeInfo =>
      'Antras PIN kodas, kuris atidaro programėlę normaliai, bet tuščią.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Jei įvesite šį kodą vietoj PIN:';

  @override
  String get vashDeleteContacts => 'Jūsų kontaktai dingsta';

  @override
  String get vashDeleteMessages => 'Jūsų pokalbiai dingsta';

  @override
  String get vashDeleteHistory => 'Jūsų užrašai dingsta';

  @override
  String get vashKeepId => 'Jūsų Hash tapatybė (#XXX-XXX-XXX) lieka ta pati';

  @override
  String get vashAppearNormal =>
      'Programėlė atrodo normaliai, bet tuščia, kaip nauja. Šis veiksmas neatšaukiamas.';

  @override
  String get setupVashCode => 'Nustatyti Vash kodą';

  @override
  String get modifyVashCode => 'Keisti Vash kodą';

  @override
  String get currentVashCode => 'Dabartinis Vash kodas';

  @override
  String get newVashCode => 'Naujas Vash kodas';

  @override
  String get confirmVashCode => 'Patvirtinti Vash kodą';

  @override
  String get vashCodeConfigured => 'Vash kodas sukonfigūruotas';

  @override
  String get vashCodeModified => 'Vash kodas pakeistas';

  @override
  String get vashCodeMustDiffer => 'Vash kodas turi skirtis nuo PIN';

  @override
  String get incorrectVashCode => 'Neteisingas Vash kodas';

  @override
  String get vashWhatToDelete => 'Ką Vash režimas turėtų panaikinti?';

  @override
  String get vashDeleteContactsOption => 'Kontaktai';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Žinutės';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Užrašai';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash režimas aktyvuotas';

  @override
  String get vashCreateSubtitle =>
      'Pasirinkite kodą, skirtingą nuo pagrindinio PIN';

  @override
  String get vashConfirmSubtitle => 'Patvirtinkite savo Vash kodą';

  @override
  String get pinCodeForEntry => 'PIN kodas programėlei atrakinti';

  @override
  String get vashCodeSection => 'Vash režimas';

  @override
  String get biometric => 'Biometrika';

  @override
  String get biometricUnlock => 'Atrakinti piršto antspaudu arba Face ID';

  @override
  String get enableBiometric => 'Įjungti biometriką';

  @override
  String get biometricWarningMessage =>
      'Įjungus biometriką negalėsite naudoti Vash kodo programėlei atrakinti.\n\nVash kodą galėsite naudoti tik jei biometrika nepavyks (po kelių nesėkmingų bandymų).\n\nAr tikrai norite tęsti?';

  @override
  String get understood => 'Supratau';

  @override
  String get shareAppSubtitle => 'Pasidalinkite Hash su artimaisiais';

  @override
  String get share => 'Dalintis';

  @override
  String get danger => 'Pavojus';

  @override
  String get deleteAccount => 'Ištrinti paskyrą';

  @override
  String get deleteAccountSubtitle => 'Neatšaukiamas veiksmas';

  @override
  String get deleteAccountConfirmTitle => 'Ištrinti paskyrą';

  @override
  String get deleteAccountConfirmMessage =>
      'Jūsų paskyra bus visam laikui ištrinta. Šis veiksmas neatšaukiamas.\n\n• Visi jūsų pokalbiai\n• Visi jūsų kontaktai\n• Jūsų Hash ID\n\nTurėsite sukurti naują paskyrą.';

  @override
  String get deleteForever => 'Ištrinti visam laikui';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash režimas aktyvuotas.';

  @override
  String deletionError(String error) {
    return 'Trynimo klaida: $error';
  }

  @override
  String get yourSecurity => 'Jūsų saugumas';

  @override
  String get securityInfo =>
      '• Ištisinis šifravimas (Signal Protocol)\n• Jokių duomenų mūsų serveriuose po pristatymo\n• Raktai saugomi tik jūsų įrenginyje\n• PIN kodas niekada nesiunčiamas į serverį';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Sveiki';

  @override
  String get securityStatement1 => 'Jūsų žinutės yra apsaugotos.';

  @override
  String get securityStatement2 => 'Ištisinis šifravimas.';

  @override
  String get securityStatement3 => 'Jokių pėdsakų. Jokių kompromisų.';

  @override
  String get securityStatement4 => 'Jūsų privatumas yra teisė.';

  @override
  String get accessBlocked => 'Prieiga užblokuota';

  @override
  String get tooManyAttempts => 'Per daug bandymų. Pabandykite vėliau.';

  @override
  String get pleaseWait => 'Palaukite';

  @override
  String get waitDelay => 'Palaukite, kol pasibaigs delsa';

  @override
  String attemptCount(int current, int max) {
    return 'Bandymas $current iš $max';
  }

  @override
  String retryIn(String time) {
    return 'Bandyti po $time';
  }

  @override
  String get forgotPin => 'Pamiršote PIN? Naudokite atkūrimo frazę';

  @override
  String get useRecoveryPhrase => 'Naudoti atkūrimo frazę';

  @override
  String get recoveryWarningTitle => 'Dėmesio';

  @override
  String get recoveryWarningMessage => 'Paskyros atkūrimas:';

  @override
  String get recoveryDeleteAllMessages => 'Ištrins VISAS jūsų žinutes';

  @override
  String get recoveryWaitDelay => 'Reikės 1 valandos delsos';

  @override
  String get recoveryKeepContacts => 'Išsaugos jūsų kontaktus';

  @override
  String get recoveryIrreversible =>
      'Šis veiksmas neatšaukiamas. Jūsų žinutės bus visam laikui prarastos.';

  @override
  String get iUnderstand => 'Suprantu';

  @override
  String get accountRecovery => 'Paskyros atkūrimas';

  @override
  String get enterRecoveryPhrase =>
      'Įveskite 24 atkūrimo frazės žodžius, atskirtus tarpais.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Atkurti';

  @override
  String get recoveryPhraseRequired => 'Įveskite atkūrimo frazę';

  @override
  String get recoveryPhrase24Words => 'Frazė turi būti iš lygiai 24 žodžių';

  @override
  String get incorrectRecoveryPhrase => 'Neteisinga atkūrimo frazė';

  @override
  String get recoveryInitError => 'Klaida inicializuojant atkūrimą';

  @override
  String get securityDelay => 'Saugumo delsa';

  @override
  String get securityDelayMessage =>
      'Jūsų saugumui reikalingas laukimo laikotarpis prieš kuriant naują PIN.';

  @override
  String get timeRemaining => 'Likęs laikas';

  @override
  String get messagesDeletedForProtection =>
      'Jūsų žinutės buvo ištrintos jūsų apsaugai.';

  @override
  String get canCloseApp => 'Galite uždaryti programėlę ir grįžti vėliau.';

  @override
  String get onboardingTitle1 => 'Sveiki atvykę į Hash';

  @override
  String get onboardingSubtitle1 =>
      'Pranešimų programa, nepaliekanti jokių pėdsakų';

  @override
  String get onboardingTitle2 => 'Visiškas šifravimas';

  @override
  String get onboardingSubtitle2 =>
      'Jūsų žinutės yra ištisai šifruojamos Signal protokolu';

  @override
  String get onboardingTitle3 => 'Jokių pėdsakų';

  @override
  String get onboardingSubtitle3 =>
      'Žinutės ištrinamos iš serverių po pristatymo';

  @override
  String get onboardingTitle4 => 'Jūsų saugumas';

  @override
  String get onboardingSubtitle4 => 'PIN kodas, Vash režimas ir atkūrimo frazė';

  @override
  String get getStarted => 'Pradėti';

  @override
  String get next => 'Toliau';

  @override
  String get skip => 'Praleisti';

  @override
  String get alreadyHaveAccount => 'Jau turiu paskyrą';

  @override
  String get transferMyAccount => 'Perkelti paskyrą';

  @override
  String get createPin => 'Sukurti PIN kodą';

  @override
  String get createPinSubtitle =>
      'Šis kodas apsaugos prieigą prie jūsų programėlės';

  @override
  String get confirmYourPin => 'Patvirtinkite PIN kodą';

  @override
  String get confirmPinSubtitle => 'Įveskite PIN kodą dar kartą';

  @override
  String get saveRecoveryPhrase => 'Atkūrimo frazė';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Užsirašykite šiuos 24 žodžius eilės tvarka. Jie leis atkurti paskyrą, jei pamiršite PIN.';

  @override
  String get phraseWritten => 'Užsirašiau frazę';

  @override
  String get warningRecoveryPhrase =>
      'Jei prarasite šią frazę ir pamiršite PIN, prarasite prieigą prie paskyros.';

  @override
  String get accountTransferred => 'Paskyra perkelta';

  @override
  String get accountTransferredMessage =>
      'Jūsų paskyra buvo perkelta į kitą įrenginį. Ši sesija nebegalioja.';

  @override
  String get accountTransferredInfo =>
      'Jei ne jūs inicijavote šį perkėlimą, jūsų paskyra gali būti pažeista.';

  @override
  String get logout => 'Atsijungti';

  @override
  String get transferAccount => 'Perkelti paskyrą';

  @override
  String get transferAccountInfo =>
      'Perkelkite Hash paskyrą į naują įrenginį. Dabartinė sesija bus nutraukta.';

  @override
  String get generateTransferCode => 'Generuoti perkėlimo kodą';

  @override
  String get transferCode => 'Perkėlimo kodas';

  @override
  String transferCodeExpires(int minutes) {
    return 'Šis kodas baigia galioti po $minutes minučių';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Įveskite šį kodą naujame įrenginyje, kad perkeltumėte paskyrą.';

  @override
  String get generateNewCode => 'Generuoti naują kodą';

  @override
  String get scanQrCode => 'Nuskaityti QR kodą';

  @override
  String get scanQrCodeSubtitle =>
      'Nuskaitykite kontakto QR kodą, kad jį pridėtumėte';

  @override
  String get qrCodeDetected => 'QR kodas aptiktas';

  @override
  String get invalidQrCode => 'Neteisingas QR kodas';

  @override
  String get cameraPermissionRequired => 'Reikia kameros leidimo';

  @override
  String get myQrCode => 'Mano QR kodas';

  @override
  String get myQrCodeSubtitle =>
      'Pasidalinkite šiuo QR kodu, kad kontaktai galėtų jus pridėti';

  @override
  String get shareQrCode => 'Dalintis';

  @override
  String get addContactTitle => 'Pridėti kontaktą';

  @override
  String get addContactByHashId => 'Įveskite kontakto Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Ieškoti';

  @override
  String get contactNotFound => 'Kontaktas nerastas';

  @override
  String get contactAlreadyAdded => 'Šis kontaktas jau yra jūsų sąraše';

  @override
  String get contactAdded => 'Kontaktas pridėtas';

  @override
  String get myProfile => 'Mano profilis';

  @override
  String get myProfileSubtitle =>
      'Pasidalinkite šia informacija, kad kiti galėtų jus pridėti';

  @override
  String get temporaryCode => 'Laikinas kodas';

  @override
  String temporaryCodeExpires(String time) {
    return 'Galioja dar $time';
  }

  @override
  String get codeExpired => 'Kodas nebegalioja';

  @override
  String get generateNewCodeButton => 'Naujas kodas';

  @override
  String get copyHashId => 'Kopijuoti ID';

  @override
  String get copyCode => 'Kopijuoti kodą';

  @override
  String get copiedToClipboard => 'Nukopijuota';

  @override
  String get showMyQrCode => 'Rodyti mano QR kodą';

  @override
  String get orDivider => 'arba';

  @override
  String get openScanner => 'Atidaryti skaitytuvą';

  @override
  String get addManually => 'Pridėti rankiniu būdu';

  @override
  String get contactHashIdLabel => 'Kontakto Hash ID';

  @override
  String get temporaryCodeLabel => 'Laikinas kodas';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Paprašykite kontakto sugeneruoti kodą iš savo profilio';

  @override
  String get verifyAndAdd => 'Patikrinti ir pridėti';

  @override
  String get fillAllFields => 'Užpildykite visus laukus';

  @override
  String get invalidHashIdFormat =>
      'Neteisingas ID formatas (pvz.: 123-456-ABC)';

  @override
  String get userNotFound => 'Vartotojas nerastas';

  @override
  String get cannotAddYourself => 'Negalite pridėti savęs';

  @override
  String get invalidOrExpiredCode =>
      'Neteisingas arba pasibaigęs laikinas kodas';

  @override
  String get contactFound => 'Kontaktas rastas!';

  @override
  String get howToCallContact => 'Kaip norėtumėte jį vadinti?';

  @override
  String get contactNameHint => 'Kontakto vardas';

  @override
  String get addContactButton => 'Pridėti';

  @override
  String get contactDetails => 'Kontakto informacija';

  @override
  String get contactName => 'Kontakto vardas';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Pridėta $date';
  }

  @override
  String get deleteContact => 'Ištrinti kontaktą';

  @override
  String deleteContactConfirm(Object name) {
    return 'Ištrinti šį kontaktą?';
  }

  @override
  String get deleteContactMessage => 'Tai taip pat ištrins visą pokalbį.';

  @override
  String get delete => 'Ištrinti';

  @override
  String get typeMessage => 'Rašyti žinutę...';

  @override
  String get messageSent => 'Išsiųsta';

  @override
  String get messageDelivered => 'Pristatyta';

  @override
  String get messageRead => 'Perskaityta';

  @override
  String get messageFailed => 'Nepavyko išsiųsti';

  @override
  String get now => 'Dabar';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}val';
  }

  @override
  String daysAgo(int count) {
    return '${count}d';
  }

  @override
  String get today => 'Šiandien';

  @override
  String get yesterday => 'Vakar';

  @override
  String dateAtTime(String date, String time) {
    return '$date, $time';
  }

  @override
  String get shareMessage =>
      'Prisijunk prie manęs Hash! 🔒\n\nTai tikrai privati pranešimų programa: visiškas šifravimas, jokių pėdsakų serveriuose ir panikos režimas prireikus.\n\nAtsisiųsk programėlę čia 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Klaida';

  @override
  String get ok => 'Gerai';

  @override
  String get view => 'Peržiūrėti';

  @override
  String get yes => 'Taip';

  @override
  String get no => 'Ne';

  @override
  String get save => 'Išsaugoti';

  @override
  String get edit => 'Redaguoti';

  @override
  String get close => 'Uždaryti';

  @override
  String get confirm => 'Patvirtinti';

  @override
  String get loading => 'Kraunama...';

  @override
  String get retry => 'Bandyti dar kartą';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Laukiančios užklausos';

  @override
  String get noPendingRequests => 'Nėra laukiančių užklausų';

  @override
  String get pendingRequestsSubtitle => 'Šie žmonės nori jus pridėti';

  @override
  String requestFromUser(String hashId) {
    return 'Užklausa nuo $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Galioja dar $days dienas';
  }

  @override
  String get acceptRequest => 'Priimti';

  @override
  String get rejectRequest => 'Atmesti';

  @override
  String get requestAccepted => 'Užklausa priimta';

  @override
  String get requestRejected => 'Užklausa atmesta';

  @override
  String get requestSent => 'Užklausa išsiųsta!';

  @override
  String get requestSentSubtitle =>
      'Jūsų užklausa buvo išsiųsta. Vartotojas turi ją priimti prieš pradedant pokalbį.';

  @override
  String get requestAlreadyPending => 'Užklausa jau laukia';

  @override
  String get requestAlreadySentByOther =>
      'Šis asmuo jau atsiuntė jums užklausą';

  @override
  String get addByHashId => 'Pridėti pagal Hash ID';

  @override
  String get addByHashIdSubtitle => 'Įveskite kontakto Hash ID ir laikiną kodą';

  @override
  String get enterTemporaryCode => 'Įveskite 6 skaitmenų kodą';

  @override
  String get sendRequest => 'Siųsti užklausą';

  @override
  String get acceptContactTitle => 'Priimti kontaktą';

  @override
  String get acceptContactSubtitle => 'Galite suteikti jam pasirinktinį vardą';

  @override
  String get leaveEmptyForHashId => 'Palikite tuščią, kad naudotumėte Hash ID';

  @override
  String get firstName => 'Vardas';

  @override
  String get lastName => 'Pavardė';

  @override
  String get notes => 'Užrašai';

  @override
  String get notesHint => 'Asmeniniai užrašai apie šį kontaktą';

  @override
  String get photoOptional => 'Nuotrauka (neprivaloma)';

  @override
  String get contactNameOptional => 'Vardas (neprivalomas)';

  @override
  String get notesOptional => 'Užrašai (neprivalomi)';

  @override
  String get storedLocally => 'Saugoma tik jūsų įrenginyje';

  @override
  String get encryptedMessageLabel => 'Šifruota žinutė';

  @override
  String get identityMessageHint =>
      'Kas jūs esate? Kaip pažįstate vienas kitą?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ši žinutė bus užšifruota ir išsiųsta gavėjui';

  @override
  String get sendRequestButton => 'Siųsti užklausą';

  @override
  String get requestExpiresIn24h =>
      'Užklausa baigia galioti po 24 val., jei nepriimta';

  @override
  String get theyAlreadySentYouRequest =>
      'Šis asmuo jau atsiuntė jums užklausą';

  @override
  String get requests => 'Užklausos';

  @override
  String get receivedRequests => 'Gautos';

  @override
  String get sentRequests => 'Išsiųstos';

  @override
  String get noSentRequests => 'Nėra išsiųstų užklausų';

  @override
  String get cancelRequest => 'Atšaukti';

  @override
  String get deleteRequest => 'Ištrinti užklausą';

  @override
  String get requestCancelled => 'Užklausa atšaukta';

  @override
  String sentTo(String hashId) {
    return 'Išsiųsta $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Galioja dar $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Gauta prieš $time';
  }

  @override
  String get messageFromRequester => 'Žinutė nuo siuntėjo';

  @override
  String get copy => 'Kopijuoti';

  @override
  String get messageInfo => 'Žinutės informacija';

  @override
  String get messageDirection => 'Kryptis';

  @override
  String get messageSentByYou => 'Išsiųsta jūsų';

  @override
  String get messageReceived => 'Gauta';

  @override
  String get messageSentAt => 'Išsiųsta';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Būsena';

  @override
  String get messageReadAt => 'Perskaityta';

  @override
  String get messageType => 'Tipas';

  @override
  String get messageSize => 'Dydis';

  @override
  String get messageExpiresAt => 'Galioja iki';

  @override
  String get messageEncrypted => 'Ištisai šifruota';

  @override
  String get messageStatusSending => 'Siunčiama...';

  @override
  String get messageStatusSent => 'Išsiųsta';

  @override
  String get messageStatusDelivered => 'Pristatyta';

  @override
  String get messageStatusRead => 'Perskaityta';

  @override
  String get messageStatusFailed => 'Nepavyko';

  @override
  String get serverStatus => 'Serveris';

  @override
  String get onServer => 'Laukia pristatymo';

  @override
  String get deletedFromServer => 'Ištrinta';

  @override
  String get messageTypeText => 'Tekstas';

  @override
  String get messageTypeImage => 'Paveikslėlis';

  @override
  String get messageTypeVideo => 'Vaizdo įrašas';

  @override
  String get messageTypeVoice => 'Balso įrašas';

  @override
  String get messageTypeFile => 'Failas';

  @override
  String get indefinitely => 'Neribotai';

  @override
  String get hoursShort => 'val';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'valandos';

  @override
  String get minutes => 'minutės';

  @override
  String get seconds => 'sekundės';

  @override
  String get ephemeralMessages => 'Laikinos žinutės';

  @override
  String get ephemeralMessagesDescription =>
      'Žinutės automatiškai ištrinamos po šio laiko';

  @override
  String get ephemeralImmediate => 'Iš karto (po perskaitymo)';

  @override
  String get ephemeralImmediateDesc => 'Ištrinta iš karto po perskaitymo';

  @override
  String get ephemeralMyPreference => 'Mano nuostata';

  @override
  String get ephemeralMyPreferenceDesc => 'Naudoti bendrą nustatymą';

  @override
  String get ephemeralDefaultSetting => 'Žinučių trukmė';

  @override
  String get ephemeralChooseDefault => 'Rekomenduojama';

  @override
  String get ephemeral30Seconds => '30 sekundžių';

  @override
  String get ephemeral30SecondsDesc => 'Ištrinta po 30 s nuo perskaitymo';

  @override
  String get ephemeral5Minutes => '5 minutės';

  @override
  String get ephemeral5MinutesDesc => 'Ištrinta po 5 min nuo perskaitymo';

  @override
  String get ephemeral1Hour => '1 valanda';

  @override
  String get ephemeral1HourDesc => 'Ištrinta po 1 val nuo perskaitymo';

  @override
  String get ephemeral3Hours => '3 valandos';

  @override
  String get ephemeral6Hours => '6 valandos';

  @override
  String get ephemeral6HoursDesc => 'Ištrinta po 6 val nuo perskaitymo';

  @override
  String get ephemeral12Hours => '12 valandų';

  @override
  String get ephemeral24Hours => '24 valandos';

  @override
  String get ephemeral24HoursDesc => 'Ištrinta po 24 val nuo perskaitymo';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Pasirinktinė trukmė';

  @override
  String get howItWorks => 'Kaip tai veikia';

  @override
  String get ephemeralExplanation1 =>
      'Žinutės ištrinamos iš serverio iš karto po gavimo.';

  @override
  String get ephemeralExplanation2 =>
      'Šis nustatymas apibrėžia, kada žinutės dingsta iš JŪSŲ telefono po perskaitymo.';

  @override
  String get ephemeralExplanation3 =>
      'Jūsų kontaktas turi savo nustatymą savo telefonui.';

  @override
  String get mute1Hour => '1 valanda';

  @override
  String get mute8Hours => '8 valandos';

  @override
  String get mute1Day => '1 diena';

  @override
  String get mute1Week => '1 savaitė';

  @override
  String get muteAlways => 'Visada';

  @override
  String get muteExplanation => 'Negausite pranešimų iš šio kontakto';

  @override
  String get showCallsInRecents => 'Rodyti neseniai skambintuose';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash skambučiai rodomi telefono istorijoje';

  @override
  String get feedback => 'Atsiliepimai';

  @override
  String get muteNotifications => 'Nutildyti pranešimus';

  @override
  String get muteDescription => 'Negausite pranešimų iš šio kontakto';

  @override
  String mutedUntil(String time) {
    return 'Nutildyta iki $time';
  }

  @override
  String get notMuted => 'Pranešimai įjungti';

  @override
  String get unmute => 'Įjungti garsą';

  @override
  String get notificationSound => 'Pranešimo garsas';

  @override
  String get defaultSound => 'Numatytasis';

  @override
  String get chatSettings => 'Pokalbio nustatymai';

  @override
  String get bubbleColor => 'Burbulo spalva';

  @override
  String get backgroundColor => 'Fono spalva';

  @override
  String get backgroundImage => 'Fono paveikslėlis';

  @override
  String get chatBackground => 'Pokalbio fonas';

  @override
  String get customColor => 'Pasirinktinė';

  @override
  String get defaultColor => 'Numatytoji';

  @override
  String get imageSelected => 'Paveikslėlis pasirinktas';

  @override
  String get noImage => 'Nėra paveikslėlio';

  @override
  String get color => 'Spalva';

  @override
  String get image => 'Paveikslėlis';

  @override
  String get tapToSelectImage => 'Bakstelėkite norėdami pasirinkti paveikslėlį';

  @override
  String get changeImage => 'Keisti paveikslėlį';

  @override
  String get previewMessageReceived => 'Labas!';

  @override
  String get previewMessageSent => 'Sveikas!';

  @override
  String get messageAction => 'Žinutė';

  @override
  String get callAction => 'Skambinti';

  @override
  String get videoAction => 'Vaizdo';

  @override
  String get personalNotes => 'Asmeniniai užrašai';

  @override
  String get addNotes => 'Pridėti užrašų...';

  @override
  String get noNotes => 'Nėra užrašų';

  @override
  String get messageNotifications => 'Žinučių pranešimai';

  @override
  String get callNotifications => 'Skambučių pranešimai';

  @override
  String get useGradient => 'Naudoti gradientą';

  @override
  String get gradientStart => 'Pradžios spalva';

  @override
  String get gradientEnd => 'Pabaigos spalva';

  @override
  String get preview => 'Peržiūra';

  @override
  String get reset => 'Atstatyti';

  @override
  String get securityNumber => 'Saugumo numeris';

  @override
  String securityNumberDescription(String name) {
    return 'Patikrinkite, ar saugumo numeris atitinka $name įrenginį';
  }

  @override
  String get verifyEncryption => 'Patikrinti ištisinio šifravimo apsaugą';

  @override
  String get tapToCopy => 'Bakstelėkite norėdami kopijuoti';

  @override
  String get howToVerify => 'Kaip patikrinti';

  @override
  String get verifyStep1 =>
      'Susitikite su kontaktu asmeniškai arba paskambinkite';

  @override
  String get verifyStep2 =>
      'Palyginkite saugumo numerius arba nuskaitykite QR kodus';

  @override
  String get verifyStep3 => 'Jei jie sutampa, jūsų pokalbis yra saugus';

  @override
  String get scanToVerify => 'Nuskaityti patikrinimui';

  @override
  String get reportSpam => 'Pranešti apie šlamštą';

  @override
  String get reportSpamSubtitle => 'Pranešti apie šį kontaktą kaip šlamštą';

  @override
  String get reportSpamDescription =>
      'Šis kontaktas bus anonimiškai praneštas. Jūsų tapatybė nebus atskleista. Ar tikrai norite?';

  @override
  String get report => 'Pranešti';

  @override
  String get spamReported => 'Šlamštas praneštas';

  @override
  String get reportError => 'Nepavyko išsiųsti pranešimo. Bandykite dar kartą.';

  @override
  String get reportRateLimited =>
      'Pasiekėte didžiausią pranešimų skaičių šiandienai.';

  @override
  String get blockContact => 'Blokuoti kontaktą';

  @override
  String get blockContactDescription =>
      'Šis kontaktas nebegalės siųsti jums žinučių ar skambinti. Jis nebus informuotas.';

  @override
  String get unblockContact => 'Atblokuoti kontaktą';

  @override
  String get unblockContactDescription =>
      'Šis kontaktas vėl galės siųsti jums žinutes ir skambinti.';

  @override
  String get contactBlocked => 'Kontaktas užblokuotas';

  @override
  String get contactUnblocked => 'Kontaktas atblokuotas';

  @override
  String get contactIsBlocked => 'Šis kontaktas yra užblokuotas';

  @override
  String get unblock => 'Atblokuoti';

  @override
  String get deleteContactSubtitle => 'Ištrinti šį kontaktą ir pokalbį';

  @override
  String get confirmWithPin => 'Patvirtinti su PIN';

  @override
  String get enterPinToConfirm =>
      'Įveskite PIN, kad patvirtintumėte šį veiksmą';

  @override
  String get profilePhoto => 'Profilio nuotrauka';

  @override
  String get takePhoto => 'Fotografuoti';

  @override
  String get chooseFromGallery => 'Pasirinkti iš galerijos';

  @override
  String get removePhoto => 'Pašalinti nuotrauką';

  @override
  String get viewContactHashId => 'Peržiūrėti kontakto identifikatorių';

  @override
  String get hashIdPartiallyMasked =>
      'Dalinai paslėptas jūsų saugumui ir kontakto privatumui';

  @override
  String get addFirstContact => 'Pridėkite pirmą kontaktą';

  @override
  String get addFirstContactSubtitle =>
      'Pasidalinkite QR kodu arba nuskaitykite draugo';

  @override
  String get directory => 'Katalogas';

  @override
  String get noContacts => 'Nėra kontaktų';

  @override
  String get noContactsSubtitle => 'Pridėkite kontaktą, kad pradėtumėte';

  @override
  String get sendMessageAction => 'Siųsti žinutę';

  @override
  String get audioCall => 'Garso skambutis';

  @override
  String get videoCall => 'Vaizdo skambutis';

  @override
  String get viewProfile => 'Peržiūrėti profilį';

  @override
  String get deleteContactDirectory => 'Ištrinti kontaktą';

  @override
  String get scanShort => 'Nuskaityti';

  @override
  String get addShort => 'Pridėti';

  @override
  String deleteContactConfirmName(String name) {
    return 'Ar tikrai norite ištrinti $name?';
  }

  @override
  String get noNotesTitle => 'Nėra užrašų';

  @override
  String get noNotesSubtitle => 'Sukurkite pirmą užrašą';

  @override
  String get newNote => 'Naujas užrašas';

  @override
  String get editNote => 'Redaguoti užrašą';

  @override
  String get deleteNote => 'Ištrinti užrašą';

  @override
  String get deleteNoteConfirm => 'Ar tikrai norite ištrinti šį užrašą?';

  @override
  String get noteTitle => 'Pavadinimas';

  @override
  String get noteContent => 'Turinys';

  @override
  String get addItem => 'Pridėti elementą';

  @override
  String get pinNote => 'Prisegti';

  @override
  String get unpinNote => 'Atsegti';

  @override
  String get noteColor => 'Spalva';

  @override
  String get notePassword => 'Slaptažodis';

  @override
  String get setPassword => 'Nustatyti slaptažodį';

  @override
  String get changePassword => 'Keisti slaptažodį';

  @override
  String get removePassword => 'Pašalinti slaptažodį';

  @override
  String get enterPassword => 'Įveskite slaptažodį';

  @override
  String get confirmPassword => 'Patvirtinkite slaptažodį';

  @override
  String get passwordPin => 'PIN kodas';

  @override
  String get passwordText => 'Tekstinis slaptažodis';

  @override
  String get protectedNote => 'Apsaugotas užrašas';

  @override
  String get incorrectPassword => 'Neteisingas slaptažodis';

  @override
  String get passwordSet => 'Slaptažodis nustatytas';

  @override
  String get passwordRemoved => 'Slaptažodis pašalintas';

  @override
  String get notesBiometric => 'Face ID užrašams';

  @override
  String get notesBiometricSubtitle =>
      'Reikalauti biometrinės tapatybės patvirtinimo atidarant apsaugotus užrašus';

  @override
  String get textNote => 'Tekstinis užrašas';

  @override
  String get checklistNote => 'Kontrolinis sąrašas';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total užduočių';
  }

  @override
  String get autoSaved => 'Išsaugota';

  @override
  String get searchNotes => 'Ieškoti užrašų';

  @override
  String get legalConsent => 'Teisinis sutikimas';

  @override
  String get confirmAge13 => 'Patvirtinu, kad man yra bent 13 metų';

  @override
  String get acceptLegalStart => 'Sutinku su ';

  @override
  String get privacyPolicy => 'Privatumo politika';

  @override
  String get termsOfService => 'Naudojimo sąlygos';

  @override
  String get andThe => ' ir ';

  @override
  String get continueButton => 'Tęsti';

  @override
  String get mustAcceptTerms => 'Turite priimti abi sąlygas, kad tęstumėte';

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
  String get support => 'Palaikymas';

  @override
  String get contactSupport => 'Susisiekti su palaikymu';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Pranešti apie piktnaudžiavimą';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Teisinė informacija';

  @override
  String get legalEntity => 'Juridinis asmuo';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Prisegti';

  @override
  String get unpinConversation => 'Atsegti';

  @override
  String get hideConversation => 'Pašalinti iš srauto';

  @override
  String get deleteConversation => 'Ištrinti pokalbį';

  @override
  String get deleteConversationConfirm =>
      'Įveskite PIN, kad patvirtintumėte visų žinučių trynimą';

  @override
  String get noConversations => 'Dar nėra pokalbių';

  @override
  String get startConversation => 'Pradėti';

  @override
  String get microphonePermissionRequired => 'Reikia mikrofono prieigos';

  @override
  String get microphonePermissionExplanation =>
      'Hash reikia mikrofono skambučiams.';

  @override
  String get cameraPermissionExplanation =>
      'Hash reikia kameros vaizdo skambučiams.';

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
  String get openSettings => 'Atidaryti nustatymus';

  @override
  String get callConnecting => 'Jungiamasi...';

  @override
  String get callRinging => 'Skamba...';

  @override
  String get callReconnecting => 'Persijungiama...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Persijungiama (${seconds}s)';
  }

  @override
  String get callPaused => 'Pristabdyta';

  @override
  String get callPausedSubtitle => 'Skambutis vis dar aktyvus';

  @override
  String get callRemoteMicMuted => 'Kontakto mikrofonas nutildytas';

  @override
  String get callMiniControlsMute => 'Nutildyti';

  @override
  String get callMiniControlsUnmute => 'Įjungti garsą';

  @override
  String get callMiniControlsHangUp => 'Padėti ragelį';

  @override
  String get callMiniControlsReturn => 'Grįžti į skambutį';

  @override
  String get callNetworkPoor => 'Nestabilus ryšys';

  @override
  String get callNetworkLost => 'Ryšys prarastas';

  @override
  String get callEndedTitle => 'Skambutis baigtas';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Įrenginio duomenys';

  @override
  String get deviceDataSubtitle => 'Vietinė ir serverio saugykla';

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
  String get localStorage => 'Vietinė saugykla';

  @override
  String get onThisDevice => 'šiame įrenginyje';

  @override
  String get encryptedDatabases => 'Šifruotos duomenų bazės';

  @override
  String get files => 'Failai';

  @override
  String get secureKeychain => 'Saugus raktų ryšulys';

  @override
  String get cache => 'Podėlis';

  @override
  String get contactsDetail => 'Vardai, avatarai, Signal raktai';

  @override
  String get messagesDetail => 'Šifruoti pokalbiai';

  @override
  String get notesDetail => 'Asmeniniai užrašai';

  @override
  String get signalSessions => 'Signal sesijos';

  @override
  String get signalSessionsDetail => 'Šifravimo sesijos';

  @override
  String get pendingContacts => 'Laukiantys kontaktai';

  @override
  String get pendingContactsDetail => 'Laukiančios užklausos';

  @override
  String get callHistory => 'Skambučiai';

  @override
  String get callHistoryDetail => 'Skambučių istorija';

  @override
  String get preferences => 'Nuostatos';

  @override
  String get preferencesDetail => 'Medijos ir skambučių nuostatos';

  @override
  String get avatars => 'Avatarai';

  @override
  String get media => 'Medija';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count failų',
      one: '1 failas',
      zero: 'nėra failų',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktyvus';

  @override
  String get notDefined => 'Nenustatyta';

  @override
  String get biometrics => 'Biometrika';

  @override
  String get recoveryPhrase => 'Atkūrimo frazė';

  @override
  String get identity => 'Tapatybė (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol raktai';

  @override
  String get authTokens => 'Autentifikacijos ženklai';

  @override
  String get contactNamesCache => 'Kontaktų vardų podėlis';

  @override
  String get remoteConfig => 'Nuotolinė konfigūracija';

  @override
  String get notificationPrefs => 'Pranešimų nuostatos';

  @override
  String get serverData => 'Serverio duomenys';

  @override
  String get serverDataInfo =>
      'Hash serveryje saugo minimaliai duomenų — visus šifruotus arba laikinus.';

  @override
  String get serverProfile => 'Profilis';

  @override
  String get serverProfileDetail =>
      'Hash ID, viešieji raktai, pašto dėžutės ženklas';

  @override
  String get serverPrekeys => 'Išankstiniai raktai';

  @override
  String get serverPrekeysDetail => 'Vienkartiniai Signal raktai (sunaudoti)';

  @override
  String get serverMessages => 'Žinutės tranzite';

  @override
  String get serverMessagesDetail => 'Ištrinamos po pristatymo (maks. 24 val)';

  @override
  String get serverMedia => 'Medija tranzite';

  @override
  String get serverMediaDetail => 'Ištrinama po atsisiuntimo';

  @override
  String get serverContactRequests => 'Kontaktų užklausos';

  @override
  String get serverContactRequestsDetail => 'Baigia galioti po 24 val';

  @override
  String get serverRateLimits => 'Dažnumo apribojimai';

  @override
  String get serverRateLimitsDetail =>
      'Laikini apsaugos nuo piktnaudžiavimo duomenys';

  @override
  String get privacyReassurance =>
      'Hash negali skaityti jūsų žinučių. Visi duomenys yra ištisai šifruoti. Serverio duomenys automatiškai ištrinami.';

  @override
  String get pinTooSimple =>
      'Šis PIN per paprastas. Pasirinkite saugesnį kodą.';

  @override
  String get genericError => 'Įvyko klaida. Bandykite dar kartą.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nepavyko sukurti paskyros: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Frazė nukopijuota į iškarpinę';

  @override
  String get copyPhrase => 'Kopijuoti frazę';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Užsirašykite šią frazę saugioje vietoje. Jei prarasite PIN be šios frazės, visam laikui prarasite prieigą prie duomenų.';

  @override
  String get noMessages => 'Nėra žinučių';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Ištrinti visas žinutes su $name?';
  }

  @override
  String get confirmation => 'Patvirtinimas';

  @override
  String get untitled => 'Be pavadinimo';

  @override
  String get noSessions => 'Nėra sesijų';

  @override
  String get unknownContact => 'Nežinomas kontaktas';

  @override
  String get unnamed => 'Be vardo';

  @override
  String get noPendingRequestsAlt => 'Nėra laukiančių užklausų';

  @override
  String get deleteAllCallHistory => 'Ištrinti visą skambučių istoriją?';

  @override
  String get noCalls => 'Nėra skambučių';

  @override
  String get noPreferences => 'Nėra nuostatų';

  @override
  String get resetAllMediaPrefs => 'Atstatyti visas medijos nuostatas?';

  @override
  String get deleteThisAvatar => 'Ištrinti šį avatarą?';

  @override
  String get deleteAllAvatars => 'Ištrinti visus avatarus?';

  @override
  String get noAvatars => 'Nėra avatarų';

  @override
  String get deleteThisFile => 'Ištrinti šį failą?';

  @override
  String get deleteAllMediaFiles => 'Ištrinti visą mediją?';

  @override
  String get noMediaFiles => 'Nėra medijos';

  @override
  String get outgoing => 'Išeinantis';

  @override
  String get incoming => 'Įeinantis';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Laikina peržiūra: ${seconds}s';
  }

  @override
  String get normalView => 'Įprasta peržiūra';

  @override
  String get callReasonCompleted => 'Baigtas';

  @override
  String get callReasonMissed => 'Praleistas';

  @override
  String get callReasonDeclined => 'Atmestas';

  @override
  String get callReasonFailed => 'Nepavyko';

  @override
  String get justNow => 'Ką tik';

  @override
  String timeAgoMinutes(int count) {
    return 'Prieš $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Prieš $count val';
  }

  @override
  String timeAgoDays(int count) {
    return 'Prieš $count d';
  }

  @override
  String get messageTypeContact => 'Kontaktas';

  @override
  String get messageTypeLocation => 'Vieta';

  @override
  String get statusQueued => 'Eilėje';

  @override
  String get blockedBadge => 'Užblokuotas';

  @override
  String get protectedBadge => 'Apsaugotas';

  @override
  String messageCount(int count) {
    return '$count žinutė(-ės)';
  }

  @override
  String get deleteQuestion => 'Ištrinti?';

  @override
  String get transferMyAccountTitle => 'Perkelti paskyrą';

  @override
  String get loadingError => 'Krovimo klaida';

  @override
  String get transferToNewDevice => 'Perkelti į naują įrenginį';

  @override
  String get transferInstructions =>
      'Naujame įrenginyje pasirinkite \"Atkurti paskyrą\" ir įveskite šią informaciją:';

  @override
  String get yourHashIdLabel => 'Jūsų Hash ID';

  @override
  String get enterYourPinCode => 'Įveskite PIN kodą';

  @override
  String get pinOwnerConfirmation =>
      'Kad patvirtintumėte, jog esate šios paskyros savininkas';

  @override
  String get scanThisQrCode => 'Nuskaitykite šį QR kodą';

  @override
  String get withYourNewDevice => 'Savo nauju įrenginiu';

  @override
  String get orEnterTheCode => 'arba įveskite kodą';

  @override
  String get transferCodeLabel => 'Perkėlimo kodas';

  @override
  String get proximityVerification => 'Artumo patikrinimas';

  @override
  String get bringDevicesCloser => 'Priartinkite abu įrenginius';

  @override
  String get confirmTransferQuestion => 'Patvirtinti perkėlimą?';

  @override
  String get accountWillBeTransferred =>
      'Jūsų paskyra bus perkelta į naują įrenginį.\n\nŠis įrenginys bus visam laikui atjungtas.';

  @override
  String get transferComplete => 'Perkėlimas baigtas';

  @override
  String get transferSuccessMessage =>
      'Jūsų paskyra sėkmingai perkelta.\n\nŠi programėlė dabar užsidarys.';

  @override
  String get manualVerification => 'Rankinis patikrinimas';

  @override
  String get codeDisplayedOnBothDevices =>
      'Kodas rodomas abiejuose įrenginiuose:';

  @override
  String get doesCodeMatchNewDevice =>
      'Ar šis kodas sutampa su naujame įrenginyje rodomu?';

  @override
  String get verifiedStatus => 'Patvirtintas';

  @override
  String get inProgressStatus => 'Vykdoma...';

  @override
  String get notAvailableStatus => 'Nepasiekiamas';

  @override
  String get codeExpiredRestart => 'Kodas nebegalioja. Pradėkite iš naujo.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kodai nesutampa. Perkėlimas atšauktas.';

  @override
  String transferToDevice(String device) {
    return 'Kam: $device';
  }

  @override
  String get copiedExclamation => 'Nukopijuota!';

  @override
  String expiresInTime(String time) {
    return 'Galioja dar $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrika nepasiekiama šiame įrenginyje';

  @override
  String get biometricAuthError =>
      'Klaida biometrinės tapatybės patvirtinimo metu';

  @override
  String get authenticateForBiometric =>
      'Patvirtinkite tapatybę, kad įjungtumėte biometriką';

  @override
  String get biometricAuthFailed =>
      'Biometrinis tapatybės patvirtinimas nepavyko';

  @override
  String get forceUpdateTitle => 'Reikia atnaujinimo';

  @override
  String get forceUpdateMessage =>
      'Galima nauja Hash versija. Atnaujinkite, kad tęstumėte.';

  @override
  String get updateButton => 'Atnaujinti';

  @override
  String get maintenanceInProgress => 'Vykdoma priežiūra';

  @override
  String get tryAgainLater => 'Bandykite vėliau';

  @override
  String get information => 'Informacija';

  @override
  String get later => 'Vėliau';

  @override
  String get doYouLikeHash => 'Ar jums patinka Hash?';

  @override
  String get yourFeedbackHelps =>
      'Jūsų atsiliepimai padeda tobulinti programėlę';

  @override
  String get ratingTerrible => 'Baisiai';

  @override
  String get ratingBad => 'Blogai';

  @override
  String get ratingOk => 'Neblogai';

  @override
  String get ratingGood => 'Gerai';

  @override
  String get ratingExcellent => 'Puiku!';

  @override
  String get donationMessage =>
      'Hash yra ne pelno siekiantis projektas. Jūsų parama padeda mums kurti tikrai privatų mesendžerį.';

  @override
  String get recentConnections => 'Naujausi prisijungimai';

  @override
  String get loginInfoText =>
      'Kiekvienas PIN atrakinimas registruojamas vietoje. Saugomi tik paskutiniai 24 val.';

  @override
  String get connectionCount => 'Prisijungimas(-ai)';

  @override
  String get periodLabel => 'Laikotarpis';

  @override
  String get historyLabel => 'Istorija';

  @override
  String get noLoginRecorded => 'Nėra užregistruotų prisijungimų';

  @override
  String get nextUnlocksAppearHere => 'Kiti atrakinimai bus rodomi čia.';

  @override
  String get dataLocalOnly =>
      'Šie duomenys saugomi tik jūsų įrenginyje ir niekada neperduodami.';

  @override
  String get currentSession => 'Dabartinė';

  @override
  String get todayLabel => 'Šiandien';

  @override
  String get yesterdayLabel => 'Vakar';

  @override
  String get justNowLabel => 'Ką tik';

  @override
  String minutesAgoLabel(int count) {
    return 'Prieš $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Prieš $hours val';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Prieš $hours val $minutes min';
  }

  @override
  String get noMaintenancePlanned => 'Nėra suplanuotų priežiūros darbų';

  @override
  String get everythingWorkingNormally => 'Viskas veikia normaliai';

  @override
  String get maintenanceTitle => 'Priežiūra';

  @override
  String get maintenanceActiveLabel => 'VYKDOMA';

  @override
  String get maintenancePlannedLabel => 'SUPLANUOTA';

  @override
  String get locking => 'Užrakinama...';

  @override
  String get newMessageNotification => 'Nauja žinutė';

  @override
  String get secExplainTitle => 'Kaip Hash tave saugo';

  @override
  String get secExplainIntro =>
      'Hash sukurtas taip, kad niekas negalėtų perskaityti tavo žinučių.';

  @override
  String get secExplainIntroSub =>
      'Net mes.\nŠtai kaip tai veikia, paaiškinta paprastai.';

  @override
  String get secJourneyLabel => 'KELIONĖ';

  @override
  String get secJourneyTitle => 'Tavo žinutės kelionė';

  @override
  String get secJourneySubtitle =>
      'Nuo tavo piršto iki kontakto ekrano — kiekvienas žingsnis apsaugotas. Sek kelią.';

  @override
  String get secStep1Title => 'Tu rašai žinutę';

  @override
  String get secStep1Desc =>
      'Tu surašai \"Labas!\" programėlėje. Šiuo metu žinutė egzistuoja tik tavo telefono atmintyje. Nieko neišsiųsta.';

  @override
  String get secStep2Title => 'Šifravimas su Signal Protocol';

  @override
  String get secStep2Desc =>
      'Kai tik paspaudžiate \"Siųsti\", žinutė paverčiama nesuprantamų simbolių eilute. Tai tarsi žinutė būtų užrakinta seife, kurio raktą turi tik jūsų kontaktas.';

  @override
  String get secStep3Title => 'Sealed Sender: nematomas vokas';

  @override
  String get secStep3Desc =>
      'Įsivaizduokite, kad siunčiate laišką paštu, bet be siuntėjo adreso ant voko. Būtent tai daro Hash. Žinutė numečiama į anonimišką pašto dėžutę. Serveris nežino, kas ją atsiuntė.';

  @override
  String get secStep4Title => 'Serveris nieko nemato';

  @override
  String get secStep4Desc =>
      'Serveris veikia kaip aklas paštininkas. Jis tik žino \"kažkas kažką įmetė į dėžutę #A7X9\". Nežino, kas siuntė, kas tai yra ir kam skirta.';

  @override
  String get secStep4Highlight =>
      'Jokia metaduomenų saugykla: jokio IP adreso, jokio laiko žymės, jokio ryšio tarp siuntėjo ir gavėjo.';

  @override
  String get secStep5Title => 'Tavo kontaktas gauna žinutę';

  @override
  String get secStep5Desc =>
      'Tavo kontakto telefonas pasiima turinį iš anonimiškos pašto dėžutės ir iššifruoja žinutę savo privačiu raktu, kuris niekada nepaliko jo įrenginio. \"Labas!\" pasirodo ekrane.';

  @override
  String get secStep6Title => 'Žinutė dingsta iš serverio';

  @override
  String get secStep6Desc =>
      'Kai tavo kontaktas patvirtina gavimą, serveris visam laikui ištrina žinutę. Jokios šiukšlinės, jokio archyvo, jokios atsarginės kopijos. Net neskaitytos žinutės automatiškai sunaikinamos po 24 valandų.';

  @override
  String get secStep7Title => 'Vietinė galiojimo pabaiga';

  @override
  String get secStep7Desc =>
      'Tavo kontakto telefone žinutė susinaikina pagal pasirinktą trukmę: iš karto po perskaitymo, po 5 minučių, 1 valandos... tu spręski.';

  @override
  String get secJourneyConclusion =>
      'Rezultatas: jokių pėdsakų serveryje, jokių pėdsakų įrenginiuose. Žinutė egzistavo tik tiek, kiek reikėjo ją perskaityti, tada dingo.';

  @override
  String get secArchLabel => 'ARCHITEKTŪRA';

  @override
  String get secArchTitle => '5 apsaugos sluoksniai';

  @override
  String get secArchSubtitle =>
      'Hash nesiremia viena technologija. Kiekvienas sluoksnis sustiprina kitus. Net jei vienas sluoksnis pažeidžiamas, tavo duomenys lieka saugūs.';

  @override
  String get secLayer1Title => 'Ištisinis šifravimas';

  @override
  String get secLayer1Desc =>
      'Kiekviena žinutė šifruojama unikaliu raktu. Paprastai tariant: net jei kas nors iššifruoja vieną žinutę, sekančios iššifruoti negalės. Kiekviena žinutė turi savo spyną.';

  @override
  String get secLayer1Detail =>
      'Failams (nuotraukoms, vaizdo įrašams, dokumentams) Hash naudoja papildomą AES-256-GCM šifravimą. Failas užšifruojamas prieš paliekant telefoną.';

  @override
  String get secLayer2Title => 'Sealed Sender (tinklo anonimiškumas)';

  @override
  String get secLayer2Desc =>
      'Įprastos pranešimų programos siunčia žinutes su pridėta tapatybe. Tai kaip rašyti savo vardą ant voko. Hash naudoja anonimines pašto dėžutes: serveris pristato žinutę nežinodamas, kas ją siuntė.';

  @override
  String get secLayer2Detail =>
      'Rezultatas: net serverio duomenų nutekėjimo atveju neįmanoma atkurti, kas su kuo kalbėjosi.';

  @override
  String get secLayer3Title => 'Automatinis trynimas';

  @override
  String get secLayer3Desc =>
      'Žinutės ištrinamos iš serverio iš karto po gavimo patvirtinimo. Net jei žinutė niekada negaunama, ji automatiškai sunaikinama po 24 valandų.';

  @override
  String get secLayer3Detail =>
      'Tavo telefone žinutės susinaikina pagal pasirinktą trukmę: iš karto, 5 min, 15 min, 30 min, 1 val, 3 val, 6 val arba 12 val.';

  @override
  String get secLayer4Title => 'Vietinės prieigos apsauga';

  @override
  String get secLayer4Desc =>
      'Programėlė apsaugota 6 skaitmenų PIN kodu ir/arba biometrika (Face ID, piršto antspaudas). Po per daug nesėkmingų bandymų programėlė užsirakins su vis ilgėjančia delsa.';

  @override
  String get secLayer5Title => 'Užrakinta duomenų bazė';

  @override
  String get secLayer5Desc =>
      'Serverio pusėje joks vartotojas negali tiesiogiai rašyti į duomenų bazę. Visi veiksmai vykdomi per saugias funkcijas, kurios tikrina kiekvieną užklausą.';

  @override
  String get secLayer5Detail =>
      'Tai kaip banko langelis: niekada pats nelieti seifo. Pateiki užklausą, o sistema patikrina, ar turi teisę, prieš veikdama.';

  @override
  String get secVashLabel => 'UNIKALUS PASAULYJE';

  @override
  String get secVashTitle => 'Vash režimas';

  @override
  String get secVashSubtitle =>
      'Avarinė saugumo sistema, kuri neegzistuoja jokioje kitoje pranešimų programėlėje.';

  @override
  String get secVashScenarioTitle => 'Įsivaizduok šią situaciją';

  @override
  String get secVashScenario1 => 'Kažkas prieina prie tavo telefono';

  @override
  String get secVashScenario2 => 'Tavęs prašo PIN kodo';

  @override
  String get secVashScenario3 => 'Nori skubiai ištrinti visus duomenis';

  @override
  String get secVashSolutionTitle => 'Sprendimas: du PIN kodai';

  @override
  String get secVashSolutionDesc =>
      'Hash sukonfigūruoji du skirtingus PIN kodus:';

  @override
  String get secVashNormalCodeLabel => 'Įprastas kodas';

  @override
  String get secVashNormalCodeDesc =>
      'Atidaro programėlę normaliai su visais duomenimis';

  @override
  String get secVashCodeLabel2 => 'Vash kodas';

  @override
  String get secVashCodeDescription =>
      'Atidaro programėlę normaliai... bet visi duomenys tyliai ištrinami fone';

  @override
  String get secVashWhatHappensTitle => 'Kas vyksta toliau';

  @override
  String get secVashWhatHappensDesc =>
      'Programėlė atsidaro normaliai. Jokio įspėjimo, jokios įtartinos animacijos. Ekranas tiesiog rodo tuščią programėlę, tarsi ką tik ją įdiegei.\n\nIš tikrųjų visi pokalbiai, kontaktai ir žinutės buvo neatšaukiamai ištrinti per akimirką.';

  @override
  String get secCallsLabel => 'SKAMBUČIAI IR FAILAI';

  @override
  String get secCallsTitle => 'Viskas šifruota';

  @override
  String get secCallsSubtitle =>
      'Ne tik žinutės. Absoliučiai viskas, kas eina per Hash, yra ištisai šifruota.';

  @override
  String get secAudioCallTitle => 'Garso skambučiai';

  @override
  String get secAudioCallDesc =>
      'Ištisai šifruoti per WebRTC. Balsas perduodamas tiesiogiai tarp įrenginių.';

  @override
  String get secVideoCallTitle => 'Vaizdo skambučiai';

  @override
  String get secVideoCallDesc =>
      'Ta pati technologija, kiekvienas srautas šifruojamas atskirai.';

  @override
  String get secPhotosTitle => 'Nuotraukos ir vaizdo įrašai';

  @override
  String get secPhotosDesc =>
      'Šifruojami AES-256-GCM prieš paliekant telefoną.';

  @override
  String get secDocsTitle => 'Dokumentai';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, bet koks failas. Pavadinimas, dydis ir turinys šifruojami.';

  @override
  String get secAnonLabel => 'ANONIMIŠKUMAS';

  @override
  String get secAnonTitle => 'Tapatybė nereikalinga';

  @override
  String get secAnonSubtitle =>
      'Hash niekada neprašo telefono numerio ar el. pašto. Esi identifikuojamas unikaliu ir anonimišku Hash ID.';

  @override
  String get secHashIdTitle => 'Tavo Hash ID';

  @override
  String get secHashIdDesc =>
      'Tai tavo unikalus identifikatorius. Jis nieko neatskleidžia apie tave: nei vardo, nei numerio, nei vietos. Tai tarsi slapyvardis, kurio neįmanoma susieti su tikra tapatybe.\n\nNorint pridėti kontaktą, dalinies Hash ID arba nuskaitai QR kodą. Tiek. Jokio sinchronizuoto adresų sąrašo, jokių \"Žmonės, kuriuos galbūt pažįsti\" pasiūlymų.';

  @override
  String get secDataLabel => 'DUOMENYS';

  @override
  String get secDataTitle => 'Ko Hash nežino';

  @override
  String get secDataSubtitle =>
      'Geriausias būdas apsaugoti duomenis — jų nerinkti.';

  @override
  String get secNeverCollected => 'Niekada nerenkami';

  @override
  String get secNeverItem1 => 'Žinučių turinys';

  @override
  String get secNeverItem2 => 'Kontaktų sąrašas';

  @override
  String get secNeverItem3 => 'Telefono numeris';

  @override
  String get secNeverItem4 => 'El. pašto adresas';

  @override
  String get secNeverItem5 => 'IP adresas';

  @override
  String get secNeverItem6 => 'Vieta';

  @override
  String get secNeverItem7 => 'Metaduomenys (kas su kuo kalbasi)';

  @override
  String get secNeverItem8 => 'Skambučių istorija';

  @override
  String get secNeverItem9 => 'Adresų sąrašas';

  @override
  String get secNeverItem10 => 'Reklamos identifikatoriai';

  @override
  String get secTempStored => 'Saugoma laikinai';

  @override
  String get secTempItem1 => 'Anoniminis Hash ID (unikalus identifikatorius)';

  @override
  String get secTempItem2 => 'Viešieji šifravimo raktai';

  @override
  String get secTempItem3 => 'Šifruotos žinutės tranzite (maks. 24 val)';

  @override
  String get secTempNote =>
      'Net šie minimalūs duomenys negali tavęs identifikuoti. Tavo Hash ID nėra susietas su jokia asmenine informacija.';

  @override
  String get secFooterTitle => 'Tavo privatumas, tavo laisvė';

  @override
  String get secFooterDesc =>
      'Hash naudoja tas pačias šifravimo technologijas kaip reikliausios profesionalios programos. Tavo žinutės apsaugotos matematika, ne pažadais.';

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
