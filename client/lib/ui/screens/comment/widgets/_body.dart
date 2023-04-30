part of '../comment.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  String? comment;

  @override
  Widget build(BuildContext context) {
    final commentCubit = CommentCubit.c(context);
    final postCubit = PostCubit.c(context, true);
    final screenState = _ScreenState.s(context, true);

    final currentPost = postCubit.state.posts!
        .firstWhere((element) => element.id == screenState.post.id);

    final auth = AuthCubit.c(context, true);
    final user = auth.state.user!;

    final postedUser = auth.state.users!.firstWhere(
      (element) => element.id == screenState.post.uid,
    );

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      overlayBuilders: const [_Listener(), _DeleteListener()],
      child: SafeArea(
        child: Padding(
          padding: Space.a.t25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Space.x.t20,
                  Text(
                    'Comments',
                    style: AppText.b1,
                  )
                ],
              ),
              Space.y.t30,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Avatar(
                    user: postedUser,
                    size: 20.un(),
                  ),
                  Space.x.t30,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          screenState.post.caption,
                          style: AppText.b3,
                        ),
                        Space.y.t10,
                        Text(
                          timeago.format(screenState.post.createdAt),
                          style: AppText.s2 + AppTheme.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 15.un(),
              ),
              Expanded(
                child: BlocConsumer<CommentCubit, CommentState>(
                  listenWhen: CommentFetchAllState.match,
                  listener: (context, state) {
                    if (state.fetchAll is CommentFetchAllFailed) {
                      final msg = state.fetchAll.message!.split(": ").last;
                      SnackBars.failure(context, msg);
                    }
                  },
                  builder: (context, state) {
                    if (state.fetchAll is CommentFetchAllLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.fetchAll is CommentFetchAllSuccess) {
                      final comments = state.comments
                              ?.where((element) =>
                                  currentPost.comments.contains(element.id))
                              .toList() ??
                          [];

                      return ListView.separated(
                        itemCount: comments.length,
                        separatorBuilder: (context, index) => Space.y.t30,
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          final commentedUser = auth.state.users!.firstWhere(
                            (element) => element.id == comment.uid,
                          );

                          final isOwner = user.id == comment.uid;

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Avatar(
                                user: commentedUser,
                                size: 15.un(),
                                showBorder: false,
                              ),
                              Space.x.t25,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      comment.content,
                                      style: AppText.s1,
                                    ),
                                    Space.y.t10,
                                    Text(
                                      timeago.format(comment.createdAt),
                                      style: AppText.s2 + AppTheme.grey,
                                    )
                                  ],
                                ),
                              ),
                              if (isOwner) ...[
                                Space.x.t20,
                                AppIconButton(
                                  icon: const Icon(Icons.delete),
                                  onTap: () => commentCubit.delete(
                                    comment.id,
                                    currentPost.id,
                                  ),
                                )
                              ],
                            ],
                          );
                        },
                      );
                    }

                    return Center(
                      child: Text(
                        'Something went wrong',
                        style: AppText.b3 + AppTheme.danger,
                      ),
                    );
                  },
                ),
              ),
              AppInputField(
                name: _FormKeys.comment,
                textCapitalization: TextCapitalization.sentences,
                hint: 'Write something here...',
                onChanged: (value) {
                  setState(() {
                    comment = value;
                  });
                },
                suffixIcon: TextButton(
                  onPressed: (comment == null || comment!.isEmpty)
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();

                          postCubit.comment(
                            screenState.post.id,
                            user.id,
                            comment!,
                          );
                        },
                  child: Text(
                    'Post',
                    style: AppText.b2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
