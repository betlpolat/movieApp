import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/extension/context_extension.dart';
import 'custom_color_scheme.dart';
import 'custom_theme.dart';

final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: useMaterial3,
        colorScheme: colorScheme,
        fontFamily: fontFamily,
        inputDecorationTheme: inputDecorationTheme,
        appBarTheme: appBarTheme,
      );

  @override
  bool get useMaterial3 => true;
  @override
  ColorScheme get colorScheme => CustomColorScheme.lightColorScheme;

  @override
  String get fontFamily => GoogleFonts.roboto().fontFamily!;

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        fillColor: CustomColorScheme.lightColorScheme.onSurface,
        enabledBorder: OutlineInputBorder(
          borderRadius: const ProjectBorderRadius.allMedium(),
          borderSide: BorderSide(
            color: CustomColorScheme.lightColorScheme.onSurface,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const ProjectBorderRadius.allMedium(),
          borderSide: BorderSide(
            color: CustomColorScheme.lightColorScheme.onSurface,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const ProjectBorderRadius.allMedium(),
          borderSide: BorderSide(
            color: CustomColorScheme.lightColorScheme.onSurface,
            width: 2,
          ),
        ),
      );

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        centerTitle: true,
      );
}
