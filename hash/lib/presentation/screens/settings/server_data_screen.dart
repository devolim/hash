import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';

class ServerDataScreen extends ConsumerStatefulWidget {
  const ServerDataScreen({super.key});

  @override
  ConsumerState<ServerDataScreen> createState() => _ServerDataScreenState();
}

class _ServerDataScreenState extends ConsumerState<ServerDataScreen> {
  Map<String, dynamic>? _serverData;
  bool _loading = true;
  String? _error;
  DateTime? _fetchedAt;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await ref.read(edgeFunctionServiceProvider).getServerSummary();
      if (!mounted) return;
      setState(() {
        _serverData = data;
        _loading = false;
        _fetchedAt = DateTime.now();
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Impossible de contacter le serveur';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textSecondary =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final textTertiary =
        isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
          l10n.serverData,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh_rounded,
              size: 20,
              color: _loading ? textTertiary : textSecondary,
            ),
            onPressed: _loading ? null : _loadData,
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: _buildBody(l10n, isDark, textSecondary, textTertiary),
    );
  }

  Widget _buildBody(
    AppLocalizations l10n,
    bool isDark,
    Color textSecondary,
    Color textTertiary,
  ) {
    final topPadding =
        MediaQuery.of(context).padding.top + kToolbarHeight + 20;

    if (_loading) {
      return Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
            strokeWidth: 2,
          ),
        ),
      );
    }

    if (_error != null) {
      return Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_off_outlined, color: textTertiary, size: 40),
              const SizedBox(height: 12),
              Text(
                _error!,
                style: AppTypography.bodyMedium(color: textTertiary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: _loadData,
                icon: const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('Réessayer'),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.accentPrimary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(16, topPadding, 16, 32),
      children: [
        // Timestamp
        if (_fetchedAt != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 4),
            child: Text(
              'Mis à jour à ${_formatTime(_fetchedAt!)}',
              style: AppTypography.labelSmall(color: textTertiary),
            ),
          ),

        // Intro
        _buildIntroCard(isDark, textSecondary)
            .animate()
            .fadeIn(),

        const SizedBox(height: 20),

        // Contenu
        _buildContent(l10n, isDark).animate().fadeIn(delay: 60.ms),

        const SizedBox(height: 20),

        // Carte de réassurance
        _buildReassuranceCard(isDark, textSecondary)
            .animate()
            .fadeIn(delay: 120.ms),
      ],
    );
  }

  Widget _buildIntroCard(bool isDark, Color textSecondary) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.info.withValues(alpha: 0.15),
          width: 0.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.cloud_outlined, color: AppColors.info, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Ces données sont le strict minimum requis pour que Hash puisse fonctionner. Elles ne contiennent aucune information personnelle identifiable.',
              style: AppTypography.bodySmall(color: textSecondary)
                  .copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(AppLocalizations l10n, bool isDark) {
    final data = _serverData!;
    final profile = data['profile'] as Map<String, dynamic>? ?? {};
    final prekeys = data['prekeys'] as Map<String, dynamic>? ?? {};
    final mailbox = data['mailbox'] as Map<String, dynamic>? ?? {};
    final pendingMessages = data['pending_messages'] as Map<String, dynamic>? ?? {};
    final contacts = data['contacts'] as Map<String, dynamic>? ?? {};
    final notifications = data['notifications'] as Map<String, dynamic>? ?? {};

    final hashId = profile['hash_id'] as String? ?? '—';
    final createdAt = profile['created_at'] as String?;
    final identityKey = profile['identity_key_truncated'] as String? ?? '—';
    final signedPrekeyId = profile['signed_prekey_id'] as int?;

    final prekeyCount = prekeys['count'] as int? ?? 0;

    final mailboxPending = mailbox['pending_count'] as int? ?? 0;
    final msgPending = pendingMessages['count'] as int? ?? 0;
    final totalMessages = mailboxPending + msgPending;

    final sentPending = contacts['sent_pending'] as int? ?? 0;
    final receivedPending = contacts['received_pending'] as int? ?? 0;

    final hasActiveRelay = notifications['active_relay'] as bool? ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Profil
        _SectionLabel(label: 'Profil', isDark: isDark),
        const SizedBox(height: 8),
        _ServerCard(isDark: isDark, children: [
          _ServerRow(
            icon: Icons.badge_outlined,
            iconColor: AppColors.info,
            title: 'Hash ID',
            value: hashId,
            isDark: isDark,
          ),
          _ServerRow(
            icon: Icons.key_outlined,
            iconColor: AppColors.info,
            title: 'Clé d\'identité',
            value: identityKey,
            isDark: isDark,
          ),
          if (signedPrekeyId != null)
            _ServerRow(
              icon: Icons.tag_outlined,
              iconColor: AppColors.info,
              title: 'Clé signée actuelle',
              value: '#$signedPrekeyId',
              isDark: isDark,
            ),
          if (createdAt != null)
            _ServerRow(
              icon: Icons.calendar_today_outlined,
              iconColor: AppColors.info,
              title: 'Inscription',
              value: _formatDate(DateTime.parse(createdAt)),
              isDark: isDark,
              isLast: true,
            ),
        ]),

        const SizedBox(height: 16),

        // Section Clés de chiffrement
        _SectionLabel(label: 'Clés de chiffrement', isDark: isDark),
        const SizedBox(height: 8),
        _ServerCard(isDark: isDark, children: [
          _ServerRow(
            icon: Icons.vpn_key_outlined,
            iconColor: prekeyCount < 20 ? AppColors.warning : AppColors.info,
            title: 'Prekeys disponibles',
            subtitle: 'Clés à usage unique pour établir des sessions',
            value: '$prekeyCount',
            valueColor: prekeyCount < 20 ? AppColors.warning : null,
            isDark: isDark,
            isLast: true,
          ),
        ]),

        const SizedBox(height: 16),

        // Section Messages en transit
        _SectionLabel(label: 'Messages en transit', isDark: isDark),
        const SizedBox(height: 8),
        _ServerCard(isDark: isDark, children: [
          _ServerRow(
            icon: Icons.mail_outlined,
            iconColor: AppColors.info,
            title: 'En attente de livraison',
            subtitle: 'Supprimés dès réception sur l\'appareil',
            value: '$totalMessages',
            isDark: isDark,
            isLast: true,
          ),
        ]),

        const SizedBox(height: 16),

        // Section Demandes de contact
        _SectionLabel(label: 'Demandes de contact', isDark: isDark),
        const SizedBox(height: 8),
        _ServerCard(isDark: isDark, children: [
          _ServerRow(
            icon: Icons.arrow_upward_rounded,
            iconColor: AppColors.info,
            title: 'Envoyées en attente',
            value: '$sentPending',
            isDark: isDark,
          ),
          _ServerRow(
            icon: Icons.arrow_downward_rounded,
            iconColor: AppColors.info,
            title: 'Reçues en attente',
            value: '$receivedPending',
            isDark: isDark,
            isLast: true,
          ),
        ]),

        const SizedBox(height: 16),

        // Section Notifications
        _SectionLabel(label: 'Notifications', isDark: isDark),
        const SizedBox(height: 8),
        _ServerCard(isDark: isDark, children: [
          _ServerRow(
            icon: Icons.notifications_outlined,
            iconColor: hasActiveRelay ? AppColors.success : AppColors.info,
            title: 'Relay de notification',
            subtitle: 'Permet de recevoir des notifications push',
            valueBadge: hasActiveRelay ? 'Actif' : 'Inactif',
            valueBadgeColor:
                hasActiveRelay ? AppColors.success : null,
            isDark: isDark,
            isLast: true,
          ),
        ]),
      ],
    );
  }

  Widget _buildReassuranceCard(bool isDark, Color textSecondary) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.success.withValues(alpha: 0.12),
            AppColors.success.withValues(alpha: 0.04),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.success.withValues(alpha: 0.25),
          width: 0.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: AppColors.success,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Nous ne stockons jamais votre nom, numéro de téléphone, e-mail, ou contenu de messages. Tout ce qui est listé ici est strictement technique.',
              style: AppTypography.bodySmall(color: textSecondary)
                  .copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  static String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  static String _formatDate(DateTime dt) {
    const months = [
      'janv.', 'févr.', 'mars', 'avr.', 'mai', 'juin',
      'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.',
    ];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }
}

