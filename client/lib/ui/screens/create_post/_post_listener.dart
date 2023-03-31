part of 'create_post.dart';

class _PostListener extends StatelessWidget {
  const _PostListener();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final postCubit = PostCubit.c(context);

    final uid = Cache.uid!;

    return BlocConsumer<PostCubit, PostState>(
      listenWhen: PostCreateState.match,
      listener: (context, state) {
        if (state.create is PostCreateSuccess) {
          postCubit.fetchAll();
          authCubit.fetch(uid);
          ''.pop(context);
          ''.pop(context);
        } else if (state.create is PostCreateFailed) {
          final msg = state.create.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.create is PostCreateLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
