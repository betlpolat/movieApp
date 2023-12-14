import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utility/enum/lottie_items.dart';

class ThemeChangeLottie extends StatelessWidget {
  const ThemeChangeLottie({
    super.key,
    required this.controller,
  });
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      LottieItems.theme_change.lottiePath,
      fit: BoxFit.cover,
      repeat: false,
      controller: controller,
    );
  }
}
