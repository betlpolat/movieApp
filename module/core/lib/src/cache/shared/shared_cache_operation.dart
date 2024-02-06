import 'package:core/core.dart';
import 'package:core/src/cache/core/cache_operation.dart';

class SharedCacheOperation extends CacheOperation {
  @override
  bool readBool({required String key}) {
    return SharedCacheManager.instance.sharedPreferences.getBool('') ?? false;
  }

  @override
  Future<bool>? writeBool({required String key, required bool value}) {
    return SharedCacheManager.instance.sharedPreferences.setBool(key, value);
  }

  @override
  String readString({required String key}) {
    return SharedCacheManager.instance.sharedPreferences.getString(key) ?? '';
  }

  @override
  Future<bool>? writeString({required String key, required String value}) {
    return SharedCacheManager.instance.sharedPreferences.setString(key, value);
  }

  @override
  int readInt({required String key}) {
    return SharedCacheManager.instance.sharedPreferences.getInt('') ?? 0;
  }

  @override
  Future<bool>? writeInt({required String key, required int value}) {
    return SharedCacheManager.instance.sharedPreferences.setInt(key, value);
  }
}
