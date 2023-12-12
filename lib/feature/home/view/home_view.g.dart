part of 'home_view.dart';

class _MovieLists extends StatelessWidget {
  const _MovieLists({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final HomeCompleted movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstant.paddingAll,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: PaddingConstant.paddingAll,
              child: SearchForm(),
            ),
            const TopicTitleText(text: LocaleKeys.title_trending),
            Padding(
              padding: PaddingConstant.paddingAll,
              child: CarouselMovieItems(movies: movies.trending),
            ),
            const TopicTitleText(
              text: LocaleKeys.title_topRated,
            ),
            Padding(
              padding: PaddingConstant.paddingAll,
              child: MovieItems(movies: movies.topRated),
            ),
            const TopicTitleText(text: LocaleKeys.title_nowPlaying),
            Padding(
              padding: PaddingConstant.paddingAll,
              child: MovieItems(movies: movies.nowPlaying),
            ),
          ],
        ),
      ),
    );
  }
}
