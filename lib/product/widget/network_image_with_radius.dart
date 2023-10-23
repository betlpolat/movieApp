import 'package:flutter/material.dart';
import 'package:movie_app/product/constants/border_radius.dart';
import '../../feature/home/model/movies.dart';
import '../constants/app_path.dart';

class NetworkImageWithRadius extends StatelessWidget {
  const NetworkImageWithRadius({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius().appborderRadius,
      child: Image.network(
        AppPath().imagePath + (movie?.posterPath ?? ""),
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      ),
    );
  }
}
