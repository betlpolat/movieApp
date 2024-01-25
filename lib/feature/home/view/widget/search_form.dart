import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/utility/function/navigate_to_detail.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';
import '../../view-model/search/search_cubit.dart';
import '../../view-model/search/search_state.dart';

part '../mixin/search_form_mixin.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({
    super.key,
  });

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> with SearchFormMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          _searchTextField(context),
          _searchBlocManager(),
        ],
      ),
    );
  }

  TextField _searchTextField(BuildContext context) {
    return TextField(
      style: context.textTheme.bodyLarge,
      onChanged: (value) async => _checkSearchText(value),
      controller: searchController,
      decoration: InputDecoration(
        hintStyle: context.textTheme.bodyLarge,
        border: const OutlineInputBorder(),
        hintText: LocaleKeys.text_search.locale,
      ),
      cursorColor: context.colors.onSurface,
    );
  }

  BlocConsumer<SearchCubit, SearchState> _searchBlocManager() {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.onComplete) {
          return SizedBox(
            height: context.dynamicHeight(0.3),
            child: _searchMovieList(movieList: state.searchList ?? []),
          );
        } else if (state.onError) {
          final error = state.errorMessage;
          return Text(error);
        } else {
          _closeSearch();
          return const SizedBox.shrink();
        }
      },
    );
  }

  ListView _searchMovieList({required List<Movie> movieList}) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _movieButton(movie: movieList[index]);
      },
    );
  }

  GestureDetector _movieButton({required Movie movie}) {
    return GestureDetector(
      onTap: () async => _navigateToDetail(movie: movie),
      child: _movieInfoCard(movie: movie),
    );
  }

  Card _movieInfoCard({required Movie movie}) {
    return Card(
      child: ListTile(
        title: Text(movie.title ?? ''),
        leading: SizedBox(
          child: NetworkImageWithRadius(
            posterPathValue: movie.posterPathValue,
          ),
        ),
      ),
    );
  }
}
