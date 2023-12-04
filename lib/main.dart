import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'feature/home/cubit/home/index.dart';
import 'feature/home/cubit/search/index.dart';
import 'feature/home/service/movie_service.dart';
import 'product/init/application_init.dart';
import 'product/init/language/locale_keys.g.dart';
import 'product/init/navigator/index.dart';
import 'product/init/network/network_manager.dart';
import 'product/init/theme/theme_notifier.dart';

void main() async {
  final initialManager = ApplicationInit.instance;
  await initialManager.start();

  runApp(EasyLocalization(
    supportedLocales: initialManager.localize.supportedLocales,
    path: initialManager.localize.path,
    child: MultiProvider(
      providers: initialManager.providers,
      builder: (context, child) => const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget with NavigatorRoutesMixin {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: (LocaleKeys.title_app),
      theme: context.watch<ThemeNotifer>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      onGenerateRoute: onGnerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
    );
  }
}

class BlocWidget extends StatelessWidget {
  const BlocWidget({
    super.key,
    required this.widget,
  });

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => HomeCubit(MovieService(NetworkManager.instance.service))),
        BlocProvider<SearchCubit>(create: (_) => SearchCubit(MovieService(NetworkManager.instance.service))),
      ],
      child: widget,
    );
  }
}
