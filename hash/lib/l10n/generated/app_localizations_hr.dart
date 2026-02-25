// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Nula tragova. Nula kompromisa.';

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
  String get conversations => 'Razgovori';

  @override
  String get contacts => 'Kontakti';

  @override
  String get noConversation => 'Nema razgovora';

  @override
  String get noConversationSubtitle =>
      'Dodajte kontakt za sigurnu komunikaciju';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zahtjeva na cekanju',
      one: '1 zahtjev na cekanju',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poslanih zahtjeva na cekanju',
      one: '1 poslani zahtjev na cekanju',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Dodaj kontakt';

  @override
  String get shareApp => 'Podijeli aplikaciju';

  @override
  String get newMessage => 'Nova poruka';

  @override
  String get newConversation => 'Posalji poruku';

  @override
  String get settings => 'Postavke';

  @override
  String get myHashId => 'Moj Hash ID';

  @override
  String get supportHash => 'Podrzi Hash';

  @override
  String get supportHashSubtitle => 'Hash je neprofitni projekt';

  @override
  String get donate => 'Doniraj';

  @override
  String get appearance => 'Izgled';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatski';

  @override
  String get themeAutoSubtitle => 'Prati postavke sustava';

  @override
  String get themeDark => 'Tamna';

  @override
  String get themeLight => 'Svijetla';

  @override
  String get themeRecommendation =>
      'Tamna tema se preporucuje za bolju privatnost';

  @override
  String get language => 'Jezik';

  @override
  String get languageAuto => 'Automatski (sustav)';

  @override
  String get notifications => 'Obavijesti';

  @override
  String get messages => 'Poruke';

  @override
  String get calls => 'Pozivi';

  @override
  String get vibration => 'Vibracija';

  @override
  String get notificationContent => 'Sadrzaj obavijesti';

  @override
  String get notificationContentFull => 'Prikazi sve';

  @override
  String get notificationContentFullDesc => 'Ime kontakta i pregled poruke';

  @override
  String get notificationContentName => 'Samo ime';

  @override
  String get notificationContentNameDesc => 'Prikazuje samo ime kontakta';

  @override
  String get notificationContentDiscrete => 'Diskretno';

  @override
  String get notificationContentDiscreteDesc =>
      'Prikazuje samo \"Nova poruka\"';

  @override
  String get security => 'Sigurnost';

  @override
  String get howHashProtectsYou => 'Kako vas Hash stiti';

  @override
  String get howHashProtectsYouSubtitle => 'Razumite svoju sigurnost';

  @override
  String get accountSecurity => 'Sigurnost racuna';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrija, Vash nacin';

  @override
  String get blockScreenshots => 'Blokiraj snimke zaslona';

  @override
  String get transferDevice => 'Prijenos na drugi uredaj';

  @override
  String get transferDeviceSubtitle => 'Migrirajte svoj racun';

  @override
  String get pinCode => 'PIN kod';

  @override
  String get changePin => 'Promijeni PIN kod';

  @override
  String get currentPin => 'Trenutni PIN kod';

  @override
  String get newPin => 'Novi PIN kod';

  @override
  String get confirmPin => 'Potvrdi PIN kod';

  @override
  String get pinChanged => 'PIN kod promijenjen';

  @override
  String get incorrectPin => 'Netocni PIN';

  @override
  String get pinsDoNotMatch => 'PIN-ovi se ne podudaraju';

  @override
  String get autoLock => 'Automatsko zakljucavanje';

  @override
  String get autoLockDelay => 'Odgoda zakljucavanja';

  @override
  String get autoLockImmediate => 'Odmah';

  @override
  String get autoLockMinute => '1 minuta';

  @override
  String autoLockMinutes(int count) {
    return '$count minuta';
  }

  @override
  String get vashCode => 'Vash kod';

  @override
  String get vashModeTitle => 'Vash nacin';

  @override
  String get vashModeExplanation => 'Vasa konacna sigurnosna mreza.';

  @override
  String get vashModeDescription =>
      'Odabrat cete drugi PIN kod. Ako vas ikada prisile da otvorite Hash, unesite ovaj kod umjesto obicnog PIN-a.\n\nAplikacija ce se normalno otvoriti, ali svi vasi razgovori i kontakti ce nestati.\n\nSvakome tko gleda u vas zaslon, Hash jednostavno izgleda prazno — kao da ga nikada niste koristili.';

  @override
  String get vashModeIrreversible => 'Ova radnja je tiha i nepovratna.';

  @override
  String get chooseVashCode => 'Odaberi moj Vash kod';

  @override
  String get vashCodeInfo =>
      'Drugi PIN kod koji otvara aplikaciju normalno, ali praznu.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Ako unesete ovaj kod umjesto svog PIN-a:';

  @override
  String get vashDeleteContacts => 'Vasi kontakti nestaju';

  @override
  String get vashDeleteMessages => 'Vasi razgovori nestaju';

  @override
  String get vashDeleteHistory => 'Vase biljeske nestaju';

  @override
  String get vashKeepId => 'Vas Hash identitet (#XXX-XXX-XXX) ostaje isti';

  @override
  String get vashAppearNormal =>
      'Aplikacija izgleda normalno ali prazno, kao nova. Ova radnja je nepovratna.';

  @override
  String get setupVashCode => 'Postavi Vash kod';

  @override
  String get modifyVashCode => 'Izmijeni Vash kod';

  @override
  String get currentVashCode => 'Trenutni Vash kod';

  @override
  String get newVashCode => 'Novi Vash kod';

  @override
  String get confirmVashCode => 'Potvrdi Vash kod';

  @override
  String get vashCodeConfigured => 'Vash kod konfiguriran';

  @override
  String get vashCodeModified => 'Vash kod izmijenjen';

  @override
  String get vashCodeMustDiffer => 'Vash kod mora biti razlicit od PIN-a';

  @override
  String get incorrectVashCode => 'Netocni Vash kod';

  @override
  String get vashWhatToDelete => 'Sto bi Vash nacin trebao uciniti da nestane?';

  @override
  String get vashDeleteContactsOption => 'Kontakti';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Poruke';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Biljeske';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash nacin aktiviran';

  @override
  String get vashCreateSubtitle => 'Odaberite kod razlicit od glavnog PIN-a';

  @override
  String get vashConfirmSubtitle => 'Potvrdite svoj Vash kod';

  @override
  String get pinCodeForEntry => 'PIN kod za ulaz u aplikaciju';

  @override
  String get vashCodeSection => 'Vash nacin';

  @override
  String get biometric => 'Biometrija';

  @override
  String get biometricUnlock => 'Otključaj otiskom prsta ili Face ID-om';

  @override
  String get enableBiometric => 'Omogući biometriju';

  @override
  String get biometricWarningMessage =>
      'Aktiviranjem biometrije nećete moći koristiti Vash kod za ulaz u aplikaciju.\n\nVash kod možete koristiti samo ako biometrija ne uspije (nakon više neuspjelih pokušaja).\n\nJeste li sigurni da želite nastaviti?';

  @override
  String get understood => 'Razumijem';

  @override
  String get shareAppSubtitle => 'Podijelite Hash sa svojim bližnjima';

  @override
  String get share => 'Podijeli';

  @override
  String get danger => 'Opasnost';

  @override
  String get deleteAccount => 'Izbrisi moj racun';

  @override
  String get deleteAccountSubtitle => 'Nepovratna radnja';

  @override
  String get deleteAccountConfirmTitle => 'Izbrisi moj racun';

  @override
  String get deleteAccountConfirmMessage =>
      'Vas racun ce biti trajno izbrisan. Ova radnja je nepovratna.\n\n• Svi vasi razgovori\n• Svi vasi kontakti\n• Vas Hash ID\n\nMorat cete kreirati novi racun.';

  @override
  String get deleteForever => 'Trajno izbrisi';

  @override
  String get cancel => 'Odustani';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash nacin aktiviran.';

  @override
  String deletionError(String error) {
    return 'Greska pri brisanju: $error';
  }

  @override
  String get yourSecurity => 'Vasa sigurnost';

  @override
  String get securityInfo =>
      '• Enkripcija od kraja do kraja (Signal Protocol)\n• Nema podataka na nasim posluziteljima nakon isporuke\n• Kljucevi pohranjeni samo na vasem uredaju\n• PIN kod nikada nije poslan na posluzitelj';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Dobrodosli';

  @override
  String get securityStatement1 => 'Vase poruke su zasticene.';

  @override
  String get securityStatement2 => 'Enkripcija od kraja do kraja.';

  @override
  String get securityStatement3 => 'Bez tragova. Bez kompromisa.';

  @override
  String get securityStatement4 => 'Vasa privatnost je pravo.';

  @override
  String get accessBlocked => 'Pristup blokiran';

  @override
  String get tooManyAttempts => 'Previse pokusaja. Pokusajte ponovno kasnije.';

  @override
  String get pleaseWait => 'Molimo pricekajte';

  @override
  String get waitDelay => 'Molimo pricekajte da istekne odgoda';

  @override
  String attemptCount(int current, int max) {
    return 'Pokusaj $current od $max';
  }

  @override
  String retryIn(String time) {
    return 'Pokusajte ponovno za $time';
  }

  @override
  String get forgotPin => 'Zaboravili ste PIN? Koristite frazu za oporavak';

  @override
  String get useRecoveryPhrase => 'Koristi frazu za oporavak';

  @override
  String get recoveryWarningTitle => 'Upozorenje';

  @override
  String get recoveryWarningMessage => 'Oporavak racuna ce:';

  @override
  String get recoveryDeleteAllMessages => 'Izbrisati SVE vase poruke';

  @override
  String get recoveryWaitDelay => 'Zahtijevati 1-satnu odgodu';

  @override
  String get recoveryKeepContacts => 'Zadrzati vase kontakte';

  @override
  String get recoveryIrreversible =>
      'Ova radnja je nepovratna. Vase poruke ce biti trajno izgubljene.';

  @override
  String get iUnderstand => 'Razumijem';

  @override
  String get accountRecovery => 'Oporavak racuna';

  @override
  String get enterRecoveryPhrase =>
      'Unesite 24 rijeci vase fraze za oporavak, odvojene razmacima.';

  @override
  String get recoveryPhraseHint => 'rijec1 rijec2 rijec3 ...';

  @override
  String get recover => 'Oporavi';

  @override
  String get recoveryPhraseRequired => 'Molimo unesite frazu za oporavak';

  @override
  String get recoveryPhrase24Words => 'Fraza mora sadrzavati tocno 24 rijeci';

  @override
  String get incorrectRecoveryPhrase => 'Netocna fraza za oporavak';

  @override
  String get recoveryInitError => 'Greska pri inicijalizaciji oporavka';

  @override
  String get securityDelay => 'Sigurnosna odgoda';

  @override
  String get securityDelayMessage =>
      'Radi vase sigurnosti, potrebno je razdoblje cekanja prije nego sto mozete kreirati novi PIN.';

  @override
  String get timeRemaining => 'Preostalo vrijeme';

  @override
  String get messagesDeletedForProtection =>
      'Vase poruke su izbrisane radi vase zastite.';

  @override
  String get canCloseApp => 'Mozete zatvoriti aplikaciju i vratiti se kasnije.';

  @override
  String get onboardingTitle1 => 'Dobrodosli u Hash';

  @override
  String get onboardingSubtitle1 => 'Komunikator koji ne ostavlja trag';

  @override
  String get onboardingTitle2 => 'Potpuna enkripcija';

  @override
  String get onboardingSubtitle2 =>
      'Vase poruke su enkriptirane od kraja do kraja pomocu Signal protokola';

  @override
  String get onboardingTitle3 => 'Bez tragova';

  @override
  String get onboardingSubtitle3 =>
      'Poruke se brisu s posluzitelja nakon isporuke';

  @override
  String get onboardingTitle4 => 'Vasa sigurnost';

  @override
  String get onboardingSubtitle4 => 'PIN kod, Vash nacin i fraza za oporavak';

  @override
  String get getStarted => 'Pocnite';

  @override
  String get next => 'Dalje';

  @override
  String get skip => 'Preskoci';

  @override
  String get alreadyHaveAccount => 'Vec imam racun';

  @override
  String get transferMyAccount => 'Prenesi moj racun';

  @override
  String get createPin => 'Kreirajte PIN kod';

  @override
  String get createPinSubtitle =>
      'Ovaj kod ce stititi pristup vasoj aplikaciji';

  @override
  String get confirmYourPin => 'Potvrdite svoj PIN kod';

  @override
  String get confirmPinSubtitle => 'Unesite svoj PIN kod ponovo';

  @override
  String get saveRecoveryPhrase => 'Fraza za oporavak';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Zapisite ovih 24 rijeci redom. One ce vam omoguciti oporavak racuna ako zaboravite PIN.';

  @override
  String get phraseWritten => 'Zapisao/la sam svoju frazu';

  @override
  String get warningRecoveryPhrase =>
      'Ako izgubite ovu frazu i zaboravite PIN, izgubit cete pristup svom racunu.';

  @override
  String get accountTransferred => 'Racun prenesen';

  @override
  String get accountTransferredMessage =>
      'Vas racun je prenesen na drugi uredaj. Ova sesija vise nije vazeca.';

  @override
  String get accountTransferredInfo =>
      'Ako niste pokrenuli ovaj prijenos, vas racun je mozda kompromitiran.';

  @override
  String get logout => 'Odjava';

  @override
  String get transferAccount => 'Prijenos racuna';

  @override
  String get transferAccountInfo =>
      'Prenesite svoj Hash racun na novi uredaj. Vasa trenutna sesija ce biti ponistena.';

  @override
  String get generateTransferCode => 'Generiraj kod za prijenos';

  @override
  String get transferCode => 'Kod za prijenos';

  @override
  String transferCodeExpires(int minutes) {
    return 'Ovaj kod istjece za $minutes minuta';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Unesite ovaj kod na novom uredaju za prijenos racuna.';

  @override
  String get generateNewCode => 'Generiraj novi kod';

  @override
  String get scanQrCode => 'Skeniraj QR code';

  @override
  String get scanQrCodeSubtitle => 'Skenirajte QR code kontakta da ga dodate';

  @override
  String get qrCodeDetected => 'QR code otkriven';

  @override
  String get invalidQrCode => 'Nevazeci QR code';

  @override
  String get cameraPermissionRequired => 'Potrebna dozvola kamere';

  @override
  String get myQrCode => 'Moj QR code';

  @override
  String get myQrCodeSubtitle =>
      'Podijelite ovaj QR code da vas kontakti mogu dodati';

  @override
  String get shareQrCode => 'Podijeli';

  @override
  String get addContactTitle => 'Dodaj kontakt';

  @override
  String get addContactByHashId => 'Unesite Hash ID svog kontakta';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Pretrazi';

  @override
  String get contactNotFound => 'Kontakt nije pronaden';

  @override
  String get contactAlreadyAdded => 'Ovaj kontakt je vec na vasoj listi';

  @override
  String get contactAdded => 'Kontakt dodan';

  @override
  String get myProfile => 'Moj profil';

  @override
  String get myProfileSubtitle =>
      'Podijelite ove informacije da vas drugi mogu dodati';

  @override
  String get temporaryCode => 'Privremeni kod';

  @override
  String temporaryCodeExpires(String time) {
    return 'Istjece za $time';
  }

  @override
  String get codeExpired => 'Kod istekao';

  @override
  String get generateNewCodeButton => 'Novi kod';

  @override
  String get copyHashId => 'Kopiraj ID';

  @override
  String get copyCode => 'Kopiraj kod';

  @override
  String get copiedToClipboard => 'Kopirano';

  @override
  String get showMyQrCode => 'Pokazi moj QR code';

  @override
  String get orDivider => 'ili';

  @override
  String get openScanner => 'Otvori skener';

  @override
  String get addManually => 'Dodaj rucno';

  @override
  String get contactHashIdLabel => 'Hash ID kontakta';

  @override
  String get temporaryCodeLabel => 'Privremeni kod';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Zamolite kontakt da generira kod sa svog profila';

  @override
  String get verifyAndAdd => 'Provjeri i dodaj';

  @override
  String get fillAllFields => 'Molimo ispunite sva polja';

  @override
  String get invalidHashIdFormat => 'Nevazeci format ID-a (npr.: 123-456-ABC)';

  @override
  String get userNotFound => 'Korisnik nije pronaden';

  @override
  String get cannotAddYourself => 'Ne mozete dodati sebe';

  @override
  String get invalidOrExpiredCode => 'Nevazeci ili istekli privremeni kod';

  @override
  String get contactFound => 'Kontakt pronaden!';

  @override
  String get howToCallContact => 'Kako biste ih zeljeli nazvati?';

  @override
  String get contactNameHint => 'Ime kontakta';

  @override
  String get addContactButton => 'Dodaj';

  @override
  String get contactDetails => 'Detalji kontakta';

  @override
  String get contactName => 'Ime kontakta';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Dodano $date';
  }

  @override
  String get deleteContact => 'Izbrisi kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Izbrisati ovaj kontakt?';
  }

  @override
  String get deleteContactMessage =>
      'Ovo ce takoder izbrisati cijeli razgovor.';

  @override
  String get delete => 'Izbrisi';

  @override
  String get typeMessage => 'Upisite poruku...';

  @override
  String get messageSent => 'Poslano';

  @override
  String get messageDelivered => 'Isporuceno';

  @override
  String get messageRead => 'Procitano';

  @override
  String get messageFailed => 'Slanje neuspjesno';

  @override
  String get now => 'Sada';

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
  String get today => 'Danas';

  @override
  String get yesterday => 'Jucer';

  @override
  String dateAtTime(String date, String time) {
    return '$date u $time';
  }

  @override
  String get shareMessage =>
      'Pridruzi mi se na Hash! 🔒\n\nTo je zaista privatan komunikator: potpuna enkripcija, bez tragova na posluziteljima i panicni nacin kad je potrebno.\n\nPreuzmi aplikaciju ovdje 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Greska';

  @override
  String get ok => 'U redu';

  @override
  String get view => 'Prikazi';

  @override
  String get yes => 'Da';

  @override
  String get no => 'Ne';

  @override
  String get save => 'Spremi';

  @override
  String get edit => 'Uredi';

  @override
  String get close => 'Zatvori';

  @override
  String get confirm => 'Potvrdi';

  @override
  String get loading => 'Ucitavanje...';

  @override
  String get retry => 'Pokusaj ponovo';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Zahtjevi na cekanju';

  @override
  String get noPendingRequests => 'Nema zahtjeva na cekanju';

  @override
  String get pendingRequestsSubtitle => 'Ove osobe vas zele dodati';

  @override
  String requestFromUser(String hashId) {
    return 'Zahtjev od $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Istjece za $days dana';
  }

  @override
  String get acceptRequest => 'Prihvati';

  @override
  String get rejectRequest => 'Odbij';

  @override
  String get requestAccepted => 'Zahtjev prihvacen';

  @override
  String get requestRejected => 'Zahtjev odbijen';

  @override
  String get requestSent => 'Zahtjev poslan!';

  @override
  String get requestSentSubtitle =>
      'Vas zahtjev je poslan. Korisnik ga mora prihvatiti prije nego sto mozete razgovarati.';

  @override
  String get requestAlreadyPending => 'Zahtjev je vec na cekanju';

  @override
  String get requestAlreadySentByOther =>
      'Ova osoba vam je vec poslala zahtjev';

  @override
  String get addByHashId => 'Dodaj putem Hash ID-a';

  @override
  String get addByHashIdSubtitle => 'Unesite Hash ID i privremeni kod kontakta';

  @override
  String get enterTemporaryCode => 'Unesite 6-znamenkasti kod';

  @override
  String get sendRequest => 'Posalji zahtjev';

  @override
  String get acceptContactTitle => 'Prihvati kontakt';

  @override
  String get acceptContactSubtitle => 'Mozete im dati prilagodeno ime';

  @override
  String get leaveEmptyForHashId => 'Ostavite prazno za koristenje Hash ID-a';

  @override
  String get firstName => 'Ime';

  @override
  String get lastName => 'Prezime';

  @override
  String get notes => 'Biljeske';

  @override
  String get notesHint => 'Osobne biljeske o ovom kontaktu';

  @override
  String get photoOptional => 'Fotografija (neobavezno)';

  @override
  String get contactNameOptional => 'Ime (neobavezno)';

  @override
  String get notesOptional => 'Biljeske (neobavezno)';

  @override
  String get storedLocally => 'Pohranjeno samo na vasem uredaju';

  @override
  String get encryptedMessageLabel => 'Enkriptirana poruka';

  @override
  String get identityMessageHint => 'Tko ste? Kako se poznajete?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ova poruka ce biti enkriptirana i poslana primatelju';

  @override
  String get sendRequestButton => 'Posalji zahtjev';

  @override
  String get requestExpiresIn24h => 'Zahtjev istjece za 24h ako nije prihvacen';

  @override
  String get theyAlreadySentYouRequest =>
      'Ova osoba vam je vec poslala zahtjev';

  @override
  String get requests => 'Zahtjevi';

  @override
  String get receivedRequests => 'Primljeni';

  @override
  String get sentRequests => 'Poslani';

  @override
  String get noSentRequests => 'Nema poslanih zahtjeva';

  @override
  String get cancelRequest => 'Odustani';

  @override
  String get deleteRequest => 'Izbrisi zahtjev';

  @override
  String get requestCancelled => 'Zahtjev otkazan';

  @override
  String sentTo(String hashId) {
    return 'Poslano na $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Istjece za $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Primljeno prije $time';
  }

  @override
  String get messageFromRequester => 'Poruka od podnositelja zahtjeva';

  @override
  String get copy => 'Kopiraj';

  @override
  String get messageInfo => 'Informacije o poruci';

  @override
  String get messageDirection => 'Smjer';

  @override
  String get messageSentByYou => 'Poslao/la si';

  @override
  String get messageReceived => 'Primljeno';

  @override
  String get messageSentAt => 'Poslano u';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Procitano u';

  @override
  String get messageType => 'Vrsta';

  @override
  String get messageSize => 'Velicina';

  @override
  String get messageExpiresAt => 'Istjece u';

  @override
  String get messageEncrypted => 'Enkriptirano od kraja do kraja';

  @override
  String get messageStatusSending => 'Slanje...';

  @override
  String get messageStatusSent => 'Poslano';

  @override
  String get messageStatusDelivered => 'Isporuceno';

  @override
  String get messageStatusRead => 'Procitano';

  @override
  String get messageStatusFailed => 'Neuspjelo';

  @override
  String get serverStatus => 'Posluzitelj';

  @override
  String get onServer => 'Ceka isporuku';

  @override
  String get deletedFromServer => 'Izbrisano';

  @override
  String get messageTypeText => 'Tekst';

  @override
  String get messageTypeImage => 'Slika';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Glasovna';

  @override
  String get messageTypeFile => 'Datoteka';

  @override
  String get indefinitely => 'Neograniceno';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'sati';

  @override
  String get minutes => 'minuta';

  @override
  String get seconds => 'sekundi';

  @override
  String get ephemeralMessages => 'Privremene poruke';

  @override
  String get ephemeralMessagesDescription =>
      'Poruke se automatski brisu nakon ovog vremena';

  @override
  String get ephemeralImmediate => 'Odmah (nakon citanja)';

  @override
  String get ephemeralImmediateDesc => 'Izbrisano cim se procita';

  @override
  String get ephemeralMyPreference => 'Moja postavka';

  @override
  String get ephemeralMyPreferenceDesc => 'Koristi globalnu postavku';

  @override
  String get ephemeralDefaultSetting => 'Trajanje poruke';

  @override
  String get ephemeralChooseDefault => 'Preporuceno';

  @override
  String get ephemeral30Seconds => '30 sekundi';

  @override
  String get ephemeral30SecondsDesc => 'Obrisano 30s nakon čitanja';

  @override
  String get ephemeral5Minutes => '5 minuta';

  @override
  String get ephemeral5MinutesDesc => 'Obrisano 5min nakon čitanja';

  @override
  String get ephemeral1Hour => '1 sat';

  @override
  String get ephemeral1HourDesc => 'Obrisano 1h nakon čitanja';

  @override
  String get ephemeral3Hours => '3 sata';

  @override
  String get ephemeral6Hours => '6 sati';

  @override
  String get ephemeral6HoursDesc => 'Obrisano 6h nakon čitanja';

  @override
  String get ephemeral12Hours => '12 sati';

  @override
  String get ephemeral24Hours => '24 sata';

  @override
  String get ephemeral24HoursDesc => 'Obrisano 24h nakon čitanja';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Prilagodeno trajanje';

  @override
  String get howItWorks => 'Kako funkcionira';

  @override
  String get ephemeralExplanation1 =>
      'Poruke se brisu s posluzitelja cim se prime.';

  @override
  String get ephemeralExplanation2 =>
      'Ova postavka odreduje kada poruke nestaju s VASEG telefona nakon citanja.';

  @override
  String get ephemeralExplanation3 =>
      'Vas kontakt ima vlastitu postavku za svoj telefon.';

  @override
  String get mute1Hour => '1 sat';

  @override
  String get mute8Hours => '8 sati';

  @override
  String get mute1Day => '1 dan';

  @override
  String get mute1Week => '1 tjedan';

  @override
  String get muteAlways => 'Uvijek';

  @override
  String get muteExplanation => 'Necete primati obavijesti za ovaj kontakt';

  @override
  String get showCallsInRecents => 'Prikaži u nedavnim pozivima';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash pozivi pojavljuju se u povijesti telefona';

  @override
  String get feedback => 'Povratna informacija';

  @override
  String get muteNotifications => 'Utisaj obavijesti';

  @override
  String get muteDescription => 'Necete primati obavijesti za ovaj kontakt';

  @override
  String mutedUntil(String time) {
    return 'Utisano do $time';
  }

  @override
  String get notMuted => 'Obavijesti ukljucene';

  @override
  String get unmute => 'Ukljuci zvuk';

  @override
  String get notificationSound => 'Zvuk obavijesti';

  @override
  String get defaultSound => 'Zadano';

  @override
  String get chatSettings => 'Postavke razgovora';

  @override
  String get bubbleColor => 'Boja oblacica';

  @override
  String get backgroundColor => 'Boja pozadine';

  @override
  String get backgroundImage => 'Pozadinska slika';

  @override
  String get chatBackground => 'Pozadina razgovora';

  @override
  String get customColor => 'Prilagodeno';

  @override
  String get defaultColor => 'Zadano';

  @override
  String get imageSelected => 'Slika odabrana';

  @override
  String get noImage => 'Bez slike';

  @override
  String get color => 'Boja';

  @override
  String get image => 'Slika';

  @override
  String get tapToSelectImage => 'Dodirnite za odabir slike';

  @override
  String get changeImage => 'Promijeni sliku';

  @override
  String get previewMessageReceived => 'Bok!';

  @override
  String get previewMessageSent => 'Hej!';

  @override
  String get messageAction => 'Poruka';

  @override
  String get callAction => 'Poziv';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Osobne biljeske';

  @override
  String get addNotes => 'Dodaj biljeske...';

  @override
  String get noNotes => 'Nema biljesaka';

  @override
  String get messageNotifications => 'Obavijesti o porukama';

  @override
  String get callNotifications => 'Obavijesti o pozivima';

  @override
  String get useGradient => 'Koristi gradijent';

  @override
  String get gradientStart => 'Pocetna boja';

  @override
  String get gradientEnd => 'Zavrsna boja';

  @override
  String get preview => 'Pregled';

  @override
  String get reset => 'Ponisti';

  @override
  String get securityNumber => 'Sigurnosni broj';

  @override
  String securityNumberDescription(String name) {
    return 'Provjerite podudara li se sigurnosni broj s uredajem korisnika $name';
  }

  @override
  String get verifyEncryption => 'Provjeri enkripciju od kraja do kraja';

  @override
  String get tapToCopy => 'Dodirnite za kopiranje';

  @override
  String get howToVerify => 'Kako provjeriti';

  @override
  String get verifyStep1 => 'Nadite se s kontaktom osobno ili ga nazovite';

  @override
  String get verifyStep2 =>
      'Usporedite sigurnosne brojeve ili skenirajte QR code';

  @override
  String get verifyStep3 => 'Ako se podudaraju, vas razgovor je siguran';

  @override
  String get scanToVerify => 'Skeniraj za provjeru';

  @override
  String get reportSpam => 'Prijavi nezelenu postu';

  @override
  String get reportSpamSubtitle => 'Prijavi ovaj kontakt kao nezelenu postu';

  @override
  String get reportSpamDescription =>
      'Ovo ce anonimno prijaviti ovaj kontakt. Vas identitet nece biti podijeljen. Jeste li sigurni?';

  @override
  String get report => 'Prijavi';

  @override
  String get spamReported => 'Nezelena posta prijavljena';

  @override
  String get reportError => 'Slanje prijave neuspjesno. Pokusajte ponovo.';

  @override
  String get reportRateLimited =>
      'Dostigli ste maksimalan broj prijava za danas.';

  @override
  String get blockContact => 'Blokiraj kontakt';

  @override
  String get blockContactDescription =>
      'Ovaj kontakt vam vise nece moci slati poruke ili vas zvati. Nece biti obavijenjen.';

  @override
  String get unblockContact => 'Odblokiraj kontakt';

  @override
  String get unblockContactDescription =>
      'Ovaj kontakt ce vam ponovo moci slati poruke i zvati vas.';

  @override
  String get contactBlocked => 'Kontakt blokiran';

  @override
  String get contactUnblocked => 'Kontakt odblokiran';

  @override
  String get contactIsBlocked => 'Ovaj kontakt je blokiran';

  @override
  String get unblock => 'Odblokiraj';

  @override
  String get deleteContactSubtitle => 'Izbrisi ovaj kontakt i razgovor';

  @override
  String get confirmWithPin => 'Potvrdite PIN-om';

  @override
  String get enterPinToConfirm => 'Unesite PIN za potvrdu ove radnje';

  @override
  String get profilePhoto => 'Fotografija profila';

  @override
  String get takePhoto => 'Uslikaj fotografiju';

  @override
  String get chooseFromGallery => 'Odaberi iz galerije';

  @override
  String get removePhoto => 'Ukloni fotografiju';

  @override
  String get viewContactHashId => 'Pogledaj identifikator kontakta';

  @override
  String get hashIdPartiallyMasked =>
      'Djelomicno maskirano radi vase sigurnosti i privatnosti vaseg kontakta';

  @override
  String get addFirstContact => 'Dodajte prvi kontakt';

  @override
  String get addFirstContactSubtitle =>
      'Podijelite svoj QR code ili skenirajte prijateljev';

  @override
  String get directory => 'Imenik';

  @override
  String get noContacts => 'Nema kontakata';

  @override
  String get noContactsSubtitle => 'Dodajte kontakt za pocetak';

  @override
  String get sendMessageAction => 'Posalji poruku';

  @override
  String get audioCall => 'Audio poziv';

  @override
  String get videoCall => 'Video poziv';

  @override
  String get viewProfile => 'Pogledaj profil';

  @override
  String get deleteContactDirectory => 'Izbrisi kontakt';

  @override
  String get scanShort => 'Skeniraj';

  @override
  String get addShort => 'Dodaj';

  @override
  String deleteContactConfirmName(String name) {
    return 'Jeste li sigurni da zelite izbrisati $name?';
  }

  @override
  String get noNotesTitle => 'Nema biljesaka';

  @override
  String get noNotesSubtitle => 'Kreirajte prvu biljesku';

  @override
  String get newNote => 'Nova biljeska';

  @override
  String get editNote => 'Uredi biljesku';

  @override
  String get deleteNote => 'Izbrisi biljesku';

  @override
  String get deleteNoteConfirm =>
      'Jeste li sigurni da zelite izbrisati ovu biljesku?';

  @override
  String get noteTitle => 'Naslov';

  @override
  String get noteContent => 'Sadrzaj';

  @override
  String get addItem => 'Dodaj stavku';

  @override
  String get pinNote => 'Prikaci';

  @override
  String get unpinNote => 'Otkaci';

  @override
  String get noteColor => 'Boja';

  @override
  String get notePassword => 'Lozinka';

  @override
  String get setPassword => 'Postavi lozinku';

  @override
  String get changePassword => 'Promijeni lozinku';

  @override
  String get removePassword => 'Ukloni lozinku';

  @override
  String get enterPassword => 'Unesite lozinku';

  @override
  String get confirmPassword => 'Potvrdite lozinku';

  @override
  String get passwordPin => 'PIN kod';

  @override
  String get passwordText => 'Tekstualna lozinka';

  @override
  String get protectedNote => 'Zasticena biljeska';

  @override
  String get incorrectPassword => 'Netocna lozinka';

  @override
  String get passwordSet => 'Lozinka postavljena';

  @override
  String get passwordRemoved => 'Lozinka uklonjena';

  @override
  String get notesBiometric => 'Face ID za biljeske';

  @override
  String get notesBiometricSubtitle =>
      'Zahtijevaj biometrijsku autentifikaciju za otvaranje zasticenih biljesaka';

  @override
  String get textNote => 'Tekstualna biljeska';

  @override
  String get checklistNote => 'Kontrolni popis';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total zadataka';
  }

  @override
  String get autoSaved => 'Spremljeno';

  @override
  String get searchNotes => 'Pretrazi biljeske';

  @override
  String get legalConsent => 'Pravna suglasnost';

  @override
  String get confirmAge13 => 'Potvrdujem da imam najmanje 13 godina';

  @override
  String get acceptLegalStart => 'Prihvacam ';

  @override
  String get privacyPolicy => 'Politiku privatnosti';

  @override
  String get termsOfService => 'Uvjete koristenja';

  @override
  String get andThe => ' i ';

  @override
  String get continueButton => 'Nastavi';

  @override
  String get mustAcceptTerms => 'Morate prihvatiti oba uvjeta za nastavak';

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
  String get support => 'Podrska';

  @override
  String get contactSupport => 'Kontaktirajte podrsku';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Prijavite zlostavljanje';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Pravno';

  @override
  String get legalEntity => 'Pravni subjekt';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Prikaci';

  @override
  String get unpinConversation => 'Otkaci';

  @override
  String get hideConversation => 'Ukloni iz feeda';

  @override
  String get deleteConversation => 'Izbrisi razgovor';

  @override
  String get deleteConversationConfirm =>
      'Unesite PIN za potvrdu brisanja svih poruka';

  @override
  String get noConversations => 'Nema razgovora';

  @override
  String get startConversation => 'Pocni';

  @override
  String get microphonePermissionRequired => 'Potreban pristup mikrofonu';

  @override
  String get microphonePermissionExplanation =>
      'Hash treba mikrofon za obavljanje poziva.';

  @override
  String get cameraPermissionExplanation =>
      'Hash treba kameru za video pozive.';

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
  String get openSettings => 'Otvori Postavke';

  @override
  String get callConnecting => 'Povezivanje...';

  @override
  String get callRinging => 'Zvoni...';

  @override
  String get callReconnecting => 'Ponovno povezivanje...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Ponovno povezivanje (${seconds}s)';
  }

  @override
  String get callPaused => 'Pauzirano';

  @override
  String get callPausedSubtitle => 'Poziv je još aktivan';

  @override
  String get callRemoteMicMuted => 'Mikrofon kontakta je utisan';

  @override
  String get callMiniControlsMute => 'Utisaj';

  @override
  String get callMiniControlsUnmute => 'Ukljuci zvuk';

  @override
  String get callMiniControlsHangUp => 'Prekini';

  @override
  String get callMiniControlsReturn => 'Vrati se na poziv';

  @override
  String get callNetworkPoor => 'Nestabilna veza';

  @override
  String get callNetworkLost => 'Veza izgubljena';

  @override
  String get callEndedTitle => 'Poziv zavrsen';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Podaci uredaja';

  @override
  String get deviceDataSubtitle => 'Lokalna i serverska pohrana';

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
  String get localStorage => 'Lokalna pohrana';

  @override
  String get onThisDevice => 'na ovom uredaju';

  @override
  String get encryptedDatabases => 'Enkriptirane baze podataka';

  @override
  String get files => 'Datoteke';

  @override
  String get secureKeychain => 'Siguran privjesak kljuceva';

  @override
  String get cache => 'Predmemorija';

  @override
  String get contactsDetail => 'Imena, avatari, Signal kljucevi';

  @override
  String get messagesDetail => 'Enkriptirani razgovori';

  @override
  String get notesDetail => 'Osobne biljeske';

  @override
  String get signalSessions => 'Signal sesije';

  @override
  String get signalSessionsDetail => 'Sesije enkripcije';

  @override
  String get pendingContacts => 'Kontakti na cekanju';

  @override
  String get pendingContactsDetail => 'Zahtjevi na cekanju';

  @override
  String get callHistory => 'Pozivi';

  @override
  String get callHistoryDetail => 'Povijest poziva';

  @override
  String get preferences => 'Postavke';

  @override
  String get preferencesDetail => 'Postavke medija i poziva';

  @override
  String get avatars => 'Avatari';

  @override
  String get media => 'Mediji';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count datoteka',
      one: '1 datoteka',
      zero: 'nema datoteka',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktivno';

  @override
  String get notDefined => 'Nije definirano';

  @override
  String get biometrics => 'Biometrija';

  @override
  String get recoveryPhrase => 'Fraza za oporavak';

  @override
  String get identity => 'Identitet (Hash ID)';

  @override
  String get signalKeys => 'Signal Protocol kljucevi';

  @override
  String get authTokens => 'Tokeni autentifikacije';

  @override
  String get contactNamesCache => 'Predmemorija imena kontakata';

  @override
  String get remoteConfig => 'Udaljena konfiguracija';

  @override
  String get notificationPrefs => 'Postavke obavijesti';

  @override
  String get serverData => 'Podaci posluzitelja';

  @override
  String get serverDataInfo =>
      'Hash cuva minimalne podatke na posluzitelju, sve enkriptirano ili privremeno.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail =>
      'Hash ID, javni kljucevi, token postanskog sanducica';

  @override
  String get serverPrekeys => 'Prethodni kljucevi';

  @override
  String get serverPrekeysDetail => 'Jednokratni Signal kljucevi (potroseni)';

  @override
  String get serverMessages => 'Poruke u prijenosu';

  @override
  String get serverMessagesDetail => 'Izbrisano nakon isporuke (maks. 24h)';

  @override
  String get serverMedia => 'Mediji u prijenosu';

  @override
  String get serverMediaDetail => 'Izbrisano nakon preuzimanja';

  @override
  String get serverContactRequests => 'Zahtjevi za kontakt';

  @override
  String get serverContactRequestsDetail => 'Istjecu nakon 24h';

  @override
  String get serverRateLimits => 'Ogranicenja brzine';

  @override
  String get serverRateLimitsDetail => 'Privremeni podaci protiv zloupotrebe';

  @override
  String get privacyReassurance =>
      'Hash ne moze citati vase poruke. Svi podaci su enkriptirani od kraja do kraja. Podaci na posluzitelju se automatski brisu.';

  @override
  String get pinTooSimple =>
      'Ovaj PIN je previše jednostavan. Odaberite sigurniji kod.';

  @override
  String get genericError => 'Doslo je do greske. Pokusajte ponovo.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nije moguce kreirati racun: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraza kopirana u meduspremnik';

  @override
  String get copyPhrase => 'Kopiraj frazu';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Zapisite ovu frazu na sigurno mjesto. Ako izgubite PIN bez ove fraze, trajno cete izgubiti pristup svojim podacima.';

  @override
  String get noMessages => 'Nema poruka';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Izbrisati sve poruke s $name?';
  }

  @override
  String get confirmation => 'Potvrda';

  @override
  String get untitled => 'Bez naslova';

  @override
  String get noSessions => 'Nema sesija';

  @override
  String get unknownContact => 'Nepoznati kontakt';

  @override
  String get unnamed => 'Bez imena';

  @override
  String get noPendingRequestsAlt => 'Nema zahtjeva na cekanju';

  @override
  String get deleteAllCallHistory => 'Izbrisati svu povijest poziva?';

  @override
  String get noCalls => 'Nema poziva';

  @override
  String get noPreferences => 'Nema postavki';

  @override
  String get resetAllMediaPrefs => 'Ponistiti sve postavke medija?';

  @override
  String get deleteThisAvatar => 'Izbrisati ovaj avatar?';

  @override
  String get deleteAllAvatars => 'Izbrisati sve avatare?';

  @override
  String get noAvatars => 'Nema avatara';

  @override
  String get deleteThisFile => 'Izbrisati ovu datoteku?';

  @override
  String get deleteAllMediaFiles => 'Izbrisati sve medije?';

  @override
  String get noMediaFiles => 'Nema medija';

  @override
  String get outgoing => 'Odlazni';

  @override
  String get incoming => 'Dolazni';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Privremeni prikaz: ${seconds}s';
  }

  @override
  String get normalView => 'Normalan prikaz';

  @override
  String get callReasonCompleted => 'Zavrseno';

  @override
  String get callReasonMissed => 'Propusteno';

  @override
  String get callReasonDeclined => 'Odbijeno';

  @override
  String get callReasonFailed => 'Neuspjelo';

  @override
  String get justNow => 'Upravo sada';

  @override
  String timeAgoMinutes(int count) {
    return 'Prije $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Prije ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Prije ${count}d';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Lokacija';

  @override
  String get statusQueued => 'U redu cekanja';

  @override
  String get blockedBadge => 'Blokirano';

  @override
  String get protectedBadge => 'Zasticeno';

  @override
  String messageCount(int count) {
    return '$count poruka(e)';
  }

  @override
  String get deleteQuestion => 'Izbrisati?';

  @override
  String get transferMyAccountTitle => 'Prenesi moj racun';

  @override
  String get loadingError => 'Greska pri ucitavanju';

  @override
  String get transferToNewDevice => 'Prenesi na novi uredaj';

  @override
  String get transferInstructions =>
      'Na novom uredaju odaberite \"Oporavi moj racun\" i unesite ove informacije:';

  @override
  String get yourHashIdLabel => 'Vas Hash ID';

  @override
  String get enterYourPinCode => 'Unesite svoj PIN kod';

  @override
  String get pinOwnerConfirmation => 'Za potvrdu da ste vlasnik ovog racuna';

  @override
  String get scanThisQrCode => 'Skenirajte ovaj QR code';

  @override
  String get withYourNewDevice => 'Svojim novim uredajem';

  @override
  String get orEnterTheCode => 'ili unesite kod';

  @override
  String get transferCodeLabel => 'Kod za prijenos';

  @override
  String get proximityVerification => 'Provjera blizine';

  @override
  String get bringDevicesCloser => 'Priblizite oba uredaja';

  @override
  String get confirmTransferQuestion => 'Potvrditi prijenos?';

  @override
  String get accountWillBeTransferred =>
      'Vas racun ce biti prenesen na novi uredaj.\n\nOvaj uredaj ce biti trajno odjavljen.';

  @override
  String get transferComplete => 'Prijenos dovrsena';

  @override
  String get transferSuccessMessage =>
      'Vas racun je uspjesno prenesen.\n\nOva aplikacija ce se sada zatvoriti.';

  @override
  String get manualVerification => 'Rucna provjera';

  @override
  String get codeDisplayedOnBothDevices => 'Kod prikazan na oba uredaja:';

  @override
  String get doesCodeMatchNewDevice =>
      'Podudara li se ovaj kod s onim na novom uredaju?';

  @override
  String get verifiedStatus => 'Provjereno';

  @override
  String get inProgressStatus => 'U tijeku...';

  @override
  String get notAvailableStatus => 'Nije dostupno';

  @override
  String get codeExpiredRestart => 'Kod je istekao. Molimo pokrenite ponovo.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kodovi se ne podudaraju. Prijenos otkazan.';

  @override
  String transferToDevice(String device) {
    return 'Na: $device';
  }

  @override
  String get copiedExclamation => 'Kopirano!';

  @override
  String expiresInTime(String time) {
    return 'Istjece za $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrija nije dostupna na ovom uredaju';

  @override
  String get biometricAuthError => 'Greska pri biometrijskoj autentifikaciji';

  @override
  String get authenticateForBiometric =>
      'Molimo autentificirajte se za omogucavanje biometrije';

  @override
  String get biometricAuthFailed => 'Biometrijska autentifikacija neuspjesna';

  @override
  String get forceUpdateTitle => 'Potrebno azuriranje';

  @override
  String get forceUpdateMessage =>
      'Nova verzija Hash-a je dostupna. Molimo azurirajte za nastavak.';

  @override
  String get updateButton => 'Azuriraj';

  @override
  String get maintenanceInProgress => 'Odrzavanje u tijeku';

  @override
  String get tryAgainLater => 'Pokusajte ponovo kasnije';

  @override
  String get information => 'Informacije';

  @override
  String get later => 'Kasnije';

  @override
  String get doYouLikeHash => 'Sviđa li vam se Hash?';

  @override
  String get yourFeedbackHelps =>
      'Vaše povratne informacije nam pomažu poboljšati aplikaciju';

  @override
  String get ratingTerrible => 'Užasno';

  @override
  String get ratingBad => 'Loše';

  @override
  String get ratingOk => 'U redu';

  @override
  String get ratingGood => 'Dobro';

  @override
  String get ratingExcellent => 'Izvrsno!';

  @override
  String get donationMessage =>
      'Hash je neprofitni projekt. Vaša podrška nam pomaže nastaviti graditi zaista privatni messenger.';

  @override
  String get recentConnections => 'Nedavne veze';

  @override
  String get loginInfoText =>
      'Svako otključavanje PIN-om bilježi se lokalno. Čuvaju se samo zadnja 24 sata.';

  @override
  String get connectionCount => 'Veza(e)';

  @override
  String get periodLabel => 'Razdoblje';

  @override
  String get historyLabel => 'Povijest';

  @override
  String get noLoginRecorded => 'Nema zabiljeenih prijava';

  @override
  String get nextUnlocksAppearHere =>
      'Sljedeca otkljucavanja ce se pojaviti ovdje.';

  @override
  String get dataLocalOnly =>
      'Ovi podaci pohranjuju se samo na vašem uređaju i nikad se ne prenose.';

  @override
  String get currentSession => 'Trenutna';

  @override
  String get todayLabel => 'Danas';

  @override
  String get yesterdayLabel => 'Jučer';

  @override
  String get justNowLabel => 'Upravo sada';

  @override
  String minutesAgoLabel(int count) {
    return 'Prije $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Prije ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Prije ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Nema planiranog odrzavanja';

  @override
  String get everythingWorkingNormally => 'Sve radi normalno';

  @override
  String get maintenanceTitle => 'Održavanje';

  @override
  String get maintenanceActiveLabel => 'U TIJEKU';

  @override
  String get maintenancePlannedLabel => 'PLANIRANO';

  @override
  String get locking => 'Zakljucavanje...';

  @override
  String get newMessageNotification => 'Nova poruka';

  @override
  String get secExplainTitle => 'Kako vas Hash stiti';

  @override
  String get secExplainIntro =>
      'Hash je dizajniran tako da nitko ne moze citati vase poruke.';

  @override
  String get secExplainIntroSub =>
      'Cak ni mi.\nEvo kako to funkcionira, jednostavno objasnjeno.';

  @override
  String get secJourneyLabel => 'PUTOVANJE';

  @override
  String get secJourneyTitle => 'Putovanje vase poruke';

  @override
  String get secJourneySubtitle =>
      'Od vaseg prsta do zaslona vaseg kontakta, svaki korak je zasticen. Pratite put.';

  @override
  String get secStep1Title => 'Pisete poruku';

  @override
  String get secStep1Desc =>
      'Upisujete \"Bok!\" u aplikaciju. U ovom trenutku poruka postoji samo u memoriji vaseg telefona. Nista nije poslano.';

  @override
  String get secStep2Title => 'Enkripcija pomocu Signal Protocol';

  @override
  String get secStep2Desc =>
      'Cim pritisnete \"Posalji\", vasa poruka se pretvara u niz nerazumljivih znakova. Kao da je vasa poruka zakljucana u sefu za koji samo vas kontakt ima kljuc.';

  @override
  String get secStep3Title => 'Sealed Sender: nevidljiva omotnica';

  @override
  String get secStep3Desc =>
      'Zamislite da saljete pismo postom, ali bez povratne adrese na omotnici. Upravo to Hash radi. Poruka se ubacuje u anonimni postanski sanducic. Posluzitelj ne zna tko ju je poslao.';

  @override
  String get secStep4Title => 'Posluzitelj ne vidi nista';

  @override
  String get secStep4Desc =>
      'Posluzitelj djeluje kao slijepi postar. Zna samo da je \"netko ubacio nesto u sanducic #A7X9\". Ne zna tko je poslao, sto je to ili kome je namijenjeno.';

  @override
  String get secStep4Highlight =>
      'Nema pohranjenih metapodataka: nema IP adrese, nema vremenskog pecata, nema veze izmedu posiljatelja i primatelja.';

  @override
  String get secStep5Title => 'Vas kontakt prima poruku';

  @override
  String get secStep5Desc =>
      'Telefon vaseg kontakta dohvaca sadrzaj iz anonimnog postanskog sanducica i dekriptira poruku privatnim kljucem koji nikada nije napustio njihov uredaj. \"Bok!\" se pojavljuje na njihovom zaslonu.';

  @override
  String get secStep6Title => 'Poruka nestaje s posluzitelja';

  @override
  String get secStep6Desc =>
      'Cim vas kontakt potvrdi primitak, posluzitelj trajno brise poruku. Nema smeca, nema arhive, nema sigurnosne kopije. Cak se i neprocitane poruke automatski uniste nakon 24 sata.';

  @override
  String get secStep7Title => 'Lokalno istjecanje';

  @override
  String get secStep7Desc =>
      'Na telefonu vaseg kontakta, poruka se samounistava prema trajanju koje ste odabrali: odmah nakon citanja, 5 minuta, 1 sat... vi odlucujete.';

  @override
  String get secJourneyConclusion =>
      'Rezultat: nula tragova na posluzitelju, nula tragova na uredajima. Poruka je postojala samo dovoljno dugo da bude procitana, a zatim je nestala.';

  @override
  String get secArchLabel => 'ARHITEKTURA';

  @override
  String get secArchTitle => '5 slojeva zastite';

  @override
  String get secArchSubtitle =>
      'Hash se ne oslanja na jednu tehnologiju. Svaki sloj pojacava ostale. Cak i ako je jedan sloj kompromitiran, vasi podaci ostaju sigurni.';

  @override
  String get secLayer1Title => 'Enkripcija od kraja do kraja';

  @override
  String get secLayer1Desc =>
      'Svaka poruka je enkriptirana jedinstvenim kljucem. Jednostavno receno: cak i ako netko dekriptira jednu poruku, nece moci dekriptirati sljedecu. Svaka poruka ima svoju bravu.';

  @override
  String get secLayer1Detail =>
      'Za datoteke (fotografije, videa, dokumente), Hash koristi dodatnu AES-256-GCM enkripciju. Datoteka je enkriptirana prije nego sto napusti vas telefon.';

  @override
  String get secLayer2Title => 'Sealed Sender (mrezna anonimnost)';

  @override
  String get secLayer2Desc =>
      'Obicni komunikatori salju vase poruke s vasim identitetom. Kao da pisite svoje ime na omotnicu. Hash koristi anonimne postanske sanducice: posluzitelj isporucuje poruku ne znajuci tko ju je poslao.';

  @override
  String get secLayer2Detail =>
      'Rezultat: cak i u slucaju proboja podataka na posluzitelju, nemoguce je rekonstruirati tko razgovara s kime.';

  @override
  String get secLayer3Title => 'Automatsko brisanje';

  @override
  String get secLayer3Desc =>
      'Poruke se brisu s posluzitelja cim se potvrdi primitak. Cak i ako poruka nikada nije preuzeta, automatski se unistava nakon 24 sata.';

  @override
  String get secLayer3Detail =>
      'Na vasem telefonu, poruke se samounistavaju prema trajanju koje odaberete: odmah, 5 min, 15 min, 30 min, 1h, 3h, 6h ili 12h.';

  @override
  String get secLayer4Title => 'Zastita lokalnog pristupa';

  @override
  String get secLayer4Desc =>
      'Aplikacija je zasticena 6-znamenkastim PIN-om i/ili biometrijom (Face ID, otisak prsta). Nakon previse neuspjelih pokusaja, aplikacija se zakljucava s rastucom odgodom nakon svakog neuspjeha.';

  @override
  String get secLayer5Title => 'Zakljucana baza podataka';

  @override
  String get secLayer5Desc =>
      'Na strani posluzitelja, nijedan korisnik ne moze izravno pisati u bazu podataka. Sve radnje prolaze kroz sigurne funkcije koje provjeravaju svaki zahtjev.';

  @override
  String get secLayer5Detail =>
      'To je kao salter u banci: nikada ne dodirujete trezor sami. Podnosite zahtjev, a sustav provjerava imate li pravo prije nego sto djeluje.';

  @override
  String get secVashLabel => 'JEDINSTVENO U SVIJETU';

  @override
  String get secVashTitle => 'Vash nacin';

  @override
  String get secVashSubtitle =>
      'Hitni sigurnosni sustav koji ne postoji ni u jednoj drugoj aplikaciji za poruke.';

  @override
  String get secVashScenarioTitle => 'Zamislite ovu situaciju';

  @override
  String get secVashScenario1 => 'Netko pristupa vasem telefonu';

  @override
  String get secVashScenario2 => 'Traze vas PIN kod';

  @override
  String get secVashScenario3 => 'Zelite hitno izbrisati sve svoje podatke';

  @override
  String get secVashSolutionTitle => 'Rjesenje: dva PIN koda';

  @override
  String get secVashSolutionDesc =>
      'Konfigurirate dva razlicita PIN koda u Hash-u:';

  @override
  String get secVashNormalCodeLabel => 'Normalni kod';

  @override
  String get secVashNormalCodeDesc =>
      'Otvara aplikaciju normalno sa svim vasim podacima';

  @override
  String get secVashCodeLabel2 => 'Vash kod';

  @override
  String get secVashCodeDescription =>
      'Otvara aplikaciju normalno... ali svi vasi podaci se tiho brisu u pozadini';

  @override
  String get secVashWhatHappensTitle => 'Sto se dogada zatim';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikacija se otvara normalno. Nema upozorenja, nema sumnjivih animacija. Zaslon jednostavno prikazuje praznu aplikaciju, kao da ste je upravo instalirali.\n\nU stvarnosti, svi vasi razgovori, kontakti i poruke su nepovratno izbrisani u djelicu sekunde.';

  @override
  String get secCallsLabel => 'POZIVI I DATOTEKE';

  @override
  String get secCallsTitle => 'Sve je enkriptirano';

  @override
  String get secCallsSubtitle =>
      'Nisu samo poruke. Apsolutno sve sto prolazi kroz Hash je enkriptirano od kraja do kraja.';

  @override
  String get secAudioCallTitle => 'Audio pozivi';

  @override
  String get secAudioCallDesc =>
      'Enkriptirani od kraja do kraja putem WebRTC. Glas se prenosi izravno izmedu uredaja.';

  @override
  String get secVideoCallTitle => 'Video pozivi';

  @override
  String get secVideoCallDesc =>
      'Ista tehnologija, svaki tok enkriptiran pojedinacno.';

  @override
  String get secPhotosTitle => 'Fotografije i videa';

  @override
  String get secPhotosDesc =>
      'Enkriptirani u AES-256-GCM prije nego sto napuste vas telefon.';

  @override
  String get secDocsTitle => 'Dokumenti';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, bilo koja datoteka. Naziv, velicina i sadrzaj enkriptirani.';

  @override
  String get secAnonLabel => 'ANONIMNOST';

  @override
  String get secAnonTitle => 'Nije potreban identitet';

  @override
  String get secAnonSubtitle =>
      'Hash nikada ne trazi vas telefonski broj ili e-mail. Identificirani ste jedinstvenim i anonimnim Hash ID-om.';

  @override
  String get secHashIdTitle => 'Vas Hash ID';

  @override
  String get secHashIdDesc =>
      'Ovo je vas jedinstveni identifikator. Ne otkriva nista o vama: ni vase ime, ni vas broj, ni vasu lokaciju. To je kao pseudonim koji je nemoguce povezati s vasim stvarnim identitetom.\n\nZa dodavanje kontakta, dijelite svoj Hash ID ili skenirate QR code. To je to. Bez sinkroniziranog adresara, bez prijedloga \"Ljudi koje mozda poznajete\".';

  @override
  String get secDataLabel => 'PODACI';

  @override
  String get secDataTitle => 'Sto Hash ne zna';

  @override
  String get secDataSubtitle =>
      'Najbolji nacin za zastitu vasih podataka je ne prikupljati ih.';

  @override
  String get secNeverCollected => 'Nikada prikupljeno';

  @override
  String get secNeverItem1 => 'Sadrzaj poruka';

  @override
  String get secNeverItem2 => 'Lista kontakata';

  @override
  String get secNeverItem3 => 'Telefonski broj';

  @override
  String get secNeverItem4 => 'E-mail adresa';

  @override
  String get secNeverItem5 => 'IP adresa';

  @override
  String get secNeverItem6 => 'Lokacija';

  @override
  String get secNeverItem7 => 'Metapodaci (tko razgovara s kime)';

  @override
  String get secNeverItem8 => 'Povijest poziva';

  @override
  String get secNeverItem9 => 'Adresar';

  @override
  String get secNeverItem10 => 'Identifikatori za oglasavanje';

  @override
  String get secTempStored => 'Privremeno pohranjeno';

  @override
  String get secTempItem1 => 'Anonimni Hash ID (jedinstveni identifikator)';

  @override
  String get secTempItem2 => 'Javni kljucevi za enkripciju';

  @override
  String get secTempItem3 => 'Enkriptirane poruke u prijenosu (maks. 24h)';

  @override
  String get secTempNote =>
      'Cak ni ovi minimalni podaci ne mogu vas identificirati. Vas Hash ID nije povezan s nijednim osobnim podacima.';

  @override
  String get secFooterTitle => 'Vasa privatnost, vasa sloboda';

  @override
  String get secFooterDesc =>
      'Hash koristi iste tehnologije enkripcije kao najzahtjevnije profesionalne aplikacije. Vase poruke su zasticene matematikom, a ne obecanjima.';

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
