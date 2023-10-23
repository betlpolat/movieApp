enum MovieTypes {
  trending,
  topRated,
  nowPlaying,
}

extension MovieTypesExtension on MovieTypes {
  String names() {
    switch (this) {
      case MovieTypes.trending:
        return "popular";
      case MovieTypes.topRated:
        return "top_rated";
      case MovieTypes.nowPlaying:
        return "now_playing";
    }
  }
}
