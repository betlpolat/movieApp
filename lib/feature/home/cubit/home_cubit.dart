import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/core/mixin/project_dio.dart';
import '../../../product/enum/movie_types.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with ProjectDio {
  final IMovieService _movieService;
  HomeCubit(this._movieService) : super(HomeInitial());

  Future<void> getMovie() async {
    try {
      emit(HomeLoading());
      final popular = await _movieService.fetchMovieList(dio, MovieTypes.popular);
      final topRated = await _movieService.fetchMovieList(dio, MovieTypes.topRated);
      final nowPlaying = await _movieService.fetchMovieList(dio, MovieTypes.nowPlaying);

      emit(HomeComplated(popular, topRated, nowPlaying));
    } on NetworkError catch (e) {
      emit(HomeError(e.message));
    }
  }
}
