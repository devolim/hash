import 'package:hive_ce_flutter/hive_flutter.dart';

part 'call_settings.g.dart';

/// Préférences pour les appels
@HiveType(typeId: 11)
class CallSettings extends HiveObject {
  /// Micro activé par défaut au début d'un appel
  @HiveField(0)
  final bool defaultMicEnabled;

  /// Caméra activée par défaut au début d'un appel vidéo
  @HiveField(1)
  final bool defaultCameraEnabled;

  /// Haut-parleur activé par défaut
  @HiveField(2)
  final bool defaultSpeakerEnabled;

  /// Durée de sonnerie avant timeout (en secondes)
  @HiveField(3)
  final int ringDurationSeconds;

  /// Vibration activée pour les appels entrants
  @HiveField(4)
  final bool vibrationEnabled;

  /// Capteur de proximité activé (éteindre écran près de l'oreille)
  @HiveField(5)
  final bool proximitySensorEnabled;

  /// Réduction de bruit activée
  @HiveField(6)
  final bool noiseSuppressionEnabled;

  /// Annulation d'écho activée
  @HiveField(7)
  final bool echoCancellationEnabled;

  CallSettings({
    this.defaultMicEnabled = true,
    this.defaultCameraEnabled = true,
    this.defaultSpeakerEnabled = false,
    this.ringDurationSeconds = 30,
    this.vibrationEnabled = true,
    this.proximitySensorEnabled = true,
    this.noiseSuppressionEnabled = true,
    this.echoCancellationEnabled = true,
  });

  /// Copie avec modifications
  CallSettings copyWith({
    bool? defaultMicEnabled,
    bool? defaultCameraEnabled,
    bool? defaultSpeakerEnabled,
    int? ringDurationSeconds,
    bool? vibrationEnabled,
    bool? proximitySensorEnabled,
    bool? noiseSuppressionEnabled,
    bool? echoCancellationEnabled,
  }) {
    return CallSettings(
      defaultMicEnabled: defaultMicEnabled ?? this.defaultMicEnabled,
      defaultCameraEnabled: defaultCameraEnabled ?? this.defaultCameraEnabled,
      defaultSpeakerEnabled:
          defaultSpeakerEnabled ?? this.defaultSpeakerEnabled,
      ringDurationSeconds: ringDurationSeconds ?? this.ringDurationSeconds,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
      proximitySensorEnabled:
          proximitySensorEnabled ?? this.proximitySensorEnabled,
      noiseSuppressionEnabled:
          noiseSuppressionEnabled ?? this.noiseSuppressionEnabled,
      echoCancellationEnabled:
          echoCancellationEnabled ?? this.echoCancellationEnabled,
    );
  }

  /// Convertir en JSON
  Map<String, dynamic> toJson() {
    return {
      'defaultMicEnabled': defaultMicEnabled,
      'defaultCameraEnabled': defaultCameraEnabled,
      'defaultSpeakerEnabled': defaultSpeakerEnabled,
      'ringDurationSeconds': ringDurationSeconds,
      'vibrationEnabled': vibrationEnabled,
      'proximitySensorEnabled': proximitySensorEnabled,
      'noiseSuppressionEnabled': noiseSuppressionEnabled,
      'echoCancellationEnabled': echoCancellationEnabled,
    };
  }

  /// Créer depuis JSON
  factory CallSettings.fromJson(Map<String, dynamic> json) {
    return CallSettings(
      defaultMicEnabled: json['defaultMicEnabled'] as bool? ?? true,
      defaultCameraEnabled: json['defaultCameraEnabled'] as bool? ?? true,
      defaultSpeakerEnabled: json['defaultSpeakerEnabled'] as bool? ?? false,
      ringDurationSeconds: json['ringDurationSeconds'] as int? ?? 30,
      vibrationEnabled: json['vibrationEnabled'] as bool? ?? true,
      proximitySensorEnabled: json['proximitySensorEnabled'] as bool? ?? true,
      noiseSuppressionEnabled: json['noiseSuppressionEnabled'] as bool? ?? true,
      echoCancellationEnabled: json['echoCancellationEnabled'] as bool? ?? true,
    );
  }
}
