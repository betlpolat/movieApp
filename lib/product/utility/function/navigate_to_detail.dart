import 'package:flutter/material.dart';

import '../../../feature/home/model/movies.dart';
import '../../init/navigator/navigator_manager.dart';
import '../../init/navigator/navigator_routes.dart';

Future<void> navigateToDetail({required Movie movie}) async {
  {
    await NavigatorManager.instance.pushToPage<Widget>(
      route: NavigatorRoutes.homeDetail,
      fullScreenDialog: true,
      arguments: movie,
    );
  }
}
