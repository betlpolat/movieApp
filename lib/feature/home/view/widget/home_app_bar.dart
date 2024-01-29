import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/widget/button/change_language_button.dart';
import '../../../../product/widget/button/change_theme/change_theme_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const ChangeLanguageButton(),
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
