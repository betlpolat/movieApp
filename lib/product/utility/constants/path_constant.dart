import 'package:flutter/material.dart';

import '../../init/config/app_environment.dart';

@immutable
class PathConstant {
  const PathConstant._();
  static String basePath = AppEnvironmentItems.baseUrl.value;
  static String apiKey = AppEnvironmentItems.apiKey.value;
  static String imagePath = AppEnvironmentItems.imageUrl.value;
}
