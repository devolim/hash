// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bosnian (`bs`).
class AppLocalizationsBs extends AppLocalizations {
  AppLocalizationsBs([String locale = 'bs']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Bez traga. Bez kompromisa.';

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
  String get conversations => 'Chatovi';

  @override
  String get contacts => 'Kontakti';

  @override
  String get noConversation => 'Nema chatova';

  @override
  String get noConversationSubtitle =>
      'Dodajte kontakt da započnete siguran razgovor';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zahtjeva na čekanju',
      one: '1 zahtjev na čekanju',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poslanih zahtjeva na čekanju',
      one: '1 poslani zahtjev na čekanju',
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
  String get newConversation => 'Pošalji poruku';

  @override
  String get settings => 'Postavke';

  @override
  String get myHashId => 'Moj Hash ID';

  @override
  String get supportHash => 'Podrži Hash';

  @override
  String get supportHashSubtitle => 'Hash je neprofitni projekat';

  @override
  String get donate => 'Doniraj';

  @override
  String get appearance => 'Izgled';

  @override
  String get theme => 'Tema';

  @override
  String get themeAuto => 'Automatski';

  @override
  String get themeAutoSubtitle => 'Prati sistemske postavke';

  @override
  String get themeDark => 'Tamna';

  @override
  String get themeLight => 'Svijetla';

  @override
  String get themeRecommendation =>
      'Tamna tema se preporučuje za bolju privatnost';

  @override
  String get language => 'Jezik';

  @override
  String get languageAuto => 'Automatski (sistem)';

  @override
  String get notifications => 'Obavještenja';

  @override
  String get messages => 'Poruke';

  @override
  String get calls => 'Pozivi';

  @override
  String get vibration => 'Vibracija';

  @override
  String get notificationContent => 'Sadržaj obavještenja';

  @override
  String get notificationContentFull => 'Prikaži sve';

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
  String get howHashProtectsYou => 'Kako vas Hash štiti';

  @override
  String get howHashProtectsYouSubtitle => 'Razumijte svoju sigurnost';

  @override
  String get accountSecurity => 'Sigurnost računa';

  @override
  String get accountSecuritySubtitle => 'PIN, biometrija, Vash mod';

  @override
  String get blockScreenshots => 'Blokiraj snimke ekrana';

  @override
  String get transferDevice => 'Prebaci na drugi uređaj';

  @override
  String get transferDeviceSubtitle => 'Migrirajte svoj račun';

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
  String get incorrectPin => 'Neispravan PIN';

  @override
  String get pinsDoNotMatch => 'PIN kodovi se ne podudaraju';

  @override
  String get autoLock => 'Automatsko zaključavanje';

  @override
  String get autoLockDelay => 'Odgoda zaključavanja';

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
  String get vashModeTitle => 'Vash mod';

  @override
  String get vashModeExplanation => 'Vaša krajnja sigurnosna mreža.';

  @override
  String get vashModeDescription =>
      'Izabraćete drugi PIN kod. Ako vas ikada primoraju da otvorite Hash, unesite ovaj kod umjesto vašeg redovnog PIN-a.\n\nAplikacija će se otvoriti normalno, ali svi vaši razgovori i kontakti će nestati.\n\nZa svakoga ko gleda vaš ekran, Hash jednostavno izgleda prazan — kao da ga nikada niste koristili.';

  @override
  String get vashModeIrreversible => 'Ova radnja je tiha i nepovratna.';

  @override
  String get chooseVashCode => 'Izaberi moj Vash kod';

  @override
  String get vashCodeInfo =>
      'Drugi PIN kod koji otvara aplikaciju normalno, ali praznu.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Ako unesete ovaj kod umjesto PIN-a:';

  @override
  String get vashDeleteContacts => 'Vaši kontakti nestaju';

  @override
  String get vashDeleteMessages => 'Vaši razgovori nestaju';

  @override
  String get vashDeleteHistory => 'Vaše bilješke nestaju';

  @override
  String get vashKeepId => 'Vaš Hash identitet (#XXX-XXX-XXX) ostaje isti';

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
  String get vashCodeConfigured => 'Vash kod konfigurisan';

  @override
  String get vashCodeModified => 'Vash kod izmijenjen';

  @override
  String get vashCodeMustDiffer => 'Vash kod mora biti različit od PIN-a';

  @override
  String get incorrectVashCode => 'Neispravan Vash kod';

  @override
  String get vashWhatToDelete => 'Šta Vash mod treba učiniti da nestane?';

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
  String get vashDeleteNotesOption => 'Bilješke';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Vash mod aktiviran';

  @override
  String get vashCreateSubtitle =>
      'Izaberite kod različit od vašeg glavnog PIN-a';

  @override
  String get vashConfirmSubtitle => 'Potvrdite svoj Vash kod';

  @override
  String get pinCodeForEntry => 'PIN kod za ulaz u aplikaciju';

  @override
  String get vashCodeSection => 'Vash mod';

  @override
  String get biometric => 'Biometrija';

  @override
  String get biometricUnlock => 'Otključaj otiskom prsta ili Face ID-om';

  @override
  String get enableBiometric => 'Aktiviraj biometriju';

  @override
  String get biometricWarningMessage =>
      'Aktiviranjem biometrije, nećete moći koristiti Vash kod za ulaz u aplikaciju.\n\nVash kod ćete moći koristiti samo ako biometrija ne uspije (nakon više neuspjelih pokušaja).\n\nJeste li sigurni da želite nastaviti?';

  @override
  String get understood => 'Razumijem';

  @override
  String get shareAppSubtitle => 'Podijelite Hash sa bližnjima';

  @override
  String get share => 'Podijeli';

  @override
  String get danger => 'Opasnost';

  @override
  String get deleteAccount => 'Izbriši moj račun';

  @override
  String get deleteAccountSubtitle => 'Nepovratna radnja';

  @override
  String get deleteAccountConfirmTitle => 'Izbriši moj račun';

  @override
  String get deleteAccountConfirmMessage =>
      'Vaš račun će biti trajno izbrisan. Ova radnja je nepovratna.\n\n• Svi vaši chatovi\n• Svi vaši kontakti\n• Vaš Hash ID\n\nMoraćete kreirati novi račun.';

  @override
  String get deleteForever => 'Izbriši trajno';

  @override
  String get cancel => 'Otkaži';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Vash mod aktiviran.';

  @override
  String deletionError(String error) {
    return 'Greška pri brisanju: $error';
  }

  @override
  String get yourSecurity => 'Vaša sigurnost';

  @override
  String get securityInfo =>
      '• End-to-end enkripcija (Signal Protocol)\n• Nema podataka na našim serverima nakon isporuke\n• Ključevi pohranjeni samo na vašem uređaju\n• PIN kod nikada nije poslan na server';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Dobrodošli';

  @override
  String get securityStatement1 => 'Vaše poruke su zaštićene.';

  @override
  String get securityStatement2 => 'End-to-end enkripcija.';

  @override
  String get securityStatement3 => 'Bez traga. Bez kompromisa.';

  @override
  String get securityStatement4 => 'Vaša privatnost je pravo.';

  @override
  String get accessBlocked => 'Pristup blokiran';

  @override
  String get tooManyAttempts => 'Previše pokušaja. Pokušajte ponovo kasnije.';

  @override
  String get pleaseWait => 'Molimo sačekajte';

  @override
  String get waitDelay => 'Molimo sačekajte da odgoda istekne';

  @override
  String attemptCount(int current, int max) {
    return 'Pokušaj $current od $max';
  }

  @override
  String retryIn(String time) {
    return 'Pokušajte ponovo za $time';
  }

  @override
  String get forgotPin => 'Zaboravili PIN? Koristite frazu za oporavak';

  @override
  String get useRecoveryPhrase => 'Koristi frazu za oporavak';

  @override
  String get recoveryWarningTitle => 'Upozorenje';

  @override
  String get recoveryWarningMessage => 'Oporavak računa će:';

  @override
  String get recoveryDeleteAllMessages => 'Izbrisati SVE vaše poruke';

  @override
  String get recoveryWaitDelay => 'Zahtijevati odgodu od 1 sata';

  @override
  String get recoveryKeepContacts => 'Zadržati vaše kontakte';

  @override
  String get recoveryIrreversible =>
      'Ova radnja je nepovratna. Vaše poruke će biti trajno izgubljene.';

  @override
  String get iUnderstand => 'Razumijem';

  @override
  String get accountRecovery => 'Oporavak računa';

  @override
  String get enterRecoveryPhrase =>
      'Unesite 24 riječi vaše fraze za oporavak, odvojene razmacima.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Oporavi';

  @override
  String get recoveryPhraseRequired => 'Molimo unesite vašu frazu za oporavak';

  @override
  String get recoveryPhrase24Words => 'Fraza mora sadržavati tačno 24 riječi';

  @override
  String get incorrectRecoveryPhrase => 'Neispravna fraza za oporavak';

  @override
  String get recoveryInitError => 'Greška pri inicijalizaciji oporavka';

  @override
  String get securityDelay => 'Sigurnosna odgoda';

  @override
  String get securityDelayMessage =>
      'Za vašu sigurnost, potrebno je sačekati prije kreiranja novog PIN-a.';

  @override
  String get timeRemaining => 'Preostalo vrijeme';

  @override
  String get messagesDeletedForProtection =>
      'Vaše poruke su izbrisane za vašu zaštitu.';

  @override
  String get canCloseApp => 'Možete zatvoriti aplikaciju i vratiti se kasnije.';

  @override
  String get onboardingTitle1 => 'Dobrodošli u Hash';

  @override
  String get onboardingSubtitle1 => 'Komunikator koji ne ostavlja trag';

  @override
  String get onboardingTitle2 => 'Potpuna enkripcija';

  @override
  String get onboardingSubtitle2 =>
      'Vaše poruke su end-to-end enkriptovane Signal protokolom';

  @override
  String get onboardingTitle3 => 'Bez traga';

  @override
  String get onboardingSubtitle3 => 'Poruke se brišu sa servera po isporuci';

  @override
  String get onboardingTitle4 => 'Vaša sigurnost';

  @override
  String get onboardingSubtitle4 => 'PIN kod, Vash mod i fraza za oporavak';

  @override
  String get getStarted => 'Započni';

  @override
  String get next => 'Dalje';

  @override
  String get skip => 'Preskoči';

  @override
  String get alreadyHaveAccount => 'Već imam račun';

  @override
  String get transferMyAccount => 'Prebaci moj račun';

  @override
  String get createPin => 'Kreirajte PIN kod';

  @override
  String get createPinSubtitle =>
      'Ovaj kod će štititi pristup vašoj aplikaciji';

  @override
  String get confirmYourPin => 'Potvrdite svoj PIN kod';

  @override
  String get confirmPinSubtitle => 'Ponovo unesite svoj PIN kod';

  @override
  String get saveRecoveryPhrase => 'Fraza za oporavak';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Zapišite ovih 24 riječi redom. One će vam omogućiti oporavak računa ako zaboravite PIN.';

  @override
  String get phraseWritten => 'Zapisao/la sam svoju frazu';

  @override
  String get warningRecoveryPhrase =>
      'Ako izgubite ovu frazu i zaboravite PIN, izgubićete pristup svom računu.';

  @override
  String get accountTransferred => 'Račun prebačen';

  @override
  String get accountTransferredMessage =>
      'Vaš račun je prebačen na drugi uređaj. Ova sesija više nije važeća.';

  @override
  String get accountTransferredInfo =>
      'Ako niste vi pokrenuli ovaj prijenos, vaš račun je možda kompromitovan.';

  @override
  String get logout => 'Odjavi se';

  @override
  String get transferAccount => 'Prebaci račun';

  @override
  String get transferAccountInfo =>
      'Prebacite svoj Hash račun na novi uređaj. Vaša trenutna sesija će biti poništena.';

  @override
  String get generateTransferCode => 'Generiši kod za prijenos';

  @override
  String get transferCode => 'Kod za prijenos';

  @override
  String transferCodeExpires(int minutes) {
    return 'Ovaj kod ističe za $minutes minuta';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Unesite ovaj kod na novom uređaju za prijenos računa.';

  @override
  String get generateNewCode => 'Generiši novi kod';

  @override
  String get scanQrCode => 'Skeniraj QR kod';

  @override
  String get scanQrCodeSubtitle => 'Skenirajte QR kod kontakta da ga dodate';

  @override
  String get qrCodeDetected => 'QR kod detektovan';

  @override
  String get invalidQrCode => 'Nevažeći QR kod';

  @override
  String get cameraPermissionRequired => 'Potrebna dozvola kamere';

  @override
  String get myQrCode => 'Moj QR kod';

  @override
  String get myQrCodeSubtitle =>
      'Podijelite ovaj QR kod da vas kontakti mogu dodati';

  @override
  String get shareQrCode => 'Podijeli';

  @override
  String get addContactTitle => 'Dodaj kontakt';

  @override
  String get addContactByHashId => 'Unesite Hash ID vašeg kontakta';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Traži';

  @override
  String get contactNotFound => 'Kontakt nije pronađen';

  @override
  String get contactAlreadyAdded => 'Ovaj kontakt je već na vašoj listi';

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
    return 'Ističe za $time';
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
  String get showMyQrCode => 'Prikaži moj QR kod';

  @override
  String get orDivider => 'ili';

  @override
  String get openScanner => 'Otvori skener';

  @override
  String get addManually => 'Dodaj ručno';

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
  String get verifyAndAdd => 'Verifikuj i dodaj';

  @override
  String get fillAllFields => 'Molimo popunite sva polja';

  @override
  String get invalidHashIdFormat => 'Nevažeći format ID-a (npr.: 123-456-ABC)';

  @override
  String get userNotFound => 'Korisnik nije pronađen';

  @override
  String get cannotAddYourself => 'Ne možete dodati sebe';

  @override
  String get invalidOrExpiredCode => 'Nevažeći ili istekli privremeni kod';

  @override
  String get contactFound => 'Kontakt pronađen!';

  @override
  String get howToCallContact => 'Kako želite da ga zovete?';

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
  String get deleteContact => 'Izbriši kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Izbrisati ovaj kontakt?';
  }

  @override
  String get deleteContactMessage => 'Ovo će također izbrisati cijeli chat.';

  @override
  String get delete => 'Izbriši';

  @override
  String get typeMessage => 'Napišite poruku...';

  @override
  String get messageSent => 'Poslano';

  @override
  String get messageDelivered => 'Isporučeno';

  @override
  String get messageRead => 'Pročitano';

  @override
  String get messageFailed => 'Slanje nije uspjelo';

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
  String get yesterday => 'Jučer';

  @override
  String dateAtTime(String date, String time) {
    return '$date u $time';
  }

  @override
  String get shareMessage =>
      'Pridruži mi se na Hash-u! 🔒\n\nTo je zaista privatni komunikator: potpuna enkripcija, bez tragova na serverima, i mod za paniku ako zatreba.\n\nPreuzmi aplikaciju ovdje 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Greška';

  @override
  String get ok => 'U redu';

  @override
  String get view => 'Pogledaj';

  @override
  String get yes => 'Da';

  @override
  String get no => 'Ne';

  @override
  String get save => 'Sačuvaj';

  @override
  String get edit => 'Uredi';

  @override
  String get close => 'Zatvori';

  @override
  String get confirm => 'Potvrdi';

  @override
  String get loading => 'Učitavanje...';

  @override
  String get retry => 'Pokušaj ponovo';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Zahtjevi na čekanju';

  @override
  String get noPendingRequests => 'Nema zahtjeva na čekanju';

  @override
  String get pendingRequestsSubtitle => 'Ove osobe žele da vas dodaju';

  @override
  String requestFromUser(String hashId) {
    return 'Zahtjev od $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Ističe za $days dana';
  }

  @override
  String get acceptRequest => 'Prihvati';

  @override
  String get rejectRequest => 'Odbij';

  @override
  String get requestAccepted => 'Zahtjev prihvaćen';

  @override
  String get requestRejected => 'Zahtjev odbijen';

  @override
  String get requestSent => 'Zahtjev poslan!';

  @override
  String get requestSentSubtitle =>
      'Vaš zahtjev je poslan. Korisnik ga mora prihvatiti da biste mogli razgovarati.';

  @override
  String get requestAlreadyPending => 'Zahtjev je već na čekanju';

  @override
  String get requestAlreadySentByOther =>
      'Ova osoba vam je već poslala zahtjev';

  @override
  String get addByHashId => 'Dodaj putem Hash ID-a';

  @override
  String get addByHashIdSubtitle => 'Unesite Hash ID i privremeni kod kontakta';

  @override
  String get enterTemporaryCode => 'Unesite 6-cifreni kod';

  @override
  String get sendRequest => 'Pošalji zahtjev';

  @override
  String get acceptContactTitle => 'Prihvati kontakt';

  @override
  String get acceptContactSubtitle => 'Možete mu dati prilagođeno ime';

  @override
  String get leaveEmptyForHashId => 'Ostavite prazno da koristite Hash ID';

  @override
  String get firstName => 'Ime';

  @override
  String get lastName => 'Prezime';

  @override
  String get notes => 'Bilješke';

  @override
  String get notesHint => 'Lične bilješke o ovom kontaktu';

  @override
  String get photoOptional => 'Fotografija (opcionalno)';

  @override
  String get contactNameOptional => 'Ime (opcionalno)';

  @override
  String get notesOptional => 'Bilješke (opcionalno)';

  @override
  String get storedLocally => 'Pohranjeno samo na vašem uređaju';

  @override
  String get encryptedMessageLabel => 'Enkriptovana poruka';

  @override
  String get identityMessageHint => 'Ko ste vi? Kako se poznajete?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ova poruka će biti enkriptovana i poslana primaocu';

  @override
  String get sendRequestButton => 'Pošalji zahtjev';

  @override
  String get requestExpiresIn24h => 'Zahtjev ističe za 24h ako nije prihvaćen';

  @override
  String get theyAlreadySentYouRequest =>
      'Ova osoba vam je već poslala zahtjev';

  @override
  String get requests => 'Zahtjevi';

  @override
  String get receivedRequests => 'Primljeni';

  @override
  String get sentRequests => 'Poslani';

  @override
  String get noSentRequests => 'Nema poslanih zahtjeva';

  @override
  String get cancelRequest => 'Otkaži';

  @override
  String get deleteRequest => 'Izbriši zahtjev';

  @override
  String get requestCancelled => 'Zahtjev otkazan';

  @override
  String sentTo(String hashId) {
    return 'Poslano na $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Ističe za $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Primljeno prije $time';
  }

  @override
  String get messageFromRequester => 'Poruka od pošiljaoca zahtjeva';

  @override
  String get copy => 'Kopiraj';

  @override
  String get messageInfo => 'Info o poruci';

  @override
  String get messageDirection => 'Smjer';

  @override
  String get messageSentByYou => 'Poslano od vas';

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
  String get messageReadAt => 'Pročitano u';

  @override
  String get messageType => 'Tip';

  @override
  String get messageSize => 'Veličina';

  @override
  String get messageExpiresAt => 'Ističe u';

  @override
  String get messageEncrypted => 'End-to-end enkriptovano';

  @override
  String get messageStatusSending => 'Slanje...';

  @override
  String get messageStatusSent => 'Poslano';

  @override
  String get messageStatusDelivered => 'Isporučeno';

  @override
  String get messageStatusRead => 'Pročitano';

  @override
  String get messageStatusFailed => 'Neuspjelo';

  @override
  String get serverStatus => 'Server';

  @override
  String get onServer => 'Čeka isporuku';

  @override
  String get deletedFromServer => 'Izbrisano';

  @override
  String get messageTypeText => 'Tekst';

  @override
  String get messageTypeImage => 'Slika';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Glas';

  @override
  String get messageTypeFile => 'Datoteka';

  @override
  String get indefinitely => 'Neograničeno';

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
      'Poruke se automatski brišu nakon ovog vremena';

  @override
  String get ephemeralImmediate => 'Odmah (nakon čitanja)';

  @override
  String get ephemeralImmediateDesc => 'Izbrisano čim se pročita';

  @override
  String get ephemeralMyPreference => 'Moja preferencija';

  @override
  String get ephemeralMyPreferenceDesc => 'Koristi globalne postavke';

  @override
  String get ephemeralDefaultSetting => 'Trajanje poruka';

  @override
  String get ephemeralChooseDefault => 'Preporučeno';

  @override
  String get ephemeral30Seconds => '30 sekundi';

  @override
  String get ephemeral30SecondsDesc => 'Izbrisano 30s nakon čitanja';

  @override
  String get ephemeral5Minutes => '5 minuta';

  @override
  String get ephemeral5MinutesDesc => 'Izbrisano 5min nakon čitanja';

  @override
  String get ephemeral1Hour => '1 sat';

  @override
  String get ephemeral1HourDesc => 'Izbrisano 1h nakon čitanja';

  @override
  String get ephemeral3Hours => '3 sata';

  @override
  String get ephemeral6Hours => '6 sati';

  @override
  String get ephemeral6HoursDesc => 'Izbrisano 6h nakon čitanja';

  @override
  String get ephemeral12Hours => '12 sati';

  @override
  String get ephemeral24Hours => '24 sata';

  @override
  String get ephemeral24HoursDesc => 'Izbrisano 24h nakon čitanja';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Prilagođeno trajanje';

  @override
  String get howItWorks => 'Kako funkcioniše';

  @override
  String get ephemeralExplanation1 =>
      'Poruke se brišu sa servera čim se prime.';

  @override
  String get ephemeralExplanation2 =>
      'Ova postavka određuje kada poruke nestaju sa VAŠEG telefona nakon čitanja.';

  @override
  String get ephemeralExplanation3 =>
      'Vaš kontakt ima svoju postavku za svoj telefon.';

  @override
  String get mute1Hour => '1 sat';

  @override
  String get mute8Hours => '8 sati';

  @override
  String get mute1Day => '1 dan';

  @override
  String get mute1Week => '1 sedmica';

  @override
  String get muteAlways => 'Uvijek';

  @override
  String get muteExplanation => 'Nećete primati obavještenja za ovaj kontakt';

  @override
  String get showCallsInRecents => 'Prikaži u nedavnim pozivima';

  @override
  String get showCallsInRecentsSubtitle =>
      'Hash pozivi se pojavljuju u historiji poziva telefona';

  @override
  String get feedback => 'Povratna informacija';

  @override
  String get muteNotifications => 'Utišaj obavještenja';

  @override
  String get muteDescription => 'Nećete primati obavještenja za ovaj kontakt';

  @override
  String mutedUntil(String time) {
    return 'Utišano do $time';
  }

  @override
  String get notMuted => 'Obavještenja aktivna';

  @override
  String get unmute => 'Uključi zvuk';

  @override
  String get notificationSound => 'Zvuk obavještenja';

  @override
  String get defaultSound => 'Zadani';

  @override
  String get chatSettings => 'Postavke chata';

  @override
  String get bubbleColor => 'Boja balončića';

  @override
  String get backgroundColor => 'Boja pozadine';

  @override
  String get backgroundImage => 'Slika pozadine';

  @override
  String get chatBackground => 'Pozadina chata';

  @override
  String get customColor => 'Prilagođena';

  @override
  String get defaultColor => 'Zadana';

  @override
  String get imageSelected => 'Slika odabrana';

  @override
  String get noImage => 'Nema slike';

  @override
  String get color => 'Boja';

  @override
  String get image => 'Slika';

  @override
  String get tapToSelectImage => 'Dodirnite da odaberete sliku';

  @override
  String get changeImage => 'Promijeni sliku';

  @override
  String get previewMessageReceived => 'Zdravo!';

  @override
  String get previewMessageSent => 'Ej, kako si!';

  @override
  String get messageAction => 'Poruka';

  @override
  String get callAction => 'Poziv';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Lične bilješke';

  @override
  String get addNotes => 'Dodaj bilješke...';

  @override
  String get noNotes => 'Nema bilješki';

  @override
  String get messageNotifications => 'Obavještenja o porukama';

  @override
  String get callNotifications => 'Obavještenja o pozivima';

  @override
  String get useGradient => 'Koristi gradijent';

  @override
  String get gradientStart => 'Početna boja';

  @override
  String get gradientEnd => 'Krajnja boja';

  @override
  String get preview => 'Pregled';

  @override
  String get reset => 'Resetuj';

  @override
  String get securityNumber => 'Sigurnosni broj';

  @override
  String securityNumberDescription(String name) {
    return 'Verifikujte da se sigurnosni broj podudara sa uređajem kontakta $name';
  }

  @override
  String get verifyEncryption => 'Verifikuj end-to-end enkripciju';

  @override
  String get tapToCopy => 'Dodirnite za kopiranje';

  @override
  String get howToVerify => 'Kako verifikovati';

  @override
  String get verifyStep1 => 'Sretnite se sa kontaktom lično ili ga pozovite';

  @override
  String get verifyStep2 =>
      'Uporedite sigurnosne brojeve ili skenirajte QR kodove';

  @override
  String get verifyStep3 => 'Ako se podudaraju, vaš chat je siguran';

  @override
  String get scanToVerify => 'Skeniraj za verifikaciju';

  @override
  String get reportSpam => 'Prijavi spam';

  @override
  String get reportSpamSubtitle => 'Prijavite ovaj kontakt kao spam';

  @override
  String get reportSpamDescription =>
      'Ovaj kontakt će biti anonimno prijavljen. Vaš identitet neće biti podijeljen. Jeste li sigurni?';

  @override
  String get report => 'Prijavi';

  @override
  String get spamReported => 'Spam prijavljen';

  @override
  String get reportError =>
      'Slanje prijave nije uspjelo. Molimo pokušajte ponovo.';

  @override
  String get reportRateLimited =>
      'Dostigli ste maksimalan broj prijava za danas.';

  @override
  String get blockContact => 'Blokiraj kontakt';

  @override
  String get blockContactDescription =>
      'Ovaj kontakt vam više neće moći slati poruke ili vas pozivati. Neće biti obaviješten.';

  @override
  String get unblockContact => 'Odblokiraj kontakt';

  @override
  String get unblockContactDescription =>
      'Ovaj kontakt će vam ponovo moći slati poruke i pozivati vas.';

  @override
  String get contactBlocked => 'Kontakt blokiran';

  @override
  String get contactUnblocked => 'Kontakt odblokiran';

  @override
  String get contactIsBlocked => 'Ovaj kontakt je blokiran';

  @override
  String get unblock => 'Odblokiraj';

  @override
  String get deleteContactSubtitle => 'Izbriši ovaj kontakt i chat';

  @override
  String get confirmWithPin => 'Potvrdi PIN-om';

  @override
  String get enterPinToConfirm => 'Unesite PIN da potvrdite ovu radnju';

  @override
  String get profilePhoto => 'Profilna fotografija';

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
      'Djelomično maskiran za vašu sigurnost i privatnost kontakta';

  @override
  String get addFirstContact => 'Dodajte prvi kontakt';

  @override
  String get addFirstContactSubtitle =>
      'Podijelite QR kod ili skenirajte prijateljev';

  @override
  String get directory => 'Imenik';

  @override
  String get noContacts => 'Nema kontakata';

  @override
  String get noContactsSubtitle => 'Dodajte kontakt da započnete';

  @override
  String get sendMessageAction => 'Pošalji poruku';

  @override
  String get audioCall => 'Audio poziv';

  @override
  String get videoCall => 'Video poziv';

  @override
  String get viewProfile => 'Pogledaj profil';

  @override
  String get deleteContactDirectory => 'Izbriši kontakt';

  @override
  String get scanShort => 'Skeniraj';

  @override
  String get addShort => 'Dodaj';

  @override
  String deleteContactConfirmName(String name) {
    return 'Jeste li sigurni da želite izbrisati $name?';
  }

  @override
  String get noNotesTitle => 'Nema bilješki';

  @override
  String get noNotesSubtitle => 'Kreirajte prvu bilješku';

  @override
  String get newNote => 'Nova bilješka';

  @override
  String get editNote => 'Uredi bilješku';

  @override
  String get deleteNote => 'Izbriši bilješku';

  @override
  String get deleteNoteConfirm =>
      'Jeste li sigurni da želite izbrisati ovu bilješku?';

  @override
  String get noteTitle => 'Naslov';

  @override
  String get noteContent => 'Sadržaj';

  @override
  String get addItem => 'Dodaj stavku';

  @override
  String get pinNote => 'Zakači';

  @override
  String get unpinNote => 'Otkači';

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
  String get protectedNote => 'Zaštićena bilješka';

  @override
  String get incorrectPassword => 'Neispravna lozinka';

  @override
  String get passwordSet => 'Lozinka postavljena';

  @override
  String get passwordRemoved => 'Lozinka uklonjena';

  @override
  String get notesBiometric => 'Face ID za bilješke';

  @override
  String get notesBiometricSubtitle =>
      'Zahtijevaj biometrijsku autentikaciju za otvaranje zaštićenih bilješki';

  @override
  String get textNote => 'Tekstualna bilješka';

  @override
  String get checklistNote => 'Lista zadataka';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total zadataka';
  }

