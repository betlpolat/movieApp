import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/base/model/base_view_model.dart';

import '../../../../core/base/model/base_error.dart';
import '../../../../product/utility/enum/language_code.dart';
import '../../../../product/utility/enum/movie_paths.dart';
import '../../../../product/utility/extension/movie_paths_extension.dart';
import '../../model/movies.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with BaseViewModel {
  HomeCubit() : super(HomeInitial());

  Future<void> getMovie(LanguageCode currentLanguage) async {
    try {
      emit(HomeLoading());
      final Movies popular = await customDio.dioGet(
          MoviePaths.popular.moviePath(currentLanguage), Movies());
      final List<Movie>? popularList = popular.results;
      final Movies topRated = await customDio.dioGet(
          MoviePaths.topRated.moviePath(currentLanguage), Movies());
      final List<Movie>? topRatedList = topRated.results;

      final Movies nowPlaying = await customDio.dioGet(
          MoviePaths.nowPlaying.moviePath(currentLanguage), Movies());
      final List<Movie>? nowPlayingList = nowPlaying.results;

      emit(HomeCompleted(popularList, topRatedList, nowPlayingList));
    } on BaseError catch (e) {
      emit(HomeError(e.message));
    }
  }
}
