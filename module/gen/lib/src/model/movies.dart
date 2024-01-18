// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable()
@immutable
final class Movies with EquatableMixin {
  const Movies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  final int? page;
  final List<Movie>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  Map<String, dynamic> toJson() => _$MoviesToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];

  Movies copyWith({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return Movies(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
