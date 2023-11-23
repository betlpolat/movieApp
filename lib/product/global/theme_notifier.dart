import 'package:flutter/material.dart';
import 'package:movie_app/product/init/cache/cache_keys.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLightTheme = CacheKeys.theme.readBool;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    CacheKeys.theme.writeBool(isLightTheme);
    notifyListeners();
  }

  ThemeData get currentTheme => !isLightTheme ? ThemeData.light() : ThemeData.dark();
}
