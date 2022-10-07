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

// extension ThemeDataOreExtension on ThemeData {
//   OreThemeData get oreTheme =>
//       brightness == Brightness.dark ? OreThemeData.dark : OreThemeData.light;
// }

class OreThemeData {
  final Color settingsTileColor;
  final Color settingsBackgroundColor;
  final Color listTitleColor;
  final Color listDescriptionColor;
  final Color listCreatedAtColor;

  const OreThemeData({
    required this.settingsTileColor,
    required this.settingsBackgroundColor,
    required this.listTitleColor,
    required this.listDescriptionColor,
    required this.listCreatedAtColor,
  });
  static const light = OreThemeData(
    settingsTileColor: Colors.white,
    settingsBackgroundColor: Color(0xFFEFEFEF),
    listTitleColor: Colors.black,
    listDescriptionColor: Colors.black,
    listCreatedAtColor: Color(0xFF6E6E6E),
  );
  static const dark = OreThemeData(
    settingsTileColor: Colors.black,
    settingsBackgroundColor: Color(0xFF202020),
    listTitleColor: Colors.white,
    listDescriptionColor: Colors.white,
    listCreatedAtColor: Color(0xFFC6C6C6),
  );

  OreThemeData copyWith({
    Color? settingsTileColor,
    Color? settingsBackgroundColor,
    Color? listTitleColor,
    Color? listDescriptionColor,
    Color? listCreatedAtColor,
  }) {
    return OreThemeData(
      settingsTileColor: settingsTileColor ?? this.settingsTileColor,
      settingsBackgroundColor:
          settingsBackgroundColor ?? this.settingsBackgroundColor,
      listTitleColor: listTitleColor ?? this.listTitleColor,
      listDescriptionColor: listDescriptionColor ?? this.listDescriptionColor,
      listCreatedAtColor: listCreatedAtColor ?? this.listCreatedAtColor,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OreThemeData &&
          runtimeType == other.runtimeType &&
          settingsTileColor == other.settingsTileColor &&
          settingsBackgroundColor == other.settingsBackgroundColor &&
          listTitleColor == other.listTitleColor &&
          listDescriptionColor == other.listDescriptionColor &&
          listCreatedAtColor == other.listCreatedAtColor;

  @override
  int get hashCode =>
      settingsTileColor.hashCode ^
      settingsBackgroundColor.hashCode ^
      listTitleColor.hashCode ^
      listDescriptionColor.hashCode ^
      listCreatedAtColor.hashCode;
}
