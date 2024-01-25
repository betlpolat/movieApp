// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

import '../../utility/function/navigate_to_detail.dart';
import '../image/network_image_with_radius.dart';

class MovieButton extends StatelessWidget {
  const MovieButton({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => navigateToDetail(movie: movie),
      child: NetworkImageWithRadius(
        posterPathValue: movie.posterPathValue,
      ),
    );
  }
}
