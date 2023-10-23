import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/product/constants/border_radius.dart';
import 'package:movie_app/product/constants/padding.dart';
import 'package:movie_app/product/language/language_items.dart';
import '../../../product/constants/app_colors.dart';
import '../../home/model/movies.dart';

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
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1)),
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
