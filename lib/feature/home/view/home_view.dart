import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/cubit/home_cubit.dart';
import 'package:movie_app/feature/home/cubit/home_state.dart';
import 'package:movie_app/feature/home/view/search_form.dart';
import 'package:movie_app/product/language/language_items.dart';
import '../../../product/constants/padding.dart';
import '../../../product/widget/topic_title_text.dart';
import 'carousel_movie_items.dart';
import 'movie_items.dart';

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
          title: const Text(
            LanguageItems.appTitle,
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              return Container();
            } else if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeComplated) {
              return _moviesLists(state);
            } else {
              final error = state as HomeError;
              return Text(error.message);
            }
          },
        ));
  }

  Padding _moviesLists(HomeComplated movies) {
    return Padding(
      padding: AppPadding().paddingAll,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPadding().paddingAll,
              child: SearchForm(searchController: _searchController),
            ),
            const TopicTitleText(text: LanguageItems.trendingTitle),
            Padding(
              padding: AppPadding().paddingAll,
              child: CarouselMovieItems(movies: movies.trending),
            ),
            const TopicTitleText(text: LanguageItems.topRatedTitle),
            Padding(
              padding: AppPadding().paddingAll,
              child: MovieItems(movies: movies.topRated),
            ),
            const TopicTitleText(text: LanguageItems.nowPlayingTitle),
            Padding(
              padding: AppPadding().paddingAll,
              child: MovieItems(movies: movies.nowPlaying),
            ),
          ],
        ),
      ),
    );
  }
}
