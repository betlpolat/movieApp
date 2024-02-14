import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/product/state/base/base_cubit.dart';
import 'package:vexana/vexana.dart';

import '../../../../product/network/manager/IMovieService.dart';
import '../../../../product/state/view-model/language_notifier.dart';
import '../../../../product/utility/enum/index.dart';
import 'home_state.dart';

final class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel({
    required IMovieService movieService,
  })  : _movieService = movieService,
        super(const HomeState());

  late final IMovieService _movieService;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(onLoad: !state.onLoad));
  }

  ///Fetch Movies
  Future<void> fetchMovies() async {
    changeLoading();
    await _getMoviesFromService();
  }

  ///Get Movies From Movies Service with Movie Paths

  Future<void> _getMoviesFromService() async {
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

//TODO: UI Test
  Future<void> changeLanguage(BuildContext context) async {
    await context.read<LanguageNotifier>().changeLanguage(context);
    if (context.mounted) {
      await fetchMovies();
    }
  }
}
