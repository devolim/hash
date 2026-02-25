import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hash/config/supabase_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

/// HTTP client with certificate validation.
///
/// The badCertificateCallback is only invoked when the platform's default
/// TLS validation fails (e.g. expired cert, wrong hostname, untrusted CA).
/// In debug mode we accept bad certs for development; in release we reject.
///
/// For production SPKI certificate pinning, use a native plugin such as
/// ssl_pinning_plugin or flutter_certificate_pinning, as dart:io's
/// X509Certificate does not expose the SubjectPublicKeyInfo needed for
/// proper SPKI hash comparison.
class PinnedHttpClient {
  static PinnedHttpClient? _instance;

  late final http.Client _client;
  bool _pinningEnabled;

  /// Pinned hostnames (used for logging / future native pinning)
  static final List<String> _pinnedHosts = [
    Uri.parse(SupabaseConfig.url).host,
    if (const String.fromEnvironment('CALL_HOST').isNotEmpty)
      const String.fromEnvironment('CALL_HOST'),
  ];

  /// SHA256 SPKI fingerprints for certificate pinning.
  /// Obtain via: echo | openssl s_client -connect hash.devolim.fr:443 2>/dev/null | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | base64
  static const List<String> _pinnedFingerprints = [
    // Primary certificate fingerprint (to be updated with real value)
    'PLACEHOLDER_PRIMARY_FINGERPRINT',
    // Backup certificate fingerprint (to be updated with real value)
    'PLACEHOLDER_BACKUP_FINGERPRINT',
  ];

  PinnedHttpClient._internal({required bool pinningEnabled})
      : _pinningEnabled = pinningEnabled {
    _client = _createClient();
  }

  /// Get or create the singleton instance.
  /// [pinningEnabled] controls whether certificate validation is strict.
  /// Can be toggled via RemoteConfigService kill switch.
  factory PinnedHttpClient({bool pinningEnabled = true}) {
    _instance ??= PinnedHttpClient._internal(pinningEnabled: pinningEnabled);
    return _instance!;
  }

  /// Update pinning enabled state (kill switch via remote config).
  void setPinningEnabled(bool enabled) {
    if (_pinningEnabled == enabled) return;
    _pinningEnabled = enabled;
    debugPrint('[PinnedHttpClient] Certificate pinning ${enabled ? "enabled" : "disabled"}');
  }

  bool get isPinningEnabled => _pinningEnabled;

  /// Get the underlying HTTP client.
  http.Client get client => _pinningEnabled ? _client : http.Client();

  http.Client _createClient() {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback = _validateCertificate;
    return IOClient(httpClient);
  }

  /// Certificate validation callback.
  ///
  /// This callback is only called when the platform's default TLS validation
  /// has already FAILED (untrusted CA, expired cert, hostname mismatch, etc.).
  /// Returning true here means accepting a certificate that the OS rejected.
  ///
  /// - In debug mode: accept bad certs to allow local development with
  ///   self-signed certificates.
  /// - In release mode: always reject (return false). The normal TLS
  ///   validation already handles valid certificates.
  /// - If kill switch is active: accept for our pinned hosts only.
  bool _validateCertificate(X509Certificate cert, String host, int port) {
    // In debug mode, allow all certificates for development
    if (kDebugMode) {
      debugPrint('[PinnedHttpClient] Debug mode: accepting certificate for $host');
      return true;
    }

    // Kill switch: if pinning is disabled, accept certs for our known hosts
    if (!_pinningEnabled && _pinnedHosts.any((h) => host.endsWith(h))) {
      return true;
    }

    // Release mode: reject bad certificates
    debugPrint('[PinnedHttpClient] Rejecting bad certificate for $host');
    return false;
  }

  /// Vérifie le SPKI pin du certificat. Appelé au startup.
  /// Retourne true si la vérification passe ou si désactivée.
  static Future<bool> verifyCertificatePin() async {
    if (kDebugMode || !(_instance?._pinningEnabled ?? true)) return true;
    // Ne pas vérifier avec des placeholders
    if (_pinnedFingerprints.any((f) => f.startsWith('PLACEHOLDER'))) {
      debugPrint('[PinnedHttpClient] SPKI fingerprints not configured, skipping verification');
      return true;
    }
    try {
      final result = await HttpCertificatePinning.check(
        serverURL: SupabaseConfig.url,
        headerHttp: {},
        sha: SHA.SHA256,
        allowedSHAFingerprints: _pinnedFingerprints,
        timeout: 10,
      );
      // HttpCertificatePinning.check returns "CONNECTION_SECURE" on success
      if (result.contains('SECURE')) {
        debugPrint('[PinnedHttpClient] SPKI verification passed');
        return true;
      }
      debugPrint('[PinnedHttpClient] SPKI verification FAILED: $result');
      return false;
    } catch (e) {
      debugPrint('[PinnedHttpClient] SPKI verification error: $e');
      return false;
    }
  }

  /// Reset singleton (for testing).
  @visibleForTesting
  static void reset() {
    _instance = null;
  }
}
