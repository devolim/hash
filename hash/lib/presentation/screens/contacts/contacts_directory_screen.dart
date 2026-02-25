import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact.dart';
import '../../../domain/models/call_state.dart';
import '../../providers/app_providers.dart';
import '../../providers/call_providers.dart';
import '../../providers/contact_request_providers.dart';
import '../../widgets/common/avatar.dart';
import '../../widgets/common/animated_appbar_title.dart';

class ContactsDirectoryScreen extends ConsumerStatefulWidget {
  final bool isTab;

  const ContactsDirectoryScreen({super.key, this.isTab = false});

  @override
  ConsumerState<ContactsDirectoryScreen> createState() =>
      _ContactsDirectoryScreenState();
}

class _ContactsDirectoryScreenState
    extends ConsumerState<ContactsDirectoryScreen> {
  String _searchQuery = '';
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondaryColor =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final contacts = ref.watch(contactsProvider);
    final pendingCount = ref.watch(pendingRequestsCountProvider);

    final sortedContacts = [...contacts]
      ..sort((a, b) => a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()));

    final filteredContacts = _searchQuery.isEmpty
        ? sortedContacts
        : sortedContacts.where((c) {
            final q = _searchQuery.toLowerCase();
            return c.displayName.toLowerCase().contains(q);
          }).toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: GlassTheme.appBarFlexibleSpace(isDark),
        automaticallyImplyLeading: !widget.isTab,
        centerTitle: widget.isTab ? true : false,
        leading: widget.isTab
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back, color: GlassTheme.glassIconColor(isDark)),
                onPressed: () => context.pop(),
              ),
        title: widget.isTab
            ? AnimatedHashAppBarTitle(
                title: l10n.contacts,
                tabIndex: 1,
                isOnGlass: true,
              )
            : Text(
                l10n.contacts,
                style: AppTypography.headlineSmall(color: GlassTheme.glassTextColor(isDark)),
              ),
        actions: null,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),
                // Mon Hash ID section
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: GestureDetector(
                    onTap: () => context.push(AppRoutes.qrDisplay),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
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
                          Text(
                            l10n.myHashId,
                            style: AppTypography.labelMedium(color: secondaryColor),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ref.watch(currentUserProvider)?.hashId ?? '---',
                            style: AppTypography.hashId(),
                          ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn().slideY(begin: -0.1, end: 0),
                ),

                // Action buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      // Add contact button
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.person_add_outlined,
                          label: l10n.addContact,
                          isDark: isDark,
                          onTap: () => context.push(AppRoutes.addContact),
                        ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95)),
                      ),
                      const SizedBox(width: 12),
                      // Requests button with badge
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.inbox_outlined,
                          label: l10n.requests,
                          badge: pendingCount,
                          isDark: isDark,
                          onTap: () => context.push(AppRoutes.contactRequests),
                        ).animate().fadeIn(delay: 50.ms).scale(begin: const Offset(0.95, 0.95)),
                      ),
                    ],
                  ),
                ),

                // Search field
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) => setState(() => _searchQuery = v),
                    style: AppTypography.bodyMedium(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                    decoration: InputDecoration(
                      hintText: l10n.searchContact,
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
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final contact = filteredContacts[index];
                return _ContactTile(
                  contact: contact,
                  isDark: isDark,
                  onTap: () {
                    ref.read(selectedContactProvider.notifier).state = contact;
                    context.push('/contact/${contact.odid}');
                  },
                  onMessage: () {
                    ref.read(selectedContactProvider.notifier).state = contact;
                    context.push('/chat/${contact.odid}');
                  },
                  onAudioCall: () {
                    ref.read(selectedContactProvider.notifier).state = contact;
                    ref.read(callStateProvider.notifier).initiateCall(
                      contact: contact,
                      callType: CallType.audio,
                    );
                    context.push('/call/${contact.odid}', extra: CallType.audio);
                  },
                  onVideoCall: () {
                    ref.read(selectedContactProvider.notifier).state = contact;
                    ref.read(callStateProvider.notifier).initiateCall(
                      contact: contact,
                      callType: CallType.video,
                    );
                    context.push('/call/${contact.odid}', extra: CallType.video);
                  },
                ).animate(delay: Duration(milliseconds: 50 * index))
                    .fadeIn()
                    .slideX(begin: 0.1, end: 0);
              },
              childCount: filteredContacts.length,
            ),
          ),
          if (filteredContacts.isEmpty)
            SliverFillRemaining(
              child: _buildEmptyState(l10n, secondaryColor),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n, Color secondaryColor) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 20, 32, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icône dans un cercle avec gradient
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.accentPrimary.withValues(alpha: 0.2),
                      AppColors.accentPrimary.withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: AppColors.accentPrimary.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.person_outline,
                  size: 48,
                  color: AppColors.accentPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.noContacts,
                style: AppTypography.headlineSmall(color: secondaryColor),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.noContactsSubtitle,
                style: AppTypography.bodyMedium(color: secondaryColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn().scale(begin: const Offset(0.9, 0.9));
  }

}



class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final int badge;
  final bool isDark;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.badge = 0,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: AppColors.accentPrimary.withValues(alpha: 0.08),
        highlightColor: AppColors.accentPrimary.withValues(alpha: 0.04),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    icon,
                    color: AppColors.accentPrimary,
                    size: 32,
                  ),
                  if (badge > 0)
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppColors.accentPrimary,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          badge > 9 ? '9+' : '$badge',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: AppTypography.bodyMedium(
                  color: AppColors.accentPrimary,
                ).copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final Contact contact;
  final bool isDark;
  final VoidCallback onTap;
  final VoidCallback onMessage;
  final VoidCallback onAudioCall;
  final VoidCallback onVideoCall;

  const _ContactTile({
    required this.contact,
    required this.isDark,
    required this.onTap,
    required this.onMessage,
    required this.onAudioCall,
    required this.onVideoCall,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            children: [
              HashAvatar(
                imagePath: contact.avatarPath,
                initials: contact.initials,
                size: 48,
                colorSeed: contact.displayName,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  contact.displayName,
                  style: AppTypography.bodyLarge(color: primaryColor)
                      .copyWith(fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onMessage,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.chat_bubble_outline,
                    color: AppColors.accentPrimary,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onAudioCall,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.phone_outlined,
                    color: AppColors.accentPrimary,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onVideoCall,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.videocam_outlined,
                    color: AppColors.accentPrimary,
                    size: 24,
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

