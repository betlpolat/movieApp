import 'package:gen/gen.dart';

final class AppEnvironment {
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  static late final AppConfiguration _config;
}

enum AppEnvironmentItems {
  baseUrl,
  imageUrl,
  apiKey;

  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.apiKey;
        case AppEnvironmentItems.imageUrl:
          return AppEnvironment._config.imageUrl;
      }
    } on Exception catch (_) {
      throw Exception('AppEnvironment is not initialized.');
    }
  }
}
