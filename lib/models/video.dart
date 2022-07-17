import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';

part 'video.g.dart';

@freezed
class Video with _$Video {
  factory Video({
    required String thumbnail,
    required String videoUrl,
    required int index,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
