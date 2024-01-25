import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

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
