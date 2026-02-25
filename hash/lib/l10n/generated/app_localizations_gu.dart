// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'શૂન્ય નિશાન. શૂન્ય સમાધાન.';

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
  String get conversations => 'ચેટ્સ';

  @override
  String get contacts => 'સંપર્કો';

  @override
  String get noConversation => 'કોઈ ચેટ નથી';

  @override
  String get noConversationSubtitle =>
      'સુરક્ષિત રીતે ચેટ શરૂ કરવા માટે સંપર્ક ઉમેરો';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count બાકી વિનંતીઓ',
      one: '1 બાકી વિનંતી',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count મોકલેલી વિનંતીઓ બાકી',
      one: '1 મોકલેલી વિનંતી બાકી',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'સંપર્ક ઉમેરો';

  @override
  String get shareApp => 'એપ્લિકેશન શેર કરો';

  @override
  String get newMessage => 'નવો સંદેશ';

  @override
  String get newConversation => 'સંદેશ મોકલો';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get myHashId => 'મારું Hash ID';

  @override
  String get supportHash => 'Hash ને સપોર્ટ કરો';

  @override
  String get supportHashSubtitle => 'Hash એક બિન-નફાકારક પ્રોજેક્ટ છે';

  @override
  String get donate => 'દાન કરો';

  @override
  String get appearance => 'દેખાવ';

  @override
  String get theme => 'થીમ';

  @override
  String get themeAuto => 'ઓટોમેટિક';

  @override
  String get themeAutoSubtitle => 'સિસ્ટમ સેટિંગ્સ અનુસરે છે';

  @override
  String get themeDark => 'ડાર્ક';

  @override
  String get themeLight => 'લાઇટ';

  @override
  String get themeRecommendation =>
      'વધુ ગોપનીયતા માટે ડાર્ક થીમ ભલામણ કરવામાં આવે છે';

  @override
  String get language => 'ભાષા';

  @override
  String get languageAuto => 'ઓટોમેટિક (સિસ્ટમ)';

  @override
  String get notifications => 'સૂચનાઓ';

  @override
  String get messages => 'સંદેશાઓ';

  @override
  String get calls => 'કોલ્સ';

  @override
  String get vibration => 'વાઇબ્રેશન';

  @override
  String get notificationContent => 'સૂચના સામગ્રી';

  @override
  String get notificationContentFull => 'બધું બતાવો';

  @override
  String get notificationContentFullDesc => 'સંપર્કનું નામ અને સંદેશ પ્રીવ્યૂ';

  @override
  String get notificationContentName => 'ફક્ત નામ';

  @override
  String get notificationContentNameDesc => 'ફક્ત સંપર્કનું નામ બતાવે છે';

  @override
  String get notificationContentDiscrete => 'ગુપ્ત';

  @override
  String get notificationContentDiscreteDesc => 'ફક્ત \"નવો સંદેશ\" બતાવે છે';

  @override
  String get security => 'સુરક્ષા';

  @override
  String get howHashProtectsYou => 'Hash તમને કેવી રીતે સુરક્ષિત રાખે છે';

  @override
  String get howHashProtectsYouSubtitle => 'તમારી સુરક્ષા સમજો';

  @override
  String get accountSecurity => 'એકાઉન્ટ સુરક્ષા';

  @override
  String get accountSecuritySubtitle => 'PIN, બાયોમેટ્રિક્સ, Vash મોડ';

  @override
  String get blockScreenshots => 'સ્ક્રીનશોટ બ્લોક કરો';

  @override
  String get transferDevice => 'બીજા ઉપકરણ પર ટ્રાન્સફર કરો';

  @override
  String get transferDeviceSubtitle => 'તમારું એકાઉન્ટ માઇગ્રેટ કરો';

  @override
  String get pinCode => 'PIN કોડ';

  @override
  String get changePin => 'PIN કોડ બદલો';

  @override
  String get currentPin => 'વર્તમાન PIN કોડ';

  @override
  String get newPin => 'નવો PIN કોડ';

  @override
  String get confirmPin => 'PIN કોડ કન્ફર્મ કરો';

  @override
  String get pinChanged => 'PIN કોડ બદલાયો';

  @override
  String get incorrectPin => 'ખોટો PIN';

  @override
  String get pinsDoNotMatch => 'PIN મેળ ખાતા નથી';

  @override
  String get autoLock => 'ઓટો-લોક';

  @override
  String get autoLockDelay => 'લોક વિલંબ';

  @override
  String get autoLockImmediate => 'તાત્કાલિક';

  @override
  String get autoLockMinute => '1 મિનિટ';

  @override
  String autoLockMinutes(int count) {
    return '$count મિનિટ';
  }

  @override
  String get vashCode => 'Vash કોડ';

  @override
  String get vashModeTitle => 'Vash મોડ';

  @override
  String get vashModeExplanation => 'તમારું અંતિમ સુરક્ષા જાળ.';

  @override
  String get vashModeDescription =>
      'તમે બીજો PIN કોડ પસંદ કરશો. જો તમને ક્યારેય Hash ખોલવા માટે મજબૂર કરવામાં આવે, તો તમારા સામાન્ય PIN ની જગ્યાએ આ કોડ દાખલ કરો.\n\nએપ્લિકેશન સામાન્ય રીતે ખુલશે, પરંતુ તમારી બધી વાતચીતો અને સંપર્કો ગાયબ થઈ જશે.\n\nતમારી સ્ક્રીન જોતા કોઈપણ માટે, Hash ખાલી દેખાશે — જાણે તમે ક્યારેય ઉપયોગ કર્યો ન હોય.';

  @override
  String get vashModeIrreversible => 'આ ક્રિયા શાંત અને ઉલટાવી ન શકાય તેવી છે.';

  @override
  String get chooseVashCode => 'મારો Vash કોડ પસંદ કરો';

  @override
  String get vashCodeInfo =>
      'બીજો PIN કોડ જે એપ્લિકેશન સામાન્ય રીતે ખોલે છે, પરંતુ ખાલી.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'જો તમે તમારા PIN ની જગ્યાએ આ કોડ દાખલ કરો:';

  @override
  String get vashDeleteContacts => 'તમારા સંપર્કો ગાયબ થાય છે';

  @override
  String get vashDeleteMessages => 'તમારી વાતચીતો ગાયબ થાય છે';

  @override
  String get vashDeleteHistory => 'તમારી નોંધો ગાયબ થાય છે';

  @override
  String get vashKeepId => 'તમારી Hash ઓળખ (#XXX-XXX-XXX) એ જ રહે છે';

  @override
  String get vashAppearNormal =>
      'એપ્લિકેશન સામાન્ય પણ ખાલી દેખાય છે, નવી જેવી. આ ક્રિયા ઉલટાવી ન શકાય તેવી છે.';

  @override
  String get setupVashCode => 'Vash કોડ સેટ કરો';

  @override
  String get modifyVashCode => 'Vash કોડ બદલો';

  @override
  String get currentVashCode => 'વર્તમાન Vash કોડ';

  @override
  String get newVashCode => 'નવો Vash કોડ';

  @override
  String get confirmVashCode => 'Vash કોડ કન્ફર્મ કરો';

  @override
  String get vashCodeConfigured => 'Vash કોડ ગોઠવાયો';

  @override
  String get vashCodeModified => 'Vash કોડ બદલાયો';

  @override
  String get vashCodeMustDiffer => 'Vash કોડ PIN થી અલગ હોવો જોઈએ';

  @override
  String get incorrectVashCode => 'ખોટો Vash કોડ';

  @override
  String get vashWhatToDelete => 'Vash મોડ શું ગાયબ કરે?';

  @override
  String get vashDeleteContactsOption => 'સંપર્કો';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'સંદેશાઓ';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'નોંધો';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash મોડ સક્રિય થયો';

  @override
  String get vashCreateSubtitle => 'તમારા મુખ્ય PIN થી અલગ કોડ પસંદ કરો';

  @override
  String get vashConfirmSubtitle => 'તમારો Vash કોડ કન્ફર્મ કરો';

  @override
  String get pinCodeForEntry => 'એપ્લિકેશનમાં પ્રવેશ માટે PIN કોડ';

  @override
  String get vashCodeSection => 'Vash મોડ';

  @override
  String get biometric => 'બાયોમેટ્રિક';

  @override
  String get biometricUnlock => 'ફિંગરપ્રિન્ટ અથવા Face ID થી અનલૉક કરો';

  @override
  String get enableBiometric => 'બાયોમેટ્રિક સક્ષમ કરો';

  @override
  String get biometricWarningMessage =>
      'બાયોમેટ્રિક સક્ષમ કરવાથી, તમે એપ્લિકેશનમાં પ્રવેશ કરવા માટે Vash કોડ વાપરી શકશો નહીં.\n\nતમે ફક્ત Vash કોડનો ઉપયોગ કરી શકશો જો બાયોમેટ્રિક નિષ્ફળ જાય (અનેક નિષ્ફળ પ્રયાસો પછી).\n\nશું તમે ચાલુ રાખવા માંગો છો?';

  @override
  String get understood => 'સમજી ગયા';

  @override
  String get shareAppSubtitle => 'તમારા પ્રિયજનો સાથે Hash શેર કરો';

  @override
  String get share => 'શેર કરો';

  @override
  String get danger => 'ખતરો';

  @override
  String get deleteAccount => 'મારું એકાઉન્ટ ડિલીટ કરો';

  @override
  String get deleteAccountSubtitle => 'ઉલટાવી ન શકાય તેવી ક્રિયા';

  @override
  String get deleteAccountConfirmTitle => 'મારું એકાઉન્ટ ડિલીટ કરો';

  @override
  String get deleteAccountConfirmMessage =>
      'તમારું એકાઉન્ટ કાયમી ધોરણે ડિલીટ થશે. આ ક્રિયા ઉલટાવી ન શકાય તેવી છે.\n\n• તમારી બધી ચેટ્સ\n• તમારા બધા સંપર્કો\n• તમારું Hash ID\n\nતમારે નવું એકાઉન્ટ બનાવવું પડશે.';

  @override
  String get deleteForever => 'કાયમી ડિલીટ કરો';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash મોડ સક્રિય થયો.';

  @override
  String deletionError(String error) {
    return 'ડિલીટ કરવામાં ભૂલ: $error';
  }

  @override
  String get yourSecurity => 'તમારી સુરક્ષા';

  @override
  String get securityInfo =>
      '• એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શન (Signal Protocol)\n• ડિલિવરી પછી અમારા સર્વર પર કોઈ ડેટા નહીં\n• કી ફક્ત તમારા ઉપકરણ પર સંગ્રહિત\n• PIN કોડ ક્યારેય સર્વર પર મોકલાતો નથી';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'સ્વાગત છે';

  @override
  String get securityStatement1 => 'તમારા સંદેશાઓ સુરક્ષિત છે.';

  @override
  String get securityStatement2 => 'એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શન.';

  @override
  String get securityStatement3 => 'કોઈ નિશાન નહીં. કોઈ સમાધાન નહીં.';

  @override
  String get securityStatement4 => 'તમારી ગોપનીયતા એક અધિકાર છે.';

  @override
  String get accessBlocked => 'ઍક્સેસ બ્લોક થયેલ છે';

  @override
  String get tooManyAttempts => 'ઘણા બધા પ્રયાસો. પછીથી ફરી પ્રયાસ કરો.';

  @override
  String get pleaseWait => 'કૃપા કરીને રાહ જુઓ';

  @override
  String get waitDelay => 'કૃપા કરીને વિલંબ પૂરો થવાની રાહ જુઓ';

  @override
  String attemptCount(int current, int max) {
    return 'પ્રયાસ $current માંથી $max';
  }

  @override
  String retryIn(String time) {
    return '$time માં ફરી પ્રયાસ કરો';
  }

  @override
  String get forgotPin => 'PIN ભૂલી ગયા? રિકવરી ફ્રેઝ વાપરો';

  @override
  String get useRecoveryPhrase => 'રિકવરી ફ્રેઝ વાપરો';

  @override
  String get recoveryWarningTitle => 'ચેતવણી';

  @override
  String get recoveryWarningMessage => 'એકાઉન્ટ રિકવરી:';

  @override
  String get recoveryDeleteAllMessages => 'તમારા બધા સંદેશાઓ ડિલીટ કરશે';

  @override
  String get recoveryWaitDelay => '1 કલાકનો વિલંબ જરૂરી';

  @override
  String get recoveryKeepContacts => 'તમારા સંપર્કો રાખશે';

  @override
  String get recoveryIrreversible =>
      'આ ક્રિયા ઉલટાવી ન શકાય તેવી છે. તમારા સંદેશાઓ કાયમી ધોરણે ગુમ થશે.';

  @override
  String get iUnderstand => 'હું સમજું છું';

  @override
  String get accountRecovery => 'એકાઉન્ટ રિકવરી';

  @override
  String get enterRecoveryPhrase =>
      'તમારા રિકવરી ફ્રેઝના 24 શબ્દો દાખલ કરો, સ્પેસ દ્વારા અલગ કરો.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'રિકવર કરો';

  @override
  String get recoveryPhraseRequired => 'કૃપા કરીને તમારો રિકવરી ફ્રેઝ દાખલ કરો';

  @override
  String get recoveryPhrase24Words => 'ફ્રેઝમાં ચોક્કસ 24 શબ્દો હોવા જોઈએ';

  @override
  String get incorrectRecoveryPhrase => 'ખોટો રિકવરી ફ્રેઝ';

  @override
  String get recoveryInitError => 'રિકવરી આરંભ કરવામાં ભૂલ';

  @override
  String get securityDelay => 'સુરક્ષા વિલંબ';

  @override
  String get securityDelayMessage =>
      'તમારી સુરક્ષા માટે, નવો PIN બનાવતા પહેલાં રાહ જોવાનો સમય જરૂરી છે.';

  @override
  String get timeRemaining => 'બાકી સમય';

  @override
  String get messagesDeletedForProtection =>
      'તમારી સુરક્ષા માટે તમારા સંદેશાઓ ડિલીટ કરવામાં આવ્યા છે.';

  @override
  String get canCloseApp => 'તમે એપ્લિકેશન બંધ કરીને પછીથી પાછા આવી શકો છો.';

  @override
  String get onboardingTitle1 => 'Hash માં સ્વાગત છે';

  @override
  String get onboardingSubtitle1 => 'કોઈ નિશાન ન છોડતી મેસેન્જર';

  @override
  String get onboardingTitle2 => 'સંપૂર્ણ એન્ક્રિપ્શન';

  @override
  String get onboardingSubtitle2 =>
      'તમારા સંદેશાઓ Signal Protocol સાથે એન્ડ-ટુ-એન્ડ એન્ક્રિપ્ટેડ છે';

  @override
  String get onboardingTitle3 => 'કોઈ નિશાન નહીં';

  @override
  String get onboardingSubtitle3 =>
      'ડિલિવરી પછી સર્વરમાંથી સંદેશાઓ ડિલીટ થાય છે';

  @override
  String get onboardingTitle4 => 'તમારી સુરક્ષા';

  @override
  String get onboardingSubtitle4 => 'PIN કોડ, Vash મોડ અને રિકવરી ફ્રેઝ';

  @override
  String get getStarted => 'શરૂ કરો';

  @override
  String get next => 'આગળ';

  @override
  String get skip => 'છોડો';

  @override
  String get alreadyHaveAccount => 'મારી પાસે પહેલેથી એકાઉન્ટ છે';

  @override
  String get transferMyAccount => 'મારું એકાઉન્ટ ટ્રાન્સફર કરો';

  @override
  String get createPin => 'PIN કોડ બનાવો';

  @override
  String get createPinSubtitle =>
      'આ કોડ તમારી એપ્લિકેશનની ઍક્સેસ સુરક્ષિત કરશે';

  @override
  String get confirmYourPin => 'તમારો PIN કોડ કન્ફર્મ કરો';

  @override
  String get confirmPinSubtitle => 'તમારો PIN કોડ ફરીથી દાખલ કરો';

  @override
  String get saveRecoveryPhrase => 'રિકવરી ફ્રેઝ';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'આ 24 શબ્દો ક્રમમાં લખો. જો તમે PIN ભૂલી જાઓ તો તે તમને એકાઉન્ટ રિકવર કરવા દેશે.';

  @override
  String get phraseWritten => 'મેં મારો ફ્રેઝ લખી લીધો';

  @override
  String get warningRecoveryPhrase =>
      'જો તમે આ ફ્રેઝ ગુમાવો અને PIN ભૂલી જાઓ, તો તમે એકાઉન્ટની ઍક્સેસ ગુમાવશો.';

  @override
  String get accountTransferred => 'એકાઉન્ટ ટ્રાન્સફર થયું';

  @override
  String get accountTransferredMessage =>
      'તમારું એકાઉન્ટ બીજા ઉપકરણ પર ટ્રાન્સફર થયું છે. આ સેશન હવે માન્ય નથી.';

  @override
  String get accountTransferredInfo =>
      'જો તમે આ ટ્રાન્સફર શરૂ કર્યું નથી, તો તમારું એકાઉન્ટ કમ્પ્રોમાઇઝ થયું હોઈ શકે છે.';

  @override
  String get logout => 'લૉગ આઉટ';

  @override
  String get transferAccount => 'એકાઉન્ટ ટ્રાન્સફર કરો';

  @override
  String get transferAccountInfo =>
      'તમારું Hash એકાઉન્ટ નવા ઉપકરણ પર ટ્રાન્સફર કરો. તમારું વર્તમાન સેશન અમાન્ય થશે.';

  @override
  String get generateTransferCode => 'ટ્રાન્સફર કોડ જનરેટ કરો';

  @override
  String get transferCode => 'ટ્રાન્સફર કોડ';

  @override
  String transferCodeExpires(int minutes) {
    return 'આ કોડ $minutes મિનિટમાં એક્સપાયર થશે';
  }

  @override
  String get enterCodeOnNewDevice =>
      'તમારું એકાઉન્ટ ટ્રાન્સફર કરવા માટે તમારા નવા ઉપકરણ પર આ કોડ દાખલ કરો.';

  @override
  String get generateNewCode => 'નવો કોડ જનરેટ કરો';

  @override
  String get scanQrCode => 'QR કોડ સ્કેન કરો';

  @override
  String get scanQrCodeSubtitle => 'સંપર્ક ઉમેરવા માટે તેમનો QR કોડ સ્કેન કરો';

  @override
  String get qrCodeDetected => 'QR કોડ મળ્યો';

  @override
  String get invalidQrCode => 'અમાન્ય QR કોડ';

  @override
  String get cameraPermissionRequired => 'કેમેરા પરવાનગી જરૂરી';

  @override
  String get myQrCode => 'મારો QR કોડ';

  @override
  String get myQrCodeSubtitle =>
      'તમારા સંપર્કો તમને ઉમેરી શકે તે માટે આ QR કોડ શેર કરો';

  @override
  String get shareQrCode => 'શેર કરો';

  @override
  String get addContactTitle => 'સંપર્ક ઉમેરો';

  @override
  String get addContactByHashId => 'તમારા સંપર્કનું Hash ID દાખલ કરો';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'શોધો';

  @override
  String get contactNotFound => 'સંપર્ક મળ્યો નથી';

  @override
  String get contactAlreadyAdded => 'આ સંપર્ક પહેલેથી તમારી યાદીમાં છે';

  @override
  String get contactAdded => 'સંપર્ક ઉમેરાયો';

  @override
  String get myProfile => 'મારી પ્રોફાઇલ';

  @override
  String get myProfileSubtitle =>
      'અન્ય લોકો તમને ઉમેરી શકે તે માટે આ માહિતી શેર કરો';

  @override
  String get temporaryCode => 'અસ્થાયી કોડ';

  @override
  String temporaryCodeExpires(String time) {
    return '$time માં એક્સપાયર થાય છે';
  }

  @override
  String get codeExpired => 'કોડ એક્સપાયર થયો';

  @override
  String get generateNewCodeButton => 'નવો કોડ';

  @override
  String get copyHashId => 'ID કૉપી કરો';

  @override
  String get copyCode => 'કોડ કૉપી કરો';

  @override
  String get copiedToClipboard => 'કૉપી થયું';

  @override
  String get showMyQrCode => 'મારો QR કોડ બતાવો';

  @override
  String get orDivider => 'અથવા';

  @override
  String get openScanner => 'સ્કેનર ખોલો';

  @override
  String get addManually => 'જાતે ઉમેરો';

  @override
  String get contactHashIdLabel => 'સંપર્કનું Hash ID';

  @override
  String get temporaryCodeLabel => 'અસ્થાયી કોડ';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'તમારા સંપર્કને તેમની પ્રોફાઇલમાંથી કોડ જનરેટ કરવા કહો';

  @override
  String get verifyAndAdd => 'ચકાસો અને ઉમેરો';

  @override
  String get fillAllFields => 'કૃપા કરીને બધા ફીલ્ડ ભરો';

  @override
  String get invalidHashIdFormat => 'અમાન્ય ID ફોર્મેટ (દા.ત.: 123-456-ABC)';

  @override
  String get userNotFound => 'વપરાશકર્તા મળ્યો નથી';

  @override
  String get cannotAddYourself => 'તમે તમારી જાતને ઉમેરી શકતા નથી';

  @override
  String get invalidOrExpiredCode => 'અમાન્ય અથવા એક્સપાયર થયેલો અસ્થાયી કોડ';

  @override
  String get contactFound => 'સંપર્ક મળ્યો!';

  @override
  String get howToCallContact => 'તમે તેમને શું નામ આપવા માંગો છો?';

  @override
  String get contactNameHint => 'સંપર્કનું નામ';

  @override
  String get addContactButton => 'ઉમેરો';

  @override
  String get contactDetails => 'સંપર્ક વિગતો';

  @override
  String get contactName => 'સંપર્કનું નામ';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return '$date ના રોજ ઉમેરાયો';
  }

  @override
  String get deleteContact => 'સંપર્ક ડિલીટ કરો';

  @override
  String deleteContactConfirm(Object name) {
    return 'આ સંપર્ક ડિલીટ કરશો?';
  }

  @override
  String get deleteContactMessage => 'આ ચેટ પણ ડિલીટ કરશે.';

  @override
  String get delete => 'ડિલીટ';

  @override
  String get typeMessage => 'સંદેશ લખો...';

  @override
  String get messageSent => 'મોકલાયો';

  @override
  String get messageDelivered => 'પહોંચાડાયો';

  @override
  String get messageRead => 'વાંચ્યો';

  @override
  String get messageFailed => 'મોકલવામાં નિષ્ફળ';

  @override
  String get now => 'હમણાં';

  @override
  String minutesAgo(int count) {
    return '$countમિ';
  }

  @override
  String hoursAgo(int count) {
    return '$countક';
  }

  @override
  String daysAgo(int count) {
    return '$countદિ';
  }

  @override
  String get today => 'આજે';

  @override
  String get yesterday => 'ગઈકાલે';

  @override
  String dateAtTime(String date, String time) {
    return '$date ના $time વાગ્યે';
  }

  @override
  String get shareMessage =>
      'Hash પર મારી સાથે જોડાઓ! 🔒\n\nઆ ખરેખર ખાનગી મેસેન્જર છે: સંપૂર્ણ એન્ક્રિપ્શન, સર્વર પર કોઈ નિશાન નહીં, અને જરૂર પડે ત્યારે પેનિક મોડ.\n\nએપ્લિકેશન અહીંથી ડાઉનલોડ કરો 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'ભૂલ';

  @override
  String get ok => 'ઠીક';

  @override
  String get view => 'જુઓ';

  @override
  String get yes => 'હા';

  @override
  String get no => 'ના';

  @override
  String get save => 'સેવ';

  @override
  String get edit => 'ફેરફાર';

  @override
  String get close => 'બંધ';

  @override
  String get confirm => 'કન્ફર્મ';

  @override
  String get loading => 'લોડ થઈ રહ્યું છે...';

  @override
  String get retry => 'ફરી પ્રયાસ';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'બાકી વિનંતીઓ';

  @override
  String get noPendingRequests => 'કોઈ બાકી વિનંતી નથી';

  @override
  String get pendingRequestsSubtitle => 'આ લોકો તમને ઉમેરવા માંગે છે';

  @override
  String requestFromUser(String hashId) {
    return '$hashId તરફથી વિનંતી';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days દિવસમાં એક્સપાયર થાય છે';
  }

  @override
  String get acceptRequest => 'સ્વીકારો';

  @override
  String get rejectRequest => 'નકારો';

  @override
  String get requestAccepted => 'વિનંતી સ્વીકારાઈ';

  @override
  String get requestRejected => 'વિનંતી નકારાઈ';

  @override
  String get requestSent => 'વિનંતી મોકલાઈ!';

  @override
  String get requestSentSubtitle =>
      'તમારી વિનંતી મોકલાઈ છે. ચેટ કરતા પહેલાં વપરાશકર્તાએ તેને સ્વીકારવી આવશ્યક છે.';

  @override
  String get requestAlreadyPending => 'એક વિનંતી પહેલેથી બાકી છે';

  @override
  String get requestAlreadySentByOther =>
      'આ વ્યક્તિએ તમને પહેલેથી વિનંતી મોકલી છે';

  @override
  String get addByHashId => 'Hash ID દ્વારા ઉમેરો';

  @override
  String get addByHashIdSubtitle =>
      'સંપર્કનું Hash ID અને અસ્થાયી કોડ દાખલ કરો';

  @override
  String get enterTemporaryCode => '6-અંકનો કોડ દાખલ કરો';

  @override
  String get sendRequest => 'વિનંતી મોકલો';

  @override
  String get acceptContactTitle => 'સંપર્ક સ્વીકારો';

  @override
  String get acceptContactSubtitle => 'તમે તેમને કસ્ટમ નામ આપી શકો છો';

  @override
  String get leaveEmptyForHashId => 'Hash ID વાપરવા માટે ખાલી છોડો';

  @override
  String get firstName => 'પ્રથમ નામ';

  @override
  String get lastName => 'અટક';

  @override
  String get notes => 'નોંધો';

  @override
  String get notesHint => 'આ સંપર્ક વિશે વ્યક્તિગત નોંધો';

  @override
  String get photoOptional => 'ફોટો (વૈકલ્પિક)';

  @override
  String get contactNameOptional => 'નામ (વૈકલ્પિક)';

  @override
  String get notesOptional => 'નોંધો (વૈકલ્પિક)';

  @override
  String get storedLocally => 'ફક્ત તમારા ઉપકરણ પર સંગ્રહિત';

  @override
  String get encryptedMessageLabel => 'એન્ક્રિપ્ટેડ સંદેશ';

  @override
  String get identityMessageHint =>
      'તમે કોણ છો? તમે એકબીજાને કેવી રીતે ઓળખો છો?';

  @override
  String get messageWillBeSentEncrypted =>
      'આ સંદેશ એન્ક્રિપ્ટ થઈને પ્રાપ્તકર્તાને મોકલાશે';

  @override
  String get sendRequestButton => 'વિનંતી મોકલો';

  @override
  String get requestExpiresIn24h =>
      'સ્વીકારવામાં ન આવે તો વિનંતી 24 કલાકમાં એક્સપાયર થાય છે';

  @override
  String get theyAlreadySentYouRequest =>
      'આ વ્યક્તિએ તમને પહેલેથી વિનંતી મોકલી છે';

  @override
  String get requests => 'વિનંતીઓ';

  @override
  String get receivedRequests => 'મળેલી';

  @override
  String get sentRequests => 'મોકલેલી';

  @override
  String get noSentRequests => 'કોઈ મોકલેલી વિનંતી નથી';

  @override
  String get cancelRequest => 'રદ કરો';

  @override
  String get deleteRequest => 'વિનંતી ડિલીટ કરો';

  @override
  String get requestCancelled => 'વિનંતી રદ થઈ';

  @override
  String sentTo(String hashId) {
    return '$hashId ને મોકલાઈ';
  }

  @override
  String expiresIn(String time) {
    return '$time માં એક્સપાયર';
  }

  @override
  String receivedAgo(String time) {
    return '$time પહેલાં મળી';
  }

  @override
  String get messageFromRequester => 'વિનંતીકર્તાનો સંદેશ';

  @override
  String get copy => 'કૉપી';

  @override
  String get messageInfo => 'સંદેશ માહિતી';

  @override
  String get messageDirection => 'દિશા';

  @override
  String get messageSentByYou => 'તમારા દ્વારા મોકલાયેલ';

  @override
  String get messageReceived => 'મળેલ';

  @override
  String get messageSentAt => 'ના રોજ મોકલાયો';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'સ્થિતિ';

  @override
  String get messageReadAt => 'ના રોજ વાંચ્યો';

  @override
  String get messageType => 'પ્રકાર';

  @override
  String get messageSize => 'કદ';

  @override
  String get messageExpiresAt => 'ના રોજ એક્સપાયર';

  @override
  String get messageEncrypted => 'એન્ડ-ટુ-એન્ડ એન્ક્રિપ્ટેડ';

  @override
  String get messageStatusSending => 'મોકલાઈ રહ્યો છે...';

  @override
  String get messageStatusSent => 'મોકલાયો';

  @override
  String get messageStatusDelivered => 'પહોંચાડાયો';

  @override
  String get messageStatusRead => 'વાંચ્યો';

  @override
  String get messageStatusFailed => 'નિષ્ફળ';

  @override
  String get serverStatus => 'સર્વર';

  @override
  String get onServer => 'ડિલિવરી બાકી';

  @override
  String get deletedFromServer => 'ડિલીટ થયો';

  @override
  String get messageTypeText => 'ટેક્સ્ટ';

  @override
  String get messageTypeImage => 'છબી';

  @override
  String get messageTypeVideo => 'વીડિયો';

  @override
  String get messageTypeVoice => 'વૉઇસ';

  @override
  String get messageTypeFile => 'ફાઇલ';

  @override
  String get indefinitely => 'અનિશ્ચિત';

  @override
  String get hoursShort => 'ક';

  @override
  String get minutesShort => 'મિ';

  @override
  String get hours => 'કલાક';

  @override
  String get minutes => 'મિનિટ';

  @override
  String get seconds => 'સેકન્ડ';

  @override
  String get ephemeralMessages => 'અલ્પકાલિક સંદેશાઓ';

  @override
  String get ephemeralMessagesDescription =>
      'આ સમય પછી સંદેશાઓ આપોઆપ ડિલીટ થાય છે';

  @override
  String get ephemeralImmediate => 'તાત્કાલિક (વાંચ્યા પછી)';

  @override
  String get ephemeralImmediateDesc => 'વાંચતાં જ ડિલીટ';

  @override
  String get ephemeralMyPreference => 'મારી પસંદગી';

  @override
  String get ephemeralMyPreferenceDesc => 'વૈશ્વિક સેટિંગ વાપરો';

  @override
  String get ephemeralDefaultSetting => 'સંદેશ અવધિ';

  @override
  String get ephemeralChooseDefault => 'ભલામણ કરેલ';

  @override
  String get ephemeral30Seconds => '30 સેકન્ડ';

  @override
  String get ephemeral30SecondsDesc => 'વાંચ્યા પછી 30 સેકન્ડમાં ડિલીટ';

  @override
  String get ephemeral5Minutes => '5 મિનિટ';

  @override
  String get ephemeral5MinutesDesc => 'વાંચ્યા પછી 5 મિનિટમાં ડિલીટ';

  @override
  String get ephemeral1Hour => '1 કલાક';

  @override
  String get ephemeral1HourDesc => 'વાંચ્યા પછી 1 કલાકમાં ડિલીટ';

  @override
  String get ephemeral3Hours => '3 કલાક';

  @override
  String get ephemeral6Hours => '6 કલાક';

  @override
  String get ephemeral6HoursDesc => 'વાંચ્યા પછી 6 કલાકમાં ડિલીટ';

  @override
  String get ephemeral12Hours => '12 કલાક';

  @override
  String get ephemeral24Hours => '24 કલાક';

  @override
  String get ephemeral24HoursDesc => 'વાંચ્યા પછી 24 કલાકમાં ડિલીટ';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'કસ્ટમ અવધિ';

  @override
  String get howItWorks => 'આ કેવી રીતે કામ કરે છે';

  @override
  String get ephemeralExplanation1 =>
      'મળ્યા પછી તરત જ સર્વરમાંથી સંદેશાઓ ડિલીટ થાય છે.';

  @override
  String get ephemeralExplanation2 =>
      'આ સેટિંગ નક્કી કરે છે કે વાંચ્યા પછી તમારા ફોન પરથી સંદેશાઓ ક્યારે ગાયબ થાય છે.';

  @override
  String get ephemeralExplanation3 =>
      'તમારા સંપર્ક પાસે તેમના ફોન માટે પોતાનું સેટિંગ છે.';

  @override
  String get mute1Hour => '1 કલાક';

  @override
  String get mute8Hours => '8 કલાક';

  @override
  String get mute1Day => '1 દિવસ';

  @override
  String get mute1Week => '1 અઠવાડિયું';

  @override
  String get muteAlways => 'હંમેશા';

  @override
  String get muteExplanation => 'તમને આ સંપર્ક માટે સૂચનાઓ મળશે નહીં';

  @override
  String get showCallsInRecents => 'તાજેતરના કોલ્સમાં બતાવો';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash કોલ્સ ફોનના ઈતિહાસમાં દેખાય છે';

  @override
  String get feedback => 'પ્રતિસાદ';

  @override
  String get muteNotifications => 'સૂચનાઓ મ્યૂટ કરો';

  @override
  String get muteDescription => 'તમને આ સંપર્ક માટે સૂચનાઓ મળશે નહીં';

  @override
  String mutedUntil(String time) {
    return '$time સુધી મ્યૂટ';
  }

  @override
  String get notMuted => 'સૂચનાઓ સક્ષમ';

  @override
  String get unmute => 'અનમ્યૂટ';

  @override
  String get notificationSound => 'સૂચના અવાજ';

  @override
  String get defaultSound => 'ડિફૉલ્ટ';

  @override
  String get chatSettings => 'ચેટ સેટિંગ્સ';

  @override
  String get bubbleColor => 'બબલ રંગ';

  @override
  String get backgroundColor => 'પૃષ્ઠભૂમિ રંગ';

  @override
  String get backgroundImage => 'પૃષ્ઠભૂમિ છબી';

  @override
  String get chatBackground => 'ચેટ પૃષ્ઠભૂમિ';

  @override
  String get customColor => 'કસ્ટમ';

  @override
  String get defaultColor => 'ડિફૉલ્ટ';

  @override
  String get imageSelected => 'છબી પસંદ થઈ';

  @override
  String get noImage => 'છબી નથી';

  @override
  String get color => 'રંગ';

  @override
  String get image => 'છબી';

  @override
  String get tapToSelectImage => 'છબી પસંદ કરવા ટેપ કરો';

  @override
  String get changeImage => 'છબી બદલો';

  @override
  String get previewMessageReceived => 'નમસ્તે!';

  @override
  String get previewMessageSent => 'કેમ છો!';

  @override
  String get messageAction => 'સંદેશ';

  @override
  String get callAction => 'કોલ';

  @override
  String get videoAction => 'વીડિયો';

  @override
  String get personalNotes => 'વ્યક્તિગત નોંધો';

  @override
  String get addNotes => 'નોંધો ઉમેરો...';

  @override
  String get noNotes => 'કોઈ નોંધ નથી';

  @override
  String get messageNotifications => 'સંદેશ સૂચનાઓ';

  @override
  String get callNotifications => 'કોલ સૂચનાઓ';

  @override
  String get useGradient => 'ગ્રેડિયન્ટ વાપરો';

  @override
  String get gradientStart => 'શરૂઆતનો રંગ';

  @override
  String get gradientEnd => 'અંતનો રંગ';

  @override
  String get preview => 'પ્રીવ્યૂ';

  @override
  String get reset => 'રીસેટ';

  @override
  String get securityNumber => 'સુરક્ષા નંબર';

  @override
  String securityNumberDescription(String name) {
    return 'ચકાસો કે સુરક્ષા નંબર $name ના ઉપકરણ સાથે મેળ ખાય છે';
  }

  @override
  String get verifyEncryption => 'એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શન ચકાસો';

  @override
  String get tapToCopy => 'કૉપી કરવા ટેપ કરો';

  @override
  String get howToVerify => 'કેવી રીતે ચકાસવું';

  @override
  String get verifyStep1 => 'તમારા સંપર્કને રૂબરૂ મળો અથવા કોલ કરો';

  @override
  String get verifyStep2 => 'સુરક્ષા નંબરોની તુલના કરો અથવા QR કોડ સ્કેન કરો';

  @override
  String get verifyStep3 => 'જો તે મેળ ખાય, તો તમારી ચેટ સુરક્ષિત છે';

  @override
  String get scanToVerify => 'ચકાસવા માટે સ્કેન કરો';

  @override
  String get reportSpam => 'સ્પામ રિપોર્ટ કરો';

  @override
  String get reportSpamSubtitle => 'આ સંપર્કને સ્પામ તરીકે રિપોર્ટ કરો';

  @override
  String get reportSpamDescription =>
      'આ સંપર્ક ગુપ્ત રીતે રિપોર્ટ થશે. તમારી ઓળખ શેર કરવામાં આવશે નહીં. શું તમે ખાતરી કરો છો?';

  @override
  String get report => 'રિપોર્ટ';

  @override
  String get spamReported => 'સ્પામ રિપોર્ટ થયો';

  @override
  String get reportError =>
      'રિપોર્ટ મોકલવામાં નિષ્ફળ. કૃપા કરીને ફરી પ્રયાસ કરો.';

  @override
  String get reportRateLimited =>
      'તમે આજે માટે મહત્તમ રિપોર્ટ મર્યાદા પર પહોંચી ગયા છો.';

  @override
  String get blockContact => 'સંપર્ક બ્લોક કરો';

  @override
  String get blockContactDescription =>
      'આ સંપર્ક હવે તમને સંદેશ અથવા કોલ કરી શકશે નહીં. તેમને જાણ કરવામાં આવશે નહીં.';

  @override
  String get unblockContact => 'સંપર્ક અનબ્લોક કરો';

  @override
  String get unblockContactDescription =>
      'આ સંપર્ક ફરીથી તમને સંદેશ અને કોલ કરી શકશે.';

  @override
  String get contactBlocked => 'સંપર્ક બ્લોક થયો';

  @override
  String get contactUnblocked => 'સંપર્ક અનબ્લોક થયો';

  @override
  String get contactIsBlocked => 'આ સંપર્ક બ્લોક છે';

  @override
  String get unblock => 'અનબ્લોક';

  @override
  String get deleteContactSubtitle => 'આ સંપર્ક અને ચેટ ડિલીટ કરો';

  @override
  String get confirmWithPin => 'PIN સાથે કન્ફર્મ કરો';

  @override
  String get enterPinToConfirm => 'આ ક્રિયા કન્ફર્મ કરવા માટે PIN દાખલ કરો';

  @override
  String get profilePhoto => 'પ્રોફાઇલ ફોટો';

  @override
  String get takePhoto => 'ફોટો લો';

  @override
  String get chooseFromGallery => 'ગેલેરીમાંથી પસંદ કરો';

  @override
  String get removePhoto => 'ફોટો કાઢી નાખો';

  @override
  String get viewContactHashId => 'સંપર્કનું ઓળખકર્તા જુઓ';

  @override
  String get hashIdPartiallyMasked =>
      'તમારી સુરક્ષા અને સંપર્કની ગોપનીયતા માટે આંશિક રીતે છુપાયેલ';

  @override
  String get addFirstContact => 'તમારો પ્રથમ સંપર્ક ઉમેરો';

  @override
  String get addFirstContactSubtitle =>
      'તમારો QR કોડ શેર કરો અથવા મિત્રનો સ્કેન કરો';

  @override
  String get directory => 'ડિરેક્ટરી';

  @override
  String get noContacts => 'કોઈ સંપર્ક નથી';

  @override
  String get noContactsSubtitle => 'શરૂ કરવા માટે સંપર્ક ઉમેરો';

  @override
  String get sendMessageAction => 'સંદેશ મોકલો';

  @override
  String get audioCall => 'ઑડિયો કોલ';

  @override
  String get videoCall => 'વીડિયો કોલ';

  @override
  String get viewProfile => 'પ્રોફાઇલ જુઓ';

  @override
  String get deleteContactDirectory => 'સંપર્ક ડિલીટ કરો';

  @override
  String get scanShort => 'સ્કેન';

  @override
  String get addShort => 'ઉમેરો';

  @override
  String deleteContactConfirmName(String name) {
    return 'શું તમે ખરેખર $name ને ડિલીટ કરવા માંગો છો?';
  }

  @override
  String get noNotesTitle => 'કોઈ નોંધ નથી';

  @override
  String get noNotesSubtitle => 'તમારી પ્રથમ નોંધ બનાવો';

  @override
  String get newNote => 'નવી નોંધ';

  @override
  String get editNote => 'નોંધ ફેરફાર કરો';

  @override
  String get deleteNote => 'નોંધ ડિલીટ કરો';

  @override
  String get deleteNoteConfirm => 'શું તમે ખરેખર આ નોંધ ડિલીટ કરવા માંગો છો?';

  @override
  String get noteTitle => 'શીર્ષક';

  @override
  String get noteContent => 'સામગ્રી';

  @override
  String get addItem => 'આઇટમ ઉમેરો';

  @override
  String get pinNote => 'પિન';

  @override
  String get unpinNote => 'અનપિન';

  @override
  String get noteColor => 'રંગ';

  @override
  String get notePassword => 'પાસવર્ડ';

  @override
  String get setPassword => 'પાસવર્ડ સેટ કરો';

  @override
  String get changePassword => 'પાસવર્ડ બદલો';

  @override
  String get removePassword => 'પાસવર્ડ કાઢી નાખો';

  @override
  String get enterPassword => 'પાસવર્ડ દાખલ કરો';

  @override
  String get confirmPassword => 'પાસવર્ડ કન્ફર્મ કરો';

  @override
  String get passwordPin => 'PIN કોડ';

  @override
  String get passwordText => 'ટેક્સ્ટ પાસવર્ડ';

  @override
  String get protectedNote => 'સુરક્ષિત નોંધ';

  @override
  String get incorrectPassword => 'ખોટો પાસવર્ડ';

  @override
  String get passwordSet => 'પાસવર્ડ સેટ થયો';

  @override
  String get passwordRemoved => 'પાસવર્ડ કાઢી નખાયો';

  @override
  String get notesBiometric => 'નોંધો માટે Face ID';

  @override
  String get notesBiometricSubtitle =>
      'સુરક્ષિત નોંધો ખોલવા માટે બાયોમેટ્રિક પ્રમાણીકરણ જરૂરી';

  @override
  String get textNote => 'ટેક્સ્ટ નોંધ';

  @override
  String get checklistNote => 'ચેકલિસ્ટ';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total કાર્યો';
  }

  @override
  String get autoSaved => 'સેવ થયું';

  @override
  String get searchNotes => 'નોંધો શોધો';

  @override
  String get legalConsent => 'કાનૂની સંમતિ';

  @override
  String get confirmAge13 =>
      'હું ખાતરી કરું છું કે મારી ઉંમર ઓછામાં ઓછી 13 વર્ષ છે';

  @override
  String get acceptLegalStart => 'હું સ્વીકારું છું ';

  @override
  String get privacyPolicy => 'ગોપનીયતા નીતિ';

  @override
  String get termsOfService => 'સેવાની શરતો';

  @override
  String get andThe => ' અને ';

  @override
  String get continueButton => 'ચાલુ રાખો';

  @override
  String get mustAcceptTerms =>
      'ચાલુ રાખવા માટે તમારે બંને શરતો સ્વીકારવી આવશ્યક છે';

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
  String get support => 'સપોર્ટ';

  @override
  String get contactSupport => 'સપોર્ટનો સંપર્ક કરો';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'દુરુપયોગ રિપોર્ટ કરો';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'કાનૂની';

  @override
  String get legalEntity => 'કાનૂની એન્ટિટી';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'પિન';

  @override
  String get unpinConversation => 'અનપિન';

  @override
  String get hideConversation => 'ફીડમાંથી કાઢી નાખો';

  @override
  String get deleteConversation => 'વાતચીત ડિલીટ કરો';

  @override
  String get deleteConversationConfirm =>
      'બધા સંદેશાઓ ડિલીટ કરવાની ખાતરી કરવા PIN દાખલ કરો';

  @override
  String get noConversations => 'હજુ સુધી કોઈ વાતચીત નથી';

  @override
  String get startConversation => 'શરૂ કરો';

  @override
  String get microphonePermissionRequired => 'માઇક્રોફોન ઍક્સેસ જરૂરી';

  @override
  String get microphonePermissionExplanation =>
      'કોલ કરવા માટે Hash ને માઇક્રોફોનની જરૂર છે.';

  @override
  String get cameraPermissionExplanation =>
      'વીડિયો કોલ માટે Hash ને કેમેરાની જરૂર છે.';

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
  String get openSettings => 'સેટિંગ્સ ખોલો';

  @override
  String get callConnecting => 'કનેક્ટ થઈ રહ્યું છે...';

  @override
  String get callRinging => 'રિંગ થઈ રહ્યું છે...';

  @override
  String get callReconnecting => 'ફરી કનેક્ટ થઈ રહ્યું છે...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'ફરી કનેક્ટ થઈ રહ્યું છે (${seconds}s)';
  }

  @override
  String get callPaused => 'થોભાવેલ';

  @override
  String get callPausedSubtitle => 'કૉલ હજુ પણ ચાલુ છે';

  @override
  String get callRemoteMicMuted => 'સંપર્કનો માઇક્રોફોન મ્યૂટ છે';

  @override
  String get callMiniControlsMute => 'મ્યૂટ';

  @override
  String get callMiniControlsUnmute => 'અનમ્યૂટ';

  @override
  String get callMiniControlsHangUp => 'કોલ કાપો';

  @override
  String get callMiniControlsReturn => 'કોલ પર પાછા જાઓ';

  @override
  String get callNetworkPoor => 'અસ્થિર કનેક્શન';

  @override
  String get callNetworkLost => 'કનેક્શન ગુમ';

  @override
  String get callEndedTitle => 'કોલ સમાપ્ત';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'ઉપકરણ ડેટા';

  @override
  String get deviceDataSubtitle => 'સ્થાનિક અને સર્વર સ્ટોરેજ';

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
  String get localStorage => 'સ્થાનિક સ્ટોરેજ';

  @override
  String get onThisDevice => 'આ ઉપકરણ પર';

  @override
  String get encryptedDatabases => 'એન્ક્રિપ્ટેડ ડેટાબેઝ';

  @override
  String get files => 'ફાઇલો';

  @override
  String get secureKeychain => 'સુરક્ષિત કીચેન';

  @override
  String get cache => 'કેશ';

  @override
  String get contactsDetail => 'નામો, અવતાર, Signal કી';

  @override
  String get messagesDetail => 'એન્ક્રિપ્ટેડ વાતચીતો';

  @override
  String get notesDetail => 'વ્યક્તિગત નોંધો';

  @override
  String get signalSessions => 'Signal સેશન';

  @override
  String get signalSessionsDetail => 'એન્ક્રિપ્શન સેશન';

  @override
  String get pendingContacts => 'બાકી સંપર્કો';

  @override
  String get pendingContactsDetail => 'બાકી વિનંતીઓ';

  @override
  String get callHistory => 'કોલ્સ';

  @override
  String get callHistoryDetail => 'કોલ ઈતિહાસ';

  @override
  String get preferences => 'પસંદગીઓ';

  @override
  String get preferencesDetail => 'મીડિયા અને કોલ પસંદગીઓ';

  @override
  String get avatars => 'અવતાર';

  @override
  String get media => 'મીડિયા';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ફાઇલો',
      one: '1 ફાઇલ',
      zero: 'કોઈ ફાઇલ નથી',
    );
    return '$_temp0';
  }

  @override
  String get active => 'સક્રિય';

  @override
  String get notDefined => 'વ્યાખ્યાયિત નથી';

  @override
  String get biometrics => 'બાયોમેટ્રિક્સ';

  @override
  String get recoveryPhrase => 'રિકવરી ફ્રેઝ';

  @override
  String get identity => 'ઓળખ (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol કી';

  @override
  String get authTokens => 'ઓથેન્ટિકેશન ટોકન';

  @override
  String get contactNamesCache => 'સંપર્ક નામ કેશ';

  @override
  String get remoteConfig => 'રિમોટ કોન્ફિગ';

  @override
  String get notificationPrefs => 'સૂચના પસંદગીઓ';

  @override
  String get serverData => 'સર્વર ડેટા';

  @override
  String get serverDataInfo =>
      'Hash સર્વર પર ન્યૂનતમ ડેટા રાખે છે, બધો એન્ક્રિપ્ટેડ અથવા અસ્થાયી.';

  @override
  String get serverProfile => 'પ્રોફાઇલ';

  @override
  String get serverProfileDetail => 'Hash ID, પબ્લિક કી, મેઇલબોક્સ ટોકન';

  @override
  String get serverPrekeys => 'પ્રી-કી';

  @override
  String get serverPrekeysDetail => 'એક-વાર Signal કી (વપરાયેલ)';

  @override
  String get serverMessages => 'ટ્રાન્ઝિટમાં સંદેશાઓ';

  @override
  String get serverMessagesDetail => 'ડિલિવરી પછી ડિલીટ (મહત્તમ 24 ક)';

  @override
  String get serverMedia => 'ટ્રાન્ઝિટમાં મીડિયા';

  @override
  String get serverMediaDetail => 'ડાઉનલોડ પછી ડિલીટ';

  @override
  String get serverContactRequests => 'સંપર્ક વિનંતીઓ';

  @override
  String get serverContactRequestsDetail => '24 કલાક પછી એક્સપાયર';

  @override
  String get serverRateLimits => 'રેટ લિમિટ';

  @override
  String get serverRateLimitsDetail => 'અસ્થાયી એન્ટી-એબ્યુઝ ડેટા';

  @override
  String get privacyReassurance =>
      'Hash તમારા સંદેશાઓ વાંચી શકતું નથી. બધો ડેટા એન્ડ-ટુ-એન્ડ એન્ક્રિપ્ટેડ છે. સર્વર ડેટા આપોઆપ ડિલીટ થાય છે.';

  @override
  String get pinTooSimple => 'આ PIN ખૂબ સરળ છે. વધુ સુરક્ષિત કોડ પસંદ કરો.';

  @override
  String get genericError => 'ભૂલ થઈ. કૃપા કરીને ફરી પ્રયાસ કરો.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'એકાઉન્ટ બનાવવામાં અસમર્થ: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'ફ્રેઝ ક્લિપબોર્ડ પર કૉપી થયો';

  @override
  String get copyPhrase => 'ફ્રેઝ કૉપી કરો';

  @override
  String get recoveryPhraseSecurityWarning =>
      'આ ફ્રેઝ સુરક્ષિત જગ્યાએ લખો. જો તમે આ ફ્રેઝ વિના PIN ગુમાવો, તો તમે કાયમી ધોરણે ડેટાની ઍક્સેસ ગુમાવશો.';

  @override
  String get noMessages => 'કોઈ સંદેશ નથી';

  @override
  String deleteAllMessagesWithContact(String name) {
    return '$name સાથેના બધા સંદેશાઓ ડિલીટ કરશો?';
  }

  @override
  String get confirmation => 'ખાતરી';

  @override
  String get untitled => 'શીર્ષક વિના';

  @override
  String get noSessions => 'કોઈ સેશન નથી';

  @override
  String get unknownContact => 'અજ્ઞાત સંપર્ક';

  @override
  String get unnamed => 'નામ વિના';

  @override
  String get noPendingRequestsAlt => 'કોઈ બાકી વિનંતી નથી';

  @override
  String get deleteAllCallHistory => 'બધો કોલ ઈતિહાસ ડિલીટ કરશો?';

  @override
  String get noCalls => 'કોઈ કોલ નથી';

  @override
  String get noPreferences => 'કોઈ પસંદગી નથી';

  @override
  String get resetAllMediaPrefs => 'બધી મીડિયા પસંદગીઓ રીસેટ કરશો?';

  @override
  String get deleteThisAvatar => 'આ અવતાર ડિલીટ કરશો?';

  @override
  String get deleteAllAvatars => 'બધા અવતાર ડિલીટ કરશો?';

  @override
  String get noAvatars => 'કોઈ અવતાર નથી';

  @override
  String get deleteThisFile => 'આ ફાઇલ ડિલીટ કરશો?';

  @override
  String get deleteAllMediaFiles => 'બધા મીડિયા ડિલીટ કરશો?';

  @override
  String get noMediaFiles => 'કોઈ મીડિયા નથી';

  @override
  String get outgoing => 'બહાર જતો';

  @override
  String get incoming => 'આવતો';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'અલ્પકાલિક જોવું: ${seconds}s';
  }

  @override
  String get normalView => 'સામાન્ય જોવું';

  @override
  String get callReasonCompleted => 'પૂર્ણ';

  @override
  String get callReasonMissed => 'ચૂકી ગયેલ';

  @override
  String get callReasonDeclined => 'નકારેલ';

  @override
  String get callReasonFailed => 'નિષ્ફળ';

  @override
  String get justNow => 'હમણાં જ';

  @override
  String timeAgoMinutes(int count) {
    return '$count મિનિટ પહેલાં';
  }

  @override
  String timeAgoHours(int count) {
    return '$count ક પહેલાં';
  }

  @override
  String timeAgoDays(int count) {
    return '$count દિ પહેલાં';
  }

  @override
  String get messageTypeContact => 'સંપર્ક';

  @override
  String get messageTypeLocation => 'સ્થાન';

  @override
  String get statusQueued => 'કતારમાં';

  @override
  String get blockedBadge => 'બ્લોક';

  @override
  String get protectedBadge => 'સુરક્ષિત';

  @override
  String messageCount(int count) {
    return '$count સંદેશ(ઓ)';
  }

  @override
  String get deleteQuestion => 'ડિલીટ કરશો?';

  @override
  String get transferMyAccountTitle => 'મારું એકાઉન્ટ ટ્રાન્સફર કરો';

  @override
  String get loadingError => 'લોડિંગ ભૂલ';

  @override
  String get transferToNewDevice => 'નવા ઉપકરણ પર ટ્રાન્સફર કરો';

  @override
  String get transferInstructions =>
      'તમારા નવા ઉપકરણ પર, \"મારું એકાઉન્ટ રિકવર કરો\" પસંદ કરો અને આ માહિતી દાખલ કરો:';

  @override
  String get yourHashIdLabel => 'તમારું Hash ID';

  @override
  String get enterYourPinCode => 'તમારો PIN કોડ દાખલ કરો';

  @override
  String get pinOwnerConfirmation => 'આ એકાઉન્ટના માલિક હોવાની ખાતરી કરવા';

  @override
  String get scanThisQrCode => 'આ QR કોડ સ્કેન કરો';

  @override
  String get withYourNewDevice => 'તમારા નવા ઉપકરણ સાથે';

  @override
  String get orEnterTheCode => 'અથવા કોડ દાખલ કરો';

  @override
  String get transferCodeLabel => 'ટ્રાન્સફર કોડ';

  @override
  String get proximityVerification => 'નિકટતા ચકાસણી';

  @override
  String get bringDevicesCloser => 'બંને ઉપકરણો નજીક લાવો';

  @override
  String get confirmTransferQuestion => 'ટ્રાન્સફર કન્ફર્મ કરશો?';

  @override
  String get accountWillBeTransferred =>
      'તમારું એકાઉન્ટ નવા ઉપકરણ પર ટ્રાન્સફર થશે.\n\nઆ ઉપકરણ કાયમી ધોરણે ડિસ્કનેક્ટ થશે.';

  @override
  String get transferComplete => 'ટ્રાન્સફર પૂર્ણ';

  @override
  String get transferSuccessMessage =>
      'તમારું એકાઉન્ટ સફળતાપૂર્વક ટ્રાન્સફર થયું.\n\nઆ એપ્લિકેશન હવે બંધ થશે.';

  @override
  String get manualVerification => 'જાતે ચકાસણી';

  @override
  String get codeDisplayedOnBothDevices => 'બંને ઉપકરણો પર દર્શાવાયેલ કોડ:';

  @override
  String get doesCodeMatchNewDevice =>
      'શું આ કોડ નવા ઉપકરણ પરના કોડ સાથે મેળ ખાય છે?';

  @override
  String get verifiedStatus => 'ચકાસાયેલ';

  @override
  String get inProgressStatus => 'પ્રગતિમાં...';

  @override
  String get notAvailableStatus => 'ઉપલબ્ધ નથી';

  @override
  String get codeExpiredRestart =>
      'કોડ એક્સપાયર થયો. કૃપા કરીને ફરીથી શરૂ કરો.';

  @override
  String get codesDoNotMatchCancelled => 'કોડ મેળ ખાતા નથી. ટ્રાન્સફર રદ.';

  @override
  String transferToDevice(String device) {
    return 'માટે: $device';
  }

  @override
  String get copiedExclamation => 'કૉપી થયું!';

  @override
  String expiresInTime(String time) {
    return '$time માં એક્સપાયર';
  }

  @override
  String get biometricNotAvailable => 'આ ઉપકરણ પર બાયોમેટ્રિક ઉપલબ્ધ નથી';

  @override
  String get biometricAuthError => 'બાયોમેટ્રિક ઓથેન્ટિકેશનમાં ભૂલ';

  @override
  String get authenticateForBiometric =>
      'બાયોમેટ્રિક સક્ષમ કરવા માટે કૃપા કરીને ઓથેન્ટિકેટ કરો';

  @override
  String get biometricAuthFailed => 'બાયોમેટ્રિક ઓથેન્ટિકેશન નિષ્ફળ';

  @override
  String get forceUpdateTitle => 'અપડેટ જરૂરી';

  @override
  String get forceUpdateMessage =>
      'Hash નું નવું વર્ઝન ઉપલબ્ધ છે. ચાલુ રાખવા માટે કૃપા કરીને અપડેટ કરો.';

  @override
  String get updateButton => 'અપડેટ';

  @override
  String get maintenanceInProgress => 'જાળવણી ચાલુ છે';

  @override
  String get tryAgainLater => 'કૃપા કરીને પછીથી ફરી પ્રયાસ કરો';

  @override
  String get information => 'માહિતી';

  @override
  String get later => 'પછી';

  @override
  String get doYouLikeHash => 'તમને Hash ગમે છે?';

  @override
  String get yourFeedbackHelps =>
      'તમારો પ્રતિસાદ અમને એપ્લિકેશન સુધારવામાં મદદ કરે છે';

  @override
  String get ratingTerrible => 'ભયંકર';

  @override
  String get ratingBad => 'ખરાબ';

  @override
  String get ratingOk => 'ઠીક';

  @override
  String get ratingGood => 'સારું';

  @override
  String get ratingExcellent => 'ઉત્તમ!';

  @override
  String get donationMessage =>
      'Hash એક બિન-નફાકારક પ્રોજેક્ટ છે. તમારો સપોર્ટ અમને ખરેખર ખાનગી મેસેન્જર બનાવવામાં મદદ કરે છે.';

  @override
  String get recentConnections => 'તાજેતરના કનેક્શન';

  @override
  String get loginInfoText =>
      'દરેક PIN અનલૉક સ્થાનિક રીતે રેકોર્ડ થાય છે. ફક્ત છેલ્લા 24 કલાક રાખવામાં આવે છે.';

  @override
  String get connectionCount => 'કનેક્શન(ઓ)';

  @override
  String get periodLabel => 'સમયગાળો';

  @override
  String get historyLabel => 'ઈતિહાસ';

  @override
  String get noLoginRecorded => 'કોઈ લોગિન રેકોર્ડ નથી';

  @override
  String get nextUnlocksAppearHere => 'આગામી અનલૉક અહીં દેખાશે.';

  @override
  String get dataLocalOnly =>
      'આ ડેટા ફક્ત તમારા ઉપકરણ પર સંગ્રહિત છે અને ક્યારેય ટ્રાન્સમિટ થતો નથી.';

  @override
  String get currentSession => 'વર્તમાન';

  @override
  String get todayLabel => 'આજે';

  @override
  String get yesterdayLabel => 'ગઈકાલે';

  @override
  String get justNowLabel => 'હમણાં જ';

  @override
  String minutesAgoLabel(int count) {
    return '$count મિ પહેલાં';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours ક પહેલાં';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours ક $minutes મિ પહેલાં';
  }

  @override
  String get noMaintenancePlanned => 'કોઈ જાળવણી આયોજિત નથી';

  @override
  String get everythingWorkingNormally =>
      'બધું સામાન્ય રીતે કાર્ય કરી રહ્યું છે';

  @override
  String get maintenanceTitle => 'જાળવણી';

  @override
  String get maintenanceActiveLabel => 'ચાલુ';

  @override
  String get maintenancePlannedLabel => 'આયોજિત';

  @override
  String get locking => 'લૉક થઈ રહ્યું છે...';

  @override
  String get newMessageNotification => 'નવો સંદેશ';

  @override
  String get secExplainTitle => 'Hash તમને કેવી રીતે સુરક્ષિત રાખે છે';

  @override
  String get secExplainIntro =>
      'Hash એવી રીતે બનાવવામાં આવ્યું છે કે કોઈ તમારા સંદેશાઓ વાંચી ન શકે.';

  @override
  String get secExplainIntroSub =>
      'અમે પણ નહીં.\nઅહીં છે કે તે કેવી રીતે કામ કરે છે, સરળ રીતે સમજાવ્યું.';

  @override
  String get secJourneyLabel => 'યાત્રા';

  @override
  String get secJourneyTitle => 'તમારા સંદેશની યાત્રા';

  @override
  String get secJourneySubtitle =>
      'તમારી આંગળીથી તમારા સંપર્કની સ્ક્રીન સુધી, દરેક પગલું સુરક્ષિત છે. રસ્તો અનુસરો.';

  @override
  String get secStep1Title => 'તમે સંદેશ લખો છો';

  @override
  String get secStep1Desc =>
      'તમે એપ્લિકેશનમાં \"નમસ્તે!\" ટાઇપ કરો. આ સમયે, સંદેશ ફક્ત તમારા ફોનની મેમરીમાં છે. કંઈ મોકલાયું નથી.';

  @override
  String get secStep2Title => 'Signal Protocol સાથે એન્ક્રિપ્શન';

  @override
  String get secStep2Desc =>
      '\"મોકલો\" દબાવતાં જ, તમારો સંદેશ અસમજી શકાય તેવા અક્ષરોની શ્રેણીમાં રૂપાંતરિત થાય છે. તે જાણે તમારો સંદેશ એક તિજોરીમાં બંધ છે જેની ચાવી ફક્ત તમારા સંપર્ક પાસે છે.';

  @override
  String get secStep3Title => 'Sealed Sender: અદ્રશ્ય પરબિડિયું';

  @override
  String get secStep3Desc =>
      'કલ્પના કરો કે તમે ટપાલ દ્વારા પત્ર મોકલો છો, પરંતુ પરબિડિયા પર કોઈ રિટર્ન એડ્રેસ નથી. Hash બરાબર આ જ કરે છે. સંદેશ એક અનામી મેઈલબોક્સમાં મૂકવામાં આવે છે. સર્વરને ખબર નથી કોણે મોકલ્યો.';

  @override
  String get secStep4Title => 'સર્વર કંઈ જોતું નથી';

  @override
  String get secStep4Desc =>
      'સર્વર એક આંધળા ટપાલીની ભૂમિકા ભજવે છે. તે ફક્ત જાણે છે \"કોઈએ મેઈલબોક્સ #A7X9 માં કંઈક મૂક્યું\". તે જાણતું નથી કોણે મોકલ્યું, શું છે, કે કોના માટે છે.';

  @override
  String get secStep4Highlight =>
      'કોઈ મેટાડેટા સંગ્રહિત નથી: કોઈ IP એડ્રેસ, કોઈ ટાઇમસ્ટેમ્પ, કોઈ મોકલનાર અને પ્રાપ્તકર્તા વચ્ચેની લિંક નહીં.';

  @override
  String get secStep5Title => 'તમારો સંપર્ક સંદેશ મેળવે છે';

  @override
  String get secStep5Desc =>
      'તમારા સંપર્કનો ફોન તેમના અનામી મેઈલબોક્સમાંથી સામગ્રી મેળવે છે અને તેમની ખાનગી કી વડે સંદેશ ડિક્રિપ્ટ કરે છે, જે તેમનું ઉપકરણ ક્યારેય છોડ્યું નથી. \"નમસ્તે!\" તેમની સ્ક્રીન પર દેખાય છે.';

  @override
  String get secStep6Title => 'સંદેશ સર્વરમાંથી ગાયબ થાય છે';

  @override
  String get secStep6Desc =>
      'તમારો સંપર્ક પ્રાપ્તિની ખાતરી કરે કે તરત જ, સર્વર કાયમી ધોરણે સંદેશ ડિલીટ કરે છે. કોઈ ટ્રેશ, કોઈ આર્કાઇવ, કોઈ બેકઅપ નહીં. વાંચ્યા ન હોય તેવા સંદેશાઓ પણ 24 કલાક પછી આપોઆપ નાશ પામે છે.';

  @override
  String get secStep7Title => 'સ્થાનિક એક્સપાયરી';

  @override
  String get secStep7Desc =>
      'તમારા સંપર્કના ફોન પર, સંદેશ તમે પસંદ કરેલી અવધિ પ્રમાણે સ્વ-નાશ થાય છે: વાંચ્યા પછી તરત, 5 મિનિટ, 1 કલાક... તમે નક્કી કરો.';

  @override
  String get secJourneyConclusion =>
      'પરિણામ: સર્વર પર શૂન્ય નિશાન, ઉપકરણો પર શૂન્ય નિશાન. સંદેશ ફક્ત વાંચવા માટે પૂરતો સમય અસ્તિત્વમાં રહ્યો, પછી ગાયબ થયો.';

  @override
  String get secArchLabel => 'આર્કિટેક્ચર';

  @override
  String get secArchTitle => 'સુરક્ષાના 5 સ્તર';

  @override
  String get secArchSubtitle =>
      'Hash એક ટેકનોલોજી પર આધાર રાખતું નથી. દરેક સ્તર બીજાને મજબૂત બનાવે છે. એક સ્તર ખોરવાઈ જાય તો પણ, તમારો ડેટા સુરક્ષિત રહે છે.';

  @override
  String get secLayer1Title => 'એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શન';

  @override
  String get secLayer1Desc =>
      'દરેક સંદેશ એક અનન્ય કી વડે એન્ક્રિપ્ટ થાય છે. સરળ શબ્દોમાં: જો કોઈ એક સંદેશ ડિક્રિપ્ટ કરે, તો પણ તે આગલો ડિક્રિપ્ટ નહીં કરી શકે. દરેક સંદેશનું પોતાનું તાળું છે.';

  @override
  String get secLayer1Detail =>
      'ફાઇલો (ફોટો, વીડિયો, ડોક્યુમેન્ટ) માટે, Hash વધારાનું AES-256-GCM એન્ક્રિપ્શન વાપરે છે. ફાઇલ તમારા ફોનથી નીકળે તે પહેલાં એન્ક્રિપ્ટ થાય છે.';

  @override
  String get secLayer2Title => 'Sealed Sender (નેટવર્ક અનામિકતા)';

  @override
  String get secLayer2Desc =>
      'સામાન્ય મેસેન્જર તમારા સંદેશાઓ તમારી ઓળખ સાથે મોકલે છે. તે જાણે પરબિડિયા પર તમારું નામ લખવા જેવું છે. Hash અનામી મેઈલબોક્સ વાપરે છે: સર્વર સંદેશ મોકલે છે પણ જાણતું નથી કોણે મોકલ્યો.';

  @override
  String get secLayer2Detail =>
      'પરિણામ: સર્વર ડેટા લીક થાય તો પણ, કોણ કોની સાથે વાત કરે છે તે જાણવું અશક્ય છે.';

  @override
  String get secLayer3Title => 'ઓટોમેટિક ડિલીશન';

  @override
  String get secLayer3Desc =>
      'પ્રાપ્તિ ખાતરી થતાં જ સર્વરમાંથી સંદેશાઓ ડિલીટ થાય છે. જો સંદેશ ક્યારેય ન મળે, તો પણ 24 કલાક પછી આપોઆપ નાશ પામે છે.';

  @override
  String get secLayer3Detail =>
      'તમારા ફોન પર, તમે પસંદ કરો તે અવધિ પ્રમાણે સંદેશાઓ સ્વ-નાશ થાય છે: તરત, 5 મિ, 15 મિ, 30 મિ, 1ક, 3ક, 6ક, અથવા 12ક.';

  @override
  String get secLayer4Title => 'સ્થાનિક ઍક્સેસ સુરક્ષા';

  @override
  String get secLayer4Desc =>
      'એપ્લિકેશન 6-અંકના PIN કોડ અને/અથવા બાયોમેટ્રિક્સ (Face ID, ફિંગરપ્રિન્ટ) દ્વારા સુરક્ષિત છે. ઘણા નિષ્ફળ પ્રયાસો પછી, દરેક નિષ્ફળતા પછી વધતા વિલંબ સાથે એપ્લિકેશન લૉક થાય છે.';

  @override
  String get secLayer5Title => 'લૉક ડેટાબેઝ';

  @override
  String get secLayer5Desc =>
      'સર્વર બાજુ, કોઈ વપરાશકર્તા સીધું ડેટાબેઝમાં લખી શકતો નથી. બધી ક્રિયાઓ સુરક્ષિત ફંક્શન દ્વારા જાય છે જે દરેક વિનંતી ચકાસે છે.';

  @override
  String get secLayer5Detail =>
      'તે બેંકના કાઉન્ટર જેવું છે: તમે ક્યારેય તિજોરીને જાતે સ્પર્શ કરતા નથી. તમે વિનંતી કરો, અને સિસ્ટમ ચકાસે છે કે તમારી પાસે અધિકાર છે કે નહીં.';

  @override
  String get secVashLabel => 'વિશ્વમાં અનન્ય';

  @override
  String get secVashTitle => 'Vash મોડ';

  @override
  String get secVashSubtitle =>
      'ઈમર્જન્સી સુરક્ષા સિસ્ટમ જે અન્ય કોઈ મેસેજિંગ એપ્લિકેશનમાં અસ્તિત્વમાં નથી.';

  @override
  String get secVashScenarioTitle => 'આ પરિસ્થિતિ કલ્પો';

  @override
  String get secVashScenario1 => 'કોઈ તમારા ફોનને ઍક્સેસ કરે છે';

  @override
  String get secVashScenario2 => 'તમારા PIN કોડ માટે પૂછવામાં આવે છે';

  @override
  String get secVashScenario3 => 'તમે તાત્કાલિક તમારો બધો ડેટા ભૂંસવા માંગો છો';

  @override
  String get secVashSolutionTitle => 'ઉકેલ: બે PIN કોડ';

  @override
  String get secVashSolutionDesc => 'તમે Hash માં બે અલગ PIN કોડ ગોઠવો:';

  @override
  String get secVashNormalCodeLabel => 'સામાન્ય કોડ';

  @override
  String get secVashNormalCodeDesc =>
      'તમારા બધા ડેટા સાથે એપ્લિકેશન સામાન્ય રીતે ખોલે છે';

  @override
  String get secVashCodeLabel2 => 'Vash કોડ';

  @override
  String get secVashCodeDescription =>
      'એપ્લિકેશન સામાન્ય રીતે ખોલે છે... પરંતુ તમારો બધો ડેટા પૃષ્ઠભૂમિમાં શાંતિથી ડિલીટ થાય છે';

  @override
  String get secVashWhatHappensTitle => 'પછી શું થાય છે';

  @override
  String get secVashWhatHappensDesc =>
      'એપ્લિકેશન સામાન્ય રીતે ખુલે છે. કોઈ ચેતવણી, કોઈ શંકાસ્પદ એનિમેશન નહીં. સ્ક્રીન ખાલી એપ્લિકેશન બતાવે છે, જાણે તમે હમણાં જ ઇન્સ્ટોલ કરી.\n\nવાસ્તવમાં, તમારી બધી વાતચીતો, સંપર્કો અને સંદેશાઓ એક સેકન્ડના અંશમાં ઉલટાવી ન શકાય તે રીતે ડિલીટ થયા છે.';

  @override
  String get secCallsLabel => 'કોલ અને ફાઇલો';

  @override
  String get secCallsTitle => 'બધું એન્ક્રિપ્ટેડ છે';

  @override
  String get secCallsSubtitle =>
      'ફક્ત સંદેશાઓ નહીં. Hash દ્વારા જતું બધું એન્ડ-ટુ-એન્ડ એન્ક્રિપ્ટેડ છે.';

  @override
  String get secAudioCallTitle => 'ઑડિયો કોલ';

  @override
  String get secAudioCallDesc =>
      'WebRTC દ્વારા એન્ડ-ટુ-એન્ડ એન્ક્રિપ્ટેડ. અવાજ ઉપકરણો વચ્ચે સીધો પ્રસારિત થાય છે.';

  @override
  String get secVideoCallTitle => 'વીડિયો કોલ';

  @override
  String get secVideoCallDesc =>
      'એ જ ટેકનોલોજી, દરેક સ્ટ્રીમ અલગથી એન્ક્રિપ્ટેડ.';

  @override
  String get secPhotosTitle => 'ફોટો અને વીડિયો';

  @override
  String get secPhotosDesc =>
      'તમારા ફોનથી નીકળતા પહેલાં AES-256-GCM માં એન્ક્રિપ્ટેડ.';

  @override
  String get secDocsTitle => 'ડોક્યુમેન્ટ';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, કોઈપણ ફાઇલ. નામ, કદ અને સામગ્રી એન્ક્રિપ્ટેડ.';

  @override
  String get secAnonLabel => 'અનામિકતા';

  @override
  String get secAnonTitle => 'કોઈ ઓળખ જરૂરી નથી';

  @override
  String get secAnonSubtitle =>
      'Hash ક્યારેય તમારો ફોન નંબર કે ઈમેલ માંગતું નથી. તમને અનન્ય અને અનામી Hash ID દ્વારા ઓળખવામાં આવે છે.';

  @override
  String get secHashIdTitle => 'તમારું Hash ID';

  @override
  String get secHashIdDesc =>
      'આ તમારું અનન્ય ઓળખકર્તા છે. તે તમારા વિશે કંઈ જ પ્રગટ કરતું નથી: ન તમારું નામ, ન તમારો નંબર, ન તમારું સ્થાન. તે એક એવો ઉપનામ છે જે તમારી વાસ્તવિક ઓળખ સાથે જોડવો અશક્ય છે.\n\nસંપર્ક ઉમેરવા માટે, તમે તમારું Hash ID શેર કરો અથવા QR કોડ સ્કેન કરો. બસ. કોઈ સિંક્રોનાઇઝ્ડ ફોનબુક નહીં, કોઈ \"તમે કદાચ ઓળખતા હો\" સૂચનો નહીં.';

  @override
  String get secDataLabel => 'ડેટા';

  @override
  String get secDataTitle => 'Hash શું જાણતું નથી';

  @override
  String get secDataSubtitle =>
      'તમારા ડેટાને સુરક્ષિત કરવાનો શ્રેષ્ઠ રસ્તો એ છે કે તેને એકત્ર ન કરવો.';

  @override
  String get secNeverCollected => 'ક્યારેય એકત્ર નહીં';

  @override
  String get secNeverItem1 => 'સંદેશ સામગ્રી';

  @override
  String get secNeverItem2 => 'સંપર્ક યાદી';

  @override
  String get secNeverItem3 => 'ફોન નંબર';

  @override
  String get secNeverItem4 => 'ઈમેલ એડ્રેસ';

  @override
  String get secNeverItem5 => 'IP એડ્રેસ';

  @override
  String get secNeverItem6 => 'સ્થાન';

  @override
  String get secNeverItem7 => 'મેટાડેટા (કોણ કોની સાથે વાત કરે)';

  @override
  String get secNeverItem8 => 'કોલ ઈતિહાસ';

  @override
  String get secNeverItem9 => 'ફોનબુક';

  @override
  String get secNeverItem10 => 'જાહેરાત ઓળખકર્તા';

  @override
  String get secTempStored => 'અસ્થાયી રીતે સંગ્રહિત';

  @override
  String get secTempItem1 => 'અનામી Hash ID (અનન્ય ઓળખકર્તા)';

  @override
  String get secTempItem2 => 'પબ્લિક એન્ક્રિપ્શન કી';

  @override
  String get secTempItem3 => 'ટ્રાન્ઝિટમાં એન્ક્રિપ્ટેડ સંદેશાઓ (મહત્તમ 24ક)';

  @override
  String get secTempNote =>
      'આ ન્યૂનતમ ડેટા પણ તમને ઓળખી શકતો નથી. તમારું Hash ID કોઈ વ્યક્તિગત માહિતી સાથે જોડાયેલું નથી.';

  @override
  String get secFooterTitle => 'તમારી ગોપનીયતા, તમારી સ્વતંત્રતા';

  @override
  String get secFooterDesc =>
      'Hash સૌથી માંગ ધરાવતી વ્યાવસાયિક એપ્લિકેશનો જેવી જ એન્ક્રિપ્શન ટેકનોલોજીનો ઉપયોગ કરે છે. તમારા સંદેશાઓ ગણિત દ્વારા સુરક્ષિત છે, વચનો દ્વારા નહીં.';

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
