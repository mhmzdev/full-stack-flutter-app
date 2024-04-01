part of 'create_story.dart';

class _StoryListener extends StatelessWidget {
  const _StoryListener();

  @override
  Widget build(BuildContext context) {
    final media = MediaProvider.state(context);
    final authCubit = AuthCubit.c(context);

    final uid = AppCache.uid!;

    return BlocConsumer<StoryCubit, StoryState>(
      listenWhen: StoryCreateState.match,
      listener: (context, state) {
        if (state.create is StoryCreateSuccess) {
          authCubit.fetch(uid);
          media.reset();

          ''.pop(context);
        } else if (state.create is StoryCreateFailed) {
          final msg = state.create.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.create is StoryCreateLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
