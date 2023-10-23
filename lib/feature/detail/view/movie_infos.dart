import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/feature/detail/view/rating_field.dart';
import 'package:movie_app/feature/detail/view/release_field.dart';
import 'package:movie_app/product/constants/padding.dart';

import '../../../product/language/language_items.dart';
import '../../home/model/movies.dart';

class MovieInfos extends StatelessWidget {
  const MovieInfos({
    super.key,
    required this.movie,
  });

  final Movie? movie;
  final double _titleTextSize = 30;
  final double _textSize = 25;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppPadding().paddingAll,
        child: Column(
          children: [
            _overviewTitle(),
            _sizedBBox(),
            _overviewText(),
            _sizedBBox(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ReleaseField(movie: movie),
              RatingField(movie: movie),
            ]),
          ],
        ),
      ),
    );
  }

  SizedBox _sizedBBox() => const SizedBox(height: 16);

  Text _overviewText() {
    return Text(
      movie?.overview ?? "",
      style: GoogleFonts.roboto(
        fontSize: _textSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text _overviewTitle() {
    return Text(
      LanguageItems.overviewTitle,
      style: GoogleFonts.openSans(
        fontSize: _titleTextSize,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
