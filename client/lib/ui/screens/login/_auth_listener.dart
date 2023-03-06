part of 'login.dart';

class _AuthListener extends StatelessWidget {
  const _AuthListener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthLoginState.match,
      listener: (context, state) {
        if (state.login is AuthLoginSuccess) {
          AppRoutes.home.pushReplace(context);
        }

        if (state.login is AuthLoginFailed) {
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
