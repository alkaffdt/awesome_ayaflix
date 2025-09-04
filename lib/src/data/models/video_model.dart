import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:awesome_ayaflix/src/domain/entities/video.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String id,
    required String key,
    required String name,
    required String site,
    required String type,
  }) = _VideoModel;

  const VideoModel._();

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Video toEntity() {
    return Video(
      id: id,
      key: key,
      name: name,
      site: site,
      type: type,
    );
  }
}