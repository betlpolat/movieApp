import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../product/widget/button/movie_button.dart';

class MovieItems extends StatelessWidget {
  const MovieItems({
    super.key,
    required this.movies,
  });

  final List<Movie?>? movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.25),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.paddingLow,
            child: MovieButton(movie: movies?[index] ?? Movie()),
          );
        },
      ),
    );
  }
}
