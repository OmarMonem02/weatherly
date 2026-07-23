import 'package:flutter/material.dart';

abstract class AppFonts {
  AppFonts._();

  static const String roboto = 'Roboto';
}

class _FontStyles {
  const _FontStyles(this.fontFamily);

  final String fontFamily;

  TextStyle get headline1 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        fontWeight: FontWeight.w300,
      );

  TextStyle get headline2 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 60,
        fontWeight: FontWeight.w300,
      );

  TextStyle get headline3 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      );

  TextStyle get headline4 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 34,
        fontWeight: FontWeight.w400,
      );

  TextStyle get headline5 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );

  TextStyle get headline6 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  TextStyle get body1 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get body2 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get button => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get caption => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get overline => TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      );
}

abstract class RobotoFonts {
  RobotoFonts._();

  static const _FontStyles _styles = _FontStyles(AppFonts.roboto);

  static TextStyle get headline1 => _styles.headline1;
  static TextStyle get headline2 => _styles.headline2;
  static TextStyle get headline3 => _styles.headline3;
  static TextStyle get headline4 => _styles.headline4;
  static TextStyle get headline5 => _styles.headline5;
  static TextStyle get headline6 => _styles.headline6;
  static TextStyle get body1 => _styles.body1;
  static TextStyle get body2 => _styles.body2;
  static TextStyle get button => _styles.button;
  static TextStyle get caption => _styles.caption;
  static TextStyle get overline => _styles.overline;
}

