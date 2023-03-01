part of '../create_post.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.caption:
          "A very unique post here, which is being used for the testing purposes. Afterwards it will be removed :)",
    };
  }
}