  @override
  String get autoSaved => 'Sačuvano';

  @override
  String get searchNotes => 'Traži bilješke';

  @override
  String get legalConsent => 'Pravna saglasnost';

  @override
  String get confirmAge13 => 'Potvrđujem da imam najmanje 13 godina';

  @override
  String get acceptLegalStart => 'Prihvatam ';

  @override
  String get privacyPolicy => 'Politiku privatnosti';

  @override
  String get termsOfService => 'Uslove korištenja';

  @override
  String get andThe => ' i ';

  @override
  String get continueButton => 'Nastavi';

  @override
  String get mustAcceptTerms => 'Morate prihvatiti oba uslova da nastavite';

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
  String get support => 'Podrška';

  @override
  String get contactSupport => 'Kontaktiraj podršku';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Prijavi zloupotrebu';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Pravno';

  @override
  String get legalEntity => 'Pravni subjekt';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Zakači';

  @override
  String get unpinConversation => 'Otkači';

  @override
  String get hideConversation => 'Ukloni iz feeda';

  @override
  String get deleteConversation => 'Izbriši razgovor';

  @override
  String get deleteConversationConfirm =>
      'Unesite PIN da potvrdite brisanje svih poruka';

  @override
  String get noConversations => 'Još nema razgovora';

  @override
  String get startConversation => 'Započni';

