import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MyThemeData {
  MyThemeData._();

  static final light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      background: Color(0xFFEFEFEF),
    ),
  );

  static final dark = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      background: Color(0xFF202020),
    ),
  );

  static const _systemUiOverlayStyleLight = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
  static const _systemUiOverlayStyleDark = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  );
  static void updateSystemUIOverlayStyle(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
        isDark ? _systemUiOverlayStyleDark : _systemUiOverlayStyleLight);
  }
}

class MyThemeSettings extends ChangeNotifier {
  final SharedPreferences prefs;
  MyThemeSettings(this.prefs) {
    final index = prefs.getInt('ThemeMode') ?? 0;
    _themeMode = ThemeMode.values[index];
  }

  var _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    prefs.setInt('ThemeMode', themeMode.index);
    MyThemeData.updateSystemUIOverlayStyle(isDark);
    notifyListeners();
  }

  Brightness get brightness {
    switch (themeMode) {
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.system:
        return WidgetsBinding.instance.window.platformBrightness;
    }
  }

  bool get isDark => brightness == Brightness.dark;
}
