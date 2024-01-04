// import 'package:dio/dio.dart';

// import '../../utility/constants/path_constant.dart';

// class NetworkManager {
//   NetworkManager._() {
//     _dio = Dio(BaseOptions(
//       baseUrl: PathConstant.basePath,
//       headers: {
//         "Content-Type": "application/json",
//       },
//     ));
//   }

//   late final Dio _dio;

//   static NetworkManager instance = NetworkManager._();
//   Dio get service => _dio;
// }

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/core/base/model/base_model.dart';

import '../../utility/constants/path_constant.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._();
    return _instance!;
  }

  NetworkManager._() {
    _dio = Dio(BaseOptions(
      baseUrl: PathConstant.basePath,
      headers: {
        "Content-Type": "application/json",
      },
    ));
  }
  late final Dio _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;

        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map<String, dynamic>) {
          return model.fromJson(responseBody);
        }
        return responseBody;
    }
  }
}
