import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/product/enum/movie_paths.dart';
import 'package:movie_app/product/extension/movie_paths_extension.dart';
import 'package:movie_app/product/init/network_manager.dart';

void main() {
  late IMovieService movieService;
  setUp(() {
    movieService = MovieService(NetworkManager.instance.service);
  });
  test('Service Test - popular movies', () async {
    final responsePopular = await movieService.fetchMovieList(MoviePaths.popular.path());
    expect(responsePopular, isNotNull);
    expect(responsePopular, isList);
  });
  test('Service Test - top rated movies', () async {
    final responseTopRated = await movieService.fetchMovieList(MoviePaths.top_rated.path());
    expect(responseTopRated, isNotNull);
    expect(responseTopRated, isList);
  });
  test('Service Test - now playing movies', () async {
    final responseNowPLaying = await movieService.fetchMovieList(MoviePaths.now_playing.path());
    expect(responseNowPLaying, isNotNull);
    expect(responseNowPLaying, isList);
  });
}
