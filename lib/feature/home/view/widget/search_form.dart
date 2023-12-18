import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/init/navigator/index.dart';
import '../../../../product/utility/enum/widget_size.dart';
import '../../../../product/widget/icon/loading_lottie.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';
import '../../cubit/search/index.dart';
import '../mixin/search_form_mixin.dart';

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
          TextField(
            style: context.textTheme.bodyLarge,
            onChanged: (value) {
              value.length > 2
                  ? context.read<SearchCubit>().getSearch(searchController.text)
                  : context.read<SearchCubit>().closeSearch();
            },
            controller: searchController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colors.onSurface),
                  borderRadius: context.borderRadiusNormal,
                ),
                hintText: LocaleKeys.text_search.locale,
                hintStyle: context.textTheme.bodyLarge,
                fillColor: context.colors.onSurface,
                enabledBorder: _borderStyle(context),
                disabledBorder: _borderStyle(context),
                focusedBorder: _borderStyle(context)),
            cursorColor: context.colors.onSurface,
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
                        return GestureDetector(
                          onTap: () async {
                            await NavigatorManager.instance.pushToPage(
                                route: NavigatorRoutes.homeDetail,
                                fullScreenDialog: true,
                                arguments: state.search?[index]);
                            controllerClear();
                          },
                          child: Card(
                              child: ListTile(
                            title: Text(state.search?[index]?.title ?? ""),
                            leading: SizedBox(
                                height: WidgetSize.searchArea.value,
                                width: WidgetSize.searchArea.value,
                                child: NetworkImageWithRadius(
                                    posterPathValue:
                                        state.search?[index]?.posterPathValue)),
                          )),
                        );
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
      borderRadius: context.borderRadiusNormal,
      borderSide: BorderSide(
        color: context.colors.onSurface,
        width: 2.0,
      ),
    );
  }
}
