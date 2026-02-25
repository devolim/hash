import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/models/contact.dart';
import '../../domain/models/contact_request.dart';
import '../../core/services/notification_service.dart';
import '../../core/services/signal_protocol_service.dart';
import '../../core/utils/avatar_utils.dart';
import 'app_providers.dart';
import 'contact_request_providers.dart';

/// Provider that automatically syncs accepted contact requests to local contacts.
///
/// When someone accepts your contact request, this provider:
/// 1. Detects the new accepted request
/// 2. Creates a local Contact from it
/// 3. Adds it to the contacts list
/// 4. Marks the request as processed
///
/// This ensures the conversation list updates in realtime.
final contactSyncProvider = Provider<ContactSyncService>((ref) {
  final service = ContactSyncService(ref);

  // Listen to accepted requests changes
  ref.listen<ContactRequestsState>(
    contactRequestsProvider,
    (previous, next) {
      // Check if there are new accepted requests to process
      if (next.acceptedRequests.isNotEmpty) {
        service.processAcceptedRequests(next.acceptedRequests);
      }
    },
    fireImmediately: true,
  );

  return service;
});

class ContactSyncService {
  final Ref _ref;
  final Set<String> _processedRequestIds = {};

  ContactSyncService(this._ref);

  /// Process accepted requests and create local contacts from them
  Future<void> processAcceptedRequests(List<ContactRequest> acceptedRequests) async {
    for (final request in acceptedRequests) {
      // Skip if already processed (or being processed)
      // Use both request ID and displayHashId as some requests have empty IDs
      final requestKey = '${request.id}_${request.displayHashId}';
      if (_processedRequestIds.contains(requestKey)) {
        continue;
      }

      // Mark as processing IMMEDIATELY to prevent race conditions
      _processedRequestIds.add(requestKey);

      try {
        await _createContactFromAcceptedRequest(request);

        // Mark as processed in the provider
        _ref.read(contactRequestsProvider.notifier).markAcceptedAsProcessed(request.id);

        // Acknowledge the contact exchange to delete the request from the server
        // This removes the metadata trace (who added who)
        if (request.id.isNotEmpty) {
          try {
            await _ref.read(edgeFunctionServiceProvider).call(
              'acknowledge-contact-exchange',
              body: {'request_id': request.id},
            );
          } catch (_) {
            // Best-effort: if acknowledge fails, the row stays but will be retried
          }
        }

        debugPrint('[ContactSync] Contact créé depuis demande acceptée');
      } catch (e) {
        // Remove from processed on error so it can be retried
        _processedRequestIds.remove(requestKey);
        debugPrint('[ContactSync] Erreur traitement demande: $e');
      }
    }
  }

  /// Create a local contact from an accepted request
  Future<void> _createContactFromAcceptedRequest(ContactRequest request) async {
    // CRITICAL: We MUST have a valid userId to create a contact
    if (request.userId == null || request.userId!.isEmpty) {
      debugPrint('[ContactSync] Impossible de créer un contact sans userId');
      return;
    }

    // Check if contact already exists
    final existingContacts = _ref.read(contactsProvider);
    final alreadyExists = existingContacts.any(
      (c) => c.hashId == request.displayHashId || c.odid == request.userId,
    );

    if (alreadyExists) {
      debugPrint('[ContactSync] Contact déjà existant');
      return;
    }

    // Retrieve pending contact metadata (name, photo, notes) saved when sending the request
    final localStorage = _ref.read(localStorageProvider);
    final metadata = await localStorage.getPendingContactMetadata(request.displayHashId);

    // Save photo to file if present in pending metadata
    String? avatarPath;
    if (metadata?.photoBytes != null) {
      try {
        final directory = await getApplicationDocumentsDirectory();
        final avatarDir = Directory('${directory.path}/avatars');
        if (!await avatarDir.exists()) {
          await avatarDir.create(recursive: true);
        }
        final fileName = 'contact_${request.displayHashId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final file = File('${avatarDir.path}/$fileName');
        await file.writeAsBytes(metadata!.photoBytes!);
        avatarPath = AvatarUtils.toRelative(file.path);
      } catch (e) {
        debugPrint('[ContactSync] Erreur sauvegarde avatar: $e');
      }
    }

    // Create the contact with all crypto keys, Zero-Knowledge tokens, and send token
    // Use pending metadata for displayName, notes, and avatarPath if available
    final contact = Contact(
      odid: request.userId!,
      hashId: request.displayHashId,
      displayName: metadata?.name?.isNotEmpty == true
          ? metadata!.name!
          : request.displayHashId,
      addedAt: DateTime.now(),
      notes: metadata?.notes,
      avatarPath: avatarPath,
      // Signal Protocol keys
      identityPublicKey: request.identityPublicKey,
      // Zero-Knowledge tokens (for sealed sender messaging)
      mailboxToken: request.mailboxToken,
      relayToken: request.relayToken,
      sealedSenderPublicKey: request.sealedSenderPublicKey,
      // Send token (authorization to send messages to this contact's mailbox)
      sendToken: request.sendToken,
    );

    // Add to local contacts
    await _ref.read(contactsProvider.notifier).addContact(contact);

    // Initialize Double Ratchet session with the contact's PreKeyBundle
    await _initializeDoubleRatchetSession(request, contact.odid);

    // Clean up pending metadata now that contact is created
    if (metadata != null) {
      await localStorage.deletePendingContactMetadata(request.displayHashId);
    }

    // Sync contact name with Notification Service Extension (iOS)
    // This allows NSE to display contact names in push notifications
    final notificationService = NotificationService();
    await notificationService.syncContactNames({
      contact.hashId: contact.displayName,
    });

    debugPrint('[ContactSync] Contact ajouté');
  }

