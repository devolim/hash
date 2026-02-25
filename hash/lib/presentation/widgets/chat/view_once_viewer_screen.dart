import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/media_utils.dart';
import '../../../domain/models/message.dart';

/// Écran de visualisation pour les médias vue unique
/// Le média s'affiche pendant X secondes puis disparaît
class ViewOnceViewerScreen extends StatefulWidget {
  final Message message;
  final VoidCallback onViewed;

  const ViewOnceViewerScreen({
    super.key,
    required this.message,
    required this.onViewed,
  });

  @override
  State<ViewOnceViewerScreen> createState() => _ViewOnceViewerScreenState();
}

class _ViewOnceViewerScreenState extends State<ViewOnceViewerScreen>
    with SingleTickerProviderStateMixin {
  VideoPlayerController? _videoController;
  bool _isInitialized = false;
  late int _remainingSeconds;
  late bool _isInfinite;
  Timer? _countdownTimer;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _remainingSeconds = widget.message.viewOnceDuration ?? 5;
    _isInfinite = _remainingSeconds <= 0;

    _progressController = AnimationController(
      vsync: this,
      duration: _isInfinite ? const Duration(seconds: 1) : Duration(seconds: _remainingSeconds),
    );

    if (widget.message.type == MessageType.video) {
      _initializeVideo();
    } else if (!_isInfinite) {
      _startCountdown();
    }

    // Marquer comme vu immédiatement
    widget.onViewed();
  }

  Future<void> _initializeVideo() async {
    final rawPath = widget.message.mediaUrl ?? widget.message.content;
    final resolvedPath = MediaUtils.resolvePath(rawPath) ??
        (File(rawPath).existsSync() ? rawPath : null);

    if (resolvedPath == null) {
      _startCountdown();
      return;
    }
    final file = File(resolvedPath);

    if (!file.existsSync()) {
      _startCountdown();
      return;
    }

    _videoController = VideoPlayerController.file(file);

    try {
      await _videoController!.initialize();
      if (mounted) {
        setState(() => _isInitialized = true);
        _videoController!.play();
        if (!_isInfinite) _startCountdown();
      }
    } catch (e) {
      debugPrint('Video init error: $e');
      _startCountdown();
    }
  }

  void _startCountdown() {
    _progressController.forward();

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        _remainingSeconds--;
      });

      if (_remainingSeconds <= 0) {
        timer.cancel();
        _close();
      }
    });
  }

  void _close() {
    HapticFeedback.mediumImpact();
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _countdownTimer?.cancel();
    _progressController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVideo = widget.message.type == MessageType.video;
    final rawMediaPath = widget.message.mediaUrl ?? widget.message.content;
    final mediaPath = MediaUtils.resolvePath(rawMediaPath) ??
        (File(rawMediaPath).existsSync() ? rawMediaPath : rawMediaPath);

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _close,
        behavior: HitTestBehavior.opaque,
        child: Stack(
        fit: StackFit.expand,
        children: [
          // Contenu média
          Center(
            child: isVideo ? _buildVideoPlayer() : _buildImage(mediaPath),
          ),

          // Header avec countdown
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 8,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.7),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Bouton fermer
                      GestureDetector(
                        onTap: _close,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close, color: Colors.white, size: 20),
                        ),
                      ),
                      const Spacer(),
                      // Timer countdown
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.visibility_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _isInfinite ? '∞' : '$_remainingSeconds',
                              style: AppTypography.labelLarge(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (!_isInfinite) ...[
                    const SizedBox(height: 12),
                    // Progress bar
                    AnimatedBuilder(
                      animation: _progressController,
                      builder: (context, child) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: 1.0 - _progressController.value,
                            backgroundColor: Colors.white.withValues(alpha: 0.3),
                            valueColor: const AlwaysStoppedAnimation(AppColors.accentPrimary),
                            minHeight: 3,
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Label "Vue unique"
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 24,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.white70,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isVideo ? 'Vidéo à vue unique' : 'Photo à vue unique',
                      style: AppTypography.labelMedium(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    final file = File(imagePath);

    if (!file.existsSync()) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.broken_image_outlined, color: Colors.white54, size: 64),
          const SizedBox(height: 16),
          Text(
            'Image introuvable',
            style: AppTypography.bodyMedium(color: Colors.white54),
          ),
        ],
      );
    }

    return Image.file(
      file,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.broken_image_outlined, color: Colors.white54, size: 64),
            const SizedBox(height: 16),
            Text(
              'Erreur de chargement',
              style: AppTypography.bodyMedium(color: Colors.white54),
            ),
          ],
        );
      },
    );
  }

  Widget _buildVideoPlayer() {
    if (!_isInitialized || _videoController == null) {
      return const CircularProgressIndicator(color: AppColors.accentPrimary);
    }

    return AspectRatio(
      aspectRatio: _videoController!.value.aspectRatio,
      child: VideoPlayer(_videoController!),
    );
  }
}
