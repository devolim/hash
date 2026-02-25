import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart' as lk;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../core/services/call_audio_service.dart';
import '../../core/services/call_service.dart';
import '../../core/services/call_signaling_service.dart';
import '../../core/services/early_call_connect_service.dart';
import '../../core/services/livekit_service.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/services/notification_service.dart';
import '../../core/services/sealed_sender_service.dart';
import '../../core/services/secure_storage_service.dart';
import '../../domain/models/call_message.dart';
import '../../domain/models/call_settings.dart';
import '../../domain/models/call_state.dart';
import '../../domain/models/contact.dart';
import 'app_providers.dart';

// ============ SERVICES ============

final livekitServiceProvider = Provider<LiveKitService>((ref) {
  return LiveKitService();
});

final callSignalingServiceProvider = Provider<CallSignalingService>((ref) {
  return CallSignalingService(ref.read(edgeFunctionServiceProvider));
});

final callAudioServiceProvider = Provider<CallAudioService>((ref) {
  return CallAudioService();
});

final callServiceProvider = Provider<CallService>((ref) {
  return CallService();
});

// ============ CALL STATE ============

/// État principal de l'appel
final callStateProvider =
    StateNotifierProvider<CallStateNotifier, CallState>((ref) {
  return CallStateNotifier(
    ref: ref,
    livekitService: ref.watch(livekitServiceProvider),
    signalingService: ref.watch(callSignalingServiceProvider),
    audioService: ref.watch(callAudioServiceProvider),
    callService: ref.watch(callServiceProvider),
    localStorage: ref.watch(localStorageProvider),
  );
});

class CallStateNotifier extends StateNotifier<CallState> {
  final Ref ref;
  final LiveKitService livekitService;
  final CallSignalingService signalingService;
  final CallAudioService audioService;
  final CallService callService;
  final LocalStorageService localStorage;

  Timer? _ringTimer;
  Timer? _heartbeatTimer;
  Timer? _reconnectTimer;
  Timer? _reconnectCountdownTimer;
  Timer? _stateResetTimer;
  Timer? _p2pConnectionTimer;
  StreamSubscription? _roomEventSubscription;
  StreamSubscription? _qualitySubscription;
  bool _isSpeakerToggling = false;

  /// Guard against duplicate onCallAccepted callbacks (Android fires twice)
  bool _pendingCallAcceptHandled = false;

  /// Guard against concurrent _endCall() invocations (e.g. hangup signal +
  /// participant disconnect arriving at the same time).
  bool _isEndingCall = false;

  /// When true, CallKit decline/end events are ignored because we are
  /// programmatically replacing the CallKit notification (e.g. swapping the
  /// FCM-handler "Hash" screen with one showing the real contact name).
  bool _isReplacingCallKit = false;
  Timer? _replacingCallKitTimer;

  static const _uuid = Uuid();
  static const _ringDuration = Duration(seconds: 30);
  static const _heartbeatInterval = Duration(seconds: 30);
  static const _reconnectTimeout = Duration(seconds: 30);
  // Délai maximum pour qu'un participant rejoigne la room après connexion LiveKit.
  // Si personne ne rejoint dans ce délai, on considère que le P2P a échoué.
  static const _p2pConnectionTimeout = Duration(seconds: 30);

  // SharedPreferences keys for active call state (survives hot restart)
  static const _activeCallRoomIdKey = 'active_call_room_id';
  static const _activeCallContactIdKey = 'active_call_contact_id';
  static const _activeCallIdKey = 'active_call_id';

