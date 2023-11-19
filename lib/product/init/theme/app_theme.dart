import 'package:flutter/material.dart';
import 'package:movie_app/product/utility/constants/color_constant.dart';

class AppTheme {
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ColorConstant.grey,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstant.grey,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: ColorConstant.red,
      ),
    ),
  );
}
