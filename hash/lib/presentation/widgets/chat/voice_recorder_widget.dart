import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';

/// Mode d'enregistrement
enum VoiceRecordMode {
  idle,
  pushToTalk,
  tapMode,
  preview,
}

/// Widget complet pour l'enregistrement vocal (mode tap)
class VoiceRecorderWidget extends StatefulWidget {
  final Function(String path, Duration duration) onRecordComplete;
  final VoidCallback onCancel;
  final bool isDark;
  final VoiceRecordMode initialMode;

  const VoiceRecorderWidget({
    super.key,
    required this.onRecordComplete,
    required this.onCancel,
    required this.isDark,
    this.initialMode = VoiceRecordMode.tapMode,
  });

  @override
  State<VoiceRecorderWidget> createState() => _VoiceRecorderWidgetState();
}

class _VoiceRecorderWidgetState extends State<VoiceRecorderWidget>
    with TickerProviderStateMixin {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  VoiceRecordMode _mode = VoiceRecordMode.idle;
  bool _isPlaying = false;
  Duration _recordDuration = Duration.zero;
  Duration _playPosition = Duration.zero;
  Timer? _timer;
  String? _recordingPath;

  late AnimationController _waveController;
  final List<double> _amplitudes = List.filled(40, 0.3);
  int _amplitudeIndex = 0;
  final List<double> _recordedAmplitudes = [];

  bool _isSeeking = false;
  double _seekProgress = 0.0;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  @override
  void initState() {
    super.initState();
    _mode = widget.initialMode;

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _positionSubscription = _player.positionStream.listen((position) {
      if (mounted && !_isSeeking) {
        setState(() => _playPosition = position);
      }
    });

    _playerStateSubscription = _player.playerStateStream.listen((state) {
      if (mounted) {
        setState(() => _isPlaying = state.playing);
        if (state.processingState == ProcessingState.completed) {
          _player.seek(Duration.zero);
          _player.pause();
        }
      }
    });

    _startRecording();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _positionSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _waveController.dispose();
    _recorder.dispose();
    _player.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (!await _recorder.hasPermission()) {
      if (mounted) widget.onCancel();
      return;
    }

    final tempDir = await getTemporaryDirectory();
    if (!mounted) return;

    _recordingPath =
        '${tempDir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

    try {
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _recordingPath!,
      );

      _timer = Timer.periodic(const Duration(milliseconds: 80), (timer) async {
        if (mounted && _mode != VoiceRecordMode.preview) {
          final amplitude = await _recorder.getAmplitude();
          if (!mounted) return;
          final normalized =
              ((amplitude.current + 60) / 60).clamp(0.15, 1.0);

          setState(() {
            _recordDuration += const Duration(milliseconds: 80);
            _amplitudes[_amplitudeIndex] = normalized;
            _amplitudeIndex = (_amplitudeIndex + 1) % _amplitudes.length;
            _recordedAmplitudes.add(normalized);
          });
        }
      });
    } catch (e) {
      debugPrint('Error starting recording: $e');
      if (mounted) widget.onCancel();
    }
  }

  Future<void> _stopAndSend() async {
    _timer?.cancel();

    String? path;
    try {
      path = await _recorder.stop();
    } catch (e) {
      debugPrint('Error stopping recording: $e');
    }

    if (!mounted) return;

    if (path != null && _recordDuration.inMilliseconds > 500) {
      HapticFeedback.mediumImpact();
      widget.onRecordComplete(path, _recordDuration);
    } else {
      HapticFeedback.lightImpact();
      widget.onCancel();
    }
  }

  Future<void> _stopAndPreview() async {
    _timer?.cancel();

    try {
      await _recorder.stop();
      if (!mounted) return;
      if (_recordingPath != null && _recordDuration.inMilliseconds > 500) {
        setState(() => _mode = VoiceRecordMode.preview);
        final session = await AudioSession.instance;
        await session.configure(const AudioSessionConfiguration.music());
        await _player.setFilePath(_recordingPath!);
      } else {
        widget.onCancel();
      }
    } catch (e) {
      debugPrint('Error stopping for preview: $e');
      if (mounted) widget.onCancel();
    }
  }

  void _togglePlayback() async {
    HapticFeedback.selectionClick();
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  void _sendRecording() {
    if (_recordingPath != null && _recordDuration.inMilliseconds > 500) {
      HapticFeedback.mediumImpact();
      _player.stop();
      widget.onRecordComplete(_recordingPath!, _recordDuration);
    }
  }

  void _deleteRecording() {
    HapticFeedback.lightImpact();
    _player.stop();
    widget.onCancel();
  }

  void _onSeekStart(double normalizedX) {
    setState(() {
      _isSeeking = true;
      _seekProgress = normalizedX.clamp(0.0, 1.0);
    });
  }

  void _onSeekUpdate(double normalizedX) {
    setState(() {
      _seekProgress = normalizedX.clamp(0.0, 1.0);
    });
  }

  void _onSeekEnd() {
    final position = Duration(
      milliseconds:
          (_seekProgress * _recordDuration.inMilliseconds).round(),
    );
    _player.seek(position);
    setState(() {
      _playPosition = position;
      _isSeeking = false;
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (_mode == VoiceRecordMode.preview) {
      return _buildPreviewMode();
    }
    return _buildRecordingMode();
  }

  Widget _buildRecordingMode() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: GlassTheme.blurLight, sigmaY: GlassTheme.blurLight),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: GlassTheme.background(widget.isDark),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: GlassTheme.border(widget.isDark),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: _stopAndPreview,
                child: Container(
                  width: 36,
                  height: 36,
                  margin: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.accentPrimary,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.stop_rounded,
                    color: AppColors.accentPrimary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AnimatedBuilder(
                  animation: _waveController,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: WaveformPainter(
                        amplitudes: _amplitudes,
                        progress: _waveController.value,
                        color: AppColors.accentPrimary,
                      ),
                      size: const Size(double.infinity, 28),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _formatDuration(_recordDuration),
                style: AppTypography.labelMedium(
                  color: widget.isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ).copyWith(
                  fontFeatures: [const FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _stopAndSend,
                child: Container(
                  width: 36,
                  height: 36,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.accentPrimary, AppColors.accentHover],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewMode() {
    final displayProgress = _isSeeking
        ? _seekProgress
        : (_recordDuration.inMilliseconds > 0
            ? (_playPosition.inMilliseconds / _recordDuration.inMilliseconds)
                .clamp(0.0, 1.0)
            : 0.0);

    final showCurrentTime = _isPlaying || _playPosition > Duration.zero;

    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: GlassTheme.blurLight, sigmaY: GlassTheme.blurLight),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: GlassTheme.background(widget.isDark),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: GlassTheme.border(widget.isDark),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: _deleteRecording,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 4),
                  child: Icon(
                    Icons.delete_rounded,
                    color: AppColors.error,
                    size: 22,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _togglePlayback,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.accentPrimary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _isPlaying
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    color: AppColors.accentPrimary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Listener(
                      behavior: HitTestBehavior.opaque,
                      onPointerDown: (event) {
                        _onSeekStart(
                            event.localPosition.dx / constraints.maxWidth);
                      },
                      onPointerMove: (event) {
                        if (_isSeeking) {
                          _onSeekUpdate(
                              event.localPosition.dx / constraints.maxWidth);
                        }
                      },
                      onPointerUp: (event) {
                        if (_isSeeking) _onSeekEnd();
                      },
                      onPointerCancel: (event) {
                        if (_isSeeking) _onSeekEnd();
                      },
                      child: CustomPaint(
                        painter: _PreviewWaveformPainter(
                          amplitudes: _recordedAmplitudes,
                          progress: displayProgress,
                          activeColor: AppColors.accentPrimary,
                          inactiveColor: widget.isDark
                              ? Colors.white.withValues(alpha: 0.2)
                              : Colors.black.withValues(alpha: 0.15),
                        ),
                        size: Size(constraints.maxWidth, 28),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _formatDuration(
                    showCurrentTime ? _playPosition : _recordDuration),
                style: AppTypography.labelSmall(
                  color: widget.isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ).copyWith(
                  fontFeatures: [const FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: _sendRecording,
                child: Container(
                  width: 36,
                  height: 36,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.accentPrimary, AppColors.accentHover],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Push-to-talk pill (compact, suit le doigt)
// ---------------------------------------------------------------------------

class PushToTalkPill extends StatefulWidget {
  final List<double> amplitudes;
  final Duration duration;
  final bool isDark;
  final double cancelProgress; // 0.0 → 1.0

  const PushToTalkPill({
    super.key,
    required this.amplitudes,
    required this.duration,
    required this.isDark,
    this.cancelProgress = 0.0,
  });

  @override
  State<PushToTalkPill> createState() => _PushToTalkPillState();
}

class _PushToTalkPillState extends State<PushToTalkPill>
    with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final cp = widget.cancelProgress.clamp(0.0, 1.0);
    final borderColor = Color.lerp(
      AppColors.accentPrimary.withValues(alpha: 0.3),
      AppColors.error.withValues(alpha: 0.6),
      cp,
    )!;
    final waveColor = Color.lerp(
      AppColors.accentPrimary,
      AppColors.error,
      cp,
    )!;
    final iconColor = waveColor;

    return ClipRRect(
      borderRadius: BorderRadius.circular(23),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: GlassTheme.blurLight, sigmaY: GlassTheme.blurLight),
        child: Container(
          width: 170,
          height: 46,
          decoration: BoxDecoration(
            color: GlassTheme.background(widget.isDark),
            borderRadius: BorderRadius.circular(23),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Icon(
                cp > 0.8 ? Icons.close_rounded : Icons.mic_rounded,
                color: iconColor,
                size: 18,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: AnimatedBuilder(
                  animation: _waveController,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: WaveformPainter(
                        amplitudes: widget.amplitudes,
                        progress: _waveController.value,
                        color: waveColor,
                      ),
                      size: const Size(double.infinity, 28),
                    );
                  },
                ),
              ),
              const SizedBox(width: 6),
              Text(
                _formatDuration(widget.duration),
                style: AppTypography.labelSmall(
                  color: widget.isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ).copyWith(
                  fontFeatures: [const FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bouton micro avec push-to-talk + swipe-to-cancel
// ---------------------------------------------------------------------------

class VoiceMicButton extends StatefulWidget {
  final VoidCallback onTap;
  final Function(String path, Duration duration) onPushToTalkComplete;
  final VoidCallback? onPushToTalkStart;
  final void Function(double amplitude, Duration duration)? onPushToTalkUpdate;
  final void Function(Offset offset)? onPushToTalkDragUpdate;
  final VoidCallback? onPushToTalkCancel;
  final bool isDark;

  const VoiceMicButton({
    super.key,
    required this.onTap,
    required this.onPushToTalkComplete,
    this.onPushToTalkStart,
    this.onPushToTalkUpdate,
    this.onPushToTalkDragUpdate,
    this.onPushToTalkCancel,
    required this.isDark,
  });

  @override
  State<VoiceMicButton> createState() => _VoiceMicButtonState();
}

class _VoiceMicButtonState extends State<VoiceMicButton>
    with SingleTickerProviderStateMixin {
  static const double _cancelThreshold = 100.0;

  bool _isLongPressing = false;
  bool _wasInCancelZone = false;
  Offset _lastDragOffset = Offset.zero;
  AudioRecorder? _recorder;
  String? _recordingPath;
  DateTime? _recordStartTime;
  Timer? _amplitudeTimer;
  Duration _pttDuration = Duration.zero;
  late AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 1.0,
      upperBound: 1.3,
    );
  }

  @override
  void dispose() {
    _amplitudeTimer?.cancel();
    _scaleController.dispose();
    _recorder?.dispose();
    super.dispose();
  }

  Future<void> _startPushToTalk() async {
    // Vibration immédiate avant tout
    HapticFeedback.mediumImpact();

    _wasInCancelZone = false;
    _lastDragOffset = Offset.zero;
    _recorder = AudioRecorder();

    if (!await _recorder!.hasPermission()) {
      _recorder?.dispose();
      _recorder = null;
      return;
    }

    if (!mounted) {
      _recorder?.dispose();
      _recorder = null;
      return;
    }

    setState(() => _isLongPressing = true);
    _scaleController.forward();
    _pttDuration = Duration.zero;
    widget.onPushToTalkStart?.call();

    final tempDir = await getTemporaryDirectory();
    if (!mounted) {
      _recorder?.dispose();
      _recorder = null;
      return;
    }

    _recordingPath =
        '${tempDir.path}/voice_ptt_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _recordStartTime = DateTime.now();

    try {
      await _recorder!.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _recordingPath!,
      );

      _amplitudeTimer =
          Timer.periodic(const Duration(milliseconds: 80), (timer) async {
        if (_recorder != null && mounted && _isLongPressing) {
          try {
            final amp = await _recorder!.getAmplitude();
            if (!mounted || !_isLongPressing) return;
            final normalized =
                ((amp.current + 60) / 60).clamp(0.15, 1.0);
            _pttDuration += const Duration(milliseconds: 80);
            widget.onPushToTalkUpdate?.call(normalized, _pttDuration);
          } catch (e) {
            debugPrint('[VoiceRecorderWidget] Getting amplitude failed: $e');
          }
        }
      });
    } catch (e) {
      debugPrint('Error starting PTT recording: $e');
      _cancelPushToTalk();
    }
  }

  void _onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    _lastDragOffset = details.offsetFromOrigin;
    widget.onPushToTalkDragUpdate?.call(details.offsetFromOrigin);

    final inCancelZone = details.offsetFromOrigin.dx < -_cancelThreshold;
    if (inCancelZone != _wasInCancelZone) {
      HapticFeedback.lightImpact();
    }
    _wasInCancelZone = inCancelZone;
  }

  Future<void> _endPushToTalk() async {
    if (!_isLongPressing || _recorder == null) return;

    // Relâché dans la zone d'annulation → cancel
    if (_lastDragOffset.dx < -_cancelThreshold) {
      _cancelPushToTalk();
      return;
    }

    _amplitudeTimer?.cancel();
    _amplitudeTimer = null;

    final recorder = _recorder;
    final startTime = _recordStartTime;

    if (mounted) {
      setState(() => _isLongPressing = false);
    }
    _scaleController.reverse();

    final duration = startTime != null
        ? DateTime.now().difference(startTime)
        : Duration.zero;

    String? path;
    try {
      path = await recorder?.stop();
    } catch (e) {
      debugPrint('Error stopping PTT recording: $e');
    }

    recorder?.dispose();
    _recorder = null;

    if (!mounted) return;

    if (path != null && duration.inMilliseconds > 500) {
      HapticFeedback.mediumImpact();
      widget.onPushToTalkComplete(path, duration);
    } else {
      HapticFeedback.lightImpact();
      widget.onPushToTalkCancel?.call();
    }
  }

  void _cancelPushToTalk() {
    _amplitudeTimer?.cancel();
    _amplitudeTimer = null;

    if (mounted) {
      setState(() => _isLongPressing = false);
    }
    _scaleController.reverse();
    _recorder?.stop();
    _recorder?.dispose();
    _recorder = null;
    HapticFeedback.heavyImpact();
    widget.onPushToTalkCancel?.call();
  }

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      behavior: HitTestBehavior.opaque,
      gestures: {
        LongPressGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
          () => LongPressGestureRecognizer(
            duration: const Duration(milliseconds: 100),
          ),
          (recognizer) {
            recognizer.onLongPressStart = (_) => _startPushToTalk();
            recognizer.onLongPressMoveUpdate = _onLongPressMoveUpdate;
            recognizer.onLongPressEnd = (_) => _endPushToTalk();
            recognizer.onLongPressCancel = _cancelPushToTalk;
          },
        ),
        TapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
          () => TapGestureRecognizer(),
          (recognizer) {
            recognizer.onTap = () {
              if (!_isLongPressing) {
                HapticFeedback.lightImpact();
                widget.onTap();
              }
            };
          },
        ),
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ScaleTransition(
          scale: _scaleController,
          child: Icon(
            Icons.mic_rounded,
            color: _isLongPressing
                ? AppColors.accentPrimary
                : widget.isDark
                    ? Colors.white
                    : Colors.black,
            size: 24,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Painters
// ---------------------------------------------------------------------------

/// Waveform animé (enregistrement + PTT)
class WaveformPainter extends CustomPainter {
  final List<double> amplitudes;
  final double progress;
  final Color color;

  WaveformPainter({
    required this.amplitudes,
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final barCount = amplitudes.length;
    final barWidth = size.width / barCount;
    final centerY = size.height / 2;

    for (int i = 0; i < barCount; i++) {
      final x = i * barWidth + barWidth / 2;
      final waveOffset =
          math.sin((i / barCount * 2 * math.pi) + (progress * 2 * math.pi)) *
              0.15;
      final amplitude = (amplitudes[i] + waveOffset).clamp(0.1, 1.0);

      final barHeight = amplitude * (size.height - 4);
      final y1 = centerY - barHeight / 2;
      final y2 = centerY + barHeight / 2;

      canvas.drawLine(Offset(x, y1), Offset(x, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.amplitudes != amplitudes;
  }
}

/// Waveform de preview avec progression de lecture
class _PreviewWaveformPainter extends CustomPainter {
  final List<double> amplitudes;
  final double progress;
  final Color activeColor;
  final Color inactiveColor;

  _PreviewWaveformPainter({
    required this.amplitudes,
    required this.progress,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (amplitudes.isEmpty) return;

    const int barCount = 50;
    final barSpacing = size.width / barCount;
    final centerY = size.height / 2;
    final progressX = progress * size.width;
    final maxBarHeight = (size.height - 4) / 2;

    final activePaint = Paint()
      ..color = activeColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final inactivePaint = Paint()
      ..color = inactiveColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < barCount; i++) {
      final x = i * barSpacing + barSpacing / 2;

      final sampleStart = (i / barCount * amplitudes.length).floor();
      final sampleEnd = ((i + 1) / barCount * amplitudes.length).ceil();
      double amp = 0.0;
      int count = 0;
      for (int j = sampleStart;
          j < sampleEnd && j < amplitudes.length;
          j++) {
        amp += amplitudes[j];
        count++;
      }
      if (count > 0) amp /= count;
      amp = amp.clamp(0.1, 1.0);

      final halfHeight = amp * maxBarHeight;
      final y1 = centerY - halfHeight;
      final y2 = centerY + halfHeight;

      canvas.drawLine(
        Offset(x, y1),
        Offset(x, y2),
        x <= progressX ? activePaint : inactivePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _PreviewWaveformPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.amplitudes != amplitudes;
  }
}
