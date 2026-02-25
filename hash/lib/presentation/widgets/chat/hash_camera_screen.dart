import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../core/utils/call_permission_helper.dart';
import '../common/hash_snack_bar.dart';
import 'media_preview_screen.dart';

class HashCameraScreen extends StatefulWidget {
  final String? contactId;

  const HashCameraScreen({super.key, this.contactId});

  @override
  State<HashCameraScreen> createState() => _HashCameraScreenState();
}

class _HashCameraScreenState extends State<HashCameraScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];

  // Organized cameras by type
  CameraDescription? _ultraWideCamera;  // 0.5x
  CameraDescription? _wideCamera;       // 1x (default)
  CameraDescription? _telephotoCamera;  // 2x+
  CameraDescription? _frontCamera;

  // Current lens: 0 = 0.5x, 1 = 1x, 2 = 2x
  int _currentLensIndex = 1; // Start with 1x
  bool _isFrontCamera = false;
  bool _isInitialized = false;
  bool _isInitializing = true;
  bool _isSwitchingCamera = false;
  String? _errorMessage;

  bool _isRecording = false;
  bool _isRecordingLocked = false;
  Duration _recordingDuration = Duration.zero;
  Timer? _recordingTimer;
  double _currentZoom = 1.0;
  double _minZoom = 1.0;
  double _maxZoom = 1.0;
  double _baseZoom = 1.0;
  bool _isFocusing = false;
  Offset? _focusPoint;

  // Timer for photos
  int _timerSeconds = 0; // 0 = no timer, 3, 10
  bool _isTimerRunning = false;
  int _timerCountdown = 0;

  // Flash mode
  FlashMode _flashMode = FlashMode.off;

  // Selfie flash (screen flash for front camera)
  bool _selfieFlashEnabled = true; // Flash activé par défaut pour caméra frontale
  bool _showSelfieFlash = false;

  late AnimationController _shutterController;
  late AnimationController _recordingController;
  late AnimationController _focusController;

  // Gallery thumbnail
  AssetEntity? _lastGalleryItem;

  // Frozen frame for camera switch
  final GlobalKey _previewKey = GlobalKey();
  Uint8List? _frozenFrame;

  // Max video duration
  static const int _maxVideoDurationSeconds = 60;

  // Available lenses for UI
  List<_LensInfo> get _availableLenses {
    final lenses = <_LensInfo>[];
    if (_ultraWideCamera != null) lenses.add(_LensInfo(index: 0, label: '.5', camera: _ultraWideCamera!));
    if (_wideCamera != null) lenses.add(_LensInfo(index: 1, label: '1x', camera: _wideCamera!));
    if (_telephotoCamera != null) lenses.add(_LensInfo(index: 2, label: '2x', camera: _telephotoCamera!));
    return lenses;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _shutterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _recordingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _focusController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _initializeCamera();
    _loadLastGalleryItem();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _recordingTimer?.cancel();
    _controller?.dispose();
    _shutterController.dispose();
    _recordingController.dispose();
    _focusController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      final controller = _controller;
      _controller = null;
      _isInitialized = false;
      if (mounted) setState(() {});
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (_controller == null && !_isInitializing) {
        _initializeCamera();
      }
    }
  }

  Future<void> _initializeCamera() async {
    setState(() {
      _isInitializing = true;
      _isInitialized = false;
      _errorMessage = null;
    });

    // Check camera permission before initializing
    if (mounted) {
      final granted = await PermissionHelper.requestCameraCapture(context);
      if (!granted) {
        if (mounted) {
          Navigator.of(context).pop();
        }
        return;
      }
    }

    try {
      _cameras = await availableCameras();

      if (_cameras.isEmpty) {
        if (mounted) {
          setState(() {
            _errorMessage = 'Aucune caméra disponible';
            _isInitializing = false;
          });
        }
        return;
      }

      // Get front camera
      _frontCamera = _cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras.first,
      );

      // Get back cameras
      final backCameras = _cameras.where((c) => c.lensDirection == CameraLensDirection.back).toList();

      if (backCameras.isEmpty) {
        await _setupCamera(_frontCamera!);
        return;
      }

      // Ordre corrigé pour iOS
      if (backCameras.length == 1) {
        _wideCamera = backCameras[0];
      } else if (backCameras.length == 2) {
        _wideCamera = backCameras[0];      // 1x
        _telephotoCamera = backCameras[1]; // 2x (était assigné à ultra-wide)
      } else if (backCameras.length >= 3) {
        _wideCamera = backCameras[0];      // 1x
        _telephotoCamera = backCameras[1]; // 2x
        _ultraWideCamera = backCameras[2]; // 0.5x
      }

      // Start with wide camera (1x)
      _currentLensIndex = 1;
      await _setupCamera(_wideCamera ?? backCameras.first);

    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Erreur: $e';
          _isInitializing = false;
        });
      }
    }
  }

  Future<void> _setupCamera(CameraDescription camera) async {
    if (!mounted) return;

    // Stocker l'ancien controller pour le dispose après
    final oldController = _controller;

    // Mettre à jour l'état AVANT de dispose pour éviter l'écran rouge
    _controller = null;
    _isInitialized = false;
    _isSwitchingCamera = true;
    setState(() {});

    // Maintenant dispose l'ancien controller
    if (oldController != null) {
      await oldController.dispose();
    }

    try {
      final newController = CameraController(
        camera,
        ResolutionPreset.veryHigh,
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await newController.initialize();

      if (!mounted) {
        newController.dispose();
        return;
      }

      _controller = newController;

      _minZoom = await newController.getMinZoomLevel();
      _maxZoom = await newController.getMaxZoomLevel();
      _currentZoom = _minZoom.clamp(1.0, _maxZoom);

      await newController.setZoomLevel(_currentZoom);

      if (!_isFrontCamera) {
        try {
          await newController.setFlashMode(_flashMode);
        } catch (e) {
          debugPrint('[HashCameraScreen] Setting flash mode failed: $e');
        }
      }

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _isInitializing = false;
          _isSwitchingCamera = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Erreur caméra: $e';
          _isInitializing = false;
          _isSwitchingCamera = false;
        });
      }
    }
  }

  Future<void> _capturePreviewFrame() async {
    try {
      final boundary = _previewKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        final image = await boundary.toImage(pixelRatio: 1.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null && mounted) {
          setState(() {
            _frozenFrame = byteData.buffer.asUint8List();
          });
        }
      }
    } catch (e) {
      debugPrint('Capture frame error: $e');
    }
  }

  Future<void> _loadLastGalleryItem() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) return;

    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.common,
      filterOption: FilterOptionGroup(
        orders: [const OrderOption(type: OrderOptionType.createDate, asc: false)],
      ),
    );

    if (albums.isNotEmpty) {
      final recentAlbum = albums.first;
      final assets = await recentAlbum.getAssetListRange(start: 0, end: 1);
      if (assets.isNotEmpty && mounted) {
        setState(() {
          _lastGalleryItem = assets.first;
        });
      }
    }
  }

  void _toggleFlash() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    HapticFeedback.selectionClick();

    // Pour la caméra frontale, toggle le flash écran
    if (_isFrontCamera) {
      setState(() => _selfieFlashEnabled = !_selfieFlashEnabled);
      return;
    }

    // Pour la caméra arrière, cycle entre les modes de flash
    FlashMode newMode;
    switch (_flashMode) {
      case FlashMode.off:
        newMode = FlashMode.always;
        break;
      case FlashMode.always:
        newMode = FlashMode.auto;
        break;
      case FlashMode.auto:
        newMode = FlashMode.off;
        break;
      default:
        newMode = FlashMode.off;
    }

    setState(() => _flashMode = newMode);

    try {
      await controller.setFlashMode(newMode);
    } catch (e) {
      debugPrint('Flash error: $e');
    }
  }

  void _toggleTimer() {
    HapticFeedback.selectionClick();
    setState(() {
      if (_timerSeconds == 0) {
        _timerSeconds = 3;
      } else if (_timerSeconds == 3) {
        _timerSeconds = 10;
      } else {
        _timerSeconds = 0;
      }
    });
  }

  void _flipCamera() async {
    if (_isSwitchingCamera) return;

    HapticFeedback.mediumImpact();

    // Si on enregistre, on change de caméra en continuant l'enregistrement
    if (_isRecording) {
      await _switchCameraWhileRecording();
      return;
    }

    // Capturer l'image actuelle avant le changement
    await _capturePreviewFrame();

    final newIsFront = !_isFrontCamera;
    setState(() => _isFrontCamera = newIsFront);

    if (newIsFront && _frontCamera != null) {
      await _setupCamera(_frontCamera!);
    } else {
      // Go back to the previously selected lens
      final camera = _getCameraForLens(_currentLensIndex);
      if (camera != null) {
        await _setupCamera(camera);
      }
    }

    // Effacer l'image gelée une fois la caméra prête
    if (mounted) {
      setState(() => _frozenFrame = null);
    }
  }

  Future<void> _switchCameraWhileRecording() async {
    // Note: Le changement de caméra pendant l'enregistrement n'est pas supporté nativement
    // On doit arrêter, changer de caméra, et redémarrer
    // Pour l'instant on inverse juste le flag isFrontCamera pour le prochain enregistrement
    final newIsFront = !_isFrontCamera;
    setState(() => _isFrontCamera = newIsFront);

    // Stop current recording
    final video = await _controller?.stopVideoRecording();

    // Change camera
    if (newIsFront && _frontCamera != null) {
      await _setupCamera(_frontCamera!);
    } else {
      final camera = _getCameraForLens(_currentLensIndex);
      if (camera != null) {
        await _setupCamera(camera);
      }
    }

    // Restart recording immediately
    if (_controller != null && _controller!.value.isInitialized) {
      await _controller!.startVideoRecording();
      // Le timer continue de tourner
    }
  }

  CameraDescription? _getCameraForLens(int lensIndex) {
    switch (lensIndex) {
      case 0: return _ultraWideCamera;
      case 1: return _wideCamera;
      case 2: return _telephotoCamera;
      default: return _wideCamera ?? _ultraWideCamera ?? _telephotoCamera;
    }
  }

  void _selectLens(int lensIndex) async {
    if (_isRecording || _isFrontCamera || _isSwitchingCamera) return;

    final camera = _getCameraForLens(lensIndex);
    if (camera == null) return;

    HapticFeedback.selectionClick();

    // Capturer l'image actuelle avant le changement
    await _capturePreviewFrame();

    setState(() => _currentLensIndex = lensIndex);
    await _setupCamera(camera);

    // Effacer l'image gelée une fois la caméra prête
    if (mounted) {
      setState(() => _frozenFrame = null);
    }
  }

  void _onTapFocus(TapDownDetails details) async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    if (_isRecording || _isSwitchingCamera) return;

    HapticFeedback.selectionClick();

    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localPosition = box.globalToLocal(details.globalPosition);
    final screenSize = box.size;

    // Calculer les coordonnées en tenant compte du FittedBox.cover
    final cameraAspectRatio = controller.value.aspectRatio;
    final screenAspectRatio = screenSize.width / screenSize.height;

    double x, y;

    if (cameraAspectRatio > screenAspectRatio) {
      // La caméra est plus large, elle est croppée sur les côtés
      final visibleWidth = screenSize.height * cameraAspectRatio;
      final offsetX = (visibleWidth - screenSize.width) / 2;
      x = (localPosition.dx + offsetX) / visibleWidth;
      y = localPosition.dy / screenSize.height;
    } else {
      // La caméra est plus haute, elle est croppée en haut/bas
      final visibleHeight = screenSize.width / cameraAspectRatio;
      final offsetY = (visibleHeight - screenSize.height) / 2;
      x = localPosition.dx / screenSize.width;
      y = (localPosition.dy + offsetY) / visibleHeight;
    }

    x = x.clamp(0.0, 1.0);
    y = y.clamp(0.0, 1.0);

    // Inverser X pour la caméra frontale (miroir)
    if (_isFrontCamera) {
      x = 1.0 - x;
    }

    setState(() {
      _focusPoint = localPosition;
      _isFocusing = true;
    });

    try {
      final focusPoint = Offset(x, y);

      // Définir le point de focus
      await controller.setFocusPoint(focusPoint);
      await controller.setExposurePoint(focusPoint);

      // Déclencher l'autofocus sur ce point puis verrouiller
      await controller.setFocusMode(FocusMode.auto);
      await Future.delayed(const Duration(milliseconds: 500));

      // Verrouiller le focus pour qu'il reste sur ce point
      if (mounted && _controller != null) {
        await controller.setFocusMode(FocusMode.locked);
      }
    } catch (e) {
      debugPrint('Focus error: $e');
    }

    _focusController.forward(from: 0).then((_) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          setState(() => _isFocusing = false);
        }
      });
    });
  }

  void _onScaleStart(ScaleStartDetails details) {
    _baseZoom = _currentZoom;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    if (_isSwitchingCamera) return;

    final newZoom = (_baseZoom * details.scale).clamp(_minZoom, _maxZoom);

    if (newZoom != _currentZoom) {
      setState(() => _currentZoom = newZoom);
      try {
        await controller.setZoomLevel(newZoom);
      } catch (e) {
        debugPrint('Zoom error: $e');
      }
    }
  }

  Future<void> _capturePhoto() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    if (controller.value.isTakingPicture) return;
    if (_isRecording || _isSwitchingCamera) return;

    // Handle timer
    if (_timerSeconds > 0 && !_isTimerRunning) {
      setState(() {
        _isTimerRunning = true;
        _timerCountdown = _timerSeconds;
      });

      for (int i = _timerSeconds; i > 0; i--) {
        if (!mounted || !_isTimerRunning) return;
        setState(() => _timerCountdown = i);
        HapticFeedback.lightImpact();
        await Future.delayed(const Duration(seconds: 1));
      }

      setState(() {
        _isTimerRunning = false;
        _timerCountdown = 0;
      });
    }

    HapticFeedback.lightImpact();

    // Préparer le focus avant la capture
    try {
      await controller.setFocusMode(FocusMode.locked);
      await Future.delayed(const Duration(milliseconds: 100));
    } catch (e) {
      debugPrint('[HashCameraScreen] Locking focus mode failed: $e');
    }

    // Show selfie flash for front camera (si activé)
    if (_isFrontCamera && _selfieFlashEnabled) {
      setState(() => _showSelfieFlash = true);
      // Laisser le temps à l'écran de s'illuminer et au capteur de s'adapter
      await Future.delayed(const Duration(milliseconds: 300));
    } else if (!_isFrontCamera) {
      _shutterController.forward(from: 0);
    }

    try {
      final image = await controller.takePicture();

      // Remettre le focus en auto
      try {
        await controller.setFocusMode(FocusMode.auto);
      } catch (e) {
        debugPrint('[HashCameraScreen] Restoring auto focus failed: $e');
      }

      // Hide selfie flash avec un petit délai pour l'effet
      if (_isFrontCamera && _selfieFlashEnabled && mounted) {
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() => _showSelfieFlash = false);
      }

      if (mounted) {
        _openPreview(image.path, false, isFrontCamera: _isFrontCamera);
      }
    } catch (e) {
      if (_isFrontCamera && mounted) {
        setState(() => _showSelfieFlash = false);
      }
      if (mounted) {
        showHashSnackBar(context, message: 'Erreur: $e', type: HashSnackBarType.error);
      }
    }
  }

  Future<void> _startRecording() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;
    if (controller.value.isRecordingVideo || _isSwitchingCamera) return;

    HapticFeedback.heavyImpact();

    try {
      // Activer la torche si le flash est activé (pour la vidéo)
      if (!_isFrontCamera && _flashMode == FlashMode.always) {
        try {
          await controller.setFlashMode(FlashMode.torch);
        } catch (e) {
          debugPrint('[HashCameraScreen] Enabling torch for recording failed: $e');
        }
      }

      await controller.startVideoRecording();

      setState(() {
        _isRecording = true;
        _isRecordingLocked = false;
        _recordingDuration = Duration.zero;
      });

      _recordingController.repeat(reverse: true);

      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted && _isRecording) {
          setState(() {
            _recordingDuration += const Duration(seconds: 1);
          });

          // Auto-stop at max duration
          if (_recordingDuration.inSeconds >= _maxVideoDurationSeconds) {
            _stopRecording();
          }
        }
      });
    } catch (e) {
      if (mounted) {
        showHashSnackBar(context, message: 'Erreur: $e', type: HashSnackBarType.error);
      }
    }
  }

  void _toggleRecordingLock() {
    if (!_isRecording) return;
    HapticFeedback.mediumImpact();
    setState(() => _isRecordingLocked = true);
  }

  Future<void> _stopRecording() async {
    if (_controller == null || !_controller!.value.isRecordingVideo) return;

    _recordingTimer?.cancel();
    _recordingController.stop();
    _recordingController.reset();

    HapticFeedback.mediumImpact();

    try {
      final video = await _controller!.stopVideoRecording();

      // Éteindre la torche
      if (!_isFrontCamera) {
        try {
          await _controller!.setFlashMode(_flashMode);
        } catch (e) {
          debugPrint('[HashCameraScreen] Restoring flash mode after recording failed: $e');
        }
      }

      setState(() {
        _isRecording = false;
        _isRecordingLocked = false;
      });

      if (mounted) {
        _openPreview(video.path, true);
      }
    } catch (e) {
      setState(() {
        _isRecording = false;
        _isRecordingLocked = false;
      });
      if (mounted) {
        showHashSnackBar(context, message: 'Erreur: $e', type: HashSnackBarType.error);
      }
    }
  }

  void _openPreview(String path, bool isVideo, {bool isFrontCamera = false, bool isFromGallery = false}) async {
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MediaPreviewScreen(
          filePath: path,
          isVideo: isVideo,
          isFrontCamera: isFrontCamera,
          isFromGallery: isFromGallery,
          contactId: widget.contactId,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );

    if (result != null && mounted) {
      Navigator.of(context).pop(result);
    }
  }

  void _openGallery() async {
    if (_isRecording) return;

    HapticFeedback.selectionClick();

    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _GalleryPicker(),
    );

    if (result != null && mounted) {
      // Open preview for gallery item
      _openPreview(result['path'] as String, result['type'] == 'video', isFromGallery: true);
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  IconData get _flashIcon {
    // Pour la caméra frontale, afficher l'icône selon l'état du flash écran
    if (_isFrontCamera) {
      return _selfieFlashEnabled ? Icons.flash_on_rounded : Icons.flash_off_rounded;
    }

    // Pour la caméra arrière
    switch (_flashMode) {
      case FlashMode.off:
        return Icons.flash_off_rounded;
      case FlashMode.always:
        return Icons.flash_on_rounded;
      case FlashMode.auto:
        return Icons.flash_auto_rounded;
      default:
        return Icons.flash_off_rounded;
    }
  }

  bool get _isFlashActive {
    if (_isFrontCamera) {
      return _selfieFlashEnabled;
    }
    return _flashMode == FlashMode.always;
  }

  String get _timerLabel {
    if (_timerSeconds == 0) return '';
    return '${_timerSeconds}s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Camera preview
          if (_isInitializing)
            const Center(
              child: CircularProgressIndicator(color: AppColors.accentPrimary),
            )
          else if (_errorMessage != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, color: AppColors.error, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage!,
                      style: AppTypography.bodyMedium(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: _initializeCamera,
                      child: const Text('Réessayer'),
                    ),
                  ],
                ),
              ),
            )
          else if (_isInitialized && _controller != null)
            Builder(
              builder: (context) {
                final controller = _controller;
                if (controller == null || !controller.value.isInitialized) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.accentPrimary),
                  );
                }
                return GestureDetector(
                  onDoubleTap: _flipCamera,
                  onTapDown: _onTapFocus,
                  onScaleStart: _onScaleStart,
                  onScaleUpdate: _onScaleUpdate,
                  child: RepaintBoundary(
                    key: _previewKey,
                    child: ClipRect(
                      child: OverflowBox(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width *
                                controller.value.aspectRatio,
                            child: CameraPreview(controller),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          // Afficher l'image gelée pendant le changement de caméra
          else if (_isSwitchingCamera && _frozenFrame != null)
            Image.memory(
              _frozenFrame!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )
          else if (_isSwitchingCamera || _isInitializing)
            const Center(
              child: CircularProgressIndicator(color: AppColors.accentPrimary),
            ),

          // Timer countdown
          if (_isTimerRunning)
            Center(
              child: Text(
                '$_timerCountdown',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(color: Colors.black54, blurRadius: 20),
                  ],
                ),
              ).animate(onPlay: (c) => c.repeat()).scale(
                begin: const Offset(1.2, 1.2),
                end: const Offset(1, 1),
                duration: 500.ms,
              ).fadeOut(delay: 500.ms, duration: 500.ms),
            ),

          // Focus indicator
          if (_isFocusing && _focusPoint != null)
            Positioned(
              left: _focusPoint!.dx - 35,
              top: _focusPoint!.dy - 35,
              child: _FocusIndicator(controller: _focusController),
            ),

          // Shutter flash effect
          AnimatedBuilder(
            animation: _shutterController,
            builder: (context, child) {
              return IgnorePointer(
                child: Opacity(
                  opacity: _shutterController.value > 0.5
                      ? (1 - _shutterController.value) * 2
                      : _shutterController.value * 2,
                  child: Container(color: Colors.white),
                ),
              );
            },
          ),

          // Selfie flash overlay (screen flash for front camera - style Snapchat)
          if (_showSelfieFlash)
            IgnorePointer(
              child: AnimatedOpacity(
                opacity: _showSelfieFlash ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 100),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 1.5,
                      colors: [
                        Color(0xFFFFFBF0), // Blanc chaud au centre
                        Color(0xFFFFF8E1), // Jaune très clair
                        Color(0xFFFFECB3), // Ambre clair sur les bords
                      ],
                      stops: [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),

          // Top controls
          if (!_isTimerRunning)
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Close button
                  _ControlButton(
                    icon: Icons.close,
                    onTap: () => Navigator.of(context).pop(),
                  ),

                  // Recording indicator
                  if (_isRecording)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBuilder(
                            animation: _recordingController,
                            builder: (context, child) {
                              return Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.5 + _recordingController.value * 0.5),
                                  shape: BoxShape.circle,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _formatDuration(_recordingDuration),
                            style: AppTypography.labelMedium(color: Colors.white),
                          ),
                          Text(
                            ' / ${_formatDuration(const Duration(seconds: _maxVideoDurationSeconds))}',
                            style: AppTypography.labelSmall(color: Colors.white70),
                          ),
                        ],
                      ),
                    )
                  else
                    const SizedBox.shrink(),

                  // Top right controls (vertical column: flash on top, timer below)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Flash button (disponible pour les deux caméras)
                      _ControlButton(
                        icon: _flashIcon,
                        onTap: _toggleFlash,
                        isActive: _isFlashActive,
                      ),
                      // Timer button (seulement quand pas en enregistrement)
                      if (!_isRecording) ...[
                        const SizedBox(height: 8),
                        _ControlButton(
                          icon: _timerSeconds == 0 ? Icons.timer_outlined : Icons.timer,
                          label: _timerLabel,
                          onTap: _toggleTimer,
                          isActive: _timerSeconds > 0,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ).animate().fadeIn().slideY(begin: -0.3, end: 0),

          // Bottom controls
          if (!_isTimerRunning)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 24,
                  top: 24,
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

                    // Main controls row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Gallery button
                          _GalleryButton(
                            lastItem: _lastGalleryItem,
                            onTap: _isRecording ? null : _openGallery,
                          ),

                          // Shutter button
                          _ShutterButton(
                            isRecording: _isRecording,
                            isLocked: _isRecordingLocked,
                            progress: _recordingDuration.inSeconds / _maxVideoDurationSeconds,
                            onTap: _capturePhoto,
                            onLongPressStart: _startRecording,
                            onLongPressEnd: () {
                              if (!_isRecordingLocked) {
                                _stopRecording();
                              }
                            },
                            onLockTap: _toggleRecordingLock,
                            onStopTap: _stopRecording,
                          ),

                          // Flip camera button
                          _ControlButton(
                            icon: Icons.flip_camera_ios_rounded,
                            onTap: _isRecording ? () {} : _flipCamera,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideY(begin: 0.3, end: 0),
        ],
      ),
    );
  }
}

