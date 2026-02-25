import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRemoteConfig {
  final String minVersionAndroid;
  final String minVersionIos;
  final int messageExpiryHours;
  final int maxFileSizeMb;

  const AppRemoteConfig({
    this.minVersionAndroid = '1.0.0',
    this.minVersionIos = '1.0.0',
    this.messageExpiryHours = 24,
    this.maxFileSizeMb = 10,
  });

  factory AppRemoteConfig.fromJson(Map<String, dynamic> json) {
    return AppRemoteConfig(
      minVersionAndroid: json['min_version_android'] as String? ?? '1.0.0',
      minVersionIos: json['min_version_ios'] as String? ?? '1.0.0',
      messageExpiryHours: json['message_expiry_hours'] as int? ?? 24,
      maxFileSizeMb: json['max_file_size_mb'] as int? ?? 10,
    );
  }

  Map<String, dynamic> toJson() => {
        'min_version_android': minVersionAndroid,
        'min_version_ios': minVersionIos,
        'message_expiry_hours': messageExpiryHours,
        'max_file_size_mb': maxFileSizeMb,
      };
}

class AppMaintenance {
  final String id;
  final DateTime startAt;
  final DateTime endAt;
  final String message;

  const AppMaintenance({
    required this.id,
    required this.startAt,
    required this.endAt,
    required this.message,
  });

  factory AppMaintenance.fromJson(Map<String, dynamic> json) {
    return AppMaintenance(
      id: json['id'] as String,
      startAt: DateTime.parse(json['start_at'] as String),
      endAt: DateTime.parse(json['end_at'] as String),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'start_at': startAt.toIso8601String(),
        'end_at': endAt.toIso8601String(),
        'message': message,
      };

  bool get isActive {
    final now = DateTime.now().toUtc();
    return now.isAfter(startAt) && now.isBefore(endAt);
  }

  bool get isUpcoming {
    final now = DateTime.now().toUtc();
    return now.isBefore(startAt);
  }
}

class AppAlert {
  final String id;
  final String message;
  final String? actionLabel;
  final String? actionUrl;

  const AppAlert({
    required this.id,
    required this.message,
    this.actionLabel,
    this.actionUrl,
  });

  factory AppAlert.fromJson(Map<String, dynamic> json) {
    return AppAlert(
      id: json['id'] as String,
      message: json['message'] as String,
      actionLabel: json['action_label'] as String?,
      actionUrl: json['action_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'action_label': actionLabel,
        'action_url': actionUrl,
      };
}

/// Résultat de la vérification au démarrage
enum StartupCheckType {
  none,
  forceUpdate,
  maintenance,
  alert,
  promptRating,
  promptDonation,
}

class StartupCheckResult {
  final StartupCheckType type;
  final AppMaintenance? maintenance;
  final AppAlert? alert;

  const StartupCheckResult({
    this.type = StartupCheckType.none,
    this.maintenance,
    this.alert,
  });
}

class RemoteConfigService {
  final SupabaseClient _client;

  static const String _configCacheKey = 'remote_config_cache';
  static const String _maintenancesCacheKey = 'remote_maintenances_cache';
  static const String _alertsCacheKey = 'remote_alerts_cache';
  static const String _seenAlertIdsKey = 'remote_seen_alert_ids';
  static const String _lastPromptDateKey = 'remote_last_prompt_date';
  static const String _lastPromptTypeKey = 'remote_last_prompt_type';

  AppRemoteConfig _config = const AppRemoteConfig();
  List<AppMaintenance> _maintenances = [];
  List<AppAlert> _alerts = [];

  AppRemoteConfig get config => _config;
  List<AppMaintenance> get maintenances => _maintenances;
  List<AppAlert> get alerts => _alerts;

  RemoteConfigService(this._client);

  /// Fetch depuis Supabase et met en cache localement.
  /// Si le fetch échoue, charge depuis le cache.
  Future<void> fetch() async {
    try {
      final results = await Future.wait([
        _client.from('app_config').select().single(),
        _client.from('app_maintenances').select().order('start_at'),
        _client.from('app_alerts').select(),
      ]);

      _config = AppRemoteConfig.fromJson(results[0] as Map<String, dynamic>);
      _maintenances = (results[1] as List)
          .map((e) => AppMaintenance.fromJson(e as Map<String, dynamic>))
          .toList();
      _alerts = (results[2] as List)
          .map((e) => AppAlert.fromJson(e as Map<String, dynamic>))
          .toList();

      await _saveToCache();
    } catch (e) {
      debugPrint('[RemoteConfigService] Fetch failed, loading from cache: $e');
      await _loadFromCache();
    }
  }

  /// Détermine ce qu'il faut afficher au démarrage (ordre de priorité)
  Future<StartupCheckResult> getStartupCheck({bool hasContacts = true}) async {
    // 1. Version minimum
    if (await _isUpdateRequired()) {
      return const StartupCheckResult(type: StartupCheckType.forceUpdate);
    }

    // 2. Maintenance en cours
    final activeMaintenance = _maintenances.where((m) => m.isActive).firstOrNull;
    if (activeMaintenance != null) {
      return StartupCheckResult(
        type: StartupCheckType.maintenance,
        maintenance: activeMaintenance,
      );
    }

    // 3. Alerte non vue
    final unseenAlert = await _getUnseenAlert();
    if (unseenAlert != null) {
      return StartupCheckResult(
        type: StartupCheckType.alert,
        alert: unseenAlert,
      );
    }

    // 4. Prompt notation/don (aléatoire, 1 fois par jour max, seulement si l'utilisateur a des contacts)
    if (hasContacts) {
      final promptType = await _getPromptType();
      if (promptType != null) {
        return StartupCheckResult(type: promptType);
      }
    }

    return const StartupCheckResult();
  }

  /// Maintenances à venir (pour la page Settings > Support > Maintenance)
  List<AppMaintenance> get upcomingMaintenances =>
      _maintenances.where((m) => m.isUpcoming || m.isActive).toList();

  /// Marque une alerte comme vue
  Future<void> markAlertSeen(String alertId) async {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getStringList(_seenAlertIdsKey) ?? [];
    if (!seen.contains(alertId)) {
      seen.add(alertId);
      await prefs.setStringList(_seenAlertIdsKey, seen);
    }
  }

  /// Enregistre qu'un prompt a été affiché
  Future<void> recordPromptShown(StartupCheckType type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _lastPromptDateKey, DateTime.now().toIso8601String());
    await prefs.setString(
        _lastPromptTypeKey, type == StartupCheckType.promptRating ? 'rating' : 'donation');
  }

  // ============ PRIVATE ============

  Future<bool> _isUpdateRequired() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      final minVersion =
          Platform.isIOS ? _config.minVersionIos : _config.minVersionAndroid;
      return _compareVersions(currentVersion, minVersion) < 0;
    } catch (e) {
      return false;
    }
  }

