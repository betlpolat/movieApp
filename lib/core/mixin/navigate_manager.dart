import 'package:flutter/material.dart';

mixin NavigatorManager {
  Future<T?> navigateToWidget<T>(BuildContext context, {required Widget widget, bool fullScreenDialog = false}) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog: fullScreenDialog,
      ),
    );
  }
}
