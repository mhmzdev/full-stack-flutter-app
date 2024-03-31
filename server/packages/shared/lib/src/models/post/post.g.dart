// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as int,
      uid: json['uid'] as int,
      caption: json['caption'] as String,
      hasImage: json['hasImage'] as bool?,
      imageUrl: json['imageUrl'] as String? ?? '',
      hasVideo: json['hasVideo'] as bool?,
      videoUrl: json['videoUrl'] as String? ?? '',
      likes: (json['likes'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      comments:
          (json['comments'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'caption': instance.caption,
      'hasImage': instance.hasImage,
      'imageUrl': instance.imageUrl,
      'hasVideo': instance.hasVideo,
      'videoUrl': instance.videoUrl,
      'likes': instance.likes,
      'comments': instance.comments,
      'createdAt': instance.createdAt.toIso8601String(),
    };
