import 'package:flutter/material.dart';
import 'package:movie_app/feature/detail/view/detail_view.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/constants/padding.dart';
import 'package:movie_app/product/init/navigator/navigator_manager.dart';
import 'package:movie_app/product/init/navigator/navigator_routes.dart';
import 'package:movie_app/product/widget/network_image_with_radius.dart';

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
                onTap: () async {
                  await NavigatorManager.instance
                      .pushToPage(route: NavigatorRoutes.homeDetail, arguments: movies?[index]);
                },
                child: NetworkImageWithRadius(movie: movies?[index]),
              ),
            );
          }),
    );
  }
}
