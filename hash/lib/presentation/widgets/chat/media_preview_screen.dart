import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../common/hash_snack_bar.dart';

class MediaPreviewScreen extends StatefulWidget {
  final String filePath;
  final bool isVideo;
  final bool isFrontCamera;
  final bool isFromGallery;
  final String? contactId;

  const MediaPreviewScreen({
    super.key,
    required this.filePath,
    required this.isVideo,
    this.isFrontCamera = false,
    this.isFromGallery = false,
    this.contactId,
  });

  @override
  State<MediaPreviewScreen> createState() => _MediaPreviewScreenState();
}

class _MediaPreviewScreenState extends State<MediaPreviewScreen> {
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;

  // Editing state
  bool _isDrawMode = false;
  bool _isTextMode = false;
  bool _isEditingText = false;
  Color _drawColor = Colors.white;
  double _drawStrokeWidth = 4.0;
  final List<_DrawingPath> _paths = [];
  final List<_TextOverlay> _textOverlays = [];
  _DrawingPath? _currentPath;
  int? _selectedTextIndex;

  // Text editing
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();
  int _selectedColorIndex = 0;
  TextOverlayStyle _selectedTextStyle = TextOverlayStyle.plain;
  double _textFontSize = 28.0; // Taille du texte ajustable
  int? _editingTextIndex; // Index du texte en cours d'édition (null = nouveau texte)

  // Drag to delete
  bool _isDraggingText = false;
  bool _isOverTrash = false;

  static const List<Color> _textColors = [
    Colors.white,
    Colors.black,
    Color(0xFFFF4757), // Rouge
    Color(0xFFFFAB00), // Orange/Amber
    Color(0xFFFFEB3B), // Jaune
    Color(0xFF00D26A), // Vert
    Color(0xFF2196F3), // Bleu
    Color(0xFF9C27B0), // Violet
    Color(0xFFE91E63), // Rose
  ];

  // View once options
  bool _isViewOnce = false;
  int _viewOnceDuration = 5; // seconds

  // Download state
  bool _isDownloading = false;

  // For capturing edited image
  final GlobalKey _captureKey = GlobalKey();

  // Storage service for media preferences
  final LocalStorageService _storageService = LocalStorageService();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _loadMediaPrefs();

