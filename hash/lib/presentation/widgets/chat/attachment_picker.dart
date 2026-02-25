import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../common/hash_snack_bar.dart';
import 'location_picker_screen.dart';
import 'media_preview_screen.dart';

enum AttachmentType { photo, video, file, contact, location, camera, gallery }

class AttachmentPicker extends StatefulWidget {
  final Function(AttachmentType type, {String? path, List<String>? paths, Map<String, dynamic>? extra}) onSelected;
  final VoidCallback onClose;

  const AttachmentPicker({
    super.key,
    required this.onSelected,
    required this.onClose,
  });

  @override
  State<AttachmentPicker> createState() => _AttachmentPickerState();
}

class _AttachmentPickerState extends State<AttachmentPicker> {
  List<AssetEntity> _recentMedia = [];
  final Set<int> _selectedIndices = {};
  bool _isLoading = true;
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _loadRecentMedia();
  }

  Future<void> _loadRecentMedia() async {
    final permission = await PhotoManager.requestPermissionExtend();

    if (!permission.isAuth) {
      setState(() {
        _isLoading = false;
        _hasPermission = false;
      });
      return;
    }

    setState(() => _hasPermission = true);

    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.common,
      filterOption: FilterOptionGroup(
        orders: [const OrderOption(type: OrderOptionType.createDate, asc: false)],
      ),
    );

    if (albums.isNotEmpty) {
      final recentAlbum = albums.first;
      final assets = await recentAlbum.getAssetListRange(start: 0, end: 20);

      if (mounted) {
        setState(() {
          _recentMedia = assets;
          _isLoading = false;
        });
      }
    } else {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _toggleSelection(int index) {
    HapticFeedback.selectionClick();
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        _selectedIndices.add(index);
      }
    });
  }

  Future<void> _sendSelected() async {
    if (_selectedIndices.isEmpty) return;

    for (final index in _selectedIndices) {
      final asset = _recentMedia[index];
      final file = await asset.file;
      if (file != null) {
        final type = asset.type == AssetType.video
            ? AttachmentType.video
            : AttachmentType.photo;
        widget.onSelected(type, path: file.path);
      }
    }
  }

  void _openFullGallery() async {
    // Fermer le clavier avant d'ouvrir la galerie
    FocusScope.of(context).unfocus();

    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const _FullGalleryPicker(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );

    if (result != null && mounted) {
      widget.onSelected(
        result['type'] == 'video' ? AttachmentType.video : AttachmentType.photo,
        path: result['path'] as String,
        extra: {
          'isViewOnce': result['isViewOnce'] ?? false,
          'viewOnceDuration': result['viewOnceDuration'],
        },
      );
    }
  }

  void _openFilePicker() async {
    HapticFeedback.lightImpact();
    // Fermer le clavier avant d'ouvrir le picker
    FocusScope.of(context).unfocus();

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true, // Sélection multiple
      );

      if (result != null && result.files.isNotEmpty && mounted) {
        _showFilesConfirmation(result.files);
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
  }

  String _formatFileSize(int fileSize) {
    if (fileSize < 1024) {
      return '$fileSize B';
    } else if (fileSize < 1024 * 1024) {
      return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  void _showFilesConfirmation(List<PlatformFile> files) {
    // Fermer le clavier avant d'afficher le bottom sheet
    FocusManager.instance.primaryFocus?.unfocus();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        return GlassTheme.bottomSheetWrapper(
          isDark: isDark,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(ctx).size.height * 0.7,
            ),
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFF54A0FF).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.folder_rounded,
                            color: Color(0xFF54A0FF),
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${files.length} fichier${files.length > 1 ? 's' : ''} sélectionné${files.length > 1 ? 's' : ''}',
                              style: AppTypography.headlineSmall(color: Colors.white),
                            ),
                            Text(
                              'Confirmer l\'envoi',
                              style: AppTypography.bodySmall(color: Colors.white54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Liste des fichiers
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF54A0FF).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.insert_drive_file_rounded,
                            color: Color(0xFF54A0FF),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                file.name,
                                style: AppTypography.bodyMedium(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                _formatFileSize(file.size),
                                style: AppTypography.bodySmall(color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Boutons
            Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 24, MediaQuery.of(ctx).padding.bottom + 24),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(ctx),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            'Annuler',
                            style: AppTypography.labelLarge(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.pop(ctx);
                        // Envoyer chaque fichier
                        for (final file in files) {
                          if (file.path != null) {
                            widget.onSelected(AttachmentType.file, path: file.path!);
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.accentPrimary,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            'Envoyer${files.length > 1 ? ' (${files.length})' : ''}',
                            style: AppTypography.labelLarge(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
            ),
          ),
        );
      },
    );
  }

  void _openLocationPicker() async {
    HapticFeedback.lightImpact();
    FocusScope.of(context).unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    await Future.delayed(const Duration(milliseconds: 100));

    if (!mounted) return;
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LocationPickerScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );

    if (result != null && mounted) {
      widget.onSelected(AttachmentType.location, extra: result);
    }
  }

  void _openContactPicker() async {
    // Fermer le clavier avant d'ouvrir le picker
    FocusScope.of(context).unfocus();

    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const _ContactPicker(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );

    if (result != null && mounted) {
      // Gérer la sélection multiple
      if (result.containsKey('contacts')) {
        final contacts = result['contacts'] as List<Map<String, dynamic>>;
        for (final contact in contacts) {
          widget.onSelected(AttachmentType.contact, extra: contact);
        }
      } else {
        widget.onSelected(AttachmentType.contact, extra: result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Même couleur que la barre de messages
    return GestureDetector(
      onVerticalDragEnd: (details) {
        // Fermer si on tire vers le bas avec une certaine vélocité
        if (details.primaryVelocity != null && details.primaryVelocity! > 200) {
          widget.onClose();
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          // Fond transparent - le blur est géré par le parent
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar - cliquable pour fermer
            GestureDetector(
              onTap: widget.onClose,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.06)
                        : Colors.black.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),

          // Recent media horizontal scroll
          SizedBox(
            height: 100,
            child: _isLoading
                ? _buildLoadingShimmer(isDark)
                : !_hasPermission
                    ? _buildPermissionRequest(isDark)
                    : _buildMediaGrid(isDark),
          ),

          // Action buttons - icônes blanches
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SimpleActionButton(
                  icon: Icons.photo_library_rounded,
                  label: 'Photos',
                  onTap: _openFullGallery,
                  isDark: isDark,
                ),
                _SimpleActionButton(
                  icon: Icons.insert_drive_file_rounded,
                  label: 'Fichier',
                  onTap: _openFilePicker,
                  isDark: isDark,
                ),
                _SimpleActionButton(
                  icon: Icons.person_rounded,
                  label: 'Contact',
                  onTap: _openContactPicker,
                  isDark: isDark,
                ),
                _SimpleActionButton(
                  icon: Icons.location_on_rounded,
                  label: 'Position',
                  onTap: _openLocationPicker,
                  isDark: isDark,
                ),
              ],
            ),
          ),

            // Send selected button
            if (_selectedIndices.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                child: _SimpleSendButton(
                  count: _selectedIndices.length,
                  onTap: _sendSelected,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingShimmer(bool isDark) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          width: 84,
          height: 84,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
            borderRadius: BorderRadius.circular(12),
          ),
        ).animate(onPlay: (c) => c.repeat())
            .shimmer(duration: 1000.ms, color: isDark ? Colors.white12 : Colors.black12);
      },
    );
  }

  Widget _buildPermissionRequest(bool isDark) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library_outlined,
              color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              'Autoriser l\'accès aux photos',
              style: AppTypography.bodySmall(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () => PhotoManager.openSetting(),
              child: Text(
                'Ouvrir',
                style: AppTypography.labelMedium(color: AppColors.accentPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaGrid(bool isDark) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: _recentMedia.length + 2, // +1 camera, +1 gallery button
      itemBuilder: (context, index) {
        if (index == 0) {
          return _CameraButton(
            onTap: () => widget.onSelected(AttachmentType.camera),
            isDark: isDark,
          );
        }

        // Last item: gallery button
        if (index == _recentMedia.length + 1) {
          return _GalleryButton(
            onTap: _openFullGallery,
            isDark: isDark,
          );
        }

        final mediaIndex = index - 1;
        final asset = _recentMedia[mediaIndex];
        final isSelected = _selectedIndices.contains(mediaIndex);

        return _MediaThumbnail(
          asset: asset,
          isSelected: isSelected,
          selectionOrder: isSelected
              ? _selectedIndices.toList().indexOf(mediaIndex) + 1
              : null,
          onTap: () => _toggleSelection(mediaIndex),
          isDark: isDark,
        );
      },
    );
  }
}

