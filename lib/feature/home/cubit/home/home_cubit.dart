import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/product/init/language/language_notifier.dart';
import 'package:movie_app/product/utility/enum/language_code.dart';
import 'package:movie_app/product/utility/extension/movie_paths_extension.dart';
import '../../../../product/utility/enum/movie_paths.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IMovieService _movieService;
  HomeCubit(this._movieService) : super(HomeInitial());

  Future<void> getMovie(LanguageCode currentLanguage) async {
    try {
      print(currentLanguage);
      emit(HomeLoading());
      final popular = await _movieService.fetchMovieList(MoviePaths.popular.moviePath(currentLanguage));
      final topRated = await _movieService.fetchMovieList(MoviePaths.top_rated.moviePath(currentLanguage));
      final nowPlaying = await _movieService.fetchMovieList(MoviePaths.now_playing.moviePath(currentLanguage));

      emit(HomeComplated(popular, topRated, nowPlaying));
    } on NetworkError catch (e) {
      emit(HomeError(e.message));
    }
  }
}
