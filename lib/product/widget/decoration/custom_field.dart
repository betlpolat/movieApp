// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.onSurface),
        borderRadius: context.lowBorderRadius,
      ),
      child: child,
    );
  }
}
