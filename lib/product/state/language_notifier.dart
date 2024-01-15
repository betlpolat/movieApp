import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/product/init/cache/cache_keys.dart';

import '../utility/enum/language_code.dart';

class LanguageNotifier extends ChangeNotifier {
  bool isEnglish = CacheKeys.language.readBool;
  LanguageCode? get currentLanguage =>
      isEnglish ? LanguageCode.english : LanguageCode.german;

  Future<void> changeLanguage(BuildContext context) async {
    final currentLocal = EasyLocalization.of(context)!.currentLocale;

    if (currentLocal == const Locale('en', 'US')) {
      isEnglish = false;

      await EasyLocalization.of(context)!.setLocale(const Locale('de', 'DE'));
      await CacheKeys.language.writeBool(value: false);

      notifyListeners();
    } else {
      isEnglish = true;

      await EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
      await CacheKeys.language.writeBool(value: true);

      notifyListeners();
    }
  }
}
