import 'package:flutter/material.dart';
import 'package:movie_app/product/constants/app_colors.dart';
import 'package:movie_app/product/constants/border_radius.dart';
import 'package:movie_app/product/constants/padding.dart';

class ArrowBackIconButton extends StatelessWidget {
  const ArrowBackIconButton({
    super.key,
  });
  final double _iconHeight = 70;
  final double _iconWidth = 70;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _iconHeight,
      width: _iconWidth,
      margin: AppPadding().paddingTopLeft,
      decoration: BoxDecoration(borderRadius: AppBorderRadius().appborderRadiusLow, color: AppColors().grey),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
