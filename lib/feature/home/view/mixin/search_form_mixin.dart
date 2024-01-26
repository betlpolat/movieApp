part of '../widget/search_form.dart';

mixin SearchFormMixin on BaseState<SearchForm> {
  late final SearchViewModel _searchViewModel;
  SearchViewModel get searchViewModel => _searchViewModel;
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    _searchViewModel = SearchViewModel(
      movieService: MovieService(
        networkManager: productNetworkManager,
      ),
    );
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _checkSearchText(String value) async => value.isNotEmpty
      ? searchViewModel.getSearch(searchController.text)
      : searchViewModel.closeSearch();

  Future<void> _controllerClear() async {
    await searchViewModel.closeSearch();
    searchController.clear();
    if (mounted) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  Future<void> _closeSearch() async {
    await searchViewModel.closeSearch();
  }

  Future<void> _navigateToDetail({required Movie movie}) async {
    await navigateToDetail(movie: movie);
    await _controllerClear();
  }
}
