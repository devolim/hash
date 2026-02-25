import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/common/hash_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with TickerProviderStateMixin {

  // Manifesto statements (loaded from l10n)
  late List<String> _statements;
  bool _statementsInitialized = false;

  int _currentStatementIndex = 0;
  String _displayedText = '';
  bool _isTyping = true;
  bool _showCursor = true;
  Timer? _typingTimer;
  Timer? _pauseTimer;
  Timer? _cursorTimer;

  late AnimationController _glowController;
  late AnimationController _gridController;

  @override
  void initState() {
    super.initState();

    // Glow animation for logo
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Grid animation
    _gridController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    // Cursor blinking
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (mounted) {
        setState(() => _showCursor = !_showCursor);
      }
    });

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_statementsInitialized) {
      _statementsInitialized = true;
      final l10n = AppLocalizations.of(context)!;
      _statements = [
        l10n.onboardingStatement1,
        l10n.onboardingStatement2,
        l10n.onboardingStatement3,
        l10n.onboardingStatement4,
        l10n.onboardingStatement5,
        l10n.onboardingStatement6,
      ];
      _startTypingAnimation();
    }
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _pauseTimer?.cancel();
    _cursorTimer?.cancel();
    _glowController.dispose();
    _gridController.dispose();
    super.dispose();
  }

  void _startTypingAnimation() {
    _displayedText = '';
    _isTyping = true;
    int charIndex = 0;
    final currentStatement = _statements[_currentStatementIndex];

    _typingTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (charIndex < currentStatement.length) {
        setState(() {
          _displayedText = currentStatement.substring(0, charIndex + 1);
        });
        charIndex++;
      } else {
        timer.cancel();
        _isTyping = false;

        // Pause before next statement
        _pauseTimer = Timer(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              _currentStatementIndex = (_currentStatementIndex + 1) % _statements.length;
            });
            _startTypingAnimation();
          }
        });
      }
    });
  }

  void _startSetup() {
    context.go(AppRoutes.pinSetup);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Animated background grid
          Positioned.fill(
            child: RepaintBoundary(
              child: AnimatedBuilder(
                animation: _gridController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _GridPainter(
                      progress: _gridController.value,
                      color: AppColors.accentPrimary.withValues(alpha: 0.03),
                    ),
                  );
                },
              ),
            ),
          ),

          // Floating particles
          Positioned.fill(
            child: RepaintBoundary(
              child: _FloatingParticles(
                color: AppColors.accentPrimary.withValues(alpha: 0.1),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // Animated logo with glow
                  AnimatedBuilder(
                    animation: _glowController,
                    builder: (context, child) {
                      final glowIntensity = 0.3 + (_glowController.value * 0.4);
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accentPrimary.withValues(alpha: glowIntensity),
                              blurRadius: 30 + (_glowController.value * 15),
                              spreadRadius: 3 + (_glowController.value * 7),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'assets/icons/hash_icons.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .scale(
                        begin: const Offset(0.5, 0.5),
                        end: const Offset(1, 1),
                        duration: 800.ms,
                        curve: Curves.elasticOut,
                      ),

                  const SizedBox(height: 24),

                  // App name logo
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      AppColors.accentPrimary,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'assets/images/hash_logo_text_white.png',
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 600.ms),

                  const Spacer(flex: 1),

                  // Typing manifesto text
                  SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              // Terminal prefix
                              TextSpan(
                                text: '> ',
                                style: AppTypography.headlineSmall().copyWith(
                                  color: AppColors.accentPrimary,
                                  fontFamily: 'monospace',
                                ),
                              ),
                              // Main text
                              TextSpan(
                                text: _displayedText,
                                style: AppTypography.headlineMedium().copyWith(
                                  color: isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // Blinking cursor (only while typing)
                              if (_isTyping && _showCursor)
                                TextSpan(
                                  text: '|',
                                  style: AppTypography.headlineMedium().copyWith(
                                    color: AppColors.accentPrimary,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 800.ms, duration: 600.ms),

                  // Statement indicators
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_statements.length, (index) {
                        final isActive = index == _currentStatementIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? 24 : 8,
                          height: 4,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.accentPrimary
                                : (isDark
                                    ? AppColors.textTertiaryDark
                                    : AppColors.textTertiaryLight),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      }),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 1000.ms, duration: 600.ms),

                  const Spacer(flex: 2),

                  // Start button
                  Builder(
                    builder: (context) {
                      final l10n = AppLocalizations.of(context)!;
                      return HashButton(
                        text: l10n.getStarted,
                        onPressed: _startSetup,
                        width: double.infinity,
                      );
                    },
                  )
                      .animate()
                      .fadeIn(delay: 1200.ms, duration: 600.ms)
                      .slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 16),

                  // Transfer account option
                  Builder(
                    builder: (context) {
                      final l10n = AppLocalizations.of(context)!;
                      return GestureDetector(
                        onTap: () => context.push(AppRoutes.recoverAccount),
                        child: Text(
                          l10n.transferMyAccount,
                          style: AppTypography.bodySmall(
                            color: AppColors.accentPrimary,
                          ),
                        ),
                      );
                    },
                  )
                      .animate()
                      .fadeIn(delay: 1400.ms, duration: 600.ms),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Animated grid painter
class _GridPainter extends CustomPainter {
  final double progress;
  final Color color;

  _GridPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const spacing = 40.0;
    final offset = (progress * spacing) % spacing;

    // Horizontal lines
    for (double y = -spacing + offset; y < size.height + spacing; y += spacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Vertical lines
    for (double x = -spacing + offset; x < size.width + spacing; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

// Floating particles widget
class _FloatingParticles extends StatefulWidget {
  final Color color;

  const _FloatingParticles({required this.color});

  @override
  State<_FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<_FloatingParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Particle> _particles;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _particles = List.generate(20, (_) => _Particle(_random));
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
        return CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
            color: widget.color,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Particle {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double opacity;

  _Particle(Random random)
      : x = random.nextDouble(),
        y = random.nextDouble(),
        size = 2 + random.nextDouble() * 4,
        speed = 0.2 + random.nextDouble() * 0.5,
        opacity = 0.3 + random.nextDouble() * 0.7;
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;
  final Color color;

  _ParticlePainter({
    required this.particles,
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final y = ((particle.y + progress * particle.speed) % 1.0) * size.height;
      final x = particle.x * size.width;

      final paint = Paint()
        ..color = color.withValues(alpha: particle.opacity * color.a)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
