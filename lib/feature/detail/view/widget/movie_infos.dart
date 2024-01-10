import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/utility/enum/widget_size.dart';
import '../../../home/model/movies.dart';
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
                textStyle:
                    context.textTheme.headlineLarge ?? const TextStyle()),
            const _SizedBBox(),
            _OverviewText(
                movie: movie,
                textStyle:
                    context.textTheme.headlineSmall ?? const TextStyle()),
            const _SizedBBox(),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ReleaseField(movie: movie),
              SizedBox(
                height: WidgetSize.sizeBoxed.value,
              ),
              RatingField(movie: movie),
            ]),
          ],
        ),
      ),
    );
  }
}