    if (widget.isVideo) {
      _initializeVideo();
    }
  }

  Future<void> _loadMediaPrefs() async {
    if (widget.contactId == null) return;

    try {
      final prefs = await _storageService.getMediaPrefs(widget.contactId!);
      if (prefs != null && mounted) {
        setState(() {
          _isViewOnce = prefs['isViewOnce'] as bool? ?? false;
          _viewOnceDuration = prefs['viewOnceDuration'] as int? ?? 5;
        });
      }
    } catch (_) {
      // Cipher pas encore initialisé, utiliser les valeurs par défaut
    }
  }

  Future<void> _saveMediaPrefs() async {
    if (widget.contactId == null) return;

    await _storageService.saveMediaPrefs(
      widget.contactId!,
      isViewOnce: _isViewOnce,
      viewOnceDuration: _viewOnceDuration,
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _videoController?.dispose();
    _textController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }

  Future<void> _initializeVideo() async {
    _videoController = VideoPlayerController.file(File(widget.filePath));

    try {
      await _videoController!.initialize();
      await _videoController!.setLooping(true);
      await _videoController!.play();

      if (mounted) {
        setState(() => _isVideoInitialized = true);
      }
    } catch (e) {
      if (mounted) {
        showHashSnackBar(context, message: 'Erreur vidéo: $e', type: HashSnackBarType.error);
      }
    }
  }

  void _togglePlayPause() {
    if (_videoController == null) return;

    HapticFeedback.selectionClick();
    if (_videoController!.value.isPlaying) {
      _videoController!.pause();
    } else {
      _videoController!.play();
    }
    setState(() {});
  }

  void _toggleDrawMode() {
    HapticFeedback.selectionClick();
    setState(() {
      _isDrawMode = !_isDrawMode;
      _isTextMode = false;
    });
  }

  void _toggleTextMode() {
    HapticFeedback.selectionClick();
    if (_isEditingText) {
      _confirmTextOverlay();
    } else {
      _startTextEditing();
    }
  }

  void _startTextEditing({int? editIndex}) {
    // Si on édite un texte existant, pré-remplir les valeurs
    if (editIndex != null && editIndex < _textOverlays.length) {
      final overlay = _textOverlays[editIndex];
      _textController.text = overlay.text;
      _selectedColorIndex = _textColors.indexOf(overlay.color);
      if (_selectedColorIndex == -1) _selectedColorIndex = 0;
      _selectedTextStyle = overlay.style;
      _textFontSize = overlay.fontSize;
      _editingTextIndex = editIndex;
    } else {
      _textController.clear();
      _selectedColorIndex = 0;
      _selectedTextStyle = TextOverlayStyle.plain;
      _textFontSize = 28.0;
      _editingTextIndex = null;
    }

    setState(() {
      _isTextMode = true;
      _isEditingText = true;
      _isDrawMode = false;
    });

    // Focus sur le champ de texte après un court délai
    Future.delayed(const Duration(milliseconds: 100), () {
      _textFocusNode.requestFocus();
    });
  }

  void _confirmTextOverlay() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      final screenSize = MediaQuery.of(context).size;
      setState(() {
        if (_editingTextIndex != null && _editingTextIndex! < _textOverlays.length) {
          // Modifier le texte existant
          final existingOverlay = _textOverlays[_editingTextIndex!];
          _textOverlays[_editingTextIndex!] = existingOverlay.copyWith(
            text: text,
            color: _textColors[_selectedColorIndex],
            style: _selectedTextStyle,
            fontSize: _textFontSize,
          );
        } else {
          // Ajouter un nouveau texte
          _textOverlays.add(_TextOverlay(
            text: text,
            position: Offset(
              screenSize.width / 2 - 50,
              screenSize.height / 2 - 100,
            ),
            color: _textColors[_selectedColorIndex],
            style: _selectedTextStyle,
            fontSize: _textFontSize,
          ));
        }
      });
    }
    _cancelTextEditing();
  }

  void _cancelTextEditing() {
    _textFocusNode.unfocus();
    setState(() {
      _isTextMode = false;
      _isEditingText = false;
      _textController.clear();
      _editingTextIndex = null;
    });
  }

  void _cycleTextStyle() {
    HapticFeedback.selectionClick();
    setState(() {
      final styles = TextOverlayStyle.values;
      final currentIndex = styles.indexOf(_selectedTextStyle);
      _selectedTextStyle = styles[(currentIndex + 1) % styles.length];
    });
  }

  void _onPanStart(DragStartDetails details) {
    if (!_isDrawMode) return;

    setState(() {
      _currentPath = _DrawingPath(
        color: _drawColor,
        strokeWidth: _drawStrokeWidth,
        points: [details.localPosition],
      );
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!_isDrawMode || _currentPath == null) return;

    setState(() {
      // Créer une nouvelle liste pour forcer le repaint
      _currentPath = _DrawingPath(
        color: _currentPath!.color,
        strokeWidth: _currentPath!.strokeWidth,
        points: [..._currentPath!.points, details.localPosition],
      );
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (!_isDrawMode || _currentPath == null) return;

    setState(() {
      _paths.add(_currentPath!);
      _currentPath = null;
    });
  }

  void _undoLastAction() {
    HapticFeedback.selectionClick();
    setState(() {
      if (_paths.isNotEmpty) {
        _paths.removeLast();
      } else if (_textOverlays.isNotEmpty) {
        _textOverlays.removeLast();
      }
    });
  }

  void _toggleViewOnce() {
    HapticFeedback.selectionClick();
    setState(() => _isViewOnce = !_isViewOnce);
  }

  void _showViewOnceInfo() {
    showDialog(
      context: context,
      builder: (context) => GlassTheme.wrapAlertDialog(context, AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        title: Row(
          children: [
            const Icon(Icons.visibility_off, color: AppColors.accentPrimary),
            const SizedBox(width: 12),
            Text('Vue unique', style: AppTypography.headlineSmall(color: Colors.white)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mode Normal',
              style: AppTypography.labelLarge(color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              'Le média peut être vu plusieurs fois et sauvegardé par le destinataire.',
              style: AppTypography.bodySmall(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            Text(
              'Mode Vue unique',
              style: AppTypography.labelLarge(color: AppColors.accentPrimary),
            ),
            const SizedBox(height: 4),
            Text(
              'Le média ne peut être vu qu\'une seule fois pendant la durée choisie, puis il disparaît définitivement. Impossible de le sauvegarder ou faire une capture d\'écran.',
              style: AppTypography.bodySmall(color: Colors.white70),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Compris', style: AppTypography.labelLarge(color: AppColors.accentPrimary)),
          ),
        ],
      )),
    );
  }

  void _showViewOnceDurationPicker() async {
    final duration = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _ViewOnceDurationPicker(
        currentDuration: _viewOnceDuration,
      ),
    );

    if (duration != null) {
      setState(() => _viewOnceDuration = duration);
    }
  }

  Future<void> _downloadMedia() async {
    if (_isDownloading) return;

    HapticFeedback.mediumImpact();
    setState(() => _isDownloading = true);

    try {
      String pathToSave = widget.filePath;

      // If we have edits on an image OR it's a front camera photo (needs mirror), capture the rendered version
      if (!widget.isVideo && (_paths.isNotEmpty || _textOverlays.isNotEmpty || widget.isFrontCamera)) {
        final editedPath = await _captureEditedImage();
        if (editedPath != null) {
          pathToSave = editedPath;
        }
      }

      // Save to gallery
      final result = await ImageGallerySaverPlus.saveFile(pathToSave);

      if (mounted) {
        setState(() => _isDownloading = false);

        if (result['isSuccess'] == true) {
          showHashSnackBar(context, message: 'Média enregistré dans la galerie', type: HashSnackBarType.success);
        } else {
          showHashSnackBar(context, message: 'Erreur lors de l\'enregistrement', type: HashSnackBarType.error);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isDownloading = false);
        showHashSnackBar(context, message: 'Erreur: $e', type: HashSnackBarType.error);
      }
    }
  }

  Future<void> _send() async {
    HapticFeedback.mediumImpact();

    // Sauvegarder les préférences pour ce contact (non-bloquant)
    try {
      await _saveMediaPrefs();
    } catch (_) {
      // Ne pas bloquer l'envoi si la sauvegarde des prefs échoue
    }

    String finalPath = widget.filePath;

    // If we have edits on an image OR it's a front camera photo (needs mirror), capture the rendered version
    if (!widget.isVideo && (_paths.isNotEmpty || _textOverlays.isNotEmpty || widget.isFrontCamera)) {
      final editedPath = await _captureEditedImage();
      if (editedPath != null) {
        finalPath = editedPath;
      }
    }

    if (mounted) {
      Navigator.of(context).pop({
        'type': widget.isVideo ? 'video' : 'photo',
        'path': finalPath,
        'isViewOnce': _isViewOnce,
        'viewOnceDuration': _isViewOnce ? _viewOnceDuration : null,
      });
    }
  }

  Widget _buildStyledText(_TextOverlay overlay, bool isSelected) {
    final textWidget = Text(
      overlay.text,
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
        color: overlay.style == TextOverlayStyle.withBackground
            ? (overlay.color == Colors.white ? Colors.black : Colors.white)
            : overlay.color,
        fontSize: overlay.fontSize,
        fontWeight: FontWeight.bold,
        shadows: overlay.style == TextOverlayStyle.plain
            ? [
                const Shadow(color: Colors.black, blurRadius: 4),
                const Shadow(color: Colors.black, blurRadius: 8),
              ]
            : null,
      ),
    );

    switch (overlay.style) {
      case TextOverlayStyle.plain:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: textWidget,
        );

      case TextOverlayStyle.withBackground:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: overlay.color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: textWidget,
        );

      case TextOverlayStyle.outlined:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: overlay.color,
              width: 3,
            ),
          ),
          child: Text(
            overlay.text,
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
              color: overlay.color,
              fontSize: overlay.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
    }
  }

  Widget _buildTextInput() {
    final color = _textColors[_selectedColorIndex];
    final hasText = _textController.text.isNotEmpty;

    // Style de base du TextField
    final textStyle = TextStyle(
      color: hasText ? (
        _selectedTextStyle == TextOverlayStyle.withBackground
            ? (color == Colors.white ? Colors.black : Colors.white)
            : color
      ) : Colors.white.withValues(alpha: 0.5),
      fontSize: _textFontSize,
      fontWeight: FontWeight.bold,
      shadows: hasText && _selectedTextStyle == TextOverlayStyle.plain
          ? const [
              Shadow(color: Colors.black, blurRadius: 4),
              Shadow(color: Colors.black, blurRadius: 8),
            ]
          : null,
    );

    final textField = TextField(
      controller: _textController,
      focusNode: _textFocusNode,
      autofocus: true,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.text,
      maxLines: null,
      style: textStyle,
      cursorColor: color,
      cursorWidth: 2.5,
      decoration: InputDecoration(
        hintText: 'Tapez votre texte...',
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.5),
          fontSize: _textFontSize,
          fontWeight: FontWeight.bold,
        ),
        filled: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        isDense: true,
      ),
      onChanged: (_) => setState(() {}),
      onSubmitted: (_) => _confirmTextOverlay(),
    );

    // Appliquer le style de container selon le mode sélectionné
    switch (_selectedTextStyle) {
      case TextOverlayStyle.plain:
        return textField;

      case TextOverlayStyle.withBackground:
        if (!hasText) {
          return textField;
        }
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: textField,
        );

      case TextOverlayStyle.outlined:
        if (!hasText) {
          return textField;
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color, width: 3),
          ),
          child: textField,
        );
    }
  }

  Future<String?> _captureEditedImage() async {
    try {
      final boundary = _captureKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;

      final image = await boundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/edited_${DateTime.now().millisecondsSinceEpoch}.png');
      await file.writeAsBytes(byteData.buffer.asUint8List());

      return file.path;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Media preview
          GestureDetector(
            onTap: () {
              if (widget.isVideo) {
                _togglePlayPause();
              } else if (!_isDrawMode && !_isEditingText) {
                // Tap sur l'image = ouvrir l'édition de texte
                _startTextEditing();
              }
            },
            onPanStart: _isDrawMode ? _onPanStart : null,
            onPanUpdate: _isDrawMode ? _onPanUpdate : null,
            onPanEnd: _isDrawMode ? _onPanEnd : null,
            child: RepaintBoundary(
              key: _captureKey,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image or Video
                  if (widget.isVideo)
                    _isVideoInitialized
                        ? Center(
                            child: AspectRatio(
                              aspectRatio: _videoController!.value.aspectRatio,
                              child: VideoPlayer(_videoController!),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(color: AppColors.accentPrimary),
                          )
                  else
                    // Miroir horizontal pour la caméra frontale
                    Transform(
                      alignment: Alignment.center,
                      transform: widget.isFrontCamera
                          ? (Matrix4.identity()..scale(-1.0, 1.0))
                          : Matrix4.identity(),
                      child: widget.isFromGallery
                          ? Center(
                              child: Image.file(
                                File(widget.filePath),
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )
                          : Image.file(
                              File(widget.filePath),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                    ),

                  // Drawing canvas
                  if (!widget.isVideo)
                    CustomPaint(
                      painter: _DrawingPainter(
                        paths: _paths,
                        currentPath: _currentPath,
                      ),
                      size: Size.infinite,
                    ),

                  // Text overlays
                  if (!widget.isVideo)
                    ..._textOverlays.asMap().entries.map((entry) {
                      final index = entry.key;
                      final overlay = entry.value;
                      // Masquer l'overlay en cours d'édition
                      if (_isEditingText && _editingTextIndex == index) {
                        return const SizedBox.shrink();
                      }
                      final isSelected = _selectedTextIndex == index;
                      final maxWidth = MediaQuery.of(context).size.width - 64;
                      return Positioned(
                        left: overlay.position.dx,
                        top: overlay.position.dy,
                        child: GestureDetector(
                          onTap: () {
                            // Ouvrir l'édition du texte existant
                            HapticFeedback.selectionClick();
                            _startTextEditing(editIndex: index);
                          },
                          onPanStart: (_) {
                            HapticFeedback.selectionClick();
                            setState(() {
                              _isDraggingText = true;
                              _selectedTextIndex = index;
                            });
                          },
                          onPanUpdate: (details) {
                            final newPosition = overlay.position + details.delta;
                            // Vérifier si on est au-dessus de la zone poubelle (haut de l'écran)
                            final trashZoneHeight = MediaQuery.of(context).padding.top + 100;
                            setState(() {
                              _textOverlays[index] = overlay.copyWith(
                                position: newPosition,
                              );
                              _isOverTrash = newPosition.dy < trashZoneHeight;
                            });
                          },
                          onPanEnd: (_) {
                            if (_isOverTrash) {
                              // Supprimer le texte
                              HapticFeedback.heavyImpact();
                              setState(() {
                                _textOverlays.removeAt(index);
                                _selectedTextIndex = null;
                              });
                            }
                            setState(() {
                              _isDraggingText = false;
                              _isOverTrash = false;
                            });
                          },
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: maxWidth),
                            child: Transform.scale(
                              scale: overlay.scale,
                              child: Transform.rotate(
                                angle: overlay.rotation,
                                child: _buildStyledText(overlay, isSelected),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),

          // Video play/pause indicator
          if (widget.isVideo && _isVideoInitialized && !_videoController!.value.isPlaying)
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),

          // Trash zone (appears when holding/dragging text)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              ignoring: !_isDraggingText,
              child: AnimatedOpacity(
                opacity: _isDraggingText ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Container(
                  height: MediaQuery.of(context).padding.top + 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Center(
                      child: AnimatedScale(
                        scale: _isDraggingText ? 1.0 : 0.5,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOutBack,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: EdgeInsets.all(_isOverTrash ? 18 : 14),
                          decoration: BoxDecoration(
                            color: _isOverTrash
                                ? AppColors.error
                                : Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.delete_rounded,
                            color: Colors.white,
                            size: _isOverTrash ? 30 : 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Undo button (appears in draw mode)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              ignoring: !_isDrawMode,
              child: AnimatedOpacity(
                opacity: _isDrawMode ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Container(
                  height: MediaQuery.of(context).padding.top + 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Center(
                      child: GestureDetector(
                        onTap: _paths.isNotEmpty ? _undoLastAction : null,
                        child: AnimatedScale(
                          scale: _isDrawMode ? 1.0 : 0.5,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOutBack,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: _paths.isNotEmpty
                                  ? Colors.white.withValues(alpha: 0.2)
                                  : Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.undo_rounded,
                              color: _paths.isNotEmpty
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.4),
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Text editing overlay
          if (_isEditingText) ...[
            // Semi-transparent background - tap to confirm if text is entered
            GestureDetector(
              onTap: () {
                if (_textController.text.trim().isNotEmpty) {
                  _confirmTextOverlay();
                } else {
                  _cancelTextEditing();
                }
              },
              child: Container(
                color: Colors.black.withValues(alpha: 0.7),
              ),
            ),

            // Text input in center (avec curseur visible) + slider de taille
            Positioned.fill(
              child: Row(
                children: [
                  // Slider de taille à gauche
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: MediaQuery.of(context).size.height * 0.25,
                      bottom: MediaQuery.of(context).size.height * 0.25,
                    ),
                    child: SizedBox(
                      height: 200,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 4,
                            activeTrackColor: AppColors.accentPrimary,
                            inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
                            thumbColor: Colors.white,
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                            overlayColor: AppColors.accentPrimary.withValues(alpha: 0.2),
                          ),
                          child: Slider(
                            value: _textFontSize,
                            min: 14,
                            max: 48,
                            onChanged: (value) {
                              HapticFeedback.selectionClick();
                              setState(() => _textFontSize = value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Zone de texte centrale
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _buildTextInput(),
                      ),
                    ),
                  ),
                  // Espace à droite pour équilibrer
                  const SizedBox(width: 50),
                ],
              ),
            ),

            // Bottom editing panel
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom > 0
                      ? 16
                      : MediaQuery.of(context).padding.bottom + 16,
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.9),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SizedBox(
                  height: 44,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _textColors.length,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, index) {
                      final color = _textColors[index];
                      final isSelected = _selectedColorIndex == index;
                      return GestureDetector(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          setState(() => _selectedColorIndex = index);
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? AppColors.accentPrimary : Colors.white30,
                              width: isSelected ? 3 : 2,
                            ),
                            boxShadow: isSelected
                                ? [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 8)]
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ).animate().fadeIn(duration: 200.ms).slideY(begin: 0.2, end: 0),

            // Top bar with Cancel (left) and Confirm (right)
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel button (left)
                  GestureDetector(
                    onTap: _cancelTextEditing,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Annuler',
                        style: AppTypography.labelMedium(color: Colors.white),
                      ),
                    ),
                  ),
                  // Confirm button (right)
                  GestureDetector(
                    onTap: _confirmTextOverlay,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: _textController.text.isNotEmpty
                            ? AppColors.accentPrimary
                            : Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'OK',
                        style: AppTypography.labelMedium(
                          color: _textController.text.isNotEmpty ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 200.ms),

          ],

          // Top controls (hidden when editing text or dragging text)
          if (!_isEditingText)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: IgnorePointer(
              ignoring: _isDraggingText,
              child: AnimatedOpacity(
                opacity: _isDraggingText ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Close button
                    _ControlButton(
                      icon: Icons.close,
                      onTap: () => Navigator.of(context).pop(),
                    ),

                    // Right side tools (vertical column: Download, Draw, Text, View Once)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Download button
                    _ControlButton(
                      icon: _isDownloading ? Icons.hourglass_top : Icons.download_rounded,
                      onTap: _downloadMedia,
                    ),
                    // Edit tools (only for images)
                    if (!widget.isVideo) ...[
                      const SizedBox(height: 8),
                      // Text mode
                      _ControlButton(
                        icon: Icons.text_fields_rounded,
                        onTap: () => _startTextEditing(),
                        isActive: _isTextMode,
                      ),
                      const SizedBox(height: 8),
                      // Draw mode
                      _ControlButton(
                        icon: Icons.brush_rounded,
                        onTap: _toggleDrawMode,
                        isActive: _isDrawMode,
                      ),
                    ],
                    const SizedBox(height: 8),
                    // View once toggle
                    GestureDetector(
                      onTap: _toggleViewOnce,
                      onLongPress: () {
                        HapticFeedback.lightImpact();
                        _showViewOnceInfo();
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: _isViewOnce ? AppColors.accentPrimary : Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isViewOnce ? Icons.visibility_off : Icons.visibility,
                          color: _isViewOnce ? Colors.black : Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                    // Duration picker (only when view once is active)
                    if (_isViewOnce) ...[
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _showViewOnceDurationPicker,
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              _viewOnceDuration == 0 ? '∞' : '${_viewOnceDuration}s',
                              style: _viewOnceDuration == 0
                                  ? AppTypography.labelLarge(color: Colors.white)
                                  : AppTypography.labelSmall(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

          // Drawing tools
          if (_isDrawMode)
            Positioned(
              top: MediaQuery.of(context).padding.top + 70,
              left: 16,
              child: _DrawingToolbar(
                selectedColor: _drawColor,
                strokeWidth: _drawStrokeWidth,
                onColorChanged: (color) => setState(() => _drawColor = color),
                onStrokeWidthChanged: (width) => setState(() => _drawStrokeWidth = width),
              ),
            ).animate().fadeIn().slideX(begin: -0.3, end: 0),

          // Bottom controls (hidden when editing text or dragging text)
          if (!_isEditingText)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              ignoring: _isDraggingText,
              child: AnimatedOpacity(
                opacity: _isDraggingText ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 24,
                    top: 16,
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Send button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _send,
                          icon: Icon(
                            _isViewOnce ? Icons.visibility_off : Icons.send_rounded,
                            size: 22,
                          ),
                          label: Text(_isViewOnce ? 'Envoyer en vue unique' : 'Envoyer'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentPrimary,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  const _ControlButton({
    required this.icon,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isActive ? AppColors.accentPrimary : Colors.black.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.black : Colors.white,
          size: 22,
        ),
      ),
    );
  }
}

class _DrawingToolbar extends StatelessWidget {
  final Color selectedColor;
  final double strokeWidth;
  final Function(Color) onColorChanged;
  final Function(double) onStrokeWidthChanged;

  const _DrawingToolbar({
    required this.selectedColor,
    required this.strokeWidth,
    required this.onColorChanged,
    required this.onStrokeWidthChanged,
  });

  static const _colors = [
    Colors.white,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Colors
          ..._colors.map((color) {
            final isSelected = selectedColor == color;
            return GestureDetector(
              onTap: () => onColorChanged(color),
              child: Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: AppColors.accentPrimary, width: 3)
                      : Border.all(color: Colors.white30, width: 1),
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          Container(
            width: 32,
            height: 1,
            color: Colors.white30,
          ),
          const SizedBox(height: 8),
          // Stroke widths
          ...[2.0, 4.0, 8.0].map((width) {
            final isSelected = strokeWidth == width;
            return GestureDetector(
              onTap: () => onStrokeWidthChanged(width),
              child: Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.accentPrimary.withValues(alpha: 0.3) : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.accentPrimary : Colors.white30,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: width * 2,
                    height: width * 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _DrawingPath {
  final Color color;
  final double strokeWidth;
  final List<Offset> points;

  _DrawingPath({
    required this.color,
    required this.strokeWidth,
    required this.points,
  });
}

enum TextOverlayStyle { plain, withBackground, outlined }

class _TextOverlay {
  final String text;
  final Offset position;
  final Color color;
  final double fontSize;
  final double scale;
  final double rotation;
  final TextOverlayStyle style;

  _TextOverlay({
    required this.text,
    required this.position,
    required this.color,
    this.fontSize = 28,
    this.scale = 1.0,
    this.rotation = 0.0,
    this.style = TextOverlayStyle.plain,
  });

  _TextOverlay copyWith({
    String? text,
    Offset? position,
    Color? color,
    double? fontSize,
    double? scale,
    double? rotation,
    TextOverlayStyle? style,
  }) {
    return _TextOverlay(
      text: text ?? this.text,
      position: position ?? this.position,
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      scale: scale ?? this.scale,
      rotation: rotation ?? this.rotation,
      style: style ?? this.style,
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<_DrawingPath> paths;
  final _DrawingPath? currentPath;

  _DrawingPainter({
    required this.paths,
    this.currentPath,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final path in paths) {
      _drawPath(canvas, path);
    }
    if (currentPath != null) {
      _drawPath(canvas, currentPath!);
    }
  }

  void _drawPath(Canvas canvas, _DrawingPath drawPath) {
    if (drawPath.points.isEmpty) return;

    final paint = Paint()
      ..color = drawPath.color
      ..strokeWidth = drawPath.strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(drawPath.points.first.dx, drawPath.points.first.dy);

    for (int i = 1; i < drawPath.points.length; i++) {
      path.lineTo(drawPath.points[i].dx, drawPath.points[i].dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _DrawingPainter oldDelegate) {
    // Toujours repaint - plus fiable pour le dessin
    return true;
  }
}

class _ViewOnceDurationPicker extends StatelessWidget {
  final int currentDuration;

  const _ViewOnceDurationPicker({required this.currentDuration});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GlassTheme.bottomSheetWrapper(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.darkBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Durée de visibilité',
            style: AppTypography.headlineSmall(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Le média disparaîtra après ce délai',
            style: AppTypography.bodySmall(color: Colors.white54),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [5, 10, 15, 30, 0].map((seconds) {
              final isSelected = currentDuration == seconds;
              return GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  Navigator.pop(context, seconds);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.accentPrimary
                        : AppColors.darkBackground,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? AppColors.accentPrimary : AppColors.darkBorder,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      seconds == 0 ? '∞' : '${seconds}s',
                      style: seconds == 0
                          ? AppTypography.headlineLarge(
                              color: isSelected ? Colors.black : Colors.white,
                            )
                          : AppTypography.headlineSmall(
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
        ),
      ),
    );
  }
}
