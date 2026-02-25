import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

import '../../domain/models/call_state.dart';

/// Configuration LiveKit
class LiveKitConfig {
  static const String wsUrl = String.fromEnvironment('LIVEKIT_WS_URL');
  static const int maxCallDurationSeconds = 8 * 60 * 60; // 8 heures
  static const bool e2eeEnabled = true; // E2EE activé pour les appels sécurisés
}

/// Service pour gérer les connexions LiveKit
class LiveKitService {
  static final LiveKitService _instance = LiveKitService._internal();
  factory LiveKitService() => _instance;
  LiveKitService._internal();

  lk.Room? _room;
  lk.LocalParticipant? _localParticipant;
  lk.RemoteParticipant? _remoteParticipant;
  lk.EventsListener<lk.RoomEvent>? _roomListener;

  /// Track vidéo locale pour le preview caméra (avant connexion LiveKit)
  lk.LocalVideoTrack? _previewTrack;

  // Streams pour les événements
  final _connectionQualityController =
      StreamController<ConnectionQuality>.broadcast();
  final _participantEventController =
      StreamController<lk.ParticipantEvent>.broadcast();
  final _roomEventController = StreamController<lk.RoomEvent>.broadcast();

  Stream<ConnectionQuality> get connectionQualityStream =>
      _connectionQualityController.stream;
  Stream<lk.ParticipantEvent> get participantEventStream =>
      _participantEventController.stream;
  Stream<lk.RoomEvent> get roomEventStream => _roomEventController.stream;

  lk.Room? get room => _room;
  lk.LocalParticipant? get localParticipant => _localParticipant;
  lk.RemoteParticipant? get remoteParticipant => _remoteParticipant;

  bool get isConnected => _room?.connectionState == lk.ConnectionState.connected;

  /// Whether the remote participant is currently speaking
  bool get isRemoteSpeaking => _remoteParticipant?.isSpeaking ?? false;

  /// Audio level of the remote participant (0.0 to 1.0)
  double get remoteAudioLevel => _remoteParticipant?.audioLevel ?? 0.0;

  /// Se connecter à une room LiveKit
  Future<lk.Room> connect({
    required String token,
    required String roomName,
    required bool isVideoCall,
    bool micEnabled = true,
    bool cameraEnabled = true,
    required String e2eeSharedKey, // Shared key derived from identity keys
  }) async {
    debugPrint('[LiveKitService] Connecting to room: $roomName');

    // E2EE configuration
    lk.E2EEOptions? e2eeOptions;
    if (LiveKitConfig.e2eeEnabled) {
      debugPrint('[LiveKitService] E2EE is enabled');

      // Use the pre-derived key from identity key DH exchange
      final keyBytes = sha256.convert(utf8.encode(e2eeSharedKey)).bytes;
      final keyBase64 = base64Encode(keyBytes);

      final keyProvider = await lk.BaseKeyProvider.create();
      await keyProvider.setSharedKey(keyBase64);

      e2eeOptions = lk.E2EEOptions(keyProvider: keyProvider);
      debugPrint('[LiveKitService] E2EE key set from identity-derived key');
    }

    // Options de connexion
    final roomOptions = lk.RoomOptions(
      adaptiveStream: true,
      dynacast: true,
      e2eeOptions: e2eeOptions,
      defaultAudioPublishOptions: const lk.AudioPublishOptions(
        dtx: true,
      ),
      defaultVideoPublishOptions: lk.VideoPublishOptions(
        simulcast: true,
      ),
      defaultCameraCaptureOptions: const lk.CameraCaptureOptions(
        maxFrameRate: 30,
      ),
    );

    final connectOptions = lk.ConnectOptions(
      autoSubscribe: true,
      protocolVersion: lk.ProtocolVersion.v9,
    );

    // Créer et connecter la room
    _room = lk.Room();

    // Écouter les événements de la room
    _setupRoomListeners();

    await _room!.connect(
      LiveKitConfig.wsUrl,
      token,
      roomOptions: roomOptions,
      connectOptions: connectOptions,
    );

    _localParticipant = _room!.localParticipant;

    // Check for participants already in the room
    // ParticipantConnectedEvent only fires for participants joining AFTER us
    if (_room!.remoteParticipants.isNotEmpty) {
      final firstRemote = _room!.remoteParticipants.values.first;
      debugPrint(
          '[LiveKitService] Found existing participant: ${firstRemote.identity}');
      _remoteParticipant = firstRemote;
      // Emit event so CallStateNotifier picks it up
      _roomEventController
          .add(lk.ParticipantConnectedEvent(participant: firstRemote));
    }

    // E2EE is automatically enabled when e2eeOptions is provided
    if (LiveKitConfig.e2eeEnabled && e2eeOptions != null) {
      debugPrint('[LiveKitService] E2EE enabled on room');
    }

    // Activer/désactiver micro et caméra selon le type d'appel
    await _localParticipant!.setMicrophoneEnabled(micEnabled);
    if (isVideoCall) {
      await _localParticipant!.setCameraEnabled(cameraEnabled);
    }

    debugPrint('[LiveKitService] Connected to room: $roomName');
    return _room!;
  }

