import '../../constants/path_constant.dart';

enum SearchPath {
  search('search/movie');

  const SearchPath(this.value);
  final String value;
  String searchPath(String query) {
    return '$value?api_key=${PathConstant.apiKey}&query=$query';
  }
}
