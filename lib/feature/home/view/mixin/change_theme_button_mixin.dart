part of '../widget/change_theme_button.dart';

mixin _ChangeThemeButtonMixin
    on TickerProviderStateMixin<ChangeThemeButton>, State<ChangeThemeButton> {
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
}
