import 'package:movie_app/product/state/base/base_cubit.dart';
import 'package:vexana/vexana.dart';

import '../../../../product/network/manager/IMovieService.dart';
import '../../../../product/utility/enum/path/search_path.dart';
import '../../../../product/utility/model/throttle_helper.dart';
import 'search_state.dart';

final class SearchViewModel extends BaseCubit<SearchState> {
  SearchViewModel({
    required IMovieService movieService,
    required ThrottleHelper throttleHelper,
  })  : _movieService = movieService,
        _throttleHelper = throttleHelper,
        super(const SearchState());
  final ThrottleHelper _throttleHelper;

  late final IMovieService _movieService;
  Future<void> fetchSearch(String query) async {
    _throttleHelper.onDelayTouch(query, (text) => getSearch(text ?? ''));
  }

  Future<void> getSearch(String query) async {
    // ignore: unnecessary_null_comparison
    if (query == '' || query == null || query.length < 2) {
      emit(const SearchState());
    } else {
      try {
        emit(const SearchState(onLoad: true));
        final path = SearchPath.search.searchPath(query);
        final search = await _movieService.fetchMovieListWithSearch(
          path: path,
        );
        if (search == null || search.isEmpty) {
          emit(const SearchState());
        } else {
          emit(SearchState(onComplete: true, searchList: search.sublist(0, 5)));
        }
      } on ErrorModel catch (e) {
        emit(
          SearchState(
            onError: true,
            errorMessage: e.description ?? 'Undefined Error',
          ),
        );
      }
    }
  }

  Future<void> closeSearch() async {
    emit(const SearchState(searchList: []));
  }
}
