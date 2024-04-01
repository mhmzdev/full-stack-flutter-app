part of 'story_view.dart';

class _DeleteListener extends StatelessWidget {
  const _DeleteListener();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final uid = AppCache.uid!;
    final screenState = _ScreenState.s(context);
    final storyCubit = StoryCubit.c(context);

    return BlocConsumer<StoryCubit, StoryState>(
      listenWhen: StoryDeleteState.match,
      listener: (context, state) {
        if (state.delete is StoryDeleteSuccess) {
          authCubit.fetch(uid);
          storyCubit.fetchAll();
          screenState.cancelTimer();

          ''.pop(context);
        } else if (state.delete is StoryDeleteFailed) {
          final msg = state.delete.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.delete is StoryDeleteLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
