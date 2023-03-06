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
  const Avatar({
    super.key,
    required this.user,
    this.type = AvatarType.def,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    if (type == AvatarType.detailed) {
      return _Detailed(
        user: user,
      );
    }

    return _Def(
      user: user,
    );
  }
}
