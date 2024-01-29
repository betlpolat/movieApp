import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class CustomFieldText extends StatelessWidget {
  const CustomFieldText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
