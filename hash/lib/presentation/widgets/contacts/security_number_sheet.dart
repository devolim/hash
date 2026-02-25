import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../common/hash_snack_bar.dart';

/// Security number verification sheet
/// Shows the security number derived from both parties' identity keys
class SecurityNumberSheet extends StatelessWidget {
  final Contact contact;
  final String myIdentityPublicKey;

  const SecurityNumberSheet({
    super.key,
    required this.contact,
    required this.myIdentityPublicKey,
  });

  static Future<void> show({
    required BuildContext context,
    required Contact contact,
    required String myIdentityPublicKey,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: SecurityNumberSheet(
          contact: contact,
          myIdentityPublicKey: myIdentityPublicKey,
        ),
      ),
    );
  }

  /// Generate security number from both identity keys
  String _generateSecurityNumber() {
    if (contact.identityPublicKey == null) {
      return '000000 000000 000000 000000 000000 000000';
    }

    // Combine both identity keys (sorted to ensure same result on both ends)
    final keys = [myIdentityPublicKey, contact.identityPublicKey!]..sort();
    final combined = keys.join('');

    // Hash the combined keys
    final hash = sha256.convert(utf8.encode(combined));
    final bytes = hash.bytes;

    // Convert to 12 groups of 5 digits (60 digits total)
    final buffer = StringBuffer();
    for (int i = 0; i < 12; i++) {
      if (i > 0 && i % 2 == 0) buffer.write('\n');
      if (i % 2 == 1) buffer.write(' ');

      // Take 2-3 bytes and convert to 5-digit number
      final startIdx = (i * 2) % bytes.length;
      final value = ((bytes[startIdx] << 8) | bytes[(startIdx + 1) % bytes.length]) % 100000;
      buffer.write(value.toString().padLeft(5, '0'));
    }

    return buffer.toString();
  }

  /// Get QR code data for scanning
  String _getQrData() {
    return jsonEncode({
      'type': 'security_verification',
      'hash_id': contact.hashId,
      'identity_key': myIdentityPublicKey,
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final securityNumber = _generateSecurityNumber();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.verified_user_outlined, color: AppColors.success),
                  const SizedBox(width: 8),
                  Text(
                    l10n.securityNumber,
                    style: AppTypography.headlineSmall(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  l10n.securityNumberDescription(contact.displayName),
                  style: AppTypography.bodySmall(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24),

              // QR Code
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: QrImageView(
                  data: _getQrData(),
                  version: QrVersions.auto,
                  size: 180,
                  backgroundColor: Colors.white,
                  errorCorrectionLevel: QrErrorCorrectLevel.M,
                ),
              ),

              const SizedBox(height: 24),

              // Security number display
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: securityNumber.replaceAll('\n', ' ')));
                  showHashSnackBar(context, message: l10n.copiedToClipboard, type: HashSnackBarType.success);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        securityNumber,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.copy,
                            size: 14,
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            l10n.tapToCopy,
                            style: AppTypography.labelSmall(
                              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Scan button - RIGHT BELOW THE NUMBERS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => _SecurityQrScannerScreen(
                            contact: contact,
                            myIdentityPublicKey: myIdentityPublicKey,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.qr_code_scanner, color: Colors.black),
                    label: Text(l10n.scanToVerify, style: const TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlassTheme.glassIconColor(isDark),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Verification instructions
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: GlassTheme.glassIconColor(isDark).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: GlassTheme.glassIconColor(isDark), size: 20),
                        const SizedBox(width: 8),
                        Text(
                          l10n.howToVerify,
                          style: AppTypography.labelLarge(color: GlassTheme.glassIconColor(isDark)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _VerificationStep(
                      number: '1',
                      text: l10n.verifyStep1,
                    ),
                    _VerificationStep(
                      number: '2',
                      text: l10n.verifyStep2,
                    ),
                    _VerificationStep(
                      number: '3',
                      text: l10n.verifyStep3,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _VerificationStep extends StatelessWidget {
  final String number;
  final String text;

  const _VerificationStep({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = GlassTheme.glassIconColor(isDark);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: accentColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodySmall(color: accentColor),
            ),
          ),
        ],
      ),
    );
  }
}

/// QR scanner for security number verification
class _SecurityQrScannerScreen extends StatefulWidget {
  final Contact contact;
  final String myIdentityPublicKey;

  const _SecurityQrScannerScreen({
    required this.contact,
    required this.myIdentityPublicKey,
  });

  @override
  State<_SecurityQrScannerScreen> createState() => _SecurityQrScannerScreenState();
}

class _SecurityQrScannerScreenState extends State<_SecurityQrScannerScreen> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );
  bool _isProcessing = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_isProcessing) return;

    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue;
      if (value == null) continue;

      try {
        final data = jsonDecode(value) as Map<String, dynamic>;
        if (data['type'] == 'security_verification') {
          _isProcessing = true;
          _verifyScannedData(data);
          return;
        }
      } catch (_) {
        // Not valid JSON — ignore
      }
    }
  }

  void _verifyScannedData(Map<String, dynamic> data) {
    final scannedHashId = data['hash_id'] as String?;
    final scannedIdentityKey = data['identity_key'] as String?;

    if (scannedHashId == null || scannedIdentityKey == null) {
      _showResult(false, 'QR code invalide');
      return;
    }

    // The scanned QR contains the OTHER person's hash_id and identity_key
    final expectedIdentityKey = widget.contact.identityPublicKey;

    if (expectedIdentityKey == null) {
      _showResult(false, 'Clé d\'identité du contact non disponible');
      return;
    }

    if (scannedIdentityKey == expectedIdentityKey &&
        scannedHashId.toUpperCase() == widget.contact.hashId.toUpperCase()) {
      _showResult(true, 'Vérifié ! Les clés correspondent.');
    } else {
      _showResult(false, 'Les clés ne correspondent PAS. La communication pourrait être compromise.');
    }
  }

  void _showResult(bool verified, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.darkSurface,
        icon: Icon(
          verified ? Icons.verified_user : Icons.warning_amber_rounded,
          color: verified ? AppColors.success : AppColors.error,
          size: 48,
        ),
        title: Text(
          verified ? 'Vérifié' : 'Non vérifié',
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(message, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Scanner le QR de sécurité',
          style: AppTypography.headlineSmall(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: MobileScanner(
        controller: _controller,
        onDetect: _onDetect,
      ),
    );
  }
}
