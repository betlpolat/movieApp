// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.onLoad = false,
    this.onComplete = false,
    this.onError = false,
    this.errorMessage = '',
    this.searchList,
  });

  final bool onLoad;
  final bool onComplete;
  final bool onError;
  final String errorMessage;
  final List<Movie>? searchList;

  @override
  List<Object?> get props => [onLoad, onComplete, onError, searchList];

  SearchState copyWith({
    bool? onLoad,
    bool? onComplete,
    bool? onError,
    String? errorMessage,
    List<Movie>? searchList,
  }) {
    return SearchState(
      onLoad: onLoad ?? false,
      onComplete: onComplete ?? false,
      onError: onError ?? false,
      errorMessage: errorMessage ?? this.errorMessage,
      searchList: searchList ?? [],
    );
  }
}
