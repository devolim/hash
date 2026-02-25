// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero urme. Zero compromisuri.';

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
  String get conversations => 'Conversatii';

  @override
  String get contacts => 'Contacte';

  @override
  String get noConversation => 'Nicio conversatie';

  @override
  String get noConversationSubtitle =>
      'Adauga un contact pentru a incepe sa comunici in siguranta';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cereri in asteptare',
      one: '1 cerere in asteptare',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cereri trimise in asteptare',
      one: '1 cerere trimisa in asteptare',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Adauga contact';

  @override
  String get shareApp => 'Distribuie aplicatia';

  @override
  String get newMessage => 'Mesaj nou';

  @override
  String get newConversation => 'Trimite un mesaj';

  @override
  String get settings => 'Setari';

  @override
  String get myHashId => 'Hash ID-ul meu';

  @override
  String get supportHash => 'Sustine Hash';

  @override
  String get supportHashSubtitle => 'Hash este un proiect non-profit';

  @override
  String get donate => 'Doneaza';

  @override
  String get appearance => 'Aspect';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automat';

  @override
  String get themeAutoSubtitle => 'Urmeaza setarile sistemului';

  @override
  String get themeDark => 'Intunecat';

  @override
  String get themeLight => 'Luminos';

  @override
  String get themeRecommendation =>
      'Tema intunecata este recomandata pentru confidentialitate mai buna';

  @override
  String get language => 'Limba';

  @override
  String get languageAuto => 'Automat (sistem)';

  @override
  String get notifications => 'Notificari';

  @override
  String get messages => 'Mesaje';

  @override
  String get calls => 'Apeluri';

  @override
  String get vibration => 'Vibratie';

  @override
  String get notificationContent => 'Continut notificare';

  @override
  String get notificationContentFull => 'Arata tot';

  @override
  String get notificationContentFullDesc =>
      'Numele contactului si previzualizarea mesajului';

  @override
  String get notificationContentName => 'Doar numele';

  @override
  String get notificationContentNameDesc => 'Arata doar numele contactului';

  @override
  String get notificationContentDiscrete => 'Discret';

  @override
  String get notificationContentDiscreteDesc => 'Arata doar \"Mesaj nou\"';

  @override
  String get security => 'Securitate';

  @override
  String get howHashProtectsYou => 'Cum te protejeaza Hash';

  @override
  String get howHashProtectsYouSubtitle => 'Intelege securitatea ta';

  @override
  String get accountSecurity => 'Securitatea contului';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrie, Mod Vash';

  @override
  String get blockScreenshots => 'Blocheaza capturile de ecran';

  @override
  String get transferDevice => 'Transfera pe alt dispozitiv';

  @override
  String get transferDeviceSubtitle => 'Migreaza contul tau';

  @override
  String get pinCode => 'Cod PIN';

  @override
  String get changePin => 'Schimba codul PIN';

  @override
  String get currentPin => 'Codul PIN actual';

  @override
  String get newPin => 'Cod PIN nou';

  @override
  String get confirmPin => 'Confirma codul PIN';

  @override
  String get pinChanged => 'Codul PIN a fost schimbat';

  @override
  String get incorrectPin => 'PIN incorect';

  @override
  String get pinsDoNotMatch => 'Codurile PIN nu se potrivesc';

  @override
  String get autoLock => 'Blocare automata';

  @override
  String get autoLockDelay => 'Intarziere blocare';

  @override
  String get autoLockImmediate => 'Imediat';

  @override
  String get autoLockMinute => '1 minut';

  @override
  String autoLockMinutes(int count) {
    return '$count minute';
  }

  @override
  String get vashCode => 'Cod Vash';

  @override
  String get vashModeTitle => 'Mod Vash';

  @override
  String get vashModeExplanation => 'Ultima ta plasa de siguranta.';

  @override
  String get vashModeDescription =>
      'Vei alege un al doilea cod PIN. Daca esti vreodata fortat sa deschizi Hash, introdu acest cod in locul PIN-ului obisnuit.\n\nAplicatia se va deschide normal, dar toate conversatiile si contactele tale vor fi disparute.\n\nPentru oricine se uita la ecran, Hash pare pur si simplu gol — ca si cum nu l-ai fi folosit niciodata.';

  @override
  String get vashModeIrreversible =>
      'Aceasta actiune este silentioasa si ireversibila.';

  @override
  String get chooseVashCode => 'Alege codul meu Vash';

  @override
  String get vashCodeInfo =>
      'Un al doilea cod PIN care deschide aplicatia normal, dar goala.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Daca introduci acest cod in locul PIN-ului:';

  @override
  String get vashDeleteContacts => 'Contactele tale dispar';

  @override
  String get vashDeleteMessages => 'Conversatiile tale dispar';

  @override
  String get vashDeleteHistory => 'Notitele tale dispar';

  @override
  String get vashKeepId => 'Identitatea ta Hash (#XXX-XXX-XXX) ramane aceeasi';

  @override
  String get vashAppearNormal =>
      'Aplicatia pare normala dar goala, ca noua. Aceasta actiune este ireversibila.';

  @override
  String get setupVashCode => 'Configureaza codul Vash';

  @override
  String get modifyVashCode => 'Modifica codul Vash';

  @override
  String get currentVashCode => 'Codul Vash actual';

  @override
  String get newVashCode => 'Cod Vash nou';

  @override
  String get confirmVashCode => 'Confirma codul Vash';

  @override
  String get vashCodeConfigured => 'Codul Vash a fost configurat';

  @override
  String get vashCodeModified => 'Codul Vash a fost modificat';

  @override
  String get vashCodeMustDiffer => 'Codul Vash trebuie sa fie diferit de PIN';

  @override
  String get incorrectVashCode => 'Cod Vash incorect';

  @override
  String get vashWhatToDelete => 'Ce ar trebui sa faca Modul Vash sa dispara?';

  @override
  String get vashDeleteContactsOption => 'Contacte';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Mesaje';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notite';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Modul Vash activat';

  @override
  String get vashCreateSubtitle => 'Alege un cod diferit de PIN-ul principal';

  @override
  String get vashConfirmSubtitle => 'Confirma codul tau Vash';

  @override
  String get pinCodeForEntry => 'Cod PIN pentru intrarea în aplicație';

  @override
  String get vashCodeSection => 'Mod Vash';

  @override
  String get biometric => 'Biometrie';

  @override
  String get biometricUnlock => 'Deblochează cu amprenta sau Face ID';

  @override
  String get enableBiometric => 'Activează biometria';

  @override
  String get biometricWarningMessage =>
      'Activând biometria, nu veți putea folosi codul Vash pentru a intra în aplicație.\n\nVeți putea folosi codul Vash doar dacă biometria eșuează (după mai multe încercări eșuate).\n\nSunteți sigur că doriți să continuați?';

  @override
  String get understood => 'Am înțeles';

  @override
  String get shareAppSubtitle => 'Distribuiți Hash celor apropiați';

  @override
  String get share => 'Distribuie';

  @override
  String get danger => 'Pericol';

  @override
  String get deleteAccount => 'Sterge contul meu';

  @override
  String get deleteAccountSubtitle => 'Actiune ireversibila';

  @override
  String get deleteAccountConfirmTitle => 'Sterge contul meu';

  @override
  String get deleteAccountConfirmMessage =>
      'Contul tau va fi sters permanent. Aceasta actiune este ireversibila.\n\n• Toate conversatiile tale\n• Toate contactele tale\n• Hash ID-ul tau\n\nVa trebui sa creezi un cont nou.';

  @override
  String get deleteForever => 'Sterge permanent';

  @override
  String get cancel => 'Anuleaza';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Modul Vash activat.';

  @override
  String deletionError(String error) {
    return 'Eroare la stergere: $error';
  }

  @override
  String get yourSecurity => 'Securitatea ta';

  @override
  String get securityInfo =>
      '• Criptare end-to-end (Signal Protocol)\n• Nicio data pe serverele noastre dupa livrare\n• Cheile stocate doar pe dispozitivul tau\n• Codul PIN nu este niciodata trimis la server';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Bine ai venit';

  @override
  String get securityStatement1 => 'Mesajele tale sunt protejate.';

  @override
  String get securityStatement2 => 'Criptare end-to-end.';

  @override
  String get securityStatement3 => 'Nicio urma. Niciun compromis.';

  @override
  String get securityStatement4 => 'Confidentialitatea ta este un drept.';

  @override
  String get accessBlocked => 'Acces blocat';

  @override
  String get tooManyAttempts => 'Prea multe incercari. Incearca mai tarziu.';

  @override
  String get pleaseWait => 'Te rugam sa astepti';

  @override
  String get waitDelay => 'Te rugam sa astepti sa se termine intarzierea';

  @override
  String attemptCount(int current, int max) {
    return 'Incercarea $current din $max';
  }

  @override
  String retryIn(String time) {
    return 'Reincearca in $time';
  }

  @override
  String get forgotPin => 'Ai uitat PIN-ul? Foloseste fraza de recuperare';

  @override
  String get useRecoveryPhrase => 'Foloseste fraza de recuperare';

  @override
  String get recoveryWarningTitle => 'Avertisment';

  @override
  String get recoveryWarningMessage => 'Recuperarea contului va:';

  @override
  String get recoveryDeleteAllMessages => 'Sterge TOATE mesajele tale';

  @override
  String get recoveryWaitDelay => 'Necesita o intarziere de 1 ora';

  @override
  String get recoveryKeepContacts => 'Pastra contactele tale';

  @override
  String get recoveryIrreversible =>
      'Aceasta actiune este ireversibila. Mesajele tale vor fi pierdute permanent.';

  @override
  String get iUnderstand => 'Inteleg';

  @override
  String get accountRecovery => 'Recuperare cont';

  @override
  String get enterRecoveryPhrase =>
      'Introdu cele 24 de cuvinte ale frazei de recuperare, separate prin spatii.';

  @override
  String get recoveryPhraseHint => 'cuvant1 cuvant2 cuvant3 ...';

  @override
  String get recover => 'Recupereaza';

  @override
  String get recoveryPhraseRequired =>
      'Te rugam sa introduci fraza de recuperare';

  @override
  String get recoveryPhrase24Words =>
      'Fraza trebuie sa contina exact 24 de cuvinte';

  @override
  String get incorrectRecoveryPhrase => 'Fraza de recuperare incorecta';

  @override
  String get recoveryInitError => 'Eroare la initializarea recuperarii';

  @override
  String get securityDelay => 'Intarziere de securitate';

  @override
  String get securityDelayMessage =>
      'Pentru securitatea ta, este necesara o perioada de asteptare inainte de a putea crea un nou PIN.';

  @override
  String get timeRemaining => 'Timp ramas';

  @override
  String get messagesDeletedForProtection =>
      'Mesajele tale au fost sterse pentru protectia ta.';

  @override
  String get canCloseApp => 'Poti inchide aplicatia si sa revii mai tarziu.';

  @override
  String get onboardingTitle1 => 'Bine ai venit pe Hash';

  @override
  String get onboardingSubtitle1 => 'Mesagerul care nu lasa urme';

  @override
  String get onboardingTitle2 => 'Criptare totala';

  @override
  String get onboardingSubtitle2 =>
      'Mesajele tale sunt criptate end-to-end cu protocolul Signal';

  @override
  String get onboardingTitle3 => 'Nicio urma';

  @override
  String get onboardingSubtitle3 =>
      'Mesajele sunt sterse de pe servere la livrare';

  @override
  String get onboardingTitle4 => 'Securitatea ta';

  @override
  String get onboardingSubtitle4 => 'Cod PIN, Mod Vash si fraza de recuperare';

  @override
  String get getStarted => 'Incepe';

  @override
  String get next => 'Urmatorul';

  @override
  String get skip => 'Sari';

  @override
  String get alreadyHaveAccount => 'Am deja un cont';

  @override
  String get transferMyAccount => 'Transfera contul meu';

  @override
  String get createPin => 'Creeaza un cod PIN';

  @override
  String get createPinSubtitle =>
      'Acest cod va proteja accesul la aplicatia ta';

  @override
  String get confirmYourPin => 'Confirma codul tau PIN';

  @override
  String get confirmPinSubtitle => 'Introdu din nou codul tau PIN';

  @override
  String get saveRecoveryPhrase => 'Fraza de recuperare';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Noteaza aceste 24 de cuvinte in ordine. Ele iti vor permite sa iti recuperezi contul daca uiti PIN-ul.';

  @override
  String get phraseWritten => 'Am notat fraza';

  @override
  String get warningRecoveryPhrase =>
      'Daca pierzi aceasta fraza si uiti PIN-ul, vei pierde accesul la cont.';

  @override
  String get accountTransferred => 'Cont transferat';

  @override
  String get accountTransferredMessage =>
      'Contul tau a fost transferat pe alt dispozitiv. Aceasta sesiune nu mai este valida.';

  @override
  String get accountTransferredInfo =>
      'Daca nu ai initiat acest transfer, contul tau ar putea fi compromis.';

  @override
  String get logout => 'Deconecteaza-te';

  @override
  String get transferAccount => 'Transfera contul';

  @override
  String get transferAccountInfo =>
      'Transfera contul tau Hash pe un dispozitiv nou. Sesiunea actuala va fi invalidata.';

  @override
  String get generateTransferCode => 'Genereaza codul de transfer';

  @override
  String get transferCode => 'Cod de transfer';

  @override
  String transferCodeExpires(int minutes) {
    return 'Acest cod expira in $minutes minute';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Introdu acest cod pe noul dispozitiv pentru a transfera contul.';

  @override
  String get generateNewCode => 'Genereaza cod nou';

  @override
  String get scanQrCode => 'Scaneaza QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Scaneaza QR code-ul unui contact pentru a-l adauga';

  @override
  String get qrCodeDetected => 'QR code detectat';

  @override
  String get invalidQrCode => 'QR code invalid';

  @override
  String get cameraPermissionRequired => 'Este necesara permisiunea camerei';

  @override
  String get myQrCode => 'QR code-ul meu';

  @override
  String get myQrCodeSubtitle =>
      'Distribuie acest QR code ca sa te poata adauga contactele';

  @override
  String get shareQrCode => 'Distribuie';

  @override
  String get addContactTitle => 'Adauga contact';

  @override
  String get addContactByHashId => 'Introdu Hash ID-ul contactului tau';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Cauta';

  @override
  String get contactNotFound => 'Contact negasit';

  @override
  String get contactAlreadyAdded => 'Acest contact este deja in lista ta';

  @override
  String get contactAdded => 'Contact adaugat';

  @override
  String get myProfile => 'Profilul meu';

  @override
  String get myProfileSubtitle =>
      'Distribuie aceste informatii ca altii sa te poata adauga';

  @override
  String get temporaryCode => 'Cod temporar';

  @override
  String temporaryCodeExpires(String time) {
    return 'Expira in $time';
  }

  @override
  String get codeExpired => 'Cod expirat';

  @override
  String get generateNewCodeButton => 'Cod nou';

  @override
  String get copyHashId => 'Copiaza ID';

  @override
  String get copyCode => 'Copiaza codul';

  @override
  String get copiedToClipboard => 'Copiat';

  @override
  String get showMyQrCode => 'Arata QR code-ul meu';

  @override
  String get orDivider => 'sau';

  @override
  String get openScanner => 'Deschide scanerul';

  @override
  String get addManually => 'Adauga manual';

  @override
  String get contactHashIdLabel => 'Hash ID-ul contactului';

  @override
  String get temporaryCodeLabel => 'Cod temporar';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Cere contactului sa genereze un cod din profilul sau';

  @override
  String get verifyAndAdd => 'Verifica si adauga';

  @override
  String get fillAllFields => 'Te rugam sa completezi toate campurile';

  @override
  String get invalidHashIdFormat => 'Format ID invalid (ex: 123-456-ABC)';

  @override
  String get userNotFound => 'Utilizator negasit';

  @override
  String get cannotAddYourself => 'Nu te poti adauga pe tine insuti';

  @override
  String get invalidOrExpiredCode => 'Cod temporar invalid sau expirat';

  @override
  String get contactFound => 'Contact gasit!';

  @override
  String get howToCallContact => 'Cum ai vrea sa ii spui?';

  @override
  String get contactNameHint => 'Numele contactului';

  @override
  String get addContactButton => 'Adauga';

  @override
  String get contactDetails => 'Detalii contact';

  @override
  String get contactName => 'Numele contactului';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Adaugat pe $date';
  }

  @override
  String get deleteContact => 'Sterge contactul';

  @override
  String deleteContactConfirm(Object name) {
    return 'Stergi acest contact?';
  }

  @override
  String get deleteContactMessage =>
      'Aceasta va sterge si intreaga conversatie.';

  @override
  String get delete => 'Sterge';

  @override
  String get typeMessage => 'Scrie un mesaj...';

  @override
  String get messageSent => 'Trimis';

  @override
  String get messageDelivered => 'Livrat';

  @override
  String get messageRead => 'Citit';

  @override
  String get messageFailed => 'Trimitere esuata';

  @override
  String get now => 'Acum';

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
    return '${count}z';
  }

  @override
  String get today => 'Azi';

  @override
  String get yesterday => 'Ieri';

  @override
  String dateAtTime(String date, String time) {
    return '$date la $time';
  }

  @override
  String get shareMessage =>
      'Alatura-te pe Hash! 🔒\n\nEste un mesager cu adevarat privat: criptare totala, nicio urma pe servere si mod de panica daca e nevoie.\n\nDescarca aplicatia aici 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Eroare';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Vezi';

  @override
  String get yes => 'Da';

  @override
  String get no => 'Nu';

  @override
  String get save => 'Salveaza';

  @override
  String get edit => 'Editeaza';

  @override
  String get close => 'Inchide';

  @override
  String get confirm => 'Confirma';

  @override
  String get loading => 'Se incarca...';

  @override
  String get retry => 'Reincearca';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Cereri in asteptare';

  @override
  String get noPendingRequests => 'Nicio cerere in asteptare';

  @override
  String get pendingRequestsSubtitle => 'Aceste persoane vor sa te adauge';

  @override
  String requestFromUser(String hashId) {
    return 'Cerere de la $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Expira in $days zile';
  }

  @override
  String get acceptRequest => 'Accepta';

  @override
  String get rejectRequest => 'Respinge';

  @override
  String get requestAccepted => 'Cerere acceptata';

  @override
  String get requestRejected => 'Cerere respinsa';

  @override
  String get requestSent => 'Cerere trimisa!';

  @override
  String get requestSentSubtitle =>
      'Cererea ta a fost trimisa. Utilizatorul trebuie sa o accepte inainte sa puteti comunica.';

  @override
  String get requestAlreadyPending => 'O cerere este deja in asteptare';

  @override
  String get requestAlreadySentByOther =>
      'Aceasta persoana ti-a trimis deja o cerere';

  @override
  String get addByHashId => 'Adauga dupa Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Introdu Hash ID-ul si codul temporar al contactului';

  @override
  String get enterTemporaryCode => 'Introdu codul de 6 cifre';

  @override
  String get sendRequest => 'Trimite cererea';

  @override
  String get acceptContactTitle => 'Accepta contactul';

  @override
  String get acceptContactSubtitle => 'Poti sa ii dai un nume personalizat';

  @override
  String get leaveEmptyForHashId => 'Lasa gol pentru a folosi Hash ID';

  @override
  String get firstName => 'Prenume';

  @override
  String get lastName => 'Nume';

  @override
  String get notes => 'Notite';

  @override
  String get notesHint => 'Notite personale despre acest contact';

  @override
  String get photoOptional => 'Foto (optional)';

  @override
  String get contactNameOptional => 'Nume (optional)';

  @override
  String get notesOptional => 'Notite (optional)';

  @override
  String get storedLocally => 'Stocat doar pe dispozitivul tau';

  @override
  String get encryptedMessageLabel => 'Mesaj criptat';

  @override
  String get identityMessageHint => 'Cine esti? Cum va cunoasteti?';

  @override
  String get messageWillBeSentEncrypted =>
      'Acest mesaj va fi criptat si trimis destinatarului';

  @override
  String get sendRequestButton => 'Trimite cererea';

  @override
  String get requestExpiresIn24h =>
      'Cererea expira in 24h daca nu este acceptata';

  @override
  String get theyAlreadySentYouRequest =>
      'Aceasta persoana ti-a trimis deja o cerere';

  @override
  String get requests => 'Cereri';

  @override
  String get receivedRequests => 'Primite';

  @override
  String get sentRequests => 'Trimise';

  @override
  String get noSentRequests => 'Nicio cerere trimisa';

  @override
  String get cancelRequest => 'Anuleaza';

  @override
  String get deleteRequest => 'Sterge cererea';

  @override
  String get requestCancelled => 'Cerere anulata';

  @override
  String sentTo(String hashId) {
    return 'Trimis catre $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Expira in $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Primit acum $time';
  }

  @override
  String get messageFromRequester => 'Mesaj de la solicitant';

  @override
  String get copy => 'Copiaza';

  @override
  String get messageInfo => 'Informatii mesaj';

  @override
  String get messageDirection => 'Directie';

  @override
  String get messageSentByYou => 'Trimis de tine';

  @override
  String get messageReceived => 'Primit';

  @override
  String get messageSentAt => 'Trimis la';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Stare';

  @override
  String get messageReadAt => 'Citit la';

  @override
  String get messageType => 'Tip';

  @override
  String get messageSize => 'Dimensiune';

  @override
  String get messageExpiresAt => 'Expira la';

  @override
  String get messageEncrypted => 'Criptat end-to-end';

  @override
  String get messageStatusSending => 'Se trimite...';

  @override
  String get messageStatusSent => 'Trimis';

  @override
  String get messageStatusDelivered => 'Livrat';

  @override
  String get messageStatusRead => 'Citit';

  @override
  String get messageStatusFailed => 'Esuat';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'In asteptare livrare';

  @override
  String get deletedFromServer => 'Sters';

  @override
  String get messageTypeText => 'Text';

  @override
  String get messageTypeImage => 'Imagine';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Voce';

  @override
  String get messageTypeFile => 'Fisier';

  @override
  String get indefinitely => 'Nedefinit';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'ore';

  @override
  String get minutes => 'minute';

  @override
  String get seconds => 'secunde';

  @override
  String get ephemeralMessages => 'Mesaje efemere';

  @override
  String get ephemeralMessagesDescription =>
      'Mesajele sunt sterse automat dupa acest timp';

  @override
  String get ephemeralImmediate => 'Imediat (dupa citire)';

  @override
  String get ephemeralImmediateDesc => 'Sterse imediat ce sunt citite';

  @override
  String get ephemeralMyPreference => 'Preferinta mea';

  @override
  String get ephemeralMyPreferenceDesc => 'Foloseste setarea globala';

  @override
  String get ephemeralDefaultSetting => 'Durata mesajului';

  @override
  String get ephemeralChooseDefault => 'Recomandat';

  @override
  String get ephemeral30Seconds => '30 secunde';

  @override
  String get ephemeral30SecondsDesc => 'Șters 30s după citire';

  @override
  String get ephemeral5Minutes => '5 minute';

  @override
  String get ephemeral5MinutesDesc => 'Șters 5min după citire';

  @override
  String get ephemeral1Hour => '1 ora';

  @override
  String get ephemeral1HourDesc => 'Șters 1h după citire';

  @override
  String get ephemeral3Hours => '3 ore';

  @override
  String get ephemeral6Hours => '6 ore';

  @override
  String get ephemeral6HoursDesc => 'Șters 6h după citire';

  @override
  String get ephemeral12Hours => '12 ore';

  @override
  String get ephemeral24Hours => '24 ore';

  @override
  String get ephemeral24HoursDesc => 'Șters 24h după citire';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Durata personalizata';

  @override
  String get howItWorks => 'Cum functioneaza';

  @override
  String get ephemeralExplanation1 =>
      'Mesajele sunt sterse de pe server imediat ce sunt primite.';

  @override
  String get ephemeralExplanation2 =>
      'Aceasta setare defineste cand mesajele dispar de pe telefonul TAU dupa citire.';

  @override
  String get ephemeralExplanation3 =>
      'Contactul tau are propria setare pentru telefonul sau.';

  @override
  String get mute1Hour => '1 ora';

  @override
  String get mute8Hours => '8 ore';

  @override
  String get mute1Day => '1 zi';

  @override
  String get mute1Week => '1 saptamana';

  @override
  String get muteAlways => 'Intotdeauna';

  @override
  String get muteExplanation => 'Nu vei primi notificari pentru acest contact';

  @override
  String get showCallsInRecents => 'Afișare în apeluri recente';

  @override
  String get showCallsInRecentsSubtitle =>
      'Apelurile Hash apar în istoricul telefonului';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Dezactiveaza notificarile';

  @override
  String get muteDescription => 'Nu vei primi notificari pentru acest contact';

  @override
  String mutedUntil(String time) {
    return 'Dezactivat pana la $time';
  }

  @override
  String get notMuted => 'Notificari activate';

  @override
  String get unmute => 'Reactiveaza';

  @override
  String get notificationSound => 'Sunet notificare';

  @override
  String get defaultSound => 'Implicit';

  @override
  String get chatSettings => 'Setari conversatie';

  @override
  String get bubbleColor => 'Culoare balon';

  @override
  String get backgroundColor => 'Culoare fundal';

  @override
  String get backgroundImage => 'Imagine fundal';

  @override
  String get chatBackground => 'Fundal conversatie';

  @override
  String get customColor => 'Personalizat';

  @override
  String get defaultColor => 'Implicit';

  @override
  String get imageSelected => 'Imagine selectata';

  @override
  String get noImage => 'Nicio imagine';

  @override
  String get color => 'Culoare';

  @override
  String get image => 'Imagine';

  @override
  String get tapToSelectImage => 'Atinge pentru a selecta o imagine';

  @override
  String get changeImage => 'Schimba imaginea';

  @override
  String get previewMessageReceived => 'Salut!';

  @override
  String get previewMessageSent => 'Buna!';

  @override
  String get messageAction => 'Mesaj';

  @override
  String get callAction => 'Apel';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Notite personale';

  @override
  String get addNotes => 'Adauga notite...';

  @override
  String get noNotes => 'Nicio notita';

  @override
  String get messageNotifications => 'Notificari mesaje';

  @override
  String get callNotifications => 'Notificari apeluri';

  @override
  String get useGradient => 'Foloseste gradient';

  @override
  String get gradientStart => 'Culoare de start';

  @override
  String get gradientEnd => 'Culoare de final';

  @override
  String get preview => 'Previzualizare';

  @override
  String get reset => 'Reseteaza';

  @override
  String get securityNumber => 'Numar de securitate';

  @override
  String securityNumberDescription(String name) {
    return 'Verifica ca numarul de securitate se potriveste cu dispozitivul lui $name';
  }

  @override
  String get verifyEncryption => 'Verifica criptarea end-to-end';

  @override
  String get tapToCopy => 'Atinge pentru a copia';

  @override
  String get howToVerify => 'Cum sa verifici';

  @override
  String get verifyStep1 =>
      'Intalneste-te cu contactul tau personal sau suna-l';

  @override
  String get verifyStep2 =>
      'Compara numerele de securitate sau scaneaza QR code-urile';

  @override
  String get verifyStep3 => 'Daca se potrivesc, conversatia ta este sigura';

  @override
  String get scanToVerify => 'Scaneaza pentru verificare';

  @override
  String get reportSpam => 'Raporteaza spam';

  @override
  String get reportSpamSubtitle => 'Raporteaza acest contact ca spam';

  @override
  String get reportSpamDescription =>
      'Aceasta va raporta anonim acest contact. Identitatea ta nu va fi partajata. Esti sigur?';

  @override
  String get report => 'Raporteaza';

  @override
  String get spamReported => 'Spam raportat';

  @override
  String get reportError =>
      'Raportul nu a putut fi trimis. Te rugam sa incerci din nou.';

  @override
  String get reportRateLimited =>
      'Ai atins numarul maxim de rapoarte pentru azi.';

  @override
  String get blockContact => 'Blocheaza contactul';

  @override
  String get blockContactDescription =>
      'Acest contact nu va mai putea sa iti trimita mesaje sau sa te sune. Nu va fi notificat.';

  @override
  String get unblockContact => 'Deblocheaza contactul';

  @override
  String get unblockContactDescription =>
      'Acest contact va putea din nou sa iti trimita mesaje si sa te sune.';

  @override
  String get contactBlocked => 'Contact blocat';

  @override
  String get contactUnblocked => 'Contact deblocat';

  @override
  String get contactIsBlocked => 'Acest contact este blocat';

  @override
  String get unblock => 'Deblocheaza';

  @override
  String get deleteContactSubtitle => 'Sterge acest contact si conversatia';

  @override
  String get confirmWithPin => 'Confirma cu PIN';

  @override
  String get enterPinToConfirm =>
      'Introdu PIN-ul pentru a confirma aceasta actiune';

  @override
  String get profilePhoto => 'Foto profil';

  @override
  String get takePhoto => 'Fa o fotografie';

  @override
  String get chooseFromGallery => 'Alege din galerie';

  @override
  String get removePhoto => 'Sterge fotografia';

  @override
  String get viewContactHashId => 'Vezi identificatorul contactului';

  @override
  String get hashIdPartiallyMasked =>
      'Partial mascat pentru securitatea ta si confidentialitatea contactului';

  @override
  String get addFirstContact => 'Adauga primul tau contact';

  @override
  String get addFirstContactSubtitle =>
      'Distribuie QR code-ul tau sau scaneaza-l pe al unui prieten';

  @override
  String get directory => 'Director';

  @override
  String get noContacts => 'Niciun contact';

  @override
  String get noContactsSubtitle => 'Adauga un contact pentru a incepe';

  @override
  String get sendMessageAction => 'Trimite un mesaj';

  @override
  String get audioCall => 'Apel audio';

  @override
  String get videoCall => 'Apel video';

  @override
  String get viewProfile => 'Vezi profilul';

  @override
  String get deleteContactDirectory => 'Sterge contactul';

  @override
  String get scanShort => 'Scaneaza';

  @override
  String get addShort => 'Adauga';

  @override
  String deleteContactConfirmName(String name) {
    return 'Esti sigur ca vrei sa stergi pe $name?';
  }

  @override
  String get noNotesTitle => 'Nicio notita';

  @override
  String get noNotesSubtitle => 'Creeaza prima ta notita';

  @override
  String get newNote => 'Notita noua';

  @override
  String get editNote => 'Editeaza notita';

  @override
  String get deleteNote => 'Sterge notita';

  @override
  String get deleteNoteConfirm =>
      'Esti sigur ca vrei sa stergi aceasta notita?';

  @override
  String get noteTitle => 'Titlu';

  @override
  String get noteContent => 'Continut';

  @override
  String get addItem => 'Adauga element';

  @override
  String get pinNote => 'Fixeaza';

  @override
  String get unpinNote => 'Defixeaza';

  @override
  String get noteColor => 'Culoare';

  @override
  String get notePassword => 'Parola';

  @override
  String get setPassword => 'Seteaza parola';

  @override
  String get changePassword => 'Schimba parola';

  @override
  String get removePassword => 'Sterge parola';

  @override
  String get enterPassword => 'Introdu parola';

  @override
  String get confirmPassword => 'Confirma parola';

  @override
  String get passwordPin => 'Cod PIN';

  @override
  String get passwordText => 'Parola text';

  @override
  String get protectedNote => 'Notita protejata';

  @override
  String get incorrectPassword => 'Parola incorecta';

  @override
  String get passwordSet => 'Parola setata';

  @override
  String get passwordRemoved => 'Parola stearsa';

  @override
  String get notesBiometric => 'Face ID pentru notite';

  @override
  String get notesBiometricSubtitle =>
      'Necesita autentificare biometrica pentru a deschide notitele protejate';

  @override
  String get textNote => 'Notita text';

  @override
  String get checklistNote => 'Lista de verificare';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total sarcini';
  }

  @override
  String get autoSaved => 'Salvat';

  @override
  String get searchNotes => 'Cauta notite';

  @override
  String get legalConsent => 'Consimtamant legal';

  @override
  String get confirmAge13 => 'Confirm ca am cel putin 13 ani';

  @override
  String get acceptLegalStart => 'Accept ';

  @override
  String get privacyPolicy => 'Politica de confidentialitate';

  @override
  String get termsOfService => 'Termeni si conditii';

  @override
  String get andThe => ' si ';

  @override
  String get continueButton => 'Continua';

  @override
  String get mustAcceptTerms =>
      'Trebuie sa accepti ambele conditii pentru a continua';

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
  String get support => 'Suport';

  @override
  String get contactSupport => 'Contacteaza suportul';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Raporteaza abuz';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Legal';

  @override
  String get legalEntity => 'Entitate juridica';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Fixeaza';

  @override
  String get unpinConversation => 'Defixeaza';

  @override
  String get hideConversation => 'Sterge din flux';

  @override
  String get deleteConversation => 'Sterge conversatia';

  @override
  String get deleteConversationConfirm =>
      'Introdu PIN-ul pentru a confirma stergerea tuturor mesajelor';

  @override
  String get noConversations => 'Nicio conversatie inca';

  @override
  String get startConversation => 'Incepe';

  @override
  String get microphonePermissionRequired => 'Acces la microfon necesar';

  @override
  String get microphonePermissionExplanation =>
      'Hash are nevoie de microfon pentru a efectua apeluri.';

  @override
  String get cameraPermissionExplanation =>
      'Hash are nevoie de camera pentru apeluri video.';

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
  String get openSettings => 'Deschide Setarile';

  @override
  String get callConnecting => 'Se conecteaza...';

  @override
  String get callRinging => 'Suna...';

  @override
  String get callReconnecting => 'Se reconecteaza...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Se reconecteaza (${seconds}s)';
  }

  @override
  String get callPaused => 'Pauză';

  @override
  String get callPausedSubtitle => 'Apelul este încă activ';

  @override
  String get callRemoteMicMuted => 'Microfonul contactului este dezactivat';

  @override
  String get callMiniControlsMute => 'Dezactiveaza';

  @override
  String get callMiniControlsUnmute => 'Activeaza';

  @override
  String get callMiniControlsHangUp => 'Inchide';

  @override
  String get callMiniControlsReturn => 'Inapoi la apel';

  @override
  String get callNetworkPoor => 'Conexiune instabila';

  @override
  String get callNetworkLost => 'Conexiune pierduta';

  @override
  String get callEndedTitle => 'Apel incheiat';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Datele dispozitivului';

  @override
  String get deviceDataSubtitle => 'Stocare locala si pe server';

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
  String get localStorage => 'Stocare locala';

  @override
  String get onThisDevice => 'pe acest dispozitiv';

  @override
  String get encryptedDatabases => 'Baze de date criptate';

  @override
  String get files => 'Fisiere';

  @override
  String get secureKeychain => 'Breloc securizat';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Nume, avatare, chei Signal';

  @override
  String get messagesDetail => 'Conversatii criptate';

  @override
  String get notesDetail => 'Notite personale';

  @override
  String get signalSessions => 'Sesiuni Signal';

  @override
  String get signalSessionsDetail => 'Sesiuni de criptare';

  @override
  String get pendingContacts => 'Contacte in asteptare';

  @override
  String get pendingContactsDetail => 'Cereri in asteptare';

  @override
  String get callHistory => 'Apeluri';

  @override
  String get callHistoryDetail => 'Istoric apeluri';

  @override
  String get preferences => 'Preferinte';

  @override
  String get preferencesDetail => 'Preferinte media si apeluri';

  @override
  String get avatars => 'Avatare';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fisiere',
      one: '1 fisier',
      zero: 'niciun fisier',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Activ';

  @override
  String get notDefined => 'Nedefinit';

  @override
  String get biometrics => 'Biometrie';

  @override
  String get recoveryPhrase => 'Fraza de recuperare';

  @override
  String get identity => 'Identitate (Hash ID)';

  @override
  String get signalKeys => 'Chei Signal Protocol';

  @override
  String get authTokens => 'Token-uri de autentificare';

  @override
  String get contactNamesCache => 'Cache nume contacte';

  @override
  String get remoteConfig => 'Configurare la distanta';

  @override
  String get notificationPrefs => 'Preferinte notificari';

  @override
  String get serverData => 'Date server';

  @override
  String get serverDataInfo =>
      'Hash pastreaza date minime pe server, toate criptate sau temporare.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, chei publice, token mailbox';

  @override
  String get serverPrekeys => 'Pre-chei';

  @override
  String get serverPrekeysDetail =>
      'Chei Signal de unica folosinta (consumate)';

  @override
  String get serverMessages => 'Mesaje in tranzit';

  @override
  String get serverMessagesDetail => 'Sterse dupa livrare (max 24h)';

  @override
  String get serverMedia => 'Media in tranzit';

  @override
  String get serverMediaDetail => 'Sterse dupa descarcare';

  @override
  String get serverContactRequests => 'Cereri de contact';

  @override
  String get serverContactRequestsDetail => 'Expira dupa 24h';

  @override
  String get serverRateLimits => 'Limite de rata';

  @override
  String get serverRateLimitsDetail => 'Date temporare anti-abuz';

  @override
  String get privacyReassurance =>
      'Hash nu poate citi mesajele tale. Toate datele sunt criptate end-to-end. Datele de pe server sunt sterse automat.';

  @override
  String get pinTooSimple =>
      'Acest PIN este prea simplu. Alege un cod mai sigur.';

  @override
  String get genericError => 'A aparut o eroare. Te rugam sa incerci din nou.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nu s-a putut crea contul: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraza copiata in clipboard';

  @override
  String get copyPhrase => 'Copiaza fraza';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Noteaza aceasta fraza intr-un loc sigur. Daca pierzi PIN-ul fara aceasta fraza, vei pierde permanent accesul la datele tale.';

  @override
  String get noMessages => 'Niciun mesaj';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Stergi toate mesajele cu $name?';
  }

  @override
  String get confirmation => 'Confirmare';

  @override
  String get untitled => 'Fara titlu';

  @override
  String get noSessions => 'Nicio sesiune';

  @override
  String get unknownContact => 'Contact necunoscut';

  @override
  String get unnamed => 'Fara nume';

  @override
  String get noPendingRequestsAlt => 'Nicio cerere in asteptare';

  @override
  String get deleteAllCallHistory => 'Stergi tot istoricul apelurilor?';

  @override
  String get noCalls => 'Niciun apel';

  @override
  String get noPreferences => 'Nicio preferinta';

  @override
  String get resetAllMediaPrefs => 'Resetezi toate preferintele media?';

  @override
  String get deleteThisAvatar => 'Stergi acest avatar?';

  @override
  String get deleteAllAvatars => 'Stergi toate avatarele?';

  @override
  String get noAvatars => 'Niciun avatar';

  @override
  String get deleteThisFile => 'Stergi acest fisier?';

  @override
  String get deleteAllMediaFiles => 'Stergi toate fisierele media?';

  @override
  String get noMediaFiles => 'Niciun fisier media';

  @override
  String get outgoing => 'De iesire';

  @override
  String get incoming => 'De intrare';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Vizualizare efemera: ${seconds}s';
  }

  @override
  String get normalView => 'Vizualizare normala';

  @override
  String get callReasonCompleted => 'Finalizat';

  @override
  String get callReasonMissed => 'Pierdut';

  @override
  String get callReasonDeclined => 'Respins';

  @override
  String get callReasonFailed => 'Esuat';

  @override
  String get justNow => 'Chiar acum';

  @override
  String timeAgoMinutes(int count) {
    return 'acum $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'acum ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'acum ${count}z';
  }

  @override
  String get messageTypeContact => 'Contact';

  @override
  String get messageTypeLocation => 'Locatie';

  @override
  String get statusQueued => 'In coada';

  @override
  String get blockedBadge => 'Blocat';

  @override
  String get protectedBadge => 'Protejat';

  @override
  String messageCount(int count) {
    return '$count mesaj(e)';
  }

  @override
  String get deleteQuestion => 'Stergi?';

  @override
  String get transferMyAccountTitle => 'Transfera contul meu';

  @override
  String get loadingError => 'Eroare de incarcare';

  @override
  String get transferToNewDevice => 'Transfera pe un dispozitiv nou';

  @override
  String get transferInstructions =>
      'Pe noul dispozitiv, alege \"Recupereaza contul meu\" si introdu aceste informatii:';

  @override
  String get yourHashIdLabel => 'Hash ID-ul tau';

  @override
  String get enterYourPinCode => 'Introdu codul tau PIN';

  @override
  String get pinOwnerConfirmation =>
      'Pentru a confirma ca esti proprietarul acestui cont';

  @override
  String get scanThisQrCode => 'Scaneaza acest QR code';

  @override
  String get withYourNewDevice => 'Cu noul tau dispozitiv';

  @override
  String get orEnterTheCode => 'sau introdu codul';

  @override
  String get transferCodeLabel => 'Cod de transfer';

  @override
  String get proximityVerification => 'Verificare de proximitate';

  @override
  String get bringDevicesCloser => 'Apropie ambele dispozitive';

  @override
  String get confirmTransferQuestion => 'Confirmi transferul?';

  @override
  String get accountWillBeTransferred =>
      'Contul tau va fi transferat pe noul dispozitiv.\n\nAcest dispozitiv va fi deconectat permanent.';

  @override
  String get transferComplete => 'Transfer complet';

  @override
  String get transferSuccessMessage =>
      'Contul tau a fost transferat cu succes.\n\nAceasta aplicatie se va inchide acum.';

  @override
  String get manualVerification => 'Verificare manuala';

  @override
  String get codeDisplayedOnBothDevices =>
      'Codul afisat pe ambele dispozitive:';

  @override
  String get doesCodeMatchNewDevice =>
      'Se potriveste acest cod cu cel de pe noul dispozitiv?';

  @override
  String get verifiedStatus => 'Verificat';

  @override
  String get inProgressStatus => 'In progres...';

  @override
  String get notAvailableStatus => 'Indisponibil';

  @override
  String get codeExpiredRestart =>
      'Codul a expirat. Te rugam sa reiei procesul.';

  @override
  String get codesDoNotMatchCancelled =>
      'Codurile nu se potrivesc. Transfer anulat.';

  @override
  String transferToDevice(String device) {
    return 'Catre: $device';
  }

  @override
  String get copiedExclamation => 'Copiat!';

  @override
  String expiresInTime(String time) {
    return 'Expira in $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometria nu este disponibila pe acest dispozitiv';

  @override
  String get biometricAuthError => 'Eroare in timpul autentificarii biometrice';

  @override
  String get authenticateForBiometric =>
      'Te rugam sa te autentifici pentru a activa biometria';

  @override
  String get biometricAuthFailed => 'Autentificarea biometrica a esuat';

  @override
  String get forceUpdateTitle => 'Actualizare necesara';

  @override
  String get forceUpdateMessage =>
      'O noua versiune Hash este disponibila. Te rugam sa actualizezi pentru a continua.';

  @override
  String get updateButton => 'Actualizeaza';

  @override
  String get maintenanceInProgress => 'Mentenanta in desfasurare';

  @override
  String get tryAgainLater => 'Te rugam sa incerci mai tarziu';

  @override
  String get information => 'Informatii';

  @override
  String get later => 'Mai târziu';

  @override
  String get doYouLikeHash => 'Vă place Hash?';

  @override
  String get yourFeedbackHelps =>
      'Feedback-ul dvs. ne ajută să îmbunătățim aplicația';

  @override
  String get ratingTerrible => 'Groaznic';

  @override
  String get ratingBad => 'Rău';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Bine';

  @override
  String get ratingExcellent => 'Excelent!';

  @override
  String get donationMessage =>
      'Hash este un proiect non-profit. Sprijinul dvs. ne ajută să continuăm să construim un messenger cu adevărat privat.';

  @override
  String get recentConnections => 'Conexiuni recente';

  @override
  String get loginInfoText =>
      'Fiecare deblocare prin PIN este înregistrată local. Doar ultimele 24 de ore sunt păstrate.';

  @override
  String get connectionCount => 'Conexiune(i)';

  @override
  String get periodLabel => 'Perioadă';

  @override
  String get historyLabel => 'Istoric';

  @override
  String get noLoginRecorded => 'Nicio conectare inregistrata';

  @override
  String get nextUnlocksAppearHere => 'Urmatoarele deblocari vor aparea aici.';

  @override
  String get dataLocalOnly =>
      'Aceste date sunt stocate doar pe dispozitivul dvs. și nu sunt niciodată transmise.';

  @override
  String get currentSession => 'Curentă';

  @override
  String get todayLabel => 'Astăzi';

  @override
  String get yesterdayLabel => 'Ieri';

  @override
  String get justNowLabel => 'Chiar acum';

  @override
  String minutesAgoLabel(int count) {
    return 'Acum $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Acum ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Acum ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Nicio mentenanta planificata';

  @override
  String get everythingWorkingNormally => 'Totul functioneaza normal';

  @override
  String get maintenanceTitle => 'Mentenanță';

  @override
  String get maintenanceActiveLabel => 'ÎN CURS';

  @override
  String get maintenancePlannedLabel => 'PLANIFICATĂ';

  @override
  String get locking => 'Se blocheaza...';

  @override
  String get newMessageNotification => 'Mesaj nou';

  @override
  String get secExplainTitle => 'Cum te protejeaza Hash';

  @override
  String get secExplainIntro =>
      'Hash este conceput astfel incat nimeni sa nu iti poata citi mesajele.';

  @override
  String get secExplainIntroSub =>
      'Nici macar noi.\nIata cum functioneaza, explicat simplu.';

  @override
  String get secJourneyLabel => 'CALATORIA';

  @override
  String get secJourneyTitle => 'Calatoria mesajului tau';

  @override
  String get secJourneySubtitle =>
      'De la degetul tau la ecranul contactului, fiecare pas este protejat. Urmareste traseul.';

  @override
  String get secStep1Title => 'Scrii mesajul';

  @override
  String get secStep1Desc =>
      'Tastezi \"Salut!\" in aplicatie. In acest moment, mesajul exista doar in memoria telefonului. Nimic nu a fost trimis.';

  @override
  String get secStep2Title => 'Criptare cu Signal Protocol';

  @override
  String get secStep2Desc =>
      'Imediat ce apesi \"Trimite\", mesajul este transformat intr-un sir de caractere incomprehensibil. E ca si cum mesajul tau ar fi inchis intr-un seif pe care doar contactul tau il poate deschide.';

  @override
  String get secStep3Title => 'Sealed Sender: plicul invizibil';

  @override
  String get secStep3Desc =>
      'Imagineaza-ti ca trimiti o scrisoare prin posta, dar fara adresa expeditorului pe plic. Exact asta face Hash. Mesajul este depus intr-o cutie postala anonima. Serverul nu stie cine l-a trimis.';

  @override
  String get secStep4Title => 'Serverul nu vede nimic';

  @override
  String get secStep4Desc =>
      'Serverul actioneaza ca un postas orb. Stie doar ca \"cineva a depus ceva in cutia postala #A7X9\". Nu stie cine l-a trimis, ce este sau pentru cine este.';

  @override
  String get secStep4Highlight =>
      'Niciun metadat stocat: nicio adresa IP, niciun marcaj temporal, nicio legatura intre expeditor si destinatar.';

  @override
  String get secStep5Title => 'Contactul tau primeste mesajul';

  @override
  String get secStep5Desc =>
      'Telefonul contactului preia continutul din cutia postala anonima si decripteaza mesajul cu cheia lor privata, care nu a parasit niciodata dispozitivul lor. \"Salut!\" apare pe ecran.';

  @override
  String get secStep6Title => 'Mesajul dispare de pe server';

  @override
  String get secStep6Desc =>
      'Imediat ce contactul confirma receptia, serverul sterge permanent mesajul. Niciun cos de gunoi, nicio arhiva, nicio copie de rezerva. Chiar si mesajele necitite sunt distruse automat dupa 24 de ore.';

  @override
  String get secStep7Title => 'Expirare locala';

  @override
  String get secStep7Desc =>
      'Pe telefonul contactului, mesajul se autodistruge conform duratei alese: imediat dupa citire, 5 minute, 1 ora... tu decizi.';

  @override
  String get secJourneyConclusion =>
      'Rezultat: zero urme pe server, zero urme pe dispozitive. Mesajul a existat doar cat a fost nevoie sa fie citit, apoi a disparut.';

  @override
  String get secArchLabel => 'ARHITECTURA';

  @override
  String get secArchTitle => '5 straturi de protectie';

  @override
  String get secArchSubtitle =>
      'Hash nu se bazeaza pe o singura tehnologie. Fiecare strat il intareste pe celelalte. Chiar daca un strat este compromis, datele tale raman in siguranta.';

  @override
  String get secLayer1Title => 'Criptare end-to-end';

  @override
  String get secLayer1Desc =>
      'Fiecare mesaj este criptat cu o cheie unica. Pe scurt: chiar daca cineva decripteaza un mesaj, nu va putea sa il decripteze pe urmatorul. Fiecare mesaj are propria incuietoare.';

  @override
  String get secLayer1Detail =>
      'Pentru fisiere (fotografii, videoclipuri, documente), Hash foloseste criptare suplimentara AES-256-GCM. Fisierul este criptat inainte sa paraseasca telefonul.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimitate retea)';

  @override
  String get secLayer2Desc =>
      'Mesagerii obisnuiti trimit mesajele cu identitatea ta atasata. E ca si cum ti-ai scrie numele pe plic. Hash foloseste cutii postale anonime: serverul livreaza mesajul fara sa stie cine l-a trimis.';

  @override
  String get secLayer2Detail =>
      'Rezultat: chiar si in cazul unei brese de date pe server, este imposibil sa se reconstructeasca cine vorbeste cu cine.';

  @override
  String get secLayer3Title => 'Stergere automata';

  @override
  String get secLayer3Desc =>
      'Mesajele sunt sterse de pe server imediat ce receptia este confirmata. Chiar daca un mesaj nu este niciodata preluat, este distrus automat dupa 24 de ore.';

  @override
  String get secLayer3Detail =>
      'Pe telefon, mesajele se autodistrug conform duratei alese: imediat, 5 min, 15 min, 30 min, 1h, 3h, 6h sau 12h.';

  @override
  String get secLayer4Title => 'Protectie acces local';

  @override
  String get secLayer4Desc =>
      'Aplicatia este protejata printr-un PIN de 6 cifre si/sau biometrie (Face ID, amprenta). Dupa prea multe incercari esuate, aplicatia se blocheaza cu o intarziere crescatoare.';

  @override
  String get secLayer5Title => 'Baza de date blocata';

  @override
  String get secLayer5Desc =>
      'Pe partea de server, niciun utilizator nu poate scrie direct in baza de date. Toate actiunile trec prin functii securizate care verifica fiecare cerere.';

  @override
  String get secLayer5Detail =>
      'E ca un ghiseu de banca: nu atingi niciodata seiful tu insuti. Faci o cerere, iar sistemul verifica daca ai dreptul inainte de a actiona.';

  @override
  String get secVashLabel => 'UNIC IN LUME';

  @override
  String get secVashTitle => 'Mod Vash';

  @override
  String get secVashSubtitle =>
      'Un sistem de securitate de urgenta care nu exista in nicio alta aplicatie de mesagerie.';

  @override
  String get secVashScenarioTitle => 'Imagineaza-ti aceasta situatie';

  @override
  String get secVashScenario1 => 'Cineva acceseaza telefonul tau';

  @override
  String get secVashScenario2 => 'Ti se cere codul PIN';

  @override
  String get secVashScenario3 => 'Vrei sa stergi urgent toate datele';

  @override
  String get secVashSolutionTitle => 'Solutia: doua coduri PIN';

  @override
  String get secVashSolutionDesc =>
      'Configurezi doua coduri PIN diferite in Hash:';

  @override
  String get secVashNormalCodeLabel => 'Codul normal';

  @override
  String get secVashNormalCodeDesc =>
      'Deschide aplicatia normal cu toate datele tale';

  @override
  String get secVashCodeLabel2 => 'Codul Vash';

  @override
  String get secVashCodeDescription =>
      'Deschide aplicatia normal... dar toate datele tale sunt sterse silentios in fundal';

  @override
  String get secVashWhatHappensTitle => 'Ce se intampla apoi';

  @override
  String get secVashWhatHappensDesc =>
      'Aplicatia se deschide normal. Nicio alerta, nicio animatie suspecta. Ecranul arata pur si simplu o aplicatie goala, ca si cum ai instala-o.\n\nIn realitate, toate conversatiile, contactele si mesajele tale au fost sterse ireversibil intr-o fractiune de secunda.';

  @override
  String get secCallsLabel => 'APELURI SI FISIERE';

  @override
  String get secCallsTitle => 'Totul este criptat';

  @override
  String get secCallsSubtitle =>
      'Nu doar mesajele. Absolut tot ce trece prin Hash este criptat end-to-end.';

  @override
  String get secAudioCallTitle => 'Apeluri audio';

  @override
  String get secAudioCallDesc =>
      'Criptate end-to-end prin WebRTC. Vocea este transmisa direct intre dispozitive.';

  @override
  String get secVideoCallTitle => 'Apeluri video';

  @override
  String get secVideoCallDesc =>
      'Aceeasi tehnologie, fiecare flux criptat individual.';

  @override
  String get secPhotosTitle => 'Fotografii si videoclipuri';

  @override
  String get secPhotosDesc =>
      'Criptate in AES-256-GCM inainte de a parasi telefonul.';

  @override
  String get secDocsTitle => 'Documente';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, orice fisier. Numele, dimensiunea si continutul sunt criptate.';

  @override
  String get secAnonLabel => 'ANONIMAT';

  @override
  String get secAnonTitle => 'Nicio identitate necesara';

  @override
  String get secAnonSubtitle =>
      'Hash nu iti cere niciodata numarul de telefon sau emailul. Esti identificat printr-un Hash ID unic si anonim.';

  @override
  String get secHashIdTitle => 'Hash ID-ul tau';

  @override
  String get secHashIdDesc =>
      'Acesta este identificatorul tau unic. Nu dezvaluie nimic despre tine: nici numele, nici numarul, nici locatia. E ca un pseudonim imposibil de legat de identitatea ta reala.\n\nPentru a adauga un contact, distribui Hash ID-ul sau scanezi un QR code. Atat. Niciun caiet de adrese sincronizat, nicio sugestie \"Persoane pe care le-ai putea cunoaste\".';

  @override
  String get secDataLabel => 'DATE';

  @override
  String get secDataTitle => 'Ce nu stie Hash';

  @override
  String get secDataSubtitle =>
      'Cel mai bun mod de a proteja datele tale este sa nu le colectam.';

  @override
  String get secNeverCollected => 'Niciodata colectate';

  @override
  String get secNeverItem1 => 'Continutul mesajelor';

  @override
  String get secNeverItem2 => 'Lista de contacte';

  @override
  String get secNeverItem3 => 'Numarul de telefon';

  @override
  String get secNeverItem4 => 'Adresa de email';

  @override
  String get secNeverItem5 => 'Adresa IP';

  @override
  String get secNeverItem6 => 'Locatia';

  @override
  String get secNeverItem7 => 'Metadate (cine vorbeste cu cine)';

  @override
  String get secNeverItem8 => 'Istoricul apelurilor';

  @override
  String get secNeverItem9 => 'Agenda de contacte';

  @override
  String get secNeverItem10 => 'Identificatori publicitari';

  @override
  String get secTempStored => 'Stocate temporar';

  @override
  String get secTempItem1 => 'Hash ID anonim (identificator unic)';

  @override
  String get secTempItem2 => 'Chei publice de criptare';

  @override
  String get secTempItem3 => 'Mesaje criptate in tranzit (max 24h)';

  @override
  String get secTempNote =>
      'Chiar si aceste date minime nu te pot identifica. Hash ID-ul tau nu este legat de nicio informatie personala.';

  @override
  String get secFooterTitle => 'Confidentialitatea ta, libertatea ta';

  @override
  String get secFooterDesc =>
      'Hash foloseste aceleasi tehnologii de criptare ca cele mai exigente aplicatii profesionale. Mesajele tale sunt protejate prin matematica, nu prin promisiuni.';

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
