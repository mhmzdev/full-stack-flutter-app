// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  int get id => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  bool? get hasImage => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool? get hasVideo => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call(
      {int id,
      int uid,
      bool? hasImage,
      String imageUrl,
      bool? hasVideo,
      String videoUrl,
      DateTime createdAt});
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? hasImage = freezed,
    Object? imageUrl = null,
    Object? hasVideo = freezed,
    Object? videoUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      hasImage: freezed == hasImage
          ? _value.hasImage
          : hasImage // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hasVideo: freezed == hasVideo
          ? _value.hasVideo
          : hasVideo // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$_StoryCopyWith(_$_Story value, $Res Function(_$_Story) then) =
      __$$_StoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int uid,
      bool? hasImage,
      String imageUrl,
      bool? hasVideo,
      String videoUrl,
      DateTime createdAt});
}

/// @nodoc
class __$$_StoryCopyWithImpl<$Res> extends _$StoryCopyWithImpl<$Res, _$_Story>
    implements _$$_StoryCopyWith<$Res> {
  __$$_StoryCopyWithImpl(_$_Story _value, $Res Function(_$_Story) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? hasImage = freezed,
    Object? imageUrl = null,
    Object? hasVideo = freezed,
    Object? videoUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Story(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      hasImage: freezed == hasImage
          ? _value.hasImage
          : hasImage // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hasVideo: freezed == hasVideo
          ? _value.hasVideo
          : hasVideo // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Story implements _Story {
  const _$_Story(
      {required this.id,
      required this.uid,
      this.hasImage,
      this.imageUrl = '',
      this.hasVideo,
      this.videoUrl = '',
      required this.createdAt});

  factory _$_Story.fromJson(Map<String, dynamic> json) =>
      _$$_StoryFromJson(json);

  @override
  final int id;
  @override
  final int uid;
  @override
  final bool? hasImage;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  final bool? hasVideo;
  @override
  @JsonKey()
  final String videoUrl;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Story(id: $id, uid: $uid, hasImage: $hasImage, imageUrl: $imageUrl, hasVideo: $hasVideo, videoUrl: $videoUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Story &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.hasImage, hasImage) ||
                other.hasImage == hasImage) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.hasVideo, hasVideo) ||
                other.hasVideo == hasVideo) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, uid, hasImage, imageUrl, hasVideo, videoUrl, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryCopyWith<_$_Story> get copyWith =>
      __$$_StoryCopyWithImpl<_$_Story>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryToJson(
      this,
    );
  }
}

abstract class _Story implements Story {
  const factory _Story(
      {required final int id,
      required final int uid,
      final bool? hasImage,
      final String imageUrl,
      final bool? hasVideo,
      final String videoUrl,
      required final DateTime createdAt}) = _$_Story;

  factory _Story.fromJson(Map<String, dynamic> json) = _$_Story.fromJson;

  @override
  int get id;
  @override
  int get uid;
  @override
  bool? get hasImage;
  @override
  String get imageUrl;
  @override
  bool? get hasVideo;
  @override
  String get videoUrl;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_StoryCopyWith<_$_Story> get copyWith =>
      throw _privateConstructorUsedError;
}
