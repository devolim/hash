import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import 'attachment_picker.dart';
import 'voice_recorder_widget.dart';
import 'hash_camera_screen.dart';

enum MessageContentType { text, image, video, audio, file, contact, location }

class MessageInput extends StatefulWidget {
  final Function(String, {MessageContentType type, String? filePath, bool isViewOnce, int? viewOnceDuration}) onSend;
  final VoidCallback? onAttach;
  final String? contactId;
  final VoidCallback? onRecordingStarted;

  const MessageInput({
    super.key,
    required this.onSend,
    this.onAttach,
    this.contactId,
    this.onRecordingStarted,
  });

  @override
  State<MessageInput> createState() => MessageInputState();
}

class MessageInputState extends State<MessageInput> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _hasText = false;
  bool _showAttachmentPicker = false;
  bool _isRecording = false;

  // Push-to-talk state
  bool _isPushToTalk = false;
  bool _pttCancelling = false;
  final List<double> _pttAmplitudes = List.filled(20, 0.3);
  int _pttAmplitudeIndex = 0;
  Duration _pttDuration = Duration.zero;
  Offset _pttDragOffset = Offset.zero;

  late final AnimationController _pttAnimController;

  late final AnimationController _pickerAnimController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  bool get isAttachmentPickerOpen => _showAttachmentPicker;

  void requestFocus() {
    _focusNode.requestFocus();
  }

  void closeAttachmentPicker() {
    if (_showAttachmentPicker) {
      _pickerAnimController.reverse().then((_) {
        if (mounted) setState(() => _showAttachmentPicker = false);
      });
    }
  }

  void _openAttachmentPicker() {
    setState(() => _showAttachmentPicker = true);
    _pickerAnimController.forward();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);

    _pickerAnimController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Commence en bas (hors écran)
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _pickerAnimController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pickerAnimController,
      curve: Curves.easeOut,
    ));

    _pttAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _pttAnimController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed && _isPushToTalk) {
        setState(() {
          _isPushToTalk = false;
          _pttDragOffset = Offset.zero;
          _pttCancelling = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    _pickerAnimController.dispose();
    _pttAnimController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.trim().isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      HapticFeedback.mediumImpact();
      widget.onSend(text, type: MessageContentType.text, isViewOnce: false);
      _controller.clear();
      _focusNode.requestFocus();
    }
  }

  void _openCamera() async {
    HapticFeedback.lightImpact();
    // Empêcher le TextField de capturer le focus pendant la navigation
    _focusNode.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            HashCameraScreen(contactId: widget.contactId),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );

    if (result != null && mounted) {
      final type = result['type'] as String;
      final path = result['path'] as String;
      final isViewOnce = result['isViewOnce'] as bool? ?? false;
      final viewOnceDuration = result['viewOnceDuration'] as int?;
      widget.onSend(
        path,
        type: type == 'video' ? MessageContentType.video : MessageContentType.image,
        filePath: path,
        isViewOnce: isViewOnce,
        viewOnceDuration: viewOnceDuration,
      );
    }
  }

  void _toggleAttachmentPicker() {
    HapticFeedback.lightImpact();
    if (_showAttachmentPicker) {
      closeAttachmentPicker();
    } else {
      _openAttachmentPicker();
    }
  }

  void _onAttachmentSelected(AttachmentType type,
      {String? path, List<String>? paths, Map<String, dynamic>? extra}) {
    closeAttachmentPicker();

    switch (type) {
      case AttachmentType.photo:
        if (path != null) {
          final isViewOnce = extra?['isViewOnce'] as bool? ?? false;
          final viewOnceDuration = extra?['viewOnceDuration'] as int?;
          widget.onSend(path, type: MessageContentType.image, filePath: path, isViewOnce: isViewOnce, viewOnceDuration: viewOnceDuration);
        }
        break;
      case AttachmentType.video:
        if (path != null) {
          final isViewOnce = extra?['isViewOnce'] as bool? ?? false;
          final viewOnceDuration = extra?['viewOnceDuration'] as int?;
          widget.onSend(path, type: MessageContentType.video, filePath: path, isViewOnce: isViewOnce, viewOnceDuration: viewOnceDuration);
        }
        break;
      case AttachmentType.file:
        if (path != null) {
          widget.onSend(path, type: MessageContentType.file, filePath: path, isViewOnce: false);
        }
        break;
      case AttachmentType.contact:
        if (extra != null) {
          widget.onSend(extra['name'] ?? '', type: MessageContentType.contact, isViewOnce: false);
        }
        break;
      case AttachmentType.location:
        if (extra != null) {
          final lat = extra['lat'];
          final lng = extra['lng'];
          final address = extra['address'] as String? ?? '';
          final content = address.isNotEmpty
              ? '$lat,$lng\n$address'
              : '$lat,$lng';
          widget.onSend(content, type: MessageContentType.location, isViewOnce: false);
        }
        break;
      case AttachmentType.camera:
        _openCamera();
        break;
      case AttachmentType.gallery:
        break;
    }
  }

  void _onVoiceRecordComplete(String path, Duration duration) {
    setState(() => _isRecording = false);
    widget.onSend(path, type: MessageContentType.audio, filePath: path, isViewOnce: false);
  }

  // Push-to-talk callbacks
  void _onPushToTalkStart() {
    widget.onRecordingStarted?.call();
    setState(() {
      _isPushToTalk = true;
      _pttCancelling = false;
      _pttDragOffset = Offset.zero;
      for (int i = 0; i < _pttAmplitudes.length; i++) {
        _pttAmplitudes[i] = 0.3;
      }
      _pttAmplitudeIndex = 0;
      _pttDuration = Duration.zero;
    });
    _pttAnimController.duration = const Duration(milliseconds: 250);
    _pttAnimController.forward(from: 0);
  }

  void _onPushToTalkDragUpdate(Offset offset) {
    if (!mounted) return;
    setState(() => _pttDragOffset = offset);
  }

  void _onPushToTalkUpdate(double amplitude, Duration duration) {
    if (!mounted) return;
    setState(() {
      _pttAmplitudes[_pttAmplitudeIndex] = amplitude;
      _pttAmplitudeIndex = (_pttAmplitudeIndex + 1) % _pttAmplitudes.length;
      _pttDuration = duration;
    });
  }

  void _onPushToTalkComplete(String path, Duration duration) {
    _pttAnimController.duration = const Duration(milliseconds: 200);
    _pttAnimController.reverse();
    widget.onSend(path, type: MessageContentType.audio, filePath: path, isViewOnce: false);
  }

  void _onPushToTalkCancel() {
    if (mounted) {
      setState(() => _pttCancelling = true);
      _pttAnimController.duration = const Duration(milliseconds: 300);
      _pttAnimController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Input bar — construit comme `child` de l'AnimatedBuilder pour garder
    // le FocusNode stable dans l'arbre de widgets (fix clavier iOS)
    Widget inputBar = SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Push-to-talk pill (compacte, animée)
            if (_isPushToTalk)
              SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: _pttAnimController,
                  curve: Curves.easeOutCubic,
                  reverseCurve: Curves.easeInCubic,
                ),
                axisAlignment: 1.0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedBuilder(
                      animation: _pttAnimController,
                      builder: (context, child) {
                        final v = _pttAnimController.value;

                        double slideX = _pttDragOffset.dx.clamp(-200.0, 0.0);
                        if (_pttCancelling) {
                          slideX += -(1 - v) * 100;
                        }

                        return Transform.translate(
                          offset: Offset(slideX, 0),
                          child: Opacity(
                            opacity: v.clamp(0.0, 1.0),
                            child: Transform.scale(
                              scale: (0.5 + 0.5 * v).clamp(0.5, 1.0),
                              alignment: Alignment.centerRight,
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: PushToTalkPill(
                        amplitudes: _pttAmplitudes,
                        duration: _pttDuration,
                        isDark: isDark,
                        cancelProgress: (_pttDragOffset.dx.abs() / 100.0).clamp(0.0, 1.0),
                      ),
                    ),
                  ),
                ),
              )
            else
              const SizedBox(width: double.infinity, height: 0),

            // Input row
            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Plus button — AnimatedBuilder séparé pour l'état isActive
                  SizedBox(
                    height: 44,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _pickerAnimController,
                        builder: (_, __) => _PlusButton(
                          isActive: _showAttachmentPicker,
                          onTap: _toggleAttachmentPicker,
                          isDark: isDark,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Text field ou Recording waveform
                  Expanded(
                    child: _isRecording
                        ? VoiceRecorderWidget(
                            onRecordComplete: _onVoiceRecordComplete,
                            onCancel: () => setState(() => _isRecording = false),
                            isDark: isDark,
                          )
                        : _MessageTextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            isDark: isDark,
                            hasText: _hasText,
                            isPushToTalk: _isPushToTalk,
                            pttCancelProgress: (_pttDragOffset.dx.abs() / 100.0).clamp(0.0, 1.0),
                            onSubmitted: (_) => _send(),
                            onSend: _send,
                            onTap: () {
                              if (_showAttachmentPicker) {
                                closeAttachmentPicker();
                              }
                            },
                            onCameraTap: _openCamera,
                            onMicTap: () {
                              HapticFeedback.mediumImpact();
                              widget.onRecordingStarted?.call();
                              setState(() => _isRecording = true);
                            },
                            onMicLongPressComplete: _onPushToTalkComplete,
                            onMicLongPressStart: _onPushToTalkStart,
                            onMicLongPressUpdate: _onPushToTalkUpdate,
                            onMicDragUpdate: _onPushToTalkDragUpdate,
                            onMicLongPressCancel: _onPushToTalkCancel,
                          ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );

    // Toujours retourner la même structure de widget pour préserver le FocusNode
    // sur iOS. L'inputBar est passé comme `child` de l'AnimatedBuilder — il est
    // construit une seule fois et reste au même endroit dans l'arbre de widgets,
    // même quand le picker s'ouvre/ferme. Cela évite la fermeture du clavier iOS.
    return AnimatedBuilder(
        animation: _pickerAnimController,
        child: inputBar,
        builder: (context, child) {
          final animValue = _pickerAnimController.value;

          return Container(
              decoration: BoxDecoration(
                color: animValue > 0.01
                    ? GlassTheme.background(isDark).withValues(
                        alpha: GlassTheme.background(isDark).a * animValue,
                      )
                    : Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Attachment picker : rendu conditionnel pour ne demander
                  // la permission photos qu'au premier tap sur + ou caméra.
                  if (_showAttachmentPicker)
                    SizeTransition(
                      sizeFactor: _pickerAnimController,
                      axisAlignment: 1.0,
                      child: ClipRect(
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: AttachmentPicker(
                            onSelected: _onAttachmentSelected,
                            onClose: closeAttachmentPicker,
                          ),
                        ),
                      ),
                    ),
                  // Input bar toujours présent au même endroit
                  child!,
                ],
              ),
          );
        },
    );
  }
}

