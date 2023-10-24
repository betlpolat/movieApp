import 'package:movie_app/feature/home/model/movies.dart';

abstract class HomeState {
  HomeState();
}

class HomeInitial extends HomeState {
  HomeInitial();
}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeComplated extends HomeState {
  final List<Movie?>? trending;
  final List<Movie?>? topRated;
  final List<Movie?>? nowPlaying;

  HomeComplated(
    this.trending,
    this.topRated,
    this.nowPlaying,
  );
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