  /// Configurer les listeners de la room
  void _setupRoomListeners() {
    _roomListener = _room!.createListener();

    _roomListener!
      ..on<lk.RoomDisconnectedEvent>((event) {
        debugPrint('[LiveKitService] Room disconnected: ${event.reason}');
        _roomEventController.add(event);
      })
      ..on<lk.RoomReconnectingEvent>((event) {
        debugPrint('[LiveKitService] Room reconnecting...');
        _roomEventController.add(event);
      })
      ..on<lk.RoomReconnectedEvent>((event) {
        debugPrint('[LiveKitService] Room reconnected');
        _roomEventController.add(event);
      })
      ..on<lk.ParticipantConnectedEvent>((event) {
        debugPrint(
            '[LiveKitService] Participant connected: ${event.participant.identity}');
        _remoteParticipant = event.participant;
        _roomEventController.add(event);
      })
      ..on<lk.ParticipantDisconnectedEvent>((event) {
        debugPrint(
            '[LiveKitService] Participant disconnected: ${event.participant.identity}');
        if (_remoteParticipant?.sid == event.participant.sid) {
          _remoteParticipant = null;
        }
        _roomEventController.add(event);
      })
      ..on<lk.TrackPublishedEvent>((event) {
        debugPrint(
            '[LiveKitService] Track published: ${event.publication.kind}');
        _roomEventController.add(event);
      })
      ..on<lk.TrackUnpublishedEvent>((event) {
        debugPrint(
            '[LiveKitService] Track unpublished: ${event.publication.kind}');
        _roomEventController.add(event);
      })
      ..on<lk.TrackSubscribedEvent>((event) {
        debugPrint('[LiveKitService] Track subscribed: ${event.track.kind}');
        _roomEventController.add(event);
      })
      ..on<lk.TrackUnsubscribedEvent>((event) {
        debugPrint('[LiveKitService] Track unsubscribed: ${event.track.kind}');
        _roomEventController.add(event);
      })
      ..on<lk.TrackMutedEvent>((event) {
        debugPrint('[LiveKitService] Track muted');
        _roomEventController.add(event);
      })
      ..on<lk.TrackUnmutedEvent>((event) {
        debugPrint('[LiveKitService] Track unmuted');
        _roomEventController.add(event);
      })
      ..on<lk.LocalTrackPublishedEvent>((event) {
        debugPrint(
            '[LiveKitService] Local track published: ${event.publication.kind}');
        _roomEventController.add(event);
      })
      ..on<lk.LocalTrackUnpublishedEvent>((event) {
        debugPrint(
            '[LiveKitService] Local track unpublished: ${event.publication.kind}');
        _roomEventController.add(event);
      })
      ..on<lk.ActiveSpeakersChangedEvent>((event) {
        _roomEventController.add(event);
      })
      ..on<lk.DataReceivedEvent>((event) {
        debugPrint('[LiveKitService] Data received: ${event.data.length} bytes');
        _roomEventController.add(event);
      });
  }

  /// Mapper la qualité de connexion LiveKit vers notre enum
  ConnectionQuality _mapConnectionQuality(lk.ConnectionQuality quality) {
    switch (quality) {
      case lk.ConnectionQuality.excellent:
        return ConnectionQuality.excellent;
      case lk.ConnectionQuality.good:
        return ConnectionQuality.good;
      case lk.ConnectionQuality.poor:
        return ConnectionQuality.poor;
      case lk.ConnectionQuality.lost:
        return ConnectionQuality.lost;
      default:
        return ConnectionQuality.good;
    }
  }

  /// Écouter les changements de qualité de connexion
  void listenToConnectionQuality() {
    lk.ConnectionQuality? quality;
    if (_localParticipant != null) {
      quality = _localParticipant!.connectionQuality;
    } else if (_remoteParticipant != null) {
      quality = _remoteParticipant!.connectionQuality;
    }
    if (quality != null) {
      _connectionQualityController.add(_mapConnectionQuality(quality));
    }
  }

  /// Activer/désactiver le microphone
  Future<void> setMicrophoneEnabled(bool enabled) async {
    if (_localParticipant == null) return;
    await _localParticipant!.setMicrophoneEnabled(enabled);
    debugPrint('[LiveKitService] Microphone enabled: $enabled');
  }

