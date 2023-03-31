part of 'cubit.dart';

class _MediaRepository {
  Future<String> uploadMedia(
    User profile,
    File? file,
    PictureType type,
  ) =>
      _MediaProvider.uploadMedia(
        profile,
        type,
        file: file,
      );
}
