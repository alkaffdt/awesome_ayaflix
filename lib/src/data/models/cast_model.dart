import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:awesome_ayaflix/src/domain/entities/cast.dart';

part 'cast_model.freezed.dart';
part 'cast_model.g.dart';

@freezed
class CastModel with _$CastModel {
  const factory CastModel({
    required int id,
    required String name,
    @JsonKey(name: 'profile_path') required String? profilePath,
    required String character,
  }) = _CastModel;

  const CastModel._();

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);

  Cast toEntity() {
    return Cast(
      id: id,
      name: name,
      profilePath: profilePath,
      character: character,
    );
  }
}