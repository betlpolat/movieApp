import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/feature/home/cubit/home/home_cubit.dart';
import 'package:movie_app/feature/home/cubit/home/home_state.dart';
import 'package:movie_app/product/global/theme_notifier.dart';
import 'package:movie_app/product/utility/enum/lottie_items.dart';

import '../../../product/utility/constants/padding_constant.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/widget/loading_lottie.dart';
import '../../../product/widget/topic_title_text.dart';

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
    isLight = context.read<ThemeNotifer>().isLightTheme;
    context.read<HomeCubit>().getMovie();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    Future.microtask(() {
      controller.animateTo(isLight ? 0 : 0.5);
    });
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.height / 10,
              child: InkWell(
                onTap: () async {
                  Future.microtask(() {
                    context.read<ThemeNotifer>().changeTheme();
                    controller.animateTo(isLight ? 1 : 0.5);
                  });

                  isLight = !isLight;
                },
                child: Lottie.asset(LottieItems.theme_change.lottiePath,
                    fit: BoxFit.cover, repeat: false, controller: controller),
              ),
            )
          ],
          title: Text(
            LocaleKeys.title_app.tr(),
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeInitial) {
              return Container();
            } else if (state is HomeLoading) {
              return const LoadingLottie();
            } else if (state is HomeComplated) {
              return _MovieLists(searchController: _searchController, movies: state);
            } else {
              final error = state as HomeError;
              return Text(error.message);
            }
          },
        ));
  }
}
