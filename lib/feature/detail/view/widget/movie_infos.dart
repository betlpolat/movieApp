import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/extension/string_extension.dart';
import 'package:movie_app/feature/detail/view/widget/rating_field.dart';
import 'package:movie_app/feature/detail/view/widget/release_field.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/init/language/locale_keys.g.dart';
import 'package:movie_app/product/utility/constants/index.dart';
import 'package:movie_app/product/utility/enum/widget_size.dart';
part 'movie_infos.g.dart';

class MovieInfos extends StatelessWidget {
  const MovieInfos({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: PaddingConstant.paddingAll,
        child: Column(
          children: [
            _OverviewTitle(textStyle: context.general.textTheme.headlineLarge ?? const TextStyle()),
            const _SizedBBox(),
            _OverviewText(movie: movie, textStyle: context.general.textTheme.headlineSmall ?? const TextStyle()),
            const _SizedBBox(),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ReleaseField(movie: movie),
              RatingField(movie: movie),
            ]),
          ],
        ),
      ),
    );
  }
}
