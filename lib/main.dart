import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/product/init/language/product_localization.dart';
import 'package:provider/provider.dart';

import 'product/init/application_init.dart';
import 'product/init/language/locale_keys.g.dart';
import 'product/init/navigator/index.dart';
import 'product/state/theme_notifier.dart';

void main() async {
  final initialManager = ApplicationInit.instance;
  await initialManager.start();

  runApp(
    ProductLocalization(
      child: MultiProvider(
        providers: initialManager.providers,
        builder: (context, child) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget with NavigatorRoutesMixin {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LocaleKeys.title_app,
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
    );
  }
}
