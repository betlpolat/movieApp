import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../product/constants/app_colors.dart';
import '../../../../product/constants/border_radius.dart';
import '../../../../product/init/language/locale_keys.g.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final double _textSize = 20;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: _textSize,
      ),
      controller: _searchController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors().white,
            ),
            borderRadius: AppBorderRadius().appborderRadius,
          ),
          hintText: LocaleKeys.text_search.tr(),
          hintStyle: TextStyle(
            fontSize: _textSize,
          ),
          fillColor: AppColors().white,
          enabledBorder: _borderStyle(),
          disabledBorder: _borderStyle(),
          focusedBorder: _borderStyle()),
      cursorColor: AppColors().white,
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: AppBorderRadius().appborderRadius,
      borderSide: BorderSide(
        color: AppColors().white,
        width: 2.0,
      ),
    );
  }
}
