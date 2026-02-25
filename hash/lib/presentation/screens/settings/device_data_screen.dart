import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../providers/app_providers.dart';
import 'device_data_detail_screens.dart';

class DeviceDataScreen extends ConsumerStatefulWidget {
  const DeviceDataScreen({super.key});

  @override
  ConsumerState<DeviceDataScreen> createState() => _DeviceDataScreenState();
}

class _DeviceDataScreenState extends ConsumerState<DeviceDataScreen> {
  bool _loading = true;

  // Database counts
  int _contactCount = 0;
  int _messageCount = 0;
  int _noteCount = 0;
  int _sessionCount = 0;
  int _pendingContactCount = 0;
  int _callMessageCount = 0;
  int _mediaPrefsCount = 0;

  // File info
  int _avatarFileCount = 0;
  int _avatarSize = 0;
  int _mediaFileCount = 0;
  int _mediaSize = 0;

  // Keychain status
  bool _hasPinCode = false;
  bool _hasDuressPin = false;
  bool _hasBiometric = false;
  bool _hasRecoveryPhrase = false;
  bool _hasHashId = false;
  bool _hasSignalKeys = false;
  bool _hasAuthTokens = false;

  // Cache status
  bool _hasContactNamesCache = false;
  bool _hasRemoteConfig = false;
  bool _hasNotificationPrefs = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final localStorage = ref.read(localStorageProvider);
    final secureStorage = ref.read(secureStorageProvider);

