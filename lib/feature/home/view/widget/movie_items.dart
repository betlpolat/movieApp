import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../../../../product/init/navigator/index.dart';
import '../../../../product/utility/enum/widget_size.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';
import '../../model/movies.dart';

class MovieItems extends StatelessWidget {
  const MovieItems({
    super.key,
    required this.movies,
  });

  final List<Movie?>? movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize.image.value,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.paddingLow,
              child: GestureDetector(
                onTap: () async {
                  await NavigatorManager.instance.pushToPage(
                      route: NavigatorRoutes.homeDetail,
                      arguments: movies?[index]);
                },
                child: NetworkImageWithRadius(
                    posterPathValue: movies?[index]?.posterPathValue),
              ),
            );
          }),
    );
  }
}
