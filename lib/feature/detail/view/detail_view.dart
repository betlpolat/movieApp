import 'package:flutter/material.dart';
import '../../home/model/movies.dart';
import 'detail_app_bar.dart';
import 'movie_infos.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.movie});
  final Movie? movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [DetailAppBar(movie: movie), MovieInfos(movie: movie)],
      ),
    );
  }
}
