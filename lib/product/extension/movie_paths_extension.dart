import '../constants/app_path.dart';
import '../enum/movie_paths.dart';

extension MoviePathsExtension on MoviePaths {
  String moviePath() {
    return "${AppPath().moviePath}$name?api_key=${AppPath().apiKey}";
  }

  String searchPath() {
    return "${AppPath().searchPath}?api_key=${AppPath().apiKey}";
  }
}
