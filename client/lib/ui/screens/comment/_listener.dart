part of 'comment.dart';

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);

    return BlocConsumer<PostCubit, PostState>(
      listenWhen: PostCommentState.match,
      listener: (context, state) {
        if (state.comment is PostCommentFailed) {
          final msg = state.comment.message!.split(': ').last;
          SnackBars.failure(context, msg);
        } else if (state.comment is PostCommentSuccess) {
          screenState.formKey.currentState!.reset();
          CommentCubit.c(context).fetchAll();
        }
      },
      builder: (context, state) {
        final loading = state.comment is PostCommentLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
