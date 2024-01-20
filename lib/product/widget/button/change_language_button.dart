import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

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
      context.homeCubit.changeLanguage(context);
}
