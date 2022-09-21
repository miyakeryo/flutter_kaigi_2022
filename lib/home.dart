import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final myTheme = context.read<MyTheme>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
