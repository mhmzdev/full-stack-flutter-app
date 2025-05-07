part of 'cubit.dart';

class _MediaProvider {
  static Future<String> uploadMedia(
    User profile,
    PictureType type, {
    File? file,
  }) async {
    try {
      // storage
      final storage = FirebaseStorage.instance;

      String path, url = '';

      switch (type) {
        case PictureType.dp:
          path = profile.imageURL;
          break;
        case PictureType.cover:
          path = profile.coverURL;
          break;
        case PictureType.post:
          path = 'users/${profile.id}/posts';
          break;
        case PictureType.story:
          path = 'users/${profile.id}/stories';
          break;
      }

      if (file != null) {
        // in case of DP or cover, if image is already there
        // delete the one on storage, and replace it with new one
        if ((type == PictureType.dp || type == PictureType.cover) &&
            path.isNotEmpty) {
          await storage.refFromURL(path).delete();
        }

        // set path to a base `users/id` to re-upload dp or cover
        if (type == PictureType.dp || type == PictureType.cover) {
          path = 'users/${profile.id}';
        }

        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        path = '$path/$fileName';

        // if image size > 3 Mbs
        // 3,000,000 bytes == 3 megabytes
        final size = await file.length();
        if (size > 3000000) {
          throw Exception(
            'File size cannot be more than 3 MBs. Reduce the size and try again!',
          );
        }

        final ref = storage.ref(path);
        final task = await ref.putFile(file);
        url = await task.ref.getDownloadURL();
      }
      // if file is null, it means the function is REMOVING image
      // delete image path from storage and return empty URL
      // only for DP and Cover case
      else if ((type == PictureType.dp || type == PictureType.cover) &&
          file == null) {
        storage.ref(path).delete();
        url = path = '';
      }

      return url;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
