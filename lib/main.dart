import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/cubit/home_cubit.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/product/init/network_manager.dart';
import 'package:movie_app/product/language/language_items.dart';
import 'package:movie_app/product/navigator/navigator_manager.dart';
import 'package:movie_app/product/navigator/navigator_routes.dart';
import 'package:movie_app/product/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget with NavigatorRoutesMixin {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LanguageItems.appTitle,
      theme: AppTheme().theme,
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
    return BlocProvider(
      create: (_) => HomeCubit(MovieService(NetworkManager.instance.service)),
      child: widget,
    );
  }
}
