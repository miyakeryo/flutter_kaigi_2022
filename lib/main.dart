import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        final prefs = snapshot.data;
        if (prefs == null) return const SizedBox();
        return ChangeNotifierProvider(
          create: (_) => MyThemeSettings(prefs),
          child: Consumer<MyThemeSettings>(
            builder: (context, myThemeSettings, _) {
              Future.microtask(() {
                MyThemeData.updateSystemUIOverlayStyle(myThemeSettings.isDark);
              });
              return MaterialApp(
                title: 'Flutter Demo',
                theme: MyThemeData.light,
                darkTheme: MyThemeData.dark,
                themeMode: myThemeSettings.themeMode,
                home: const MyHomePage(title: 'Flutter Demo Home Page'),
              );
            },
          ),
        );
      },
    );
  }
}
