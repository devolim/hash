import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../config/supabase_config.dart';
import '../../../core/services/clipboard_service.dart';
import 'location_picker_screen.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/message.dart';
import '../../../core/utils/media_utils.dart';
import '../common/hash_snack_bar.dart';
import 'voice_playback_controller.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? customBubbleColor;
  final List<Color>? customBubbleGradient;
  final VoicePlaybackController? voicePlaybackController;
  final int? voiceGroupIndex;
  final Function(String title, String editorContent)? onAddToNotes;
  final VoidCallback? onRetry;

  const MessageBubble({
    super.key,
    required this.message,
    this.onTap,
    this.onLongPress,
    this.customBubbleColor,
    this.customBubbleGradient,
    this.voicePlaybackController,
    this.voiceGroupIndex,
    this.onAddToNotes,
    this.onRetry,
  });

  /// Get contrasting text color for bubble
  Color _getTextColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  /// Check if message is a media type (image/video)
  bool get _isMediaMessage =>
      message.type == MessageType.image || message.type == MessageType.video;

  /// Calcule les dimensions d'affichage d'un média (partagé entre thumbnail et image)
  ({double width, double height}) get _mediaDisplaySize {
    const double maxW = 180;
    const double maxH = 260;
    double w = maxW;
    double h = 200;

    if (message.mediaWidth != null && message.mediaHeight != null && message.mediaWidth! > 0) {
      final ratio = message.mediaHeight! / message.mediaWidth!;
      h = w * ratio;
      if (h > maxH) {
        h = maxH;
        w = maxH / ratio;
      }
      if (h < 80.0) {
        h = 80.0;
      }
    }
    return (width: w, height: h);
  }

  /// Placeholder pour un message supprimé pour tous
  Widget _buildDeletedPlaceholder(bool isOutgoing, bool isDark) {
    final text = message.deletedByName == null
        ? 'Vous avez supprimé ce message'
        : '${message.deletedByName} a supprimé ce message';

    final placeholder = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.04)
            : Colors.black.withValues(alpha: 0.04),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(18),
          topRight: const Radius.circular(18),
          bottomLeft: Radius.circular(isOutgoing ? 18 : 4),
          bottomRight: Radius.circular(isOutgoing ? 4 : 18),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.block,
            size: 16,
            color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: AppTypography.bodySmall(
                color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
              ).copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: EdgeInsets.only(
          left: isOutgoing ? 64 : 0,
          right: isOutgoing ? 0 : 64,
          top: 4,
          bottom: 4,
        ),
        child: Align(
          alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
          child: placeholder,
        ),
      ),
    );
  }

  /// Build media bubble with overlay timestamp
  Widget _buildMediaBubbleContent(bool isOutgoing, Color sentTextColor, bool isDark) {
    return Stack(
      children: [
        // Media content
        _buildContent(isOutgoing, isOutgoing ? sentTextColor : Colors.white),

        // Overlay timestamp
        Positioned(
          bottom: 6,
          right: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatTime(message.timestamp),
                  style: AppTypography.timestamp(color: Colors.white.withValues(alpha: 0.9)),
                ),
                if (isOutgoing) ...[
                  const SizedBox(width: 4),
                  _buildStatusIcon(Colors.white),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Get padding based on message type
  EdgeInsets _getMessagePadding() {
    switch (message.type) {
      case MessageType.file:
      case MessageType.contact:
      case MessageType.note:
        return const EdgeInsets.all(8);
      case MessageType.location:
        return EdgeInsets.zero;
      case MessageType.image:
      case MessageType.video:
        // Padding normal pour vue unique (comme texte), zéro pour média normal
        return message.isViewOnce
            ? const EdgeInsets.symmetric(horizontal: 14, vertical: 12)
            : EdgeInsets.zero;
      default:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isOutgoing = message.isOutgoing;

    // Placeholder pour message supprimé pour tous
    if (message.isDeletedForEveryone) {
      return _buildDeletedPlaceholder(isOutgoing, isDark);
    }

    // Bubble colors and gradient
    final hasGradient = customBubbleGradient != null && customBubbleGradient!.length >= 2;
    final sentBubbleColor = customBubbleColor ?? AppColors.sentMessageBubble;
    final receivedBubbleColor = isDark ? Colors.black : Colors.white;

    // Text colors based on bubble luminance (use first gradient color for luminance calc)
    final sentTextColor = _getTextColor(hasGradient ? customBubbleGradient![0] : sentBubbleColor);
    final receivedTextColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;

    final isFailed = isOutgoing && message.status == MessageStatus.failed;

    final bubble = Container(
            padding: _getMessagePadding(),
            decoration: BoxDecoration(
              color: isOutgoing
                  ? (hasGradient ? null : sentBubbleColor)
                  : receivedBubbleColor,
              gradient: isOutgoing && hasGradient
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: customBubbleGradient!,
                    )
                  : null,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: Radius.circular(isOutgoing ? 18 : 4),
                bottomRight: Radius.circular(isOutgoing ? 4 : 18),
              ),
              border: isOutgoing || (_isMediaMessage && !message.isViewOnce) || message.type == MessageType.location
                  ? null
                  : Border.all(
                      color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
                      width: 1,
                    ),
            ),
            child: (_isMediaMessage && !message.isViewOnce) || message.type == MessageType.location
                ? _buildMediaBubbleContent(isOutgoing, sentTextColor, isDark)
                : message.type == MessageType.voice
                    ? _buildVoiceMessage(isOutgoing, isOutgoing ? sentTextColor : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight), isDark)
                    : message.type == MessageType.file
                    ? _buildFileMessage(isOutgoing, isOutgoing ? sentTextColor : receivedTextColor, isDark: isDark)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Message content based on type
                          _buildContent(isOutgoing, isOutgoing ? sentTextColor : receivedTextColor, isDark: isDark),

                          // Time and status (masqué pour vue unique car intégré dans la bulle)
                          if (!message.isViewOnce) ...[
                            const SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _formatTime(message.timestamp),
                                  style: AppTypography.timestamp(
                                    color: isOutgoing
                                        ? sentTextColor.withValues(alpha: 0.7)
                                        : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
                                  ),
                                ),
                                if (isOutgoing) ...[
                                  const SizedBox(width: 4),
                                  _buildStatusIcon(sentTextColor),
                                ],
                              ],
                            ),
                          ],
                        ],
                      ),
    );

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: EdgeInsets.only(
          left: isOutgoing ? 64 : 0,
          right: isOutgoing ? 0 : 64,
          top: 4,
          bottom: 4,
        ),
        child: Align(
          alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
          child: isFailed && onRetry != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onRetry,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(
                          Icons.refresh_rounded,
                          size: 20,
                          color: AppColors.error,
                        ),
                      ),
                    ),
                    bubble,
                  ],
                )
              : bubble,
        ),
      ).animate().fadeIn(duration: 200.ms).slideY(begin: 0.1, end: 0),
    );
  }

  Widget _buildContent(bool isOutgoing, Color textColor, {bool isDark = true}) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.content,
          style: AppTypography.bodyMedium(color: textColor).copyWith(fontSize: 15.5),
        );

      case MessageType.image:
        if (message.isViewOnce) {
          return _buildViewOnceMedia(isOutgoing, textColor, isVideo: false, isDark: isDark);
        }
        return _buildImageMessage();

      case MessageType.video:
        if (message.isViewOnce) {
          return _buildViewOnceMedia(isOutgoing, textColor, isVideo: true, isDark: isDark);
        }
        return _buildVideoMessage();

      case MessageType.voice:
        return _buildVoiceMessage(isOutgoing, textColor, false);

      case MessageType.file:
        return _buildFileMessage(isOutgoing, textColor);

      case MessageType.contact:
        return _buildContactMessage(isOutgoing, textColor);

      case MessageType.location:
        return _buildLocationMessage(isOutgoing, textColor);

      case MessageType.note:
        return _buildNoteMessage(isOutgoing, textColor);

      case MessageType.reaction:
      case MessageType.edit:
      case MessageType.delete:
        // Reactions, edits and deletes are metadata messages, not displayed as bubbles
        return const SizedBox.shrink();
    }
  }

  /// Vérifie si un média distant nécessite un téléchargement
  bool get _needsRemoteDownload {
    final dlStatus = message.mediaDownloadStatus;
    return dlStatus != null && dlStatus != 2; // 2 = done
  }

  /// Construit le widget pour un média distant pas encore téléchargé
  Widget _buildRemoteMediaPlaceholder(Color textColor) {
    final dlStatus = message.mediaDownloadStatus ?? 0;
    final hasThumbnail = message.mediaThumbnail != null && message.mediaThumbnail!.isNotEmpty;

    // Expiré
    if (dlStatus == 4) {
      return Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.timer_off_rounded, size: 40, color: textColor.withValues(alpha: 0.5)),
            const SizedBox(height: 8),
            Text('Média expiré', style: AppTypography.labelMedium(color: textColor.withValues(alpha: 0.5))),
          ],
        ),
      );
    }

    // Icône d'action + label selon l'état
    Widget buildActionOverlay() {
      if (dlStatus == 0 || dlStatus == 1) {
        // Pending ou downloading : spinner
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50, height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('Téléchargement...', style: AppTypography.labelSmall(color: Colors.white)),
            ),
          ],
        );
      } else if (dlStatus == 3) {
        // Failed : icône erreur + retry
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50, height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.error_outline_rounded, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text('Échec du téléchargement', style: AppTypography.labelSmall(color: Colors.white)),
                  const SizedBox(height: 2),
                  Text('Toucher pour réessayer', style: AppTypography.labelSmall(color: Colors.white.withValues(alpha: 0.7))),
                ],
              ),
            ),
          ],
        );
      }
      return const SizedBox.shrink();
    }

    // Avec thumbnail : utiliser les dimensions originales pour le ratio
    if (hasThumbnail) {
      final size = _mediaDisplaySize;

      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.memory(
                base64Decode(message.mediaThumbnail!),
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
                errorBuilder: (_, __, ___) => Container(
                  width: 200, height: 200,
                  color: Colors.black,
                ),
              ),
              buildActionOverlay(),
              if (message.mediaSizeBytes != null)
                Positioned(
                  bottom: 8, right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(message.formattedSize, style: AppTypography.labelSmall(color: Colors.white)),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    // Sans thumbnail : fallback avec dimensions carrées
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildActionOverlay(),
            if (message.mediaSizeBytes != null)
              Positioned(
                bottom: 8, right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(message.formattedSize, style: AppTypography.labelSmall(color: Colors.white)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Affiche une image normale (non vue unique)
  Widget _buildImageMessage() {
    // Cas média distant pas encore téléchargé
    if (_needsRemoteDownload) {
      return _buildRemoteMediaPlaceholder(Colors.white);
    }

    // Résoudre le chemin en tenant compte des changements d'UUID iOS
    final resolvedPath = MediaUtils.resolvePath(message.mediaUrl) ??
        (message.content.isNotEmpty ? message.content : null);
    final size = _mediaDisplaySize;

    if (resolvedPath == null || !File(resolvedPath).existsSync()) {
      return SizedBox(
        width: size.width,
        height: size.height,
        child: _buildMediaFallback(Icons.image_outlined, 'Image'),
      );
    }

    final file = File(resolvedPath);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Image.file(
          file,
          fit: BoxFit.cover,
          width: size.width,
          height: size.height,
          errorBuilder: (context, error, stackTrace) {
            return _buildMediaFallback(Icons.image_outlined, 'Image');
          },
        ),
      ),
    );
  }

  /// Affiche une vidéo normale (non vue unique) - thumbnail avec icône play
  Widget _buildVideoMessage() {
    if (_needsRemoteDownload) {
      return _buildRemoteMediaPlaceholder(Colors.white);
    }

    final resolvedPath = MediaUtils.resolvePath(message.mediaUrl) ??
        (message.content.isNotEmpty ? message.content : null);
    if (resolvedPath == null) {
      return _buildMediaFallback(Icons.videocam_outlined, 'Vidéo');
    }

    return _VideoThumbnailWidget(
      videoPath: resolvedPath,
      duration: message.mediaDurationSeconds != null ? message.formattedDuration : null,
    );
  }

  /// Affiche un média vue unique (photo ou vidéo)
  Widget _buildViewOnceMedia(bool isOutgoing, Color textColor, {required bool isVideo, required bool isDark}) {
    final isOpened = message.viewOnceOpened;
    final duration = message.viewOnceDuration ?? 5;
    final label = isVideo ? 'Vidéo à vue unique' : 'Photo à vue unique';
    final expiredLabel = isVideo ? 'Vidéo expirée' : 'Photo expirée';

    // L'expéditeur ne peut jamais voir le contenu — affichage dédié
    final IconData iconData;
    final String displayLabel;
    final String? subtitle;
    final double iconAlpha;
    final double textAlpha;

    if (isOutgoing) {
      // Expéditeur : toujours affiché comme "envoyé", jamais ouvrable
      iconData = Icons.visibility_off_rounded;
      displayLabel = label;
      subtitle = isOpened ? 'Ouvert' : 'Envoyé · ${duration}s';
      iconAlpha = 0.6;
      textAlpha = 1.0;
    } else if (isOpened) {
      // Destinataire : déjà ouvert
      iconData = Icons.visibility_off_rounded;
      displayLabel = expiredLabel;
      subtitle = null;
      iconAlpha = 0.4;
      textAlpha = 0.5;
    } else {
      // Destinataire : pas encore ouvert
      iconData = Icons.visibility_rounded;
      displayLabel = label;
      subtitle = 'Appuyez pour ouvrir · ${duration}s';
      iconAlpha = 1.0;
      textAlpha = 1.0;
    }

    final timestampColor = isOutgoing
        ? textColor.withValues(alpha: 0.7)
        : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight);

    return Container(
      width: 200,
      child: Row(
        children: [
          // Icône sans fond
          Icon(
            iconData,
            size: 22,
            color: textColor.withValues(alpha: iconAlpha),
          ),
          const SizedBox(width: 12),
          // Texte
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  displayLabel,
                  style: AppTypography.bodyMedium(
                    color: textColor.withValues(alpha: textAlpha),
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        subtitle,
                        style: AppTypography.labelSmall(
                          color: textColor.withValues(alpha: 0.6),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _formatTime(message.timestamp),
                        style: AppTypography.timestamp(color: timestampColor),
                      ),
                      if (isOutgoing) ...[
                        const SizedBox(width: 4),
                        _buildStatusIcon(textColor),
                      ],
                    ],
                  ),
                ] else ...[
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        _formatTime(message.timestamp),
                        style: AppTypography.timestamp(color: timestampColor),
                      ),
                      if (isOutgoing) ...[
                        const SizedBox(width: 4),
                        _buildStatusIcon(textColor),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Fallback pour les médias non trouvés
  Widget _buildMediaFallback(IconData icon, String label) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: AppColors.textSecondaryDark),
          const SizedBox(height: 8),
          Text(label, style: AppTypography.labelMedium()),
        ],
      ),
    );
  }

  Widget _buildVoiceMessage(bool isOutgoing, Color textColor, bool isDark) {
    // État de téléchargement distant
    final dlStatus = message.mediaDownloadStatus;
    final isRemotePending = dlStatus != null && dlStatus != 2;

    // Si le fichier est disponible localement, utiliser le lecteur audio
    final rawAudioPath = message.mediaUrl ?? message.content;
    final resolvedAudioPath = MediaUtils.resolvePath(rawAudioPath) ??
        (File(rawAudioPath).existsSync() ? rawAudioPath : null);
    final audioPath = resolvedAudioPath ?? rawAudioPath;
    final hasLocalFile = !isRemotePending && resolvedAudioPath != null;

    final timestampColor = isOutgoing
        ? textColor.withValues(alpha: 0.7)
        : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight);

    if (hasLocalFile) {
      return _VoicePlayerWidget(
        filePath: audioPath,
        duration: message.mediaDurationSeconds,
        textColor: textColor,
        messageId: message.id,
        controller: voicePlaybackController,
        groupIndex: voiceGroupIndex,
        timestamp: _formatTime(message.timestamp),
        timestampColor: timestampColor,
        statusIcon: isOutgoing ? _buildStatusIcon(textColor) : null,
      );
    }

    // Sinon afficher l'état de téléchargement
    Widget leadingIcon;
    if (isRemotePending && dlStatus == 1) {
      leadingIcon = SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: textColor.withValues(alpha: 0.7),
        ),
      );
    } else {
      IconData playIcon = Icons.play_arrow;
      if (isRemotePending) {
        if (dlStatus == 4) {
          playIcon = Icons.timer_off_rounded;
        } else if (dlStatus == 3) {
          playIcon = Icons.refresh_rounded;
        } else {
          playIcon = Icons.download_rounded;
        }
      }
      leadingIcon = Icon(playIcon, color: textColor, size: 22);
    }

    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Column(
        children: [
          // Ligne principale : icône + placeholder waveform
          Row(
            children: [
              SizedBox(width: 28, height: 28, child: Center(child: leadingIcon)),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  height: 28,
                  decoration: BoxDecoration(
                    color: textColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Ligne inférieure : durée + heure + status
          Row(
            children: [
              Text(
                dlStatus == 4 ? 'Expiré' : message.formattedDuration,
                style: AppTypography.labelSmall(
                  color: textColor.withValues(alpha: 0.7),
                ),
              ),
              const Spacer(),
              Text(
                _formatTime(message.timestamp),
                style: AppTypography.timestamp(color: timestampColor),
              ),
              if (isOutgoing) ...[
                const SizedBox(width: 4),
                _buildStatusIcon(textColor),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _truncateFileName(String name, int maxLength) {
    if (name.length <= maxLength) return name;
    final dotIndex = name.lastIndexOf('.');
    if (dotIndex <= 0) {
      return '${name.substring(0, maxLength - 3)}...';
    }
    final ext = name.substring(dotIndex); // ".pdf"
    final available = maxLength - ext.length - 3; // 3 for "..."
    if (available <= 0) return '...${name.substring(name.length - maxLength + 3)}';
    return '${name.substring(0, available)}...$ext';
  }

  IconData _getFileIconByMimeType(String? mimeType) {
    if (mimeType == null) return Icons.insert_drive_file;

    if (mimeType.startsWith('application/pdf')) return Icons.picture_as_pdf;
    if (mimeType.startsWith('application/vnd.openxmlformats-officedocument.wordprocessingml') ||
        mimeType.startsWith('application/msword')) return Icons.description;
    if (mimeType.startsWith('application/vnd.openxmlformats-officedocument.spreadsheetml') ||
        mimeType.startsWith('application/vnd.ms-excel')) return Icons.grid_on;
    if (mimeType.startsWith('application/vnd.openxmlformats-officedocument.presentationml') ||
        mimeType.startsWith('application/vnd.ms-powerpoint')) return Icons.slideshow;
    if (mimeType.startsWith('application/zip') ||
        mimeType.startsWith('application/x-rar') ||
        mimeType.startsWith('application/x-7z')) return Icons.folder_zip;
    if (mimeType.startsWith('text/')) return Icons.text_snippet;
    if (mimeType.startsWith('audio/')) return Icons.audio_file;

    return Icons.insert_drive_file;
  }

  Widget _buildFileMessage(bool isOutgoing, Color textColor, {bool isDark = true}) {
    final dlStatus = message.mediaDownloadStatus;
    final isRemotePending = dlStatus != null && dlStatus != 2;

    IconData fileIcon = _getFileIconByMimeType(message.mediaMimeType);
    Widget? actionWidget;

    if (isRemotePending) {
      if (dlStatus == 4) {
        fileIcon = Icons.timer_off_rounded;
      } else if (dlStatus == 1) {
        actionWidget = SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: textColor.withValues(alpha: 0.7),
          ),
        );
      } else if (dlStatus == 3) {
        fileIcon = Icons.refresh_rounded;
      } else {
        fileIcon = Icons.download_rounded;
      }
    }

    final timestampColor = isOutgoing
        ? textColor.withValues(alpha: 0.7)
        : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight);

    final fileName = message.mediaName ?? 'Fichier';
    final sizeLabel = dlStatus == 4 ? 'Expiré' : message.formattedSize;

    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          actionWidget ?? Icon(fileIcon, color: textColor, size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _truncateFileName(fileName, 22),
                  style: AppTypography.labelMedium(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      sizeLabel,
                      style: AppTypography.labelSmall(
                        color: textColor.withValues(alpha: 0.7),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _formatTime(message.timestamp),
                      style: AppTypography.timestamp(color: timestampColor),
                    ),
                    if (isOutgoing) ...[
                      const SizedBox(width: 4),
                      _buildStatusIcon(textColor),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactMessage(bool isOutgoing, Color textColor) {
    // Parse contact info: "Nom\nNuméro" format
    final parts = message.content.split('\n');
    final name = parts.isNotEmpty ? parts[0] : 'Contact';
    final phone = parts.length > 1 ? parts[1] : '';

    return _ContactBubbleContent(
      name: name,
      phone: phone,
      textColor: textColor,
      isOutgoing: isOutgoing,
    );
  }

  Widget _buildLocationMessage(bool isOutgoing, Color textColor) {
    // Parse "lat,lng\nAdresse"
    final lines = message.content.split('\n');
    final coords = lines.first.split(',');
    final address = lines.length > 1 ? lines.sublist(1).join('\n') : '';

    double? lat;
    double? lng;
    try {
      lat = double.parse(coords[0].trim());
      lng = double.parse(coords[1].trim());
    } catch (_) {}

    if (lat == null || lng == null) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Text('Position invalide', style: AppTypography.bodyMedium(color: textColor).copyWith(fontSize: 15.5)),
      );
    }

    // Image statique Mapbox (vue à plat pour la bulle)
    final staticMapUrl =
        'https://api.mapbox.com/styles/v1/mapbox/dark-v11/static/'
        'pin-l+ffab00($lng,$lat)/'
        '$lng,$lat,14,0,0/440x300@2x'
        '?access_token=${MapboxConfig.accessToken}';

    return _LocationBubbleContent(
      lat: lat,
      lng: lng,
      address: address,
      staticMapUrl: staticMapUrl,
      isOutgoing: isOutgoing,
      textColor: textColor,
    );
  }

  Widget _buildNoteMessage(bool isOutgoing, Color textColor) {
    String title = 'Note';
    String editorContent = '';
    try {
      final data = jsonDecode(message.content) as Map<String, dynamic>;
      title = data['title'] as String? ?? 'Note';
      editorContent = data['editorContent'] as String? ?? '';
    } catch (_) {
      title = message.content.isNotEmpty ? message.content : 'Note';
    }

    return _NoteBubbleContent(
      title: title,
      editorContent: editorContent,
      textColor: textColor,
      isOutgoing: isOutgoing,
      onAddToNotes: onAddToNotes,
    );
  }

  Widget _buildStatusIcon(Color textColor) {
    switch (message.status) {
      case MessageStatus.sending:
        return SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor: AlwaysStoppedAnimation<Color>(
              textColor.withValues(alpha: 0.7),
            ),
          ),
        );

      case MessageStatus.sent:
        return Icon(
          Icons.done,
          size: 14,
          color: textColor.withValues(alpha: 0.7),
        );

      case MessageStatus.delivered:
        return Icon(
          Icons.done_all,
          size: 14,
          color: textColor.withValues(alpha: 0.7),
        );

      case MessageStatus.read:
        return Icon(
          Icons.visibility,
          size: 14,
          color: textColor,
        );

      case MessageStatus.failed:
        return const Icon(
          Icons.warning_amber_rounded,
          size: 14,
          color: AppColors.error,
        );

      case MessageStatus.queued:
        return Icon(
          Icons.schedule,
          size: 14,
          color: textColor.withValues(alpha: 0.5),
        );
    }
  }

  String _formatTime(DateTime time) {
    final localTime = time.toLocal();
    return '${localTime.hour}:${localTime.minute.toString().padLeft(2, '0')}';
  }
}

/// Widget pour la bulle note partagée
class _NoteBubbleContent extends StatelessWidget {
  final String title;
  final String editorContent;
  final Color textColor;
  final bool isOutgoing;
  final Function(String title, String editorContent)? onAddToNotes;

  const _NoteBubbleContent({
    required this.title,
    required this.editorContent,
    required this.textColor,
    required this.isOutgoing,
    this.onAddToNotes,
  });

  @override
  Widget build(BuildContext context) {
    final displayTitle = title.isEmpty ? 'Sans titre' : title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Carte note : icône + titre
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: textColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sticky_note_2_outlined,
                color: AppColors.accentPrimary,
                size: 22,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  displayTitle,
                  style: AppTypography.bodyMedium(color: textColor).copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        // Bouton "Ajouter à mes notes" (seulement pour les messages reçus)
        if (!isOutgoing && onAddToNotes != null) ...[
          const SizedBox(height: 6),
          GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              onAddToNotes!(title, editorContent);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accentPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.note_add_outlined,
                    size: 16,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Ajouter à mes notes',
                    style: AppTypography.labelSmall(
                      color: Colors.black,
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Widget pour la bulle contact avec action d'ajout
class _ContactBubbleContent extends StatelessWidget {
  final String name;
  final String phone;
  final Color textColor;
  final bool isOutgoing;

  const _ContactBubbleContent({
    required this.name,
    required this.phone,
    required this.textColor,
    required this.isOutgoing,
  });

  Future<void> _addToContacts(BuildContext context) async {
    HapticFeedback.mediumImpact();

    // Créer un nouveau contact
    final newContact = Contact()
      ..name.first = name.split(' ').first
      ..name.last = name.split(' ').skip(1).join(' ');

    if (phone.isNotEmpty) {
      newContact.phones = [Phone(phone)];
    }

    try {
      // Ouvrir la page d'édition du contact dans l'app Contacts
      await FlutterContacts.openExternalInsert(newContact);
    } catch (e) {
      if (context.mounted) {
        showHashSnackBar(context, message: 'Erreur: $e', type: HashSnackBarType.error);
      }
    }
  }

  void _showContactDetails(BuildContext context) async {
    HapticFeedback.lightImpact();

    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => GlassTheme.bottomSheetWrapper(
        isDark: isDark,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),

              // Avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.accentPrimary,
                      AppColors.accentPrimary.withValues(alpha: 0.7),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    name.isNotEmpty ? name[0].toUpperCase() : '?',
                    style: AppTypography.headlineLarge(
                      color: Colors.black,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Nom
              Text(
                name,
                style: AppTypography.headlineMedium(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // Infos
              if (phone.isNotEmpty)
                _ContactInfoRow(
                  icon: Icons.phone_rounded,
                  label: 'Téléphone',
                  value: phone,
                  isDark: isDark,
                  onTap: () {
                    ClipboardService().copyWithAutoExpiry(phone);
                    HapticFeedback.lightImpact();
                    showHashSnackBar(ctx, message: 'Numéro copié', type: HashSnackBarType.success, duration: const Duration(seconds: 1));
                  },
                ),

              if (!isOutgoing) ...[
                const SizedBox(height: 24),

                // Bouton ajouter (seulement pour les messages reçus)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(ctx);
                      _addToContacts(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.accentPrimary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person_add_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Ajouter aux contacts',
                            style: AppTypography.labelLarge(
                              color: Colors.black,
                            ).copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );

    // Empêcher le clavier de se réouvrir après fermeture
    if (context.mounted) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showContactDetails(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Carte contact
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: textColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Avatar
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.accentPrimary,
                        AppColors.accentPrimary.withValues(alpha: 0.7),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      name.isNotEmpty ? name[0].toUpperCase() : '?',
                      style: AppTypography.labelLarge(
                        color: Colors.black,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Info
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTypography.bodyMedium(color: textColor).copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (phone.isNotEmpty) ...[
                        const SizedBox(height: 1),
                        Text(
                          phone,
                          style: AppTypography.bodySmall(
                            color: textColor.withValues(alpha: 0.7),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right_rounded,
                  color: textColor.withValues(alpha: 0.5),
                  size: 20,
                ),
              ],
            ),
          ),

          if (!isOutgoing) ...[
            const SizedBox(height: 6),

            // Bouton d'action compact (seulement pour les messages reçus)
            GestureDetector(
              onTap: () => _addToContacts(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_add_rounded,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Ajouter aux contacts',
                      style: AppTypography.labelSmall(
                        color: Colors.black,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isDark;
  final VoidCallback? onTap;

  const _ContactInfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.isDark,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accentPrimary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppColors.accentPrimary, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTypography.labelSmall(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  Text(
                    value,
                    style: AppTypography.bodyMedium(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.copy_rounded,
              color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget lecteur audio pour les messages vocaux
class _VoicePlayerWidget extends StatefulWidget {
  final String filePath;
  final int? duration;
  final Color textColor;
  final String messageId;
  final VoicePlaybackController? controller;
  final int? groupIndex;
  final String timestamp;
  final Color timestampColor;
  final Widget? statusIcon;

  const _VoicePlayerWidget({
    required this.filePath,
    this.duration,
    required this.textColor,
    required this.messageId,
    this.controller,
    this.groupIndex,
    required this.timestamp,
    required this.timestampColor,
    this.statusIcon,
  });

  @override
  State<_VoicePlayerWidget> createState() => _VoicePlayerWidgetState();
}

class _VoicePlayerWidgetState extends State<_VoicePlayerWidget>
    with SingleTickerProviderStateMixin {
  late AudioPlayer _player;
  late AnimationController _waveAnimController;
  bool _isPlaying = false;
  bool _isSeeking = false;
  double _seekProgress = 0.0;
  Duration _position = Duration.zero;
  Duration _totalDuration = Duration.zero;
  List<double> _waveformData = [];

  static const List<double> _speedOptions = [1.0, 1.5, 2.0];

  VoicePlaybackController? get _ctrl => widget.controller;
  int get _groupIndex => widget.groupIndex ?? -1;

  double get _playbackSpeed {
    if (_ctrl != null && _groupIndex >= 0) {
      return _ctrl!.getGroupSpeed(_groupIndex);
    }
    return 1.0;
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _waveAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addListener(() {
        if (mounted) setState(() {});
      });
    _initPlayer();
    _generateWaveform();

    // Enregistrer les callbacks auprès du contrôleur
    _ctrl?.addListener(_onControllerChanged);
    _ctrl?.registerPlayerCallback(widget.messageId, _startPlaying);
  }

  void _onControllerChanged() {
    if (!mounted) return;
    if (_ctrl == null || _groupIndex < 0) return;

    final controllerSpeed = _ctrl!.getGroupSpeed(_groupIndex);
    // Synchroniser la vitesse dès qu'elle change (même avant la lecture)
    _player.setSpeed(controllerSpeed);
    setState(() {});
  }

  Future<void> _initPlayer() async {
    try {
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.music());

      final duration = await _player.setFilePath(widget.filePath);
      if (duration != null && mounted) {
        setState(() => _totalDuration = duration);
      }

      _player.positionStream.listen((pos) {
        if (mounted && !_isSeeking) setState(() => _position = pos);
      });

      _player.playerStateStream.listen((state) {
        if (mounted) {
          final wasPlaying = _isPlaying;
          setState(() => _isPlaying = state.playing);

          if (state.playing && !wasPlaying) {
            // Vient de démarrer : enregistrer auprès du contrôleur
            _ctrl?.registerPlaying(widget.messageId, _stopPlaying);
            _waveAnimController.repeat();
          } else if (!state.playing && wasPlaying) {
            _waveAnimController.stop();
          }

          if (state.processingState == ProcessingState.completed) {
            _player.seek(Duration.zero);
            _player.pause();
            // Notifier le contrôleur pour auto-play du suivant
            if (_ctrl != null && _groupIndex >= 0) {
              _ctrl!.onMessageCompleted(widget.messageId, _groupIndex);
            }
          }
        }
      });
    } catch (e) {
      debugPrint('[VoicePlayer] Error init: $e');
    }
  }

  /// Démarre la lecture (appelé par le contrôleur pour auto-play).
  void _startPlaying() {
    if (!mounted) return;
    // Appliquer la vitesse du groupe
    if (_ctrl != null && _groupIndex >= 0) {
      _player.setSpeed(_ctrl!.getGroupSpeed(_groupIndex));
    }
    _player.play();
  }

  /// Stoppe la lecture (appelé par le contrôleur pour exclusion mutuelle).
  void _stopPlaying() {
    _player.pause();
    _player.seek(Duration.zero);
  }

  Future<void> _generateWaveform() async {
    try {
      final file = File(widget.filePath);
      final bytes = await file.readAsBytes();
      if (bytes.isEmpty) return;

      const int barCount = 50;

      // Seed déterministe à partir du contenu du fichier
      int seed = bytes.length;
      for (int i = 0; i < math.min(bytes.length, 256); i++) {
        seed = (seed * 31 + bytes[i]) & 0x7FFFFFFF;
      }
      final rng = math.Random(seed);

      // Générer un waveform naturel avec des pics et creux
      final List<double> raw = [];
      for (int i = 0; i < barCount; i++) {
        raw.add(0.15 + rng.nextDouble() * 0.85);
      }

      // Lissage pour un rendu plus naturel (moyenne glissante)
      final List<double> bars = [];
      for (int i = 0; i < barCount; i++) {
        final prev = i > 0 ? raw[i - 1] : raw[i];
        final next = i < barCount - 1 ? raw[i + 1] : raw[i];
        bars.add((prev * 0.25 + raw[i] * 0.5 + next * 0.25).clamp(0.08, 1.0));
      }

      if (mounted) setState(() => _waveformData = bars);
    } catch (e) {
      debugPrint('[VoicePlayer] Waveform generation error: $e');
    }
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
    if (_totalDuration.inMilliseconds == 0) {
      setState(() => _isSeeking = false);
      return;
    }
    final position = Duration(
      milliseconds: (_seekProgress * _totalDuration.inMilliseconds).round(),
    );
    _player.seek(position);
    setState(() {
      _position = position;
      _isSeeking = false;
    });
  }

  void _cycleSpeed() {
    final currentIndex = _speedOptions.indexOf(_playbackSpeed);
    final nextIndex = (currentIndex + 1) % _speedOptions.length;
    final newSpeed = _speedOptions[nextIndex];

    if (_ctrl != null && _groupIndex >= 0) {
      _ctrl!.setGroupSpeed(_groupIndex, newSpeed);
    }
    _player.setSpeed(newSpeed);

    // Démarrer la lecture si elle n'a pas encore commencé
    if (!_isPlaying) {
      _startPlaying();
    }
  }

  @override
  void dispose() {
    _ctrl?.removeListener(_onControllerChanged);
    _ctrl?.unregisterPlayerCallback(widget.messageId);
    _ctrl?.unregisterPlaying(widget.messageId);
    _waveAnimController.dispose();
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = d.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final totalMs = _totalDuration.inMilliseconds;
    final progress = _isSeeking
        ? _seekProgress
        : (totalMs > 0 ? _position.inMilliseconds / totalMs : 0.0);

    final showPosition = _isPlaying || _isSeeking || _position.inMilliseconds > 0;
    final displayDuration = showPosition
        ? _formatDuration(_isSeeking
            ? Duration(milliseconds: (_seekProgress * totalMs).round())
            : _position)
        : _formatDuration(_totalDuration.inMilliseconds > 0
            ? _totalDuration
            : Duration(seconds: widget.duration ?? 0));

    final speed = _playbackSpeed;
    final speedLabel = speed == 1.0
        ? '1x'
        : speed == 1.5
            ? '1.5x'
            : '2x';

    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Column(
        children: [
          // Ligne principale : play/pause + waveform + vitesse
          Row(
            children: [
              // Bouton play/pause (icône seule, sans fond)
              GestureDetector(
                onTap: () {
                  if (_isPlaying) {
                    _player.pause();
                    _ctrl?.unregisterPlaying(widget.messageId);
                  } else {
                    _startPlaying();
                  }
                },
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: Icon(
                    _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: widget.textColor,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              // Waveform seekable
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
                      onPointerUp: (_) {
                        if (_isSeeking) _onSeekEnd();
                      },
                      onPointerCancel: (_) {
                        if (_isSeeking) _onSeekEnd();
                      },
                      child: CustomPaint(
                        painter: _AudioBubbleWaveformPainter(
                          amplitudes: _waveformData,
                          progress: progress.clamp(0.0, 1.0),
                          activeColor: widget.textColor,
                          inactiveColor: widget.textColor.withValues(alpha: 0.2),
                          animPhase: _isPlaying ? _waveAnimController.value : null,
                        ),
                        size: Size(constraints.maxWidth, 28),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 6),
              // Bouton vitesse (largeur fixe pour ne pas réduire le waveform)
              GestureDetector(
                onTap: _cycleSpeed,
                child: SizedBox(
                  width: 32,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      color: widget.textColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      speedLabel,
                      style: AppTypography.labelSmall(
                        color: widget.textColor.withValues(alpha: 0.8),
                      ).copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Ligne inférieure : durée à gauche, heure + status à droite
          Row(
            children: [
              Text(
                displayDuration,
                style: AppTypography.labelSmall(
                  color: widget.textColor.withValues(alpha: 0.7),
                ).copyWith(
                  fontFeatures: [const FontFeature.tabularFigures()],
                ),
              ),
              const Spacer(),
              Text(
                widget.timestamp,
                style: AppTypography.timestamp(color: widget.timestampColor),
              ),
              if (widget.statusIcon != null) ...[
                const SizedBox(width: 4),
                widget.statusIcon!,
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Waveform painter pour la bulle audio avec animation pendant la lecture
class _AudioBubbleWaveformPainter extends CustomPainter {
  final List<double> amplitudes;
  final double progress;
  final Color activeColor;
  final Color inactiveColor;
  final double? animPhase; // null = pas d'animation, 0.0-1.0 = phase

  _AudioBubbleWaveformPainter({
    required this.amplitudes,
    required this.progress,
    required this.activeColor,
    required this.inactiveColor,
    this.animPhase,
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
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final inactivePaint = Paint()
      ..color = inactiveColor
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final isAnimating = animPhase != null;
    final phase = animPhase ?? 0.0;

    for (int i = 0; i < barCount; i++) {
      final x = i * barSpacing + barSpacing / 2;
      final isActive = x <= progressX;

      final sampleIndex = (i / barCount * amplitudes.length).floor();
      var amp = sampleIndex < amplitudes.length
          ? amplitudes[sampleIndex].clamp(0.08, 1.0)
          : 0.08;

      // Animation : ondulation sinusoïdale sur les barres actives
      if (isAnimating && isActive) {
        final wave = math.sin(phase * 2 * math.pi + i * 0.35) * 0.25;
        amp = (amp + wave * amp).clamp(0.08, 1.0);
      }

      final halfHeight = amp * maxBarHeight;
      final y1 = centerY - halfHeight;
      final y2 = centerY + halfHeight;

      canvas.drawLine(
        Offset(x, y1),
        Offset(x, y2),
        isActive ? activePaint : inactivePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _AudioBubbleWaveformPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.amplitudes != amplitudes ||
        oldDelegate.animPhase != animPhase;
  }
}

/// Widget pour afficher la miniature d'une vidéo
class _VideoThumbnailWidget extends StatefulWidget {
  final String videoPath;
  final String? duration;

  const _VideoThumbnailWidget({
    required this.videoPath,
    this.duration,
  });

  @override
  State<_VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<_VideoThumbnailWidget> {
  Uint8List? _thumbnailData;
  bool _isLoading = true;
  double? _aspectRatio;

  // Contraintes max pour la miniature
  static const double _maxWidth = 220.0;
  static const double _maxHeight = 280.0;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    final file = File(widget.videoPath);
    if (!file.existsSync()) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    try {
      final thumbnail = await VideoThumbnail.thumbnailData(
        video: widget.videoPath,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 440,
        quality: 75,
      );

      if (thumbnail != null && mounted) {
        // Décoder l'image pour obtenir ses dimensions
        final codec = await ui.instantiateImageCodec(thumbnail);
        final frame = await codec.getNextFrame();
        final image = frame.image;
        final ratio = image.width / image.height;

        setState(() {
          _thumbnailData = thumbnail;
          _aspectRatio = ratio;
          _isLoading = false;
        });
      } else if (mounted) {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint('Error generating video thumbnail: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  /// Calcule les dimensions optimales en respectant le ratio
  Size _calculateSize() {
    if (_aspectRatio == null) {
      return const Size(_maxWidth, 160);
    }

    double width, height;

    if (_aspectRatio! >= 1) {
      // Paysage ou carré
      width = _maxWidth;
      height = _maxWidth / _aspectRatio!;
      if (height > _maxHeight) {
        height = _maxHeight;
        width = _maxHeight * _aspectRatio!;
      }
    } else {
      // Portrait
      height = _maxHeight;
      width = _maxHeight * _aspectRatio!;
      if (width > _maxWidth) {
        width = _maxWidth;
        height = _maxWidth / _aspectRatio!;
      }
    }

    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    final size = _calculateSize();

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Thumbnail ou placeholder
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: _isLoading
                  ? Container(
                      color: Colors.black,
                      child: const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.textTertiaryDark,
                          ),
                        ),
                      ),
                    )
                  : _thumbnailData != null
                      ? Image.memory(
                          _thumbnailData!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      : Container(
                          color: Colors.black,
                          child: const Icon(
                            Icons.movie_outlined,
                            size: 50,
                            color: AppColors.textTertiaryDark,
                          ),
                        ),
            ),
          ),
          // Bouton play
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          // Durée
          if (widget.duration != null)
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.duration!,
                  style: AppTypography.labelSmall(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Bulle de position avec image statique Mapbox 3D
class _LocationBubbleContent extends StatelessWidget {
  final double lat;
  final double lng;
  final String address;
  final String staticMapUrl;
  final bool isOutgoing;
  final Color textColor;

  const _LocationBubbleContent({
    required this.lat,
    required this.lng,
    required this.address,
    required this.staticMapUrl,
    required this.isOutgoing,
    required this.textColor,
  });

  void _openLocationViewer(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        opaque: true,
        barrierColor: Colors.black,
        pageBuilder: (context, animation, secondaryAnimation) =>
            LocationViewerScreen(
          latitude: lat,
          longitude: lng,
          address: address,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openLocationViewer(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image statique Mapbox avec perspective 3D
              SizedBox(
                height: 150,
                child: Image.network(
                  staticMapUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: const Color(0xFF1A1A1A),
                      child: const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.accentPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF1A1A1A),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.accentPrimary,
                            size: 32,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${lat.toStringAsFixed(4)}, ${lng.toStringAsFixed(4)}',
                            style: AppTypography.labelSmall(color: Colors.white54),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Adresse
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                color: isOutgoing
                    ? Colors.black.withValues(alpha: 0.3)
                    : Colors.black.withValues(alpha: 0.05),
                child: Row(
                  children: [
                    Icon(
                      Icons.place_rounded,
                      color: AppColors.accentPrimary,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        address.isNotEmpty
                            ? address
                            : '${lat.toStringAsFixed(4)}, ${lng.toStringAsFixed(4)}',
                        style: AppTypography.labelSmall(
                          color: isOutgoing ? Colors.white : textColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
