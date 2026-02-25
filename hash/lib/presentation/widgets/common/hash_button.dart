import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

/// Variantes de bouton
enum HashButtonVariant {
  primary,
  danger,
  outlined,
}

/// Primary action button with Hash styling
class HashButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;
  final double? width;
  final HashButtonVariant variant;

  const HashButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
    this.width,
    this.variant = HashButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final isDanger = variant == HashButtonVariant.danger;
    final isOutlinedVariant = isOutlined || variant == HashButtonVariant.outlined;
    final buttonColor = isDanger ? AppColors.error : AppColors.accentPrimary;
    final textColor = isOutlinedVariant ? buttonColor : AppColors.darkBackground;

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        else ...[
          if (icon != null) ...[
            Icon(icon, size: 20, color: textColor),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: AppTypography.buttonText(color: textColor),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ],
    );

    if (isOutlinedVariant) {
      return SizedBox(
        width: width,
        height: 56,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: buttonColor, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: child,
        ),
      );
    }

    return SizedBox(
      width: width,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: AppColors.darkBackground,
          disabledBackgroundColor: buttonColor.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: child,
      ),
    ).animate().fadeIn(duration: 200.ms).scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          duration: 200.ms,
        );
  }
}

/// Icon button with Hash styling
class HashIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double size;

  const HashIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(size / 2),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: backgroundColor == null
                ? Border.all(color: AppColors.darkBorder)
                : null,
          ),
          child: Icon(
            icon,
            color: color ?? AppColors.textPrimaryDark,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}

/// Floating action button with Hash styling
class HashFAB extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;

  const HashFAB({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: AppColors.accentPrimary,
      foregroundColor: AppColors.darkBackground,
      elevation: 4,
      child: Icon(icon),
    ).animate().scale(
          begin: const Offset(0, 0),
          end: const Offset(1, 1),
          duration: 300.ms,
          curve: Curves.elasticOut,
        );
  }
}
