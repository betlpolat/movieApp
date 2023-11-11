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
