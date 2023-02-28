part of '../register.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.firstName: "Hamza",
      _FormKeys.lastName: "Shakeel",
      _FormKeys.username: "mhmzdev",
      _FormKeys.email: "hamza.6.shakeel@gmail.com",
      _FormKeys.password: "hamza123",
    };
  }
}
