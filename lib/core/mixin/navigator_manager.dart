import 'package:flutter/material.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();
  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<T?> pushToPage<T>(BuildContext context, {required Widget widget, bool fullScreenDialog = false}) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog: fullScreenDialog,
      ),
    );
  }
}
