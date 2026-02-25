import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:uuid/uuid.dart';

/// Service for handling calls with native CallKit (iOS) / ConnectionService (Android)
class CallService {
  static final CallService _instance = CallService._internal();
  factory CallService() => _instance;
  CallService._internal();

  final _uuid = const Uuid();
  String? _currentCallId;
  bool _isInitialized = false;

  /// Direct MethodChannel to inject includesCallsInRecents (not exposed by IOSParams)
  static const _channel = MethodChannel('flutter_callkit_incoming');

  /// Callbacks for CallKit events — must be set by the call state manager
  Function()? onCallAccepted;
  Function()? onCallDeclined;
  Function()? onCallEnded;
  Function()? onCallTimeout;

  /// Initialize the call service
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Listen for call events
    FlutterCallkitIncoming.onEvent.listen((CallEvent? event) {
      if (event == null) return;

      switch (event.event) {
        case Event.actionCallAccept:
          debugPrint('[CallService] Call accepted via CallKit: ${event.body}');
          onCallAccepted?.call();
          break;
        case Event.actionCallDecline:
          debugPrint('[CallService] Call declined via CallKit: ${event.body}');
          _currentCallId = null;
          onCallDeclined?.call();
          break;
        case Event.actionCallEnded:
          debugPrint('[CallService] Call ended via CallKit: ${event.body}');
          _currentCallId = null;
          onCallEnded?.call();
          break;
        case Event.actionCallTimeout:
          debugPrint('[CallService] Call timeout via CallKit: ${event.body}');
          _currentCallId = null;
          onCallTimeout?.call();
          break;
        default:
          break;
      }
    });

    _isInitialized = true;
  }

  /// Inject includesCallsInRecents into the serialized CallKit params.
  /// The native iOS plugin reads ios["includesCallsInRecents"] but the
  /// Dart IOSParams class doesn't expose it.
  Map<String, dynamic> _injectRecentsFlag(CallKitParams params, bool showInRecents) {
    final json = params.toJson();
    if (Platform.isIOS) {
      final ios = (json['ios'] as Map<String, dynamic>?) ?? <String, dynamic>{};
      ios['includesCallsInRecents'] = showInRecents;
      json['ios'] = ios;
    }
    return json;
  }

  /// Start an outgoing call.
  /// [showInRecents] controls whether the call appears in iPhone's recent calls.
  Future<void> startOutgoingCall({
    required String contactName,
    required String contactId,
    bool isVideo = false,
    bool showInRecents = false,
  }) async {
    _currentCallId = _uuid.v4();

    final params = CallKitParams(
      id: _currentCallId,
      nameCaller: contactName,
      appName: 'Hash',
      handle: contactId,
      type: isVideo ? 1 : 0, // 0 = audio, 1 = video
      duration: 0,
      textAccept: 'Accepter',
      textDecline: 'Refuser',
      extra: <String, dynamic>{
        'contactId': contactId,
      },
      headers: <String, dynamic>{
        'platform': Platform.operatingSystem,
      },
      android: const AndroidParams(
        isCustomNotification: false,
        isShowLogo: false,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#0A0A0A',
        actionColor: '#FFAB00',
        incomingCallNotificationChannelName: 'Appels Hash',
      ),
      ios: const IOSParams(
        iconName: 'CallKitLogo',
        handleType: 'generic',
        supportsVideo: true,
        maximumCallGroups: 1,
        maximumCallsPerCallGroup: 1,
        audioSessionMode: 'default',
        audioSessionActive: true,
        audioSessionPreferredSampleRate: 44100.0,
        audioSessionPreferredIOBufferDuration: 0.005,
        supportsDTMF: false,
        supportsHolding: false,
        supportsGrouping: false,
        supportsUngrouping: false,
        ringtonePath: 'system_ringtone_default',
      ),
    );

    await _channel.invokeMethod('startCall', _injectRecentsFlag(params, showInRecents));
  }

  /// Show incoming call UI.
  /// If [callKitId] is provided, reuse that ID to UPDATE an existing CallKit
  /// notification (e.g. replacing "Hash" with the real contact name) instead
  /// of creating a new one, which avoids triggering a decline event.
  /// [showInRecents] controls whether the call appears in iPhone's recent calls.
  Future<void> showIncomingCall({
    required String contactName,
    required String contactId,
    bool isVideo = false,
    String? callKitId,
    bool showInRecents = false,
  }) async {
    _currentCallId = callKitId ?? _uuid.v4();

    final params = CallKitParams(
      id: _currentCallId,
      nameCaller: contactName,
      appName: 'Hash',
      handle: contactId,
      type: isVideo ? 1 : 0,
      duration: 30000, // Ring for 30 seconds
      textAccept: 'Accepter',
      textDecline: 'Refuser',
      extra: <String, dynamic>{
        'contactId': contactId,
      },
      android: const AndroidParams(
        isCustomNotification: false,
        isShowLogo: false,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#0A0A0A',
        actionColor: '#FFAB00',
        incomingCallNotificationChannelName: 'Appels Hash',
      ),
      ios: const IOSParams(
        iconName: 'CallKitLogo',
        handleType: 'generic',
        supportsVideo: true,
        maximumCallGroups: 1,
        maximumCallsPerCallGroup: 1,
      ),
    );

    await _channel.invokeMethod('showCallkitIncoming', _injectRecentsFlag(params, showInRecents));
  }

  /// Mark the current call as connected (shows ongoing call indicator)
  /// On iOS: shows the green call bar in status bar
  /// On Android: updates the ConnectionService call state
  Future<void> setCallConnected() async {
    if (_currentCallId != null) {
      await FlutterCallkitIncoming.setCallConnected(_currentCallId!);
      debugPrint('[CallService] Call marked as connected: $_currentCallId');
    }
  }

  /// End the current call
  Future<void> endCall() async {
    if (_currentCallId != null) {
      await FlutterCallkitIncoming.endCall(_currentCallId!);
      _currentCallId = null;
    }
  }

  /// End a specific CallKit notification by ID.
  /// Used to dismiss the FCM-created CallKit after the call is connected,
  /// preventing the 30s duration timeout from firing a "missed call" notification.
  Future<void> endCallById(String callId) async {
    await FlutterCallkitIncoming.endCall(callId);
  }

  /// End all calls
  Future<void> endAllCalls() async {
    await FlutterCallkitIncoming.endAllCalls();
    _currentCallId = null;
  }

  /// Check if there's an active call
  Future<bool> hasActiveCall() async {
    final calls = await FlutterCallkitIncoming.activeCalls();
    return calls?.isNotEmpty ?? false;
  }

  /// Get the current call ID
  String? get currentCallId => _currentCallId;
}
