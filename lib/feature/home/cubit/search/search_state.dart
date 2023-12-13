import '../../model/movies.dart';

abstract class SearchState {
  SearchState();
}

class SearchInitial extends SearchState {
  SearchInitial();
}

class SearchLoading extends SearchState {
  SearchLoading();
}

class SearchCompleted extends SearchState {
  final List<Movie?>? search;

  SearchCompleted(this.search);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
