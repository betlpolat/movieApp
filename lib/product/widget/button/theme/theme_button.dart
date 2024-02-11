import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

import '../../../state/view-model/theme_notifier.dart';

part 'theme_button_mixin.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton>
    with TickerProviderStateMixin, _ThemeButtonMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => changeTheme(),
      child: Assets.lottie.lottieThemeChange.lottie(
        package: 'gen',
        controller: controller,
      ),
    );
  }
}
