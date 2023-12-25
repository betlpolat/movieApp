import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../product/utility/enum/lottie_items.dart';

class LottieIcon extends StatelessWidget {
  const LottieIcon({
    super.key,
    required this.item,
    this.controller,
    this.fit,
  });
  final LottieItems item;
  final AnimationController? controller;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      item.lottiePath,
      controller: controller,
      fit: fit,
    );
  }
}
