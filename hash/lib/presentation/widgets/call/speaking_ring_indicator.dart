import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Indicateur de parole : cercles concentriques pulsants autour d'un widget enfant (avatar).
/// Quand [isSpeaking] est true, les anneaux pulsent avec un glow ambre.
/// Quand false, l'animation se réduit à 0 opacité en 250ms.
class SpeakingRingIndicator extends StatefulWidget {
  final bool isSpeaking;
  final double size;
  final Widget child;

  const SpeakingRingIndicator({
    super.key,
    required this.isSpeaking,
    required this.size,
    required this.child,
  });

  @override
  State<SpeakingRingIndicator> createState() => _SpeakingRingIndicatorState();
}

class _SpeakingRingIndicatorState extends State<SpeakingRingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    if (widget.isSpeaking) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant SpeakingRingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSpeaking && !oldWidget.isSpeaking) {
      _controller.repeat();
    } else if (!widget.isSpeaking && oldWidget.isSpeaking) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ringPadding = widget.size * 0.15;
    final totalSize = widget.size + ringPadding * 2;

    return SizedBox(
      width: totalSize,
      height: totalSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 3 concentric rings
          AnimatedOpacity(
            opacity: widget.isSpeaking ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 250),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Stack(
                  alignment: Alignment.center,
                  children: List.generate(3, (i) {
                    final delay = i * 0.2;
                    final t = ((_controller.value + delay) % 1.0);
                    final scale = 1.0 + t * 0.15;
                    final alpha = (0.4 - i * 0.12) * (1.0 - t);

                    return Transform.scale(
                      scale: scale,
                      child: Container(
                        width: widget.size + 8,
                        height: widget.size + 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.accentPrimary
                                .withValues(alpha: alpha.clamp(0.0, 1.0)),
                            width: 2.5 - i * 0.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accentPrimary
                                  .withValues(alpha: (alpha * 0.5).clamp(0.0, 1.0)),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          // Child (avatar)
          widget.child,
        ],
      ),
    );
  }
}
