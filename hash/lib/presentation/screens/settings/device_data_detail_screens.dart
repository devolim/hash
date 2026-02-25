import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact.dart';
import '../../../domain/models/message.dart';
import '../../../domain/models/call_message.dart';
import '../../../domain/models/note.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/app_providers.dart';

// ============================================================
// CONTACTS DETAIL (read-only, rich display)
// ============================================================

class DeviceDataContactsScreen extends ConsumerWidget {
  const DeviceDataContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, isDark, l10n.contacts),
      body: FutureBuilder<List<Contact>>(
        future: ref.read(localStorageProvider).getAllContacts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return _buildLoading();
          final contacts = snapshot.data!;
          if (contacts.isEmpty) return _buildEmpty(isDark, l10n.noContacts);

          // Tri : épinglés en premier, bloqués en dernier, puis par dernier message
          final sorted = [...contacts]
            ..sort((a, b) {
              if (a.isPinned && !b.isPinned) return -1;
              if (!a.isPinned && b.isPinned) return 1;
              if (a.isBlocked && !b.isBlocked) return 1;
              if (!a.isBlocked && b.isBlocked) return -1;
              final aDate = a.lastMessageAt ?? a.addedAt;
              final bDate = b.lastMessageAt ?? b.addedAt;
              return bDate.compareTo(aDate);
            });

          return ListView.builder(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).padding.top + kToolbarHeight + 8,
              16,
              16,
            ),
            itemCount: sorted.length,
            itemBuilder: (context, index) {
              return _ContactCard(
                contact: sorted[index],
                isDark: isDark,
                l10n: l10n,
              ).animate().fadeIn(delay: (30 * index).ms);
            },
          );
        },
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final Contact contact;
  final bool isDark;
  final AppLocalizations l10n;

  const _ContactCard({
    required this.contact,
    required this.isDark,
    required this.l10n,
  });

  Color _avatarColor() {
    final hash = contact.hashId.codeUnits.fold(0, (a, b) => a + b);
    const colors = [
      Color(0xFF1565C0), // blue 800
      Color(0xFF2E7D32), // green 800
      Color(0xFF6A1B9A), // purple 800
      Color(0xFF00695C), // teal 800
      Color(0xFF283593), // indigo 800
      Color(0xFFE65100), // orange 900
      Color(0xFFAD1457), // pink 800
      Color(0xFF00838F), // cyan 800
    ];
    return colors[hash % colors.length];
  }

  Widget _buildAvatar(Color color) {
    if (contact.avatarPath != null) {
      final file = File(contact.avatarPath!);
      if (file.existsSync()) {
        return CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(file),
        );
      }
    }
    return CircleAvatar(
      radius: 26,
      backgroundColor: color,
      child: Text(
        contact.initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textPrimary =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textTertiary =
        isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
    final surfaceColor = isDark ? const Color(0xFF111111) : Colors.white;
    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.black.withValues(alpha: 0.05);

    final avatarColor = _avatarColor();

    final hasSession = contact.sessionData != null;
    final hasMailbox = contact.mailboxToken != null;
    final hasKey = contact.identityPublicKey != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.4)
                : Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatar(avatarColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom + badges statut
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          contact.displayName,
                          style: AppTypography.bodyMedium(color: textPrimary)
                              .copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (contact.isBlocked)
                        _MiniTag(label: l10n.blockedBadge, color: AppColors.error),
                      if (contact.isHidden)
                        _MiniTag(label: 'Caché', color: Colors.orange),
                      if (contact.isPinned)
                        _MiniTag(label: 'Épinglé', color: AppColors.accentPrimary),
                      if (contact.isMuted)
                        _MiniTag(label: 'Muet', color: textTertiary),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Hash ID masqué
                  Row(
                    children: [
                      Icon(Icons.tag_rounded, size: 11, color: textTertiary),
                      const SizedBox(width: 3),
                      Text(
                        _maskHashId(contact.hashId),
                        style: AppTypography.bodySmall(color: textTertiary)
                            .copyWith(letterSpacing: 0.5),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  // Date d'ajout
                  Row(
                    children: [
                      Icon(Icons.person_add_outlined, size: 11, color: textTertiary),
                      const SizedBox(width: 3),
                      Text(
                        _formatContactDate(contact.addedAt),
                        style: AppTypography.bodySmall(color: textTertiary),
                      ),
                    ],
                  ),
                  // Indicateurs crypto
                  if (hasSession || hasMailbox || hasKey) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        if (hasSession)
                          _CryptoChip(
                            icon: Icons.vpn_key_outlined,
                            label: 'Session Signal',
                            isDark: isDark,
                          ),
                        if (hasMailbox)
                          _CryptoChip(
                            icon: Icons.mail_outlined,
                            label: 'Mailbox',
                            isDark: isDark,
                          ),
                        if (hasKey)
                          _CryptoChip(
                            icon: Icons.key_outlined,
                            label: 'Clé',
                            isDark: isDark,
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatContactDate(DateTime dt) {
    const months = [
      'janv.', 'févr.', 'mars', 'avr.', 'mai', 'juin',
      'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.',
    ];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }
}

class _MiniTag extends StatelessWidget {
  final String label;
  final Color color;

  const _MiniTag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall(color: color)
            .copyWith(fontWeight: FontWeight.w700, fontSize: 9),
      ),
    );
  }
}

class _CryptoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isDark;

  const _CryptoChip({
    required this.icon,
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final textTertiary =
        isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
    final bg = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.black.withValues(alpha: 0.04);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: textTertiary),
          const SizedBox(width: 3),
          Text(
            label,
            style: AppTypography.labelSmall(color: textTertiary)
                .copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MESSAGES DETAIL (with delete)
// ============================================================

class DeviceDataMessagesScreen extends ConsumerStatefulWidget {
  const DeviceDataMessagesScreen({super.key});

  @override
  ConsumerState<DeviceDataMessagesScreen> createState() =>
      _DeviceDataMessagesScreenState();
}

class _DeviceDataMessagesScreenState
    extends ConsumerState<DeviceDataMessagesScreen> {
  List<_ContactMessageInfo>? _contacts;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final localStorage = ref.read(localStorageProvider);
    final contacts = await localStorage.getAllContacts();
    final infos = <_ContactMessageInfo>[];

    for (final contact in contacts) {
      final count =
          await localStorage.getMessageCountForContact(contact.odid);
      if (count > 0) {
        infos.add(_ContactMessageInfo(contact: contact, messageCount: count));
      }
    }

    if (!mounted) return;
    setState(() => _contacts = infos);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, isDark, l10n.messages),
      body: _contacts == null
          ? _buildLoading()
          : _contacts!.isEmpty
              ? _buildEmpty(isDark, l10n.noMessages)
              : ListView.builder(
                  padding: _listPadding(context),
                  itemCount: _contacts!.length,
                  itemBuilder: (context, index) {
                    final info = _contacts![index];
                    return _DetailTile(
                      icon: Icons.chat_bubble_outline,
                      title: info.contact.displayName,
                      subtitle: l10n.messageCount(info.messageCount),
                      isDark: isDark,
                      onTap: () => _openContactMessages(context, info.contact),
                      showChevron: true,
                    ).animate().fadeIn(delay: (30 * index).ms);
                  },
                ),
    );
  }

  void _openContactMessages(BuildContext context, Contact contact) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => _ContactMessagesScreen(contact: contact),
      ),
    ).then((_) => _loadData());
  }
}

