import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/utility/constants/padding_constant.dart';
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
              padding: PaddingConstant.paddingAll,
              child: GestureDetector(
                onTap: () async {
                  await NavigatorManager.instance
                      .pushToPage(route: NavigatorRoutes.homeDetail, arguments: movies?[index]);
                },
                child: NetworkImageWithRadius(posterPathValue: movies?[index]?.posterPathValue),
              ),
            );
          }),
    );
  }
}
