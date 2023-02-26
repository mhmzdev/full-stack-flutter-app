part of '../configs.dart';

extension SuperInt on int {
  double un() => AppUnit.un(this);
  double sp() => AppUnit.sp(this);
  double font() => AppUnit.font(this);

  BorderRadius radius() => BorderRadius.circular(toDouble());
}
