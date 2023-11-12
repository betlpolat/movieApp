import 'package:flutter/material.dart';

@immutable
class CoreLocalize {
  final path = 'assets/translations';
  final List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR'),
  ];
}
