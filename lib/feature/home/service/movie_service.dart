import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_app/product/enum/movie_types.dart';
import '../../../product/constants/app_path.dart';
import '../model/movies.dart';

abstract class IMovieService {
  Future<List<Movie?>?> fetchMovieList(Dio dio, MovieTypes type);
}

class MovieService implements IMovieService {
  @override
  Future<List<Movie?>?> fetchMovieList(Dio dio, MovieTypes type) async {
    late final Response response;
    try {
      response = await dio.get("${type.pathNames()}?api_key=${AppPath().apiKey}");
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return Movies.fromJson(jsonBody).results;
        }
      }
    } catch (e) {
      throw NetworkError(
        response.statusCode.toString(),
        response.data,
      );
    }
    return null;
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}
