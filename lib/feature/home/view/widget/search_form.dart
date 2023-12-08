import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movie_app/core/extension/string_extension.dart';
import 'package:movie_app/product/utility/enum/widget_size.dart';
import 'package:movie_app/product/widget/image/network_image_with_radius.dart';

import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/utility/border_radius/app_border_radius.dart';
import '../../../../product/widget/icon/loading_lottie.dart';
import '../../cubit/search/index.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          TextField(
            style: context.general.textTheme.bodyLarge,
            onChanged: (value) {
              value.length > 2
                  ? context
                      .read<SearchCubit>()
                      .getSearch(_searchController.text)
                  : context.read<SearchCubit>().closeSearch();
            },
            controller: _searchController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface),
                  borderRadius: AppBorderRadius().appBorderRadius,
                ),
                hintText: LocaleKeys.text_search.locale,
                hintStyle: context.general.textTheme.bodyLarge,
                fillColor: Theme.of(context).colorScheme.onSurface,
                enabledBorder: _borderStyle(context),
                disabledBorder: _borderStyle(context),
                focusedBorder: _borderStyle(context)),
            cursorColor: Theme.of(context).colorScheme.onSurface,
          ),
          BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SearchInitial) {
                return const SizedBox.shrink();
              }
              if (state is SearchLoading) {
                return const LoadingLottie();
              }
              if (state is SearchCompleted) {
                return SizedBox(
                  height: (MediaQuery.of(context).size.height) / 3,
                  child: ListView.builder(
                      itemCount: state.search?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          title: Text(state.search?[index]?.title ?? ""),
                          leading: SizedBox(
                              height: WidgetSize.searchArea.value,
                              width: WidgetSize.searchArea.value,
                              child: NetworkImageWithRadius(
                                  posterPathValue:
                                      state.search?[index]?.posterPathValue)),
                        ));
                      }),
                );
              } else {
                final error = state as SearchError;
                return Text(error.message);
              }
            },
          )
        ],
      ),
    );
  }

  OutlineInputBorder _borderStyle(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: AppBorderRadius().appBorderRadius,
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurface,
        width: 2.0,
      ),
    );
  }
}
