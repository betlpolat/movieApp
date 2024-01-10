import '../constants/path_constant.dart';
import '../enum/language_code.dart';
import '../enum/movie_paths.dart';

extension MoviePathsExtension on MoviePaths {
  String moviePath(LanguageCode languageCode) {
    final apiKey = PathConstant.apiKey;
    final moviePath = PathConstant.moviePath;
    final code = languageCode.code;
    return '$moviePath$value?language=$code&api_key=$apiKey';
  }

  String searchPath() {
    return '${PathConstant.searchPath}?api_key=${PathConstant.apiKey}';
  }
}
