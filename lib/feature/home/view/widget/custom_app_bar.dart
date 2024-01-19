import 'package:flutter/material.dart';

import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import 'change_theme_button.dart';
import 'icon_button_change_language.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: const IconButtonChangeLanguage(),
      actions: const [
        SizedBox(
          child: ChangeThemeButton(),
        ),
      ],
      title: Text(LocaleKeys.title_app.locale),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