  /// Initialize a Double Ratchet session with a newly accepted contact.
  Future<void> _initializeDoubleRatchetSession(
    ContactRequest request,
    String contactId,
  ) async {
    final signalService = _ref.read(signalProtocolServiceProvider);
    if (!signalService.isInitialized) {
      debugPrint('[ContactSync] SignalProtocol not initialized, skipping DR session init');
      return;
    }

    // Need identity key + signed prekey to build a PreKeyBundle
    if (request.identityPublicKey == null ||
        request.signedPrekeyPublic == null ||
        request.signedPrekeySignature == null ||
        request.signedPrekeyId == null) {
      debugPrint('[ContactSync] Missing prekey data, skipping DR session init');
      return;
    }

    try {
      final bundle = SignalProtocolService.buildPreKeyBundle(
        registrationId: 0, // Remote registration ID not known; 0 is acceptable
        identityPublicKeyB64: request.identityPublicKey!,
        signedPreKeyId: request.signedPrekeyId!,
        signedPreKeyPublicB64: request.signedPrekeyPublic!,
        signedPreKeySignatureB64: request.signedPrekeySignature!,
        preKeyId: request.prekeyId,
        preKeyPublicB64: request.prekeyPublic,
      );

      await signalService.initializeSessionFromBundle(contactId, bundle);
      debugPrint('[ContactSync] DR session initialized for $contactId');
    } catch (e) {
      debugPrint('[ContactSync] Failed to initialize DR session: $e');
    }
  }

  /// Process a contact acceptance received via sealed message (enriched payload).
  /// This avoids a server round-trip by building the ContactRequest from the
  /// data included directly in the sealed message.
  Future<void> processAcceptedFromSealedMessage({
    required Map<String, dynamic> acceptorData,
    required String sendTokenForRequester,
    required String requestId,
  }) async {
    final requestKey = '${requestId}_${acceptorData['hash_id']}';
    if (_processedRequestIds.contains(requestKey)) {
      debugPrint('[ContactSync] Already processed sealed acceptance: $requestId');
      return;
    }
    _processedRequestIds.add(requestKey);

    try {
      final request = ContactRequest(
        id: requestId,
        requesterHashId: '',
        recipientHashId: acceptorData['hash_id'] as String? ?? '',
        status: 'accepted',
        createdAt: DateTime.now(),
        expiresAt: DateTime.now(),
        userId: acceptorData['user_id'] as String?,
        identityPublicKey: acceptorData['identity_public_key'] as String?,
        signedPrekeyPublic: acceptorData['signed_prekey_public'] as String?,
        signedPrekeySignature: acceptorData['signed_prekey_signature'] as String?,
        signedPrekeyId: acceptorData['signed_prekey_id'] as int?,
        prekeyId: acceptorData['prekey_id'] as int?,
        prekeyPublic: acceptorData['prekey_public'] as String?,
        mailboxToken: acceptorData['mailbox_token'] as String?,
        relayToken: acceptorData['relay_token'] as String?,
        sealedSenderPublicKey: acceptorData['sealed_sender_public_key'] as String?,
        sendToken: sendTokenForRequester,
      );

      await _createContactFromAcceptedRequest(request);

      // Acknowledge the contact exchange to delete the row from the server
      try {
        await _ref.read(edgeFunctionServiceProvider).call(
          'acknowledge-contact-exchange',
          body: {'request_id': requestId},
        );
      } catch (_) {
        // Best-effort: if acknowledge fails, the row stays but will be retried
      }

      debugPrint('[ContactSync] Contact créé depuis sealed message acceptance');
    } catch (e) {
      _processedRequestIds.remove(requestKey);
      debugPrint('[ContactSync] Erreur traitement sealed acceptance: $e');
    }
  }

  /// Force sync - useful when returning to the app
  Future<void> forceSync() async {
    final state = _ref.read(contactRequestsProvider);
    if (state.acceptedRequests.isNotEmpty) {
      await processAcceptedRequests(state.acceptedRequests);
    }
    
    // Sync all existing contacts with NSE
    await _syncAllContactsWithNSE();
  }

  /// Sync all existing contacts with Notification Service Extension
  Future<void> _syncAllContactsWithNSE() async {
    final contacts = _ref.read(contactsProvider);
    final contactNames = <String, String>{};
    
    for (final contact in contacts) {
      if (contact.hashId.isNotEmpty) {
        contactNames[contact.hashId] = contact.displayName;
      }
    }
    
    if (contactNames.isNotEmpty) {
      final notificationService = NotificationService();
      await notificationService.syncContactNames(contactNames);
      debugPrint('[ContactSync] Synced ${contactNames.length} contacts with NSE');
    }
  }
}

/// Provider to start the contact sync service
/// Should be watched in the HomeScreen to ensure it's active
final contactSyncInitProvider = Provider<void>((ref) {
  // Just watching this provider will initialize contactSyncProvider
  ref.watch(contactSyncProvider);
  return;
});
