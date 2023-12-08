import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/extension/string_extension.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/state/language_notifier.dart';
import '../../../product/state/theme_notifier.dart';
import '../../../product/utility/app_duration.dart';
import '../../../product/utility/constants/index.dart';
import '../../../product/utility/enum/lottie_items.dart';
import '../../../product/widget/icon/loading_lottie.dart';
import '../../../product/widget/text/topic_title_text.dart';
import '../cubit/home/index.dart';
import 'widget/carousel_movie_items.dart';
import 'widget/movie_items.dart';
import 'widget/search_form.dart';

part 'home_view.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    isLight = context.read<ThemeNotifier>().isLightTheme;
    final currentLanguage = context.read<LanguageNotifier>().currentLanguage;
    context.read<HomeCubit>().getMovie(currentLanguage!);
    controller = AnimationController(vsync: this, duration: AppDuration.low);
    Future.microtask(() {
      controller.animateTo(isLight ? 0 : 0.5);
    });
  }

  final TextEditingController _searchController = TextEditingController();
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
              width: MediaQuery.of(context).size.height / 10,
              child: _changeThemeButton(context),
            )
          ],
          title: Text(
            LocaleKeys.title_app.locale,
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeInitial) {
              return Container();
            } else if (state is HomeLoading) {
              return const LoadingLottie();
            } else if (state is HomeCompleted) {
              return _MovieLists(
                  searchController: _searchController, movies: state);
            } else {
              final error = state as HomeError;
              return Text(error.message);
            }
          },
        ));
  }

  InkWell _changeThemeButton(BuildContext context) {
    return InkWell(
      onTap: () async {
        Future.microtask(() {
          context.read<ThemeNotifier>().changeTheme();
          controller.animateTo(isLight ? 1 : 0.5);
        });

        isLight = !isLight;
      },
      child: Lottie.asset(LottieItems.theme_change.lottiePath,
          fit: BoxFit.cover, repeat: false, controller: controller),
    );
  }
}
