part of '../configs.dart';

extension SuperNum on num {
  double un() => AppUnit.un(this);
  double sp() => AppUnit.sp(this);
  double font() => AppUnit.font(this);
}
