import 'package:flutter/material.dart';

@immutable
class CoreLocalize {
  const CoreLocalize._();
  static CoreLocalize instance = const CoreLocalize._();
  final path = 'asset/translations';
  final enLocale = const Locale('en', 'US');
  final deLocale = const Locale('de', 'DE');
  List<Locale> get supportedLocales => [
        deLocale,
        enLocale,
      ];
}
