import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';

/// Widget d'animation subtile pour le titre et le logo de l'AppBar.
/// Utilisé dans les pages principales (Chats, Appels, Contacts, Notes).
/// Rejoue l'animation à chaque fois que l'onglet correspondant devient actif.
/// Wrapper générique qui anime son enfant au changement d'onglet (fade + scale).
class AnimatedTabChild extends ConsumerStatefulWidget {
  final int tabIndex;
  final Widget child;

  const AnimatedTabChild({
    super.key,
    required this.tabIndex,
    required this.child,
  });

  @override
  ConsumerState<AnimatedTabChild> createState() => _AnimatedTabChildState();
}

class _AnimatedTabChildState extends ConsumerState<AnimatedTabChild>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(currentTabIndexProvider, (previous, next) {
      if (next == widget.tabIndex && previous != next) {
        _controller.reset();
        _controller.forward();
      }
    });

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class AnimatedHashAppBarTitle extends ConsumerStatefulWidget {
  final String title;
  final int tabIndex;
  final bool isOnGlass;
  final bool useThemeColor;

  const AnimatedHashAppBarTitle({
    super.key,
    required this.title,
    required this.tabIndex,
    this.isOnGlass = false,
    this.useThemeColor = false,
  });

  @override
  ConsumerState<AnimatedHashAppBarTitle> createState() =>
      _AnimatedHashAppBarTitleState();
}

class _AnimatedHashAppBarTitleState
    extends ConsumerState<AnimatedHashAppBarTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch le tab index — quand il change et correspond à notre onglet, rejouer l'animation
    ref.listen<int>(currentTabIndexProvider, (previous, next) {
      if (next == widget.tabIndex && previous != next) {
        _controller.reset();
        _controller.forward();
      }
    });

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: Builder(
        builder: (context) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final Color titleColor;
          if (widget.isOnGlass) {
            titleColor = GlassTheme.glassTextColor(isDark);
          } else if (widget.useThemeColor) {
            titleColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
          } else {
            titleColor = AppColors.accentPrimary;
          }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/icons/hash_icons.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: AppTypography.headlineSmall(color: titleColor),
              ),
            ],
          );
        },
      ),
    );
  }
}
