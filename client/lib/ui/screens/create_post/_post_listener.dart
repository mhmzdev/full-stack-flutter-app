part of 'create_post.dart';

class _PostListener extends StatelessWidget {
  const _PostListener();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);
    final media = MediaProvider.state(context);
    final authCubit = AuthCubit.c(context, true);

    final uid = AppCache.uid!;

    return BlocConsumer<PostCubit, PostState>(
      listenWhen: PostCreateState.match,
      listener: (context, state) {
        if (state.create is PostCreateSuccess) {
          authCubit.fetch(uid);
          media.reset();

          screenState.source.pushReplace(context);
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
