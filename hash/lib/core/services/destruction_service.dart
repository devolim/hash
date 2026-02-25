import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'edge_function_service.dart';
import 'local_storage_service.dart';
import 'secure_storage_service.dart';

/// Service pour gérer le mode fantôme (destruction)
///
/// Le mode fantôme permet de:
/// - Supprimer toutes les données locales (messages, contacts, sessions)
/// - Garder la même identité (hash_id, clés)
/// - Afficher une application vide mais fonctionnelle
/// - Bloquer le chargement des données serveur
/// - Supprimer les données serveur dès que possible (via Edge Function sécurisée)
class DestructionService {
  final SecureStorageService _secureStorage;
  final LocalStorageService _localStorage;
  final EdgeFunctionService _edgeFunctions;

  DestructionService({
    required SecureStorageService secureStorage,
    required LocalStorageService localStorage,
    required SupabaseClient supabaseClient,
  })  : _secureStorage = secureStorage,
        _localStorage = localStorage,
        _edgeFunctions = EdgeFunctionService(supabaseClient);

  /// Vérifier si l'app est en mode fantôme
  Future<bool> isGhostMode() async {
    return await _secureStorage.isGhostMode();
  }

  /// Vérifier si une suppression serveur est en attente
  Future<bool> hasPendingServerCleanup() async {
    return await _secureStorage.hasPendingServerCleanup();
  }

  /// Vérifier la connectivité internet
  Future<bool> _hasInternet() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      }
      // Double check with actual connection
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Activer le mode fantôme
  /// Cette méthode est appelée quand le code de destruction est entré
  Future<void> activateGhostMode() async {
    // 1. Activer le mode fantôme
    await _secureStorage.setGhostMode(true);

    // 2. Marquer la suppression serveur comme en attente
    await _secureStorage.setPendingServerCleanup(true);

    // 3. Supprimer toutes les données locales
    await _deleteLocalData();

    // 4. Essayer de supprimer les données serveur si internet disponible
    if (await _hasInternet()) {
      await _deleteServerData();
    }
  }

  /// Supprimer les données locales (en gardant seulement les flags ghost mode)
  Future<void> _deleteLocalData() async {
    // Supprimer: contacts, messages, sessions
    // via LocalStorageService
    await _localStorage.deleteAllData();

    // Supprimer les clés sensibles du SecureStorage
    // On garde seulement: ghost_mode, pending_server_cleanup, user_id (pour la suppression serveur)
    await _secureStorage.delete('identity_private_key');
    await _secureStorage.delete('identity_public_key');
    await _secureStorage.delete('sealed_sender_private_key');
    await _secureStorage.delete('sealed_sender_public_key');
    await _secureStorage.delete('pin_hash');
    await _secureStorage.delete('duress_pin_hash');
    await _secureStorage.delete('recovery_phrase');
    await _secureStorage.delete('recovery_phrase_hash');
    await _secureStorage.delete('master_key_encrypted');
    await _secureStorage.delete('master_key_salt');
    await _secureStorage.delete('hash_id');
    await _secureStorage.delete('device_id');
  }

  /// Supprimer les données serveur via Edge Function sécurisée
  Future<bool> _deleteServerData() async {
    try {
      final response = await _edgeFunctions.cleanupUserData();

      if (response['success'] == true) {
        // Marquer la suppression comme terminée
        await _secureStorage.setPendingServerCleanup(false);
        return true;
      }

      return false;
    } catch (e) {
      // Échec - la suppression reste en attente
      return false;
    }
  }

  /// Vérifier et exécuter la suppression serveur si en attente
  /// Appelée à chaque démarrage de l'app (écran PIN)
  Future<void> checkAndExecutePendingCleanup() async {
    final isGhost = await isGhostMode();
    final hasPending = await hasPendingServerCleanup();

    if (isGhost && hasPending) {
      if (await _hasInternet()) {
        await _deleteServerData();
      }
    }
  }

  /// Désactiver le mode fantôme (reset complet)
  /// Note: Normalement jamais utilisé car le mode fantôme est permanent
  Future<void> deactivateGhostMode() async {
    await _secureStorage.setGhostMode(false);
    await _secureStorage.setPendingServerCleanup(false);
  }
}
