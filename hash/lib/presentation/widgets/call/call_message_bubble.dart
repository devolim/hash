import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/models/call_message.dart';

/// Bulle de message pour les appels dans le chat
/// Affichée de façon centrée (comme WhatsApp)
class CallMessageBubble extends StatelessWidget {
  final CallMessage callMessage;
  final VoidCallback? onTap;

  const CallMessageBubble({
    super.key,
    required this.callMessage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.04),
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icône selon le type d'appel
              Icon(
                callMessage.icon,
                color: callMessage.iconColor,
                size: 20,
              ),

              const SizedBox(width: 14),

              // Texte centré : statut + heure en dessous
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Statut de l'appel
                  Text(
                    callMessage.displayText,
                    style: TextStyle(
                      color: callMessage.isMissed
                          ? AppColors.error
                          : isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // Durée + heure, centrées
                  Text(
                    callMessage.wasAnswered &&
                            callMessage.formattedDuration.isNotEmpty
                        ? '${callMessage.formattedDuration} • ${_formatTime(callMessage.timestamp)}'
                        : _formatTime(callMessage.timestamp),
                    style: TextStyle(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (messageDate == today) {
      return DateFormat.Hm().format(dateTime);
    } else if (messageDate == today.subtract(const Duration(days: 1))) {
      return 'Hier, ${DateFormat.Hm().format(dateTime)}';
    } else {
      return DateFormat('dd/MM, HH:mm').format(dateTime);
    }
  }
}
