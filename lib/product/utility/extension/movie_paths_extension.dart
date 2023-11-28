import 'package:movie_app/product/utility/enum/language_code.dart';
import '../constants/path_constant.dart';
import '../enum/movie_paths.dart';

extension MoviePathsExtension on MoviePaths {
  String moviePath(LanguageCode languageCode) {
    return "${PathConstant.moviePath}$name?language=${languageCode.code}&api_key=${PathConstant.apiKey}";
  }

  String searchPath() {
    return "${PathConstant.searchPath}?api_key=${PathConstant.apiKey}";
  }
}
