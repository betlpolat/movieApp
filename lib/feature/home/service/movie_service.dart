import 'dart:io';
import 'package:dio/dio.dart';
import '../model/movies.dart';

abstract class IMovieService {
  final Dio dio;

  IMovieService(this.dio);
  Future<List<Movie>?> fetchMovieList(String path);
}

class MovieService extends IMovieService {
  MovieService(super.dio);

  @override
  Future<List<Movie>?> fetchMovieList(String path) async {
    late final Response response;
    try {
      response = await dio.get(path);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          final response = Movies.fromJson(jsonBody).results;
          return response;
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
