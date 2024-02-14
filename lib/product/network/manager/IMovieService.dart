// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

import '../../utility/enum/path/movie_paths.dart';

abstract class IMovieService {
  Future<List<Movie>?> fetchMovieList({
    @required MoviePaths path,
  });
  Future<List<Movie>?> fetchMovieListWithSearch({
    @required String path,
  });
}
