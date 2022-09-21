import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'theme.dart';

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
          create: (_) => MyTheme(prefs),
          child: Consumer<MyTheme>(
            builder: (context, myTheme, _) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: MyThemeData.light,
                darkTheme: MyThemeData.dark,
                themeMode: myTheme.themeMode,
                home: const MyHomePage(title: 'Flutter Demo Home Page'),
              );
            },
          ),
        );
      },
    );
  }
}
