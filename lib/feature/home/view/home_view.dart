import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/constants/padding.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/init/loading_lottie.dart';
import '../../../product/widget/topic_title_text.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widget/carousel_movie_items.dart';
import 'widget/movie_items.dart';
import 'widget/search_form.dart';

part 'home_view.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getMovie();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
