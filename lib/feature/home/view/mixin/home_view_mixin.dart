import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/view-model/home/index.dart';
import 'package:movie_app/product/state/base/base_state.dart';

import '../../../../product/network/movie_service.dart';
import '../home_view.dart';

mixin HomeViewMixin on TickerProviderStateMixin<HomeView>, BaseState<HomeView> {
  late final HomeViewModel _homeViewModel;
  HomeViewModel get homeViewModel => _homeViewModel;
  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel(
      movieService: MovieService(
        networkManager: productNetworkManager,
        context: context,
      ),
    );
    homeViewModel.fetchMovies();
  }

  Future<void> changeLanguage(BuildContext context) =>
      _homeViewModel.changeLanguage(context);
}
