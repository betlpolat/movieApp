import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

import '../state/view-model/language_notifier.dart';
import '../utility/enum/index.dart';
import 'manager/IMovieService.dart';

final class MovieService extends IMovieService {
  MovieService({
    required BuildContext context,
    required INetworkManager<EmptyModel> networkManager,
  })  : _context = context,
        _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;
  final BuildContext _context;
  @override
  Future<List<Movie>?> fetchMovieList({
    MoviePaths path = MoviePaths.popular,
  }) async {
    final currentLanguage =
        _context.read<LanguageNotifier>().currentLanguage ?? Locales.en;
    final response = await _networkManager.send<Movies, Movies>(
      path.withQuery(currentLanguage),
      parseModel: Movies(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }

  @override
  Future<List<Movie>?> fetchMovieListWithSearch({String path = ''}) async {
    final response = await _networkManager.send<Movies, Movies>(
      path,
      parseModel: Movies(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }
}
