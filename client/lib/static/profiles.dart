import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:shared/shared.dart';

final faker = Faker.instance;

String generateImage(int index) {
  final i = index + 1;
  final type = i.isEven ? 'boy' : 'girl';

  final image = 'assets/pictures/$type-$i.png';
  return image;
}

User generateProfile(int index) {
  final isMale = index.isEven;

  final firstName =
      faker.name.firstName(gender: isMale ? Gender.male : Gender.female);
  final lastName =
      faker.name.lastName(gender: isMale ? Gender.male : Gender.female);

  final username = faker.lorem.word();

  final imageURL = _images[index];

  final email = faker.internet.email();
  final bio = faker.lorem.sentence(wordCount: 10);
  final birthday = faker.datatype.dateTime(max: 2022, min: 1980);

  final randomFollowersLen = Random().nextInt(10 + 1);
  final followers = List.generate(
    randomFollowersLen,
    (index) => faker.datatype.number(min: 1, max: 10),
  );

  final randomFollowingLen = Random().nextInt(10 + 1);
  final following = List.generate(
    randomFollowingLen,
    (index) => faker.datatype.number(min: 1, max: 10),
  );

  final randomPostsLen = Random().nextInt(10 + 1);
  final posts = List.generate(
    randomPostsLen,
    (index) => faker.datatype.number(min: 1, max: 10),
  );

  return User(
    id: index + 1,
    firstName: firstName,
    lastName: lastName,
    username: username,
    email: email,
    password: '',
    bio: bio,
    birthday: birthday,
    posts: posts,
    followers: followers,
    following: following,
    imageURL: imageURL,
    coverURL: '',
  );
}

final _images = List.generate(6, (index) => index).map(generateImage).toList();

final profiles =
    List.generate(6, (index) => index).map(generateProfile).toList();
