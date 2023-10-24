import 'package:dio/dio.dart';
import 'package:movie_app/product/constants/app_path.dart';
import '../enum/movie_types.dart';

mixin ProjectDio {
  var dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3/movie/popular?api_key=${AppPath().apiKey}",
    headers: {
      "Content-Type": "application/json",
    },
  ));
  var dioPopular = Dio(BaseOptions(
      baseUrl: "${AppPath().basePath}/${MovieTypes.popular.pathNames()}?api_key=${AppPath().apiKey}",
      headers: {
        "Content-Type": "application/json",
      }));
  var dioTopRated = Dio(BaseOptions(
      baseUrl: "${AppPath().basePath}/${MovieTypes.topRated.pathNames()}?api_key=${AppPath().apiKey}",
      headers: {
        "Content-Type": "application/json",
      }));
  var dioNowPlaying = Dio(BaseOptions(
      baseUrl: "${AppPath().basePath}/${MovieTypes.nowPlaying.pathNames()}?api_key=${AppPath().apiKey}",
      headers: {
        "Content-Type": "application/json",
      }));
}