  @override
  String get microphonePermissionRequired => 'Potreban pristup mikrofonu';

  @override
  String get microphonePermissionExplanation =>
      'Hash treba mikrofon za upućivanje poziva.';

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
  String get openSettings => 'Otvori postavke';

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
  String get callRemoteMicMuted => 'Mikrofon kontakta je utišan';

  @override
  String get callMiniControlsMute => 'Utišaj';

  @override
  String get callMiniControlsUnmute => 'Uključi zvuk';

  @override
  String get callMiniControlsHangUp => 'Prekini';

  @override
  String get callMiniControlsReturn => 'Vrati se na poziv';

  @override
  String get callNetworkPoor => 'Nestabilna veza';

  @override
  String get callNetworkLost => 'Veza izgubljena';

  @override
  String get callEndedTitle => 'Poziv završen';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Podaci uređaja';

  @override
  String get deviceDataSubtitle => 'Lokalno i serversko skladištenje';

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
  String get localStorage => 'Lokalno skladištenje';

  @override
  String get onThisDevice => 'na ovom uređaju';

  @override
  String get encryptedDatabases => 'Enkriptovane baze podataka';

  @override
  String get files => 'Datoteke';

  @override
  String get secureKeychain => 'Sigurni privjesak ključeva';

  @override
  String get cache => 'Keš';

