import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final myTheme = context.read<MyTheme>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('外観モード設定'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          ...ThemeMode.values.map((themeMode) {
            return RadioListTile(
              title: Text(themeMode.text),
              value: themeMode,
              groupValue: myTheme.themeMode,
              onChanged: (_) {
                setState(() {
                  myTheme.themeMode = themeMode;
                });
              },
            );
          }),
        ],
      ),
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
