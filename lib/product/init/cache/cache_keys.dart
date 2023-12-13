import 'app_cache.dart';

enum CacheKeys {
  theme,
  language;

  bool get readBool =>
      AppCache.instance.sharedPreferences.getBool(name) ?? false;
  Future<bool> writeBool(bool value) =>
      AppCache.instance.sharedPreferences.setBool(name, value);
}
