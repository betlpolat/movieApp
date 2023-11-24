import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/widget/button/arrow_back_icon_button.dart';
import 'package:kartal/kartal.dart';
import '../../../../product/widget/index.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
    required this.movie,
  });

  final Movie? movie;
  final double _expandedHeight = 500;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      expandedHeight: _expandedHeight,
      pinned: true,
      floating: true,
      leading: const ArrowBackIconButton(),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          movie?.title ?? "",
          style: GoogleFonts.belleza(
            textStyle: context.general.textTheme.bodyLarge,
            fontWeight: FontWeight.w600,
          ),
        ),
        background: NetworkImageWithRadius(posterPathValue: movie?.posterPathValue),
      ),
    );
  }
}
