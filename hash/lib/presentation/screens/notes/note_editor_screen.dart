import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/note.dart';
import '../../../domain/models/message.dart';
import '../../../domain/models/contact.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';
import '../../widgets/common/avatar.dart';
import '../../widgets/common/hash_snack_bar.dart';
import '../../widgets/common/hash_text_field.dart';
import '../../widgets/notes/note_password_dialog.dart';

class NoteEditorScreen extends ConsumerStatefulWidget {
  final String? noteId;

  const NoteEditorScreen({super.key, this.noteId});

  @override
  ConsumerState<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends ConsumerState<NoteEditorScreen> {
  late TextEditingController _titleController;
  QuillController? _quillController;
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();
  Note? _note;
  bool _hasChanges = false;
  bool _isNewNote = false;
  bool _isFocused = false;
  Timer? _debounceTimer;

  // Limite de caractères
  static const int maxTitleLength = 100;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _titleController.addListener(_scheduleSave);
    _editorFocusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (mounted) setState(() => _isFocused = _editorFocusNode.hasFocus);
  }

  /// Programme une sauvegarde 2s après la dernière modification.
  void _scheduleSave() {
    if (!mounted) return;
    _hasChanges = true;
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(seconds: 2), () {
      if (mounted && _hasChanges) {
        _saveNote();
      }
    });
  }

  void _loadNoteFromProvider(List<Note> notes) {
    if (widget.noteId == null) return;

    try {
      final note = notes.firstWhere((n) => n.id == widget.noteId);
      if (_note == null) {
        _note = note;
        _titleController.text = _note!.title;

        // Initialiser l'éditeur Quill avec migration des données
        if (_note!.editorContent != null && _note!.editorContent!.isNotEmpty) {
          try {
            final json = jsonDecode(_note!.editorContent!);
            if (json is List) {
              // Format Quill Delta natif
              _quillController = QuillController(
                document: Document.fromJson(json),
                selection: const TextSelection.collapsed(offset: 0),
              );
            } else if (json is Map) {
              // Ancien format AppFlowy — fallback sur le texte brut
              if (_note!.content.isNotEmpty) {
                final doc = Document()..insert(0, _note!.content);
                _quillController = QuillController(
                  document: doc,
                  selection: const TextSelection.collapsed(offset: 0),
                );
              } else {
                _quillController = QuillController.basic();
              }
            } else {
              _quillController = QuillController.basic();
            }
          } catch (e) {
            // En cas d'erreur de parsing, fallback sur texte brut
            if (_note!.content.isNotEmpty) {
              final doc = Document()..insert(0, _note!.content);
              _quillController = QuillController(
                document: doc,
                selection: const TextSelection.collapsed(offset: 0),
              );
            } else {
              _quillController = QuillController.basic();
            }
          }
        } else if (_note!.content.isNotEmpty) {
          // Migration: convertir l'ancien contenu texte en document Quill
          final doc = Document()..insert(0, _note!.content);
          _quillController = QuillController(
            document: doc,
            selection: const TextSelection.collapsed(offset: 0),
          );
        } else {
          // Nouvelle note vide
          _quillController = QuillController.basic();
        }

        // Déterminer si c'est une nouvelle note (ou une note vide)
        final plainText = _quillController!.document.toPlainText().trim();
        _isNewNote = _note!.title.isEmpty && plainText.isEmpty;

        // Écouter les changements dans l'éditeur
        _quillController!.document.changes.listen((_) {
          _scheduleSave();
        });
      } else {
        _note = note;
      }
    } catch (e) {
      debugPrint('[NoteEditorScreen] Loading note failed: $e');
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _titleController.dispose();
    _quillController?.dispose();
    _editorFocusNode.removeListener(_onFocusChanged);
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    super.dispose();
  }

  bool get _isNoteEmpty {
    final title = _titleController.text.trim();
    final editorText = _quillController?.document.toPlainText().trim() ?? '';
    return title.isEmpty && editorText.isEmpty;
  }

  Future<void> _saveNote() async {
    if (_note == null || _quillController == null) return;

    // Ne pas sauvegarder une note vide
    if (_isNoteEmpty) return;

    _note!.title = _titleController.text.trim();

    // Sauvegarder le contenu de l'éditeur Quill
    _note!.editorContent =
        jsonEncode(_quillController!.document.toDelta().toJson());
    // Garder aussi une version texte simple pour la compatibilité/recherche
    _note!.content = _quillController!.document.toPlainText().trim();

    _note!.updatedAt = DateTime.now();
    await ref.read(notesProvider.notifier).updateNote(_note!);

    if (mounted) setState(() => _hasChanges = false);
  }

  void _autoSaveOnExit() {
    // Annuler le debounce en cours et sauvegarder immédiatement
    _debounceTimer?.cancel();

    if (_note == null || _quillController == null) return;

    // Si la note est complètement vide, la supprimer
    if (_isNoteEmpty) {
      ref.read(notesProvider.notifier).deleteNote(_note!.id);
      return;
    }

    // Sauvegarde immédiate si des changements existent
    if (_hasChanges) {
      _note!.title = _titleController.text.trim();
      _note!.editorContent =
          jsonEncode(_quillController!.document.toDelta().toJson());
      _note!.content = _quillController!.document.toPlainText().trim();
      _note!.updatedAt = DateTime.now();
      ref.read(notesProvider.notifier).updateNote(_note!);
    }
  }

  DefaultStyles _buildCustomStyles(bool isDark, Color primaryColor) {
    final secondaryColor =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final baseParagraphStyle = TextStyle(
      fontSize: 16,
      color: primaryColor,
      height: 1.5,
      fontFamily: 'SpaceGrotesk',
    );

    return DefaultStyles(
      h1: DefaultTextBlockStyle(
        baseParagraphStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.3,
        ),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(16, 8),
        const VerticalSpacing(0, 0),
        null,
      ),
      h2: DefaultTextBlockStyle(
        baseParagraphStyle.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(12, 6),
        const VerticalSpacing(0, 0),
        null,
      ),
      h3: DefaultTextBlockStyle(
        baseParagraphStyle.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(8, 4),
        const VerticalSpacing(0, 0),
        null,
      ),
      paragraph: DefaultTextBlockStyle(
        baseParagraphStyle,
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(4, 4),
        const VerticalSpacing(0, 0),
        null,
      ),
      bold: baseParagraphStyle.copyWith(fontWeight: FontWeight.w700),
      italic: baseParagraphStyle.copyWith(fontStyle: FontStyle.italic),
      underline: baseParagraphStyle.copyWith(
        decoration: TextDecoration.underline,
      ),
      strikeThrough: baseParagraphStyle.copyWith(
        decoration: TextDecoration.lineThrough,
      ),
      link: baseParagraphStyle.copyWith(
        color: AppColors.accentPrimary,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.accentPrimary,
      ),
      inlineCode: InlineCodeStyle(
        style: baseParagraphStyle.copyWith(
          fontSize: 14,
          fontFamily: 'monospace',
        ),
        backgroundColor: isDark
            ? AppColors.darkBorder.withValues(alpha: 0.3)
            : AppColors.lightBorder.withValues(alpha: 0.3),
        radius: const Radius.circular(4),
      ),
      quote: DefaultTextBlockStyle(
        baseParagraphStyle.copyWith(
          fontStyle: FontStyle.italic,
          color: secondaryColor,
        ),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(8, 8),
        const VerticalSpacing(0, 0),
        BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppColors.accentPrimary,
              width: 3,
            ),
          ),
        ),
      ),
      code: DefaultTextBlockStyle(
        baseParagraphStyle.copyWith(
          fontSize: 14,
          fontFamily: 'monospace',
          color: primaryColor,
        ),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(8, 8),
        const VerticalSpacing(0, 0),
        BoxDecoration(
          color: isDark
              ? AppColors.darkBorder.withValues(alpha: 0.3)
              : AppColors.lightBorder.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final tertiaryColor =
        isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    final notes = ref.watch(notesProvider);
    _loadNoteFromProvider(notes);

    if (_note == null) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final showToolbar = _isFocused && _quillController != null;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          _autoSaveOnExit();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: GlassTheme.glassIconColor(isDark)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            _isNewNote ? l10n.newNote : 'Note',
            style: AppTypography.headlineSmall(color: GlassTheme.glassTextColor(isDark)),
          ),
          actions: [
            Builder(
              builder: (btnContext) => IconButton(
                icon: Icon(Icons.more_vert, color: GlassTheme.glassIconColor(isDark)),
                onPressed: () => _showOptionsMenu(
                    btnContext, isDark, primaryColor, secondaryColor, l10n),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),
            // Title
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: TextField(
                controller: _titleController,
                maxLength: maxTitleLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                textCapitalization: TextCapitalization.sentences,
                style: AppTypography.headlineSmall(color: primaryColor),
                decoration: InputDecoration(
                  hintText: l10n.noteTitle,
                  hintStyle: AppTypography.headlineSmall(color: tertiaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.08),
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.08),
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: AppColors.accentPrimary, width: 2),
                  ),
                  counterText: '',
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                ),
                maxLines: null,
              ),
            ),
            const SizedBox(height: 8),

            // Content (prend tout l'espace restant)
            if (_quillController != null)
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      16, 0, 16, showToolbar ? 0 : 32),
                  clipBehavior: Clip.none,
                  child: QuillEditor(
                    focusNode: _editorFocusNode,
                    scrollController: _editorScrollController,
                    controller: _quillController!,
                    config: QuillEditorConfig(
                      padding: const EdgeInsets.all(16),
                      placeholder: l10n.noteContent,
                      customStyles:
                          _buildCustomStyles(isDark, primaryColor),
                      textSelectionThemeData: TextSelectionThemeData(
                        cursorColor: AppColors.accentPrimary,
                        selectionColor:
                            AppColors.accentPrimary.withValues(alpha: 0.2),
                        selectionHandleColor: AppColors.accentPrimary,
                      ),
                      keyboardAppearance:
                          isDark ? Brightness.dark : Brightness.light,
                    ),
                  ),
                ),
              ),

            // Toolbar (uniquement quand l'éditeur a le focus)
            if (showToolbar)
              Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.06)
                          : Colors.black.withValues(alpha: 0.08),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: QuillSimpleToolbar(
                        controller: _quillController!,
                        config: QuillSimpleToolbarConfig(
                          multiRowsDisplay: false,
                          showBoldButton: true,
                          showItalicButton: true,
                          showUnderLineButton: true,
                          showStrikeThrough: true,
                          showHeaderStyle: true,
                          showListNumbers: true,
                          showListBullets: true,
                          showListCheck: true,
                          showLink: true,
                          showQuote: true,
                          showCodeBlock: true,
                          showInlineCode: true,
                          // Désactiver les fonctionnalités inutiles
                          showFontFamily: false,
                          showFontSize: false,
                          showColorButton: false,
                          showBackgroundColorButton: false,
                          showAlignmentButtons: false,
                          showLeftAlignment: false,
                          showCenterAlignment: false,
                          showRightAlignment: false,
                          showJustifyAlignment: false,
                          showDirection: false,
                          showSearchButton: false,
                          showSubscript: false,
                          showSuperscript: false,
                          showIndent: false,
                          showSmallButton: false,
                          showLineHeightButton: false,
                          showUndo: false,
                          showRedo: false,
                          showClearFormat: false,
                          showDividers: false,
                          iconTheme: QuillIconTheme(
                            iconButtonSelectedData: IconButtonData(
                              color: AppColors.accentPrimary,
                            ),
                            iconButtonUnselectedData: IconButtonData(
                              color: secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Bouton pour fermer le clavier
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.06)
                                : Colors.black.withValues(alpha: 0.08),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.keyboard_hide_outlined,
                          color: secondaryColor,
                        ),
                        onPressed: () {
                          _editorFocusNode.unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showOptionsMenu(BuildContext btnContext, bool isDark,
      Color primaryColor, Color secondaryColor, AppLocalizations l10n) {
    final RenderBox button = btnContext.findRenderObject() as RenderBox;
    final Offset buttonPos = button.localToGlobal(Offset.zero);
    final double top = buttonPos.dy + button.size.height;

    final dividerColor = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.black.withValues(alpha: 0.06);

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            alignment: Alignment.topRight,
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
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
          // Menu positionné sous le bouton, aligné à droite
          Positioned(
            top: top + 4,
            right: 12,
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: GlassTheme.blurMax, sigmaY: GlassTheme.blurMax),
                  child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                      color: GlassTheme.backgroundStrong(isDark),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: dividerColor),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildMenuItem(
                          icon: _note!.isPinned
                              ? Icons.push_pin
                              : Icons.push_pin_outlined,
                          label: _note!.isPinned
                              ? l10n.unpinNote
                              : l10n.pinNote,
                          iconColor: _note!.isPinned
                              ? AppColors.accentPrimary
                              : secondaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            Navigator.pop(ctx);
                            setState(() {
                              _note!.isPinned = !_note!.isPinned;
                            });
                            _saveNote();
                          },
                        ),
                        Divider(height: 1, color: dividerColor),
                        _buildMenuItem(
                          icon: _note!.isLocked
                              ? Icons.lock_open
                              : Icons.lock_outline,
                          label: _note!.isLocked
                              ? l10n.removePassword
                              : l10n.setPassword,
                          iconColor: secondaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            Navigator.pop(ctx);
                            _handlePassword();
                          },
                        ),
                        Divider(height: 1, color: dividerColor),
                        _buildMenuItem(
                          icon: Icons.send_outlined,
                          label: 'Partager',
                          iconColor: secondaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            Navigator.pop(ctx);
                            _showContactPicker();
                          },
                        ),
                        Divider(height: 1, color: dividerColor),
                        _buildMenuItem(
                          icon: Icons.delete_outline,
                          label: l10n.deleteNote,
                          iconColor: AppColors.error,
                          textColor: AppColors.error,
                          onTap: () {
                            Navigator.pop(ctx);
                            _confirmDelete();
                          },
                        ),
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

  Widget _buildMenuItem({
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
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 12),
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

  /// Affiche le sélecteur de contact pour partager la note
  void _showContactPicker() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final contacts = ref.read(contactsProvider);
    final activeContacts = contacts.where((c) => !c.isBlocked && !c.isHidden).toList();

    if (activeContacts.isEmpty) {
      showHashSnackBar(context, message: 'Aucun contact disponible', type: HashSnackBarType.error);
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
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
              const SizedBox(height: 16),
              Text(
                'Envoyer la note à...',
                style: AppTypography.headlineSmall(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: activeContacts.length,
                  itemBuilder: (context, index) {
                    final contact = activeContacts[index];
                    return ListTile(
                      leading: HashAvatar(
                        imagePath: contact.avatarPath,
                        initials: contact.initials,
                        size: 40,
                        colorSeed: contact.displayName,
                      ),
                      title: Text(
                        contact.displayName,
                        style: AppTypography.bodyMedium(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(ctx);
                        _shareNoteToContact(contact);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  /// Envoie la note comme message à un contact
  Future<void> _shareNoteToContact(Contact contact) async {
    if (_note == null || _quillController == null) return;

    // Sauvegarder la note d'abord si des changements sont en attente
    if (_hasChanges) {
      await _saveNote();
    }

    final title = _note!.title.isEmpty ? 'Sans titre' : _note!.title;
    final editorContent = _note!.editorContent ?? '';
    final content = jsonEncode({'title': title, 'editorContent': editorContent});

    final messageRepo = ref.read(messageRepositoryProvider);
    final sendQueue = ref.read(messageSendQueueServiceProvider);
    final localStorage = ref.read(localStorageProvider);

    // Créer le message localement
    final message = messageRepo.createLocalMessage(
      contactId: contact.odid,
      type: MessageType.note,
      content: content,
    );

    // Sauvegarder localement
    await messageRepo.saveMessageLocally(message);

    // Mettre à jour le preview du contact
    final updatedContact = await localStorage.getContact(contact.odid);
    if (updatedContact != null) {
      updatedContact.lastMessageAt = DateTime.now();
      updatedContact.lastMessagePreview = '\u{1F4DD} $title';
      await localStorage.saveContact(updatedContact);
    }

    // Envoyer via la file d'attente
    await sendQueue.enqueueMessage(message, contact: contact);

    // Rafraîchir les contacts
    ref.read(contactsProvider.notifier).refresh();

    if (mounted) {
      showHashSnackBar(
        context,
        message: 'Note envoyée à ${contact.displayName}',
        type: HashSnackBarType.success,
      );
    }
  }

  Future<void> _handlePassword() async {
    if (_note!.isLocked) {
      final verified = await NotePasswordDialog.showVerify(context, _note!);
      if (verified == true) {
        setState(() {
          _note!.passwordHash = null;
          _note!.useBiometric = false;
        });
        await _saveNote();
      }
    } else {
      final result = await NotePasswordDialog.showSetup(context);
      if (result != null) {
        setState(() {
          _note!.passwordHash = result.hash;
          _note!.isPasswordPin = result.isPin;
          _note!.useBiometric = result.useBiometric;
        });
        await _saveNote();
      }
    }
  }

  void _confirmDelete() {
    // Si la note est protégée, demander le mot de passe de la note d'abord
    if (_note!.isLocked) {
      NotePasswordDialog.showVerify(context, _note!).then((verified) {
        if (verified == true && mounted) {
          _showPinDeleteDialog();
        }
      });
    } else {
      _showPinDeleteDialog();
    }
  }

  void _showPinDeleteDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final secondaryColor =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    String? pinError;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => GlassTheme.wrapAlertDialog(ctx, AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                    final noteId = _note!.id;
                    final isValid = await secureStorage.verifyPin(pin);
                    if (isValid) {
                      if (ctx.mounted) Navigator.pop(ctx);
                      await notesNotifier.deleteNote(noteId);
                      if (mounted) Navigator.of(context).pop();
                    } else {
                      if (ctx.mounted) {
                        setDialogState(
                            () => pinError = 'Code PIN incorrect');
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
                      border: Border.all(
                          color: AppColors.error.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline,
                            color: AppColors.error, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            pinError!,
                            style: AppTypography.bodySmall(
                                color: AppColors.error),
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
