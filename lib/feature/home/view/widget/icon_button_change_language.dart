import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/context_extension.dart';

class IconButtonChangeLanguage extends StatelessWidget {
  const IconButtonChangeLanguage({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.homeCubit.changeLanguage(context),
      icon: const Icon(Icons.language_outlined),
    );
  }
}
