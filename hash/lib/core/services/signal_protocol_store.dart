import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';

/// Hive-backed SessionStore for libsignal Double Ratchet sessions.
class HiveSessionStore extends SessionStore {
  Box<String>? _box;
  final HiveAesCipher? _cipher;

  HiveSessionStore(this._cipher);

  Future<Box<String>> _getBox() async {
    _box ??= await _openBoxSafe('signal_sessions');
    return _box!;
  }

  Future<Box<T>> _openBoxSafe<T>(String name) async {
    try {
      return await Hive.openBox<T>(name, encryptionCipher: _cipher);
    } catch (e) {
      debugPrint('[HiveSessionStore] Box "$name" corrupted, recreating: $e');
      await Hive.deleteBoxFromDisk(name);
      return await Hive.openBox<T>(name, encryptionCipher: _cipher);
    }
  }

  String _key(SignalProtocolAddress address) =>
      '${address.getName()}_${address.getDeviceId()}';

  @override
  Future<SessionRecord> loadSession(SignalProtocolAddress address) async {
    final box = await _getBox();
    final data = box.get(_key(address));
    if (data != null) {
      try {
        return SessionRecord.fromSerialized(Uint8List.fromList(base64Decode(data)));
      } catch (e) {
        debugPrint('[HiveSessionStore] Failed to deserialize session: $e');
      }
    }
    return SessionRecord();
  }

  @override
  Future<List<int>> getSubDeviceSessions(String name) async {
    final box = await _getBox();
    final prefix = '${name}_';
    final deviceIds = <int>[];
    for (final key in box.keys) {
      final k = key as String;
      if (k.startsWith(prefix)) {
        final deviceId = int.tryParse(k.substring(prefix.length));
        if (deviceId != null && deviceId != 1) {
          deviceIds.add(deviceId);
        }
      }
    }
    return deviceIds;
  }

  @override
  Future<void> storeSession(
      SignalProtocolAddress address, SessionRecord record) async {
    final box = await _getBox();
    await box.put(_key(address), base64Encode(record.serialize()));
  }

  @override
  Future<bool> containsSession(SignalProtocolAddress address) async {
    final box = await _getBox();
    return box.containsKey(_key(address));
  }

  @override
  Future<void> deleteSession(SignalProtocolAddress address) async {
    final box = await _getBox();
    await box.delete(_key(address));
  }

  @override
  Future<void> deleteAllSessions(String name) async {
    final box = await _getBox();
    final keysToDelete = <String>[];
    for (final key in box.keys) {
      if ((key as String).startsWith('${name}_')) {
        keysToDelete.add(key);
      }
    }
    for (final k in keysToDelete) {
      await box.delete(k);
    }
  }

  Future<void> close() async {
    await _box?.close();
    _box = null;
  }

  Future<void> deleteFromDisk() async {
    final box = await _getBox();
    await box.deleteFromDisk();
    _box = null;
  }
}

/// Hive-backed PreKeyStore for one-time prekeys.
class HivePreKeyStore extends PreKeyStore {
  Box<String>? _box;
  final HiveAesCipher? _cipher;

  HivePreKeyStore(this._cipher);

  Future<Box<String>> _getBox() async {
    _box ??= await _openBoxSafe('signal_prekeys');
    return _box!;
  }

  Future<Box<T>> _openBoxSafe<T>(String name) async {
    try {
      return await Hive.openBox<T>(name, encryptionCipher: _cipher);
    } catch (e) {
      debugPrint('[HivePreKeyStore] Box "$name" corrupted, recreating: $e');
      await Hive.deleteBoxFromDisk(name);
      return await Hive.openBox<T>(name, encryptionCipher: _cipher);
    }
  }

  @override
  Future<PreKeyRecord> loadPreKey(int preKeyId) async {
    final box = await _getBox();
    final data = box.get(preKeyId.toString());
    if (data == null) {
      throw InvalidKeyIdException('No pre key found for id: $preKeyId');
    }
    return PreKeyRecord.fromBuffer(base64Decode(data));
  }

  @override
  Future<void> storePreKey(int preKeyId, PreKeyRecord record) async {
    final box = await _getBox();
    await box.put(preKeyId.toString(), base64Encode(record.serialize()));
  }

  @override
  Future<bool> containsPreKey(int preKeyId) async {
    final box = await _getBox();
    return box.containsKey(preKeyId.toString());
  }

  @override
  Future<void> removePreKey(int preKeyId) async {
    final box = await _getBox();
    await box.delete(preKeyId.toString());
  }

  Future<void> close() async {
    await _box?.close();
    _box = null;
  }

  Future<void> deleteFromDisk() async {
    final box = await _getBox();
    await box.deleteFromDisk();
    _box = null;
  }
}

/// Hive-backed SignedPreKeyStore.
class HiveSignedPreKeyStore extends SignedPreKeyStore {
  Box<String>? _box;
  final HiveAesCipher? _cipher;

