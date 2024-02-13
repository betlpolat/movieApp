// ignore_for_file: lines_longer_than_80_chars

import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/product/network/manager/IMovieService.dart';
import 'package:movie_app/product/utility/enum/index.dart';

class MovieServiceMock extends Mock implements IMovieService {
  @override
  Future<List<Movie>?> fetchMovieList({
    Locales currentLanguage = Locales.en,
    MoviePaths path = MoviePaths.popular,
  }) async {
    return movies;
  }

  @override
  Future<List<Movie>?> fetchMovieListWithSearch({String path = ''}) async {
    return movies;
  }

  List<Movie> movies = [
    Movie(
      adult: false,
      backdropPath: '/pWsD91G2R1Da3AKM3ymr3UoIfRb.jpg',
      genreIds: const [878, 28, 18],
      id: 933131,
      originalLanguage: 'ko',
      originalTitle: '황야',
      overview:
          'After a deadly earthquake turns Seoul into a lawless badland, a fearless huntsman springs into action to rescue a teenager abducted by a mad doctor.',
      popularity: 2655.112,
      posterPath: '/24CL0ySodCF8bcm38xtBeHzHp7W.jpg',
      releaseDate: '2024-01-26',
      title: 'Badland Hunters',
      video: false,
      voteAverage: 6.78,
      voteCount: 305,
    ),
    Movie(
      adult: false,
      backdropPath: 'unvtbkgxh47BewQ8pENvdOdme0r.jpg',
      genreIds: const [28, 18],
      id: 1212015,
      originalLanguage: 'de',
      originalTitle: '60 Minuten',
      overview:
          'Desperate to keep custody of his daughter, a mixed martial arts fighter abandons a big match and races across Berlin to attend her birthday party.',
      popularity: 1686.33,
      posterPath: '/aajCqg315CoJPu1NmgPCkbRjnl6.jpg',
      releaseDate: '2024-01-19',
      title: 'Sixty Minutes',
      video: false,
      voteAverage: 7.03,
      voteCount: 266,
    ),
    Movie(
      adult: false,
      backdropPath: '/yyFc8Iclt2jxPmLztbP617xXllT.jpg',
      genreIds: const [35, 10751, 14],
      id: 787699,
      originalLanguage: 'en',
      originalTitle: 'Wonka',
      overview:
          'Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.',
      popularity: 1433.084,
      posterPath: '/qhb1qOilapbapxWQn9jtRCMwXJF.jpg',
      releaseDate: '2023-12-06',
      title: 'WWonka',
      video: false,
      voteAverage: 7.213,
      voteCount: 2030,
    ),
    Movie(
      adult: false,
      backdropPath: '/pWsD91G2R1Da3AKM3ymr3UoIfRb.jpg',
      genreIds: const [878, 28, 18],
      id: 933131,
      originalLanguage: 'ko',
      originalTitle: '황야',
      overview:
          'After a deadly earthquake turns Seoul into a lawless badland, a fearless huntsman springs into action to rescue a teenager abducted by a mad doctor.',
      popularity: 2655.112,
      posterPath: '/24CL0ySodCF8bcm38xtBeHzHp7W.jpg',
      releaseDate: '2024-01-26',
      title: 'Badland Hunters',
      video: false,
      voteAverage: 6.78,
      voteCount: 305,
    ),
    Movie(
      adult: false,
      backdropPath: 'unvtbkgxh47BewQ8pENvdOdme0r.jpg',
      genreIds: const [28, 18],
      id: 1212015,
      originalLanguage: 'de',
      originalTitle: '60 Minuten',
      overview:
          'Desperate to keep custody of his daughter, a mixed martial arts fighter abandons a big match and races across Berlin to attend her birthday party.',
      popularity: 1686.33,
      posterPath: '/aajCqg315CoJPu1NmgPCkbRjnl6.jpg',
      releaseDate: '2024-01-19',
      title: 'Sixty Minutes',
      video: false,
      voteAverage: 7.03,
      voteCount: 266,
    ),
    Movie(
      adult: false,
      backdropPath: '/yyFc8Iclt2jxPmLztbP617xXllT.jpg',
      genreIds: const [35, 10751, 14],
      id: 787699,
      originalLanguage: 'en',
      originalTitle: 'Wonka',
      overview:
          'Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.',
      popularity: 1433.084,
      posterPath: '/qhb1qOilapbapxWQn9jtRCMwXJF.jpg',
      releaseDate: '2023-12-06',
      title: 'WWonka',
      video: false,
      voteAverage: 7.213,
      voteCount: 2030,
    ),
  ];
}
