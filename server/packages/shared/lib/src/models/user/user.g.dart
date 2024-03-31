// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String,
      imageURL: json['imageURL'] as String? ?? '',
      coverURL: json['coverURL'] as String? ?? '',
      email: json['email'] as String,
      password: json['password'] as String,
      bio: json['bio'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      posts: (json['posts'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      stories:
          (json['stories'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'imageURL': instance.imageURL,
      'coverURL': instance.coverURL,
      'email': instance.email,
      'password': instance.password,
      'bio': instance.bio,
      'birthday': instance.birthday?.toIso8601String(),
      'following': instance.following,
      'followers': instance.followers,
      'posts': instance.posts,
      'stories': instance.stories,
    };
