import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../../product/utility/constants/path_constant.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movies extends INetworkModel<Movies> {
  const Movies({this.page, this.results, this.totalPages, this.totalResults});
  final int? page;
  final List<Movie>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  @override
  Movies fromJson(Map<String, dynamic> json) {
    return _$MoviesFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$MoviesToJson(this);
  }
}

@JsonSerializable()
class Movie extends INetworkModel<Movie> with EquatableMixin {
  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final num? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  String? get backdropPathValue =>
      PathConstant.imagePath + (backdropPath ?? '');
  String? get posterPathValue => PathConstant.imagePath + (posterPath ?? '');

  @override
  Movie fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$MovieToJson(this);
  }

  @override
  List<Object?> get props => [id, title];
}
