import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

import '../../../core/theme/app_colors.dart';
import '../../../core/services/livekit_service.dart';

/// Vue Picture-in-Picture de la vidéo locale (draggable)
class LocalVideoPip extends StatelessWidget {
  final LiveKitService livekitService;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final bool isFrontCamera;

  const LocalVideoPip({
    super.key,
    required this.livekitService,
    this.onTap,
    this.width = 120,
    this.height = 160,
    this.isFrontCamera = true,
  });

  @override
  Widget build(BuildContext context) {
    final localTrack = livekitService.getLocalVideoTrack();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.06),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Vidéo locale
            if (localTrack != null)
              SizedBox.expand(
                child: lk.VideoTrackRenderer(
                  localTrack,
                  fit: lk.VideoViewFit.cover,
                  mirrorMode: isFrontCamera
                      ? lk.VideoViewMirrorMode.mirror
                      : lk.VideoViewMirrorMode.off,
                ),
              )
            else
              const Center(
                child: Icon(
                  Icons.videocam_off,
                  color: AppColors.textSecondaryDark,
                  size: 32,
                ),
              ),

            // Indicateur de tap pour changer de caméra
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.darkBackground.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.cameraswitch,
                  color: AppColors.textPrimaryDark,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
