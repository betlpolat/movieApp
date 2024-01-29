import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class AdaptPaddingLow extends StatelessWidget {
  const AdaptPaddingLow({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AdaptAllView(
      phone: Padding(
        padding: context.paddingLow,
        child: child,
      ),
      tablet: Padding(
        padding: context.paddingLowWidth,
        child: child,
      ),
      desktop: Padding(
        padding: context.paddingLowWidth,
        child: child,
      ),
    );
  }
}
