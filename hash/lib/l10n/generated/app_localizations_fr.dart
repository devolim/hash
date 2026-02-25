// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

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
  String get conversations => 'Chats';

  @override
  String get contacts => 'Contacts';

  @override
  String get noConversation => 'Aucun chat';

  @override
  String get noConversationSubtitle =>
      'Ajoutez un contact pour commencer à discuter en toute sécurité';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count demandes reçues',
      one: '1 demande reçue',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count demandes envoyées en attente',
      one: '1 demande envoyée en attente',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Ajouter un contact';

  @override
  String get shareApp => 'Partager l\'application';

  @override
  String get newMessage => 'Nouveau message';

  @override
  String get newConversation => 'Envoyer un message';

  @override
  String get settings => 'Réglages';

  @override
  String get myHashId => 'Mon ID Hash';

  @override
  String get supportHash => 'Soutenir Hash';

  @override
  String get supportHashSubtitle => 'Aidez-nous à protéger votre vie privée';

  @override
  String get donate => 'Faire un don';

  @override
  String get appearance => 'Apparence';

  @override
  String get theme => 'Thème';

  @override
  String get themeAuto => 'Automatique';

  @override
  String get themeAutoSubtitle => 'Suit les paramètres du système';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeRecommendation =>
      'Le thème sombre est recommandé pour une meilleure discrétion';

  @override
  String get language => 'Langue';

  @override
  String get languageAuto => 'Automatique (système)';

  @override
  String get notifications => 'Notifications';

  @override
  String get messages => 'Messages';

  @override
  String get calls => 'Appels';

  @override
  String get vibration => 'Vibration';

  @override
  String get notificationContent => 'Contenu des notifications';

  @override
  String get notificationContentFull => 'Afficher tout';

  @override
  String get notificationContentFullDesc =>
      'Nom du contact et aperçu du message';

  @override
  String get notificationContentName => 'Nom uniquement';

  @override
  String get notificationContentNameDesc =>
      'Affiche seulement le nom du contact';

  @override
  String get notificationContentDiscrete => 'Discret';

  @override
  String get notificationContentDiscreteDesc =>
      'Affiche seulement \"Nouveau message\"';

  @override
  String get security => 'Sécurité';

  @override
  String get howHashProtectsYou => 'Comment Hash te protège';

  @override
  String get howHashProtectsYouSubtitle => 'Comprendre ta sécurité';

  @override
  String get accountSecurity => 'Sécurité du compte';

  @override
  String get accountSecuritySubtitle => 'PIN, biométrie, Mode Vash';

  @override
  String get blockScreenshots => 'Bloquer les captures d\'écran';

  @override
  String get transferDevice => 'Transférer vers un autre appareil';

  @override
  String get transferDeviceSubtitle => 'Migrer votre compte';

  @override
  String get pinCode => 'Code PIN';

  @override
  String get changePin => 'Changer le code PIN';

  @override
  String get currentPin => 'Code PIN actuel';

  @override
  String get newPin => 'Nouveau code PIN';

  @override
  String get confirmPin => 'Confirmer le code PIN';

  @override
  String get pinChanged => 'Code PIN modifié';

  @override
  String get incorrectPin => 'PIN incorrect';

  @override
  String get pinsDoNotMatch => 'Les codes ne correspondent pas';

  @override
  String get autoLock => 'Verrouillage automatique';

  @override
  String get autoLockDelay => 'Délai de verrouillage';

  @override
  String get autoLockImmediate => 'Immédiat';

  @override
  String get autoLockMinute => '1 minute';

  @override
  String autoLockMinutes(int count) {
    return '$count minutes';
  }

  @override
  String get vashCode => 'Code Vash';

  @override
  String get vashModeTitle => 'MODE VASH';

  @override
  String get vashModeExplanation =>
      'Le code qui efface tout. Définitivement. En silence.';

  @override
  String get vashModeDescription =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.\n\nEn cas de contrainte, entrez votre code VASH au lieu de votre PIN. L\'app s\'ouvre normalement, mais en arrière-plan, tout est définitivement effacé.\n\nPour quiconque regarde votre écran, Hash apparaît simplement vide, comme si vous ne l\'aviez jamais utilisée.';

  @override
  String get vashModeIrreversible => 'Silencieux et irréversible.';

  @override
  String get chooseVashCode => 'Choisir mon code VASH';

  @override
  String get vashCodeInfo =>
      'Un second code PIN qui ouvre l\'application normalement, mais vide.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail =>
      'Entrez ce code à la place de votre PIN : l\'app s\'ouvre normalement, mais les données cochées ci-dessous sont supprimées en silence. Irréversible.';

  @override
  String get vashDeleteContacts => 'Vos contacts disparaissent';

  @override
  String get vashDeleteMessages => 'Vos conversations disparaissent';

  @override
  String get vashDeleteHistory => 'Vos notes disparaissent';

  @override
  String get vashKeepId => 'Votre identité Hash (#XXX-XXX-XXX) reste la même';

  @override
  String get vashAppearNormal =>
      'L\'application apparaît normale mais vide, comme neuve. Cette action est irréversible.';

  @override
  String get setupVashCode => 'Configurer le code Vash';

  @override
  String get modifyVashCode => 'Modifier le code Vash';

  @override
  String get currentVashCode => 'Code Vash actuel';

  @override
  String get newVashCode => 'Nouveau code Vash';

  @override
  String get confirmVashCode => 'Confirmer le code Vash';

  @override
  String get vashCodeConfigured => 'Code Vash configuré';

  @override
  String get vashCodeModified => 'Code Vash modifié';

  @override
  String get vashCodeMustDiffer =>
      'Le code Vash doit être différent du code PIN';

  @override
  String get incorrectVashCode => 'Code Vash incorrect';

  @override
  String get vashWhatToDelete => 'DONNÉES SUPPRIMÉES AVEC LE CODE VASH';

  @override
  String get vashDeleteContactsOption => 'Contacts';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Messages';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Notes';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Mode Vash activé';

  @override
  String get vashCreateSubtitle =>
      'Choisissez un code différent de votre PIN principal';

  @override
  String get vashConfirmSubtitle => 'Confirmez votre code Vash';

  @override
  String get pinCodeForEntry => 'Code PIN pour rentrer dans l\'application';

  @override
  String get vashCodeSection => 'Mode Vash';

  @override
  String get biometric => 'Biométrie';

  @override
  String get biometricUnlock => 'Déverrouiller avec empreinte ou Face ID';

  @override
  String get enableBiometric => 'Activer la biométrie';

  @override
  String get biometricWarningMessage =>
      'En activant la biométrie, vous ne pourrez pas utiliser votre code Vash pour entrer dans l\'application.\n\nVous pourrez uniquement utiliser le code Vash si la biométrie échoue (après plusieurs tentatives infructueuses).\n\nÊtes-vous sûr de vouloir continuer ?';

  @override
  String get understood => 'J\'ai compris';

  @override
  String get shareAppSubtitle => 'Partagez Hash avec vos proches';

  @override
  String get share => 'Partager';

  @override
  String get danger => 'Danger';

  @override
  String get deleteAccount => 'Supprimer mon compte';

  @override
  String get deleteAccountSubtitle => 'Action irréversible';

  @override
  String get deleteAccountConfirmTitle => 'Supprimer mon compte';

  @override
  String get deleteAccountConfirmMessage =>
      'Votre compte sera définitivement supprimé ainsi que l\'ensemble de vos données. Cette action est irréversible, vous devrez créer un nouveau compte.';

  @override
  String get deleteForever => 'Supprimer définitivement';

  @override
  String get cancel => 'Annuler';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Mode Vash activé.';

  @override
  String deletionError(String error) {
    return 'Erreur lors de la suppression: $error';
  }

  @override
  String get yourSecurity => 'Votre sécurité';

  @override
  String get securityInfo =>
      '• Chiffrement de bout en bout (Signal Protocol)\n• Aucune donnée sur nos serveurs après livraison\n• Clés stockées uniquement sur votre appareil\n• Code PIN jamais envoyé au serveur';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Bienvenue';

  @override
  String get securityStatement1 => 'Vos messages sont protégés.';

  @override
  String get securityStatement2 => 'Chiffrement de bout en bout.';

  @override
  String get securityStatement3 => 'Aucune trace. Aucun compromis.';

  @override
  String get securityStatement4 => 'Votre vie privée est un droit.';

  @override
  String get accessBlocked => 'Accès bloqué';

  @override
  String get tooManyAttempts => 'Trop de tentatives. Réessayez plus tard.';

  @override
  String get pleaseWait => 'Veuillez patienter';

  @override
  String get waitDelay => 'Veuillez attendre la fin du délai';

  @override
  String attemptCount(int current, int max) {
    return 'Tentative $current sur $max';
  }

  @override
  String retryIn(String time) {
    return 'Réessayez dans $time';
  }

  @override
  String get forgotPin => 'PIN oublié ? Utiliser la phrase de récupération';

  @override
  String get useRecoveryPhrase => 'Utiliser la phrase de récupération';

  @override
  String get recoveryWarningTitle => 'Attention';

  @override
  String get recoveryWarningMessage => 'La récupération du compte va :';

  @override
  String get recoveryDeleteAllMessages => 'Supprimer TOUS vos messages';

  @override
  String get recoveryWaitDelay => 'Imposer un délai de 1 heure';

  @override
  String get recoveryKeepContacts => 'Conserver vos contacts';

  @override
  String get recoveryIrreversible =>
      'Cette action est irréversible. Vos messages seront définitivement perdus.';

  @override
  String get iUnderstand => 'Je comprends';

  @override
  String get accountRecovery => 'Récupération du compte';

  @override
  String get enterRecoveryPhrase =>
      'Entrez les 24 mots de votre phrase de récupération, séparés par des espaces.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Récupérer';

  @override
  String get recoveryPhraseRequired =>
      'Veuillez entrer votre phrase de récupération';

  @override
  String get recoveryPhrase24Words =>
      'La phrase doit contenir exactement 24 mots';

  @override
  String get incorrectRecoveryPhrase => 'Phrase de récupération incorrecte';

  @override
  String get recoveryInitError =>
      'Erreur lors de l\'initialisation de la récupération';

  @override
  String get securityDelay => 'Délai de sécurité';

  @override
  String get securityDelayMessage =>
      'Pour votre sécurité, un délai d\'attente est requis avant de pouvoir créer un nouveau PIN.';

  @override
  String get timeRemaining => 'Temps restant';

  @override
  String get messagesDeletedForProtection =>
      'Vos messages ont été supprimés pour votre protection.';

  @override
  String get canCloseApp =>
      'Vous pouvez fermer l\'application et revenir plus tard.';

  @override
  String get onboardingTitle1 => 'Bienvenue sur Hash';

  @override
  String get onboardingSubtitle1 => 'La messagerie qui ne laisse aucune trace';

  @override
  String get onboardingTitle2 => 'Chiffrement total';

  @override
  String get onboardingSubtitle2 =>
      'Vos messages sont chiffrés de bout en bout avec le protocole Signal';

  @override
  String get onboardingTitle3 => 'Aucune trace';

  @override
  String get onboardingSubtitle3 =>
      'Les messages sont supprimés des serveurs dès leur livraison';

  @override
  String get onboardingTitle4 => 'Votre sécurité';

  @override
  String get onboardingSubtitle4 =>
      'Code PIN, Mode Vash et phrase de récupération';

  @override
  String get getStarted => 'Commencer';

  @override
  String get next => 'Suivant';

  @override
  String get skip => 'Passer';

  @override
  String get alreadyHaveAccount => 'J\'ai déjà un compte';

  @override
  String get transferMyAccount => 'Transférer mon compte';

  @override
  String get createPin => 'Créer un code PIN';

  @override
  String get createPinSubtitle =>
      'Ce code protégera l\'accès à votre application';

  @override
  String get confirmYourPin => 'Confirmez votre code PIN';

  @override
  String get confirmPinSubtitle => 'Entrez à nouveau votre code PIN';

  @override
  String get saveRecoveryPhrase => 'Phrase de récupération';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Notez ces 24 mots dans l\'ordre. Ils vous permettront de récupérer votre compte si vous oubliez votre PIN.';

  @override
  String get phraseWritten => 'J\'ai noté ma phrase';

  @override
  String get warningRecoveryPhrase =>
      'Si vous perdez cette phrase et oubliez votre PIN, vous perdrez l\'accès à votre compte.';

  @override
  String get accountTransferred => 'Compte transféré';

  @override
  String get accountTransferredMessage =>
      'Votre compte a été transféré vers un autre appareil. Cette session n\'est plus valide.';

  @override
  String get accountTransferredInfo =>
      'Si vous n\'êtes pas à l\'origine de ce transfert, votre compte a peut-être été compromis.';

  @override
  String get logout => 'Se déconnecter';

  @override
  String get transferAccount => 'Transférer le compte';

  @override
  String get transferAccountInfo =>
      'Transférez votre compte Hash vers un nouvel appareil. Votre session actuelle sera invalidée.';

  @override
  String get generateTransferCode => 'Générer un code de transfert';

  @override
  String get transferCode => 'Code de transfert';

  @override
  String transferCodeExpires(int minutes) {
    return 'Ce code expire dans $minutes minutes';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Entrez ce code sur votre nouvel appareil pour transférer votre compte.';

  @override
  String get generateNewCode => 'Générer un nouveau code';

  @override
  String get scanQrCode => 'Scanner un QR code';

  @override
  String get scanQrCodeSubtitle =>
      'Scannez le QR code d\'un contact pour l\'ajouter';

  @override
  String get qrCodeDetected => 'QR code détecté';

  @override
  String get invalidQrCode => 'QR code invalide';

  @override
  String get cameraPermissionRequired => 'Permission caméra requise';

  @override
  String get myQrCode => 'Mon QR code';

  @override
  String get myQrCodeSubtitle =>
      'Partagez ce QR code pour que vos contacts puissent vous ajouter';

  @override
  String get shareQrCode => 'Partager';

  @override
  String get addContactTitle => 'Ajouter un contact';

  @override
  String get addContactByHashId => 'Entrez le Hash ID de votre contact';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Rechercher';

  @override
  String get contactNotFound => 'Contact non trouvé';

  @override
  String get contactAlreadyAdded => 'Ce contact est déjà dans votre liste';

  @override
  String get contactAdded => 'Contact ajouté';

  @override
  String get myProfile => 'Mon profil';

  @override
  String get myProfileSubtitle =>
      'Partagez ces informations pour qu\'on puisse vous ajouter';

  @override
  String get temporaryCode => 'Code temporaire';

  @override
  String temporaryCodeExpires(String time) {
    return 'Expire dans $time';
  }

  @override
  String get codeExpired => 'Code expiré';

  @override
  String get generateNewCodeButton => 'Nouveau code';

  @override
  String get copyHashId => 'Copier l\'ID';

  @override
  String get copyCode => 'Copier le code';

  @override
  String get copiedToClipboard => 'Copié';

  @override
  String get showMyQrCode => 'Afficher mon QR code';

  @override
  String get orDivider => 'ou';

  @override
  String get openScanner => 'Ouvrir le scanner';

  @override
  String get addManually => 'Ajouter manuellement';

  @override
  String get contactHashIdLabel => 'Hash ID du contact';

  @override
  String get temporaryCodeLabel => 'Code temporaire';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode =>
      'Demandez à votre contact de générer un code depuis son profil';

  @override
  String get verifyAndAdd => 'Vérifier et ajouter';

  @override
  String get fillAllFields => 'Veuillez remplir tous les champs';

  @override
  String get invalidHashIdFormat => 'Format d\'ID invalide (ex: 123-456-ABC)';

  @override
  String get userNotFound => 'Utilisateur introuvable';

  @override
  String get cannotAddYourself => 'Vous ne pouvez pas vous ajouter vous-même';

  @override
  String get invalidOrExpiredCode => 'Code temporaire invalide ou expiré';

  @override
  String get contactFound => 'Contact trouvé !';

  @override
  String get howToCallContact => 'Comment voulez-vous l\'appeler ?';

  @override
  String get contactNameHint => 'Nom du contact';

  @override
  String get addContactButton => 'Ajouter';

  @override
  String get contactDetails => 'Détails du contact';

  @override
  String get contactName => 'Nom du contact';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Ajouté le $date';
  }

  @override
  String get deleteContact => 'Supprimer le contact';

  @override
  String deleteContactConfirm(Object name) {
    return 'Supprimer ce contact ?';
  }

  @override
  String get deleteContactMessage =>
      'Cette action supprimera également tout le chat.';

  @override
  String get delete => 'Supprimer';

  @override
  String get typeMessage => 'Écrire un message...';

  @override
  String get messageSent => 'Envoyé';

  @override
  String get messageDelivered => 'Délivré';

  @override
  String get messageRead => 'Lu';

  @override
  String get messageFailed => 'Échec de l\'envoi';

  @override
  String get now => 'Maintenant';

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
    return '${count}j';
  }

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get yesterday => 'Hier';

  @override
  String dateAtTime(String date, String time) {
    return '$date à $time';
  }

  @override
  String get shareMessage =>
      'Rejoins-moi sur Hash ! 🔒\n\nC\'est une messagerie vraiment privée : chiffrement total, aucune trace sur les serveurs, et un mode panique si besoin.\n\nTélécharge l\'app ici 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Erreur';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Voir';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get save => 'Enregistrer';

  @override
  String get edit => 'Modifier';

  @override
  String get close => 'Fermer';

  @override
  String get confirm => 'Confirmer';

  @override
  String get loading => 'Chargement...';

  @override
  String get retry => 'Réessayer';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Demandes reçues';

  @override
  String get noPendingRequests => 'Aucune demande en attente';

  @override
  String get pendingRequestsSubtitle => 'Ces personnes souhaitent vous ajouter';

  @override
  String requestFromUser(String hashId) {
    return 'Demande de $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Expire dans $days jours';
  }

  @override
  String get acceptRequest => 'Accepter';

  @override
  String get rejectRequest => 'Refuser';

  @override
  String get requestAccepted => 'Demande acceptée';

  @override
  String get requestRejected => 'Demande refusée';

  @override
  String get requestSent => 'Demande envoyée !';

  @override
  String get requestSentSubtitle =>
      'Votre demande a été envoyée. L\'utilisateur doit l\'accepter pour que vous puissiez discuter.';

  @override
  String get requestAlreadyPending => 'Une demande est déjà en attente';

  @override
  String get requestAlreadySentByOther =>
      'Cette personne vous a déjà envoyé une demande';

  @override
  String get addByHashId => 'Ajouter par Hash ID';

  @override
  String get addByHashIdSubtitle =>
      'Entrez le Hash ID et le code temporaire du contact';

  @override
  String get enterTemporaryCode => 'Entrez le code à 6 chiffres';

  @override
  String get sendRequest => 'Envoyer la demande';

  @override
  String get acceptContactTitle => 'Accepter le contact';

  @override
  String get acceptContactSubtitle =>
      'Vous pouvez lui donner un nom personnalisé';

  @override
  String get leaveEmptyForHashId => 'Laisser vide pour utiliser le Hash ID';

  @override
  String get firstName => 'Prénom';

  @override
  String get lastName => 'Nom';

  @override
  String get notes => 'Notes';

  @override
  String get notesHint => 'Notes personnelles sur ce contact';

  @override
  String get photoOptional => 'Photo (optionnel)';

  @override
  String get contactNameOptional => 'Nom (optionnel)';

  @override
  String get notesOptional => 'Notes (optionnel)';

  @override
  String get storedLocally => 'Stocké sur votre appareil uniquement';

  @override
  String get encryptedMessageLabel => 'Message chiffré';

  @override
  String get identityMessageHint =>
      'Qui êtes-vous ? Comment vous connaissez-vous ?';

  @override
  String get messageWillBeSentEncrypted =>
      'Ce message sera chiffré et envoyé au destinataire';

  @override
  String get sendRequestButton => 'Envoyer la demande';

  @override
  String get requestExpiresIn24h =>
      'La demande expire dans 24h si elle n\'est pas acceptée';

  @override
  String get theyAlreadySentYouRequest =>
      'Cette personne vous a déjà envoyé une demande';

  @override
  String get requests => 'Demandes';

  @override
  String get receivedRequests => 'Reçues';

  @override
  String get sentRequests => 'Envoyées';

  @override
  String get noSentRequests => 'Aucune demande envoyée';

  @override
  String get cancelRequest => 'Annuler';

  @override
  String get deleteRequest => 'Supprimer la demande';

  @override
  String get requestCancelled => 'Demande annulée';

  @override
  String sentTo(String hashId) {
    return 'Envoyée à $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Expire dans $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Reçue il y a $time';
  }

  @override
  String get messageFromRequester => 'Message du demandeur';

  @override
  String get copy => 'Copier';

  @override
  String get messageInfo => 'Informations du message';

  @override
  String get messageDirection => 'Direction';

  @override
  String get messageSentByYou => 'Envoyé par vous';

  @override
  String get messageReceived => 'Reçu';

  @override
  String get messageSentAt => 'Envoyé le';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Statut';

  @override
  String get messageReadAt => 'Lu le';

  @override
  String get messageType => 'Type';

  @override
  String get messageSize => 'Taille';

  @override
  String get messageExpiresAt => 'Expire le';

  @override
  String get messageEncrypted => 'Chiffré de bout en bout';

  @override
  String get messageStatusSending => 'Envoi...';

  @override
  String get messageStatusSent => 'Envoyé';

  @override
  String get messageStatusDelivered => 'Délivré';

  @override
  String get messageStatusRead => 'Lu';

  @override
  String get messageStatusFailed => 'Échec';

  @override
  String get serverStatus => 'Serveur';

  @override
  String get onServer => 'En attente de livraison';

  @override
  String get deletedFromServer => 'Supprimé';

  @override
  String get messageTypeText => 'Texte';

  @override
  String get messageTypeImage => 'Image';

  @override
  String get messageTypeVideo => 'Vidéo';

  @override
  String get messageTypeVoice => 'Audio';

  @override
  String get messageTypeFile => 'Fichier';

  @override
  String get indefinitely => 'Indéfiniment';

  @override
  String get hoursShort => 'h';

  @override
  String get minutesShort => 'min';

  @override
  String get hours => 'heures';

  @override
  String get minutes => 'minutes';

  @override
  String get seconds => 'secondes';

  @override
  String get ephemeralMessages => 'Messages éphémères';

  @override
  String get ephemeralMessagesDescription =>
      'Les messages sont automatiquement supprimés après ce délai';

  @override
  String get ephemeralImmediate => 'Immédiat';

  @override
  String get ephemeralImmediateDesc => 'Supprimé dès que lu';

  @override
  String get ephemeralMyPreference => 'Ma préférence';

  @override
  String get ephemeralMyPreferenceDesc => 'Utiliser le réglage global';

  @override
  String get ephemeralDefaultSetting => 'Durée des messages';

  @override
  String get ephemeralChooseDefault => 'Recommandé';

  @override
  String get ephemeral30Seconds => '30 secondes';

  @override
  String get ephemeral30SecondsDesc => 'Supprimé 30s après lecture';

  @override
  String get ephemeral5Minutes => '5 minutes';

  @override
  String get ephemeral5MinutesDesc => 'Supprimé 5min après lecture';

  @override
  String get ephemeral1Hour => '1 heure';

  @override
  String get ephemeral1HourDesc => 'Supprimé 1h après lecture';

  @override
  String get ephemeral3Hours => '3 heures';

  @override
  String get ephemeral6Hours => '6 heures';

  @override
  String get ephemeral6HoursDesc => 'Supprimé 6h après lecture';

  @override
  String get ephemeral12Hours => '12 heures';

  @override
  String get ephemeral24Hours => '24 heures';

  @override
  String get ephemeral24HoursDesc => 'Supprimé 24h après lecture';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Durée personnalisée';

  @override
  String get howItWorks => 'Comment ça marche ?';

  @override
  String get ephemeralExplanation1 =>
      'Les messages sont déjà supprimés du serveur dès leur réception.';

  @override
  String get ephemeralExplanation2 =>
      'Ce réglage définit quand les messages disparaissent de VOTRE téléphone après les avoir lus.';

  @override
  String get ephemeralExplanation3 =>
      'Votre contact a son propre réglage pour son téléphone.';

  @override
  String get mute1Hour => '1 heure';

  @override
  String get mute8Hours => '8 heures';

  @override
  String get mute1Day => '1 jour';

  @override
  String get mute1Week => '1 semaine';

  @override
  String get muteAlways => 'Toujours';

  @override
  String get muteExplanation =>
      'Vous ne recevrez plus de notifications pour ce contact';

  @override
  String get showCallsInRecents => 'Afficher dans les appels récents';

  @override
  String get showCallsInRecentsSubtitle =>
      'Les appels Hash apparaissent dans l\'historique du téléphone';

  @override
  String get feedback => 'Feedback';

  @override
  String get muteNotifications => 'Couper les notifications';

  @override
  String get muteDescription =>
      'Vous ne recevrez pas de notifications pour ce contact';

  @override
  String mutedUntil(String time) {
    return 'Muet jusqu\'à $time';
  }

  @override
  String get notMuted => 'Notifications activées';

  @override
  String get unmute => 'Réactiver';

  @override
  String get notificationSound => 'Son de notification';

  @override
  String get defaultSound => 'Par défaut';

  @override
  String get chatSettings => 'Paramètres du chat';

  @override
  String get bubbleColor => 'Couleur des bulles';

  @override
  String get backgroundColor => 'Couleur de fond';

  @override
  String get backgroundImage => 'Image de fond';

  @override
  String get chatBackground => 'Fond du chat';

  @override
  String get customColor => 'Personnalisée';

  @override
  String get defaultColor => 'Par défaut';

  @override
  String get imageSelected => 'Image sélectionnée';

  @override
  String get noImage => 'Aucune image';

  @override
  String get color => 'Couleur';

  @override
  String get image => 'Image';

  @override
  String get tapToSelectImage => 'Appuyez pour sélectionner une image';

  @override
  String get changeImage => 'Changer d\'image';

  @override
  String get previewMessageReceived => 'Salut !';

  @override
  String get previewMessageSent => 'Coucou !';

  @override
  String get messageAction => 'Message';

  @override
  String get callAction => 'Appel';

  @override
  String get videoAction => 'Vidéo';

  @override
  String get personalNotes => 'Notes personnelles';

  @override
  String get addNotes => 'Ajouter des notes...';

  @override
  String get noNotes => 'Aucune note';

  @override
  String get messageNotifications => 'Notifications des messages';

  @override
  String get callNotifications => 'Notifications des appels';

  @override
  String get useGradient => 'Utiliser un dégradé';

  @override
  String get gradientStart => 'Couleur de début';

  @override
  String get gradientEnd => 'Couleur de fin';

  @override
  String get preview => 'Aperçu';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get securityNumber => 'Numéro de sécurité';

  @override
  String securityNumberDescription(String name) {
    return 'Vérifiez que le numéro de sécurité correspond à l\'appareil de $name';
  }

  @override
  String get verifyEncryption => 'Vérifier le chiffrement de bout en bout';

  @override
  String get tapToCopy => 'Appuyez pour copier';

  @override
  String get howToVerify => 'Comment vérifier';

  @override
  String get verifyStep1 =>
      'Rencontrez votre contact en personne ou appelez-le';

  @override
  String get verifyStep2 =>
      'Comparez les numéros de sécurité ou scannez les QR codes';

  @override
  String get verifyStep3 => 'S\'ils correspondent, votre chat est sécurisé';

  @override
  String get scanToVerify => 'Scanner pour vérifier';

  @override
  String get reportSpam => 'Signaler comme spam';

  @override
  String get reportSpamSubtitle => 'Signaler ce contact comme spam';

  @override
  String get reportSpamDescription =>
      'Ce contact sera signalé de manière anonyme. Votre identité ne sera pas partagée. Êtes-vous sûr ?';

  @override
  String get report => 'Signaler';

  @override
  String get spamReported => 'Spam signalé';

  @override
  String get reportError =>
      'Échec de l\'envoi du signalement. Veuillez réessayer.';

  @override
  String get reportRateLimited =>
      'Vous avez atteint le nombre maximum de signalements pour aujourd\'hui.';

  @override
  String get blockContact => 'Bloquer le contact';

  @override
  String get blockContactDescription =>
      'Ce contact ne pourra plus vous envoyer de messages ni vous appeler. Il ne sera pas notifié.';

  @override
  String get unblockContact => 'Débloquer le contact';

  @override
  String get unblockContactDescription =>
      'Ce contact pourra à nouveau vous envoyer des messages et vous appeler.';

  @override
  String get contactBlocked => 'Contact bloqué';

  @override
  String get contactUnblocked => 'Contact débloqué';

  @override
  String get contactIsBlocked => 'Ce contact est bloqué';

  @override
  String get unblock => 'Débloquer';

  @override
  String get deleteContactSubtitle => 'Supprimer ce contact et le chat';

  @override
  String get confirmWithPin => 'Confirmer avec le PIN';

  @override
  String get enterPinToConfirm =>
      'Entrez votre PIN pour confirmer cette action';

  @override
  String get profilePhoto => 'Photo de profil';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get chooseFromGallery => 'Choisir dans la galerie';

  @override
  String get removePhoto => 'Supprimer la photo';

  @override
  String get viewContactHashId => 'Voir l\'identifiant du contact';

  @override
  String get hashIdPartiallyMasked =>
      'Partiellement masqué pour votre sécurité et celle de votre interlocuteur';

  @override
  String get addFirstContact => 'Ajoutez votre premier contact';

  @override
  String get addFirstContactSubtitle =>
      'Partagez votre QR code ou scannez celui d\'un ami';

  @override
  String get directory => 'Répertoire';

  @override
  String get noContacts => 'Aucun contact';

  @override
  String get noContactsSubtitle => 'Ajoutez un contact pour commencer';

  @override
  String get sendMessageAction => 'Envoyer un message';

  @override
  String get audioCall => 'Appel audio';

  @override
  String get videoCall => 'Appel vidéo';

  @override
  String get viewProfile => 'Voir le profil';

  @override
  String get deleteContactDirectory => 'Supprimer le contact';

  @override
  String get scanShort => 'Scanner';

  @override
  String get addShort => 'Ajouter';

  @override
  String deleteContactConfirmName(String name) {
    return 'Voulez-vous vraiment supprimer $name ?';
  }

  @override
  String get noNotesTitle => 'Aucune note';

  @override
  String get noNotesSubtitle => 'Créez votre première note';

  @override
  String get newNote => 'Nouvelle note';

  @override
  String get editNote => 'Modifier la note';

  @override
  String get deleteNote => 'Supprimer la note';

  @override
  String get deleteNoteConfirm => 'Voulez-vous vraiment supprimer cette note ?';

  @override
  String get noteTitle => 'Titre';

  @override
  String get noteContent => 'Contenu';

  @override
  String get addItem => 'Ajouter un élément';

  @override
  String get pinNote => 'Épingler';

  @override
  String get unpinNote => 'Désépingler';

  @override
  String get noteColor => 'Couleur';

  @override
  String get notePassword => 'Mot de passe';

  @override
  String get setPassword => 'Définir un mot de passe';

  @override
  String get changePassword => 'Modifier le mot de passe';

  @override
  String get removePassword => 'Retirer le mot de passe';

  @override
  String get enterPassword => 'Entrez le mot de passe';

  @override
  String get confirmPassword => 'Confirmez le mot de passe';

  @override
  String get passwordPin => 'Code PIN';

  @override
  String get passwordText => 'Mot de passe texte';

  @override
  String get protectedNote => 'Note protégée';

  @override
  String get incorrectPassword => 'Mot de passe incorrect';

  @override
  String get passwordSet => 'Mot de passe défini';

  @override
  String get passwordRemoved => 'Mot de passe retiré';

  @override
  String get notesBiometric => 'Face ID pour les notes';

  @override
  String get notesBiometricSubtitle =>
      'Exiger l\'authentification biométrique pour ouvrir les notes protégées';

  @override
  String get textNote => 'Note texte';

  @override
  String get checklistNote => 'Liste de tâches';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total tâches';
  }

  @override
  String get autoSaved => 'Sauvegardé';

  @override
  String get searchNotes => 'Rechercher une note';

  @override
  String get legalConsent => 'Consentement légal';

  @override
  String get confirmAge13 => 'Je confirme avoir au moins 13 ans';

  @override
  String get acceptLegalStart => 'J\'accepte la ';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get andThe => ' et les ';

  @override
  String get continueButton => 'Continuer';

  @override
  String get mustAcceptTerms =>
      'Vous devez accepter les deux conditions pour continuer';

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
  String get support => 'Support';

  @override
  String get contactSupport => 'Contacter le support';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Signaler un abus';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Légal';

  @override
  String get legalEntity => 'Entité légale';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Épingler';

  @override
  String get unpinConversation => 'Désépingler';

  @override
  String get hideConversation => 'Retirer du fil';

  @override
  String get deleteConversation => 'Supprimer la conversation';

  @override
  String get deleteConversationConfirm =>
      'Entrez votre code PIN pour confirmer la suppression de tous les messages';

  @override
  String get noConversations => 'Aucune conversation';

  @override
  String get startConversation => 'Démarrer';

  @override
  String get microphonePermissionRequired => 'Accès au microphone requis';

  @override
  String get microphonePermissionExplanation =>
      'Hash a besoin du microphone pour passer des appels.';

  @override
  String get cameraPermissionExplanation =>
      'Hash a besoin de la caméra pour les appels vidéo.';

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
  String get openSettings => 'Ouvrir les réglages';

  @override
  String get callConnecting => 'Connexion...';

  @override
  String get callRinging => 'Appel en cours...';

  @override
  String get callReconnecting => 'Reconnexion...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Reconnexion (${seconds}s)';
  }

  @override
  String get callPaused => 'En pause';

  @override
  String get callPausedSubtitle => 'L\'appel est toujours en cours';

  @override
  String get callRemoteMicMuted => 'Micro de l\'interlocuteur coupé';

  @override
  String get callMiniControlsMute => 'Couper le micro';

  @override
  String get callMiniControlsUnmute => 'Activer le micro';

  @override
  String get callMiniControlsHangUp => 'Raccrocher';

  @override
  String get callMiniControlsReturn => 'Revenir à l\'appel';

  @override
  String get callNetworkPoor => 'Connexion instable';

  @override
  String get callNetworkLost => 'Connexion perdue';

  @override
  String get callEndedTitle => 'Appel terminé';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Sur votre appareil';

  @override
  String get deviceDataSubtitle => 'Voir qui possède vos données';

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
  String get localStorage => 'Stockage local';

  @override
  String get onThisDevice => 'sur cet appareil';

  @override
  String get encryptedDatabases => 'Bases de données chiffrées';

  @override
  String get files => 'Fichiers';

  @override
  String get secureKeychain => 'Trousseau sécurisé';

  @override
  String get cache => 'Cache';

  @override
  String get contactsDetail => 'Noms, avatars, clés Signal';

  @override
  String get messagesDetail => 'Conversations chiffrées';

  @override
  String get notesDetail => 'Notes personnelles';

  @override
  String get signalSessions => 'Sessions Signal';

  @override
  String get signalSessionsDetail => 'Sessions de chiffrement';

  @override
  String get pendingContacts => 'Contacts en attente';

  @override
  String get pendingContactsDetail => 'Demandes en cours';

  @override
  String get callHistory => 'Appels';

  @override
  String get callHistoryDetail => 'Historique des appels';

  @override
  String get preferences => 'Préférences';

  @override
  String get preferencesDetail => 'Préférences médias et appels';

  @override
  String get avatars => 'Avatars';

  @override
  String get media => 'Médias';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '1 fichier',
      zero: 'aucun fichier',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Actif';

  @override
  String get notDefined => 'Non défini';

  @override
  String get biometrics => 'Biométrie';

  @override
  String get recoveryPhrase => 'Phrase de récupération';

  @override
  String get identity => 'Identité (Hash ID)';

  @override
  String get signalKeys => 'Clés Signal Protocol';

  @override
  String get authTokens => 'Jetons d\'authentification';

  @override
  String get contactNamesCache => 'Cache noms contacts';

  @override
  String get remoteConfig => 'Config distante';

  @override
  String get notificationPrefs => 'Préférences notifications';

  @override
  String get serverData => 'Données sur le serveur';

  @override
  String get serverDataInfo =>
      'Hash conserve un minimum de données sur le serveur, toutes chiffrées ou temporaires.';

  @override
  String get serverProfile => 'Profil';

  @override
  String get serverProfileDetail => 'Hash ID, clés publiques, jeton de boîte';

  @override
  String get serverPrekeys => 'Pré-clés';

  @override
  String get serverPrekeysDetail => 'Clés Signal à usage unique (consommées)';

  @override
  String get serverMessages => 'Messages en transit';

  @override
  String get serverMessagesDetail => 'Supprimés après réception (24h max)';

  @override
  String get serverMedia => 'Médias en transit';

  @override
  String get serverMediaDetail => 'Supprimés après téléchargement';

  @override
  String get serverContactRequests => 'Demandes de contact';

  @override
  String get serverContactRequestsDetail => 'Expirent après 24h';

  @override
  String get serverRateLimits => 'Limites de débit';

  @override
  String get serverRateLimitsDetail => 'Données temporaires anti-abus';

  @override
  String get privacyReassurance =>
      'Hash ne peut pas lire vos messages. Toutes les données sont chiffrées de bout en bout. Les données serveur sont supprimées automatiquement.';

  @override
  String get pinTooSimple =>
      'Ce code PIN est trop simple. Choisissez un code plus sécurisé.';

  @override
  String get genericError => 'Une erreur est survenue. Veuillez réessayer.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Impossible de créer le compte : $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Phrase copiée dans le presse-papiers';

  @override
  String get copyPhrase => 'Copier la phrase';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Notez cette phrase dans un endroit sûr. Si vous perdez votre code PIN sans cette phrase, vous perdrez définitivement l\'accès à vos données.';

  @override
  String get noMessages => 'Aucun message';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Supprimer tous les messages avec $name ?';
  }

  @override
  String get confirmation => 'Confirmation';

  @override
  String get untitled => 'Sans titre';

  @override
  String get noSessions => 'Aucune session';

  @override
  String get unknownContact => 'Contact inconnu';

  @override
  String get unnamed => 'Sans nom';

  @override
  String get noPendingRequestsAlt => 'Aucune demande en attente';

  @override
  String get deleteAllCallHistory =>
      'Supprimer tout l\'historique des appels ?';

  @override
  String get noCalls => 'Aucun appel';

  @override
  String get noPreferences => 'Aucune préférence';

  @override
  String get resetAllMediaPrefs =>
      'Réinitialiser toutes les préférences médias ?';

  @override
  String get deleteThisAvatar => 'Supprimer cet avatar ?';

  @override
  String get deleteAllAvatars => 'Supprimer tous les avatars ?';

  @override
  String get noAvatars => 'Aucun avatar';

  @override
  String get deleteThisFile => 'Supprimer ce fichier ?';

  @override
  String get deleteAllMediaFiles => 'Supprimer tous les médias ?';

  @override
  String get noMediaFiles => 'Aucun média';

  @override
  String get outgoing => 'Sortant';

  @override
  String get incoming => 'Entrant';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Vue éphémère : ${seconds}s';
  }

  @override
  String get normalView => 'Vue normale';

  @override
  String get callReasonCompleted => 'Terminé';

  @override
  String get callReasonMissed => 'Manqué';

  @override
  String get callReasonDeclined => 'Refusé';

  @override
  String get callReasonFailed => 'Échoué';

  @override
  String get justNow => 'À l\'instant';

  @override
  String timeAgoMinutes(int count) {
    return 'Il y a $count min';
  }

  @override
  String timeAgoHours(int count) {
    return 'Il y a ${count}h';
  }

  @override
  String timeAgoDays(int count) {
    return 'Il y a ${count}j';
  }

  @override
  String get messageTypeContact => 'Contact';

  @override
  String get messageTypeLocation => 'Position';

  @override
  String get statusQueued => 'En file';

  @override
  String get blockedBadge => 'Bloqué';

  @override
  String get protectedBadge => 'Protégée';

  @override
  String messageCount(int count) {
    return '$count message(s)';
  }

  @override
  String get deleteQuestion => 'Supprimer ?';

  @override
  String get transferMyAccountTitle => 'Transférer mon compte';

  @override
  String get loadingError => 'Erreur de chargement';

  @override
  String get transferToNewDevice => 'Transférer vers un nouvel appareil';

  @override
  String get transferInstructions =>
      'Sur votre nouvel appareil, choisissez \"Récupérer mon compte\" et entrez ces informations :';

  @override
  String get yourHashIdLabel => 'Votre Hash ID';

  @override
  String get enterYourPinCode => 'Entrez votre code PIN';

  @override
  String get pinOwnerConfirmation =>
      'Pour confirmer que vous êtes le propriétaire de ce compte';

  @override
  String get scanThisQrCode => 'Scannez ce QR code';

  @override
  String get withYourNewDevice => 'Avec votre nouvel appareil';

  @override
  String get orEnterTheCode => 'ou entrez le code';

  @override
  String get transferCodeLabel => 'Code de transfert';

  @override
  String get proximityVerification => 'Vérification de proximité';

  @override
  String get bringDevicesCloser => 'Rapprochez les deux appareils';

  @override
  String get confirmTransferQuestion => 'Confirmer le transfert ?';

  @override
  String get accountWillBeTransferred =>
      'Votre compte sera transféré vers le nouvel appareil.\n\nCet appareil sera définitivement déconnecté.';

  @override
  String get transferComplete => 'Transfert terminé';

  @override
  String get transferSuccessMessage =>
      'Votre compte a été transféré avec succès.\n\nCette application va maintenant se fermer.';

  @override
  String get manualVerification => 'Vérification manuelle';

  @override
  String get codeDisplayedOnBothDevices =>
      'Code affiché sur les deux appareils :';

  @override
  String get doesCodeMatchNewDevice =>
      'Ce code correspond-il à celui du nouvel appareil ?';

  @override
  String get verifiedStatus => 'Vérifié';

  @override
  String get inProgressStatus => 'En cours...';

  @override
  String get notAvailableStatus => 'Non disponible';

  @override
  String get codeExpiredRestart => 'Le code a expiré. Veuillez recommencer.';

  @override
  String get codesDoNotMatchCancelled =>
      'Les codes ne correspondent pas. Transfert annulé.';

  @override
  String transferToDevice(String device) {
    return 'Vers : $device';
  }

  @override
  String get copiedExclamation => 'Copié !';

  @override
  String expiresInTime(String time) {
    return 'Expire dans $time';
  }

  @override
  String get biometricNotAvailable =>
      'La biométrie n\'est pas disponible sur cet appareil';

  @override
  String get biometricAuthError =>
      'Erreur lors de l\'authentification biométrique';

  @override
  String get authenticateForBiometric =>
      'Veuillez vous authentifier pour activer la biométrie';

  @override
  String get biometricAuthFailed => 'Authentification biométrique échouée';

  @override
  String get forceUpdateTitle => 'Mise à jour requise';

  @override
  String get forceUpdateMessage =>
      'Une nouvelle version de Hash est disponible. Veuillez mettre à jour pour continuer.';

  @override
  String get updateButton => 'Mettre à jour';

  @override
  String get maintenanceInProgress => 'Maintenance en cours';

  @override
  String get tryAgainLater => 'Veuillez réessayer plus tard';

  @override
  String get information => 'Information';

  @override
  String get later => 'Plus tard';

  @override
  String get doYouLikeHash => 'Aimez-vous Hash ?';

  @override
  String get yourFeedbackHelps =>
      'Votre avis nous aide à améliorer l\'application';

  @override
  String get ratingTerrible => 'Terrible';

  @override
  String get ratingBad => 'Mauvais';

  @override
  String get ratingOk => 'Correct';

  @override
  String get ratingGood => 'Bien';

  @override
  String get ratingExcellent => 'Excellent !';

  @override
  String get donationMessage =>
      'Hash est un projet à but non lucratif. Votre soutien nous permet de continuer à développer une messagerie vraiment privée.';

  @override
  String get recentConnections => 'Connexions récentes';

  @override
  String get loginInfoText =>
      'Chaque déverrouillage par PIN est enregistré localement. Seules les 24 dernières heures sont conservées.';

  @override
  String get connectionCount => 'Connexion(s)';

  @override
  String get periodLabel => 'Période';

  @override
  String get historyLabel => 'Historique';

  @override
  String get noLoginRecorded => 'Aucune connexion enregistrée';

  @override
  String get nextUnlocksAppearHere =>
      'Les prochains déverrouillages apparaîtront ici.';

  @override
  String get dataLocalOnly =>
      'Ces données sont stockées uniquement sur votre appareil et ne sont jamais transmises.';

  @override
  String get currentSession => 'Actuelle';

  @override
  String get todayLabel => 'Aujourd\'hui';

  @override
  String get yesterdayLabel => 'Hier';

  @override
  String get justNowLabel => 'À l\'instant';

  @override
  String minutesAgoLabel(int count) {
    return 'Il y a $count min';
  }

  @override
  String hoursAgoLabel(int hours) {
    return 'Il y a ${hours}h';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return 'Il y a ${hours}h ${minutes}min';
  }

  @override
  String get noMaintenancePlanned => 'Aucune maintenance prévue';

  @override
  String get everythingWorkingNormally => 'Tout fonctionne normalement';

  @override
  String get maintenanceTitle => 'Maintenance';

  @override
  String get maintenanceActiveLabel => 'EN COURS';

  @override
  String get maintenancePlannedLabel => 'PRÉVUE';

  @override
  String get locking => 'Verrouillage...';

  @override
  String get newMessageNotification => 'Nouveau message';

  @override
  String get secExplainTitle => 'Comment Hash te protège';

  @override
  String get secExplainIntro =>
      'Hash est conçu pour que personne ne puisse lire tes messages.';

  @override
  String get secExplainIntroSub =>
      'Pas même nous.\nVoici comment ça fonctionne, expliqué simplement.';

  @override
  String get secJourneyLabel => 'LE PARCOURS';

  @override
  String get secJourneyTitle => 'Le voyage de ton message';

  @override
  String get secJourneySubtitle =>
      'De ton doigt jusqu\'à l\'écran de ton contact, chaque étape est protégée. Suis le chemin.';

  @override
  String get secStep1Title => 'Tu écris ton message';

  @override
  String get secStep1Desc =>
      'Tu tapes \"Salut !\" dans l\'application. À ce moment, le message existe uniquement dans la mémoire de ton téléphone. Rien n\'a été envoyé.';

  @override
  String get secStep2Title => 'Chiffrement avec le protocole Signal';

  @override
  String get secStep2Desc =>
      'Dès que tu appuies sur \"Envoyer\", ton message est transformé en une suite de caractères incompréhensibles. C\'est comme si ton message était enfermé dans un coffre-fort dont seul ton contact possède la clé.';

  @override
  String get secStep3Title => 'Sealed Sender : l\'enveloppe invisible';

  @override
  String get secStep3Desc =>
      'Imagine que tu envoies une lettre par la poste, mais sans adresse d\'expéditeur sur l\'enveloppe. C\'est exactement ce que fait Hash. Le message est déposé dans une boîte aux lettres anonyme. Le serveur ne sait pas qui l\'a envoyé.';

  @override
  String get secStep4Title => 'Le serveur ne voit rien';

  @override
  String get secStep4Desc =>
      'Le serveur joue le rôle d\'un facteur aveugle. Il sait juste \"quelqu\'un a déposé quelque chose dans la boîte #A7X9\". Il ne sait pas qui l\'a envoyé, ce que c\'est, ni à qui c\'est destiné.';

  @override
  String get secStep4Highlight =>
      'Aucune métadonnée stockée : pas d\'adresse IP, pas d\'horodatage, pas de lien entre expéditeur et destinataire.';

  @override
  String get secStep5Title => 'Ton contact reçoit le message';

  @override
  String get secStep5Desc =>
      'Le téléphone de ton contact récupère le contenu de sa boîte aux lettres anonyme et déchiffre le message avec sa clé privée, qui n\'a jamais quitté son appareil. \"Salut !\" apparaît sur son écran.';

  @override
  String get secStep6Title => 'Le message disparaît du serveur';

  @override
  String get secStep6Desc =>
      'Dès que ton contact confirme la réception, le serveur supprime définitivement le message. Pas de corbeille, pas d\'archive, pas de sauvegarde. Même les messages non lus sont automatiquement détruits après 24 heures.';

  @override
  String get secStep7Title => 'Expiration locale';

  @override
  String get secStep7Desc =>
      'Sur le téléphone de ton contact, le message s\'auto-détruit selon la durée que tu as choisie : immédiatement après lecture, 5 minutes, 1 heure... tu décides.';

  @override
  String get secJourneyConclusion =>
      'Résultat : zéro trace sur le serveur, zéro trace sur les appareils. Le message a existé le temps d\'être lu, puis il a disparu.';

  @override
  String get secArchLabel => 'ARCHITECTURE';

  @override
  String get secArchTitle => '5 couches de protection';

  @override
  String get secArchSubtitle =>
      'Hash ne repose pas sur une seule technologie. Chaque couche renforce les autres. Même si une couche est compromise, tes données restent en sécurité.';

  @override
  String get secLayer1Title => 'Chiffrement de bout en bout';

  @override
  String get secLayer1Desc =>
      'Chaque message est chiffré avec une clé unique. En termes simples : même si quelqu\'un déchiffre un message, il ne pourra pas déchiffrer le suivant. Chaque message a son propre cadenas.';

  @override
  String get secLayer1Detail =>
      'Pour les fichiers (photos, vidéos, documents), Hash utilise un chiffrement AES-256-GCM supplémentaire. Le fichier est chiffré avant de quitter ton téléphone.';

  @override
  String get secLayer2Title => 'Sealed Sender (anonymat réseau)';

  @override
  String get secLayer2Desc =>
      'Les messageries classiques envoient tes messages avec ton identité attachée. C\'est comme écrire ton nom sur l\'enveloppe. Hash utilise des boîtes aux lettres anonymes : le serveur dépose le message sans savoir qui l\'a envoyé.';

  @override
  String get secLayer2Detail =>
      'Résultat : même en cas de fuite de données du serveur, il est impossible de reconstituer qui parle à qui.';

  @override
  String get secLayer3Title => 'Suppression automatique';

  @override
  String get secLayer3Desc =>
      'Les messages sont supprimés du serveur dès réception confirmée. Même si un message n\'est jamais récupéré, il est automatiquement détruit après 24 heures.';

  @override
  String get secLayer3Detail =>
      'Sur ton téléphone, les messages s\'auto-détruisent selon la durée que tu choisis : immédiatement, 5 min, 15 min, 30 min, 1h, 3h, 6h ou 12h.';

  @override
  String get secLayer4Title => 'Protection d\'accès local';

  @override
  String get secLayer4Desc =>
      'L\'application est protégée par un code PIN à 6 chiffres et/ou la biométrie (Face ID, empreinte digitale). Après trop de tentatives échouées, l\'application se verrouille avec un délai qui augmente à chaque échec.';

  @override
  String get secLayer5Title => 'Base de données verrouillée';

  @override
  String get secLayer5Desc =>
      'Côté serveur, aucun utilisateur ne peut écrire directement dans la base de données. Toutes les actions passent par des fonctions sécurisées qui vérifient chaque demande.';

  @override
  String get secLayer5Detail =>
      'C\'est comme un guichet de banque : tu ne touches jamais le coffre toi-même. Tu fais une demande, et le système vérifie que tu as le droit avant d\'agir.';

  @override
  String get secVashLabel => 'UNIQUE AU MONDE';

  @override
  String get secVashTitle => 'Mode Vash';

  @override
  String get secVashSubtitle =>
      'Un système de sécurité d\'urgence qui n\'existe dans aucune autre application de messagerie.';

  @override
  String get secVashScenarioTitle => 'Imagine cette situation';

  @override
  String get secVashScenario1 => 'Quelqu\'un accède à ton téléphone';

  @override
  String get secVashScenario2 => 'On te demande ton code PIN';

  @override
  String get secVashScenario3 =>
      'Tu veux effacer toutes tes données en urgence';

  @override
  String get secVashSolutionTitle => 'La solution : deux codes PIN';

  @override
  String get secVashSolutionDesc =>
      'Tu configures deux codes PIN différents dans Hash :';

  @override
  String get secVashNormalCodeLabel => 'Code normal';

  @override
  String get secVashNormalCodeDesc =>
      'Ouvre l\'application normalement avec toutes tes données';

  @override
  String get secVashCodeLabel2 => 'Code Vash';

  @override
  String get secVashCodeDescription =>
      'Ouvre l\'application normalement... mais toutes tes données sont silencieusement supprimées en arrière-plan';

  @override
  String get secVashWhatHappensTitle => 'Ce qui se passe ensuite';

  @override
  String get secVashWhatHappensDesc =>
      'L\'application s\'ouvre normalement. Pas d\'alerte, pas d\'animation suspecte. L\'écran affiche simplement une application vide, comme si tu venais de l\'installer.\n\nEn réalité, toutes tes conversations, contacts et messages ont été irréversiblement supprimés en une fraction de seconde.';

  @override
  String get secCallsLabel => 'APPELS & FICHIERS';

  @override
  String get secCallsTitle => 'Tout est chiffré';

  @override
  String get secCallsSubtitle =>
      'Ce n\'est pas que les messages. Absolument tout ce qui transite par Hash est chiffré de bout en bout.';

  @override
  String get secAudioCallTitle => 'Appels audio';

  @override
  String get secAudioCallDesc =>
      'Chiffrés de bout en bout via WebRTC. La voix est transmise directement entre les appareils.';

  @override
  String get secVideoCallTitle => 'Appels vidéo';

  @override
  String get secVideoCallDesc =>
      'Même technologie, chaque flux chiffré individuellement.';

  @override
  String get secPhotosTitle => 'Photos & vidéos';

  @override
  String get secPhotosDesc =>
      'Chiffrés en AES-256-GCM avant de quitter ton téléphone.';

  @override
  String get secDocsTitle => 'Documents';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, tout fichier. Nom, taille et contenu chiffrés.';

  @override
  String get secAnonLabel => 'ANONYMAT';

  @override
  String get secAnonTitle => 'Aucune identité requise';

  @override
  String get secAnonSubtitle =>
      'Hash ne demande jamais ton numéro de téléphone ni ton email. Tu es identifié par un Hash ID unique et anonyme.';

  @override
  String get secHashIdTitle => 'Ton Hash ID';

  @override
  String get secHashIdDesc =>
      'C\'est ton identifiant unique. Il ne révèle rien sur toi : ni ton nom, ni ton numéro, ni ta localisation. C\'est comme un pseudonyme impossible à relier à ta vraie identité.\n\nPour ajouter un contact, tu partages ton Hash ID ou tu scannes un QR code. C\'est tout. Pas de carnet d\'adresses synchronisé, pas de suggestions \"Personnes que tu connais\".';

  @override
  String get secDataLabel => 'DONNÉES';

  @override
  String get secDataTitle => 'Ce que Hash ne sait pas';

  @override
  String get secDataSubtitle =>
      'La meilleure façon de protéger tes données, c\'est de ne pas les collecter.';

  @override
  String get secNeverCollected => 'Jamais collecté';

  @override
  String get secNeverItem1 => 'Contenu des messages';

  @override
  String get secNeverItem2 => 'Liste de contacts';

  @override
  String get secNeverItem3 => 'Numéro de téléphone';

  @override
  String get secNeverItem4 => 'Adresse email';

  @override
  String get secNeverItem5 => 'Adresse IP';

  @override
  String get secNeverItem6 => 'Localisation';

  @override
  String get secNeverItem7 => 'Métadonnées (qui parle à qui)';

  @override
  String get secNeverItem8 => 'Historique d\'appels';

  @override
  String get secNeverItem9 => 'Carnet d\'adresses';

  @override
  String get secNeverItem10 => 'Identifiants publicitaires';

  @override
  String get secTempStored => 'Stocké temporairement';

  @override
  String get secTempItem1 => 'Hash ID anonyme (identifiant unique)';

  @override
  String get secTempItem2 => 'Clés publiques de chiffrement';

  @override
  String get secTempItem3 => 'Messages chiffrés en transit (max 24h)';

  @override
  String get secTempNote =>
      'Même ces données minimales ne permettent pas de t\'identifier. Ton Hash ID n\'est lié à aucune information personnelle.';

  @override
  String get secFooterTitle => 'Ta vie privée, ta liberté';

  @override
  String get secFooterDesc =>
      'Hash utilise les mêmes technologies de chiffrement que les applications professionnelles les plus exigeantes. Tes messages sont protégés par les mathématiques, pas par des promesses.';

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
