// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.onLoad = false,
    this.onComplete = false,
    this.popular,
    this.topRated,
    this.nowPlaying,
    this.onError = false,
    this.errorMessage = '',
    this.isLanguageChange = false,
  });

  final bool onLoad;
  final bool onComplete;
  final List<Movie>? popular;
  final List<Movie>? topRated;
  final List<Movie>? nowPlaying;
  final bool onError;
  final String errorMessage;
  final bool isLanguageChange;
//isLoading değişmedikçe sayfayı tetiklemez
  @override
  List<Object?> get props => [onLoad, onComplete, isLanguageChange, onError];

  HomeState copyWith({
    bool? onLoad,
    bool? onComplete,
    List<Movie>? popular,
    List<Movie>? topRated,
    List<Movie>? nowPlaying,
    bool? onError,
    String? errorMessage,
    bool? isLanguageChange,
  }) {
    return HomeState(
      onLoad: onLoad ?? false,
      onComplete: onComplete ?? false,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      nowPlaying: nowPlaying ?? this.nowPlaying,
      onError: onError ?? false,
      errorMessage: errorMessage ?? this.errorMessage,
      isLanguageChange: isLanguageChange ?? false,
    );
  }
}
