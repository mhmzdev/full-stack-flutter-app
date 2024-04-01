part of 'login.dart';

class _AuthListener extends StatelessWidget {
  const _AuthListener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthLoginState.match,
      listener: (context, state) async {
        if (state.login is AuthLoginSuccess) {
          PostCubit.c(context).fetchAll();
          PostCubit.c(context).initUid();
          StoryCubit.c(context).fetchAll();
          StoryCubit.c(context).initUid();
          CommentCubit.c(context).fetchAll();
          CommentCubit.c(context).initUid();

          AuthCubit.c(context).fetchAll();

          await FirebaseAuth.instance.signInAnonymously();

          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            AppRoutes.home.pushReplace(context);
          });
        } else if (state.login is AuthLoginFailed) {
          final msg = state.login.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.login is AuthLoginLoading;

        return FullScreenLoader(loading: loading);
      },
    );
  }
}
