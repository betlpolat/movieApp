import 'package:dio/dio.dart';
import 'package:movie_app/product/utility/constants/path_constant.dart';

class NetworkManager {
  NetworkManager._() {
    _dio = Dio(BaseOptions(
      baseUrl: PathConstant.basePath,
      headers: {
        "Content-Type": "application/json",
      },
    ));
  }

  late final Dio _dio;

  static NetworkManager instance = NetworkManager._();
  Dio get service => _dio;
}
