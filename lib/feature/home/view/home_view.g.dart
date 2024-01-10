part of 'home_view.dart';

class _MovieLists extends StatelessWidget {
  const _MovieLists({
    required this.movies,
  });

  final HomeCompleted movies;

  @override
  Widget build(BuildContext context) {
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
              child: CarouselMovieItems(movies: movies.trending),
            ),
            const TopicTitleText(
              text: LocaleKeys.title_topRated,
            ),
            Padding(
              padding: context.paddingLow,
              child: MovieItems(movies: movies.topRated),
            ),
            const TopicTitleText(text: LocaleKeys.title_nowPlaying),
            Padding(
              padding: context.paddingLow,
              child: MovieItems(movies: movies.nowPlaying),
            ),
          ],
        ),
      ),
    );
  }
}