    try {
      // Load all data in parallel
      final results = await Future.wait([
        localStorage.getContactCount(),        // 0
        localStorage.getMessageCount(),        // 1
        localStorage.getNoteCount(),           // 2
        localStorage.getSessionCount(),        // 3
        localStorage.getPendingContactCount(), // 4
        localStorage.getCallMessageCount(),    // 5
        localStorage.getMediaPrefsCount(),     // 6
        _scanDirectory('avatars'),             // 7
        _scanDirectory('media'),               // 8
        secureStorage.hasPin(),                // 9
        secureStorage.hasDuressPin(),          // 10
        secureStorage.isBiometricEnabled(),    // 11
        secureStorage.hasRecoveryPhrase(),     // 12
        secureStorage.getUserHashId(),         // 13
        secureStorage.getIdentityPublicKey(),  // 14
        secureStorage.getAccessToken(),        // 15
        _checkCaches(),                        // 16
      ]);

      if (!mounted) return;

      setState(() {
        _contactCount = results[0] as int;
        _messageCount = results[1] as int;
        _noteCount = results[2] as int;
        _sessionCount = results[3] as int;
        _pendingContactCount = results[4] as int;
        _callMessageCount = results[5] as int;
        _mediaPrefsCount = results[6] as int;

        final avatarInfo = results[7] as List<int>;
        _avatarFileCount = avatarInfo[0];
        _avatarSize = avatarInfo[1];

        final mediaInfo = results[8] as List<int>;
        _mediaFileCount = mediaInfo[0];
        _mediaSize = mediaInfo[1];

        _hasPinCode = results[9] as bool;
        _hasDuressPin = results[10] as bool;
        _hasBiometric = results[11] as bool;
        _hasRecoveryPhrase = results[12] as bool;
        _hasHashId = results[13] != null;
        _hasSignalKeys = results[14] != null;
        _hasAuthTokens = results[15] != null;

        final cacheStatus = results[16] as List<bool>;
        _hasContactNamesCache = cacheStatus[0];
        _hasRemoteConfig = cacheStatus[1];
        _hasNotificationPrefs = cacheStatus[2];

        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<List<int>> _scanDirectory(String name) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final dir = Directory('${appDir.path}/$name');
      if (!await dir.exists()) return [0, 0];

      int count = 0;
      int size = 0;
      await for (final entity in dir.list()) {
        if (entity is File) {
          count++;
          size += await entity.length();
        }
      }
      return [count, size];
    } catch (_) {
      return [0, 0];
    }
  }

  Future<List<bool>> _checkCaches() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return [
        prefs.containsKey('contact_names_cache'),
        prefs.containsKey('remote_config_cache'),
        prefs.containsKey('notification_content_level'),
      ];
    } catch (_) {
      return [false, false, false];
    }
  }

  int get _totalSize => _avatarSize + _mediaSize;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
          l10n.deviceData,
          style: AppTypography.headlineSmall(
            color: GlassTheme.glassTextColor(isDark),
          ),
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentPrimary),
              ),
            )
          : ListView(
              padding: EdgeInsets.fromLTRB(
                16,
                MediaQuery.of(context).padding.top + kToolbarHeight + 16,
                16,
                16,
              ),
              children: [
                // A. Summary card
                _buildSummaryCard(l10n, isDark),

                const SizedBox(height: 24),

                // B. Encrypted databases
                _DataSection(
                  title: l10n.encryptedDatabases,
                  isDark: isDark,
                  children: [
                    _DataRow(
                      icon: Icons.people_outlined,
                      label: l10n.contacts,
                      value: '$_contactCount',
                      detail: l10n.contactsDetail,
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataContactsScreen()),
                    ),
                    _DataRow(
                      icon: Icons.chat_bubble_outline,
                      label: l10n.messages,
                      value: '$_messageCount',
                      detail: l10n.messagesDetail,
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataMessagesScreen()),
                    ),
                    _DataRow(
                      icon: Icons.note_outlined,
                      label: l10n.notes,
                      value: '$_noteCount',
                      detail: l10n.notesDetail,
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataNotesScreen()),
                    ),
                    _DataRow(
                      icon: Icons.vpn_key_outlined,
                      label: l10n.signalSessions,
                      value: '$_sessionCount',
                      detail: l10n.signalSessionsDetail,
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataSessionsScreen()),
                    ),
                    _DataRow(
                      icon: Icons.pending_outlined,
                      label: l10n.pendingContacts,
                      value: '$_pendingContactCount',
                      detail: l10n.pendingContactsDetail,
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataPendingContactsScreen()),
                    ),
                    _DataRow(
                      icon: Icons.phone_outlined,
                      label: l10n.callHistory,
                      value: '$_callMessageCount',
                      detail: l10n.callHistoryDetail,
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataCallsScreen()),
                    ),
                    _DataRow(
                      icon: Icons.tune_outlined,
                      label: l10n.preferences,
                      value: '$_mediaPrefsCount',
                      detail: l10n.preferencesDetail,
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataMediaPrefsScreen()),
                    ),
                  ],
                ).animate().fadeIn(delay: 50.ms),

                const SizedBox(height: 16),

                // C. Files
                _DataSection(
                  title: l10n.files,
                  isDark: isDark,
                  children: [
                    _DataRow(
                      icon: Icons.face_outlined,
                      label: l10n.avatars,
                      value: l10n.fileCount(_avatarFileCount),
                      detail: _formatSize(_avatarSize),
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataAvatarsScreen()),
                    ),
                    _DataRow(
                      icon: Icons.perm_media_outlined,
                      label: l10n.media,
                      value: l10n.fileCount(_mediaFileCount),
                      detail: _formatSize(_mediaSize),
                      isDark: isDark,
                      onTap: () => _pushDetail(context, const DeviceDataMediaFilesScreen()),
                    ),
                  ],
                ).animate().fadeIn(delay: 100.ms),

                const SizedBox(height: 16),

                // D. Secure keychain
                _DataSection(
                  title: l10n.secureKeychain,
                  isDark: isDark,
                  children: [
                    _SecureDataRow(
                      icon: Icons.lock_outline,
                      label: l10n.pinCode,
                      isActive: _hasPinCode,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                    _SecureDataRow(
                      icon: Icons.shield_outlined,
                      label: l10n.vashCode,
                      isActive: _hasDuressPin,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                    _SecureDataRow(
                      icon: Icons.fingerprint,
                      label: l10n.biometrics,
                      isActive: _hasBiometric,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                    _SecureDataRow(
                      icon: Icons.key_outlined,
                      label: l10n.recoveryPhrase,
                      isActive: _hasRecoveryPhrase,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                    _SecureDataRow(
                      icon: Icons.badge_outlined,
                      label: l10n.identity,
                      isActive: _hasHashId,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                    _SecureDataRow(
                      icon: Icons.vpn_key_outlined,
                      label: l10n.signalKeys,
                      isActive: _hasSignalKeys,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                    _SecureDataRow(
                      icon: Icons.token_outlined,
                      label: l10n.authTokens,
                      isActive: _hasAuthTokens,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                  ],
                ).animate().fadeIn(delay: 150.ms),

                const SizedBox(height: 16),

                // E. Cache
                _DataSection(
                  title: l10n.cache,
                  isDark: isDark,
                  children: [
                    _SecureDataRow(
                      icon: Icons.contacts_outlined,
                      label: l10n.contactNamesCache,
                      isActive: _hasContactNamesCache,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                    _SecureDataRow(
                      icon: Icons.cloud_outlined,
                      label: l10n.remoteConfig,
                      isActive: _hasRemoteConfig,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                    _SecureDataRow(
                      icon: Icons.notifications_outlined,
                      label: l10n.notificationPrefs,
                      isActive: _hasNotificationPrefs,
                      isDark: isDark,
                      l10n: l10n,
                    ),
                  ],
                ).animate().fadeIn(delay: 200.ms),

                const SizedBox(height: 16),

                // F. Privacy reassurance
                _buildReassuranceCard(l10n, isDark)
                    .animate()
                    .fadeIn(delay: 300.ms),

                const SizedBox(height: 32),
              ],
            ),
    );
  }

  Widget _buildSummaryCard(AppLocalizations l10n, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.withValues(alpha: 0.15),
            Colors.blue.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blue.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.smartphone,
              color: Colors.blue,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatSize(_totalSize),
                  style: AppTypography.headlineMedium(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.onThisDevice,
                  style: AppTypography.bodyMedium(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn();
  }

  Widget _buildReassuranceCard(AppLocalizations l10n, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.success.withValues(alpha: 0.15),
            AppColors.success.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.success.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: AppColors.success,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              l10n.privacyReassurance,
              style: AppTypography.bodySmall(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ).copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  void _pushDetail(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => screen),
    ).then((_) => _loadData());
  }

  static String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes o';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} Ko';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} Mo';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} Go';
  }
}

// ============ PRIVATE WIDGETS ============

class _DataSection extends StatelessWidget {
  final String title;
  final bool isDark;
  final List<Widget> children;

  const _DataSection({
    required this.title,
    required this.isDark,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: AppTypography.labelSmall(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ).copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
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
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
                  Padding(
                    padding: const EdgeInsets.only(left: 54),
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
        ),
      ],
    );
  }
}

class _DataRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String detail;
  final bool isDark;
  final VoidCallback? onTap;

  const _DataRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.detail,
    required this.isDark,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tertiaryColor =
        isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: AppColors.accentPrimary.withValues(alpha: 0.08),
        highlightColor: AppColors.accentPrimary.withValues(alpha: 0.04),
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
                      label,
                      style: AppTypography.bodyMedium(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        detail,
                        style: AppTypography.bodySmall(
                          color: tertiaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                value,
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              if (onTap != null) ...[
                const SizedBox(width: 4),
                Icon(
                  Icons.chevron_right_rounded,
                  color: tertiaryColor,
                  size: 20,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SecureDataRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool isDark;
  final AppLocalizations l10n;

  const _SecureDataRow({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.isDark,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.accentPrimary, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: AppTypography.bodyMedium(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.success.withValues(alpha: 0.15)
                  : (isDark
                      ? Colors.white.withValues(alpha: 0.06)
                      : Colors.black.withValues(alpha: 0.06)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              isActive ? l10n.active : l10n.notDefined,
              style: AppTypography.labelSmall(
                color: isActive
                    ? AppColors.success
                    : (isDark
                        ? AppColors.textTertiaryDark
                        : AppColors.textTertiaryLight),
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

