import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/utility/border_radius/app_border_radius.dart';
import '../../../../product/utility/constants/index.dart';
import '../../../home/model/movies.dart';

class ReleaseField extends StatelessWidget {
  const ReleaseField({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingConstant.paddingAllLow,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
        borderRadius: AppBorderRadius().appBorderRadiusLow,
      ),
      child: Row(
        children: [
          Text(
            "${LocaleKeys.text_release.locale}: ${movie?.releaseDate ?? ""}",
            style: context.general.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
