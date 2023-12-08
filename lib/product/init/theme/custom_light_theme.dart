import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/product/init/theme/custom_color_scheme.dart';
import 'package:movie_app/product/init/theme/custom_theme.dart';

final class CustomLightTheme implements CustomTheme {
  @override
  final ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.lightColorScheme,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
}
