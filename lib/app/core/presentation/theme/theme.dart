import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  fontFamily: 'SourceSansPro',
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF034078),
    onPrimary: Color(0xFFfffcf2),
    secondary: Color(0xFF001f54),
    onSecondary: Color(0xFFfffcf2),
    tertiary: Color(0xFF001f54),
    onTertiary: Color(0xFF0a1128),
    error: Color(0xFFBF1B3E),
    onError: Color(0xFFfffcf2),
    background: Color(0xFF07070a),
    onBackground: Color(0xFFfffcf2),
    surface: Color(0xFF24272b),
    onSurface: Color(0xFFfffcf2),
  ),
  appBarTheme: const AppBarTheme(centerTitle: true),
  backgroundColor: const Color(0xFF07070a),
  scaffoldBackgroundColor: const Color(0xFF1b2021),
  typography: Typography.material2021(),
);
