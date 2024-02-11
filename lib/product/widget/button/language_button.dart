import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.onPressed,
  });
  final AsyncCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.language_outlined),
    );
  }
}