// ─── Widgets privés ───────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  final bool isDark;

  const _SectionLabel({required this.label, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final color =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        label.toUpperCase(),
        style: AppTypography.labelSmall(color: color).copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _ServerCard extends StatelessWidget {
  final bool isDark;
  final List<Widget> children;

  const _ServerCard({required this.isDark, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1)
              Padding(
                padding: const EdgeInsets.only(left: 50),
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
    );
  }
}

class _ServerRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final String? value;
  final Color? valueColor;
  final String? valueBadge;
  final Color? valueBadgeColor;
  final bool isDark;
  final bool isLast;

  const _ServerRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.isDark,
    this.subtitle,
    this.value,
    this.valueColor,
    this.valueBadge,
    this.valueBadgeColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final textPrimary =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textTertiary =
        isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    Widget? trailing;

    if (valueBadge != null) {
      final badgeColor = valueBadgeColor ?? textTertiary;
      trailing = Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: badgeColor.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          valueBadge!,
          style: AppTypography.labelSmall(color: badgeColor)
              .copyWith(fontWeight: FontWeight.w600),
        ),
      );
    } else if (value != null) {
      final vColor = valueColor ?? AppColors.info;
      trailing = Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: vColor.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          value!,
          style: AppTypography.labelSmall(color: vColor)
              .copyWith(fontWeight: FontWeight.w700),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTypography.bodyMedium(color: textPrimary)
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: AppTypography.bodySmall(color: textTertiary),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 8),
            trailing,
          ],
        ],
      ),
    );
  }
}
