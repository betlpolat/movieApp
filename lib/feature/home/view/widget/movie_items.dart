import 'package:flutter/material.dart';

import '../../../../product/constants/padding.dart';
import '../../../../product/widget/network_image_with_radius.dart';
import '../../../detail/view/detail_view.dart';
import '../../model/movies.dart';

class MovieItems extends StatelessWidget {
  const MovieItems({
    super.key,
    required this.movies,
  });

  final List<Movie?>? movies;
  final double _imageHeight = 200;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _imageHeight,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: AppPadding().paddingAll,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailView(
                                movie: movies?[index],
                              )));
                },
                child: NetworkImageWithRadius(movie: movies?[index]),
              ),
            );
          }),
    );
  }
}
