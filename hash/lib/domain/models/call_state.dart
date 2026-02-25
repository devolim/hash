import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart' as lk;

import 'contact.dart';

/// Status de l'appel
enum CallStatus {
  idle,
  initiating,
  ringing,
  connecting,
  connected,
  reconnecting,
  ended,
}

/// Type d'appel
enum CallType {
  audio,
  video,
}

/// Direction de l'appel
enum CallDirection {
  incoming,
  outgoing,
}

/// Raison de fin d'appel
enum CallEndReason {
  completed,
  declined,
  missed,
  failed,
  busy,
  busyElsewhere,
  answeredElsewhere,
  declinedElsewhere,
  networkError,
  timeout,
  p2pFailed,
}

/// Qualité de connexion
enum ConnectionQuality {
  excellent,
  good,
  poor,
  lost,
}

/// Position de la caméra
enum CameraPosition {
  front,
  back,
}

/// État complet d'un appel
class CallState {
  final String? callId;
  final String? roomId;
  final CallStatus status;
  final CallType callType;
  final CallDirection direction;
  final Contact? remoteContact;
  final DateTime? startedAt;
  final DateTime? connectedAt;
  final DateTime? endedAt;
  final CallEndReason? endReason;

  // États audio/vidéo locaux
  final bool isMicMuted;
  final bool isCameraOff;
  final bool isSpeakerOn;
  final CameraPosition cameraPosition;

  // États du participant distant
  final bool isRemoteMicMuted;
  final bool isRemoteCameraOff;
  final bool isRemoteSpeaking;
  final bool isRemoteInBackground;

  // Qualité de connexion
  final ConnectionQuality connectionQuality;
  final int? latencyMs;
  final double? packetLossPercent;

  // Reconnection countdown (seconds remaining, null if not reconnecting)
  final int? reconnectSecondsRemaining;

  // LiveKit
  final lk.Room? room;
  final lk.LocalParticipant? localParticipant;
  final lk.RemoteParticipant? remoteParticipant;

  const CallState({
    this.callId,
    this.roomId,
    this.status = CallStatus.idle,
    this.callType = CallType.audio,
    this.direction = CallDirection.outgoing,
    this.remoteContact,
    this.startedAt,
    this.connectedAt,
    this.endedAt,
    this.endReason,
    this.isMicMuted = false,
    this.isCameraOff = true,
    this.isSpeakerOn = false,
    this.cameraPosition = CameraPosition.front,
    this.isRemoteMicMuted = false,
    this.isRemoteCameraOff = true,
    this.isRemoteSpeaking = false,
    this.isRemoteInBackground = false,
    this.connectionQuality = ConnectionQuality.good,
    this.latencyMs,
    this.packetLossPercent,
    this.reconnectSecondsRemaining,
    this.room,
    this.localParticipant,
    this.remoteParticipant,
  });

  /// Durée de l'appel
  Duration get duration {
    if (connectedAt == null) return Duration.zero;
    final end = endedAt ?? DateTime.now();
    return end.difference(connectedAt!);
  }

  /// L'appel est-il actif ?
  bool get isActive =>
      status == CallStatus.connecting ||
      status == CallStatus.connected ||
      status == CallStatus.reconnecting;

  /// L'appel est-il en cours de sonnerie ?
  bool get isRinging =>
      status == CallStatus.ringing || status == CallStatus.initiating;

  /// L'appel est-il un appel vidéo ?
  bool get isVideoCall => callType == CallType.video;

