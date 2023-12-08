import 'package:flutter/material.dart';
import 'package:movie_app/product/utility/border_radius/app_border_radius.dart';
import 'package:movie_app/product/utility/constants/padding_constant.dart';
import 'package:movie_app/product/utility/enum/widget_size.dart';

class ArrowBackIconButton extends StatelessWidget {
  const ArrowBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: WidgetSize.icon.value,
      width: WidgetSize.icon.value,
      margin: PaddingConstant.paddingTopLeft,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius().appBorderRadiusLow,
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
