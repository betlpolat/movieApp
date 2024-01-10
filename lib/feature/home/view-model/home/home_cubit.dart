import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/model/base_error.dart';
import '../../../../core/base/model/base_view_model.dart';
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
      final popular = await networkManager.send<Movies, Movies>(
        MoviePaths.popular.moviePath(currentLanguage),
        parseModel: Movies(),
        method: RequestType.GET,
      );
      final popularList = popular.data?.results;
      final topRated = await networkManager.send<Movies, Movies>(
        MoviePaths.topRated.moviePath(currentLanguage),
        parseModel: Movies(),
        method: RequestType.GET,
      );
      final topRatedList = topRated.data?.results;
      final nowPlaying = await networkManager.send<Movies, Movies>(
        MoviePaths.nowPlaying.moviePath(currentLanguage),
        parseModel: Movies(),
        method: RequestType.GET,
      );
      final nowPlayingList = nowPlaying.data?.results;

      emit(HomeCompleted(popularList, topRatedList, nowPlayingList));
    } on BaseError catch (e) {
      emit(HomeError(e.message));
    }
  }
}
