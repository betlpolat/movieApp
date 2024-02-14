import 'package:core/src/cache/core/cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The SharedCacheManager class is an implementation of the CacheManager class.
final class SharedCacheManager extends CacheManager {
  SharedCacheManager._();

  ///Singleton instance for Shared Cache Manager
  static SharedCacheManager instance = SharedCacheManager._();

  ///Shared Preferences object
  late SharedPreferences sharedPreferences;

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
