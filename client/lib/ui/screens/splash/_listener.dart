part of 'splash.dart';

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: AuthFetchState.match,
      listener: (context, state) {
        if (state.fetch is AuthFetchSuccess) {
          if (state.user != null) {
            PostCubit.c(context).fetchAll();
            AppRoutes.home.pushReplace(context);
            return;
          }

          AppRoutes.welcome.push(context);
        }

        if (state.fetch is AuthFetchFailed) {
          final msg = state.fetch.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
