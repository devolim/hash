import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/message.dart';
import '../../../l10n/generated/app_localizations.dart';

/// Bottom sheet showing detailed message information
class MessageInfoSheet extends StatefulWidget {
  final Message message;

  const MessageInfoSheet({
    super.key,
    required this.message,
  });

  static Future<void> show({
    required BuildContext context,
    required Message message,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => MessageInfoSheet(message: message),
    );
  }

  @override
  State<MessageInfoSheet> createState() => _MessageInfoSheetState();
}

class _MessageInfoSheetState extends State<MessageInfoSheet> {
  Timer? _countdownTimer;
  late int _remainingSeconds;
  late final bool _hasCountdown;

  @override
  void initState() {
    super.initState();
    final msg = widget.message;
    if (msg.expiresAt != null) {
      _remainingSeconds = msg.expiresAt!.difference(DateTime.now()).inSeconds;
      if (_remainingSeconds < 0) _remainingSeconds = 0;
      _hasCountdown = true;
    } else if (msg.ephemeralRemainingSeconds != null) {
      _remainingSeconds = msg.ephemeralRemainingSeconds!;
      _hasCountdown = true;
    } else {
      _remainingSeconds = 0;
      _hasCountdown = false;
    }

    if (_hasCountdown && _remainingSeconds > 0) {
      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_remainingSeconds > 0) {
          setState(() => _remainingSeconds--);
        } else {
          _countdownTimer?.cancel();
        }
      });
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locale = Localizations.localeOf(context).toString();

    return GlassTheme.bottomSheetWrapper(
      isDark: isDark,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: GlassTheme.glassIconColor(isDark),
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    l10n.messageInfo,
                    style: AppTypography.headlineSmall(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Message info rows
            _InfoRow(
              icon: Icons.arrow_upward,
              label: l10n.messageDirection,
              value: message.isOutgoing ? l10n.messageSentByYou : l10n.messageReceived,
            ),

            _InfoRow(
              icon: Icons.schedule,
              label: message.isOutgoing ? l10n.messageSentAt : l10n.messageReceivedAt,
              value: _formatDateTime(message.timestamp, locale),
            ),

            _InfoRow(
              icon: Icons.local_shipping_outlined,
              label: l10n.messageStatus,
              value: _getStatusText(message.status, l10n),
              valueColor: _getStatusColor(message.status, isDark),
            ),

            // Server status (visible for both sender and receiver)
            _InfoRow(
              icon: _isOnServer(message) ? Icons.cloud_outlined : Icons.cloud_off_outlined,
              label: l10n.serverStatus,
              value: _isOnServer(message) ? l10n.onServer : l10n.deletedFromServer,
              valueColor: _isOnServer(message) ? GlassTheme.glassIconColor(isDark) : _getSuccessColor(isDark),
            ),

            if (message.isRead && message.readAt != null)
              _InfoRow(
                icon: Icons.visibility_outlined,
                label: l10n.messageReadAt,
                value: _formatDateTime(message.readAt!, locale),
              ),

            _InfoRow(
              icon: Icons.category_outlined,
              label: l10n.messageType,
              value: _getTypeText(message.type, l10n),
            ),

            if (message.type != MessageType.text && message.mediaSizeBytes != null)
              _InfoRow(
                icon: Icons.data_usage_outlined,
                label: l10n.messageSize,
                value: message.formattedSize,
              ),

            if (_hasCountdown)
              _InfoRow(
                icon: Icons.timer_outlined,
                label: l10n.messageDisappearsIn,
                value: _formatDuration(_remainingSeconds),
                valueColor: _remainingSeconds <= 0
                    ? AppColors.error
                    : GlassTheme.glassIconColor(isDark),
              ),

            // Encryption info
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getSuccessColor(isDark).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _getSuccessColor(isDark).withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.lock_outline, color: _getSuccessColor(isDark), size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.messageEncrypted,
                      style: AppTypography.bodySmall(color: _getSuccessColor(isDark)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime date, String locale) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat.yMd(locale);
    final timeFormat = DateFormat.Hm(locale);
    return '${dateFormat.format(localDate)} ${timeFormat.format(localDate)}';
  }

  String _formatDuration(int seconds) {
    if (seconds <= 0) return '0s';
    if (seconds < 60) return '${seconds}s';
    if (seconds < 3600) {
      final m = seconds ~/ 60;
      final s = seconds % 60;
      return s > 0 ? '${m}min ${s}s' : '${m}min';
    }
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    return m > 0 ? '${h}h ${m}min' : '${h}h';
  }

  String _getStatusText(MessageStatus status, AppLocalizations l10n) {
    switch (status) {
      case MessageStatus.sending:
        return l10n.messageStatusSending;
      case MessageStatus.sent:
        return l10n.messageStatusSent;
      case MessageStatus.delivered:
        return l10n.messageStatusDelivered;
      case MessageStatus.read:
        return l10n.messageStatusRead;
      case MessageStatus.failed:
        return l10n.messageStatusFailed;
      case MessageStatus.queued:
        return 'En attente';
    }
  }

  Color _getStatusColor(MessageStatus status, bool isDark) {
    switch (status) {
      case MessageStatus.sending:
        return AppColors.accentPrimary;
      case MessageStatus.sent:
        return isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
      case MessageStatus.delivered:
        return _getSuccessColor(isDark);
      case MessageStatus.read:
        return _getSuccessColor(isDark);
      case MessageStatus.failed:
        return AppColors.error;
      case MessageStatus.queued:
        return isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    }
  }

  /// Amber in light theme (green invisible on white), green in dark theme
  Color _getSuccessColor(bool isDark) {
    return isDark ? AppColors.success : AppColors.accentPrimary;
  }

  /// Check if message is still on server
  /// - Outgoing sending/sent: still on server waiting for delivery
  /// - Outgoing delivered/read: recipient acknowledged, server deleted
  /// - Incoming: message is in local store = acknowledgment was sent = server deleted it
  bool _isOnServer(Message message) {
    if (!message.isOutgoing) return false;
    return message.status == MessageStatus.sending || message.status == MessageStatus.sent;
  }

  String _getTypeText(MessageType type, AppLocalizations l10n) {
    switch (type) {
      case MessageType.text:
        return l10n.messageTypeText;
      case MessageType.image:
        return l10n.messageTypeImage;
      case MessageType.video:
        return l10n.messageTypeVideo;
      case MessageType.voice:
        return l10n.messageTypeVoice;
      case MessageType.file:
        return l10n.messageTypeFile;
      case MessageType.contact:
        return 'Contact';
      case MessageType.location:
        return 'Position';
      case MessageType.note:
        return 'Note';
      case MessageType.reaction:
        return 'Réaction';
      case MessageType.edit:
        return 'Modification';
      case MessageType.delete:
        return 'Suppression';
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: secondaryColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: AppTypography.bodyMedium(color: secondaryColor),
            ),
          ),
          Text(
            value,
            style: AppTypography.bodyMedium(
              color: valueColor ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
            ),
          ),
        ],
      ),
    );
  }
}
