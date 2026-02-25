import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../providers/app_providers.dart';
import '../../widgets/common/hash_snack_bar.dart';

class QrScannerScreen extends ConsumerStatefulWidget {
  const QrScannerScreen({super.key});

  @override
  ConsumerState<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends ConsumerState<QrScannerScreen>
    with SingleTickerProviderStateMixin {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
    torchEnabled: false,
  );
  bool _isProcessing = false;
  Offset? _focusPoint;
  late AnimationController _focusAnimationController;
  DateTime? _lastErrorTime;
  String? _lastInvalidValue;

  @override
  void initState() {
    super.initState();
    // Lock orientation to portrait for camera
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _focusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    // Restore all orientations when leaving
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _controller.dispose();
    _focusAnimationController.dispose();
    super.dispose();
  }

  void _onTapToFocus(TapDownDetails details) {
    final size = MediaQuery.of(context).size;
    final offset = Offset(
      details.localPosition.dx / size.width,
      details.localPosition.dy / size.height,
    );
    _controller.setFocusPoint(offset);

    setState(() {
      _focusPoint = details.localPosition;
    });
    _focusAnimationController.forward(from: 0);

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _focusPoint = null;
        });
      }
    });
  }

  void _onDetect(BarcodeCapture capture) {
    // Guard against multiple detections - check and set SYNCHRONOUSLY
    if (_isProcessing) return;
    _isProcessing = true; // Set immediately without setState for synchronous guard

    final barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      final value = barcode.rawValue;
      if (value != null) {
        if (value.startsWith('hash://')) {
          setState(() {}); // Trigger rebuild to show loading
          _processQrCode(value);
          return; // Exit immediately after finding valid QR
        } else {
          // Non-hash QR code detected - show error with debounce
          _isProcessing = false; // Reset for non-hash codes
          _showInvalidQrError(value);
          return;
        }
      }
    }
    // No valid barcode found
    _isProcessing = false;
  }

  void _showInvalidQrError(String value) {
    // Debounce: don't show error if same value or within 3 seconds
    final now = DateTime.now();
    if (_lastInvalidValue == value ||
        (_lastErrorTime != null &&
            now.difference(_lastErrorTime!).inSeconds < 3)) {
      return;
    }

    _lastInvalidValue = value;
    _lastErrorTime = now;

    final l10n = AppLocalizations.of(context)!;
    showHashSnackBar(context, message: l10n.invalidQrCode, type: HashSnackBarType.error);
  }

  Future<void> _processQrCode(String value) async {
    final l10n = AppLocalizations.of(context)!;

    // Format: hash://[hash_id]/[temporary_code]
    // Uri.parse treats hash_id as host, so we use uri.host and pathSegments[0]
    try {
      final uri = Uri.parse(value);
      final hashId = uri.host.toUpperCase(); // The hash ID is parsed as the host (lowercase), convert to uppercase
      final pathSegments = uri.pathSegments;

      if (hashId.isNotEmpty && pathSegments.isNotEmpty) {
        final code = pathSegments[0];

        // Check if user is trying to add themselves
        final user = ref.read(currentUserProvider);
        if (user != null && hashId.toUpperCase() == user.hashId.toUpperCase()) {
          setState(() => _isProcessing = false);
          showHashSnackBar(context, message: l10n.cannotAddYourself, type: HashSnackBarType.error);
          return;
        }

        // Validate the code and get recipient's public key
        try {
          final userRepo = ref.read(userRepositoryProvider);
          final response = await userRepo.validateContactCode(
            targetHashId: hashId,
            temporaryCode: code,
          );

          if (!mounted) return;

          // Extract the recipient's public keys and exchange token
          final recipient = response['recipient'] as Map<String, dynamic>?;
          final publicKey = recipient?['identity_public_key'] as String?;
          final sealedSenderPublicKey = recipient?['sealed_sender_public_key'] as String?;
          final exchangeToken = response['exchange_token'] as String?;

          if (publicKey == null || exchangeToken == null) {
            throw Exception('No public key or exchange token received');
          }

          // Stop the camera before navigating to prevent further detections
          _controller.stop();

          // Navigate to SendRequestScreen and wait for return
          if (!mounted) return;
          await context.push(
            AppRoutes.sendRequest,
            extra: {
              'hashId': hashId,
              'exchangeToken': exchangeToken,
              'recipientPublicKey': publicKey,
              'recipientSealedSenderPublicKey': sealedSenderPublicKey,
            },
          );

          // User came back from SendRequestScreen - restart scanner
          if (mounted) {
            _isProcessing = false;
            _controller.start();
          }
        } catch (e) {
          setState(() => _isProcessing = false);

          String errorMessage = l10n.error;
          final errorString = e.toString().toLowerCase();
          if (errorString.contains('non trouvé') || errorString.contains('not found')) {
            errorMessage = l10n.userNotFound;
          } else if (errorString.contains('invalide') || errorString.contains('invalid') || errorString.contains('expiré') || errorString.contains('expired')) {
            errorMessage = l10n.invalidOrExpiredCode;
          } else if (errorString.contains('rate') || errorString.contains('trop')) {
            errorMessage = l10n.tooManyAttempts;
          } else if (errorString.contains('déjà en attente') || errorString.contains('already pending')) {
            errorMessage = l10n.requestAlreadyPending;
          } else if (errorString.contains('déjà envoyé') || errorString.contains('already sent')) {
            errorMessage = l10n.theyAlreadySentYouRequest;
          }

          showHashSnackBar(context, message: errorMessage, type: HashSnackBarType.error);
        }
      } else {
        throw Exception('Invalid QR format');
      }
    } catch (e) {
      setState(() => _isProcessing = false);
      _showInvalidQrError(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, state, child) {
                return Icon(
                  state.torchState == TorchState.on
                      ? Icons.flash_on
                      : Icons.flash_off,
                  color: Colors.white,
                );
              },
            ),
            onPressed: () => _controller.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
            onPressed: () => _controller.switchCamera(),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Camera preview with tap-to-focus
          GestureDetector(
            onTapDown: _onTapToFocus,
            child: MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
            ),
          ),

          // Overlay
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
            ),
            child: Stack(
              children: [
                // Scan area (transparent)
                Center(
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.accentPrimary,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),

                // Cut out the scan area from the overlay
                ClipPath(
                  clipper: _ScannerOverlayClipper(),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),

          // Corner decorations
          Center(
            child: SizedBox(
              width: 280,
              height: 280,
              child: Stack(
                children: [
                  // Top left corner
                  Positioned(
                    top: -2,
                    left: -2,
                    child: _CornerDecoration(),
                  ),
                  // Top right corner
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Transform.rotate(
                      angle: 1.5708,
                      child: _CornerDecoration(),
                    ),
                  ),
                  // Bottom left corner
                  Positioned(
                    bottom: -2,
                    left: -2,
                    child: Transform.rotate(
                      angle: -1.5708,
                      child: _CornerDecoration(),
                    ),
                  ),
                  // Bottom right corner
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Transform.rotate(
                      angle: 3.1416,
                      child: _CornerDecoration(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Instructions
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Column(
              children: [
                Text(
                  l10n.scanQrCode,
                  style: AppTypography.headlineSmall(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.scanQrCodeSubtitle,
                  style: AppTypography.bodyMedium(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Focus indicator
          if (_focusPoint != null)
            Positioned(
              left: _focusPoint!.dx - 30,
              top: _focusPoint!.dy - 30,
              child: AnimatedBuilder(
                animation: _focusAnimationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.5 - (_focusAnimationController.value * 0.5),
                    child: Opacity(
                      opacity: 1.0 - (_focusAnimationController.value * 0.3),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.accentPrimary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          // Loading indicator
          if (_isProcessing)
            Container(
              color: Colors.black.withValues(alpha: 0.7),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CornerDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CustomPaint(
        painter: _CornerPainter(),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accentPrimary
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..lineTo(0, 8)
      ..quadraticBezierTo(0, 0, 8, 0)
      ..lineTo(size.width * 0.5, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScannerOverlayClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final scanArea = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 280,
      height: 280,
    );

    return Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(
        RRect.fromRectAndRadius(scanArea, const Radius.circular(24)),
      )
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
