import 'package:flutter/material.dart';
import 'package:movie_app/product/utility/border_radius/app_border_radius.dart';

class NetworkImageWithRadius extends StatelessWidget {
  const NetworkImageWithRadius({
    super.key,
    required this.posterPathValue,
  });

  final String? posterPathValue;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius().appBorderRadius,
      child: Image.network(
        posterPathValue ?? "",
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
