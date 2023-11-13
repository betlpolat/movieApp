import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/product/constants/border_radius.dart';

class NetworkImageWithRadius extends StatelessWidget {
  const NetworkImageWithRadius({
    super.key,
    required this.posterPathValue,
  });

  final String? posterPathValue;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius().appborderRadius,
      child: Image.network(
        posterPathValue ?? "",
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      ),
    );
  }
}