  CallStateNotifier({
    required this.ref,
    required this.livekitService,
    required this.signalingService,
    required this.audioService,
    required this.callService,
    required this.localStorage,
  }) : super(const CallState()) {
    // ── CRITICAL SECURITY: Ghost call prevention ──
    // During hot reload/restart, Dart state resets to idle but the LiveKit
    // singleton may still hold an active native WebRTC connection.
    // An invisible call is a severe privacy violation — terminate immediately.
    // EXCEPTION: If EarlyCallConnectService established the connection (legitimate
    // pre-PIN audio connect), don't disconnect — acceptCall() will reuse it.
    if (livekitService.isConnected && !EarlyCallConnectService.isActive) {
      debugPrint('[CallState] SECURITY: Ghost call detected on init — forcing LiveKit disconnect');
      livekitService.disconnect();
    }

    // Wire CallKit native events to our call state
    callService.onCallAccepted = () {
      debugPrint('[CallState] CallKit: user accepted call (status: ${state.status})');
      if (state.status == CallStatus.ringing) {
        // Reset guard for next call
        _pendingCallAcceptHandled = false;
        acceptCall();
      } else {
        // Guard: Android fires onCallAccepted twice — only process the first
        if (_pendingCallAcceptHandled) {
          debugPrint('[CallState] Duplicate onCallAccepted — ignoring');
          return;
        }
        _pendingCallAcceptHandled = true;

        // App is still on the PIN screen — the Dart state hasn't received the
        // offer yet. Save a flag so receiveIncomingCall() can auto-accept later.
        debugPrint('[CallState] Not ringing yet — saving pending_call_accepted');
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool('pending_call_accepted', true);
        });
      }
    };
    callService.onCallDeclined = () {
      if (_isReplacingCallKit) {
        debugPrint('[CallState] CallKit decline ignored (replacing CallKit notification)');
        return;
      }
      debugPrint('[CallState] CallKit: user declined call (status: ${state.status})');
      if (state.status == CallStatus.ringing) {
        declineCall();
      } else {
        // App is still on the PIN screen — save a flag so
        // receiveIncomingCall() can auto-decline when it processes the offer.
        debugPrint('[CallState] Not ringing yet — saving pending_call_declined');
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool('pending_call_declined', true);
        });
      }
    };
    callService.onCallEnded = () {
      if (_isReplacingCallKit) {
        debugPrint('[CallState] CallKit end ignored (replacing CallKit notification)');
        return;
      }
      debugPrint('[CallState] CallKit: call ended');
      if (state.isActive) hangUp();
    };
    callService.onCallTimeout = () {
      if (_isReplacingCallKit) {
        debugPrint('[CallState] CallKit timeout ignored (replacing CallKit notification)');
        return;
      }
      debugPrint('[CallState] CallKit: call timed out');
      if (state.status == CallStatus.ringing) {
        _endCall(CallEndReason.missed);
      }
    };

    // Clean up orphaned calls from a previous session (hot restart, crash, etc.)
    // Native CallKit/LiveKit may still be active while Dart state is reset to idle
    _cleanupOrphanedCalls();
  }

  /// Persist active call identifiers so we can clean up after hot restart.
  Future<void> _saveActiveCallState({
    required String roomId,
    required String contactId,
    required String callId,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_activeCallRoomIdKey, roomId);
      await prefs.setString(_activeCallContactIdKey, contactId);
      await prefs.setString(_activeCallIdKey, callId);
      debugPrint('[CallState] Active call state saved (room: $roomId)');
    } catch (e) {
      debugPrint('[CallState] Failed to save active call state: $e');
    }
  }

  /// Clear persisted active call state (called on normal call end).
  Future<void> _clearActiveCallState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_activeCallRoomIdKey);
      await prefs.remove(_activeCallContactIdKey);
      await prefs.remove(_activeCallIdKey);
    } catch (e) {
      debugPrint('[CallState] Failed to clear active call state: $e');
    }
  }

  /// End any native calls and LiveKit connections left over from a previous
  /// Dart session (e.g. hot restart). The Dart state is idle but the native
  /// layer may still show an active call.
  ///
  /// IMPORTANT: Skip cleanup if the user interacted with CallKit from the
  /// system notification (accepted/declined). In that case, the call is NOT
  /// orphaned — it's a legitimate call waiting to be processed.
  Future<void> _cleanupOrphanedCalls() async {
    try {
      // ALWAYS disconnect orphaned LiveKit first — regardless of CallKit flags.
      // A ghost WebRTC connection is a critical privacy issue that must never
      // be skipped. This is a safety net for the sync check in the constructor.
      // EXCEPTION: EarlyCallConnectService connection is legitimate.
      if (livekitService.isConnected && !EarlyCallConnectService.isActive) {
        debugPrint('[CallState] Orphaned LiveKit connection detected — disconnecting');
        await livekitService.disconnect();
      }

      // Check if the user interacted with CallKit from system notification
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      final hasPendingAccept = prefs.getBool('pending_call_accepted') ?? false;
      final hasPendingDecline = prefs.getBool('pending_call_declined') ?? false;
      final hasPendingCallKit = prefs.getString('pending_call_kit_id') != null;

      if (hasPendingAccept || hasPendingDecline || hasPendingCallKit) {
        debugPrint('[CallState] Pending CallKit action detected — skipping native call cleanup');
        return;
      }

      // ── CRITICAL: Detect orphaned call via persisted state ──
      // After hot restart, livekitService._room is null so isConnected is false,
      // but native WebRTC connections may still be alive. The persisted roomId
      // tells us a call was active before restart. We must notify the server
      // to destroy the room, which will force-disconnect all participants
      // (including the native WebRTC layer on this device).
      final orphanedRoomId = prefs.getString(_activeCallRoomIdKey);
      if (orphanedRoomId != null) {
        debugPrint('[CallState] Orphaned call detected from persisted state — room: $orphanedRoomId');
        try {
          await signalingService.endCall(
            roomId: orphanedRoomId,
            status: CallEndReason.failed,
          );
          debugPrint('[CallState] Server notified to destroy orphaned room');
        } catch (e) {
          debugPrint('[CallState] Failed to end orphaned call on server: $e');
        }
        await _clearActiveCallState();
      }

      final hasOrphaned = await callService.hasActiveCall();
      if (hasOrphaned) {
        debugPrint('[CallState] Orphaned native call detected — cleaning up');
        _setReplacingCallKit(const Duration(seconds: 5));
        await callService.endAllCalls();
      }
    } catch (e) {
      debugPrint('[CallState] Error cleaning up orphaned calls: $e');
    }
  }

  /// Set _isReplacingCallKit = true and schedule a reset after [duration].
  /// Cancels any previous pending reset to avoid overlapping timers.
  void _setReplacingCallKit(Duration duration) {
    _replacingCallKitTimer?.cancel();
    _isReplacingCallKit = true;
    _replacingCallKitTimer = Timer(duration, () {
      _isReplacingCallKit = false;
      debugPrint('[CallState] _isReplacingCallKit reset after ${duration.inSeconds}s');
    });
  }

  /// Démarrer un appel sortant
  Future<void> initiateCall({
    required Contact contact,
    required CallType callType,
  }) async {
    if (state.status != CallStatus.idle && state.status != CallStatus.ended) {
      debugPrint('[CallState] Already in a call');
      return;
    }

    // Annuler tout timer de reset en cours (d'un appel précédent)
    _stateResetTimer?.cancel();
    _stateResetTimer = null;

    debugPrint('[CallState] Initiating ${callType.name} call to ${contact.displayName}');

    // Reset propre si on venait d'un état ended (rappel rapide)
    if (state.status == CallStatus.ended) {
      state = state.reset();
    }

    // Mettre à jour l'état
    // Vidéo = haut-parleur activé par défaut
    _updateStatus(CallStatus.initiating);
    state = state.copyWith(
      callType: callType,
      direction: CallDirection.outgoing,
      remoteContact: contact,
      startedAt: DateTime.now(),
      isCameraOff: callType == CallType.audio,
      isSpeakerOn: callType == CallType.video,
    );

    try {
      // Démarrer le preview caméra pour les appels vidéo (avant connexion LiveKit)
      if (callType == CallType.video) {
        await livekitService.startLocalCameraPreview();
      }

      // Appeler start-call pour créer l'entrée dans call_history
      final callResult = await signalingService.startCall(
        calleeId: contact.odid,
        callType: callType,
      );

      final callId = callResult['call_id'] as String;

      state = state.copyWith(
        callId: callId,
      );

      // Afficher l'écran d'appel natif (CallKit/ConnectionService)
      // IMPORTANT: doit être fait AVANT la tonalité car CallKit reconfigure
      // l'AVAudioSession iOS, ce qui tuerait le player just_audio
      final appSettings = ref.read(appSettingsProvider);
      await callService.startOutgoingCall(
        contactName: contact.displayName,
        contactId: contact.odid,
        isVideo: callType == CallType.video,
        showInRecents: appSettings.showCallsInRecents,
      );

      // Démarrer la tonalité APRÈS le setup CallKit pour éviter que la
      // reconfiguration de l'AVAudioSession n'interrompe just_audio
      await audioService.startDialingTone(
        isVideoCall: callType == CallType.video,
      );

      // Envoyer le signal "offer" au contact
      final user = ref.read(currentUserProvider);
      if (user != null && contact.mailboxToken != null) {
        await signalingService.sendOffer(
          contact: contact,
          callId: callId,
          callType: callType,
          senderId: user.id,
          senderHashId: user.hashId,
        );
      }

      // Passer en ringing seulement après l'envoi réussi de l'offre
      _updateStatus(CallStatus.ringing);

      // Démarrer le timer de sonnerie (30s)
      _startRingTimer();

    } catch (e) {
      debugPrint('[CallState] Failed to initiate call: $e');
      await _endCall(CallEndReason.failed);
    }
  }

  /// Recevoir un appel entrant
  Future<void> receiveIncomingCall({
    required Contact contact,
    required String callId,
    required CallType callType,
  }) async {
    if (state.status != CallStatus.idle && state.status != CallStatus.ended) {
      // Déjà en train de traiter cet appel — ignorer le doublon
      if (state.callId == callId) {
        debugPrint('[CallState] Duplicate call signal ignored (callId: $callId)');
        return;
      }
      // Déjà en appel avec un autre, envoyer "busy"
      debugPrint('[CallState] Already in a call, sending busy');
      await signalingService.sendBusy(contact: contact, callId: callId);
      return;
    }

    // Annuler tout timer de reset en cours (d'un appel précédent)
    _stateResetTimer?.cancel();
    _stateResetTimer = null;

    // Reset propre si on venait d'un état ended (rappel rapide)
    if (state.status == CallStatus.ended) {
      state = state.reset();
    }

    // Reset duplicate guard for new call
    _pendingCallAcceptHandled = false;

    // Check if user already declined via CallKit while on PIN screen
    try {
      final prefs = await SharedPreferences.getInstance();
      final pendingDeclined = prefs.getBool('pending_call_declined') ?? false;
      if (pendingDeclined) {
        await prefs.remove('pending_call_declined');
        debugPrint('[CallState] Pending call declined — sending decline signal');
        await signalingService.sendDecline(contact: contact, callId: callId);
        return;
      }
    } catch (e) {
      debugPrint('[CallState] Error checking pending_call_declined: $e');
    }

    // Reject calls from blocked contacts silently
    if (contact.isBlocked) {
      debugPrint('[CallState] Rejecting call from blocked contact ${contact.displayName}');
      await signalingService.sendDecline(contact: contact, callId: callId);
      return;
    }

    // Identity verification: ensure the contact has valid identity key
    // The sealed sender envelope signature (Ed25519) already validates the sender,
    // but we verify the contact's key is present as an additional safety check
    if (contact.identityPublicKey == null || contact.identityPublicKey!.isEmpty) {
      debugPrint('[CallState] SECURITY: Rejecting call — no identity key for ${contact.displayName}');
      await signalingService.sendDecline(contact: contact, callId: callId);
      return;
    }

    debugPrint('[CallState] Receiving incoming ${callType.name} call from ${contact.displayName}');

    _updateStatus(CallStatus.ringing);
    state = state.copyWith(
      callId: callId,
      callType: callType,
      direction: CallDirection.incoming,
      remoteContact: contact,
      startedAt: DateTime.now(),
      isCameraOff: callType == CallType.audio,
    );

    // Check if app is in the foreground
    final isAppForeground =
        WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;

    // Démarrer la sonnerie et vibration
    // En foreground : jouer la sonnerie custom (l'overlay gère l'UI)
    // En background : CallKit gère la sonnerie native
    final settings = await _getCallSettings();
    await audioService.startRingtone(
      vibrate: settings.vibrationEnabled,
      playAudio: isAppForeground,
    );

    // Read the CallKit ID created by the FCM background handler (if any).
    // Reusing the same ID lets us UPDATE the notification in-place (replacing
    // "Hash" with the real contact name) without calling endAllCalls(), which
    // would fire an actionCallDecline event and kill the call.
    //
    // IMPORTANT: pending_call_kit_id is written by the FCM background isolate,
    // so we need reload() to see it. But reload() also overwrites in-memory
    // values like pending_call_accepted (set by onCallAccepted in main isolate).
    // We save and restore those to prevent clobbering.
    String? pendingCallKitId;
    try {
      final prefs = await SharedPreferences.getInstance();
      // Save in-memory flags before reload (onCallAccepted sets these in-memory
      // via setBool, but the async disk write may not be done yet — reload()
      // reads from disk and would clobber them)
      final savedAccepted = prefs.getBool('pending_call_accepted') ?? false;
      final savedDeclined = prefs.getBool('pending_call_declined') ?? false;

      await prefs.reload();

      // Restore flags that were set in the main isolate
      if (savedAccepted) await prefs.setBool('pending_call_accepted', true);
      if (savedDeclined) await prefs.setBool('pending_call_declined', true);

      pendingCallKitId = prefs.getString('pending_call_kit_id');
      if (pendingCallKitId != null) {
        // Don't remove yet — _dismissFcmCallKit() will remove it after connection
        debugPrint('[CallState] Reusing FCM CallKit ID: $pendingCallKitId');
      }
    } catch (e) {
      debugPrint('[CallState] Error reading pending CallKit ID: $e');
    }

    final incomingSettings = ref.read(appSettingsProvider);
    if (pendingCallKitId != null) {
      // FCM handler created a CallKit with generic name "Hash".
      // UPDATE it in-place with the real contact name — never endAllCalls()
      // which would fire a stray onCallEnded/onCallDeclined event on iOS.
      debugPrint('[CallState] Updating FCM CallKit ($pendingCallKitId) with name: ${contact.displayName}');
      await callService.showIncomingCall(
        contactName: contact.displayName,
        contactId: contact.odid,
        isVideo: callType == CallType.video,
        callKitId: pendingCallKitId,
        showInRecents: incomingSettings.showCallsInRecents,
      );
    } else if (!isAppForeground) {
      // No FCM CallKit and app in background → create a fresh CallKit
      debugPrint('[CallState] App in background, creating new CallKit');
      await callService.showIncomingCall(
        contactName: contact.displayName,
        contactId: contact.odid,
        isVideo: callType == CallType.video,
        showInRecents: incomingSettings.showCallsInRecents,
      );
    } else {
      // App in foreground, no pending CallKit → in-app overlay only
      debugPrint('[CallState] App in foreground, showing overlay only');
    }

    // Notifier l'overlay (visible quand l'app est au premier plan)
    ref.read(showCallOverlayProvider.notifier).state = true;

    // Check if the user already accepted via CallKit while on the PIN screen.
    // IMPORTANT: do NOT call prefs.reload() — onCallAccepted sets the flag
    // in-memory via setBool, and reload() would read from disk where the
    // async write may not be finished yet, losing the flag.
    try {
      final prefs = await SharedPreferences.getInstance();
      final pendingAccepted = prefs.getBool('pending_call_accepted') ?? false;
      if (pendingAccepted) {
        await prefs.remove('pending_call_accepted');
        debugPrint('[CallState] Pending call accepted — auto-accepting');
        Future.microtask(() => acceptCall());
        return;
      }
    } catch (e) {
      debugPrint('[CallState] Error checking pending_call_accepted: $e');
    }

    // Démarrer le timer de sonnerie
    _startRingTimer();
  }

  /// Accepter l'appel entrant
  Future<void> acceptCall() async {
    if (state.status != CallStatus.ringing ||
        state.direction != CallDirection.incoming) {
      return;
    }

    debugPrint('[CallState] Accepting call');

    // Arrêter la sonnerie
    await audioService.stopRingtone();
    _cancelRingTimer();

    // Masquer l'overlay
    ref.read(showCallOverlayProvider.notifier).state = false;

    _updateStatus(CallStatus.connecting);

    // Naviguer vers l'écran d'appel IMMÉDIATEMENT (pas après la connexion LiveKit)
    // L'écran d'appel affiche l'animation "Connexion..." pendant le setup
    ref.read(callNavigationProvider.notifier).state = 'call';

    try {
      final contact = state.remoteContact!;

      // ── Check if early connect already established the LiveKit connection ──
      if (EarlyCallConnectService.isActive && livekitService.isConnected) {
        debugPrint('[CallState] Reusing early connect LiveKit connection');

        // Answer already sent by early connect — skip
        if (!EarlyCallConnectService.answerSent) {
          await signalingService.sendAnswer(
            contact: contact,
            callId: state.callId!,
          );
        }

        // Setup listeners on the existing room
        _setupLiveKitListeners();

        final settings = await _getCallSettings();
        final speakerOn = state.isVideoCall || settings.defaultSpeakerEnabled;
        await livekitService.setSpeakerEnabled(speakerOn);

        // For video calls, enable camera now (early connect was audio-only)
        final isBypass = ref.read(callBypassProvider);
        final cameraEnabled = state.isVideoCall && settings.defaultCameraEnabled && !isBypass;
        if (cameraEnabled) {
          await livekitService.setCameraEnabled(true);
        }

        await audioService.playConnectSound();

        // Respecter l'état micro/caméra choisi par l'utilisateur avant connexion
        final micMuted = state.isMicMuted;
        if (micMuted) {
          await livekitService.setMicrophoneEnabled(false);
        }

        state = state.copyWith(
          status: CallStatus.connected,
          connectedAt: DateTime.now(),
          room: livekitService.room!,
          localParticipant: livekitService.localParticipant,
          isMicMuted: micMuted,
          isCameraOff: !cameraEnabled,
          isSpeakerOn: speakerOn,
        );

        // Persist active call state for orphan detection after hot restart
        final earlyRoomId = livekitService.room?.name;
        if (earlyRoomId != null && state.callId != null) {
          _saveActiveCallState(
            roomId: earlyRoomId,
            contactId: contact.odid,
            callId: state.callId!,
          );
        }

        await audioService.enableCallWakelock();
        _startHeartbeat();
        _dismissFcmCallKit();
        EarlyCallConnectService.reset();
        return;
      }

      // ── Normal flow (no early connect) ──
      EarlyCallConnectService.reset();

      // Envoyer le signal "answer"
      await signalingService.sendAnswer(
        contact: contact,
        callId: state.callId!,
      );

      // Obtenir le token LiveKit
      final tokenResult = await signalingService.getCallToken(
        calleeId: contact.odid,
        callType: state.callType,
      );

      final token = tokenResult['token'] as String;
      final roomId = tokenResult['room_id'] as String;

      state = state.copyWith(roomId: roomId);

      // Derive E2EE key from identity keys
      final e2eeKey = await _deriveCallE2EEKey(contact, state.callId!);

      // Connecter à LiveKit avec timeout
      final settings = await _getCallSettings();
      // In bypass mode (accepted from lock screen), force camera OFF for privacy
      final isBypass = ref.read(callBypassProvider);
      final cameraEnabled = state.isVideoCall && settings.defaultCameraEnabled && !isBypass;
      final lk.Room room;
      // Respecter l'état micro choisi par l'utilisateur avant connexion
      final micMuted = state.isMicMuted;
      final effectiveMicEnabled = !micMuted && settings.defaultMicEnabled;

      try {
        room = await livekitService.connect(
          token: token,
          roomName: roomId,
          isVideoCall: state.isVideoCall,
          micEnabled: effectiveMicEnabled,
          cameraEnabled: cameraEnabled,
          e2eeSharedKey: e2eeKey,
        ).timeout(const Duration(seconds: 15));
      } on TimeoutException {
        debugPrint('[CallState] LiveKit connection timed out — likely P2P blocked');
        await _endCall(CallEndReason.p2pFailed);
        return;
      }

      // Configurer les listeners LiveKit
      _setupLiveKitListeners();

      // Démarrer le timer P2P : si le participant distant ne rejoint pas dans
      // les 30s après connexion LiveKit, le réseau bloque probablement le P2P
      _startP2PConnectionTimer();

      // Vidéo = haut-parleur ON, sinon utiliser le réglage par défaut
      final speakerOn = state.isVideoCall || settings.defaultSpeakerEnabled;
      await livekitService.setSpeakerEnabled(speakerOn);

      // Son de connexion
      await audioService.playConnectSound();

      state = state.copyWith(
        status: CallStatus.connected,
        connectedAt: DateTime.now(),
        room: room,
        localParticipant: livekitService.localParticipant,
        isMicMuted: micMuted || !settings.defaultMicEnabled,
        isCameraOff: !cameraEnabled,
        isSpeakerOn: speakerOn,
      );

      // Persist active call state for orphan detection after hot restart
      if (state.callId != null) {
        _saveActiveCallState(
          roomId: roomId,
          contactId: contact.odid,
          callId: state.callId!,
        );
      }

      // Activer le wakelock
      await audioService.enableCallWakelock();

      // Démarrer le heartbeat
      _startHeartbeat();

      // Marquer le CallKit FCM comme connecté (s'il existe) pour garder
      // l'indicateur d'appel en cours dans la barre de statut
      _dismissFcmCallKit();

      // S'assurer qu'un CallKit actif existe (pour l'indicateur en arrière-plan)
      // Si pas de FCM CallKit, il faut en créer un et le marquer connecté
      if (callService.currentCallId == null) {
        final contact = state.remoteContact!;
        final connectSettings = ref.read(appSettingsProvider);
        await callService.startOutgoingCall(
          contactName: contact.displayName,
          contactId: contact.odid,
          isVideo: state.isVideoCall,
          showInRecents: connectSettings.showCallsInRecents,
        );
        await callService.setCallConnected();
      }

    } catch (e) {
      debugPrint('[CallState] Failed to accept call: $e');
      await _endCall(CallEndReason.failed);
    }
  }

  /// Mark the FCM-created CallKit as connected after the call is established.
  /// This stops the 30s duration timer from firing a "missed call" notification
  /// and keeps the ongoing call indicator visible in the status bar.
  Future<void> _dismissFcmCallKit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final fcmCallKitId = prefs.getString('pending_call_kit_id');
      if (fcmCallKitId != null) {
        _setReplacingCallKit(const Duration(seconds: 3));
        await FlutterCallkitIncoming.setCallConnected(fcmCallKitId);
        await prefs.remove('pending_call_kit_id');
        debugPrint('[CallState] Marked FCM CallKit as connected: $fcmCallKitId');
      }
    } catch (e) {
      debugPrint('[CallState] Error updating FCM CallKit: $e');
      _isReplacingCallKit = false;
    }
  }

  /// Refuser l'appel entrant
  Future<void> declineCall() async {
    if (state.status != CallStatus.ringing) return;

    debugPrint('[CallState] Declining call');

    // Arrêter la sonnerie
    await audioService.stopRingtone();
    _cancelRingTimer();

    // Masquer l'overlay
    ref.read(showCallOverlayProvider.notifier).state = false;

    // Envoyer le signal "decline"
    final contact = state.remoteContact;
    if (contact != null && state.callId != null) {
      await signalingService.sendDecline(
        contact: contact,
        callId: state.callId!,
      );
    }

    await _endCall(CallEndReason.declined);
  }

  /// Ignorer l'appel (fermer l'overlay sans répondre)
  void ignoreCall() {
    if (state.status != CallStatus.ringing ||
        state.direction != CallDirection.incoming) {
      return;
    }

    debugPrint('[CallState] Ignoring call');

    // Arrêter la sonnerie locale uniquement
    audioService.stopRingtone();

    // Masquer l'overlay
    ref.read(showCallOverlayProvider.notifier).state = false;

    // L'appel continue de sonner côté appelant
    // Le timer de sonnerie fera un "missed" après 30s
  }

  /// Raccrocher l'appel en cours
  Future<void> hangUp() async {
    debugPrint('[CallState] Hanging up');

    final contact = state.remoteContact;
    final callId = state.callId;

    // Envoyer le signal "hangup"
    if (contact != null && callId != null) {
      try {
        await signalingService.sendHangup(contact: contact, callId: callId);
      } catch (e) {
        debugPrint('[CallState] Failed to send hangup signal: $e');
      }
    }

    // Si l'appel n'a jamais été connecté (personne n'a décroché), c'est un "missed"
    // Seuls les appels réellement connectés sont "completed"
    final reason = state.connectedAt != null
        ? CallEndReason.completed
        : CallEndReason.missed;

    await _endCall(reason);
  }

  /// Activer/désactiver le microphone
  Future<void> toggleMicrophone() async {
    final newState = !state.isMicMuted;
    await livekitService.setMicrophoneEnabled(!newState);
    state = state.copyWith(isMicMuted: newState);
    debugPrint('[CallState] Microphone muted: $newState');
  }

  /// Activer/désactiver la caméra
  /// Quand la caméra s'active, forcer le haut-parleur
  Future<void> toggleCamera() async {
    final newState = !state.isCameraOff;
    await livekitService.setCameraEnabled(!newState);

    if (!newState) {
      // Caméra activée → forcer HP
      await livekitService.setSpeakerEnabled(true);
      state = state.copyWith(isCameraOff: false, isSpeakerOn: true);
    } else {
      state = state.copyWith(isCameraOff: true);
    }
    debugPrint('[CallState] Camera off: $newState');
  }

  /// Changer de caméra (front/back)
  Future<void> switchCamera() async {
    final success = await livekitService.switchCamera();
    if (!success) return;
    final newPosition = state.cameraPosition == CameraPosition.front
        ? CameraPosition.back
        : CameraPosition.front;
    state = state.copyWith(cameraPosition: newPosition);
    debugPrint('[CallState] Camera switched to: ${newPosition.name}');
  }

  /// Activer/désactiver le haut-parleur
  Future<void> toggleSpeaker() async {
    // Block speaker toggle when any video is active — speaker must stay ON
    if (!state.isCameraOff || !state.isRemoteCameraOff) return;

    // Verrou anti-spam : ignorer les appels tant que le précédent n'est pas fini
    if (_isSpeakerToggling) return;
    _isSpeakerToggling = true;

    try {
      final newState = !state.isSpeakerOn;

      if (state.isActive) {
        // Appel connecté → LiveKit gère le routage hardware
        await livekitService.setSpeakerEnabled(newState);
      } else if (audioService.isDialing) {
        // Tonalité d'appel en cours → audioService gère par plateforme
        // (iOS: audio_session, Android: AudioManager method channel)
        await audioService.setSpeakerDuringDialing(newState);
      }

      state = state.copyWith(isSpeakerOn: newState);
      debugPrint('[CallState] Speaker: $newState');
    } finally {
      _isSpeakerToggling = false;
    }
  }

  /// Passer d'un appel audio à vidéo
  Future<void> enableVideo() async {
    if (state.callType == CallType.video) return;

    await livekitService.setCameraEnabled(true);
    // Activer le haut-parleur pour la vidéo
    await livekitService.setSpeakerEnabled(true);
    state = state.copyWith(
      callType: CallType.video,
      isCameraOff: false,
      isSpeakerOn: true,
    );
    debugPrint('[CallState] Video enabled');
  }

  // ============ PRIVATE METHODS ============

  /// Validate and apply a state transition. Logs a warning if invalid
  /// but still applies it (non-blocking in production).
  void _updateStatus(CallStatus newStatus) {
    if (!CallState.isValidTransition(state.status, newStatus)) {
      debugPrint('[CallState] WARNING: Invalid transition ${state.status} → $newStatus');
    }
    state = state.copyWith(status: newStatus);
  }

  /// Derive E2EE shared key for call from identity keys.
  Future<String> _deriveCallE2EEKey(Contact contact, String callId) async {
    final secureStorage = ref.read(secureStorageProvider);
    final identityPrivateKey = await secureStorage.getIdentityPrivateKey();
    if (identityPrivateKey == null || contact.identityPublicKey == null) {
      throw Exception('Missing identity keys for E2EE key derivation');
    }
    final sealedSender = SealedSenderService();
    return sealedSender.deriveCallE2EEKey(
      myIdentityPrivateKey: identityPrivateKey,
      theirIdentityPublicKey: contact.identityPublicKey!,
      callId: callId,
    );
  }

  Future<CallSettings> _getCallSettings() async {
    final saved = await localStorage.getCallSettings();
    return saved ?? CallSettings();
  }

  void _startRingTimer() {
    _ringTimer?.cancel();
    _ringTimer = Timer(_ringDuration, () async {
      debugPrint('[CallState] Ring timeout');
      if (state.status == CallStatus.ringing) {
        if (state.direction == CallDirection.outgoing) {
          // Appel sortant sans réponse
          await audioService.stopDialingTone();
          await _endCall(CallEndReason.missed);
        } else {
          // Appel entrant ignoré
          await audioService.stopRingtone();
          await _endCall(CallEndReason.missed);
        }
      }
    });
  }

  void _cancelRingTimer() {
    _ringTimer?.cancel();
    _ringTimer = null;
  }

  /// Handle a raw call signal received from mailbox Realtime (home_screen).
  /// This is the primary path for receiving answer/decline/hangup/busy signals.
  void handleCallSignalFromMailbox({
    required String signalType,
    required String? callId,
  }) {
    debugPrint('[CallState] Received mailbox signal: $signalType (callId: $callId)');

    // Verify this signal is for our current call
    if (state.callId != null && callId != null && state.callId != callId) {
      debugPrint('[CallState] Signal callId mismatch, ignoring');
      return;
    }

    // Create a minimal CallSignal for internal handling
    final signal = CallSignal(
      id: '',
      type: signalType,
      encryptedPayload: '',
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(seconds: 30)),
    );

    _handleIncomingSignal(signal);
  }

  void _handleIncomingSignal(CallSignal signal) {
    debugPrint('[CallState] Received signal: ${signal.type}');

    switch (signal.type) {
      case 'answer':
        _handleAnswerSignal(signal);
        break;
      case 'decline':
        _handleDeclineSignal(signal);
        break;
      case 'hangup':
        _handleHangupSignal(signal);
        break;
      case 'busy':
        _handleBusySignal(signal);
        break;
      case 'ice':
        // ICE candidates gérés par LiveKit
        break;
    }
  }

  Future<void> _handleAnswerSignal(CallSignal signal) async {
    if (state.status != CallStatus.ringing ||
        state.direction != CallDirection.outgoing) {
      return;
    }

    debugPrint('[CallState] Call answered');

    // Arrêter la tonalité
    await audioService.stopDialingTone();
    _cancelRingTimer();

    _updateStatus(CallStatus.connecting);

    // Arrêter le preview caméra (LiveKit va prendre le relais)
    await livekitService.stopLocalCameraPreview();

    try {
      final contact = state.remoteContact!;

      // Obtenir le token LiveKit
      final tokenResult = await signalingService.getCallToken(
        calleeId: contact.odid,
        callType: state.callType,
      );

      final token = tokenResult['token'] as String;
      final roomId = tokenResult['room_id'] as String;

      state = state.copyWith(roomId: roomId);

      // Derive E2EE key from identity keys
      final e2eeKey = await _deriveCallE2EEKey(contact, state.callId!);

      // Connecter à LiveKit avec timeout
      final settings = await _getCallSettings();
      // Respecter l'état micro choisi par l'utilisateur avant connexion
      final micMuted = state.isMicMuted;
      final effectiveMicEnabled = !micMuted && settings.defaultMicEnabled;
      final lk.Room room;
      try {
        room = await livekitService.connect(
          token: token,
          roomName: roomId,
          isVideoCall: state.isVideoCall,
          micEnabled: effectiveMicEnabled,
          cameraEnabled: state.isVideoCall && settings.defaultCameraEnabled,
          e2eeSharedKey: e2eeKey,
        ).timeout(const Duration(seconds: 15));
      } on TimeoutException {
        debugPrint('[CallState] LiveKit connection timed out (outgoing) — likely P2P blocked');
        await _endCall(CallEndReason.p2pFailed);
        return;
      }

      // Configurer les listeners LiveKit
      _setupLiveKitListeners();

      // Démarrer le timer P2P : si le participant distant ne rejoint pas dans
      // les 30s après connexion LiveKit, le réseau bloque probablement le P2P
      _startP2PConnectionTimer();

      // Vidéo = haut-parleur ON, sinon utiliser le réglage par défaut
      final speakerOn = state.isVideoCall || settings.defaultSpeakerEnabled;
      await livekitService.setSpeakerEnabled(speakerOn);

      // Son de connexion
      await audioService.playConnectSound();

      state = state.copyWith(
        status: CallStatus.connected,
        connectedAt: DateTime.now(),
        room: room,
        localParticipant: livekitService.localParticipant,
        isMicMuted: micMuted || !settings.defaultMicEnabled,
        isCameraOff: !state.isVideoCall || !settings.defaultCameraEnabled,
        isSpeakerOn: speakerOn,
      );

      // Persist active call state for orphan detection after hot restart
      if (state.callId != null) {
        _saveActiveCallState(
          roomId: roomId,
          contactId: contact.odid,
          callId: state.callId!,
        );
      }

      // Marquer l'appel comme connecté côté natif (bandeau d'appel en cours)
      await callService.setCallConnected();

      // Activer le wakelock
      await audioService.enableCallWakelock();

      // Démarrer le heartbeat
      _startHeartbeat();

      // L'écran unifié est déjà affiché, il réagit via ref.watch

    } catch (e) {
      debugPrint('[CallState] Failed to connect after answer: $e');
      await _endCall(CallEndReason.failed);
    }
  }

  Future<void> _handleDeclineSignal(CallSignal signal) async {
    if (state.status != CallStatus.ringing) return;

    debugPrint('[CallState] Call declined by remote');

    await audioService.stopDialingTone();
    _cancelRingTimer();

    await _endCall(CallEndReason.declined);
  }

  Future<void> _handleHangupSignal(CallSignal signal) async {
    if (!state.isActive && state.status != CallStatus.ringing) return;

    debugPrint('[CallState] Remote hung up (status: ${state.status})');

    if (state.status == CallStatus.ringing) {
      // L'appelant a raccroché avant qu'on décroche → appel manqué
      await audioService.stopRingtone();
      await audioService.stopDialingTone();
      _cancelRingTimer();
      ref.read(showCallOverlayProvider.notifier).state = false;
      await _endCall(CallEndReason.missed);
    } else {
      // Appel connecté, raccroché normalement
      await _endCall(CallEndReason.completed);
    }
  }

  Future<void> _handleBusySignal(CallSignal signal) async {
    if (state.status != CallStatus.ringing) return;

    debugPrint('[CallState] Remote is busy');

    await audioService.stopDialingTone();
    await audioService.playBusySound();
    _cancelRingTimer();

    await _endCall(CallEndReason.busy);
  }

  void _setupLiveKitListeners() {
    _roomEventSubscription?.cancel();
    _roomEventSubscription = livekitService.roomEventStream.listen((event) {
      // Use proper type checks instead of toString() to avoid mismatches
      if (event is lk.ParticipantDisconnectedEvent) {
        _handleParticipantDisconnected();
      } else if (event is lk.ParticipantConnectedEvent) {
        _handleParticipantConnected();
      } else if (event is lk.RoomDisconnectedEvent) {
        _handleRoomDisconnected();
      } else if (event is lk.RoomReconnectingEvent) {
        _handleRoomReconnecting();
      } else if (event is lk.RoomReconnectedEvent) {
        _handleRoomReconnected();
      } else if (event is lk.TrackSubscribedEvent) {
        _handleTrackSubscribed(event);
      } else if (event is lk.TrackUnsubscribedEvent) {
        _handleTrackUnsubscribed(event);
      } else if (event is lk.TrackMutedEvent || event is lk.TrackUnmutedEvent) {
        _handleRemoteTrackMuteChanged();
      } else if (event is lk.ActiveSpeakersChangedEvent) {
        _handleActiveSpeakersChanged();
      } else if (event is lk.DataReceivedEvent) {
        _handleDataReceived(event);
      }
    });

    _qualitySubscription?.cancel();
    _qualitySubscription = livekitService.connectionQualityStream.listen((quality) {
      state = state.copyWith(connectionQuality: quality);
    });
  }

  void _handleRoomDisconnected() {
    debugPrint('[CallState] Room disconnected');
    // If we're already ending the call (e.g. hangup sent), don't override with networkError
    if (state.status == CallStatus.ended || state.status == CallStatus.idle) return;
    _endCall(CallEndReason.networkError);
  }

  void _handleRoomReconnecting() {
    debugPrint('[CallState] Room reconnecting');
    _updateStatus(CallStatus.reconnecting);

    // Initialize countdown
    int remaining = _reconnectTimeout.inSeconds;
    state = state.copyWith(reconnectSecondsRemaining: remaining);

    // Timer de reconnexion
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(_reconnectTimeout, () {
      if (state.status == CallStatus.reconnecting) {
        _reconnectCountdownTimer?.cancel();
        _endCall(CallEndReason.networkError);
      }
    });

    // Countdown timer (1s tick)
    _reconnectCountdownTimer?.cancel();
    _reconnectCountdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.status != CallStatus.reconnecting) {
        _reconnectCountdownTimer?.cancel();
        return;
      }
      remaining--;
      if (remaining >= 0) {
        state = state.copyWith(reconnectSecondsRemaining: remaining);
      }
    });
  }

  void _handleRoomReconnected() {
    debugPrint('[CallState] Room reconnected');
    _reconnectTimer?.cancel();
    _reconnectCountdownTimer?.cancel();
    _updateStatus(CallStatus.connected);
    state = state.copyWith(reconnectSecondsRemaining: null);
  }

  void _handleParticipantConnected() {
    debugPrint('[CallState] Remote participant connected');
    // P2P réussi : annuler le timer d'attente
    _p2pConnectionTimer?.cancel();
    _p2pConnectionTimer = null;
    final hasRemoteVideo = livekitService.isRemoteVideoEnabled();
    state = state.copyWith(
      remoteParticipant: livekitService.remoteParticipant,
      isRemoteCameraOff: !hasRemoteVideo,
    );
  }

  /// Démarre le timer de détection d'échec P2P.
  /// Si aucun participant ne rejoint la room dans [_p2pConnectionTimeout],
  /// on considère que le P2P est bloqué par le réseau.
  void _startP2PConnectionTimer() {
    _p2pConnectionTimer?.cancel();
    _p2pConnectionTimer = Timer(_p2pConnectionTimeout, () {
      debugPrint('[CallState] P2P connection timeout — no participant joined');
      _handleP2PFailed();
    });
    debugPrint('[CallState] P2P connection timer started (${_p2pConnectionTimeout.inSeconds}s)');
  }

  Future<void> _handleP2PFailed() async {
    if (state.status == CallStatus.ended || state.status == CallStatus.idle) return;
    debugPrint('[CallState] P2P failed — reporting to server and ending call');
    // Signaler l'échec au serveur pour statistiques
    if (state.roomId != null) {
      try {
        await signalingService.reportP2PFailed(roomId: state.roomId!);
      } catch (e) {
        debugPrint('[CallState] Failed to report P2P failure: $e');
      }
    }
    await _endCall(CallEndReason.p2pFailed);
  }

  void _handleParticipantDisconnected() {
    debugPrint('[CallState] Remote participant disconnected');
    // Remote left the room — this is a normal hangup, not a network error
    _endCall(CallEndReason.completed);
  }

  /// When a new track is subscribed (e.g. remote enables camera mid-call),
  /// refresh the remote participant reference and video state to trigger UI rebuild.
  void _handleTrackSubscribed(lk.TrackSubscribedEvent event) {
    debugPrint('[CallState] Track subscribed: ${event.track.kind}');

    // Use event track directly: if a video track was just subscribed, it IS available
    final isVideoTrack = event.track.kind == lk.TrackType.VIDEO;
    final hasRemoteVideo = isVideoTrack || livekitService.isRemoteVideoEnabled();

    // Force speaker ON when remote video appears
    final anyVideo = hasRemoteVideo || !state.isCameraOff;
    if (anyVideo && !state.isSpeakerOn) {
      livekitService.setSpeakerEnabled(true);
      state = state.copyWith(
        remoteParticipant: livekitService.remoteParticipant,
        isRemoteCameraOff: !hasRemoteVideo,
        isSpeakerOn: true,
      );
    } else {
      state = state.copyWith(
        remoteParticipant: livekitService.remoteParticipant,
        isRemoteCameraOff: !hasRemoteVideo,
      );
    }
  }

  void _handleTrackUnsubscribed(lk.TrackUnsubscribedEvent event) {
    debugPrint('[CallState] Track unsubscribed: ${event.track.kind}');
    final hasRemoteVideo = livekitService.isRemoteVideoEnabled();
    state = state.copyWith(
      remoteParticipant: livekitService.remoteParticipant,
      isRemoteCameraOff: !hasRemoteVideo,
    );
  }

  void _handleRemoteTrackMuteChanged() {
    final hasRemoteVideo = livekitService.isRemoteVideoEnabled();
    final hasRemoteAudio = livekitService.isRemoteAudioEnabled();
    debugPrint('[CallState] Remote track mute changed, video: $hasRemoteVideo, audio: $hasRemoteAudio');

    // If remote video just came back, they are no longer in background
    // (the data-channel message may arrive later or be lost).
    final clearBackground = hasRemoteVideo && state.isRemoteInBackground;

    // Force speaker ON when any video is active (local or remote)
    final anyVideo = hasRemoteVideo || !state.isCameraOff;
    if (anyVideo && !state.isSpeakerOn) {
      livekitService.setSpeakerEnabled(true);
      state = state.copyWith(
        isRemoteCameraOff: !hasRemoteVideo,
        isRemoteMicMuted: !hasRemoteAudio,
        isSpeakerOn: true,
        isRemoteInBackground: clearBackground ? false : null,
      );
    } else {
      state = state.copyWith(
        isRemoteCameraOff: !hasRemoteVideo,
        isRemoteMicMuted: !hasRemoteAudio,
        isRemoteInBackground: clearBackground ? false : null,
      );
    }
  }

  void _handleActiveSpeakersChanged() {
    final isSpeaking = livekitService.isRemoteSpeaking;
    if (state.isRemoteSpeaking != isSpeaking) {
      state = state.copyWith(isRemoteSpeaking: isSpeaking);
    }
  }

  /// Traiter les données reçues via le canal data LiveKit
  void _handleDataReceived(lk.DataReceivedEvent event) {
    try {
      final message = jsonDecode(utf8.decode(event.data)) as Map<String, dynamic>;
      final type = message['type'] as String?;

      if (type == 'app_state') {
        final appState = message['state'] as String?;
        final isBackground = appState == 'background';
        if (state.isRemoteInBackground != isBackground) {
          debugPrint('[CallState] Remote app state: $appState');
          state = state.copyWith(isRemoteInBackground: isBackground);
        }
      }
    } catch (e) {
      debugPrint('[CallState] Failed to parse data message: $e');
    }
  }

  /// Notifier le distant de notre changement d'état app (foreground/background)
  ///
  /// Only react to [paused] (background) and [resumed] (foreground).
  /// [inactive] is a transient state that fires during every transition and
  /// would otherwise cause rapid background→foreground spam on the remote side.
  void notifyAppLifecycleState(AppLifecycleState lifecycleState) {
    if (!state.isActive) return;

    // Only meaningful transitions
    if (lifecycleState != AppLifecycleState.paused &&
        lifecycleState != AppLifecycleState.resumed) {
      return;
    }

    final isBackground = lifecycleState == AppLifecycleState.paused;
    final stateStr = isBackground ? 'background' : 'foreground';
    final data = utf8.encode(jsonEncode({'type': 'app_state', 'state': stateStr}));
    livekitService.publishData(Uint8List.fromList(data));
    debugPrint('[CallState] Sent app state: $stateStr');
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(_heartbeatInterval, (_) async {
      if (state.roomId != null && state.status == CallStatus.connected) {
        try {
          final result = await signalingService.sendHeartbeat(
            roomId: state.roomId!,
          );
          if (result['continue'] == false) {
            // Durée max atteinte
            await hangUp();
          }
        } catch (e) {
          debugPrint('[CallState] Heartbeat failed: $e');
        }
      }
    });
  }

  Future<void> _endCall(CallEndReason reason) async {
    // Re-entrancy guard: prevent concurrent _endCall() calls (e.g. hangup
    // signal + participant disconnect arriving simultaneously)
    if (_isEndingCall) {
      debugPrint('[CallState] _endCall already in progress — ignoring duplicate (${reason.name})');
      return;
    }
    _isEndingCall = true;

    debugPrint('[CallState] Ending call: ${reason.name}');

    // Capture bypass state BEFORE any cleanup (it may be cleared by timers)
    final wasBypass = ref.read(callBypassProvider);

    // Annuler tous les timers
    _cancelRingTimer();
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _reconnectCountdownTimer?.cancel();
    _stateResetTimer?.cancel();
    _p2pConnectionTimer?.cancel();
    _p2pConnectionTimer = null;
    _roomEventSubscription?.cancel();
    _qualitySubscription?.cancel();

    // Clear persisted active call state immediately (before any async cleanup)
    _clearActiveCallState();

    // Arrêter les sons
    await audioService.stopRingtone();
    await audioService.stopDialingTone();
    await audioService.playEndCallSound();
    await audioService.resetAudioConfiguration();

    // Déconnecter de LiveKit
    await livekitService.disconnect();

    // Terminer l'appel côté natif
    // IMPORTANT: protéger avec _isReplacingCallKit pour que les événements
    // onCallDeclined/onCallEnded déclenchés par endAllCalls() soient ignorés.
    // Sans ça, onCallDeclined sauve pending_call_declined=true, ce qui
    // bloque le prochain appel entrant.
    _setReplacingCallKit(const Duration(seconds: 5));
    await callService.endAllCalls();

    // Masquer l'overlay
    ref.read(showCallOverlayProvider.notifier).state = false;

    // Notifier le serveur avec stats de qualité
    if (state.roomId != null) {
      try {
        // Calculate quality score from connection quality (0-100)
        int? qualityScore;
        switch (state.connectionQuality) {
          case ConnectionQuality.excellent:
            qualityScore = 100;
            break;
          case ConnectionQuality.good:
            qualityScore = 75;
            break;
          case ConnectionQuality.poor:
            qualityScore = 30;
            break;
          case ConnectionQuality.lost:
            qualityScore = 0;
            break;
        }

        await signalingService.endCall(
          roomId: state.roomId!,
          status: reason,
          qualityScore: qualityScore,
        );
      } catch (e) {
        debugPrint('[CallState] Failed to notify server: $e');
      }
    }

    // Notification locale pour appel manqué (entrant uniquement)
    if (reason == CallEndReason.missed && state.direction == CallDirection.incoming) {
      try {
        final contact = state.remoteContact;
        if (contact != null) {
          // Check if call notifications are enabled (global + per-contact)
          final prefs = await SharedPreferences.getInstance();
          await prefs.reload();
          final callNotifEnabled = prefs.getBool('call_notifications_enabled') ?? true;

          bool contactCallEnabled = true;
          bool contactMuted = false;
          final contactSettingsJson = prefs.getString('contact_notif_settings');
          if (contactSettingsJson != null) {
            try {
              final allSettings = jsonDecode(contactSettingsJson) as Map<String, dynamic>;
              final cs = allSettings[contact.hashId] as Map<String, dynamic>?;
              if (cs != null) {
                contactCallEnabled = cs['callNotificationsEnabled'] as bool? ?? true;
                final mutedUntilStr = cs['mutedUntil'] as String?;
                if (mutedUntilStr != null) {
                  final mutedUntil = DateTime.tryParse(mutedUntilStr);
                  contactMuted = mutedUntil != null && mutedUntil.isAfter(DateTime.now());
                }
              }
            } catch (_) {}
          }

          if (callNotifEnabled && contactCallEnabled && !contactMuted) {
            final notificationService = NotificationService();
            await notificationService.showMissedCallNotification(
              callerName: contact.displayName,
              callType: state.callType == CallType.video ? 'video' : 'audio',
              timestamp: state.startedAt ?? DateTime.now(),
              contactId: contact.odid,
            );
          } else {
            debugPrint('[CallState] Missed call notification suppressed by settings');
          }
        }
      } catch (e) {
        debugPrint('[CallState] Failed to show missed call notification: $e');
      }
    }

    // Sauvegarder le message d'appel dans le chat
    await _saveCallMessage(reason);

    // Reset early connect state
    EarlyCallConnectService.reset();

    // Clean up call metadata from SharedPreferences
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('pending_call_caller_hash_id');
      await prefs.remove('pending_call_type');
      await prefs.remove('pending_call_accepted');
      await prefs.remove('pending_call_declined');
      await prefs.remove('pending_signal_id');
      await prefs.remove('pending_call_kit_id');
      await prefs.remove('pending_call_id');
    } catch (e) {
      debugPrint('[CallState] Error cleaning up call prefs: $e');
    }

    // Reset guards for next call
    _pendingCallAcceptHandled = false;
    _isEndingCall = false;

    // IMPORTANT: Set the state to ended FIRST, before clearing bypass.
    // UnifiedCallScreen checks isAppLockedProvider (not callBypassProvider)
    // to decide navigation, so the order is safe.
    state = state.copyWith(
      status: CallStatus.ended,
      endedAt: DateTime.now(),
      endReason: reason,
    );

    // If in bypass mode, signal that the call ended during bypass
    // so HashApp can navigate back to PIN screen
    if (wasBypass) {
      ref.read(callBypassProvider.notifier).state = false;
      ref.read(callEndedDuringBypassProvider.notifier).state = true;
    }

    // Réinitialiser après un court délai (le temps que la navigation s'effectue)
    // Utiliser addPostFrameCallback pour s'assurer que le widget tree est stable
    _stateResetTimer?.cancel();
    _stateResetTimer = Timer(const Duration(seconds: 2), () {
      if (mounted && state.status == CallStatus.ended) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          try {
            if (mounted && state.status == CallStatus.ended) {
              state = state.reset();
              // Reset navigation
              ref.read(callNavigationProvider.notifier).state = null;
            }
          } catch (e) {
            debugPrint('[CallState] State reset skipped (listeners disposed): $e');
          }
        });
      }
    });
  }

  Future<void> _saveCallMessage(CallEndReason reason) async {
    final contact = state.remoteContact;
    if (contact == null) return;

    // Calcul de la durée depuis le début de l'appel
    final callStartedAt = state.startedAt ?? DateTime.now();
    final callDurationFromStart = DateTime.now().difference(callStartedAt);

    // Si l'appelant a annulé en moins de 3 secondes et que l'appel n'a jamais
    // été connecté, ne rien enregistrer (annulation instantanée)
    final wasInstantCancel = state.direction == CallDirection.outgoing &&
        state.connectedAt == null &&
        callDurationFromStart.inSeconds < 3 &&
        (reason == CallEndReason.missed || reason == CallEndReason.failed);

    if (wasInstantCancel) {
      debugPrint('[CallState] Instant cancel (< 3s) — skipping call message');
      return;
    }

    // Calculer l'expiration selon les paramètres éphémères (contact → global)
    // Les messages d'appel sont toujours sauvegardés (même en mode éphémère 0)
    // car ce sont des métadonnées (appel manqué, durée, etc.) essentielles à l'UX.
    // Le nettoyage se fait à l'ouverture du chat (chat_screen).
    final settings = ref.read(appSettingsProvider);
    final ephemeralDuration = contact.ephemeralDuration ?? settings.defaultEphemeralDuration;

    DateTime? expiresAt;
    if (ephemeralDuration > 0) {
      expiresAt = DateTime.now().add(
        Duration(seconds: ephemeralDuration),
      );
    }

    // Seuls les appels connectés ont une durée
    final duration = state.connectedAt != null ? state.duration : null;

    // Utiliser state.callId (partagé entre les deux parties via signaling)
    // plutôt qu'un UUID aléatoire, pour permettre la déduplication côté réception.
    final messageId = state.callId ?? _uuid.v4();

    final callMessage = CallMessage.create(
      id: messageId,
      contactId: contact.odid,
      isOutgoing: state.direction == CallDirection.outgoing,
      callType: state.callType,
      endReason: reason,
      duration: duration,
      timestamp: callStartedAt,
      expiresAt: expiresAt,
    );

    await localStorage.saveCallMessage(callMessage);
    debugPrint('[CallState] Call message saved');

    // Envoyer un message sealed "call_event" à l'interlocuteur
    // pour qu'il ait l'appel dans son chat (surtout utile pour les appels manqués)
    _sendCallEventToRemote(contact, callMessage);
  }

  /// Envoie un message sealed call_event à l'interlocuteur
  Future<void> _sendCallEventToRemote(Contact contact, CallMessage callMessage) async {
    try {
      if (contact.mailboxToken == null ||
          contact.mailboxToken!.isEmpty ||
          contact.sealedSenderPublicKey == null ||
          contact.sealedSenderPublicKey!.isEmpty) {
        debugPrint('[CallState] Cannot send call_event: missing mailbox credentials');
        return;
      }

      final mailboxService = ref.read(anonymousMailboxServiceProvider);

      final payload = jsonEncode({
        'type': 'call_event',
        'callType': callMessage.callTypeString,
        'endReason': callMessage.endReasonString,
        'duration': callMessage.durationSeconds,
        'callId': callMessage.id,
        'timestamp': callMessage.timestamp.toIso8601String(),
        'isOutgoing': callMessage.isOutgoing,
      });

      final messageBytes = Uint8List.fromList(utf8.encode(payload));

      // Envoyer avec relay_token seulement pour les appels manqués/échoués
      // (pour les appels complétés, les deux côtés savent déjà)
      final bool sendNotification = callMessage.endReason == CallEndReason.missed ||
          callMessage.endReason == CallEndReason.failed ||
          callMessage.endReason == CallEndReason.timeout;

      await mailboxService.sendSealedMessage(
        recipientMailboxToken: contact.mailboxToken!,
        messageContent: messageBytes,
        recipientSealedPublicKey: contact.sealedSenderPublicKey!,
        recipientRelayToken: sendNotification ? contact.relayToken : null,
        sendToken: contact.sendToken,
      );

      debugPrint('[CallState] call_event sent to ${contact.hashId}');
    } catch (e) {
      debugPrint('[CallState] Failed to send call_event: $e');
    }
  }

  @override
  void dispose() {
    _ringTimer?.cancel();
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _reconnectCountdownTimer?.cancel();
    _stateResetTimer?.cancel();
    _replacingCallKitTimer?.cancel();
    _roomEventSubscription?.cancel();
    _qualitySubscription?.cancel();
    super.dispose();
  }
}

