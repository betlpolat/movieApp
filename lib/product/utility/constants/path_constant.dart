import 'package:flutter/material.dart';

import '../../init/config/app_environment.dart';

@immutable
class PathConstant {
  const PathConstant._();
  static String basePath = AppEnvironment.baseUrl;
  static String moviePath = AppEnvironment.movieUrl;
  static String searchPath = AppEnvironment.searchUrl;
  static String apiKey = AppEnvironment.apiKey;
  static String imagePath = AppEnvironment.imageUrl;
}