class _ContactMessageInfo {
  final Contact contact;
  final int messageCount;
  _ContactMessageInfo({required this.contact, required this.messageCount});
}

// ============================================================
// MESSAGES FOR A CONTACT (with delete)
// ============================================================

class _ContactMessagesScreen extends ConsumerStatefulWidget {
  final Contact contact;
  const _ContactMessagesScreen({required this.contact});

  @override
  ConsumerState<_ContactMessagesScreen> createState() =>
      _ContactMessagesScreenState();
}

class _ContactMessagesScreenState
    extends ConsumerState<_ContactMessagesScreen> {
  List<Message>? _messages;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final messages = await ref
        .read(localStorageProvider)
        .getMessagesForContact(widget.contact.odid);
    messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    if (!mounted) return;
    setState(() => _messages = messages);
  }

  Future<void> _deleteAllMessages() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await _showDeleteConfirmation(
      context,
      l10n.deleteAllMessagesWithContact(widget.contact.displayName),
      l10n,
    );
    if (confirmed != true) return;

    await ref
        .read(localStorageProvider)
        .deleteAllMessagesForContact(widget.contact.odid);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(
        context,
        isDark,
        widget.contact.displayName,
        actions: [
          if (_messages != null && _messages!.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined,
                  color: AppColors.error),
              onPressed: _deleteAllMessages,
            ),
        ],
      ),
      body: _messages == null
          ? _buildLoading()
          : _messages!.isEmpty
              ? _buildEmpty(isDark, l10n.noMessages)
              : ListView.builder(
                  padding: _listPadding(context),
                  itemCount: _messages!.length,
                  itemBuilder: (context, index) {
                    final msg = _messages![index];
                    return Dismissible(
                      key: ValueKey(msg.id),
                      direction: DismissDirection.endToStart,
                      background: _buildDismissBackground(),
                      onDismissed: (_) async {
                        await ref
                            .read(localStorageProvider)
                            .deleteMessage(msg.id);
                        setState(() => _messages!.removeAt(index));
                      },
                      confirmDismiss: (_) =>
                          _showDeleteConfirmation(context, l10n.deleteQuestion, l10n),
                      child: _DetailTile(
                        icon: _messageTypeIcon(msg.type),
                        title:
                            '${msg.isOutgoing ? l10n.outgoing : l10n.incoming} — ${_messageTypeName(msg.type, l10n)}',
                        subtitle: _formatDateTime(msg.timestamp, l10n),
                        trailing: _MessageStatusBadge(status: msg.status),
                        isDark: isDark,
                      ).animate().fadeIn(delay: (20 * index).ms),
                    );
                  },
                ),
    );
  }
}

