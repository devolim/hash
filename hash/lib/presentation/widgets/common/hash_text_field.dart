import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

/// Styled text field with Hash design
class HashTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final int maxLines;
  final bool autofocus;
  final FocusNode? focusNode;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final TextInputAction? textInputAction;

  const HashTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.autofocus = false,
    this.focusNode,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = true,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final fillColor = isDark ? Colors.black : Colors.white;
    final borderColor = isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04);
    final textSecondary = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      maxLines: maxLines,
      autofocus: autofocus,
      focusNode: focusNode,
      enabled: enabled,
      textCapitalization: textCapitalization,
      autocorrect: autocorrect,
      textInputAction: textInputAction,
      style: AppTypography.bodyLarge(
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
      ),
      cursorColor: isDark ? AppColors.accentPrimary : Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: textSecondary)
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: isDark ? AppColors.accentPrimary : Colors.black, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor.withValues(alpha: 0.5)),
        ),
        hintStyle: AppTypography.bodyLarge(color: textSecondary),
        labelStyle: AppTypography.bodyMedium(color: textSecondary),
      ),
    );
  }
}

/// PIN input field
class HashPinField extends StatefulWidget {
  final int length;
  final void Function(String) onCompleted;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool autofocus;
  final bool enabled;

  const HashPinField({
    super.key,
    this.length = 6,
    required this.onCompleted,
    this.onChanged,
    this.obscureText = true,
    this.autofocus = true,
    this.enabled = true,
  });

  @override
  State<HashPinField> createState() => _HashPinFieldState();
}

class _HashPinFieldState extends State<HashPinField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  int _previousLength = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged(String text) {
    // Haptic feedback
    if (text.length > _previousLength) {
      HapticFeedback.lightImpact();
    } else if (text.length < _previousLength) {
      HapticFeedback.lightImpact();
    }
    _previousLength = text.length;

    setState(() {});
    widget.onChanged?.call(text);

    if (text.length == widget.length) {
      widget.onCompleted(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final text = _controller.text;

    const spacing = 8.0;
    const fieldWidth = 42.0;
    const fieldHeight = 50.0;

    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Visual PIN boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.length, (index) {
              final hasValue = index < text.length;
              final isCurrentField = _focusNode.hasFocus &&
                  index == text.length &&
                  text.length < widget.length;

              return Container(
                width: fieldWidth,
                height: fieldHeight,
                margin: EdgeInsets.only(
                  left: index > 0 ? spacing : 0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: hasValue
                            ? AppColors.accentPrimary.withValues(alpha: 0.12)
                            : isDark
                                ? Colors.white.withValues(alpha: 0.06)
                                : Colors.black.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: hasValue
                              ? AppColors.accentPrimary.withValues(alpha: 0.6)
                              : isCurrentField
                                  ? AppColors.accentPrimary
                                  : isDark
                                      ? Colors.white.withValues(alpha: 0.22)
                                      : Colors.black.withValues(alpha: 0.18),
                          width: (hasValue || isCurrentField) ? 2 : 1,
                        ),
                      ),
                      child: Center(
                  child: hasValue
                      ? (widget.obscureText
                          ? Container(
                              width: 14,
                              height: 14,
                              decoration: const BoxDecoration(
                                color: AppColors.accentPrimary,
                                shape: BoxShape.circle,
                              ),
                            )
                          : Text(
                              text[index],
                              style: AppTypography.headlineLarge(
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight,
                              ),
                            ))
                      : null,
                ),
                    ),
                  ),
                ),
              );
            }),
          ),
          // Hidden TextField to capture all keyboard input
          SizedBox(
            width: (fieldWidth + spacing) * widget.length,
            height: fieldHeight,
            child: Opacity(
              opacity: 0.0,
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                autofocus: widget.autofocus,
                enabled: widget.enabled,
                keyboardType: TextInputType.number,
                maxLength: widget.length,
                enableInteractiveSelection: false,
                showCursor: false,
                decoration: const InputDecoration(
                  counterText: '',
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: _onTextChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Hash ID input field with 3 separate fields (XXX-XXX-XXX)
class HashIdField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final VoidCallback? onComplete;
  final String? errorText;

  const HashIdField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onComplete,
    this.errorText,
  });

  @override
  State<HashIdField> createState() => _HashIdFieldState();
}

class _HashIdFieldState extends State<HashIdField> {
  late final TextEditingController _part1Controller;
  late final TextEditingController _part2Controller;
  late final TextEditingController _part3Controller;

  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();
  final FocusNode _focus3 = FocusNode();

  @override
  void initState() {
    super.initState();
    // Parse initial value if present
    final parts = widget.controller.text.split('-');
    _part1Controller = TextEditingController(text: parts.isNotEmpty ? parts[0] : '');
    _part2Controller = TextEditingController(text: parts.length > 1 ? parts[1] : '');
    _part3Controller = TextEditingController(text: parts.length > 2 ? parts[2] : '');
  }

