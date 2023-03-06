part of 'register.dart';

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthRegisterState.match,
      listener: (context, state) {
        if (state.register is AuthRegisterSuccess) {
          ''.pop(context);
          SnackBars.success(
            context,
            'Your account has been created successfully! Please login to continue.',
          );
        }

        if (state.register is AuthRegisterFailed) {
          final msg = state.register.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.register is AuthRegisterLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
