abstract class CacheOperation {
  bool readBool({required String key});
  Future<bool>? writeBool({required String key, required bool value});
  String readString({required String key});
  Future<bool>? writeString({required String key, required String value});
  int readInt({required String key});
  Future<bool>? writeInt({required String key, required int value});
}
