part of '../edit_profile.dart';

class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final user = authCubit.state.user!;
    final media = MediaProvider.state(context, true);

    return Stack(
      alignment: Alignment.center,
      children: [
        Avatar(
          user: user,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: BlocConsumer<AuthCubit, AuthState>(
            listenWhen: DPUploadState.match,
            listener: (context, state) {
              if (state.dp is DPUploadSuccess) {
                media.reset();
              }
            },
            builder: (context, state) {
              return AppIconButton(
                color: AppTheme.primary,
                icon: state.dp is DPUploadLoading
                    ? SizedBox(
                        height: 10.un(),
                        width: 10.un(),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : const Icon(
                        Icons.edit,
                      ),
                onTap: () async {
                  if (state.dp is DPUploadLoading) return;

                  final hasProfile = user.imageURL.isNotEmpty;
                  final value = await showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (_) {
                      return ListenableProvider.value(
                        value: _ScreenState(),
                        builder: (context, child) {
                          return UploadMediaModal(
                            label: 'Profile photo',
                            hasRemoval: hasProfile,
                          );
                        },
                      );
                    },
                  );
                  if (value != null && media.xFile != null) {
                    final file = File(media.xFile!.path);
                    authCubit.uploadProfilePhoto(file);
                    return;
                  }

                  if (value is String && value.toString() == 'remove') {
                    authCubit.uploadProfilePhoto(null);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
