part of 'edit_profile.dart';

class _DPListener extends StatelessWidget {
  const _DPListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: DPUploadState.match,
      listener: (context, state) {
        if (state.dp is DPUploadSuccess) {
          AuthCubit.c(context).fetchAll();
          SnackBars.success(
            context,
            "Profile picture has been updated successfully!",
          );
        }

        if (state.dp is DPUploadFailed) {
          final msg = state.dp.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
