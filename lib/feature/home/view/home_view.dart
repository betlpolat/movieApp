import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/widget/animation/loading_lottie.dart';
import '../../../product/widget/text/topic_title_text.dart';
import '../view-model/home/index.dart';
import 'mixin/home_view_mixin.dart';
import 'widget/index.dart';

part 'home_view.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView>
    with TickerProviderStateMixin, HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: _homeBlocManager(),
    );
  }

  BlocConsumer<HomeViewModel, HomeState> _homeBlocManager() {
    return BlocConsumer<HomeViewModel, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.onLoad) {
          return const Scaffold(
            appBar: HomeAppBar(
              onPressedLanguageButton: null,
            ),
            body: LoadingLottie(),
          );
        } else if (state.onComplete) {
          return Scaffold(
            appBar: HomeAppBar(
              onPressedLanguageButton: () => changeLanguage(context),
            ),
            body: const _MovieLists(),
          );
        } else {
          final error = state.errorMessage;
          return Text(error);
        }
      },
    );
  }
}
