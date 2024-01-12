part of 'home_view.dart';

class _MovieLists extends StatelessWidget {
  const _MovieLists();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: context.paddingMedium,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: context.paddingLow,
                  child: const SearchForm(),
                ),
                const TopicTitleText(text: LocaleKeys.title_trending),
                Padding(
                  padding: context.paddingLow,
                  child: CarouselMovieItems(movies: state.popular),
                ),
                const TopicTitleText(
                  text: LocaleKeys.title_topRated,
                ),
                Padding(
                  padding: context.paddingLow,
                  child: MovieItems(movies: state.topRated),
                ),
                const TopicTitleText(text: LocaleKeys.title_nowPlaying),
                Padding(
                  padding: context.paddingLow,
                  child: MovieItems(movies: state.nowPlaying),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
