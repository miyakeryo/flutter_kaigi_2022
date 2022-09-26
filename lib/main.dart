import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
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
              return _MyMaterialApp();
            },
          ),
        );
      },
    );
  }
}

class _MyMaterialApp extends StatefulWidget {
  @override
  State<_MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<_MyMaterialApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.microtask(_updateSystemUIOverlayStyle);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myThemeSettings = context.read<MyThemeSettings>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.light,
      darkTheme: MyThemeData.dark,
      themeMode: myThemeSettings.themeMode,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  void _updateSystemUIOverlayStyle() {
    final myThemeSettings = context.read<MyThemeSettings>();
    MyThemeData.updateSystemUIOverlayStyle(myThemeSettings.isDark);
  }

  @override
  void didChangePlatformBrightness() {
    _updateSystemUIOverlayStyle();
    if (mounted) setState(() {});
  }
}
