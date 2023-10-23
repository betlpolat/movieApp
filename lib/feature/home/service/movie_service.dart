import 'dart:io';
import 'package:dio/dio.dart';
import '../../../product/constants/app_path.dart';
import '../model/movies.dart';

abstract class IMovieService {
  Future<List<Movie?>?> fetchMovieListTrending();
  Future<List<Movie?>?> fetchMovieListTopRated();
  Future<List<Movie?>?> fetchMovieListNowPlaying();
}

class MovieService extends IMovieService {
  var dioTrending =
      Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/movie/popular?api_key=${AppPath().apiKey}", headers: {
    "Content-Type": "application/json",
  }));
  var dioTopRated =
      Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/movie/top_rated?api_key=${AppPath().apiKey}", headers: {
    "Content-Type": "application/json",
  }));
  var dioNowPlaying =
      Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/movie/now_playing?api_key=${AppPath().apiKey}", headers: {
    "Content-Type": "application/json",
  }));

  @override
  Future<List<Movie?>?> fetchMovieListTrending() async {
    final response = await dioTrending.get("");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Movies.fromJson(jsonBody).results;
      }
    }
    throw NetworkError(response.statusCode.toString(), response.data);
  }

  @override
  Future<List<Movie?>?> fetchMovieListTopRated() async {
    final response = await dioTopRated.get("");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Movies.fromJson(jsonBody).results;
      }
    }
    throw NetworkError(response.statusCode.toString(), response.data);
  }

  @override
  Future<List<Movie?>?> fetchMovieListNowPlaying() async {
    final response = await dioNowPlaying.get("");
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
