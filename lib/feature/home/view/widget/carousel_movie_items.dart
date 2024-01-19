import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../product/init/navigator/index.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';
import '../../model/movies.dart';

class CarouselMovieItems extends StatelessWidget {
  const CarouselMovieItems({
    super.key,
    required this.movies,
  });

  final List<Movie?>? movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: movies?.length ?? 0,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () async {
              await NavigatorManager.instance.pushToPage<Widget>(
                route: NavigatorRoutes.homeDetail,
                fullScreenDialog: true,
                arguments: movies?[index],
              );
            },
            child: NetworkImageWithRadius(
              posterPathValue: movies?[index]?.posterPathValue,
            ),
          );
        },
        options: _carouselOptions(context: context),
      ),
    );
  }

  CarouselOptions _carouselOptions({required BuildContext context}) {
    return CarouselOptions(
      height: context.height / 3,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.4,
      autoPlayAnimationDuration: context.durationHigh,
    );
  }
}
