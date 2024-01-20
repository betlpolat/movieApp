part of 'movie_infos.dart';

class _OverviewText extends StatelessWidget {
  const _OverviewText({
    required this.movie,
    required this.textStyle,
  });

  final Movie? movie;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      movie?.overview ?? '',
      style: textStyle!.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _OverviewTitle extends StatelessWidget {
  const _OverviewTitle({
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.title_overview.locale,
      style: textStyle.copyWith(
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
