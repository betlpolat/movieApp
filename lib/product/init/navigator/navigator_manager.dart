import 'package:flutter/material.dart';

import 'navigator_routes.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();
  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage<T>(
      {required NavigatorRoutes route,
      Object? arguments,
      bool fullScreenDialog = false}) async {
    await _navigatorGlobalKey.currentState
        ?.pushNamed(route.withSlash, arguments: arguments);
  }
}
