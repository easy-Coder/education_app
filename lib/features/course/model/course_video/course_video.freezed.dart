// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseVideo _$CourseVideoFromJson(Map<String, dynamic> json) {
  return _CourseVideo.fromJson(json);
}

/// @nodoc
mixin _$CourseVideo {
  String? get id => throw _privateConstructorUsedError;
  String get storage_url => throw _privateConstructorUsedError;
  String get mime_type => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseVideoCopyWith<CourseVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseVideoCopyWith<$Res> {
  factory $CourseVideoCopyWith(
          CourseVideo value, $Res Function(CourseVideo) then) =
      _$CourseVideoCopyWithImpl<$Res, CourseVideo>;
  @useResult
  $Res call({String? id, String storage_url, String mime_type, String url});
}

/// @nodoc
class _$CourseVideoCopyWithImpl<$Res, $Val extends CourseVideo>
    implements $CourseVideoCopyWith<$Res> {
  _$CourseVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? storage_url = null,
    Object? mime_type = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      storage_url: null == storage_url
          ? _value.storage_url
          : storage_url // ignore: cast_nullable_to_non_nullable
              as String,
      mime_type: null == mime_type
          ? _value.mime_type
          : mime_type // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseVideoImplCopyWith<$Res>
    implements $CourseVideoCopyWith<$Res> {
  factory _$$CourseVideoImplCopyWith(
          _$CourseVideoImpl value, $Res Function(_$CourseVideoImpl) then) =
      __$$CourseVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String storage_url, String mime_type, String url});
}

/// @nodoc
class __$$CourseVideoImplCopyWithImpl<$Res>
    extends _$CourseVideoCopyWithImpl<$Res, _$CourseVideoImpl>
    implements _$$CourseVideoImplCopyWith<$Res> {
  __$$CourseVideoImplCopyWithImpl(
      _$CourseVideoImpl _value, $Res Function(_$CourseVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? storage_url = null,
    Object? mime_type = null,
    Object? url = null,
  }) {
    return _then(_$CourseVideoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      storage_url: null == storage_url
          ? _value.storage_url
          : storage_url // ignore: cast_nullable_to_non_nullable
              as String,
      mime_type: null == mime_type
          ? _value.mime_type
          : mime_type // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseVideoImpl implements _CourseVideo {
  const _$CourseVideoImpl(
      {this.id,
      required this.storage_url,
      required this.mime_type,
      required this.url});

  factory _$CourseVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseVideoImplFromJson(json);

  @override
  final String? id;
  @override
  final String storage_url;
  @override
  final String mime_type;
  @override
  final String url;

  @override
  String toString() {
    return 'CourseVideo(id: $id, storage_url: $storage_url, mime_type: $mime_type, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseVideoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storage_url, storage_url) ||
                other.storage_url == storage_url) &&
            (identical(other.mime_type, mime_type) ||
                other.mime_type == mime_type) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, storage_url, mime_type, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseVideoImplCopyWith<_$CourseVideoImpl> get copyWith =>
      __$$CourseVideoImplCopyWithImpl<_$CourseVideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseVideoImplToJson(
      this,
    );
  }
}

abstract class _CourseVideo implements CourseVideo {
  const factory _CourseVideo(
      {final String? id,
      required final String storage_url,
      required final String mime_type,
      required final String url}) = _$CourseVideoImpl;

  factory _CourseVideo.fromJson(Map<String, dynamic> json) =
      _$CourseVideoImpl.fromJson;

  @override
  String? get id;
  @override
  String get storage_url;
  @override
  String get mime_type;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$CourseVideoImplCopyWith<_$CourseVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
