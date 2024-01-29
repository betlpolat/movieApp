import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

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