  @override
  String get contactsDetail => 'Imena, avatari, Signal ključevi';

  @override
  String get messagesDetail => 'Enkriptovani razgovori';

  @override
  String get notesDetail => 'Lične bilješke';

  @override
  String get signalSessions => 'Signal sesije';

  @override
  String get signalSessionsDetail => 'Sesije enkripcije';

  @override
  String get pendingContacts => 'Kontakti na čekanju';

  @override
  String get pendingContactsDetail => 'Zahtjevi na čekanju';

  @override
  String get callHistory => 'Pozivi';

  @override
  String get callHistoryDetail => 'Historija poziva';

  @override
  String get preferences => 'Preferencije';

  @override
  String get preferencesDetail => 'Medijske i pozivne preferencije';

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
  String get signalKeys => 'Signal Protocol ključevi';

  @override
  String get authTokens => 'Tokeni autentikacije';

  @override
  String get contactNamesCache => 'Keš imena kontakata';

  @override
  String get remoteConfig => 'Udaljena konfiguracija';

  @override
  String get notificationPrefs => 'Preferencije obavještenja';

  @override
  String get serverData => 'Podaci na serveru';

  @override
  String get serverDataInfo =>
      'Hash čuva minimalne podatke na serveru, sve enkriptovano ili privremeno.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail =>
      'Hash ID, javni ključevi, token poštanskog sandučeta';

