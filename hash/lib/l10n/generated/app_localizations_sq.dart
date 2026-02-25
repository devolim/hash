// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero gjurme. Zero kompromis.';

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
  String get conversations => 'Bisedat';

  @override
  String get contacts => 'Kontaktet';

  @override
  String get noConversation => 'Asnje bisede';

  @override
  String get noConversationSubtitle =>
      'Shtoni nje kontakt per te filluar komunikimin e sigurt';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kerkesa ne pritje',
      one: '1 kerkese ne pritje',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kerkesa te derguara ne pritje',
      one: '1 kerkese e derguar ne pritje',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Shto kontakt';

  @override
  String get shareApp => 'Ndaj aplikacionin';

  @override
  String get newMessage => 'Mesazh i ri';

  @override
  String get newConversation => 'Dergo nje mesazh';

  @override
  String get settings => 'Cilesimet';

  @override
  String get myHashId => 'Hash ID ime';

  @override
  String get supportHash => 'Mbeshtesni Hash';

  @override
  String get supportHashSubtitle => 'Hash eshte nje projekt jofitimprures';

  @override
  String get donate => 'Dhuro';

  @override
  String get appearance => 'Pamja';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatike';

  @override
  String get themeAutoSubtitle => 'Ndjek cilesimet e sistemit';

  @override
  String get themeDark => 'E erret';

  @override
  String get themeLight => 'E ndritshme';

  @override
  String get themeRecommendation =>
      'Tema e erret rekomandohet per privatesi me te mire';

  @override
  String get language => 'Gjuha';

  @override
  String get languageAuto => 'Automatike (sistemi)';

  @override
  String get notifications => 'Njoftimet';

  @override
  String get messages => 'Mesazhet';

  @override
  String get calls => 'Thirrjet';

  @override
  String get vibration => 'Dridhja';

  @override
  String get notificationContent => 'Permbajtja e njoftimit';

  @override
  String get notificationContentFull => 'Shfaq te gjitha';

  @override
  String get notificationContentFullDesc =>
      'Emri i kontaktit dhe parapamja e mesazhit';

  @override
  String get notificationContentName => 'Vetem emri';

  @override
  String get notificationContentNameDesc => 'Shfaq vetem emrin e kontaktit';

  @override
  String get notificationContentDiscrete => 'Diskret';

  @override
  String get notificationContentDiscreteDesc => 'Shfaq vetem \"Mesazh i ri\"';

  @override
  String get security => 'Siguria';

  @override
  String get howHashProtectsYou => 'Si ju mbron Hash';

  @override
  String get howHashProtectsYouSubtitle => 'Kuptoni sigurine tuaj';

  @override
  String get accountSecurity => 'Siguria e llogarise';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, modaliteti Vash';

  @override
  String get blockScreenshots => 'Blloko pamjet e ekranit';

  @override
  String get transferDevice => 'Transfero ne nje pajisje tjeter';

  @override
  String get transferDeviceSubtitle => 'Migro llogarise tende';

  @override
  String get pinCode => 'Kodi PIN';

  @override
  String get changePin => 'Ndrysho kodin PIN';

  @override
  String get currentPin => 'Kodi PIN aktual';

  @override
  String get newPin => 'Kodi PIN i ri';

  @override
  String get confirmPin => 'Konfirmo kodin PIN';

  @override
  String get pinChanged => 'Kodi PIN u ndryshua';

  @override
  String get incorrectPin => 'PIN i gabuar';

  @override
  String get pinsDoNotMatch => 'Kodet PIN nuk perputhen';

  @override
  String get autoLock => 'Kyçje automatike';

  @override
  String get autoLockDelay => 'Vonesa e kyçjes';

  @override
  String get autoLockImmediate => 'Menjehere';

  @override
  String get autoLockMinute => '1 minute';

  @override
  String autoLockMinutes(int count) {
    return '$count minuta';
  }

  @override
  String get vashCode => 'Kodi Vash';

  @override
  String get vashModeTitle => 'Modaliteti Vash';

  @override
  String get vashModeExplanation => 'Rrjeta juaj e fundit e sigurise.';

  @override
  String get vashModeDescription =>
      'Do te zgjidhni nje kod te dyte PIN. Nese detyroheni te hapni Hash, futni kete kod ne vend te PIN tuaj te zakonshem.\n\nAplikacioni do te hapet normalisht, por te gjitha bisedat dhe kontaktet do te jene zhdukur.\n\nPer kedo qe shikon ekranin, Hash duket thjesht bosh — sikur te mos e kishit perdorur kurre.';

  @override
  String get vashModeIrreversible =>
      'Ky veprim eshte i heshtur dhe i pakthyeshem.';

  @override
  String get chooseVashCode => 'Zgjidh kodin tim Vash';

  @override
  String get vashCodeInfo =>
      'Nje kod i dyte PIN qe hap aplikacionin normalisht, por bosh.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Nese futni kete kod ne vend te PIN:';

  @override
  String get vashDeleteContacts => 'Kontaktet tuaja zhduken';

  @override
  String get vashDeleteMessages => 'Bisedat tuaja zhduken';

  @override
  String get vashDeleteHistory => 'Shenimetuaja zhduken';

  @override
  String get vashKeepId =>
      'Identiteti juaj Hash (#XXX-XXX-XXX) mbetet i njejte';

  @override
  String get vashAppearNormal =>
      'Aplikacioni duket normal por bosh, si i ri. Ky veprim eshte i pakthyeshem.';

  @override
  String get setupVashCode => 'Vendos kodin Vash';

  @override
  String get modifyVashCode => 'Modifiko kodin Vash';

  @override
  String get currentVashCode => 'Kodi Vash aktual';

  @override
  String get newVashCode => 'Kodi Vash i ri';

  @override
  String get confirmVashCode => 'Konfirmo kodin Vash';

  @override
  String get vashCodeConfigured => 'Kodi Vash u konfigurua';

  @override
  String get vashCodeModified => 'Kodi Vash u modifikua';

  @override
  String get vashCodeMustDiffer => 'Kodi Vash duhet te jete i ndryshem nga PIN';

  @override
  String get incorrectVashCode => 'Kod Vash i gabuar';

  @override
  String get vashWhatToDelete =>
      'Çfare duhet te beje modaliteti Vash te zhduke?';

  @override
  String get vashDeleteContactsOption => 'Kontaktet';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mesazhet';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Shenimet';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Modaliteti Vash u aktivizua';

  @override
  String get vashCreateSubtitle => 'Zgjidh nje kod te ndryshem nga PIN kryesor';

  @override
  String get vashConfirmSubtitle => 'Konfirmo kodin tuaj Vash';

  @override
  String get pinCodeForEntry => 'Kodi PIN për hyrje në aplikacion';

  @override
  String get vashCodeSection => 'Modaliteti Vash';

  @override
  String get biometric => 'Biometri';

  @override
  String get biometricUnlock => 'Zhblloko me gjurmë gishti ose Face ID';

  @override
  String get enableBiometric => 'Aktivizo biometrinë';

  @override
  String get biometricWarningMessage =>
      'Duke aktivizuar biometrinë, nuk do të mund të përdorni kodin Vash për të hyrë në aplikacion.\n\nDo të mund të përdorni kodin Vash vetëm nëse biometria dështon (pas disa përpjekjeve të dështuara).\n\nA jeni i sigurt se dëshironi të vazhdoni?';

  @override
  String get understood => 'E kuptova';

  @override
  String get shareAppSubtitle => 'Ndani Hash me të afërmit tuaj';

  @override
  String get share => 'Ndaj';

  @override
  String get danger => 'Rrezik';

  @override
  String get deleteAccount => 'Fshi llogarise time';

  @override
  String get deleteAccountSubtitle => 'Veprim i pakthyeshem';

  @override
  String get deleteAccountConfirmTitle => 'Fshi llogarise time';

  @override
  String get deleteAccountConfirmMessage =>
      'Llogaria juaj do te fshihet perfundimisht. Ky veprim eshte i pakthyeshem.\n\n• Te gjitha bisedat tuaja\n• Te gjitha kontaktet tuaja\n• Hash ID juaj\n\nDo te duhet te krijoni nje llogari te re.';

  @override
  String get deleteForever => 'Fshi perfundimisht';

  @override
  String get cancel => 'Anulo';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Modaliteti Vash u aktivizua.';

  @override
  String deletionError(String error) {
    return 'Gabim gjate fshirjes: $error';
  }

  @override
  String get yourSecurity => 'Siguria juaj';

  @override
  String get securityInfo =>
      '• Kriptim nga skaji ne skaj (Signal Protocol)\n• Asnje e dhene ne serverat tane pas dorezimit\n• Çelesat ruhen vetem ne pajisjen tuaj\n• Kodi PIN nuk dergohet kurre ne server';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Mireseerdhet';

  @override
  String get securityStatement1 => 'Mesazhet tuaja jane te mbrojtura.';

  @override
  String get securityStatement2 => 'Kriptim nga skaji ne skaj.';

  @override
  String get securityStatement3 => 'Asnje gjurme. Asnje kompromis.';

  @override
  String get securityStatement4 => 'Privatesia juaj eshte nje e drejte.';

  @override
  String get accessBlocked => 'Aksesi i bllokuar';

  @override
  String get tooManyAttempts => 'Shume perpjekje. Provoni me vone.';

  @override
  String get pleaseWait => 'Ju lutem prisni';

  @override
  String get waitDelay => 'Ju lutem prisni derisa te mbaroje vonesa';

  @override
  String attemptCount(int current, int max) {
    return 'Perpjekja $current nga $max';
  }

  @override
  String retryIn(String time) {
    return 'Riprovo pas $time';
  }

  @override
  String get forgotPin => 'Keni harruar PIN? Perdorni frazen e rikuperimit';

  @override
  String get useRecoveryPhrase => 'Perdor frazen e rikuperimit';

  @override
  String get recoveryWarningTitle => 'Paralajmerim';

  @override
  String get recoveryWarningMessage => 'Rikuperimi i llogarise do te:';

  @override
  String get recoveryDeleteAllMessages => 'Fshije TE GJITHA mesazhet tuaja';

  @override
  String get recoveryWaitDelay => 'Kerkoje nje vonese 1-oreshe';

  @override
  String get recoveryKeepContacts => 'Ruaje kontaktet tuaja';

  @override
  String get recoveryIrreversible =>
      'Ky veprim eshte i pakthyeshem. Mesazhet tuaja do te humbasin perfundimisht.';

  @override
  String get iUnderstand => 'Kuptoj';

  @override
  String get accountRecovery => 'Rikuperimi i llogarise';

  @override
  String get enterRecoveryPhrase =>
      'Futni 24 fjalet e frazes suaj te rikuperimit, te ndara me hapesira.';

  @override
  String get recoveryPhraseHint => 'fjala1 fjala2 fjala3 ...';

  @override
  String get recover => 'Rikupero';

  @override
  String get recoveryPhraseRequired => 'Ju lutem futni frazen e rikuperimit';

  @override
  String get recoveryPhrase24Words =>
      'Fraza duhet te permbaje saktesisht 24 fjale';

  @override
  String get incorrectRecoveryPhrase => 'Fraze rikuperimi e gabuar';

  @override
  String get recoveryInitError => 'Gabim gjate inicializimit te rikuperimit';

  @override
  String get securityDelay => 'Vonese sigurie';

  @override
  String get securityDelayMessage =>
      'Per sigurine tuaj, kerkohet nje periudhe pritjeje perpara se te krijoni nje PIN te ri.';

  @override
  String get timeRemaining => 'Koha e mbetur';

  @override
  String get messagesDeletedForProtection =>
      'Mesazhet tuaja jane fshire per mbrojtjen tuaj.';

  @override
  String get canCloseApp =>
      'Mund te mbyllni aplikacionin dhe te ktheheni me vone.';

  @override
  String get onboardingTitle1 => 'Mireseerdhet ne Hash';

  @override
  String get onboardingSubtitle1 => 'Mesazhieri qe nuk le gjurme';

  @override
  String get onboardingTitle2 => 'Kriptim total';

  @override
  String get onboardingSubtitle2 =>
      'Mesazhet tuaja jane te kriptuara nga skaji ne skaj me protokollin Signal';

  @override
  String get onboardingTitle3 => 'Asnje gjurme';

  @override
  String get onboardingSubtitle3 =>
      'Mesazhet fshihen nga serverat pas dorezimit';

  @override
  String get onboardingTitle4 => 'Siguria juaj';

  @override
  String get onboardingSubtitle4 =>
      'Kodi PIN, modaliteti Vash dhe fraza e rikuperimit';

  @override
  String get getStarted => 'Fillo';

  @override
  String get next => 'Vazhdo';

  @override
  String get skip => 'Kalo';

  @override
  String get alreadyHaveAccount => 'Kam tashme nje llogari';

  @override
  String get transferMyAccount => 'Transfero llogarise time';

  @override
  String get createPin => 'Krijo nje kod PIN';

  @override
  String get createPinSubtitle =>
      'Ky kod do te mbroje aksesin ne aplikacionin tuaj';

  @override
  String get confirmYourPin => 'Konfirmo kodin tuaj PIN';

  @override
  String get confirmPinSubtitle => 'Futni perseri kodin tuaj PIN';

  @override
  String get saveRecoveryPhrase => 'Fraza e rikuperimit';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Shkruani keto 24 fjale ne rend. Ato do t\'ju lejojne te rikuperoni llogarise nese harroni PIN.';

  @override
  String get phraseWritten => 'Kam shkruar frazen';

  @override
  String get warningRecoveryPhrase =>
      'Nese humbni kete fraze dhe harroni PIN, do te humbni aksesin ne llogari.';

  @override
  String get accountTransferred => 'Llogaria u transferua';

  @override
  String get accountTransferredMessage =>
      'Llogaria juaj u transferua ne nje pajisje tjeter. Kjo seance nuk eshte me e vlefshme.';

  @override
  String get accountTransferredInfo =>
      'Nese nuk e keni nisur kete transfer, llogaria juaj mund te jete e kompromituar.';

  @override
  String get logout => 'Dil';

  @override
  String get transferAccount => 'Transfero llogarise';

  @override
  String get transferAccountInfo =>
      'Transfero llogarise tuaj Hash ne nje pajisje te re. Seanca aktuale do te anulohet.';

  @override
  String get generateTransferCode => 'Gjenero kodin e transferimit';

  @override
  String get transferCode => 'Kodi i transferimit';

  @override
  String transferCodeExpires(int minutes) {
    return 'Ky kod skadon pas $minutes minutash';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Futni kete kod ne pajisjen e re per te transferuar llogarise.';

  @override
  String get generateNewCode => 'Gjenero kod te ri';

  @override
  String get scanQrCode => 'Skano QR code';

  @override
  String get scanQrCodeSubtitle => 'Skanoni QR code e kontaktit per ta shtuar';

  @override
  String get qrCodeDetected => 'QR code u detektua';

  @override
  String get invalidQrCode => 'QR code e pavlefshme';

  @override
  String get cameraPermissionRequired => 'Kerkohet leja e kameres';

  @override
  String get myQrCode => 'QR code ime';

  @override
  String get myQrCodeSubtitle =>
      'Ndani kete QR code qe kontaktet t\'ju shtojne';

  @override
  String get shareQrCode => 'Ndaj';

  @override
  String get addContactTitle => 'Shto kontakt';

  @override
  String get addContactByHashId => 'Futni Hash ID te kontaktit tuaj';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Kerko';

  @override
  String get contactNotFound => 'Kontakti nuk u gjet';

  @override
  String get contactAlreadyAdded => 'Ky kontakt eshte tashme ne listen tuaj';

  @override
  String get contactAdded => 'Kontakti u shtua';

  @override
  String get myProfile => 'Profili im';

  @override
  String get myProfileSubtitle =>
      'Ndani keto informacione qe te tjeret t\'ju shtojne';

  @override
  String get temporaryCode => 'Kod i perkohshem';

  @override
  String temporaryCodeExpires(String time) {
    return 'Skadon pas $time';
  }

  @override
  String get codeExpired => 'Kodi ka skaduar';

  @override
  String get generateNewCodeButton => 'Kod i ri';

  @override
  String get copyHashId => 'Kopjo ID';

  @override
  String get copyCode => 'Kopjo kodin';

  @override
  String get copiedToClipboard => 'U kopjua';

  @override
  String get showMyQrCode => 'Shfaq QR code time';

  @override
  String get orDivider => 'ose';

  @override
  String get openScanner => 'Hap skanerin';

  @override
  String get addManually => 'Shto manualisht';

  @override
  String get contactHashIdLabel => 'Hash ID i kontaktit';

  @override
  String get temporaryCodeLabel => 'Kodi i perkohshem';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Kerkoni kontaktit te gjeneroje nje kod nga profili i tij';

  @override
  String get verifyAndAdd => 'Verifiko dhe shto';

  @override
  String get fillAllFields => 'Ju lutem plotesoni te gjitha fushat';

  @override
  String get invalidHashIdFormat =>
      'Format ID i pavlefshem (p.sh.: 123-456-ABC)';

  @override
  String get userNotFound => 'Perdoruesi nuk u gjet';

  @override
  String get cannotAddYourself => 'Nuk mund te shtoni veten';

  @override
  String get invalidOrExpiredCode =>
      'Kod i perkohshem i pavlefshem ose i skaduar';

  @override
  String get contactFound => 'Kontakti u gjet!';

  @override
  String get howToCallContact => 'Si deshironi ta quani?';

  @override
  String get contactNameHint => 'Emri i kontaktit';

  @override
  String get addContactButton => 'Shto';

  @override
  String get contactDetails => 'Detajet e kontaktit';

  @override
  String get contactName => 'Emri i kontaktit';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Shtuar me $date';
  }

  @override
  String get deleteContact => 'Fshi kontaktin';

  @override
  String deleteContactConfirm(Object name) {
    return 'Te fshihet ky kontakt?';
  }

  @override
  String get deleteContactMessage => 'Kjo do te fshije edhe te gjithe biseden.';

  @override
  String get delete => 'Fshi';

  @override
  String get typeMessage => 'Shkruani nje mesazh...';

  @override
  String get messageSent => 'Derguar';

  @override
  String get messageDelivered => 'Dorezuar';

  @override
  String get messageRead => 'Lexuar';

  @override
  String get messageFailed => 'Dergimi deshtoi';

  @override
  String get now => 'Tani';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}ore';
  }

  @override
  String daysAgo(int count) {
    return '${count}d';
  }

  @override
  String get today => 'Sot';

  @override
  String get yesterday => 'Dje';

  @override
  String dateAtTime(String date, String time) {
    return '$date ne $time';
  }

  @override
  String get shareMessage =>
      'Bashkohuni me mua ne Hash! 🔒\n\nEshte nje mesazhier vertet privat: kriptim total, asnje gjurme ne servera dhe modalitet paniku nese nevojitet.\n\nShkarkoni aplikacionin ketu 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Gabim';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Shiko';

  @override
  String get yes => 'Po';

  @override
  String get no => 'Jo';

  @override
  String get save => 'Ruaj';

  @override
  String get edit => 'Redakto';

  @override
  String get close => 'Mbyll';

  @override
  String get confirm => 'Konfirmo';

  @override
  String get loading => 'Duke ngarkuar...';

  @override
  String get retry => 'Riprovo';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Kerkesat ne pritje';

  @override
  String get noPendingRequests => 'Asnje kerkese ne pritje';

  @override
  String get pendingRequestsSubtitle => 'Keta persona duan t\'ju shtojne';

  @override
  String requestFromUser(String hashId) {
    return 'Kerkese nga $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Skadon pas $days ditesh';
  }

  @override
  String get acceptRequest => 'Prano';

  @override
  String get rejectRequest => 'Refuzo';

  @override
  String get requestAccepted => 'Kerkesa u pranua';

  @override
  String get requestRejected => 'Kerkesa u refuzua';

  @override
  String get requestSent => 'Kerkesa u dergua!';

  @override
  String get requestSentSubtitle =>
      'Kerkesa juaj u dergua. Perdoruesi duhet ta pranoje perpara se te komunikoni.';

  @override
  String get requestAlreadyPending => 'Nje kerkese eshte tashme ne pritje';

  @override
  String get requestAlreadySentByOther =>
      'Kjo persone ju ka derguar tashme nje kerkese';

  @override
  String get addByHashId => 'Shto me Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Futni Hash ID dhe kodin e perkohshem te kontaktit';

  @override
  String get enterTemporaryCode => 'Futni kodin me 6 shifra';

  @override
  String get sendRequest => 'Dergo kerkesen';

  @override
  String get acceptContactTitle => 'Prano kontaktin';

  @override
  String get acceptContactSubtitle =>
      'Mund t\'i jepni nje emer te personalizuar';

  @override
  String get leaveEmptyForHashId => 'Leni bosh per te perdorur Hash ID';

  @override
  String get firstName => 'Emri';

  @override
  String get lastName => 'Mbiemri';

  @override
  String get notes => 'Shenimet';

  @override
  String get notesHint => 'Shenime personale per kete kontakt';

  @override
  String get photoOptional => 'Foto (opsionale)';

  @override
  String get contactNameOptional => 'Emri (opsional)';

  @override
  String get notesOptional => 'Shenimet (opsionale)';

  @override
  String get storedLocally => 'Ruajtur vetem ne pajisjen tuaj';

  @override
  String get encryptedMessageLabel => 'Mesazh i kriptuar';

  @override
  String get identityMessageHint => 'Kush jeni? Si e njihni njeri-tjetrin?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ky mesazh do te kriptohet dhe dergohet marresit';

  @override
  String get sendRequestButton => 'Dergo kerkesen';

  @override
  String get requestExpiresIn24h => 'Kerkesa skadon pas 24h nese nuk pranohet';

  @override
  String get theyAlreadySentYouRequest =>
      'Kjo persone ju ka derguar tashme nje kerkese';

  @override
  String get requests => 'Kerkesat';

  @override
  String get receivedRequests => 'Te marra';

  @override
  String get sentRequests => 'Te derguara';

  @override
  String get noSentRequests => 'Asnje kerkese e derguar';

  @override
  String get cancelRequest => 'Anulo';

  @override
  String get deleteRequest => 'Fshi kerkesen';

  @override
  String get requestCancelled => 'Kerkesa u anulua';

  @override
  String sentTo(String hashId) {
    return 'Derguar tek $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Skadon pas $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Marre $time me pare';
  }

  @override
  String get messageFromRequester => 'Mesazh nga kerkuesi';

  @override
  String get copy => 'Kopjo';

  @override
  String get messageInfo => 'Informacione mbi mesazhin';

  @override
  String get messageDirection => 'Drejtimi';

  @override
  String get messageSentByYou => 'Derguar nga ju';

  @override
  String get messageReceived => 'Marre';

  @override
  String get messageSentAt => 'Derguar ne';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Statusi';

  @override
  String get messageReadAt => 'Lexuar ne';

  @override
  String get messageType => 'Tipi';

  @override
  String get messageSize => 'Madhesia';

  @override
  String get messageExpiresAt => 'Skadon ne';

  @override
  String get messageEncrypted => 'I kriptuar nga skaji ne skaj';

  @override
  String get messageStatusSending => 'Duke derguar...';

  @override
  String get messageStatusSent => 'Derguar';

  @override
  String get messageStatusDelivered => 'Dorezuar';

  @override
  String get messageStatusRead => 'Lexuar';

  @override
  String get messageStatusFailed => 'Deshtoi';

  @override
  String get serverStatus => 'Serveri';

  @override
  String get onServer => 'Ne pritje dorezimi';

  @override
  String get deletedFromServer => 'Fshire';

  @override
  String get messageTypeText => 'Tekst';

  @override
  String get messageTypeImage => 'Imazh';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Zer';

  @override
  String get messageTypeFile => 'Skedar';

  @override
  String get indefinitely => 'Pa afat';

  @override
  String get hoursShort => 'ore';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'ore';

  @override
  String get minutes => 'minuta';

  @override
  String get seconds => 'sekonda';

  @override
  String get ephemeralMessages => 'Mesazhe te perkohshme';

  @override
  String get ephemeralMessagesDescription =>
      'Mesazhet fshihen automatikisht pas ketij kohe';

  @override
  String get ephemeralImmediate => 'Menjehere (pas leximit)';

  @override
  String get ephemeralImmediateDesc => 'Fshihen sapo lexohen';

  @override
  String get ephemeralMyPreference => 'Preferenca ime';

  @override
  String get ephemeralMyPreferenceDesc => 'Perdor cilesimin global';

  @override
  String get ephemeralDefaultSetting => 'Kohezgjatja e mesazhit';

  @override
  String get ephemeralChooseDefault => 'I rekomanduar';

  @override
  String get ephemeral30Seconds => '30 sekonda';

  @override
  String get ephemeral30SecondsDesc => 'Fshirë 30s pas leximit';

  @override
  String get ephemeral5Minutes => '5 minuta';

  @override
  String get ephemeral5MinutesDesc => 'Fshirë 5min pas leximit';

  @override
  String get ephemeral1Hour => '1 ore';

  @override
  String get ephemeral1HourDesc => 'Fshirë 1o pas leximit';

  @override
  String get ephemeral3Hours => '3 ore';

  @override
  String get ephemeral6Hours => '6 ore';

  @override
  String get ephemeral6HoursDesc => 'Fshirë 6o pas leximit';

  @override
  String get ephemeral12Hours => '12 ore';

  @override
  String get ephemeral24Hours => '24 ore';

  @override
  String get ephemeral24HoursDesc => 'Fshirë 24o pas leximit';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Kohezgjatje e personalizuar';

  @override
  String get howItWorks => 'Si funksionon';

  @override
  String get ephemeralExplanation1 =>
      'Mesazhet fshihen nga serveri sapo merren.';

  @override
  String get ephemeralExplanation2 =>
      'Ky cilesim percakton kur mesazhet zhduken nga telefoni JUAJ pas leximit.';

  @override
  String get ephemeralExplanation3 =>
      'Kontakti juaj ka cilesimin e vet per telefonin e tij.';

  @override
  String get mute1Hour => '1 ore';

  @override
  String get mute8Hours => '8 ore';

  @override
  String get mute1Day => '1 dite';

  @override
  String get mute1Week => '1 jave';

  @override
  String get muteAlways => 'Gjithmone';

  @override
  String get muteExplanation => 'Nuk do te merrni njoftime per kete kontakt';

  @override
  String get showCallsInRecents => 'Shfaq në thirrjet e fundit';

  @override
  String get showCallsInRecentsSubtitle =>
      'Thirrjet Hash shfaqen në historikun e telefonit';

  @override
  String get feedback => 'Përshtypje';

  @override
  String get muteNotifications => 'Hesht njoftimet';

  @override
  String get muteDescription => 'Nuk do te merrni njoftime per kete kontakt';

  @override
  String mutedUntil(String time) {
    return 'Heshtur deri ne $time';
  }

  @override
  String get notMuted => 'Njoftimet te aktivizuara';

  @override
  String get unmute => 'Aktivizo';

  @override
  String get notificationSound => 'Tingulli i njoftimit';

  @override
  String get defaultSound => 'I paracaktuar';

  @override
  String get chatSettings => 'Cilesimet e bisedes';

  @override
  String get bubbleColor => 'Ngjyra e flluskes';

  @override
  String get backgroundColor => 'Ngjyra e sfondit';

  @override
  String get backgroundImage => 'Imazhi i sfondit';

  @override
  String get chatBackground => 'Sfondi i bisedes';

  @override
  String get customColor => 'E personalizuar';

  @override
  String get defaultColor => 'E paracaktuar';

  @override
  String get imageSelected => 'Imazhi u zgjodh';

  @override
  String get noImage => 'Asnje imazh';

  @override
  String get color => 'Ngjyra';

  @override
  String get image => 'Imazh';

  @override
  String get tapToSelectImage => 'Trokitni per te zgjedhur nje imazh';

  @override
  String get changeImage => 'Ndrysho imazhin';

  @override
  String get previewMessageReceived => 'Pershendetje!';

  @override
  String get previewMessageSent => 'Tungjatjeta!';

  @override
  String get messageAction => 'Mesazh';

  @override
  String get callAction => 'Thirrje';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Shenime personale';

  @override
  String get addNotes => 'Shto shenime...';

  @override
  String get noNotes => 'Asnje shenim';

  @override
  String get messageNotifications => 'Njoftimet e mesazheve';

  @override
  String get callNotifications => 'Njoftimet e thirrjeve';

  @override
  String get useGradient => 'Perdor gradient';

  @override
  String get gradientStart => 'Ngjyra e fillimit';

  @override
  String get gradientEnd => 'Ngjyra e fundit';

  @override
  String get preview => 'Parapamje';

  @override
  String get reset => 'Rivendos';

  @override
  String get securityNumber => 'Numri i sigurise';

  @override
  String securityNumberDescription(String name) {
    return 'Verifikoni qe numri i sigurise perputhet me pajisjen e $name';
  }

  @override
  String get verifyEncryption => 'Verifiko kriptimin nga skaji ne skaj';

  @override
  String get tapToCopy => 'Trokitni per te kopjuar';

  @override
  String get howToVerify => 'Si te verifikoni';

  @override
  String get verifyStep1 => 'Takohuni me kontaktin personalisht ose telefononi';

  @override
  String get verifyStep2 => 'Krahasoni numrat e sigurise ose skanoni QR code';

  @override
  String get verifyStep3 => 'Nese perputhen, biseda juaj eshte e sigurt';

  @override
  String get scanToVerify => 'Skano per te verifikuar';

  @override
  String get reportSpam => 'Raporto spam';

  @override
  String get reportSpamSubtitle => 'Raportoni kete kontakt si spam';

  @override
  String get reportSpamDescription =>
      'Kjo do te raportoje anonim kete kontakt. Identiteti juaj nuk do te ndahet. Jeni i sigurt?';

  @override
  String get report => 'Raporto';

  @override
  String get spamReported => 'Spam u raportua';

  @override
  String get reportError => 'Raportimi nuk u dergua. Ju lutem provoni perseri.';

  @override
  String get reportRateLimited =>
      'Keni arritur numrin maksimal te raportimeve per sot.';

  @override
  String get blockContact => 'Blloko kontaktin';

  @override
  String get blockContactDescription =>
      'Ky kontakt nuk do te mund t\'ju dergoje mesazhe ose t\'ju telefonoje. Nuk do te njoftohet.';

  @override
  String get unblockContact => 'Zhblloko kontaktin';

  @override
  String get unblockContactDescription =>
      'Ky kontakt do te mund t\'ju dergoje perseri mesazhe dhe t\'ju telefonoje.';

  @override
  String get contactBlocked => 'Kontakti u bllokua';

  @override
  String get contactUnblocked => 'Kontakti u zhbllokua';

  @override
  String get contactIsBlocked => 'Ky kontakt eshte i bllokuar';

  @override
  String get unblock => 'Zhblloko';

  @override
  String get deleteContactSubtitle => 'Fshi kete kontakt dhe biseden';

  @override
  String get confirmWithPin => 'Konfirmo me PIN';

  @override
  String get enterPinToConfirm => 'Futni PIN per te konfirmuar kete veprim';

  @override
  String get profilePhoto => 'Foto e profilit';

  @override
  String get takePhoto => 'Bej nje foto';

  @override
  String get chooseFromGallery => 'Zgjidh nga galeria';

  @override
  String get removePhoto => 'Hiq foton';

  @override
  String get viewContactHashId => 'Shiko identifikuesin e kontaktit';

  @override
  String get hashIdPartiallyMasked =>
      'Pjeserisht i maskuar per sigurine tuaj dhe privatesine e kontaktit';

  @override
  String get addFirstContact => 'Shtoni kontaktin tuaj te pare';

  @override
  String get addFirstContactSubtitle =>
      'Ndani QR code tuaj ose skanoni te nje miku';

  @override
  String get directory => 'Drejtoria';

  @override
  String get noContacts => 'Asnje kontakt';

  @override
  String get noContactsSubtitle => 'Shtoni nje kontakt per te filluar';

  @override
  String get sendMessageAction => 'Dergo nje mesazh';

  @override
  String get audioCall => 'Thirrje audio';

  @override
  String get videoCall => 'Thirrje video';

  @override
  String get viewProfile => 'Shiko profilin';

  @override
  String get deleteContactDirectory => 'Fshi kontaktin';

  @override
  String get scanShort => 'Skano';

  @override
  String get addShort => 'Shto';

  @override
  String deleteContactConfirmName(String name) {
    return 'Jeni i sigurt qe doni te fshini $name?';
  }

  @override
  String get noNotesTitle => 'Asnje shenim';

  @override
  String get noNotesSubtitle => 'Krijoni shenimin tuaj te pare';

  @override
  String get newNote => 'Shenim i ri';

  @override
  String get editNote => 'Redakto shenimin';

  @override
  String get deleteNote => 'Fshi shenimin';

  @override
  String get deleteNoteConfirm =>
      'Jeni i sigurt qe doni te fshini kete shenim?';

  @override
  String get noteTitle => 'Titulli';

  @override
  String get noteContent => 'Permbajtja';

  @override
  String get addItem => 'Shto element';

  @override
  String get pinNote => 'Gozhdo';

  @override
  String get unpinNote => 'Hiq gozhdimin';

  @override
  String get noteColor => 'Ngjyra';

  @override
  String get notePassword => 'Fjalekalimi';

  @override
  String get setPassword => 'Vendos fjalekalimin';

  @override
  String get changePassword => 'Ndrysho fjalekalimin';

  @override
  String get removePassword => 'Hiq fjalekalimin';

  @override
  String get enterPassword => 'Futni fjalekalimin';

  @override
  String get confirmPassword => 'Konfirmoni fjalekalimin';

  @override
  String get passwordPin => 'Kodi PIN';

  @override
  String get passwordText => 'Fjalekalim tekst';

  @override
  String get protectedNote => 'Shenim i mbrojtur';

  @override
  String get incorrectPassword => 'Fjalekalim i gabuar';

  @override
  String get passwordSet => 'Fjalekalimi u vendos';

  @override
  String get passwordRemoved => 'Fjalekalimi u hoq';

  @override
  String get notesBiometric => 'Face ID per shenimet';

  @override
  String get notesBiometricSubtitle =>
      'Kerko vertetim biometrik per te hapur shenimet e mbrojtura';

  @override
  String get textNote => 'Shenim teksti';

  @override
  String get checklistNote => 'Liste kontrolli';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total detyra';
  }

  @override
  String get autoSaved => 'Ruajtur';

  @override
  String get searchNotes => 'Kerko shenimet';

  @override
  String get legalConsent => 'Pelqim ligjor';

  @override
  String get confirmAge13 => 'Konfirmoj qe jam te pakten 13 vjec';

  @override
  String get acceptLegalStart => 'Pranoj ';

  @override
  String get privacyPolicy => 'Politiken e Privatesise';

  @override
  String get termsOfService => 'Kushtet e Sherbimit';

  @override
  String get andThe => ' dhe ';

  @override
  String get continueButton => 'Vazhdo';

  @override
  String get mustAcceptTerms =>
      'Duhet te pranoni te dyja kushtet per te vazhduar';

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
  String get support => 'Mbeshtetja';

  @override
  String get contactSupport => 'Kontakto mbeshtetjen';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Raporto abuzimin';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Ligjore';

  @override
  String get legalEntity => 'Entiteti ligjor';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Gozhdo';

  @override
  String get unpinConversation => 'Hiq gozhdimin';

  @override
  String get hideConversation => 'Hiq nga rrjedha';

  @override
  String get deleteConversation => 'Fshi biseden';

  @override
  String get deleteConversationConfirm =>
      'Futni PIN per te konfirmuar fshirjen e te gjitha mesazheve';

  @override
  String get noConversations => 'Ende asnje bisede';

  @override
  String get startConversation => 'Fillo';

  @override
  String get microphonePermissionRequired => 'Kerkohet aksesi ne mikrofon';

  @override
  String get microphonePermissionExplanation =>
      'Hash ka nevoje per mikrofon per te bere thirrje.';

  @override
  String get cameraPermissionExplanation =>
      'Hash ka nevoje per kamere per thirrje video.';

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
  String get openSettings => 'Hap Cilesimet';

  @override
  String get callConnecting => 'Duke u lidhur...';

  @override
  String get callRinging => 'Duke thirrur...';

  @override
  String get callReconnecting => 'Duke u rilidhur...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Duke u rilidhur (${seconds}s)';
  }

  @override
  String get callPaused => 'E ndaluar';

  @override
  String get callPausedSubtitle => 'Thirrja është ende aktive';

  @override
  String get callRemoteMicMuted => 'Mikrofoni i kontaktit eshte i heshtur';

  @override
  String get callMiniControlsMute => 'Hesht';

  @override
  String get callMiniControlsUnmute => 'Aktivizo';

  @override
  String get callMiniControlsHangUp => 'Mbyll';

  @override
  String get callMiniControlsReturn => 'Kthehu ne thirrje';

  @override
  String get callNetworkPoor => 'Lidhje e paqendrueshme';

  @override
  String get callNetworkLost => 'Lidhja u humbe';

  @override
  String get callEndedTitle => 'Thirrja perfundoi';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Te dhenat e pajisjes';

  @override
  String get deviceDataSubtitle => 'Ruajtja lokale dhe ne server';

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
  String get localStorage => 'Ruajtja lokale';

  @override
  String get onThisDevice => 'ne kete pajisje';

  @override
  String get encryptedDatabases => 'Baza te dhenash te kriptuara';

  @override
  String get files => 'Skedare';

  @override
  String get secureKeychain => 'Zinxhir celesash i sigurt';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Emra, avatare, celesa Signal';

  @override
  String get messagesDetail => 'Biseda te kriptuara';

  @override
  String get notesDetail => 'Shenime personale';

  @override
  String get signalSessions => 'Seanca Signal';

  @override
  String get signalSessionsDetail => 'Seanca kriptimi';

  @override
  String get pendingContacts => 'Kontakte ne pritje';

  @override
  String get pendingContactsDetail => 'Kerkesa ne pritje';

  @override
  String get callHistory => 'Thirrjet';

  @override
  String get callHistoryDetail => 'Historiku i thirrjeve';

  @override
  String get preferences => 'Preferencat';

  @override
  String get preferencesDetail => 'Preferencat e medias dhe thirrjeve';

  @override
  String get avatars => 'Avataret';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skedare',
      one: '1 skedar',
      zero: 'asnje skedar',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktiv';

  @override
  String get notDefined => 'I papercaktuar';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Fraza e rikuperimit';

  @override
  String get identity => 'Identiteti (Hash ID)';

  @override
  String get signalKeys => 'Celesat Signal Protocol';

  @override
  String get authTokens => 'Tokenat e vertetimit';

  @override
  String get contactNamesCache => 'Cache e emrave te kontakteve';

  @override
  String get remoteConfig => 'Konfigurimi ne distance';

  @override
  String get notificationPrefs => 'Preferencat e njoftimeve';

  @override
  String get serverData => 'Te dhenat e serverit';

  @override
  String get serverDataInfo =>
      'Hash ruan te dhena minimale ne server, te gjitha te kriptuara ose te perkohshme.';

  @override
  String get serverProfile => 'Profili';

  @override
  String get serverProfileDetail =>
      'Hash ID, celesa publike, token i kutise postare';

  @override
  String get serverPrekeys => 'Para-celesa';

  @override
  String get serverPrekeysDetail =>
      'Celesa njeperdorimshe Signal (te konsumuara)';

  @override
  String get serverMessages => 'Mesazhe ne tranzit';

  @override
  String get serverMessagesDetail => 'Fshihen pas dorezimit (maks 24h)';

  @override
  String get serverMedia => 'Media ne tranzit';

  @override
  String get serverMediaDetail => 'Fshihen pas shkarkimit';

  @override
  String get serverContactRequests => 'Kerkesa kontakti';

  @override
  String get serverContactRequestsDetail => 'Skadojne pas 24h';

  @override
  String get serverRateLimits => 'Kufizime te shpejtesise';

  @override
  String get serverRateLimitsDetail => 'Te dhena te perkohshme kunder abuzimit';

  @override
  String get privacyReassurance =>
      'Hash nuk mund te lexoje mesazhet tuaja. Te gjitha te dhenat jane te kriptuara nga skaji ne skaj. Te dhenat e serverit fshihen automatikisht.';

  @override
  String get pinTooSimple =>
      'Ky PIN eshte shume i thjesht. Zgjidhni nje kod me te sigurt.';

  @override
  String get genericError => 'Ndodhi nje gabim. Ju lutem provoni perseri.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nuk u krijua llogaria: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraza u kopjua ne clipboard';

  @override
  String get copyPhrase => 'Kopjo frazen';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Shkruani kete fraze ne nje vend te sigurt. Nese humbni PIN pa kete fraze, do te humbni perfundimisht aksesin ne te dhenat.';

  @override
  String get noMessages => 'Asnje mesazh';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Te fshihen te gjitha mesazhet me $name?';
  }

  @override
  String get confirmation => 'Konfirmim';

  @override
  String get untitled => 'Pa titull';

  @override
  String get noSessions => 'Asnje seance';

  @override
  String get unknownContact => 'Kontakt i panjohur';

  @override
  String get unnamed => 'Pa emer';

  @override
  String get noPendingRequestsAlt => 'Asnje kerkese ne pritje';

  @override
  String get deleteAllCallHistory =>
      'Te fshihet i gjithe historiku i thirrjeve?';

  @override
  String get noCalls => 'Asnje thirrje';

  @override
  String get noPreferences => 'Asnje preference';

  @override
  String get resetAllMediaPrefs =>
      'Te rivendosen te gjitha preferencat e medias?';

  @override
  String get deleteThisAvatar => 'Te fshihet ky avatar?';

  @override
  String get deleteAllAvatars => 'Te fshihen te gjithe avataret?';

  @override
  String get noAvatars => 'Asnje avatar';

  @override
  String get deleteThisFile => 'Te fshihet ky skedar?';

  @override
  String get deleteAllMediaFiles => 'Te fshihen te gjithe mediat?';

  @override
  String get noMediaFiles => 'Asnje media';

  @override
  String get outgoing => 'Dalese';

  @override
  String get incoming => 'Hyrese';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Pamje e perkohshme: ${seconds}s';
  }

  @override
  String get normalView => 'Pamje normale';

  @override
  String get callReasonCompleted => 'Perfunduar';

  @override
  String get callReasonMissed => 'Humbur';

  @override
  String get callReasonDeclined => 'Refuzuar';

  @override
  String get callReasonFailed => 'Deshtuar';

  @override
  String get justNow => 'Tani';

  @override
  String timeAgoMinutes(int count) {
    return '$count min me pare';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}ore me pare';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}d me pare';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Vendndodhja';

  @override
  String get statusQueued => 'Ne radhe';

  @override
  String get blockedBadge => 'I bllokuar';

  @override
  String get protectedBadge => 'I mbrojtur';

  @override
  String messageCount(int count) {
    return '$count mesazh(e)';
  }

  @override
  String get deleteQuestion => 'Fshi?';

  @override
  String get transferMyAccountTitle => 'Transfero llogarise time';

  @override
  String get loadingError => 'Gabim ngarkimi';

  @override
  String get transferToNewDevice => 'Transfero ne nje pajisje te re';

  @override
  String get transferInstructions =>
      'Ne pajisjen tuaj te re, zgjidhni \"Rikupero llogarise time\" dhe futni keto informacione:';

  @override
  String get yourHashIdLabel => 'Hash ID juaj';

  @override
  String get enterYourPinCode => 'Futni kodin tuaj PIN';

  @override
  String get pinOwnerConfirmation =>
      'Per te konfirmuar qe jeni pronari i kesaj llogarise';

  @override
  String get scanThisQrCode => 'Skanoni kete QR code';

  @override
  String get withYourNewDevice => 'Me pajisjen tuaj te re';

  @override
  String get orEnterTheCode => 'ose futni kodin';

  @override
  String get transferCodeLabel => 'Kodi i transferimit';

  @override
  String get proximityVerification => 'Verifikimi i aferises';

  @override
  String get bringDevicesCloser => 'Afroni te dyja pajisjet';

  @override
  String get confirmTransferQuestion => 'Konfirmoni transferimin?';

  @override
  String get accountWillBeTransferred =>
      'Llogaria juaj do te transferohet ne pajisjen e re.\n\nKjo pajisje do te shkyçet perfundimisht.';

  @override
  String get transferComplete => 'Transferimi perfundoi';

  @override
  String get transferSuccessMessage =>
      'Llogaria juaj u transferua me sukses.\n\nKy aplikacion do te mbyllet tani.';

  @override
  String get manualVerification => 'Verifikim manual';

  @override
  String get codeDisplayedOnBothDevices =>
      'Kodi i shfaqur ne te dyja pajisjet:';

  @override
  String get doesCodeMatchNewDevice =>
      'A perputhet ky kod me ate ne pajisjen e re?';

  @override
  String get verifiedStatus => 'I verifikuar';

  @override
  String get inProgressStatus => 'Ne proces...';

  @override
  String get notAvailableStatus => 'I padisponueshem';

  @override
  String get codeExpiredRestart => 'Kodi ka skaduar. Ju lutem rinisni.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kodet nuk perputhen. Transferimi u anulua.';

  @override
  String transferToDevice(String device) {
    return 'Tek: $device';
  }

  @override
  String get copiedExclamation => 'U kopjua!';

  @override
  String expiresInTime(String time) {
    return 'Skadon pas $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometria nuk eshte e disponueshme ne kete pajisje';

  @override
  String get biometricAuthError => 'Gabim gjate vertetimit biometrik';

  @override
  String get authenticateForBiometric =>
      'Ju lutem vertetohuni per te aktivizuar biometrine';

  @override
  String get biometricAuthFailed => 'Vertetimi biometrik deshtoi';

  @override
  String get forceUpdateTitle => 'Perditesim i kerkuar';

  @override
  String get forceUpdateMessage =>
      'Nje version i ri i Hash eshte i disponueshem. Ju lutem perditesoni per te vazhduar.';

  @override
  String get updateButton => 'Perditeso';

  @override
  String get maintenanceInProgress => 'Mirembajtje ne proces';

  @override
  String get tryAgainLater => 'Ju lutem provoni me vone';

  @override
  String get information => 'Informacion';

  @override
  String get later => 'Më vonë';

  @override
  String get doYouLikeHash => 'Ju pëlqen Hash?';

  @override
  String get yourFeedbackHelps =>
      'Përshtypjet tuaja na ndihmojnë të përmirësojmë aplikacionin';

  @override
  String get ratingTerrible => 'E tmerrshme';

  @override
  String get ratingBad => 'Keq';

  @override
  String get ratingOk => 'Në rregull';

  @override
  String get ratingGood => 'Mirë';

  @override
  String get ratingExcellent => 'Shkëlqyer!';

  @override
  String get donationMessage =>
      'Hash është një projekt jofitimprurës. Mbështetja juaj na ndihmon të vazhdojmë të ndërtojmë një mesazher vërtet privat.';

  @override
  String get recentConnections => 'Lidhjet e fundit';

  @override
  String get loginInfoText =>
      'Çdo zhbllokim me PIN regjistrohet në mënyrë lokale. Ruhen vetëm 24 orët e fundit.';

  @override
  String get connectionCount => 'Lidhje(t)';

  @override
  String get periodLabel => 'Periudha';

  @override
  String get historyLabel => 'Historiku';

  @override
  String get noLoginRecorded => 'Asnje hyrje e regjistruar';

  @override
  String get nextUnlocksAppearHere => 'Shkyçjet e ardhshme do te shfaqen ketu.';

  @override
  String get dataLocalOnly =>
      'Këto të dhëna ruhen vetëm në pajisjen tuaj dhe nuk transmetohen kurrë.';

  @override
  String get currentSession => 'Aktuale';

  @override
  String get todayLabel => 'Sot';

  @override
  String get yesterdayLabel => 'Dje';

  @override
  String get justNowLabel => 'Pikërisht tani';

  @override
  String minutesAgoLabel(int count) {
    return '$count min më parë';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}o më parë';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}o ${minutes}min më parë';
  }

  @override
  String get noMaintenancePlanned => 'Asnje mirembajtje e planifikuar';

  @override
  String get everythingWorkingNormally => 'Gjithçka po punon normalisht';

  @override
  String get maintenanceTitle => 'Mirëmbajtje';

  @override
  String get maintenanceActiveLabel => 'NË VAZHDIM';

  @override
  String get maintenancePlannedLabel => 'E PLANIFIKUAR';

  @override
  String get locking => 'Duke kyçur...';

  @override
  String get newMessageNotification => 'Mesazh i ri';

  @override
  String get secExplainTitle => 'Si ju mbron Hash';

  @override
  String get secExplainIntro =>
      'Hash eshte projektuar qe askush te mos mund te lexoje mesazhet tuaja.';

  @override
  String get secExplainIntroSub =>
      'As ne.\nJa si funksionon, shpjeguar thjesht.';

  @override
  String get secJourneyLabel => 'UDHETIMI';

  @override
  String get secJourneyTitle => 'Udhetimi i mesazhit tuaj';

  @override
  String get secJourneySubtitle =>
      'Nga gishti juaj deri ne ekranin e kontaktit, çdo hap eshte i mbrojtur. Ndiqni rrugen.';

  @override
  String get secStep1Title => 'Shkruani mesazhin';

  @override
  String get secStep1Desc =>
      'Shkruani \"Pershendetje!\" ne aplikacion. Ne kete moment, mesazhi ekziston vetem ne memorien e telefonit. Asgje nuk eshte derguar.';

  @override
  String get secStep2Title => 'Kriptimi me Signal Protocol';

  @override
  String get secStep2Desc =>
      'Sapo shtypni \"Dergo\", mesazhi juaj transformohet ne nje varg karakteresh te pakuptueshme. Eshte sikur mesazhi juaj te ishte mbyllur ne nje kasaforte qe vetem kontakti juaj ka çelesin.';

  @override
  String get secStep3Title => 'Sealed Sender: zarfi i padukshem';

  @override
  String get secStep3Desc =>
      'Imagjinoni te dergoni nje leter me poste, por pa adrese kthimi ne zarf. Pikërisht kjo ndodh me Hash. Mesazhi hidhet ne nje kuti postare anonime. Serveri nuk e di kush e dergoi.';

  @override
  String get secStep4Title => 'Serveri nuk sheh asgje';

  @override
  String get secStep4Desc =>
      'Serveri vepron si nje postar i verber. Di vetem qe \"dikush hodhi diçka ne kutine postare #A7X9\". Nuk e di kush e dergoi, çfare eshte ose per ke eshte.';

  @override
  String get secStep4Highlight =>
      'Asnje metadate e ruajtur: asnje adrese IP, asnje vule kohore, asnje lidhje midis derguesit dhe marresit.';

  @override
  String get secStep5Title => 'Kontakti juaj merr mesazhin';

  @override
  String get secStep5Desc =>
      'Telefoni i kontaktit merr permbajtjen nga kutia postare anonime dhe deshifron mesazhin me çelesin e tij privat, i cili nuk ka dalur kurre nga pajisja. \"Pershendetje!\" shfaqet ne ekran.';

  @override
  String get secStep6Title => 'Mesazhi zhduket nga serveri';

  @override
  String get secStep6Desc =>
      'Sapo kontakti konfirmon marrjen, serveri fshin perfundimisht mesazhin. Asnje kosh, asnje arkiv, asnje kopje rezerve. Edhe mesazhet e palexuara shkaterohen automatikisht pas 24 oreve.';

  @override
  String get secStep7Title => 'Skadimi lokal';

  @override
  String get secStep7Desc =>
      'Ne telefonin e kontaktit, mesazhi veteshkaterohet sipas kohezgjatjes qe keni zgjedhur: menjehere pas leximit, 5 minuta, 1 ore... ju vendosni.';

  @override
  String get secJourneyConclusion =>
      'Rezultati: zero gjurme ne server, zero gjurme ne pajisje. Mesazhi ekzistoi vetem sa u desh per t\'u lexuar, pastaj u zhduk.';

  @override
  String get secArchLabel => 'ARKITEKTURA';

  @override
  String get secArchTitle => '5 shtresa mbrojtjeje';

  @override
  String get secArchSubtitle =>
      'Hash nuk mbeshtetet ne nje teknologji te vetme. Çdo shtrese forcon te tjerat. Edhe nese nje shtrese kompromitohet, te dhenat tuaja mbeten te sigurta.';

  @override
  String get secLayer1Title => 'Kriptimi nga skaji ne skaj';

  @override
  String get secLayer1Desc =>
      'Çdo mesazh kriptohet me nje çeles unik. Thjesht: edhe nese dikush deshifron nje mesazh, nuk do te mund te deshifroje te ardhshem. Çdo mesazh ka braveten e vet.';

  @override
  String get secLayer1Detail =>
      'Per skedaret (foto, video, dokumente), Hash perdor kriptim shtese AES-256-GCM. Skedari kriptohet perpara se te lere telefonin.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimitet rrjeti)';

  @override
  String get secLayer2Desc =>
      'Mesazhieret e zakonshem dergojne mesazhet me identitetin tuaj te bashkangjitur. Eshte si te shkruani emrin ne zarf. Hash perdor kutite postare anonime: serveri dorezoin mesazhin pa ditur kush e dergoi.';

  @override
  String get secLayer2Detail =>
      'Rezultati: edhe ne rastin e nje shkeljeje te dhenash ne server, eshte e pamundur te rikonstruktohet kush flet me ke.';

  @override
  String get secLayer3Title => 'Fshirje automatike';

  @override
  String get secLayer3Desc =>
      'Mesazhet fshihen nga serveri sapo konfirmohet marrja. Edhe nese nje mesazh nuk merret kurre, shkaterohet automatikisht pas 24 oreve.';

  @override
  String get secLayer3Detail =>
      'Ne telefon, mesazhet veteshkaterohen sipas kohezgjatjes qe zgjidhni: menjehere, 5 min, 15 min, 30 min, 1ore, 3ore, 6ore ose 12ore.';

  @override
  String get secLayer4Title => 'Mbrojtja e aksesit lokal';

  @override
  String get secLayer4Desc =>
      'Aplikacioni mbrohet me nje PIN 6-shifror dhe/ose biometri (Face ID, gjurme gishtash). Pas shume perpjekjeve te deshtuar, aplikacioni kyçet me vonese ne rritje.';

  @override
  String get secLayer5Title => 'Baze te dhenash e kyçur';

  @override
  String get secLayer5Desc =>
      'Ne anen e serverit, asnje perdorues nuk mund te shkruaje drejtperdrejt ne bazen e te dhenave. Te gjitha veprimet kalojne permes funksioneve te sigurta.';

  @override
  String get secLayer5Detail =>
      'Eshte si nje sportel banke: nuk e prekni kurre kasaforten vete. Beni nje kerkese dhe sistemi verifikon nese keni te drejte perpara se te veproje.';

  @override
  String get secVashLabel => 'UNIK NE BOTE';

  @override
  String get secVashTitle => 'Modaliteti Vash';

  @override
  String get secVashSubtitle =>
      'Nje sistem sigurie emergjence qe nuk ekziston ne asnje aplikacion tjeter mesazherisie.';

  @override
  String get secVashScenarioTitle => 'Imagjinoni kete situate';

  @override
  String get secVashScenario1 => 'Dikush ka akses ne telefonin tuaj';

  @override
  String get secVashScenario2 => 'Ju kerkohet kodi PIN';

  @override
  String get secVashScenario3 =>
      'Doni te fshini urgjentisht te gjitha te dhenat';

  @override
  String get secVashSolutionTitle => 'Zgjidhja: dy kode PIN';

  @override
  String get secVashSolutionDesc =>
      'Konfiguroni dy kode PIN te ndryshme ne Hash:';

  @override
  String get secVashNormalCodeLabel => 'Kodi normal';

  @override
  String get secVashNormalCodeDesc =>
      'Hap aplikacionin normalisht me te gjitha te dhenat';

  @override
  String get secVashCodeLabel2 => 'Kodi Vash';

  @override
  String get secVashCodeDescription =>
      'Hap aplikacionin normalisht... por te gjitha te dhenat fshihen ne heshtje ne sfond';

  @override
  String get secVashWhatHappensTitle => 'Çfare ndodh pastaj';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikacioni hapet normalisht. Asnje alarm, asnje animacion e dyshimte. Ekrani thjesht tregon nje aplikacion bosh, sikur ta kishit instaluar sapo.\n\nNe realitet, te gjitha bisedat, kontaktet dhe mesazhet tuaja jane fshire ne menyre te pakthyeshme ne nje fraksion sekonde.';

  @override
  String get secCallsLabel => 'THIRRJET DHE SKEDARET';

  @override
  String get secCallsTitle => 'Gjithçka eshte e kriptuar';

  @override
  String get secCallsSubtitle =>
      'Jo vetem mesazhet. Absolutisht gjithçka qe kalon permes Hash eshte e kriptuar nga skaji ne skaj.';

  @override
  String get secAudioCallTitle => 'Thirrjet audio';

  @override
  String get secAudioCallDesc =>
      'Te kriptuara nga skaji ne skaj permes WebRTC. Zeri transmetohet drejtperdrejt midis pajisjeve.';

  @override
  String get secVideoCallTitle => 'Thirrjet video';

  @override
  String get secVideoCallDesc =>
      'E njejta teknologji, çdo rrjedhe e kriptuar individualisht.';

  @override
  String get secPhotosTitle => 'Fotot dhe videot';

  @override
  String get secPhotosDesc =>
      'Te kriptuara me AES-256-GCM perpara se te largohen nga telefoni.';

  @override
  String get secDocsTitle => 'Dokumentet';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, çdo skedar. Emri, madhesia dhe permbajtja e kriptuar.';

  @override
  String get secAnonLabel => 'ANONIMITETI';

  @override
  String get secAnonTitle => 'Asnje identitet i kerkuar';

  @override
  String get secAnonSubtitle =>
      'Hash nuk kerkon kurre numrin tuaj te telefonit ose email. Ju identifikoheni me nje Hash ID unik dhe anonim.';

  @override
  String get secHashIdTitle => 'Hash ID juaj';

  @override
  String get secHashIdDesc =>
      'Ky eshte identifikuesi juaj unik. Nuk zbulon asgje per ju: as emrin, as numrin, as vendndodhjen. Eshte si nje pseudonim i pamundur per t\'u lidhur me identitetin tuaj te vertete.\n\nPer te shtuar nje kontakt, ndani Hash ID ose skanoni nje QR code. Kaq. Asnje liber adresash i sinkronizuar, asnje sugjerim \"Njerez qe mund te njihni\".';

  @override
  String get secDataLabel => 'TE DHENAT';

  @override
  String get secDataTitle => 'Çfare nuk di Hash';

  @override
  String get secDataSubtitle =>
      'Menyra me e mire per te mbrojtur te dhenat tuaja eshte te mos i mbledhim.';

  @override
  String get secNeverCollected => 'Kurre e mbledhur';

  @override
  String get secNeverItem1 => 'Permbajtja e mesazheve';

  @override
  String get secNeverItem2 => 'Lista e kontakteve';

  @override
  String get secNeverItem3 => 'Numri i telefonit';

  @override
  String get secNeverItem4 => 'Adresa e email';

  @override
  String get secNeverItem5 => 'Adresa IP';

  @override
  String get secNeverItem6 => 'Vendndodhja';

  @override
  String get secNeverItem7 => 'Metadatat (kush flet me ke)';

  @override
  String get secNeverItem8 => 'Historiku i thirrjeve';

  @override
  String get secNeverItem9 => 'Libri i adresave';

  @override
  String get secNeverItem10 => 'Identifikuesit e reklamave';

  @override
  String get secTempStored => 'E ruajtur perkohesisht';

  @override
  String get secTempItem1 => 'Hash ID anonim (identifikues unik)';

  @override
  String get secTempItem2 => 'Çelesa publike kriptimi';

  @override
  String get secTempItem3 => 'Mesazhe te kriptuara ne tranzit (maks 24h)';

  @override
  String get secTempNote =>
      'Edhe keto te dhena minimale nuk mund t\'ju identifikojne. Hash ID juaj nuk eshte i lidhur me asnje informacion personal.';

  @override
  String get secFooterTitle => 'Privatesia juaj, liria juaj';

  @override
  String get secFooterDesc =>
      'Hash perdor te njejtat teknologji kriptimi si aplikacionet me profesionale me kerkuese. Mesazhet tuaja mbrohen nga matematika, jo nga premtime.';

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
