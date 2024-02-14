import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:movie_app/product/init/config/app_environment.dart';
import 'package:movie_app/product/network/manager/product_network_manager.dart';
import 'package:movie_app/product/utility/enum/index.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ProductNetworkManager manager;
  AppEnvironment.setup(config: EnvDev());

  setUp(() {
    manager = ProductNetworkManager.base();
  });

  group('Network Manager Test', () {
    test('get movie items from api with popular path', () async {
      final response = await manager.send<Movies, Movies>(
        MoviePaths.popular.withQuery(Locales.en),
        parseModel: Movies(),
        method: RequestType.GET,
      );
      expect(response.data, isNotNull);
    });

    test('get movie items from api with popular path and error', () async {
      manager.listenErrorState(
        onErrorStatus: (value) {
          if (value == HttpStatus.unauthorized) {}
          expect(value, isNotNull);
        },
      );
      final response = await manager.send<Movies, Movies>(
        '${MoviePaths.popular.withQuery(Locales.en)}wrong url',
        parseModel: Movies(),
        method: RequestType.GET,
      );
      expect(response.data, isNull);
    });
  });
}
