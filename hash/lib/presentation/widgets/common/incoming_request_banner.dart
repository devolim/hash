import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/glass_theme.dart';
import '../../../domain/models/contact_request.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../providers/contact_request_providers.dart';

/// Global banner that slides in from the top when a new contact request arrives.
/// Hidden when the user is on the ContactRequestsScreen.
class IncomingRequestBanner extends ConsumerStatefulWidget {
  const IncomingRequestBanner({super.key});

  @override
  ConsumerState<IncomingRequestBanner> createState() =>
      _IncomingRequestBannerState();
}

class _IncomingRequestBannerState extends ConsumerState<IncomingRequestBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  Timer? _autoDismissTimer;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _slideController.dispose();
    super.dispose();
  }

  void _show() {
    _autoDismissTimer?.cancel();
    setState(() => _visible = true);
    _slideController.forward();
    _autoDismissTimer = Timer(const Duration(seconds: 8), _dismiss);
  }

  void _dismiss() {
    _autoDismissTimer?.cancel();
    _slideController.reverse().then((_) {
      if (mounted) {
        setState(() => _visible = false);
        ref.read(latestIncomingRequestProvider.notifier).state = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Check current route to hide on contact requests page
    final router = ref.read(routerProvider);
    final currentUri =
        router.routerDelegate.currentConfiguration.uri.toString();
    final isOnRequestsPage =
        currentUri.startsWith(AppRoutes.contactRequests);

    ref.listen<ContactRequest?>(latestIncomingRequestProvider, (prev, next) {
      if (next != null && !isOnRequestsPage) {
        _show();
      } else if (next == null && _visible) {
        _dismiss();
      }
    });

    // Auto-dismiss if user navigates to requests page while banner is visible
    if (isOnRequestsPage && _visible) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _dismiss());
    }

    if (!_visible) return const SizedBox.shrink();

    final topPadding = MediaQuery.of(context).padding.top;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity != null &&
                  details.primaryVelocity! < -100) {
                _dismiss();
              }
            },
            onTap: () {
              HapticFeedback.lightImpact();
              _dismiss();
              ref.read(routerProvider).push(AppRoutes.contactRequests);
            },
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: GlassTheme.blurMedium,
                  sigmaY: GlassTheme.blurMedium,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, topPadding + 14, 16, 14),
                  decoration: BoxDecoration(
                    color: isDark
                        ? GlassTheme.backgroundDarkStrong
                        : GlassTheme.backgroundLightStrong,
                    border: Border(
                      bottom: BorderSide(
                        color: GlassTheme.border(isDark),
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: GlassTheme.shadow,
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Icon
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.glassAccentTint,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.glassAccentBorder,
                          ),
                        ),
                        child: const Icon(
                          Icons.person_add_alt_1_rounded,
                          color: AppColors.accentPrimary,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 14),

                      // Text
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)?.newContactRequest ??
                              'New contact request',
                          style: AppTypography.bodyMedium(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),

                      // Chevron
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
            ),
          ),
        ),
      ),
    );
  }
}
