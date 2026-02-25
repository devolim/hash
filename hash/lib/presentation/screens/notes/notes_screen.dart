import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/note.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';
import '../../widgets/notes/note_card.dart';
import '../../widgets/notes/note_password_dialog.dart';
import '../../widgets/common/animated_appbar_title.dart';
import '../../widgets/common/hash_text_field.dart';
import '../../widgets/common/hash_snack_bar.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  String _searchQuery = '';
  final _searchController = TextEditingController();
  final _listKey = GlobalKey<AnimatedListState>();
  List<Note> _displayedNotes = [];
  bool _isFirstBuild = true;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _createNote() async {
    try {
      final note = Note(id: const Uuid().v4());
      await ref.read(notesProvider.notifier).addNote(note);
      if (mounted) {
        context.push('${AppRoutes.noteEditor}?id=${note.id}');
      }
    } catch (e) {
      if (mounted) {
        final message = e.toString().contains('100')
            ? 'Limite de 100 notes atteinte'
            : 'Erreur lors de la création';
        showHashSnackBar(context, message: message, type: HashSnackBarType.error);
      }
    }
  }

  void _updateDisplayedNotes(List<Note> newNotes) {
    // Détecter les notes supprimées et les animer
    for (int i = _displayedNotes.length - 1; i >= 0; i--) {
      final oldNote = _displayedNotes[i];
      if (!newNotes.any((n) => n.id == oldNote.id)) {
        // Note supprimée - animer la disparition
        final removedNote = _displayedNotes.removeAt(i);
        _listKey.currentState?.removeItem(
          i,
          (context, animation) => _buildAnimatedNoteItem(
            removedNote,
            i,
            animation,
          ),
          duration: const Duration(milliseconds: 300),
        );
      }
    }

    // Ajouter les nouvelles notes
    for (int i = 0; i < newNotes.length; i++) {
      final newNote = newNotes[i];
      final oldIndex = _displayedNotes.indexWhere((n) => n.id == newNote.id);

      if (oldIndex == -1) {
        // Nouvelle note - l'insérer
        _displayedNotes.insert(i, newNote);
        _listKey.currentState?.insertItem(i);
      } else if (oldIndex != i) {
        // Note déplacée - la retirer et la réinsérer
        final note = _displayedNotes.removeAt(oldIndex);
        _displayedNotes.insert(i, note);
      } else {
        // Note existante au même endroit - la mettre à jour
        _displayedNotes[i] = newNote;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final notes = ref.watch(notesProvider);
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    final filteredNotes = _searchQuery.isEmpty
        ? notes
        : notes.where((n) {
            final q = _searchQuery.toLowerCase();
            return n.title.toLowerCase().contains(q) ||
                (!n.isLocked && n.content.toLowerCase().contains(q));
          }).toList();

    // Au premier build, initialiser directement sans animation
    if (_isFirstBuild && filteredNotes.isNotEmpty) {
      _displayedNotes = List.from(filteredNotes);
      _isFirstBuild = false;
    } else {
      // Mettre à jour la liste affichée avec animations
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _updateDisplayedNotes(filteredNotes);
        }
      });
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: AnimatedHashAppBarTitle(
          title: l10n.notes,
          tabIndex: 2,
          useThemeColor: true,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded, size: 26),
            color: AppColors.accentPrimary,
            onPressed: _createNote,
          ),
        ],
      ),
      body: notes.isEmpty
          ? _buildEmptyState(secondaryColor, l10n)
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Search bar — fixe, hors du scroll
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (v) => setState(() => _searchQuery = v),
                          style: AppTypography.bodyMedium(
                            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          ),
                          decoration: InputDecoration(
                            hintText: l10n.searchNotes,
                            hintStyle: AppTypography.bodyMedium(color: secondaryColor),
                            prefixIcon: Icon(Icons.search, color: secondaryColor),
                            suffixIcon: _searchQuery.isNotEmpty
                                ? IconButton(
                                    icon: Icon(Icons.close, color: secondaryColor),
                                    onPressed: () {
                                      _searchController.clear();
                                      setState(() => _searchQuery = '');
                                    },
                                  )
                                : null,
                            filled: true,
                            fillColor: isDark
                                ? Colors.black
                                : Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24), // Espacement ajouté entre recherche et notes
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= _displayedNotes.length) {
                        return const SizedBox.shrink();
                      }
                      final note = _displayedNotes[index];
                      final theme = Theme.of(context);
                      final isDark = theme.brightness == Brightness.dark;
                      final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
                      final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
                      return _buildNoteListItem(note, index, isDark, primaryColor, secondaryColor)
                          .animate()
                          .fadeIn(
                            duration: 300.ms,
                            delay: (index * 50).ms,
                            curve: Curves.easeOut,
                          );
                    },
                    childCount: _displayedNotes.length,
                  ),
                ),
                if (_displayedNotes.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        l10n.noNotesTitle,
                        style: AppTypography.bodyMedium(color: secondaryColor),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildAnimatedNoteItem(
    Note note,
    int index,
    Animation<double> animation,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: _buildNoteListItem(note, index, isDark, primaryColor, secondaryColor),
      ),
    );
  }

  Widget _buildNoteListItem(
    Note note,
    int index,
    bool isDark,
    Color primaryColor,
    Color secondaryColor,
  ) {
    final color = note.colorIndex == 0
        ? (isDark ? Colors.black : Colors.white)
        : NoteColors.palette[note.colorIndex];

    // Formater la date de modification
    String formatDate(DateTime date) {
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inMinutes < 1) {
        return 'À l\'instant';
      } else if (diff.inHours < 1) {
        return 'Il y a ${diff.inMinutes} min';
      } else if (diff.inDays < 1) {
        return 'Il y a ${diff.inHours}h';
      } else if (diff.inDays == 1) {
        return 'Hier';
      } else if (diff.inDays < 7) {
        return 'Il y a ${diff.inDays}j';
      } else {
        return '${date.day}/${date.month}/${date.year}';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 32, // Même largeur que le champ de recherche (16px de padding de chaque côté)
          child: Material(
            color: color.withValues(alpha: note.colorIndex == 0 ? 1.0 : 0.15),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () => _openNote(note),
              onLongPress: () => _showNoteActions(note),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: note.colorIndex == 0
                        ? (isDark
                            ? Colors.white.withValues(alpha: 0.06)
                            : Colors.black.withValues(alpha: 0.04))
                        : color.withValues(alpha: 0.3),
                    width: note.colorIndex == 0 ? 0.5 : 1,
                  ),
                  boxShadow: note.colorIndex == 0
                      ? [
                          BoxShadow(
                            color: isDark
                                ? Colors.black.withValues(alpha: 0.5)
                                : Colors.black.withValues(alpha: 0.04),
                            blurRadius: 12,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title row with icons
                    Row(
                      children: [
                        if (note.isPinned)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.push_pin,
                              size: 16,
                              color: AppColors.accentPrimary,
                            ),
                          ),
                        if (note.isLocked)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.lock,
                              size: 16,
                              color: AppColors.accentPrimary,
                            ),
                          ),
                        Expanded(
                          child: Text(
                            note.title.isEmpty ? 'Sans titre' : note.title,
                            style: AppTypography.bodyMedium(color: primaryColor)
                                .copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          formatDate(note.updatedAt),
                          style: AppTypography.labelSmall(color: secondaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Preview
                    if (!note.isLocked) ...[
                      Text(
                        note.type == NoteType.text
                            ? (note.content.isEmpty ? 'Aucun contenu' : note.content)
                            : '${note.items.where((i) => i.isChecked).length}/${note.items.length} tâches',
                        style: AppTypography.bodySmall(color: secondaryColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(Color secondaryColor, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.note_outlined,
              size: 80,
              color: AppColors.accentPrimary,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.noNotesTitle,
              style: AppTypography.headlineSmall(color: secondaryColor),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.noNotesSubtitle,
              style: AppTypography.bodyMedium(color: secondaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate().fadeIn().scale(begin: const Offset(0.9, 0.9));
  }

  Future<void> _openNote(Note note) async {
    if (note.isLocked) {
      final verified = await NotePasswordDialog.showVerify(context, note);
      if (verified != true) return;
    }
    if (mounted) {
      context.push('${AppRoutes.noteEditor}?id=${note.id}');
    }
  }

  void _showNoteActions(Note note) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final dividerColor = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.black.withValues(alpha: 0.06);

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.3),
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
          child: child,
        );
      },
      pageBuilder: (ctx, animation, secondaryAnimation) => Stack(
        children: [
          // Zone cliquable pour fermer
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.pop(ctx),
              behavior: HitTestBehavior.translucent,
            ),
          ),
          // Menu en bas
          Positioned(
            left: 12,
            right: 12,
            bottom: MediaQuery.of(ctx).padding.bottom + 12,
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: GlassTheme.blurMax, sigmaY: GlassTheme.blurMax),
                  child: Container(
                    decoration: BoxDecoration(
                      color: GlassTheme.backgroundStrong(isDark),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: dividerColor),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Handle
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 4),
                          child: Container(
                            width: 36,
                            height: 4,
                            decoration: BoxDecoration(
                              color: GlassTheme.handle(isDark),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),

                        // Pin/Unpin
                        _buildActionItem(
                          icon: note.isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                          label: note.isPinned ? l10n.unpinNote : l10n.pinNote,
                          iconColor: note.isPinned ? AppColors.accentPrimary : secondaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            Navigator.pop(ctx);
                            ref.read(notesProvider.notifier).togglePin(note.id);
                          },
                        ),
                        Divider(height: 1, color: dividerColor, indent: 16, endIndent: 16),

                        // Password
                        _buildActionItem(
                          icon: note.isLocked ? Icons.lock_open : Icons.lock_outline,
                          label: note.isLocked ? l10n.removePassword : l10n.setPassword,
                          iconColor: secondaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            Navigator.pop(ctx);
                            if (note.isLocked) {
                              _removePassword(note);
                            } else {
                              _setPassword(note);
                            }
                          },
                        ),
                        Divider(height: 1, color: dividerColor, indent: 16, endIndent: 16),

                        // Delete
                        _buildActionItem(
                          icon: Icons.delete_outline,
                          label: l10n.deleteNote,
                          iconColor: AppColors.error,
                          textColor: AppColors.error,
                          onTap: () {
                            Navigator.pop(ctx);
                            _confirmDelete(note);
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required Color iconColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 22),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: AppTypography.bodyMedium(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> _setPassword(Note note) async {
    final result = await NotePasswordDialog.showSetup(context);
    if (result != null) {
      note.passwordHash = result.hash;
      note.isPasswordPin = result.isPin;
      note.updatedAt = DateTime.now();
      ref.read(notesProvider.notifier).updateNote(note);
    }
  }

  Future<void> _removePassword(Note note) async {
    final verified = await NotePasswordDialog.showVerify(context, note);
    if (verified == true) {
      note.passwordHash = null;
      note.updatedAt = DateTime.now();
      ref.read(notesProvider.notifier).updateNote(note);
    }
  }

  void _confirmDelete(Note note) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    String? pinError;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => GlassTheme.wrapAlertDialog(ctx, AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
          titlePadding: const EdgeInsets.fromLTRB(20, 16, 8, 0),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  'Supprimer la note',
                  style: AppTypography.headlineSmall(color: primaryColor),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(ctx),
                icon: Icon(Icons.close, color: secondaryColor),
                splashRadius: 20,
              ),
            ],
          ),
          actions: const [],
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Entrez le code PIN de déverrouillage de l\'application pour confirmer',
                  style: AppTypography.bodyMedium(color: secondaryColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                HashPinField(
                  length: 6,
                  onCompleted: (pin) async {
                    final secureStorage = ref.read(secureStorageProvider);
                    final notesNotifier = ref.read(notesProvider.notifier);
                    final isValid = await secureStorage.verifyPin(pin);
                    if (isValid) {
                      if (ctx.mounted) Navigator.pop(ctx);
                      await notesNotifier.deleteNote(note.id);
                    } else {
                      if (ctx.mounted) {
                        setDialogState(() => pinError = 'Code PIN incorrect');
                      }
                    }
                  },
                ),
                if (pinError != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: AppColors.error, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            pinError!,
                            style: AppTypography.bodySmall(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        )),
      ),
    );
  }
}
