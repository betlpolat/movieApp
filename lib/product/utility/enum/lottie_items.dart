enum LottieItems { loading }

extension LottieItemsExtension on LottieItems {
  String get lottiePath => 'assets/lottie/lottie_$name.json';
}
