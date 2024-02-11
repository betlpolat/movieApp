import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

import '../../../../product/init/language/locale_keys.g.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, required this.controller, required this.onChanged});
  final TextEditingController controller;
  final void Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.textTheme.bodyLarge,
      onChanged: (value) async => onChanged(value),
      controller: controller,
      decoration: InputDecoration(
        hintStyle: context.textTheme.bodyLarge,
        border: const OutlineInputBorder(),
        hintText: LocaleKeys.text_search.locale,
      ),
      cursorColor: context.colors.onSurface,
    );
  }
}
