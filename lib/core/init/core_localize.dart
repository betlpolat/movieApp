import 'package:flutter/material.dart';

@immutable
class CoreLocalize {
  const CoreLocalize._();
  static CoreLocalize instance = const CoreLocalize._();
  String get path => 'asset/translations';
  Locale get enLocale => const Locale('en', 'US');
  Locale get deLocale => const Locale('de', 'DE');
  List<Locale> get supportedLocales => [
        deLocale,
        enLocale,
      ];
}
