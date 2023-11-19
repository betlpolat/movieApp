import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/cubit/search/search_state.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/product/utility/extension/movie_paths_extension.dart';
import '../../../../product/utility/enum/movie_paths.dart';

class SearchCubit extends Cubit<SearchState> {
  final IMovieService _movieService;
  SearchCubit(this._movieService) : super(SearchInitial());

  Future<void> getSearch(String query) async {
    // ignore: unnecessary_null_comparison
    if (query == "" || query == null) {
      emit(SearchInitial());
    } else {
      try {
        emit(SearchLoading());
        final search = await _movieService.fetchMovieList(MoviePaths.search.searchPath(), query: query);
        if (search == null || search.isEmpty || search == []) {
          emit(SearchInitial());
        } else {
          emit(SearchComplated(search));
        }
      } on NetworkError catch (e) {
        emit(SearchError(e.message));
      }
    }
  }
}
