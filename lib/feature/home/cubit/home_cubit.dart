import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/product/service/project_dio.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with ProjectDio {
  final MovieService _movieService;
  HomeCubit(this._movieService) : super(HomeInitial());

  Future<void> getMovie() async {
    try {
      emit(HomeLoading());
      final popular = await _movieService.fetchMovieList(dioPopular);
      final topRated = await _movieService.fetchMovieList(dioTopRated);
      final nowPlaying = await _movieService.fetchMovieList(dioNowPlaying);

      emit(HomeComplated(popular, topRated, nowPlaying));
    } on NetworkError catch (e) {
      emit(HomeError(e.message));
    }
  }
}
