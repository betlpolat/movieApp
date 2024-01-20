import 'package:flutter/material.dart';

abstract class CustomTheme {
  bool get useMaterial3;
  ThemeData get themeData;
  ColorScheme get colorScheme;
  String get fontFamily;
  InputDecorationTheme get inputDecorationTheme;
  AppBarTheme get appBarTheme;
}
