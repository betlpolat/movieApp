import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/base/model/base_dio.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/init/config/app_environment.dart';
import 'package:movie_app/product/init/config/env_dev.dart';
import 'package:movie_app/product/init/network/custom_dio.dart';
import 'package:movie_app/product/utility/constants/path_constant.dart';
import 'package:movie_app/product/utility/enum/language_code.dart';
import 'package:movie_app/product/utility/enum/movie_paths.dart';
import 'package:movie_app/product/utility/extension/movie_paths_extension.dart';

void main() {
  late BaseDio customDio;
  setUp(() {
    AppEnvironment.setup(config: EnvDev());
    customDio = CustomDio(
        baseOptions: BaseOptions(
      baseUrl: PathConstant.basePath,
      headers: {
        "Content-Type": "application/json",
      },
    ));
  });
  test('Service Test - popular movies', () async {
    final responsePopular = await customDio.dioGet(
        MoviePaths.popular.moviePath(LanguageCode.english), Movies());
    final List<Movie>? popularList = responsePopular.results;
    expect(popularList, isNotNull);
    expect(popularList, isList);
  });
  test('Service Test - top rated movies', () async {
    final responseTopRated = await customDio.dioGet(
        MoviePaths.topRated.moviePath(LanguageCode.english), Movies());
    final List<Movie>? topRatedList = responseTopRated.results;
    expect(topRatedList, isNotNull);
    expect(topRatedList, isList);
  });
  test('Service Test - now playing movies', () async {
    final responseNowPLaying = await customDio.dioGet(
        MoviePaths.nowPlaying.moviePath(LanguageCode.english), Movies());
    final List<Movie>? nowPlayingList = responseNowPLaying.results;

    expect(nowPlayingList, isNotNull);
    expect(nowPlayingList, isList);
  });

  // test('Service Test - search with query is "breakfast" ', () async {
  //   final responseSearch = await customDio.dioGet(
  //       "${MoviePaths.search.searchPath()}&query=breakfast", Movies());
  //   expect(responseSearch, isNotNull);
  //   expect(responseSearch, isList);
  // });
}
