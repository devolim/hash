import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/services/edge_function_service.dart';
import '../../providers/app_providers.dart';

/// Mixin pour gérer les erreurs de session transférée dans les écrans
/// Utiliser avec ConsumerStatefulWidget
mixin SessionGuardMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  /// Exécute une fonction et gère les erreurs de session transférée
  /// Redirige vers AccountTransferredScreen si le compte a été transféré
  Future<R?> guardedCall<R>(Future<R> Function() call) async {
    try {
      return await call();
    } on SessionTransferredException catch (e) {
      _handleSessionTransferred(e.message);
      return null;
    } on EdgeFunctionException catch (e) {
      if (e.isSessionTransferred) {
        _handleSessionTransferred(e.message);
        return null;
      }
      rethrow;
    }
  }

  void _handleSessionTransferred(String message) {
    if (!mounted) return;

    // Marquer la session comme transférée
    ref.read(sessionTransferredProvider.notifier).state = true;
    ref.read(isAuthenticatedProvider.notifier).state = false;
    ref.read(currentUserProvider.notifier).clearUser();

    // Rediriger vers l'écran de compte transféré
    context.go(AppRoutes.accountTransferred);
  }
}

/// Widget qui surveille l'état de session transférée et redirige automatiquement
class SessionGuard extends ConsumerWidget {
  final Widget child;

  const SessionGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTransferred = ref.watch(sessionTransferredProvider);

    // Redirection automatique si session transférée
    if (isTransferred) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.go(AppRoutes.accountTransferred);
        }
      });
    }

    return child;
  }
}

/// Fonction utilitaire pour exécuter un appel protégé depuis n'importe où
/// Utilise le navigateur pour rediriger si nécessaire
Future<T?> executeWithSessionGuard<T>({
  required BuildContext context,
  required WidgetRef ref,
  required Future<T> Function() call,
  VoidCallback? onError,
}) async {
  try {
    return await call();
  } on SessionTransferredException catch (e) {
    _handleTransferError(context, ref, e.message);
    return null;
  } on EdgeFunctionException catch (e) {
    if (e.isSessionTransferred) {
      _handleTransferError(context, ref, e.message);
      return null;
    }
    onError?.call();
    rethrow;
  }
}

void _handleTransferError(BuildContext context, WidgetRef ref, String message) {
  // Marquer la session comme transférée
  ref.read(sessionTransferredProvider.notifier).state = true;
  ref.read(isAuthenticatedProvider.notifier).state = false;
  ref.read(currentUserProvider.notifier).clearUser();

  // Rediriger vers l'écran de compte transféré
  if (context.mounted) {
    context.go(AppRoutes.accountTransferred);
  }
}
