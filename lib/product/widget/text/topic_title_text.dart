import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extension/string_extension.dart';

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
      style: context.general.textTheme.titleLarge,
    );
  }
}
