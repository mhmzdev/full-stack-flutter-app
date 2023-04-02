part of 'create_post.dart';

class _EditListener extends StatelessWidget {
  const _EditListener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listenWhen: PostEditState.match,
      listener: (context, state) {
        if (state.edit is PostEditSuccess) {
          ''.pop(context);
        } else if (state.edit is PostEditFailed) {
          final msg = state.edit.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.edit is PostEditLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
