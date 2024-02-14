///Abstract class for caching functions
abstract class CacheOperation {
  ///reading  boolean values from cache
  bool readBool({required String key});

  ///writing boolean values on cache
  Future<bool>? writeBool({required String key, required bool value});

  ///reading  string values from cache
  String readString({required String key});

  ///writing string values on cache
  Future<bool>? writeString({required String key, required String value});

  ///reading  integer values from cache
  int readInt({required String key});

  ///writing integer values on cache
  Future<bool>? writeInt({required String key, required int value});
}
