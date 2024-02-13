import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

import '../utility/enum/index.dart';
import 'manager/IMovieService.dart';

final class MovieService extends IMovieService {
  MovieService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;
  final INetworkManager<EmptyModel> _networkManager;
  @override
  Future<List<Movie>?> fetchMovieList({
    Locales currentLanguage = Locales.en,
    MoviePaths path = MoviePaths.popular,
  }) async {
    final response = await _networkManager.send<Movies, Movies>(
      path.withQuery(currentLanguage),
      parseModel: Movies(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }

  @override
  Future<List<Movie>?> fetchMovieListWithSearch({String path = ''}) async {
    final response = await _networkManager.send<Movies, Movies>(
      path,
      parseModel: Movies(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }
}
