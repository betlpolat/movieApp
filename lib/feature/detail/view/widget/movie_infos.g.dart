part of 'movie_infos.dart';

class _OverviewText extends StatelessWidget {
  const _OverviewText({
    Key? key,
    required this.movie,
    required TextStyle textStyle,
  })  : _textStyle = textStyle,
        super(key: key);

  final Movie? movie;
  final TextStyle? _textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      movie?.overview ?? "",
      style: _textStyle!.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _OverviewTitle extends StatelessWidget {
  const _OverviewTitle({
    Key? key,
    required TextStyle textStyle,
  })  : _textStyle = textStyle,
        super(key: key);

  final TextStyle _textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(LocaleKeys.title_overview.locale,
        style: _textStyle.copyWith(
          fontWeight: FontWeight.w800,
        ));
  }
}

class _SizedBBox extends StatelessWidget {
  const _SizedBBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: WidgetSize.sizeBoxed.value);
}
