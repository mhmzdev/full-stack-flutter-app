part of '../edit_profile.dart';

class _CoverPhoto extends StatelessWidget {
  const _CoverPhoto();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context, true);
    final user = authCubit.state.user!;
    final media = MediaProvider.state(context, true);
    final mediaCubit = MediaCubit.cubit(context, true);

    final hasCoverPhoto = user.coverURL.isNotEmpty;

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
            if (state.cover is CoverUploadLoading ||
                mediaCubit.state is UploadCoverLoading) {
              return;
            }

            final hasCover = user.coverURL.isNotEmpty;
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
              mediaCubit.uploadCover(user, file);
              return;
            }
            if (value is String && value.toString() == 'remove') {
              authCubit.uploadCoverPhoto('');
              mediaCubit.removeMedia(user.coverURL);
            }
          },
          child:
              hasCoverPhoto &&
                      state.cover is! CoverUploadLoading &&
                      mediaCubit.state is! UploadCoverLoading
                  ? Container(
                    height: 80.un(),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: 12.radius(),
                      border: Border.all(
                        color: AppTheme.primary,
                        width: 1.un(),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: 12.radius(),
                            child: CachedNetworkImage(
                              imageUrl: user.coverURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: SizedBox(
                            height: 20.un(),
                            child: const AppIconButton(
                              color: AppTheme.primary,
                              icon: Icon(Iconsax.gallery_add),
                              onTap: null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  : DottedBorder(
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
                          Space.y.t100,
                          state.cover is CoverUploadLoading ||
                                  mediaCubit.state is UploadCoverLoading
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : CustomPaint(
                                painter: const GalleryIconPainter(),
                                size: GalleryIconPainter.s(15.un()),
                              ),
                          Space.y.t20,
                          Text(
                            'Upload cover photo',
                            style: AppText.b3 + AppTheme.grey,
                          ),
                          Space.y.t100,
                        ],
                      ),
                    ),
                  ),
        );
      },
    );
  }
}
