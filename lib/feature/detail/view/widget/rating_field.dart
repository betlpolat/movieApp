import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/constants/app_colors.dart';
import 'package:movie_app/product/constants/border_radius.dart';
import 'package:movie_app/product/constants/padding.dart';
import 'package:movie_app/product/init/language/language_items.dart';

class RatingField extends StatelessWidget {
  const RatingField({
    super.key,
    required this.movie,
  });

  final Movie? movie;
  final double _textSize = 17;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding().paddingAllLow,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors().black),
        borderRadius: AppBorderRadius().appborderRadiusLow,
      ),
      child: Row(
        children: [
          Text(
            "${LanguageItems.ratingText}: ",
            style: GoogleFonts.roboto(
              fontSize: _textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.star,
            color: AppColors().amber,
          ),
          Text(
            "${(movie?.voteAverage ?? 0).toStringAsFixed(1)}/10",
            style: GoogleFonts.roboto(
              fontSize: _textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
