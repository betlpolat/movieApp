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
                _paddingLow(
                  context: context,
                  child: const SearchForm(),
                ),
                _paddingLow(
                  context: context,
                  child: const TopicTitleText(text: LocaleKeys.title_trending),
                ),
                _paddingLow(
                  context: context,
                  child: CarouselMovieItems(movies: state.popular),
                ),
                _paddingLow(
                  context: context,
                  child: const TopicTitleText(
                    text: LocaleKeys.title_topRated,
                  ),
                ),
                _paddingLow(
                  context: context,
                  child: MovieItems(movies: state.topRated),
                ),
                _paddingLow(
                  context: context,
                  child: const TopicTitleText(
                    text: LocaleKeys.title_nowPlaying,
                  ),
                ),
                _paddingLow(
                  context: context,
                  child: MovieItems(movies: state.nowPlaying),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _paddingLow({
    required BuildContext context,
    required Widget child,
  }) {
    return Padding(
      padding: context.paddingLow,
      child: child,
    );
  }
}
