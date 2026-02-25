// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Jälgi null. Kompromissi null.';

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
  String get conversations => 'Vestlused';

  @override
  String get contacts => 'Kontaktid';

  @override
  String get noConversation => 'Vestlusi pole';

  @override
  String get noConversationSubtitle =>
      'Lisa kontakt, et alustada turvalist vestlust';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ootel taotlust',
      one: '1 ootel taotlus',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saadetud taotlust ootel',
      one: '1 saadetud taotlus ootel',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Lisa kontakt';

  @override
  String get shareApp => 'Jaga rakendust';

  @override
  String get newMessage => 'Uus sõnum';

  @override
  String get newConversation => 'Saada sõnum';

  @override
  String get settings => 'Seaded';

  @override
  String get myHashId => 'Minu Hash ID';

  @override
  String get supportHash => 'Toeta Hash\'i';

  @override
  String get supportHashSubtitle => 'Hash on mittetulunduslik projekt';

  @override
  String get donate => 'Anneta';

  @override
  String get appearance => 'Välimus';

  @override
  String get theme => 'Teema';

  @override
  String get themeAuto => 'Automaatne';

  @override
  String get themeAutoSubtitle => 'Järgib süsteemi seadeid';

  @override
  String get themeDark => 'Tume';

  @override
  String get themeLight => 'Hele';

  @override
  String get themeRecommendation =>
      'Tume teema on soovitatav parema privaatsuse jaoks';

  @override
  String get language => 'Keel';

  @override
  String get languageAuto => 'Automaatne (süsteem)';

  @override
  String get notifications => 'Teavitused';

  @override
  String get messages => 'Sõnumid';

  @override
  String get calls => 'Kõned';

  @override
  String get vibration => 'Vibratsioon';

  @override
  String get notificationContent => 'Teavituse sisu';

  @override
  String get notificationContentFull => 'Näita kõike';

  @override
  String get notificationContentFullDesc => 'Kontakti nimi ja sõnumi eelvaade';

  @override
  String get notificationContentName => 'Ainult nimi';

  @override
  String get notificationContentNameDesc => 'Näitab ainult kontakti nime';

  @override
  String get notificationContentDiscrete => 'Diskreetne';

  @override
  String get notificationContentDiscreteDesc => 'Näitab ainult \"Uus sõnum\"';

  @override
  String get security => 'Turvalisus';

  @override
  String get howHashProtectsYou => 'Kuidas Hash sind kaitseb';

  @override
  String get howHashProtectsYouSubtitle => 'Mõista oma turvalisust';

  @override
  String get accountSecurity => 'Konto turvalisus';

  @override
  String get accountSecuritySubtitle => 'PIN, biomeetria, Vash režiim';

  @override
  String get blockScreenshots => 'Blokeeri kuvatõmmised';

  @override
  String get transferDevice => 'Kanna üle teisele seadmele';

  @override
  String get transferDeviceSubtitle => 'Migreerige oma konto';

  @override
  String get pinCode => 'PIN-kood';

  @override
  String get changePin => 'Muuda PIN-koodi';

  @override
  String get currentPin => 'Praegune PIN-kood';

  @override
  String get newPin => 'Uus PIN-kood';

  @override
  String get confirmPin => 'Kinnita PIN-kood';

  @override
  String get pinChanged => 'PIN-kood muudetud';

  @override
  String get incorrectPin => 'Vale PIN';

  @override
  String get pinsDoNotMatch => 'PIN-koodid ei kattu';

  @override
  String get autoLock => 'Automaatne lukustus';

  @override
  String get autoLockDelay => 'Lukustuse viivitus';

  @override
  String get autoLockImmediate => 'Kohene';

  @override
  String get autoLockMinute => '1 minut';

  @override
  String autoLockMinutes(int count) {
    return '$count minutit';
  }

  @override
  String get vashCode => 'Vash kood';

  @override
  String get vashModeTitle => 'Vash režiim';

  @override
  String get vashModeExplanation => 'Teie viimane turvavõrk.';

  @override
  String get vashModeDescription =>
      'Valite teise PIN-koodi. Kui teid sunnitakse Hash\'i avama, sisestage see kood tavalise PIN-i asemel.\n\nRakendus avaneb normaalselt, kuid kõik teie vestlused ja kontaktid on kadunud.\n\nIgaüks, kes teie ekraanile vaatab, näeb Hash\'i lihtsalt tühjana — nagu poleks te seda kunagi kasutanud.';

  @override
  String get vashModeIrreversible => 'See toiming on vaikne ja pöördumatu.';

  @override
  String get chooseVashCode => 'Vali Vash kood';

  @override
  String get vashCodeInfo =>
      'Teine PIN-kood, mis avab rakenduse normaalselt, kuid tühjalt.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Kui sisestate selle koodi oma PIN-i asemel:';

  @override
  String get vashDeleteContacts => 'Teie kontaktid kaovad';

  @override
  String get vashDeleteMessages => 'Teie vestlused kaovad';

  @override
  String get vashDeleteHistory => 'Teie märkmed kaovad';

  @override
  String get vashKeepId => 'Teie Hash identiteet (#XXX-XXX-XXX) jääb samaks';

  @override
  String get vashAppearNormal =>
      'Rakendus tundub normaalne, kuid tühi, nagu uus. See toiming on pöördumatu.';

  @override
  String get setupVashCode => 'Seadista Vash kood';

  @override
  String get modifyVashCode => 'Muuda Vash koodi';

  @override
  String get currentVashCode => 'Praegune Vash kood';

  @override
  String get newVashCode => 'Uus Vash kood';

  @override
  String get confirmVashCode => 'Kinnita Vash kood';

  @override
  String get vashCodeConfigured => 'Vash kood seadistatud';

  @override
  String get vashCodeModified => 'Vash kood muudetud';

  @override
  String get vashCodeMustDiffer => 'Vash kood peab erinema PIN-ist';

  @override
  String get incorrectVashCode => 'Vale Vash kood';

  @override
  String get vashWhatToDelete => 'Mida peaks Vash režiim kaduma panema?';

  @override
  String get vashDeleteContactsOption => 'Kontaktid';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Sõnumid';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Märkmed';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash režiim aktiveeritud';

  @override
  String get vashCreateSubtitle => 'Valige kood, mis erineb teie põhi-PIN-ist';

  @override
  String get vashConfirmSubtitle => 'Kinnitage oma Vash kood';

  @override
  String get pinCodeForEntry => 'PIN-kood rakenduse avamiseks';

  @override
  String get vashCodeSection => 'Vash režiim';

  @override
  String get biometric => 'Biomeetria';

  @override
  String get biometricUnlock => 'Ava sõrmejälge või Face ID-ga';

  @override
  String get enableBiometric => 'Luba biomeetria';

  @override
  String get biometricWarningMessage =>
      'Biomeetria lubamisel ei saa te enam Vash koodi rakenduse avamiseks kasutada.\n\nVash koodi saate kasutada ainult siis, kui biomeetria ebaõnnestub (pärast mitut ebaõnnestunud katset).\n\nKas olete kindel, et soovite jätkata?';

  @override
  String get understood => 'Saan aru';

  @override
  String get shareAppSubtitle => 'Jagage Hashi oma lähedastega';

  @override
  String get share => 'Jaga';

  @override
  String get danger => 'Oht';

  @override
  String get deleteAccount => 'Kustuta konto';

  @override
  String get deleteAccountSubtitle => 'Pöördumatu toiming';

  @override
  String get deleteAccountConfirmTitle => 'Kustuta konto';

  @override
  String get deleteAccountConfirmMessage =>
      'Teie konto kustutatakse jäädavalt. See toiming on pöördumatu.\n\n- Kõik teie vestlused\n- Kõik teie kontaktid\n- Teie Hash ID\n\nPeate looma uue konto.';

  @override
  String get deleteForever => 'Kustuta jäädavalt';

  @override
  String get cancel => 'Tühista';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash režiim aktiveeritud.';

  @override
  String deletionError(String error) {
    return 'Kustutamise viga: $error';
  }

  @override
  String get yourSecurity => 'Teie turvalisus';

  @override
  String get securityInfo =>
      '- Täielik krüpteerimine (Signal Protocol)\n- Pärast kohaletoimetamist andmeid meie serverites pole\n- Võtmed salvestatakse ainult teie seadmesse\n- PIN-koodi ei saadeta kunagi serverisse';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Tere tulemast';

  @override
  String get securityStatement1 => 'Teie sõnumid on kaitstud.';

  @override
  String get securityStatement2 => 'Täielik krüpteerimine.';

  @override
  String get securityStatement3 => 'Jälgi null. Kompromissi null.';

  @override
  String get securityStatement4 => 'Teie privaatsus on õigus.';

  @override
  String get accessBlocked => 'Juurdepääs blokeeritud';

  @override
  String get tooManyAttempts => 'Liiga palju katseid';

  @override
  String get pleaseWait => 'Palun oodake';

  @override
  String get waitDelay => 'Palun oodake viivituse lõpuni';

  @override
  String attemptCount(int current, int max) {
    return 'Katse $current/$max';
  }

  @override
  String retryIn(String time) {
    return 'Proovi uuesti $time pärast';
  }

  @override
  String get forgotPin => 'Unustasid PIN-i? Kasuta taastefraasi';

  @override
  String get useRecoveryPhrase => 'Kasuta taastefraasi';

  @override
  String get recoveryWarningTitle => 'Hoiatus';

  @override
  String get recoveryWarningMessage => 'Konto taastamine:';

  @override
  String get recoveryDeleteAllMessages => 'Kustutab KÕIK teie sõnumid';

  @override
  String get recoveryWaitDelay => 'Nõuab 1-tunnist viivitust';

  @override
  String get recoveryKeepContacts => 'Säilitab teie kontaktid';

  @override
  String get recoveryIrreversible =>
      'See toiming on pöördumatu. Teie sõnumid kaovad jäädavalt.';

  @override
  String get iUnderstand => 'Ma mõistan';

  @override
  String get accountRecovery => 'Konto taastamine';

  @override
  String get enterRecoveryPhrase =>
      'Sisestage oma taastefraasi 24 sõna, eraldatuna tühikutega.';

  @override
  String get recoveryPhraseHint => 'sõna1 sõna2 sõna3 ...';

  @override
  String get recover => 'Taasta';

  @override
  String get recoveryPhraseRequired => 'Palun sisestage oma taastefraas';

  @override
  String get recoveryPhrase24Words => 'Fraas peab sisaldama täpselt 24 sõna';

  @override
  String get incorrectRecoveryPhrase => 'Vale taastefraas';

  @override
  String get recoveryInitError => 'Taastamise käivitamise viga';

  @override
  String get securityDelay => 'Turvaviivitus';

  @override
  String get securityDelayMessage =>
      'Teie turvalisuse tagamiseks on enne uue PIN-koodi loomist vajalik ooteaeg.';

  @override
  String get timeRemaining => 'Aega jäänud';

  @override
  String get messagesDeletedForProtection =>
      'Teie sõnumid on teie kaitseks kustutatud.';

  @override
  String get canCloseApp => 'Võite rakenduse sulgeda ja hiljem tagasi tulla.';

  @override
  String get onboardingTitle1 => 'Tere tulemast Hash\'i';

  @override
  String get onboardingSubtitle1 => 'Sõnumitooja, mis ei jäta jälge';

  @override
  String get onboardingTitle2 => 'Täielik krüpteerimine';

  @override
  String get onboardingSubtitle2 =>
      'Teie sõnumid on täielikult krüpteeritud Signal Protocol\'iga';

  @override
  String get onboardingTitle3 => 'Jälgi null';

  @override
  String get onboardingSubtitle3 =>
      'Sõnumid kustutatakse serveritest kohe pärast kohaletoimetamist';

  @override
  String get onboardingTitle4 => 'Teie turvalisus';

  @override
  String get onboardingSubtitle4 => 'PIN-kood, Vash režiim ja taastefraas';

  @override
  String get getStarted => 'Alusta';

  @override
  String get next => 'Järgmine';

  @override
  String get skip => 'Jäta vahele';

  @override
  String get alreadyHaveAccount => 'Mul on juba konto';

  @override
  String get transferMyAccount => 'Kanna minu konto üle';

  @override
  String get createPin => 'Loo PIN-kood';

  @override
  String get createPinSubtitle =>
      'See kood kaitseb juurdepääsu teie rakendusele';

  @override
  String get confirmYourPin => 'Kinnitage oma PIN-kood';

  @override
  String get confirmPinSubtitle => 'Sisestage oma PIN-kood uuesti';

  @override
  String get saveRecoveryPhrase => 'Taastefraas';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Kirjutage need 24 sõna järjestikku üles. Need võimaldavad teil konto taastada, kui unustate oma PIN-i.';

  @override
  String get phraseWritten => 'Olen oma fraasi üles kirjutanud';

  @override
  String get warningRecoveryPhrase =>
      'Kui kaotate selle fraasi ja unustate oma PIN-i, kaotate juurdepääsu oma kontole.';

  @override
  String get accountTransferred => 'Konto üle kantud';

  @override
  String get accountTransferredMessage =>
      'Teie konto on üle kantud teisele seadmele. See seanss ei kehti enam.';

  @override
  String get accountTransferredInfo =>
      'Kui te seda ülekannet ei algatanud, võib teie konto olla ohustatud.';

  @override
  String get logout => 'Logi välja';

  @override
  String get transferAccount => 'Kanna konto üle';

  @override
  String get transferAccountInfo =>
      'Kandke oma Hash konto uuele seadmele üle. Teie praegune seanss tühistatakse.';

  @override
  String get generateTransferCode => 'Loo ülekandekood';

  @override
  String get transferCode => 'Ülekandekood';

  @override
  String transferCodeExpires(int minutes) {
    return 'See kood aegub $minutes minuti pärast';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Sisestage see kood oma uuele seadmele, et konto üle kanda.';

  @override
  String get generateNewCode => 'Loo uus kood';

  @override
  String get scanQrCode => 'Skaneeri QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Skaneerige kontakti QR code, et neid lisada';

  @override
  String get qrCodeDetected => 'QR code tuvastatud';

  @override
  String get invalidQrCode => 'Vigane QR code';

  @override
  String get cameraPermissionRequired => 'Kaamera luba on vajalik';

  @override
  String get myQrCode => 'Minu QR code';

  @override
  String get myQrCodeSubtitle =>
      'Jagage seda QR code\'i, et teie kontaktid saaksid teid lisada';

  @override
  String get shareQrCode => 'Jaga';

  @override
  String get addContactTitle => 'Lisa kontakt';

  @override
  String get addContactByHashId => 'Sisestage oma kontakti Hash ID';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Otsi';

  @override
  String get contactNotFound => 'Kontakti ei leitud';

  @override
  String get contactAlreadyAdded => 'See kontakt on juba teie nimekirjas';

  @override
  String get contactAdded => 'Kontakt lisatud';

  @override
  String get myProfile => 'Minu profiil';

  @override
  String get myProfileSubtitle =>
      'Jagage seda teavet, et teised saaksid teid lisada';

  @override
  String get temporaryCode => 'Ajutine kood';

  @override
  String temporaryCodeExpires(String time) {
    return 'Aegub $time pärast';
  }

  @override
  String get codeExpired => 'Kood aegunud';

  @override
  String get generateNewCodeButton => 'Uus kood';

  @override
  String get copyHashId => 'Kopeeri ID';

  @override
  String get copyCode => 'Kopeeri kood';

  @override
  String get copiedToClipboard => 'Kopeeritud';

  @override
  String get showMyQrCode => 'Näita minu QR code\'i';

  @override
  String get orDivider => 'või';

  @override
  String get openScanner => 'Ava skanner';

  @override
  String get addManually => 'Lisa käsitsi';

  @override
  String get contactHashIdLabel => 'Kontakti Hash ID';

  @override
  String get temporaryCodeLabel => 'Ajutine kood';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Paluge oma kontaktil genereerida kood oma profiilist';

  @override
  String get verifyAndAdd => 'Kontrolli ja lisa';

  @override
  String get fillAllFields => 'Palun täitke kõik väljad';

  @override
  String get invalidHashIdFormat => 'Vigane ID formaat (nt: 123-456-ABC)';

  @override
  String get userNotFound => 'Kasutajat ei leitud';

  @override
  String get cannotAddYourself => 'Te ei saa ennast lisada';

  @override
  String get invalidOrExpiredCode => 'Vigane või aegunud ajutine kood';

  @override
  String get contactFound => 'Kontakt leitud!';

  @override
  String get howToCallContact => 'Kuidas soovite neid kutsuda?';

  @override
  String get contactNameHint => 'Kontakti nimi';

  @override
  String get addContactButton => 'Lisa';

  @override
  String get contactDetails => 'Kontakti andmed';

  @override
  String get contactName => 'Kontakti nimi';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Lisatud $date';
  }

  @override
  String get deleteContact => 'Kustuta kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Kustutada see kontakt?';
  }

  @override
  String get deleteContactMessage => 'See kustutab ka kogu vestluse.';

  @override
  String get delete => 'Kustuta';

  @override
  String get typeMessage => 'Kirjutage sõnum...';

  @override
  String get messageSent => 'Saadetud';

  @override
  String get messageDelivered => 'Kohale toimetatud';

  @override
  String get messageRead => 'Loetud';

  @override
  String get messageFailed => 'Saatmine ebaõnnestus';

  @override
  String get now => 'Praegu';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}t';
  }

  @override
  String daysAgo(int count) {
    return '${count}p';
  }

  @override
  String get today => 'Täna';

  @override
  String get yesterday => 'Eile';

  @override
  String dateAtTime(String date, String time) {
    return '$date kell $time';
  }

  @override
  String get shareMessage =>
      'Liitu minuga Hash\'is! See on tõeliselt privaatne sõnumitooja: täielik krüpteerimine, jälgi serverites pole ja paanikarežiim vajadusel.\n\nLaadi rakendus alla siit\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Viga';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Vaata';

  @override
  String get yes => 'Jah';

  @override
  String get no => 'Ei';

  @override
  String get save => 'Salvesta';

  @override
  String get edit => 'Muuda';

  @override
  String get close => 'Sulge';

  @override
  String get confirm => 'Kinnita';

  @override
  String get loading => 'Laadimine...';

  @override
  String get retry => 'Proovi uuesti';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Ootel taotlused';

  @override
  String get noPendingRequests => 'Ootel taotlusi pole';

  @override
  String get pendingRequestsSubtitle => 'Need inimesed soovivad teid lisada';

  @override
  String requestFromUser(String hashId) {
    return 'Taotlus kasutajalt $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Aegub $days päeva pärast';
  }

  @override
  String get acceptRequest => 'Nõustu';

  @override
  String get rejectRequest => 'Keeldu';

  @override
  String get requestAccepted => 'Taotlus vastu võetud';

  @override
  String get requestRejected => 'Taotlus tagasi lükatud';

  @override
  String get requestSent => 'Taotlus saadetud!';

  @override
  String get requestSentSubtitle =>
      'Teie taotlus on saadetud. Kasutaja peab selle vastu võtma enne vestluse alustamist.';

  @override
  String get requestAlreadyPending => 'Taotlus on juba ootel';

  @override
  String get requestAlreadySentByOther =>
      'See isik on teile juba taotluse saatnud';

  @override
  String get addByHashId => 'Lisa Hash ID kaudu';

  @override
  String get addByHashIdSubtitle =>
      'Sisestage kontakti Hash ID ja ajutine kood';

  @override
  String get enterTemporaryCode => 'Sisestage 6-kohaline kood';

  @override
  String get sendRequest => 'Saada taotlus';

  @override
  String get acceptContactTitle => 'Nõustu kontaktiga';

  @override
  String get acceptContactSubtitle => 'Saate neile kohandatud nime anda';

  @override
  String get leaveEmptyForHashId => 'Jätke tühjaks, et kasutada Hash ID-d';

  @override
  String get firstName => 'Eesnimi';

  @override
  String get lastName => 'Perekonnanimi';

  @override
  String get notes => 'Märkmed';

  @override
  String get notesHint => 'Isiklikud märkmed selle kontakti kohta';

  @override
  String get photoOptional => 'Foto (valikuline)';

  @override
  String get contactNameOptional => 'Nimi (valikuline)';

  @override
  String get notesOptional => 'Märkmed (valikuline)';

  @override
  String get storedLocally => 'Salvestatud ainult teie seadmesse';

  @override
  String get encryptedMessageLabel => 'Krüpteeritud sõnum';

  @override
  String get identityMessageHint => 'Kes te olete? Kuidas te üksteist tunnete?';

  @override
  String get messageWillBeSentEncrypted =>
      'See sõnum krüpteeritakse ja saadetakse saajale';

  @override
  String get sendRequestButton => 'Saada taotlus';

  @override
  String get requestExpiresIn24h =>
      'Taotlus aegub 24 tunni pärast, kui seda vastu ei võeta';

  @override
  String get theyAlreadySentYouRequest =>
      'See isik on teile juba taotluse saatnud';

  @override
  String get requests => 'Taotlused';

  @override
  String get receivedRequests => 'Saadud';

  @override
  String get sentRequests => 'Saadetud';

  @override
  String get noSentRequests => 'Saadetud taotlusi pole';

  @override
  String get cancelRequest => 'Tühista';

  @override
  String get deleteRequest => 'Kustuta taotlus';

  @override
  String get requestCancelled => 'Taotlus tühistatud';

  @override
  String sentTo(String hashId) {
    return 'Saadetud $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Aegub $time pärast';
  }

  @override
  String receivedAgo(String time) {
    return 'Saadud $time tagasi';
  }

  @override
  String get messageFromRequester => 'Sõnum taotlejalt';

  @override
  String get copy => 'Kopeeri';

  @override
  String get messageInfo => 'Sõnumi info';

  @override
  String get messageDirection => 'Suund';

  @override
  String get messageSentByYou => 'Teie saadetud';

  @override
  String get messageReceived => 'Saadud';

  @override
  String get messageSentAt => 'Saadetud';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Olek';

  @override
  String get messageReadAt => 'Loetud';

  @override
  String get messageType => 'Tüüp';

  @override
  String get messageSize => 'Suurus';

  @override
  String get messageExpiresAt => 'Aegub';

  @override
  String get messageEncrypted => 'Täielikult krüpteeritud';

  @override
  String get messageStatusSending => 'Saatmine...';

  @override
  String get messageStatusSent => 'Saadetud';

  @override
  String get messageStatusDelivered => 'Kohale toimetatud';

  @override
  String get messageStatusRead => 'Loetud';

  @override
  String get messageStatusFailed => 'Ebaõnnestunud';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Ootab kohaletoimetamist';

  @override
  String get deletedFromServer => 'Kustutatud';

  @override
  String get messageTypeText => 'Tekst';

  @override
  String get messageTypeImage => 'Pilt';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Hääl';

  @override
  String get messageTypeFile => 'Fail';

  @override
  String get indefinitely => 'Määramata ajaks';

  @override
  String get hoursShort => 't';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'tundi';

  @override
  String get minutes => 'minutit';

  @override
  String get seconds => 'sekundit';

  @override
  String get ephemeralMessages => 'Kaduv sõnum';

  @override
  String get ephemeralMessagesDescription =>
      'Sõnumid kustutatakse automaatselt pärast seda aega';

  @override
  String get ephemeralImmediate => 'Kohene (pärast lugemist)';

  @override
  String get ephemeralImmediateDesc => 'Kustutatakse kohe pärast lugemist';

  @override
  String get ephemeralMyPreference => 'Minu eelistus';

  @override
  String get ephemeralMyPreferenceDesc => 'Kasuta üldist seadet';

  @override
  String get ephemeralDefaultSetting => 'Sõnumi kestus';

  @override
  String get ephemeralChooseDefault => 'Soovitatav';

  @override
  String get ephemeral30Seconds => '30 sekundit';

  @override
  String get ephemeral30SecondsDesc => 'Kustutatud 30s pärast lugemist';

  @override
  String get ephemeral5Minutes => '5 minutit';

  @override
  String get ephemeral5MinutesDesc => 'Kustutatud 5min pärast lugemist';

  @override
  String get ephemeral1Hour => '1 tund';

  @override
  String get ephemeral1HourDesc => 'Kustutatud 1t pärast lugemist';

  @override
  String get ephemeral3Hours => '3 tundi';

  @override
  String get ephemeral6Hours => '6 tundi';

  @override
  String get ephemeral6HoursDesc => 'Kustutatud 6t pärast lugemist';

  @override
  String get ephemeral12Hours => '12 tundi';

  @override
  String get ephemeral24Hours => '24 tundi';

  @override
  String get ephemeral24HoursDesc => 'Kustutatud 24t pärast lugemist';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Kohandatud kestus';

  @override
  String get howItWorks => 'Kuidas see töötab';

  @override
  String get ephemeralExplanation1 =>
      'Sõnumid kustutatakse serverist kohe pärast vastuvõttu.';

  @override
  String get ephemeralExplanation2 =>
      'See seade määrab, millal sõnumid kaovad TEIE telefonist pärast lugemist.';

  @override
  String get ephemeralExplanation3 =>
      'Teie kontaktil on oma seade oma telefoni jaoks.';

  @override
  String get mute1Hour => '1 tund';

  @override
  String get mute8Hours => '8 tundi';

  @override
  String get mute1Day => '1 päev';

  @override
  String get mute1Week => '1 nädal';

  @override
  String get muteAlways => 'Alati';

  @override
  String get muteExplanation => 'Te ei saa selle kontakti teavitusi';

  @override
  String get showCallsInRecents => 'Kuva hiljutistes kõnedes';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hashi kõned kuvatakse telefoni ajaloos';

  @override
  String get feedback => 'Tagasiside';

  @override
  String get muteNotifications => 'Vaigista teavitused';

  @override
  String get muteDescription => 'Te ei saa selle kontakti teavitusi';

  @override
  String mutedUntil(String time) {
    return 'Vaigistatud kuni $time';
  }

  @override
  String get notMuted => 'Teavitused lubatud';

  @override
  String get unmute => 'Lülita tagasi sisse';

  @override
  String get notificationSound => 'Teavituse heli';

  @override
  String get defaultSound => 'Vaikimisi';

  @override
  String get chatSettings => 'Vestluse seaded';

  @override
  String get bubbleColor => 'Mulli värv';

  @override
  String get backgroundColor => 'Taustavärv';

  @override
  String get backgroundImage => 'Taustapilt';

  @override
  String get chatBackground => 'Vestluse taust';

  @override
  String get customColor => 'Kohandatud';

  @override
  String get defaultColor => 'Vaikimisi';

  @override
  String get imageSelected => 'Pilt valitud';

  @override
  String get noImage => 'Pilti pole';

  @override
  String get color => 'Värv';

  @override
  String get image => 'Pilt';

  @override
  String get tapToSelectImage => 'Puudutage pildi valimiseks';

  @override
  String get changeImage => 'Muuda pilti';

  @override
  String get previewMessageReceived => 'Tere!';

  @override
  String get previewMessageSent => 'Hei!';

  @override
  String get messageAction => 'Sõnum';

  @override
  String get callAction => 'Kõne';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Isiklikud märkmed';

  @override
  String get addNotes => 'Lisa märkmeid...';

  @override
  String get noNotes => 'Märkmeid pole';

  @override
  String get messageNotifications => 'Sõnumi teavitused';

  @override
  String get callNotifications => 'Kõne teavitused';

  @override
  String get useGradient => 'Kasuta gradienti';

  @override
  String get gradientStart => 'Algvärv';

  @override
  String get gradientEnd => 'Lõppvärv';

  @override
  String get preview => 'Eelvaade';

  @override
  String get reset => 'Lähtesta';

  @override
  String get securityNumber => 'Turvanumber';

  @override
  String securityNumberDescription(String name) {
    return 'Kontrollige, et turvanumber ühtib $name seadmega';
  }

  @override
  String get verifyEncryption => 'Kontrolli täielikku krüpteerimist';

  @override
  String get tapToCopy => 'Puudutage kopeerimiseks';

  @override
  String get howToVerify => 'Kuidas kontrollida';

  @override
  String get verifyStep1 =>
      'Kohtuge oma kontaktiga isiklikult või helistage neile';

  @override
  String get verifyStep2 => 'Võrrelge turvanumbreid või skaneerige QR code\'e';

  @override
  String get verifyStep3 => 'Kui need ühtivad, on teie vestlus turvaline';

  @override
  String get scanToVerify => 'Skaneeri kontrollimiseks';

  @override
  String get reportSpam => 'Teata rämpspostist';

  @override
  String get reportSpamSubtitle =>
      'Teatage sellest kontaktist kui rämpspostist';

  @override
  String get reportSpamDescription =>
      'See teatab anonüümselt sellest kontaktist. Teie identiteeti ei jagata. Kas olete kindel?';

  @override
  String get report => 'Teata';

  @override
  String get spamReported => 'Rämpspostist teatatud';

  @override
  String get reportError =>
      'Teate saatmine ebaõnnestus. Palun proovige uuesti.';

  @override
  String get reportRateLimited => 'Olete jõudnud tänase teadete piirini.';

  @override
  String get blockContact => 'Blokeeri kontakt';

  @override
  String get blockContactDescription =>
      'See kontakt ei saa enam teile sõnumeid saata ega helistada. Neid ei teavitata.';

  @override
  String get unblockContact => 'Deblokeeri kontakt';

  @override
  String get unblockContactDescription =>
      'See kontakt saab teile uuesti sõnumeid saata ja helistada.';

  @override
  String get contactBlocked => 'Kontakt blokeeritud';

  @override
  String get contactUnblocked => 'Kontakt deblokeeritud';

  @override
  String get contactIsBlocked => 'See kontakt on blokeeritud';

  @override
  String get unblock => 'Deblokeeri';

  @override
  String get deleteContactSubtitle => 'Kustuta see kontakt ja vestlus';

  @override
  String get confirmWithPin => 'Kinnita PIN-iga';

  @override
  String get enterPinToConfirm =>
      'Sisestage oma PIN selle toimingu kinnitamiseks';

  @override
  String get profilePhoto => 'Profilifoto';

  @override
  String get takePhoto => 'Tee foto';

  @override
  String get chooseFromGallery => 'Vali galeriist';

  @override
  String get removePhoto => 'Eemalda foto';

  @override
  String get viewContactHashId => 'Vaata kontakti identifikaatorit';

  @override
  String get hashIdPartiallyMasked =>
      'Osaliselt maskeeritud teie turvalisuse ja kontakti privaatsuse jaoks';

  @override
  String get addFirstContact => 'Lisa esimene kontakt';

  @override
  String get addFirstContactSubtitle =>
      'Jagage oma QR code\'i või skaneerige sõbra oma';

  @override
  String get directory => 'Kataloog';

  @override
  String get noContacts => 'Kontakte pole';

  @override
  String get noContactsSubtitle => 'Lisa kontakt alustamiseks';

  @override
  String get sendMessageAction => 'Saada sõnum';

  @override
  String get audioCall => 'Häälkõne';

  @override
  String get videoCall => 'Videokõne';

  @override
  String get viewProfile => 'Vaata profiili';

  @override
  String get deleteContactDirectory => 'Kustuta kontakt';

  @override
  String get scanShort => 'Skaneeri';

  @override
  String get addShort => 'Lisa';

  @override
  String deleteContactConfirmName(String name) {
    return 'Kas soovite kindlasti $name kustutada?';
  }

  @override
  String get noNotesTitle => 'Märkmeid pole';

  @override
  String get noNotesSubtitle => 'Looge oma esimene märkus';

  @override
  String get newNote => 'Uus märkus';

  @override
  String get editNote => 'Muuda märkust';

  @override
  String get deleteNote => 'Kustuta märkus';

  @override
  String get deleteNoteConfirm =>
      'Kas soovite kindlasti selle märkuse kustutada?';

  @override
  String get noteTitle => 'Pealkiri';

  @override
  String get noteContent => 'Sisu';

  @override
  String get addItem => 'Lisa element';

  @override
  String get pinNote => 'Kinnita';

  @override
  String get unpinNote => 'Eemalda kinnitus';

  @override
  String get noteColor => 'Värv';

  @override
  String get notePassword => 'Parool';

  @override
  String get setPassword => 'Määra parool';

  @override
  String get changePassword => 'Muuda parooli';

  @override
  String get removePassword => 'Eemalda parool';

  @override
  String get enterPassword => 'Sisesta parool';

  @override
  String get confirmPassword => 'Kinnita parool';

  @override
  String get passwordPin => 'PIN-kood';

  @override
  String get passwordText => 'Tekstiparool';

  @override
  String get protectedNote => 'Kaitstud märkus';

  @override
  String get incorrectPassword => 'Vale parool';

  @override
  String get passwordSet => 'Parool määratud';

  @override
  String get passwordRemoved => 'Parool eemaldatud';

  @override
  String get notesBiometric => 'Face ID märkmete jaoks';

  @override
  String get notesBiometricSubtitle =>
      'Nõua biomeetrilist autentimist kaitstud märkmete avamiseks';

  @override
  String get textNote => 'Tekstimärkus';

  @override
  String get checklistNote => 'Kontrollnimekiri';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total ülesannet';
  }

  @override
  String get autoSaved => 'Salvestatud';

  @override
  String get searchNotes => 'Otsi märkmeid';

  @override
  String get legalConsent => 'Õiguslik nõusolek';

  @override
  String get confirmAge13 => 'Kinnitan, et olen vähemalt 13-aastane';

  @override
  String get acceptLegalStart => 'Nõustun ';

  @override
  String get privacyPolicy => 'Privaatsuspoliitikaga';

  @override
  String get termsOfService => 'Kasutustingimustega';

  @override
  String get andThe => ' ja ';

  @override
  String get continueButton => 'Jätka';

  @override
  String get mustAcceptTerms =>
      'Jätkamiseks peate mõlemad tingimused aktsepteerima';

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
  String get support => 'Tugi';

  @override
  String get contactSupport => 'Võtke ühendust toega';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Teata kuritarvitamisest';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Õiguslik';

  @override
  String get legalEntity => 'Juriidiline isik';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Kinnita';

  @override
  String get unpinConversation => 'Eemalda kinnitus';

  @override
  String get hideConversation => 'Eemalda voost';

  @override
  String get deleteConversation => 'Kustuta vestlus';

  @override
  String get deleteConversationConfirm =>
      'Sisestage oma PIN kõikide sõnumite kustutamise kinnitamiseks';

  @override
  String get noConversations => 'Vestlusi pole veel';

  @override
  String get startConversation => 'Alusta';

  @override
  String get microphonePermissionRequired => 'Mikrofoni juurdepääs vajalik';

  @override
  String get microphonePermissionExplanation =>
      'Hash vajab mikrofoni kõnede tegemiseks.';

  @override
  String get cameraPermissionExplanation =>
      'Hash vajab kaamerat videokõnede jaoks.';

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
  String get openSettings => 'Ava seaded';

  @override
  String get callConnecting => 'Ühendumine...';

  @override
  String get callRinging => 'Heliseb...';

  @override
  String get callReconnecting => 'Taasühendumine...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Taasühendumine (${seconds}s)';
  }

  @override
  String get callPaused => 'Peatatud';

  @override
  String get callPausedSubtitle => 'Kõne on endiselt aktiivne';

  @override
  String get callRemoteMicMuted => 'Kontakti mikrofon on vaigistatud';

  @override
  String get callMiniControlsMute => 'Vaigista';

  @override
  String get callMiniControlsUnmute => 'Lülita sisse';

  @override
  String get callMiniControlsHangUp => 'Lõpeta kõne';

  @override
  String get callMiniControlsReturn => 'Naase kõnesse';

  @override
  String get callNetworkPoor => 'Ebastabiilne ühendus';

  @override
  String get callNetworkLost => 'Ühendus kadunud';

  @override
  String get callEndedTitle => 'Kõne lõppenud';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Seadme andmed';

  @override
  String get deviceDataSubtitle => 'Kohalik ja serveri salvestusruum';

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
  String get localStorage => 'Kohalik salvestusruum';

  @override
  String get onThisDevice => 'selles seadmes';

  @override
  String get encryptedDatabases => 'Krüpteeritud andmebaasid';

  @override
  String get files => 'Failid';

  @override
  String get secureKeychain => 'Turvaline võtmehoidja';

  @override
  String get cache => 'Vahemälu';

  @override
  String get contactsDetail => 'Nimed, avatareid, Signal võtmed';

  @override
  String get messagesDetail => 'Krüpteeritud vestlused';

  @override
  String get notesDetail => 'Isiklikud märkmed';

  @override
  String get signalSessions => 'Signal seansid';

  @override
  String get signalSessionsDetail => 'Krüpteerimise seansid';

  @override
  String get pendingContacts => 'Ootel kontaktid';

  @override
  String get pendingContactsDetail => 'Ootel taotlused';

  @override
  String get callHistory => 'Kõned';

  @override
  String get callHistoryDetail => 'Kõnede ajalugu';

  @override
  String get preferences => 'Eelistused';

  @override
  String get preferencesDetail => 'Meedia ja kõnede eelistused';

  @override
  String get avatars => 'Avatareid';

  @override
  String get media => 'Meedia';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count faili',
      one: '1 fail',
      zero: 'faile pole',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktiivne';

  @override
  String get notDefined => 'Pole määratud';

  @override
  String get biometrics => 'Biomeetria';

  @override
  String get recoveryPhrase => 'Taastefraas';

  @override
  String get identity => 'Identiteet (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol võtmed';

  @override
  String get authTokens => 'Autentimise tokenid';

  @override
  String get contactNamesCache => 'Kontaktinimede vahemälu';

  @override
  String get remoteConfig => 'Kaugkonfiguratsioon';

  @override
  String get notificationPrefs => 'Teavituste eelistused';

  @override
  String get serverData => 'Serveri andmed';

  @override
  String get serverDataInfo =>
      'Hash hoiab serveris minimaalselt andmeid, kõik krüpteeritud või ajutised.';

  @override
  String get serverProfile => 'Profiil';

  @override
  String get serverProfileDetail => 'Hash ID, avalikud võtmed, postkasti token';

  @override
  String get serverPrekeys => 'Eelvõtmed';

  @override
  String get serverPrekeysDetail => 'Ühekordsed Signal võtmed (tarbitud)';

  @override
  String get serverMessages => 'Sõnumid teel';

  @override
  String get serverMessagesDetail =>
      'Kustutatakse pärast kohaletoimetamist (max 24t)';

  @override
  String get serverMedia => 'Meedia teel';

  @override
  String get serverMediaDetail => 'Kustutatakse pärast allalaadimist';

  @override
  String get serverContactRequests => 'Kontaktitaotlused';

  @override
  String get serverContactRequestsDetail => 'Aeguvad 24 tunni pärast';

  @override
  String get serverRateLimits => 'Kiiruspiirangud';

  @override
  String get serverRateLimitsDetail => 'Ajutised kuritarvitamisvastased andmed';

  @override
  String get privacyReassurance =>
      'Hash ei saa teie sõnumeid lugeda. Kõik andmed on täielikult krüpteeritud. Serveri andmed kustutatakse automaatselt.';

  @override
  String get pinTooSimple => 'See PIN on liiga lihtne. Valige turvalisem kood.';

  @override
  String get genericError => 'Ilmnes viga. Palun proovige uuesti.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Konto loomine ebaõnnestus: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraas kopeeritud lõikelauale';

  @override
  String get copyPhrase => 'Kopeeri fraas';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Kirjutage see fraas turvalisse kohta üles. Kui kaotate oma PIN-i ilma selle fraasita, kaotate jäädavalt juurdepääsu oma andmetele.';

  @override
  String get noMessages => 'Sõnumeid pole';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Kustutada kõik sõnumid $name-ga?';
  }

  @override
  String get confirmation => 'Kinnitus';

  @override
  String get untitled => 'Pealkirjata';

  @override
  String get noSessions => 'Seansse pole';

  @override
  String get unknownContact => 'Tundmatu kontakt';

  @override
  String get unnamed => 'Nimetu';

  @override
  String get noPendingRequestsAlt => 'Ootel taotlusi pole';

  @override
  String get deleteAllCallHistory => 'Kustutada kogu kõnede ajalugu?';

  @override
  String get noCalls => 'Kõnesid pole';

  @override
  String get noPreferences => 'Eelistusi pole';

  @override
  String get resetAllMediaPrefs => 'Lähtestada kõik meedia eelistused?';

  @override
  String get deleteThisAvatar => 'Kustutada see avatar?';

  @override
  String get deleteAllAvatars => 'Kustutada kõik avatarid?';

  @override
  String get noAvatars => 'Avatare pole';

  @override
  String get deleteThisFile => 'Kustutada see fail?';

  @override
  String get deleteAllMediaFiles => 'Kustutada kogu meedia?';

  @override
  String get noMediaFiles => 'Meediat pole';

  @override
  String get outgoing => 'Väljaminev';

  @override
  String get incoming => 'Sissetulev';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Kaduv vaade: ${seconds}s';
  }

  @override
  String get normalView => 'Tavaline vaade';

  @override
  String get callReasonCompleted => 'Lõppenud';

  @override
  String get callReasonMissed => 'Vastamata';

  @override
  String get callReasonDeclined => 'Keeldutud';

  @override
  String get callReasonFailed => 'Ebaõnnestunud';

  @override
  String get justNow => 'Just praegu';

  @override
  String timeAgoMinutes(int count) {
    return '$count min tagasi';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}t tagasi';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}p tagasi';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Asukoht';

  @override
  String get statusQueued => 'Järjekorras';

  @override
  String get blockedBadge => 'Blokeeritud';

  @override
  String get protectedBadge => 'Kaitstud';

  @override
  String messageCount(int count) {
    return '$count sõnum(it)';
  }

  @override
  String get deleteQuestion => 'Kustutada?';

  @override
  String get transferMyAccountTitle => 'Kanna minu konto üle';

  @override
  String get loadingError => 'Laadimise viga';

  @override
  String get transferToNewDevice => 'Kanna üle uuele seadmele';

  @override
  String get transferInstructions =>
      'Valige oma uuel seadmel \"Taasta minu konto\" ja sisestage see teave:';

  @override
  String get yourHashIdLabel => 'Teie Hash ID';

  @override
  String get enterYourPinCode => 'Sisestage oma PIN-kood';

  @override
  String get pinOwnerConfirmation => 'Konto omaniku kinnitamiseks';

  @override
  String get scanThisQrCode => 'Skaneerige see QR code';

  @override
  String get withYourNewDevice => 'Oma uue seadmega';

  @override
  String get orEnterTheCode => 'või sisestage kood';

  @override
  String get transferCodeLabel => 'Ülekandekood';

  @override
  String get proximityVerification => 'Läheduse kontroll';

  @override
  String get bringDevicesCloser => 'Tooge mõlemad seadmed lähemale';

  @override
  String get confirmTransferQuestion => 'Kinnitada ülekanne?';

  @override
  String get accountWillBeTransferred =>
      'Teie konto kantakse üle uuele seadmele.\n\nSee seade ühendatakse jäädavalt lahti.';

  @override
  String get transferComplete => 'Ülekanne lõppenud';

  @override
  String get transferSuccessMessage =>
      'Teie konto on edukalt üle kantud.\n\nRakendus sulgub nüüd.';

  @override
  String get manualVerification => 'Käsitsi kontroll';

  @override
  String get codeDisplayedOnBothDevices => 'Mõlemal seadmel kuvatav kood:';

  @override
  String get doesCodeMatchNewDevice =>
      'Kas see kood ühtib uuel seadmel olevaga?';

  @override
  String get verifiedStatus => 'Kontrollitud';

  @override
  String get inProgressStatus => 'Pooleli...';

  @override
  String get notAvailableStatus => 'Pole saadaval';

  @override
  String get codeExpiredRestart => 'Kood on aegunud. Palun alustage uuesti.';

  @override
  String get codesDoNotMatchCancelled => 'Koodid ei ühti. Ülekanne tühistatud.';

  @override
  String transferToDevice(String device) {
    return 'Kuhu: $device';
  }

  @override
  String get copiedExclamation => 'Kopeeritud!';

  @override
  String expiresInTime(String time) {
    return 'Aegub $time pärast';
  }

  @override
  String get biometricNotAvailable => 'Biomeetria pole selles seadmes saadaval';

  @override
  String get biometricAuthError => 'Viga biomeetrilise autentimise ajal';

  @override
  String get authenticateForBiometric =>
      'Palun autentimine biomeetria lubamiseks';

  @override
  String get biometricAuthFailed => 'Biomeetriline autentimine ebaõnnestus';

  @override
  String get forceUpdateTitle => 'Uuendus vajalik';

  @override
  String get forceUpdateMessage =>
      'Hash\'i uus versioon on saadaval. Palun uuendage jätkamiseks.';

  @override
  String get updateButton => 'Uuenda';

  @override
  String get maintenanceInProgress => 'Hooldus käimas';

  @override
  String get tryAgainLater => 'Palun proovige hiljem uuesti';

  @override
  String get information => 'Teave';

  @override
  String get later => 'Hiljem';

  @override
  String get doYouLikeHash => 'Kas teile meeldib Hash?';

  @override
  String get yourFeedbackHelps =>
      'Teie tagasiside aitab meil rakendust paremaks teha';

  @override
  String get ratingTerrible => 'Kohutav';

  @override
  String get ratingBad => 'Halb';

  @override
  String get ratingOk => 'Okei';

  @override
  String get ratingGood => 'Hea';

  @override
  String get ratingExcellent => 'Suurepärane!';

  @override
  String get donationMessage =>
      'Hash on mittetulunduslik projekt. Teie toetus aitab meil jätkata tõeliselt privaatse sõnumitooja ehitamist.';

  @override
  String get recentConnections => 'Hiljutised ühendused';

  @override
  String get loginInfoText =>
      'Iga PIN-i avamine salvestatakse kohalikult. Ainult viimased 24 tundi säilitatakse.';

  @override
  String get connectionCount => 'Ühendus(ed)';

  @override
  String get periodLabel => 'Periood';

  @override
  String get historyLabel => 'Ajalugu';

  @override
  String get noLoginRecorded => 'Sisselogimist pole registreeritud';

  @override
  String get nextUnlocksAppearHere => 'Järgmised avamised ilmuvad siia.';

  @override
  String get dataLocalOnly =>
      'Need andmed salvestatakse ainult teie seadmesse ega edastata kunagi.';

  @override
  String get currentSession => 'Praegune';

  @override
  String get todayLabel => 'Täna';

  @override
  String get yesterdayLabel => 'Eile';

  @override
  String get justNowLabel => 'Just praegu';

  @override
  String minutesAgoLabel(int count) {
    return '$count min tagasi';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}t tagasi';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}t ${minutes}min tagasi';
  }

  @override
  String get noMaintenancePlanned => 'Hooldust pole planeeritud';

  @override
  String get everythingWorkingNormally => 'Kõik töötab normaalselt';

  @override
  String get maintenanceTitle => 'Hooldus';

  @override
  String get maintenanceActiveLabel => 'KÄIMAS';

  @override
  String get maintenancePlannedLabel => 'PLANEERITUD';

  @override
  String get locking => 'Lukustamine...';

  @override
  String get newMessageNotification => 'Uus sõnum';

  @override
  String get secExplainTitle => 'Kuidas Hash sind kaitseb';

  @override
  String get secExplainIntro =>
      'Hash on loodud nii, et keegi ei saaks teie sõnumeid lugeda.';

  @override
  String get secExplainIntroSub =>
      'Isegi mitte meie.\nSiin on, kuidas see töötab, lihtsalt selgitatud.';

  @override
  String get secJourneyLabel => 'TEEKOND';

  @override
  String get secJourneyTitle => 'Teie sõnumi teekond';

  @override
  String get secJourneySubtitle =>
      'Teie sõrmest kontakti ekraanini on iga samm kaitstud. Järgige teekonda.';

  @override
  String get secStep1Title => 'Kirjutate oma sõnumi';

  @override
  String get secStep1Desc =>
      'Trükite rakenduses \"Tere!\". Sel hetkel eksisteerib sõnum ainult teie telefoni mälus. Midagi pole saadetud.';

  @override
  String get secStep2Title => 'Krüpteerimine Signal Protocol\'iga';

  @override
  String get secStep2Desc =>
      'Kohe kui vajutate \"Saada\", muudetakse teie sõnum arusaamatuks tähemärkide jadaks. See on nagu teie sõnum lukustatakse seifi, millele ainult teie kontaktil on võti.';

  @override
  String get secStep3Title => 'Sealed Sender: nähtamatu ümbrik';

  @override
  String get secStep3Desc =>
      'Kujutage ette, et saadate kirja ilma tagastusaadressita ümbrikul. Täpselt seda Hash teeb. Sõnum pannakse anonüümsesse postkasti. Server ei tea, kes selle saatis.';

  @override
  String get secStep4Title => 'Server ei näe midagi';

  @override
  String get secStep4Desc =>
      'Server toimib pimeda postiljonina. Ta teab ainult, et \"keegi pani midagi postkasti #A7X9\". Ta ei tea, kes selle saatis, mis see on ega kellele see on.';

  @override
  String get secStep4Highlight =>
      'Metaandmeid ei salvestata: IP-aadressi pole, ajatemplit pole, saatja ja saaja vahel seost pole.';

  @override
  String get secStep5Title => 'Teie kontakt saab sõnumi';

  @override
  String get secStep5Desc =>
      'Teie kontakti telefon hangib sisu anonüümsest postkastist ja dekrüpteerib sõnumi oma privaatvõtmega, mis pole kunagi seadmest lahkunud. \"Tere!\" ilmub ekraanile.';

  @override
  String get secStep6Title => 'Sõnum kaob serverist';

  @override
  String get secStep6Desc =>
      'Kohe kui kontakt kinnitab kättesaamist, kustutab server sõnumi jäädavalt. Prügikasti pole, arhiivi pole, varukoopiat pole. Isegi lugemata sõnumid hävitatakse automaatselt 24 tunni pärast.';

  @override
  String get secStep7Title => 'Kohalik aegumine';

  @override
  String get secStep7Desc =>
      'Teie kontakti telefonis hävitab sõnum ennast ise vastavalt teie valitud kestusele: kohe pärast lugemist, 5 minutit, 1 tund... teie otsustate.';

  @override
  String get secJourneyConclusion =>
      'Tulemus: null jälge serveris, null jälge seadmetes. Sõnum eksisteeris ainult nii kaua, kui seda loeti, seejärel kadus.';

  @override
  String get secArchLabel => 'ARHITEKTUUR';

  @override
  String get secArchTitle => '5 kaitsekihti';

  @override
  String get secArchSubtitle =>
      'Hash ei tugine ühele tehnoloogiale. Iga kiht tugevdab teisi. Isegi kui üks kiht on ohustatud, jäävad teie andmed turvaliseks.';

  @override
  String get secLayer1Title => 'Täielik krüpteerimine';

  @override
  String get secLayer1Desc =>
      'Iga sõnum krüpteeritakse unikaalse võtmega. Lihtsamalt: isegi kui keegi dekrüpteerib ühe sõnumi, ei suuda ta järgmist dekrüpteerida. Igal sõnumil on oma lukk.';

  @override
  String get secLayer1Detail =>
      'Failide (fotod, videod, dokumendid) jaoks kasutab Hash täiendavat AES-256-GCM krüpteerimist. Fail krüpteeritakse enne teie telefonist lahkumist.';

  @override
  String get secLayer2Title => 'Sealed Sender (võrgu anonüümsus)';

  @override
  String get secLayer2Desc =>
      'Tavalised sõnumitoojad saadavad teie sõnumid koos teie identiteediga. See on nagu kirjutaksite oma nime ümbrikule. Hash kasutab anonüümseid postkaste: server edastab sõnumi teadmata, kes selle saatis.';

  @override
  String get secLayer2Detail =>
      'Tulemus: isegi serveri andmelekke korral on võimatu rekonstrueerida, kes kellega räägib.';

  @override
  String get secLayer3Title => 'Automaatne kustutamine';

  @override
  String get secLayer3Desc =>
      'Sõnumid kustutatakse serverist kohe pärast kättesaamise kinnitamist. Isegi kui sõnumit kunagi ei hangita, hävitatakse see automaatselt 24 tunni pärast.';

  @override
  String get secLayer3Detail =>
      'Teie telefonis hävitavad sõnumid ennast vastavalt teie valitud kestusele: kohe, 5 min, 15 min, 30 min, 1t, 3t, 6t või 12t.';

  @override
  String get secLayer4Title => 'Kohaliku juurdepääsu kaitse';

  @override
  String get secLayer4Desc =>
      'Rakendust kaitseb 6-kohaline PIN ja/või biomeetria (Face ID, sõrmejälg). Pärast liiga paljusid ebaõnnestunud katseid lukustub rakendus iga ebaõnnestumise järel pikeneva viivitusega.';

  @override
  String get secLayer5Title => 'Lukustatud andmebaas';

  @override
  String get secLayer5Desc =>
      'Serveri poolel ei saa ükski kasutaja otse andmebaasi kirjutada. Kõik toimingud läbivad turvalisi funktsioone, mis kontrollivad iga taotlust.';

  @override
  String get secLayer5Detail =>
      'See on nagu pangalett: te ei puutu kunagi ise hoidlat. Esitate taotluse ja süsteem kontrollib, et teil on õigus enne tegutsemist.';

  @override
  String get secVashLabel => 'AINULAADNE MAAILMAS';

  @override
  String get secVashTitle => 'Vash režiim';

  @override
  String get secVashSubtitle =>
      'Hädaolukorra turvasüsteem, mida ei eksisteeri üheski teises sõnumirakenduses.';

  @override
  String get secVashScenarioTitle => 'Kujutage ette seda olukorda';

  @override
  String get secVashScenario1 => 'Keegi pääseb teie telefonile ligi';

  @override
  String get secVashScenario2 => 'Teilt küsitakse teie PIN-koodi';

  @override
  String get secVashScenario3 => 'Soovite kiiresti kõik andmed kustutada';

  @override
  String get secVashSolutionTitle => 'Lahendus: kaks PIN-koodi';

  @override
  String get secVashSolutionDesc =>
      'Seadistate Hash\'is kaks erinevat PIN-koodi:';

  @override
  String get secVashNormalCodeLabel => 'Tavaline kood';

  @override
  String get secVashNormalCodeDesc =>
      'Avab rakenduse normaalselt kõigi teie andmetega';

  @override
  String get secVashCodeLabel2 => 'Vash kood';

  @override
  String get secVashCodeDescription =>
      'Avab rakenduse normaalselt... kuid kõik teie andmed kustutatakse vaikselt taustal';

  @override
  String get secVashWhatHappensTitle => 'Mis juhtub edasi';

  @override
  String get secVashWhatHappensDesc =>
      'Rakendus avaneb normaalselt. Hoiatust pole, kahtlast animatsiooni pole. Ekraan näitab lihtsalt tühja rakendust, nagu oleksite selle just installinud.\n\nTegelikult on kõik teie vestlused, kontaktid ja sõnumid pöördumatult kustutatud murdosa sekundi jooksul.';

  @override
  String get secCallsLabel => 'KÕNED JA FAILID';

  @override
  String get secCallsTitle => 'Kõik on krüpteeritud';

  @override
  String get secCallsSubtitle =>
      'Mitte ainult sõnumid. Absoluutselt kõik, mis Hash\'i kaudu liigub, on täielikult krüpteeritud.';

  @override
  String get secAudioCallTitle => 'Häälkõned';

  @override
  String get secAudioCallDesc =>
      'Täielikult krüpteeritud WebRTC kaudu. Hääl edastatakse otse seadmete vahel.';

  @override
  String get secVideoCallTitle => 'Videokõned';

  @override
  String get secVideoCallDesc =>
      'Sama tehnoloogia, iga voog eraldi krüpteeritud.';

  @override
  String get secPhotosTitle => 'Fotod ja videod';

  @override
  String get secPhotosDesc =>
      'AES-256-GCM-ga krüpteeritud enne teie telefonist lahkumist.';

  @override
  String get secDocsTitle => 'Dokumendid';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, mis tahes fail. Nimi, suurus ja sisu krüpteeritud.';

  @override
  String get secAnonLabel => 'ANONÜÜMSUS';

  @override
  String get secAnonTitle => 'Identiteeti pole vaja';

  @override
  String get secAnonSubtitle =>
      'Hash ei küsi kunagi teie telefoninumbrit ega e-posti aadressi. Teid identifitseerib unikaalne ja anonüümne Hash ID.';

  @override
  String get secHashIdTitle => 'Teie Hash ID';

  @override
  String get secHashIdDesc =>
      'See on teie unikaalne identifikaator. See ei paljasta teist midagi: mitte teie nime, mitte teie numbrit, mitte teie asukohta. See on nagu pseudonüüm, mida on võimatu teie reaalse identiteediga siduda.\n\nKontakti lisamiseks jagate oma Hash ID-d või skaneerite QR code\'i. See on kõik. Sünkroniseeritud aadressiraamatut pole, \"Inimesed, keda võite tunda\" soovitusi pole.';

  @override
  String get secDataLabel => 'ANDMED';

  @override
  String get secDataTitle => 'Mida Hash ei tea';

  @override
  String get secDataSubtitle =>
      'Parim viis oma andmeid kaitsta on neid mitte koguda.';

  @override
  String get secNeverCollected => 'Kunagi ei koguta';

  @override
  String get secNeverItem1 => 'Sõnumite sisu';

  @override
  String get secNeverItem2 => 'Kontaktide nimekiri';

  @override
  String get secNeverItem3 => 'Telefoninumber';

  @override
  String get secNeverItem4 => 'E-posti aadress';

  @override
  String get secNeverItem5 => 'IP-aadress';

  @override
  String get secNeverItem6 => 'Asukoht';

  @override
  String get secNeverItem7 => 'Metaandmed (kes kellega räägib)';

  @override
  String get secNeverItem8 => 'Kõnede ajalugu';

  @override
  String get secNeverItem9 => 'Aadressiraamat';

  @override
  String get secNeverItem10 => 'Reklaamiidentifikaatorid';

  @override
  String get secTempStored => 'Ajutiselt salvestatud';

  @override
  String get secTempItem1 => 'Anonüümne Hash ID (unikaalne identifikaator)';

  @override
  String get secTempItem2 => 'Avalikud krüpteerimisvõtmed';

  @override
  String get secTempItem3 => 'Krüpteeritud sõnumid teel (max 24t)';

  @override
  String get secTempNote =>
      'Isegi need minimaalsed andmed ei suuda teid identifitseerida. Teie Hash ID pole seotud ühegi isikuandmega.';

  @override
  String get secFooterTitle => 'Teie privaatsus, teie vabadus';

  @override
  String get secFooterDesc =>
      'Hash kasutab samu krüpteerimistehnoloogiaid, mis kõige nõudlikumad professionaalsed rakendused. Teie sõnumid on kaitstud matemaatikaga, mitte lubadustega.';

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
