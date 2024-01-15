// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/base/model/base_view_model.dart';
import 'package:movie_app/product/utility/extension/movie_paths_extension.dart';

import '../../../../core/base/model/base_error.dart';
import '../../../../product/service/movie_service.dart';
import '../../../../product/utility/enum/movie_paths.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> with BaseViewModel {
  SearchCubit() : super(const SearchState());
  Future<void> getSearch(String query) async {
    throttleHelper.onDelayTouch(query, (text) => _getSearch(text ?? ''));
  }

  Future<void> _getSearch(String query) async {
    final service = MovieService(networkManager: networkManager);

    // ignore: unnecessary_null_comparison
    if (query == '' || query == null || query.length < 2) {
      emit(const SearchState());
    } else {
      try {
        emit(const SearchState(onLoad: true));
        final path = '${MoviePaths.search.searchPath()}&query=$query';
        final search = await service.fetchMovieListWithSearch(
          path: path,
        );
        if (search == null || search.isEmpty) {
          emit(const SearchState());
        } else {
          emit(SearchState(onComplete: true, searchList: search.sublist(0, 5)));
        }
      } on BaseError catch (e) {
        emit(SearchState(onError: true, errorMessage: e.message));
      }
    }
  }

  Future<void> closeSearch() async {
    emit(const SearchState(searchList: []));
  }
}
