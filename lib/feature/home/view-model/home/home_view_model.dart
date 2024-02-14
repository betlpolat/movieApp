import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/product/state/base/base_cubit.dart';
import 'package:vexana/vexana.dart';

import '../../../../product/network/manager/IMovieService.dart';
import '../../../../product/state/view-model/language_notifier.dart';
import '../../../../product/utility/enum/index.dart';
import 'home_state.dart';

final class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel({required IMovieService movieService})
      : _movieService = movieService,
        super(const HomeState());

  late final IMovieService _movieService;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(onLoad: !state.onLoad));
  }

  ///Fetch Movies
  Future<void> fetchMovies(Locales? currentLanguage) async {
    changeLoading();
    await _getMovies(currentLanguage);
  }

  ///Get Movies
  Future<void> _getMovies(Locales? currentLanguage) async {
    try {
      final popular = await _movieService.fetchMovieList(
        path: MoviePaths.popular,
      );
      final topRated = await _movieService.fetchMovieList(
        path: MoviePaths.topRated,
      );
      final nowPlaying = await _movieService.fetchMovieList(
        path: MoviePaths.nowPlaying,
      );

      emit(
        state.copyWith(
          onComplete: true,
          popular: popular,
          topRated: topRated,
          nowPlaying: nowPlaying,
        ),
      );
    } on ErrorModel catch (e) {
      emit(state.copyWith(onError: true, errorMessage: e.description));
    }
  }

//TODO: Unit test with context mock
  Future<void> changeLanguage(BuildContext context) async {
    await context.read<LanguageNotifier>().changeLanguage(context);
    if (context.mounted) {
      await fetchMovies(context.read<LanguageNotifier>().currentLanguage);
    }
  }
}
