part of '../create_story.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final user = authCubit.state.user!;
    final media = MediaProvider.state(context, true);

    final mediaCubit = MediaCubit.cubit(context);

    return Screen(
      keyboardHandler: true,
      overlayBuilders: const [_MediaListener(), _StoryListener()],
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Space.x.t15,
                  Text(
                    'Create Story',
                    style: AppText.b1,
                  )
                ],
              ),
              Space.y.t60,
              Avatar(
                user: user,
                type: AvatarType.detailed,
              ),
              Space.y.t60,
              Center(
                child: GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => UploadMediaModal(
                        label: 'Create story',
                        hasRemoval: media.xFile != null,
                      ),
                    );
                  },
                  child: media.xFile != null
                      ? Container(
                          height: 200.un(),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: 12.radius(),
                            image: DecorationImage(
                              image: FileImage(
                                File(media.xFile!.path),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          strokeWidth: 2,
                          dashPattern: const [10],
                          color: AppTheme.grey,
                          child: SizedBox(
                            height: 200.un(),
                            width: double.infinity,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Iconsax.gallery_add,
                                    color: AppTheme.grey,
                                    size: 20.un(),
                                  ),
                                  Space.y.t20,
                                  Text(
                                    'Add Photo/Video',
                                    style: AppText.b3 + AppTheme.grey,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              Space.y.t60,
              AppButton(
                label: 'POST',
                state: media.xFile == null
                    ? AppButtonState.disabled
                    : AppButtonState.plain,
                onPressed: () {
                  if (media.xFile == null) return;

                  final file = File(media.xFile!.path);
                  mediaCubit.uploadMedia(user, file, PictureType.story);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
