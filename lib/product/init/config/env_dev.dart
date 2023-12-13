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
  @EnviedField(varName: 'MOVIE_URL')
  static final String _movieUrl = _EnvDev._movieUrl;
  @EnviedField(varName: 'SEARCH_URL')
  static final String _searchUrl = _EnvDev._searchUrl;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get imageUrl => _imageUrl;

  @override
  String get apiKey => _apiKey;

  @override
  String get movieUrl => _movieUrl;

  @override
  String get searchUrl => _searchUrl;
}
