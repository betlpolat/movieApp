import 'package:core/src/cache/core/cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedCacheManager extends CacheManger {
  SharedCacheManager._();

  static SharedCacheManager instance = SharedCacheManager._();
  late SharedPreferences sharedPreferences;

  @override
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
