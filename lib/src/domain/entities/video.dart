
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';

@freezed
class Video with _$Video {
  const factory Video({
    required String id,
    required String key,
    required String name,
    required String site,
    required String type,
  }) = _Video;
}
