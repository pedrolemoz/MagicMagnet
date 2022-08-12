import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFF4B00),
    onPrimary: Colors.white,
    secondary: Color(0xFFFF9B0D),
    onSecondary: Colors.white,
    tertiary: Color(0xFFE86E0C),
    onTertiary: Colors.white,
    error: Color(0xFFBF1B3E),
    onError: Colors.white,
    background: Color(0xFF000000),
    onBackground: Colors.white,
    surface: Color(0xFF141414),
    onSurface: Colors.white,
  ),
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF000000),
  scaffoldBackgroundColor: const Color(0xFF000000),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF000000),
    centerTitle: true,
  ),
  fontFamily: 'SourceSansPro',
  textTheme: const TextTheme(
    headline1: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    headline2: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    headline3: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    headline4: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    headline5: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    headline6: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    subtitle1: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    subtitle2: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    button: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
    caption: TextStyle(color: Color(0xFFFFFEFE), fontWeight: FontWeight.w600),
  ),
);
