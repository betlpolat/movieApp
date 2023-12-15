import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/product/init/network/network_manager.dart';
import 'package:movie_app/product/utility/enum/language_code.dart';
import 'package:movie_app/product/utility/enum/movie_paths.dart';
import 'package:movie_app/product/utility/extension/movie_paths_extension.dart';

void main() {
  late IMovieService movieService;
  setUp(() {
    movieService = MovieService(NetworkManager.instance.service);
  });
  test('Service Test - popular movies', () async {
    final responsePopular = await movieService
        .fetchMovieList(MoviePaths.popular.moviePath(LanguageCode.english));
    expect(responsePopular, isNotNull);
    expect(responsePopular, isList);
  });
  test('Service Test - top rated movies', () async {
    final responseTopRated = await movieService
        .fetchMovieList(MoviePaths.topRated.moviePath(LanguageCode.english));
    expect(responseTopRated, isNotNull);
    expect(responseTopRated, isList);
  });
  test('Service Test - now playing movies', () async {
    final responseNowPLaying = await movieService
        .fetchMovieList(MoviePaths.nowPlaying.moviePath(LanguageCode.english));
    expect(responseNowPLaying, isNotNull);
    expect(responseNowPLaying, isList);
  });

  test('Service Test - search with query is "breakfast" ', () async {
    final responseSearch = await movieService
        .fetchMovieList("${MoviePaths.search.searchPath()}&query=breakfast");
    expect(responseSearch, isNotNull);
    expect(responseSearch, isList);
  });
}
