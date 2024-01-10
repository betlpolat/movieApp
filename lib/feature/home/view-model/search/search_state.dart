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
  SearchCompleted(this.search);
  final List<Movie?>? search;
}

class SearchError extends SearchState {
  SearchError(this.message);
  final String message;
}
