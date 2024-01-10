import 'package:flutter/material.dart';

import '../../../feature/detail/view/detail_view.dart';
import '../../../feature/home/model/movies.dart';
import '../../../feature/home/view/home_view.dart';
import '../../../main.dart';
import '../../state/bloc_widget.dart';

mixin NavigatorRoutesMixin<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if ((routeSettings.name?.isEmpty ?? true) || (routeSettings.name == '/')) {
      return _navigateToNormal(
        const BlocWidget(
          widget: HomeView(),
        ),
      );
    }

    final routes =
        NavigatorRoutes.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      case NavigatorRoutes.home:
        return _navigateToNormal(const HomeView());
      case NavigatorRoutes.homeDetail:
        final movie = routeSettings.arguments;
        return _navigateToNormal(
          DetailView(movie: movie is Movie ? movie : null),
        );
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}

enum NavigatorRoutes { home, homeDetail }

extension NavigatorRoutesExtension on NavigatorRoutes {
  String get withSlash => '/$name';
}
