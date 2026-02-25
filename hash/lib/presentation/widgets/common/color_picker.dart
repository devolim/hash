import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../l10n/generated/app_localizations.dart';

/// A color picker for chat customization
class ColorPickerSheet extends StatefulWidget {
  final Color? initialColor;
  final String title;
  final bool allowGradient;
  final Function(Color?) onColorSelected;
  final Function(List<Color>?)? onGradientSelected;

  const ColorPickerSheet({
    super.key,
    this.initialColor,
    required this.title,
    this.allowGradient = false,
    required this.onColorSelected,
    this.onGradientSelected,
  });

  static Future<Color?> show({
    required BuildContext context,
    Color? initialColor,
    required String title,
    bool allowGradient = false,
  }) async {
    Color? selectedColor = initialColor;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: ColorPickerSheet(
          initialColor: initialColor,
          title: title,
          allowGradient: allowGradient,
          onColorSelected: (c) => selectedColor = c,
        ),
      ),
    );

    return selectedColor;
  }

  @override
  State<ColorPickerSheet> createState() => _ColorPickerSheetState();
}

class _ColorPickerSheetState extends State<ColorPickerSheet> {
  late Color? _selectedColor;
  bool _isGradient = false;
  Color? _gradientStart;
  Color? _gradientEnd;

  // Predefined colors
  static const List<Color> _predefinedColors = [
    Color(0xFFFFAB00), // Accent primary (amber)
    Color(0xFF00D26A), // Success (green)
    Color(0xFFFF4757), // Error (red)
    Color(0xFF5352ED), // Purple
    Color(0xFF1E90FF), // Blue
    Color(0xFF00CED1), // Cyan
    Color(0xFFFF6B81), // Pink
    Color(0xFFFF8C00), // Orange
    Color(0xFF9B59B6), // Violet
    Color(0xFF2ECC71), // Emerald
    Color(0xFF3498DB), // Light blue
    Color(0xFFE91E63), // Deep pink
    Color(0xFF00BCD4), // Teal
    Color(0xFF8BC34A), // Light green
    Color(0xFFFF5722), // Deep orange
    Color(0xFF673AB7), // Deep purple
  ];

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: SafeArea(
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
            Text(
              widget.title,
              style: AppTypography.headlineSmall(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),

            const SizedBox(height: 24),

            // Gradient toggle if allowed
            if (widget.allowGradient)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.useGradient,
                      style: AppTypography.bodyMedium(
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                    Switch(
                      value: _isGradient,
                      onChanged: (value) {
                        setState(() => _isGradient = value);
                      },
                      activeColor: GlassTheme.glassIconColor(isDark),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 16),

            // Preview
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              decoration: BoxDecoration(
                color: _isGradient ? null : (_selectedColor ?? Colors.black),
                gradient: _isGradient && _gradientStart != null && _gradientEnd != null
                    ? LinearGradient(
                        colors: [_gradientStart!, _gradientEnd!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
                ),
              ),
              child: Center(
                child: Text(
                  l10n.preview,
                  style: AppTypography.bodyMedium(
                    color: _selectedColor != null
                        ? (_selectedColor!.computeLuminance() > 0.5 ? Colors.black : Colors.white)
                        : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Color grid
            if (!_isGradient) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: _predefinedColors.length,
                  itemBuilder: (context, index) {
                    final color = _predefinedColors[index];
                    final isSelected = _selectedColor?.value == color.value;

                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedColor = color);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: Colors.white, width: 3)
                              : null,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: color.withValues(alpha: 0.5),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : null,
                        ),
                        child: isSelected
                            ? const Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ] else ...[
              // Gradient selection
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.gradientStart,
                      style: AppTypography.labelMedium(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _predefinedColors.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final color = _predefinedColors[index];
                          final isSelected = _gradientStart?.value == color.value;

                          return GestureDetector(
                            onTap: () {
                              setState(() => _gradientStart = color);
                            },
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: isSelected
                                    ? Border.all(color: Colors.white, width: 2)
                                    : null,
                              ),
                              child: isSelected
                                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.gradientEnd,
                      style: AppTypography.labelMedium(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _predefinedColors.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final color = _predefinedColors[index];
                          final isSelected = _gradientEnd?.value == color.value;

                          return GestureDetector(
                            onTap: () {
                              setState(() => _gradientEnd = color);
                            },
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: isSelected
                                    ? Border.all(color: Colors.white, width: 2)
                                    : null,
                              ),
                              child: isSelected
                                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Reset button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        widget.onColorSelected(null);
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        side: BorderSide(
                          color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(l10n.reset),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Confirm button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onColorSelected(_selectedColor);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlassTheme.glassIconColor(isDark),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(l10n.confirm),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
