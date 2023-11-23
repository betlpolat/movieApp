// ignore: constant_identifier_names
enum LottieItems { loading, theme_change }

extension LottieItemsExtension on LottieItems {
  String get lottiePath => 'assets/lottie/lottie_$name.json';
}
