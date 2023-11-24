import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/utility/app_duration.dart';
import 'package:movie_app/product/utility/enum/widget_size.dart';
import '../../../../product/init/navigator/index.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';

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
        itemBuilder: ((context, index, realIndex) {
          return GestureDetector(
            onTap: () async {
              await NavigatorManager.instance
                  .pushToPage(route: NavigatorRoutes.homeDetail, fullScreenDialog: true, arguments: movies?[index]);
            },
            child: NetworkImageWithRadius(posterPathValue: movies?[index]?.posterPathValue),
          );
        }),
        options: _carouselOptions(),
      ),
    );
  }

  CarouselOptions _carouselOptions() {
    return CarouselOptions(
      height: WidgetSize.carousel.value,
      autoPlay: true,
      viewportFraction: 0.55,
      enlargeCenterPage: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      autoPlayAnimationDuration: AppDuration.low,
    );
  }
}
