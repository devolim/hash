import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/models/note.dart';

class NoteColors {
  static const List<Color> palette = [
    Colors.transparent, // 0: Default (surface)
    Color(0xFFFF4757), // 1: Rouge
    Color(0xFFFF9F43), // 2: Orange
    Color(0xFFF1C40F), // 3: Jaune
    Color(0xFF2ECC71), // 4: Vert
    Color(0xFF3498DB), // 5: Bleu
    Color(0xFF9B59B6), // 6: Violet
    Color(0xFFE91E63), // 7: Rose
  ];

  static Color getColor(int index) {
    if (index < 0 || index >= palette.length) return palette[0];
    return palette[index];
  }

  static Color getBackgroundColor(int index, bool isDark) {
    if (index == 0) return isDark ? Colors.black : Colors.white;
    return getColor(index).withValues(alpha: isDark ? 0.15 : 0.12);
  }

  static Color getBorderColor(int index, bool isDark) {
    if (index == 0) {
      return isDark
          ? Colors.white.withValues(alpha: 0.06)
          : Colors.black.withValues(alpha: 0.04);
    }
    return getColor(index).withValues(alpha: 0.4);
  }
}

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final int animationIndex;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onLongPress,
    this.animationIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = NoteColors.getBackgroundColor(note.colorIndex, isDark);
    final borderColor = NoteColors.getBorderColor(note.colorIndex, isDark);
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final tertiaryColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: note.colorIndex == 0 ? 0.5 : 1,
          ),
          boxShadow: note.colorIndex == 0
              ? [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.5)
                        : Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: lock icon + pin icon
            if (note.isLocked || note.isPinned)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    if (note.isPinned) ...[
                      Icon(Icons.push_pin, size: 14, color: AppColors.accentPrimary),
                      const SizedBox(width: 4),
                    ],
                    if (note.isLocked)
                      Icon(Icons.lock, size: 14, color: secondaryColor),
                    const Spacer(),
                  ],
                ),
              ),

            // Title
            if (note.title.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  note.title,
                  style: AppTypography.bodyLarge(color: primaryColor).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            // Content preview
            if (!note.isLocked) ...[
              if (note.type == NoteType.text && note.content.isNotEmpty)
                Text(
                  note.content,
                  style: AppTypography.bodySmall(color: secondaryColor),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              if (note.type == NoteType.checklist && note.items.isNotEmpty) ...[
                // Progress bar
                _buildChecklistPreview(note, secondaryColor, tertiaryColor),
              ],
            ] else ...[
              Row(
                children: [
                  Icon(Icons.lock_outline, size: 16, color: tertiaryColor),
                  const SizedBox(width: 6),
                  Text(
                    '...',
                    style: AppTypography.bodySmall(color: tertiaryColor),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 8),

            // Date
            Text(
              _formatDate(note.updatedAt),
              style: AppTypography.labelSmall(color: tertiaryColor),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (50 * animationIndex).ms).scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          delay: (50 * animationIndex).ms,
          duration: 200.ms,
        );
  }

  Widget _buildChecklistPreview(Note note, Color secondaryColor, Color tertiaryColor) {
    final checked = note.items.where((i) => i.isChecked).length;
    final total = note.items.length;
    final progress = total > 0 ? checked / total : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show first 3 items
        ...note.items.take(3).map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                children: [
                  Icon(
                    item.isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                    size: 16,
                    color: item.isChecked ? tertiaryColor : secondaryColor,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      item.text,
                      style: AppTypography.bodySmall(color: secondaryColor).copyWith(
                        decoration: item.isChecked ? TextDecoration.lineThrough : null,
                        color: item.isChecked ? tertiaryColor : secondaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 6),
        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 4,
            backgroundColor: secondaryColor.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$checked/$total',
          style: AppTypography.labelSmall(color: tertiaryColor),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return "A l'instant";
    if (diff.inHours < 1) return 'Il y a ${diff.inMinutes} min';
    if (diff.inDays < 1) return 'Il y a ${diff.inHours}h';
    if (diff.inDays < 7) return 'Il y a ${diff.inDays}j';
    return '${date.day}/${date.month}/${date.year}';
  }
}
