part of '../forgot.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.email: "hamza.6.shakeel@gmail.com",
    };
  }
}
