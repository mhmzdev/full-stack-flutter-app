import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/design/avatar/avatar.dart';
import 'package:client/ui/widgets/design/buttons/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'package:timeago/timeago.dart' as timeago;

part 'data/_actions.dart';

part 'models/_action_model.dart';

part 'widgets/_actions.dart';
part 'widgets/_header.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final authCubit = AuthCubit.c(context, true);
    final users = authCubit.state.users ?? [];

    final uid = post.uid;
    final user = users.firstWhere(
      (element) => element.id == uid,
    );

    return Container(
      height: 200.un(),
      decoration: BoxDecoration(
        color: AppTheme.greyDark,
        borderRadius: 12.radius(),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Space.y.t20,
              _Header(user: user),
              Space.y.t30,
              Expanded(
                child: ClipRRect(
                  borderRadius: 12.radius(),
                  child: CachedNetworkImage(
                    imageUrl: post.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          _Actions(
            post: post,
          ),
        ],
      ),
    );
  }
}
