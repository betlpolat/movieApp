import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/model/network_error.dart';
import '../../../../product/utility/enum/movie_paths.dart';
import '../../../../product/utility/extension/movie_paths_extension.dart';
import '../../service/movie_service.dart';
import 'search_state.dart';

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
        if (search == null || search.isEmpty) {
          emit(SearchInitial());
        } else {
          emit(SearchComplated(search.sublist(0, 5)));
        }
      } on NetworkError catch (e) {
        emit(SearchError(e.message));
      }
    }
  }

  Future<void> closeSearch() async {
    emit(SearchInitial());
  }
}
