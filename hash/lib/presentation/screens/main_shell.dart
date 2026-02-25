import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass_theme.dart';
import '../../core/theme/app_typography.dart';
import '../../l10n/generated/app_localizations.dart';
import '../providers/app_providers.dart';
import '../providers/contact_request_providers.dart';
import 'home/home_screen.dart';
import 'contacts/contacts_directory_screen.dart';
import 'notes/notes_screen.dart';
import 'settings/settings_screen.dart';

class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  int _currentIndex = 0;
  bool _justReconnected = false;
  Timer? _reconnectedTimer;

  final List<Widget> _tabs = const [
    HomeScreen(),
    ContactsDirectoryScreen(isTab: true),
    NotesScreen(),
    SettingsScreen(isTab: true),
  ];

  @override
  void dispose() {
    _reconnectedTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isBypass = ref.watch(callBypassProvider);

    final pendingCount = ref.watch(pendingRequestsCountProvider);
    final unreadCount = ref.watch(unreadConversationsCountProvider);
    final accountNotFound = ref.watch(accountNotFoundProvider);

    final isConnected = ref.watch(realtimeConnectedProvider);

    ref.listen<bool>(realtimeConnectedProvider, (previous, next) {
      if (previous == false && next == true) {
        _reconnectedTimer?.cancel();
        setState(() => _justReconnected = true);
        _reconnectedTimer = Timer(const Duration(seconds: 3), () {
          if (mounted) setState(() => _justReconnected = false);
        });
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          // HomeScreen doit toujours être construit pour que le mailbox
          // s'initialise et puisse connecter l'appel en mode bypass
          IndexedStack(
            index: _currentIndex,
            children: _tabs,
          ),

          // Bannière de connexion perdue (visible sur tous les onglets)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: (!isConnected || _justReconnected)
                ? MediaQuery.of(context).padding.top + kToolbarHeight
                : -40,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 32,
                color: _justReconnected
                    ? const Color(0xFF00D26A).withValues(alpha: 0.15)
                    : (isDark ? const Color(0xFF1A1A1A) : const Color(0xFFE8E8E8))
                        .withValues(alpha: 0.95),
                alignment: Alignment.center,
                child: _justReconnected
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            size: 13,
                            color: Color(0xFF00D26A),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Connexion rétablie',
                            style: AppTypography.labelSmall(
                              color: const Color(0xFF00D26A),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                              color: AppColors.accentPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Reconnexion en cours...',
                            style: AppTypography.labelSmall(
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),

          // Overlay opaque en mode bypass PIN (appel depuis lock screen)
          // Empêche l'accès aux données tout en laissant HomeScreen actif
          if (isBypass)
            Positioned.fill(
              child: Container(
                color: theme.scaffoldBackgroundColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: AppColors.accentPrimary,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Connexion de l\'appel...',
                        style: AppTypography.bodyLarge(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: isBypass ? null : _FloatingNavBar(
        currentIndex: _currentIndex,
        isDark: isDark,
        unreadBadge: unreadCount,
        pendingBadge: pendingCount,
        showAlertOnSettings: accountNotFound,
        items: [
          _NavItem(
            icon: Icons.chat_bubble_outline,
            activeIcon: Icons.chat_bubble,
            label: l10n.conversations,
          ),
          _NavItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: l10n.contacts,
          ),
          _NavItem(
            icon: Icons.note_outlined,
            activeIcon: Icons.note,
            label: l10n.notes,
          ),
          _NavItem(
            icon: Icons.settings_outlined,
            activeIcon: Icons.settings,
            label: l10n.settings,
          ),
        ],
        onTap: (index) {
          setState(() => _currentIndex = index);
          ref.read(currentTabIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

class _FloatingNavBar extends StatelessWidget {
  final int currentIndex;
  final bool isDark;
  final int unreadBadge;
  final int pendingBadge;
  final bool showAlertOnSettings;
  final List<_NavItem> items;
  final ValueChanged<int> onTap;

  const _FloatingNavBar({
    required this.currentIndex,
    required this.isDark,
    this.unreadBadge = 0,
    required this.pendingBadge,
    this.showAlertOnSettings = false,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: bottomPadding + 12,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: GlassTheme.blurHeavy, sigmaY: GlassTheme.blurHeavy),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: GlassTheme.background(isDark),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: GlassTheme.border(isDark),
              ),
              boxShadow: [
                BoxShadow(
                  color: GlassTheme.shadow,
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isActive = index == currentIndex;
                // Badge on chats tab (index 0) for unread conversations
                // Badge on contacts tab (index 1) for pending requests
                final bool showBadge;
                final int badgeCount;
                if (index == 0 && unreadBadge > 0) {
                  showBadge = true;
                  badgeCount = unreadBadge;
                } else if (index == 1 && pendingBadge > 0) {
                  showBadge = true;
                  badgeCount = pendingBadge;
                } else {
                  showBadge = false;
                  badgeCount = 0;
                }
                // Alert dot on settings tab (index 3) for account errors
                final showAlertDot = index == 3 && showAlertOnSettings;

                return Expanded(
                  child: _AnimatedNavBarItem(
                    item: item,
                    isActive: isActive,
                    isDark: isDark,
                    showBadge: showBadge,
                    badgeCount: badgeCount,
                    showAlertDot: showAlertDot,
                    onTap: () => onTap(index),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedNavBarItem extends StatefulWidget {
  final _NavItem item;
  final bool isActive;
  final bool isDark;
  final bool showBadge;
  final int badgeCount;
  final bool showAlertDot;
  final VoidCallback onTap;

  const _AnimatedNavBarItem({
    required this.item,
    required this.isActive,
    required this.isDark,
    this.showBadge = false,
    this.badgeCount = 0,
    this.showAlertDot = false,
    required this.onTap,
  });

  @override
  State<_AnimatedNavBarItem> createState() => _AnimatedNavBarItemState();
}

class _AnimatedNavBarItemState extends State<_AnimatedNavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.75), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 0.75, end: 1.12), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.12, end: 1.0), weight: 30),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(_AnimatedNavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Rejouer l'animation quand cet onglet devient actif
    if (widget.isActive && !oldWidget.isActive) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    HapticFeedback.lightImpact();
    _controller.forward(from: 0);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.isDark
        ? AppColors.accentPrimary
        : AppColors.textPrimaryLight;
    final inactiveColor = widget.isDark
        ? AppColors.accentPrimary.withValues(alpha: 0.4)
        : AppColors.textPrimaryLight.withValues(alpha: 0.4);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _handleTap,
      child: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    child: Icon(
                      widget.isActive ? widget.item.activeIcon : widget.item.icon,
                      key: ValueKey(widget.isActive),
                      color: widget.isActive ? activeColor : inactiveColor,
                      size: 24,
                    ),
                  ),
                  if (widget.showBadge)
                    Positioned(
                      right: -8,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: AppColors.accentPrimary,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          widget.badgeCount > 9 ? '9+' : '${widget.badgeCount}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  if (widget.showAlertDot)
                    Positioned(
                      right: -4,
                      top: -4,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: AppColors.error,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                style: AppTypography.labelSmall(
                  color: widget.isActive ? activeColor : inactiveColor,
                ).copyWith(
                  fontSize: 10,
                  fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
                ),
                child: Text(
                  widget.item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
