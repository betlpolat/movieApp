import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color_scheme.dart';
import 'custom_theme.dart';

final class CustomDarkTheme implements CustomTheme {
  @override
  final ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.darkColorScheme,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
}
