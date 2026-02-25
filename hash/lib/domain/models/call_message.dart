import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'call_state.dart';

part 'call_message.g.dart';

/// Message d'appel affiché dans la conversation
/// Suit les mêmes règles d'éphémérité que les autres messages
@HiveType(typeId: 10)
class CallMessage extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String contactId;

  @HiveField(2)
  final bool isOutgoing;

  @HiveField(3)
  final String callTypeString; // 'audio' ou 'video'

  @HiveField(4)
  final String endReasonString; // 'completed', 'missed', 'declined', 'failed'

  @HiveField(5)
  final int? durationSeconds;

  @HiveField(6)
  final DateTime timestamp;

  @HiveField(7)
  final DateTime? expiresAt;

  CallMessage({
    required this.id,
    required this.contactId,
    required this.isOutgoing,
    required this.callTypeString,
    required this.endReasonString,
    this.durationSeconds,
    required this.timestamp,
    this.expiresAt,
  });

  /// Créer depuis les enums
  factory CallMessage.create({
    required String id,
    required String contactId,
    required bool isOutgoing,
    required CallType callType,
    required CallEndReason endReason,
    Duration? duration,
    required DateTime timestamp,
    DateTime? expiresAt,
  }) {
    return CallMessage(
      id: id,
      contactId: contactId,
      isOutgoing: isOutgoing,
      callTypeString: callType == CallType.video ? 'video' : 'audio',
      endReasonString: endReason.name,
      durationSeconds: duration?.inSeconds,
      timestamp: timestamp,
      expiresAt: expiresAt,
    );
  }

  /// Type d'appel
  CallType get callType =>
      callTypeString == 'video' ? CallType.video : CallType.audio;

  /// Raison de fin
  CallEndReason get endReason {
    switch (endReasonString) {
      case 'completed':
        return CallEndReason.completed;
      case 'missed':
        return CallEndReason.missed;
      case 'declined':
        return CallEndReason.declined;
      case 'busy':
        return CallEndReason.busy;
      case 'networkError':
        return CallEndReason.networkError;
      case 'timeout':
        return CallEndReason.timeout;
      default:
        return CallEndReason.failed;
    }
  }

  /// Durée de l'appel
  Duration? get duration =>
      durationSeconds != null ? Duration(seconds: durationSeconds!) : null;

  /// Texte d'affichage
  String get displayText {
    final typeLabel = callType == CallType.video ? 'vidéo' : 'audio';

    switch (endReason) {
      case CallEndReason.completed:
        return isOutgoing ? 'Appel $typeLabel sortant' : 'Appel $typeLabel';
      case CallEndReason.missed:
        return isOutgoing ? 'Pas de réponse' : 'Appel manqué';
      case CallEndReason.declined:
        return isOutgoing ? 'Appel refusé' : 'Appel refusé';
      case CallEndReason.busy:
      case CallEndReason.busyElsewhere:
        return 'Occupé';
      case CallEndReason.answeredElsewhere:
        return 'Répondu ailleurs';
      case CallEndReason.declinedElsewhere:
        return isOutgoing ? 'Appel refusé' : 'Refusé ailleurs';
      case CallEndReason.networkError:
      case CallEndReason.timeout:
      case CallEndReason.failed:
      case CallEndReason.p2pFailed:
        return 'Échec de l\'appel';
    }
  }

  /// Durée formatée
  String get formattedDuration {
    if (duration == null) return '';
    final totalSeconds = duration!.inSeconds;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours}h${minutes.toString().padLeft(2, '0')}min';
    } else if (minutes > 0) {
      return '$minutes min';
    } else {
      return '$seconds s';
    }
  }

  /// Icône selon le type d'appel (audio → téléphone, vidéo → caméra)
  IconData get icon {
    return callType == CallType.video ? Icons.videocam : Icons.call;
  }

  /// Couleur de l'icône (rouge si manqué/échoué)
  Color get iconColor {
    if (endReason == CallEndReason.missed ||
        endReason == CallEndReason.declined ||
        endReason == CallEndReason.failed ||
        endReason == CallEndReason.networkError ||
        endReason == CallEndReason.timeout) {
      return const Color(0xFFFF4757); // Error color
    }
    return const Color(0xFF00D26A); // Success color
  }

  /// L'appel a-t-il été répondu ?
  bool get wasAnswered => endReason == CallEndReason.completed;

  /// Est-ce un appel manqué ?
  bool get isMissed =>
      endReason == CallEndReason.missed ||
      (endReason == CallEndReason.timeout && !isOutgoing);

  /// Vérifier si le message a expiré
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  /// Convertir en JSON pour backup
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'contactId': contactId,
      'isOutgoing': isOutgoing,
      'callType': callTypeString,
      'endReason': endReasonString,
      'durationSeconds': durationSeconds,
      'timestamp': timestamp.toIso8601String(),
      'expiresAt': expiresAt?.toIso8601String(),
    };
  }

  /// Créer depuis JSON
  factory CallMessage.fromJson(Map<String, dynamic> json) {
    return CallMessage(
      id: json['id'] as String,
      contactId: json['contactId'] as String,
      isOutgoing: json['isOutgoing'] as bool,
      callTypeString: json['callType'] as String,
      endReasonString: json['endReason'] as String,
      durationSeconds: json['durationSeconds'] as int?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'] as String)
          : null,
    );
  }
}
