import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utility/enum/language_code.dart';

class LanguageNotifier extends ChangeNotifier {
  LanguageCode? currentLanguage = LanguageCode.english;

  Future<void> startLocalization(BuildContext context) async {
    final currentLocal = EasyLocalization.of(context)!.currentLocale;
    print(currentLocal);
    if (currentLocal == const Locale('en', 'US')) {
      currentLanguage = LanguageCode.german;
      notifyListeners();
    } else {
      currentLanguage = LanguageCode.german;
      notifyListeners();
    }
  }

  void changeLanguage(BuildContext context) {
    final currentLocal = EasyLocalization.of(context)!.currentLocale;

    if (currentLocal == const Locale('en', 'US')) {
      currentLanguage = LanguageCode.german;
      notifyListeners();

      EasyLocalization.of(context)!.setLocale(const Locale('de', 'DE'));
    } else {
      currentLanguage = LanguageCode.english;
      notifyListeners();
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }
}
