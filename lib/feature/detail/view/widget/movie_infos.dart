import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/widget/decoration/sized_box_normal.dart';
import 'rating_field.dart';
import 'release_field.dart';

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
        padding: context.paddingMedium,
        child: Column(
          children: [
            _OverviewTitle(
              textStyle: context.textTheme.headlineLarge ?? const TextStyle(),
            ),
            const SizedBoxNormal(),
            _OverviewText(
              movie: movie,
              textStyle: context.textTheme.headlineSmall ?? const TextStyle(),
            ),
            const SizedBoxNormal(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReleaseField(releaseDate: movie?.releaseDate.toString() ?? ''),
                RatingField(voteAverage: movie?.voteAverage ?? 0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
