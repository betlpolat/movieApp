import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/feature/detail/view/widget/rating_field.dart';
import 'package:movie_app/feature/detail/view/widget/release_field.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/constants/padding.dart';
import 'package:movie_app/product/init/language/locale_keys.g.dart';

part 'movie_infos.g.dart';

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
            _OverviewTitle(titleTextSize: _titleTextSize),
            const _SizedBBox(),
            _OverviewText(movie: movie, textSize: _textSize),
            const _SizedBBox(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ReleaseField(movie: movie),
              RatingField(movie: movie),
            ]),
          ],
        ),
      ),
    );
  }
}
