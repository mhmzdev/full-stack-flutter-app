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
        }

        if (state.register is AuthRegisterFailed) {}
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
