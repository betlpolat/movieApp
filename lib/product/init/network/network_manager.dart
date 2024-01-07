import 'package:dio/dio.dart';
import 'package:movie_app/core/base/model/base_dio.dart';
import 'package:movie_app/product/init/network/custom_dio.dart';

import '../../utility/constants/path_constant.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._();
    return _instance!;
  }

  NetworkManager._() {
    dio = CustomDio(
      baseOptions: BaseOptions(
        baseUrl: PathConstant.basePath,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }
  late final BaseDio dio;
}
