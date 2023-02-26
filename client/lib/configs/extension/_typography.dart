part of '../configs.dart';

extension SuperTextStyles on TextStyle {
  TextStyle ratioHeight() {
    final ratio = (fontSize! / 0.8) / fontSize!;
    return copyWith(
      height: ratio,
    );
  }

  TextStyle removeHeight() {
    return merge(const TextStyle(height: 0));
  }
}
