import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/cubit/home/home_cubit.dart';
import 'package:movie_app/product/utility/enum/language_code.dart';

class LanguageNotifer extends ChangeNotifier {
  LanguageCode? currentLanguage = LanguageCode.english;
  void changeLanguge(BuildContext context) {
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
