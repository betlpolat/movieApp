import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../product/mixin/navigate_manager.dart';
import '../../../product/widget/network_image_with_radius.dart';
import '../../detail/view/detail_view.dart';
import '../model/movies.dart';

class CarouselMovieItems extends StatelessWidget with NavigatorManager {
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
            onTap: () {
              navigateToWidget(
                context,
                DetailView(
                  movie: movies?[index],
                ),
              );
            },
            child: NetworkImageWithRadius(movie: movies?[index]),
          );
        }),
        options: _carouselOptions(),
      ),
    );
  }

  CarouselOptions _carouselOptions() {
    return CarouselOptions(
      height: 300,
      autoPlay: true,
      viewportFraction: 0.55,
      enlargeCenterPage: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      autoPlayAnimationDuration: const Duration(seconds: 2),
    );
  }
}