  HiveSignedPreKeyStore(this._cipher);

  Future<Box<String>> _getBox() async {
    _box ??= await _openBoxSafe('signal_signed_prekeys');
    return _box!;
  }

  Future<Box<T>> _openBoxSafe<T>(String name) async {
    try {
      return await Hive.openBox<T>(name, encryptionCipher: _cipher);
    } catch (e) {
      debugPrint('[HiveSignedPreKeyStore] Box "$name" corrupted, recreating: $e');
      await Hive.deleteBoxFromDisk(name);
      return await Hive.openBox<T>(name, encryptionCipher: _cipher);
    }
  }

  @override
  Future<SignedPreKeyRecord> loadSignedPreKey(int signedPreKeyId) async {
    final box = await _getBox();
    final data = box.get(signedPreKeyId.toString());
    if (data == null) {
      throw InvalidKeyIdException(
          'No signed pre key found for id: $signedPreKeyId');
    }
    return SignedPreKeyRecord.fromSerialized(
        Uint8List.fromList(base64Decode(data)));
  }

  @override
  Future<List<SignedPreKeyRecord>> loadSignedPreKeys() async {
    final box = await _getBox();
    return box.values.map((data) {
      return SignedPreKeyRecord.fromSerialized(
          Uint8List.fromList(base64Decode(data)));
    }).toList();
  }

  @override
  Future<void> storeSignedPreKey(
      int signedPreKeyId, SignedPreKeyRecord record) async {
    final box = await _getBox();
    await box.put(signedPreKeyId.toString(), base64Encode(record.serialize()));
  }

  @override
  Future<bool> containsSignedPreKey(int signedPreKeyId) async {
    final box = await _getBox();
    return box.containsKey(signedPreKeyId.toString());
  }

  @override
  Future<void> removeSignedPreKey(int signedPreKeyId) async {
    final box = await _getBox();
    await box.delete(signedPreKeyId.toString());
  }

  Future<void> close() async {
    await _box?.close();
    _box = null;
  }

  Future<void> deleteFromDisk() async {
    final box = await _getBox();
    await box.deleteFromDisk();
    _box = null;
  }
}

/// Hive-backed IdentityKeyStore.
/// Uses trust-on-first-use (TOFU) for remote identity keys.
class HiveIdentityKeyStore extends IdentityKeyStore {
  Box<String>? _box;
  final HiveAesCipher? _cipher;

  final IdentityKeyPair _identityKeyPair;
  final int _localRegistrationId;

  HiveIdentityKeyStore(
    this._cipher, {
    required IdentityKeyPair identityKeyPair,
    required int localRegistrationId,
  })  : _identityKeyPair = identityKeyPair,
        _localRegistrationId = localRegistrationId;

  Future<Box<String>> _getBox() async {
    _box ??= await _openBoxSafe('signal_identities');
    return _box!;
  }

  Future<Box<T>> _openBoxSafe<T>(String name) async {
    try {
      return await Hive.openBox<T>(name, encryptionCipher: _cipher);
    } catch (e) {
      debugPrint('[HiveIdentityKeyStore] Box "$name" corrupted, recreating: $e');
      await Hive.deleteBoxFromDisk(name);
      return await Hive.openBox<T>(name, encryptionCipher: _cipher);
    }
  }

  @override
  Future<IdentityKeyPair> getIdentityKeyPair() async {
    return _identityKeyPair;
  }

  @override
  Future<int> getLocalRegistrationId() async {
    return _localRegistrationId;
  }

  @override
  Future<bool> saveIdentity(
      SignalProtocolAddress address, IdentityKey? identityKey) async {
    final box = await _getBox();
    final key = address.getName();
    final existing = box.get(key);
    if (identityKey == null) return false;

    final newData = base64Encode(identityKey.serialize());
    final changed = existing != null && existing != newData;
    await box.put(key, newData);
    return changed;
  }

  @override
  Future<bool> isTrustedIdentity(SignalProtocolAddress address,
      IdentityKey? identityKey, Direction direction) async {
    if (identityKey == null) return false;
    final box = await _getBox();
    final existing = box.get(address.getName());
    if (existing == null) {
      // Trust on first use
      return true;
    }
    // Trust if identity matches what we stored
    return existing == base64Encode(identityKey.serialize());
  }

  @override
  Future<IdentityKey?> getIdentity(SignalProtocolAddress address) async {
    final box = await _getBox();
    final data = box.get(address.getName());
    if (data == null) return null;
    return IdentityKey.fromBytes(base64Decode(data), 0);
  }

  Future<void> close() async {
    await _box?.close();
    _box = null;
  }

  Future<void> deleteFromDisk() async {
    final box = await _getBox();
    await box.deleteFromDisk();
    _box = null;
  }
}
