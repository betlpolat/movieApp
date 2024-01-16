import 'package:flutter/material.dart';

enum Locales {
  de(Locale('de', 'DE'), 'de-DE'),
  en(Locale('en', 'US'), 'en-US');

  const Locales(this.locale, this.code);
  final Locale locale;
  final String code;
}
