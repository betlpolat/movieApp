enum MoviePaths {
  popular('popular'),
  topRated('top_rated'),
  nowPlaying('now_playing'),
  search('search');

  const MoviePaths(this.value);
  final String value;
}
