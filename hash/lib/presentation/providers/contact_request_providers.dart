import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/services/edge_function_service.dart';
import '../../domain/models/contact_request.dart';
import 'app_providers.dart';

/// State for contact requests
class ContactRequestsState {
  final List<ContactRequest> pendingRequests;
  final List<ContactRequest> acceptedRequests;
  final List<Map<String, dynamic>> sentRequests; // Raw data for sent requests
  final bool isLoading;
  final String? error;

  const ContactRequestsState({
    this.pendingRequests = const [],
    this.acceptedRequests = const [],
    this.sentRequests = const [],
    this.isLoading = false,
    this.error,
  });

  ContactRequestsState copyWith({
    List<ContactRequest>? pendingRequests,
    List<ContactRequest>? acceptedRequests,
    List<Map<String, dynamic>>? sentRequests,
    bool? isLoading,
    String? error,
  }) {
    return ContactRequestsState(
      pendingRequests: pendingRequests ?? this.pendingRequests,
      acceptedRequests: acceptedRequests ?? this.acceptedRequests,
      sentRequests: sentRequests ?? this.sentRequests,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Provider for contact requests with Realtime support
final contactRequestsProvider =
    StateNotifierProvider<ContactRequestsNotifier, ContactRequestsState>((ref) {
  return ContactRequestsNotifier(
    ref.read(edgeFunctionServiceProvider),
    ref.read(supabaseClientProvider),
  );
});

class ContactRequestsNotifier extends StateNotifier<ContactRequestsState> {
  final EdgeFunctionService _edgeFunctions;
  final SupabaseClient _client;
  DateTime? _lastAcceptedCheck;
  RealtimeChannel? _realtimeChannel;
  bool _initialPendingFetchDone = false;
  void Function(ContactRequest)? _onNewRequest;

  ContactRequestsNotifier(this._edgeFunctions, this._client) : super(const ContactRequestsState());

  /// Register a callback for when a new incoming request arrives (for global banner)
  void setOnNewRequest(void Function(ContactRequest)? callback) {
    _onNewRequest = callback;
  }

  /// Start listening for requests via Realtime (no polling).
  void startListening() {
    fetchAllRequests();
    _subscribeToRealtime();
  }

  /// Subscribe to Supabase Realtime for instant updates
  void _subscribeToRealtime() {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) {
      debugPrint('[Realtime] No user ID, skipping subscription');
      return;
    }

    // Unsubscribe from existing channel if any
    _unsubscribeFromRealtime();

    debugPrint('[Realtime] Subscribing to contact_requests for user: $userId');

    _realtimeChannel = _client.channel('contact_requests_$userId');

    _realtimeChannel!
      .onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'contact_requests',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'recipient_id',
          value: userId,
        ),
        callback: (payload) {
          debugPrint('[Realtime] Received request change: ${payload.eventType}');
          // Refresh pending requests immediately
          fetchPendingRequests();
        },
      )
      .subscribe((status, [error]) {
        debugPrint('[Realtime] Subscription status: $status');
        if (status == RealtimeSubscribeStatus.subscribed) {
          // Re-fetch to catch up after reconnection
          fetchAllRequests();
        }
        if (error != null) {
          debugPrint('[Realtime] Error: $error');
        }
      });
  }

  /// Unsubscribe from Realtime
  void _unsubscribeFromRealtime() {
    if (_realtimeChannel != null) {
      _realtimeChannel!.unsubscribe();
      _realtimeChannel = null;
    }
  }

  /// Stop listening (Realtime).
  void stopListening() {
    _unsubscribeFromRealtime();
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }

  /// Fetch all requests (pending, sent, accepted)
  Future<void> fetchAllRequests() async {
    if (!mounted) return;
    state = state.copyWith(isLoading: true);
    await Future.wait([
      fetchPendingRequests(),
      fetchSentRequests(),
    ]);
    if (!mounted) return;
    state = state.copyWith(isLoading: false);
  }

  /// Fetch pending requests (where user is recipient)
  Future<void> fetchPendingRequests() async {
    if (!mounted) return;
    try {
      final response = await _edgeFunctions.call('get-pending-requests');

      if (!mounted) return;
      if (response['success'] == true) {
        final requests = (response['requests'] as List)
            .map((r) => ContactRequest.fromPendingJson(r as Map<String, dynamic>))
            .toList();

        // Vibrate on new incoming requests (skip initial load)
        if (_initialPendingFetchDone) {
          final oldIds = state.pendingRequests.map((r) => r.id).toSet();
          final newRequests = requests.where((r) => !oldIds.contains(r.id)).toList();
          if (newRequests.isNotEmpty) {
            HapticFeedback.heavyImpact();
            // Notify the latest incoming request for the global banner
            _onNewRequest?.call(newRequests.first);
          }
        }
        _initialPendingFetchDone = true;

        state = state.copyWith(
          pendingRequests: requests,
          error: null,
        );
      }
    } catch (e) {
      // Don't update error state to avoid UI disruption
      debugPrint('[ContactRequestsNotifier] Error fetching pending requests: $e');
    }
  }

