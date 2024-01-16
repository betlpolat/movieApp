import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/init/config/app_environment.dart';
import 'package:movie_app/product/init/config/env_dev.dart';
import 'package:movie_app/product/utility/constants/path_constant.dart';
import 'package:movie_app/product/utility/enum/locales.dart';
import 'package:movie_app/product/utility/enum/movie_paths.dart';
import 'package:movie_app/product/utility/extension/movie_paths_extension.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  setUp(() {
    AppEnvironment.setup(config: EnvDev());
    // ignore: prefer_void_to_null
    networkManager = NetworkManager<Null>(
      isEnableLogger: true,
      options: BaseOptions(
        baseUrl: PathConstant.basePath,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  });
  test('Service Test - popular movies', () async {
    final popular = await networkManager.send<Movies, Movies>(
      MoviePaths.popular.moviePath(Locales.en),
      parseModel: Movies(),
      method: RequestType.GET,
    );
    final popularList = popular.data?.results;
    expect(popularList, isNotNull);
    expect(popularList, isList);
  });
  test('Service Test - top rated movies', () async {
    final topRated = await networkManager.send<Movies, Movies>(
      MoviePaths.topRated.moviePath(Locales.en),
      parseModel: Movies(),
      method: RequestType.GET,
    );
    final topRatedList = topRated.data?.results;
    expect(topRatedList, isNotNull);
    expect(topRatedList, isList);
  });
  test('Service Test - now playing movies', () async {
    final nowPlaying = await networkManager.send<Movies, Movies>(
      MoviePaths.nowPlaying.moviePath(Locales.en),
      parseModel: Movies(),
      method: RequestType.GET,
    );
    final nowPlayingList = nowPlaying.data?.results;

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
