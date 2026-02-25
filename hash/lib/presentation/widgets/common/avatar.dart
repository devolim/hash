import 'dart:io';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/avatar_utils.dart';

/// Beautiful avatar colors for contacts without photos
const List<Color> _avatarColors = [
  Color(0xFF5CD85C), // Green
  Color(0xFF54A0FF), // Blue
  Color(0xFFF368E0), // Pink
  Color(0xFFFF6B6B), // Coral
  Color(0xFFFFAB00), // Amber
  Color(0xFF10AC84), // Teal
  Color(0xFF5F27CD), // Purple
  Color(0xFF48DBFB), // Cyan
  Color(0xFFFF8E53), // Orange
  Color(0xFFEE5A5A), // Red
  Color(0xFF00D2D3), // Turquoise
  Color(0xFFA29BFE), // Lavender
];

/// Generate a consistent color from a string (name or ID)
Color getAvatarColor(String seed) {
  if (seed.isEmpty) return _avatarColors[0];

  // Simple hash function to get a consistent index
  int hash = 0;
  for (int i = 0; i < seed.length; i++) {
    hash = seed.codeUnitAt(i) + ((hash << 5) - hash);
  }

  final index = hash.abs() % _avatarColors.length;
  return _avatarColors[index];
}

/// Avatar widget for contacts
class HashAvatar extends StatelessWidget {
  final String? imagePath;
  final String initials;
  final double size;
  final Color? backgroundColor;
  final String? colorSeed; // Used to generate consistent color (e.g., contact name or ID)
  final VoidCallback? onTap;

  const HashAvatar({
    super.key,
    this.imagePath,
    required this.initials,
    this.size = 48,
    this.backgroundColor,
    this.colorSeed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedPath = AvatarUtils.resolvePath(imagePath);
    final hasImage = resolvedPath != null;

    // Get the avatar color - use provided backgroundColor, or generate from seed, or use default
    final avatarColor = backgroundColor ??
        (colorSeed != null ? getAvatarColor(colorSeed!) : AppColors.accentPrimary);

    // Calculate contrasting text color
    final textColor = avatarColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: hasImage ? null : avatarColor,
        ),
        clipBehavior: Clip.antiAlias,
        child: hasImage
            ? Image.file(
                File(resolvedPath),
                fit: BoxFit.cover,
                width: size,
                height: size,
              )
            : Center(
                child: Text(
                  initials,
                  style: AppTypography.labelLarge(
                    color: textColor,
                  ).copyWith(
                    fontSize: size * 0.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}

/// Online status indicator
class StatusIndicator extends StatelessWidget {
  final bool isOnline;
  final double size;

  const StatusIndicator({
    super.key,
    this.isOnline = false,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    // Note: Hash doesn't show online status by design
    // This widget is here for potential future use but returns empty
    return const SizedBox.shrink();
  }
}

/// Simple Avatar alias that uses name for initials and color
class Avatar extends StatelessWidget {
  final String name;
  final String? imagePath;
  final double size;

  const Avatar({
    super.key,
    required this.name,
    this.imagePath,
    this.size = 48,
  });

  String get _initials {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return HashAvatar(
      imagePath: imagePath,
      initials: _initials,
      size: size,
      colorSeed: name,
    );
  }
}

/// Avatar with edit button for profile
class EditableAvatar extends StatelessWidget {
  final String? imagePath;
  final String initials;
  final double size;
  final String? colorSeed;
  final VoidCallback onEdit;

  const EditableAvatar({
    super.key,
    this.imagePath,
    required this.initials,
    this.size = 100,
    this.colorSeed,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Stack(
      children: [
        HashAvatar(
          imagePath: imagePath,
          initials: initials,
          size: size,
          colorSeed: colorSeed,
          onTap: onEdit,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: onEdit,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                color: AppColors.accentPrimary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.add,
                size: size * 0.18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
