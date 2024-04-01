part of 'profile.dart';

class _AuthListener extends StatelessWidget {
  const _AuthListener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthLogoutState.match,
      listener: (context, state) {
        if (state.logout is AuthLogoutSuccess) {
          PostCubit.c(context).resetUid();
          StoryCubit.c(context).resetUid();
          CommentCubit.c(context).resetUid();

          AppRoutes.login.pushReplace(context);

          SnackBars.success(
            context,
            'You have been logged out successfully! See you soon again :)',
            title: 'Logout',
          );
        }

        if (state.logout is AuthLogoutFailed) {
          final msg = state.logout.message!.split(': ').last;

          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.logout is AuthLogoutLoading;

        return FullScreenLoader(loading: loading);
      },
    );
  }
}
