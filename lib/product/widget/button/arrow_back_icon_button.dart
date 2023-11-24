import 'package:flutter/material.dart';
import 'package:movie_app/product/utility/constants/color_constant.dart';
import 'package:movie_app/product/utility/border_radius/app_border_radius.dart';
import 'package:movie_app/product/utility/constants/padding_constant.dart';
import 'package:movie_app/product/utility/enum/icon_size.dart';

class ArrowBackIconButton extends StatelessWidget {
  const ArrowBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: IconSize.medium.value,
      width: IconSize.medium.value,
      margin: PaddingConstant.paddingTopLeft,
      decoration: BoxDecoration(borderRadius: AppBorderRadius().appborderRadiusLow, color: ColorConstant.grey),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
