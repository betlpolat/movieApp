part of 'home_view.dart';

class _MovieLists extends StatelessWidget {
  const _MovieLists({
    Key? key,
    required TextEditingController searchController,
    required this.movies,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final HomeComplated movies;

  @override
  Widget build(BuildContext context) {
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
            TopicTitleText(text: LocaleKeys.title_trending.tr()),
            Padding(
              padding: AppPadding().paddingAll,
              child: CarouselMovieItems(movies: movies.trending),
            ),
            TopicTitleText(text: LocaleKeys.title_topRated.tr()),
            Padding(
              padding: AppPadding().paddingAll,
              child: MovieItems(movies: movies.topRated),
            ),
            TopicTitleText(text: LocaleKeys.title_nowPlaying.tr()),
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