// ============================================================
// NOTES DETAIL (with delete for unprotected)
// ============================================================

class DeviceDataNotesScreen extends ConsumerStatefulWidget {
  const DeviceDataNotesScreen({super.key});

  @override
  ConsumerState<DeviceDataNotesScreen> createState() =>
      _DeviceDataNotesScreenState();
}

class _DeviceDataNotesScreenState extends ConsumerState<DeviceDataNotesScreen> {
  List<Note>? _notes;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await ref.read(localStorageProvider).getAllNotes();
    notes.sort((a, b) {
      if (a.isPinned && !b.isPinned) return -1;
      if (!a.isPinned && b.isPinned) return 1;
      return b.updatedAt.compareTo(a.updatedAt);
    });
    if (!mounted) return;
    setState(() => _notes = notes);
  }

  Future<void> _deleteAllUnprotected() async {
    final l10n = AppLocalizations.of(context)!;
    final unprotected = _notes!.where((n) => !n.isLocked).toList();
    final count = unprotected.length;
    final confirmed = await _showDeleteConfirmation(
      context,
      'Supprimer $count note${count > 1 ? 's' : ''} non protégée${count > 1 ? 's' : ''} ?',
      l10n,
    );
    if (confirmed != true) return;

    final localStorage = ref.read(localStorageProvider);
    for (final note in unprotected) {
      await localStorage.deleteNote(note.id);
    }
    if (!mounted) return;
    setState(() => _notes!.removeWhere((n) => !n.isLocked));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasUnprotected = _notes?.any((n) => !n.isLocked) ?? false;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(
        context,
        isDark,
        l10n.notes,
        actions: [
          if (hasUnprotected)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined, color: AppColors.error),
              onPressed: _deleteAllUnprotected,
            ),
        ],
      ),
      body: _notes == null
          ? _buildLoading()
          : _notes!.isEmpty
              ? _buildEmpty(isDark, l10n.noNotes)
              : ListView.builder(
                  padding: _listPadding(context),
                  itemCount: _notes!.length,
                  itemBuilder: (context, index) {
                    final note = _notes![index];
                    final isProtected = note.isLocked;

                    final tile = _DetailTile(
                      icon: note.type == NoteType.checklist
                          ? Icons.checklist
                          : Icons.note_outlined,
                      title: note.title.isEmpty ? l10n.untitled : note.title,
                      subtitle: _formatDateTime(note.updatedAt, l10n),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (note.isPinned)
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Icon(
                                Icons.push_pin,
                                size: 14,
                                color: isDark
                                    ? AppColors.textTertiaryDark
                                    : AppColors.textTertiaryLight,
                              ),
                            ),
                          if (isProtected)
                            _Badge(
                              label: l10n.protectedBadge,
                              color: AppColors.accentPrimary,
                            ),
                        ],
                      ),
                      isDark: isDark,
                    ).animate().fadeIn(delay: (30 * index).ms);

                    // Notes protégées : pas de swipe
                    if (isProtected) return tile;

                    // Notes non-protégées : swipe pour supprimer
                    return Dismissible(
                      key: ValueKey(note.id),
                      direction: DismissDirection.endToStart,
                      background: _buildDismissBackground(),
                      confirmDismiss: (_) => _showDeleteConfirmation(
                        context,
                        l10n.deleteNoteConfirm,
                        l10n,
                      ),
                      onDismissed: (_) async {
                        await ref.read(localStorageProvider).deleteNote(note.id);
                        if (mounted) {
                          setState(() => _notes!.removeWhere((n) => n.id == note.id));
                        }
                      },
                      child: tile,
                    );
                  },
                ),
    );
  }
}

