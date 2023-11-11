import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/widget/button/arrow_back_icon_button.dart';
import 'package:movie_app/product/widget/network_image_with_radius.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
    required this.movie,
  });

  final Movie? movie;
  final double _expandedHeight = 500;
  final double _fontSize = 17;
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
            fontSize: _fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        background: NetworkImageWithRadius(movie: movie),
      ),
    );
  }
}
