import 'app_configuration.dart';

final class AppEnvironment {
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  static late final AppConfiguration _config;
}

enum AppEnvironmentItems {
  baseUrl,
  imageUrl,
  apiKey,
  movieUrl,
  searchUrl;

  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.apiKey;
        case AppEnvironmentItems.imageUrl:
          return AppEnvironment._config.imageUrl;
        case AppEnvironmentItems.movieUrl:
          return AppEnvironment._config.movieUrl;
        case AppEnvironmentItems.searchUrl:
          return AppEnvironment._config.searchUrl;
      }
    } catch (e) {
      throw Exception('AppEnvironment is not initialized.');
    }
  }
}
