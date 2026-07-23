import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static const List<Color> rainGradient = [Color(0xFF3A6073), Color(0xFF16222A)];
  static const List<Color> cloudGradient = [Color(0xFF757F9A), Color(0xFFD7DDE8)];
  static const List<Color> stormGradient = [Color(0xFF232526), Color(0xFF414345)];
  static const List<Color> snowGradient = [Color(0xFF83A4D4), Color(0xFFB6FBFF)];
  static const List<Color> clearGradient = [Color(0xFFFF9A56), Color(0xFFFF6B95)];
  static const List<Color> defaultGradient = [Color(0xFF7E57C2), Color(0xFF512DA8)];

  static const Color cardBg = Color.fromARGB(255, 51, 83, 131);
  static const Color searchFieldBg = Color.fromARGB(255, 38, 57, 85);

  static const Color accentPurple = Color.fromARGB(255, 255, 255, 255);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textMuted = Colors.white54;
  static const Color textHint = Colors.white38;

  static const Color error = Colors.redAccent;
  static const Color borderLight = Colors.white12;

  static LinearGradient getWeatherGradient(String condition) {
    final c = condition.toLowerCase();
    List<Color> colors = defaultGradient;

    if (c.contains('rain') || c.contains('drizzle')) {
      colors = rainGradient;
    } else if (c.contains('cloud') || c.contains('overcast')) {
      colors = cloudGradient;
    } else if (c.contains('storm') || c.contains('thunder')) {
      colors = stormGradient;
    } else if (c.contains('snow')) {
      colors = snowGradient;
    } else if (c.contains('clear') || c.contains('sun')) {
      colors = clearGradient;
    }

    return LinearGradient(
      colors: colors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}