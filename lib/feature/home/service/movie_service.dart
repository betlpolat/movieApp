import 'dart:io';
import 'package:dio/dio.dart';
import '../model/movies.dart';

abstract class IMovieService {
  Future<List<Movie?>?> fetchMovieList(Dio dio);
}

class MovieService extends IMovieService {
  @override
  Future<List<Movie?>?> fetchMovieList(Dio dio) async {
    final response = await dio.get("");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Movies.fromJson(jsonBody).results;
      }
    }
    throw NetworkError(response.statusCode.toString(), response.data);
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}
