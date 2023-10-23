import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MovieService _movieService;
  HomeCubit(this._movieService) : super(HomeInitial());

  Future<void> getMovie() async {
    try {
      emit(HomeLoading());
      final trending = await _movieService.fetchMovieListTrending();
      final topRated = await _movieService.fetchMovieListTopRated();
      final nowPlaying = await _movieService.fetchMovieListNowPlaying();

      emit(HomeComplated(trending, topRated, nowPlaying));
    } on NetworkError catch (e) {
      emit(HomeError(e.message));
    }
  }
}
