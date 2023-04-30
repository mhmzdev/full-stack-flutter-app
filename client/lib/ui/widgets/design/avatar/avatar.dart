import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/configs/configs.dart';
import 'package:client/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

part 'variants/_def.dart';
part 'variants/_detailed.dart';

enum AvatarType {
  def,
  detailed,
}

class Avatar extends StatelessWidget {
  final AvatarType type;
  final User user;
  final double? size;
  final bool showBorder;
  const Avatar({
    super.key,
    required this.user,
    this.size,
    this.showBorder = true,
    this.type = AvatarType.def,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    if (type == AvatarType.detailed) {
      return _Detailed(
        user: user,
        showBorder: showBorder,
      );
    }

    return _Def(
      user: user,
      size: size,
      showBorder: showBorder,
    );
  }
}
