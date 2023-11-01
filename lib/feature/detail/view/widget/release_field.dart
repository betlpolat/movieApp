import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/product/constants/border_radius.dart';
import 'package:movie_app/product/constants/padding.dart';

import '../../../../product/constants/app_colors.dart';
import '../../../../product/language/language_items.dart';
import '../../../home/model/movies.dart';

class ReleaseField extends StatelessWidget {
  const ReleaseField({
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
            "${LanguageItems.releaseText}: ${movie?.releaseDate ?? ""}",
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
