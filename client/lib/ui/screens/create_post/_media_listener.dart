part of 'create_post.dart';

class _MediaListener extends StatelessWidget {
  const _MediaListener();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final user = AuthCubit.c(context).state.user!;
    final media = MediaProvider.state(context, true);
    final postCubit = PostCubit.c(context);

    return BlocConsumer<MediaCubit, MediaState>(
      listener: (context, state) {
        if (state is UploadMediaSuccess) {
          final form = screenState.formKey.currentState!;
          form.save();

          final data = form.value;
          final caption = data[_FormKeys.caption] ?? '';
          final uid = user.id;

          final ext = media.xFile!.path.split('.').last;
          final images = ['jpeg', 'jpg', 'png'];
          final videos = ['mp4', 'mov', 'avi'];

          final hasImage = images.contains(ext);
          final hasVideo = videos.contains(ext);

          postCubit.createPost(
            uid,
            caption,
            hasImage: hasImage,
            hasVideo: hasVideo,
            imageURL: hasImage ? state.url : null,
            videoURL: hasVideo ? state.url : null,
          );
        } else if (state is UploadMediaFailed) {
          final msg = state.message!.split(": ").last;
          SnackBars.failure(context, msg);
        }
      },
      builder: (context, state) {
        final loading = state is UploadMediaLoading;

        return FullScreenLoader(
          loading: loading,
        );
      },
    );
  }
}
