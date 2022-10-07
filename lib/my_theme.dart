import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'kaigi_channel.dart';

abstract class MyThemeData {
  MyThemeData._();

  static final light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: Colors.green,
      background: Colors.white,
    ),
  );

  static final dark = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: Colors.green,
      background: Color(0xFF202020),
    ),
  );

  static void updateSystemUIOverlayStyle({
    required bool isDark,
    required bool use3ButtonsNavigation,
  }) {
    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(
        use3ButtonsNavigation
            ? const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.black,
                systemNavigationBarIconBrightness: Brightness.light,
                systemNavigationBarDividerColor: Colors.transparent,
              )
            : const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.transparent,
                systemNavigationBarIconBrightness: Brightness.light,
                systemNavigationBarDividerColor: Colors.transparent,
              ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        use3ButtonsNavigation
            ? const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarDividerColor: Color(0xFFE0E0E0),
              )
            : const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.transparent,
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarDividerColor: Colors.transparent,
              ),
      );
    }
    if (use3ButtonsNavigation) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
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
    KaigiChannel().getNavigationBarHeight().then((height) {
      debugPrint('🐤 getNavigationBarHeight: $height');
      MyThemeData.updateSystemUIOverlayStyle(
        isDark: isDark,
        use3ButtonsNavigation: (height ?? 44) > 40,
      );
    });
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
