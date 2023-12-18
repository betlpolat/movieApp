import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../../../../product/state/theme_notifier.dart';
import '../../../../product/widget/icon/theme_change_lottie.dart';

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    isLight = context.read<ThemeNotifier>().isLightTheme;

    controller =
        AnimationController(duration: context.durationHigh, vsync: this);
    Future.microtask(() {
      controller.animateTo(isLight ? 0 : 0.5);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          Future.microtask(() {
            context.read<ThemeNotifier>().changeTheme();
            controller.animateTo(isLight ? 1 : 0.5);
          });

          isLight = !isLight;
        },
        child: ThemeChangeLottie(
          controller: controller,
        ));
  }
}
