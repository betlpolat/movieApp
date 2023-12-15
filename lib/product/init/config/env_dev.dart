import 'package:envied/envied.dart';

import 'app_configuration.dart';

part 'env_dev.g.dart';

@Envied(
  obfuscate: true,
  path: 'asset/env/.dev.env',
)
final class EnvDev implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _EnvDev._baseUrl;
  @EnviedField(varName: 'IMAGE_URL')
  static final String _imageUrl = _EnvDev._imageUrl;
  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _EnvDev._apiKey;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get imageUrl => _imageUrl;

  @override
  String get apiKey => _apiKey;
}
