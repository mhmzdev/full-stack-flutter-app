part of 'splash.dart';

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: AuthFetchState.match,
      listener: (context, state) async {
        if (state.fetch is AuthFetchSuccess) {
          final navigator = Navigator.of(context);

          if (state.user != null) {
            PostCubit.c(context).fetchAll();
            PostCubit.c(context).initUid();
            CommentCubit.c(context).fetchAll();
            CommentCubit.c(context).initUid();
            StoryCubit.c(context).fetchAll();
            StoryCubit.c(context).initUid();
            if (firebaseAuth.currentUser == null) {
              await FirebaseAuth.instance.signInAnonymously();
            }

            if (AppRoutes.splash.sameRoute()) {
              navigator.pushNamed(AppRoutes.home);
            }
          } else {
            AppRoutes.welcome.push(context);
          }
        } else if (state.fetch is AuthFetchFailed) {
          final msg = state.fetch.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
