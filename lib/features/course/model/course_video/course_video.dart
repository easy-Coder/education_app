// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_video.freezed.dart';
part 'course_video.g.dart';

@freezed
class CourseVideo with _$CourseVideo {
  const factory CourseVideo({
    String? id,
    required String storage_url,
    required String mime_type,
    required String url,
  }) = _CourseVideo;

  factory CourseVideo.fromJson(Map<String, dynamic> json) =>
      _$CourseVideoFromJson(json);
}
