import 'package:flutter/material.dart';

extension ThemeDataOreExtension on ThemeData {
  OreThemeData get oreTheme => extension<OreThemeData>()!;
}

class OreThemeData extends ThemeExtension<OreThemeData> {
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

  @override
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
  ThemeExtension<OreThemeData> lerp(
      ThemeExtension<OreThemeData>? other, double t) {
    if (other is! OreThemeData) return this;
    return OreThemeData(
      settingsTileColor:
          Color.lerp(settingsTileColor, other.settingsTileColor, t)!,
      settingsBackgroundColor: Color.lerp(
          settingsBackgroundColor, other.settingsBackgroundColor, t)!,
      listTitleColor: Color.lerp(listTitleColor, other.listTitleColor, t)!,
      listDescriptionColor:
          Color.lerp(listDescriptionColor, other.listDescriptionColor, t)!,
      listCreatedAtColor:
          Color.lerp(listCreatedAtColor, other.listCreatedAtColor, t)!,
    );
  }
}