  /// Copie avec modifications
  CallState copyWith({
    String? callId,
    String? roomId,
    CallStatus? status,
    CallType? callType,
    CallDirection? direction,
    Contact? remoteContact,
    DateTime? startedAt,
    DateTime? connectedAt,
    DateTime? endedAt,
    CallEndReason? endReason,
    bool? isMicMuted,
    bool? isCameraOff,
    bool? isSpeakerOn,
    CameraPosition? cameraPosition,
    bool? isRemoteMicMuted,
    bool? isRemoteCameraOff,
    bool? isRemoteSpeaking,
    bool? isRemoteInBackground,
    ConnectionQuality? connectionQuality,
    int? latencyMs,
    double? packetLossPercent,
    int? reconnectSecondsRemaining,
    lk.Room? room,
    lk.LocalParticipant? localParticipant,
    lk.RemoteParticipant? remoteParticipant,
  }) {
    return CallState(
      callId: callId ?? this.callId,
      roomId: roomId ?? this.roomId,
      status: status ?? this.status,
      callType: callType ?? this.callType,
      direction: direction ?? this.direction,
      remoteContact: remoteContact ?? this.remoteContact,
      startedAt: startedAt ?? this.startedAt,
      connectedAt: connectedAt ?? this.connectedAt,
      endedAt: endedAt ?? this.endedAt,
      endReason: endReason ?? this.endReason,
      isMicMuted: isMicMuted ?? this.isMicMuted,
      isCameraOff: isCameraOff ?? this.isCameraOff,
      isSpeakerOn: isSpeakerOn ?? this.isSpeakerOn,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      isRemoteMicMuted: isRemoteMicMuted ?? this.isRemoteMicMuted,
      isRemoteCameraOff: isRemoteCameraOff ?? this.isRemoteCameraOff,
      isRemoteSpeaking: isRemoteSpeaking ?? this.isRemoteSpeaking,
      isRemoteInBackground: isRemoteInBackground ?? this.isRemoteInBackground,
      connectionQuality: connectionQuality ?? this.connectionQuality,
      latencyMs: latencyMs ?? this.latencyMs,
      packetLossPercent: packetLossPercent ?? this.packetLossPercent,
      reconnectSecondsRemaining: reconnectSecondsRemaining ?? this.reconnectSecondsRemaining,
      room: room ?? this.room,
      localParticipant: localParticipant ?? this.localParticipant,
      remoteParticipant: remoteParticipant ?? this.remoteParticipant,
    );
  }

  /// Validate whether a state transition is allowed.
  static bool isValidTransition(CallStatus from, CallStatus to) {
    switch (from) {
      case CallStatus.idle:
        return to == CallStatus.initiating || to == CallStatus.ringing;
      case CallStatus.initiating:
        return to == CallStatus.ringing || to == CallStatus.ended;
      case CallStatus.ringing:
        return to == CallStatus.connecting || to == CallStatus.ended;
      case CallStatus.connecting:
        return to == CallStatus.connected || to == CallStatus.ended;
      case CallStatus.connected:
        return to == CallStatus.reconnecting || to == CallStatus.ended;
      case CallStatus.reconnecting:
        return to == CallStatus.connected || to == CallStatus.ended;
      case CallStatus.ended:
        return to == CallStatus.idle;
    }
  }

  /// Reset à l'état initial
  CallState reset() {
    return const CallState();
  }

  /// Obtenir l'icône de qualité de connexion
  IconData get connectionQualityIcon {
    switch (connectionQuality) {
      case ConnectionQuality.excellent:
        return Icons.signal_cellular_4_bar;
      case ConnectionQuality.good:
        return Icons.signal_cellular_alt;
      case ConnectionQuality.poor:
        return Icons.signal_cellular_alt_1_bar;
      case ConnectionQuality.lost:
        return Icons.signal_cellular_off;
    }
  }

  /// Obtenir la couleur de qualité de connexion
  Color connectionQualityColor(BuildContext context) {
    switch (connectionQuality) {
      case ConnectionQuality.excellent:
        return const Color(0xFF00D26A);
      case ConnectionQuality.good:
        return const Color(0xFF00D26A);
      case ConnectionQuality.poor:
        return const Color(0xFFFFAB00);
      case ConnectionQuality.lost:
        return const Color(0xFFFF4757);
    }
  }
}
