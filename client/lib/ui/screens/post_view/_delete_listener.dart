part of 'post_view.dart';

class _DeleteListener extends StatelessWidget {
  const _DeleteListener();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final uid = AppCache.uid!;

    return BlocConsumer<PostCubit, PostState>(
      listenWhen: PostDeleteState.match,
      listener: (context, state) {
        if (state.delete is PostDeleteSuccess) {
          authCubit.fetch(uid);
          ''.pop(context);
        } else if (state.delete is PostDeleteFailed) {
          final msg = state.delete.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.delete is PostDeleteLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
