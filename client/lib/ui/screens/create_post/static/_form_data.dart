part of '../create_post.dart';

class _FormData {
  static Map<String, dynamic> initialValues(Post? post) {
    return {
      _FormKeys.caption: post?.caption,
    };
  }
}
