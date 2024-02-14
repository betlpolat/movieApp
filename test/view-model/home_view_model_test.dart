import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/feature/home/view-model/home/home_state.dart';
import 'package:movie_app/feature/home/view-model/home/home_view_model.dart';

import '../mock/movie_service_mock.dart';

void main() {
  late HomeViewModel homeViewModel;
  setUp(() {
    homeViewModel = HomeViewModel(movieService: MovieServiceMock());
  });
  group('Home View Model Test', () {
    test('initial state ', () {
      expect(homeViewModel.state.onLoad, false);
      expect(homeViewModel.state.nowPlaying, isNull);
      expect(homeViewModel.state.onComplete, false);
    });

    blocTest<HomeViewModel, HomeState>(
      'change loading state',
      build: () => homeViewModel,
      act: (bloc) => bloc.changeLoading(),
      expect: () => {
        isA<HomeState>().having((state) => state.onLoad, 'onLoad', true),
      },
    );

    blocTest<HomeViewModel, HomeState>(
      'fetch movies',
      build: () => homeViewModel,
      act: (bloc) async => bloc.fetchMovies(),
      expect: () => {
        isA<HomeState>().having((state) => state.onLoad, 'onLoad', true),
        isA<HomeState>()
            .having((state) => state.onComplete, 'onComplete', true)
            .having((state) => state.popular, 'onComplete', isNotEmpty)
            .having((state) => state.topRated, 'onComplete', isNotEmpty)
            .having((state) => state.nowPlaying, 'onComplete', isNotEmpty),
      },
    );
  });
}
