import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets/widgets.dart';

import '../product/init/application_initialize.dart';
import '../product/init/language/locale_keys.g.dart';
import '../product/init/language/product_localization.dart';
import '../product/init/navigator/navigator_manager.dart';
import '../product/init/navigator/navigator_routes.dart';
import '../product/state/view-model/theme_notifier.dart';

Future<void> main() async {
  await ApplicationInitialize().start();

  runApp(
    DevicePreview(
      builder: (context) => ProductLocalization(
        child: MultiProvider(
          providers: ApplicationInitialize().providers,
          builder: (context, child) => const _MyApp(),
        ),
      ),
    ),
  );
}

class _MyApp extends StatelessWidget with NavigatorRoutesMixin<dynamic> {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LocaleKeys.title_app,
      builder: CustomResponsive.build,
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
    );
  }
}
