import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class SizedBoxNormal extends StatelessWidget {
  const SizedBoxNormal({super.key});

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: context.dynamicHeight(0.05));
}
