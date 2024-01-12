// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../model/movies.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoading = false,
    this.isCompleted = false,
    this.popular,
    this.topRated,
    this.nowPlaying,
    this.isError = false,
    this.errorMessage = '',
    this.isLanguageChange = false,
  });

  final bool isLoading;
  final bool isCompleted;
  final List<Movie>? popular;
  final List<Movie>? topRated;
  final List<Movie>? nowPlaying;
  final bool isError;
  final String errorMessage;
  final bool isLanguageChange;
//isLoading değişmedikçe sayfayı tetiklemez
  @override
  List<Object?> get props => [isLoading];

  HomeState copyWith({
    bool? isLoading,
    bool? isCompleted,
    List<Movie>? popular,
    List<Movie>? topRated,
    List<Movie>? nowPlaying,
    bool? isError,
    String? errorMessage,
    bool? isLanguageChange,
  }) {
    return HomeState(
      isLoading: isLoading ?? false,
      isCompleted: isCompleted ?? false,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      nowPlaying: nowPlaying ?? this.nowPlaying,
      isError: isError ?? false,
      errorMessage: errorMessage ?? this.errorMessage,
      isLanguageChange: isLanguageChange ?? false,
    );
  }
}
