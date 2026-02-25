import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact.dart';
import '../../../domain/models/message.dart';
import '../../../core/utils/media_utils.dart';
import '../common/avatar.dart';

/// Écran plein écran pour visualiser les images et vidéos
class MediaViewerScreen extends StatefulWidget {
  final Message message;
  final Contact contact;
  final VoidCallback? onSave;

  const MediaViewerScreen({
    super.key,
    required this.message,
    required this.contact,
    this.onSave,
  });

  @override
  State<MediaViewerScreen> createState() => _MediaViewerScreenState();
}

class _MediaViewerScreenState extends State<MediaViewerScreen> with TickerProviderStateMixin {
  VideoPlayerController? _videoController;
  bool _isPlaying = false;
  bool _showBar = true;
  bool _isInitialized = false;

  // Swipe to dismiss
  double _dragOffset = 0;
  double _dragScale = 1.0;

  // Auto-hide timer
  Timer? _hideTimer;

  // Animation controllers pour les barres
  late AnimationController _barAnimController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _topSlideAnimation;
  late Animation<Offset> _bottomSlideAnimation;

  @override
  void initState() {
    super.initState();
    // Mode plein écran total - cache status bar et home indicator
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [],
    );

    // Animation controller pour les barres
    _barAnimController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _barAnimController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ));

    _topSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _barAnimController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));

    _bottomSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _barAnimController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));

    // Démarrer avec les barres visibles
    _barAnimController.forward();

    if (widget.message.type == MessageType.video) {
      _initializeVideo();
    }

    // Auto-hide la barre après 3 secondes
    _startHideTimer();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && _showBar) {
        _hideBar();
      }
    });
  }

  void _showBarAnimated() {
    setState(() => _showBar = true);
    _barAnimController.forward();
    _startHideTimer();
  }

  void _hideBar() {
    _barAnimController.reverse().then((_) {
      if (mounted) {
        setState(() => _showBar = false);
      }
    });
  }

  void _toggleBar() {
    if (_showBar) {
      _hideTimer?.cancel();
      _hideBar();
    } else {
      _showBarAnimated();
    }
  }

  Future<void> _initializeVideo() async {
    final rawPath = widget.message.mediaUrl ?? widget.message.content;
    final resolvedPath = MediaUtils.resolvePath(rawPath) ??
        (File(rawPath).existsSync() ? rawPath : null);

    if (resolvedPath == null) return;
    final file = File(resolvedPath);

    if (!file.existsSync()) return;

    _videoController = VideoPlayerController.file(file);

    try {
      await _videoController!.initialize();
      _videoController!.addListener(_videoListener);
      if (mounted) {
        setState(() => _isInitialized = true);
      }
    } catch (e) {
      debugPrint('Video init error: $e');
    }
  }

  void _videoListener() {
    if (_videoController == null) return;

    final isPlaying = _videoController!.value.isPlaying;
    if (isPlaying != _isPlaying && mounted) {
      setState(() => _isPlaying = isPlaying);
    }

    // Boucle automatique
    if (_videoController!.value.position >= _videoController!.value.duration) {
      _videoController!.seekTo(Duration.zero);
      _videoController!.pause();
      if (mounted) setState(() => _isPlaying = false);
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _barAnimController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _videoController?.removeListener(_videoListener);
    _videoController?.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_videoController == null) return;

    HapticFeedback.lightImpact();

    if (_isPlaying) {
      _videoController!.pause();
    } else {
      _videoController!.play();
    }

    // Réafficher les barres quand on toggle play/pause
    if (!_showBar) {
      _showBarAnimated();
    } else {
      _startHideTimer();
    }
  }

  void _seekBackward() {
    if (_videoController == null) return;

    HapticFeedback.lightImpact();
    final currentPosition = _videoController!.value.position;
    final newPosition = currentPosition - const Duration(seconds: 5);
    _videoController!.seekTo(newPosition < Duration.zero ? Duration.zero : newPosition);
    _startHideTimer();
  }

  void _seekForward() {
    if (_videoController == null) return;

    HapticFeedback.lightImpact();
    final currentPosition = _videoController!.value.position;
    final duration = _videoController!.value.duration;
    final newPosition = currentPosition + const Duration(seconds: 5);
    _videoController!.seekTo(newPosition > duration ? duration : newPosition);
    _startHideTimer();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _formatDateTime(DateTime date) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');
    return '${dateFormat.format(localDate)} à ${timeFormat.format(localDate)}';
  }

  @override
  Widget build(BuildContext context) {
    final isVideo = widget.message.type == MessageType.video;
    final rawMediaPath = widget.message.mediaUrl ?? widget.message.content;
    final mediaPath = MediaUtils.resolvePath(rawMediaPath) ??
        (File(rawMediaPath).existsSync() ? rawMediaPath : rawMediaPath);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _toggleBar,
        onVerticalDragStart: (_) {},
        onVerticalDragUpdate: (details) {
          setState(() {
            _dragOffset += details.delta.dy;
            _dragScale = (1.0 - (_dragOffset.abs() / 1000)).clamp(0.8, 1.0);
          });
        },
        onVerticalDragEnd: (details) {
          if (_dragOffset.abs() > 100 || details.velocity.pixelsPerSecond.dy.abs() > 500) {
            Navigator.of(context).pop();
          } else {
            setState(() {
              _dragOffset = 0;
              _dragScale = 1.0;
            });
          }
        },
        child: Container(
          color: isDark ? Colors.black : Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Contenu média avec transform pour swipe to dismiss
              Transform.translate(
                offset: Offset(0, _dragOffset),
                child: Transform.scale(
                  scale: _dragScale,
                  child: Center(
                    child: isVideo ? _buildVideoPlayer() : _buildImage(mediaPath),
                  ),
                ),
              ),

              // Bouton play/pause central pour vidéo
              if (isVideo && _isInitialized)
                Center(
                  child: GestureDetector(
                    onTap: _togglePlayPause,
                    child: AnimatedOpacity(
                      opacity: !_isPlaying ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),

              // AppBar animée en haut
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SlideTransition(
                  position: _topSlideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: _buildTopBar(isDark, topPadding),
                  ),
                ),
              ),

              // Barre de contrôle vidéo animée en bas
              if (isVideo && _isInitialized)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SlideTransition(
                    position: _bottomSlideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: _buildVideoControlBar(isDark, bottomPadding),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Barre supérieure avec effet blur
  Widget _buildTopBar(bool isDark, double topPadding) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: GlassTheme.blurHeavy, sigmaY: GlassTheme.blurHeavy),
        child: Container(
          padding: EdgeInsets.only(
            top: topPadding + 8,
            bottom: 12,
            left: 4,
            right: 4,
          ),
          decoration: BoxDecoration(
            color: GlassTheme.background(isDark),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              // Bouton fermer
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColors.accentPrimary,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),

              // Info contact centrée
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HashAvatar(
                      imagePath: widget.contact.avatarPath,
                      initials: widget.contact.initials,
                      size: 36,
                      colorSeed: widget.contact.displayName,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.contact.displayName,
                            style: AppTypography.bodyMedium(
                              color: isDark ? Colors.white : Colors.black,
                            ).copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            _formatDateTime(widget.message.timestamp),
                            style: AppTypography.labelSmall(
                              color: isDark ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Bouton télécharger
              if (widget.onSave != null)
                IconButton(
                  icon: const Icon(
                    Icons.download_rounded,
                    color: AppColors.accentPrimary,
                  ),
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    widget.onSave!();
                  },
                )
              else
                const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }

  /// Barre de contrôle vidéo avec effet blur
  Widget _buildVideoControlBar(bool isDark, double bottomPadding) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: GlassTheme.blurHeavy, sigmaY: GlassTheme.blurHeavy),
        child: Container(
          padding: EdgeInsets.only(
            top: 16,
            bottom: bottomPadding + 16,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: GlassTheme.background(isDark),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ValueListenableBuilder<VideoPlayerValue>(
            valueListenable: _videoController!,
            builder: (context, value, child) {
              final position = value.position;
              final duration = value.duration;
              final progress = duration.inMilliseconds > 0
                  ? position.inMilliseconds / duration.inMilliseconds
                  : 0.0;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Barre de progression
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 4,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                      activeTrackColor: AppColors.accentPrimary,
                      inactiveTrackColor: isDark
                          ? Colors.white.withValues(alpha: 0.2)
                          : Colors.black.withValues(alpha: 0.15),
                      thumbColor: AppColors.accentPrimary,
                      overlayColor: AppColors.accentPrimary.withValues(alpha: 0.2),
                    ),
                    child: Slider(
                      value: progress.clamp(0.0, 1.0),
                      onChanged: (value) {
                        final newPosition = Duration(
                          milliseconds: (value * duration.inMilliseconds).toInt(),
                        );
                        _videoController!.seekTo(newPosition);
                      },
                      onChangeStart: (_) {
                        _hideTimer?.cancel();
                      },
                      onChangeEnd: (_) {
                        _startHideTimer();
                      },
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Contrôles et durées
                  Row(
                    children: [
                      // Durée actuelle
                      SizedBox(
                        width: 45,
                        child: Text(
                          _formatDuration(position),
                          style: AppTypography.labelMedium(
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ),

                      const Spacer(),

                      // Bouton reculer 5s
                      GestureDetector(
                        onTap: _seekBackward,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.15)
                                : Colors.black.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.replay_5_rounded,
                            color: isDark ? Colors.white : Colors.black87,
                            size: 22,
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Bouton play/pause
                      GestureDetector(
                        onTap: _togglePlayPause,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.accentPrimary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Bouton avancer 5s
                      GestureDetector(
                        onTap: _seekForward,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.15)
                                : Colors.black.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.forward_5_rounded,
                            color: isDark ? Colors.white : Colors.black87,
                            size: 22,
                          ),
                        ),
                      ),

                      const Spacer(),

                      // Durée totale
                      SizedBox(
                        width: 45,
                        child: Text(
                          _formatDuration(duration),
                          textAlign: TextAlign.end,
                          style: AppTypography.labelMedium(
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    final file = File(imagePath);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (!file.existsSync()) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.broken_image_outlined,
              color: isDark ? Colors.white54 : Colors.black38,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Image introuvable',
              style: AppTypography.bodyMedium(
                color: isDark ? Colors.white54 : Colors.black38,
              ),
            ),
          ],
        ),
      );
    }

    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 4.0,
      child: Image.file(
        file,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.broken_image_outlined,
                  color: isDark ? Colors.white54 : Colors.black38,
                  size: 64,
                ),
                const SizedBox(height: 16),
                Text(
                  'Erreur de chargement',
                  style: AppTypography.bodyMedium(
                    color: isDark ? Colors.white54 : Colors.black38,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (!_isInitialized || _videoController == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.accentPrimary),
      );
    }

    return Center(
      child: AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: VideoPlayer(_videoController!),
      ),
    );
  }
}
