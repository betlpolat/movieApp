import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/cubit/home/home_cubit.dart';
import 'package:movie_app/feature/home/cubit/search/search_cubit.dart';
import 'feature/home/service/movie_service.dart';
import 'product/init/application_init.dart';
import 'product/init/language/locale_keys.g.dart';
import 'product/init/navigator/navigator_manager.dart';
import 'product/init/navigator/navigator_routes.dart';
import 'product/init/network_manager.dart';
import 'product/init/theme/app_theme.dart';

void main() async {
  final initialManager = ApplicationInit();
  await initialManager.start();

  runApp(EasyLocalization(
    supportedLocales: initialManager.localize.supportedLocales,
    path: initialManager.localize.path,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget with NavigatorRoutesMixin {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: (LocaleKeys.title_app),
      theme: AppTheme().theme,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
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