// ============================================================
// SIGNAL SESSIONS DETAIL (read-only)
// ============================================================

class DeviceDataSessionsScreen extends ConsumerStatefulWidget {
  const DeviceDataSessionsScreen({super.key});

  @override
  ConsumerState<DeviceDataSessionsScreen> createState() =>
      _DeviceDataSessionsScreenState();
}

class _DeviceDataSessionsScreenState
    extends ConsumerState<DeviceDataSessionsScreen> {
  List<_SessionInfo>? _sessions;

  @override
  void initState() {
    super.initState();
    _loadSessions();
  }

  Future<void> _loadSessions() async {
    final localStorage = ref.read(localStorageProvider);
    final contactIds = await localStorage.getSessionContactIds();
    final sessions = <_SessionInfo>[];

    for (final id in contactIds) {
      final contact = await localStorage.getContact(id);
      sessions.add(_SessionInfo(
        contactId: id,
        contactName: contact?.displayName,
      ));
    }

    if (!mounted) return;
    setState(() => _sessions = sessions);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, isDark, l10n.signalSessions),
      body: _sessions == null
          ? _buildLoading()
          : _sessions!.isEmpty
              ? _buildEmpty(isDark, l10n.noSessions)
              : ListView.builder(
                  padding: _listPadding(context),
                  itemCount: _sessions!.length,
                  itemBuilder: (context, index) {
                    final session = _sessions![index];
                    return _DetailTile(
                      icon: Icons.vpn_key_outlined,
                      title: session.contactName ?? l10n.unknownContact,
                      subtitle: _maskId(session.contactId),
                      isDark: isDark,
                    ).animate().fadeIn(delay: (30 * index).ms);
                  },
                ),
    );
  }
}

class _SessionInfo {
  final String contactId;
  final String? contactName;
  _SessionInfo({required this.contactId, this.contactName});
}

// ============================================================
// PENDING CONTACTS DETAIL (read-only)
// ============================================================

class DeviceDataPendingContactsScreen extends ConsumerWidget {
  const DeviceDataPendingContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, isDark, l10n.pendingContacts),
      body: FutureBuilder(
        future: ref.read(localStorageProvider).getAllPendingContactMetadata(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return _buildLoading();
          final pending = snapshot.data!;
          if (pending.isEmpty) {
            return _buildEmpty(isDark, l10n.noPendingRequestsAlt);
          }

          return ListView.builder(
            padding: _listPadding(context),
            itemCount: pending.length,
            itemBuilder: (context, index) {
              final p = pending[index];
              return _DetailTile(
                icon: Icons.pending_outlined,
                title: p.name ?? l10n.unnamed,
                subtitle: _maskHashId(p.hashId),
                isDark: isDark,
              ).animate().fadeIn(delay: (30 * index).ms);
            },
          );
        },
      ),
    );
  }
}

// ============================================================
// CALLS DETAIL (with delete)
// ============================================================

class DeviceDataCallsScreen extends ConsumerStatefulWidget {
  const DeviceDataCallsScreen({super.key});

  @override
  ConsumerState<DeviceDataCallsScreen> createState() =>
      _DeviceDataCallsScreenState();
}

