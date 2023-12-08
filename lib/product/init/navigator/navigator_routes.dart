import 'package:flutter/material.dart';
import 'package:movie_app/feature/detail/view/detail_view.dart';
import 'package:movie_app/feature/home/model/movies.dart';
import 'package:movie_app/feature/home/view/home_view.dart';
import 'package:movie_app/main.dart';

mixin NavigatorRoutesMixin<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if ((routeSettings.name?.isEmpty ?? true) || (routeSettings.name == "/")) {
      return _navigateToNormal(const BlocWidget(
        widget: HomeView(),
      ));
    }

    final routes =
        NavigatorRoutes.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      case NavigatorRoutes.home:
        return _navigateToNormal(const HomeView());
      case NavigatorRoutes.homeDetail:
        final movie = routeSettings.arguments;
        return _navigateToNormal(
            DetailView(movie: movie is Movie ? movie : null));
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}

enum NavigatorRoutes { home, homeDetail }

extension NavigatorRoutesExtension on NavigatorRoutes {
  String get withSlash => "/$name";
}
