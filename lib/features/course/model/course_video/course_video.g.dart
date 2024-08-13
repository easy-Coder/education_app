// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseVideoImpl _$$CourseVideoImplFromJson(Map<String, dynamic> json) =>
    _$CourseVideoImpl(
      id: json['id'] as String?,
      storage_url: json['storage_url'] as String,
      mime_type: json['mime_type'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$CourseVideoImplToJson(_$CourseVideoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storage_url': instance.storage_url,
      'mime_type': instance.mime_type,
      'url': instance.url,
    };
