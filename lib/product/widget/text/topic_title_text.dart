import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/extension/string_extension.dart';

class TopicTitleText extends StatelessWidget {
  const TopicTitleText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.locale,
      style: GoogleFonts.aBeeZee(
        textStyle: context.general.textTheme.titleLarge,
      ),
    );
  }
}
