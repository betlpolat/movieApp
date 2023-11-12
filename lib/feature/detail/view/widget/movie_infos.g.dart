part of 'movie_infos.dart';

class _OverviewText extends StatelessWidget {
  const _OverviewText({
    Key? key,
    required this.movie,
    required double textSize,
  })  : _textSize = textSize,
        super(key: key);

  final Movie? movie;
  final double _textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      movie?.overview ?? "",
      style: GoogleFonts.roboto(
        fontSize: _textSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _OverviewTitle extends StatelessWidget {
  const _OverviewTitle({
    Key? key,
    required double titleTextSize,
  })  : _titleTextSize = titleTextSize,
        super(key: key);

  final double _titleTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.title_overview.tr(),
      style: GoogleFonts.openSans(
        fontSize: _titleTextSize,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _SizedBBox extends StatelessWidget {
  const _SizedBBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(height: 16);
}
