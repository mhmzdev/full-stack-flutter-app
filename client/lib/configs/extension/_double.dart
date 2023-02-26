part of '../configs.dart';

extension SuperDouble on double {
  double un() => AppUnit.un(this);
  double sp() => AppUnit.sp(this);
  double font() => AppUnit.font(this);

  BorderRadius radius() => BorderRadius.circular(this);
}
