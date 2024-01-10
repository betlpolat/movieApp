import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/view-model/home/index.dart';
import '../../feature/home/view-model/search/search_cubit.dart';

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
        BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
        BlocProvider<SearchCubit>(create: (_) => SearchCubit()),
      ],
      child: widget,
    );
  }
}
