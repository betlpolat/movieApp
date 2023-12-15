import '../constants/path_constant.dart';
import '../enum/language_code.dart';
import '../enum/movie_paths.dart';

extension MoviePathsExtension on MoviePaths {
  String moviePath(LanguageCode languageCode) {
    return "${PathConstant.moviePath}$value?language=${languageCode.code}&api_key=${PathConstant.apiKey}";
  }

  String searchPath() {
    return "${PathConstant.searchPath}?api_key=${PathConstant.apiKey}";
  }
}
