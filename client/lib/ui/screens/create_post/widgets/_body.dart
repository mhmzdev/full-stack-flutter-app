part of '../create_post.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final user = authCubit.state.user!;
    final media = MediaProvider.state(context, true);
    final mediaCubit = MediaCubit.cubit(context);
    final postCubit = PostCubit.c(context);

    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(screenState.post),
      overlayBuilders: const [
        _MediaListener(),
        _PostListener(),
        _EditListener()
      ],
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
                    screenState.post != null ? 'Edit Post' : 'Create Post',
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
              AppMultilineInputField(
                name: _FormKeys.caption,
                hint: 'Start typing here...',
                maxLines: 10,
                autoFocus: screenState.post != null,
              ),
              Space.y.t60,
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (screenState.post != null) return;

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
                        : screenState.post != null
                            ? SizedBox(
                                height: 65.un(),
                                width: 50.un(),
                                child: ClipRRect(
                                  borderRadius: 12.radius(),
                                  child: CachedNetworkImage(
                                    imageUrl: screenState.post!.imageUrl,
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
                                      Icon(
                                        Iconsax.gallery_add,
                                        color: AppTheme.grey,
                                        size: 12.un(),
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
                  screenState.formKey.currentState!.save();

                  final caption = screenState
                      .formKey.currentState!.value[_FormKeys.caption];

                  if (media.xFile == null && caption == null) return;

                  FocusScope.of(context).unfocus();

                  if (screenState.post != null) {
                    postCubit.editPost(screenState.post!.id, caption);
                    return;
                  }

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
