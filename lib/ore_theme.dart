import 'package:flutter/material.dart';

class _InheritedOreTheme extends InheritedTheme {
  const _InheritedOreTheme({
    required this.theme,
    required super.child,
  });

  final OreTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return OreTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedOreTheme old) =>
      theme.data != old.theme.data;
}

class OreTheme extends StatelessWidget {
  final OreThemeData data;
  final Widget child;

  const OreTheme({super.key, required this.data, required this.child});

  @override
  Widget build(BuildContext context) {
    return _InheritedOreTheme(theme: this, child: child);
  }

  static OreThemeData of(BuildContext context) {
    final inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedOreTheme>();
    return inheritedTheme?.theme.data ?? _fallback(context);
  }

  static OreThemeData _fallback(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? OreThemeData.dark : OreThemeData.light;
  }
}

class OreThemeData {
  final Color settingsTileColor;

  const OreThemeData({required this.settingsTileColor});
  static const light = OreThemeData(
    settingsTileColor: Colors.white,
  );
  static const dark = OreThemeData(
    settingsTileColor: Colors.black,
  );

  OreThemeData copyWith({
    Color? settingsTileColor,
  }) {
    return OreThemeData(
      settingsTileColor: settingsTileColor ?? this.settingsTileColor,
    );
  }
}
