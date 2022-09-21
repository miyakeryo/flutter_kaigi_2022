import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'ore_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final myThemeSettings = context.read<MyThemeSettings>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('外観モード設定'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          ...ThemeMode.values.map((themeMode) {
            return _ThemeModeListTile(
              currentThemeMode: myThemeSettings.themeMode,
              themeMode: themeMode,
              onChanged: (themeMode) {
                setState(() {
                  myThemeSettings.themeMode = themeMode;
                });
              },
            );
          }),
          const SizedBox(height: 40),
          OreTheme(
            data: OreTheme.of(context).copyWith(
              settingsTileColor: Colors.green,
            ),
            child: const _TextListTile(title: '色を変えたい'),
          ),
        ],
      ),
    );
  }
}

class _ThemeModeListTile extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onChanged;

  const _ThemeModeListTile({
    required this.currentThemeMode,
    required this.themeMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final oreTheme = OreTheme.of(context);
    return RadioListTile(
      title: Text(themeMode.text),
      tileColor: oreTheme.settingsTileColor,
      value: themeMode,
      groupValue: currentThemeMode,
      onChanged: (_) => onChanged(themeMode),
    );
  }
}

class _TextListTile extends StatelessWidget {
  final String title;
  const _TextListTile({required this.title});

  @override
  Widget build(BuildContext context) {
    final oreTheme = OreTheme.of(context);
    return ListTile(
      title: Text(title),
      tileColor: oreTheme.settingsTileColor,
    );
  }
}

extension on ThemeMode {
  String get text {
    switch (this) {
      case ThemeMode.system:
        return '端末の設定に合わせる';
      case ThemeMode.light:
        return 'ライトモード';
      case ThemeMode.dark:
        return 'ダークモード';
    }
  }
}
