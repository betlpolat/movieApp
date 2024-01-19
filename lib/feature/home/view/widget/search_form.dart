import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/init/navigator/navigator_manager.dart';
import '../../../../product/init/navigator/navigator_routes.dart';
import '../../../../product/widget/image/network_image_with_radius.dart';
import '../../view-model/search/search_cubit.dart';
import '../../view-model/search/search_state.dart';
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
              value.isNotEmpty
                  ? context.searchCubit.getSearch(searchController.text)
                  : context.searchCubit.closeSearch();
            },
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: context.colors.onSurface),
                borderRadius: context.normalBorderRadius,
              ),
              hintText: LocaleKeys.text_search.locale,
              hintStyle: context.textTheme.bodyLarge,
              fillColor: context.colors.onSurface,
              enabledBorder: _borderStyle(context),
              disabledBorder: _borderStyle(context),
              focusedBorder: _borderStyle(context),
            ),
            cursorColor: context.colors.onSurface,
          ),
          BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.onComplete) {
                return SizedBox(
                  height: context.dynamicHeight(0.3),
                  child: ListView.builder(
                    itemCount: state.searchList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          await NavigatorManager.instance.pushToPage<Widget>(
                            route: NavigatorRoutes.homeDetail,
                            fullScreenDialog: true,
                            arguments: state.searchList?[index],
                          );
                          controllerClear();
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(state.searchList?[index].title ?? ''),
                            leading: SizedBox(
                              child: NetworkImageWithRadius(
                                posterPathValue:
                                    state.searchList?[index].posterPathValue,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state.onError) {
                final error = state.errorMessage;
                return Text(error);
              } else {
                context.searchCubit.closeSearch();
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _borderStyle(BuildContext context) {
    const width = 2.0;
    return OutlineInputBorder(
      borderRadius: context.normalBorderRadius,
      borderSide: BorderSide(
        color: context.colors.onSurface,
        width: width,
      ),
    );
  }
}
