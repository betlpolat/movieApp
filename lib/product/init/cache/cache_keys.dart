import 'package:movie_app/product/init/cache/app_cache.dart';

enum CacheKeys {
  theme;

  bool get readBool => AppCache.instance.sharedPreferences.getBool(name) ?? false;
  Future<bool> writeBool(bool value) => AppCache.instance.sharedPreferences.setBool(name, value);
}
