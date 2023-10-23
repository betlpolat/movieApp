import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicTitleText extends StatelessWidget {
  const TopicTitleText({
    super.key,
    required this.text,
  });

  final String text;
  final double _textSize = 20;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        fontSize: _textSize,
      ),
    );
  }
}
