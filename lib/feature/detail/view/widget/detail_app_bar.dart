import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../product/widget/button/arrow_back_icon_button.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
    required this.movie,
  });

  final Movie? movie;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      expandedHeight: context.dynamicHeight(0.5),
      floating: true,
      leading: const ArrowBackIconButton(),
      flexibleSpace: FlexibleSpaceBar(
        title: _movieTitle(context),
        background: _movieImage(),
      ),
    );
  }

  Text _movieTitle(BuildContext context) {
    return Text(
      movie?.title ?? '',
      style: context.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  NetworkImageWithRadius _movieImage() =>
      NetworkImageWithRadius(posterPathValue: movie?.posterPathValue);
}
