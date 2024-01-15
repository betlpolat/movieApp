import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.homeCubit.getMovie(context);
  }
}
