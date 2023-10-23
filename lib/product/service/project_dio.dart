import 'package:dio/dio.dart';

mixin ProjectDio {
  var dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/movie/popular?api_key=68e959c5c6327f7e39f82f806bb22462",
      headers: {
        "Content-Type": "application/json",
      }));
}
