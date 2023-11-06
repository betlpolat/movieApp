import 'package:dio/dio.dart';
import 'package:movie_app/product/constants/app_path.dart';

mixin ProjectDio {
  final dio = Dio(BaseOptions(
    baseUrl: AppPath().basePath,
    headers: {
      "Content-Type": "application/json",
    },
  ));
}
