import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/state/language_notifier.dart';
import '../../cubit/home/home_cubit.dart';
import '../home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  @override
  void initState() {
    super.initState();
    final currentLanguage = context.read<LanguageNotifier>().currentLanguage;
    context.read<HomeCubit>().getMovie(currentLanguage!);
  }
}
