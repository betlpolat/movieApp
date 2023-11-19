import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/product/utility/enum/movie_paths.dart';
import 'package:movie_app/product/utility/extension/movie_paths_extension.dart';
import 'package:movie_app/product/init/network_manager.dart';

void main() {
  late IMovieService movieService;
  setUp(() {
    movieService = MovieService(NetworkManager.instance.service);
  });
  test('Service Test - popular movies', () async {
    final responsePopular = await movieService.fetchMovieList(MoviePaths.popular.moviePath());
    expect(responsePopular, isNotNull);
    expect(responsePopular, isList);
  });
  test('Service Test - top rated movies', () async {
    final responseTopRated = await movieService.fetchMovieList(MoviePaths.top_rated.moviePath());
    expect(responseTopRated, isNotNull);
    expect(responseTopRated, isList);
  });
  test('Service Test - now playing movies', () async {
    final responseNowPLaying = await movieService.fetchMovieList(MoviePaths.now_playing.moviePath());
    expect(responseNowPLaying, isNotNull);
    expect(responseNowPLaying, isList);
  });

  test('Service Test - search with query is "breakfast" ', () async {
    final responseSearch = await movieService.fetchMovieList("${MoviePaths.search.searchPath()}&query=breakfast");
    expect(responseSearch, isNotNull);
    expect(responseSearch, isList);
  });
}
