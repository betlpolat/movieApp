import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/view-model/home/index.dart';
import 'package:movie_app/product/state/base/base_state.dart';

import '../../../../product/network/movie_service.dart';
import '../../../../product/state/view-model/language_notifier.dart';
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
    homeViewModel.fetchMovies(context.read<LanguageNotifier>().currentLanguage);
  }

  Future<void> changeLanguage(BuildContext context) =>
      _homeViewModel.changeLanguage(context);
}
