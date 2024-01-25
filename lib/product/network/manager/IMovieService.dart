// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movie_app/product/utility/enum/locales.dart';
import 'package:vexana/vexana.dart';

import '../../utility/enum/path/movie_paths.dart';

abstract class IMovieService {
  IMovieService({required this.networkManager});

  final INetworkManager<EmptyModel> networkManager;

  Future<List<Movie>?> fetchMovieList({
    @required Locales currentLanguage,
    @required MoviePaths path,
  });
  Future<List<Movie>?> fetchMovieListWithSearch({
    @required String path,
  });
}
