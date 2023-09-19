import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: pageBackground,
    // useMaterial3: true,
  );

  static Color get primaryColor => themeData.colorScheme.primary;
  static Color get pageBackground => const Color(0xFFEFEFEF);
  static Color get itemTitle => const Color(0xFF333333);

  // POKE COLORS ------------
  static const pkNormalColor = Color(0xFFA8A77A);
  static const pkFireColor = Color(0xFFEE8130);
  static const pkWaterColor = Color(0xFF6390F0);
  static const pkElectricColor = Color(0xFFF7D02C);
  static const pkGrassColor = Color(0xFF7AC74C);
  static const pkIceColor = Color(0xFF96D9D6);
  static const pkFightingColor = Color(0xFFC22E28);
  static const pkPoisonColor = Color(0xFFA33EA1);
  static const pkGroundColor = Color(0xFFE2BF65);
  static const pkFlyingColor = Color(0xFFA98FF3);
  static const pkPsychicColor = Color(0xFFF95587);
  static const pkBugColor = Color(0xFFA6B91A);
  static const pkRockColor = Color(0xFFB6A136);
  static const pkGhostColor = Color(0xFF735797);
  static const pkDragonColor = Color(0xFF6F35FC);
  static const pkDarkColor = Color(0xFF705746);
  static const pkSteelColor = Color(0xFFB7B7CE);
  static const pkFairyColor = Color(0xFFD685AD);

  static const pkUnknownColor = Color(0xFFa0a29f);
  static const pkShadowColor = Color(0xFFa0a29f);
}
