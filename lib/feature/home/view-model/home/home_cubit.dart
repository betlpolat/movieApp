import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/product/service/movie_service.dart';

import '../../../../core/base/model/base_error.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../product/utility/enum/language_code.dart';
import '../../../../product/utility/enum/movie_paths.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseViewModel {
  HomeCubit() : super(HomeInitial());

  Future<void> getMovie(LanguageCode currentLanguage) async {
    final IMovieService service = MovieService(networkManager: networkManager);
    try {
      emit(HomeLoading());

      final popular = await service.fetchMovieList(
        currentLanguage: currentLanguage,
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

      emit(HomeCompleted(popular, topRated, nowPlaying));
    } on BaseError catch (e) {
      emit(HomeError(e.message));
    }
  }
}
