import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:movie_app/feature/home/view-model/search/search_view_model.dart';
import 'package:movie_app/feature/home/view/widget/search_text_field.dart';
import 'package:movie_app/product/utility/model/throttle_helper.dart';
import 'package:widgets/widgets.dart';

import '../../../../product/network/movie_service.dart';
import '../../../../product/state/base/base_state.dart';
import '../../../../product/utility/function/navigate_to_detail.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';
import '../../view-model/search/search_state.dart';

part '../mixin/search_form_mixin.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({
    super.key,
  });

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends BaseState<SearchForm> with SearchFormMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchViewModel,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SearchTextField(
              controller: searchController,
              onChanged: _checkSearchText,
            ),
            _searchBlocManager(),
          ],
        ),
      ),
    );
  }

  // TextField searchTextField(BuildContext context) {
  //   return TextField(
  //     style: context.textTheme.bodyLarge,
  //     onChanged: (value) async => _checkSearchText(value),
  //     controller: searchController,
  //     decoration: InputDecoration(
  //       hintStyle: context.textTheme.bodyLarge,
  //       border: const OutlineInputBorder(),
  //       hintText: LocaleKeys.text_search.locale,
  //     ),
  //     cursorColor: context.colors.onSurface,
  //   );
  // }

  BlocConsumer<SearchViewModel, SearchState> _searchBlocManager() {
    return BlocConsumer<SearchViewModel, SearchState>(
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
      child: movieInfoCard(movie: movie),
    );
  }

  Card movieInfoCard({required Movie movie}) {
    return Card(
      key: const Key('search card'),
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
