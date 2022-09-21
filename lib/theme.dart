import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MyThemeData {
  MyThemeData._();

  static final light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
    ),
  );

  static final dark = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
    ),
  );
}

class MyTheme extends ChangeNotifier {
  final SharedPreferences prefs;
  MyTheme(this.prefs) {
    final index = prefs.getInt('ThemeMode') ?? 0;
    _themeMode = ThemeMode.values[index];
  }

  var _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    prefs.setInt('ThemeMode', themeMode.index);
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
}
