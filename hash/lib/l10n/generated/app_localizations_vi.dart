// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Hash';

  @override
  String get appTagline => 'Không dấu vết. Không thỏa hiệp.';

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
  String get conversations => 'Trò chuyện';

  @override
  String get contacts => 'Danh bạ';

  @override
  String get noConversation => 'Không có cuộc trò chuyện';

  @override
  String get noConversationSubtitle =>
      'Thêm liên hệ để bắt đầu trò chuyện an toàn';

  @override
  String pendingRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yêu cầu đang chờ',
      one: '1 yêu cầu đang chờ',
    );
    return '$_temp0';
  }

  @override
  String sentRequestsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yêu cầu đã gửi đang chờ',
      one: '1 yêu cầu đã gửi đang chờ',
    );
    return '$_temp0';
  }

  @override
  String get addContact => 'Thêm liên hệ';

  @override
  String get shareApp => 'Chia sẻ ứng dụng';

  @override
  String get newMessage => 'Tin nhắn mới';

  @override
  String get newConversation => 'Gửi tin nhắn';

  @override
  String get settings => 'Cài đặt';

  @override
  String get myHashId => 'Hash ID của tôi';

  @override
  String get supportHash => 'Hỗ trợ Hash';

  @override
  String get supportHashSubtitle => 'Hash là dự án phi lợi nhuận';

  @override
  String get donate => 'Quyên góp';

  @override
  String get appearance => 'Giao diện';

  @override
  String get theme => 'Chủ đề';

  @override
  String get themeAuto => 'Tự động';

  @override
  String get themeAutoSubtitle => 'Theo cài đặt hệ thống';

  @override
  String get themeDark => 'Tối';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeRecommendation =>
      'Chủ đề tối được khuyến nghị để bảo mật tốt hơn';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageAuto => 'Tự động (hệ thống)';

  @override
  String get notifications => 'Thông báo';

  @override
  String get messages => 'Tin nhắn';

  @override
  String get calls => 'Cuộc gọi';

  @override
  String get vibration => 'Rung';

  @override
  String get notificationContent => 'Nội dung thông báo';

  @override
  String get notificationContentFull => 'Hiển thị tất cả';

  @override
  String get notificationContentFullDesc => 'Tên liên hệ và xem trước tin nhắn';

  @override
  String get notificationContentName => 'Chỉ tên';

  @override
  String get notificationContentNameDesc => 'Chỉ hiển thị tên liên hệ';

  @override
  String get notificationContentDiscrete => 'Kín đáo';

  @override
  String get notificationContentDiscreteDesc => 'Chỉ hiển thị \"Tin nhắn mới\"';

  @override
  String get security => 'Bảo mật';

  @override
  String get howHashProtectsYou => 'Hash bảo vệ bạn như thế nào';

  @override
  String get howHashProtectsYouSubtitle => 'Hiểu về bảo mật của bạn';

  @override
  String get accountSecurity => 'Bảo mật tài khoản';

  @override
  String get accountSecuritySubtitle => 'PIN, sinh trắc học, Chế độ Vash';

  @override
  String get blockScreenshots => 'Chặn ảnh chụp màn hình';

  @override
  String get transferDevice => 'Chuyển sang thiết bị khác';

  @override
  String get transferDeviceSubtitle => 'Di chuyển tài khoản của bạn';

  @override
  String get pinCode => 'Mã PIN';

  @override
  String get changePin => 'Đổi mã PIN';

  @override
  String get currentPin => 'Mã PIN hiện tại';

  @override
  String get newPin => 'Mã PIN mới';

  @override
  String get confirmPin => 'Xác nhận mã PIN';

  @override
  String get pinChanged => 'Đã đổi mã PIN';

  @override
  String get incorrectPin => 'PIN không đúng';

  @override
  String get pinsDoNotMatch => 'Các mã PIN không khớp';

  @override
  String get autoLock => 'Tự động khóa';

  @override
  String get autoLockDelay => 'Thời gian chờ khóa';

  @override
  String get autoLockImmediate => 'Ngay lập tức';

  @override
  String get autoLockMinute => '1 phút';

  @override
  String autoLockMinutes(int count) {
    return '$count phút';
  }

  @override
  String get vashCode => 'Mã Vash';

  @override
  String get vashModeTitle => 'Chế độ Vash';

  @override
  String get vashModeExplanation => 'Lưới an toàn cuối cùng của bạn.';

  @override
  String get vashModeDescription =>
      'Bạn sẽ chọn mã PIN thứ hai. Nếu bạn bị buộc phải mở Hash, hãy nhập mã này thay vì PIN thông thường.\n\nỨng dụng sẽ mở bình thường, nhưng tất cả cuộc trò chuyện và danh bạ sẽ biến mất.\n\nĐối với bất kỳ ai nhìn vào màn hình, Hash đơn giản là trống — như thể bạn chưa bao giờ sử dụng.';

  @override
  String get vashModeIrreversible =>
      'Hành động này im lặng và không thể hoàn tác.';

  @override
  String get chooseVashCode => 'Chọn mã Vash';

  @override
  String get vashCodeInfo =>
      'Mã PIN thứ hai mở ứng dụng bình thường, nhưng trống.';

  @override
  String get vashModeDescription2 =>
      'Deux codes, un seul écran. L\'un vous connecte, l\'autre fait tout disparaître.';

  @override
  String get vashCodeInfoDetail => 'Nếu bạn nhập mã này thay vì PIN:';

  @override
  String get vashDeleteContacts => 'Danh bạ của bạn biến mất';

  @override
  String get vashDeleteMessages => 'Cuộc trò chuyện của bạn biến mất';

  @override
  String get vashDeleteHistory => 'Ghi chú của bạn biến mất';

  @override
  String get vashKeepId => 'Danh tính Hash (#XXX-XXX-XXX) vẫn giữ nguyên';

  @override
  String get vashAppearNormal =>
      'Ứng dụng hiện bình thường nhưng trống, như mới. Hành động này không thể hoàn tác.';

  @override
  String get setupVashCode => 'Thiết lập mã Vash';

  @override
  String get modifyVashCode => 'Sửa mã Vash';

  @override
  String get currentVashCode => 'Mã Vash hiện tại';

  @override
  String get newVashCode => 'Mã Vash mới';

  @override
  String get confirmVashCode => 'Xác nhận mã Vash';

  @override
  String get vashCodeConfigured => 'Đã cấu hình mã Vash';

  @override
  String get vashCodeModified => 'Đã sửa mã Vash';

  @override
  String get vashCodeMustDiffer => 'Mã Vash phải khác với PIN';

  @override
  String get incorrectVashCode => 'Mã Vash không đúng';

  @override
  String get vashWhatToDelete => 'Chế độ Vash nên làm biến mất gì?';

  @override
  String get vashDeleteContactsOption => 'Danh bạ';

  @override
  String get vashDeleteContactsWarning =>
      'Vous devrez rajouter chaque contact manuellement';

  @override
  String get vashDeleteContactsConfirm =>
      'Si le code Vash est utilisé, tous vos contacts seront définitivement supprimés. Vous devrez les rajouter un par un en refaisant un échange de code avec chacun d\'entre eux.';

  @override
  String get vashDeleteMessagesOption => 'Tin nhắn';

  @override
  String get vashDeleteMessagesWarning =>
      'Toutes vos conversations seront effacées';

  @override
  String get vashDeleteNotesOption => 'Ghi chú';

  @override
  String get vashDeleteNotesWarning => 'Toutes vos notes seront supprimées';

  @override
  String get vashActivated => 'Đã kích hoạt chế độ Vash';

  @override
  String get vashCreateSubtitle => 'Chọn mã khác với PIN chính';

  @override
  String get vashConfirmSubtitle => 'Xác nhận mã Vash của bạn';

  @override
  String get pinCodeForEntry => 'Mã PIN để vào ứng dụng';

  @override
  String get vashCodeSection => 'Chế độ Vash';

  @override
  String get biometric => 'Sinh trắc học';

  @override
  String get biometricUnlock => 'Mở khóa bằng vân tay hoặc Face ID';

  @override
  String get enableBiometric => 'Bật sinh trắc học';

  @override
  String get biometricWarningMessage =>
      'Khi bật sinh trắc học, bạn sẽ không thể sử dụng mã Vash để vào ứng dụng.\n\nBạn chỉ có thể sử dụng mã Vash nếu sinh trắc học thất bại (sau nhiều lần thử không thành công).\n\nBạn có chắc muốn tiếp tục không?';

  @override
  String get understood => 'Tôi hiểu rồi';

  @override
  String get shareAppSubtitle => 'Chia sẻ Hash với người thân';

  @override
  String get share => 'Chia sẻ';

  @override
  String get danger => 'Nguy hiểm';

  @override
  String get deleteAccount => 'Xóa tài khoản';

  @override
  String get deleteAccountSubtitle => 'Hành động không thể hoàn tác';

  @override
  String get deleteAccountConfirmTitle => 'Xóa tài khoản';

  @override
  String get deleteAccountConfirmMessage =>
      'Tài khoản của bạn sẽ bị xóa vĩnh viễn. Hành động này không thể hoàn tác.\n\n• Tất cả cuộc trò chuyện\n• Tất cả danh bạ\n• Hash ID của bạn\n\nBạn sẽ cần tạo tài khoản mới.';

  @override
  String get deleteForever => 'Xóa vĩnh viễn';

  @override
  String get cancel => 'Hủy';

  @override
  String get confirmationWord => 'SUPPRIMER';

  @override
  String get typeWordToConfirm => 'Tapez votre Hash ID pour confirmer';

  @override
  String get dataDeletedForSecurity => 'Đã kích hoạt chế độ Vash.';

  @override
  String deletionError(String error) {
    return 'Lỗi khi xóa: $error';
  }

  @override
  String get yourSecurity => 'Bảo mật của bạn';

  @override
  String get securityInfo =>
      '• Mã hóa đầu cuối (Signal Protocol)\n• Không có dữ liệu trên máy chủ sau khi giao\n• Khóa chỉ lưu trên thiết bị của bạn\n• Mã PIN không bao giờ gửi đến máy chủ';

  @override
  String version(String version) {
    return 'Hash v$version';
  }

  @override
  String get welcome => 'Chào mừng';

  @override
  String get securityStatement1 => 'Tin nhắn của bạn được bảo vệ.';

  @override
  String get securityStatement2 => 'Mã hóa đầu cuối.';

  @override
  String get securityStatement3 => 'Không dấu vết. Không thỏa hiệp.';

  @override
  String get securityStatement4 => 'Quyền riêng tư là quyền của bạn.';

  @override
  String get accessBlocked => 'Truy cập bị chặn';

  @override
  String get tooManyAttempts => 'Quá nhiều lần thử. Vui lòng thử lại sau.';

  @override
  String get pleaseWait => 'Vui lòng đợi';

  @override
  String get waitDelay => 'Vui lòng đợi hết thời gian chờ';

  @override
  String attemptCount(int current, int max) {
    return 'Lần thử $current / $max';
  }

  @override
  String retryIn(String time) {
    return 'Thử lại sau $time';
  }

  @override
  String get forgotPin => 'Quên PIN? Dùng cụm từ khôi phục';

  @override
  String get useRecoveryPhrase => 'Dùng cụm từ khôi phục';

  @override
  String get recoveryWarningTitle => 'Cảnh báo';

  @override
  String get recoveryWarningMessage => 'Khôi phục tài khoản sẽ:';

  @override
  String get recoveryDeleteAllMessages => 'Xóa TẤT CẢ tin nhắn';

  @override
  String get recoveryWaitDelay => 'Yêu cầu chờ 1 giờ';

  @override
  String get recoveryKeepContacts => 'Giữ lại danh bạ';

  @override
  String get recoveryIrreversible =>
      'Hành động này không thể hoàn tác. Tin nhắn sẽ mất vĩnh viễn.';

  @override
  String get iUnderstand => 'Tôi hiểu';

  @override
  String get accountRecovery => 'Khôi phục tài khoản';

  @override
  String get enterRecoveryPhrase =>
      'Nhập 24 từ của cụm từ khôi phục, cách nhau bằng dấu cách.';

  @override
  String get recoveryPhraseHint => 'word1 word2 word3 ...';

  @override
  String get recover => 'Khôi phục';

  @override
  String get recoveryPhraseRequired => 'Vui lòng nhập cụm từ khôi phục';

  @override
  String get recoveryPhrase24Words => 'Cụm từ phải có đúng 24 từ';

  @override
  String get incorrectRecoveryPhrase => 'Cụm từ khôi phục không đúng';

  @override
  String get recoveryInitError => 'Lỗi khi khởi tạo khôi phục';

  @override
  String get securityDelay => 'Thời gian chờ bảo mật';

  @override
  String get securityDelayMessage =>
      'Vì bảo mật, cần thời gian chờ trước khi tạo PIN mới.';

  @override
  String get timeRemaining => 'Thời gian còn lại';

  @override
  String get messagesDeletedForProtection =>
      'Tin nhắn đã bị xóa để bảo vệ bạn.';

  @override
  String get canCloseApp => 'Bạn có thể đóng ứng dụng và quay lại sau.';

  @override
  String get onboardingTitle1 => 'Chào mừng đến Hash';

  @override
  String get onboardingSubtitle1 => 'Ứng dụng nhắn tin không để lại dấu vết';

  @override
  String get onboardingTitle2 => 'Mã hóa toàn diện';

  @override
  String get onboardingSubtitle2 =>
      'Tin nhắn được mã hóa đầu cuối bằng giao thức Signal';

  @override
  String get onboardingTitle3 => 'Không dấu vết';

  @override
  String get onboardingSubtitle3 =>
      'Tin nhắn bị xóa khỏi máy chủ ngay sau khi giao';

  @override
  String get onboardingTitle4 => 'Bảo mật của bạn';

  @override
  String get onboardingSubtitle4 => 'Mã PIN, Chế độ Vash và cụm từ khôi phục';

  @override
  String get getStarted => 'Bắt đầu';

  @override
  String get next => 'Tiếp';

  @override
  String get skip => 'Bỏ qua';

  @override
  String get alreadyHaveAccount => 'Tôi đã có tài khoản';

  @override
  String get transferMyAccount => 'Chuyển tài khoản của tôi';

  @override
  String get createPin => 'Tạo mã PIN';

  @override
  String get createPinSubtitle => 'Mã này sẽ bảo vệ quyền truy cập ứng dụng';

  @override
  String get confirmYourPin => 'Xác nhận mã PIN';

  @override
  String get confirmPinSubtitle => 'Nhập lại mã PIN';

  @override
  String get saveRecoveryPhrase => 'Cụm từ khôi phục';

  @override
  String get saveRecoveryPhraseSubtitle =>
      'Ghi lại 24 từ này theo thứ tự. Chúng sẽ giúp bạn khôi phục tài khoản nếu quên PIN.';

  @override
  String get phraseWritten => 'Tôi đã ghi cụm từ';

  @override
  String get warningRecoveryPhrase =>
      'Nếu mất cụm từ này và quên PIN, bạn sẽ mất quyền truy cập tài khoản.';

  @override
  String get accountTransferred => 'Đã chuyển tài khoản';

  @override
  String get accountTransferredMessage =>
      'Tài khoản đã được chuyển sang thiết bị khác. Phiên này không còn hiệu lực.';

  @override
  String get accountTransferredInfo =>
      'Nếu bạn không thực hiện việc chuyển này, tài khoản có thể đã bị xâm phạm.';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get transferAccount => 'Chuyển tài khoản';

  @override
  String get transferAccountInfo =>
      'Chuyển tài khoản Hash sang thiết bị mới. Phiên hiện tại sẽ bị hủy.';

  @override
  String get generateTransferCode => 'Tạo mã chuyển';

  @override
  String get transferCode => 'Mã chuyển';

  @override
  String transferCodeExpires(int minutes) {
    return 'Mã này hết hạn sau $minutes phút';
  }

  @override
  String get enterCodeOnNewDevice =>
      'Nhập mã này trên thiết bị mới để chuyển tài khoản.';

  @override
  String get generateNewCode => 'Tạo mã mới';

  @override
  String get scanQrCode => 'Quét mã QR';

  @override
  String get scanQrCodeSubtitle => 'Quét mã QR của liên hệ để thêm';

  @override
  String get qrCodeDetected => 'Đã phát hiện mã QR';

  @override
  String get invalidQrCode => 'Mã QR không hợp lệ';

  @override
  String get cameraPermissionRequired => 'Cần quyền truy cập camera';

  @override
  String get myQrCode => 'Mã QR của tôi';

  @override
  String get myQrCodeSubtitle => 'Chia sẻ mã QR này để liên hệ thêm bạn';

  @override
  String get shareQrCode => 'Chia sẻ';

  @override
  String get addContactTitle => 'Thêm liên hệ';

  @override
  String get addContactByHashId => 'Nhập Hash ID của liên hệ';

  @override
  String get hashIdHint => '000-000-XXX';

  @override
  String get searchContact => 'Tìm kiếm';

  @override
  String get contactNotFound => 'Không tìm thấy liên hệ';

  @override
  String get contactAlreadyAdded => 'Liên hệ này đã có trong danh sách';

  @override
  String get contactAdded => 'Đã thêm liên hệ';

  @override
  String get myProfile => 'Hồ sơ của tôi';

  @override
  String get myProfileSubtitle =>
      'Chia sẻ thông tin này để người khác thêm bạn';

  @override
  String get temporaryCode => 'Mã tạm thời';

  @override
  String temporaryCodeExpires(String time) {
    return 'Hết hạn sau $time';
  }

  @override
  String get codeExpired => 'Mã đã hết hạn';

  @override
  String get generateNewCodeButton => 'Mã mới';

  @override
  String get copyHashId => 'Sao chép ID';

  @override
  String get copyCode => 'Sao chép mã';

  @override
  String get copiedToClipboard => 'Đã sao chép';

  @override
  String get showMyQrCode => 'Hiện mã QR của tôi';

  @override
  String get orDivider => 'hoặc';

  @override
  String get openScanner => 'Mở máy quét';

  @override
  String get addManually => 'Thêm thủ công';

  @override
  String get contactHashIdLabel => 'Hash ID liên hệ';

  @override
  String get temporaryCodeLabel => 'Mã tạm thời';

  @override
  String get temporaryCodeHint => '000000';

  @override
  String get askContactForCode => 'Yêu cầu liên hệ tạo mã từ hồ sơ của họ';

  @override
  String get verifyAndAdd => 'Xác minh và thêm';

  @override
  String get fillAllFields => 'Vui lòng điền tất cả các trường';

  @override
  String get invalidHashIdFormat =>
      'Định dạng ID không hợp lệ (vd: 123-456-ABC)';

  @override
  String get userNotFound => 'Không tìm thấy người dùng';

  @override
  String get cannotAddYourself => 'Không thể tự thêm mình';

  @override
  String get invalidOrExpiredCode => 'Mã tạm thời không hợp lệ hoặc đã hết hạn';

  @override
  String get contactFound => 'Đã tìm thấy liên hệ!';

  @override
  String get howToCallContact => 'Bạn muốn gọi họ là gì?';

  @override
  String get contactNameHint => 'Tên liên hệ';

  @override
  String get addContactButton => 'Thêm';

  @override
  String get contactDetails => 'Chi tiết liên hệ';

  @override
  String get contactName => 'Tên liên hệ';

  @override
  String get contactHashId => 'Hash ID';

  @override
  String addedOn(String date) {
    return 'Thêm vào $date';
  }

  @override
  String get deleteContact => 'Xóa liên hệ';

  @override
  String deleteContactConfirm(Object name) {
    return 'Xóa liên hệ này?';
  }

  @override
  String get deleteContactMessage =>
      'Thao tác này cũng sẽ xóa toàn bộ cuộc trò chuyện.';

  @override
  String get delete => 'Xóa';

  @override
  String get typeMessage => 'Nhập tin nhắn...';

  @override
  String get messageSent => 'Đã gửi';

  @override
  String get messageDelivered => 'Đã giao';

  @override
  String get messageRead => 'Đã đọc';

  @override
  String get messageFailed => 'Gửi thất bại';

  @override
  String get now => 'Bây giờ';

  @override
  String minutesAgo(int count) {
    return '${count}ph';
  }

  @override
  String hoursAgo(int count) {
    return '${count}g';
  }

  @override
  String daysAgo(int count) {
    return '${count}ng';
  }

  @override
  String get today => 'Hôm nay';

  @override
  String get yesterday => 'Hôm qua';

  @override
  String dateAtTime(String date, String time) {
    return '$date lúc $time';
  }

  @override
  String get shareMessage =>
      'Hãy nhắn tin cho tôi trên Hash! 🔒\n\nĐây là ứng dụng nhắn tin thực sự riêng tư: mã hóa toàn diện, không dấu vết trên máy chủ, và chế độ khẩn cấp khi cần.\n\nTải ứng dụng tại 👇\nhttps://hash.devolim.fr/share/index.html';

  @override
  String get error => 'Lỗi';

  @override
  String get ok => 'OK';

  @override
  String get view => 'Xem';

  @override
  String get yes => 'Có';

  @override
  String get no => 'Không';

  @override
  String get save => 'Lưu';

  @override
  String get edit => 'Sửa';

  @override
  String get close => 'Đóng';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get loading => 'Đang tải...';

  @override
  String get retry => 'Thử lại';

  @override
  String get newContactRequest => 'Nouvelle demande de contact';

  @override
  String get pendingRequests => 'Yêu cầu đang chờ';

  @override
  String get noPendingRequests => 'Không có yêu cầu đang chờ';

  @override
  String get pendingRequestsSubtitle => 'Những người này muốn thêm bạn';

  @override
  String requestFromUser(String hashId) {
    return 'Yêu cầu từ $hashId';
  }

  @override
  String requestExpiresIn(int days) {
    return 'Hết hạn sau $days ngày';
  }

  @override
  String get acceptRequest => 'Chấp nhận';

  @override
  String get rejectRequest => 'Từ chối';

  @override
  String get requestAccepted => 'Đã chấp nhận yêu cầu';

  @override
  String get requestRejected => 'Đã từ chối yêu cầu';

  @override
  String get requestSent => 'Đã gửi yêu cầu!';

  @override
  String get requestSentSubtitle =>
      'Yêu cầu đã được gửi. Người dùng phải chấp nhận trước khi bạn có thể trò chuyện.';

  @override
  String get requestAlreadyPending => 'Đã có yêu cầu đang chờ';

  @override
  String get requestAlreadySentByOther => 'Người này đã gửi yêu cầu cho bạn';

  @override
  String get addByHashId => 'Thêm bằng Hash ID';

  @override
  String get addByHashIdSubtitle => 'Nhập Hash ID và mã tạm thời của liên hệ';

  @override
  String get enterTemporaryCode => 'Nhập mã 6 chữ số';

  @override
  String get sendRequest => 'Gửi yêu cầu';

  @override
  String get acceptContactTitle => 'Chấp nhận liên hệ';

  @override
  String get acceptContactSubtitle => 'Bạn có thể đặt tên tùy chỉnh cho họ';

  @override
  String get leaveEmptyForHashId => 'Để trống để dùng Hash ID';

  @override
  String get firstName => 'Tên';

  @override
  String get lastName => 'Họ';

  @override
  String get notes => 'Ghi chú';

  @override
  String get notesHint => 'Ghi chú cá nhân về liên hệ này';

  @override
  String get photoOptional => 'Ảnh (tùy chọn)';

  @override
  String get contactNameOptional => 'Tên (tùy chọn)';

  @override
  String get notesOptional => 'Ghi chú (tùy chọn)';

  @override
  String get storedLocally => 'Chỉ lưu trên thiết bị của bạn';

  @override
  String get encryptedMessageLabel => 'Tin nhắn mã hóa';

  @override
  String get identityMessageHint => 'Bạn là ai? Bạn biết nhau thế nào?';

  @override
  String get messageWillBeSentEncrypted =>
      'Tin nhắn này sẽ được mã hóa và gửi đến người nhận';

  @override
  String get sendRequestButton => 'Gửi yêu cầu';

  @override
  String get requestExpiresIn24h =>
      'Yêu cầu hết hạn sau 24 giờ nếu không được chấp nhận';

  @override
  String get theyAlreadySentYouRequest => 'Người này đã gửi yêu cầu cho bạn';

  @override
  String get requests => 'Yêu cầu';

  @override
  String get receivedRequests => 'Đã nhận';

  @override
  String get sentRequests => 'Đã gửi';

  @override
  String get noSentRequests => 'Không có yêu cầu đã gửi';

  @override
  String get cancelRequest => 'Hủy';

  @override
  String get deleteRequest => 'Xóa yêu cầu';

  @override
  String get requestCancelled => 'Đã hủy yêu cầu';

  @override
  String sentTo(String hashId) {
    return 'Gửi đến $hashId';
  }

  @override
  String expiresIn(String time) {
    return 'Hết hạn sau $time';
  }

  @override
  String receivedAgo(String time) {
    return 'Nhận $time trước';
  }

  @override
  String get messageFromRequester => 'Tin nhắn từ người gửi yêu cầu';

  @override
  String get copy => 'Sao chép';

  @override
  String get messageInfo => 'Thông tin tin nhắn';

  @override
  String get messageDirection => 'Hướng';

  @override
  String get messageSentByYou => 'Bạn gửi';

  @override
  String get messageReceived => 'Đã nhận';

  @override
  String get messageSentAt => 'Gửi lúc';

  @override
  String get messageReceivedAt => 'Reçu le';

  @override
  String get messageDisappearsIn => 'Disparaît dans';

  @override
  String get messageStatus => 'Trạng thái';

  @override
  String get messageReadAt => 'Đọc lúc';

  @override
  String get messageType => 'Loại';

  @override
  String get messageSize => 'Kích thước';

  @override
  String get messageExpiresAt => 'Hết hạn lúc';

  @override
  String get messageEncrypted => 'Mã hóa đầu cuối';

  @override
  String get messageStatusSending => 'Đang gửi...';

  @override
  String get messageStatusSent => 'Đã gửi';

  @override
  String get messageStatusDelivered => 'Đã giao';

  @override
  String get messageStatusRead => 'Đã đọc';

  @override
  String get messageStatusFailed => 'Thất bại';

  @override
  String get serverStatus => 'Máy chủ';

  @override
  String get onServer => 'Đang chờ giao';

  @override
  String get deletedFromServer => 'Đã xóa';

  @override
  String get messageTypeText => 'Văn bản';

  @override
  String get messageTypeImage => 'Hình ảnh';

  @override
  String get messageTypeVideo => 'Video';

  @override
  String get messageTypeVoice => 'Giọng nói';

  @override
  String get messageTypeFile => 'Tệp';

  @override
  String get indefinitely => 'Vô thời hạn';

  @override
  String get hoursShort => 'g';

  @override
  String get minutesShort => 'ph';

  @override
  String get hours => 'giờ';

  @override
  String get minutes => 'phút';

  @override
  String get seconds => 'giây';

  @override
  String get ephemeralMessages => 'Tin nhắn tự hủy';

  @override
  String get ephemeralMessagesDescription =>
      'Tin nhắn tự động bị xóa sau khoảng thời gian này';

  @override
  String get ephemeralImmediate => 'Ngay lập tức (sau khi đọc)';

  @override
  String get ephemeralImmediateDesc => 'Xóa ngay khi đọc';

  @override
  String get ephemeralMyPreference => 'Ưu tiên của tôi';

  @override
  String get ephemeralMyPreferenceDesc => 'Dùng cài đặt chung';

  @override
  String get ephemeralDefaultSetting => 'Thời lượng tin nhắn';

  @override
  String get ephemeralChooseDefault => 'Đề xuất';

  @override
  String get ephemeral30Seconds => '30 giây';

  @override
  String get ephemeral30SecondsDesc => 'Xóa 30 giây sau khi đọc';

  @override
  String get ephemeral5Minutes => '5 phút';

  @override
  String get ephemeral5MinutesDesc => 'Xóa 5 phút sau khi đọc';

  @override
  String get ephemeral1Hour => '1 giờ';

  @override
  String get ephemeral1HourDesc => 'Xóa 1 giờ sau khi đọc';

  @override
  String get ephemeral3Hours => '3 giờ';

  @override
  String get ephemeral6Hours => '6 giờ';

  @override
  String get ephemeral6HoursDesc => 'Xóa 6 giờ sau khi đọc';

  @override
  String get ephemeral12Hours => '12 giờ';

  @override
  String get ephemeral24Hours => '24 giờ';

  @override
  String get ephemeral24HoursDesc => 'Xóa 24 giờ sau khi đọc';

  @override
  String get ephemeral3Days => '3 jours';

  @override
  String get ephemeral3DaysDesc => 'Supprimé 3 jours après lecture';

  @override
  String get customDuration => 'Tùy chỉnh';

  @override
  String get howItWorks => 'Cách hoạt động';

  @override
  String get ephemeralExplanation1 =>
      'Tin nhắn bị xóa khỏi máy chủ ngay khi nhận.';

  @override
  String get ephemeralExplanation2 =>
      'Cài đặt này xác định khi nào tin nhắn biến mất khỏi điện thoại CỦA BẠN sau khi đọc.';

  @override
  String get ephemeralExplanation3 =>
      'Liên hệ của bạn có cài đặt riêng cho điện thoại của họ.';

  @override
  String get mute1Hour => '1 giờ';

  @override
  String get mute8Hours => '8 giờ';

  @override
  String get mute1Day => '1 ngày';

  @override
  String get mute1Week => '1 tuần';

  @override
  String get muteAlways => 'Luôn luôn';

  @override
  String get muteExplanation => 'Bạn sẽ không nhận thông báo từ liên hệ này';

  @override
  String get showCallsInRecents => 'Hiện trong cuộc gọi gần đây';

  @override
  String get showCallsInRecentsSubtitle =>
      'Cuộc gọi Hash xuất hiện trong lịch sử điện thoại';

  @override
  String get feedback => 'Phản hồi';

  @override
  String get muteNotifications => 'Tắt thông báo';

  @override
  String get muteDescription => 'Bạn sẽ không nhận thông báo từ liên hệ này';

  @override
  String mutedUntil(String time) {
    return 'Tắt tiếng đến $time';
  }

  @override
  String get notMuted => 'Đã bật thông báo';

  @override
  String get unmute => 'Bật tiếng';

  @override
  String get notificationSound => 'Âm thanh thông báo';

  @override
  String get defaultSound => 'Mặc định';

  @override
  String get chatSettings => 'Cài đặt trò chuyện';

  @override
  String get bubbleColor => 'Màu bong bóng';

  @override
  String get backgroundColor => 'Màu nền';

  @override
  String get backgroundImage => 'Hình nền';

  @override
  String get chatBackground => 'Nền trò chuyện';

  @override
  String get customColor => 'Tùy chỉnh';

  @override
  String get defaultColor => 'Mặc định';

  @override
  String get imageSelected => 'Đã chọn hình';

  @override
  String get noImage => 'Không có hình';

  @override
  String get color => 'Màu';

  @override
  String get image => 'Hình';

  @override
  String get tapToSelectImage => 'Chạm để chọn hình';

  @override
  String get changeImage => 'Đổi hình';

  @override
  String get previewMessageReceived => 'Xin chào!';

  @override
  String get previewMessageSent => 'Chào bạn!';

  @override
  String get messageAction => 'Tin nhắn';

  @override
  String get callAction => 'Gọi';

  @override
  String get videoAction => 'Video';

  @override
  String get personalNotes => 'Ghi chú cá nhân';

  @override
  String get addNotes => 'Thêm ghi chú...';

  @override
  String get noNotes => 'Không có ghi chú';

  @override
  String get messageNotifications => 'Thông báo tin nhắn';

  @override
  String get callNotifications => 'Thông báo cuộc gọi';

  @override
  String get useGradient => 'Dùng chuyển màu';

  @override
  String get gradientStart => 'Màu bắt đầu';

  @override
  String get gradientEnd => 'Màu kết thúc';

  @override
  String get preview => 'Xem trước';

  @override
  String get reset => 'Đặt lại';

  @override
  String get securityNumber => 'Số bảo mật';

  @override
  String securityNumberDescription(String name) {
    return 'Xác minh số bảo mật khớp với thiết bị của $name';
  }

  @override
  String get verifyEncryption => 'Xác minh mã hóa đầu cuối';

  @override
  String get tapToCopy => 'Chạm để sao chép';

  @override
  String get howToVerify => 'Cách xác minh';

  @override
  String get verifyStep1 => 'Gặp trực tiếp hoặc gọi cho liên hệ';

  @override
  String get verifyStep2 => 'So sánh số bảo mật hoặc quét mã QR';

  @override
  String get verifyStep3 => 'Nếu khớp, cuộc trò chuyện của bạn an toàn';

  @override
  String get scanToVerify => 'Quét để xác minh';

  @override
  String get reportSpam => 'Báo cáo spam';

  @override
  String get reportSpamSubtitle => 'Báo cáo liên hệ này là spam';

  @override
  String get reportSpamDescription =>
      'Liên hệ này sẽ bị báo cáo ẩn danh. Danh tính của bạn sẽ không bị tiết lộ. Bạn có chắc không?';

  @override
  String get report => 'Báo cáo';

  @override
  String get spamReported => 'Đã báo cáo spam';

  @override
  String get reportError => 'Gửi báo cáo thất bại. Vui lòng thử lại.';

  @override
  String get reportRateLimited =>
      'Bạn đã đạt số lượng báo cáo tối đa trong ngày.';

  @override
  String get blockContact => 'Chặn liên hệ';

  @override
  String get blockContactDescription =>
      'Liên hệ này sẽ không thể gửi tin nhắn hoặc gọi cho bạn. Họ sẽ không được thông báo.';

  @override
  String get unblockContact => 'Bỏ chặn liên hệ';

  @override
  String get unblockContactDescription =>
      'Liên hệ này sẽ có thể gửi tin nhắn và gọi cho bạn lại.';

  @override
  String get contactBlocked => 'Đã chặn liên hệ';

  @override
  String get contactUnblocked => 'Đã bỏ chặn liên hệ';

  @override
  String get contactIsBlocked => 'Liên hệ này đã bị chặn';

  @override
  String get unblock => 'Bỏ chặn';

  @override
  String get deleteContactSubtitle => 'Xóa liên hệ và cuộc trò chuyện';

  @override
  String get confirmWithPin => 'Xác nhận bằng PIN';

  @override
  String get enterPinToConfirm => 'Nhập PIN để xác nhận hành động này';

  @override
  String get profilePhoto => 'Ảnh hồ sơ';

  @override
  String get takePhoto => 'Chụp ảnh';

  @override
  String get chooseFromGallery => 'Chọn từ thư viện';

  @override
  String get removePhoto => 'Xóa ảnh';

  @override
  String get viewContactHashId => 'Xem mã định danh liên hệ';

  @override
  String get hashIdPartiallyMasked =>
      'Ẩn một phần vì bảo mật của bạn và quyền riêng tư của liên hệ';

  @override
  String get addFirstContact => 'Thêm liên hệ đầu tiên';

  @override
  String get addFirstContactSubtitle => 'Chia sẻ mã QR hoặc quét mã của bạn bè';

  @override
  String get directory => 'Danh bạ';

  @override
  String get noContacts => 'Không có liên hệ';

  @override
  String get noContactsSubtitle => 'Thêm liên hệ để bắt đầu';

  @override
  String get sendMessageAction => 'Gửi tin nhắn';

  @override
  String get audioCall => 'Gọi thoại';

  @override
  String get videoCall => 'Gọi video';

  @override
  String get viewProfile => 'Xem hồ sơ';

  @override
  String get deleteContactDirectory => 'Xóa liên hệ';

  @override
  String get scanShort => 'Quét';

  @override
  String get addShort => 'Thêm';

  @override
  String deleteContactConfirmName(String name) {
    return 'Bạn có chắc muốn xóa $name?';
  }

  @override
  String get noNotesTitle => 'Không có ghi chú';

  @override
  String get noNotesSubtitle => 'Tạo ghi chú đầu tiên';

  @override
  String get newNote => 'Ghi chú mới';

  @override
  String get editNote => 'Sửa ghi chú';

  @override
  String get deleteNote => 'Xóa ghi chú';

  @override
  String get deleteNoteConfirm => 'Bạn có chắc muốn xóa ghi chú này?';

  @override
  String get noteTitle => 'Tiêu đề';

  @override
  String get noteContent => 'Nội dung';

  @override
  String get addItem => 'Thêm mục';

  @override
  String get pinNote => 'Ghim';

  @override
  String get unpinNote => 'Bỏ ghim';

  @override
  String get noteColor => 'Màu';

  @override
  String get notePassword => 'Mật khẩu';

  @override
  String get setPassword => 'Đặt mật khẩu';

  @override
  String get changePassword => 'Đổi mật khẩu';

  @override
  String get removePassword => 'Xóa mật khẩu';

  @override
  String get enterPassword => 'Nhập mật khẩu';

  @override
  String get confirmPassword => 'Xác nhận mật khẩu';

  @override
  String get passwordPin => 'Mã PIN';

  @override
  String get passwordText => 'Mật khẩu văn bản';

  @override
  String get protectedNote => 'Ghi chú được bảo vệ';

  @override
  String get incorrectPassword => 'Mật khẩu không đúng';

  @override
  String get passwordSet => 'Đã đặt mật khẩu';

  @override
  String get passwordRemoved => 'Đã xóa mật khẩu';

  @override
  String get notesBiometric => 'Face ID cho ghi chú';

  @override
  String get notesBiometricSubtitle =>
      'Yêu cầu xác thực sinh trắc học để mở ghi chú được bảo vệ';

  @override
  String get textNote => 'Ghi chú văn bản';

  @override
  String get checklistNote => 'Danh sách kiểm tra';

  @override
  String tasksProgress(int checked, int total) {
    return '$checked/$total công việc';
  }

  @override
  String get autoSaved => 'Đã lưu';

  @override
  String get searchNotes => 'Tìm ghi chú';

  @override
  String get legalConsent => 'Đồng ý pháp lý';

  @override
  String get confirmAge13 => 'Tôi xác nhận ít nhất 13 tuổi';

  @override
  String get acceptLegalStart => 'Tôi chấp nhận ';

  @override
  String get privacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get termsOfService => 'Điều khoản dịch vụ';

  @override
  String get andThe => ' và ';

  @override
  String get continueButton => 'Tiếp tục';

  @override
  String get mustAcceptTerms =>
      'Bạn phải chấp nhận cả hai điều kiện để tiếp tục';

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
  String get support => 'Hỗ trợ';

  @override
  String get contactSupport => 'Liên hệ hỗ trợ';

  @override
  String get contactSupportSubtitle => 'hash-support@devolim.fr';

  @override
  String get reportAbuse => 'Báo cáo lạm dụng';

  @override
  String get reportAbuseSubtitle => 'hash-abuse@devolim.fr';

  @override
  String get legal => 'Pháp lý';

  @override
  String get legalEntity => 'Pháp nhân';

  @override
  String get legalEntityValue => 'DEVOLIM — SIREN 948 000 757';

  @override
  String get pinConversation => 'Ghim';

  @override
  String get unpinConversation => 'Bỏ ghim';

  @override
  String get hideConversation => 'Xóa khỏi bảng tin';

  @override
  String get deleteConversation => 'Xóa cuộc trò chuyện';

  @override
  String get deleteConversationConfirm =>
      'Nhập PIN để xác nhận xóa tất cả tin nhắn';

  @override
  String get noConversations => 'Chưa có cuộc trò chuyện';

  @override
  String get startConversation => 'Bắt đầu';

  @override
  String get microphonePermissionRequired => 'Cần quyền truy cập micro';

  @override
  String get microphonePermissionExplanation =>
      'Hash cần micro để thực hiện cuộc gọi.';

  @override
  String get cameraPermissionExplanation =>
      'Hash cần camera cho cuộc gọi video.';

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
  String get openSettings => 'Mở cài đặt';

  @override
  String get callConnecting => 'Đang kết nối...';

  @override
  String get callRinging => 'Đang đổ chuông...';

  @override
  String get callReconnecting => 'Đang kết nối lại...';

  @override
  String callReconnectingTimer(int seconds) {
    return 'Đang kết nối lại (${seconds}s)';
  }

  @override
  String get callPaused => 'Tạm dừng';

  @override
  String get callPausedSubtitle => 'Cuộc gọi vẫn đang diễn ra';

  @override
  String get callRemoteMicMuted => 'Micro liên hệ đã tắt';

  @override
  String get callMiniControlsMute => 'Tắt tiếng';

  @override
  String get callMiniControlsUnmute => 'Bật tiếng';

  @override
  String get callMiniControlsHangUp => 'Cúp máy';

  @override
  String get callMiniControlsReturn => 'Quay lại cuộc gọi';

  @override
  String get callNetworkPoor => 'Kết nối không ổn định';

  @override
  String get callNetworkLost => 'Mất kết nối';

  @override
  String get callEndedTitle => 'Cuộc gọi kết thúc';

  @override
  String get deviceDataTitle => 'Mes données';

  @override
  String get deviceData => 'Dữ liệu thiết bị';

  @override
  String get deviceDataSubtitle => 'Lưu trữ cục bộ và máy chủ';

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
  String get localStorage => 'Lưu trữ cục bộ';

  @override
  String get onThisDevice => 'trên thiết bị này';

  @override
  String get encryptedDatabases => 'Cơ sở dữ liệu mã hóa';

  @override
  String get files => 'Tệp';

  @override
  String get secureKeychain => 'Chuỗi khóa bảo mật';

  @override
  String get cache => 'Bộ nhớ đệm';

  @override
  String get contactsDetail => 'Tên, ảnh đại diện, khóa Signal';

  @override
  String get messagesDetail => 'Cuộc trò chuyện mã hóa';

  @override
  String get notesDetail => 'Ghi chú cá nhân';

  @override
  String get signalSessions => 'Phiên Signal';

  @override
  String get signalSessionsDetail => 'Phiên mã hóa';

  @override
  String get pendingContacts => 'Liên hệ đang chờ';

  @override
  String get pendingContactsDetail => 'Yêu cầu đang chờ';

  @override
  String get callHistory => 'Cuộc gọi';

  @override
  String get callHistoryDetail => 'Lịch sử cuộc gọi';

  @override
  String get preferences => 'Tùy chọn';

  @override
  String get preferencesDetail => 'Tùy chọn media và cuộc gọi';

  @override
  String get avatars => 'Ảnh đại diện';

  @override
  String get media => 'Media';

  @override
  String fileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tệp',
      one: '1 tệp',
      zero: 'không có tệp',
    );
    return '$_temp0';
  }

  @override
  String get active => 'Hoạt động';

  @override
  String get notDefined => 'Chưa xác định';

  @override
  String get biometrics => 'Sinh trắc học';

  @override
  String get recoveryPhrase => 'Cụm từ khôi phục';

  @override
  String get identity => 'Danh tính (Hash ID)';

  @override
  String get signalKeys => 'Khóa Signal Protocol';

  @override
  String get authTokens => 'Token xác thực';

  @override
  String get contactNamesCache => 'Bộ nhớ đệm tên liên hệ';

  @override
  String get remoteConfig => 'Cấu hình từ xa';

  @override
  String get notificationPrefs => 'Tùy chọn thông báo';

  @override
  String get serverData => 'Dữ liệu máy chủ';

  @override
  String get serverDataInfo =>
      'Hash lưu ít dữ liệu nhất trên máy chủ, tất cả đều mã hóa hoặc tạm thời.';

  @override
  String get serverProfile => 'Hồ sơ';

  @override
  String get serverProfileDetail => 'Hash ID, khóa công khai, token hộp thư';

  @override
  String get serverPrekeys => 'Pre-key';

  @override
  String get serverPrekeysDetail => 'Khóa Signal dùng một lần (đã sử dụng)';

  @override
  String get serverMessages => 'Tin nhắn đang chuyển';

  @override
  String get serverMessagesDetail => 'Xóa sau khi giao (tối đa 24 giờ)';

  @override
  String get serverMedia => 'Media đang chuyển';

  @override
  String get serverMediaDetail => 'Xóa sau khi tải xuống';

  @override
  String get serverContactRequests => 'Yêu cầu liên hệ';

  @override
  String get serverContactRequestsDetail => 'Hết hạn sau 24 giờ';

  @override
  String get serverRateLimits => 'Giới hạn tốc độ';

  @override
  String get serverRateLimitsDetail => 'Dữ liệu chống lạm dụng tạm thời';

  @override
  String get privacyReassurance =>
      'Hash không thể đọc tin nhắn của bạn. Tất cả dữ liệu đều được mã hóa đầu cuối. Dữ liệu máy chủ tự động bị xóa.';

  @override
  String get pinTooSimple => 'Mã PIN quá đơn giản. Hãy chọn mã an toàn hơn.';

  @override
  String get genericError => 'Đã xảy ra lỗi. Vui lòng thử lại.';

  @override
  String get noInternetError =>
      'Pas de connexion internet. Vérifiez votre réseau et réessayez.';

  @override
  String accountCreationError(String error) {
    return 'Không thể tạo tài khoản: $error';
  }

  @override
  String get phraseCopiedToClipboard => 'Đã sao chép cụm từ vào clipboard';

  @override
  String get copyPhrase => 'Sao chép cụm từ';

  @override
  String get recoveryPhraseSecurityWarning =>
      'Ghi cụm từ này ở nơi an toàn. Nếu mất PIN mà không có cụm từ này, bạn sẽ mất vĩnh viễn quyền truy cập dữ liệu.';

  @override
  String get noMessages => 'Không có tin nhắn';

  @override
  String deleteAllMessagesWithContact(String name) {
    return 'Xóa tất cả tin nhắn với $name?';
  }

  @override
  String get confirmation => 'Xác nhận';

  @override
  String get untitled => 'Chưa đặt tên';

  @override
  String get noSessions => 'Không có phiên';

  @override
  String get unknownContact => 'Liên hệ không xác định';

  @override
  String get unnamed => 'Chưa đặt tên';

  @override
  String get noPendingRequestsAlt => 'Không có yêu cầu đang chờ';

  @override
  String get deleteAllCallHistory => 'Xóa toàn bộ lịch sử cuộc gọi?';

  @override
  String get noCalls => 'Không có cuộc gọi';

  @override
  String get noPreferences => 'Không có tùy chọn';

  @override
  String get resetAllMediaPrefs => 'Đặt lại tất cả tùy chọn media?';

  @override
  String get deleteThisAvatar => 'Xóa ảnh đại diện này?';

  @override
  String get deleteAllAvatars => 'Xóa tất cả ảnh đại diện?';

  @override
  String get noAvatars => 'Không có ảnh đại diện';

  @override
  String get deleteThisFile => 'Xóa tệp này?';

  @override
  String get deleteAllMediaFiles => 'Xóa tất cả media?';

  @override
  String get noMediaFiles => 'Không có media';

  @override
  String get outgoing => 'Gọi đi';

  @override
  String get incoming => 'Gọi đến';

  @override
  String ephemeralViewDuration(int seconds) {
    return 'Xem tự hủy: ${seconds}s';
  }

  @override
  String get normalView => 'Xem bình thường';

  @override
  String get callReasonCompleted => 'Hoàn thành';

  @override
  String get callReasonMissed => 'Nhỡ';

  @override
  String get callReasonDeclined => 'Từ chối';

  @override
  String get callReasonFailed => 'Thất bại';

  @override
  String get justNow => 'Vừa xong';

  @override
  String timeAgoMinutes(int count) {
    return '$count phút trước';
  }

  @override
  String timeAgoHours(int count) {
    return '$count giờ trước';
  }

  @override
  String timeAgoDays(int count) {
    return '$count ngày trước';
  }

  @override
  String get messageTypeContact => 'Liên hệ';

  @override
  String get messageTypeLocation => 'Vị trí';

  @override
  String get statusQueued => 'Đang chờ';

  @override
  String get blockedBadge => 'Đã chặn';

  @override
  String get protectedBadge => 'Được bảo vệ';

  @override
  String messageCount(int count) {
    return '$count tin nhắn';
  }

  @override
  String get deleteQuestion => 'Xóa?';

  @override
  String get transferMyAccountTitle => 'Chuyển tài khoản';

  @override
  String get loadingError => 'Lỗi khi tải';

  @override
  String get transferToNewDevice => 'Chuyển sang thiết bị mới';

  @override
  String get transferInstructions =>
      'Trên thiết bị mới, chọn \"Khôi phục tài khoản\" và nhập thông tin này:';

  @override
  String get yourHashIdLabel => 'Hash ID của bạn';

  @override
  String get enterYourPinCode => 'Nhập mã PIN';

  @override
  String get pinOwnerConfirmation => 'Để xác nhận bạn là chủ tài khoản';

  @override
  String get scanThisQrCode => 'Quét mã QR này';

  @override
  String get withYourNewDevice => 'Với thiết bị mới';

  @override
  String get orEnterTheCode => 'hoặc nhập mã';

  @override
  String get transferCodeLabel => 'Mã chuyển';

  @override
  String get proximityVerification => 'Xác minh khoảng cách';

  @override
  String get bringDevicesCloser => 'Đưa hai thiết bị lại gần nhau';

  @override
  String get confirmTransferQuestion => 'Xác nhận chuyển?';

  @override
  String get accountWillBeTransferred =>
      'Tài khoản sẽ được chuyển sang thiết bị mới.\n\nThiết bị này sẽ bị ngắt kết nối vĩnh viễn.';

  @override
  String get transferComplete => 'Chuyển hoàn tất';

  @override
  String get transferSuccessMessage =>
      'Tài khoản đã được chuyển thành công.\n\nỨng dụng này sẽ đóng.';

  @override
  String get manualVerification => 'Xác minh thủ công';

  @override
  String get codeDisplayedOnBothDevices => 'Mã hiển thị trên cả hai thiết bị:';

  @override
  String get doesCodeMatchNewDevice =>
      'Mã này có khớp với mã trên thiết bị mới không?';

  @override
  String get verifiedStatus => 'Đã xác minh';

  @override
  String get inProgressStatus => 'Đang xử lý...';

  @override
  String get notAvailableStatus => 'Không khả dụng';

  @override
  String get codeExpiredRestart => 'Mã đã hết hạn. Vui lòng bắt đầu lại.';

  @override
  String get codesDoNotMatchCancelled => 'Mã không khớp. Đã hủy chuyển.';

  @override
  String transferToDevice(String device) {
    return 'Đến: $device';
  }

  @override
  String get copiedExclamation => 'Đã sao chép!';

  @override
  String expiresInTime(String time) {
    return 'Hết hạn sau $time';
  }

  @override
  String get biometricNotAvailable => 'Thiết bị này không hỗ trợ sinh trắc học';

  @override
  String get biometricAuthError => 'Lỗi xác thực sinh trắc học';

  @override
  String get authenticateForBiometric =>
      'Vui lòng xác thực để bật sinh trắc học';

  @override
  String get biometricAuthFailed => 'Xác thực sinh trắc học thất bại';

  @override
  String get forceUpdateTitle => 'Cần cập nhật';

  @override
  String get forceUpdateMessage =>
      'Có phiên bản Hash mới. Vui lòng cập nhật để tiếp tục.';

  @override
  String get updateButton => 'Cập nhật';

  @override
  String get maintenanceInProgress => 'Đang bảo trì';

  @override
  String get tryAgainLater => 'Vui lòng thử lại sau';

  @override
  String get information => 'Thông tin';

  @override
  String get later => 'Để sau';

  @override
  String get doYouLikeHash => 'Bạn thích Hash không?';

  @override
  String get yourFeedbackHelps => 'Phản hồi của bạn giúp cải thiện ứng dụng';

  @override
  String get ratingTerrible => 'Tệ';

  @override
  String get ratingBad => 'Kém';

  @override
  String get ratingOk => 'Tạm được';

  @override
  String get ratingGood => 'Tốt';

  @override
  String get ratingExcellent => 'Xuất sắc!';

  @override
  String get donationMessage =>
      'Hash là dự án phi lợi nhuận. Sự hỗ trợ của bạn giúp chúng tôi tiếp tục xây dựng ứng dụng nhắn tin thực sự riêng tư.';

  @override
  String get recentConnections => 'Kết nối gần đây';

  @override
  String get loginInfoText =>
      'Mỗi lần mở khóa bằng PIN đều được ghi lại cục bộ. Chỉ giữ 24 giờ gần nhất.';

  @override
  String get connectionCount => 'Kết nối';

  @override
  String get periodLabel => 'Khoảng thời gian';

  @override
  String get historyLabel => 'Lịch sử';

  @override
  String get noLoginRecorded => 'Không có đăng nhập nào';

  @override
  String get nextUnlocksAppearHere =>
      'Các lần mở khóa tiếp theo sẽ hiện ở đây.';

  @override
  String get dataLocalOnly =>
      'Dữ liệu này chỉ lưu trên thiết bị và không bao giờ được truyền đi.';

  @override
  String get currentSession => 'Hiện tại';

  @override
  String get todayLabel => 'Hôm nay';

  @override
  String get yesterdayLabel => 'Hôm qua';

  @override
  String get justNowLabel => 'Vừa xong';

  @override
  String minutesAgoLabel(int count) {
    return '$count phút trước';
  }

  @override
  String hoursAgoLabel(int hours) {
    return '$hours giờ trước';
  }

  @override
  String hoursMinutesAgoLabel(int hours, int minutes) {
    return '${hours}g ${minutes}ph trước';
  }

  @override
  String get noMaintenancePlanned => 'Không có bảo trì nào được lên kế hoạch';

  @override
  String get everythingWorkingNormally => 'Mọi thứ hoạt động bình thường';

  @override
  String get maintenanceTitle => 'Bảo trì';

  @override
  String get maintenanceActiveLabel => 'ĐANG TIẾN HÀNH';

  @override
  String get maintenancePlannedLabel => 'ĐÃ LÊN KẾ HOẠCH';

  @override
  String get locking => 'Đang khóa...';

  @override
  String get newMessageNotification => 'Tin nhắn mới';

  @override
  String get secExplainTitle => 'Hash bảo vệ bạn như thế nào';

  @override
  String get secExplainIntro =>
      'Hash được thiết kế để không ai có thể đọc tin nhắn của bạn.';

  @override
  String get secExplainIntroSub =>
      'Kể cả chúng tôi.\nĐây là cách nó hoạt động, giải thích đơn giản.';

  @override
  String get secJourneyLabel => 'HÀNH TRÌNH';

  @override
  String get secJourneyTitle => 'Hành trình của tin nhắn';

  @override
  String get secJourneySubtitle =>
      'Từ ngón tay bạn đến màn hình liên hệ, mỗi bước đều được bảo vệ. Theo dõi con đường.';

  @override
  String get secStep1Title => 'Bạn viết tin nhắn';

  @override
  String get secStep1Desc =>
      'Bạn gõ \"Xin chào!\" trong ứng dụng. Lúc này, tin nhắn chỉ tồn tại trong bộ nhớ điện thoại. Chưa gửi đi.';

  @override
  String get secStep2Title => 'Mã hóa với Signal Protocol';

  @override
  String get secStep2Desc =>
      'Ngay khi nhấn \"Gửi\", tin nhắn được biến thành chuỗi ký tự không thể hiểu. Giống như tin nhắn bị khóa trong két sắt mà chỉ liên hệ của bạn mới có chìa khóa.';

  @override
  String get secStep3Title => 'Sealed Sender: phong bì vô hình';

  @override
  String get secStep3Desc =>
      'Hãy tưởng tượng gửi thư mà không có địa chỉ người gửi trên phong bì. Đó chính xác là điều Hash làm. Tin nhắn được bỏ vào hòm thư ẩn danh. Máy chủ không biết ai gửi.';

  @override
  String get secStep4Title => 'Máy chủ không thấy gì';

  @override
  String get secStep4Desc =>
      'Máy chủ đóng vai người đưa thư mù. Nó chỉ biết \"ai đó bỏ thứ gì vào hòm #A7X9\". Không biết ai gửi, gửi gì, hay gửi cho ai.';

  @override
  String get secStep4Highlight =>
      'Không lưu metadata: không IP, không dấu thời gian, không liên kết giữa người gửi và người nhận.';

  @override
  String get secStep5Title => 'Liên hệ nhận tin nhắn';

  @override
  String get secStep5Desc =>
      'Điện thoại liên hệ lấy nội dung từ hòm thư ẩn danh và giải mã bằng khóa riêng chưa bao giờ rời thiết bị. \"Xin chào!\" hiện trên màn hình.';

  @override
  String get secStep6Title => 'Tin nhắn biến mất khỏi máy chủ';

  @override
  String get secStep6Desc =>
      'Ngay khi liên hệ xác nhận đã nhận, máy chủ xóa vĩnh viễn tin nhắn. Không thùng rác, không lưu trữ, không sao lưu. Tin nhắn chưa đọc cũng tự hủy sau 24 giờ.';

  @override
  String get secStep7Title => 'Hết hạn cục bộ';

  @override
  String get secStep7Desc =>
      'Trên điện thoại liên hệ, tin nhắn tự hủy theo thời gian bạn chọn: ngay sau khi đọc, 5 phút, 1 giờ... bạn quyết định.';

  @override
  String get secJourneyConclusion =>
      'Kết quả: không dấu vết trên máy chủ, không dấu vết trên thiết bị. Tin nhắn chỉ tồn tại đủ lâu để được đọc, rồi biến mất.';

  @override
  String get secArchLabel => 'KIẾN TRÚC';

  @override
  String get secArchTitle => '5 lớp bảo vệ';

  @override
  String get secArchSubtitle =>
      'Hash không dựa vào một công nghệ duy nhất. Mỗi lớp củng cố các lớp khác. Ngay cả khi một lớp bị xâm phạm, dữ liệu vẫn an toàn.';

  @override
  String get secLayer1Title => 'Mã hóa đầu cuối';

  @override
  String get secLayer1Desc =>
      'Mỗi tin nhắn được mã hóa bằng khóa duy nhất. Đơn giản: ngay cả khi giải mã một tin nhắn, cũng không thể giải mã tin tiếp theo. Mỗi tin nhắn có ổ khóa riêng.';

  @override
  String get secLayer1Detail =>
      'Đối với tệp (ảnh, video, tài liệu), Hash sử dụng thêm mã hóa AES-256-GCM. Tệp được mã hóa trước khi rời điện thoại.';

  @override
  String get secLayer2Title => 'Sealed Sender (ẩn danh mạng)';

  @override
  String get secLayer2Desc =>
      'Ứng dụng nhắn tin thông thường gửi tin kèm danh tính. Giống viết tên trên phong bì. Hash dùng hòm thư ẩn danh: máy chủ giao tin mà không biết ai gửi.';

  @override
  String get secLayer2Detail =>
      'Kết quả: ngay cả khi dữ liệu máy chủ bị rò rỉ, không thể tái tạo ai nói chuyện với ai.';

  @override
  String get secLayer3Title => 'Tự động xóa';

  @override
  String get secLayer3Desc =>
      'Tin nhắn bị xóa khỏi máy chủ ngay khi xác nhận đã nhận. Ngay cả tin chưa được lấy cũng tự hủy sau 24 giờ.';

  @override
  String get secLayer3Detail =>
      'Trên điện thoại, tin nhắn tự hủy theo thời gian bạn chọn: ngay lập tức, 5 phút, 15 phút, 30 phút, 1g, 3g, 6g, hoặc 12g.';

  @override
  String get secLayer4Title => 'Bảo vệ truy cập cục bộ';

  @override
  String get secLayer4Desc =>
      'Ứng dụng được bảo vệ bằng PIN 6 chữ số và/hoặc sinh trắc học (Face ID, vân tay). Sau quá nhiều lần thử sai, ứng dụng khóa với thời gian chờ tăng dần.';

  @override
  String get secLayer5Title => 'Cơ sở dữ liệu bị khóa';

  @override
  String get secLayer5Desc =>
      'Phía máy chủ, không người dùng nào có thể ghi trực tiếp vào cơ sở dữ liệu. Mọi hành động đi qua các hàm bảo mật kiểm tra từng yêu cầu.';

  @override
  String get secLayer5Detail =>
      'Giống quầy ngân hàng: bạn không bao giờ chạm vào két. Bạn gửi yêu cầu, hệ thống kiểm tra quyền trước khi thực hiện.';

  @override
  String get secVashLabel => 'DUY NHẤT TRÊN THẾ GIỚI';

  @override
  String get secVashTitle => 'Chế độ Vash';

  @override
  String get secVashSubtitle =>
      'Hệ thống bảo mật khẩn cấp không tồn tại trong bất kỳ ứng dụng nhắn tin nào khác.';

  @override
  String get secVashScenarioTitle => 'Hãy tưởng tượng tình huống này';

  @override
  String get secVashScenario1 => 'Ai đó truy cập điện thoại của bạn';

  @override
  String get secVashScenario2 => 'Bị yêu cầu mã PIN';

  @override
  String get secVashScenario3 => 'Bạn muốn xóa tất cả dữ liệu khẩn cấp';

  @override
  String get secVashSolutionTitle => 'Giải pháp: hai mã PIN';

  @override
  String get secVashSolutionDesc =>
      'Bạn cấu hình hai mã PIN khác nhau trong Hash:';

  @override
  String get secVashNormalCodeLabel => 'Mã bình thường';

  @override
  String get secVashNormalCodeDesc =>
      'Mở ứng dụng bình thường với tất cả dữ liệu';

  @override
  String get secVashCodeLabel2 => 'Mã Vash';

  @override
  String get secVashCodeDescription =>
      'Mở ứng dụng bình thường... nhưng tất cả dữ liệu bị xóa im lặng trong nền';

  @override
  String get secVashWhatHappensTitle => 'Điều gì xảy ra tiếp';

  @override
  String get secVashWhatHappensDesc =>
      'Ứng dụng mở bình thường. Không cảnh báo, không hoạt ảnh đáng ngờ. Màn hình đơn giản hiển thị ứng dụng trống, như vừa cài đặt.\n\nThực tế, tất cả cuộc trò chuyện, danh bạ và tin nhắn đã bị xóa vĩnh viễn trong tích tắc.';

  @override
  String get secCallsLabel => 'CUỘC GỌI & TỆP';

  @override
  String get secCallsTitle => 'Mọi thứ đều mã hóa';

  @override
  String get secCallsSubtitle =>
      'Không chỉ tin nhắn. Tất cả mọi thứ đi qua Hash đều được mã hóa đầu cuối.';

  @override
  String get secAudioCallTitle => 'Cuộc gọi thoại';

  @override
  String get secAudioCallDesc =>
      'Mã hóa đầu cuối qua WebRTC. Giọng nói truyền trực tiếp giữa các thiết bị.';

  @override
  String get secVideoCallTitle => 'Cuộc gọi video';

  @override
  String get secVideoCallDesc => 'Cùng công nghệ, mỗi luồng mã hóa riêng biệt.';

  @override
  String get secPhotosTitle => 'Ảnh & video';

  @override
  String get secPhotosDesc => 'Mã hóa AES-256-GCM trước khi rời điện thoại.';

  @override
  String get secDocsTitle => 'Tài liệu';

  @override
  String get secDocsDesc =>
      'PDF, ZIP, bất kỳ tệp nào. Tên, kích thước và nội dung đều mã hóa.';

  @override
  String get secAnonLabel => 'ẨN DANH';

  @override
  String get secAnonTitle => 'Không cần danh tính';

  @override
  String get secAnonSubtitle =>
      'Hash không bao giờ hỏi số điện thoại hay email. Bạn được nhận dạng bằng Hash ID duy nhất và ẩn danh.';

  @override
  String get secHashIdTitle => 'Hash ID của bạn';

  @override
  String get secHashIdDesc =>
      'Đây là mã định danh duy nhất. Nó không tiết lộ gì về bạn: không tên, không số, không vị trí. Giống bí danh không thể liên kết với danh tính thật.\n\nĐể thêm liên hệ, chia sẻ Hash ID hoặc quét mã QR. Vậy thôi. Không đồng bộ danh bạ, không gợi ý \"Những người bạn có thể biết\".';

  @override
  String get secDataLabel => 'DỮ LIỆU';

  @override
  String get secDataTitle => 'Những gì Hash không biết';

  @override
  String get secDataSubtitle =>
      'Cách tốt nhất để bảo vệ dữ liệu là không thu thập nó.';

  @override
  String get secNeverCollected => 'Không bao giờ thu thập';

  @override
  String get secNeverItem1 => 'Nội dung tin nhắn';

  @override
  String get secNeverItem2 => 'Danh sách liên hệ';

  @override
  String get secNeverItem3 => 'Số điện thoại';

  @override
  String get secNeverItem4 => 'Địa chỉ email';

  @override
  String get secNeverItem5 => 'Địa chỉ IP';

  @override
  String get secNeverItem6 => 'Vị trí';

  @override
  String get secNeverItem7 => 'Metadata (ai nói chuyện với ai)';

  @override
  String get secNeverItem8 => 'Lịch sử cuộc gọi';

  @override
  String get secNeverItem9 => 'Danh bạ điện thoại';

  @override
  String get secNeverItem10 => 'Mã quảng cáo';

  @override
  String get secTempStored => 'Lưu tạm thời';

  @override
  String get secTempItem1 => 'Hash ID ẩn danh (mã định danh duy nhất)';

  @override
  String get secTempItem2 => 'Khóa mã hóa công khai';

  @override
  String get secTempItem3 => 'Tin nhắn mã hóa đang chuyển (tối đa 24g)';

  @override
  String get secTempNote =>
      'Ngay cả dữ liệu tối thiểu này cũng không thể nhận dạng bạn. Hash ID không liên kết với bất kỳ thông tin cá nhân nào.';

  @override
  String get secFooterTitle => 'Quyền riêng tư, tự do của bạn';

  @override
  String get secFooterDesc =>
      'Hash sử dụng cùng công nghệ mã hóa với các ứng dụng chuyên nghiệp nghiêm ngặt nhất. Tin nhắn của bạn được bảo vệ bằng toán học, không phải lời hứa.';

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
