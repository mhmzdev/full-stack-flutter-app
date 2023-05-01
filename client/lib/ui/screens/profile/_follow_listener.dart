part of 'profile.dart';

class _FollowListener extends StatelessWidget {
  const _FollowListener();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final uid = authCubit.state.user!.id;

    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: FollowState.match,
      listener: (context, state) {
        if (state.follow is FollowSuccess) {
          authCubit.fetch(uid);
          authCubit.fetchAll();
        } else if (state.follow is FollowFailed) {
          final msg = state.follow.message!.split(': ').last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.follow is FollowLoading;
        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
