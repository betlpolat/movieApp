import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/widget/button/language_button.dart';
import '../../../../product/widget/button/theme/theme_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.onPressedLanguageButton,
  });
  final AsyncCallback? onPressedLanguageButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: LanguageButton(
        onPressed: onPressedLanguageButton,
      ),
      actions: const [
        SizedBox(
          child: ThemeButton(),
        ),
      ],
      title: Text(LocaleKeys.title_app.locale),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
