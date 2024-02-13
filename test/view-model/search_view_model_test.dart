import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:movie_app/feature/home/view-model/search/index.dart';
import 'package:movie_app/product/init/config/app_environment.dart';
import 'package:movie_app/product/utility/model/throttle_helper.dart';

import '../mock/movie_service_mock.dart';

void main() {
  late SearchViewModel searchViewModel;
  AppEnvironment.setup(config: EnvDev());
  setUp(() {
    searchViewModel = SearchViewModel(
      movieService: MovieServiceMock(),
      throttleHelper: ThrottleHelper(),
    );
  });
  group('Search View Model Test', () {
    blocTest<SearchViewModel, SearchState>(
      'get search with query=breakfast ',
      build: () => searchViewModel,
      act: (bloc) async => bloc.getSearch('breakfast'),
      expect: () => {
        isA<SearchState>().having((state) => state.onLoad, 'onLoad', true),
        isA<SearchState>()
            .having((state) => state.onComplete, 'onComplete', true)
            .having((state) => state.searchList, 'searchList', isNotEmpty),
      },
    );
    blocTest<SearchViewModel, SearchState>(
      'get search with query=b ',
      build: () => searchViewModel,
      act: (bloc) async => bloc.getSearch('b'),
      expect: () => {
        isA<SearchState>()
            .having((state) => state.searchList, 'searchList', isNull),
      },
    );

    blocTest<SearchViewModel, SearchState>(
      'close search',
      build: () => searchViewModel,
      act: (bloc) async => bloc.closeSearch(),
      expect: () => {
        isA<SearchState>()
            .having((state) => state.searchList, 'searchList', isEmpty),
      },
    );
  });
}
