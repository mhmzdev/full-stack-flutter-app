import 'dart:math';

import 'package:client/static/profiles.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:shared/shared.dart';

final faker = Faker.instance;

final _images =
    List.generate(10, (index) => 'assets/utils/util-${index + 1}.png');

final posts = List.generate(10, (index) {
  final uid = profiles[Random().nextInt(profiles.length)].id;

  final caption = faker.lorem.sentence(wordCount: 20);
  final imageURL = _images[Random().nextInt(10)];

  final randomLikeLen = Random().nextInt(10 + 1);
  final likes = List.generate(
    randomLikeLen,
    (index) => faker.datatype.number(max: 10, min: 1),
  );

  final randomCommentLen = Random().nextInt(10 + 1);
  final comments = List.generate(
    randomCommentLen,
    (index) => faker.datatype.number(max: 10, min: 1),
  );

  return Post(
    id: index + 1,
    uid: uid,
    caption: caption,
    hasVideo: false,
    videoUrl: '',
    hasImage: true,
    imageUrl: imageURL,
    likes: likes,
    comments: comments,
    createdAt: DateTime.now(),
  );
});
