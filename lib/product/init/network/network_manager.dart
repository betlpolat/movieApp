import 'package:dio/dio.dart';

import '../../../core/base/model/base_dio.dart';
import '../../utility/constants/path_constant.dart';
import 'custom_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._();
    return _instance!;
  }

  NetworkManager._() {
    final baseOptions = BaseOptions(
      baseUrl: PathConstant.basePath,
      headers: {
        "Content-Type": "application/json",
      },
    );
    dio = CustomDio(baseOptions: baseOptions);
  }
  late final BaseDio dio;
}