  @override
  String get serverPrekeys => 'Pred-ključevi';

  @override
  String get serverPrekeysDetail => 'Jednokratni Signal ključevi (potrošeni)';

  @override
  String get serverMessages => 'Poruke u tranzitu';

  @override
  String get serverMessagesDetail => 'Izbrisane nakon isporuke (maks 24h)';

  @override
  String get serverMedia => 'Mediji u tranzitu';

  @override
  String get serverMediaDetail => 'Izbrisani nakon preuzimanja';

  @override
  String get serverContactRequests => 'Zahtjevi za kontakt';

  @override
  String get serverContactRequestsDetail => 'Ističu nakon 24h';

  @override
  String get serverRateLimits => 'Ograničenja brzine';

  @override
  String get serverRateLimitsDetail => 'Privremeni podaci protiv zloupotrebe';

  @override
  String get privacyReassurance =>
      'Hash ne može čitati vaše poruke. Svi podaci su end-to-end enkriptovani. Serverski podaci se automatski brišu.';

  @override
  String get pinTooSimple =>
      'Ovaj PIN je previše jednostavan. Odaberite sigurniji kod.';

  @override
  String get genericError => 'Došlo je do greške. Molimo pokušajte ponovo.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nije moguće kreirati račun: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraza kopirana u međuspremnik';

