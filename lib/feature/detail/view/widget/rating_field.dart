import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../home/model/movies.dart';

class RatingField extends StatelessWidget {
  const RatingField({
    super.key,
    required this.movie,
  });

  final Movie? movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.onSurface),
        borderRadius: context.borderRadiusLow,
      ),
      child: Row(
        children: [
          Text("${LocaleKeys.text_rating.locale}: ",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              )),
          Icon(Icons.star, color: context.colors.tertiary),
          Text("${(movie?.voteAverage ?? 0).toStringAsFixed(1)}/10",
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
