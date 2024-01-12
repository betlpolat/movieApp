import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view-model/home/home_cubit.dart';
import '../home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getMovie(context);
  }
}