class _DeviceDataCallsScreenState
    extends ConsumerState<DeviceDataCallsScreen> {
  List<_CallInfo>? _calls;

  @override
  void initState() {
    super.initState();
    _loadCalls();
  }

  Future<void> _loadCalls() async {
    final localStorage = ref.read(localStorageProvider);
    final calls = await localStorage.getAllCallMessages();
    final infos = <_CallInfo>[];

    for (final call in calls) {
      final contact = await localStorage.getContact(call.contactId);
      infos.add(_CallInfo(call: call, contactName: contact?.displayName));
    }

    if (!mounted) return;
    setState(() => _calls = infos);
  }

  Future<void> _deleteAll() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await _showDeleteConfirmation(
      context,
      l10n.deleteAllCallHistory,
      l10n,
    );
    if (confirmed != true) return;

    await ref.read(localStorageProvider).deleteAllCallMessages();
    if (!mounted) return;
    setState(() => _calls = []);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(
        context,
        isDark,
        l10n.calls,
        actions: [
          if (_calls != null && _calls!.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined,
                  color: AppColors.error),
              onPressed: _deleteAll,
            ),
        ],
      ),
      body: _calls == null
          ? _buildLoading()
          : _calls!.isEmpty
              ? _buildEmpty(isDark, l10n.noCalls)
              : ListView.builder(
                  padding: _listPadding(context),
                  itemCount: _calls!.length,
                  itemBuilder: (context, index) {
                    final info = _calls![index];
                    final call = info.call;
                    final isVideo = call.callTypeString == 'video';
                    final reason = call.endReasonString;

                    return Dismissible(
                      key: ValueKey(call.id),
                      direction: DismissDirection.endToStart,
                      background: _buildDismissBackground(),
                      confirmDismiss: (_) =>
                          _showDeleteConfirmation(context, l10n.deleteQuestion, l10n),
                      onDismissed: (_) async {
                        await ref
                            .read(localStorageProvider)
                            .deleteCallMessage(call.id);
                        setState(() => _calls!.removeAt(index));
                      },
                      child: _DetailTile(
                        icon: isVideo
                            ? Icons.videocam_outlined
                            : Icons.phone_outlined,
                        title: info.contactName ?? l10n.unknownContact,
                        subtitle:
                            '${call.isOutgoing ? l10n.outgoing : l10n.incoming} — ${_formatDateTime(call.timestamp, l10n)}'
                            '${call.durationSeconds != null ? " — ${_formatDuration(call.durationSeconds!)}" : ""}',
                        trailing: _Badge(
                          label: _callReasonLabel(reason, l10n),
                          color: reason == 'completed'
                              ? AppColors.success
                              : AppColors.error,
                        ),
                        isDark: isDark,
                      ).animate().fadeIn(delay: (30 * index).ms),
                    );
                  },
                ),
    );
  }
}

class _CallInfo {
  final CallMessage call;
  final String? contactName;
  _CallInfo({required this.call, this.contactName});
}

// ============================================================
// MEDIA PREFS DETAIL (with delete)
// ============================================================

class DeviceDataMediaPrefsScreen extends ConsumerStatefulWidget {
  const DeviceDataMediaPrefsScreen({super.key});

  @override
  ConsumerState<DeviceDataMediaPrefsScreen> createState() =>
      _DeviceDataMediaPrefsScreenState();
}

class _DeviceDataMediaPrefsScreenState
    extends ConsumerState<DeviceDataMediaPrefsScreen> {
  List<_MediaPrefInfo>? _prefs;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final localStorage = ref.read(localStorageProvider);
    final entries = await localStorage.getAllMediaPrefsEntries();
    final infos = <_MediaPrefInfo>[];

    for (final entry in entries.entries) {
      final contact = await localStorage.getContact(entry.key);
      infos.add(_MediaPrefInfo(
        contactId: entry.key,
        contactName: contact?.displayName,
        isViewOnce: entry.value['isViewOnce'] as bool? ?? false,
        viewOnceDuration: entry.value['viewOnceDuration'] as int? ?? 0,
      ));
    }

    if (!mounted) return;
    setState(() => _prefs = infos);
  }

  Future<void> _deleteAll() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await _showDeleteConfirmation(
      context,
      l10n.resetAllMediaPrefs,
      l10n,
    );
    if (confirmed != true) return;

    await ref.read(localStorageProvider).deleteAllMediaPrefs();
    if (!mounted) return;
    setState(() => _prefs = []);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(
        context,
        isDark,
        l10n.preferences,
        actions: [
          if (_prefs != null && _prefs!.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined,
                  color: AppColors.error),
              onPressed: _deleteAll,
            ),
        ],
      ),
      body: _prefs == null
          ? _buildLoading()
          : _prefs!.isEmpty
              ? _buildEmpty(isDark, l10n.noPreferences)
              : ListView.builder(
                  padding: _listPadding(context),
                  itemCount: _prefs!.length,
                  itemBuilder: (context, index) {
                    final pref = _prefs![index];
                    return Dismissible(
                      key: ValueKey(pref.contactId),
                      direction: DismissDirection.endToStart,
                      background: _buildDismissBackground(),
                      confirmDismiss: (_) =>
                          _showDeleteConfirmation(context, l10n.deleteQuestion, l10n),
                      onDismissed: (_) async {
                        await ref
                            .read(localStorageProvider)
                            .deleteMediaPrefs(pref.contactId);
                        setState(() => _prefs!.removeAt(index));
                      },
                      child: _DetailTile(
                        icon: Icons.tune_outlined,
                        title: pref.contactName ?? l10n.unknownContact,
                        subtitle: pref.isViewOnce
                            ? l10n.ephemeralViewDuration(pref.viewOnceDuration)
                            : l10n.normalView,
                        isDark: isDark,
                      ).animate().fadeIn(delay: (30 * index).ms),
                    );
                  },
                ),
    );
  }
}

