import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view-model/search/search_cubit.dart';
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
    context.read<SearchCubit>().closeSearch();
    searchController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
