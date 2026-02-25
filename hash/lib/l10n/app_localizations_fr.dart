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
  String get conversations => 'Chats';

  @override
  String get noConversation => 'Aucun chat';

  @override
  String get noConversationSubtitle =>
      'Ajoutez un contact pour commencer à discuter en toute sécurité';

  @override
  String get addContact => 'Ajouter un contact';

  @override
  String get shareApp => 'Partager l\'application';

  @override
  String get newMessage => 'Nouveau message';

  @override
  String get newConversation => 'Nouveau chat';

  @override
  String get settings => 'Réglages';

  @override
  String get myHashId => 'Mon ID Hash';

  @override
  String get supportHash => 'Soutenir Hash';

  @override
  String get supportHashSubtitle => 'Hash est un projet à but non lucratif';

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
  String get notifications => 'Notifications';

  @override
  String get messages => 'Messages';

  @override
  String get calls => 'Appels';

  @override
  String get security => 'Sécurité';

  @override
  String get accountSecurity => 'Sécurité du compte';

  @override
  String get accountSecuritySubtitle => 'PIN, biométrie, code piège';

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
  String get autoLockDisabled => 'Désactivé';

  @override
  String get autoLockMinute => '1 minute';

  @override
  String autoLockMinutes(int count) {
    return '$count minutes';
  }

  @override
  String get destructionCode => 'Code de destruction';

  @override
  String get destructionCodeInfo =>
      'Si vous entrez ce code à la place de votre PIN :';

  @override
  String get destructionDeleteMessages => 'Tous vos messages seront supprimés';

  @override
  String get destructionDeleteContacts => 'Tous vos contacts seront supprimés';

  @override
  String get destructionDeleteHistory =>
      'Votre historique d\'appels sera effacé';

  @override
  String get destructionKeepId =>
      'Votre identité Hash (#XXX-XXX-XXX) reste la même';

  @override
  String get destructionAppearNormal =>
      'L\'application apparaîtra normale mais vide. Cette action est irréversible.';

  @override
  String get setupDestructionCode => 'Configurer un code de destruction';

  @override
  String get modifyDestructionCode => 'Modifier le code de destruction';

  @override
  String get currentDestructionCode => 'Code de destruction actuel';

  @override
  String get newDestructionCode => 'Nouveau code de destruction';

  @override
  String get confirmDestructionCode => 'Confirmer le code';

  @override
  String get destructionCodeConfigured => 'Code de destruction configuré';

  @override
  String get destructionCodeModified => 'Code de destruction modifié';

  @override
  String get destructionCodeMustDiffer =>
      'Le code de destruction doit être différent du code PIN';

  @override
  String get incorrectDestructionCode => 'Code de destruction incorrect';

  @override
  String get danger => 'Danger';

  @override
  String get panicButton => 'Bouton panique';

  @override
  String get panicButtonSubtitle => 'Supprimer toutes les données';

  @override
  String get deleteAccount => 'Supprimer mon compte';

  @override
  String get deleteAccountSubtitle => 'Action irréversible';

  @override
  String get deleteAccountConfirmTitle => 'Supprimer mon compte';

  @override
  String get deleteAccountConfirmMessage =>
      'Votre compte sera définitivement supprimé. Cette action est irréversible.\n\n• Tous vos chats\n• Tous vos contacts\n• Votre Hash ID\n\nVous devrez recréer un nouveau compte.';

  @override
  String get deleteForever => 'Supprimer définitivement';

  @override
  String get cancel => 'Annuler';

  @override
  String get panicConfirmTitle => 'Bouton Panique';

  @override
  String get panicConfirmMessage =>
      'Cette action supprimera TOUTES vos données de manière irréversible :\n\n• Tous vos messages\n• Tous vos contacts\n• Votre compte\n\nÊtes-vous absolument sûr ?';

  @override
  String get deleteAll => 'TOUT SUPPRIMER';

  @override
  String get dataDeletedForSecurity => 'Données supprimées par sécurité.';

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
  String get tooManyAttempts => 'Trop de tentatives';

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
      'Code PIN, mode panique et phrase de récupération';

  @override
  String get getStarted => 'Commencer';

  @override
  String get next => 'Suivant';

  @override
  String get skip => 'Passer';

  @override
  String get alreadyHaveAccount => 'J\'ai déjà un compte';

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
  String get contactDetails => 'Détails du contact';

  @override
  String get contactName => 'Nom du contact';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String get deleteContact => 'Supprimer le contact';

  @override
  String get deleteContactConfirm => 'Supprimer ce contact ?';

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
  String get shareMessage =>
      'Rejoins-moi sur Hash ! 🔒\n\nC\'est une messagerie vraiment privée : chiffrement total, aucune trace sur les serveurs, et un mode panique si besoin.\n\nTélécharge l\'app ici 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Erreur';

  @override
  String get ok => 'OK';

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
}
