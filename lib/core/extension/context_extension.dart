import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/view-model/home/home_view_model.dart';
import '../../feature/home/view-model/search/search_view_model.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double dynamicHeight(double val) => height * val;
  double dynamicWidth(double val) => width * val;

  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  double get lowValueWidth => width * 0.001;
  double get normalValueWidth => width * 0.02;
  double get mediumValueWidth => width * 0.04;
  double get highValueWidth => width * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension LocalizationExtension on BuildContext {
  Locale? get currentLocale => EasyLocalization.of(this)!.currentLocale;
}

extension CubitExtension on BuildContext {
  HomeViewModel get homeCubit => read<HomeViewModel>();
  SearchViewModel get searchCubit => read<SearchViewModel>();
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
  EdgeInsets get paddingLowWidth => EdgeInsets.all(lowValueWidth);
  EdgeInsets get paddingNormalWidth => EdgeInsets.all(normalValueWidth);
  EdgeInsets get paddingMediumWidth => EdgeInsets.all(mediumValueWidth);
  EdgeInsets get paddingHighWidth => EdgeInsets.all(highValueWidth);
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingNormalTopLeft =>
      EdgeInsets.only(top: normalValue, left: normalValue);
}

extension PaddingExtensionSymmetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension DurationExtension on BuildContext {
  Duration get durationLow => const Duration(milliseconds: 500);
  Duration get durationNormal => const Duration(seconds: 1);
  Duration get durationHigh => const Duration(seconds: 2);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get lowBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.02));
  BorderRadius get normalBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.05));
  BorderRadius get highBorderRadius =>
      BorderRadius.all(Radius.circular(width * 0.1));
}
