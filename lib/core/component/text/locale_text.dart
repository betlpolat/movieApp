import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text.locale);
  }
}