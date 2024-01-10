import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
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
      style: context.textTheme.titleLarge,
    );
  }
}
