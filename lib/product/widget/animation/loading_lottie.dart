import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assets.lottie.lottieLoading.lottie(
        package: 'gen',
      ),
    );
  }
}