  /// Compare deux versions semver. Retourne < 0 si a < b
  int _compareVersions(String a, String b) {
    final partsA = a.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final partsB = b.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    for (int i = 0; i < 3; i++) {
      final va = i < partsA.length ? partsA[i] : 0;
      final vb = i < partsB.length ? partsB[i] : 0;
      if (va != vb) return va.compareTo(vb);
    }
    return 0;
  }

  Future<AppAlert?> _getUnseenAlert() async {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getStringList(_seenAlertIdsKey) ?? [];
    for (final alert in _alerts) {
      if (!seen.contains(alert.id)) return alert;
    }
    return null;
  }

  Future<StartupCheckType?> _getPromptType() async {
    final prefs = await SharedPreferences.getInstance();
    final lastDateStr = prefs.getString(_lastPromptDateKey);

    if (lastDateStr != null) {
      final lastDate = DateTime.tryParse(lastDateStr);
      if (lastDate != null) {
        final daysSince = DateTime.now().difference(lastDate).inDays;
        if (daysSince < 1) return null; // Max 1 fois par jour
      }
    }

    // 1 chance sur 3 d'afficher
    if (Random().nextInt(3) != 0) return null;

    // Alterner entre rating et donation
    final lastType = prefs.getString(_lastPromptTypeKey);
    if (lastType == 'rating') {
      return StartupCheckType.promptDonation;
    }
    return StartupCheckType.promptRating;
  }

  Future<void> _saveToCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_configCacheKey, jsonEncode(_config.toJson()));
    await prefs.setString(_maintenancesCacheKey,
        jsonEncode(_maintenances.map((m) => m.toJson()).toList()));
    await prefs.setString(_alertsCacheKey,
        jsonEncode(_alerts.map((a) => a.toJson()).toList()));
  }

  Future<void> _loadFromCache() async {
    final prefs = await SharedPreferences.getInstance();

    final configJson = prefs.getString(_configCacheKey);
    if (configJson != null) {
      try {
        _config = AppRemoteConfig.fromJson(
            jsonDecode(configJson) as Map<String, dynamic>);
      } catch (_) {}
    }

    final maintenancesJson = prefs.getString(_maintenancesCacheKey);
    if (maintenancesJson != null) {
      try {
        _maintenances = (jsonDecode(maintenancesJson) as List)
            .map((e) => AppMaintenance.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (_) {}
    }

    final alertsJson = prefs.getString(_alertsCacheKey);
    if (alertsJson != null) {
      try {
        _alerts = (jsonDecode(alertsJson) as List)
            .map((e) => AppAlert.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (_) {}
    }
  }
}
