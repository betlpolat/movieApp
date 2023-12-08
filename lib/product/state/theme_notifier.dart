import 'package:flutter/material.dart';
import 'package:movie_app/product/init/cache/cache_keys.dart';
import 'package:movie_app/product/init/theme/custom_dark_theme.dart';
import 'package:movie_app/product/init/theme/custom_light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = CacheKeys.theme.readBool;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    CacheKeys.theme.writeBool(isLightTheme);
    notifyListeners();
  }

  ThemeData get currentTheme => !isLightTheme
      ? CustomLightTheme().themeData
      : CustomDarkTheme().themeData;
}
