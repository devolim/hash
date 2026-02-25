// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'ไร้ร่องรอย ไร้การประนีประนอม';

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
  String get conversations => 'แชท';

  @override
  String get contacts => 'รายชื่อ';

  @override
  String get noConversation => 'ไม่มีแชท';

  @override
  String get noConversationSubtitle =>
      'เพิ่มผู้ติดต่อเพื่อเริ่มแชทอย่างปลอดภัย';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คำขอที่รอดำเนินการ',
      one: '1 คำขอที่รอดำเนินการ',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คำขอที่ส่งแล้วรอดำเนินการ',
      one: '1 คำขอที่ส่งแล้วรอดำเนินการ',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'เพิ่มผู้ติดต่อ';

  @override
  String get shareApp => 'แชร์แอป';

  @override
  String get newMessage => 'ข้อความใหม่';

  @override
  String get newConversation => 'ส่งข้อความ';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get myHashId => 'Hash ID ของฉัน';

  @override
  String get supportHash => 'สนับสนุน Hash';

  @override
  String get supportHashSubtitle => 'Hash เป็นโปรเจกต์ไม่แสวงหากำไร';

  @override
  String get donate => 'บริจาค';

  @override
  String get appearance => 'รูปลักษณ์';

  @override
  String get theme => 'ธีม';

  @override
  String get themeAuto => 'อัตโนมัติ';

  @override
  String get themeAutoSubtitle => 'ตามการตั้งค่าระบบ';

  @override
  String get themeDark => 'มืด';

  @override
  String get themeLight => 'สว่าง';

  @override
  String get themeRecommendation => 'แนะนำธีมมืดเพื่อความเป็นส่วนตัวที่ดีขึ้น';

  @override
  String get language => 'ภาษา';

  @override
  String get languageAuto => 'อัตโนมัติ (ระบบ)';

  @override
  String get notifications => 'การแจ้งเตือน';

  @override
  String get messages => 'ข้อความ';

  @override
  String get calls => 'สาย';

  @override
  String get vibration => 'การสั่น';

  @override
  String get notificationContent => 'เนื้อหาการแจ้งเตือน';

  @override
  String get notificationContentFull => 'แสดงทั้งหมด';

  @override
  String get notificationContentFullDesc => 'ชื่อผู้ติดต่อและตัวอย่างข้อความ';

  @override
  String get notificationContentName => 'ชื่อเท่านั้น';

  @override
  String get notificationContentNameDesc => 'แสดงเฉพาะชื่อผู้ติดต่อ';

  @override
  String get notificationContentDiscrete => 'ไม่เปิดเผย';

  @override
  String get notificationContentDiscreteDesc => 'แสดงเฉพาะ \"ข้อความใหม่\"';

  @override
  String get security => 'ความปลอดภัย';

  @override
  String get howHashProtectsYou => 'Hash ปกป้องคุณอย่างไร';

  @override
  String get howHashProtectsYouSubtitle => 'ทำความเข้าใจความปลอดภัยของคุณ';

  @override
  String get accountSecurity => 'ความปลอดภัยบัญชี';

  @override
  String get accountSecuritySubtitle => 'PIN, ไบโอเมตริก, โหมด Vash';

  @override
  String get blockScreenshots => 'บล็อกการจับภาพหน้าจอ';

  @override
  String get transferDevice => 'โอนไปอุปกรณ์อื่น';

  @override
  String get transferDeviceSubtitle => 'ย้ายบัญชีของคุณ';

  @override
  String get pinCode => 'รหัส PIN';

  @override
  String get changePin => 'เปลี่ยนรหัส PIN';

  @override
  String get currentPin => 'รหัส PIN ปัจจุบัน';

  @override
  String get newPin => 'รหัส PIN ใหม่';

  @override
  String get confirmPin => 'ยืนยันรหัส PIN';

  @override
  String get pinChanged => 'เปลี่ยนรหัส PIN แล้ว';

  @override
  String get incorrectPin => 'PIN ไม่ถูกต้อง';

  @override
  String get pinsDoNotMatch => 'PIN ไม่ตรงกัน';

  @override
  String get autoLock => 'ล็อกอัตโนมัติ';

  @override
  String get autoLockDelay => 'หน่วงเวลาล็อก';

  @override
  String get autoLockImmediate => 'ทันที';

  @override
  String get autoLockMinute => '1 นาที';

  @override
  String autoLockMinutes(int count) {
    return '$count นาที';
  }

  @override
  String get vashCode => 'รหัส Vash';

  @override
  String get vashModeTitle => 'โหมด Vash';

  @override
  String get vashModeExplanation => 'ตาข่ายนิรภัยสุดท้ายของคุณ';

  @override
  String get vashModeDescription =>
      'คุณจะเลือกรหัส PIN ที่สอง หากถูกบังคับให้เปิด Hash ให้ใส่รหัสนี้แทน PIN ปกติ\n\nแอปจะเปิดตามปกติ แต่แชทและผู้ติดต่อทั้งหมดจะหายไป\n\nสำหรับใครก็ตามที่ดูหน้าจอ Hash จะดูเปล่า — เหมือนไม่เคยใช้';

  @override
  String get vashModeIrreversible => 'การกระทำนี้เงียบและไม่สามารถย้อนกลับได้';

  @override
  String get chooseVashCode => 'เลือกรหัส Vash ของฉัน';

  @override
  String get vashCodeInfo => 'รหัส PIN ที่สองที่เปิดแอปตามปกติ แต่เปล่า';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'หากใส่รหัสนี้แทน PIN:';

  @override
  String get vashDeleteContacts => 'ผู้ติดต่อของคุณจะหายไป';

  @override
  String get vashDeleteMessages => 'แชทของคุณจะหายไป';

  @override
  String get vashDeleteHistory => 'บันทึกของคุณจะหายไป';

  @override
  String get vashKeepId => 'ตัวตน Hash (#XXX-XXX-XXX) ยังคงเหมือนเดิม';

  @override
  String get vashAppearNormal =>
      'แอปจะดูปกติแต่เปล่า เหมือนใหม่ การกระทำนี้ไม่สามารถย้อนกลับได้';

  @override
  String get setupVashCode => 'ตั้งค่ารหัส Vash';

  @override
  String get modifyVashCode => 'แก้ไขรหัส Vash';

  @override
  String get currentVashCode => 'รหัส Vash ปัจจุบัน';

  @override
  String get newVashCode => 'รหัส Vash ใหม่';

  @override
  String get confirmVashCode => 'ยืนยันรหัส Vash';

  @override
  String get vashCodeConfigured => 'ตั้งค่ารหัส Vash แล้ว';

  @override
  String get vashCodeModified => 'แก้ไขรหัส Vash แล้ว';

  @override
  String get vashCodeMustDiffer => 'รหัส Vash ต้องแตกต่างจาก PIN';

  @override
  String get incorrectVashCode => 'รหัส Vash ไม่ถูกต้อง';

  @override
  String get vashWhatToDelete => 'โหมด Vash ควรทำให้อะไรหายไป?';

  @override
  String get vashDeleteContactsOption => 'ผู้ติดต่อ';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'ข้อความ';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'บันทึก';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'เปิดใช้งานโหมด Vash แล้ว';

  @override
  String get vashCreateSubtitle => 'เลือกรหัสที่แตกต่างจาก PIN หลัก';

  @override
  String get vashConfirmSubtitle => 'ยืนยันรหัส Vash ของคุณ';

  @override
  String get pinCodeForEntry => 'รหัส PIN สำหรับเข้าแอป';

  @override
  String get vashCodeSection => 'โหมด Vash';

  @override
  String get biometric => 'ไบโอเมตริก';

  @override
  String get biometricUnlock => 'ปลดล็อกด้วยลายนิ้วมือหรือ Face ID';

  @override
  String get enableBiometric => 'เปิดใช้งานไบโอเมตริก';

  @override
  String get biometricWarningMessage =>
      'เมื่อเปิดใช้ไบโอเมตริก คุณจะไม่สามารถใช้รหัส Vash เพื่อเข้าแอปได้\n\nคุณจะใช้รหัส Vash ได้ก็ต่อเมื่อไบโอเมตริกล้มเหลว (หลังจากพยายามหลายครั้ง)\n\nคุณแน่ใจหรือไม่ว่าต้องการดำเนินการต่อ?';

  @override
  String get understood => 'เข้าใจแล้ว';

  @override
  String get shareAppSubtitle => 'แชร์ Hash กับคนใกล้ชิด';

  @override
  String get share => 'แชร์';

  @override
  String get danger => 'อันตราย';

  @override
  String get deleteAccount => 'ลบบัญชีของฉัน';

  @override
  String get deleteAccountSubtitle => 'การกระทำที่ไม่สามารถย้อนกลับ';

  @override
  String get deleteAccountConfirmTitle => 'ลบบัญชีของฉัน';

  @override
  String get deleteAccountConfirmMessage =>
      'บัญชีของคุณจะถูกลบอย่างถาวร การกระทำนี้ไม่สามารถย้อนกลับได้\n\n• แชททั้งหมด\n• ผู้ติดต่อทั้งหมด\n• Hash ID ของคุณ\n\nคุณจะต้องสร้างบัญชีใหม่';

  @override
  String get deleteForever => 'ลบอย่างถาวร';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'เปิดใช้งานโหมด Vash แล้ว';

  @override
  String deletionError(String error) {
    return 'เกิดข้อผิดพลาดในการลบ: $error';
  }

  @override
  String get yourSecurity => 'ความปลอดภัยของคุณ';

  @override
  String get securityInfo =>
      '• การเข้ารหัสแบบครบวงจร (Signal Protocol)\n• ไม่มีข้อมูลบนเซิร์ฟเวอร์หลังจัดส่ง\n• คีย์จัดเก็บบนอุปกรณ์ของคุณเท่านั้น\n• รหัส PIN ไม่เคยส่งไปยังเซิร์ฟเวอร์';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'ยินดีต้อนรับ';

  @override
  String get securityStatement1 => 'ข้อความของคุณได้รับการปกป้อง';

  @override
  String get securityStatement2 => 'การเข้ารหัสแบบครบวงจร';

  @override
  String get securityStatement3 => 'ไร้ร่องรอย ไร้การประนีประนอม';

  @override
  String get securityStatement4 => 'ความเป็นส่วนตัวคือสิทธิ์ของคุณ';

  @override
  String get accessBlocked => 'ถูกบล็อกการเข้าถึง';

  @override
  String get tooManyAttempts => 'พยายามมากเกินไป ลองใหม่ภายหลัง';

  @override
  String get pleaseWait => 'กรุณารอ';

  @override
  String get waitDelay => 'กรุณารอจนหมดเวลาหน่วง';

  @override
  String attemptCount(int current, int max) {
    return 'ครั้งที่ $current จาก $max';
  }

  @override
  String retryIn(String time) {
    return 'ลองอีกครั้งใน $time';
  }

  @override
  String get forgotPin => 'ลืม PIN? ใช้วลีกู้คืน';

  @override
  String get useRecoveryPhrase => 'ใช้วลีกู้คืน';

  @override
  String get recoveryWarningTitle => 'คำเตือน';

  @override
  String get recoveryWarningMessage => 'การกู้คืนบัญชีจะ:';

  @override
  String get recoveryDeleteAllMessages => 'ลบข้อความทั้งหมดของคุณ';

  @override
  String get recoveryWaitDelay => 'ต้องรอ 1 ชั่วโมง';

  @override
  String get recoveryKeepContacts => 'เก็บผู้ติดต่อไว้';

  @override
  String get recoveryIrreversible =>
      'การกระทำนี้ไม่สามารถย้อนกลับได้ ข้อความจะสูญหายถาวร';

  @override
  String get iUnderstand => 'ฉันเข้าใจ';

  @override
  String get accountRecovery => 'กู้คืนบัญชี';

  @override
  String get enterRecoveryPhrase => 'ใส่คำ 24 คำของวลีกู้คืน คั่นด้วยเว้นวรรค';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'กู้คืน';

  @override
  String get recoveryPhraseRequired => 'กรุณาใส่วลีกู้คืน';

  @override
  String get recoveryPhrase24Words => 'วลีต้องมี 24 คำพอดี';

  @override
  String get incorrectRecoveryPhrase => 'วลีกู้คืนไม่ถูกต้อง';

  @override
  String get recoveryInitError => 'เกิดข้อผิดพลาดในการเริ่มกู้คืน';

  @override
  String get securityDelay => 'หน่วงเวลาเพื่อความปลอดภัย';

  @override
  String get securityDelayMessage =>
      'เพื่อความปลอดภัย ต้องรอก่อนสร้าง PIN ใหม่';

  @override
  String get timeRemaining => 'เวลาที่เหลือ';

  @override
  String get messagesDeletedForProtection => 'ข้อความถูกลบเพื่อปกป้องคุณ';

  @override
  String get canCloseApp => 'คุณสามารถปิดแอปแล้วกลับมาทีหลัง';

  @override
  String get onboardingTitle1 => 'ยินดีต้อนรับสู่ Hash';

  @override
  String get onboardingSubtitle1 => 'แอปส่งข้อความที่ไม่ทิ้งร่องรอย';

  @override
  String get onboardingTitle2 => 'เข้ารหัสอย่างสมบูรณ์';

  @override
  String get onboardingSubtitle2 =>
      'ข้อความของคุณเข้ารหัสแบบครบวงจรด้วย Signal Protocol';

  @override
  String get onboardingTitle3 => 'ไร้ร่องรอย';

  @override
  String get onboardingSubtitle3 => 'ข้อความถูกลบจากเซิร์ฟเวอร์เมื่อจัดส่งแล้ว';

  @override
  String get onboardingTitle4 => 'ความปลอดภัยของคุณ';

  @override
  String get onboardingSubtitle4 => 'รหัส PIN, โหมด Vash และวลีกู้คืน';

  @override
  String get getStarted => 'เริ่มต้น';

  @override
  String get next => 'ถัดไป';

  @override
  String get skip => 'ข้าม';

  @override
  String get alreadyHaveAccount => 'ฉันมีบัญชีแล้ว';

  @override
  String get transferMyAccount => 'โอนบัญชีของฉัน';

  @override
  String get createPin => 'สร้างรหัส PIN';

  @override
  String get createPinSubtitle => 'รหัสนี้จะปกป้องการเข้าถึงแอปของคุณ';

  @override
  String get confirmYourPin => 'ยืนยันรหัส PIN';

  @override
  String get confirmPinSubtitle => 'ใส่รหัส PIN อีกครั้ง';

  @override
  String get saveRecoveryPhrase => 'วลีกู้คืน';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'จดคำ 24 คำนี้ตามลำดับ จะช่วยกู้คืนบัญชีหากลืม PIN';

  @override
  String get phraseWritten => 'ฉันจดวลีแล้ว';

  @override
  String get warningRecoveryPhrase =>
      'หากสูญเสียวลีนี้และลืม PIN คุณจะสูญเสียการเข้าถึงบัญชี';

  @override
  String get accountTransferred => 'โอนบัญชีแล้ว';

  @override
  String get accountTransferredMessage =>
      'บัญชีของคุณถูกโอนไปยังอุปกรณ์อื่น เซสชันนี้ไม่สามารถใช้งานได้อีก';

  @override
  String get accountTransferredInfo =>
      'หากคุณไม่ได้เริ่มการโอนนี้ บัญชีของคุณอาจถูกเจาะ';

  @override
  String get logout => 'ออกจากระบบ';

  @override
  String get transferAccount => 'โอนบัญชี';

  @override
  String get transferAccountInfo =>
      'โอนบัญชี Hash ไปยังอุปกรณ์ใหม่ เซสชันปัจจุบันจะถูกยกเลิก';

  @override
  String get generateTransferCode => 'สร้างรหัสโอน';

  @override
  String get transferCode => 'รหัสโอน';

  @override
  String transferCodeExpires(int minutes) {
    return 'รหัสนี้จะหมดอายุใน $minutes นาที';
  }

  @override
  String get enterCodeOnNewDevice => 'ใส่รหัสนี้บนอุปกรณ์ใหม่เพื่อโอนบัญชี';

  @override
  String get generateNewCode => 'สร้างรหัสใหม่';

  @override
  String get scanQrCode => 'สแกน QR Code';

  @override
  String get scanQrCodeSubtitle => 'สแกน QR Code ของผู้ติดต่อเพื่อเพิ่ม';

  @override
  String get qrCodeDetected => 'ตรวจพบ QR Code';

  @override
  String get invalidQrCode => 'QR Code ไม่ถูกต้อง';

  @override
  String get cameraPermissionRequired => 'ต้องการสิทธิ์กล้อง';

  @override
  String get myQrCode => 'QR Code ของฉัน';

  @override
  String get myQrCodeSubtitle => 'แชร์ QR Code นี้เพื่อให้ผู้ติดต่อเพิ่มคุณ';

  @override
  String get shareQrCode => 'แชร์';

  @override
  String get addContactTitle => 'เพิ่มผู้ติดต่อ';

  @override
  String get addContactByHashId => 'ใส่ Hash ID ของผู้ติดต่อ';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'ค้นหา';

  @override
  String get contactNotFound => 'ไม่พบผู้ติดต่อ';

  @override
  String get contactAlreadyAdded => 'ผู้ติดต่อนี้อยู่ในรายชื่อแล้ว';

  @override
  String get contactAdded => 'เพิ่มผู้ติดต่อแล้ว';

  @override
  String get myProfile => 'โปรไฟล์ของฉัน';

  @override
  String get myProfileSubtitle => 'แชร์ข้อมูลนี้เพื่อให้คนอื่นเพิ่มคุณ';

  @override
  String get temporaryCode => 'รหัสชั่วคราว';

  @override
  String temporaryCodeExpires(String time) {
    return 'หมดอายุใน $time';
  }

  @override
  String get codeExpired => 'รหัสหมดอายุ';

  @override
  String get generateNewCodeButton => 'รหัสใหม่';

  @override
  String get copyHashId => 'คัดลอก ID';

  @override
  String get copyCode => 'คัดลอกรหัส';

  @override
  String get copiedToClipboard => 'คัดลอกแล้ว';

  @override
  String get showMyQrCode => 'แสดง QR Code ของฉัน';

  @override
  String get orDivider => 'หรือ';

  @override
  String get openScanner => 'เปิดสแกนเนอร์';

  @override
  String get addManually => 'เพิ่มด้วยตนเอง';

  @override
  String get contactHashIdLabel => 'Hash ID ของผู้ติดต่อ';

  @override
  String get temporaryCodeLabel => 'รหัสชั่วคราว';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode => 'ขอให้ผู้ติดต่อสร้างรหัสจากโปรไฟล์';

  @override
  String get verifyAndAdd => 'ตรวจสอบและเพิ่ม';

  @override
  String get fillAllFields => 'กรุณากรอกทุกช่อง';

  @override
  String get invalidHashIdFormat => 'รูปแบบ ID ไม่ถูกต้อง (เช่น: 123-456-ABC)';

  @override
  String get userNotFound => 'ไม่พบผู้ใช้';

  @override
  String get cannotAddYourself => 'ไม่สามารถเพิ่มตัวเองได้';

  @override
  String get invalidOrExpiredCode => 'รหัสชั่วคราวไม่ถูกต้องหรือหมดอายุ';

  @override
  String get contactFound => 'พบผู้ติดต่อ!';

  @override
  String get howToCallContact => 'คุณอยากเรียกเขาว่าอะไร?';

  @override
  String get contactNameHint => 'ชื่อผู้ติดต่อ';

  @override
  String get addContactButton => 'เพิ่ม';

  @override
  String get contactDetails => 'รายละเอียดผู้ติดต่อ';

  @override
  String get contactName => 'ชื่อผู้ติดต่อ';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'เพิ่มเมื่อ $date';
  }

  @override
  String get deleteContact => 'ลบผู้ติดต่อ';

  @override
  String deleteContactConfirm(Object name) {
    return 'ลบผู้ติดต่อนี้?';
  }

  @override
  String get deleteContactMessage => 'จะลบแชททั้งหมดด้วย';

  @override
  String get delete => 'ลบ';

  @override
  String get typeMessage => 'พิมพ์ข้อความ...';

  @override
  String get messageSent => 'ส่งแล้ว';

  @override
  String get messageDelivered => 'จัดส่งแล้ว';

  @override
  String get messageRead => 'อ่านแล้ว';

  @override
  String get messageFailed => 'ส่งล้มเหลว';

  @override
  String get now => 'ตอนนี้';

  @override
  String minutesAgo(int count) {
    return '$countนาที';
  }

  @override
  String hoursAgo(int count) {
    return '$countชม.';
  }

  @override
  String daysAgo(int count) {
    return '$countวัน';
  }

  @override
  String get today => 'วันนี้';

  @override
  String get yesterday => 'เมื่อวาน';

  @override
  String dateAtTime(String date, String time) {
    return '$date เวลา $time';
  }

  @override
  String get shareMessage =>
      'มาใช้ Hash กัน! 🔒\n\nแอปส่งข้อความที่เป็นส่วนตัวจริงๆ: เข้ารหัสทั้งหมด ไม่มีร่องรอยบนเซิร์ฟเวอร์ และมีโหมดฉุกเฉินเมื่อต้องการ\n\nดาวน์โหลดแอปได้ที่ 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'ข้อผิดพลาด';

  @override
  String get ok => 'ตกลง';

  @override
  String get view => 'ดู';

  @override
  String get yes => 'ใช่';

  @override
  String get no => 'ไม่';

  @override
  String get save => 'บันทึก';

  @override
  String get edit => 'แก้ไข';

  @override
  String get close => 'ปิด';

  @override
  String get confirm => 'ยืนยัน';

  @override
  String get loading => 'กำลังโหลด...';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'คำขอที่รอดำเนินการ';

  @override
  String get noPendingRequests => 'ไม่มีคำขอที่รอดำเนินการ';

  @override
  String get pendingRequestsSubtitle => 'คนเหล่านี้ต้องการเพิ่มคุณ';

  @override
  String requestFromUser(String hashId) {
    return 'คำขอจาก $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'หมดอายุใน $days วัน';
  }

  @override
  String get acceptRequest => 'ยอมรับ';

  @override
  String get rejectRequest => 'ปฏิเสธ';

  @override
  String get requestAccepted => 'ยอมรับคำขอแล้ว';

  @override
  String get requestRejected => 'ปฏิเสธคำขอแล้ว';

  @override
  String get requestSent => 'ส่งคำขอแล้ว!';

  @override
  String get requestSentSubtitle =>
      'คำขอถูกส่งแล้ว ผู้ใช้ต้องยอมรับก่อนจึงจะแชทได้';

  @override
  String get requestAlreadyPending => 'มีคำขอที่รอดำเนินการอยู่แล้ว';

  @override
  String get requestAlreadySentByOther => 'บุคคลนี้ส่งคำขอให้คุณแล้ว';

  @override
  String get addByHashId => 'เพิ่มด้วย Hash ID';

  @override
  String get addByHashIdSubtitle => 'ใส่ Hash ID และรหัสชั่วคราวของผู้ติดต่อ';

  @override
  String get enterTemporaryCode => 'ใส่รหัส 6 หลัก';

  @override
  String get sendRequest => 'ส่งคำขอ';

  @override
  String get acceptContactTitle => 'ยอมรับผู้ติดต่อ';

  @override
  String get acceptContactSubtitle => 'คุณสามารถตั้งชื่อเล่นให้เขาได้';

  @override
  String get leaveEmptyForHashId => 'ปล่อยว่างเพื่อใช้ Hash ID';

  @override
  String get firstName => 'ชื่อ';

  @override
  String get lastName => 'นามสกุล';

  @override
  String get notes => 'บันทึก';

  @override
  String get notesHint => 'บันทึกส่วนตัวเกี่ยวกับผู้ติดต่อนี้';

  @override
  String get photoOptional => 'รูปภาพ (ไม่บังคับ)';

  @override
  String get contactNameOptional => 'ชื่อ (ไม่บังคับ)';

  @override
  String get notesOptional => 'บันทึก (ไม่บังคับ)';

  @override
  String get storedLocally => 'จัดเก็บบนอุปกรณ์ของคุณเท่านั้น';

  @override
  String get encryptedMessageLabel => 'ข้อความเข้ารหัส';

  @override
  String get identityMessageHint => 'คุณเป็นใคร? รู้จักกันอย่างไร?';

  @override
  String get messageWillBeSentEncrypted =>
      'ข้อความนี้จะถูกเข้ารหัสและส่งไปยังผู้รับ';

  @override
  String get sendRequestButton => 'ส่งคำขอ';

  @override
  String get requestExpiresIn24h => 'คำขอจะหมดอายุใน 24 ชม. หากไม่ถูกยอมรับ';

  @override
  String get theyAlreadySentYouRequest => 'บุคคลนี้ส่งคำขอให้คุณแล้ว';

  @override
  String get requests => 'คำขอ';

  @override
  String get receivedRequests => 'ได้รับ';

  @override
  String get sentRequests => 'ส่งแล้ว';

  @override
  String get noSentRequests => 'ไม่มีคำขอที่ส่ง';

  @override
  String get cancelRequest => 'ยกเลิก';

  @override
  String get deleteRequest => 'ลบคำขอ';

  @override
  String get requestCancelled => 'ยกเลิกคำขอแล้ว';

  @override
  String sentTo(String hashId) {
    return 'ส่งไปยัง $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'หมดอายุใน $time';
  }

  @override
  String receivedAgo(String time) {
    return 'ได้รับ $time ที่แล้ว';
  }

  @override
  String get messageFromRequester => 'ข้อความจากผู้ขอ';

  @override
  String get copy => 'คัดลอก';

  @override
  String get messageInfo => 'ข้อมูลข้อความ';

  @override
  String get messageDirection => 'ทิศทาง';

  @override
  String get messageSentByYou => 'ส่งโดยคุณ';

  @override
  String get messageReceived => 'ได้รับ';

  @override
  String get messageSentAt => 'ส่งเมื่อ';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'สถานะ';

  @override
  String get messageReadAt => 'อ่านเมื่อ';

  @override
  String get messageType => 'ประเภท';

  @override
  String get messageSize => 'ขนาด';

  @override
  String get messageExpiresAt => 'หมดอายุเมื่อ';

  @override
  String get messageEncrypted => 'เข้ารหัสแบบครบวงจร';

  @override
  String get messageStatusSending => 'กำลังส่ง...';

  @override
  String get messageStatusSent => 'ส่งแล้ว';

  @override
  String get messageStatusDelivered => 'จัดส่งแล้ว';

  @override
  String get messageStatusRead => 'อ่านแล้ว';

  @override
  String get messageStatusFailed => 'ล้มเหลว';

  @override
  String get serverStatus => 'เซิร์ฟเวอร์';

  @override
  String get onServer => 'รอจัดส่ง';

  @override
  String get deletedFromServer => 'ลบแล้ว';

  @override
  String get messageTypeText => 'ข้อความ';

  @override
  String get messageTypeImage => 'รูปภาพ';

  @override
  String get messageTypeVideo => 'วิดีโอ';

  @override
  String get messageTypeVoice => 'เสียง';

  @override
  String get messageTypeFile => 'ไฟล์';

  @override
  String get indefinitely => 'ไม่จำกัด';

  @override
  String get hoursShort => 'ชม.';

  @override
  String get minutesShort => 'นาที';

  @override
  String get hours => 'ชั่วโมง';

  @override
  String get minutes => 'นาที';

  @override
  String get seconds => 'วินาที';

  @override
  String get ephemeralMessages => 'ข้อความชั่วคราว';

  @override
  String get ephemeralMessagesDescription =>
      'ข้อความจะถูกลบอัตโนมัติหลังเวลานี้';

  @override
  String get ephemeralImmediate => 'ทันที (หลังอ่าน)';

  @override
  String get ephemeralImmediateDesc => 'ลบทันทีที่อ่าน';

  @override
  String get ephemeralMyPreference => 'ค่ากำหนดของฉัน';

  @override
  String get ephemeralMyPreferenceDesc => 'ใช้การตั้งค่าส่วนกลาง';

  @override
  String get ephemeralDefaultSetting => 'ระยะเวลาข้อความ';

  @override
  String get ephemeralChooseDefault => 'แนะนำ';

  @override
  String get ephemeral30Seconds => '30 วินาที';

  @override
  String get ephemeral30SecondsDesc => 'ลบ 30 วินาทีหลังอ่าน';

  @override
  String get ephemeral5Minutes => '5 นาที';

  @override
  String get ephemeral5MinutesDesc => 'ลบ 5 นาทีหลังอ่าน';

  @override
  String get ephemeral1Hour => '1 ชั่วโมง';

  @override
  String get ephemeral1HourDesc => 'ลบ 1 ชม. หลังอ่าน';

  @override
  String get ephemeral3Hours => '3 ชั่วโมง';

  @override
  String get ephemeral6Hours => '6 ชั่วโมง';

  @override
  String get ephemeral6HoursDesc => 'ลบ 6 ชม. หลังอ่าน';

  @override
  String get ephemeral12Hours => '12 ชั่วโมง';

  @override
  String get ephemeral24Hours => '24 ชั่วโมง';

  @override
  String get ephemeral24HoursDesc => 'ลบ 24 ชม. หลังอ่าน';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'กำหนดเอง';

  @override
  String get howItWorks => 'ทำงานอย่างไร';

  @override
  String get ephemeralExplanation1 =>
      'ข้อความถูกลบจากเซิร์ฟเวอร์ทันทีที่ได้รับ';

  @override
  String get ephemeralExplanation2 =>
      'การตั้งค่านี้กำหนดเวลาที่ข้อความจะหายจากโทรศัพท์ของคุณหลังอ่าน';

  @override
  String get ephemeralExplanation3 =>
      'ผู้ติดต่อของคุณมีการตั้งค่าของตัวเองสำหรับโทรศัพท์ของเขา';

  @override
  String get mute1Hour => '1 ชั่วโมง';

  @override
  String get mute8Hours => '8 ชั่วโมง';

  @override
  String get mute1Day => '1 วัน';

  @override
  String get mute1Week => '1 สัปดาห์';

  @override
  String get muteAlways => 'ตลอดไป';

  @override
  String get muteExplanation => 'คุณจะไม่ได้รับแจ้งเตือนจากผู้ติดต่อนี้';

  @override
  String get showCallsInRecents => 'แสดงในสายล่าสุด';

  @override
  String get showCallsInRecentsSubtitle =>
      'สายจาก Hash จะปรากฏในประวัติโทรศัพท์';

  @override
  String get feedback => 'ความคิดเห็น';

  @override
  String get muteNotifications => 'ปิดเสียงแจ้งเตือน';

  @override
  String get muteDescription => 'คุณจะไม่ได้รับแจ้งเตือนจากผู้ติดต่อนี้';

  @override
  String mutedUntil(String time) {
    return 'ปิดเสียงจนถึง $time';
  }

  @override
  String get notMuted => 'เปิดการแจ้งเตือน';

  @override
  String get unmute => 'เปิดเสียง';

  @override
  String get notificationSound => 'เสียงแจ้งเตือน';

  @override
  String get defaultSound => 'ค่าเริ่มต้น';

  @override
  String get chatSettings => 'ตั้งค่าแชท';

  @override
  String get bubbleColor => 'สีกล่องข้อความ';

  @override
  String get backgroundColor => 'สีพื้นหลัง';

  @override
  String get backgroundImage => 'รูปพื้นหลัง';

  @override
  String get chatBackground => 'พื้นหลังแชท';

  @override
  String get customColor => 'กำหนดเอง';

  @override
  String get defaultColor => 'ค่าเริ่มต้น';

  @override
  String get imageSelected => 'เลือกรูปแล้ว';

  @override
  String get noImage => 'ไม่มีรูป';

  @override
  String get color => 'สี';

  @override
  String get image => 'รูป';

  @override
  String get tapToSelectImage => 'แตะเพื่อเลือกรูป';

  @override
  String get changeImage => 'เปลี่ยนรูป';

  @override
  String get previewMessageReceived => 'สวัสดี!';

  @override
  String get previewMessageSent => 'หวัดดี!';

  @override
  String get messageAction => 'ข้อความ';

  @override
  String get callAction => 'โทร';

  @override
  String get videoAction => 'วิดีโอ';

  @override
  String get personalNotes => 'บันทึกส่วนตัว';

  @override
  String get addNotes => 'เพิ่มบันทึก...';

  @override
  String get noNotes => 'ไม่มีบันทึก';

  @override
  String get messageNotifications => 'แจ้งเตือนข้อความ';

  @override
  String get callNotifications => 'แจ้งเตือนสาย';

  @override
  String get useGradient => 'ใช้ไล่สี';

  @override
  String get gradientStart => 'สีเริ่มต้น';

  @override
  String get gradientEnd => 'สีสิ้นสุด';

  @override
  String get preview => 'ตัวอย่าง';

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get securityNumber => 'หมายเลขความปลอดภัย';

  @override
  String securityNumberDescription(String name) {
    return 'ตรวจสอบว่าหมายเลขความปลอดภัยตรงกับอุปกรณ์ของ $name';
  }

  @override
  String get verifyEncryption => 'ตรวจสอบการเข้ารหัสแบบครบวงจร';

  @override
  String get tapToCopy => 'แตะเพื่อคัดลอก';

  @override
  String get howToVerify => 'วิธีตรวจสอบ';

  @override
  String get verifyStep1 => 'พบผู้ติดต่อด้วยตนเองหรือโทรหา';

  @override
  String get verifyStep2 => 'เปรียบเทียบหมายเลขความปลอดภัยหรือสแกน QR Code';

  @override
  String get verifyStep3 => 'หากตรงกัน แชทของคุณปลอดภัย';

  @override
  String get scanToVerify => 'สแกนเพื่อตรวจสอบ';

  @override
  String get reportSpam => 'แจ้งสแปม';

  @override
  String get reportSpamSubtitle => 'แจ้งผู้ติดต่อนี้ว่าเป็นสแปม';

  @override
  String get reportSpamDescription =>
      'ผู้ติดต่อนี้จะถูกแจ้งโดยไม่เปิดเผยตัว ตัวตนของคุณจะไม่ถูกเปิดเผย แน่ใจหรือไม่?';

  @override
  String get report => 'แจ้ง';

  @override
  String get spamReported => 'แจ้งสแปมแล้ว';

  @override
  String get reportError => 'ส่งรายงานล้มเหลว กรุณาลองอีกครั้ง';

  @override
  String get reportRateLimited => 'คุณแจ้งถึงจำนวนสูงสุดของวันนี้แล้ว';

  @override
  String get blockContact => 'บล็อกผู้ติดต่อ';

  @override
  String get blockContactDescription =>
      'ผู้ติดต่อนี้จะไม่สามารถส่งข้อความหรือโทรหาคุณได้อีก จะไม่ได้รับแจ้ง';

  @override
  String get unblockContact => 'ปลดบล็อกผู้ติดต่อ';

  @override
  String get unblockContactDescription =>
      'ผู้ติดต่อนี้จะสามารถส่งข้อความและโทรหาคุณได้อีกครั้ง';

  @override
  String get contactBlocked => 'บล็อกผู้ติดต่อแล้ว';

  @override
  String get contactUnblocked => 'ปลดบล็อกผู้ติดต่อแล้ว';

  @override
  String get contactIsBlocked => 'ผู้ติดต่อนี้ถูกบล็อก';

  @override
  String get unblock => 'ปลดบล็อก';

  @override
  String get deleteContactSubtitle => 'ลบผู้ติดต่อและแชทนี้';

  @override
  String get confirmWithPin => 'ยืนยันด้วย PIN';

  @override
  String get enterPinToConfirm => 'ใส่ PIN เพื่อยืนยันการกระทำนี้';

  @override
  String get profilePhoto => 'รูปโปรไฟล์';

  @override
  String get takePhoto => 'ถ่ายรูป';

  @override
  String get chooseFromGallery => 'เลือกจากแกลเลอรี';

  @override
  String get removePhoto => 'ลบรูป';

  @override
  String get viewContactHashId => 'ดูรหัสผู้ติดต่อ';

  @override
  String get hashIdPartiallyMasked =>
      'ปิดบังบางส่วนเพื่อความปลอดภัยของคุณและผู้ติดต่อ';

  @override
  String get addFirstContact => 'เพิ่มผู้ติดต่อคนแรก';

  @override
  String get addFirstContactSubtitle => 'แชร์ QR Code หรือสแกนของเพื่อน';

  @override
  String get directory => 'สมุดรายชื่อ';

  @override
  String get noContacts => 'ไม่มีผู้ติดต่อ';

  @override
  String get noContactsSubtitle => 'เพิ่มผู้ติดต่อเพื่อเริ่มต้น';

  @override
  String get sendMessageAction => 'ส่งข้อความ';

  @override
  String get audioCall => 'โทรเสียง';

  @override
  String get videoCall => 'วิดีโอคอล';

  @override
  String get viewProfile => 'ดูโปรไฟล์';

  @override
  String get deleteContactDirectory => 'ลบผู้ติดต่อ';

  @override
  String get scanShort => 'สแกน';

  @override
  String get addShort => 'เพิ่ม';

  @override
  String deleteContactConfirmName(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $name?';
  }

  @override
  String get noNotesTitle => 'ไม่มีบันทึก';

  @override
  String get noNotesSubtitle => 'สร้างบันทึกแรกของคุณ';

  @override
  String get newNote => 'บันทึกใหม่';

  @override
  String get editNote => 'แก้ไขบันทึก';

  @override
  String get deleteNote => 'ลบบันทึก';

  @override
  String get deleteNoteConfirm => 'คุณแน่ใจหรือไม่ว่าต้องการลบบันทึกนี้?';

  @override
  String get noteTitle => 'ชื่อเรื่อง';

  @override
  String get noteContent => 'เนื้อหา';

  @override
  String get addItem => 'เพิ่มรายการ';

  @override
  String get pinNote => 'ปักหมุด';

  @override
  String get unpinNote => 'เลิกปักหมุด';

  @override
  String get noteColor => 'สี';

  @override
  String get notePassword => 'รหัสผ่าน';

  @override
  String get setPassword => 'ตั้งรหัสผ่าน';

  @override
  String get changePassword => 'เปลี่ยนรหัสผ่าน';

  @override
  String get removePassword => 'ลบรหัสผ่าน';

  @override
  String get enterPassword => 'ใส่รหัสผ่าน';

  @override
  String get confirmPassword => 'ยืนยันรหัสผ่าน';

  @override
  String get passwordPin => 'รหัส PIN';

  @override
  String get passwordText => 'รหัสผ่านข้อความ';

  @override
  String get protectedNote => 'บันทึกที่ถูกป้องกัน';

  @override
  String get incorrectPassword => 'รหัสผ่านไม่ถูกต้อง';

  @override
  String get passwordSet => 'ตั้งรหัสผ่านแล้ว';

  @override
  String get passwordRemoved => 'ลบรหัสผ่านแล้ว';

  @override
  String get notesBiometric => 'Face ID สำหรับบันทึก';

  @override
  String get notesBiometricSubtitle =>
      'ต้องใช้ไบโอเมตริกเพื่อเปิดบันทึกที่ถูกป้องกัน';

  @override
  String get textNote => 'บันทึกข้อความ';

  @override
  String get checklistNote => 'รายการตรวจสอบ';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total งาน';
  }

  @override
  String get autoSaved => 'บันทึกแล้ว';

  @override
  String get searchNotes => 'ค้นหาบันทึก';

  @override
  String get legalConsent => 'ความยินยอมทางกฎหมาย';

  @override
  String get confirmAge13 => 'ฉันยืนยันว่ามีอายุอย่างน้อย 13 ปี';

  @override
  String get acceptLegalStart => 'ฉันยอมรับ ';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get termsOfService => 'ข้อกำหนดการให้บริการ';

  @override
  String get andThe => ' และ ';

  @override
  String get continueButton => 'ดำเนินการต่อ';

  @override
  String get mustAcceptTerms => 'คุณต้องยอมรับทั้งสองเงื่อนไขเพื่อดำเนินการต่อ';

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
  String get support => 'สนับสนุน';

  @override
  String get contactSupport => 'ติดต่อฝ่ายสนับสนุน';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'แจ้งการละเมิด';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'กฎหมาย';

  @override
  String get legalEntity => 'นิติบุคคล';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'ปักหมุด';

  @override
  String get unpinConversation => 'เลิกปักหมุด';

  @override
  String get hideConversation => 'ลบจากฟีด';

  @override
  String get deleteConversation => 'ลบการสนทนา';

  @override
  String get deleteConversationConfirm =>
      'ใส่ PIN เพื่อยืนยันการลบข้อความทั้งหมด';

  @override
  String get noConversations => 'ยังไม่มีการสนทนา';

  @override
  String get startConversation => 'เริ่ม';

  @override
  String get microphonePermissionRequired => 'ต้องการสิทธิ์ไมโครโฟน';

  @override
  String get microphonePermissionExplanation => 'Hash ต้องใช้ไมโครโฟนเพื่อโทร';

  @override
  String get cameraPermissionExplanation => 'Hash ต้องใช้กล้องสำหรับวิดีโอคอล';

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
  String get openSettings => 'เปิดการตั้งค่า';

  @override
  String get callConnecting => 'กำลังเชื่อมต่อ...';

  @override
  String get callRinging => 'กำลังดัง...';

  @override
  String get callReconnecting => 'กำลังเชื่อมต่อใหม่...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'กำลังเชื่อมต่อใหม่ ($secondsวิ)';
  }

  @override
  String get callPaused => 'หยุดชั่วคราว';

  @override
  String get callPausedSubtitle => 'สายยังคงอยู่';

  @override
  String get callRemoteMicMuted => 'ปิดไมค์ผู้ติดต่อแล้ว';

  @override
  String get callMiniControlsMute => 'ปิดเสียง';

  @override
  String get callMiniControlsUnmute => 'เปิดเสียง';

  @override
  String get callMiniControlsHangUp => 'วางสาย';

  @override
  String get callMiniControlsReturn => 'กลับไปที่สาย';

  @override
  String get callNetworkPoor => 'การเชื่อมต่อไม่เสถียร';

  @override
  String get callNetworkLost => 'ขาดการเชื่อมต่อ';

  @override
  String get callEndedTitle => 'สิ้นสุดสาย';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'ข้อมูลอุปกรณ์';

  @override
  String get deviceDataSubtitle => 'พื้นที่จัดเก็บในเครื่องและเซิร์ฟเวอร์';

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
  String get localStorage => 'พื้นที่จัดเก็บในเครื่อง';

  @override
  String get onThisDevice => 'บนอุปกรณ์นี้';

  @override
  String get encryptedDatabases => 'ฐานข้อมูลที่เข้ารหัส';

  @override
  String get files => 'ไฟล์';

  @override
  String get secureKeychain => 'พวงกุญแจปลอดภัย';

  @override
  String get cache => 'แคช';

  @override
  String get contactsDetail => 'ชื่อ, อวาตาร์, คีย์ Signal';

  @override
  String get messagesDetail => 'การสนทนาที่เข้ารหัส';

  @override
  String get notesDetail => 'บันทึกส่วนตัว';

  @override
  String get signalSessions => 'เซสชัน Signal';

  @override
  String get signalSessionsDetail => 'เซสชันการเข้ารหัส';

  @override
  String get pendingContacts => 'ผู้ติดต่อที่รอดำเนินการ';

  @override
  String get pendingContactsDetail => 'คำขอที่รอดำเนินการ';

  @override
  String get callHistory => 'สาย';

  @override
  String get callHistoryDetail => 'ประวัติสาย';

  @override
  String get preferences => 'ค่ากำหนด';

  @override
  String get preferencesDetail => 'ค่ากำหนดสื่อและสาย';

  @override
  String get avatars => 'อวาตาร์';

  @override
  String get media => 'สื่อ';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ไฟล์',
      one: '1 ไฟล์',
      zero: 'ไม่มีไฟล์',
    );
    return '$_temp0';
  }

  @override
  String get active => 'ใช้งาน';

  @override
  String get notDefined => 'ไม่ได้กำหนด';

  @override
  String get biometrics => 'ไบโอเมตริก';

  @override
  String get recoveryPhrase => 'วลีกู้คืน';

  @override
  String get identity => 'ตัวตน (Hash ID)';

  @override
  String get signalKeys => 'คีย์ Signal Protocol';

  @override
  String get authTokens => 'โทเค็นยืนยันตัวตน';

  @override
  String get contactNamesCache => 'แคชชื่อผู้ติดต่อ';

  @override
  String get remoteConfig => 'การตั้งค่าระยะไกล';

  @override
  String get notificationPrefs => 'ค่ากำหนดแจ้งเตือน';

  @override
  String get serverData => 'ข้อมูลเซิร์ฟเวอร์';

  @override
  String get serverDataInfo =>
      'Hash เก็บข้อมูลน้อยที่สุดบนเซิร์ฟเวอร์ ทั้งหมดเข้ารหัสหรือเป็นชั่วคราว';

  @override
  String get serverProfile => 'โปรไฟล์';

  @override
  String get serverProfileDetail => 'Hash ID, คีย์สาธารณะ, โทเค็นกล่องจดหมาย';

  @override
  String get serverPrekeys => 'พรีคีย์';

  @override
  String get serverPrekeysDetail => 'คีย์ Signal แบบใช้ครั้งเดียว (ใช้แล้ว)';

  @override
  String get serverMessages => 'ข้อความระหว่างทาง';

  @override
  String get serverMessagesDetail => 'ลบหลังจัดส่ง (สูงสุด 24 ชม.)';

  @override
  String get serverMedia => 'สื่อระหว่างทาง';

  @override
  String get serverMediaDetail => 'ลบหลังดาวน์โหลด';

  @override
  String get serverContactRequests => 'คำขอผู้ติดต่อ';

  @override
  String get serverContactRequestsDetail => 'หมดอายุหลัง 24 ชม.';

  @override
  String get serverRateLimits => 'จำกัดอัตรา';

  @override
  String get serverRateLimitsDetail => 'ข้อมูลป้องกันการละเมิดชั่วคราว';

  @override
  String get privacyReassurance =>
      'Hash ไม่สามารถอ่านข้อความของคุณ ข้อมูลทั้งหมดเข้ารหัสแบบครบวงจร ข้อมูลเซิร์ฟเวอร์ถูกลบอัตโนมัติ';

  @override
  String get pinTooSimple => 'PIN นี้ง่ายเกินไป เลือกรหัสที่ปลอดภัยกว่า';

  @override
  String get genericError => 'เกิดข้อผิดพลาด กรุณาลองอีกครั้ง';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'สร้างบัญชีไม่ได้: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'คัดลอกวลีไปยังคลิปบอร์ดแล้ว';

  @override
  String get copyPhrase => 'คัดลอกวลี';

  @override
  String get recoveryPhraseSecurityWarning =>
      'จดวลีนี้ไว้ในที่ปลอดภัย หากสูญเสีย PIN โดยไม่มีวลีนี้ คุณจะสูญเสียการเข้าถึงข้อมูลถาวร';

  @override
  String get noMessages => 'ไม่มีข้อความ';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'ลบข้อความทั้งหมดกับ $name?';
  }

  @override
  String get confirmation => 'ยืนยัน';

  @override
  String get untitled => 'ไม่มีชื่อ';

  @override
  String get noSessions => 'ไม่มีเซสชัน';

  @override
  String get unknownContact => 'ผู้ติดต่อที่ไม่รู้จัก';

  @override
  String get unnamed => 'ไม่มีชื่อ';

  @override
  String get noPendingRequestsAlt => 'ไม่มีคำขอที่รอดำเนินการ';

  @override
  String get deleteAllCallHistory => 'ลบประวัติสายทั้งหมด?';

  @override
  String get noCalls => 'ไม่มีสาย';

  @override
  String get noPreferences => 'ไม่มีค่ากำหนด';

  @override
  String get resetAllMediaPrefs => 'รีเซ็ตค่ากำหนดสื่อทั้งหมด?';

  @override
  String get deleteThisAvatar => 'ลบอวาตาร์นี้?';

  @override
  String get deleteAllAvatars => 'ลบอวาตาร์ทั้งหมด?';

  @override
  String get noAvatars => 'ไม่มีอวาตาร์';

  @override
  String get deleteThisFile => 'ลบไฟล์นี้?';

  @override
  String get deleteAllMediaFiles => 'ลบสื่อทั้งหมด?';

  @override
  String get noMediaFiles => 'ไม่มีสื่อ';

  @override
  String get outgoing => 'โทรออก';

  @override
  String get incoming => 'สายเข้า';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'ดูชั่วคราว: $secondsวิ';
  }

  @override
  String get normalView => 'มุมมองปกติ';

  @override
  String get callReasonCompleted => 'เสร็จสิ้น';

  @override
  String get callReasonMissed => 'สายไม่ได้รับ';

  @override
  String get callReasonDeclined => 'ปฏิเสธ';

  @override
  String get callReasonFailed => 'ล้มเหลว';

  @override
  String get justNow => 'เมื่อกี้';

  @override
  String timeAgoMinutes(int count) {
    return '$count นาทีที่แล้ว';
  }

  @override
  String timeAgoHours(int count) {
    return '$count ชม. ที่แล้ว';
  }

  @override
  String timeAgoDays(int count) {
    return '$count วันที่แล้ว';
  }

  @override
  String get messageTypeContact => 'ผู้ติดต่อ';

  @override
  String get messageTypeLocation => 'ตำแหน่ง';

  @override
  String get statusQueued => 'อยู่ในคิว';

  @override
  String get blockedBadge => 'ถูกบล็อก';

  @override
  String get protectedBadge => 'ถูกป้องกัน';

  @override
  String messageCount(int count) {
    return '$count ข้อความ';
  }

  @override
  String get deleteQuestion => 'ลบ?';

  @override
  String get transferMyAccountTitle => 'โอนบัญชีของฉัน';

  @override
  String get loadingError => 'เกิดข้อผิดพลาดในการโหลด';

  @override
  String get transferToNewDevice => 'โอนไปยังอุปกรณ์ใหม่';

  @override
  String get transferInstructions =>
      'บนอุปกรณ์ใหม่ เลือก \"กู้คืนบัญชี\" แล้วใส่ข้อมูลนี้:';

  @override
  String get yourHashIdLabel => 'Hash ID ของคุณ';

  @override
  String get enterYourPinCode => 'ใส่รหัส PIN';

  @override
  String get pinOwnerConfirmation => 'เพื่อยืนยันว่าคุณเป็นเจ้าของบัญชีนี้';

  @override
  String get scanThisQrCode => 'สแกน QR Code นี้';

  @override
  String get withYourNewDevice => 'ด้วยอุปกรณ์ใหม่ของคุณ';

  @override
  String get orEnterTheCode => 'หรือใส่รหัส';

  @override
  String get transferCodeLabel => 'รหัสโอน';

  @override
  String get proximityVerification => 'การตรวจสอบระยะใกล้';

  @override
  String get bringDevicesCloser => 'นำอุปกรณ์ทั้งสองเข้ามาใกล้กัน';

  @override
  String get confirmTransferQuestion => 'ยืนยันการโอน?';

  @override
  String get accountWillBeTransferred =>
      'บัญชีจะถูกโอนไปยังอุปกรณ์ใหม่\n\nอุปกรณ์นี้จะถูกตัดการเชื่อมต่อถาวร';

  @override
  String get transferComplete => 'การโอนเสร็จสิ้น';

  @override
  String get transferSuccessMessage => 'โอนบัญชีสำเร็จแล้ว\n\nแอปนี้จะปิดตัว';

  @override
  String get manualVerification => 'การตรวจสอบด้วยตนเอง';

  @override
  String get codeDisplayedOnBothDevices => 'รหัสที่แสดงบนอุปกรณ์ทั้งสอง:';

  @override
  String get doesCodeMatchNewDevice => 'รหัสนี้ตรงกับบนอุปกรณ์ใหม่หรือไม่?';

  @override
  String get verifiedStatus => 'ตรวจสอบแล้ว';

  @override
  String get inProgressStatus => 'กำลังดำเนินการ...';

  @override
  String get notAvailableStatus => 'ไม่พร้อมใช้งาน';

  @override
  String get codeExpiredRestart => 'รหัสหมดอายุ กรุณาเริ่มใหม่';

  @override
  String get codesDoNotMatchCancelled => 'รหัสไม่ตรงกัน ยกเลิกการโอน';

  @override
  String transferToDevice(String device) {
    return 'ไปยัง: $device';
  }

  @override
  String get copiedExclamation => 'คัดลอกแล้ว!';

  @override
  String expiresInTime(String time) {
    return 'หมดอายุใน $time';
  }

  @override
  String get biometricNotAvailable => 'อุปกรณ์นี้ไม่รองรับไบโอเมตริก';

  @override
  String get biometricAuthError => 'เกิดข้อผิดพลาดในการยืนยันไบโอเมตริก';

  @override
  String get authenticateForBiometric =>
      'กรุณายืนยันตัวตนเพื่อเปิดใช้ไบโอเมตริก';

  @override
  String get biometricAuthFailed => 'การยืนยันไบโอเมตริกล้มเหลว';

  @override
  String get forceUpdateTitle => 'ต้องอัปเดต';

  @override
  String get forceUpdateMessage =>
      'มี Hash เวอร์ชันใหม่ กรุณาอัปเดตเพื่อดำเนินการต่อ';

  @override
  String get updateButton => 'อัปเดต';

  @override
  String get maintenanceInProgress => 'กำลังบำรุงรักษา';

  @override
  String get tryAgainLater => 'กรุณาลองอีกครั้งภายหลัง';

  @override
  String get information => 'ข้อมูล';

  @override
  String get later => 'ภายหลัง';

  @override
  String get doYouLikeHash => 'ชอบ Hash ไหม?';

  @override
  String get yourFeedbackHelps => 'ความคิดเห็นของคุณช่วยปรับปรุงแอป';

  @override
  String get ratingTerrible => 'แย่มาก';

  @override
  String get ratingBad => 'แย่';

  @override
  String get ratingOk => 'พอใช้';

  @override
  String get ratingGood => 'ดี';

  @override
  String get ratingExcellent => 'ยอดเยี่ยม!';

  @override
  String get donationMessage =>
      'Hash เป็นโปรเจกต์ไม่แสวงหากำไร การสนับสนุนของคุณช่วยให้เราพัฒนาแอปส่งข้อความที่เป็นส่วนตัวอย่างแท้จริงต่อไป';

  @override
  String get recentConnections => 'การเชื่อมต่อล่าสุด';

  @override
  String get loginInfoText =>
      'การปลดล็อกด้วย PIN ทุกครั้งจะถูกบันทึกในเครื่อง เก็บเฉพาะ 24 ชม. ล่าสุด';

  @override
  String get connectionCount => 'การเชื่อมต่อ';

  @override
  String get periodLabel => 'ช่วงเวลา';

  @override
  String get historyLabel => 'ประวัติ';

  @override
  String get noLoginRecorded => 'ไม่มีการเข้าสู่ระบบ';

  @override
  String get nextUnlocksAppearHere => 'การปลดล็อกครั้งถัดไปจะปรากฏที่นี่';

  @override
  String get dataLocalOnly =>
      'ข้อมูลนี้จัดเก็บบนอุปกรณ์ของคุณเท่านั้นและไม่เคยถูกส่งออก';

  @override
  String get currentSession => 'ปัจจุบัน';

  @override
  String get todayLabel => 'วันนี้';

  @override
  String get yesterdayLabel => 'เมื่อวาน';

  @override
  String get justNowLabel => 'เมื่อกี้';

  @override
  String minutesAgoLabel(int count) {
    return '$count นาทีที่แล้ว';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours ชม. ที่แล้ว';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '$hours ชม. $minutes นาทีที่แล้ว';
  }

  @override
  String get noMaintenancePlanned => 'ไม่มีการบำรุงรักษาที่วางแผนไว้';

  @override
  String get everythingWorkingNormally => 'ทุกอย่างทำงานปกติ';

  @override
  String get maintenanceTitle => 'การบำรุงรักษา';

  @override
  String get maintenanceActiveLabel => 'กำลังดำเนินการ';

  @override
  String get maintenancePlannedLabel => 'วางแผนไว้';

  @override
  String get locking => 'กำลังล็อก...';

  @override
  String get newMessageNotification => 'ข้อความใหม่';

  @override
  String get secExplainTitle => 'Hash ปกป้องคุณอย่างไร';

  @override
  String get secExplainIntro =>
      'Hash ออกแบบมาเพื่อไม่ให้ใครอ่านข้อความของคุณได้';

  @override
  String get secExplainIntroSub => 'แม้แต่เรา\nนี่คือวิธีการทำงาน อธิบายง่ายๆ';

  @override
  String get secJourneyLabel => 'เส้นทาง';

  @override
  String get secJourneyTitle => 'การเดินทางของข้อความ';

  @override
  String get secJourneySubtitle =>
      'จากนิ้วของคุณถึงหน้าจอผู้ติดต่อ ทุกขั้นตอนได้รับการปกป้อง ติดตามเส้นทาง';

  @override
  String get secStep1Title => 'คุณเขียนข้อความ';

  @override
  String get secStep1Desc =>
      'คุณพิมพ์ \"สวัสดี!\" ในแอป ตอนนี้ข้อความอยู่ในหน่วยความจำโทรศัพท์เท่านั้น ยังไม่ได้ส่ง';

  @override
  String get secStep2Title => 'เข้ารหัสด้วย Signal Protocol';

  @override
  String get secStep2Desc =>
      'ทันทีที่กด \"ส่ง\" ข้อความจะถูกแปลงเป็นตัวอักษรที่อ่านไม่ได้ เหมือนข้อความถูกล็อกในตู้เซฟที่มีเพียงผู้ติดต่อเท่านั้นที่มีกุญแจ';

  @override
  String get secStep3Title => 'Sealed Sender: ซองจดหมายล่องหน';

  @override
  String get secStep3Desc =>
      'ลองนึกภาพส่งจดหมายทางไปรษณีย์โดยไม่มีที่อยู่ผู้ส่ง นั่นคือสิ่งที่ Hash ทำ ข้อความถูกทิ้งในตู้ไปรษณีย์นิรนาม เซิร์ฟเวอร์ไม่รู้ว่าใครส่ง';

  @override
  String get secStep4Title => 'เซิร์ฟเวอร์ไม่เห็นอะไร';

  @override
  String get secStep4Desc =>
      'เซิร์ฟเวอร์ทำหน้าที่เป็นบุรุษไปรษณีย์ตาบอด รู้แค่ว่า \"มีคนทิ้งอะไรบางอย่างในตู้ #A7X9\" ไม่รู้ว่าใครส่ง อะไร หรือสำหรับใคร';

  @override
  String get secStep4Highlight =>
      'ไม่จัดเก็บเมตาดาต้า: ไม่มี IP, ไม่มีเวลา, ไม่มีการเชื่อมโยงผู้ส่งกับผู้รับ';

  @override
  String get secStep5Title => 'ผู้ติดต่อได้รับข้อความ';

  @override
  String get secStep5Desc =>
      'โทรศัพท์ผู้ติดต่อดึงเนื้อหาจากตู้ไปรษณีย์นิรนามและถอดรหัสด้วยคีย์ส่วนตัวที่ไม่เคยออกจากอุปกรณ์ \"สวัสดี!\" ปรากฏบนหน้าจอ';

  @override
  String get secStep6Title => 'ข้อความหายไปจากเซิร์ฟเวอร์';

  @override
  String get secStep6Desc =>
      'ทันทีที่ผู้ติดต่อยืนยันการรับ เซิร์ฟเวอร์จะลบข้อความถาวร ไม่มีถังขยะ ไม่มีเก็บถาวร ไม่มีสำรอง แม้ข้อความที่ยังไม่อ่านก็ถูกทำลายอัตโนมัติหลัง 24 ชม.';

  @override
  String get secStep7Title => 'หมดอายุในเครื่อง';

  @override
  String get secStep7Desc =>
      'บนโทรศัพท์ผู้ติดต่อ ข้อความจะทำลายตัวเองตามระยะเวลาที่คุณเลือก: ทันทีหลังอ่าน, 5 นาที, 1 ชม. ... คุณตัดสินใจ';

  @override
  String get secJourneyConclusion =>
      'ผลลัพธ์: ไม่มีร่องรอยบนเซิร์ฟเวอร์ ไม่มีร่องรอยบนอุปกรณ์ ข้อความมีอยู่แค่เพื่อถูกอ่าน แล้วก็หายไป';

  @override
  String get secArchLabel => 'สถาปัตยกรรม';

  @override
  String get secArchTitle => '5 ชั้นการป้องกัน';

  @override
  String get secArchSubtitle =>
      'Hash ไม่พึ่งเทคโนโลยีเดียว แต่ละชั้นเสริมซึ่งกันและกัน แม้ชั้นหนึ่งถูกเจาะ ข้อมูลของคุณยังปลอดภัย';

  @override
  String get secLayer1Title => 'การเข้ารหัสแบบครบวงจร';

  @override
  String get secLayer1Desc =>
      'ทุกข้อความเข้ารหัสด้วยคีย์ไม่ซ้ำ พูดง่ายๆ: แม้ถอดรหัสข้อความหนึ่ง ก็ถอดรหัสข้อความถัดไปไม่ได้ ทุกข้อความมีแม่กุญแจของตัวเอง';

  @override
  String get secLayer1Detail =>
      'สำหรับไฟล์ (รูป, วิดีโอ, เอกสาร) Hash ใช้การเข้ารหัส AES-256-GCM เพิ่มเติม ไฟล์ถูกเข้ารหัสก่อนออกจากโทรศัพท์';

  @override
  String get secLayer2Title => 'Sealed Sender (นิรนามบนเครือข่าย)';

  @override
  String get secLayer2Desc =>
      'แอปส่งข้อความทั่วไปส่งข้อความพร้อมตัวตนของคุณ เหมือนเขียนชื่อบนซอง Hash ใช้ตู้ไปรษณีย์นิรนาม: เซิร์ฟเวอร์ส่งข้อความโดยไม่รู้ว่าใครส่ง';

  @override
  String get secLayer2Detail =>
      'ผลลัพธ์: แม้ข้อมูลเซิร์ฟเวอร์รั่ว ก็สร้างใหม่ไม่ได้ว่าใครคุยกับใคร';

  @override
  String get secLayer3Title => 'ลบอัตโนมัติ';

  @override
  String get secLayer3Desc =>
      'ข้อความถูกลบจากเซิร์ฟเวอร์ทันทีที่ยืนยันการรับ แม้ข้อความไม่ถูกเรียก ก็ถูกทำลายอัตโนมัติหลัง 24 ชม.';

  @override
  String get secLayer3Detail =>
      'บนโทรศัพท์ ข้อความทำลายตัวเองตามที่คุณเลือก: ทันที, 5 นาที, 15 นาที, 30 นาที, 1 ชม., 3 ชม., 6 ชม. หรือ 12 ชม.';

  @override
  String get secLayer4Title => 'การป้องกันการเข้าถึงในเครื่อง';

  @override
  String get secLayer4Desc =>
      'แอปป้องกันด้วย PIN 6 หลักและ/หรือไบโอเมตริก (Face ID, ลายนิ้วมือ) หลังจากพยายามล้มเหลวมาก แอปจะล็อกด้วยเวลาหน่วงที่เพิ่มขึ้น';

  @override
  String get secLayer5Title => 'ฐานข้อมูลที่ล็อก';

  @override
  String get secLayer5Desc =>
      'ฝั่งเซิร์ฟเวอร์ ไม่มีผู้ใช้เขียนฐานข้อมูลโดยตรงได้ ทุกการกระทำผ่านฟังก์ชันที่ปลอดภัยซึ่งตรวจสอบทุกคำขอ';

  @override
  String get secLayer5Detail =>
      'เหมือนเคาน์เตอร์ธนาคาร: คุณไม่เคยแตะห้องนิรภัยเอง คุณทำคำขอ และระบบตรวจสอบว่าคุณมีสิทธิ์ก่อนดำเนินการ';

  @override
  String get secVashLabel => 'หนึ่งเดียวในโลก';

  @override
  String get secVashTitle => 'โหมด Vash';

  @override
  String get secVashSubtitle =>
      'ระบบรักษาความปลอดภัยฉุกเฉินที่ไม่มีในแอปส่งข้อความอื่น';

  @override
  String get secVashScenarioTitle => 'ลองจินตนาการสถานการณ์นี้';

  @override
  String get secVashScenario1 => 'มีคนเข้าถึงโทรศัพท์ของคุณ';

  @override
  String get secVashScenario2 => 'ถูกขอรหัส PIN';

  @override
  String get secVashScenario3 => 'คุณต้องการลบข้อมูลทั้งหมดอย่างเร่งด่วน';

  @override
  String get secVashSolutionTitle => 'ทางออก: สอง PIN';

  @override
  String get secVashSolutionDesc => 'คุณตั้งค่าสอง PIN ที่แตกต่างกันใน Hash:';

  @override
  String get secVashNormalCodeLabel => 'รหัสปกติ';

  @override
  String get secVashNormalCodeDesc => 'เปิดแอปตามปกติพร้อมข้อมูลทั้งหมด';

  @override
  String get secVashCodeLabel2 => 'รหัส Vash';

  @override
  String get secVashCodeDescription =>
      'เปิดแอปตามปกติ... แต่ข้อมูลทั้งหมดถูกลบเงียบๆ ในเบื้องหลัง';

  @override
  String get secVashWhatHappensTitle => 'จะเกิดอะไรขึ้น';

  @override
  String get secVashWhatHappensDesc =>
      'แอปเปิดตามปกติ ไม่มีแจ้งเตือน ไม่มีแอนิเมชันน่าสงสัย หน้าจอแสดงแอปเปล่าเหมือนเพิ่งติดตั้ง\n\nในความเป็นจริง แชท ผู้ติดต่อ และข้อความทั้งหมดถูกลบอย่างไม่สามารถกู้คืนได้ในเสี้ยววินาที';

  @override
  String get secCallsLabel => 'สายและไฟล์';

  @override
  String get secCallsTitle => 'ทุกอย่างเข้ารหัส';

  @override
  String get secCallsSubtitle =>
      'ไม่ใช่แค่ข้อความ ทุกสิ่งที่ผ่าน Hash เข้ารหัสแบบครบวงจร';

  @override
  String get secAudioCallTitle => 'สายเสียง';

  @override
  String get secAudioCallDesc =>
      'เข้ารหัสแบบครบวงจรผ่าน WebRTC เสียงส่งตรงระหว่างอุปกรณ์';

  @override
  String get secVideoCallTitle => 'วิดีโอคอล';

  @override
  String get secVideoCallDesc => 'เทคโนโลยีเดียวกัน แต่ละสตรีมเข้ารหัสแยกกัน';

  @override
  String get secPhotosTitle => 'รูปภาพและวิดีโอ';

  @override
  String get secPhotosDesc => 'เข้ารหัสด้วย AES-256-GCM ก่อนออกจากโทรศัพท์';

  @override
  String get secDocsTitle => 'เอกสาร';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, ไฟล์ใดก็ตาม ชื่อ ขนาด และเนื้อหาเข้ารหัส';

  @override
  String get secAnonLabel => 'นิรนาม';

  @override
  String get secAnonTitle => 'ไม่ต้องระบุตัวตน';

  @override
  String get secAnonSubtitle =>
      'Hash ไม่เคยขอเบอร์โทรหรืออีเมล คุณถูกระบุด้วย Hash ID ที่ไม่ซ้ำและนิรนาม';

  @override
  String get secHashIdTitle => 'Hash ID ของคุณ';

  @override
  String get secHashIdDesc =>
      'นี่คือตัวระบุเฉพาะของคุณ ไม่เปิดเผยอะไรเกี่ยวกับคุณ: ไม่มีชื่อ ไม่มีเบอร์ ไม่มีตำแหน่ง เหมือนนามแฝงที่เชื่อมโยงกับตัวตนจริงไม่ได้\n\nเพื่อเพิ่มผู้ติดต่อ แชร์ Hash ID หรือสแกน QR Code แค่นั้น ไม่มีสมุดรายชื่อที่ซิงค์ ไม่มีแนะนำ \"คนที่คุณอาจรู้จัก\"';

  @override
  String get secDataLabel => 'ข้อมูล';

  @override
  String get secDataTitle => 'สิ่งที่ Hash ไม่รู้';

  @override
  String get secDataSubtitle => 'วิธีที่ดีที่สุดในการปกป้องข้อมูลคือไม่เก็บมัน';

  @override
  String get secNeverCollected => 'ไม่เคยเก็บ';

  @override
  String get secNeverItem1 => 'เนื้อหาข้อความ';

  @override
  String get secNeverItem2 => 'รายชื่อผู้ติดต่อ';

  @override
  String get secNeverItem3 => 'เบอร์โทรศัพท์';

  @override
  String get secNeverItem4 => 'อีเมล';

  @override
  String get secNeverItem5 => 'IP แอดเดรส';

  @override
  String get secNeverItem6 => 'ตำแหน่ง';

  @override
  String get secNeverItem7 => 'เมตาดาต้า (ใครคุยกับใคร)';

  @override
  String get secNeverItem8 => 'ประวัติสาย';

  @override
  String get secNeverItem9 => 'สมุดรายชื่อ';

  @override
  String get secNeverItem10 => 'ตัวระบุโฆษณา';

  @override
  String get secTempStored => 'จัดเก็บชั่วคราว';

  @override
  String get secTempItem1 => 'Hash ID นิรนาม (ตัวระบุเฉพาะ)';

  @override
  String get secTempItem2 => 'คีย์เข้ารหัสสาธารณะ';

  @override
  String get secTempItem3 => 'ข้อความเข้ารหัสระหว่างทาง (สูงสุด 24 ชม.)';

  @override
  String get secTempNote =>
      'แม้ข้อมูลน้อยนิดนี้ก็ไม่สามารถระบุตัวคุณได้ Hash ID ไม่เชื่อมโยงกับข้อมูลส่วนบุคคลใดๆ';

  @override
  String get secFooterTitle => 'ความเป็นส่วนตัว คือเสรีภาพของคุณ';

  @override
  String get secFooterDesc =>
      'Hash ใช้เทคโนโลยีเข้ารหัสเดียวกับแอปมืออาชีพที่เข้มงวดที่สุด ข้อความของคุณปกป้องด้วยคณิตศาสตร์ ไม่ใช่คำสัญญา';

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
