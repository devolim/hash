// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero Trace. Zero Compromise.';

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
  String get conversations => 'Chaty';

  @override
  String get contacts => 'Kontakty';

  @override
  String get noConversation => 'Zadne chaty';

  @override
  String get noConversationSubtitle =>
      'Pridejte kontakt a zacnete bezpecne komunikovat';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prijatych zadosti',
      one: '1 prijata zadost',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odeslanych zadosti ceka',
      one: '1 odeslana zadost ceka',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Pridat kontakt';

  @override
  String get shareApp => 'Sdilet aplikaci';

  @override
  String get newMessage => 'Nova zprava';

  @override
  String get newConversation => 'Odeslat zpravu';

  @override
  String get settings => 'Nastaveni';

  @override
  String get myHashId => 'Moje Hash ID';

  @override
  String get supportHash => 'Podporit Hash';

  @override
  String get supportHashSubtitle => 'Hash je neziskovy projekt';

  @override
  String get donate => 'Prispet';

  @override
  String get appearance => 'Vzhled';

  @override
  String get theme => 'Motiv';

  @override
  String get themeAuto => 'Automaticky';

  @override
  String get themeAutoSubtitle => 'Podle nastaveni systemu';

  @override
  String get themeDark => 'Tmavy';

  @override
  String get themeLight => 'Svetly';

  @override
  String get themeRecommendation =>
      'Pro lepsi soukromi se doporucuje tmavy motiv';

  @override
  String get language => 'Jazyk';

  @override
  String get languageAuto => 'Automaticky (system)';

  @override
  String get notifications => 'Oznameni';

  @override
  String get messages => 'Zpravy';

  @override
  String get calls => 'Hovory';

  @override
  String get vibration => 'Vibrace';

  @override
  String get notificationContent => 'Obsah oznameni';

  @override
  String get notificationContentFull => 'Zobrazit vse';

  @override
  String get notificationContentFullDesc => 'Jmeno kontaktu a nahled zpravy';

  @override
  String get notificationContentName => 'Pouze jmeno';

  @override
  String get notificationContentNameDesc => 'Zobrazi pouze jmeno kontaktu';

  @override
  String get notificationContentDiscrete => 'Diskretni';

  @override
  String get notificationContentDiscreteDesc => 'Zobrazi pouze \"Nova zprava\"';

  @override
  String get security => 'Zabezpeceni';

  @override
  String get howHashProtectsYou => 'Jak te Hash chrani';

  @override
  String get howHashProtectsYouSubtitle => 'Pochop sve zabezpeceni';

  @override
  String get accountSecurity => 'Zabezpeceni uctu';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrie, Rezim Vash';

  @override
  String get blockScreenshots => 'Blokovat snimky obrazovky';

  @override
  String get transferDevice => 'Prevest na jiny pristroj';

  @override
  String get transferDeviceSubtitle => 'Migrace vaseho uctu';

  @override
  String get pinCode => 'PIN kod';

  @override
  String get changePin => 'Zmenit PIN kod';

  @override
  String get currentPin => 'Soucasny PIN kod';

  @override
  String get newPin => 'Novy PIN kod';

  @override
  String get confirmPin => 'Potvrdit PIN kod';

  @override
  String get pinChanged => 'PIN kod zmenen';

  @override
  String get incorrectPin => 'Nespravny PIN';

  @override
  String get pinsDoNotMatch => 'Kody PIN se neshoduji';

  @override
  String get autoLock => 'Automaticke zamknuti';

  @override
  String get autoLockDelay => 'Prodleva zamknuti';

  @override
  String get autoLockImmediate => 'Okamzite';

  @override
  String get autoLockMinute => '1 minuta';

  @override
  String autoLockMinutes(int count) {
    return '$count minut';
  }

  @override
  String get vashCode => 'Kod Vash';

  @override
  String get vashModeTitle => 'Rezim Vash';

  @override
  String get vashModeExplanation => 'Vase posledni zachranna sit.';

  @override
  String get vashModeDescription =>
      'Zvolite si druhy PIN kod. Pokud budete nekdy nuceni otevrit Hash, zadejte tento kod misto sveho bezneho PINu.\n\nAplikace se otevre normalne, ale vsechny vase konverzace a kontakty budou pryc.\n\nPro kohokoliv, kdo se diva na vasi obrazovku, Hash jednodusse vypada prazdny — jako byste ho nikdy nepouzivali.';

  @override
  String get vashModeIrreversible => 'Tato akce je ticha a nevratna.';

  @override
  String get chooseVashCode => 'Zvolit muj kod Vash';

  @override
  String get vashCodeInfo =>
      'Druhy PIN kod, ktery otevre aplikaci normalne, ale prazdnou.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Pokud zadate tento kod misto sveho PINu:';

  @override
  String get vashDeleteContacts => 'Vase kontakty zmizi';

  @override
  String get vashDeleteMessages => 'Vase konverzace zmizi';

  @override
  String get vashDeleteHistory => 'Vase poznamky zmizi';

  @override
  String get vashKeepId => 'Vase Hash identita (#XXX-XXX-XXX) zustane stejna';

  @override
  String get vashAppearNormal =>
      'Aplikace vypada normalne, ale prazdne, jako nova. Tato akce je nevratna.';

  @override
  String get setupVashCode => 'Nastavit kod Vash';

  @override
  String get modifyVashCode => 'Upravit kod Vash';

  @override
  String get currentVashCode => 'Soucasny kod Vash';

  @override
  String get newVashCode => 'Novy kod Vash';

  @override
  String get confirmVashCode => 'Potvrdit kod Vash';

  @override
  String get vashCodeConfigured => 'Kod Vash nastaven';

  @override
  String get vashCodeModified => 'Kod Vash upraven';

  @override
  String get vashCodeMustDiffer => 'Kod Vash musi byt jiny nez PIN';

  @override
  String get incorrectVashCode => 'Nespravny kod Vash';

  @override
  String get vashWhatToDelete => 'Co ma Rezim Vash nechat zmizet?';

  @override
  String get vashDeleteContactsOption => 'Kontakty';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Zpravy';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Poznamky';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Rezim Vash aktivovan';

  @override
  String get vashCreateSubtitle => 'Zvolte kod odlisny od hlavniho PINu';

  @override
  String get vashConfirmSubtitle => 'Potvrdte svuj kod Vash';

  @override
  String get pinCodeForEntry => 'PIN kod pro vstup do aplikace';

  @override
  String get vashCodeSection => 'Rezim Vash';

  @override
  String get biometric => 'Biometrie';

  @override
  String get biometricUnlock => 'Odemknout otiskem prstu nebo Face ID';

  @override
  String get enableBiometric => 'Zapnout biometrii';

  @override
  String get biometricWarningMessage =>
      'Aktivaci biometrie nebudete moci pouzit svuj kod Vash pro vstup do aplikace.\n\nKod Vash budete moci pouzit pouze v pripade selhani biometrie (po nekolika neuspesnych pokusech).\n\nChcete pokracovat?';

  @override
  String get understood => 'Rozumim';

  @override
  String get shareAppSubtitle => 'Sdilej Hash se svymi blizkymi';

  @override
  String get share => 'Sdilet';

  @override
  String get danger => 'Nebezpeci';

  @override
  String get deleteAccount => 'Smazat muj ucet';

  @override
  String get deleteAccountSubtitle => 'Nevratna akce';

  @override
  String get deleteAccountConfirmTitle => 'Smazat muj ucet';

  @override
  String get deleteAccountConfirmMessage =>
      'Vas ucet bude trvale smazan. Tato akce je nevratna.\n\n• Vsechny vase chaty\n• Vsechny vase kontakty\n• Vase Hash ID\n\nBudete si muset vytvorit novy ucet.';

  @override
  String get deleteForever => 'Smazat trvale';

  @override
  String get cancel => 'Zrusit';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Rezim Vash aktivovan.';

  @override
  String deletionError(String error) {
    return 'Chyba pri mazani: $error';
  }

  @override
  String get yourSecurity => 'Vase zabezpeceni';

  @override
  String get securityInfo =>
      '• Sifrovani end-to-end (Signal Protocol)\n• Zadna data na nasich serverech po doruceni\n• Klice ulozeny pouze na vasem zarizeni\n• PIN kod nikdy neni odeslan na server';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Vitejte';

  @override
  String get securityStatement1 => 'Vase zpravy jsou chraneny.';

  @override
  String get securityStatement2 => 'Sifrovani end-to-end.';

  @override
  String get securityStatement3 => 'Zadna stopa. Zadny kompromis.';

  @override
  String get securityStatement4 => 'Vase soukromi je pravo.';

  @override
  String get accessBlocked => 'Pristup zablokovan';

  @override
  String get tooManyAttempts => 'Prilis mnoho pokusu';

  @override
  String get pleaseWait => 'Prosim vyckejte';

  @override
  String get waitDelay => 'Prosim vyckejte na konec prodlevy';

  @override
  String attemptCount(int current, int max) {
    return 'Pokus $current z $max';
  }

  @override
  String retryIn(String time) {
    return 'Opakujte za $time';
  }

  @override
  String get forgotPin => 'Zapomenuty PIN? Pouzijte frazi pro obnoveni';

  @override
  String get useRecoveryPhrase => 'Pouzit frazi pro obnoveni';

  @override
  String get recoveryWarningTitle => 'Upozorneni';

  @override
  String get recoveryWarningMessage => 'Obnoveni uctu provede:';

  @override
  String get recoveryDeleteAllMessages => 'Smazani VSECH vasich zprav';

  @override
  String get recoveryWaitDelay => 'Vyzadovani 1hodinove prodlevy';

  @override
  String get recoveryKeepContacts => 'Zachovani vasich kontaktu';

  @override
  String get recoveryIrreversible =>
      'Tato akce je nevratna. Vase zpravy budou trvale ztraceny.';

  @override
  String get iUnderstand => 'Rozumim';

  @override
  String get accountRecovery => 'Obnoveni uctu';

  @override
  String get enterRecoveryPhrase =>
      'Zadejte 24 slov sve fraze pro obnoveni oddelenych mezerami.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Obnovit';

  @override
  String get recoveryPhraseRequired => 'Prosim zadejte svou frazi pro obnoveni';

  @override
  String get recoveryPhrase24Words => 'Fraze musi obsahovat presne 24 slov';

  @override
  String get incorrectRecoveryPhrase => 'Nespravna fraze pro obnoveni';

  @override
  String get recoveryInitError => 'Chyba pri inicializaci obnoveni';

  @override
  String get securityDelay => 'Bezpecnostni prodleva';

  @override
  String get securityDelayMessage =>
      'Pro vasi bezpecnost je vyzadovana cekaci doba pred vytvorenim noveho PINu.';

  @override
  String get timeRemaining => 'Zbyvajici cas';

  @override
  String get messagesDeletedForProtection =>
      'Vase zpravy byly smazany pro vasi ochranu.';

  @override
  String get canCloseApp => 'Muzete zavrit aplikaci a vratit se pozdeji.';

  @override
  String get onboardingTitle1 => 'Vitejte v Hash';

  @override
  String get onboardingSubtitle1 => 'Messenger, ktery nezanechava stopy';

  @override
  String get onboardingTitle2 => 'Uplne sifrovani';

  @override
  String get onboardingSubtitle2 =>
      'Vase zpravy jsou end-to-end sifrovane protokolem Signal';

  @override
  String get onboardingTitle3 => 'Zadna stopa';

  @override
  String get onboardingSubtitle3 => 'Zpravy se mazou ze serveru po doruceni';

  @override
  String get onboardingTitle4 => 'Vase zabezpeceni';

  @override
  String get onboardingSubtitle4 => 'PIN kod, Rezim Vash a fraze pro obnoveni';

  @override
  String get getStarted => 'Zacit';

  @override
  String get next => 'Dalsi';

  @override
  String get skip => 'Preskocit';

  @override
  String get alreadyHaveAccount => 'Jiz mam ucet';

  @override
  String get transferMyAccount => 'Prevest muj ucet';

  @override
  String get createPin => 'Vytvorit PIN kod';

  @override
  String get createPinSubtitle =>
      'Tento kod bude chranit pristup k vasi aplikaci';

  @override
  String get confirmYourPin => 'Potvrdte svuj PIN kod';

  @override
  String get confirmPinSubtitle => 'Zadejte znovu svuj PIN kod';

  @override
  String get saveRecoveryPhrase => 'Fraze pro obnoveni';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Zapiste si techto 24 slov v poradi. Umozni vam obnovit ucet, pokud zapomenete svuj PIN.';

  @override
  String get phraseWritten => 'Zapsal/a jsem si frazi';

  @override
  String get warningRecoveryPhrase =>
      'Pokud ztratite tuto frazi a zapomenete svuj PIN, ztratite pristup ke svemu uctu.';

  @override
  String get accountTransferred => 'Ucet preveden';

  @override
  String get accountTransferredMessage =>
      'Vas ucet byl preveden na jiny pristroj. Tato relace jiz neni platna.';

  @override
  String get accountTransferredInfo =>
      'Pokud jste tento prevod neiniciovali, vas ucet mohl byt kompromitovan.';

  @override
  String get logout => 'Odhlasit se';

  @override
  String get transferAccount => 'Prevest ucet';

  @override
  String get transferAccountInfo =>
      'Prevedte svuj ucet Hash na novy pristroj. Vase soucasna relace bude zneplatnena.';

  @override
  String get generateTransferCode => 'Vygenerovat kod pro prevod';

  @override
  String get transferCode => 'Kod pro prevod';

  @override
  String transferCodeExpires(int minutes) {
    return 'Tento kod vypisi za $minutes minut';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Zadejte tento kod na novem pristroji pro prevod uctu.';

  @override
  String get generateNewCode => 'Vygenerovat novy kod';

  @override
  String get scanQrCode => 'Naskenovat QR kod';

  @override
  String get scanQrCodeSubtitle => 'Naskenujte QR kod kontaktu a pridejte ho';

  @override
  String get qrCodeDetected => 'QR kod rozpoznan';

  @override
  String get invalidQrCode => 'Neplatny QR kod';

  @override
  String get cameraPermissionRequired => 'Vyzadovano opravneni kamery';

  @override
  String get myQrCode => 'Muj QR kod';

  @override
  String get myQrCodeSubtitle =>
      'Sdilej tento QR kod, aby te kontakty mohly pridat';

  @override
  String get shareQrCode => 'Sdilet';

  @override
  String get addContactTitle => 'Pridat kontakt';

  @override
  String get addContactByHashId => 'Zadejte Hash ID kontaktu';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Hledat';

  @override
  String get contactNotFound => 'Kontakt nenalezen';

  @override
  String get contactAlreadyAdded => 'Tento kontakt je jiz ve vasem seznamu';

  @override
  String get contactAdded => 'Kontakt pridan';

  @override
  String get myProfile => 'Muj profil';

  @override
  String get myProfileSubtitle =>
      'Sdilej tyto informace, aby te ostatni mohli pridat';

  @override
  String get temporaryCode => 'Docasny kod';

  @override
  String temporaryCodeExpires(String time) {
    return 'Vypisi za $time';
  }

  @override
  String get codeExpired => 'Kod vyprsel';

  @override
  String get generateNewCodeButton => 'Novy kod';

  @override
  String get copyHashId => 'Kopirovat ID';

  @override
  String get copyCode => 'Kopirovat kod';

  @override
  String get copiedToClipboard => 'Zkopirovano';

  @override
  String get showMyQrCode => 'Zobrazit muj QR kod';

  @override
  String get orDivider => 'nebo';

  @override
  String get openScanner => 'Otevrit skener';

  @override
  String get addManually => 'Pridat rucne';

  @override
  String get contactHashIdLabel => 'Hash ID kontaktu';

  @override
  String get temporaryCodeLabel => 'Docasny kod';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Pozadejte kontakt o vygenerovani kodu z jeho profilu';

  @override
  String get verifyAndAdd => 'Overit a pridat';

  @override
  String get fillAllFields => 'Prosim vyplnte vsechna pole';

  @override
  String get invalidHashIdFormat => 'Neplatny format ID (napr.: 123-456-ABC)';

  @override
  String get userNotFound => 'Uzivatel nenalezen';

  @override
  String get cannotAddYourself => 'Nemuzete pridat sami sebe';

  @override
  String get invalidOrExpiredCode => 'Neplatny nebo prosly docasny kod';

  @override
  String get contactFound => 'Kontakt nalezen!';

  @override
  String get howToCallContact => 'Jak ho/ji chcete pojmenovat?';

  @override
  String get contactNameHint => 'Jmeno kontaktu';

  @override
  String get addContactButton => 'Pridat';

  @override
  String get contactDetails => 'Podrobnosti kontaktu';

  @override
  String get contactName => 'Jmeno kontaktu';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Pridano $date';
  }

  @override
  String get deleteContact => 'Smazat kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Smazat tento kontakt?';
  }

  @override
  String get deleteContactMessage => 'Tim se smaze take cely chat.';

  @override
  String get delete => 'Smazat';

  @override
  String get typeMessage => 'Napiste zpravu...';

  @override
  String get messageSent => 'Odeslano';

  @override
  String get messageDelivered => 'Doruceno';

  @override
  String get messageRead => 'Precteno';

  @override
  String get messageFailed => 'Odeslani selhalo';

  @override
  String get now => 'Ted';

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
  String get today => 'Dnes';

  @override
  String get yesterday => 'Vcera';

  @override
  String dateAtTime(String date, String time) {
    return '$date v $time';
  }

  @override
  String get shareMessage =>
      'Pridej se ke mne na Hash! 🔒\n\nJe to opravdu soukromy messenger: uplne sifrovani, zadna stopa na serverech a panikovy rezim v pripade potreby.\n\nStahni si aplikaci zde 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Chyba';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Zobrazit';

  @override
  String get yes => 'Ano';

  @override
  String get no => 'Ne';

  @override
  String get save => 'Ulozit';

  @override
  String get edit => 'Upravit';

  @override
  String get close => 'Zavrit';

  @override
  String get confirm => 'Potvrdit';

  @override
  String get loading => 'Nacitani...';

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Cekajici zadosti';

  @override
  String get noPendingRequests => 'Zadne cekajici zadosti';

  @override
  String get pendingRequestsSubtitle => 'Tito lide si vas chteji pridat';

  @override
  String requestFromUser(String hashId) {
    return 'Zadost od $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Vypisi za $days dni';
  }

  @override
  String get acceptRequest => 'Prijmout';

  @override
  String get rejectRequest => 'Odmitnout';

  @override
  String get requestAccepted => 'Zadost prijata';

  @override
  String get requestRejected => 'Zadost odmitnuta';

  @override
  String get requestSent => 'Zadost odeslana!';

  @override
  String get requestSentSubtitle =>
      'Vase zadost byla odeslana. Uzivatel ji musi prijmout, nez budete moci chatovat.';

  @override
  String get requestAlreadyPending => 'Zadost jiz ceka';

  @override
  String get requestAlreadySentByOther => 'Tato osoba vam jiz poslala zadost';

  @override
  String get addByHashId => 'Pridat pomoci Hash ID';

  @override
  String get addByHashIdSubtitle => 'Zadejte Hash ID a docasny kod kontaktu';

  @override
  String get enterTemporaryCode => 'Zadejte 6mistny kod';

  @override
  String get sendRequest => 'Odeslat zadost';

  @override
  String get acceptContactTitle => 'Prijmout kontakt';

  @override
  String get acceptContactSubtitle => 'Muzete mu/ji dat vlastni jmeno';

  @override
  String get leaveEmptyForHashId => 'Nechte prazdne pro pouziti Hash ID';

  @override
  String get firstName => 'Jmeno';

  @override
  String get lastName => 'Prijmeni';

  @override
  String get notes => 'Poznamky';

  @override
  String get notesHint => 'Osobni poznamky k tomuto kontaktu';

  @override
  String get photoOptional => 'Fotka (volitelne)';

  @override
  String get contactNameOptional => 'Jmeno (volitelne)';

  @override
  String get notesOptional => 'Poznamky (volitelne)';

  @override
  String get storedLocally => 'Ulozeno pouze na vasem zarizeni';

  @override
  String get encryptedMessageLabel => 'Sifrovana zprava';

  @override
  String get identityMessageHint => 'Kdo jste? Jak se znate?';

  @override
  String get messageWillBeSentEncrypted =>
      'Tato zprava bude zasifrovana a odeslana prijemci';

  @override
  String get sendRequestButton => 'Odeslat zadost';

  @override
  String get requestExpiresIn24h =>
      'Zadost vypisi za 24 h, pokud nebude prijata';

  @override
  String get theyAlreadySentYouRequest => 'Tato osoba vam jiz poslala zadost';

  @override
  String get requests => 'Zadosti';

  @override
  String get receivedRequests => 'Prijate';

  @override
  String get sentRequests => 'Odeslane';

  @override
  String get noSentRequests => 'Zadne odeslane zadosti';

  @override
  String get cancelRequest => 'Zrusit';

  @override
  String get deleteRequest => 'Smazat zadost';

  @override
  String get requestCancelled => 'Zadost zrusena';

  @override
  String sentTo(String hashId) {
    return 'Odeslano na $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Vypisi za $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Prijato pred $time';
  }

  @override
  String get messageFromRequester => 'Zprava od zadatele';

  @override
  String get copy => 'Kopirovat';

  @override
  String get messageInfo => 'Informace o zprave';

  @override
  String get messageDirection => 'Smer';

  @override
  String get messageSentByYou => 'Odeslano vami';

  @override
  String get messageReceived => 'Prijato';

  @override
  String get messageSentAt => 'Odeslano v';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Stav';

  @override
  String get messageReadAt => 'Precteno v';

  @override
  String get messageType => 'Typ';

  @override
  String get messageSize => 'Velikost';

  @override
  String get messageExpiresAt => 'Vypisi v';

  @override
  String get messageEncrypted => 'End-to-end sifrovano';

  @override
  String get messageStatusSending => 'Odesila se...';

  @override
  String get messageStatusSent => 'Odeslano';

  @override
  String get messageStatusDelivered => 'Doruceno';

  @override
  String get messageStatusRead => 'Precteno';

  @override
  String get messageStatusFailed => 'Selhalo';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Ceka na doruceni';

  @override
  String get deletedFromServer => 'Smazano';

  @override
  String get messageTypeText => 'Text';

  @override
  String get messageTypeImage => 'Obrazek';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Hlas';

  @override
  String get messageTypeFile => 'Soubor';

  @override
  String get indefinitely => 'Neomezeně';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'hodin';

  @override
  String get minutes => 'minut';

  @override
  String get seconds => 'sekund';

  @override
  String get ephemeralMessages => 'Pomijive zpravy';

  @override
  String get ephemeralMessagesDescription =>
      'Zpravy se automaticky smazou po tomto case';

  @override
  String get ephemeralImmediate => 'Okamzite (po precteni)';

  @override
  String get ephemeralImmediateDesc => 'Smazano ihned po precteni';

  @override
  String get ephemeralMyPreference => 'Moje preference';

  @override
  String get ephemeralMyPreferenceDesc => 'Pouzit globalni nastaveni';

  @override
  String get ephemeralDefaultSetting => 'Doba trvani zprav';

  @override
  String get ephemeralChooseDefault => 'Doporuceno';

  @override
  String get ephemeral30Seconds => '30 sekund';

  @override
  String get ephemeral30SecondsDesc => 'Smazano 30 s po precteni';

  @override
  String get ephemeral5Minutes => '5 minut';

  @override
  String get ephemeral5MinutesDesc => 'Smazano 5 min po precteni';

  @override
  String get ephemeral1Hour => '1 hodina';

  @override
  String get ephemeral1HourDesc => 'Smazano 1 h po precteni';

  @override
  String get ephemeral3Hours => '3 hodiny';

  @override
  String get ephemeral6Hours => '6 hodin';

  @override
  String get ephemeral6HoursDesc => 'Smazano 6 h po precteni';

  @override
  String get ephemeral12Hours => '12 hodin';

  @override
  String get ephemeral24Hours => '24 hodin';

  @override
  String get ephemeral24HoursDesc => 'Smazano 24 h po precteni';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Vlastni doba trvani';

  @override
  String get howItWorks => 'Jak to funguje';

  @override
  String get ephemeralExplanation1 =>
      'Zpravy se mazou ze serveru ihned po prijeti.';

  @override
  String get ephemeralExplanation2 =>
      'Toto nastaveni urcuje, kdy zpravy zmizi z VASEHO telefonu po precteni.';

  @override
  String get ephemeralExplanation3 =>
      'Vas kontakt ma vlastni nastaveni pro svuj telefon.';

  @override
  String get mute1Hour => '1 hodina';

  @override
  String get mute8Hours => '8 hodin';

  @override
  String get mute1Day => '1 den';

  @override
  String get mute1Week => '1 tyden';

  @override
  String get muteAlways => 'Vzdy';

  @override
  String get muteExplanation => 'Nebudete dostavat oznameni od tohoto kontaktu';

  @override
  String get showCallsInRecents => 'Zobrazit v poslednich hovorech';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hovory Hash se zobrazi v historii telefonu';

  @override
  String get feedback => 'Zpetna vazba';

  @override
  String get muteNotifications => 'Ztlumit oznameni';

  @override
  String get muteDescription => 'Nebudete dostavat oznameni od tohoto kontaktu';

  @override
  String mutedUntil(String time) {
    return 'Ztlumeno do $time';
  }

  @override
  String get notMuted => 'Oznameni zapnuta';

  @override
  String get unmute => 'Zrusit ztlumeni';

  @override
  String get notificationSound => 'Zvuk oznameni';

  @override
  String get defaultSound => 'Vychozi';

  @override
  String get chatSettings => 'Nastaveni chatu';

  @override
  String get bubbleColor => 'Barva bublin';

  @override
  String get backgroundColor => 'Barva pozadi';

  @override
  String get backgroundImage => 'Obrazek pozadi';

  @override
  String get chatBackground => 'Pozadi chatu';

  @override
  String get customColor => 'Vlastni';

  @override
  String get defaultColor => 'Vychozi';

  @override
  String get imageSelected => 'Obrazek vybran';

  @override
  String get noImage => 'Zadny obrazek';

  @override
  String get color => 'Barva';

  @override
  String get image => 'Obrazek';

  @override
  String get tapToSelectImage => 'Klepnete pro vyber obrazku';

  @override
  String get changeImage => 'Zmenit obrazek';

  @override
  String get previewMessageReceived => 'Ahoj!';

  @override
  String get previewMessageSent => 'Cau!';

  @override
  String get messageAction => 'Zprava';

  @override
  String get callAction => 'Volat';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Osobni poznamky';

  @override
  String get addNotes => 'Pridat poznamky...';

  @override
  String get noNotes => 'Zadne poznamky';

  @override
  String get messageNotifications => 'Oznameni o zpravach';

  @override
  String get callNotifications => 'Oznameni o hovorech';

  @override
  String get useGradient => 'Pouzit prechod';

  @override
  String get gradientStart => 'Pocatecni barva';

  @override
  String get gradientEnd => 'Koncova barva';

  @override
  String get preview => 'Nahled';

  @override
  String get reset => 'Obnovit';

  @override
  String get securityNumber => 'Bezpecnostni cislo';

  @override
  String securityNumberDescription(String name) {
    return 'Overte, ze bezpecnostni cislo odpovida zarizeni $name';
  }

  @override
  String get verifyEncryption => 'Overit end-to-end sifrovani';

  @override
  String get tapToCopy => 'Klepnete pro kopirovani';

  @override
  String get howToVerify => 'Jak overit';

  @override
  String get verifyStep1 => 'Setkejte se s kontaktem osobne nebo mu zavolejte';

  @override
  String get verifyStep2 =>
      'Porovnejte bezpecnostni cisla nebo naskenujte QR kody';

  @override
  String get verifyStep3 => 'Pokud se shoduji, vas chat je zabezpeceny';

  @override
  String get scanToVerify => 'Naskenovat pro overeni';

  @override
  String get reportSpam => 'Nahlasit spam';

  @override
  String get reportSpamSubtitle => 'Nahlasit tento kontakt jako spam';

  @override
  String get reportSpamDescription =>
      'Tento kontakt bude anonymne nahlasen. Vase identita nebude sdilena. Jste si jisti?';

  @override
  String get report => 'Nahlasit';

  @override
  String get spamReported => 'Spam nahlasen';

  @override
  String get reportError =>
      'Odeslani hlaseni se nezdarilo. Zkuste to prosim znovu.';

  @override
  String get reportRateLimited =>
      'Dosahli jste maximalniho poctu hlaseni pro dnesek.';

  @override
  String get blockContact => 'Zablokovat kontakt';

  @override
  String get blockContactDescription =>
      'Tento kontakt vam jiz nebude moci posilat zpravy ani volat. Nebude upozornen.';

  @override
  String get unblockContact => 'Odblokovat kontakt';

  @override
  String get unblockContactDescription =>
      'Tento kontakt vam bude moci opet posilat zpravy a volat.';

  @override
  String get contactBlocked => 'Kontakt zablokovan';

  @override
  String get contactUnblocked => 'Kontakt odblokovan';

  @override
  String get contactIsBlocked => 'Tento kontakt je zablokovan';

  @override
  String get unblock => 'Odblokovat';

  @override
  String get deleteContactSubtitle => 'Smazat tento kontakt a chat';

  @override
  String get confirmWithPin => 'Potvrdit PINem';

  @override
  String get enterPinToConfirm => 'Zadejte svuj PIN pro potvrzeni teto akce';

  @override
  String get profilePhoto => 'Profilova fotka';

  @override
  String get takePhoto => 'Vyfotit';

  @override
  String get chooseFromGallery => 'Vybrat z galerie';

  @override
  String get removePhoto => 'Odstranit fotku';

  @override
  String get viewContactHashId => 'Zobrazit identifikator kontaktu';

  @override
  String get hashIdPartiallyMasked =>
      'Castecne maskovano pro vasi bezpecnost a soukromi kontaktu';

  @override
  String get addFirstContact => 'Pridejte svuj prvni kontakt';

  @override
  String get addFirstContactSubtitle =>
      'Sdilej svuj QR kod nebo naskenuj QR kod pratele';

  @override
  String get directory => 'Adresar';

  @override
  String get noContacts => 'Zadne kontakty';

  @override
  String get noContactsSubtitle => 'Pridejte kontakt a zacnete';

  @override
  String get sendMessageAction => 'Odeslat zpravu';

  @override
  String get audioCall => 'Hlasovy hovor';

  @override
  String get videoCall => 'Videohovor';

  @override
  String get viewProfile => 'Zobrazit profil';

  @override
  String get deleteContactDirectory => 'Smazat kontakt';

  @override
  String get scanShort => 'Skenovat';

  @override
  String get addShort => 'Pridat';

  @override
  String deleteContactConfirmName(String name) {
    return 'Opravdu chcete smazat $name?';
  }

  @override
  String get noNotesTitle => 'Zadne poznamky';

  @override
  String get noNotesSubtitle => 'Vytvorte svou prvni poznamku';

  @override
  String get newNote => 'Nova poznamka';

  @override
  String get editNote => 'Upravit poznamku';

  @override
  String get deleteNote => 'Smazat poznamku';

  @override
  String get deleteNoteConfirm => 'Opravdu chcete smazat tuto poznamku?';

  @override
  String get noteTitle => 'Nazev';

  @override
  String get noteContent => 'Obsah';

  @override
  String get addItem => 'Pridat polozku';

  @override
  String get pinNote => 'Pripnout';

  @override
  String get unpinNote => 'Odepnout';

  @override
  String get noteColor => 'Barva';

  @override
  String get notePassword => 'Heslo';

  @override
  String get setPassword => 'Nastavit heslo';

  @override
  String get changePassword => 'Zmenit heslo';

  @override
  String get removePassword => 'Odstranit heslo';

  @override
  String get enterPassword => 'Zadejte heslo';

  @override
  String get confirmPassword => 'Potvrdte heslo';

  @override
  String get passwordPin => 'PIN kod';

  @override
  String get passwordText => 'Textove heslo';

  @override
  String get protectedNote => 'Chranena poznamka';

  @override
  String get incorrectPassword => 'Nespravne heslo';

  @override
  String get passwordSet => 'Heslo nastaveno';

  @override
  String get passwordRemoved => 'Heslo odstraneno';

  @override
  String get notesBiometric => 'Face ID pro poznamky';

  @override
  String get notesBiometricSubtitle =>
      'Vyzadovat biometricke overeni pro otevreni chranenych poznamek';

  @override
  String get textNote => 'Textova poznamka';

  @override
  String get checklistNote => 'Kontrolni seznam';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total ukolu';
  }

  @override
  String get autoSaved => 'Ulozeno';

  @override
  String get searchNotes => 'Hledat poznamky';

  @override
  String get legalConsent => 'Pravni souhlas';

  @override
  String get confirmAge13 => 'Potvrzuji, ze mi je alespon 13 let';

  @override
  String get acceptLegalStart => 'Souhlasim se ';

  @override
  String get privacyPolicy => 'Zasadami ochrany soukromi';

  @override
  String get termsOfService => 'Podminkami pouzivani';

  @override
  String get andThe => ' a ';

  @override
  String get continueButton => 'Pokracovat';

  @override
  String get mustAcceptTerms => 'Pro pokracovani musite prijmout obe podminky';

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
  String get support => 'Podpora';

  @override
  String get contactSupport => 'Kontaktovat podporu';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Nahlasit zneuziti';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Pravni informace';

  @override
  String get legalEntity => 'Pravni subjekt';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Pripnout';

  @override
  String get unpinConversation => 'Odepnout';

  @override
  String get hideConversation => 'Odebrat ze zdroje';

  @override
  String get deleteConversation => 'Smazat konverzaci';

  @override
  String get deleteConversationConfirm =>
      'Zadejte svuj PIN pro potvrzeni smazani vsech zprav';

  @override
  String get noConversations => 'Zatim zadne konverzace';

  @override
  String get startConversation => 'Zahajit';

  @override
  String get microphonePermissionRequired => 'Vyzadovan pristup k mikrofonu';

  @override
  String get microphonePermissionExplanation =>
      'Hash potrebuje mikrofon pro uskutecneni hovoru.';

  @override
  String get cameraPermissionExplanation =>
      'Hash potrebuje kameru pro videohovory.';

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
  String get openSettings => 'Otevrit nastaveni';

  @override
  String get callConnecting => 'Pripojovani...';

  @override
  String get callRinging => 'Zvoni...';

  @override
  String get callReconnecting => 'Znovu pripojovani...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Znovu pripojovani (${seconds}s)';
  }

  @override
  String get callPaused => 'Pozastaveno';

  @override
  String get callPausedSubtitle => 'Hovor stále probíhá';

  @override
  String get callRemoteMicMuted => 'Mikrofon kontaktu je ztlumen';

  @override
  String get callMiniControlsMute => 'Ztlumit';

  @override
  String get callMiniControlsUnmute => 'Zrusit ztlumeni';

  @override
  String get callMiniControlsHangUp => 'Zavesit';

  @override
  String get callMiniControlsReturn => 'Vratit se k hovoru';

  @override
  String get callNetworkPoor => 'Nestabilni pripojeni';

  @override
  String get callNetworkLost => 'Pripojeni ztraceno';

  @override
  String get callEndedTitle => 'Hovor ukoncen';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Data zarizeni';

  @override
  String get deviceDataSubtitle => 'Mistni a serverove uloziste';

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
  String get localStorage => 'Mistni uloziste';

  @override
  String get onThisDevice => 'na tomto zarizeni';

  @override
  String get encryptedDatabases => 'Sifrovane databaze';

  @override
  String get files => 'Soubory';

  @override
  String get secureKeychain => 'Bezpecna klicenka';

  @override
  String get cache => 'Mezipamer';

  @override
  String get contactsDetail => 'Jmena, avatary, klice Signal';

  @override
  String get messagesDetail => 'Sifrovane konverzace';

  @override
  String get notesDetail => 'Osobni poznamky';

  @override
  String get signalSessions => 'Relace Signal';

  @override
  String get signalSessionsDetail => 'Sifrovaci relace';

  @override
  String get pendingContacts => 'Cekajici kontakty';

  @override
  String get pendingContactsDetail => 'Cekajici zadosti';

  @override
  String get callHistory => 'Hovory';

  @override
  String get callHistoryDetail => 'Historie hovoru';

  @override
  String get preferences => 'Predvolby';

  @override
  String get preferencesDetail => 'Predvolby medii a hovoru';

  @override
  String get avatars => 'Avatary';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count souboru',
      one: '1 soubor',
      zero: 'zadne soubory',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktivni';

  @override
  String get notDefined => 'Nedefinovano';

  @override
  String get biometrics => 'Biometrie';

  @override
  String get recoveryPhrase => 'Fraze pro obnoveni';

  @override
  String get identity => 'Identita (Hash ID)';

  @override
  String get signalKeys => 'Klice Signal Protocol';

  @override
  String get authTokens => 'Autentizacni tokeny';

  @override
  String get contactNamesCache => 'Mezipamer jmen kontaktu';

  @override
  String get remoteConfig => 'Vzdalena konfigurace';

  @override
  String get notificationPrefs => 'Predvolby oznameni';

  @override
  String get serverData => 'Data na serveru';

  @override
  String get serverDataInfo =>
      'Hash uchovava na serveru minimum dat, vsechna sifrovana nebo docasna.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, verejne klice, token schranky';

  @override
  String get serverPrekeys => 'Pre-klice';

  @override
  String get serverPrekeysDetail => 'Jednorazove klice Signal (spotrebovane)';

  @override
  String get serverMessages => 'Zpravy v tranzitu';

  @override
  String get serverMessagesDetail => 'Smazany po doruceni (max 24 h)';

  @override
  String get serverMedia => 'Media v tranzitu';

  @override
  String get serverMediaDetail => 'Smazany po stazeni';

  @override
  String get serverContactRequests => 'Zadosti o kontakt';

  @override
  String get serverContactRequestsDetail => 'Vyprsi po 24 h';

  @override
  String get serverRateLimits => 'Omezeni frekvence';

  @override
  String get serverRateLimitsDetail => 'Docasna data proti zneuziti';

  @override
  String get privacyReassurance =>
      'Hash nemuze cist vase zpravy. Vsechna data jsou end-to-end sifrovana. Serverova data se automaticky mazou.';

  @override
  String get pinTooSimple =>
      'Tento PIN je prilis jednoduchy. Zvolte bezpecnejsi kod.';

  @override
  String get genericError => 'Doslo k chybe. Zkuste to prosim znovu.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nelze vytvorit ucet: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraze zkopirovana do schranky';

  @override
  String get copyPhrase => 'Kopirovat frazi';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Zapiste si tuto frazi na bezpecne misto. Pokud ztratite svuj PIN bez teto fraze, trvale ztratite pristup ke svym datum.';

  @override
  String get noMessages => 'Zadne zpravy';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Smazat vsechny zpravy s $name?';
  }

  @override
  String get confirmation => 'Potvrzeni';

  @override
  String get untitled => 'Bez nazvu';

  @override
  String get noSessions => 'Zadne relace';

  @override
  String get unknownContact => 'Neznamy kontakt';

  @override
  String get unnamed => 'Bez jmena';

  @override
  String get noPendingRequestsAlt => 'Zadne cekajici zadosti';

  @override
  String get deleteAllCallHistory => 'Smazat celou historii hovoru?';

  @override
  String get noCalls => 'Zadne hovory';

  @override
  String get noPreferences => 'Zadne predvolby';

  @override
  String get resetAllMediaPrefs => 'Obnovit vsechny predvolby medii?';

  @override
  String get deleteThisAvatar => 'Smazat tento avatar?';

  @override
  String get deleteAllAvatars => 'Smazat vsechny avatary?';

  @override
  String get noAvatars => 'Zadne avatary';

  @override
  String get deleteThisFile => 'Smazat tento soubor?';

  @override
  String get deleteAllMediaFiles => 'Smazat vsechna media?';

  @override
  String get noMediaFiles => 'Zadna media';

  @override
  String get outgoing => 'Odchozi';

  @override
  String get incoming => 'Prichozi';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Pomijive zobrazeni: ${seconds}s';
  }

  @override
  String get normalView => 'Normalni zobrazeni';

  @override
  String get callReasonCompleted => 'Dokonceno';

  @override
  String get callReasonMissed => 'Zmeskano';

  @override
  String get callReasonDeclined => 'Odmitnuto';

  @override
  String get callReasonFailed => 'Selhalo';

  @override
  String get justNow => 'Prave ted';

  @override
  String timeAgoMinutes(int count) {
    return 'Pred $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Pred ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Pred ${count}d';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Poloha';

  @override
  String get statusQueued => 'Ve fronte';

  @override
  String get blockedBadge => 'Zablokovano';

  @override
  String get protectedBadge => 'Chraneno';

  @override
  String messageCount(int count) {
    return '$count zprav(a)';
  }

  @override
  String get deleteQuestion => 'Smazat?';

  @override
  String get transferMyAccountTitle => 'Prevest muj ucet';

  @override
  String get loadingError => 'Chyba nacitani';

  @override
  String get transferToNewDevice => 'Prevest na novy pristroj';

  @override
  String get transferInstructions =>
      'Na novem pristroji zvolte \"Obnovit muj ucet\" a zadejte tyto udaje:';

  @override
  String get yourHashIdLabel => 'Vase Hash ID';

  @override
  String get enterYourPinCode => 'Zadejte svuj PIN kod';

  @override
  String get pinOwnerConfirmation =>
      'Pro potvrzeni, ze jste vlastnikem tohoto uctu';

  @override
  String get scanThisQrCode => 'Naskenujte tento QR kod';

  @override
  String get withYourNewDevice => 'Svym novym pristrojem';

  @override
  String get orEnterTheCode => 'nebo zadejte kod';

  @override
  String get transferCodeLabel => 'Kod pro prevod';

  @override
  String get proximityVerification => 'Overeni blizkosti';

  @override
  String get bringDevicesCloser => 'Priblizte obe zarizeni k sobe';

  @override
  String get confirmTransferQuestion => 'Potvrdit prevod?';

  @override
  String get accountWillBeTransferred =>
      'Vas ucet bude preveden na novy pristroj.\n\nToto zarizeni bude trvale odpojeno.';

  @override
  String get transferComplete => 'Prevod dokoncen';

  @override
  String get transferSuccessMessage =>
      'Vas ucet byl uspesne preveden.\n\nTato aplikace se nyni zavre.';

  @override
  String get manualVerification => 'Rucni overeni';

  @override
  String get codeDisplayedOnBothDevices => 'Kod zobrazeny na obou pristrojich:';

  @override
  String get doesCodeMatchNewDevice =>
      'Odpovida tento kod tomu na novem pristroji?';

  @override
  String get verifiedStatus => 'Overeno';

  @override
  String get inProgressStatus => 'Probiha...';

  @override
  String get notAvailableStatus => 'Nedostupne';

  @override
  String get codeExpiredRestart => 'Kod vyprsel. Prosim zacnete znovu.';

  @override
  String get codesDoNotMatchCancelled => 'Kody se neshoduji. Prevod zrusen.';

  @override
  String transferToDevice(String device) {
    return 'Na: $device';
  }

  @override
  String get copiedExclamation => 'Zkopirovano!';

  @override
  String expiresInTime(String time) {
    return 'Vypisi za $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrie neni na tomto zarizeni dostupna';

  @override
  String get biometricAuthError => 'Chyba pri biometrickem overeni';

  @override
  String get authenticateForBiometric =>
      'Prosim overte se pro zapnuti biometrie';

  @override
  String get biometricAuthFailed => 'Biometricke overeni selhalo';

  @override
  String get forceUpdateTitle => 'Vyzadovana aktualizace';

  @override
  String get forceUpdateMessage =>
      'Je dostupna nova verze Hash. Prosim aktualizujte pro pokracovani.';

  @override
  String get updateButton => 'Aktualizovat';

  @override
  String get maintenanceInProgress => 'Probiha udrzba';

  @override
  String get tryAgainLater => 'Zkuste to prosim pozdeji';

  @override
  String get information => 'Informace';

  @override
  String get later => 'Pozdeji';

  @override
  String get doYouLikeHash => 'Libi se vam Hash?';

  @override
  String get yourFeedbackHelps =>
      'Vase zpetna vazba nam pomaha zlepsovat aplikaci';

  @override
  String get ratingTerrible => 'Hrozne';

  @override
  String get ratingBad => 'Spatne';

  @override
  String get ratingOk => 'Ujde';

  @override
  String get ratingGood => 'Dobre';

  @override
  String get ratingExcellent => 'Vyborne!';

  @override
  String get donationMessage =>
      'Hash je neziskovy projekt. Vase podpora nam pomaha nadale vyvijet skutecne soukromy messenger.';

  @override
  String get recentConnections => 'Posledni pripojeni';

  @override
  String get loginInfoText =>
      'Kazde odemknuti PINem je zaznamenano lokalne. Uchovava se pouze poslednich 24 hodin.';

  @override
  String get connectionCount => 'Pripojeni';

  @override
  String get periodLabel => 'Obdobi';

  @override
  String get historyLabel => 'Historie';

  @override
  String get noLoginRecorded => 'Zadne zaznamenane prihlaseni';

  @override
  String get nextUnlocksAppearHere => 'Dalsi odemknuti se zobrazi zde.';

  @override
  String get dataLocalOnly =>
      'Tato data jsou ulozena pouze na vasem zarizeni a nikdy nejsou odesilana.';

  @override
  String get currentSession => 'Aktualni';

  @override
  String get todayLabel => 'Dnes';

  @override
  String get yesterdayLabel => 'Vcera';

  @override
  String get justNowLabel => 'Prave ted';

  @override
  String minutesAgoLabel(int count) {
    return 'Pred $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Pred ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Pred ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Zadna planovana udrzba';

  @override
  String get everythingWorkingNormally => 'Vse funguje normalne';

  @override
  String get maintenanceTitle => 'Udrzba';

  @override
  String get maintenanceActiveLabel => 'PROBIHA';

  @override
  String get maintenancePlannedLabel => 'PLANOVANA';

  @override
  String get locking => 'Zamykani...';

  @override
  String get newMessageNotification => 'Nova zprava';

  @override
  String get secExplainTitle => 'Jak te Hash chrani';

  @override
  String get secExplainIntro =>
      'Hash je navrzen tak, aby nikdo nemohl cist tve zpravy.';

  @override
  String get secExplainIntroSub =>
      'Ani my.\nTakto to funguje, vysvetleno jednoduse.';

  @override
  String get secJourneyLabel => 'CESTA';

  @override
  String get secJourneyTitle => 'Cesta tve zpravy';

  @override
  String get secJourneySubtitle =>
      'Od tveho prstu az na obrazovku kontaktu je kazdy krok chranen. Sleduj cestu.';

  @override
  String get secStep1Title => 'Napises zpravu';

  @override
  String get secStep1Desc =>
      'Napises \"Ahoj!\" v aplikaci. V tuto chvili zprava existuje pouze v pameti tveho telefonu. Nic nebylo odeslano.';

  @override
  String get secStep2Title => 'Sifrovani protokolem Signal';

  @override
  String get secStep2Desc =>
      'Jakmile stisknes \"Odeslat\", tvoje zprava se premeni na retezec nesrozumitelnych znaku. Je to jako by tvoje zprava byla zamcena v trezoru, ke kteremu ma klic pouze tvuj kontakt.';

  @override
  String get secStep3Title => 'Sealed Sender: neviditelna obalka';

  @override
  String get secStep3Desc =>
      'Predstav si, ze posles dopis postou, ale bez adresy odesilatele na obalce. Presne to dela Hash. Zprava je vlozena do anonymni schranky. Server nevi, kdo ji poslal.';

  @override
  String get secStep4Title => 'Server nic nevidi';

  @override
  String get secStep4Desc =>
      'Server je jako slepy listonosc. Vi jen, ze \"nekdo neco vlozil do schranky #A7X9\". Nevi, kdo to poslal, co to je, ani komu je to urceno.';

  @override
  String get secStep4Highlight =>
      'Zadna metadata: zadna IP adresa, zadne casove razitko, zadna vazba mezi odesilatelem a prijemcem.';

  @override
  String get secStep5Title => 'Kontakt prijme zpravu';

  @override
  String get secStep5Desc =>
      'Telefon kontaktu si vyzvedne obsah ze sve anonymni schranky a desifruje zpravu svym soukromym klicem, ktery nikdy neopustil jeho zarizeni. Na obrazovce se objevi \"Ahoj!\".';

  @override
  String get secStep6Title => 'Zprava zmizi ze serveru';

  @override
  String get secStep6Desc =>
      'Jakmile kontakt potvrdi prijem, server zpravu trvale smaze. Zadny kos, zadny archiv, zadna zaloha. I neprectene zpravy jsou automaticky zniceny po 24 hodinach.';

  @override
  String get secStep7Title => 'Mistni expirace';

  @override
  String get secStep7Desc =>
      'Na telefonu kontaktu se zprava sama znici podle doby, kterou jsi zvolil/a: ihned po precteni, 5 minut, 1 hodina... ty rozhodujes.';

  @override
  String get secJourneyConclusion =>
      'Vysledek: zadna stopa na serveru, zadna stopa na zarizeni. Zprava existovala jen tak dlouho, aby byla prectena, a pak zmizela.';

  @override
  String get secArchLabel => 'ARCHITEKTURA';

  @override
  String get secArchTitle => '5 vrstev ochrany';

  @override
  String get secArchSubtitle =>
      'Hash se nespolehne na jedinou technologii. Kazda vrstva posiluje ostatni. I kdyby byla jedna vrstva kompromitovana, tvoje data zustanou v bezpeci.';

  @override
  String get secLayer1Title => 'End-to-end sifrovani';

  @override
  String get secLayer1Desc =>
      'Kazda zprava je zasifrovana jedinecnym klicem. Jednoduse receno: i kdyby nekdo desifroval jednu zpravu, nebude schopen desifrovat dalsi. Kazda zprava ma svuj vlastni zamek.';

  @override
  String get secLayer1Detail =>
      'Pro soubory (fotky, videa, dokumenty) Hash pouziva dalsi sifrovani AES-256-GCM. Soubor je zasifrovany jeste pred opustenim telefonu.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonymita site)';

  @override
  String get secLayer2Desc =>
      'Bezne messengery odesilaji zpravy s tvou identitou. Je to jako napsat sve jmeno na obalku. Hash pouziva anonymni schranky: server dorucuje zpravu, aniz by vedel, kdo ji poslal.';

  @override
  String get secLayer2Detail =>
      'Vysledek: i v pripade uniku dat ze serveru je nemozne rekonstruovat, kdo s kym komunikuje.';

  @override
  String get secLayer3Title => 'Automaticke mazani';

  @override
  String get secLayer3Desc =>
      'Zpravy se mazou ze serveru ihned po potvrzeni prijmu. I kdyz zprava neni nikdy vyzvednuta, je automaticky znicena po 24 hodinach.';

  @override
  String get secLayer3Detail =>
      'Na telefonu se zpravy samy znici podle doby, kterou zvolis: ihned, 5 min, 15 min, 30 min, 1 h, 3 h, 6 h nebo 12 h.';

  @override
  String get secLayer4Title => 'Mistni ochrana pristupu';

  @override
  String get secLayer4Desc =>
      'Aplikace je chranena 6mistnym PINem a/nebo biometrii (Face ID, otisk prstu). Po prilis mnoha neuspesnych pokusech se aplikace zamkne s rostouci prodlevou po kazdem selhani.';

  @override
  String get secLayer5Title => 'Zamcena databaze';

  @override
  String get secLayer5Desc =>
      'Na strane serveru nemuze zadny uzivatel primo zapisovat do databaze. Vsechny akce prochazi bezpecnostnimi funkcemi, ktere overuji kazdy pozadavek.';

  @override
  String get secLayer5Detail =>
      'Je to jako prepazka v bance: nikdy se sam nedotykate trezoru. Podate zadost a system overi, ze na to mate pravo, nez zacne jednat.';

  @override
  String get secVashLabel => 'UNIKATNI NA SVETE';

  @override
  String get secVashTitle => 'Rezim Vash';

  @override
  String get secVashSubtitle =>
      'Nouzovy bezpecnostni system, ktery neexistuje v zadne jine zpravove aplikaci.';

  @override
  String get secVashScenarioTitle => 'Predstav si tuto situaci';

  @override
  String get secVashScenario1 => 'Nekdo se dostane k tvemu telefonu';

  @override
  String get secVashScenario2 => 'Pozaduji po tobe PIN kod';

  @override
  String get secVashScenario3 => 'Chces nouzove smazat vsechna svoja data';

  @override
  String get secVashSolutionTitle => 'Reseni: dva PIN kody';

  @override
  String get secVashSolutionDesc => 'V Hash si nastavis dva ruzne PIN kody:';

  @override
  String get secVashNormalCodeLabel => 'Normalni kod';

  @override
  String get secVashNormalCodeDesc =>
      'Otevre aplikaci normalne se vsemi tvymi daty';

  @override
  String get secVashCodeLabel2 => 'Kod Vash';

  @override
  String get secVashCodeDescription =>
      'Otevre aplikaci normalne... ale vsechna tvoje data jsou tise smazana na pozadi';

  @override
  String get secVashWhatHappensTitle => 'Co se stane pak';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikace se otevre normalne. Zadne upozorneni, zadna podezrela animace. Na obrazovce se jednodusse zobrazi prazdna aplikace, jako bys ji prave nainstaloval/a.\n\nVe skutecnosti byly vsechny tvoje konverzace, kontakty a zpravy nenavratne smazany ve zlomku sekundy.';

  @override
  String get secCallsLabel => 'HOVORY A SOUBORY';

  @override
  String get secCallsTitle => 'Vse je sifrovano';

  @override
  String get secCallsSubtitle =>
      'Nejde jen o zpravy. Absolutne vse, co prochazi pres Hash, je end-to-end sifrovano.';

  @override
  String get secAudioCallTitle => 'Hlasove hovory';

  @override
  String get secAudioCallDesc =>
      'End-to-end sifrovane pres WebRTC. Hlas se prenasi primo mezi zarizenimi.';

  @override
  String get secVideoCallTitle => 'Videohovory';

  @override
  String get secVideoCallDesc =>
      'Stejna technologie, kazdy proud sifrovan individualne.';

  @override
  String get secPhotosTitle => 'Fotky a videa';

  @override
  String get secPhotosDesc =>
      'Sifrovano v AES-256-GCM pred opustenim telefonu.';

  @override
  String get secDocsTitle => 'Dokumenty';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, jakykoliv soubor. Nazev, velikost a obsah sifrovany.';

  @override
  String get secAnonLabel => 'ANONYMITA';

  @override
  String get secAnonTitle => 'Zadna identita neni vyzadovana';

  @override
  String get secAnonSubtitle =>
      'Hash nikdy nezada tvoje telefonni cislo ani email. Jsi identifikovan/a jedinecnym a anonymnim Hash ID.';

  @override
  String get secHashIdTitle => 'Tvoje Hash ID';

  @override
  String get secHashIdDesc =>
      'Toto je tvuj jedinecny identifikator. Neodhaluje o tobe nic: ani tvoje jmeno, ani cislo, ani polohu. Je to jako pseudonym, ktery nelze propojit s tvou skutecnou identitou.\n\nPro pridani kontaktu sdilis sve Hash ID nebo naskenujes QR kod. To je vse. Zadny synchronizovany adresar, zadne navrhy \"Lide, ktere mozna znate\".';

  @override
  String get secDataLabel => 'DATA';

  @override
  String get secDataTitle => 'Co Hash nevi';

  @override
  String get secDataSubtitle =>
      'Nejlepsi zpusob, jak chranit tvoje data, je nezbírat je.';

  @override
  String get secNeverCollected => 'Nikdy neshromazdeno';

  @override
  String get secNeverItem1 => 'Obsah zprav';

  @override
  String get secNeverItem2 => 'Seznam kontaktu';

  @override
  String get secNeverItem3 => 'Telefonni cislo';

  @override
  String get secNeverItem4 => 'E-mailova adresa';

  @override
  String get secNeverItem5 => 'IP adresa';

  @override
  String get secNeverItem6 => 'Poloha';

  @override
  String get secNeverItem7 => 'Metadata (kdo s kym komunikuje)';

  @override
  String get secNeverItem8 => 'Historie hovoru';

  @override
  String get secNeverItem9 => 'Adresar';

  @override
  String get secNeverItem10 => 'Reklamni identifikatory';

  @override
  String get secTempStored => 'Docasne ulozeno';

  @override
  String get secTempItem1 => 'Anonymni Hash ID (jedinecny identifikator)';

  @override
  String get secTempItem2 => 'Verejne sifrovaci klice';

  @override
  String get secTempItem3 => 'Sifrovane zpravy v tranzitu (max 24 h)';

  @override
  String get secTempNote =>
      'Ani tato minimalni data neumoznuji tvou identifikaci. Tvoje Hash ID neni spojeno se zadnymi osobnimi udaji.';

  @override
  String get secFooterTitle => 'Tvoje soukromi, tvoje svoboda';

  @override
  String get secFooterDesc =>
      'Hash pouziva stejne sifrovaci technologie jako nejnarocnejsi profesionalni aplikace. Tvoje zpravy jsou chraneny matematikou, ne sliby.';

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
