part of 'comment.dart';

class _DeleteListener extends StatelessWidget {
  const _DeleteListener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentCubit, CommentState>(
      listenWhen: CommentDeleteState.match,
      listener: (context, state) {
        if (state.delete is CommentDeleteSuccess) {
          PostCubit.c(context).fetchAll();
          SnackBars.success(
              context, 'Comment has been deleted successfully from the post!');
        } else if (state.delete is CommentDeleteFailed) {
          SnackBars.failure(
              context, 'Failed to delete comment, please try again later!');
        }
      },
      builder: (context, state) {
        final loading = state.delete is CommentDeleteLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
