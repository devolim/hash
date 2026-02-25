import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../../domain/models/contact.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../widgets/common/avatar.dart';

/// Security number verification screen
class SecurityNumberScreen extends StatefulWidget {
  final Contact contact;
  final String myIdentityPublicKey;

  const SecurityNumberScreen({
    super.key,
    required this.contact,
    required this.myIdentityPublicKey,
  });

  @override
  State<SecurityNumberScreen> createState() => _SecurityNumberScreenState();
}

class _SecurityNumberScreenState extends State<SecurityNumberScreen> {
  /// Generate security number from both identity keys
  String _generateSecurityNumber() {
    if (widget.contact.identityPublicKey == null) {
      return '00000 00000 00000 00000\n00000 00000 00000 00000\n00000 00000 00000 00000';
    }

    final keys = [widget.myIdentityPublicKey, widget.contact.identityPublicKey!]
      ..sort();
    final combined = keys.join('');
    final hash = sha256.convert(utf8.encode(combined));
    final bytes = hash.bytes;

    final buffer = StringBuffer();
    for (int i = 0; i < 12; i++) {
      if (i > 0 && i % 4 == 0) buffer.write('\n');
      if (i % 4 != 0) buffer.write(' ');

      final startIdx = (i * 2) % bytes.length;
      final value =
          ((bytes[startIdx] << 8) | bytes[(startIdx + 1) % bytes.length]) %
              100000;
      buffer.write(value.toString().padLeft(5, '0'));
    }

    return buffer.toString();
  }

  String _getQrData() {
    return jsonEncode({
      'type': 'security_verification',
      'hash_id': widget.contact.hashId,
      'identity_key': widget.myIdentityPublicKey,
    });
  }

  void _copySecurityNumber(String securityNumber) {
    HapticFeedback.mediumImpact();
    Clipboard.setData(
        ClipboardData(text: securityNumber.replaceAll('\n', ' ')));
    showHashSnackBar(context, message: 'Numéro copié', type: HashSnackBarType.success);
  }

  void _scanQrCode() {
    HapticFeedback.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _SecurityVerificationScanner(
          contact: widget.contact,
          myIdentityPublicKey: widget.myIdentityPublicKey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final securityNumber = _generateSecurityNumber();

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: GlassTheme.glassIconColor(isDark),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.securityNumber,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, MediaQuery.of(context).padding.top + kToolbarHeight + 24, 24, 0),
        child: Column(
          children: [
            const SizedBox(height: 8),

            // Contact info card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.accentPrimary.withValues(alpha: 0.15),
                    AppColors.accentPrimary.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.accentPrimary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  HashAvatar(
                    initials: widget.contact.initials,
                    imagePath: widget.contact.avatarPath,
                    colorSeed: widget.contact.displayName,
                    size: 50,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.contact.displayName,
                          style: AppTypography.labelLarge(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.lock_outline,
                              size: 14,
                              color: AppColors.accentPrimary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Chiffrement de bout en bout',
                              style: AppTypography.bodySmall(
                                color: AppColors.accentPrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn().slideY(begin: 0.1, end: 0),

            const SizedBox(height: 24),

            // How to verify section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.accentPrimary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.help_outline,
                          color: AppColors.accentPrimary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        l10n.howToVerify,
                        style: AppTypography.labelLarge(
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _StepItem(
                    number: '1',
                    text: l10n.verifyStep1,
                    isDark: isDark,
                  ),
                  _StepItem(
                    number: '2',
                    text: l10n.verifyStep2,
                    isDark: isDark,
                  ),
                  _StepItem(
                    number: '3',
                    text: l10n.verifyStep3,
                    isDark: isDark,
                    isLast: true,
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0),

            const SizedBox(height: 24),

            // QR Code section with scan button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                  width: 0.5,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'QR Code',
                    style: AppTypography.labelLarge(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Scannez ou faites scanner ce code',
                    style: AppTypography.bodySmall(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: QrImageView(
                      data: _getQrData(),
                      version: QrVersions.auto,
                      size: 160,
                      backgroundColor: Colors.white,
                      errorCorrectionLevel: QrErrorCorrectLevel.M,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _scanQrCode,
                      icon: const Icon(Icons.qr_code_scanner, color: Colors.black),
                      label: const Text(
                        'Scanner un QR Code',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),

            const SizedBox(height: 24),

            // Security number section
            GestureDetector(
              onTap: () => _copySecurityNumber(securityNumber),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04),
                    width: 0.5,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.tag,
                          size: 18,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Numéro de sécurité',
                          style: AppTypography.labelLarge(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Comparez ce numéro avec votre contact',
                      style: AppTypography.bodySmall(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkBackground
                            : AppColors.lightBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        securityNumber,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          height: 1.6,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.copy_rounded,
                          size: 14,
                          color: AppColors.accentPrimary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Appuyez pour copier',
                          style: AppTypography.bodySmall(
                            color: AppColors.accentPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final String number;
  final String text;
  final bool isDark;
  final bool isLast;

  const _StepItem({
    required this.number,
    required this.text,
    required this.isDark,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: AppColors.accentPrimary,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                text,
                style: AppTypography.bodySmall(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// QR scanner for security verification
class _SecurityVerificationScanner extends StatefulWidget {
  final Contact contact;
  final String myIdentityPublicKey;

  const _SecurityVerificationScanner({
    required this.contact,
    required this.myIdentityPublicKey,
  });

  @override
  State<_SecurityVerificationScanner> createState() =>
      _SecurityVerificationScannerState();
}

class _SecurityVerificationScannerState
    extends State<_SecurityVerificationScanner> {
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
        // Not valid JSON
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

    final expectedIdentityKey = widget.contact.identityPublicKey;
    if (expectedIdentityKey == null) {
      _showResult(false, 'Clé d\'identité du contact non disponible');
      return;
    }

    if (scannedIdentityKey == expectedIdentityKey &&
        scannedHashId.toUpperCase() == widget.contact.hashId.toUpperCase()) {
      _showResult(true, 'Vérifié ! Les clés correspondent.');
    } else {
      _showResult(false,
          'Les clés ne correspondent PAS. La communication pourrait être compromise.');
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
