import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/cubit/home_cubit.dart';
import 'package:movie_app/feature/home/service/movie_service.dart';
import 'package:movie_app/feature/home/view/home_view.dart';
import 'package:movie_app/product/language/language_items.dart';
import 'package:movie_app/product/theme/app_theme.dart';

import 'core/mixin/project_dio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LanguageItems.appTitle,
      theme: AppTheme().theme,
      home: const BlocWidget(),
    );
  }
}

class BlocWidget extends StatefulWidget {
  const BlocWidget({
    super.key,
  });

  @override
  State<BlocWidget> createState() => _BlocWidgetState();
}

class _BlocWidgetState extends State<BlocWidget> with ProjectDio {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(MovieService(dio)),
      child: const HomeView(),
    );
  }
}
