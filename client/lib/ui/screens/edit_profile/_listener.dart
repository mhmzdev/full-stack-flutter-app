part of 'edit_profile.dart';

class _Listener extends StatelessWidget {
  const _Listener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthUpdateState.match,
      listener: (context, state) {
        if (state.update is AuthUpdateSuccess) {
          AuthCubit.c(context).fetchAll();
          ''.pop(context);
          SnackBars.success(
            context,
            'Congratulations! Your profile has been updated successfully.',
          );
        }

        if (state.update is AuthUpdateFailed) {
          final msg = state.update.message!.split(': ').last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state.update is AuthUpdateLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
