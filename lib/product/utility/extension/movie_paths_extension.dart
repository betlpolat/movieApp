import '../constants/path_constant.dart';
import '../enum/movie_paths.dart';

extension MoviePathsExtension on MoviePaths {
  String moviePath() {
    return "${PathConstant.moviePath}$name?api_key=${PathConstant.apiKey}";
  }

  String searchPath() {
    return "${PathConstant.searchPath}?api_key=${PathConstant.apiKey}";
  }
}
