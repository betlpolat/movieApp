import 'app_configuration.dart';

final class AppEnvironment {
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  static late final AppConfiguration _config;

  static String get baseUrl => _config.baseUrl;
  static String get imageUrl => _config.imageUrl;
  static String get apiKey => _config.apiKey;
  static String get movieUrl => _config.movieUrl;
  static String get searchUrl => _config.searchUrl;
}
