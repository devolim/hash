// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Nulla nyom. Nulla kompromisszum.';

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
  String get conversations => 'Beszélgetések';

  @override
  String get contacts => 'Névjegyek';

  @override
  String get noConversation => 'Nincs beszélgetés';

  @override
  String get noConversationSubtitle =>
      'Adjon hozzá egy névjegyet a biztonságos csevegéshez';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count függő kérés',
      one: '1 függő kérés',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elküldött kérés függőben',
      one: '1 elküldött kérés függőben',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Névjegy hozzáadása';

  @override
  String get shareApp => 'Alkalmazás megosztása';

  @override
  String get newMessage => 'Új üzenet';

  @override
  String get newConversation => 'Üzenet küldése';

  @override
  String get settings => 'Beállítások';

  @override
  String get myHashId => 'Hash ID-m';

  @override
  String get supportHash => 'Hash támogatása';

  @override
  String get supportHashSubtitle => 'A Hash egy nonprofit projekt';

  @override
  String get donate => 'Adományozás';

  @override
  String get appearance => 'Megjelenés';

  @override
  String get theme => 'Téma';

  @override
  String get themeAuto => 'Automatikus';

  @override
  String get themeAutoSubtitle => 'Rendszerbeállítások követése';

  @override
  String get themeDark => 'Sötét';

  @override
  String get themeLight => 'Világos';

  @override
  String get themeRecommendation =>
      'A sötét téma ajánlott a jobb adatvédelem érdekében';

  @override
  String get language => 'Nyelv';

  @override
  String get languageAuto => 'Automatikus (rendszer)';

  @override
  String get notifications => 'Értesítések';

  @override
  String get messages => 'Üzenetek';

  @override
  String get calls => 'Hívások';

  @override
  String get vibration => 'Rezgés';

  @override
  String get notificationContent => 'Értesítés tartalma';

  @override
  String get notificationContentFull => 'Minden megjelenítése';

  @override
  String get notificationContentFullDesc => 'Névjegy neve és üzenet előnézete';

  @override
  String get notificationContentName => 'Csak név';

  @override
  String get notificationContentNameDesc => 'Csak a névjegy nevét mutatja';

  @override
  String get notificationContentDiscrete => 'Diszkrét';

  @override
  String get notificationContentDiscreteDesc =>
      'Csak \"Új üzenet\" megjelenítése';

  @override
  String get security => 'Biztonság';

  @override
  String get howHashProtectsYou => 'Hogyan véd a Hash';

  @override
  String get howHashProtectsYouSubtitle => 'Ismerje meg a biztonságát';

  @override
  String get accountSecurity => 'Fiók biztonsága';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, Vash mód';

  @override
  String get blockScreenshots => 'Képernyőfotók tiltása';

  @override
  String get transferDevice => 'Áthelyezés másik eszközre';

  @override
  String get transferDeviceSubtitle => 'Fiók migrálása';

  @override
  String get pinCode => 'PIN kód';

  @override
  String get changePin => 'PIN kód módosítása';

  @override
  String get currentPin => 'Jelenlegi PIN kód';

  @override
  String get newPin => 'Új PIN kód';

  @override
  String get confirmPin => 'PIN kód megerősítése';

  @override
  String get pinChanged => 'PIN kód megváltoztatva';

  @override
  String get incorrectPin => 'Helytelen PIN';

  @override
  String get pinsDoNotMatch => 'A PIN kódok nem egyeznek';

  @override
  String get autoLock => 'Automatikus zárolás';

  @override
  String get autoLockDelay => 'Zárolási késleltetés';

  @override
  String get autoLockImmediate => 'Azonnali';

  @override
  String get autoLockMinute => '1 perc';

  @override
  String autoLockMinutes(int count) {
    return '$count perc';
  }

  @override
  String get vashCode => 'Vash kód';

  @override
  String get vashModeTitle => 'Vash mód';

  @override
  String get vashModeExplanation => 'Az Ön végső biztonsági hálója.';

  @override
  String get vashModeDescription =>
      'Egy második PIN kódot fog választani. Ha valaha arra kényszerítik, hogy nyissa meg a Hash-t, adja meg ezt a kódot a szokásos PIN helyett.\n\nAz alkalmazás normálisan megnyílik, de az összes beszélgetése és névjegye eltűnik.\n\nBárki számára, aki a képernyőjére néz, a Hash egyszerűen üresnek tűnik — mintha soha nem használta volna.';

  @override
  String get vashModeIrreversible =>
      'Ez a művelet csendes és visszafordíthatatlan.';

  @override
  String get chooseVashCode => 'Vash kód kiválasztása';

  @override
  String get vashCodeInfo =>
      'Egy második PIN kód, amely normálisan megnyitja az alkalmazást, de üresen.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Ha ezt a kódot adja meg a PIN helyett:';

  @override
  String get vashDeleteContacts => 'A névjegyei eltűnnek';

  @override
  String get vashDeleteMessages => 'A beszélgetései eltűnnek';

  @override
  String get vashDeleteHistory => 'A jegyzetei eltűnnek';

  @override
  String get vashKeepId => 'A Hash identitása (#XXX-XXX-XXX) megmarad';

  @override
  String get vashAppearNormal =>
      'Az alkalmazás normálisnak tűnik, de üres, mintha új lenne. Ez a művelet visszafordíthatatlan.';

  @override
  String get setupVashCode => 'Vash kód beállítása';

  @override
  String get modifyVashCode => 'Vash kód módosítása';

  @override
  String get currentVashCode => 'Jelenlegi Vash kód';

  @override
  String get newVashCode => 'Új Vash kód';

  @override
  String get confirmVashCode => 'Vash kód megerősítése';

  @override
  String get vashCodeConfigured => 'Vash kód beállítva';

  @override
  String get vashCodeModified => 'Vash kód módosítva';

  @override
  String get vashCodeMustDiffer => 'A Vash kódnak különböznie kell a PIN-től';

  @override
  String get incorrectVashCode => 'Helytelen Vash kód';

  @override
  String get vashWhatToDelete => 'Mit tüntessen el a Vash mód?';

  @override
  String get vashDeleteContactsOption => 'Névjegyek';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Üzenetek';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Jegyzetek';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash mód aktiválva';

  @override
  String get vashCreateSubtitle => 'Válasszon a fő PIN-től eltérő kódot';

  @override
  String get vashConfirmSubtitle => 'Erősítse meg a Vash kódját';

  @override
  String get pinCodeForEntry => 'PIN kód az alkalmazásba való belépéshez';

  @override
  String get vashCodeSection => 'Vash mód';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Feloldás ujjlenyomattal vagy Face ID-val';

  @override
  String get enableBiometric => 'Biometria engedélyezése';

  @override
  String get biometricWarningMessage =>
      'A biometria engedélyezésével nem tudja a Vash kódját használni az alkalmazásba való belépéshez.\n\nA Vash kódot csak akkor használhatja, ha a biometria sikertelen (több sikertelen próbálkozás után).\n\nBiztos, hogy folytatja?';

  @override
  String get understood => 'Megértettem';

  @override
  String get shareAppSubtitle => 'Ossza meg a Hash-t szeretteivel';

  @override
  String get share => 'Megosztás';

  @override
  String get danger => 'Veszély';

  @override
  String get deleteAccount => 'Fiókom törlése';

  @override
  String get deleteAccountSubtitle => 'Visszafordíthatatlan művelet';

  @override
  String get deleteAccountConfirmTitle => 'Fiókom törlése';

  @override
  String get deleteAccountConfirmMessage =>
      'A fiókja véglegesen törlődik. Ez a művelet visszafordíthatatlan.\n\n• Összes beszélgetése\n• Összes névjegye\n• Hash ID-je\n\nÚj fiókot kell létrehoznia.';

  @override
  String get deleteForever => 'Végleges törlés';

  @override
  String get cancel => 'Mégse';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash mód aktiválva.';

  @override
  String deletionError(String error) {
    return 'Törlési hiba: $error';
  }

  @override
  String get yourSecurity => 'Az Ön biztonsága';

  @override
  String get securityInfo =>
      '• Végponttól végpontig titkosítás (Signal Protocol)\n• Nincs adat a szervereinken a kézbesítés után\n• Kulcsok csak az Ön eszközén tárolva\n• PIN kód soha nincs elküldve a szerverre';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Üdvözöljük';

  @override
  String get securityStatement1 => 'Üzenetei védettek.';

  @override
  String get securityStatement2 => 'Végponttól végpontig titkosítás.';

  @override
  String get securityStatement3 => 'Nincs nyom. Nincs kompromisszum.';

  @override
  String get securityStatement4 => 'A magánélet jog.';

  @override
  String get accessBlocked => 'Hozzáférés blokkolva';

  @override
  String get tooManyAttempts => 'Túl sok próbálkozás. Próbálja újra később.';

  @override
  String get pleaseWait => 'Kérjük, várjon';

  @override
  String get waitDelay => 'Kérjük, várja meg a késleltetés végét';

  @override
  String attemptCount(int current, int max) {
    return '$current. próbálkozás a $max-ból';
  }

  @override
  String retryIn(String time) {
    return 'Újrapróbálás: $time múlva';
  }

  @override
  String get forgotPin =>
      'Elfelejtette a PIN-t? Használja a helyreállítási kifejezést';

  @override
  String get useRecoveryPhrase => 'Helyreállítási kifejezés használata';

  @override
  String get recoveryWarningTitle => 'Figyelmeztetés';

  @override
  String get recoveryWarningMessage => 'A fiók helyreállítása:';

  @override
  String get recoveryDeleteAllMessages => 'Törli AZ ÖSSZES üzenetet';

  @override
  String get recoveryWaitDelay => '1 órás várakozást igényel';

  @override
  String get recoveryKeepContacts => 'Megtartja a névjegyeket';

  @override
  String get recoveryIrreversible =>
      'Ez a művelet visszafordíthatatlan. Üzenetei véglegesen elvesznek.';

  @override
  String get iUnderstand => 'Megértettem';

  @override
  String get accountRecovery => 'Fiók helyreállítása';

  @override
  String get enterRecoveryPhrase =>
      'Adja meg a helyreállítási kifejezés 24 szavát, szóközökkel elválasztva.';

  @override
  String get recoveryPhraseHint => 'szó1 szó2 szó3 ...';

  @override
  String get recover => 'Helyreállítás';

  @override
  String get recoveryPhraseRequired =>
      'Kérjük, adja meg a helyreállítási kifejezést';

  @override
  String get recoveryPhrase24Words =>
      'A kifejezésnek pontosan 24 szóból kell állnia';

  @override
  String get incorrectRecoveryPhrase => 'Helytelen helyreállítási kifejezés';

  @override
  String get recoveryInitError => 'Hiba a helyreállítás inicializálásakor';

  @override
  String get securityDelay => 'Biztonsági késleltetés';

  @override
  String get securityDelayMessage =>
      'Az Ön biztonsága érdekében várakozási idő szükséges, mielőtt új PIN-t hozhat létre.';

  @override
  String get timeRemaining => 'Hátralévő idő';

  @override
  String get messagesDeletedForProtection =>
      'Üzenetei az Ön védelme érdekében törlődtek.';

  @override
  String get canCloseApp => 'Bezárhatja az alkalmazást és visszatérhet később.';

  @override
  String get onboardingTitle1 => 'Üdvözöljük a Hash-ben';

  @override
  String get onboardingSubtitle1 => 'Az üzenetküldő, amely nem hagy nyomot';

  @override
  String get onboardingTitle2 => 'Teljes titkosítás';

  @override
  String get onboardingSubtitle2 =>
      'Üzenetei végponttól végpontig titkosítva a Signal protokollal';

  @override
  String get onboardingTitle3 => 'Nincs nyom';

  @override
  String get onboardingSubtitle3 =>
      'Az üzenetek a kézbesítéskor törlődnek a szerverről';

  @override
  String get onboardingTitle4 => 'Az Ön biztonsága';

  @override
  String get onboardingSubtitle4 =>
      'PIN kód, Vash mód és helyreállítási kifejezés';

  @override
  String get getStarted => 'Kezdjük';

  @override
  String get next => 'Következő';

  @override
  String get skip => 'Kihagyás';

  @override
  String get alreadyHaveAccount => 'Már van fiókom';

  @override
  String get transferMyAccount => 'Fiókom áthelyezése';

  @override
  String get createPin => 'PIN kód létrehozása';

  @override
  String get createPinSubtitle => 'Ez a kód védi az alkalmazás hozzáférését';

  @override
  String get confirmYourPin => 'PIN kód megerősítése';

  @override
  String get confirmPinSubtitle => 'Adja meg újra a PIN kódját';

  @override
  String get saveRecoveryPhrase => 'Helyreállítási kifejezés';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Írja le ezt a 24 szót sorrendben. Ezek lehetővé teszik fiókja helyreállítását, ha elfelejtené a PIN-jét.';

  @override
  String get phraseWritten => 'Leírtam a kifejezésemet';

  @override
  String get warningRecoveryPhrase =>
      'Ha elveszíti ezt a kifejezést és elfelejti a PIN-jét, elveszíti fiókjához való hozzáférését.';

  @override
  String get accountTransferred => 'Fiók áthelyezve';

  @override
  String get accountTransferredMessage =>
      'Fiókja áthelyezésre került egy másik eszközre. Ez a munkamenet már nem érvényes.';

  @override
  String get accountTransferredInfo =>
      'Ha nem Ön kezdeményezte ezt az áthelyezést, fiókja kompromittálódhatott.';

  @override
  String get logout => 'Kijelentkezés';

  @override
  String get transferAccount => 'Fiók áthelyezése';

  @override
  String get transferAccountInfo =>
      'Helyezze át Hash fiókját egy új eszközre. A jelenlegi munkamenete érvénytelenítésre kerül.';

  @override
  String get generateTransferCode => 'Áthelyezési kód generálása';

  @override
  String get transferCode => 'Áthelyezési kód';

  @override
  String transferCodeExpires(int minutes) {
    return 'Ez a kód $minutes perc múlva lejár';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Adja meg ezt a kódot az új eszközön a fiók áthelyezéséhez.';

  @override
  String get generateNewCode => 'Új kód generálása';

  @override
  String get scanQrCode => 'QR code beolvasása';

  @override
  String get scanQrCodeSubtitle =>
      'Olvassa be egy névjegy QR code-ját a hozzáadáshoz';

  @override
  String get qrCodeDetected => 'QR code észlelve';

  @override
  String get invalidQrCode => 'Érvénytelen QR code';

  @override
  String get cameraPermissionRequired => 'Kamera engedély szükséges';

  @override
  String get myQrCode => 'QR code-om';

  @override
  String get myQrCodeSubtitle =>
      'Ossza meg ezt a QR code-ot, hogy névjegyei hozzáadhassák Önt';

  @override
  String get shareQrCode => 'Megosztás';

  @override
  String get addContactTitle => 'Névjegy hozzáadása';

  @override
  String get addContactByHashId => 'Adja meg névjegye Hash ID-jét';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Keresés';

  @override
  String get contactNotFound => 'Névjegy nem található';

  @override
  String get contactAlreadyAdded => 'Ez a névjegy már a listáján van';

  @override
  String get contactAdded => 'Névjegy hozzáadva';

  @override
  String get myProfile => 'Profilom';

  @override
  String get myProfileSubtitle =>
      'Ossza meg ezeket az adatokat, hogy mások hozzáadhassák Önt';

  @override
  String get temporaryCode => 'Ideiglenes kód';

  @override
  String temporaryCodeExpires(String time) {
    return 'Lejár: $time múlva';
  }

  @override
  String get codeExpired => 'Kód lejárt';

  @override
  String get generateNewCodeButton => 'Új kód';

  @override
  String get copyHashId => 'ID másolása';

  @override
  String get copyCode => 'Kód másolása';

  @override
  String get copiedToClipboard => 'Másolva';

  @override
  String get showMyQrCode => 'QR code-om megjelenítése';

  @override
  String get orDivider => 'vagy';

  @override
  String get openScanner => 'Szkenner megnyitása';

  @override
  String get addManually => 'Kézi hozzáadás';

  @override
  String get contactHashIdLabel => 'Névjegy Hash ID-je';

  @override
  String get temporaryCodeLabel => 'Ideiglenes kód';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Kérje meg névjegyét, hogy generáljon egy kódot a profiljából';

  @override
  String get verifyAndAdd => 'Ellenőrzés és hozzáadás';

  @override
  String get fillAllFields => 'Kérjük, töltse ki az összes mezőt';

  @override
  String get invalidHashIdFormat =>
      'Érvénytelen ID formátum (pl.: 123-456-ABC)';

  @override
  String get userNotFound => 'Felhasználó nem található';

  @override
  String get cannotAddYourself => 'Nem adhatja hozzá saját magát';

  @override
  String get invalidOrExpiredCode => 'Érvénytelen vagy lejárt ideiglenes kód';

  @override
  String get contactFound => 'Névjegy megtalálva!';

  @override
  String get howToCallContact => 'Hogyan szeretné hívni?';

  @override
  String get contactNameHint => 'Névjegy neve';

  @override
  String get addContactButton => 'Hozzáadás';

  @override
  String get contactDetails => 'Névjegy részletei';

  @override
  String get contactName => 'Névjegy neve';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Hozzáadva: $date';
  }

  @override
  String get deleteContact => 'Névjegy törlése';

  @override
  String deleteContactConfirm(Object name) {
    return 'Törli ezt a névjegyet?';
  }

  @override
  String get deleteContactMessage => 'Ez a teljes beszélgetést is törli.';

  @override
  String get delete => 'Törlés';

  @override
  String get typeMessage => 'Írjon üzenetet...';

  @override
  String get messageSent => 'Elküldve';

  @override
  String get messageDelivered => 'Kézbesítve';

  @override
  String get messageRead => 'Olvasva';

  @override
  String get messageFailed => 'Küldés sikertelen';

  @override
  String get now => 'Most';

  @override
  String minutesAgo(int count) {
    return '${count}p';
  }

  @override
  String hoursAgo(int count) {
    return '$countó';
  }

  @override
  String daysAgo(int count) {
    return '${count}n';
  }

  @override
  String get today => 'Ma';

  @override
  String get yesterday => 'Tegnap';

  @override
  String dateAtTime(String date, String time) {
    return '$date, $time';
  }

  @override
  String get shareMessage =>
      'Csatlakozz hozzám a Hash-en! 🔒\n\nEz egy igazán privát üzenetküldő: teljes titkosítás, nincs nyom a szervereken, és pánik mód szükség esetén.\n\nTöltsd le az alkalmazást itt 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Hiba';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Megtekintés';

  @override
  String get yes => 'Igen';

  @override
  String get no => 'Nem';

  @override
  String get save => 'Mentés';

  @override
  String get edit => 'Szerkesztés';

  @override
  String get close => 'Bezárás';

  @override
  String get confirm => 'Megerősítés';

  @override
  String get loading => 'Betöltés...';

  @override
  String get retry => 'Újrapróbálás';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Függő kérések';

  @override
  String get noPendingRequests => 'Nincs függő kérés';

  @override
  String get pendingRequestsSubtitle =>
      'Ezek az emberek szeretnék Önt hozzáadni';

  @override
  String requestFromUser(String hashId) {
    return 'Kérés tőle: $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return '$days nap múlva lejár';
  }

  @override
  String get acceptRequest => 'Elfogadás';

  @override
  String get rejectRequest => 'Elutasítás';

  @override
  String get requestAccepted => 'Kérés elfogadva';

  @override
  String get requestRejected => 'Kérés elutasítva';

  @override
  String get requestSent => 'Kérés elküldve!';

  @override
  String get requestSentSubtitle =>
      'Kérése elküldve. A felhasználónak el kell fogadnia, mielőtt cseveghetne.';

  @override
  String get requestAlreadyPending => 'Egy kérés már függőben van';

  @override
  String get requestAlreadySentByOther =>
      'Ez a személy már küldött Önnek kérést';

  @override
  String get addByHashId => 'Hozzáadás Hash ID-vel';

  @override
  String get addByHashIdSubtitle =>
      'Adja meg a névjegy Hash ID-jét és ideiglenes kódját';

  @override
  String get enterTemporaryCode => 'Adja meg a 6 jegyű kódot';

  @override
  String get sendRequest => 'Kérés küldése';

  @override
  String get acceptContactTitle => 'Névjegy elfogadása';

  @override
  String get acceptContactSubtitle => 'Egyéni nevet adhat nekik';

  @override
  String get leaveEmptyForHashId => 'Hagyja üresen a Hash ID használatához';

  @override
  String get firstName => 'Keresztnév';

  @override
  String get lastName => 'Vezetéknév';

  @override
  String get notes => 'Jegyzetek';

  @override
  String get notesHint => 'Személyes jegyzetek erről a névjegyről';

  @override
  String get photoOptional => 'Fénykép (opcionális)';

  @override
  String get contactNameOptional => 'Név (opcionális)';

  @override
  String get notesOptional => 'Jegyzetek (opcionális)';

  @override
  String get storedLocally => 'Csak az eszközén tárolva';

  @override
  String get encryptedMessageLabel => 'Titkosított üzenet';

  @override
  String get identityMessageHint => 'Ki Ön? Honnan ismerik egymást?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ez az üzenet titkosítva kerül elküldésre a címzettnek';

  @override
  String get sendRequestButton => 'Kérés küldése';

  @override
  String get requestExpiresIn24h =>
      'A kérés 24 óra múlva lejár, ha nem fogadják el';

  @override
  String get theyAlreadySentYouRequest =>
      'Ez a személy már küldött Önnek kérést';

  @override
  String get requests => 'Kérések';

  @override
  String get receivedRequests => 'Kapott';

  @override
  String get sentRequests => 'Küldött';

  @override
  String get noSentRequests => 'Nincs küldött kérés';

  @override
  String get cancelRequest => 'Mégse';

  @override
  String get deleteRequest => 'Kérés törlése';

  @override
  String get requestCancelled => 'Kérés visszavonva';

  @override
  String sentTo(String hashId) {
    return 'Küldve: $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Lejár: $time múlva';
  }

  @override
  String receivedAgo(String time) {
    return 'Kapva $time ezelőtt';
  }

  @override
  String get messageFromRequester => 'Üzenet a kérelmezőtől';

  @override
  String get copy => 'Másolás';

  @override
  String get messageInfo => 'Üzenet információ';

  @override
  String get messageDirection => 'Irány';

  @override
  String get messageSentByYou => 'Ön küldte';

  @override
  String get messageReceived => 'Fogadva';

  @override
  String get messageSentAt => 'Küldve';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Állapot';

  @override
  String get messageReadAt => 'Olvasva';

  @override
  String get messageType => 'Típus';

  @override
  String get messageSize => 'Méret';

  @override
  String get messageExpiresAt => 'Lejár';

  @override
  String get messageEncrypted => 'Végponttól végpontig titkosítva';

  @override
  String get messageStatusSending => 'Küldés...';

  @override
  String get messageStatusSent => 'Elküldve';

  @override
  String get messageStatusDelivered => 'Kézbesítve';

  @override
  String get messageStatusRead => 'Olvasva';

  @override
  String get messageStatusFailed => 'Sikertelen';

  @override
  String get serverStatus => 'Szerver';

  @override
  String get onServer => 'Kézbesítésre vár';

  @override
  String get deletedFromServer => 'Törölve';

  @override
  String get messageTypeText => 'Szöveg';

  @override
  String get messageTypeImage => 'Kép';

  @override
  String get messageTypeVideo => 'Videó';

  @override
  String get messageTypeVoice => 'Hang';

  @override
  String get messageTypeFile => 'Fájl';

  @override
  String get indefinitely => 'Határozatlan ideig';

  @override
  String get hoursShort => 'ó';

  @override
  String get minutesShort => 'p';

  @override
  String get hours => 'óra';

  @override
  String get minutes => 'perc';

  @override
  String get seconds => 'másodperc';

  @override
  String get ephemeralMessages => 'Eltűnő üzenetek';

  @override
  String get ephemeralMessagesDescription =>
      'Az üzenetek automatikusan törlődnek ennyi idő után';

  @override
  String get ephemeralImmediate => 'Azonnali (olvasás után)';

  @override
  String get ephemeralImmediateDesc => 'Olvasáskor azonnal törlődik';

  @override
  String get ephemeralMyPreference => 'Saját beállítás';

  @override
  String get ephemeralMyPreferenceDesc => 'Globális beállítás használata';

  @override
  String get ephemeralDefaultSetting => 'Üzenet időtartam';

  @override
  String get ephemeralChooseDefault => 'Ajánlott';

  @override
  String get ephemeral30Seconds => '30 másodperc';

  @override
  String get ephemeral30SecondsDesc => 'Törölve 30mp olvasás után';

  @override
  String get ephemeral5Minutes => '5 perc';

  @override
  String get ephemeral5MinutesDesc => 'Törölve 5p olvasás után';

  @override
  String get ephemeral1Hour => '1 óra';

  @override
  String get ephemeral1HourDesc => 'Törölve 1ó olvasás után';

  @override
  String get ephemeral3Hours => '3 óra';

  @override
  String get ephemeral6Hours => '6 óra';

  @override
  String get ephemeral6HoursDesc => 'Törölve 6ó olvasás után';

  @override
  String get ephemeral12Hours => '12 óra';

  @override
  String get ephemeral24Hours => '24 óra';

  @override
  String get ephemeral24HoursDesc => 'Törölve 24ó olvasás után';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Egyéni időtartam';

  @override
  String get howItWorks => 'Hogyan működik';

  @override
  String get ephemeralExplanation1 =>
      'Az üzenetek a fogadáskor azonnal törlődnek a szerverről.';

  @override
  String get ephemeralExplanation2 =>
      'Ez a beállítás meghatározza, mikor tűnnek el az üzenetek AZ ÖN telefonjáról olvasás után.';

  @override
  String get ephemeralExplanation3 =>
      'Névjegyének saját beállítása van a saját telefonjára.';

  @override
  String get mute1Hour => '1 óra';

  @override
  String get mute8Hours => '8 óra';

  @override
  String get mute1Day => '1 nap';

  @override
  String get mute1Week => '1 hét';

  @override
  String get muteAlways => 'Mindig';

  @override
  String get muteExplanation =>
      'Nem fog értesítéseket kapni erről a névjegyről';

  @override
  String get showCallsInRecents => 'Megjelenítés a legutóbbi hívásokban';

  @override
  String get showCallsInRecentsSubtitle =>
      'A Hash hívások megjelennek a telefon előzményeiben';

  @override
  String get feedback => 'Visszajelzés';

  @override
  String get muteNotifications => 'Értesítések némítása';

  @override
  String get muteDescription =>
      'Nem fog értesítéseket kapni erről a névjegyről';

  @override
  String mutedUntil(String time) {
    return 'Némítva eddig: $time';
  }

  @override
  String get notMuted => 'Értesítések engedélyezve';

  @override
  String get unmute => 'Némítás feloldása';

  @override
  String get notificationSound => 'Értesítési hang';

  @override
  String get defaultSound => 'Alapértelmezett';

  @override
  String get chatSettings => 'Beszélgetés beállításai';

  @override
  String get bubbleColor => 'Buborék színe';

  @override
  String get backgroundColor => 'Háttérszín';

  @override
  String get backgroundImage => 'Háttérkép';

  @override
  String get chatBackground => 'Beszélgetés háttere';

  @override
  String get customColor => 'Egyéni';

  @override
  String get defaultColor => 'Alapértelmezett';

  @override
  String get imageSelected => 'Kép kiválasztva';

  @override
  String get noImage => 'Nincs kép';

  @override
  String get color => 'Szín';

  @override
  String get image => 'Kép';

  @override
  String get tapToSelectImage => 'Koppintson a kép kiválasztásához';

  @override
  String get changeImage => 'Kép módosítása';

  @override
  String get previewMessageReceived => 'Szia!';

  @override
  String get previewMessageSent => 'Helló!';

  @override
  String get messageAction => 'Üzenet';

  @override
  String get callAction => 'Hívás';

  @override
  String get videoAction => 'Videó';

  @override
  String get personalNotes => 'Személyes jegyzetek';

  @override
  String get addNotes => 'Jegyzetek hozzáadása...';

  @override
  String get noNotes => 'Nincsenek jegyzetek';

  @override
  String get messageNotifications => 'Üzenetértesítések';

  @override
  String get callNotifications => 'Hívásértesítések';

  @override
  String get useGradient => 'Színátmenet használata';

  @override
  String get gradientStart => 'Kezdő szín';

  @override
  String get gradientEnd => 'Záró szín';

  @override
  String get preview => 'Előnézet';

  @override
  String get reset => 'Visszaállítás';

  @override
  String get securityNumber => 'Biztonsági szám';

  @override
  String securityNumberDescription(String name) {
    return 'Ellenőrizze, hogy a biztonsági szám megegyezik-e $name eszközével';
  }

  @override
  String get verifyEncryption => 'Végponttól végpontig titkosítás ellenőrzése';

  @override
  String get tapToCopy => 'Koppintson a másoláshoz';

  @override
  String get howToVerify => 'Hogyan ellenőrizze';

  @override
  String get verifyStep1 =>
      'Találkozzon személyesen a névjegyével, vagy hívja fel';

  @override
  String get verifyStep2 =>
      'Hasonlítsa össze a biztonsági számokat vagy olvassa be a QR code-okat';

  @override
  String get verifyStep3 => 'Ha egyeznek, a beszélgetése biztonságos';

  @override
  String get scanToVerify => 'Beolvasás az ellenőrzéshez';

  @override
  String get reportSpam => 'Spam jelentése';

  @override
  String get reportSpamSubtitle => 'Névjegy jelentése spamként';

  @override
  String get reportSpamDescription =>
      'Ez névtelenül jelenti ezt a névjegyet. A személyazonossága nem kerül megosztásra. Biztos benne?';

  @override
  String get report => 'Jelentés';

  @override
  String get spamReported => 'Spam jelentve';

  @override
  String get reportError =>
      'Nem sikerült elküldeni a jelentést. Kérjük, próbálja újra.';

  @override
  String get reportRateLimited =>
      'Elérte a mai napi maximális jelentések számát.';

  @override
  String get blockContact => 'Névjegy letiltása';

  @override
  String get blockContactDescription =>
      'Ez a névjegy nem tud majd üzenetet küldeni Önnek vagy hívni. Nem kap értesítést.';

  @override
  String get unblockContact => 'Névjegy feloldása';

  @override
  String get unblockContactDescription =>
      'Ez a névjegy újra küldhet üzenetet és hívhat.';

  @override
  String get contactBlocked => 'Névjegy letiltva';

  @override
  String get contactUnblocked => 'Névjegy feloldva';

  @override
  String get contactIsBlocked => 'Ez a névjegy le van tiltva';

  @override
  String get unblock => 'Feloldás';

  @override
  String get deleteContactSubtitle => 'Névjegy és beszélgetés törlése';

  @override
  String get confirmWithPin => 'Megerősítés PIN-nel';

  @override
  String get enterPinToConfirm =>
      'Adja meg a PIN-jét a művelet megerősítéséhez';

  @override
  String get profilePhoto => 'Profilkép';

  @override
  String get takePhoto => 'Fénykép készítése';

  @override
  String get chooseFromGallery => 'Választás a galériából';

  @override
  String get removePhoto => 'Fénykép eltávolítása';

  @override
  String get viewContactHashId => 'Névjegy azonosítójának megtekintése';

  @override
  String get hashIdPartiallyMasked =>
      'Részben maszkolt az Ön biztonsága és névjegye adatvédelme érdekében';

  @override
  String get addFirstContact => 'Első névjegy hozzáadása';

  @override
  String get addFirstContactSubtitle =>
      'Ossza meg QR code-ját vagy olvassa be egy barátjáét';

  @override
  String get directory => 'Névjegyzék';

  @override
  String get noContacts => 'Nincsenek névjegyek';

  @override
  String get noContactsSubtitle => 'Adjon hozzá egy névjegyet a kezdéshez';

  @override
  String get sendMessageAction => 'Üzenet küldése';

  @override
  String get audioCall => 'Hanghívás';

  @override
  String get videoCall => 'Videóhívás';

  @override
  String get viewProfile => 'Profil megtekintése';

  @override
  String get deleteContactDirectory => 'Névjegy törlése';

  @override
  String get scanShort => 'Beolvasás';

  @override
  String get addShort => 'Hozzáadás';

  @override
  String deleteContactConfirmName(String name) {
    return 'Biztosan törli $name névjegyét?';
  }

  @override
  String get noNotesTitle => 'Nincsenek jegyzetek';

  @override
  String get noNotesSubtitle => 'Hozza létre első jegyzetét';

  @override
  String get newNote => 'Új jegyzet';

  @override
  String get editNote => 'Jegyzet szerkesztése';

  @override
  String get deleteNote => 'Jegyzet törlése';

  @override
  String get deleteNoteConfirm => 'Biztosan törli ezt a jegyzetet?';

  @override
  String get noteTitle => 'Cím';

  @override
  String get noteContent => 'Tartalom';

  @override
  String get addItem => 'Elem hozzáadása';

  @override
  String get pinNote => 'Rögzítés';

  @override
  String get unpinNote => 'Rögzítés megszüntetése';

  @override
  String get noteColor => 'Szín';

  @override
  String get notePassword => 'Jelszó';

  @override
  String get setPassword => 'Jelszó beállítása';

  @override
  String get changePassword => 'Jelszó módosítása';

  @override
  String get removePassword => 'Jelszó eltávolítása';

  @override
  String get enterPassword => 'Jelszó megadása';

  @override
  String get confirmPassword => 'Jelszó megerősítése';

  @override
  String get passwordPin => 'PIN kód';

  @override
  String get passwordText => 'Szöveges jelszó';

  @override
  String get protectedNote => 'Védett jegyzet';

  @override
  String get incorrectPassword => 'Helytelen jelszó';

  @override
  String get passwordSet => 'Jelszó beállítva';

  @override
  String get passwordRemoved => 'Jelszó eltávolítva';

  @override
  String get notesBiometric => 'Face ID a jegyzetekhez';

  @override
  String get notesBiometricSubtitle =>
      'Biometrikus hitelesítés szükséges a védett jegyzetek megnyitásához';

  @override
  String get textNote => 'Szöveges jegyzet';

  @override
  String get checklistNote => 'Ellenőrző lista';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total feladat';
  }

  @override
  String get autoSaved => 'Mentve';

  @override
  String get searchNotes => 'Jegyzetek keresése';

  @override
  String get legalConsent => 'Jogi hozzájárulás';

  @override
  String get confirmAge13 => 'Megerősítem, hogy legalább 13 éves vagyok';

  @override
  String get acceptLegalStart => 'Elfogadom az ';

  @override
  String get privacyPolicy => 'Adatvédelmi irányelveket';

  @override
  String get termsOfService => 'Szolgáltatási feltételeket';

  @override
  String get andThe => ' és a ';

  @override
  String get continueButton => 'Folytatás';

  @override
  String get mustAcceptTerms =>
      'A folytatáshoz mindkét feltételt el kell fogadnia';

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
  String get support => 'Támogatás';

  @override
  String get contactSupport => 'Kapcsolat a támogatással';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Visszaélés jelentése';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Jogi';

  @override
  String get legalEntity => 'Jogi személy';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Rögzítés';

  @override
  String get unpinConversation => 'Rögzítés megszüntetése';

  @override
  String get hideConversation => 'Eltávolítás a hírfolyamból';

  @override
  String get deleteConversation => 'Beszélgetés törlése';

  @override
  String get deleteConversationConfirm =>
      'Adja meg PIN-jét az összes üzenet törlésének megerősítéséhez';

  @override
  String get noConversations => 'Még nincsenek beszélgetések';

  @override
  String get startConversation => 'Indítás';

  @override
  String get microphonePermissionRequired => 'Mikrofon hozzáférés szükséges';

  @override
  String get microphonePermissionExplanation =>
      'A Hash-nek szüksége van a mikrofonra a hívásokhoz.';

  @override
  String get cameraPermissionExplanation =>
      'A Hash-nek szüksége van a kamerára a videóhívásokhoz.';

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
  String get openSettings => 'Beállítások megnyitása';

  @override
  String get callConnecting => 'Kapcsolódás...';

  @override
  String get callRinging => 'Csörög...';

  @override
  String get callReconnecting => 'Újrakapcsolódás...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Újrakapcsolódás (${seconds}s)';
  }

  @override
  String get callPaused => 'Szünetel';

  @override
  String get callPausedSubtitle => 'A hívás még aktív';

  @override
  String get callRemoteMicMuted => 'A névjegy mikrofonja némítva van';

  @override
  String get callMiniControlsMute => 'Némítás';

  @override
  String get callMiniControlsUnmute => 'Némítás feloldása';

  @override
  String get callMiniControlsHangUp => 'Befejezés';

  @override
  String get callMiniControlsReturn => 'Visszatérés a híváshoz';

  @override
  String get callNetworkPoor => 'Instabil kapcsolat';

  @override
  String get callNetworkLost => 'Kapcsolat elveszett';

  @override
  String get callEndedTitle => 'Hívás befejezve';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Eszközadatok';

  @override
  String get deviceDataSubtitle => 'Helyi és szerver tárhely';

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
  String get localStorage => 'Helyi tárhely';

  @override
  String get onThisDevice => 'ezen az eszközön';

  @override
  String get encryptedDatabases => 'Titkosított adatbázisok';

  @override
  String get files => 'Fájlok';

  @override
  String get secureKeychain => 'Biztonságos kulcstartó';

  @override
  String get cache => 'Gyorsítótár';

  @override
  String get contactsDetail => 'Nevek, avatarok, Signal kulcsok';

  @override
  String get messagesDetail => 'Titkosított beszélgetések';

  @override
  String get notesDetail => 'Személyes jegyzetek';

  @override
  String get signalSessions => 'Signal munkamenetek';

  @override
  String get signalSessionsDetail => 'Titkosítási munkamenetek';

  @override
  String get pendingContacts => 'Függő névjegyek';

  @override
  String get pendingContactsDetail => 'Függő kérések';

  @override
  String get callHistory => 'Hívások';

  @override
  String get callHistoryDetail => 'Hívástörténet';

  @override
  String get preferences => 'Beállítások';

  @override
  String get preferencesDetail => 'Média és hívási beállítások';

  @override
  String get avatars => 'Avatarok';

  @override
  String get media => 'Média';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fájl',
      one: '1 fájl',
      zero: 'nincs fájl',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktív';

  @override
  String get notDefined => 'Nincs meghatározva';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Helyreállítási kifejezés';

  @override
  String get identity => 'Azonosság (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol kulcsok';

  @override
  String get authTokens => 'Hitelesítési tokenek';

  @override
  String get contactNamesCache => 'Névjegynevek gyorsítótára';

  @override
  String get remoteConfig => 'Távoli konfiguráció';

  @override
  String get notificationPrefs => 'Értesítési beállítások';

  @override
  String get serverData => 'Szerver adatok';

  @override
  String get serverDataInfo =>
      'A Hash minimális adatot tárol a szerveren, mind titkosítva vagy ideiglenesen.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail =>
      'Hash ID, nyilvános kulcsok, postaláda token';

  @override
  String get serverPrekeys => 'Előkulcsok';

  @override
  String get serverPrekeysDetail =>
      'Egyszer használatos Signal kulcsok (felhasználva)';

  @override
  String get serverMessages => 'Átvitel alatt lévő üzenetek';

  @override
  String get serverMessagesDetail => 'Kézbesítés után törölve (max. 24ó)';

  @override
  String get serverMedia => 'Átvitel alatt lévő média';

  @override
  String get serverMediaDetail => 'Letöltés után törölve';

  @override
  String get serverContactRequests => 'Névjegy kérések';

  @override
  String get serverContactRequestsDetail => '24 óra után lejárnak';

  @override
  String get serverRateLimits => 'Sebességkorlátozások';

  @override
  String get serverRateLimitsDetail => 'Ideiglenes visszaélés elleni adatok';

  @override
  String get privacyReassurance =>
      'A Hash nem tudja olvasni üzeneteit. Minden adat végponttól végpontig titkosított. A szerver adatok automatikusan törlődnek.';

  @override
  String get pinTooSimple =>
      'Ez a PIN túl egyszerű. Válasszon biztonságosabb kódot.';

  @override
  String get genericError => 'Hiba történt. Kérjük, próbálja újra.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nem sikerült létrehozni a fiókot: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Kifejezés vágólapra másolva';

  @override
  String get copyPhrase => 'Kifejezés másolása';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Írja le ezt a kifejezést egy biztonságos helyre. Ha elveszíti a PIN-jét e kifejezés nélkül, véglegesen elveszíti hozzáférését az adataihoz.';

  @override
  String get noMessages => 'Nincsenek üzenetek';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Törli az összes üzenetet $name felhasználóval?';
  }

  @override
  String get confirmation => 'Megerősítés';

  @override
  String get untitled => 'Névtelen';

  @override
  String get noSessions => 'Nincsenek munkamenetek';

  @override
  String get unknownContact => 'Ismeretlen névjegy';

  @override
  String get unnamed => 'Névtelen';

  @override
  String get noPendingRequestsAlt => 'Nincs függő kérés';

  @override
  String get deleteAllCallHistory => 'Törli az összes hívástörténetet?';

  @override
  String get noCalls => 'Nincsenek hívások';

  @override
  String get noPreferences => 'Nincsenek beállítások';

  @override
  String get resetAllMediaPrefs => 'Visszaállítja az összes médiabeállítást?';

  @override
  String get deleteThisAvatar => 'Törli ezt az avatart?';

  @override
  String get deleteAllAvatars => 'Törli az összes avatart?';

  @override
  String get noAvatars => 'Nincsenek avatarok';

  @override
  String get deleteThisFile => 'Törli ezt a fájlt?';

  @override
  String get deleteAllMediaFiles => 'Törli az összes médiát?';

  @override
  String get noMediaFiles => 'Nincs média';

  @override
  String get outgoing => 'Kimenő';

  @override
  String get incoming => 'Bejövő';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Eltűnő nézet: ${seconds}s';
  }

  @override
  String get normalView => 'Normál nézet';

  @override
  String get callReasonCompleted => 'Befejezett';

  @override
  String get callReasonMissed => 'Nem fogadott';

  @override
  String get callReasonDeclined => 'Elutasított';

  @override
  String get callReasonFailed => 'Sikertelen';

  @override
  String get justNow => 'Most';

  @override
  String timeAgoMinutes(int count) {
    return '$count perce';
  }

  @override
  String timeAgoHours(int count) {
    return '$count órája';
  }

  @override
  String timeAgoDays(int count) {
    return '$count napja';
  }

  @override
  String get messageTypeContact => 'Névjegy';

  @override
  String get messageTypeLocation => 'Helyzet';

  @override
  String get statusQueued => 'Sorban áll';

  @override
  String get blockedBadge => 'Letiltva';

  @override
  String get protectedBadge => 'Védett';

  @override
  String messageCount(int count) {
    return '$count üzenet';
  }

  @override
  String get deleteQuestion => 'Törli?';

  @override
  String get transferMyAccountTitle => 'Fiókom áthelyezése';

  @override
  String get loadingError => 'Betöltési hiba';

  @override
  String get transferToNewDevice => 'Áthelyezés új eszközre';

  @override
  String get transferInstructions =>
      'Az új eszközön válassza a \"Fiókom helyreállítása\" lehetőséget, és adja meg ezeket az adatokat:';

  @override
  String get yourHashIdLabel => 'Az Ön Hash ID-je';

  @override
  String get enterYourPinCode => 'Adja meg PIN kódját';

  @override
  String get pinOwnerConfirmation =>
      'Annak megerősítésére, hogy Ön a fiók tulajdonosa';

  @override
  String get scanThisQrCode => 'Olvassa be ezt a QR code-ot';

  @override
  String get withYourNewDevice => 'Az új eszközével';

  @override
  String get orEnterTheCode => 'vagy adja meg a kódot';

  @override
  String get transferCodeLabel => 'Áthelyezési kód';

  @override
  String get proximityVerification => 'Közelségi ellenőrzés';

  @override
  String get bringDevicesCloser => 'Hozza közelebb mindkét eszközt';

  @override
  String get confirmTransferQuestion => 'Megerősíti az áthelyezést?';

  @override
  String get accountWillBeTransferred =>
      'Fiókja áthelyezésre kerül az új eszközre.\n\nEz az eszköz véglegesen lecsatlakozik.';

  @override
  String get transferComplete => 'Áthelyezés kész';

  @override
  String get transferSuccessMessage =>
      'Fiókja sikeresen áthelyezve.\n\nEz az alkalmazás most bezárul.';

  @override
  String get manualVerification => 'Kézi ellenőrzés';

  @override
  String get codeDisplayedOnBothDevices =>
      'Mindkét eszközön megjelenített kód:';

  @override
  String get doesCodeMatchNewDevice =>
      'Egyezik ez a kód az új eszközön megjelenővel?';

  @override
  String get verifiedStatus => 'Ellenőrizve';

  @override
  String get inProgressStatus => 'Folyamatban...';

  @override
  String get notAvailableStatus => 'Nem elérhető';

  @override
  String get codeExpiredRestart => 'A kód lejárt. Kérjük, indítsa újra.';

  @override
  String get codesDoNotMatchCancelled =>
      'A kódok nem egyeznek. Áthelyezés megszakítva.';

  @override
  String transferToDevice(String device) {
    return 'Cél: $device';
  }

  @override
  String get copiedExclamation => 'Másolva!';

  @override
  String expiresInTime(String time) {
    return 'Lejár: $time múlva';
  }

  @override
  String get biometricNotAvailable =>
      'A biometria nem érhető el ezen az eszközön';

  @override
  String get biometricAuthError => 'Hiba a biometrikus hitelesítés során';

  @override
  String get authenticateForBiometric =>
      'Kérjük, hitelesítse magát a biometria engedélyezéséhez';

  @override
  String get biometricAuthFailed => 'A biometrikus hitelesítés sikertelen';

  @override
  String get forceUpdateTitle => 'Frissítés szükséges';

  @override
  String get forceUpdateMessage =>
      'A Hash új verziója elérhető. Kérjük, frissítsen a folytatáshoz.';

  @override
  String get updateButton => 'Frissítés';

  @override
  String get maintenanceInProgress => 'Karbantartás folyamatban';

  @override
  String get tryAgainLater => 'Kérjük, próbálja újra később';

  @override
  String get information => 'Információ';

  @override
  String get later => 'Később';

  @override
  String get doYouLikeHash => 'Tetszik a Hash?';

  @override
  String get yourFeedbackHelps =>
      'Visszajelzése segít nekünk az alkalmazás fejlesztésében';

  @override
  String get ratingTerrible => 'Szörnyű';

  @override
  String get ratingBad => 'Rossz';

  @override
  String get ratingOk => 'Rendben';

  @override
  String get ratingGood => 'Jó';

  @override
  String get ratingExcellent => 'Kiváló!';

  @override
  String get donationMessage =>
      'A Hash egy nonprofit projekt. Támogatásával segít nekünk egy valóban privát üzenetküldő fejlesztésében.';

  @override
  String get recentConnections => 'Legutóbbi kapcsolatok';

  @override
  String get loginInfoText =>
      'Minden PIN-feloldás helyben rögzítésre kerül. Csak az utolsó 24 óra kerül megőrzésre.';

  @override
  String get connectionCount => 'Kapcsolat(ok)';

  @override
  String get periodLabel => 'Időszak';

  @override
  String get historyLabel => 'Előzmények';

  @override
  String get noLoginRecorded => 'Nincs rögzített bejelentkezés';

  @override
  String get nextUnlocksAppearHere =>
      'A következő feloldások itt jelennek meg.';

  @override
  String get dataLocalOnly =>
      'Ezek az adatok csak az eszközén tárolódnak, és soha nem kerülnek továbbításra.';

  @override
  String get currentSession => 'Jelenlegi';

  @override
  String get todayLabel => 'Ma';

  @override
  String get yesterdayLabel => 'Tegnap';

  @override
  String get justNowLabel => 'Most';

  @override
  String minutesAgoLabel(int count) {
    return '$count perce';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hoursó-val ezelőtt';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hoursó ${minutes}p-vel ezelőtt';
  }

  @override
  String get noMaintenancePlanned => 'Nincs tervezett karbantartás';

  @override
  String get everythingWorkingNormally => 'Minden normálisan működik';

  @override
  String get maintenanceTitle => 'Karbantartás';

  @override
  String get maintenanceActiveLabel => 'FOLYAMATBAN';

  @override
  String get maintenancePlannedLabel => 'TERVEZETT';

  @override
  String get locking => 'Zárolás...';

  @override
  String get newMessageNotification => 'Új üzenet';

  @override
  String get secExplainTitle => 'Hogyan véd a Hash';

  @override
  String get secExplainIntro =>
      'A Hash úgy lett tervezve, hogy senki ne olvashassa az üzeneteit.';

  @override
  String get secExplainIntroSub =>
      'Még mi sem.\nÍgy működik, egyszerűen elmagyarázva.';

  @override
  String get secJourneyLabel => 'AZ UTAZÁS';

  @override
  String get secJourneyTitle => 'Az üzenete útja';

  @override
  String get secJourneySubtitle =>
      'Az ujjától a névjegye képernyőjéig minden lépés védett. Kövesse az utat.';

  @override
  String get secStep1Title => 'Megírja üzenetét';

  @override
  String get secStep1Desc =>
      'Beírja, hogy \"Szia!\" az alkalmazásba. Ebben a pillanatban az üzenet csak a telefon memóriájában létezik. Semmi nem lett elküldve.';

  @override
  String get secStep2Title => 'Titkosítás Signal Protocol-lal';

  @override
  String get secStep2Desc =>
      'Amint megnyomja a \"Küldés\" gombot, üzenete érthetetlen karakterlánccá alakul. Mintha az üzenetét egy széfbe zárná, amelynek kulcsa csak a névjegyénél van.';

  @override
  String get secStep3Title => 'Sealed Sender: a láthatatlan boríték';

  @override
  String get secStep3Desc =>
      'Képzelje el, hogy levelet küld postán, de feladó nélkül a borítékon. Pontosan ezt teszi a Hash. Az üzenetet egy anonim postaládába dobják. A szerver nem tudja, ki küldte.';

  @override
  String get secStep4Title => 'A szerver semmit nem lát';

  @override
  String get secStep4Desc =>
      'A szerver vak postásként működik. Csak annyit tud, hogy \"valaki bedobott valamit az #A7X9 postaládába\". Nem tudja, ki küldte, mi az, vagy kinek szól.';

  @override
  String get secStep4Highlight =>
      'Nem tárol metaadatokat: nincs IP cím, nincs időbélyeg, nincs kapcsolat küldő és címzett között.';

  @override
  String get secStep5Title => 'Névjegye megkapja az üzenetet';

  @override
  String get secStep5Desc =>
      'Névjegye telefonja lekéri a tartalmat az anonim postaládából, és a privát kulcsával visszafejti az üzenetet, amely soha nem hagyta el az eszközét. A \"Szia!\" megjelenik a képernyőjén.';

  @override
  String get secStep6Title => 'Az üzenet eltűnik a szerverről';

  @override
  String get secStep6Desc =>
      'Amint névjegye visszaigazolja a fogadást, a szerver véglegesen törli az üzenetet. Nincs kuka, nincs archívum, nincs biztonsági másolat. Még az olvasatlan üzenetek is automatikusan megsemmisülnek 24 óra után.';

  @override
  String get secStep7Title => 'Helyi lejárat';

  @override
  String get secStep7Desc =>
      'Névjegye telefonján az üzenet az Ön által választott időtartam szerint megsemmisül: olvasás után azonnal, 5 perc, 1 óra... Ön dönti el.';

  @override
  String get secJourneyConclusion =>
      'Eredmény: nulla nyom a szerveren, nulla nyom az eszközökön. Az üzenet csak addig létezett, amíg el nem olvasták, aztán eltűnt.';

  @override
  String get secArchLabel => 'ARCHITEKTÚRA';

  @override
  String get secArchTitle => '5 védelmi réteg';

  @override
  String get secArchSubtitle =>
      'A Hash nem egyetlen technológiára támaszkodik. Minden réteg erősíti a többit. Még ha egy réteg kompromittálódik is, adatai biztonságban maradnak.';

  @override
  String get secLayer1Title => 'Végponttól végpontig titkosítás';

  @override
  String get secLayer1Desc =>
      'Minden üzenet egyedi kulccsal van titkosítva. Egyszerűen: még ha valaki visszafejt egy üzenetet, a következőt nem tudja. Minden üzenetnek saját zárat van.';

  @override
  String get secLayer1Detail =>
      'Fájlokhoz (fotók, videók, dokumentumok) a Hash további AES-256-GCM titkosítást használ. A fájl titkosítva van, mielőtt elhagyná a telefont.';

  @override
  String get secLayer2Title => 'Sealed Sender (hálózati anonimitás)';

  @override
  String get secLayer2Desc =>
      'A hagyományos üzenetküldők az Ön személyazonosságával küldik az üzeneteket. Mintha a nevét írná a borítékra. A Hash anonim postaládákat használ: a szerver kézbesíti az üzenetet anélkül, hogy tudná, ki küldte.';

  @override
  String get secLayer2Detail =>
      'Eredmény: még szerver adatszivárgás esetén is lehetetlen rekonstruálni, ki kivel beszél.';

  @override
  String get secLayer3Title => 'Automatikus törlés';

  @override
  String get secLayer3Desc =>
      'Az üzenetek a fogadás visszaigazolása után azonnal törlődnek a szerverről. Még ha egy üzenetet soha nem kérnek le, 24 óra után automatikusan megsemmisül.';

  @override
  String get secLayer3Detail =>
      'A telefonján az üzenetek az Ön által választott időtartam szerint semmisülnek meg: azonnal, 5 perc, 15 perc, 30 perc, 1ó, 3ó, 6ó vagy 12ó.';

  @override
  String get secLayer4Title => 'Helyi hozzáférés védelme';

  @override
  String get secLayer4Desc =>
      'Az alkalmazást 6 számjegyű PIN és/vagy biometria (Face ID, ujjlenyomat) védi. Túl sok sikertelen próbálkozás után az alkalmazás zárolódik, minden sikertelen kísérlet után növekvő késleltetéssel.';

  @override
  String get secLayer5Title => 'Zárolt adatbázis';

  @override
  String get secLayer5Desc =>
      'A szerver oldalon egyetlen felhasználó sem írhat közvetlenül az adatbázisba. Minden művelet biztonságos függvényeken keresztül történik, amelyek minden kérést ellenőriznek.';

  @override
  String get secLayer5Detail =>
      'Olyan, mint egy bankpult: soha nem nyúl a széfhez. Kérést nyújt be, és a rendszer ellenőrzi, hogy jogosult-e, mielőtt cselekszik.';

  @override
  String get secVashLabel => 'EGYEDÜLÁLLÓ A VILÁGON';

  @override
  String get secVashTitle => 'Vash mód';

  @override
  String get secVashSubtitle =>
      'Egy vészhelyzeti biztonsági rendszer, amely egyetlen más üzenetküldőben sem létezik.';

  @override
  String get secVashScenarioTitle => 'Képzelje el ezt a helyzetet';

  @override
  String get secVashScenario1 => 'Valaki hozzáfér a telefonjához';

  @override
  String get secVashScenario2 => 'Kérik a PIN kódját';

  @override
  String get secVashScenario3 => 'Sürgősen törölni akarja az összes adatát';

  @override
  String get secVashSolutionTitle => 'A megoldás: két PIN kód';

  @override
  String get secVashSolutionDesc =>
      'Két különböző PIN kódot konfigurál a Hash-ben:';

  @override
  String get secVashNormalCodeLabel => 'Normál kód';

  @override
  String get secVashNormalCodeDesc =>
      'Normálisan megnyitja az alkalmazást az összes adattal';

  @override
  String get secVashCodeLabel2 => 'Vash kód';

  @override
  String get secVashCodeDescription =>
      'Normálisan megnyitja az alkalmazást... de az összes adat csendben törlődik a háttérben';

  @override
  String get secVashWhatHappensTitle => 'Mi történik ezután';

  @override
  String get secVashWhatHappensDesc =>
      'Az alkalmazás normálisan megnyílik. Nincs figyelmeztetés, nincs gyanús animáció. A képernyő egyszerűen egy üres alkalmazást mutat, mintha most telepítette volna.\n\nA valóságban az összes beszélgetése, névjegye és üzenete visszafordíthatatlanul törlődött egy másodperc töredéke alatt.';

  @override
  String get secCallsLabel => 'HÍVÁSOK ÉS FÁJLOK';

  @override
  String get secCallsTitle => 'Minden titkosított';

  @override
  String get secCallsSubtitle =>
      'Nem csak az üzenetek. Abszolút minden, ami a Hash-en keresztül megy, végponttól végpontig titkosított.';

  @override
  String get secAudioCallTitle => 'Hanghívások';

  @override
  String get secAudioCallDesc =>
      'Végponttól végpontig titkosítva WebRTC-n keresztül. A hang közvetlenül az eszközök között kerül átvitelre.';

  @override
  String get secVideoCallTitle => 'Videóhívások';

  @override
  String get secVideoCallDesc =>
      'Ugyanaz a technológia, minden adatfolyam egyedileg titkosítva.';

  @override
  String get secPhotosTitle => 'Fotók és videók';

  @override
  String get secPhotosDesc =>
      'AES-256-GCM-mel titkosítva, mielőtt elhagynák a telefont.';

  @override
  String get secDocsTitle => 'Dokumentumok';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, bármilyen fájl. Név, méret és tartalom titkosítva.';

  @override
  String get secAnonLabel => 'ANONIMITÁS';

  @override
  String get secAnonTitle => 'Nem szükséges személyazonosság';

  @override
  String get secAnonSubtitle =>
      'A Hash soha nem kéri telefonszámát vagy e-mail címét. Egyedi és anonim Hash ID azonosítja Önt.';

  @override
  String get secHashIdTitle => 'Az Ön Hash ID-je';

  @override
  String get secHashIdDesc =>
      'Ez az Ön egyedi azonosítója. Semmit nem árul el Önről: sem a nevét, sem a számát, sem a tartózkodási helyét. Olyan, mint egy álnév, amelyet lehetetlen a valódi személyazonossághoz kötni.\n\nNévjegy hozzáadásához megosztja a Hash ID-jét vagy beolvas egy QR code-ot. Ennyi. Nincs szinkronizált címjegyzék, nincsenek \"Ismerősei lehetnek\" javaslatok.';

  @override
  String get secDataLabel => 'ADATOK';

  @override
  String get secDataTitle => 'Amit a Hash nem tud';

  @override
  String get secDataSubtitle =>
      'A legjobb módja az adatok védelmének, ha nem gyűjtjük őket.';

  @override
  String get secNeverCollected => 'Soha nem gyűjtött';

  @override
  String get secNeverItem1 => 'Üzenet tartalom';

  @override
  String get secNeverItem2 => 'Névjegylista';

  @override
  String get secNeverItem3 => 'Telefonszám';

  @override
  String get secNeverItem4 => 'E-mail cím';

  @override
  String get secNeverItem5 => 'IP cím';

  @override
  String get secNeverItem6 => 'Tartózkodási hely';

  @override
  String get secNeverItem7 => 'Metaadatok (ki kivel beszél)';

  @override
  String get secNeverItem8 => 'Hívástörténet';

  @override
  String get secNeverItem9 => 'Címjegyzék';

  @override
  String get secNeverItem10 => 'Hirdetési azonosítók';

  @override
  String get secTempStored => 'Ideiglenesen tárolt';

  @override
  String get secTempItem1 => 'Anonim Hash ID (egyedi azonosító)';

  @override
  String get secTempItem2 => 'Nyilvános titkosítási kulcsok';

  @override
  String get secTempItem3 => 'Titkosított üzenetek átvitel közben (max. 24ó)';

  @override
  String get secTempNote =>
      'Még ez a minimális adat sem azonosíthatja Önt. Hash ID-je nem kapcsolódik semmilyen személyes információhoz.';

  @override
  String get secFooterTitle => 'Az Ön magánélete, az Ön szabadsága';

  @override
  String get secFooterDesc =>
      'A Hash ugyanazokat a titkosítási technológiákat használja, mint a legigényesebb professzionális alkalmazások. Üzeneteit matematika védi, nem ígéretek.';

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
