enum MovieTypes {
  popular,
  topRated,
  nowPlaying,
}

extension MovieTypesExtension on MovieTypes {
  String pathNames() {
    switch (this) {
      case MovieTypes.popular:
        return "popular";
      case MovieTypes.topRated:
        return "top_rated";
      case MovieTypes.nowPlaying:
        return "now_playing";
    }
  }
}
