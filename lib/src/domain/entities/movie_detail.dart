
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required int id,
    required String title,
    required String overview,
    required String? posterPath,
    required String? backdropPath,
    required double voteAverage,
    required String releaseDate,
    required int runtime,
    required List<String> genres,
  }) = _MovieDetail;
}
