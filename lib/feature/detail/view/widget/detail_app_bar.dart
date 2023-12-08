import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/utility/enum/widget_size.dart';
import 'package:movie_app/product/widget/button/arrow_back_icon_button.dart';
import 'package:movie_app/product/widget/image/network_image_with_radius.dart';

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
          style: context.general.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        background:
            NetworkImageWithRadius(posterPathValue: movie?.posterPathValue),
      ),
    );
  }
}
