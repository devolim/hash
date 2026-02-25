import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/models/call_state.dart';

/// Indicateur de qualité de connexion
class CallQualityIndicator extends StatelessWidget {
  final ConnectionQuality quality;

  const CallQualityIndicator({
    super.key,
    required this.quality,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBars(),
          const SizedBox(width: 4),
          Icon(
            _getIcon(),
            size: 14,
            color: _getColor(),
          ),
        ],
      ),
    );
  }

  Widget _buildBars() {
    final activeBars = _getActiveBars();

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(4, (index) {
        final height = 4.0 + (index * 3);
        final isActive = index < activeBars;

        return Container(
          width: 3,
          height: height,
          margin: const EdgeInsets.only(right: 1),
          decoration: BoxDecoration(
            color: isActive ? _getColor() : AppColors.textTertiaryDark,
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }

  int _getActiveBars() {
    switch (quality) {
      case ConnectionQuality.excellent:
        return 4;
      case ConnectionQuality.good:
        return 3;
      case ConnectionQuality.poor:
        return 2;
      case ConnectionQuality.lost:
        return 0;
    }
  }

  IconData _getIcon() {
    switch (quality) {
      case ConnectionQuality.excellent:
      case ConnectionQuality.good:
        return Icons.signal_cellular_alt;
      case ConnectionQuality.poor:
        return Icons.signal_cellular_alt_1_bar;
      case ConnectionQuality.lost:
        return Icons.signal_cellular_off;
    }
  }

  Color _getColor() {
    switch (quality) {
      case ConnectionQuality.excellent:
        return AppColors.success;
      case ConnectionQuality.good:
        return AppColors.success;
      case ConnectionQuality.poor:
        return AppColors.warning;
      case ConnectionQuality.lost:
        return AppColors.error;
    }
  }
}
