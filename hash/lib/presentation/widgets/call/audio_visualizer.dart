import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Visualiseur audio animé pour les appels audio
class AudioVisualizer extends StatefulWidget {
  final bool isRemoteMuted;
  final int barCount;
  final double width;
  final double maxBarHeight;

  const AudioVisualizer({
    super.key,
    this.isRemoteMuted = false,
    this.barCount = 30,
    this.width = 200,
    this.maxBarHeight = 60,
  });

  @override
  State<AudioVisualizer> createState() => _AudioVisualizerState();
}

class _AudioVisualizerState extends State<AudioVisualizer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<double> _barHeights = [];
  final _random = Random();

  @override
  void initState() {
    super.initState();

    // Initialiser les hauteurs des barres
    for (int i = 0; i < widget.barCount; i++) {
      _barHeights.add(_random.nextDouble() * widget.maxBarHeight);
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..addListener(_updateBarHeights);

    if (!widget.isRemoteMuted) {
      _controller.repeat();
    }
  }

  void _updateBarHeights() {
    setState(() {
      for (int i = 0; i < widget.barCount; i++) {
        // Simuler une forme d'onde
        final baseHeight = widget.maxBarHeight * 0.3;
        final variance = widget.maxBarHeight * 0.7;
        _barHeights[i] = baseHeight + (_random.nextDouble() * variance);
      }
    });
  }

  @override
  void didUpdateWidget(AudioVisualizer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isRemoteMuted && _controller.isAnimating) {
      _controller.stop();
      setState(() {
        for (int i = 0; i < widget.barCount; i++) {
          _barHeights[i] = widget.maxBarHeight * 0.1;
        }
      });
    } else if (!widget.isRemoteMuted && !_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barWidth = widget.width / widget.barCount - 2;

    return SizedBox(
      width: widget.width,
      height: widget.maxBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(widget.barCount, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: barWidth,
            height: widget.isRemoteMuted
                ? widget.maxBarHeight * 0.1
                : _barHeights[index],
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              color: widget.isRemoteMuted
                  ? AppColors.textTertiaryDark
                  : AppColors.accentPrimary.withValues(
                      alpha: 0.5 + (_barHeights[index] / widget.maxBarHeight * 0.5),
                    ),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }),
      ),
    );
  }
}

/// Version simplifiée avec juste des points qui pulsent
class SimpleAudioIndicator extends StatefulWidget {
  final bool isActive;

  const SimpleAudioIndicator({
    super.key,
    this.isActive = true,
  });

  @override
  State<SimpleAudioIndicator> createState() => _SimpleAudioIndicatorState();
}

class _SimpleAudioIndicatorState extends State<SimpleAudioIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    if (widget.isActive) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(SimpleAudioIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive && !_controller.isAnimating) {
      _controller.repeat(reverse: true);
    } else if (!widget.isActive && _controller.isAnimating) {
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final delay = index * 0.2;
            final animValue = ((_controller.value + delay) % 1.0);

            return Container(
              width: 8,
              height: 8 + (animValue * 16),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: widget.isActive
                    ? AppColors.accentPrimary.withValues(alpha: 0.5 + animValue * 0.5)
                    : AppColors.textTertiaryDark,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        );
      },
    );
  }
}