class _MediaPrefInfo {
  final String contactId;
  final String? contactName;
  final bool isViewOnce;
  final int viewOnceDuration;
  _MediaPrefInfo({
    required this.contactId,
    this.contactName,
    required this.isViewOnce,
    required this.viewOnceDuration,
  });
}

// ============================================================
// AVATARS DETAIL (with delete)
// ============================================================

class DeviceDataAvatarsScreen extends StatefulWidget {
  const DeviceDataAvatarsScreen({super.key});

  @override
  State<DeviceDataAvatarsScreen> createState() =>
      _DeviceDataAvatarsScreenState();
}

class _DeviceDataAvatarsScreenState extends State<DeviceDataAvatarsScreen> {
  List<_FileInfo>? _files;

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    final files = await _scanDirectoryFiles('avatars');
    if (!mounted) return;
    setState(() => _files = files);
  }

  Future<void> _deleteFile(_FileInfo file) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed =
        await _showDeleteConfirmation(context, l10n.deleteThisAvatar, l10n);
    if (confirmed != true) return;

    await file.file.delete();
    await _loadFiles();
  }

  Future<void> _deleteAll() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await _showDeleteConfirmation(
      context,
      l10n.deleteAllAvatars,
      l10n,
    );
    if (confirmed != true) return;

    try {
      final appDir = await getApplicationDocumentsDirectory();
      final dir = Directory('${appDir.path}/avatars');
      if (await dir.exists()) await dir.delete(recursive: true);
    } catch (_) {}
    if (!mounted) return;
    setState(() => _files = []);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(
        context,
        isDark,
        l10n.avatars,
        actions: [
          if (_files != null && _files!.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined,
                  color: AppColors.error),
              onPressed: _deleteAll,
            ),
        ],
      ),
      body: _files == null
          ? _buildLoading()
          : _files!.isEmpty
              ? _buildEmpty(isDark, l10n.noAvatars)
              : GridView.builder(
                  padding: _listPadding(context),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _files!.length,
                  itemBuilder: (context, index) {
                    final file = _files![index];
                    return _FileGridItem(
                      file: file,
                      isImage: true,
                      isDark: isDark,
                      onDelete: () => _deleteFile(file),
                    ).animate().fadeIn(delay: (30 * index).ms);
                  },
                ),
    );
  }
}

// ============================================================
// MEDIA FILES DETAIL (with delete)
// ============================================================

class DeviceDataMediaFilesScreen extends StatefulWidget {
  const DeviceDataMediaFilesScreen({super.key});

  @override
  State<DeviceDataMediaFilesScreen> createState() =>
      _DeviceDataMediaFilesScreenState();
}

