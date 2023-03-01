import 'dart:ui';

import 'package:client/configs/configs.dart';
import 'package:client/static/profiles.dart';
import 'package:client/ui/painter/icons/comment.dart';
import 'package:client/ui/painter/icons/heart_outline.dart';
import 'package:client/ui/painter/icons/more.dart';
import 'package:client/ui/painter/icons/send.dart';
import 'package:client/ui/widgets/design/buttons/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

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

    final uid = post.uid;
    final user = profiles.firstWhere(
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: 15.radius(),
                    image: DecorationImage(
                      image: AssetImage(
                        post.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
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