  @override
  String get copyPhrase => 'Kopiraj frazu';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Zapišite ovu frazu na sigurno mjesto. Ako izgubite PIN bez ove fraze, trajno ćete izgubiti pristup podacima.';

  @override
  String get noMessages => 'Nema poruka';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Izbrisati sve poruke sa $name?';
  }

  @override
  String get confirmation => 'Potvrda';

  @override
  String get untitled => 'Bez naslova';

  @override
  String get noSessions => 'Nema sesija';

  @override
  String get unknownContact => 'Nepoznat kontakt';

  @override
  String get unnamed => 'Bez imena';

  @override
  String get noPendingRequestsAlt => 'Nema zahtjeva na čekanju';

  @override
  String get deleteAllCallHistory => 'Izbrisati cijelu historiju poziva?';

  @override
  String get noCalls => 'Nema poziva';

  @override
  String get noPreferences => 'Nema preferencija';

  @override
  String get resetAllMediaPrefs => 'Resetovati sve medijske preferencije?';

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
  String get callReasonCompleted => 'Završen';

  @override
  String get callReasonMissed => 'Propušten';

  @override
  String get callReasonDeclined => 'Odbijen';

  @override
  String get callReasonFailed => 'Neuspjeo';

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
  String get statusQueued => 'U redu čekanja';

  @override
  String get blockedBadge => 'Blokirano';

  @override
  String get protectedBadge => 'Zaštićeno';

  @override
  String messageCount(int count) {
    return '$count poruka';
  }

  @override
  String get deleteQuestion => 'Izbrisati?';

  @override
  String get transferMyAccountTitle => 'Prebaci moj račun';

  @override
  String get loadingError => 'Greška pri učitavanju';

  @override
  String get transferToNewDevice => 'Prebaci na novi uređaj';

  @override
  String get transferInstructions =>
      'Na novom uređaju odaberite \"Oporavi moj račun\" i unesite ove informacije:';

  @override
  String get yourHashIdLabel => 'Vaš Hash ID';

  @override
  String get enterYourPinCode => 'Unesite vaš PIN kod';

  @override
  String get pinOwnerConfirmation => 'Da potvrdite da ste vlasnik ovog računa';

  @override
  String get scanThisQrCode => 'Skenirajte ovaj QR kod';

  @override
  String get withYourNewDevice => 'Sa vašim novim uređajem';

  @override
  String get orEnterTheCode => 'ili unesite kod';

  @override
  String get transferCodeLabel => 'Kod za prijenos';

  @override
  String get proximityVerification => 'Verifikacija blizine';

  @override
  String get bringDevicesCloser => 'Približite oba uređaja';

  @override
  String get confirmTransferQuestion => 'Potvrditi prijenos?';

  @override
  String get accountWillBeTransferred =>
      'Vaš račun će biti prebačen na novi uređaj.\n\nOvaj uređaj će biti trajno isključen.';

  @override
  String get transferComplete => 'Prijenos završen';

  @override
  String get transferSuccessMessage =>
      'Vaš račun je uspješno prebačen.\n\nOva aplikacija će se sada zatvoriti.';

  @override
  String get manualVerification => 'Ručna verifikacija';

  @override
  String get codeDisplayedOnBothDevices => 'Kod prikazan na oba uređaja:';

  @override
  String get doesCodeMatchNewDevice =>
      'Podudara li se ovaj kod sa kodom na novom uređaju?';

  @override
  String get verifiedStatus => 'Verifikovano';

  @override
  String get inProgressStatus => 'U toku...';

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
    return 'Ističe za $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometrija nije dostupna na ovom uređaju';

  @override
  String get biometricAuthError => 'Greška pri biometrijskoj autentikaciji';

  @override
  String get authenticateForBiometric =>
      'Molimo autentikujte se da aktivirate biometriju';

  @override
  String get biometricAuthFailed => 'Biometrijska autentikacija nije uspjela';

  @override
  String get forceUpdateTitle => 'Potrebno ažuriranje';

  @override
  String get forceUpdateMessage =>
      'Dostupna je nova verzija Hash-a. Molimo ažurirajte da nastavite.';

  @override
  String get updateButton => 'Ažuriraj';

  @override
  String get maintenanceInProgress => 'Održavanje u toku';

  @override
  String get tryAgainLater => 'Molimo pokušajte ponovo kasnije';

  @override
  String get information => 'Informacija';

  @override
  String get later => 'Kasnije';

  @override
  String get doYouLikeHash => 'Sviđa li vam se Hash?';

  @override
  String get yourFeedbackHelps =>
      'Vaše mišljenje nam pomaže da poboljšamo aplikaciju';

  @override
  String get ratingTerrible => 'Užasno';

  @override
  String get ratingBad => 'Loše';

  @override
  String get ratingOk => 'Okej';

  @override
  String get ratingGood => 'Dobro';

  @override
  String get ratingExcellent => 'Odlično!';

  @override
  String get donationMessage =>
      'Hash je neprofitni projekat. Vaša podrška nam pomaže da nastavimo graditi zaista privatni komunikator.';

  @override
  String get recentConnections => 'Nedavne konekcije';

  @override
  String get loginInfoText =>
      'Svako otključavanje PIN-om se lokalno bilježi. Čuvaju se samo posljednja 24 sata.';

  @override
  String get connectionCount => 'Konekcija(e)';

  @override
  String get periodLabel => 'Period';

  @override
  String get historyLabel => 'Historija';

  @override
  String get noLoginRecorded => 'Nema zabilježenih prijava';

  @override
  String get nextUnlocksAppearHere =>
      'Sljedeća otključavanja će se pojaviti ovdje.';

  @override
  String get dataLocalOnly =>
      'Ovi podaci se čuvaju samo na vašem uređaju i nikada se ne prenose.';

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
  String get noMaintenancePlanned => 'Nema planiranog održavanja';

  @override
  String get everythingWorkingNormally => 'Sve funkcioniše normalno';

  @override
  String get maintenanceTitle => 'Održavanje';

  @override
  String get maintenanceActiveLabel => 'U TOKU';

  @override
  String get maintenancePlannedLabel => 'PLANIRANO';

  @override
  String get locking => 'Zaključavanje...';

  @override
  String get newMessageNotification => 'Nova poruka';

  @override
  String get secExplainTitle => 'Kako vas Hash štiti';

  @override
  String get secExplainIntro =>
      'Hash je dizajniran tako da niko ne može čitati vaše poruke.';

  @override
  String get secExplainIntroSub =>
      'Čak ni mi.\nEvo kako funkcioniše, objašnjeno jednostavno.';

  @override
  String get secJourneyLabel => 'PUTOVANJE';

  @override
  String get secJourneyTitle => 'Putovanje vaše poruke';

  @override
  String get secJourneySubtitle =>
      'Od vašeg prsta do ekrana kontakta, svaki korak je zaštićen. Pratite put.';

  @override
  String get secStep1Title => 'Pišete svoju poruku';

  @override
  String get secStep1Desc =>
      'Kucate \"Zdravo!\" u aplikaciji. U tom trenutku, poruka postoji samo u memoriji vašeg telefona. Ništa nije poslano.';

  @override
  String get secStep2Title => 'Enkripcija sa Signal Protocol';

  @override
  String get secStep2Desc =>
      'Čim pritisnete \"Pošalji\", vaša poruka se pretvara u niz nerazumljivih znakova. Kao da je vaša poruka zaključana u sef čiji ključ ima samo vaš kontakt.';

  @override
  String get secStep3Title => 'Sealed Sender: nevidljiva koverta';

  @override
  String get secStep3Desc =>
      'Zamislite da šaljete pismo poštom, ali bez adrese pošiljaoca na koverti. Tačno to radi Hash. Poruka se ubacuje u anonimno poštansko sanduče. Server ne zna ko ju je poslao.';

  @override
  String get secStep4Title => 'Server ne vidi ništa';

  @override
  String get secStep4Desc =>
      'Server igra ulogu slijepog poštara. Zna samo \"neko je ubacio nešto u sanduče #A7X9\". Ne zna ko je poslao, šta je, ni kome je namijenjeno.';

  @override
  String get secStep4Highlight =>
      'Nikakvi metapodaci se ne čuvaju: ni IP adresa, ni vremenski pečat, ni veza između pošiljaoca i primaoca.';

  @override
  String get secStep5Title => 'Vaš kontakt prima poruku';

  @override
  String get secStep5Desc =>
      'Telefon vašeg kontakta preuzima sadržaj iz svog anonimnog sandučeta i dešifruje poruku svojim privatnim ključem, koji nikada nije napustio uređaj. \"Zdravo!\" se pojavljuje na ekranu.';

  @override
  String get secStep6Title => 'Poruka nestaje sa servera';

  @override
  String get secStep6Desc =>
      'Čim vaš kontakt potvrdi prijem, server trajno briše poruku. Nema kante za otpatke, arhive, ni sigurnosne kopije. Čak se i nepročitane poruke automatski uništavaju nakon 24 sata.';

  @override
  String get secStep7Title => 'Lokalno istjecanje';

  @override
  String get secStep7Desc =>
      'Na telefonu kontakta, poruka se sama uništava prema trajanju koje ste odabrali: odmah nakon čitanja, 5 minuta, 1 sat... vi odlučujete.';

  @override
  String get secJourneyConclusion =>
      'Rezultat: nula tragova na serveru, nula tragova na uređajima. Poruka je postojala samo dovoljno dugo da bude pročitana, a onda je nestala.';

  @override
  String get secArchLabel => 'ARHITEKTURA';

  @override
  String get secArchTitle => '5 slojeva zaštite';

  @override
  String get secArchSubtitle =>
      'Hash se ne oslanja na jednu tehnologiju. Svaki sloj pojačava ostale. Čak i ako je jedan sloj kompromitovan, vaši podaci ostaju sigurni.';

  @override
  String get secLayer1Title => 'End-to-end enkripcija';

  @override
  String get secLayer1Desc =>
      'Svaka poruka je enkriptovana jedinstvenim ključem. Jednostavno rečeno: čak i ako neko dešifruje jednu poruku, neće moći dešifrovati sljedeću. Svaka poruka ima svoju bravu.';

  @override
  String get secLayer1Detail =>
      'Za datoteke (fotografije, videe, dokumente), Hash koristi dodatnu AES-256-GCM enkripciju. Datoteka je enkriptovana prije nego što napusti vaš telefon.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimnost mreže)';

  @override
  String get secLayer2Desc =>
      'Obični komunikatori šalju vaše poruke s vašim identitetom. Kao da pišete ime na koverti. Hash koristi anonimna poštanska sandučad: server dostavlja poruku ne znajući ko ju je poslao.';

  @override
  String get secLayer2Detail =>
      'Rezultat: čak i u slučaju curenja podataka sa servera, nemoguće je rekonstruisati ko priča s kim.';

  @override
  String get secLayer3Title => 'Automatsko brisanje';

  @override
  String get secLayer3Desc =>
      'Poruke se brišu sa servera čim se potvrdi prijem. Čak i ako poruka nikada nije preuzeta, automatski se uništava nakon 24 sata.';

  @override
  String get secLayer3Detail =>
      'Na vašem telefonu, poruke se same uništavaju prema trajanju koje odaberete: odmah, 5 min, 15 min, 30 min, 1h, 3h, 6h ili 12h.';

  @override
  String get secLayer4Title => 'Zaštita lokalnog pristupa';

  @override
  String get secLayer4Desc =>
      'Aplikacija je zaštićena 6-cifrenim PIN-om i/ili biometrijom (Face ID, otisak prsta). Nakon previše neuspjelih pokušaja, aplikacija se zaključava sa rastućom odgodom nakon svakog neuspjeha.';

  @override
  String get secLayer5Title => 'Zaključana baza podataka';

  @override
  String get secLayer5Desc =>
      'Na strani servera, nijedan korisnik ne može direktno pisati u bazu podataka. Sve radnje prolaze kroz sigurne funkcije koje verificiraju svaki zahtjev.';

  @override
  String get secLayer5Detail =>
      'To je kao šalter u banci: nikada ne dodirujete trezor sami. Podnesete zahtjev, a sistem provjerava imate li pravo prije nego djeluje.';

  @override
  String get secVashLabel => 'JEDINSTVEN U SVIJETU';

  @override
  String get secVashTitle => 'Vash mod';

  @override
  String get secVashSubtitle =>
      'Hitni sigurnosni sistem koji ne postoji ni u jednoj drugoj aplikaciji za poruke.';

  @override
  String get secVashScenarioTitle => 'Zamislite ovu situaciju';

  @override
  String get secVashScenario1 => 'Neko pristupa vašem telefonu';

  @override
  String get secVashScenario2 => 'Od vas traže PIN kod';

  @override
  String get secVashScenario3 => 'Želite hitno obrisati sve podatke';

  @override
  String get secVashSolutionTitle => 'Rješenje: dva PIN koda';

  @override
  String get secVashSolutionDesc =>
      'Konfigurišete dva različita PIN koda u Hash-u:';

  @override
  String get secVashNormalCodeLabel => 'Normalni kod';

  @override
  String get secVashNormalCodeDesc =>
      'Otvara aplikaciju normalno sa svim vašim podacima';

  @override
  String get secVashCodeLabel2 => 'Vash kod';

  @override
  String get secVashCodeDescription =>
      'Otvara aplikaciju normalno... ali svi vaši podaci se tiho brišu u pozadini';

  @override
  String get secVashWhatHappensTitle => 'Šta se dalje dešava';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikacija se otvara normalno. Nema upozorenja, nema sumnjive animacije. Ekran jednostavno prikazuje praznu aplikaciju, kao da ste je upravo instalirali.\n\nU stvarnosti, svi vaši razgovori, kontakti i poruke su nepovratno izbrisani u djeliću sekunde.';

  @override
  String get secCallsLabel => 'POZIVI I DATOTEKE';

  @override
  String get secCallsTitle => 'Sve je enkriptovano';

  @override
  String get secCallsSubtitle =>
      'Nisu samo poruke. Apsolutno sve što prolazi kroz Hash je end-to-end enkriptovano.';

  @override
  String get secAudioCallTitle => 'Audio pozivi';

  @override
  String get secAudioCallDesc =>
      'End-to-end enkriptovani putem WebRTC. Glas se prenosi direktno između uređaja.';

  @override
  String get secVideoCallTitle => 'Video pozivi';

  @override
  String get secVideoCallDesc =>
      'Ista tehnologija, svaki stream enkriptovan pojedinačno.';

  @override
  String get secPhotosTitle => 'Fotografije i videi';

  @override
  String get secPhotosDesc =>
      'Enkriptovani u AES-256-GCM prije nego što napuste vaš telefon.';

  @override
  String get secDocsTitle => 'Dokumenti';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, bilo koja datoteka. Ime, veličina i sadržaj enkriptovani.';

  @override
  String get secAnonLabel => 'ANONIMNOST';

  @override
  String get secAnonTitle => 'Identitet nije potreban';

  @override
  String get secAnonSubtitle =>
      'Hash nikada ne traži vaš broj telefona ili email. Identifikovani ste jedinstvenim i anonimnim Hash ID-om.';

  @override
  String get secHashIdTitle => 'Vaš Hash ID';

  @override
  String get secHashIdDesc =>
      'Ovo je vaš jedinstveni identifikator. Ne otkriva ništa o vama: ni ime, ni broj, ni lokaciju. To je pseudonim koji je nemoguće povezati sa vašim pravim identitetom.\n\nDa dodate kontakt, dijelite svoj Hash ID ili skenirate QR kod. To je to. Bez sinhroniziranog imenika, bez prijedloga \"Ljudi koje možda poznajete\".';

  @override
  String get secDataLabel => 'PODACI';

  @override
  String get secDataTitle => 'Šta Hash ne zna';

  @override
  String get secDataSubtitle =>
      'Najbolji način da zaštitite podatke je da ih ne prikupljate.';

  @override
  String get secNeverCollected => 'Nikada prikupljeno';

  @override
  String get secNeverItem1 => 'Sadržaj poruka';

  @override
  String get secNeverItem2 => 'Lista kontakata';

  @override
  String get secNeverItem3 => 'Broj telefona';

  @override
  String get secNeverItem4 => 'Email adresa';

  @override
  String get secNeverItem5 => 'IP adresa';

  @override
  String get secNeverItem6 => 'Lokacija';

  @override
  String get secNeverItem7 => 'Metapodaci (ko priča s kim)';

  @override
  String get secNeverItem8 => 'Historija poziva';

  @override
  String get secNeverItem9 => 'Imenik';

  @override
  String get secNeverItem10 => 'Reklamni identifikatori';

  @override
  String get secTempStored => 'Privremeno pohranjeno';

  @override
  String get secTempItem1 => 'Anonimni Hash ID (jedinstveni identifikator)';

  @override
  String get secTempItem2 => 'Javni ključevi enkripcije';

  @override
  String get secTempItem3 => 'Enkriptovane poruke u tranzitu (maks 24h)';

  @override
  String get secTempNote =>
      'Čak ni ovi minimalni podaci vas ne mogu identificirati. Vaš Hash ID nije povezan ni sa kakvim ličnim informacijama.';

  @override
  String get secFooterTitle => 'Vaša privatnost, vaša sloboda';

  @override
  String get secFooterDesc =>
      'Hash koristi iste tehnologije enkripcije kao najzahtjevnije profesionalne aplikacije. Vaše poruke su zaštićene matematikom, ne obećanjima.';

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
