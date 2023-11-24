import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class TopicTitleText extends StatelessWidget {
  const TopicTitleText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        textStyle: context.general.textTheme.titleLarge,
      ),
    );
  }
}