/// Bouton Plus orange
class _PlusButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final bool isDark;

  const _PlusButton({
    required this.isActive,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Center(
          child: AnimatedRotation(
            turns: isActive ? 0.125 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.add_rounded,
              color: AppColors.accentPrimary,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}

/// Champ de texte avec icônes intégrées
class _MessageTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isDark;
  final bool hasText;
  final bool isPushToTalk;
  final double pttCancelProgress;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback onCameraTap;
  final VoidCallback onMicTap;
  final Function(String path, Duration duration)? onMicLongPressComplete;
  final VoidCallback? onMicLongPressStart;
  final void Function(double amplitude, Duration duration)? onMicLongPressUpdate;
  final void Function(Offset offset)? onMicDragUpdate;
  final VoidCallback? onMicLongPressCancel;
  final VoidCallback onSend;

  const _MessageTextField({
    required this.controller,
    required this.focusNode,
    required this.isDark,
    required this.hasText,
    required this.onCameraTap,
    required this.onMicTap,
    required this.onSend,
    this.isPushToTalk = false,
    this.pttCancelProgress = 0.0,
    this.onMicLongPressComplete,
    this.onMicLongPressStart,
    this.onMicLongPressUpdate,
    this.onMicDragUpdate,
    this.onMicLongPressCancel,
    this.onSubmitted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: GlassTheme.blurMedium, sigmaY: GlassTheme.blurMedium),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 120, minHeight: 44),
          decoration: BoxDecoration(
            color: GlassTheme.background(isDark),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: GlassTheme.border(isDark),
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
          // Text field avec hint animé
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  controller: controller,
                  focusNode: focusNode,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  style: AppTypography.bodyMedium(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ).copyWith(fontSize: 15.5),
                  cursorColor: AppColors.accentPrimary,
                  cursorWidth: 2,
                  decoration: const InputDecoration(
                    hintText: null,
                    filled: false,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onSubmitted: onSubmitted,
                  onTap: onTap,
                ),
                // Hint animé (crossfade entre Message... et icône poubelle)
                IgnorePointer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      child: isPushToTalk
                          ? Builder(
                              key: const ValueKey('ptt-hint'),
                              builder: (context) {
                                final baseColor = isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight;
                                final hintColor = Color.lerp(
                                  baseColor,
                                  AppColors.error,
                                  pttCancelProgress,
                                )!;
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.delete_outline_rounded,
                                      size: 18,
                                      color: hintColor,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Glissez pour annuler',
                                      style: AppTypography.bodyMedium(
                                        color: hintColor,
                                      ).copyWith(fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                );
                              },
                            )
                          : hasText
                              ? const SizedBox.shrink(key: ValueKey('no-hint'))
                              : Text(
                                  'Message...',
                                  key: const ValueKey('msg-hint'),
                                  style: AppTypography.bodyMedium(
                                    color: isDark ? Colors.white : Colors.black,
                                  ).copyWith(fontWeight: FontWeight.w400),
                                ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Camera & Mic icons OU Send button avec animation
          Padding(
            padding: const EdgeInsets.only(right: 4, bottom: 4),
            child: SizedBox(
              // Largeur fixe pour éviter le saut
              width: 82,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
                      child: child,
                    ),
                  );
                },
                layoutBuilder: (currentChild, previousChildren) {
                  return Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      ...previousChildren,
                      if (currentChild != null) currentChild,
                    ],
                  );
                },
                child: hasText
                    // Flèche d'envoi simple orange
                    ? GestureDetector(
                        key: const ValueKey('send'),
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          onSend();
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_upward_rounded,
                            color: AppColors.accentPrimary,
                            size: 24,
                          ),
                        ),
                      )
                    // Icônes camera et micro
                    : Row(
                        key: const ValueKey('icons'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _InputIconButton(
                            icon: Icons.camera_alt_rounded,
                            onTap: onCameraTap,
                            isDark: isDark,
                          ),
                          const SizedBox(width: 2),
                          VoiceMicButton(
                            onTap: onMicTap,
                            onPushToTalkComplete: onMicLongPressComplete ?? (_, __) {},
                            onPushToTalkStart: onMicLongPressStart,
                            onPushToTalkUpdate: onMicLongPressUpdate,
                            onPushToTalkDragUpdate: onMicDragUpdate,
                            onPushToTalkCancel: onMicLongPressCancel,
                            isDark: isDark,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    )),
    );
  }
}

/// Icône simple sans fond
class _InputIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;

  const _InputIconButton({
    required this.icon,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      excludeFromSemantics: true,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: isDark ? Colors.white : Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
