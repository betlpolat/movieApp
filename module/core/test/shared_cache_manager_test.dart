import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});

    await SharedCacheManager.instance.init();
  });

  group('Shared Cache Manager Test', () {
    test('Bool Value write and read', () async {
      await SharedCacheOperation().writeBool(key: 'bool', value: true);
      final value = SharedCacheOperation().readBool(key: 'bool');
      expect(value, true);
    });

    test('String Value write and read', () async {
      await SharedCacheOperation().writeString(key: 'String', value: 'String');
      final value = SharedCacheOperation().readString(key: 'String');
      expect(value, 'String');
    });
    test('Int Value write and read', () async {
      await SharedCacheOperation().writeInt(key: 'int', value: 1);
      final value = SharedCacheOperation().readInt(key: 'int');
      expect(value, 1);
    });
  });
}
