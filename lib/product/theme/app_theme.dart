import 'package:flutter/material.dart';
import 'package:movie_app/product/constants/app_colors.dart';

class AppTheme {
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors().grey,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors().grey,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColors().red,
      ),
    ),
  );
}
