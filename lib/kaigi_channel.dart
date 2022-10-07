import 'package:flutter/services.dart';

class KaigiChannel {
  static const _kChannel = 'com.miyakeryo.flutter_kaigi_2022/KaigiChannel';
  final _methodChannel = const MethodChannel(_kChannel);

  KaigiChannel._();
  static final KaigiChannel _instance = KaigiChannel._();
  factory KaigiChannel() => _instance;

  Future<double?> getNavigationBarHeight() async {
    try {
      return _methodChannel.invokeMethod('getNavigationBarHeight');
    } on PlatformException catch (_) {
      return null;
    }
  }
}
