import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:shared/shared.dart';

final faker = Faker.instance;

final comments = List.generate(10, (index) {
  final id = Random().nextInt(10 + 1);
  final uid = Random().nextInt(10 + 1);

  final content = faker.lorem.sentence(wordCount: 8);

  return Comment(
    id: id,
    uid: uid,
    content: content,
    createdAt: DateTime.now(),
  );
});
