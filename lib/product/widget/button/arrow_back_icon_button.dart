import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class ArrowBackIconButton extends StatelessWidget {
  const ArrowBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingNormalTopLeft,
      decoration: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        color: context.colors.secondary,
      ),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: context.colors.onSecondary,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
