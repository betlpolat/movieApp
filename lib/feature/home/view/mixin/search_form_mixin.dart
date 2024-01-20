part of '../widget/search_form.dart';

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

  Future<void> _checkSearchText(String value) async => value.isNotEmpty
      ? context.searchCubit.getSearch(searchController.text)
      : context.searchCubit.closeSearch();

  Future<void> _controllerClear() async {
    await context.searchCubit.closeSearch();
    searchController.clear();
    if (mounted) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  Future<void> _closeSearch() async {
    await context.searchCubit.closeSearch();
  }

  Future<void> _navigateToDetail({required Movie movie}) async {
    await navigateToDetail(movie: movie);
    await _controllerClear();
  }
}
