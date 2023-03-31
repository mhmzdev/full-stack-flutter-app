part of 'edit_profile.dart';

class _MediaListener extends StatelessWidget {
  const _MediaListener();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);

    return BlocListener<MediaCubit, MediaState>(
      listener: (context, state) {
        if (state is UploadCoverSuccess || state is UploadDPSuccess) {
          final url = state.url ?? '';

          if (state.pictureType == PictureType.dp) {
            authCubit.uploadProfilePhoto(url);
          } else if (state.pictureType == PictureType.cover) {
            authCubit.uploadCoverPhoto(url);
          }
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
