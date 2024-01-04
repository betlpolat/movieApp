import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/extension/context_extension.dart';

import '../../../core/component/icon/lottie_icon.dart';
import '../../../core/extension/string_extension.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/state/index.dart';
import '../../../product/utility/enum/lottie_items.dart';
import '../../../product/widget/text/topic_title_text.dart';
import '../view-model/home/index.dart';
import 'mixin/home_view_mixin.dart';
import 'widget/change_theme_button.dart';
import 'widget/index.dart';

part 'home_view.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  LanguageNotifier().changeLanguage(context);
                },
                icon: const Icon(Icons.language_outlined)),
            actions: [
              SizedBox(
                width: context.highValue,
                child: const ChangeThemeButton(),
              )
            ],
            title: Text(LocaleKeys.title_app.locale)),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeInitial) {
              return Container();
            } else if (state is HomeLoading) {
              return const Center(
                  child: LottieIcon(
                item: LottieItems.loading,
              ));
            } else if (state is HomeCompleted) {
              return _MovieLists(movies: state);
            } else {
              final error = state as HomeError;
              return Text(error.message);
            }
          },
        ));
  }
}
