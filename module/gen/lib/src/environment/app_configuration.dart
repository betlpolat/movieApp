/// The AppConfiguration class is an abstract class in Dart.
abstract class AppConfiguration {
  ///It using from baseUrl for network manager
  String get baseUrl;

  /// It using for network images
  String get imageUrl;

  ///It is personal apiKey for network requests
  String get apiKey;
}
