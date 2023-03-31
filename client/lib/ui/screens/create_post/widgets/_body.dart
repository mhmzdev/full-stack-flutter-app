part of '../create_post.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final user = authCubit.state.user!;
    final media = MediaProvider.state(context, true);
    final mediaCubit = MediaCubit.cubit(context);

    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      overlayBuilders: const [_MediaListener(), _PostListener()],
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Space.x.t15,
                  Text(
                    'Create Post',
                    style: AppText.b1,
                  )
                ],
              ),
              Space.y.t60,
              Avatar(
                user: user,
                type: AvatarType.detailed,
              ),
              Space.y.t30,
              const AppMultilineInputField(
                name: _FormKeys.caption,
                hint: 'Start typing here...',
                maxLines: 10,
              ),
              Space.y.t60,
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (_) => UploadMediaModal(
                          label: 'Create post',
                          hasRemoval: media.xFile != null,
                        ),
                      );
                    },
                    child: media.xFile != null
                        ? Container(
                            height: 65.un(),
                            width: 50.un(),
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
                              height: 65.un(),
                              width: 50.un(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomPaint(
                                    painter: const GalleryIconPainter(),
                                    size: GalleryIconPainter.s(
                                      15.un(),
                                    ),
                                  ),
                                  Space.y.t20,
                                  Text(
                                    'Add Photo',
                                    style: AppText.b3 + AppTheme.grey,
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              Space.y.t60,
              AppButton(
                label: 'POST',
                onPressed: () {
                  if (media.xFile == null &&
                      screenState
                              .formKey.currentState!.value[_FormKeys.caption] ==
                          null) return;
                          
                  FocusScope.of(context).unfocus();

                  final file = File(media.xFile!.path);
                  mediaCubit.uploadMedia(user, file, PictureType.post);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
