import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../widget/search_form.dart';

mixin SearchFormMixin on State<SearchForm> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void controllerClear() {
    context.searchCubit.closeSearch();
    searchController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
