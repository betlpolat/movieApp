import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/base/model/network_error.dart';
import '../model/movies.dart';

abstract class IMovieService {
  final Dio dio;

  IMovieService(this.dio);
  Future<List<Movie>?> fetchMovieList(String path, {String query});
}

class MovieService extends IMovieService {
  MovieService(super.dio);

  @override
  Future<List<Movie>?> fetchMovieList(String path, {String query = ""}) async {
    late final Response response;
    try {
      if (query.isNotEmpty) {
        query = "&query=$query";
        path += query;
      }
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
