import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CardAnimation extends StatelessWidget {
  const CardAnimation({
    super.key,
    required this.closedBuilder,
    this.transitionType = ContainerTransitionType.fadeThrough,
    this.onClosed,
    required this.child,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?>? onClosed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return child;
      },
      onClosed: onClosed,
      closedBuilder: closedBuilder,
    );
  }
}
