import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact_request.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../common/hash_button.dart';
import '../common/hash_text_field.dart';

/// Bottom sheet for accepting a contact request
/// Allows the user to set a custom display name for the new contact
class AcceptRequestSheet extends StatefulWidget {
  final ContactRequest request;
  final void Function(String displayName, String? notes) onAccept;
  final VoidCallback onCancel;
  final bool isLoading;

  const AcceptRequestSheet({
    super.key,
    required this.request,
    required this.onAccept,
    required this.onCancel,
    this.isLoading = false,
  });

  @override
  State<AcceptRequestSheet> createState() => _AcceptRequestSheetState();

  /// Show the bottom sheet
  static Future<void> show({
    required BuildContext context,
    required ContactRequest request,
    required void Function(String displayName, String? notes) onAccept,
    VoidCallback? onCancel,
    bool isLoading = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: AcceptRequestSheet(
          request: request,
          onAccept: onAccept,
          onCancel: onCancel ?? () => Navigator.of(context).pop(),
          isLoading: isLoading,
        ),
      ),
    );
  }
}

class _AcceptRequestSheetState extends State<AcceptRequestSheet> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _buildDisplayName() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();

    if (firstName.isEmpty && lastName.isEmpty) {
      // Use Hash ID as display name
      return widget.request.requesterHashId;
    }

    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return '$firstName $lastName';
    }

    return firstName.isNotEmpty ? firstName : lastName;
  }

  void _handleAccept() {
    final displayName = _buildDisplayName();
    final notes = _notesController.text.trim();
    widget.onAccept(displayName, notes.isNotEmpty ? notes : null);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_add_outlined,
                size: 40,
                color: AppColors.success,
              ),
            ).animate().fadeIn().scale(),

            const SizedBox(height: 20),

            // Title
            Text(
              l10n.acceptContactTitle,
              style: AppTypography.headlineSmall(color: primaryColor),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 100.ms),

            const SizedBox(height: 8),

            // Hash ID
            Text(
              widget.request.requesterHashId,
              style: AppTypography.hashId(),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 150.ms),

            const SizedBox(height: 8),

            // Subtitle
            Text(
              l10n.acceptContactSubtitle,
              style: AppTypography.bodyMedium(color: secondaryColor),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms),

            const SizedBox(height: 24),

            // Stored locally indicator
            Row(
              children: [
                Icon(
                  Icons.phone_android,
                  size: 16,
                  color: secondaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.storedLocally,
                  style: AppTypography.bodySmall(color: secondaryColor),
                ),
              ],
            ).animate().fadeIn(delay: 250.ms),

            const SizedBox(height: 12),

            // First name field
            HashTextField(
              controller: _firstNameController,
              hintText: l10n.leaveEmptyForHashId,
              textCapitalization: TextCapitalization.words,
              enabled: !widget.isLoading,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
            ).animate().fadeIn(delay: 300.ms),

            const SizedBox(height: 16),

            // Last name field
            HashTextField(
              controller: _lastNameController,
              hintText: l10n.lastName,
              textCapitalization: TextCapitalization.words,
              enabled: !widget.isLoading,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
            ).animate().fadeIn(delay: 350.ms),

            const SizedBox(height: 16),

            // Notes field (optional)
            HashTextField(
              controller: _notesController,
              hintText: l10n.notesHint,
              maxLines: 2,
              enabled: !widget.isLoading,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2000),
              ],
            ).animate().fadeIn(delay: 400.ms),

            const SizedBox(height: 24),

            // Accept button
            HashButton(
              text: l10n.acceptRequest,
              onPressed: widget.isLoading ? null : _handleAccept,
              isLoading: widget.isLoading,
            ).animate().fadeIn(delay: 450.ms),

            const SizedBox(height: 12),

            // Cancel button
            HashButton(
              text: l10n.cancel,
              isOutlined: true,
              onPressed: widget.isLoading ? null : widget.onCancel,
            ).animate().fadeIn(delay: 500.ms),
          ],
        ),
      ),
    );
  }
}
