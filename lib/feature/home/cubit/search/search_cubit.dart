import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/product/init/network/network_manager.dart';

import '../../../../core/base/model/base_error.dart';
import '../../../../product/utility/enum/movie_paths.dart';
import '../../../../product/utility/extension/movie_paths_extension.dart';
import '../../model/movies.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final NetworkManager _networkManager;
  SearchCubit(this._networkManager) : super(SearchInitial());

  Future<void> getSearch(String query) async {
    // ignore: unnecessary_null_comparison
    if (query == "" || query == null) {
      emit(SearchInitial());
    } else {
      try {
        emit(SearchLoading());
        String path = "${MoviePaths.search.searchPath()}&query=$query";
        final Movies search = await _networkManager.dioGet(path, Movies());
        final searchList = search.results;
        //  .fetchMovieList(MoviePaths.search.searchPath(), query: query);
        if (searchList == null || searchList.isEmpty) {
          emit(SearchInitial());
        } else {
          emit(SearchCompleted(searchList.sublist(0, 5)));
        }
      } on BaseError catch (e) {
        emit(SearchError(e.message));
      }
    }
  }

  Future<void> closeSearch() async {
    emit(SearchInitial());
  }
}
