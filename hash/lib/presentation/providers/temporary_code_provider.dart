import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_providers.dart';

class TemporaryCodeState {
  final String? code;
  final int? expiresAtMs;
  final bool isLoading;
  final String? error;

  const TemporaryCodeState({
    this.code,
    this.expiresAtMs,
    this.isLoading = true,
    this.error,
  });

  int get remainingSeconds {
    if (expiresAtMs == null) return 0;
    final remaining =
        (expiresAtMs! - DateTime.now().millisecondsSinceEpoch) ~/ 1000;
    return remaining < 0 ? 0 : remaining;
  }

  String get formattedTime {
    final total = remainingSeconds;
    final minutes = total ~/ 60;
    final seconds = total % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  bool get isExpired => code != null && remainingSeconds <= 0;

  TemporaryCodeState copyWith({
    String? code,
    int? expiresAtMs,
    bool? isLoading,
    String? error,
    bool clearCode = false,
    bool clearError = false,
  }) {
    return TemporaryCodeState(
      code: clearCode ? null : (code ?? this.code),
      expiresAtMs: clearCode ? null : (expiresAtMs ?? this.expiresAtMs),
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class TemporaryCodeNotifier extends StateNotifier<TemporaryCodeState> {
  final Ref _ref;
  Timer? _tickTimer;

  TemporaryCodeNotifier(this._ref) : super(const TemporaryCodeState(isLoading: false));

  @override
  void dispose() {
    _tickTimer?.cancel();
    super.dispose();
  }

  Future<void> generate() async {
    // Guard: don't generate if already loading
    if (state.isLoading) return;

    // Reuse cached code if > 60s remaining
    if (state.code != null && state.remainingSeconds > 60) {
      _ensureTickTimer();
      return;
    }

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final userRepo = _ref.read(userRepositoryProvider);
      final code = await userRepo.generateTemporaryCode();

      final secureStorage = _ref.read(secureStorageProvider);
      final expiry = await secureStorage.getContactAddCodeExpiry();

      int expiresAtMs;
      if (expiry != null) {
        expiresAtMs = expiry;
      } else {
        // Fallback: 5 minutes from now
        expiresAtMs =
            DateTime.now().millisecondsSinceEpoch + 300 * 1000;
      }

      state = TemporaryCodeState(
        code: code,
        expiresAtMs: expiresAtMs,
        isLoading: false,
      );

      _ensureTickTimer();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> forceRefresh() async {
    _tickTimer?.cancel();
    state = const TemporaryCodeState(isLoading: true);

    try {
      // Clear cached code so the repository fetches a new one
      final secureStorage = _ref.read(secureStorageProvider);
      await secureStorage.clearContactAddCode();

      final userRepo = _ref.read(userRepositoryProvider);
      final code = await userRepo.generateTemporaryCode();

      final expiry = await secureStorage.getContactAddCodeExpiry();

      int expiresAtMs;
      if (expiry != null) {
        expiresAtMs = expiry;
      } else {
        expiresAtMs =
            DateTime.now().millisecondsSinceEpoch + 300 * 1000;
      }

      state = TemporaryCodeState(
        code: code,
        expiresAtMs: expiresAtMs,
        isLoading: false,
      );

      _ensureTickTimer();
    } catch (e) {
      state = TemporaryCodeState(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void _ensureTickTimer() {
    _tickTimer?.cancel();
    _tickTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;

      if (state.isExpired) {
        _tickTimer?.cancel();
        return;
      }

      // Touch state to trigger UI rebuild (remainingSeconds is computed dynamically)
      state = state.copyWith();
    });
  }
}

final temporaryCodeNotifierProvider =
    StateNotifierProvider<TemporaryCodeNotifier, TemporaryCodeState>((ref) {
  return TemporaryCodeNotifier(ref);
});
