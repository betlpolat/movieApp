import 'package:movie_app/feature/home/model/movies.dart';

abstract class SearchState {
  SearchState();
}

class SearchInitial extends SearchState {
  SearchInitial();
}

class SearchLoading extends SearchState {
  SearchLoading();
}

class SearchComplated extends SearchState {
  final List<Movie?>? search;

  SearchComplated(this.search);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
