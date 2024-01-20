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
                _searchForm(context),
                _textPopular(context),
                _popularMovies(context, state),
                _textTopRated(context),
                _topRatedMovies(context, state),
                _textNowPlaying(context),
                _nowPlayingMovies(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _searchForm(BuildContext context) {
    return _paddingLow(
      context: context,
      child: const SearchForm(),
    );
  }

  Padding _textPopular(BuildContext context) {
    return _paddingLow(
      context: context,
      child: const TopicTitleText(text: LocaleKeys.title_trending),
    );
  }

  Padding _popularMovies(BuildContext context, HomeState state) {
    return _paddingLow(
      context: context,
      child: CarouselMovieItems(movies: state.popular),
    );
  }

  Padding _textTopRated(BuildContext context) {
    return _paddingLow(
      context: context,
      child: const TopicTitleText(
        text: LocaleKeys.title_topRated,
      ),
    );
  }

  Padding _topRatedMovies(BuildContext context, HomeState state) {
    return _paddingLow(
      context: context,
      child: MovieItems(movies: state.topRated),
    );
  }

  Padding _textNowPlaying(BuildContext context) {
    return _paddingLow(
      context: context,
      child: const TopicTitleText(
        text: LocaleKeys.title_nowPlaying,
      ),
    );
  }

  Padding _nowPlayingMovies(BuildContext context, HomeState state) {
    return _paddingLow(
      context: context,
      child: MovieItems(movies: state.nowPlaying),
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