// ============ UI STATE ============

/// Afficher l'overlay d'appel entrant
final showCallOverlayProvider = StateProvider<bool>((ref) => false);

/// Navigation trigger pour les appels — quand non-null, naviguer vers cette route
final callNavigationProvider = StateProvider<String?>((ref) => null);

/// Tracks whether the active call screen is currently visible
/// Used to hide the floating call banner when on the call screen
final isOnActiveCallScreenProvider = StateProvider<bool>((ref) => false);

/// Timer de durée de l'appel
final callDurationProvider = StreamProvider<Duration>((ref) {
  final callState = ref.watch(callStateProvider);

  if (callState.status != CallStatus.connected || callState.connectedAt == null) {
    return Stream.value(Duration.zero);
  }

  return Stream.periodic(const Duration(seconds: 1), (_) {
    return DateTime.now().difference(callState.connectedAt!);
  });
});

/// Qualité de connexion
final callQualityProvider = Provider<ConnectionQuality>((ref) {
  return ref.watch(callStateProvider).connectionQuality;
});

/// Contact en cours d'appel
final callContactProvider = Provider<Contact?>((ref) {
  return ref.watch(callStateProvider).remoteContact;
});

/// L'appel est-il actif ?
final isCallActiveProvider = Provider<bool>((ref) {
  return ref.watch(callStateProvider).isActive;
});

