import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import '../../../../product/utility/constants/index.dart';
import '../../../home/model/movies.dart';
import '../../../../product/utility/border_radius/app_border_radius.dart';
import '../../../../product/init/language/locale_keys.g.dart';

class RatingField extends StatelessWidget {
  const RatingField({
    super.key,
    required this.movie,
  });

  final Movie? movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingConstant.paddingAllLow,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.black),
        borderRadius: AppBorderRadius().appborderRadiusLow,
      ),
      child: Row(
        children: [
          Text(
            "${LocaleKeys.text_rating.tr()}: ",
            style: GoogleFonts.roboto(
              textStyle: context.general.textTheme.bodyLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.star,
            color: ColorConstant.amber,
          ),
          Text(
            "${(movie?.voteAverage ?? 0).toStringAsFixed(1)}/10",
            style: GoogleFonts.roboto(
              textStyle: context.general.textTheme.bodyLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
