import '../constants/app_path.dart';
import '../enum/movie_paths.dart';

extension MoviePathsExtension on MoviePaths {
  String path() {
    return "$name?api_key=${AppPath().apiKey}";
  }
}
