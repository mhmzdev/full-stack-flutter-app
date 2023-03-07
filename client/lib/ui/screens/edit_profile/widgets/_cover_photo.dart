part of '../edit_profile.dart';

class _CoverPhoto extends StatelessWidget {
  const _CoverPhoto();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final user = authCubit.state.user!;
    final media = MediaProvider.state(context, true);

    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: CoverUploadState.match,
      listener: (context, state) {
        if (state.cover is CoverUploadSuccess) {
          media.reset();
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            if (state.cover is CoverUploadLoading) return;

            final hasCover = user.imageURL.isNotEmpty;
            final value = await showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (_) {
                return ListenableProvider.value(
                  value: _ScreenState(),
                  builder: (context, child) {
                    return UploadMediaModal(
                      label: 'Cover photo',
                      hasRemoval: hasCover,
                    );
                  },
                );
              },
            );

            if (value != null && media.xFile != null) {
              final file = File(media.xFile!.path);
              authCubit.uploadCoverPhoto(file);
              return;
            }

            authCubit.uploadCoverPhoto(null);
          },
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            strokeWidth: 2,
            dashPattern: const [10],
            color: AppTheme.grey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Space.y.t60,
                  state.cover is CoverUploadLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : CustomPaint(
                          painter: const GalleryIconPainter(),
                          size: GalleryIconPainter.s(
                            15.un(),
                          ),
                        ),
                  Space.y.t20,
                  Text(
                    'Upload cover photo',
                    style: AppText.b3 + AppTheme.grey,
                  ),
                  Space.y.t60,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