class _DeviceDataMediaFilesScreenState
    extends State<DeviceDataMediaFilesScreen> {
  List<_FileInfo>? _files;

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    final files = await _scanDirectoryFiles('media');
    if (!mounted) return;
    setState(() => _files = files);
  }

  Future<void> _deleteFile(_FileInfo file) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed =
        await _showDeleteConfirmation(context, l10n.deleteThisFile, l10n);
    if (confirmed != true) return;

    await file.file.delete();
    await _loadFiles();
  }

  Future<void> _deleteAll() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await _showDeleteConfirmation(
      context,
      l10n.deleteAllMediaFiles,
      l10n,
    );
    if (confirmed != true) return;

    try {
      final appDir = await getApplicationDocumentsDirectory();
      final dir = Directory('${appDir.path}/media');
      if (await dir.exists()) await dir.delete(recursive: true);
    } catch (_) {}
    if (!mounted) return;
    setState(() => _files = []);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(
        context,
        isDark,
        l10n.media,
        actions: [
          if (_files != null && _files!.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined,
                  color: AppColors.error),
              onPressed: _deleteAll,
            ),
        ],
      ),
      body: _files == null
          ? _buildLoading()
          : _files!.isEmpty
              ? _buildEmpty(isDark, l10n.noMediaFiles)
              : GridView.builder(
                  padding: _listPadding(context),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _files!.length,
                  itemBuilder: (context, index) {
                    final file = _files![index];
                    final ext = file.name.split('.').last.toLowerCase();
                    final isImage = ['jpg', 'jpeg', 'png', 'gif', 'webp']
                        .contains(ext);

                    return _FileGridItem(
                      file: file,
                      isImage: isImage,
                      isDark: isDark,
                      onDelete: () => _deleteFile(file),
                    ).animate().fadeIn(delay: (30 * index).ms);
                  },
                ),
    );
  }
}

// ============================================================
// SHARED WIDGETS & HELPERS
// ============================================================

class _FileInfo {
  final File file;
  final String name;
  final int size;
  _FileInfo({required this.file, required this.name, required this.size});
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final bool isDark;
  final VoidCallback? onTap;
  final bool showChevron;

