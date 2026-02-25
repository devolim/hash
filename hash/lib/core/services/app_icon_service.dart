import 'package:flutter/services.dart';

class AppIconService {
  static const _channel = MethodChannel('com.hash.app/app_icon');

  static const List<String> availableIcons = [
    'default',
    'vash',
    'fog',
    'ghost',
    'pyramid',
    'lock',
    'key',
    'sun',
    'at',
    'hbal',
    'hbell',
    'cloud',
    'glass',
    'hmsg',
    'rocket',
  ];

  static Future<void> setAppIcon(String iconId) async {
    await _channel.invokeMethod('setAppIcon', {
      'iconId': iconId == 'default' ? null : iconId,
    });
  }

  static Future<String> getCurrentIcon() async {
    final result = await _channel.invokeMethod<String>('getAppIcon');
    return result ?? 'default';
  }
}
