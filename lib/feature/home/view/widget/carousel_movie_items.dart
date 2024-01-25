import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../product/widget/button/movie_button.dart';

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
          return MovieButton(movie: movies?[index] ?? Movie());
        },
        options: _carouselOptions(context: context),
      ),
    );
  }

  CarouselOptions _carouselOptions({required BuildContext context}) {
    return CarouselOptions(
      height: context.dynamicHeight(0.3),
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.4,
      autoPlayAnimationDuration: context.durationHigh,
    );
  }
}
