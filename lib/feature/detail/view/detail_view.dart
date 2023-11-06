import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'widget/detail_app_bar.dart';
import 'widget/movie_infos.dart';

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
