part of 'edit_profile.dart';

class _CoverListener extends StatelessWidget {
  const _CoverListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: CoverUploadState.match,
      listener: (context, state) {
        if (state.cover is CoverUploadSuccess) {
          AuthCubit.c(context).fetchAll();
          SnackBars.success(
            context,
            "Cover photo has been updated successfully!",
          );
        }

        if (state.cover is CoverUploadFailed) {
          final msg = state.cover.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