  @override
  void dispose() {
    _part1Controller.dispose();
    _part2Controller.dispose();
    _part3Controller.dispose();
    _focus1.dispose();
    _focus2.dispose();
    _focus3.dispose();
    super.dispose();
  }

  void _updateMainController() {
    final value = '${_part1Controller.text}-${_part2Controller.text}-${_part3Controller.text}';
    widget.controller.text = value;
    widget.onChanged?.call(value);
  }

  void _onPart1Changed(String value) {
    if (value.length == 3) {
      _focus2.requestFocus();
    }
    _updateMainController();
  }

  void _onPart2Changed(String value) {
    if (value.length == 3) {
      _focus3.requestFocus();
    } else if (value.isEmpty && _part1Controller.text.isNotEmpty) {
      _focus1.requestFocus();
    }
    _updateMainController();
  }

  void _onPart3Changed(String value) {
    if (value.isEmpty && _part2Controller.text.isNotEmpty) {
      _focus2.requestFocus();
    } else if (value.length == 3) {
      // All parts complete, call onComplete callback
      widget.onComplete?.call();
    }
    _updateMainController();
  }

  InputDecoration _buildDecoration(BuildContext context, String hint, bool hasError, [double horizontalPadding = 12]) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final fillColor = isDark ? Colors.black : Colors.white;
    final borderColor = isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.04);
    final hintColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
    final isCompact = horizontalPadding < 12;

    return InputDecoration(
      hintText: hint,
      hintStyle: isCompact
          ? AppTypography.hashId(color: hintColor).copyWith(fontSize: 18, letterSpacing: 1.5)
          : AppTypography.hashId(color: hintColor),
      filled: true,
      fillColor: fillColor,
      contentPadding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: hasError ? AppColors.error : borderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: hasError ? AppColors.error : borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: hasError ? AppColors.error : (isDark ? AppColors.accentPrimary : Colors.black),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hasError = widget.errorText != null;
    final textColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final separatorColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            // Calculate available width per field after separators
            // 2 separators with padding on each side
            const separatorTotalWidth = 2 * (8.0 + 14.0 + 8.0); // padding + dash + padding
            final availablePerField = (constraints.maxWidth - separatorTotalWidth) / 3;

            // Scale down for narrow fields (small Android screens)
            final isCompact = availablePerField < 85;
            final fieldStyle = isCompact
                ? AppTypography.hashId(color: textColor).copyWith(
                    fontSize: 18,
                    letterSpacing: 1.5,
                  )
                : AppTypography.hashId(color: textColor);
            final separatorStyle = isCompact
                ? AppTypography.hashId(color: separatorColor).copyWith(
                    fontSize: 18,
                    letterSpacing: 1.5,
                  )
                : AppTypography.hashId(color: separatorColor);
            final contentHPadding = isCompact ? 6.0 : 12.0;
            final separatorHPadding = isCompact ? 4.0 : 8.0;

            return Row(
              children: [
                // Part 1: 3 digits
                Expanded(
                  child: TextField(
                    controller: _part1Controller,
                    focusNode: _focus1,
                    textAlign: TextAlign.center,
                    style: fieldStyle,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    enableSuggestions: false,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    decoration: _buildDecoration(context, '000', hasError, contentHPadding),
                    onChanged: _onPart1Changed,
                  ),
                ),

                // Separator
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: separatorHPadding),
                  child: Text('-', style: separatorStyle),
                ),

                // Part 2: 3 digits
                Expanded(
                  child: TextField(
                    controller: _part2Controller,
                    focusNode: _focus2,
                    textAlign: TextAlign.center,
                    style: fieldStyle,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    enableSuggestions: false,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    decoration: _buildDecoration(context, '000', hasError, contentHPadding),
                    onChanged: _onPart2Changed,
                  ),
                ),

                // Separator
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: separatorHPadding),
                  child: Text('-', style: separatorStyle),
                ),

                // Part 3: 3 letters
                Expanded(
                  child: TextField(
                    controller: _part3Controller,
                    focusNode: _focus3,
                    textAlign: TextAlign.center,
                    style: fieldStyle,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                    autocorrect: false,
                    enableSuggestions: false,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                      LengthLimitingTextInputFormatter(3),
                      _UpperCaseFormatter(),
                    ],
                    decoration: _buildDecoration(context, 'XXX', hasError, contentHPadding),
                    onChanged: _onPart3Changed,
                  ),
                ),
              ],
            );
          },
        ),

        // Error text
        if (widget.errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.errorText!,
            style: AppTypography.bodySmall(color: AppColors.error),
          ),
        ],
      ],
    );
  }
}

class _UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
