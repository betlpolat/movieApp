import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view-model/home/home_cubit.dart';

class IconButtonChangeLanguage extends StatelessWidget {
  const IconButtonChangeLanguage({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().changeLanguage(context),
      icon: const Icon(Icons.language_outlined),
    );
  }
}
