import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/call_permission_helper.dart';

class VoiceRecorderButton extends StatefulWidget {
  final Function(String path, Duration duration) onRecordComplete;
  final bool isDark;
  final bool compact;

  const VoiceRecorderButton({
    super.key,
    required this.onRecordComplete,
    required this.isDark,
    this.compact = false,
  });

  @override
  State<VoiceRecorderButton> createState() => _VoiceRecorderButtonState();
}

class _VoiceRecorderButtonState extends State<VoiceRecorderButton>
    with TickerProviderStateMixin {
  final AudioRecorder _recorder = AudioRecorder();

  bool _isRecording = false;
  bool _isLongPress = false;
  bool _isCancelled = false;
  bool _isPaused = false;
  Duration _recordingDuration = Duration.zero;
  Timer? _durationTimer;
  double _dragOffset = 0;
  String? _recordingPath;
  final List<double> _amplitudes = [];

  late AnimationController _pulseController;
  late AnimationController _waveController;

  static const double _cancelThreshold = -100;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    _durationTimer?.cancel();
    _pulseController.dispose();
    _waveController.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording({bool isLongPress = false}) async {
    // Check permission with proper UI feedback
    if (!await _recorder.hasPermission()) {
      if (mounted) {
        await PermissionHelper.requestMicrophoneRecord(context);
      }
      return;
    }

    HapticFeedback.mediumImpact();

    // Get temp directory for recording
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

      setState(() {
        _isRecording = true;
        _isLongPress = isLongPress;
        _isCancelled = false;
        _isPaused = false;
        _recordingDuration = Duration.zero;
        _dragOffset = 0;
        _amplitudes.clear();
      });

      _pulseController.repeat(reverse: true);
      _waveController.repeat();

      _durationTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) async {
        if (mounted && _isRecording && !_isPaused) {
          // Get amplitude for waveform
          final amplitude = await _recorder.getAmplitude();
          final normalizedAmplitude = ((amplitude.current + 60) / 60).clamp(0.0, 1.0);

          setState(() {
            _recordingDuration += const Duration(milliseconds: 100);
            _amplitudes.add(normalizedAmplitude);
            if (_amplitudes.length > 50) {
              _amplitudes.removeAt(0);
            }
          });
        }
      });
    } catch (e) {
      debugPrint('Error starting recording: $e');
    }
  }

  Future<void> _pauseRecording() async {
    if (!_isRecording || _isPaused) return;

    HapticFeedback.selectionClick();
    await _recorder.pause();
    setState(() => _isPaused = true);
  }

  Future<void> _resumeRecording() async {
    if (!_isRecording || !_isPaused) return;

    HapticFeedback.selectionClick();
    await _recorder.resume();
    setState(() => _isPaused = false);
  }

  Future<void> _stopRecording({bool send = true}) async {
    _durationTimer?.cancel();
    _pulseController.stop();
    _waveController.stop();

    String? path;
    try {
      path = await _recorder.stop();
    } catch (e) {
      debugPrint('Error stopping recording: $e');
    }

    if (send && !_isCancelled && _recordingDuration.inMilliseconds > 500 && path != null) {
      HapticFeedback.lightImpact();
      widget.onRecordComplete(path, _recordingDuration);
    } else if (_isCancelled) {
      HapticFeedback.heavyImpact();
    }

    setState(() {
      _isRecording = false;
      _isLongPress = false;
      _isCancelled = false;
      _isPaused = false;
      _dragOffset = 0;
      _amplitudes.clear();
    });
  }

  void _onTap() {
    if (_isRecording) {
      if (_isPaused) {
        _resumeRecording();
      } else {
        _pauseRecording();
      }
    } else {
      _startRecording(isLongPress: false);
    }
  }

  void _onLongPressStart(LongPressStartDetails details) {
    _startRecording(isLongPress: true);
  }

  void _onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    setState(() {
      _dragOffset = details.offsetFromOrigin.dx;
      if (_dragOffset < _cancelThreshold && !_isCancelled) {
        _isCancelled = true;
        HapticFeedback.mediumImpact();
      } else if (_dragOffset >= _cancelThreshold && _isCancelled) {
        _isCancelled = false;
        HapticFeedback.selectionClick();
      }
    });
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    _stopRecording(send: !_isCancelled);
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    final tenths = (duration.inMilliseconds % 1000) ~/ 100;
    return '$minutes:${seconds.toString().padLeft(2, '0')}.$tenths';
  }

  @override
  Widget build(BuildContext context) {
    if (_isRecording) {
      return _buildRecordingUI();
    }

    return GestureDetector(
      onTap: _onTap,
      onLongPressStart: _onLongPressStart,
      onLongPressMoveUpdate: _onLongPressMoveUpdate,
      onLongPressEnd: _onLongPressEnd,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.compact ? 36 : 48,
        height: widget.compact ? 36 : 48,
        decoration: BoxDecoration(
          color: widget.compact
              ? (widget.isDark
                  ? AppColors.glassBackgroundDark.withValues(alpha: 0.08)
                  : AppColors.glassBackgroundLight.withValues(alpha: 0.3))
              : (widget.isDark ? Colors.black : Colors.white),
          shape: BoxShape.circle,
          border: widget.compact
              ? Border.all(
                  color: widget.isDark
                      ? AppColors.glassBorderDark.withValues(alpha: 0.1)
                      : AppColors.glassBorderLight.withValues(alpha: 0.4),
                  width: 1,
                )
              : null,
        ),
        child: Icon(
          Icons.mic_rounded,
          color: widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          size: widget.compact ? 20 : 24,
        ),
      ),
    );
  }

  Widget _buildRecordingUI() {
    // Optimisé - sans BackdropFilter
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: widget.isDark
            ? AppColors.darkBackground
            : AppColors.lightBackground,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: _isCancelled
              ? AppColors.error.withValues(alpha: 0.5)
              : (widget.isDark
                  ? Colors.white.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.08)),
          width: 1,
        ),
      ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Cancel indicator (slide left) - only for long press mode
              if (_isLongPress)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _dragOffset < -20 ? 1 : 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.delete_outline_rounded,
                          color: _isCancelled
                              ? AppColors.error
                              : (widget.isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Annuler',
                          style: AppTypography.labelSmall(
                            color: _isCancelled
                                ? AppColors.error
                                : (widget.isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Waveform visualization (tap mode only)
              if (!_isLongPress)
                Container(
                  width: 70,
                  height: 32,
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: CustomPaint(
                    painter: _WaveformPainter(
                      data: _amplitudes,
                      color: _isCancelled ? AppColors.error : AppColors.accentPrimary,
                      isPaused: _isPaused,
                    ),
                  ),
                ),

              // Duration display - glass style pill
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: _isCancelled
                      ? AppColors.error.withValues(alpha: 0.12)
                      : AppColors.accentPrimary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isCancelled
                        ? AppColors.error.withValues(alpha: 0.2)
                        : AppColors.accentPrimary.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Recording indicator with pulse
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        return Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _isPaused
                                ? AppColors.accentPrimary.withValues(alpha: 0.5)
                                : (_isCancelled
                                    ? AppColors.error
                                    : AppColors.error
                                        .withValues(alpha: 0.6 + _pulseController.value * 0.4)),
                            shape: BoxShape.circle,
                            boxShadow: _isPaused
                                ? null
                                : [
                                    BoxShadow(
                                      color: (_isCancelled ? AppColors.error : AppColors.error)
                                          .withValues(alpha: 0.4 * _pulseController.value),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDuration(_recordingDuration),
                      style: AppTypography.labelLarge(
                        color: _isCancelled
                            ? AppColors.error
                            : (widget.isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight),
                      ).copyWith(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 6),

              // Controls row for tap mode
              if (!_isLongPress) ...[
                // Delete button - glass style
                _GlassRecordButton(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    setState(() => _isCancelled = true);
                    _stopRecording(send: false);
                  },
                  isDark: widget.isDark,
                  icon: Icons.delete_outline_rounded,
                  color: AppColors.error,
                  size: 40,
                ),
                const SizedBox(width: 4),
                // Pause/Play button - glass style
                _GlassRecordButton(
                  onTap: _onTap,
                  isDark: widget.isDark,
                  icon: _isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                  color: widget.isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  size: 40,
                ),
                const SizedBox(width: 4),
                // Send button - accent filled
                _buildSendButton(),
              ] else ...[
                // Mic button with waves (long press mode)
                GestureDetector(
                  onLongPressMoveUpdate: _onLongPressMoveUpdate,
                  onLongPressEnd: _onLongPressEnd,
                  child: SizedBox(
                    width: 64,
                    height: 52,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Animated waves
                        ...List.generate(3, (index) {
                          return AnimatedBuilder(
                            animation: _waveController,
                            builder: (context, child) {
                              final delay = index * 0.3;
                              final progress = (_waveController.value + delay) % 1.0;
                              final scale = 1.0 + progress * 0.4;
                              final opacity = (1.0 - progress) * 0.4;

                              return Transform.scale(
                                scale: scale,
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: (_isCancelled ? AppColors.error : AppColors.accentPrimary)
                                          .withValues(alpha: opacity),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),

                        // Main button
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: _isCancelled
                                  ? [AppColors.error, AppColors.error.withValues(alpha: 0.8)]
                                  : [AppColors.accentPrimary, AppColors.accentHover],
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: (_isCancelled ? AppColors.error : AppColors.accentPrimary)
                                    .withValues(alpha: 0.4),
                                blurRadius: 16,
                                spreadRadius: -2,
                              ),
                            ],
                          ),
                          child: Icon(
                            _isCancelled ? Icons.close_rounded : Icons.mic_rounded,
                            color: _isCancelled ? Colors.white : Colors.black.withValues(alpha: 0.85),
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
    ).animate().fadeIn(duration: 200.ms).scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          duration: 200.ms,
          curve: Curves.easeOutCubic,
        );
  }

  Widget _buildSendButton() {
    return GestureDetector(
      onTap: () => _stopRecording(send: true),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.accentPrimary, AppColors.accentHover],
          ),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.25),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.accentPrimary.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 2),
              spreadRadius: -2,
            ),
            BoxShadow(
              color: AppColors.accentPrimary.withValues(alpha: 0.2),
              blurRadius: 20,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Highlight effect
            Positioned(
              top: 5,
              left: 5,
              right: 5,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withValues(alpha: 0.3),
                      Colors.white.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_upward_rounded,
              color: Colors.black.withValues(alpha: 0.85),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

/// Expandable voice recorder for full-screen recording
class ExpandedVoiceRecorder extends StatefulWidget {
  final VoidCallback onCancel;
  final Function(String path, Duration duration) onSend;
  final bool isDark;

  const ExpandedVoiceRecorder({
    super.key,
    required this.onCancel,
    required this.onSend,
    required this.isDark,
  });

  @override
  State<ExpandedVoiceRecorder> createState() => _ExpandedVoiceRecorderState();
}

class _ExpandedVoiceRecorderState extends State<ExpandedVoiceRecorder>
    with TickerProviderStateMixin {
  final AudioRecorder _recorder = AudioRecorder();

  Duration _duration = Duration.zero;
  Timer? _timer;
  bool _isPaused = false;
  final List<double> _waveformData = [];
  String? _recordingPath;

  late AnimationController _waveformController;

  @override
  void initState() {
    super.initState();
    _waveformController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..repeat();

    _startRecording();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _waveformController.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (!await _recorder.hasPermission()) {
      if (mounted) {
        await PermissionHelper.requestMicrophoneRecord(context);
      }
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

      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) async {
        if (!_isPaused && mounted) {
          final amplitude = await _recorder.getAmplitude();
          final normalizedAmplitude = ((amplitude.current + 60) / 60).clamp(0.0, 1.0);

          setState(() {
            _duration += const Duration(milliseconds: 100);
            _waveformData.add(normalizedAmplitude);
            if (_waveformData.length > 50) {
              _waveformData.removeAt(0);
            }
          });
        }
      });
    } catch (e) {
      debugPrint('Error starting recording: $e');
      widget.onCancel();
    }
  }

  Future<void> _togglePause() async {
    HapticFeedback.selectionClick();
    if (_isPaused) {
      await _recorder.resume();
    } else {
      await _recorder.pause();
    }
    setState(() => _isPaused = !_isPaused);
  }

  Future<void> _send() async {
    _timer?.cancel();
    final path = await _recorder.stop();
    if (path != null && _duration.inMilliseconds > 500) {
      widget.onSend(path, _duration);
    } else {
      widget.onCancel();
    }
  }

  Future<void> _cancel() async {
    _timer?.cancel();
    await _recorder.stop();
    widget.onCancel();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    // Optimisé - sans BackdropFilter
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: widget.isDark
            ? Colors.black
            : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(
          top: BorderSide(
            color: widget.isDark
                ? Colors.white.withValues(alpha: 0.06)
                : Colors.black.withValues(alpha: 0.08),
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: widget.isDark
                  ? Colors.white.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),

          // Waveform visualization
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: widget.isDark
                  ? AppColors.darkBackground
                  : AppColors.lightBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: widget.isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
            child: AnimatedBuilder(
              animation: _waveformController,
              builder: (context, child) {
                return CustomPaint(
                  painter: _WaveformPainter(
                    data: _waveformData,
                    color: AppColors.accentPrimary,
                    isPaused: _isPaused,
                  ),
                  size: Size.infinite,
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Duration
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.accentPrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              _formatDuration(_duration),
              style: AppTypography.headlineLarge(
                color: widget.isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ).copyWith(
                fontFamily: 'monospace',
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Controls - simple buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Cancel button
              _SimpleControlButton(
                icon: Icons.delete_outline_rounded,
                color: AppColors.error,
                onTap: _cancel,
                isDark: widget.isDark,
              ),

              // Pause/Resume button - larger
              _SimpleControlButton(
                icon: _isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                color: widget.isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                onTap: _togglePause,
                isDark: widget.isDark,
                size: 72,
              ),

              // Send button - accent filled
              _SimpleSendControlButton(
                onTap: _send,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Simple control button for expanded recorder
class _SimpleControlButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool isDark;
  final double size;

  const _SimpleControlButton({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.isDark,
    this.size = 56,
  });

  @override
  State<_SimpleControlButton> createState() => _SimpleControlButtonState();
}

class _SimpleControlButtonState extends State<_SimpleControlButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        HapticFeedback.lightImpact();
        widget.onTap();
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.92 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.icon,
            color: widget.color,
            size: widget.size * 0.45,
          ),
        ),
      ),
    );
  }
}

/// Simple send button for expanded recorder
class _SimpleSendControlButton extends StatefulWidget {
  final VoidCallback onTap;

  const _SimpleSendControlButton({
    required this.onTap,
  });

  @override
  State<_SimpleSendControlButton> createState() => _SimpleSendControlButtonState();
}

class _SimpleSendControlButtonState extends State<_SimpleSendControlButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        HapticFeedback.mediumImpact();
        widget.onTap();
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.92 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.accentPrimary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.accentPrimary.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.send_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
    );
  }
}

/// Glass-style button for recording controls
class _GlassRecordButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool isDark;
  final IconData icon;
  final Color color;
  final double size;

  const _GlassRecordButton({
    required this.onTap,
    required this.isDark,
    required this.icon,
    required this.color,
    this.size = 40,
  });

  @override
  State<_GlassRecordButton> createState() => _GlassRecordButtonState();
}

class _GlassRecordButtonState extends State<_GlassRecordButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pressController.forward(),
      onTapUp: (_) => _pressController.reverse(),
      onTapCancel: () => _pressController.reverse(),
      onTap: () {
        HapticFeedback.lightImpact();
        widget.onTap();
      },
      child: AnimatedBuilder(
        animation: _pressController,
        builder: (context, child) {
          final scale = 1.0 - (_pressController.value * 0.1);

          return Transform.scale(
            scale: scale,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Icon(
                widget.icon,
                color: widget.color,
                size: widget.size * 0.5,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  final List<double> data;
  final Color color;
  final bool isPaused;

  _WaveformPainter({
    required this.data,
    required this.color,
    required this.isPaused,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = isPaused ? color.withValues(alpha: 0.5) : color
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final barWidth = size.width / 50;
    final maxHeight = size.height;

    for (int i = 0; i < data.length; i++) {
      final x = i * barWidth + barWidth / 2;
      final height = data[i] * maxHeight;
      final y1 = (maxHeight - height) / 2;
      final y2 = y1 + height;

      canvas.drawLine(
        Offset(x, y1),
        Offset(x, y2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) {
    return oldDelegate.data != data || oldDelegate.isPaused != isPaused;
  }
}
