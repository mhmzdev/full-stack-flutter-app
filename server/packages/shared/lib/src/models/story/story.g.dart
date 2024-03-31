// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      id: json['id'] as int,
      uid: json['uid'] as int,
      hasImage: json['hasImage'] as bool?,
      imageUrl: json['imageUrl'] as String? ?? '',
      hasVideo: json['hasVideo'] as bool?,
      videoUrl: json['videoUrl'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'hasImage': instance.hasImage,
      'imageUrl': instance.imageUrl,
      'hasVideo': instance.hasVideo,
      'videoUrl': instance.videoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