  const _DetailTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.isDark,
    this.onTap,
    this.showChevron = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: AppColors.accentPrimary, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyMedium(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        subtitle,
                        style: AppTypography.bodySmall(
                          color: isDark
                              ? AppColors.textTertiaryDark
                              : AppColors.textTertiaryLight,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
              if (showChevron)
                Icon(
                  Icons.chevron_right_rounded,
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall(color: color)
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _MessageStatusBadge extends StatelessWidget {
  final MessageStatus status;

  const _MessageStatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final (label, color) = switch (status) {
      MessageStatus.sending => (l10n.messageStatusSending, AppColors.accentPrimary),
      MessageStatus.sent => (l10n.messageStatusSent, AppColors.accentPrimary),
      MessageStatus.delivered => (l10n.messageStatusDelivered, AppColors.success),
      MessageStatus.read => (l10n.messageStatusRead, AppColors.success),
      MessageStatus.failed => (l10n.messageStatusFailed, AppColors.error),
      MessageStatus.queued => (l10n.statusQueued, AppColors.accentPrimary),
    };

    return _Badge(label: label, color: color);
  }
}

class _FileGridItem extends StatelessWidget {
  final _FileInfo file;
  final bool isImage;
  final bool isDark;
  final VoidCallback onDelete;

  const _FileGridItem({
    required this.file,
    required this.isImage,
    required this.isDark,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.06)
                  : Colors.black.withValues(alpha: 0.04),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: isImage
              ? Image.file(file.file, fit: BoxFit.cover,
                  errorBuilder: (_, error, stackTrace) => _buildFileIcon())
              : _buildFileIcon(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              _formatSize(file.size),
              style: AppTypography.labelSmall(color: Colors.white70),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: onDelete,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileIcon() {
    final ext = file.name.split('.').last.toLowerCase();
    final icon = switch (ext) {
      'mp4' || 'mov' || 'avi' => Icons.videocam_outlined,
      'mp3' || 'aac' || 'wav' || 'm4a' => Icons.audiotrack_outlined,
      'pdf' => Icons.picture_as_pdf_outlined,
      _ => Icons.insert_drive_file_outlined,
    };

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              ext.toUpperCase(),
              style: AppTypography.labelSmall(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HELPER FUNCTIONS
// ============================================================

PreferredSizeWidget _buildAppBar(
  BuildContext context,
  bool isDark,
  String title, {
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: AppColors.accentPrimary),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(
      title,
      style: AppTypography.headlineSmall(
        color: GlassTheme.glassTextColor(isDark),
      ),
    ),
    actions: actions,
  );
}

Widget _buildLoading() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
    ),
  );
}

Widget _buildEmpty(bool isDark, String message) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.inbox_outlined,
          size: 48,
          color: isDark
              ? AppColors.textTertiaryDark
              : AppColors.textTertiaryLight,
        ),
        const SizedBox(height: 12),
        Text(
          message,
          style: AppTypography.bodyMedium(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
      ],
    ),
  );
}

Widget _buildDismissBackground() {
  return Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    decoration: BoxDecoration(
      color: AppColors.error.withValues(alpha: 0.15),
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Icon(Icons.delete_outline, color: AppColors.error),
  );
}

EdgeInsets _listPadding(BuildContext context) {
  return EdgeInsets.fromLTRB(
    16,
    MediaQuery.of(context).padding.top + kToolbarHeight + 16,
    16,
    16,
  );
}

Future<bool?> _showDeleteConfirmation(
    BuildContext context, String message, AppLocalizations l10n) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return showDialog<bool>(
    context: context,
    builder: (context) => GlassTheme.glassAlertDialog(
      context: context,
      title: l10n.confirmation,
      content: message,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            l10n.cancel,
            style: AppTypography.bodyMedium(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            l10n.delete,
            style: AppTypography.bodyMedium(color: AppColors.error)
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

String _maskHashId(String hashId) {
  if (hashId.length <= 4) return '***';
  return '${hashId.substring(0, 4)}${'*' * (hashId.length - 7)}${hashId.substring(hashId.length - 3)}';
}

String _maskId(String id) {
  if (id.length <= 8) return '${id.substring(0, 4)}...';
  return '${id.substring(0, 8)}...${id.substring(id.length - 4)}';
}

String _formatDateTime(DateTime dt, AppLocalizations l10n) {
  final now = DateTime.now();
  final diff = now.difference(dt);

  if (diff.inMinutes < 1) return l10n.justNow;
  if (diff.inHours < 1) return l10n.timeAgoMinutes(diff.inMinutes);
  if (diff.inDays < 1) return l10n.timeAgoHours(diff.inHours);
  if (diff.inDays < 7) return l10n.timeAgoDays(diff.inDays);

  return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
}

String _formatDuration(int seconds) {
  final m = seconds ~/ 60;
  final s = seconds % 60;
  return '${m}m ${s.toString().padLeft(2, '0')}s';
}

String _formatSize(int bytes) {
  if (bytes < 1024) return '$bytes o';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} Ko';
  if (bytes < 1024 * 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} Mo';
  }
  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} Go';
}

IconData _messageTypeIcon(MessageType type) {
  return switch (type) {
    MessageType.text => Icons.chat_bubble_outline,
    MessageType.image => Icons.image_outlined,
    MessageType.video => Icons.videocam_outlined,
    MessageType.voice => Icons.mic_outlined,
    MessageType.file => Icons.insert_drive_file_outlined,
    MessageType.contact => Icons.person_outlined,
    MessageType.location => Icons.location_on_outlined,
    MessageType.note => Icons.sticky_note_2_outlined,
    MessageType.reaction => Icons.emoji_emotions_outlined,
    MessageType.edit => Icons.edit_outlined,
    MessageType.delete => Icons.delete_outline,
  };
}

String _messageTypeName(MessageType type, AppLocalizations l10n) {
  return switch (type) {
    MessageType.text => l10n.messageTypeText,
    MessageType.image => l10n.messageTypeImage,
    MessageType.video => l10n.messageTypeVideo,
    MessageType.voice => l10n.messageTypeVoice,
    MessageType.file => l10n.messageTypeFile,
    MessageType.contact => l10n.messageTypeContact,
    MessageType.location => l10n.messageTypeLocation,
    MessageType.note => 'Note',
    MessageType.reaction => 'Réaction',
    MessageType.edit => 'Modification',
    MessageType.delete => 'Suppression',
  };
}

String _callReasonLabel(String reason, AppLocalizations l10n) {
  return switch (reason) {
    'completed' => l10n.callReasonCompleted,
    'missed' => l10n.callReasonMissed,
    'declined' => l10n.callReasonDeclined,
    'failed' => l10n.callReasonFailed,
    _ => reason,
  };
}

Future<List<_FileInfo>> _scanDirectoryFiles(String name) async {
  try {
    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${appDir.path}/$name');
    if (!await dir.exists()) return [];

    final files = <_FileInfo>[];
    await for (final entity in dir.list()) {
      if (entity is File) {
        final stat = await entity.stat();
        files.add(_FileInfo(
          file: entity,
          name: entity.path.split('/').last,
          size: stat.size,
        ));
      }
    }
    files.sort((a, b) => b.file.path.compareTo(a.file.path));
    return files;
  } catch (_) {
    return [];
  }
}
