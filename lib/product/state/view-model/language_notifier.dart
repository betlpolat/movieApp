import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../init/cache/cache_keys.dart';
import '../../utility/enum/locales.dart';

class LanguageNotifier extends ChangeNotifier {
  bool isEnglish =
      SharedCacheOperation().readBool(key: CacheKeys.language.name);
  Locales? get currentLanguage => isEnglish ? Locales.en : Locales.de;

  Future<void> changeLanguage(BuildContext context) async {
    final currentLocal = EasyLocalization.of(context)!.currentLocale;

    if (currentLocal == Locales.en.locale) {
      isEnglish = false;

      await EasyLocalization.of(context)!.setLocale(Locales.de.locale);
      await SharedCacheOperation()
          .writeBool(key: CacheKeys.language.name, value: false);

      notifyListeners();
    } else {
      isEnglish = true;

      await EasyLocalization.of(context)!.setLocale(Locales.en.locale);
      await SharedCacheOperation()
          .writeBool(key: CacheKeys.language.name, value: true);

      notifyListeners();
    }
  }
}
