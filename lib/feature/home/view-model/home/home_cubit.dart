import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/product/service/movie_service.dart';
import 'package:movie_app/product/utility/enum/index.dart';

import '../../../../core/base/model/base_error.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../product/state/language_notifier.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseViewModel {
  HomeCubit() : super(const HomeState());

  Future<void> changeLanguage(BuildContext context) async {
    context.read<LanguageNotifier>().changeLanguage(context);
    await getMovie(context);
  }

  Future<void> getMovie(BuildContext context) async {
    final IMovieService service = MovieService(networkManager: networkManager);
    final currentLanguage = context.read<LanguageNotifier>().currentLanguage;

    try {
      emit(const HomeState(isLoading: true));

      final popular = await service.fetchMovieList(
        currentLanguage: currentLanguage!,
        path: MoviePaths.popular,
      );
      final topRated = await service.fetchMovieList(
        currentLanguage: currentLanguage,
        path: MoviePaths.topRated,
      );
      final nowPlaying = await service.fetchMovieList(
        currentLanguage: currentLanguage,
        path: MoviePaths.nowPlaying,
      );

      emit(
        HomeState(
          isCompleted: true,
          popular: popular,
          topRated: topRated,
          nowPlaying: nowPlaying,
        ),
      );
    } on BaseError catch (e) {
      emit(HomeState(isError: true, errorMessage: e.message));
    }
  }
}
