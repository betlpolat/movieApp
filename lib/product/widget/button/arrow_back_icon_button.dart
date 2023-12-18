import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../../utility/enum/widget_size.dart';

class ArrowBackIconButton extends StatelessWidget {
  const ArrowBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: WidgetSize.icon.value,
      width: WidgetSize.icon.value,
      margin: context.paddingHighTopLeft,
      decoration: BoxDecoration(
        borderRadius: context.borderRadiusLow,
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
