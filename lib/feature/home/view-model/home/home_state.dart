import '../../model/movies.dart';

abstract class HomeState {
  HomeState();
}

class HomeInitial extends HomeState {
  HomeInitial();
}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeCompleted extends HomeState {
  HomeCompleted(
    this.trending,
    this.topRated,
    this.nowPlaying,
  );
  final List<Movie>? trending;
  final List<Movie>? topRated;
  final List<Movie>? nowPlaying;
}

class HomeError extends HomeState {
  HomeError(this.message);
  final String message;
}
