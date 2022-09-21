import 'package:flutter/material.dart';

class MyTheme {
  static final light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
    ),
  );

  static final dark = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
    ),
  );
}
