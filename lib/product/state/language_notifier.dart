import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/product/init/cache/cache_keys.dart';

import '../utility/enum/locales.dart';

class LanguageNotifier extends ChangeNotifier {
  bool isEnglish = CacheKeys.language.readBool;
  Locales? get currentLanguage => isEnglish ? Locales.en : Locales.de;

  Future<void> changeLanguage(BuildContext context) async {
    final currentLocal = EasyLocalization.of(context)!.currentLocale;

    if (currentLocal == Locales.en.locale) {
      isEnglish = false;

      await EasyLocalization.of(context)!.setLocale(Locales.de.locale);
      await CacheKeys.language.writeBool(value: false);

      notifyListeners();
    } else {
      isEnglish = true;

      await EasyLocalization.of(context)!.setLocale(Locales.en.locale);
      await CacheKeys.language.writeBool(value: true);

      notifyListeners();
    }
  }
}
