import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/model/base_error.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../product/network/manager/IMovieService.dart';
import '../../../../product/network/movie_service.dart';
import '../../../../product/state/language_notifier.dart';
import '../../../../product/utility/enum/index.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseViewModel {
  HomeCubit() : super(const HomeState());

  Future<void> changeLanguage(BuildContext context) async {
    await context.read<LanguageNotifier>().changeLanguage(context);
    if (context.mounted) {
      await getMovie(context);
    }
  }

  Future<void> getMovie(BuildContext context) async {
    final IMovieService service = MovieService(networkManager: networkManager);
    final currentLanguage = context.read<LanguageNotifier>().currentLanguage;

    try {
      emit(const HomeState(onLoad: true));

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
          onComplete: true,
          popular: popular,
          topRated: topRated,
          nowPlaying: nowPlaying,
        ),
      );
    } on BaseError catch (e) {
      emit(HomeState(onError: true, errorMessage: e.message));
    }
  }
}
