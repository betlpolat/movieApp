import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/home/view-model/home/home_view_model.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async => _changeLanguage(context),
      icon: const Icon(Icons.language_outlined),
    );
  }

  Future<void> _changeLanguage(BuildContext context) =>
      context.read<HomeViewModel>().changeLanguage(context);
}
