import 'package:flutter/material.dart';

mixin NavigatorManager {
  Future<T?> navigateToWidget<T>(BuildContext context, Widget widget) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog: true,
      ),
    );
  }
}
