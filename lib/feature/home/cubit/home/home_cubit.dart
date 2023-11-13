import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/product/extension/movie_paths_extension.dart';
import '../../../../product/enum/movie_paths.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IMovieService _movieService;
  HomeCubit(this._movieService) : super(HomeInitial());

  Future<void> getMovie() async {
    try {
      emit(HomeLoading());
      final popular = await _movieService.fetchMovieList(MoviePaths.popular.moviePath());
      final topRated = await _movieService.fetchMovieList(MoviePaths.top_rated.moviePath());
      final nowPlaying = await _movieService.fetchMovieList(MoviePaths.now_playing.moviePath());

      emit(HomeComplated(popular, topRated, nowPlaying));
    } on NetworkError catch (e) {
      emit(HomeError(e.message));
    }
  }
}
