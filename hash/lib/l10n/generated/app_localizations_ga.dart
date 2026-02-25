// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

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
  String get conversations => 'Comhraite';

  @override
  String get contacts => 'Teagmhalaithe';

  @override
  String get noConversation => 'Gan comhra';

  @override
  String get noConversationSubtitle =>
      'Cuir teagmhalaiche leis chun tosu ag comhra go sabhailte';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count iarratas faighte',
      one: '1 iarratas faighte',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count iarratas seolta ar feitheamh',
      one: '1 iarratas seolta ar feitheamh',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Cuir teagmhalaiche leis';

  @override
  String get shareApp => 'Roinn an aip';

  @override
  String get newMessage => 'Teachtaireacht nua';

  @override
  String get newConversation => 'Seol teachtaireacht';

  @override
  String get settings => 'Socruithe';

  @override
  String get myHashId => 'Mo Hash ID';

  @override
  String get supportHash => 'Tacaigh le Hash';

  @override
  String get supportHashSubtitle => 'Is tionscadal neamhbhrabusach e Hash';

  @override
  String get donate => 'Tabhair sintiuis';

  @override
  String get appearance => 'Cuma';

  @override
  String get theme => 'Teama';

  @override
  String get themeAuto => 'Uathobrioch';

  @override
  String get themeAutoSubtitle => 'Leanann socruithe an chorais';

  @override
  String get themeDark => 'Dorcha';

  @override
  String get themeLight => 'Eadrom';

  @override
  String get themeRecommendation =>
      'Moltar an teama dorcha le haghaidh priobhaideachta nios fearr';

  @override
  String get language => 'Teanga';

  @override
  String get languageAuto => 'Uathobrioch (coras)';

  @override
  String get notifications => 'Fograi';

  @override
  String get messages => 'Teachtaireachtai';

  @override
  String get calls => 'Glaonna';

  @override
  String get vibration => 'Critheadh';

  @override
  String get notificationContent => 'Abhar an fhogra';

  @override
  String get notificationContentFull => 'Taispeain gach rud';

  @override
  String get notificationContentFullDesc =>
      'Ainm an teagmhalaiche agus reamhamharc na teachtaireachta';

  @override
  String get notificationContentName => 'Ainm amhain';

  @override
  String get notificationContentNameDesc =>
      'Taispeain ainm an teagmhalaiche amhain';

  @override
  String get notificationContentDiscrete => 'Discreideach';

  @override
  String get notificationContentDiscreteDesc =>
      'Taispeain \"Teachtaireacht nua\" amhain';

  @override
  String get security => 'Slandail';

  @override
  String get howHashProtectsYou => 'Conas a chosnaionn Hash thu';

  @override
  String get howHashProtectsYouSubtitle => 'Tuig do shlandail';

  @override
  String get accountSecurity => 'Slandail an chuntais';

  @override
  String get accountSecuritySubtitle => 'PIN, biomeadrach, Modh Vash';

  @override
  String get blockScreenshots => 'Cuir cosc ar ghabhail scaileain';

  @override
  String get transferDevice => 'Aistriu go gleas eile';

  @override
  String get transferDeviceSubtitle => 'Aistrigh do chuntas';

  @override
  String get pinCode => 'Cod PIN';

  @override
  String get changePin => 'Athraigh an cod PIN';

  @override
  String get currentPin => 'Cod PIN reatha';

  @override
  String get newPin => 'Cod PIN nua';

  @override
  String get confirmPin => 'Deimhnigh an cod PIN';

  @override
  String get pinChanged => 'Cod PIN athraithe';

  @override
  String get incorrectPin => 'PIN micheart';

  @override
  String get pinsDoNotMatch => 'Ni mheaitsealann na coid';

  @override
  String get autoLock => 'Glasail uathobrioch';

  @override
  String get autoLockDelay => 'Moill ghlasala';

  @override
  String get autoLockImmediate => 'Laithreach';

  @override
  String get autoLockMinute => '1 noimead';

  @override
  String autoLockMinutes(int count) {
    return '$count noimead';
  }

  @override
  String get vashCode => 'Cod Vash';

  @override
  String get vashModeTitle => 'Modh Vash';

  @override
  String get vashModeExplanation => 'Do lion sabhailteachta deireanach.';

  @override
  String get vashModeDescription =>
      'Roghnoidh tu an dara cod PIN. Ma chuirtear iallach ort Hash a oscailt la eigin, cuir isteach an cod seo in ait do ghnath-PIN.\n\nOscloidh an aip mar is gnath, ach beidh do chuid comhraite agus teagmhalacha imithe.\n\nD\'aon duine ata ag feachaint ar do scailean, ta cuma fholamh ar Hash - mar nach ndearna tu e a usaid riamh.';

  @override
  String get vashModeIrreversible =>
      'Ta an gniomh seo ciuin agus do-aischuirthe.';

  @override
  String get chooseVashCode => 'Roghnaigh mo chod Vash';

  @override
  String get vashCodeInfo =>
      'An dara cod PIN a osclaionn an aip mar is gnath, ach folamh.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Ma chuireann tu an cod seo isteach in ait do PIN:';

  @override
  String get vashDeleteContacts => 'Imionn do theagmhalacha';

  @override
  String get vashDeleteMessages => 'Imionn do chuid comhraite';

  @override
  String get vashDeleteHistory => 'Imionn do notai';

  @override
  String get vashKeepId =>
      'Fanann d\'aitheantas Hash (#XXX-XXX-XXX) mar an gceanna';

  @override
  String get vashAppearNormal =>
      'Beidh cuma normalta ar an aip ach folamh, mar a bhi si nua. Ta an gniomh seo do-aischuirthe.';

  @override
  String get setupVashCode => 'Socraigh an cod Vash';

  @override
  String get modifyVashCode => 'Athraigh an cod Vash';

  @override
  String get currentVashCode => 'Cod Vash reatha';

  @override
  String get newVashCode => 'Cod Vash nua';

  @override
  String get confirmVashCode => 'Deimhnigh an cod Vash';

  @override
  String get vashCodeConfigured => 'Cod Vash socraithe';

  @override
  String get vashCodeModified => 'Cod Vash athraithe';

  @override
  String get vashCodeMustDiffer =>
      'Caithfidh an cod Vash a bheith difriuil on chod PIN';

  @override
  String get incorrectVashCode => 'Cod Vash micheart';

  @override
  String get vashWhatToDelete =>
      'Cad ba mhaith leat a chur ar ceal le Modh Vash?';

  @override
  String get vashDeleteContactsOption => 'Teagmhalacha';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Teachtaireachtai';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notai';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Modh Vash gniomhachtaithe';

  @override
  String get vashCreateSubtitle => 'Roghnaigh cod difriuil o do phriomh-PIN';

  @override
  String get vashConfirmSubtitle => 'Deimhnigh do chod Vash';

  @override
  String get pinCodeForEntry => 'Cod PIN chun an aip a oscailt';

  @override
  String get vashCodeSection => 'Modh Vash';

  @override
  String get biometric => 'Biomeadrach';

  @override
  String get biometricUnlock => 'Dighlasal le mearloirg no Face ID';

  @override
  String get enableBiometric => 'Cumasaigh biomeadrach';

  @override
  String get biometricWarningMessage =>
      'Tri biomeadrach a chumasiu, ni bheidh tu in ann do chod Vash a usaid chun an aip a oscailt.\n\nNi bheidh tu in ann an cod Vash a usaid ach amhain ma theipeann ar an mbiomeadrach (tar eis roinnt iarrachtai teipthe).\n\nAn bhfuil tu cinnte gur mhaith leat leanunt ar aghaidh?';

  @override
  String get understood => 'Tuigim';

  @override
  String get shareAppSubtitle => 'Roinn Hash le do chairde';

  @override
  String get share => 'Roinn';

  @override
  String get danger => 'Conturt';

  @override
  String get deleteAccount => 'Scrios mo chuntas';

  @override
  String get deleteAccountSubtitle => 'Gniomh do-aischuirthe';

  @override
  String get deleteAccountConfirmTitle => 'Scrios mo chuntas';

  @override
  String get deleteAccountConfirmMessage =>
      'Scriosfar do chuntas go buan. Ta an gniomh seo do-aischuirthe.\n\n- Do chuid comhraite go leir\n- Do chuid teagmhalacha go leir\n- Do Hash ID\n\nBeidh ort cuntas nua a chruthu.';

  @override
  String get deleteForever => 'Scrios go buan';

  @override
  String get cancel => 'Cealaigh';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Modh Vash gniomhachtaithe.';

  @override
  String deletionError(String error) {
    return 'Earraid le linn scriosta: $error';
  }

  @override
  String get yourSecurity => 'Do shlandail';

  @override
  String get securityInfo =>
      '- Criptiuchain ceann go ceann (Protocal Signal)\n- Gan sonrai ar ar bhfreastalairi tar eis seachadadh\n- Eochracha storaite ar do ghleas amhain\n- Cod PIN nach seoltar chuig an bhfreastalai riamh';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Failte';

  @override
  String get securityStatement1 => 'Ta do chuid teachtaireachtai cosanta.';

  @override
  String get securityStatement2 => 'Criptiuchain ceann go ceann.';

  @override
  String get securityStatement3 => 'Gan rian. Gan comhreiteach.';

  @override
  String get securityStatement4 => 'Is ceart e do phriobhaideachas.';

  @override
  String get accessBlocked => 'Rochtain blocailte';

  @override
  String get tooManyAttempts =>
      'An iomarca iarrachtai. Bain triail eile as nios deanai.';

  @override
  String get pleaseWait => 'Fan le do thoil';

  @override
  String get waitDelay => 'Fan go dti go mbeidh an mhoill thart';

  @override
  String attemptCount(int current, int max) {
    return 'Iarracht $current as $max';
  }

  @override
  String retryIn(String time) {
    return 'Bain triail eile as i $time';
  }

  @override
  String get forgotPin => 'PIN dearmadta? Usaid an frasa aisghabhala';

  @override
  String get useRecoveryPhrase => 'Usaid an frasa aisghabhala';

  @override
  String get recoveryWarningTitle => 'Rabhadh';

  @override
  String get recoveryWarningMessage => 'Deanfaidh aisghabháil an chuntais:';

  @override
  String get recoveryDeleteAllMessages =>
      'DO chuid teachtaireachtai GO LEIR a scriosadh';

  @override
  String get recoveryWaitDelay => 'Moill 1 uair an chloig a fhorchur';

  @override
  String get recoveryKeepContacts => 'Do chuid teagmhalacha a choinneal';

  @override
  String get recoveryIrreversible =>
      'Ta an gniomh seo do-aischuirthe. Caillfear do chuid teachtaireachtai go buan.';

  @override
  String get iUnderstand => 'Tuigim';

  @override
  String get accountRecovery => 'Aisghabháil an chuntais';

  @override
  String get enterRecoveryPhrase =>
      'Cuir isteach na 24 focal i d\'fhrasa aisghabhala, scartha le spasanna.';

  @override
  String get recoveryPhraseHint => 'focal1 focal2 focal3 ...';

  @override
  String get recover => 'Aisghabh';

  @override
  String get recoveryPhraseRequired =>
      'Cuir isteach d\'fhrasa aisghabhala le do thoil';

  @override
  String get recoveryPhrase24Words => 'Caithfidh go mbeadh 24 focal san fhrasa';

  @override
  String get incorrectRecoveryPhrase => 'Frasa aisghabhala micheart';

  @override
  String get recoveryInitError => 'Earraid agus an t-aisghabháil a thosu';

  @override
  String get securityDelay => 'Moill slandala';

  @override
  String get securityDelayMessage =>
      'Ar mhaithe le do shlandail, ta moill ag teastail sula feidir PIN nua a chruthu.';

  @override
  String get timeRemaining => 'Am fagtha';

  @override
  String get messagesDeletedForProtection =>
      'Scriosadh do chuid teachtaireachtai ar mhaithe le do chosaint.';

  @override
  String get canCloseApp =>
      'Is feidir leat an aip a dhunadh agus filleadh nios deanai.';

  @override
  String get onboardingTitle1 => 'Failte go Hash';

  @override
  String get onboardingSubtitle1 =>
      'An aip teachtaireachtai nach bhfagann rian ar bith';

  @override
  String get onboardingTitle2 => 'Criptiuchain iomlan';

  @override
  String get onboardingSubtitle2 =>
      'Ta do chuid teachtaireachtai criptithe ceann go ceann le protocal Signal';

  @override
  String get onboardingTitle3 => 'Gan rian';

  @override
  String get onboardingSubtitle3 =>
      'Scriostar teachtaireachtai on bhfreastalai chomh luath agus a sheachadtar iad';

  @override
  String get onboardingTitle4 => 'Do shlandail';

  @override
  String get onboardingSubtitle4 => 'Cod PIN, Modh Vash agus frasa aisghabhala';

  @override
  String get getStarted => 'Tosu';

  @override
  String get next => 'Ar aghaidh';

  @override
  String get skip => 'Sceip';

  @override
  String get alreadyHaveAccount => 'Ta cuntas agam cheana';

  @override
  String get transferMyAccount => 'Aistrigh mo chuntas';

  @override
  String get createPin => 'Cruthaigh cod PIN';

  @override
  String get createPinSubtitle => 'Cosnaionn an cod seo rochtain ar d\'aip';

  @override
  String get confirmYourPin => 'Deimhnigh do chod PIN';

  @override
  String get confirmPinSubtitle => 'Cuir isteach do chod PIN aris';

  @override
  String get saveRecoveryPhrase => 'Frasa aisghabhala';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Scriobh sios na 24 focal seo in ord. Ligfidh siad duit do chuntas a aisghabháil ma dheanann tu dearmad ar do PIN.';

  @override
  String get phraseWritten => 'Scriobh me sios mo fhrasa';

  @override
  String get warningRecoveryPhrase =>
      'Ma chailleann tu an fhrasa seo agus ma dheanann tu dearmad ar do PIN, caillfidh tu rochtain ar do chuntas.';

  @override
  String get accountTransferred => 'Cuntas aistrithe';

  @override
  String get accountTransferredMessage =>
      'Aistriodh do chuntas go gleas eile. Nil an seisiun seo baili a thuilleadh.';

  @override
  String get accountTransferredInfo =>
      'Mura tusa a rinne an t-aistriu seo, b\'fheidir go bhfuil do chuntas i mbaol.';

  @override
  String get logout => 'Logail amach';

  @override
  String get transferAccount => 'Aistrigh an cuntas';

  @override
  String get transferAccountInfo =>
      'Aistrigh do chuntas Hash go gleas nua. Cuirfear do sheisiun reatha ar neamhni.';

  @override
  String get generateTransferCode => 'Gin cod aistrithe';

  @override
  String get transferCode => 'Cod aistrithe';

  @override
  String transferCodeExpires(int minutes) {
    return 'Rachaidh an cod seo in eag i $minutes noimead';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Cuir isteach an cod seo ar do ghleas nua chun do chuntas a aistriu.';

  @override
  String get generateNewCode => 'Gin cod nua';

  @override
  String get scanQrCode => 'Scan cod QR';

  @override
  String get scanQrCodeSubtitle => 'Scan cod QR teagmhala chun iad a chur leis';

  @override
  String get qrCodeDetected => 'Cod QR aimsithe';

  @override
  String get invalidQrCode => 'Cod QR neamhbhaili';

  @override
  String get cameraPermissionRequired => 'Cead ceamara ag teastail';

  @override
  String get myQrCode => 'Mo chod QR';

  @override
  String get myQrCodeSubtitle =>
      'Roinn an cod QR seo le go bhfeadfaidh do theagmhalacha thu a chur leis';

  @override
  String get shareQrCode => 'Roinn';

  @override
  String get addContactTitle => 'Cuir teagmhail leis';

  @override
  String get addContactByHashId => 'Cuir isteach Hash ID do theagmhala';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Cuardaigh';

  @override
  String get contactNotFound => 'Teagmhail gan aimsiu';

  @override
  String get contactAlreadyAdded => 'Ta an teagmhail seo i do liosta cheana';

  @override
  String get contactAdded => 'Teagmhail curtha leis';

  @override
  String get myProfile => 'Mo phroifil';

  @override
  String get myProfileSubtitle =>
      'Roinn an fhaisneis seo le go bhfeadfar thu a chur leis';

  @override
  String get temporaryCode => 'Cod sealadach';

  @override
  String temporaryCodeExpires(String time) {
    return 'In eag i $time';
  }

  @override
  String get codeExpired => 'Cod imithe in eag';

  @override
  String get generateNewCodeButton => 'Cod nua';

  @override
  String get copyHashId => 'Coipeail an ID';

  @override
  String get copyCode => 'Coipeail an cod';

  @override
  String get copiedToClipboard => 'Coipeailte';

  @override
  String get showMyQrCode => 'Taispeain mo chod QR';

  @override
  String get orDivider => 'no';

  @override
  String get openScanner => 'Oscail an scanoir';

  @override
  String get addManually => 'Cuir leis de laimh';

  @override
  String get contactHashIdLabel => 'Hash ID an teagmhala';

  @override
  String get temporaryCodeLabel => 'Cod sealadach';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Iarr ar do theagmhail cod a ghinniunt ona bproifil';

  @override
  String get verifyAndAdd => 'Fioraigh agus cuir leis';

  @override
  String get fillAllFields => 'Lion gach reimse le do thoil';

  @override
  String get invalidHashIdFormat =>
      'Formaid ID neamhbhaili (m.sh: 123-456-ABC)';

  @override
  String get userNotFound => 'Usaideoir gan aimsiu';

  @override
  String get cannotAddYourself => 'Ni feidir leat tu fein a chur leis';

  @override
  String get invalidOrExpiredCode =>
      'Cod sealadach neamhbhaili no imithe in eag';

  @override
  String get contactFound => 'Teagmhail aimsithe!';

  @override
  String get howToCallContact => 'Cen t-ainm a thabharfaidh tu air/uirthi?';

  @override
  String get contactNameHint => 'Ainm an teagmhala';

  @override
  String get addContactButton => 'Cuir leis';

  @override
  String get contactDetails => 'Sonrai an teagmhala';

  @override
  String get contactName => 'Ainm an teagmhala';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Curtha leis ar $date';
  }

  @override
  String get deleteContact => 'Scrios an teagmhail';

  @override
  String deleteContactConfirm(Object name) {
    return 'Scrios an teagmhail seo?';
  }

  @override
  String get deleteContactMessage =>
      'Scriosfaidh an gniomh seo an comhra ar fad freisin.';

  @override
  String get delete => 'Scrios';

  @override
  String get typeMessage => 'Scriobh teachtaireacht...';

  @override
  String get messageSent => 'Seolta';

  @override
  String get messageDelivered => 'Seachadta';

  @override
  String get messageRead => 'Leite';

  @override
  String get messageFailed => 'Theip ar sheoladh';

  @override
  String get now => 'Anois';

  @override
  String minutesAgo(int count) {
    return '${count}noi';
  }

  @override
  String hoursAgo(int count) {
    return '${count}u';
  }

  @override
  String daysAgo(int count) {
    return '${count}l';
  }

  @override
  String get today => 'Inniu';

  @override
  String get yesterday => 'Inne';

  @override
  String dateAtTime(String date, String time) {
    return '$date ag $time';
  }

  @override
  String get shareMessage =>
      'Bi liom ar Hash! 🔒\n\nIs aip teachtaireachtai fior-phriobhaideach i: criptiuchain iomlan, gan rian ar na freastalairi, agus modh scanraidh mas ga.\n\nIosladail an aip anseo 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Earraid';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Feach';

  @override
  String get yes => 'Ta';

  @override
  String get no => 'Nil';

  @override
  String get save => 'Sabhail';

  @override
  String get edit => 'Cuir in eagar';

  @override
  String get close => 'Dun';

  @override
  String get confirm => 'Deimhnigh';

  @override
  String get loading => 'Ag lodail...';

  @override
  String get retry => 'Bain triail eile as';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Iarratais faighte';

  @override
  String get noPendingRequests => 'Gan iarratas ar feitheamh';

  @override
  String get pendingRequestsSubtitle =>
      'Ba mhaith leis na daoine seo thu a chur leis';

  @override
  String requestFromUser(String hashId) {
    return 'Iarratas o $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'In eag i $days la';
  }

  @override
  String get acceptRequest => 'Glac leis';

  @override
  String get rejectRequest => 'Diultaigh';

  @override
  String get requestAccepted => 'Iarratas glactha';

  @override
  String get requestRejected => 'Iarratas diultaithe';

  @override
  String get requestSent => 'Iarratas seolta!';

  @override
  String get requestSentSubtitle =>
      'Seoladh d\'iarratas. Caithfidh an t-usaideoir glacadh leis sula feidir libh comhra.';

  @override
  String get requestAlreadyPending => 'Ta iarratas ar feitheamh cheana';

  @override
  String get requestAlreadySentByOther =>
      'Sheol an duine seo iarratas chugat cheana';

  @override
  String get addByHashId => 'Cuir leis le Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Cuir isteach Hash ID agus cod sealadach an teagmhala';

  @override
  String get enterTemporaryCode => 'Cuir isteach an cod 6 dhigit';

  @override
  String get sendRequest => 'Seol an t-iarratas';

  @override
  String get acceptContactTitle => 'Glac leis an teagmhail';

  @override
  String get acceptContactSubtitle =>
      'Is feidir leat ainm pearsantaithe a thabhairt do/di';

  @override
  String get leaveEmptyForHashId => 'Fag folamh chun an Hash ID a usaid';

  @override
  String get firstName => 'Ceadainm';

  @override
  String get lastName => 'Sloinne';

  @override
  String get notes => 'Notai';

  @override
  String get notesHint => 'Notai pearsanta faoin teagmhail seo';

  @override
  String get photoOptional => 'Grianghraf (roghnach)';

  @override
  String get contactNameOptional => 'Ainm (roghnach)';

  @override
  String get notesOptional => 'Notai (roghnach)';

  @override
  String get storedLocally => 'Storailte ar do ghleas amhain';

  @override
  String get encryptedMessageLabel => 'Teachtaireacht chriptithe';

  @override
  String get identityMessageHint =>
      'Ce thu fein? Conas a bhfuil aithne agaibh ar a cheile?';

  @override
  String get messageWillBeSentEncrypted =>
      'Criptiofar an teachtaireacht seo agus seolfar chuig an bhfaighteoir i';

  @override
  String get sendRequestButton => 'Seol an t-iarratas';

  @override
  String get requestExpiresIn24h =>
      'Rachaidh an t-iarratas in eag i 24u mura nglactar leis';

  @override
  String get theyAlreadySentYouRequest =>
      'Sheol an duine seo iarratas chugat cheana';

  @override
  String get requests => 'Iarratais';

  @override
  String get receivedRequests => 'Faighte';

  @override
  String get sentRequests => 'Seolta';

  @override
  String get noSentRequests => 'Gan iarratas seolta';

  @override
  String get cancelRequest => 'Cealaigh';

  @override
  String get deleteRequest => 'Scrios an t-iarratas';

  @override
  String get requestCancelled => 'Iarratas cealaithe';

  @override
  String sentTo(String hashId) {
    return 'Seolta chuig $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'In eag i $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Faighte $time o shin';
  }

  @override
  String get messageFromRequester => 'Teachtaireacht on iarratasoir';

  @override
  String get copy => 'Coipeail';

  @override
  String get messageInfo => 'Eolas teachtaireachta';

  @override
  String get messageDirection => 'Treo';

  @override
  String get messageSentByYou => 'Seolta agatsa';

  @override
  String get messageReceived => 'Faighte';

  @override
  String get messageSentAt => 'Seolta ar';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Stadas';

  @override
  String get messageReadAt => 'Leite ar';

  @override
  String get messageType => 'Cineal';

  @override
  String get messageSize => 'Meid';

  @override
  String get messageExpiresAt => 'In eag ar';

  @override
  String get messageEncrypted => 'Criptithe ceann go ceann';

  @override
  String get messageStatusSending => 'A sheoladh...';

  @override
  String get messageStatusSent => 'Seolta';

  @override
  String get messageStatusDelivered => 'Seachadta';

  @override
  String get messageStatusRead => 'Leite';

  @override
  String get messageStatusFailed => 'Theip';

  @override
  String get serverStatus => 'Freastalai';

  @override
  String get onServer => 'Ag feitheamh le seachadadh';

  @override
  String get deletedFromServer => 'Scriosta';

  @override
  String get messageTypeText => 'Teacs';

  @override
  String get messageTypeImage => 'Iomha';

  @override
  String get messageTypeVideo => 'Fisean';

  @override
  String get messageTypeVoice => 'Fuaim';

  @override
  String get messageTypeFile => 'Comhad';

  @override
  String get indefinitely => 'Go neamhtheoranta';

  @override
  String get hoursShort => 'u';

  @override
  String get minutesShort => 'noi';

  @override
  String get hours => 'uaireanta';

  @override
  String get minutes => 'noimeid';

  @override
  String get seconds => 'soicindi';

  @override
  String get ephemeralMessages => 'Teachtaireachtai gearrshaolach';

  @override
  String get ephemeralMessagesDescription =>
      'Scriostar teachtaireachtai go huathobrioch tar eis an ama seo';

  @override
  String get ephemeralImmediate => 'Laithreach';

  @override
  String get ephemeralImmediateDesc => 'Scriosta chomh luath agus a leitear';

  @override
  String get ephemeralMyPreference => 'Mo rogha';

  @override
  String get ephemeralMyPreferenceDesc => 'Usaid an socru domhanda';

  @override
  String get ephemeralDefaultSetting => 'Fad na dteachtaireachtai';

  @override
  String get ephemeralChooseDefault => 'Molta';

  @override
  String get ephemeral30Seconds => '30 soicind';

  @override
  String get ephemeral30SecondsDesc => 'Scriosta 30s tar eis leitheoireachta';

  @override
  String get ephemeral5Minutes => '5 noimead';

  @override
  String get ephemeral5MinutesDesc => 'Scriosta 5noi tar eis leitheoireachta';

  @override
  String get ephemeral1Hour => '1 uair';

  @override
  String get ephemeral1HourDesc => 'Scriosta 1u tar eis leitheoireachta';

  @override
  String get ephemeral3Hours => '3 huaire';

  @override
  String get ephemeral6Hours => '6 huaire';

  @override
  String get ephemeral6HoursDesc => 'Scriosta 6u tar eis leitheoireachta';

  @override
  String get ephemeral12Hours => '12 uair';

  @override
  String get ephemeral24Hours => '24 uair';

  @override
  String get ephemeral24HoursDesc => 'Scriosta 24u tar eis leitheoireachta';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Fad saincheaptha';

  @override
  String get howItWorks => 'Conas a oibrionn se?';

  @override
  String get ephemeralExplanation1 =>
      'Scriostar teachtaireachtai on bhfreastalai chomh luath agus a fhaightear iad.';

  @override
  String get ephemeralExplanation2 =>
      'Socraionn an socru seo cathain a imionn teachtaireachtai o DO ghuthan tar eis iad a leamh.';

  @override
  String get ephemeralExplanation3 =>
      'Ta a shocru fein ag do theagmhail da ghuthan fein.';

  @override
  String get mute1Hour => '1 uair';

  @override
  String get mute8Hours => '8 n-uaire';

  @override
  String get mute1Day => '1 la';

  @override
  String get mute1Week => '1 seachtain';

  @override
  String get muteAlways => 'I gconai';

  @override
  String get muteExplanation =>
      'Ni bhfaighidh tu fograi don teagmhail seo a thuilleadh';

  @override
  String get showCallsInRecents => 'Taispeain i nglaonna le deanai';

  @override
  String get showCallsInRecentsSubtitle =>
      'Beidh glaonna Hash le feiceail i stair ghlaonna an ghuthain';

  @override
  String get feedback => 'Aiseolas';

  @override
  String get muteNotifications => 'Ciunaigh fograi';

  @override
  String get muteDescription => 'Ni bhfaighidh tu fograi don teagmhail seo';

  @override
  String mutedUntil(String time) {
    return 'Ciunaithe go dti $time';
  }

  @override
  String get notMuted => 'Fograi gniomhachtaithe';

  @override
  String get unmute => 'Diciunaigh';

  @override
  String get notificationSound => 'Fuaim fogra';

  @override
  String get defaultSound => 'Reamhshocru';

  @override
  String get chatSettings => 'Socruithe comhra';

  @override
  String get bubbleColor => 'Dath na mbolgan';

  @override
  String get backgroundColor => 'Dath an chulra';

  @override
  String get backgroundImage => 'Iomha chulra';

  @override
  String get chatBackground => 'Culra an chomhra';

  @override
  String get customColor => 'Saincheaptha';

  @override
  String get defaultColor => 'Reamhshocru';

  @override
  String get imageSelected => 'Iomha roghnaithe';

  @override
  String get noImage => 'Gan iomha';

  @override
  String get color => 'Dath';

  @override
  String get image => 'Iomha';

  @override
  String get tapToSelectImage => 'Bruigh chun iomha a roghnu';

  @override
  String get changeImage => 'Athraigh an iomha';

  @override
  String get previewMessageReceived => 'Dia duit!';

  @override
  String get previewMessageSent => 'Haigh!';

  @override
  String get messageAction => 'Teachtaireacht';

  @override
  String get callAction => 'Glao';

  @override
  String get videoAction => 'Fisean';

  @override
  String get personalNotes => 'Notai pearsanta';

  @override
  String get addNotes => 'Cuir notai leis...';

  @override
  String get noNotes => 'Gan nota';

  @override
  String get messageNotifications => 'Fograi teachtaireachtai';

  @override
  String get callNotifications => 'Fograi glaonna';

  @override
  String get useGradient => 'Usaid gradan';

  @override
  String get gradientStart => 'Dath tosaigh';

  @override
  String get gradientEnd => 'Dath deiridh';

  @override
  String get preview => 'Reamhamharc';

  @override
  String get reset => 'Athshocraigh';

  @override
  String get securityNumber => 'Uimhir shlándála';

  @override
  String securityNumberDescription(String name) {
    return 'Fioraigh go meaitsealann an uimhir shlándála le gleas $name';
  }

  @override
  String get verifyEncryption => 'Fioraigh an criptiuchain ceann go ceann';

  @override
  String get tapToCopy => 'Bruigh chun coipeail';

  @override
  String get howToVerify => 'Conas fioiru';

  @override
  String get verifyStep1 =>
      'Buail le do theagmhail go pearsanta no cuir glao orthu';

  @override
  String get verifyStep2 =>
      'Cuir na huimhreacha slandala no na coid QR i gcomparaid';

  @override
  String get verifyStep3 => 'Ma mheaitsealann siad, ta do chomhra slan';

  @override
  String get scanToVerify => 'Scan chun fioiru';

  @override
  String get reportSpam => 'Tuairiscigh mar thruflais';

  @override
  String get reportSpamSubtitle => 'Tuairiscigh an teagmhail seo mar thruflais';

  @override
  String get reportSpamDescription =>
      'Tuairiscitear an teagmhail seo go hanaithnid. Ni roinnfear d\'aitheantas. An bhfuil tu cinnte?';

  @override
  String get report => 'Tuairiscigh';

  @override
  String get spamReported => 'Truflais tuairiscithe';

  @override
  String get reportError =>
      'Theip ar sheoladh na tuairisce. Bain triail eile as.';

  @override
  String get reportRateLimited =>
      'Shroich tu an t-uaslion tuairisci don la inniu.';

  @override
  String get blockContact => 'Blocail an teagmhail';

  @override
  String get blockContactDescription =>
      'Ni bheidh an teagmhail seo in ann teachtaireachtai a sheoladh chugat na glao a chur ort. Ni chuirfear ar an eolas e/i.';

  @override
  String get unblockContact => 'Dibhlocail an teagmhail';

  @override
  String get unblockContactDescription =>
      'Beidh an teagmhail seo in ann teachtaireachtai a sheoladh chugat agus glao a chur ort aris.';

  @override
  String get contactBlocked => 'Teagmhail blocailte';

  @override
  String get contactUnblocked => 'Teagmhail dibhlocailte';

  @override
  String get contactIsBlocked => 'Ta an teagmhail seo blocailte';

  @override
  String get unblock => 'Dibhlocail';

  @override
  String get deleteContactSubtitle => 'Scrios an teagmhail seo agus an comhra';

  @override
  String get confirmWithPin => 'Deimhnigh le PIN';

  @override
  String get enterPinToConfirm =>
      'Cuir isteach do PIN chun an gniomh seo a dheimhniu';

  @override
  String get profilePhoto => 'Grianghraf proifil';

  @override
  String get takePhoto => 'Glac grianghraf';

  @override
  String get chooseFromGallery => 'Roghnaigh on danlann';

  @override
  String get removePhoto => 'Bain an grianghraf';

  @override
  String get viewContactHashId => 'Feach ar aitheantoir an teagmhala';

  @override
  String get hashIdPartiallyMasked =>
      'Masctha go pairtigh ar mhaithe le do shlandail agus slandail do theagmhala';

  @override
  String get addFirstContact => 'Cuir do chead teagmhail leis';

  @override
  String get addFirstContactSubtitle => 'Roinn do chod QR no scan ceann cara';

  @override
  String get directory => 'Eolai';

  @override
  String get noContacts => 'Gan teagmhail';

  @override
  String get noContactsSubtitle => 'Cuir teagmhail leis chun tosu';

  @override
  String get sendMessageAction => 'Seol teachtaireacht';

  @override
  String get audioCall => 'Glao fuaime';

  @override
  String get videoCall => 'Glao fiseain';

  @override
  String get viewProfile => 'Feach ar an bproifil';

  @override
  String get deleteContactDirectory => 'Scrios an teagmhail';

  @override
  String get scanShort => 'Scan';

  @override
  String get addShort => 'Cuir leis';

  @override
  String deleteContactConfirmName(String name) {
    return 'An bhfuil tu cinnte gur mhaith leat $name a scriosadh?';
  }

  @override
  String get noNotesTitle => 'Gan nota';

  @override
  String get noNotesSubtitle => 'Cruthaigh do chead nota';

  @override
  String get newNote => 'Nota nua';

  @override
  String get editNote => 'Cuir an nota in eagar';

  @override
  String get deleteNote => 'Scrios an nota';

  @override
  String get deleteNoteConfirm =>
      'An bhfuil tu cinnte gur mhaith leat an nota seo a scriosadh?';

  @override
  String get noteTitle => 'Teideal';

  @override
  String get noteContent => 'Abhar';

  @override
  String get addItem => 'Cuir mir leis';

  @override
  String get pinNote => 'Pionnail';

  @override
  String get unpinNote => 'Diphionnail';

  @override
  String get noteColor => 'Dath';

  @override
  String get notePassword => 'Pasfhocal';

  @override
  String get setPassword => 'Socraigh pasfhocal';

  @override
  String get changePassword => 'Athraigh pasfhocal';

  @override
  String get removePassword => 'Bain pasfhocal';

  @override
  String get enterPassword => 'Cuir isteach an pasfhocal';

  @override
  String get confirmPassword => 'Deimhnigh an pasfhocal';

  @override
  String get passwordPin => 'Cod PIN';

  @override
  String get passwordText => 'Pasfhocal teacs';

  @override
  String get protectedNote => 'Nota cosanta';

  @override
  String get incorrectPassword => 'Pasfhocal micheart';

  @override
  String get passwordSet => 'Pasfhocal socraithe';

  @override
  String get passwordRemoved => 'Pasfhocal bainte';

  @override
  String get notesBiometric => 'Face ID do notai';

  @override
  String get notesBiometricSubtitle =>
      'Fiordheimnhiu bithmheadrach a eileamh chun notai cosanta a oscailt';

  @override
  String get textNote => 'Nota teacs';

  @override
  String get checklistNote => 'Liosta seiceala';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tasc';
  }

  @override
  String get autoSaved => 'Sabhailte';

  @override
  String get searchNotes => 'Cuardaigh nota';

  @override
  String get legalConsent => 'Toiliu dlithiuil';

  @override
  String get confirmAge13 =>
      'Deimhnim go bhfuil me 13 bliana d\'aois ar a laghad';

  @override
  String get acceptLegalStart => 'Glacaim leis an ';

  @override
  String get privacyPolicy => 'Polasai Priobhaideachais';

  @override
  String get termsOfService => 'Tearmai Seirbhise';

  @override
  String get andThe => ' agus na ';

  @override
  String get continueButton => 'Lean ar aghaidh';

  @override
  String get mustAcceptTerms =>
      'Caithfidh tu glacadh leis an da choinniol chun leanunt ar aghaidh';

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
  String get support => 'Tacaiocht';

  @override
  String get contactSupport => 'Dean teagmhail le tacaiocht';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Tuairiscigh mi-usaid';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Dlithiuil';

  @override
  String get legalEntity => 'Aonan dlithiuil';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Pionnail';

  @override
  String get unpinConversation => 'Diphionnail';

  @override
  String get hideConversation => 'Bain on snaithe';

  @override
  String get deleteConversation => 'Scrios an comhra';

  @override
  String get deleteConversationConfirm =>
      'Cuir isteach do chod PIN chun scriosadh gach teachtaireachta a dheimhniu';

  @override
  String get noConversations => 'Gan comhra';

  @override
  String get startConversation => 'Tosaigh';

  @override
  String get microphonePermissionRequired =>
      'Rochtain ar an micreafon ag teastail';

  @override
  String get microphonePermissionExplanation =>
      'Teastaionn an micreafon o Hash chun glaonna a dheanamh.';

  @override
  String get cameraPermissionExplanation =>
      'Teastaionn an ceamara o Hash le haghaidh fisglaonna.';

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
  String get openSettings => 'Oscail na socruithe';

  @override
  String get callConnecting => 'Ag nascadh...';

  @override
  String get callRinging => 'Ag glaoch...';

  @override
  String get callReconnecting => 'Ag athcheangal...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Ag athcheangal (${seconds}s)';
  }

  @override
  String get callPaused => 'Ar sos';

  @override
  String get callPausedSubtitle => 'Tá an glao fós gníomhach';

  @override
  String get callRemoteMicMuted => 'Micreafon an duine eile ciunaithe';

  @override
  String get callMiniControlsMute => 'Ciunaigh an micreafon';

  @override
  String get callMiniControlsUnmute => 'Gniomhachtaigh an micreafon';

  @override
  String get callMiniControlsHangUp => 'Cuir sios';

  @override
  String get callMiniControlsReturn => 'Fill ar an nglao';

  @override
  String get callNetworkPoor => 'Nasc eagobhsai';

  @override
  String get callNetworkLost => 'Nasc caillte';

  @override
  String get callEndedTitle => 'Glao criochnaithe';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Sonrai an ghleis';

  @override
  String get deviceDataSubtitle => 'Storail aitiuil agus freastalai';

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
  String get localStorage => 'Storail aitiuil';

  @override
  String get onThisDevice => 'ar an ngleas seo';

  @override
  String get encryptedDatabases => 'Bunachair shonrai chriptithe';

  @override
  String get files => 'Comhaid';

  @override
  String get secureKeychain => 'Slabhra eochracha slan';

  @override
  String get cache => 'Taisce';

  @override
  String get contactsDetail => 'Ainmneacha, avatair, eochracha Signal';

  @override
  String get messagesDetail => 'Comhraite criptithe';

  @override
  String get notesDetail => 'Notai pearsanta';

  @override
  String get signalSessions => 'Seisiuin Signal';

  @override
  String get signalSessionsDetail => 'Seisiuin chriptithe';

  @override
  String get pendingContacts => 'Teagmhalacha ar feitheamh';

  @override
  String get pendingContactsDetail => 'Iarratais ar siul';

  @override
  String get callHistory => 'Glaonna';

  @override
  String get callHistoryDetail => 'Stair na nglaonna';

  @override
  String get preferences => 'Roghanna';

  @override
  String get preferencesDetail => 'Roghanna mean agus glaonna';

  @override
  String get avatars => 'Avatair';

  @override
  String get media => 'Meain';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comhad',
      one: '1 chomhad',
      zero: 'gan comhad',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Gniomhach';

  @override
  String get notDefined => 'Gan sainmhiniu';

  @override
  String get biometrics => 'Bithmheadracht';

  @override
  String get recoveryPhrase => 'Frasa aisghabhala';

  @override
  String get identity => 'Aitheantas (Hash ID)';

  @override
  String get signalKeys => 'Eochracha Protocal Signal';

  @override
  String get authTokens => 'Comharthai fiordheimnhithe';

  @override
  String get contactNamesCache => 'Taisce ainmneacha teagmhalaithe';

  @override
  String get remoteConfig => 'Cumraiocht chianda';

  @override
  String get notificationPrefs => 'Roghanna fograi';

  @override
  String get serverData => 'Sonrai ar an bhfreastalai';

  @override
  String get serverDataInfo =>
      'Coinneann Hash iosmheid sonrai ar an bhfreastalai, iad go leir criptithe no sealadach.';

  @override
  String get serverProfile => 'Proifil';

  @override
  String get serverProfileDetail =>
      'Hash ID, eochracha poibli, comhartha bosca';

  @override
  String get serverPrekeys => 'Reamheochracha';

  @override
  String get serverPrekeysDetail => 'Eochracha Signal aon usaide (caite)';

  @override
  String get serverMessages => 'Teachtaireachtai ar bealach';

  @override
  String get serverMessagesDetail =>
      'Scriosta tar eis glactha (24u ar a mhead)';

  @override
  String get serverMedia => 'Meain ar bealach';

  @override
  String get serverMediaDetail => 'Scriosta tar eis iosladala';

  @override
  String get serverContactRequests => 'Iarratais teagmhala';

  @override
  String get serverContactRequestsDetail => 'In eag tar eis 24u';

  @override
  String get serverRateLimits => 'Teorainneacha rata';

  @override
  String get serverRateLimitsDetail => 'Sonrai sealadacha frith-mhi-usaide';

  @override
  String get privacyReassurance =>
      'Ni feidir le Hash do chuid teachtaireachtai a leamh. Ta gach sonrai criptithe ceann go ceann. Scriostar sonrai an fhreastalai go huathobrioch.';

  @override
  String get pinTooSimple =>
      'Ta an cod PIN seo ro-shimpli. Roghnaigh cod nios slaine.';

  @override
  String get genericError => 'Tharla earraid. Bain triail eile as le do thoil.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Ni feidir an cuntas a chruthu: $error';
  }

  @override
  String get phraseCopiedToClipboard =>
      'Frasa coipeailte chuig an ngearrthaisce';

  @override
  String get copyPhrase => 'Coipeail an fhrasa';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Scriobh sios an fhrasa seo in ait shlan. Ma chailleann tu do chod PIN gan an fhrasa seo, caillfidh tu rochtain ar do chuid sonrai go buan.';

  @override
  String get noMessages => 'Gan teachtaireacht';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Scrios gach teachtaireacht le $name?';
  }

  @override
  String get confirmation => 'Deimhniu';

  @override
  String get untitled => 'Gan teideal';

  @override
  String get noSessions => 'Gan seisiun';

  @override
  String get unknownContact => 'Teagmhail anaithnid';

  @override
  String get unnamed => 'Gan ainm';

  @override
  String get noPendingRequestsAlt => 'Gan iarratas ar feitheamh';

  @override
  String get deleteAllCallHistory => 'Scrios stair na nglaonna go leir?';

  @override
  String get noCalls => 'Gan glao';

  @override
  String get noPreferences => 'Gan rogha';

  @override
  String get resetAllMediaPrefs => 'Athshocraigh gach rogha mean?';

  @override
  String get deleteThisAvatar => 'Scrios an t-avatar seo?';

  @override
  String get deleteAllAvatars => 'Scrios gach avatar?';

  @override
  String get noAvatars => 'Gan avatar';

  @override
  String get deleteThisFile => 'Scrios an comhad seo?';

  @override
  String get deleteAllMediaFiles => 'Scrios gach mean?';

  @override
  String get noMediaFiles => 'Gan mean';

  @override
  String get outgoing => 'Amach';

  @override
  String get incoming => 'Isteach';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Amharc gearrshaolach: ${seconds}s';
  }

  @override
  String get normalView => 'Gnathamharc';

  @override
  String get callReasonCompleted => 'Criochnaithe';

  @override
  String get callReasonMissed => 'Caillte';

  @override
  String get callReasonDeclined => 'Diultaithe';

  @override
  String get callReasonFailed => 'Theip';

  @override
  String get justNow => 'Direach anois';

  @override
  String timeAgoMinutes(int count) {
    return '$count noi o shin';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}u o shin';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}l o shin';
  }

  @override
  String get messageTypeContact => 'Teagmhail';

  @override
  String get messageTypeLocation => 'Suiomh';

  @override
  String get statusQueued => 'I scuaine';

  @override
  String get blockedBadge => 'Blocailte';

  @override
  String get protectedBadge => 'Cosanta';

  @override
  String messageCount(int count) {
    return '$count teachtaireacht(ai)';
  }

  @override
  String get deleteQuestion => 'Scrios?';

  @override
  String get transferMyAccountTitle => 'Aistrigh mo chuntas';

  @override
  String get loadingError => 'Earraid ag lodail';

  @override
  String get transferToNewDevice => 'Aistrigh go gleas nua';

  @override
  String get transferInstructions =>
      'Ar do ghleas nua, roghnaigh \"Aisghabh mo chuntas\" agus cuir isteach an fhaisneis seo:';

  @override
  String get yourHashIdLabel => 'Do Hash ID';

  @override
  String get enterYourPinCode => 'Cuir isteach do chod PIN';

  @override
  String get pinOwnerConfirmation =>
      'Chun a dheimhniu gurb tusa uineir an chuntais seo';

  @override
  String get scanThisQrCode => 'Scan an cod QR seo';

  @override
  String get withYourNewDevice => 'Le do ghleas nua';

  @override
  String get orEnterTheCode => 'no cuir isteach an cod';

  @override
  String get transferCodeLabel => 'Cod aistrithe';

  @override
  String get proximityVerification => 'Fioiru congarachta';

  @override
  String get bringDevicesCloser =>
      'Tabhair na gleasanna nios congarai da cheile';

  @override
  String get confirmTransferQuestion => 'Deimhnigh an t-aistriu?';

  @override
  String get accountWillBeTransferred =>
      'Aistreofar do chuntas go dti an gleas nua.\n\nDeanfar an gleas seo a dhinascadh go buan.';

  @override
  String get transferComplete => 'Aistriu criochnaithe';

  @override
  String get transferSuccessMessage =>
      'D\'aistrigh do chuntas go rathiuil.\n\nDunfaidh an aip seo anois.';

  @override
  String get manualVerification => 'Fioiru laimhe';

  @override
  String get codeDisplayedOnBothDevices => 'Cod ar taispeaint ar an da ghleas:';

  @override
  String get doesCodeMatchNewDevice =>
      'An meaitsealann an cod seo leis an gceann ar an ngleas nua?';

  @override
  String get verifiedStatus => 'Fioraithe';

  @override
  String get inProgressStatus => 'Ar siul...';

  @override
  String get notAvailableStatus => 'Nil ar fail';

  @override
  String get codeExpiredRestart =>
      'Ta an cod imithe in eag. Tosaigh aris le do thoil.';

  @override
  String get codesDoNotMatchCancelled =>
      'Ni mheaitsealann na coid. Aistriu cealaithe.';

  @override
  String transferToDevice(String device) {
    return 'Chuig: $device';
  }

  @override
  String get copiedExclamation => 'Coipeailte!';

  @override
  String expiresInTime(String time) {
    return 'In eag i $time';
  }

  @override
  String get biometricNotAvailable =>
      'Nil bithmheadracht ar fail ar an ngleas seo';

  @override
  String get biometricAuthError =>
      'Earraid le linn fiordheimnhiu bithmheadrach';

  @override
  String get authenticateForBiometric =>
      'Dean fiordheimnhiu chun bithmheadracht a chumasiu le do thoil';

  @override
  String get biometricAuthFailed => 'Theip ar fhiordheimnhiu bithmheadrach';

  @override
  String get forceUpdateTitle => 'Nuashonru riachtanach';

  @override
  String get forceUpdateMessage =>
      'Ta leagan nua de Hash ar fail. Nuashonraigh le do thoil chun leanunt ar aghaidh.';

  @override
  String get updateButton => 'Nuashonraigh';

  @override
  String get maintenanceInProgress => 'Cothabháil ar siul';

  @override
  String get tryAgainLater => 'Bain triail eile as nios deanai le do thoil';

  @override
  String get information => 'Eolas';

  @override
  String get later => 'Nios deanai';

  @override
  String get doYouLikeHash => 'An maith leat Hash?';

  @override
  String get yourFeedbackHelps => 'Cuidioun d\'aiseolas linn an aip a fheabhsu';

  @override
  String get ratingTerrible => 'Uafasach';

  @override
  String get ratingBad => 'Dona';

  @override
  String get ratingOk => 'Ceart go leor';

  @override
  String get ratingGood => 'Maith';

  @override
  String get ratingExcellent => 'Ar fheabhas!';

  @override
  String get donationMessage =>
      'Is tionscadal neamhbhrabusach e Hash. Ligeann do thacaiocht duinn leanunt ag forbairt aip teachtaireachtai ata fior-phriobhaideach.';

  @override
  String get recentConnections => 'Naisc le deanai';

  @override
  String get loginInfoText =>
      'Taifeadtar gach dighlasal PIN go haitiuil. Ni choinnitear ach na 24 uair dheireanacha.';

  @override
  String get connectionCount => 'Nasc(anna)';

  @override
  String get periodLabel => 'Treimhse';

  @override
  String get historyLabel => 'Stair';

  @override
  String get noLoginRecorded => 'Gan nasc taifeadta';

  @override
  String get nextUnlocksAppearHere =>
      'Taispeanfar na chead dighlaslaithe eile anseo.';

  @override
  String get dataLocalOnly =>
      'Storailtar na sonrai seo ar do ghleas amhain agus ni sheoltar iad riamh.';

  @override
  String get currentSession => 'Reatha';

  @override
  String get todayLabel => 'Inniu';

  @override
  String get yesterdayLabel => 'Inne';

  @override
  String get justNowLabel => 'Direach anois';

  @override
  String minutesAgoLabel(int count) {
    return '$count noi o shin';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}u o shin';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}u ${minutes}noi o shin';
  }

  @override
  String get noMaintenancePlanned => 'Gan cothabháil beartaithe';

  @override
  String get everythingWorkingNormally => 'Ta gach rud ag oibriu mar is gnath';

  @override
  String get maintenanceTitle => 'Cothabháil';

  @override
  String get maintenanceActiveLabel => 'AR SIUL';

  @override
  String get maintenancePlannedLabel => 'BEARTAITHE';

  @override
  String get locking => 'Ag glasail...';

  @override
  String get newMessageNotification => 'Teachtaireacht nua';

  @override
  String get secExplainTitle => 'Conas a chosnaionn Hash thu';

  @override
  String get secExplainIntro =>
      'Ta Hash deartha ionas nach feidir le haon duine do chuid teachtaireachtai a leamh.';

  @override
  String get secExplainIntroSub =>
      'Ni feidir linn fein fiu.\nSeo conas a oibrionn se, minithe go simpli.';

  @override
  String get secJourneyLabel => 'AN TURAS';

  @override
  String get secJourneyTitle => 'Turas do theachtaireachta';

  @override
  String get secJourneySubtitle =>
      'O do mhear go dti scailean do theagmhala, ta gach ceim cosanta. Lean an cosan.';

  @override
  String get secStep1Title => 'Scriobhann tu do theachtaireacht';

  @override
  String get secStep1Desc =>
      'Closcriobbann tu \"Haigh!\" san aip. Ag an bpointe seo, nil an teachtaireacht ach i gcuimhne do ghuthain. Nior seoladh aon rud.';

  @override
  String get secStep2Title => 'Criptiuchain le Protocal Signal';

  @override
  String get secStep2Desc =>
      'Chomh luath agus a bhrunn tu \"Seol\", athraitear do theachtaireacht ina sraith carachtair dothagtha. Cosuil le do theachtaireacht a chur faoi ghlas i dtaisceadan nach bhfuil an eochair ach ag do theagmhail.';

  @override
  String get secStep3Title => 'Sealed Sender: an cludach dofheicthe';

  @override
  String get secStep3Desc =>
      'Samhlaigh go seolann tu litir sa phost, ach gan seoladh seoltora ar an gcludach. Sin direach a dheanann Hash. Fagtar an teachtaireacht i mbosca litreach anaithnid. Ni fhios don fhreastalai ce a sheol e.';

  @override
  String get secStep4Title => 'Ni fheiceann an freastalai aon rud';

  @override
  String get secStep4Desc =>
      'Ta rol an fhir phoist dhaill ag an bhfreastalai. Ni fhios do ach \"d\'fhag duine eigin rud i mbosca #A7X9\". Ni fhios do ce a sheol e, cad e, na ce do.';

  @override
  String get secStep4Highlight =>
      'Gan meiteashonrai storailte: gan seoladh IP, gan stampa ama, gan nasc idir seoltoir agus faighteoir.';

  @override
  String get secStep5Title => 'Faigheann do theagmhail an teachtaireacht';

  @override
  String get secStep5Desc =>
      'Bailionn guthan do theagmhala abhar a bhosca litreach anaithnid agus dicriptiunaionn se an teachtaireacht lena eochair phriobhaideach, nach bhfag a ghleas riamh. Taispeantar \"Haigh!\" ar a scailean.';

  @override
  String get secStep6Title => 'Imionn an teachtaireacht on bhfreastalai';

  @override
  String get secStep6Desc =>
      'Chomh luath agus a dheimhnionn do theagmhail go bhfuarthas i, scriosann an freastalai an teachtaireacht go buan. Gan bruscar, gan cartlann, gan cultaca. Scriostar fiu teachtaireachtai neamhleite go huathobrioch tar eis 24 uair.';

  @override
  String get secStep7Title => 'Eag aitiuil';

  @override
  String get secStep7Desc =>
      'Ar ghuthan do theagmhala, feinscriosann an teachtaireacht de reir an ama a roghnaigh tu: laithreach tar eis leitheoireachta, 5 noimead, 1 uair... is tusa a chinneann.';

  @override
  String get secJourneyConclusion =>
      'Toradh: neamhrian ar an bhfreastalai, neamhrian ar na gleasanna. Mhair an teachtaireacht an t-am a thog se i a leamh, ansin d\'imigh si.';

  @override
  String get secArchLabel => 'AILTIREACHT';

  @override
  String get secArchTitle => '5 shraith cosanta';

  @override
  String get secArchSubtitle =>
      'Ni bhraitheann Hash ar theicneolaiocht amhain. Neartaionn gach sraith na cinn eile. Fiu ma chuirtear sraith amhain i mbaol, fanann do shonrai slan.';

  @override
  String get secLayer1Title => 'Criptiuchain ceann go ceann';

  @override
  String get secLayer1Desc =>
      'Criptiunaitear gach teachtaireacht le heochair uathuil. Go simpli: fiu ma dhicriptiunaionn duine teachtaireacht amhain, ni feidir leo an chead cheann eile a dhicriptiuniu. Ta a ghlas fein ag gach teachtaireacht.';

  @override
  String get secLayer1Detail =>
      'Le haghaidh comhaid (grianghraif, fiseain, doicimeidi), usaideann Hash criptiuchain breise AES-256-GCM. Criptiunaitear an comhad sula bhfagann se do ghuthan.';

  @override
  String get secLayer2Title => 'Sealed Sender (anaithnideacht lionra)';

  @override
  String get secLayer2Desc =>
      'Seolann aipeanna teachtaireachtai traidisiunta do chuid teachtaireachtai le d\'aitheantas ceangailte. Cosuil le d\'ainm a scriobh ar an gcludach. Usaideann Hash boscai litreach anaithnide: fagann an freastalai an teachtaireacht gan fhios ce a sheol i.';

  @override
  String get secLayer2Detail =>
      'Toradh: fiu i gcas sceitheadh sonrai on bhfreastalai, ni feidir a athchruthu ce ata ag caint le ce.';

  @override
  String get secLayer3Title => 'Scriosadh uathobrioch';

  @override
  String get secLayer3Desc =>
      'Scriostar teachtaireachtai on bhfreastalai chomh luath agus a dheimhnionn an glacadh. Fiu mura mbailiter teachtaireacht riamh, scriostar go huathobrioch i tar eis 24 uair.';

  @override
  String get secLayer3Detail =>
      'Ar do ghuthan, feinscriosann teachtaireachtai de reir an ama a roghnaionn tu: laithreach, 5 noi, 15 noi, 30 noi, 1u, 3u, 6u no 12u.';

  @override
  String get secLayer4Title => 'Cosaint rochtana aitiuil';

  @override
  String get secLayer4Desc =>
      'Ta an aip cosanta ag cod PIN 6 dhigit agus/no bithmheadracht (Face ID, mearloirg). Tar eis an iomarca iarrachtai teipthe, glasailitar an aip le moill a mheadaionn le gach teip.';

  @override
  String get secLayer5Title => 'Bunachar sonrai faoi ghlas';

  @override
  String get secLayer5Desc =>
      'Ar thaobh an fhreastalai, ni feidir le haon usaideoir scriobh go direach sa bhunachar sonrai. Teann gach gniomh tri fheidmeanna slana a dheanann gach iarratas a fhioriu.';

  @override
  String get secLayer5Detail =>
      'Cosuil le cuntar bainc: ni leagann tu lamh ar an taisceadan fein riamh. Deanann tu iarratas, agus fioraionn an coras go bhfuil an ceart agat sula ngniomhaionn se.';

  @override
  String get secVashLabel => 'UATHUIL AR DOMHAN';

  @override
  String get secVashTitle => 'Modh Vash';

  @override
  String get secVashSubtitle =>
      'Coras slandala eigeandala nach bhfuil in aon aip teachtaireachtai eile.';

  @override
  String get secVashScenarioTitle => 'Samhlaigh an cas seo';

  @override
  String get secVashScenario1 => 'Faigheann duine rochtain ar do ghuthan';

  @override
  String get secVashScenario2 => 'Iarrtar do chod PIN ort';

  @override
  String get secVashScenario3 =>
      'Ba mhaith leat do shonrai go leir a scriosadh go prainneach';

  @override
  String get secVashSolutionTitle => 'An reiteach: dha chod PIN';

  @override
  String get secVashSolutionDesc => 'Cumraionn tu dha chod PIN eagsula i Hash:';

  @override
  String get secVashNormalCodeLabel => 'Gnathchod';

  @override
  String get secVashNormalCodeDesc =>
      'Osclaionn an aip mar is gnath le do shonrai go leir';

  @override
  String get secVashCodeLabel2 => 'Cod Vash';

  @override
  String get secVashCodeDescription =>
      'Osclaionn an aip mar is gnath... ach scriostar do shonrai go leir go ciuin sa chulra';

  @override
  String get secVashWhatHappensTitle => 'Cad a tharlaionn ina dhiaidh sin';

  @override
  String get secVashWhatHappensDesc =>
      'Osclaionn an aip mar is gnath. Gan folareamh, gan beochan amhrasach. Taispeanann an scailean aip fholamh direach, cosuil le gur direach i a shuiteail tu.\n\nI ndairire, scriosadh do chuid comhraite, teagmhalacha agus teachtaireachtai go leir go do-aisiompaithe i bhfaiteadh na sul.';

  @override
  String get secCallsLabel => 'GLAONNA & COMHAID';

  @override
  String get secCallsTitle => 'Ta gach rud criptithe';

  @override
  String get secCallsSubtitle =>
      'Ni hamhain na teachtaireachtai. Ta gach rud a theann tri Hash criptithe ceann go ceann.';

  @override
  String get secAudioCallTitle => 'Glaonna fuaime';

  @override
  String get secAudioCallDesc =>
      'Criptithe ceann go ceann tri WebRTC. Aisirítear an guth go direach idir gleasanna.';

  @override
  String get secVideoCallTitle => 'Fisglaonna';

  @override
  String get secVideoCallDesc =>
      'An teicneolaiocht cheanna, gach sruth criptithe go neamhspleach.';

  @override
  String get secPhotosTitle => 'Grianghraif & fiseain';

  @override
  String get secPhotosDesc =>
      'Criptithe i AES-256-GCM sula bhfagann siad do ghuthan.';

  @override
  String get secDocsTitle => 'Doicimeidi';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, aon chomhad. Ainm, meid agus abhar criptithe.';

  @override
  String get secAnonLabel => 'ANAITHNIDEACHT';

  @override
  String get secAnonTitle => 'Gan aitheantas ag teastail';

  @override
  String get secAnonSubtitle =>
      'Ni iarrann Hash do uimhir ghuthain na do riomhphost riamh. Aithnítear thu le Hash ID uathuil anaithnid.';

  @override
  String get secHashIdTitle => 'Do Hash ID';

  @override
  String get secHashIdDesc =>
      'Is e seo d\'aitheantoir uathuil. Ni nochtann se aon rud faut: na d\'ainm, na d\'uimhir, na do shuiomh. Cosuil le leasainm ata dodhéanta a nascadh le d\'fhioraitheantas.\n\nChun teagmhail a chur leis, roinneann tu do Hash ID no scanann tu cod QR. Sin e. Gan leabhar seoltai sioncronaithe, gan moltai \"Daoine a d\'fheadfadh aithne a chur orthu\".';

  @override
  String get secDataLabel => 'SONRAI';

  @override
  String get secDataTitle => 'Na rudai nach bhfuil a fhios ag Hash';

  @override
  String get secDataSubtitle =>
      'Is e an bealach is fearr chun do shonrai a chosaint na gan iad a bhailiu.';

  @override
  String get secNeverCollected => 'Ni bhailítear riamh';

  @override
  String get secNeverItem1 => 'Abhar na dteachtaireachtai';

  @override
  String get secNeverItem2 => 'Liosta teagmhalaithe';

  @override
  String get secNeverItem3 => 'Uimhir ghuthain';

  @override
  String get secNeverItem4 => 'Seoladh riomhphoist';

  @override
  String get secNeverItem5 => 'Seoladh IP';

  @override
  String get secNeverItem6 => 'Suiomh';

  @override
  String get secNeverItem7 => 'Meiteashonrai (ce ata ag caint le ce)';

  @override
  String get secNeverItem8 => 'Stair glaonna';

  @override
  String get secNeverItem9 => 'Leabhar seoltai';

  @override
  String get secNeverItem10 => 'Aitheantoir fograiochta';

  @override
  String get secTempStored => 'Storailte go sealadach';

  @override
  String get secTempItem1 => 'Hash ID anaithnid (aitheantoir uathuil)';

  @override
  String get secTempItem2 => 'Eochracha criptithe poibli';

  @override
  String get secTempItem3 =>
      'Teachtaireachtai criptithe ar bealach (24u ar a mhead)';

  @override
  String get secTempNote =>
      'Fiu na sonrai iosta seo ni ligeann siad d\'aithint. Nil do Hash ID nasctha le haon fhaisneis phearsanta.';

  @override
  String get secFooterTitle => 'Do phriobhaideachas, do shaoirse';

  @override
  String get secFooterDesc =>
      'Usaideann Hash na teicneolaiochta criptithe ceanna le haipeanna gairmiula is eiliti. Ta do chuid teachtaireachtai cosanta ag an matamaitic, ni ag gealluinti.';

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
