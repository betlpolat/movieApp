import '../../constants/path_constant.dart';
import '../locales.dart';

enum MoviePaths {
  popular('movie/popular'),
  topRated('movie/top_rated'),
  nowPlaying('movie/now_playing');

  const MoviePaths(this.value);
  final String value;

  String withQuery(Locales languageCode) {
    final apiKey = PathConstant.apiKey;
    final code = languageCode.code;
    return '$value?language=$code&api_key=$apiKey';
  }
}
