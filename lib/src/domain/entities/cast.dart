
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';

@freezed
class Cast with _$Cast {
  const factory Cast({
    required int id,
    required String name,
    required String? profilePath,
    required String character,
  }) = _Cast;
}
