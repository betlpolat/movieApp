import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../state/view-model/theme_notifier.dart';

part 'change_theme_button_mixin.dart';

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
      onTap: () async => changeTheme(),
      child: Assets.lottie.lottieThemeChange.lottie(
        package: 'gen',
        controller: controller,
      ),
    );
  }
}
