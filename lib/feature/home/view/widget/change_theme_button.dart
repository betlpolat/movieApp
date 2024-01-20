import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../../../../product/state/theme_notifier.dart';

part '../mixin/change_theme_button_mixin.dart';

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton>
    with TickerProviderStateMixin, _ChangeThemeButtonMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Future.microtask(() {
          context.read<ThemeNotifier>().changeTheme();
          controller.animateTo(isLight ? 0.5 : 1);
        });

        isLight = !isLight;
      },
      child: Assets.lottie.lottieThemeChange.lottie(
        package: 'gen',
        controller: controller,
      ),
    );
  }
}
