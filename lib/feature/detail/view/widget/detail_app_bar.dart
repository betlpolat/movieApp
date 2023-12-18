import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../../../../product/utility/enum/widget_size.dart';
import '../../../../product/widget/button/arrow_back_icon_button.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';
import '../../../home/model/movies.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
    required this.movie,
  });

  final Movie? movie;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      expandedHeight: WidgetSize.expanded.value,
      pinned: true,
      floating: true,
      leading: const ArrowBackIconButton(),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          movie?.title ?? "",
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        background:
            NetworkImageWithRadius(posterPathValue: movie?.posterPathValue),
      ),
    );
  }
}
