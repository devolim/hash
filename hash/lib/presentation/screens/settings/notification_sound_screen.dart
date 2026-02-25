import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/ui_sound_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';

/// Page de sélection du son de notification global.
class NotificationSoundScreen extends ConsumerStatefulWidget {
  const NotificationSoundScreen({super.key});

  @override
  ConsumerState<NotificationSoundScreen> createState() => _NotificationSoundScreenState();
}

class _NotificationSoundScreenState extends ConsumerState<NotificationSoundScreen> {
  String? _playingSound;
  late String _selectedSound;

  @override
  void initState() {
    super.initState();
    _selectedSound = ref.read(appSettingsProvider).notificationSound;
  }

  Future<void> _previewSound(String soundName) async {
    setState(() => _playingSound = soundName);
    final soundService = ref.read(uiSoundServiceProvider);
    await soundService.previewSound(soundName);
    // Petit délai pour l'animation
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() => _playingSound = null);
  }

  void _selectSound(String soundName) {
    HapticFeedback.selectionClick();
    setState(() {
      _selectedSound = soundName;
    });
    _previewSound(soundName);
    _saveGlobalSound(soundName);
  }

  void _saveGlobalSound(String soundName) {
    final newSettings = ref.read(appSettingsProvider).copyWith(
      notificationSound: soundName,
    );
    ref.read(appSettingsProvider.notifier).updateSettings(newSettings);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final sounds = UiSoundService.notificationSounds.entries.toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        title: Text(
          'Son de notification',
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16,
          MediaQuery.of(context).padding.top + kToolbarHeight + 16,
          16,
          32,
        ),
        children: [
          // Description
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.5)
                      : Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.accentPrimary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: AppColors.accentPrimary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Ce son sera joué à la réception d\'un nouveau message. Appuyez pour écouter.',
                    style: AppTypography.bodySmall(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(),

          const SizedBox(height: 24),

          // Liste des sons
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.5)
                      : Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                for (int i = 0; i < sounds.length; i++) ...[
                  _SoundTile(
                    soundKey: sounds[i].key,
                    soundName: sounds[i].value,
                    isSelected: _selectedSound == sounds[i].key,
                    isPlaying: _playingSound == sounds[i].key,
                    isDark: isDark,
                    onTap: () => _selectSound(sounds[i].key),
                    onPreview: () => _previewSound(sounds[i].key),
                  ),
                  if (i < sounds.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(left: 66),
                      child: Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.08),
                      ),
                    ),
                ],
              ],
            ),
          ).animate().fadeIn(delay: 50.ms),
        ],
      ),
    );
  }
}

/// Tuile pour un son individuel dans la liste
class _SoundTile extends StatelessWidget {
  final String soundKey;
  final String soundName;
  final bool isSelected;
  final bool isPlaying;
  final bool isDark;
  final VoidCallback onTap;
  final VoidCallback onPreview;

  const _SoundTile({
    required this.soundKey,
    required this.soundName,
    required this.isSelected,
    required this.isPlaying,
    required this.isDark,
    required this.onTap,
    required this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.accentPrimary.withValues(alpha: 0.08),
        highlightColor: AppColors.accentPrimary.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Bouton play/preview
              GestureDetector(
                onTap: onPreview,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isPlaying
                        ? AppColors.accentPrimary.withValues(alpha: 0.2)
                        : isSelected
                            ? AppColors.accentPrimary.withValues(alpha: 0.15)
                            : (isDark ? AppColors.darkBorder : AppColors.lightBorder)
                                .withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: isPlaying
                          ? const Icon(
                              Icons.volume_up_rounded,
                              key: ValueKey('playing'),
                              size: 20,
                              color: AppColors.accentPrimary,
                            )
                          : Icon(
                              Icons.play_arrow_rounded,
                              key: const ValueKey('play'),
                              size: 20,
                              color: isSelected
                                  ? AppColors.accentPrimary
                                  : (isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Nom du son
              Expanded(
                child: Text(
                  soundName,
                  style: AppTypography.bodyMedium(
                    color: isSelected
                        ? AppColors.accentPrimary
                        : (isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight),
                  ).copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              // Indicateur de sélection
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.accentPrimary,
                  size: 22,
                )
              else
                Icon(
                  Icons.circle_outlined,
                  size: 22,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.15)
                      : Colors.black.withValues(alpha: 0.15),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
