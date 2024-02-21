part of 'theme_button.dart';

mixin _ThemeButtonMixin
    on TickerProviderStateMixin<ThemeButton>, State<ThemeButton> {
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

  Future<void> changeTheme() async {
    {
      await Future.microtask(() {
        context.read<ThemeNotifier>().changeTheme();
        controller.animateTo(isLight ? 0.5 : 1);
      });

      isLight = !isLight;
    }
  }
}