  /// Fetch sent requests (where user is requester, still pending)
  Future<void> fetchSentRequests() async {
    if (!mounted) return;
    try {
      final response = await _edgeFunctions.call('get-sent-requests');

      if (!mounted) return;
      if (response['success'] == true) {
        final requests = (response['requests'] as List)
            .map((r) => r as Map<String, dynamic>)
            .toList();

        state = state.copyWith(
          sentRequests: requests,
          error: null,
        );
      }
    } catch (e) {
      debugPrint('[ContactRequestsNotifier] Error fetching sent requests: $e');
    }
  }

  /// Fetch accepted requests (where user is requester)
  Future<void> fetchAcceptedRequests() async {
    if (!mounted) return;
    try {
      final lastChecked = _lastAcceptedCheck?.toIso8601String();
      final queryParams = lastChecked != null ? '?last_checked=$lastChecked' : '';

      final response = await _edgeFunctions.call('get-accepted-requests$queryParams');

      if (!mounted) return;
      if (response['success'] == true) {
        final newRequests = (response['requests'] as List)
            .map((r) => ContactRequest.fromAcceptedJson(r as Map<String, dynamic>))
            .toList();

        if (newRequests.isNotEmpty) {
          // Merge with existing accepted requests
          final existingIds = state.acceptedRequests.map((r) => r.id).toSet();
          final combined = [
            ...newRequests.where((r) => !existingIds.contains(r.id)),
            ...state.acceptedRequests,
          ];

          state = state.copyWith(
            acceptedRequests: combined,
            error: null,
          );
        }

        _lastAcceptedCheck = DateTime.now();
      }
    } catch (e) {
      debugPrint('[ContactRequestsNotifier] Error fetching accepted requests: $e');
    }
  }

  /// Send a contact request by Hash ID with temporary code
  Future<Map<String, dynamic>> sendContactRequest(
    String targetHashId, {
    required String temporaryCode,
  }) async {
    if (!mounted) return {'success': false, 'error': 'Not mounted'};
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _edgeFunctions.call('send-contact-request', body: {
        'target_hash_id': targetHashId.toUpperCase(),
        'temporary_code': temporaryCode,
      });

      if (!mounted) return response;
      state = state.copyWith(isLoading: false);
      return response;
    } catch (e) {
      if (!mounted) rethrow;
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  /// Accept a contact request and return the raw response (for enriched sealed message)
  Future<Map<String, dynamic>> acceptRequestRaw(String requestId) async {
    if (!mounted) throw StateError('Not mounted');
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _edgeFunctions.call('accept-contact-request', body: {
        'request_id': requestId,
      });

      if (!mounted) return response;

      // Remove from pending
      final updatedPending =
          state.pendingRequests.where((r) => r.id != requestId).toList();

      state = state.copyWith(
        pendingRequests: updatedPending,
        isLoading: false,
      );

      return response;
    } catch (e) {
      if (!mounted) rethrow;
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  /// Accept a contact request (convenience wrapper returning ContactRequest)
  Future<ContactRequest> acceptRequest(String requestId) async {
    final response = await acceptRequestRaw(requestId);
    return ContactRequest.fromAcceptResponse(response);
  }

  /// Reject a contact request
  Future<void> rejectRequest(String requestId) async {
    if (!mounted) return;
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _edgeFunctions.call('reject-contact-request', body: {
        'request_id': requestId,
      });

      if (!mounted) return;

      // Remove from pending
      final updatedPending =
          state.pendingRequests.where((r) => r.id != requestId).toList();

      state = state.copyWith(
        pendingRequests: updatedPending,
        isLoading: false,
      );
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  /// Cancel a sent request
  Future<void> cancelSentRequest(String requestId) async {
    if (!mounted) return;
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _edgeFunctions.call('cancel-contact-request', body: {
        'request_id': requestId,
      });

      if (!mounted) return;

      // Remove from sent requests
      final updatedSent =
          state.sentRequests.where((r) => r['id'] != requestId).toList();

      state = state.copyWith(
        sentRequests: updatedSent,
        isLoading: false,
      );
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  /// Mark an accepted request as processed (contact created locally)
  void markAcceptedAsProcessed(String requestId) {
    if (!mounted) return;
    final updated =
        state.acceptedRequests.where((r) => r.id != requestId).toList();
    state = state.copyWith(acceptedRequests: updated);
  }

  /// Clear error
  void clearError() {
    if (!mounted) return;
    state = state.copyWith(error: null);
  }
}

/// Provider for pending requests count (for badges)
final pendingRequestsCountProvider = Provider<int>((ref) {
  final state = ref.watch(contactRequestsProvider);
  return state.pendingRequests.length;
});

/// Provider for the latest incoming contact request (for global banner notification)
final latestIncomingRequestProvider = StateProvider<ContactRequest?>((ref) => null);

