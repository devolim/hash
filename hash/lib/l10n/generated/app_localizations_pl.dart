// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Zero śladu. Zero kompromisu.';

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
  String get conversations => 'Czaty';

  @override
  String get contacts => 'Kontakty';

  @override
  String get noConversation => 'Brak czatów';

  @override
  String get noConversationSubtitle =>
      'Dodaj kontakt, aby zacząć bezpiecznie rozmawiać';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oczekujących zaproszeń',
      one: '1 oczekujące zaproszenie',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wysłanych zaproszeń oczekuje',
      one: '1 wysłane zaproszenie oczekuje',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Dodaj kontakt';

  @override
  String get shareApp => 'Udostępnij aplikację';

  @override
  String get newMessage => 'Nowa wiadomość';

  @override
  String get newConversation => 'Wyślij wiadomość';

  @override
  String get settings => 'Ustawienia';

  @override
  String get myHashId => 'Mój Hash ID';

  @override
  String get supportHash => 'Wesprzyj Hash';

  @override
  String get supportHashSubtitle => 'Hash jest projektem non-profit';

  @override
  String get donate => 'Wesprzyj';

  @override
  String get appearance => 'Wygląd';

  @override
  String get theme => 'Motyw';

  @override
  String get themeAuto => 'Automatyczny';

  @override
  String get themeAutoSubtitle => 'Dostosowuje się do ustawień systemu';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeRecommendation =>
      'Ciemny motyw jest zalecany dla lepszej prywatności';

  @override
  String get language => 'Język';

  @override
  String get languageAuto => 'Automatyczny (systemowy)';

  @override
  String get notifications => 'Powiadomienia';

  @override
  String get messages => 'Wiadomości';

  @override
  String get calls => 'Połączenia';

  @override
  String get vibration => 'Wibracja';

  @override
  String get notificationContent => 'Treść powiadomień';

  @override
  String get notificationContentFull => 'Pokaż wszystko';

  @override
  String get notificationContentFullDesc =>
      'Nazwa kontaktu i podgląd wiadomości';

  @override
  String get notificationContentName => 'Tylko nazwa';

  @override
  String get notificationContentNameDesc => 'Pokazuje tylko nazwę kontaktu';

  @override
  String get notificationContentDiscrete => 'Dyskretne';

  @override
  String get notificationContentDiscreteDesc =>
      'Pokazuje tylko \"Nowa wiadomość\"';

  @override
  String get security => 'Bezpieczeństwo';

  @override
  String get howHashProtectsYou => 'Jak Hash Cię chroni';

  @override
  String get howHashProtectsYouSubtitle => 'Zrozum swoje bezpieczeństwo';

  @override
  String get accountSecurity => 'Bezpieczeństwo konta';

  @override
  String get accountSecuritySubtitle => 'PIN, biometria, Tryb Vash';

  @override
  String get blockScreenshots => 'Blokuj zrzuty ekranu';

  @override
  String get transferDevice => 'Przenieś na inne urządzenie';

  @override
  String get transferDeviceSubtitle => 'Migruj swoje konto';

  @override
  String get pinCode => 'Kod PIN';

  @override
  String get changePin => 'Zmień kod PIN';

  @override
  String get currentPin => 'Obecny kod PIN';

  @override
  String get newPin => 'Nowy kod PIN';

  @override
  String get confirmPin => 'Potwierdź kod PIN';

  @override
  String get pinChanged => 'Kod PIN zmieniony';

  @override
  String get incorrectPin => 'Nieprawidłowy PIN';

  @override
  String get pinsDoNotMatch => 'Kody PIN nie pasują';

  @override
  String get autoLock => 'Automatyczna blokada';

  @override
  String get autoLockDelay => 'Opóźnienie blokady';

  @override
  String get autoLockImmediate => 'Natychmiast';

  @override
  String get autoLockMinute => '1 minuta';

  @override
  String autoLockMinutes(int count) {
    return '$count minut';
  }

  @override
  String get vashCode => 'Kod Vash';

  @override
  String get vashModeTitle => 'Tryb Vash';

  @override
  String get vashModeExplanation => 'Twoja ostateczna siatka bezpieczeństwa.';

  @override
  String get vashModeDescription =>
      'Wybierzesz drugi kod PIN. Jeśli kiedykolwiek zostaniesz zmuszony do otwarcia Hash, wpisz ten kod zamiast zwykłego PIN-u.\n\nAplikacja otworzy się normalnie, ale wszystkie rozmowy i kontakty znikną.\n\nDla każdego, kto patrzy na Twój ekran, Hash wygląda na pustą — jakbyś nigdy jej nie używał.';

  @override
  String get vashModeIrreversible => 'Ta czynność jest cicha i nieodwracalna.';

  @override
  String get chooseVashCode => 'Wybierz mój kod Vash';

  @override
  String get vashCodeInfo =>
      'Drugi kod PIN, który otwiera aplikację normalnie, ale pustą.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Jeśli wpiszesz ten kod zamiast PIN-u:';

  @override
  String get vashDeleteContacts => 'Twoje kontakty znikają';

  @override
  String get vashDeleteMessages => 'Twoje rozmowy znikają';

  @override
  String get vashDeleteHistory => 'Twoje notatki znikają';

  @override
  String get vashKeepId =>
      'Twoja tożsamość Hash (#XXX-XXX-XXX) pozostaje taka sama';

  @override
  String get vashAppearNormal =>
      'Aplikacja wygląda normalnie, ale pusto, jak nowa. Ta czynność jest nieodwracalna.';

  @override
  String get setupVashCode => 'Skonfiguruj kod Vash';

  @override
  String get modifyVashCode => 'Zmień kod Vash';

  @override
  String get currentVashCode => 'Obecny kod Vash';

  @override
  String get newVashCode => 'Nowy kod Vash';

  @override
  String get confirmVashCode => 'Potwierdź kod Vash';

  @override
  String get vashCodeConfigured => 'Kod Vash skonfigurowany';

  @override
  String get vashCodeModified => 'Kod Vash zmieniony';

  @override
  String get vashCodeMustDiffer => 'Kod Vash musi różnić się od PIN-u';

  @override
  String get incorrectVashCode => 'Nieprawidłowy kod Vash';

  @override
  String get vashWhatToDelete => 'Co Tryb Vash ma usunąć?';

  @override
  String get vashDeleteContactsOption => 'Kontakty';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Wiadomości';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notatki';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Tryb Vash aktywowany';

  @override
  String get vashCreateSubtitle => 'Wybierz kod inny niż główny PIN';

  @override
  String get vashConfirmSubtitle => 'Potwierdź swój kod Vash';

  @override
  String get pinCodeForEntry => 'Kod PIN do wejścia do aplikacji';

  @override
  String get vashCodeSection => 'Tryb Vash';

  @override
  String get biometric => 'Biometria';

  @override
  String get biometricUnlock => 'Odblokuj odciskiem palca lub Face ID';

  @override
  String get enableBiometric => 'Włącz biometrię';

  @override
  String get biometricWarningMessage =>
      'Włączając biometrię, nie będziesz mógł użyć kodu Vash do wejścia do aplikacji.\n\nKod Vash będzie można użyć tylko wtedy, gdy biometria zawiedzie (po kilku nieudanych próbach).\n\nCzy na pewno chcesz kontynuować?';

  @override
  String get understood => 'Rozumiem';

  @override
  String get shareAppSubtitle => 'Udostępnij Hash swoim bliskim';

  @override
  String get share => 'Udostępnij';

  @override
  String get danger => 'Niebezpieczeństwo';

  @override
  String get deleteAccount => 'Usuń moje konto';

  @override
  String get deleteAccountSubtitle => 'Nieodwracalna czynność';

  @override
  String get deleteAccountConfirmTitle => 'Usuń moje konto';

  @override
  String get deleteAccountConfirmMessage =>
      'Twoje konto zostanie trwale usunięte. Ta czynność jest nieodwracalna.\n\n• Wszystkie Twoje czaty\n• Wszystkie Twoje kontakty\n• Twój Hash ID\n\nBędziesz musiał utworzyć nowe konto.';

  @override
  String get deleteForever => 'Usuń trwale';

  @override
  String get cancel => 'Anuluj';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Tryb Vash aktywowany.';

  @override
  String deletionError(String error) {
    return 'Błąd usuwania: $error';
  }

  @override
  String get yourSecurity => 'Twoje bezpieczeństwo';

  @override
  String get securityInfo =>
      '• Szyfrowanie end-to-end (Signal Protocol)\n• Brak danych na naszych serwerach po dostarczeniu\n• Klucze przechowywane wyłącznie na Twoim urządzeniu\n• Kod PIN nigdy nie jest wysyłany na serwer';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Witaj';

  @override
  String get securityStatement1 => 'Twoje wiadomości są chronione.';

  @override
  String get securityStatement2 => 'Szyfrowanie end-to-end.';

  @override
  String get securityStatement3 => 'Zero śladu. Zero kompromisu.';

  @override
  String get securityStatement4 => 'Twoja prywatność to prawo.';

  @override
  String get accessBlocked => 'Dostęp zablokowany';

  @override
  String get tooManyAttempts => 'Zbyt wiele prób. Spróbuj ponownie później.';

  @override
  String get pleaseWait => 'Proszę czekać';

  @override
  String get waitDelay => 'Proszę poczekać na zakończenie opóźnienia';

  @override
  String attemptCount(int current, int max) {
    return 'Próba $current z $max';
  }

  @override
  String retryIn(String time) {
    return 'Ponów za $time';
  }

  @override
  String get forgotPin => 'Zapomniałeś PIN? Użyj frazy odzyskiwania';

  @override
  String get useRecoveryPhrase => 'Użyj frazy odzyskiwania';

  @override
  String get recoveryWarningTitle => 'Ostrzeżenie';

  @override
  String get recoveryWarningMessage => 'Odzyskiwanie konta spowoduje:';

  @override
  String get recoveryDeleteAllMessages => 'Usunięcie WSZYSTKICH wiadomości';

  @override
  String get recoveryWaitDelay => 'Wymagane oczekiwanie 1 godziny';

  @override
  String get recoveryKeepContacts => 'Zachowanie kontaktów';

  @override
  String get recoveryIrreversible =>
      'Ta czynność jest nieodwracalna. Twoje wiadomości zostaną trwale utracone.';

  @override
  String get iUnderstand => 'Rozumiem';

  @override
  String get accountRecovery => 'Odzyskiwanie konta';

  @override
  String get enterRecoveryPhrase =>
      'Wpisz 24 słowa frazy odzyskiwania, oddzielone spacjami.';

  @override
  String get recoveryPhraseHint => 'słowo1 słowo2 słowo3 ...';

  @override
  String get recover => 'Odzyskaj';

  @override
  String get recoveryPhraseRequired => 'Proszę wpisać frazę odzyskiwania';

  @override
  String get recoveryPhrase24Words => 'Fraza musi zawierać dokładnie 24 słowa';

  @override
  String get incorrectRecoveryPhrase => 'Nieprawidłowa fraza odzyskiwania';

  @override
  String get recoveryInitError => 'Błąd inicjalizacji odzyskiwania';

  @override
  String get securityDelay => 'Opóźnienie bezpieczeństwa';

  @override
  String get securityDelayMessage =>
      'Dla Twojego bezpieczeństwa wymagany jest okres oczekiwania przed utworzeniem nowego PIN-u.';

  @override
  String get timeRemaining => 'Pozostały czas';

  @override
  String get messagesDeletedForProtection =>
      'Twoje wiadomości zostały usunięte dla Twojej ochrony.';

  @override
  String get canCloseApp => 'Możesz zamknąć aplikację i wrócić później.';

  @override
  String get onboardingTitle1 => 'Witaj w Hash';

  @override
  String get onboardingSubtitle1 => 'Komunikator, który nie zostawia śladów';

  @override
  String get onboardingTitle2 => 'Pełne szyfrowanie';

  @override
  String get onboardingSubtitle2 =>
      'Twoje wiadomości są szyfrowane end-to-end protokołem Signal';

  @override
  String get onboardingTitle3 => 'Zero śladów';

  @override
  String get onboardingSubtitle3 =>
      'Wiadomości są usuwane z serwerów po dostarczeniu';

  @override
  String get onboardingTitle4 => 'Twoje bezpieczeństwo';

  @override
  String get onboardingSubtitle4 => 'Kod PIN, Tryb Vash i fraza odzyskiwania';

  @override
  String get getStarted => 'Rozpocznij';

  @override
  String get next => 'Dalej';

  @override
  String get skip => 'Pomiń';

  @override
  String get alreadyHaveAccount => 'Mam już konto';

  @override
  String get transferMyAccount => 'Przenieś moje konto';

  @override
  String get createPin => 'Utwórz kod PIN';

  @override
  String get createPinSubtitle =>
      'Ten kod będzie chronił dostęp do Twojej aplikacji';

  @override
  String get confirmYourPin => 'Potwierdź kod PIN';

  @override
  String get confirmPinSubtitle => 'Wpisz ponownie kod PIN';

  @override
  String get saveRecoveryPhrase => 'Fraza odzyskiwania';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Zapisz te 24 słowa w kolejności. Pozwolą Ci odzyskać konto, jeśli zapomnisz PIN-u.';

  @override
  String get phraseWritten => 'Zapisałem moją frazę';

  @override
  String get warningRecoveryPhrase =>
      'Jeśli zgubisz tę frazę i zapomnisz PIN-u, stracisz dostęp do konta.';

  @override
  String get accountTransferred => 'Konto przeniesione';

  @override
  String get accountTransferredMessage =>
      'Twoje konto zostało przeniesione na inne urządzenie. Ta sesja nie jest już ważna.';

  @override
  String get accountTransferredInfo =>
      'Jeśli nie zainicjowałeś tego przeniesienia, Twoje konto mogło zostać przejęte.';

  @override
  String get logout => 'Wyloguj się';

  @override
  String get transferAccount => 'Przenieś konto';

  @override
  String get transferAccountInfo =>
      'Przenieś konto Hash na nowe urządzenie. Bieżąca sesja zostanie unieważniona.';

  @override
  String get generateTransferCode => 'Generuj kod przeniesienia';

  @override
  String get transferCode => 'Kod przeniesienia';

  @override
  String transferCodeExpires(int minutes) {
    return 'Ten kod wygasa za $minutes minut';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Wpisz ten kod na nowym urządzeniu, aby przenieść konto.';

  @override
  String get generateNewCode => 'Generuj nowy kod';

  @override
  String get scanQrCode => 'Skanuj kod QR';

  @override
  String get scanQrCodeSubtitle => 'Skanuj kod QR kontaktu, aby go dodać';

  @override
  String get qrCodeDetected => 'Wykryto kod QR';

  @override
  String get invalidQrCode => 'Nieprawidłowy kod QR';

  @override
  String get cameraPermissionRequired => 'Wymagane pozwolenie na kamerę';

  @override
  String get myQrCode => 'Mój kod QR';

  @override
  String get myQrCodeSubtitle =>
      'Udostępnij ten kod QR, aby kontakty mogły Cię dodać';

  @override
  String get shareQrCode => 'Udostępnij';

  @override
  String get addContactTitle => 'Dodaj kontakt';

  @override
  String get addContactByHashId => 'Wpisz Hash ID kontaktu';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Szukaj';

  @override
  String get contactNotFound => 'Nie znaleziono kontaktu';

  @override
  String get contactAlreadyAdded => 'Ten kontakt jest już na Twojej liście';

  @override
  String get contactAdded => 'Kontakt dodany';

  @override
  String get myProfile => 'Mój profil';

  @override
  String get myProfileSubtitle =>
      'Udostępnij te informacje, aby inni mogli Cię dodać';

  @override
  String get temporaryCode => 'Kod tymczasowy';

  @override
  String temporaryCodeExpires(String time) {
    return 'Wygasa za $time';
  }

  @override
  String get codeExpired => 'Kod wygasł';

  @override
  String get generateNewCodeButton => 'Nowy kod';

  @override
  String get copyHashId => 'Kopiuj ID';

  @override
  String get copyCode => 'Kopiuj kod';

  @override
  String get copiedToClipboard => 'Skopiowano';

  @override
  String get showMyQrCode => 'Pokaż mój kod QR';

  @override
  String get orDivider => 'lub';

  @override
  String get openScanner => 'Otwórz skaner';

  @override
  String get addManually => 'Dodaj ręcznie';

  @override
  String get contactHashIdLabel => 'Hash ID kontaktu';

  @override
  String get temporaryCodeLabel => 'Kod tymczasowy';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Poproś kontakt o wygenerowanie kodu z profilu';

  @override
  String get verifyAndAdd => 'Zweryfikuj i dodaj';

  @override
  String get fillAllFields => 'Proszę wypełnić wszystkie pola';

  @override
  String get invalidHashIdFormat =>
      'Nieprawidłowy format ID (np.: 123-456-ABC)';

  @override
  String get userNotFound => 'Nie znaleziono użytkownika';

  @override
  String get cannotAddYourself => 'Nie możesz dodać samego siebie';

  @override
  String get invalidOrExpiredCode => 'Nieprawidłowy lub wygasły kod tymczasowy';

  @override
  String get contactFound => 'Kontakt znaleziony!';

  @override
  String get howToCallContact => 'Jak chcesz go nazwać?';

  @override
  String get contactNameHint => 'Nazwa kontaktu';

  @override
  String get addContactButton => 'Dodaj';

  @override
  String get contactDetails => 'Szczegóły kontaktu';

  @override
  String get contactName => 'Nazwa kontaktu';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Dodano $date';
  }

  @override
  String get deleteContact => 'Usuń kontakt';

  @override
  String deleteContactConfirm(Object name) {
    return 'Usunąć ten kontakt?';
  }

  @override
  String get deleteContactMessage =>
      'Spowoduje to również usunięcie całego czatu.';

  @override
  String get delete => 'Usuń';

  @override
  String get typeMessage => 'Napisz wiadomość...';

  @override
  String get messageSent => 'Wysłano';

  @override
  String get messageDelivered => 'Dostarczono';

  @override
  String get messageRead => 'Przeczytano';

  @override
  String get messageFailed => 'Nie udało się wysłać';

  @override
  String get now => 'Teraz';

  @override
  String minutesAgo(int count) {
    return '${count}min';
  }

  @override
  String hoursAgo(int count) {
    return '${count}godz';
  }

  @override
  String daysAgo(int count) {
    return '${count}d';
  }

  @override
  String get today => 'Dzisiaj';

  @override
  String get yesterday => 'Wczoraj';

  @override
  String dateAtTime(String date, String time) {
    return '$date o $time';
  }

  @override
  String get shareMessage =>
      'Dołącz do mnie na Hash! 🔒\n\nTo naprawdę prywatny komunikator: pełne szyfrowanie, zero śladów na serwerach i tryb paniki w razie potrzeby.\n\nPobierz aplikację tutaj 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Błąd';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Zobacz';

  @override
  String get yes => 'Tak';

  @override
  String get no => 'Nie';

  @override
  String get save => 'Zapisz';

  @override
  String get edit => 'Edytuj';

  @override
  String get close => 'Zamknij';

  @override
  String get confirm => 'Potwierdź';

  @override
  String get loading => 'Ładowanie...';

  @override
  String get retry => 'Ponów';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Oczekujące zaproszenia';

  @override
  String get noPendingRequests => 'Brak oczekujących zaproszeń';

  @override
  String get pendingRequestsSubtitle => 'Te osoby chcą Cię dodać';

  @override
  String requestFromUser(String hashId) {
    return 'Zaproszenie od $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Wygasa za $days dni';
  }

  @override
  String get acceptRequest => 'Akceptuj';

  @override
  String get rejectRequest => 'Odrzuć';

  @override
  String get requestAccepted => 'Zaproszenie zaakceptowane';

  @override
  String get requestRejected => 'Zaproszenie odrzucone';

  @override
  String get requestSent => 'Zaproszenie wysłane!';

  @override
  String get requestSentSubtitle =>
      'Twoje zaproszenie zostało wysłane. Użytkownik musi je zaakceptować, zanim będziecie mogli rozmawiać.';

  @override
  String get requestAlreadyPending => 'Zaproszenie już oczekuje';

  @override
  String get requestAlreadySentByOther => 'Ta osoba już wysłała Ci zaproszenie';

  @override
  String get addByHashId => 'Dodaj przez Hash ID';

  @override
  String get addByHashIdSubtitle => 'Wpisz Hash ID kontaktu i kod tymczasowy';

  @override
  String get enterTemporaryCode => 'Wpisz 6-cyfrowy kod';

  @override
  String get sendRequest => 'Wyślij zaproszenie';

  @override
  String get acceptContactTitle => 'Akceptuj kontakt';

  @override
  String get acceptContactSubtitle => 'Możesz nadać mu własną nazwę';

  @override
  String get leaveEmptyForHashId => 'Pozostaw puste, aby użyć Hash ID';

  @override
  String get firstName => 'Imię';

  @override
  String get lastName => 'Nazwisko';

  @override
  String get notes => 'Notatki';

  @override
  String get notesHint => 'Osobiste notatki o tym kontakcie';

  @override
  String get photoOptional => 'Zdjęcie (opcjonalne)';

  @override
  String get contactNameOptional => 'Nazwa (opcjonalna)';

  @override
  String get notesOptional => 'Notatki (opcjonalne)';

  @override
  String get storedLocally => 'Przechowywane tylko na Twoim urządzeniu';

  @override
  String get encryptedMessageLabel => 'Zaszyfrowana wiadomość';

  @override
  String get identityMessageHint => 'Kim jesteś? Skąd się znacie?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ta wiadomość zostanie zaszyfrowana i wysłana do odbiorcy';

  @override
  String get sendRequestButton => 'Wyślij zaproszenie';

  @override
  String get requestExpiresIn24h =>
      'Zaproszenie wygasa po 24h, jeśli nie zostanie zaakceptowane';

  @override
  String get theyAlreadySentYouRequest => 'Ta osoba już wysłała Ci zaproszenie';

  @override
  String get requests => 'Zaproszenia';

  @override
  String get receivedRequests => 'Otrzymane';

  @override
  String get sentRequests => 'Wysłane';

  @override
  String get noSentRequests => 'Brak wysłanych zaproszeń';

  @override
  String get cancelRequest => 'Anuluj';

  @override
  String get deleteRequest => 'Usuń zaproszenie';

  @override
  String get requestCancelled => 'Zaproszenie anulowane';

  @override
  String sentTo(String hashId) {
    return 'Wysłane do $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Wygasa za $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Otrzymano $time temu';
  }

  @override
  String get messageFromRequester => 'Wiadomość od nadawcy';

  @override
  String get copy => 'Kopiuj';

  @override
  String get messageInfo => 'Informacje o wiadomości';

  @override
  String get messageDirection => 'Kierunek';

  @override
  String get messageSentByYou => 'Wysłane przez Ciebie';

  @override
  String get messageReceived => 'Otrzymano';

  @override
  String get messageSentAt => 'Wysłano';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Status';

  @override
  String get messageReadAt => 'Przeczytano';

  @override
  String get messageType => 'Typ';

  @override
  String get messageSize => 'Rozmiar';

  @override
  String get messageExpiresAt => 'Wygasa';

  @override
  String get messageEncrypted => 'Szyfrowanie end-to-end';

  @override
  String get messageStatusSending => 'Wysyłanie...';

  @override
  String get messageStatusSent => 'Wysłano';

  @override
  String get messageStatusDelivered => 'Dostarczono';

  @override
  String get messageStatusRead => 'Przeczytano';

  @override
  String get messageStatusFailed => 'Niepowodzenie';

  @override
  String get serverStatus => 'Serwer';

  @override
  String get onServer => 'Oczekuje na dostarczenie';

  @override
  String get deletedFromServer => 'Usunięto';

  @override
  String get messageTypeText => 'Tekst';

  @override
  String get messageTypeImage => 'Obraz';

  @override
  String get messageTypeVideo => 'Wideo';

  @override
  String get messageTypeVoice => 'Głos';

  @override
  String get messageTypeFile => 'Plik';

  @override
  String get indefinitely => 'Bezterminowo';

  @override
  String get hoursShort => 'godz';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'godzin';

  @override
  String get minutes => 'minut';

  @override
  String get seconds => 'sekund';

  @override
  String get ephemeralMessages => 'Wiadomości znikające';

  @override
  String get ephemeralMessagesDescription =>
      'Wiadomości są automatycznie usuwane po tym czasie';

  @override
  String get ephemeralImmediate => 'Natychmiast (po przeczytaniu)';

  @override
  String get ephemeralImmediateDesc => 'Usuwane zaraz po przeczytaniu';

  @override
  String get ephemeralMyPreference => 'Moje preferencje';

  @override
  String get ephemeralMyPreferenceDesc => 'Użyj globalnego ustawienia';

  @override
  String get ephemeralDefaultSetting => 'Czas trwania wiadomości';

  @override
  String get ephemeralChooseDefault => 'Zalecane';

  @override
  String get ephemeral30Seconds => '30 sekund';

  @override
  String get ephemeral30SecondsDesc => 'Usuwane 30s po przeczytaniu';

  @override
  String get ephemeral5Minutes => '5 minut';

  @override
  String get ephemeral5MinutesDesc => 'Usuwane 5min po przeczytaniu';

  @override
  String get ephemeral1Hour => '1 godzina';

  @override
  String get ephemeral1HourDesc => 'Usuwane 1h po przeczytaniu';

  @override
  String get ephemeral3Hours => '3 godziny';

  @override
  String get ephemeral6Hours => '6 godzin';

  @override
  String get ephemeral6HoursDesc => 'Usuwane 6h po przeczytaniu';

  @override
  String get ephemeral12Hours => '12 godzin';

  @override
  String get ephemeral24Hours => '24 godziny';

  @override
  String get ephemeral24HoursDesc => 'Usuwane 24h po przeczytaniu';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Niestandardowy czas';

  @override
  String get howItWorks => 'Jak to działa';

  @override
  String get ephemeralExplanation1 =>
      'Wiadomości są usuwane z serwera zaraz po odebraniu.';

  @override
  String get ephemeralExplanation2 =>
      'To ustawienie określa, kiedy wiadomości znikają z TWOJEGO telefonu po przeczytaniu.';

  @override
  String get ephemeralExplanation3 =>
      'Twój kontakt ma własne ustawienie dla swojego telefonu.';

  @override
  String get mute1Hour => '1 godzina';

  @override
  String get mute8Hours => '8 godzin';

  @override
  String get mute1Day => '1 dzień';

  @override
  String get mute1Week => '1 tydzień';

  @override
  String get muteAlways => 'Zawsze';

  @override
  String get muteExplanation =>
      'Nie będziesz otrzymywać powiadomień od tego kontaktu';

  @override
  String get showCallsInRecents => 'Pokaż w ostatnich połączeniach';

  @override
  String get showCallsInRecentsSubtitle =>
      'Połączenia Hash pojawiają się w historii telefonu';

  @override
  String get feedback => 'Opinia';

  @override
  String get muteNotifications => 'Wycisz powiadomienia';

  @override
  String get muteDescription =>
      'Nie będziesz otrzymywać powiadomień od tego kontaktu';

  @override
  String mutedUntil(String time) {
    return 'Wyciszono do $time';
  }

  @override
  String get notMuted => 'Powiadomienia włączone';

  @override
  String get unmute => 'Włącz ponownie';

  @override
  String get notificationSound => 'Dźwięk powiadomienia';

  @override
  String get defaultSound => 'Domyślny';

  @override
  String get chatSettings => 'Ustawienia czatu';

  @override
  String get bubbleColor => 'Kolor dymków';

  @override
  String get backgroundColor => 'Kolor tła';

  @override
  String get backgroundImage => 'Obraz tła';

  @override
  String get chatBackground => 'Tło czatu';

  @override
  String get customColor => 'Niestandardowy';

  @override
  String get defaultColor => 'Domyślny';

  @override
  String get imageSelected => 'Obraz wybrany';

  @override
  String get noImage => 'Brak obrazu';

  @override
  String get color => 'Kolor';

  @override
  String get image => 'Obraz';

  @override
  String get tapToSelectImage => 'Dotknij, aby wybrać obraz';

  @override
  String get changeImage => 'Zmień obraz';

  @override
  String get previewMessageReceived => 'Cześć!';

  @override
  String get previewMessageSent => 'Hej!';

  @override
  String get messageAction => 'Wiadomość';

  @override
  String get callAction => 'Zadzwoń';

  @override
  String get videoAction => 'Wideo';

  @override
  String get personalNotes => 'Osobiste notatki';

  @override
  String get addNotes => 'Dodaj notatki...';

  @override
  String get noNotes => 'Brak notatek';

  @override
  String get messageNotifications => 'Powiadomienia o wiadomościach';

  @override
  String get callNotifications => 'Powiadomienia o połączeniach';

  @override
  String get useGradient => 'Użyj gradientu';

  @override
  String get gradientStart => 'Kolor początkowy';

  @override
  String get gradientEnd => 'Kolor końcowy';

  @override
  String get preview => 'Podgląd';

  @override
  String get reset => 'Resetuj';

  @override
  String get securityNumber => 'Numer bezpieczeństwa';

  @override
  String securityNumberDescription(String name) {
    return 'Sprawdź, czy numer bezpieczeństwa odpowiada urządzeniu $name';
  }

  @override
  String get verifyEncryption => 'Zweryfikuj szyfrowanie end-to-end';

  @override
  String get tapToCopy => 'Dotknij, aby skopiować';

  @override
  String get howToVerify => 'Jak zweryfikować';

  @override
  String get verifyStep1 => 'Spotkaj się z kontaktem osobiście lub zadzwoń';

  @override
  String get verifyStep2 =>
      'Porównaj numery bezpieczeństwa lub zeskanuj kody QR';

  @override
  String get verifyStep3 => 'Jeśli się zgadzają, Twój czat jest bezpieczny';

  @override
  String get scanToVerify => 'Skanuj, aby zweryfikować';

  @override
  String get reportSpam => 'Zgłoś spam';

  @override
  String get reportSpamSubtitle => 'Zgłoś ten kontakt jako spam';

  @override
  String get reportSpamDescription =>
      'Ten kontakt zostanie zgłoszony anonimowo. Twoja tożsamość nie zostanie ujawniona. Czy jesteś pewien?';

  @override
  String get report => 'Zgłoś';

  @override
  String get spamReported => 'Spam zgłoszony';

  @override
  String get reportError =>
      'Nie udało się wysłać zgłoszenia. Proszę spróbować ponownie.';

  @override
  String get reportRateLimited =>
      'Osiągnąłeś maksymalną liczbę zgłoszeń na dzisiaj.';

  @override
  String get blockContact => 'Zablokuj kontakt';

  @override
  String get blockContactDescription =>
      'Ten kontakt nie będzie mógł wysyłać Ci wiadomości ani dzwonić. Nie zostanie o tym powiadomiony.';

  @override
  String get unblockContact => 'Odblokuj kontakt';

  @override
  String get unblockContactDescription =>
      'Ten kontakt będzie mógł ponownie wysyłać Ci wiadomości i dzwonić.';

  @override
  String get contactBlocked => 'Kontakt zablokowany';

  @override
  String get contactUnblocked => 'Kontakt odblokowany';

  @override
  String get contactIsBlocked => 'Ten kontakt jest zablokowany';

  @override
  String get unblock => 'Odblokuj';

  @override
  String get deleteContactSubtitle => 'Usuń ten kontakt i czat';

  @override
  String get confirmWithPin => 'Potwierdź PIN-em';

  @override
  String get enterPinToConfirm => 'Wpisz PIN, aby potwierdzić tę czynność';

  @override
  String get profilePhoto => 'Zdjęcie profilowe';

  @override
  String get takePhoto => 'Zrób zdjęcie';

  @override
  String get chooseFromGallery => 'Wybierz z galerii';

  @override
  String get removePhoto => 'Usuń zdjęcie';

  @override
  String get viewContactHashId => 'Zobacz identyfikator kontaktu';

  @override
  String get hashIdPartiallyMasked =>
      'Częściowo zamaskowany dla Twojego bezpieczeństwa i prywatności kontaktu';

  @override
  String get addFirstContact => 'Dodaj swój pierwszy kontakt';

  @override
  String get addFirstContactSubtitle =>
      'Udostępnij kod QR lub zeskanuj kod znajomego';

  @override
  String get directory => 'Katalog';

  @override
  String get noContacts => 'Brak kontaktów';

  @override
  String get noContactsSubtitle => 'Dodaj kontakt, aby rozpocząć';

  @override
  String get sendMessageAction => 'Wyślij wiadomość';

  @override
  String get audioCall => 'Połączenie głosowe';

  @override
  String get videoCall => 'Połączenie wideo';

  @override
  String get viewProfile => 'Zobacz profil';

  @override
  String get deleteContactDirectory => 'Usuń kontakt';

  @override
  String get scanShort => 'Skanuj';

  @override
  String get addShort => 'Dodaj';

  @override
  String deleteContactConfirmName(String name) {
    return 'Czy na pewno chcesz usunąć $name?';
  }

  @override
  String get noNotesTitle => 'Brak notatek';

  @override
  String get noNotesSubtitle => 'Utwórz pierwszą notatkę';

  @override
  String get newNote => 'Nowa notatka';

  @override
  String get editNote => 'Edytuj notatkę';

  @override
  String get deleteNote => 'Usuń notatkę';

  @override
  String get deleteNoteConfirm => 'Czy na pewno chcesz usunąć tę notatkę?';

  @override
  String get noteTitle => 'Tytuł';

  @override
  String get noteContent => 'Treść';

  @override
  String get addItem => 'Dodaj element';

  @override
  String get pinNote => 'Przypnij';

  @override
  String get unpinNote => 'Odepnij';

  @override
  String get noteColor => 'Kolor';

  @override
  String get notePassword => 'Hasło';

  @override
  String get setPassword => 'Ustaw hasło';

  @override
  String get changePassword => 'Zmień hasło';

  @override
  String get removePassword => 'Usuń hasło';

  @override
  String get enterPassword => 'Wpisz hasło';

  @override
  String get confirmPassword => 'Potwierdź hasło';

  @override
  String get passwordPin => 'Kod PIN';

  @override
  String get passwordText => 'Hasło tekstowe';

  @override
  String get protectedNote => 'Chroniona notatka';

  @override
  String get incorrectPassword => 'Nieprawidłowe hasło';

  @override
  String get passwordSet => 'Hasło ustawione';

  @override
  String get passwordRemoved => 'Hasło usunięte';

  @override
  String get notesBiometric => 'Face ID dla notatek';

  @override
  String get notesBiometricSubtitle =>
      'Wymagaj uwierzytelniania biometrycznego do otwierania chronionych notatek';

  @override
  String get textNote => 'Notatka tekstowa';

  @override
  String get checklistNote => 'Lista kontrolna';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total zadań';
  }

  @override
  String get autoSaved => 'Zapisano';

  @override
  String get searchNotes => 'Szukaj notatek';

  @override
  String get legalConsent => 'Zgoda prawna';

  @override
  String get confirmAge13 => 'Potwierdzam, że mam co najmniej 13 lat';

  @override
  String get acceptLegalStart => 'Akceptuję ';

  @override
  String get privacyPolicy => 'Politykę prywatności';

  @override
  String get termsOfService => 'Regulamin';

  @override
  String get andThe => ' i ';

  @override
  String get continueButton => 'Kontynuuj';

  @override
  String get mustAcceptTerms =>
      'Musisz zaakceptować oba warunki, aby kontynuować';

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
  String get support => 'Wsparcie';

  @override
  String get contactSupport => 'Skontaktuj się z pomocą';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Zgłoś nadużycie';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Prawne';

  @override
  String get legalEntity => 'Podmiot prawny';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Przypnij';

  @override
  String get unpinConversation => 'Odepnij';

  @override
  String get hideConversation => 'Usuń z feedu';

  @override
  String get deleteConversation => 'Usuń rozmowę';

  @override
  String get deleteConversationConfirm =>
      'Wpisz PIN, aby potwierdzić usunięcie wszystkich wiadomości';

  @override
  String get noConversations => 'Brak rozmów';

  @override
  String get startConversation => 'Rozpocznij';

  @override
  String get microphonePermissionRequired => 'Wymagany dostęp do mikrofonu';

  @override
  String get microphonePermissionExplanation =>
      'Hash potrzebuje mikrofonu do wykonywania połączeń.';

  @override
  String get cameraPermissionExplanation =>
      'Hash potrzebuje kamery do połączeń wideo.';

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
  String get openSettings => 'Otwórz ustawienia';

  @override
  String get callConnecting => 'Łączenie...';

  @override
  String get callRinging => 'Dzwoni...';

  @override
  String get callReconnecting => 'Ponowne łączenie...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Ponowne łączenie (${seconds}s)';
  }

  @override
  String get callPaused => 'Wstrzymano';

  @override
  String get callPausedSubtitle => 'Połączenie nadal trwa';

  @override
  String get callRemoteMicMuted => 'Mikrofon kontaktu jest wyciszony';

  @override
  String get callMiniControlsMute => 'Wycisz';

  @override
  String get callMiniControlsUnmute => 'Włącz mikrofon';

  @override
  String get callMiniControlsHangUp => 'Rozłącz';

  @override
  String get callMiniControlsReturn => 'Wróć do połączenia';

  @override
  String get callNetworkPoor => 'Niestabilne połączenie';

  @override
  String get callNetworkLost => 'Utracono połączenie';

  @override
  String get callEndedTitle => 'Połączenie zakończone';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Dane urządzenia';

  @override
  String get deviceDataSubtitle => 'Lokalna i serwerowa pamięć';

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
  String get localStorage => 'Pamięć lokalna';

  @override
  String get onThisDevice => 'na tym urządzeniu';

  @override
  String get encryptedDatabases => 'Zaszyfrowane bazy danych';

  @override
  String get files => 'Pliki';

  @override
  String get secureKeychain => 'Bezpieczny pęk kluczy';

  @override
  String get cache => 'Pamięć podręczna';

  @override
  String get contactsDetail => 'Nazwy, awatary, klucze Signal';

  @override
  String get messagesDetail => 'Zaszyfrowane rozmowy';

  @override
  String get notesDetail => 'Osobiste notatki';

  @override
  String get signalSessions => 'Sesje Signal';

  @override
  String get signalSessionsDetail => 'Sesje szyfrowania';

  @override
  String get pendingContacts => 'Oczekujące kontakty';

  @override
  String get pendingContactsDetail => 'Oczekujące zaproszenia';

  @override
  String get callHistory => 'Połączenia';

  @override
  String get callHistoryDetail => 'Historia połączeń';

  @override
  String get preferences => 'Preferencje';

  @override
  String get preferencesDetail => 'Preferencje mediów i połączeń';

  @override
  String get avatars => 'Awatary';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plików',
      one: '1 plik',
      zero: 'brak plików',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Aktywny';

  @override
  String get notDefined => 'Nieokreślone';

  @override
  String get biometrics => 'Biometria';

  @override
  String get recoveryPhrase => 'Fraza odzyskiwania';

  @override
  String get identity => 'Tożsamość (Hash ID)';

  @override
  String get signalKeys => 'Klucze Signal Protocol';

  @override
  String get authTokens => 'Tokeny uwierzytelniania';

  @override
  String get contactNamesCache => 'Pamięć podręczna nazw kontaktów';

  @override
  String get remoteConfig => 'Konfiguracja zdalna';

  @override
  String get notificationPrefs => 'Preferencje powiadomień';

  @override
  String get serverData => 'Dane serwera';

  @override
  String get serverDataInfo =>
      'Hash przechowuje minimalne dane na serwerze, wszystkie zaszyfrowane lub tymczasowe.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, klucze publiczne, token skrzynki';

  @override
  String get serverPrekeys => 'Klucze wstępne';

  @override
  String get serverPrekeysDetail => 'Jednorazowe klucze Signal (zużyte)';

  @override
  String get serverMessages => 'Wiadomości w tranzycie';

  @override
  String get serverMessagesDetail => 'Usuwane po dostarczeniu (maks. 24h)';

  @override
  String get serverMedia => 'Media w tranzycie';

  @override
  String get serverMediaDetail => 'Usuwane po pobraniu';

  @override
  String get serverContactRequests => 'Zaproszenia kontaktowe';

  @override
  String get serverContactRequestsDetail => 'Wygasają po 24h';

  @override
  String get serverRateLimits => 'Limity szybkości';

  @override
  String get serverRateLimitsDetail => 'Tymczasowe dane anty-nadużyciowe';

  @override
  String get privacyReassurance =>
      'Hash nie może czytać Twoich wiadomości. Wszystkie dane są szyfrowane end-to-end. Dane serwera są automatycznie usuwane.';

  @override
  String get pinTooSimple =>
      'Ten PIN jest zbyt prosty. Wybierz bezpieczniejszy kod.';

  @override
  String get genericError => 'Wystąpił błąd. Proszę spróbować ponownie.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Nie można utworzyć konta: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Fraza skopiowana do schowka';

  @override
  String get copyPhrase => 'Kopiuj frazę';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Zapisz tę frazę w bezpiecznym miejscu. Jeśli stracisz PIN bez tej frazy, trwale stracisz dostęp do swoich danych.';

  @override
  String get noMessages => 'Brak wiadomości';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Usunąć wszystkie wiadomości z $name?';
  }

  @override
  String get confirmation => 'Potwierdzenie';

  @override
  String get untitled => 'Bez tytułu';

  @override
  String get noSessions => 'Brak sesji';

  @override
  String get unknownContact => 'Nieznany kontakt';

  @override
  String get unnamed => 'Bez nazwy';

  @override
  String get noPendingRequestsAlt => 'Brak oczekujących zaproszeń';

  @override
  String get deleteAllCallHistory => 'Usunąć całą historię połączeń?';

  @override
  String get noCalls => 'Brak połączeń';

  @override
  String get noPreferences => 'Brak preferencji';

  @override
  String get resetAllMediaPrefs => 'Zresetować wszystkie preferencje mediów?';

  @override
  String get deleteThisAvatar => 'Usunąć ten awatar?';

  @override
  String get deleteAllAvatars => 'Usunąć wszystkie awatary?';

  @override
  String get noAvatars => 'Brak awatarów';

  @override
  String get deleteThisFile => 'Usunąć ten plik?';

  @override
  String get deleteAllMediaFiles => 'Usunąć wszystkie media?';

  @override
  String get noMediaFiles => 'Brak mediów';

  @override
  String get outgoing => 'Wychodzące';

  @override
  String get incoming => 'Przychodzące';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Widok znikający: ${seconds}s';
  }

  @override
  String get normalView => 'Widok normalny';

  @override
  String get callReasonCompleted => 'Zakończone';

  @override
  String get callReasonMissed => 'Nieodebrane';

  @override
  String get callReasonDeclined => 'Odrzucone';

  @override
  String get callReasonFailed => 'Nieudane';

  @override
  String get justNow => 'Przed chwilą';

  @override
  String timeAgoMinutes(int count) {
    return '$count min temu';
  }

  @override
  String timeAgoHours(int count) {
    return '${count}h temu';
  }

  @override
  String timeAgoDays(int count) {
    return '${count}d temu';
  }

  @override
  String get messageTypeContact => 'Kontakt';

  @override
  String get messageTypeLocation => 'Lokalizacja';

  @override
  String get statusQueued => 'W kolejce';

  @override
  String get blockedBadge => 'Zablokowany';

  @override
  String get protectedBadge => 'Chroniona';

  @override
  String messageCount(int count) {
    return '$count wiadomość(i)';
  }

  @override
  String get deleteQuestion => 'Usunąć?';

  @override
  String get transferMyAccountTitle => 'Przenieś moje konto';

  @override
  String get loadingError => 'Błąd ładowania';

  @override
  String get transferToNewDevice => 'Przenieś na nowe urządzenie';

  @override
  String get transferInstructions =>
      'Na nowym urządzeniu wybierz \"Odzyskaj konto\" i wpisz te informacje:';

  @override
  String get yourHashIdLabel => 'Twój Hash ID';

  @override
  String get enterYourPinCode => 'Wpisz swój kod PIN';

  @override
  String get pinOwnerConfirmation =>
      'Aby potwierdzić, że jesteś właścicielem tego konta';

  @override
  String get scanThisQrCode => 'Zeskanuj ten kod QR';

  @override
  String get withYourNewDevice => 'Swoim nowym urządzeniem';

  @override
  String get orEnterTheCode => 'lub wpisz kod';

  @override
  String get transferCodeLabel => 'Kod przeniesienia';

  @override
  String get proximityVerification => 'Weryfikacja bliskości';

  @override
  String get bringDevicesCloser => 'Zbliż oba urządzenia do siebie';

  @override
  String get confirmTransferQuestion => 'Potwierdzić przeniesienie?';

  @override
  String get accountWillBeTransferred =>
      'Twoje konto zostanie przeniesione na nowe urządzenie.\n\nTo urządzenie zostanie trwale odłączone.';

  @override
  String get transferComplete => 'Przeniesienie zakończone';

  @override
  String get transferSuccessMessage =>
      'Twoje konto zostało pomyślnie przeniesione.\n\nAplikacja zostanie teraz zamknięta.';

  @override
  String get manualVerification => 'Weryfikacja ręczna';

  @override
  String get codeDisplayedOnBothDevices =>
      'Kod wyświetlony na obu urządzeniach:';

  @override
  String get doesCodeMatchNewDevice =>
      'Czy ten kod odpowiada kodowi na nowym urządzeniu?';

  @override
  String get verifiedStatus => 'Zweryfikowane';

  @override
  String get inProgressStatus => 'W toku...';

  @override
  String get notAvailableStatus => 'Niedostępne';

  @override
  String get codeExpiredRestart => 'Kod wygasł. Proszę rozpocząć od nowa.';

  @override
  String get codesDoNotMatchCancelled =>
      'Kody nie pasują. Przeniesienie anulowane.';

  @override
  String transferToDevice(String device) {
    return 'Do: $device';
  }

  @override
  String get copiedExclamation => 'Skopiowano!';

  @override
  String expiresInTime(String time) {
    return 'Wygasa za $time';
  }

  @override
  String get biometricNotAvailable =>
      'Biometria nie jest dostępna na tym urządzeniu';

  @override
  String get biometricAuthError => 'Błąd uwierzytelniania biometrycznego';

  @override
  String get authenticateForBiometric =>
      'Proszę uwierzytelnić się, aby włączyć biometrię';

  @override
  String get biometricAuthFailed =>
      'Uwierzytelnianie biometryczne nie powiodło się';

  @override
  String get forceUpdateTitle => 'Wymagana aktualizacja';

  @override
  String get forceUpdateMessage =>
      'Dostępna jest nowa wersja Hash. Proszę zaktualizować, aby kontynuować.';

  @override
  String get updateButton => 'Aktualizuj';

  @override
  String get maintenanceInProgress => 'Trwa konserwacja';

  @override
  String get tryAgainLater => 'Proszę spróbować ponownie później';

  @override
  String get information => 'Informacja';

  @override
  String get later => 'Później';

  @override
  String get doYouLikeHash => 'Podoba Ci się Hash?';

  @override
  String get yourFeedbackHelps => 'Twoja opinia pomaga nam ulepszać aplikację';

  @override
  String get ratingTerrible => 'Okropna';

  @override
  String get ratingBad => 'Słaba';

  @override
  String get ratingOk => 'Ok';

  @override
  String get ratingGood => 'Dobra';

  @override
  String get ratingExcellent => 'Doskonała!';

  @override
  String get donationMessage =>
      'Hash jest projektem non-profit. Twoje wsparcie pomaga nam kontynuować tworzenie naprawdę prywatnego komunikatora.';

  @override
  String get recentConnections => 'Ostatnie logowania';

  @override
  String get loginInfoText =>
      'Każde odblokowanie PIN-em jest rejestrowane lokalnie. Przechowywane są tylko dane z ostatnich 24 godzin.';

  @override
  String get connectionCount => 'Logowanie(a)';

  @override
  String get periodLabel => 'Okres';

  @override
  String get historyLabel => 'Historia';

  @override
  String get noLoginRecorded => 'Brak zarejestrowanych logowań';

  @override
  String get nextUnlocksAppearHere =>
      'Następne odblokowania pojawią się tutaj.';

  @override
  String get dataLocalOnly =>
      'Te dane są przechowywane wyłącznie na Twoim urządzeniu i nigdy nie są przesyłane.';

  @override
  String get currentSession => 'Bieżąca';

  @override
  String get todayLabel => 'Dzisiaj';

  @override
  String get yesterdayLabel => 'Wczoraj';

  @override
  String get justNowLabel => 'Przed chwilą';

  @override
  String minutesAgoLabel(int count) {
    return '$count min temu';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '${hours}h temu';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}h ${minutes}min temu';
  }

  @override
  String get noMaintenancePlanned => 'Brak zaplanowanej konserwacji';

  @override
  String get everythingWorkingNormally => 'Wszystko działa normalnie';

  @override
  String get maintenanceTitle => 'Konserwacja';

  @override
  String get maintenanceActiveLabel => 'W TOKU';

  @override
  String get maintenancePlannedLabel => 'ZAPLANOWANA';

  @override
  String get locking => 'Blokowanie...';

  @override
  String get newMessageNotification => 'Nowa wiadomość';

  @override
  String get secExplainTitle => 'Jak Hash Cię chroni';

  @override
  String get secExplainIntro =>
      'Hash jest zaprojektowany tak, aby nikt nie mógł czytać Twoich wiadomości.';

  @override
  String get secExplainIntroSub =>
      'Nawet my.\nOto jak to działa, wyjaśnione w prosty sposób.';

  @override
  String get secJourneyLabel => 'PODRÓŻ';

  @override
  String get secJourneyTitle => 'Podróż Twojej wiadomości';

  @override
  String get secJourneySubtitle =>
      'Od Twojego palca do ekranu kontaktu, każdy krok jest chroniony. Podążaj ścieżką.';

  @override
  String get secStep1Title => 'Piszesz wiadomość';

  @override
  String get secStep1Desc =>
      'Wpisujesz \"Cześć!\" w aplikacji. W tym momencie wiadomość istnieje tylko w pamięci Twojego telefonu. Nic nie zostało wysłane.';

  @override
  String get secStep2Title => 'Szyfrowanie protokołem Signal';

  @override
  String get secStep2Desc =>
      'Gdy tylko naciśniesz \"Wyślij\", Twoja wiadomość zamienia się w ciąg niezrozumiałych znaków. To tak, jakby Twoja wiadomość była zamknięta w sejfie, do którego klucz ma tylko Twój kontakt.';

  @override
  String get secStep3Title => 'Sealed Sender: niewidzialna koperta';

  @override
  String get secStep3Desc =>
      'Wyobraź sobie, że wysyłasz list pocztą, ale bez adresu nadawcy na kopercie. Dokładnie to robi Hash. Wiadomość trafia do anonimowej skrzynki. Serwer nie wie, kto ją wysłał.';

  @override
  String get secStep4Title => 'Serwer nic nie widzi';

  @override
  String get secStep4Desc =>
      'Serwer działa jak ślepy listonosz. Wie tylko, że \"ktoś wrzucił coś do skrzynki #A7X9\". Nie wie, kto to wysłał, co to jest, ani dla kogo to jest.';

  @override
  String get secStep4Highlight =>
      'Żadne metadane nie są przechowywane: brak adresu IP, brak znacznika czasu, brak powiązania między nadawcą a odbiorcą.';

  @override
  String get secStep5Title => 'Twój kontakt odbiera wiadomość';

  @override
  String get secStep5Desc =>
      'Telefon kontaktu pobiera treść z anonimowej skrzynki i odszyfrowuje wiadomość kluczem prywatnym, który nigdy nie opuścił urządzenia. \"Cześć!\" pojawia się na ekranie.';

  @override
  String get secStep6Title => 'Wiadomość znika z serwera';

  @override
  String get secStep6Desc =>
      'Gdy tylko kontakt potwierdzi odbiór, serwer trwale usuwa wiadomość. Żadnego kosza, żadnego archiwum, żadnej kopii zapasowej. Nawet nieprzeczytane wiadomości są automatycznie niszczone po 24 godzinach.';

  @override
  String get secStep7Title => 'Lokalne wygaśnięcie';

  @override
  String get secStep7Desc =>
      'Na telefonie kontaktu wiadomość samodestruuje się zgodnie z wybranym czasem: natychmiast po przeczytaniu, 5 minut, 1 godzina... Ty decydujesz.';

  @override
  String get secJourneyConclusion =>
      'Rezultat: zero śladów na serwerze, zero śladów na urządzeniach. Wiadomość istniała tylko tyle, ile potrzeba do przeczytania, a potem znikła.';

  @override
  String get secArchLabel => 'ARCHITEKTURA';

  @override
  String get secArchTitle => '5 warstw ochrony';

  @override
  String get secArchSubtitle =>
      'Hash nie polega na jednej technologii. Każda warstwa wzmacnia pozostałe. Nawet jeśli jedna warstwa zostanie naruszona, Twoje dane pozostają bezpieczne.';

  @override
  String get secLayer1Title => 'Szyfrowanie end-to-end';

  @override
  String get secLayer1Desc =>
      'Każda wiadomość jest szyfrowana unikalnym kluczem. Prościej mówiąc: nawet jeśli ktoś odszyfruje jedną wiadomość, nie będzie mógł odszyfrować następnej. Każda wiadomość ma własny zamek.';

  @override
  String get secLayer1Detail =>
      'Dla plików (zdjęcia, filmy, dokumenty) Hash używa dodatkowego szyfrowania AES-256-GCM. Plik jest szyfrowany przed opuszczeniem Twojego telefonu.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonimowość sieciowa)';

  @override
  String get secLayer2Desc =>
      'Zwykłe komunikatory wysyłają wiadomości z dołączoną tożsamością. To jak pisanie imienia na kopercie. Hash używa anonimowych skrzynek: serwer dostarcza wiadomość, nie wiedząc, kto ją wysłał.';

  @override
  String get secLayer2Detail =>
      'Rezultat: nawet w przypadku wycieku danych z serwera, nie da się odtworzyć, kto z kim rozmawia.';

  @override
  String get secLayer3Title => 'Automatyczne usuwanie';

  @override
  String get secLayer3Desc =>
      'Wiadomości są usuwane z serwera zaraz po potwierdzeniu odbioru. Nawet jeśli wiadomość nigdy nie zostanie pobrana, jest automatycznie niszczona po 24 godzinach.';

  @override
  String get secLayer3Detail =>
      'Na Twoim telefonie wiadomości samodestruują się zgodnie z wybranym czasem: natychmiast, 5 min, 15 min, 30 min, 1h, 3h, 6h lub 12h.';

  @override
  String get secLayer4Title => 'Ochrona dostępu lokalnego';

  @override
  String get secLayer4Desc =>
      'Aplikacja jest chroniona 6-cyfrowym kodem PIN i/lub biometrią (Face ID, odcisk palca). Po zbyt wielu nieudanych próbach aplikacja blokuje się z rosnącym opóźnieniem po każdym niepowodzeniu.';

  @override
  String get secLayer5Title => 'Zablokowana baza danych';

  @override
  String get secLayer5Desc =>
      'Po stronie serwera żaden użytkownik nie może pisać bezpośrednio do bazy danych. Wszystkie działania przechodzą przez bezpieczne funkcje, które weryfikują każde żądanie.';

  @override
  String get secLayer5Detail =>
      'To jak okienko w banku: nigdy sam nie dotykasz sejfu. Składasz wniosek, a system sprawdza, czy masz uprawnienia, zanim podejmie działanie.';

  @override
  String get secVashLabel => 'UNIKALNY NA ŚWIECIE';

  @override
  String get secVashTitle => 'Tryb Vash';

  @override
  String get secVashSubtitle =>
      'System bezpieczeństwa awaryjnego, który nie istnieje w żadnej innej aplikacji do przesyłania wiadomości.';

  @override
  String get secVashScenarioTitle => 'Wyobraź sobie tę sytuację';

  @override
  String get secVashScenario1 => 'Ktoś uzyskuje dostęp do Twojego telefonu';

  @override
  String get secVashScenario2 => 'Zostaje poproszony o kod PIN';

  @override
  String get secVashScenario3 => 'Chcesz pilnie usunąć wszystkie dane';

  @override
  String get secVashSolutionTitle => 'Rozwiązanie: dwa kody PIN';

  @override
  String get secVashSolutionDesc => 'Konfigurujesz dwa różne kody PIN w Hash:';

  @override
  String get secVashNormalCodeLabel => 'Normalny kod';

  @override
  String get secVashNormalCodeDesc =>
      'Otwiera aplikację normalnie ze wszystkimi danymi';

  @override
  String get secVashCodeLabel2 => 'Kod Vash';

  @override
  String get secVashCodeDescription =>
      'Otwiera aplikację normalnie... ale wszystkie dane są cicho usuwane w tle';

  @override
  String get secVashWhatHappensTitle => 'Co dzieje się potem';

  @override
  String get secVashWhatHappensDesc =>
      'Aplikacja otwiera się normalnie. Żadnego alertu, żadnej podejrzanej animacji. Ekran po prostu pokazuje pustą aplikację, jakby właśnie została zainstalowana.\n\nW rzeczywistości wszystkie rozmowy, kontakty i wiadomości zostały nieodwracalnie usunięte w ułamku sekundy.';

  @override
  String get secCallsLabel => 'POŁĄCZENIA I PLIKI';

  @override
  String get secCallsTitle => 'Wszystko jest zaszyfrowane';

  @override
  String get secCallsSubtitle =>
      'To nie tylko wiadomości. Absolutnie wszystko, co przechodzi przez Hash, jest szyfrowane end-to-end.';

  @override
  String get secAudioCallTitle => 'Połączenia głosowe';

  @override
  String get secAudioCallDesc =>
      'Szyfrowane end-to-end przez WebRTC. Głos jest przesyłany bezpośrednio między urządzeniami.';

  @override
  String get secVideoCallTitle => 'Połączenia wideo';

  @override
  String get secVideoCallDesc =>
      'Ta sama technologia, każdy strumień szyfrowany indywidualnie.';

  @override
  String get secPhotosTitle => 'Zdjęcia i filmy';

  @override
  String get secPhotosDesc =>
      'Szyfrowane AES-256-GCM przed opuszczeniem Twojego telefonu.';

  @override
  String get secDocsTitle => 'Dokumenty';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, dowolny plik. Nazwa, rozmiar i treść zaszyfrowane.';

  @override
  String get secAnonLabel => 'ANONIMOWOŚĆ';

  @override
  String get secAnonTitle => 'Brak wymaganej tożsamości';

  @override
  String get secAnonSubtitle =>
      'Hash nigdy nie pyta o numer telefonu ani email. Jesteś identyfikowany przez unikalny i anonimowy Hash ID.';

  @override
  String get secHashIdTitle => 'Twój Hash ID';

  @override
  String get secHashIdDesc =>
      'To Twój unikalny identyfikator. Nie ujawnia nic o Tobie: ani imienia, ani numeru, ani lokalizacji. To jak pseudonim, którego nie da się powiązać z Twoją prawdziwą tożsamością.\n\nAby dodać kontakt, udostępniasz Hash ID lub skanujesz kod QR. To wszystko. Bez synchronizowanej książki adresowej, bez sugestii \"Osoby, które możesz znać\".';

  @override
  String get secDataLabel => 'DANE';

  @override
  String get secDataTitle => 'Czego Hash nie wie';

  @override
  String get secDataSubtitle =>
      'Najlepszym sposobem ochrony danych jest ich nie zbieranie.';

  @override
  String get secNeverCollected => 'Nigdy nie zbierane';

  @override
  String get secNeverItem1 => 'Treść wiadomości';

  @override
  String get secNeverItem2 => 'Lista kontaktów';

  @override
  String get secNeverItem3 => 'Numer telefonu';

  @override
  String get secNeverItem4 => 'Adres email';

  @override
  String get secNeverItem5 => 'Adres IP';

  @override
  String get secNeverItem6 => 'Lokalizacja';

  @override
  String get secNeverItem7 => 'Metadane (kto z kim rozmawia)';

  @override
  String get secNeverItem8 => 'Historia połączeń';

  @override
  String get secNeverItem9 => 'Książka adresowa';

  @override
  String get secNeverItem10 => 'Identyfikatory reklamowe';

  @override
  String get secTempStored => 'Przechowywane tymczasowo';

  @override
  String get secTempItem1 => 'Anonimowy Hash ID (unikalny identyfikator)';

  @override
  String get secTempItem2 => 'Publiczne klucze szyfrowania';

  @override
  String get secTempItem3 => 'Zaszyfrowane wiadomości w tranzycie (maks. 24h)';

  @override
  String get secTempNote =>
      'Nawet te minimalne dane nie pozwalają Cię zidentyfikować. Twój Hash ID nie jest powiązany z żadnymi danymi osobowymi.';

  @override
  String get secFooterTitle => 'Twoja prywatność, Twoja wolność';

  @override
  String get secFooterDesc =>
      'Hash używa tych samych technologii szyfrowania co najbardziej wymagające profesjonalne aplikacje. Twoje wiadomości są chronione przez matematykę, nie przez obietnice.';

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