class _CameraButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isDark;

  const _CameraButton({
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
      child: Container(
        width: 84,
        height: 84,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt_rounded,
              color: AppColors.accentPrimary,
              size: 30,
            ),
            const SizedBox(height: 4),
            Text(
              'Caméra',
              style: AppTypography.labelSmall(
                color: AppColors.accentPrimary,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isDark;

  const _GalleryButton({
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
      child: Container(
        width: 84,
        height: 84,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library_rounded,
              color: AppColors.accentPrimary,
              size: 30,
            ),
            const SizedBox(height: 4),
            Text(
              'Galerie',
              style: AppTypography.labelSmall(
                color: AppColors.accentPrimary,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaThumbnail extends StatelessWidget {
  final AssetEntity asset;
  final bool isSelected;
  final int? selectionOrder;
  final VoidCallback onTap;
  final bool isDark;

  const _MediaThumbnail({
    required this.asset,
    required this.isSelected,
    this.selectionOrder,
    required this.onTap,
    required this.isDark,
  });

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 84,
        height: 84,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(color: AppColors.accentPrimary, width: 3) : null,
          boxShadow: isSelected
              ? [BoxShadow(color: AppColors.accentPrimary.withValues(alpha: 0.3), blurRadius: 8, spreadRadius: 1)]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isSelected ? 9 : 12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FutureBuilder<Widget>(
                future: _buildThumbnail(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) return snapshot.data!;
                  return Container(
                    color: Colors.grey.shade800,
                    child: Icon(
                      asset.type == AssetType.video ? Icons.play_circle_outline : Icons.image,
                      color: Colors.white30,
                      size: 32,
                    ),
                  );
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
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              if (isSelected)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.accentPrimary,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 4)],
                    ),
                    child: Center(
                      child: Text(
                        '$selectionOrder',
                        style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> _buildThumbnail() async {
    final thumbData = await asset.thumbnailDataWithSize(const ThumbnailSize(168, 168));
    if (thumbData != null) {
      return Image.memory(thumbData, fit: BoxFit.cover, width: 84, height: 84);
    }
    return Container(
      color: Colors.grey.shade800,
      child: Icon(
        asset.type == AssetType.video ? Icons.play_circle_outline : Icons.image,
        color: Colors.white30,
        size: 32,
      ),
    );
  }
}

/// Action button simple - icône et texte orange
class _SimpleActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDark;

  const _SimpleActionButton({
    required this.icon,
    required this.label,
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
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.accentPrimary, size: 28),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppTypography.labelSmall(color: AppColors.accentPrimary),
          ),
        ],
      ),
    );
  }
}

/// Send button simple orange
class _SimpleSendButton extends StatelessWidget {
  final int count;
  final VoidCallback onTap;

  const _SimpleSendButton({
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Texte/icône : blanc en clair, noir en foncé
    final contentColor = isDark ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
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
            Icon(
              Icons.send_rounded,
              color: contentColor,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              'Envoyer $count élément${count > 1 ? 's' : ''}',
              style: AppTypography.labelLarge(color: contentColor).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Full Gallery Picker
class _FullGalleryPicker extends StatefulWidget {
  const _FullGalleryPicker();

  @override
  State<_FullGalleryPicker> createState() => _FullGalleryPickerState();
}

class _FullGalleryPickerState extends State<_FullGalleryPicker> {
  List<AssetEntity> _assets = [];
  List<AssetPathEntity> _albums = [];
  AssetPathEntity? _selectedAlbum;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAlbums();
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

    if (albums.isNotEmpty) {
      _albums = albums;
      _selectedAlbum = albums.first;
      await _loadAssets();
    } else {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _loadAssets() async {
    if (_selectedAlbum == null) return;

    final assets = await _selectedAlbum!.getAssetListRange(start: 0, end: 500);
    if (mounted) {
      setState(() {
        _assets = assets;
        _isLoading = false;
      });
    }
  }

  Future<void> _selectAsset(AssetEntity asset) async {
    HapticFeedback.selectionClick();
    final file = await asset.file;
    if (file == null || !mounted) return;

    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MediaPreviewScreen(
          filePath: file.path,
          isVideo: asset.type == AssetType.video,
          isFromGallery: true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: GestureDetector(
          onTap: () => _showAlbumPicker(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _selectedAlbum?.name ?? 'Photos',
                style: AppTypography.headlineSmall(color: Colors.white),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
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
                  padding: const EdgeInsets.all(2),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: _assets.length,
                  itemBuilder: (context, index) {
                    final asset = _assets[index];
                    return GestureDetector(
                      onTap: () => _selectAsset(asset),
                      child: _AssetThumbnail(asset: asset),
                    );
                  },
                ),
    );
  }

  void _showAlbumPicker() async {
    final album = await showModalBottomSheet<AssetPathEntity>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _AlbumPicker(albums: _albums, selected: _selectedAlbum),
    );

    if (album != null && album != _selectedAlbum) {
      setState(() {
        _selectedAlbum = album;
        _isLoading = true;
      });
      await _loadAssets();
    }
  }
}

class _AssetThumbnail extends StatelessWidget {
  final AssetEntity asset;

  const _AssetThumbnail({required this.asset});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _buildThumbnail(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            fit: StackFit.expand,
            children: [
              snapshot.data!,
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
          );
        }
        return Container(color: Colors.grey.shade800);
      },
    );
  }

  Future<Widget> _buildThumbnail() async {
    final data = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
    if (data != null) {
      return Image.memory(data, fit: BoxFit.cover);
    }
    return Container(color: Colors.grey.shade800);
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

class _AlbumPicker extends StatelessWidget {
  final List<AssetPathEntity> albums;
  final AssetPathEntity? selected;

  const _AlbumPicker({required this.albums, this.selected});

  @override
  Widget build(BuildContext context) {
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
                color: Colors.white.withValues(alpha: 0.06),
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
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                final isSelected = album == selected;
                return ListTile(
                  leading: _AlbumThumbnail(album: album),
                  title: Text(album.name, style: AppTypography.bodyMedium(color: Colors.white)),
                  subtitle: FutureBuilder<int>(
                    future: album.assetCountAsync,
                    builder: (context, snapshot) {
                      return Text(
                        '${snapshot.data ?? 0} éléments',
                        style: AppTypography.bodySmall(color: Colors.white54),
                      );
                    },
                  ),
                  trailing: isSelected ? const Icon(Icons.check, color: AppColors.accentPrimary) : null,
                  onTap: () => Navigator.pop(context, album),
                );
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}

class _AlbumThumbnail extends StatefulWidget {
  final AssetPathEntity album;

  const _AlbumThumbnail({required this.album});

  @override
  State<_AlbumThumbnail> createState() => _AlbumThumbnailState();
}

class _AlbumThumbnailState extends State<_AlbumThumbnail> {
  Uint8List? _thumbnailData;

  @override
  void initState() {
    super.initState();
    _loadThumbnail();
  }

  Future<void> _loadThumbnail() async {
    final assets = await widget.album.getAssetListRange(start: 0, end: 1);
    if (assets.isNotEmpty && mounted) {
      final data = await assets.first.thumbnailDataWithSize(const ThumbnailSize(112, 112));
      if (mounted && data != null) {
        setState(() => _thumbnailData = data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: _thumbnailData != null
            ? Image.memory(
                _thumbnailData!,
                fit: BoxFit.cover,
                width: 56,
                height: 56,
              )
            : const Icon(Icons.photo_library, color: Colors.white54),
      ),
    );
  }
}

// File Picker
class _FilePicker extends StatelessWidget {
  const _FilePicker();

  Future<void> _pickFile(BuildContext context) async {
    HapticFeedback.lightImpact();

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty && context.mounted) {
        final file = result.files.first;
        if (file.path != null) {
          Navigator.pop(context, {'path': file.path});
        }
      }
    } catch (e) {
      if (context.mounted) {
        showHashSnackBar(context, message: 'Erreur: $e', type: HashSnackBarType.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Fichiers', style: AppTypography.headlineSmall(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.folder_open_rounded,
                  color: Color(0xFF54A0FF),
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Partager un fichier',
                style: AppTypography.headlineSmall(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'Sélectionnez un fichier depuis votre appareil',
                style: AppTypography.bodyMedium(color: Colors.white54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _pickFile(context),
                  icon: const Icon(Icons.upload_file_rounded),
                  label: const Text('Parcourir'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF54A0FF),
                    foregroundColor: Colors.white,
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
    );
  }
}

// Contact Picker avec sélection multiple
class _ContactPicker extends StatefulWidget {
  const _ContactPicker();

  @override
  State<_ContactPicker> createState() => _ContactPickerState();
}

class _ContactPickerState extends State<_ContactPicker> {
  List<Contact> _contacts = [];
  final Set<String> _selectedContactIds = {};
  bool _isLoading = true;
  bool _hasPermission = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final hasPermission = await FlutterContacts.requestPermission();

    if (!hasPermission) {
      // Permission refusée : utiliser directement le picker externe
      if (mounted) {
        final contact = await FlutterContacts.openExternalPick();
        if (contact != null && mounted) {
          final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
          final email = contact.emails.isNotEmpty ? contact.emails.first.address : '';
          final contactInfo = phone.isNotEmpty
              ? '${contact.displayName}\n$phone'
              : contact.displayName;
          Navigator.pop(context, {
            'name': contactInfo,
            'phone': phone,
            'email': email,
          });
        } else if (mounted) {
          Navigator.pop(context);
        }
      }
      return;
    }

    final contacts = await FlutterContacts.getContacts(
      withProperties: true,
      withPhoto: true,
    );

    if (mounted) {
      setState(() {
        _contacts = contacts;
        _isLoading = false;
        _hasPermission = true;
      });
    }
  }

  List<Contact> get _filteredContacts {
    if (_searchQuery.isEmpty) return _contacts;
    return _contacts.where((c) =>
      c.displayName.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  List<Contact> get _selectedContacts {
    return _contacts.where((c) => _selectedContactIds.contains(c.id)).toList();
  }

  void _toggleContact(Contact contact) {
    HapticFeedback.selectionClick();
    setState(() {
      if (_selectedContactIds.contains(contact.id)) {
        _selectedContactIds.remove(contact.id);
      } else {
        _selectedContactIds.add(contact.id);
      }
    });
  }

  void _sendSelectedContacts() {
    if (_selectedContacts.isEmpty) return;

    HapticFeedback.mediumImpact();

    // Créer la liste des contacts à envoyer
    final contactsData = _selectedContacts.map((contact) {
      final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
      final email = contact.emails.isNotEmpty ? contact.emails.first.address : '';
      final contactInfo = phone.isNotEmpty
          ? '${contact.displayName}\n$phone'
          : contact.displayName;
      return {
        'name': contactInfo,
        'phone': phone,
        'email': email,
      };
    }).toList();

    Navigator.pop(context, {'contacts': contactsData});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _selectedContactIds.isEmpty
              ? 'Contacts'
              : '${_selectedContactIds.length} sélectionné${_selectedContactIds.length > 1 ? 's' : ''}',
          style: AppTypography.headlineSmall(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          if (_selectedContactIds.isNotEmpty)
            TextButton(
              onPressed: () => setState(() => _selectedContactIds.clear()),
              child: Text(
                'Effacer',
                style: AppTypography.labelMedium(color: Colors.white54),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              style: AppTypography.bodyMedium(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Rechercher un contact...',
                hintStyle: AppTypography.bodyMedium(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Contacts list
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator(color: AppColors.accentPrimary))
                : !_hasPermission
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.contacts_outlined, color: Colors.white30, size: 64),
                            const SizedBox(height: 16),
                            Text('Accès aux contacts requis', style: AppTypography.bodyMedium(color: Colors.white54)),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () async {
                                // Re-demander la permission
                                final granted = await FlutterContacts.requestPermission();
                                if (granted) {
                                  _loadContacts();
                                } else {
                                  // Permission refusée définitivement, utiliser le picker externe
                                  final contact = await FlutterContacts.openExternalPick();
                                  if (contact != null && mounted) {
                                    final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
                                    final email = contact.emails.isNotEmpty ? contact.emails.first.address : '';
                                    final contactInfo = phone.isNotEmpty
                                        ? '${contact.displayName}\n$phone'
                                        : contact.displayName;
                                    Navigator.pop(context, {
                                      'name': contactInfo,
                                      'phone': phone,
                                      'email': email,
                                    });
                                  }
                                }
                              },
                              child: Text('Autoriser l\'accès', style: AppTypography.labelLarge(color: AppColors.accentPrimary)),
                            ),
                          ],
                        ),
                      )
                    : _filteredContacts.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.person_outline, color: Colors.white30, size: 64),
                                const SizedBox(height: 16),
                                Text(
                                  _searchQuery.isEmpty ? 'Aucun contact' : 'Aucun résultat',
                                  style: AppTypography.bodyMedium(color: Colors.white54),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 100),
                            itemCount: _filteredContacts.length,
                            itemBuilder: (context, index) {
                              final contact = _filteredContacts[index];
                              final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
                              final email = contact.emails.isNotEmpty ? contact.emails.first.address : '';
                              final isSelected = _selectedContactIds.contains(contact.id);

                              return ListTile(
                                leading: Stack(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColors.accentPrimary
                                            : AppColors.accentPrimary.withValues(alpha: 0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: isSelected
                                          ? const Icon(Icons.check, color: Colors.black, size: 24)
                                          : contact.photo != null
                                              ? ClipOval(
                                                  child: Image.memory(
                                                    contact.photo!,
                                                    fit: BoxFit.cover,
                                                    width: 48,
                                                    height: 48,
                                                  ),
                                                )
                                              : Center(
                                                  child: Text(
                                                    contact.displayName.isNotEmpty ? contact.displayName[0].toUpperCase() : '?',
                                                    style: AppTypography.headlineSmall(color: AppColors.accentPrimary),
                                                  ),
                                                ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  contact.displayName,
                                  style: AppTypography.bodyMedium(
                                    color: isSelected ? AppColors.accentPrimary : Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  phone.isNotEmpty ? phone : email,
                                  style: AppTypography.bodySmall(color: Colors.white54),
                                ),
                                onTap: () => _toggleContact(contact),
                              );
                            },
                          ),
          ),
        ],
      ),
      // Bouton d'envoi flottant
      floatingActionButton: _selectedContactIds.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: _sendSelectedContacts,
                  backgroundColor: AppColors.accentPrimary,
                  foregroundColor: Colors.black,
                  icon: const Icon(Icons.send_rounded),
                  label: Text(
                    'Envoyer ${_selectedContactIds.length} contact${_selectedContactIds.length > 1 ? 's' : ''}',
                    style: AppTypography.labelLarge(color: Colors.black),
                  ),
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