  /// Activer/désactiver la caméra
  Future<void> setCameraEnabled(bool enabled) async {
    if (_localParticipant == null) return;
    await _localParticipant!.setCameraEnabled(enabled);
    debugPrint('[LiveKitService] Camera enabled: $enabled');
  }

  /// Position actuelle de la caméra
  lk.CameraPosition _currentCameraPosition = lk.CameraPosition.front;

  /// Changer de caméra (front/back)
  Future<bool> switchCamera() async {
    if (_localParticipant == null) return false;

    final videoTrack = _localParticipant!.videoTrackPublications.firstOrNull;
    if (videoTrack?.track == null) return false;

    final track = videoTrack!.track as lk.LocalVideoTrack;

    try {
      // Switcher la position
      final newPosition = _currentCameraPosition == lk.CameraPosition.front
          ? lk.CameraPosition.back
          : lk.CameraPosition.front;

      await track.setCameraPosition(newPosition);
      _currentCameraPosition = newPosition;
      debugPrint('[LiveKitService] Camera switched to: ${newPosition.name}');
      return true;
    } catch (e) {
      debugPrint('[LiveKitService] Failed to switch camera: $e');
      return false;
    }
  }

  /// Obtenir la position actuelle de la caméra
  lk.CameraPosition get currentCameraPosition => _currentCameraPosition;

  /// Activer/désactiver le haut-parleur
  Future<void> setSpeakerEnabled(bool enabled) async {
    try {
      await lk.Hardware.instance.setSpeakerphoneOn(enabled);
      debugPrint('[LiveKitService] Speaker enabled: $enabled');
    } catch (e) {
      debugPrint('[LiveKitService] Failed to set speaker: $e');
    }
  }

  /// Démarrer un preview caméra locale (avant connexion LiveKit)
  Future<void> startLocalCameraPreview() async {
    if (_previewTrack != null) return;
    try {
      _previewTrack = await lk.LocalVideoTrack.createCameraTrack(
        const lk.CameraCaptureOptions(
          maxFrameRate: 30,
        ),
      );
      debugPrint('[LiveKitService] Camera preview started');
    } catch (e) {
      debugPrint('[LiveKitService] Failed to start camera preview: $e');
    }
  }

  /// Arrêter le preview caméra locale
  Future<void> stopLocalCameraPreview() async {
    if (_previewTrack == null) return;
    try {
      await _previewTrack!.stop();
    } catch (e) {
      debugPrint('[LiveKitService] Failed to stop camera preview: $e');
    }
    _previewTrack = null;
    debugPrint('[LiveKitService] Camera preview stopped');
  }

  /// Obtenir le VideoTrack local (room track ou preview fallback)
  lk.VideoTrack? getLocalVideoTrack() {
    final pub = _localParticipant?.videoTrackPublications.firstOrNull;
    final roomTrack = pub?.track as lk.VideoTrack?;
    return roomTrack ?? _previewTrack;
  }

  /// Obtenir le VideoTrack distant
  lk.VideoTrack? getRemoteVideoTrack() {
    final pub = _remoteParticipant?.videoTrackPublications.firstOrNull;
    return pub?.track as lk.VideoTrack?;
  }

  /// Obtenir l'AudioTrack distant
  lk.AudioTrack? getRemoteAudioTrack() {
    final pub = _remoteParticipant?.audioTrackPublications.firstOrNull;
    return pub?.track as lk.AudioTrack?;
  }

  /// Vérifier si le participant distant a la vidéo activée
  bool isRemoteVideoEnabled() {
    final pub = _remoteParticipant?.videoTrackPublications.firstOrNull;
    return pub?.subscribed == true && pub?.muted == false && pub?.track != null;
  }

  /// Vérifier si le participant distant a l'audio activé
  bool isRemoteAudioEnabled() {
    final pub = _remoteParticipant?.audioTrackPublications.firstOrNull;
    return pub?.subscribed == true && pub?.muted == false;
  }

  /// Envoyer des données via le canal data LiveKit (reliable)
  Future<void> publishData(Uint8List data) async {
    if (_localParticipant == null) return;
    try {
      await _localParticipant!.publishData(data, reliable: true);
    } catch (e) {
      debugPrint('[LiveKitService] Failed to publish data: $e');
    }
  }

  /// Se déconnecter de la room
  Future<void> disconnect() async {
    debugPrint('[LiveKitService] Disconnecting from room');

    _roomListener?.dispose();
    _roomListener = null;

    // Arrêter le preview caméra si actif
    await stopLocalCameraPreview();

    await _room?.disconnect();
    _room = null;
    _localParticipant = null;
    _remoteParticipant = null;

    debugPrint('[LiveKitService] Disconnected');
  }

  /// Libérer les ressources
  void dispose() {
    disconnect();
    _connectionQualityController.close();
    _participantEventController.close();
    _roomEventController.close();
  }
}