/// L'appel est-il en train de sonner ?
final isCallRingingProvider = Provider<bool>((ref) {
  return ref.watch(callStateProvider).isRinging;
});

// ============ CALL SETTINGS ============

final callSettingsProvider =
    StateNotifierProvider<CallSettingsNotifier, CallSettings>((ref) {
  return CallSettingsNotifier(ref.read(localStorageProvider));
});

class CallSettingsNotifier extends StateNotifier<CallSettings> {
  final LocalStorageService _storage;

  CallSettingsNotifier(this._storage) : super(CallSettings()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    if (!_storage.hasCipher) return;
    final settings = await _storage.getCallSettings();
    if (settings != null) {
      state = settings;
    }
  }

  Future<void> updateSettings(CallSettings settings) async {
    await _storage.saveCallSettings(settings);
    state = settings;
  }

  Future<void> setDefaultMicEnabled(bool enabled) async {
    await updateSettings(state.copyWith(defaultMicEnabled: enabled));
  }

  Future<void> setDefaultCameraEnabled(bool enabled) async {
    await updateSettings(state.copyWith(defaultCameraEnabled: enabled));
  }

  Future<void> setDefaultSpeakerEnabled(bool enabled) async {
    await updateSettings(state.copyWith(defaultSpeakerEnabled: enabled));
  }

  Future<void> setVibrationEnabled(bool enabled) async {
    await updateSettings(state.copyWith(vibrationEnabled: enabled));
  }
}

// ============ CALL MESSAGES ============

/// Messages d'appel pour un contact
final callMessagesProvider =
    FutureProvider.family<List<CallMessage>, String>((ref, contactId) async {
  final localStorage = ref.read(localStorageProvider);
  return localStorage.getCallMessagesForContact(contactId);
});
