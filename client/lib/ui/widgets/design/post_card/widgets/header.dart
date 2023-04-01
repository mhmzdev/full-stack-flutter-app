import 'package:client/configs/configs.dart';
import 'package:client/cubits/auth/cubit.dart';
import 'package:client/cubits/post/cubit.dart';
import 'package:client/ui/painter/base.dart';
import 'package:client/ui/widgets/design/avatar/avatar.dart';
import 'package:client/ui/widgets/design/buttons/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PostHeader extends StatelessWidget {
  final User user;
  final Post post;
  final bool hasPadding;
  const PostHeader({
    super.key,
    this.hasPadding = true,
    required this.user,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context, true);
    final currentUser = authCubit.state.user!;
    final isOwner = currentUser.id == post.uid;

    final postCubit = PostCubit.c(context);

    return Padding(
      padding: hasPadding ? Space.h.t20 : Space.z,
      child: Row(
        children: [
          Avatar(
            user: user,
            type: AvatarType.detailed,
          ),
          Space.xm,
          if (isOwner)
            PopupMenuButton(
              child: AppIconButton(
                icon: CustomPaint(
                  painter: const MoreIconPainter(),
                  size: MoreIconPainter.s(10.un()),
                ),
                onTap: null,
              ),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    child: Text(
                      "Edit",
                      style: AppText.b2,
                    ),
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Delete",
                      style: AppText.b2 + AppTheme.danger,
                    ),
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        postCubit.deletePost(post.id); // listener to HOME //
                      });
                    },
                  ),
                ];
              },
            ),
        ],
      ),
    );
  }
}
