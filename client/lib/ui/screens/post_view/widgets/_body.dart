part of '../post_view.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final currentUser = authCubit.state.user!;
    final screenState = _ScreenState.s(context, true);
    final postCubit = PostCubit.c(context, true);
    final post = postCubit.state.posts!
        .firstWhere((element) => element.id == screenState.post.id);

    final user = authCubit.state.users!.firstWhere((usr) => usr.id == post.uid);
    final isOwner = currentUser.id == post.uid;

    return Screen(
      keyboardHandler: true,
      overlayBuilders: const [_DeleteListener()],
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.v.t25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(
                user: user,
                post: post,
                isOwner: isOwner,
              ),
              Space.y.t30,
              SizedBox(
                width: double.infinity,
                height: 200.un(),
                child: ClipRRect(
                  borderRadius: 8.radius(),
                  child: CachedNetworkImage(
                    imageUrl: post.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Space.y.t30,
              Padding(
                padding: Space.h.t25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: actions(context, post).map((e) {
                        return GestureDetector(
                          onTap: e.onTap,
                          child: Padding(
                            padding: Space.r.t20,
                            child: e.icon,
                          ),
                        );
                      }).toList(),
                    ),
                    Space.y.t20,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: AppText.s1,
                            children: [
                              TextSpan(text: post.likes.length.toString()),
                              TextSpan(
                                text: ' Likes',
                                style: AppText.s1 + AppTheme.grey,
                              ),
                            ],
                          ),
                        ),
                        Space.x.t25,
                        RichText(
                          text: TextSpan(
                            style: AppText.s1,
                            children: [
                              TextSpan(text: post.comments.length.toString()),
                              TextSpan(
                                text: ' Comments',
                                style: AppText.s1 + AppTheme.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Space.y.t10,
                    if (post.caption.isNotEmpty) ...[
                      Text(post.caption),
                      Space.y.t15,
                    ],
                    Text(
                      timeago.format(post.createdAt),
                      style: AppText.s1 + AppTheme.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
