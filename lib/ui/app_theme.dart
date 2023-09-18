import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: pageBackground,
    // useMaterial3: true,
  );

  static Color get primaryColor => themeData.colorScheme.primary;
  static Color get pageBackground => const Color(0xFFEFEFEF);
}
