import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/models/app_settings.dart';
import '../../providers/app_providers.dart';
import '../../providers/call_providers.dart';
import 'shake_lock_overlay.dart';

// rootNavigatorKey est défini dans app_router.dart et passé à GoRouter.
// Il donne accès à un context qui possède un Overlay, même depuis le
// builder de MaterialApp (qui est situé au-dessus du Navigator).

/// Widget wrapper qui gère la détection de secousse pour verrouiller l'app
class ShakeLockWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const ShakeLockWrapper({super.key, required this.child});

  @override
  ConsumerState<ShakeLockWrapper> createState() => _ShakeLockWrapperState();
}

class _ShakeLockWrapperState extends ConsumerState<ShakeLockWrapper>
    with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final settings = ref.read(appSettingsProvider);
      if (settings.shakeLockEnabled) {
        _startShakeLock();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ref.read(shakeLockServiceProvider).stop();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final service = ref.read(shakeLockServiceProvider);
    if (!service.isEnabled) return;

    if (state == AppLifecycleState.resumed) {
      service.resume();
    } else {
      service.pause();
    }
  }

  void _startShakeLock() {
    ref.read(shakeLockServiceProvider).start(
      onShakeDetected: _handleShakeDetected,
    );
  }

  void _handleShakeDetected() {
    if (!mounted) return;

    final service = ref.read(shakeLockServiceProvider);
    service.pause();

    HapticFeedback.heavyImpact();

    void doLock() {
      if (!mounted) return;
      ref.read(isAuthenticatedProvider.notifier).state = false;
      ref.read(routerProvider).go(AppRoutes.pinEntry);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) service.resume();
      });
    }

    // Accède directement à l'overlay du Navigator via sa GlobalKey
    final overlayState = rootNavigatorKey.currentState?.overlay;
    if (overlayState != null) {
      ShakeLockOverlay.show(overlayState, onComplete: doLock);
    } else {
      // Fallback : verrouillage immédiat sans animation
      doLock();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AppSettings>(appSettingsProvider, (previous, next) {
      if (previous == null) return;
      final service = ref.read(shakeLockServiceProvider);

      if (next.shakeLockEnabled && !previous.shakeLockEnabled) {
        _startShakeLock();
      } else if (!next.shakeLockEnabled && previous.shakeLockEnabled) {
        service.stop();
      }
    });

    ref.listen(
      callStateProvider.select((s) => s.isActive),
      (_, isCallActive) {
        final service = ref.read(shakeLockServiceProvider);
        if (!service.isEnabled) return;
        if (isCallActive) {
          service.pause();
        } else {
          service.resume();
        }
      },
    );

    return widget.child;
  }
}
