part of '../configs.dart';

extension SuperString on String {
  Future<void> push(BuildContext context, {Object? arguments}) =>
      Navigator.pushNamed(
        context,
        this,
        arguments: arguments,
      );

  Future<void> pushReplace(BuildContext context, {Object? arguments}) =>
      Navigator.pushReplacementNamed(
        context,
        this,
        arguments: arguments,
      );

  Future<void> pop<T extends Object?>(BuildContext context,
          [T? result]) async =>
      Navigator.pop(context, result);

  Future<void> popUntil(BuildContext context) async =>
      Navigator.popUntil(context, ModalRoute.withName(this));

  bool sameRoute() =>
      NavigationHistoryObserver().history.isNotEmpty &&
      NavigationHistoryObserver().top?.settings.name == this;
}
