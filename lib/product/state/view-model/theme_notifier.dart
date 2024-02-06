import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../init/cache/cache_keys.dart';
import '../../init/theme/custom_dark_theme.dart';
import '../../init/theme/custom_light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme =
      SharedCacheOperation().readBool(key: CacheKeys.theme.name);

  void changeTheme() {
    isLightTheme = !isLightTheme;
    SharedCacheOperation()
        .writeBool(key: CacheKeys.theme.name, value: isLightTheme);

    notifyListeners();
  }

  ThemeData get currentTheme => !isLightTheme
      ? CustomLightTheme().themeData
      : CustomDarkTheme().themeData;
}
