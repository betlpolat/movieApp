import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../feature/home/model/movies.dart';
import '../utility/enum/index.dart';
import '../utility/extension/movie_paths_extension.dart';

abstract class IMovieService {
  IMovieService({required this.networkManager});

  final INetworkManager networkManager;

  Future<List<Movie>?> fetchMovieList({
    @required Locales currentLanguage,
    @required MoviePaths path,
  });
  Future<List<Movie>?> fetchMovieListWithSearch({
    @required String path,
  });
}

class MovieService extends IMovieService {
  MovieService({required super.networkManager});

  @override
  Future<List<Movie>?> fetchMovieList({
    Locales currentLanguage = Locales.en,
    MoviePaths path = MoviePaths.popular,
  }) async {
    final response = await networkManager.send<Movies, Movies>(
      path.moviePath(currentLanguage),
      parseModel: const Movies(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }

  @override
  Future<List<Movie>?> fetchMovieListWithSearch({String path = ''}) async {
    final response = await networkManager.send<Movies, Movies>(
      path,
      parseModel: const Movies(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }
}
