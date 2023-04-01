part of '../post_card.dart';

class ActionModel {
  final Widget icon;
  final void Function() onTap;
  ActionModel({
    required this.icon,
    required this.onTap,
  });
}