class _FocusIndicator extends StatelessWidget {
  final AnimationController controller;

  const _FocusIndicator({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.2 - (controller.value * 0.2),
          child: Opacity(
            opacity: 1.0 - (controller.value * 0.3),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.accentPrimary, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Helper class for lens info
class _LensInfo {
  final int index;
  final String label;
  final CameraDescription camera;

  _LensInfo({required this.index, required this.label, required this.camera});
}

class _LensSelector extends StatelessWidget {
  final List<_LensInfo> lenses;
  final int currentIndex;
  final Function(int) onSelect;

  const _LensSelector({
    required this.lenses,
    required this.currentIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: lenses.map((lens) {
          final isSelected = lens.index == currentIndex;
          return GestureDetector(
            onTap: () => onSelect(lens.index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 40,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.accentPrimary : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  lens.label,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;
  final double size;
  final String? label;

  const _ControlButton({
    required this.icon,
    required this.onTap,
    this.isActive = false,
    this.size = 44,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.accentPrimary
              : Colors.black.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.black : Colors.white,
              size: size * 0.5,
            ),
            if (label != null && label!.isNotEmpty)
              Positioned(
                bottom: 2,
                child: Text(
                  label!,
                  style: TextStyle(
                    color: isActive ? Colors.black : Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ShutterButton extends StatelessWidget {
  final bool isRecording;
  final bool isLocked;
  final double progress;
  final VoidCallback onTap;
  final VoidCallback onLongPressStart;
  final VoidCallback onLongPressEnd;
  final VoidCallback onLockTap;
  final VoidCallback onStopTap;

  const _ShutterButton({
    required this.isRecording,
    required this.isLocked,
    required this.progress,
    required this.onTap,
    required this.onLongPressStart,
    required this.onLongPressEnd,
    required this.onLockTap,
    required this.onStopTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 130, // Espace pour le cadenas au-dessus
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Lock button au-dessus (visible uniquement pendant l'enregistrement non verrouillé)
          if (isRecording && !isLocked)
            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: onLockTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.lock_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ).animate().fadeIn().slideY(begin: 0.5, end: 0),
            ),

          // Main button
          Positioned(
            bottom: 0,
            child: _ShutterButtonGesture(
              isRecording: isRecording,
              isLocked: isLocked,
              onTap: onTap,
              onLongPressStart: onLongPressStart,
              onLongPressEnd: onLongPressEnd,
              onStopTap: onStopTap,
              child: SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Progress ring (visible pendant l'enregistrement)
                    if (isRecording)
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 4,
                          backgroundColor: Colors.white.withValues(alpha: 0.3),
                          valueColor: const AlwaysStoppedAnimation(AppColors.error),
                        ),
                      ),

                    // Outer ring (visible quand pas en enregistrement)
                    if (!isRecording)
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                      ),

                    // Inner button
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isRecording ? (isLocked ? 40 : 60) : 68,
                      height: isRecording ? (isLocked ? 40 : 60) : 68,
                      decoration: BoxDecoration(
                        color: isRecording ? AppColors.error : Colors.white,
                        borderRadius: BorderRadius.circular(
                          isRecording ? (isLocked ? 8 : 30) : 34,
                        ),
                      ),
                      child: isRecording && isLocked
                          ? const Icon(Icons.stop, color: Colors.white, size: 24)
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryButton extends StatelessWidget {
  final AssetEntity? lastItem;
  final VoidCallback? onTap;

  const _GalleryButton({
    this.lastItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: onTap != null ? 1.0 : 0.5,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white30, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: lastItem != null
                ? FutureBuilder<Widget>(
                    future: _buildThumbnail(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) return snapshot.data!;
                      return _buildPlaceholder();
                    },
                  )
                : _buildPlaceholder(),
          ),
        ),
      ),
    );
  }

  Future<Widget> _buildThumbnail() async {
    final thumbData = await lastItem!.thumbnailDataWithSize(const ThumbnailSize(100, 100));
    if (thumbData != null) {
      return Image.memory(thumbData, fit: BoxFit.cover, width: 50, height: 50);
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade700,
      child: const Icon(Icons.photo_library_rounded, color: Colors.white54, size: 24),
    );
  }
}

class _GalleryPicker extends StatefulWidget {
  const _GalleryPicker();

  @override
  State<_GalleryPicker> createState() => _GalleryPickerState();
}

class _GalleryPickerState extends State<_GalleryPicker> {
  List<AssetEntity> _assets = [];
  List<AssetPathEntity> _albums = [];
  AssetPathEntity? _selectedAlbum;
  bool _isLoading = true;
  bool _isLoadingMore = false;
  int _currentPage = 0;
  static const int _pageSize = 50;
  bool _hasMore = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadAlbums();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _loadMoreAssets();
    }
  }

  Future<void> _loadAlbums() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.common,
      filterOption: FilterOptionGroup(
        orders: [const OrderOption(type: OrderOptionType.createDate, asc: false)],
      ),
    );

    if (albums.isNotEmpty && mounted) {
      setState(() {
        _albums = albums;
        _selectedAlbum = albums.first;
      });
      await _loadAssets();
    } else {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _loadAssets() async {
    if (_selectedAlbum == null) return;

    setState(() {
      _isLoading = true;
      _assets = [];
      _currentPage = 0;
      _hasMore = true;
    });

    final assets = await _selectedAlbum!.getAssetListPaged(page: 0, size: _pageSize);
    if (mounted) {
      setState(() {
        _assets = assets;
        _isLoading = false;
        _hasMore = assets.length >= _pageSize;
      });
    }
  }

  Future<void> _loadMoreAssets() async {
    if (_isLoadingMore || !_hasMore || _selectedAlbum == null) return;

    setState(() => _isLoadingMore = true);

    final nextPage = _currentPage + 1;
    final assets = await _selectedAlbum!.getAssetListPaged(page: nextPage, size: _pageSize);

    if (mounted) {
      setState(() {
        _currentPage = nextPage;
        _assets.addAll(assets);
        _isLoadingMore = false;
        _hasMore = assets.length >= _pageSize;
      });
    }
  }

  void _selectAlbum(AssetPathEntity album) {
    HapticFeedback.selectionClick();
    setState(() => _selectedAlbum = album);
    _loadAssets();
  }

  Future<void> _selectItem(int index) async {
    HapticFeedback.selectionClick();
    final asset = _assets[index];
    final file = await asset.file;
    if (file != null && mounted) {
      Navigator.of(context).pop({
        'type': asset.type == AssetType.video ? 'video' : 'photo',
        'path': file.path,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, sheetController) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return GlassTheme.bottomSheetWrapper(
          isDark: isDark,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Header avec sélecteur d'album
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _showAlbumPicker(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                _selectedAlbum?.name ?? 'Galerie',
                                style: AppTypography.headlineSmall(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.accentPrimary))
                    : _assets.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.photo_library_outlined, color: Colors.white30, size: 64),
                                const SizedBox(height: 16),
                                Text('Aucun média', style: AppTypography.bodyMedium(color: Colors.white54)),
                              ],
                            ),
                          )
                        : GridView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.all(2),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2,
                            ),
                            itemCount: _assets.length + (_hasMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index >= _assets.length) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(
                                      color: AppColors.accentPrimary,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                );
                              }
                              return _AssetThumbnail(
                                asset: _assets[index],
                                onTap: () => _selectItem(index),
                              );
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAlbumPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return GlassTheme.bottomSheetWrapper(
          isDark: isDark,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Albums', style: AppTypography.headlineSmall(color: Colors.white)),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _albums.length,
                  itemBuilder: (context, index) {
                    final album = _albums[index];
                    final isSelected = album.id == _selectedAlbum?.id;
                    return ListTile(
                      leading: FutureBuilder<int>(
                        future: album.assetCountAsync,
                        builder: (context, snapshot) {
                          return Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.photo_library, color: Colors.white54),
                          );
                        },
                      ),
                      title: Text(
                        album.name,
                        style: TextStyle(
                          color: isSelected ? AppColors.accentPrimary : Colors.white,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      subtitle: FutureBuilder<int>(
                        future: album.assetCountAsync,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data ?? 0} éléments',
                            style: TextStyle(color: Colors.white54),
                          );
                        },
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: AppColors.accentPrimary)
                          : null,
                      onTap: () {
                        Navigator.pop(context);
                        _selectAlbum(album);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
            ],
          ),
        );
      },
    );
  }
}

/// Widget personnalisé pour gérer les gestes du bouton shutter avec un délai de long-press réduit
class _ShutterButtonGesture extends StatefulWidget {
  final bool isRecording;
  final bool isLocked;
  final VoidCallback onTap;
  final VoidCallback onLongPressStart;
  final VoidCallback onLongPressEnd;
  final VoidCallback onStopTap;
  final Widget child;

  const _ShutterButtonGesture({
    required this.isRecording,
    required this.isLocked,
    required this.onTap,
    required this.onLongPressStart,
    required this.onLongPressEnd,
    required this.onStopTap,
    required this.child,
  });

  @override
  State<_ShutterButtonGesture> createState() => _ShutterButtonGestureState();
}

class _ShutterButtonGestureState extends State<_ShutterButtonGesture> {
  Timer? _longPressTimer;
  bool _isLongPress = false;
  static const Duration _longPressDelay = Duration(milliseconds: 150); // Délai très court

  void _onPointerDown(PointerDownEvent event) {
    if (widget.isRecording && widget.isLocked) {
      // Si verrouillé, un simple tap arrête l'enregistrement
      return;
    }

    if (widget.isRecording) {
      // Si en cours d'enregistrement (non verrouillé), ne rien faire au touch down
      return;
    }

    _isLongPress = false;
    _longPressTimer = Timer(_longPressDelay, () {
      _isLongPress = true;
      widget.onLongPressStart();
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    _longPressTimer?.cancel();
    _longPressTimer = null;

    if (widget.isRecording && widget.isLocked) {
      // Si verrouillé, arrêter l'enregistrement
      widget.onStopTap();
      return;
    }

    if (_isLongPress) {
      // Long press terminé -> arrêter l'enregistrement
      widget.onLongPressEnd();
    } else if (!widget.isRecording) {
      // Tap simple -> prendre une photo
      widget.onTap();
    }

    _isLongPress = false;
  }

  void _onPointerCancel(PointerCancelEvent event) {
    _longPressTimer?.cancel();
    _longPressTimer = null;

    if (_isLongPress && !widget.isLocked) {
      widget.onLongPressEnd();
    }
    _isLongPress = false;
  }

  @override
  void dispose() {
    _longPressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      behavior: HitTestBehavior.opaque,
      child: widget.child,
    );
  }
}

class _AssetThumbnail extends StatelessWidget {
  final AssetEntity asset;
  final VoidCallback onTap;

  const _AssetThumbnail({required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder<Widget>(
            future: _buildThumbnail(),
            builder: (context, snapshot) {
              if (snapshot.hasData) return snapshot.data!;
              return Container(color: Colors.grey.shade800);
            },
          ),
          if (asset.type == AssetType.video)
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _formatDuration(asset.videoDuration),
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<Widget> _buildThumbnail() async {
    final thumbData = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
    if (thumbData != null) {
      return Image.memory(thumbData, fit: BoxFit.cover);
    }
    return Container(color: Colors.grey.shade800);
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
