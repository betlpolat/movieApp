import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/view-model/home/home_cubit.dart';
import '../utility/enum/language_code.dart';

class LanguageNotifier extends ChangeNotifier {
  LanguageCode? currentLanguage = LanguageCode.english;
  void changeLanguage(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;

    if (currentLocal == const Locale('en', 'US')) {
      currentLanguage = LanguageCode.german;
      notifyListeners();
      context.read<HomeCubit>().getMovie(currentLanguage!);

      EasyLocalization.of(context)!.setLocale(const Locale('de', 'DE'));
    } else {
      currentLanguage = LanguageCode.english;
      notifyListeners();
      context.read<HomeCubit>().getMovie(currentLanguage!);

      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }
}
