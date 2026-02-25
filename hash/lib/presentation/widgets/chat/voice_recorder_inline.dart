import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

/// Enregistreur vocal inline avec vagues animées
class InlineVoiceRecorder extends StatefulWidget {
  final Function(String path, Duration duration) onRecordComplete;
  final VoidCallback onCancel;
  final bool isDark;

  const InlineVoiceRecorder({
    super.key,
    required this.onRecordComplete,
    required this.onCancel,
    required this.isDark,
  });

  @override
  State<InlineVoiceRecorder> createState() => _InlineVoiceRecorderState();
}

class _InlineVoiceRecorderState extends State<InlineVoiceRecorder>
    with TickerProviderStateMixin {
  final AudioRecorder _recorder = AudioRecorder();

  bool _isPaused = false;
  Duration _duration = Duration.zero;
  Timer? _timer;
  String? _recordingPath;

  late AnimationController _waveController;
  late AnimationController _pulseController;
  final List<double> _amplitudes = List.filled(40, 0.3);
  int _amplitudeIndex = 0;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _startRecording();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _waveController.dispose();
    _pulseController.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (!await _recorder.hasPermission()) {
      widget.onCancel();
      return;
    }

    final tempDir = await getTemporaryDirectory();
    _recordingPath = '${tempDir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

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
        if (!_isPaused && mounted) {
          final amplitude = await _recorder.getAmplitude();
          final normalized = ((amplitude.current + 60) / 60).clamp(0.15, 1.0);

          setState(() {
            _duration += const Duration(milliseconds: 80);
            _amplitudes[_amplitudeIndex] = normalized;
            _amplitudeIndex = (_amplitudeIndex + 1) % _amplitudes.length;
          });
        }
      });
    } catch (e) {
      debugPrint('Error starting recording: $e');
      widget.onCancel();
    }
  }

  Future<void> _stopRecording({bool send = true}) async {
    _timer?.cancel();

    String? path;
    try {
      path = await _recorder.stop();
    } catch (e) {
      debugPrint('Error stopping recording: $e');
    }

    if (send && path != null && _duration.inMilliseconds > 500) {
      HapticFeedback.mediumImpact();
      widget.onRecordComplete(path, _duration);
    } else {
      HapticFeedback.lightImpact();
      widget.onCancel();
    }
  }

  void _togglePause() async {
    HapticFeedback.selectionClick();
    if (_isPaused) {
      await _recorder.resume();
    } else {
      await _recorder.pause();
    }
    setState(() => _isPaused = !_isPaused);
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        // Fond glass avec teinte rouge subtile
        color: widget.isDark
            ? AppColors.error.withValues(alpha: 0.08)
            : AppColors.error.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(22),
        // Bordure lumineuse rouge
        border: Border.all(
          color: AppColors.error.withValues(alpha: 0.3),
          width: 1.5,
        ),
        // Ombre légère
        boxShadow: [
          BoxShadow(
            color: AppColors.error.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Cancel button
          GestureDetector(
            onTap: () => _stopRecording(send: false),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.delete_rounded,
                color: AppColors.error,
                size: 22,
              ),
            ),
          ),

          // Waveform
          Expanded(
            child: AnimatedBuilder(
              animation: _waveController,
              builder: (context, child) {
                return CustomPaint(
                  painter: _WaveformPainter(
                    amplitudes: _amplitudes,
                    progress: _waveController.value,
                    color: AppColors.error,
                    isPaused: _isPaused,
                  ),
                  size: const Size(double.infinity, 28),
                );
              },
            ),
          ),

          // Duration with pulse
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _isPaused
                            ? AppColors.error.withValues(alpha: 0.5)
                            : AppColors.error.withValues(
                                alpha: 0.6 + _pulseController.value * 0.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _formatDuration(_duration),
                      style: AppTypography.labelMedium(
                        color: widget.isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(
                        fontFeatures: [const FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // Pause button
          GestureDetector(
            onTap: _togglePause,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                _isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                color: widget.isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                size: 24,
              ),
            ),
          ),

          // Send button avec effet glass
          GestureDetector(
            onTap: () => _stopRecording(send: true),
            child: Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.accentPrimary, AppColors.accentHover],
                ),
                shape: BoxShape.circle,
                // Bordure lumineuse
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Highlight reflet
                  Positioned(
                    top: 3,
                    left: 5,
                    right: 5,
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withValues(alpha: 0.35),
                            Colors.white.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter pour les vagues fluides
class _WaveformPainter extends CustomPainter {
  final List<double> amplitudes;
  final double progress;
  final Color color;
  final bool isPaused;

  _WaveformPainter({
    required this.amplitudes,
    required this.progress,
    required this.color,
    required this.isPaused,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isPaused ? color.withValues(alpha: 0.4) : color
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final barCount = amplitudes.length;
    final barWidth = size.width / barCount;
    final centerY = size.height / 2;

    // Dessiner les barres avec effet de vague
    for (int i = 0; i < barCount; i++) {
      final x = i * barWidth + barWidth / 2;

      // Effet de vague fluide
      final waveOffset = math.sin((i / barCount * 2 * math.pi) + (progress * 2 * math.pi)) * 0.15;
      final amplitude = (amplitudes[i] + waveOffset).clamp(0.1, 1.0);

      final barHeight = amplitude * (size.height - 4);
      final y1 = centerY - barHeight / 2;
      final y2 = centerY + barHeight / 2;

      canvas.drawLine(Offset(x, y1), Offset(x, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.isPaused != isPaused ||
        oldDelegate.amplitudes != amplitudes;
  }
}
