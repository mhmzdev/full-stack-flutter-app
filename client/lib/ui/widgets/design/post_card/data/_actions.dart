part of '../post_card.dart';

List<ActionModel> actions(BuildContext context, Post post) {
  final postCubit = PostCubit.c(context, true);
  final auth = AuthCubit.c(context);
  final uid = auth.state.user!.id;
  final isLiked = post.likes.contains(uid);

  return [
    ActionModel(
      icon: CustomPaint(
        painter: isLiked
            ? const HeartFilledIconPainter(color: AppTheme.danger)
            : const HeartOutlineIconPainter(color: Colors.white),
        size: HeartOutlineIconPainter.s(12.un()),
      ),
      onTap: () => postCubit.like(post.id, uid),
    ),
    ActionModel(
      icon: CustomPaint(
        painter: const CommentIconPainter(),
        size: CommentIconPainter.s(12.un()),
      ),
      onTap: () async {
        AppRoutes.comment.push(
          context,
          arguments: {'post': post},
        );
      },
    ),
    ActionModel(
      icon: CustomPaint(
        painter: const SendIconPainter(),
        size: SendIconPainter.s(12.un()),
      ),
      onTap: () {},
    ),
  ];
}
