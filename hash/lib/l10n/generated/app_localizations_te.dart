// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'ఎలాంటి జాడ లేదు. ఎలాంటి రాజీ లేదు.';

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
  String get conversations => 'చాట్‌లు';

  @override
  String get contacts => 'పరిచయాలు';

  @override
  String get noConversation => 'చాట్‌లు లేవు';

  @override
  String get noConversationSubtitle =>
      'సురక్షితంగా చాట్ చేయడానికి ఒక పరిచయాన్ని జోడించండి';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count పెండింగ్ అభ్యర్థనలు',
      one: '1 పెండింగ్ అభ్యర్థన',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count పంపిన అభ్యర్థనలు పెండింగ్‌లో ఉన్నాయి',
      one: '1 పంపిన అభ్యర్థన పెండింగ్‌లో ఉంది',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'పరిచయాన్ని జోడించు';

  @override
  String get shareApp => 'యాప్‌ను షేర్ చేయి';

  @override
  String get newMessage => 'కొత్త సందేశం';

  @override
  String get newConversation => 'సందేశం పంపండి';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get myHashId => 'నా Hash ID';

  @override
  String get supportHash => 'Hash కు మద్దతు';

  @override
  String get supportHashSubtitle => 'Hash ఒక లాభాపేక్ష లేని ప్రాజెక్ట్';

  @override
  String get donate => 'విరాళం';

  @override
  String get appearance => 'రూపం';

  @override
  String get theme => 'థీమ్';

  @override
  String get themeAuto => 'ఆటోమేటిక్';

  @override
  String get themeAutoSubtitle => 'సిస్టమ్ సెట్టింగ్‌లను అనుసరిస్తుంది';

  @override
  String get themeDark => 'డార్క్';

  @override
  String get themeLight => 'లైట్';

  @override
  String get themeRecommendation =>
      'మెరుగైన గోప్యత కోసం డార్క్ థీమ్ సిఫార్సు చేయబడింది';

  @override
  String get language => 'భాష';

  @override
  String get languageAuto => 'ఆటోమేటిక్ (సిస్టమ్)';

  @override
  String get notifications => 'నోటిఫికేషన్‌లు';

  @override
  String get messages => 'సందేశాలు';

  @override
  String get calls => 'కాల్‌లు';

  @override
  String get vibration => 'వైబ్రేషన్';

  @override
  String get notificationContent => 'నోటిఫికేషన్ కంటెంట్';

  @override
  String get notificationContentFull => 'అన్నీ చూపించు';

  @override
  String get notificationContentFullDesc => 'పరిచయ పేరు మరియు సందేశ ప్రివ్యూ';

  @override
  String get notificationContentName => 'పేరు మాత్రమే';

  @override
  String get notificationContentNameDesc => 'పరిచయ పేరు మాత్రమే చూపిస్తుంది';

  @override
  String get notificationContentDiscrete => 'డిస్క్రీట్';

  @override
  String get notificationContentDiscreteDesc =>
      '\"కొత్త సందేశం\" మాత్రమే చూపిస్తుంది';

  @override
  String get security => 'భద్రత';

  @override
  String get howHashProtectsYou => 'Hash మిమ్మల్ని ఎలా రక్షిస్తుంది';

  @override
  String get howHashProtectsYouSubtitle => 'మీ భద్రతను అర్థం చేసుకోండి';

  @override
  String get accountSecurity => 'ఖాతా భద్రత';

  @override
  String get accountSecuritySubtitle => 'PIN, బయోమెట్రిక్స్, Vash మోడ్';

  @override
  String get blockScreenshots => 'స్క్రీన్‌షాట్‌లను బ్లాక్ చేయి';

  @override
  String get transferDevice => 'మరొక పరికరానికి బదిలీ చేయి';

  @override
  String get transferDeviceSubtitle => 'మీ ఖాతాను మైగ్రేట్ చేయండి';

  @override
  String get pinCode => 'PIN కోడ్';

  @override
  String get changePin => 'PIN కోడ్ మార్చు';

  @override
  String get currentPin => 'ప్రస్తుత PIN కోడ్';

  @override
  String get newPin => 'కొత్త PIN కోడ్';

  @override
  String get confirmPin => 'PIN కోడ్ నిర్ధారించు';

  @override
  String get pinChanged => 'PIN కోడ్ మార్చబడింది';

  @override
  String get incorrectPin => 'తప్పు PIN';

  @override
  String get pinsDoNotMatch => 'PIN లు సరిపోలడం లేదు';

  @override
  String get autoLock => 'ఆటో-లాక్';

  @override
  String get autoLockDelay => 'లాక్ ఆలస్యం';

  @override
  String get autoLockImmediate => 'వెంటనే';

  @override
  String get autoLockMinute => '1 నిమిషం';

  @override
  String autoLockMinutes(int count) {
    return '$count నిమిషాలు';
  }

  @override
  String get vashCode => 'Vash కోడ్';

  @override
  String get vashModeTitle => 'Vash మోడ్';

  @override
  String get vashModeExplanation => 'మీ అంతిమ భద్రతా జాల.';

  @override
  String get vashModeDescription =>
      'మీరు రెండవ PIN కోడ్‌ను ఎంచుకుంటారు. మిమ్మల్ని ఎప్పుడైనా Hash తెరవమని బలవంతం చేస్తే, మీ సాధారణ PIN బదులు ఈ కోడ్‌ను నమోదు చేయండి.\n\nయాప్ సాధారణంగా తెరవబడుతుంది, కానీ మీ సంభాషణలు మరియు పరిచయాలు అన్నీ పోతాయి.\n\nమీ స్క్రీన్‌ను చూసే ఎవరికైనా, Hash ఖాళీగా కనిపిస్తుంది — మీరు ఎప్పుడూ ఉపయోగించనట్లు.';

  @override
  String get vashModeIrreversible =>
      'ఈ చర్య నిశ్శబ్దంగా మరియు తిరిగి మార్చలేనిది.';

  @override
  String get chooseVashCode => 'నా Vash కోడ్‌ను ఎంచుకో';

  @override
  String get vashCodeInfo =>
      'యాప్‌ను సాధారణంగా తెరిచే రెండవ PIN కోడ్, కానీ ఖాళీగా.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'మీ PIN బదులు ఈ కోడ్‌ను నమోదు చేస్తే:';

  @override
  String get vashDeleteContacts => 'మీ పరిచయాలు అదృశ్యమవుతాయి';

  @override
  String get vashDeleteMessages => 'మీ సంభాషణలు అదృశ్యమవుతాయి';

  @override
  String get vashDeleteHistory => 'మీ నోట్స్ అదృశ్యమవుతాయి';

  @override
  String get vashKeepId => 'మీ Hash గుర్తింపు (#XXX-XXX-XXX) అలాగే ఉంటుంది';

  @override
  String get vashAppearNormal =>
      'యాప్ సాధారణంగా కానీ ఖాళీగా కనిపిస్తుంది, కొత్తదానిలా. ఈ చర్య తిరిగి మార్చలేనిది.';

  @override
  String get setupVashCode => 'Vash కోడ్ సెటప్ చేయి';

  @override
  String get modifyVashCode => 'Vash కోడ్ మార్చు';

  @override
  String get currentVashCode => 'ప్రస్తుత Vash కోడ్';

  @override
  String get newVashCode => 'కొత్త Vash కోడ్';

  @override
  String get confirmVashCode => 'Vash కోడ్ నిర్ధారించు';

  @override
  String get vashCodeConfigured => 'Vash కోడ్ కాన్ఫిగర్ చేయబడింది';

  @override
  String get vashCodeModified => 'Vash కోడ్ మార్చబడింది';

  @override
  String get vashCodeMustDiffer => 'Vash కోడ్ PIN కంటే భిన్నంగా ఉండాలి';

  @override
  String get incorrectVashCode => 'తప్పు Vash కోడ్';

  @override
  String get vashWhatToDelete => 'Vash మోడ్ ద్వారా ఏమి అదృశ్యమవ్వాలి?';

  @override
  String get vashDeleteContactsOption => 'పరిచయాలు';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'సందేశాలు';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'నోట్స్';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash మోడ్ సక్రియం చేయబడింది';

  @override
  String get vashCreateSubtitle =>
      'మీ ప్రధాన PIN కంటే భిన్నమైన కోడ్‌ను ఎంచుకోండి';

  @override
  String get vashConfirmSubtitle => 'మీ Vash కోడ్‌ను నిర్ధారించండి';

  @override
  String get pinCodeForEntry => 'యాప్‌లో ప్రవేశించడానికి PIN కోడ్';

  @override
  String get vashCodeSection => 'Vash మోడ్';

  @override
  String get biometric => 'బయోమెట్రిక్';

  @override
  String get biometricUnlock => 'వేలిముద్ర లేదా Face IDతో అన్‌లాక్ చేయండి';

  @override
  String get enableBiometric => 'బయోమెట్రిక్ ప్రారంభించు';

  @override
  String get biometricWarningMessage =>
      'బయోమెట్రిక్‌ను ప్రారంభించడం ద్వారా, యాప్‌లో ప్రవేశించడానికి మీ Vash కోడ్‌ను ఉపయోగించలేరు.\n\nబయోమెట్రిక్ విఫలమైతే మాత్రమే (అనేక విఫల ప్రయత్నాల తర్వాత) Vash కోడ్‌ను ఉపయోగించగలరు.\n\nమీరు కొనసాగించాలనుకుంటున్నారా?';

  @override
  String get understood => 'అర్థమైంది';

  @override
  String get shareAppSubtitle => 'మీ సన్నిహితులతో Hash భాగస్వామ్యం చేయండి';

  @override
  String get share => 'భాగస్వామ్యం';

  @override
  String get danger => 'ప్రమాదం';

  @override
  String get deleteAccount => 'నా ఖాతాను తొలగించు';

  @override
  String get deleteAccountSubtitle => 'తిరిగి మార్చలేని చర్య';

  @override
  String get deleteAccountConfirmTitle => 'నా ఖాతాను తొలగించు';

  @override
  String get deleteAccountConfirmMessage =>
      'మీ ఖాతా శాశ్వతంగా తొలగించబడుతుంది. ఈ చర్య తిరిగి మార్చలేనిది.\n\n• మీ అన్ని చాట్‌లు\n• మీ అన్ని పరిచయాలు\n• మీ Hash ID\n\nమీరు కొత్త ఖాతాను సృష్టించాల్సి ఉంటుంది.';

  @override
  String get deleteForever => 'శాశ్వతంగా తొలగించు';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash మోడ్ సక్రియం చేయబడింది.';

  @override
  String deletionError(String error) {
    return 'తొలగింపు లోపం: $error';
  }

  @override
  String get yourSecurity => 'మీ భద్రత';

  @override
  String get securityInfo =>
      '• ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్ (Signal Protocol)\n• డెలివరీ తర్వాత మా సర్వర్‌లలో డేటా ఉండదు\n• కీలు మీ పరికరంలో మాత్రమే నిల్వ చేయబడతాయి\n• PIN కోడ్ సర్వర్‌కు ఎప్పుడూ పంపబడదు';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'స్వాగతం';

  @override
  String get securityStatement1 => 'మీ సందేశాలు రక్షించబడ్డాయి.';

  @override
  String get securityStatement2 => 'ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్.';

  @override
  String get securityStatement3 => 'జాడ లేదు. రాజీ లేదు.';

  @override
  String get securityStatement4 => 'మీ గోప్యత ఒక హక్కు.';

  @override
  String get accessBlocked => 'ప్రవేశం నిరోధించబడింది';

  @override
  String get tooManyAttempts => 'చాలా ఎక్కువ ప్రయత్నాలు';

  @override
  String get pleaseWait => 'దయచేసి వేచి ఉండండి';

  @override
  String get waitDelay => 'దయచేసి ఆలస్యం ముగిసే వరకు వేచి ఉండండి';

  @override
  String attemptCount(int current, int max) {
    return 'ప్రయత్నం $current / $max';
  }

  @override
  String retryIn(String time) {
    return '$time లో మళ్ళీ ప్రయత్నించండి';
  }

  @override
  String get forgotPin => 'PIN మర్చిపోయారా? రికవరీ ఫ్రేజ్ ఉపయోగించండి';

  @override
  String get useRecoveryPhrase => 'రికవరీ ఫ్రేజ్ ఉపయోగించు';

  @override
  String get recoveryWarningTitle => 'హెచ్చరిక';

  @override
  String get recoveryWarningMessage => 'ఖాతా రికవరీ చేస్తుంది:';

  @override
  String get recoveryDeleteAllMessages => 'మీ అన్ని సందేశాలను తొలగిస్తుంది';

  @override
  String get recoveryWaitDelay => '1 గంట ఆలస్యం అవసరం';

  @override
  String get recoveryKeepContacts => 'మీ పరిచయాలను ఉంచుతుంది';

  @override
  String get recoveryIrreversible =>
      'ఈ చర్య తిరిగి మార్చలేనిది. మీ సందేశాలు శాశ్వతంగా కోల్పోతారు.';

  @override
  String get iUnderstand => 'నేను అర్థం చేసుకున్నాను';

  @override
  String get accountRecovery => 'ఖాతా రికవరీ';

  @override
  String get enterRecoveryPhrase =>
      'మీ రికవరీ ఫ్రేజ్ యొక్క 24 పదాలను ఖాళీలతో వేరు చేసి నమోదు చేయండి.';

  @override
  String get recoveryPhraseHint => 'పదం1 పదం2 పదం3 ...';

  @override
  String get recover => 'రికవర్ చేయి';

  @override
  String get recoveryPhraseRequired =>
      'దయచేసి మీ రికవరీ ఫ్రేజ్‌ను నమోదు చేయండి';

  @override
  String get recoveryPhrase24Words => 'ఫ్రేజ్‌లో సరిగ్గా 24 పదాలు ఉండాలి';

  @override
  String get incorrectRecoveryPhrase => 'తప్పు రికవరీ ఫ్రేజ్';

  @override
  String get recoveryInitError => 'రికవరీ ప్రారంభించడంలో లోపం';

  @override
  String get securityDelay => 'భద్రతా ఆలస్యం';

  @override
  String get securityDelayMessage =>
      'మీ భద్రత కోసం, కొత్త PIN సృష్టించడానికి ముందు వేచి ఉండే సమయం అవసరం.';

  @override
  String get timeRemaining => 'మిగిలిన సమయం';

  @override
  String get messagesDeletedForProtection =>
      'మీ రక్షణ కోసం మీ సందేశాలు తొలగించబడ్డాయి.';

  @override
  String get canCloseApp => 'మీరు యాప్‌ను మూసివేసి తర్వాత తిరిగి రావచ్చు.';

  @override
  String get onboardingTitle1 => 'Hash కు స్వాగతం';

  @override
  String get onboardingSubtitle1 => 'జాడ వదలని మెసెంజర్';

  @override
  String get onboardingTitle2 => 'పూర్తి ఎన్‌క్రిప్షన్';

  @override
  String get onboardingSubtitle2 =>
      'మీ సందేశాలు Signal protocol తో ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్ట్ చేయబడతాయి';

  @override
  String get onboardingTitle3 => 'జాడ లేదు';

  @override
  String get onboardingSubtitle3 =>
      'డెలివరీ తర్వాత సందేశాలు సర్వర్‌ల నుండి తొలగించబడతాయి';

  @override
  String get onboardingTitle4 => 'మీ భద్రత';

  @override
  String get onboardingSubtitle4 => 'PIN కోడ్, Vash మోడ్ మరియు రికవరీ ఫ్రేజ్';

  @override
  String get getStarted => 'ప్రారంభించు';

  @override
  String get next => 'తదుపరి';

  @override
  String get skip => 'దాటవేయి';

  @override
  String get alreadyHaveAccount => 'నాకు ఇప్పటికే ఖాతా ఉంది';

  @override
  String get transferMyAccount => 'నా ఖాతాను బదిలీ చేయి';

  @override
  String get createPin => 'PIN కోడ్ సృష్టించు';

  @override
  String get createPinSubtitle => 'ఈ కోడ్ మీ యాప్‌కు ప్రవేశాన్ని రక్షిస్తుంది';

  @override
  String get confirmYourPin => 'మీ PIN కోడ్‌ను నిర్ధారించండి';

  @override
  String get confirmPinSubtitle => 'మీ PIN కోడ్‌ను మళ్ళీ నమోదు చేయండి';

  @override
  String get saveRecoveryPhrase => 'రికవరీ ఫ్రేజ్';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'ఈ 24 పదాలను క్రమంలో రాయండి. మీరు PIN మర్చిపోతే మీ ఖాతాను రికవర్ చేయడానికి ఇవి అనుమతిస్తాయి.';

  @override
  String get phraseWritten => 'నేను నా ఫ్రేజ్‌ను రాశాను';

  @override
  String get warningRecoveryPhrase =>
      'మీరు ఈ ఫ్రేజ్‌ను కోల్పోయి మీ PIN మర్చిపోతే, మీ ఖాతాకు ప్రవేశం కోల్పోతారు.';

  @override
  String get accountTransferred => 'ఖాతా బదిలీ చేయబడింది';

  @override
  String get accountTransferredMessage =>
      'మీ ఖాతా మరొక పరికరానికి బదిలీ చేయబడింది. ఈ సెషన్ ఇకపై చెల్లదు.';

  @override
  String get accountTransferredInfo =>
      'మీరు ఈ బదిలీని ప్రారంభించకపోతే, మీ ఖాతా రాజీ అయి ఉండవచ్చు.';

  @override
  String get logout => 'లాగ్ అవుట్';

  @override
  String get transferAccount => 'ఖాతా బదిలీ';

  @override
  String get transferAccountInfo =>
      'మీ Hash ఖాతాను కొత్త పరికరానికి బదిలీ చేయండి. మీ ప్రస్తుత సెషన్ చెల్లకుండా పోతుంది.';

  @override
  String get generateTransferCode => 'బదిలీ కోడ్ జనరేట్ చేయి';

  @override
  String get transferCode => 'బదిలీ కోడ్';

  @override
  String transferCodeExpires(int minutes) {
    return 'ఈ కోడ్ $minutes నిమిషాల్లో గడువు తీరుతుంది';
  }

  @override
  String get enterCodeOnNewDevice =>
      'మీ ఖాతాను బదిలీ చేయడానికి మీ కొత్త పరికరంలో ఈ కోడ్‌ను నమోదు చేయండి.';

  @override
  String get generateNewCode => 'కొత్త కోడ్ జనరేట్ చేయి';

  @override
  String get scanQrCode => 'QR code స్కాన్ చేయి';

  @override
  String get scanQrCodeSubtitle =>
      'వారిని జోడించడానికి పరిచయం యొక్క QR code స్కాన్ చేయండి';

  @override
  String get qrCodeDetected => 'QR code గుర్తించబడింది';

  @override
  String get invalidQrCode => 'చెల్లని QR code';

  @override
  String get cameraPermissionRequired => 'కెమెరా అనుమతి అవసరం';

  @override
  String get myQrCode => 'నా QR code';

  @override
  String get myQrCodeSubtitle =>
      'మీ పరిచయాలు మిమ్మల్ని జోడించగలిగేలా ఈ QR code షేర్ చేయండి';

  @override
  String get shareQrCode => 'షేర్ చేయి';

  @override
  String get addContactTitle => 'పరిచయాన్ని జోడించు';

  @override
  String get addContactByHashId => 'మీ పరిచయం యొక్క Hash ID నమోదు చేయండి';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'వెతుకు';

  @override
  String get contactNotFound => 'పరిచయం కనుగొనబడలేదు';

  @override
  String get contactAlreadyAdded => 'ఈ పరిచయం ఇప్పటికే మీ జాబితాలో ఉంది';

  @override
  String get contactAdded => 'పరిచయం జోడించబడింది';

  @override
  String get myProfile => 'నా ప్రొఫైల్';

  @override
  String get myProfileSubtitle =>
      'ఇతరులు మిమ్మల్ని జోడించగలిగేలా ఈ సమాచారాన్ని షేర్ చేయండి';

  @override
  String get temporaryCode => 'తాత్కాలిక కోడ్';

  @override
  String temporaryCodeExpires(String time) {
    return '$time లో గడువు తీరుతుంది';
  }

  @override
  String get codeExpired => 'కోడ్ గడువు తీరింది';

  @override
  String get generateNewCodeButton => 'కొత్త కోడ్';

  @override
  String get copyHashId => 'ID కాపీ చేయి';

  @override
  String get copyCode => 'కోడ్ కాపీ చేయి';

  @override
  String get copiedToClipboard => 'కాపీ చేయబడింది';

  @override
  String get showMyQrCode => 'నా QR code చూపించు';

  @override
  String get orDivider => 'లేదా';

  @override
  String get openScanner => 'స్కానర్ తెరువు';

  @override
  String get addManually => 'మాన్యువల్‌గా జోడించు';

  @override
  String get contactHashIdLabel => 'పరిచయం యొక్క Hash ID';

  @override
  String get temporaryCodeLabel => 'తాత్కాలిక కోడ్';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'మీ పరిచయాన్ని వారి ప్రొఫైల్ నుండి కోడ్ జనరేట్ చేయమని అడగండి';

  @override
  String get verifyAndAdd => 'ధృవీకరించి జోడించు';

  @override
  String get fillAllFields => 'దయచేసి అన్ని ఫీల్డ్‌లను నింపండి';

  @override
  String get invalidHashIdFormat => 'చెల్లని ID ఫార్మాట్ (ఉదా: 123-456-ABC)';

  @override
  String get userNotFound => 'వినియోగదారు కనుగొనబడలేదు';

  @override
  String get cannotAddYourself => 'మీరు మిమ్మల్ని మీరు జోడించుకోలేరు';

  @override
  String get invalidOrExpiredCode => 'చెల్లని లేదా గడువు తీరిన తాత్కాలిక కోడ్';

  @override
  String get contactFound => 'పరిచయం కనుగొనబడింది!';

  @override
  String get howToCallContact => 'వారిని ఏమని పిలవాలనుకుంటున్నారు?';

  @override
  String get contactNameHint => 'పరిచయ పేరు';

  @override
  String get addContactButton => 'జోడించు';

  @override
  String get contactDetails => 'పరిచయ వివరాలు';

  @override
  String get contactName => 'పరిచయ పేరు';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date న జోడించబడింది';
  }

  @override
  String get deleteContact => 'పరిచయాన్ని తొలగించు';

  @override
  String deleteContactConfirm(Object name) {
    return 'ఈ పరిచయాన్ని తొలగించాలా?';
  }

  @override
  String get deleteContactMessage => 'ఇది మొత్తం చాట్‌ను కూడా తొలగిస్తుంది.';

  @override
  String get delete => 'తొలగించు';

  @override
  String get typeMessage => 'సందేశం టైప్ చేయండి...';

  @override
  String get messageSent => 'పంపబడింది';

  @override
  String get messageDelivered => 'డెలివర్ చేయబడింది';

  @override
  String get messageRead => 'చదివారు';

  @override
  String get messageFailed => 'పంపడం విఫలమైంది';

  @override
  String get now => 'ఇప్పుడు';

  @override
  String minutesAgo(int count) {
    return '$countని';
  }

  @override
  String hoursAgo(int count) {
    return '$countగం';
  }

  @override
  String daysAgo(int count) {
    return '$countరో';
  }

  @override
  String get today => 'ఈ రోజు';

  @override
  String get yesterday => 'నిన్న';

  @override
  String dateAtTime(String date, String time) {
    return '$date $time కి';
  }

  @override
  String get shareMessage =>
      'Hash లో నాతో చేరండి! 🔒\n\nఇది నిజంగా ప్రైవేట్ మెసెంజర్: పూర్తి ఎన్‌క్రిప్షన్, సర్వర్‌లలో జాడ లేదు, మరియు అవసరమైతే పానిక్ మోడ్.\n\nయాప్‌ను ఇక్కడ డౌన్‌లోడ్ చేయండి 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'లోపం';

  @override
  String get ok => 'సరే';

  @override
  String get view => 'చూడు';

  @override
  String get yes => 'అవును';

  @override
  String get no => 'కాదు';

  @override
  String get save => 'సేవ్ చేయి';

  @override
  String get edit => 'ఎడిట్ చేయి';

  @override
  String get close => 'మూసివేయి';

  @override
  String get confirm => 'నిర్ధారించు';

  @override
  String get loading => 'లోడ్ అవుతోంది...';

  @override
  String get retry => 'మళ్ళీ ప్రయత్నించు';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'పెండింగ్ అభ్యర్థనలు';

  @override
  String get noPendingRequests => 'పెండింగ్ అభ్యర్థనలు లేవు';

  @override
  String get pendingRequestsSubtitle =>
      'ఈ వ్యక్తులు మిమ్మల్ని జోడించాలనుకుంటున్నారు';

  @override
  String requestFromUser(String hashId) {
    return '$hashId నుండి అభ్యర్థన';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days రోజుల్లో గడువు తీరుతుంది';
  }

  @override
  String get acceptRequest => 'ఆమోదించు';

  @override
  String get rejectRequest => 'తిరస్కరించు';

  @override
  String get requestAccepted => 'అభ్యర్థన ఆమోదించబడింది';

  @override
  String get requestRejected => 'అభ్యర్థన తిరస్కరించబడింది';

  @override
  String get requestSent => 'అభ్యర్థన పంపబడింది!';

  @override
  String get requestSentSubtitle =>
      'మీ అభ్యర్థన పంపబడింది. మీరు చాట్ చేయడానికి ముందు వినియోగదారు దానిని ఆమోదించాలి.';

  @override
  String get requestAlreadyPending => 'ఒక అభ్యర్థన ఇప్పటికే పెండింగ్‌లో ఉంది';

  @override
  String get requestAlreadySentByOther =>
      'ఈ వ్యక్తి మీకు ఇప్పటికే అభ్యర్థన పంపారు';

  @override
  String get addByHashId => 'Hash ID ద్వారా జోడించు';

  @override
  String get addByHashIdSubtitle =>
      'పరిచయం యొక్క Hash ID మరియు తాత్కాలిక కోడ్ నమోదు చేయండి';

  @override
  String get enterTemporaryCode => '6-అంకెల కోడ్ నమోదు చేయండి';

  @override
  String get sendRequest => 'అభ్యర్థన పంపు';

  @override
  String get acceptContactTitle => 'పరిచయాన్ని ఆమోదించు';

  @override
  String get acceptContactSubtitle => 'మీరు వారికి అనుకూల పేరు ఇవ్వవచ్చు';

  @override
  String get leaveEmptyForHashId => 'Hash ID ఉపయోగించడానికి ఖాళీగా వదలండి';

  @override
  String get firstName => 'మొదటి పేరు';

  @override
  String get lastName => 'చివరి పేరు';

  @override
  String get notes => 'నోట్స్';

  @override
  String get notesHint => 'ఈ పరిచయం గురించి వ్యక్తిగత నోట్స్';

  @override
  String get photoOptional => 'ఫోటో (ఐచ్ఛికం)';

  @override
  String get contactNameOptional => 'పేరు (ఐచ్ఛికం)';

  @override
  String get notesOptional => 'నోట్స్ (ఐచ్ఛికం)';

  @override
  String get storedLocally => 'మీ పరికరంలో మాత్రమే నిల్వ చేయబడింది';

  @override
  String get encryptedMessageLabel => 'ఎన్‌క్రిప్టెడ్ సందేశం';

  @override
  String get identityMessageHint => 'మీరు ఎవరు? మీరు ఒకరినొకరు ఎలా తెలుసు?';

  @override
  String get messageWillBeSentEncrypted =>
      'ఈ సందేశం ఎన్‌క్రిప్ట్ చేయబడి ప్రాపకుడికి పంపబడుతుంది';

  @override
  String get sendRequestButton => 'అభ్యర్థన పంపు';

  @override
  String get requestExpiresIn24h =>
      'ఆమోదించకపోతే అభ్యర్థన 24 గంటల్లో గడువు తీరుతుంది';

  @override
  String get theyAlreadySentYouRequest =>
      'ఈ వ్యక్తి మీకు ఇప్పటికే అభ్యర్థన పంపారు';

  @override
  String get requests => 'అభ్యర్థనలు';

  @override
  String get receivedRequests => 'అందుకున్నవి';

  @override
  String get sentRequests => 'పంపినవి';

  @override
  String get noSentRequests => 'పంపిన అభ్యర్థనలు లేవు';

  @override
  String get cancelRequest => 'రద్దు చేయి';

  @override
  String get deleteRequest => 'అభ్యర్థనను తొలగించు';

  @override
  String get requestCancelled => 'అభ్యర్థన రద్దు చేయబడింది';

  @override
  String sentTo(String hashId) {
    return '$hashId కు పంపబడింది';
  }

  @override
  String expiresIn(String time) {
    return '$time లో గడువు తీరుతుంది';
  }

  @override
  String receivedAgo(String time) {
    return '$time క్రితం అందుకున్నారు';
  }

  @override
  String get messageFromRequester => 'అభ్యర్థించిన వారి నుండి సందేశం';

  @override
  String get copy => 'కాపీ చేయి';

  @override
  String get messageInfo => 'సందేశ సమాచారం';

  @override
  String get messageDirection => 'దిశ';

  @override
  String get messageSentByYou => 'మీరు పంపారు';

  @override
  String get messageReceived => 'అందుకున్నారు';

  @override
  String get messageSentAt => 'పంపిన సమయం';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'స్థితి';

  @override
  String get messageReadAt => 'చదివిన సమయం';

  @override
  String get messageType => 'రకం';

  @override
  String get messageSize => 'పరిమాణం';

  @override
  String get messageExpiresAt => 'గడువు తీరే సమయం';

  @override
  String get messageEncrypted => 'ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్టెడ్';

  @override
  String get messageStatusSending => 'పంపుతోంది...';

  @override
  String get messageStatusSent => 'పంపబడింది';

  @override
  String get messageStatusDelivered => 'డెలివర్ చేయబడింది';

  @override
  String get messageStatusRead => 'చదివారు';

  @override
  String get messageStatusFailed => 'విఫలమైంది';

  @override
  String get serverStatus => 'సర్వర్';

  @override
  String get onServer => 'డెలివరీ పెండింగ్';

  @override
  String get deletedFromServer => 'తొలగించబడింది';

  @override
  String get messageTypeText => 'వచనం';

  @override
  String get messageTypeImage => 'చిత్రం';

  @override
  String get messageTypeVideo => 'వీడియో';

  @override
  String get messageTypeVoice => 'వాయిస్';

  @override
  String get messageTypeFile => 'ఫైల్';

  @override
  String get indefinitely => 'అనిర్దిష్టంగా';

  @override
  String get hoursShort => 'గం';

  @override
  String get minutesShort => 'ని';

  @override
  String get hours => 'గంటలు';

  @override
  String get minutes => 'నిమిషాలు';

  @override
  String get seconds => 'సెకన్లు';

  @override
  String get ephemeralMessages => 'తాత్కాలిక సందేశాలు';

  @override
  String get ephemeralMessagesDescription =>
      'ఈ సమయం తర్వాత సందేశాలు స్వయంచాలకంగా తొలగించబడతాయి';

  @override
  String get ephemeralImmediate => 'వెంటనే (చదివిన తర్వాత)';

  @override
  String get ephemeralImmediateDesc => 'చదివినవెంటనే తొలగించబడుతుంది';

  @override
  String get ephemeralMyPreference => 'నా ప్రాధాన్యత';

  @override
  String get ephemeralMyPreferenceDesc => 'గ్లోబల్ సెట్టింగ్ ఉపయోగించు';

  @override
  String get ephemeralDefaultSetting => 'సందేశ వ్యవధి';

  @override
  String get ephemeralChooseDefault => 'సిఫార్సు చేయబడింది';

  @override
  String get ephemeral30Seconds => '30 సెకన్లు';

  @override
  String get ephemeral30SecondsDesc => 'చదివిన 30సె తర్వాత తొలగించబడింది';

  @override
  String get ephemeral5Minutes => '5 నిమిషాలు';

  @override
  String get ephemeral5MinutesDesc => 'చదివిన 5ని తర్వాత తొలగించబడింది';

  @override
  String get ephemeral1Hour => '1 గంట';

  @override
  String get ephemeral1HourDesc => 'చదివిన 1గం తర్వాత తొలగించబడింది';

  @override
  String get ephemeral3Hours => '3 గంటలు';

  @override
  String get ephemeral6Hours => '6 గంటలు';

  @override
  String get ephemeral6HoursDesc => 'చదివిన 6గం తర్వాత తొలగించబడింది';

  @override
  String get ephemeral12Hours => '12 గంటలు';

  @override
  String get ephemeral24Hours => '24 గంటలు';

  @override
  String get ephemeral24HoursDesc => 'చదివిన 24గం తర్వాత తొలగించబడింది';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'అనుకూల వ్యవధి';

  @override
  String get howItWorks => 'ఇది ఎలా పనిచేస్తుంది';

  @override
  String get ephemeralExplanation1 =>
      'సందేశాలు అందుకున్నవెంటనే సర్వర్ నుండి తొలగించబడతాయి.';

  @override
  String get ephemeralExplanation2 =>
      'ఈ సెట్టింగ్ చదివిన తర్వాత మీ ఫోన్ నుండి సందేశాలు ఎప్పుడు అదృశ్యమవుతాయో నిర్వచిస్తుంది.';

  @override
  String get ephemeralExplanation3 =>
      'మీ పరిచయానికి వారి ఫోన్ కోసం వారి స్వంత సెట్టింగ్ ఉంది.';

  @override
  String get mute1Hour => '1 గంట';

  @override
  String get mute8Hours => '8 గంటలు';

  @override
  String get mute1Day => '1 రోజు';

  @override
  String get mute1Week => '1 వారం';

  @override
  String get muteAlways => 'ఎల్లప్పుడూ';

  @override
  String get muteExplanation => 'ఈ పరిచయం నుండి మీకు నోటిఫికేషన్‌లు రావు';

  @override
  String get showCallsInRecents => 'ఇటీవల కాల్స్‌లో చూపించు';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash కాల్స్ ఫోన్ చరిత్రలో కనిపిస్తాయి';

  @override
  String get feedback => 'అభిప్రాయం';

  @override
  String get muteNotifications => 'నోటిఫికేషన్‌లను మ్యూట్ చేయి';

  @override
  String get muteDescription => 'ఈ పరిచయం నుండి మీకు నోటిఫికేషన్‌లు రావు';

  @override
  String mutedUntil(String time) {
    return '$time వరకు మ్యూట్ చేయబడింది';
  }

  @override
  String get notMuted => 'నోటిఫికేషన్‌లు ఎనేబుల్ చేయబడ్డాయి';

  @override
  String get unmute => 'అన్‌మ్యూట్ చేయి';

  @override
  String get notificationSound => 'నోటిఫికేషన్ ధ్వని';

  @override
  String get defaultSound => 'డిఫాల్ట్';

  @override
  String get chatSettings => 'చాట్ సెట్టింగ్‌లు';

  @override
  String get bubbleColor => 'బబుల్ రంగు';

  @override
  String get backgroundColor => 'నేపథ్య రంగు';

  @override
  String get backgroundImage => 'నేపథ్య చిత్రం';

  @override
  String get chatBackground => 'చాట్ నేపథ్యం';

  @override
  String get customColor => 'అనుకూలం';

  @override
  String get defaultColor => 'డిఫాల్ట్';

  @override
  String get imageSelected => 'చిత్రం ఎంచుకోబడింది';

  @override
  String get noImage => 'చిత్రం లేదు';

  @override
  String get color => 'రంగు';

  @override
  String get image => 'చిత్రం';

  @override
  String get tapToSelectImage => 'చిత్రాన్ని ఎంచుకోవడానికి నొక్కండి';

  @override
  String get changeImage => 'చిత్రం మార్చు';

  @override
  String get previewMessageReceived => 'హలో!';

  @override
  String get previewMessageSent => 'హాయ్!';

  @override
  String get messageAction => 'సందేశం';

  @override
  String get callAction => 'కాల్';

  @override
  String get videoAction => 'వీడియో';

  @override
  String get personalNotes => 'వ్యక్తిగత నోట్స్';

  @override
  String get addNotes => 'నోట్స్ జోడించు...';

  @override
  String get noNotes => 'నోట్స్ లేవు';

  @override
  String get messageNotifications => 'సందేశ నోటిఫికేషన్‌లు';

  @override
  String get callNotifications => 'కాల్ నోటిఫికేషన్‌లు';

  @override
  String get useGradient => 'గ్రేడియంట్ ఉపయోగించు';

  @override
  String get gradientStart => 'ప్రారంభ రంగు';

  @override
  String get gradientEnd => 'ముగింపు రంగు';

  @override
  String get preview => 'ప్రివ్యూ';

  @override
  String get reset => 'రీసెట్';

  @override
  String get securityNumber => 'భద్రతా సంఖ్య';

  @override
  String securityNumberDescription(String name) {
    return 'భద్రతా సంఖ్య $name యొక్క పరికరంతో సరిపోలుతుందో ధృవీకరించండి';
  }

  @override
  String get verifyEncryption => 'ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్ ధృవీకరించు';

  @override
  String get tapToCopy => 'కాపీ చేయడానికి నొక్కండి';

  @override
  String get howToVerify => 'ఎలా ధృవీకరించాలి';

  @override
  String get verifyStep1 =>
      'మీ పరిచయాన్ని వ్యక్తిగతంగా కలవండి లేదా కాల్ చేయండి';

  @override
  String get verifyStep2 =>
      'భద్రతా సంఖ్యలను పోల్చండి లేదా QR code లు స్కాన్ చేయండి';

  @override
  String get verifyStep3 => 'అవి సరిపోలితే, మీ చాట్ సురక్షితం';

  @override
  String get scanToVerify => 'ధృవీకరించడానికి స్కాన్ చేయి';

  @override
  String get reportSpam => 'స్పామ్ రిపోర్ట్ చేయి';

  @override
  String get reportSpamSubtitle => 'ఈ పరిచయాన్ని స్పామ్‌గా రిపోర్ట్ చేయి';

  @override
  String get reportSpamDescription =>
      'ఇది ఈ పరిచయాన్ని అనామకంగా రిపోర్ట్ చేస్తుంది. మీ గుర్తింపు షేర్ చేయబడదు. మీరు ఖచ్చితంగా అనుకుంటున్నారా?';

  @override
  String get report => 'రిపోర్ట్ చేయి';

  @override
  String get spamReported => 'స్పామ్ రిపోర్ట్ చేయబడింది';

  @override
  String get reportError =>
      'రిపోర్ట్ పంపడం విఫలమైంది. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get reportRateLimited =>
      'ఈ రోజు మీ గరిష్ట రిపోర్ట్‌ల సంఖ్యకు చేరుకున్నారు.';

  @override
  String get blockContact => 'పరిచయాన్ని బ్లాక్ చేయి';

  @override
  String get blockContactDescription =>
      'ఈ పరిచయం ఇకపై మీకు సందేశాలు పంపగలగడం లేదా కాల్ చేయగలగడం చేయలేదు. వారికి తెలియజేయబడదు.';

  @override
  String get unblockContact => 'పరిచయాన్ని అన్‌బ్లాక్ చేయి';

  @override
  String get unblockContactDescription =>
      'ఈ పరిచయం మళ్ళీ మీకు సందేశాలు పంపగలరు మరియు కాల్ చేయగలరు.';

  @override
  String get contactBlocked => 'పరిచయం బ్లాక్ చేయబడింది';

  @override
  String get contactUnblocked => 'పరిచయం అన్‌బ్లాక్ చేయబడింది';

  @override
  String get contactIsBlocked => 'ఈ పరిచయం బ్లాక్ చేయబడింది';

  @override
  String get unblock => 'అన్‌బ్లాక్ చేయి';

  @override
  String get deleteContactSubtitle => 'ఈ పరిచయాన్ని మరియు చాట్‌ను తొలగించు';

  @override
  String get confirmWithPin => 'PIN తో నిర్ధారించు';

  @override
  String get enterPinToConfirm =>
      'ఈ చర్యను నిర్ధారించడానికి మీ PIN నమోదు చేయండి';

  @override
  String get profilePhoto => 'ప్రొఫైల్ ఫోటో';

  @override
  String get takePhoto => 'ఫోటో తీయి';

  @override
  String get chooseFromGallery => 'గ్యాలరీ నుండి ఎంచుకో';

  @override
  String get removePhoto => 'ఫోటో తొలగించు';

  @override
  String get viewContactHashId => 'పరిచయం యొక్క ఐడెంటిఫైయర్ చూడు';

  @override
  String get hashIdPartiallyMasked =>
      'మీ భద్రత మరియు మీ పరిచయం యొక్క గోప్యత కోసం పాక్షికంగా మాస్క్ చేయబడింది';

  @override
  String get addFirstContact => 'మీ మొదటి పరిచయాన్ని జోడించండి';

  @override
  String get addFirstContactSubtitle =>
      'మీ QR code షేర్ చేయండి లేదా స్నేహితుడి QR code స్కాన్ చేయండి';

  @override
  String get directory => 'డైరెక్టరీ';

  @override
  String get noContacts => 'పరిచయాలు లేవు';

  @override
  String get noContactsSubtitle => 'ప్రారంభించడానికి ఒక పరిచయాన్ని జోడించండి';

  @override
  String get sendMessageAction => 'సందేశం పంపు';

  @override
  String get audioCall => 'ఆడియో కాల్';

  @override
  String get videoCall => 'వీడియో కాల్';

  @override
  String get viewProfile => 'ప్రొఫైల్ చూడు';

  @override
  String get deleteContactDirectory => 'పరిచయాన్ని తొలగించు';

  @override
  String get scanShort => 'స్కాన్';

  @override
  String get addShort => 'జోడించు';

  @override
  String deleteContactConfirmName(String name) {
    return '$name ను తొలగించాలనుకుంటున్నారా?';
  }

  @override
  String get noNotesTitle => 'నోట్స్ లేవు';

  @override
  String get noNotesSubtitle => 'మీ మొదటి నోట్‌ను సృష్టించండి';

  @override
  String get newNote => 'కొత్త నోట్';

  @override
  String get editNote => 'నోట్ ఎడిట్ చేయి';

  @override
  String get deleteNote => 'నోట్ తొలగించు';

  @override
  String get deleteNoteConfirm => 'ఈ నోట్‌ను తొలగించాలనుకుంటున్నారా?';

  @override
  String get noteTitle => 'శీర్షిక';

  @override
  String get noteContent => 'విషయం';

  @override
  String get addItem => 'అంశాన్ని జోడించు';

  @override
  String get pinNote => 'పిన్ చేయి';

  @override
  String get unpinNote => 'అన్‌పిన్ చేయి';

  @override
  String get noteColor => 'రంగు';

  @override
  String get notePassword => 'పాస్‌వర్డ్';

  @override
  String get setPassword => 'పాస్‌వర్డ్ సెట్ చేయి';

  @override
  String get changePassword => 'పాస్‌వర్డ్ మార్చు';

  @override
  String get removePassword => 'పాస్‌వర్డ్ తొలగించు';

  @override
  String get enterPassword => 'పాస్‌వర్డ్ నమోదు చేయి';

  @override
  String get confirmPassword => 'పాస్‌వర్డ్ నిర్ధారించు';

  @override
  String get passwordPin => 'PIN కోడ్';

  @override
  String get passwordText => 'వచన పాస్‌వర్డ్';

  @override
  String get protectedNote => 'రక్షిత నోట్';

  @override
  String get incorrectPassword => 'తప్పు పాస్‌వర్డ్';

  @override
  String get passwordSet => 'పాస్‌వర్డ్ సెట్ చేయబడింది';

  @override
  String get passwordRemoved => 'పాస్‌వర్డ్ తొలగించబడింది';

  @override
  String get notesBiometric => 'నోట్స్ కోసం Face ID';

  @override
  String get notesBiometricSubtitle =>
      'రక్షిత నోట్స్ తెరవడానికి బయోమెట్రిక్ ప్రమాణీకరణ అవసరం';

  @override
  String get textNote => 'వచన నోట్';

  @override
  String get checklistNote => 'చెక్‌లిస్ట్';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total టాస్క్‌లు';
  }

  @override
  String get autoSaved => 'సేవ్ చేయబడింది';

  @override
  String get searchNotes => 'నోట్స్ వెతుకు';

  @override
  String get legalConsent => 'చట్టపరమైన సమ్మతి';

  @override
  String get confirmAge13 =>
      'నాకు కనీసం 13 సంవత్సరాలు ఉన్నాయని నిర్ధారిస్తున్నాను';

  @override
  String get acceptLegalStart => 'నేను ఆమోదిస్తున్నాను ';

  @override
  String get privacyPolicy => 'గోప్యతా విధానం';

  @override
  String get termsOfService => 'సేవా నిబంధనలు';

  @override
  String get andThe => ' మరియు ';

  @override
  String get continueButton => 'కొనసాగించు';

  @override
  String get mustAcceptTerms => 'కొనసాగించడానికి మీరు రెండు షరతులను ఆమోదించాలి';

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
  String get support => 'మద్దతు';

  @override
  String get contactSupport => 'మద్దతును సంప్రదించండి';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'దుర్వినియోగం రిపోర్ట్ చేయి';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'చట్టపరమైన';

  @override
  String get legalEntity => 'చట్టపరమైన సంస్థ';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'పిన్ చేయి';

  @override
  String get unpinConversation => 'అన్‌పిన్ చేయి';

  @override
  String get hideConversation => 'ఫీడ్ నుండి తొలగించు';

  @override
  String get deleteConversation => 'సంభాషణ తొలగించు';

  @override
  String get deleteConversationConfirm =>
      'అన్ని సందేశాల తొలగింపును నిర్ధారించడానికి మీ PIN నమోదు చేయండి';

  @override
  String get noConversations => 'ఇంకా సంభాషణలు లేవు';

  @override
  String get startConversation => 'ప్రారంభించు';

  @override
  String get microphonePermissionRequired => 'మైక్రోఫోన్ ప్రవేశం అవసరం';

  @override
  String get microphonePermissionExplanation =>
      'కాల్‌లు చేయడానికి Hash కు మైక్రోఫోన్ అవసరం.';

  @override
  String get cameraPermissionExplanation =>
      'వీడియో కాల్‌ల కోసం Hash కు కెమెరా అవసరం.';

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
  String get openSettings => 'సెట్టింగ్‌లు తెరువు';

  @override
  String get callConnecting => 'కనెక్ట్ అవుతోంది...';

  @override
  String get callRinging => 'రింగ్ అవుతోంది...';

  @override
  String get callReconnecting => 'మళ్ళీ కనెక్ట్ అవుతోంది...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'మళ్ళీ కనెక్ట్ అవుతోంది (${seconds}s)';
  }

  @override
  String get callPaused => 'పాజ్ చేయబడింది';

  @override
  String get callPausedSubtitle => 'కాల్ ఇంకా యాక్టివ్‌గా ఉంది';

  @override
  String get callRemoteMicMuted => 'పరిచయం యొక్క మైక్రోఫోన్ మ్యూట్ చేయబడింది';

  @override
  String get callMiniControlsMute => 'మ్యూట్ చేయి';

  @override
  String get callMiniControlsUnmute => 'అన్‌మ్యూట్ చేయి';

  @override
  String get callMiniControlsHangUp => 'కాల్ కట్ చేయి';

  @override
  String get callMiniControlsReturn => 'కాల్‌కు తిరిగి వెళ్ళు';

  @override
  String get callNetworkPoor => 'అస్థిర కనెక్షన్';

  @override
  String get callNetworkLost => 'కనెక్షన్ కోల్పోయింది';

  @override
  String get callEndedTitle => 'కాల్ ముగిసింది';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'పరికర డేటా';

  @override
  String get deviceDataSubtitle => 'లోకల్ మరియు సర్వర్ నిల్వ';

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
  String get localStorage => 'లోకల్ నిల్వ';

  @override
  String get onThisDevice => 'ఈ పరికరంలో';

  @override
  String get encryptedDatabases => 'ఎన్‌క్రిప్టెడ్ డేటాబేస్‌లు';

  @override
  String get files => 'ఫైళ్ళు';

  @override
  String get secureKeychain => 'సురక్షిత కీచైన్';

  @override
  String get cache => 'కాష్';

  @override
  String get contactsDetail => 'పేర్లు, అవతార్లు, Signal కీలు';

  @override
  String get messagesDetail => 'ఎన్‌క్రిప్టెడ్ సంభాషణలు';

  @override
  String get notesDetail => 'వ్యక్తిగత నోట్స్';

  @override
  String get signalSessions => 'Signal సెషన్‌లు';

  @override
  String get signalSessionsDetail => 'ఎన్‌క్రిప్షన్ సెషన్‌లు';

  @override
  String get pendingContacts => 'పెండింగ్ పరిచయాలు';

  @override
  String get pendingContactsDetail => 'పెండింగ్ అభ్యర్థనలు';

  @override
  String get callHistory => 'కాల్‌లు';

  @override
  String get callHistoryDetail => 'కాల్ చరిత్ర';

  @override
  String get preferences => 'ప్రాధాన్యతలు';

  @override
  String get preferencesDetail => 'మీడియా మరియు కాల్ ప్రాధాన్యతలు';

  @override
  String get avatars => 'అవతార్లు';

  @override
  String get media => 'మీడియా';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ఫైళ్ళు',
      one: '1 ఫైల్',
      zero: 'ఫైళ్ళు లేవు',
    );
    return '$_temp0';
  }

  @override
  String get active => 'సక్రియం';

  @override
  String get notDefined => 'నిర్వచించబడలేదు';

  @override
  String get biometrics => 'బయోమెట్రిక్స్';

  @override
  String get recoveryPhrase => 'రికవరీ ఫ్రేజ్';

  @override
  String get identity => 'గుర్తింపు (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol కీలు';

  @override
  String get authTokens => 'ప్రమాణీకరణ టోకెన్‌లు';

  @override
  String get contactNamesCache => 'పరిచయ పేర్ల కాష్';

  @override
  String get remoteConfig => 'రిమోట్ కాన్ఫిగ్';

  @override
  String get notificationPrefs => 'నోటిఫికేషన్ ప్రాధాన్యతలు';

  @override
  String get serverData => 'సర్వర్ డేటా';

  @override
  String get serverDataInfo =>
      'Hash సర్వర్‌లో కనిష్ట డేటాను ఉంచుతుంది, అంతా ఎన్‌క్రిప్టెడ్ లేదా తాత్కాలికం.';

  @override
  String get serverProfile => 'ప్రొఫైల్';

  @override
  String get serverProfileDetail =>
      'Hash ID, పబ్లిక్ కీలు, మెయిల్‌బాక్స్ టోకెన్';

  @override
  String get serverPrekeys => 'ప్రీ-కీలు';

  @override
  String get serverPrekeysDetail => 'ఒక-సారి Signal కీలు (వినియోగించబడ్డాయి)';

  @override
  String get serverMessages => 'రవాణాలో ఉన్న సందేశాలు';

  @override
  String get serverMessagesDetail =>
      'డెలివరీ తర్వాత తొలగించబడతాయి (గరిష్టంగా 24 గం)';

  @override
  String get serverMedia => 'రవాణాలో ఉన్న మీడియా';

  @override
  String get serverMediaDetail => 'డౌన్‌లోడ్ తర్వాత తొలగించబడుతుంది';

  @override
  String get serverContactRequests => 'పరిచయ అభ్యర్థనలు';

  @override
  String get serverContactRequestsDetail => '24 గంటల తర్వాత గడువు తీరుతుంది';

  @override
  String get serverRateLimits => 'రేట్ లిమిట్‌లు';

  @override
  String get serverRateLimitsDetail => 'తాత్కాలిక యాంటీ-అబ్యూజ్ డేటా';

  @override
  String get privacyReassurance =>
      'Hash మీ సందేశాలను చదవలేదు. మొత్తం డేటా ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్టెడ్. సర్వర్ డేటా స్వయంచాలకంగా తొలగించబడుతుంది.';

  @override
  String get pinTooSimple =>
      'ఈ PIN చాలా సరళమైనది. మరింత సురక్షితమైన కోడ్‌ను ఎంచుకోండి.';

  @override
  String get genericError => 'లోపం సంభవించింది. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'ఖాతా సృష్టించలేకపోయింది: $error';
  }

  @override
  String get phraseCopiedToClipboard =>
      'ఫ్రేజ్ క్లిప్‌బోర్డ్‌కు కాపీ చేయబడింది';

  @override
  String get copyPhrase => 'ఫ్రేజ్ కాపీ చేయి';

  @override
  String get recoveryPhraseSecurityWarning =>
      'ఈ ఫ్రేజ్‌ను సురక్షితమైన ప్రదేశంలో రాయండి. ఈ ఫ్రేజ్ లేకుండా మీ PIN కోల్పోతే, మీ డేటాకు శాశ్వతంగా ప్రవేశం కోల్పోతారు.';

  @override
  String get noMessages => 'సందేశాలు లేవు';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name తో అన్ని సందేశాలను తొలగించాలా?';
  }

  @override
  String get confirmation => 'నిర్ధారణ';

  @override
  String get untitled => 'శీర్షిక లేనిది';

  @override
  String get noSessions => 'సెషన్‌లు లేవు';

  @override
  String get unknownContact => 'తెలియని పరిచయం';

  @override
  String get unnamed => 'పేరు లేనిది';

  @override
  String get noPendingRequestsAlt => 'పెండింగ్ అభ్యర్థనలు లేవు';

  @override
  String get deleteAllCallHistory => 'మొత్తం కాల్ చరిత్రను తొలగించాలా?';

  @override
  String get noCalls => 'కాల్‌లు లేవు';

  @override
  String get noPreferences => 'ప్రాధాన్యతలు లేవు';

  @override
  String get resetAllMediaPrefs => 'అన్ని మీడియా ప్రాధాన్యతలను రీసెట్ చేయాలా?';

  @override
  String get deleteThisAvatar => 'ఈ అవతార్‌ను తొలగించాలా?';

  @override
  String get deleteAllAvatars => 'అన్ని అవతార్లను తొలగించాలా?';

  @override
  String get noAvatars => 'అవతార్లు లేవు';

  @override
  String get deleteThisFile => 'ఈ ఫైల్‌ను తొలగించాలా?';

  @override
  String get deleteAllMediaFiles => 'మొత్తం మీడియాను తొలగించాలా?';

  @override
  String get noMediaFiles => 'మీడియా లేదు';

  @override
  String get outgoing => 'వెళ్తున్న';

  @override
  String get incoming => 'వస్తున్న';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'తాత్కాలిక వీక్షణ: ${seconds}s';
  }

  @override
  String get normalView => 'సాధారణ వీక్షణ';

  @override
  String get callReasonCompleted => 'పూర్తయింది';

  @override
  String get callReasonMissed => 'మిస్సయింది';

  @override
  String get callReasonDeclined => 'తిరస్కరించబడింది';

  @override
  String get callReasonFailed => 'విఫలమైంది';

  @override
  String get justNow => 'ఇప్పుడే';

  @override
  String timeAgoMinutes(int count) {
    return '$count ని క్రితం';
  }

  @override
  String timeAgoHours(int count) {
    return '$countగం క్రితం';
  }

  @override
  String timeAgoDays(int count) {
    return '$countరో క్రితం';
  }

  @override
  String get messageTypeContact => 'పరిచయం';

  @override
  String get messageTypeLocation => 'స్థానం';

  @override
  String get statusQueued => 'క్యూలో ఉంది';

  @override
  String get blockedBadge => 'బ్లాక్ చేయబడింది';

  @override
  String get protectedBadge => 'రక్షించబడింది';

  @override
  String messageCount(int count) {
    return '$count సందేశం(లు)';
  }

  @override
  String get deleteQuestion => 'తొలగించాలా?';

  @override
  String get transferMyAccountTitle => 'నా ఖాతాను బదిలీ చేయి';

  @override
  String get loadingError => 'లోడింగ్ లోపం';

  @override
  String get transferToNewDevice => 'కొత్త పరికరానికి బదిలీ చేయి';

  @override
  String get transferInstructions =>
      'మీ కొత్త పరికరంలో, \"నా ఖాతాను రికవర్ చేయి\" ఎంచుకొని ఈ సమాచారాన్ని నమోదు చేయండి:';

  @override
  String get yourHashIdLabel => 'మీ Hash ID';

  @override
  String get enterYourPinCode => 'మీ PIN కోడ్ నమోదు చేయండి';

  @override
  String get pinOwnerConfirmation => 'మీరు ఈ ఖాతా యజమాని అని నిర్ధారించడానికి';

  @override
  String get scanThisQrCode => 'ఈ QR code ను స్కాన్ చేయండి';

  @override
  String get withYourNewDevice => 'మీ కొత్త పరికరంతో';

  @override
  String get orEnterTheCode => 'లేదా కోడ్ నమోదు చేయండి';

  @override
  String get transferCodeLabel => 'బదిలీ కోడ్';

  @override
  String get proximityVerification => 'సామీప్య ధృవీకరణ';

  @override
  String get bringDevicesCloser => 'రెండు పరికరాలను దగ్గరగా తీసుకురండి';

  @override
  String get confirmTransferQuestion => 'బదిలీని నిర్ధారించాలా?';

  @override
  String get accountWillBeTransferred =>
      'మీ ఖాతా కొత్త పరికరానికి బదిలీ చేయబడుతుంది.\n\nఈ పరికరం శాశ్వతంగా డిస్‌కనెక్ట్ చేయబడుతుంది.';

  @override
  String get transferComplete => 'బదిలీ పూర్తయింది';

  @override
  String get transferSuccessMessage =>
      'మీ ఖాతా విజయవంతంగా బదిలీ చేయబడింది.\n\nఈ అప్లికేషన్ ఇప్పుడు మూసివేయబడుతుంది.';

  @override
  String get manualVerification => 'మాన్యువల్ ధృవీకరణ';

  @override
  String get codeDisplayedOnBothDevices => 'రెండు పరికరాలలో చూపబడిన కోడ్:';

  @override
  String get doesCodeMatchNewDevice =>
      'ఈ కోడ్ కొత్త పరికరంలో ఉన్న కోడ్‌తో సరిపోలుతుందా?';

  @override
  String get verifiedStatus => 'ధృవీకరించబడింది';

  @override
  String get inProgressStatus => 'ప్రగతిలో ఉంది...';

  @override
  String get notAvailableStatus => 'అందుబాటులో లేదు';

  @override
  String get codeExpiredRestart =>
      'కోడ్ గడువు తీరింది. దయచేసి పునఃప్రారంభించండి.';

  @override
  String get codesDoNotMatchCancelled =>
      'కోడ్‌లు సరిపోలడం లేదు. బదిలీ రద్దు చేయబడింది.';

  @override
  String transferToDevice(String device) {
    return 'కు: $device';
  }

  @override
  String get copiedExclamation => 'కాపీ చేయబడింది!';

  @override
  String expiresInTime(String time) {
    return '$time లో గడువు తీరుతుంది';
  }

  @override
  String get biometricNotAvailable =>
      'ఈ పరికరంలో బయోమెట్రిక్స్ అందుబాటులో లేదు';

  @override
  String get biometricAuthError => 'బయోమెట్రిక్ ప్రమాణీకరణ సమయంలో లోపం';

  @override
  String get authenticateForBiometric =>
      'బయోమెట్రిక్స్ ఎనేబుల్ చేయడానికి దయచేసి ప్రమాణీకరించండి';

  @override
  String get biometricAuthFailed => 'బయోమెట్రిక్ ప్రమాణీకరణ విఫలమైంది';

  @override
  String get forceUpdateTitle => 'నవీకరణ అవసరం';

  @override
  String get forceUpdateMessage =>
      'Hash యొక్క కొత్త వెర్షన్ అందుబాటులో ఉంది. కొనసాగించడానికి దయచేసి నవీకరించండి.';

  @override
  String get updateButton => 'నవీకరించు';

  @override
  String get maintenanceInProgress => 'నిర్వహణ జరుగుతోంది';

  @override
  String get tryAgainLater => 'దయచేసి తర్వాత మళ్ళీ ప్రయత్నించండి';

  @override
  String get information => 'సమాచారం';

  @override
  String get later => 'తర్వాత';

  @override
  String get doYouLikeHash => 'మీకు Hash నచ్చిందా?';

  @override
  String get yourFeedbackHelps =>
      'మీ అభిప్రాయం యాప్‌ను మెరుగుపరచడంలో మాకు సహాయపడుతుంది';

  @override
  String get ratingTerrible => 'భయంకరం';

  @override
  String get ratingBad => 'చెడు';

  @override
  String get ratingOk => 'సరే';

  @override
  String get ratingGood => 'మంచి';

  @override
  String get ratingExcellent => 'అద్భుతం!';

  @override
  String get donationMessage =>
      'Hash ఒక లాభాపేక్ష లేని ప్రాజెక్ట్. మీ మద్దతు నిజంగా ప్రైవేట్ మెసెంజర్‌ను నిర్మించడంలో మాకు సహాయపడుతుంది.';

  @override
  String get recentConnections => 'ఇటీవల కనెక్షన్లు';

  @override
  String get loginInfoText =>
      'ప్రతి PIN అన్‌లాక్ స్థానికంగా నమోదు చేయబడుతుంది. చివరి 24 గంటలు మాత్రమే ఉంచబడతాయి.';

  @override
  String get connectionCount => 'కనెక్షన్(లు)';

  @override
  String get periodLabel => 'కాలం';

  @override
  String get historyLabel => 'చరిత్ర';

  @override
  String get noLoginRecorded => 'లాగిన్ నమోదు కాలేదు';

  @override
  String get nextUnlocksAppearHere => 'తదుపరి అన్‌లాక్‌లు ఇక్కడ కనిపిస్తాయి.';

  @override
  String get dataLocalOnly =>
      'ఈ డేటా మీ పరికరంలో మాత్రమే నిల్వ చేయబడుతుంది మరియు ఎప్పుడూ ప్రసారం చేయబడదు.';

  @override
  String get currentSession => 'ప్రస్తుతం';

  @override
  String get todayLabel => 'ఈరోజు';

  @override
  String get yesterdayLabel => 'నిన్న';

  @override
  String get justNowLabel => 'ఇప్పుడే';

  @override
  String minutesAgoLabel(int count) {
    return '$count ని క్రితం';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursగం క్రితం';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursగం $minutesని క్రితం';
  }

  @override
  String get noMaintenancePlanned => 'నిర్వహణ ప్రణాళిక లేదు';

  @override
  String get everythingWorkingNormally => 'అన్నీ సాధారణంగా పనిచేస్తున్నాయి';

  @override
  String get maintenanceTitle => 'నిర్వహణ';

  @override
  String get maintenanceActiveLabel => 'కొనసాగుతోంది';

  @override
  String get maintenancePlannedLabel => 'ప్రణాళికాబద్ధం';

  @override
  String get locking => 'లాక్ అవుతోంది...';

  @override
  String get newMessageNotification => 'కొత్త సందేశం';

  @override
  String get secExplainTitle => 'Hash మిమ్మల్ని ఎలా రక్షిస్తుంది';

  @override
  String get secExplainIntro =>
      'Hash మీ సందేశాలను ఎవరూ చదవలేకుండా రూపొందించబడింది.';

  @override
  String get secExplainIntroSub =>
      'మేము కూడా కాదు.\nఇది ఎలా పనిచేస్తుందో సరళంగా వివరించబడింది.';

  @override
  String get secJourneyLabel => 'ప్రయాణం';

  @override
  String get secJourneyTitle => 'మీ సందేశం యొక్క ప్రయాణం';

  @override
  String get secJourneySubtitle =>
      'మీ వేలి నుండి మీ పరిచయం యొక్క స్క్రీన్ వరకు, ప్రతి దశ రక్షించబడింది. మార్గాన్ని అనుసరించండి.';

  @override
  String get secStep1Title => 'మీరు మీ సందేశం రాస్తారు';

  @override
  String get secStep1Desc =>
      'మీరు యాప్‌లో \"హాయ్!\" అని టైప్ చేస్తారు. ఈ సమయంలో, సందేశం మీ ఫోన్ మెమరీలో మాత్రమే ఉంటుంది. ఏమీ పంపబడలేదు.';

  @override
  String get secStep2Title => 'Signal Protocol తో ఎన్‌క్రిప్షన్';

  @override
  String get secStep2Desc =>
      'మీరు \"పంపు\" నొక్కగానే, మీ సందేశం అర్థంకాని అక్షరాల స్ట్రింగ్‌గా మారుతుంది. మీ సందేశం ఒక సేఫ్‌లో లాక్ చేయబడినట్లు ఉంటుంది, దాని కీ మీ పరిచయం వద్ద మాత్రమే ఉంటుంది.';

  @override
  String get secStep3Title => 'Sealed Sender: కనిపించని ఎన్వలప్';

  @override
  String get secStep3Desc =>
      'మెయిల్ ద్వారా ఉత్తరం పంపడం ఊహించుకోండి, కానీ ఎన్వలప్‌పై రిటర్న్ అడ్రస్ లేకుండా. Hash సరిగ్గా అదే చేస్తుంది. సందేశం అనామక మెయిల్‌బాక్స్‌లో వేయబడుతుంది. సర్వర్‌కు ఎవరు పంపారో తెలియదు.';

  @override
  String get secStep4Title => 'సర్వర్ ఏమీ చూడదు';

  @override
  String get secStep4Desc =>
      'సర్వర్ గుడ్డి పోస్ట్‌మ్యాన్‌లా పనిచేస్తుంది. దానికి \"ఎవరో మెయిల్‌బాక్స్ #A7X9 లో ఏదో వేశారు\" అని మాత్రమే తెలుసు. ఎవరు పంపారో, ఏమిటో, ఎవరి కోసమో తెలియదు.';

  @override
  String get secStep4Highlight =>
      'ఎలాంటి మెటాడేటా నిల్వ చేయబడదు: IP అడ్రస్ లేదు, టైమ్‌స్టాంప్ లేదు, పంపినవారు మరియు గ్రహీత మధ్య లింక్ లేదు.';

  @override
  String get secStep5Title => 'మీ పరిచయం సందేశాన్ని అందుకుంటారు';

  @override
  String get secStep5Desc =>
      'మీ పరిచయం యొక్క ఫోన్ వారి అనామక మెయిల్‌బాక్స్ నుండి కంటెంట్‌ను తీసుకొని వారి ప్రైవేట్ కీతో సందేశాన్ని డీక్రిప్ట్ చేస్తుంది, అది వారి పరికరాన్ని ఎప్పుడూ వదలలేదు. వారి స్క్రీన్‌పై \"హాయ్!\" కనిపిస్తుంది.';

  @override
  String get secStep6Title => 'సందేశం సర్వర్ నుండి అదృశ్యమవుతుంది';

  @override
  String get secStep6Desc =>
      'మీ పరిచయం రసీదు నిర్ధారించగానే, సర్వర్ సందేశాన్ని శాశ్వతంగా తొలగిస్తుంది. ట్రాష్ లేదు, ఆర్కైవ్ లేదు, బ్యాకప్ లేదు. చదవని సందేశాలు కూడా 24 గంటల తర్వాత స్వయంచాలకంగా నాశనం చేయబడతాయి.';

  @override
  String get secStep7Title => 'లోకల్ గడువు తీరడం';

  @override
  String get secStep7Desc =>
      'మీ పరిచయం యొక్క ఫోన్‌లో, మీరు ఎంచుకున్న వ్యవధి ప్రకారం సందేశం స్వయంగా నాశనమవుతుంది: చదివిన వెంటనే, 5 నిమిషాలు, 1 గంట... మీరు నిర్ణయిస్తారు.';

  @override
  String get secJourneyConclusion =>
      'ఫలితం: సర్వర్‌లో జాడ సున్నా, పరికరాలలో జాడ సున్నా. సందేశం చదవడానికి అవసరమైన సమయం మాత్రమే ఉనికిలో ఉంది, తర్వాత అదృశ్యమైంది.';

  @override
  String get secArchLabel => 'ఆర్కిటెక్చర్';

  @override
  String get secArchTitle => '5 రక్షణ పొరలు';

  @override
  String get secArchSubtitle =>
      'Hash ఒకే సాంకేతికతపై ఆధారపడదు. ప్రతి పొర ఇతరులను బలపరుస్తుంది. ఒక పొర రాజీ అయినా, మీ డేటా సురక్షితంగా ఉంటుంది.';

  @override
  String get secLayer1Title => 'ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్';

  @override
  String get secLayer1Desc =>
      'ప్రతి సందేశం ఒక ప్రత్యేక కీతో ఎన్‌క్రిప్ట్ చేయబడుతుంది. సరళంగా చెప్పాలంటే: ఎవరైనా ఒక సందేశాన్ని డీక్రిప్ట్ చేసినా, తదుపరి దానిని డీక్రిప్ట్ చేయలేరు. ప్రతి సందేశానికి దాని స్వంత లాక్ ఉంది.';

  @override
  String get secLayer1Detail =>
      'ఫైళ్ళ (ఫోటోలు, వీడియోలు, డాక్యుమెంట్లు) కోసం, Hash అదనపు AES-256-GCM ఎన్‌క్రిప్షన్ ఉపయోగిస్తుంది. ఫైల్ మీ ఫోన్ వదలడానికి ముందే ఎన్‌క్రిప్ట్ చేయబడుతుంది.';

  @override
  String get secLayer2Title => 'Sealed Sender (నెట్‌వర్క్ అనామకత)';

  @override
  String get secLayer2Desc =>
      'సాధారణ మెసెంజర్లు మీ సందేశాలను మీ గుర్తింపుతో పంపుతాయి. ఎన్వలప్‌పై మీ పేరు రాయడం లాంటిది. Hash అనామక మెయిల్‌బాక్స్‌లను ఉపయోగిస్తుంది: ఎవరు పంపారో తెలియకుండా సర్వర్ సందేశాన్ని డెలివర్ చేస్తుంది.';

  @override
  String get secLayer2Detail =>
      'ఫలితం: సర్వర్ డేటా ఉల్లంఘన జరిగినా, ఎవరు ఎవరితో మాట్లాడుతారో తిరిగి నిర్మించడం అసాధ్యం.';

  @override
  String get secLayer3Title => 'స్వయంచాలక తొలగింపు';

  @override
  String get secLayer3Desc =>
      'రసీదు నిర్ధారించగానే సందేశాలు సర్వర్ నుండి తొలగించబడతాయి. సందేశం ఎప్పటికీ తీసుకోబడకపోతే కూడా, 24 గంటల తర్వాత స్వయంచాలకంగా నాశనం చేయబడుతుంది.';

  @override
  String get secLayer3Detail =>
      'మీ ఫోన్‌లో, మీరు ఎంచుకున్న వ్యవధి ప్రకారం సందేశాలు స్వయంగా నాశనమవుతాయి: వెంటనే, 5 ని, 15 ని, 30 ని, 1గం, 3గం, 6గం, లేదా 12గం.';

  @override
  String get secLayer4Title => 'లోకల్ ప్రవేశ రక్షణ';

  @override
  String get secLayer4Desc =>
      'యాప్ 6-అంకెల PIN మరియు/లేదా బయోమెట్రిక్స్ (Face ID, వేలిముద్ర) ద్వారా రక్షించబడుతుంది. చాలా ఎక్కువ విఫల ప్రయత్నాల తర్వాత, ప్రతి విఫలం తర్వాత పెరుగుతున్న ఆలస్యంతో యాప్ లాక్ అవుతుంది.';

  @override
  String get secLayer5Title => 'లాక్ చేయబడిన డేటాబేస్';

  @override
  String get secLayer5Desc =>
      'సర్వర్ వైపు, ఏ వినియోగదారు డేటాబేస్‌కు నేరుగా రాయలేరు. అన్ని చర్యలు ప్రతి అభ్యర్థనను ధృవీకరించే సురక్షిత ఫంక్షన్ల ద్వారా వెళతాయి.';

  @override
  String get secLayer5Detail =>
      'ఇది బ్యాంక్ కౌంటర్ లాంటిది: మీరు ఎప్పుడూ వాల్ట్‌ను మీరే తాకరు. మీరు అభ్యర్థన చేస్తారు, మరియు చర్య చేయడానికి ముందు సిస్టమ్ మీకు హక్కు ఉందో లేదో తనిఖీ చేస్తుంది.';

  @override
  String get secVashLabel => 'ప్రపంచంలో ఏకైకం';

  @override
  String get secVashTitle => 'Vash మోడ్';

  @override
  String get secVashSubtitle =>
      'ఏ ఇతర మెసేజింగ్ యాప్‌లోనూ ఉనికిలో లేని అత్యవసర భద్రతా వ్యవస్థ.';

  @override
  String get secVashScenarioTitle => 'ఈ పరిస్థితిని ఊహించుకోండి';

  @override
  String get secVashScenario1 => 'ఎవరో మీ ఫోన్‌ను యాక్సెస్ చేస్తారు';

  @override
  String get secVashScenario2 => 'మీ PIN కోడ్ అడుగుతారు';

  @override
  String get secVashScenario3 =>
      'మీ మొత్తం డేటాను అత్యవసరంగా తొలగించాలనుకుంటున్నారు';

  @override
  String get secVashSolutionTitle => 'పరిష్కారం: రెండు PIN కోడ్‌లు';

  @override
  String get secVashSolutionDesc =>
      'మీరు Hash లో రెండు వేర్వేరు PIN కోడ్‌లను కాన్ఫిగర్ చేస్తారు:';

  @override
  String get secVashNormalCodeLabel => 'సాధారణ కోడ్';

  @override
  String get secVashNormalCodeDesc =>
      'మీ మొత్తం డేటాతో యాప్‌ను సాధారణంగా తెరుస్తుంది';

  @override
  String get secVashCodeLabel2 => 'Vash కోడ్';

  @override
  String get secVashCodeDescription =>
      'యాప్‌ను సాధారణంగా తెరుస్తుంది... కానీ నేపథ్యంలో మీ మొత్తం డేటా నిశ్శబ్దంగా తొలగించబడుతుంది';

  @override
  String get secVashWhatHappensTitle => 'తర్వాత ఏమి జరుగుతుంది';

  @override
  String get secVashWhatHappensDesc =>
      'యాప్ సాధారణంగా తెరుచుకుంటుంది. అలర్ట్ లేదు, అనుమానాస్పద యానిమేషన్ లేదు. స్క్రీన్‌లో ఖాళీ యాప్ కనిపిస్తుంది, మీరు ఇప్పుడే ఇన్‌స్టాల్ చేసినట్లు.\n\nవాస్తవంలో, మీ అన్ని సంభాషణలు, పరిచయాలు మరియు సందేశాలు సెకను భాగంలో తిరిగి మార్చలేనిదిగా తొలగించబడ్డాయి.';

  @override
  String get secCallsLabel => 'కాల్‌లు & ఫైళ్ళు';

  @override
  String get secCallsTitle => 'అన్నీ ఎన్‌క్రిప్ట్ చేయబడ్డాయి';

  @override
  String get secCallsSubtitle =>
      'ఇది సందేశాలు మాత్రమే కాదు. Hash ద్వారా వెళ్ళే ప్రతిదీ ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్టెడ్.';

  @override
  String get secAudioCallTitle => 'ఆడియో కాల్‌లు';

  @override
  String get secAudioCallDesc =>
      'WebRTC ద్వారా ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్టెడ్. వాయిస్ పరికరాల మధ్య నేరుగా ప్రసారం చేయబడుతుంది.';

  @override
  String get secVideoCallTitle => 'వీడియో కాల్‌లు';

  @override
  String get secVideoCallDesc =>
      'అదే సాంకేతికత, ప్రతి స్ట్రీమ్ వ్యక్తిగతంగా ఎన్‌క్రిప్ట్ చేయబడుతుంది.';

  @override
  String get secPhotosTitle => 'ఫోటోలు & వీడియోలు';

  @override
  String get secPhotosDesc =>
      'మీ ఫోన్ వదలడానికి ముందే AES-256-GCM లో ఎన్‌క్రిప్ట్ చేయబడతాయి.';

  @override
  String get secDocsTitle => 'డాక్యుమెంట్లు';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, ఏ ఫైల్ అయినా. పేరు, పరిమాణం మరియు విషయం ఎన్‌క్రిప్ట్ చేయబడతాయి.';

  @override
  String get secAnonLabel => 'అనామకత';

  @override
  String get secAnonTitle => 'గుర్తింపు అవసరం లేదు';

  @override
  String get secAnonSubtitle =>
      'Hash మీ ఫోన్ నంబర్ లేదా ఇమెయిల్ ఎప్పుడూ అడగదు. మీరు ఒక ప్రత్యేక మరియు అనామక Hash ID ద్వారా గుర్తించబడతారు.';

  @override
  String get secHashIdTitle => 'మీ Hash ID';

  @override
  String get secHashIdDesc =>
      'ఇది మీ ప్రత్యేక ఐడెంటిఫైయర్. ఇది మీ గురించి ఏమీ వెల్లడించదు: మీ పేరు కాదు, మీ నంబర్ కాదు, మీ స్థానం కాదు. ఇది మీ నిజమైన గుర్తింపుతో అనుసంధానించడం అసాధ్యమైన మారుపేరు లాంటిది.\n\nపరిచయాన్ని జోడించడానికి, మీరు మీ Hash ID షేర్ చేయడం లేదా QR code స్కాన్ చేయడం. అంతే. సింక్ చేయబడిన అడ్రస్ బుక్ లేదు, \"మీకు తెలిసిన వ్యక్తులు\" సూచనలు లేవు.';

  @override
  String get secDataLabel => 'డేటా';

  @override
  String get secDataTitle => 'Hash కు తెలియని విషయాలు';

  @override
  String get secDataSubtitle =>
      'మీ డేటాను రక్షించే ఉత్తమ మార్గం దానిని సేకరించకపోవడం.';

  @override
  String get secNeverCollected => 'ఎప్పుడూ సేకరించబడదు';

  @override
  String get secNeverItem1 => 'సందేశ విషయం';

  @override
  String get secNeverItem2 => 'పరిచయ జాబితా';

  @override
  String get secNeverItem3 => 'ఫోన్ నంబర్';

  @override
  String get secNeverItem4 => 'ఇమెయిల్ అడ్రస్';

  @override
  String get secNeverItem5 => 'IP అడ్రస్';

  @override
  String get secNeverItem6 => 'స్థానం';

  @override
  String get secNeverItem7 => 'మెటాడేటా (ఎవరు ఎవరితో మాట్లాడతారు)';

  @override
  String get secNeverItem8 => 'కాల్ చరిత్ర';

  @override
  String get secNeverItem9 => 'అడ్రస్ బుక్';

  @override
  String get secNeverItem10 => 'ప్రకటన ఐడెంటిఫైయర్లు';

  @override
  String get secTempStored => 'తాత్కాలికంగా నిల్వ చేయబడింది';

  @override
  String get secTempItem1 => 'అనామక Hash ID (ప్రత్యేక ఐడెంటిఫైయర్)';

  @override
  String get secTempItem2 => 'పబ్లిక్ ఎన్‌క్రిప్షన్ కీలు';

  @override
  String get secTempItem3 =>
      'రవాణాలో ఉన్న ఎన్‌క్రిప్టెడ్ సందేశాలు (గరిష్టంగా 24 గం)';

  @override
  String get secTempNote =>
      'ఈ కనిష్ట డేటా కూడా మిమ్మల్ని గుర్తించలేదు. మీ Hash ID ఏ వ్యక్తిగత సమాచారంతో అనుసంధానించబడలేదు.';

  @override
  String get secFooterTitle => 'మీ గోప్యత, మీ స్వేచ్ఛ';

  @override
  String get secFooterDesc =>
      'Hash అత్యంత డిమాండింగ్ వృత్తిపరమైన అప్లికేషన్‌ల వలే అదే ఎన్‌క్రిప్షన్ సాంకేతికతలను ఉపయోగిస్తుంది. మీ సందేశాలు గణితశాస్త్రం ద్వారా రక్షించబడతాయి, వాగ్దానాల ద్వారా కాదు.';

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
